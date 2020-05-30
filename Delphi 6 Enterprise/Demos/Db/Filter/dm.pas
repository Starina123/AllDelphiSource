Unit DM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TDM1 = class(TDataModule)
    Customer: TTable;
    CustomerSource: TDataSource;
    SQLCustomer: TQuery;
    SQLOrders: TQuery;
    OrdersSource: TDataSource;
    SQLOrdersOrderNo: TFloatField;
    SQLOrdersCustno: TFloatField;
    SQLOrdersSaleDate: TDateTimeField;
    SQLOrdersShipDate: TDateTimeField;
    SQLOrdersEmpNo: TIntegerField;
    SQLOrdersAmountPaid: TCurrencyField;
    procedure DM1Create(Sender: TObject);
    procedure SQLOrdersFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  public
    { The variable below will be accessible to to CustView (because it is
      public and this unit is in its uses).  It is used in
      SQLOrdersFilterRecord to set the Filter amount for the Orders Query. }
    OrdersFilterAmount: Extended;
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

procedure TDM1.DM1Create(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    SQLCustomer.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TDM1.SQLOrdersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  { This is only called if the Filtered property is True, set
    dynamically by the CheckBox on the CustView form. }
  Accept := SQLOrdersAmountPaid.Value >= OrdersFilterAmount;
end;

end.
