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

unit IBX.IB;

interface

uses
  System.SysUtils, IBX.IBHeader, IBX.IBExternals, Data.DB, IBX.IBXConst, IBX.IBIntf;

type
  TTraceFlag = (tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect,
     tfTransact, tfBlob, tfService, tfMisc);
  TTraceFlags = set of TTraceFlag;

  EIBError = class(EDatabaseError)
  private
    FSQLCode: Long;
    FIBErrorCode: Long;
  public
    constructor Create(ASQLCode: Long; Msg: string); overload;
    constructor Create(ASQLCode: Long; AIBErrorCode: Long; Msg: string); overload;
    property SQLCode: Long read FSQLCode;
    property IBErrorCode: Long read FIBErrorCode;
  end;

  EIBInterBaseError         = class(EIBError);
  EIBInterBaseRoleError     = class(EIBError);
  EIBClientError            = class(EIBError);
  EIBPlanError              = class(EIBError);

  TIBDataBaseErrorMessage    = (ShowSQLCode,
                                ShowIBMessage,
                                ShowSQLMessage);
  TIBDataBaseErrorMessages   = set of TIBDataBaseErrorMessage;
  TIBClientError            = (
    ibxeUnknownError,
    ibxeInterBaseMissing,
    ibxeInterBaseInstallMissing,
    ibxeIB60feature,
    ibxeNotSupported,
    ibxeNotPermitted,
    ibxeFileAccessError,
    ibxeConnectionTimeout,
    ibxeCannotSetDatabase,
    ibxeCannotSetTransaction,
    ibxeOperationCancelled,
    ibxeDPBConstantNotSupported,
    ibxeDPBConstantUnknown,
    ibxeTPBConstantNotSupported,
    ibxeTPBConstantUnknown,
    ibxeDatabaseClosed,
    ibxeDatabaseOpen,
    ibxeDatabaseNameMissing,
    ibxeNotInTransaction,
    ibxeInTransaction,
    ibxeTimeoutNegative,
    ibxeNoDatabasesInTransaction,
    ibxeUpdateWrongDB,
    ibxeUpdateWrongTR,
    ibxeDatabaseNotAssigned,
    ibxeTransactionNotAssigned,
    ibxeXSQLDAIndexOutOfRange,
    ibxeXSQLDANameDoesNotExist,
    ibxeEOF,
    ibxeBOF,
    ibxeInvalidStatementHandle,
    ibxeSQLOpen,
    ibxeSQLClosed,
    ibxeDatasetOpen,
    ibxeDatasetClosed,
    ibxeUnknownSQLDataType,
    ibxeInvalidColumnIndex,
    ibxeInvalidParamColumnIndex,
    ibxeInvalidDataConversion,
    ibxeColumnIsNotNullable,
    ibxeBlobCannotBeRead,
    ibxeBlobCannotBeWritten,
    ibxeEmptyQuery,
    ibxeCannotOpenNonSQLSelect,
    ibxeNoFieldAccess,
    ibxeFieldReadOnly,
    ibxeFieldNotFound,
    ibxeNotEditing,
    ibxeCannotInsert,
    ibxeCannotPost,
    ibxeCannotUpdate,
    ibxeCannotDelete,
    ibxeCannotRefresh,
    ibxeBufferNotSet,
    ibxeCircularReference,
    ibxeSQLParseError,
    ibxeUserAbort,
    ibxeDataSetUniDirectional,
    ibxeCannotCreateSharedResource,
    ibxeWindowsAPIError,
    ibxeColumnListsDontMatch,
    ibxeColumnTypesDontMatch,
    ibxeCantEndSharedTransaction,
    ibxeFieldUnsupportedType,
    ibxeCircularDataLink,
    ibxeEmptySQLStatement,
    ibxeIsASelectStatement,
    ibxeRequiredParamNotSet,
    ibxeNoStoredProcName,
    ibxeIsAExecuteProcedure,
    ibxeUpdateFailed,
    ibxeNotCachedUpdates,
    ibxeNotLiveRequest,
    ibxeNoProvider,
    ibxeNoRecordsAffected,
    ibxeNoTableName,
    ibxeCannotCreatePrimaryIndex,
    ibxeCannotDropSystemIndex,
    ibxeTableNameMismatch,
    ibxeIndexFieldMissing,
    ibxeInvalidCancellation,
    ibxeInvalidEvent,
    ibxeMaximumEvents,
    ibxeNoEventsRegistered,
    ibxeInvalidQueueing,
    ibxeInvalidRegistration,
    ibxeInvalidBatchMove,
    ibxeSQLDialectInvalid,
    ibxeSPBConstantNotSupported,
    ibxeSPBConstantUnknown,
    ibxeServiceActive,
    ibxeServiceInActive,
    ibxeServerNameMissing,
    ibxeQueryParamsError,
    ibxeStartParamsError,
    ibxeOutputParsingError,
    ibxeUseSpecificProcedures,
    ibxeSQLMonitorAlreadyPresent,
    ibxeCantPrintValue,
    ibxeEOFReached,
    ibxeEOFInComment,
    ibxeEOFInString,
    ibxeParamNameExpected,
    ibxeSuccess,
    ibxeDelphiException,
    ibxeNoOptionsSet,
    ibxeNoDestinationDirectory,
    ibxeNosourceDirectory,
    ibxeNoUninstallFile,
    ibxeOptionNeedsClient,
    ibxeOptionNeedsServer,
    ibxeInvalidOption,
    ibxeInvalidOnErrorResult,
    ibxeInvalidOnStatusResult,
    ibxeDPBConstantUnknownEx,
    ibxeTPBConstantUnknownEx,
    ibxeUnknownPlan,
    ibxeFieldSizeMismatch,
    ibxeEventAlreadyRegistered,
    ibxeStringTooLarge,
    ibxeIB65feature,
    ibxeIB70Feature,
    ibxeIBUnknownServerType,
    ibxeInvalidLibraryType,
    ibxeInvalidODSVersion
    );

  TStatusVector              = array[0..19] of ISC_STATUS;
  PStatusVector              = ^TStatusVector;


