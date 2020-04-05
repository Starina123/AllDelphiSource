{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBDatabase;

interface

uses
  System.Classes, System.SysUtils, IBX.IBHeader, IBX.IBExternals, Data.DB,
  IBX.IB, IBX.IBUtils, IBX.IBIntf, System.Generics.Collections;

type

  TDPBConstantNames = TDictionary<string, integer>;

  TIBDatabase = class;
  TIBTransaction = class;
  TIBBase = class;

  // These are to get around a compiler header generation bug.
  //   Can be removed once the bug is fixed.
  __dummy_TIBBase_array = array of TIBBase;
  __dummy_TIBTransaction_array = array of TIBTransaction;
  __dummy_TIBDatabase_array = array of TIBDatabase;

  TIBDatabaseLoginEvent = procedure(Database: TIBDatabase;
    LoginParams: TStrings) of object;

  IIBEventNotifier = interface
  ['{9427DE09-46F7-4E1D-8B92-C1F88B47BF6D}']  {do not localize}
    procedure RegisterEvents;
    procedure UnRegisterEvents;
    function GetAutoRegister: Boolean;
  end;

  TIBSchema = class(TObject)
  public
    procedure FreeNodes; virtual; abstract;
    function Has_DEFAULT_VALUE(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; virtual; abstract;
    function Has_COMPUTED_BLR(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; virtual; abstract;
    function In_Key(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; virtual; abstract;
  end;

  TIBFileName = type String;
  TSQLObjectsList = TList<TIBBase>;
  TTransactionsList = TList<TIBTransaction>;

  { TIBDatabase }
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBDataBase = class(TCustomConnection)
  private
    FHiddenPassword: String;
    FOnLogin: TIBDatabaseLoginEvent;
    FTraceFlags: TTraceFlags;
    FDBSQLDialect: Integer;
    FSQLDialect: Integer;
    FOnDialectDowngradeWarning: TNotifyEvent;
    FCanTimeout: Boolean;
    FSQLObjects: TSQLObjectsList;
    FTransactions: TTransactionsList;
    FDBName: TIBFileName;
    FDBParams: TStrings;
    FDBParamsChanged: Boolean;
    FDPB: PByte;
    FDPBLength: Short;
    FHandle: TISC_DB_HANDLE;
    FHandleIsShared: Boolean;
    FOnIdleTimer: TNotifyEvent;
    [weak] FDefaultTransaction: TIBTransaction;
    FInternalTransaction: TIBTransaction;
    FTimer: TIBTimer;
    FUserNames: TStringList;
    FEventNotifiers : TList<IIBEventNotifier>;
    FAllowStreamedConnected: Boolean;
    FSchema : TIBSchema;
    FGDSLibrary : IGDSLibrary;
    FCharacterSet: String;
    FCharacterSetCodePage: Integer;
    FServerType: String;
    FEncoding: TEncoding;
    procedure EnsureInactive;
    function GetDBSQLDialect: Integer;
    function GetSQLDialect: Integer;
    procedure SetSQLDialect(const Value: Integer);
    procedure ValidateClientSQLDialect;
    procedure DBParamsChange(Sender: TObject);
    procedure DBParamsChanging(Sender: TObject);
    function GetSQLObject(Index: Integer): TIBBase;
    function GetSQLObjectCount: Integer;
    function GetDBParamByDPB(const Idx: Integer): String;
    function GetIdleTimer: Integer;
    function GetTransaction(Index: Integer): TIBTransaction;
    function GetTransactionCount: Integer;
    function Login: Boolean;
    procedure SetDatabaseName(const Value: TIBFileName);
    procedure SetDBParamByDPB(const Idx: Integer; Value: String);
    procedure SetDBParams(Value: TStrings);
    procedure SetDefaultTransaction(Value: TIBTransaction);
    procedure SetIdleTimer(Value: Integer);
    procedure TimeoutConnection(Sender: TObject);
    function GetIsReadOnly: Boolean;
    function AddSQLObject(ds: TIBBase): Integer;
    procedure RemoveSQLObject(Value : TIBBase);
    procedure RemoveSQLObjects;
    procedure InternalClose(Force: Boolean);
    procedure GenerateDPB(sl: TStrings; var DPB: TBytes; var DPBLength: Short);
    procedure SetServerType(const Value: String);
    function GetSysEncryptPassword: String;
    procedure SetSysEncryptPassword(const Value: String);

  protected
    procedure DoConnect; override;
    procedure DoDisconnect; override;
    function GetConnected: Boolean; override;
    procedure Loaded; override;
    procedure Notification( AComponent: TComponent; Operation: TOperation); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddEventNotifier(Notifier : IIBEventNotifier);
    procedure RemoveEventNotifier(Notifier : IIBEventNotifier);
    procedure ApplyUpdates(const DataSets: array of TDataSet);
    procedure Assign(Source: TPersistent); override;
    procedure CloseDataSets;
    procedure CheckActive;
    procedure CheckInactive;
    procedure CreateDatabase;
    procedure DropDatabase;
    procedure ForceClose;
    procedure GetFieldNames(const TableName: string; List: TStrings);
    procedure GetTableNames(List: TStrings; SystemTables: Boolean = False);
    function IndexOfDBConst(st: String): Integer;
    function TestConnected: Boolean;
    procedure CheckDatabaseName;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    function AddTransaction(TR: TIBTransaction): Integer;
    function FindTransaction(TR: TIBTransaction): Integer;
    function FindDefaultTransaction(): TIBTransaction;
    procedure RemoveTransaction(Value : TIBTransaction);
    procedure RemoveTransactions;
    procedure SetHandle(Value: TISC_DB_HANDLE);
    procedure OnlineDump(Files : Array of String; Sizes : Array of Integer;
         Full, Overwrite : Boolean);
    procedure ExecuteImmediate(SQL : string; Transaction : TIBTransaction = nil);

    procedure Sweep;
    procedure Reclaim;
    procedure Flush;
    procedure CancelStatement(StmtHandle : TISC_STMT_HANDLE);

    property Handle: TISC_DB_HANDLE read FHandle;
    property IsReadOnly: Boolean read GetIsReadOnly;
    property DBParamByDPB[const Idx: Integer]: String read GetDBParamByDPB
                                                      write SetDBParamByDPB;
    property SQLObjectCount: Integer read GetSQLObjectCount;
    property SQLObjects[Index: Integer]: TIBBase read GetSQLObject;
    property HandleIsShared: Boolean read FHandleIsShared;
    property TransactionCount: Integer read GetTransactionCount;
    property Transactions[Index: Integer]: TIBTransaction read GetTransaction;
    property InternalTransaction: TIBTransaction read FInternalTransaction;
    function GDSLibrary : IGDSLibrary;
    procedure EncryptionPassword(password : String; Encryption : String);
    procedure ColumnEncryptionPassword(password : String;
                     tablename : string; column : String);
    {Schema functions}
    function Has_DEFAULT_VALUE(Relation, Field : String) : Boolean;
    function Has_COMPUTED_BLR(Relation, Field : String) : Boolean;
    function In_Key(Relation, Field : String) : Boolean;
    procedure FlushSchema;
    property CharacterSet : String read FCharacterSet;
    property CharacterSetCodePage : Integer read FCharacterSetCodePage;
    property Encoding : TEncoding read FEncoding;
    property SysEncryptPassword : String read GetSysEncryptPassword write SetSysEncryptPassword;

  published
    property Connected;
    property DatabaseName: TIBFileName read FDBName write SetDatabaseName;
    property Params: TStrings read FDBParams write SetDBParams;
    [default(true)]
    property LoginPrompt;
    property DefaultTransaction: TIBTransaction read FDefaultTransaction
                                                 write SetDefaultTransaction;
    property ServerType : String read FServerType write SetServerType;
    [default(0)]
    property IdleTimer: Integer read GetIdleTimer write SetIdleTimer;
    [default(3)]
    property SQLDialect : Integer read GetSQLDialect write SetSQLDialect;
    property DBSQLDialect : Integer read FDBSQLDialect;
    property TraceFlags: TTraceFlags read FTraceFlags write FTraceFlags default [];
    [default(true)]
    property AllowStreamedConnected : Boolean read FAllowStreamedConnected write FAllowStreamedConnected;
    property AfterConnect;
    property AfterDisconnect;
    property BeforeConnect;
    property BeforeDisconnect;
    property OnLogin: TIBDatabaseLoginEvent read FOnLogin write FOnLogin;
    property OnIdleTimer: TNotifyEvent read FOnIdleTimer write FOnIdleTimer;
    property OnDialectDowngradeWarning: TNotifyEvent read FOnDialectDowngradeWarning write FOnDialectDowngradeWarning;
  end;

  { TIBTransaction }

  TIBTransactionAction = (TARollback, TACommit, TARollbackRetaining, TACommitRetaining);
  TAutoStopAction = (saNone, saRollback, saCommit, saRollbackRetaining, saCommitRetaining);
  TDatabaseList = TList<TIBDatabase>;

  TIBTransactionLevel = (ibtrSnapshot, ibtrReadCommitted, ibtrReadOnlyTableStability,
                         ibtrReadWriteTableStability, ibtrPrecommitted);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBTransaction = class(TComponent)
  private
    FCanTimeout         : Boolean;
    FDatabases          : TDatabaseList;
    FSQLObjects         : TSQLObjectsList;
    [weak]
    FDefaultDatabase    : TIBDatabase;
    FHandle             : TISC_TR_HANDLE;
    FHandleIsShared     : Boolean;
    FOnIdleTimer        : TNotifyEvent;
    FStreamedActive     : Boolean;
    FTPB                : PByte;
    FTPBLength          : Short;
    FTimer              : TIBTimer;
    FDefaultAction      : TIBTransactionAction;
    FTRParams           : TStrings;
    FTRParamsChanged    : Boolean;
    FAutoStarted : Boolean;
    FAutoStopAction: TAutoStopAction;
    FAllowAutoStart: Boolean;
    FTransactionID: Int64;
    procedure EnsureNotInTransaction;
    procedure EndTransaction(Action: TIBTransactionAction; Force: Boolean);
    function GetDatabase(Index: Integer): TIBDatabase;
    function GetDatabaseCount: Integer;
    function GetSQLObject(Index: Integer): TIBBase;
    function GetSQLObjectCount: Integer;
    function GetInTransaction: Boolean;
    function GetIdleTimer: Integer;
    procedure BeforeDatabaseDisconnect(DB: TIBDatabase);
    procedure SetActive(Value: Boolean);
    procedure SetDefaultAction(Value: TIBTransactionAction);
    procedure SetDefaultDatabase(Value: TIBDatabase);
    procedure SetIdleTimer(Value: Integer);
    procedure SetTRParams(Value: TStrings);
    procedure TimeoutTransaction(Sender: TObject);
    procedure TRParamsChange(Sender: TObject);
    procedure TRParamsChanging(Sender: TObject);
    procedure AddSQLObject(ds: TIBBase);
    procedure RemoveSQLObject(Item : TIBBase);
    procedure RemoveSQLObjects;
    function GetTransactionID: Int64;
    function GetPrimaryDatabase : TIBDatabase;
  protected
    procedure Loaded; override;
    procedure SetHandle(Value: TISC_TR_HANDLE);
    procedure Notification( AComponent: TComponent; Operation: TOperation); override;

  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; TransactionLevel : TIBTransactionLevel); reintroduce; overload;
    destructor Destroy; override;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    procedure Commit;
    procedure CommitRetaining;
    procedure Rollback;
    procedure RollbackRetaining;
    procedure StartTransaction;
    procedure AutoStartTransaction;
    procedure ReleaseSavepoint(Name : String);
    procedure RollbackSavepoint(Name : String);
    procedure StartSavepoint(Name : String);
    procedure CheckInTransaction;
    procedure CheckNotInTransaction;
    procedure CheckAutoStop;
    procedure Assign(Source: TPersistent); override;

    function AddDatabase(db: TIBDatabase): Integer;
    function FindDatabase(db: TIBDatabase): Integer;
    function FindDefaultDatabase: TIBDatabase;
    procedure RemoveDatabase(Value : TIBDatabase);
    procedure RemoveDatabases;
    procedure CheckDatabasesInList;
    procedure SetTransactionLevel(Level : TIBTransactionLevel);

    property DatabaseCount: Integer read GetDatabaseCount;
    property Databases[Index: Integer]: TIBDatabase read GetDatabase;
    property SQLObjectCount: Integer read GetSQLObjectCount;
    property SQLObjects[Index: Integer]: TIBBase read GetSQLObject;
    property Handle: TISC_TR_HANDLE read FHandle;
    property HandleIsShared: Boolean read FHandleIsShared;
    property InTransaction: Boolean read GetInTransaction;
    property TPB: PByte read FTPB;
    property TPBLength: Short read FTPBLength;
    property TransactionID: Int64 read GetTransactionID;
  published
    property Active: Boolean read GetInTransaction write SetActive default false;
    property AllowAutoStart : Boolean read FAllowAutoStart write FAllowAutoStart default true;
    property DefaultDatabase: TIBDatabase read FDefaultDatabase
                                           write SetDefaultDatabase;
    property IdleTimer: Integer read GetIdleTimer write SetIdleTimer default 0;
    property DefaultAction: TIBTransactionAction read FDefaultAction write SetDefaultAction default taCommit;
    property Params: TStrings read FTRParams write SetTRParams;
    property AutoStopAction : TAutoStopAction read FAutoStopAction write FAutoStopAction default saNone;
    property OnIdleTimer: TNotifyEvent read FOnIdleTimer write FOnIdleTimer;
  end;

  { TIBBase }

  { Virtually all components in IB are "descendents" of TIBBase.
    It is to more easily manage the database and transaction
    connections. }
  TIBBase = class(TObject)
  protected
    [weak] FDatabase: TIBDatabase;
    FIndexInDatabase: Integer;
    [weak] FTransaction: TIBTransaction;
    [weak] FOwner: TObject;
    FBeforeDatabaseDisconnect: TNotifyEvent;
    FAfterDatabaseDisconnect: TNotifyEvent;
    FOnDatabaseFree: TNotifyEvent;
    FBeforeTransactionEnd: TNotifyEvent;
    FAfterTransactionEnd: TNotifyEvent;
    FOnTransactionFree: TNotifyEvent;

    procedure DoBeforeDatabaseDisconnect; virtual;
    procedure DoAfterDatabaseDisconnect; virtual;
    procedure DoDatabaseFree; virtual;
    procedure DoBeforeTransactionEnd; virtual;
    procedure DoAfterTransactionEnd; virtual;
    procedure DoTransactionFree; virtual;
    function GetDBHandle: PISC_DB_HANDLE; virtual;
    function GetTRHandle: PISC_TR_HANDLE; virtual;
    procedure SetDatabase(Value: TIBDatabase); virtual;
    procedure SetTransaction(Value: TIBTransaction); virtual;
  public
    constructor Create(AOwner: TObject);
    destructor Destroy; override;
    procedure CheckDatabase; virtual;
    procedure CheckTransaction; virtual;
  public
    property BeforeDatabaseDisconnect: TNotifyEvent read FBeforeDatabaseDisconnect
                                                   write FBeforeDatabaseDisconnect;
    property AfterDatabaseDisconnect: TNotifyEvent read FAfterDatabaseDisconnect
                                                  write FAfterDatabaseDisconnect;
    property OnDatabaseFree: TNotifyEvent read FOnDatabaseFree write FOnDatabaseFree;
    property BeforeTransactionEnd: TNotifyEvent read FBeforeTransactionEnd write FBeforeTransactionEnd;
    property AfterTransactionEnd: TNotifyEvent read FAfterTransactionEnd write FAfterTransactionEnd;
    property OnTransactionFree: TNotifyEvent read FOnTransactionFree write FOnTransactionFree;
    property Database: TIBDatabase read FDatabase
                                    write SetDatabase;
    property DBHandle: PISC_DB_HANDLE read GetDBHandle;
    property Owner: TObject read FOwner;
    property TRHandle: PISC_TR_HANDLE read GetTRHandle;
    property Transaction: TIBTransaction read FTransaction
                                          write SetTransaction;
  end;

procedure GenerateTPB(sl: TStrings; var TPB: TBytes; var TPBLength: Short);

const
  DPBPrefix = 'isc_dpb_';       {do not localize}
  TPBPrefix = 'isc_tpb_';            {do not localize}

var
  DPBConstantNames : TDPBConstantNames;
  TPBConstantNames : TDPBConstantNames;
  CodePages : TDictionary<String, Integer>;

implementation

uses
  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  {$ENDIF}
  IBX.IBSQLMonitor, IBX.IBCustomDataSet, IBX.IBDatabaseInfo, IBX.IBSQL,
  System.typInfo, IBX.IBXConst, IBX.IBErrorCodes, IBX.IBEvents,
  System.Generics.Defaults;

type

  TFieldNode = class(TObject)
  public
    FieldName : String;
    COMPUTED_BLR : Boolean;
    DEFAULT_VALUE : boolean;
    In_Key : Boolean;
  end;

  TIBSchemaDictionary = TObjectDictionary<string, TIBSchema>;
  TFieldDictionary = TObjectDictionary<String, TFieldNode>;
  TRelationDictionary = TObjectDictionary<String, TFieldDictionary>;

  TSchema = class(TIBSchema)
  private
    FRelations : TRelationDictionary;
    FQuery : TIBSQL;
    FPQuery : TIBSQL;
    function Add_Node(ADatabase : TIBDatabase; Relation, Field : String) : TFieldNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure FreeNodes; override;
    function Has_DEFAULT_VALUE(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; override;
    function Has_COMPUTED_BLR(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; override;
    function In_Key(ADatabase : TIBDatabase; Relation, Field : String) : Boolean; override;
  end;


var
  IBSchemaDictionary : TIBSchemaDictionary;

function GetSchema(DBPath : string) : TIBSchema;
begin
  TMonitor.Enter(IBSchemaDictionary);
  try
    if not IBSchemaDictionary.TryGetValue(DBPath, Result) then
    begin
      Result := TSchema.Create;
      IBSchemaDictionary.Add(DBPath, Result);
    end;
  finally
    TMonitor.Exit(IBSchemaDictionary);
  end;
end;

{ TIBDatabase }

constructor TIBDatabase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if (csDesigning in ComponentState) then
    ServerType := 'IBServer';  {do not localize}
  LoginPrompt := True;
  FSQLObjects := TSQLObjectsList.Create;
  FTransactions := TTransactionsList.Create;
  FDBName := '';
  FDBParams := TStringList.Create;
  FDBParamsChanged := True;
  TStringList(FDBParams).OnChange := DBParamsChange;
  TStringList(FDBParams).OnChanging := DBParamsChanging;
  FDPB := nil;
  FHandle := nil;
  FUserNames := nil;
  FEncoding := nil;
  FInternalTransaction := TIBTransaction.Create(self);
  FInternalTransaction.DefaultDatabase := Self;
  FDBSQLDialect := 3;
  FSQLDialect := 3;
  FTraceFlags := [];
  FEventNotifiers := TList<IIBEventNotifier>.Create;
  FAllowStreamedConnected := true;
end;

destructor TIBDatabase.Destroy;
var
  i : Integer;
begin
  if Assigned(FInternalTransaction) and
     FInternalTransaction.InTransaction then
    FInternalTransaction.Rollback;
  IdleTimer := 0;
  if FHandle <> nil then
  try
    Close;
  except
    ForceClose;
  end;
  if Assigned(FSQLObjects) then
  begin
    for i := FSQLObjects.Count - 1 downto 0 do
      FSQLObjects[i].DoDatabaseFree;
    RemoveSQLObjects;
  end;
  if Assigned(FTransactions) then
    RemoveTransactions;
  FreeMem(FDPB);
  FDPB := nil;
  FDBParams.Free;
  FreeandNil(FSQLObjects);
  FreeAndNil(FUserNames);
  FreeAndNil(FEventNotifiers);
  FreeAndNil(FTransactions);
  FreeAndNil(FInternalTransaction);
  FEncoding.Free;
  FGDSLibrary := nil;
  inherited Destroy;
end;

function TIBDatabase.Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
var
  sqlcode: Long;
  IBErrorCode: Long;
  local_buffer: array[0..IBHugeLocalBufferLength - 1] of Byte;
  usr_msg: String;
  status_vector: PISC_STATUS;
  IBDataBaseErrorMessages: TIBDataBaseErrorMessages;

  { Occasionally the IB call leaves garbage after the terminating null even if
    the buffer sent in is zero filled so can't use trim}
  function ErrorCorrect : String;
  begin
    Result := StringOf(TEncoding.Convert(TEncoding.ANSI, TEncoding.Default, local_buffer));
    SetLength(Result, StrLen(PChar(Result)));
  end;

  procedure SaveDataBaseError;
  begin
    usr_msg := '';

    { Get a local reference to the status vector.
      Get a local copy of the IBDataBaseErrorMessages options.
      Get the SQL error code }
    status_vector := StatusVector;
    IBErrorCode := StatusVectorArray[1];
    IBDataBaseErrorMessages := GetIBDataBaseErrorMessages;
    sqlcode := FGDSLibrary.isc_sqlcode(status_vector);

    if (ShowSQLCode in IBDataBaseErrorMessages) then
      usr_msg := usr_msg + 'SQLCODE: ' + IntToStr(sqlcode); {do not localize}
    Exclude(IBDataBaseErrorMessages, ShowSQLMessage);
    if (ShowSQLMessage in IBDataBaseErrorMessages) then
    begin
      FGDSLibrary.isc_sql_interprete(sqlcode, @local_buffer, IBLocalBufferLength);
      if (ShowSQLCode in IBDataBaseErrorMessages) then
        usr_msg := usr_msg + CRLF;
      usr_msg := usr_msg + ErrorCorrect;
    end;

    if (ShowIBMessage in IBDataBaseErrorMessages) then
    begin
      if (ShowSQLCode in IBDataBaseErrorMessages) or
         (ShowSQLMessage in IBDataBaseErrorMessages) then
        usr_msg := usr_msg + CRLF;
      while (FGDSLibrary.isc_interprete(@local_buffer, @status_vector) > 0) do
      begin
        if (usr_msg <> '') and (usr_msg[Length(usr_msg)] <> LF) then
          usr_msg := usr_msg + CRLF;
        usr_msg := usr_msg + ErrorCorrect;
      end;
    end;
    if (usr_msg <> '') and (usr_msg[High(usr_msg)] = '.') then
      usr_msg := usr_msg.Remove(High(usr_msg), 1);
  end;

begin
  if (ServerType = '') then
    ServerType := 'IBServer';  {do not localize}
  result := ErrCode;
  FCanTimeout := False;
  {Handle when the Error is due to a Database disconnect.  Call the
  OnConnectionLost if it exists.}
  if RaiseError and (CheckStatusVector([isc_lost_db_connection]) or
                     CheckStatusVector([isc_net_read_err]) or
                     CheckStatusVector([isc_net_write_err])) then
  begin
    SaveDataBaseError;
    ForceClose;
    if (MonitorHook <> nil) then
      MonitorHook.SendError(IntToStr(sqlcode) + ' ' + IntToStr(IBErrorCode) + ' ' + usr_msg, self);
    raise EIBInterBaseError.Create(sqlcode, IBErrorCode, usr_msg);
  end;
  if RaiseError and (ErrCode > 0) then
    IBDataBaseError(FGDSLibrary);
end;

procedure TIBDataBase.CancelStatement(StmtHandle: TISC_STMT_HANDLE);
begin
  Call(FGDSLibrary.isc_dsql_free_statement(StatusVector, @StmtHandle, DSQL_cancel), True);
end;

procedure TIBDatabase.CheckActive;
begin
  if StreamedConnected and (not Connected) then
    Loaded;
  if FHandle = nil then
    IBError(ibxeDatabaseClosed, [nil]);
end;

procedure TIBDatabase.EnsureInactive;
begin
  if csDesigning in ComponentState then
  begin
    if FHandle <> nil then
      Close;
  end
end;

procedure TIBDataBase.ExecuteImmediate(SQL: string; Transaction: TIBTransaction);
var
  tr_handle : TISC_TR_HANDLE;
  b : TBytes;
begin
  if not Assigned(Transaction) then
  begin
    InternalTransaction.StartTransaction;
    tr_handle := InternalTransaction.Handle;
  end
  else
    if not Transaction.InTransaction then
      IBError(ibxeNotInTransaction, [])
    else
      tr_handle := Transaction.Handle;
  try
    b := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(SQL));
    SetLength(b, Length(b) + 1);
    b[high(b)] := 0;
    Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                  0, PByte(b), SQLDialect, nil), True);
  finally
    if not Assigned(Transaction) then
      InternalTransaction.Commit;
  end;
end;

procedure TIBDatabase.CheckInactive;
begin
  if FHandle <> nil then
    IBError(ibxeDatabaseOpen, [nil]);
end;

procedure TIBDatabase.CheckDatabaseName;
begin
  if (FDBName = '') then
    IBError(ibxeDatabaseNameMissing, [nil]);
end;

function TIBDatabase.AddSQLObject(ds: TIBBase): Integer;
begin
  if (ds.Owner is TIBCustomDataSet) then
    RegisterClient(TDataSet(ds.Owner));
  Result := FSQLObjects.IndexOf(ds);
  if Result < 0 then
    Result := FSQLObjects.Add(ds);
end;

function TIBDatabase.AddTransaction(TR: TIBTransaction): Integer;
begin
  result := FindTransaction(TR);
  if result <> -1 then
  begin
    result := -1;
    exit;
  end;
  result := FTransactions.Add(TR);
end;

procedure TIBDatabase.DoDisconnect;
var
  i : Integer;
begin
  for i := 0 to FEventNotifiers.Count - 1 do
    FEventNotifiers[i].UnRegisterEvents;
  if Connected then
  try
    InternalClose(False);
  except
    ForceClose;
    raise
  end;
  FDBSQLDialect := 1;
end;

procedure TIBDatabase.CreateDatabase;
const
  sDefaultCharset = 'UPDATE RDB$DATABASE SET RDB$CHARACTER_SET_NAME=''%s''';
  sMultiFiles = 'ALTER DATABASE ADD %s';
var
  TempDBParams: TStrings;
  DPB, DBName, b : TBytes;
  tr_handle: TISC_TR_HANDLE;
  lc_ctype : String;
  I: Integer;

  procedure CreateExecuteImmediate;
  var
    s : String;
    b : TBytes;
    tr_handle: TISC_TR_HANDLE;
  begin
    tr_handle := nil;
    s := 'CREATE DATABASE ''' + FDBName + ''' ' + Params.Text; {do not localize}
      s := s.Replace(#$D#$A, ' ', [rfReplaceAll]);
    b := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(S));
    SetLength(b, Length(b) + 1);
    b[high(b)] := 0;
    Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                0, PByte(b), SQLDialect, nil), True);
    FDBSQLDialect := GetDBSQLDialect;
    FEncoding.Free;
    FEncoding := TEncoding.GetEncoding(DefaultSystemCodePage);
  end;

begin
  CheckInactive;
  if (ServerType = '') then
    ServerType := 'IBServer';  {do not localize}
  if Params.Values['user_name'] = '' then {do not localize}
    CreateExecuteImmediate
  else
  begin
    FDBParamsChanged := False;
    if ((not Params.Values['sql_dialect'].IsEmpty) or           {do not localize}
       (not Params.Values['isc_dpb_sql_dialect'].IsEmpty)) and  {do not localize}
        not Params.Text.ToUpper.Contains('FILE ') then  {do not localize}
      GenerateDPB(FDBParams, DPB, FDPBLength)
    else
    begin
      TempDBParams := TStringList.Create;
      try
       TempDBParams.Assign(FDBParams);
       if TempDBParams.Values['sql_dialect'].IsEmpty then {do not localize}
         TempDBParams.Values['sql_dialect'] := FSQLDialect.ToString; {do not localize}
       for I := TempDBParams.Count - 1 downto 0 do
       begin
         if TempDBParams[i].ToUpper.Contains('FILE ') then {do not localize}
           TempDBParams.Delete(i);
       end;
       GenerateDPB(TempDBParams, DPB, FDPBLength);
      finally
       TempDBParams.Free;
      end;
    end;
    IBAlloc(FDPB, 0, FDPBLength);
    Move(DPB[0], FDPB[0], FDPBLength);

    DBName := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(FDBName));
    if Call(FGDSLibrary.isc_create_database(StatusVector, Length(DBName),
                           PByte(DBName), @FHandle, FDPBLength, FDPB, 0), false) > 0 then
    begin
      FHandle := nil;
      IBDataBaseError(FGDSLibrary);
    end;
    FDBSQLDialect := GetDBSQLDialect;
    ValidateClientSQLDialect;
    lc_ctype := Params.Values['lc_ctype'].ToUpper;  {do not localize}
    if lc_ctype.IsEmpty then
      lc_ctype := Params.Values['isc_dpb_lc_ctype'].ToUpper;  {do not localize}
    if (not lc_ctype.Isempty) then
    begin
      Call(GDSLibrary.isc_start_transaction(StatusVector, @tr_handle, 1, @FHandle, 0, nil), false);
      b := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(Format(sDefaultCharset, [lc_ctype.ToUpper])));
      SetLength(b, Length(b) + 1);
      b[high(b)] := 0;
      Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                0, PByte(b), SQLDialect, nil), True);
      GDSLibrary.isc_commit_transaction(StatusVector, @tr_handle);
    end
    else
    begin
      FCharacterSet := 'NONE';  {do not localize}
      FCharacterSetCodePage := DefaultSystemCodePage;
      FEncoding.Free;
      FEncoding := TEncoding.GetEncoding(FCharacterSetCodePage);
    end;
    if Params.Text.ToUpper.Contains('FILE ') then  {do not localize}
    begin
      for I := 0 to Params.Count - 1 do
      begin
        if Params[i].ToUpper.Contains('FILE ') then {do not localize }
        begin
          try
            Call(GDSLibrary.isc_start_transaction(StatusVector, @tr_handle, 1, @FHandle, 0, nil), false);
            b := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(Format(sMultiFiles, [Params[i]])));
            SetLength(b, Length(b) + 1);
            b[high(b)] := 0;
            Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                      0, PByte(b), SQLDialect, nil), True);
          finally
            GDSLibrary.isc_commit_transaction(StatusVector, @tr_handle);
          end;
        end;
      end;
    end;
  end;
end;

procedure TIBDatabase.DropDatabase;
var
  iBase : TIBBase;
  iTransaction : TIBTransaction;
begin
  { We can only drop an active database connection.  Before dropping
    disconnect the different objects on the connection so they are not
    left in a bad state }
  CheckActive;
  { Tell all connected SQLObjects that we're disconnecting. }
  for iBase in FSQLObjects do
    iBase.DoBeforeDatabaseDisconnect;

  { Tell all connected transactions that we're disconnecting.
    This is so transactions can commit/rollback, accordingly }
  for iTransaction in FTransactions do
    iTransaction.BeforeDatabaseDisconnect(Self);

  Call(FGDSLibrary.isc_drop_database(StatusVector, @FHandle), True);
end;

procedure TIBDatabase.DBParamsChange(Sender: TObject);
begin
  FDBParamsChanged := True;
end;

procedure TIBDatabase.DBParamsChanging(Sender: TObject);
begin
  EnsureInactive;
  CheckInactive;
end;

function TIBDatabase.FindTransaction(TR: TIBTransaction): Integer;
begin
  Result := FTransactions.IndexOf(TR);
end;

function TIBDatabase.FindDefaultTransaction(): TIBTransaction;
var
  iTransaction : TIBTransaction;
begin
  result := FDefaultTransaction;
  if result = nil then
    for iTransaction in FTransactions do
      if (iTransaction.DefaultDatabase = self) and
         (itransaction <> FInternalTransaction) then
       begin
         result := iTransaction;
         break;
       end;
end;

procedure TIBDatabase.ForceClose;
begin
  if Connected then
  begin
    if Assigned(BeforeDisconnect) then
      BeforeDisconnect(Self);
    SendConnectEvent(False);
    InternalClose(True);
    if Assigned(AfterDisconnect) then
      AfterDisconnect(Self);
  end;
end;

function TIBDatabase.GetConnected: Boolean;
begin
  result := FHandle <> nil;
end;

function TIBDatabase.GetSQLObject(Index: Integer): TIBBase;
begin
  result := FSQLObjects[Index];
end;

function TIBDatabase.GetSQLObjectCount: Integer;
begin
  result := FSQLObjects.Count;
end;

function TIBDataBase.GetSysEncryptPassword: String;
begin
  Result := Params.Values['sys_encrypt_password']; {do not localize}
  if Result.IsEmpty then
    Result := Params.Values['isc_dpb_sys_encrypt_password']; {do not localize}
end;

function TIBDatabase.GetDBParamByDPB(const Idx: Integer): String;
var
  ConstIdx : Integer;
  Pair : TPair<String, Integer>;
begin
  ConstIdx := -1;
  if (Idx > 0) and (Idx <= DPBConstantNames.Count) then
  begin
    for Pair in DPBConstantNames do
      if Pair.Value = Idx then
      begin
         ConstIdx := IndexOfDBConst(Pair.Key);
         break;
      end;
  end;

  if ConstIdx = -1 then
    result := ''
  else
    result := Params.ValueFromIndex[ConstIdx];
end;

function TIBDatabase.GetIdleTimer: Integer;
begin
  if Assigned(FTimer) then
    Result := FTimer.Interval
  else
    Result := 0;
end;

function TIBDatabase.GetTransaction(Index: Integer): TIBTransaction;
begin
  result := FTransactions[Index];
end;

function TIBDatabase.GetTransactionCount: Integer;
begin
  result := FTransactions.Count;
end;

function TIBDatabase.IndexOfDBConst(st: String): Integer;
var
  i, pos_of_str: Integer;
begin
  result := -1;
  for i := 0 to Params.Count - 1 do
  begin
    pos_of_str := Params[i].ToLower.IndexOf(st);
    if (pos_of_str = 1) or (pos_of_str = DPBPrefix.Length + 1) then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TIBDatabase.InternalClose(Force: Boolean);
var
  oldHandle : TISC_DB_HANDLE;
  iBase : TIBBase;
  iTransaction : TIBTransaction;
begin
  CheckActive;

  { If we are being forced close this is normally an abnormal connection loss.
    The underlying datasets will need to know that connection is not active
    the underlying objects are told the connection is going away }
  if Force then
  begin
    oldHandle := FHandle;
    FHandle := nil;
  end
  else
    oldHandle := nil;

  for iBase in FSQLObjects do
  try
    iBase.DoBeforeDatabaseDisconnect;
  except
    if not Force then
      raise;
  end;

  { Tell all connected transactions that we're disconnecting.
    This is so transactions can commit/rollback, accordingly
  }
  for iTransaction in FTransactions do
  try
    iTransaction.BeforeDatabaseDisconnect(Self);
  except
    if not Force then
      raise;
  end;

  if Force then
    FHandle := oldHandle;

  if (not HandleIsShared) and
     (Call(FGDSLibrary.isc_detach_database(StatusVector, @FHandle), False) > 0) and
     (not Force) then
    IBDataBaseError(FGDSLibrary)
  else
  begin
    FHandle := nil;
    FHandleIsShared := False;
  end;

  if (not (csDesigning in ComponentState)) and (MonitorHook <> nil) then
    MonitorHook.DBDisconnect(Self);

  for iBase in FSQLObjects do
    iBase.DoAfterDatabaseDisconnect;
end;

procedure TIBDatabase.Loaded;
var
  iTransaction : TIBTransaction;
begin
  try
    if FServerType = '' then
      FServerType :=  'IBServer';
    If (not FAllowStreamedConnected) and
       (not (csDesigning in ComponentState)) then
    begin
      StreamedConnected := false;
      for iTransaction in FTransactions do
        iTransaction.FStreamedActive := False;
    end;
    if StreamedConnected and (not Connected) then
    begin
      inherited Loaded;
      for iTransaction in FTransactions do
        if not iTransaction.Active then
          if iTransaction.FStreamedActive and not iTransaction.InTransaction then
          begin
            iTransaction.StartTransaction;
            iTransaction.FStreamedActive := False;
          end;

      if (FDefaultTransaction <> nil) and
         (FDefaultTransaction.FStreamedActive) and
         (not FDefaultTransaction.InTransaction) then
        FDefaultTransaction.StartTransaction;
      StreamedConnected := False;
    end;
  except
    if csDesigning in ComponentState then
      if Assigned(ApplicationHandleException) then
        ApplicationHandleException(Self)
    else
      raise;
  end;
end;

procedure TIBDatabase.Notification(AComponent: TComponent;
                                        Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDefaultTransaction) then
  begin
    RemoveTransaction(FDefaultTransaction);
    FDefaultTransaction := nil;
  end;
end;

procedure TIBDataBase.OnlineDump(Files: array of String;
  Sizes: array of Integer; Full, Overwrite : Boolean);
var
  sl : TStringList;
  i : Integer;
  DPB, DBName : TBytes;
begin
  if (Length(Sizes) > 0) and (abs(Length(Sizes) - Length(Files)) > 1)  then
    raise Exception.Create(SFileSizeDumpCountIncompatibility);
  if Connected then
    raise Exception.Create(SCannotPerformDumpOnActiveConnection);
  sl := TStringList.Create;
  try
    sl.Values['user_name'] := Params.Values['user_name'];
    sl.Values['password'] := Params.Values['password'];
    if params.Values['instance_name'] <> '' then
      sl.Values['instance_name'] := Params.Values['instance_name'];
    sl.Values['online_dump'] := '1';       {do not localize}
    if Overwrite then
      sl.Values['old_overwrite'] := '1'        {do not localize}
    else
      sl.Values['old_overwrite'] := '0';        {do not localize}
    for i := Low(Files) to High(Files) do
    begin
      sl.Add('old_file_name=' + String(Files[i]));   {do not localize}
      if i <= High(Sizes) then
        sl.Add('old_file_size=' + IntToStr(Sizes[i])); {do not localize}
    end;
    GenerateDPB(sl, DPB, FDPBLength);
    IBAlloc(FDPB, 0, FDPBLength);
    Move(DPB[Low(DPB)], FDPB[0], FDPBLength);
    DBName := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(FDBName));
    if Call(FGDSLibrary.isc_attach_database(StatusVector, Length(DBName),
                           PByte(DBName), @FHandle, FDPBLength, FDPB), False) > 0 then
    begin
      FHandle := nil;
      IBDataBaseError(FGDSLibrary);
    end;
  finally
    sl.Free;
    // since the params are set for dumping don't leave it in a connected state
    if Connected then
      Connected := false;
  end;
end;

function TIBDatabase.Login: Boolean;
var
  IndexOfUser, IndexOfPassword: Integer;
  Username, Password, OldPassword: String;
  LoginParams: TStrings;

  procedure HidePassword;
  var
    I: Integer;
    IndexAt: Integer;
  begin
    IndexAt := 0;
    for I := 0 to Params.Count -1 do
      if Params.Names[i].Trim.ToLower.StartsWith('password') then {do not localize}
      begin
        FHiddenPassword := Params.ValueFromIndex[i];
        IndexAt := I;
        break;
      end;
    if IndexAt <> 0 then
      Params.Delete(IndexAt);
  end;

begin
  if Assigned(FOnLogin) then
  begin
    result := True;
    LoginParams := TStringList.Create;
    try
      LoginParams.Assign(Params);
      FOnLogin(Self, LoginParams);
      Params.Assign(LoginParams);
      HidePassword;
    finally
      LoginParams.Free;
    end;
  end
  else
  begin
    IndexOfUser := IndexOfDBConst('user_name'); {do not localize}
    if IndexOfUser <> -1 then
      Username := Params.ValueFromIndex[IndexOfUser];
    IndexOfPassword := IndexOfDBConst('password'); {Do not localize}
    if IndexOfPassword <> -1 then
    begin
      Password := Params.ValueFromIndex[IndexOfPassword];
      OldPassword := password;
    end;
    if Assigned(LoginDialogExProc) then
      result := LoginDialogExProc(DatabaseName, Username, Password, False)
    else
    begin
      if (MonitorHook <> nil) then
        MonitorHook.SendError(SLoginPromptFailure, self);
      raise EIBError.Create(SLoginPromptFailure);
    end;
    if result then
    begin
      Params.Values['user_name'] := UserName;
      if (Password = OldPassword) then
        FHiddenPassword := ''
      else
      begin
        if OldPassword <> '' then
          HidePassword;
        FHiddenPassword := Password;
      end;
    end;
  end;
end;

procedure TIBDatabase.DoConnect;
var
  DPB, DBName: TBytes;
  TempDBParams: TStrings;
  i : Integer;
begin
  if (ServerType = '') then
    ServerType := 'IBServer';  {do not localize}
  CheckInactive;
  CheckDatabaseName;
  if (not LoginPrompt) and (FHiddenPassword <> '') then
  begin
    FHiddenPassword := '';
    FDBParamsChanged := True;
  end;
  { Use builtin login prompt if requested }
  if LoginPrompt and not Login then
    IBError(ibxeOperationCancelled, [nil]);
  { Generate a new DPB if necessary }
  if not Assigned(FSchema) then
    FSchema := GetSchema(DatabaseName);
  if (FDBParamsChanged) then
  begin
    FDBParamsChanged := False;
    FCharacterSet := 'NONE';
    FCharacterSetCodePage := DefaultSystemCodePage;
    FEncoding.Free;
    FEncoding := TEncoding.GetEncoding(FCharacterSetCodePage);
    if (not LoginPrompt) or (FHiddenPassword = '') then
      GenerateDPB(FDBParams, DPB, FDPBLength)
    else
    begin
      TempDBParams := TStringList.Create;
      try
       TempDBParams.Assign(FDBParams);
       TempDBParams.Add('password=' + String(FHiddenPassword));
       GenerateDPB(TempDBParams, DPB, FDPBLength);
      finally
       TempDBParams.Free;
      end;
    end;
    IBAlloc(FDPB, 0, FDPBLength);
    Move(DPB[0], FDPB[0], FDPBLength);
  end;
  DBName := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(FDBName));
  if Call(FGDSLibrary.isc_attach_database(StatusVector, Length(DBName),
                         PByte(DBName), @FHandle, FDPBLength, FDPB), False) > 0 then
  begin
    FHandle := nil;
    IBDataBaseError(FGDSLibrary);
  end;
  FDBSQLDialect := GetDBSQLDialect;
  ValidateClientSQLDialect;
  if (not (csDesigning in ComponentState)) and (MonitorHook <> nil) then
    MonitorHook.DBConnect(Self);
  for i := 0 to FEventNotifiers.Count - 1 do
    if FEventNotifiers[i].GetAutoRegister then
      FEventNotifiers[i].RegisterEvents;
end;

procedure TIBDatabase.RemoveSQLObject(Value : TIBBase);
begin
  if Assigned(Value) and  Assigned(FSQLObjects) and
    (FSQLObjects.IndexOf(Value) >= 0) then
  begin
    FSQLObjects.Remove(Value);
    Value.Database := nil;
    if (Value.owner is TDataSet) then
      UnregisterClient(TDataSet(Value.Owner));
  end;
end;

procedure TIBDatabase.RemoveSQLObjects;
var
  i : Integer;
  iBase : TIBBase;
begin
  for i := FSQLObjects.Count - 1 downto 0 do
  begin
    iBase := FSQLObjects[i];
    RemoveSQLObject(iBase);
    if (iBase.owner is TDataSet) then
      UnregisterClient(TDataSet(iBase.owner));
  end;
end;

procedure TIBDatabase.RemoveTransaction(Value : TIBTransaction);
begin
  if FTransactions.IndexOf(Value) >= 0 then
    FTransactions.Remove(Value);
  if Value.FindDatabase(self) >= 0 then
    Value.RemoveDatabase(self);
  if Value = FDefaultTransaction then
    FDefaultTransaction := nil;
end;

procedure TIBDatabase.RemoveTransactions;
var
  i : integer;
begin
  for i := FTransactions.Count - 1 downto 0  do
    RemoveTransaction(FTransactions[i]);
end;

procedure TIBDatabase.SetDatabaseName(const Value: TIBFileName);
begin
  if FDBName <> Value then
  begin
    EnsureInactive;
    CheckInactive;
    FDBName := Value;
    FSchema := nil;
  end;
end;

procedure TIBDatabase.SetDBParamByDPB(const Idx: Integer; Value: String);
var
  Pair : TPair<String, Integer>;
begin
  if (Idx > 0) and (Idx <= DPBConstantNames.Count) then
  begin
    for Pair in DPBConstantNames do
      if Pair.Value = Idx then
      begin
        Params.Values[Pair.Key] := Value;
        break;
      end;
  end;
end;

procedure TIBDatabase.SetDBParams(Value: TStrings);
begin
  FDBParams.Assign(Value);
end;

procedure TIBDatabase.SetDefaultTransaction(Value: TIBTransaction);
var
  i: Integer;
begin
  if (FDefaultTransaction <> nil) and (FDefaultTransaction <> Value) then
  begin
    i := FindTransaction(FDefaultTransaction);
    if (i <> -1) and (FDefaultTransaction.DefaultDatabase <> self) then
      RemoveTransaction(FDefaultTransaction);
  end;
  if (Value <> nil) and (FDefaultTransaction <> Value) then
  begin
    Value.AddDatabase(Self);
    AddTransaction(Value);
  end;
  FDefaultTransaction := Value;
end;

//  If the encryption is passed as the empty string it means you are going to be
//    setting a column level encryption.
procedure TIBDataBase.EncryptionPassword(password, Encryption: String);
var
  Query: TIBSQL;
begin
  if not Connected then
    raise Exception.Create(SEncryptionError);
  if not FInternalTransaction.Active then
    FInternalTransaction.StartTransaction;
  Query := TIBSQL.Create(self);
  try
    Query.GoToFirstRecordOnExecute := False;
    Query.Database := Self;
    Query.Transaction := FInternalTransaction;
    Query.SQL.Text := Format('set password %s for encryption %s', [      {do not localize}
        QuotedStr(password), Encryption]);
    Query.ExecQuery;
  finally
    Query.free;
    FInternalTransaction.Commit;
  end;
end;

procedure TIBDatabase.SetHandle(Value: TISC_DB_HANDLE);
begin
  if HandleIsShared then
    Close
  else
    CheckInactive;
  FHandle := Value;
  FHandleIsShared := (Value <> nil);
end;

procedure TIBDatabase.SetIdleTimer(Value: Integer);
begin
  if Value < 0 then
    IBError(ibxeTimeoutNegative, [nil])
  else
    if (Value = 0) then
      FreeAndNil(FTimer)
    else
      if (Value > 0) then
      begin
        if not Assigned(FTimer) then
        begin
          FTimer := TIBTimer.Create(Self);
          FTimer.Enabled := False;
          FTimer.Interval := 0;
          FTimer.OnTimer := TimeoutConnection;
        end;
        FTimer.Interval := Value;
        if not (csDesigning in ComponentState) then
          FTimer.Enabled := True;
      end;
end;

function TIBDatabase.TestConnected: Boolean;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Char;
begin
  result := Connected;
  if result then
  try
    { poke the server to see if connected }
    DatabaseInfoCommand := Char(isc_info_base_level);
    Call(FGDSLibrary.isc_database_info(StatusVector, @Handle, 1, @DatabaseInfoCommand,
                           IBLocalBufferLength, @local_buffer), True);
  except
    ForceClose;
    result := False;
  end;
end;

procedure TIBDatabase.TimeoutConnection(Sender: TObject);
begin
  if Connected then
  begin
    if FCanTimeout then
    begin
      ForceClose;
      if Assigned(FOnIdleTimer) then
        FOnIdleTimer(Self);
    end
    else
      FCanTimeout := True;
  end;
end;

function TIBDatabase.GetIsReadOnly: Boolean;
var
  DatabaseInfo: TIBDatabaseInfo;
begin
  DatabaseInfo := TIBDatabaseInfo.Create(self);
  DatabaseInfo.Database := self;
  if (DatabaseInfo.ODSMajorVersion < 10) then
    result := false
  else
  begin
    if (DatabaseInfo.ReadOnly = 0) then
      result := false
    else
      result := true;
  end;
  DatabaseInfo.Free;
end;

function TIBDatabase.GetSQLDialect: Integer;
begin
  Result := FSQLDialect;
end;

procedure TIBDataBase.SetServerType(const Value: String);
var
  LibString : String;
  OldLibrary : IGDSLibrary;
begin
  if (Value <> '') then
  begin
    if Value <> FServerType then
    begin
      if Connected then
        Raise Exception.Create(SCannotChangeServerType);
      OldLibrary := FGDSLibrary;
      try
        LibString := ValidateServerType(Value);
        FGDSLibrary := GetGDSLibrary(LibString);
        FGDSLibrary.CheckIBLoaded;
        FServerType := LibString;
      except
        FGDSLibrary := OLDLibrary;
        raise;
      end;
    end;
  end
  else
  begin
    FGDSLibrary := nil;
    FServerType := '';
  end;
end;

procedure TIBDatabase.SetSQLDialect(const Value: Integer);
begin
  if (Value < 1) then IBError(ibxeSQLDialectInvalid, [nil]);
  if ((FHandle = nil) or (Value <= FDBSQLDialect))  then
    FSQLDialect := Value
  else
    IBError(ibxeSQLDialectInvalid, [nil]);
end;

procedure TIBDataBase.SetSysEncryptPassword(const Value: String);
begin
  Params.Values['sys_encrypt_password'] := Value;
end;

procedure TIBDataBase.Sweep;
var
  bt : TBytes;
  tr_handle: TISC_TR_HANDLE;
begin
  CheckActive;
  bt := TEncoding.Convert(TEncoding.Default, FEncoding,
            BytesOf('UPDATE TMP$DATABASE SET TMP$STATE = ''SWEEP''')); {do not localize}
  SetLength(bt, Length(bt) + 1);
  bt[high(bt)] := 0;
  Call(GDSLibrary.isc_start_transaction(StatusVector, @tr_handle, 1, @FHandle, 0, nil), false);
  Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                0, PByte(bt), SQLDialect, nil), True);
  GDSLibrary.isc_commit_transaction(StatusVector, @tr_handle);
