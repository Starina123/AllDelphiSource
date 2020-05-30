unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu, WebDisp;

type
  THome = class(TWebAppPageModule)
    WebAppComponents: TWebAppComponents;
    PageProducer: TPageProducer;
    PageDispatcher: TPageDispatcher;
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
