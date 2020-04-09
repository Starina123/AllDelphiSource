

{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Connection classes                              }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit MConnect;

interface

uses
  Messages, Windows, SysUtils, Classes, StdVcl, DBClient, ActiveX, ComObj;

type

  { TCustomObjectBroker }

  TCustomObjectBroker = class(TComponent)
  public
    procedure SetConnectStatus(ComputerName: string; Success: Boolean); virtual; abstract;
    function GetComputerForGUID(GUID: TGUID): string; virtual; abstract;
    function GetComputerForProgID(const ProgID): string; virtual; abstract;
    function GetPortForComputer(const ComputerName: string): Integer; virtual; abstract;
  end;

  { TDispatchConnection }

  TLoginEvent = procedure(Sender: TObject; Username, Password: string) of object;
  TGetUsernameEvent = procedure(Sender: TObject; var Username: string) of object;

  TDispatchConnection = class(TCustomRemoteServer)
  private
    FServerGUID: TGUID;
    FServerName: string;
    FAppServer: Variant;
    FRegStdVclFailed: Boolean;
    FLoginPrompt: Boolean;
    FObjectBroker: TCustomObjectBroker;
    FOnLogin: TLoginEvent;
    FOnGetUsername: TGetUsernameEvent;
    function GetServerGUID: string;
    procedure SetServerGUID(const Value: string);
    procedure SetServerName(const Value: string);
    procedure SetObjectBroker(Value: TCustomObjectBroker);
  protected
    function GetAppServer: Variant; virtual;
    procedure SetAppServer(Value: Variant); virtual;
    procedure DoDisconnect; override;
    function GetConnected: Boolean; override;
    procedure SetConnected(Value: Boolean); override;
    procedure GetProviderNames(Proc: TGetStrProc); override;
    function GetServerCLSID: TGUID;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property ObjectBroker: TCustomObjectBroker read FObjectBroker write SetObjectBroker;
  public
    constructor Create(AOwner: TComponent); override;
    function GetProvider(const ProviderName: string): IProvider; override;
    property AppServer: Variant read GetAppServer;
  published
    property Connected;
    property LoginPrompt: Boolean read FLoginPrompt write FLoginPrompt default False;
    property ServerGUID: string read GetServerGUID write SetServerGUID;
    property ServerName: string read FServerName write SetServerName;
    property AfterConnect;
    property AfterDisconnect;
    property BeforeConnect;
    property BeforeDisconnect;
    property OnGetUsername: TGetUsernameEvent read FOnGetUsername write FOnGetUsername;
    property OnLogin: TLoginEvent read FOnLogin write FOnLogin;
  end;

  { TCOMConnection }

  TCOMConnection = class(TDispatchConnection)
  protected
    procedure SetConnected(Value: Boolean); override;
    procedure DoConnect; override;
  end;

  { TDCOMConnection }

  TDCOMConnection = class(TCOMConnection)
  private
    FComputerName: string;
    procedure SetComputerName(const Value: string);
    function IsComputerNameStored: Boolean;
  protected
    procedure DoConnect; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ComputerName: string read FComputerName write SetComputerName stored IsComputerNameStored;
    property ObjectBroker;
  end;

  { TOLEnterpriseConnection }

  TOLEnterpriseConnection = class(TCOMConnection)
  private
    FComputerName: string;
    FBrokerName: string;
    procedure SetComputerName(const Value: string);
    procedure SetBrokerName(const Value: string);
  protected
    procedure DoConnect; override;
  published
    property ComputerName: string read FComputerName write SetComputerName;
    property BrokerName: string read FBrokerName write SetBrokerName;
  end;

  { TDispatchProvider }

  TDispatchProvider = class(TInterfacedObject, IProvider, ISupportErrorInfo)
  private
    FProvider: IProviderDisp;
    { IDispatch }
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
    { IProvider }
    function Get_Data: OleVariant; safecall;
    function ApplyUpdates(Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer): OleVariant; safecall;
    function GetMetaData: OleVariant; safecall;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; safecall;
    function DataRequest(Input: OleVariant): OleVariant; safecall;
    function Get_Constraints: WordBool; safecall;
    procedure Set_Constraints(Value: WordBool); safecall;
    procedure Reset(MetaData: WordBool); safecall;
    procedure SetParams(Values: OleVariant); safecall;
    { ISupportErrorInfo }
    function InterfaceSupportsErrorInfo(const iid: TIID): HResult; stdcall;
  public
    constructor Create(const Provider: IProviderDisp);
    function SafeCallException(ExceptObject: TObject;
      ExceptAddr: Pointer): HResult; override;
  end;

