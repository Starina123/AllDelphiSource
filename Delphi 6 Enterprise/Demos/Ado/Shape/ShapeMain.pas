unit ShapeMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Customers: TADODataSet;
    Orders: TADODataSet;
    CustSource: TDataSource;
    OrderSource: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    CustomersCustNo: TFloatField;
    CustomersCompany: TWideStringField;
    CustomersAddr1: TWideStringField;
    CustomersAddr2: TWideStringField;
    CustomersCity: TWideStringField;
    CustomersState: TWideStringField;
    CustomersZip: TWideStringField;
    CustomersCountry: TWideStringField;
    CustomersPhone: TWideStringField;
    CustomersFAX: TWideStringField;
    CustomersTaxRate: TFloatField;
    CustomersContact: TWideStringField;
    CustomersLastInvoiceDate: TDateField;
    CustomersOrders: TDataSetField;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersSaleDate: TDateField;
    OrdersShipDate: TDateField;
    OrdersEmpNo: TIntegerField;
    OrdersShipToContact: TWideStringField;
    OrdersShipToAddr1: TWideStringField;
    OrdersShipToAddr2: TWideStringField;
    OrdersShipToCity: TWideStringField;
    OrdersShipToState: TWideStringField;
    OrdersShipToZip: TWideStringField;
    OrdersShipToCountry: TWideStringField;
    OrdersShipToPhone: TWideStringField;
    OrdersShipVIA: TWideStringField;
    OrdersPO: TWideStringField;
    OrdersTerms: TWideStringField;
    OrdersPaymentMethod: TWideStringField;
    OrdersItemsTotal: TFloatField;
    OrdersTaxRate: TFloatField;
    OrdersFreight: TFloatField;
    OrdersAmountPaid: TFloatField;
    Panel1: TPanel;
    ProviderLabel: TLabel;
    DataProviderLabel: TLabel;
    DataSourceLabel: TLabel;
    Label4: TLabel;
    Provider: TEdit;
    DataProvider: TEdit;
    DataSource: TEdit;
    OpenButton: TButton;
    procedure OpenButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.OpenButtonClick(Sender: TObject);
const
  ConnStr = 'Provider=%s;Data Provider=%s;Data Source=%s';
begin
  if not ADOConnection1.Connected then
    ADOConnection1.ConnectionString := Format(ConnStr, [Provider.Text,
      DataProvider.Text, DataSource.Text]);
  Customers.Open;
  Orders.Open;
end;

end.