end;

function TIBDatabase.GetDBSQLDialect: Integer;
var
  DatabaseInfo: TIBDatabaseInfo;
begin
  DatabaseInfo := TIBDatabaseInfo.Create(self);
  DatabaseInfo.Database := self;
  result := DatabaseInfo.DBSQLDialect;
  DatabaseInfo.Free;
end;

procedure TIBDatabase.ValidateClientSQLDialect;
begin
  if (FDBSQLDialect < FSQLDialect) then
  begin
    FSQLDialect := FDBSQLDialect;
    if Assigned (FOnDialectDowngradeWarning) then
      FOnDialectDowngradeWarning(self);
  end;
end;

procedure TIBDatabase.ApplyUpdates(const DataSets: array of TDataSet);
var
  I: Integer;
  DS: TIBCustomDataSet;
  TR: TIBTransaction;
begin
  TR := nil;
  for I := 0 to High(DataSets) do
  begin
    DS := TIBCustomDataSet(DataSets[I]);
    if DS.Database <> Self then
      IBError(ibxeUpdateWrongDB, [nil]);
    if TR = nil then
      TR := DS.Transaction;
    if (DS.Transaction <> TR) or (TR = nil) then
      IBError(ibxeUpdateWrongTR, [nil]);
  end;
  TR.CheckInTransaction;
  for I := 0 to High(DataSets) do
  begin
    DS := TIBCustomDataSet(DataSets[I]);
    DS.ApplyUpdates;
  end;
  TR.CommitRetaining;
