
unit SessionInfoU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, MidItems, WebForm, WebComp;

type
  TSessionInfo = class(TWebPageModule)
    PageProducer1: TPageProducer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function SessionInfo: TSessionInfo;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, HomeU;

function SessionInfo: TSessionInfo;
begin
  Result := TSessionInfo(WebContext.FindModuleClass(TSessionInfo));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TSessionInfo, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
