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
unit IBX.IBXConst;

interface

const
  // note major side is the Delphi version, the minor side is the interface version
  //    This was a convention when there were multiple versions supported with
  //    interface changes in patches.  Not very valuable these days since this
  //    no longer occurs
  IBX_Version = 19.19;
  CRLF = #13 + #10;
  CR   = #13;
  LF   = #10;
  TAB  = #9;
  NULL_TERMINATOR = #0;

resourcestring
{ generic strings used in code }
  SIBDatabaseEditor = 'Da&tabase Editor...';
  SIBTransactionEditor = '&Transaction Editor...';
  SDatabaseFilter = 'Database Files (*.ib;*.gdb)|*.ib;*.gdb|All files (*.*)|*.*';
  SDisconnectDatabase = 'Database is currently connected. Disconnect and continue?';
  SCommitTransaction = 'Transaction is currently Active. Rollback and continue?';
  SExecute = 'E&xecute';
  SNoDataSet = 'No dataset association';
  SSQLGenSelect = 'Must select at least one key field and one update field';
  SSQLNotGenerated = 'Update SQL statements not generated, exit anyway?';
  SIBUpdateSQLEditor = '&UpdateSQL Editor...';
  SIBDataSetEditor = '&Dataset Editor...';
  SSQLDataSetOpen = 'Unable to determine field names for %s';
  SDefaultTransaction = '%s, Default';

