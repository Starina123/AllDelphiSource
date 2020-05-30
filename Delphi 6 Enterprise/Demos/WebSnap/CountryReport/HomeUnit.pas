unit HomeUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu, WebDisp,
  WebAdapt, WebComp;

type
  THome = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    PageDispatcher: TPageDispatcher;
    ApplicationAdapter1: TApplicationAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Home: THome;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THome, TWebPageInfo.Create, caCache));

end.