end;

procedure TIBDataBase.Assign(Source: TPersistent);
begin
  if Source is TIBDatabase then
  begin
    DatabaseName := TIBDatabase(Source).DatabaseName;
    Params.Assign(TIBDatabase(Source).Params);
    ServerType := TIBDatabase(Source).ServerType;
    LoginPrompt := TIBDatabase(Source).LoginPrompt;
    SqlDialect := TIBDatabase(Source).SQLDialect;
    TraceFlags := TIBDatabase(Source).TraceFlags;
    DefaultTransaction := TIBDatabase(Source).DefaultTransaction;
  end
  else
    inherited;
end;

procedure TIBDatabase.CloseDataSets;
var
  i: Integer;
begin
  for i := 0 to DataSetCount - 1 do
    if (DataSets[i] <> nil) then
      DataSets[i].close;
end;

procedure TIBDataBase.ColumnEncryptionPassword(password, tablename,
  column: String);
var
  Query: TIBSQL;
begin
  if not Connected then
    raise Exception.Create(SEncryptionError);
  if (tablename = '') or (column = '') then
    raise Exception.Create(SColumnEncryptionError);
  if not FInternalTransaction.Active then
    FInternalTransaction.StartTransaction;
  Query := TIBSQL.Create(self);
  try
    Query.GoToFirstRecordOnExecute := False;
    Query.Database := Self;
    Query.Transaction := FInternalTransaction;
    Query.SQL.Text := Format('set password %s for column %s.$s', [      {do not localize}
        QuotedStr(password), tablename, column]);
    Query.ExecQuery;
  finally
    Query.free;
    FInternalTransaction.Commit;
  end;
