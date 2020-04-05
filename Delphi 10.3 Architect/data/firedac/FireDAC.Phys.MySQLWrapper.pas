{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{             FireDAC MySQL wrapper classes             }
{                                                       }
{ Copyright(c) 2004-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.Phys.MySQLWrapper;

interface

uses
  System.SyncObjs, System.Classes,
  FireDAC.Stan.Util, FireDAC.Stan.Intf, FireDAC.Stan.Error,
  FireDAC.Phys.MySQLCli;

type
  EMySQLNativeException = class;
  TMySQLLib = class;
  TMySQLSession = class;
  TMySQLReader = class;
  TMySQLField = class;
  TMySQLResult = class;
  TMySQLVariable = class;
  TMySQLBlobStream = class;
  TMySQLVariables = class;
  TMySQLStatement = class;

  TMySQLBrand = (mbMySQL, mbMariaDB);

  TMySQLLib = class(TFDLibrary)
  private
    FLock: TCriticalSection;
    FBrand: TMySQLBrand;
    FCompatVersion: TFDVersion;
    procedure InitEmbedded(const AEmbArgs, AEmbGrps: String);
    procedure EndEmbedded;

  protected
    procedure GetLibraryInfo; override;
    procedure LoadEntries; override;

  public
    FMySQLEmbedded: Boolean;
    FMySQLEmbeddedInit: Boolean;

    mysql_num_fields: TPrcmysql_num_fields;
    mysql_fetch_field_direct: TPrcmysql_fetch_field_direct;
    mysql_affected_rows: TPrcmysql_affected_rows;
    mysql_insert_id: TPrcmysql_insert_id;
    mysql_errno: TPrcmysql_errno;
    mysql_error: TPrcmysql_error;
    mysql_sqlstate: TPrcmysql_sqlstate;
    mysql_warning_count: TPrcmysql_warning_count;
    mysql_info: TPrcmysql_info;
    mysql_character_set_name: TPrcmysql_character_set_name;
    mysql_get_character_set_info: TPrcmysql_get_character_set_info;
    mysql_set_character_set: TPrcmysql_set_character_set;
    mysql_init: TPrcmysql_init;
    mysql_ssl_set: TPrcmysql_ssl_set;
    mysql_get_ssl_cipher: TPrcmysql_get_ssl_cipher;
    mysql_connect: TPrcmysql_connect;
    mysql_real_connect: TPrcmysql_real_connect;
    mysql_close: TPrcmysql_close;
    mysql_select_db: TPrcmysql_select_db;
    mysql_real_query: TPrcmysql_real_query;
    mysql_kill: TPrcmysql_kill;
    mysql_ping: TPrcmysql_ping;
    mysql_stat: TPrcmysql_stat;
    mysql_get_server_info: TPrcmysql_get_server_info;
    mysql_get_client_info: TPrcmysql_get_client_info;
    mysql_get_host_info: TPrcmysql_get_host_info;
    mysql_get_proto_info: TPrcmysql_get_proto_info;
    mysql_list_processes: TPrcmysql_list_processes;
    mysql_store_result: TPrcmysql_store_result;
    mysql_use_result: TPrcmysql_use_result;
    mysql_options_: TPrcmysql_options;
    mysql_free_result: TPrcmysql_free_result;
    mysql_fetch_row: TPrcmysql_fetch_row;
    mysql_fetch_lengths: TPrcmysql_fetch_lengths;
    mysql_escape_string: TPrcmysql_escape_string;
    mysql_real_escape_string: TPrcmysql_real_escape_string;
    mysql_thread_safe: TPrcmysql_thread_safe;
    mysql_more_results: TPrcmysql_more_results;
    mysql_next_result: TPrcmysql_next_result;
    mysql_server_init: TPrcmysql_server_init;
    mysql_server_end: TPrcmysql_server_end;
    mysql_thread_init: TPrcmysql_thread_init;
    mysql_thread_end: TPrcmysql_thread_end;
    mysql_thread_id: TPrcmysql_thread_id;

    mysql_stmt_init: TPrcmysql_stmt_init;
    mysql_stmt_prepare: TPrcmysql_stmt_prepare;
    mysql_stmt_execute: TPrcmysql_stmt_execute;
    mysql_stmt_fetch: TPrcmysql_stmt_fetch;
    mysql_stmt_fetch_column: TPrcmysql_stmt_fetch_column;
    mysql_stmt_store_result: TPrcmysql_stmt_store_result;
    mysql_stmt_param_count: TPrcmysql_stmt_param_count;
    mysql_stmt_attr_set: TPrcmysql_stmt_attr_set;
    mysql_stmt_attr_get: TPrcmysql_stmt_attr_get;
    mysql_stmt_bind_param: TPrcmysql_stmt_bind_param;
    mysql_stmt_bind_result: TPrcmysql_stmt_bind_result;
    mysql_stmt_close: TPrcmysql_stmt_close;
    mysql_stmt_reset: TPrcmysql_stmt_reset;
    mysql_stmt_free_result: TPrcmysql_stmt_free_result;
    mysql_stmt_send_long_data: TPrcmysql_stmt_send_long_data;
    mysql_stmt_result_metadata: TPrcmysql_stmt_result_metadata;
    mysql_stmt_errno: TPrcmysql_stmt_errno;
    mysql_stmt_error: TPrcmysql_stmt_error;
    mysql_stmt_sqlstate: TPrcmysql_stmt_sqlstate;
    mysql_stmt_row_seek: TPrcmysql_stmt_row_seek;
    mysql_stmt_row_tell: TPrcmysql_stmt_row_tell;
    mysql_stmt_data_seek: TPrcmysql_stmt_data_seek;
    mysql_stmt_num_rows: TPrcmysql_stmt_num_rows;
    mysql_stmt_affected_rows: TPrcmysql_stmt_affected_rows;
    mysql_stmt_insert_id: TPrcmysql_stmt_insert_id;
    mysql_stmt_field_count: TPrcmysql_stmt_field_count;
    mysql_stmt_next_result: TPrcmysql_stmt_next_result;

    constructor Create(AOwningObj: TObject = nil);
    destructor Destroy; override;
    procedure Load(const AVendorHome, AVendorLib, AEmbArgs, AEmbGrps: String);
    procedure Unload; override;
    property Brand: TMySQLBrand read FBrand;
    property CompatVersion: TFDVersion read FCompatVersion;
  end;

  TFDMySQLError = class(TFDDBError)
  private
    FSQLState: String;
  protected
    procedure Assign(ASrc: TFDDBError); override;
    procedure LoadFromStorage(const AStorage: IFDStanStorage); override;
    procedure SaveToStorage(const AStorage: IFDStanStorage); override;
  public
    property SQLState: String read FSQLState;
  end;

  EMySQLNativeException = class(EFDDBEngineException)
  protected
    function GetErrorClass: TFDDBErrorClass; override;
  end;

  TMySQLSession = class(TObject)
  private
    FLib: TMySQLLib;
{$IFDEF FireDAC_MONITOR}
    FTracing: Boolean;
    FMonitor: IFDMoniClient;
{$ENDIF}
    FPMySQL: PMYSQL;
    FOwnPMySQL: Boolean;
    [weak] FOwningObj: TObject;
    FBuffer: TFDBuffer;
    FEncoder: TFDEncoder;
    FCurrDB: String;
    FInfo: EMySQLNativeException;
    FCharsetName: String;
    FServerVersion: TFDVersion;
    FClientVersion: TFDVersion;
    FPwd: String;
    FPort: Cardinal;
    FHost: String;
    FUser: String;
    FFlags: my_ulong;
    FUtf8mb4: Boolean;
    function GetAffectedRows: my_ulonglong;
    function GetWarningCount: Cardinal;
    function GetClientInfo: String;
    function GetServerInfo: String;
    procedure SetOptions(AOption: mysql_option; const AValue: PByte);
    function GetDB: String;
    procedure SetDB(const AValue: String);
    procedure ProcessError(AErrNo: Cardinal; const AMsg, ASQLState: String;
      AInitiator: TObject);
    procedure Check(ACode: Integer = -1; AInitiator: TObject = nil);
    procedure ClearInfo;
    procedure SetInfo(ApInfo, ApLevel: my_pchar; ACode: Integer);
    procedure GetInfo;
    function GetCharacterSetName: String;
    function GetHostInfo: String;
    function GetInsert_ID: my_ulonglong;
    procedure SetCharacterSetName(const AValue: String);
    function GetHasMoreResults: Boolean;
    function GetSSLCipher: String;
    function GetClientVersion: TFDVersion;
    function GetServerVersion: TFDVersion;
    function GetServerStatus: Cardinal;
  public
    constructor Create(ALib: TMySQLLib; AOwningObj: TObject = nil);
    constructor CreateUsingHandle(ALib: TMySQLLib; ApMySQL: PMYSQL;
      AOwningObj: TObject = nil);
    destructor Destroy; override;
{$IFDEF FireDAC_MONITOR}
    procedure Trace(const AMsg: String; const AArgs: array of const); overload;
    procedure Trace(AKind: TFDMoniEventKind; AStep: TFDMoniEventStep;
      const AMsg: String; const AArgs: array of const); overload;
{$ENDIF}
    procedure Init;
    procedure SSLInit(const Akey, Acert, Aca, Acapath, Acipher: String);
    procedure Connect(const host, user, passwd, db: String;
      port: Cardinal; clientflag: my_ulong);
    procedure Disconnect;
    procedure KillQuery;
    procedure Ping;
    function EscapeString(szTo: PFDAnsiString; const szFrom: PFDAnsiString;
      length: LongWord): LongWord; overload;
    procedure Query(const ACmd: String; AInitiator: TObject = nil);
    procedure QuerySB(const ACmd: TFDByteString; AInitiator: TObject = nil);
    procedure GetServerOutput;
    function StoreResult: TMySQLResult;
    function UseResult: TMySQLResult;
    function MoreResults: Boolean;
    function NextResult: Boolean;
    procedure GetCharacterSetInfo(var ACharset: MY_CHARSET_INFO);
    property Options[AOption: mysql_option]: PByte write SetOptions;
    property ServerInfo: String read GetServerInfo;
    property ServerVersion: TFDVersion read GetServerVersion;
    property ClientInfo: String read GetClientInfo;
    property ClientVersion: TFDVersion read GetClientVersion;
    property AffectedRows: my_ulonglong read GetAffectedRows;
    property WarningCount: Cardinal read GetWarningCount;
    property ServerStatus: Cardinal read GetServerStatus;
{$IFDEF FireDAC_MONITOR}
    property Tracing: Boolean read FTracing write FTracing;
    property Monitor: IFDMoniClient read FMonitor write FMonitor;
{$ENDIF}
    property DB: String read GetDB write SetDB;
    property Lib: TMySQLLib read FLib;
    property OwningObj: TObject read FOwningObj;
    property Info: EMySQLNativeException read FInfo;
    property Buffer: TFDBuffer read FBuffer;
    property Encoder: TFDEncoder read FEncoder;
    property CharacterSetName: String read GetCharacterSetName
      write SetCharacterSetName;
    property HostInfo: String read GetHostInfo;
    property Insert_ID: my_ulonglong read GetInsert_ID;
    property MySQL: PMYSQL read FPMySQL;
    property Host: String read FHost;
    property User: String read FUser;
    property Pwd: String read FPwd;
    property Port: Cardinal read FPort;
    property Flags: my_ulong read FFlags;
    property HasMoreResults: Boolean read GetHasMoreResults;
    property SSLCipher: String read GetSSLCipher;
    property UTf8mb4: Boolean read FUtf8mb4;
  end;

  TMySQLReader = class(TObject)
  private
    FStrsTrim: Boolean;
    FStrsEmpty2Null: Boolean;
    FStrsTrim2Len: Boolean;
    FMaxStringSize: LongWord;
  public
    // RW
    property StrsTrim: Boolean read FStrsTrim write FStrsTrim;
    property StrsEmpty2Null: Boolean read FStrsEmpty2Null write FStrsEmpty2Null;
    property StrsTrim2Len: Boolean read FStrsTrim2Len write FStrsTrim2Len;
    property MaxStringSize: LongWord read FMaxStringSize write FMaxStringSize;
  end;

  TMySQLField = class(TObject)
  private
    FResult: TMySQLResult;
    FpFld: PMYSQL_FIELD;
  public
    procedure GetInfo(var name, srcname, table, db: my_pchar; var type_: Byte;
      var length, flags, decimals, charsetnr: LongWord; AMaxLenValid: Boolean);
    constructor Create(AResult: TMySQLResult);
  end;

  TMySQLResult = class(TMySQLReader)
  private
    FSession: TMySQLSession;
    FCursor: PMYSQL_RES;
    FpRow: MYSQL_ROW;
    FpLengths: Pmy_ulong;
    FField: TMySQLField;
    function GetFieldCount: Cardinal;
    function GetFields(AIndex: Integer): TMySQLField;
{$IFDEF FireDAC_MONITOR}
    procedure DumpColumns(ARowIndex: Integer);
{$ENDIF}
  public
    constructor Create(ASession: TMySQLSession; AResult: PMYSQL_RES);
    destructor Destroy; override;
    function Fetch(ARowIndex: Integer): Boolean;
    function GetFieldData(AIndex: Integer; out ApData: Pointer; out ALen: LongWord): Boolean;
    function GetData(AIndex: Integer; var ApData: Pointer; out ALen: LongWord;
      AType: TFDDataType; AAttrs: TFDDataAttributes): Boolean;
    // RO
    property FieldCount: Cardinal read GetFieldCount;
    property Fields[AIndex: Integer]: TMySQLField read GetFields;
  end;

  TMySQLVariable = class(TObject)
  private
    [weak] FVars: TMySQLVariables;
    FVer: TFDVersion;
    FIndex: Cardinal;
    FFDDataType: TFDDataType;
    FDumpLabel: String;
    FFixedLen: Boolean;
    function GetBind: PMYSQL_BIND;
    function GetBindSize: LongWord;
    function GetDataType: enum_field_types;
    procedure SetDataType(const AValue: enum_field_types);
    function GetDataSize: my_ulong;
    procedure SetDataSize(const AValue: my_ulong);
    function GetUnsigned: Boolean;
    procedure SetUnsigned(const AValue: Boolean);
    procedure GetInfo(var ApData: Pointer; var ApLen: Pmy_ulong; var ApNull,
      ApError: Pmy_bool);
    function GetDumpLabel: String;
    function GetLongData: Boolean;
    procedure SetBuffer(ABuff: PByte; ALength: my_ulong);
  protected
    procedure ResetBlob; inline;
  public
    constructor Create(AVars: TMySQLVariables);
    destructor Destroy; override;
    procedure Assign(AVar: TMySQLVariable);
    // base
    function GetData(var ApData: Pointer; out ALen: LongWord;
      AByRef: Boolean = False): Boolean; overload;
    procedure SetData(ApData: Pointer; ALen: LongWord); overload;
    // helpers
    class function GetDataTypeSize(AType: enum_field_types;
      ASize: my_ulong): my_ulong; static;
{$IFDEF FireDAC_MONITOR}
    function DumpValue: String;
    function DumpSQLDataType: String;
{$ENDIF}
    // RO
    property Bind: PMYSQL_BIND read GetBind;
    property BindSize: LongWord read GetBindSize;
    property LongData: Boolean read GetLongData;
    property Index: Cardinal read FIndex;
    property Vars: TMySQLVariables read FVars;
    // RW
    property DumpLabel: String read GetDumpLabel write FDumpLabel;
    property DataType: enum_field_types read GetDataType write SetDataType;
    property DataSize: my_ulong read GetDataSize write SetDataSize;
    property Unsigned: Boolean read GetUnsigned write SetUnsigned;
    property FDDataType: TFDDataType read FFDDataType write FFDDataType;
    property FixedLen: Boolean read FFixedLen write FFixedLen;
  end;

  TMySQLBlobStream = class(TStream)
  private
    FVar: TMySQLVariable;
    FStmt: TMySQLStatement;
    FMode: TFDStreamMode;
    FDataOff: my_ulong;
    FDataLen: my_ulong;
    FBlobOff: my_ulong;
    FBuff: PByte;
    FBuffSize: my_ulong;
    FLength: my_ulong;
    procedure CheckMode(AMode: TFDStreamMode; const AMsg: String);
    function GetOwningObj: TObject;
    function GetEncoding(AType: TFDDataType): TFDEncoding;
  protected
    function GetSize: Int64; override;
  public
    constructor Create(AVar: TMySQLVariable; AMode: TFDStreamMode);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function ReadStr(ABuff: Pointer; ALen: Longint; AType: TFDDataType): Longint;
    function WriteStr(ABuff: Pointer; ALen: Longint; AType: TFDDataType): Longint;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    property Vari: TMySQLVariable read FVar;
    property OwningObj: TObject read GetOwningObj;
  end;

  TMySQLVariables = class(TObject)
  private
    FList: TFDObjList;
    [weak] FStatement: TMySQLStatement;
    FBinds: PMYSQL_BIND;
    FBindSize: Cardinal;
    FBuff: PByte;
    FBuffSize: Cardinal;
    function GetItems(AIndex: Cardinal): TMySQLVariable; inline;
    function GetCount: Integer; inline;
    procedure SetCount(const ACount: Integer);
  protected
    procedure AllocateBuff;
    procedure ReleaseBuff;
    procedure ResetBlobs;
  public
    constructor Create(AStatement: TMySQLStatement);
    destructor Destroy; override;
    procedure CheckBuff;
    property Statement: TMySQLStatement read FStatement;
    property Binds: PMYSQL_BIND read FBinds;
    property Count: Integer read GetCount write SetCount;
    property Items[AIndex: Cardinal]: TMySQLVariable read GetItems; default;
  end;

  TMySQLStatementState = (msInactive, msPrepared, msExecuted, msOpenFirst,
    msOpenNext, msEOF);
  TMySQLStatement = class(TMySQLReader)
  private
    [weak] FOwningObj: TObject;
    FSession: TMySQLSession;
    FStmt: PMYSQL_STMT;
    FParams: TMySQLVariables;
    FFields: TMySQLVariables;
    FState: TMySQLStatementState;
    procedure Check(ACode: Integer);
    function GetAffectedRows: my_ulonglong;
    function GetInsert_ID: my_ulonglong;
    function GetFieldCount: Cardinal;
    function GetParamCount: LongWord;
    function GetBoolAttr(const AIndex: Integer): my_bool;
    procedure SetBoolAttr(const AIndex: Integer; const AValue: my_bool);
    function GetLongAttr(const AIndex: Integer): LongWord;
    procedure SetLongAttr(const AIndex: Integer; const AValue: LongWord);
  public
    constructor Create(ASession: TMySQLSession; AOwningObj: TObject = nil);
    destructor Destroy; override;
    procedure Prepare(const ASQL: String);
    function Describe: TMySQLResult;
    procedure BindParams;
    procedure BindColumns;
    procedure Execute;
    function Fetch: Boolean;
    function MoreResults: Boolean;
    function NextResult: Boolean;
    procedure StoreResult;
    procedure Close;
    procedure Reset;
    procedure Unprepare;
    // R/O
    property State: TMySQLStatementState read FState;
    property AffectedRows: my_ulonglong read GetAffectedRows;
    property Insert_ID: my_ulonglong read GetInsert_ID;
    property ParamCount: LongWord read GetParamCount;
    property FieldCount: Cardinal read GetFieldCount;
    property Params: TMySQLVariables read FParams;
    property Fields: TMySQLVariables read FFields;
    property Session: TMySQLSession read FSession;
    property OwningObj: TObject read FOwningObj;
    // R/W
    property UPDATE_MAX_LENGTH: my_bool index STMT_ATTR_UPDATE_MAX_LENGTH
      read GetBoolAttr write SetBoolAttr;
    property CURSOR_TYPE: LongWord index STMT_ATTR_CURSOR_TYPE
      read GetLongAttr write SetLongAttr;
    property PREFETCH_ROWS: LongWord index STMT_ATTR_PREFETCH_ROWS
      read GetLongAttr write SetLongAttr;
  end;

implementation

uses
  System.SysUtils, System.Types, System.DateUtils,
    Data.SqlTimSt, Data.FmtBcd, Data.DB,
  FireDAC.Stan.Consts,
  FireDAC.Phys.Intf;

const
  smysql_get_client_info: String = 'mysql_get_client_info';
  smysql_num_fields: String = 'mysql_num_fields';
  smysql_fetch_field_direct: String = 'mysql_fetch_field_direct';
  smysql_affected_rows: String = 'mysql_affected_rows';
  smysql_insert_id: String = 'mysql_insert_id';
  smysql_errno: String = 'mysql_errno';
  smysql_error: String = 'mysql_error';
  smysql_sqlstate: String = 'mysql_sqlstate';
  smysql_warning_count: String = 'mysql_warning_count';
  smysql_info: String = 'mysql_info';
  smysql_character_set_name: String = 'mysql_character_set_name';
  smysql_get_character_set_info: String = 'mysql_get_character_set_info';
  smysql_set_character_set: String = 'mysql_set_character_set';
  smysql_init: String = 'mysql_init';
  smysql_connect: String = 'mysql_connect';
  smysql_ssl_set: String = 'mysql_ssl_set';
  smysql_get_ssl_cipher: String = 'mysql_get_ssl_cipher';
  smysql_real_connect: String = 'mysql_real_connect';
  smysql_close: String = 'mysql_close';
  smysql_select_db: String = 'mysql_select_db';
  smysql_real_query: String = 'mysql_real_query';
  smysql_kill: String = 'mysql_kill';
  smysql_ping: String = 'mysql_ping';
  smysql_stat: String = 'mysql_stat';
  smysql_get_server_info: String = 'mysql_get_server_info';
  smysql_get_host_info: String = 'mysql_get_host_info';
  smysql_get_proto_info: String = 'mysql_get_proto_info';
  smysql_list_processes: String = 'mysql_list_processes';
  smysql_store_result: String = 'mysql_store_result';
  smysql_use_result: String = 'mysql_use_result';
  smysql_options_: String = 'mysql_options';
  smysql_free_result: String = 'mysql_free_result';
  smysql_fetch_row: String = 'mysql_fetch_row';
  smysql_fetch_lengths: String = 'mysql_fetch_lengths';
  smysql_escape_string: String = 'mysql_escape_string';
  smysql_real_escape_string: String = 'mysql_real_escape_string';
  smysql_thread_safe: String = 'mysql_thread_safe';
  smysql_more_results: String = 'mysql_more_results';
  smysql_next_result: String = 'mysql_next_result';
  smysql_server_init: String = 'mysql_server_init';
  smysql_server_end: String = 'mysql_server_end';
  smysql_thread_init: String = 'mysql_thread_init';
  smysql_thread_end: String = 'mysql_thread_end';
  smysql_thread_id: String = 'mysql_thread_id';

  smysql_stmt_init: String = 'mysql_stmt_init';
  smysql_stmt_prepare: String = 'mysql_stmt_prepare';
  smysql_stmt_execute: String = 'mysql_stmt_execute';
  smysql_stmt_fetch: String = 'mysql_stmt_fetch';
  smysql_stmt_fetch_column: String = 'mysql_stmt_fetch_column';
  smysql_stmt_store_result: String = 'mysql_stmt_store_result';
  smysql_stmt_param_count: String = 'mysql_stmt_param_count';
  smysql_stmt_attr_set: String = 'mysql_stmt_attr_set';
  smysql_stmt_attr_get: String = 'mysql_stmt_attr_get';
  smysql_stmt_bind_param: String = 'mysql_stmt_bind_param';
  smysql_stmt_bind_result: String = 'mysql_stmt_bind_result';
  smysql_stmt_close: String = 'mysql_stmt_close';
  smysql_stmt_reset: String = 'mysql_stmt_reset';
  smysql_stmt_free_result: String = 'mysql_stmt_free_result';
  smysql_stmt_send_long_data: String = 'mysql_stmt_send_long_data';
  smysql_stmt_result_metadata: String = 'mysql_stmt_result_metadata';
  smysql_stmt_errno: String = 'mysql_stmt_errno';
  smysql_stmt_error: String = 'mysql_stmt_error';
  smysql_stmt_sqlstate: String = 'mysql_stmt_sqlstate';
  smysql_stmt_row_seek: String = 'mysql_stmt_row_seek';
  smysql_stmt_row_tell: String = 'mysql_stmt_row_tell';
  smysql_stmt_data_seek: String = 'mysql_stmt_data_seek';
  smysql_stmt_num_rows: String = 'mysql_stmt_num_rows';
  smysql_stmt_affected_rows: String = 'mysql_stmt_affected_rows';
  smysql_stmt_insert_id: String = 'mysql_stmt_insert_id';
  smysql_stmt_field_count: String = 'mysql_stmt_field_count';
  smysql_stmt_next_result: String = 'mysql_stmt_next_result';

  smariadb_connection: String = 'mariadb_connection';
  smysql_get_socket: String = 'mysql_get_socket';

  C_VarAlignment = 4 - 1;
  C_VarExtraSize = (SizeOf(my_bool) * 2 + SizeOf(my_ulong) + C_VarAlignment) and not C_VarAlignment;

{-------------------------------------------------------------------------------}
{ TMySQLLib                                                                     }
{-------------------------------------------------------------------------------}
constructor TMySQLLib.Create(AOwningObj: TObject = nil);
begin
  inherited Create(S_FD_MySQLId, AOwningObj);
  FLock := TCriticalSection.Create;
end;

{-------------------------------------------------------------------------------}
destructor TMySQLLib.Destroy;
begin
  FDFreeAndNil(FLock);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.Load(const AVendorHome, AVendorLib, AEmbArgs, AEmbGrps: String);
const
  C_MysqlDll: String = {$IFDEF MSWINDOWS} 'libmysql' {$ENDIF}
                       {$IFDEF POSIX} 'libmysqlclient' {$ENDIF} + C_FD_DLLExt;
  C_MariaDBDll: String = 'libmariadb';
  C_MysqldDll: String = 'libmysqld' + C_FD_DLLExt;
  C_MysqlDllFolder: String = 'lib';
var
  sDLLName: String;
  aMySQLDllNames: array of String;
begin
  FMySQLEmbeddedInit := False;
  sDLLName := AVendorHome;
  if sDLLName <> '' then
    sDLLName := FDNormPath(FDNormPath(sDLLName) + C_MysqlDllFolder);
  if AVendorLib <> '' then begin
    SetLength(aMySQLDllNames, 1);
    aMySQLDllNames[0] := sDLLName + AVendorLib;
  end
  else begin
    SetLength(aMySQLDllNames, 3);
    aMySQLDllNames[0] := sDLLName + C_MysqlDll;
    aMySQLDllNames[1] := sDLLName + C_MariaDBDll;
    aMySQLDllNames[2] := sDLLName + C_MysqldDll;
  end;
  inherited Load(aMySQLDllNames, True);
  if FMySQLEmbedded then
    InitEmbedded(AEmbArgs, AEmbGrps);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.Unload;
begin
  if FMySQLEmbeddedInit then
    EndEmbedded;
  inherited Unload;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.GetLibraryInfo;
begin
  inherited GetLibraryInfo;
  FMySQLEmbedded := (DLLName <> '') and FDInSet(DLLName[Pos('.', DLLName) - 1], ['d', 'D']);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.LoadEntries;
begin
  @mysql_get_client_info := GetProc(smysql_get_client_info);
  FVersion := FDVerStr2Int(TFDEncoder.Deco(mysql_get_client_info(), -1, ecANSI));
  if FVersion < mvMySQL032000 then
    FDException(OwningObj, [S_FD_LPhys, S_FD_MySQLId], er_FD_MySQLBadVersion,
      [FVersion]);

  @mysql_num_fields := GetProc(smysql_num_fields);
  @mysql_fetch_field_direct := GetProc(smysql_fetch_field_direct);
  @mysql_affected_rows := GetProc(smysql_affected_rows);
  @mysql_insert_id := GetProc(smysql_insert_id);
  @mysql_errno := GetProc(smysql_errno);
  @mysql_error := GetProc(smysql_error);
  if FVersion >= mvMySQL040101 then begin
    @mysql_sqlstate := GetProc(smysql_sqlstate);
    @mysql_warning_count := GetProc(smysql_warning_count);
  end;
  @mysql_info := GetProc(smysql_info);
  if FVersion >= mvMySQL032321 then
    @mysql_character_set_name := GetProc(smysql_character_set_name, False);
  if FVersion >= mvMySQL050010 then
    @mysql_get_character_set_info := GetProc(smysql_get_character_set_info);
  if FVersion >= mvMySQL050007 then
    @mysql_set_character_set := GetProc(smysql_set_character_set);
  @mysql_init := GetProc(smysql_init);
  if not FMySQLEmbedded then begin
    if FVersion < mvMySQL040000 then
      @mysql_connect := GetProc(smysql_connect)
    else
      @mysql_ssl_set := GetProc(smysql_ssl_set);
    if FVersion >= mvMySQL050023 then
      @mysql_get_ssl_cipher := GetProc(smysql_get_ssl_cipher, False);
  end;
  @mysql_real_connect := GetProc(smysql_real_connect);
  @mysql_close := GetProc(smysql_close);
  @mysql_select_db := GetProc(smysql_select_db);
  @mysql_real_query := GetProc(smysql_real_query);
  @mysql_kill := GetProc(smysql_kill);
  @mysql_ping := GetProc(smysql_ping);
  @mysql_stat := GetProc(smysql_stat);
  @mysql_get_server_info := GetProc(smysql_get_server_info);
  @mysql_get_host_info := GetProc(smysql_get_host_info);
  @mysql_get_proto_info := GetProc(smysql_get_proto_info);
  @mysql_list_processes := GetProc(smysql_list_processes);
  @mysql_store_result := GetProc(smysql_store_result);
  @mysql_use_result := GetProc(smysql_use_result);
  @mysql_options_ := GetProc(smysql_options_);
  @mysql_free_result := GetProc(smysql_free_result);
  @mysql_fetch_row := GetProc(smysql_fetch_row);
  @mysql_fetch_lengths := GetProc(smysql_fetch_lengths);
  @mysql_escape_string := GetProc(smysql_escape_string);
  if FVersion >= mvMySQL032314 then begin
    @mysql_real_escape_string := GetProc(smysql_real_escape_string, False);
    @mysql_thread_safe := GetProc(smysql_thread_safe, False);
  end;
  if FVersion >= mvMySQL040101 then begin
    @mysql_more_results := GetProc(smysql_more_results);
    @mysql_next_result := GetProc(smysql_next_result);
  end;
  if FMySQLEmbedded then begin
    @mysql_server_init := GetProc(smysql_server_init);
    @mysql_server_end := GetProc(smysql_server_end);
  end;
  @mysql_thread_init := GetProc(smysql_thread_init, False);
  @mysql_thread_end := GetProc(smysql_thread_end, False);
  @mysql_thread_id := GetProc(smysql_thread_id);

  if FVersion >= mvMySQL050000 then begin
    @mysql_stmt_init := GetProc(smysql_stmt_init);
    @mysql_stmt_prepare := GetProc(smysql_stmt_prepare);
    @mysql_stmt_execute := GetProc(smysql_stmt_execute);
    @mysql_stmt_fetch := GetProc(smysql_stmt_fetch);
    @mysql_stmt_fetch_column := GetProc(smysql_stmt_fetch_column);
    @mysql_stmt_store_result := GetProc(smysql_stmt_store_result);
    @mysql_stmt_param_count := GetProc(smysql_stmt_param_count);
    @mysql_stmt_attr_set := GetProc(smysql_stmt_attr_set);
    @mysql_stmt_attr_get := GetProc(smysql_stmt_attr_get);
    @mysql_stmt_bind_param := GetProc(smysql_stmt_bind_param);
    @mysql_stmt_bind_result := GetProc(smysql_stmt_bind_result);
    @mysql_stmt_close := GetProc(smysql_stmt_close);
    @mysql_stmt_reset := GetProc(smysql_stmt_reset);
    @mysql_stmt_free_result := GetProc(smysql_stmt_free_result);
    @mysql_stmt_send_long_data := GetProc(smysql_stmt_send_long_data);
    @mysql_stmt_result_metadata := GetProc(smysql_stmt_result_metadata);
    @mysql_stmt_errno := GetProc(smysql_stmt_errno);
    @mysql_stmt_error := GetProc(smysql_stmt_error);
    @mysql_stmt_sqlstate := GetProc(smysql_stmt_sqlstate);
    @mysql_stmt_row_seek := GetProc(smysql_stmt_row_seek);
    @mysql_stmt_row_tell := GetProc(smysql_stmt_row_tell);
    @mysql_stmt_data_seek := GetProc(smysql_stmt_data_seek);
    @mysql_stmt_num_rows := GetProc(smysql_stmt_num_rows);
    @mysql_stmt_affected_rows := GetProc(smysql_stmt_affected_rows);
    @mysql_stmt_insert_id := GetProc(smysql_stmt_insert_id);
    @mysql_stmt_field_count := GetProc(smysql_stmt_field_count);
    if FVersion >= mvMySQL050503 then
      @mysql_stmt_next_result := GetProc(smysql_stmt_next_result);
  end;

  if (GetProc(smariadb_connection, False) <> nil) or
     (GetProc(smysql_get_socket, False) <> nil) then begin
    FBrand := mbMariaDB;
    FCompatVersion := mvMySQL050100;
  end
  else begin
    FBrand := mbMySQL;
    FCompatVersion := FVersion;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.InitEmbedded(const AEmbArgs, AEmbGrps: String);
var
  aStrs: array of TFDByteString;
  aArgs, aGroups: array of PByte;
  pArgs, pGroups: my_ppchar;
  iArgCount, iGroupCount, i: Integer;
begin
  iArgCount := 0;
  i := 1;
  while i <= Length(AEmbArgs) do begin
    FDExtractFieldName(AEmbArgs, i);
    Inc(iArgCount);
  end;
  iGroupCount := 0;
  i := 1;
  while i <= Length(AEmbGrps) do begin
    FDExtractFieldName(AEmbGrps, i);
    Inc(iGroupCount);
  end;
  SetLength(aStrs, iArgCount + iGroupCount + 1);
  SetLength(aArgs, iArgCount + 2);

  aStrs[0] := TFDEncoder.Enco('server', ecANSI);
  aArgs[0] := PByte(aStrs[0]);
  iArgCount := 1;
  i := 1;
  while i <= Length(AEmbArgs) do begin
    aStrs[iArgCount] := TFDEncoder.Enco(FDExtractFieldName(AEmbArgs, i), ecANSI);
    aArgs[iArgCount] := PByte(aStrs[iArgCount]);
    Inc(iArgCount);
  end;
  aArgs[iArgCount] := nil;
  pArgs := @aArgs[0];

  if iGroupCount = 0 then
    pGroups := nil
  else begin
    SetLength(aGroups, iGroupCount + 1);
    iGroupCount := 0;
    i := 1;
    while i <= Length(AEmbGrps) do begin
      aStrs[iGroupCount + iArgCount] := TFDEncoder.Enco(FDExtractFieldName(AEmbGrps, i), ecANSI);
      aGroups[iGroupCount] := PByte(aStrs[iGroupCount + iArgCount]);
      Inc(iGroupCount);
    end;
    aGroups[iGroupCount] := nil;
    pGroups := @aGroups[0];
  end;

  if mysql_server_init(iArgCount, pArgs, pGroups) <> 0 then
    FDException(OwningObj, [S_FD_LPhys, S_FD_MySQLId],
      er_FD_MySQLCantInitEmbeddedServer, []);
  FMySQLEmbeddedInit := True;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLLib.EndEmbedded;
begin
  FMySQLEmbeddedInit := False;
  mysql_server_end();
end;

{-------------------------------------------------------------------------------}
{ TFDMySQLError                                                                 }
{-------------------------------------------------------------------------------}
procedure TFDMySQLError.Assign(ASrc: TFDDBError);
begin
  inherited Assign(ASrc);
  if ASrc is TFDMySQLError then
    FSQLState := TFDMySQLError(ASrc).FSQLState;
end;

{-------------------------------------------------------------------------------}
procedure TFDMySQLError.LoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited LoadFromStorage(AStorage);
  FSQLState := AStorage.ReadString('SQLState', '');
end;

{-------------------------------------------------------------------------------}
procedure TFDMySQLError.SaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited SaveToStorage(AStorage);
  AStorage.WriteString('SQLState', FSQLState, '');
end;

{-------------------------------------------------------------------------------}
function EMySQLNativeException.GetErrorClass: TFDDBErrorClass;
begin
  Result := TFDMySQLError;
end;

{-------------------------------------------------------------------------------}
{ TMySQLSession                                                                 }
{-------------------------------------------------------------------------------}
constructor TMySQLSession.Create(ALib: TMySQLLib; AOwningObj: TObject);
begin
  inherited Create;
  FOwningObj := AOwningObj;
  FLib := ALib;
  FOwnPMySQL := True;
  FBuffer := TFDBuffer.Create;
  FEncoder := TFDEncoder.Create(FBuffer);
end;

{-------------------------------------------------------------------------------}
constructor TMySQLSession.CreateUsingHandle(ALib: TMySQLLib; ApMySQL: PMYSQL;
  AOwningObj: TObject);
begin
  inherited Create;
  FOwningObj := AOwningObj;
  FLib := ALib;
  FPMySQL := ApMySQL;
  FOwnPMySQL := FPMySQL = nil;
  FBuffer := TFDBuffer.Create;
  FEncoder := TFDEncoder.Create(FBuffer);
end;

{-------------------------------------------------------------------------------}
destructor TMySQLSession.Destroy;
begin
  if FPMySQL <> nil then
    Disconnect;
  ClearInfo;
{$IFDEF FireDAC_MONITOR}
  FMonitor := nil;
{$ENDIF}
  FOwningObj := nil;
  FDFreeAndNil(FEncoder);
  FDFreeAndNil(FBuffer);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
{$IFDEF FireDAC_MONITOR}
procedure TMySQLSession.Trace(const AMsg: String; const AArgs: array of const);
begin
  FMonitor.Notify(ekVendor, esProgress, OwningObj, AMsg, AArgs);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Trace(AKind: TFDMoniEventKind; AStep: TFDMoniEventStep;
  const AMsg: String; const AArgs: array of const);
begin
  FMonitor.Notify(AKind, AStep, OwningObj, AMsg, AArgs);
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
procedure TMySQLSession.ProcessError(AErrNo: Cardinal;
  const AMsg, ASQLState: String; AInitiator: TObject);
var
  oEx: EMySQLNativeException;
  oErr: TFDMySQLError;
  sObj, sSQL: String;
  eKind: TFDCommandExceptionKind;
  oCommand: IFDPhysCommand;
  iOff, i1, i2: Integer;

  procedure ExtractObjName;
  var
    i1, i2: Integer;
  begin
    i1 := Pos('''', AMsg);
    if i1 <> 0 then begin
      i2 := Pos('''', AMsg, i1 + 1);
      if i2 <> 0 then
        sObj := Copy(AMsg, i1 + 1, i2 - i1 - 1);
    end;
  end;

begin
  oEx := EMySQLNativeException.Create(er_FD_MySQLGeneral,
    FDExceptionLayers([S_FD_LPhys, S_FD_MySQLId]) + ' ' + AMsg);
  sObj := '';
  eKind := ekOther;
  case AErrNo of
  ER_NO_SUCH_TABLE,
  ER_BAD_TABLE_ERROR,
  ER_SP_DOES_NOT_EXIST,
  ER_TRG_DOES_NOT_EXIST,
  ER_UNKNOWN_VIEW:        begin eKind := ekObjNotExists; ExtractObjName; end;
  ER_DUP_ENTRY:           eKind := ekUKViolated;
  ER_LOCK_WAIT_TIMEOUT:   eKind := ekRecordLocked;
  ER_NO_REFERENCED_ROW,
  ER_ROW_IS_REFERENCED:   eKind := ekFKViolated;
  ER_ACCESS_DENIED_ERROR: eKind := ekUserPwdInvalid;
  ER_MUST_CHANGE_PASSWORD,
  ER_MUST_CHANGE_PASSWORD_LOGIN:
                          eKind := ekUserPwdExpired;
  CR_CONN_HOST_ERROR,
  ER_SERVER_GONE_ERROR,
  ER_SERVER_LOST:         eKind := ekServerGone;
  ER_SP_WRONG_NO_OF_ARGS,
  ER_SP_NOT_VAR_ARG:      eKind := ekInvalidParams;
  ER_QUERY_INTERRUPTED:   eKind := ekCmdAborted;
  // ekNoDataFound - nothing similar in MySQL
  // 1048 - NOT NULL violated
  end;
  iOff := -1;
  if (AErrNo = ER_PARSE_ERROR) and Supports(AInitiator, IFDPhysCommand, oCommand) then begin
    sSQL := oCommand.CommandText;
    i1 := Pos('to use near ''', AMsg);
    if i1 = 0 then
      i1 := Pos('syntax near ''', AMsg);
    if i1 <> 0 then begin
      if (i1 + 13 < Length(AMsg)) and (AMsg[i1 + 13] = '?') then
        eKind := ekInvalidParams;
      i1 := i1 + 13;
      i2 := Length(AMsg);
      while (i2 > i1) and (AMsg[i2] <> '''') do
        Dec(i2);
      iOff := Pos(AdjustLineBreaks(Copy(AMsg, i1, i2 - i1 - 1), tlbsCRLF), sSQL);
      if iOff = 0 then begin
        i1 := Pos('at line', AMsg);
        if i1 <> 0 then begin
          i1 := StrToIntDef(Copy(AMsg, i1 + 7, Length(AMsg)), 0);
          if i1 <> 0 then begin
            i2 := 1;
            while i2 <= Length(sSQL) do
              if sSQL[i2] = #13 then begin
                if sSQL[i2 + 1] = #10 then
                  Inc(i2);
                Inc(i2);
                Dec(i1);
                if i1 = 1 then begin
                  iOff := i2;
                  Break;
                end;
              end
              else
                Inc(i2);
          end;
        end;
      end;
    end;
  end;
  oErr := TFDMySQLError(oEx.AppendError(1, AErrNo, AMsg, sObj, eKind, iOff, -1));
  oErr.FSQLState := ASQLState;
{$IFDEF FireDAC_MONITOR}
  if Tracing then
    FMonitor.Notify(ekError, esProgress, OwningObj, AMsg, ['errno', AErrNo,
      'sqlstate', ASQLState]);
{$ENDIF}
  FDException(AInitiator, oEx {$IFDEF FireDAC_Monitor}, Tracing {$ENDIF});
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.ClearInfo;
begin
  FDFreeAndNil(FInfo);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.SetInfo(ApInfo, ApLevel: my_pchar; ACode: Integer);
begin
  if FInfo = nil then
    FInfo := EMySQLNativeException.Create(er_FD_MySQLGeneral,
      FDExceptionLayers([S_FD_LPhys, S_FD_MySQLId]));
  FInfo.AppendError(FInfo.ErrorCount + 1, ACode,
    Encoder.Decode(ApInfo, -1, ecANSI),
    Encoder.Decode(ApLevel, -1, ecANSI),
    ekServerOutput, -1, -1);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.GetInfo;
var
  pInfo: my_pchar;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_info, ['res', Encoder.Decode(pInfo, -1, ecANSI)]);
  end;
{$ENDIF}

begin
  pInfo := FLib.mysql_info(FPMySQL);
  if pInfo <> nil then begin
    SetInfo(pInfo, my_pchar(Encoder.Encode('Info', ecANSI)), MYSQL_SUCCESS);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Check(ACode: Integer = -1; AInitiator: TObject = nil);

  procedure DoError(AErrNo: Cardinal; AInitiator: TObject);
  var
    sMsg, sSQLState: String;
  begin
    sMsg := Encoder.Decode(FLib.mysql_error(FPMySQL), -1, ecANSI);
    if Assigned(FLib.mysql_sqlstate) then
      sSQLState := Encoder.Decode(FLib.mysql_sqlstate(FPMySQL), -1, ecANSI);
    if AInitiator = nil then
      AInitiator := OwningObj;
    ProcessError(AErrNo, sMsg, sSQLState, AInitiator);
  end;

var
  iErrNo: Cardinal;
begin
  if ACode <> 0 then begin
    iErrNo := FLib.mysql_errno(FPMySQL);
    if (ACode <> -1) or (iErrNo <> 0) then
      DoError(iErrNo, AInitiator);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Init;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_init, []);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  if FOwnPMySQL then begin
    FLib.FLock.Enter;
    try
      FPMySQL := FLib.mysql_init(nil);
    finally
      FLib.FLock.Leave;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.SSLInit(const Akey, Acert, Aca, Acapath, Acipher: String);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_ssl_set, ['key', Akey, 'cert', Acert, 'ca', Aca,
      'capath', Acapath, 'cipher', Acipher]);
  end;
{$ENDIF}

  function S2P(AStr: String; var AVar: TFDByteString): my_pchar;
  begin
    if AStr = '' then
      Result := nil
    else begin
      AVar := Encoder.Encode(AStr, ecANSI);
      Result := my_pchar(AVar);
    end;
  end;

var
  sKey, sCert, sCa, sCAPath, sCipher: TFDByteString;
begin
  if Assigned(FLib.mysql_ssl_set) then begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    FLib.mysql_ssl_set(FPMySQL, S2P(Akey, sKey), S2P(Acert, sCert), S2P(Aca, sCa),
      S2P(Acapath, sCAPath), S2P(Acipher, sCipher));
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetSSLCipher: String;
begin
  if Assigned(FLib.mysql_get_ssl_cipher) then
    Result := Encoder.Decode(FLib.mysql_get_ssl_cipher(FPMySQL), -1, ecANSI)
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Connect(const host, user, passwd, db: String;
  port: Cardinal; clientflag: my_ulong);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_real_connect, ['host', host, 'user', user, 'passwd', '***',
      'db', db, 'port', port, 'clientflag', clientflag]);
  end;

  procedure Trace2;
  begin
    Trace(smysql_connect, ['host', host, 'user', user, 'passwd', '***']);
  end;
{$ENDIF}

var
  sHost, sUser, sPwd, sDb: TFDByteString;
begin
  sHost := Encoder.Encode(host, ecANSI);
  sUser := Encoder.Encode(user, ecANSI);
  sPwd := Encoder.Encode(passwd, ecANSI);
  sDb := Encoder.Encode(db, ecANSI);
  if Assigned(FLib.mysql_real_connect) then begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    if FLib.mysql_real_connect(FPMySQL, my_pchar(PByte(sHost)),
        my_pchar(PByte(sUser)), my_pchar(PByte(sPwd)),
        my_pchar(PByte(sDb)), port, nil, clientflag) = nil then
      Check;
  end
  else begin
    if (port <> 0) and (port <> MYSQL_PORT) then
      FDException(OwningObj, [S_FD_LPhys, S_FD_MySQLId], er_FD_MySQLCantSetPort, []);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace2;
{$ENDIF}
    if FLib.mysql_connect(FPMySQL, my_pchar(PByte(sHost)),
        my_pchar(PByte(sUser)), my_pchar(PByte(sPwd))) = nil then
      Check;
    if db <> '' then
      Query('USE ' + db);
  end;
  FCurrDB := db;
  FHost := host;
  FUser := user;
  FPwd := passwd;
  FPort := port;
  FFlags := clientflag;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Disconnect;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_close, []);
  end;
{$ENDIF}

begin
  if FPMySQL = nil then
    Exit;
  ClearInfo;
  if FOwnPMySQL then begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    FLib.mysql_close(FPMySQL);
  end;
  FPMySQL := nil;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.KillQuery;
var
  oSess: TMySQLSession;
begin
  oSess := TMySQLSession.Create(FLib, Self);
  try
{$IFDEF FireDAC_MONITOR}
    oSess.Tracing := FTracing;
    oSess.Monitor := FMonitor;
{$ENDIF}
    oSess.Init;
    oSess.Connect(FHost, FUser, FPwd, FCurrDB, FPort, FFlags);
    oSess.Query(Format('KILL QUERY %u', [FLib.mysql_thread_id(FPMySQL)]));
  finally
    FDFree(oSess);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Ping;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_ping, []);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  Check(FLib.mysql_ping(FPMySQL));
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.EscapeString(szTo: PFDAnsiString; const szFrom: PFDAnsiString;
  length: LongWord): LongWord;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
                                                                 
    Trace(smysql_real_escape_string, ['szFrom', Encoder.Decode(szFrom, length, ecANSI),
                                      'szTo', Encoder.Decode(szTo, Result, ecANSI)]);
  end;

  procedure Trace2;
  begin
                                                                 
    Trace(smysql_escape_string, ['szFrom', Encoder.Decode(szFrom, length, ecANSI),
                                 'szTo', Encoder.Decode(szTo, Result, ecANSI)]);
  end;
{$ENDIF}

begin
  if Assigned(FLib.mysql_real_escape_string) then begin
    Result := FLib.mysql_real_escape_string(FPMySQL, szTo, szFrom, length);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
  end
  else begin
    Result := FLib.mysql_escape_string(szTo, szFrom, length);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace2;
{$ENDIF}
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetAffectedRows: my_ulonglong;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_affected_rows, ['Rows', Result]);
  end;
{$ENDIF}

begin
  Result := FLib.mysql_affected_rows(FPMySQL);
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetWarningCount: Cardinal;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_warning_count, ['res', Result]);
  end;
{$ENDIF}

begin
  if Assigned(FLib.mysql_warning_count) then begin
    Result := FLib.mysql_warning_count(FPMySQL);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
  end
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetClientInfo: String;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_get_client_info, ['Ver', Result]);
  end;
{$ENDIF}

begin
  Result := Encoder.Decode(FLib.mysql_get_client_info(), -1, ecANSI);
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetClientVersion: TFDVersion;
begin
  if FClientVersion = 0 then
    FClientVersion := FDVerStr2Int(ClientInfo);
  Result := FClientVersion;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetServerInfo: String;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_get_server_info, ['Ver', Result]);
  end;
{$ENDIF}

begin
  Result := Encoder.Decode(FLib.mysql_get_server_info(FPMySQL), -1, ecANSI);
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetServerVersion: TFDVersion;
begin
  if FServerVersion = 0 then
    FServerVersion := FDVerStr2Int(ServerInfo);
  Result := FServerVersion;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetServerStatus: Cardinal;
begin
  if Lib.CompatVersion >= mvMySQL060000 then
    Result := PMYSQL0600(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL050700 then
    Result := PMYSQL0570(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL050100 then
    Result := PMYSQL0510(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL050006 then
    Result := PMYSQL0506(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL050000 then
    Result := PMYSQL0500(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL041000 then
    Result := PMYSQL0410(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL040000 then
    Result := PMYSQL0400(FPMySQL)^.server_status
  else if Lib.CompatVersion >= mvMySQL032300 then
    Result := PMYSQL0323(FPMySQL)^.server_status
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.SetOptions(AOption: mysql_option; const AValue: PByte);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_options_, ['option', Integer(AOption), 'arg', NativeUInt(AValue)]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  FLib.mysql_options_(FPMySQL, AOption, AValue);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.GetServerOutput;
const
  C_CMD = 'SHOW WARNINGS';
var
  oRes: TMySQLResult;
  pLevel, pMsg, pCode: Pointer;
  iLen: LongWord;
  sCmd: TFDByteString;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_real_query, ['q', C_CMD]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  sCmd := Encoder.Encode(C_CMD);
  Check(FLib.mysql_real_query(FPMySQL, my_pchar(PByte(sCmd)), Encoder.EncodedLength(sCmd)));
  oRes := StoreResult;
  try
    while oRes.Fetch(0) do begin
      oRes.GetFieldData(0, pLevel, iLen);
      oRes.GetFieldData(1, pCode, iLen);
      oRes.GetFieldData(2, pMsg, iLen);
      SetInfo(my_pchar(pMsg), my_pchar(pLevel), StrToInt(Encoder.Decode(pCode, -1, ecANSI)));
    end;
  finally
    FDFree(oRes);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.QuerySB(const ACmd: TFDByteString; AInitiator: TObject = nil);
var
  iRes: Integer;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_real_query, ['q', Encoder.Decode(ACmd)]);
  end;
{$ENDIF}

begin
  ClearInfo;
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  iRes := FLib.mysql_real_query(FPMySQL, my_pchar(PByte(ACmd)),
    Encoder.EncodedLength(ACmd));
  Check(iRes, AInitiator);
  GetInfo;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.Query(const ACmd: String; AInitiator: TObject = nil);
begin
  QuerySB(FEncoder.Encode(ACmd));
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.StoreResult: TMySQLResult;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_store_result, []);
  end;
{$ENDIF}

var
  pRes: PMYSQL_RES;
begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  pRes := FLib.mysql_store_result(FPMySQL);
  Check;
  if pRes = nil then
    Result := nil
  else
    Result := TMySQLResult.Create(Self, pRes);
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.UseResult: TMySQLResult;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_use_result, []);
  end;
{$ENDIF}

var
  pRes: PMYSQL_RES;
begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  pRes := FLib.mysql_use_result(FPMySQL);
  Check;
  if pRes = nil then
    Result := nil
  else
    Result := TMySQLResult.Create(Self, pRes);
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.MoreResults: Boolean;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_more_results, []);
  end;
{$ENDIF}

begin
  ClearInfo;
  if not Assigned(FLib.mysql_more_results) then
    Result := False
  else begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    Result := FLib.mysql_more_results(FPMySQL) = 1;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.NextResult: Boolean;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_next_result, []);
  end;
{$ENDIF}

begin
  ClearInfo;
  if not Assigned(FLib.mysql_next_result) then
    Result := False
  else begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    case FLib.mysql_next_result(FPMySQL) of
    -1:   Result := False;
    0:    Result := True;
    else  Check; Result := False;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetDB: String;
var
  pDb: my_pchar;
begin
  Result := '';
  if Lib.CompatVersion >= mvMySQL060000 then
    pDb := PMYSQL0600(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL050700 then
    pDb := PMYSQL0570(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL050100 then
    pDb := PMYSQL0510(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL050006 then
    pDb := PMYSQL0506(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL050000 then
    pDb := PMYSQL0500(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL041000 then
    pDb := PMYSQL0410(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL040000 then
    pDb := PMYSQL0400(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL032300 then
    pDb := PMYSQL0323(FPMySQL)^.db
  else if Lib.CompatVersion >= mvMySQL032000 then
    pDb := PMYSQL0320(FPMySQL)^.db
  else
    pDb := nil;
  if pDb <> nil then
    Result := Encoder.Decode(pDb, -1, ecANSI);
  if Result = '' then
    Result := FCurrDB;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.SetDB(const AValue: String);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_select_db, ['db', AValue]);
  end;
{$ENDIF}

var
  sDb: TFDByteString;
begin
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
  sDb := Encoder.Encode(AValue, ecANSI);
  Check(FLib.mysql_select_db(FPMySQL, my_pchar(PByte(sDb))));
  FCurrDB := AValue;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetHostInfo: String;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_get_host_info, ['res', Result]);
  end;
{$ENDIF}

var
  pInfo: my_pchar;
begin
  pInfo := FLib.mysql_get_host_info(FPMySQL);
  Result := Encoder.Decode(pInfo, -1, ecANSI);
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetInsert_ID: my_ulonglong;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_insert_id, ['res', Result]);
  end;
{$ENDIF}

begin
  Result := FLib.mysql_insert_id(FPMySQL);
{$IFDEF FireDAC_MONITOR}
  if Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.GetCharacterSetInfo(var ACharset: MY_CHARSET_INFO);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_get_character_set_info, []);
  end;
{$ENDIF}

begin
  if Assigned(FLib.mysql_get_character_set_info) then begin
    FLib.mysql_get_character_set_info(FPMySQL, ACharset);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
  end
  else
    FillChar(ACharset, SizeOf(MY_CHARSET_INFO), 0);
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetCharacterSetName: String;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_character_set_name, ['res', Result]);
  end;
{$ENDIF}

begin
  if Assigned(FLib.mysql_character_set_name) and
     Assigned(FLib.mysql_set_character_set) then begin
    Result := Encoder.Decode(FLib.mysql_character_set_name(FPMySQL), -1, ecANSI);
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
  end
  else
    Result := FCharsetName;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLSession.SetCharacterSetName(const AValue: String);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Trace(smysql_set_character_set, ['cs_name', AValue]);
  end;
{$ENDIF}

var
  iRes: Integer;
  sName: TFDByteString;
begin
  iRes := -1;
  FUtf8mb4 := False;
  if Assigned(FLib.mysql_set_character_set) then begin
{$IFDEF FireDAC_MONITOR}
    if Tracing then Trace1;
{$ENDIF}
    sName := Encoder.Encode(AValue, ecANSI);
    iRes := FLib.mysql_set_character_set(FPMySQL, my_pchar(PByte(sName)));
  end;
  if iRes <> 0 then
    try
      if ServerVersion >= mvMySQL040100 then
        Query('SET NAMES ''' + AValue + '''')
      else
        Query('SET CHARACTER SET ' + AValue);
      iRes := 0;
    except
      // hide exception
    end;
  if iRes = 0 then begin
    FCharsetName := AValue;
    if (Length(AValue) >= 4) and (StrLIComp(PChar(AValue), PChar('UTF8'), 4) = 0) then begin
      FEncoder.Encoding := ecUTF8;
      FUtf8mb4 := StrLIComp(PChar(AValue), PChar('UTF8MB4'), 7) = 0;
    end
    else
      FEncoder.Encoding := ecANSI;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLSession.GetHasMoreResults: Boolean;
begin
  Result := (ServerStatus and (SERVER_MORE_RESULTS_EXISTS or SERVER_PS_OUT_PARAMS)) <> 0;
end;

{-------------------------------------------------------------------------------}
{ TMySQLField                                                                   }
{-------------------------------------------------------------------------------}
constructor TMySQLField.Create(AResult: TMySQLResult);
begin
  inherited Create;
  FResult := AResult;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLField.GetInfo(var name, srcname, table, db: my_pchar;
  var type_: Byte; var length, flags, decimals, charsetnr: LongWord;
  AMaxLenValid: Boolean);
var
  iVer: TFDVersion;
  pFld0510: PMYSQL_FIELD0510;
  pFld0410: PMYSQL_FIELD0410;
  pFld0401: PMYSQL_FIELD0401;
  pFld0400: PMYSQL_FIELD0400;
  pFld0320: PMYSQL_FIELD0320;
begin
  iVer := FResult.FSession.Lib.CompatVersion;
  if iVer >= mvMySQL050100 then begin
    pFld0510 := PMYSQL_FIELD0510(FpFld);
    name := pFld0510^.name;
    srcname := pFld0510^.org_name;
    table := pFld0510^.org_table;
    db := pFld0510^.db;
    type_ := pFld0510^.type_;
    length := pFld0510^.length;
    if AMaxLenValid and (pFld0510^.max_length > length) then
      length := pFld0510^.max_length;
    flags := pFld0510^.flags;
    decimals := pFld0510^.decimals;
    charsetnr := pFld0510^.charsetnr;
  end
  else if iVer >= mvMySQL040101 then begin
    pFld0410 := PMYSQL_FIELD0410(FpFld);
    name := pFld0410^.name;
    srcname := pFld0410^.org_name;
    table := pFld0410^.org_table;
    db := pFld0410^.db;
    type_ := pFld0410^.type_;
    length := pFld0410^.length;
    if AMaxLenValid and (pFld0410^.max_length > length) then
      length := pFld0410^.max_length;
    flags := pFld0410^.flags;
    decimals := pFld0410^.decimals;
    charsetnr := pFld0410^.charsetnr;
  end
  else if iVer >= mvMySQL040100 then begin
    pFld0401 := PMYSQL_FIELD0401(FpFld);
    name := pFld0401^.name;
    srcname := pFld0401^.org_name;
    table := pFld0401^.org_table;
    db := pFld0401^.db;
    type_ := pFld0401^.type_;
    length := pFld0401^.length;
    if AMaxLenValid and (pFld0401^.max_length > length) then
      length := pFld0401^.max_length;
    flags := pFld0401^.flags;
    decimals := pFld0401^.decimals;
    charsetnr := pFld0401^.charsetnr;
  end
  else if iVer >= mvMySQL040000 then begin
    pFld0400 := PMYSQL_FIELD0400(FpFld);
    name := pFld0400^.name;
    srcname := name;
    table := pFld0400^.org_table;
    db := pFld0400^.db;
    type_ := pFld0400^.type_;
    length := pFld0400^.length;
    if AMaxLenValid and (pFld0400^.max_length > length) then
      length := pFld0400^.max_length;
    flags := pFld0400^.flags;
    decimals := pFld0400^.decimals;
    charsetnr := 0;
  end
  else begin
    pFld0320 := PMYSQL_FIELD0320(FpFld);
    name := pFld0320^.name;
    srcname := name;
    table := pFld0320^.table;
    db := nil;
    type_ := pFld0320^.type_;
    length := pFld0320^.length;
    if AMaxLenValid and (pFld0320^.max_length > length) then
      length := pFld0320^.max_length;
    flags := pFld0320^.flags;
    decimals := pFld0320^.decimals;
    charsetnr := 0;
  end;
end;

{-------------------------------------------------------------------------------}
{ TMySQLResult                                                                  }
{-------------------------------------------------------------------------------}
constructor TMySQLResult.Create(ASession: TMySQLSession; AResult: PMYSQL_RES);
begin
  inherited Create;
  FSession := ASession;
  FCursor := AResult;
end;

{-------------------------------------------------------------------------------}
destructor TMySQLResult.Destroy;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FSession.Trace(smysql_free_result, ['res', FCursor]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if FSession.Tracing then Trace1;
{$ENDIF}
  FSession.FLib.mysql_free_result(FCursor);
  FCursor := nil;
  FDFreeAndNil(FField);
  FSession.Buffer.Release;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TMySQLResult.GetFieldCount: Cardinal;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FSession.Trace(smysql_num_fields, ['res', FCursor]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if FSession.Tracing then Trace1;
{$ENDIF}
  Result := FSession.FLib.mysql_num_fields(FCursor);
end;

{-------------------------------------------------------------------------------}
function TMySQLResult.GetFields(AIndex: Integer): TMySQLField;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FSession.Trace(smysql_fetch_field_direct, ['res', FCursor, 'fieldnr', AIndex]);
  end;
{$ENDIF}

begin
  if FField = nil then
    FField := TMySQLField.Create(Self);
{$IFDEF FireDAC_MONITOR}
  if FSession.Tracing then Trace1;
{$ENDIF}
  FField.FpFld := FSession.FLib.mysql_fetch_field_direct(FCursor, AIndex);
  Result := FField;
end;

{-------------------------------------------------------------------------------}
function TMySQLResult.Fetch(ARowIndex: Integer): Boolean;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FSession.Trace(smysql_fetch_row, ['res', FCursor]);
  end;

  procedure Trace2;
  begin
    FSession.Trace(smysql_fetch_lengths, ['res', FCursor]);
  end;

  procedure Trace3;
  begin
    FSession.Trace(ekCmdDataOut, esProgress, 'EOF', []);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if FSession.Tracing then Trace1;
{$ENDIF}
  FpRow := FSession.FLib.mysql_fetch_row(FCursor);
  Result := (FpRow <> nil);
  if Result then begin
{$IFDEF FireDAC_MONITOR}
    if FSession.Tracing then Trace2;
{$ENDIF}
    FpLengths := FSession.FLib.mysql_fetch_lengths(FCursor);
    if FpLengths = nil then
      FSession.Check;
{$IFDEF FireDAC_MONITOR}
    if FSession.Tracing then DumpColumns(ARowIndex);
{$ENDIF}
  end
  else begin
    FSession.Check;
{$IFDEF FireDAC_MONITOR}
    if FSession.Tracing then Trace3;
{$ENDIF}
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLResult.GetFieldData(AIndex: Integer; out ApData: Pointer;
  out ALen: LongWord): Boolean;
begin
  ALen := Pmy_ulong(NativeUInt(FpLengths) + NativeUInt(AIndex) * SizeOf(my_ulong))^;
  ApData := PPByte(NativeUInt(FpRow) + NativeUInt(AIndex) * SizeOf(PByte))^;
  Result := ApData <> nil;
end;

{-------------------------------------------------------------------------------}
function TMySQLResult.GetData(AIndex: Integer; var ApData: Pointer; out ALen: LongWord;
  AType: TFDDataType; AAttrs: TFDDataAttributes): Boolean;

  procedure FieldDataTypeUnsupError;
  begin
    FDException(Self, [S_FD_LPhys, FSession.FLib.DriverID],
      er_FD_MySQLFieldDataTypeUnsup, [IntToStr(AIndex)]);
  end;

var
  pSrcData: Pointer;
  iSrcLen: LongWord;
  iSz: Integer;
  aBuff: array [0..65] of Char;
  pBuff: PChar;
  dt: Comp;
begin
  Result := GetFieldData(AIndex, pSrcData, iSrcLen);
  if not Result then begin
    ApData := nil;
    ALen := 0;
    Exit;
  end;

  ALen := 0;
  if not (AType in [dtAnsiString, dtMemo, dtWideString, dtWideMemo, dtByteString, dtBlob]) then begin
    pBuff := aBuff;
    iSz := FSession.Encoder.Decode(pSrcData, iSrcLen, Pointer(pBuff));
  end
  else begin
    iSz := 0;
    pBuff := nil;
  end;

  case AType of
  dtBoolean:
    begin
      PWordBool(ApData)^ := (pBuff^ <> '0') and (pBuff^ <> #0);
      ALen := SizeOf(WordBool);
    end;
  dtSByte:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(ShortInt), False);
      ALen := SizeOf(ShortInt);
    end;
  dtInt16:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(SmallInt), False);
      ALen := SizeOf(SmallInt);
    end;
  dtInt32:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(Integer), False);
      ALen := SizeOf(Integer);
    end;
  dtInt64:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(Int64), False);
      ALen := SizeOf(Int64);
    end;
  dtByte:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(Byte), True);
      ALen := SizeOf(Byte);
    end;
  dtUInt16:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(Word), True);
      ALen := SizeOf(Word);
    end;
  dtUInt32:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(Cardinal), True);
      ALen := SizeOf(Cardinal);
    end;
  dtUInt64:
    begin
      FDStr2Int(pBuff, iSz, ApData, SizeOf(UInt64), True);
      ALen := SizeOf(UInt64);
    end;
  dtSingle:
    begin
      FDStr2Float(pBuff, iSz, ApData, SizeOf(Single), '.');
      ALen := SizeOf(Single);
    end;
  dtDouble:
    begin
      FDStr2Float(pBuff, iSz, ApData, SizeOf(Double), '.');
      ALen := SizeOf(Double);
    end;
  dtExtended:
    begin
      FDStr2Float(pBuff, iSz, ApData, SizeOf(Extended), '.');
      ALen := SizeOf(Extended);
    end;
  dtCurrency:
    begin
      FDStr2Curr(pBuff, iSz, PCurrency(ApData)^, '.');
      ALen := SizeOf(Currency);
    end;
  dtBCD,
  dtFmtBCD:
    begin
      FDStr2BCD(pBuff, iSz, PBcd(ApData)^, '.');
      ALen := SizeOf(TBcd);
    end;
  dtDate:
    begin
      PInteger(ApData)^ := FDISOStr2Date(pBuff, iSz);
      if PInteger(ApData)^ = 0 then
        Result := False;
      ALen := SizeOf(Integer);
    end;
  dtTime:
    begin
      PInteger(ApData)^ := FDISOStr2Time(pBuff, iSz {15});
      ALen := SizeOf(Integer);
    end;
  dtDateTime:
    begin
      Result := FDISOStr2DateTime(pBuff, iSz {26}, dt);
      PDateTimeRec(ApData)^.DateTime := dt;
      ALen := SizeOf(TDateTime);
    end;
  dtDateTimeStamp:
    begin
      Result := FDISOStr2TimeStamp(pBuff, iSz {26}, PSQLTimeStamp(ApData)^);
      ALen := SizeOf(TSQLTimeStamp);
    end;
  dtAnsiString,
  dtMemo:
    begin
      ApData := pSrcData;
      ALen := iSrcLen;
      if (caFixedLen in AAttrs) and FStrsTrim then
        while (ALen > 0) and (PFDAnsiString(ApData)[ALen - 1] = TFDAnsiChar(' ')) do
          Dec(ALen);
      if (ALen = 0) and FStrsEmpty2Null then
        Result := False;
    end;
  dtWideString,
  dtWideMemo:
    begin
      ALen := FSession.Encoder.Decode(pSrcData, iSrcLen, ApData, ecUTF16);
      if (caFixedLen in AAttrs) and FStrsTrim then
        while (ALen > 0) and (PWideChar(ApData)[ALen - 1] = ' ') do
          Dec(ALen);
      if (ALen = 0) and FStrsEmpty2Null then
        Result := False;
    end;
  dtByteString,
  dtBlob:
    begin
      ApData := pSrcData;
      ALen := iSrcLen;
      if (caFixedLen in AAttrs) and FStrsTrim then
        while (ALen > 0) and (PByte(ApData)[ALen - 1] = 0) do
          Dec(ALen);
      if (ALen = 0) and FStrsEmpty2Null then
        Result := False;
    end;
  else
    Result := False;
    FieldDataTypeUnsupError;
  end;
end;

{$IFDEF FireDAC_MONITOR}
{-------------------------------------------------------------------------------}
procedure TMySQLResult.DumpColumns(ARowIndex: Integer);
var
  i: Integer;
  pData: Pointer;
  iLen: LongWord;
  s: String;
begin
  if FSession.Tracing then begin
    FSession.Trace(ekCmdDataOut, esStart, 'Fetched', ['Row', ARowIndex]);
    for i := 0 to FSession.FLib.mysql_num_fields(FCursor) - 1 do begin
      pData := nil;
      iLen := 0;
      if not GetFieldData(i, pData, iLen) then
        s := 'NULL'
      else if iLen > 1024 then
        s := '(truncated at 1024) ''' + FSession.Encoder.Decode(pData, 1024) + ' ...'''
      else
        s := '''' + FSession.Encoder.Decode(pData, iLen) + '''';
      FSession.Trace(ekCmdDataOut, esProgress, 'Column', [String('N'), i,
        'Len', iLen, '@Data', s]);
    end;
    FSession.Trace(ekCmdDataOut, esEnd, 'Fetched', ['Row', ARowIndex]);
  end;
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
{ TMySQLVariable                                                                }
{-------------------------------------------------------------------------------}
constructor TMySQLVariable.Create(AVars: TMySQLVariables);
begin
  inherited Create;
  FVars := AVars;
  FIndex := AVars.FList.Add(Self);
  FVer := FVars.Statement.Session.Lib.CompatVersion;
end;

{-------------------------------------------------------------------------------}
destructor TMySQLVariable.Destroy;
begin
  FVars.FList.RemoveItem(Self, FromEnd);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.Assign(AVar: TMySQLVariable);
begin
  DataType := AVar.DataType;
  DataSize := AVar.DataSize;
  Unsigned := AVar.Unsigned;
  FDDataType := AVar.FDDataType;
  FixedLen := AVar.FixedLen;
  DumpLabel := AVar.DumpLabel;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetBind: PMYSQL_BIND;
begin
  Result := PMYSQL_BIND(PByte(FVars.FBinds) + FIndex * FVars.FBindSize);
end;

{-------------------------------------------------------------------------------}
class function TMySQLVariable.GetDataTypeSize(AType: enum_field_types;
  ASize: my_ulong): my_ulong;
begin
  case AType of
  MYSQL_TYPE_TINY:          Result := SizeOf(ShortInt);
  MYSQL_TYPE_SHORT,
  MYSQL_TYPE_YEAR:          Result := SizeOf(SmallInt);
  MYSQL_TYPE_LONG,
  MYSQL_TYPE_INT24:         Result := SizeOf(Integer);
  MYSQL_TYPE_LONGLONG:      Result := SizeOf(Int64);
  MYSQL_TYPE_FLOAT:         Result := SizeOf(Single);
  MYSQL_TYPE_DOUBLE:        Result := SizeOf(Double);
  MYSQL_TYPE_TIME,
  MYSQL_TYPE_DATE,
  MYSQL_TYPE_NEWDATE,
  MYSQL_TYPE_DATETIME,
  MYSQL_TYPE_TIMESTAMP:     Result := SizeOf(MYSQL_TIME0506);
  MYSQL_TYPE_TINY_BLOB,
  MYSQL_TYPE_MEDIUM_BLOB,
  MYSQL_TYPE_LONG_BLOB,
  MYSQL_TYPE_BLOB,
  MYSQL_TYPE_BIT,
  MYSQL_TYPE_VAR_STRING,
  MYSQL_TYPE_STRING,
  MYSQL_TYPE_VARCHAR,
  MYSQL_TYPE_ENUM,
  MYSQL_TYPE_SET,
  MYSQL_TYPE_GEOMETRY,
  MYSQL_TYPE_JSON:          Result := ASize;
  MYSQL_TYPE_NULL:          Result := 0;
  MYSQL_TYPE_DECIMAL,
  MYSQL_TYPE_NEWDECIMAL:    Result := C_FD_MaxFixedSize div SizeOf(Char);
  else                      begin Result := 0; ASSERT(False); end;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetBindSize: LongWord;
begin
  Result := (C_VarExtraSize + GetDataTypeSize(DataType, DataSize) +
    C_VarAlignment) and not C_VarAlignment;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetDataType: enum_field_types;
begin
  if FVer >= mvMySQL050100 then
    Result := PMYSQL_BIND0510(Bind)^.buffer_type
  else if FVer >= mvMySQL050006 then
    Result := PMYSQL_BIND0506(Bind)^.buffer_type
  else if FVer >= mvMySQL041100 then
    Result := PMYSQL_BIND0411(Bind)^.buffer_type
  else if FVer >= mvMySQL041000 then
    Result := PMYSQL_BIND0410(Bind)^.buffer_type
  else begin
    Result := 0;
    ASSERT(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.SetDataType(const AValue: enum_field_types);
begin
  if FVer >= mvMySQL050100 then
    PMYSQL_BIND0510(Bind)^.buffer_type := AValue
  else if FVer >= mvMySQL050006 then
    PMYSQL_BIND0506(Bind)^.buffer_type := AValue
  else if FVer >= mvMySQL041100 then
    PMYSQL_BIND0411(Bind)^.buffer_type := AValue
  else if FVer >= mvMySQL041000 then
    PMYSQL_BIND0410(Bind)^.buffer_type := AValue
  else
    ASSERT(False);
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetDataSize: my_ulong;
begin
  if FVer >= mvMySQL050100 then
    Result := PMYSQL_BIND0510(Bind)^.buffer_length
  else if FVer >= mvMySQL050006 then
    Result := PMYSQL_BIND0506(Bind)^.buffer_length
  else if FVer >= mvMySQL041100 then
    Result := PMYSQL_BIND0411(Bind)^.buffer_length
  else if FVer >= mvMySQL041000 then
    Result := PMYSQL_BIND0410(Bind)^.buffer_length
  else begin
    Result := 0;
    ASSERT(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.SetDataSize(const AValue: my_ulong);
begin
  if FVer >= mvMySQL050100 then
    PMYSQL_BIND0510(Bind)^.buffer_length := AValue
  else if FVer >= mvMySQL050006 then
    PMYSQL_BIND0506(Bind)^.buffer_length := AValue
  else if FVer >= mvMySQL041100 then
    PMYSQL_BIND0411(Bind)^.buffer_length := AValue
  else if FVer >= mvMySQL041000 then
    PMYSQL_BIND0410(Bind)^.buffer_length := AValue
  else
    ASSERT(False);
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetUnsigned: Boolean;
begin
  if FVer >= mvMySQL050100 then
    Result := PMYSQL_BIND0510(Bind)^.is_unsigned = 1
  else if FVer >= mvMySQL050006 then
    Result := PMYSQL_BIND0506(Bind)^.is_unsigned = 1
  else if FVer >= mvMySQL041100 then
    Result := PMYSQL_BIND0411(Bind)^.is_unsigned = 1
  else if FVer >= mvMySQL041000 then
    Result := False
  else begin
    Result := False;
    ASSERT(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.SetUnsigned(const AValue: Boolean);
begin
  if FVer >= mvMySQL050100 then
    PMYSQL_BIND0510(Bind)^.is_unsigned := my_bool(AValue)
  else if FVer >= mvMySQL050006 then
    PMYSQL_BIND0506(Bind)^.is_unsigned := my_bool(AValue)
  else if FVer >= mvMySQL041100 then
    PMYSQL_BIND0411(Bind)^.is_unsigned := my_bool(AValue)
  else if FVer >= mvMySQL041000 then
    // nothing
  else
    ASSERT(False);
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetLongData: Boolean;
begin
  Result :=
    (DataType in [MYSQL_TYPE_TINY_BLOB, MYSQL_TYPE_MEDIUM_BLOB,
                  MYSQL_TYPE_LONG_BLOB, MYSQL_TYPE_BLOB, MYSQL_TYPE_VAR_STRING,
                  MYSQL_TYPE_JSON]) and
    ((DataSize = 0) or (DataSize > FVars.Statement.MaxStringSize));
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.SetBuffer(ABuff: PByte; ALength: my_ulong);
begin
  if not LongData then
    Exit;
  if FVer >= mvMySQL050100 then begin
    PMYSQL_BIND0510(Bind)^.buffer := ABuff;
    PMYSQL_BIND0510(Bind)^.buffer_length := ALength;
  end
  else if FVer >= mvMySQL050006 then begin
    PMYSQL_BIND0506(Bind)^.buffer := ABuff;
    PMYSQL_BIND0506(Bind)^.buffer_length := ALength;
  end
  else if FVer >= mvMySQL041100 then begin
    PMYSQL_BIND0411(Bind)^.buffer := ABuff;
    PMYSQL_BIND0411(Bind)^.buffer_length := ALength;
  end
  else begin
    PMYSQL_BIND0410(Bind)^.buffer := ABuff;
    PMYSQL_BIND0410(Bind)^.buffer_length := ALength;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.ResetBlob;
begin
  SetBuffer(nil, 0);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.GetInfo(var ApData: Pointer; var ApLen: Pmy_ulong;
  var ApNull: Pmy_bool; var ApError: Pmy_bool);
var
  pBind: PMYSQL_BIND;
begin
  pBind := Bind;
  if FVer >= mvMySQL050100 then begin
    ApData := PMYSQL_BIND0510(pBind)^.buffer;
    ApLen := PMYSQL_BIND0510(pBind)^.length;
    ApNull := PMYSQL_BIND0510(pBind)^.is_null;
    ApError := PMYSQL_BIND0510(pBind)^.error;
  end
  else if FVer >= mvMySQL050006 then begin
    ApData := PMYSQL_BIND0506(pBind)^.buffer;
    ApLen := PMYSQL_BIND0506(pBind)^.length;
    ApNull := PMYSQL_BIND0506(pBind)^.is_null;
    ApError := PMYSQL_BIND0506(pBind)^.error;
  end
  else if FVer >= mvMySQL041100 then begin
    ApData := PMYSQL_BIND0411(pBind)^.buffer;
    ApLen := PMYSQL_BIND0411(pBind)^.length;
    ApNull := PMYSQL_BIND0411(pBind)^.is_null;
    ApError := nil;
  end
  else begin
    ApData := PMYSQL_BIND0410(pBind)^.buffer;
    ApLen := Pmy_ulong(PMYSQL_BIND0410(pBind)^.length);
    ApNull := PMYSQL_BIND0410(pBind)^.is_null;
    ApError := nil;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetData(var ApData: Pointer; out ALen: LongWord;
  AByRef: Boolean): Boolean;
const
  C_IntLens: array [dtSByte .. dtUInt64] of Integer = (
    SizeOf(ShortInt), SizeOf(SmallInt), SizeOf(Integer), SizeOf(Int64),
    SizeOf(Byte), SizeOf(Word), SizeOf(Cardinal), SizeOf(UInt64));
var
  pData, pWC: Pointer;
  pLen: Pmy_ulong;
  pNull, pError: Pmy_bool;
  rTS: TSQLTimeStamp;
  iLen: Integer;

  procedure GetTS;
  begin
    rTS.Year := PMYSQL_TIME0506(pData)^.year;
    rTS.Month := PMYSQL_TIME0506(pData)^.month;
    rTS.Day := PMYSQL_TIME0506(pData)^.day;
    rTS.Hour := PMYSQL_TIME0506(pData)^.hour;
    rTS.Minute := PMYSQL_TIME0506(pData)^.minute;
    rTS.Second := PMYSQL_TIME0506(pData)^.second;
    rTS.Fractions := PMYSQL_TIME0506(pData)^.second_part div 1000;
  end;

begin
  FVars.CheckBuff;
  GetInfo(pData, pLen, pNull, pError);
  ALen := pLen^;

  Result := not ((DataType = MYSQL_TYPE_NULL) or (pNull^ = 1));
  if not Result then begin
    ApData := nil;
    ALen := 0;
    Exit;
  end;

  case DataType of
  MYSQL_TYPE_TINY:
    begin
      if AByRef then
        ApData := pData
      else if Unsigned then
        PByte(ApData)^ := PByte(pData)^
      else
        PShortInt(ApData)^ := PShortInt(pData)^;
      ALen := SizeOf(ShortInt);
    end;
  MYSQL_TYPE_SHORT,
  MYSQL_TYPE_YEAR:
    begin
      if AByRef then
        ApData := pData
      else if Unsigned then
        PWord(ApData)^ := PWord(pData)^
      else
        PSmallInt(ApData)^ := PSmallInt(pData)^;
      ALen := SizeOf(SmallInt);
    end;
  MYSQL_TYPE_LONG,
  MYSQL_TYPE_INT24:
    begin
      if AByRef then
        ApData := pData
      else if Unsigned then
        PCardinal(ApData)^ := PCardinal(pData)^
      else
        PInteger(ApData)^ := PInteger(pData)^;
      ALen := SizeOf(Integer);
    end;
  MYSQL_TYPE_LONGLONG:
    begin
      if AByRef then
        ApData := pData
      else if Unsigned then
        PUInt64(ApData)^ := PUInt64(pData)^
      else
        PInt64(ApData)^ := PInt64(pData)^;
      ALen := SizeOf(Int64);
    end;
  MYSQL_TYPE_FLOAT:
    if AByRef then
      ApData := pData
    else begin
      PSingle(ApData)^ := PSingle(pData)^;
      ALen := SizeOf(Single);
    end;
  MYSQL_TYPE_DOUBLE:
    if AByRef then
      ApData := pData
    else begin
      PDouble(ApData)^ := PDouble(pData)^;
      ALen := SizeOf(Double);
    end;
  MYSQL_TYPE_TIME:
    if AByRef then
      ApData := pData
    else begin
      GetTS;
      PInteger(ApData)^ := FDSQLTimeStamp2Time(rTS);
      if PMYSQL_TIME0506(pData)^.neg = 1 then
        PInteger(ApData)^ := - PInteger(ApData)^;
      ALen := SizeOf(Integer);
    end;
  MYSQL_TYPE_DATE,
  MYSQL_TYPE_NEWDATE:
    if AByRef then
      ApData := pData
    else begin
      GetTS;
      PInteger(ApData)^ := FDSQLTimeStamp2Date(rTS);
      if PMYSQL_TIME0506(pData)^.neg = 1 then
        PInteger(ApData)^ := - PInteger(ApData)^;
      ALen := SizeOf(Integer);
    end;
  MYSQL_TYPE_DATETIME:
    if PMYSQL_TIME0506(pData)^.year = 0 then
      Result := False
    else if AByRef then
      ApData := pData
    else begin
      GetTS;
      PDateTimeRec(ApData)^.DateTime := FDDateTime2MSecs(EncodeDateTime(
        rTS.Year, rTS.Month, rTS.Day, rTS.Hour, rTS.Minute, rTS.Second, rTS.Fractions));
      ALen := SizeOf(TDateTime);
    end;
  MYSQL_TYPE_TIMESTAMP:
    if AByRef then
      ApData := pData
    else begin
      GetTS;
      PSQLTimeStamp(ApData)^ := rTS;
      ALen := SizeOf(TSQLTimeStamp);
    end;
  MYSQL_TYPE_TINY_BLOB,
  MYSQL_TYPE_MEDIUM_BLOB,
  MYSQL_TYPE_LONG_BLOB,
  MYSQL_TYPE_BLOB,
  MYSQL_TYPE_BIT:
    if (DataType = MYSQL_TYPE_BIT) and (FDDataType = dtBoolean) then
      if AByRef then
        ApData := pData
      else begin
        PWordBool(ApData)^ := (PByte(pData)^ <> Ord('0')) and (PByte(pData)^ <> 0);
        ALen := SizeOf(WordBool);
      end
    else begin
      if (pData <> nil) and FVars.Statement.StrsTrim and (FDDataType <> dtGUID) and FixedLen then
        while (ALen > 0) and (PByte(pData)[ALen - 1] = 0) do
          Dec(ALen);
      if (ALen = 0) and FVars.Statement.StrsEmpty2Null then begin
        Result := False;
        ALen := 0;
        if AByRef then
          ApData := nil;
      end
      else if AByRef then
        ApData := pData
      else if ApData <> nil then
        Move(PByte(pData)^, PByte(ApData)^, ALen * SizeOf(Byte));
    end;
  MYSQL_TYPE_VAR_STRING,
  MYSQL_TYPE_STRING,
  MYSQL_TYPE_VARCHAR,
  MYSQL_TYPE_ENUM,
  MYSQL_TYPE_SET,
  MYSQL_TYPE_GEOMETRY,
  MYSQL_TYPE_JSON:
    if FVars.Statement.Session.Encoder.Encoding = ecUTF8 then begin
      if pData <> nil then begin
        pWC := nil;
        ALen := FVars.Statement.Session.Encoder.Decode(pData, ALen, pWC, ecUTF16);
        pData := pWC;
        if ((DataType = MYSQL_TYPE_STRING) or FixedLen) and FVars.Statement.StrsTrim then
          while (ALen > 0) and (PWideChar(pData)[ALen - 1] = ' ') do
            Dec(ALen);
      end;
      if (ALen = 0) and FVars.Statement.StrsEmpty2Null then begin
        Result := False;
        ALen := 0;
        if AByRef then
          ApData := nil;
      end
      else if AByRef then
        ApData := pData
      else if ApData <> nil then
        Move(PWideChar(pData)^, PWideChar(ApData)^, ALen * SizeOf(WideChar));
    end
    else begin
      if (pData <> nil) and ((DataType = MYSQL_TYPE_STRING) or FixedLen) and FVars.Statement.StrsTrim then
        while (ALen > 0) and (PFDAnsiString(pData)[ALen - 1] = TFDAnsiChar(' ')) do
          Dec(ALen);
      if (ALen = 0) and FVars.Statement.StrsEmpty2Null then begin
        Result := False;
        ALen := 0;
        if AByRef then
          ApData := nil;
      end
      else if AByRef then
        ApData := pData
      else if ApData <> nil then
        Move(PFDAnsiString(pData)^, PFDAnsiString(ApData)^, ALen * SizeOf(TFDAnsiChar));
    end;
  MYSQL_TYPE_DECIMAL,
  MYSQL_TYPE_NEWDECIMAL:
    if AByRef then
      ApData := pData
    else begin
      pWC := nil;
      iLen := FVars.Statement.Session.Encoder.Decode(pData, ALen, pWC, ecUTF16);
      case FDDataType of
      dtUnknown,
      dtBCD, dtFmtBCD:
        begin
          FDStr2BCD(pWC, iLen, PBcd(ApData)^, '.');
          ALen := SizeOf(TBcd);
        end;
      dtSByte, dtInt16, dtInt32, dtInt64,
      dtByte, dtUInt16, dtUInt32, dtUInt64:
        begin
          ALen := C_IntLens[FDDataType];
          FDStr2Int(pWC, iLen, ApData, ALen, FDDataType in [dtByte, dtUInt16, dtUInt32, dtUInt64]);
        end;
      else
        ASSERT(False);
      end;
    end;
  MYSQL_TYPE_NULL:
    ;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariable.SetData(ApData: Pointer; ALen: LongWord);
var
  pData, pWC, pCh: Pointer;
  pLen: Pmy_ulong;
  pNull, pError: Pmy_bool;
  lIsNull: Boolean;
  rTS: TSQLTimeStamp;
  pUTF8: Pointer;
  iCharLen, iMaxChars: LongWord;
  iLen: Integer;
  aBuff: array [0..64] of Char;

  procedure ErrorDataTooLarge(AMax, AActual: LongWord);
  begin
    FDException(FVars.Statement.OwningObj, [S_FD_LPhys, FVars.Statement.Session.Lib.DriverID],
      er_FD_AccDataToLarge, [DumpLabel, AMax, AActual]);
  end;

  procedure SetTS(ANeg: Boolean; AType: enum_mysql_timestamp_type);
  begin
    FillChar(PMYSQL_TIME0506(pData)^, SizeOf(MYSQL_TIME0506), 0);
    if AType in [MYSQL_TIMESTAMP_DATE, MYSQL_TIMESTAMP_DATETIME] then begin
      PMYSQL_TIME0506(pData)^.year := rTS.Year;
      PMYSQL_TIME0506(pData)^.month := rTS.Month;
      PMYSQL_TIME0506(pData)^.day := rTS.Day;
    end;
    if AType in [MYSQL_TIMESTAMP_TIME, MYSQL_TIMESTAMP_DATETIME] then begin
      PMYSQL_TIME0506(pData)^.hour := rTS.Hour;
      PMYSQL_TIME0506(pData)^.minute := rTS.Minute;
      PMYSQL_TIME0506(pData)^.second := rTS.Second;
      PMYSQL_TIME0506(pData)^.second_part := rTS.Fractions * 1000;
    end;
    if ANeg then
      PMYSQL_TIME0506(pData)^.neg := 1;
    PMYSQL_TIME0506(pData)^.time_type := AType;
  end;

begin
  FVars.CheckBuff;
  GetInfo(pData, pLen, pNull, pError);

  lIsNull := ApData = nil;
  case DataType of
  MYSQL_TYPE_TINY:
    begin
      if lIsNull then
        PByte(pData)^ := 0
      else if Unsigned then
        PByte(pData)^ := PByte(ApData)^
      else
        PShortInt(pData)^ := PShortInt(ApData)^;
      pLen^ := SizeOf(ShortInt);
    end;
  MYSQL_TYPE_SHORT,
  MYSQL_TYPE_YEAR:
    begin
      if lIsNull then
        PWord(pData)^ := 0
      else if Unsigned then
        PWord(pData)^ := PWord(ApData)^
      else
        PSmallInt(pData)^ := PSmallInt(ApData)^;
      pLen^ := SizeOf(SmallInt);
    end;
  MYSQL_TYPE_LONG,
  MYSQL_TYPE_INT24:
    begin
      if lIsNull then
        PCardinal(pData)^ := 0
      else if Unsigned then
        PCardinal(pData)^ := PCardinal(ApData)^
      else
        PInteger(pData)^ := PInteger(ApData)^;
      pLen^ := SizeOf(Integer);
    end;
  MYSQL_TYPE_LONGLONG:
    begin
      if lIsNull then
        PUInt64(pData)^ := 0
      else if Unsigned then
        PUInt64(pData)^ := PUInt64(ApData)^
      else
        PInt64(pData)^ := PInt64(ApData)^;
      pLen^ := SizeOf(Int64);
    end;
  MYSQL_TYPE_FLOAT:
    begin
      if lIsNull then
        PSingle(pData)^ := 0.0
      else
        PSingle(pData)^ := PSingle(ApData)^;
      pLen^ := SizeOf(Single);
    end;
  MYSQL_TYPE_DOUBLE:
    begin
      if lIsNull then
        PDouble(pData)^ := 0.0
      else
        PDouble(pData)^ := PDouble(ApData)^;
      pLen^ := SizeOf(Double);
    end;
  MYSQL_TYPE_TIME:
    begin
      if lIsNull then
        FillChar(PMYSQL_TIME0506(pData)^, SizeOf(MYSQL_TIME0506), 0)
      else begin
        rTS := FDTime2SQLTimeStamp(Abs(PInteger(ApData)^));
        SetTS(PInteger(ApData)^ < 0, MYSQL_TIMESTAMP_TIME);
      end;
      pLen^ := SizeOf(MYSQL_TIME0506);
    end;
  MYSQL_TYPE_DATE,
  MYSQL_TYPE_NEWDATE:
    begin
      if lIsNull then
        FillChar(PMYSQL_TIME0506(pData)^, SizeOf(MYSQL_TIME0506), 0)
      else begin
        rTS := FDDate2SQLTimeStamp(Abs(PInteger(ApData)^));
        SetTS(PInteger(ApData)^ < 0, MYSQL_TIMESTAMP_DATE);
      end;
      pLen^ := SizeOf(MYSQL_TIME0506);
    end;
  MYSQL_TYPE_DATETIME:
    begin
      if lIsNull then
        FillChar(PMYSQL_TIME0506(pData)^, SizeOf(MYSQL_TIME0506), 0)
      else begin
        rTS := DateTimeToSQLTimeStamp(FDMSecs2DateTime(Abs(PDateTimeRec(ApData)^.DateTime)));
        SetTS(PDateTimeRec(ApData)^.DateTime < 0, MYSQL_TIMESTAMP_DATETIME);
      end;
      pLen^ := SizeOf(MYSQL_TIME0506);
    end;
  MYSQL_TYPE_TIMESTAMP:
    begin
      if lIsNull then
        FillChar(PMYSQL_TIME0506(pData)^, SizeOf(MYSQL_TIME0506), 0)
      else begin
        rTS := PSQLTimeStamp(ApData)^;
        SetTS(False, MYSQL_TIMESTAMP_DATETIME);
      end;
      pLen^ := SizeOf(MYSQL_TIME0506);
    end;
  MYSQL_TYPE_TINY_BLOB,
  MYSQL_TYPE_MEDIUM_BLOB,
  MYSQL_TYPE_LONG_BLOB,
  MYSQL_TYPE_BLOB,
  MYSQL_TYPE_BIT:
    begin
      if not lIsNull then begin
        if FVars.Statement.StrsTrim and (FDDataType <> dtGUID) and FixedLen then
          while (ALen > 0) and (PByte(ApData)[ALen - 1] = 0) do
            Dec(ALen);
        if FVars.Statement.StrsEmpty2Null and (ALen = 0) then
          lIsNull := True;
      end;
      if not lIsNull then begin
        if ALen > DataSize then
          if FVars.Statement.StrsTrim2Len then
            ALen := DataSize
          else
            ErrorDataTooLarge(DataSize, ALen);
        Move(PByte(ApData)^, PByte(pData)^, ALen * SizeOf(Byte));
      end;
      pLen^ := ALen;
    end;
  MYSQL_TYPE_VAR_STRING,
  MYSQL_TYPE_STRING,
  MYSQL_TYPE_VARCHAR,
  MYSQL_TYPE_ENUM,
  MYSQL_TYPE_SET,
  MYSQL_TYPE_GEOMETRY,
  MYSQL_TYPE_JSON:
    begin
      iCharLen := 0;
      if FVars.Statement.Session.Encoder.Encoding = ecUTF8 then begin
        if not lIsNull then begin
          if ((DataType = MYSQL_TYPE_STRING) or FixedLen) and FVars.Statement.StrsTrim then
            while (ALen > 0) and (PWideChar(ApData)[ALen - 1] = ' ') do
              Dec(ALen);
          if FVars.Statement.StrsEmpty2Null and (ALen = 0) then
            lIsNull := True;
        end;
        if not lIsNull then begin
          pUTF8 := nil;
          iCharLen := FVars.Statement.Session.Encoder.Encode(ApData, ALen, pUTF8, ecUTF16);
          iMaxChars := DataSize div SizeOf(TFDAnsiChar);
          if iCharLen > iMaxChars then
            if FVars.Statement.StrsTrim2Len then
              iCharLen := iMaxChars
            else
              ErrorDataTooLarge(iMaxChars, iCharLen);
          Move(PFDAnsiString(pUTF8)^, PFDAnsiString(pData)^, iCharLen * SizeOf(TFDAnsiChar));
        end;
      end
      else begin
        if not lIsNull then begin
          if ((DataType = MYSQL_TYPE_STRING) or FixedLen) and FVars.Statement.StrsTrim then
            while (ALen > 0) and (PFDAnsiString(ApData)[ALen - 1] = TFDAnsiChar(' ')) do
              Dec(ALen);
          if FVars.Statement.StrsEmpty2Null and (ALen = 0) then
            lIsNull := True;
        end;
        if not lIsNull then begin
          iCharLen := ALen * SizeOf(TFDAnsiChar);
          iMaxChars := DataSize div SizeOf(TFDAnsiChar);
          if iCharLen > iMaxChars then
            if FVars.Statement.StrsTrim2Len then
              iCharLen := iMaxChars
            else
              ErrorDataTooLarge(iMaxChars, iCharLen);
          Move(PFDAnsiString(ApData)^, PFDAnsiString(pData)^, iCharLen * SizeOf(TFDAnsiChar));
        end;
      end;
      pLen^ := iCharLen;
    end;
  MYSQL_TYPE_DECIMAL,
  MYSQL_TYPE_NEWDECIMAL:
    begin
      if lIsNull then
        iCharLen := 0
      else begin
        pWC := @aBuff[0];
        FDBCD2Str(pWC, iLen, PBcd(ApData)^, '.');
        pCh := nil;
        iCharLen := FVars.Statement.Session.Encoder.Encode(pWC, iLen, pCh, ecUTF16);
        Move(PFDAnsiString(pCh)^, PFDAnsiString(pData)^, iCharLen * SizeOf(TFDAnsiChar));
      end;
      pLen^ := iCharLen;
    end;
  MYSQL_TYPE_NULL:
    ;
  end;
  if lIsNull then
    pNull^ := 1
  else
    pNull^ := 0;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.GetDumpLabel: String;
begin
  Result := '';
  if FDumpLabel <> '' then
    Result := FDumpLabel
  else
    Result := Format('#%d', [FIndex + 1]);
end;

{$IFDEF FireDAC_MONITOR}
{-------------------------------------------------------------------------------}
function TMySQLVariable.DumpSQLDataType: String;
begin
  case DataType of
  MYSQL_TYPE_TINY:          Result := 'MYSQL_TYPE_TINY';
  MYSQL_TYPE_SHORT:         Result := 'MYSQL_TYPE_SHORT';
  MYSQL_TYPE_YEAR:          Result := 'MYSQL_TYPE_YEAR';
  MYSQL_TYPE_LONG:          Result := 'MYSQL_TYPE_LONG';
  MYSQL_TYPE_INT24:         Result := 'MYSQL_TYPE_INT24';
  MYSQL_TYPE_LONGLONG:      Result := 'MYSQL_TYPE_LONGLONG';
  MYSQL_TYPE_FLOAT:         Result := 'MYSQL_TYPE_FLOAT';
  MYSQL_TYPE_DOUBLE:        Result := 'MYSQL_TYPE_DOUBLE';
  MYSQL_TYPE_TIME:          Result := 'MYSQL_TYPE_TIME';
  MYSQL_TYPE_DATE:          Result := 'MYSQL_TYPE_DATE';
  MYSQL_TYPE_NEWDATE:       Result := 'MYSQL_TYPE_NEWDATE';
  MYSQL_TYPE_DATETIME:      Result := 'MYSQL_TYPE_DATETIME';
  MYSQL_TYPE_TIMESTAMP:     Result := 'MYSQL_TYPE_TIMESTAMP';
  MYSQL_TYPE_TINY_BLOB:     Result := 'MYSQL_TYPE_TINY_BLOB';
  MYSQL_TYPE_MEDIUM_BLOB:   Result := 'MYSQL_TYPE_MEDIUM_BLOB';
  MYSQL_TYPE_LONG_BLOB:     Result := 'MYSQL_TYPE_LONG_BLOB';
  MYSQL_TYPE_BLOB:          Result := 'MYSQL_TYPE_BLOB';
  MYSQL_TYPE_BIT:           Result := 'MYSQL_TYPE_BIT';
  MYSQL_TYPE_VAR_STRING:    Result := 'MYSQL_TYPE_VAR_STRING';
  MYSQL_TYPE_VARCHAR:       Result := 'MYSQL_TYPE_VARCHAR';
  MYSQL_TYPE_STRING:        Result := 'MYSQL_TYPE_STRING';
  MYSQL_TYPE_ENUM:          Result := 'MYSQL_TYPE_ENUM';
  MYSQL_TYPE_SET:           Result := 'MYSQL_TYPE_SET';
  MYSQL_TYPE_GEOMETRY:      Result := 'MYSQL_TYPE_GEOMETRY';
  MYSQL_TYPE_NULL:          Result := 'MYSQL_TYPE_NULL';
  MYSQL_TYPE_DECIMAL:       Result := 'MYSQL_TYPE_DECIMAL';
  MYSQL_TYPE_NEWDECIMAL:    Result := 'MYSQL_TYPE_NEWDECIMAL';
  MYSQL_TYPE_JSON:          Result := 'MYSQL_TYPE_JSON';
  else                      Result := '#' + IntToStr(DataType);
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariable.DumpValue: String;
var
  pData: Pointer;
  iLen: LongWord;
  aBuff: array[0..127] of Byte;
  aBuff2: array [0..64] of Char;
  iType: enum_field_types;
  i: Integer;
begin
  Result := '';
  iType := DataType;
  if iType in [MYSQL_TYPE_VAR_STRING, MYSQL_TYPE_STRING, MYSQL_TYPE_VARCHAR,
               MYSQL_TYPE_ENUM, MYSQL_TYPE_SET, MYSQL_TYPE_GEOMETRY, MYSQL_TYPE_JSON] then begin
    if not GetData(pData, iLen, True) then
      Result := 'NULL'
    else if FVars.Statement.Session.Encoder.Encoding = ecUTF8 then
      if iLen > 1024 then begin
        SetString(Result, PWideChar(pData), 1024);
        Result := '(truncated at 1024) ''' + Result + ' ...''';
      end
      else begin
        SetString(Result, PWideChar(pData), iLen);
        Result := '''' + Result + '''';
      end
    else
      if iLen > 1024 then begin
        Result := FVars.Statement.Session.Encoder.Decode(pData, 1024, ecANSI);
        Result := '(truncated at 1024) ''' + Result + ' ...''';
      end
      else begin
        Result := FVars.Statement.Session.Encoder.Decode(pData, iLen, ecANSI);
        Result := '''' + Result + '''';
      end;
  end
  else begin
    pData := @aBuff[0];
    if not GetData(pData, iLen, False) then
      Result := 'NULL'
    else
      case DataType of
      MYSQL_TYPE_TINY:
        if Unsigned then
          Result := IntToStr(PByte(pData)^)
        else
          Result := IntToStr(PShortInt(pData)^);
      MYSQL_TYPE_SHORT,
      MYSQL_TYPE_YEAR:
        if Unsigned then
          Result := IntToStr(PWord(pData)^)
        else
          Result := IntToStr(PSmallInt(pData)^);
      MYSQL_TYPE_LONG,
      MYSQL_TYPE_INT24:
        if Unsigned then
          Result := IntToStr(PCardinal(pData)^)
        else
          Result := IntToStr(PInteger(pData)^);
      MYSQL_TYPE_LONGLONG:
        if Unsigned then
          Result := IntToStr(PUInt64(pData)^)
        else
          Result := IntToStr(PInt64(pData)^);
      MYSQL_TYPE_FLOAT:
        Result := FloatToStr(PSingle(pData)^);
      MYSQL_TYPE_DOUBLE:
        Result := FloatToStr(PDouble(pData)^);
      MYSQL_TYPE_TIME:
        Result := TimeToStr(FDTime2DateTime(PInteger(pData)^));
      MYSQL_TYPE_DATE,
      MYSQL_TYPE_NEWDATE:
        Result := DateToStr(FDDate2DateTime(PInteger(pData)^));
      MYSQL_TYPE_DATETIME:
        Result := DateTimeToStr(FDMSecs2DateTime(PDateTimeRec(pData)^.DateTime));
      MYSQL_TYPE_TIMESTAMP:
        Result := DateTimeToStr(SQLTimeStampToDateTime(PSQLTimeStamp(pData)^));
      MYSQL_TYPE_TINY_BLOB,
      MYSQL_TYPE_MEDIUM_BLOB,
      MYSQL_TYPE_LONG_BLOB,
      MYSQL_TYPE_BLOB,
      MYSQL_TYPE_BIT:
        if iLen > 1024 then
          Result := '(truncated at 1024) ''0x' + FDBin2Hex(pData, 1024) + ' ...'''
        else
          Result := '''0x' + FDBin2Hex(pData, 1024) + '''';
      MYSQL_TYPE_DECIMAL,
      MYSQL_TYPE_NEWDECIMAL:
        begin
          FDBCD2Str(aBuff2, i, PBcd(pData)^, FormatSettings.DecimalSeparator);
          SetString(Result, aBuff2, i);
        end;
      MYSQL_TYPE_NULL:
        Result := 'NULL';
      end;
  end;
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
{ TMySQLBlobStream                                                              }
{-------------------------------------------------------------------------------}
constructor TMySQLBlobStream.Create(AVar: TMySQLVariable; AMode: TFDStreamMode);
var
  pData: Pointer;
  pLen: Pmy_ulong;
  pNull, pError: Pmy_bool;
begin
  inherited Create;
  FVar := AVar;
  FStmt := FVar.FVars.Statement;
  FMode := AMode;
  FBuffSize := C_FD_DefPieceBuffLen;
  GetMem(FBuff, FBuffSize);
  FVar.SetBuffer(FBuff, FBuffSize);
  if AMode = smOpenRead then begin
    FVar.GetInfo(pData, pLen, pNull, pError);
    FLength := pLen^;
  end
  else
    FLength := my_ulong(-1);
end;

{-------------------------------------------------------------------------------}
destructor TMySQLBlobStream.Destroy;
begin
  FreeMem(FBuff, FBuffSize);
  FVar.ResetBlob;
  FStmt.Session.Buffer.Release;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLBlobStream.CheckMode(AMode: TFDStreamMode; const AMsg: String);

  procedure Error;
  begin
    FDException(FStmt.OwningObj, [S_FD_LPhys, FStmt.Session.Lib.DriverID],
      er_FD_AccLongDataStream, [AMsg, FVar.DumpLabel]);
  end;

begin
  if FMode <> AMode then
    Error;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.GetOwningObj: TObject;
begin
  Result := FVar.Vars.Statement.OwningObj;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.Read(var Buffer; Count: Longint): Longint;
var
  iChunk: Integer;
  pData, pBuff: Pointer;
  pLen: Pmy_ulong;
  pNull, pError: Pmy_bool;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FStmt.Session.Trace(smysql_stmt_fetch_column, ['stmt', FStmt.FStmt,
      'column', FVar.Index, 'offset', FBlobOff]);
  end;
{$ENDIF}

begin
  CheckMode(smOpenRead, 'read from');
  Result := 0;
  pBuff := @Buffer;
  while Count > 0 do begin
    if FDataOff = FDataLen then begin
{$IFDEF FireDAC_MONITOR}
      if FStmt.Session.Tracing then Trace1;
{$ENDIF}
      FStmt.Check(FStmt.Session.Lib.mysql_stmt_fetch_column(
        FStmt.FStmt, FVar.Bind, FVar.Index, FBlobOff));
      FVar.GetInfo(pData, pLen, pNull, pError);
      if pNull^ = 1 then
        FDataLen := 0
      else if FBlobOff + FBuffSize > FLength then
        FDataLen := FLength - FBlobOff
      else
        FDataLen := FBuffSize;
      FDataOff := 0;
      Inc(FBlobOff, FDataLen);
    end;
    iChunk := FDataLen - FDataOff;
    if iChunk <= 0 then
      Break
    else if iChunk > Count then
      iChunk := Count;
    Move(pData^, pBuff^, iChunk);
    Dec(Count, iChunk);
    Inc(Result, iChunk);
    Inc(FDataOff, iChunk);
    Inc(PByte(pBuff), iChunk);
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.GetEncoding(AType: TFDDataType): TFDEncoding;
begin
  if AType in C_FD_AnsiTypes then
    Result := ecANSI
  else if AType in C_FD_WideTypes then
    Result := ecUTF16
  else
    Result := ecDefault;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.ReadStr(ABuff: Pointer; ALen: Longint;
  AType: TFDDataType): Longint;
var
  eEnc: TFDEncoding;
  pData: Pointer;
begin
  eEnc := GetEncoding(AType);
  if (eEnc <> ecDefault) and (eEnc <> FStmt.Session.Encoder.Encoding) and (ALen > 0) then begin
    if FStmt.Session.Encoder.Encoding = ecUTF8 then
      ALen := ALen * C_FD_MaxUTF8Len;
    pData := FStmt.Session.Buffer.Check(ALen);
  end
  else
    pData := ABuff;
  Result := Read(pData^, ALen);
  if (eEnc <> ecDefault) and (eEnc <> FStmt.Session.Encoder.Encoding) and (Result > 0) then
    Result := FStmt.Session.Encoder.Decode(pData, Result, ABuff, eEnc);
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.Write(const Buffer; Count: Longint): Longint;
var
  pBuff: Pointer;
  iChunk: Integer;
  lFirst: Boolean;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    FStmt.Session.Trace(smysql_stmt_send_long_data, ['stmt', FStmt.FStmt,
      'param', FVar.Index, 'length', iChunk]);
  end;
{$ENDIF}

begin
  CheckMode(smOpenWrite, 'write to');
  Result := 0;
  lFirst := True;
  pBuff := @Buffer;
  // When Count=0, then mysql_stmt_send_long_data(..., 0) must be called.
  // Otherwise the BLOB value will be NULL and not with size=0.
  while (Count > 0) or lFirst and (Count = 0) do begin
    if Count > C_FD_DefPieceBuffLen then
      iChunk := C_FD_DefPieceBuffLen
    else
      iChunk := Count;
{$IFDEF FireDAC_MONITOR}
    if FStmt.Session.Tracing then Trace1;
{$ENDIF}
    FStmt.Check(FStmt.Session.Lib.mysql_stmt_send_long_data(
      FStmt.FStmt, FVar.Index, pBuff, iChunk));
    Inc(FBlobOff, iChunk);
    Inc(Result, iChunk);
    Dec(Count, iChunk);
    Inc(PByte(pBuff), iChunk);
    lFirst := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.WriteStr(ABuff: Pointer; ALen: Longint;
  AType: TFDDataType): Longint;
var
  eEnc: TFDEncoding;
  pData: Pointer;
begin
  eEnc := GetEncoding(AType);
  if (eEnc <> ecDefault) and (eEnc <> FStmt.Session.Encoder.Encoding) and (ALen > 0) then begin
    pData := nil;
    ALen := FStmt.Session.Encoder.Encode(ABuff, ALen, pData, eEnc);
  end
  else
    pData := ABuff;
  Result := Write(pData^, ALen);
  if eEnc = ecUTF16 then
    Result := Result div SizeOf(WideChar);
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
var
  lError: Boolean;
  iOff: my_ulong;
begin
  iOff := FBlobOff - FDataLen + FDataOff;
  case Origin of
  soBeginning: lError := Offset <> iOff;
  soCurrent:   lError := Offset <> 0;
  soEnd:       lError := True;
  else         lError := False;
  end;
  if lError then
    CheckMode(smOpenReadWrite, 'seek');
  Result := iOff;
end;

{-------------------------------------------------------------------------------}
function TMySQLBlobStream.GetSize: Int64;
begin
  Result := -1;
  case FMode of
  smOpenRead:
    Result := FLength;
  smOpenWrite:
    Result := FBlobOff;
  end;
end;

{-------------------------------------------------------------------------------}
{ TMySQLVariables                                                               }
{-------------------------------------------------------------------------------}
constructor TMySQLVariables.Create(AStatement: TMySQLStatement);
begin
  inherited Create;
  FStatement := AStatement;
  FList := TFDObjList.Create;
end;

{-------------------------------------------------------------------------------}
destructor TMySQLVariables.Destroy;
begin
  Count := 0;
  ReleaseBuff;
  FDFreeAndNil(FList);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TMySQLVariables.GetItems(AIndex: Cardinal): TMySQLVariable;
begin
  Result := TMySQLVariable(FList[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TMySQLVariables.GetCount: Integer;
begin
  Result := FList.Count;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariables.SetCount(const ACount: Integer);
var
  iVer: TFDVersion;
  i: Integer;
begin
  if ACount = Count then
    Exit;
  ReleaseBuff;
  while Count > ACount do
    FDFree(TMySQLVariable(FList[Count - 1]));
  while Count < ACount do
    TMySQLVariable.Create(Self);
  if Count = 0 then begin
    FreeMem(FBinds);
    FBinds := nil;
    FBindSize := 0;
  end
  else begin
    iVer := Statement.Session.Lib.CompatVersion;
    if iVer >= mvMySQL050100 then
      FBindSize := SizeOf(MYSQL_BIND0510)
    else if iVer >= mvMySQL050006 then
      FBindSize := SizeOf(MYSQL_STMT0506)
    else if iVer >= mvMySQL041100 then
      FBindSize := SizeOf(MYSQL_STMT0411)
    else
      FBindSize := SizeOf(MYSQL_STMT0410);
    ReallocMem(FBinds, FBindSize * Cardinal(Count));
    FillChar(FBinds^, FBindSize * Cardinal(Count), 0);
    for i := 0 to Count - 1 do
      Items[i].DataType := MYSQL_TYPE_NULL;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariables.AllocateBuff;
var
  i: Integer;
  oVar: TMySQLVariable;
  pBuff: PByte;
  iVer: TFDVersion;
  pBind: PMYSQL_BIND;
  pLen, pData, pNull, pErr: Pointer;
begin
  if Count = 0 then
    Exit;

  FBuffSize := 0;
  for i := 0 to Count - 1 do begin
    oVar := Items[i];
    if oVar.DataSize = 0 then
      oVar.DataSize := oVar.GetDataTypeSize(oVar.DataType, oVar.DataSize);
    Inc(FBuffSize, oVar.BindSize);
  end;

  iVer := Statement.Session.Lib.CompatVersion;
  GetMem(FBuff, FBuffSize);
  FillChar(FBuff^, FBuffSize, 0);
  pBuff := FBuff;
  pBind := FBinds;

  for i := 0 to Count - 1 do begin
    oVar := Items[i];
    ASSERT(oVar.LongData or (oVar.DataType = MYSQL_TYPE_NULL) or (oVar.DataSize <> 0));

    pLen := pBuff;
    pData := PByte(pBuff) + SizeOf(my_ulong);
    pNull := PByte(pData) + oVar.DataSize;
    pErr := PByte(pNull) + SizeOf(my_bool);
    if oVar.DataSize = 0 then
      pData := nil;
    Pmy_bool(pNull)^ := 1;

    if iVer >= mvMySQL050100 then begin
      PMYSQL_BIND0510(pBind)^.buffer := pData;
      PMYSQL_BIND0510(pBind)^.length := pLen;
      PMYSQL_BIND0510(pBind)^.is_null := pNull;
      PMYSQL_BIND0510(pBind)^.error := pErr;
    end
    else if iVer >= mvMySQL050006 then begin
      PMYSQL_BIND0506(pBind)^.buffer := pData;
      PMYSQL_BIND0506(pBind)^.length := pLen;
      PMYSQL_BIND0506(pBind)^.is_null := pNull;
      PMYSQL_BIND0506(pBind)^.error := pErr;
    end
    else if iVer >= mvMySQL041100 then begin
      PMYSQL_BIND0411(pBind)^.buffer := pData;
      PMYSQL_BIND0411(pBind)^.length := pLen;
      PMYSQL_BIND0411(pBind)^.is_null := pNull;
    end
    else begin
      PMYSQL_BIND0410(pBind)^.buffer := pData;
      PMYSQL_BIND0410(pBind)^.length := pLen;
      PMYSQL_BIND0410(pBind)^.is_null := pNull;
    end;

    pBind := PMYSQL_BIND(NativeUInt(pBind) + FBindSize);
    pBuff := pBuff + oVar.BindSize;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariables.ReleaseBuff;
begin
  if FBuff <> nil then begin
    FreeMem(FBuff);
    FBuff := nil;
    FBuffSize := 0;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariables.CheckBuff;
begin
  if FBuff = nil then
    AllocateBuff;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLVariables.ResetBlobs;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].ResetBlob;
end;

{-------------------------------------------------------------------------------}
{ TMySQLStatement                                                               }
{-------------------------------------------------------------------------------}
constructor TMySQLStatement.Create(ASession: TMySQLSession; AOwningObj: TObject = nil);
begin
  inherited Create;
  FOwningObj := AOwningObj;
  FSession := ASession;
  FParams := TMySQLVariables.Create(Self);
  FFields := TMySQLVariables.Create(Self);
  FState := msInactive;
end;

{-------------------------------------------------------------------------------}
destructor TMySQLStatement.Destroy;
begin
  if FStmt <> nil then
    Unprepare;
  FDFreeAndNil(FParams);
  FDFreeAndNil(FFields);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Check(ACode: Integer);

  procedure DoError;
  var
    iErrNo: Cardinal;
    sMsg, sSQLState: String;
  begin
    iErrNo := Session.Lib.mysql_stmt_errno(FStmt);
    sMsg := Session.FEncoder.Decode(Session.Lib.mysql_stmt_error(FStmt), -1, ecANSI);
    sSQLState := Session.FEncoder.Decode(Session.Lib.mysql_stmt_sqlstate(FStmt), -1, ecANSI);
    Session.ProcessError(iErrNo, sMsg, sSQLState, FOwningObj);
  end;

begin
  if ACode <> MYSQL_SUCCESS then
    DoError;
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetAffectedRows: my_ulonglong;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_affected_rows, ['stmt', FStmt, 'Result', Result]);
  end;
{$ENDIF}

begin
  Result := Session.Lib.mysql_stmt_affected_rows(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetInsert_ID: my_ulonglong;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_insert_id, ['stmt', FStmt, 'Result', Result]);
  end;
{$ENDIF}

begin
  Result := Session.Lib.mysql_stmt_insert_id(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetFieldCount: Cardinal;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_field_count, ['stmt', FStmt, 'Result', Result]);
  end;
{$ENDIF}

begin
  Result := Session.Lib.mysql_stmt_field_count(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetParamCount: LongWord;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_param_count, ['stmt', FStmt, 'Result', Result]);
  end;
{$ENDIF}

begin
  Result := Session.Lib.mysql_stmt_param_count(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetBoolAttr(const AIndex: Integer): my_bool;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_attr_get, ['stmt', FStmt, 'option', AIndex,
      'Result', Result]);
  end;
{$ENDIF}

begin
  Result := 0;
  Session.Lib.mysql_stmt_attr_get(FStmt, AIndex, @Result);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.SetBoolAttr(const AIndex: Integer; const AValue: my_bool);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_attr_set, ['stmt', FStmt, 'option', AIndex,
      'arg', AValue]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_attr_set(FStmt, AIndex, @AValue));
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.GetLongAttr(const AIndex: Integer): LongWord;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_attr_get, ['stmt', FStmt, 'option', AIndex,
      'Result', Result]);
  end;
{$ENDIF}

begin
  Result := 0;
  Session.Lib.mysql_stmt_attr_get(FStmt, AIndex, @Result);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.SetLongAttr(const AIndex: Integer; const AValue: LongWord);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_attr_set, ['stmt', FStmt, 'option', AIndex,
      'arg', AValue]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_attr_set(FStmt, AIndex, @AValue));
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Prepare(const ASQL: String);

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_init, ['mysql', Session.MySQL, 'Result', FStmt]);
  end;

  procedure Trace2;
  begin
    Session.Trace(smysql_stmt_prepare, ['stmt', FStmt, 'q', ASQL]);
  end;
{$ENDIF}

var
  sbSQL: TFDByteString;
begin
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  FStmt := Session.Lib.mysql_stmt_init(Session.MySQL);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace2;
{$ENDIF}
  sbSQL := Session.FEncoder.Encode(ASQL);
  Check(Session.Lib.mysql_stmt_prepare(FStmt, my_pchar(PByte(sbSQL)),
    Session.FEncoder.EncodedLength(sbSQL)));
  Params.Count := ParamCount;
  Fields.Count := FieldCount;
  FState := msPrepared;
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.Describe: TMySQLResult;
var
  pRes: PMYSQL_RES;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_result_metadata, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  pRes := Session.Lib.mysql_stmt_result_metadata(FStmt);
  if pRes = nil then
    Result := nil
  else
    Result := TMySQLResult.Create(Session, pRes);
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.BindParams;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_bind_param, ['stmt', FStmt, 'count', Params.Count]);
  end;
{$ENDIF}

begin
  if Params.Count = 0 then
    Exit;
  Params.CheckBuff;
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_bind_param(FStmt, Params.Binds));
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.BindColumns;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_bind_result, ['stmt', FStmt, 'count', Fields.Count]);
  end;
{$ENDIF}

