
unit DMU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, WebAdapt,
  WebComp, DBAdapt, DB, DBTables, ActnFld;

type
  TDM = class(TWebDataModule)
    ItemsTable: TTable;
    OrdersQuery: TQuery;
    OrdersSource: TDataSource;
    ItemsTableOrderNo: TFloatField;
    ItemsTableItemNo: TFloatField;
    ItemsTablePartNo: TFloatField;
    ItemsTableQty: TIntegerField;
    ItemsTableDiscount: TFloatField;
    OrdersAdapter: TDataSetAdapter;
    ItemsAdapter: TDataSetAdapter;
    AdaptOrderNo: TDataSetAdapterField;
    AdaptCustNo: TDataSetAdapterField;
    AdaptOrderNo2: TDataSetAdapterField;
    AdaptItemNo: TDataSetAdapterField;
    AdaptPartNo: TDataSetAdapterField;
    AdaptQty: TDataSetAdapterField;
    AdaptDiscount: TDataSetAdapterField;
    DataSetAdapterDeleteRowField: TDataSetAdapterDeleteRowField;
    PartNoQuery: TQuery;
    PartNoValuesList: TDataSetValuesList;
    Session1: TSession;
    NextItemNo: TQuery;
    procedure ItemsTableBeforePost(DataSet: TDataSet);
    procedure ItemsTableNewRecord(DataSet: TDataSet);
  private
    function GetNextItemNo: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

  function DM: TDM;

implementation

{$R *.DFM} 

uses WebReq, WebCntxt, WebFact, Variants;

function DM: TDM;
begin
  Result := TDM(WebContext.FindModuleClass(TDM));
end;

procedure TDM.ItemsTableNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ItemNo').Value := -1;
  DataSet.FieldByName('Qty').Value := 1;
  DataSet.FieldByName('Discount').Value := 0;
end;

function TDM.GetNextItemNo: Integer;
begin
  NextItemNo.Active := False;
  NextItemNo.Params[0].Value := OrdersQuery.FieldByName('OrderNo').Value;
  NextItemNo.Active := True;
  try
    if VarIsNull(NextItemNo.Fields[0].Value) then
      Result := 1
    else
      Result := NextItemNo.Fields[0].Value + 1;
  finally
    NextItemNo.Active := False;
  end;
end;

procedure TDM.ItemsTableBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('ItemNo').Value := GetNextItemNo;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TDM, crOnDemand, caCache));

end.
