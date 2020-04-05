{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DbxOdbc"'}    {Do not Localize}
unit Data.DbxOdbc;

interface

uses System.Classes, Data.DBXCommon, Data.DBXJSON,
  Data.DBXPlatform, Data.FMTBcd, System.Odbc, Data.SqlTimSt, System.SysUtils
{$IFNDEF POSIX}
  , Winapi.Windows
{$ENDIF}
;

type
  OdbcHandle = Pointer;

  TDBXOdbcMethodTable = class
  private
    FSQLAllocHandle: TSQLAllocHandle;
    FSQLBindCol: TSQLBindCol;
    FSQLBindParameter: TSQLBindParameter;
    FSQLCloseCursor: TSQLCloseCursor;
    FSQLColumns: TSQLColumnsW;
    FSQLConnect: TSQLConnectW;
    FSQLDescribeCol: TSQLDescribeColW;
    FSQLDisconnect: TSQLDisconnect;
    FSQLDriverConnect: TSQLDriverConnectW;
    FSQLEndTran: TSQLEndTran;
    FSQLExecDirect: TSQLExecDirectW;
    FSQLExecute: TSQLExecute;
    FSQLFetchScroll: TSQLFetchScroll;
    FSQLForeignKeys: TSQLForeignKeysW;
    FSQLFreeHandle: TSQLFreeHandle;
    FSQLGetData: TSQLGetData;
    FSQLGetDiagRec: TSQLGetDiagRecW;
    FSQLGetInfo: TSQLGetInfoW;
    FSQLGetTypeInfo: TSQLGetTypeInfoW;
    FSQLNativeSql: TSQLNativeSqlW;
    FSQLNumResultCols: TSQLNumResultCols;
    FSQLParamData: TSQLParamData;
    FSQLPrepare: TSQLPrepareW;
    FSQLProcedureColumns: TSQLProcedureColumnsW;
    FSQLProcedures: TSQLProceduresW;
    FSQLPutData: TSQLPutData;
    FSQLRowCount: TSQLRowCount;
    FSQLSetConnectAttr: TSQLSetConnectAttrW;
    FSQLSetEnvAttr: TSQLSetEnvAttr;
    FSQLSetStmtAttr: TSQLSetStmtAttrW;
    FSQLStatistics: TSQLStatisticsW;
    FSQLTables: TSQLTablesW;

    FLibraryHandle: THandle;

  public
    procedure RaiseError(DBXContext: TDBXContext; ReturnValue, HandleType: SmallInt; Handle: OdbcHandle);
    function SQLAllocHandle(HandleType: SQLSMALLINT; InputHandle: SQLHANDLE; var OutputHandle: SQLHANDLE): SQLRETURN;
    function SQLBindCol(StatementHandle: SQLHSTMT; ColumnNumber: SQLUSMALLINT;
                        TargetType: SQLSMALLINT; TargetValue: SQLPOINTER;
                        BufferLength: SQLLEN; StrLen_or_Ind: PSQLLEN): SQLRETURN;
    function SQLBindParameter(hstmt: SQLHSTMT; ipar: SQLUSMALLINT; fParamType, fCType, fSqlType: SQLSMALLINT;
                               cbColDef: SQLULEN; ibScale: SQLSMALLINT; rgbValue: SQLPOINTER;
                               cbValueMax: SQLLEN; pcbValue: PSQLLEN): SQLRETURN;
    function SQLCloseCursor(StatementHandle: SQLHSTMT): SQLRETURN;
    function SQLColumns(StatementHandle: SQLHSTMT; CatalogName: PSqlWChar; NameLength1: SQLSMALLINT;
                         SchemaName: PSqlWChar; NameLength2: SQLSMALLINT; TableName: PSqlWChar;
                         NameLength3: SQLSMALLINT; ColumnName: PSqlWChar; NameLength4: SQLSMALLINT): SQLRETURN;
    function SQLConnect(ConnectionHandle: SQLHDBC; ServerName: PSqlWChar; NameLength1: SQLSMALLINT;
                         UserName: PSqlWChar; NameLength2: SQLSMALLINT; Authentication: PSqlWChar;
                         NameLength3: SQLSMALLINT): SQLRETURN;
    function SQLDescribeCol(StatementHandle: SQLHSTMT; ColumnNumber: SQLUSMALLINT;
                             ColumnName: PSqlWChar; BufferLength: SQLSMALLINT;
                             var NameLength: SQLSMALLINT; var DataType: SQLSMALLINT;
                             var ColumnSize: SQLULEN; var DecimalDigits: SQLSMALLINT;
                             var Nullable: SQLSMALLINT): SQLRETURN;
    function SQLDisconnect(ConnectionHandle: SQLHDBC): SQLRETURN;
    function SQLDriverConnect(hdbc: SQLHDBC; hwnd: SQLHWND; szConnStrIn: PSqlWChar;
                               cchConnStrIn: SQLSMALLINT; szConnStrOut: PSqlWChar;
                               cchConnStrOutMax: SQLSMALLINT; var pcchConnStrOut: SQLSMALLINT;
                               fDriverCompletion: SQLUSMALLINT): SQLRETURN;
    function SQLEndTran(HandleType: SQLSMALLINT; Handle: SQLHANDLE; CompletionType: SQLSMALLINT): SQLRETURN;
    function SQLExecDirect(StatementHandle: SQLHSTMT; StatementText: PSqlWChar;
                            TextLength: SQLINTEGER): SQLRETURN;
    function SQLExecute(StatementHandle: SQLHSTMT): SQLRETURN;
    function SQLFetchScroll(StatementHandle: SQLHSTMT; FetchOrientation: SQLSMALLINT;
                             FetchOffset: SQLLEN): SQLRETURN;
    function SQLForeignKeys(hstmt: SQLHSTMT; szPkCatalogName: PSqlWChar; cchPkCatalogName: SQLSMALLINT;
                             szPkSchemaName: PSqlWChar; cchPkSchemaName: SQLSMALLINT;
                             szPkTableName: PSqlWChar; cchPkTableName: SQLSMALLINT;
                             szFkCatalogName: PSqlWChar; cchFkCatalogName: SQLSMALLINT;
                             szFkSchemaName: PSqlWChar; cchFkSchemaName: SQLSMALLINT;
                             szFkTableName: PSqlWChar; cchFkTableName: SQLSMALLINT): SQLRETURN;
    function SQLFreeHandle(HandleType: SQLSMALLINT; Handle: SQLHANDLE): SQLRETURN;
    function SQLGetData(StatementHandle: SQLHSTMT; ColumnNumber: SQLUSMALLINT;
                         TargetType: SQLSMALLINT; TargetValue: SQLPOINTER; BufferLength: SQLLEN;
                         StrLen_or_IndPtr: PSQLLEN): SQLRETURN;
    function SQLGetDiagRec(HandleType: SQLSMALLINT; Handle: SQLHANDLE; RecNumber: SQLSMALLINT;
                            SqlState: PSqlWChar; var NativeError: SQLINTEGER;
                            MessageText: PSqlWChar; BufferLength: SQLSMALLINT;
                            var TextLength: SQLSMALLINT): SQLRETURN;
    function SQLGetInfo(ConnectionHandle: SQLHDBC; InfoType: SQLUSMALLINT;
                         InfoValue: SQLPOINTER; BufferLength: SQLSMALLINT;
                         var StringLengthPtr: SQLSMALLINT): SQLRETURN;
    function SQLGetTypeInfo(StatementHandle: SQLHSTMT; DataType: SQLSMALLINT): SQLRETURN;
    function SQLNativeSql(hdbc: SQLHDBC; szSqlStrIn: PSqlWChar; cchSqlStrIn: SQLINTEGER;
                          szSqlStr: PSqlWChar; cchSqlStrMax: SQLINTEGER; var pcbSqlStr: SQLINTEGER): SQLRETURN;
    function SQLNumResultCols(StatementHandle: SQLHSTMT; var ColumnCount: SQLSMALLINT): SQLRETURN;
    function SQLParamData(StatementHandle: SQLHSTMT; Value: SQLPOINTER): SQLRETURN;
    function SQLPrepare(StatementHandle: SQLHSTMT; StatementText: PSqlWChar;
                         TextLength: SQLINTEGER): SQLRETURN;
    function SQLProcedureColumns(hstmt: SQLHSTMT; szCatalogName: PSqlWChar; cchCatalogName: SQLSMALLINT;
                                  szSchemaName: PSqlWChar; cchSchemaName: SQLSMALLINT;
                                  szProcName: PSqlWChar; cchProcName: SQLSMALLINT;
                                  szColumnName: PSqlWChar; cchColumnName: SQLSMALLINT): SQLRETURN;
    function SQLProcedures(hstmt: SQLHSTMT; szCatalogName: PSqlWChar; cchCatalogName: SQLSMALLINT;
                            szSchemaName: PSqlWChar; cchSchemaName: SQLSMALLINT;
                            szProcName: PSqlWChar; cchProcName: SQLSMALLINT): SQLRETURN;
    function SQLPutData(StatementHandle: SQLHSTMT; Data: SQLPOINTER; StrLen_or_Ind: SQLLEN): SQLRETURN;
    function SQLRowCount(StatementHandle: SQLHSTMT; var RowCount: SQLLEN): SQLRETURN;
    function SQLSetConnectAttr(ConnectionHandle: SQLHDBC; Attribute: SQLINTEGER;
                                Value: SQLPOINTER; StringLength: SQLINTEGER): SQLRETURN;
    function SQLSetEnvAttr(EnvironmentHandle: SQLHENV; Attribute: SQLINTEGER;
                            Value: SQLPOINTER; StringLength: SQLINTEGER): SQLRETURN;
    function SQLSetStmtAttr(StatementHandle: SQLHSTMT; Attribute: SQLINTEGER;
                             Value: SQLPOINTER; StringLength: SQLINTEGER): SQLRETURN;
    function SQLStatistics(StatementHandle: SQLHSTMT; CatalogName: PSqlWChar;
                            NameLength1: SQLSMALLINT; SchemaName: PSqlWChar;
                            NameLength2: SQLSMALLINT; TableName: PSqlWChar;
                            NameLength3: SQLSMALLINT; Unique, Reserved: SQLUSMALLINT): SQLRETURN;
    function SQLTables(StatementHandle: SQLHSTMT; CatalogName: PSqlWChar; NameLength1: SQLSMALLINT;
                        SchemaName: PSqlWChar; NameLength2: SQLSMALLINT;
                        TableName: PSqlWChar; NameLength3: SQLSMALLINT;
                        TableType: PSqlWChar; NameLength4: SQLSMALLINT): SQLRETURN;

    constructor Create(LibraryHandle: THandle);
    destructor Destroy; override;
    procedure LoadMethods;
    function LoadMethod(MethodName: string): OdbcHandle;
  end;

  TDBXOdbcProperties = class(TDBXProperties)
  public
    constructor Create(DBXContext: TDBXContext); override;
  end;

  TDBXOdbcDriver = class(TDBXDriver)
  private
    FMethodTable: TDBXOdbcMethodTable;
    FEnvironmentHandle: OdbcHandle;

    procedure CheckResult(ReturnValue: SmallInt);
    function CreateOdbcCommand(DbxContext: TDBXContext;
      Connection: TDBXConnection; MorphicCommand: TDBXCommand): TDBXCommand;
  protected
    procedure Close; override;
    function CreateConnection(ConnectionBuilder: TDBXConnectionBuilder): TDBXConnection; override;
    procedure LoadDriver(DBXContext: TDBXContext);
  public
    constructor Create(DriverDef: TDBXDriverDef); overload; override;
    constructor Create(DriverDef: TDBXDriverDef; MethodTable: TDBXOdbcMethodTable); overload;
    destructor Destroy; override;
    procedure GetDriverPropertyNames(List: TStrings); override;
    function GetDriverVersion: UnicodeString; override;
  end;

  TDBXOdbcConnection = class(TDBXConnection)
  private
    FMethodTable: TDBXOdbcMethodTable;
    FEnvironmentHandle: OdbcHandle;
    FConnectionHandle: OdbcHandle;
    FTransactionId: Integer;

    procedure CheckResult(ReturnValue: SmallInt);
  protected
    function CreateAndBeginTransaction(const Isolation: TDBXIsolation): TDBXTransaction; override;
    procedure Commit(const InTransaction: TDBXTransaction); override;
    procedure DerivedClose; override;
    procedure DerivedGetCommands(const CommandType: UnicodeString;
      const List: TStrings); override;
    procedure DerivedGetCommandTypes(const List: TStrings); override;
    procedure DerivedOpen; override;
    function GetDatabaseMetaData: TDBXDatabaseMetaData; override;
    function GetProductName: UnicodeString; override;
    function GetProductVersion: UnicodeString; override;
    procedure Rollback(const InTransaction: TDBXTransaction); override;
  public
    constructor Create(ConnectionBuilder: TDBXConnectionBuilder;
      EnvironmentHandle, ConnectionHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
    destructor Destroy; override;
    function GetVendorProperty(const Name: UnicodeString): UnicodeString; override;
    property ConnectionHandle: OdbcHandle read FConnectionHandle;
    property DatabaseMetaData: TDBXDatabaseMetaData read GetDatabaseMetaData;
    property EnvironmentHandle: OdbcHandle read FEnvironmentHandle;
    property MethodTable: TDBXOdbcMethodTable read FMethodTable;
  end;

  //Forward declaration
  TDBXOdbcRow = class;

  TDBXOdbcCommand = class(TDBXCommand)
  private
    FMethodTable: TDBXOdbcMethodTable;
    FEnvironmentHandle: OdbcHandle;
    FConnectionHandle: OdbcHandle;
    FCommandHandle: OdbcHandle;
    FOdbcConnection: TDBXOdbcConnection;
    FRowsAffected: Int64;
    FRowSetSize: Int64;
    FParameterRow: TDBXOdbcRow;

    procedure BindParameters;
    procedure CheckResult(ReturnValue: SmallInt);
    procedure CheckResultConnHandle(ReturnValue: SmallInt);
    procedure ExecuteCatalogFunction;
    function GetNumberOfColumns: Int64;
    function IsFunction: Boolean;
    procedure PutBlobs;
    procedure SetParameterValues;
    procedure SetRowsAffected;
  protected
    function CreateParameterRow: TDBXRow; override;
    procedure DerivedClose; override;
    function DerivedExecuteQuery: TDBXReader; override;
    procedure DerivedExecuteUpdate; override;
    function DerivedGetNextReader: TDBXReader; override;
    procedure DerivedOpen; override;
    procedure DerivedPrepare; override;
    function GetRowsAffected: Int64; override;
    procedure SetMaxBlobSize(const MaxBlobSize: Int64); override;
    procedure SetRowSetSize(const RowSetSize: Int64); override;
  public
    constructor Create(DBXContext: TDBXContext; OdbcConnection: TDBXOdbcConnection);
    destructor Destroy; override;
  end;

  TDBXOdbcByteReader = class(TDBXByteReader)
  private
    FMethodTable: TDBXOdbcMethodTable;
    FEnvironmentHandle: OdbcHandle;
    FConnectionHandle: OdbcHandle;
    FCommandHandle: OdbcHandle;

    function CalculateOffset(ColNum: Integer): Int64;
    procedure CheckResult(ReturnValue: SmallInt);
  protected
    FRow: TDBXOdbcRow;
    constructor Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
  public
    destructor Destroy; override;
    procedure GetAnsiString(Ordinal: TInt32; const Value: TBytes;
      Offset: TInt32; var IsNull: LongBool); override;
    procedure GetWideString(Ordinal: TInt32; const Value: TBytes;
      Offset: TInt32; var IsNull: LongBool); override;
    procedure GetUInt8(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetInt8(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); overload; override;
    procedure GetUInt16(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetInt16(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetInt32(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetInt64(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetSingle(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetDouble(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetBcd(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetTimeStamp(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetTimeStampOffset(Ordinal: TInt32; const Value: TBytes;
      Offset: TInt32; var IsNull: LongBool); override;
    procedure GetTime(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetDate(Ordinal: TInt32; const Value: TBytes; Offset: TInt32;
      var IsNull: LongBool); override;
    procedure GetByteLength(Ordinal: TInt32; var Length: Int64;
      var IsNull: LongBool); override;
    function GetBytes(Ordinal: TInt32; Offset: Int64; const Value: TBytes;
      ValueOffset: Int64; Length: Int64; var IsNull: LongBool): Int64; override;
  end;

  TDBXOdbcReader = class(TDBXReader)
  private
    FMethodTable: TDBXOdbcMethodTable;
    FEnvironmentHandle: OdbcHandle;
    FConnectionHandle: OdbcHandle;
    FCommandHandle: OdbcHandle;

    procedure CheckResult(ReturnValue: SmallInt);
    function CreateColumn(Ordinal: Word): TDBXWritableValue;
  protected
    constructor Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable;
                       ByteReader: TDBXOdbcByteReader; NumCols, RowSetSize: Int64);
    procedure DerivedClose; override;
    function DerivedNext: Boolean; override;
    //Override this if you want to create custom mappings
    procedure SetTypeInfo(Column: TDBXValueType; const SQLDataType: SmallInt); virtual;
  end;

  TDBXOdbcDriverLoader = class(TDBXDriverLoader)
  private
    FLibraryHandle: HModule;
    FMethodTable: TDBXOdbcMethodTable;
  public
    constructor Create; override;
    function Load(DriverDef: TDBXDriverDef): TDBXDriver; override;
  end;

  TDBXOdbcBlockMgr = class
  private
    FBuffer: TBytes;
    FCurrentRec: Int64;
    FRecCount: Int64;
    FRowLength: Int64;
    FRowsFetched: Int64;
  public
    constructor Create(RowLength, RowCount: Int64);
    destructor Destroy; override;
    procedure Next;
    procedure Reset;
    property Buffer: TBytes read FBuffer;
    property CurrentRecord: Int64 read FCurrentRec;
    property RowLength: Int64 read FRowLength;
    property RowsFetched: Int64 read FRowsFetched;
  end;

  TDBXOdbcRow = class(TDBXRow)
  private
    FBlock: TDBXOdbcBlockMgr;
    FColumnTypes: array of SmallInt;
    FCommandHandle: OdbcHandle;
    FConnectionHandle: OdbcHandle;
    FEnvironmentHandle: OdbcHandle;
    FIndicatorSize: Integer;
    FMethodTable: TDBXOdbcMethodTable;
    FOffsets: array of Int64;

    function CalculateOffset(ColNum: Integer): Int64;
  protected
    procedure GetAnsiString(DbxValue: TDBXAnsiStringValue;
      var AnsiStringBuilder: TDBXAnsiStringBuilder; var IsNull: LongBool); override;
    procedure GetWideString(DbxValue: TDBXWideStringValue;
      var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool); overload; override;
    procedure GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool;
      var IsNull: LongBool); override;
    procedure GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
      var IsNull: LongBool); override;
    procedure GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
      var IsNull: LongBool); override;
    procedure GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
      var IsNull: LongBool); override;
    procedure GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
      var IsNull: LongBool); override;
    procedure GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
      var IsNull: LongBool); override;
    procedure GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
      var IsNull: LongBool); override;
    procedure GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
      var IsNull: LongBool); override;
    procedure GetDouble(DbxValue: TDBXDoubleValue; var Value: Double;
      var IsNull: LongBool); override;
    procedure GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd;
      var IsNull: LongBool); override;
    procedure GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate;
      var IsNull: LongBool); override;
    procedure GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime;
      var IsNull: LongBool); override;
    procedure GetTimeStamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp; var IsNull: LongBool); override;
    procedure GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
      var Value: TSQLTimeStampOffset; var IsNull: LongBool); override;
    procedure GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64;
      const Buffer: TBytes; BufferOffset: Int64; Length: Int64;
      var ReturnLength: Int64; var IsNull: LongBool); override;
    procedure GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64;
      var IsNull: LongBool); override;
    procedure SetNull(DbxValue: TDBXValue); override;
    procedure SetString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString); override;
    procedure SetWideString(DbxValue: TDBXWideStringValue;
      const Value: UnicodeString); override;
    procedure SetAnsiString(DbxValue: TDBXAnsiStringValue;
      const Value: AnsiString); override;
    procedure SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte); override;
    procedure SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt); override;
    procedure SetUInt16(DbxValue: TDBXUInt16Value; Value: Word); override;
    procedure SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt); override;
    procedure SetInt32(DbxValue: TDBXInt32Value; Value: TInt32); override;
    procedure SetInt64(DbxValue: TDBXInt64Value; Value: Int64); override;
    procedure SetSingle(DbxValue: TDBXSingleValue; Value: Single); override;
    procedure SetDouble(DbxValue: TDBXDoubleValue; Value: Double); override;
    procedure SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd); override;
    procedure SetDate(DbxValue: TDBXDateValue; Value: TDBXDate); override;
    procedure SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime); override;
    procedure SetTimestamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp); override;
    procedure SetDynamicBytes(DbxValue: TDBXValue; Offset: Int64;
      const Buffer: TBytes; BufferOffset: Int64; Length: Int64); override;
    procedure SetValueType(ValueType: TDBXValueType); override;
    procedure GetStream(DbxValue: TDBXStreamValue; var Stream: TStream;
      var IsNull: LongBool); overload; override;
    procedure SetAnsiMemo(DbxValue: TDBXAnsiMemoValue; const Value: AnsiString); override;
    procedure SetWideMemo(DbxValue: TDBXWideMemoValue;
      const Value: UnicodeString); override;
    procedure SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean); override;
    procedure GetLength(DbxValue: TDBXValue; var ByteLength: Int64;
      var IsNull: LongBool); override;
  public
    constructor Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
    destructor Destroy; override;
  end;

  TDBXOdbcTransaction = class(TDBXTransaction)
  private
    FId: Integer;
  public
    constructor Create(Connection: TDBXConnection; IsolationLevel: TDBXIsolation; TransactionId: Integer);
  end;

