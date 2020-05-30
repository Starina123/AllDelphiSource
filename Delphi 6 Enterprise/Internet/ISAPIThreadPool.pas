
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       ISAPI/NSAPI Web server application components   }
{                                                       }
{  Copyright (c) 1997-2001 Borland Software Corp.       }
{                                                       }
{*******************************************************}

{$DENYPACKAGEUNIT}

unit ISAPIThreadPool;

interface

uses Windows, SyncObjs, Classes, HTTPApp, WebBroker, IsapiHTTP, Isapi2, ISAPIApp;

type

  TISAPIThread = class;

  TISAPIThreadPool = class(TObject)
  private
    FThreadPool: TList;
    FLock: TCriticalSection;
    FPoolIndex: Integer;
    FMin: Integer;
    FMax: Integer;

    procedure AdjustThreadPool;
    procedure Clear;
    function  CreateThread: TISAPIThread;
    function  GetThreadCount: Integer;
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;
    function DispatchThread(AECB: PEXTENSION_CONTROL_BLOCK): Boolean;
    function RemoveThread(AISAPIThread: TISAPIThread): Boolean;
    property Min: Integer read FMin write SetMin default 1;
    property Max: Integer read FMax write SetMax default 32;
    property ThreadCount:Integer read GetThreadCount;
  end;

   TISAPIThread = class(TObject)
   private
     FHandle: THandle;
     FThreadID: THandle;
     FSuspended: Boolean;
     FTerminated: Boolean;
     FECB: PEXTENSION_CONTROL_BLOCK;
     FISAPIThreadPool: TISAPIThreadPool;

   public
     constructor Create(AISAPIThreadPool: TISAPIThreadPool);
     destructor Destroy; override;
     procedure Execute;
     procedure Suspend;
     procedure Resume;

     property Suspended: Boolean read FSuspended;
     property Terminated: Boolean read FTerminated write FTerminated;
     property ECB: PEXTENSION_CONTROL_BLOCK read FECB write FECB;
   end;

var
  ISAPIThreadPoolManager: TISAPIThreadPool;

implementation

constructor TISAPIThreadPool.Create;
begin
  inherited Create;

  FThreadPool := TList.Create;
  FLock := TCriticalSection.Create;
  FPoolIndex := 0;
  FMin := 1;
  FMax := 32;
  AdjustThreadPool;
end;

destructor TISAPIThreadPool.Destroy;
begin
  Clear;
  while FThreadPool.Count > 0 do sleep(0);
  FLock.Free;
  FThreadPool.Free;
  inherited Destroy;
end;

function TISAPIThreadPool.DispatchThread(AECB: PEXTENSION_CONTROL_BLOCK): Boolean;
var
  T: TISAPIThread;
begin
  Result := False;
  FLock.Acquire;
  try
    T := CreateThread;
    if Assigned(T) then
    begin
      T.FECB := AECB;
      T.Resume;
      Result := True;
    end;
  finally
    FLock.Release;
  end;
end;

function TISAPIThreadPool.RemoveThread(AISAPIThread: TISAPIThread): Boolean;
begin
  FLock.Acquire;
  try
    Result := FThreadPool.Remove(AISAPIThread) >= 0;
  finally
    FLock.Release;
  end;
end;

procedure TISAPIThreadPool.AdjustThreadPool;
begin
  FLock.Acquire;
  try
    while FMin > FThreadPool.Count do
    FThreadPool.Add(TISAPIThread.Create(Self));
  finally
    FLock.Release;
  end;
end;

procedure TISAPIThreadPool.Clear;
var
  I: Integer;
begin
  FLock.Acquire;
  try
    for I := FThreadPool.Count - 1 downto 0 do
    with TISAPIThread(FThreadPool[I]) do
    begin
      Terminated := True;
      if Suspended then
        Resume;
    end;
  finally
    FLock.Release;
  end;
end;

function TISAPIThreadPool.CreateThread: TISAPIThread;
var
  IndexRef: Integer;
begin
  IndexRef := FPoolIndex;
  repeat
    FPoolIndex := (FPoolIndex + 1) mod FThreadPool.Count;
    Result := FThreadPool[FPoolIndex];
  until (FPoolIndex = IndexRef) or Result.Suspended;

  if not Result.Suspended then
  begin
    if ThreadCount < FMax then
    begin
      Result := TISAPIThread.Create(Self);
      FThreadPool.Add(Result);
    end
    else Result := nil;
  end;
end;

function TISAPIThreadPool.GetThreadCount: Integer;
begin
  Result := FThreadPool.Count;
end;

procedure TISAPIThreadPool.SetMin(Value: Integer);
begin
  if FMin <> Value then
  begin
    if Value < 1 then
      Value := 1;
    FMin := Value;
    AdjustThreadPool;
  end;
end;

procedure TISAPIThreadPool.SetMax(Value: Integer);
begin
  if FMax <> Value then
  begin
    if  FMin > Value then
      Value := FMin;
    FMax := Value;
    AdjustThreadPool;
  end;
end;

{ TISAPIThread }

function ThreadProc(ISAPIThread: TISAPIThread): Integer;
begin
  Result := 0;
  try
    if not ISAPIThread.Terminated then
      try
        ISAPIThread.Execute;
      except
        AcquireExceptionObject;
      end;
  finally
    ISAPIThread.Free;
    EndThread(Result);
  end;
end;

constructor TISAPIThread.Create(AISAPIThreadPool: TISAPIThreadPool);
begin
  inherited Create;
  FSuspended := True;
  FTerminated := False;
  FECB := nil;
  FISAPIThreadPool := AISAPIThreadPool;
  FHandle := BeginThread(nil, 0, @ThreadProc, Pointer(Self), CREATE_SUSPENDED, FThreadID);
end;

destructor TISAPIThread.Destroy;
begin
  if Assigned(FISAPIThreadPool) then
    FISAPIThreadPool.RemoveThread(Self);
  inherited Destroy;
end;

procedure TISAPIThread.Execute;
var
  ExitCode: DWORD;
begin
  while not Terminated do
  begin
    try
      ExitCode := (Application as TISAPIApplication).HttpExtensionProc(ECB^);
    except
      ExitCode := HSE_STATUS_ERROR;
    end;
    ECB^.ServerSupportFunction(ECB^.ConnID, HSE_REQ_DONE_WITH_SESSION, @ExitCode, nil, nil);
    if not Terminated then
     Suspend;
  end;
end;

procedure TISAPIThread.Suspend;
begin
  FSuspended := True;
  SuspendThread(FHandle);
end;

procedure TISAPIThread.Resume;
begin
  FSuspended := False;
  ResumeThread(FHandle);
end;

initialization
  ISAPIThreadPoolManager := TISAPIThreadPool.Create;
  ISAPIApp.DispatchThread := ISAPIThreadPoolManager.DispatchThread;

finalization
  ISAPIApp.DispatchThread := nil;
  ISAPIThreadPoolManager.Free;

end.
