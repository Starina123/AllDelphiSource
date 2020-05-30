unit ADODB_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.79  $
// File generated on 6/24/99 8:08:50 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\PROGRAM FILES\COMMON FILES\SYSTEM\ADO\msado15.dll (1)
// IID\LCID: {00000201-0000-0010-8000-00AA006D2EA4}\0
// Helpfile: C:\PROGRAM FILES\COMMON FILES\SYSTEM\ADO\ado210.chm
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
// Parent TypeLibrary:
//   (0) v1.0 RServer, (D:\ADO\demos\RDS\RDSServer.tlb)
// Errors:
//   Hint: Member 'Disconnect' of 'ConnectionEventsVt' changed to 'Disconnect1'
//   Hint: Member 'Disconnect' of 'ConnectionEvents' changed to 'Disconnect1'
//   Hint: TypeInfo 'Property' changed to 'Property_'
//   Hint: Parameter 'Object' of _DynaCollection.Append changed to 'Object_'
//   Hint: Member 'Type' of 'Property' changed to 'Type_'
//   Hint: Parameter 'Type' of Command15.CreateParameter changed to 'Type_'
//   Hint: Parameter 'Type' of Fields.Append changed to 'Type_'
//   Hint: Member 'Type' of 'Field' changed to 'Type_'
//   Hint: Member 'Type' of '_Parameter' changed to 'Type_'
//   Hint: Member 'Type' of 'Field15' changed to 'Type_'
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ADODBMajorVersion = 2;
  ADODBMinorVersion = 1;

  LIBID_ADODB: TGUID = '{00000201-0000-0010-8000-00AA006D2EA4}';

  IID__Collection: TGUID = '{00000512-0000-0010-8000-00AA006D2EA4}';
  IID__DynaCollection: TGUID = '{00000513-0000-0010-8000-00AA006D2EA4}';
  IID__ADO: TGUID = '{00000534-0000-0010-8000-00AA006D2EA4}';
  IID_Properties: TGUID = '{00000504-0000-0010-8000-00AA006D2EA4}';
  IID_Property_: TGUID = '{00000503-0000-0010-8000-00AA006D2EA4}';
  IID_Error: TGUID = '{00000500-0000-0010-8000-00AA006D2EA4}';
  IID_Errors: TGUID = '{00000501-0000-0010-8000-00AA006D2EA4}';
  IID_Command15: TGUID = '{00000508-0000-0010-8000-00AA006D2EA4}';
  IID_Connection15: TGUID = '{00000515-0000-0010-8000-00AA006D2EA4}';
  IID__Connection: TGUID = '{00000550-0000-0010-8000-00AA006D2EA4}';
  IID_Recordset15: TGUID = '{0000050E-0000-0010-8000-00AA006D2EA4}';
  IID_Recordset20: TGUID = '{0000054F-0000-0010-8000-00AA006D2EA4}';
  IID__Recordset: TGUID = '{00000555-0000-0010-8000-00AA006D2EA4}';
  IID_Fields15: TGUID = '{00000506-0000-0010-8000-00AA006D2EA4}';
  IID_Fields: TGUID = '{0000054D-0000-0010-8000-00AA006D2EA4}';
  IID_Field: TGUID = '{0000054C-0000-0010-8000-00AA006D2EA4}';
  IID__Parameter: TGUID = '{0000050C-0000-0010-8000-00AA006D2EA4}';
  IID_Parameters: TGUID = '{0000050D-0000-0010-8000-00AA006D2EA4}';
  IID__Command: TGUID = '{0000054E-0000-0010-8000-00AA006D2EA4}';
  IID_ConnectionEventsVt: TGUID = '{00000402-0000-0010-8000-00AA006D2EA4}';
  IID_RecordsetEventsVt: TGUID = '{00000403-0000-0010-8000-00AA006D2EA4}';
  DIID_ConnectionEvents: TGUID = '{00000400-0000-0010-8000-00AA006D2EA4}';
  DIID_RecordsetEvents: TGUID = '{00000266-0000-0010-8000-00AA006D2EA4}';
  IID_ADOConnectionConstruction15: TGUID = '{00000516-0000-0010-8000-00AA006D2EA4}';
  IID_ADOConnectionConstruction: TGUID = '{00000551-0000-0010-8000-00AA006D2EA4}';
  CLASS_Connection: TGUID = '{00000514-0000-0010-8000-00AA006D2EA4}';
  IID_ADOCommandConstruction: TGUID = '{00000517-0000-0010-8000-00AA006D2EA4}';
  CLASS_Command: TGUID = '{00000507-0000-0010-8000-00AA006D2EA4}';
  CLASS_Recordset: TGUID = '{00000535-0000-0010-8000-00AA006D2EA4}';
  IID_ADORecordsetConstruction: TGUID = '{00000283-0000-0010-8000-00AA006D2EA4}';
  IID_Field15: TGUID = '{00000505-0000-0010-8000-00AA006D2EA4}';
  CLASS_Parameter: TGUID = '{0000050B-0000-0010-8000-00AA006D2EA4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// CursorTypeEnum constants
type
  CursorTypeEnum = TOleEnum;
const
  adOpenUnspecified = $FFFFFFFF;
  adOpenForwardOnly = $00000000;
  adOpenKeyset = $00000001;
  adOpenDynamic = $00000002;
  adOpenStatic = $00000003;

// CursorOptionEnum constants
type
  CursorOptionEnum = TOleEnum;
const
  adHoldRecords = $00000100;
  adMovePrevious = $00000200;
  adAddNew = $01000400;
  adDelete = $01000800;
  adUpdate = $01008000;
  adBookmark = $00002000;
  adApproxPosition = $00004000;
  adUpdateBatch = $00010000;
  adResync = $00020000;
  adNotify = $00040000;
  adFind = $00080000;
  adSeek = $00400000;
  adIndex = $00800000;

// LockTypeEnum constants
type
  LockTypeEnum = TOleEnum;
const
  adLockUnspecified = $FFFFFFFF;
  adLockReadOnly = $00000001;
  adLockPessimistic = $00000002;
  adLockOptimistic = $00000003;
  adLockBatchOptimistic = $00000004;

// ExecuteOptionEnum constants
type
  ExecuteOptionEnum = TOleEnum;
const
  adOptionUnspecified = $FFFFFFFF;
  adAsyncExecute = $00000010;
  adAsyncFetch = $00000020;
  adAsyncFetchNonBlocking = $00000040;
  adExecuteNoRecords = $00000080;

// ConnectOptionEnum constants
type
  ConnectOptionEnum = TOleEnum;
const
  adConnectUnspecified = $FFFFFFFF;
  adAsyncConnect = $00000010;

// ObjectStateEnum constants
type
  ObjectStateEnum = TOleEnum;
const
  adStateClosed = $00000000;
  adStateOpen = $00000001;
  adStateConnecting = $00000002;
  adStateExecuting = $00000004;
  adStateFetching = $00000008;

// CursorLocationEnum constants
type
  CursorLocationEnum = TOleEnum;
const
  adUseNone = $00000001;
  adUseServer = $00000002;
  adUseClient = $00000003;
  adUseClientBatch = $00000003;

// DataTypeEnum constants
type
  DataTypeEnum = TOleEnum;
const
  adEmpty = $00000000;
  adTinyInt = $00000010;
  adSmallInt = $00000002;
  adInteger = $00000003;
  adBigInt = $00000014;
  adUnsignedTinyInt = $00000011;
  adUnsignedSmallInt = $00000012;
  adUnsignedInt = $00000013;
  adUnsignedBigInt = $00000015;
  adSingle = $00000004;
  adDouble = $00000005;
  adCurrency = $00000006;
  adDecimal = $0000000E;
  adNumeric = $00000083;
  adBoolean = $0000000B;
  adError = $0000000A;
  adUserDefined = $00000084;
  adVariant = $0000000C;
  adIDispatch = $00000009;
  adIUnknown = $0000000D;
  adGUID = $00000048;
  adDate = $00000007;
  adDBDate = $00000085;
  adDBTime = $00000086;
  adDBTimeStamp = $00000087;
  adBSTR = $00000008;
  adChar = $00000081;
  adVarChar = $000000C8;
  adLongVarChar = $000000C9;
  adWChar = $00000082;
  adVarWChar = $000000CA;
  adLongVarWChar = $000000CB;
  adBinary = $00000080;
  adVarBinary = $000000CC;
  adLongVarBinary = $000000CD;
  adChapter = $00000088;
  adFileTime = $00000040;
  adDBFileTime = $00000089;
  adPropVariant = $0000008A;
  adVarNumeric = $0000008B;

// FieldAttributeEnum constants
type
  FieldAttributeEnum = TOleEnum;
const
  adFldUnspecified = $FFFFFFFF;
  adFldMayDefer = $00000002;
  adFldUpdatable = $00000004;
  adFldUnknownUpdatable = $00000008;
  adFldFixed = $00000010;
  adFldIsNullable = $00000020;
  adFldMayBeNull = $00000040;
  adFldLong = $00000080;
  adFldRowID = $00000100;
  adFldRowVersion = $00000200;
  adFldCacheDeferred = $00001000;
  adFldNegativeScale = $00004000;
  adFldKeyColumn = $00008000;

// EditModeEnum constants
type
  EditModeEnum = TOleEnum;
const
  adEditNone = $00000000;
  adEditInProgress = $00000001;
  adEditAdd = $00000002;
  adEditDelete = $00000004;

// RecordStatusEnum constants
type
  RecordStatusEnum = TOleEnum;
const
  adRecOK = $00000000;
  adRecNew = $00000001;
  adRecModified = $00000002;
  adRecDeleted = $00000004;
  adRecUnmodified = $00000008;
  adRecInvalid = $00000010;
  adRecMultipleChanges = $00000040;
  adRecPendingChanges = $00000080;
  adRecCanceled = $00000100;
  adRecCantRelease = $00000400;
  adRecConcurrencyViolation = $00000800;
  adRecIntegrityViolation = $00001000;
  adRecMaxChangesExceeded = $00002000;
  adRecObjectOpen = $00004000;
  adRecOutOfMemory = $00008000;
  adRecPermissionDenied = $00010000;
  adRecSchemaViolation = $00020000;
  adRecDBDeleted = $00040000;

// GetRowsOptionEnum constants
type
  GetRowsOptionEnum = TOleEnum;
const
  adGetRowsRest = $FFFFFFFF;

// PositionEnum constants
type
  PositionEnum = TOleEnum;
const
  adPosUnknown = $FFFFFFFF;
  adPosBOF = $FFFFFFFE;
  adPosEOF = $FFFFFFFD;

// BookmarkEnum constants
type
  BookmarkEnum = TOleEnum;
const
  adBookmarkCurrent = $00000000;
  adBookmarkFirst = $00000001;
  adBookmarkLast = $00000002;

// MarshalOptionsEnum constants
type
  MarshalOptionsEnum = TOleEnum;
const
  adMarshalAll = $00000000;
  adMarshalModifiedOnly = $00000001;

// AffectEnum constants
type
  AffectEnum = TOleEnum;
const
  adAffectCurrent = $00000001;
  adAffectGroup = $00000002;
  adAffectAll = $00000003;
  adAffectAllChapters = $00000004;

// ResyncEnum constants
type
  ResyncEnum = TOleEnum;
