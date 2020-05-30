unit CopyHk;

interface

uses
  Windows, ActiveX, ComObj, ShlObj;

type
  TCopyHook = class(TComObject, ICopyHook)
  public
    function CopyCallback(Wnd: HWND; wFunc, wFlags: UINT; pszSrcFile: PAnsiChar;
      dwSrcAttribs: DWORD; pszDestFile: PAnsiChar; dwDestAttribs: DWORD): UINT; stdcall;
  end;

const
  Class_CopyHook: TGUID = '{29F97553-FBD6-11D1-AFC1-00A024D1875C}';

implementation

uses ComServ, ShellAPI, SysUtils, Registry;

function TCopyHook.CopyCallBack(Wnd: HWND; wFunc, wFlags: UINT; pszSrcFile: PAnsiChar;
  dwSrcAttribs: DWORD; pszDestFile: PAnsiChar; dwDestAttribs: DWORD): UINT;
// This is the method which is called by the shell for folder operations
const
  ConfirmMessage = 'Are you sure you want to %s ''%s''?';
var
  Operation: string;
begin
  case wFunc of
    FO_COPY:
      Operation := 'copy';
    FO_DELETE:
      Operation := 'delete';
    FO_MOVE:
      Operation := 'move';
    FO_RENAME:
      Operation := 'rename';
    else
      Operation := 'continue this operation on'
  end;

  // confirm operation
  Result := MessageBox(Wnd, PChar(Format(ConfirmMessage, [Operation, pszSrcFile])),
    'Delphi CopyHook Shell Extension...' , MB_YESNOCANCEL);
end;

type
  TCopyHookFactory = class(TComObjectFactory)
  public
    procedure UpdateRegistry(Register: Boolean); override;
  end;

procedure TCopyHookFactory.UpdateRegistry(Register: Boolean);
var
  ClassID: string;
begin
  if Register then begin
    inherited UpdateRegistry(Register);

    ClassID := GUIDToString(Class_CopyHook);
    CreateRegKey('Directory\shellex\CopyHookHandlers\DelphiCopyHook', '', ClassID);
    if (Win32Platform = VER_PLATFORM_WIN32_NT) then
      with TRegistry.Create do
        try
          RootKey := HKEY_LOCAL_MACHINE;
          OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions', True);
          OpenKey('Approved', True);
          WriteString(ClassID, 'Delphi CopyHook Shell Extension Example');
        finally
          Free;
        end;
  end
  else begin
    DeleteRegKey('Directory\shellex\CopyHookHandlers\DelphiCopyHook');

    inherited UpdateRegistry(Register);
  end;
end;

initialization
  TCopyHookFactory.Create(ComServer, TCopyHook, Class_CopyHook, '',
    'Delphi CopyHook Shell Extension Example', ciMultiInstance, tmApartment);
end.
