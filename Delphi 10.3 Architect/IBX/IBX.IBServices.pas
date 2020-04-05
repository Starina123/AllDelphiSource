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

{
  InterBase Express provides component interfaces to
  functions introduced in InterBase 6.0.  The Services
  components (TIB*Service, TIBServerProperties) and
  Install components (TIBInstall, TIBUninstall, TIBSetup)
  function only if you have installed InterBase 6.0 or
  later software
}

unit IBX.IBServices;

interface

uses
  System.Classes, System.SysUtils, IBX.IBHeader, IBX.IB, IBX.IBIntf, System.Variants,
  IBX.IBExternals, IBX.IBDatabase, IBX.IBDatabaseInfo, System.Generics.Collections;

const
  DefaultBufferSize = 32000;

  SPBPrefix = 'isc_spb_'; {do not localize}

type

  TSPBConstants = TDictionary<string, integer>;

  TProtocol = (TCP, SPX, NamedPipe, Local);
  TOutputBufferOption = (ByLine, ByChunk);

  TIBCustomService = class;

  TIBLoginEvent = procedure(Database: TIBCustomService;
    LoginParams: TStrings) of object;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBCustomService = class(TComponent)
  private
    FParamsChanged : Boolean;
    FSPB, FQuerySPB : PByte;
    FSPBLength, FQuerySPBLength : Short;
    FTraceFlags: TTraceFlags;
    FOnLogin: TIBLoginEvent;
    FLoginPrompt: Boolean;
    FBufferSize: Integer;
    FOutputBuffer: TBytes;
    FQueryParams: TBytes;
    FServerName: String;
    FHandle: TISC_SVC_HANDLE;
    FStreamedActive  : Boolean;
    FOnAttach: TNotifyEvent;
    FOutputBufferOption: TOutputBufferOption;
    FProtocol: TProtocol;
    FParams: TStrings;
    FGDSLibrary : IGDSLibrary;
    FServerType: String;
    function GetActive: Boolean;
    function GetServiceParamBySPB(const Idx: Integer): String; virtual;
    procedure SetActive(const Value: Boolean);
    procedure SetBufferSize(const Value: Integer);
    procedure SetParams(const Value: TStrings);
    procedure SetServerName(const Value: String);
    procedure SetProtocol(const Value: TProtocol);
    procedure SetServiceParamBySPB(const Idx: Integer; const Value: String); virtual;
    function IndexOfSPBConst(st: String): Integer;
    procedure ParamsChange(Sender: TObject);
    procedure ParamsChanging(Sender: TObject);
    procedure CheckServerName;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    function ParseString(var RunLen: Integer): String;
    function ParseInteger(var RunLen: Integer): Integer;
    function GenerateCustomSPB(SPBVal : Integer; Param_Value : String;
                    var SPB: TBytes; var SPBLength: Short; var SPBPos : integer) : boolean; virtual;
    procedure GenerateSPB(sl: TStrings; var SPB: TBytes; var SPBLength: Short);
    procedure SetServerType(const Value: String);
    function GetGDSLibrary: IGDSLibrary;

  protected
    procedure Loaded; override;
    function Login: Boolean;
    procedure CheckActive;
    procedure CheckInactive;
    procedure DoServerChange; virtual;
    property OutputBuffer : TBytes read FOutputBuffer;
    property OutputBufferOption : TOutputBufferOption read FOutputBufferOption write FOutputBufferOption;
    property BufferSize : Integer read FBufferSize write SetBufferSize default DefaultBufferSize;
    procedure InternalServiceQuery;
    property ServiceQueryParams: TBytes read FQueryParams write FQueryParams;
    property GDSLibrary : IGDSLibrary read GetGDSLibrary;
    procedure AddQueryParam(param : integer);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Attach;
    procedure Detach;
    property Handle: TISC_SVC_HANDLE read FHandle;
    property ServiceParamBySPB[const Idx: Integer]: String read GetServiceParamBySPB
                                                      write SetServiceParamBySPB;
  published
    property Active: Boolean read GetActive write SetActive default False;
    property ServerName: String read FServerName write SetServerName;
    property Protocol: TProtocol read FProtocol write SetProtocol default Local;
    property Params: TStrings read FParams write SetParams;
    property LoginPrompt: Boolean read FLoginPrompt write FLoginPrompt default True;
    property TraceFlags: TTraceFlags read FTraceFlags write FTraceFlags;
    property OnAttach: TNotifyEvent read FOnAttach write FOnAttach;
    property OnLogin: TIBLoginEvent read FOnLogin write FOnLogin;
    property ServerType : String read FServerType write SetServerType;
  end;

  TDatabaseInfo = class
  public
    NoOfAttachments: Integer;
    NoOfDatabases: Integer;
    DbName: array of String;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;

  TLicenseInfo = class
  public
    Key: array of String;
    Id: array of String;
    Desc: array of String;
    LicensedUsers: Integer;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;

  TLicenseMaskInfo = class
  public
    LicenseMask: Integer;
    CapabilityMask: Integer;
    procedure Clear;
  end;

  TConfigFileData = class
  public
    ConfigFileValue: array of integer;
    ConfigFileKey: array of integer;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;

  TConfigParams = class
  public
    ConfigFileData: TConfigFileData;
    ConfigFileParams: array of String;
    BaseLocation: String;
    LockFileLocation: String;
    MessageFileLocation: String;
    SecurityDatabaseLocation: String;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;

  TVersionInfo = class
    ServerVersion: String;
    ServerImplementation: string;
    ServiceVersion: Integer;
    function IsMinimumVersion(MinVersion : string) : Boolean;
    procedure Clear;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBControlService = class (TIBCustomService)
  private
    FStartParams: TBytes;
    FStartSPB: PByte;
    FStartSPBLength: Integer;
    function GetIsServiceRunning: Boolean;
  protected
    property ServiceStartParams: TBytes read FStartParams write FStartParams;
    procedure SetServiceStartOptions; virtual;
    procedure ServiceStartAddParam (Value: String; param: Integer); overload;
    procedure ServiceStartAddParam (Value: Integer; param: Integer); overload;
    procedure ServiceStartAddParam (Value: ShortInt; param: Integer); overload;
    procedure ServiceStartAddParam (Value: Int64; param: Integer); overload;
    procedure ServiceStartAddParam(param : Integer); overload;
    procedure InternalServiceStart;

  public
    constructor Create(AOwner: TComponent); override;
    procedure ServiceStart; virtual;
    property IsServiceRunning : Boolean read GetIsServiceRunning;
  end;

  TIBControlAndQueryService = class (TIBControlService)
  private
    FEof: Boolean;
    FAction: Integer;
    procedure SetAction(Value: Integer);
  protected
    property Action: Integer read FAction write SetAction;
  public
    constructor Create (AOwner: TComponent); override;
    function GetNextLine : String;
    function GetNextChunk : String; overload;
    function GetNextChunk(Bytes : PByte) : Integer; overload;
    property Eof: boolean read FEof;
  published
    property BufferSize;
  end;

  TPropertyOption = (Database, License, LicenseMask, ConfigParameters, Version, DBAlias);
  TPropertyOptions = set of TPropertyOption;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBAliasInfo = class
  public
    Alias : String;
    DBPath : String;
  end;
  TIBAliasInfos = array of TIBAliasInfo;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBServerProperties = class(TIBControlService)
  private
    FOptions: TPropertyOptions;
    FDatabaseInfo: TDatabaseInfo;
    FLicenseInfo: TLicenseInfo;
    FLicenseMaskInfo: TLicenseMaskInfo;
    FVersionInfo: TVersionInfo;
    FConfigParams: TConfigParams;
    FAliasInfos : TIBAliasInfos;
    procedure ParseConfigFileData(var RunLen: Integer);
    function GetAliasCount: Integer;
    function GetAliasInfo(Index: Integer): TIBAliasInfo;
  protected
    procedure DoServerChange; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Fetch;
    procedure FetchDatabaseInfo;
    procedure FetchLicenseInfo;
    procedure FetchLicenseMaskInfo;
    procedure FetchConfigParams;
    procedure FetchVersionInfo;
    procedure FetchAliasInfo;
    procedure AddAlias(Alias, DBPath : String);
    procedure DeleteAlias(Alias : String);

    property DatabaseInfo: TDatabaseInfo read FDatabaseInfo;
    property LicenseInfo: TLicenseInfo read FLicenseInfo;
    property LicenseMaskInfo: TLicenseMaskInfo read FLicenseMaskInfo;
    property VersionInfo: TVersionInfo read FVersionInfo;
    property ConfigParams: TConfigParams read FConfigParams;
    property AliasCount : Integer read GetAliasCount;
    property AliasInfo[Index : Integer] : TIBAliasInfo read GetAliasInfo;
    property AliasInfos : TIBAliasInfos read FAliasInfos;
  published
    property Options : TPropertyOptions read FOptions write FOptions;
  end;

  TShutdownMode = (Forced, DenyTransaction, DenyAttachment);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBCustomConfigService =  class(TIBControlService)
  private
    FDatabaseName: String;
    [weak] FTransaction: TIBTransaction;
    [weak] FDatabase: TIBDatabase;
  protected
    procedure SetDatabaseName(const Value: String); virtual;
    procedure ExecuteSQL(SQL : String);  overload;
    function ExecuteSQL(SQL, Field: String) : Variant;  overload;
    function BuildIBDatabase : TIBDatabase;
    function BuildIBTransaction : TIBTransaction;
  public
    procedure ServiceStart; override;
  published
    property DatabaseName: String read FDatabaseName write SetDatabaseName;
    property Database : TIBDatabase read FDatabase write FDatabase;
    property Transaction : TIBTransaction read FTransaction write FTransaction;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBJournalInformation = class(TComponent)
  private
    FDirectory: String;
    FPageCache: Integer;
    FCheckpointInterval: Integer;
    FTimestampName: Boolean;
    FPageSize: Integer;
    FCheckpointLength: Integer;
    FPageLength: Integer;
    FHasJournal: Boolean;
    FHasArchive : Boolean;
  public
    constructor Create(AOwner : TComponent); override;
    function CreateJournalAttributes : String;
    function CreateJournalLength : String;
  published
    property HasJournal : Boolean read FHasJournal;
    property CheckpointInterval : Integer read FCheckpointInterval write FCheckpointInterval default 0;
    property CheckpointLength : Integer read FCheckpointLength write FCheckpointLength default 500;
    property PageCache : Integer read FPageCache write FPageCache default 100;
    property PageLength : Integer read FPageLength write FPageLength default 4000;
    property PageSize : Integer read FPageSize write FPageSize default 0;
    property TimestampName : Boolean read FTimestampName write FTimestampName default true;
    property Directory : String read FDirectory write FDirectory;
    property HasArchive : Boolean read FHasArchive;
  end;

  TIBEncryptionTypes = (encDES, encAES);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBConfigService = class(TIBCustomConfigService)
  private
    FIBJournalInformation: TIBJournalInformation;
    function GetLingerInterval: Integer;
    function GetFlushInterval: Integer;
    function GetReclaimInterval: Integer;
    function GetSweepInterval: Integer;
    function GetGroupCommit: Boolean;
    function GetDBOwner: string;
  public
    constructor Create(AOwner : TComponent); override;
    procedure ShutdownDatabase (Options: TShutdownMode; Wait: Integer);
    procedure SetSweepInterval (Value: Integer);
    procedure SetDBSqlDialect (Value: Integer);
    procedure SetPageBuffers (Value: Integer);
    function  GetPageBuffers : Integer;
    procedure ActivateShadow;
    procedure BringDatabaseOnline;
    procedure SetReserveSpace (Value: Boolean);
    procedure SetAsyncMode (Value: Boolean); deprecated 'For InterBase XE2 and up use SetWriteMode';
    procedure SetWriteMode (Value : TIBWriteMode);
    procedure SetReadOnly (Value: Boolean);
    procedure SetFlushInterval(Value : Integer);
    procedure DisableFlush;
    procedure SetGroupCommit(Value : Boolean);
    procedure SetLingerInterval(Value : Integer);
    procedure FlushDatabase;
    procedure ReclaimMemory;
    procedure SetReclaimInterval(Value : Integer);
    procedure SweepDatabase;
    procedure DropJournal;
    procedure CreateJournal;
    procedure CreateJournalArchive(Directory : String);
    procedure DropJournalArchive;
    procedure GetJournalInformation;
    procedure ArchiveDumpLimit(Limit : Integer);
    procedure SetSystemEncryption(Password : String; External : Boolean);
    procedure CreateEncryptionKey(keyname : String; Default : Boolean;
                    EncryptType : TIBEncryptionTypes;
                    WithLength : integer; Password : String;
                    RandomInitvector : Boolean;  RandomPad : Boolean;
                    Description : String);
    procedure DropEncryptionKey(keyname : String; cascade : Boolean);
    procedure GrantEncryptionTo(Grant : Boolean; keyName, userName : string);
    procedure EncryptDatabase(encryptionKey : string = '');
    procedure DecryptDatabase;
    procedure EncryptColumn(tableName, columnName, encryptionKey : String);
    procedure DefaultDecryption(tableName, ColumnName, defaultValue : String);
    procedure ReserveSpace(Reserved : Boolean; TableName : String = '');


    property LingerInterval : Integer read GetLingerInterval write SetLingerInterval;
    property FlushInterval : Integer read GetFlushInterval write SetFlushInterval;
    property ReclaimInterval : Integer read GetReclaimInterval write SetReclaimInterval;
    property SweepInterval : Integer read GetSweepInterval write SetSweepInterval;
    property GroupCommit : Boolean read GetGroupCommit write SetGroupcommit;
    property DBOwner : string read GetDBOwner;

  published
    property JournalInformation : TIBJournalInformation read FIBJournalInformation;
  end;

  TLicensingAction = (LicenseAdd, LicenseRemove);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBLicensingService = class(TIBControlService)
  private
    FID: String;
    FKey: String;
    FAction: TLicensingAction;
    procedure SetAction(Value: TLicensingAction);
  protected
    procedure SetServiceStartOptions; override;
  public
    procedure AddLicense;
    procedure RemoveLicense;
  published
    property Action: TLicensingAction read FAction write SetAction default LicenseAdd;
    property Key: String read FKey write FKey;
    property ID: String  read FID write FID;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBLogService = class(TIBControlAndQueryService)
  protected
    procedure SetServiceStartOptions; override;
  public
    function GetLogFile : string;
  end;

  TStatOption = (DataPages, DbLog, HeaderPages, IndexPages, SystemRelations,
                 RecordVersions, StatTables);
  TStatOptions = set of TStatOption;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBStatisticalService = class(TIBControlAndQueryService)
  private
    FDatabaseName : String;
    FOptions : TStatOptions;
    FTableNames : String;
    procedure SetDatabaseName(const Value: String);
  protected
    procedure SetServiceStartOptions; override;
  public
  published
    property DatabaseName: String read FDatabaseName write SetDatabaseName;
    property Options :  TStatOptions read FOptions write FOptions;
    property TableNames : String read FTableNames write FTableNames;
  end;


  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBackupRestoreService = class(TIBControlAndQueryService)
  private
    FVerbose: Boolean;
    FPreAllocate: Integer;
    FEncryptName: String;
    FEncryptPassword: String;
  protected
    Procedure VersionCheck(const IBVersion, ErrorMessage : String);
    property PreAllocate : Integer read FPreAllocate write FPreAllocate;
    property EncryptName : String read FEncryptName write FEncryptName;
    property EncryptPassword : String read FEncryptPassword write FEncryptPassword;
  public
  published
    property Verbose : Boolean read FVerbose write FVerbose default False;
  end;

  TBackupOption = (IgnoreChecksums, IgnoreLimbo, MetadataOnly, NoGarbageCollection,
    OldMetadataDesc, NonTransportable, ConvertExtTables);
  TBackupOptions = set of TBackupOption;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBackupService = class (TIBBackupRestoreService)
  private
    FDatabaseName: String;
    FOptions: TBackupOptions;
    FBackupFile: TStrings;
    FBlockingFactor: Integer;
    procedure SetBackupFile(const Value: TStrings);
    function GenerateCustomSPB(SPBVal : Integer; Param_Value : String;
                var SPB: TBytes; var SPBLength: Short; var SPBPos : integer) : Boolean; override;
  protected
    procedure SetServiceStartOptions; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OnlineDump(Overwrite : Boolean);
    procedure ArchiveDatabase;
    procedure ArchiveJournal;

  published
    { a name=value pair of filename and length }
    property BackupFile: TStrings read FBackupFile write SetBackupFile;
    property BlockingFactor: Integer read FBlockingFactor write FBlockingFactor;
    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property Options : TBackupOptions read FOptions write FOptions;
    property PreAllocate;
    property EncryptName;
    property EncryptPassword;
  end;

  TRestoreOption = (DeactivateIndexes, NoShadow, NoValidityCheck, OneRelationAtATime,
    Replace, CreateNewDB, UseAllSpace, ValidationCheck);

  TRestoreOptions = set of TRestoreOption;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBRestoreService = class (TIBBackupRestoreService)
  private
    FDatabaseName: TStrings;
    FBackupFile: TStrings;
    FOptions: TRestoreOptions;
    FPageSize: Integer;
    FPageBuffers: Integer;
    FEUAUserName: String;
    FEUAPassword: String;
    FWriteMode: TIBWriteMode;
    FDecryptPassword: String;
    FReadOnly: Boolean;
    FODSMajorVersion: Integer;
    FStartingTransactionID: Int64;
    procedure SetBackupFile(const Value: TStrings);
    procedure SetDatabaseName(const Value: TStrings);
    procedure SetODSMajorVersion(const Value: Integer);
    procedure RecoverArchive(ArchiveDBName, RestoredDBName, RestoreUntil : String); overload;
  protected
    procedure SetServiceStartOptions; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RecoverArchive(ArchiveDBName, RestoredDBName : String); overload;
    procedure RecoverArchive(ArchiveDBName, RestoredDBName : String; RestoreUntil : TDateTime); overload;

    property StartingTransactionID : Int64 read FStartingTransactionID write FStartingTransactionID;
  published
    { a name=value pair of filename and length }
    property DatabaseName: TStrings read FDatabaseName write SetDatabaseName;
    property BackupFile: TStrings read FBackupFile write SetBackupFile;
    property PageSize: Integer read FPageSize write FPageSize default 4096;
    property PageBuffers: Integer read FPageBuffers write FPageBuffers;
    property Options : TRestoreOptions read FOptions write FOptions default [CreateNewDB];
    property EUAUserName : String read FEUAUserName write FEUAUserName;
    property EUAPassword : String read FEUAPassword write FEUAPassword;
    property WriteMode : TIBWriteMode read FWriteMode write FWriteMode default wmNone;
    property EncryptPassword;
    property PreAllocate;
    property DecryptPassword : String read FDecryptPassword write FDecryptPassword;
    property ReadOnly : Boolean read FReadOnly write FReadOnly;
    [default (0)]
    property ODSMajorVersion : Integer read FODSMajorVersion write SetODSMajorVersion;
  end;

  TValidateOption = (LimboTransactions, CheckDB, IgnoreChecksum, KillShadows, MendDB,
    SweepDB, ValidateDB, ValidateFull);
  TValidateOptions = set of TValidateOption;

  TTransactionGlobalAction = (CommitGlobal, RollbackGlobal, RecoverTwoPhaseGlobal,
                             NoGlobalAction);
  TTransactionState = (LimboState, CommitState, RollbackState, UnknownState);
  TTransactionAdvise = (CommitAdvise, RollbackAdvise, UnknownAdvise);
  TTransactionAction = (CommitAction, RollbackAction);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TLimboTransactionInfo = class
  public
    MultiDatabase: Boolean;
    ID: Integer;
    HostSite: String;
    RemoteSite: String;
    RemoteDatabasePath: String;
    State: TTransactionState;
    Advise: TTransactionAdvise;
    Action: TTransactionAction;
  end;
  TLimboTransactionInfos = array of TLimboTransactionInfo;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBValidationService = class(TIBControlAndQueryService)
  private
    FDatabaseName: String;
    FOptions: TValidateOptions;
    FLimboTransactionInfo: TLimboTransactionInfos;
    FGlobalAction: TTransactionGlobalAction;
    procedure SetDatabaseName(const Value: String);
    function GetLimboTransactionInfo(index: integer): TLimboTransactionInfo;
    function GetLimboTransactionInfoCount: integer;

  protected
    procedure SetServiceStartOptions; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FetchLimboTransactionInfo;
    procedure FixLimboTransactionErrors;
    property LimboTransactionInfo[Index: integer]: TLimboTransactionInfo read GetLimboTransactionInfo;
    property LimboTransactionInfoCount: Integer read GetLimboTransactionInfoCount;
    property LimboTransactionInfos : TLimboTransactionInfos read FLimboTransactionInfo;
  published
    property DatabaseName: String read FDatabaseName write SetDatabaseName;
    property Options: TValidateOptions read FOptions write FOptions;
    property GlobalAction: TTransactionGlobalAction read FGlobalAction
                                         write FGlobalAction;
  end;

  TUserInfo = class
  public
    UserName: String;
    FirstName: String;
    MiddleName: String;
    LastName: String;
    GroupID: Integer;
    UserID: Integer;
    GroupName : String;
    SystemUserName : String;
    DefaultRole : String;
    Description : String;
    ActiveUser : Boolean;
  end;
  TUserInfos = Array of TUserInfo;

  TSecurityAction = (ActionAddUser, ActionDeleteUser, ActionModifyUser, ActionDisplayUser);
  TSecurityModifyParam = (ModifyFirstName, ModifyMiddleName, ModifyLastName, ModifyUserId,
                         ModifyGroupId, ModifyPassword, ModifySystemUserName,
                         ModifyGroupName, ModifyDefaultRole, ModifyDescription,
                         ModifyActiveUser);
  TSecurityModifyParams = set of TSecurityModifyParam;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBSecurityService = class(TIBControlAndQueryService)
  private
    FUserID: Integer;
    FGroupID: Integer;
    FFirstName: String;
    FUserName: String;
    FPassword: String;
    FSQLRole: String;
    FLastName: String;
    FMiddleName: String;
    FUserInfo: TUserInfos;
    FSecurityAction: TSecurityAction;
    FModifyParams: TSecurityModifyParams;
    FDefaultRole: String;
    FUserDatabase: String;
    FSystemUserName: String;
    FGroupName: String;
    FDescription: String;
    FActiveUser: Boolean;
    procedure ClearParams;
    procedure SetSecurityAction (Value: TSecurityAction);
    procedure SetFirstName (Value: String);
    procedure SetMiddleName (Value: String);
    procedure SetLastName (Value: String);
    procedure SetPassword (Value: String);
    procedure SetUserId (Value: Integer);
    procedure SetGroupId (Value: Integer);

    procedure FetchUserInfo(UserName : String = '');
    function GetUserInfo(Index: Integer): TUserInfo;
    function GetUserInfoCount: Integer;
    procedure SetDefaultRole(const Value: String);
    procedure SetSystemUserName(const Value: String);
    procedure SetGroupName(const Value: String);
    procedure SetDescription(const Value: String);
    procedure SetActiveUser(const Value: Boolean);

  protected
    procedure Loaded; override;
    procedure SetServiceStartOptions; override;
    procedure ExecuteSQL(SQL : String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DisplayUsers;
    procedure DisplayUser(UserName: String);
    procedure AddUser;
    procedure DeleteUser;
    procedure ModifyUser;
    procedure EnableEUA(Value : Boolean);
    procedure SuspendEUA(Value : Boolean);
    procedure CreateSYSDSOUser(Password : String = '');
    procedure ClearUser;
    property  UserInfo[Index: Integer]: TUserInfo read GetUserInfo;
    property  UserInfoCount: Integer read GetUserInfoCount;
    property UserInfos : TUserInfos read FUserInfo;

  published
    property SecurityAction: TSecurityAction read FSecurityAction
                                             write SetSecurityAction
                                             default ActionAddUser;
    property SQLRole : String read FSQLRole write FSQLrole;
    property UserName : String read FUserName write FUserName;
    property SystemUserName : String read FSystemUserName write SetSystemUserName;
    property FirstName : String read FFirstName write SetFirstName;
    property MiddleName : String read FMiddleName write SetMiddleName;
    property LastName : String read FLastName write SetLastName;
    property UserID : Integer read FUserID write SetUserID default 0;
    property GroupID : Integer read FGroupID write SetGroupID default 0;
    property GroupName : String read FGroupName write SetGroupName;
    property Password : String read FPassword write setPassword;
    property DefaultRole : String read FDefaultRole write SetDefaultRole;
    property Description : String read FDescription write SetDescription;
    property UserDatabase : String read FUserDatabase write FUserDatabase;
    property ActiveUser : Boolean read FActiveUser write SetActiveUser default false;
  end;


implementation

uses
  Data.Db, IBX.IBSQLMonitor, IBX.IBSQL, IBX.IBXConst, IBX.IBUtils, System.Character,
  System.Generics.Defaults;

var
  SPBConstants : TSPBConstants;

{ TIBCustomService }

procedure TIBCustomService.AddQueryParam(param: integer);
begin
  SetLength(FQueryParams, Length(FQueryParams) + 1);
  FQueryParams[High(FQueryParams)] := param;
end;

procedure TIBCustomService.Attach;
var
  SPB: TBytes;
  ConnectString: String;
  bConnection : TBytes;
begin
  CheckInactive;
  CheckServerName;

  if FLoginPrompt and not Login then
    IBError(ibxeOperationCancelled, [nil]);

  { Generate a new SPB if necessary }
  if FParamsChanged then
  begin
    FParamsChanged := False;
    GenerateSPB(FParams, SPB, FSPBLength);
    IBAlloc(FSPB, 0, FSPBLength);
    Move(SPB[0], FSPB[0], FSPBLength);
  end;
  case FProtocol of
    TCP: ConnectString := FServerName + ':service_mgr'; {do not localize}
    SPX: ConnectString := FServerName + '@service_mgr'; {do not localize}
    NamedPipe: ConnectString := '\\' + FServerName + '\service_mgr'; {do not localize}
    Local: ConnectString := 'service_mgr'; {do not localize}
  end;
  bConnection := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(ConnectString));
  if call(GDSLibrary.isc_service_attach(StatusVector, Length(bConnection),
                         PByte(bConnection), @FHandle,
                         FSPBLength, FSPB), False) > 0 then
  begin
    FHandle := nil;
    IBDataBaseError(GDSLibrary);
  end;

  if Assigned(FOnAttach) then
    FOnAttach(Self);
  if (MonitorHook <> nil) then
    MonitorHook.ServiceAttach(Self);
