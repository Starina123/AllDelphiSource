{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.AppGlue;

{ Please note that this unit exports "ANativeActivity_onCreate" method, which will be executed automatically
  when Android Native Activity starts. During initial execution of this code, none of RTL or "System.pas" 
  functions are available, which includes but not limited to exception handling, locale-related compare and
  threading. Therefore, such code may only use basic language constructs and rely exclusively on "libc"
  functions provided in Bionic. This may include some Androidapi.* and Posix.* units, but special care is 
  to be taken to make sure that the required functionality is properly implemented.

  If you make any changes/additions to the code herein, it must be reviewed by the senior team members prior to
  committing to the repository. Be prepared to fully defend and explain the changes, why they are necessary and
  what problem it is purporting to solve. Any violation of the parameters by which changes may be made to this
  unit will result in the outright rejection of the proposed changes. Proceed with extreme caution. }

interface

uses
  System.Types, Posix.SysTypes, Posix.StdLib, Posix.DlfCn, Androidapi.Configuration, Androidapi.Looper,
  Androidapi.Input, Androidapi.Rect, Androidapi.NativeWindow, Androidapi.NativeActivity;

type

  TAndroidApplicationGlue = class;

  TAndroidApplicationCommand = (Start, Resume, Stop, Pause, InputChanged, InitWindow, TermWindow, WindowResized,
    WindowRedrawNeeded, GainedFocus, LostFocus, ConfigChanged, SaveState, LowMemory, Destroy);
  TAndroidApplicationCommands = set of TAndroidApplicationCommand;

  TOnApplicationCommand = procedure(const App: TAndroidApplicationGlue; const ACommand: TAndroidApplicationCommand) of object;
  TOnInputEvent = function(const App: TAndroidApplicationGlue; const AEvent: PAInputEvent): Int32 of object;
  TOnContentRectChanged = procedure(const App: TAndroidApplicationGlue; const ARect: TRect) of object;

  TAndroidApplicationGlue = class
  private
    class var FApplication: TAndroidApplicationGlue;
  private
    FActivity: PANativeActivity;
    FLooper: PALooper;
    FInputQueue: PAInputQueue;
    FConfig: PAConfiguration;
    FWindow: PANativeWindow;
    FSavedState: Pointer;
    FSavedStateSize: size_t;
    FOnInputEvent: TOnInputEvent;
    FOnApplicationCommandEvent: TOnApplicationCommand;
    FOnContentRectEvent: TOnContentRectChanged;
    function GetActivityCallbacks: PANativeActivityCallbacks;
    procedure BindCallbacks;
    procedure UnbindCallbacks;
    procedure SetInputQueue(const AInputQueue: PAInputQueue);
    procedure SetWindow(const AWindow: PANativeWindow);
  private
    { Activity States }

    /// <summary>Called when the activity is starting.</summary>
    class procedure OnCreate(activity: PANativeActivity; savedState: Pointer; savedStateSize: size_t); cdecl; static;
    /// <summary>Called after onCreate(Bundle) — or after onRestart() when the activity had been stopped,
    /// but is now again being displayed to the user. It will be followed by onResume().</summary>
    class procedure OnStart(activity: PANativeActivity); cdecl; static;
    /// <summary>Called after onRestoreInstanceState(Bundle), onRestart(), or onPause(), for your activity to start
    /// interacting with the user. This is a good place to begin animations, open exclusive-access devices (such as the camera), etc.</summary>
    class procedure OnResume(activity: PANativeActivity); cdecl; static;
    /// <summary>Called as part of the activity lifecycle when an activity is going into the background,
    /// but has not (yet) been killed. The counterpart to onResume().</summary>
    class procedure OnPause(activity: PANativeActivity); cdecl; static;
    /// <summary>Called when you are no longer visible to the user. You will next receive either onRestart(),
    /// onDestroy(), or nothing, depending on later user activity.</summary>
    class procedure OnStop(activity: PANativeActivity); cdecl; static;
    /// <summary>Perform any final cleanup before an activity is destroyed.</summary>
    class procedure OnDestroy(activity: PANativeActivity); cdecl; static;

    { Input events }

    /// <summary>Called when the given InputQueue is now associated with the thread making this call, so it can start
    /// receiving events from it.</summary>
    class procedure OnInputQueueCreated(activity: PANativeActivity; queue: PAInputQueue); cdecl; static;
    /// <summary>Called when the given InputQueue is no longer associated with the thread and thus not
    /// dispatching events.</summary>
    class procedure OnInputQueueDestroyed(activity: PANativeActivity; queue: PAInputQueue); cdecl; static;
    /// <summary>Processes input events</summary>
    class function InputEventHandler(FileDescriptor, Events: Integer; Data: Pointer): Integer; cdecl; static;

    { Native Window }

    /// <summary>Called when activity creates native window</summary>
    class procedure onNativeWindowCreated(activity: PANativeActivity; window: PANativeWindow); cdecl; static;
    /// <summary>Called when activity destroyes native window</summary>
    class procedure onNativeWindowDestroyed(activity: PANativeActivity; window: PANativeWindow); cdecl; static;
    /// <summary>Called when window changes focus</summary>
    class procedure onWindowFocusChanged(activity: PANativeActivity; focused: Integer); cdecl; static;
    /// <summary>Called when window need to be redrawn</summary>
    class procedure onNativeWindowRedrawNeeded(activity: PANativeActivity; window: PANativeWindow); cdecl; static;
    /// <summary>Called when size of native window is changed</summary>
    class procedure onNativeWindowResized(activity: PANativeActivity; window: PANativeWindow); cdecl; static;
    /// <summary>Called when activity's content view changes its size</summary>
    class procedure onContentRectChanged(Activity: PANativeActivity; Rect: PARect); cdecl; static;

    { Configuration }

    /// <summary>Called by the system when the device configuration changes while your activity is running.</summary>
    class procedure onConfigurationChanged(activity: PANativeActivity); cdecl; static;

    { Low Memory }

    /// <summary>This is called when the overall system is running low on memory, and actively running processes
    /// should trim their memory usage.</summary>
    class procedure onLowMemory(activity: PANativeActivity); cdecl; static;

    { Save Instance State }

    /// <summary>Called to retrieve per-instance state from an activity before being killed so that the state can be
    /// restored in onCreate(Bundle) or onRestoreInstanceState(Bundle).</summary>
    class function onSaveInstanceState(activity: PANativeActivity; outLen: psize_t): Pointer; cdecl; static;
  protected
    /// <summary>Invokes <c>OnApplicationCommandEvent</c> event with specified command</summary>
    procedure DoApplicationCommandChanged(const ACommand: TAndroidApplicationCommand); virtual;
    /// <summary>Invokes <c>OnContentRectEvent</c> event with specified new content rect</summary>
    procedure DoContentRectChanged(const ARect: TRect); virtual;
    /// <summary>Allocates and copy memory for saved state</summary>
    procedure AllocatedSavedState(ASavedState: Pointer; ASavedStateSize: size_t);
    /// <summary>Releases saved state memory</summary>
    procedure FreeSavedState;
    /// <summary>Pointer to the callback function table of the native application. You can set the functions here
    /// to your own callbacks. The callbacks pointer itself here should not be changed; it is allocated and managed
    /// for you by the framework.</summary>
    property Callbacks: PANativeActivityCallbacks read GetActivityCallbacks;
  public
    /// <summary>Creates instance of Application Glue and binds callbacks of native activity</summary>
    /// <remarks>Don't use this constructor directly. Instead on it use <c>Current</c> for avoiding conflict of
    /// TAndroidApplicationGlue instances</remarks>
    constructor Create(const AActivity: PANativeActivity; savedState: Pointer; savedStateSize: size_t);
    /// <summary>Unbinds native activity callbacks and releases all allocated resources</summary>
    destructor Destroy; override;
    /// <summary>Current instance of Android App Glue</summary>
    class property Current: TAndroidApplicationGlue read FApplication;
    /// <summary>The NativeActivity object instance that this app is running in.</summary>
    property NativeActivity: PANativeActivity read FActivity;
    /// <summary>The current configuration the app is running in.</summary>
    property Config: PAConfiguration read FConfig;
    /// <summary>When non-NULL, this is the input queue from which the app will receive user input events.</summary>
    property InputQueue: PAInputQueue write SetInputQueue;
    /// <summary>The Looper associated with the app's thread.</summary>
    property Looper: PALooper read FLooper;
    /// <summary>This is the last instance's saved state, as provided at creation time. It is NULL if there was no state.
    /// You can use this as you need; These variables should only be changed when processing
    /// a TAndroidApplicationCommand.SaveState, at which point they will be initialized to NULL and you can malloc your
    /// state and place the information here.  In that case the memory will be freed for you later.</summary>
    property SavedState: Pointer read FSavedState write FSavedState;
    property SavedStateSize: size_t read FSavedStateSize write FSavedStateSize;
    /// <summary>When non-NULL, this is the window surface that the app can draw in.</summary>
    property Window: PANativeWindow read FWindow;

    { Events }

    /// <sumamary>Fill this in with the function to process main app commands (TAndroidApplicationCommand)</summary>
    property OnApplicationCommandEvent: TOnApplicationCommand read FOnApplicationCommandEvent write FOnApplicationCommandEvent;
    /// <summary>Fill this in with the function to process changing rect of activity's content view</summary>
    property OnContentRectEvent: TOnContentRectChanged read FOnContentRectEvent write FOnContentRectEvent;
    /// <summary> Fill this in with the function to process input events. At this point the event has already been
    /// pre-dispatched, and it will be finished upon return. Return if you have handled the event, 0 for any default
    /// dispatching.</summary>
    property OnInputEvent: TOnInputEvent read FOnInputEvent write FOnInputEvent;
  end;

const
  /// <summary>Looper data ID of events coming from the AInputQueue of the application's window, which is returned as
  /// an identifier from ALooper_pollOnce().
  LOOPER_ID_INPUT = 2;

  /// <summary>Start of user-defined ALooper identifiers.</summary>
  LOOPER_ID_USER = 3;

/// <summary> Dummy function you can call to ensure glue code isn't stripped.</summary>
procedure app_dummy;

implementation

uses
  Androidapi.KeyCodes, Androidapi.Log, Androidapi.Consts;

procedure app_dummy;
begin
end;

{ TAndroidApplicationGlue }

procedure TAndroidApplicationGlue.AllocatedSavedState(ASavedState: Pointer; ASavedStateSize: size_t);
begin
  if savedState <> nil then
  begin
    FSavedState := __malloc(savedStateSize);
    FSavedStateSize := savedStateSize;
    Move(PByte(savedState)^, PByte(FSavedState)^, savedStateSize);
  end;
end;

procedure TAndroidApplicationGlue.BindCallbacks;
begin
  Callbacks^.onDestroy := @OnDestroy;
  Callbacks^.onStart := @onStart;
  Callbacks^.onResume := @onResume;
  Callbacks^.onSaveInstanceState := @onSaveInstanceState;
  Callbacks^.onPause := @onPause;
  Callbacks^.onStop := @onStop;
  Callbacks^.onConfigurationChanged := @onConfigurationChanged;
  Callbacks^.onContentRectChanged := @onContentRectChanged;
  Callbacks^.onLowMemory := @onLowMemory;
  Callbacks^.onWindowFocusChanged := @onWindowFocusChanged;
  Callbacks^.onNativeWindowCreated := @onNativeWindowCreated;
  Callbacks^.onNativeWindowDestroyed := @onNativeWindowDestroyed;
  Callbacks^.onNativeWindowRedrawNeeded := @onNativeWindowRedrawNeeded;
  Callbacks^.onNativeWindowResized := @onNativeWindowResized;
  Callbacks^.onInputQueueCreated := @onInputQueueCreated;
  Callbacks^.onInputQueueDestroyed := @onInputQueueDestroyed;
end;

constructor TAndroidApplicationGlue.Create(const AActivity: PANativeActivity; savedState: Pointer; savedStateSize: size_t);
begin
  inherited Create;
  FActivity := AActivity;
  BindCallbacks;
  FLooper := ALooper_forThread;
  FConfig := AConfiguration_new;
  AConfiguration_fromAssetManager(FConfig, FActivity^.assetManager);
  FInputQueue := nil;
  FWindow := nil;

  AllocatedSavedState(savedState, savedStateSize);
end;

destructor TAndroidApplicationGlue.Destroy;
begin
  UnbindCallbacks;
  FreeSavedState;
  if FInputQueue <> nil then
    AInputQueue_detachLooper(FInputQueue);
  AConfiguration_delete(FConfig);
  inherited;
end;

procedure TAndroidApplicationGlue.DoApplicationCommandChanged(const ACommand: TAndroidApplicationCommand);
begin
  if Assigned(OnApplicationCommandEvent) then
    OnApplicationCommandEvent(Self, ACommand);
end;

procedure TAndroidApplicationGlue.DoContentRectChanged(const ARect: TRect);
begin
  if Assigned(OnContentRectEvent) then
    OnContentRectEvent(Self, ARect);
end;

procedure TAndroidApplicationGlue.FreeSavedState;
begin
  if FSavedState <> nil then
  begin
    Posix.StdLib.free(FSavedState);
    FSavedState := nil;
    FSavedStateSize := 0;
  end;
end;

function TAndroidApplicationGlue.GetActivityCallbacks: PANativeActivityCallbacks;
begin
  Result := FActivity^.callbacks;
end;

class function TAndroidApplicationGlue.InputEventHandler(FileDescriptor, Events: Integer; Data: Pointer): Integer;
var
  Event: PAInputEvent;
  Handled: Int32;
  EventType: Int32;
begin
  Event := nil;
  while AInputQueue_getEvent(Current.FInputQueue, @Event) >= 0 do
  begin
    { Delphi: when you press "Back" button to hide virtual keyboard, the keyboard does not disappear but we stop
      receiving events unless the following workaround is placed here.

      This seems to affect Android versions 4.1 and 4.2. }
    EventType := AInputEvent_getType(Event);
    if ((EventType <> AINPUT_EVENT_TYPE_KEY) or (AKeyEvent_getKeyCode(Event) <> AKEYCODE_BACK)) then
      if AInputQueue_preDispatchEvent(Current.FInputQueue, Event) <> 0 then
        Continue;
    Handled := 0;
    if Assigned(Current.OnInputEvent) then
      Handled := Current.OnInputEvent(Current, Event);
    AInputQueue_finishEvent(Current.FInputQueue, Event, Handled);
  end;
  Result := 1;
end;

class procedure TAndroidApplicationGlue.onConfigurationChanged(activity: PANativeActivity);
begin
  AConfiguration_fromAssetManager(Current.Config, Current.NativeActivity^.assetManager);
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.ConfigChanged);
end;

