unit ClientDataModuleU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Provider, BdeProv, Db, DBClient, ActnList,
  MtsCustomerTreeProject_tlb;

type
  TClientDataModule = class(TDataModule)
    DataSourceOrdersDetail: TDataSource;
    DataSourceCustomerMaster: TDataSource;
    CustomerTreeDataSet: TClientDataSet;
    DataSourceCustomerList: TDataSource;
    CustomerListDataSet: TClientDataSet;
    PartsListDataSet: TClientDataSet;
    PartsListDataSource: TDataSource;
    DataSourceItemsDetail: TDataSource;
    OrdersDetailDataSet: TClientDataSet;
    ItemsDetailDataSet: TClientDataSet;
    ItemsDetailDataSetOrderNo: TFloatField;
    ItemsDetailDataSetItemNo: TFloatField;
    ItemsDetailDataSetPartNo: TFloatField;
    ItemsDetailDataSetQty: TIntegerField;
    ItemsDetailDataSetDiscount: TFloatField;
    OrdersDetailDataSetOrderNo: TFloatField;
    OrdersDetailDataSetCustNo: TFloatField;
    OrdersDetailDataSetSaleDate: TDateTimeField;
    OrdersDetailDataSetShipDate: TDateTimeField;
    OrdersDetailDataSetEmpNo: TIntegerField;
    OrdersDetailDataSetShipToContact: TStringField;
    OrdersDetailDataSetShipToAddr1: TStringField;
    OrdersDetailDataSetShipToAddr2: TStringField;
    OrdersDetailDataSetShipToCity: TStringField;
    OrdersDetailDataSetShipToState: TStringField;
    OrdersDetailDataSetShipToZip: TStringField;
    OrdersDetailDataSetShipToCountry: TStringField;
    OrdersDetailDataSetShipToPhone: TStringField;
    OrdersDetailDataSetShipVIA: TStringField;
    OrdersDetailDataSetPO: TStringField;
    OrdersDetailDataSetTerms: TStringField;
    OrdersDetailDataSetPaymentMethod: TStringField;
    OrdersDetailDataSetTaxRate: TFloatField;
    OrdersDetailDataSetFreight: TCurrencyField;
    OrdersDetailDataSetAmountPaid: TCurrencyField;
    OrdersDetailDataSetCustomerOrderItemsTable: TDataSetField;
    CustomerTreeDataSetCustNo: TFloatField;
    CustomerTreeDataSetCompany: TStringField;
    CustomerTreeDataSetAddr1: TStringField;
    CustomerTreeDataSetAddr2: TStringField;
    CustomerTreeDataSetCity: TStringField;
    CustomerTreeDataSetState: TStringField;
    CustomerTreeDataSetZip: TStringField;
    CustomerTreeDataSetCountry: TStringField;
    CustomerTreeDataSetPhone: TStringField;
    CustomerTreeDataSetFAX: TStringField;
    CustomerTreeDataSetTaxRate: TFloatField;
    CustomerTreeDataSetContact: TStringField;
    CustomerTreeDataSetLastInvoiceDate: TDateTimeField;
    CustomerTreeDataSetCustomerOrdersTable: TDataSetField;
    ItemsDetailDataSetItemTotal: TCurrencyField;
    ItemsDetailDataSetMaxItemNo: TAggregateField;
    ItemsDetailDataSetItemsTotal: TAggregateField;
    ItemsDetailDataSetListPrice: TCurrencyField;
    ItemsDetailDataSetDescription: TStringField;
    OrdersDetailDataSetMaxOrderNo: TAggregateField;
    procedure ClientDataModuleCreate(Sender: TObject);
    procedure CustomerListDataSetAfterScroll(DataSet: TDataSet);
    procedure ItemsDetailDataSetCalcFields(DataSet: TDataSet);
    procedure ItemsDetailDataSetNewRecord(DataSet: TDataSet);
    procedure OrdersDetailDataSetNewRecord(DataSet: TDataSet);
    procedure CustomerListDataSetBeforeDelete(DataSet: TDataSet);
    procedure CustomerTreeDataSetNewRecord(DataSet: TDataSet);
    procedure CustomerTreeDataSetAfterPost(DataSet: TDataSet);
    procedure OrdersDetailDataSetBeforeInsert(DataSet: TDataSet);
    procedure ItemsDetailDataSetBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    FSyncToCustomerNumber: Boolean;
    FAppServer: IMtsCustomerTreeDisp;
    FEmpNo: Integer;
    FBriefcase: Boolean;
    FNextCustNo: Integer;
    FNextItemNo: Integer;
    FNextOrderNo: Integer;
    procedure SetAppServer(AAppServer: IMtsCustomerTreeDisp);
    procedure SetBriefcase(ABriefcase: Boolean);
    procedure RefreshCustomer;
    procedure SetEmpNo(AEmpNo: Integer);
    procedure CloseDataSets;
    function NextCustNo: Integer;
    function NextOrderNo: Integer;
    function NextItemNo: Integer;
  public
    { Public declarations }
    procedure GetCustomersList;
    procedure GetPartsList;
    procedure SetMTSOptions(Role: WideString);
    procedure ApplyCustomerChanges;
    procedure DiscardCustomerChanges;
    procedure AddCustomerToBriefcase(DS: TClientDataSet; CustNo: Integer);
    property AppServer: IMtsCustomerTreeDisp read FAppServer write SetAppServer;
    property Briefcase: Boolean read FBriefcase write SetBriefcase;
    property EmpNo: Integer read FEmpNo write SetEmpNo;
    property SyncToCustomerNumber: Boolean read FSyncToCustomerNumber write FSyncToCustomerNumber;
  end;

