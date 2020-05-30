
unit DMU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, WebAdapt,
  WebComp, DBAdapt, DB, DBTables;

type
  TWebDataModule1 = class(TWebDataModule)
    OrdersTable: TTable;
    Session1: TSession;
    ItemsTable: TTable;
    DataSource1: TDataSource;
    OrdersTableOrderNo: TFloatField;
    OrdersTableCustNo: TFloatField;
    OrdersTableSaleDate: TDateTimeField;
    OrdersTableShipDate: TDateTimeField;
    OrdersTableEmpNo: TIntegerField;
    OrdersTableShipToContact: TStringField;
    OrdersTableShipToAddr1: TStringField;
    OrdersTableShipToAddr2: TStringField;
    OrdersTableShipToCity: TStringField;
    OrdersTableShipToState: TStringField;
    OrdersTableShipToZip: TStringField;
    OrdersTableShipToCountry: TStringField;
    OrdersTableShipToPhone: TStringField;
    OrdersTableShipVIA: TStringField;
    OrdersTablePO: TStringField;
    OrdersTableTerms: TStringField;
    OrdersTablePaymentMethod: TStringField;
    OrdersTableItemsTotal: TCurrencyField;
    OrdersTableTaxRate: TFloatField;
    OrdersTableFreight: TCurrencyField;
    OrdersTableAmountPaid: TCurrencyField;
    ItemsTableOrderNo: TFloatField;
    ItemsTableItemNo: TFloatField;
    ItemsTablePartNo: TFloatField;
    ItemsTableQty: TIntegerField;
    ItemsTableDiscount: TFloatField;
    OrdersAdapter: TDataSetAdapter;
    ItemsAdapter: TDataSetAdapter;
    ActionDeleteRow2: TDataSetAdapterDeleteRowAction;
    ActionFirstRow2: TDataSetAdapterFirstRowAction;
    ActionPrevRow2: TDataSetAdapterPrevRowAction;
    ActionNextRow2: TDataSetAdapterNextRowAction;
    ActionLastRow2: TDataSetAdapterLastRowAction;
    ActionEditRow2: TDataSetAdapterEditRowAction;
    ActionBrowseRow2: TDataSetAdapterBrowseRowAction;
    ActionNewRow2: TDataSetAdapterNewRowAction;
    ActionCancel2: TDataSetAdapterCancelRowAction;
    ActionApply2: TDataSetAdapterApplyRowAction;
    ActionRefreshRow2: TDataSetAdapterRefreshRowAction;
    ActionDeleteRow: TDataSetAdapterDeleteRowAction;
    ActionNewRow: TDataSetAdapterNewRowAction;
    PartNoValuesList: TDataSetValuesList;
    PartNoQuery: TQuery;
    AdaptOrderNo: TDataSetAdapterField;
    AdaptItemNo: TDataSetAdapterField;
    AdaptPartNo: TDataSetAdapterField;
    AdaptQty: TDataSetAdapterField;
    AdaptDiscount: TDataSetAdapterField;
    ActionCancel: TDataSetAdapterCancelRowAction;
    ActionApply: TDataSetAdapterApplyRowAction;
    ActionRefreshRow: TDataSetAdapterRefreshRowAction;
    QueryAdapter: TDataSetAdapter;
    Query1: TQuery;
    Query1CustNo: TFloatField;
    Query1Company: TStringField;
    Query1OrderNo: TFloatField;
    Query1SaleDate: TDateTimeField;
    Query1ShipDate: TDateTimeField;
    Query1EmpNo: TIntegerField;
    Query1ItemsTotal: TCurrencyField;
    Query1AmountPaid: TCurrencyField;
    ActionPrevPage: TAdapterPrevPageAction;
    ActionGotoPage: TAdapterGotoPageAction;
    ActionNextPage: TAdapterNextPageAction;
    ActionBrowseRow: TDataSetAdapterBrowseRowAction;
    BrowseOrder: TAdapterAction;
    procedure ActionBrowseRow2AfterExecute(Sender: TObject;
      Params: TStrings);
    procedure ActionEditRow2AfterExecute(Sender: TObject;
      Params: TStrings);
    procedure ActionCancelBeforeExecute(Sender: TObject; Params: TStrings;
      var Handled: Boolean);
    procedure ActionNewRowGetParams(Sender: TObject; Params: TStrings);
    procedure ActionNewRowBeforeExecute(Sender: TObject; Params: TStrings;
      var Handled: Boolean);
    procedure ActionBrowseRowAfterExecute(Sender: TObject;
      Params: TStrings);
    procedure BrowseOrderGetParams(Sender: TObject; Params: TStrings);
    procedure BrowseOrderExecute(Sender: TObject; Params: TStrings);
  private
    { Private declarations }
    FEditing: Boolean;
  public
    { Public declarations }
  end;

  function WebDataModule1: TWebDataModule1;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, OrderFormU;

function WebDataModule1: TWebDataModule1;
begin
  Result := TWebDataModule1(WebContext.FindModuleClass(TWebDataModule1));
end;

procedure TWebDataModule1.ActionBrowseRow2AfterExecute(Sender: TObject;
  Params: TStrings);
begin
  // Browse button puts both adapter's into browse mode
  if OrdersAdapter.Mode = amBrowse then
    ItemsAdapter.Mode := amBrowse;
end;

procedure TWebDataModule1.ActionEditRow2AfterExecute(Sender: TObject;
  Params: TStrings);
begin
  // Edit button puts both adapter's into edit mode
  if OrdersAdapter.Mode = amEdit then
    ItemsAdapter.Mode := amEdit;
end;

procedure TWebDataModule1.ActionCancelBeforeExecute(Sender: TObject;
  Params: TStrings; var Handled: Boolean);
begin
  // Set default action to execute when leave new... form
  if FEditing then
    OrderForm.DefaultAction.ActionName := ActionEditRow2.ActionName
  else
    OrderForm.DefaultAction.ActionName := ActionBrowseRow2.ActionName;

end;

procedure TWebDataModule1.ActionNewRowGetParams(Sender: TObject;
  Params: TStrings);
begin
  if OrdersAdapter.Mode = amEdit then
    Params.Add('Editing=1');
end;

procedure TWebDataModule1.ActionNewRowBeforeExecute(Sender: TObject;
  Params: TStrings; var Handled: Boolean);
begin
  FEditing := Params.Values['Editing'] <> '';
end;

procedure TWebDataModule1.ActionBrowseRowAfterExecute(Sender: TObject;
  Params: TStrings);
begin
  if QueryAdapter.Errors.ErrorCount = 0 then
  begin
    OrdersAdapter.DataSet.Open;
    if not OrdersAdapter.DataSet.Locate('OrderNo', OrdersAdapter.DataSet.FieldByName('OrderNo').Value, []) then
      raise Exception.Create('Record not found');
  end;

end;

procedure TWebDataModule1.BrowseOrderGetParams(Sender: TObject;
  Params: TStrings);
begin
  Params.Add(Format('OrderNo=%s', [QueryAdapter.DataSet.FieldByName('OrderNo').AsString]));
end;

procedure TWebDataModule1.BrowseOrderExecute(Sender: TObject;
  Params: TStrings);
begin
  OrdersAdapter.DataSet.Open;
  if not OrdersAdapter.DataSet.Locate('OrderNo', StrToInt(Params.Values['OrderNo']), []) then
    raise Exception.Create('Record not found');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebDataModule1, crOnDemand, caCache));

end.
