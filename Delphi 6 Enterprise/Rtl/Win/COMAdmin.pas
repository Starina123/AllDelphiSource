{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

{ ***************************************************** }
{       COM+ Administration Interface Unit              }
{ ***************************************************** }

unit COMAdmin;

interface

uses Windows, ActiveX;

const
  COMAdminMajorVersion = 1;
  COMAdminMinorVersion = 0;

  LIBID_COMAdmin: TGUID = '{F618C513-DFB8-11D1-A2CF-00805FC79235}';

  IID_ICOMAdminCatalog: TGUID = '{DD662187-DFC2-11D1-A2CF-00805FC79235}';
  CLASS_COMAdminCatalog: TGUID = '{F618C514-DFB8-11D1-A2CF-00805FC79235}';
  IID_ICatalogObject: TGUID = '{6EB22871-8A19-11D0-81B6-00A0C9231C29}';
  CLASS_COMAdminCatalogObject: TGUID = '{F618C515-DFB8-11D1-A2CF-00805FC79235}';
  IID_ICatalogCollection: TGUID = '{6EB22872-8A19-11D0-81B6-00A0C9231C29}';
  CLASS_COMAdminCatalogCollection: TGUID = '{F618C516-DFB8-11D1-A2CF-00805FC79235}';

type
  COMAdminApplicationInstallOptions = TOleEnum;
const
  COMAdminInstallNoUsers = $00000000;
  COMAdminInstallUsers = $00000001;
  COMAdminInstallForceOverwriteOfFiles = $00000002;

type
  COMAdminApplicationExportOptions = TOleEnum;
const
  COMAdminExportNoUsers = $00000000;
  COMAdminExportUsers = $00000001;
  COMAdminExportApplicationProxy = $00000002;
  COMAdminExportForceOverwriteOfFiles = $00000004;

type
  COMAdminThreadingModels = TOleEnum;
const
  COMAdminThreadingModelApartment = $00000000;
  COMAdminThreadingModelFree = $00000001;
  COMAdminThreadingModelMain = $00000002;
  COMAdminThreadingModelBoth = $00000003;
  COMAdminThreadingModelNeutral = $00000004;
  COMAdminThreadingModelNotSpecified = $00000005;

type
  COMAdminTransactionOptions = TOleEnum;
const
  COMAdminTransactionIgnored = $00000000;
  COMAdminTransactionNone = $00000001;
  COMAdminTransactionSupported = $00000002;
  COMAdminTransactionRequired = $00000003;
  COMAdminTransactionRequiresNew = $00000004;

type
  COMAdminSynchronizationOptions = TOleEnum;
const
  COMAdminSynchronizationIgnored = $00000000;
  COMAdminSynchronizationNone = $00000001;
  COMAdminSynchronizationSupported = $00000002;
  COMAdminSynchronizationRequired = $00000003;
  COMAdminSynchronizationRequiresNew = $00000004;

type
  COMAdminActivationOptions = TOleEnum;
const
  COMAdminActivationInproc = $00000000;
  COMAdminActivationLocal = $00000001;

type
  COMAdminAccessChecksLevelOptions = TOleEnum;
const
  COMAdminAccessChecksApplicationLevel = $00000000;
  COMAdminAccessChecksApplicationComponentLevel = $00000001;

type
  COMAdminAuthenticationLevelOptions = TOleEnum;
const
  COMAdminAuthenticationDefault = $00000000;
  COMAdminAuthenticationNone = $00000001;
  COMAdminAuthenticationConnect = $00000002;
  COMAdminAuthenticationCall = $00000003;
  COMAdminAuthenticationPacket = $00000004;
  COMAdminAuthenticationIntegrity = $00000005;
  COMAdminAuthenticationPrivacy = $00000006;

type
  COMAdminImpersonationLevelOptions = TOleEnum;
const
  COMAdminImpersonationAnonymous = $00000001;
  COMAdminImpersonationIdentify = $00000002;
  COMAdminImpersonationImpersonate = $00000003;
  COMAdminImpersonationDelegate = $00000004;

type
  COMAdminAuthenticationCapabilitiesOptions = TOleEnum;
const
  COMAdminAuthenticationCapabilitiesNone = $00000000;
  COMAdminAuthenticationCapabilitiesStaticCloaking = $00000020;
  COMAdminAuthenticationCapabilitiesDynamicCloaking = $00000040;
  COMAdminAuthenticationCapabilitiesSecureReference = $00000002;

type
  COMAdminOS = TOleEnum;
const
  COMAdminOSWindows3_1 = $00000001;
  COMAdminOSWindows9x = $00000002;
  COMAdminOSWindowsNT = $00000003;
  COMAdminOSWindowsNTEnterprise = $00000004;

type
  COMAdminServiceOptions = TOleEnum;
const
  COMAdminServiceLoadBalanceRouter = $00000001;
  COMAdminServiceIMDB = $00000002;

type
  COMAdminServiceStatusOptions = TOleEnum;
const
  COMAdminServiceStopped = $00000000;
  COMAdminServiceStartPending = $00000001;
  COMAdminServiceStopPending = $00000002;
  COMAdminServiceRunning = $00000003;
  COMAdminServiceContinuePending = $00000004;
  COMAdminServicePausePending = $00000005;
  COMAdminServicePaused = $00000006;
  COMAdminServiceUnknownState = $00000007;

type
  COMAdminFileFlags = TOleEnum;
const
  COMAdminFileFlagLoadable = $00000001;
  COMAdminFileFlagCOM = $00000002;
  COMAdminFileFlagContainsPS = $00000004;
  COMAdminFileFlagContainsComp = $00000008;
  COMAdminFileFlagContainsTLB = $00000010;
  COMAdminFileFlagSelfReg = $00000020;
  COMAdminFileFlagSelfUnReg = $00000040;
  COMAdminFileFlagUnloadableDLL = $00000080;
  COMAdminFileFlagDoesNotExist = $00000100;
  COMAdminFileFlagAlreadyInstalled = $00000200;
  COMAdminFileFlagBadTLB = $00000400;
  COMAdminFileFlagGetClassObjFailed = $00000800;
  COMAdminFileFlagClassNotAvailable = $00001000;
  COMAdminFileFlagRegistrar = $00002000;
  COMAdminFileFlagNoRegistrar = $00004000;
  COMAdminFileFlagDLLRegsvrFailed = $00008000;
  COMAdminFileFlagRegTLBFailed = $00010000;
  COMAdminFileFlagRegistrarFailed = $00020000;
  COMAdminFileFlagError = $00040000;

type
  COMAdminComponentFlags = TOleEnum;
const
  COMAdminCompFlagTypeInfoFound = $00000001;
  COMAdminCompFlagCOMPlusPropertiesFound = $00000002;
  COMAdminCompFlagProxyFound = $00000004;
  COMAdminCompFlagInterfacesFound = $00000008;
  COMAdminCompFlagAlreadyInstalled = $00000010;
  COMAdminCompFlagNotInApplication = $00000020;

type
  COMAdminErrorCodes = TOleEnum;
const
  COMAdminErrObjectErrors = $80110401;
  COMAdminErrObjectInvalid = $80110402;
  COMAdminErrKeyMissing = $80110403;
  COMAdminErrAlreadyInstalled = $80110404;
  COMAdminErrAppFileWriteFail = $80110407;
  COMAdminErrAppFileReadFail = $80110408;
  COMAdminErrAppFileVersion = $80110409;
  COMAdminErrBadPath = $8011040A;
  COMAdminErrApplicationExists = $8011040B;
  COMAdminErrRoleExists = $8011040C;
  COMAdminErrCantCopyFile = $8011040D;
  COMAdminErrNoUser = $8011040F;
  COMAdminErrInvalidUserids = $80110410;
  COMAdminErrNoRegistryCLSID = $80110411;
  COMAdminErrBadRegistryProgID = $80110412;
  COMAdminErrAuthenticationLevel = $80110413;
  COMAdminErrUserPasswdNotValid = $80110414;
  COMAdminErrCLSIDOrIIDMismatch = $80110418;
  COMAdminErrRemoteInterface = $80110419;
  COMAdminErrDllRegisterServer = $8011041A;
  COMAdminErrNoServerShare = $8011041B;
  COMAdminErrDllLoadFailed = $8011041D;
  COMAdminErrBadRegistryLibID = $8011041E;
  COMAdminErrAppDirNotFound = $8011041F;
  COMAdminErrRegistrarFailed = $80110423;
  COMAdminErrCompFileDoesNotExist = $80110424;
  COMAdminErrCompFileLoadDLLFail = $80110425;
  COMAdminErrCompFileGetClassObj = $80110426;
  COMAdminErrCompFileClassNotAvail = $80110427;
  COMAdminErrCompFileBadTLB = $80110428;
  COMAdminErrCompFileNotInstallable = $80110429;
  COMAdminErrNotChangeable = $8011042A;
  COMAdminErrNotDeletable = $8011042B;
  COMAdminErrSession = $8011042C;
  COMAdminErrCompMoveLocked = $8011042D;
  COMAdminErrCompMoveBadDest = $8011042E;
  COMAdminErrRegisterTLB = $80110430;
  COMAdminErrSystemApp = $80110433;
  COMAdminErrCompFileNoRegistrar = $80110434;
  COMAdminErrCoReqCompInstalled = $80110435;
  COMAdminErrServiceNotInstalled = $80110436;
  COMAdminErrPropertySaveFailed = $80110437;
  COMAdminErrObjectExists = $80110438;
  COMAdminErrRegFileCorrupt = $8011043B;
  COMAdminErrPropertyOverflow = $8011043C;
  COMAdminErrNotInRegistry = $8011043E;
  COMAdminErrObjectNotPoolable = $8011043F;
  COMAdminErrApplidMatchesClsid = $80110446;
  COMAdminErrRoleDoesNotExist = $80110447;
  COMAdminErrStartAppNeedsComponents = $80110448;
  COMAdminErrRequiresDifferentPlatform = $80110449;
  COMAdminErrQueuingServiceNotAvailable = $80110602;
  COMAdminErrObjectParentMissing = $80110808;
  COMAdminErrObjectDoesNotExist = $80110809;
  COMAdminErrCanNotExportAppProxy = $8011044A;
  COMAdminErrCanNotStartApp = $8011044B;
  COMAdminErrCanNotExportSystemApp = $8011044C;
  COMAdminErrCanNotSubscribeToComponent = $8011044D;

type

  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary                    
  // *********************************************************************//
  ICOMAdminCatalog = interface;
  ICOMAdminCatalogDisp = dispinterface;
  ICatalogObject = interface;
  ICatalogObjectDisp = dispinterface;
  ICatalogCollection = interface;
  ICatalogCollectionDisp = dispinterface;

  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library                       
  // *********************************************************************//
  COMAdminCatalog = ICOMAdminCatalog;
  COMAdminCatalogObject = ICatalogObject;
  COMAdminCatalogCollection = ICatalogCollection;


  // *********************************************************************//
  // Declaration of structures, unions and aliases.                         
  // *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}

  ICOMAdminCatalog = interface(IDispatch)
    ['{DD662187-DFC2-11D1-A2CF-00805FC79235}']
    function  GetCollection(const bstrCollName: WideString): IDispatch; safecall;
    function  Connect(const bstrConnectString: WideString): IDispatch; safecall;
    function  Get_MajorVersion: Integer; safecall;
    function  Get_MinorVersion: Integer; safecall;
    function  GetCollectionByQuery(const bstrCollName: WideString; var aQuery: PSafeArray): IDispatch; safecall;
    procedure ImportComponent(const bstrApplIdOrName: WideString; 
                              const bstrCLSIDOrProgId: WideString); safecall;
    procedure InstallComponent(const bstrApplIdOrName: WideString; const bstrDLL: WideString; 
                               const bstrTLB: WideString; const bstrPSDLL: WideString); safecall;
    procedure ShutdownApplication(const bstrApplIdOrName: WideString); safecall;
    procedure ExportApplication(const bstrApplIdOrName: WideString; 
                                const bstrApplicationFile: WideString; lOptions: Integer); safecall;
    procedure InstallApplication(const bstrApplicationFile: WideString; 
                                 const bstrDestinationDirectory: WideString; lOptions: Integer; 
                                 const bstrUserId: WideString; const bstrPassword: WideString; 
                                 const bstrRSN: WideString); safecall;
    procedure StopRouter; safecall;
    procedure RefreshRouter; safecall;
    procedure StartRouter; safecall;
    procedure Reserved1; safecall;
    procedure Reserved2; safecall;
    procedure InstallMultipleComponents(const bstrApplIdOrName: WideString; 
                                        var varFileNames: PSafeArray; var varCLSIDS: PSafeArray); safecall;
    procedure GetMultipleComponentsInfo(const bstrApplIdOrName: WideString; 
                                        var varFileNames: PSafeArray; out varCLSIDS: PSafeArray; 
                                        out varClassNames: PSafeArray; 
                                        out varFileFlags: PSafeArray; 
                                        out varComponentFlags: PSafeArray); safecall;
    procedure RefreshComponents; safecall;
    procedure BackupREGDB(const bstrBackupFilePath: WideString); safecall;
    procedure RestoreREGDB(const bstrBackupFilePath: WideString); safecall;
    procedure QueryApplicationFile(const bstrApplicationFile: WideString; 
                                   out bstrApplicationName: WideString; 
                                   out bstrApplicationDescription: WideString; 
                                   out bHasUsers: WordBool; out bIsProxy: WordBool; 
                                   out varFileNames: PSafeArray); safecall;
    procedure StartApplication(const bstrApplIdOrName: WideString); safecall;
    function  ServiceCheck(lService: Integer): Integer; safecall;
    procedure InstallMultipleEventClasses(const bstrApplIdOrName: WideString; 
                                          var varFileNames: PSafeArray; var varCLSIDS: PSafeArray); safecall;
    procedure InstallEventClass(const bstrApplIdOrName: WideString; const bstrDLL: WideString; 
                                const bstrTLB: WideString; const bstrPSDLL: WideString); safecall;
    procedure GetEventClassesForIID(const bstrIID: WideString; out varCLSIDS: PSafeArray; 
                                    out varProgIDs: PSafeArray; out varDescriptions: PSafeArray); safecall;
    property MajorVersion: Integer read Get_MajorVersion;
    property MinorVersion: Integer read Get_MinorVersion;
  end;

  ICOMAdminCatalogDisp = dispinterface
    ['{DD662187-DFC2-11D1-A2CF-00805FC79235}']
    function  GetCollection(const bstrCollName: WideString): IDispatch; dispid 1;
    function  Connect(const bstrConnectString: WideString): IDispatch; dispid 2;
    property MajorVersion: Integer readonly dispid 3;
    property MinorVersion: Integer readonly dispid 4;
    function  GetCollectionByQuery(const bstrCollName: WideString; 
                                   var aQuery: {??PSafeArray} OleVariant): IDispatch; dispid 5;
    procedure ImportComponent(const bstrApplIdOrName: WideString; 
                              const bstrCLSIDOrProgId: WideString); dispid 6;
    procedure InstallComponent(const bstrApplIdOrName: WideString; const bstrDLL: WideString; 
                               const bstrTLB: WideString; const bstrPSDLL: WideString); dispid 7;
    procedure ShutdownApplication(const bstrApplIdOrName: WideString); dispid 8;
    procedure ExportApplication(const bstrApplIdOrName: WideString; 
                                const bstrApplicationFile: WideString; lOptions: Integer); dispid 9;
    procedure InstallApplication(const bstrApplicationFile: WideString; 
                                 const bstrDestinationDirectory: WideString; lOptions: Integer; 
                                 const bstrUserId: WideString; const bstrPassword: WideString; 
                                 const bstrRSN: WideString); dispid 10;
    procedure StopRouter; dispid 11;
    procedure RefreshRouter; dispid 12;
    procedure StartRouter; dispid 13;
    procedure Reserved1; dispid 14;
    procedure Reserved2; dispid 15;
    procedure InstallMultipleComponents(const bstrApplIdOrName: WideString; 
                                        var varFileNames: {??PSafeArray} OleVariant; 
                                        var varCLSIDS: {??PSafeArray} OleVariant); dispid 16;
    procedure GetMultipleComponentsInfo(const bstrApplIdOrName: WideString; 
                                        var varFileNames: {??PSafeArray} OleVariant; 
                                        out varCLSIDS: {??PSafeArray} OleVariant; 
                                        out varClassNames: {??PSafeArray} OleVariant; 
                                        out varFileFlags: {??PSafeArray} OleVariant; 
                                        out varComponentFlags: {??PSafeArray} OleVariant); dispid 17;
    procedure RefreshComponents; dispid 18;
    procedure BackupREGDB(const bstrBackupFilePath: WideString); dispid 19;
    procedure RestoreREGDB(const bstrBackupFilePath: WideString); dispid 20;
    procedure QueryApplicationFile(const bstrApplicationFile: WideString; 
                                   out bstrApplicationName: WideString; 
                                   out bstrApplicationDescription: WideString; 
                                   out bHasUsers: WordBool; out bIsProxy: WordBool; 
                                   out varFileNames: {??PSafeArray} OleVariant); dispid 21;
    procedure StartApplication(const bstrApplIdOrName: WideString); dispid 22;
    function  ServiceCheck(lService: Integer): Integer; dispid 23;
    procedure InstallMultipleEventClasses(const bstrApplIdOrName: WideString; 
                                          var varFileNames: {??PSafeArray} OleVariant; 
                                          var varCLSIDS: {??PSafeArray} OleVariant); dispid 24;
    procedure InstallEventClass(const bstrApplIdOrName: WideString; const bstrDLL: WideString; 
                                const bstrTLB: WideString; const bstrPSDLL: WideString); dispid 25;
    procedure GetEventClassesForIID(const bstrIID: WideString; 
                                    out varCLSIDS: {??PSafeArray} OleVariant; 
                                    out varProgIDs: {??PSafeArray} OleVariant; 
                                    out varDescriptions: {??PSafeArray} OleVariant); dispid 26;
  end;

  ICatalogObject = interface(IDispatch)
    ['{6EB22871-8A19-11D0-81B6-00A0C9231C29}']
    function  Get_Value(const bstrPropName: WideString): OleVariant; safecall;
    procedure Set_Value(const bstrPropName: WideString; retval: OleVariant); safecall;
    function  Get_Key: OleVariant; safecall;
    function  Get_Name: OleVariant; safecall;
    function  IsPropertyReadOnly(const bstrPropName: WideString): WordBool; safecall;
    function  Get_Valid: WordBool; safecall;
    function  IsPropertyWriteOnly(const bstrPropName: WideString): WordBool; safecall;
    property Value[const bstrPropName: WideString]: OleVariant read Get_Value write Set_Value;
    property Key: OleVariant read Get_Key;
    property Name: OleVariant read Get_Name;
    property Valid: WordBool read Get_Valid;
  end;

  ICatalogObjectDisp = dispinterface
    ['{6EB22871-8A19-11D0-81B6-00A0C9231C29}']
    property Value[const bstrPropName: WideString]: OleVariant dispid 1;
    property Key: OleVariant readonly dispid 2;
    property Name: OleVariant readonly dispid 3;
    function  IsPropertyReadOnly(const bstrPropName: WideString): WordBool; dispid 4;
    property Valid: WordBool readonly dispid 5;
    function  IsPropertyWriteOnly(const bstrPropName: WideString): WordBool; dispid 6;
  end;

  ICatalogCollection = interface(IDispatch)
    ['{6EB22872-8A19-11D0-81B6-00A0C9231C29}']
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Item(lIndex: Integer): IDispatch; safecall;
    function  Get_Count: Integer; safecall;
    procedure Remove(lIndex: Integer); safecall;
    function  Add: IDispatch; safecall;
    procedure Populate; safecall;
    function  SaveChanges: Integer; safecall;
    function  GetCollection(const bstrCollName: WideString; varObjectKey: OleVariant): IDispatch; safecall;
    function  Get_Name: OleVariant; safecall;
    function  Get_AddEnabled: WordBool; safecall;
    function  Get_RemoveEnabled: WordBool; safecall;
    function  GetUtilInterface: IDispatch; safecall;
    function  Get_DataStoreMajorVersion: Integer; safecall;
    function  Get_DataStoreMinorVersion: Integer; safecall;
    procedure PopulateByKey(aKeys: PSafeArray); safecall;
    procedure PopulateByQuery(const bstrQueryString: WideString; lQueryType: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[lIndex: Integer]: IDispatch read Get_Item;
    property Count: Integer read Get_Count;
    property Name: OleVariant read Get_Name;
    property AddEnabled: WordBool read Get_AddEnabled;
    property RemoveEnabled: WordBool read Get_RemoveEnabled;
    property DataStoreMajorVersion: Integer read Get_DataStoreMajorVersion;
    property DataStoreMinorVersion: Integer read Get_DataStoreMinorVersion;
  end;

  ICatalogCollectionDisp = dispinterface
    ['{6EB22872-8A19-11D0-81B6-00A0C9231C29}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[lIndex: Integer]: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 1610743810;
    procedure Remove(lIndex: Integer); dispid 1610743811;
    function  Add: IDispatch; dispid 1610743812;
    procedure Populate; dispid 2;
    function  SaveChanges: Integer; dispid 3;
    function  GetCollection(const bstrCollName: WideString; varObjectKey: OleVariant): IDispatch; dispid 4;
    property Name: OleVariant readonly dispid 6;
    property AddEnabled: WordBool readonly dispid 7;
    property RemoveEnabled: WordBool readonly dispid 8;
    function  GetUtilInterface: IDispatch; dispid 9;
    property DataStoreMajorVersion: Integer readonly dispid 10;
    property DataStoreMinorVersion: Integer readonly dispid 11;
    procedure PopulateByKey(aKeys: {??PSafeArray} OleVariant); dispid 12;
    procedure PopulateByQuery(const bstrQueryString: WideString; lQueryType: Integer); dispid 13;
  end;

implementation

end.