end;

procedure TIBDatabase.GetFieldNames(const TableName: string; List: TStrings);
var
  Query: TIBSQL;
begin
  if TableName = '' then
    IBError(ibxeNoTableName, [nil]);
  if not Connected then
    Open;
  if not FInternalTransaction.Active then
    FInternalTransaction.StartTransaction;
  Query := TIBSQL.Create(self);
  try
    Query.GoToFirstRecordOnExecute := False;
    Query.Database := Self;
    Query.Transaction := FInternalTransaction;
    Query.SQL.Text := 'Select R.RDB$FIELD_NAME ' + {do not localize}
      'from RDB$RELATION_FIELDS R, RDB$FIELDS F ' + {do not localize}
      'where R.RDB$RELATION_NAME = ' + {do not localize}
      '''' +
      FormatIdentifierValue(SQLDialect, QuoteIdentifier(SQLDialect, TableName)) +
      ''' ' +
      'and R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME ' + {do not localize}
      'ORDER BY RDB$FIELD_POSITION'; {do not localize}
    Query.Prepare;
    Query.ExecQuery;
    List.BeginUpdate;
    try
      List.Clear;
      while (not Query.EOF) and (Query.Next <> nil) do
        List.Add(TrimRight(Query.Current.ByName('RDB$FIELD_NAME').AsString)); {do not localize}
    finally
      List.EndUpdate;
    end;
  finally
    Query.free;
    FInternalTransaction.Commit;
  end;
end;

procedure TIBDatabase.GetTableNames(List: TStrings; SystemTables: Boolean);
var
  Query : TIBSQL;
