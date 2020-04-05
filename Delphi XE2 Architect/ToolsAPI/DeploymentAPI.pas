{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit DeploymentAPI;

interface

uses System.SysUtils, System.Classes, ToolsAPI, PlatformAPI, System.Generics.Collections, System.Types;

type

  // IDE Service
  IOTADeploymentService = interface
    ['{658EBC6E-E96F-45FA-934B-505D158852C7}']
    procedure DeployManagerProject(const Project: IOTAProject);
  end;

  // Project module interface.  Projects that support deployment may implement.

//  IDeployAssemblyReferences = interface;
  
  IDeployableProject = interface
  ['{F775F090-1966-4C65-B778-DF4CD2F7F9E6}']
//    function GetHasAssemblyReferences: Boolean;
//    function GetAssemblyReferences: IDeployAssemblyReferences;
//    property HasAssemblyReferences: Boolean read GetHasAssemblyReferences;
//    property AssemblyReferences: IDeployAssemblyReferences read GetAssemblyReferences;
  end;

//  IDeployAssemblyReferences = interface
//  ['{68E7820D-5249-4E86-9024-E97A6BDC4176}']
//    procedure Refresh;
//    function GetCount: Integer;
//    function GetFileName(I: Integer): string;
//    property Count: Integer read GetCount;
//    property FileNames[I: Integer]: string read GetFileName;
//  end;

const
  feDeployProj = '.deployproj';
  dcFile = 'File';
  dcProjectOutput = 'ProjectOutput';
  dcDebugSymbols = 'DebugSymbols';
  dcAdditionalDebugSymbols = 'AdditionalDebugSymbols';
  dcDependencyPackage = 'DependencyPackage';
  dcDependencyPackageResource = 'DependencyPackageResource';
  dcDependencyPackageDebugSymbols = 'DependencyPackageDebugSymbols';
  dcDependencyModule = 'DependencyModule';
  dcDependencyFramework = 'DependencyFramework';
  dcProjectOSXResource = 'ProjectOSXResource';
  dcProjectOSXInfoPList = 'ProjectOSXInfoPList';
  dcProjectEntitlements = 'ProjectOSXEntitlements';

type
  { Make sure the ordinal values of TDeployOperation match the corresponding
    "put" arguments for the remote agent. Make sure doNotSpecified is always
    the highest ordinal value }
  TDeployOperation = (doCopyOnly, doSetExecBit, doUnArchive, doRun, doUnused, doExecuteScript, doNotSpecified);
  TDeploymentItemAction = (daAdded, daChanged, daRemoved, daReconciled);

  IProjectDeploymentItem = interface
  ['{9D9FC05C-49BD-4FD8-8425-833D16FA55E3}']
    { Condition is an MSBuild condition statement which will be evaluated in the
      context of the deployment's project when the Deploy target is run, so that
      delivery can be conditionalized based on project settings.
      e.g., "'$(DynamicRTL)'=='true'" on the file libcgrtl.dylib will cause it
      to be deployed only when the project has linked with the dynamic rtl. Look
      in $(TP)\app\design\*Strs.pas for a list of most project setting property names }
    function GetCondition: string;
    function GetLocalCommands(const PlatformName: string): TList<string>;
    function GetOperation(const PlatformName: string): TDeployOperation;
    function GetPlatforms: TArray<string>;
    function GetRemoteCommands(const PlatformName: string): TList<string>;
    function GetRemoteDir(const PlatformName: string): string;
    function GetRequired: Boolean;
    procedure RemovePlatform(const PlatformName: string);
    procedure SetCondition(const Value: string);
    procedure SetOperation(const PlatformName: string; const Value: TDeployOperation);
    procedure SetRemoteDir(const PlatformName, Value: string);
    procedure SetRequired(Value: Boolean);

    property Condition: string read GetCondition write SetCondition;
    property LocalCommands[const PlatformName: string]: TList<string> read GetLocalCommands;
    property Operation[const PlatformName: string]: TDeployOperation read GetOperation write SetOperation;
    property RemoteCommands[const PlatformName: string]: TList<string> read GetRemoteCommands;
    property RemoteDir[const PlatformName: string]: string read GetRemoteDir write SetRemoteDir;
    property Required: Boolean read GetRequired write SetRequired;
    property Platforms: TArray<string> read GetPlatforms;
  end;

  IProjectDeploymentFile = interface(IProjectDeploymentItem)
    ['{184728B4-5713-4D50-A042-CD027A7802BA}']
    function GetConfiguration: string;
    function GetDeploymentClass: string;
    function GetEnabled(const PlatformName: string): Boolean;
    function GetLocalName: string;
    function GetRemoteName(const PlatformName: string): string;
    procedure SetConfiguration(const Value: string);
    procedure SetDeploymentClass(const Value: string);
    procedure SetEnabled(const PlatformName: string; const Value: Boolean);
    procedure SetLocalName(const Value: string);
    procedure SetRemoteName(const PlatformName, Value: string);

    property Configuration: string read GetConfiguration write SetConfiguration;
    property DeploymentClass: string read GetDeploymentClass write SetDeploymentClass;
    property Enabled[const PlatformName: string]: Boolean read GetEnabled write SetEnabled;
    property LocalName: string read GetLocalName write SetLocalName;
    property RemoteName[const PlatformName: string]: string read GetRemoteName write SetRemoteName;
  end;

  IProjectDeploymentClass = interface(IProjectDeploymentItem)
    ['{C1FA0FD1-A0B0-4465-BE24-6C37C75B6D28}']
    function GetClassId: string;
    function GetDescription: string;
    procedure SetClassId(const Value: string);
    procedure SetDescription(const Value: string);
    function ValidFor(const Filename, PlatformName: string): Boolean;

    property ClassId: string read GetClassId write SetClassId;
    property Description: string read GetDescription write SetDescription;
  end;

  IProjectDeploymentNotifier = interface
    ['{E3BBD079-75B6-46F6-AC61-AD4B3B793111}']
    procedure Destroyed;
    procedure ItemChanged(const Item: IProjectDeploymentItem; Action: TDeploymentItemAction);
    procedure Loaded(const ClassId: string);
  end;

  TDeploymentFileArray = array of IProjectDeploymentFile;
  TDeploymentClassArray = array of IProjectDeploymentClass;

const
  cAllPlatforms = 'All';

type
  TReconcileResult = (rrSuccess, rrNotUpToDate, rrCompileRequired, rrFailed, rrNotSupported);

  IProjectDeployment = interface
    ['{FF8F9951-52D1-40F1-8A34-A72969BEE0D6}']
    { Register for notifications when project deployment data changes }
    function AddNotifier(const Notifier: IProjectDeploymentNotifier): Integer;
    procedure AddClass(const AClass: IProjectDeploymentClass);
    procedure AddFile(const AFile: IProjectDeploymentFile);
    procedure Clear;
    function CreateClass(const ClassId: string): IProjectDeploymentClass;
    function CreateFile(const LocalName: string): IProjectDeploymentFile;
    function FindFiles(const LocalName, Configuration, PlatformName, ClassName: string): TDeploymentFileArray;
    function GetClasses: TDictionary<string, IProjectDeploymentClass>.TValueCollection;
    function GetClass(const ClassId: string): IProjectDeploymentClass;
    { Returns which classes, if any, can be used with a particular file based on it's extension }
    function GetDefaultClasses(const Filename, PlatformName: string): TDeploymentClassArray;
    function GetFile(const LocalName: string): IProjectDeploymentFile;
    function GetFiles: TDictionary<string, IProjectDeploymentFile>.TValueCollection;
    { Return an array of all items with ClassId }
    function GetFilesOfClass(const ClassId: string): TDeploymentFileArray;
    { The project binary output's remote filename, relative to the remote project directory }
    function GetProjectOutputFile(const PlatformName: string = ''; const ConfigurationName: string = ''): string;
    { The root directory on the remote machine, relative to the agent's "scratch" directory,
      or a fully qualified path }
    function GetRemoteProjectDir(PlatformName: string): string;
    { Does the deployment have any data in it, or has ever been reconciled }
    function IsEmpty: Boolean;
    { Updates deployment to reflect current project state }
    function Reconcile(Configuration: string = ''; PlatformName: string = ''): TReconcileResult;
    { Remove a deployment class }
    procedure RemoveClass(const ClassId: string);
    { Remove all deployment data associated with a local file }
    procedure RemoveFile(const LocalName: string);
    { Remove all files with ClassId }
    procedure RemoveFilesOfClass(const ClassId: string);
    { Remove previously registered notifier }
    procedure RemoveNotifier(const NotifierIndex: Integer);
    { Remove all deployment data, reset to default }
    procedure Reset;
    { Write MSBuild script used by the Deployment MSBuild target }
    procedure SaveToMSBuild;
    { Set remote project root directory }
    procedure SetRemoteProjectDir(PlatformName: string; const Value: string);

    property Classes: TDictionary<string, IProjectDeploymentClass>.TValueCollection read GetClasses;
    property Files: TDictionary<string, IProjectDeploymentFile>.TValueCollection read GetFiles;
    property RemoteProjectDir[PlatformName: string]: string read GetRemoteProjectDir
      write SetRemoteProjectDir;
  end;

{ Helper functions to resolve unspecified IProjectDeploymentFile fields through the
  underlying Deployment Class }
function GetDeploymentRemoteDir(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): string;
function GetDeploymentOperation(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): TDeployOperation;
function GetDeploymentClass(const AFile: IProjectDeploymentFile): string;
function GetDeploymentRequired(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): Boolean;

implementation

function GetDeploymentRemoteDir(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): string;
begin
  Result := AFile.RemoteDir[PlatformName];
  if (Result = '') and (AFile.DeploymentClass <> '')
  and (Deployment.GetClass(AFile.DeploymentClass) <> nil) then
  begin
    Result := Deployment.GetClass(AFile.DeploymentClass).RemoteDir[PlatformName];
    if Result <> '' then
      Result := IncludeTrailingPathDelimiter(Result);
  end;
end;

function GetDeploymentOperation(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): TDeployOperation;
begin
  Result := AFile.Operation[PlatformName];
  if (Result = doNotSpecified) and (AFile.DeploymentClass <> '')
  and (Deployment.GetClass(AFile.DeploymentClass) <> nil) then
    Result := Deployment.GetClass(AFile.DeploymentClass).Operation[PlatformName];
  if Result = doNotSpecified then
    Result := doCopyOnly;
end;

function GetDeploymentClass(const AFile: IProjectDeploymentFile): string;
begin
  Result := AFile.DeploymentClass;
  if Result = '' then
    Result := dcFile;
end;

function GetDeploymentRequired(const AFile: IProjectDeploymentFile;
  const PlatformName: string; const Deployment: IProjectDeployment): Boolean;
begin
  Result := AFile.Required;
  if not Result and (AFile.DeploymentClass <> '')
  and (Deployment.GetClass(AFile.DeploymentClass) <> nil) then
    Result := Deployment.GetClass(AFile.DeploymentClass).Required;
end;

end.
