
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       BDE Provider                                    }
{                                                       }
{       Copyright (c) 1997, 1998 Inprise Corporation    }
{                                                       }
{*******************************************************}

unit BdeProv;

interface

uses
  Classes, Provider, DB, DBTables, SysUtils, DBClient;

type

  TProvider = class(TDataSetProvider)
  private
    FResolveToDataSet: Boolean;
    FQuery: TQuery;
    FDatabase: TDatabase;
    FRangeActive: Boolean;
    procedure SetResolveToDataSet(Value: Boolean);
  protected
    function FetchParams: OleVariant; override;
    function GetDataSet: TDBDataSet;
    procedure SetDataSet(ADataSet: TDBDataSet);
    function GetKeyFields(const Tablename: string; ADelta: TClientDataSet): string; override;
    procedure SetParamByName(const ParamName: string; const Value: OleVariant); override;
    procedure SetParamByIndex(ParamIndex: Integer; const Value: OleVariant); override;
    function GetParamCount: Integer; override;
    function CreateResolver: TCustomResolver; override;
    procedure ExecSQL(Sender: TObject; SQL: TStringList; Params: TParams);
    procedure GetValues(Sender: TObject; SQL: TStringList; Params: TParams;
      DataSet: TDataSet);
    function GetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError; override;
  public
    constructor Create(AOwner: TComponent); override;
    function ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; override;
    function FetchData(const Packet: OleVariant): OleVariant; override;
    procedure Reset(MetaData: WordBool); override;
    procedure SetParams(Values: OleVariant); override;
  published
    property DataSet: TDBDataSet read GetDataSet write SetDataSet;
    property ResolveToDataSet: Boolean read FResolveToDataSet write SetResolveToDataSet default False;
  end;

procedure UseBdeProv;

implementation

uses StdVcl, BDE, MidConst;

function CreateProvider(Source: TDBDataSet): IProvider;
begin
  with TProvider.Create(Source) do
    begin
      Result := Provider;
      DataSet := Source;
    end;
end;

{ TCachedQuery }

type

  PStmtInfo = ^TStmtInfo;
  TStmtInfo = record
    HashCode: Integer;
    StmtHandle: HDBIStmt;
    SQLText: string;
  end;

  TCachedQuery = class(TQuery)
  private
    FStmtList: TList;
    function GetStmtInfo(SQL: PChar): PStmtInfo;
  protected
    procedure GetStatementHandle(SQLText: PChar); override;
    procedure FreeStatement; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearStatements;
  end;

constructor TCachedQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FStmtList := TList.Create;
end;

destructor TCachedQuery.Destroy;
begin
  ClearStatements;
  FStmtList.Free;
  inherited Destroy;
end;

procedure TCachedQuery.GetStatementHandle(SQLText: PChar);
var
  Info: PStmtInfo;
begin
  Info := GetStmtInfo(SQLText);
  if not Assigned(Info.StmtHandle) then
  begin
    inherited GetStatementHandle(SQLText);
    Info.SQLText := SQLText;
    Info.StmtHandle := StmtHandle;
  end else
    StmtHandle := Info.StmtHandle;
end;

procedure TCachedQuery.FreeStatement;
begin
  {Do not free cached statment handles.}
end;

procedure TCachedQuery.ClearStatements;
var
  i: Integer;
begin
  for i := 0 to FStmtList.Count - 1 do
  begin
    StmtHandle := PStmtInfo(FStmtList[i]).StmtHandle;
    inherited FreeStatement;
    Dispose(PStmtInfo(FStmtList[i]));
  end;
  FStmtList.Clear;
end;

function TCachedQuery.GetStmtInfo(SQL: PChar): PStmtInfo;

  function GetHashCode(Str: PChar): Integer;
  var
    Off, Len, Skip, I: Integer;
  begin
    Result := 0;
    Off := 1;
    Len := StrLen(Str);
    if Len < 16 then
      for I := (Len - 1) downto 0 do
      begin
        Result := (Result * 37) + Ord(Str[Off]);
        Inc(Off);
      end
    else
    begin
      { Only sample some characters }
      Skip := Len div 8;
      I := Len - 1;
      while I >= 0 do
      begin
        Result := (Result * 39) + Ord(Str[Off]);
        Dec(I, Skip);
        Inc(Off, Skip);
      end;
    end;
  end;

var
  HashCode, i: Integer;
  Info: PStmtInfo;
