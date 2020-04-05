{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBBatchUpdate;

interface

uses System.Classes, IBX.IBDatabase, IBX.IBSQL, IBX.IBExternals,
     System.Generics.Collections, IBX.IBHeader;

type

  TIBBatchErrors = array of ISC_STATUS;

  TIBBatchError = class
  public
    Index : Integer;
    ErrorCode : ISC_Status;
  end;

  TIBBatchErrorList = TList<TIBBatchError>;

  TIBBatchErrorsEnumerator = class
  private
    FIndex : Integer;
    FErrors : TIBBatchErrorList;
  public
    constructor Create(Errors: TIBBatchErrorList);
    function GetCurrent: TIBBatchError; inline;
    function MoveNext: Boolean;
    property Current: TIBBatchError read GetCurrent;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBatchUpdate = class(TComponent)
  private
    FBatchSize : Integer;
    FBase : TIBBase;
    FBatchSQL : TIBSQL;
    FIBBatchErrorList : TIBBatchErrorList;
    FPrepared : Boolean;
    function GetSQLParams: TIBXSQLDA;
    procedure SetBatchSize(const Value: Integer);
    function GetHasErrors: Boolean;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetTransaction(const Value: TIBTransaction);
    function GetSQL: TStrings;
    procedure SetSQL(const Value: TStrings);
    function GetDatabase: TIBDatabase;
    function GetTransaction: TIBTransaction;
    function GetDBHandle: PISC_DB_HANDLE;
    function GetTRHandle: PISC_TR_HANDLE;
  protected
    FSQL: TStrings;                { SQL Query (by user) }
    FProcessedSQL: TStrings;       { SQL Query (pre-processed for param labels) }
    FHandle: TISC_STMT_HANDLE;     { Once prepared, this accesses the SQL Query }
    FSQLParams : TIBXSQLDA;        { Any parameters to the query }
    FSQLType: TIBSQLTypes;         { Select, update, delete, insert, create, alter, etc...}

    procedure PreprocessSQL;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function Execute : Boolean;
    procedure Prepare;
    procedure Unprepare;
    procedure First;
    procedure Next;
    procedure Prior;
    procedure Insert;
    procedure Post;
    procedure Clear;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    function GetEnumerator: TIBBatchErrorsEnumerator;

    property Params: TIBXSQLDA read GetSQLParams;
    property HasErrors : Boolean read GetHasErrors;
    property Prepared: Boolean read FPrepared;
    property DBHandle: PISC_DB_HANDLE read GetDBHandle;
    property TRHandle: PISC_TR_HANDLE read GetTRHandle;

  published
    property SQL : TStrings read GetSQL write SetSQL;
    property Database : TIBDatabase read GetDatabase write SetDatabase;
    property Transaction : TIBTransaction read GetTransaction write SetTransaction;
    [ default(1000)]
    property BatchSize : Integer read FBatchSize write SetBatchSize;
  end;

implementation

uses IBX.IBIntf, IBX.IB, System.SysUtils, IBX.IBSQLMonitor, IBX.IBXConst,
     System.Character, IBX.IBErrorCodes;

{ TIBBatchUpdate }

function TIBBatchUpdate.Call(ErrCode: ISC_STATUS;
  RaiseError: Boolean): ISC_STATUS;
begin
  result := 0;
  if Transaction <> nil then
    result := Transaction.Call(ErrCode, RaiseError)
  else
    if RaiseError and (ErrCode > 0) then
      IBDataBaseError(Database.GDSLibrary);
end;

procedure TIBBatchUpdate.Clear;
begin

end;

constructor TIBBatchUpdate.Create(AOwner: TComponent);
begin
  inherited;
  FBatchSQL := TIBSQL.Create(Self);
  FBatchSize := 1000;
  FBase := TIBBase.Create(self);
  FPrepared := false;
  FIBBatchErrorList := TIBBatchErrorList.Create;
end;

destructor TIBBatchUpdate.Destroy;
begin
  FBatchSQL.Free;
  FIBBatchErrorList.Free;
  FBase.Free;
  inherited;
end;

function TIBBatchUpdate.Execute: Boolean;
begin
  Result := false;
end;

procedure TIBBatchUpdate.First;
begin

end;

function TIBBatchUpdate.GetDatabase: TIBDatabase;
begin
  Result := FBase.Database;
end;

function TIBBatchUpdate.GetDBHandle: PISC_DB_HANDLE;
begin
  Result := FBase.DBHandle;
end;

function TIBBatchUpdate.GetEnumerator: TIBBatchErrorsEnumerator;
begin
  Result := TIBBatchErrorsEnumerator.Create(FIBBatchErrorList);
end;

function TIBBatchUpdate.GetHasErrors: Boolean;
begin
  Result := FIBBatchErrorList.Count > 0;
end;

function TIBBatchUpdate.GetSQL: TStrings;
begin
  Result := FBatchSQL.SQL;
end;

function TIBBatchUpdate.GetSQLParams: TIBXSQLDA;
begin
  Result := FBatchSQL.Params;
end;

function TIBBatchUpdate.GetTransaction: TIBTransaction;
begin
  Result := FBase.Transaction;
end;

function TIBBatchUpdate.GetTRHandle: PISC_TR_HANDLE;
begin
  Result := FBase.TRHandle;
end;

procedure TIBBatchUpdate.Insert;
begin

end;

procedure TIBBatchUpdate.Next;
begin

end;

procedure TIBBatchUpdate.Post;
begin

end;

procedure TIBBatchUpdate.Prepare;
var
  stmt_len: Integer;
  res_buffer: array[0..7] of Byte;
  type_item: Byte;
  bt : TBytes;
  FGDSLibrary : IGDSLibrary;

begin
  FBase.CheckDatabase;
  FBase.CheckTransaction;
  if FPrepared then
    exit;

  FGDSLibrary := Database.GDSLibrary;
  if (FSQL.Text = '') then
    IBError(ibxeEmptyQuery, [nil]);

  PreprocessSQL;
  if (FProcessedSQL.Text = '') then
    IBError(ibxeEmptyQuery, [nil]);
  try
    Call(FGDSLibrary.isc_dsql_alloc_statement2(StatusVector, DBHandle,
                                    @FHandle), True);
    bt := Database.Encoding.GetBytes(FProcessedSQL.Text + #0);
    try
      Call(FGDSLibrary.isc_dsql_prepare(StatusVector, TRHandle, @FHandle, 0,
                 PByte(bt), Database.SQLDialect, nil), True);
    except
      SetLength(bt, 0);
      raise;
    end;
    { After preparing the statement, query the stmt type and possibly
      create a FSQLRecord "holder" }
    { Get the type of the statement }
    type_item := Byte(isc_info_sql_stmt_type);
    Call(FGDSLibrary.isc_dsql_sql_info(StatusVector, @FHandle, 1, @type_item,
                         SizeOf(res_buffer), @res_buffer), True);
    if (res_buffer[0] <> Byte(isc_info_sql_stmt_type)) then
      IBError(ibxeUnknownError, [nil]);
    stmt_len := FGDSLibrary.isc_vax_integer(@res_buffer[1], 2);
    FSQLType := TIBSQLTypes(FGDSLibrary.isc_vax_integer(@res_buffer[3], stmt_len));
                             
    case FSQLType of
      SQLGetSegment,
      SQLPutSegment,
      SQLStartTransaction:
      begin
        Unprepare;
        IBError(ibxeNotPermitted, [nil]);
      end;
      SQLCommit,
      SQLRollback,
      SQLDDL, SQLSetGenerator,
      SQLInsert, SQLUpdate, SQLDelete, SQLSelect, SQLSelectForUpdate,
      SQLExecProcedure:
      begin
        { We already know how many inputs there are, so... }
        if (FSQLParams.AsXSQLDA <> nil) and
           (Call(FGDSLibrary.isc_dsql_describe_bind(StatusVector, @FHandle, Database.SQLDialect,
                                        FSQLParams.AsXSQLDA), False) > 0) then
          IBDataBaseError(FGDSLibrary);
        if (FSQLParams.AsXSQLDA <> nil) and
           (FSQLParams.Count <> FSQLParams.AsXSQLDA^.sqld) then
        begin
          FSQLParams.Count := FSQLParams.AsXSQLDA^.sqld;
          Call(FGDSLibrary.isc_dsql_describe_bind(StatusVector, @FHandle, Database.SQLDialect,
                                          FSQLParams.AsXSQLDA), False);
        end;
//        FSQLParams.Initialize;
      end;
    end;
    FPrepared := True;
  except
    on E: Exception do
begin
      if (FHandle <> nil) then
        Unprepare;
      raise;
    end;
  end;
end;

procedure TIBBatchUpdate.PreprocessSQL;
var
  cCurChar, cNextChar, cQuoteChar: Char;
  sSQL, sProcessedSQL, sParamName: String;
  i, iLenSQL, iSQLPos: Integer;
  iCurState, iCurParamState: Integer;
  slNames: TStrings;

const
  DefaultState = 0;
  CommentState = 1;
  QuoteState = 2;
  ParamState = 3;
  ParamDefaultState = 0;
  ParamQuoteState = 1;

  procedure AddToProcessedSQL(cChar: Char);
  begin
    sProcessedSQL[iSQLPos] := cChar;
    Inc(iSQLPos);
end;

begin
  slNames := TStringList.Create;
  try
    { Do some initializations of variables }
    cQuoteChar := '''';
    sSQL := FSQL.Text;
    iLenSQL := Length(sSQL);
    SetString(sProcessedSQL, nil, iLenSQL + 1);
    i := low(sSQL);
    iSQLPos := i;
    iCurState := DefaultState;
    iCurParamState := ParamDefaultState;
    { Now, traverse through the SQL string, character by character,
     picking out the parameters and formatting correctly for InterBase }
    while (i <= iLenSQL) do begin
      { Get the current token and a look-ahead }
      cCurChar := sSQL[i];
      if i = iLenSQL then
        cNextChar := #0
      else
        cNextChar := sSQL[i + 1];
      { Now act based on the current state }
      case iCurState of
        DefaultState: begin
          case cCurChar of
            '''', '"': begin
              cQuoteChar := cCurChar;
              iCurState := QuoteState;
            end;
            '?', ':': begin
              iCurState := ParamState;
              AddToProcessedSQL('?');
            end;
            '/': if (cNextChar = '*') then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
              iCurState := CommentState;
            end;
          end;
        end;
        CommentState: begin
          if (cNextChar = #0) then
            IBError(ibxeSQLParseError, [SEOFInComment])
          else if (cCurChar = '*') then begin
            if (cNextChar = '/') then
              iCurState := DefaultState;
          end;
        end;
        QuoteState: begin
          if cNextChar = #0 then
            IBError(ibxeSQLParseError, [SEOFInString])
          else if (cCurChar = cQuoteChar) then begin
            if (cNextChar = cQuoteChar) then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
            end else
              iCurState := DefaultState;
          end;
        end;
        ParamState:
        begin
          { collect the name of the parameter }
          if iCurParamState = ParamDefaultState then
          begin
            if cCurChar = '"' then
              iCurParamState := ParamQuoteState
            else
              if cCurChar.IsInArray(['_', '$']) or
                 cCurChar.IsLetterOrDigit then  {do not localize}
                sParamName := sParamName + cCurChar
            else
              IBError(ibxeSQLParseError, [SParamNameExpected]);
          end
          else begin
            { determine if Quoted parameter name is finished }
            if cCurChar = '"' then
            begin
              Inc(i);
              slNames.Add(sParamName);
              SParamName := '';
              iCurParamState := ParamDefaultState;
              iCurState := DefaultState;
            end
            else
              sParamName := sParamName + cCurChar
          end;
          { determine if the unquoted parameter name is finished }
          if (iCurParamState <> ParamQuoteState) and
            (iCurState <> DefaultState) then
          begin
            if not (cNextChar.IsInArray(['_', '$']) or
                    cNextChar.IsLetterOrDigit)  then  {do not localize}
            begin
              Inc(i);
              iCurState := DefaultState;
              slNames.Add(sParamName);
              sParamName := '';
            end;
          end;
        end;
      end;
      if iCurState <> ParamState then
        AddToProcessedSQL(sSQL[i]);
      Inc(i);
    end;
    AddToProcessedSQL(#0);
    FSQLParams.Count := slNames.Count;
    for i := 0 to slNames.Count - 1 do
      FSQLParams.AddName(slNames[i], i);
    FProcessedSQL.Text := sProcessedSQL;
  finally
    slNames.Free;
  end;
end;

procedure TIBBatchUpdate.Prior;
begin

end;

procedure TIBBatchUpdate.SetBatchSize(const Value: Integer);
begin
  FBatchSize := Value;
end;

procedure TIBBatchUpdate.SetDatabase(const Value: TIBDatabase);
begin
  if (FBase <> nil) and (FBase.Database <> Value) then
    FBase.Database := Value;
end;

procedure TIBBatchUpdate.SetSQL(const Value: TStrings);
begin
  if FBatchSQL.SQL.Text <> Value.Text then
  begin
                        
    FBatchSQL.SQL.Assign(Value);
  end;
end;

procedure TIBBatchUpdate.SetTransaction(const Value: TIBTransaction);
begin
  if Assigned(FBase) and (FBase.Transaction <> Value) then
  begin
    if Prepared then
      Unprepare;
    FBase.Transaction := Value;
  end;
end;

procedure TIBBatchUpdate.Unprepare;
var
  isc_res: ISC_STATUS;
begin
  try
    { The following two lines merely set the SQLDA count
     variable FCount to 0, but do not deallocate
     That way the allocations can be reused for
     a new query sring in the same SQL instance }
    //    FSQLRecord.Count := 0;
    //    FSQLParams.Count := 0;
    if (FHandle <> nil) and Database.Connected then
    begin
      isc_res := Call(Database.GDSLibrary.isc_dsql_free_statement(StatusVector, @FHandle, DSQL_drop), False);
      if (StatusVector^ = 1) and (isc_res > 0) and (isc_res <> isc_bad_stmt_handle)
         and (isc_res <> isc_lost_db_connection) then
        IBDataBaseError(Database.GDSLibrary);
    end;
  finally
    FPrepared := False;
    FHandle := nil;
  end;
end;

{ TIBBatchErrorsEnumerator }

constructor TIBBatchErrorsEnumerator.Create(Errors: TIBBatchErrorList);
begin
  inherited Create;
  FIndex := -1;
  FErrors := Errors;
end;

function TIBBatchErrorsEnumerator.GetCurrent: TIBBatchError;
begin
  Result := FErrors.Items[FIndex];
end;

function TIBBatchErrorsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FErrors.Count - 1;
  if Result then
    Inc(FIndex);
end;

end.