end;

procedure TIBCustomService.Loaded;
begin
  inherited Loaded;
  if FServerType = '' then
    FServerType := 'IBServer'; {do not localize}
  try
    if FStreamedActive and (not Active) then
      Attach;
  except
    if csDesigning in ComponentState then
    begin
      if Assigned(ApplicationHandleException) then
        ApplicationHandleException(Self);
    end
    else
      raise;
  end;
end;

function TIBCustomService.Login: Boolean;
var
  IndexOfUser, IndexOfPassword: Integer;
  Username, Password: String;
  LoginParams: TStrings;
begin
  if Assigned(FOnLogin) then
  begin
    result := True;
    LoginParams := TStringList.Create;
    try
      LoginParams.Assign(Params);
      FOnLogin(Self, LoginParams);
      Params.Assign (LoginParams);
    finally
      LoginParams.Free;
    end;
  end
  else
  begin
    IndexOfUser := IndexOfSPBConst('user_name'); { do not localize}
    if IndexOfUser <> -1 then
      Username := Params.ValueFromIndex[IndexOfUser];
    IndexOfPassword := IndexOfSPBConst('password');  { do not localize}
    if IndexOfPassword <> -1 then
      Password :=  Params.ValueFromIndex[IndexOfPassword];
    if Assigned(LoginDialogExProc) then
      result := LoginDialogExProc(serverName, Username, Password, false)
    else
      Result := false;
    if result then
    begin
      Params.Values['user_name'] := Username;   { do not localize}
      Params.Values['password'] := Password;   { do not localize}
    end;
  end;
end;

procedure TIBCustomService.CheckActive;
begin
  if FStreamedActive and (not Active) then
    Loaded;
  if FHandle = nil then
    IBError(ibxeServiceActive, [nil]);
end;

procedure TIBCustomService.CheckInactive;
begin
  if FHandle <> nil then
    IBError(ibxeServiceInActive, [nil]);
end;

constructor TIBCustomService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FServerType := 'IBServer'; {do not localize}
  FProtocol := local;
  FserverName := '';
  FParams := TStringList.Create;
  FParamsChanged := True;
  TStringList(FParams).OnChange := ParamsChange;
  TStringList(FParams).OnChanging := ParamsChanging;
  FSPB := nil;
  FQuerySPB := nil;
  FBufferSize := DefaultBufferSize;
  FHandle := nil;
  FLoginPrompt := True;
  FTraceFlags := [];
  FOutputbuffer := nil;
end;

destructor TIBCustomService.Destroy;
begin
  if FHandle <> nil then
    Detach;
  FreeMem(FSPB);
  FSPB := nil;
  FParams.Free;

  FOutputBuffer := nil;
  FGDSLibrary := nil;
  inherited Destroy;
end;

procedure TIBCustomService.Detach;
begin
  CheckActive;
  if (Call(GDSLibrary.isc_service_detach(StatusVector, @FHandle), False) > 0) then
  begin
    FHandle := nil;
    IBDataBaseError(GDSLibrary);
  end
  else
    FHandle := nil;
  if (MonitorHook <> nil) then
    MonitorHook.ServiceDetach(Self);
end;

function TIBCustomService.GetActive: Boolean;
begin
  result := FHandle <> nil;
end;

function TIBCustomService.GetGDSLibrary: IGDSLibrary;
begin
  if (ServerType <> '') and
     (FGDSLibrary = nil) then
  begin
    FGDSLibrary := IBX.IBIntf.GetGDSLibrary(FServerType);
    FGDSLibrary.CheckIBLoaded;  // needed becaue sometimes it will be bypassed
  end;
  Result := FGDSLibrary;
end;

function TIBCustomService.GetServiceParamBySPB(const Idx: Integer): String;
var
  ConstIdx : Integer;
  Pair : TPair<String, Integer>;
begin
  ConstIdx := -1;
  if (Idx > 0) and (Idx <= SPBConstants.Count) then
  begin
    for Pair in DPBConstantNames do
      if Pair.Value = Idx then
      begin
         ConstIdx := IndexOfSPBConst(Pair.Key);
         break;
      end;
  end;
  if ConstIdx = -1 then
    result := ''
  else
    result := Params.ValueFromIndex[ConstIdx];
end;

procedure TIBCustomService.InternalServiceQuery;
begin
  FQuerySPBLength := Length(FQueryParams);
  if FQuerySPBLength = 0 then
    IBError(ibxeQueryParamsError, [nil]);
  IBAlloc(FQuerySPB, 0, FQuerySPBLength);
  Move(FQueryParams[0], FQuerySPB[0], FQuerySPBLength);
  if (FOutputBuffer = nil) then
    SetLength(FOutputBuffer, FBufferSize);
  try
    if call(GDSLibrary.isc_service_query(StatusVector, @FHandle, nil, 0, nil,
                           FQuerySPBLength, FQuerySPB,
                           FBufferSize, PByte(FOutputBuffer)), False) > 0 then
    begin
      FHandle := nil;
      IBDataBaseError(GDSLibrary);
    end;
  finally
    FreeMem(FQuerySPB);
    FQuerySPB := nil;
    FQuerySPBLength := 0;
    FQueryParams := nil;
  end;
  if (MonitorHook <> nil) then
    MonitorHook.ServiceQuery(Self);
end;

procedure TIBCustomService.SetActive(const Value: Boolean);
begin
  if csReading in ComponentState then
    FStreamedActive := Value
  else
    if Value <> Active then   
      if Value then
        Attach
      else
        Detach;
end;

procedure TIBCustomService.SetBufferSize(const Value: Integer);
begin
  if (Value <> FBufferSize) then
  begin
    FBufferSize := Value;
    SetLength(FOutputBuffer, FBufferSize);
  end;
end;

procedure TIBCustomService.SetParams(const Value: TStrings);
begin
  FParams.Assign(Value);
end;

