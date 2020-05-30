unit CountryReportU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TCountryReport = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CountryReport: TCountryReport;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function CountryReport: TCountryReport;
begin
  Result := TCountryReport(WebContext.FindModuleClass(TCountryReport));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountryReport, TWebPageInfo.Create([wpPublished], '.html', '', 'Build CountryReport'), crOnDemand, caCache));
end.
