unit CachedUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, Db, IBQuery;

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
    Panel2: TPanel;
    ApplyUpdatesBtn: TButton;
    CancelUpdatesBtn: TButton;
    RevertRecordBtn: TButton;
    ReExecuteButton: TButton;
    RadioGroup1: TRadioGroup;
    btnUpdateStatus: TButton;
    procedure ApplyUpdatesBtnClick(Sender: TObject);
    procedure ToggleUpdateMode(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure CancelUpdatesBtnClick(Sender: TObject);
    procedure RevertRecordBtnClick(Sender: TObject);
    procedure UpdateRecordsToShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReExecuteButtonClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnUpdateStatusClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TIBCustomDataSet;
    procedure SetControlStates(Enabled: Boolean);
  public
    { Public declarations }
  end;

var
  CacheDemoForm: TCacheDemoForm;

implementation

{$R *.dfm}

uses
  About, ErrForm, DataMod, typInfo;

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
end;

procedure TCacheDemoForm.FormCreate(Sender: TObject);
begin
  FDataSet := CacheData.CacheDS.DataSet as TIBCustomDataSet;
  FDataset.Close;
  SetControlStates(true);
  FDataSet.Open;
end;

procedure TCacheDemoForm.ToggleUpdateMode(Sender: TObject);
var
  NewState : Boolean;
begin
  { Toggle the state of the CachedUpdates property }
  if IsPublishedProp(FDataset, 'CachedUpdates') then
  begin
    FDataset.Close;
    NewState := not Boolean(GetOrdProp(FDataset, 'CachedUpdates'));
    SetOrdProp(FDataSet, 'CachedUpdates', Integer(NewState));
    { Enable/Disable Controls }
    SetControlStates(NewState);
    FDataset.Open;
  end;
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
  UpdRecTypes : TIBUpdateRecordTypes;
begin
  UpdRecTypes := [];
  if UnModifiedCB.Checked then
    Include(UpdRecTypes, cusUnModified);
  if ModifiedCB.Checked then
    Include(UpdRecTypes, cusModified);
  if InsertedCB.Checked then
    Include(UpdRecTypes, cusInserted);
  if DeletedCB.Checked then
    Include(UpdRecTypes, cusDeleted);
  FDataSet.UpdateRecordTypes := UpdRecTypes;
end;

procedure TCacheDemoForm.ReExecuteButtonClick(Sender: TObject);
begin
  FDataSet.Close;
  FDataSet.Open;
end;

procedure TCacheDemoForm.RadioGroup1Click(Sender: TObject);
var
  NewDataset : TIBCustomDataset;
begin
  case TRadioGroup(Sender).ItemIndex of
    0 : NewDataset := CacheData.IBCacheQuery;
    1 : NewDataset := CacheData.IBCachedDataSet;
    else
      NewDataset := CacheData.IBCachedTable;
  end;
  if NewDataSet <> FDataset then
  begin
    if FDataset.UpdatesPending then
      if MessageDlg('Updates Pending.  Are you certain you want to discard?', mtConfirmation, [mbYes, mbNo], 0) = IDNO then
      begin
        RadioGroup1.ItemIndex := FDataset.Tag;
        Exit;
      end;
    FDataset.Close;
    FDataset := NewDataset;
    CacheData.CacheDS.DataSet := FDataset;
    FDataset.Open;
  end;
end;

procedure TCacheDemoForm.btnUpdateStatusClick(Sender: TObject);
begin
  case FDataset.UpdateStatus of
    usUnmodified : ShowMessage('Unmodified');
    usModified : ShowMessage('Modified');
    usInserted : ShowMessage('Inserted');
    usDeleted : ShowMessage('Deleted');
  end;
end;

end.