begin
  Result := nil;
  HashCode := GetHashCode(SQL);
  for i := 0 to FStmtList.Count - 1 do
  begin
    Info := PStmtInfo(FStmtList[i]);
    if (Info.HashCode = HashCode) and
       (AnsiStrIComp(PChar(Info.SQLText), SQL) = 0) then
    begin
      Result := Info;
      break;
    end;
  end;
  if not Assigned(Result) then
  begin
    New(Result);
    FStmtList.Add(Result);
    FillChar(Result^, SizeOf(Result^), 0);
    Result.HashCode := HashCode;
  end;
end;

{ TProvider }

constructor TProvider.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FResolveToDataSet := False;
  FQuery := TCachedQuery.Create(Self);
  FQuery.ParamCheck := False;
  FRangeActive := False;
end;

function TProvider.GetDataSet: TDBDataSet;
begin
  Result := TDBDataSet(inherited GetDataSet);
end;

procedure TProvider.SetDataSet(ADataSet: TDBDataSet);
begin
  inherited SetDataSet(ADataSet);
end;

function TProvider.ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer): OleVariant;
var
  TransactionStarted: Boolean;
begin
  FDatabase := DataSet.DBSession.OpenDatabase(DataSet.DatabaseName);
  try
    FQuery.SessionName := FDatabase.SessionName;
    FQuery.DatabaseName := FDatabase.DatabaseName;
    TransactionStarted := not FDatabase.InTransaction;
    if TransactionStarted then
    begin
      if not FDatabase.IsSQLBased then
        FDatabase.TransIsolation := tiDirtyRead;
      FDatabase.StartTransaction;
    end;
    try
      Result := inherited ApplyUpdates(Delta, MaxErrors, ErrorCount);
    finally
      if TransactionStarted then
      begin
        if (ErrorCount <= MaxErrors) or (MaxErrors = -1) then
          FDatabase.Commit else
          FDatabase.Rollback;
      end;
    end;
  finally
    TCachedQuery(FQuery).ClearStatements;
    DataSet.DBSession.CloseDatabase(FDatabase);
  end;
end;

function TProvider.GetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError;
var
  PrevErr: Integer;
begin
  if Prev <> nil then
    PrevErr := Prev.ErrorCode else
    PrevErr := 0;
  if E is EDBEngineError then
    with EDBEngineError(E).Errors[0] do
    Result := EUpdateError.Create(E.Message, '', ErrorCode, PrevErr, E) else
    Result := inherited GetUpdateException(E, Prev);
end;

function TProvider.GetKeyFields(const Tablename: string; ADelta: TClientDataSet): string;
var
  Table: TTable;
  i, Pos: Integer;
  IndexFound: Boolean;
begin
  Result := '';
  Table := TTable.Create(nil);
  try
    Table.TableName := Tablename;
    with Table do
    begin
      ObjectView := True;
      SessionName := FDatabase.SessionName;
      DatabaseName := FDatabase.DatabaseName;
      IndexDefs.Update;
      { Search for a unique index that contains fields which are also
        present in the delta dataset }
      for i := 0 to IndexDefs.Count - 1 do
        if ixUnique in IndexDefs[I].Options then
        begin
          Pos := 1;
          Result := IndexDefs[I].Fields;
          IndexFound := False;
          while Pos <= Length(Result) do
         begin
            IndexFound := ADelta.FindField(ExtractFieldName(Result, Pos)) <> nil;
            if not IndexFound then Break;
          end;
          if IndexFound then Break;
        end;
    end;
  finally
    Table.Free;
  end;
end;

procedure TProvider.ExecSQL(Sender: TObject; SQL: TStringList; Params: TParams);
begin
  FQuery.SQL.Assign(SQL);
  FQuery.Params.Assign(Params);
  FQuery.ExecSQL;
  if FQuery.RowsAffected > 1 then
    DatabaseError(STooManyRecordsModified);
  if FQuery.RowsAffected < 1 then
    DatabaseError(SRecordChanged);
end;

procedure TProvider.GetValues(Sender: TObject; SQL: TStringList; Params: TParams;
  DataSet: TDataSet);
begin
  FQuery.SQL.Assign(SQL);
  FQuery.Params.Assign(Params);
  FQuery.RequestLive := False;
  FQuery.Open;
  try
    if FQuery.RecordCount = 1 then
      (DataSet as TPacketDataSet).AssignCurValues(FQuery);
  finally
    FQuery.Close;
  end;
