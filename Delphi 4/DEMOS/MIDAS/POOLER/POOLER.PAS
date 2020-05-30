{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}

unit Pooler;

interface

uses
  ComObj, ActiveX, Server_TLB, Classes, SyncObjs, Windows;

type
{
  This is the pooler class.  It is resonsible for managing the pooled RDMs.
  It implements the same interface as the RDM does, and each call will get an
  unused RDM and use it for the call.
}
  TPooler = class(TAutoObject, IPooledRDM)
  protected
    { IDataBroker }
    function GetProviderNames: OleVariant; safecall;
    { IPooledRDM }
    procedure Select(const SQLStr: WideString; out Data: OleVariant); safecall;

    function LockRDM: IPooledRDM;
    procedure UnlockRDM(Value: IPooledRDM);
  end;

{
  The pool manager is responsible for keeping a list of RDMs that are being
  pooled and for giving out unused RDMs.
}
  TPoolManager = class(TObject)
  private
    FRDMList: TList;
    FMaxCount: Integer;
    FTimeout: Integer;
    FCriticalSection: TCriticalSection;
    FSemaphore: THandle;

    function GetLock(Index: Integer): Boolean;
    procedure ReleaseLock(Index: Integer; var Value: IPooledRDM);
    function CreateNewInstance: IPooledRDM;
  public
    constructor Create;
    destructor Destroy; override;
    function LockRDM: IPooledRDM;
    procedure UnlockRDM(var Value: IPooledRDM);

    property Timeout: Integer read FTimeout;
    property MaxCount: Integer read FMaxCount;
  end;

  PRDM = ^TRDM;
  TRDM = record
    Intf: IPooledRDM;
    InUse: Boolean;
  end;

var
  PoolManager: TPoolManager;

implementation

uses ComServ, SrvrDM, SysUtils, ThrddCF;

constructor TPoolManager.Create;
begin
  FRDMList := TList.Create;
  FCriticalSection := TCriticalSection.Create;
  FTimeout := 5000;
  FMaxCount := 15;
  FSemaphore := CreateSemaphore(nil, FMaxCount, FMaxCount, nil);
end;

destructor TPoolManager.Destroy;
var
  i: Integer;
begin
  FCriticalSection.Free;
  for i := 0 to FRDMList.Count - 1 do
  begin
    PRDM(FRDMList[i]).Intf := nil;
    FreeMem(PRDM(FRDMList[i]));
  end;
  FRDMList.Free;
  CloseHandle(FSemaphore);
  inherited Destroy;
end;

function TPoolManager.GetLock(Index: Integer): Boolean;
begin
  FCriticalSection.Enter;
  try
    Result := not PRDM(FRDMList[Index]).InUse;
    if Result then
      PRDM(FRDMList[Index]).InUse := True;
  finally
    FCriticalSection.Leave;
  end;
end;

procedure TPoolManager.ReleaseLock(Index: Integer; var Value: IPooledRDM);
begin
  FCriticalSection.Enter;
  try
    PRDM(FRDMList[Index]).InUse := False;
    Value := nil;
    ReleaseSemaphore(FSemaphore, 1, nil);
  finally
    FCriticalSection.Leave;
  end;
end;

function TPoolManager.CreateNewInstance: IPooledRDM;
var
  p: PRDM;
begin
  FCriticalSection.Enter;
  try
    New(p);
    p.Intf := RDMFactory.CreateComObject(nil) as IPooledRDM;
    p.InUse := True;
    FRDMList.Add(p);
    Result := p.Intf;
  finally
    FCriticalSection.Leave;
  end;
end;

function TPoolManager.LockRDM: IPooledRDM;
var
  i: Integer;
begin
  Result := nil;
  if WaitForSingleObject(FSemaphore, Timeout) = WAIT_FAILED then
    raise Exception.Create('Server too busy');
  for i := 0 to FRDMList.Count - 1 do
  begin
    if GetLock(i) then
    begin
      Result := PRDM(FRDMList[i]).Intf;
      Exit;
    end;
  end;
  if FRDMList.Count < MaxCount then
    Result := CreateNewInstance;
  if Result = nil then { This shouldn't happen because of the sempahore locks }
    raise Exception.Create('Unable to lock RDM');
end;

procedure TPoolManager.UnlockRDM(var Value: IPooledRDM);
var
  i: Integer;
begin
  for i := 0 to FRDMList.Count - 1 do
  begin
    if Value = PRDM(FRDMList[i]).Intf then
    begin
      ReleaseLock(i, Value);
      break;
    end;
  end;
end;

{
  Each call for the server is wrapped in a call to retrieve the RDM, and then
  when it is finished it releases the RDM.
}
function TPooler.GetProviderNames: OleVariant;
var
  RDM: IPooledRDM;
begin
  RDM := LockRDM;
  try
    Result := RDM.GetProviderNames;
  finally
    UnlockRDM(RDM);
  end;
end;

procedure TPooler.Select(const SQLStr: WideString; out Data: OleVariant);
var
  RDM: IPooledRDM;
begin
  RDM := LockRDM;
  try
    RDM.Select(SQLStr, Data);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.LockRDM: IPooledRDM;
begin
  Result := PoolManager.LockRDM;
end;

procedure TPooler.UnlockRDM(Value: IPooledRDM);
begin
  PoolManager.UnlockRDM(Value);
end;

initialization
  PoolManager := TPoolManager.Create;
  TThreadedAutoObjectFactory.Create(ComServer, TPooler, Class_Pooler, ciMultiInstance);
finalization
  PoolManager.Free;
end.