begin
  if not (csReading in ComponentState) then
  begin
    if not Connected then
      Open;
    if not FInternalTransaction.Active then
      FInternalTransaction.StartTransaction;
    Query := TIBSQL.Create(self);
    try
      Query.GoToFirstRecordOnExecute := False;
      Query.Database := Self;
      Query.Transaction := FInternalTransaction;
      if SystemTables then
        Query.SQL.Text := 'Select RDB$RELATION_NAME from RDB$RELATIONS ' + {do not localize}
                          ' where RDB$VIEW_BLR is NULL ' + {do not localize}
                          'ORDER BY RDB$RELATION_NAME' {do not localize}
      else
        Query.SQL.Text := 'Select RDB$RELATION_NAME from RDB$RELATIONS ' + {do not localize}
                          ' where RDB$VIEW_BLR is NULL and RDB$SYSTEM_FLAG = 0 ' + {do not localize}
                          'ORDER BY RDB$RELATION_NAME'; {do not localize}
      Query.Prepare;
      Query.ExecQuery;
      List.BeginUpdate;
      try
        List.Clear;
        while (not Query.EOF) and (Query.Next <> nil) do
          List.Add(TrimRight(Query.Current[0].AsString));
      finally
        List.EndUpdate;
      end;
    finally
      Query.Free;
      FInternalTransaction.Commit;
    end;
  end;
end;

procedure TIBDataBase.AddEventNotifier(Notifier: IIBEventNotifier);
begin
  FEventNotifiers.Add(Notifier);
end;

procedure TIBDataBase.Reclaim;
var
  bt : TBytes;
  tr_handle: TISC_TR_HANDLE;
begin
  CheckActive;
  bt := TEncoding.Convert(TEncoding.Default, FEncoding,
            BytesOf('UPDATE TMP$DATABASE SET TMP$STATE = ''RECLAIM''')); {do not localize}
  SetLength(bt, Length(bt) + 1);
  bt[high(bt)] := 0;
  Call(GDSLibrary.isc_start_transaction(StatusVector, @tr_handle, 1, @FHandle, 0, nil), false);
  Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                0, PByte(bt), SQLDialect, nil), True);
  GDSLibrary.isc_commit_transaction(StatusVector, @tr_handle);
end;

procedure TIBDataBase.RemoveEventNotifier(Notifier: IIBEventNotifier);
var
  Index : Integer;
begin
  Index := FEventNotifiers.IndexOf(Notifier);
  if Index >= 0 then
    FEventNotifiers.Delete(Index);
end;

function TIBDataBase.In_Key(Relation, Field: String): Boolean;
begin
  if Assigned(FSchema) then
    Result := FSchema.In_Key(Self, Relation, Field)
  else
    Result := false;
end;

function TIBDataBase.Has_COMPUTED_BLR(Relation, Field: String): Boolean;
begin
  if Assigned(FSchema) then
    Result := FSchema.Has_COMPUTED_BLR(Self, Relation, Field)
  else
    Result := false;
end;

function TIBDataBase.Has_DEFAULT_VALUE(Relation, Field: String): Boolean;
begin
  if Assigned(FSchema) then
    Result := FSchema.Has_DEFAULT_VALUE(Self, Relation, Field)
  else
    Result := false;
end;

procedure TIBDataBase.Flush;
var
  bt : TBytes;
  tr_handle: TISC_TR_HANDLE;
begin
  CheckActive;
  bt := TEncoding.Convert(TEncoding.Default, FEncoding,
            BytesOf('UPDATE TMP$DATABASE SET TMP$STATE = ''FLUSH''')); {do not localize}
  SetLength(bt, Length(bt) + 1);
  bt[high(bt)] := 0;
  Call(GDSLibrary.isc_start_transaction(StatusVector, @tr_handle, 1, @FHandle, 0, nil), false);
  Call(FGDSLibrary.isc_dsql_execute_immediate(StatusVector, @FHandle, @tr_handle,
                0, PByte(bt), SQLDialect, nil), True);
  GDSLibrary.isc_commit_transaction(StatusVector, @tr_handle);
end;

procedure TIBDataBase.FlushSchema;
begin
  if Assigned(FSchema) then
    FSchema.FreeNodes;
end;

{ TIBTransaction }

constructor TIBTransaction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDatabases := TDatabaseList.Create;
  FSQLObjects := TSQLObjectsList.Create;
  FHandle := nil;
  FTPB := nil;
  FTPBLength := 0;
  FTRParams := TStringList.Create;
  FTRParamsChanged := True;
  TStringList(FTRParams).OnChange := TRParamsChange;
  TStringList(FTRParams).OnChanging := TRParamsChanging;
  FDefaultAction := taCommit;
  FAllowAutoStart := true;
  FTransactionID := 0;
  if AOwner is TIBDatabase then
    DefaultDatabase := TIBDataBase(AOwner);
end;

destructor TIBTransaction.Destroy;
var
  i : Integer;
begin
  if InTransaction then
    case FDefaultAction of
      TACommit, TACommitRetaining :
        EndTransaction(TACommit, True);
      TARollback, TARollbackRetaining :
        EndTransaction(TARollback, True);
    end;
  for i := FSQLObjects.Count - 1 downto 0 do
    FSQLObjects[i].DoTransactionFree;

  RemoveSQLObjects;
  RemoveDatabases;
  FreeMem(FTPB);
  FTPB := nil;
  FTRParams.Free;
  FreeAndNil(FSQLObjects);
  FreeAndNil(FDatabases);

  inherited Destroy;
end;

function TIBTransaction.Call(ErrCode: ISC_STATUS;
  RaiseError: Boolean): ISC_STATUS;
var
  iDatabase : TIBDatabase;

begin
  result := ErrCode;
  for iDatabase in FDatabases do
    iDatabase.FCanTimeout := False;
  FCanTimeout := False;
  {Handle when the Error is due to a Database disconnect.  Pass it on to
   FDatabase so it can handle this}
  if CheckStatusVector([isc_lost_db_connection]) then
    GetPrimaryDatabase.Call(ErrCode, RaiseError)
  else
    if RaiseError and (result > 0) then
      IBDataBaseError(GetPrimaryDatabase.GDSLibrary);
end;

procedure TIBTransaction.CheckDatabasesInList;
begin
  if GetDatabaseCount = 0 then
    IBError(ibxeNoDatabasesInTransaction, [nil]);
end;

procedure TIBTransaction.CheckInTransaction;
begin
  if FStreamedActive and (not InTransaction) then
    Loaded;
  if (FHandle = nil) then
    IBError(ibxeNotInTransaction, [nil]);
end;

procedure TIBTransaction.EnsureNotInTransaction;
begin
  if csDesigning in ComponentState then
  begin
    if FHandle <> nil then
      Rollback;
  end;
end;

procedure TIBTransaction.CheckNotInTransaction;
begin
  if (FHandle <> nil) then
    IBError(ibxeInTransaction, [nil]);
end;

procedure TIBTransaction.CheckAutoStop;
var
  AllClosed : Boolean;
  iBase : TIBBase;
begin
  if (FAutoStopAction = saNone) or (not InTransaction) or (not FAutoStarted)  then
    exit;
  AllClosed := true;
  for iBase in FSQLObjects do
  begin
    if (iBase.owner is TIBCustomDataSet) then
      AllClosed := not TIBCustomDataSet(iBase.owner).Active;
    if not AllClosed then
      break;
  end;

  if AllClosed then
    case FAutoStopAction of
      saRollback : EndTransaction(TARollBack, false);
      saCommit : EndTransaction(TACommit, false);
      saRollbackRetaining : EndTransaction(TARollbackRetaining, false);
      saCommitRetaining : EndTransaction(TACommitRetaining, false);
    end;
end;

function TIBTransaction.AddDatabase(db: TIBDatabase): Integer;
begin
  Result := FindDatabase(db);
  if Result < 0 then
    Result := FDatabases.Add(db);
end;

procedure TIBTransaction.AddSQLObject(ds: TIBBase);
begin
  if FSQLObjects.IndexOf(ds) < 0  then
    FSQLObjects.Add(ds);
end;

procedure TIBTransaction.Assign(Source: TPersistent);
begin
  if Source is TIBTransaction then
  begin
    AllowautoStart := TIBTransaction(Source).AllowAutoStart;
    AutoStopAction := TIBTransaction(Source).AutoStopAction;
    DefaultAction := TIBTransaction(Source).DefaultAction;
    DefaultDatabase := TIBTransaction(Source).DefaultDatabase;
    Params.Assign(TIBTransaction(Source).Params);
  end
  else
    inherited;
end;

procedure TIBTransaction.Commit;
begin
  EndTransaction(TACommit, False);
end;

procedure TIBTransaction.CommitRetaining;
begin
  EndTransaction(TACommitRetaining, False);
end;

constructor TIBTransaction.Create(AOwner: TComponent;
  TransactionLevel: TIBTransactionLevel);
begin
  Create(AOwner);
  SetTransactionLevel(TransactionLevel);
end;

procedure TIBTransaction.EndTransaction(Action: TIBTransactionAction;
  Force: Boolean);
var
  status: ISC_STATUS;
  OldAutoStop : TAutoStopAction;
  FGDSLibrary : IGDSLibrary;
  iBase : TIBBase;

begin
  CheckInTransaction;
  if Assigned(DefaultDatabase) then
    FGDSLibrary := DefaultDatabase.GDSLibrary
  else
    if FDatabases.Count > 0 then
      FGDSLibrary := GetPrimaryDatabase.GDSLibrary;

  case Action of
    TARollback, TACommit:
    begin
      if (HandleIsShared) and
         (Action <> FDefaultAction) and
         (not Force) then
        IBError(ibxeCantEndSharedTransaction, [nil]);
      OldAutoStop := FAutoStopAction;
      FAutoStopAction := saNone;
      try
        for iBase in FSQLObjects do
          iBase.DoBeforeTransactionEnd;
      finally
        FAutoStopAction := OldAutoStop;
      end;
      if InTransaction then
      begin
        if HandleIsShared then
        begin
          FHandle := nil;
          FHandleIsShared := False;
          status := 0;
        end
        else
          if (Action = TARollback) then
            status := Call(FGDSLibrary.isc_rollback_transaction(StatusVector, @FHandle), False)
          else
            status := Call(FGDSLibrary.isc_commit_transaction(StatusVector, @FHandle), False);
        if ((Force) and (status > 0)) then
          status := Call(FGDSLibrary.isc_rollback_transaction(StatusVector, @FHandle), False);
        if Force then
          FHandle := nil
        else
          if (status > 0) then
          try
            IBDataBaseError(FGDSLibrary);
          except
            on E : EIBError do
            begin
              if (E.SQLCode = -902) and (E.IBErrorCode = 335544721) then
                GetPrimaryDatabase.ForceClose;
              raise;
            end;
          end;
        for iBase in FSQLObjects do
          iBase.DoAfterTransactionEnd;
      end;
      FTransactionID := 0;
    end;
    TACommitRetaining:
      Call(FGDSLibrary.isc_commit_retaining(StatusVector, @FHandle), True);
    TARollbackRetaining:
      Call(FGDSLibrary.isc_rollback_retaining(StatusVector, @FHandle), True);
  end;
  if (not (csDesigning in ComponentState)) and (MonitorHook <> nil) then
  begin
    case Action of
      TACommit:
        MonitorHook.TRCommit(Self);
      TARollback:
        MonitorHook.TRRollback(Self);
      TACommitRetaining:
        MonitorHook.TRCommitRetaining(Self);
      TARollbackRetaining:
        MonitorHook.TRRollbackRetaining(Self);
    end;
  end;
  if not Active then
  begin
    FAutoStarted := FALSE;
  end;
end;

function TIBTransaction.GetDatabase(Index: Integer): TIBDatabase;
begin
  result := FDatabases[Index];
end;

function TIBTransaction.GetDatabaseCount: Integer;
begin
  result := FDatabases.Count;
end;

function TIBTransaction.GetPrimaryDatabase: TIBDatabase;
begin
  if Assigned(DefaultDatabase) then
    result := DefaultDatabase
  else
    if FDatabases.Count > 0 then
      Result := FDatabases[0]
    else
      Result := nil;
end;

function TIBTransaction.GetSQLObject(Index: Integer): TIBBase;
begin
  result := FSQLObjects[Index];
end;

function TIBTransaction.GetSQLObjectCount: Integer;
begin
  result := FSQLObjects.Count;
end;

function TIBTransaction.GetInTransaction: Boolean;
begin
  result := (FHandle <> nil);
end;

function TIBTransaction.FindDatabase(db: TIBDatabase): Integer;
begin
  result := FDatabases.IndexOf(db);
end;

function TIBTransaction.FindDefaultDatabase: TIBDatabase;
var
  iDatabase : TIBDatabase;
begin
  result := FDefaultDatabase;
  if result = nil then
    for iDatabase in FDatabases do
      if (iDatabase.DefaultTransaction = self) then
      begin
        result := iDatabase;
        break;
      end;
end;

function TIBTransaction.GetIdleTimer: Integer;
begin
  if Assigned(FTimer) then
    Result := FTimer.Interval
  else
    Result := 0;
end;

procedure TIBTransaction.Loaded;
begin
  inherited Loaded;
   if FStreamedActive and
      DefaultDatabase.Connected and
      (FHandle = nil) then
     StartTransaction;
end;

procedure TIBTransaction.BeforeDatabaseDisconnect(DB: TIBDatabase);
begin
  if InTransaction then
    case FDefaultAction of
      TACommit, TACommitRetaining :
        EndTransaction(TACommit, True);
      TARollback, TARollbackRetaining :
        EndTransaction(TARollback, True);
    end;
end;

procedure TIBTransaction.RemoveDatabase(Value : TIBDatabase);
begin
  // If the last connection is being removed and in a transaction then
  //    End the transaction before losing hte gdslibrary needed to make calls

  if InTransaction and (FDatabases.Count = 1) and
     (FDatabases.IndexOf(Value) >= 0) then
    case FDefaultAction of
      TACommit, TACommitRetaining :
        EndTransaction(TACommit, True);
      TARollback, TARollbackRetaining :
        EndTransaction(TARollback, True);
    end;

  if FDatabases.IndexOf(Value) >= 0 then
    FDatabases.Remove(Value);
  if Value.FindTransaction(self) >= 0 then
    Value.RemoveTransaction(self);
  if Value = FDefaultDatabase then
    FDefaultDatabase := nil;

