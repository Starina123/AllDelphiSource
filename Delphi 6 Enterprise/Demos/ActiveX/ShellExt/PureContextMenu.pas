unit PureContextMenu;

interface

uses
  ActiveX;

function DllGetClassObject(const CLSID: TCLSID; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
function DllCanUnloadNow: HResult; stdcall;
function DllRegisterServer: HResult; stdcall;
function DllUnregisterServer: HResult; stdcall;

implementation

uses
  Windows, SysUtils, ShellAPI, ShlObj;

const
  IID_IUnknown: TIID = '{00000000-0000-0000-C000-000000000046}';

type
  IUnknown    = ^PIUnknownMT;
  PIUnknownMT = ^TIUnknownMT;
  TIUnknownMT = packed record  { IUnknown method table }
    QueryInterface: function (const Self: IUnknown;
      const IID: TIID; var Obj: Pointer): HResult; stdcall;
    AddRef:         function (const Self: IUnknown): Integer; stdcall;
    Release:        function (const Self: IUnknown): Integer; stdcall;
  end;


const
  IID_IClassFactory: TIID = '{00000001-0000-0000-C000-000000000046}';

type
  IClassFactory    = ^PIClassFactoryMT;
  PIClassFactoryMT = ^TIClassFactoryMT;
  TIClassFactoryMT = packed record  { IClassFactory method table }
    case Integer of
      0: (
        { IUnknown methods }
        QueryInterface: function (const Self: IClassFactory;
          const IID: TIID; var Obj: Pointer): HResult; stdcall;
        AddRef:         function (const Self: IClassFactory): Integer; stdcall;
        Release:        function (const Self: IClassFactory): Integer; stdcall;
        { IClassFactory methods }
        CreateInstance: function (const Self: IClassFactory;
          const UnkOuter: IUnknown; const IID: TIID;
          var Obj: Pointer): HResult; stdcall;
        LockServer:     function (const Self: IClassFactory;
          fLock: Bool): HResult; stdcall;);

      1: (IUnknownMT: TIUnknownMT);
  end;


type
  IDataObject    = ^PIDataObjectMT;
  PIDataObjectMT = ^TIDataObjectMT;
  TIDataObjectMT = packed record  { IDataObject method table }
    case Integer of
      0: (
        { IUnknown methods }
        QueryInterface: function (const Self: IClassFactory;
          const IID: TIID; var Obj: Pointer): HResult; stdcall;
        AddRef:         function (const Self: IClassFactory): Integer; stdcall;
        Release:        function (const Self: IClassFactory): Integer; stdcall;
        { IDataObject methods }
        GetData: function (const Self: IDataObject; const formatetcIn: TFormatEtc;
          var medium: TStgMedium): HResult; stdcall;
        // This is cheating here, a bit.  The remaining methods in IDataObject
        // are unused, so some work can be saved by defining only what is used.
        // And that's O.K. since the method table is identical to this point.
        {!!!--------------------------------------------------------------------
        GetDataHere: function (const Self: IDataObject;
          const formatetc: TFormatEtc; var medium: TStgMedium): HResult; stdcall;
        QueryGetData: function (const Self: IDataObject;
          const formatetc: TFormatEtc): HResult; stdcall;
        GetCanonicalFormatEtc: function (const Self: IDataObject;
          const formatetc: TFormatEtc; var formatetcOut: TFormatEtc): HResult;
          stdcall;
        SetData: function (const Self: IDataObject; const formatetc: TFormatEtc;
          var medium: TStgMedium; fRelease: BOOL): HResult; stdcall;
        EnumFormatEtc: function (const Self: IDataObject; dwDirection: Longint;
          var enumFormatEtc: IEnumFormatEtc): HResult; stdcall;
        DAdvise: function (const Self: IDataObject; const formatetc: TFormatEtc;
          advf: Longint; const advSink: IAdviseSink; var dwConnection: Longint):
          HResult; stdcall;
        DUnadvise: function (const Self: IDataObject; dwConnection: Longint):
          HResult; stdcall;
        EnumDAdvise: function (const Self: IDataObject;
          var enumAdvise: IEnumStatData): HResult; stdcall;
        --------------------------------------------------------------------!!!}
        );

      1: (IUnknownMT: TIUnknownMT);
  end;


const
  IID_IShellExtInit: TIID = '{000214E8-0000-0000-C000-000000000046}';

type
  IShellExtInit    = ^PIShellExtInitMT;
  PIShellExtInitMT = ^TIShellExtInitMT;
  TIShellExtInitMT = packed record   { IShellExtInit method table }
    case Integer of
      0: (
        { IUnknown methods }
        QueryInterface: function (const Self: IShellExtInit;
          const IID: TIID; var Obj: Pointer): HResult; stdcall;
        AddRef:         function (const Self: IShellExtInit): Integer; stdcall;
        Release:        function (const Self: IShellExtInit): Integer; stdcall;
        { IShellExtInit methods }
        Initialize: function (const Self: IShellExtInit;
          pidlFolder: PItemIDList; lpdobj: IDataObject; hKeyProgID: HKEY):
          HResult; stdcall;);

      1: (IUnknownMT: TIUnknownMT);
  end;


const
  IID_IContextMenu: TIID = '{000214E4-0000-0000-C000-000000000046}';

type
  IContextMenu    = ^PIContextMenuMT;
  PIContextMenuMT = ^TIContextMenuMT;
  TIContextMenuMT = packed record  { IContextMenu method table }
    case Integer of
      0: (
        { IUnknown methods }
        QueryInterface: function (const Self: IContextMenu;
          const IID: TIID; var Obj: Pointer): HResult; stdcall;
        AddRef:         function (const Self: IContextMenu): Integer; stdcall;
        Release:        function (const Self: IContextMenu): Integer; stdcall;
        { IContextMenu methods }
        QueryContextMenu: function (const Self: IContextMenu; Menu: HMENU;
          indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult; stdcall;
        InvokeCommand:    function (const Self: IContextMenu;
          var lpici: TCMInvokeCommandInfo): HResult; stdcall;
        GetCommandString: function (const Self: IContextMenu;
          idCmd, uType: UINT; pwReserved: PUINT; pszName: LPSTR;
          cchMax: UINT): HResult; stdcall;);

      1: (IUnknownMT: TIUnknownMT);
  end;


const
  CLSIDString_QuickRegister = '{40E69241-5D1A-11D1-81CB-0020AF3E97A9}';
  CLSIDStr                  = 'CLSID\' + CLSIDString_QuickRegister;

  CLSID_QuickRegister: TCLSID = CLSIDString_QuickRegister;


type
  PClassFactory = ^TClassFactory;
  TClassFactory = PIClassFactoryMT;

  PContextMenu = ^TContextMenu;
  TContextMenu = record
    CMMTAddr:  PIContextMenuMT;
    SEIMTAddr: PIShellExtInitMT;
    RefCount:  Integer;
    FileName:  String;
  end;

var
  ClassFactoryMT: TIClassFactoryMT;
  ContextMenuMT:  TIContextMenuMT;
  ShellExtInitMT: TIShellExtInitMT;

  ClassFactory: TClassFactory;

  ServerLockCount: Integer = 0;

{ COM Runtime support }

function DllGetClassObject(const CLSID: TCLSID; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
begin
  // Validate the output address.
  if @Obj = nil then begin
    Result := E_POINTER;
    Exit
  end;

  // Assume failure.
  Obj := nil;
  Result := CLASS_E_CLASSNOTAVAILABLE;

  if IsEqualCLSID(CLSID, CLSID_QuickRegister) then
    Result := ClassFactory^.QueryInterface(@ClassFactory, IID, Obj)
end;

function DllCanUnloadNow: HResult; stdcall;
begin
  if (ServerLockCount <> 0) then
    Result := S_FALSE
  else
    Result := S_OK
end;

function DllRegisterServer: HResult; stdcall;
var
  FileName: array [0..MAX_PATH] of Char;
  RootKey: HKey;

  procedure CreateKey(const Key, ValueName, Value: string);
  var
    Handle: HKey;
    Res,
    Disposition: Integer;
  begin
    Res := RegCreateKeyEx(RootKey, PChar(Key), 0, '',
      REG_OPTION_NON_VOLATILE, KEY_READ or KEY_WRITE, nil, Handle, @Disposition);
    if Res = 0 then begin
      Res := RegSetValueEx(Handle, PChar(ValueName), 0,
        REG_SZ, PChar(Value), Length(Value) + 1);
      RegCloseKey(Handle)
    end;
    if Res <> 0 then
      raise Exception.Create('Error updating registry')
  end;

begin
  try
    RootKey := HKEY_CLASSES_ROOT;
    CreateKey(CLSIDStr, '', 'Quick Register Context Menu Shell Extension');

    GetModuleFileName(HInstance, FileName, SizeOf(FileName));
    CreateKey(CLSIDStr + '\InprocServer32', '', FileName);
    CreateKey(CLSIDStr + '\InprocServer32', 'ThreadingModel', 'Apartment');

    CreateKey('dllfile\shellex', '', '');
    CreateKey('dllfile\shellex\ContextMenuHandlers', '', '');
    CreateKey('dllfile\shellex\ContextMenuHandlers\QuickRegister', '',
      CLSIDString_QuickRegister);

    RootKey := HKEY_LOCAL_MACHINE;
    CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions', '', '');
    CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved',
      CLSIDString_QuickRegister, 'Quick Register Context Menu Shell Extension');
    Result := S_OK
  except
    DllUnregisterServer;
    Result := SELFREG_E_CLASS
  end
end;

function DllUnregisterServer: HResult; stdcall;

  procedure DeleteKey(const Key: string);
  begin
    RegDeleteKey(HKEY_CLASSES_ROOT, PChar(Key))
  end;

begin
  DeleteKey('dllfile\shellex\ContextMenuHandlers\QuickRegister');
  DeleteKey('dllfile\shellex\ContextMenuHandlers');
  DeleteKey('dllfile\shellex');
  DeleteKey(CLSIDStr + '\InprocServer32');
  DeleteKey(CLSIDStr);
  Result := S_OK
end;


{ IClassFactory - IUnknown methods}

function ClassFactory_QueryInterface(const Self: IUnknown; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
begin
  // Validate the output address.
  if @Obj = nil then begin
    Result := E_POINTER;
    Exit
  end;

  // Assume failure.
  Obj := nil;
  Result := E_NOINTERFACE;

  // Check for supported interfaces.
  if IsEqualIID(IID, IID_IUnknown) or
     IsEqualIID(IID, IID_IClassFactory) then begin
    // Return the requested interface and AddRef.
    Obj := Self;
    IUnknown(Obj)^^.AddRef(Obj);
    Result := S_OK
  end
end;

function ClassFactory_AddRef(const Self: IUnknown): Integer; stdcall;
begin
  InterlockedIncrement(ServerLockCount);
  Result := 2
end;

function ClassFactory_Release(const Self: IUnknown): Integer; stdcall;
begin
  InterlockedDecrement(ServerLockCount);
  Result := 1
end;

{ IClassFactory - IClassFactory methods}

function ClassFactory_CreateInstance(const Self: IClassFactory;
  const UnkOuter: IUnknown; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
var
  pcm: PContextMenu;
begin
  // Validate the output address.
  if @Obj = nil then begin
    Result := E_POINTER;
    Exit
  end;

  // Assume failure.
  Obj := nil;

  // This object does not support aggregation.
  if Assigned(UnkOuter) then begin
    Result := CLASS_E_NOAGGREGATION;
    Exit
  end;

  pcm := nil;
  try
    // Construct a ContextMenu object.
    New(pcm);
    FillChar(pcm^, SizeOf(pcm^), 0);
    with pcm^do begin
      CMMTAddr  := @ContextMenuMT;
      SEIMTAddr := @ShellExtInitMT;
      Result := CMMTAddr^.QueryInterface(@CMMTAddr, IID, Obj);
      if Succeeded(Result) then
        InterlockedIncrement(ServerLockCount)
      else
        Dispose(pcm)
    end
  except
    on E: EOutOfMemory do
      Result := E_OUTOFMEMORY
    else begin
      if Assigned(pcm) then
        Dispose(pcm);
      Result := E_FAIL
    end
  end
end;

function ClassFactory_LockServer(const Self: IClassFactory; fLock: Bool): HResult;
  stdcall;
begin
  if fLock then
    InterlockedIncrement(ServerLockCount)
  else
    InterlockedDecrement(ServerLockCount);
  Result := S_OK
end;


{ IContextMenu - IUnknown methods}

function ContextMenu_QueryInterface(const Self: IUnknown; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
begin
  // Validate the output address.
  if @Obj = nil then begin
    Result := E_POINTER;
    Exit
  end;

  // Assume failure.
  Obj := nil;
  Result := E_NOINTERFACE;

  // Check for supported interfaces.
  if IsEqualIID(IID, IID_IUnknown) or
     IsEqualIID(IID, IID_IContextMenu) or
     IsEqualIID(IID, IID_IShellExtInit) then
    // Return the requested interface and AddRef.
    with PContextMenu(Self)^ do begin
      if IsEqualIID(IID, IID_IShellExtInit) then
        Obj := @SEIMTAddr
      else
        Obj := @CMMTAddr;

      IUnknown(Obj)^^.AddRef(Obj);
      Result := S_OK
    end
end;

function ContextMenu_AddRef(const Self: IUnknown): Integer; stdcall;
begin
  with PContextMenu(Self)^ do
    Result := InterlockedIncrement(RefCount)
end;

function ContextMenu_Release(const Self: IUnknown): Integer; stdcall;
begin
  with PContextMenu(Self)^ do begin
    Result := InterlockedDecrement(RefCount);
    if (Result = 0) then begin
      Dispose(PContextMenu(Self));
      InterlockedDecrement(ServerLockCount)
    end
  end
end;

{ IContextMenu - IContextMenu methods}

function ContextMenu_QueryContextMenu(const Self: IContextMenu; Menu: HMENU;
  indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult; stdcall;
begin
  Result := MakeResult(SEVERITY_SUCCESS, FACILITY_NULL, 0);
  if ((uFlags and $0000000F) = CMF_NORMAL) or
     ((uFlags and CMF_EXPLORE) <> 0) then begin

    InsertMenu(Menu, indexMenu, MF_SEPARATOR or MF_BYPOSITION, 0, nil);
    InsertMenu(Menu, indexMenu + 1, MF_STRING or MF_BYPOSITION, idCmdFirst,
      'Register');
    InsertMenu(Menu, indexMenu + 2, MF_STRING or MF_BYPOSITION, idCmdFirst + 1,
      'Unregister');
    InsertMenu(Menu, indexMenu + 3, MF_SEPARATOR or MF_BYPOSITION, 0, nil);

    Result := MakeResult(SEVERITY_SUCCESS, FACILITY_NULL, 2)
  end
end;

function ContextMenu_InvokeCommand(const Self: IContextMenu;
  var lpici: TCMInvokeCommandInfo): HResult; stdcall;
const
  ProcNames: array [0..1] of PChar =
    ('DllRegisterServer', 'DllUnregisterServer');
var
  pcm: PContextMenu absolute Self;
  Cmd: Word;

  procedure RegisterCOMServer;
  var
    Handle:  THandle;
    RegProc: function: HResult; stdcall;
    hr:      HResult;
  begin
    Handle := LoadLibrary(PChar(pcm^.FileName));
    if Handle = 0 then
      raise Exception.CreateFmt('%s: %s',
        [SysErrorMessage(GetLastError), pcm^.FileName]);
    try
      RegProc := GetProcAddress(Handle, ProcNames[Cmd]);
      if Assigned(RegProc) then begin
        hr := RegProc;
        if Failed(hr) then
          raise Exception.Create(
            ProcNames[Cmd] + ' in ' + pcm^.FileName + ' failed.')
      end
      else
        RaiseLastWin32Error
    finally
      FreeLibrary(Handle)
    end
  end;

begin
  Result := E_INVALIDARG;
  Cmd := LoWord(Integer(lpici.lpVerb));
  if (HiWord(Integer(lpici.lpVerb)) <> 0) or (not Cmd in [0..1]) then
    Exit;

  Result := E_FAIL;
  try
    RegisterCOMServer;
    MessageBox(lpici.hwnd,
      PChar(ProcNames[Cmd] + ' in ' + pcm^.FileName + ' succeeded.'),
      'Quick Register', MB_ICONINFORMATION or MB_OK);
    Result := S_OK
  except
    on E: Exception do
      MessageBox(lpici.hWnd, PChar(E.Message), 'Quick Register - Error',
        MB_ICONERROR or MB_OK);
  end
end;

function ContextMenu_GetCommandString(const Self: IContextMenu;
  idCmd, uType: UINT; pwReserved: PUINT; pszName: LPSTR;
          cchMax: UINT): HResult; stdcall;
const
  RegStr: PChar = 'Register this COM/ActiveX server.';
  UnRegStr: PChar = 'Unregister this COM/ActiveX server.';
begin
  Result := S_OK;
  if uType = GCS_HELPTEXT then
    case idCmd of
      0: StrCopy(pszName, RegStr);
      1: StrCopy(pszName, UnRegStr)
      else
        Result := E_INVALIDARG
    end
end;


{ IShellExtInit - IUnknown methods }

function ShellExtInit_QueryInterface(const Self: IUnknown; const IID: TIID;
  var Obj: Pointer): HResult; stdcall;
var
  TrueSelf: IContextMenu;
begin
  // Fix up the pointer to the IContextMenu interface.
  TrueSelf := IContextMenu(Self);
  Dec(TrueSelf);

  // Delegate.
  Result := TrueSelf^^.QueryInterface(TrueSelf, IID, Obj)
end;

function ShellExtInit_AddRef(const Self: IUnknown): Integer; stdcall;
var
  TrueSelf: IContextMenu;
begin
  // Fix up the pointer to the IContextMenu interface.
  TrueSelf := IContextMenu(Self);
  Dec(TrueSelf);

  // Delegate.
  Result := TrueSelf^^.AddRef(TrueSelf)
end;

function ShellExtInit_Release(const Self: IUnknown): Integer; stdcall;
var
  TrueSelf: IContextMenu;
begin
  // Fix up the pointer to the IContextMenu interface.
  TrueSelf := IContextMenu(Self);
  Dec(TrueSelf);

  // Delegate.
  Result := TrueSelf^^.Release(TrueSelf)
end;


{ IShellExtInit - IShellExtInit.Initialize}

function ShellExtInit_Initialize(const Self: IShellExtInit;
  pidlFolder: PItemIDList; lpdobj: IDataObject; hKeyProgID: HKEY): HResult;
  stdcall;
var
  pcm:         PContextMenu;
  ContextMenu: IContextMenu absolute pcm;
  FormatETC:   TFormatEtc;
  StgMedium:   TStgMedium;
  szFile:      array [0..MAX_PATH] of Char;
begin
  if not Assigned(lpdobj) then begin
    Result := E_INVALIDARG;
    Exit
  end;

  // Fix up the pointer to the actual ContextMenu "object".
  ContextMenu := IContextMenu(Self);
  Dec(ContextMenu);

  with FormatETC do begin
    cfFormat := CF_HDROP;
    ptd      := nil;
    dwAspect := DVASPECT_CONTENT;
    lindex   := -1;
    tymed    := TYMED_HGLOBAL
  end;
  Result := E_FAIL;
  if Succeeded(lpdobj^^.GetData(lpdobj, FormatETC, StgMedium)) and
     (DragQueryFile(StgMedium.hGlobal, $FFFFFFFF, nil, 0) = 1) then begin
    DragQueryFile(StgMedium.hGlobal, 0, szFile, SizeOf(szFile));
    pcm^.FileName := szFile;
    ReleaseStgMedium(StgMedium);
    Result := S_OK
  end
end;


initialization
  // Setup the method table for each interface that is implemented.
  with ClassFactoryMT, IUnknownMT do begin
    QueryInterface := ClassFactory_QueryInterface;
    AddRef         := ClassFactory_AddRef;
    Release        := ClassFactory_Release;

    CreateInstance := ClassFactory_CreateInstance;
    LockServer     := ClassFactory_LockServer
  end;

  with ContextMenuMT, IUnknownMT do begin
    QueryInterface := ContextMenu_QueryInterface;
    AddRef         := ContextMenu_AddRef;
    Release        := ContextMenu_Release;

    QueryContextMenu := ContextMenu_QueryContextMenu;
    InvokeCommand    := ContextMenu_InvokeCommand;
    GetCommandString := ContextMenu_GetCommandString
  end;

  with ShellExtInitMT, IUnknownMT do begin
    QueryInterface := ShellExtInit_QueryInterface;
    AddRef         := ShellExtInit_AddRef;
    Release        := ShellExtInit_Release;

    Initialize     := ShellExtInit_Initialize
  end;

  // "Instantiate" the classfactory.
  ClassFactory := @ClassFactoryMT;

  DisableThreadLibraryCalls(hInstance)
end.
