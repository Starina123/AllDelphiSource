
unit AddUserPageMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, MidItems, WebForm, WebAdapt, WebComp;

type
  TAddUserPageModule = class(TWebPageModule)
    Adapter: TAdapter;
    AddUser: TAdapterAction;
    Name: TAdapterField;
    Password: TAdapterField;
    PasswordVerify: TAdapterField;
    Messages: TAdapterField;
    UpdateUser: TAdapterAction;
    DeleteUser: TAdapterAction;
    trvlsAccessRights: TStringsValuesList;
    AccessRights: TAdapterField;
    UserListAdapter: TAdapter;
    UserName: TAdapterField;
    UserRights: TAdapterField;
    PageProducer1: TPageProducer;
    procedure AddUserExecute(Sender: TObject; Params: TStrings);
    procedure WebPageModuleCreate(Sender: TObject);
    procedure NameGetValue(Sender: TObject; var Value: Variant);
    procedure MessagesGetValue(Sender: TObject; var Value: Variant);
    procedure WebPageModuleActivate(Sender: TObject);
    procedure UpdateUserExecute(Sender: TObject; Params: TStrings);
    procedure DeleteUserExecute(Sender: TObject; Params: TStrings);
    procedure UserNameGetValue(Sender: TObject; var Value: Variant);
    procedure UserRightsGetValue(Sender: TObject; var Value: Variant);
    procedure UserListAdapterIterateRecords(Sender: TObject;
      Action: TIteratorMethod; var EOF: Boolean);

  private
    FLastUserName: string;
    FMessageValue: string;

    FCurrentIndex: Integer;
  public
    { Public declarations }
  end;

  function AddUserPageModule: TAddUserPageModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, AdaptReq, WebFact, Variants, MainPageMod, SiteComp, WebUsers;

resourcestring
  rBlankName = 'The name is blank.';
  rPassBlank = 'The password is blank.';
  rPassDontMatch = 'The passwords do not match.';
  rUserExists = 'The user %s already exists. Please choose another name.';
  rUserSuccessAdded = 'User %s successfully added.';
  rRootWarning = 'Warning: you are using the root account with the default password!';
  rUnknownUser = 'Unknown user to set password for.';
  rBlankNewPass = 'New password is blank.';
  rCantFindUser = 'The user %s can not be found to be set the password!';
  rUserUpdated = 'User %s successfully updated.';
  rCantFindUserToDelete = 'The user %s can not be found to be deleted!';
  rUserDeleted = 'User %s successfully deleted.';
  rAddUserTitle = 'Add/Modify Users';
  rAddUserDescript = 'Add, delete and modify users.';


function AddUserPageModule: TAddUserPageModule;
begin
  Result := TAddUserPageModule(WebContext.FindModuleClass(TAddUserPageModule));
end;

procedure TAddUserPageModule.AddUserExecute(Sender: TObject;
  Params: TStrings);
var
  Value: IActionFieldValue;
  StrName: string;
  StrPass: string;
  StrPassVerify: string;
  StrRights: string;
  DontAddUser: boolean;
  WebUser: TWebUserItem;
begin
  DontAddUser := False;
  try
    Value := Name.ActionValue;
    if Assigned(Value) then
      StrName := Value.Values[0];
    Value := Password.ActionValue;
    if Assigned(Value) then
      StrPass := Value.Values[0];
    Value := PasswordVerify.ActionValue;
    if Assigned(Value) then
      StrPassVerify := Value.Values[0];
    Value := AccessRights.ActionValue;
    if Assigned(Value) then
      StrRights := Value.Values[0]
    else
      StrRights := '';

    // Make sure the name isn't empty
    if Trim(StrName) = '' then
    begin

      Adapter.Errors.AddError(Exception.Create(rBlankName));
      DontAddUser := True;
    end;
    if StrPass = '' then
    begin
      Adapter.Errors.AddError(Exception.Create(rPassBlank));
      DontAddUser := True;
    end;
    if StrPass <> StrPassVerify then
    begin
      Adapter.Errors.AddError(Exception.Create(rPassDontMatch));
      DontAddUser := True;
    end;

    // Exit if an error happened above, after filling in what the
    // user already put in.
    if DontAddUser then
    begin
      FLastUserName := StrName; // Filled in with the NameGetValue event
      // Don't fill in the password for security reasons
      Exit;
    end;

    // Check to see if that user already exists
    WebUser := MainPageModule.PersistWebUserList.UserItems.FindUserName(StrName);
    if WebUser <> nil then
    begin
      Adapter.Errors.AddError(Exception.CreateFmt(rUserExists, [StrName]));
    end else
    begin
      // Add the user to the main page's user list
      WebUser := MainPageModule.PersistWebUserList.UserItems.Add as TWebUserItem;
      WebUser.UserName := StrName;
      WebUser.Password := StrPass;
      WebUser.AccessRights := StrRights;
      MainPageModule.SaveUserList;
      FMessageValue := Format(rUserSuccessAdded, [StrName]);
    end;
  except
    on E: Exception do
      Adapter.Errors.AddError(E);
  end;
