{$A8} {$R-}
{*************************************************************}
{                                                             }
{       CodeGear Delphi Visual Component Library              }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2007 CodeGear                      }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
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

unit IBInstall;

interface

uses TypInfo, SysUtils, Classes, IB, IBInstallHeader, IBIntf, IBXConst;

type

  TIscError = MSG_NO;
  TIBInstallerError = (ieSuccess,
                       ieDelphiException,
                       ieNoOptionsSet,
                       ieNoDestinationDirectory,
                       ieNosourceDirectory,
                       ieNoUninstallFile,
                       ieOptionNeedsClient,
                       ieOptionNeedsServer,
                       ieInvalidOption,
                       ieInvalidOnErrorResult,
                       ieInvalidOnStatusResult);

  TMainOption = (moServer,
                 moClient,
                 moConServer,
                 moGuiTools,
                 moDocumentation,
                 moDevelopment);


  TExamplesOption = (exDB, exAPI);
  TCmdOption = (cmDBMgmt, cmDBQuery, cmUsrMgmt);
  TConnectivityOption = (cnODBC, cnOLEDB, cnJDBC);

  TMainOptions = set of TMainOption;
  TExamplesOptions = set of TExamplesOption;
  TCmdOptions = set of TCmdOption;
  TConnectivityOptions = set of TConnectivityOption;

  TErrorResult = (erAbort, erContinue, erRetry);
  TStatusResult = (srAbort, srContinue);
  TWarningResult = (wrAbort, wrContinue);

  TIBSetupOnStatus = function(Sender : TObject; StatusComment : string):
                              TStatusResult of object;
  TIBSetupOnWarning = function(Sender :TObject; WarningCode: TIscError;
                               WarningMessage : string): TWarningResult of object;
  TIBSetupOnError = function (Sender : TObject; IscCode : TIscError;
                               ErrorMessage, ErrorComment : string):
                               TErrorResult of object;

  EIBInstall = class(Exception)
  private
    FIscError : MSG_NO;
    FInstallerError : TIBInstallerError;
  public
    constructor Create(IscCode : MSG_NO; IscMessage : String); overload; virtual;
    constructor Create(ECode  : TIBInstallerError; EMessage : String); overload;
                       virtual;
    property InstallError : MSG_NO read FIscError;
    property InstallerError : TIBInstallerError read FInstallerError;
  end;

  EIBInstallError = class(EIBInstall);  

  EIBInstallerError  = class(EIBInstall);

  TInstallOptions = class(TPersistent)
   private
    FMainComponents : TMainOptions;
    FExamples: TExamplesOptions;
    FCmdLineTools: TCmdOptions;
    FConnectivityClients: TConnectivityOptions;
   published
    property MainComponents : TMainOptions read FMainComponents write FMainComponents;
    property CmdLineTools: TCmdOptions read FCmdLineTools write FCmdLineTools;
    property ConnectivityClients: TConnectivityOptions read FConnectivityClients
                                                       write FConnectivityClients;
    property Examples: TExamplesOptions read FExamples write FExamples;
  end;

  TIBSetup = class(TComponent)
  private
    FIBInstallLoaded: Boolean;
    FRebootToComplete: Boolean;
    FProgress: Integer;
    FMsgFilePath: String;
    FOnStatusChange: TIBSetupOnStatus;
    FStatusContext : Pointer;
    FOnError: TIBSetupOnError;
    FErrorContext : Pointer;
    FOnWarning: TIBSetupOnWarning;
    procedure SetMsgFilePath(const Value: String);
 protected
    function StatusInternal(Status: Integer; const ActionDescription: TEXT):Integer;
    function ErrorInternal(IscCode: MSG_NO; const ActionDescription: TEXT): Integer;
    procedure Call(IscCode: MSG_NO);
    procedure IBInstallError(IscCode: MSG_NO);
    function GetInstallMessage(IscCode : MSG_NO) : String;
  public
    constructor Create(AOwner : TComponent); override;
    property RebootToComplete : Boolean read FRebootToComplete;
    property Progress : Integer read FProgress;
    property StatusContext : Pointer read FStatusContext write FStatusContext;
    property ErrorContext : Pointer read FErrorContext write FErrorContext;
    property MsgFilePath: String read FMsgFilePath write SetMsgFilePath;
  published
    property OnWarning: TIBSetupOnWarning read FOnWarning write FOnWarning;
    property OnError: TIBSetupOnError read FOnError write FOnError;
    property OnStatusChange: TIBSetupOnStatus read FOnStatusChange write FOnStatusChange;
  end;

  TIBInstall = class(TIBSetup)
  private
    FUnInstallFile: AnsiString;
    FSourceDir: AnsiString;
    FDestinationDir: AnsiString;
    FSuggestedDestination: AnsiString;
    FInstallOptions: TInstallOptions;
    procedure GetOptionProperty(InfoType : Integer; Option : TExamplesOption;
                                Buffer : Pointer; BufferLen : Cardinal); overload;
    procedure GetOptionProperty(InfoType : Integer; Option : TMainOption;
                                Buffer : Pointer; BufferLen : Cardinal); overload;
    procedure GetOptionProperty(InfoType : Integer; Option : TConnectivityOption;
                                Buffer : Pointer; BufferLen : Cardinal); overload;
    procedure GetOptionProperty(InfoType : Integer; Option : TCmdOption;
                                Buffer : Pointer; BufferLen : Cardinal); overload;
    procedure InternalSetOptions(pHandle : POPTIONS_HANDLE);
    procedure SetDestination(const Value: AnsiString);
    procedure SetSource(const Value: AnsiString);
    procedure SetInstallOptions(const Value: TInstallOptions);
    procedure SuggestDestination;
  public
    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;

    procedure InstallCheck;
    procedure InstallExecute;

    function  GetOptionDescription (Option : TExamplesOption): String; overload;
    function  GetOptionDescription (Option : TMainOption) : String; overload;
    function  GetOptionDescription (Option : TConnectivityOption) : String; overload;
    function  GetOptionDescription (Option : TCmdOption) : String; overload;

    function  GetOptionName (Option : TExamplesOption): String; overload;
    function  GetOptionName (Option : TMainOption) : String; overload;
    function  GetOptionName (Option : TConnectivityOption) : String; overload;
    function  GetOptionName (Option : TCmdOption) : String; overload;

    function  GetOptionSpaceRequired (Option : TExamplesOption): longword; overload;
    function  GetOptionSpaceRequired (Option : TMainOption): longword; overload;
    function  GetOptionSpaceRequired (Option : TConnectivityOption): longword; overload;
    function  GetOptionSpaceRequired (Option : TCmdOption): longword; overload;

    property  UnInstallFile: AnsiString read FUnInstallFile;
    property SuggestedDestination: AnsiString read FSuggestedDestination;

  published
    property SourceDirectory: AnsiString read FSourceDir write SetSource;
    property DestinationDirectory: AnsiString read FDestinationDir write SetDestination;
    property InstallOptions: TInstallOptions read FInstallOptions write SetInstallOptions;
  end;

  TIBUnInstall = class(TIBSetup)
  private
    FUnInstallFile: AnsiString;
   public
    procedure UnInstallCheck;
    procedure UnInstallExecute;
    property  UnInstallFile: AnsiString read FUnInstallFile write FUnInstallFile;
  published
  end;