procedure TIBCustomService.SetServerName(const Value: String);
begin
  if FServerName <> Value then
  begin
    CheckInactive;
    FServerName := Value;
    if (FProtocol = Local) and (FServerName <> '') then
      FProtocol := TCP
    else
      if (FProtocol <> Local) and (FServerName = '') then
        FProtocol := Local;
    DoServerChange;
  end;
end;

procedure TIBCustomService.SetServerType(const Value: String);
var
  LibString : String;
  OldLibrary : IGDSLibrary;
begin
  if Value <> '' then
  begin
    if (Value <> FServerType) then
    begin
      LibString := Value;
      OldLibrary := FGDSLibrary;
      try
        FGDSLibrary := IBX.IBIntf.GetGDSLibrary(LibString);
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

procedure TIBCustomService.SetProtocol(const Value: TProtocol);
begin
  if FProtocol <> Value then
  begin
    CheckInactive;
    FProtocol := Value;
    if (Value = Local) then
      FServerName := '';
  end;
end;

procedure TIBCustomService.SetServiceParamBySPB(const Idx: Integer;
  const Value: String);
var
  Pair : TPair<String, Integer>;
begin
  for Pair in SPBConstants do
    if Pair.Value = Idx then
    begin
      Params.Values[Pair.Key] := Value;
      break;
    end;
end;

function TIBCustomService.IndexOfSPBConst(st: String): Integer;
var
  i, pos_of_str: Integer;
begin
  result := -1;
  for i := 0 to Params.Count - 1 do
  begin
    pos_of_str := Params[i].ToLower.IndexOf(st);
    if (pos_of_str = 1) or (pos_of_str = SPBPrefix.Length + 1) then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TIBCustomService.ParamsChange(Sender: TObject);
begin
  FParamsChanged := True;
end;

procedure TIBCustomService.ParamsChanging(Sender: TObject);
begin
  CheckInactive;
end;

procedure TIBCustomService.CheckServerName;
begin
  if (FServerName = '') and (FProtocol <> Local) then
    IBError(ibxeServerNameMissing, [nil]);
end;

function TIBCustomService.Call(ErrCode: ISC_STATUS;
  RaiseError: Boolean): ISC_STATUS;
begin
  result := ErrCode;
  if RaiseError and (ErrCode > 0) then
    IBDataBaseError(GDSLibrary);
end;

function TIBCustomService.ParseString(var RunLen: Integer): String;
var
  Len: UShort;
  tmp : Byte;
begin
  Len := GDSLibrary.isc_vax_integer(PByte(OutputBuffer) + RunLen, 2);
  RunLen := RunLen + 2;
  if (Len <> 0) then
  begin
    tmp := OutputBuffer[RunLen + Len];
    OutputBuffer[RunLen + Len] := 0;
    result := TEncoding.ANSI.GetString(FOutputBuffer, RunLen, Len);
    OutputBuffer[RunLen + Len] := tmp;
    RunLen := RunLen + Len;
  end
  else
    result := '';
end;

function TIBCustomService.ParseInteger(var RunLen: Integer): Integer;
begin
  result := GDSLibrary.isc_vax_integer(PByte(OutputBuffer) + RunLen, 4);
  RunLen := RunLen + 4;
end;

{
 * GenerateSPB -
 *  Given a string containing a textual representation
 *  of the Service parameters, generate a service
 *  parameter buffer, and return it and its length
 *  in SPB and SPBLength, respectively.
}

{ This is to allow sub classes to define additional SPB block information
     when it applies only to tat class like isc_spb_user_dbname }
function TIBCustomService.GenerateCustomSPB(SPBVal : Integer; Param_Value : String;
             var SPB: TBytes; var SPBLength: Short; var SPBPos : integer): boolean;
begin
  Result := false;
end;

procedure TIBCustomService.GenerateSPB(sl: TStrings; var SPB: TBytes;
  var SPBLength: Short);
var
  i, SPBPos : Integer;
  SPBVal : UShort;
  param_name, param_value: String;
  pval: Integer;
  bValue : TBytes;
begin
  { The SPB is initially empty, with the exception that
   the SPB version must be the first byte of the string.
  }
  SPBLength := 2;
  SetLength(SPB, SPBLength);
  SPBPos := Low(SPB);

  SPB[SPBPos] := isc_spb_version;
  Inc(SPBPos);
  SPB[SPBPos] := isc_spb_current_version;
  Inc(SPBPos);
  { Iterate through the textual service parameters, constructing
   a SPB on-the-fly}
  for i := 0 to sl.Count - 1 do
  begin
   { Get the parameter's name and value from the list,
     and make sure that the name is all lowercase with
     no leading 'isc_spb_' prefix }
    if (Trim(sl.Names[i]) = '') then
      continue;
    param_name := sl.Names[i].ToLower;
    param_value := sl.ValueFromIndex[i];
    if param_name.StartsWith(SPBPrefix) then
      param_name := param_name.Remove(0, SPBPrefix.Length);
    { We want to translate the parameter name to some integer
      value. We do this by scanning through a list of known
      service parameter names (SPBConstantNames, defined above). }
    { Find the parameter value }
    SPBVal := SPBConstants[param_name];

    case SPBVal of
      {These are not set this way}
      isc_spb_bkp_encrypt_name, isc_spb_bkp_preallocate:;

      isc_spb_user_name, isc_spb_password, isc_spb_instance_name,
      isc_spb_password_enc, isc_spb_sql_role_name, isc_spb_sys_user_name,
      isc_spb_sys_user_name_enc, isc_spb_sys_encrypt_password :
      begin
        bValue := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(param_value));
        Inc(SPBLength, 2 + Length(param_value));
        SetLength(SPB, SPBLength);
        SPB[SPBPos] := SPBVal;
        Inc(SPBPos);
        SPB[SPBPos] := Length(param_value);
        Inc(SPBPos);
        Move(bValue[Low(bValue)], spb[SPBPos], Length(bValue));
        Inc(SPBpos, Length(bValue));
      end;
      isc_spb_connect_timeout, isc_spb_dummy_packet_interval :
      begin
        pval := StrToInt(String(param_value));
        Inc(SPBLength, 6);
        SetLength(SPB, SPBLength);
        SPB[SPBPos] := SPBVal;
        Inc(SPBPos);
        SPB[SPBPos] := 4;
        Inc(SPBPos);
        SPB[SPBPos] := PByte(@pval)[0];
        Inc(SPBPos);
        SPB[SPBPos] := PByte(@pval)[1];
        Inc(SPBPos);
        SPB[SPBPos] := PByte(@pval)[2];
        Inc(SPBPos);
        SPB[SPBPos] := PByte(@pval)[3];
        Inc(SPBPos);
      end;
      else
      begin
        if (SPBVal > 0) then
          if not GenerateCustomSPB(SPBVal, param_value, SPB, SPBLength, SPBPos) then
            IBError(ibxeSPBConstantNotSupported, [param_name])
        else
          IBError(ibxeSPBConstantUnknown, [SPBVal]);
      end;
    end;
  end;
end;

procedure TIBCustomService.DoServerChange;
begin
// Nothing at the parenet level
end;

{ TIBServerProperties }
constructor TIBServerProperties.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDatabaseInfo := TDatabaseInfo.Create;
  FLicenseInfo := TLicenseInfo.Create;
  FLicenseMaskInfo := TLicenseMaskInfo.Create;
  FVersionInfo := TVersionInfo.Create;
  FConfigParams := TConfigParams.Create;
end;

destructor TIBServerProperties.Destroy;
var
  i: Integer;
begin
  FDatabaseInfo.Free;
  FLicenseInfo.Free;
  FLicenseMaskInfo.Free;
  FVersionInfo.Free;
  FConfigParams.Free;
  for i := 0 to High(FAliasInfos) do
    FAliasInfos[i].Free;
  FAliasInfos := nil;
  inherited Destroy;
end;

procedure TIBServerProperties.ParseConfigFileData(var RunLen: Integer);
begin
  Inc(RunLen);
  SetLength (FConfigParams.ConfigFileData.ConfigFileValue, Length(FConfigParams.ConfigFileData.ConfigFileValue)+1);
  SetLength (FConfigParams.ConfigFileData.ConfigFileKey, Length(FConfigParams.ConfigFileData.ConfigFileKey)+1);

  FConfigParams.ConfigFileData.ConfigFileKey[High(FConfigParams.ConfigFileData.ConfigFileKey)] := Integer(OutputBuffer[RunLen-1]);
  FConfigParams.ConfigFileData.ConfigFileValue[High(FConfigParams.ConfigFileData.ConfigFileValue)] := ParseInteger(RunLen);
end;

procedure TIBServerProperties.Fetch;
begin
  if (Database in Options) then
    FetchDatabaseInfo;
  if (License in Options) then
  try
    FetchLicenseInfo;
  except
    // Eat the exception.  IB 8.0 and up do not support this any longer
  end;
  if (LicenseMask in Options) then
    FetchLicenseMaskInfo;
  if (ConfigParameters in Options) then
    FetchConfigParams;
  if (Version in Options) then
    FetchVersionInfo;
  if (DBAlias in Options) then
    FetchAliasInfo;
end;

procedure TIBServerProperties.FetchConfigParams;
var
  RunLen: Integer;

begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_get_config);
  AddQueryParam(isc_info_svc_get_env);
  AddQueryParam(isc_info_svc_get_env_lock);
  AddQueryParam(isc_info_svc_get_env_msg);
  AddQueryParam(isc_info_svc_user_dbpath);

  InternalServiceQuery;
  RunLen := 0;
  While (not (Integer(OutputBuffer[RunLen]) = isc_info_end)) do
  begin
    case Integer(OutputBuffer[RunLen]) of
      isc_info_svc_get_config:
      begin
        FConfigParams.ConfigFileData.ConfigFileKey := nil;
        FConfigParams.ConfigFileData.ConfigFileValue := nil;
        Inc (RunLen);
        while (not (Integer(OutputBuffer[RunLen]) = isc_info_flag_end)) do
          ParseConfigFileData (RunLen);
        if (Integer(OutputBuffer[RunLen]) = isc_info_flag_end) then
          Inc (RunLen);
      end;

      isc_info_svc_get_env:
      begin
        Inc (RunLen);
        FConfigParams.BaseLocation := ParseString(RunLen);
      end;

      isc_info_svc_get_env_lock:
      begin
        Inc (RunLen);
        FConfigParams.LockFileLocation := ParseString(RunLen);
      end;

      isc_info_svc_get_env_msg:
      begin
        Inc (RunLen);
        FConfigParams.MessageFileLocation := ParseString(RunLen);
      end;

      isc_info_svc_user_dbpath:
      begin
        Inc (RunLen);
        FConfigParams.SecurityDatabaseLocation := ParseString(RunLen);
      end;
      else
        IBError(ibxeOutputParsingError, [nil]);
    end;
  end;
end;

procedure TIBServerProperties.FetchDatabaseInfo;
var
  i, RunLen: Integer;
begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_svr_db_info);
  InternalServiceQuery;
  if (OutputBuffer[0] <> Byte(isc_info_svc_svr_db_info)) then
      IBError(ibxeOutputParsingError, [nil]);
  RunLen := 1;
  if (OutputBuffer[RunLen] <> Byte(isc_spb_num_att)) then
      IBError(ibxeOutputParsingError, [nil]);
  Inc(RunLen);
  FDatabaseInfo.NoOfAttachments := ParseInteger(RunLen);
  if (OutputBuffer[RunLen] <> isc_spb_num_db) then
      IBError(ibxeOutputParsingError, [nil]);
  Inc(RunLen);
  FDatabaseInfo.NoOfDatabases := ParseInteger(RunLen);
  FDatabaseInfo.DbName := nil;
  SetLength(FDatabaseInfo.DbName, FDatabaseInfo.NoOfDatabases);
  i := 0;
  while (OutputBuffer[RunLen] <> isc_info_flag_end) do
  begin
    if (OutputBuffer[RunLen] <> isc_spb_dbname) then
      IBError(ibxeOutputParsingError, [nil]);
    Inc(RunLen);
    FDatabaseInfo.DbName[i] := ParseString(RunLen);
    Inc (i);
  end;
end;

procedure TIBServerProperties.FetchLicenseInfo;
var
  i, RunLen: Integer;
  done: Integer;
begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_get_license);
  AddQueryParam(isc_info_svc_get_licensed_users);
  InternalServiceQuery;
  RunLen := 0;
  done := 0;
  i := 0;
  FLicenseInfo.key := nil;
  FLicenseInfo.id := nil;
  FLicenseInfo.desc := nil;

  While done < 2 do begin
    Inc(Done);
    Inc(RunLen);
    case Integer(OutputBuffer[RunLen-1]) of
      isc_info_svc_get_license:
      begin
        while (OutputBuffer[RunLen] <> Byte(isc_info_flag_end)) do
        begin
          if (i >= Length(FLicenseInfo.key)) then
          begin
            SetLength(FLicenseInfo.key, i + 10);
            SetLength(FLicenseInfo.id, i + 10);
            SetLength(FLicenseInfo.desc, i + 10);
          end;
          if (OutputBuffer[RunLen] <> Byte(isc_spb_lic_id)) then
              IBError(ibxeOutputParsingError, [nil]);
          Inc(RunLen);
          FLicenseInfo.id[i] := ParseString(RunLen);
          if (OutputBuffer[RunLen] <> Byte(isc_spb_lic_key)) then
              IBError(ibxeOutputParsingError, [nil]);
          Inc(RunLen);
          FLicenseInfo.key[i] := ParseString(RunLen);
          if (OutputBuffer[RunLen] <> Byte(7)) then
              IBError(ibxeOutputParsingError, [nil]);
          Inc(RunLen);
          FLicenseInfo.desc[i] := ParseString(RunLen);
          Inc(i);
        end;
        Inc(RunLen);
        if (Length(FLicenseInfo.key) > i) then
        begin
          SetLength(FLicenseInfo.key, i);
          SetLength(FLicenseInfo.id, i);
          SetLength(FLicenseInfo.desc, i);
        end;
      end;
      isc_info_svc_get_licensed_users:
        FLicenseInfo.LicensedUsers := ParseInteger(RunLen);
      else
        IBError(ibxeOutputParsingError, [nil]);
    end;
  end;
end;

procedure TIBServerProperties.FetchLicenseMaskInfo();
var
  done,RunLen:integer;
begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_get_license_mask);
  AddQueryParam(isc_info_svc_capabilities);
  InternalServiceQuery;
  RunLen := 0;
  done := 0;
  While done <= 1 do
  begin
    Inc(done);
    Inc(RunLen);
    case Integer(OutputBuffer[RunLen-1]) of
      isc_info_svc_get_license_mask:
        FLicenseMaskInfo.LicenseMask := ParseInteger(RunLen);
      isc_info_svc_capabilities:
        FLicenseMaskInfo.CapabilityMask := ParseInteger(RunLen);
      else
        IBError(ibxeOutputParsingError, [nil]);
    end;
  end;
end;


procedure TIBServerProperties.FetchVersionInfo;
var
  RunLen: Integer;
  done: Integer;

begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_version);
  AddQueryParam(isc_info_svc_server_version);
  AddQueryParam(isc_info_svc_implementation);
  InternalServiceQuery;
  RunLen := 0;
  done := 0;

  While done <= 2 do
  begin
    Inc(done);
    Inc(RunLen);
    case Integer(OutputBuffer[RunLen-1]) of
      isc_info_svc_version:
        FVersionInfo.ServiceVersion := ParseInteger(RunLen);
      isc_info_svc_server_version:
        FVersionInfo.ServerVersion := ParseString(RunLen);
      isc_info_svc_implementation:
        FVersionInfo.ServerImplementation := ParseString(RunLen);
      else
        IBError(ibxeOutputParsingError, [nil]);
    end;
  end;
end;

function TIBServerProperties.GetAliasInfo(Index: Integer): TIBAliasInfo;
begin
  if Index <= High(FAliasInfos) then
    result := FAliasInfos[Index]
  else
    result := nil;
end;

function TIBServerProperties.GetAliasCount: Integer;
begin
  if Assigned(FAliasInfos) then
    Result := High(FAliasInfos) + 1
  else
    Result := 0;
end;

procedure TIBServerProperties.DeleteAlias(Alias: String);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_delete_db_alias);
  ServiceStartAddParam(Alias, isc_spb_sec_db_alias_name);
  ServiceStart;
end;