implementation


uses
  System.DateUtils, Data.DBXCommonResStrs, Data.DbxOdbcReadOnlyMetaData, Data.DbxOdbcMetaData, System.Math;

const
  sDriverName = 'Odbc';
{$IFDEF MSWINDOWS}
  sVendorLib = 'odbc32.dll';
{$ENDIF}
{$IFDEF MACOS}
  sVendorLib = '/usr/lib/libiodbc.dylib';
{$ENDIF}

function GetTypeSize(DataType: TDBXType): Int64;
begin
  case DataType of
    TDBXDataTypes.DateType: Result := SizeOf(SQL_DATE_STRUCT);
    TDBXDataTypes.Int16Type, TDBXDataTypes.BooleanType: Result := SizeOf(SmallInt);
    TDBXDataTypes.Int32Type:
      Result := SizeOf(Integer);
    TDBXDataTypes.DoubleType: Result := SizeOf(Double);
    TDBXDataTypes.TimeType: Result := SizeOf(SQL_TIME_STRUCT);
    TDBXDataTypes.UInt16Type: Result := SizeOf(Word);
    TDBXDataTypes.UInt32Type: Result := SizeOf(LongWord);
    TDBXDataTypes.Int64Type: Result := SizeOf(Int64);
    TDBXDataTypes.UInt64Type: Result := SizeOf(UInt64);
    TDBXDataTypes.TimeStampType: Result := SizeOf(SQL_TIMESTAMP_STRUCT);
    TDBXDataTypes.SingleType: Result := SizeOf(Single);
    TDBXDataTypes.Int8Type: Result := SizeOf(ShortInt);
    TDBXDataTypes.UInt8Type: Result := SizeOf(Byte);
    else
      Result := 1;
  end;
end;

procedure TDBXOdbcDriver.CheckResult(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_ENV, FEnvironmentHandle);
end;

function TDBXOdbcDriver.CreateOdbcCommand(DbxContext: TDBXContext;
  Connection: TDBXConnection; MorphicCommand: TDBXCommand): TDBXCommand;
begin
  Result := TDBXOdbcCommand.Create(DbxContext, TDBXOdbcConnection(Connection));
end;

procedure TDBXOdbcDriver.Close;
begin
  inherited;
end;

function TDBXOdbcDriver.CreateConnection(ConnectionBuilder: TDBXConnectionBuilder): TDBXConnection;
var
  ConnectionHandle: OdbcHandle;
  ErrorCode:  SmallInt;
begin
  LoadDriver(ConnectionBuilder.DbxContext);
  if not Assigned(FEnvironmentHandle) then
  begin
    ErrorCode := FMethodTable.SQLAllocHandle(SQL_HANDLE_ENV, SQLHANDLE(SQL_NULL_HANDLE), SQLHANDLE(FEnvironmentHandle));
    CheckResult(ErrorCode);
    ErrorCode := FMethodTable.SQLSetEnvAttr(FEnvironmentHandle, SQL_ATTR_ODBC_VERSION, SQLPOINTER(SQL_OV_ODBC3), 0);
    CheckResult(ErrorCode);
  end;
  ErrorCode := FMethodTable.SQLAllocHandle(SQL_HANDLE_DBC, FEnvironmentHandle, SQLHANDLE(ConnectionHandle));
  CheckResult(ErrorCode);
  Result := TDBXOdbcConnection.Create(ConnectionBuilder, FEnvironmentHandle, ConnectionHandle, FMethodTable);
end;

procedure TDBXOdbcDriver.LoadDriver(DBXContext: TDBXContext);
var
  LibraryHandle: HModule;
begin
  if not Assigned(FMethodTable) then
  begin
    LibraryHandle := LoadLibrary(sVendorLib);
    if LibraryHandle = HModule(0) then
      DBXContext.Error(TDBXErrorCodes.DriverInitFailed, Format(sDLLLoadError, [sVendorLib, GetLastError]));
    FMethodTable := TDBXOdbcMethodTable.Create(LibraryHandle);
    try
      FMethodTable.LoadMethods;
      FDBXContext := DBXContext;
    except
      on EDBXError: TDBXError do
      begin
        DBXContext.OnError(EDBXError);
        raise;
      end;
    end;
  end;
end;

constructor TDBXOdbcDriver.Create(DriverDef: TDBXDriverDef);
var
  Props: TDBXOdbcProperties;
  I, Index: Integer;
begin
  Props := TDBXOdbcProperties.Create(DriverDef.FDBXContext);
  if DriverDef.FDriverProperties <> nil then
  begin
    for I := 0 to DriverDef.FDriverProperties.Count - 1 do
    begin
      Index := Props.Properties.IndexOfName(DriverDef.FDriverProperties.Properties.Names[I]);
      if Index > -1 then
        Props.Properties.Strings[Index] := DriverDef.FDriverProperties.Properties.Strings[I];
    end;
    Props.AddUniqueProperties(DriverDef.FDriverProperties.Properties);
    DriverDef.FDriverProperties.AddUniqueProperties(Props.Properties);
  end;
  inherited Create(DriverDef);
  rcs;
  FMethodTable := nil;
  FEnvironmentHandle := nil;
  // '' makes this the default command factory.
  AddCommandFactory('', CreateOdbcCommand);
  InitDriverProperties(Props);
  if (DriverProperties = nil) or not DriverProperties.GetBoolean(TDBXPropertyNames.AutoUnloadDriver) then
    CacheUntilFinalization;
end;

constructor TDBXOdbcDriver.Create(DriverDef: TDBXDriverDef; MethodTable: TDBXOdbcMethodTable);
begin
  Create(DriverDef);
  FMethodTable := MethodTable;
  FEnvironmentHandle := nil;
end;

destructor TDBXOdbcDriver.Destroy;
var
  ErrorCode:  SmallInt;
begin
  if Assigned(FEnvironmentHandle) then
  begin
    ErrorCode := FMethodTable.SQLFreeHandle(SQL_HANDLE_ENV, FEnvironmentHandle);
    CheckResult(ErrorCode);
  end;
  FEnvironmentHandle := nil;
  FreeAndNil(FMethodTable);
  inherited Destroy;
end;

