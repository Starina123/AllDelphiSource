{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{               FireDAC Firebird driver                 }
{                                                       }
{ Copyright(c) 2004-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}
{$IF DEFINED(IOS) OR DEFINED(ANDROID)}
  {$HPPEMIT LINKUNIT}
{$ELSE}
  {$IFDEF WIN32}
    {$HPPEMIT '#pragma link "FireDAC.Phys.FB.obj"'}
  {$ELSE}
    {$HPPEMIT '#pragma link "FireDAC.Phys.FB.o"'}
  {$ENDIF}
{$ENDIF}

unit FireDAC.Phys.FB;

interface

uses
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.DatS,
  FireDAC.Phys, FireDAC.Phys.IBWrapper, FireDAC.Phys.IBBase;

type
  TFDPhysFBDriverLink = class;
  TFDFBNBackup = class;
  TFDFBNRestore = class;
  TFDFBTrace = class;
  TFDFBOnlineValidate = class;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDPhysFBDriverLink = class(TFDPhysIBBaseDriverLink)
  private
    FEmbedded: Boolean;
  protected
    function GetBaseDriverID: String; override;
    function IsConfigured: Boolean; override;
    procedure ApplyTo(const AParams: IFDStanDefinition); override;
  published
    property Embedded: Boolean read FEmbedded write FEmbedded default False;
  end;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDFBNBackup = class (TFDIBService)
  private
    FLevel: Integer;
    FBackupFile: String;
    FDatabase: String;
    FOptions: TFBNBackupOptions;
    FDirect: TFBNBackupDirect;
  protected
    function CreateService(AEnv: TIBEnv): TIBService; override;
    procedure SetupService(AService: TIBService); override;
  public
    procedure Backup;
  published
    property Database: String read FDatabase write FDatabase;
    property BackupFile: String read FBackupFile write FBackupFile;
    property Level: Integer read FLevel write FLevel default 0;
    property Options: TFBNBackupOptions read FOptions write FOptions default [];
    property Direct: TFBNBackupDirect read FDirect write FDirect default ndDefault;
  end;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDFBNRestore = class (TFDIBService)
  private
    FBackupFiles: TStrings;
    FDatabase: String;
    FOptions: TFBNBackupOptions;
    procedure SetBackupFile(const AValue: TStrings);
  protected
    function CreateService(AEnv: TIBEnv): TIBService; override;
    procedure SetupService(AService: TIBService); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Restore;
  published
    property Database: String read FDatabase write FDatabase;
    property BackupFiles: TStrings read FBackupFiles write SetBackupFile;
    property Options: TFBNBackupOptions read FOptions write FOptions default [];
  end;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDFBTrace = class (TFDIBService)
  private
    FAction: TIBTraceAction;
    FSessionName: String;
    FConfig: TStrings;
    FSessionID: Integer;
    FThread: TThread;
    procedure SetConfig(const AValue: TStrings);
  protected
    function CreateService(AEnv: TIBEnv): TIBService; override;
    procedure SetupService(AService: TIBService); override;
    procedure DoProgress(AService: TIBService; const AMessage: String); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    procedure Suspend;
    procedure Resume;
    procedure List;
  published
    property SessionName: String read FSessionName write FSessionName;
    property SessionID: Integer read FSessionID write FSessionID default 0;
    property Config: TStrings read FConfig write SetConfig;
  end;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux)]
  TFDFBOnlineValidate = class (TFDIBService)
  private
    FDatabase: String;
    FIndexesInclude: String;
    FLockTimeout: Integer;
    FTablesInclude: String;
    FIndexesExclude: String;
    FTablesExclude: String;
  protected
    function CreateService(AEnv: TIBEnv): TIBService; override;
    procedure SetupService(AService: TIBService); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Validate;
  published
    property Database: String read FDatabase write FDatabase;
    property TablesInclude: String read FTablesInclude write FTablesInclude;
    property TablesExclude: String read FTablesExclude write FTablesExclude;
    property IndexesInclude: String read FIndexesInclude write FIndexesInclude;
    property IndexesExclude: String read FIndexesExclude write FIndexesExclude;
    property LockTimeout: Integer read FLockTimeout write FLockTimeout default 10;
  end;

{-------------------------------------------------------------------------------}
implementation

uses
  System.Variants, System.SysUtils, System.Generics.Collections, Data.DB,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.Stan.Option, FireDAC.Stan.Util,
    FireDAC.Stan.Consts, FireDAC.Stan.ResStrs,
  FireDAC.Phys.Intf, FireDAC.Phys.SQLGenerator, FireDAC.Phys.IBCli,
    FireDAC.Phys.IBMeta, FireDAC.Phys.FBDef;

