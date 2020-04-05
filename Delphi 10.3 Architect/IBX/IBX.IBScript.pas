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

unit IBX.IBScript;

interface

uses
  System.Classes, IBX.IBDatabase, IBX.IBCustomDataset, IBX.IBSQL,
  IBX.IBDatabaseInfo, IBX.IBExternals;

type

  TIBScript = class;

  TIBParseKind = (stmtDDL, stmtDML, stmtSET, stmtCONNECT, stmtDrop,
    stmtCREATE, stmtINPUT, stmtUNK, stmtEMPTY, stmtTERM, stmtERR,
    stmtCOMMIT, stmtROLLBACK, stmtReconnect, stmtRollbackSavePoint,
    stmtReleaseSavePoint, stmtStartSavepoint, stmtCOMMITRetaining,
    stmtROLLBACKRetaining, stmtBatchStart, stmtBatchExecute,
    stmtServerSET, stmtSetTransaction);

  TIBSQLParseError = procedure(Sender: TObject; Error: string; SQLText: string;
    LineIndex: Integer) of object;
  TIBSQLExecuteError = procedure(Sender: TObject; Error: string; SQLText:
    string;
    LineIndex: Integer; var Ignore: Boolean) of object;
  TIBSQLParseStmt = procedure(Sender: TObject; AKind: TIBParseKind; SQLText:
    string) of object;
  TIBScriptParamCheck = procedure(Sender: TIBScript; var Pause: Boolean) of
    object;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBSQLParser = class(TComponent)
  private
    FOnError: TIBSQLParseError;
    FOnParse: TIBSQLParseStmt;
    FScript, FInput: TStrings;
    FTerminator: string;
    FPaused: Boolean;
    FFinished: Boolean;
    procedure SetScript(const Value: TStrings);
    procedure SetPaused(const Value: Boolean);
    { Private declarations }
  private
    FTokens: TStrings;
    FWork: string;
    ScriptIndex, LineIndex, ImportIndex: Integer;
    InInput: Boolean;

    //Get Tokens plus return the actual SQL to execute
    function TokenizeNextLine: string;
    // Return the Parse Kind for the Current tokenized statement
    function IsValidStatement: TIBParseKind;
    procedure RemoveComment;
    function AppendNextLine: Boolean;
    procedure LoadInput;
  protected
    { Protected declarations }
    procedure DoOnParse(AKind: TIBParseKind; SQLText: string); virtual;
    procedure DoOnError(Error: string; SQLText: string); virtual;
    procedure DoParser;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Parse;
    property CurrentLine: Integer read LineIndex;
    property CurrentTokens: TStrings read FTokens;
  published
    { Published declarations }
    property Finished: Boolean read FFinished;
    property Paused: Boolean read FPaused write SetPaused;
    property Script: TStrings read FScript write SetScript;
    property Terminator: string read FTerminator write FTerminator;
    property OnParse: TIBSQLParseStmt read FOnParse write FOnParse;
    property OnError: TIBSQLParseError read FOnError write FOnError;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBScriptStats = class
  private
    FBuffers: int64;
    FReadIdx: int64;
    FWrites: int64;
    FFetches: int64;
    FSeqReads: int64;
    FReads: int64;
    FDeltaMem: int64;
    FStarted : Boolean;

    FStartBuffers: int64;
    FStartReadIdx: int64;
    FStartWrites: int64;
    FStartFetches: int64;
    FStartSeqReads: int64;
    FStartReads: int64;
    FStartingMem : Int64;

    [weak]
    FDatabase: TIBDatabase;

    FInfoStats : TIBDatabaseInfo;
    procedure SetDatabase(const Value: TIBDatabase);
    function AddStringValues( list : TStrings) : int64;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Clear;
    procedure Stop;

    property Database : TIBDatabase read FDatabase write SetDatabase;
    property Buffers : int64 read FBuffers;
    property Reads : int64 read FReads;
    property Writes : int64 read FWrites;
    property SeqReads : int64 read FSeqReads;
    property Fetches : int64 read FFetches;
    property ReadIdx : int64 read FReadIdx;
    property DeltaMem : int64 read FDeltaMem;
    property StartingMem : int64 read FStartingMem;
  end;


  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBScript = class(TComponent)
  private
    FSQLParser: TIBSQLParser;
    FAutoDDL: Boolean;
    FStatsOn: boolean;
    FDataset: TIBDataset;
    [weak] FDatabase: TIBDatabase;
    FOnError: TIBSQLParseError;
    FOnParse: TIBSQLParseStmt;
    FDDLTransaction: TIBTransaction;
    [weak] FTransaction: TIBTransaction;
    FTerminator: string;
    FDDLQuery, FDMLQuery: TIBSQL;
    FContinue: Boolean;
    FOnExecuteError: TIBSQLExecuteError;
    FOnParamCheck: TIBScriptParamCheck;
    FValidate, FValidating: Boolean;
    FStats: TIBScriptStats;
    FSQLDialect : Integer;
    FCharSet : String;

    FCurrentStmt: TIBParseKind;
    FExecuting : Boolean;
    InBatch: Boolean;
    FBatchBuffer : PPByte;
    FBatchCount : Integer;
    FBufferSize: Integer;
    function GetPaused: Boolean;
    procedure SetPaused(const Value: Boolean);
    procedure SetTerminator(const Value: string);
    procedure SetupNewConnection;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetTransaction(const Value: TIBTransaction);
    function StripQuote(const Text: string): string;
    function GetScript: TStrings;
    procedure SetScript(const Value: TStrings);
    function GetSQLParams: TIBXSQLDA;
    procedure SetStatsOn(const Value: boolean);
    function GetTokens: TStrings;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DoDML(const Text: string); virtual;
    procedure DoDDL(const Text: string); virtual;
    procedure DoSET(const Text: string); virtual;
    procedure DoConnect(const SQLText: string); virtual;
    procedure DoCreate(const SQLText: string); virtual;
    procedure DoReconnect(const SQLText : String); virtual;
    procedure DropDatabase(const SQLText: string); virtual;
    procedure DoServerSet(const Text : String); virtual;
    procedure DoSetTransaction(const Text : String); virtual;

    procedure ParserError(Sender: TObject; Error, SQLText: string;
      LineIndex: Integer);
    procedure ParserParse(Sender: TObject; AKind: TIBParseKind;
      SQLText: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ValidateScript: Boolean;
    procedure ExecuteScript;
    function ParamByName(Idx : String) : TIBXSQLVAR;
    property Paused: Boolean read GetPaused write SetPaused;
    property Params: TIBXSQLDA read GetSQLParams;
    property Stats : TIBScriptStats read FStats;
    property CurrentTokens : TStrings read GetTokens;
    property Validating : Boolean read FValidating;
  published
    property AutoDDL: Boolean read FAutoDDL write FAutoDDL default true;
    property Dataset: TIBDataset read FDataset write FDataset;
    property Database: TIBDatabase read FDatabase write SetDatabase;
    property Transaction: TIBTransaction read FTransaction write SetTransaction;
    property Terminator: string read FTerminator write SetTerminator;
    property Script: TStrings read GetScript write SetScript;
    property Statistics: boolean read FStatsOn write SetStatsOn default true;
    property OnParse: TIBSQLParseStmt read FOnParse write FOnParse;
    property OnParseError: TIBSQLParseError read FOnError write FOnError;
    property OnExecuteError: TIBSQLExecuteError read FOnExecuteError write
      FOnExecuteError;
    property OnParamCheck: TIBScriptParamCheck read FOnParamCheck write
      FOnParamCheck;
  end;

implementation

uses System.SysUtils, IBX.IBUtils, IBX.IB, IBX.IBXConst, IBX.IBIntf,
     System.Character;

const
  QUOTE = '''';  {do not localize}
  DBL_QUOTE = '"'; {do not localize}

{ TIBSQLParser }

function TIBSQLParser.AppendNextLine: Boolean;
var
  FStrings: TStrings;
  FIndex: ^Integer;
begin
  if (FInput.Count > ImportIndex) then
  begin
    InInput := true;
    FStrings := FInput;
    FIndex := @ImportIndex;
  end
  else
  begin
    InInput := false;
    FStrings := FScript;
    FIndex := @ScriptIndex;
  end;

  if FIndex^ = FStrings.Count then
    Result := false
  else
  begin
    Result := true;
    repeat
      FWork := FWork + CRLF + FStrings[FIndex^];
      Inc(FIndex^);
    until (FIndex^ = FStrings.Count) or
      (Trim(FWork) <> '');
  end;
  if InInput and (Trim(FWork) = '') then
    AppendNextLine;
end;

constructor TIBSQLParser.Create(AOwner: TComponent);
begin
  inherited;
  FScript := TStringList.Create;
  FTokens := TStringList.Create;
  FInput := TStringList.Create;
  ImportIndex := 0;
  FTerminator := ';';  {do not localize}
end;

destructor TIBSQLParser.Destroy;
begin
  FScript.Free;
  FTokens.Free;
  FInput.Free;
  inherited;
end;

procedure TIBSQLParser.DoOnError(Error, SQLText: string);
begin
  if Assigned(FOnError) then
    FOnError(Self, Error, SQLText, LineIndex);
end;

procedure TIBSQLParser.DoOnParse(AKind: TIBParseKind; SQLText: string);
begin
  if Assigned(FOnParse) then
    FOnParse(Self, AKind, SQLText);
end;

procedure TIBSQLParser.DoParser;
var
  Stmt: TIBParseKind;
  Statement: string;
  i: Integer;
begin
  while ((ScriptIndex < FScript.Count) or
    (Trim(FWork) <> '') or
    (ImportIndex < FInput.Count)) and
    not FPaused do
  begin
    Statement := TokenizeNextLine;
    Stmt := IsValidStatement;
    case Stmt of
      stmtERR:
        DoOnError(SIBInvalidStatement, Statement);
      stmtTERM:
        begin
          DoOnParse(Stmt, FTokens[2]);
          FTerminator := FTokens[2];
        end;
      stmtINPUT:
        try
          LoadInput;
        except
          on E: Exception do
            DoOnError(E.Message, Statement);
        end;
      stmtEMPTY:
        Continue;
      stmtSET, stmtSetTransaction:
        begin
          Statement := '';
          for i := 1 to FTokens.Count - 1 do
            Statement := Statement + FTokens[i] + ' ';
          Statement := TrimRight(Statement);
          DoOnParse(Stmt, Statement);
        end;
    else
      DoOnParse(stmt, Statement);
    end;
  end;
end;

function TIBSQLParser.IsValidStatement: TIBParseKind;
var
  Token, Token1 : String;
begin
  if FTokens.Count = 0 then
  begin
    Result := stmtEmpty;
    Exit;
  end;
  Token := UpperCase(FTokens[0]);
  if Token = 'COMMIT' then  {do not localize}
  begin
    if FTokens.Count = 2 then
    begin
      if FTokens[1] = 'RETAINING' then  {do not localize}
      begin
        Result := stmtCOMMITRetaining;
        Exit;
      end
      else
        if FTokens[1] = 'WORK' then {do not localize}
        begin
          Result := stmtCOMMIT;
          exit;
        end;
    end
    else
    begin
      Result := stmtCOMMIT;
      exit;
    end;
  end;
  if Token = 'ROLLBACK' then   {do not localize}
  begin
    if FTokens.Count < 2 then
    begin
      Result := stmtROLLBACK;
      Exit;
    end
    else
    begin
      if (FTokens.Count = 2) and (FTokens[1] = 'RETAINING') then  {do not localize}
      begin
        Result := stmtROLLBACKRetaining;
        Exit;
      end;
      //  This is the 'rollback to savepoint' form
      if ((FTokens.Count = 4) and
          (FTokens[1] = 'TO') and   {do not localize}
          (FTokens[2] = 'SAVEPOINT')) or  {do not localize}
          //  This is the 'rollback work to savepoint' form
         ((FTokens.Count = 5) and 
          (FTokens[2] = 'TO') and  {do not localize}
          (FTokens[3] = 'SAVEPOINT')) then  {do not localize}
      begin
        Result := stmtErr;
        exit;
      end;
      Result := stmtRollbackSavepoint;
      exit;
    end;
  end;
  if Token = 'RECONNECT' then  {do not localize}
  begin
    Result := stmtReconnect;
    Exit;
  end;
  if Token = 'SAVEPOINT' then {do not localize}
  begin
    Result := stmtStartSavepoint;
    exit;
  end;
  if FTokens.Count < 2 then
  begin
    Result := stmtERR;
    Exit;
  end;
  Token1 := UpperCase(FTokens[1]);
  if Token = 'BATCH' then {do not localize}
  begin
    if Token1 = 'START' then {do not localize}
      Result := stmtBatchStart
    else
      if Token1 = 'EXECUTE' then {do not localize}
        Result := stmtBatchExecute
      else
        REsult := stmtERR;
    exit;
  end;
  if (Token = 'RELEASE') and (Token1 = 'SAVEPOINT') then  {do not localize}
  begin
    Result := stmtReleaseSavepoint;
    exit;
  end;
  if (Token = 'INSERT') or (Token = 'DELETE') or   {do not localize}
    (Token = 'SELECT') or (Token = 'UPDATE') or    {do not localize}
    (Token = 'EXECUTE') or                         {do not localize}
    ((Token = 'EXECUTE') and (Token1 = 'PROCEDURE')) or {do not localize}
    (Token = 'WITH') or  {do not localize}
    (Token = 'TRUNCATE') then  {do not localize}
    Result := stmtDML
  else
    if Token = 'INPUT' then         {do not localize}
      Result := stmtINPUT
    else
      if Token = 'CONNECT' then         {do not localize}
        Result := stmtCONNECT
      else
        if (Token = 'CREATE') and
          ((Token1 = 'DATABASE') or (Token1 = 'SCHEMA')) then   {do not localize}
          Result := stmtCREATE
        else
          if (Token = 'DROP') and (Token1 = 'DATABASE') then    {do not localize}
            Result := stmtDROP
          else
            if ((Token = 'DROP') and (Token1 = 'JOURNAL')) or {do not localize}
               (Token = 'DECLARE') or (Token = 'CREATE') or (Token = 'ALTER') or {do not localize}
               (Token = 'GRANT') or (Token = 'REVOKE') or (Token = 'DROP') or        {do not localize}
               ((Token = 'SET') and (Token1 = 'GENERATOR')) or                       {do not localize}
               ((Token = 'SET') and (Token1 = 'STATISTICS') and                      {do not localize}
               (FTokens.Count > 2) and (UpperCase(FTokens[2]) = 'INDEX')) then  {do not localize}
              Result := stmtDDL
            else
              if (Token = 'SET') then       {do not localize}
              begin
                if (Token1 = 'TERM') then     {do not localize}
                  if FTokens.Count = 3 then
                    Result := stmtTERM
                  else
                    Result := stmtERR
                else
                  if (Token1 = 'SQL') then  {do not localize}
                     if (FTokens.Count = 4) and
                        (UpperCase(FTokens[2]) = 'DIALECT') then  {do not localize}
                       Result := stmtSET
                     else
                       Result := stmtERR
                  else
                    if (Token1 = 'AUTODDL') or (Token1 = 'STATISTICS') or  {do not localize}
                       (Token1 = 'NAMES') or (Token1 = 'SAVEPOINTS') then {do not localize}
                      if FTokens.Count = 3 then
                        Result := stmtSET
                      else
                        Result := stmtERR
                    else
                      if (Token1 = 'PASSWORD') or         {do not localize}
                         (Token1 = 'SUBSCRIPTION') then   {do not localize}
                        Result := stmtServerSET
                      else
                        if Token1 = 'TRANSACTION' then
                          Result := stmtSetTransaction
                        else
                          Result := stmtERR;
              end
              else
                Result := stmtERR;
end;

procedure TIBSQLParser.LoadInput;
var
  FileName: string;
begin
  FInput.Clear;
  ImportIndex := 0;
  FileName := FTokens[1];
  if FileName[Low(FileName)].IsInArray([QUOTE, DBL_QUOTE]) then
    FileName := FileName.Remove(0, 1);
  if FileName[High(FileName)].IsInArray([QUOTE, DBL_QUOTE]) then
    FileName := FileName.Remove(High(fileName), 1);

  FInput.LoadFromFile(FileName);
end;

procedure TIBSQLParser.Parse;
begin
  ScriptIndex := 0;
  ImportIndex := 0;
  FInput.Clear;
  FPaused := false;
  DoParser;
end;

procedure TIBSQLParser.RemoveComment;
var
  Start, Ending: Integer;
begin
  FWork := FWork.TrimLeft;
  Start := FWork.IndexOf('/*');    {do not localize}
  while Start = 0 do
  begin
    Ending := FWork.IndexOf('*/'); {do not localize}
    while Ending < Start do
    begin
      if AppendNextLine = false then
        raise Exception.Create(SIBInvalidComment);
      Ending := FWork.IndexOf('*/');    {do not localize}
    end;
    FWork := FWork.Substring(Ending + 2, FWork.Length);
    FWork := FWork.TrimLeft;
    if FWork = '' then
      AppendNextLine;
    FWork := FWork.TrimLeft;
    Start := FWork.IndexOf('/*');    {do not localize}
  end;
  FWork := FWork.TrimLeft;
end;

procedure TIBSQLParser.SetPaused(const Value: Boolean);
begin
  if FPaused <> Value then
  begin
    FPaused := Value;
    if not FPaused then
      DoParser;
  end;
end;

procedure TIBSQLParser.SetScript(const Value: TStrings);
begin
  FScript.Assign(Value);
  FPaused := false;
  ScriptIndex := 0;
  ImportIndex := 0;
  FInput.Clear;
end;

{ Note on TokenizeNextLine.  This is not intended to actually tokenize in
  terms of SQL tokens.  It has two goals.  First is to get the primary statement
  type in FTokens[0].  These are items like SELECT, UPDATE, CREATE, SET, IMPORT.
  The secondary function is to correctly find the end of a statement.  So if the
  terminator is ; and the statement is "SELECT 'FDR'';' from Table1;" while
  correct SQL tokenization is SELECT, 'FDR'';', FROM, Table1 but this is more
  than needed.  The Tokenizer will tokenize this as SELECT, 'FDR', ';', FROM,
  Table1.  We get that it is a SELECT statement and get the correct termination
  and whole statement in the case where the terminator is embedded inside
  a ' or ". }

function TIBSQLParser.TokenizeNextLine: string;
var
  InQuote, InDouble, InComment, InSpecial, Done: Boolean;
  NextWord : string;
  Index : Integer;

  procedure ScanToken;
  var
    SDone: Boolean;
  begin
    NextWord := '';
    SDone := false;
    Index := Low(FWork);
    while (Index <= High(FWork)) and (not SDone) do
    begin
      { Hit the terminator, but it is not embedded in a single or double quote
          or inside a comment }
      if ((not InQuote) and (not InDouble) and (not InComment)) and
        (((FTerminator.Equals(FWork.Substring(Index - Low(FWork), FTerminator.Length))) and
          (not InSpecial)) or
         (InSpecial and
          (FTokens.Count > 1) and
          (UpperCase(FTokens[FTokens.Count - 2]) = 'END') and {do not localize}
          (FTokens[FTokens.Count - 1] = ';')) or {do not localize}
         ((InSpecial and
          (FTokens.Count = 5) and
          (UpperCase(FTokens[0]) = 'ALTER') and {do not localize}
          (UpperCase(FTokens[1]) = 'TRIGGER') and {do not localize}
          ((UpperCase(FTokens[3]) = 'ACTIVE') or {do not localize}
           (UpperCase(FTokens[3]) = 'INACTIVE')) and {do not localize}
          (FTokens[4] = ';')))) then {do not localize}
      begin
        if InSpecial then
        begin
          Result := Result.Substring(0, Result.Length - 1);
          InSpecial := false;
        end;
        Done := true;
        Result := Result + NextWord;
        FWork := FWork.Substring(NextWord.Length + FTerminator.Length);
        NextWord := NextWord.ToUpper.Trim;
        if NextWord <> '' then
          FTokens.Add(NextWord.ToUpper);
        Exit;
      end;

      { Are we entering or exiting an inline comment? }
      if (Index < FWork.Length) and (not Indouble) and (not InQuote) and
        (FWork[Index] = '/') and (FWork[Index + 1] = '*') then     {do not localize}
        InComment := true;
      if InComment and (Index <> Low(FWork)) and
         (FWork[Index] = '/') and (FWork[Index - 1] = '*') then     {do not localize}
        InComment := false;

      if not InComment then
        { Handle case when the character is a single quote or a double quote }
        case FWork[Index] of
          QUOTE:
            if not InDouble then
            begin
              if InQuote then
              begin
                InQuote := false;
                SDone := true;
              end
              else
                InQuote := true;
            end;
          DBL_QUOTE:
            if not InQuote then
            begin
              if InDouble then
              begin
                Indouble := false;
                SDone := true;
              end
              else
                InDouble := true;
            end;
          ' ':                   {do not localize}
            if (not InDouble) and (not InQuote) then
              SDone := true;
        end;
      NextWord := NextWord + FWork[Index];
      Inc(Index);
    end;
    { copy over the remaining non character or spaces until the next word }
    while (Index < FWork.Length) and (FWork[Index] <= #32) do
    begin
      NextWord := NextWord + FWork[Index];
      Inc(Index);
    end;
    Result := Result + NextWord;
    FWork := FWork.Substring(NextWord.Length);
    NextWord := NextWord.Trim;
    if NextWord <> '' then
      FTokens.Add(NextWord);
    if (FTokens.Count = 2) and
       ((UpperCase(FTokens[0]) = 'CREATE') or {do not localize}
        (UpperCase(FTokens[0]) = 'ALTER')) and {do not localize}
      ((UpperCase(NextWord) = 'PROCEDURE') or {do not localize}
       (UpperCase(NextWord) = 'TRIGGER')) and  {do not localize}
       (FTerminator = ';') then {do not localize}
      InSpecial := true;
    if InSpecial and (NextWord.ToUpper = 'END;') then {do not localize}
    begin
      FTokens[FTokens.Count - 1] := FTokens[FTokens.Count - 1].Substring(0, 3);
      FTokens.Add(';'); {do not localize}
    end;
    if InSpecial and (FTokens.Count = 4) and
      (UpperCase(FTokens[0]) = 'ALTER') and {do not localize}
      (UpperCase(FTokens[1]) = 'TRIGGER') and {do not localize}
      ((UpperCase(FTokens[3]) = 'ACTIVE;') or {do not localize}
       ((UpperCase(FTokens[3]) = 'INACTIVE;'))) then {do not localize}
    begin
      if UpperCase(NextWord) = 'ACTIVE;' then {do not localize}
        FTokens[FTokens.Count - 1] := FTokens[FTokens.Count - 1].Substring(0, 6)
      else
        FTokens[FTokens.Count - 1] := FTokens[FTokens.Count - 1].Substring(0, 8);
      FTokens.Add(';'); {do not localize}
    end;
    if (FTokens.Count = 1) and (FTokens[0] = '--') then {do not localize}
    begin
      // Start of a simple comment, this is not a statement so just clear the
      //    rest of the line as it is all part of the comment
      FTokens.Clear;
      FWork := '';
    end;
  end;

begin
  InSpecial := false;
  FTokens.Clear;
  if FWork.Trim = '' then
    AppendNextLine;
  if not InInput then
    LineIndex := ScriptIndex;
  try
    RemoveComment;
  except
    on E: Exception do
    begin
      DoOnError(E.Message, '');
      exit;
    end
  end;
  InQuote := false;
  InDouble := false;
  InComment := false;
  Done := false;
  Result := '';
  while not Done do
  begin
    { Check the work queue, if it is empty get the next line to process }
    if FWork = '' then
      if not AppendNextLine then
        exit;
    ScanToken;
  end;
end;

{ TIBScript }

constructor TIBScript.Create(AOwner: TComponent);
begin
  inherited;
  FSQLParser := TIBSQLParser.Create(self);
  FSQLParser.OnError := ParserError;
  FSQLParser.OnParse := ParserParse;
  Terminator := ';';                    {do not localize}
  FDDLTransaction := TIBTransaction.Create(self);
  FDDLQuery := TIBSQL.Create(self);
  FDDLQuery.ParamCheck := false;
  FAutoDDL := true;
  FStatsOn := true;
  FStats := TIBScriptStats.Create;
  FStats.Database := FDatabase;
  FSQLDialect := 3;
  InBatch := false;
  FBatchCount := 0;
end;

destructor TIBScript.Destroy;
begin
  FStats.Free;
  inherited;
end;

procedure TIBScript.DoConnect(const SQLText: string);
var
  i: integer;
  Param: string;
begin
  if (not Assigned(Database)) or
     (Database.Owner <> self) then
    SetupNewConnection;
  if Database.Connected then
    Database.Connected := false;
  Database.SQLDialect := FSQLDialect;
  Database.Params.Clear;
  Database.DatabaseName := StripQuote(FSQLParser.CurrentTokens[1]);
  i := 2;
  while i < FSQLParser.CurrentTokens.Count - 1 do
  begin
    if CompareText(FSQLParser.CurrentTokens[i], 'USER') = 0 then   {do not localize}
      Param := 'user_name';                                            {do not localize}
    if CompareText(FSQLParser.CurrentTokens[i], 'PASSWORD') = 0 then  {do not localize}
      Param := 'password';                                              {do not localize}
    if CompareText(FSQLParser.CurrentTokens[i], 'ROLE') = 0 then   {do not localize}
      Param := 'user_role';                                            {do not localize}
    Database.Params.Add(Param + '=' + StripQuote(FSQLParser.CurrentTokens[i +
      1]));
    Inc(i, 2);
  end;
  if FCharSet <> '' then
    Database.Params.Add('lc_ctype=' + FCharSet); {do not localize}
  Database.Connected := true;
end;

procedure TIBScript.DoCreate(const SQLText: string);
var
  i, MaxTokenIdx: Integer;
  OldStyle : Boolean;
  FileStr : String;

  function IsOldStyle : Boolean;
  var
  i: Integer;
begin
    Result := true;
    i := 3;
    while (Result) and
          (i < FSQLParser.CurrentTokens.Count) do
    begin
      Result := not ((FSQLParser.CurrentTokens[i].ToUpper = 'NO_RESERVE') or   {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'SET_PAGE_BUFFERS') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'PREALLOCATE') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'FORCE_WRITE') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'SQL_DIALECT') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'SET_GROUP_COMMIT') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'SWEEP_INTERVAL') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'TRANSACTION') or  {do not localize }
                     (FSQLParser.CurrentTokens[i].ToUpper = 'ODS_VERSION_MAJOR'));   {do not localize }
      Inc(i);
    end;
  end;

begin
  SetupNewConnection;
  FDatabase.DatabaseName := StripQuote(FSQLParser.CurrentTokens[2]);
  OldStyle := IsOldStyle;
  i := 3;
  MaxTokenIdx := FSQLParser.CurrentTokens.Count;
  FileStr := '';
  if OldStyle then
  begin
    while i < MaxTokenIdx do
    begin
      FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i];
      Inc(i);
    end;
    Database.Params.Text := FileStr;
  end
  else
  begin
    while i < MaxTokenIdx do
    begin
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'USER') then   {do not localize}
      begin
        FDatabase.Params.Add('user_name=' + StripQuote(FSQLParser.CurrentTokens[i+1]));  {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'PASSWORD') then  {do not localize}
      begin
        FDatabase.Params.Add('password=' + StripQuote(FSQLParser.CurrentTokens[i+1])); {do not localize}
        Inc(i, 2);
      end
      else
      if FSQLParser.CurrentTokens[i].ToUpper.Contains('PAGE_SIZE') then {do not localize}
      begin
        if FSQLParser.CurrentTokens[i].Contains('=') then {do not localize}
        begin
          FDatabase.Params.Add(FSQLParser.CurrentTokens[i]);
          Inc(i);
        end
        else
        begin
          if (i < MaxTokenIdx - 1) then
          begin
            FDatabase.Params.Add('page_size=' + FSQLParser.CurrentTokens[i+1]); {do not localize}
            Inc(i, 2);
          end;
        end;
      end
      else
      if (i < FSQLParser.CurrentTokens.Count - 2) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'WITH') and      {do not localize}
         (FSQLParser.CurrentTokens[i+1].ToUpper = 'ADMIN') and    {do not localize}
         (FSQLParser.CurrentTokens[i+2].ToUpper = 'OPTION')  then   {do not localize}
      begin
        FDatabase.Params.Add('admin_option=1'); {do not localize}
        inc(i, 3);
      end
      else
      if (i < FSQLParser.CurrentTokens.Count - 3) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'DEFAULT') and   {do not localize}
         (FSQLParser.CurrentTokens[i+1].ToUpper = 'CHARACTER') and  {do not localize}
         (FSQLParser.CurrentTokens[i+2].ToUpper = 'SET')  then  {do not localize}
      begin
        FDatabase.Params.Add('lc_ctype=' + FSQLParser.CurrentTokens[i+3]);  {do not localize}
        inc(i, 4);
      end
      else
      if FSQLParser.CurrentTokens[i].ToUpper = 'NO_RESERVE' then  {do not localize}
      begin
        FDatabase.Params.Add('no_reserve=1');       {do not localize}
        Inc(i);
      end
      else
      if FSQLParser.CurrentTokens[i].ToUpper = 'SET_GROUP_COMMIT' then  {do not localize}
      begin
        FDatabase.Params.Add('set_group_commit=1');       {do not localize}
        Inc(i);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'SET_PAGE_BUFFERS') then  {do not localize}
      begin
        FDatabase.Params.Add('set_page_buffers=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'PREALLOCATE') then  {do not localize}
      begin
        FDatabase.Params.Add('preallocate=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'ODS_VERSION_MAJOR') then  {do not localize}
      begin
        FDatabase.Params.Add('ods_version_major=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'SQL_DIALECT') then  {do not localize}
      begin
        FDatabase.Params.Add('sql_dialect=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'SWEEP_INTERVAL') then  {do not localize}
      begin
        FDatabase.Params.Add('sweep_interval=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'TRANSACTION') then  {do not localize}
      begin
        FDatabase.Params.Add('transaction=' + FSQLParser.CurrentTokens[i+1]);       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'FORCE_WRITE') then  {do not localize}
      begin
        if FSQLParser.CurrentTokens[i+1].ToUpper = 'ASYNC' then {do not localize}
          FDatabase.Params.Add('force_write=0');       {do not localize}
        if FSQLParser.CurrentTokens[i+1].ToUpper = 'SYNC' then {do not localize}
          FDatabase.Params.Add('force_write=1');       {do not localize}
        if FSQLParser.CurrentTokens[i+1].ToUpper = 'DIRECT' then {do not localize}
          FDatabase.Params.Add('force_write=2');       {do not localize}
        Inc(i, 2);
      end
      else
      if (i < MaxTokenIdx - 1) and
         (FSQLParser.CurrentTokens[i].ToUpper = 'FILE') then  {do not localize}
      begin
        FileStr := FSQLParser.CurrentTokens[i] + ' ' + FSQLParser.CurrentTokens[i+1]; {do not localize}
        Inc(i, 2);
        if (i < MaxTokenIdx) and
           (FSQLParser.CurrentTokens[i].ToUpper.Contains('LENGTH')) then {do not localize}
        begin
          if FSQLParser.CurrentTokens[i].Contains('=') then {do not localize}
          begin
            FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i]; {do not localize}
            Inc(i);
          end
          else
          begin
            if (i < MaxTokenIdx - 1) then
            begin
              FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i] + ' ' + FSQLParser.CurrentTokens[i+1]; {do not localize}
              Inc(i, 2);
            end;
          end;
        end
        else
        if FSQLParser.CurrentTokens[i].ToUpper = 'STARTING' then {do not localize}
        begin
          FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i];
          inc(i);
          if (i < MaxTokenIdx) and
             (FSQLParser.CurrentTokens[i].ToUpper = 'AT') then {do not localize}
          begin
            FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i]; {do not localize}
            Inc(i);
          end;
          if (i < MaxTokenIdx) and
             (FSQLParser.CurrentTokens[i].ToUpper = 'PAGE') then {do not localize}
          begin
            FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i]; {do not localize}
            Inc(i);
          end;
          if (i < MaxTokenIdx) then
          begin
            FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i]; {do not localize}
            Inc(i);
          end;

          if (i < MaxTokenIdx - 1) and
             (FSQLParser.CurrentTokens[i].ToUpper = 'LENGTH') then {do not localize}
          begin
            FileStr := FileStr + ' ' + FSQLParser.CurrentTokens[i] + ' ' +  {do not localize}
                         FSQLParser.CurrentTokens[i+1];
            Inc(i, 2);
          end;
        end;
        FDatabase.Params.Add(FileStr);
      end
      else
        Inc(i);
    end;
  end;
  FDatabase.SQLDialect := FSQLDialect;
  FDatabase.CreateDatabase;
  if FStatsOn and Assigned(FDatabase) and FDatabase.Connected then
    FStats.Start;
end;

procedure TIBScript.DoDDL(const Text: string);
begin
  if AutoDDL then
    FDDLQuery.Transaction := FDDLTransaction
  else
    FDDLQuery.Transaction := FTransaction;
  if not FDDLQuery.Transaction.InTransaction then
    FDDLQuery.Transaction.StartTransaction;

  FDDLQuery.SQL.Text := Text;
  try
    FDDLQuery.ExecQuery;
    if AutoDDL then
      FDDLTransaction.Commit;
  except
    if AutoDDL then
      FDDLTransaction.Rollback;
    raise;
  end;
end;

procedure TIBScript.DoDML(const Text: string);
var
  FPaused : Boolean;
begin
  FPaused := false;
  if Assigned(FDataSet) then
  begin
    if FDataSet.Active then
      FDataSet.Close;
    FDataSet.SelectSQL.Text := Text;
    FDataset.Prepare;
    if (FDataSet.Params.Count <> 0) and Assigned(FOnParamCheck) then
    begin
      FOnParamCheck(self, FPaused);
      if FPaused then
      begin
        FSQLParser.Paused := true;
        exit;
      end;
    end;
    if FDataset.SQLType = SQLSelect then
      FDataSet.Open
    else
      FDataset.ExecSQL;
  end
  else
  begin
    if FDMLQuery.Open then
      FDMLQuery.Close;
    FDMLQuery.SQL.Text := Text;
    if not FDMLQuery.Transaction.InTransaction then
      FDMLQuery.Transaction.StartTransaction;
    FDMLQuery.Prepare;
    if (FDMLQuery.Params.Count <> 0) and Assigned(FOnParamCheck) then
    begin
      FOnParamCheck(self, FPaused);
      if FPaused then
      begin
        FSQLParser.Paused := true;
        exit;
      end;
    end;
    FDMLQuery.ExecQuery;
  end;
end;

procedure TIBScript.DoReconnect(const SQLText : String);
var
  i : Integer;
  Param : String;
begin
  if Assigned(FDatabase) then
  begin
    FDatabase.Connected := false;
    i := 2;
    while i < FSQLParser.CurrentTokens.Count - 1 do
    begin
      if CompareText(FSQLParser.CurrentTokens[i], 'USER') = 0 then   {do not localize}
        Param := 'user_name';                                            {do not localize}
      if CompareText(FSQLParser.CurrentTokens[i], 'PASSWORD') = 0 then  {do not localize}
        Param := 'password';                                              {do not localize}
      if CompareText(FSQLParser.CurrentTokens[i], 'ROLE') = 0 then   {do not localize}
        Param := 'user_role';                                            {do not localize}
      Database.Params.Add(Param + '=' + StripQuote(FSQLParser.CurrentTokens[i +
        1]));
      Inc(i, 2);
    end;

    FDatabase.Connected := true;
  end;
end;


procedure TIBScript.DoServerSet(const Text: String);
begin
  if FDMLQuery.Open then
    FDMLQuery.Close;
  FDMLQuery.SQL.Text := Text;
  if not FDMLQuery.Transaction.InTransaction then
    FDMLQuery.Transaction.StartTransaction;
  FDMLQuery.ExecQuery;
end;

procedure TIBScript.DoSET(const Text: string);
begin
  if CompareText('AUTODDL', FSQLParser.CurrentTokens[1]) = 0 then    {do not localize}
    FAutoDDL := FSQLParser.CurrentTokens[2] = 'ON'                    {do not localize}
  else
    if CompareText('STATISTICS', FSQLParser.CurrentTokens[1]) = 0 then {do not localize}
      Statistics := FSQLParser.CurrentTokens[2] = 'ON'               {do not localize}
    else
      if (CompareText('SQL', FSQLParser.CurrentTokens[1]) = 0) and  {do not localize}
         (CompareText('DIALECT', FSQLParser.CurrentTokens[2]) = 0) then  {do not localize}
      begin
        FSQLDialect := StrToInt(FSQLParser.CurrentTokens[3]);
        if Assigned(Database) and
           (Database.SQLDialect <> FSQLDialect) then
        begin
          if Database.Connected then
          begin
            Database.Close;
            Database.SQLDialect := FSQLDialect;
            Database.Open;
          end
          else
            Database.SQLDialect := FSQLDialect;
        end;
      end
      else
      if (CompareText('NAMES', FSQLParser.CurrentTokens[1]) = 0) then  {do not localize}
          FCharSet := FSQLParser.CurrentTokens[2]
        else
          if CompareText('SAVEPOINTS', FSQLParser.CurrentTokens[1]) = 0 then {do not localize}
            if (FSQLParser.CurrentTokens[2] = 'OFF') then {do not localize}
            begin
              if Assigned(FTransaction) and
                 (FTransaction.Params.IndexOf('no_savepoint') < 0) then {do not localize}
                FTransaction.Params.Add('no_savepoint'); {do not localize}
            end
            else
            begin
              if Assigned(FTransaction) and
                 (FTransaction.Params.IndexOf('no_savepoint') >= 0)   then
                FTransaction.Params.Delete(FTransaction.Params.IndexOf('no_savepoint')); {do not localize}
            end
end;

procedure TIBScript.DoSetTransaction(const Text: String);
begin

end;

procedure TIBScript.DropDatabase(const SQLText: string);
begin
  FDatabase.DropDatabase;
end;

procedure TIBScript.ExecuteScript;
begin
  FContinue := true;
  FExecuting := true;
  FCharSet := '';
  InBatch := false;
  if not Assigned(FDataset) then
  begin
    FDMLQuery := TIBSQL.Create(FDatabase);
    if Assigned(FTransaction) then
      FDMLQuery.Transaction := FTransaction;
  end;
  try
    FStats.Clear;
    if FStatsOn and Assigned(FDatabase) and FDatabase.Connected then
      FStats.Start;
    FSQLParser.Parse;
    if FStatsOn then
      FStats.Stop;
  finally
    FExecuting := false;
    if Assigned(FDMLQuery) then
      FreeAndNil(FDMLQuery);
  end;
end;

function TIBScript.GetPaused: Boolean;
begin
  Result := FSQLParser.Paused;
end;

function TIBScript.GetScript: TStrings;
begin
  Result := FSQLParser.Script;
end;

function TIBScript.GetSQLParams: TIBXSQLDA;
begin
  if Assigned(FDataset) then
    Result := FDataset.Params
  else
    Result := FDMLQuery.Params;
end;

function TIBScript.GetTokens: TStrings;
begin
  Result := FSQLParser.CurrentTokens;
end;

procedure TIBScript.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
  begin
    if AComponent = FDataset then
      FDataset := nil
    else
      if AComponent = FDatabase then
        FDatabase := nil
      else
        if AComponent = FTransaction then
          FTransaction := nil;
  end;
end;

function TIBScript.ParamByName(Idx: String): TIBXSQLVAR;
begin
  if Assigned(FDataset) then
    Result := FDataset.ParamByName(Idx)
  else
    Result := FDMLQuery.ParamByName(Idx);
end;

procedure TIBScript.ParserError(Sender: TObject; Error,
  SQLText: string; LineIndex: Integer);
begin
  if Assigned(FOnError) then
    FOnError(Self, Error, SQLText, LineIndex);
  FValidate := false;
  FSQLParser.Paused := true;
end;

procedure TIBScript.ParserParse(Sender: TObject; AKind: TIBParseKind;
  SQLText: string);
var
  Results : IBX.IBExternals.PULong;
  p : PByte;
  Buffer : PPByte;
  I: Integer;
  bt : TBytes;

  function GetSavepointName : String;
  begin
    Result := '';
    if ((FSQLParser.CurrentTokens.Count = 4) and
        (UpperCase(FSQLParser.CurrentTokens[1]) = 'TO') and   {do not localize}
        (UpperCase(FSQLParser.CurrentTokens[2]) = 'SAVEPOINT')) then  {do not localize}
      Result := FSQLParser.CurrentTokens[3];

    if ((FSQLParser.CurrentTokens.Count = 5) and {do not localize}
        (UpperCase(FSQLParser.CurrentTokens[2]) = 'TO') and  {do not localize}
        (UpperCase(FSQLParser.CurrentTokens[3]) = 'SAVEPOINT')) then  {do not localize}
      Result := FSQLParser.CurrentTokens[4];
  end;

begin
  Results := nil;
  try
    FCurrentStmt := AKind;
    if not FValidating then
    begin
      if InBatch then
      begin
        case AKind of
          stmtDDL, stmtDML:
          begin
            bt := Database.Encoding.GetBytes(SQLText + #0);
            IBAlloc(FBatchBuffer, FBatchCount * Sizeof(PByte),
                        (FBatchCount + 1) * Sizeof(PByte));
            IBAlloc(P, 0, Length(bt) + 1);
            Move(bt[0], P^, Length(bt));
            Buffer := FBatchBuffer;
            Inc(Buffer, FBatchCount);
            Buffer^ := p;
            Inc(FBatchCount);
          end;
          stmtBatchExecute:
          begin
            if not Transaction.InTransaction then
              Transaction.StartTransaction;
            try
              GetMem(Results, FBatchCount * Sizeof(ULong));
              Transaction.Call(Database.GDSLibrary.isc_dsql_batch_execute_immed(StatusVector,
                            @Database.Handle, @Transaction.Handle, Database.SQLDialect,
                            FBatchCount, FBatchBuffer, Results), true)

            finally
              Buffer := FBatchBuffer;
              for I := 0 to FBatchCount - 1 do
              begin
                FreeMem(Buffer^);
                Inc(Buffer);
              end;
              FreeMem(FBatchBuffer);
              FBatchBuffer := nil;
              FBatchCount := 0;
              InBatch := false;
              FreeMem(Results);
            end;
          end;
          stmtTERM: FTerminator := Trim(SQLText);
          else
            raise EIBError.Create(-1, SInvalidBatchStatement);
        end;
      end
      else
        case AKind of
          stmtDrop : DropDatabase(SQLText);
          stmtDDL : DoDDL(SQLText);
          stmtDML: DoDML(SQLText);
          stmtSET: DoSET(SQLText);
          stmtSetTransaction : DoSetTransaction(SQLText);
          stmtServerSET: DoServerSET(SQLText);
          stmtCONNECT: DoConnect(SQLText);
          stmtCREATE: DoCreate(SQLText);
          stmtTERM: FTerminator := Trim(SQLText);
          stmtCOMMIT:
          begin
            if FTransaction.InTransaction then
              FTransaction.Commit;
            if Assigned(FDDLTransaction) and FDDLTransaction.InTransaction then
              FDDLTransaction.Commit;
          end;
          stmtCOMMITRetaining:
          begin
            if FTransaction.InTransaction then
              FTransaction.CommitRetaining;
            if Assigned(FDDLTransaction) and FDDLTransaction.InTransaction then
              FDDLTransaction.CommitRetaining;
          end;
          stmtROLLBACK:
          begin
            if FTransaction.InTransaction then
              FTransaction.Rollback;
            if Assigned(FDDLTransaction) and FDDLTransaction.InTransaction then
              FDDLTransaction.Rollback;
          end;
          stmtROLLBACKRetaining:
          begin
            if FTransaction.InTransaction then
              FTransaction.RollbackRetaining;
            if Assigned(FDDLTransaction) and FDDLTransaction.InTransaction then
              FDDLTransaction.RollbackRetaining;
          end;
          stmtReconnect:
            DoReconnect(SQLText);
          stmtRollbackSavepoint :
            FTransaction.RollbackSavepoint(GetSavePointName);
          stmtReleaseSavePoint :
            FTransaction.ReleaseSavepoint(FSQLParser.CurrentTokens[1]);
          stmtStartSavepoint :
            FTransaction.StartSavepoint(FSQLParser.CurrentTokens[1]);
          stmtBatchStart :
          begin
            InBatch := true;
            FBatchCount := 0;
            FBufferSize := 0;
          end;
        end;
    end;
    if Assigned(FOnParse) then
      FOnParse(self, AKind, SQLText);
  except
    on E: EIBError do
    begin
      FContinue := false;
      FValidate := false;
      if Assigned(FOnExecuteError) then
        FOnExecuteError(Self, E.Message, SQLText, FSQLParser.CurrentLine,
          FContinue)
      else
        raise;
      if not FContinue then
        FSQLParser.Paused := true;
    end;
  end;
end;

procedure TIBScript.SetDatabase(const Value: TIBDatabase);
begin
  if FDatabase <> Value then
  begin
    FDatabase := Value;
    FDDLQuery.Database := Value;
    FDDLTransaction.DefaultDatabase := Value;
    FStats.Database := Value;
    if not Assigned(FTransaction) and Assigned(Value) then
      Transaction := Value.DefaultTransaction;
    if Assigned(FDMLQuery) then
      FDMLQuery.Database := Value;
  end;
end;

procedure TIBScript.SetPaused(const Value: Boolean);
begin
  if FSQLParser.Paused and (FCurrentStmt = stmtDML) then
    if Assigned(FDataSet) then
    begin
      if FDataset.SQLType = SQLSelect then
        FDataSet.Open
      else
        FDataset.ExecSQL;
    end
    else
    begin
      FDMLQuery.ExecQuery;
    end;
  FSQLParser.Paused := Value;
end;

// Since scripts tend to be large and TStrings.Assign is slow on large
//   string lists, first move it into a memory stream and then load
//   from hte stream, much faster.
procedure TIBScript.SetScript(const Value: TStrings);
var
  ms : TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Value.SaveToStream(ms);
    ms.Position := 0;
    FSQLParser.Script.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure TIBScript.SetStatsOn(const Value: boolean);
begin
  if FStatsOn <> Value then
  begin
    FStatsOn := Value;
    if FExecuting then
    begin
      if FStatsOn then
        FStats.Start
      else
        FStats.Stop;
    end;
  end;
end;

procedure TIBScript.SetTerminator(const Value: string);
begin
  if FTerminator <> Value then
  begin
    FTerminator := Value;
    FSQLParser.Terminator := Value;
  end;
end;

procedure TIBScript.SetTransaction(const Value: TIBTransaction);
begin
  FTransaction := Value;
  if Assigned(FDMLQuery) then
    FDMLQuery.Transaction := Value;
  if not Assigned(FDatabase) and Assigned(Value) then
    Database := Value.DefaultDatabase;
end;

procedure TIBScript.SetupNewConnection;
begin
  if Assigned(FDatabase) then
  begin
    if FDatabase.Owner <> self then
    begin
      FDDLTransaction.RemoveDatabase(FDatabase);
      Database := TIBDatabase.Create(self);
    end
  end
  else
    Database := TIBDatabase.Create(self);
  Database.LoginPrompt := false;
  if Assigned(FTransaction) and (FTransaction.Owner = self) then
    FTransaction.Free;
  FTransaction := TIBTransaction.Create(self);
  FDatabase.DefaultTransaction := FTransaction;
  FTransaction.DefaultDatabase := FDatabase;
  FDDLTransaction.DefaultDatabase := FDatabase;
  FDDLQuery.Database := FDatabase;
  if Assigned(FDataset) then
  begin
    FDataset.Database := FDatabase;
    FDataset.Transaction := FTransaction;
  end;
end;

function TIBScript.StripQuote(const Text: string): string;
begin
  Result := Text.Trim;
  if Result[Low(Result)].IsInArray([Quote, DBL_QUOTE]) then
    Result := Result.SubString(Low(Result), Length(Result) - 2);
end;

function TIBScript.ValidateScript: Boolean;
begin
  FValidating := true;
  FValidate := true;
  FSQLParser.Parse;
  Result := FValidate;
  FValidating := false;
end;

{ TIBScriptStats }

function TIBScriptStats.AddStringValues(list: TStrings): int64;
var
  i : integer;
  s : String;
begin
  try
    Result := 0;
    for i := 0 to list.count-1 do
    begin
      s := list.ValueFromIndex[i];
      if not s.IsEmpty then
        Result := REsult + s.ToInteger;
    end;
  except
    Result := 0;
  end;
end;

procedure TIBScriptStats.Clear;
begin
  FBuffers := 0;
  FReads := 0;
  FWrites := 0;
  FSeqReads := 0;
  FFetches := 0;
  FReadIdx := 0;
  FDeltaMem := 0;
end;

constructor TIBScriptStats.Create;
begin
  FInfoStats := TIBDatabaseInfo.Create(nil);
  FStarted := False;
end;

destructor TIBScriptStats.Destroy;
begin
  FInfoStats.Free;
  inherited;
end;

procedure TIBScriptStats.SetDatabase(const Value: TIBDatabase);
begin
  FDatabase := Value;
  FInfoStats.Database := Value;
end;

procedure TIBScriptStats.Start;
begin
  if Assigned(Database) and Database.Connected and (not FStarted) then
  begin
    FStartBuffers := FInfoStats.NumBuffers;
    FStartReads := FInfoStats.Reads;
    FStartWrites := FInfoStats.Writes;
    FStartSeqReads := AddStringValues(FInfoStats.ReadSeqCount);
    FStartFetches := FInfoStats.Fetches;
    FStartReadIdx := AddStringValues(FInfoStats.ReadIdxCount);
    FStartingMem := FInfoStats.CurrentMemory;
    FStarted := true;
  end;
end;

procedure TIBScriptStats.Stop;
begin
  if Assigned(Database) and Database.Connected then
  begin
    FBuffers := FInfoStats.NumBuffers - FStartBuffers + FBuffers;
    FReads := FInfoStats.Reads - FStartReads + FReads;
    FWrites := FInfoStats.Writes - FStartWrites + FWrites;
    FSeqReads := AddStringValues(FInfoStats.ReadSeqCount) - FStartSeqReads + FSeqReads;
    FReadIdx := AddStringValues(FInfoStats.ReadIdxCount) - FStartReadIdx + FReadIdx;
    FFetches := FInfoStats.Fetches - FStartFetches + FFetches;
    FDeltaMem := FInfoStats.CurrentMemory - FStartingMem + FDeltaMem;
  end;
  FStarted := False;
end;

end.