procedure TIBServerProperties.AddAlias(Alias, DBPath: String);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_add_db_alias);
  ServiceStartAddParam(Alias, isc_spb_sec_db_alias_name);
  ServiceStartAddParam(DBPath, isc_spb_sec_db_alias_dbpath);
  ServiceStart;
end;

procedure TIBServerProperties.FetchAliasInfo;
var
  i, RunLen : Integer;

  procedure FetchData;
  var
    index : Integer;
  begin
    for index := 0 to High(FAliasInfos) do
      FAliasInfos[i].Free;
    FAliasInfos := nil;
    i := 0;
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_display_db_alias);
    ServiceStart;
    ServiceQueryParams := nil;
    AddQueryParam(isc_info_svc_get_db_alias);
    InternalServiceQuery;

    RunLen := 0;
    if (OutputBuffer[RunLen] <> isc_info_svc_get_db_alias) then
      IBError(ibxeOutputParsingError, [nil]);
    Inc(RunLen, sizeof(USHORT) + 1);
    try
      While (not (Integer(OutputBuffer[RunLen]) = isc_info_end)) do
      begin
        if (i >= Length(FAliasInfos)) then
          SetLength(FAliasInfos, i + 10);
        if FAliasInfos[i] = nil then
          FAliasInfos[i] := TIBAliasInfo.Create;
        if (OutputBuffer[RunLen] <> isc_spb_sec_db_alias_name) then
          IBError(ibxeOutputParsingError, [nil]);
        Inc(RunLen);
        FAliasInfos[i].Alias := ParseString(RunLen);
        if (OutputBuffer[RunLen] <> Byte(isc_spb_sec_db_alias_dbpath)) then
          IBError(ibxeOutputParsingError, [nil]);
        Inc(RunLen);
        FAliasInfos[i].DBPath := ParseString(RunLen);
        Inc(i);
      end;
    except
      SetLength(FAliasInfos, i+1);
      raise;
    end;
  end;

begin
  for i := 0 to High(FAliasInfos) do
    FAliasInfos[i].Free;
  i := 0;
  FAliasInfos := nil;
  if VersionInfo.ServerVersion = '' then
    FetchVersionInfo;
  if VersionInfo.IsMinimumVersion('7.5.1.80') then
  begin
    try
      FetchData;
    except
      // Necessary due to a bug in the API.  If a delete fails the next
      // attempt to fetch the data will result in an error.  Immediately
      // Refetching will succeedd in this situation.  There is no way
      // to pre determinine if this state exists.
      FetchData;
    end;
  end;
  if (i > 0) then
    SetLength(FAliasInfos, i);
end;

procedure TIBServerProperties.DoServerChange;
begin
  FDatabaseInfo.Clear;
  FLicenseInfo.Clear;
  FLicenseMaskInfo.Clear;
  FVersionInfo.Clear;
  FConfigParams.Clear;
  FAliasInfos := nil;
end;

{ TIBControlService }
procedure TIBControlService.SetServiceStartOptions;
begin

end;

function TIBControlService.GetIsServiceRunning: Boolean;
var
  RunLen: Integer;
begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_running);
  InternalServiceQuery;
  if (OutputBuffer[0] <> Byte(isc_info_svc_running)) then
    IBError(ibxeOutputParsingError, [nil]);
  RunLen := 1;
  if (ParseInteger(RunLen) = 1) then
    result := True
  else
    result := False;
end;

procedure TIBControlService.ServiceStartAddParam (Value: String; param: Integer);
var
  pPos: Integer;
  Len : SmallInt;
  bValue : TBytes;
begin
  bValue := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(Value));
  Len := Length(bValue);
  if Len > 0 then
  begin
    pPos := High(FStartParams);
    SetLength(FStartParams, Length(FStartParams) + 3 + Len);
    Inc(pPos);
    FStartParams[pPos] := Param;
    Inc(pPos);
    FStartParams[pPos] := PByte(@Len)[0];
    Inc(pPos);
    FStartParams[pPos] := PByte(@Len)[1];
    Inc(pPos);
    Move(bValue[Low(bValue)], FStartParams[pPos], Length(bValue));
  end;
end;

procedure TIBControlService.ServiceStartAddParam (Value: Integer; param: Integer);
var
  pPos : Integer;
begin
  pPos := High(FStartParams);
  SetLength(FStartParams, Length(FStartParams) + 5);
  Inc(pPos);
  FStartParams[pPos] := Param;
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[0];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[1];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[2];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[3];
end;

procedure TIBControlService.ServiceStartAddParam(param : Integer);
begin
  SetLength(FStartParams, Length(FStartParams) + 1);
  FStartParams[high(FStartParams)] := Byte(param);
end;

procedure TIBControlService.ServiceStartAddParam(Value: ShortInt;
  param: Integer);
var
  pPos : Integer;
begin
  pPos := High(FStartParams);
  SetLength(FStartParams, Length(FStartParams) + 2);
  Inc(pPos);
  FStartParams[pPos] := Param;
  Inc(pPos);
  FStartParams[pPos] := Value;
end;

constructor TIBControlService.Create(AOwner: TComponent);
begin
  inherited create(AOwner);
  FStartParams := nil;
  FStartSPB := nil;
  FStartSPBLength := 0;
end;

procedure TIBControlService.InternalServiceStart;
begin
  FStartSPBLength := Length(FStartParams);
  if FStartSPBLength = 0 then
    IBError(ibxeStartParamsError, [nil]);
  IBAlloc(FStartSPB, 0, FStartSPBLength);
  Move(FStartParams[0], FStartSPB[0], FstartSPBLength);
  try
    if call(GDSLibrary.isc_service_start(StatusVector, @FHandle, nil,
                           FStartSPBLength, FStartSPB), False) > 0 then
    begin
      FHandle := nil;
      IBDataBaseError(GDSLibrary);
    end;
  finally
    FreeMem(FStartSPB);
    FStartSPB := nil;
    FStartSPBLength := 0;
    FStartParams := nil;
  end;
  if (MonitorHook <> nil) then
    MonitorHook.ServiceStart(Self);
end;

procedure TIBControlService.ServiceStart;
begin
  CheckActive;
  SetServiceStartOptions;
  InternalServiceStart;
end;

procedure TIBControlService.ServiceStartAddParam(Value: Int64; param: Integer);
var
  pPos : Integer;
begin
  pPos := High(FStartParams);
  SetLength(FStartParams, Length(FStartParams) + 9);
  Inc(pPos);
  FStartParams[pPos] := Param;
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[0];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[1];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[2];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[3];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[4];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[5];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[6];
  Inc(pPos);
  FStartParams[pPos] := PByte(@Value)[7];
end;

{ TIBConfigService }

procedure TIBCustomConfigService.ServiceStart;
begin
  IBError(ibxeUseSpecificProcedures, [nil]);
end;

procedure TIBConfigService.ActivateShadow;
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam (isc_spb_prp_activate, isc_spb_options);
  InternalServiceStart;
end;

procedure TIBConfigService.ArchiveDumpLimit(Limit: Integer);
var
  db : TIBDatabase;
begin
  db := TIBDatabase.Create(nil);
  try
    db.Params.Values['user_name'] :=  Params.Values['user_name']; {do not localize}
    db.Params.Values['password'] :=  Params.Values['password']; {do not localize}
    db.DatabaseName := ComposeDatabaseName(ServerName, '', TIBProtocols(Protocol), DatabaseName);
    db.LoginPrompt := false;
    db.Params.Add('archive_dumps=' + Limit.ToString); {do not localize }
    db.Connected := true;
  finally
    db.Free;
  end;
end;

procedure TIBConfigService.BringDatabaseOnline;
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam (isc_spb_prp_db_online, isc_spb_options);
  InternalServiceStart;
end;

constructor TIBConfigService.Create(AOwner: TComponent);
begin
  inherited;
  FIBJournalInformation := TIBJournalInformation.Create(self);
end;

procedure TIBConfigService.CreateEncryptionKey(keyname: String;  Default : Boolean;
  EncryptType: TIBEncryptionTypes; WithLength: integer; Password: String;
  RandomInitvector, RandomPad: Boolean; Description: String);
var
  SQL : String;
begin
  SQL := 'CREATE ENCRYPTION ' + keyname;   {do not localize}
  if Default then
    SQL := SQL + ' as default ';   {do not localize}
  if EncryptType = encDES then
    SQL := SQL + ' for DES '   {do not localize}
  else
    SQL := SQL + ' for AES ';   {do not localize}
  if WithLength <> 0 then
    SQL := Format(' %s WITH LENGTH %d ', [SQL, WithLength]);   {do not localize}
  if Password <> '' then
    SQL := Format(' %s password %s ', [SQL, QuotedStr(password)]);   {do not localize}
  if RandomInitvector then
    SQL := SQL + 'INIT_VECTOR random ';   {do not localize}
  if RandomPad then
    SQL := SQL + ' PAD RANDOM ';   {do not localize}
  if Description <> '' then    
    SQL := SQL + ' description ' + QuotedStr(description);   {do not localize}
  ExecuteSQL(SQL);
end;

procedure TIBConfigService.CreateJournal;
begin
  ExecuteSQL('CREATE JOURNAL ' + QuotedStr(JournalInformation.Directory) +   {do not localize}
     JournalInformation.CreateJournalLength + JournalInformation.CreateJournalAttributes);
  JournalInformation.FHasJournal := true;
end;

procedure TIBConfigService.CreateJournalArchive(Directory : String);
begin
  ExecuteSQL('CREATE JOURNAL ARCHIVE ' + QuotedStr(Directory)); {do not localize}
  JournalInformation.FHasArchive := true;
end;

procedure TIBConfigService.SetAsyncMode(Value: Boolean);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(isc_spb_prp_write_mode);
  if Value then
    ServiceStartAddParam(isc_spb_prp_wm_async)
  else
    ServiceStartAddParam(isc_spb_prp_wm_sync);
  InternalServiceStart;
end;

procedure TIBCustomConfigService.SetDatabaseName(const Value: String);
begin
  FDatabaseName := Value;
end;

procedure TIBConfigService.SetPageBuffers(Value: Integer);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(Value, isc_spb_prp_page_buffers);
  InternalServiceStart;
end;

procedure TIBConfigService.SetReadOnly(Value: Boolean);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(isc_spb_prp_access_mode);
  if Value then
    ServiceStartAddParam(isc_spb_prp_am_readonly)
  else
    ServiceStartAddParam(isc_spb_prp_am_readwrite);
  InternalServiceStart;
end;

procedure TIBConfigService.SetReserveSpace(Value: Boolean);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(isc_spb_prp_reserve_space);
  if Value then
    ServiceStartAddParam(isc_spb_prp_res)
  else
    ServiceStartAddParam(isc_spb_prp_res_use_full);
  InternalServiceStart;
end;

procedure TIBConfigService.SetSweepInterval(Value: Integer);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam (Value, isc_spb_prp_sweep_interval);
  InternalServiceStart;
end;

procedure TIBConfigService.SetSystemEncryption(Password: String; External : Boolean);
begin
  if password = '' then
    ExecuteSQL('alter database set no system encryption password')   {do not localize}
  else
    if External then
      ExecuteSQL('alter database set system encryption password ' + QuotedStr(password) + ' external')   {do not localize}
    else
      ExecuteSQL('alter database set system encryption password ' + QuotedStr(password));   {do not localize}
end;

procedure TIBConfigService.SetWriteMode(Value: TIBWriteMode);
begin
  if Value = wmNone then
    Exit;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(isc_spb_prp_write_mode);
  case Value of
    wmSync: ServiceStartAddParam(isc_spb_prp_wm_sync);
    wmASync: ServiceStartAddParam(isc_spb_prp_wm_async);
    wmDirect: ServiceStartAddParam(isc_spb_prp_wm_direct);
  end;
  InternalServiceStart;
end;

procedure TIBConfigService.SetDBSqlDialect(Value: Integer);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam (Value, isc_spb_prp_set_sql_dialect);
  InternalServiceStart;
end;

procedure TIBConfigService.ShutdownDatabase(Options: TShutdownMode;
  Wait: Integer);
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_properties);
  ServiceStartAddParam (FDatabaseName, isc_spb_dbname);
  if (Options = Forced) then
    ServiceStartAddParam(Wait, isc_spb_prp_shutdown_db)
  else if (Options = DenyTransaction) then
      ServiceStartAddParam(Wait, isc_spb_prp_deny_new_transactions)
    else
      ServiceStartAddParam(Wait, isc_spb_prp_deny_new_attachments);
  InternalServiceStart;
end;

procedure TIBConfigService.SetFlushInterval(Value: Integer);
begin
  ExecuteSQL(Format('ALTER DATABASE SET FLUSH INTERVAL %d', [Value])); {do not localize}
end;

procedure TIBConfigService.SetGroupCommit(Value: Boolean);
begin
  if Value then
    ExecuteSQL('ALTER DATABASE SET GROUP COMMIT') {do not localize}
  else
    ExecuteSQL('ALTER DATABASE SET NO GROUP COMMIT'); {do not localize}
end;

procedure TIBConfigService.SetLingerInterval(Value: Integer);
begin
  ExecuteSQL(Format('ALTER DATABASE SET LINGER INTERVAL %d', [Value])); {do not localize}
end;

function TIBCustomConfigService.BuildIBDatabase: TIBDatabase;
begin
  Result := TIBDatabase.Create(nil);
  case Protocol of
    Local : Result.DatabaseName := String(DatabaseName);
    TCP : Result.DatabaseName := Format('%s:%s', [ServerName, DatabaseName]); {do not localize}
    NamedPipe : Result.DatabaseName := Format('\\%s\%s', [ServerName, DatabaseName]); {do not localize}
    SPX : Result.DatabaseName := Format('%s@%s', [ServerName, DatabaseName]); {do not localize}
  end;
  Result.Params.Assign(Params);
  Result.LoginPrompt := LoginPrompt;
  Result.Connected := true;
end;

function TIBCustomConfigService.BuildIBTransaction: TIBTransaction;
begin
  Result := TIBTransaction.Create(nil);
  Result.Params.Add('read_committed');
  Result.Params.Add('rec_version');
  Result.Params.Add('nowait');
end;

function TIBCustomConfigService.ExecuteSQL(SQL, Field: String) : Variant;
var
  tDatabase : TIBDatabase;
  tTransaction : TIBTransaction;
  FIBSQL : TIBSQL;
  DatabaseInfo: TIBDatabaseInfo;
begin
  if Assigned(Database) then
    tDatabase := Database
  else
    tDatabase := BuildIBDatabase;
  if Assigned(Transaction) then
    tTransaction := Transaction
  else
  begin
    tTransaction := BuildIBTransaction;
    tTransaction.DefaultDatabase := tDatabase;
  end;
  FIBSQL := TIBSQL.Create(nil);
  try
    if not Assigned(Database) then
      tDatabase.DefaultTransaction := tTransaction;
    FIBSQL.Database := tDatabase;
    FIBSQL.Transaction := tTransaction;
    FIBSQL.SQL.Text := SQL;
    DatabaseInfo := TIBDatabaseInfo.Create(self);
    try
      DatabaseInfo.Database := tDatabase;
      if DatabaseInfo.FullODS < 11.2 then
        raise EIBClientError.Create(Format(SIB75feature, ['This '])); {do not localize}
    finally
      DatabaseInfo.Free;
    end;
    if not tTransaction.InTransaction then
      tTransaction.StartTransaction;
    FIBSQL.ExecQuery;
    Result := FIBSQL.FieldByName(Field).AsVariant;
    tTransaction.Commit;
  finally
    if not Assigned(Database) then
      tDatabase.Free;
    if not Assigned(Transaction) then
      tTransaction.Free;
    FIBSQL.Free;
  end;
end;

procedure TIBCustomConfigService.ExecuteSQL(SQL : String);
var
  tDatabase : TIBDatabase;
  tTransaction : TIBTransaction;
  FIBSQL : TIBSQL;
  DatabaseInfo: TIBDatabaseInfo;