const
  IBPalette1 = 'InterBase'; {do not localize}
  IBPalette2 = 'InterBase Admin'; {do not localize}

  IBLocalBufferLength = 512;
  IBBigLocalBufferLength = IBLocalBufferLength * 2;
  IBHugeLocalBufferLength = IBBigLocalBufferLength * 20;

  IBErrorMessages: array[TIBClientError] of string = (
    SUnknownError,
    SInterBaseMissing,
    SInterBaseInstallMissing,
    SIB60feature,
    SNotSupported,
    SNotPermitted,
    SFileAccessError,
    SConnectionTimeout,
    SCannotSetDatabase,
    SCannotSetTransaction,
    SOperationCancelled,
    SDPBConstantNotSupported,
    SDPBConstantUnknown,
    STPBConstantNotSupported,
    STPBConstantUnknown,
    SDatabaseClosed,
    SDatabaseOpen,
    SDatabaseNameMissing,
    SNotInTransaction,
    SInTransaction,
    STimeoutNegative,
    SNoDatabasesInTransaction,
    SUpdateWrongDB,
    SUpdateWrongTR,
    SDatabaseNotAssigned,
    STransactionNotAssigned,
    SXSQLDAIndexOutOfRange,
    SXSQLDANameDoesNotExist,
    SEOF,
    SBOF,
    SInvalidStatementHandle,
    SSQLOpen,
    SSQLClosed,
    SDatasetOpen,
    SDatasetClosed,
    SUnknownSQLDataType,
    SInvalidColumnIndex,
    SInvalidParamColumnIndex,
    SInvalidDataConversion,
    SColumnIsNotNullable,
    SBlobCannotBeRead,
    SBlobCannotBeWritten,
    SEmptyQuery,
    SCannotOpenNonSQLSelect,
    SNoFieldAccess,
    SFieldReadOnly,
    SFieldNotFound,
    SNotEditing,
    SCannotInsert,
    SCannotPost,
    SCannotUpdate,
    SCannotDelete,
    SCannotRefresh,
    SBufferNotSet,
    SCircularReference,
    SSQLParseError,
    SUserAbort,
    SDataSetUniDirectional,
    SCannotCreateSharedResource,
    SWindowsAPIError,
    SColumnListsDontMatch,
    SColumnTypesDontMatch,
    SCantEndSharedTransaction,
    SFieldUnsupportedType,
    SCircularDataLink,
    SEmptySQLStatement,
    SIsASelectStatement,
    SRequiredParamNotSet,
    SNoStoredProcName,
    SIsAExecuteProcedure,
    SUpdateFailed,
    SNotCachedUpdates,
    SNotLiveRequest,
    SNoProvider,
    SNoRecordsAffected,
    SNoTableName,
    SCannotCreatePrimaryIndex,
    SCannotDropSystemIndex,
    STableNameMismatch,
    SIndexFieldMissing,
    SInvalidCancellation,
    SInvalidEvent,
    SMaximumEvents,
    SNoEventsRegistered,
    SInvalidQueueing,
    SInvalidRegistration,
    SInvalidBatchMove,
    SSQLDialectInvalid,
    SSPBConstantNotSupported,
    SSPBConstantUnknown,
    SServiceActive,
    SServiceInActive,
    SServerNameMissing,
    SQueryParamsError,
    SStartParamsError,
    SOutputParsingError,
    SUseSpecificProcedures,
    SSQLMonitorAlreadyPresent,
    SCantPrintValue,
    SEOFReached,
    SEOFInComment,
    SEOFInString,
    SParamNameExpected,
    SSuccess,
    SDelphiException,
    SNoOptionsSet,
    SNoDestinationDirectory,
    SNosourceDirectory,
    SNoUninstallFile,
    SOptionNeedsClient,
    SOptionNeedsServer,
    SInvalidOption,
    SInvalidOnErrorResult,
    SInvalidOnStatusResult,
    SDPBConstantUnknownEx,
    STPBConstantUnknownEx,
    SUnknownPlan,
    SFieldSizeMismatch,
    SEventAlreadyRegistered,
    SStringTooLarge,
    SIB65feature,
    SIB70Feature,
    SIBUnknownServerType,
    SInvalidLibraryType,
    SInvalidODSVersion
  );

