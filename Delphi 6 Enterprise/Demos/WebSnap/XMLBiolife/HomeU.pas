
unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebUsers, WebSess, WebDisp, WebAdapt, WebComp, XMLBuilderComp,
  XMLAdapterBuilder;

type
  THome = class(TWebAppPageModule)
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    EndUserSessionAdapter: TEndUserSessionAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    SessionsService: TSessionsService;
    WebUserList: TWebUserList;
    AdapterXMLBuilder1: TAdapterXMLBuilder;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Home: THome;

implementation

{$R *.dfm}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THome, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], ''), caCache));

end.
