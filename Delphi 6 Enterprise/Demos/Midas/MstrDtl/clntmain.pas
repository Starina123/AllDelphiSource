unit clntmain;

{ This demo uses the IBLOCAL alias which is setup by the install program
  when you install Delphi 5.0 if you have installed Local Interbase.

  This example demonstrates how ClientDataSets can be used in a master-detail
  application. This is the client application.  You must compile and
  run the Server application before running this program.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids, DBGrids, StdCtrls, Mask, Db,
  Buttons;

type
  TClientForm = class(TForm)
    Label2: TLabel;
    MemberGrid: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    DescMemo: TDBMemo;
    ProjectGrid: TDBGrid;
    AddBtn: TButton;
    DeleteBtn: TButton;
    LeaderBtn: TButton;
    ProductCombo: TDBComboBox;
    Toolbar: TPanel;
    DBNavigator1: TDBNavigator;
    ApplyUpdatesBtn: TSpeedButton;
    procedure MemberGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LeaderBtnClick(Sender: TObject);
    procedure ApplyUpdatesBtnClick(Sender: TObject);
  end;

var
  ClientForm: TClientForm;

implementation

uses ClntDM;

{$R *.dfm}

{ Bold the leader in the member list. }
procedure TClientForm.MemberGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DM.ProjectTEAM_LEADER.Value = DM.Emp_ProjEMP_NO.Value then
    MemberGrid.Canvas.Font.Style := [fsBold];
  MemberGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TClientForm.DeleteBtnClick(Sender: TObject);
begin
  DM.Emp_Proj.Delete;
end;

procedure TClientForm.AddBtnClick(Sender: TObject);
begin
  MemberGrid.SetFocus;
  DM.Emp_Proj.Append;
  MemberGrid.EditorMode := True;
end;

{ Set the column width to the width of the grid. }
procedure TClientForm.FormCreate(Sender: TObject);
begin
  MemberGrid.Columns[0].Width := MemberGrid.ClientWidth - GetSystemMetrics(SM_CXVSCROLL);
end;

{ Set the team leader. }
procedure TClientForm.LeaderBtnClick(Sender: TObject);
var
  NewLeader: Integer;
begin
  NewLeader := DM.Emp_ProjEMP_NO.Value;
  if not (DM.Project.State in dsEditModes) then
    DM.Project.Edit;
  DM.ProjectTEAM_LEADER.Value := NewLeader;
  MemberGrid.Refresh;
end;

procedure TClientForm.ApplyUpdatesBtnClick(Sender: TObject);
begin
  DM.ApplyUpdates;
end;

end.
