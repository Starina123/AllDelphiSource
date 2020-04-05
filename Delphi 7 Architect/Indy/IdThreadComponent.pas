{-----------------------------------------------------------------------------
 UnitName: IdThreadComponent
 Author:   Andrew P.Rybin [magicode@mail.ru]
 Creation: 12.03.2002
 Version:  0.1.0
 Purpose:
 History:  Based on my TmcThread
 2002-05-03 -Andrew P.Rybin
   -Stéphane Grobéty (Fulgan) suggestion: component is Data owner, don't FreeAndNIL Data property
   -special TThread.OnTerminate support (it is sync-event)
 2002-05-23 -APR
   -right support for Thread terminate
-----------------------------------------------------------------------------}

unit IdThreadComponent;

interface

uses
  Classes, IdBaseComponent,
  IdException, IdGlobal, IdThread,
  SysUtils;

const
  IdThreadComponentDefaultPriority = tpNormal;
  IdThreadComponentDefaultStopMode = smTerminate;

type
  TIdCustomThreadComponent = class;

  TIdExceptionThreadComponentEvent = procedure(Sender: TIdCustomThreadComponent; AException: Exception) of object;
  TIdNotifyThreadComponentEvent = procedure(Sender: TIdCustomThreadComponent) of object;
  //TIdSynchronizeThreadComponentEvent = procedure(Sender: TIdCustomThreadComponent; AData: Pointer) of object;

  TIdCustomThreadComponent = class(TIdBaseComponent)
  protected
    FActive: Boolean;
    FPriority : TIdThreadPriority;
    FStopMode : TIdThreadStopMode;
    FThread: TIdThread;
    //
    FOnAfterExecute: TIdNotifyThreadComponentEvent;
    FOnAfterRun: TIdNotifyThreadComponentEvent;
    FOnBeforeExecute: TIdNotifyThreadComponentEvent;
    FOnBeforeRun: TIdNotifyThreadComponentEvent;
    FOnCleanup: TIdNotifyThreadComponentEvent;
    FOnException: TIdExceptionThreadComponentEvent;
    FOnRun: TIdNotifyThreadComponentEvent;
    FOnStopped: TIdNotifyThreadComponentEvent;
    FOnTerminate: TIdNotifyThreadComponentEvent;
    //
    function  GetActive: Boolean;
    function  GetData: TObject;
    function  GetHandle: THandle;
    function  GetPriority: TIdThreadPriority;
    function  GetReturnValue: Integer;
    function  GetStopMode: TIdThreadStopMode;
    function  GetStopped: Boolean;
    function  GetSuspended: Boolean;
    function  GetTerminatingException: string;
    function  GetTerminatingExceptionClass: TClass;
    function  GetTerminated: Boolean;
    procedure Loaded; override;
    procedure SetActive(const AValue: Boolean); virtual;
    procedure SetData(const AValue: TObject);
    procedure SetOnTerminate(const AValue: TIdNotifyThreadComponentEvent);
    procedure SetPriority(const AValue: TIdThreadPriority);
    procedure SetReturnValue(const AValue: Integer);
    procedure SetStopMode(const AValue: TIdThreadStopMode);

    // event triggers
    procedure DoAfterExecute; virtual;
    procedure DoAfterRun; virtual;
    procedure DoBeforeExecute; virtual;
    procedure DoBeforeRun; virtual;
    procedure DoCleanup; virtual;
    procedure DoException(AThread: TIdThread; AException: Exception); virtual; //thev
    procedure DoRun; virtual;
    procedure DoStopped(AThread: TIdThread); virtual; //thev
    procedure DoTerminate(Sender: TObject); virtual; //thev
    //
    property  Active: Boolean read GetActive write SetActive default FALSE;
    property  Priority: TIdThreadPriority read GetPriority write SetPriority;
    property  StopMode: TIdThreadStopMode read GetStopMode write SetStopMode;
    // events
    property  OnAfterExecute: TIdNotifyThreadComponentEvent read FOnAfterExecute write FOnAfterExecute;
    property  OnAfterRun: TIdNotifyThreadComponentEvent read FOnAfterRun write FOnAfterRun;
    property  OnBeforeExecute: TIdNotifyThreadComponentEvent read FOnBeforeExecute write FOnBeforeExecute;
    property  OnBeforeRun: TIdNotifyThreadComponentEvent read FOnBeforeRun write FOnBeforeRun;
    property  OnCleanup: TIdNotifyThreadComponentEvent read FOnCleanup write FOnCleanup;
    property  OnException: TIdExceptionThreadComponentEvent read FOnException write FOnException;
    property  OnRun: TIdNotifyThreadComponentEvent read FOnRun write FOnRun;
    property  OnStopped: TIdNotifyThreadComponentEvent read FOnStopped write FOnStopped;
    property  OnTerminate: TIdNotifyThreadComponentEvent read FOnTerminate write SetOnTerminate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Start; virtual;
    procedure Stop; virtual;
    procedure Synchronize(AMethod: TThreadMethod); overload;
    procedure Synchronize(AMethod: TMethod); overload;

    procedure Terminate; virtual;
    procedure TerminateAndWaitFor; virtual;
    function  WaitFor: LongWord;
    // props
    property  Data: TObject read GetData write SetData;
    property  Handle: THandle read GetHandle;
    property  ReturnValue: Integer read GetReturnValue write SetReturnValue;
    property  Stopped: Boolean read GetStopped;
    property  Suspended: Boolean read GetSuspended;
    property  TerminatingException: string read GetTerminatingException;
    property  TerminatingExceptionClass: TClass read GetTerminatingExceptionClass;
    property  Terminated: Boolean read GetTerminated;
  published
  End;//TIdCustomThreadComponent

  TIdThreadComponent = class(TIdCustomThreadComponent)
  published
    property  Active;
    property  Priority default IdThreadComponentDefaultPriority;
    property  StopMode default IdThreadComponentDefaultStopMode;
  // events
    property  OnAfterExecute;
    property  OnAfterRun;
    property  OnBeforeExecute;
    property  OnBeforeRun;
    property  OnCleanup;
    property  OnException;
    property  OnRun;
    property  OnStopped;
    property  OnTerminate;
  End;//TIdThreadComponent

  //For Component-writers ONLY!
  TIdThreadEx = class(TIdThread)
  protected
    FThreadComponent: TIdCustomThreadComponent;
    //
    procedure AfterRun; override;
    procedure AfterExecute; override;
    procedure BeforeExecute; override;
    procedure BeforeRun; override;
    procedure Cleanup; override;
    procedure Run; override;
  public
    constructor Create(AThreadComponent: TIdCustomThreadComponent); reintroduce;
  End;//TIdThreadEx