class procedure TAndroidApplicationGlue.onContentRectChanged(Activity: PANativeActivity; Rect: PARect);
begin
  Current.DoContentRectChanged(TRect.Create(Rect.left, Rect.top, Rect.right, Rect.bottom));
end;

class procedure TAndroidApplicationGlue.OnCreate(activity: PANativeActivity; savedState: Pointer; savedStateSize: size_t);

  // Delphi: init system unit and RTL.
  procedure SystemEntry;
  type
    TMainFunction = procedure;
  var
    DlsymPointer: Pointer;
    EntryPoint: TMainFunction;
    Lib: NativeUInt;
    Info: dl_info;
  begin
    if dladdr(NativeUInt(@app_dummy), Info) <> 0 then
    begin
      Lib := dlopen(Info.dli_fname, RTLD_LAZY);
      if Lib <> 0 then
      begin
        DlsymPointer := dlsym(Lib, '_NativeMain');
        dlclose(Lib);
        if DlsymPointer <> nil then
        begin
          EntryPoint := TMainFunction(DlsymPointer);
          EntryPoint;
        end;
      end;
    end;
  end;

begin
  // According diagram of Android lifecycle activity can change state from OnStop to OnCreate. In this case, we will
  // need to avoid of repeated creation of system resources. Because we release our resource
  // in OnDestroy (last state of Activity).
  if System.DelphiActivity = nil then
  begin
    // Delphi: save Android activity for future use.
    System.DelphiActivity := activity;
    System.JavaMachine := activity^.vm;
    System.JavaContext := activity^.clazz;

    FApplication := TAndroidApplicationGlue.Create(activity, savedState, savedStateSize);

    activity^.instance := Pointer(FApplication);
    SystemEntry;
  end;
