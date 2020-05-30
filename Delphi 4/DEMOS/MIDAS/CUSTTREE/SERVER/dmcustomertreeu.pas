unit DMCustomerTreeU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Provider, BdeProv, Db, DBTables, DBClient;

type
  TDMCustomerTree = class(TDataModule)
    CustomerQuery: TQuery;
    CustomerOrdersTable: TTable;
    CustomerQuerySource: TDataSource;
    CustomerTreeProvider: TProvider;
    CustomerOrderItemsTable: TTable;
    CustomerOrdersSource: TDataSource;
    CustomerOrderItemsTableOrderNo: TFloatField;
    CustomerOrderItemsTableItemNo: TFloatField;
    CustomerOrderItemsTablePartNo: TFloatField;
    CustomerOrderItemsTableQty: TIntegerField;
    CustomerOrderItemsTableDiscount: TFloatField;
    NextOrderTable: TTable;
    CustomerQueryCustNo: TFloatField;
    CustomerQueryCompany: TStringField;
    CustomerQueryAddr1: TStringField;
    CustomerQueryAddr2: TStringField;
    CustomerQueryCity: TStringField;
    CustomerQueryState: TStringField;
    CustomerQueryZip: TStringField;
    CustomerQueryCountry: TStringField;
    CustomerQueryPhone: TStringField;
    CustomerQueryFAX: TStringField;
    CustomerQueryTaxRate: TFloatField;
    CustomerQueryContact: TStringField;
    CustomerQueryLastInvoiceDate: TDateTimeField;
    NextCustomerTable: TTable;
    NextItemTable: TTable;
    CustomerListQuery: TQuery;
    CustomerListQueryCustNo: TFloatField;
    CustomerListQueryCompany: TStringField;
    CustomerListProvider: TDataSetProvider;
    EmployeesTable: TTable;
    PartsProvider: TProvider;
    PartsQuery: TQuery;
    Session1: TSession;
    Database1: TDatabase;
    procedure DMCustomerTreeCreate(Sender: TObject);
    procedure CustomerTreeProviderUpdateData(Sender: TObject;
      DataSet: TClientDataSet);
    procedure CustomerTreeProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    FCanEditCustomer: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property CanEditCustomer: Boolean read FCanEditCustomer write FCanEditCustomer;
    function GetCustomerOrdersTree(CustNo: Integer;
       MetaData: WordBool): OleVariant;
    function ApplyCustomerTree(Delta: OleVariant;
      out ErrorCount: Integer): OleVariant;
    function GetCustomersList: OleVariant;
    procedure ValidateEmpNo(AEmpNo: Integer);
    function GetPartsList: OleVariant;
  end;


implementation

{$R *.DFM}


function TDMCustomerTree.GetCustomerOrdersTree(CustNo: Integer;
  MetaData: WordBool): OleVariant;
var
  RecsOut: Integer;
begin
  with CustomerQuery do
  begin
    Close;
    Params[0].AsInteger := CustNo;
    Open;
  end;
  with CustomerTreeProvider do
  begin
    if CanEditCustomer then
      Options := Options - [poReadOnly]
    else
      Options := Options + [poReadOnly];
    Reset(MetaData);
    Result := GetRecords(-1, RecsOut);
  end;
end;

function TDMCustomerTree.ApplyCustomerTree(Delta: OleVariant;
  out ErrorCount: Integer): OleVariant;
begin
  with CustomerTreeProvider do
  begin
    Result := ApplyUpdates(Delta, -1, ErrorCount);
  end;
end;

procedure TDMCustomerTree.DMCustomerTreeCreate(Sender: TObject);
begin
  FCanEditCustomer := True;
end;

procedure TDMCustomerTree.CustomerTreeProviderUpdateData(Sender: TObject;
  DataSet: TClientDataSet);
  procedure UpdateItems(Items: TDataSet);
  begin
  end;
  procedure UpdateOrders(Orders: TDataSet);
  begin
    with DataSet do
      while not EOF do
      begin
        if UpdateStatus = usInserted then
          ;
          // Provide unique customer number
        //UpdateItems((FieldByName('CustomerOrderItemsTable') as TDataSetField).NestedDataSet);
        Next;
      end;
  end;
begin
  with DataSet do
    while not EOF do
    begin
      if UpdateStatus = usInserted then
        ;
        // Provide unique customer number
      //UpdateOrders((FieldByName('CustomerOrdersTable') as TDataSetField).NestedDataSet);
      Next;
    end;
end;


procedure TDMCustomerTree.CustomerTreeProviderBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);

  function NewKey(KeyTable: TTable): Integer;
  begin
    with KeyTable do
    begin
      Active := True;
      Edit;
      with Fields[0] do
      begin
        Result := AsInteger;
        AsInteger := Result + 1;
      end;
      Post;
    end;
  end;


begin
  // Update records here
  // provide new key values, etc.
  if SourceDS = CustomerQuery then
  begin
    case UpdateKind of
      ukInsert:
        with DeltaDS do
        begin
          Edit;
          FieldByName('CustNo').AsInteger := NewKey(NextCustomerTable);
          Post;
        end;
      ukDelete:  ; // Cascade deletes
    end;
  end
  else if SourceDS = CustomerOrdersTable then
  begin
    case UpdateKind of
      ukInsert:
        with DeltaDS do
        begin
          Edit;
          FieldByName('OrderNo').AsInteger := NewKey(NextOrderTable);
          Post;
        end;
      ukDelete: ; // Cascade deletes
    end;
  end
  else if SourceDS = CustomerOrderItemsTable then
  begin
    case UpdateKind of
      ukInsert:
        with DeltaDS do
        begin
          Edit;
          FieldByName('ItemNo').AsInteger := NewKey(NextItemTable);
          Post;
        end;
    end
  end;
end;

function TDMCustomerTree.GetCustomersList: OleVariant;
begin
  with CustomerListQuery do
  begin
    Close;
    Open;
  end;
  with CustomerListProvider do
  begin
    Reset(True);
    Result := Data;
  end;
end;

procedure TDMCustomerTree.ValidateEmpNo(AEmpNo: Integer);
begin
  EmployeesTable.Active := True;
  if not EmployeesTable.Locate('EmpNo', AEmpNo, []) then
    raise Exception.CreateFmt('EmpNo %d not found.', [AEmpNo]);
end;

function TDMCustomerTree.GetPartsList: OleVariant;
begin
  with PartsQuery do
  begin
    Close;
    Open;
  end;
  with PartsProvider do
  begin
    Reset(True);
    Result := Data;
  end;
end;


end.
