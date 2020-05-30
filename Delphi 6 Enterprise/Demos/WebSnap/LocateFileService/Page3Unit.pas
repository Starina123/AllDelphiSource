
unit Page3Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd;

type
  TPage3 = class(TWebPageModule)
  PageProducer: TPageProducer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Page3: TPage3;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function Page3: TPage3;
begin
  Result := TPage3(WebContext.FindModuleClass(TPage3));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TPage3, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