end;

class procedure TAndroidApplicationGlue.OnDestroy(activity: PANativeActivity);
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.Destroy);
  Current.DisposeOf;

  Halt(0);
end;

class procedure TAndroidApplicationGlue.OnInputQueueCreated(activity: PANativeActivity; queue: PAInputQueue);
begin
  Current.InputQueue := queue;
end;

class procedure TAndroidApplicationGlue.OnInputQueueDestroyed(activity: PANativeActivity; queue: PAInputQueue);
begin
  Current.InputQueue := nil;
end;

class procedure TAndroidApplicationGlue.onLowMemory(activity: PANativeActivity);
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.LowMemory);
end;

class procedure TAndroidApplicationGlue.onNativeWindowCreated(activity: PANativeActivity; window: PANativeWindow);
begin
  Current.SetWindow(window);
end;

class procedure TAndroidApplicationGlue.onNativeWindowDestroyed(activity: PANativeActivity; window: PANativeWindow);
begin
  Current.SetWindow(nil);
end;

class procedure TAndroidApplicationGlue.onNativeWindowRedrawNeeded(activity: PANativeActivity; window: PANativeWindow);
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.WindowRedrawNeeded);
end;

class procedure TAndroidApplicationGlue.onNativeWindowResized(activity: PANativeActivity; window: PANativeWindow);
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.WindowResized);
end;