implementation

uses
  Forms, Registry, MidConst, DBLogDlg;

{ TDispatchProvider }

constructor TDispatchProvider.Create(const Provider: IProviderDisp);
begin
  FProvider := Provider;
end;

{ TDispatchProvider.IDispatch }

function TDispatchProvider.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := IDispatch(FProvider).GetTypeInfoCount(Count);
end;

function TDispatchProvider.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := IDispatch(FProvider).GetTypeInfo(Index, LocaleID, TypeInfo);
end;

function TDispatchProvider.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := IDispatch(FProvider).GetIDsOfNames(IID, Names, NameCount, LocaleID, DispIDs);
end;

function TDispatchProvider.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  Result := IDispatch(FProvider).Invoke(DispID, IID, LocaleID, Flags, Params,
    VarResult, ExcepInfo, ArgErr);
end;

{ TDispatchProvider.IProvider }

function TDispatchProvider.Get_Data: OleVariant;
begin
  Result := FProvider.Data;
end;

function TDispatchProvider.ApplyUpdates(Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer): OleVariant;
begin
  Result := FProvider.ApplyUpdates(Delta, MaxErrors, ErrorCount);
end;

function TDispatchProvider.GetMetaData: OleVariant;
begin
  Result := FProvider.GetMetaData;
end;

function TDispatchProvider.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
begin
  Result := FProvider.GetRecords(Count, RecsOut);
end;

function TDispatchProvider.DataRequest(Input: OleVariant): OleVariant;
begin
  Result := FProvider.DataRequest(Input);
end;

function TDispatchProvider.Get_Constraints: WordBool;
begin
  Result := FProvider.Constraints;
end;

procedure TDispatchProvider.Set_Constraints(Value: WordBool);
begin
  FProvider.Constraints := Value;
end;

procedure TDispatchProvider.Reset(MetaData: WordBool);
begin
  FProvider.Reset(MetaData);
end;

procedure TDispatchProvider.SetParams(Values: OleVariant); safecall;
begin
  FProvider.SetParams(Values);
end;

{ TDispatchProvider.ISupportErrorInfo }

function TDispatchProvider.InterfaceSupportsErrorInfo(const iid: TIID): HResult;
begin
  if IsEqualGUID(IProvider, iid) then
    Result := S_OK else
    Result := S_FALSE;
end;

function TDispatchProvider.SafeCallException(ExceptObject: TObject;
  ExceptAddr: Pointer): HResult;
begin
  Result := HandleSafeCallException(ExceptObject, ExceptAddr, IProvider, '', '');
end;

{ TDispatchConnection }

constructor TDispatchConnection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLoginPrompt := False;
end;

procedure TDispatchConnection.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FObjectBroker) then
    FObjectBroker := nil;
end;

procedure TDispatchConnection.SetObjectBroker(Value: TCustomObjectBroker);
begin
  if Value = FObjectBroker then Exit;
  if Assigned(Value) then
    Value.FreeNotification(Self);
  FObjectBroker := Value;
end;

function TDispatchConnection.GetServerGUID: string;
begin
  if (FServerGUID.D1 <> 0) or (FServerGUID.D2 <> 0) or (FServerGUID.D3 <> 0) then
    Result := GUIDToString(FServerGUID) else
    Result := '';
end;

