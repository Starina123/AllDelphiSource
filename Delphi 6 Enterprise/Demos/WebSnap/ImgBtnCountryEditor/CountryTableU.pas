unit CountryTableU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, SiteProd, WebModu,
  MidItems, WebForm, DB, WebAdapt, WebComp, DBTables, CompProd, PagItems,
  DBAdapt, ImgBtnProducer;

type
  TCountryTable = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    Country: TTable;
    Session1: TSession;
    Adapter: TDataSetAdapter;
    AdapterForm1: TAdapterForm;
    CountryName: TStringField;
    CountryCapital: TStringField;
    CountryContinent: TStringField;
    CountryArea: TFloatField;
    CountryPopulation: TFloatField;
    AdapterGrid1: TAdapterGrid;
    ColName: TAdapterDisplayColumn;
    ColCapital: TAdapterDisplayColumn;
    ColContinent: TAdapterDisplayColumn;
    ColArea: TAdapterDisplayColumn;
    ColPopulation: TAdapterDisplayColumn;
    AdapterCommandColumn1: TAdapterCommandColumn;
    DeleteRow: TAdapterActionButton;
    NewRow: TAdapterActionButton;
    EditRow: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;
    ImageButtonProducer1: TImageButtonProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CountryTable: TCountryTable;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function CountryTable: TCountryTable;
begin
  Result := TCountryTable(WebContext.FindModuleClass(TCountryTable));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountryTable, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