implementation

const
  IBInstallerMessages : array[TIBInstallerError] of string = (
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
    SInvalidOnStatusResult
    );



procedure IBInstallerError(ECode: TIBInstallerError; const Args: array of const);
begin
  raise EIBInstallerError.Create(ECode, Format(IBInstallerMessages[ECode], Args));
end;

function ErrorCallback(IscCode: MSG_NO; UserContext: Pointer; const ActionDescription:
                       TEXT): Integer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF MACOS} cdecl; {$ENDIF}
begin
  Result := TIBSetup(UserContext).ErrorInternal(IscCode, ActionDescription);
end;

function StatusCallback(Status : Integer; UserContext: Pointer; const ActionDescription:
                       TEXT): Integer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF MACOS} cdecl; {$ENDIF}
begin
  Result := TIBSetup(UserContext).StatusInternal(Status, ActionDescription);
end;

{ TIBSetup }

function TIBSetup.ErrorInternal(IscCode: MSG_NO; const ActionDescription: TEXT):
                                Integer;
var
  ErrorComment : AnsiString;
begin
  if(ActionDescription <> nil) and (ActionDescription[0] <> #0) then
  begin
    SetLength(ErrorComment, StrLen(ActionDescription));
    StrCopy(@ErrorComment, ActionDescription);
  end
  else
    ErrorComment := '';

  if(Isccode = isc_install_fp_copy_delayed) or
    (Isccode = isc_install_fp_delete_delayed) then
  begin
    FRebootToComplete := True;
    Result := isc_install_fp_continue;
    exit;
  end;

  if Assigned(FOnError) then
    case FOnError(self, IscCode, GetInstallMessage(IscCode), String(ErrorComment)) of
      erAbort:
        Result := isc_install_fp_abort;
      erContinue:
        Result := isc_install_fp_continue;
      erRetry:
        Result := isc_install_fp_retry;
      else
        Result := isc_install_fp_abort;
    end
  else
    Result := isc_install_fp_abort;
end;

function TIBSetup.StatusInternal(Status: Integer; const ActionDescription: TEXT):
 Integer;
var
  StatusComment : AnsiString;
begin
  FProgress := Status;
  if(ActionDescription <> nil) and (ActionDescription[0] <> #0) then
  begin
    SetLength(StatusComment, StrLen(ActionDescription));
    StrCopy(@StatusComment, ActionDescription);
  end
  else
   StatusComment := '';

  if Assigned(FOnStatusChange) then
    case  FOnStatusChange(self, String(StatusComment)) of
      srAbort:
       Result := isc_install_fp_abort;
      srContinue:
       Result := isc_install_fp_continue;
      else
       Result := isc_install_fp_continue;
    end
   else
     Result := isc_install_fp_continue;
end;

procedure TIBSetup.SetMsgFilePath(const Value: String);
begin
  if FMsgFilePath <> Value then
  begin
    Call(isc_install_load_external_text(@Value));
    FMsgFilePath := Value;
  end;
end;

procedure TIBSetup.Call(IscCode: MSG_NO);
begin
  if IscCode = isc_install_success then
    Exit;

  if IscCode < isc_install_success then
  begin
    if Assigned(FOnWarning) then
    begin
      if FOnWarning(self, IscCode, GetInstallMessage(IscCode)) = wrAbort then
        IBInstallError(IscCode);
      Exit;
    end
    else
      IBInstallError(IscCode);
  end;
  IBInstallError(IscCode);
end;

procedure TIBSetup.IBInstallError(IscCode: MSG_NO);
begin
  raise EIBInstallError.Create(IscCode, GetInstallMessage(IscCode));
end;

function TIBSetup.GetInstallMessage(IscCode : MSG_NO) : String;
var
  status     : MSG_NO;
  IscMessage : AnsiString;
begin
  SetLength(IscMessage, ISC_INSTALL_MAX_MESSAGE_LEN * 2);
  status := isc_install_get_message(0, IscCode, PByte(IscMessage),
                                    ISC_INSTALL_MAX_MESSAGE_LEN * 2);

  if status <> isc_install_success then
    isc_install_get_message(0, status, PByte(IscMessage),
                            ISC_INSTALL_MAX_MESSAGE_LEN * 2);

  SetLength(IscMessage, StrLen(PAnsiChar(IscMessage)));
  result := String(IscMessage);
end;

constructor TIBSetup.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FIBInstallLoaded := False;
  CheckIBInstallLoaded;
  FIBInstallLoaded := True;
  FRebootToComplete := False;
  FProgress := 0;
end;

{ TIBInstall }

constructor TIBInstall.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIBInstallLoaded := False;
  CheckIBInstallLoaded;
  FIBInstallLoaded := True;
  FInstallOptions := TInstallOptions.Create;
  SuggestDestination;
end;

destructor TIBInstall.Destroy;
begin
  if FIBInstallLoaded then
    FInstallOptions.Free;
  inherited Destroy;
end;

procedure TIBInstall.InstallCheck;
var
  Handle : OPTIONS_HANDLE;
  SrcDir, DestDir : PAnsiChar;
begin
  Handle := 0;
  InternalSetOptions(@Handle);

  if FSourceDir = '' then
    SrcDir := nil
  else
    SrcDir := PAnsiChar(FSourceDir);

  if FDestinationDir = '' then
    DestDir := nil
  else
    DestDir := PAnsiChar(FDestinationDir);

  try
    Call(isc_install_precheck(Handle, SrcDir, DestDir));
  finally
    isc_install_clear_options(@Handle);
  end;
end;

procedure TIBInstall.InstallExecute;
var
  Handle : OPTIONS_HANDLE;
begin
  Handle := 0;
  InternalSetOptions(@Handle);

  if Handle = 0 then
    IBInstallerError(ieNoOptionsSet, []);

  try
    SetLength(FUninstallFile, ISC_INSTALL_MAX_PATH);
    Call(isc_install_execute(Handle, PAnsiChar(FSourceDir), PAnsiChar(FDestinationDir),
                            StatusCallback, Pointer(self), ErrorCallback,
                            Pointer(self), PAnsiChar(FUninstallFile)));
    SetLength(FUninstallFile, StrLen(PAnsiChar(FUninstallFile)));
  finally
    isc_install_clear_options(@Handle);
  end;
end;

procedure TIBInstall.InternalSetOptions(pHandle: POPTIONS_HANDLE);
begin
  with FInstallOptions do
  begin
    if FMainComponents <> [] then
    begin
     if moClient in  FMainComponents then
       isc_install_set_option(pHandle, IB_CLIENT);
     if moDevelopment in FMainComponents then
       isc_install_set_option(pHandle, IB_DEV);
     if moServer in FMainComponents then
       isc_install_set_option(pHandle, IB_SERVER);
     if  moDocumentation in FMainComponents then
       isc_install_set_option(pHandle, IB_DOC);
     if moConServer in FMainComponents then
       isc_install_set_option(pHandle, IB_CONNECTIVITY_SERVER);
     if moGuiTools in FMainComponents then
       isc_install_set_option(pHandle, IB_GUI_TOOLS);
    end;

    if FExamples <> [] then
    begin
     if exDB in FExamples  then
       isc_install_set_option(pHandle, IB_EXAMPLE_DB);
     if exAPI in FExamples then
       isc_install_set_option(pHandle, IB_EXAMPLE_API);
    end;

    if FCmdLineTools  <> [] then
    begin
     if cmDBMgmt in FCmdLineTools then
        isc_install_set_option(pHandle, IB_CMD_TOOLS_DB_MGMT);
     if cmDBQuery in FCmdLineTools then
        isc_install_set_option(pHandle, IB_CMD_TOOLS_DB_QUERY);
     if cmUsrMgmt in FCmdLineTools then
        isc_install_set_option(pHandle, IB_CMD_TOOLS_USR_MGMT);
    end;

    if FConnectivityClients <> [] then
    begin
     if cnODBC in FConnectivityClients then
       isc_install_set_option(pHandle, IB_ODBC_CLIENT);
     if cnOLEDB in FConnectivityClients then
       isc_install_set_option(pHandle, IB_OLEDB_CLIENT);
     if  cnJDBC in FConnectivityClients then
        isc_install_set_option(pHandle, IB_JDBC_CLIENT);
    end;
  end;
end;

procedure TIBInstall.SetDestination(const Value: AnsiString);
var
  IscCode  : MSG_NO;
begin
  if Value <> '' then
  begin
    IscCode := isc_install_precheck(0, nil, PAnsiChar(Value));
    if(IscCode > isc_install_success) then
     IBInstallError(IscCode);
  end;
  FDestinationDir := Value;
end;

procedure TIBInstall.SetInstallOptions(const Value: TInstallOptions);
begin
  if FInstallOptions <> Value then
    FInstallOptions.Assign(Value);
end;

procedure TIBInstall.SetSource(const Value: AnsiString);
var
  IscCode  : MSG_NO;
begin
  if Value <> '' then
  begin
    IscCode := isc_install_precheck(0, PAnsiChar(Value), nil);
    if(IscCode > isc_install_success) then
      IBInstallError(IscCode);
    end;
  FSourceDir := Value;
end;

procedure TIBInstall.SuggestDestination;
begin
  SetLength(FSuggestedDestination, ISC_INSTALL_MAX_PATH);
  Call(isc_install_get_info(isc_install_info_destination, 0, PByte(FSuggestedDestination),
                           ISC_INSTALL_MAX_PATH));
  SetLength(FSuggestedDestination, StrLen(PAnsiChar(FSuggestedDestination)));
end;

function TIBInstall.GetOptionDescription(Option: TExamplesOption): String;
var
  OptionDesc : AnsiString;
begin
  SetLength(OptionDesc, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opdescription, Option, PByte(OptionDesc),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionDesc, StrLen(PAnsiChar(AnsiString(OptionDesc))));
  Result := String(OptionDesc);
end;

function TIBInstall.GetOptionDescription(Option: TCmdOption): String;
var
  OptionDesc : AnsiString;
begin
  SetLength(OptionDesc, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opdescription, Option, PByte(OptionDesc),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionDesc, StrLen(PAnsiChar(AnsiString(OptionDesc))));
  Result := String(OptionDesc);
end;

function TIBInstall.GetOptionDescription(Option: TConnectivityOption): String;
var
  OptionDesc : AnsiString;
begin
  SetLength(OptionDesc, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opdescription, Option, PByte(OptionDesc),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionDesc, StrLen(PAnsiChar(OptionDesc)));
  Result := String(OptionDesc);
end;

function TIBInstall.GetOptionDescription(Option: TMainOption): String;
var
  OptionDesc : AnsiString;
begin
  SetLength(OptionDesc, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opdescription, Option, PByte(OptionDesc),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionDesc, StrLen(PAnsiChar(OptionDesc)));
  Result := String(OptionDesc);
end;

function TIBInstall.GetOptionName(Option: TExamplesOption): String;
var
  OptionName : AnsiString;
begin
  SetLength(OptionName, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opname, Option, PByte(OptionName),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionName, StrLen(PAnsiChar(OptionName)));
  Result := String(OptionName);
end;

function TIBInstall.GetOptionName(Option: TCmdOption): String;
var
  OptionName : AnsiString;
begin
  SetLength(OptionName, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opname, Option, PByte(OptionName),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionName, StrLen(PAnsiChar(OptionName)));
  Result := String(OptionName);
end;

function TIBInstall.GetOptionName(Option: TConnectivityOption): String;
var
  OptionName : AnsiString;
begin
  SetLength(OptionName, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opname, Option, PByte(OptionName),
                  ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionName, StrLen(PAnsiChar(OptionName)));
  Result := String(OptionName);
end;

function TIBInstall.GetOptionName(Option: TMainOption): String;
var
  OptionName : AnsiString;
begin
  SetLength(OptionName, ISC_INSTALL_MAX_MESSAGE_LEN);
  GetOptionProperty(isc_install_info_opname, Option, PByte(OptionName),
                   ISC_INSTALL_MAX_MESSAGE_LEN);
  SetLength(OptionName, StrLen(PAnsiChar(OptionName)));
  Result := String(OptionName);
end;

function TIBInstall.GetOptionSpaceRequired(Option: TExamplesOption): longword;
var
  OptionSpace : Longword;
begin
  GetOptionProperty(isc_install_info_opspace, Option, @OptionSpace,
                    Cardinal(SizeOf(OptionSpace)));
  Result := OptionSpace;
end;

function TIBInstall.GetOptionSpaceRequired(Option: TMainOption): longword;
var
  OptionSpace : Longword;
begin
  GetOptionProperty(isc_install_info_opspace, Option, @OptionSpace,
                    Cardinal(SizeOf(OptionSpace)));
  Result := OptionSpace;
end;

function TIBInstall.GetOptionSpaceRequired(Option: TConnectivityOption): longword;
var
  OptionSpace : Longword;
begin
  GetOptionProperty(isc_install_info_opspace, Option, @OptionSpace,
                    Cardinal(SizeOf(OptionSpace)));
  Result := OptionSpace;
end;

function TIBInstall.GetOptionSpaceRequired(Option: TCmdOption): longword;
var
  OptionSpace : Longword;
begin
  GetOptionProperty(isc_install_info_opspace, Option, @OptionSpace,
                   Cardinal(SizeOf(OptionSpace)));
  Result := OptionSpace;
end;

procedure TIBInstall.GetOptionProperty(InfoType: Integer; Option : TMainOption;
                                       Buffer: Pointer; BufferLen : Cardinal);
var
 IscOption : OPT;
begin
  case Option of
    moClient:
     IscOption := IB_CLIENT;
    moDevelopment:
     IscOption := IB_DEV;
    moServer:
     IscOption :=  IB_SERVER;
    moDocumentation:
     IscOption := IB_DOC;
    moGuiTools:
     IscOption := IB_GUI_TOOLS;
    else
     IscOption :=  IB_CONNECTIVITY_SERVER;
  end;
  Call(isc_install_get_info(InfoType, IscOption, Buffer, BufferLen));
end;

procedure TIBInstall.GetOptionProperty(InfoType: Integer; Option: TExamplesOption;
                                       Buffer: Pointer; BufferLen : Cardinal);
var
 IscOption : OPT;
begin
  case Option of
     exDB:
       IscOption := IB_EXAMPLE_DB;
     else
       IscOption := IB_EXAMPLE_API;
   end;
   Call(isc_install_get_info(InfoType, IscOption, Buffer, BufferLen));
end;

procedure TIBInstall.GetOptionProperty(InfoType: Integer; Option: TCmdOption;
                                       Buffer: Pointer; BufferLen : Cardinal);
var
 IscOption : OPT;
begin
  case Option of
    cmDBMgmt:
      IscOption := IB_CMD_TOOLS_DB_MGMT;
        cmDBQuery:
      IscOption := IB_CMD_TOOLS_DB_QUERY;
        else
      IscOption := IB_CMD_TOOLS_USR_MGMT;
  end;
  Call(isc_install_get_info(InfoType, IscOption, Buffer, BufferLen));
end;

procedure TIBInstall.GetOptionProperty(InfoType: Integer; Option: TConnectivityOption;
                                       Buffer: Pointer; BufferLen : Cardinal);
var
 IscOption : OPT;
begin
  case Option of
    cnODBC:
     IscOption :=  IB_ODBC_CLIENT;
    cnOLEDB:
     IscOption := IB_OLEDB_CLIENT;
    else
     IscOption := IB_JDBC_CLIENT;
  end;
  Call(isc_install_get_info(InfoType, IscOption, Buffer, BufferLen));
end;

{ TIBUnInstall }

procedure TIBUnInstall.UnInstallCheck;
begin
  if FUninstallFile = '' then
    IBInstallerError(ieNoUninstallFile, []);

  Call(isc_uninstall_precheck(PAnsiChar(FUninstallFile)));
end;

procedure TIBUnInstall.UnInstallExecute;
begin
  if FUninstallFile = '' then
    IBInstallerError(ieNoUninstallFile, []);

  Call(isc_uninstall_execute(PAnsiChar(FUninstallFile), StatusCallback, Pointer(self),
                             ErrorCallback, Pointer(self)));
end;

{ EIBInstall }

constructor EIBInstall.Create(IscCode: MSG_NO; IscMessage: String);
begin
   inherited Create(IscMessage);
   FIscError := IscCode;
   FInstallerError := ieSuccess;
end;

constructor EIBInstall.Create(ECode: TIBInstallerError; EMessage: String);
begin
  inherited Create(EMessage);
  FInstallerError := ECode;
  FIscError := isc_install_success;
end;

end.