end;

procedure TAddUserPageModule.WebPageModuleCreate(Sender: TObject);
begin
  FLastUserName := '';
  FMessageValue := '';
end;

procedure TAddUserPageModule.NameGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FLastUserName;
end;

procedure TAddUserPageModule.MessagesGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageValue;
end;

procedure TAddUserPageModule.WebPageModuleActivate(Sender: TObject);
var
  WebUserItem: TWebUserItem;
begin
  // Show a warning if they are running as "root" with the default password (root)
  with MainPageModule do
  begin
    if not VarIsEmpty(EndUserSessionAdapter.UserID) then
    begin
      WebUserItem := PersistWebUserList.UserItems.FindUserID(EndUserSessionAdapter.UserId);
      if WebUserItem <> nil then
        if (WebUserItem.UserName = 'root') and (WebUserItem.Password = 'root') then { do not localize }
          FMessageValue := rRootWarning;
    end;
  end;
end;

procedure TAddUserPageModule.UpdateUserExecute(Sender: TObject;
  Params: TStrings);
var
  Value: IActionFieldValue;
  StrName: string;
  StrPassword: string;
  StrRights: string;
  WebUser: TWebUserItem;
begin
  try
    Value := Name.ActionValue;
    if Assigned(Value) then
      StrName := Value.Values[0]
    else
      StrName := '';
      
    if StrName = '' then
      raise Exception.Create(rUnknownUser);

    Value := AccessRights.ActionValue;
    if Assigned(Value) then
      StrRights := Value.Values[0]
    else
      StrRights := '';

    Value := Password.ActionValue;
    if Assigned(Value) then
      StrPassword := Value.Values[0]
    else
      StrPassword := '';
                        
    WebUser := MainPageModule.PersistWebUserList.UserItems.FindUserName(StrName);
    if WebUser = nil then
      raise Exception.CreateFmt(rCantFindUser, [StrName]);
      
    if StrPassword <> '' then
      WebUser.Password := StrPassword;
    if StrRights <> '' then
      WebUser.AccessRights := StrRights;
      
    MainPageModule.SaveUserList;
    FMessageValue := Format(rUserUpdated, [StrName]);
  except
    on E: Exception do
      Adapter.Errors.AddError(E);
  end;
end;

procedure TAddUserPageModule.DeleteUserExecute(Sender: TObject;
  Params: TStrings);
var
  Value: IActionFieldValue;
  StrName: string;
  WebUser: TWebUserItem;
begin
  try
    StrName := '';
    Value := Name.ActionValue;
    if Assigned(Value) then
      StrName := Value.Values[0];

    WebUser := MainPageModule.PersistWebUserList.UserItems.FindUserName(StrName);
    if WebUser = nil then
      raise Exception.CreateFmt(rCantFindUserToDelete, [StrName]);
    MainPageModule.PersistWebUserList.UserItems.Delete(WebUser.Index);
    MainPageModule.SaveUserList;
    FMessageValue := Format(rUserDeleted, [StrName]);
  except
    on E: Exception do
      Adapter.Errors.AddError(E);
  end;
end;

procedure TAddUserPageModule.UserNameGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := MainPageModule.PersistWebUserList.Users[FCurrentIndex].UserName;
end;

procedure TAddUserPageModule.UserRightsGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := MainPageModule.PersistWebUserList.Users[FCurrentIndex].AccessRights;
end;

procedure TAddUserPageModule.UserListAdapterIterateRecords(Sender: TObject;
  Action: TIteratorMethod; var EOF: Boolean);
begin
  case Action of
    itStart, itEnd:
      FCurrentIndex := 0;
    itNext:
      Inc(FCurrentIndex);
  end;
  EOF := FCurrentIndex >= MainPageModule.PersistWebUserList.UserItems.Count;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TAddUserPageModule,
    TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html', '',
    rAddUserTitle, rAddUserDescript,
    'Administrator' {ViewAccess}), crOnDemand, caCache));
end.
