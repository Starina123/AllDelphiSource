
unit DisplayDataPacketU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd;

type
  TDisplayDataPacketPage = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DisplayDataPacketPage: TDisplayDataPacketPage;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function DisplayDataPacketPage: TDisplayDataPacketPage;
begin
  Result := TDisplayDataPacketPage(WebContext.FindModuleClass(TDisplayDataPacketPage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TDisplayDataPacketPage, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
