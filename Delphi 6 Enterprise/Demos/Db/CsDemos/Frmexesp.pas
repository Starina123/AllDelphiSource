unit Frmexesp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Mask, Grids,
  ExtCtrls;

type
  TFrmExecProc = class(TForm)
    DBGrid1: TDBGrid;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditCUST_NO: TDBEdit;
    Label2: TLabel;
    EditCUSTOMER: TDBEdit;
    Label3: TLabel;
    EditCONTACT_FIRST: TDBEdit;
    EditCONTACT_LAST: TDBEdit;
    EditPHONE_NO: TDBEdit;
    Label6: TLabel;
    EditADDRESS_LINE: TDBEdit;
    EditADDRESS_LINE2: TDBEdit;
    EditCITY: TDBEdit;
    EditSTATE_PROVINCE: TDBEdit;
    EditCOUNTRY: TDBEdit;
    EditPOSTAL_CODE: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    BtnShipOrder: TSpeedButton;
    BitBtn1: TBitBtn;
    SalesSource: TDataSource;
    procedure SalesSourceDataChange(Sender: TObject; Field: TField);
    procedure BtnShipOrderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmExecProc: TFrmExecProc;

implementation

uses DmCSDemo, Variants;

{$R *.dfm}

procedure TFrmExecProc.FormShow(Sender: TObject);
begin
  DmEmployee.SalesTable.Open;
  DmEmployee.CustomerTable.Open;
  { Enable DataEvents from the SalesTable for this form now }
  SalesSource.Enabled := True;
end;

procedure TFrmExecProc.FormHide(Sender: TObject);
begin
  { Disable DataEvents from the SalesTable for this form now }
  SalesSource.Enabled := False;
end;

procedure TFrmExecProc.SalesSourceDataChange(Sender: TObject; Field: TField);
begin
  if  DmEmployee.SalesTable['ORDER_STATUS'] <> NULL then
  BtnShipOrder.Enabled :=
    AnsiCompareText(DmEmployee.SalesTable['ORDER_STATUS'], 'SHIPPED') <> 0;
end;

procedure TFrmExecProc.BtnShipOrderClick(Sender: TObject);
begin
  with DmEmployee do
  begin
    ShipOrderProc.Params[0].AsString := SalesTable['PO_NUMBER'];
    ShipOrderProc.ExecProc;
    SalesTable.Refresh;
  end;
end;

end.
