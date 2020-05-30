
unit LoginU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  MidItems, WebForm, WebAdapt, WebComp, CompProd, PagItems, SiteProd;

type
  TLogin = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    LoginFormAdapter1: TLoginFormAdapter;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterButtonGroup1: TAdapterCommandGroup;
    BtnLogin: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Login: TLogin;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function Login: TLogin;
begin
  Result := TLogin(WebContext.FindModuleClass(TLogin));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TLogin, TWebPageInfo.Create([{wpPublished} {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
