
unit GridU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  XMLAdapterBuilder, WebComp, XMLBuilderComp, msxmldom, XMLDoc, XSLProd;

type
  TGrid = class(TWebPageModule)
    XMLBuilder1: TAdapterXMLBuilder;
    XMLForm1: TXMLForm;
    XMLGrid1: TXMLGrid;
    FldItemSpeciesNo: TXMLAdapterColumnItem;
    FldItemCategory: TXMLAdapterColumnItem;
    FldItemNotes: TXMLAdapterColumnItem;
    FldItemGraphic: TXMLAdapterColumnItem;
    XMLCommandColumn1: TXMLCommandColumn;
    ActItemDeleteRow: TXMLAdapterActionItem;
    ActItemEditRow: TXMLAdapterActionItem;
    ActItemNewRow: TXMLAdapterActionItem;
    XMLAdapterErrors1: TXMLAdapterErrors;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Grid: TGrid;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function Grid: TGrid;
begin
  Result := TGrid(WebContext.FindModuleClass(TGrid));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TGrid, TWebPageInfo.Create([wpPublished, wpLoginRequired], ''), crOnDemand, caCache));

end.