end;

procedure TIBTransaction.RemoveDatabases;
var
  i : Integer;
begin
  if Assigned(FDatabases) then
    for i := FDatabases.Count - 1 downto 0 do
      RemoveDatabase(FDatabases[i]);
end;

procedure TIBTransaction.RemoveSQLObject(Item : TIBBase);
begin
  if Assigned(FSQLObjects)then
    FSQLObjects.Remove(Item);
end;

procedure TIBTransaction.RemoveSQLObjects;
begin
  if Assigned(FSQLObjects) then
    FSQLObjects.Clear;
end;

procedure TIBTransaction.Rollback;
begin
  EndTransaction(TARollback, False);
end;

procedure TIBTransaction.RollbackRetaining;
begin
  EndTransaction(TARollbackRetaining, False);
end;

procedure TIBTransaction.SetActive(Value: Boolean);
begin
  if csReading in ComponentState then
    FStreamedActive := Value
  else
    if Value and not InTransaction then
      StartTransaction
    else
      if not Value and InTransaction then
        Rollback;
end;

procedure TIBTransaction.SetDefaultAction(Value: TIBTransactionAction);
var
  FGDSLibrary : IGDSLibrary;
  S : String;
begin
  if Assigned(DefaultDatabase) then
    FGDSLibrary := DefaultDatabase.GDSLibrary
  else
  begin
    s := 'IBServer';   // Do Not Localize
    FGDSLibrary := GetGDSLibrary(s);
  end;
  if (Value = taRollbackRetaining) and (FGDSLibrary.GetIBClientVersion < 6) then
    IBError(ibxeIB60feature, [nil]);
  FDefaultAction := Value;
end;

procedure TIBTransaction.SetDefaultDatabase(Value: TIBDatabase);
var
  iBase: TIBBase;
begin
  if (FDefaultDatabase <> nil) and (FDefaultDatabase <> Value) then
    FDefaultDatabase.RemoveTransaction(Self);

  if (Value <> nil) and (FDefaultDatabase <> Value) then
  begin
    Value.AddTransaction(Self);
    AddDatabase(Value);
    for iBase in FSQLObjects do
      if iBase.Database = nil then
        SetOrdProp(iBase.Owner, 'Database', NativeInt(Value));
  end;
  FDefaultDatabase := Value;
end;

procedure TIBTransaction.SetHandle(Value: TISC_TR_HANDLE);
begin
  if (HandleIsShared) then
    case FDefaultAction of
      TACommit, TACommitRetaining :
        EndTransaction(TACommit, True);
      TARollback, TARollbackRetaining :
        EndTransaction(TARollback, True);
    end
  else
    CheckNotInTransaction;
  FHandle := Value;
  FHandleIsShared := (Value <> nil);
end;

procedure TIBTransaction.Notification( AComponent: TComponent;
                                        Operation: TOperation);
begin
  inherited Notification( AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDefaultDatabase) then
  begin
    RemoveDatabase(AComponent as TIBDatabase);
    FDefaultDatabase := nil;
  end;
end;

procedure TIBTransaction.SetIdleTimer(Value: Integer);
begin
  if Value < 0 then
    IBError(ibxeTimeoutNegative, [nil])
  else
    if (Value = 0) then
      FreeAndNil(FTimer)
    else
      if (Value > 0) then
      begin
        if not Assigned(FTimer) then
        begin
          FTimer := TIBTimer.Create(Self);
          FTimer.Enabled := False;
          FTimer.Interval := 0;
          FTimer.OnTimer := TimeoutTransaction;
        end;
        FTimer.Interval := Value;
        if not (csDesigning in ComponentState) then
          FTimer.Enabled := True;
      end;
end;

procedure TIBTransaction.SetTransactionLevel(Level: TIBTransactionLevel);
begin
  checkNotInTransaction;
  Params.Clear;
  case Level of
    ibtrSnapshot:
    begin
      Params.Add('concurrency');  {do not localize}
      Params.Add('nowait');       {do not localize}
    end;
    ibtrReadCommitted:
    begin
      Params.Add('read_committed'); {do not localize}
      Params.Add('rec_version');    {do not localize}
      Params.Add('nowait');         {do not localize}
    end;
    ibtrReadOnlyTableStability:
    begin
      Params.Add('read');           {do not localize}
      Params.Add('consistency');    {do not localize}
    end;
    ibtrReadWriteTableStability:
    begin
      Params.Add('write');          {do not localize}
      Params.Add('consistency');    {do not localize}
    end;
    ibtrPrecommitted:
    begin
      Params.Add('read_committed'); {do not localize}
      Params.Add('rec_version');    {do not localize}
      Params.Add('nowait');         {do not localize}
      Params.Add('read');           {do not localize}
    end;
  end;
end;

procedure TIBTransaction.SetTRParams(Value: TStrings);
begin
  FTRParams.Assign(Value);
end;

procedure TIBTransaction.StartTransaction;
var
  pteb: PISC_TEB_ARRAY;
  TPB: TBytes;
  i: Integer;
  iDatabase : TIBDatabase;
begin
  CheckNotInTransaction;
  CheckDatabasesInList;
  for iDatabase in FDatabases do
   begin
    if not iDatabase.Connected then
      if iDatabase.StreamedConnected then
       begin
        iDatabase.Open;
        iDatabase.StreamedConnected := False;
       end
       else
         IBError(ibxeDatabaseClosed, [nil]);
   end;
  if FTRParamsChanged then
  begin
    FTRParamsChanged := False;
    GenerateTPB(FTRParams, TPB, FTPBLength);
    if FTPBLength > 0 then
    begin
      IBAlloc(FTPB, 0, FTPBLength);
      Move(TPB[0], FTPB[0], FTPBLength);
    end;
  end;

  pteb := nil;
  IBAlloc(pteb, 0, DatabaseCount * SizeOf(TISC_TEB));
  try
    i := 0;
    for iDatabase in FDatabases do
    begin
      pteb^[i].db_handle := @(iDatabase.Handle);
      pteb^[i].tpb_length := FTPBLength;
      pteb^[i].tpb_address := PByte(FTPB);
      inc(i);
    end;
    if Call(FDatabases[0].GDSLibrary.isc_start_multiple(StatusVector, @FHandle,
                               DatabaseCount, PISC_TEB(pteb)), False) > 0 then
    begin
      FHandle := nil;
      IBDataBaseError(FDatabases[0].GDSLibrary);
    end;
    if (not (csDesigning in ComponentState)) and (MonitorHook <> nil) then
      MonitorHook.TRStart(Self);
  finally
    FreeMem(pteb);
  end;
end;

procedure TIBTransaction.TimeoutTransaction(Sender: TObject);
begin
  if InTransaction then
  begin
    if FCanTimeout then
    begin
      EndTransaction(FDefaultAction, True);
      FCanTimeout := True;
      if Assigned(FOnIdleTimer) then
        FOnIdleTimer(Self);
    end
    else
      FCanTimeout := True;
  end;
end;

procedure TIBTransaction.TRParamsChange(Sender: TObject);
begin
  FTRParamsChanged := True;
end;

procedure TIBTransaction.TRParamsChanging(Sender: TObject);
begin
  EnsureNotInTransaction;
  CheckNotInTransaction;
end;

procedure TIBTransaction.AutoStartTransaction;
begin
  if AllowAutoStart or (csDesigning in ComponentState) then
  begin
    StartTransaction;
    FAutoStarted := true;
  end;
end;

procedure TIBTransaction.ReleaseSavepoint(Name: String);
var
  bValue : TBytes;
begin
  CheckInTransaction;
  bValue := TEncoding.ANSI.GetBytes(Name);
  SetLength(bValue, Length(bValue) + 1);
  Call(FDatabases[0].GDSLibrary.isc_release_savepoint(StatusVector, @FHandle,
                               PByte(bValue)), False);
end;

procedure TIBTransaction.RollbackSavepoint(Name: String);
var
  bValue : TBytes;
begin
  CheckInTransaction;
  bValue := TEncoding.ANSI.GetBytes(name);
  SetLength(bValue, Length(bValue) + 1);
  Call(FDatabases[0].GDSLibrary.isc_rollback_savepoint(StatusVector, @FHandle,
                               PByte(bValue), 0), False);
end;

procedure TIBTransaction.StartSavepoint(Name: String);
var
  bValue : TBytes;
begin
  CheckInTransaction;
  bValue := TEncoding.ANSI.GetBytes(name);
  SetLength(bValue, Length(bValue) + 1);
  Call(FDatabases[0].GDSLibrary.isc_start_savepoint(StatusVector, @FHandle,
                               PByte(bValue)), False);
end;

function TIBTransaction.GetTransactionID: Int64;
var
  length: Integer;
  result_buffer: array[0..63] of Byte;
  _TransactionInfoCommand: Char;
begin
  CheckInTransaction;
  if FTransactionID = 0 then
  begin
    _TransactionInfoCommand := Char(isc_info_tra_id);
    Call(FDatabases[0].GDSLibrary.isc_transaction_info(StatusVector, @Handle, 1,
        @_TransactionInfoCommand, 64, @result_buffer), True);
    length := FDatabases[0].GDSLibrary.isc_vax_integer(@result_buffer[1], 2);
    FTransactionID := FDatabases[0].GDSLibrary.isc_portable_integer(@result_buffer[3], length);
  end;
  Result := FTransactionID;
end;

{ TIBBase }
constructor TIBBase.Create(AOwner: TObject);
begin
  FOwner := AOwner;
end;

destructor TIBBase.Destroy;
begin
  SetDatabase(nil);
  SetTransaction(nil);
  inherited Destroy;
end;

procedure TIBBase.CheckDatabase;
begin
  if (FDatabase = nil) then
    IBError(ibxeDatabaseNotAssigned, [nil]);
  FDatabase.CheckActive;
end;

procedure TIBBase.CheckTransaction;
begin
  if FTransaction = nil then
    IBError(ibxeTransactionNotAssigned, [nil]);
  FTransaction.CheckInTransaction;
end;

function TIBBase.GetDBHandle: PISC_DB_HANDLE;
begin
  CheckDatabase;
  result := @FDatabase.Handle;
end;

function TIBBase.GetTRHandle: PISC_TR_HANDLE;
begin
  CheckTransaction;
  result := @FTransaction.Handle;
end;

procedure TIBBase.DoBeforeDatabaseDisconnect;
begin
  if Assigned(BeforeDatabaseDisconnect) then
    BeforeDatabaseDisconnect(Self);
end;

procedure TIBBase.DoAfterDatabaseDisconnect;
begin
  if Assigned(AfterDatabaseDisconnect) then
    AfterDatabaseDisconnect(Self);
end;

procedure TIBBase.DoDatabaseFree;
begin
  if Assigned(OnDatabaseFree) then
    OnDatabaseFree(Self);
  SetDatabase(nil);
end;

procedure TIBBase.DoBeforeTransactionEnd;
begin
  if Assigned(BeforeTransactionEnd) then
    BeforeTransactionEnd(Self);
end;

procedure TIBBase.DoAfterTransactionEnd;
begin
  if Assigned(AfterTransactionEnd) then
    AfterTransactionEnd(Self);
end;

procedure TIBBase.DoTransactionFree;
begin
  if Assigned(OnTransactionFree) then
    OnTransactionFree(Self);
  SetTransaction(nil);
end;

procedure TIBBase.SetDatabase(Value: TIBDatabase);
begin
  if (FDatabase <> nil) then
    FDatabase.RemoveSQLObject(self);
  FDatabase := Value;
  if (FDatabase <> nil) then
  begin
    FIndexInDatabase := FDatabase.AddSQLObject(Self);
    if (FTransaction = nil) then
      Transaction := FDatabase.FindDefaultTransaction;
  end;
end;

procedure TIBBase.SetTransaction(Value: TIBTransaction);
begin
  if (FTransaction <> nil) then
    FTransaction.RemoveSQLObject(Self);
  FTransaction := Value;
  if (FTransaction <> nil) then
  begin
    FTransaction.AddSQLObject(Self);
    if (FDatabase = nil) then
      Database := FTransaction.FindDefaultDatabase;
  end;
end;

function TIBDataBase.GDSLibrary: IGDSLibrary;
begin
  if (ServerType <> '')  and
     (FGDSLibrary = nil) then
  begin
    FGDSLibrary := IBX.IBIntf.GetGDSLibrary(FServerType);
    FGDSLibrary.CheckIBLoaded;  // needed becaue sometimes it will be bypassed
  end;
  Result := FGDSLibrary;
end;

{ GenerateDPB -
  Given a string containing a textual representation
  of the database parameters, generate a database
  parameter buffer, and return it and its length
  in DPB and DPBLength, respectively. }

procedure TIBDatabase.GenerateDPB(sl: TStrings; var DPB: TBytes; var DPBLength: Short);
var
  i, pval: Integer;
  pval64 : Int64;
  DPBVal: Integer;
  ParamName, ParamValue: String;
  DPBPos : Integer;  // Always increment so it is pointing to the next value to be set
  bValue : TBytes;
{BIG_5, CYRL, NEXT, OCTETS are unsupported since I could not find their code pages}

  procedure SetCodePage;
  begin
    if CodePages.ContainsKey(FCharacterSet) then
      FCharacterSetCodePage := CodePages.Items[FCharacterSet]
      else
        FCharacterSetCodePage := DefaultSystemCodePage;

      FEncoding.Free;
      FEncoding := TEncoding.GetEncoding(FCharacterSetCodePage);
  end;

