
unit DataU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, WebAdapt,
  WebComp, DB, DBTables, DBAdapt, DBAdaptImg;

type
  TWebDataModule3 = class(TWebDataModule)
    Table1: TTable;
    Session1: TSession;
    Table1SpeciesNo: TFloatField;
    Table1Category: TStringField;
    Table1Common_Name: TStringField;
    Table1SpeciesName: TStringField;
    Table1Lengthcm: TFloatField;
    Table1Length_In: TFloatField;
    Table1Notes: TMemoField;
    Table1Graphic: TGraphicField;
    DataSetAdapter1: TDataSetAdapter;
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
    ActionNewRow: TDataSetAdapterNewRowAction;
    ActionEditRow: TDataSetAdapterEditRowAction;
    ActionCancel: TDataSetAdapterCancelRowAction;
    ActionApply: TDataSetAdapterApplyRowAction;
    ActionRefreshRow: TDataSetAdapterRefreshRowAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebDataModule3: TWebDataModule3;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WebDataModule3: TWebDataModule3;
begin
  Result := TWebDataModule3(WebContext.FindModuleClass(TWebDataModule3));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebDataModule3, crOnDemand, caCache));

end.