procedure TDispatchConnection.SetServerGUID(const Value: string);
var
  ServerName: PWideChar;
begin
  if not (csLoading in ComponentState) then
    SetConnected(False);
  if Value = '' then
    FillChar(FServerGUID, 0, SizeOf(FServerGUID))
  else
  begin
    FServerGUID := StringToGUID(Value);
    if ProgIDFromCLSID(FServerGUID, ServerName) = 0 then
    begin
      FServerName := ServerName;
      CoTaskMemFree(ServerName);
    end;
  end;
end;

procedure TDispatchConnection.SetServerName(const Value: string);
begin
  if Value <> FServerName then
  begin
    if not (csLoading in ComponentState) then
    begin
      SetConnected(False);
      if CLSIDFromProgID(PWideChar(WideString(Value)), FServerGUID) <> 0 then
        FillChar(FServerGUID, 0, SizeOf(FServerGUID));
    end;
    FServerName := Value;
  end;
end;

function TDispatchConnection.GetConnected: Boolean;
begin
  Result := (not VarIsNull(AppServer) and (IDispatch(AppServer) <> nil));
end;

procedure TDispatchConnection.SetConnected(Value: Boolean);
var
  Username, Password: string;
  Login: Boolean;
begin
  Login := LoginPrompt and Value and not Connected;
  if Login then
  begin
    if Assigned(FOnGetUsername) then FOnGetUsername(Self, Username);
    if not RemoteLoginDialog(Username, Password) then Exit;
  end;
  inherited SetConnected(Value);
  if Login and Connected then
    if Assigned(FOnLogin) then FOnLogin(Self, Username, Password);
end;

procedure TDispatchConnection.DoDisconnect;
begin
  SetAppServer(NULL);
end;

function TDispatchConnection.GetAppServer: Variant;
begin
  Result := FAppServer;
end;

procedure TDispatchConnection.SetAppServer(Value: Variant);
begin
  FAppServer := Value;
end;

function TDispatchConnection.GetProvider(const ProviderName: string): IProvider;

  function GetProperty(Obj: IDispatch; const Name: string): OleVariant;
  var
    ID: Integer;
    WideName: WideString;
    DispParams: TDispParams;
    ExcepInfo: TExcepInfo;
    Status: Integer;
  begin
    WideName := Name;
    if Obj.GetIDsOfNames(GUID_NULL, @WideName, 1, 0, @ID) <> 0 then
      raise Exception.CreateFmt(SInvalidProviderName, [Name]);
    FillChar(DispParams, SizeOf(DispParams), 0);
    FillChar(ExcepInfo, SizeOf(ExcepInfo), 0);
    Status := Obj.Invoke(ID, GUID_NULL, 0, DISPATCH_PROPERTYGET, DispParams,
      @Result, @ExcepInfo, nil);
    if Status <> 0 then DispatchInvokeError(Status, ExcepInfo);
  end;

var
  ProviderDispatch: IDispatch;
  QIResult: HResult;
begin
  Connected := True;
  ProviderDispatch := IDispatch(GetProperty(IDispatch(AppServer), ProviderName));
  QIResult := ProviderDispatch.QueryInterface(IProvider, Result);
  if (QIResult = REGDB_E_IIDNOTREG) and not FRegStdVclFailed then
  try
    RegisterComServer('STDVCL40.DLL');
    QIResult := ProviderDispatch.QueryInterface(IProvider, Result);
  except
    FRegStdVclFailed := True;
  end;
  if QIResult <> S_OK then
    Result := TDispatchProvider.Create(IProviderDisp(ProviderDispatch));
end;

procedure TDispatchConnection.GetProviderNames(Proc: TGetStrProc);
var
  List: Variant;
  I: Integer;
begin
  Connected := True;
  VarClear(List);
  try
    List := AppServer.GetProviderNames;
  except
    { Assume any errors means the list is not available. }
  end;
  if VarIsArray(List) and (VarArrayDimCount(List) = 1) then
    for I := VarArrayLowBound(List, 1) to VarArrayHighBound(List, 1) do
      Proc(List[I]);
