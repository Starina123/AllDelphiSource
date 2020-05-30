
unit DMU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, Provider,
  DBTables, DB, XMLBrokr;

type
  TDM = class(TWebDataModule)
    XMLBrokerCountries: TXMLBroker;
    Countries: TTable;
    Session1: TSession;
    CountriesProvider: TDataSetProvider;
    CountriesInContinent: TQuery;
    CountriesInContinentProvider: TDataSetProvider;
    XMLBrokerCountriesInContinent: TXMLBroker;
    procedure WebDataModuleActivate(Sender: TObject);
  private
    FContinentValue: Variant;
    procedure SetContinentValue(const Value: Variant);
    { Private declarations }
  public
    { Public declarations }
    property ContinentValue: Variant read FContinentValue write SetContinentValue;
  end;

  function DM: TDM;

implementation

{$R *.dfm}

uses WebReq, WebCntxt, WebFact, Variants;

function DM: TDM;
begin
  Result := TDM(WebContext.FindModuleClass(TDM));
end;

{ TWebDataModule3 }

procedure TDM.SetContinentValue(const Value: Variant);
begin
  FContinentValue := Value;
  if not VarIsEmpty(Value) then
  begin
    XMLBrokerCountriesInContinent.Connected := False;
    XMLBrokerCountriesInContinent.Params.ParamByName('Continent').Value := Value;
  end;
end;

procedure TDM.WebDataModuleActivate(Sender: TObject);
begin
  ContinentValue := Unassigned;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TDM, crAlways, caCache));

end.