end;

procedure TProvider.SetResolveToDataSet(Value: Boolean);
begin
  if (Value <> FResolveToDataSet) and Assigned(Resolver) then
    FreeResolver;
  FResolveToDataSet := Value;
end;

procedure TProvider.Reset(MetaData: WordBool);
begin
  inherited Reset(MetaData);
  if (DataSet <> nil) and (DataSet.Active) then
    DbiForceReread(DataSet.Handle);
end;

function TProvider.CreateResolver: TCustomResolver;
var
  Info: TSQLGenInfo;
begin
  if ResolveToDataSet then
    Result := TDataSetResolver.Create(Self) else
  begin
    Info.ExecSQLProc := ExecSQL;
    Info.GetValuesProc := GetValues;
    Result := TSQLResolver.Create(Self, Info);
  end;
end;

function TProvider.GetParamCount: Integer;
begin
  Result := 0;
  if not Assigned(DataSet) then Exit;
  if DataSet is TTable then
    Result := TTable(DataSet).IndexFieldCount else
  if DataSet is TQuery then
    Result := TQuery(DataSet).Params.Count else
  if DataSet is TStoredProc then
    Result := TStoredProc(DataSet).Params.Count;
end;

procedure TProvider.SetParamByName(const ParamName: string; const Value: OleVariant);
var
  Params: TParams;
begin
  if DataSet is TQuery then
    Params := TQuery(DataSet).Params else
    Params := TStoredProc(DataSet).Params;
  Params.ParamByName(ParamName).Value := Value;
end;

procedure TProvider.SetParamByIndex(ParamIndex: Integer; const Value: OleVariant);
var
  Params: TParams;
begin
  if DataSet is TQuery then
    Params := TQuery(DataSet).Params else
    Params := TStoredProc(DataSet).Params;
  Params[ParamIndex].Value := Value;
end;

function TProvider.FetchParams: OleVariant;
var
  Params: TParams;
  i: Integer;
begin
  if DataSet is TQuery then
    Params := TQuery(DataSet).Params
  else if DataSet is TStoredProc then
    Params := TStoredProc(DataSet).Params
  else
    Params := nil;
  if (Params = nil) or (Params.Count = 0) then
    Result := NULL else
  begin
    Result := VarArrayCreate([0, Params.Count - 1], varVariant);
    for i := 0 to Params.Count - 1 do
      with Params[i] do
        Result[i] := VarArrayOf([Name, Ord(DataType), Ord(ParamType), Value]);
  end;
end;

function TProvider.FetchData(const Packet: OleVariant): OleVariant;
begin
  FDatabase := DataSet.DBSession.OpenDatabase(DataSet.DatabaseName);
  try
    Result := inherited FetchData(Packet);
  finally
    TCachedQuery(FQuery).ClearStatements;
    DataSet.DBSession.CloseDatabase(FDatabase);
  end;
end;

procedure TProvider.SetParams(Values: OleVariant);

  procedure AssignFields(Table: TTable);
  var
    I, MaxIndex: Integer;
  begin
    with Table do
    begin
      MaxIndex := VarArrayHighBound(Values, 1);
      if MaxIndex >= IndexFieldCount then MaxIndex := IndexFieldCount - 1;
      for I := 0 to MaxIndex do
        if VarIsArray(Values[I]) then
          FieldByName(Values[I][0]).Value := Values[I][1] else
          IndexFields[I].Value := Values[I];
    end;
  end;

begin
  if DataSet is TTable then
  begin
    if not VarIsNull(Values) and not VarIsArray(Values) then
      Values := VarArrayOf([Values]);
    with TTable(DataSet) do
    begin
      if VarIsNull(Values) then
      begin
        CancelRange;
        FRangeActive := False;
      end else
      begin
        Open;
        SetRangeStart;
        AssignFields(TTable(DataSet));
        SetRangeEnd;
        AssignFields(TTable(DataSet));
        ApplyRange;
        FRangeActive := True;
      end;
    end;
    Reset(False);
  end
  else
  begin
    inherited SetParams(Values);
    DataSet.Close;
  end;
end;

procedure UseBdeProv;
begin
  // CBuilder's remote data module calls
  // this procedure to create a reference to bdeprov.
end;

begin
  if not Assigned(CreateProviderProc) then
    CreateProviderProc := CreateProvider;
end.