procedure TDBXOdbcDriver.GetDriverPropertyNames(List: TStrings);
begin
  List.Add(TDBXPropertyNames.DriverUnit);
  List.Add(TDBXPropertyNames.MetaDataPackageLoader);
end;

function TDBXOdbcDriver.GetDriverVersion: UnicodeString;
begin
  Result := DBXVersion40;
end;

procedure TDBXOdbcConnection.CheckResult(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_DBC, FConnectionHandle);
end;

function TDBXOdbcConnection.CreateAndBeginTransaction(const Isolation: TDBXIsolation): TDBXTransaction;
var
  ErrorCode: SmallInt;
begin
  Inc(FTransactionId);
  ErrorCode := FMethodTable.SQLSetConnectAttr(FConnectionHandle, SQL_ATTR_AUTOCOMMIT, SQLPOINTER(SQL_AUTOCOMMIT_OFF), 0);
  CheckResult(ErrorCode);
  Result := TDBXOdbcTransaction.Create(Self, Isolation, FTransactionId);
end;

procedure TDBXOdbcConnection.Commit(const InTransaction: TDBXTransaction);
var
  ErrorCode: SmallInt;
begin
  ErrorCode :=  FMethodTable.SQLEndTran(SQL_HANDLE_DBC, FConnectionHandle, SQL_COMMIT);
  CheckResult(ErrorCode);
  Dec(FTransactionId);
  if FTransactionId = 0 then
  begin
    ErrorCode := FMethodTable.SQLSetConnectAttr(FConnectionHandle, SQL_ATTR_AUTOCOMMIT, SQLPOINTER(SQL_AUTOCOMMIT_ON), 0);
    CheckResult(ErrorCode);
  end;
end;

procedure TDBXOdbcConnection.DerivedClose;
var
  ErrorCode: SmallInt;
begin
  ErrorCode := FMethodTable.SQLDisconnect(FConnectionHandle);
  CheckResult(ErrorCode);
end;

procedure TDBXOdbcConnection.DerivedGetCommands(const CommandType: UnicodeString; const List: TStrings);
begin
end;

procedure TDBXOdbcConnection.DerivedGetCommandTypes(const List: TStrings);
begin
end;

procedure TDBXOdbcConnection.DerivedOpen;
var
  DataSourceName, UserName, Password, ConnectionString, IsolationLevel: string;
  ErrorCode: SmallInt;
  BufLen: SmallInt;
  Isolation: LongWord;
begin
  DataSourceName := FConnectionProperties.Values[TDBXPropertyNames.Database];
  UserName := FConnectionProperties.Values[TDBXPropertyNames.UserName];
  Password := FConnectionProperties.Values[TDBXPropertyNames.Password];
  ConnectionString := FConnectionProperties.Values[TDBXPropertyNames.ConnectionString];
  if ConnectionString <> '' then
    ErrorCode := FMethodTable.SQLDriverConnect(FConnectionHandle, 0, PSqlWChar(ConnectionString),
                                               Length(ConnectionString), nil, 0, BufLen, SQL_DRIVER_NOPROMPT)
  else
    ErrorCode := FMethodTable.SQLConnect(FConnectionHandle, PSqlWChar(DataSourceName), Length(DataSourceName),
                                         PSqlWChar(UserName), Length(UserName), PSqlWChar(Password), Length(Password));
  CheckResult(ErrorCode);
  IsolationLevel := LowerCase(FConnectionProperties.Values[TDBXPropertyNames.IsolationLevel]);
  if IsolationLevel = 'repeatableread' then
    Isolation := SQL_TXN_REPEATABLE_READ
  else if IsolationLevel = 'dirtyread' then
    Isolation := SQL_TXN_READ_UNCOMMITTED
  else if IsolationLevel = 'serializable' then
    Isolation := SQL_TXN_SERIALIZABLE
  else
    Isolation := SQL_TXN_READ_COMMITTED;
  ErrorCode := FMethodTable.SQLSetConnectAttr(FConnectionHandle, SQL_ATTR_TXN_ISOLATION, SqlPointer(Isolation), 0);
  CheckResult(ErrorCode);
end;

function TDBXOdbcConnection.GetDatabaseMetaData: TDBXDatabaseMetaData;
begin
  Result := inherited GetDatabaseMetaData;
end;

function TDBXOdbcConnection.GetProductName: UnicodeString;
var
  ActualLength, BufLen, ErrorCode: SmallInt;
  ProductName: TBytes;
begin
  Result := '';
  ErrorCode := FMethodTable.SQLGetInfo(FConnectionHandle, SQL_DBMS_NAME, nil, 0, ActualLength);
  CheckResult(ErrorCode);
  BufLen := (ActualLength+1) * SizeOf(Char);
  SetLength(ProductName, BufLen);
  ErrorCode := FMethodTable.SQLGetInfo(FConnectionHandle, SQL_DBMS_NAME, SQLPointer(@ProductName[0]), BufLen, ActualLength);
  CheckResult(ErrorCode);
  Result := Trim(TDBXPlatform.BytesToWideStr(ProductName));
end;

function TDBXOdbcConnection.GetProductVersion: UnicodeString;
var
  ActualLength, ErrorCode: SmallInt;
  Version: TBytes;
begin
  Result := '';
  //The version is of the form ##.##.####
  SetLength(Version, 11*SizeOf(Char));
  ErrorCode := FMethodTable.SQLGetInfo(FConnectionHandle, SQL_DBMS_VER, SQLPointer(@Version[0]), 11*SizeOf(Char), ActualLength);
  CheckResult(ErrorCode);
  Result := Trim(TDBXPlatform.BytesToWideStr(Version));
end;

procedure TDBXOdbcConnection.Rollback(const InTransaction: TDBXTransaction);
var
  ErrorCode: SmallInt;
begin
  ErrorCode :=  FMethodTable.SQLEndTran(SQL_HANDLE_DBC, FConnectionHandle, SQL_ROLLBACK);
  CheckResult(ErrorCode);
  Dec(FTransactionId);
  if FTransactionId = 0 then
  begin
    ErrorCode := FMethodTable.SQLSetConnectAttr(FConnectionHandle, SQL_ATTR_AUTOCOMMIT, SQLPOINTER(SQL_AUTOCOMMIT_ON), 0);
    CheckResult(ErrorCode);
  end;
end;

constructor TDBXOdbcConnection.Create(ConnectionBuilder: TDBXConnectionBuilder;
      EnvironmentHandle, ConnectionHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
begin
  inherited Create(ConnectionBuilder);
  FEnvironmentHandle := EnvironmentHandle;
  FConnectionHandle := ConnectionHandle;
  FMethodTable := MethodTable;
  FTransactionId := 0;
end;

destructor TDBXOdbcConnection.Destroy;
var
  ErrorCode:  SmallInt;
begin
  if IsOpen then
    Close;
  if Assigned(FConnectionHandle) then
  begin
    ErrorCode := FMethodTable.SQLFreeHandle(SQL_HANDLE_DBC, FConnectionHandle);
    CheckResult(ErrorCode);
  end;
  FConnectionHandle := nil;
  FMethodTable := nil;
  FEnvironmentHandle := nil;
  inherited Destroy;
end;

function TDBXOdbcConnection.GetVendorProperty(const Name: string): UnicodeString;
begin
  if Name = 'DriverName' then
    Result := 'Odbc'
  else
    Result := '';
end;

function GetCDataTypeFromDbxType(DataType, SubType: SmallInt): SmallInt;
begin
  case DataType of
    TDBXDataTypes.DateType: Result := SQL_C_DATE;
    TDBXDataTypes.BlobType:
      begin
        case SubType of
          TDBXSubDataTypes.MemoSubType: Result := SQL_C_CHAR;
          TDBXSubDataTypes.WideMemoSubType: Result := SQL_C_WCHAR;
          else
            Result := SQL_C_BINARY;
        end;
      end;
    TDBXDataTypes.BooleanType: Result := SQL_C_BIT;
    TDBXDataTypes.Int16Type: Result := SQL_C_SHORT;
    TDBXDataTypes.Int32Type: Result := SQL_C_LONG;
    TDBXDataTypes.DoubleType, TDBXDataTypes.SingleType: Result := SQL_C_DOUBLE;
    TDBXDataTypes.BytesType, TDBXDataTypes.VarBytesType, TDBXDataTypes.BinaryBlobType:
      Result := SQL_C_BINARY;
    TDBXDataTypes.TimeType: Result := SQL_C_TIME;
    TDBXDataTypes.DateTimeType: Result := SQL_C_TIMESTAMP;
    TDBXDataTypes.UInt16Type: Result := SQL_C_USHORT;
    TDBXDataTypes.UInt32Type: Result := SQL_C_ULONG;
    TDBXDataTypes.Int64Type: Result := SQL_C_SBIGINT;
    TDBXDataTypes.UInt64Type: Result := SQL_C_UBIGINT;
    TDBXDataTypes.TimeStampType: Result := SQL_C_TIMESTAMP;
    TDBXDataTypes.WideStringType: Result := SQL_C_WCHAR;
    TDBXDataTypes.Int8Type: Result := SQL_C_STINYINT;
    TDBXDataTypes.UInt8Type: Result := SQL_C_UTINYINT;
    else
      Result := SQL_C_CHAR;
  end;
end;

function GetSqlDataTypeFromDbxType(DataType, SubType: SmallInt): SmallInt;
begin
  case DataType of
    TDBXDataTypes.AnsiStringType:
      begin
        case SubType of
          TDBXSubDataTypes.FixedSubType: Result := SQL_CHAR;
          else
            Result := SQL_VARCHAR;
        end;
      end;
    TDBXDataTypes.DateType: Result := SQL_TYPE_DATE;
    TDBXDataTypes.BlobType:
      begin
        case SubType of
          TDBXSubDataTypes.MemoSubType: Result := SQL_LONGVARCHAR;
          TDBXSubDataTypes.WideMemoSubType: Result := SQL_WLONGVARCHAR;
          else
            Result := SQL_LONGVARBINARY;
        end;
      end;
    TDBXDataTypes.BooleanType: Result := SQL_BIT;
    TDBXDataTypes.Int16Type: Result := SQL_SMALLINT;
    TDBXDataTypes.Int32Type: Result := SQL_INTEGER;
    TDBXDataTypes.DoubleType: Result := SQL_DOUBLE;
    TDBXDataTypes.BcdType: Result := SQL_NUMERIC;
    TDBXDataTypes.BytesType: Result := SQL_BINARY;
    TDBXDataTypes.TimeType: Result := SQL_TYPE_TIME;
    TDBXDataTypes.VarBytesType: Result := SQL_VARBINARY;
    TDBXDataTypes.Int64Type: Result := SQL_BIGINT;
    TDBXDataTypes.TimeStampType: Result := SQL_TYPE_TIMESTAMP;
    TDBXDataTypes.WideStringType:
      begin
        case SubType of
          TDBXSubDataTypes.FixedSubType: Result := SQL_WCHAR;
          else
            Result := SQL_WVARCHAR;
        end;
      end;
    TDBXDataTypes.SingleType: Result := SQL_REAL;
    TDBXDataTypes.Int8Type: Result := SQL_TINYINT;
    TDBXDataTypes.BinaryBlobType: Result := SQL_LONGVARBINARY;
    else
      Result := SQL_CHAR;
  end;
end;

procedure TDBXOdbcCommand.BindParameters;
  function GetOdbcParameterDirection(DbxParamDirection: Word): Word;
  begin
    case DBXParamDirection of
      TDBXParameterDirections.InParameter: Result := SQL_PARAM_INPUT;
      TDBXParameterDirections.OutParameter, TDBXParameterDirections.ReturnParameter:
        Result := SQL_PARAM_OUTPUT;
      TDBXParameterDirections.InOutParameter: Result := SQL_PARAM_INPUT_OUTPUT;
      else
        Result := SQL_PARAM_TYPE_UNKNOWN;
    end;
  end;
var
  I: Integer;
  ErrorCode: SmallInt;
  Size: SQLULEN;
  BufLength: Int64;
  LNull: SQLLEN;
begin
  LNull := SQL_NULL_DATA;
  if not Assigned(FParameterRow) then
    CreateParameterRow;
  SetLength(FParameterRow.FOffsets, FParameters.Count);
  BufLength := 0;
  for I := 0 to FParameters.Count - 1 do
  begin
    FParameterRow.FOffsets[I] := BufLength;
    case FParameters[I].DataType of
      TDBXDataTypes.BlobType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
            BufLength := BufLength + SizeOf(Integer) + FParameterRow.FIndicatorSize
          else
            BufLength := BufLength + FParameters[I].Precision + FParameterRow.FIndicatorSize;
        end;
      //Do not include the null terminator for string types
      TDBXDataTypes.AnsiStringType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
          begin
            if FParameters[I].Size > 0 then
              BufLength := BufLength + FParameters[I].Size - SizeOf(AnsiChar) + FParameterRow.FIndicatorSize
            else
              BufLength := BufLength + FParameterRow.FIndicatorSize;
          end
          else
            BufLength := BufLength + FParameters[I].Precision + FParameterRow.FIndicatorSize;
        end;
        TDBXDataTypes.WideStringType:
          begin
            if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
               (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
            begin
              if FParameters[I].Size > 0 then
                BufLength := BufLength + FParameters[I].Size - SizeOf(Char) + FParameterRow.FIndicatorSize
              else
                BufLength := BufLength + FParameterRow.FIndicatorSize;
            end
            else
              BufLength := BufLength + (FParameters[I].Precision * SizeOf(Char)) + FParameterRow.FIndicatorSize;
          end;
        TDBXDataTypes.BcdType:
          begin
            FParameters[I].Precision := FParameters[I].Value.AsBcd.Precision;
            FParameters[I].Scale := FParameters[I].Value.AsBcd.SignSpecialPlaces;
            FParameters[I].Size := Length(FParameters[I].Value.AsString) + SizeOf(AnsiChar);
            BufLength := BufLength + FParameters[I].Size - SizeOf(AnsiChar) + FParameterRow.FIndicatorSize;
          end;
        TDBXDataTypes.BytesType, TDBXDataTypes.VarBytesType:
          begin
            if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
               (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
            begin
              if FParameters[I].Size > 0 then
                BufLength := BufLength + FParameters[I].Size + FParameterRow.FIndicatorSize
              else
                BufLength := BufLength + FParameterRow.FIndicatorSize;
            end
            else
              BufLength := BufLength + (FParameters[I].Precision * SizeOf(Char)) + FParameterRow.FIndicatorSize;
          end
    else
      BufLength := BufLength + GetTypeSize(FParameters[I].DataType) + FParameterRow.FIndicatorSize;
    end;
  end;
  if Assigned(FParameterRow.FBlock) then
    FParameterRow.FBlock.Free;
  FParameterRow.FBlock := TDBXOdbcBlockMgr.Create(BufLength, 1);
  for I := 0 to FParameters.Count - 1 do
  begin
    case FParameters[I].DataType of
      TDBXDataTypes.BlobType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
            ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                       GetCDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       FParameters[I].Precision, FParameters[I].Scale,
                                                       SQLPOINTER(I), SizeOf(Integer),
                                                       PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+SizeOf(Integer)]))
          else
            ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                       GetCDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       FParameters[I].Precision, FParameters[I].Scale,
                                                       SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                       FParameters[I].Precision,
                                                       PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision]));
        end;
      TDBXDataTypes.AnsiStringType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
          begin
            if FParameters[I].Precision <= 0 then
              FParameters[I].Precision := FParameters[I].Size - SizeOf(AnsiChar);
            if FParameters[I].Size > 0 then
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_CHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         FParameters[I].Size-SizeOf(AnsiChar),
                                                         PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Size-SizeOf(AnsiChar)]))
            else
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_CHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         0,
                                                         PSqlLen(@LNull));
          end
          else
            ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                       SQL_C_CHAR,
                                                       GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       FParameters[I].Precision, FParameters[I].Scale,
                                                       SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                       FParameters[I].Precision,
                                                       PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision]));
        end;
      TDBXDataTypes.WideStringType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
          begin
            if FParameters[I].Precision <= 0 then
              FParameters[I].Precision := FParameters[I].Size - SizeOf(Char);
            if FParameters[I].Size > 0 then
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_WCHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         FParameters[I].Size-SizeOf(Char),
                                                         PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Size-SizeOf(Char)]))
            else
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_WCHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         0,
                                                         PSqlLen(@LNull));
          end
          else
            ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                       SQL_C_WCHAR,
                                                       GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       FParameters[I].Precision, FParameters[I].Scale,
                                                       SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                       FParameters[I].Precision*SizeOf(Char),
                                                       PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision*SizeOf(Char)]));
        end;
      TDBXDataTypes.BcdType:
        begin
          if FParameters[I].Precision <= 0 then
            FParameters[I].Precision := FParameters[I].Size;
          Size := Length(FParameters[I].Value.AsString);
          ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                     GetCDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                     GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                     FParameters[I].Precision, FParameters[I].Scale,
                                                     SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                     Size,
                                                     PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+Size]));
        end;
      TDBXDataTypes.BytesType, TDBXDataTypes.VarBytesType:
        begin
          if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
             (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter) then
          begin
            if FParameters[I].Precision <= 0 then
              FParameters[I].Precision := FParameters[I].Size;
            if FParameters[I].Size > 0 then
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_WCHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         FParameters[I].Size,
                                                         PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Size]))
            else
              ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                         SQL_C_WCHAR,
                                                         GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                         FParameters[I].Precision, FParameters[I].Scale,
                                                         SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                         0,
                                                         PSqlLen(@LNull));
          end
          else
            ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                       SQL_C_WCHAR,
                                                       GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                       FParameters[I].Precision, FParameters[I].Scale,
                                                       SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                       FParameters[I].Precision*SizeOf(Char),
                                                       PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision*SizeOf(Char)]));
        end
    else
    begin
      if FParameters[I].Precision <= 0 then
        FParameters[I].Precision := FParameters[I].Size;
      Size := GetTypeSize(FParameters[I].DataType);
      ErrorCode := FMethodTable.SQLBindParameter(FCommandHandle, I+1, GetOdbcParameterDirection(FParameters[I].ParameterDirection),
                                                 GetCDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                 GetSqlDataTypeFromDbxType(FParameters[I].DataType, FParameters[I].SubType),
                                                 FParameters[I].Precision, FParameters[I].Scale,
                                                 SQLPOINTER(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]]),
                                                 Size,
                                                 PSqlLen(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+Size]));
    end;
    end;
    CheckResult(ErrorCode);
  end;
