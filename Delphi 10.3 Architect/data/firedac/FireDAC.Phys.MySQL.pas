{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{                 FireDAC MySQL driver                  }
{                                                       }
{ Copyright(c) 2004-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}
{$HPPEMIT LINKUNIT}

                          
                                             
                                             
                                                                       
                                                                                                         
 

unit FireDAC.Phys.MySQL;

interface

uses
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Phys;

type
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDPhysMySQLDriverLink = class(TFDPhysDriverLink)
  private
    FEmbeddedArgs: TStrings;
    FEmbeddedGroups: TStrings;
    procedure SetEmbeddedArgs(const AValue: TStrings);
    procedure SetEmbeddedGroups(const AValue: TStrings);
  protected
    function GetBaseDriverID: String; override;
    function IsConfigured: Boolean; override;
    procedure ApplyTo(const AParams: IFDStanDefinition); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property EmbeddedArgs: TStrings read FEmbeddedArgs write SetEmbeddedArgs;
    property EmbeddedGroups: TStrings read FEmbeddedGroups write SetEmbeddedGroups;
  end;

{-------------------------------------------------------------------------------}
implementation

uses
{$IFDEF MSWINDOWS}
  // Preventing from "Inline has not expanded"
  Winapi.Windows,
{$ENDIF}
  System.SysUtils, Data.DB, System.SyncObjs, System.Variants, Data.FmtBCD,
    Data.SqlTimSt, System.DateUtils, System.Generics.Collections,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.Stan.Util,
    FireDAC.Stan.Consts, FireDAC.Stan.ResStrs,
  FireDAC.UI.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.Phys.SQLGenerator, FireDAC.Phys.MySQLCli,
    FireDAC.Phys.MySQLWrapper, FireDAC.Phys.MySQLMeta, FireDAC.Phys.MySQLDef;

type
  TFDPhysMySQLDriver = class;
  TFDPhysMySQLConnection = class;
  TFDPhysMySQLTransaction = class;
  TFDPhysMySQLCommand = class;

  TFDPhysMySQLDriver = class(TFDPhysDriver)
  private
    FLib: TMySQLLib;
  protected
    class function GetBaseDriverID: String; override;
    class function GetBaseDriverDesc: String; override;
    class function GetRDBMSKind: TFDRDBMSKind; override;
    class function GetConnectionDefParamsClass: TFDConnectionDefParamsClass; override;
    procedure InternalLoad; override;
    procedure InternalUnload; override;
    function InternalCreateConnection(AConnHost: TFDPhysConnectionHost): TFDPhysConnection; override;
    function GetCliObj: Pointer; override;
    function GetConnParams(AKeys: TStrings; AParams: TFDDatSTable): TFDDatSTable; override;
  public
    constructor Create(AManager: TFDPhysManager; const ADriverDef: IFDStanDefinition); override;
    destructor Destroy; override;
  end;

  TFDPhysMySQLConnection = class(TFDPhysConnection)
  private
    FSession: TMySQLSession;
    FServerVersion, FClientVersion: TFDVersion;
    FLock: TCriticalSection;
    FResultMode: TFDMySQLResultMode;
    FNameModes: TFDPhysMySQLNameModes;
    FTinyIntFormat: TFDDataType;
    FLastInsertID: my_ulonglong;
    procedure GetServerOutput;
    procedure UpdateInsertId(AStmt: TMySQLStatement; AForce: Boolean);
  protected
    procedure InternalConnect; override;
    procedure InternalDisconnect; override;
    procedure InternalPing; override;
    function InternalCreateCommand: TFDPhysCommand; override;
    function InternalCreateTransaction: TFDPhysTransaction; override;
{$IFDEF FireDAC_MONITOR}
    procedure InternalTracingChanged; override;
{$ENDIF}
    function GetItemCount: Integer; override;
    procedure GetItem(AIndex: Integer; out AName: String;
      out AValue: Variant; out AKind: TFDMoniAdapterItemKind); override;
    procedure InternalChangePassword(const AUserName, AOldPassword, ANewPassword: String); override;
    function InternalCreateMetadata: TObject; override;
    function InternalCreateCommandGenerator(const ACommand: IFDPhysCommand): TFDPhysCommandGenerator; override;
    procedure InternalExecuteDirect(const ASQL: String; ATransaction: TFDPhysTransaction); override;
    function GetMessages: EFDDBEngineException; override;
    function GetCliObj: Pointer; override;
    function InternalGetCliHandle: Pointer; override;
    function GetLastAutoGenValue(const AName: String): Variant; override;
    function QueryValue(const ACmd: String; AColIndex: Integer): String;
    function InternalGetCurrentCatalog: String; override;
    procedure InternalAnalyzeSession(AMessages: TStrings); override;
  public
    constructor Create(ADriverObj: TFDPhysDriver; AConnHost: TFDPhysConnectionHost); override;
    destructor Destroy; override;
  end;

  TFDPhysMySQLTransaction = class(TFDPhysTransaction)
  private
    function GetConection: TFDPhysMySQLConnection; inline;
  protected
    procedure InternalStartTransaction(ATxID: LongWord); override;
    procedure InternalCommit(ATxID: LongWord); override;
    procedure InternalRollback(ATxID: LongWord); override;
    procedure InternalChanged; override;
    procedure InternalNotify(ANotification: TFDPhysTxNotification; ACommandObj: TFDPhysCommand); override;
    procedure InternalCheckState(ACommandObj: TFDPhysCommand; ASuccess: Boolean); override;
    property MyConnection: TFDPhysMySQLConnection read GetConection;
  end;

  PFDMySQLVarInfoRec = ^TFDMySQLVarInfoRec;
  TFDMySQLVarInfoRec = record
    FName,
    FOriginDBName,
    FOriginTabName,
    FOriginColName: String;
    FPos: Integer;
    FSrcFieldType: TFieldType;
    FSize: LongWord;
    FPrec, FScale: Integer;
    FAttrs: TFDDataAttributes;
    FSrcDataType,
    FDestDataType,
    FOutDataType: TFDDataType;
    FSrcTypeName: String;
    FOutSQLDataType: enum_field_types;
    FVar: TMySQLVariable;
    FParamType: TParamType;
  end;

  TFDPhysMySQLCommand = class(TFDPhysCommand)
  private
    FMetaInfoSQLs: array of String;
    FColumnIndex: Integer;
    FCursor: TMySQLResult;
    FStmt: TMySQLStatement;
    FParInfos: array of TFDMySQLVarInfoRec;
    FColInfos: array of TFDMySQLVarInfoRec;
    FPreparedBatchSize: Integer;
    FSPParsedName: TFDPhysParsedName;
    FUseDirectExec: Boolean;
    FHasIntStreams: Boolean;
    FHasOutParams: Boolean;
    FGetOutParams: Boolean;
    function GetConection: TFDPhysMySQLConnection; inline;
    function GetSession: TMySQLSession; inline;
    procedure UpdateExecDirect;
    procedure SetupReader(ARdr: TMySQLReader);
    procedure FD2SQLDataType(AType: TFDDataType; ALen: LongWord;
      APrec, AScale: Integer; out ASQLDataType: enum_field_types;
      out ASQLUnsigned: Boolean; out ASQLLen: my_ulong; AInput: Boolean;
      AFmtOpts: TFDFormatOptions);
    procedure SQL2FDDataType(ASQLDataType: enum_field_types; ASQLUnsigned,
      ASQLIsBinary, ASQLIsNum: Boolean; ASQLLen, ASQLDecimals: my_ulong;
      out AType: TFDDataType; var AAttrs: TFDDataAttributes; out ALen: LongWord;
      out APrec, AScale: Integer; AFmtOpts: TFDFormatOptions);
    procedure CreateParamInfos(ABatchSize: Integer);
    procedure CreateColInfos;
    procedure DestroyParamInfos;
    procedure DestroyColInfos;
    procedure PrepareBase;
    procedure CheckSPPrepared(ASPUsage: TFDPhysCommandKind);
    procedure SetParamValue(AFmtOpts: TFDFormatOptions; AParam: TFDParam;
      AVar: TMySQLVariable; ApInfo: PFDMySQLVarInfoRec; AParIndex: Integer);
    procedure SetParamValues(ABatchSize, AOffset: Integer);
    function GetBatchSQL(ABatchSize: Integer): String;
    function DataValue2MySQL(AData: Pointer; ALen: LongWord; AType: TFDDataType;
      out ATypeSupported: Boolean): TFDByteString;
    function GetExpandedSQL(ATimes, AOffset: Integer): TFDByteString;
    function GetResultMode: TFDMySQLResultMode;
    function GetCursor(AClosing: Boolean; AParIndex: Integer): Boolean;
    function CheckArray(ASize: Integer): Boolean;
    procedure ExecuteBatchInsert(ATimes, AOffset: Integer; var ACount: TFDCounter);
    procedure DoExecute(ATimes, AOffset: Integer; var ACount: TFDCounter;
      AFlush: Boolean);
    function AreOutParams: Boolean;
    procedure GetParamValues(AIndex: Integer);
    procedure CloseStatement(AForceClose: Boolean; AIndex: Integer);
    procedure ProcessVarColumn(AFmtOpts: TFDFormatOptions; AColIndex: Integer;
      ARow: TFDDatSRow; ApInfo: PFDMySQLVarInfoRec);
    procedure ProcessResColumn(AFmtOpts: TFDFormatOptions; AColIndex: Integer;
      ARow: TFDDatSRow; ApInfo: PFDMySQLVarInfoRec);
    procedure FetchRow(ATable: TFDDatSTable; AParentRow: TFDDatSRow);
    procedure MySQLType2FDType(var AStr: String; var AType: TFDDataType;
      var AAttrs: TFDDataAttributes; var ALen: LongWord; var APrec, AScale: Integer);
    function GetCrsData(ACrsCol: Integer; var AData: Pointer;
      var ALen: LongWord; AType: TFDDataType): Boolean; overload;
    function GetCrsData(ACrsCol: Integer; AData: Pointer): String; overload;
    function GetMetaCatalog: String;
    procedure FetchMetaRow(ATable: TFDDatSTable; AParentRow: TFDDatSRow;
      ARowIndex: Integer);
    function FetchFKRows(ATable: TFDDatSTable; AParentRow: TFDDatSRow): Integer;
    function FetchSPParamRows(ATable: TFDDatSTable;
      AParentRow: TFDDatSRow): Integer;
  protected
    procedure InternalClose; override;
    procedure InternalExecute(ATimes, AOffset: Integer; var ACount: TFDCounter); override;
    procedure InternalCloseStreams; override;
    function InternalFetchRowSet(ATable: TFDDatSTable; AParentRow: TFDDatSRow;
      ARowsetSize: LongWord): LongWord; override;
    procedure InternalAbort; override;
    function InternalOpen(var ACount: TFDCounter): Boolean; override;
    function InternalNextRecordSet: Boolean; override;
    procedure InternalPrepare; override;
    function InternalUseStandardMetadata: Boolean; override;
    function InternalColInfoStart(var ATabInfo: TFDPhysDataTableInfo): Boolean; override;
    function InternalColInfoGet(var AColInfo: TFDPhysDataColumnInfo): Boolean; override;
    procedure InternalUnprepare; override;
    function GetCliObj: Pointer; override;
    property MyConnection: TFDPhysMySQLConnection read GetConection;
    property Session: TMySQLSession read GetSession;
  end;

const
  S_FD_CharacterSets = 'big5;dec8;cp850;hp8;koi8r;latin1;latin2;swe7;ascii;ujis;' +
    'sjis;cp1251;hebrew;tis620;euckr;koi8u;gb2312;greek;cp1250;gbk;latin5;armscii8;' +
    'cp866;keybcs2;macce;macroman;cp852;latin7;cp1256;cp1257;binary;utf8;utf8mb4';

  S_FD_StoreResult = 'Store';
  S_FD_UseResult = 'Use';
  S_FD_ChooseResult = 'Choose';

  S_FD_Boolean = 'Boolean';
  S_FD_Integer = 'Integer';

var
  GLock: TCriticalSection;

{-------------------------------------------------------------------------------}
{ TFDPhysMySQLDriverLink                                                        }
{-------------------------------------------------------------------------------}
constructor TFDPhysMySQLDriverLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEmbeddedArgs := TFDStringList.Create(#0, ';');
  FEmbeddedGroups := TFDStringList.Create(#0, ';');
end;

{-------------------------------------------------------------------------------}
destructor TFDPhysMySQLDriverLink.Destroy;
begin
  FDFreeAndNil(FEmbeddedArgs);
  FDFreeAndNil(FEmbeddedGroups);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLDriverLink.GetBaseDriverID: String;
begin
  Result := S_FD_MySQLId;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLDriverLink.ApplyTo(const AParams: IFDStanDefinition);
begin
  inherited ApplyTo(AParams);
  if FEmbeddedArgs.Count > 0 then
    AParams.AsString[S_FD_ConnParam_MySQL_EmbeddedArgs] := FEmbeddedArgs.DelimitedText;
  if FEmbeddedGroups.Count > 0 then
    AParams.AsString[S_FD_ConnParam_MySQL_EmbeddedGroups] := FEmbeddedGroups.DelimitedText;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLDriverLink.IsConfigured: Boolean;
begin
  Result := inherited IsConfigured or (FEmbeddedArgs.Count > 0) or
    (FEmbeddedGroups.Count > 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLDriverLink.SetEmbeddedArgs(const AValue: TStrings);
begin
  FEmbeddedArgs.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLDriverLink.SetEmbeddedGroups(const AValue: TStrings);
begin
  FEmbeddedGroups.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
{ TFDPhysMySQLDriver                                                            }
{-------------------------------------------------------------------------------}
constructor TFDPhysMySQLDriver.Create(AManager: TFDPhysManager;
  const ADriverDef: IFDStanDefinition);
begin
  inherited Create(AManager, ADriverDef);
  GLock := TCriticalSection.Create;
  FLib := TMySQLLib.Create(FDPhysManagerObj);
end;

{-------------------------------------------------------------------------------}
destructor TFDPhysMySQLDriver.Destroy;
begin
  inherited Destroy;
  FDFreeAndNil(FLib);
  FDFreeAndNil(GLock);
end;

{-------------------------------------------------------------------------------}
class function TFDPhysMySQLDriver.GetBaseDriverID: String;
begin
  Result := S_FD_MySQLId;
end;

{-------------------------------------------------------------------------------}
class function TFDPhysMySQLDriver.GetBaseDriverDesc: String;
begin
  Result := 'MySQL Server';
end;

{-------------------------------------------------------------------------------}
class function TFDPhysMySQLDriver.GetRDBMSKind: TFDRDBMSKind;
begin
  Result := TFDRDBMSKinds.MySQL;
end;

{-------------------------------------------------------------------------------}
class function TFDPhysMySQLDriver.GetConnectionDefParamsClass: TFDConnectionDefParamsClass;
begin
  Result := TFDPhysMySQLConnectionDefParams;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLDriver.InternalLoad;
var
  sHome, sLib, sEmbArgs, sEmbGrps: String;
begin
  sHome := '';
  sLib := '';
  sEmbArgs := '';
  sEmbGrps := '';
  if Params <> nil then begin
    GetVendorParams(sHome, sLib);
    sEmbArgs := Params.AsString[S_FD_ConnParam_MySQL_EmbeddedArgs];
    sEmbGrps := Params.AsString[S_FD_ConnParam_MySQL_EmbeddedGroups];
  end;
  FLib.Load(sHome, sLib, sEmbArgs, sEmbGrps);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLDriver.InternalUnload;
begin
  FLib.Unload;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLDriver.InternalCreateConnection(
  AConnHost: TFDPhysConnectionHost): TFDPhysConnection;
begin
  Result := TFDPhysMySQLConnection.Create(Self, AConnHost);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLDriver.GetCliObj: Pointer;
begin
  Result := FLib;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLDriver.GetConnParams(AKeys: TStrings; AParams: TFDDatSTable): TFDDatSTable;
var
  oView: TFDDatSView;
begin
  Result := inherited GetConnParams(AKeys, AParams);
  oView := Result.Select('Name=''' + S_FD_ConnParam_Common_Database + '''');
  if oView.Rows.Count = 1 then begin
    oView.Rows[0].BeginEdit;
    oView.Rows[0].SetValues('LoginIndex', 4);
    oView.Rows[0].EndEdit;
  end;

  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_Server, S_FD_Local, S_FD_Local, S_FD_ConnParam_Common_Server, 2]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_Port, '@I', IntToStr(MYSQL_PORT), S_FD_ConnParam_Common_Port, 3]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_Compress, '@L', S_FD_True, S_FD_ConnParam_MySQL_Compress, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_UseSSL, '@L', S_FD_False, S_FD_ConnParam_MySQL_UseSSL, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_LoginTimeout, '@I', '', S_FD_ConnParam_Common_LoginTimeout, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_ReadTimeout, '@I', '', S_FD_ConnParam_MySQL_ReadTimeout, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_WriteTimeout, '@I', '', S_FD_ConnParam_MySQL_WriteTimeout, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_ResultMode, S_FD_StoreResult + ';' + S_FD_UseResult + ';' + S_FD_ChooseResult, S_FD_StoreResult, S_FD_ConnParam_MySQL_ResultMode, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_CharacterSet, S_FD_CharacterSets, '', S_FD_ConnParam_Common_CharacterSet, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_TinyIntFormat, S_FD_Boolean + ';' + S_FD_Integer, S_FD_Boolean, S_FD_ConnParam_MySQL_TinyIntFormat, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_MetaDefCatalog, '@S', '', S_FD_ConnParam_Common_MetaDefCatalog, -1]);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_Common_MetaCurCatalog, '@S', '', S_FD_ConnParam_Common_MetaCurCatalog, -1]);

  if (AKeys <> nil) and
     (CompareText(AKeys.Values[S_FD_ConnParam_MySQL_UseSSL], S_FD_True) = 0) then begin
    Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_SSL_key, '@S', '', S_FD_ConnParam_MySQL_SSL_key, -1]);
    Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_SSL_cert, '@S', '', S_FD_ConnParam_MySQL_SSL_cert, -1]);
    Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_SSL_ca, '@S', '', S_FD_ConnParam_MySQL_SSL_ca, -1]);
    Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_SSL_capath, '@S', '', S_FD_ConnParam_MySQL_SSL_capath, -1]);
    Result.Rows.Add([Unassigned, S_FD_ConnParam_MySQL_SSL_cipher, '@S', '', S_FD_ConnParam_MySQL_SSL_cipher, -1]);
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDPhysMySQLConnection                                                        }
{-------------------------------------------------------------------------------}
constructor TFDPhysMySQLConnection.Create(ADriverObj: TFDPhysDriver;
  AConnHost: TFDPhysConnectionHost);
begin
  FLock := TCriticalSection.Create;
  inherited Create(ADriverObj, AConnHost);
end;

{-------------------------------------------------------------------------------}
destructor TFDPhysMySQLConnection.Destroy;
begin
  inherited Destroy;
  FDFreeAndNil(FLock);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalCreateCommand: TFDPhysCommand;
begin
  Result := TFDPhysMySQLCommand.Create(Self);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalCreateTransaction: TFDPhysTransaction;
begin
  Result := TFDPhysMySQLTransaction.Create(Self);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalCreateMetadata: TObject;
begin
  Result := TFDPhysMySQLMetadata.Create(Self, False, FServerVersion,
    FClientVersion, FNameModes,
    (FSession <> nil) and (FSession.Encoder.Encoding in [ecUTF8, ecUTF16]));
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalCreateCommandGenerator(
  const ACommand: IFDPhysCommand): TFDPhysCommandGenerator;
begin
  if ACommand <> nil then
    Result := TFDPhysMySQLCommandGenerator.Create(ACommand)
  else
    Result := TFDPhysMySQLCommandGenerator.Create(Self);
end;

{$IFDEF FireDAC_MONITOR}
{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalTracingChanged;
begin
  if FSession <> nil then begin
    FSession.Monitor := FMonitor;
    FSession.Tracing := FTracing;
  end;
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalConnect;
var
  oParams: TFDPhysMySQLConnectionDefParams;
  sDatabase: String;
  uiClientFlag: LongWord;

  procedure SetTimeout(const AParamName: String; AOption: mysql_option);
  var
    uiTimeout: LongWord;
  begin
    if ConnectionDef.HasValue(AParamName) then begin
      uiTimeout := ConnectionDef.AsInteger[AParamName];
      FSession.Options[AOption] := @uiTimeout;
    end;
  end;

begin
  oParams := ConnectionDef.Params as TFDPhysMySQLConnectionDefParams;

  if InternalGetSharedCliHandle() <> nil then
    FSession := TMySQLSession.CreateUsingHandle(TFDPhysMySQLDriver(DriverObj).FLib,
      PMYSQL(InternalGetSharedCliHandle()), Self)
  else
    FSession := TMySQLSession.Create(TFDPhysMySQLDriver(DriverObj).FLib, Self);
{$IFDEF FireDAC_MONITOR}
  InternalTracingChanged;
{$ENDIF}
  FClientVersion := FSession.ClientVersion;
  if InternalGetSharedCliHandle() = nil then
    FSession.Init;

  FResultMode := oParams.ResultMode;
  if oParams.TinyIntFormat = tifInteger then
    FTinyIntFormat := dtSByte
  else
    FTinyIntFormat := dtBoolean;

  if InternalGetSharedCliHandle() = nil then begin
    if oParams.Compress then
      FSession.Options[MYSQL_OPT_COMPRESS] := nil;
    SetTimeout(S_FD_ConnParam_Common_LoginTimeout, MYSQL_OPT_CONNECT_TIMEOUT);
    SetTimeout(S_FD_ConnParam_MySQL_ReadTimeout, MYSQL_OPT_READ_TIMEOUT);
    SetTimeout(S_FD_ConnParam_MySQL_WriteTimeout, MYSQL_OPT_WRITE_TIMEOUT);

    uiClientFlag := CLIENT_FOUND_ROWS or CLIENT_LONG_FLAG;
    if not IsConsole then
      uiClientFlag := uiClientFlag or CLIENT_INTERACTIVE;
    sDatabase := oParams.ExpandedDatabase;
    if sDatabase <> '' then
      uiClientFlag := uiClientFlag or CLIENT_CONNECT_WITH_DB;
    if oParams.UseSSL then begin
      uiClientFlag := uiClientFlag or CLIENT_SSL;
      FSession.SSLInit(oParams.SSL_key, oParams.SSL_cert, oParams.SSL_ca,
                       oParams.SSL_capath, oParams.SSL_cipher);
    end;
    if FClientVersion >= mvMySQL050000 then
      uiClientFlag := uiClientFlag or FD_50_CLIENT_PROTOCOL_41 or CLIENT_MULTI_QUERIES or
        CLIENT_MULTI_RESULTS
    else if FClientVersion >= mvMySQL040100 then
      uiClientFlag := uiClientFlag or CLIENT_PROTOCOL_41 or CLIENT_MULTI_STATEMENTS;
    if (FClientVersion >= mvMySQL050600) and ConnectionDef.IsSpecified(S_FD_ConnParam_Common_NewPassword) then
      uiClientFlag := uiClientFlag or CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS;

    GLock.Enter;
    try
      FSession.Connect(oParams.Server, oParams.UserName, oParams.Password, sDatabase, oParams.Port, uiClientFlag);
      if (FClientVersion >= mvMySQL050600) and ConnectionDef.IsSpecified(S_FD_ConnParam_Common_NewPassword) then
        if FSession.ServerVersion >= mvMySQL080000 then
          InternalExecuteDirect('ALTER USER USER() IDENTIFIED BY ''' + oParams.NewPassword + '''', nil)
        else
          InternalExecuteDirect('SET PASSWORD = PASSWORD("' + oParams.NewPassword + '")', nil);
    finally
      GLock.Leave;
    end;
  end;

  FServerVersion := FSession.ServerVersion;
  if FServerVersion < mvMySQL032000 then
    FDException(Self, [S_FD_LPhys, S_FD_MySQLId], er_FD_MySQLBadVersion, [FServerVersion]);

  if InternalGetSharedCliHandle() = nil then begin
    if ConnectionDef.HasValue(S_FD_ConnParam_Common_CharacterSet) then
      FSession.CharacterSetName := ConnectionDef.AsString[S_FD_ConnParam_Common_CharacterSet];
    InternalExecuteDirect('SET SQL_AUTO_IS_NULL = 0', nil);
  end;

  FNameModes := [nmCaseSens, nmDBApply];
  if FServerVersion >= mvMySQL032306 then begin
    case StrToIntDef(QueryValue('SHOW VARIABLES LIKE ''lower_case_table_names''', 1), 0) of
    0: FNameModes := [nmCaseSens];
    1: FNameModes := [nmDefLowerCase];
    2: FNameModes := [];
    end;
    if FServerVersion >= mvMySQL040002 then
      Include(FNameModes, nmDBApply);
  end;
  FLastInsertID := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalDisconnect;
begin
  if FSession <> nil then begin
    GLock.Enter;
    try
      FSession.Disconnect;
    finally
      GLock.Leave;
      FDFreeAndNil(FSession);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalPing;
begin
  FLock.Enter;
  try
    FSession.Ping;
  finally
    FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalExecuteDirect(const ASQL: String;
  ATransaction: TFDPhysTransaction);
begin
  FLock.Enter;
  try
    FSession.Query(ASQL, Self);
    UpdateInsertId(nil, False);
    GetServerOutput;
  finally
    FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.QueryValue(const ACmd: String; AColIndex: Integer): String;
var
  oRes: TMySQLResult;
  pData: Pointer;
  iLen: LongWord;
begin
  FLock.Enter;
  try
    FSession.Query(ACmd, Self);
    oRes := FSession.StoreResult;
    try
      oRes.Fetch(1);
      pData := nil;
      iLen := 0;
      oRes.GetFieldData(AColIndex, pData, iLen);
      Result := FSession.Encoder.Decode(pData, iLen);
    finally
      FDFree(oRes);
    end;
    GetServerOutput;
  finally
    FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalChangePassword(const AUserName, AOldPassword,
  ANewPassword: String);
var
  s: String;
begin
  FLock.Enter;
  try
    if FSession.ServerVersion >= mvMySQL080000 then
      InternalExecuteDirect('ALTER USER USER() IDENTIFIED BY ''' + ANewPassword + '''', nil)
    else begin
      s := QueryValue('SELECT CONCAT(SUBSTRING_INDEX(USER(), ''@'', 1), ''@"'', SUBSTRING_INDEX(USER(), ''@'', -1), ''"'')', 0);
      InternalExecuteDirect('SET PASSWORD FOR ' + s + ' = PASSWORD("' + ANewPassword + '")', nil);
    end;
  finally
    FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.UpdateInsertId(AStmt: TMySQLStatement; AForce: Boolean);
var
  iID: my_ulonglong;
begin
  if AStmt <> nil then
    iID := AStmt.Insert_ID
  else if FSession <> nil then
    iID := FSession.Insert_ID
  else
    Exit;
  if AForce or (iID <> 0) then
    FLastInsertID := iID;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.GetLastAutoGenValue(const AName: String): Variant;
begin
  if FLastInsertID <> 0 then
    Result := FLastInsertID
  else
    Result := Null;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.GetItemCount: Integer;
begin
  Result := inherited GetItemCount;
  if DriverObj.State in [drsLoaded, drsActive] then begin
    Inc(Result, 2);
    if FSession <> nil then
      Inc(Result, 6);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.GetItem(AIndex: Integer; out AName: String;
  out AValue: Variant; out AKind: TFDMoniAdapterItemKind);
var
  s: String;
begin
  if AIndex < inherited GetItemCount then
    inherited GetItem(AIndex, AName, AValue, AKind)
  else
    case AIndex - inherited GetItemCount of
    0:
      begin
        AName := 'DLL';
        AValue := TFDPhysMySQLDriver(DriverObj).FLib.DLLName;
        AKind := ikClientInfo;
      end;
    1:
      begin
        AName := 'Client version';
        AValue := IntToStr(TFDPhysMySQLDriver(DriverObj).FLib.Version);
        AKind := ikClientInfo;
      end;
    2:
      begin
        AName := 'Server info';
        AValue := FSession.ServerInfo;
        AKind := ikSessionInfo;
      end;
    3:
      begin
        AName := 'Client info';
        AValue := FSession.ClientInfo;
        AKind := ikSessionInfo;
      end;
    4:
      begin
        AName := 'Characterset name';
        AValue := FSession.CharacterSetName;
        AKind := ikSessionInfo;
      end;
    5:
      begin
        AName := 'Host info';
        AValue := FSession.HostInfo;
        AKind := ikSessionInfo;
      end;
    6:
      begin
        AName := 'Name modes';
        s := '';
        if nmCaseSens in FNameModes then
          s := s + 'CS'
        else
          s := s + 'CI';
        if nmDefLowerCase in FNameModes then
          s := s + 'LC'
        else
          s := s + 'AI';
        if nmDBApply in FNameModes then
          s := s + 'TD'
        else
          s := s + 'T';
        AValue := s;
        AKind := ikSessionInfo;
      end;
    7:
      begin
        AName := 'SSL Cipher';
        AValue := FSession.SSLCipher;
        AKind := ikSessionInfo;
      end;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.GetMessages: EFDDBEngineException;
begin
  if FSession <> nil then
    Result := FSession.Info
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.GetCliObj: Pointer;
begin
  Result := FSession;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalGetCliHandle: Pointer;
begin
  if FSession <> nil then
    Result := FSession.MySQL
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLConnection.InternalGetCurrentCatalog: String;
begin
  if FSession <> nil then
    Result := FSession.DB
  else
    Result := inherited InternalGetCurrentCatalog;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.InternalAnalyzeSession(AMessages: TStrings);
begin
  inherited InternalAnalyzeSession(AMessages);
  if (FServerVersion >= mvMySQL050000) and (FServerVersion < mvMySQL050100) then
    AMessages.Add(Format(S_FD_MySQLWarnNoFK, [FDVerInt2Str(FServerVersion)]));
  if FClientVersion < mvMySQL050503 then
    AMessages.Add(Format(S_FD_MySQLWarnNoMR, [FDVerInt2Str(FClientVersion)]));
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLConnection.GetServerOutput;
begin
  if TFDTopResourceOptions(FOptions.ResourceOptions).ServerOutput and
     (FSession.WarningCount > 0) then
    FSession.GetServerOutput;
end;

{-------------------------------------------------------------------------------}
{ TFDPhysMySQLTransaction                                                       }
{-------------------------------------------------------------------------------}
function TFDPhysMySQLTransaction.GetConection: TFDPhysMySQLConnection;
begin
  Result := TFDPhysMySQLConnection(ConnectionObj);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalChanged;
var
  s: String;
begin
  if xoAutoCommit in GetOptions.Changed then
    MyConnection.InternalExecuteDirect(
      'SET AUTOCOMMIT = ' + IntToStr(Integer(GetOptions.AutoCommit)), nil);
  if xoIsolation in GetOptions.Changed then begin
    case GetOptions.Isolation of
    xiUnspecified:    Exit;
    xiDirtyRead:      s := 'READ UNCOMMITTED';
    xiReadCommitted:  s := 'READ COMMITTED';
    xiRepeatableRead: s := 'REPEATABLE READ';
    xiSnapshot:       s := 'REPEATABLE READ';
    xiSerializible:   s := 'SERIALIZABLE';
    end;
    MyConnection.InternalExecuteDirect(
      'SET SESSION TRANSACTION ISOLATION LEVEL ' + s, nil);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalStartTransaction(ATxID: LongWord);
begin
  DisconnectCommands(nil, dmRelease);
  MyConnection.InternalExecuteDirect('BEGIN', nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalCommit(ATxID: LongWord);
begin
  DisconnectCommands(nil, dmRelease);
  MyConnection.InternalExecuteDirect('COMMIT', nil);
  if Retaining then
    InternalStartTransaction(ATxID);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalRollback(ATxID: LongWord);
begin
  DisconnectCommands(nil, dmRelease);
  MyConnection.InternalExecuteDirect('ROLLBACK', nil);
  if Retaining then
    InternalStartTransaction(ATxID);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalCheckState(ACommandObj: TFDPhysCommand;
  ASuccess: Boolean);
var
  lInTx: Boolean;
begin
  lInTx := (MyConnection.FSession <> nil) and
    (MyConnection.FSession.ServerStatus and SERVER_STATUS_IN_TRANS <> 0);
  if lInTx <> GetActive then
    if lInTx then
      TransactionStarted
    else
      TransactionFinished
  else
    inherited InternalCheckState(ACommandObj, ASuccess);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLTransaction.InternalNotify(ANotification: TFDPhysTxNotification;
  ACommandObj: TFDPhysCommand);
begin
  if (ANotification = cpBeforeCmdExecute) and (
        // When server may have more results, eg in case of CALL <sp>, then
        // next mysql_real_query will give "Commands out of sync" error. See
        // http://dev.mysql.com/doc/refman/5.0/en/c-api-multiple-queries.html
        MyConnection.FSession.HasMoreResults or
        (TFDPhysMySQLCommand(ACommandObj).GetCommandKind in [skCommit, skRollback])
     ) then
    DisconnectCommands(nil, dmRelease);
  inherited InternalNotify(ANotification, ACommandObj);
end;

{-------------------------------------------------------------------------------}
{ TFDPhysMySQLCommand                                                           }
{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetCliObj: Pointer;
begin
  if FStmt <> nil then
    Result := FStmt
  else
    Result := FCursor;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetConection: TFDPhysMySQLConnection;
begin
  Result := TFDPhysMySQLConnection(FConnectionObj);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetSession: TMySQLSession;
begin
  Result := MyConnection.FSession;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.UpdateExecDirect;
var
  i: Integer;
begin
  FHasOutParams := False;
  for i := 0 to GetParams.Count - 1 do
    FHasOutParams := FHasOutParams or (GetParams()[i].ParamType in
      [ptOutput, ptInputOutput, ptResult]);

  if FHasOutParams and
      // MySQL >= 5.5.3 supports output parameters in PS API
     ((Session.ServerVersion < mvMySQL050503) or (Session.ClientVersion < mvMySQL050503)) then
    FUseDirectExec := True
  else
    FUseDirectExec :=
      // MySQL >= 5.1.x has more or less stable PS API.
      // Tested with 5.1.34. With 5.1.11 bugs reported.
      (Session.ClientVersion < mvMySQL050134) or
      GetOptions.ResourceOptions.DirectExecute or
      (GetMetaInfoKind <> FireDAC.Phys.Intf.mkNone) or
      not (GetCommandKind in [skSelect, skSelectForLock, skSelectForUnLock,
                              skDelete, skInsert, skMerge, skUpdate,
                              skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs,
                              skExecute]) or
      (Pos(';', FDbCommandText) <> 0) or
      (StrLIComp(PChar(FDbCommandText), PChar('SHOW'), 4) = 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.SetupReader(ARdr: TMySQLReader);
var
  oFmtOpts: TFDFormatOptions;
  oStmt: TMySQLStatement;
begin
  oFmtOpts := FOptions.FormatOptions;
  if GetMetaInfoKind <> mkNone then begin
    ARdr.StrsTrim := True;
    ARdr.StrsEmpty2Null := True;
    ARdr.StrsTrim2Len := False
  end
  else begin
    ARdr.StrsTrim := oFmtOpts.StrsTrim;
    ARdr.StrsEmpty2Null := oFmtOpts.StrsEmpty2Null;
    ARdr.StrsTrim2Len := oFmtOpts.StrsTrim2Len;
  end;
  ARdr.MaxStringSize := oFmtOpts.MaxStringSize;
  if ARdr is TMySQLStatement then begin
    oStmt := TMySQLStatement(ARdr);
    oStmt.UPDATE_MAX_LENGTH := 0;
    oStmt.PREFETCH_ROWS := FOptions.FetchOptions.ActualRowsetSize;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.FD2SQLDataType(AType: TFDDataType; ALen: LongWord;
  APrec, AScale: Integer; out ASQLDataType: enum_field_types; out ASQLUnsigned: Boolean;
  out ASQLLen: my_ulong; AInput: Boolean; AFmtOpts: TFDFormatOptions);
begin
  ASQLUnsigned := False;
  ASQLLen := 0;
  case AType of
  dtSByte,
  dtByte:
    begin
      ASQLDataType := MYSQL_TYPE_TINY;
      ASQLUnsigned := AType = dtByte;
    end;
  dtInt16,
  dtUInt16:
    begin
      ASQLDataType := MYSQL_TYPE_SHORT;
      ASQLUnsigned := AType = dtUInt16;
    end;
  dtInt32,
  dtUInt32:
    begin
      ASQLDataType := MYSQL_TYPE_LONG;
      ASQLUnsigned := AType = dtUInt32;
    end;
  dtInt64,
  dtUInt64:
    begin
      ASQLDataType := MYSQL_TYPE_LONGLONG;
      ASQLUnsigned := AType = dtUInt64;
    end;
  dtSingle:
    ASQLDataType := MYSQL_TYPE_FLOAT;
  dtDouble,
  dtExtended:
    ASQLDataType := MYSQL_TYPE_DOUBLE;
  dtCurrency:
    begin
      ASQLDataType := MYSQL_TYPE_DECIMAL;
      ASQLLen := 18 + 2;
    end;
  dtBCD,
  dtFmtBCD:
    begin
      ASQLDataType := MYSQL_TYPE_DECIMAL;
      if APrec = 0 then
        APrec := AFmtOpts.MaxBcdPrecision;
      ASQLLen := APrec + 2;
    end;
  dtDateTime:
    ASQLDataType := MYSQL_TYPE_DATETIME;
  dtDateTimeStamp:
    ASQLDataType := MYSQL_TYPE_TIMESTAMP;
  dtTime:
    ASQLDataType := MYSQL_TYPE_TIME;
  dtDate:
    ASQLDataType := MYSQL_TYPE_DATE;
  dtAnsiString,
  dtMemo,
  dtHMemo:
    begin
      ASQLDataType := MYSQL_TYPE_VAR_STRING;
      if (AType = dtAnsiString) and (ALen = 0) then
        ASQLLen := AFmtOpts.MaxStringSize
      else if (FStmt <> nil) and (Session.Encoder.Encoding = ecUTF8) then
        ASQLLen := ALen * C_FD_MaxUTF8Len
      else
        ASQLLen := ALen;
    end;
  dtWideString,
  dtWideMemo,
  dtXML,
  dtWideHMemo:
    begin
      ASQLDataType := MYSQL_TYPE_VAR_STRING;
      if (AType = dtWideString) and (ALen = 0) then
        ASQLLen := AFmtOpts.MaxStringSize
      else if (FStmt = nil) or (Session.Encoder.Encoding = ecUTF8) then
        ASQLLen := ALen * C_FD_MaxUTF8Len
      else
        ASQLLen := ALen;
    end;
  dtByteString,
  dtBlob,
  dtHBlob,
  dtHBFile:
    begin
      ASQLDataType := MYSQL_TYPE_BLOB;
      if (AType = dtByteString) and (ALen = 0) then
        ASQLLen := AFmtOpts.MaxStringSize
      else
        ASQLLen := ALen;
    end;
  dtGUID:
    begin
      ASQLDataType := MYSQL_TYPE_VAR_STRING;
      ASQLLen := 38;
    end;
  dtBoolean:
    if not AInput and (MyConnection.FTinyIntFormat = dtBoolean) then begin
      ASQLDataType := MYSQL_TYPE_BIT;
      ASQLLen := 1;
    end
    else
      ASQLDataType := MYSQL_TYPE_TINY;
  else
    ASQLDataType := 0;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.SQL2FDDataType(ASQLDataType: enum_field_types;
  ASQLUnsigned, ASQLIsBinary, ASQLIsNum: Boolean; ASQLLen, ASQLDecimals: my_ulong;
  out AType: TFDDataType; var AAttrs: TFDDataAttributes; out ALen: LongWord;
  out APrec, AScale: Integer; AFmtOpts: TFDFormatOptions);
begin
  AType := dtUnknown;
  ALen := 0;
  APrec := 0;
  AScale := 0;
  Exclude(AAttrs, caFixedLen);
  Exclude(AAttrs, caBlobData);
  Include(AAttrs, caSearchable);
  case ASQLDataType of
  MYSQL_TYPE_BIT:
    if ASQLLen = 1 then
      AType := dtBoolean
    else begin
      AType := dtByteString;
      ALen := (ASQLLen + 7) div 8;
      Include(AAttrs, caFixedLen);
    end;
  MYSQL_TYPE_TINY:
    begin
      if (ASQLLen = 1) and (MyConnection.FTinyIntFormat = dtBoolean) then
        AType := dtBoolean
      else if ASQLUnsigned then
        AType := dtByte
      else
        AType := dtSByte;
      APrec := ASQLLen;
    end;
  MYSQL_TYPE_SHORT:
    begin
      if ASQLUnsigned then
        AType := dtUInt16
      else
        AType := dtInt16;
      APrec := ASQLLen;
    end;
  MYSQL_TYPE_LONG,
  MYSQL_TYPE_INT24:
    begin
      if ASQLUnsigned then
        AType := dtUInt32
      else
        AType := dtInt32;
      APrec := ASQLLen;
    end;
  MYSQL_TYPE_LONGLONG:
    begin
      if ASQLUnsigned then
        AType := dtUInt64
      else
        AType := dtInt64;
      APrec := ASQLLen;
    end;
  MYSQL_TYPE_FLOAT,
  MYSQL_TYPE_DOUBLE:
    begin
      if ASQLLen = 0 then begin
        if ASQLDataType = MYSQL_TYPE_FLOAT then
          AType := dtSingle
        else
          AType := dtDouble
      end
      else begin
        if ASQLLen = 12 then
          AType := dtSingle
        else
          AType := dtDouble;
      end;
      APrec := ASQLLen;
      AScale := ASQLDecimals;
    end;
  MYSQL_TYPE_DECIMAL,
  MYSQL_TYPE_NEWDECIMAL:
    begin
      if ASQLDecimals = 0 then
        if ASQLUnsigned then begin
          if ASQLLen <= 3 then
            AType := dtByte
          else if ASQLLen <= 5 then
            AType := dtUInt16
          else if ASQLLen <= 10 then
            AType := dtUInt32
          else if ASQLLen <= 21 then
            AType := dtUInt64;
        end
        else begin
          if ASQLLen <= 2 then
            AType := dtSByte
          else if ASQLLen <= 4 then
            AType := dtInt16
          else if ASQLLen <= 9 then
            AType := dtInt32
          else if ASQLLen <= 20 then
            AType := dtInt64;
        end;
      APrec := ASQLLen;
      if ASQLDecimals > 0 then
        Dec(APrec);
      if not ASQLUnsigned then
        Dec(APrec);
      AScale := ASQLDecimals;
      if AType = dtUnknown then
        if AFmtOpts.IsFmtBcd(APrec, AScale) then
          AType := dtFmtBCD
        else
          AType := dtBCD;
    end;
  MYSQL_TYPE_DATE,
  MYSQL_TYPE_NEWDATE:
    AType := dtDate;
  MYSQL_TYPE_TIME:
    AType := dtTime;
  MYSQL_TYPE_DATETIME:
    AType := dtDateTime;
  MYSQL_TYPE_YEAR:
    AType := dtUInt16;
  MYSQL_TYPE_TIMESTAMP:
    begin
      AType := dtDateTimeStamp;
      Include(AAttrs, caRowVersion);
      Include(AAttrs, caAllowNull);
    end;
  MYSQL_TYPE_ENUM,
  MYSQL_TYPE_SET,
  MYSQL_TYPE_VAR_STRING,
  MYSQL_TYPE_STRING,
  MYSQL_TYPE_VARCHAR:
    if ASQLLen <= AFmtOpts.MaxStringSize then begin
      ALen := ASQLLen;
      if ASQLIsBinary then
        AType := dtByteString
      else if Session.Encoder.Encoding = ecUTF8 then begin
        AType := dtWideString;
        // MySQL multiplies ASQLLen (in characters) by 3 for UTF8 client character set.
        // This is for normal result sets only, not for output parameters.
        if not FGetOutParams then
          ALen := ASQLLen div 3;
      end
      else
        AType := dtAnsiString;
      if ASQLDataType = MYSQL_TYPE_STRING then
        Include(AAttrs, caFixedLen);
    end
    else begin
      if ASQLIsBinary then
        AType := dtBlob
      else if Session.Encoder.Encoding = ecUTF8 then
        AType := dtWideMemo
      else
        AType := dtMemo;
      Include(AAttrs, caBlobData);
    end;
  MYSQL_TYPE_TINY_BLOB,
  MYSQL_TYPE_MEDIUM_BLOB,
  MYSQL_TYPE_LONG_BLOB,
  MYSQL_TYPE_BLOB:
    if ASQLLen <= AFmtOpts.MaxStringSize then begin
      ALen := ASQLLen;
      if ASQLIsBinary then
        AType := dtByteString
      else if Session.Encoder.Encoding = ecUTF8 then
        AType := dtWideString
      else
        AType := dtAnsiString;
    end
    else begin
      if ASQLIsBinary then
        AType := dtBlob
      else if Session.Encoder.Encoding = ecUTF8 then
        AType := dtWideMemo
      else
        AType := dtMemo;
      Include(AAttrs, caBlobData);
      Exclude(AAttrs, caSearchable);
    end;
  MYSQL_TYPE_JSON:
    begin
      AType := dtWideMemo;
      Include(AAttrs, caBlobData);
    end;
  MYSQL_TYPE_NULL:
    if ASQLIsNum then
      AType := dtInt32
    else if Session.Encoder.Encoding = ecUTF8 then
      AType := dtWideString
    else
      AType := dtAnsiString;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.CreateParamInfos(ABatchSize: Integer);
var
  n, i, j: Integer;
  pInfo: PFDMySQLVarInfoRec;
  oParams: TFDParams;
  oParam: TFDParam;
  oVar: TMySQLVariable;
  oFmtOpts: TFDFormatOptions;
  eDestFldType: TFieldType;
  lUnsigned: Boolean;
  iSize: my_ulong;
  eAttrs: TFDDataAttributes;
  iLen: LongWord;
  iPrec, iScale: Integer;
begin
  oParams := GetParams;
  if (oParams.Count = 0) or (FStmt = nil) then
    Exit;

  oFmtOpts := FOptions.FormatOptions;
  n := FStmt.Params.Count div ABatchSize;
  SetLength(FParInfos, n);

  for i := 0 to n - 1 do begin
    pInfo := @FParInfos[i];
    case GetParams.BindMode of
    pbByName:   oParam := oParams.FindParam(oParams.Markers[i]);
    pbByNumber: oParam := oParams.FindParam(i + 1);
    else        oParam := nil;
    end;
    if oParam = nil then begin
      pInfo^.FPos := -1;
      Continue;
    end;
    oVar := FStmt.Params[i];
    pInfo^.FVar := oVar;
    pInfo^.FPos := oParam.Index + 1;

    if (oVar.DumpLabel = '') or (oVar.DumpLabel[1] = '#') then
      oVar.DumpLabel := oParam.DisplayName;
    pInfo^.FParamType := oParam.ParamType;

    pInfo^.FSrcFieldType := oParam.DataType;
    if oParam.DataType = ftUnknown then
      ParTypeUnknownError(oParam);
    oFmtOpts.ResolveFieldType('', oParam.DataTypeName, oParam.DataType,
      oParam.FDDataType, oParam.Size, oParam.Precision, oParam.NumericScale,
      eDestFldType, pInfo^.FSize, pInfo^.FPrec, pInfo^.FScale,
      pInfo^.FSrcDataType, pInfo^.FDestDataType, False);

    FD2SQLDataType(pInfo^.FDestDataType, pInfo^.FSize, pInfo^.FPrec, pInfo^.FScale,
      pInfo^.FOutSQLDataType, lUnsigned, iSize, True, oFmtOpts);
    SQL2FDDataType(pInfo^.FOutSQLDataType, lUnsigned,
      pInfo^.FDestDataType in [dtByteString, dtBlob, dtHBlob, dtHBFile], False,
      iSize, oFmtOpts.MaxBcdScale, pInfo^.FOutDataType, eAttrs, iLen, iPrec, iScale, oFmtOpts);

    oVar.DataType := pInfo^.FOutSQLDataType;
    oVar.FDDataType := pInfo^.FOutDataType;
    oVar.Unsigned := lUnsigned;
    oVar.FixedLen := eDestFldType in [ftFixedChar, ftFixedWideChar, ftBytes];
    oVar.DataSize := iSize;
    oVar.DumpLabel := oParam.SQLName;
    for j := 1 to ABatchSize - 1 do
      FStmt.Params[j * n + i].Assign(oVar);
  end;
  FStmt.BindParams;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.CreateColInfos;
var
  pInfo: PFDMySQLVarInfoRec;
  i: Integer;
  oFld: TMySQLField;
  name: PFDAnsiString;
  srcname: PFDAnsiString;
  db: PFDAnsiString;
  table: PFDAnsiString;
  type_: Byte;
  length_: LongWord;
  flags: LongWord;
  decimals: LongWord;
  charset: LongWord;
  oFmtOpts: TFDFormatOptions;
  oEnc: TFDEncoder;
  oVar: TMySQLVariable;
  lUnsigned: Boolean;
  iSize: my_ulong;
  eAttrs: TFDDataAttributes;
  iLen: LongWord;
  iPrec, iScale: Integer;
begin
  oFmtOpts := FOptions.FormatOptions;
  oEnc := Session.Encoder;
  SetLength(FColInfos, FCursor.FieldCount);

  for i := 0 to Length(FColInfos) - 1 do begin
    oFld := FCursor.Fields[i];
    pInfo := @FColInfos[i];
    if FStmt <> nil then
      oVar := FStmt.Fields[i]
    else
      oVar := nil;

    name := nil;
    srcname := nil;
    db := nil;
    table := nil;
    type_ := 0;
    length_ := 0;
    flags := 0;
    decimals := 0;
    charset := 0;
    oFld.GetInfo(name, srcname, table, db, type_, length_, flags, decimals,
      charset, FStmt = nil);

    // MySQL returns BINARY_FLAG for non-DBMS column based SELECT items,
    // like a DAYNAME(SYSDATE()). So, just workaround this issue.
    if ((srcname = nil) or (srcname^ = TFDAnsiChar(#0))) and
       (type_ = MYSQL_TYPE_VAR_STRING) and (flags and BINARY_FLAG <> 0) then begin
      flags := flags and not BINARY_FLAG;
      if Session.Encoder.Encoding = ecUTF8 then
        length_ := length_ * C_FD_MaxUTF8Len;
    end;

    pInfo^.FPos := i + 1;
    pInfo^.FVar := oVar;
    pInfo^.FName := oEnc.Decode(name, -1);
    pInfo^.FOriginDBName := oEnc.Decode(db, -1);
    pInfo^.FOriginTabName := oEnc.Decode(table, -1);
    pInfo^.FOriginColName := oEnc.Decode(srcname, -1);

    pInfo^.FAttrs := [];
    if (flags and NOT_NULL_FLAG) = 0 then
      Include(pInfo^.FAttrs, caAllowNull);
    if (flags and AUTO_INCREMENT_FLAG) <> 0 then begin
      Include(pInfo^.FAttrs, caAutoInc);
      Include(pInfo^.FAttrs, caAllowNull);
    end;
    if (MyConnection.FServerVersion >= mvMySQL050200) and
       not (caAutoInc in pInfo^.FAttrs) and
       ((flags and NO_DEFAULT_VALUE_FLAG) = 0) then
      Include(pInfo^.FAttrs, caDefault);

    SQL2FDDataType(type_, (flags and UNSIGNED_FLAG) <> 0,
      ((charset = 63) or (charset = 0)) and ((flags and BINARY_FLAG) <> 0),
      (flags and NUM_FLAG) <> 0, length_, decimals, pInfo^.FSrcDataType,
      pInfo^.FAttrs, pInfo^.FSize, pInfo^.FPrec, pInfo^.FScale, oFmtOpts);

    if GetMetaInfoKind = mkNone then
      oFmtOpts.ResolveDataType(pInfo^.FName, '',
        pInfo^.FSrcDataType, pInfo^.FSize, pInfo^.FPrec, pInfo^.FScale,
        pInfo^.FDestDataType, pInfo^.FSize, True)
    else
      pInfo^.FDestDataType := pInfo^.FSrcDataType;
    FD2SQLDataType(pInfo^.FDestDataType, pInfo^.FSize, pInfo^.FPrec, pInfo^.FScale,
      pInfo^.FOutSQLDataType, lUnsigned, iSize, False, oFmtOpts);
    SQL2FDDataType(pInfo^.FOutSQLDataType, lUnsigned,
      pInfo^.FDestDataType in [dtByteString, dtBlob, dtHBlob, dtHBFile], False,
      iSize, pInfo^.FScale, pInfo^.FOutDataType, eAttrs, iLen, iPrec, iScale, oFmtOpts);

    if oVar <> nil then begin
      oVar.DataType := pInfo^.FOutSQLDataType;
      oVar.FDDataType := pInfo^.FOutDataType;
      oVar.Unsigned := lUnsigned;
      oVar.FixedLen := caFixedLen in pInfo^.FAttrs;
      oVar.DataSize := iSize;
      oVar.DumpLabel := pInfo^.FName;
    end;

    if not CheckFetchColumn(pInfo^.FSrcDataType, pInfo^.FAttrs) then
      pInfo^.FPos := -1;
  end;

  if FStmt <> nil then
    FStmt.BindColumns;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.DestroyParamInfos;
begin
  SetLength(FParInfos, 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.DestroyColInfos;
begin
  SetLength(FColInfos, 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.PrepareBase;
begin
  FStmt.Prepare(FDbCommandText);
  SetupReader(FStmt);
  if FStmt.Params.Count > 0 then
    CreateParamInfos(1);

  // Do not create here column infos or output param infos, we does not
  // know how programmer will use command - Execute or Open. If Execute,
  // then create param infos, else column infos.
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalPrepare;
var
  oConnMeta: IFDPhysConnectionMetadata;
  rName: TFDPhysParsedName;
  i: Integer;
begin
  UpdateExecDirect;

  // generate metadata SQL command
  if GetMetaInfoKind <> FireDAC.Phys.Intf.mkNone then begin
    GetSelectMetaInfoParams(rName);
    GenerateSelectMetaInfo(rName);
    i := 1;
    while i <= Length(FDbCommandText) do begin
      SetLength(FMetaInfoSQLs, Length(FMetaInfoSQLs) + 1);
      FMetaInfoSQLs[Length(FMetaInfoSQLs) - 1] := FDExtractFieldName(FDbCommandText, i);
    end;
  end

  // generate metadata SQL command
  else if GetCommandKind in [skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs] then begin
    GetConnection.CreateMetadata(oConnMeta);
    oConnMeta.DecodeObjName(Trim(GetCommandText()), FSPParsedName, Self, []);
    FDbCommandText := '';
    if fiMeta in FOptions.FetchOptions.Items then begin
      GenerateStoredProcParams(FSPParsedName);
      if (Session.ServerVersion < mvMySQL050503) or (Session.ClientVersion < mvMySQL050503) then
        // output params are not supported in prepared statement mode before 5.5.3
        UpdateExecDirect;
    end;
    if not FUseDirectExec then
      FSPParsedName.FObject := '*' + FSPParsedName.FObject;
    // If an exact stored proc kind is not specified, then do not build a stored
    // proc call SQL, we does not know how a programmer will use a command - Execute
    // or Open. If Execute, then - EXEC PROC, else - SELECT.
    if (FDbCommandText = '') and (GetCommandKind <> skStoredProc) then
      GenerateStoredProcCall(FSPParsedName, GetCommandKind);
  end;

  // adjust SQL command
  GenerateLimitSelect();
  GenerateParamMarkers();

  if not FUseDirectExec then begin
    FStmt := TMySQLStatement.Create(Session, Self);
    if GetCommandKind <> skStoredProc then
      PrepareBase;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.CheckSPPrepared(ASPUsage: TFDPhysCommandKind);
begin
  if (FDbCommandText <> '') or (GetCommandKind <> skStoredProc) then
    Exit;
  GenerateStoredProcCall(FSPParsedName, ASPUsage);
  if FStmt <> nil then
    PrepareBase;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalUnprepare;
begin
  SetLength(FMetaInfoSQLs, 0);
  FPreparedBatchSize := 0;
  DestroyColInfos;
  DestroyParamInfos;
  if FStmt <> nil then begin
    FDFreeAndNil(FCursor);
    FStmt.Unprepare;
    FDFreeAndNil(FStmt);
  end
  else
    CloseStatement(True, -1);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalUseStandardMetadata: Boolean;
begin
  Result := not ((FGetOutParams or GetNextRecordSet) and
    (GetCommandKind in [skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs]));
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalColInfoStart(var ATabInfo: TFDPhysDataTableInfo): Boolean;
begin
  Result := OpenBlocked;
  if ATabInfo.FSourceID = -1 then begin
    ATabInfo.FSourceName := GetCommandText;
    ATabInfo.FSourceID := 1;
    FColumnIndex := 0;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalColInfoGet(var AColInfo: TFDPhysDataColumnInfo): Boolean;
var
  pColInfo: PFDMySQLVarInfoRec;
begin
  if FColumnIndex < Length(FColInfos) then begin
    pColInfo := @FColInfos[FColumnIndex];
    AColInfo.FSourceName := pColInfo^.FName;
    AColInfo.FSourceID := pColInfo^.FPos;
    AColInfo.FSourceType := pColInfo^.FSrcDataType;
    AColInfo.FSourceTypeName := pColInfo^.FSrcTypeName;
    AColInfo.FOriginTabName.FCatalog := pColInfo^.FOriginDBName;
    AColInfo.FOriginTabName.FObject := pColInfo^.FOriginTabName;
    AColInfo.FOriginColName := pColInfo^.FOriginColName;
    AColInfo.FType := pColInfo^.FDestDataType;
    AColInfo.FLen := pColInfo^.FSize;
    AColInfo.FPrec := pColInfo^.FPrec;
    AColInfo.FScale := pColInfo^.FScale;
    AColInfo.FAttrs := pColInfo^.FAttrs;
    AColInfo.FForceAddOpts := [];
    if caAutoInc in pColInfo^.FAttrs then
      Include(AColInfo.FForceAddOpts, coAfterInsChanged);
    Inc(FColumnIndex);
    Result := True;
  end
  else
    Result := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.SetParamValue(AFmtOpts: TFDFormatOptions;
  AParam: TFDParam; AVar: TMySQLVariable; ApInfo: PFDMySQLVarInfoRec;
  AParIndex: Integer);
var
  pData: PByte;
  iSize, iSrcSize: LongWord;
  oExtStr: TStream;
  oIntStr: TMySQLBlobStream;
  lExtStream: Boolean;
begin
  pData := nil;
  iSize := 0;

  // null
  if (AParam.DataType <> ftStream) and AParam.IsNulls[AParIndex] then
    AVar.SetData(nil, 0)

  // assign BLOB stream
  else if AParam.IsStreams[AParIndex] then begin
    oExtStr := AParam.AsStreams[AParIndex];
    lExtStream := (oExtStr <> nil) and
      not ((oExtStr is TMySQLBlobStream) and (TMySQLBlobStream(oExtStr).OwningObj = Self));
    if (AParam.DataType <> ftStream) and not lExtStream or
       not AVar.LongData then
      UnsupParamObjError(AParam);
    oIntStr := TMySQLBlobStream.Create(AVar, smOpenWrite);
    try
      if lExtStream then
        oIntStr.CopyFrom(oExtStr, -1)
      else begin
        FHasIntStreams := True;
        AParam.AsStreams[AParIndex] := oIntStr;
      end;
    finally
      if lExtStream then
        FDFree(oIntStr);
    end;
  end

  // conversion is not required
  else if ApInfo^.FOutDataType = ApInfo^.FSrcDataType then begin

    // byte string data, then optimizing - get data directly
    if AVar.LongData then begin
      oIntStr := TMySQLBlobStream.Create(AVar, smOpenWrite);
      try
        AParam.GetBlobRawData(iSize, pData, AParIndex);
        oIntStr.WriteStr(pData, iSize, ApInfo^.FOutDataType);
      finally
        FDFree(oIntStr);
      end;
    end

    else if ApInfo^.FOutDataType in (C_FD_VarLenTypes {$IFDEF NEXTGEN} - C_FD_AnsiTypes {$ENDIF}) then begin
      AParam.GetBlobRawData(iSize, pData, AParIndex);
      AVar.SetData(pData, iSize);
    end

    else begin
      iSize := AParam.GetDataLength(AParIndex);
      FBuffer.Check(iSize);
      AParam.GetData(FBuffer.Ptr, AParIndex);
      AVar.SetData(FBuffer.Ptr, iSize);
    end;
  end

  // conversion is required
  else begin
    // calculate buffer size to move param values
    iSrcSize := AParam.GetDataLength(AParIndex);
    FBuffer.Extend(iSrcSize, iSize, ApInfo^.FSrcDataType, ApInfo^.FOutDataType);

    // get, convert and set parameter value
    AParam.GetData(FBuffer.Ptr, AParIndex);
    AFmtOpts.ConvertRawData(ApInfo^.FSrcDataType, ApInfo^.FOutDataType,
      FBuffer.Ptr, iSrcSize, FBuffer.FBuffer, FBuffer.Size, iSize, Session.Encoder);

    if AVar.LongData then begin
      oIntStr := TMySQLBlobStream.Create(AVar, smOpenWrite);
      try
        oIntStr.WriteStr(FBuffer.Ptr, iSize, ApInfo^.FOutDataType);
      finally
        FDFree(oIntStr);
      end;
    end

    else
      AVar.SetData(FBuffer.Ptr, iSize);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.SetParamValues(ABatchSize, AOffset: Integer);
var
  oParams: TFDParams;
  oFmtOpts: TFDFormatOptions;
  oParam: TFDParam;
  oVar: TMySQLVariable;
  iParamsCount, i, j: Integer;
  pParInfo: PFDMySQLVarInfoRec;
begin
  FHasIntStreams := False;
  oParams := GetParams;
  if oParams.Count = 0 then
    Exit;

  oFmtOpts := GetOptions.FormatOptions;
  iParamsCount := Length(FParInfos);
  for i := 0 to iParamsCount - 1 do begin
    pParInfo := @FParInfos[i];
    if pParInfo^.FPos <> -1 then begin
      oParam := oParams[pParInfo^.FPos - 1];
      if (pParInfo^.FVar <> nil) and
         (oParam.DataType <> ftCursor) and
         (oParam.ParamType in [ptInput, ptInputOutput, ptUnknown]) then
        CheckParamMatching(oParam, pParInfo^.FSrcFieldType, pParInfo^.FParamType, 0);
        for j := 0 to ABatchSize - 1 do begin
          if j = 0 then
            oVar := pParInfo^.FVar
          else
            oVar := FStmt.Params[j * iParamsCount + pParInfo^.FPos - 1];
          SetParamValue(oFmtOpts, oParam, oVar, pParInfo, j + AOffset);
        end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.DataValue2MySQL(AData: Pointer; ALen: LongWord;
  AType: TFDDataType; out ATypeSupported: Boolean): TFDByteString;
const
  SDateFmt: String = '''%.4d-%.2d-%.2d''';
  STimeFmt: String = '''%s%.2d:%.2d:%.2d.%.6d''';
  SDateTimeFmt1: String = '''%.4d-%.2d-%.2d %.2d:%.2d:%.2d.%.6d''';
  SDateTimeFmt2: String = '''%.4d%.2d%.2d%.2d%.2d%.2d''';
  SGUIDFmt: String = '''%.8x-%.4x-%.4x-%.2x%.2x-%.2x%.2x%.2x%.2x%.2x%.2x''';
var
  iSz: Integer;
  aBuff: array [0..65] of Char;
  pBuff: PChar;
  s: String;
  dt: TDateTime;
  y, mo, d, h, mi, se, ms: Word;
  sFmt: String;
  rTS: TSQLTimeStamp;

  procedure RetStr(const AStr: String);
  begin
    s := AStr;
    pBuff := PChar(s);
    iSz := Length(s);
  end;

  function EncodeUTF8(AData: Pointer; ALen: LongWord; AEncoding: TFDEncoding): TFDByteString;
  const
    C_UTF8: array [0 .. 4] of Byte = (Ord('_'), Ord('u'), Ord('t'), Ord('f'), Ord('8'));
    C_UTF8MB4: array [0 .. 7] of Byte = (Ord('_'), Ord('u'), Ord('t'), Ord('f'), Ord('8'), Ord('m'), Ord('b'), Ord('4'));
  var
    pUTF8: Pointer;
    iSz: Integer;
    pEnc: PByte;
    iEnc: Integer;
  begin
    pUTF8 := nil;
    iSz := Session.Encoder.Encode(AData, ALen, pUTF8, AEncoding, ecUTF8);
    if Session.UTf8mb4 then begin
      pEnc := @C_UTF8MB4[0];
      iEnc := SizeOf(C_UTF8MB4);
    end
    else begin
      pEnc := @C_UTF8[0];
      iEnc := SizeOf(C_UTF8);
    end;
    SetLength(Result, (iSz * 2 + iEnc + 4) * SizeOf(TFDAnsiChar));
    iSz := Session.EscapeString(PFDAnsiString(Result) + (iEnc + 1) * SizeOf(TFDAnsiChar),
      PFDAnsiString(pUTF8), iSz);
    Move(pEnc^, PFDAnsiString(Result)^, iEnc);
    (PFDAnsiString(Result) + iEnc)^ := TFDAnsiChar('''');
    (PFDAnsiString(Result) + iSz + iEnc + 1)^ := TFDAnsiChar('''');
    (PFDAnsiString(Result) + iSz + iEnc + 2)^ := TFDAnsiChar(#0);
    SetLength(Result, iSz + iEnc + 3);
  end;

begin
  SetLength(Result, 0);
  ATypeSupported := True;
  pBuff := aBuff;
  iSz := SizeOf(aBuff) div SizeOf(Char);
  case AType of
  dtBoolean:
    if MyConnection.FServerVersion >= mvMySQL050000 then
      if PWordBool(AData)^ then
        RetStr('TRUE')
      else
        RetStr('FALSE')
    else
      if PWordBool(AData)^ then
        RetStr('1')
      else
        RetStr('0');
  dtSByte:
    FDInt2Str(AData, SizeOf(ShortInt), pBuff, iSz, False, 0);
  dtInt16:
    FDInt2Str(AData, SizeOf(SmallInt), pBuff, iSz, False, 0);
  dtInt32:
    FDInt2Str(AData, SizeOf(Integer), pBuff, iSz, False, 0);
  dtInt64:
    FDInt2Str(AData, SizeOf(Int64), pBuff, iSz, False, 0);
  dtByte:
    FDInt2Str(AData, SizeOf(Byte), pBuff, iSz, True, 0);
  dtUInt16:
    FDInt2Str(AData, SizeOf(Word), pBuff, iSz, True, 0);
  dtUInt32:
    FDInt2Str(AData, SizeOf(Cardinal), pBuff, iSz, True, 0);
  dtUInt64:
    FDInt2Str(AData, SizeOf(UInt64), pBuff, iSz, True, 0);
  dtCurrency:
    FDCurr2Str(pBuff, iSz, PCurrency(AData)^, '.');
  dtSingle:
    RetStr(FDFloat2Str(PSingle(AData)^, '.', 8));
  dtDouble:
    RetStr(FDFloat2Str(PDouble(AData)^, '.', 16));
  dtExtended:
    RetStr(FDFloat2Str(PExtended(AData)^, '.', 20));
  dtBCD,
  dtFmtBCD:
    FDBCD2Str(pBuff, iSz, PBcd(AData)^, '.');
  dtDate:
    begin
      rTS := FDDate2SQLTimeStamp(PInteger(AData)^);
      iSz := WideFormatBuf(aBuff[0], iSz, PChar(SDateFmt)^, Length(SDateFmt),
        [rTS.Year, rTS.Month, rTS.Day]);
    end;
  dtTime:
    begin
      rTS := FDTime2SQLTimeStamp(PInteger(AData)^);
      // Delphi does not support negative time value, but MySQL does
      if PInteger(AData)^ < 0 then
        s := '-'
      else
        s := '';
      iSz := WideFormatBuf(aBuff[0], iSz, PChar(STimeFmt)^, Length(STimeFmt),
        [s, rTS.Hour, rTS.Minute, rTS.Second, rTS.Fractions * 1000]);
    end;
  dtDateTime:
    begin
      dt := FDMSecs2DateTime(PDateTimeRec(AData)^.DateTime);
      DecodeDate(dt, y, mo, d);
      DecodeTime(dt, h, mi, se, ms);
      iSz := WideFormatBuf(aBuff[0], iSz, PChar(SDateTimeFmt1)^, Length(SDateTimeFmt1),
        [y, mo, d, h, mi, se, ms * 1000]);
    end;
  dtDateTimeStamp:
    begin
      rTS := PSQLTimeStamp(AData)^;
      if MyConnection.FServerVersion >= mvMySQL040100 then
        sFmt := SDateTimeFmt1
      else
        sFmt := SDateTimeFmt2;
      iSz := WideFormatBuf(aBuff[0], iSz, PChar(sFmt)^, Length(sFmt),
        [rTS.Year, rTS.Month, rTS.Day, rTS.Hour, rTS.Minute, rTS.Second, rTS.Fractions * 1000]);
    end;
  dtByteString,
  dtBlob:
    if (ALen = 0) and FOptions.FormatOptions.StrsEmpty2Null then
      RetStr('NULL')
    else begin
      SetLength(Result, (ALen * 2 + 4) * SizeOf(TFDAnsiChar));
      FDBin2HexBS(AData, ALen, PByte(Result) + 2 * SizeOf(TFDAnsiChar));
      PFDAnsiString(Result)^ := TFDAnsiChar('x');
      (PFDAnsiString(Result) + 1)^ := TFDAnsiChar('''');
      (PFDAnsiString(Result) + ALen * 2 + 2)^ := TFDAnsiChar('''');
      (PFDAnsiString(Result) + ALen * 2 + 3)^ := TFDAnsiChar(#0);
    end;
  dtAnsiString,
  dtMemo:
    if (ALen = 0) and FOptions.FormatOptions.StrsEmpty2Null then
      RetStr('NULL')
    else if Session.Encoder.Encoding = ecUTF8 then
      Result := EncodeUTF8(AData, ALen, ecANSI)
    else begin
      SetLength(Result, (ALen * 2 + 4) * SizeOf(TFDAnsiChar));
      iSz := Session.EscapeString(PFDAnsiString(Result) + 1 * SizeOf(TFDAnsiChar),
        PFDAnsiString(AData), ALen);
      PFDAnsiString(Result)^ := TFDAnsiChar('''');
      (PFDAnsiString(Result) + iSz + 1)^ := TFDAnsiChar('''');
      (PFDAnsiString(Result) + iSz + 2)^ := TFDAnsiChar(#0);
      SetLength(Result, iSz + 3);
    end;
  dtWideString,
  dtWideMemo,
  dtXML:
    if (ALen = 0) and FOptions.FormatOptions.StrsEmpty2Null then
      RetStr('NULL')
    else
      Result := EncodeUTF8(AData, ALen, ecUTF16);
  dtGUID:
    iSz := WideFormatBuf(aBuff[0], iSz, PChar(SGUIDFmt)^, Length(SGUIDFmt),
      [PGUID(AData)^.D1, PGUID(AData)^.D2, PGUID(AData)^.D3, PGUID(AData)^.D4[0],
       PGUID(AData)^.D4[1], PGUID(AData)^.D4[2], PGUID(AData)^.D4[3],
       PGUID(AData)^.D4[4], PGUID(AData)^.D4[5], PGUID(AData)^.D4[6],
       PGUID(AData)^.D4[7]]);
  else
    ATypeSupported := False;
  end;
  if Length(Result) = 0 then
    Result := Session.Encoder.Encode(pBuff, iSz);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetBatchSQL(ABatchSize: Integer): String;
var
  sValues: String;
  i, iOrigLen, iFullLen: Integer;
begin
  Result := FDbCommandText;
  if FSQLValuesPosEnd = 0 then
    FSQLValuesPosEnd := Length(Result);
  sValues := ',' + Copy(Result, FSQLValuesPos + 6, FSQLValuesPosEnd - (FSQLValuesPos + 6) + 1);
  iOrigLen := Length(Result);
  iFullLen := iOrigLen + (ABatchSize - 1) * Length(sValues);
  SetLength(Result, iFullLen);
  if FSQLValuesPosEnd < Length(FDbCommandText) then
    Move(Result[FSQLValuesPosEnd + 1], Result[iFullLen - (iOrigLen - FSQLValuesPosEnd) + 1],
      (iOrigLen - FSQLValuesPosEnd) * SizeOf(Char));
  for i := 0 to ABatchSize - 2 do
    Move(sValues[1], Result[FSQLValuesPosEnd + 1 + i * Length(sValues)],
      Length(sValues) * SizeOf(Char));
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetExpandedSQL(ATimes, AOffset: Integer): TFDByteString;
var
  pSrcCh, pDestCh, pDestEnd: PByte;
  iFullLen, iPar, iRow: Integer;
  sSQL: String;
  sSubst, sEncSQL, sNULL, sQMark: TFDByteString;
  oParam: TFDParam;
  iSize, iSrcDataLen, iDestDataLen: LongWord;
  iPrec, iScale: Integer;
  iFieldType: TFieldType;
  iSrcDataType, iDestDataType: TFDDataType;
  oFmtOpts: TFDFormatOptions;
  lTypeSupported: Boolean;
  oParams: TFDParams;
  oStr: TStream;
  oEnc: TFDEncoder;

  procedure ErrorParamType(const AReason: String);
  begin
    FDException(Self, [S_FD_LPhys, S_FD_MySQLId], er_FD_MySQLBadParams,
      [oParam.Name, AReason]);
  end;

  procedure ExtendDest(AMinLen: Integer);
  var
    iPos: Integer;
  begin
    if AMinLen < 1024 then
      AMinLen := 1024;
    if pDestCh = nil then
      iPos := 0
    else
      iPos := pDestCh - PByte(Result);
    SetLength(Result, oEnc.EncodedLength(Result) + AMinLen);
    pDestCh := PByte(Result) + iPos;
    pDestEnd := PByte(Result) + oEnc.EncodedLength(Result);
  end;

  procedure WriteDest(const AStr: TFDByteString);
  var
    iLen: Integer;
  begin
    iLen := oEnc.EncodedLength(AStr);
    if pDestCh + iLen >= pDestEnd then
      ExtendDest(iLen);
    Move(PByte(AStr)^, pDestCh^, iLen * SizeOf(TFDAnsiChar));
    Inc(pDestCh, iLen);
  end;

begin
  oEnc := Session.Encoder;
  if (ATimes - AOffset > 1) and
     (GetCommandKind in [skInsert, skMerge]) and (FSQLValuesPos > 0) then
    sSQL := GetBatchSQL(ATimes - AOffset)
  else
    sSQL := FDbCommandText;
  sEncSQL := oEnc.Encode(sSQL);
  oParams := GetParams();
  if oParams.Count = 0 then
    Result := sEncSQL
  else begin
    oFmtOpts := GetOptions.FormatOptions;
    pSrcCh := PByte(sEncSQL);
    pDestCh := nil;
    ExtendDest(0);
    iPar := 0;
    iRow := AOffset;
    SetLength(sNULL, 0);
    SetLength(sQMark, 0);
    while True do begin
                                                                                                       
      while (PFDAnsiString(pSrcCh)^ <> TFDAnsiChar(#0)) and
            (PFDAnsiString(pSrcCh)^ <> TFDAnsiChar('?')) do begin
        if pDestCh = pDestEnd then
          ExtendDest(0);
        pDestCh^ := pSrcCh^;
        Inc(pDestCh);
        Inc(pSrcCh);
      end;
      if PFDAnsiString(pSrcCh)^ = TFDAnsiChar(#0) then
        Break
      else if PFDAnsiString(pSrcCh)^ = TFDAnsiChar('?') then begin
        oParam := nil;
        while True do begin
          case GetParams.BindMode of
          pbByName:   oParam := oParams.FindParam(oParams.Markers[iPar]);
          pbByNumber: oParam := oParams.FindParam(iPar + 1);
          end;
          if (oParam = nil) or (oParam.ParamType in [ptUnknown, ptInput, ptInputOutput]) then
            Break;
          if iPar = oParams.Markers.Count - 1 then begin
            oParam := nil;
            Break;
          end;
          Inc(iPar);
        end;
        if oParam <> nil then begin
          // check parameter definition
          if oParam.ParamType in [ptOutput, ptResult] then
            ErrorParamType('Output parameters are not supported');
          if oParam.DataType = ftUnknown then
            ParTypeUnknownError(oParam);
          lTypeSupported := True;
          iFieldType := ftUnknown;
          iSize := 0;
          iPrec := 0;
          iSrcDataType := dtUnknown;
          iDestDataType := dtUnknown;
          iDestDataLen := 0;
          oFmtOpts.ResolveFieldType('', oParam.DataTypeName, oParam.DataType, oParam.FDDataType,
            oParam.Size, oParam.Precision, oParam.NumericScale, iFieldType, iSize, iPrec, iScale,
            iSrcDataType, iDestDataType, False);

          // null
          if oParam.IsNulls[iRow] then begin
            if Length(sNULL) = 0 then
              sNULL := oEnc.Encode('NULL');
            sSubst := sNULL;
          end

          // assign BLOB stream
          else if oParam.IsStreams[iRow] then begin
            oStr := oParam.AsStreams[iRow];
            if (oStr = nil) or (oStr.Size < 0) then
              UnsupParamObjError(oParam);
            iSize := oStr.Size;
            FBuffer.Check(iSize);
            oStr.Position := 0;
            oStr.Read(FBuffer.Ptr^, iSize);
            sSubst := DataValue2MySQL(FBuffer.Ptr, iSize, iDestDataType,
              lTypeSupported);
          end

          // scalar value
          else begin
            iSrcDataLen := oParam.GetDataLength(iRow);
            // approximating destination data size and allocate buffer
            FBuffer.Extend(iSrcDataLen, iDestDataLen, iSrcDataType, iDestDataType);
            // fill buffer with value, converting it, if required
            oParam.GetData(FBuffer.Ptr, iRow);
            oFmtOpts.ConvertRawData(iSrcDataType, iDestDataType, FBuffer.Ptr,
              iSrcDataLen, FBuffer.FBuffer, FBuffer.Size, iDestDataLen, oEnc);
            sSubst := DataValue2MySQL(FBuffer.Ptr, iDestDataLen, iDestDataType,
              lTypeSupported);
          end;

          if not lTypeSupported then
            ParTypeMapError(oParam);
          WriteDest(sSubst);
          Inc(iPar);
          if iPar >= oParams.Markers.Count then begin
            iPar := 0;
            Inc(iRow);
          end;
        end
        else begin
          if Length(sQMark) = 0 then
            sQMark := oEnc.Encode('?');
          WriteDest(sQMark);
        end;
      end;
      Inc(pSrcCh);
    end;
    iFullLen := pDestCh - PByte(Result);
    SetLength(Result, iFullLen + 1);
    (PFDAnsiString(Result) + iFullLen)^ := TFDAnsiChar(#0);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetResultMode: TFDMySQLResultMode;
begin
  case MyConnection.FResultMode of
  rmStore:
    Result := rmStore;
  rmUse:
    Result := rmUse;
  rmChoose:
    if FOptions.FetchOptions.Mode in [fmAll, fmExactRecsMax] then
      Result := rmStore
    else
      Result := rmUse;
  else
    Result := rmStore;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetCursor(AClosing: Boolean; AParIndex: Integer): Boolean;
var
  oCon: TFDPhysMySQLConnection;
begin
  oCon := MyConnection;
  oCon.UpdateInsertId(FStmt, False);
  DestroyColInfos;
  FDFreeAndNil(FCursor);

  if FStmt <> nil then begin
    repeat
      if not AClosing and (GetResultMode = rmStore) and
         (Session.ServerStatus and SERVER_PS_OUT_PARAMS = 0) then
        FStmt.StoreResult;
      FCursor := FStmt.Describe;
    until (FCursor <> nil) or
          not FStmt.MoreResults or
          not FStmt.NextResult;
  end

  else begin
    repeat
      if GetResultMode = rmStore then
        FCursor := oCon.FSession.StoreResult
      else
        FCursor := oCon.FSession.UseResult;
    until (FCursor <> nil) or
          not oCon.FSession.MoreResults or
          not oCon.FSession.NextResult;
  end;

  if FCursor <> nil then begin
    SetupReader(FCursor);
    FGetOutParams := AreOutParams();
    try
      CreateColInfos;
      Result := Length(FColInfos) > 0;
      if Result and FGetOutParams then begin
        GetParamValues(AParIndex);
        Result := False;
        if not AClosing then
          CloseStatement(True, AParIndex);
      end;
    finally
      FGetOutParams := False;
    end;
  end
  else begin
    Result := False;
    oCon.GetServerOutput;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.CheckArray(ASize: Integer): Boolean;
begin
  Result := (ASize = 1) and (FPreparedBatchSize <= 1) or
            (ASize = FPreparedBatchSize);
  if not Result then begin
    FDFreeAndNil(FCursor);
    DestroyParamInfos;
    FStmt.Unprepare;
    FPreparedBatchSize := ASize;
    if ASize = 1 then begin
      FStmt.Params.Count := Length(FParInfos);
      FStmt.Prepare(FDBCommandText);
      SetupReader(FStmt);
      CreateParamInfos(ASize);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.ExecuteBatchInsert(ATimes, AOffset: Integer;
  var ACount: TFDCounter);
var
  iMaxSize, iBatchSize, iCurTimes, iCurOffset: Integer;
  sSQL: String;
  iRows: my_ulonglong;
begin
  iBatchSize := ATimes - AOffset;
  iMaxSize := 65535 div GetParams.Count;
  if iBatchSize > iMaxSize then
    iBatchSize := iMaxSize;
  iMaxSize := GetOptions.ResourceOptions.ArrayDMLSize;
  if (iMaxSize <> $7FFFFFFF) and (iBatchSize > iMaxSize) then
    iBatchSize := iMaxSize;

  iCurOffset := AOffset;
  iCurTimes := AOffset + iBatchSize;
  while iCurOffset < ATimes do begin
    if iCurTimes > ATimes then begin
      iCurTimes := ATimes;
      iBatchSize := iCurTimes - iCurOffset;
    end;

    if not CheckArray(iBatchSize) then begin
      sSQL := GetBatchSQL(iBatchSize);
      FStmt.Prepare(sSQL);
      CreateParamInfos(iBatchSize);
    end;

    FStmt.Reset;
    SetParamValues(iBatchSize, iCurOffset);
    try
      FStmt.Execute;
    finally
      iRows := FStmt.AffectedRows;
      if iRows <> MYSQL_COUNT_ERROR then
        Inc(ACount, iRows);
    end;

    Inc(iCurOffset, iBatchSize);
    Inc(iCurTimes, iBatchSize);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.DoExecute(ATimes, AOffset: Integer;
  var ACount: TFDCounter; AFlush: Boolean);
var
  sSQL: TFDByteString;
  oCon: TFDPhysMySQLConnection;
  i: Integer;
  iCount: TFDCounter;
  iRows: my_ulonglong;
begin
  if GetCommandKind = skStoredProc then
    CheckSPPrepared(skStoredProcNoCrs);

  ACount := 0;
  oCon := MyConnection;
  oCon.FLock.Enter;
  try

    if FStmt <> nil then begin
      if (ATimes - AOffset > 1) and
         (GetCommandKind in [skInsert, skMerge]) and (FSQLValuesPos > 0) then
        ExecuteBatchInsert(ATimes, AOffset, ACount)

      else begin
        CheckArray(1);
        for i := AOffset to ATimes - 1 do begin
          if not AFlush then begin
            FStmt.Reset;
            SetParamValues(1, i);
            CheckArrayDMLWithIntStr(FHasIntStreams, ATimes, AOffset);
          end;
          if FHasIntStreams xor AFlush then begin
            ACount := -1;
            Exit;
          end;
          try
            try
              FStmt.Execute;
            finally
              iRows := FStmt.AffectedRows;
              if iRows <> MYSQL_COUNT_ERROR then
                Inc(ACount, iRows)
              else
                iRows := 0;
            end;
            CheckExact(ATimes = 1, 1, 0, iRows, False);
          except
            on E: EMySQLNativeException do begin
              E[0].RowIndex := i;
              raise;
            end;
          end;
        end;
      end;
    end

    else begin
      // For a while driver can create batch only for INSERT INTO statement.
      // Probably, a technique similar to FB EXECUTE BLOCK may be used.
      if (ATimes - AOffset > 1) and
         (GetCommandKind in [skInsert, skMerge]) and (FSQLValuesPos > 0) then
        sSQL := GetExpandedSQL(ATimes, AOffset)
      // otherwise just emulate batch
      else if ATimes - AOffset > 1 then begin
        for i := AOffset to ATimes - 1 do begin
          iCount := 0;
          try
            InternalExecute(i + 1, i, iCount);
          finally
            Inc(ACount, iCount);
          end;
          CheckExact(False, 1, 0, iCount, False);
        end;
        Exit;
      end
      else
        sSQL := GetExpandedSQL(ATimes, AOffset);
      try
        try
          oCon.FSession.QuerySB(sSQL, Self);
        except
          on E: EMySQLNativeException do begin
            if ATimes - AOffset = 1 then
              E.Errors[0].RowIndex := AOffset;
            raise;
          end;
        end;
      finally
        if FCursor = nil then begin
          iRows := oCon.FSession.AffectedRows;
          if iRows <> MYSQL_COUNT_ERROR then
            Inc(ACount, iRows);
        end;
      end;
    end;

    CloseStatement(True, AOffset);
    oCon.GetServerOutput;
    if not (GetCommandKind in [skSelect, skSelectForLock, skSelectForUnLock]) then
      oCon.UpdateInsertId(FStmt, True);
  finally
    oCon.FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalExecute(ATimes, AOffset: Integer;
  var ACount: TFDCounter);
begin
  DoExecute(ATimes, AOffset, ACount, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalCloseStreams;
var
  iTmp: TFDCounter;
begin
  if (FStmt <> nil) and FHasIntStreams then begin
    GetParams.Close;
    DoExecute(1, 0, iTmp, True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalAbort;
var
  oCon: TFDPhysMySQLConnection;
begin
  oCon := MyConnection;
  if oCon.FServerVersion >= mvMySQL050000 then begin
    oCon.FSession.KillQuery;
    // Workaround for https://bugs.mysql.com/bug.php?id=70618
    if oCon.FServerVersion <= mvMySQL050700 then
      oCon.QueryValue('SELECT SLEEP(0)', 0);
  end
  else
    inherited InternalAbort;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalOpen(var ACount: TFDCounter): Boolean;
var
  sSQL: TFDByteString;
  iSQL: Integer;
  oCon: TFDPhysMySQLConnection;
  oEnc: TFDEncoder;
  lFailed: Boolean;
  iRows: my_ulonglong;
begin
  if GetCommandKind = skStoredProc then
    CheckSPPrepared(skStoredProcWithCrs);

  ACount := 0;
  Result := False;
  lFailed := False;
  oCon := MyConnection;
  oCon.FLock.Enter;
  try
  try

    if FStmt <> nil then begin
      if not (FStmt.State in [msInactive, msPrepared, msExecuted, msEOF]) then
        Result := True
      else begin
        CheckArray(1);
        FStmt.Reset;
        SetParamValues(1, 0);
        try
          FStmt.Execute;
        finally
          iRows := FStmt.AffectedRows;
          if iRows <> MYSQL_COUNT_ERROR then
            ACount := iRows
          else
            ACount := -1;
        end;
        Result := GetCursor(False, -1);
      end;
    end

    else if FCursor = nil then begin
      oEnc := oCon.FSession.Encoder;
      iSQL := 0;
      if not (GetMetaInfoKind in [mkNone, mkForeignKeys, mkForeignKeyFields]) then
        if Length(FMetaInfoSQLs) = 0 then
          SetLength(sSQL, 0)
        else
          sSQL := oEnc.Encode(FMetaInfoSQLs[0])
      else
        sSQL := GetExpandedSQL(1, 0);
      while oEnc.EncodedLength(sSQL) <> 0 do
        try
          try
            oCon.FSession.QuerySB(sSQL, Self);
            SetLength(sSQL, 0);
            Result := GetCursor(False, -1);
          finally
            if FCursor = nil then begin
              iRows := oCon.FSession.AffectedRows;
              if iRows <> MYSQL_COUNT_ERROR then
                ACount := iRows
              else
                ACount := -1;
            end;
          end;
        except
          on E: EMySQLNativeException do
            if GetMetaInfoKind <> mkNone then begin
              Inc(iSQL);
              if iSQL = Length(FMetaInfoSQLs) then
                if E.Kind = ekObjNotExists then
                  SetLength(sSQL, 0)
                else
                  raise
              else
                sSQL := oEnc.Encode(FMetaInfoSQLs[iSQL]);
            end
            else
              raise;
        end;
    end;

  except
    lFailed := True;
    raise;
  end;
  finally
    TFDPhysMySQLTransaction(FTransactionObj).InternalCheckState(Self, not lFailed);
    oCon.FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalNextRecordSet: Boolean;
var
  oCon: TFDPhysMySQLConnection;
begin
  Result := False;
  oCon := MyConnection;
  oCon.FLock.Enter;
  try
    InternalClose;

    if FStmt <> nil then begin
      if FStmt.MoreResults and FStmt.NextResult then
        Result := GetCursor(False, -1);
    end

    else begin
      if oCon.FSession.MoreResults and oCon.FSession.NextResult then
        Result := GetCursor(False, -1);
    end;
  finally
    oCon.FLock.Leave;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.AreOutParams: Boolean;
begin
  Result := (FCursor <> nil) and
    ((Session.ServerStatus and SERVER_PS_OUT_PARAMS <> 0) or not Session.MoreResults) and
    (GetCommandKind in [skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs]);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.GetParamValues(AIndex: Integer);
var
  oTab: TFDDatSTable;
  i, j: Integer;
  s: String;
  v: Variant;
  oParams: TFDParams;
  oPar: TFDParam;
  ePrevState: TFDPhysCommandState;
  rState: TFDDatSLoadState;
begin
  if AIndex < 0 then
    AIndex := 0;
  oParams := GetParams();
  oTab := TFDDatSTable.Create;
  oTab.Setup(FOptions);
  ePrevState := GetState;
  SetState(csOpen);
  try
    Define(oTab);
    oTab.BeginLoadData(rState, lmHavyFetching);
    try
      if FStmt <> nil then
        FStmt.Fetch
      else
        FCursor.Fetch(1);
      FetchRow(oTab, nil);
      for i := 0 to oTab.Columns.Count - 1 do begin
        oPar := oParams.FindParam(oTab.Columns[i].Name);
        if (oPar <> nil) and (oPar.ParamType in [ptOutput, ptInputOutput, ptResult]) then begin
          v := oTab.Rows[0].GetData(i);
          case oPar.DataType of
          ftSingle,
          ftFloat,
          ftExtended,
          ftCurrency,
          ftBCD, ftFMTBcd:
            if FormatSettings.DecimalSeparator <> '.' then begin
              s := v;
              j := Pos('.', s);
              if j <> 0 then
                s[j] := FormatSettings.DecimalSeparator;
              oPar.Values[AIndex] := s;
            end
            else
              oPar.Values[AIndex] := v;
          ftBoolean:
            begin
              s := Trim(UpperCase(v));
              oPar.Values[AIndex] := (s = '1') or (s = 'TRUE');
            end;
          else
            oPar.Values[AIndex] := v;
          end;
        end;
      end;
    finally
      oTab.EndLoadData(rState);
    end;
  finally
    SetState(ePrevState);
    FDFree(oTab);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.InternalClose;
begin
  CloseStatement(False, -1);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.CloseStatement(AForceClose: Boolean; AIndex: Integer);
var
  oCon: TFDPhysMySQLConnection;
begin
  oCon := MyConnection;
  if (FStmt <> nil) and not (AForceClose or not GetNextRecordSet) then
    FStmt.Close;

  if AForceClose or not GetNextRecordSet then
    if FStmt <> nil then
      while FStmt.MoreResults and FStmt.NextResult do begin
        GetCursor(True, AIndex);
        FStmt.Close;
      end
    else
      while oCon.FSession.MoreResults and oCon.FSession.NextResult do
        GetCursor(True, AIndex);

  FDFreeAndNil(FCursor);
  if not GetNextRecordSet then
    oCon.GetServerOutput;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.ProcessResColumn(AFmtOpts: TFDFormatOptions;
  AColIndex: Integer; ARow: TFDDatSRow; ApInfo: PFDMySQLVarInfoRec);
var
  pData: Pointer;
  iSize, iDestSize: LongWord;
begin
  pData := nil;
  iSize := 0;
  FCursor.GetFieldData(ApInfo^.FPos - 1, pData, iSize);
  pData := FBuffer.Check((iSize + 1) * SizeOf(WideChar));

  // null
  if not FCursor.GetData(ApInfo^.FPos - 1, pData, iSize, ApInfo^.FOutDataType, ApInfo.FAttrs) then
    ARow.SetData(AColIndex, nil, 0)

  // conversion is not required
  else if ApInfo^.FOutDataType = ApInfo^.FDestDataType then
    ARow.SetData(AColIndex, pData, iSize)

  // conversion is required
  else begin
    iDestSize := 0;
    AFmtOpts.ConvertRawData(ApInfo^.FOutDataType, ApInfo^.FDestDataType,
      pData, iSize, FBuffer.FBuffer, FBuffer.Size, iDestSize, Session.Encoder);
    ARow.SetData(AColIndex, FBuffer.Ptr, iDestSize);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.ProcessVarColumn(AFmtOpts: TFDFormatOptions;
  AColIndex: Integer; ARow: TFDDatSRow; ApInfo: PFDMySQLVarInfoRec);
var
  pData: Pointer;
  iSize, iByteSize, iDestSize: LongWord;
  oStr: TMySQLBlobStream;
begin
  pData := nil;
  iSize := 0;

  // null
  if not ApInfo^.FVar.GetData(pData, iSize, True) then
    ARow.SetData(AColIndex, nil, 0)

  // conversion is not required
  else if ApInfo^.FOutDataType = ApInfo^.FDestDataType then
    if ApInfo^.FVar.LongData then begin
      oStr := TMySQLBlobStream.Create(ApInfo^.FVar, smOpenRead);
      try
        iSize := oStr.Size;
        if ApInfo^.FDestDataType in C_FD_WideTypes then
          iSize := iSize div SizeOf(WideChar);
        pData := ARow.BeginDirectWriteBlob(AColIndex, iSize);
        try
          if iSize > 0 then
            iSize := oStr.ReadStr(pData, iSize, ApInfo^.FOutDataType);
        finally
          ARow.EndDirectWriteBlob(AColIndex, iSize);
        end;
      finally
        FDFree(oStr);
      end;
    end

    else if ApInfo^.FDestDataType in C_FD_VarLenTypes then
      ARow.SetData(AColIndex, pData, iSize)
    else begin
      FBuffer.Check(iSize);
      ApInfo^.FVar.GetData(FBuffer.FBuffer, iSize, False);
      ARow.SetData(AColIndex, FBuffer.Ptr, iSize);
    end

  // conversion is required
  else begin
    if ApInfo^.FVar.LongData then begin
      oStr := TMySQLBlobStream.Create(ApInfo^.FVar, smOpenRead);
      try
        iSize := oStr.Size;
        iByteSize := iSize;
        if ApInfo^.FOutDataType in C_FD_WideTypes then
          iByteSize := iByteSize * SizeOf(WideChar);
        pData := FBuffer.Check(iByteSize);
        if iByteSize > 0 then
          iSize := oStr.ReadStr(pData, iSize, ApInfo^.FOutDataType);
      finally
        FDFree(oStr);
      end;
    end

    else begin
      iByteSize := iSize;
      if ApInfo^.FOutDataType in C_FD_WideTypes then
        iByteSize := iByteSize * SizeOf(WideChar);
      FBuffer.Check(iByteSize);
      ApInfo^.FVar.GetData(FBuffer.FBuffer, iSize, False);
    end;

    iDestSize := 0;
    AFmtOpts.ConvertRawData(ApInfo^.FOutDataType, ApInfo^.FDestDataType,
      FBuffer.Ptr, iSize, FBuffer.FBuffer, FBuffer.Size, iDestSize, Session.Encoder);
    ARow.SetData(AColIndex, FBuffer.Ptr, iDestSize);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.FetchRow(ATable: TFDDatSTable; AParentRow: TFDDatSRow);
var
  oRow: TFDDatSRow;
  [unsafe] oCol: TFDDatSColumn;
  pColInfo: PFDMySQLVarInfoRec;
  j: Integer;
  oFmtOpts: TFDFormatOptions;
begin
  oFmtOpts := FOptions.FormatOptions;
  oRow := ATable.NewRow(False);
  try
    for j := 0 to ATable.Columns.Count - 1 do begin
      oCol := ATable.Columns[j];
      if (oCol.SourceID > 0) and CheckFetchColumn(oCol.SourceDataType, oCol.Attributes) then begin
        pColInfo := @FColInfos[oCol.SourceID - 1];
        if pColInfo^.FPos <> -1 then
          if FStmt <> nil then
            ProcessVarColumn(oFmtOpts, j, oRow, pColInfo)
          else
            ProcessResColumn(oFmtOpts, j, oRow, pColInfo);
      end;
    end;
    if AParentRow <> nil then begin
      oRow.ParentRow := AParentRow;
      AParentRow.Fetched[ATable.Columns.ParentCol] := True;
    end;
    ATable.Rows.Add(oRow);
  except
    FDFree(oRow);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.MySQLType2FDType(var AStr: String; var AType: TFDDataType;
  var AAttrs: TFDDataAttributes; var ALen: LongWord; var APrec, AScale: Integer);
var
  i1, i2: Integer;
  iLen: LongWord;
  sType, sArgs, sMod: String;
  lUnsigned: Boolean;
  oFmt: TFDFormatOptions;

  procedure SetPrecScale(ADefPrec, ADefScale: Integer);
  var
    sPrec, sScale: String;
    i: Integer;
  begin
    i := Pos(',', sArgs);
    if i = 0 then
      sPrec := sArgs
    else begin
      sPrec := Copy(sArgs, 1, i - 1);
      sScale := Copy(sArgs, i + 1, Length(sArgs));
    end;
    APrec := StrToIntDef(sPrec, ADefPrec);
    AScale := StrToIntDef(sScale, ADefScale);
  end;

  procedure SetLen(ADefLen: Integer);
  begin
    ALen := StrToIntDef(sArgs, ADefLen);
  end;

begin
  i1 := Pos('(', AStr);
  i2 := Pos(')', AStr);
  if i1 = 0 then begin
    i1 := Pos(' ', AStr);
    if i1 = 0 then begin
      sType := UpperCase(AStr);
      sArgs := '';
      sMod := '';
    end
    else begin
      sType := UpperCase(Copy(AStr, 1, i1 - 1));
      sArgs := '';
      sMod := UpperCase(Copy(AStr, i1 + 1, Length(AStr)));
    end;
  end
  else begin
    sType := UpperCase(Copy(AStr, 1, i1 - 1));
    sArgs := Copy(AStr, i1 + 1, i2 - i1 - 1);
    sMod := UpperCase(Copy(AStr, i2 + 1, Length(AStr)));
  end;
  lUnsigned := Pos(' UNSIGNED', sMod) <> 0;
  AType := dtUnknown;
  AAttrs := [caSearchable];
  ALen := 0;
  APrec := 0;
  AScale := 0;
  if sType = 'ENUM' then begin
    AType := dtAnsiString;
    i1 := 1;
    while True do begin
      i2 := Pos(',', sArgs, i1);
      if i2 = 0 then
        i2 := Length(sArgs) + 1;
      iLen := i2 - i1;
      if sArgs[i1] = '''' then
        Dec(iLen, 2);
      if ALen < iLen then
        ALen := iLen;
      i1 := i2 + 1;
      if i1 > Length(sArgs) then
        Break;
      while sArgs[i1] = ' ' do
        Inc(i1);
    end;
  end
  else if sType = 'SET' then begin
    AType := dtAnsiString;
    i1 := 1;
    while True do begin
      i2 := Pos(',', sArgs, i1);
      if i2 = 0 then
        i2 := Length(sArgs);
      iLen := i2 - i1;
      if sArgs[i1] = '''' then
        Dec(iLen, 2);
      Inc(ALen, Longword(iLen + 1));
      i1 := i2 + 1;
      if i1 > Length(sArgs) then
        Break;
      while sArgs[i1] = ' ' do
        Inc(i1);
    end;
  end
  else if sType = 'TINYINT' then begin
    SetPrecScale(0, 0);
    if (APrec = 1) and (MyConnection.FTinyIntFormat = dtBoolean) then
      AType := dtBoolean
    else if lUnsigned then
      AType := dtByte
    else
      AType := dtSByte;
  end
  else if sType = 'BIT' then begin
    AType := dtByteString;
    SetLen(1);
    ALen := (ALen + 7) div 8;
    Include(AAttrs, caFixedLen);
  end
  else if sType = 'BOOL' then
    AType := dtBoolean
  else if sType = 'SMALLINT' then begin
    SetPrecScale(0, 0);
    if lUnsigned then
      AType := dtUInt16
    else
      AType := dtInt16;
  end
  else if (sType = 'MEDIUMINT') or (sType = 'INTEGER') or (sType = 'INT') then begin
    SetPrecScale(0, 0);
    if lUnsigned then
      AType := dtUInt32
    else
      AType := dtInt32;
  end
  else if sType = 'BIGINT' then begin
    SetPrecScale(0, 0);
    if lUnsigned then
      AType := dtUInt64
    else
      AType := dtInt64
  end
  else if (sType = 'FLOAT') or (sType = 'DOUBLE') or (sType = 'REAL') then begin
    SetPrecScale(0, 0);
    if APrec > 16 then begin
      oFmt := FOptions.FormatOptions;
      if oFmt.IsFmtBcd(APrec, AScale) then
        AType := dtFmtBCD
      else
        AType := dtBCD;
    end
    else if sType = 'FLOAT' then begin
      AType := dtSingle;
      if APrec = 0 then
        APrec := 7;
    end
    else begin
      AType := dtDouble;
      if APrec = 0 then
        APrec := 15;
    end;
  end
  else if (sType = 'DECIMAL') or (sType = 'DEC') or (sType = 'NUMERIC') then begin
    SetPrecScale(10, 0);
    if AScale = 0 then
      if lUnsigned then begin
        if APrec <= 3 then
          AType := dtByte
        else if APrec <= 5 then
          AType := dtUInt16
        else if APrec <= 10 then
          AType := dtUInt32
        else if APrec <= 21 then
          AType := dtUInt64;
      end
      else begin
        if APrec <= 2 then
          AType := dtSByte
        else if APrec <= 4 then
          AType := dtInt16
        else if APrec <= 9 then
          AType := dtInt32
        else if APrec <= 20 then
          AType := dtInt64;
      end;
    if AType = dtUnknown then begin
      oFmt := FOptions.FormatOptions;
      if oFmt.IsFmtBcd(APrec, AScale) then
        AType := dtFmtBCD
      else
        AType := dtBCD;
    end;
  end
  else if sType = 'DATE' then
    AType := dtDate
  else if sType = 'DATETIME' then
    AType := dtDateTime
  else if sType = 'TIMESTAMP' then begin
    AType := dtDateTimeStamp;
    Include(AAttrs, caRowVersion);
  end
  else if sType = 'TIME' then
    AType := dtTime
  else if sType = 'YEAR' then
    AType := dtUInt16
  else if sType = 'CHAR' then begin
    SetLen(1);
    AType := dtAnsiString;
    Include(AAttrs, caFixedLen);
  end
  else if sType = 'VARCHAR' then begin
    SetLen(255);
    AType := dtAnsiString;
  end
  else if sType = 'BINARY' then begin
    SetLen(1);
    AType := dtByteString;
    Include(AAttrs, caFixedLen);
  end
  else if sType = 'VARBINARY' then begin
    SetLen(255);
    AType := dtByteString;
  end
  else if sType = 'TINYBLOB' then begin
    AType := dtByteString;
    ALen := 255;
  end
  else if sType = 'TINYTEXT' then begin
    AType := dtAnsiString;
    ALen := 255;
  end
  else if (sType = 'BLOB') or (sType = 'MEDIUMBLOB') or (sType = 'LONGBLOB') then begin
    Exclude(AAttrs, caSearchable);
    Include(AAttrs, caBlobData);
    AType := dtBlob;
  end
  else if (sType = 'TEXT') or (sType = 'MEDIUMTEXT') or (sType = 'LONGTEXT') then begin
    Exclude(AAttrs, caSearchable);
    Include(AAttrs, caBlobData);
    AType := dtMemo;
  end;
  AStr := sType;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetCrsData(ACrsCol: Integer; var AData: Pointer;
  var ALen: LongWord; AType: TFDDataType): Boolean;
begin
  AData := FBuffer.Ptr;
  Result := FCursor.GetData(ACrsCol, AData, ALen, AType, []);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetCrsData(ACrsCol: Integer; AData: Pointer): String;
var
  iLen: LongWord;
begin
  GetCrsData(ACrsCol, AData, iLen, dtAnsiString);
  Result := Session.Encoder.Decode(AData, iLen);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.GetMetaCatalog: String;
var
  rName: TFDPhysParsedName;
begin
  GetSelectMetaInfoParams(rName);
  if rName.FCatalog = '' then
    Result := MyConnection.InternalGetCurrentCatalog
  else
    Result := rName.FCatalog;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMySQLCommand.FetchMetaRow(ATable: TFDDatSTable;
  AParentRow: TFDDatSRow; ARowIndex: Integer);
const
  C_Primary: String = 'PRIMARY';
var
  pData: Pointer;
  uiLen: LongWord;
  oRow: TFDDatSRow;
  lDeleteRow: Boolean;
  s: String;
  eType: TFDDataType;
  eAttrs: TFDDataAttributes;
  iPrec, iScale: Integer;
  iRecNo: Integer;
  eIndKind: TFDPhysIndexKind;
  i: Integer;
  rName: TFDPhysParsedName;
  oConnMeta: IFDPhysConnectionMetadata;
  eTabKind: TFDPhysTableKind;
  eScope: TFDPhysObjectScope;
begin
  lDeleteRow := False;
  iRecNo := FRecordsFetched + ARowIndex + 1;
  oRow := ATable.NewRow(False);
  pData := FBuffer.Check(1024);
  case GetMetaInfoKind of
  mkCatalogs:
    begin
      oRow.SetData(0, iRecNo);
      uiLen := 0;
      GetCrsData(0, pData, uiLen, dtWideString);
      oRow.SetData(1, pData, uiLen);
    end;
  mkTables:
    begin
      s := GetMetaCatalog;
      oRow.SetData(0, iRecNo);
      oRow.SetData(1, s);
      oRow.SetData(2, nil, 0);
      uiLen := 0;
      GetCrsData(0, pData, uiLen, dtWideString);
      oRow.SetData(3, pData, uiLen);
      eTabKind := tkTable;
      if MyConnection.FServerVersion >= mvMySQL050002 then begin
        GetCrsData(1, pData, uiLen, dtWideString);
        if StrLComp('VIEW', PWideChar(pData), uiLen) = 0 then
          eTabKind := tkView;
      end;
      oRow.SetData(4, SmallInt(eTabKind));
      if (CompareText(s, 'MYSQL') = 0) or (CompareText(s, 'INFORMATION_SCHEMA') = 0) then
        eScope := osSystem
      else if CompareText(s, MyConnection.InternalGetCurrentCatalog) = 0 then
        eScope := osMy
      else
        eScope := osOther;
      oRow.SetData(5, SmallInt(eScope));
      lDeleteRow := not (eTabKind in GetTableKinds) or not (eScope in GetObjectScopes);
    end;
  mkTableFields:
    begin
      oRow.SetData(0, iRecNo);
      oRow.SetData(1, GetMetaCatalog);
      oRow.SetData(2, nil, 0);
      FConnection.CreateMetadata(oConnMeta);
      oConnMeta.DecodeObjName(GetCommandText, rName, Self, [doUnquote, doNormalize]);
      oRow.SetData(3, rName.FObject);
      GetCrsData(0, pData, uiLen, dtWideString);
      oRow.SetData(4, pData, uiLen);
      oRow.SetData(5, iRecNo);
      s := GetCrsData(1, pData);
      eType := dtUnknown;
      eAttrs := [];
      uiLen := 0;
      iPrec := 0;
      iScale := 0;
      MySQLType2FDType(s, eType, eAttrs, uiLen, iPrec, iScale);
      oRow.SetData(6, LongWord(eType));
      oRow.SetData(7, s);
      oRow.SetData(9, iPrec);
      oRow.SetData(10, iScale);
      oRow.SetData(11, uiLen);
      Include(eAttrs, caBase);
      if CompareText(GetCrsData(2, pData), 'YES') = 0 then
        Include(eAttrs, caAllowNull);
      if GetCrsData(4, pData) <> '' then
        Include(eAttrs, caDefault);
      if CompareText(GetCrsData(5, pData), 'AUTO_INCREMENT') = 0 then begin
        Include(eAttrs, caAutoInc);
        Include(eAttrs, caAllowNull);
      end;
      oRow.SetData(8, PWord(@eAttrs)^);
    end;
  mkIndexes,
  mkPrimaryKey:
    begin
      oRow.SetData(0, iRecNo);
      oRow.SetData(1, GetMetaCatalog);
      oRow.SetData(2, nil, 0);
      GetCrsData(0, pData, uiLen, dtWideString);
      oRow.SetData(3, pData, uiLen);
      GetCrsData(1, pData, uiLen, dtUInt16);
      if PWord(pData)^ = 0 then
        eIndKind := ikUnique
      else
        eIndKind := ikNonUnique;
      GetCrsData(2, pData, uiLen, dtWideString);
      if (eIndKind = ikUnique) and (StrLIComp(PWideChar(pData), PWideChar(C_Primary), 7) = 0) then
        eIndKind := ikPrimaryKey;
      oRow.SetData(4, pData, uiLen);
      if eIndKind in [ikUnique, ikPrimaryKey] then
        oRow.SetData(5, pData, uiLen)
      else
        oRow.SetData(5, nil, 0);
      oRow.SetData(6, Integer(eIndKind));
      if (GetMetaInfoKind = mkPrimaryKey) and (iRecNo > 1) then
        lDeleteRow := True;
      if not lDeleteRow then
        for i := 0 to ATable.Rows.Count - 1 do begin
          if (VarToStr(ATable.Rows[i].GetData(1, rvDefault)) = VarToStr(oRow.GetData(1, rvDefault))) and
             (VarToStr(ATable.Rows[i].GetData(2, rvDefault)) = VarToStr(oRow.GetData(2, rvDefault))) and
             (VarToStr(ATable.Rows[i].GetData(3, rvDefault)) = VarToStr(oRow.GetData(3, rvDefault))) and
             (VarToStr(ATable.Rows[i].GetData(4, rvDefault)) = VarToStr(oRow.GetData(4, rvDefault))) then begin
            lDeleteRow := True;
            Break;
          end;
        end;
    end;
  mkIndexFields,
  mkPrimaryKeyFields:
    begin
      oRow.SetData(0, iRecNo);
      oRow.SetData(1, GetMetaCatalog);
      oRow.SetData(2, nil, 0);
      GetCrsData(0, pData, uiLen, dtWideString);
      oRow.SetData(3, pData, uiLen);
      GetCrsData(1, pData, uiLen, dtInt32);
      if PSmallInt(pData)^ = 0 then
        eIndKind := ikUnique
      else
        eIndKind := ikNonUnique;
      GetCrsData(2, pData, uiLen, dtWideString);
      if (eIndKind = ikUnique) and (StrLIComp(PWideChar(pData), PWideChar(C_Primary), 7) = 0) then
        eIndKind := ikPrimaryKey;
      oRow.SetData(4, pData, uiLen);
      GetCrsData(4, pData, uiLen, dtWideString);
      oRow.SetData(5, pData, uiLen);
      GetCrsData(3, pData, uiLen, dtInt32);
      oRow.SetData(6, pData, uiLen);
      GetCrsData(5, pData, uiLen, dtWideString);
      oRow.SetData(7, pData, uiLen);
      oRow.SetData(8, nil, 0);
      FConnection.CreateMetadata(oConnMeta);
      oConnMeta.DecodeObjName(GetCommandText, rName, Self, [doUnquote, doNormalize]);
      if not lDeleteRow then
        if (GetMetaInfoKind = mkPrimaryKeyFields) and
             ((eIndKind <> ikPrimaryKey) or
              (iRecNo > 1) and
              (AnsiCompareText(VarToStr(ATable.Rows[0].GetData(4, rvDefault)), VarToStr(oRow.GetData(4, rvDefault))) <> 0)
             ) or
           (GetMetaInfoKind = mkIndexFields) and
             (AnsiCompareText(VarToStr(oRow.GetData(4, rvDefault)), rName.FObject) <> 0) then
          lDeleteRow := True;
    end;
  mkForeignKeys:
    begin
      oRow.SetData(0, iRecNo);
      GetCrsData(1, pData, uiLen, dtWideString);
      oRow.SetData(1, pData, uiLen);
      oRow.SetData(2, nil, 0);
      GetCrsData(3, pData, uiLen, dtWideString);
      oRow.SetData(3, pData, uiLen);
      GetCrsData(4, pData, uiLen, dtWideString);
      oRow.SetData(4, pData, uiLen);
      GetCrsData(5, pData, uiLen, dtWideString);
      oRow.SetData(5, pData, uiLen);
      oRow.SetData(6, nil, 0);
      GetCrsData(7, pData, uiLen, dtWideString);
      oRow.SetData(7, pData, uiLen);
      GetCrsData(8, pData, uiLen, dtInt32);
      oRow.SetData(8, pData, uiLen);
      GetCrsData(9, pData, uiLen, dtInt32);
      oRow.SetData(9, pData, uiLen);
    end;
  mkForeignKeyFields:
    begin
      oRow.SetData(0, iRecNo);
      GetCrsData(1, pData, uiLen, dtWideString);
      oRow.SetData(1, pData, uiLen);
      oRow.SetData(2, nil, 0);
      GetCrsData(3, pData, uiLen, dtWideString);
      oRow.SetData(3, pData, uiLen);
      GetCrsData(4, pData, uiLen, dtWideString);
      oRow.SetData(4, pData, uiLen);
      GetCrsData(5, pData, uiLen, dtWideString);
      oRow.SetData(5, pData, uiLen);
      GetCrsData(6, pData, uiLen, dtWideString);
      oRow.SetData(6, pData, uiLen);
      GetCrsData(7, pData, uiLen, dtInt32);
      oRow.SetData(7, pData, uiLen);
    end;
  mkProcs:
    begin
      oRow.SetData(0, iRecNo);
      if GetCrsData(1, pData, uiLen, dtWideString) then
        oRow.SetData(1, pData, uiLen);
      if GetCrsData(2, pData, uiLen, dtWideString) then
        oRow.SetData(2, pData, uiLen);
      if GetCrsData(3, pData, uiLen, dtWideString) then
        oRow.SetData(3, pData, uiLen);
      if GetCrsData(4, pData, uiLen, dtWideString) then
        oRow.SetData(4, pData, uiLen);
      if GetCrsData(5, pData, uiLen, dtInt32) then
        oRow.SetData(5, pData, uiLen);
      if GetCrsData(6, pData, uiLen, dtInt32) then
        oRow.SetData(6, pData, uiLen);
      if GetCrsData(7, pData, uiLen, dtInt32) then
        oRow.SetData(7, pData, uiLen);
      if GetCrsData(8, pData, uiLen, dtInt32) then
        oRow.SetData(8, pData, uiLen);
      if GetCrsData(9, pData, uiLen, dtInt32) then
        oRow.SetData(9, pData, uiLen);
    end;
  mkProcArgs:
    ASSERT(False);
  else
    lDeleteRow := True;
  end;
  if lDeleteRow then
    FDFree(oRow)
  else
    ATable.Rows.Add(oRow);
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.FetchSPParamRows(ATable: TFDDatSTable;
  AParentRow: TFDDatSRow): Integer;
var
  sMode, sSQL: String;
  lAnsiQuotes, {lNoBackslash,} lInQuote1, lInQuote2: Boolean;
  i, iBraces, iPrev, iRecNo: Integer;
  oConnMeta: IFDPhysConnectionMetadata;
  rName: TFDPhysParsedName;

  procedure SkipSpaces(const ASQL: String; var AFrom: Integer; ATo: Integer);
  begin
    while (AFrom <= ATo) and FDInSet(ASQL[AFrom], [' ', #9, #13, #10]) do
      Inc(AFrom);
  end;

  procedure TrimSpaces(const ASQL: String; AFrom: Integer; var ATo: Integer);
  begin
    while (AFrom <= ATo) and FDInSet(ASQL[ATo], [' ', #9, #13, #10]) do
      Dec(ATo);
  end;

  procedure AddParam(const ASQL: String; AFrom, ATo: Integer);
  var
    iPrev: Integer;
    sType, sName: String;
    eDir: TParamType;
    eType: TFDDataType;
    eAttrs: TFDDataAttributes;
    iPrec, iScale: Integer;
    uiLen: LongWord;
    oRow: TFDDatSRow;
  begin
    TrimSpaces(ASQL, AFrom, ATo);
    SkipSpaces(ASQL, AFrom, ATo);
    if StrLIComp(PChar(ASQL) + AFrom - 1, PChar('RETURNS'), 7) = 0 then begin
      eDir := ptResult;
      Inc(AFrom, 7);
    end
    else if StrLIComp(PChar(ASQL) + AFrom - 1, PChar('INOUT'), 5) = 0 then begin
      eDir := ptInputOutput;
      Inc(AFrom, 5);
    end
    else if StrLIComp(PChar(ASQL) + AFrom - 1, PChar('IN'), 2) = 0 then begin
      eDir := ptInput;
      Inc(AFrom, 2);
    end
    else if StrLIComp(PChar(ASQL) + AFrom - 1, PChar('OUT'), 3) = 0 then begin
      eDir := ptOutput;
      Inc(AFrom, 3);
    end
    else
      eDir := ptInput;

    SkipSpaces(ASQL, AFrom, ATo);
    if eDir = ptResult then begin
      sName := 'result';
      iPrev := AFrom;
      repeat
        Inc(AFrom);
      until (AFrom > ATo) or FDInSet(ASQL[AFrom], [' ', #9, #13, #10]);
      sType := Copy(ASQL, iPrev, AFrom - iPrev);
    end
    else begin
      if ASQL[AFrom] = '`' then begin
        iPrev := AFrom;
        repeat
          Inc(AFrom);
        until (AFrom > ATo) or (ASQL[AFrom] = '`');
        sName := Copy(ASQL, iPrev + 1, AFrom - iPrev - 1);
      end
      else begin
        iPrev := AFrom;
        repeat
          Inc(AFrom);
        until (AFrom > ATo) or FDInSet(ASQL[AFrom], [')', '(', ',', ' ', #9, #13, #10]);
        sName := Copy(ASQL, iPrev, AFrom - iPrev);
      end;
      Inc(AFrom);
      SkipSpaces(ASQL, AFrom, ATo);
      sType := Copy(ASQL, AFrom, ATo - AFrom + 1);
    end;

    if (GetWildcard <> '') and not FDStrLike(sName, GetWildcard) then
      Exit;

    eType := dtUnknown;
    eAttrs := [];
    uiLen := 0;
    iPrec := 0;
    iScale := 0;
    MySQLType2FDType(sType, eType, eAttrs, uiLen, iPrec, iScale);
    Include(eAttrs, caAllowNull);

    oRow := ATable.NewRow(False);
    oRow.SetData(0, iRecNo);
    oRow.SetData(1, rName.FCatalog);
    oRow.SetData(2, rName.FSchema);
    oRow.SetData(3, nil, 0);
    oRow.SetData(4, rName.FObject);
    oRow.SetData(5, 0);
    oRow.SetData(6, sName);
    oRow.SetData(7, Smallint(iRecNo));
    oRow.SetData(8, Smallint(eDir));
    oRow.SetData(9, Smallint(eType));
    oRow.SetData(10, sType);
    oRow.SetData(11, PWord(@eAttrs)^);
    oRow.SetData(12, iPrec);
    oRow.SetData(13, iScale);
    oRow.SetData(14, uiLen);
    ATable.Rows.Add(oRow);
    Inc(iRecNo);
  end;

begin
  Result := 0;
  iRecNo := 1;
  sMode := GetCrsData(1, FBuffer.Ptr);
  sSQL := GetCrsData(2, FBuffer.Ptr);
  FConnection.CreateMetadata(oConnMeta);
  oConnMeta.DecodeObjName(Trim(GetCommandText), rName, Self, [doNormalize, doUnquote]);

  lAnsiQuotes := Pos('ANSI_QUOTES', sMode) <> 0;
  // lNoBackslash := Pos('NO_BACKSLASH_ESCAPES', sMode) <> 0;

                                                                             
  i := Pos('(', sSQL) + 1;
  lInQuote1 := False;
  lInQuote2 := False;
  iBraces := 0;
  iPrev := i;
  while i < Length(sSQL) do begin
    case sSQL[i] of
    '`':
      if not lInQuote2 then
        lInQuote1 := not lInQuote1;
    '"':
      if lAnsiQuotes and not lInQuote1 then
        lInQuote2 := not lInQuote2;
    '(':
      if not lInQuote2 and not lInQuote1 then
        Inc(iBraces);
    ')':
      if not lInQuote2 and not lInQuote1 then
        if iBraces = 0 then begin
          if iPrev <= i - 1 then begin
            AddParam(sSQL, iPrev, i - 1);
            Inc(Result);
          end;
          Inc(i);
          Break;
        end
        else
          Dec(iBraces);
    ',':
      if not lInQuote2 and not lInQuote1 and (iBraces = 0) then begin
        AddParam(sSQL, iPrev, i - 1);
        Inc(Result);
        iPrev := i + 1;
      end;
    end;
    Inc(i);
  end;

  SkipSpaces(sSQL, i, Length(sSQL));
  if StrLIComp(PChar(sSQL) + i - 1, PChar('RETURNS'), 7) = 0 then begin
    AddParam(sSQL, i, Length(sSQL));
    Inc(Result);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.FetchFKRows(ATable: TFDDatSTable;
  AParentRow: TFDDatSRow): Integer;

  function TrimQuotes(const AStr: String): String;
  begin
    Result := FDUnquote(Trim(AStr), '`');
  end;

var
  sFKCat, sFKTab, sFKName, sComment, sTabName, sFKey, sFKFields, sFields: String;
  iCommentField, i, i1, i2, i3, i4, i5, j1, j2, iRecNo: Integer;
  oRow: TFDDatSRow;
begin
  Result := 0;
  iRecNo := 1;
  if MyConnection.FServerVersion < mvMySQL040100 then
    iCommentField := 14
  else
    iCommentField := 15;
  sComment := GetCrsData(iCommentField, FBuffer.Ptr);
  sTabName := GetCrsData(0, FBuffer.Ptr);
  if Pos('InnoDB', sComment) = 1 then begin
    i := 1;
    FDExtractFieldName(sComment, i, GSemicolonFmtSettings);
    while i <= Length(sComment) do begin
      sFKey := FDExtractFieldName(sComment, i, GSemicolonFmtSettings);
      i1 := Pos('(', sFKey, 1);
      i2 := Pos(')', sFKey, i1);
      i3 := Pos('/', sFKey, i2);
      i4 := Pos('(', sFKey, i3);
      i5 := Pos(')', sFKey, i4);
      if (i1 <> -1) and (i2 <> -1) and (i3 <> -1) and (i4 <> -1) and (i5 <> -1) then begin
        sFKCat := TrimQuotes(Copy(sFKey, i2 + 8, i3 - i2 - 8));
        sFKTab := TrimQuotes(Copy(sFKey, i3 + 1, i4 - i3 - 1));
        sFKName := sTabName + '_to_' + sFKTab;
        sFields := Copy(sFKey, i1 + 1, i2 - i1 - 1);
        sFKFields := Copy(sFKey, i4 + 1, i5 - i4 - 1);
        if GetMetaInfoKind = mkForeignKeys then begin
          oRow := ATable.NewRow(False);
          oRow.SetData(0, iRecNo);
          oRow.SetData(1, GetMetaCatalog);
          oRow.SetData(2, nil, 0);
          oRow.SetData(3, sTabName);
          oRow.SetData(4, sFKName);
          oRow.SetData(5, sFKCat);
          oRow.SetData(6, nil, 0);
          oRow.SetData(7, sFKTab);
          oRow.SetData(8, IntToStr(Integer(ckCascade)));
          oRow.SetData(9, IntToStr(Integer(ckCascade)));
          ATable.Rows.Add(oRow);
          Inc(iRecNo);
          Inc(Result);
        end
        else if AnsiCompareText(sFKName, TrimQuotes(GetCommandText)) = 0 then begin
          j1 := 1;
          j2 := 1;
          while (j1 <= Length(sFields)) and (j2 <= Length(sFKFields)) do begin
            oRow := ATable.NewRow(False);
            oRow.SetData(0, iRecNo);
            oRow.SetData(1, GetMetaCatalog);
            oRow.SetData(2, nil, 0);
            oRow.SetData(3, sTabName);
            oRow.SetData(4, sFKName);
            oRow.SetData(5, TrimQuotes(FDExtractFieldName(sFields, j1, GSpaceFmtSettings)));
            oRow.SetData(6, TrimQuotes(FDExtractFieldName(sFKFields, j2, GSpaceFmtSettings)));
            oRow.SetData(7, Result + 1);
            ATable.Rows.Add(oRow);
            Inc(iRecNo);
            Inc(Result);
          end;
          Break;
        end;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMySQLCommand.InternalFetchRowSet(ATable: TFDDatSTable;
  AParentRow: TFDDatSRow; ARowsetSize: LongWord): LongWord;
var
  i: LongWord;
begin
  Result := 0;
  if GetMetaInfoKind = mkProcArgs then begin
    if FCursor.Fetch(1) then
      Result := FetchSPParamRows(ATable, AParentRow);
  end
  else if (GetMetaInfoKind in [mkForeignKeys, mkForeignKeyFields]) and
          (MyConnection.FServerVersion < mvMySQL050100) then begin
    if FCursor.Fetch(1) then
      Result := FetchFKRows(ATable, AParentRow);
  end
  else
    for i := 1 to ARowsetSize do begin
      if FStmt <> nil then begin
        if not FStmt.Fetch then
          Break;
      end
      else begin
        if not FCursor.Fetch(i) then
          Break;
      end;
      if GetMetaInfoKind = mkNone then
        FetchRow(ATable, AParentRow)
      else
        FetchMetaRow(ATable, AParentRow, i - 1);
      Inc(Result);
    end;
end;

{-------------------------------------------------------------------------------}
initialization
  FDRegisterDriverClass(TFDPhysMySQLDriver);

finalization
  FDUnregisterDriverClass(TFDPhysMySQLDriver);

end.