implementation


{ TIdThreadEx }

procedure TIdThreadEx.AfterExecute;
Begin
  try
    FThreadComponent.DoAfterExecute;
  finally
    FThreadComponent.FActive := FALSE;
  end;
End;//

procedure TIdThreadEx.AfterRun;
Begin
  FThreadComponent.DoAfterRun;
End;//

procedure TIdThreadEx.BeforeExecute;
Begin
  FThreadComponent.DoBeforeExecute;
End;//

procedure TIdThreadEx.BeforeRun;
Begin
  FThreadComponent.DoBeforeRun;
End;//

procedure TIdThreadEx.Cleanup;
Begin
  //don't free FData. Now Component is Data owner! inherited Cleanup;
  FThreadComponent.DoCleanup;
End;//

constructor TIdThreadEx.Create(AThreadComponent: TIdCustomThreadComponent);
Begin
  inherited Create(TRUE);
  FThreadComponent := AThreadComponent;
  FOnException := FThreadComponent.DoException;
  FOnStopped := FThreadComponent.DoStopped;
End;//TIdThreadEx.Create


procedure TIdThreadEx.Run;
Begin
  FThreadComponent.DoRun;
End;//

{ TIdCustomThreadComponent }

procedure TIdCustomThreadComponent.DoAfterExecute;
Begin
  if Assigned(FOnAfterExecute) then FOnAfterExecute(SELF);
End;//

procedure TIdCustomThreadComponent.DoAfterRun;
Begin
  if Assigned(FOnAfterRun) then FOnAfterRun(SELF);
End;//

procedure TIdCustomThreadComponent.DoBeforeExecute;
Begin
  if Assigned(FOnBeforeExecute) then FOnBeforeExecute(SELF);
End;//

procedure TIdCustomThreadComponent.DoBeforeRun;
Begin
  if Assigned(FOnBeforeRun) then FOnBeforeRun(SELF);
End;//

procedure TIdCustomThreadComponent.DoCleanup;
Begin
  if Assigned(FOnCleanup) then FOnCleanup(SELF);
End;//

constructor TIdCustomThreadComponent.Create(AOwner: TComponent);
Begin
  inherited Create(AOwner);
  StopMode := IdThreadComponentDefaultStopMode;
  Priority := IdThreadComponentDefaultPriority;
End;//TIdCustomThreadComponent.Create

destructor TIdCustomThreadComponent.Destroy;
Begin
  {FThread.TerminateAndWaitFor;}
  //make sure thread is not active before we attempt to destroy it
  if Assigned(FThread) then begin
    FThread.Terminate;
    if FThread.Suspended then begin
      FThread.Resume; //resume for terminate
    end;
  end;
  FreeAndNIL(FThread);
  inherited Destroy;
End;//

procedure TIdCustomThreadComponent.DoException(AThread: TIdThread; AException: Exception);
Begin
  if Assigned(FOnException) then begin
    FOnException(SELF,AException);
  end;
End;//TIdThread.OnException

procedure TIdCustomThreadComponent.DoStopped(AThread: TIdThread);
Begin
  if Assigned(FOnStopped) then begin
    FOnStopped(SELF);
  end;
End;//TIdThread.OnStopped

procedure TIdCustomThreadComponent.DoTerminate;
Begin
  if Assigned(FOnTerminate) then begin
    FOnTerminate(SELF);
  end;
End;//TThread.OnTerminate