end;

procedure TDBXOdbcCommand.CheckResult(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_STMT, FCommandHandle);
end;

procedure TDBXOdbcCommand.CheckResultConnHandle(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_DBC, FConnectionHandle);
end;

procedure TDBXOdbcCommand.ExecuteCatalogFunction;
var
  ErrorCode: SmallInt;
  Catalog, Schema, Table, ProcName, TableType: string;
begin
  if Text = 'GetIndexes' then
  begin
    Table := Parameters[0].Value.AsString;
    ErrorCode := FMethodTable.SQLStatistics(FCommandHandle, nil, 0,
                                            nil, 0,
                                            PSqlWChar(Table), Length(Table),
                                            SQL_INDEX_ALL, SQL_QUICK);
  end
  else if Text = 'GetDataTypes' then
    ErrorCode := FMethodTable.SQLGetTypeInfo(FCommandHandle, SQL_ALL_TYPES)
  else if Text = 'GetCatalogs' then
  begin
    Catalog := SQL_ALL_CATALOGS;
    Schema := '';
    Table := '';
    TableType := '';
    ErrorCode := FMethodTable.SQLTables(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                        PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table), nil, 0);
  end
  else if Text = 'GetSchemas' then
  begin
    Catalog := '';
    Schema := SQL_ALL_SCHEMAS;
    Table := '';
    TableType := '';
    ErrorCode := FMethodTable.SQLTables(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                        PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table), nil, 0);
  end
  else if Text = 'GetTables' then
  begin
    Catalog := '';
    Schema := '';
    Table := Parameters[0].Value.AsString;
    TableType := '';
    ErrorCode := FMethodTable.SQLTables(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                        PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table), PSqlWChar(TableType), Length(TableType));
  end
  else if Text = 'GetViews' then
  begin
    Catalog := '';
    Schema := '';
    Table := '';
    TableType := 'VIEW';
    ErrorCode := FMethodTable.SQLTables(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                        PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table), PSqlWChar(TableType), Length(TableType));
  end
  else if Text = 'GetSynonyms' then
  begin
    Catalog := '';
    Schema := '';
    Table := '';
    TableType := 'SYNONYM';
    ErrorCode := FMethodTable.SQLTables(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                        PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table), PSqlWChar(TableType), Length(TableType));
  end
  else if Text = 'GetColumns' then
  begin
    Catalog := '';
    Schema := '';
    Table := Parameters[0].Value.AsString;
    ErrorCode := FMethodTable.SQLColumns(FCommandHandle, PSqlWChar(Catalog), Length(Catalog),
                                         PSqlWChar(Schema), Length(Schema), PSqlWChar(Table), Length(Table),
                                         nil, 0);
  end
  else if Text = 'GetForeignKeys' then
  begin
    Catalog := '';
    Schema := '';
    Table := Parameters[0].Value.AsString;
    ErrorCode := FMethodTable.SQLForeignKeys(FCommandHandle, nil, 0, nil, 0, nil, 0,
                                             PSqlWChar(Catalog), Length(Catalog), PSqlWChar(Schema), Length(Schema),
                                             PSqlWChar(Table), Length(Table));
  end
  else if Text = 'GetProcedures' then
  begin
    Catalog := '';
    Schema := '';
    ProcName := '';
    ErrorCode := FMethodTable.SQLProcedures(FCommandHandle, PSqlWChar(Catalog), Length(Catalog), PSqlWChar(Schema), Length(Schema), PSqlWChar(ProcName), Length(ProcName));
  end
  else if Text = 'GetProcedureParameters' then
  begin
    Catalog := '';
    Schema := '%';
    ProcName := Parameters[0].Value.AsString;
    ErrorCode := FMethodTable.SQLProcedureColumns(FCommandHandle, PSqlWChar(Catalog), Length(Catalog), PSqlWChar(Schema), Length(Schema),
                                                  PSqlWChar(ProcName), Length(ProcName), nil, 0);
  end
  else
    ErrorCode := 0;
  CheckResult(ErrorCode);
end;

function TDBXOdbcCommand.IsFunction: Boolean;
var
  ErrorCode, ProcedureType: SmallInt;
  CatalogName, SchemaName, ProcName: string;
  MetaDataCommand: TDBXOdbcCommand;
  MetaDataByteReader: TDBXOdbcByteReader;
  MetaDataReader: TDBXOdbcReader;
begin
  Result := False;
  MetaDataCommand := TDBXOdbcCommand.Create(FDBXContext, FOdbcConnection);
  try
    MetaDataCommand.Open;
    CatalogName := '';
    SchemaName := '';
    ProcName := StringReplace(Text,FOdbcConnection.GetDatabaseMetaData.QuoteChar,'',[rfReplaceAll]);
    ErrorCode := MetaDataCommand.FMethodTable.SQLProcedures(MetaDataCommand.FCommandHandle, PSqlWChar(CatalogName), Length(CatalogName), PSqlWChar(SchemaName), Length(SchemaName), PSqlWChar(ProcName), Length(ProcName));
    MetaDataCommand.CheckResult(ErrorCode);
    MetaDataByteReader := TDBXOdbcByteReader.Create(FDBXContext, FEnvironmentHandle, FConnectionHandle, MetaDataCommand.FCommandHandle, FMethodTable);
    MetaDataReader := TDBXOdbcReader.Create(FDBXContext, FEnvironmentHandle, FConnectionHandle, MetaDataCommand.FCommandHandle, FMethodTable, MetaDataByteReader, 8, FRowSetSize);
    try
      MetaDataReader.Next;
      ProcedureType := MetaDataReader.Values[7].AsInt32;
    finally
      FreeAndNil(MetaDataReader);
    end;
  finally
    FreeAndNil(MetaDataCommand);
  end;
  if ProcedureType = SQL_PT_FUNCTION then
    Result := True;
end;

function TDBXOdbcCommand.GetNumberOfColumns: Int64;
var
  ErrorCode, NumCols: SmallInt;
begin
  ErrorCode := FMethodTable.SQLNumResultCols(FCommandHandle, NumCols);
  CheckResult(ErrorCode);
  Result := NumCols;
end;

procedure TDBXOdbcCommand.PutBlobs;
var
  ErrorCode: SmallInt;
  I: Integer;
  Size: Int64;
  Bytes: TBytes;
  ValuePtrBuffer: TBytes;
begin
  SetLength(ValuePtrBuffer, SizeOf(NativeInt));
  for I := 0 to FParameters.Count - 1 do
  begin
    if (FParameters[I].DataType = TDBXDataTypes.BlobType) and
       ((FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
       (FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter)) and
       not (FParameters[I].Value.IsNull) then
    begin
      Size := FParameters[I].Value.GetValueSize;
      SetLength(Bytes, Size);
      FParameters[I].Value.GetBytes(0, Bytes, 0, Size);
      ErrorCode := FMethodTable.SQLPutData(FCommandHandle, SQLPOINTER(@Bytes[0]), Size);
      CheckResult(ErrorCode);
      ErrorCode := FMethodTable.SQLParamData(FCommandHandle, SQLPOINTER(@ValuePtrBuffer[0]));
      CheckResult(ErrorCode);
    end;
  end;
end;

procedure TDBXOdbcCommand.SetParameterValues;
var
  I: Integer;
  Size: Int64;
  TimeStamp: TSQLTimeStamp;
  Bytes: TBytes;
begin
  for I := 0 to FParameters.Count - 1 do
  begin
    if (FParameters[I].ParameterDirection = TDBXParameterDirections.InParameter) or
       ((FParameters[I].ParameterDirection = TDBXParameterDirections.InOutParameter)) then
    begin
      if FParameters[I].Value.IsNull then
        FParameterRow.SetNull(FParameters[I].Value)
      else
      begin
        case FParameters[I].DataType of
          TDBXDataTypes.AnsiStringType, TDBXDataTypes.BcdType:
            FParameterRow.SetString(TDBXAnsiStringValue(FParameters[I].Value), AnsiString(FParameters[I].Value.AsString));
          TDBXDataTypes.DateType:
            FParameterRow.SetDate(TDBXDateValue(FParameters[I].Value), FParameters[I].Value.AsDate);
          TDBXDataTypes.BlobType, TDBXDataTypes.BinaryBlobType:
            begin
              Size := FParameters[I].Value.GetValueSize;
              PInteger(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+SizeOf(Integer)])^ := SQL_LEN_DATA_AT_EXEC(Size);
            end;
          TDBXDataTypes.Int16Type, TDBXDataTypes.BooleanType:
            FParameterRow.SetInt16(TDBXInt16Value(FParameters[I].Value), FParameters[I].Value.AsInt16);
          TDBXDataTypes.Int32Type:
            FParameterRow.SetInt32(TDBXInt32Value(FParameters[I].Value), FParameters[I].Value.AsInt32);
          TDBXDataTypes.DoubleType:
            FParameterRow.SetDouble(TDBXDoubleValue(FParameters[I].Value), FParameters[I].Value.AsDouble);
          TDBXDataTypes.BytesType, TDBXDataTypes.VarBytesType:
            begin
              Size := FParameters[I].Value.GetValueSize;
              SetLength(Bytes, Size);
              FParameters[I].Value.GetBytes(0, Bytes, 0, Size);
              FParameterRow.SetDynamicBytes(FParameters[I].Value, 0, Bytes, 0, Size);
            end;
          TDBXDataTypes.TimeType:
            FParameterRow.SetTime(TDBXTimeValue(FParameters[I].Value), FParameters[I].Value.AsTime);
          TDBXDataTypes.Int64Type:
            FParameterRow.SetInt64(TDBXInt64Value(FParameters[I].Value), FParameters[I].Value.AsInt64);
          TDBXDataTypes.TimeStampType:
            begin
              TimeStamp := FParameters[I].Value.AsTimeStamp;
              FParameterRow.SetTimestamp(TDBXTimeStampValue(FParameters[I].Value), TimeStamp);
            end;
          TDBXDataTypes.WideStringType:
            FParameterRow.SetWideString(TDBXWideStringValue(FParameters[I].Value), FParameters[I].Value.AsString);
          TDBXDataTypes.SingleType:
            FParameterRow.SetSingle(TDBXSingleValue(FParameters[I].Value), FParameters[I].Value.AsSingle);
          TDBXDataTypes.Int8Type:
            FParameterRow.SetInt8(TDBXInt8Value(FParameters[I].Value), FParameters[I].Value.AsInt8);
          else
            raise TDBXError.Create(TDBXErrorCodes.InvalidParameter, SDBXErrInvalidParameter);
        end;
      end;
    end
    else
    begin
      case FParameters[I].DataType of
        TDBXDataTypes.AnsiStringType, TDBXDataTypes.BlobType, TDBXDataTypes.BinaryBlobType:
          PInteger(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision])^ := FParameters[I].Precision;
        TDBXDataTypes.BcdType: PInteger(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+SizeOf(TBcd)])^ := SizeOf(TBcd);
        TDBXDataTypes.WideStringType: PInteger(@FParameterRow.FBlock.Buffer[FParameterRow.FOffsets[I]+FParameters[I].Precision*SizeOf(Char)])^ := FParameters[I].Precision*SizeOf(Char);
      end;
    end;
  end;