const
  adResyncUnderlyingValues = $00000001;
  adResyncAllValues = $00000002;

// CompareEnum constants
type
  CompareEnum = TOleEnum;
const
  adCompareLessThan = $00000000;
  adCompareEqual = $00000001;
  adCompareGreaterThan = $00000002;
  adCompareNotEqual = $00000003;
  adCompareNotComparable = $00000004;

// FilterGroupEnum constants
type
  FilterGroupEnum = TOleEnum;
const
  adFilterNone = $00000000;
  adFilterPendingRecords = $00000001;
  adFilterAffectedRecords = $00000002;
  adFilterFetchedRecords = $00000003;
  adFilterPredicate = $00000004;
  adFilterConflictingRecords = $00000005;

// SearchDirectionEnum constants
type
  SearchDirectionEnum = TOleEnum;
const
  adSearchForward = $00000001;
  adSearchBackward = $FFFFFFFF;

// PersistFormatEnum constants
type
  PersistFormatEnum = TOleEnum;
const
  adPersistADTG = $00000000;
  adPersistXML = $00000001;

// StringFormatEnum constants
type
  StringFormatEnum = TOleEnum;
const
  adClipString = $00000002;

// ConnectPromptEnum constants
type
  ConnectPromptEnum = TOleEnum;
const
  adPromptAlways = $00000001;
  adPromptComplete = $00000002;
  adPromptCompleteRequired = $00000003;
  adPromptNever = $00000004;

// ConnectModeEnum constants
type
  ConnectModeEnum = TOleEnum;
const
  adModeUnknown = $00000000;
  adModeRead = $00000001;
  adModeWrite = $00000002;
  adModeReadWrite = $00000003;
  adModeShareDenyRead = $00000004;
  adModeShareDenyWrite = $00000008;
  adModeShareExclusive = $0000000C;
  adModeShareDenyNone = $00000010;

// IsolationLevelEnum constants
type
  IsolationLevelEnum = TOleEnum;
const
  adXactUnspecified = $FFFFFFFF;
  adXactChaos = $00000010;
  adXactReadUncommitted = $00000100;
  adXactBrowse = $00000100;
  adXactCursorStability = $00001000;
  adXactReadCommitted = $00001000;
  adXactRepeatableRead = $00010000;
  adXactSerializable = $00100000;
  adXactIsolated = $00100000;

// XactAttributeEnum constants
type
  XactAttributeEnum = TOleEnum;
const
  adXactCommitRetaining = $00020000;
  adXactAbortRetaining = $00040000;
  adXactAsyncPhaseOne = $00080000;
  adXactSyncPhaseOne = $00100000;

// PropertyAttributesEnum constants
type
  PropertyAttributesEnum = TOleEnum;
const
  adPropNotSupported = $00000000;
  adPropRequired = $00000001;
  adPropOptional = $00000002;
  adPropRead = $00000200;
  adPropWrite = $00000400;

// ErrorValueEnum constants
type
  ErrorValueEnum = TOleEnum;
const
  adErrInvalidArgument = $00000BB9;
  adErrNoCurrentRecord = $00000BCD;
  adErrIllegalOperation = $00000C93;
  adErrInTransaction = $00000CAE;
  adErrFeatureNotAvailable = $00000CB3;
  adErrItemNotFound = $00000CC1;
  adErrObjectInCollection = $00000D27;
  adErrObjectNotSet = $00000D5C;
  adErrDataConversion = $00000D5D;
  adErrObjectClosed = $00000E78;
  adErrObjectOpen = $00000E79;
  adErrProviderNotFound = $00000E7A;
  adErrBoundToCommand = $00000E7B;
  adErrInvalidParamInfo = $00000E7C;
  adErrInvalidConnection = $00000E7D;
  adErrNotReentrant = $00000E7E;
  adErrStillExecuting = $00000E7F;
  adErrOperationCancelled = $00000E80;
  adErrStillConnecting = $00000E81;
  adErrNotExecuting = $00000E83;
  adErrUnsafeOperation = $00000E84;

// ParameterAttributesEnum constants
type
  ParameterAttributesEnum = TOleEnum;
const
  adParamSigned = $00000010;
  adParamNullable = $00000040;
  adParamLong = $00000080;

// ParameterDirectionEnum constants
type
  ParameterDirectionEnum = TOleEnum;
const
  adParamUnknown = $00000000;
  adParamInput = $00000001;
  adParamOutput = $00000002;
  adParamInputOutput = $00000003;
  adParamReturnValue = $00000004;

// CommandTypeEnum constants
type
  CommandTypeEnum = TOleEnum;
const
  adCmdUnspecified = $FFFFFFFF;
  adCmdUnknown = $00000008;
  adCmdText = $00000001;
  adCmdTable = $00000002;
  adCmdStoredProc = $00000004;
  adCmdFile = $00000100;
  adCmdTableDirect = $00000200;

// EventStatusEnum constants
type
  EventStatusEnum = TOleEnum;
const
  adStatusOK = $00000001;
  adStatusErrorsOccurred = $00000002;
  adStatusCantDeny = $00000003;
  adStatusCancel = $00000004;
  adStatusUnwantedEvent = $00000005;

// EventReasonEnum constants
type
  EventReasonEnum = TOleEnum;
const
  adRsnAddNew = $00000001;
  adRsnDelete = $00000002;
  adRsnUpdate = $00000003;
  adRsnUndoUpdate = $00000004;
  adRsnUndoAddNew = $00000005;
  adRsnUndoDelete = $00000006;
  adRsnRequery = $00000007;
  adRsnResynch = $00000008;
  adRsnClose = $00000009;
  adRsnMove = $0000000A;
  adRsnFirstChange = $0000000B;
  adRsnMoveFirst = $0000000C;
  adRsnMoveNext = $0000000D;
  adRsnMovePrevious = $0000000E;
  adRsnMoveLast = $0000000F;

// SchemaEnum constants
type
  SchemaEnum = TOleEnum;
const
  adSchemaProviderSpecific = $FFFFFFFF;
  adSchemaAsserts = $00000000;
  adSchemaCatalogs = $00000001;
  adSchemaCharacterSets = $00000002;
  adSchemaCollations = $00000003;
  adSchemaColumns = $00000004;
  adSchemaCheckConstraints = $00000005;
  adSchemaConstraintColumnUsage = $00000006;
  adSchemaConstraintTableUsage = $00000007;
  adSchemaKeyColumnUsage = $00000008;
  adSchemaReferentialContraints = $00000009;
  adSchemaReferentialConstraints = $00000009;
  adSchemaTableConstraints = $0000000A;
  adSchemaColumnsDomainUsage = $0000000B;
  adSchemaIndexes = $0000000C;
  adSchemaColumnPrivileges = $0000000D;
  adSchemaTablePrivileges = $0000000E;
  adSchemaUsagePrivileges = $0000000F;
  adSchemaProcedures = $00000010;
  adSchemaSchemata = $00000011;
  adSchemaSQLLanguages = $00000012;
  adSchemaStatistics = $00000013;
  adSchemaTables = $00000014;
  adSchemaTranslations = $00000015;
  adSchemaProviderTypes = $00000016;
  adSchemaViews = $00000017;
  adSchemaViewColumnUsage = $00000018;
  adSchemaViewTableUsage = $00000019;
  adSchemaProcedureParameters = $0000001A;
  adSchemaForeignKeys = $0000001B;
  adSchemaPrimaryKeys = $0000001C;
  adSchemaProcedureColumns = $0000001D;
  adSchemaDBInfoKeywords = $0000001E;
  adSchemaDBInfoLiterals = $0000001F;
  adSchemaCubes = $00000020;
  adSchemaDimensions = $00000021;
  adSchemaHierarchies = $00000022;
  adSchemaLevels = $00000023;
  adSchemaMeasures = $00000024;
  adSchemaProperties = $00000025;
  adSchemaMembers = $00000026;
  adSchemaTrustees = $00000027;

// SeekEnum constants
type
  SeekEnum = TOleEnum;
const
  adSeekFirstEQ = $00000001;
  adSeekLastEQ = $00000002;
  adSeekAfterEQ = $00000004;
  adSeekAfter = $00000008;
  adSeekBeforeEQ = $00000010;
  adSeekBefore = $00000020;

// ADCPROP_UPDATECRITERIA_ENUM constants
type
  ADCPROP_UPDATECRITERIA_ENUM = TOleEnum;
const
  adCriteriaKey = $00000000;
  adCriteriaAllCols = $00000001;
  adCriteriaUpdCols = $00000002;
  adCriteriaTimeStamp = $00000003;

// ADCPROP_ASYNCTHREADPRIORITY_ENUM constants
type
  ADCPROP_ASYNCTHREADPRIORITY_ENUM = TOleEnum;
const
  adPriorityLowest = $00000001;
  adPriorityBelowNormal = $00000002;
  adPriorityNormal = $00000003;
  adPriorityAboveNormal = $00000004;
  adPriorityHighest = $00000005;

// CEResyncEnum constants
type
  CEResyncEnum = TOleEnum;
const
  adResyncNone = $00000000;
  adResyncAutoIncrement = $00000001;
  adResyncConflicts = $00000002;
  adResyncUpdates = $00000004;
  adResyncInserts = $00000008;
  adResyncAll = $0000000F;

// ADCPROP_AUTORECALC_ENUM constants
type
  ADCPROP_AUTORECALC_ENUM = TOleEnum;
const
  adRecalcUpFront = $00000000;
  adRecalcAlways = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _Collection = interface;
  _CollectionDisp = dispinterface;
  _DynaCollection = interface;
  _DynaCollectionDisp = dispinterface;
  _ADO = interface;
  _ADODisp = dispinterface;
  Properties = interface;
  PropertiesDisp = dispinterface;
  Property_ = interface;
  Property_Disp = dispinterface;
  Error = interface;
  ErrorDisp = dispinterface;
  Errors = interface;
  ErrorsDisp = dispinterface;
  Command15 = interface;
  Command15Disp = dispinterface;
  Connection15 = interface;
  Connection15Disp = dispinterface;
  _Connection = interface;
  _ConnectionDisp = dispinterface;
  Recordset15 = interface;
  Recordset15Disp = dispinterface;
  Recordset20 = interface;
  Recordset20Disp = dispinterface;
  _Recordset = interface;
  _RecordsetDisp = dispinterface;
  Fields15 = interface;
  Fields15Disp = dispinterface;
  Fields = interface;
  FieldsDisp = dispinterface;
  Field = interface;
  FieldDisp = dispinterface;
  _Parameter = interface;
  _ParameterDisp = dispinterface;
  Parameters = interface;
  ParametersDisp = dispinterface;
  _Command = interface;
  _CommandDisp = dispinterface;
  ConnectionEventsVt = interface;
  RecordsetEventsVt = interface;
  ConnectionEvents = dispinterface;
  RecordsetEvents = dispinterface;
  ADOConnectionConstruction15 = interface;
  ADOConnectionConstruction = interface;
  ADOCommandConstruction = interface;
  ADORecordsetConstruction = interface;
  Field15 = interface;
  Field15Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Connection = _Connection;
  Command = _Command;
  Recordset = _Recordset;
  Parameter = _Parameter;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}

  SearchDirection = SearchDirectionEnum; 

