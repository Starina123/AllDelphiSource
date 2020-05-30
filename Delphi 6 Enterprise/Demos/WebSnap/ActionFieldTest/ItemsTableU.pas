
unit ItemsTableU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebForm, MidItems, WebComp, CompProd, PagItems, SiteProd, DispActnFld;

type
  TItemsTable = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
    AdapterGrid1: TAdapterGrid;
    ColEdit: TAdapterEditColumn;
    AdapterCommandColumn1: TAdapterCommandColumn;
    ColItemNo: TAdapterDisplayColumn;
    ColPartNo: TAdapterDisplayColumn;
    ColDiscount: TAdapterDisplayColumn;
    AdapterDisplayActionField1: TAdapterDisplayActionField;
    CmdFirstRow: TAdapterActionButton;
    CmdPrevRow: TAdapterActionButton;
    CmdNextRow: TAdapterActionButton;
    CmdLastRow: TAdapterActionButton;
    CmdRefreshRow2: TAdapterActionButton;
    FldOrderNo: TAdapterDisplayField;
    FldCustNo: TAdapterDisplayField;
    CmdApply2: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;
    LayoutGroup1: TLayoutGroup;
    AdapterCommandGroup2: TAdapterCommandGroup;
    CmdNewRow: TAdapterActionButton;
    LayoutGroup2: TLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ItemsTable: TItemsTable;

implementation

{$R *.DFM}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function ItemsTable: TItemsTable;
begin
  Result := TItemsTable(WebContext.FindModuleClass(TItemsTable));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TItemsTable, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
