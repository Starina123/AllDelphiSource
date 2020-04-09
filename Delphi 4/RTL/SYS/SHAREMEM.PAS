
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{                                                       }
{       Copyright (C) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit ShareMem;

interface


function SysGetMem(Size: Integer): Pointer;
function SysFreeMem(P: Pointer): Integer;
function SysReallocMem(P: Pointer; Size: Integer): Pointer;
function GetHeapStatus: THeapStatus;
function GetAllocMemCount: Integer;
function GetAllocMemSize: Integer;
procedure DumpBlocks;


implementation


const
  DelphiMM = 'borlndmm.dll';

function SysGetMem(Size: Integer): Pointer; external DelphiMM name '@Borlndmm@SysGetMem$qqri';
function SysFreeMem(P: Pointer): Integer; external DelphiMM name '@Borlndmm@SysFreeMem$qqrpv';
function SysReallocMem(P: Pointer; Size: Integer): Pointer; external DelphiMM name '@Borlndmm@SysReallocMem$qqrpvi';
function GetHeapStatus: THeapStatus; external DelphiMM;
function GetAllocMemCount: Integer; external DelphiMM;
function GetAllocMemSize: Integer; external DelphiMM;
procedure DumpBlocks; external DelphiMM;


const
  SharedMemoryManager: TMemoryManager = (
    GetMem: SysGetMem;
    FreeMem: SysFreeMem;
    ReallocMem: SysReallocMem);

initialization
  if not IsMemoryManagerSet then
    SetMemoryManager(SharedMemoryManager);
end.
