{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Analytics.AppAnalytics;

interface

uses
  System.Types, System.Classes, System.SysUtils, System.Math, System.Analytics;

type
  ///  <summary>An implementation of IApplicationActivityListener for use with the Embarcadero AppAnalytics service.</summary>
  TAppAnalyticsListener = class(TInterfacedObject, IApplicationActivityListener)
  private
    FOptions: TAppActivityOptions;
    FAppVersion: string;
    FCacheManager: IApplicationActivityCacheManager;
    FPreviousControlClassname: string;
    FPreviousControlName: string;
    FPreviousFormClassname: string;
    FPreviousFormName: string;
    { IApplicationActivityListener }
    procedure TrackAppStart(const TimeStamp: TDateTime);
    procedure TrackAppExit(const TimeStamp: TDateTime);
    procedure TrackControlFocused(const TimeStamp: TDateTime; const Sender: TObject);
    procedure TrackWindowActivated(const TimeStamp: TDateTime; const Sender: TObject);
    procedure TrackEvent(const TimeStamp: TDateTime; const Sender, Context: TObject);
    procedure TrackException(const TimeStamp: TDateTime; const E: Exception);
    procedure SetOptions(const Value: TAppActivityOptions);
    function GetTimestamp: string;
  public
    ///  <summary>Creates an instance of TAppAnalyticsListener which can be registered with the application's Analytics
    ///  Manager.</summary>
    constructor Create(const CacheManager: IApplicationActivityCacheManager; const AppVersion: string;
      const Options: TAppActivityOptions);
    ///  <summary>Sets or retrieves the set of TAppActivity types which will be recorded.</summary>
    property Options: TAppActivityOptions read FOptions write SetOptions;
  end;

  ///  <summary>An implementation of IApplicationActivityCacheManager which stores application events in a temporary
  ///  cache and uploads the data to an AppAnalytics server for analysis.</summary>
  TAppAnalyticsCacheManager = class(TInterfacedObject, IApplicationActivityCacheManager, IAppAnalyticsStartupDataRecorder)
  private
    FDataCache: TStringList;
    FMaxCacheSize: Integer;
    FUserID: string; // Must be an anonymous ID to track this user through across sessions
    FSessionID: string;
    FApplicationID: string;
    FEventCount: Cardinal;
    FServerAddress: string;
    FServerPort: Integer;
    FOnDataCacheFull: TNotifyEvent;
    FCPUInfo: string;
    FAppVersion: string;
    FOSVersion: string;
    { IApplicationActivityCacheManager }
    function GetCacheCount: Integer;
    procedure PersistData(const Wait: Boolean);
    procedure ClearData;
    procedure Log(const AMessage: string);
    procedure RemoveEventAtIndex(const Index: Integer);
    function GetEventAtIndex(const Index: Integer): string;
    procedure SetOnDataCacheFull(const AValue: TNotifyEvent);
    function GetOnDataCacheFull: TNotifyEvent;
    procedure SetMaxCacheSize(const AValue: Integer);
    function GetMaxCacheSize: Integer;
    class procedure SendData(const ContentString, ServerAddress: string; const ServerPort: Integer);
    { IAppAnalyticsStartupDataRecorder }
    procedure AddEnvironmentField(const AKey, AValue: string);
  public
    ///  <summary>Creates an instance of this cache manager. The AppID and UserID are GUID strings which uniquely
    ///  identify this application and user to the AppAnalytics service. ServerAddress is the URL of the AppAnalytics
    ///  server which should receive the collected data. ServerPort is the port number on the specified server which
    ///  will receive the data.</summary>
    constructor Create(const AppID, UserID, ServerAddress: string; const ServerPort: Integer);
    ///  <summary>Destroys this object.</summary>
    destructor Destroy; override;
    ///  <summary>Returns the number of events in the temporary data cache.</summary>
    property CacheCount: Integer read GetCacheCount;
    ///  <summary>Sets or retrieves the maximum size of the memory data cache. When the cache is full, the data should
    ///  be sent to the AppAnalytics service.</summary>
    property MaxCacheSize: Integer read GetMaxCacheSize write SetMaxCacheSize;
    ///  <summary>Returns the event at the specified index from the temporary data cache.</summary>
    property Event[const Index: Integer]: string read GetEventAtIndex;
    ///  <summary>Sets or retrieves an event handler which will be fired when the memory data cache is full. When this
    ///  event is fired, the data should be sent to the AppAnalytics service.</summary>
    property OnDataCacheFull: TNotifyEvent read GetOnDataCacheFull write SetOnDataCacheFull;
  end;

  ///  <summary>Class used for storing context data for tracking a custom event with TAppActivity.Custom.</summary>
  TCustomEventContext = class
  private
    FCategory: string;
    FAction: string;
    FText: string;
    FValue: Double;
  public
    ///  <summary>Conveninience constructor that sets the values of the fields.</summary>
    constructor Create(const ACategory, AAction, AText: string; const AValue: Double);
    ///  <summary>String data indicating a category for the event.</summary>
    property Category: string read FCategory write FCategory;
    ///  <summary>String data indicating the action for the event.</summary>
    property Action: string read FAction write FAction;
    ///  <summary>String data of descriptive information about the event.</summary>
    property Text: string read FText write FText;
    ///  <summary>A floating point value associated with the event.</summary>
    property Value: Double read FValue write FValue;
  end;

implementation

uses
  System.SyncObjs, System.DateUtils, System.SysConst, System.NetEncoding, System.Net.HttpClient, System.Character,
  System.Net.URLClient, System.NetConsts
{$IFDEF MSWINDOWS}
  , System.Win.Registry, Winapi.Windows
{$ENDIF MSWINDOWS}
{$IFDEF MACOS}
  , Posix.SysSysctl
{$ENDIF MACOS}
{$IFDEF ANDROID}
  , Androidapi.JNI.Os, Androidapi.Helpers, Androidapi.JNI.JavaTypes
{$ENDIF ANDROID}
 ;

constructor TAppAnalyticsListener.Create(const CacheManager: IApplicationActivityCacheManager; const AppVersion: string;
  const Options: TAppActivityOptions);
begin
  inherited Create;
  FOptions := Options;
  FAppVersion := AppVersion;
  FCacheManager := CacheManager;
end;

function TAppAnalyticsListener.GetTimestamp: string;
const
  TimestampFormat = 'yyyy-mm-dd hh:nn:ss.zzz'; // do not localize
var
  UTC: TDateTime;
begin
  UTC := TTimeZone.Local.ToUniversalTime(Now);
  DateTimeToString(Result, TimestampFormat, UTC);
end;

procedure TAppAnalyticsListener.SetOptions(const Value: TAppActivityOptions);
begin
  FOptions := Value;
end;

procedure TAppAnalyticsListener.TrackAppExit(const TimeStamp: TDateTime);
begin
  if (TAppActivity.AppExit in FOptions) and (FCacheManager <> nil) then
    FCacheManager.Log('AppExit|' + GetTimestamp); // do not localize;
end;

procedure TAppAnalyticsListener.TrackAppStart(const TimeStamp: TDateTime);
  function GetCPUName: string;
{$IFDEF MSWINDOWS}
  var
    Reg: TRegistry;
{$ENDIF}
{$IFDEF MACOS}
  var
    Buffer: TArray<Byte>;
    BufferLength: LongWord;
{$ENDIF}
  begin
{$IFDEF MSWINDOWS}
    Result := '';
    Reg := TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey('Hardware\Description\System\CentralProcessor\0', False) then  // do not localize
        Result := Reg.ReadString('ProcessorNameString') // do not localize
      else
        Result := '(CPU Unidentified)'; // do not localize
    finally
      Reg.Free;
    end;
{$ENDIF}
{$IFDEF MACOS}
{$IFDEF IOS}
    SysCtlByName(MarshaledAString('hw.machine'), nil, @BufferLength, nil, 0);  // do not localize
    SetLength(Buffer, BufferLength);
    try
      SysCtlByName(MarshaledAString('hw.machine'), @Buffer[0], @BufferLength, nil, 0);  // do not localize
      Result := 'APPLE ' + string(MarshaledAString(@Buffer[0])); // do not localize
    finally
      SetLength(Buffer, 0);
    end;
{$ELSE}
    SysCtlByName(MarshaledAString('machdep.cpu.brand_string'), nil, @BufferLength, nil, 0); // do not localize
    SetLength(Buffer, BufferLength);
    try
      SysCtlByName(MarshaledAString('machdep.cpu.brand_string'), @Buffer[0], @BufferLength, nil, 0); // do not localize
      Result := string(MarshaledAString(@Buffer[0]));
    finally
      SetLength(Buffer, 0);
    end;
{$ENDIF IOS}
{$ENDIF MACOS}
{$IFDEF ANDROID}
    Result := JStringToString(TJBuild.JavaClass.MANUFACTURER).ToUpper + ' ' + JStringToString(TJBuild.JavaClass.MODEL);
{$ENDIF}
  end;

  function GetOSFamily: string;
  begin
    case TOSVersion.Platform of
      TOSVersion.TPlatform.pfWindows:
        Result := 'WIN'; // do not localize
      TOSVersion.TPlatform.pfMacOS:
        Result := 'MAC'; // do not localize
      TOSVersion.TPlatform.pfiOS:
        Result := 'IOS'; // do not localize
      TOSVersion.TPlatform.pfAndroid:
        Result := 'ANDROID'; // do not localize
      else
        Result := 'UNDEFINED'; // do not localize
    end;
  end;

var
  OSVersion: string;
  CPUName: string;
  StartupRecorder: IAppAnalyticsStartupDataRecorder;
begin
  if (TAppActivity.AppStart in FOptions) and (FCacheManager <> nil) then
  begin
    OSVersion := Format('%s %d.%d' , [GetOSFamily, TOSVersion.Major, TOSVersion.Minor]);
    CPUName := GetCPUName;
    if Supports(FCacheManager, IAppAnalyticsStartupDataRecorder, StartupRecorder) then
    begin
      StartupRecorder.AddEnvironmentField('OS', OSVersion); // do not localize
      StartupRecorder.AddEnvironmentField('CPU', CPUName); // do not localize
      StartupRecorder.AddEnvironmentField('APPVER', FAppVersion); // do not localize
    end;
    FCacheManager.Log('AppStart|' + GetTimestamp + '|' + OSVersion + '|' + CPUName + '|' + FAppVersion);  // do not localize
  end;
end;

procedure TAppAnalyticsListener.TrackControlFocused(const TimeStamp: TDateTime; const Sender: TObject);
begin
  if (TAppActivity.ControlFocused in FOptions) and (Sender is TComponent) and (FCacheManager <> nil) and
    (TComponent(Sender).ClassName <> FPreviousControlClassname) and (TComponent(Sender).Name <> FPreviousControlName) then
  begin
    FCacheManager.Log('ControlFocus|' + GetTimestamp + '|' + TComponent(Sender).ClassName + '|' +
      TComponent(Sender).Name + '|' + FPreviousControlClassname + '|' + FPreviousControlName); // do not localize
    FPreviousControlClassname := TComponent(Sender).ClassName;
    FPreviousControlName := TComponent(Sender).Name;
  end;
end;

procedure TAppAnalyticsListener.TrackException(const TimeStamp: TDateTime; const E: Exception);
begin
  if (TAppActivity.Exception in FOptions) and (E <> nil) and (FCacheManager <> nil) then
    FCacheManager.Log('AppCrash|' + GetTimestamp + '|' + E.ClassName + '|' + E.Message);  // do not localize
end;

procedure TAppAnalyticsListener.TrackEvent(const TimeStamp: TDateTime; const Sender, Context: TObject);
var
  Builder: TStringBuilder;
begin
  if (TAppActivity.Custom in FOptions) and (Context is TCustomEventContext) and (FCacheManager <> nil) then
  begin
    Builder := TStringBuilder.Create;
    try
      Builder.Append(TCustomEventContext(Context).Category);
      if TCustomEventContext(Context).Action <> '' then
      begin
        Builder.Append('|');
        Builder.Append(TCustomEventContext(Context).Action);
        if TCustomEventContext(Context).Text <> '' then
        begin
          Builder.Append('|');
          Builder.Append(TCustomEventContext(Context).Text);
          Builder.Append('|');
          Builder.Append(FloatToStr(TCustomEventContext(Context).Value));
        end;
      end;
      FCacheManager.Log('TrackEvent|' + GetTimestamp + '|' + Builder.ToString(True)); // do not localize
    finally
      Builder.Free;
    end;
  end;
end;

procedure TAppAnalyticsListener.TrackWindowActivated(const TimeStamp: TDateTime; const Sender: TObject);
begin
  if (TAppActivity.WindowActivated in FOptions) and (Sender is TComponent) and (FCacheManager <> nil) and
    (TComponent(Sender).ClassName <> FPreviousFormClassname) and (TComponent(Sender).Name <> FPreviousFormName) then
  begin
    FCacheManager.Log('FormActivate|' + GetTimestamp + '|' + TComponent(Sender).ClassName + '|' +
      TComponent(Sender).Name + '|' + FPreviousFormClassname + '|' + FPreviousFormName); // do not localize
    FPreviousFormClassname := TComponent(Sender).ClassName;
    FPreviousFormName := TComponent(Sender).Name;
  end;
end;

{ TCustomEventContext }

constructor TCustomEventContext.Create(const ACategory, AAction, AText: string; const AValue: Double);
begin
  inherited Create;
  FCategory := ACategory;
  FAction := AAction;
  FText := AText;
  FValue := AValue;
end;

{ TAppAnalyticsCacheManager }

constructor TAppAnalyticsCacheManager.Create(const AppID, UserID, ServerAddress: string; const ServerPort: Integer);
begin
  inherited Create;
  FApplicationID := AppID;
  FUserID := UserID;
  FServerAddress := ServerAddress;
  FServerPort := ServerPort;
  FEventCount := 0;
  FDataCache := TStringList.Create;
  FMaxCacheSize := 500;
end;

destructor TAppAnalyticsCacheManager.Destroy;
begin
  FDataCache.Free;
  inherited;
end;

procedure TAppAnalyticsCacheManager.AddEnvironmentField(const AKey,
  AValue: string);
begin
  if AKey = 'OS' then
    FOSVersion := AValue
  else if AKey = 'CPU' then
    FCPUInfo := AValue
  else if AKey = 'APPVER' then
    FAppVersion := AValue;
end;

procedure TAppAnalyticsCacheManager.ClearData;
begin
  FDataCache.Clear;
end;

function TAppAnalyticsCacheManager.GetCacheCount: Integer;
begin
  Result := FDataCache.Count;
end;

function TAppAnalyticsCacheManager.GetEventAtIndex(const Index: Integer): string;
begin
  if (Index >= 0) and (Index < FDataCache.Count) then
    Result := FDataCache[Index]
  else
    raise ERangeError.Create(SRangeError);
end;

function TAppAnalyticsCacheManager.GetMaxCacheSize: Integer;
begin
  Result := FMaxCacheSize;
end;

function TAppAnalyticsCacheManager.GetOnDataCacheFull: TNotifyEvent;
begin
  Result := FOnDataCacheFull;
end;

procedure TAppAnalyticsCacheManager.Log(const AMessage: string);
begin
  TMonitor.Enter(FDataCache);
  try
    FDataCache.Add(IntToStr(FEventCount) + '|' + AMessage);
    Inc(FEventCount);
  finally
    TMonitor.Exit(FDataCache);
  end;
  if FDataCache.Count > FMaxCacheSize then
    if Assigned(FOnDataCacheFull) then
      FOnDataCacheFull(Self)
    else
      FDataCache.Clear;
end;


procedure CheckServerCertificate(const Sender: TObject; const ARequest: TURLRequest; const Certificate: TCertificate; var Accepted: Boolean);
begin
  Accepted := True;
end;

class procedure TAppAnalyticsCacheManager.SendData(const ContentString, ServerAddress: string; const ServerPort: Integer);
const
  URLTemplate = 'https://%s:%u/d.php'; // do not localize
var
  HttpClient: THttpClient;
  DataStream: TStringStream;
  Header: TNetHeader;
begin
  DataStream := TStringStream.Create(ContentString);
  HttpClient := THttpClient.Create;
  try
    HttpClient.ValidateServerCertificateCallback := CheckServerCertificate;
    Header := TNetHeader.Create(sContentType, 'application/x-www-form-urlencoded; charset=UTF8'); // do not localize
    try
      HttpClient.Post(Format(URLTemplate, [ServerAddress, ServerPort]), DataStream, nil, [Header]);
    except
    end;
  finally
    DataStream.Free;
    HttpClient.Free;
  end;
end;

procedure TAppAnalyticsCacheManager.PersistData(const Wait: Boolean);

  function BuildString: string;
  var
    I: Integer;
    DataCount: Integer;
    ContentBuilder: TStringBuilder;
  begin
    DataCount := FDataCache.Count;
    ContentBuilder := TStringBuilder.Create;
    try
      ContentBuilder.Append(Format('I=%s', [TNetEncoding.URL.Encode(FApplicationID)]));  // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('U=%s', [TNetEncoding.URL.Encode(FUserID)]));  // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('S=%s', [TNetEncoding.URL.Encode(FSessionID)])); // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('N=%s', [TNetEncoding.URL.Encode(IntToStr(DataCount))])); // do not loalize
      ContentBuilder.Append('&');
      { v2 data header }
      ContentBuilder.Append('V=2'); // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('OS=%s', [TNetEncoding.URL.Encode(FOSVersion)])); // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('CPU=%s', [TNetEncoding.URL.Encode(FCPUInfo)])); // do not localize
      ContentBuilder.Append('&');
      ContentBuilder.Append(Format('APPVER=%s', [TNetEncoding.URL.Encode(FAppVersion)])); // do not localize
      ContentBuilder.Append('&');
      { end v2}
      for I := 0 to DataCount - 1 do
      begin
        ContentBuilder.Append(Format('L%d=%s',[I, TNetEncoding.URL.Encode(Event[0])])); // do not localize
        RemoveEventAtIndex(0);
        if I < DataCount - 1 then
          ContentBuilder.Append('&');
      end;
      Result := ContentBuilder.ToString(True);
    finally
      ContentBuilder.Free;
    end;
  end;

var
  TransferThread: TThread;
  DataString: string;
  LServerAddress: string;
  LServerPort: Integer;
begin
  if FDataCache.Count > 0 then
  begin
    DataString := BuildString;
    LServerAddress := FServerAddress;
    LServerPort := FServerPort;
    if Wait then
      TAppAnalyticsCacheManager.SendData(DataString, LServerAddress, LServerPort)
    else
    begin
      TransferThread := TThread.CreateAnonymousThread(procedure
        begin
          TAppAnalyticsCacheManager.SendData(DataString, LServerAddress, LServerPort);
        end);
      TransferThread.Start;
    end;
  end;
end;

procedure TAppAnalyticsCacheManager.RemoveEventAtIndex(const Index: Integer);
begin
  if (Index >= 0) and (Index < FDataCache.Count) then
  begin
    TMonitor.Enter(FDataCache);
    try
      FDataCache.Delete(Index);
    finally
      TMonitor.Exit(FDataCache);
    end;
  end
  else
    raise ERangeError.Create(SRangeError);
end;

procedure TAppAnalyticsCacheManager.SetMaxCacheSize(const AValue: Integer);
begin
  FMaxCacheSize := AValue;
  if FDataCache.Count >= AValue then
    if Assigned(FOnDataCacheFull) then
      FOnDataCacheFull(Self)
    else
      FDataCache.Clear;
end;

procedure TAppAnalyticsCacheManager.SetOnDataCacheFull(const AValue: TNotifyEvent);
begin
  FOnDataCacheFull := AValue;
end;

end.
