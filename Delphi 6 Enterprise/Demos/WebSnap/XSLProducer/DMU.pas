
unit DMU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DBTables, DB,
  Provider, XMLBrokr;

type
  TWebDataModule1 = class(TWebDataModule)
    XMLBroker1: TXMLBroker;
    DataSetProvider1: TDataSetProvider;
    Table1: TTable;
    Session1: TSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebDataModule1: TWebDataModule1;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WebDataModule1: TWebDataModule1;
begin
  Result := TWebDataModule1(WebContext.FindModuleClass(TWebDataModule1));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebDataModule1, crOnDemand, caCache));

end.