var
  IBCS: TSimpleRWSync;

procedure IBAlloc(var P; OldSize, NewSize: NativeInt); overload;
{$IFDEF NEXTGEN}
procedure IBAlloc(var p : TRecBuf; OldSize, NewSize: NativeInt); overload;
{$ELSE}
procedure IBAlloc(var p : TRecordBuffer; OldSize, NewSize: NativeInt); overload;
{$ENDIF NEXTGEN}

procedure IBError(ErrMess: TIBClientError; const Args: array of const);
procedure IBDataBaseError(FGDSLibrary : IGDSLibrary);

function StatusVector: PISC_STATUS;
function StatusVectorArray: PStatusVector;
function CheckStatusVector(ErrorCodes: array of ISC_STATUS): Boolean;
function StatusVectorAsText: string;

procedure SetIBDataBaseErrorMessages(Value: TIBDataBaseErrorMessages);
function GetIBDataBaseErrorMessages: TIBDataBaseErrorMessages;

implementation

uses IBX.IBSQLMonitor;

var
  IBDataBaseErrorMessages: TIBDataBaseErrorMessages;
threadvar
  FStatusVector : TStatusVector;

procedure IBAlloc(var P; OldSize, NewSize: NativeInt);
var
  i: Integer;
begin
  if Assigned(Pointer(P)) then
    ReallocMem(Pointer(P), NewSize)
  else
    GetMem(Pointer(P), NewSize);
  for i := OldSize to NewSize - 1 do
    PByte(P)[i] := 0;
end;

{$IFDEF NEXTGEN}
procedure IBAlloc(var p : TRecBuf; OldSize, NewSize: NativeInt);
var
  i: Integer;
begin
  ReallocMem(Pointer(p), NewSize);
  for i := OldSize to NewSize - 1 do
    PByte(p)[i] := 0;
end;
{$ELSE}
procedure IBAlloc(var p : TRecordBuffer; OldSize, NewSize: NativeInt);
var
  i: Integer;
begin
  ReallocMem(p, NewSize);
  for i := OldSize to NewSize - 1 do
    p[i] := 0;
end;
{$ENDIF NEXTGEN}