begin
  { The DPB is initially empty, with the exception that
    the DPB version must be the first byte of the string. }
  DPBLength := 1;
  SetLength(DPB, DPBLength);
  DPBPos := Low(DPB);
  DPB[DPBPos] := Byte(isc_dpb_version1);
  Inc(DPBPos);
  {Iterate through the textual database parameters, constructing
   a DPB on-the-fly }
  for i := 0 to sl.Count - 1 do
  begin
    { skip blank lines }
    if sl[i].Trim.IsEmpty then
      continue;
    { Get the parameter's name and value from the list,
      and make sure that the name is all lowercase with
      no leading 'isc_dpb_' prefix
    }
    if sl.Names[i].Trim.IsEmpty then
    begin
      ParamName := sl[i].ToLower;
      ParamValue := '';
    end
    else
    begin
      ParamName := sl.Names[i].ToLower;
      ParamValue := sl.ValueFromIndex[i];
    end;
    if ParamName.StartsWith(DPBPrefix) then
      ParamName := ParamName.Remove(0, DPBPrefix.Length);
     { We want to translate the parameter name to some Integer
       value. We do this by scanning through a list of known
       database parameter names (DPBConstantNames, defined above) }
    DPBVal := 0;
    { Find the parameter }
    DPBConstantNames.TryGetValue(ParamName, DPBVal);

     {  A database parameter either contains a string value (case 1)
       or an Integer value (case 2)
       or no value at all (case 3)
       or an error needs to be generated (case else)  }

    case DPBVal of
      isc_dpb_user_name, isc_dpb_password, isc_dpb_password_enc,
      isc_dpb_sys_user_name, isc_dpb_license, isc_dpb_encrypt_key,
      isc_dpb_lc_messages, isc_dpb_lc_ctype, isc_dpb_sql_role_name,
      isc_dpb_instance_name, isc_dpb_old_file_name,
      isc_dpb_sys_encrypt_password, isc_dpb_archive_recover, isc_dpb_recover_until:
      begin
        bValue := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(ParamValue));
        Inc(DPBLength, 2 + Length(ParamValue));
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := Length(ParamValue);
        Inc(DPBPos);
        Move(bValue[Low(bValue)], dpb[DPBPos], Length(bValue));
        Inc(DPBpos, Length(bValue));
        if DPBVal = isc_dpb_lc_ctype then
        begin
          FCharacterSet := ParamValue;
          SetCodePage;
        end;
      end;
      isc_dpb_dbkey_scope, isc_dpb_force_write,
      isc_dpb_no_reserve, isc_dpb_damaged, isc_dpb_verify,
      isc_dpb_online_dump, isc_dpb_overwrite, isc_dpb_old_overwrite,
      isc_dpb_archive_journals, isc_dpb_archive_database, isc_dpb_admin_option,
      isc_dpb_set_group_commit :
      begin
        Inc(DPBLength, 3);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := 1;
        Inc(DPBPos);
        dpb[DPBPos] := StrToInt(ParamValue);
        Inc(DPBPos);
      end;
      isc_dpb_sweep :
      begin
        Inc(DPBLength, 3);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := 1;
        Inc(DPBPos);
        dpb[DPBPos] := isc_dpb_records;
        Inc(DPBPos);
      end;
      isc_dpb_num_buffers, isc_dpb_sweep_interval, isc_dpb_old_file_size,
      isc_dpb_archive_dumps, isc_dpb_archive_sweep, isc_dpb_page_size,
      isc_dpb_sql_dialect, isc_dpb_preallocate, isc_dpb_ods_version_major,
      isc_dpb_set_page_buffers :
      begin
        pval := StrToInt(ParamValue);
        Inc(DPBLength, 6);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := 4;
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval)[0];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval)[1];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval)[2];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval)[3];
        Inc(DPBPos);
      end;
      isc_dpb_transaction :
      begin
        pval64 := StrToInt64(ParamValue);
        Inc(DPBLength, 10);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := 8;
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[0];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[1];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[2];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[3];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[4];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[5];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[6];
        Inc(DPBPos);
        DPB[DPBPos] := PByte(@pval64)[7];
        Inc(DPBPos);
      end;
      isc_dpb_set_db_readonly :
      begin
        Inc(DPBLength, 1);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
      end;
      isc_dpb_activate_shadow, isc_dpb_delete_shadow, isc_dpb_begin_log,
      isc_dpb_quit_log:
      begin
        Inc(DPBLength, 3);
        SetLength(DPB, DPBLength);
        DPB[DPBPos] := DPBVal;
        Inc(DPBPos);
        DPB[DPBPos] := 1;
        Inc(DPBPos);
        DPB[DPBPos] := 0;
        Inc(DPBPos);
      end;
      else
      begin
        if (DPBVal > 0) and
           (DPBVal <= isc_dpb_last_dpb_constant) then
          IBError(ibxeDPBConstantNotSupported, [sl.Names[i]])
        else
          IBError(ibxeDPBConstantUnknownEx, [sl.Names[i]]);
      end;
    end;
  end;
end;

{ GenerateTPB -
  Given a string containing a textual representation
  of the transaction parameters, generate a transaction
  parameter buffer, and return it and its length in
  TPB and TPBLength, respectively. }
procedure GenerateTPB(sl: TStrings; var TPB: TBytes; var TPBLength: Short);
var
  i, TPBVal, pval : Integer;
  ParamName, ParamValue: String;
  TPBPos : Integer;
  bValue : TBytes;
begin
  TPBPos := 0;
  if (sl.Count = 0) then
    TPBLength := 0
  else
  begin
    TPBLength := sl.Count + 1;
    SetLength(TPB, TPBLength);
    TPB[TPBPos] := isc_tpb_version3;
    Inc(TPBPos);
  end;
  for i := 0 to sl.Count - 1 do
  begin
    if (Trim(sl[i]) =  '') then
    begin
      Dec(TPBLength);
      Continue;
    end;
    if (sl[i].IndexOf('=') < 0) then  {do not localize}
      ParamName := sl[i].ToLower
    else
    begin
      ParamName := sl.Names[i].ToLower;
      ParamValue := sl.ValueFromIndex[i];
    end;
    if ParamName.StartsWith(TPBPrefix) then
       ParamName := ParamName.Remove(0, TPBPrefix.Length);
    TPBVal := 0;
    { Find the parameter }
    If TPBConstantNames.TryGetValue(ParamName, TPBVal) then
      { Now act on it }
      case TPBVal of
        isc_tpb_consistency, isc_tpb_exclusive, isc_tpb_protected,
        isc_tpb_concurrency, isc_tpb_shared, isc_tpb_wait, isc_tpb_nowait,
        isc_tpb_read, isc_tpb_write, isc_tpb_ignore_limbo,
        isc_tpb_read_committed, isc_tpb_rec_version, isc_tpb_no_rec_version,
        isc_tpb_restart_requests, isc_tpb_no_auto_undo, isc_tpb_no_savepoint,
        isc_tpb_exclusivity :
        begin
          TPB[TPBPos] := TPBVal;
          Inc(TPBPos);
        end;
        isc_tpb_lock_read, isc_tpb_lock_write:
        begin
          {convert the string to Ansi and get the bytes}
          bValue := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(ParamValue));
          {Upddate the new length of the TPB block}
          Inc(TPBLength, Length(ParamValue) + 1); // Need space for the string and the length of the string (1 byte)
          SetLength(TPB, TPBLength);
          {Set the block parameter}
          TPB[TPBPos] := TPBVal;
          Inc(TPBPos);
          { Set the string length}
          TPB[TPBPos] := Length(ParamValue);
          Inc(TPBPos);
          { Now set the string parameter }
          Move(bValue[Low(bValue)], TPB[TPBPos], Length(bValue));
          Inc(TPBPos, Length(bValue));
        end;
        isc_tpb_wait_time:
        begin
          pval := StrToInt(ParamValue);
          Inc(TPBLength, 6);
          SetLength(TPB, TPBLength);
          TPB[TPBPos] := TPBVal;
          Inc(TPBPos);
          TPB[TPBPos] := 4;
          Inc(TPBPos);
          TPB[TPBPos] := PByte(@pval)[0];
          Inc(TPBPos);
          TPB[TPBPos] := PByte(@pval)[1];
          Inc(TPBPos);
          TPB[TPBPos] := PByte(@pval)[2];
          Inc(TPBPos);
          TPB[TPBPos] := PByte(@pval)[3];
          Inc(TPBPos);
        end;

        else
        begin
          if (TPBVal > 0) and
             (TPBVal <= isc_tpb_last_tpb_constant) then
            IBError(ibxeTPBConstantNotSupported, [sl.Names[i]])
          else
            IBError(ibxeTPBConstantUnknownEx, [sl.Names[i]]);
        end;
      end; {case }
  end;
end;

{ TSchema }

function TSchema.Add_Node(ADatabase : TIBDatabase; Relation, Field : String) : TFieldNode;
var
  FField : TFieldNode;
  FFieldList : TFieldDictionary;
  InternalTransaction : TIBTransaction;
begin
  FFieldList := TFieldDictionary.Create([doOwnsValues]);
  FRelations.Add(Relation, FFieldList);
  Result := nil;
  FQuery.Database := ADatabase;
  InternalTransaction := TIBTransaction.Create(ADatabase);
  try
    InternalTransaction.SetTransactionLevel(ibtrPrecommitted);
    FQuery.Transaction := InternalTransaction;
    InternalTransaction.StartTransaction;

    FQuery.Params[0].AsString := Relation;
    FQuery.ExecQuery;
    while not FQuery.Eof do
    begin
      FField := TFieldNode.Create;
      FField.FieldName := FQuery.Fields[3].AsTrimString;
      FField.DEFAULT_VALUE := not (FQuery.Fields[1].IsNull and FQuery.Fields[2].IsNull);
      FField.COMPUTED_BLR := not FQuery.Fields[0].IsNull;
      FField.In_Key := false;
      FFieldList.Add(FField.FieldName, FField);
      if FField.FieldName = Field then
        Result := FField;
      FQuery.Next;
    end;
    FQuery.Close;
    FQuery.Unprepare;
    FQuery.Database := nil;
    FQuery.Transaction := nil;

    FPQuery.Database := ADatabase;
    FPQuery.Transaction := InternalTransaction;

    FPQuery.Params[0].AsString := Relation;
    FPQuery.ExecQuery;
    while not FPQuery.Eof do
    begin
      if not FFieldList.ContainsKey(FPQuery.Fields[0].AsTrimString) then
      begin
        FField := TFieldNode.Create;
        FField.FieldName := FPQuery.Fields[0].AsTrimString;
        FField.DEFAULT_VALUE := false;
        FField.COMPUTED_BLR := false;
        FField.In_Key := true;
        FFieldList.Add(FField.FieldName, FField);
        if FField.FieldName = Field then
          Result := FField;
      end
      else
        FFieldList.Items[FPQuery.Fields[0].AsTrimString].In_Key := true;
      FPQuery.Next;
    end;

    FPQuery.Close;
    FPQuery.Unprepare;
    FPQuery.Database := nil;
    FPQuery.Transaction := nil;
  finally
    InternalTransaction.Free;
  end;
end;

constructor TSchema.Create;
const
  SDefaultSQL = 'Select F.RDB$COMPUTED_BLR, ' + {do not localize}
                'F.RDB$DEFAULT_VALUE, R.RDB$DEFAULT_VALUE, R.RDB$FIELD_NAME ' + {do not localize}
                'from RDB$RELATION_FIELDS R, RDB$FIELDS F ' + {do not localize}
                'where R.RDB$RELATION_NAME = :RELATION ' +  {do not localize}
                'and R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME '+ {do not localize}
                'and ((not F.RDB$COMPUTED_BLR is NULL) or ' + {do not localize}
                '     (not (F.RDB$DEFAULT_VALUE is NULL and R.RDB$DEFAULT_VALUE is NULL))) '; {do not localize}
  SPrimaryKey = 'SELECT RDB$FIELD_NAME, RDB$FIELD_POSITION ' + {do not localize}
                'FROM RDB$RELATION_CONSTRAINTS RR JOIN RDB$INDEX_SEGMENTS RI ON ' + {do not localize}
                '     RR.RDB$INDEX_NAME = RI.RDB$INDEX_NAME ' + {do not localize}
                'WHERE RDB$RELATION_NAME = :relation_name AND ' + {do not localize}
                '      RDB$CONSTRAINT_TYPE = ''PRIMARY KEY '' ' + {do not localize}
                'ORDER BY RDB$FIELD_POSITION '; {do not localize}
begin
  FRelations := TRelationDictionary.Create([doOwnsValues]);
  FQuery := TIBSQL.Create(nil);
  FQuery.SQL.Text := SDefaultSQL;
  FPQuery := TIBSQL.Create(nil);
  FPQuery.SQL.Text := SPrimaryKey;
end;

destructor TSchema.Destroy;
begin
  FreeNodes;
  FRelations.Free;
  FQuery.Free;
  FPQuery.Free;
  inherited;
end;

procedure TSchema.FreeNodes;
begin
  TMonitor.Enter(Self);
  try
    FRelations.Clear;
  finally
    TMonitor.Exit(Self);
  end;
end;

function TSchema.Has_COMPUTED_BLR(ADatabase : TIBDatabase; Relation, Field: String): Boolean;
var
  FField : TFieldNode;
  FList : TFieldDictionary;
begin
  TMonitor.Enter(Self);
  try
    FField := nil;
    if FRelations.ContainsKey(Relation) then
    begin
      FList := FRelations.Items[Relation];
      if not FList.TryGetValue(Field, FField) then
        FField := nil;
    end
    else
      FField := Add_Node(ADatabase, Relation, Field);
    if Assigned(FField) then
      Result := Ffield.COMPUTED_BLR
    else
      Result := false;
  finally
    TMonitor.Exit(Self);
  end;
end;

function TSchema.Has_DEFAULT_VALUE(ADatabase : TIBDatabase; Relation, Field: String): Boolean;
var
  FField : TFieldNode;
