
unit LoginU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  XMLAdapterBuilder, WebAdapt, WebComp, XMLBuilderComp;

type
  TLoginPage = class(TWebPageModule)
    AdapterXMLBuilder: TAdapterXMLBuilder;
    XMLForm1: TXMLForm;
    XMLFieldGroup1: TXMLFieldGroup;
    LoginFormAdapter1: TLoginFormAdapter;
    XMLCommandGroup1: TXMLCommandGroup;
    XMLAdapterErrors1: TXMLAdapterErrors;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function LoginPage: TLoginPage;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function LoginPage: TLoginPage;
begin
  Result := TLoginPage(WebContext.FindModuleClass(TLoginPage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TLoginPage, TWebPageInfo.Create([{wpPublished} {wpLoginRequired}], ''), crOnDemand, caCache));

end.
