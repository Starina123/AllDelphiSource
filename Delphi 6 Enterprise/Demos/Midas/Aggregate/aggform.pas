unit aggform;
{
  This project demonstrates the use of maintained aggregates on clientdatasets.
  The Customer and Orders tables from DBDEMOS are used to create a master-detail
  relationanship. The data is transfered through the provider. On the "client"
  side, two aggregate fields are set up on the orders clientdataset. 
  One is a "global" aggregate ( the grouping level of the
  aggregate field is zero ). The other is a grouped aggregate defined on an
  an index that is created on the 'ShipVIA' field. When the datasets are first
  opened, only the global aggregate is displayed.  As you navigate through the
  customer dataset, the new value for that customer is displayed. If you
  add, delete or modify any records in the detail set the new value for the
  aggregate is automatically updated. If you press the 'GroupByShipVIA' button
  the 'ShipVIA' index is activated on the details. This also activates any
  non-global aggregates ( Agg.GroupingLeve > 0 ) that use this index, and 
  now the sub-total for each shipping method is displayed. As you navigate 
  among the detail set, if you move to a different shipping method, the 
  aggregate value will change. Any updates to the detail dataset will 
  force updates to the aggregate values.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, DBClient, Provider, Db,
  DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    CustDataSource: TDataSource;
    CustQuery: TQuery;
    OrderQuery: TQuery;
    Provider1: TDataSetProvider;
    CustOrders: TClientDataSet;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    CustOrdersDataSource: TDataSource;
    DBNavigator1: TDBNavigator;
    CustOrdersCustNo: TFloatField;
    CustOrdersCompany: TStringField;
    CustOrdersAddr1: TStringField;
    CustOrdersAddr2: TStringField;
    CustOrdersCity: TStringField;
    CustOrdersState: TStringField;
    CustOrdersZip: TStringField;
    CustOrdersCountry: TStringField;
    CustOrdersPhone: TStringField;
    CustOrdersFAX: TStringField;
    CustOrdersTaxRate: TFloatField;
    CustOrdersContact: TStringField;
    CustOrdersLastInvoiceDate: TDateTimeField;
    CustOrdersOrderQuery: TDataSetField;
    OrderDSDataSource: TDataSource;
    OrderDS: TClientDataSet;
    OrderDSTotalPerCustomer: TAggregateField;
    Button1: TButton;
    CustQueryCustNo: TFloatField;
    CustQueryCompany: TStringField;
    CustQueryAddr1: TStringField;
    CustQueryAddr2: TStringField;
    CustQueryCity: TStringField;
    CustQueryState: TStringField;
    CustQueryZip: TStringField;
    CustQueryCountry: TStringField;
    CustQueryPhone: TStringField;
    CustQueryFAX: TStringField;
    CustQueryTaxRate: TFloatField;
    CustQueryContact: TStringField;
    CustQueryLastInvoiceDate: TDateTimeField;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBNavigator2: TDBNavigator;
    OrderDSOrderTotalPerShipMethod: TAggregateField;
    DBEdit3: TDBEdit;
    Button2: TButton;
    DBTextShipMethod: TDBEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   CustOrders.Active := True;
   OrderDS.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   OrderDS.IndexName := 'ShipVIA';
   DBTextShipMethod.DataField := 'ShipVIA';
   CustOrders.First;
end;

end.
