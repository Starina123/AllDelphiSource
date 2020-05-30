unit DetailsU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu,
  SvrInfoAdapter, WebComp, WebAdapt;

type
  TDetails = class(TWebPageModule)
  PageProducer: TPageProducer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Details: TDetails;

implementation

{$R *.dfm} {*.HTML}

uses WebReq, WebCntxt, WebFact, Variants;

function Details: TDetails;
begin
  Result := TDetails(WebContext.FindModuleClass(TDetails));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(
      TWebPageModuleFactory.Create(TDetails, TWebPageInfo.Create([wpPublished]), crOnDemand, caCache));

end.
