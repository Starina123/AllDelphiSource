
unit DMU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DB, WebAdapt,
  WebComp, DBAdapt, DBTables, DBAdaptImg, msxmldom, XMLDoc, XMLBuilderComp,
  xmldom, XMLIntf;

type
  TDM = class(TWebDataModule)
    Table1: TTable;
    Session1: TSession;
    DataSetAdapter1: TDataSetAdapter;
    Table1SpeciesNo: TFloatField;
    Table1Category: TStringField;
    Table1Common_Name: TStringField;
    Table1SpeciesName: TStringField;
    Table1Lengthcm: TFloatField;
    Table1Length_In: TFloatField;
    Table1Notes: TMemoField;
    Table1Graphic: TGraphicField;
    XSLTemplate1: TXSLTemplate;
    AdaptSpeciesNo: TDataSetAdapterField;
    AdaptCategory: TDataSetAdapterField;
    AdaptCommon_Name: TDataSetAdapterField;
    AdaptSpeciesName: TDataSetAdapterField;
    AdaptLengthcm: TDataSetAdapterField;
    AdaptLength_In: TDataSetAdapterField;
    AdaptNotes: TDataSetAdapterMemoField;
    AdaptGraphic: TDataSetAdapterImageField;
    ActionDeleteRow: TDataSetAdapterDeleteRowAction;
    ActionFirstRow: TDataSetAdapterFirstRowAction;
    ActionPrevRow: TDataSetAdapterPrevRowAction;
    ActionNextRow: TDataSetAdapterNextRowAction;
    ActionLastRow: TDataSetAdapterLastRowAction;
    ActionEditRow: TDataSetAdapterEditRowAction;
    ActionNewRow: TDataSetAdapterNewRowAction;
    ActionCancel: TDataSetAdapterCancelRowAction;
    ActionApply: TDataSetAdapterApplyRowAction;
    ActionRefreshRow: TDataSetAdapterRefreshRowAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DM: TDM;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function DM: TDM;
begin
  Result := TDM(WebContext.FindModuleClass(TDM));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TDM, crOnDemand, caCache));

end.
