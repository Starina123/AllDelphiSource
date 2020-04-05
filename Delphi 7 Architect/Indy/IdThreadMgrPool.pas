unit IdThreadMgrPool;

interface

uses
  Classes,
  IdThread, IdThreadMgr;

type
  TIdThreadMgrPool = class(TIdThreadMgr)
  protected
    FPoolSize: Integer;
    FThreadPool: TThreadList;
    //
    procedure ThreadStopped(AThread: TIdThread);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetThread: TIdThread; override;
    procedure ReleaseThread(AThread: TIdThread); override;
    procedure TerminateThreads; override;
  published
    property PoolSize: Integer read FPoolSize write FPoolSize default 0;
  end;

implementation

uses
  IdGlobal,
  SysUtils;

{ TIdThreadMgrPool }

constructor TIdThreadMgrPool.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FThreadPool := TThreadList.Create;
end;

destructor TIdThreadMgrPool.Destroy;
var
  i: integer;
  LThreads: TList;
begin
  PoolSize := 0;
  LThreads := FThreadPool.LockList;
  try
    for i := 0 to LThreads.Count - 1 do
    begin
      TIdThread(LThreads[i]).Free;
    end;
  finally FThreadPool.UnlockList; end;
  FreeAndNil(FThreadPool);
  inherited Destroy;
end;

function TIdThreadMgrPool.GetThread: TIdThread;
var
  i: integer;
  LThreadPool: TList;
begin
  LThreadPool := FThreadPool.LockList;
  try
    // Use this as a chance to clean up thread pool
    i := LThreadPool.Count - 1;
{    while (i > 0) and not (TIdThread(FThreadPool[i]).Suspended and TIdThread(FThreadPool[i]).Stopped) do begin
      if TIdThread(FThreadPool[i]).Terminated then begin // cleanup
        TIdThread(FThreadPool[i]).Free;
        FThreadPool.Delete(i);
      end;
      Dec(i);
    end;}
    if i >= 0 then
    begin
      Result := TIdThread(LThreadPool[0]);
      LThreadPool.Delete(0);
    end else begin
      Result := CreateNewThread;
      Result.StopMode := smSuspend;
    end;
  finally FThreadPool.UnlockList; end;
  ActiveThreads.Add(Result);
end;

procedure TIdThreadMgrPool.ReleaseThread(AThread: TIdThread);
var
  LThreadPool: TList;
begin
  ActiveThreads.Remove(AThread);
  LThreadPool := FThreadPool.LockList;
  try
  // PoolSize = 0 means that we will keep all active threads in the thread pool
    if ((PoolSize > 0) and (LThreadPool.Count >= PoolSize)) or AThread.Terminated then begin
      if IsCurrentThread(AThread) then begin
        AThread.FreeOnTerminate := True;
        AThread.Terminate;
      end else begin
        if not AThread.Stopped then
        begin
          AThread.TerminateAndWaitFor;
        end;
        AThread.Free;
      end;
    end else begin
      if not AThread.Suspended then begin
        AThread.OnStopped := ThreadStopped;
        AThread.Stop;
      end
      else begin
        AThread.Free;
      end;
    end;
  finally FThreadPool.UnlockList; end;
end;

procedure TIdThreadMgrPool.TerminateThreads;
begin
  inherited TerminateThreads;

  with FThreadPool.LockList do
  try
    while Count > 0 do begin
      TIdThread(Items[0]).FreeOnTerminate := true;
      TIdThread(Items[0]).Terminate;
      TIdThread(Items[0]).Start;
      Delete(0);
    end;
  finally
    FThreadPool.UnlockList;
  end;
end;

procedure TIdThreadMgrPool.ThreadStopped(AThread: TIdThread);
begin
  FThreadPool.Add(AThread);
end;

end.
