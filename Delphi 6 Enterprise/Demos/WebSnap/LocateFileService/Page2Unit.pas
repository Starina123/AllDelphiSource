
unit Page2Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd;

type
  TPage2 = class(TWebPageModule)
  PageProducer: TPageProducer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Page2: TPage2;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function Page2: TPage2;
begin
  Result := TPage2(WebContext.FindModuleClass(TPage2));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TPage2, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