type
  TFDPhysFBDriver = class;
  TFDPhysFBConnection = class;
  TFDPhysFBCommand = class;

  TFDPhysFBDriver = class(TFDPhysIBDriverBase)
  protected
    procedure InternalLoad; override;
    function InternalCreateConnection(AConnHost: TFDPhysConnectionHost): TFDPhysConnection; override;
    class function GetBaseDriverID: String; override;
    class function GetBaseDriverDesc: String; override;
    class function GetRDBMSKind: TFDRDBMSKind; override;
    class function GetConnectionDefParamsClass: TFDConnectionDefParamsClass; override;
    function GetConnParams(AKeys: TStrings; AParams: TFDDatSTable): TFDDatSTable; override;
  end;

  TFDPhysFBConnection = class(TFDPhysIBConnectionBase)
  private
    FCharLenMode: TFDFBCharLenMode;
    FLastServerOutput: Boolean;
    FActualServerOutput: Boolean;
    procedure GetServerOutput;
    procedure UpdateServerOutput;
  protected
    function InternalCreateCommand: TFDPhysCommand; override;
    procedure InternalConnect; override;
    procedure InternalChangePassword(const AUserName, AOldPassword, ANewPassword: String); override;
    procedure InternalAnalyzeSession(AMessages: TStrings); override;
  end;

  TFDPhysFBCommand = class(TFDPhysIBCommandBase)
  private
    procedure SetFB2BatchParamValues(AStmt: TIBStatement; ATimes, AOffset: Integer);
    procedure GetFB2BatchParamValues(AStmt: TIBStatement; ATimes, AOffset: Integer);
    function GenerateFB2BatchSQL(ATimes, AOffset: Integer): String;
    procedure DoExecuteFB2Batch(ATimes, AOffset: Integer; var ACount: TFDCounter);
    procedure GetServerFeedback;
  protected
    function CharLenInBytes: Boolean; override;
    procedure InternalExecute(ATimes, AOffset: Integer; var ACount: TFDCounter); override;
    function InternalOpen(var ACount: TFDCounter): Boolean; override;
  end;

const
  S_FD_Chars = 'Chars';
  S_FD_Bytes = 'Bytes';

{-------------------------------------------------------------------------------}
{ TFDPhysFBDriverLink                                                           }
{-------------------------------------------------------------------------------}
function TFDPhysFBDriverLink.GetBaseDriverID: String;
begin
  Result := S_FD_FBId;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBDriverLink.ApplyTo(const AParams: IFDStanDefinition);
begin
  inherited ApplyTo(AParams);
  if Embedded then
    AParams.AsYesNo[S_FD_ConnParam_FB_Embedded] := Embedded;
end;

{-------------------------------------------------------------------------------}
function TFDPhysFBDriverLink.IsConfigured: Boolean;
begin
  Result := inherited IsConfigured or Embedded;
end;