class procedure TAndroidApplicationGlue.OnPause;
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.Pause);
end;

class procedure TAndroidApplicationGlue.OnResume;
begin
  { Delphi: It is unclear why this line is necessary in original AppGlue, but it prevents FireMonkey applications
    from recovering saved state. FireMonkey recovers saved state usually after APP_CMD_INIT_WINDOW, which happens
    much later after CMD_RESUME. }
  Current.FreeSavedState;
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.Resume);
end;

class function TAndroidApplicationGlue.onSaveInstanceState(activity: PANativeActivity; outLen: psize_t): Pointer;
var
  SavedState: Pointer;
begin
  SavedState := nil;
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.SaveState);
  if Current.FSavedState <> nil then
  begin
    SavedState := Current.FSavedState;
    outLen^ := Current.FSavedStateSize;
    Current.FSavedState := nil;
    Current.FSavedStateSize := 0;
  end;

  Result := SavedState;
end;

class procedure TAndroidApplicationGlue.OnStart;
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.Start);
end;

class procedure TAndroidApplicationGlue.OnStop;
begin
  Current.DoApplicationCommandChanged(TAndroidApplicationCommand.Stop);
end;

class procedure TAndroidApplicationGlue.onWindowFocusChanged(activity: PANativeActivity; focused: Integer);
begin
  if focused <> 0 then
    Current.DoApplicationCommandChanged(TAndroidApplicationCommand.GainedFocus)
  else
    Current.DoApplicationCommandChanged(TAndroidApplicationCommand.LostFocus);
