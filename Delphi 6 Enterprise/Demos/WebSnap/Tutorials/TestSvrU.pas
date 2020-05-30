unit TestSvrU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TTestSvr = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function TestSvr: TTestSvr;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function TestSvr: TTestSvr;
begin
  Result := TTestSvr(WebContext.FindModuleClass(TTestSvr));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(
      TWebPageModuleFactory.Create(TTestSvr, TWebPageInfo.Create([wpPublished], '.html', '', 'Configure Web App Debugger'), crOnDemand, caCache));

end.