{-------------------------------------------------------------------------------}
{ TFDFBNBackup                                                                  }
{-------------------------------------------------------------------------------}
function TFDFBNBackup.CreateService(AEnv: TIBEnv): TIBService;
begin
  Result := TFBNBackup.Create(AEnv, Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBNBackup.SetupService(AService: TIBService);
begin
  inherited SetupService(AService);
  TFBNBackup(AService).DatabaseName := FDExpandStr(Database);
  TFBNBackup(AService).BackupFile := FDExpandStr(BackupFile);
  TFBNBackup(AService).Level := Level;
  TFBNBackup(AService).Options := Options;
  TFBNBackup(AService).Direct := Direct;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBNBackup.Backup;
begin
  Execute;
end;

{-------------------------------------------------------------------------------}
{ TFDFBNRestore                                                                 }
{-------------------------------------------------------------------------------}
constructor TFDFBNRestore.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBackupFiles := TFDStringList.Create;
end;

{-------------------------------------------------------------------------------}
destructor TFDFBNRestore.Destroy;
begin
  FDFreeAndNil(FBackupFiles);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBNRestore.SetBackupFile(const AValue: TStrings);
begin
  FBackupFiles.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDFBNRestore.CreateService(AEnv: TIBEnv): TIBService;
begin
  Result := TFBNRestore.Create(AEnv, Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBNRestore.SetupService(AService: TIBService);
begin
  inherited SetupService(AService);
  TFBNRestore(AService).DatabaseName := FDExpandStr(Database);
  TFBNRestore(AService).BackupFiles := BackupFiles;
  FDExpandStrs(TFBNRestore(AService).BackupFiles);
  TFBNRestore(AService).Options := Options;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBNRestore.Restore;
begin
  Execute;
end;

{-------------------------------------------------------------------------------}
{ TFDFBTraceThread                                                              }
{-------------------------------------------------------------------------------}
type
  TFDFBTraceThread = class(TThread)
  private
    FTrace: TFDFBTrace;
  protected
    procedure Execute; override;
  public
    constructor Create(ATrace: TFDFBTrace);
    destructor Destroy; override;
  end;

{-------------------------------------------------------------------------------}
constructor TFDFBTraceThread.Create(ATrace: TFDFBTrace);
begin
  FTrace := ATrace;
  FTrace.FThread := Self;
  FreeOnTerminate := True;
  inherited Create(False);
end;

{-------------------------------------------------------------------------------}
destructor TFDFBTraceThread.Destroy;
begin
  FTrace.FThread := nil;
  FTrace := nil;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTraceThread.Execute;
begin
  FTrace.FAction := taStart;
  FTrace.Execute;
end;

{-------------------------------------------------------------------------------}
{ TFDFBTrace                                                                    }
{-------------------------------------------------------------------------------}
constructor TFDFBTrace.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConfig := TFDStringList.Create;
end;

{-------------------------------------------------------------------------------}
destructor TFDFBTrace.Destroy;
begin
  if FThread <> nil then
    Stop;
  FDFreeAndNil(FConfig);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.SetConfig(const AValue: TStrings);
begin
  FConfig.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDFBTrace.CreateService(AEnv: TIBEnv): TIBService;
begin
  Result := TIBTrace.Create(AEnv, Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.SetupService(AService: TIBService);
begin
  inherited SetupService(AService);
  TIBTrace(AService).Action := FAction;
  TIBTrace(AService).SessionName := SessionName;
  TIBTrace(AService).SessionID := SessionID;
  TIBTrace(AService).Config := Config;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.DoProgress(AService: TIBService; const AMessage: String);
begin
  if TIBTrace(AService).Action = taStart then
    SessionID := TIBTrace(AService).SessionID;
  inherited DoProgress(AService, AMessage);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.Start;
begin
  CheckActive(False, False);
  if FThread <> nil then
    FDException(Self, [S_FD_LPhys, DriverLink.ActualDriverID], er_FD_IBTraceIsActive, []);
  TFDFBTraceThread.Create(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.Stop;
begin
  FAction := taStop;
  Execute;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.Suspend;
begin
  FAction := taSuspend;
  Execute;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.Resume;
begin
  FAction := taResume;
  Execute;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBTrace.List;
begin
  FAction := taList;
  Execute;
end;

{-------------------------------------------------------------------------------}
{ TFDFBOnlineValidate                                                           }
{-------------------------------------------------------------------------------}
constructor TFDFBOnlineValidate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLockTimeout := 10;
end;

{-------------------------------------------------------------------------------}
function TFDFBOnlineValidate.CreateService(AEnv: TIBEnv): TIBService;
begin
  Result := TIBOnlineValidate.Create(AEnv, Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDFBOnlineValidate.SetupService(AService: TIBService);
begin
  inherited SetupService(AService);
  TIBOnlineValidate(AService).DatabaseName := FDExpandStr(Database);
  TIBOnlineValidate(AService).TablesInclude := TablesInclude;
  TIBOnlineValidate(AService).TablesExclude := TablesExclude;
  TIBOnlineValidate(AService).IndexesInclude := IndexesInclude;
  TIBOnlineValidate(AService).IndexesExclude := IndexesExclude;
  TIBOnlineValidate(AService).LockTimeout := LockTimeout;
end;

{-------------------------------------------------------------------------------}
procedure TFDFBOnlineValidate.Validate;
begin
  Execute;
end;

{-------------------------------------------------------------------------------}
{ TFDPhysFBDriver                                                               }
{-------------------------------------------------------------------------------}
procedure TFDPhysFBDriver.InternalLoad;
var
  sHome, sLib: String;
begin
  sHome := '';
  sLib := '';
  GetVendorParams(sHome, sLib);
  FLib.LoadFB(sHome, sLib, (Params <> nil) and Params.AsYesNo[S_FD_ConnParam_FB_Embedded],
    GetThreadSafe());
end;

{-------------------------------------------------------------------------------}
function TFDPhysFBDriver.InternalCreateConnection(
  AConnHost: TFDPhysConnectionHost): TFDPhysConnection;
begin
  Result := TFDPhysFBConnection.Create(Self, AConnHost);
end;

{-------------------------------------------------------------------------------}
class function TFDPhysFBDriver.GetBaseDriverID: String;
begin
  Result := S_FD_FBId;
end;

{-------------------------------------------------------------------------------}
class function TFDPhysFBDriver.GetBaseDriverDesc: String;
begin
  Result := 'Firebird';
end;

{-------------------------------------------------------------------------------}
class function TFDPhysFBDriver.GetRDBMSKind: TFDRDBMSKind;
begin
  Result := TFDRDBMSKinds.Firebird;
end;

{-------------------------------------------------------------------------------}
class function TFDPhysFBDriver.GetConnectionDefParamsClass: TFDConnectionDefParamsClass;
begin
  Result := TFDPhysFBConnectionDefParams;
end;

{-------------------------------------------------------------------------------}
function TFDPhysFBDriver.GetConnParams(AKeys: TStrings; AParams: TFDDatSTable): TFDDatSTable;
var
  oView: TFDDatSView;
begin
  Result := inherited GetConnParams(AKeys, AParams);
  Result.Rows.Add([Unassigned, S_FD_ConnParam_FB_CharLenMode, S_FD_Chars + ';' + S_FD_Bytes, S_FD_Chars, S_FD_ConnParam_FB_CharLenMode, -1]);
  oView := Result.Select('Name=''' + S_FD_ConnParam_Common_Database + '''');
  if oView.Rows.Count = 1 then begin
    oView.Rows[0].BeginEdit;
    oView.Rows[0].SetValues('Type', '@F:Firebird Database|*.fdb;*.fb');
    oView.Rows[0].EndEdit;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDPhysFBConnection                                                           }
{-------------------------------------------------------------------------------}
function TFDPhysFBConnection.InternalCreateCommand: TFDPhysCommand;
begin
  Result := TFDPhysFBCommand.Create(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBConnection.InternalConnect;
begin
  inherited InternalConnect;
  FCharLenMode := TFDPhysFBConnectionDefParams(ConnectionDef.Params).CharLenMode;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBConnection.InternalChangePassword(const AUserName,
  AOldPassword, ANewPassword: String);
begin
  if (ServerBrand = ibFirebird) and (ServerVersion >= ivFB020500) then
    InternalExecuteDirect('ALTER USER ' + AUserName + ' SET PASSWORD ''' +
      ANewPassword + '''', TransactionObj)
  else
    inherited InternalChangePassword(AUserName, AOldPassword, ANewPassword);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBConnection.UpdateServerOutput;
const
  C_Proc: array [Boolean] of String = ('DISABLE', 'ENABLE');
begin
  if FLastServerOutput = (FOptions.ResourceOptions as TFDTopResourceOptions).ServerOutput then
    Exit;
  FLastServerOutput := not FLastServerOutput;
  if FActualServerOutput <> FLastServerOutput then
    try
      InternalExecuteDirect('EXECUTE PROCEDURE FB$OUT.' + C_Proc[FLastServerOutput], TransactionObj);
      FActualServerOutput := FLastServerOutput;
    except
      // FB$OUT may not exist in normal database
      FActualServerOutput := False;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBConnection.GetServerOutput;
var
  oTX: TIBTransaction;
  oStmt: TIBStatement;
  s: String;
  pData: Pointer;
  iLen: LongWord;
  lCommit: Boolean;
begin
  if not FActualServerOutput then
    Exit;
  oTX := TFDPhysIBTransactionBase(TransactionObj).IBTransaction;
  lCommit := oTX.FTRHandle = nil;
  if lCommit then
    oTX.StartTransaction;
  try
    oStmt := TIBStatement.Create(IBDatabase, TFDPhysIBTransactionBase(TransactionObj).IBTransaction, Self);
    try
      oStmt.Prepare('EXECUTE PROCEDURE FB$OUT.GET_LINES');
      oStmt.InVars.VarCount := 0;
      oStmt.OutVars.VarCount := 1;
      oStmt.OutVars[0].SQLDataType := SQL_VARYING;
      oStmt.OutVars[0].sqlsubtype := csIDFBUtf8;
      oStmt.OutVars[0].sqllen := (FOptions.ResourceOptions as TFDTopResourceOptions).ServerOutputSize;
      oStmt.Open(True);
      if oStmt.Fetch and oStmt.OutVars[0].GetData(0, pData, iLen, True) and (iLen > 0) then begin
        SetString(s, PChar(pData), iLen);
        IBEnv.Error.CheckAllocateInfo;
        IBEnv.Error.Info.AppendError(0, 0, s, '', ekServerOutput, -1, -1);
      end;
    finally
      FDFree(oStmt);
    end;
  finally
    if lCommit then
      oTX.Commit;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBConnection.InternalAnalyzeSession(AMessages: TStrings);
begin
  inherited InternalAnalyzeSession(AMessages);

  // 3. Use FB driver to connect to Firebird server with fbclient.dll
  if not (ServerBrand in [ibFirebird, ibYaffil]) then
    AMessages.Add(S_FD_FBWarnNotFBSrv);
  if not (IBEnv.Lib.Brand in [ibFirebird, ibYaffil]) then
    AMessages.Add(S_FD_FBWarnNotFBClnt);
end;

{-------------------------------------------------------------------------------}
{ TFDPhysFBCommand                                                              }
{-------------------------------------------------------------------------------}
function TFDPhysFBCommand.CharLenInBytes: Boolean;
begin
  Result := TFDPhysFBConnection(IBConnection).FCharLenMode = clmBytes;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBCommand.SetFB2BatchParamValues(AStmt: TIBStatement; ATimes, AOffset: Integer);
var
  oParams: TFDParams;
  oFmtOpts: TFDFormatOptions;
  oParam: TFDParam;
  iArraySize, i, j: Integer;
  pParInfo: PFDIBParInfoRec;
  oVar: TIBVariable;
  eFDType: TFDDataType;
begin
  FHasIntStreams := False;
  oParams := GetParams;
  if oParams.Count = 0 then
    Exit;

  oFmtOpts := GetOptions.FormatOptions;
  iArraySize := oParams.ArraySize;
  if ATimes < iArraySize then
    iArraySize := ATimes;

  for i := 0 to Length(FParInfos) - 1 do begin
    pParInfo := @FParInfos[i];
    if pParInfo^.FSrcDataType = dtGUID then
      eFDType := dtGUID
    else
      eFDType := pParInfo^.FDestDataType;
    if pParInfo^.FParamIndex <> -1 then begin
      oParam := oParams[pParInfo^.FParamIndex];
      if (pParInfo^.FVar <> nil) and
         (oParam.DataType <> ftCursor) and
         (oParam.ParamType in [ptInput, ptInputOutput, ptUnknown]) then begin
        CheckParamMatching(oParam, pParInfo^.FSrcFieldType, pParInfo^.FParamType,
          pParInfo^.FSrcPrec);
        for j := AOffset to iArraySize - 1 do begin
          oVar := AStmt.InVars[LongWord(FStmt.InVars.VarCount *
            (j - AOffset)) + pParInfo^.FVar.Index];
          oVar.FDDataType := eFDType;
          SetParamValue(oFmtOpts, oParam, oVar, pParInfo, 0, j);
        end;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBCommand.GetFB2BatchParamValues(AStmt: TIBStatement; ATimes, AOffset: Integer);
var
  oParams: TFDParams;
  oFmtOpts: TFDFormatOptions;
  oParam: TFDParam;
  iArraySize, i, j: Integer;
  pParInfo: PFDIBParInfoRec;
begin
  oParams := GetParams;
  if oParams.Count = 0 then
    Exit;

  oFmtOpts := GetOptions.FormatOptions;
  iArraySize := oParams.ArraySize;
  if ATimes < iArraySize then
    iArraySize := ATimes;

  for i := 0 to Length(FParInfos) - 1 do begin
    pParInfo := @FParInfos[i];
    if pParInfo^.FParamIndex <> -1 then begin
      oParam := oParams[pParInfo^.FParamIndex];
      if (pParInfo^.FVar <> nil) and
         (oParam.DataType <> ftCursor) and
         (oParam.ParamType in [ptOutput, ptResult, ptInputOutput]) then begin
        CheckParamMatching(oParam, pParInfo^.FSrcFieldType, pParInfo^.FParamType,
          pParInfo^.FSrcPrec);
        for j := AOffset to iArraySize - 1 do
          GetParamValue(oFmtOpts, oParam, AStmt.OutVars[LongWord(FStmt.OutVars.VarCount *
            (j - AOffset)) + pParInfo^.FVar.Index], pParInfo, 0, j);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDPhysFBCommand.GenerateFB2BatchSQL(ATimes, AOffset: Integer): String;
var
  iCurPos, iRow, iVar, iPrev, i: Integer;
  lInStr1, lInStr2, lInComment: Boolean;

  procedure W(const AStrs: array of String);
  var
    i: Integer;
  begin
    for i := Low(AStrs) to High(AStrs) do begin
      while iCurPos + Length(AStrs[i]) > Length(Result) do
        SetLength(Result, Length(Result) * 2);
      Move(PChar(AStrs[i])^, (PChar(Result) + iCurPos)^, Length(AStrs[i]) * SizeOf(Char));
      Inc(iCurPos, Length(AStrs[i]));
    end;
  end;

  procedure AppendDBCmdText;
  begin
    while iCurPos + i - iPrev > Length(Result) do
      SetLength(Result, Length(Result) * 2);
    Move((PChar(FDbCommandText) + iPrev - 1)^, (PChar(Result) + iCurPos)^, (i - iPrev) * SizeOf(Char));
    Inc(iCurPos, i - iPrev);
    iPrev := i + 1;
  end;

  procedure AppendParameter(const ALetter: String; ARowIndex: Integer; AVar: TIBVariable);
  var
    iPrec, iLen: Integer;
    lUTF8: Boolean;
  begin
    W([ALetter, IntToStr(ARowIndex - AOffset), '_', IntToStr(AVar.Index), ' ']);
    case AVar.SQLDataType of
    SQL_NULL:
      W(['CHAR(1)']);
    SQL_TEXT:
      begin
        lUTF8 := IBConnection.IBEnv.Lib.IsUTF8(AVar.sqlsubtype);
        if lUTF8 then
          iLen := (AVar.sqllen + (C_FD_MaxUTF8Len - 1)) div C_FD_MaxUTF8Len
        else
          iLen := AVar.sqllen;
        W(['CHAR(', IntToStr(iLen), ')']);
        if lUTF8 then
          W([' CHARACTER SET ', IBConnection.IBEnv.Lib.GetUTF8CSName(AVar.sqlsubtype)])
        else if AVar.sqlsubtype = csIDOctets then
          W([' CHARACTER SET OCTETS']);
      end;
    SQL_VARYING:
      begin
        lUTF8 := IBConnection.IBEnv.Lib.IsUTF8(AVar.sqlsubtype);
        if lUTF8 then
          iLen := (AVar.sqllen + (C_FD_MaxUTF8Len - 1)) div C_FD_MaxUTF8Len
        else
          iLen := AVar.sqllen;
        W(['VARCHAR(', IntToStr(iLen), ')']);
        if lUTF8 then
          W([' CHARACTER SET ', IBConnection.IBEnv.Lib.GetUTF8CSName(AVar.sqlsubtype)])
        else if AVar.sqlsubtype = csIDOctets then
          W([' CHARACTER SET OCTETS']);
      end;
    SQL_SHORT:
      if AVar.sqlscale = 0 then
        W(['SMALLINT'])
      else begin
        iPrec := AVar.sqlprecision;
        if iPrec = 0 then
          iPrec := 4;
        W(['DECIMAL(', IntToStr(iPrec), ',',
                       IntToStr(-AVar.sqlscale), ')']);
      end;
    SQL_LONG:
      if AVar.sqlscale = 0 then
        W(['INTEGER'])
      else begin
        iPrec := AVar.sqlprecision;
        if iPrec = 0 then
          iPrec := 9;
        W(['DECIMAL(', IntToStr(iPrec), ',',
                       IntToStr(-AVar.sqlscale), ')']);
      end;
    SQL_INT64:
      if AVar.sqlscale = 0 then
        W(['BIGINT'])
      else begin
        iPrec := AVar.sqlprecision;
        if iPrec = 0 then
          iPrec := 18;
        W(['DECIMAL(', IntToStr(iPrec), ',',
                       IntToStr(-AVar.sqlscale), ')']);
      end;
    SQL_FLOAT:
      W(['FLOAT']);
    SQL_DOUBLE,
    SQL_D_FLOAT:
      W(['DOUBLE PRECISION']);
    SQL_TYPE_TIME:
      W(['TIME']);
    SQL_TYPE_DATE:
      W(['DATE']);
    SQL_TIMESTAMP:
      W(['TIMESTAMP']);
    SQL_BLOB:
      W(['BLOB']);
    SQL_BOOLEAN_FB:
      W(['BOOLEAN'])
    else
      // SQL_ARRAY, SQL_QUAD, SQL_BOOLEAN_IB
      ASSERT(False);
    end;
  end;

begin
  iCurPos := 0;
  SetLength(Result, 16384);
  W(['EXECUTE BLOCK(']);
  for iRow := AOffset to ATimes - 1 do begin
    for iVar := 0 to FStmt.InVars.VarCount - 1 do begin
      if not ((iRow = AOffset) and (iVar = 0)) then
        W([',']);
      AppendParameter('I', iRow, FStmt.InVars[iVar]);
      W(['=?']);
    end;
    W([#10]);
  end;
  W([')'#10]);
  if FStmt.OutVars.VarCount > 0 then begin
    W(['RETURNS (']);
    for iRow := AOffset to ATimes - 1 do begin
      for iVar := 0 to FStmt.OutVars.VarCount - 1 do begin
        if not ((iRow = AOffset) and (iVar = 0)) then
          W([',']);
        AppendParameter('O', iRow, FStmt.OutVars[iVar]);
      end;
      W([#10]);
    end;
    W([')'#10]);
  end;
  W(['AS'#10'BEGIN'#10]);
  for iRow := AOffset to ATimes - 1 do begin
    iPrev := 1;
    lInStr1 := False;
    lInStr2 := False;
    lInComment := False;
    i := 1;
    iVar := 0;
    while i <= Length(FDbCommandText) do begin
      case FDbCommandText[i] of
      '''':
        if not lInStr2 and not lInComment then
          if FDbCommandText[i + 1] <> '''' then
            lInStr1 := not lInStr1
          else
            Inc(i);
      '"':
        if not lInStr1 and not lInComment then
          if FDbCommandText[i + 1] <> '"' then
            lInStr2 := not lInStr2
          else
            Inc(i);
      '/':
        if not lInStr1 and not lInStr2 then
          if FDbCommandText[i + 1] = '*' then begin
            lInComment := True;
            Inc(i);
          end;
      '*':
        if not lInStr1 and not lInStr2 then
          if FDbCommandText[i + 1] = '/' then begin
            lInComment := False;
            Inc(i);
          end;
      '?':
        if not lInStr1 and not lInStr2 and not lInComment then begin
          AppendDBCmdText;
          W([':I', IntToStr(iRow - AOffset), '_', IntToStr(iVar)]);
          Inc(iVar);
        end;
      end;
      Inc(i);
    end;
    AppendDBCmdText;
    if FStmt.OutVars.VarCount > 0 then begin
      // If EXECUTE PROCEDURE -> RETURNING_VALUES :o1, :o2, ...
      // If INSERT/UPDATE/DELETE RETURNING f1, f2, ... -> INTO :o1, :o2, ...
      if GetCommandKind = skStoredProcNoCrs then
        W([' RETURNING_VALUES '])
      else
        W([' INTO ']);
      for iVar := 0 to FStmt.OutVars.VarCount - 1 do begin
        if iVar > 0 then
          W([',']);
        W([':O', IntToStr(iRow - AOffset), '_', IntToStr(iVar)]);
      end;
    end;
    W([';'#10]);
  end;
  if FStmt.OutVars.VarCount > 0 then
    W(['SUSPEND;']);
  W(['END']);
  SetLength(Result, iCurPos);
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBCommand.DoExecuteFB2Batch(ATimes, AOffset: Integer;
  var ACount: TFDCounter);
var
  sBatchSQL: String;
  iBatchSize, iBatchSize2: LongWord;
  iInVarsCount, iOutVarsCount: Smallint;
  iCurTimes, iCurOffset, iLastBatchSize: Integer;
  oStmt: TIBStatement;
  oResOpts: TFDResourceOptions;
begin
  oResOpts := FOptions.ResourceOptions;
  // total size of XSQLVAR, which will be send to server in single packet
  iBatchSize := FStmt.MaximumBatchSize;

  // total count of XSQLVAR's. UPDATE OR INSERT command will use few times
  // more variables, than actually the command text has
  iInVarsCount := FStmt.InVars.VarCount;
  case GetCommandKind of
  skMerge:  iInVarsCount := iInVarsCount * 5;
  skUpdate: iInVarsCount := iInVarsCount * 3;
  end;
  iOutVarsCount := FStmt.OutVars.VarCount;

  // total size of SQL command, which will be send to server
  iBatchSize2 := 32700 div
    (Length(FDBCommandText) +
     iInVarsCount * 11 + 2 + iInVarsCount * (11 + 15 + 3) +
     iOutVarsCount * 11 + 2 + iOutVarsCount * (11 + 15 + 3));
  if iBatchSize2 < iBatchSize then
    iBatchSize := iBatchSize2;

  // maximum number of contexts
  if iBatchSize > 255 then
    iBatchSize := 255;

  if iBatchSize > LongWord(oResOpts.ArrayDMLSize) then
    iBatchSize := LongWord(oResOpts.ArrayDMLSize);

  // If block will have only single command, then go by standard
  // route - execute command once for each param array item.
  if iBatchSize <= 1 then begin
    DoExecute(ATimes, AOffset, ACount, False);
    Exit;
  end;

  iCurOffset := AOffset;
  iCurTimes := LongWord(AOffset) + iBatchSize;
  iLastBatchSize := 0;

  oStmt := TIBStatement.Create(IBConnection.IBDatabase,
    TFDPhysIBTransactionBase(FTransactionObj).IBTransaction, Self);
  try
    SetupStatement(oStmt);

    while iCurOffset < ATimes do begin
      if iCurTimes > ATimes then
        iCurTimes := ATimes;

      if iLastBatchSize <> iCurTimes - iCurOffset then begin
        sBatchSQL := GenerateFB2BatchSQL(iCurTimes, iCurOffset);
        oStmt.Unprepare;
        oStmt.Prepare(sBatchSQL);
        if FStmt.OutVars.VarCount > 0 then
          oStmt.DescribeSelect;
        FStmt.OutVars.RowCount := 1;
        if FStmt.InVars.VarCount > 0 then
          oStmt.DescribeBind;
        FStmt.InVars.RowCount := 1;
        iLastBatchSize := iCurTimes - iCurOffset;
      end;

      SetFB2BatchParamValues(oStmt, iCurTimes, iCurOffset);
      CheckArrayDMLWithIntStr(FHasIntStreams, iCurTimes, iCurOffset);
      oStmt.Execute(True);
      GetFB2BatchParamValues(oStmt, iCurTimes, iCurOffset);
      Inc(ACount, oStmt.RowsAffected);
      oStmt.Close;

      Inc(iCurOffset, iBatchSize);
      Inc(iCurTimes, iBatchSize);
    end;

  finally
    FDFree(oStmt);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBCommand.GetServerFeedback;
begin
  case FStmt.sql_stmt_type of
  isc_info_sql_stmt_select,
  isc_info_sql_stmt_insert,
  isc_info_sql_stmt_update,
  isc_info_sql_stmt_delete,
  isc_info_sql_stmt_exec_procedure,
  isc_info_sql_stmt_select_for_upd:
    TFDPhysFBConnection(FConnectionObj).GetServerOutput;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysFBCommand.InternalExecute(ATimes, AOffset: Integer;
  var ACount: TFDCounter);
begin
  if GetMetaInfoKind = mkNone then
    TFDPhysFBConnection(FConnectionObj).UpdateServerOutput;
  try
    CheckSPPrepared(skStoredProcNoCrs);
    CheckParamInfos;
    ACount := 0;
    if (ATimes - AOffset > 1) and
       (IBConnection.ServerBrand = ibFirebird) and (IBConnection.ServerVersion >= ivFB020000) then
      DoExecuteFB2Batch(ATimes, AOffset, ACount)
    else
      DoExecute(ATimes, AOffset, ACount, False);
  except
    on E: EFDDBEngineException do begin
      if not (E.Kind in [ekCmdAborted, ekServerGone]) then
        if GetMetaInfoKind = mkNone then
          GetServerFeedback;
      raise;
    end;
  end;
  if GetMetaInfoKind = mkNone then
    GetServerFeedback;
end;

{-------------------------------------------------------------------------------}
function TFDPhysFBCommand.InternalOpen(var ACount: TFDCounter): Boolean;
begin
  if GetMetaInfoKind = mkNone then
    TFDPhysFBConnection(FConnectionObj).UpdateServerOutput;
  try
    Result := inherited InternalOpen(ACount);
  except
    on E: EFDDBEngineException do begin
      if not (E.Kind in [ekCmdAborted, ekServerGone]) then
        if GetMetaInfoKind = mkNone then
          GetServerFeedback;
      raise;
    end;
  end;
  if GetMetaInfoKind = mkNone then
    GetServerFeedback;
end;

{-------------------------------------------------------------------------------}
initialization
  FDRegisterDriverClass(TFDPhysFBDriver);

finalization
  FDUnregisterDriverClass(TFDPhysFBDriver);

end.