begin
  if Assigned(Database) then
    tDatabase := Database
  else
    tDatabase := BuildIBDatabase;
  if Assigned(Transaction) then
    tTransaction := Transaction
  else
  begin
    tTransaction := BuildIBTransaction;
    tTransaction.DefaultDatabase := tDatabase;
  end;
  FIBSQL := TIBSQL.Create(nil);
  try
    if not Assigned(Database) then
      tDatabase.DefaultTransaction := tTransaction;
    FIBSQL.Database := tDatabase;
    FIBSQL.Transaction := tTransaction;
    FIBSQL.SQL.Text := SQL;
    DatabaseInfo := TIBDatabaseInfo.Create(self);
    try
      DatabaseInfo.Database := tDatabase;
      if DatabaseInfo.FullODS < 11.2 then
        raise EIBClientError.Create(Format(SIB75feature, ['This '])); {do not localize}
    finally
      DatabaseInfo.Free;
    end;
    if not tTransaction.InTransaction then
      tTransaction.StartTransaction;
    FIBSQL.ExecQuery;
    tTransaction.Commit;
  finally
    if not Assigned(Database) then
      tDatabase.Free;
    if not Assigned(Transaction) then
      tTransaction.Free;
    FIBSQL.Free;
  end;
end;

procedure TIBConfigService.FlushDatabase;
begin
  ExecuteSQL('UPDATE TMP$DATABASE SET TMP$STATE = ''FLUSH'''); {do not localize}
end;

function TIBConfigService.GetDBOwner: string;
begin
   Result := ExecuteSQL('select rdb$owner_name owner from rdb$relations where rdb$relation_name = ''RDB$DATABASE''', 'owner'); {Do not localize}
   Result := Result.Trim;
end;

function TIBConfigService.GetFlushInterval: Integer;
begin
  Result := ExecuteSQL('SELECT COALESCE(RDB$FLUSH_INTERVAL, 0) as RDB$FLUSH_INTERVAL ' +  {do not localize}
                       '  from RDB$DATABASE', 'RDB$FLUSH_INTERVAL');  {do not localize}
end;

function TIBConfigService.GetGroupCommit: Boolean;
begin
  Result :=  ExecuteSQL('SELECT COALESCE(RDB$GROUP_COMMIT, ''N'') as RDB$GROUP_COMMIT ' + {do not localize}
                        '  from RDB$DATABASE', 'RDB$GROUP_COMMIT') = 'Y'; {do not localize}
end;

procedure TIBConfigService.GetJournalInformation;
var
  JournalStatistics : TIBStatisticalService;
  sl : TStringList;
  S, FileName : String;
  JournalStart : Boolean;
  DBI: TIBDatabaseInfo;
  DB : TIBDatabase;

  function GetValue(S : String) : Integer;
  var
    P : Integer;
  begin
    P := High(S);
    while S[P].IsNumber do
      Dec(P);
    S := S.Remove(0, P);
    if S <> '' then
      Result := S.ToInteger
    else
      Result := 0;
  end;

  procedure GetAdditionalValues;
  const
    SSQL = 'SELECT RDB$FILE_NAME, RDB$FILE_LENGTH FROM RDB$LOG_FILES WHERE RDB$FILE_FLAGS = :Flags';  {do not localize}
  var
    FDatabase : TIBDatabase;
    FTransaction : TIBTransaction;
    FIBSQL : TIBSQL;
  begin
    FDatabase := BuildIBDatabase;
    FTransaction := BuildIBTransaction;
    FIBSQL := TIBSQL.Create(nil);
    try
      FDatabase.DefaultTransaction := FTransaction;
      FTransaction.DefaultDatabase := FDatabase;
      FDatabase.Connected := true;
      FTransaction.StartTransaction;
      FIBSQL.Database := FDatabase;
      FIBSQL.Transaction := FTransaction;
      FIBSQL.SQL.Text := SSQL;
      FIBSQL.Params[0].AsInteger := 1;
      FIBSQL.ExecQuery;
      if FIBSQL.Eof then
      begin
        FIBJournalInformation.FHasJournal := false;
        FIBJournalInformation.Directory := '';
        FIBJournalInformation.PageLength := 500;
      end
      else
      begin
        FIBJournalInformation.FHasJournal := true;
        FIBJournalInformation.Directory := FIBSQL.Fields[0].AsTrimString;
        if FIBSQL.Fields[1].AsInteger > 0 then
          FIBJournalInformation.PageLength := FIBSQL.Fields[1].AsInteger
        else
          FIBJournalInformation.PageLength := 500;
        FIBSQL.Close;
        FIBSQL.Params[0].AsInteger := 24;
        FIBSQL.ExecQuery;
        if FIBSQL.Eof then
          FIBJournalInformation.FHasArchive := false
        else
          FIBJournalInformation.FHasArchive := not FIBSQL.Fields[0].IsNull;
      end;
      FTransaction.Commit;
    finally
      FDatabase.Free;
      FTransaction.Free;
      FIBSQL.Free;
    end;
  end;

begin
  DBI := TIBDatabaseInfo.Create(nil);
  DB := BuildIBDatabase;
  try
    DBI.Database := DB;
    FIBJournalInformation.PageSize := 2 * DBI.PageSize;
  finally
    DBI.Free;
    dB.Free
  end;

  JournalStatistics := TIBStatisticalService.Create(self);
  sl := TStringList.Create;
  try
    JournalStatistics.ServerName := ServerName;
    JournalStatistics.Protocol := Protocol;
    JournalStatistics.Params.Assign(Params);
    JournalStatistics.DatabaseName := DatabaseName;
    JournalStatistics.LoginPrompt := false;
    JournalStatistics.Options := [DbLog];
    JournalStatistics.Attach;
    try
      JournalStatistics.ServiceStart;
      Sleep(100);
      while not JournalStatistics.Eof do
      begin
        DBApplication.ProcessMessages;
        S := Trim(JournalStatistics.GetNextLine);
        if S <> '' then
          sl.Add(UpperCase(S));
      end;
      JournalStart := false;
      for s in sl do
      begin
        if JournalStart then
        begin
          if S.Contains('*END*') then  {do not localize}
            Break;
          if S.Contains('FILE NAME') then   {do not localize}
          begin
            FileName := ExtractFileName(S);
            FIBJournalInformation.TimestampName := S.IndexOf('Z') > 0; {do not localize}
          end
          else
            if S.Contains('CHECK POINT LENGTH') then {do not localize}
              FIBJournalInformation.CheckpointLength := GetValue(S)
            else
              if S.Contains('NUMBER OF WAL BUFFERS') then    {do not localize}
                FIBJournalInformation.PageCache := GetValue(S)
              else
                if S.Contains('WAL BUFFER SIZE') then        {do not localize}
                  FIBJournalInformation.PageSize := GetValue(S);
        end;
        if S.Contains('VARIABLE LOG DATA') then  {do not localize}
          JournalStart := true;
      end;
      GetAdditionalValues;
    finally
      JournalStatistics.Detach;
    end;
    GetAdditionalValues;
  finally
    JournalStatistics.Free;
    sl.Free;
  end;
end;

function TIBConfigService.GetLingerInterval: Integer;
begin
  Result := ExecuteSQL('SELECT COALESCE(RDB$LINGER_INTERVAL, 0) as RDB$LINGER_INTERVAL ' + {do not localize}
                       ' from RDB$DATABASE', 'RDB$LINGER_INTERVAL');  {do not localize}
end;

function TIBConfigService.GetPageBuffers: Integer;
begin
  Result := ExecuteSQL('SELECT RDB$PAGE_CACHE FROM RDB$DATABASE', 'RDB$PAGE_CACHE');
end;

function  TIBConfigService.GetReclaimInterval: Integer;
begin
  // In this case when reclaim is turned off it returns NULL.  To display this information to the user
  //    as an integer use 0 as passing 0 turns it off.  The DB though will NULL
  //    this field
  Result := ExecuteSQL('SELECT COALESCE(RDB$RECLAIM_INTERVAL, 0) as ' +     {do not localize}
            'RDB$RECLAIM_INTERVAL from RDB$DATABASE', 'RDB$RECLAIM_INTERVAL');   {do not localize}
end;

function TIBConfigService.GetSweepInterval: Integer;
begin
  Result := ExecuteSQL('SELECT RDB$SWEEP_INTERVAL from RDB$DATABASE', 'RDB$SWEEP_INTERVAL'); {do not localize}
end;

procedure TIBConfigService.GrantEncryptionTo(Grant: Boolean; keyName,
  userName: string);
begin
  if Grant then
    ExecuteSQL(Format('GRANT ENCRYPT ON ENCRYPTION %s to %s', [keyName, userName]))  {do not localize}
  else
    ExecuteSQL(Format('REVOKE ENCRYPT ON ENCRYPTION %s FROM %s', [keyName, userName]));  {do not localize}
end;

procedure TIBConfigService.ReclaimMemory;
begin
  ExecuteSQL('UPDATE TMP$DATABASE SET TMP$STATE = ''RECLAIM'''); {do not localize}
end;

procedure TIBConfigService.ReserveSpace(Reserved: Boolean; TableName: String);
const
  NO : array[boolean] of string = ('NO', '');
var
  svcServer: TIBServerProperties;
begin
  svcServer := TIBServerProperties.Create(nil);
  try
    svcServer.ServerName := ServerName;
    svcServer.Protocol := Protocol;
    svcServer.LoginPrompt := false;
    svcServer.Params.Assign(Params);
    svcServer.Options := [Version];
    svcServer.Active := true;
    svcServer.Fetch;
    if not svcServer.VersionInfo.IsMinimumVersion('11.0') then
      raise Exception.Create(Format(SIBXE3feature, ['No reserve space ']));
  finally
    svcServer.Free;
  end;
  if TableName <> '' then
    ExecuteSQL(Format('ALTER TABLE %s SET %s RESERVE SPACE', [TableName, NO[Reserved]]))
  else
    ExecuteSQL(Format('ALTER DATABASE SET %s RESERVE SPACE', [NO[Reserved]]));
end;

procedure TIBConfigService.DecryptDatabase;
begin
  ExecuteSQL('alter database decrypt');  {do not localize}
end;

procedure TIBConfigService.DefaultDecryption(tableName, ColumnName,
  defaultValue: String);

  function GetDefaultString : String;
  var
    tDatabase : TIBDatabase;
    tTransaction : TIBTransaction;
    FIBSQL : TIBSQL;
  begin
    if Assigned(Database) then
      tDatabase := Database
    else
      tDatabase := BuildIBDatabase;

    tTransaction := BuildIBTransaction;
    tTransaction.DefaultDatabase := tDatabase;
    tTransaction.StartTransaction;
    FIBSQL := TIBSQL.Create(nil);
    try
      if not Assigned(Database) then
        tDatabase.DefaultTransaction := tTransaction;
      FIBSQL.Database := tDatabase;
      FIBSQL.Transaction := tTransaction;
      FIBSQL.SQL.Text := Format('SELECT %s FROM %s', [columnName, TableName]);  {do not localize}
      FIBSQL.Prepare;
      if (FIBSQL.Current[0].SqlVar.SqlDef = SQL_TEXT) or
         (FIBSQL.Current[0].SqlVar.SqlDef = SQL_VARYING) then
        Result := QuotedStr(defaultValue)
      else
        Result := defaultValue;
    finally
      if not Assigned(Database) then
        tDatabase.Free;
      tTransaction.Free;
      FIBSQL.Free;
    end;

  end;

begin
  if defaultValue <> '' then
    ExecuteSQL(Format('ALTER TABLE %s ALTER %s DECRYPT DEFAULT %s',  {do not localize}
        [tableName, columnName, GetDefaultString]))
  else
    ExecuteSQL(Format('ALTER TABLE %s ALTER %s NO DECRYPT DEFAULT', [tableName, ColumnName]));  {do not localize}
end;

procedure TIBConfigService.DisableFlush;
begin
  ExecuteSQL('ALTER DATABASE SET NO RECLAIM INTERVAL'); {do not localize}
end;

procedure TIBConfigService.DropEncryptionKey(keyname: String; cascade: Boolean);
begin
  if Cascade then
    ExecuteSQL('drop encryption ' + keyname + ' cascade')  {do not localize}
  else
    ExecuteSQL('drop encryption ' + keyname);  {do not localize}
end;

procedure TIBConfigService.DropJournal;
begin
  ExecuteSQL('DROP JOURNAL '); {do not localize}
  JournalInformation.FHasJournal := false;
end;

procedure TIBConfigService.DropJournalArchive;
begin
  ExecuteSQL('DROP JOURNAL ARCHIVE');  {do not localize}
  JournalInformation.FHasArchive := false;
end;

procedure TIBConfigService.EncryptColumn(tableName, columnName, encryptionKey : String);
begin
  if encryptionKey <> '' then
    ExecuteSQL(Format('ALTER TABLE %s ALTER COLUMN %s ENCRYPT WITH %s',  {do not localize}
        [tableName, columnName, encryptionKey]))
  else
    ExecuteSQL(Format('ALTER TABLE %s ALTER COLUMN %s DECRYPT',  {do not localize}
        [tableName, columnName]))
end;

procedure TIBConfigService.EncryptDatabase(encryptionKey: string);
begin
  if encryptionKey = '' then
    ExecuteSQL('alter database encrypt') {do not localize}
  else
    ExecuteSQL('alter database encrypt with ' + encryptionKey);  {do not localize}
end;

procedure TIBConfigService.SetReclaimInterval(Value: Integer);
begin
  if Value > 0 then
    ExecuteSQL(Format('ALTER DATABASE SET RECLAIM INTERVAL %d', [Value])) {do not localize}
  else
    ExecuteSQL('ALTER DATABASE SET NO RECLAIM INTERVAL'); {do not localize}
end;

procedure TIBConfigService.SweepDatabase;
begin
  ExecuteSQL('UPDATE TMP$DATABASE SET TMP$STATE = ''SWEEP'''); {do not localize}
end;

{ TIBLicensingService }
procedure TIBLicensingService.SetAction(Value: TLicensingAction);
begin
  FAction := Value;
  if (Value = LicenseRemove) then
   FID := '';
end;

procedure TIBLicensingService.AddLicense;
begin
  Action := LicenseAdd;
  Servicestart;
end;

procedure TIBLicensingService.RemoveLicense;
begin
  Action := LicenseRemove;
  Servicestart;
end;

procedure TIBLicensingService.SetServiceStartOptions;
begin
  if (FAction = LicenseAdd) then
  begin
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_add_license);
    ServiceStartAddParam(FKey, isc_spb_lic_key);
    ServiceStartAddParam(FID, isc_spb_lic_id);
  end
  else
  begin
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_remove_license);
    ServiceStartAddParam (FKey, isc_spb_lic_key);
  end;
end;

{ TIBStatisticalService }

procedure TIBStatisticalService.SetDatabaseName(const Value: String);
begin
  FDatabaseName := Value;
end;

procedure TIBStatisticalService.SetServiceStartOptions;
var
  param: Integer;
begin
  if FDatabaseName = '' then
    IBError(ibxeStartParamsError, [nil]);
  param := 0;
  if (DataPages in Options) then
    param := param or isc_spb_sts_data_pages;
  if (DbLog in Options) then
    param := param or isc_spb_sts_db_log;
  if (HeaderPages in Options) then
    param := param or isc_spb_sts_hdr_pages;
  if (IndexPages in Options) then
    param := param or isc_spb_sts_idx_pages;
  if (SystemRelations in Options) then
    param := param or isc_spb_sts_sys_relations;
  if (RecordVersions in Options) then
    param := param or isc_spb_sts_record_versions;
  if (StatTables in Options) then
    param := param or isc_spb_sts_table;

  Action := isc_action_svc_db_stats;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_db_stats);
  ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(param, isc_spb_options);
  if (StatTables in Options) then
    ServiceStartAddParam(FTableNames, isc_spb_command_line);
end;

{ TIBBackupService }
procedure TIBBackupService.SetServiceStartOptions;
var
  aOption, i: Integer;