end;

procedure TDBXOdbcCommand.SetRowsAffected;
var
  ErrorCode: SmallInt;
  RowsAffected: SQLLEN;
begin
  ErrorCode := FMethodTable.SQLRowCount(FCommandHandle, RowsAffected);
  CheckResult(ErrorCode);
  FRowsAffected := RowsAffected;
end;

function TDBXOdbcCommand.CreateParameterRow: TDBXRow;
begin
  FParameterRow := TDBXOdbcRow.Create(FDBXContext, FEnvironmentHandle, FConnectionHandle, FCommandHandle, FMethodTable);
  Result := FParameterRow;
end;

procedure TDBXOdbcCommand.DerivedClose;
var
  ErrorCode: SmallInt;
begin
  FRowsAffected := 0;
  if Assigned(FCommandHandle) then
  begin
    ErrorCode := FMethodTable.SQLFreeHandle(SQL_HANDLE_STMT, FCommandHandle);
    CheckResult(ErrorCode);
  end;
  FCommandHandle := nil;
end;

function TDBXOdbcCommand.DerivedExecuteQuery: TDBXReader;
var
  ErrorCode: SmallInt;
  ByteReader: TDBXOdbcByteReader;
  NumCols: Int64;
begin
  Result := nil;
  if CommandType = TDBXCommandTypes.DbxMetaData then
    ExecuteCatalogFunction
  else
  begin
    if Assigned(FParameters) and (FParameters.Count > 0) then
    begin
      BindParameters;
      SetParameterValues;
    end;
    if not isPrepared then
      ErrorCode := FMethodTable.SQLExecDirect(FCommandHandle, PSqlWChar(Text), Length(Text))
    else
      ErrorCode := FMethodTable.SQLExecute(FCommandHandle);
    if ErrorCode = SQL_NEED_DATA then
      PutBlobs
    else
      CheckResult(ErrorCode);
  end;
  SetRowsAffected;
  NumCols := GetNumberOfColumns;
  if NumCols > 0 then
  begin
    ByteReader := TDBXOdbcByteReader.Create(FDBXContext, FEnvironmentHandle, FConnectionHandle, FCommandHandle, FMethodTable);
    Result := TDBXOdbcReader.Create(FDBXContext, FEnvironmentHandle, FConnectionHandle, FCommandHandle, FMethodTable, ByteReader, NumCols, FRowSetSize);
  end;
end;

procedure TDBXOdbcCommand.DerivedExecuteUpdate;
var
  ErrorCode: SmallInt;
begin
  if Assigned(FParameters) and (FParameters.Count > 0) then
  begin
    BindParameters;
    SetParameterValues;
  end;
  if not isPrepared then
    ErrorCode := FMethodTable.SQLExecDirect(FCommandHandle, PSqlWChar(Text), Length(Text))
  else
    ErrorCode := FMethodTable.SQLExecute(FCommandHandle);
  if ErrorCode = SQL_NEED_DATA then
    PutBlobs
  else
    CheckResult(ErrorCode);
  SetRowsAffected;
end;

function TDBXOdbcCommand.DerivedGetNextReader: TDBXReader;
begin
    Result := nil;
end;

procedure TDBXOdbcCommand.DerivedOpen;
var
  ErrorCode: SmallInt;
begin
  ErrorCode := FMethodTable.SQLAllocHandle(SQL_HANDLE_STMT, SQLHANDLE(FConnectionHandle), SQLHANDLE(FCommandHandle));
  CheckResult(ErrorCode);
  ErrorCode := FMethodTable.SQLSetStmtAttr(FCommandHandle, SQL_ATTR_ROW_ARRAY_SIZE, SQLPOINTER(FRowSetSize), 0);
  CheckResult(ErrorCode);
end;

procedure TDBXOdbcCommand.DerivedPrepare;
var
  ErrorCode, NumParams: SmallInt;
  StoredProcText: string;
  I, NewLength, BufLength: Integer;
  NewText: TBytes;
begin
  if CommandType = TDBXCommandTypes.DbxStoredProcedure then
  begin
    NumParams := FParameters.Count;
    if IsFunction then
    begin
      StoredProcText := '{ ? = CALL ' + Text + '(';
      Dec(NumParams);
    end
    else
      StoredProcText := '{ CALL ' + Text + '(';
    for I := 1 to NumParams - 1 do
      StoredProcText := StoredProcText + '?, ';
    StoredProcText := StoredProcText + '?) }';
    //Some ODBC drivers do not support passing a null pointer to retrieve the length.
    SetLength(NewText, 4);
    ErrorCode := FMethodTable.SQLNativeSql(FConnectionHandle, PSqlWChar(StoredProcText), Length(StoredProcText),
                                           PSqlWChar(NewText), 2, NewLength);
    CheckResultConnHandle(ErrorCode);
    BufLength := (NewLength+1)*SizeOf(Char);
    SetLength(NewText, BufLength);
    ErrorCode := FMethodTable.SQLNativeSql(FConnectionHandle, PSqlWChar(StoredProcText), Length(StoredProcText),
                                           PSqlWChar(NewText), BufLength, NewLength);
    CheckResultConnHandle(ErrorCode);
    ErrorCode := FMethodTable.SQLPrepare(FCommandHandle, PSqlWChar(StoredProcText), Length(StoredProcText));
  end
  else if CommandType = TDBXCommandTypes.DbxMetaData then
    //Do nothing
    ErrorCode := 0
  else
    ErrorCode := FMethodTable.SQLPrepare(FCommandHandle, PSqlWChar(Text), Length(Text));
    CheckResult(ErrorCode);
end;

function TDBXOdbcCommand.GetRowsAffected: Int64;
begin
  Result := FRowsAffected;
end;

procedure TDBXOdbcCommand.SetMaxBlobSize(const MaxBlobSize: Int64);
begin

end;

procedure TDBXOdbcCommand.SetRowSetSize(const RowSetSize: Int64);
begin
  FRowSetSize := RowSetSize;
end;

constructor TDBXOdbcCommand.Create(DBXContext: TDBXContext; OdbcConnection: TDBXOdbcConnection);
begin
  inherited Create(DbxContext);
  FEnvironmentHandle := OdbcConnection.EnvironmentHandle;
  FConnectionHandle := OdbcConnection.ConnectionHandle;
  FMethodTable := OdbcConnection.MethodTable;
  FOdbcConnection := OdbcConnection;
  FCommandHandle := nil;
  FRowsAffected := 0;
  FParameterRow := nil;
  FRowSetSize := 20;
end;

destructor TDBXOdbcCommand.Destroy;
begin
  Close;
  FConnectionHandle := nil;
  FEnvironmentHandle := nil;
  FMethodTable := nil;
  FParameterRow := nil;
  FOdbcConnection := nil;
  inherited Destroy;
end;

function TDBXOdbcByteReader.CalculateOffset(ColNum: Integer): Int64;
begin
  Result := FRow.FOffsets[ColNum] + (FRow.FBlock.CurrentRecord - 1) * FRow.FBlock.RowLength;
end;

procedure TDBXOdbcByteReader.CheckResult(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_STMT, FCommandHandle);
end;

constructor TDBXOdbcByteReader.Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
begin
  inherited Create(DBXContext);
  FEnvironmentHandle := EnvironmentHandle;
  FConnectionHandle := ConnectionHandle;
  FCommandHandle := CommandHandle;
  FMethodTable := MethodTable;
  FRow := TDBXOdbcRow.Create(DBXContext, FEnvironmentHandle, FConnectionHandle, FCommandHandle, FMethodTable);
end;

destructor TDBXOdbcByteReader.Destroy;
begin
  FCommandHandle := nil;
  FConnectionHandle := nil;
  FEnvironmentHandle := nil;
  FMethodTable := nil;
  //FRow is shared with TDBXOdbcReader which will free it
  FRow := nil;
  inherited Destroy;
end;

procedure TDBXOdbcByteReader.GetAnsiString(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
var
  ValueLength: Int64;
begin
  ValueLength := Length(Value);
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+ValueLength])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, ValueLength);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetWideString(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
var
  ValueLength: Int64;
begin
  ValueLength := Length(Value);
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+ValueLength])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, ValueLength);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetUInt8(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Byte)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Byte));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetInt8(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(ShortInt)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(ShortInt));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetUInt16(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Word)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Word));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetInt16(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(SmallInt)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(SmallInt));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetInt32(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Int32)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Int32));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetInt64(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Int64)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Int64));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetSingle(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Single)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Single));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetDouble(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Double)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(Double));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetBcd(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
var
  BcdInBytes: TBytes;
  ValueLength: Int64;
begin
  ValueLength := Length(Value);
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+ValueLength])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    BcdInBytes := BcdToBytes(StrToBcd(UnicodeString(AnsiString(PAnsiChar(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)])))));
    TDBXPlatform.CopyByteArray(BcdInBytes, 0, Value, 0, ValueLength);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetTimeStamp(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(TSQLTimeStamp)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(TSQLTimeStamp));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetTimeStampOffset(Ordinal: TInt32;
  const Value: TBytes; Offset: TInt32; var IsNull: LongBool);
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(TSQLTimeStampOffset)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, 0, SizeOf(TSQLTimeStampOffset));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetTime(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
var
  Hour, Minute, Second: Word;
  Time: TDBXTime;
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(SQL_TIME_STRUCT)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Hour := PWord(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)])^;
    Minute := PWord(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Word)])^;
    Second := PWord(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Word)+SizeOf(Word)])^;
    Time := (Hour * 60 + Minute) * MSecsPerSec * SecsPerMin + (Second * MSecsPerSec);
    TDBXPlatform.CopyInt32(Time, Value, 0);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetDate(Ordinal: TInt32; const Value: TBytes;
  Offset: TInt32; var IsNull: LongBool);
var
  Year: SmallInt;
  Month, Day: Word;
  TimeStamp: TTimeStamp;
begin
  if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(SQL_DATE_STRUCT)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Year := PSmallInt(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)])^;
    Month := PWord(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Word)])^;
    Day := PWord(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+SizeOf(Word)+SizeOf(Word)])^;
    TimeStamp := DateTimeToTimeStamp(EncodeDate(Year, Month, Day));
    TDBXPlatform.CopyInt32(TimeStamp.Date, Value, 0);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcByteReader.GetByteLength(Ordinal: TInt32; var Length: Int64;
  var IsNull: LongBool);
var
  Ind: TBytes;
  ErrorCode: SmallInt;
  Buffer: TBytes;
begin
  SetLength(Ind, SizeOf(Integer));
  SetLength(Buffer, 1);
  ErrorCode := FMethodTable.SQLGetData(FCommandHandle, Ordinal+1, GetCDataTypeFromDbxType(TDBXOdbcRow(FRow).FColumnTypes[Ordinal],0),
                                       SQLPointer(@Buffer[0]), 0, PSqlLen(@Ind[0]));
  CheckResult(ErrorCode);
  if PSQLLEN(@Ind[0])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Length := PSQLLEN(@Ind[0])^;
  end
  else
  begin
    IsNull := True;
    Length := 0;
  end;
end;

function TDBXOdbcByteReader.GetBytes(Ordinal: TInt32; Offset: Int64;
  const Value: TBytes; ValueOffset: Int64; Length: Int64;
  var IsNull: LongBool): Int64;
var
  ErrorCode: SmallInt;
  Ind: TBytes;
  Buffer: TBytes;
begin
  SetLength(Ind, SizeOf(Integer));
  SetLength(Buffer, Length);
  case TDBXOdbcRow(FRow).FColumnTypes[Ordinal] of
    TDBXDataTypes.BlobType:
      begin
        ErrorCode := FMethodTable.SQLGetData(FCommandHandle, Ordinal+1, GetCDataTypeFromDbxType(TDBXOdbcRow(FRow).FColumnTypes[Ordinal], 0),
                                             SQLPointer(@Buffer[0]), Length, PSqlLen(@Ind[0]));
        CheckResult(ErrorCode);
        if PSqlLen(@Ind[0])^ <> SQL_NULL_DATA then
        begin
          IsNull := False;
          Result := Min(Length, PSqlLen(@Ind[0])^);
          TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, 0, Value, ValueOffset, Result);
        end
        else
        begin
          IsNull := True;
          Result := 0;
        end;
      end;
    TDBXDataTypes.BytesType, TDBXDataTypes.VarBytesType:
      begin
        if PInteger(@FRow.FBlock.Buffer[CalculateOffset(Ordinal)+Length])^ <> SQL_NULL_DATA then
        begin
          IsNull := False;
          TDBXPlatform.CopyByteArray(FRow.FBlock.Buffer, CalculateOffset(Ordinal), Value, ValueOffset, Length);
          Result := Length;
        end
        else
        begin
          IsNull := True;
          Result := 0;
        end;
      end;
    else
      Result := 0;
  end;
