unit ContextM;

interface

uses
  Windows, ActiveX, ComObj, ShlObj, Dialogs;

type
  TContextMenu = class(TComObject, IShellExtInit, IContextMenu)
  private
    FFileName: array[0..MAX_PATH] of Char;
  protected
    { IShellExtInit }
    function IShellExtInit.Initialize = SEIInitialize; // Avoid compiler warning
    function SEIInitialize(pidlFolder: PItemIDList; lpdobj: IDataObject;
      hKeyProgID: HKEY): HResult; stdcall;
    { IContextMenu }
    function QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst, idCmdLast,
      uFlags: UINT): HResult; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult; stdcall;
    function GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
      pszName: LPSTR; cchMax: UINT): HResult; stdcall;
  end;

const
  Class_ContextMenu: TGUID = '{EBDF1F20-C829-11D1-8233-0020AF3E97A9}';

implementation

uses ComServ, SysUtils, ShellApi, Registry;

function TContextMenu.SEIInitialize(pidlFolder: PItemIDList; lpdobj: IDataObject;
  hKeyProgID: HKEY): HResult;
var
  StgMedium: TStgMedium;
  FormatEtc: TFormatEtc;
begin
  // Fail the call if lpdobj is Nil.
  if (lpdobj = nil) then begin
    Result := E_INVALIDARG;
    Exit;
  end;

  with FormatEtc do begin
    cfFormat := CF_HDROP;
    ptd      := nil;
    dwAspect := DVASPECT_CONTENT;
    lindex   := -1;
    tymed    := TYMED_HGLOBAL;
  end;

  // Render the data referenced by the IDataObject pointer to an HGLOBAL
  // storage medium in CF_HDROP format.
  Result := lpdobj.GetData(FormatEtc, StgMedium);
  if Failed(Result) then
    Exit;
  // If only one file is selected, retrieve the file name and store it in
  // FFileName. Otherwise fail the call.
  if (DragQueryFile(StgMedium.hGlobal, $FFFFFFFF, nil, 0) = 1) then begin
    DragQueryFile(StgMedium.hGlobal, 0, FFileName, SizeOf(FFileName));
    Result := NOERROR;
  end
  else begin
    FFileName[0] := #0;
    Result := E_FAIL;
  end;
  ReleaseStgMedium(StgMedium);
end;

function TContextMenu.QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst,
          idCmdLast, uFlags: UINT): HResult;
begin
  Result := 0; // or use MakeResult(SEVERITY_SUCCESS, FACILITY_NULL, 0);

  if ((uFlags and $0000000F) = CMF_NORMAL) or
     ((uFlags and CMF_EXPLORE) <> 0) then begin
    // Add one menu item to context menu
    InsertMenu(Menu, indexMenu, MF_STRING or MF_BYPOSITION, idCmdFirst,
      'Compile...');

    // Return number of menu items added
    Result := 1; // or use MakeResult(SEVERITY_SUCCESS, FACILITY_NULL, 1)
  end;
end;

function GetCompilerPath: string;
// Returns string containing path to Delphi command line compiler
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    with Reg do begin
      RootKey := HKEY_LOCAL_MACHINE;

      OpenKey('\SOFTWARE\Borland\Delphi\6.0', False);
      Result := ExpandFileName(ReadString('RootDir') + '\bin\dcc32.exe');
    end;
    if AnsiPos(' ', Result) <> 0 then
      Result := ExtractShortPathName(Result);
    Result := Result + ' "%s"';
  finally
    Reg.Free;
  end;
end;

function TContextMenu.InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult;
resourcestring
  sPathError = 'Error setting current directory';

var
  H: THandle;
  PrevDir: string;
  
begin
  Result := E_FAIL;
  // Make sure we are not being called by an application
  if (HiWord(Integer(lpici.lpVerb)) <> 0) then
  begin
    Exit;
  end;

  // Make sure we aren't being passed an invalid argument number
  if (LoWord(lpici.lpVerb) <> 0) then begin
    Result := E_INVALIDARG;
    Exit;
  end;

  // Execute the command specified by lpici.lpVerb
  // by invoking the Delphi command line compiler.
  PrevDir := GetCurrentDir;
  try
    if not SetCurrentDir(ExtractFilePath(FFileName)) then
      raise Exception.CreateRes(@sPathError);

    H := WinExec(PChar(Format(GetCompilerPath, [FFileName])), lpici.nShow);

    if (H < 32) then
      MessageBox(lpici.hWnd, 'Error executing Delphi compiler.', 'Error',
        MB_ICONERROR or MB_OK);
    Result := NOERROR;
  finally
    SetCurrentDir(PrevDir);
  end;
end;

function TContextMenu.GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
  pszName: LPSTR; cchMax: UINT): HRESULT;
begin
  if (idCmd = 0) then begin
    if (uType = GCS_HELPTEXT) then
      // return help string for menu item
      StrCopy(pszName, 'Compile the selected Delphi project');
    Result := NOERROR;
  end
  else
    Result := E_INVALIDARG;
end;

type
  TContextMenuFactory = class(TComObjectFactory)
  public
    procedure UpdateRegistry(Register: Boolean); override;
  end;

procedure TContextMenuFactory.UpdateRegistry(Register: Boolean);
var
  ClassID: string;
begin
  if Register then begin
    inherited UpdateRegistry(Register);

    ClassID := GUIDToString(Class_ContextMenu);
    CreateRegKey('DelphiProject\shellex', '', '');
    CreateRegKey('DelphiProject\shellex\ContextMenuHandlers', '', '');
    CreateRegKey('DelphiProject\shellex\ContextMenuHandlers\ContMenu', '', ClassID);

    if (Win32Platform = VER_PLATFORM_WIN32_NT) then
      with TRegistry.Create do
        try
          RootKey := HKEY_LOCAL_MACHINE;
          OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions', True);
          OpenKey('Approved', True);
          WriteString(ClassID, 'Delphi Context Menu Shell Extension Example');
        finally
          Free;
        end;
  end
  else begin
    DeleteRegKey('DelphiProject\shellex\ContextMenuHandlers\ContMenu');
    DeleteRegKey('DelphiProject\shellex\ContextMenuHandlers');
    DeleteRegKey('DelphiProject\shellex');

    inherited UpdateRegistry(Register);
  end;
end;

initialization
  TContextMenuFactory.Create(ComServer, TContextMenu, Class_ContextMenu,
    '', 'Delphi Context Menu Shell Extension Example', ciMultiInstance,
    tmApartment);
end.