begin
  if FDatabaseName = '' then
    IBError(ibxeStartParamsError, [nil]);
  aOption := 0;
  if (IgnoreChecksums in Options) then
    aOption := aOption or isc_spb_bkp_ignore_checksums;
  if (IgnoreLimbo in Options) then
    aOption := aOption or isc_spb_bkp_ignore_limbo;
  if (MetadataOnly in Options) then
    aOption := aOption or isc_spb_bkp_metadata_only;
  if (NoGarbageCollection in Options) then
    aOption := aOption or isc_spb_bkp_no_garbage_collect;
  if (OldMetadataDesc in Options) then
    aOption := aOption or isc_spb_bkp_old_descriptions;
  if (NonTransportable in Options) then
    aOption := aOption or isc_spb_bkp_non_transportable;
  if (ConvertExtTables in Options) then
    aOption := aOption or isc_spb_bkp_convert;
  Action := isc_action_svc_backup;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_backup);
  ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
  ServiceStartAddParam(aOption, isc_spb_options);
  if Verbose then
    ServiceStartAddParam(isc_spb_verbose);
  ServiceStartAddParam(EncryptName, isc_spb_bkp_encrypt_name);
  ServiceStartAddParam(EncryptPassword, isc_spb_sys_encrypt_password);

  if FPreAllocate <> 0 then
    ServiceStartAddParam(FPreAllocate, isc_spb_bkp_preallocate);

  if FBlockingFactor > 0 then
    ServiceStartAddParam(FBlockingFactor, isc_spb_bkp_factor);
  for i := 0 to FBackupFile.Count - 1 do
  begin
    if (Trim(FBackupFile[i]) = '') then
      continue;
    if FBackupFile[i].Contains('=') then  {do not localize}
    begin
      ServiceStartAddParam(FBackupFile.Names[i], isc_spb_bkp_file);
      ServiceStartAddParam(FBackupFile.ValueFromIndex[i].ToInteger, isc_spb_bkp_length);
    end
    else
      ServiceStartAddParam(FBackupFile[i], isc_spb_bkp_file);
  end;
end;

procedure TIBBackupService.ArchiveDatabase;
var
  db : TIBDatabase;
begin
  db := TIBDatabase.Create(nil);
  try
    db.Params.Values['user_name'] :=  Params.Values['user_name']; {do not localize}
    db.Params.Values['password'] :=  Params.Values['password']; {do not localize}
    db.DatabaseName := ComposeDatabaseName(ServerName, '', TIBProtocols(Protocol), DatabaseName);
    db.LoginPrompt := false;
    db.Params.Add('archive_database=1'); {do not localize }
    db.Connected := true;
  finally
    db.Free;
  end;
end;

procedure TIBBackupService.ArchiveJournal;
var
  db : TIBDatabase;
begin
  db := TIBDatabase.Create(nil);
  try
    db.Params.Values['user_name'] :=  Params.Values['user_name']; {do not localize}
    db.Params.Values['password'] :=  Params.Values['password']; {do not localize}
    db.DatabaseName := ComposeDatabaseName(ServerName, '', TIBProtocols(Protocol), DatabaseName);
    db.LoginPrompt := false;
    db.Params.Add('archive_journals=1'); {do not localize }
    db.Connected := true;
  finally
    db.Free;
  end;
end;

constructor TIBBackupService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBackupFile := TStringList.Create;
end;

destructor TIBBackupService.Destroy;
begin
  FBackupFile.Free;
  inherited Destroy;
end;

function TIBBackupService.GenerateCustomSPB(SPBVal : Integer; Param_Value : String;
              var SPB: TBytes; var SPBLength: Short; var SPBPos : integer): Boolean;
var
  bValue : TBytes;
begin
  case SPBVal of
    isc_spb_user_dbname :
    begin
      bValue := TEncoding.Convert(TEncoding.Default, TEncoding.ANSI, BytesOf(param_value));
      Inc(SPBLength, 2 + Length(param_value));
      SetLength(SPB, SPBLength);
      SPB[SPBPos] := SPBVal;
      Inc(SPBPos);
      SPB[SPBPos] := Length(param_value);
      Inc(SPBPos);
      Move(bValue[Low(bValue)], spb[SPBPos], Length(bValue));
      Inc(SPBpos, Length(bValue));
      Result := true;
    end
    else
      Result := false;
  end;
end;

procedure TIBBackupService.OnlineDump(Overwrite: Boolean);
var
  i: Integer;
begin
  VersionCheck('11.0', SOnlineDumpAvailable); {Do not localize}
  try
    Action := isc_action_svc_dump;
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_dump);
    ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
    for i := 0 to FBackupFile.Count - 1 do
    begin
      if FBackupFile[i].Trim.IsEmpty then
        Continue;
      if FBackupFile[i].Contains('=') then  {do not localize}
      begin {mbcs ok}
        ServiceStartAddParam(FBackupFile.Names[i], isc_spb_dmp_file);
        ServiceStartAddParam(FBackupFile.ValueFromIndex[i].ToInteger, isc_spb_dmp_length);
      end
      else
        ServiceStartAddParam(FBackupFile[i], isc_spb_dmp_file);
    end;
//    if Overwrite then
//      ServiceStartAddParam(isc_spb_dmp_overwrite);
    Attach;
    CheckActive;
    InternalServiceStart;
  finally
    Detach;
  end;
end;

procedure TIBBackupService.SetBackupFile(const Value: TStrings);
begin
  FBackupFile.Assign(Value);
end;

{ TIBRestoreService }

procedure TIBRestoreService.SetServiceStartOptions;
var
  param, i: Integer;
begin
  param := 0;
  if (DeactivateIndexes in Options) then
    param := param or isc_spb_res_deactivate_idx;
  if (NoShadow in Options) then
    param := param or isc_spb_res_no_shadow;
  if (NoValidityCheck in Options) then
    param := param or isc_spb_res_no_validity;
  if (OneRelationAtATime in Options) then
    param := param or isc_spb_res_one_at_a_time;
  if (Replace in Options) then
    param := param or isc_spb_res_replace;
  if (CreateNewDB in Options) then
    param := param or isc_spb_res_create;
  if (UseAllSpace in Options) then
    param := param or isc_spb_res_use_all_space;
  if (ValidationCheck in Options) then
    param := param or isc_spb_res_validate;

  Action := isc_action_svc_restore;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_restore);
  ServiceStartAddParam(param, isc_spb_options);
  if Verbose then
    ServiceStartAddParam(isc_spb_verbose);
  if FPageSize > 0 then
    ServiceStartAddParam(FPageSize, isc_spb_res_page_size);
  if FPageBuffers > 0 then
    ServiceStartAddParam(FPageBuffers, isc_spb_res_buffers);
  if FEUAUserName <> '' then
    ServiceStartAddParam(FEUAUserName, isc_spb_res_eua_user_name);
  if FEUAPassword <> '' then
    ServiceStartAddParam(FEUAPassword, isc_spb_res_eua_password);
  if (ODSMajorVersion > 0) then
    ServiceStartAddParam(ODSMajorVersion, isc_spb_res_ods_version_major);
  if (StartingTransactionID > 0) then
    ServiceStartAddParam(StartingTransactionID, isc_spb_res_starting_trans);

  ServiceStartAddParam(EncryptPassword, isc_spb_sys_encrypt_password);
  ServiceStartAddParam(DecryptPassword, isc_spb_res_decrypt_password);

  if ReadOnly then
  begin
    ServiceStartAddParam(isc_spb_res_access_mode);
    ServiceStartAddParam(isc_spb_prp_am_readonly);
  end;

  if PreAllocate <> 0 then
    ServiceStartAddParam(PreAllocate, isc_spb_res_preallocate);
  try
    VersionCheck('11.0', SServiceWriteModeErr); {do not localize}
    case FWriteMode of
      wmSync: ServiceStartAddParam(isc_spb_res_wm_sync, isc_spb_res_write_mode);
      wmASync: ServiceStartAddParam(isc_spb_res_wm_async, isc_spb_res_write_mode);
      wmDirect: ServiceStartAddParam(isc_spb_res_wm_direct, isc_spb_res_write_mode);
      wmNone : ;// do nothing
    end;
  except
    // Version Check rasies an exception if the version is not high enough,
    //    just skip write mode even if set in this case and eat the exception;
  end;
  for i := 0 to FBackupFile.Count - 1 do
  begin
    if FBackupFile[i].Trim.IsEmpty then
      Continue;
    if FBackupFile[i].Contains('=') then  {do not localize}
    begin
      ServiceStartAddParam(FBackupFile.Names[i], isc_spb_bkp_file);
      ServiceStartAddParam(FBackupFile.ValueFromIndex[i].ToInteger, isc_spb_bkp_length);
    end
    else
      ServiceStartAddParam(FBackupFile[i], isc_spb_bkp_file);
  end;
  for i := 0 to FDatabaseName.Count - 1 do
  begin
    if FDatabaseName[i].Trim.IsEmpty then
      Continue;
    if FDatabaseName[i].Contains('=') then {mbcs ok}
    begin 
      ServiceStartAddParam(FDatabaseName.Names[i], isc_spb_dbname);
      ServiceStartAddParam(FDatabaseName.ValueFromIndex[i].ToInteger, isc_spb_res_length);
    end
    else
      ServiceStartAddParam(FDatabaseName[i], isc_spb_dbname);
  end;
end;

constructor TIBRestoreService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDatabaseName := TStringList.Create;
  FBackupFile := TStringList.Create;
  Include (FOptions, CreateNewDB);
  FPageSize := 4096;
  FEUAUserName := '';
  FEUAPassword := '';
  FWriteMode := wmNone;
end;

destructor TIBRestoreService.Destroy;
begin
  FDatabaseName.Free;
  FBackupFile.Free;
  inherited Destroy;
end;

procedure TIBRestoreService.RecoverArchive(ArchiveDBName, RestoredDBName,
  RestoreUntil: String);
begin
  Action := isc_action_svc_restore;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_restore);
  ServiceStartAddParam(isc_spb_res_archive_recover, isc_spb_options);
  ServiceStartAddParam(ArchiveDBName , isc_spb_bkp_file);
  ServiceStartAddParam(RestoredDBName , isc_spb_dbname);
  if RestoreUntil <> '' then
    ServiceStartAddParam(RestoreUntil, isc_spb_res_archive_recover_until);
  if Verbose then
    ServiceStartAddParam(isc_spb_verbose);
  InternalServiceStart;
end;

procedure TIBRestoreService.RecoverArchive(ArchiveDBName,
  RestoredDBName: String);
begin
  RecoverArchive(ArchiveDBName, RestoredDBName, '');
end;

procedure TIBRestoreService.RecoverArchive(ArchiveDBName,
  RestoredDBName: String; RestoreUntil: TDateTime);
begin
  RecoverArchive(ArchiveDBName, RestoredDBName,
    FormatDatetime('yyyy-mm-dd hh:mm:ss', RestoreUntil)); { do not localize }
end;

procedure TIBRestoreService.SetBackupFile(const Value: TStrings);
begin
  FBackupFile.Assign(Value);
end;

procedure TIBRestoreService.SetDatabaseName(const Value: TStrings);
begin
  FDatabaseName.Assign(Value);
end;

procedure TIBRestoreService.SetODSMajorVersion(const Value: Integer);
begin
  if (Value < 13) and (Value <> 0) then
    IBError(ibxeInvalidODSVersion, []);
  FODSMajorVersion := Value;
end;

{ TIBValidationService }
constructor TIBValidationService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TIBValidationService.Destroy;
var
  i : Integer;
begin
  for i := 0 to High(FLimboTransactionInfo) do
    FLimboTransactionInfo[i].Free;
  FLimboTransactionInfo := nil;
  inherited Destroy;
end;

procedure TIBValidationService.FetchLimboTransactionInfo;
var
  i, RunLen: Integer;
  Value: Byte;
begin
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_limbo_trans);
  InternalServiceQuery;
  RunLen := 0;
  if (OutputBuffer[RunLen] <> Byte(isc_info_svc_limbo_trans)) then
    IBError(ibxeOutputParsingError, [nil]);
  Inc(RunLen, 3);
  for i := 0 to High(FLimboTransactionInfo) do
    FLimboTransactionInfo[i].Free;
  FLimboTransactionInfo := nil;
  i := 0;
  while (OutputBuffer[RunLen] <> Byte(isc_info_end)) do
  begin
    if (i >= Length(FLimboTransactionInfo)) then
      SetLength(FLimboTransactionInfo, i + 10);
    if FLimboTransactionInfo[i] = nil then
      FLimboTransactionInfo[i] := TLimboTransactionInfo.Create;
    if (OutputBuffer[RunLen] = Byte(isc_spb_single_tra_id)) then
    begin
      Inc(RunLen);
      FLimboTransactionInfo[i].MultiDatabase := False;
      FLimboTransactionInfo[i].ID := ParseInteger(RunLen);
    end
    else
    begin
      Inc(RunLen);
      FLimboTransactionInfo[i].MultiDatabase := True;
      FLimboTransactionInfo[i].ID := ParseInteger(RunLen);
      FLimboTransactionInfo[i].HostSite := ParseString(RunLen);
      if (OutputBuffer[RunLen] <> Byte(isc_spb_tra_state)) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      Value := OutputBuffer[RunLen];
      Inc(RunLen);
      if (Value = Byte(isc_spb_tra_state_limbo)) then
        FLimboTransactionInfo[i].State := LimboState
      else
        if (Value = Byte(isc_spb_tra_state_commit)) then
          FLimboTransactionInfo[i].State := CommitState
        else
          if (Value = Byte(isc_spb_tra_state_rollback)) then
            FLimboTransactionInfo[i].State := RollbackState
          else
            FLimboTransactionInfo[i].State := UnknownState;
      FLimboTransactionInfo[i].RemoteSite := ParseString(RunLen);
      FLimboTransactionInfo[i].RemoteDatabasePath := ParseString(RunLen);
      Value := OutputBuffer[RunLen];
      Inc(RunLen);
      if (Value = Byte(isc_spb_tra_advise_commit)) then
      begin
        FLimboTransactionInfo[i].Advise := CommitAdvise;
        FLimboTransactionInfo[i].Action:= CommitAction;
      end
      else
        if (Value = Byte(isc_spb_tra_advise_rollback)) then
        begin
          FLimboTransactionInfo[i].Advise := RollbackAdvise;
          FLimboTransactionInfo[i].Action := RollbackAction;
        end
        else
        begin
          { if no advice commit as default }
          FLimboTransactionInfo[i].Advise := UnknownAdvise;
          FLimboTransactionInfo[i].Action := CommitAction;
        end;
    end;
    Inc (i);
  end;
  if (i > 0) then
    SetLength(FLimboTransactionInfo, i);
end;

procedure TIBValidationService.FixLimboTransactionErrors;
var
  i: Integer;
begin
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_repair);
  ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
  if (FGlobalAction = NoGlobalAction) then
  begin
    i := 0;
    while (FLimboTransactionInfo[i].ID <> 0) do
    begin
      if (FLimboTransactionInfo[i].Action = CommitAction) then
        ServiceStartAddParam(FLimboTransactionInfo[i].ID, isc_spb_rpr_commit_trans)
      else
        ServiceStartAddParam(FLimboTransactionInfo[i].ID, isc_spb_rpr_rollback_trans);
      Inc(i);
    end;
  end
  else
  begin
    i := 0;
    if (FGlobalAction = CommitGlobal) then
      while (FLimboTransactionInfo[i].ID <> 0) do
      begin
        ServiceStartAddParam(FLimboTransactionInfo[i].ID, isc_spb_rpr_commit_trans);
        Inc(i);
      end
    else
      while (FLimboTransactionInfo[i].ID <> 0) do
      begin
        ServiceStartAddParam(FLimboTransactionInfo[i].ID, isc_spb_rpr_rollback_trans);
        Inc(i);
      end;
  end;
  InternalServiceStart;
end;

function TIBValidationService.GetLimboTransactionInfo(index: integer): TLimboTransactionInfo;
begin
  if index <= High(FLimboTransactionInfo) then
    result := FLimboTransactionInfo[index]
  else
    result := nil;
end;

function TIBValidationService.GetLimboTransactionInfoCount: integer;
begin
  if Assigned(FLimboTransactionInfo) then
    Result := High(FLimboTransactionInfo) + 1
  else
    Result := 0;
end;

procedure TIBValidationService.SetDatabaseName(const Value: String);
begin
  FDatabaseName := Value;
end;

procedure TIBValidationService.SetServiceStartOptions;
var
  param: Integer;
