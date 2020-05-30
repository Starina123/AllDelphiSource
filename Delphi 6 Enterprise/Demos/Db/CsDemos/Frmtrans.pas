unit Frmtrans;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs, BDE;

type
  TFrmTransDemo = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BtnUndoEdits: TSpeedButton;
    BtnCommitEdits: TSpeedButton;
    procedure BtnCommitEditsClick(Sender: TObject);
    procedure BtnUndoEditsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmTransDemo: TFrmTransDemo;

implementation

uses DmCSDemo;

{$R *.dfm}

procedure TFrmTransDemo.FormShow(Sender: TObject);
begin
  DmEmployee.EmployeeDatabase.StartTransaction;
  DmEmployee.EmployeeTable.Open;
end;

procedure TFrmTransDemo.FormHide(Sender: TObject);
begin
  DmEmployee.EmployeeDatabase.Commit;
end;

procedure TFrmTransDemo.BtnCommitEditsClick(Sender: TObject);
begin
  if DmEmployee.EmployeeDatabase.InTransaction and
     (MessageDlg('Are you sure you want to commit your changes?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DmEmployee.EmployeeDatabase.Commit;
    DmEmployee.EmployeeDatabase.StartTransaction;
    DmEmployee.EmployeeTable.Refresh;
  end else
    MessageDlg('Can''t Commit Changes: No Transaction Active', mtError, [mbOk], 0);
end;

procedure TFrmTransDemo.BtnUndoEditsClick(Sender: TObject);
begin
  if DmEmployee.EmployeeDatabase.InTransaction and
    (MessageDlg('Are you sure you want to undo all changes made during the ' +
       'current transaction?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
     DmEmployee.EmployeeDatabase.Rollback;
     DmEmployee.EmployeeDatabase.StartTransaction;
     DmEmployee.EmployeeTable.Refresh;
   end else
     MessageDlg('Can''t Undo Edits: No Transaction Active', mtError, [mbOk], 0);
end;

end.
