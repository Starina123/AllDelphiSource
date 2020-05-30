unit CachedUp;

{ This demo uses the IBLOCAL alias which is setup by the install program
  when you install Delphi and you have installed Local Interbase.

  See the file ABOUT.TXT for a description of this demo. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids, DBGrids, TypInfo, StdCtrls, Menus, ExtCtrls, DBCtrls,
  Buttons;

type
  TCacheDemoForm = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    miAbout: TMenuItem;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    UnmodifiedCB: TCheckBox;
    ModifiedCB: TCheckBox;
    InsertedCB: TCheckBox;
    DeletedCB: TCheckBox;
    Panel1: TPanel;
    CachedUpdates: TCheckBox;
    UseUpdateSQL: TCheckBox;
    Panel2: TPanel;
    ApplyUpdatesBtn: TButton;
    CancelUpdatesBtn: TButton;
    RevertRecordBtn: TButton;
    ReExecuteButton: TButton;
    procedure ApplyUpdatesBtnClick(Sender: TObject);
    procedure ToggleUpdateMode(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure CancelUpdatesBtnClick(Sender: TObject);
    procedure RevertRecordBtnClick(Sender: TObject);
    procedure UpdateRecordsToShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReExecuteButtonClick(Sender: TObject);
    procedure UseUpdateSQLClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDBDataSet;
    procedure SetControlStates(Enabled: Boolean);
  public
    { Public declarations }
  end;

var
  CacheDemoForm: TCacheDemoForm;

implementation

{$R *.dfm}

uses
  About, ErrForm, DataMod, Variants;

{ This method enables and disables controls when cached updates are
  turned on and off }

procedure TCacheDemoForm.SetControlStates(Enabled: Boolean);
begin
  ApplyUpdatesBtn.Enabled := Enabled;
  CancelUpdatesBtn.Enabled := Enabled;
  RevertRecordBtn.Enabled := Enabled;
  UnmodifiedCB.Enabled := Enabled;
  ModifiedCB.Enabled := Enabled;
  InsertedCB.Enabled := Enabled;
  DeletedCB.Enabled := Enabled;
  UseUpdateSQL.Enabled := Enabled;
end;

procedure TCacheDemoForm.FormCreate(Sender: TObject);
begin
  FDataSet := CacheData.CacheDS.DataSet as TDBDataSet;
  FDataSet.CachedUpdates := CachedUpdates.Checked;
  SetControlStates(FDataSet.CachedUpdates);
  FDataSet.Open;
end;

procedure TCacheDemoForm.ToggleUpdateMode(Sender: TObject);
begin
  { Toggle the state of the CachedUpdates property }
  FDataSet.CachedUpdates := not FDataSet.CachedUpdates;
  { Enable/Disable Controls }
  SetControlStates(FDataSet.CachedUpdates);
end;

procedure TCacheDemoForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDialog;
end;

procedure TCacheDemoForm.ApplyUpdatesBtnClick(Sender: TObject);
begin
  FDataSet.Database.ApplyUpdates([FDataSet]);
end;

procedure TCacheDemoForm.CancelUpdatesBtnClick(Sender: TObject);
begin
 FDataSet.CancelUpdates;
end;

procedure TCacheDemoForm.RevertRecordBtnClick(Sender: TObject);
begin
  FDataSet.RevertRecord;
end;

{ This event is triggered when the user checks or unchecks one
  of the "Show Records" check boxes.  It translates the states
  of the checkboxes into a set value which is required by the
  UpdateRecordTypes property of TDataSet.  The UpdateRecordTypes
  property controls what types of records are included in the
  dataset.  The default is to show only unmodified modified
  and inserted records.  To "undelete" a record, you would
  check the Deleted checkbox, then position the grid to the
  row you want to undelete and finally click the Revert Record
  Button }

procedure TCacheDemoForm.UpdateRecordsToShow(Sender: TObject);
var
  UpdRecTypes : TUpdateRecordTypes;
begin
  UpdRecTypes := [];
  if UnModifiedCB.Checked then
    Include(UpdRecTypes, rtUnModified);
  if ModifiedCB.Checked then
    Include(UpdRecTypes, rtModified);
  if InsertedCB.Checked then
    Include(UpdRecTypes, rtInserted);
  if DeletedCB.Checked then
    Include(UpdRecTypes, rtDeleted);
  FDataSet.UpdateRecordTypes := UpdRecTypes;
end;

procedure TCacheDemoForm.ReExecuteButtonClick(Sender: TObject);
begin
  FDataSet.Close;
  FDataSet.Open;
end;

procedure TCacheDemoForm.UseUpdateSQLClick(Sender: TObject);
begin
  FDataSet.Close;
  if UseUpdateSQL.Checked then
    FDataSet.UpdateObject := CacheData.UpdateSQL
  else
    FDataSet.UpdateObject := nil;
  FDataSet.Open;
end;

end.
