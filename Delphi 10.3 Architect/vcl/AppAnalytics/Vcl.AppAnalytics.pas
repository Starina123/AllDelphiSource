{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.AppAnalytics;

interface

uses System.Types, System.Classes, Winapi.Windows, Winapi.Messages, Vcl.ExtCtrls,
  Vcl.Controls, Vcl.Forms, System.SysUtils, System.Math, Vcl.AppAnalytics.Consts;

type
TAnalyticsOption = (aoTrackStartup, aoTrackFormActivate, aoTrackControlFocus,
  aoTrackExceptions);

TAnalyticsOptions = set of TAnalyticsOption;

/// <Summary>An event handler that is fired when the privacy message is shown
///  to an end user on startup. See the OnPrivacyMessage event in the TAppAnalytics
///  component.
///  To collect data from the user, set Activate to True. Set Activate to False
///  to exclude the user from data collection.</Summary>
TAnalyticsPrivacyMessageEvent = procedure(Sender: TObject; var Activate: Boolean) of Object;

/// <Summary>Usage tracking and data collection component for AppAnalytics. This
///  component collects data about the various ways that users interact with
///  your application and sends the data to the AppAnalytics web application for
///  processing and analysis.</Summary>
[ComponentPlatformsAttribute(pfidWindows)]
TAppAnalytics = class(TComponent)
private
  FOptions: TAnalyticsOptions;
  FApplicationID: string;
  FPrivacyMessage: TStrings;
  FOnPrivacyMessage: TAnalyticsPrivacyMessageEvent;
  FCBTHookHandle: THandle;
  FActive: Boolean;
  FDataCache: TStringList;
  FUpdateTimer: TTimer;
  FMaxCacheSize: Integer;
  FUserID: string; //ANONYMOUS ID used to track this user through a session
  FSessionID: string;
  FEventCount: Cardinal;
  FActiveForm: TObject; //Might be a VCL form or an FMX form
  FFocusedControl: TControl;
  FOSVersion: string;
  FCPUInfo: string;
  FAppVersion: string;

  FLastWindowClassName, FLastWindowName, FLastControlClassName, FLastControlName: string;

  FServerAddress: string;

  FOldExceptionHandler: TExceptionEvent;
  procedure InstallHooks;
  procedure RemoveHooks;
  procedure Log(AMessage: string);
  procedure SendDataNoIndy;
  procedure UpdateTimerFire(Sender: TObject);
  procedure TrackException(Sender: TObject; E:Exception);
  procedure InstallExceptionHandler;
  procedure RemoveExceptionHandler;
  //ResetApp is for RTL testing only. Do not use in a real production application
  class procedure ResetApp;
protected
  procedure SetActive(const Value: Boolean);

  /// <Summary>Sends data that has been accumulated to the server. There generally isn't a need to call this,
  ///  as AppAnalytics will send data automatically at a time interval, when the cache exceeds a certain size,
  ///  or when the app exits.</Summary>
  procedure SendData;
  /// <Summary>Reader for the UpdateInterval property</Summary>
  function GetUpdateInterval: Integer;
  /// <Summary>Setter for the UpdateInterval property</Summary>
  procedure SetUpdateInterval(const Value: Integer);

  /// <Summary>Call this to track that application has started. Generally no need to call; use the aoTrackStartup option instead</Summary>
  procedure TrackApplicationStarted;
  /// <Summary>Call this to track that application has exited. Generally no need to call; use the aoTrackStartup option instead</Summary>
  procedure TrackApplicationExit;
  /// <Summary>Call this to track that a window has been activated. Generally no need to call; use the aoTrackFormActivate option instead</Summary>
  procedure TrackWindowActivated(AHandle: THandle); virtual;
  /// <Summary>Call this to track that a control has received focus. Generally no need to call; use the aoTrackControlFocus option instead</Summary>
  procedure TrackControlFocused(AHandle: THandle); virtual;
  /// <Summary>Setter for the CacheSize property</Summary>
  procedure SetCacheSize(const Value: Integer);
  /// <Summary>Setter for the Options property</Summary>
  procedure SetOptions(const Value: TAnalyticsOptions);
  /// <Summary>Setter for the PrivacyMessage propety</Summary>
  procedure SetPrivacyMessage(const Value: TStrings);
  /// <Summary>Setter for the OnPrivacyMessage event</Summary>
  procedure SetOnPrivacyMessage(const Value: TAnalyticsPrivacyMessageEvent);
  procedure Loaded; override;
  /// <Summary>Reader for the UserID property</Summary>
  function GetUserID: string;
  /// <Summary>Reader for the AllowTracking property</Summary>
  function GetAllowTracking: Boolean;
  /// <Summary>Returns the current time in the string format that AppAnalytics delivers to the server</Summary>
  function GetTimestamp: string;
  /// <Summary>UserID is a GUID used by the AppAnalytics server to track how many distinct users perform certain actions
  ///  across multiple sections. Changing this value may cause data on the server to be incorrect, so it's read-only</Summary>
  property UserID: string read GetUserID;
public
  /// <Summary>Creates an instance of the TAppAnalytics component</Summary>
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;
  /// <Summary>Track a custom event. Call this method to do your own event
  ///  tracking. You might use this to track feature usage, performance data, or
  ///  anything else you like, provided the information remains anonymous.
  ///  ACategory, AAction, ALabel, and AValue are fields you can define to describe the event being tracked.
  ///  Only ACategory is required. The AppAnalytics service will record the first 64 characters of each of ACategory, AAction, and ALabel.
  ///  </Summary>
  procedure TrackEvent(ACategory: string; AAction: string = '';
    ALabel: string = ''; AValue: Double = 0.0);
  /// <Summary>Send data to the server. Data is automatically sent on a timer, when the event cache is filled, and when the application exits.
  ///  Call StartSending to send data at a time other than this. Returns a handle to a thread that sends the data. The thread will terminate
  /// after the data has been sent.</Summary>
  function StartSending: THandle;
  /// <Summary>Show the notification/permission dialog to the end user, and reset
  ///  their tracking preference, if applicable</Summary>
  function CheckPrivacy: Boolean;
  /// <Summary>The address of the server where AppAnalytics will send its event data.
  ///  There isn't a reason to change this unless specifically instructed by
  ///  Embarcadero</Summary>
  property ServerAddress: string read FServerAddress write FServerAddress;
published
  /// <Summary>This event is called when AppAnalytics needs to notify the end user that their actions are being tracked (and preferably get permission).
  ///  This happens the first time the application is started for a given end user (combination of computer/user, as defined by HKEY_CURRENT_USER registry key),
  ///  and can be made to happen at any time by calling CheckPrivacy</Summary>
  property OnPrivacyMessage: TAnalyticsPrivacyMessageEvent read
    FOnPrivacyMessage write SetOnPrivacyMessage;
  /// <Summary>The ID of the application assigned in the AppAnalytics web interface.
  ///  To find  your application's ID, log in to the AppAnalytics web service and view your Application's properties.</Summary>
  property ApplicationID: string read FApplicationID write FApplicationID;
  /// <Summary>Controls whther the component is actively collection application usage data. Set Active to true to collect data.
  ///  If the Active property is set to True as design time, AppAnalytics will automatically collect data for the entire usage session.
  ///  </Summary>
  property Active: Boolean read FActive write SetActive;
  /// <Summary>The maximum number of events that AppAnalytics will collect before sending them to the server for analysis.
  ///  The default is 500. AppAnalytics will send usage data to the server whenever the UpdateInterval has expired or the CacheSize is reached.
  ///  (AppAnalytics will also send a final update when the application exits.)</Summary>
  property CacheSize: Integer read FMaxCacheSize write SetCacheSize;
  /// <Summary>The interval, in seconds, at which AppAnalytics will automatically send whatever data it has collected to the server for Analysis.
  ///  The default is 600 seconds, or 10 minutes. AppAnalytics will send usage data to the server whenever the UpdateInterval has expired, or the CacheSize has been reached.
  ///  (AppAnalytics will also send a final update when the application exits.)</Summary>
  property UpdateInterval: Integer read GetUpdateInterval write
    SetUpdateInterval;
  /// <Summary>Various options that determine what data AppAnalytics automatically collects. Choose any combination of the following:
  ///  aoTrackStartup: Specifically track each time the application starts and closes. It is recommended to always use this option.
  ///  aoTrackFormActivate: Track each time the active form in the application changes. This is useful for tracking the "flow" of a user through your application, and is tied to incredible visualization tools in the AppAnalytics web application.
  ///  aoTrackControlFocus: Track each time the focused control in the application changes. This is useful for tracking the "flow" of a user through your application.
  ///  aoTrackExceptions: Track each time an exception rises to the top and is caught at the Application level.
  ///    This option utilizes the Application.OnException event.
  ///    If you have your own Application.OnException event handler, AppAnalytics will try to use your exception handler as well
  ///    (Note that it is possible for your Application.OnException event handler to interfere with AppAnalytics, if your event handler is installed AFTER AppAnalytics is activated).
  ///  </Summary>
  property Options: TAnalyticsOptions read FOptions write SetOptions;
  ///  <Summary>The text of the message shown to users when AppAnalytics is activated in a given application for the first time.
  ///  This message is shown in a dialog box with an "OK" message, and does not give users the option to opt-in or opt-out.
  ///  If you wish to give your users the opportunity to opt-in or opt-out (which is recommended), use the OnPrivacyMessage event.
  ///  </Summary>
  property PrivacyMessage: TStrings read FPrivacyMessage write
    SetPrivacyMessage;
end;


//Various error classes

/// <Summary>Exception raised when AppAnalytics is used incorrectly (for example, one more than one AppAnalytics component is used in an application)</Summary>
EInvalidAnalyticsUsage = class(Exception)
end;

/// <Summary>Exception raised if AppAnalytics initalization fails for some reason</Summary>
EAnalyticsInitializationFailed = class(Exception)
end;

/// <Summary>Returns the AppAnalytics instance for the Application(there can be only one per application).
///  This is useful for tracking things outside of the main form, where the component may actually "live,"
///  without having to add the main form to the uses clause</Summary>
function GetAppAnalytics: TAppAnalytics;

implementation

uses System.SyncObjs, System.DateUtils, System.Win.Registry, WinApi.WinINet,
  Vcl.Dialogs, System.NetEncoding;

type
TAnalyticsThread = class(TThread)
public
  procedure Execute; override;
end;


var
  GlobalAnalytics: TAppAnalytics = nil;
  AnalyticsCriticalSection: TCriticalSection;

function GetAppAnalytics: TAppAnalytics;
begin
  Result := GlobalAnalytics;
end;

//Non-OO Hook callbacks
function CBTHookProc(nCode: Integer; WPARAM: WPARAM; LPARAM: LPARAM): LRESULT;
  stdcall;
{var
  MouseStruct: PMouseHookStruct; //Reserved for later
  TargetHandle: THandle; //Reserved for later
  TargetControl: TControl; //Reserved for later}
begin
  if GlobalAnalytics <> nil then
  begin
    case nCode of
    HCBT_ACTIVATE:
      if aoTrackFormActivate in GlobalAnalytics.Options then
        GlobalAnalytics.TrackWindowActivated(WPARAM);
    HCBT_MINMAX:;
    HCBT_MOVESIZE:;
    HCBT_SETFOCUS:
      if aoTrackControlFocus in GlobalAnalytics.Options then
        GlobalAnalytics.TrackControlFocused(WPARAM);
    HCBT_SYSCOMMAND:;
    HCBT_CLICKSKIPPED:
      {begin
        MouseStruct := PMouseHookStruct(Pointer(LPARAM));
        TargetHandle := MouseStruct^.hwnd;
        TargetControl := FindControl(TargetHandle);
        if TargetControl <> nil then
        begin
          if WPARAM = WM_LBUTTONDOWN then
            GlobalAnalytics.Log(Format('Mouse Click: %s (%s)', [TargetControl.Name, TargetControl.ClassName]));
          if WPARAM = WM_RBUTTONDOWN then
            GlobalAnalytics.Log(Format('Mouse Right Click: %s (%s)', [TargetControl.Name, TargetControl.ClassName]));;
          if WPARAM = WM_LBUTTONDBLCLK then
            GlobalAnalytics.Log(Format('Mouse Double Click: %s (%s)', [TargetControl.Name, TargetControl.ClassName]));;
        end;
      end};
    HCBT_KEYSKIPPED:;
    end;
  end;
  Result := CallNextHookEx(GlobalAnalytics.FCBTHookHandle, nCode, WPARAM, LPARAM);
end;

//Misc. Support Routines
function GetCPUName: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('Hardware\Description\System\CentralProcessor\0', False) then //Do not localize
      Result := Reg.ReadString('ProcessorNameString') //Do not localize
    else
      Result := '(CPU Unidentified)'; //Do not localize
  finally
    Reg.Free;
  end;
end;

function GetCpuSpeed: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('Hardware\Description\System\CentralProcessor\0', False) then //Do not localize
    begin
      Result := IntToStr(Reg.ReadInteger('~MHz')) + ' MHz'; //Do not localize
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: Cardinal;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

{ TApplicationAnalytics }

function TAppAnalytics.CheckPrivacy: Boolean;
var
  AllowTracking: Boolean;
  Reg: TRegistry;
begin
  AllowTracking := True;

  if Assigned(FOnPrivacyMessage) then
  begin
    FOnPrivacyMessage(Self, AllowTracking);
    if not AllowTracking then
    begin
      Active := False;
    end;
  end
  else
  begin
    ShowMessage(PrivacyMessage.Text);
  end;
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.Access := KEY_WRITE;
    Reg.OpenKey('Software\Embarcadero\AppAnalytics\' + ApplicationID, True); //Do not localize
    Reg.WriteBool('A', AllowTracking);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  Result := AllowTracking;
end;

constructor TAppAnalytics.Create(AOwner: TComponent);
var
  GUID: TGUID;
begin
  inherited;

  if not (csDesigning in ComponentState) then
  begin
    if GlobalAnalytics <> nil then
    begin
      raise EInvalidAnalyticsUsage.Create(SOneAnalyticsComponentAllowed);
    end;
    GlobalAnalytics := Self;

    CreateGUID(GUID);
    FSessionID := GUIDToString(GUID);
    FEventCount := 0;
  end;

  Options := [aoTrackStartup, aoTrackFormActivate, aoTrackExceptions];

  FActive := False;

  FDataCache := TStringList.Create;
  FMaxCacheSize := 500;

  FUpdateTimer := TTimer.Create(Self);
  FUpdateTimer.Interval := 600000; //Default update interval: 10 minutes
  FUpdateTimer.OnTimer := UpdateTimerFire;

  FPrivacyMessage := TStringList.Create;
  FPrivacyMessage.Text := sPrivacyMessage;

  FLastWindowClassName := '';
  FLastWindowName := '';
  FLastControlClassName := '';
  FLastControlName := '';

  FUserID := '';
  ServerAddress := 'appanalytics.embarcadero.com';
end;



destructor TAppAnalytics.Destroy;
begin
  //Send any remaining data, if possible
  Active := False;
  FPrivacyMessage.Free;
  FDataCache.Free;
  if not (csDesigning in ComponentState) then
    GlobalAnalytics := nil;
  inherited;
end;

function TAppAnalytics.GetAllowTracking: Boolean;
var
  Reg: TRegistry;
begin
  try
    Reg := TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Embarcadero\AppAnalytics\' + ApplicationID, True); //Do not localize
      if Reg.ValueExists('A') then
      begin
        Result := Reg.ReadBool('A');
      end else
      begin
        Result := CheckPrivacy;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
    Result := False;
  end;
end;

function TAppAnalytics.GetTimestamp: string;
var
  UTC: TSystemTime;
begin
  GetSystemTime(UTC);
  Result := Format('%d-%d-%d %d:%d:%d.%d',
    [UTC.wYear, UTC.wMonth, UTC.wDay,
    UTC.wHour, UTC.wMinute, UTC.wSecond, UTC.wMilliseconds]);
end;

function TAppAnalytics.GetUpdateInterval: Integer;
begin
  Result := FUpdateTimer.Interval div 1000;
end;

function TAppAnalytics.GetUserID: string;
var
  Reg: TRegistry;
  GUID: TGUID;
begin
  Result := '';
  if FUserID = '' then
  begin
    Reg := TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Embarcadero\AppAnalytics\' + ApplicationID, True); //Do not localize
      if Reg.ValueExists('U')
        {$IFDEF DEBUG} and (ParamStr(1) <> 'reset_user'){$ENDIF}
      then
      begin
        FUserID := Reg.ReadString('U');
      end else
      begin
        Reg.CloseKey;
        Reg.Access := KEY_WRITE;
        Reg.OpenKey('Software\Embarcadero\AppAnalytics\' + ApplicationID, True); //Do not localize
        CreateGUID(GUID);
        FUserID := GuidToString(GUID);
        Reg.WriteString('U', FUserID);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  Result := FUserID;
end;

procedure TAppAnalytics.InstallExceptionHandler;
begin
  FOldExceptionHandler := Application.OnException;
  Application.OnException := TrackException;
end;

procedure TAppAnalytics.InstallHooks;
begin
  FCBTHookHandle := SetWindowsHookEx(WH_CBT, CBTHookProc, 0, GetCurrentThreadID);
  if FCBTHookHandle = 0 then
  begin
    raise EAnalyticsInitializationFailed.Create(Format(SCBTHookFailed, [GetLastError]));
  end;
  if aoTrackExceptions in Options then
    InstallExceptionHandler;
end;

procedure TAppAnalytics.Loaded;
begin
  inherited;
  //This is here to make sure that the Active property setter gets fully
  //executed AFTER the OnPrivacyMessage event gets set
  if FActive then
  begin
    FActive := False;
    Active := True;
  end;
end;

procedure TAppAnalytics.Log(AMessage: string);
begin
  {$IF DEFINED(DEBUG) AND DEFINED(MSWINDOWS)}
  OutputDebugString(PChar('AppAnalytics: ' + AMessage));
  {$ENDIF}
  AnalyticsCriticalSection.Enter;
  try
    FDataCache.Add(IntToStr(FEventCount) + '|' + AMessage);
    Inc(FEventCount);
  finally
    AnalyticsCriticalSection.Leave;
  end;
  if (FDataCache.Count > FMaxCacheSize) and (not Application.Terminated) then
    StartSending;
end;

procedure TAppAnalytics.RemoveExceptionHandler;
begin
  Application.OnException := FOldExceptionHandler;
end;

procedure TAppAnalytics.RemoveHooks;
begin
  if aoTrackExceptions in Options then
    RemoveExceptionHandler;
  UnhookWindowsHookEx(FCBTHookHandle);
end;

class procedure TAppAnalytics.ResetApp;
begin
  if GlobalAnalytics <> nil then
  begin
    GlobalAnalytics.FDataCache.Clear;
    GlobalAnalytics.Free;
  end;
  GlobalAnalytics := nil;
end;

//This method should generally be called from the analytics thread, but
//it can be called from main UI thread if needed.
//Note that it will BLOCK on network access, so running it in the main
//Thread is discouraged
procedure TAppAnalytics.SendData;
{$IFDEF APPANALYTICS_USEINDY}
var
  http: TIdHttp;
  DataCount, I: Integer;
  ParamList: TStrings;
  HttpResult: string;
  {$ENDIF}
begin
  {$IFDEF APPANALYTICS_USEINDY}
  ParamList := TStringList.Create;
  http := TIdHTTP.Create(Self);
  try
    AnalyticsCriticalSection.Enter;
    try
      DataCount := FDataCache.Count;
      if DataCount = 0 then
        Exit;
      ParamList.Add(Format('V=%d', [2]));
      ParamList.Add(Format('I=%s', [TNetEncoding.URL.Encode(ApplicationID)]));
      ParamList.Add(Format('U=%s', [TNetEncoding.URL.Encode(UserID)]));
      ParamList.Add(Format('S=%s', [TNetEncoding.URL.Encode(FSessionID)]));
      ParamList.Add(Format('N=%d', [DataCount]));
      ParamList.Add(Format('OS=%s', [TNetEncoding.URL.Encode(FOSVersion)]));
      ParamList.Add(Format('APPVER=%s', [TNetEncoding.URL.Encode(FAppVersion)]));
      ParamList.Add(Format('CPU=%s', [TNetEncoding.URL.Encode(FCPUInfo)]));
      for I := 0 to DataCount - 1 do
      begin
        ParamList.Add(Format('L%d=%s',[I, TNetEncoding.URL.Encode(FDataCache[0])]));
        FDataCache.Delete(0);
      end;
    finally
      AnalyticsCriticalSection.Leave;
    end;
    try
      HttpResult := http.Post('http://' + ServerAddress + '/d.php', ParamList);
    except
      //If anything goes wrong, suppress the error. We don't want the end user to be interrupted
    end;

  finally
    http.Free;
    ParamList.Free;
  end;
  {$ENDIF}
  SendDataNoIndy;
end;

procedure TAppAnalytics.SendDataNoIndy;
var
  HSession, HConnect, HRequest: HINTERNET;
  ParamList: TStrings;
  Content, EncodedData: string;
  Header: String;
  ANSIContent: ANSIString;
  DataCount, I: Integer;

begin
  ParamList := TStringList.Create;
  try
    try
      AnalyticsCriticalSection.Enter;
      DataCount := FDataCache.Count;
        if DataCount = 0 then
          Exit;
        ParamList.Add(Format('V=%d', [2]));
        ParamList.Add(Format('I=%s', [TNetEncoding.URL.Encode(ApplicationID)]));
        ParamList.Add(Format('U=%s', [TNetEncoding.URL.Encode(UserID)]));
        ParamList.Add(Format('S=%s', [TNetEncoding.URL.Encode(FSessionID)]));
        ParamList.Add(Format('N=%d', [DataCount]));
        ParamList.Add(Format('OS=%s', [TNetEncoding.URL.Encode(FOSVersion)]));
        ParamList.Add(Format('APPVER=%s', [TNetEncoding.URL.Encode(FAppVersion)]));
        ParamList.Add(Format('CPU=%s', [TNetEncoding.URL.Encode(FCPUInfo)]));
        for I := 0 to DataCount - 1 do
        begin
          ParamList.Add(Format('L%d=%s',[I, TNetEncoding.URL.Encode(FDataCache[0])]));
          FDataCache.Delete(0);
        end;
    finally
      AnalyticsCriticalSection.Leave;
    end;

    Content := '';
    for I := 0 to ParamList.Count - 1 do
    begin
      EncodedData := ParamList[I];
      Content := Content + EncodedData;
      if I < ParamList.Count - 1 then
      begin
        Content := Content + '&';
      end;
    end;
    ANSIContent := AnsiString(Content);

    HSession := InternetOpen('AppAnalytics', INTERNET_OPEN_TYPE_PRECONFIG,
      nil, nil, 0);
    {$IFDEF APPANALYTICS_DEBUG}
    if HSession = nil then
      ShowMessage(IntToStr(GetLastError));
    {$ENDIF}
    try
      HConnect := InternetConnect(HSession, PChar(ServerAddress),
        INTERNET_DEFAULT_HTTPS_PORT, nil, nil,
                INTERNET_SERVICE_HTTP, 0, 0);
      {$IFDEF APPANLYTICS_DEBUG}
      if HConnect = nil then
          ShowMessage(IntToStr(GetLastError));
      {$ENDIF}
      try
        HRequest := HTTPOpenRequest(HConnect, 'POST', '/d.php', nil, nil, nil,
          INTERNET_FLAG_SECURE, 0);
        {$IFDEF APPANALYTICS_DEBUG}
        if HRequest = nil then
          ShowMessage(IntToStr(GetLastError));
        {$ENDIF}
        try

          Header := 'Content-Type: application/x-www-form-urlencoded';
          if not HTTPSendRequest(HRequest, PChar(Header), Length(Header),
            PAnsiChar(ANSIContent), Length(ANSIContent) * Sizeof(ANSIChar)) then
              {$IFDEF APPANALYTICS_DEBUG}
              ShowMessage(IntToStr(GetLastError))
              {$ENDIF};
        finally
          InternetCloseHandle(HRequest);
        end;
      finally
        InternetCloseHandle(HConnect);
      end;
    finally
      InternetCloseHandle(HSession);
    end;
  finally
    ParamList.Free;
  end;
end;

procedure TAppAnalytics.SetActive(const Value: Boolean);
var
  AllowTracking: Boolean;
begin
  if Value then
  begin
    if ApplicationID = '' then
      raise EAnalyticsInitializationFailed.Create(SInvalidApplicationID);
    if (FActive <> Value) and
      not (csDesigning in ComponentState) and
      not (csLoading in ComponentState) then
    begin
      GetUserID;
      AllowTracking := GetAllowTracking;
      if AllowTracking then
      begin
        InstallHooks;
        TrackApplicationStarted;
        FUpdateTimer.Enabled := True;
      end else
      begin
        //The user has declined the tracking, so we can't set it to active
        Active := False;
        Exit;
      end;
    end;
  end else
  if (FActive <> Value) and
    not (csLoading in ComponentState) and
    not (csDesigning in ComponentState) then
  begin
    TrackApplicationExit;
    SendData;
    RemoveHooks;
    FUpdateTimer.Enabled := False;
  end;
  FActive := Value;
end;

procedure TAppAnalytics.SetCacheSize(const Value: Integer);
begin
  FMaxCacheSize := Value;
  if csDesigning in ComponentState then
    Exit;
  if FDataCache.Count >= Value then
    StartSending;
end;

procedure TAppAnalytics.SetOnPrivacyMessage(
  const Value: TAnalyticsPrivacyMessageEvent);
begin
  FOnPrivacyMessage := Value;
end;

procedure TAppAnalytics.SetOptions(const Value: TAnalyticsOptions);
begin
  FOptions := Value;
end;

procedure TAppAnalytics.SetPrivacyMessage(const Value: TStrings);
begin
  FPrivacyMessage.Assign(Value);
end;

procedure TAppAnalytics.SetUpdateInterval(const Value: Integer);
begin
  FUpdateTimer.Interval := Value * 1000;
end;

function TAppAnalytics.StartSending: THandle;
var
  SendThread: TAnalyticsThread;
begin
  if csDesigning in ComponentState then
  begin
    Result := 0;
    Exit;
  end;
  SendThread := TAnalyticsThread.Create(True);
  Result := SendThread.Handle;
  SendThread.FreeOnTerminate := True;
  SendThread.Start;
end;

procedure TAppAnalytics.TrackApplicationExit;
var
  S: string;
begin
  S := 'AppExit|' + GetTimestamp; //Do not localize
  Log(S);
end;

procedure TAppAnalytics.TrackApplicationStarted;
var
  S: string;
  OSVersion: string;
  VersionInfo: TOSVersionInfo;
  MajorVersion, MinorVersion: Cardinal;
  CPUName: string;
  BuildVersion: string;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  MajorVersion := VersionInfo.dwMajorVersion;
  MinorVersion := VersionInfo.dwMinorVersion;
  OSVersion := Format('%d.%d' , [MajorVersion, MinorVersion]);
  CPUName := GetCPUName;
  BuildVersion := GetBuildInfoAsString;
  S := 'AppStart|' + GetTimestamp + '|' + OSVersion + '|' + CPUName + '|' + BuildVersion; //Do not localize
  Log(S);

  FOSVersion := OSVersion;
  FAppVersion := BuildVersion;
  FCPUInfo := CPUName;
end;

procedure TAppAnalytics.TrackControlFocused(AHandle: THandle);
var
  S: string;
  TargetControl: TControl;
begin
  S := 'ControlFocus|' + GetTimestamp; //Do not localize
  TargetControl := FindControl(AHandle);
  if (TargetControl <> nil) and (TargetControl <> FFocusedControl) then
  begin
    S := S + '|' + TargetControl.ClassName + '|' + TargetControl.Name +
      '|' + FLastControlClassName + '|' + FLastControlName;
    Log(S);
    FFocusedControl := TargetControl;
    FLastControlClassName := TargetControl.ClassName;
    FLastControlName := TargetControl.Name;
  end;
end;

procedure TAppAnalytics.TrackEvent(ACategory: string;
  AAction: string = ''; ALabel: string = ''; AValue: Double = 0.0);
var
  S: string;
begin
  if not Active then
    Exit;
  S := ACategory;
  if AAction <> '' then
  begin
    S := S + '|' + AAction;
    if ALabel <> '' then
    begin
      S := S + '|' + ALabel;
      S := S + '|' + FloatToStr(AValue);
    end;
  end;
  Log('TrackEvent|' + GetTimestamp + '|' + S); //Do not localize
end;

procedure TAppAnalytics.TrackException(Sender: TObject; E: Exception);
begin
  Log('AppCrash|' + GetTimestamp + '|' + E.ClassName + '|' + E.Message); //Do not localize
  if Assigned(FOldExceptionHandler) then
    FOldExceptionHandler(Sender, E)
  else
    Application.ShowException(E);
end;

procedure TAppAnalytics.TrackWindowActivated(AHandle: THandle);
var
  S: string;
  TargetForm: TControl;
begin
  S := 'FormActivate|' + GetTimestamp; //Do not localize
  TargetForm := FindControl(AHandle);
  if (TargetForm <> nil) and (TargetForm <> FActiveForm) then
  begin
    S := S + '|' + TargetForm.ClassName + '|' + TargetForm.Name +
             '|' + FLastWindowClassName + '|' + FLastWindowName;
    Log(S);
    FActiveForm := TForm(TargetForm);
    FLastWindowClassName := TargetForm.ClassName;
    FLastWindowName := TargetForm.Name;
  end;
end;

procedure TAppAnalytics.UpdateTimerFire(Sender: TObject);
begin
  if not (csDesigning in ComponentState) then
    StartSending;
end;

{ TAnalyticsThread }

procedure TAnalyticsThread.Execute;
begin
  if GlobalAnalytics <> nil then
    GlobalAnalytics.SendData;
end;

initialization
  AnalyticsCriticalSection := TCriticalSection.Create;

finalization
  AnalyticsCriticalSection.Free;

end.