end;

function TDispatchConnection.GetServerCLSID: TGUID;
begin
  if IsEqualGuid(FServerGuid, GUID_NULL) then
  begin
    if FServerName = '' then
      raise Exception.CreateFmt(SServerNameBlank, [Name]);
    Result := ProgIDToClassID(FServerName);
  end else
    Result := FServerGuid;
end;

{ TCOMConnection }

procedure TCOMConnection.SetConnected(Value: Boolean);
begin
  if (not (csReading in ComponentState)) and
     (Value and not Connected) and
     IsEqualGuid(GetServerCLSID, GUID_NULL) then
    raise Exception.CreateFmt(SServerNameBlank, [Name]);
  inherited SetConnected(Value);
end;

procedure TCOMConnection.DoConnect;
begin
  SetAppServer(CreateComObject(GetServerCLSID) as IDispatch);
end;

{ TDCOMConnection }

constructor TDCOMConnection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TDCOMConnection.SetComputerName(const Value: string);
begin
  if Value <> FComputerName then
  begin
    SetConnected(False);
    FComputerName := Value;
  end;
end;

function TDCOMConnection.IsComputerNameStored: Boolean;
begin
  Result := (FObjectBroker = nil) and (ComputerName <> '');
end;

procedure TDCOMConnection.DoConnect;
begin
  if (FObjectBroker <> nil) then
  begin
    repeat
      if FComputerName = '' then
        FComputerName := FObjectBroker.GetComputerForGUID(GetServerCLSID);
      try
        SetAppServer(CreateRemoteComObject(ComputerName, GetServerCLSID) as IDispatch);
        FObjectBroker.SetConnectStatus(ComputerName, True);
      except
        FObjectBroker.SetConnectStatus(ComputerName, False);
        FComputerName := '';
      end;
    until Connected;
  end else if (ComputerName <> '') then
    SetAppServer(CreateRemoteComObject(ComputerName, GetServerCLSID) as IDispatch) else
    inherited DoConnect;
end;

{ TOLEnterpriseConnection }

procedure TOLEnterpriseConnection.SetComputerName(const Value: string);
begin
  if Value <> FComputerName then
  begin
    SetConnected(False);
    FComputerName := Value;
  end;
  if Value <> '' then
    FBrokerName := '';
end;

procedure TOLEnterpriseConnection.SetBrokerName(const Value: string);
begin
  if Value <> FBrokerName then
  begin
    SetConnected(False);
    FBrokerName := Value;
  end;
  if Value <> '' then
    FComputerName := '';
end;

procedure TOLEnterpriseConnection.DoConnect;
var
  Reg: TRegistry;

  procedure WriteValue(ValueName, Value: String);
  begin
    if not Reg.ValueExists(ValueName) then
      Reg.WriteString(ValueName, Value);
  end;

const
  AgentDLL = 'oleaan40.dll';