// *********************************************************************//
// Interface: _Collection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000512-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Collection = interface(IDispatch)
    ['{00000512-0000-0010-8000-00AA006D2EA4}']
    function  Get_Count {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  _NewEnum {Flags(1), (1/0) CC:0, INV:1, DBG:6}: IUnknown; safecall;
    procedure Refresh {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  _CollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000512-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _CollectionDisp = dispinterface
    ['{00000512-0000-0010-8000-00AA006D2EA4}']
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _DynaCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000513-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollection = interface(_Collection)
    ['{00000513-0000-0010-8000-00AA006D2EA4}']
    procedure Append {Flags(1), (1/1) CC:0, INV:1, DBG:6}(const Object_: {VT_9:0}IDispatch); safecall;
    procedure Delete {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Index: {VT_12:0}OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  _DynaCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000513-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollectionDisp = dispinterface
    ['{00000513-0000-0010-8000-00AA006D2EA4}']
    procedure Append {Flags(2), (1/1) CC:0, INV:1, DBG:4}(const Object_: {VT_9:0}IDispatch); dispid 1610809344;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Index: {VT_12:0}OleVariant); dispid 1610809345;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _ADO
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000534-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _ADO = interface(IDispatch)
    ['{00000534-0000-0010-8000-00AA006D2EA4}']
    function  Get_Properties {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Properties; safecall;
    property Properties: Properties read Get_Properties;
  end;

// *********************************************************************//
// DispIntf:  _ADODisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000534-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _ADODisp = dispinterface
    ['{00000534-0000-0010-8000-00AA006D2EA4}']
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Properties
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000504-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Properties = interface(_Collection)
    ['{00000504-0000-0010-8000-00AA006D2EA4}']
    function  Get_Item {Flags(1), (2/1) CC:0, INV:2, DBG:6}(Index: {VT_12:0}OleVariant): Property_; safecall;
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:5}[Index: {VT_12:0}OleVariant]: Property_ read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  PropertiesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000504-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  PropertiesDisp = dispinterface
    ['{00000504-0000-0010-8000-00AA006D2EA4}']
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: Property_ readonly dispid 0; default;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Property_
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000503-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_ = interface(IDispatch)
    ['{00000503-0000-0010-8000-00AA006D2EA4}']
    function  Get_Value {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Value {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pval: {VT_12:0}OleVariant); safecall;
    function  Get_Name {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_Type_ {Flags(1), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum; safecall;
    function  Get_Attributes {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_Attributes {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plAttributes: {VT_3:0}Integer); safecall;
    property Value: OleVariant read Get_Value write Set_Value;
    property Name: WideString read Get_Name;
    property Type_: DataTypeEnum read Get_Type_;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
  end;

// *********************************************************************//
// DispIntf:  Property_Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000503-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_Disp = dispinterface
    ['{00000503-0000-0010-8000-00AA006D2EA4}']
    property Value {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 0;
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1610743810;
    property Type_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum readonly dispid 1610743811;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1610743812;
  end;

// *********************************************************************//
// Interface: Error
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000500-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Error = interface(IDispatch)
    ['{00000500-0000-0010-8000-00AA006D2EA4}']
    function  Get_Number {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_Source {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_Description {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_HelpFile {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_HelpContext {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_SQLState {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_NativeError {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    property Number: Integer read Get_Number;
    property Source: WideString read Get_Source;
    property Description: WideString read Get_Description;
    property HelpFile: WideString read Get_HelpFile;
    property HelpContext: Integer read Get_HelpContext;
    property SQLState: WideString read Get_SQLState;
    property NativeError: Integer read Get_NativeError;
  end;

// *********************************************************************//
// DispIntf:  ErrorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000500-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ErrorDisp = dispinterface
    ['{00000500-0000-0010-8000-00AA006D2EA4}']
    property Number {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    property Source {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1610743809;
    property Description {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 0;
    property HelpFile {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1610743811;
    property HelpContext {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743812;
    property SQLState {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1610743813;
    property NativeError {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743814;
  end;

// *********************************************************************//
// Interface: Errors
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000501-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Errors = interface(_Collection)
    ['{00000501-0000-0010-8000-00AA006D2EA4}']
    function  Get_Item {Flags(1), (2/1) CC:0, INV:2, DBG:6}(Index: {VT_12:0}OleVariant): Error; safecall;
    procedure Clear {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:5}[Index: {VT_12:0}OleVariant]: Error read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ErrorsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000501-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ErrorsDisp = dispinterface
    ['{00000501-0000-0010-8000-00AA006D2EA4}']
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: Error readonly dispid 0; default;
    procedure Clear {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610809345;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Command15
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000508-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Command15 = interface(_ADO)
    ['{00000508-0000-0010-8000-00AA006D2EA4}']
    function  Get_ActiveConnection {Flags(1), (1/0) CC:0, INV:2, DBG:6}: _Connection; safecall;
    procedure Set_ActiveConnection {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const ppvObject: {VT_29:1}_Connection); safecall;
    procedure _Set_ActiveConnection {Flags(1), (1/1) CC:0, INV:4, DBG:6}(ppvObject: {VT_12:0}OleVariant); safecall;
    function  Get_CommandText {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_CommandText {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstr: {VT_8:0}WideString); safecall;
    function  Get_CommandTimeout {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_CommandTimeout {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    function  Get_Prepared {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WordBool; safecall;
    procedure Set_Prepared {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pfPrepared: {VT_11:0}WordBool); safecall;
    function  Execute {Flags(1), (4/3) CC:0, INV:1, DBG:6}(out RecordsAffected: {VT_12:1}OleVariant; 
                                                           var Parameters: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; safecall;
    function  CreateParameter {Flags(1), (6/5) CC:0, INV:1, DBG:6}(const Name: {VT_8:0}WideString; 
                                                                   Type_: {VT_29:0}DataTypeEnum; 
                                                                   Direction: {VT_29:0}ParameterDirectionEnum; 
                                                                   Size: {VT_3:0}Integer; 
                                                                   Value: {VT_12:0}OleVariant): _Parameter; safecall;
    function  Get_Parameters {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Parameters; safecall;
    procedure Set_CommandType {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plCmdType: {VT_29:0}CommandTypeEnum); safecall;
    function  Get_CommandType {Flags(1), (1/0) CC:0, INV:2, DBG:6}: CommandTypeEnum; safecall;
    function  Get_Name {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Name {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrName: {VT_8:0}WideString); safecall;
    property CommandText: WideString read Get_CommandText write Set_CommandText;
    property CommandTimeout: Integer read Get_CommandTimeout write Set_CommandTimeout;
    property Prepared: WordBool read Get_Prepared write Set_Prepared;
    property Parameters: Parameters read Get_Parameters;
    property CommandType: CommandTypeEnum read Get_CommandType write Set_CommandType;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  Command15Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000508-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Command15Disp = dispinterface
    ['{00000508-0000-0010-8000-00AA006D2EA4}']
    function  ActiveConnection {Flags(2), (1/0) CC:0, INV:2, DBG:4}: _Connection; dispid 1610809344;
    property CommandText {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1610809347;
    property CommandTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1610809349;
    property Prepared {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool dispid 1610809351;
    function  Execute {Flags(2), (4/3) CC:0, INV:1, DBG:4}(out RecordsAffected: {VT_12:1}OleVariant; 
                                                           var Parameters: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; dispid 1610809353;
    function  CreateParameter {Flags(2), (6/5) CC:0, INV:1, DBG:4}(const Name: {VT_8:0}WideString; 
                                                                   Type_: {VT_29:0}DataTypeEnum; 
                                                                   Direction: {VT_29:0}ParameterDirectionEnum; 
                                                                   Size: {VT_3:0}Integer; 
                                                                   Value: {VT_12:0}OleVariant): _Parameter; dispid 1610809354;
    property Parameters {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Parameters readonly dispid 0;
    property CommandType {Flags(2), (1/0) CC:0, INV:4, DBG:6}: CommandTypeEnum dispid 1610809356;
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1610809358;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Connection15
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {00000515-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Connection15 = interface(_ADO)
    ['{00000515-0000-0010-8000-00AA006D2EA4}']
    function  Get_ConnectionString {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_ConnectionString {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstr: {VT_8:0}WideString); safecall;
    function  Get_CommandTimeout {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_CommandTimeout {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plTimeout: {VT_3:0}Integer); safecall;
    function  Get_ConnectionTimeout {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_ConnectionTimeout {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plTimeout: {VT_3:0}Integer); safecall;
    function  Get_Version {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Close {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    function  Execute {Flags(1), (4/3) CC:0, INV:1, DBG:6}(const CommandText: {VT_8:0}WideString; 
                                                           out RecordsAffected: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; safecall;
    function  BeginTrans {Flags(1), (1/0) CC:0, INV:1, DBG:6}: Integer; safecall;
    procedure CommitTrans {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure RollbackTrans {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure Open {Flags(1), (4/4) CC:0, INV:1, DBG:6}(const ConnectionString: {VT_8:0}WideString; 
                                                        const UserID: {VT_8:0}WideString; 
                                                        const Password: {VT_8:0}WideString; 
                                                        Options: {VT_3:0}Integer); safecall;
    function  Get_Errors {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Errors; safecall;
    function  Get_DefaultDatabase {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_DefaultDatabase {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstr: {VT_8:0}WideString); safecall;
    function  Get_IsolationLevel {Flags(1), (1/0) CC:0, INV:2, DBG:6}: IsolationLevelEnum; safecall;
    procedure Set_IsolationLevel {Flags(1), (1/1) CC:0, INV:4, DBG:6}(Level: {VT_29:0}IsolationLevelEnum); safecall;
    function  Get_Attributes {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_Attributes {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plAttr: {VT_3:0}Integer); safecall;
    function  Get_CursorLocation {Flags(1), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum; safecall;
    procedure Set_CursorLocation {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plCursorLoc: {VT_29:0}CursorLocationEnum); safecall;
    function  Get_Mode {Flags(1), (1/0) CC:0, INV:2, DBG:6}: ConnectModeEnum; safecall;
    procedure Set_Mode {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plMode: {VT_29:0}ConnectModeEnum); safecall;
    function  Get_Provider {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Provider {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstr: {VT_8:0}WideString); safecall;
    function  Get_State {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  OpenSchema {Flags(1), (4/3) CC:0, INV:1, DBG:6}(Schema: {VT_29:0}SchemaEnum; 
                                                              Restrictions: {VT_12:0}OleVariant; 
                                                              SchemaID: {VT_12:0}OleVariant): _Recordset; safecall;
    property ConnectionString: WideString read Get_ConnectionString write Set_ConnectionString;
    property CommandTimeout: Integer read Get_CommandTimeout write Set_CommandTimeout;
    property ConnectionTimeout: Integer read Get_ConnectionTimeout write Set_ConnectionTimeout;
    property Version: WideString read Get_Version;
    property Errors: Errors read Get_Errors;
    property DefaultDatabase: WideString read Get_DefaultDatabase write Set_DefaultDatabase;
    property IsolationLevel: IsolationLevelEnum read Get_IsolationLevel write Set_IsolationLevel;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property CursorLocation: CursorLocationEnum read Get_CursorLocation write Set_CursorLocation;
    property Mode: ConnectModeEnum read Get_Mode write Set_Mode;
    property Provider: WideString read Get_Provider write Set_Provider;
    property State: Integer read Get_State;
  end;

// *********************************************************************//
// DispIntf:  Connection15Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {00000515-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Connection15Disp = dispinterface
    ['{00000515-0000-0010-8000-00AA006D2EA4}']
    property ConnectionString {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 0;
    property CommandTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 2;
    property ConnectionTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 3;
    property Version {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 4;
    procedure Close {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 5;
    function  Execute {Flags(2), (4/3) CC:0, INV:1, DBG:4}(const CommandText: {VT_8:0}WideString; 
                                                           out RecordsAffected: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; dispid 6;
    function  BeginTrans {Flags(2), (1/0) CC:0, INV:1, DBG:4}: Integer; dispid 7;
    procedure CommitTrans {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 8;
    procedure RollbackTrans {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 9;
    procedure Open {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const ConnectionString: {VT_8:0}WideString; 
                                                        const UserID: {VT_8:0}WideString; 
                                                        const Password: {VT_8:0}WideString; 
                                                        Options: {VT_3:0}Integer); dispid 10;
    property Errors {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Errors readonly dispid 11;
    property DefaultDatabase {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 12;
    property IsolationLevel {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IsolationLevelEnum dispid 13;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 14;
    property CursorLocation {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum dispid 15;
    property Mode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: ConnectModeEnum dispid 16;
    property Provider {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 17;
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 18;
    function  OpenSchema {Flags(2), (4/3) CC:0, INV:1, DBG:4}(Schema: {VT_29:0}SchemaEnum; 
                                                              Restrictions: {VT_12:0}OleVariant; 
                                                              SchemaID: {VT_12:0}OleVariant): _Recordset; dispid 19;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: _Connection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {00000550-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Connection = interface(Connection15)
    ['{00000550-0000-0010-8000-00AA006D2EA4}']
    procedure Cancel {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
  end;

// *********************************************************************//
// DispIntf:  _ConnectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {00000550-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _ConnectionDisp = dispinterface
    ['{00000550-0000-0010-8000-00AA006D2EA4}']
    procedure Cancel {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 21;
    property ConnectionString {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 0;
    property CommandTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 2;
    property ConnectionTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 3;
    property Version {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 4;
    procedure Close {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 5;
    function  Execute {Flags(2), (4/3) CC:0, INV:1, DBG:4}(const CommandText: {VT_8:0}WideString; 
                                                           out RecordsAffected: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; dispid 6;
    function  BeginTrans {Flags(2), (1/0) CC:0, INV:1, DBG:4}: Integer; dispid 7;
    procedure CommitTrans {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 8;
    procedure RollbackTrans {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 9;
    procedure Open {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const ConnectionString: {VT_8:0}WideString; 
                                                        const UserID: {VT_8:0}WideString; 
                                                        const Password: {VT_8:0}WideString; 
                                                        Options: {VT_3:0}Integer); dispid 10;
    property Errors {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Errors readonly dispid 11;
    property DefaultDatabase {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 12;
    property IsolationLevel {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IsolationLevelEnum dispid 13;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 14;
    property CursorLocation {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum dispid 15;
    property Mode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: ConnectModeEnum dispid 16;
    property Provider {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 17;
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 18;
    function  OpenSchema {Flags(2), (4/3) CC:0, INV:1, DBG:4}(Schema: {VT_29:0}SchemaEnum; 
                                                              Restrictions: {VT_12:0}OleVariant; 
                                                              SchemaID: {VT_12:0}OleVariant): _Recordset; dispid 19;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Recordset15
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050E-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordset15 = interface(_ADO)
    ['{0000050E-0000-0010-8000-00AA006D2EA4}']
    function  Get_AbsolutePosition {Flags(1), (1/0) CC:0, INV:2, DBG:6}: PositionEnum; safecall;
    procedure Set_AbsolutePosition {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_29:0}PositionEnum); safecall;
    procedure Set_ActiveConnection {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const pvar: {VT_9:0}IDispatch); safecall;
    procedure _Set_ActiveConnection {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pvar: {VT_12:0}OleVariant); safecall;
    function  Get_ActiveConnection {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    function  Get_BOF {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WordBool; safecall;
    function  Get_Bookmark {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Bookmark {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pvBookmark: {VT_12:0}OleVariant); safecall;
    function  Get_CacheSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_CacheSize {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    function  Get_CursorType {Flags(1), (1/0) CC:0, INV:2, DBG:6}: CursorTypeEnum; safecall;
    procedure Set_CursorType {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plCursorType: {VT_29:0}CursorTypeEnum); safecall;
    function  Get_EOF {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WordBool; safecall;
    function  Get_Fields {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Fields; safecall;
    function  Get_LockType {Flags(1), (1/0) CC:0, INV:2, DBG:6}: LockTypeEnum; safecall;
    procedure Set_LockType {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plLockType: {VT_29:0}LockTypeEnum); safecall;
    function  Get_MaxRecords {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_MaxRecords {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plMaxRecords: {VT_3:0}Integer); safecall;
    function  Get_RecordCount {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_Source {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const pvSource: {VT_9:0}IDispatch); safecall;
    procedure _Set_Source {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pvSource: {VT_8:0}WideString); safecall;
    function  Get_Source {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure AddNew {Flags(1), (2/2) CC:0, INV:1, DBG:6}(FieldList: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); safecall;
    procedure CancelUpdate {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure Close {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure Delete {Flags(1), (1/1) CC:0, INV:1, DBG:6}(AffectRecords: {VT_29:0}AffectEnum); safecall;
    function  GetRows {Flags(1), (4/3) CC:0, INV:1, DBG:6}(Rows: {VT_3:0}Integer; 
                                                           Start: {VT_12:0}OleVariant; 
                                                           Fields: {VT_12:0}OleVariant): OleVariant; safecall;
    procedure Move {Flags(1), (2/2) CC:0, INV:1, DBG:6}(NumRecords: {VT_3:0}Integer; 
                                                        Start: {VT_12:0}OleVariant); safecall;
    procedure MoveNext {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure MovePrevious {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure MoveFirst {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure MoveLast {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure Open {Flags(1), (5/5) CC:0, INV:1, DBG:6}(Source: {VT_12:0}OleVariant; 
                                                        ActiveConnection: {VT_12:0}OleVariant; 
                                                        CursorType: {VT_29:0}CursorTypeEnum; 
                                                        LockType: {VT_29:0}LockTypeEnum; 
                                                        Options: {VT_3:0}Integer); safecall;
    procedure Requery {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Options: {VT_3:0}Integer); safecall;
    procedure _xResync {Flags(1), (1/1) CC:0, INV:1, DBG:6}(AffectRecords: {VT_29:0}AffectEnum); safecall;
    procedure Update {Flags(1), (2/2) CC:0, INV:1, DBG:6}(Fields: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); safecall;
    function  Get_AbsolutePage {Flags(1), (1/0) CC:0, INV:2, DBG:6}: PositionEnum; safecall;
    procedure Set_AbsolutePage {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_29:0}PositionEnum); safecall;
    function  Get_EditMode {Flags(1), (1/0) CC:0, INV:2, DBG:6}: EditModeEnum; safecall;
    function  Get_Filter {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Filter {Flags(1), (1/1) CC:0, INV:4, DBG:6}(Criteria: {VT_12:0}OleVariant); safecall;
    function  Get_PageCount {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_PageSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_PageSize {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    function  Get_Sort {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Sort {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const Criteria: {VT_8:0}WideString); safecall;
    function  Get_Status {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_State {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  _xClone {Flags(1), (1/0) CC:0, INV:1, DBG:6}: _Recordset; safecall;
    procedure UpdateBatch {Flags(1), (1/1) CC:0, INV:1, DBG:6}(AffectRecords: {VT_29:0}AffectEnum); safecall;
    procedure CancelBatch {Flags(1), (1/1) CC:0, INV:1, DBG:6}(AffectRecords: {VT_29:0}AffectEnum); safecall;
    function  Get_CursorLocation {Flags(1), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum; safecall;
    procedure Set_CursorLocation {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plCursorLoc: {VT_29:0}CursorLocationEnum); safecall;
    function  NextRecordset {Flags(1), (2/1) CC:0, INV:1, DBG:6}(out RecordsAffected: {VT_12:1}OleVariant): _Recordset; safecall;
    function  Supports {Flags(1), (2/1) CC:0, INV:1, DBG:6}(CursorOptions: {VT_29:0}CursorOptionEnum): WordBool; safecall;
    function  Get_Collect {Flags(1), (2/1) CC:0, INV:2, DBG:6}(Index: {VT_12:0}OleVariant): OleVariant; safecall;
    procedure Set_Collect {Flags(1), (2/2) CC:0, INV:4, DBG:6}(Index: {VT_12:0}OleVariant; 
                                                               pvar: {VT_12:0}OleVariant); safecall;
    function  Get_MarshalOptions {Flags(1), (1/0) CC:0, INV:2, DBG:6}: MarshalOptionsEnum; safecall;
    procedure Set_MarshalOptions {Flags(1), (1/1) CC:0, INV:4, DBG:6}(peMarshal: {VT_29:0}MarshalOptionsEnum); safecall;
    procedure Find {Flags(1), (4/4) CC:0, INV:1, DBG:6}(const Criteria: {VT_8:0}WideString; 
                                                        SkipRecords: {VT_3:0}Integer; 
                                                        SearchDirection: {VT_29:0}SearchDirectionEnum; 
                                                        Start: {VT_12:0}OleVariant); safecall;
    property AbsolutePosition: PositionEnum read Get_AbsolutePosition write Set_AbsolutePosition;
    property BOF: WordBool read Get_BOF;
    property Bookmark: OleVariant read Get_Bookmark write Set_Bookmark;
    property CacheSize: Integer read Get_CacheSize write Set_CacheSize;
    property CursorType: CursorTypeEnum read Get_CursorType write Set_CursorType;
    property EOF: WordBool read Get_EOF;
    property Fields: Fields read Get_Fields;
    property LockType: LockTypeEnum read Get_LockType write Set_LockType;
    property MaxRecords: Integer read Get_MaxRecords write Set_MaxRecords;
    property RecordCount: Integer read Get_RecordCount;
    property AbsolutePage: PositionEnum read Get_AbsolutePage write Set_AbsolutePage;
    property EditMode: EditModeEnum read Get_EditMode;
    property Filter: OleVariant read Get_Filter write Set_Filter;
    property PageCount: Integer read Get_PageCount;
    property PageSize: Integer read Get_PageSize write Set_PageSize;
    property Sort: WideString read Get_Sort write Set_Sort;
    property Status: Integer read Get_Status;
    property State: Integer read Get_State;
    property CursorLocation: CursorLocationEnum read Get_CursorLocation write Set_CursorLocation;
    property Collect {Flags(2), (2/1) CC:0, INV:2, DBG:5}[Index: {VT_12:0}OleVariant]: OleVariant read Get_Collect write Set_Collect;
    property MarshalOptions: MarshalOptionsEnum read Get_MarshalOptions write Set_MarshalOptions;
  end;

// *********************************************************************//
// DispIntf:  Recordset15Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050E-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordset15Disp = dispinterface
    ['{0000050E-0000-0010-8000-00AA006D2EA4}']
    property AbsolutePosition {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1000;
    function  ActiveConnection {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1001;
    property BOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1002;
    property Bookmark {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1003;
    property CacheSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1004;
    property CursorType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorTypeEnum dispid 1005;
    property EOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1006;
    property Fields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Fields readonly dispid 0;
    property LockType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: LockTypeEnum dispid 1008;
    property MaxRecords {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1009;
    property RecordCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1010;
    function  Source {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1011;
    procedure AddNew {Flags(2), (2/2) CC:0, INV:1, DBG:4}(FieldList: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1012;
    procedure CancelUpdate {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1013;
    procedure Close {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1014;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1015;
    function  GetRows {Flags(2), (4/3) CC:0, INV:1, DBG:4}(Rows: {VT_3:0}Integer; 
                                                           Start: {VT_12:0}OleVariant; 
                                                           Fields: {VT_12:0}OleVariant): OleVariant; dispid 1016;
    procedure Move {Flags(2), (2/2) CC:0, INV:1, DBG:4}(NumRecords: {VT_3:0}Integer; 
                                                        Start: {VT_12:0}OleVariant); dispid 1017;
    procedure MoveNext {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1018;
    procedure MovePrevious {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1019;
    procedure MoveFirst {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1020;
    procedure MoveLast {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1021;
    procedure Open {Flags(2), (5/5) CC:0, INV:1, DBG:4}(Source: {VT_12:0}OleVariant; 
                                                        ActiveConnection: {VT_12:0}OleVariant; 
                                                        CursorType: {VT_29:0}CursorTypeEnum; 
                                                        LockType: {VT_29:0}LockTypeEnum; 
                                                        Options: {VT_3:0}Integer); dispid 1022;
    procedure Requery {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Options: {VT_3:0}Integer); dispid 1023;
    procedure _xResync {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1610809378;
    procedure Update {Flags(2), (2/2) CC:0, INV:1, DBG:4}(Fields: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1025;
    property AbsolutePage {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1047;
    property EditMode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: EditModeEnum readonly dispid 1026;
    property Filter {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1030;
    property PageCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1050;
    property PageSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1048;
    property Sort {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1031;
    property Status {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1029;
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1054;
    function  _xClone {Flags(2), (1/0) CC:0, INV:1, DBG:4}: _Recordset; dispid 1610809392;
    procedure UpdateBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1035;
    procedure CancelBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1049;
    property CursorLocation {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum dispid 1051;
    function  NextRecordset {Flags(2), (2/1) CC:0, INV:1, DBG:4}(out RecordsAffected: {VT_12:1}OleVariant): _Recordset; dispid 1052;
    function  Supports {Flags(2), (2/1) CC:0, INV:1, DBG:4}(CursorOptions: {VT_29:0}CursorOptionEnum): WordBool; dispid 1036;
    property Collect {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: OleVariant dispid -8;
    property MarshalOptions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: MarshalOptionsEnum dispid 1053;
    procedure Find {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const Criteria: {VT_8:0}WideString; 
                                                        SkipRecords: {VT_3:0}Integer; 
                                                        SearchDirection: {VT_29:0}SearchDirectionEnum; 
                                                        Start: {VT_12:0}OleVariant); dispid 1058;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Recordset20
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054F-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordset20 = interface(Recordset15)
    ['{0000054F-0000-0010-8000-00AA006D2EA4}']
    procedure Cancel {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    function  Get_DataSource {Flags(1), (1/0) CC:0, INV:2, DBG:6}: IUnknown; safecall;
    procedure Set_DataSource {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const ppunkDataSource: {VT_13:0}IUnknown); safecall;
    procedure Save {Flags(1), (2/2) CC:0, INV:1, DBG:6}(const FileName: {VT_8:0}WideString; 
                                                        PersistFormat: {VT_29:0}PersistFormatEnum); safecall;
    function  Get_ActiveCommand {Flags(1), (1/0) CC:0, INV:2, DBG:6}: IDispatch; safecall;
    procedure Set_StayInSync {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pbStayInSync: {VT_11:0}WordBool); safecall;
    function  Get_StayInSync {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WordBool; safecall;
    function  GetString {Flags(1), (6/5) CC:0, INV:1, DBG:6}(StringFormat: {VT_29:0}StringFormatEnum; 
                                                             NumRows: {VT_3:0}Integer; 
                                                             const ColumnDelimeter: {VT_8:0}WideString; 
                                                             const RowDelimeter: {VT_8:0}WideString; 
                                                             const NullExpr: {VT_8:0}WideString): WideString; safecall;
    function  Get_DataMember {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_DataMember {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrDataMember: {VT_8:0}WideString); safecall;
    function  CompareBookmarks {Flags(1), (3/2) CC:0, INV:1, DBG:6}(Bookmark1: {VT_12:0}OleVariant; 
                                                                    Bookmark2: {VT_12:0}OleVariant): CompareEnum; safecall;
    function  Clone {Flags(1), (2/1) CC:0, INV:1, DBG:6}(LockType: {VT_29:0}LockTypeEnum): _Recordset; safecall;
    procedure Resync {Flags(1), (2/2) CC:0, INV:1, DBG:6}(AffectRecords: {VT_29:0}AffectEnum; 
                                                          ResyncValues: {VT_29:0}ResyncEnum); safecall;
    property DataSource: IUnknown read Get_DataSource write Set_DataSource;
    property ActiveCommand: IDispatch read Get_ActiveCommand;
    property StayInSync: WordBool read Get_StayInSync write Set_StayInSync;
    property DataMember: WideString read Get_DataMember write Set_DataMember;
  end;

// *********************************************************************//
// DispIntf:  Recordset20Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054F-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordset20Disp = dispinterface
    ['{0000054F-0000-0010-8000-00AA006D2EA4}']
    procedure Cancel {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1055;
    property DataSource {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IUnknown dispid 1056;
    procedure Save {Flags(2), (2/2) CC:0, INV:1, DBG:4}(const FileName: {VT_8:0}WideString; 
                                                        PersistFormat: {VT_29:0}PersistFormatEnum); dispid 1057;
    property ActiveCommand {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IDispatch readonly dispid 1061;
    property StayInSync {Flags(2), (1/0) CC:0, INV:4, DBG:6}: WordBool dispid 1063;
    function  GetString {Flags(2), (6/5) CC:0, INV:1, DBG:4}(StringFormat: {VT_29:0}StringFormatEnum; 
                                                             NumRows: {VT_3:0}Integer; 
                                                             const ColumnDelimeter: {VT_8:0}WideString; 
                                                             const RowDelimeter: {VT_8:0}WideString; 
                                                             const NullExpr: {VT_8:0}WideString): WideString; dispid 1062;
    property DataMember {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1064;
    function  CompareBookmarks {Flags(2), (3/2) CC:0, INV:1, DBG:4}(Bookmark1: {VT_12:0}OleVariant; 
                                                                    Bookmark2: {VT_12:0}OleVariant): CompareEnum; dispid 1065;
    function  Clone {Flags(2), (2/1) CC:0, INV:1, DBG:4}(LockType: {VT_29:0}LockTypeEnum): _Recordset; dispid 1034;
    procedure Resync {Flags(2), (2/2) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum; 
                                                          ResyncValues: {VT_29:0}ResyncEnum); dispid 1024;
    property AbsolutePosition {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1000;
    function  ActiveConnection {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1001;
    property BOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1002;
    property Bookmark {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1003;
    property CacheSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1004;
    property CursorType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorTypeEnum dispid 1005;
    property EOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1006;
    property Fields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Fields readonly dispid 0;
    property LockType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: LockTypeEnum dispid 1008;
    property MaxRecords {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1009;
    property RecordCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1010;
    function  Source {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1011;
    procedure AddNew {Flags(2), (2/2) CC:0, INV:1, DBG:4}(FieldList: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1012;
    procedure CancelUpdate {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1013;
    procedure Close {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1014;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1015;
    function  GetRows {Flags(2), (4/3) CC:0, INV:1, DBG:4}(Rows: {VT_3:0}Integer; 
                                                           Start: {VT_12:0}OleVariant; 
                                                           Fields: {VT_12:0}OleVariant): OleVariant; dispid 1016;
    procedure Move {Flags(2), (2/2) CC:0, INV:1, DBG:4}(NumRecords: {VT_3:0}Integer; 
                                                        Start: {VT_12:0}OleVariant); dispid 1017;
    procedure MoveNext {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1018;
    procedure MovePrevious {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1019;
    procedure MoveFirst {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1020;
    procedure MoveLast {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1021;
    procedure Open {Flags(2), (5/5) CC:0, INV:1, DBG:4}(Source: {VT_12:0}OleVariant; 
                                                        ActiveConnection: {VT_12:0}OleVariant; 
                                                        CursorType: {VT_29:0}CursorTypeEnum; 
                                                        LockType: {VT_29:0}LockTypeEnum; 
                                                        Options: {VT_3:0}Integer); dispid 1022;
    procedure Requery {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Options: {VT_3:0}Integer); dispid 1023;
    procedure _xResync {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1610809378;
    procedure Update {Flags(2), (2/2) CC:0, INV:1, DBG:4}(Fields: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1025;
    property AbsolutePage {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1047;
    property EditMode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: EditModeEnum readonly dispid 1026;
    property Filter {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1030;
    property PageCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1050;
    property PageSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1048;
    property Sort {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1031;
    property Status {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1029;
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1054;
    function  _xClone {Flags(2), (1/0) CC:0, INV:1, DBG:4}: _Recordset; dispid 1610809392;
    procedure UpdateBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1035;
    procedure CancelBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1049;
    property CursorLocation {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum dispid 1051;
    function  NextRecordset {Flags(2), (2/1) CC:0, INV:1, DBG:4}(out RecordsAffected: {VT_12:1}OleVariant): _Recordset; dispid 1052;
    function  Supports {Flags(2), (2/1) CC:0, INV:1, DBG:4}(CursorOptions: {VT_29:0}CursorOptionEnum): WordBool; dispid 1036;
    property Collect {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: OleVariant dispid -8;
    property MarshalOptions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: MarshalOptionsEnum dispid 1053;
    procedure Find {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const Criteria: {VT_8:0}WideString; 
                                                        SkipRecords: {VT_3:0}Integer; 
                                                        SearchDirection: {VT_29:0}SearchDirectionEnum; 
                                                        Start: {VT_12:0}OleVariant); dispid 1058;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: _Recordset
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000555-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Recordset = interface(Recordset20)
    ['{00000555-0000-0010-8000-00AA006D2EA4}']
    procedure Seek {Flags(1), (2/2) CC:0, INV:1, DBG:6}(KeyValues: {VT_12:0}OleVariant; 
                                                        SeekOption: {VT_29:0}SeekEnum); safecall;
    procedure Set_Index {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrIndex: {VT_8:0}WideString); safecall;
    function  Get_Index {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    property Index: WideString read Get_Index write Set_Index;
  end;

// *********************************************************************//
// DispIntf:  _RecordsetDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000555-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _RecordsetDisp = dispinterface
    ['{00000555-0000-0010-8000-00AA006D2EA4}']
    procedure Seek {Flags(2), (2/2) CC:0, INV:1, DBG:4}(KeyValues: {VT_12:0}OleVariant; 
                                                        SeekOption: {VT_29:0}SeekEnum); dispid 1066;
    property Index {Flags(2), (1/0) CC:0, INV:4, DBG:6}: WideString dispid 1067;
    procedure Cancel {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1055;
    property DataSource {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IUnknown dispid 1056;
    procedure Save {Flags(2), (2/2) CC:0, INV:1, DBG:4}(const FileName: {VT_8:0}WideString; 
                                                        PersistFormat: {VT_29:0}PersistFormatEnum); dispid 1057;
    property ActiveCommand {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IDispatch readonly dispid 1061;
    property StayInSync {Flags(2), (1/0) CC:0, INV:4, DBG:6}: WordBool dispid 1063;
    function  GetString {Flags(2), (6/5) CC:0, INV:1, DBG:4}(StringFormat: {VT_29:0}StringFormatEnum; 
                                                             NumRows: {VT_3:0}Integer; 
                                                             const ColumnDelimeter: {VT_8:0}WideString; 
                                                             const RowDelimeter: {VT_8:0}WideString; 
                                                             const NullExpr: {VT_8:0}WideString): WideString; dispid 1062;
    property DataMember {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1064;
    function  CompareBookmarks {Flags(2), (3/2) CC:0, INV:1, DBG:4}(Bookmark1: {VT_12:0}OleVariant; 
                                                                    Bookmark2: {VT_12:0}OleVariant): CompareEnum; dispid 1065;
    function  Clone {Flags(2), (2/1) CC:0, INV:1, DBG:4}(LockType: {VT_29:0}LockTypeEnum): _Recordset; dispid 1034;
    procedure Resync {Flags(2), (2/2) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum; 
                                                          ResyncValues: {VT_29:0}ResyncEnum); dispid 1024;
    property AbsolutePosition {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1000;
    function  ActiveConnection {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1001;
    property BOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1002;
    property Bookmark {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1003;
    property CacheSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1004;
    property CursorType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorTypeEnum dispid 1005;
    property EOF {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool readonly dispid 1006;
    property Fields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Fields readonly dispid 0;
    property LockType {Flags(2), (1/0) CC:0, INV:2, DBG:6}: LockTypeEnum dispid 1008;
    property MaxRecords {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1009;
    property RecordCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1010;
    function  Source {Flags(2), (1/0) CC:0, INV:8, DBG:4}: IDispatch; dispid 1011;
    procedure AddNew {Flags(2), (2/2) CC:0, INV:1, DBG:4}(FieldList: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1012;
    procedure CancelUpdate {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1013;
    procedure Close {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1014;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1015;
    function  GetRows {Flags(2), (4/3) CC:0, INV:1, DBG:4}(Rows: {VT_3:0}Integer; 
                                                           Start: {VT_12:0}OleVariant; 
                                                           Fields: {VT_12:0}OleVariant): OleVariant; dispid 1016;
    procedure Move {Flags(2), (2/2) CC:0, INV:1, DBG:4}(NumRecords: {VT_3:0}Integer; 
                                                        Start: {VT_12:0}OleVariant); dispid 1017;
    procedure MoveNext {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1018;
    procedure MovePrevious {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1019;
    procedure MoveFirst {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1020;
    procedure MoveLast {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1021;
    procedure Open {Flags(2), (5/5) CC:0, INV:1, DBG:4}(Source: {VT_12:0}OleVariant; 
                                                        ActiveConnection: {VT_12:0}OleVariant; 
                                                        CursorType: {VT_29:0}CursorTypeEnum; 
                                                        LockType: {VT_29:0}LockTypeEnum; 
                                                        Options: {VT_3:0}Integer); dispid 1022;
    procedure Requery {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Options: {VT_3:0}Integer); dispid 1023;
    procedure _xResync {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1610809378;
    procedure Update {Flags(2), (2/2) CC:0, INV:1, DBG:4}(Fields: {VT_12:0}OleVariant; 
                                                          Values: {VT_12:0}OleVariant); dispid 1025;
    property AbsolutePage {Flags(2), (1/0) CC:0, INV:2, DBG:6}: PositionEnum dispid 1047;
    property EditMode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: EditModeEnum readonly dispid 1026;
    property Filter {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 1030;
    property PageCount {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1050;
    property PageSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1048;
    property Sort {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1031;
    property Status {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1029;
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1054;
    function  _xClone {Flags(2), (1/0) CC:0, INV:1, DBG:4}: _Recordset; dispid 1610809392;
    procedure UpdateBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1035;
    procedure CancelBatch {Flags(2), (1/1) CC:0, INV:1, DBG:4}(AffectRecords: {VT_29:0}AffectEnum); dispid 1049;
    property CursorLocation {Flags(2), (1/0) CC:0, INV:2, DBG:6}: CursorLocationEnum dispid 1051;
    function  NextRecordset {Flags(2), (2/1) CC:0, INV:1, DBG:4}(out RecordsAffected: {VT_12:1}OleVariant): _Recordset; dispid 1052;
    function  Supports {Flags(2), (2/1) CC:0, INV:1, DBG:4}(CursorOptions: {VT_29:0}CursorOptionEnum): WordBool; dispid 1036;
    property Collect {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: OleVariant dispid -8;
    property MarshalOptions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: MarshalOptionsEnum dispid 1053;
    procedure Find {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const Criteria: {VT_8:0}WideString; 
                                                        SkipRecords: {VT_3:0}Integer; 
                                                        SearchDirection: {VT_29:0}SearchDirectionEnum; 
                                                        Start: {VT_12:0}OleVariant); dispid 1058;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Fields15
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000506-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Fields15 = interface(_Collection)
    ['{00000506-0000-0010-8000-00AA006D2EA4}']
    function  Get_Item {Flags(1), (2/1) CC:0, INV:2, DBG:6}(Index: {VT_12:0}OleVariant): Field; safecall;
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:5}[Index: {VT_12:0}OleVariant]: Field read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  Fields15Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000506-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Fields15Disp = dispinterface
    ['{00000506-0000-0010-8000-00AA006D2EA4}']
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: Field readonly dispid 0; default;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Fields
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Fields = interface(Fields15)
    ['{0000054D-0000-0010-8000-00AA006D2EA4}']
    procedure Append {Flags(1), (4/4) CC:0, INV:1, DBG:6}(const Name: {VT_8:0}WideString; 
                                                          Type_: {VT_29:0}DataTypeEnum; 
                                                          DefinedSize: {VT_3:0}Integer; 
                                                          Attrib: {VT_29:0}FieldAttributeEnum); safecall;
    procedure Delete {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Index: {VT_12:0}OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  FieldsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  FieldsDisp = dispinterface
    ['{0000054D-0000-0010-8000-00AA006D2EA4}']
    procedure Append {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const Name: {VT_8:0}WideString; 
                                                          Type_: {VT_29:0}DataTypeEnum; 
                                                          DefinedSize: {VT_3:0}Integer; 
                                                          Attrib: {VT_29:0}FieldAttributeEnum); dispid 1610874880;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Index: {VT_12:0}OleVariant); dispid 1610874881;
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: Field readonly dispid 0; default;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Field
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Field = interface(_ADO)
    ['{0000054C-0000-0010-8000-00AA006D2EA4}']
    function  Get_ActualSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_Attributes {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_DefinedSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_Name {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_Type_ {Flags(1), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum; safecall;
    function  Get_Value {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Value {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pvar: {VT_12:0}OleVariant); safecall;
    function  Get_Precision {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    function  Get_NumericScale {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    procedure AppendChunk {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Data: {VT_12:0}OleVariant); safecall;
    function  GetChunk {Flags(1), (2/1) CC:0, INV:1, DBG:6}(Length: {VT_3:0}Integer): OleVariant; safecall;
    function  Get_OriginalValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    function  Get_UnderlyingValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    function  Get_DataFormat {Flags(1), (1/0) CC:0, INV:2, DBG:6}: IUnknown; safecall;
    procedure Set_DataFormat {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const ppiDF: {VT_13:0}IUnknown); safecall;
    procedure Set_Precision {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pbPrecision: {VT_17:0}Byte); safecall;
    procedure Set_NumericScale {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pbNumericScale: {VT_17:0}Byte); safecall;
    procedure Set_Type_ {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pDataType: {VT_29:0}DataTypeEnum); safecall;
    procedure Set_DefinedSize {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    procedure Set_Attributes {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    property ActualSize: Integer read Get_ActualSize;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property DefinedSize: Integer read Get_DefinedSize write Set_DefinedSize;
    property Name: WideString read Get_Name;
    property Type_: DataTypeEnum read Get_Type_ write Set_Type_;
    property Value: OleVariant read Get_Value write Set_Value;
    property Precision: Byte read Get_Precision write Set_Precision;
    property NumericScale: Byte read Get_NumericScale write Set_NumericScale;
    property OriginalValue: OleVariant read Get_OriginalValue;
    property UnderlyingValue: OleVariant read Get_UnderlyingValue;
    property DataFormat: IUnknown read Get_DataFormat write Set_DataFormat;
  end;

// *********************************************************************//
// DispIntf:  FieldDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  FieldDisp = dispinterface
    ['{0000054C-0000-0010-8000-00AA006D2EA4}']
    property ActualSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1109;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1036;
    property DefinedSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1103;
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1100;
    property Type_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum dispid 1102;
    property Value {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 0;
    property Precision {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Byte dispid 1610809351;
    property NumericScale {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Byte dispid 1610809352;
    procedure AppendChunk {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Data: {VT_12:0}OleVariant); dispid 1107;
    function  GetChunk {Flags(2), (2/1) CC:0, INV:1, DBG:4}(Length: {VT_3:0}Integer): OleVariant; dispid 1108;
    property OriginalValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant readonly dispid 1104;
    property UnderlyingValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant readonly dispid 1105;
    property DataFormat {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IUnknown dispid 1610809357;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: _Parameter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Parameter = interface(_ADO)
    ['{0000050C-0000-0010-8000-00AA006D2EA4}']
    function  Get_Name {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Name {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstr: {VT_8:0}WideString); safecall;
    function  Get_Value {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Value {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pvar: {VT_12:0}OleVariant); safecall;
    function  Get_Type_ {Flags(1), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum; safecall;
    procedure Set_Type_ {Flags(1), (1/1) CC:0, INV:4, DBG:6}(psDataType: {VT_29:0}DataTypeEnum); safecall;
    procedure Set_Direction {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plParmDirection: {VT_29:0}ParameterDirectionEnum); safecall;
    function  Get_Direction {Flags(1), (1/0) CC:0, INV:2, DBG:6}: ParameterDirectionEnum; safecall;
    procedure Set_Precision {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pbPrecision: {VT_17:0}Byte); safecall;
    function  Get_Precision {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    procedure Set_NumericScale {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pbScale: {VT_17:0}Byte); safecall;
    function  Get_NumericScale {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    procedure Set_Size {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pl: {VT_3:0}Integer); safecall;
    function  Get_Size {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure AppendChunk {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Val: {VT_12:0}OleVariant); safecall;
    function  Get_Attributes {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_Attributes {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plParmAttribs: {VT_3:0}Integer); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Value: OleVariant read Get_Value write Set_Value;
    property Type_: DataTypeEnum read Get_Type_ write Set_Type_;
    property Direction: ParameterDirectionEnum read Get_Direction write Set_Direction;
    property Precision: Byte read Get_Precision write Set_Precision;
    property NumericScale: Byte read Get_NumericScale write Set_NumericScale;
    property Size: Integer read Get_Size write Set_Size;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
  end;

// *********************************************************************//
// DispIntf:  _ParameterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _ParameterDisp = dispinterface
    ['{0000050C-0000-0010-8000-00AA006D2EA4}']
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1610809344;
    property Value {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 0;
    property Type_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum dispid 1610809348;
    property Direction {Flags(2), (1/0) CC:0, INV:4, DBG:6}: ParameterDirectionEnum dispid 1610809350;
    property Precision {Flags(2), (1/0) CC:0, INV:4, DBG:6}: Byte dispid 1610809352;
    property NumericScale {Flags(2), (1/0) CC:0, INV:4, DBG:6}: Byte dispid 1610809354;
    property Size {Flags(2), (1/0) CC:0, INV:4, DBG:6}: Integer dispid 1610809356;
    procedure AppendChunk {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Val: {VT_12:0}OleVariant); dispid 1610809358;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1610809359;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: Parameters
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Parameters = interface(_DynaCollection)
    ['{0000050D-0000-0010-8000-00AA006D2EA4}']
    function  Get_Item {Flags(1), (2/1) CC:0, INV:2, DBG:6}(Index: {VT_12:0}OleVariant): _Parameter; safecall;
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:5}[Index: {VT_12:0}OleVariant]: _Parameter read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ParametersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000050D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ParametersDisp = dispinterface
    ['{0000050D-0000-0010-8000-00AA006D2EA4}']
    property Item {Flags(2), (2/1) CC:0, INV:2, DBG:6}[Index: {VT_12:0}OleVariant]: _Parameter readonly dispid 0; default;
    procedure Append {Flags(2), (1/1) CC:0, INV:1, DBG:4}(const Object_: {VT_9:0}IDispatch); dispid 1610809344;
    procedure Delete {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Index: {VT_12:0}OleVariant); dispid 1610809345;
    property Count {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610743808;
    function  _NewEnum {Flags(2), (1/0) CC:0, INV:1, DBG:4}: IUnknown; dispid -4;
    procedure Refresh {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Command
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054E-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Command = interface(Command15)
    ['{0000054E-0000-0010-8000-00AA006D2EA4}']
    function  Get_State {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Cancel {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    property State: Integer read Get_State;
  end;

// *********************************************************************//
// DispIntf:  _CommandDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000054E-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _CommandDisp = dispinterface
    ['{0000054E-0000-0010-8000-00AA006D2EA4}']
    property State {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1610874880;
    procedure Cancel {Flags(2), (0/0) CC:0, INV:1, DBG:4}; dispid 1610874881;
    function  ActiveConnection {Flags(2), (1/0) CC:0, INV:2, DBG:4}: _Connection; dispid 1610809344;
    property CommandText {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1610809347;
    property CommandTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 1610809349;
    property Prepared {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool dispid 1610809351;
    function  Execute {Flags(2), (4/3) CC:0, INV:1, DBG:4}(out RecordsAffected: {VT_12:1}OleVariant; 
                                                           var Parameters: {VT_12:1}OleVariant; 
                                                           Options: {VT_3:0}Integer): _Recordset; dispid 1610809353;
    function  CreateParameter {Flags(2), (6/5) CC:0, INV:1, DBG:4}(const Name: {VT_8:0}WideString; 
                                                                   Type_: {VT_29:0}DataTypeEnum; 
                                                                   Direction: {VT_29:0}ParameterDirectionEnum; 
                                                                   Size: {VT_3:0}Integer; 
                                                                   Value: {VT_12:0}OleVariant): _Parameter; dispid 1610809354;
    property Parameters {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Parameters readonly dispid 0;
    property CommandType {Flags(2), (1/0) CC:0, INV:4, DBG:6}: CommandTypeEnum dispid 1610809356;
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1610809358;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// Interface: ConnectionEventsVt
// Flags:     (16) Hidden
// GUID:      {00000402-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ConnectionEventsVt = interface(IUnknown)
    ['{00000402-0000-0010-8000-00AA006D2EA4}']
    function  InfoMessage {Flags(1), (3/3) CC:4, INV:1, DBG:6}(const pError: {VT_29:1}Error; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  BeginTransComplete {Flags(1), (4/4) CC:4, INV:1, DBG:6}(TransactionLevel: {VT_3:0}Integer; 
                                                                      const pError: {VT_29:1}Error; 
                                                                      var adStatus: {VT_29:1}EventStatusEnum; 
                                                                      const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  CommitTransComplete {Flags(1), (3/3) CC:4, INV:1, DBG:6}(const pError: {VT_29:1}Error; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  RollbackTransComplete {Flags(1), (3/3) CC:4, INV:1, DBG:6}(const pError: {VT_29:1}Error; 
                                                                         var adStatus: {VT_29:1}EventStatusEnum; 
                                                                         const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  WillExecute {Flags(1), (8/8) CC:4, INV:1, DBG:6}(var Source: {VT_8:1}WideString; 
                                                               var CursorType: {VT_29:1}CursorTypeEnum; 
                                                               var LockType: {VT_29:1}LockTypeEnum; 
                                                               var Options: {VT_3:1}Integer; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pCommand: {VT_29:1}_Command; 
                                                               const pRecordset: {VT_29:1}_Recordset; 
                                                               const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  ExecuteComplete {Flags(1), (6/6) CC:4, INV:1, DBG:6}(RecordsAffected: {VT_3:0}Integer; 
                                                                   const pError: {VT_29:1}Error; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pCommand: {VT_29:1}_Command; 
                                                                   const pRecordset: {VT_29:1}_Recordset; 
                                                                   const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  WillConnect {Flags(1), (6/6) CC:4, INV:1, DBG:6}(var ConnectionString: {VT_8:1}WideString; 
                                                               var UserID: {VT_8:1}WideString; 
                                                               var Password: {VT_8:1}WideString; 
                                                               var Options: {VT_3:1}Integer; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  ConnectComplete {Flags(1), (3/3) CC:4, INV:1, DBG:6}(const pError: {VT_29:1}Error; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pConnection: {VT_29:1}_Connection): HResult; stdcall;
    function  Disconnect1 {Flags(1), (2/2) CC:4, INV:1, DBG:6}(var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: RecordsetEventsVt
// Flags:     (16) Hidden
// GUID:      {00000403-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  RecordsetEventsVt = interface(IUnknown)
    ['{00000403-0000-0010-8000-00AA006D2EA4}']
    function  WillChangeField {Flags(1), (4/4) CC:4, INV:1, DBG:6}(cFields: {VT_3:0}Integer; 
                                                                   Fields: {VT_12:0}OleVariant; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  FieldChangeComplete {Flags(1), (5/5) CC:4, INV:1, DBG:6}(cFields: {VT_3:0}Integer; 
                                                                       Fields: {VT_12:0}OleVariant; 
                                                                       const pError: {VT_29:1}Error; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  WillChangeRecord {Flags(1), (4/4) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                                    cRecords: {VT_3:0}Integer; 
                                                                    var adStatus: {VT_29:1}EventStatusEnum; 
                                                                    const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  RecordChangeComplete {Flags(1), (5/5) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                                        cRecords: {VT_3:0}Integer; 
                                                                        const pError: {VT_29:1}Error; 
                                                                        var adStatus: {VT_29:1}EventStatusEnum; 
                                                                        const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  WillChangeRecordset {Flags(1), (3/3) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  RecordsetChangeComplete {Flags(1), (4/4) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                                           const pError: {VT_29:1}Error; 
                                                                           var adStatus: {VT_29:1}EventStatusEnum; 
                                                                           const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  WillMove {Flags(1), (3/3) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                            var adStatus: {VT_29:1}EventStatusEnum; 
                                                            const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  MoveComplete {Flags(1), (4/4) CC:4, INV:1, DBG:6}(adReason: {VT_29:0}EventReasonEnum; 
                                                                const pError: {VT_29:1}Error; 
                                                                var adStatus: {VT_29:1}EventStatusEnum; 
                                                                const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  EndOfRecordset {Flags(1), (3/3) CC:4, INV:1, DBG:6}(var fMoreData: {VT_11:1}WordBool; 
                                                                  var adStatus: {VT_29:1}EventStatusEnum; 
                                                                  const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  FetchProgress {Flags(1), (4/4) CC:4, INV:1, DBG:6}(Progress: {VT_3:0}Integer; 
                                                                 MaxProgress: {VT_3:0}Integer; 
                                                                 var adStatus: {VT_29:1}EventStatusEnum; 
                                                                 const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
    function  FetchComplete {Flags(1), (3/3) CC:4, INV:1, DBG:6}(const pError: {VT_29:1}Error; 
                                                                 var adStatus: {VT_29:1}EventStatusEnum; 
                                                                 const pRecordset: {VT_29:1}_Recordset): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ConnectionEvents
// Flags:     (4096) Dispatchable
// GUID:      {00000400-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ConnectionEvents = dispinterface
    ['{00000400-0000-0010-8000-00AA006D2EA4}']
    procedure InfoMessage {Flags(2), (3/3) CC:0, INV:1, DBG:4}(const pError: {VT_29:1}Error; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection); dispid 0;
    procedure BeginTransComplete {Flags(2), (4/4) CC:0, INV:1, DBG:4}(TransactionLevel: {VT_3:0}Integer; 
                                                                      const pError: {VT_29:1}Error; 
                                                                      var adStatus: {VT_29:1}EventStatusEnum; 
                                                                      const pConnection: {VT_29:1}_Connection); dispid 1;
    procedure CommitTransComplete {Flags(2), (3/3) CC:0, INV:1, DBG:4}(const pError: {VT_29:1}Error; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pConnection: {VT_29:1}_Connection); dispid 3;
    procedure RollbackTransComplete {Flags(2), (3/3) CC:0, INV:1, DBG:4}(const pError: {VT_29:1}Error; 
                                                                         var adStatus: {VT_29:1}EventStatusEnum; 
                                                                         const pConnection: {VT_29:1}_Connection); dispid 2;
    procedure WillExecute {Flags(2), (8/8) CC:0, INV:1, DBG:4}(var Source: {VT_8:1}WideString; 
                                                               var CursorType: {VT_29:1}CursorTypeEnum; 
                                                               var LockType: {VT_29:1}LockTypeEnum; 
                                                               var Options: {VT_3:1}Integer; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pCommand: {VT_29:1}_Command; 
                                                               const pRecordset: {VT_29:1}_Recordset; 
                                                               const pConnection: {VT_29:1}_Connection); dispid 4;
    procedure ExecuteComplete {Flags(2), (6/6) CC:0, INV:1, DBG:4}(RecordsAffected: {VT_3:0}Integer; 
                                                                   const pError: {VT_29:1}Error; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pCommand: {VT_29:1}_Command; 
                                                                   const pRecordset: {VT_29:1}_Recordset; 
                                                                   const pConnection: {VT_29:1}_Connection); dispid 5;
    procedure WillConnect {Flags(2), (6/6) CC:0, INV:1, DBG:4}(var ConnectionString: {VT_8:1}WideString; 
                                                               var UserID: {VT_8:1}WideString; 
                                                               var Password: {VT_8:1}WideString; 
                                                               var Options: {VT_3:1}Integer; 
                                                               var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection); dispid 6;
    procedure ConnectComplete {Flags(2), (3/3) CC:0, INV:1, DBG:4}(const pError: {VT_29:1}Error; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pConnection: {VT_29:1}_Connection); dispid 7;
    procedure Disconnect1 {Flags(2), (2/2) CC:0, INV:1, DBG:4}(var adStatus: {VT_29:1}EventStatusEnum; 
                                                               const pConnection: {VT_29:1}_Connection); dispid 8;
  end;

// *********************************************************************//
// DispIntf:  RecordsetEvents
// Flags:     (4096) Dispatchable
// GUID:      {00000266-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  RecordsetEvents = dispinterface
    ['{00000266-0000-0010-8000-00AA006D2EA4}']
    procedure WillChangeField {Flags(2), (4/4) CC:0, INV:1, DBG:4}(cFields: {VT_3:0}Integer; 
                                                                   Fields: {VT_12:0}OleVariant; 
                                                                   var adStatus: {VT_29:1}EventStatusEnum; 
                                                                   const pRecordset: {VT_29:1}_Recordset); dispid 9;
    procedure FieldChangeComplete {Flags(2), (5/5) CC:0, INV:1, DBG:4}(cFields: {VT_3:0}Integer; 
                                                                       Fields: {VT_12:0}OleVariant; 
                                                                       const pError: {VT_29:1}Error; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pRecordset: {VT_29:1}_Recordset); dispid 10;
    procedure WillChangeRecord {Flags(2), (4/4) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                                    cRecords: {VT_3:0}Integer; 
                                                                    var adStatus: {VT_29:1}EventStatusEnum; 
                                                                    const pRecordset: {VT_29:1}_Recordset); dispid 11;
    procedure RecordChangeComplete {Flags(2), (5/5) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                                        cRecords: {VT_3:0}Integer; 
                                                                        const pError: {VT_29:1}Error; 
                                                                        var adStatus: {VT_29:1}EventStatusEnum; 
                                                                        const pRecordset: {VT_29:1}_Recordset); dispid 12;
    procedure WillChangeRecordset {Flags(2), (3/3) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                                       var adStatus: {VT_29:1}EventStatusEnum; 
                                                                       const pRecordset: {VT_29:1}_Recordset); dispid 13;
    procedure RecordsetChangeComplete {Flags(2), (4/4) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                                           const pError: {VT_29:1}Error; 
                                                                           var adStatus: {VT_29:1}EventStatusEnum; 
                                                                           const pRecordset: {VT_29:1}_Recordset); dispid 14;
    procedure WillMove {Flags(2), (3/3) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                            var adStatus: {VT_29:1}EventStatusEnum; 
                                                            const pRecordset: {VT_29:1}_Recordset); dispid 15;
    procedure MoveComplete {Flags(2), (4/4) CC:0, INV:1, DBG:4}(adReason: {VT_29:0}EventReasonEnum; 
                                                                const pError: {VT_29:1}Error; 
                                                                var adStatus: {VT_29:1}EventStatusEnum; 
                                                                const pRecordset: {VT_29:1}_Recordset); dispid 16;
    procedure EndOfRecordset {Flags(2), (3/3) CC:0, INV:1, DBG:4}(var fMoreData: {VT_11:1}WordBool; 
                                                                  var adStatus: {VT_29:1}EventStatusEnum; 
                                                                  const pRecordset: {VT_29:1}_Recordset); dispid 17;
    procedure FetchProgress {Flags(2), (4/4) CC:0, INV:1, DBG:4}(Progress: {VT_3:0}Integer; 
                                                                 MaxProgress: {VT_3:0}Integer; 
                                                                 var adStatus: {VT_29:1}EventStatusEnum; 
                                                                 const pRecordset: {VT_29:1}_Recordset); dispid 18;
    procedure FetchComplete {Flags(2), (3/3) CC:0, INV:1, DBG:4}(const pError: {VT_29:1}Error; 
                                                                 var adStatus: {VT_29:1}EventStatusEnum; 
                                                                 const pRecordset: {VT_29:1}_Recordset); dispid 19;
  end;

// *********************************************************************//
// Interface: ADOConnectionConstruction15
// Flags:     (512) Restricted
// GUID:      {00000516-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ADOConnectionConstruction15 = interface(IUnknown)
    ['{00000516-0000-0010-8000-00AA006D2EA4}']
    function  Get_DSO {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out ppDSO: {VT_13:1}IUnknown): HResult; stdcall;
    function  Get_Session {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out ppSession: {VT_13:1}IUnknown): HResult; stdcall;
    function  WrapDSOandSession {Flags(1), (2/2) CC:4, INV:1, DBG:6}(const pDSO: {VT_13:0}IUnknown; 
                                                                     const pSession: {VT_13:0}IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ADOConnectionConstruction
// Flags:     (512) Restricted
// GUID:      {00000551-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ADOConnectionConstruction = interface(ADOConnectionConstruction15)
    ['{00000551-0000-0010-8000-00AA006D2EA4}']
  end;

// *********************************************************************//
// Interface: ADOCommandConstruction
// Flags:     (512) Restricted
// GUID:      {00000517-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ADOCommandConstruction = interface(IUnknown)
    ['{00000517-0000-0010-8000-00AA006D2EA4}']
    function  Get_OLEDBCommand {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out ppOLEDBCommand: {VT_13:1}IUnknown): HResult; stdcall;
    function  Set_OLEDBCommand {Flags(1), (1/1) CC:4, INV:4, DBG:6}(const ppOLEDBCommand: {VT_13:0}IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ADORecordsetConstruction
// Flags:     (4608) Restricted Dispatchable
// GUID:      {00000283-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ADORecordsetConstruction = interface(IDispatch)
    ['{00000283-0000-0010-8000-00AA006D2EA4}']
    function  Get_Rowset {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out ppRowset: {VT_13:1}IUnknown): HResult; stdcall;
    function  Set_Rowset {Flags(1), (1/1) CC:4, INV:4, DBG:6}(const ppRowset: {VT_13:0}IUnknown): HResult; stdcall;
    function  Get_Chapter {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out plChapter: {VT_3:1}Integer): HResult; stdcall;
    function  Set_Chapter {Flags(1), (1/1) CC:4, INV:4, DBG:6}(plChapter: {VT_3:0}Integer): HResult; stdcall;
    function  Get_RowPosition {Flags(1), (1/1) CC:4, INV:2, DBG:6}(out ppRowPos: {VT_13:1}IUnknown): HResult; stdcall;
    function  Set_RowPosition {Flags(1), (1/1) CC:4, INV:4, DBG:6}(const ppRowPos: {VT_13:0}IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: Field15
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000505-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Field15 = interface(_ADO)
    ['{00000505-0000-0010-8000-00AA006D2EA4}']
    function  Get_ActualSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_Attributes {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_DefinedSize {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_Name {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    function  Get_Type_ {Flags(1), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum; safecall;
    function  Get_Value {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    procedure Set_Value {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pvar: {VT_12:0}OleVariant); safecall;
    function  Get_Precision {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    function  Get_NumericScale {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Byte; safecall;
    procedure AppendChunk {Flags(1), (1/1) CC:0, INV:1, DBG:6}(Data: {VT_12:0}OleVariant); safecall;
    function  GetChunk {Flags(1), (2/1) CC:0, INV:1, DBG:6}(Length: {VT_3:0}Integer): OleVariant; safecall;
    function  Get_OriginalValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    function  Get_UnderlyingValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: OleVariant; safecall;
    property ActualSize: Integer read Get_ActualSize;
    property Attributes: Integer read Get_Attributes;
    property DefinedSize: Integer read Get_DefinedSize;
    property Name: WideString read Get_Name;
    property Type_: DataTypeEnum read Get_Type_;
    property Value: OleVariant read Get_Value write Set_Value;
    property Precision: Byte read Get_Precision;
    property NumericScale: Byte read Get_NumericScale;
    property OriginalValue: OleVariant read Get_OriginalValue;
    property UnderlyingValue: OleVariant read Get_UnderlyingValue;
  end;

// *********************************************************************//
// DispIntf:  Field15Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000505-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Field15Disp = dispinterface
    ['{00000505-0000-0010-8000-00AA006D2EA4}']
    property ActualSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1109;
    property Attributes {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1036;
    property DefinedSize {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid 1103;
    property Name {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString readonly dispid 1100;
    property Type_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: DataTypeEnum readonly dispid 1102;
    property Value {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant dispid 0;
    property Precision {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Byte readonly dispid 1610809351;
    property NumericScale {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Byte readonly dispid 1610809352;
    procedure AppendChunk {Flags(2), (1/1) CC:0, INV:1, DBG:4}(Data: {VT_12:0}OleVariant); dispid 1107;
    function  GetChunk {Flags(2), (2/1) CC:0, INV:1, DBG:4}(Length: {VT_3:0}Integer): OleVariant; dispid 1108;
    property OriginalValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant readonly dispid 1104;
    property UnderlyingValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: OleVariant readonly dispid 1105;
    property Properties {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Properties readonly dispid 500;
  end;

// *********************************************************************//
// The Class CoConnection provides a Create and CreateRemote method to          
// create instances of the default interface _Connection exposed by              
// the CoClass Connection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnection = class
    class function Create: _Connection;
    class function CreateRemote(const MachineName: string): _Connection;
  end;

// *********************************************************************//
// The Class CoCommand provides a Create and CreateRemote method to          
// create instances of the default interface _Command exposed by              
// the CoClass Command. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCommand = class
    class function Create: _Command;
    class function CreateRemote(const MachineName: string): _Command;
  end;

// *********************************************************************//
// The Class CoRecordset provides a Create and CreateRemote method to          
// create instances of the default interface _Recordset exposed by              
// the CoClass Recordset. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRecordset = class
    class function Create: _Recordset;
    class function CreateRemote(const MachineName: string): _Recordset;
  end;

// *********************************************************************//
// The Class CoParameter provides a Create and CreateRemote method to          
// create instances of the default interface _Parameter exposed by              
// the CoClass Parameter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameter = class
    class function Create: _Parameter;
    class function CreateRemote(const MachineName: string): _Parameter;
  end;

implementation

uses ComObj;

class function CoConnection.Create: _Connection;
begin
  Result := CreateComObject(CLASS_Connection) as _Connection;
end;

class function CoConnection.CreateRemote(const MachineName: string): _Connection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Connection) as _Connection;
end;

class function CoCommand.Create: _Command;
begin
  Result := CreateComObject(CLASS_Command) as _Command;
end;

class function CoCommand.CreateRemote(const MachineName: string): _Command;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Command) as _Command;
end;

class function CoRecordset.Create: _Recordset;
begin
  Result := CreateComObject(CLASS_Recordset) as _Recordset;
end;

class function CoRecordset.CreateRemote(const MachineName: string): _Recordset;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Recordset) as _Recordset;
end;

class function CoParameter.Create: _Parameter;
begin
  Result := CreateComObject(CLASS_Parameter) as _Parameter;
end;

class function CoParameter.CreateRemote(const MachineName: string): _Parameter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Parameter) as _Parameter;
end;

end.
