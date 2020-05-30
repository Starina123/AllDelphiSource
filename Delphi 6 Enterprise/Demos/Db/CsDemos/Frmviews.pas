unit Frmviews;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls;

type
  TFrmViewDemo = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VaryingTableSource: TDataSource;
    Panel2: TPanel;
    VaryingTable: TTable;
    BitBtn1: TBitBtn;
    BtnShowEmployee: TSpeedButton;
    BtnShowPhoneList: TSpeedButton;
    procedure BtnShowEmployeeClick(Sender: TObject);
    procedure BtnShowPhoneListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure ShowTable(ATable: string);
  public
    { public declarations }
  end;

var
  FrmViewDemo: TFrmViewDemo;

implementation

{$R *.dfm}

procedure TFrmViewDemo.ShowTable( ATable: string );
begin
  Screen.Cursor := crHourglass;      { show user something's happening }
  VaryingTable.DisableControls;      { hide data changes from user }
  VaryingTable.Active := FALSE;      { close the table }
  VaryingTable.TableName := ATable;  { update the name }
  VaryingTable.Open;                 { open the table }
  VaryingTable.EnableControls;       { paint the changes }
  Screen.Cursor := crDefault;        { reset the pointer }
end;

procedure TFrmViewDemo.FormShow(Sender: TObject);
begin
  VaryingTable.Open;
end;

procedure TFrmViewDemo.BtnShowEmployeeClick(Sender: TObject);
begin
  ShowTable('EMPLOYEE');
end;

procedure TFrmViewDemo.BtnShowPhoneListClick(Sender: TObject);
begin
  ShowTable('PHONE_LIST');
end;

end.