var
  InprocKey, Inproc2Key, DllName, TempStr, TempStr2, ProgID: String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('Software\OpenEnvironment\InstallRoot', False) then
    begin
      DllName := Reg.ReadString('');
      Reg.CloseKey;
      if Reg.OpenKey('Software\OpenEnvironment\OLEnterprise\AutomationAgent', False) then
      begin 
        if not IsPathDelimiter(DllName, Length(DllName)) then DllName := DllName + '\';
        DllName := DllName + Reg.ReadString(''); 
        Reg.CloseKey;
      end else
      begin
        if not IsPathDelimiter(DllName, Length(DllName)) then DllName := DllName + '\';
        DllName := DllName + AgentDLL;
      end;
    end else
      DllName := AgentDLL; { AgentDLL must be in the path }
    Reg.RootKey := HKEY_CLASSES_ROOT;
    InprocKey := Format('CLSID\%s\InprocServer32', [ServerGUID]);
    Inproc2Key := Format('CLSID\%s\_InprocServer32', [ServerGUID]);
    if ComputerName = '' then {Run via COM}
    begin
      if Reg.OpenKey(InprocKey, False) then
      begin
        TempStr := Reg.ReadString('');
        Reg.CloseKey;
        if (AnsiPos(AgentDLL, AnsiLowerCase(TempStr)) > 0) or
           (AnsiPos(AnsiLowerCase(ExtractFileName(DllName)), AnsiLowerCase(TempStr)) > 0) then
        begin
          if Reg.OpenKey(Inproc2Key, False) then
          begin
            TempStr2 := Reg.ReadString('');
            Reg.WriteString('',TempStr);
            Reg.CloseKey;
            Reg.OpenKey(InprocKey, False);
            Reg.WriteString('',TempStr2);
            Reg.CloseKey;
          end else
            Reg.DeleteKey(InprocKey);
        end;
      end;
    end else
    begin
      if Reg.OpenKey(InprocKey, False) then
      begin
        TempStr := Reg.ReadString('');
        Reg.CloseKey;
        if (AnsiPos(AgentDLL, AnsiLowerCase(TempStr)) = 0) and
           (AnsiPos(AnsiLowerCase(ExtractFileName(DllName)), AnsiLowerCase(TempStr)) = 0) then
          Reg.MoveKey(InprocKey, Inproc2Key, True);
      end;
      Reg.OpenKey(InprocKey, True);
      Reg.WriteString('',DllName);
      Reg.WriteString('ThreadingModel','Apartment');
      Reg.CloseKey;
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey('Software\OpenEnvironment\OLEnterprise\Dap\DCEApp',True);
      if BrokerName <> '' then
      begin
        Reg.WriteString('Broker',Format('ncacn_ip_tcp:%s',[BrokerName]));
        WriteValue('LogLevel', '0');
        WriteValue('LogFile','');
        WriteValue('UseNaming','1');
        WriteValue('UseSecurity','1');
      end else
        Reg.WriteString('Broker','none');
      Reg.CloseKey;
      Reg.RootKey := HKEY_CLASSES_ROOT;
      if Reg.OpenKey(Format('CLSID\%s\ProgID',[ServerGUID]), False) then
      begin
        ProgID := Reg.ReadString('');
        Reg.CloseKey;
      end else
      begin
        ProgID := ServerName;
        if ProgID = '' then
          ProgID := ServerGUID else
        begin
          Reg.OpenKey(Format('%s\CLSID',[ProgID]), True);
          Reg.WriteString('',ServerGUID);
          Reg.CloseKey;
        end;
        Reg.OpenKey(Format('CLSID\%s\ProgID',[ServerGUID]), True);
        Reg.WriteString('',ProgID);
        Reg.CloseKey;
      end;
      Reg.OpenKey(Format('CLSID\%s\Dap\DCEClient\%s',[ServerGUID, ProgID]), True);
      WriteValue('ComTimeout','default');
      Reg.WriteString('DisableNaming',IntToStr(Ord(BrokerName = '')));
      WriteValue('ExtendedImport','1');
      WriteValue('ImportName','%cell%/applications/services/%service%');
      WriteValue('ProtectionLevel','');
      WriteValue('Protseq','ncacn_ip_tcp');
      if BrokerName <> '' then
        Reg.DeleteValue('ServerBinding') else
        Reg.WriteString('ServerBinding',Format('ncacn_ip_tcp:%s',[ComputerName]));
      WriteValue('ServerPrincipal','');
      WriteValue('SetAuthentication','1');
      WriteValue('TimerInterval','10');
      WriteValue('VerifyAvailability','0');
      Reg.CloseKey;
      Reg.CreateKey(Format('CLSID\%s\NotInsertable',[ServerGUID]));
      Reg.CreateKey(Format('CLSID\%s\Programmable',[ServerGUID]));
    end;
  finally
    Reg.Free;
  end;
  inherited DoConnect;
end;

end.
