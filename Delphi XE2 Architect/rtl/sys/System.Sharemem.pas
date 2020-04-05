{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.ShareMem;

interface                             

{$IFDEF MEMORY_DIAG}
type
  TBlockEnumProc = function (Block: Pointer): Boolean;
{$ENDIF}

function SysGetMem(Size: NativeInt): Pointer;
function SysFreeMem(P: Pointer): Integer;
function SysReallocMem(P: Pointer; Size: NativeInt): Pointer;
function SysAllocMem(Size: NativeInt): Pointer;
function SysRegisterExpectedMemoryLeak(P: Pointer): Boolean;
function SysUnregisterExpectedMemoryLeak(P: Pointer): Boolean;
function GetHeapStatus: THeapStatus;
function GetAllocMemCount: Integer;
function GetAllocMemSize: Integer;
procedure DumpBlocks;
procedure HeapAddRef;
procedure HeapRelease;

{$IFDEF MEMORY_DIAG}
function InitBlockMarking: Boolean;
function MarkBlocks: Integer;
function GetMarkedBlocks(MarkID: Integer; Proc: TBlockEnumProc): Boolean;
{$ENDIF}

implementation

{$IFDEF GLOBALALLOC}
uses Windows;
{$ENDIF}

{$IFDEF MEMORY_DIAG}
type
  TInitBlockMarking = function: Boolean;
  TMarkBlocks = function: Integer;
  TGetMarkedBlocks = function (MarkID: Integer; Proc: TBlockEnumProc): Boolean;

var
  MMHandle: Integer = 0;
  SysInitBlockMarking: TInitBlockMarking = nil;
  SysMarkBlocks: TMarkBlocks = nil;
  SysGetMarkedBlocks: TGetMarkedBlocks = nil;
{$ENDIF}
var
  {Need access to the shared memory manager structure to be able to call the
   default AllocMem and leak registration handlers for borlndmm.dll libraries
   that do not implement these functions.}
  SharedMemoryManager: TMemoryManagerEx;

const
  DelphiMM = 'borlndmm.dll';

function SysGetMem(Size: NativeInt): Pointer; external DelphiMM name '@Borlndmm@SysGetMem$qqri';
function SysFreeMem(P: Pointer): Integer; external DelphiMM name '@Borlndmm@SysFreeMem$qqrpv';
function SysReallocMem(P: Pointer; Size: NativeInt): Pointer; external DelphiMM name '@Borlndmm@SysReallocMem$qqrpvi';
function GetHeapStatus: THeapStatus; external DelphiMM;
function GetAllocMemCount: Integer; external DelphiMM;
function GetAllocMemSize: Integer; external DelphiMM;
procedure DumpBlocks; external DelphiMM;

function GetModuleHandle(lpModuleName: PChar): Integer; stdcall;
{$IFDEF UNICODE}
  external 'kernel32.dll' name 'GetModuleHandleW';
{$ELSE}
  external 'kernel32.dll' name 'GetModuleHandleA';
{$ENDIF}
function GetProcAddress(hModule: Integer; lpProcName: PAnsiChar): Pointer; stdcall;
  external 'kernel32.dll' name 'GetProcAddress';

{$IFDEF MEMORY_DIAG}

procedure InitMMHandle;
begin
  if MMHandle = 0 then MMHandle := GetModuleHandle(DelphiMM);
end;

function InitBlockMarking: Boolean;
begin
  InitMMHandle;
  if @SysInitBlockMarking = nil then
    @SysInitBlockMarking := GetProcAddress(MMHandle, 'InitBlockMarking');
  if @SysInitBlockMarking <> nil then
    Result := SysInitBlockMarking
  else Result := False;
end;

function MarkBlocks: Integer;
begin
  InitMMHandle;
  if @SysMarkBlocks = nil then
    @SysMarkBlocks := GetProcAddress(MMHandle, 'MarkBlocks');
  if @SysMarkBlocks <> nil then
    Result := SysMarkBlocks
  else Result := -1;
end;

function GetMarkedBlocks(MarkID: Integer; Proc: TBlockEnumProc): Boolean;
begin
  InitMMHandle;
  if @SysGetMarkedBlocks = nil then
    @SysGetMarkedBlocks := GetProcAddress(MMHandle, 'GetMarkedBlocks');
  if @SysGetMarkedBlocks <> nil then
    Result := SysGetMarkedBlocks(MarkID, Proc)
  else Result := False;
end;
{$ENDIF}

{$IFDEF GLOBALALLOC}
function xSysGetMem(Size: NativeInt): Pointer;
begin
  Result := GlobalAllocPtr(HeapAllocFlags, Size);
end;

function xSysFreeMem(P: Pointer): Integer;
begin
  Result := GlobalFreePtr(P);
end;

function xSysReallocMem(P: Pointer; Size: NativeInt): Pointer;
begin
  Result := GlobalReallocPtr(P, Size, 0);
end;
{$ENDIF}

procedure HeapAddRef;
var
  MM: Integer;
  Proc: procedure;
begin
  MM := GetModuleHandle(DelphiMM);
  Proc := GetProcAddress(MM, '@Borlndmm@HeapAddRef$qqrv');
  if Assigned(Proc) then
    Proc;
end;

procedure HeapRelease;
var
  MM: Integer;
  Proc: procedure;
begin
  MM := GetModuleHandle(DelphiMM);
  Proc := GetProcAddress(MM, '@Borlndmm@HeapRelease$qqrv');
  if Assigned(Proc) then
    Proc;
end;

{The default AllocMem implementation - for older borlndmm.dll libraries that do
 not implement this themselves.}
function DefaultAllocMem(Size: NativeInt): Pointer;
begin
  Result := SysGetMem(Size);
  if (Result <> nil) then
    FillChar(Result^, Size, 0);
end;

{The default (do nothing) leak registration function for backward compatibility
 with older borlndmm.dll libraries.}
function DefaultRegisterAndUnregisterExpectedMemoryLeak(P: Pointer): boolean;
begin
  Result := False;
end;

function SysAllocMem(Size: NativeInt): Pointer;
begin
  {Indirect call, because the library may not implement this functionality}
  Result := SharedMemoryManager.AllocMem(Size);
end;

function SysRegisterExpectedMemoryLeak(P: Pointer): Boolean;
begin
  {Indirect call, because the library may not implement this functionality}
  Result := SharedMemoryManager.RegisterExpectedMemoryLeak(P);
end;

function SysUnregisterExpectedMemoryLeak(P: Pointer): Boolean;
begin
  {Indirect call, because the library may not implement this functionality}
  Result := SharedMemoryManager.UnregisterExpectedMemoryLeak(P);
end;

procedure InitMemoryManager;
var
  ProcAddr: Pointer;
  MM: Integer;
begin
  // force a static reference to borlndmm.dll, so we don't have to LoadLibrary
  SharedMemoryManager.GetMem := SysGetMem;

  MM := GetModuleHandle(DelphiMM);
{$IFDEF GLOBALALLOC}
  SharedMemoryManager.GetMem := xSysGetMem;
  SharedMemoryManager.FreeMem := xSysFreeMem;
  SharedMemoryManager.ReallocMem := xSysReallocMem;
{$ELSE}
  SharedMemoryManager.GetMem := GetProcAddress(MM,'@Borlndmm@SysGetMem$qqri');
  SharedMemoryManager.FreeMem := GetProcAddress(MM,'@Borlndmm@SysFreeMem$qqrpv');
  SharedMemoryManager.ReallocMem := GetProcAddress(MM, '@Borlndmm@SysReallocMem$qqrpvi');
// Cannot assume that the functions below are implemented. Default handlers are set in initialization section.
  ProcAddr := GetProcAddress(MM,'@Borlndmm@SysAllocMem$qqri');
  if ProcAddr <> nil then
    SharedMemoryManager.AllocMem := ProcAddr;
  ProcAddr := GetProcAddress(MM,'@Borlndmm@SysRegisterExpectedMemoryLeak$qqrpi');
  if ProcAddr <> nil then
    SharedMemoryManager.RegisterExpectedMemoryLeak := ProcAddr;
  ProcAddr := GetProcAddress(MM, '@Borlndmm@SysUnregisterExpectedMemoryLeak$qqrpi');
  if ProcAddr <> nil then
    SharedMemoryManager.UnregisterExpectedMemoryLeak := ProcAddr;
{$ENDIF}
  SetMemoryManager(SharedMemoryManager);
end;

initialization
  {Set the default handlers for older borlndmm.dll libraries that do not
   implement the extended memory manager functionality}
  SharedMemoryManager.AllocMem := DefaultAllocMem;
  SharedMemoryManager.RegisterExpectedMemoryLeak :=
    DefaultRegisterAndUnregisterExpectedMemoryLeak;
  SharedMemoryManager.UnregisterExpectedMemoryLeak :=
    DefaultRegisterAndUnregisterExpectedMemoryLeak;
  HeapAddRef;
  if not IsMemoryManagerSet then
    InitMemoryManager;
finalization
  HeapRelease;
end.
