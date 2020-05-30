
unit LoginPageMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, WebAdapt, WebComp, MidItems, WebForm;

type
  TLoginPageModule = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    LoginFormAdapter: TLoginFormAdapter;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterButtonGroup1: TAdapterCommandGroup;
    SimpleAdapter: TAdapter;
    AdapterField1: TAdapterField;
    AdapterField4: TAdapterField;
    AdapterField5: TAdapterField;
    AdapterField6: TAdapterField;
    sdf: TAdapterDefaultFields;
    btnLogin: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;
    FldUserName: TAdapterDisplayField;
    FldPassword: TAdapterDisplayField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function LoginPageModule: TLoginPageModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, MainPageMod;

resourcestring
  rLoginTitle = 'Login';

function LoginPageModule: TLoginPageModule;
begin
  Result := TLoginPageModule(WebContext.FindModuleClass(TLoginPageModule));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TLoginPageModule,
    TWebPageInfo.Create([{wpPublished} {, wpLoginRequired}],
    '.html', '', rLoginTitle), crOnDemand, caCache));
end.