end;

procedure TDBXOdbcReader.CheckResult(ReturnValue: SmallInt);
begin
  if (ReturnValue <> SQL_SUCCESS) and (ReturnValue <> SQL_SUCCESS_WITH_INFO) then
    FMethodTable.RaiseError(FDBXContext, ReturnValue, SQL_HANDLE_STMT, FCommandHandle);
end;

function TDBXOdbcReader.CreateColumn(Ordinal: Word): TDBXWritableValue;
var
  ErrorCode: SmallInt;
  ColumnName: TBytes;
  ActualLength, NameLength, SQLDataType, Scale, Nullable: SmallInt;
  Precision: SQLULEN;
  Column: TDBXValueType;
begin
  //Some ODBC drivers will not return the correct value for the NameLength if passing a nil pointer for ColumnName
  //and some do not return the correct value for the NameLength if it exceeds the length
  //of the buffer that is passed in.
  SetLength(ColumnName, 64);
  ErrorCode := FMethodTable.SQLDescribeCol(FCommandHandle, Ordinal+1, PSqlWChar(ColumnName), 32,
                                           ActualLength, SQLDataType, Precision, Scale, Nullable);
  CheckResult(ErrorCode);
  NameLength := ActualLength+1;
  SetLength(ColumnName, NameLength*SizeOf(Char));
  ErrorCode := FMethodTable.SQLDescribeCol(FCommandHandle, Ordinal+1, PSqlWChar(ColumnName), NameLength,
                                           ActualLength, SQLDataType, Precision, Scale, Nullable);
  CheckResult(ErrorCode);
  Column := TDBXDriverHelp.CreateTDBXValueType(DBXContext);
  Column.Name := TDBXPlatform.BytesToWideStr(ColumnName);
  //Fallback as FieldDefs will require a name
  if Column.Name = '' then
    Column.Name := Format('COLUMN%d', [Ordinal+1]);
  Column.Ordinal := Ordinal;
  Column.Scale := Scale;
  Column.Precision := Precision;
  if Nullable = SQL_NULLABLE then
    Column.ValueTypeFlags := Column.ValueTypeFlags or TDBXValueTypeFlags.Nullable;
  SetTypeInfo(Column, SQLDataType);
  TDBXOdbcRow(FDbxRow).FColumnTypes[Ordinal] := Column.DataType;
  Result := TDBXValue.CreateValue(FDBXContext, Column, FDbxRow, True);
end;

constructor TDBXOdbcReader.Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle;
  MethodTable: TDBXOdbcMethodTable; ByteReader: TDBXOdbcByteReader; NumCols, RowSetSize: Int64);
var
  Values: TDBXWritableValueArray;
  I: Word;
  BufLength: Int64;
  ErrorCode: SmallInt;
begin
  inherited Create(DBXContext, ByteReader.FRow, ByteReader);
  FEnvironmentHandle := EnvironmentHandle;
  FConnectionHandle := ConnectionHandle;
  FCommandHandle := CommandHandle;
  FMethodTable := MethodTable;
  SetLength(Values, NumCols);
  SetLength(ByteReader.FRow.FOffsets, NumCols);
  SetLength(ByteReader.FRow.FColumnTypes, NumCols);
  BufLength := 0;
  for I := 0 to High(Values) do
  begin
    Values[I] := CreateColumn(I);
    TDBXOdbcRow(FDbxRow).FOffsets[I] := BufLength;
    BufLength := BufLength + Values[I].ValueType.Size + TDBXOdbcRow(FDbxRow).FIndicatorSize;
  end;
  SetValues(Values);
  TDBXOdbcRow(FDbxRow).FBlock := TDBXOdbcBlockMgr.Create(BufLength, RowSetSize);
  ErrorCode := FMethodTable.SQLSetStmtAttr(FCommandHandle, SQL_ATTR_ROW_BIND_TYPE, SQLPOINTER(BufLength), 0);
  CheckResult(ErrorCode);
  ErrorCode := FMethodTable.SQLSetStmtAttr(FCommandHandle, SQL_ATTR_ROWS_FETCHED_PTR, SQLPOINTER(@ByteReader.FRow.FBlock.FRowsFetched), 0);
  CheckResult(ErrorCode);
  for I := 0 to High(Values) do
  begin
    //We do not bind columns which we may need to access with SQLGetData.  If we
    //support storing SQL_GETDATA_EXTENSIONS bitmask with metadata, we could bind
    //based on whether SQL_GD_BOUND is supported
    if Values[I].ValueType.DataType <> TDBXDataTypes.BlobType then
    begin
      ErrorCode := FMethodTable.SQLBindCol(FCommandHandle, I+1, GetCDataTypeFromDbxType(Values[I].ValueType.DataType, Values[I].ValueType.SubType),
                                           SQLPOINTER(@TDBXOdbcRow(FDbxRow).FBlock.Buffer[TDBXOdbcRow(FDbxRow).FOffsets[I]]),
                                           Values[I].ValueType.Size,
                                           PSqlLen(@TDBXOdbcRow(FDbxRow).FBlock.Buffer[TDBXOdbcRow(FDbxRow).FOffsets[I]+Values[I].ValueType.Size]));
      CheckResult(ErrorCode);
    end;
  end;
end;

procedure TDBXOdbcReader.DerivedClose;
var
  ErrorCode: SmallInt;
begin
  ErrorCode := FMethodTable.SQLCloseCursor(FCommandHandle);
  CheckResult(ErrorCode);
end;

function TDBXOdbcReader.DerivedNext: Boolean;
var
  ErrorCode: SmallInt;
begin
  TDBXOdbcRow(FDbxRow).FBlock.Next;
  if (TDBXOdbcRow(FDbxRow).FBlock.CurrentRecord = 1) or
     (TDBXOdbcRow(FDbxRow).FBlock.CurrentRecord > TDBXOdbcRow(FDbxRow).FBlock.FRecCount) then
  begin
    FillChar(TDBXOdbcRow(FDbxRow).FBlock.FBuffer[0], Length(TDBXOdbcRow(FDbxRow).FBlock.Buffer), 0);
    ErrorCode := FMethodTable.SQLFetchScroll(FCommandHandle, SQL_FETCH_NEXT, 0);
    if ErrorCode = SQL_NO_DATA then
      Result := False
    else
    begin
      CheckResult(ErrorCode);
      Result := True;
    end;
    if TDBXOdbcRow(FDbxRow).FBlock.CurrentRecord > TDBXOdbcRow(FDbxRow).FBlock.FRecCount then
      TDBXOdbcRow(FDbxRow).FBlock.Reset;
  end
  else
  begin
    if (TDBXOdbcRow(FDbxRow).FBlock.RowsFetched < TDBXOdbcRow(FDbxRow).FBlock.FRecCount) and
       (TDBXOdbcRow(FDbxRow).FBlock.CurrentRecord > TDBXOdbcRow(FDbxRow).FBlock.RowsFetched) then
      Result := False
    else
      Result := True;
  end;
end;

procedure TDBXOdbcReader.SetTypeInfo(Column: TDBXValueType; const SQLDataType: SmallInt);
begin
  case SQLDataType of
    SQL_CHAR:
      begin
        Column.DataType := TDBXDataTypes.AnsiStringType;
        Column.SubType := TDBXSubDataTypes.FixedSubType;
        Column.Size := Column.Precision + 1; //Null terminator
      end;
    SQL_VARCHAR:
      begin
        Column.DataType := TDBXDataTypes.AnsiStringType;
        Column.SubType := 0;
        Column.Size := Column.Precision + 1; //Null terminator
      end;
    SQL_LONGVARCHAR:
      begin
        Column.DataType := TDBXDataTypes.BlobType;
        Column.SubType := TDBXSubDataTypes.MemoSubType;
        Column.Precision := 1;
        Column.Size := 1;
      end;
    SQL_WCHAR:
      begin
        Column.DataType := TDBXDataTypes.WideStringType;
        Column.SubType := TDBXSubDataTypes.FixedSubType;
        Column.Size := (Column.Precision + 1) * SizeOf(Char);
      end;
    SQL_WVARCHAR:
      begin
        Column.DataType := TDBXDataTypes.WideStringType;
        Column.SubType := 0;
        Column.Size := (Column.Precision + 1) * SizeOf(Char);
      end;
    SQL_WLONGVARCHAR:
      begin
        Column.DataType := TDBXDataTypes.BlobType;
        Column.SubType := TDBXSubDataTypes.WideMemoSubType;
        Column.Precision := 1;
        Column.Size := 1;
      end;
    SQL_DECIMAL, SQL_NUMERIC:
      begin
        Column.DataType := TDBXDataTypes.BcdType;
        Column.SubType := 0;
        Column.Size := SizeOf(TBcd);
      end;
    SQL_SMALLINT:
      begin
        Column.DataType := TDBXDataTypes.Int16Type;
        Column.SubType := 0;
        Column.Precision := SizeOf(SmallInt);
        Column.Size := SizeOf(SmallInt);
      end;
    SQL_INTEGER:
      begin
        Column.DataType := TDBXDataTypes.Int32Type;
        Column.SubType := 0;
        Column.Precision := SizeOf(Integer);
        Column.Size := SizeOf(Integer);
      end;
    SQL_REAL:
      begin
        Column.DataType := TDBXDataTypes.SingleType;
        Column.SubType := 0;
        Column.Precision := SizeOf(Single);
        Column.Size := SizeOf(Single);
      end;
    SQL_DOUBLE, SQL_FLOAT:
      begin
        Column.DataType := TDBXDataTypes.DoubleType;
        Column.SubType := 0;
        Column.Precision := SizeOf(Double);
        Column.Size := SizeOf(Double);
      end;
    SQL_BIT:
      begin
        Column.DataType := TDBXDataTypes.BooleanType;
        Column.SubType := 0;
        Column.Precision := SizeOf(SmallInt);
        Column.Size := SizeOf(SmallInt);
      end;
    SQL_TINYINT:
      begin
        Column.DataType := TDBXDataTypes.Int8Type;
        Column.SubType := 0;
        Column.Precision := SizeOf(ShortInt);
        Column.Size := SizeOf(ShortInt);
      end;
    SQL_BIGINT:
      begin
        Column.DataType := TDBXDataTypes.Int64Type;
        Column.SubType := 0;
        Column.Precision := SizeOf(Int64);
        Column.Size := SizeOf(Int64);
      end;
    SQL_BINARY:
      begin
        Column.DataType := TDBXDataTypes.BytesType;
        Column.SubType := 0;
        Column.Size := Column.Precision;
      end;
    SQL_VARBINARY:
      begin
        Column.DataType := TDBXDataTypes.VarBytesType;
        Column.SubType := 0;
        Column.Size := Column.Precision + 2; //2 bytes size prefixed
      end;
    SQL_LONGVARBINARY:
      begin
        Column.DataType := TDBXDataTypes.BlobType;
        Column.SubType := TDBXSubDataTypes.BinarySubType;
        Column.Precision := 1;
        Column.Size := 1;
      end;
    SQL_TYPE_DATE:
      begin
        Column.DataType := TDBXDataTypes.DateType;
        Column.SubType := 0;
        Column.Size := SizeOf(SQL_DATE_STRUCT);
      end;
    SQL_TYPE_TIME:
      begin
        Column.DataType := TDBXDataTypes.TimeType;
        Column.SubType := 0;
        Column.Size := SizeOf(SQL_TIME_STRUCT);
      end;
    SQL_TYPE_TIMESTAMP:
      begin
        Column.DataType := TDBXDataTypes.TimeStampType;
        Column.SubType := 0;
        Column.Size := SizeOf(TSQLTimeStamp);
      end;
    SQL_TYPE_NULL:
      begin
        Column.DataType := TDBXDataTypes.UnknownType;
        Column.SubType := 0;
        Column.Size := 1;
      end
    else //We will treat unknown data types as strings
    begin
        Column.DataType := TDBXDataTypes.AnsiStringType;
        Column.SubType := 0;
        Column.Size := Column.Precision + 1; //Null terminator
    end;
  end;
end;

constructor TDBXOdbcDriverLoader.Create;
const
  ODBC_LOADER_NAME = 'TDBXOdbcDriverLoader';
begin
  inherited Create;
  FLoaderName := ODBC_LOADER_NAME;
end;

function TDBXOdbcDriverLoader.Load(DriverDef: TDBXDriverDef): TDBXDriver;
var
  LastError: Integer;
begin
  FLibraryHandle := LoadLibrary(sVendorLib);
  if FLibraryHandle = HModule(0) then
  begin
    LastError := GetLastError;
    DriverDef.FDBXContext.Error(TDBXErrorCodes.DriverInitFailed, Format(sDLLLoadError, [sVendorLib, LastError]));
  end;

  FMethodTable := TDBXOdbcMethodTable.Create(FLibraryHandle);
  try
    FMethodTable.LoadMethods;
  except
    on EDBXError: TDBXError do
    begin
      DriverDef.FDBXContext.OnError(EDBXError);
      raise;
    end;
  end;
  Result := TDBXOdbcDriver.Create(DriverDef, FMethodTable);
  FMethodTable := nil;
end;

constructor TDBXOdbcBlockMgr.Create(RowLength, RowCount: Int64);
begin
  inherited Create;
  FCurrentRec := 0;
  FRowLength := RowLength;
  FRecCount := RowCount;
  SetLength(FBuffer, RowLength*RowCount);
end;

destructor TDBXOdbcBlockMgr.Destroy;
begin
  inherited Destroy;
end;

procedure TDBXOdbcBlockMgr.Next;
begin
  Inc(FCurrentRec);
end;

procedure TDBXOdbcBlockMgr.Reset;
begin
  FCurrentRec := 1;
end;

