unit IdSync;

interface

// Author: Chad Z. Hower - a.k.a. Kudzu

uses
  Classes,
  IdGlobal, IdThread;

type
  TIdSync = class(TObject)
  protected
    FThread: TIdBaseThread;
  public
    constructor Create; overload; virtual;
    constructor Create(AThread: TIdBaseThread); overload; virtual;
    procedure DoSynchronize; virtual; abstract;
    procedure Synchronize;
    //
    property Thread: TIdBaseThread read FThread;
  end;

  TIdNotify = class(TObject)
  protected
    FMainThreadUsesNotify: Boolean;
  public
    constructor Create; virtual; // here to make virtual
    procedure DoNotify; virtual; abstract;
    procedure Notify;
    class procedure NotifyMethod(AMethod: TThreadMethod);
    //
    property MainThreadUsesNotify: Boolean read FMainThreadUsesNotify write FMainThreadUsesNotify;
  end;

  TIdNotifyMethod = class(TIdNotify)
  protected
    FMethod: TThreadMethod;
  public
    constructor Create(AMethod: TThreadMethod); reintroduce;
    procedure DoNotify; override;
  end;

implementation

uses
  SysUtils;

type
  // This is done with a NotifyThread instead of PostMessage because starting with D6/Kylix Borland
  // radically modified the mecanisms for .Synchronize. This is a bit more code in the end, but
  // its source compatible and does not rely on Indy directly accessing any OS APIs and performance
  // is still more than acceptable, especially considering Notifications are low priority.
  TIdNotifyThread = class(TIdBaseThread)
  protected
    FEvent: TIdLocalEvent;
    FNotifications: TThreadList;
  public
    procedure AddNotification(ASync: TIdNotify);
    constructor Create(ASuspended: Boolean);
    destructor Destroy; override;
    procedure Execute; override;
  end;

var
  GNotifyThread: TIdNotifyThread = nil;

procedure CreateNotifyThread;
begin
  if GNotifyThread = nil then begin
    GNotifyThread := TIdNotifyThread.Create(False);
  end;
end;

{ TIdSync }

constructor TIdSync.Create(AThread: TIdBaseThread);
begin
  inherited Create;
  FThread := AThread;
end;

constructor TIdNotify.Create;
begin
  inherited Create;
end;

procedure TIdNotify.Notify;
begin
  if InMainThread and (MainThreadUsesNotify = False) then begin
    DoNotify;
  end else begin
    CreateNotifyThread;
    GNotifyThread.AddNotification(Self);
  end;
end;

class procedure TIdNotify.NotifyMethod(AMethod: TThreadMethod);
begin
  TIdNotifyMethod.Create(AMethod).Notify;
end;

constructor TIdSync.Create;
begin
  CreateNotifyThread;
  FThread := GNotifyThread;
end;

procedure TIdSync.Synchronize;
begin
  FThread.Synchronize(DoSynchronize);
end;

{ TIdNotifyThread }

procedure TIdNotifyThread.AddNotification(ASync: TIdNotify);
begin
  FNotifications.Add(ASync);
  FEvent.SetEvent;
end;

constructor TIdNotifyThread.Create(ASuspended: Boolean);
begin
  FEvent := TIdLocalEvent.Create;
  FNotifications := TThreadList.Create;
  // Must be before - Thread starts running when we call inherited
  inherited Create(ASuspended);
end;

destructor TIdNotifyThread.Destroy;
begin
  // Free remaining Notifications if thre is somthing that is still in
  // the queue after thread was terminated
  with FNotifications.LockList do try
    while Count > 0 do begin
      TIdSync(Items[0]).Free;
      Delete(0);
    end;
  finally FNotifications.UnlockList; end;
  FreeAndNil(FNotifications);
  FreeAndNil(FEvent);
  inherited Destroy;
end;

procedure TIdNotifyThread.Execute;
// NOTE: Be VERY careful with making changes to this proc. It is VERY delicate and the order
// of execution is very important. Small changes can have drastic effects
var
  LNotifications: TList;
  LNotify: TIdNotify;
begin
  repeat
    FEvent.WaitFor;
    // If terminated while waiting on the event or during the loop
    while not Terminated do begin
      try
        LNotifications := FNotifications.LockList; try
          if LNotifications.Count = 0 then begin
            Break;
          end;
          LNotify := TIdNotify(LNotifications.Items[0]);
          LNotifications.Delete(0);
        finally FNotifications.UnlockList; end;
        Synchronize(LNotify.DoNotify);
        FreeAndNil(LNotify);
      except // Catch all exceptions especially these which are raised during the application close
      end;
    end;
  until Terminated;
end;

{ TIdNotifyMethod }

constructor TIdNotifyMethod.Create(AMethod: TThreadMethod);
begin
  FMethod := AMethod;
end;

procedure TIdNotifyMethod.DoNotify;
begin
  FMethod;
end;

initialization
finalization
  // Will free itself using FreeOnTerminate
  if GNotifyThread <> nil then begin
    GNotifyThread.Terminate;
    GNotifyThread.FEvent.SetEvent;
    GNotifyThread.WaitFor;
    FreeAndNil(GNotifyThread);
  end;
end.