var
  ClientDataModule: TClientDataModule;

implementation

uses
  AppActionsU;
  
{$R *.DFM}

procedure TClientDataModule.ClientDataModuleCreate(Sender: TObject);
begin
  FSyncToCustomerNumber := True;
  FNextCustNo := -1;
  FNextOrderNo := -1;
  FNextItemNo := -1;
end;

procedure TClientDataModule.CustomerListDataSetAfterScroll(
  DataSet: TDataSet);
begin
  if FSyncToCustomerNumber then
    RefreshCustomer;
end;

procedure TClientDataModule.RefreshCustomer;
var
  CustNo: Integer;
begin
  with CustomerTreeDataSet do
  begin
    if Active then
      CheckBrowseMode;
    if Active and (UpdateStatus = usUnmodified) and Assigned(AppServer) then
    begin
      if RecordCount > 0 then
      begin 
        LogChanges := False;
        try
          Delete;
        finally
          LogChanges := True;
          MergeChangeLog;
        end;
      end;
    end;
  end;
  CustNo := CustomerListDataSet.Fields[0].AsInteger;
  if not CustomerTreeDataSet.Active or
    not CustomerTreeDataSet.Locate('CustNo', CustNo, []) then
  begin
    if Assigned(AppServer) then
    begin
      CustomerTreeDataSet.AppendData(
        AppServer.GetCustomerTree(CustNo,
        not CustomerTreeDataSet.Active), False);
      CustomerTreeDataSet.Locate('CustNo', CustNo, []);
    end
    else
      raise Exception.CreateFmt('Customer %d not found in client data set', [CustNo]);
  end;
  with CustomerTreeDataSet do
    AggregatesActive := True;
  if not OrdersDetailDataSet.Active then
    with OrdersDetailDataSet do
    begin
      DataSetField := CustomerTreeDataSet.FieldByName('CustomerOrdersTable') as TDataSetField;
      Active := True;
      AggregatesActive := True;
    end;
  if not ItemsDetailDataSet.Active then
    with ItemsDetailDataSet do
    begin
      DataSetField := OrdersDetailDataSet.FieldByName('CustomerOrderItemsTable') as TDataSetField;
      Active := True;
      AggregatesActive := True;
    end;
end;

procedure TClientDataModule.GetCustomersList;
begin
  if not CustomerListDataSet.Active then
  begin
    Assert(Assigned(AppServer), 'GetCustomerList: AppServer is nil');
    CustomerListDataSet.Data := AppServer.GetCustomersList;
  end;
end;


procedure TClientDataModule.GetPartsList;
begin
  if not PartsListDataSet.Active then
  begin
    Assert(Assigned(AppServer), 'GetPartsList: AppServer is nil');
    PartsListDataSet.Data := AppServer.GetPartsList;
  end;
end;                      

procedure TClientDataModule.SetMTSOptions(Role: WideString);
begin
  AppServer.SetMTSOptions(Role);