function TDBXOdbcRow.CalculateOffset(ColNum: Integer): Int64;
begin
  if FBlock.CurrentRecord > 0 then
    Result := FOffsets[ColNum] + (FBlock.CurrentRecord - 1) * FBlock.RowLength
  else
    Result := FOffsets[ColNum];
end;

procedure TDBXOdbcRow.GetAnsiString(DbxValue: TDBXAnsiStringValue;
  var AnsiStringBuilder: TDBXAnsiStringBuilder; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DbxValue.ValueType.Precision])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.ResizeStringBuilder(AnsiStringBuilder, DbxValue.ValueType.Precision+1);
    Move(FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)], AnsiStringBuilder[0], DBXValue.ValueType.Precision+1);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetWideString(DbxValue: TDBXWideStringValue;
  var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DbxValue.ValueType.Precision*SizeOf(Char)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    TDBXPlatform.ResizeWideStringBuilder(WideStringBuilder, (DbxValue.ValueType.Precision+1)*SizeOf(Char));
    Move(FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)], WideStringBuilder[0], (DBXValue.ValueType.Precision+1)*SizeOf(Char));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetBoolean(DbxValue: TDBXBooleanValue;
  var Value: LongBool; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(LongBool)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PLongBool(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Byte)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PByte(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(ShortInt)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PShortInt(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Word)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(SmallInt)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PSmallInt(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(TInt32)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Int64)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PInt64(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Single)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PSingle(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetDouble(DbxValue: TDBXDoubleValue; var Value: Double;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Double)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PDouble(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd;
  var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DbxValue.ValueType.Size])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := StrToBcd(UnicodeString(AnsiString(PAnsiChar(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)]))));
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate;
  var IsNull: LongBool);
var
  Year: SmallInt;
  Month, Day: Word;
  TimeStamp: TTimeStamp;
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(SQL_DATE_STRUCT)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Year := PSmallInt(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
    Month := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Word)])^;
    Day := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Word)+SizeOf(Word)])^;
    TimeStamp := DateTimeToTimeStamp(EncodeDate(Year, Month, Day));
    Value := TimeStamp.Date;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime;
  var IsNull: LongBool);
var
  Hour, Minute, Second: Word;
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(SQL_TIME_STRUCT)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Hour := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
    Minute := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Word)])^;
    Second := PWord(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(Word)+SizeOf(Word)])^;
    Value := (Hour * 60 + Minute) * MSecsPerSec * SecsPerMin + (Second * MSecsPerSec);
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetTimeStamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(TSQLTimeStamp)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PSQLTimeStamp(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+SizeOf(TSQLTimeStampOffset)])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    Value := PSQLTimeStampOffset(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)])^;
  end
  else
    IsNull := True;
end;

procedure TDBXOdbcRow.GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64;
  const Buffer: TBytes; BufferOffset: Int64; Length: Int64;
  var ReturnLength: Int64; var IsNull: LongBool);
begin
  if PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DBXValue.ValueType.Precision])^ <> SQL_NULL_DATA then
  begin
    IsNull := False;
    ReturnLength := PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DBXValue.ValueType.Precision])^;
    if ReturnLength < Length then
      TDBXPlatform.CopyByteArray(FBlock.Buffer, CalculateOffset(DbxValue.ValueType.Ordinal), Buffer, BufferOffset, ReturnLength)
    else
      TDBXPlatform.CopyByteArray(FBlock.Buffer, CalculateOffset(DbxValue.ValueType.Ordinal), Buffer, BufferOffset, Length);
  end
  else
  begin
    IsNull := True;
    ReturnLength := 0;
  end;
end;

procedure TDBXOdbcRow.GetByteLength(DbxValue: TDBXByteArrayValue;
  var ByteLength: Int64; var IsNull: LongBool);
begin
  ByteLength := PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DBXValue.ValueType.Precision])^;
  if ByteLength = 0 then
    IsNull := True;
end;

procedure TDBXOdbcRow.SetNull(DbxValue: TDBXValue);
begin
  if Assigned(FBlock) then
  begin
    case DbxValue.ValueType.DataType of
      TDBXDataTypes.BlobType, TDBXDataTypes.AnsiStringType, TDBXDataTypes.WideStringType,
      TDBXDataTypes.BcdType:
        PInteger(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+DBXValue.ValueType.Size])^ := SQL_NULL_DATA;
      else
        PInteger(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+GetTypeSize(DbxValue.ValueType.DataType)])^ := SQL_NULL_DATA;
    end;
  end;
end;

procedure TDBXOdbcRow.SetString(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  if Assigned(FBlock) then
  begin
    PInteger(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+DbxValue.ValueType.Size-SizeOf(AnsiChar)])^ := DbxValue.ValueType.Size-SizeOf(AnsiChar);
    TDBXPlatform.CopyByteArray(TDBXPlatform.AnsiStrToBytes(Value), 0, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal], DbxValue.ValueType.Size-SizeOf(AnsiChar));
  end;
end;

procedure TDBXOdbcRow.SetWideString(DbxValue: TDBXWideStringValue;
  const Value: UnicodeString);
begin
  if Assigned(FBlock) then
  begin
    PInteger(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+DbxValue.ValueType.Size-SizeOf(Char)])^ := DbxValue.ValueType.Size-SizeOf(Char);
    TDBXPlatform.CopyByteArray(TDBXPlatform.WideStrToBytes(Value), 0, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal], DbxValue.ValueType.Size-SizeOf(Char));
  end;
end;

procedure TDBXOdbcRow.SetAnsiString(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  if Assigned(FBlock) then
    SetString(DbxValue, Value);
end;

procedure TDBXOdbcRow.SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt8(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt8(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetUInt16(DbxValue: TDBXUInt16Value; Value: Word);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt16(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt16(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetInt32(DbxValue: TDBXInt32Value; Value: TInt32);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt32(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetInt64(DbxValue: TDBXInt64Value; Value: Int64);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt64(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetSingle(DbxValue: TDBXSingleValue; Value: Single);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt32(TDBXPlatform.SingleToInt32Bits(Value), FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetDouble(DbxValue: TDBXDoubleValue; Value: Double);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt64(TDBXPlatform.DoubleToInt64Bits(Value), FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd);
var
  BcdInBytes: TBytes;
begin
  if Assigned(FBlock) then
  begin
    PInteger(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+SizeOf(TBcd)])^ := SizeOf(TBcd);
    BcdInBytes := BcdToBytes(Value);
    TDBXPlatform.CopyByteArray(BcdInBytes, 0, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal], Length(BcdInBytes));
  end;
end;

procedure TDBXOdbcRow.SetDate(DbxValue: TDBXDateValue; Value: TDBXDate);
var
  TimeStamp: TTimeStamp;
  Year, Month, Day: Word;
begin
  if Assigned(FBlock) then
  begin
    TimeStamp.Time := 0;
    TimeStamp.Date := Value;
    DecodeDate(TimeStampToDateTime(TimeStamp), Year, Month, Day);
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]])^ := Year;
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+SizeOf(Word)])^ := Month;
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+SizeOf(Word)+SizeOf(Word)])^ := Day;
  end;
end;

procedure TDBXOdbcRow.SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime);
var
  TimeStamp: TTimeStamp;
  Hour, Minute, Second, MSec: Word;
begin
  if Assigned(FBlock) then
  begin
    TimeStamp.Date := 1;
    TimeStamp.Time := Value;
    //SQL_TIME_STRUCT does not support milliseconds
    DecodeTime(TimeStampToDateTime(TimeStamp), Hour, Minute, Second, MSec);
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]])^ := Hour;
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+SizeOf(Word)])^ := Minute;
    PWord(@FBlock.Buffer[FOffsets[DbxValue.ValueType.Ordinal]+SizeOf(Word)+SizeOf(Word)])^ := Second;
  end;
end;

procedure TDBXOdbcRow.SetTimestamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopySqlTimeStamp(Value, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.SetDynamicBytes(DbxValue: TDBXValue; Offset: Int64;
  const Buffer: TBytes; BufferOffset: Int64; Length: Int64);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyByteArray(Buffer, BufferOffset, FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal], Length);
end;

procedure TDBXOdbcRow.SetValueType(ValueType: TDBXValueType);
begin
end;

procedure TDBXOdbcRow.GetStream(DbxValue: TDBXStreamValue; var Stream: TStream;
  var IsNull: LongBool);
var
  ByteLength: Int64;
  ReturnLength: Int64;
  ByteBuffer: TBytes;
begin
  GetLength(DbxValue, ByteLength, IsNull);
  if not IsNull then
  begin
    SetLength(ByteBuffer, ByteLength);
    GetBytes(DbxValue, 0, ByteBuffer, 0, ByteLength, ReturnLength, IsNull);
    Stream := TBytesStream.Create(ByteBuffer);
  end;
end;

procedure TDBXOdbcRow.SetAnsiMemo(DbxValue: TDBXAnsiMemoValue;
  const Value: AnsiString);
begin
  SetDynamicBytes(DbxValue, 0, TDBXPlatform.AnsiStrToBytes(Value), 0, Length(Value));
end;

procedure TDBXOdbcRow.SetWideMemo(DbxValue: TDBXWideMemoValue;
  const Value: UnicodeString);
begin
  SetDynamicBytes(DbxValue, 0, TDBXPlatform.WideStrToBytes(Value), 0, Length(Value)*SizeOf(Char));
end;

procedure TDBXOdbcRow.SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean);
begin
  if Assigned(FBlock) then
    TDBXPlatform.CopyInt16(SmallInt(Value), FBlock.Buffer, FOffsets[DbxValue.ValueType.Ordinal]);
end;

procedure TDBXOdbcRow.GetLength(DbxValue: TDBXValue; var ByteLength: Int64;
  var IsNull: LongBool);
begin
  ByteLength := PInteger(@FBlock.Buffer[CalculateOffset(DbxValue.ValueType.Ordinal)+DBXValue.ValueType.Precision])^;
  if ByteLength = 0 then
    IsNull := True;
end;

constructor TDBXOdbcRow.Create(DBXContext: TDBXContext; EnvironmentHandle, ConnectionHandle, CommandHandle: OdbcHandle; MethodTable: TDBXOdbcMethodTable);
begin
  inherited Create(DBXContext);
  FMethodTable := MethodTable;
  FEnvironmentHandle := EnvironmentHandle;
  FConnectionHandle := ConnectionHandle;
  FCommandHandle := CommandHandle;
  FIndicatorSize := SizeOf(SQLLEN);
end;

destructor TDBXOdbcRow.Destroy;
begin
  FBlock.Free;
  SetLength(FOffsets, 0);
  SetLength(FColumnTypes, 0);
  inherited Destroy;
end;

constructor TDBXOdbcTransaction.Create(Connection: TDBXConnection; IsolationLevel: TDBXIsolation; TransactionId: Integer);
begin
  inherited Create(Connection);
  FIsolationLevel := IsolationLevel;
  FId := TransactionId;
end;

{ TDBXOdbcMethodTable }

procedure TDBXOdbcMethodTable.RaiseError(DBXContext: TDBXContext; ReturnValue, HandleType: SmallInt; Handle: OdbcHandle);
var
  SqlState, MessageText: TBytes;
  NativeError: Integer;
  ActualLength, BufLen: SmallInt;
begin
  case ReturnValue of
    SQL_ERROR, SQL_SUCCESS_WITH_INFO:
      begin
        //5 character SQLSTATE code and terminating NULL
        SetLength(SqlState, 6*SizeOf(Char));
        //We will return the first status record.  If users wish to retrieve
        //additional status records they can handle the exception and make additional
        //calls to SQLGetDiagRec.
        SQLGetDiagRec(HandleType, Handle, 1, PSqlWChar(SqlState), NativeError,
                      nil, 0, ActualLength);
        //Number of characters + null terminator
        BufLen := (ActualLength+1) * SizeOf(Char);
        SetLength(MessageText, BufLen);
        SQLGetDiagRec(HandleType, Handle, 1, PSqlWChar(SqlState),
                      NativeError, PSqlWChar(MessageText), BufLen, ActualLength);
        DBXContext.Error(ReturnValue, PChar(MessageText));
      end;
    SQL_INVALID_HANDLE: DBXContext.Error(ReturnValue, SInvalidHandle);
  end;
end;

constructor TDBXOdbcMethodTable.Create(LibraryHandle: THandle);
begin
  FLibraryHandle := LibraryHandle;
  inherited Create;
end;

destructor TDBXOdbcMethodTable.Destroy;
begin
  FreeLibrary(FLibraryHandle);
  FLibraryHandle := 0;
  inherited;
end;

function TDBXOdbcMethodTable.LoadMethod(MethodName: string): OdbcHandle;
begin
  Result := GetProcAddress(FLibraryHandle, PChar(MethodName));

  if not Assigned(Result) then
  begin
    raise TDBXError.Create(TDBXErrorCodes.DriverInitFailed, Format(SDllProcLoadError, [MethodName]));
  end;
end;

