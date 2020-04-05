{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Timer.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.SyncObjs, System.Generics.Collections, System.Messaging, Androidapi.JNI.Embarcadero, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, AndroidApi.JNI.App, FMX.Types;

type

  /// <summary>Implementation of timer service for Android</summary>
  TAndroidTimerService = class(TInterfacedObject, IFMXTimerService)
  protected
    /// <summary>Registers timer service in platform</summary>
    procedure RegisterService; virtual;
    /// <summary>Unregisters timer service from platform</summary>
    procedure UnregisterService; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXTimerService }
    /// <summary>Creates timer and assing <c>ATimerFunc</c></summary>
    /// <returns>Handle of timer for correet destroying by <c>DestroyTimer</c></returns>
    function CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
    /// <summary>Destroy timer by specified timer's handle</summary>
    function DestroyTimer(ATimer: TFmxHandle): Boolean;
    /// <summary>Returns current time in nano seconds</summary>
    function GetTick: Double;
  end;

implementation

uses
  System.SysUtils, System.Classes, Posix.Time, Androidapi.Helpers, FMX.Platform,
  FMX.Forms, FMX.Consts, FMX.Helpers.Android, Androidapi.JNI.Os;

type
  TAndroidTimer = class;

  TTimerRunnable = class(TJavaLocal, JRunnable)
  private
    FInterval: Integer;
    FTimer: TAndroidTimer; // Strong reference in order to keep object
  public
    constructor Create(const ATimer: TAndroidTimer; const AInterval: Integer);
    procedure run; cdecl;
  end;

  TAndroidTimer = class
  private
    FRunnable: TTimerRunnable;
    FTimerProc: TTimerProc;
    FStopped: Boolean;
  public
    constructor Create(const AInterval: Integer; const ATimerProc: TTimerProc);
    procedure Stop;
    property TimerProc: TTimerProc read FTimerProc;
    property Stopped: Boolean read FStopped;
  end;

{ TTimerRunnable }

constructor TTimerRunnable.Create(const ATimer: TAndroidTimer; const AInterval: Integer);
begin
  inherited Create;
  FTimer := ATimer;
  FInterval := AInterval;
  TAndroidHelper.MainHandler.postDelayed(Self, AInterval);
end;

procedure TTimerRunnable.run;
begin
  if not FTimer.Stopped then
  begin
    FTimer.TimerProc;
    TAndroidHelper.MainHandler.postDelayed(Self, FInterval);
  end
  else
    FTimer := nil;
end;

{ TAndroidTimerService }

constructor TAndroidTimerService.Create;
begin
  inherited;
  RegisterService;
end;

function TAndroidTimerService.CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
var
  Timer: TAndroidTimer;
begin
  Result := 0;
  if (AInterval > 0) and Assigned(ATimerProc) then
  begin
    Timer := TAndroidTimer.Create(AInterval, ATimerProc);
    Result := TFmxHandle(Timer);
  end;
end;

function TAndroidTimerService.DestroyTimer(ATimer: TFmxHandle): Boolean;
var
  Timer: TAndroidTimer;
begin
  Result := False;
  Timer := TAndroidTimer(ATimer);
  if Timer <> nil then
  begin
    Timer.Stop;
    Result := True;
  end;
end;

destructor TAndroidTimerService.Destroy;
begin
  UnregisterService;
  inherited;
end;

function TAndroidTimerService.GetTick: Double;
var
  Res: timespec;
begin
  clock_gettime(CLOCK_MONOTONIC, @Res);
  Result := (Int64(1000000000) * res.tv_sec + res.tv_nsec) / 1000000000;
end;

procedure TAndroidTimerService.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXTimerService) then
    TPlatformServices.Current.AddPlatformService(IFMXTimerService, Self);
end;

procedure TAndroidTimerService.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXTimerService);
end;

{ TAndroidTimer }

constructor TAndroidTimer.Create;
begin
  FRunnable := TTimerRunnable.Create(Self, AInterval);
  FTimerProc := ATimerProc;
end;

procedure TAndroidTimer.Stop;
begin
  FStopped := True;
end;

end.
