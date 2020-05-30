unit IssuesServerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, InvokeRegistry, XSBuiltIns;
const
  SDriver = 'INTERBASE';
  SConnection = 'IBLOCAL';
  SIssuesTable = 'SOAPISSUES';
  SID_FIELD = 'ISSUE_ID';
  SOWNER_FIELD = 'OWNER';
  SDATE_OPENED_FIELD = 'DATE_OPENED';
  SISSUE_FIELD = 'ISSUE';
  IssueFieldCount = 4;
  SResolutionTable = 'SOAPRESOLUTION';
  SRESOLUTION_DATE = 'DATE_RESOLVED';
  SRESOLUTION_FIELD = 'RESOLUTION';
  SUPDATE_FIELD = 'UPDATETYPE';
  SOwnerIssuesQuery = 'select * from ' + SIssuesTable + ' where ' +
                 SOWNER_FIELD + ' = :P1 order by ' + SID_FIELD;
  SIDIssuesQuery = 'select * from ' + SIssuesTable + ' where ' +
                 SID_FIELD + ' = :P1 order by ' + SID_FIELD;
  SCreateIssuesTableSQL = 'create table ' + SIssuesTable
      + '( ' + SID_FIELD + ' INTEGER NOT NULL,' + SOWNER_FIELD
      + ' VARCHAR(25), ' + SDATE_OPENED_FIELD +
      ' DATE, ' + SISSUE_FIELD + ' BLOB SUB_TYPE 1 SEGMENT SIZE 100,' +
      ' PRIMARY KEY (' + SID_FIELD + ') )';
  SCreateResolutionTableSQL = 'create table ' + SResolutionTable
      + '( ' + SID_FIELD + ' INTEGER NOT NULL,' + SRESOLUTION_DATE +
      ' DATE, ' + SRESOLUTION_FIELD + ' BLOB SUB_TYPE 1 SEGMENT SIZE 100)';
  SUpdateIssuesTableSQL = 'update ' + SISSUESTABLE + ' set ' + SOWNER_FIELD +
      ' = :P2, ' + SDATE_OPENED_FIELD + '= :P3, ' + SISSUE_FIELD + '= :P4 WHERE ' +
      SID_FIELD + ' = :P1';
  SInsertIssuesTableSQL = 'insert into ' + SISSUESTABLE + ' VALUES( :P1, :P2, :P3, :P4 )';
  SDeleteIssuesTableSQL = 'delete from ' + SISSUESTABLE + ' where ' +
      SID_FIELD + ' = :P1';
  SInsertFirst1SQL = 'insert into ' + SISSUESTABLE +
     ' ( ' + SID_FIELD + ', ' + SOWNER_FIELD + ' , ' +
     SDATE_OPENED_FIELD + ') ' +
     ' VALUES( 1, ' + '''Brian Jones''' + ', ' + '''3/21/2001'' )';
  SInsertFirst2SQL = 'insert into ' + SISSUESTABLE +
     ' ( ' + SID_FIELD + ', ' + SOWNER_FIELD + ' , ' +
     SDATE_OPENED_FIELD + ') ' +
     ' VALUES( 2, ' + '''Brian Jones''' + ', ' + '''3/22/2001'' )';
  SInsertFirst3SQL = 'insert into ' + SISSUESTABLE +
     ' ( ' + SID_FIELD + ', ' + SOWNER_FIELD + ' , ' +
     SDATE_OPENED_FIELD + ') ' +
     ' VALUES( 3, ' + '''Brian Jones''' + ', ' + '''3/23/2001'' )';
type

  { forward declarations }

  TIssue = class;

  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TIssueData = class
    private
      FConnection: TSQLConnection;
      FDataSet: TSQLDataSet;
      Tables: TStrings;
    protected
      function TableExists(TableName: string): Boolean;
      procedure CreateTable(Query: string);
      procedure OpenIssueTableFromOwner(FOwner: string);
      procedure OpenIssueTableFromID(FID: Integer);
    public
      constructor Create;
      destructor Destroy; override;
    end;

  TIssueUpdateType = (utUpdateNone, utUpdateInsert, utUpdateUpdate, utUpdateDelete);

  TIssue = class(TRemotable)
  private
    FID: Integer;
    FIssue: String;
    FOwner: String;
    FUpdateType: TIssueUpdateType;
    FDateOpened: TXSDateTime;
  published
    property ID: Integer read FID write FID;
    property Issue: String read FIssue write FIssue;
    property Owner: String read FOwner write FOwner;
    property UpdateKind: TIssueUpdateType read FUpdateType write FUpdateType;
    property DateOpened: TXSDateTime read FDateOpened write FDateOpened;
  end;

  TIssueError = class(TRemotable)
  private
    FErrorMsg: string;
    FFailedRecord: TIssue;
    procedure SetErrorMsg(const Value: string);
    procedure SetFailedRecord(const Value: TIssue);
  published
    property ErrorMsg: string read FErrorMsg write SetErrorMsg;
    property FailedRecord: TIssue read FFailedRecord write SetFailedRecord;
  end;

  TIssueArray = array of TIssue;
  TErrorArray = array of TIssueError;
  
  IIssues = interface(IInvokable)
   ['{CC530C3C-2854-11D5-BF78-00C04F79AB6E}']
    function GetIssues(Owner: String; out Rows: Integer): TIssueArray; stdcall;
    function PutIssue(Value: TIssue; out Error: TIssueError): Integer; stdcall;
    function PutIssues(Values: TIssueArray; Rows: Integer; out Errors: TErrorArray): Integer; stdcall;
    function RetrieveIssues(Owner: String; out Issues: TIssueArray): Integer; stdcall;
  end;

  TIssues = class(TInvokableClass, IIssues)
  published
    function GetIssues(Owner: String; out Rows: Integer): TIssueArray; stdcall;
    function PutIssue(Value: TIssue; out Error: TIssueError): Integer; stdcall;
    function PutIssues(Values: TIssueArray; Rows: Integer; out Errors: TErrorArray): Integer; stdcall;
    function RetrieveIssues(Owner: String; out Issues: TIssueArray): Integer; stdcall;
  end;

{ Utility functions }
function DataSetToIssueArray(ADataSet: TDataSet; out Rows: Integer): TIssueArray;
procedure IssueArrayToDataSet(ADataSet: TDataSet; IssuesData: TIssueArray; const Rows: Integer);

var
  Form1: TForm1;

implementation

uses SoapConst;

var

  Data: TIssueData;

{ Utility functions }

procedure LoadData(ADataSet: TDataSet; Data: TIssue); 
begin
  Data.Owner := ADataSet.FieldByName(SOWNER_FIELD).Value;
  Data.Issue := ADataSet.FieldByName(SISSUE_FIELD).AsString;
  Data.DateOpened := TXSDateTime.Create;
  Data.DateOpened.AsDateTime := ADataSet.FieldByName(SDATE_OPENED_FIELD).AsDateTime;
  Data.ID := ADataSet.FieldByName(SID_FIELD).Value;
  if ADataSet.FieldCount > IssueFieldCount then
    Data.FUpdateType := ADataSet.FieldByName(SUPDATE_FIELD).Value;
end;

procedure IssueArrayToDataSet(ADataSet: TDataSet; IssuesData: TIssueArray; const Rows: Integer);
var
  I : Integer;
begin
  for i := 0 to Rows -1 do
  begin
    ADataSet.Insert;
    ADataSet.FieldByName(SID_FIELD).Value := IssuesData[I].ID;
    ADataSet.FieldByName(SOWNER_FIELD).Value := IssuesData[I].Owner;
    ADataSet.FieldByName(SDATE_OPENED_FIELD).Value := IssuesData[I].DateOpened.AsDateTime;
    ADataSet.FieldByName(SISSUE_FIELD).Value := IssuesData[I].Issue;
    ADataSet.Post;
  end;
  ADataSet.First;
end;

function DataSetToIssueArray(ADataSet: TDataSet; out Rows: Integer): TIssueArray;
begin
  Rows := 0;
  ADataSet.Open;
  while not ADataSet.EOF do
  begin
    Inc(Rows);
    SetLength(Result, Rows);
    Result[Rows-1] := TIssue.Create;
    LoadData(ADataSet, Result[Rows-1]);
    ADataSet.Next;
  end;
end;

{ TIssueData }

procedure TIssueData.OpenIssueTableFromOwner(FOwner: string);
begin
  FDataSet.CommandText := SOwnerIssuesQuery;
  FDataSet.Params[0].DataType := ftString;
  FDataSet.Params[0].Value := FOwner;
  FDataSet.Active := True;
end;

procedure TIssueData.OpenIssueTableFromID(FID: Integer);
begin
  FDataSet.CommandText := SIDIssuesQuery;
  FDataSet.Params[0].DataType := ftInteger;
  FDataSet.Params[0].Value := FID;
  FDataSet.Active := True;
end;

constructor TIssueData.Create;
begin
  FConnection := TSQLConnection.Create(nil);
  FDataSet := TSQLDataSet.Create(nil);
  FDataSet.SQLConnection := FConnection;
  FConnection.LoadParamsOnConnect := True;
  FConnection.DriverName := SDriver;
  FConnection.LoginPrompt := False;
  FConnection.ConnectionName := SConnection;
  if not Self.TableExists(SIssuesTable) then
    Self.CreateTable(SCreateIssuesTableSQL);
  if not Self.TableExists(SResolutionTable) then
    Self.CreateTable(SCreateResolutionTableSQL);
end;

destructor TIssueData.Destroy;
begin
  FreeAndNil(FDataSet);
  FreeAndNil(FConnection);
end;

{ TIssues }

function TIssues.GetIssues(Owner: String; out Rows: Integer): TIssueArray; stdcall;
begin
  try
    Data.OpenIssueTableFromOwner(Owner);
    Result := DataSetToIssueArray(Data.FDataSet, Rows);
  finally
    Data.FDataSet.Close;
  end;
end;

function TIssues.RetrieveIssues(Owner: String; out Issues: TIssueArray): Integer; stdcall;
begin
  try
    Data.OpenIssueTableFromOwner(Owner);
    Issues := DataSetToIssueArray(Data.FDataSet, Result);
  finally
    Data.FDataSet.Close;
  end;
end;

function TIssues.PutIssue(Value: TIssue; out Error: TIssueError): Integer; stdcall;
var
  SQL: string;
begin
  Error := Nil;
  Result := 0;
  case Value.FUpdateType of
    utUpdateNone,    // workaround for bug: remove this code!!!
    utUpdateUpdate:
      SQL := SUpdateIssuesTableSQL;
    utUpdateInsert:
      SQL := SInsertIssuesTableSQL;
    utUpdateDelete:
      SQL := SDeleteIssuesTableSQL;
    else
      Result := 1;
  end;
  if Result = 0 then
  begin
    try
      Data.FDataSet.CommandText := SQL;
      Data.FDataSet.ParamByName('P1').DataType := ftInteger;
      Data.FDataSet.ParamByName('P1').Value := Value.FID;
      if Value.FUpdateType <> utUpdateDelete then
      begin
        Data.FDataSet.ParamByName('P2').DataType := ftString;
        Data.FDataSet.ParamByName('P2').Value := Value.FOwner;
        Data.FDataSet.ParamByName('P3').DataType := ftTimeStamp;
        Data.FDataSet.ParamByName('P3').AsString := DateToStr(Value.FDateOpened.AsDateTime);
        Data.FDataSet.ParamByName('P4').DataType := ftMemo;
        Data.FDataSet.ParamByName('P4').Value := Value.FIssue;
      end;
      try
        Data.FDataSet.ExecSQL(False);
      except
        on E: Exception do
        begin
          Error := TIssueError.Create;
          Error.ErrorMsg := E.Message;
          Result := 1;
        end;
      end;
    finally
      Data.FDataSet.Close;
      Data.FDataSet.Prepared := False;
    end;
  end;
end;

function TIssues.PutIssues(Values: TIssueArray; Rows: Integer; out Errors: TErrorArray): Integer; stdcall;
var
  I: Integer;
  Error: TIssueError;
begin
  Result := 0;
  for I := 0 to Rows -1 do
  begin
    Result := Result + PutIssue(Values[I], Error);
    if Assigned(Error) then
    begin
      SetLength(Errors, Result);
      Errors[Result -1] := TIssueError.Create;
      Errors[Result -1].ErrorMsg := Error.ErrorMsg;
      Errors[Result -1].FailedRecord := Values[I];
      FreeAndNil(Error);
    end;
  end;
end;

{ TIssueData }

procedure TIssueData.CreateTable(Query: string);
begin
  FConnection.ExecuteDirect(Query);
  FConnection.ExecuteDirect('COMMIT');
  FConnection.ExecuteDirect(SInsertFirst1SQL);
  FConnection.ExecuteDirect(SInsertFirst2SQL);
  FConnection.ExecuteDirect(SInsertFirst3SQL);
end;

function TIssueData.TableExists(TableName: string): Boolean;
begin
  if not Assigned(Tables) then
  begin
    Tables := TStringList.Create;
    FConnection.GetTableNames(Tables);
  end;
  Result := Tables.IndexOf(TableName) >= 0;
end;
{$R *.dfm}

{ TIssueError }

procedure TIssueError.SetErrorMsg(const Value: string);
begin
  FErrorMsg := Value;
end;

procedure TIssueError.SetFailedRecord(const Value: TIssue);
begin
  FFailedRecord := Value;
end;

Initialization
  InvRegistry.RegisterInterface(TypeInfo(IIssues));
  InvRegistry.RegisterInvokableClass(TIssues);
  RemClassRegistry.RegisterXSClass(TIssue);
  RemClassRegistry.RegisterXSClass(TIssueError);
  RemClassRegistry.RegisterXSInfo(TypeInfo(TIssueArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TErrorArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TIssueUpdateType));
  Data := TIssueData.Create;

finalization

  FreeAndNil(Data);

end.