procedure TDBXOdbcMethodTable.LoadMethods;
begin
  FSQLAllocHandle :=         LoadMethod('SQLAllocHandle');
  FSQLBindCol :=             LoadMethod('SQLBindCol');
  FSQLBindParameter :=       LoadMethod('SQLBindParameter');
  FSQLCloseCursor :=         LoadMethod('SQLCloseCursor');
  FSQLColumns :=             LoadMethod('SQLColumnsW');
  FSQLConnect :=             LoadMethod('SQLConnectW');
  FSQLDescribeCol :=         LoadMethod('SQLDescribeColW');
  FSQLDisconnect :=          LoadMethod('SQLDisconnect');
  FSQLDriverConnect :=       LoadMethod('SQLDriverConnectW');
  FSQLEndTran :=             LoadMethod('SQLEndTran');
  FSQLExecDirect :=          LoadMethod('SQLExecDirectW');
  FSQLExecute :=             LoadMethod('SQLExecute');
  FSQLFetchScroll :=         LoadMethod('SQLFetchScroll');
  FSQLForeignKeys :=         LoadMethod('SQLForeignKeysW');
  FSQLFreeHandle :=          LoadMethod('SQLFreeHandle');
  FSQLGetData :=             LoadMethod('SQLGetData');
  FSQLGetDiagRec :=          LoadMethod('SQLGetDiagRecW');
  FSQLGetInfo :=             LoadMethod('SQLGetInfoW');
  FSQLGetTypeInfo :=         LoadMethod('SQLGetTypeInfoW');
  FSQLNativeSql :=           LoadMethod('SQLNativeSqlW');
  FSQLNumResultCols :=       LoadMethod('SQLNumResultCols');
  FSQLParamData :=           LoadMethod('SQLParamData');
  FSQLPrepare :=             LoadMethod('SQLPrepareW');
  FSQLProcedureColumns :=    LoadMethod('SQLProcedureColumnsW');
  FSQLProcedures :=          LoadMethod('SQLProceduresW');
  FSQLPutData :=             LoadMethod('SQLPutData');
  FSQLRowCount :=            LoadMethod('SQLRowCount');
  FSQLSetConnectAttr :=      LoadMethod('SQLSetConnectAttrW');
  FSQLSetEnvAttr :=          LoadMethod('SQLSetEnvAttr');
  FSQLSetStmtAttr :=         LoadMethod('SQLSetStmtAttrW');
  FSQLStatistics :=          LoadMethod('SQLStatisticsW');
  FSQLTables :=              LoadMethod('SQLTablesW');
end;

function TDBXOdbcMethodTable.SQLAllocHandle(HandleType: SQLSMALLINT;
  InputHandle: SQLHANDLE; var OutputHandle: SQLHANDLE): SQLRETURN;
begin
  Result := FSQLAllocHandle(HandleType, InputHandle, OutputHandle);
end;

function TDBXOdbcMethodTable.SQLBindCol(StatementHandle: SQLHSTMT;
  ColumnNumber: SQLUSMALLINT; TargetType: SQLSMALLINT; TargetValue: SQLPOINTER;
  BufferLength: SQLLEN; StrLen_or_Ind: PSQLLEN): SQLRETURN;
begin
  Result := FSQLBindCol(StatementHandle, ColumnNumber, TargetType, TargetValue,
                        BufferLength, StrLen_or_Ind);
end;

function TDBXOdbcMethodTable.SQLBindParameter(hstmt: SQLHSTMT; ipar: SQLUSMALLINT; fParamType, fCType, fSqlType: SQLSMALLINT;
                               cbColDef: SQLULEN; ibScale: SQLSMALLINT; rgbValue: SQLPOINTER;
                               cbValueMax: SQLLEN; pcbValue: PSQLLEN): SQLRETURN;
begin
  Result := FSQLBindParameter(hstmt, ipar, fParamType, fCType, fSqlType, cbColDef,
                              ibScale, rgbValue, cbValueMax, pcbValue);
end;

function TDBXOdbcMethodTable.SQLCloseCursor(StatementHandle: SQLHSTMT): SQLRETURN;
begin
  Result := FSQLCloseCursor(StatementHandle);
end;

function TDBXOdbcMethodTable.SQLColumns(StatementHandle: SQLHSTMT;
  CatalogName: PSqlWChar; NameLength1: SQLSMALLINT; SchemaName: PSqlWChar;
  NameLength2: SQLSMALLINT; TableName: PSqlWChar; NameLength3: SQLSMALLINT;
  ColumnName: PSqlWChar; NameLength4: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLColumns(StatementHandle, CatalogName, NameLength1, SchemaName,
                        NameLength2, TableName, NameLength3, ColumnName, NameLength4);
end;

function TDBXOdbcMethodTable.SQLConnect(ConnectionHandle: SQLHDBC;
  ServerName: PSqlWChar; NameLength1: SQLSMALLINT; UserName: PSqlWChar;
  NameLength2: SQLSMALLINT; Authentication: PSqlWChar;
  NameLength3: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLConnect(ConnectionHandle, ServerName, NameLength1, UserName,
                        NameLength2, Authentication, NameLength3);
end;

function TDBXOdbcMethodTable.SQLDescribeCol(StatementHandle: SQLHSTMT;
  ColumnNumber: SQLUSMALLINT; ColumnName: PSqlWChar;
  BufferLength: SQLSMALLINT; var NameLength, DataType: SQLSMALLINT;
  var ColumnSize: SQLULEN; var DecimalDigits, Nullable: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLDescribeCol(StatementHandle, ColumnNumber, ColumnName, BufferLength,
                            NameLength, DataType, ColumnSize, DecimalDigits, Nullable);
end;

function TDBXOdbcMethodTable.SQLDisconnect(
  ConnectionHandle: SQLHDBC): SQLRETURN;
begin
  Result := FSQLDisconnect(ConnectionHandle);
end;

function TDBXOdbcMethodTable.SQLDriverConnect(hdbc: SQLHDBC; hwnd: SQLHWND; szConnStrIn: PSqlWChar;
                               cchConnStrIn: SQLSMALLINT; szConnStrOut: PSqlWChar;
                               cchConnStrOutMax: SQLSMALLINT; var pcchConnStrOut: SQLSMALLINT;
                               fDriverCompletion: SQLUSMALLINT): SQLRETURN;
begin
  Result := FSQLDriverConnect(hdbc, hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion);
end;

function TDBXOdbcMethodTable.SQLEndTran(HandleType: SQLSMALLINT;
  Handle: SQLHANDLE; CompletionType: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLEndTran(HandleType, Handle, CompletionType);
end;

function TDBXOdbcMethodTable.SQLExecDirect(StatementHandle: SQLHSTMT;
  StatementText: PSqlWChar; TextLength: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLExecDirect(StatementHandle, StatementText, TextLength);
end;

function TDBXOdbcMethodTable.SQLExecute(StatementHandle: SQLHSTMT): SQLRETURN;
begin
  Result := FSQLExecute(StatementHandle);
end;

function TDBXOdbcMethodTable.SQLFetchScroll(StatementHandle: SQLHSTMT;
  FetchOrientation: SQLSMALLINT; FetchOffset: SQLLEN): SQLRETURN;
begin
  Result := FSQLFetchScroll(StatementHandle, FetchOrientation, FetchOffset);
end;

function TDBXOdbcMethodTable.SQLForeignKeys(hstmt: SQLHSTMT; szPkCatalogName: PSqlWChar; cchPkCatalogName: SQLSMALLINT;
                             szPkSchemaName: PSqlWChar; cchPkSchemaName: SQLSMALLINT;
                             szPkTableName: PSqlWChar; cchPkTableName: SQLSMALLINT;
                             szFkCatalogName: PSqlWChar; cchFkCatalogName: SQLSMALLINT;
                             szFkSchemaName: PSqlWChar; cchFkSchemaName: SQLSMALLINT;
                             szFkTableName: PSqlWChar; cchFkTableName: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLForeignKeys(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName,
                            cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName,
                            cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName);
end;

function TDBXOdbcMethodTable.SQLFreeHandle(HandleType: SQLSMALLINT;
  Handle: SQLHANDLE): SQLRETURN;
begin
  Result := FSQLFreeHandle(HandleType, Handle);
end;

function TDBXOdbcMethodTable.SQLGetData(StatementHandle: SQLHSTMT;
  ColumnNumber: SQLUSMALLINT; TargetType: SQLSMALLINT; TargetValue: SQLPOINTER;
  BufferLength: SQLLEN; StrLen_or_IndPtr: PSQLLEN): SQLRETURN;
begin
  Result := FSQLGetData(StatementHandle, ColumnNumber, TargetType, TargetValue,
                        BufferLength, StrLen_or_IndPtr);
end;

function TDBXOdbcMethodTable.SQLGetDiagRec(HandleType: SQLSMALLINT;
  Handle: SQLHANDLE; RecNumber: SQLSMALLINT; SqlState: PSqlWChar;
  var NativeError: SQLINTEGER; MessageText: PSqlWChar;
  BufferLength: SQLSMALLINT; var TextLength: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLGetDiagRec(HandleType, Handle, RecNumber, SqlState, NativeError,
                           MessageText, BufferLength, TextLength);
end;

function TDBXOdbcMethodTable.SQLGetInfo(ConnectionHandle: SQLHDBC;
  InfoType: SQLUSMALLINT; InfoValue: SQLPOINTER; BufferLength: SQLSMALLINT;
  var StringLengthPtr: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLGetInfo(ConnectionHandle, InfoType, InfoValue, BufferLength,
                        StringLengthPtr);
end;

function TDBXOdbcMethodTable.SQLGetTypeInfo(StatementHandle: SQLHSTMT;
  DataType: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLGetTypeInfo(StatementHandle, DataType);
end;

function TDBXOdbcMethodTable.SQLNativeSql(hdbc: SQLHDBC; szSqlStrIn: PSqlWChar; cchSqlStrIn: SQLINTEGER;
  szSqlStr: PSqlWChar; cchSqlStrMax: SQLINTEGER; var pcbSqlStr: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLNativeSql(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcbSqlStr);
end;

function TDBXOdbcMethodTable.SQLNumResultCols(StatementHandle: SQLHSTMT;
  var ColumnCount: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLNumResultCols(StatementHandle, ColumnCount);
end;

function TDBXOdbcMethodTable.SQLParamData(StatementHandle: SQLHSTMT;
  Value: SQLPOINTER): SQLRETURN;
begin
  Result := FSQLParamData(StatementHandle, Value);
end;

function TDBXOdbcMethodTable.SQLPrepare(StatementHandle: SQLHSTMT;
  StatementText: PSqlWChar; TextLength: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLPrepare(StatementHandle, StatementText, TextLength);
end;

function TDBXOdbcMethodTable.SQLProcedureColumns(hstmt: SQLHSTMT; szCatalogName: PSqlWChar; cchCatalogName: SQLSMALLINT;
                                  szSchemaName: PSqlWChar; cchSchemaName: SQLSMALLINT;
                                  szProcName: PSqlWChar; cchProcName: SQLSMALLINT;
                                  szColumnName: PSqlWChar; cchColumnName: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLProcedureColumns(hstmt, szCatalogName, cchCatalogName, szSchemaName,
                                 cchSchemaName, szProcName, cchProcName, szColumnName,
                                 cchColumnName);
end;

function TDBXOdbcMethodTable.SQLProcedures(hstmt: SQLHSTMT; szCatalogName: PSqlWChar; cchCatalogName: SQLSMALLINT;
                            szSchemaName: PSqlWChar; cchSchemaName: SQLSMALLINT;
                            szProcName: PSqlWChar; cchProcName: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLProcedures(hstmt, szCatalogName, cchCatalogName, szSchemaName,
                           cchSchemaName, szProcName, cchProcName);
end;

function TDBXOdbcMethodTable.SQLPutData(StatementHandle: SQLHSTMT;
  Data: SQLPOINTER; StrLen_or_Ind: SQLLEN): SQLRETURN;
begin
  Result := FSQLPutData(StatementHandle, Data, StrLen_or_Ind);
end;

function TDBXOdbcMethodTable.SQLRowCount(StatementHandle: SQLHSTMT;
  var RowCount: SQLLEN): SQLRETURN;
begin
  Result := FSQLRowCount(StatementHandle, RowCount);
end;

function TDBXOdbcMethodTable.SQLSetConnectAttr(ConnectionHandle: SQLHDBC;
  Attribute: SQLINTEGER; Value: SQLPOINTER;
  StringLength: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLSetConnectAttr(ConnectionHandle, Attribute, Value, StringLength);
end;

function TDBXOdbcMethodTable.SQLSetEnvAttr(EnvironmentHandle: SQLHENV;
  Attribute: SQLINTEGER; Value: SQLPOINTER;
  StringLength: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLSetEnvAttr(EnvironmentHandle, Attribute, Value, StringLength);
end;

function TDBXOdbcMethodTable.SQLSetStmtAttr(StatementHandle: SQLHSTMT;
  Attribute: SQLINTEGER; Value: SQLPOINTER;
  StringLength: SQLINTEGER): SQLRETURN;
begin
  Result := FSQLSetStmtAttr(StatementHandle, Attribute, Value, StringLength);
end;

function TDBXOdbcMethodTable.SQLStatistics(StatementHandle: SQLHSTMT;
  CatalogName: PSqlWChar; NameLength1: SQLSMALLINT; SchemaName: PSqlWChar;
  NameLength2: SQLSMALLINT; TableName: PSqlWChar; NameLength3: SQLSMALLINT;
  Unique, Reserved: SQLUSMALLINT): SQLRETURN;
begin
  Result := FSQLStatistics(StatementHandle, CatalogName, NameLength1, SchemaName,
                           NameLength2, TableName, NameLength3, Unique, Reserved);
end;

function TDBXOdbcMethodTable.SQLTables(StatementHandle: SQLHSTMT;
  CatalogName: PSqlWChar; NameLength1: SQLSMALLINT; SchemaName: PSqlWChar;
  NameLength2: SQLSMALLINT; TableName: PSqlWChar; NameLength3: SQLSMALLINT;
  TableType: PSqlWChar; NameLength4: SQLSMALLINT): SQLRETURN;
begin
  Result := FSQLTables(StatementHandle, CatalogName, NameLength1, SchemaName,
                       NameLength2, TableName, NameLength3, TableType, NameLength4);
end;

{ TDBXOdbcProperties }

constructor TDBXOdbcProperties.Create(DBXContext: TDBXContext);
begin
  inherited Create(DBXContext);
  Values[TDBXPropertyNames.DriverUnit] := 'Data.DbxOdbc';
  Values[TDBXPropertyNames.DriverPackageLoader] := 'TDBXOdbcDriverLoader,DBXOdbcDriver160.bpl';
  Values[TDBXPropertyNames.MetaDataPackageLoader] := 'TDBXOdbcMetaDataCommandFactory,DbxOdbcDriver160.bpl';

  Values[TDBXPropertyNames.IsolationLevel] := 'ReadCommitted';
  Values['RowSetSize'] := '20';
end;

initialization
  TDBXDriverRegistry.RegisterDriverClass(sDriverName, TDBXOdbcDriver);

end.
