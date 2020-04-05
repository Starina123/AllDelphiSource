{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit PlatformAPI;

interface

uses System.SysUtils, System.Classes, System.Types, ToolsAPI;

(*$HPPEMIT 'DEFINE_GUID(IID_IOTAPlatform,0xBD2EAB7F,0x7FB5,0x464A,0x9C,0x97,0x88,0xDA,0x4D,0xC3,0xD1,0xF7);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTAPlatformServices,0x8F20CD96,0x6702,0x43B8,0x87,0x6C,0xC9,0x85,0xC5,0x4C,0x9A,0xFF);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTAProjectPlatforms,0xE1C62726,0xBD51,0x4D4E,0xA2,0xF2,0x9A,0x8A,0x59,0xF2,0x72,0xAE);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTAConnectionCallback,0x7DF7A249,0x4C27,0x4147,0xBF,0xC3,0xCA,0x99,0x59,0x16,0x50,0x43);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTARemoteProfile,0x328380FA,0x2AB5,0x4F25,0xBC,0xCB,0x7A,0x3F,0x84,0x69,0x1D,0x43);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTARemoteProfileNotifier,0x84AD7E51,0xE0D0,0x4732,0x87,0x4B,0x05,0xA7,0x0E,0x2B,0xF5,0x34);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_IOTARemoteProfileServices,0xBC86D71D,0x8A31,0x4921,0xA2,0x7F,0x5D,0x32,0xDC,0x3A,0x9A,0x4F);'*)

const
  { Universal platform ids }
  cWin32Platform = 'Win32';
  cOSX32Platform = 'OSX32';
  cWin64Platform = 'Win64';
  cLinux32Platform = 'Linux32';

  AllPlatforms = pidWin32 or pidWin64 or pidOSX32; // numerical ids from System.Classes

  { File types that have well known platform-dependent extensions }
  fetUnknownType = 0;
  fetExe = 1;
  fetPackage = 2;
  fetDll = 3;
  fetStaticLibrary = 4;
  fetPackageImportLibrary = 5;
  fetCUnitBinary = 6;
  fetDelphiUnitBinary = 7;
  fetImportLibrary = 8;
  fetLast = fetImportLibrary;

type
  IOTAPlatform = interface
    ['{BD2EAB7F-7FB5-464A-9C97-88DA4DC3D1F7}']
    { Check a project to see if it's capable of supporting this platform as-is.
      Note this is not a strict check, because there's no way to know completely
      the nature of a project and the intended platform. Returns True if no
      reason could be found to prevent support, False if there is a known reason.
      Reasons parameter contains an array of strings indicating why the project
      won't work on this platform }
    function CheckProject(const AProject: IOTAProject; var Reasons: TArray<string>): Boolean;
    { Returns the translated display name for the platform }
    function GetDisplayName: string;
    { Returns the enumeration member for this platform, defined in System.Classes }
    function GetId: System.Classes.TPlatformIds;
    { Returns the invariant internal name for the platform }
    function GetName: string;
    { Returns the path delimiter for the platform }
    function GetPathDelim: string;
    { Return the appropriate file extension for various file types for this platform.
      Use "fet" constants above }
    function GetFileExtension(const FileExtType: Integer): string;
    { Return the file type associated with a a filename for this platform }
    function GetFileType(const Filename: string): Integer;
    { Relative index into the IDE's image list }
    function GetImageIndex: Integer;
    { Platform-specific namespace search paths, e.g., Win;System.Win }
    function GetNamespaceSearchPaths: string;
    { Return the appropriate output extension for this platform given
      the project type string (e.g., 'Library', 'CppConsoleApplication' as
      defined in this file }
    function GetOutputExtension(const ApplicationType: string): string;
    { Return the application type based on it's output filename }
    function GetOutputType(const Filename: string): string;
    { Is this platform available for the given personality in this IDE? }
    function IsAvailable(const Personality: string): Boolean;
    { Does this platform require a remote profile in order to compile/make/build? }
    function IsRemoteProfileRequiredToCompile(const Personality: string): Boolean;
    { Does this platform require a remote profile in order to run an application? }
    function IsRemoteProfileRequiredToRun(const Personality: string): Boolean;

    property DisplayName: string read GetDisplayName;
    property FileExtensions[const FileExtType: Integer]: string read GetFileExtension;
    property FileType[const Filename: string]: Integer read GetFileType;
    property Name: string read GetName;
    property PathDelim: string read GetPathDelim;
    property OutputExtension[const ApplicationType: string]: string
      read GetOutputExtension;
    property OutputType[const Filename: string]: string read GetOutputType;
  end;

  TOTAPlatforms = array of IOTAPlatform;

  IOTAPlatformServices = interface(IInterface)
    ['{8F20CD96-6702-43B8-876C-C985C54C9AFF}']
    { Returns an array of all known platform names }
    function AllPlatforms: TArray<string>;
    { Returns an array of names of all platforms available (enabled) for the
      given personality in this IDE }
    function AvailablePlatforms(const Personality: string): TArray<string>;
    { Return the appropriate file extension for various file types for this platform.
      Use "fet" constants above }
    function GetFileExtension(const APlatform: string; const FileExtType: Integer): string;
    { Given a platform name, returns the IOTAPlatform instance for that platform }
    function GetPlatform(const Name: string): IOTAPlatform;
    { Given a filename, return which platforms have specific knowledge of that file.
      Essentially a reverse lookup of GetFileExtension }
    function GetPlatformsFromFilename(const Filename: string): TArray<string>;
    { Return the platforms that define a particular namespace, if any. }
    function GetPlatformsFromNamespace(const Namespace: string): TArray<string>;
    { Returns whether or not the platform with PlatformName is available (enabled)
      for the given personality in this IDE }
    function PlatformAvailable(const PlatformName, Personality: string): Boolean;
    { Returns whether or not the platform with the specified key exists and
      is registered }
    function PlatformExists(const PlatformName: string): Boolean;

    property FileExtension[const APlatform: string; const FileExtType: Integer]: string read GetFileExtension;
    property Platforms[const Name: string]: IOTAPlatform read GetPlatform; default;
  end;

  { Provides information on platform-specific information held by a project }
  IOTAProjectPlatforms = interface(IInterface)
    ['{E1C62726-BD51-4D4E-A2F2-9A8A59F272AE}']
    { Add an available platform to the project }
    procedure AddPlatform(const PlatformName: string);
    { Return the currently active platform key }
    function CurrentPlatform: string;
    { Return enabled state of the requested platform }
    function GetEnabled(const PlatformName: string): Boolean;
    { Return an array of strings representing the enabled platforms for a project }
    function GetEnabledPlatforms: TArray<string>;
    { Return the profile name associated with the specified platform }
    function GetProfile(const PlatformName: string): string;
    { Does the project support platform specified by PlatformName? }
    function GetSupported(const PlatformName: string): Boolean;
    { Return an array of strings representing the valid platforms for a project }
    function GetSupportedPlatforms: TArray<string>;
    { Set a platform as disabled for this project (cannot be made active) }
    procedure SetEnabled(const PlatformName: string; Value: Boolean);
    { Set the profile name for the specified platform. Pass an empty string to
      clear the profile }
    procedure SetProfile(const PlatformName, ProfileName: string);
    { Indicate the specified platform is supported or not }
    procedure SetSupported(const PlatformName: string; Value: Boolean);
    { Return whether or not the profile associated with PlatformName is the default profile
      for that platform }
    function UsingDefaultProfile(const PlatformName: string): Boolean;

    property EnabledPlatforms: TArray<string> read GetEnabledPlatforms;
    property Enabled[const PlatformName: string]: Boolean read GetEnabled write SetEnabled;
    property Profile[const PlatformName: string]: string read GetProfile write SetProfile;
    property Supported[const PlatformName: string]: Boolean read GetSupported write SetSupported;
    property SupportedPlatforms: TArray<string> read GetSupportedPlatforms;
  end;

  IProjectPlatformInitialize = interface
    ['{4618AD84-CF6D-40A7-8C2B-B04F3554AD78}']
    procedure InitializeProject(const AProject: IOTAProject);
  end;


  { orptInclude -- path will be passed in the C++ compiler's Include path
    orptLibrary -- path will be passed in the C++ linker's Library path
    orptFramework -- path will be passed in the C++ compiler and linker's
                     framework path. The MaskOrFramework field indicates the
                     framework name, and it will be passed in the C++ compiler
                     and linker's framework option.
    orptOther -- path will not be passed to the compiler or linker }
  TOTARemotePathType = (orptInclude, orptLibrary, orptFramework, orptOther);

  { Profile Path item expressed as a path, filemask, and a flag indicating
    whether or not to recurse into subdirectories.  All path items will be
    processed on the remote machine and cached on the local machine.
    PathItems with a PathType other than orptOther will also be passed to
    the C++ compiler and linker.  For orptFramework PathTypes, all headers
    and symbolic information for the framework will always be cached.  If
    IncludeSubDir is True for frameworks, then all other files under the
    framework directory will also be cached locally. }
  TOTARemoteProfilePathItem = record
    Path: string;
    MaskOrFramework: string;
    IncludeSubDir: Boolean;
    PathType: TOTARemotePathType;
  end;

  { Dynamic array of profile path items }
  TOTARemoteProfilePathArray = array of TOTARemoteProfilePathItem;

  { Profile Credential expressed as a password or passfile, and a flag indicating which. 
    IsEncrypted flag is used to indicate whether the password has been encrypted. }
  TOTARemoteProfileCredential = record
    PasswordOrPassFile: string;
    IsPassword: Boolean;
    IsEncrypted: Boolean;
  end;


  IOTAConnectionCallback = interface(IInterface)
    ['{7DF7A249-4C27-4147-BFC3-CA9959165043}']
    { Returns True to retry the current failed or timed out connection }
    function Retry: Boolean;
    { Returns True to abort the current pending connection }
    function Abort: Boolean;
  end;


  IOTARemoteProfile = interface(IInterface)
    ['{328380FA-2AB5-4F25-BCCB-7A3F84691D43}']
    { Returns the name of the profile }
    function GetName: string;
    { Returns the name of the platform for this profile }
    function GetPlatformName: string;
    { Returns the name of the host machine for this profile }
    function GetHostName: string;
    { Returns the port number for this profile }
    function GetPortNumber: Integer;
    { Returns the credential for this profile }
    function GetCredential: TOTARemoteProfileCredential;
    { Returns the system root directory for this profile }
    function GetSystemRoot: string;
    { Returns the array of remote paths for this profile }
    function GetPaths: TOTARemoteProfilePathArray;
    { Sets the name of the profile }
    procedure SetName(const Value: string);
    { Sets the name of the platform for this profile }
    procedure SetPlatformName(const Value: string);
    { Sets the name of the host machine for this profile }
    procedure SetHostName(const Value: string);
    { Sets the port number for this profile }
    procedure SetPortNumber(const Value: Integer);
    { Sets the credential for this profile }
    procedure SetCredential(const Value: TOTARemoteProfileCredential);
    { Sets the system root directory for this profile }
    procedure SetSystemRoot(const Value: string);
    { Sets the array of remote paths for this profile }
    procedure SetPaths(const Value: TOTARemoteProfilePathArray);
    { BeginUpdate/EndUpdate allow the caller to set multiple properties of the
      profile, without sending a IOTARemoteProfileNotifier for each individual
      change.  Call BeginUpdate before setting any properties, and then a single
      notification will be sent after EndUpdate is called. }
    procedure BeginUpdate;
    procedure EndUpdate;

    property Name: string read GetName write SetName;
    property PlatformName: string read GetPlatformName write SetPlatformName;
    property HostName: string read GetHostName write SetHostName;
    property PortNumber: Integer read GetPortNumber write SetPortNumber;
    property Credential: TOTARemoteProfileCredential read GetCredential write SetCredential;
    property SystemRoot: string read GetSystemRoot write SetSystemRoot;
    property Paths: TOTARemoteProfilePathArray read GetPaths write SetPaths;
  end;

  TOTARemoteProfileStatus = (orpsOk, orpsNotFound, orpsNotAssigned, orpsNoFiles, orpsOutOfDate);

  { optStart  -- show progress dialog at start of process; StatusMessage is the dialog caption
    optUpdate -- update progress dialog
    optError  -- an error occurred; StatusMessage is the error message
    optFinish -- process is done, close Progress dialog }
  TOTAProgressType = (optStart, optUpdate, optError, optFinish);

  TOTAGetProfileFilesProgressCallback = function(ProgressType: TOTAProgressType;
    CurPathItem: Integer;           // -1 indicates no update of count
    TotalPathItemCount: Integer;    // -1 indicates no update of count
    const StatusMessage: string;    // status message for progress dialog
    const Path: string;             // path to file being copied
    const FileName: string;         // file being copied
    FileCurrentPercent: Integer     // percent complete of file being copied: -1 indicates not a file
    ): Boolean of object;

  TOTAFileOverwriteControl = (ofocAlwaysOverwrite, ofocNeverOverwrite, ofocPromptUserToOverwrite);

  TOTAPutFileFlags = set of (opffRunnable, opffArchive, opffScript);

  { An item to copy from the local machine to the remote machine.
    LocalSourceFileName is the fully-qualified name of the local file to copy to
    the remote machine.  RemoteDestinationPath is the location on the remote
    machine (relative to the machine's scratch directory) where the file will be
    copied.  RemoteDestinationFile is the name of the file to use on the remote
    machine.  If RemoteDestinationFile and RemoteDestinationPath are blank, then
    the remote file will be created at a location determined by the path of
    LocalSourceFileName.  For instance, if the LocalSourceFileName is
    "c:\foo\bar\test.txt", then the remote file created will be:
    "<SCRATCHDIR>\<USER>-<PROFILENAME>\c__drive\foo\bar\test.txt" where
    <SCRATCHDIR> is determined by the remote server.  Flags indicates how to
    handle the file after it is copied.  opffRunnable will cause the file to
    get the executable bit set (for remote systems where this matters).
    opffArchive will cause the file to be unzipped on the remote machine.
    opffScript indicates that the file is a shell script file, that should be
    executed after it is transferred (opffScript implies opffRunnable) }
  TOTAPutFileItem = record
    LocalSourceFileName: string;
    RemoteDestinationPath: string;
    RemoteDestinationFile: string;
    Flags: TOTAPutFileFlags;
  end;
  { Dynamic array of files to copy to the remote machine }
  TOTAPutFileArray = array of TOTAPutFileItem;

  { An item representing a file on the remote machine.  Name is the file or
    directory name.  Attributes indicates the attributes for the remote file --
    these correspond to the "fa..." constants defined in the "File attribute
    constants" section in SysUtils.pas.  TimeStamp may indicate the timestamp
    of the remote file (see comment for BrowseRemoteFileSystem below).  Size
    indicates the size of the remote file }
  TOTARemoteFileInfo = record
    Name: string;
    Attributes: Integer;
    TimeStamp: TDateTime;
    Size: Int64;
  end;
  TOTARemoteFileInfoArray = array of TOTARemoteFileInfo;

  { A notifier for changes to remote profiles }
  IOTARemoteProfileNotifier = interface
    ['{84AD7E51-E0D0-4732-874B-05A70E2BF534}']
    { Called after the name of the remote profile is changed }
    procedure RemoteProfileRenamed(const RemoteProfile: IOTARemoteProfile;
      const OldName: string);
    { Called after any properties (other than name) of the remote profile are
      changed }
    procedure RemoteProfileChanged(const RemoteProfile: IOTARemoteProfile);
    { Called after a new remote profile is added }
    procedure RemoteProfileAdded(const RemoteProfile: IOTARemoteProfile);
    { Called right before a remote profile is removed.  Release any references
      to the profile, so that it can be properly cleaned up }
    procedure RemoteProfileRemoved(const RemoteProfile: IOTARemoteProfile);
  end;

  IOTARemoteProfileServices = interface(IInterface)
    ['{BC86D71D-8A31-4921-A27F-5D32DC3A9A4F}']
    { Returns the number of available profiles for the specified platform }
    function GetProfileCount(const PlatformName: string): Integer;
    { Returns the index'd profile for the specified platform }
    function GetProfile(const PlatformName: string; Index: Integer): IOTARemoteProfile; overload;
    { Returns the specified profile.  Returns nil if the profile does not exist }
    function GetProfile(const ProfileName: string): IOTARemoteProfile; overload;
    { Adds a new profile }
    function AddProfile(const Name: string; const PlatformName: string;
      const HostName: string; PortNumber: Integer; const Credential: TOTARemoteProfileCredential;
      const SystemRoot: string; const Paths: TOTARemoteProfilePathArray;
      IsDefault: Boolean): IOTARemoteProfile;
    { Opens up the Options dialog, selects the "Remote Profiles" options page,
      and focuses the specified profile, allowing the user to edit it }
    procedure EditProfile(const Name: string);
    { Removes the specified profile }
    procedure RemoveProfile(const Profile: IOTARemoteProfile);
    { Returns the default profile for the specified platform.  Returns nil if
      there is no default profile for the specified platform.  The Windows
      platform will never have a default -- thus this method will always return
      nil for the Windows platform }
    function GetDefaultForPlatform(const PlatformName: string): IOTARemoteProfile;
    { Sets the specified profile as the default for its platform }
    procedure SetAsDefaultForPlatform(const Profile: IOTARemoteProfile);
    { BeginOperation and EndOperation should be used to increase performance
      when multiple calls to the following methods will be made in succession:
      GetProfileFiles, GetProfileFilesWithProgress, PutFiles, GetRemoteFileInfo,
      PutFilesWithProgress, RemoveRemoteFilesWithProgress, BrowseRemoteFileSystem, 
      RemoteDirectoryExists, GetRemoteBaseDirectory, ExpandPath, ExpandAllPaths,
      CreateSymLink, Run, StartRemoteDebugger, GetEnvironmentVariables.
      Wrapping the multiple calls inside of a BeginOperation/EndOperation pair
      will allow a single connection to the remote machine to be used. Otherwise
      each individual call will create and destroy its own connection. }
    procedure BeginOperation(const Profile: IOTARemoteProfile);
    procedure EndOperation(const Profile: IOTARemoteProfile);
    { Attempts to connect to the host defined in the specifed IOTARemoteProfile.
      The return value indicates if the connection succeeded or not. If False
      is returned, ErrorMessage may contain extra information about the failure.
      ConnectionCallback is an optional interface that is called when the connection
      fails or when to abort the pending connection }
    function TestConnection(const Profile: IOTARemoteProfile;
      out ErrorMessage: string;
      ConnectionCallBack: IOTAConnectionCallback = nil): Boolean; overload;
    { Attempts to connect to the host machine and process the remote files
      specified in Profile.Paths.  The symbolic information and files will be
      cached on the local machine directory specified in Profile.SystemRoot }
    function GetProfileFiles(const Profile: IOTARemoteProfile;
      OverwriteControl: TOTAFileOverwriteControl = ofocPromptUserToOverwrite;
      ConnectionCallback: IOTAConnectionCallback = nil;
      ProgressCallback: TOTAGetProfileFilesProgressCallback = nil): Boolean;
    { Gets the size and date of a local file and returns False if the file does not exist }
    function GetFileInfo(const Profile: IOTARemoteProfile; const Path: string; out LastWriteTime: TDateTime;
      out Size: Int64) : Boolean;
    { Attempts to connect to the host machine and returns the size and date of a remote file. 
      Return False if the file does not exist }
    function GetRemoteFileInfo(const Profile: IOTARemoteProfile; const Path: string; out LastWriteTime: TDateTime;
      out Size: Int64; ConnectionCallBack: IOTAConnectionCallback = nil): Boolean;
    { A simplified version of GetProfileFiles that uses the defaults for
      OverwriteControl and ConnectionCallback and uses the IDE's built-in progress
      dialog }
    function GetProfileFilesWithProgress(const Profile: IOTARemoteProfile): Boolean;
    { Attempts to connect to the host machine and push the specified Files from
      the local machine to the remote machine }
    function PutFiles(const Profile: IOTARemoteProfile; const Files: TOTAPutFileArray;
      OverwriteControl: TOTAFileOverwriteControl = ofocAlwaysOverwrite;
      ConnectionCallback: IOTAConnectionCallback = nil;
      ProgressCallback: TOTAGetProfileFilesProgressCallback = nil): Boolean;
    { A simplified version of PutFiles that uses the defaults for
      OverwriteControl and ConnectionCallback and uses the IDE's built-in progress
      dialog }
    function PutFilesWithProgress(const Profile: IOTARemoteProfile;
      const Files: TOTAPutFileArray): Boolean;
    { Attempts to connect to the host machine and delete the files specfied in
      the Files array.  The Files array should contain fully qualified file
      names as they are seen on the remote machine }
    function RemoveRemoteFiles(const Profile: IOTARemoteProfile;
      const Files: TStringDynArray;
      ConnectionCallback: IOTAConnectionCallback = nil;
      ProgressCallback: TOTAGetProfileFilesProgressCallback = nil): Boolean;
    { A simplified version of PutFiles that uses the default for
      ConnectionCallback and uses the IDE's built-in progress dialog }
    function RemoveRemoteFilesWithProgress(const Profile: IOTARemoteProfile;
      const Files: TStringDynArray): Boolean;
    { Attempts to connect to the host machine and browse the remote file system.
      Path is the directory you want to browse.  Attributes are the file types
      that you want included in the result -- these correspond to the "fa..."
      constants defined in the "File attribute constants" section in
      SysUtils.pas. IncludeTimeStamp is a flag indicating whether or not you
      want the result to include file timestamps.  If IncludeTimeStamp is false,
      all items in the result array will have a zero TimeStamp. Item zero in the
      returned array is the name of the Path passed in.  Actual items on the
      remote machine start at item one in the returned array }
    function BrowseRemoteFileSystem(const Profile: IOTARemoteProfile;
      const Path: string; Attributes: Integer; IncludeTimeStamp: Boolean;
      ConnectionCallBack: IOTAConnectionCallback = nil): TOTARemoteFileInfoArray;
    { Attempts to connect to the host machine and returns True if the directory
      exists in the remote file system }
    function RemoteDirectoryExists(const Profile: IOTARemoteProfile;
      const Directory: string; ConnectionCallBack: IOTAConnectionCallback = nil): Boolean;
    { Attempts to connect to the host machine and asks the remote machine for
      the name of the scratch directory used on the remote machine for the
      specified profile }
    function GetRemoteBaseDirectory(const Profile: IOTARemoteProfile;
      ConnectionCallBack: IOTAConnectionCallback = nil): string;
    { Attempts to connect to the host machine and returns the fully qualified path 
      of the given path. If the path is a relative path, it is made full path 
      by resolving it against the scratch directory used on the remote machine for 
      the specified profile }
    function ExpandPath(const Profile: IOTARemoteProfile; const Path: string;
      ConnectionCallBack: IOTAConnectionCallback = nil): string;
    { Attempts to connect to the host machine and returns the fully qualified paths 
      of the given paths. If the path is a relative path, it is made full path 
      by resolving it against the scratch directory used on the remote machine for
      the specified profile }
    function ExpandAllPaths(const Profile: IOTARemoteProfile; const Paths: string;
      ConnectionCallBack: IOTAConnectionCallback = nil): string;
    { Attempts to connect to the host machine and returns True if the symbolic link
      is successfully created for the TargetPath.  If False is returned, ErrorMessage
      may contain extra information about the failure }
    function CreateSymLink(const Profile: IOTARemoteProfile; const LinkPath: string;
      const TargetPath: string; ConnectionCallBack: IOTAConnectionCallback = nil): Boolean;
    { Attempts to connect to a remote machine using the specified profile and
      Runs (without debugging) the specified process on that machine.  
      PathUnderScratchDir is the path under the remote machine's "scratch directory" 
      where the process lives.  ExeName is the name of the executable to run. 
      Params are parameters to pass to the executable.  Launcher is an optional 
      application to use to launch the ExeName.  If it contains the string "%debuggee%", 
      then the ExeName will be used in place of %debuggee%.   The most common 
      use of a Launcher is a shell that can be used so that the running app has 
      a dedicated place for stdin/stdout/stderr/etc.   WorkingDir is the directory 
      to use as the current directory when launching the process.  EnvList is 
      a list of environment variables for the process.  UserName is the user 
      account to use when running the process.  The return value indicates whether 
      or not the process was launched successfully.  If False is returned, ErrorMessage
      may contain extra information about the failure }
    function Run(const Profile: IOTARemoteProfile;
      const PathUnderScratchDir: string; const ExeName: string;
      const Params: string; const Launcher: string; const WorkingDir: string;
      const EnvList: TStrings; const UserName: string;
      out ErrorMessage: string;
      ConnectionCallback: IOTAConnectionCallback = nil): Boolean;
    { Attempts to connect to a remote machine using the specified profile and
      starts the remote debugger on that machine.  UserName is the user account
      to use when running the remote debugger process. The return value indicates 
      whether or not the remote debugger was launched successfully. If False is
      returned, ErrorMessage may contain extra information about the failure }
    function StartRemoteDebugger(const Profile: IOTARemoteProfile;
      const UserName: string; const ProcessType: TOTAProcessType; out DebuggerId: Integer; 
      out DebuggerPort: Integer; out ErrorMessage: string; ConnectionCallback: IOTAConnectionCallback = nil): Boolean;
    { Executes the New Remote Profile wizard and returns the newly-added
      IOTARemoteProfile.  Returns nil if the user cancels out of the wizard.
      InitialPlatform is the platform that will be pre-selected in the wizard
      If InitialPlatform is the empty string, the initial platform will be
      the first one listed in the Platform combo box. If RestrictToInitialPlatform
      is true, the user will not be able to select any platform other than the
      InitialPlatform }
    function ExecuteNewProfileWizard(const InitialPlatform: string = '';
      RestrictToInitialPlatform: Boolean = False): IOTARemoteProfile;
    { Shows a dialog with all available Profiles for the specified platform.  If
      PlatformName is blank, all Profiles for all platforms will be included in
      the dialog.  The return value indicates which Platform the user selected.
      The return value will be nil if the user cancels out of the dialog }
    function ShowSelectProfileDialog(const PlatformName: string = ''): IOTARemoteProfile;
    { Can the project currently be deployed using the specified profile? }
    function CanDeployProject(const Project: IOTAProject; const Profile: IOTARemoteProfile): Boolean;
    { Run the "Deploy" target using the specified profile and project }
    function DeployProject(const Project: IOTAProject; const Profile: IOTARemoteProfile;
      Configuration: string = ''; PlatformName: string = ''; ClearMessages: Boolean = True): Boolean;
    { Check profile requirement(s) in order to compile the given project for
      the specified platform. Return true if requirements are met, false if
      they cannot be met or are not met after prompting the user }
    function EnsureProfileForCompile(const Project: IOTAProject;
      const PlatformName: string; var ErrorMessage: string): TOTARemoteProfileStatus;
    { Check profile requirement(s) in order to run the given project. Return
      true if requirements are met, false if they cannot be met or are not
      met after prompting the user }
    function EnsureProfileForRun(const Project: IOTAProject;
      var ErrorMessage: string): TOTARemoteProfileStatus;
    { Call this to register an IOTARemoteProfileNotifier. The result is the
      index to be used when calling RemoveNotifier. If <0 then an error occurred. }
    function AddNotifier(const Notifier: IOTARemoteProfileNotifier): Integer;
    { Call with the index obtained from AddNotifier }
    procedure RemoveNotifier(Index: Integer);
    { Attempts to connect to the host machine and returns environment variables
      on that meachine. Returns empty array if no environment variable is found,
      otherwise returns array of 'name=value' string }
    function GetEnvironmentVariables(const Profile: IOTARemoteProfile;
      ConnectionCallBack: IOTAConnectionCallback = nil): TStringDynArray;
  end;

  EPlatformNotSupported = class(Exception)
  public
    constructor Create(const PlatformName: string);
  end;

function ConfigurationDisplayTitle(const BC: IOTABuildConfiguration; Abbreviate: Boolean): string;

implementation

uses DesignConst;

resourcestring
  sPlatformNotSupported = 'Platform "%s" not supported.';

function ConfigurationDisplayTitle(const BC: IOTABuildConfiguration; Abbreviate: Boolean): string;
var
  S: string;
begin
  if BC.Name = sBaseConfigurationKey then
    Result := sAllConfigurations
  else
    Result := BC.Name + sConfiguration;

  if (BC.Platform = '') and Abbreviate then Exit;

  if BC.Platform = '' then
    S := sAllPlatforms
  else if (BorlandIDEServices as IOTAPlatformServices).PlatformExists(BC.Platform) then
    S := (BorlandIDEServices as IOTAPlatformServices).Platforms[BC.Platform].DisplayName + sPlatform
  else
    S := BC.Platform + sPlatform;

  if (BC.Platform <> '') and Abbreviate then
  begin
    Result := S;
    Exit;
  end;
  Result := Format('%s - %s', [Result, S]);
end;

{ EPlatformNotSupported }

constructor EPlatformNotSupported.Create(const PlatformName: string);
begin
  inherited CreateFmt(sPlatformNotSupported, [PlatformName]);
end;

end.
