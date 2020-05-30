
unit EditU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  XMLAdapterBuilder, WebComp, XMLBuilderComp, msxmldom, XMLDoc, XSLProd;

type
  TDetails = class(TWebPageModule)
    XMLBuilder1: TAdapterXMLBuilder;
    XMLForm1: TXMLForm;
    XMLFieldGroup1: TXMLFieldGroup;
    FldItemSpeciesNo: TXMLAdapterFieldItem;
    FldItemCategory: TXMLAdapterFieldItem;
    FldItemCommon_Name: TXMLAdapterFieldItem;
    FldItemSpeciesName: TXMLAdapterFieldItem;
    FldItemLengthcm: TXMLAdapterFieldItem;
    FldItemLength_In: TXMLAdapterFieldItem;
    FldItemNotes: TXMLAdapterFieldItem;
    FldItemGraphic: TXMLAdapterFieldItem;
    XMLCommandGroup1: TXMLCommandGroup;
    XMLAdapterErrors1: TXMLAdapterErrors;
    XMLAdapterFieldItem: TXMLAdapterFieldItem;
    ActItemFirstRow: TXMLAdapterActionItem;
    ActItemPrevRow: TXMLAdapterActionItem;
    ActItemNextRow: TXMLAdapterActionItem;
    ActItemLastRow: TXMLAdapterActionItem;
    ActItemCancel: TXMLAdapterActionItem;
    ActItemApply: TXMLAdapterActionItem;
    ActItemRefreshRow: TXMLAdapterActionItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Details: TDetails;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function Details: TDetails;
begin
  Result := TDetails(WebContext.FindModuleClass(TDetails));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TDetails, TWebPageInfo.Create([wpPublished, wpLoginRequired], ''), crOnDemand, caCache));

end.