end;

procedure TClientDataModule.SetEmpNo(AEmpNo: Integer);
begin
  if Assigned(AppServer) then
  begin
    AppServer.SetEmpNo(AEmpNo);
  end;
  FEmpNo := AEmpNo;
end;

procedure TClientDataModule.DiscardCustomerChanges;
begin
  Assert(Assigned(AppServer), 'AppCustomerChanges: AppServer is nil');

  CustomerTreeDataSet.Close;
  RefreshCustomer;
end;

procedure TClientDataModule.ApplyCustomerChanges;
var
  Errors: Variant;
  ErrorCount: Integer;
begin
  Assert(Assigned(AppServer), 'AppCustomerChanges: AppServer is nil');
  Errors := AppServer.ApplyCustomerTree(CustomerTreeDataSet.Delta, ErrorCount);
  CustomerTreeDataSet.Reconcile(Errors);
  DiscardCustomerChanges;
end;

procedure TClientDataModule.ItemsDetailDataSetCalcFields(
  DataSet: TDataSet);
var
  PartNo: Integer;
begin
  // Test
  with DataSet do
  begin
    PartNo := FieldByName('PartNo').AsInteger;
    GetPartsList;
    PartsListDataSet.Locate('PartNo', PartNo, []);
    FieldByName('Description').AsString :=
      PartsListDataSet.FieldByName('Description').AsString;
    FieldByName('ListPrice').AsCurrency :=
      PartsListDataSet.FieldByName('ListPrice').AsCurrency;
    FieldByName('ItemTotal').AsCurrency :=
      PartsListDataSet.FieldByName('ListPrice').AsCurrency
      * FieldByName('Qty').AsInteger * ((100 - FieldByName('Discount').AsFloat) / 100 );
  end;
end;

procedure TClientDataModule.ItemsDetailDataSetNewRecord(DataSet: TDataSet);
var
  OrderNo, PartNo: Integer;
begin
  OrderNo := DataSourceOrdersDetail.DataSet.FieldByName('OrderNo').AsInteger;
  with DataSet do
  begin
    if AppActions.GetPartDialog(PartNo) then
      FieldByName('PartNo').AsInteger := PartNo
    else
      Abort;
    FieldByName('ItemNo').AsInteger := NextItemNo;
    FieldByName('OrderNo').AsInteger := OrderNo;
    FieldByName('Qty').Value := 1;
    FieldByName('Discount').Value := 0;
  end;
end;

procedure TClientDataModule.OrdersDetailDataSetNewRecord(
  DataSet: TDataSet);

  procedure CopyFieldValue(AField: TField; const AFieldName: string);
  begin
    if AField = nil then
      AField := DataSourceOrdersDetail.DataSet.FieldByName(AFieldName);
    AField.Value := CustomerTreeDataSet.FieldByName(AFieldName).Value;
  end;

var
  i: Integer;
  FieldName: string;
  CustNo: Integer;
begin
  CustNo := CustomerTreeDataSet.FieldByName('CustNo').AsInteger;
  with DataSet do
  begin
    FieldByName('CustNo').AsInteger := CustNo;
    FieldByName('OrderNo').AsInteger := NextOrderNo;

    FieldByName('EmpNo').AsInteger := Self.EmpNo;
    for i := 0 to Fields.Count - 1 do
    begin
      FieldName := Fields[i].FieldName;
      if Copy(FieldName, 1, 6) = 'ShipTo' then
        CopyFieldValue(Fields[i], Copy(FieldName, 7, 100));
    end;
  end;

end;

procedure TClientDataModule.AddCustomerToBriefcase(DS: TClientDataSet; CustNo: Integer);
begin
  Assert(Assigned(AppServer), 'AddCustomerToBriefcase: AppServer is nil');
  with DS do
  begin
    if not Active or not Locate('CustNo', CustNo, []) then
      DS.AppendData(
        AppServer.GetCustomerTree(CustNo,
        not DS.Active), False);
  end;
end;

procedure TClientDataModule.CustomerListDataSetBeforeDelete(
  DataSet: TDataSet);
begin
  with CustomerTreeDataSet do
  begin
    if Locate('CustNo', DataSet.FieldByName('CustNo').AsInteger, [] ) then
      Delete;
  end;

end;

