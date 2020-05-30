
unit LoginMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp, CompProd, PagItems, SiteProd, WebForm, MidItems;

type
  TLoginModule = class(TWebPageModule)
    LoginFormAdapter1: TLoginFormAdapter;
    AdapterPageProducer1: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdaptUserName: TAdapterUserNameField;
    AdaptPassword: TAdapterPasswordField;
    AdaptNextPage: TAdapterNextPageField;
    AdapterCommandGroup1: TAdapterCommandGroup;
    AdapterErrorList1: TAdapterErrorList;
    procedure LoginFormAdapter1Login(Sender: TObject; UserID: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function LoginModule: TLoginModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, ViewMailMod;

function LoginModule: TLoginModule;
begin
  Result := TLoginModule(WebContext.FindModuleClass(TLoginModule));
end;

procedure TLoginModule.LoginFormAdapter1Login(Sender: TObject;
  UserID: Variant);
begin
  // Try to log them in and verify the username/pass are correct
  with ViewMailModule do
  begin
    if popEmail.Connected then
    begin
      try
        popEmail.Disconnect;
      except
      end;
    end;
    if AdaptUserName.ActionValue <> nil then
      popEmail.UserId := AdaptUserName.ActionValue.Values[0]
    else
      raise Exception.Create('No user name passed from web page!');

    if AdaptPassword.ActionValue <> nil then
      popEmail.Password := AdaptPassword.ActionValue.Values[0]
    else
      raise Exception.Create('No password passed from web page!');

    // Try to connect, which will test the username and password
    // against the mail server
    try
      popEmail.Connect;                
    finally
      try
        popEmail.Disconnect;
      except
      end;
    end;
    // On a successful login, save the users information in a session.
    WebContext.Session.Values[cUserName] := popEmail.UserId;
    WebContext.Session.Values[cPassword] := popEmail.Password;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TLoginModule, TWebPageInfo.Create([{wpPublished} {wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