function TIdCustomThreadComponent.GetData: TObject;
Begin
  Result := FThread.Data;
End;//

function TIdCustomThreadComponent.GetHandle: THandle;
Begin
  Result := GetThreadHandle(FThread);
End;//

function TIdCustomThreadComponent.GetReturnValue: Integer;
Begin
  Result := FThread.ReturnValue;
End;//

function TIdCustomThreadComponent.GetStopMode: TIdThreadStopMode;
Begin
  if FThread = NIL then begin
    Result := FStopMode;
  end
  else begin
    Result := FThread.StopMode;
  end;
End;//

function TIdCustomThreadComponent.GetStopped: Boolean;
Begin
  Result := FThread.Stopped;
End;//

function TIdCustomThreadComponent.GetSuspended: Boolean;
Begin
  Result := FThread.Suspended;
End;//

function TIdCustomThreadComponent.GetTerminated: Boolean;
Begin
  Result := FThread.Terminated;
End;//

function TIdCustomThreadComponent.GetTerminatingException: string;
Begin
  Result := FThread.TerminatingException;
End;//

function TIdCustomThreadComponent.GetTerminatingExceptionClass: TClass;
Begin
  Result := FThread.TerminatingExceptionClass;
End;//

procedure TIdCustomThreadComponent.Loaded;
Begin
  inherited Loaded;
  // Active = True must not be performed before all other props are loaded
  if Assigned(OnTerminate) then begin
    FThread.OnTerminate := DoTerminate;
  end;

  if FActive then begin
    FActive := False;
    Active := True;
  end;
End;//Loaded -> Load design-time properties

procedure TIdCustomThreadComponent.DoRun;
Begin
  if Assigned(FOnRun) then begin
    FOnRun(SELF);
  end;
End;//

procedure TIdCustomThreadComponent.SetActive(const AValue: Boolean);
begin
  if not (csDesigning in ComponentState) then begin
    if FActive<>AValue then begin
      if AValue then begin
        Start;
      end else begin
        Stop;
      end;
    end;//if
  end;
  FActive:= AValue; //component load
End;//SetActive

procedure TIdCustomThreadComponent.SetData(const AValue: TObject);
Begin
// this should not be accessed at design-time.
  FThread.Data := AValue;
End;//

procedure TIdCustomThreadComponent.SetReturnValue(const AValue: Integer);
Begin
// this should not be accessed at design-time.
  FThread.ReturnValue := AValue;
End;//

procedure TIdCustomThreadComponent.SetStopMode(const AValue: TIdThreadStopMode);
Begin
  if Assigned(FThread) and NOT FThread.Terminated then begin
    FThread.StopMode := AValue;
  end;
  FStopMode := AValue;
End;//

procedure TIdCustomThreadComponent.Start;
Begin
  if NOT(csDesigning in ComponentState) then begin
    if Assigned(FThread) and FThread.Terminated then begin
      FreeAndNIL(FThread);
    end;//if Thread is dead

    if NOT Assigned(FThread) then begin
      FThread := TIdThreadEx.Create(SELF);
    end;

    FThread.StopMode := FStopMode;
    FThread.Priority := FPriority;
    FThread.Start;
  end;//if
End;//Start

procedure TIdCustomThreadComponent.Stop;
Begin
  if Assigned(FThread) then begin
    FThread.Stop;
  end;
End;//

procedure TIdCustomThreadComponent.Synchronize(AMethod: TThreadMethod);
Begin
  FThread.Synchronize(AMethod);
End;//

procedure TIdCustomThreadComponent.Synchronize(AMethod: TMethod);
Begin
  FThread.Synchronize(AMethod);
End;//

procedure TIdCustomThreadComponent.Terminate;
Begin
  FThread.Terminate;
End;//

procedure TIdCustomThreadComponent.TerminateAndWaitFor;
Begin
  FThread.TerminateAndWaitFor;
End;//

function TIdCustomThreadComponent.WaitFor: LongWord;
Begin
  Result := FThread.WaitFor;
End;//

function TIdCustomThreadComponent.GetPriority: TIdThreadPriority;
Begin
  if csDesigning in ComponentState then begin
    Result := FPriority;
  end
  else begin
    Result := FThread.Priority;
  end;
End;//

procedure TIdCustomThreadComponent.SetPriority(const AValue: TIdThreadPriority);
Begin
  if Assigned(FThread) and NOT FThread.Terminated then begin
    FThread.Priority := AValue;
  end;
  FPriority := AValue;
End;//

function TIdCustomThreadComponent.GetActive: Boolean;
Begin
  if csDesigning in ComponentState then begin
    Result := FActive;
  end else begin
    Result := NOT FThread.Stopped;
  end;
End;//

procedure TIdCustomThreadComponent.SetOnTerminate(const AValue: TIdNotifyThreadComponentEvent);
Begin
  FOnTerminate := AValue;
  if Assigned(FThread) then begin
    if Assigned(AValue) then begin
      FThread.OnTerminate := DoTerminate;
    end
    else begin
      FThread.OnTerminate := NIL;
    end;
  end;
End;//

end.