begin
  if Fields.Count = 0 then
    Exit;
  Fields.CheckBuff;
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_bind_result(FStmt, Fields.Binds));
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Execute;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_execute, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
  FSession.ClearInfo;
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_execute(FStmt));
  Fields.Count := FieldCount;
  if Fields.Count > 0 then
    FState := msOpenFirst
  else
    FState := msExecuted;
  FSession.GetInfo;
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.Fetch: Boolean;
var
  iRes: Integer;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_fetch, ['stmt', FStmt, 'Result', iRes]);
  end;
{$ENDIF}

begin
  Result := False;
  if not (FState in [msOpenFirst, msOpenNext]) then
    Exit;
  Fields.ResetBlobs;
  iRes := Session.Lib.mysql_stmt_fetch(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  case iRes of
  MYSQL_SUCCESS:        Result := True;
  MYSQL_STATUS_ERROR:   Check(iRes);
  MYSQL_NO_DATA:        ;
  MYSQL_DATA_TRUNCATED: Result := True;
  end;
  if not Result then
    FState := msEOF;
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.MoreResults: Boolean;
begin
  Result := (FState = msOpenFirst) or Session.HasMoreResults;
end;

{-------------------------------------------------------------------------------}
function TMySQLStatement.NextResult: Boolean;
var
  iRes: Integer;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_next_result, ['stmt', FStmt, 'Result', iRes]);
  end;
{$ENDIF}