end;

procedure TAndroidApplicationGlue.SetInputQueue(const AInputQueue: PAInputQueue);
begin
  if FInputQueue <> nil then
    AInputQueue_detachLooper(FInputQueue);

  FInputQueue := AInputQueue;

  if FInputQueue <> nil then
    AInputQueue_attachLooper(FInputQueue, FLooper, LOOPER_ID_INPUT, @InputEventHandler, nil);

  DoApplicationCommandChanged(TAndroidApplicationCommand.InputChanged);
end;

procedure TAndroidApplicationGlue.SetWindow(const AWindow: PANativeWindow);
begin
  if FWindow <> nil then
    DoApplicationCommandChanged(TAndroidApplicationCommand.TermWindow);

  FWindow := AWindow;

  if FWindow <> nil then
    DoApplicationCommandChanged(TAndroidApplicationCommand.InitWindow);
end;

procedure TAndroidApplicationGlue.UnbindCallbacks;
begin
  Callbacks^.onDestroy := nil;
  Callbacks^.onStart := nil;
  Callbacks^.onResume := nil;
  Callbacks^.onSaveInstanceState := nil;
  Callbacks^.onPause := nil;
  Callbacks^.onStop := nil;
  Callbacks^.onConfigurationChanged := nil;
  Callbacks^.onContentRectChanged := nil;
  Callbacks^.onLowMemory := nil;
  Callbacks^.onWindowFocusChanged := nil;
  Callbacks^.onNativeWindowCreated := nil;
  Callbacks^.onNativeWindowDestroyed := nil;
  Callbacks^.onNativeWindowRedrawNeeded := nil;
  Callbacks^.onNativeWindowResized := nil;
  Callbacks^.onInputQueueCreated := nil;
  Callbacks^.onInputQueueDestroyed := nil;
end;

procedure ANativeActivity_onCreate(activity: PANativeActivity; savedState: Pointer; savedStateSize: size_t); cdecl;
begin
  TAndroidApplicationGlue.OnCreate(activity, savedState, savedStateSize);
end;

exports
  ANativeActivity_onCreate name 'ANativeActivity_onCreate';
end.
