unit IdThreadMgrDefault;

interface

uses
  IdThread, IdThreadMgr;

type
  TIdThreadMgrDefault = class(TIdThreadMgr)
  public
    function GetThread: TIdThread; override;
    procedure ReleaseThread(AThread: TIdThread); override;
  end;

implementation

uses
  IdGlobal;

{ TIdThreadMgrDefault }

function TIdThreadMgrDefault.GetThread: TIdThread;
begin
  Result := CreateNewThread;
  ActiveThreads.Add(result);
end;

procedure TIdThreadMgrDefault.ReleaseThread(AThread: TIdThread);
begin
  if not IsCurrentThread(AThread) then begin
    // Test suspended and not stopped - it may be in the process of stopping.
    if not AThread.Suspended then begin
      AThread.TerminateAndWaitFor;
    end;
    AThread.Free;
  end else begin
    AThread.FreeOnTerminate := True;
    AThread.Terminate; //APR: same reason as MgrPool. ELSE threads leak if smSuspend
  end;
  ActiveThreads.Remove(AThread);
end;

end.

