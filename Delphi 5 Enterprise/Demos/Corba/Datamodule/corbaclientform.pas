unit CORBAClientForm;

{
  The CorbaConnection Component's Repository ID property is used to
  connect to the Server. Please make sure that the Server is either
  running or registered with OAD (using OADUtil).
  Note that Delphi does not require the complete Repository ID. Both
  the short form, 'CORBAServer/DemoCORBA' or the long form,
  'IDL:CORBAServer/DemoCORBAFactory:1.0' are valid.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, DBCtrls, Db, DBClient, CorbaCon, Buttons,
  StdCtrls, ActnList;

type
  TDemoClientFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CustomerNavigator: TDBNavigator;
    OrdersNavigator: TDBNavigator;
    CustomerGrid: TDBGrid;
    OrdersGrid: TDBGrid;
    Splitter1: TSplitter;
    DemoConnection: TCorbaConnection;
    CustomerCDS: TClientDataSet;
    OrdersCDS: TClientDataSet;
    OrdersSource: TDataSource;
    CustomerSource: TDataSource;
    CustomerCDSCustNo: TFloatField;
    CustomerCDSCompany: TStringField;
    CustomerCDSAddr1: TStringField;
    CustomerCDSAddr2: TStringField;
    CustomerCDSCity: TStringField;
    CustomerCDSState: TStringField;
    CustomerCDSZip: TStringField;
    CustomerCDSCountry: TStringField;
    CustomerCDSPhone: TStringField;
    CustomerCDSFAX: TStringField;
    CustomerCDSTaxRate: TFloatField;
    CustomerCDSContact: TStringField;
    CustomerCDSLastInvoiceDate: TDateTimeField;
    CustomerCDSOrderTable: TDataSetField;
    CustomerAppUpdBtn: TSpeedButton;
    Customer: TLabel;
    Orders: TLabel;
    ActionList: TActionList;
    ApplyUpdates: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ApplyUpdatesExecute(Sender: TObject);
    procedure ApplyUpdatesUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoClientFrm: TDemoClientFrm;

implementation

{$R *.DFM}

procedure TDemoClientFrm.FormCreate(Sender: TObject);
begin
  try
    DemoConnection.Connected := True;
    CustomerCDS.Open;
    OrdersCDS.Open;
  except
    on E:Exception do
      ShowMessage(E.Message+': Server should be running.');
  end;

end;

procedure TDemoClientFrm.ApplyUpdatesExecute(Sender: TObject);
begin
  CustomerCDS.ApplyUpdates(-1);
end;

procedure TDemoClientFrm.ApplyUpdatesUpdate(Sender: TObject);
begin
  ApplyUpdates.Enabled := CustomerCDS.ChangeCount > 0;
end;

end.
