unit IssuesClientUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, SoapLinked, InvokeRegistry, IssuesServerUnit,
  StdCtrls, DBClient, Grids, DBGrids, DBCtrls, XSBuiltIns;

type

  TErrorIDs = array of Integer;

  TClientForm = class(TForm)
    Edit1: TEdit;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Owner: TStringField;
    ClientDataSet1Date_Opened: TDateField;
    ClientDataSet1Issue: TMemoField;
    ClientDataSet1ISSUE_ID: TIntegerField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    Button3: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet1AfterEdit(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    Delta: TIssueArray;
    NoEvents: Boolean;
    Rows: Integer;
    FUpdateType: TIssueUpdateType;
    IssuesData: TIssueArray;
    RIO: TLinkedRIO;
    GetIssues: IIssues;
    procedure ClearDelta(ErrorIDS: TErrorIDs);
    procedure CreateDataset;
    procedure UpdateChanges;
    procedure GetIssuesData;
    function IdFound(ID: Integer; ErrorArray: TErrorIds): Boolean;
    procedure SetDlgReadOnly;
    function ShowUpdateErrors(Error: TIssueError): Boolean;
    procedure UpdateDelta(NewIssue: Tissue; OldID: Integer);
    procedure UpdateDataset(DataSet: TDataSet; NewIssue: Tissue; OldID: Integer);
    procedure UpdateDatasets(NewIssue: Tissue; OldID: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation
{$R *.dfm}

uses DSIntf, IssueErrors;


procedure TClientForm.FormCreate(Sender: TObject);
begin
  SetLength(Delta,0);
  RIO := TLinkedRIO.Create(Nil);
  GetIssues := Rio As IIssues;
end;

procedure TClientForm.FormDestroy(Sender: TObject);
begin
  ClearDelta(Nil);
end;

procedure TClientForm.CreateDataSet;
begin
  NoEvents := True;
  ClientDataSet1.Close;
  ClientDataSet1.Data := NULL;
  ClientDataSet1.CreateDataSet;
  IssueArrayToDataSet(ClientDataSet1, IssuesData, Rows);
  NoEvents := False;
end;

procedure TClientForm.GetIssuesData;
begin
  Rows := GetIssues.RetrieveIssues(Edit1.Text, IssuesData);
  CreateDataSet;
  ClearDelta(Nil);
end;

procedure TClientForm.SetDlgReadOnly;
begin
  UpdateErrorDlg.Edit1.ReadOnly := False;
  UpdateErrorDlg.Edit2.ReadOnly := False;
  UpdateErrorDlg.Edit3.ReadOnly := False;
end;

procedure TClientForm.UpdateDelta(NewIssue: Tissue; OldID: Integer);
var
  I: Integer;
begin
  for I := 0 to Length(Delta) -1 do
  begin
    if Delta[I].ID = OldID then
    begin
      Delta[I].DateOpened := NewIssue.DateOpened;
      Delta[I].Owner := NewIssue.Owner;
      Delta[I].ID := NewIssue.ID;
      break
    end;
  end;
end;

procedure TClientForm.UpdateDataset(DataSet: TDataSet; NewIssue: Tissue; OldID: Integer);
begin
  DataSet.First;
  while not DataSet.eof do
  begin
    if DataSet.Fields[0].Value = OldID then
    begin
      DataSet.Edit;
      DataSet.Fields[2].Value := NewIssue.DateOpened.AsDateTime;
      DataSet.Fields[1].Value := NewIssue.Owner;
      DataSet.Fields[0].Value := NewIssue.ID;
      DataSet.Post;
      break;
    end;
    DataSet.Next;
  end;
  DataSet.First;
end;

procedure TClientForm.UpdateDatasets(NewIssue: Tissue; OldID: Integer);
begin
  NoEvents := True;
  UpdateDelta(NewIssue, OldId);
  UpdateDataSet(ClientDataSet1, NewIssue, OldId);
  NoEvents := False;
end;

function TClientForm.ShowUpdateErrors(Error: TIssueError): Boolean;
var
  DlgRslt, OldId: Integer;
begin
  OldId := Error.FailedRecord.ID;
  UpdateErrorDlg.issue := Error.FailedRecord;
  UpdateErrorDlg.Edit1.Text := IntToStr(Error.FailedRecord.ID);
  UpdateErrorDlg.Edit2.Text := Error.FailedRecord.Owner;
  UpdateErrorDlg.Edit3.Text := DateToStr(Error.FailedRecord.DateOpened.AsDateTime);
  UpdateErrorDlg.DataSet := ClientDataSet1;
//  UpdateErrorDlg.Delta := Delta;
  UpdateErrorDlg.Memo1.Lines.Clear;
  UpdateErrorDlg.Memo1.Lines.Add(Error.ErrorMsg);
  DlgRslt := UpdateErrorDlg.ShowModal;
  SetDlgReadOnly;
  if DlgRslt <> mrCancel then
    UpdateDataSets(UpdateErrorDlg.Issue, OldId);
  if DlgRslt = mrRetry then
    UpdateChanges;
  Result := DlgRslt <> mrCancel;
end;

function TClientForm.IdFound(ID: Integer; ErrorArray: TErrorIds): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Length(ErrorArray) -1 do
    if ID = ErrorArray[I] then
      exit;
  Result := False;
end;

procedure TClientForm.ClearDelta(ErrorIDS: TErrorIDs);
var
  I, J: Integer;
begin
  if Length(ErrorIDS) = 0 then
  begin
    for I := 0 to Length(Delta) -1 do
      Delta[I].Free;
    SetLength(Delta, 0);
  end else
  begin
    for I := 0 to Length(Delta) -1 do
    begin
    if not IdFound(Delta[I].ID, ErrorIDS) then
      begin
        for J := Length(Delta) -2 to I do
          Delta[J] := Delta[J+1];
        SetLength(Delta, Length(Delta)-1);
      end;
    end;
  end;
end;

procedure TClientForm.UpdateChanges;
var
  I, Errors: Integer;
  IssueErrors: TErrorArray;
  MoreErrors: Boolean;
  IDArray: TErrorIDs;
begin
  if Length(Delta) > 0 then
  begin
    Errors := GetIssues.PutIssues(Delta, Length(Delta), IssueErrors);
    SetLength(IDArray, Errors);
    for I := 0 to Errors - 1 do
    begin
      MoreErrors := ShowUpdateErrors(IssueErrors[I]);
      IDArray[I] := IssueErrors[I].FailedRecord.ID;
      IssueErrors[I].Free;
      if not MoreErrors then
      begin
        IDArray := Nil;
        break;
      end
    end;
    ClearDelta(IDArray);
  end;
end;

procedure TClientForm.ClientDataSet1AfterPost(DataSet: TDataSet);
var
  I, Current: Integer;
begin
  if NoEvents then exit;
  Current := 0;
  for I := 0 to Length(Delta) -1 do
  begin
    if Delta[I].ID = ClientDataSet1.Fields[0].Value then
    begin
      Current := I;
      break;
    end;
  end;
  if Current = 0 then
  begin
    SetLength(Delta, Length(Delta) + 1);
    Current := Length(Delta)-1;
    Delta[Current] := TIssue.Create;
    Delta[Current].DateOpened := TXSDateTime.Create;
  end;
  Delta[Current].ID := ClientDataSet1.Fields[0].Value;
  Delta[Current].Owner := ClientDataSet1.Fields[1].Value;
  Delta[Current].DateOpened.AsDateTime := ClientDataSet1.Fields[2].Value;
  Delta[Current].Issue := ClientDataSet1.Fields[3].Value;
  Delta[Current].UpdateKind := FUpdateType;
end;

procedure TClientForm.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  if not NoEvents then
    FUpdateType := utUpdateInsert;
end;

procedure TClientForm.ClientDataSet1AfterEdit(DataSet: TDataSet);
begin
  if not NoEvents then
    FUpdateType := utUpdateUpdate;
end;

procedure TClientForm.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
  if not NoEvents then
    FUpdateType := utUpdateDelete;
end;

procedure TClientForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #9] then
  begin
    GetIssuesData;
    DBGrid1.SetFocus;
  end;  
end;

procedure TClientForm.Button3Click(Sender: TObject);
begin
  UpdateChanges;
end;

end.
