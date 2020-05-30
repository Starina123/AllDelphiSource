unit ReportUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, SiteProd, DB,
  DBTables, WebAdapt, WebComp, WebModu, DBAdapt;

type
  TReport = class(TWebPageModule)
    PageProducer: TPageProducer;
    Table1: TTable;
    Adapter: TDataSetAdapter;
    Session1: TSession;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Report: TReport;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function Report: TReport;
begin
  Result := TReport(WebContext.FindModuleClass(TReport));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TReport, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