{SQLMonitor Strings}
  StrConnect = ': [Connect]';
  StrDisconnect = ': [Disconnect]';
  StrMisc = '[Misc] ';
  StrError = '[Error] ';
  StrAttach = ': [Attach]';
  StrDetach = ': [Detach]';
  StrQuery = ': [Query]';
  StrStart = ': [Start]';
  StrExecute = ': [Execute] ';
  StrNULL = '<NULL>';
  StrBLOB = '<BLOB>';
  StrFetch = ': [Fetch] ';
  StrPrepare = ': [Prepare] ';
  StrPlan = '  Plan: ';
  StrPlanCantRetrive = '  Plan: Can''t retrieve plan - too large';
  StrCommitHardComm = ': [Commit (Hard commit)]';
  StrCommitRetaining = ': [Commit retaining (Soft commit)]';
  StrRollback = ': [Rollback]';
  StrRollbackRetainin = ': [Rollback retaining (Soft rollback)]';
  StrStartTransaction = ': [Start transaction]';
  StrApplication = '[Application: ';

  { strings used in error messages}
  SUnknownError = 'Unknown error';
  SInterBaseMissing = 'InterBase library %s not found in the path. Please install InterBase to use this functionality';
  SInterBaseInstallMissing = 'InterBase Install DLL ibinstall.dll not found in the path. Please install InterBase 6 to use this functionality';
  SIB60feature = '%s is an InterBase 6 function. Please upgrade to InterBase 6 to use this functonality';
  SNotSupported = 'Unsupported feature';
  SNotPermitted = 'Not permitted';
  SFileAccessError = 'Temporary file access error';
  SConnectionTimeout = 'Database connection timed out';
  SCannotSetDatabase = 'Cannot set database';
  SCannotSetTransaction = 'Cannot set transaction';
  SOperationCancelled = 'Operation cancelled at user''s request';
  SDPBConstantNotSupported = 'DPB Constant (isc_dpb_%s) is unsupported';
  SDPBConstantUnknown = 'DPB Constant (%d) is unknown';
  STPBConstantNotSupported = 'TPB Constant (isc_tpb_%s) is unsupported';
  STPBConstantUnknown = 'TPB Constant (%d) is unknown';
  SDatabaseClosed = 'Cannot perform operation -- DB is not open';
  SDatabaseOpen = 'Cannot perform operation -- DB is currently open';
  SDatabaseNameMissing = 'Database name is missing';
  SNotInTransaction = 'Transaction is not active';
  SInTransaction = 'Transaction is active';
  STimeoutNegative = 'Timeout values cannot be negative';
  SNoDatabasesInTransaction = 'No databases are listed in transaction component';
  SUpdateWrongDB = 'Updating wrong database';
  SUpdateWrongTR = 'Updating wrong transaction. Unique transaction expected in set';
  SDatabaseNotAssigned = 'Database not assigned';
  STransactionNotAssigned = 'Transaction not assigned';
  SXSQLDAIndexOutOfRange = 'XSQLDA index out of range';
  SXSQLDANameDoesNotExist = 'XSQLDA name does not exist (%s)';
  SEOF = 'End of file';
  SBOF = 'Beginning of file';
  SInvalidStatementHandle = 'Invalid statement handle';
  SSQLOpen = 'IBSQL Open';
  SSQLClosed = 'IBSQL Closed';
  SDatasetOpen = 'Dataset open';
  SDatasetClosed = 'Dataset closed';
  SUnknownSQLDataType = 'Unknown SQL Data type (%d)';
  SInvalidColumnIndex = 'Invalid column index (index exceeds permitted range)';
  SInvalidParamColumnIndex = 'Invalid parameter index (index exceeds permitted range)';
  SInvalidDataConversion = 'Invalid data conversion';
  SColumnIsNotNullable = 'Column cannot be set to null (%s)';
  SBlobCannotBeRead = 'Blob stream cannot be read';
  SBlobCannotBeWritten = 'Blob stream cannot be written';
  SEmptyQuery = 'Empty query';
  SCannotOpenNonSQLSelect = 'Cannot "open" a non-select statement. Use ExecQuery';
  SNoFieldAccess = 'No access to field "%s"';
  SFieldReadOnly = 'Field "%s" is read-only';
  SFieldNotFound = 'Field "%s" not found';
  SNotEditing = 'Not in edit mode';
  SCannotInsert = 'Cannot insert into dataset. (No insert query)';
  SCannotPost = 'Cannot post. (No update/insert query)';
  SCannotUpdate = 'Cannot update. (No update query)';
  SCannotDelete = 'Cannot delete from dataset. (No delete query)';
  SCannotRefresh = 'Cannot refresh row. (No refresh query)';
  SBufferNotSet = 'Buffer not set';
  SCircularReference = 'Circular references not permitted';
  SSQLParseError = 'SQL Parse Error:' + CRLF + CRLF + '%s';
  SUserAbort = 'User abort';
  SDataSetUniDirectional = 'Data set is uni-directional';
  SCannotCreateSharedResource = 'Cannot create shared resource. (Windows error %d)';
  SWindowsAPIError = 'Windows API error. (Windows error %d [$%.8x])';
  SColumnListsDontMatch = 'Column lists do not match';
  SColumnTypesDontMatch = 'Column types don''t match. (From index: %d; To index: %d)';
  SCantEndSharedTransaction = 'Can''t end a shared transaction unless it is forced and equal ' +
                             'to the transaction''s TimeoutAction';
  SFieldUnsupportedType = 'Unsupported Field Type';
  SCircularDataLink = 'Circular DataLink Reference';
  SEmptySQLStatement = 'Empty SQL Statement';
  SIsASelectStatement = 'use Open for a Select Statement';
  SRequiredParamNotSet = 'Required Param value not set';
  SNoStoredProcName = 'No Stored Procedure Name assigned';
  SIsAExecuteProcedure = 'use ExecProc for Procedure; use TQuery for Select procedures';
  SUpdateFailed = 'Update Failed';
  SNotCachedUpdates = 'CachedUpdates not enabled';
  SNotLiveRequest = 'Request is not live - cannot modify';
  SNoProvider = 'No Provider';
  SNoRecordsAffected = 'No Records Affected';
  SNoTableName = 'No Table Name assigned';
  SCannotCreatePrimaryIndex = 'Cannot Create Primary Index; are created automatically';
  SCannotDropSystemIndex = 'Cannot Drop System Index';
  STableNameMismatch = 'Table Name Mismatch';
  SIndexFieldMissing = 'Index Field Missing';
  SInvalidCancellation = 'Cannot Cancel events while processing';
  SInvalidEvent = 'Invalid Event';
  SMaximumEvents = 'Exceded Maximum Event limits';
  SNoEventsRegistered = 'No Events Registered';
  SInvalidQueueing = 'Invalid Queueing';
  SInvalidRegistration = 'Invalid Registration';
  SInvalidBatchMove = 'Invalid Batch Move';
  SSQLDialectInvalid = 'SQL Dialect Invalid';
  SSPBConstantNotSupported = 'SPB Constant Not supported';
  SSPBConstantUnknown = 'SPB Constant Unknown';
  SServiceActive = 'Cannot perform operation -- service is not attached';
  SServiceInActive = 'Cannot perform operation -- service is attached';
  SServerNameMissing = 'Server Name Missing';
  SQueryParamsError = 'Query Parameters missing or incorrect';
  SStartParamsError = 'start Parameters missing or incorrect';
  SOutputParsingError = 'Unexpected Output buffer value';
  SUseSpecificProcedures = 'Generic ServiceStart not applicable: Use Specific Procedures to set configuration params';
  SSQLMonitorAlreadyPresent = 'SQL Monitor Instance is already present';
  SCantPrintValue = 'Cannot print value';
  SEOFReached = 'SEOFReached';
  SEOFInComment = 'EOF in comment detected';
  SEOFInString = 'EOF in string detected';
  SParamNameExpected = 'Parameter name expected';
  SSuccess = 'Successful execution';
  SDelphiException = 'DelphiException %s';
  SNoOptionsSet = 'No Install Options selected';
  SNoDestinationDirectory = 'DestinationDirectory is not set';
  SNosourceDirectory = 'SourceDirectory is not set';
  SNoUninstallFile = 'Uninstall File Name is not set';
  SOptionNeedsClient = '%s component requires Client to function properly';
  SOptionNeedsServer = '%s component requires Server to function properly';
  SInvalidOption = 'Invalid option specified';
  SInvalidOnErrorResult = 'Unexpected onError return value';
  SInvalidOnStatusResult = 'Unexpected onStatus return value';

  SInterbaseExpressVersion = 'InterBaseExpress 4.3';
  SEditSQL = 'Edit SQL';
  SDPBConstantUnknownEx = 'DPB Constant (%s) is unknown';
  STPBConstantUnknownEx = 'TPB Constant (%s) is unknown';
  SInterbaseExpressVersionEx = 'InterBaseExpress %2.2f';
  SUnknownPlan = 'Unknown Error - Can''t retrieve plan';
  SFieldSizeMismatch = 'Size Mismatch - Field %s size is too small for data';
  SEventAlreadyRegistered   = 'Events already registered';
  SStringTooLarge = 'Trying to store a string of length %d into a field that can only contain %d';
  SIBServiceEditor = '&Service Editor ...';
  SIBSuccessConnect = 'Successful Connection';
  SNoTimers = 'Not enough timers available';
  SIB65feature = '%s is an InterBase 6.5 function. Please upgrade to InterBase 6.5 to use this functonality';
  SLoginPromptFailure = 'Can not find default login prompt dialog.  Please add DBLogDlg to the uses section of your main file.';
  SIBMemoryError = 'Out of memory';
  SIBInvalidStatement = 'Invalid statement';
  SIBInvalidComment = 'Invalid Comment';
  SIBBrokerOpen = '  Opening connection ';
  SIBBrokerVersion = 'Starting IBConnectionBroker Version 1.0.1:';
  SIBBrokerDatabase = 'Database Name = ';
  SIBBrokerUser = 'User Name = ';
  SIBBrokerMinConnections = 'Min Connections = ';
  SIBBrokerMaxConnections = 'Max Connections = ';
  SIBBrokerIdleTimer = 'IdleTimer = ';
  SIBBrokerGiveOut = 'gave out connection ';
  SIBBrokerUnavailable = 'Unable to create new connection: ';
  SIBBrokerExhausted = '-----> Connections Exhausted!  Will wait and try again in loop ';
  SIBBrokerNilError = 'Nil database tried to be released';
  SIBBrokerRelease = 'Release connection ';
  SIBDatabaseINISection = 'Database Settings';
  SIBDatabaseINISectionEmpty = 'Section name can not be empty';
  SIB70feature = '%s is an InterBase 7.0 function. Please upgrade to InterBase 7.0 to use this functonality';
  SIB71feature = '%s is an InterBase 7.1 function. Please upgrade to InterBase 7.1 to use this functonality';
  SIB75feature = '%s is an InterBase 7.5 function. Please upgrade to InterBase 7.5 to use this functonality';
  SIB751feature = '%s is an InterBase 7.51 function. Please upgrade to InterBase 7.51 to use this functonality';
  SIB80feature = '%s is an InterBase 2007 function. Please upgrade to InterBase 2007 to use this functonality';
  SNoVersionInfo = 'Version infomation for this server is not retreived';
  SFileSizeDumpCountIncompatibility = 'If you supply sizes you must supply 1 size for every file in the Files list (last size optional)';
  SCannotPerformDumpOnActiveConnection = 'Database can not be connected when performing an Online Dump';
  SDirectoriesSizeArchiveIncompatibility = 'If you supply sizes you must supply 1 size for every file in the Directories list (last size optional)';
  SInvalidBatchStatement = 'Only DDL and DML (excluding Select statements) allowed within a Batch block';
  SIBFecthJournalInfo = '&Retrieve Journal Information';
  SIBUnknownServerType = '%s is not a registered server type';
  SInvalidLibraryType = 'Invalid library type assigned.  Valid strings are %s';
  SCannotChangeServerType = 'ServerType can not be changed on an active connection';
  SEncryptionPassword = 'Enter Password here';
  SServerTypeEmpty = 'ServerType must not be empty. IBServer is the usual value';
  SColumnEncryptionError = 'Both tablename and column name are required to set column level encryption passwords';
  SEncryptionError = 'Connection must be active to set encryption passwords';
  SIBXE3feature = '%s is an InterBase XE3 function. Please upgrade to InterBase XE3 to use this functonality';
  SMalformedSSLConnection = 'Malformed SSL connection string.  String must be terminated with a ''??''';
  SMalformedSSLConnection2 = 'Malformed SSL connection string.  Starting ''?ssl=true'' not found';
  SSSLSeverExclusive = 'serverPublicFile and serverPublicPath are mutually exclusive options.';
  SSSLClientExclusive = 'clientPassPhraseFile and clientPassPhrase are mutually exclusive options.';
  SInstallOSNotSupported = 'Install Library is not supported on iOS';
  SOnlineDumpAvailable = 'Service API Online dump ';
  SInvalidSQLOverride = 'Invalid SQL Override - Valid options are 0 (no override) 1 and 3';
  SServiceWriteModeErr = 'Service API write mode';
  SInvalidODSVersion = 'Invalid ODS Major Restore version. Valid options are 0 (no change) and >= ODS 13';
  SMissingIBSQL = 'Missing IBSQL object.  Either pass it as a parameter or set the IBSQL property.';
  SBatchParamFieldMisMatch = 'All Params must have a matching field with the same name in the passed TIBSQL';

implementation

end.
 
