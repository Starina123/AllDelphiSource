
unit InetXPageU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  MidItems, WebComp, CompProd, PagItems, MidProd, WebAdapt;

type
  TCountries = class(TWebPageModule)
  InetXPageProducer: TInetXPageProducer;
    DataForm1: TDataForm;
    DataNavigator1: TDataNavigator;
    DataGrid1: TDataGrid;
    DataSetInfo: TAdapter;
    ContinentName: TAdapterField;
    procedure InetXPageProducerBeforeGetContent(Sender: TObject);
    procedure ContinentNameGetValue(Sender: TObject; var Value: Variant);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Countries: TCountries;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function Countries: TCountries;
begin
  Result := TCountries(WebContext.FindModuleClass(TCountries));
end;

procedure TCountries.InetXPageProducerBeforeGetContent(
  Sender: TObject);
begin
  // Make the InetXPageProducer reference the corrent XMLBroker
  if not VarIsEmpty(DM.ContinentValue) then
    DataGrid1.XMLBroker := DM.XMLBrokerCountriesInContinent
  else
    DataGrid1.XMLBroker := DM.XMLBrokerCountries;
end;

procedure TCountries.ContinentNameGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := DM.ContinentValue;
end;

initialization
  // This factory adds a page call All Countries.
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountries, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html', '', 'All Countries'), crOnDemand, caCache));
  // Add another factory for the query result page (not published)
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountries, TWebPageInfo.Create([{wpPublished, wpLoginRequired}], '.html', 'QueryResult', 'Query Result'), crOnDemand, caCache));

end.