procedure TClientDataModule.SetBriefcase(ABriefcase: Boolean);
  procedure LoadFromFile;
  var
    i: Integer;
  begin
    try
      CloseDataSets;
      CustomerTreeDataSet.LoadFromFile('custtree');
      PartsListDataSet.LoadFromFile('partlist');
      FSyncToCustomerNumber := False;
      CustomerListDataSet.FieldDefs.Assign(CustomerTreeDataSet.FieldDefs);
      with CustomerListDataSet do
      begin
        for i := FieldDefs.Count - 1 downto 0 do
        begin
          if (FieldDefs[i].Name <> 'CustNo') and
            (FieldDefs[i].Name <> 'Company') then
            FieldDefs[i].Free;
        end;
      end;
      CustomerListDataSet.CreateDataSet;
      with CustomerTreeDataSet do
      begin
        First;
        while not EOF do
        begin
          CustomerListDataSet.AppendRecord([FieldByName('CustNo').AsInteger,
            FieldByName('Company').AsString]);
          Next;
        end;
      end;
      CustomerListDataSet.First;
      FSyncToCustomerNumber := True;
      RefreshCustomer;
    except
      CloseDataSets;
      raise;
    end;
  end;
begin
  if ABriefcase <> FBriefcase then
  begin
    FBriefcase := ABriefcase;
    AppServer := nil;
    LoadFromFile;
  end;
end;

procedure TClientDataModule.CloseDataSets;
begin
  CustomerTreeDataSet.Close;
  CustomerListDataSet.Close;
  PartsListDataSet.Close;
end;


procedure TClientDataModule.SetAppServer(AAppServer: IMtsCustomerTreeDisp);
var
  CustNo: Integer;
begin
  if AAppServer <> FAppServer then
  begin
    if Assigned(FAppServer) then
    begin
      FAppServer := nil;
      CloseDataSets;
    end
    else
    begin
      FAppServer := AAppServer;
      if not FBriefcase then
        GetCustomersList
      else
      begin
        FBriefcase := False;
        if Assigned(FAppServer) then
        begin
          if CustomerListDataSet.Active then
          begin
            CustNo := CustomerListDataSet.FieldByName('CustNo').AsInteger;
            FSyncToCustomerNumber := False;
            CustomerListDataSet.Close;
            GetCustomersList;
            CustomerListDataSet.Locate('CustNo', CustNo, []);
            FSyncToCustomerNumber := True;
            DiscardCustomerChanges;
          end;
        end;
      end;
    end;
  end;
end;

procedure TClientDataModule.CustomerTreeDataSetNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('CustNo').AsInteger := NextCustNo;
end;

procedure TClientDataModule.CustomerTreeDataSetAfterPost(
  DataSet: TDataSet);
begin
  // Put the inserted record into the list that is used to
  // navigate between customer records.
  with DataSet do
    if not CustomerListDataSet.Locate('CustNo',
    FieldByName('CustNo').AsInteger, []) then
      CustomerListDataSet.AppendRecord([FieldByName('CustNo').AsInteger,
                  FieldByName('Company').AsString])
    else
    begin
      CustomerListDataSet.Edit;
      CustomerListDataSet.FieldByName('Company').AsString :=
        FieldByName('Company').AsString;
      CustomerListDataSet.Post;
    end;
end;

procedure TClientDataModule.OrdersDetailDataSetBeforeInsert(
  DataSet: TDataSet);
begin
  with DataSet do
    if Assigned(DataSetField) then
    begin
      if DataSetField.DataSet.RecordCount = 0 then
        raise Exception.Create('No records in master');
    end;
end;

procedure TClientDataModule.ItemsDetailDataSetBeforeInsert(
  DataSet: TDataSet);
begin
  with DataSet do
    if Assigned(DataSetField) then
    begin
      if DataSetField.DataSet.RecordCount = 0 then
        raise Exception.Create('No records in master');
    end;
end;

function TClientDataModule.NextCustNo: Integer;
begin
  Result := FNextCustNo;
  Dec(FNextCustNo);
end;

function TClientDataModule.NextItemNo: Integer;
begin
  Result := FNextItemNo;
  Dec(FNextItemNo);
end;

function TClientDataModule.NextOrderNo: Integer;
begin
  Result := FNextOrderNo;
  Dec(FNextOrderNo);
end;

end.
 