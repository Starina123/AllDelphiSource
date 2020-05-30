
unit MainMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebSess, WebDisp, WebAdapt, WebComp;

type
  TMainModule = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    EndUserSessionAdapter: TEndUserSessionAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    SessionsService: TSessionsService;
    AdaptDisplayName: TAdapterEndUserDisplayNameField;
    AdaptLoggedIn: TAdapterEndUserLoggedInField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function MainModule: TMainModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function MainModule: TMainModule;
begin
  Result := TMainModule(WebContext.FindModuleClass(TMainModule));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(TMainModule, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