procedure IBError(ErrMess: TIBClientError; const Args: array of const);
begin
  if (ErrMess <> ibxeCannotCreateSharedResource) and
     (MonitorHook <> nil) then
    MonitorHook.SendError(Format(IBErrorMessages[ErrMess], Args));
  raise EIBClientError.Create(Ord(ErrMess),
          Format(IBErrorMessages[ErrMess], Args));
end;

procedure IBDataBaseError(FGDSLibrary : IGDSLibrary);
var
  sqlcode: Long;
  IBErrorCode: Long;
  local_buffer: array[0..IBHugeLocalBufferLength - 1] of Byte;
  usr_msg: string;
  status_vector: PISC_STATUS;
  IBDataBaseErrorMessages: TIBDataBaseErrorMessages;

  { Occasionally the IB call leaves garbage after the terminating null so can't use trim}
  function ErrorCorrect : String;
  begin
    Result := StringOf(TEncoding.Convert(TEncoding.ANSI, TEncoding.Default, local_buffer));
    SetLength(Result, StrLen(PChar(Result)));
  end;

begin
  if FGDSLibrary = nil then
    FGDSLibrary := GetGDSLibrary('IBServer');
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
  if (MonitorHook <> nil) then
    MonitorHook.SendError(IntToStr(sqlcode) + ' ' + IntToStr(IBErrorCode) + ' ' + usr_msg);
  if sqlcode <> -551 then
    raise EIBInterBaseError.Create(sqlcode, IBErrorCode, usr_msg)
  else
    raise EIBInterBaseRoleError.Create(sqlcode, IBErrorCode, usr_msg)
end;

{ Return the status vector for the current thread }
function StatusVector: PISC_STATUS;
begin
  result := @FStatusVector;
end;

function StatusVectorArray: PStatusVector;
begin
  result := @FStatusVector;
end;

function CheckStatusVector(ErrorCodes: array of ISC_STATUS): Boolean;
var
  p: PISC_STATUS;
  i: Integer;
  procedure NextP(i: Integer);
  begin
    p := PISC_STATUS(PByte(p) + (i * SizeOf(ISC_STATUS)));
  end;
begin
  p := @FStatusVector;
  result := False;
  while (p^ <> 0) and (not result) do
    case p^ of
      3: NextP(3);
      1, 4:
      begin
        NextP(1);
        i := 0;
        while (i <= High(ErrorCodes)) and (not result) do
        begin
          result := p^ = ErrorCodes[i];
          Inc(i);
        end;
        NextP(1);
      end;
      else
        NextP(2);
    end;
end;

function StatusVectorAsText: string;
var
  p: PISC_STATUS;
  function NextP(i: Integer): PISC_STATUS;
  begin
    p := PISC_STATUS(PByte(p) + (i * SizeOf(ISC_STATUS)));
    result := p;
  end;
begin
  p := @FStatusVector;
  result := '';
  while (p^ <> 0) do
    if (p^ = 3) then
    begin
      result := result + Format('%d %d %d', [p^, NextP(1)^, NextP(1)^]) + CRLF;
      NextP(1);
    end
    else begin
      result := result + Format('%d %d', [p^, NextP(1)^]) + CRLF;
      NextP(1);
    end;
end;

{ EIBError }
constructor EIBError.Create(ASQLCode: Long; Msg: string);
begin
  inherited Create(Msg);
  FSQLCode := ASQLCode;
end;

constructor EIBError.Create(ASQLCode: Long; AIBErrorCode: Long; Msg: string);
begin
  inherited Create(Msg);
  FSQLCode :=  ASQLCode;
  FIBErrorCode := AIBErrorCode;
end;

procedure SetIBDataBaseErrorMessages(Value: TIBDataBaseErrorMessages);
begin
  IBCS.BeginWrite;
  try
    IBDataBaseErrorMessages := Value;
  finally
    IBCS.EndWrite;
  end;
end;

function GetIBDataBaseErrorMessages: TIBDataBaseErrorMessages;
begin
  IBCS.BeginWrite;
  try
    result := IBDataBaseErrorMessages;
  finally
    IBCS.EndWrite;
  end;
end;

initialization
  IsMultiThread := True;
  IBCS := TSimpleRWSync.Create;
  IBDataBaseErrorMessages := [ShowSQLMessage, ShowIBMessage];

finalization
  IBCS.Free;

end.

