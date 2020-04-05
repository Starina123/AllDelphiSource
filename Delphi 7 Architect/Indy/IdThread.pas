unit IdThread;

{
2002-03-12 -Andrew P.Rybin
  -TerminatingExceptionClass,SynchronizeEx
}
{$I IdCompilerDefines.inc}

interface

uses
  Classes,
  IdException,
  IdGlobal,
  SysUtils, SyncObjs;

type
  EIdThreadException = class(EIdException);
  EIdThreadTerminateAndWaitFor = class(EIdThreadException);

  TIdThreadStopMode = (smTerminate, smSuspend);
  TIdThread = class;
  TIdExceptionThreadEvent = procedure(AThread: TIdThread; AException: Exception) of object;
  TIdNotifyThreadEvent = procedure(AThread: TIdThread) of object;
  TIdSynchronizeThreadEvent = procedure(AThread: TIdThread; AData: Pointer) of object;

  // Expose protected members
  TIdBaseThread = class(TThread)
  public
    procedure Synchronize(Method: TThreadMethod); overload;
    procedure Synchronize(Method: TMethod); overload;
    //
    property  ReturnValue;
    property  Terminated;
  End;//TIdBaseThread

  TIdThread = class(TIdBaseThread)
  protected
    FData: TObject;
    FLock: TCriticalSection;
    FStopMode: TIdThreadStopMode;
    FStopped: Boolean;
    FTerminatingException: string;
    FTerminatingExceptionClass: TClass;
    FOnException: TIdExceptionThreadEvent;
    FOnStopped: TIdNotifyThreadEvent;
    //
    procedure AfterRun; virtual; //3* Not abstract - otherwise it is required
    procedure AfterExecute; virtual;//5 Not abstract - otherwise it is required
    procedure BeforeExecute; virtual;//1 Not abstract - otherwise it is required
    procedure BeforeRun; virtual; //2* Not abstract - otherwise it is required
    procedure Cleanup; virtual;//4*
    procedure DoException (AException: Exception); virtual;
    procedure DoStopped; virtual;
    procedure Execute; override;
    function  GetStopped: Boolean;
    procedure Run; virtual; abstract;
  public
    constructor Create(ACreateSuspended: Boolean = True); virtual;
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Stop; virtual;

    // Here to make virtual
    procedure Terminate; virtual;
    procedure TerminateAndWaitFor; virtual;
    //
    property Data: TObject read FData write FData;
    property StopMode: TIdThreadStopMode read FStopMode write FStopMode;
    property Stopped: Boolean read GetStopped;
    // in future versions (D6+) we must move to TThread.FatalException
    property TerminatingException: string read FTerminatingException;
    property TerminatingExceptionClass: TClass read FTerminatingExceptionClass;
    // events
    property OnException: TIdExceptionThreadEvent read FOnException write FOnException;
    property OnStopped: TIdNotifyThreadEvent read FOnStopped write FOnStopped;
  End;//TIdThread

  TIdThreadClass = class of TIdThread;

implementation
uses IdResourceStrings;

procedure TIdThread.TerminateAndWaitFor;
begin
  if FreeOnTerminate then begin
    raise EIdThreadTerminateAndWaitFor.Create(RSThreadTerminateAndWaitFor); 
  end;
  Terminate;
  if Suspended then begin
    Resume;
  end;
  WaitFor;
end;

procedure TIdThread.BeforeRun;
begin
end;

procedure TIdThread.AfterRun;
begin
end;

procedure TIdThread.BeforeExecute;
begin
end;

procedure TIdThread.AfterExecute;
Begin
end;

procedure TIdThread.Execute;
begin
  try
    try
      BeforeExecute;
      while not Terminated do begin
        if Stopped then begin
          DoStopped;
          // It is possible that either in the DoStopped or from another thread,
          // the thread is restarted, in which case we dont want to restop it.
          if Stopped then begin // DONE: if terminated?
            if Terminated then begin
              Break;
            end;
            Suspended := True; // Thread manager will revive us
            if Terminated then begin
              Break;
            end;
          end;
        end;

        try
          BeforeRun;
          try
            while not Stopped do begin
              Run;
            end;
          finally
            AfterRun;
          end;//tryf
        finally
          Cleanup;
        end;

      end;//while NOT Terminated
    finally
      AfterExecute;
    end;
  except
    on E: Exception do begin
      FTerminatingExceptionClass := E.ClassType;
      FTerminatingException := E.Message;
      DoException(E);
      Terminate;
    end;
  end;//trye
end;

constructor TIdThread.Create(ACreateSuspended: Boolean);
begin
  // Before inherited - inherited creates the actual thread and if not suspeded
  // will start before we initialize
  FStopped := ACreateSuspended;
  FLock := TCriticalSection.Create;
  try
    inherited Create(ACreateSuspended);
  except
    FreeAndNil(FLock);
    raise;
  end;
end;

destructor TIdThread.Destroy;
begin
  FreeOnTerminate := FALSE; //prevent destroy between Terminate & WaitFor
  inherited Destroy; //Terminate&WaitFor
  Cleanup;
  FreeAndNil(FLock); 
end;

procedure TIdThread.Start;
begin
  FLock.Enter; try
    if Stopped then begin
      // Resume is also called for smTerminate as .Start can be used to initially start a
      // thread that is created suspended
      FStopped := False;
      Suspended := False;
    end;
  finally FLock.Leave; end;
end;

procedure TIdThread.Stop;
begin
  FLock.Enter;
  try
    if not Stopped then begin
      case FStopMode of
        smTerminate: Terminate;
        // DO NOT suspend here. Suspend is immediate. See Execute for implementation
        smSuspend: ;
      end;
      FStopped := True;
    end;
  finally FLock.Leave; end;
end;

function TIdThread.GetStopped: Boolean;
begin
  if Assigned(FLock) then begin
    FLock.Enter;
    try
      // Suspended may be true if checking stopped from another thread
      Result := Terminated or FStopped or Suspended;
    finally FLock.Leave; end;
  end else begin
    Result := TRUE; //user call Destroy
  end;
End;//GetStopped

procedure TIdThread.DoStopped;
begin
  if Assigned(OnStopped) then begin
    OnStopped(Self);
  end;
end;

procedure TIdThread.DoException (AException: Exception);
Begin
  if Assigned(FOnException) then begin
    FOnException(self, AException);
  end;
end;

procedure TIdThread.Terminate;
begin
  FStopped := True;
  inherited Terminate;
end;

procedure TIdThread.Cleanup;
begin
  FreeAndNil(FData);
end;

{ TIdBaseThread }

procedure TIdBaseThread.Synchronize(Method: TThreadMethod);
Begin
  inherited Synchronize(Method);
End;//

procedure TIdBaseThread.Synchronize(Method: TMethod);
Begin
  inherited Synchronize(TThreadMethod(Method));
End;//

end.