begin
  Action := isc_action_svc_repair;
  if FDatabaseName = '' then
    IBError(ibxeStartParamsError, [nil]);
  param := 0;
  if (SweepDB in Options) then
    param := param or isc_spb_rpr_sweep_db;
  if (ValidateDB in Options) then
    param := param or isc_spb_rpr_validate_db;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_repair);
  ServiceStartAddParam(FDatabaseName, isc_spb_dbname);
  if param > 0 then
    ServiceStartAddParam(param, isc_spb_options);
  param := 0;
  if (LimboTransactions in Options) then
    param := param or isc_spb_rpr_list_limbo_trans;
  if (CheckDB in Options) then
    param := param or isc_spb_rpr_check_db;
  if (IgnoreChecksum in Options) then
    param := param or isc_spb_rpr_ignore_checksum;
  if (KillShadows in Options) then
    param := param or isc_spb_rpr_kill_shadows;
  if (MendDB in Options) then
    param := param or isc_spb_rpr_mend_db;
  if (ValidateFull in Options) then
  begin
     param := param or isc_spb_rpr_full;
     if not (MendDB in Options) then
       param := param or isc_spb_rpr_validate_db;
  end;
  if param > 0 then
    ServiceStartAddParam(param, isc_spb_options);
end;

{ TIBSecurityService }
constructor TIBSecurityService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModifyParams := [];
end;

procedure TIBSecurityService.CreateSYSDSOUser(Password : String);
begin
  if Password = '' then
    ExecuteSQL('CREATE USER SYSDSO') {do not localize}
  else
    ExecuteSQL('CREATE USER SYSDSO SET PASSWORD ' + QuotedStr(Password));  {do not localize}
end;

destructor TIBSecurityService.Destroy;
var
  i : Integer;
begin
  for i := 0 to High(FUserInfo) do
    FUserInfo[i].Free;
  FUserInfo := nil;
  inherited Destroy;
end;

procedure TIBSecurityService.FetchUserInfo(UserName : String);
var
  i, RunLen: Integer;
  FDatabase : TIBDatabase;
  FTransaction : TIBTransaction;
  FIBSQL : TIBSQL;
begin
  for i := 0 to High(FUserInfo) do
    FUserInfo[i].Free;
  FUserInfo := nil;
  i := 0;
  if UserDatabase = '' then
  begin
    ServiceQueryParams := nil;
    AddQueryParam(isc_info_svc_get_users);
    InternalServiceQuery;
    RunLen := 0;
    if (OutputBuffer[RunLen] <> isc_info_svc_get_users) then
      IBError(ibxeOutputParsingError, [nil]);
    Inc(RunLen);
    { Don't have any use for the combined length
     so increment past by 2 }
    Inc(RunLen, 2);
    while (OutputBuffer[RunLen] <> Byte(isc_info_end)) do
    begin
      if (i >= Length(FUSerInfo)) then
        SetLength(FUserInfo, i + 10);
      if (OutputBuffer[RunLen] <> isc_spb_sec_username) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      if FUserInfo[i] = nil then
        FUserInfo[i] := TUserInfo.Create;
      FUserInfo[i].UserName := ParseString(RunLen);
      if (OutputBuffer[RunLen] <> isc_spb_sec_firstname) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      FUserInfo[i].FirstName := ParseString(RunLen);
      if (OutputBuffer[RunLen] <> isc_spb_sec_middlename) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      FUserInfo[i].MiddleName := ParseString(RunLen);
      if (OutputBuffer[RunLen] <> isc_spb_sec_lastname) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      FUserInfo[i].LastName := ParseString(RunLen);
      if (OutputBuffer[RunLen] <> isc_spb_sec_userId) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      FUserInfo[i].UserId := ParseInteger(RunLen);
      if (OutputBuffer[RunLen] <> isc_spb_sec_groupid) then
        IBError(ibxeOutputParsingError, [nil]);
      Inc(RunLen);
      FUserInfo[i].GroupID := ParseInteger(RunLen);
      Inc (i);
    end;
  end
  else
  begin
    FDatabase := TIBDatabase.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    FIBSQL := TIBSQL.Create(nil);
    try
      FDatabase.DefaultTransaction := FTransaction;
      FTransaction.DefaultDatabase := FDatabase;
      FIBSQL.Database := FDatabase;
      case Protocol of
        Local : FDatabase.DatabaseName := UserDatabase;
        TCP : FDatabase.DatabaseName := Format('%s:%s', [ServerName, UserDatabase]); {do not localize}
        NamedPipe: FDatabase.DatabaseName := Format('\\%s\%s', [ServerName, UserDatabase]); {do not localize}
        SPX: FDatabase.DatabaseName := Format('%s@%s', [ServerName, UserDatabase]); {do not localize}
      end;
      FDatabase.Params.Assign(Params);
      FDatabase.LoginPrompt := LoginPrompt;
      FDatabase.Connected := true;
      FTransaction.StartTransaction;
      FIBSQL.SQL.Text := 'SELECT * FROM RDB$USERS'; {do not localize}
      if UserName <> '' then
        FIBSQL.SQL.Add('WHERE RDB$USER_NAME = ' + QuotedStr(UserName));
      FIBSQL.ExecQuery;
      while not FIBSQL.Eof do
      begin
        if (i >= Length(FUSerInfo)) then
          SetLength(FUserInfo, i + 10);
        if FUserInfo[i] = nil then
          FUserInfo[i] := TUserInfo.Create;
        FUSerInfo[i].UserName := FIBSQL.FieldByName('RDB$USER_NAME').AsTrimString; {do not localize}
        FUSerInfo[i].FirstName := FIBSQL.FieldByName('RDB$FIRST_NAME').AsTrimString;  {do not localize}
        FUSerInfo[i].MiddleName := FIBSQL.FieldByName('RDB$MIDDLE_NAME').AsTrimString;  {do not localize}
        FUSerInfo[i].LastName := FIBSQL.FieldByName('RDB$LAST_NAME').AsTrimString;  {do not localize}
        FUSerInfo[i].GroupID := FIBSQL.FieldByName('RDB$GID').AsInteger;      {do not localize}
        FUSerInfo[i].UserID := FIBSQL.FieldByName('RDB$UID').AsInteger;       {do not localize}
        FUSerInfo[i].GroupName := FIBSQL.FieldByName('RDB$GROUP_NAME').AsTrimString; {do not localize}
        FUSerInfo[i].SystemUserName := FIBSQL.FieldByName('RDB$SYSTEM_USER_NAME').AsTrimString; {do not localize}
        FUSerInfo[i].DefaultRole := FIBSQL.FieldByName('RDB$DEFAULT_ROLE').AsTrimString;  {do not localize}
        FUSerInfo[i].Description := FIBSQL.FieldByName('RDB$Description').AsTrimString;   {do not localize}
        FUSerInfo[i].ActiveUser := FIBSQL.FieldByName('RDB$USER_ACTIVE').AsTrimString = 'Y';  {do not localize}
        Inc(i);
        FIBSQL.Next;
      end;
      FTransaction.Commit;
    finally
      FDatabase.Free;
      FTransaction.Free;
      FIBSQL.Free;
    end;
  end;
  if (i > 0) then
    SetLength(FUserInfo, i);
end;

function TIBSecurityService.GetUserInfo(Index: Integer): TUserInfo;
begin
  if Index <= High(FUSerInfo) then
    result := FUserInfo[Index]
  else
    result := nil;
end;

function TIBSecurityService.GetUserInfoCount: Integer;
begin
  if Assigned(FUserInfo) then
    Result := High(FUSerInfo) + 1
  else
    Result := 0;
end;

procedure TIBSecurityService.AddUser;
var
  SQL : String;

begin
  if FUserDatabase = '' then
  begin
    SecurityAction := ActionAddUser;
    ServiceStart;
  end
  else
  begin
    SQL := 'CREATE USER ' + FUserName + ' SET PASSWORD ' + QuotedStr(Password);   {do not localize}
    if DefaultRole <> '' then
      SQL := SQL + ', DEFAULT ROLE ' + QuotedStr(DefaultRole);   {do not localize}
    if SystemUserName <> '' then
      SQL := SQL + ', SYSTEM USER NAME ' + QuotedStr(SystemUserName);  {do not localize}
    if GroupName <> '' then
      SQL := SQL + ', GROUP NAME ' + QuotedStr(GroupName);   {do not localize}
    if UserID > 0 then
      SQL := SQL + ', UID ' + IntToStr(UserID);  {do not localize}
    if GroupID > 0 then
      SQL := SQL + ', GID ' + IntToStr(GroupID);  {do not localize}
    if Description <> '' then
      SQL := SQL + ', DESCRIPTION ' + QuotedStr(Description);   {do not localize}
    if FirstName <> '' then
      SQL := SQL + ', FIRST NAME ' + QuotedStr(FirstName);   {do not localize}
    if MiddleName <> '' then
      SQL := SQL + ', MIDDLE NAME ' + QuotedStr(MiddleName);  {do not localize}
    if LastName <> '' then
      SQL := SQL + ', LAST NAME ' + QuotedStr(LastName);  {do not localize}
    ExecuteSQL(SQL);
  end;
end;

procedure TIBSecurityService.DeleteUser;
begin
  if FUserDatabase = '' then
  begin
    SecurityAction := ActionDeleteUser;
    ServiceStart;
  end
  else
    ExecuteSQL('DROP USER ' + FUserName); {do not localize}
end;

procedure TIBSecurityService.DisplayUsers;
begin
  if UserDatabase = '' then
  begin
    SecurityAction := ActionDisplayUser;
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_display_user);
    InternalServiceStart;
  end;
  FetchUserInfo;
end;

procedure TIBSecurityService.DisplayUser(UserName: String);
begin
  if UserDatabase = '' then
  begin
    SecurityAction := ActionDisplayUser;
    FStartParams := nil;
    ServiceStartAddParam(isc_action_svc_display_user);
    ServiceStartAddParam(UserName, isc_spb_sec_username);
    InternalServiceStart;
  end;
  FetchUserInfo(UserName);
end;

procedure TIBSecurityService.ModifyUser;
var
  SQL, sComma : String;
begin
  if FUserDatabase = '' then
  begin
    SecurityAction := ActionModifyUser;
    ServiceStart;
  end
  else
  begin
    sComma := '';
    SQL := 'ALTER USER ' + FUserName + ' SET';   {do not localize}
    if ModifyPassword in FModifyParams then
    begin
      SQL := SQL + sComma + ' PASSWORD ' + QuotedStr(Password);   {do not localize}
      sComma := ',';
    end;
    if ModifyDefaultRole in FModifyParams then
    begin
      if DefaultRole <> '' then
        SQL := SQL + sComma + ' DEFAULT ROLE ' + QuotedStr(DefaultRole)   {do not localize}
      else
        SQL := SQL + sComma + ' NO DEFAULT ROLE';   {do not localize}
      sComma := ',';
    end;
    if ModifySystemUserName in FModifyParams then
    begin
      if SystemUserName <> '' then
        SQL := SQL + sComma + ' SYSTEM USER NAME ' + QuotedStr(SystemUserName)  {do not localize}
      else
        SQL := SQL + sComma + ' NO SYSTEM USER NAME';  {do not localize}
      sComma := ',';
    end;
    if ModifyGroupName in FModifyParams then
    begin
      if GroupName <> '' then
        SQL := SQL + sComma + ' GROUP NAME ' + QuotedStr(GroupName)   {do not localize}
      else
        SQL := SQL + sComma + ' NO GROUP NAME';   {do not localize}
      sComma := ',';
    end;
    if ModifyUserID in FModifyParams then
    begin
      if UserID > 0 then
        SQL := SQL + sComma + ' UID ' + IntToStr(UserID)  {do not localize}
      else
        SQL := SQL + sComma + ' NO UID';  {do not localize}
      sComma := ',';
    end;
    if ModifyGroupID in FModifyParams then
    begin
      if GroupID > 0 then
        SQL := SQL + sComma + ' GID ' + IntToStr(GroupID)  {do not localize}
      else
        SQL := SQL + sComma + ' NO GID';  {do not localize}
      sComma := ',';
    end;
    if ModifyDescription in FModifyParams then
    begin
      if Description <> '' then
        SQL := SQL + sComma + ' DESCRIPTION ' + QuotedStr(Description)   {do not localize}
      else
        SQL := SQL + sComma + ' NO DESCRIPTION';   {do not localize}
      sComma := ',';
    end;
    if ModifyFirstName in FModifyParams then
    begin
      if FirstName <> '' then
        SQL := SQL + sComma + ' FIRST NAME ' + QuotedStr(FirstName)   {do not localize}
      else
        SQL := SQL + sComma + 'NO FIRST NAME';   {do not localize}
      sComma := ',';
    end;
    if ModifyMiddleName in FModifyParams then
    begin
      if MiddleName <> '' then
        SQL := SQL + sComma + ' MIDDLE NAME ' + QuotedStr(MiddleName)  {do not localize}
      else
        SQL := SQL + 'NO MIDDLE NAME';  {do not localize}
      sComma := ',';
    end;
    if ModifyLastName in FModifyParams then
    begin
      if LastName <> '' then
        SQL := SQL + sComma + ' LAST NAME ' + QuotedStr(LastName)  {do not localize}
      else
        SQL := SQL + sComma + 'NO LAST NAME';  {do not localize}
      sComma := ',';
    end;
    if ModifyActiveUser in FModifyParams then
      if ActiveUser then
        SQL := SQL + sComma + ' ACTIVE'     {do not localize}
      else
        SQL := SQL + sComma + ' INACTIVE';    {do not localize}
    ExecuteSQL(SQL);
    FModifyParams := [];
  end;
end;

procedure TIBSecurityService.SetSecurityAction (Value: TSecurityAction);
begin
  FSecurityAction := Value;
  if Value = ActionDeleteUser then
    ClearParams;
end;

procedure TIBSecurityService.ClearParams;
begin
  FModifyParams := [];
  FFirstName := '';
  FMiddleName := '';
  FLastName := '';
  FGroupID := 0;
  FUserID := 0;
  FPassword := '';
end;

procedure TIBSecurityService.ClearUser;
begin
  FSQLRole := '';
  FUserName := '';
  FSystemUserName := '';
  FFirstName := '';
  FMiddleName := '';
  FLastName := '';
  FUserID := 0;
  FGroupID := 0;
  FGroupName := '';
  FPassword := '';
  FDefaultRole := '';
  FDescription := '';
  FActiveUser := false;
  FModifyParams := [];
end;

procedure TIBSecurityService.SetFirstName (Value: String);
begin
  FFirstName := Value;
  Include(FModifyParams, ModifyFirstName);
end;

procedure TIBSecurityService.SetMiddleName (Value: String);
begin
  FMiddleName := Value;
  Include (FModifyParams, ModifyMiddleName);
end;

procedure TIBSecurityService.SetLastName (Value: String);
begin
  FLastName := Value;
  Include (FModifyParams, ModifyLastName);
end;

procedure TIBSecurityService.SetPassword (Value: String);
begin
  FPassword := Value;
  Include (FModifyParams, ModifyPassword);
end;

procedure TIBSecurityService.SetUserId (Value: Integer);
begin
  FUserId := Value;
  Include (FModifyParams, ModifyUserId);
end;

procedure TIBSecurityService.SetGroupId (Value: Integer);
begin
  FGroupId := Value;
  Include (FModifyParams, ModifyGroupId);
end;

procedure TIBSecurityService.Loaded; 
begin
  inherited Loaded;
  ClearParams;
end;

procedure TIBSecurityService.SetServiceStartOptions;
var
  Len: UShort;