begin
  if FState = msOpenFirst then begin
    Result := True;
    Exit;
  end;
  if (FState = msExecuted) or not Assigned(Session.Lib.mysql_stmt_next_result) then begin
    Result := False;
    Exit;
  end;

  FSession.ClearInfo;
  Result := False;
  iRes := Session.Lib.mysql_stmt_next_result(FStmt);
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  if iRes >= MYSQL_STATUS_ERROR then
    Check(iRes)
  else
    Result := iRes = MYSQL_SUCCESS;
  if Result then begin
    Fields.Count := FieldCount;
    FState := msOpenNext;
  end
  else
    FState := msEOF;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.StoreResult;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_store_result, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
  if not (FState in [msOpenFirst, msOpenNext]) then
    Exit;
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_store_result(FStmt));
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Close;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_free_result, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
  if not (FState in [msOpenFirst, msOpenNext]) then
    Exit;
{$IFDEF FireDAC_MONITOR}
  if Session.Tracing then Trace1;
{$ENDIF}
  Check(Session.Lib.mysql_stmt_free_result(FStmt));
  FState := msEOF;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Reset;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_reset, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
  if FState in [msExecuted, msOpenFirst, msOpenNext, msEOF] then begin
{$IFDEF FireDAC_MONITOR}
    if Session.Tracing then Trace1;
{$ENDIF}
    Check(Session.Lib.mysql_stmt_reset(FStmt));
    Params.ResetBlobs;
    Fields.ResetBlobs;
    FState := msPrepared;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TMySQLStatement.Unprepare;

{$IFDEF FireDAC_MONITOR}
  procedure Trace1;
  begin
    Session.Trace(smysql_stmt_close, ['stmt', FStmt]);
  end;
{$ENDIF}

begin
  Params.Count := 0;
  Fields.Count := 0;
  if FStmt <> nil then begin
{$IFDEF FireDAC_MONITOR}
    if Session.Tracing then Trace1;
{$ENDIF}
    Session.Lib.mysql_stmt_close(FStmt);
    FStmt := nil;
    FState := msInactive;
  end;
end;

{-------------------------------------------------------------------------------}
function MySQLNativeExceptionLoad(const AStorage: IFDStanStorage): TObject;
begin
  Result := EMySQLNativeException.Create;
  EMySQLNativeException(Result).LoadFromStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
initialization
  FDStorageManager().RegisterClass(EMySQLNativeException, 'MySQLNativeException',
    @MySQLNativeExceptionLoad, @FDExceptionSave);

end.
