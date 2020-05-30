
unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp, DBAdapt, ExtendedAdapterObj, SimpleScriptObj;

type
  THome = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    ExtendedAdapter1: TExtendedAdapter;
    ExtendedDataSetAdapter1: TExtendedDataSetAdapter;
    SimpleScriptObject1: TSimpleScriptObject;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Home: THome;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THome, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
