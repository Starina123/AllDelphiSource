unit MainPageMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebSess, WebDisp, WebAdapt, WebComp, WebUsers;

type
  TMainPageModule = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    EndUserSessionAdapter: TEndUserSessionAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    SessionsService: TSessionsService;
    PersistWebUserList: TWebUserList;
    RightsAdapter: TAdapter;
    Rights: TAdapterField;
    procedure WebAppPageModuleCreate(Sender: TObject);
    procedure WebAppPageModuleActivate(Sender: TObject);
    procedure WebAppPageModuleDeactivate(Sender: TObject);
    procedure RightsGetValue(Sender: TObject; var Value: Variant);
  private
    function GetUsersFileName: string;
    procedure LoadUserList;
  public
    procedure SaveUserList;
    function GetCurrentUserName: string;
  end;

  function MainPageModule: TMainPageModule;

const
  cMainPageModTitle = 'MainPageModule';
resourcestring
  rNotLoggedIn = 'You are not currently logged in. Please log back in.';

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, SiteComp;

var
  Lock: TMultiReadExclusiveWriteSynchronizer;

resourcestring
  rHomePageTitle = 'Home Page';
  rHomePageDescription = 'Welcome to this application';

function MainPageModule: TMainPageModule;
begin
  Result := TMainPageModule(WebContext.FindModuleClass(TMainPageModule));
end;

function TMainPageModule.GetUsersFileName: string;
begin
  Result := ExtractFilePath(GetModuleName(HInstance)) + 'users.binary'; 
end;

procedure TMainPageModule.SaveUserList;
begin
  Lock.BeginWrite;
  try
    PersistWebUserList.SaveToFile(GetUsersFileName)
  finally
    Lock.EndWrite;
  end;
end;

procedure TMainPageModule.WebAppPageModuleCreate(Sender: TObject);
begin
  // Up the emax connections (concurrent web modules)
  if WebRequestHandler <> nil then
    WebRequestHandler.MaxConnections := 100;
end;

procedure TMainPageModule.WebAppPageModuleActivate(Sender: TObject);
begin
  // Because multiple instances of a WebPageModule are possible,
  // I have to reload the PersistWebUserList in case another web module
  // changed it. A speed imporovement would be to check to see
  // if the timestamp of the 'users.binary' file has changed, and only
  // reload it then.
  LoadUserList;
end;

procedure TMainPageModule.LoadUserList;
begin
  // load up previous sessions and user information
  Lock.BeginRead;
  try
    try
      if FileExists(GetUsersFileName) then
        PersistWebUserList.LoadFromFile(GetUsersFileName)
    except
    end;
  finally
    Lock.EndRead;
  end;
end;

procedure TMainPageModule.WebAppPageModuleDeactivate(Sender: TObject);
begin
  SaveUserList;
end;

function TMainPageModule.GetCurrentUserName: string;
var
  WebUserItem: TWebUserItem;
begin
  Result := '';
  with MainPageModule do
  begin
    if not VarIsEmpty(EndUserSessionAdapter.UserID) then
    begin
      WebUserItem := PersistWebUserList.UserItems.FindUserID(EndUserSessionAdapter.UserId);
      if WebUserItem <> nil then
        Result := WebUserItem.UserName;
    end;
  end;
end;

procedure TMainPageModule.RightsGetValue(Sender: TObject;
  var Value: Variant);
var
  WebUserItem: TWebUserItem;
begin
  Value := '';
  if not VarIsEmpty(EndUserSessionAdapter.UserID) then
  begin
    WebUserItem := PersistWebUserList.UserItems.FindUserID(EndUserSessionAdapter.UserId);
    if WebUserItem <> nil then
      Value := WebUserItem.AccessRights;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(
      TWebAppPageModuleFactory.Create(TMainPageModule,
      TWebPageInfo.Create([wpPublished {, wpLoginRequired}],
      '.html', cMainPageModTitle,
      rHomePageTitle, rHomePageDescription),
      caCache));
  Lock := TMultiReadExclusiveWriteSynchronizer.Create;
finalization
  Lock.Free;
end.

