{*******************************************************}
{                                                       }
{          Threaded Class Factory Demo                  }
{                                                       }
{*******************************************************}

unit ThrddCF;

{
  This unit provides some custom class factories that implement threading for
  out of process servers.  The TThreadedAutoObjectFactory is for any TAutoObject
  and the TThreadedClassFactory is for and TComponentFactory.  To use them,
  replace the line in the initialization section of your automation object to
  use the appropriate threaded class factory instead of the non-threaded version.
}

interface

uses ComObj, ActiveX, Classes, Windows, VCLCom, Forms;

type

  TCreateInstanceProc = function(const UnkOuter: IUnknown;
    const IID: TGUID; out Obj): HResult of object; stdcall;

{ TThreadedAutoObjectFactory }

  TThreadedAutoObjectFactory = class(TAutoObjectFactory, IClassFactory)
  protected
    function CreateInstance(const UnkOuter: IUnknown; const IID: TGUID;
      out Obj): HResult; stdcall;
    function DoCreateInstance(const UnkOuter: IUnknown; const IID: TGUID;
      out Obj): HResult; stdcall;
  end;

{ TThreadedClassFactory }

  TThreadedClassFactory = class(TComponentFactory, IClassFactory)
  protected
    function CreateInstance(const UnkOuter: IUnknown; const IID: TGUID;
      out Obj): HResult; stdcall;
    function DoCreateInstance(const UnkOuter: IUnknown; const IID: TGUID;
      out Obj): HResult; stdcall;
  end;

{ TApartmentThread }

  TApartmentThread = class(TThread)
  private
    FCreateInstanceProc: TCreateInstanceProc;
    FUnkOuter: IUnknown;
    FIID: TGuid;
    FSemaphore: THandle;
    FStream: Pointer;
    FCreateResult: HResult;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateInstanceProc: TCreateInstanceProc; UnkOuter: IUnknown; IID: TGuid);
    destructor Destroy; override;
    property Semaphore: THandle read FSemaphore;
    property CreateResult: HResult read FCreateResult;
    property ObjStream: Pointer read FStream;
  end;

implementation

{ TThreadedAutoObjectFactory }

function TThreadedAutoObjectFactory.DoCreateInstance(const UnkOuter: IUnknown;
  const IID: TGUID; out Obj): HResult; stdcall;
begin
  Result := inherited CreateInstance(UnkOuter, IID, Obj);
end;

function TThreadedAutoObjectFactory.CreateInstance(const UnkOuter: IUnknown;
  const IID: TGUID; out Obj): HResult; stdcall;
begin
  with TApartmentThread.Create(DoCreateInstance, UnkOuter, IID) do
  begin
    if WaitForSingleObject(Semaphore, INFINITE) = WAIT_OBJECT_0 then
    begin
      Result := CreateResult;
      if Result <> S_OK then Exit;
      Result := CoGetInterfaceAndReleaseStream(IStream(ObjStream), IID, Obj);
    end else
      Result := E_FAIL
  end;
end;

{ TThreadedClassFactory }

function TThreadedClassFactory.DoCreateInstance(const UnkOuter: IUnknown;
  const IID: TGUID; out Obj): HResult; stdcall;
begin
  Result := inherited CreateInstance(UnkOuter, IID, Obj);
end;

function TThreadedClassFactory.CreateInstance(const UnkOuter: IUnknown;
  const IID: TGUID; out Obj): HResult; stdcall;
begin
  with TApartmentThread.Create(DoCreateInstance, UnkOuter, IID) do
  begin
    if WaitForSingleObject(Semaphore, INFINITE) = WAIT_OBJECT_0 then
    begin
      Result := CreateResult;
      if Result <> S_OK then Exit;
      Result := CoGetInterfaceAndReleaseStream(IStream(ObjStream), IID, Obj);
    end else
      Result := E_FAIL
  end;
end;

{ TApartmentThread }

constructor TApartmentThread.Create(CreateInstanceProc: TCreateInstanceProc;
  UnkOuter: IUnknown; IID: TGuid);
begin
  FCreateInstanceProc := CreateInstanceProc;
  FUnkOuter := UnkOuter;
  FIID := IID;
  FSemaphore := CreateSemaphore(nil, 0, 1, nil);
  FreeOnTerminate := True;
  inherited Create(False);
end;

destructor TApartmentThread.Destroy;
begin
  FUnkOuter := nil;
  CloseHandle(FSemaphore);
  inherited Destroy;
  Application.ProcessMessages;
end;

procedure TApartmentThread.Execute;
var
  msg: TMsg;
  Unk: IUnknown;
begin
  CoInitialize(nil);
  FCreateResult := FCreateInstanceProc(FUnkOuter, FIID, Unk);
  if FCreateResult = S_OK then
    CoMarshalInterThreadInterfaceInStream(FIID, Unk, IStream(FStream));
  ReleaseSemaphore(FSemaphore, 1, nil);
  if FCreateResult = S_OK then
    while GetMessage(msg, 0, 0, 0) do
    begin
      DispatchMessage(msg);
      Unk._AddRef;
      if Unk._Release = 1 then break;
    end;
  Unk := nil;
  CoUninitialize;
end;

end.
