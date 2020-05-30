unit MinAppU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TMinApp = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function MinApp: TMinApp;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function MinApp: TMinApp;
begin
  Result := TMinApp(WebContext.FindModuleClass(TMinApp));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TMinApp, TWebPageInfo.Create([wpPublished], '.html', '', 'Build MinApp'), crOnDemand, caCache));

end.
