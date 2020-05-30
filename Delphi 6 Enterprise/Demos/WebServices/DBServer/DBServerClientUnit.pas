unit DBServerClientUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, SOAPLinked, InvokeRegistry,
  StdCtrls, DBClient, Grids, DBGrids, DBCtrls, XSBuiltIns, SoapDBServerUnit,
  ExtCtrls;

type

  TClientForm = class(TForm)
    Edit1: TEdit;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet1AfterEdit(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet); 
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    NoEvents: Boolean;
    FUpdateInfo: TUpdateInfo;
    FUpdateType: TUpdateType;
    RIO: TLinkedRIO;
    WebServicesDS: IWebServicesDataSet;
    SoapDataPacket: TSoapDataPacket;
    Delta: TSoapDataPacket;
    FUpdateErrors: TDBErrorArray;
    procedure ClearDeletedFromPacket;
    procedure UpdateChanges;
    procedure GetIssuesData;
//    function InPacket(RowArray: TRowArray; ErrorArray: TErrorIds): Boolean;
//    function ShowUpdateErrors(Error: TIssueError): Boolean;
    procedure RefreshDelta;
(*    procedure UpdateDelta(NewIssue: Tissue; OldID: Integer);
    procedure UpdateDataset(DataSet: TDataSet; NewIssue: Tissue; OldID: Integer);
    procedure UpdateDatasets(NewIssue: Tissue; OldID: Integer); *)
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation
{$R *.dfm}

uses DSIntf;


procedure TClientForm.FormCreate(Sender: TObject);
begin
  RIO := TLinkedRIO.Create(Nil);
  WebServicesDS := Rio As IWebServicesDataSet;
  FUpdateInfo := TUpdateInfo.Create;
  FUpdateInfo.UseIndexMetadata := True;
end;

procedure TClientForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUpdateInfo);
end;

procedure TClientForm.GetIssuesData;
begin
  WebServicesDS.RetrieveDataSet(Edit1.Text, SoapDataPacket, FUpdateInfo);
  if FUpdateInfo.ErrorCount > 0 then
  begin
    ShowMessage(FUpdateInfo.ErrorMessage);
    exit;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.Data := NULL;
  DataSetFromColumnDescArray(SoapDataPacket.ColDescArray, ClientDataSet1, True);
  ClientDataSet1.CreateDataSet;
  DataSetFromRowArray(ClientDataSet1, SoapDataPacket.RowArray);
  RefreshDelta;
end;

procedure TClientForm.ClearDeletedFromPacket;
var
  I: Integer;
begin
  for I := 0 to Length(Delta.RowArray) -1 do
  begin
    if Delta.RowArray[I].UpdateType = utUpdateDelete then
      SoapDataPacket.ClearRowByRowID(Delta.RowArray[I].rowid);
  end;
end;


procedure TClientForm.RefreshDelta;
begin
  if Assigned(Delta) then
  begin
    ClearDeletedFromPacket;
    if Length(FUpdateErrors) = 0 then
      Delta.ClearRows;
  end else
    Delta := SoapDataPacket.CloneStructure;
end;

(*procedure TClientForm.UpdateDelta(NewIssue: Tissue; OldID: Integer);
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
end; *)

(*function TClientForm.InPacket(RowArray: TRowArray; ErrorArray: TErrorIds): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Length(ErrorArray) -1 do
    if ID = ErrorArray[I] then
      exit;
  Result := False;
end; *)

procedure TClientForm.UpdateChanges;
var
  Errors: Integer;
begin
  if not Assigned(Delta) then exit;
  if Length(Delta.RowArray) > 0 then
  begin
    Errors := WebServicesDS.UpdateDataSet(Delta, FUpdateInfo, FUpdateErrors);
    RefreshDelta;
  end;
end;


function CompareValues(Value: Variant; Field: TField): Boolean;
var
  DT: TDateTime;
  Dbl: Double;
begin
  if Field.DataType = ftTimeStamp then
    Result := (Field.AsDateTime = Value)
  else if Field.DataType = ftFMTBcd then
    Result := (Field.AsCurrency = Value)
  else
    Result := (Value = Field.Value);
end;

procedure TClientForm.ClientDataSet1AfterPost(DataSet: TDataSet);
var
  I, Current, PacketCurrent: Integer;
begin
  if NoEvents then exit;
  PacketCurrent := ClientDataSet1.RecNo-1;
  Current := -1;
  for I := 0 to Length(Delta.RowArray) -1 do
  begin
    if Delta.RowArray[I].RowID = ClientDataSet1.RecNo then
    begin
      Current := I;
      break;
    end;
  end;
  if Current = -1 then
  begin
    if FUpdateType = utUpdateInsert then
      PacketCurrent := SoapDataPacket.IncRowSize -1;
    Current := Delta.IncRowSize -1;
    Delta.RowArray[Current] := SoapDataPacket.RowArray[PacketCurrent].Clone;
    if FUpdateType = utUpdateInsert then
      Delta.RowArray[Current].ClearValues;
  end;
  Delta.RowArray[Current].UpdateType := FUpdateType;
  for I := 0 to Length(Delta.RowArray[Current].FieldValueArray) -1 do
  begin
    if (FUpdateType = utUpdateInsert) or
       not (CompareValues(Delta.RowArray[Current].FieldValueArray[I].Value, ClientDataSet1.Fields[I])) then
    begin
      Delta.RowArray[Current].FieldValueArray[I].Changed := True;
      if VarIsNull(Delta.RowArray[Current].FieldValueArray[I].OldValue) then
        Delta.RowArray[Current].FieldValueArray[I].OldValue :=
          SoapDataPacket.RowArray[PacketCurrent].FieldValueArray[I].Value;
      Delta.RowArray[Current].FieldValueArray[I].Value := ClientDataSet1.Fields[I].Value;
    end;
  end;
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
  begin
    FUpdateType := utUpdateDelete;
    ClientDataSet1AfterPost(DataSet);
  end;
end;

procedure TClientForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #9] then
  begin
    NoEvents := True;
    GetIssuesData;
    NoEvents := False;
    DBGrid1.SetFocus;
  end;
end;

procedure TClientForm.Button3Click(Sender: TObject);
begin
  UpdateChanges;
end;


end.