begin
  case FSecurityAction of
    ActionAddUser:
    begin
      Action := isc_action_svc_add_user;
      if FUserName.Contains(' ') then
        IBError(ibxeStartParamsError, [nil]);
      Len := FUserName.Length;
      if (Len = 0) then
        IBError(ibxeStartParamsError, [nil]);
      FStartParams := nil;
      ServiceStartAddParam(isc_action_svc_add_user);
      ServiceStartAddParam(FUserName, isc_spb_sec_username);
      ServiceStartAddParam(FUserID, isc_spb_sec_userid);
      ServiceStartAddParam(FGroupID, isc_spb_sec_groupid);
      ServiceStartAddParam(FPassword, isc_spb_sec_password);
      ServiceStartAddParam(FFirstName, isc_spb_sec_firstname);
      ServiceStartAddParam(FMiddleName, isc_spb_sec_middlename);
      ServiceStartAddParam(FLastName, isc_spb_sec_lastname);
      ServiceStartAddParam(FSQLRole, isc_spb_sql_role_name);
    end;
    ActionDeleteUser:
    begin
      Action := isc_action_svc_delete_user;
      Len := Length(FUserName);
      if (Len = 0) then
        IBError(ibxeStartParamsError, [nil]);
      FStartParams := nil;
      ServiceStartAddParam(isc_action_svc_delete_user);
      ServiceStartAddParam(FUserName, isc_spb_sec_username);
    end;
    ActionModifyUser:
    begin
      Action := isc_action_svc_modify_user;
      Len := Length(FUserName);
      if (Len = 0) then
        IBError(ibxeStartParamsError, [nil]);
      FStartParams := nil;
      ServiceStartAddParam(isc_action_svc_modify_user);
      ServiceStartAddParam(FUserName, isc_spb_sec_username);
      if (ModifyUserId in FModifyParams) then
        ServiceStartAddParam(FUserID, isc_spb_sec_userid);
      if (ModifyGroupId in FModifyParams) then
        ServiceStartAddParam(FGroupID, isc_spb_sec_groupid);
      if (ModifyPassword in FModifyParams) then
        ServiceStartAddParam(FPassword, isc_spb_sec_password);
      if (ModifyFirstName in FModifyParams) then
        ServiceStartAddParam(FFirstName, isc_spb_sec_firstname);
      if (ModifyMiddleName in FModifyParams) then
        ServiceStartAddParam(FMiddleName, isc_spb_sec_middlename);
      if (ModifyLastName in FModifyParams) then
        ServiceStartAddParam(FLastName, isc_spb_sec_lastname);
      ServiceStartAddParam(FSQLRole, isc_spb_sql_role_name);
    end;
  end;
  ClearParams;
end;

{ TIBUnStructuredService }
constructor TIBControlAndQueryService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEof := False;
  FAction := 0;
end;

procedure TIBControlAndQueryService.SetAction(Value: Integer);
begin
  FEof := False;
  FAction := Value;
end;


function TIBControlAndQueryService.GetNextChunk: String;
var
  Len: Integer;
begin
  if (FEof = True) then
  begin
    result := '';
    exit;
  end;
  if (FAction = 0) then
    IBError(ibxeQueryParamsError, [nil]);
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_to_eof);
  InternalServiceQuery;
  if (OutputBuffer[0] <> isc_info_svc_to_eof) then
    IBError(ibxeOutputParsingError, [nil]);
  Len := GDSLibrary.isc_vax_integer(PByte(OutputBuffer) + 1, 2);
  if (OutputBuffer[3 + Len] = isc_info_truncated) then
    FEof := False
  else
    if (OutputBuffer[3 + Len] = isc_info_end) then
      FEof := True
    else
      IBError(ibxeOutputParsingError, [nil]);
  result := TEncoding.ANSI.GetString(FOutputBuffer, 3, Len);
end;

function TIBControlAndQueryService.GetNextChunk(Bytes: PByte): Integer;
var
  Len: Integer;
begin
  if (FEof = True) then
  begin
    result := 0;
    exit;
  end;
  if (FAction = 0) then
    IBError(ibxeQueryParamsError, [nil]);
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_to_eof);
  InternalServiceQuery;
  if (OutputBuffer[0] <> isc_info_svc_to_eof) then
    IBError(ibxeOutputParsingError, [nil]);
  Len := GDSLibrary.isc_vax_integer(PByte(OutputBuffer) + 1, 2);
  if (OutputBuffer[3 + Len] = isc_info_truncated) then
    FEof := False
  else
    if (OutputBuffer[3 + Len] = isc_info_end) then
      FEof := True
    else
      IBError(ibxeOutputParsingError, [nil]);
  Move(TBytes(OutputBuffer)[3], Bytes^, Len);
  result := Len;
end;

function TIBControlAndQueryService.GetNextLine: String;
var
  Len: Integer;
begin
  if (FEof = True) then
  begin
    result := '';
    exit;
  end;
  if (FAction = 0) then
    IBError(ibxeQueryParamsError, [nil]);
  ServiceQueryParams := nil;
  AddQueryParam(isc_info_svc_line);
  InternalServiceQuery;
  if (OutputBuffer[0] <> isc_info_svc_line) then
    IBError(ibxeOutputParsingError, [nil]);
  Len := GDSLibrary.isc_vax_integer(PByte(OutputBuffer) + 1, 2);
  if (OutputBuffer[3 + Len] <> isc_info_end) then
    IBError(ibxeOutputParsingError, [nil]);
  if (Len <> 0) then
    FEof := False
  else
  begin
    result := '';
    FEof := True;
    exit;
  end;
  result := TEncoding.ANSI.GetString(FOutputBuffer, 3, Len);
end;

procedure TIBSecurityService.ExecuteSQL(SQL: String);
var
  FDatabase : TIBDatabase;
  FTransaction : TIBTransaction;
  FIBSQL : TIBSQL;
  DatabaseInfo: TIBDatabaseInfo;
begin
  FDatabase := TIBDatabase.Create(nil);
  FTransaction := TIBTransaction.Create(nil);
  FIBSQL := TIBSQL.Create(nil);
  try
    FDatabase.DefaultTransaction := FTransaction;
    FTransaction.DefaultDatabase := FDatabase;
    FIBSQL.Database := FDatabase;
    case Protocol of
      Local : FDatabase.DatabaseName := UserDatabase;
      TCP : FDatabase.DatabaseName := Format('%s:%s', [ServerName, UserDatabase]); {do not localize}
      NamedPipe : FDatabase.DatabaseName := Format('\\%s\%s', [ServerName, UserDatabase]); {do not localize}
      SPX : FDatabase.DatabaseName := Format('%s@%s', [ServerName, UserDatabase]); {do not localize}
    end;
    FDatabase.Params.Assign(Params);
    FDatabase.LoginPrompt := LoginPrompt;
    FIBSQL.SQL.Text := SQL;
    FDatabase.Connected := true;
    DatabaseInfo := TIBDatabaseInfo.Create(self);
    try
      DatabaseInfo.Database := FDatabase;
      if DatabaseInfo.FullODS < 11.2 then
        raise EIBClientError.Create(Format(SIB75feature, ['This '])); {do not localize}
    finally
      DatabaseInfo.Free;
    end;
    FTransaction.StartTransaction;
    FIBSQL.ExecQuery;
    FTransaction.Commit;
  finally
    FDatabase.Free;
    FTransaction.Free;
    FIBSQL.Free;
  end;
end;

procedure TIBSecurityService.EnableEUA(Value: Boolean);
begin
  if Value then
    ExecuteSQL('ALTER DATABASE ADD ADMIN OPTION') {do not localize}
  else
    ExecuteSQL('ALTER DATABASE DROP ADMIN OPTION') {do not localize}
end;

procedure TIBSecurityService.SuspendEUA(Value: Boolean);
begin
  if Value then
    ExecuteSQL('ALTER DATABASE SET ADMIN OPTION INACTIVE') {do not localize}
  else
    ExecuteSQL('ALTER DATABASE SET ADMIN OPTION ACTIVE') {do not localize}
end;

procedure TIBSecurityService.SetDefaultRole(const Value: String);
begin
  FDefaultRole := Value;
  Include (FModifyParams, ModifyDefaultRole);
end;

procedure TIBSecurityService.SetSystemUserName(const Value: String);
begin
  FSystemUserName := Value;
  Include (FModifyParams, ModifySystemUserName);
end;

procedure TIBSecurityService.SetGroupName(const Value: String);
begin
  FGroupName := Value;
  Include (FModifyParams, ModifyGroupName);
end;

procedure TIBSecurityService.SetDescription(const Value: String);
begin
  FDescription := Value;
  Include (FModifyParams, ModifyDescription);
end;

procedure TIBSecurityService.SetActiveUser(const Value: Boolean);
begin
  FActiveUser := Value;
  Include (FModifyParams, ModifyActiveUser);
end;

{ TIBLogService }

function TIBLogService.GetLogFile: string;
var
  len : Integer;
  Buf : TBytes;
begin
  len := 0;
  SetLength(Buf, BufferSize * 5);
  while not Eof do
  begin 
    if Length(Buf) - len < BufferSize then
      SetLength(Buf, BufferSize * ((len div BufferSize) + 3));
    len := len + GetNextChunk(@(Buf[len]));
  end;
  Result := TEncoding.ANSI.GetString(Buf, 0, len);
  Buf := nil;
end;

procedure TIBLogService.SetServiceStartOptions;
begin
  Action := isc_action_svc_get_ib_log;
  FStartParams := nil;
  ServiceStartAddParam(isc_action_svc_get_ib_log);
end;

{ TDatabaseInfo }

procedure TDatabaseInfo.Clear;
begin
  NoOfAttachments := 0;
  NoOfDatabases := 0;
  DbName := nil;
end;

constructor TDatabaseInfo.Create;
begin
  DbName := nil;
end;

destructor TDatabaseInfo.Destroy;
begin
  DbName := nil;
  inherited Destroy;
end;

{ TLicenseInfo }

procedure TLicenseInfo.Clear;
begin
  Key := nil;
  Id := nil;
  Desc := nil;
  LicensedUsers := 0;
end;

constructor TLicenseInfo.Create;
begin
  Key := nil;
  Id := nil;
  Desc := nil;
end;

destructor TLicenseInfo.Destroy;
begin
  Key := nil;
  Id := nil;
  Desc := nil;
  inherited Destroy;
end;

{ TConfigFileData }

procedure TConfigFileData.Clear;
begin
  ConfigFileKey := nil;
  ConfigFileValue := nil;
end;

constructor TConfigFileData.Create;
begin
  ConfigFileValue := nil;
  ConfigFileKey := nil;
end;

destructor TConfigFileData.Destroy;
begin
  ConfigFileValue := nil;
  ConfigFileKey := nil;
  inherited Destroy;
end;

{ TConfigParams }

procedure TConfigParams.Clear;
begin
  ConfigFileData.Clear;
  ConfigFileParams := nil;
  BaseLocation := '';
  LockFileLocation := '';
  MessageFileLocation := '';
  SecurityDatabaseLocation := '';
end;

constructor TConfigParams.Create;
begin
  ConfigFileData := TConfigFileData.Create;
  ConfigFileParams := nil;
end;

destructor TConfigParams.Destroy;
begin
  ConfigFileData.Free;
  ConfigFileParams := nil;
  inherited Destroy;
end;

{ TVersionInfo }

procedure TVersionInfo.Clear;
begin
  ServerImplementation := '';
  ServerVersion := '';
  ServiceVersion := 0;
end;

function TVersionInfo.IsMinimumVersion(MinVersion: string): Boolean;
var
  lServer : String;
  Idx : Integer;
  ServerAsInt, MinAsInt : Double;

  function GetNextNumber(var s : String) : Integer;
  begin
    Idx := s.IndexOf('.');  {do not localize}
    if Idx > 0 then
    begin
      Result := s.Substring(0, Idx).ToInteger;
      s := s.Substring(s.IndexOf('.') + 1, s.Length); {do not localize}
    end
    else
    begin
      Result := s.ToInteger;
      s := '';
    end;
  end;

begin
  if ServerVersion = '' then
    raise Exception.Create(SNoVersionInfo);
  Result := true;
  Idx := Low(ServerVersion);
  while (Idx < Length(ServerVersion)) and
        (not ServerVersion[Idx].IsNumber) do
    Inc(Idx);
  Idx := ServerVersion.IndexOf(ServerVersion[Idx]);
  lServer := ServerVersion.Substring(Idx, ServerVersion.Length);
  if (Trim(lServer) = '') or
     (trim(MinVersion) = '') then
    Result := false;
  ServerAsInt := 0;
  MinAsInt := 0;
  while Result and (MinVersion <> '') do
  begin
    ServerAsInt := (ServerAsInt * 1000) + GetNextNumber(lServer);
    MinAsInt := (MinAsInt * 1000) + GetNextNumber(MinVersion);
    Result := MinAsInt <= ServerAsInt;
  end;
end;

{ TLicenseMaskInfo }

procedure TLicenseMaskInfo.Clear;
begin
  LicenseMask := 0;
  CapabilityMask := 0;
end;

{ TIBJournalInformation }

constructor TIBJournalInformation.Create(AOwner: TComponent);
begin
  inherited;
  FDirectory := '';
  FPageCache := 100;
  FCheckpointInterval := 0;
  FTimestampName := true;
  FPageSize := 0;
  FCheckpointLength := 500;
  FPageLength := 4000;
  FHasArchive := false;
  FHasJournal := False;
end;

function TIBJournalInformation.CreateJournalAttributes: String;
begin
  Result := ' CHECKPOINT LENGTH ' + IntToStr(CheckpointLength);  {do not localize}
  Result := Result + ' CHECKPOINT INTERVAL ' + IntToStr(CheckpointInterval);  {do not localize}
  Result := Result + ' PAGE SIZE ' + IntToStr(PageSize);   {do not localize}
  Result := Result + ' PAGE CACHE ' + IntToStr(PageCache);  {do not localize}
  if TimestampName then
    Result := Result + ' TIMESTAMP NAME'    {do not localize}
  else
    Result := Result + ' NO TIMESTAMP NAME';   {do not localize}
end;

function TIBJournalInformation.CreateJournalLength: String;
begin
  If PageLength <> 4000 then
    Result := Result + ' LENGTH ' + IntToStr(PageLength);   {do not localize}
end;

{ TIBBackupRestoreService }

procedure TIBBackupRestoreService.VersionCheck(const IBVersion, ErrorMessage: String);
var
  svcServer : TIBServerProperties;
begin
  svcServer := TIBServerProperties.Create(nil);
  try
    svcServer.ServerName := ServerName;
    svcServer.Protocol := Protocol;
    svcServer.LoginPrompt := false;
    svcServer.Params.Assign(Params);
    svcServer.Options := [Version];
    svcServer.Active := true;
    svcServer.Fetch;
    if not svcServer.VersionInfo.IsMinimumVersion(IBVersion) then
      raise Exception.Create(Format(SIBXE3feature, [ErrorMessage]));
  finally
    svcServer.Free;
  end;
end;

procedure BuildSPBConstants;
begin
  SPBConstants := TSPBConstants.Create(TIStringComparer.Ordinal);

  SPBConstants.Add('user_name', isc_spb_user_name);  {do not localize}
  SPBConstants.Add('sys_user_name', isc_spb_sys_user_name  ); {do not localize}
  SPBConstants.Add('sys_user_name_enc', isc_spb_sys_user_name_enc  ); {do not localize}
  SPBConstants.Add('password', isc_spb_password  ); {do not localize}
  SPBConstants.Add('password_enc', isc_spb_password_enc  ); {do not localize}
  SPBConstants.Add('sys_encrypt_password', isc_spb_sys_encrypt_password); {do not localize}
  SPBConstants.Add('command_line', isc_spb_command_line  ); {do not localize}
  SPBConstants.Add('dbname', isc_spb_dbname  ); {do not localize}
  SPBConstants.Add('verbose', isc_spb_verbose  ); {do not localize}
  SPBConstants.Add('options', isc_spb_options  ); {do not localize}
  SPBConstants.Add('connect_timeout', isc_spb_connect_timeout  ); {do not localize}
  SPBConstants.Add('dummy_packet_interval', isc_spb_dummy_packet_interval  ); {do not localize}
  SPBConstants.Add('sql_role_name', isc_spb_sql_role_name  );  {do not localize}
  SPBConstants.Add('instance_name', isc_spb_instance_name  ); {do not localize}
  SPBConstants.Add('user_dbname', isc_spb_user_dbname  ); {do not localize}
  SPBConstants.Add('auth_dbname', isc_spb_auth_dbname  );  {do not localize}

  SPBConstants.Add('bkp_encrypt_name', isc_spb_bkp_encrypt_name); {do not localize}
  SPBConstants.Add('bkp_preallocate', isc_spb_bkp_preallocate); {do not localize}
  SPBConstants.Add('prp_archive_dumps', isc_spb_prp_archive_dumps); {do not localize}
  SPBConstants.Add('prp_archive_sweep', isc_spb_prp_archive_sweep); {do not localize}
  SPBConstants.Add('res_archive_recover_until', isc_spb_res_archive_recover_until); {do not localize}
  SPBConstants.Add('res_archive_recover', isc_spb_res_archive_recover); {do not localize}
  SPBConstants.Add('dmp_create', isc_spb_dmp_create); {do not localize}
end;

initialization

  BuildSPBConstants;

finalization

  SPBConstants.Free;

end.
