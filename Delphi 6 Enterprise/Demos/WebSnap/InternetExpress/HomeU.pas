
unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp;

type
  THome = class(TWebAppPageModule)
  WebAppComponents: TWebAppComponents;
  ApplicationAdapter: TApplicationAdapter;
  PageDispatcher: TPageDispatcher;
  AdapterDispatcher: TAdapterDispatcher;
    PageProducer1: TPageProducer;
    WebDispatcher1: TWebDispatcher;
    procedure PageDispatcherPageNotFound(Sender: TObject;
      const PageName: String; var Handled: Boolean);

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

procedure THome.PageDispatcherPageNotFound(Sender: TObject;
  const PageName: String; var Handled: Boolean);
begin
  Handled := True;
  Response.Content := Format('Page %s not found', [PageName]);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THome, TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html', '', 'Home'), caCache));

end.