begin
  TMonitor.Enter(Self);
  try
    FField := nil;
    if FRelations.ContainsKey(Relation) then
    begin
      if not FRelations.Items[Relation].TryGetValue(Field, FField) then
        FField := nil;
    end
    else
      FField := Add_Node(ADatabase, Relation, Field);
    if Assigned(FField) then
      Result := Ffield.DEFAULT_VALUE
    else
      Result := false;
  finally
    TMonitor.Exit(Self);
  end;
end;

function TSchema.In_Key(ADatabase : TIBDatabase; Relation, Field: String): Boolean;
var
  FField : TFieldNode;
begin
  TMonitor.Enter(Self);
  try
    FField := nil;
    if FRelations.ContainsKey(Relation) then
    begin
      if not FRelations.Items[Relation].TryGetValue(Field, FField) then
        FField := nil;
    end
    else
      FField := Add_Node(ADatabase, Relation, Field);
    if Assigned(FField) then
      Result := Ffield.In_Key
    else
      Result := false;
  finally
    TMonitor.Exit(Self);
  end;
end;

procedure BuildDPBConstants;
begin
  DPBConstantNames := TDPBConstantNames.Create(TIStringComparer.Ordinal);
  DPBConstantNames.Add('cdd_pathname', isc_dpb_cdd_pathname);         {do not localize}
  DPBConstantNames.Add('allocation', isc_dpb_allocation);           {do not localize}
  DPBConstantNames.Add('journal', isc_dpb_journal);              {do not localize}
  DPBConstantNames.Add('page_size', isc_dpb_page_size);            {do not localize}
  DPBConstantNames.Add('num_buffers', isc_dpb_num_buffers);          {do not localize}
  DPBConstantNames.Add('buffer_length', isc_dpb_buffer_length);        {do not localize}
  DPBConstantNames.Add('debug', isc_dpb_debug);                {do not localize}
  DPBConstantNames.Add('garbage_collect', isc_dpb_garbage_collect);      {do not localize}
  DPBConstantNames.Add('verify', isc_dpb_verify);               {do not localize}
  DPBConstantNames.Add('sweep', isc_dpb_sweep);                {do not localize}
  DPBConstantNames.Add('enable_journal', isc_dpb_enable_journal);       {do not localize}
  DPBConstantNames.Add('disable_journal', isc_dpb_disable_journal);      {do not localize}
  DPBConstantNames.Add('dbkey_scope', isc_dpb_dbkey_scope);          {do not localize}
  DPBConstantNames.Add('number_of_users', isc_dpb_number_of_users);      {do not localize}
  DPBConstantNames.Add('trace', isc_dpb_trace);                {do not localize}
  DPBConstantNames.Add('no_garbage_collect', isc_dpb_no_garbage_collect);   {do not localize}
  DPBConstantNames.Add('damaged', isc_dpb_damaged);              {do not localize}
  DPBConstantNames.Add('license', isc_dpb_license);              {do not localize}
  DPBConstantNames.Add('sys_user_name', isc_dpb_sys_user_name);        {do not localize}
  DPBConstantNames.Add('encrypt_key', isc_dpb_encrypt_key);          {do not localize}
  DPBConstantNames.Add('activate_shadow', isc_dpb_activate_shadow);      {do not localize}
  DPBConstantNames.Add('sweep_interval', isc_dpb_sweep_interval);       {do not localize}
  DPBConstantNames.Add('delete_shadow', isc_dpb_delete_shadow);        {do not localize}
  DPBConstantNames.Add('force_write', isc_dpb_force_write);          {do not localize}
  DPBConstantNames.Add('begin_log', isc_dpb_begin_log);            {do not localize}
  DPBConstantNames.Add('quit_log', isc_dpb_quit_log);             {do not localize}
  DPBConstantNames.Add('no_reserve', isc_dpb_no_reserve);           {do not localize}
  DPBConstantNames.Add('user_name', isc_dpb_user_name);            {do not localize}
  DPBConstantNames.Add('password', isc_dpb_password);             {do not localize}
  DPBConstantNames.Add('password_enc', isc_dpb_password_enc);         {do not localize}
  DPBConstantNames.Add('sys_user_name_enc', isc_dpb_sys_user_name_enc);    {do not localize}
  DPBConstantNames.Add('interp', isc_dpb_interp);               {do not localize}
  DPBConstantNames.Add('online_dump', isc_dpb_online_dump);          {do not localize}
  DPBConstantNames.Add('old_file_size', isc_dpb_old_file_size);        {do not localize}
  DPBConstantNames.Add('old_num_files', isc_dpb_old_num_files);        {do not localize}
  DPBConstantNames.Add('old_file_name', isc_dpb_old_file_name);        {do not localize}
  DPBConstantNames.Add('old_start_page', isc_dpb_old_start_page);       {do not localize}
  DPBConstantNames.Add('old_start_seqno', isc_dpb_old_start_seqno);      {do not localize}
  DPBConstantNames.Add('old_start_file', isc_dpb_old_start_file);       {do not localize}
  DPBConstantNames.Add('drop_walfile', isc_dpb_drop_walfile);         {do not localize}
  DPBConstantNames.Add('old_dump_id', isc_dpb_old_dump_id);          {do not localize}
  DPBConstantNames.Add('wal_backup_dir', isc_dpb_wal_backup_dir);       {do not localize}
  DPBConstantNames.Add('wal_chkptlen', isc_dpb_wal_chkptlen);         {do not localize}
  DPBConstantNames.Add('wal_numbufs', isc_dpb_wal_numbufs);          {do not localize}
  DPBConstantNames.Add('wal_bufsize', isc_dpb_wal_bufsize);          {do not localize}
  DPBConstantNames.Add('wal_grp_cmt_wait', isc_dpb_wal_grp_cmt_wait);     {do not localize}
  DPBConstantNames.Add('lc_messages', isc_dpb_lc_messages);          {do not localize}
  DPBConstantNames.Add('lc_ctype', isc_dpb_lc_ctype);             {do not localize}
  DPBConstantNames.Add('cache_manager', isc_dpb_cache_manager);        {do not localize}
  DPBConstantNames.Add('shutdown', isc_dpb_shutdown);             {do not localize}
  DPBConstantNames.Add('online', isc_dpb_online);               {do not localize}
  DPBConstantNames.Add('shutdown_delay', isc_dpb_shutdown_delay); {do not localize}
  DPBConstantNames.Add('reserved', isc_dpb_reserved);             {do not localize}
  DPBConstantNames.Add('overwrite', isc_dpb_overwrite);            {do not localize}
  DPBConstantNames.Add('sec_attach', isc_dpb_sec_attach);           {do not localize}
  DPBConstantNames.Add('disable_wal', isc_dpb_disable_wal);          {do not localize}
  DPBConstantNames.Add('connect_timeout', isc_dpb_connect_timeout);      {do not localize}
  DPBConstantNames.Add('dummy_packet_interval', isc_dpb_dummy_packet_interval); {do not localize}
  DPBConstantNames.Add('gbak_attach', isc_dpb_gbak_attach);          {do not localize}
  DPBConstantNames.Add('sql_role_name', isc_dpb_sql_role_name);        {do not localize}
  DPBConstantNames.Add('set_page_buffers', isc_dpb_set_page_buffers);     {do not localize}
  DPBConstantNames.Add('working_directory', isc_dpb_working_directory);    {do not localize}
  DPBConstantNames.Add('sql_dialect', isc_dpb_sql_dialect);          {do not localize}
  DPBConstantNames.Add('set_db_readonly', isc_dpb_set_db_readonly);      {do not localize}
  DPBConstantNames.Add('set_db_sql_dialect', isc_dpb_set_db_sql_dialect);   {do not localize}
  DPBConstantNames.Add('gfix_attach', isc_dpb_gfix_attach);          {do not localize}
  DPBConstantNames.Add('gstat_attach', isc_dpb_gstat_attach);         {do not localize}
  DPBConstantNames.Add('gbak_ods_version', isc_dpb_gbak_ods_version);     {do not localize}
  DPBConstantNames.Add('gbak_ods_minor_version', isc_dpb_gbak_ods_minor_version); {do not localize}
  DPBConstantNames.Add('set_group_commit', isc_dpb_set_group_commit);     {do not localize}
  DPBConstantNames.Add('gbak_validate', isc_dpb_gbak_validate);        {do not localize}
  DPBConstantNames.Add('client_interbase_var', isc_dpb_client_interbase_var); {do not localize}
  DPBConstantNames.Add('admin_option', isc_dpb_admin_option);         {do not localize}
  DPBConstantNames.Add('flush_interval', isc_dpb_flush_interval);       {do not localize}
  DPBConstantNames.Add('instance_name', isc_dpb_instance_name);        {do not localize}
  DPBConstantNames.Add('old_overwrite', isc_dpb_old_overwrite);        {do not localize}
  DPBConstantNames.Add('archive_database', isc_dpb_archive_database);     {do not localize}
  DPBConstantNames.Add('archive_journals', isc_dpb_archive_journals);     {do not localize}
  DPBConstantNames.Add('archive_sweep', isc_dpb_archive_sweep);        {do not localize}
  DPBConstantNames.Add('archive_dumps', isc_dpb_archive_dumps);        {do not localize}
  DPBConstantNames.Add('archive_recover', isc_dpb_archive_recover);      {do not localize}
  DPBConstantNames.Add('recover_until', isc_dpb_recover_until);        {do not localize}
  DPBConstantNames.Add('force', isc_dpb_force);                {do not localize}
  DPBConstantNames.Add('preallocate', isc_dpb_preallocate);          {do not localize}
  DPBConstantNames.Add('sys_encrypt_password', isc_dpb_sys_encrypt_password); {do not localize}
  DPBConstantNames.Add('eua_user_name', isc_dpb_eua_user_name); {do not localize}
  DPBConstantNames.Add('transaction', isc_dpb_transaction); {do not localize}
  DPBConstantNames.Add('ods_version_major', isc_dpb_ods_version_major); {do not localize}

  TPBConstantNames := TDPBConstantNames.Create(TIStringComparer.Ordinal);
  TPBConstantNames.Add('consistency', isc_tpb_consistency);        {do not localize}
  TPBConstantNames.Add('concurrency', isc_tpb_concurrency);        {do not localize}
  TPBConstantNames.Add('shared', isc_tpb_shared);             {do not localize}
  TPBConstantNames.Add('protected', isc_tpb_protected);          {do not localize}
  TPBConstantNames.Add('exclusive', isc_tpb_exclusive);          {do not localize}
  TPBConstantNames.Add('wait', isc_tpb_wait);               {do not localize}
  TPBConstantNames.Add('nowait', isc_tpb_nowait);             {do not localize}
  TPBConstantNames.Add('read', isc_tpb_read);               {do not localize}
  TPBConstantNames.Add('write', isc_tpb_write);              {do not localize}
  TPBConstantNames.Add('lock_read', isc_tpb_lock_read);          {do not localize}
  TPBConstantNames.Add('lock_write', isc_tpb_lock_write);         {do not localize}
  TPBConstantNames.Add('verb_time', isc_tpb_verb_time);          {do not localize}
  TPBConstantNames.Add('commit_time', isc_tpb_commit_time);        {do not localize}
  TPBConstantNames.Add('ignore_limbo', isc_tpb_ignore_limbo);       {do not localize}
  TPBConstantNames.Add('read_committed', isc_tpb_read_committed);     {do not localize}
  TPBConstantNames.Add('autocommit', isc_tpb_autocommit);         {do not localize}
  TPBConstantNames.Add('rec_version', isc_tpb_rec_version);        {do not localize}
  TPBConstantNames.Add('no_rec_version', isc_tpb_no_rec_version);     {do not localize}
  TPBConstantNames.Add('restart_requests', isc_tpb_restart_requests);   {do not localize}
  TPBConstantNames.Add('no_auto_undo', isc_tpb_no_auto_undo);       {do not localize}
  TPBConstantNames.Add('no_savepoint', isc_tpb_no_savepoint);       {do not localize}
  TPBConstantNames.Add('exclusivity', isc_tpb_exclusivity);       {do not localize}
  TPBConstantNames.Add('wait_time', isc_tpb_wait_time);       {do not localize}

  CodePages := TDictionary<String, Integer>.Create(TIStringComparer.Ordinal);
  CodePages.Add('NONE', DefaultSystemCodePage);  {do not localize}
  CodePages.Add('UTF8', cp_utf8);  {do not localize}
  CodePages.Add('UNICODE_FSS', cp_utf8); {do not localize}
  CodePages.Add('SJIS_0208', 932);   {do not localize}
  CodePages.Add('WIN1250', 1250);    {do not localize}
  CodePages.Add('WIN1251', 1251);    {do not localize}
  CodePages.Add('WIN1252', 1252);    {do not localize}
  CodePages.Add('WIN1253', 1253);    {do not localize}
  CodePages.Add('WIN1254', 1254);    {do not localize}
  CodePages.Add('ASCII', 20127);     {do not localize}
  CodePages.Add('DOS437', 437);      {do not localize}
  CodePages.Add('DOS850', 850);      {do not localize}
  CodePages.Add('DOS852', 852);      {do not localize}
  CodePages.Add('DOS857', 857);      {do not localize}
  CodePages.Add('DOS860', 860);      {do not localize}
  CodePages.Add('DOS861', 861);      {do not localize}
  CodePages.Add('DOS863', 863);      {do not localize}
  CodePages.Add('DOS865', 865);      {do not localize}
  CodePages.Add('EUCJ_0208', 20936); {do not localize}
  CodePages.Add('ISO8859_1', 28591); {do not localize}
  CodePages.Add('GB_2312', 52936);   {do not localize}
  CodePages.Add('KSC_5601', 949);    {do not localize}

end;

initialization
  BuildDPBConstants;
  IBSchemaDictionary := TIBSchemaDictionary.Create([doOwnsValues], TIStringComparer.Ordinal);

finalization
  DPBConstantNames.Free;
  TPBConstantNames.Free;
  IBSchemaDictionary.Free;
  CodePages.Free;

end.

