
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{       MS Transaction Server Interface Unit            }
{                                                       }
{       Copyright (c) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit Mtx;

interface

uses Windows;  

const

{ Trappable Error Codes }

  mtsErrCtxAborted         = $8004E002;
  mtsErrCtxAborting        = $8004E003;
  mtsErrCtxNoContext       = $8004E004;
  mtsErrCtxNotRegistered   = $8004E005;
  mtsErrCtxActivityTimeout = $8004E006;
  mtsErrCtxOldReference    = $8004E007;
  mtsErrCtxRoleNotFound    = $8004E00C;
  mtsErrCtxNoSecurity      = $8004E00D;
  mtsErrCtxWrongThread     = $8004E00E;
  mtsErrCtxTMNotAvailable  = $8004E00F;

{ Component class GUIDs }

  CLASS_TransactionContext: TGUID = '{7999FC25-D3C6-11CF-ACAB-00A024A55AEF}';
  CLASS_TransactionContextEx: TGUID = '{5CB66670-D3D4-11CF-ACAB-00A024A55AEF}';
  CLASS_SharedPropertyGroupManager: TGUID = '{2A005C11-A5DE-11CF-9E66-00AA00A3F464}';

const
  LockSetGet = $00000000;
  LockMethod = $00000001;

  Standard = $00000000;
  Process  = $00000001;

type

{ Forward declarations: Interfaces }
  IObjectContext = interface;
  IGetContextProperties = interface;  
  IEnumNames = interface;             
  ISecurityProperty = interface;
  IObjectControl = interface;
  IObjectContextActivity = interface;

  ITransactionContext = interface;
  ITransactionContextEx = interface;

  ISharedProperty = interface;
  ISharedPropertyGroup = interface;
  ISharedPropertyGroupManager = interface;

{ IObjectContext }

  IObjectContext = interface(IUnknown)
    ['{51372AE0-CAE7-11CF-BE81-00AA00A2FA25}']
    function CreateInstance(const cid, rid: TGUID; out pv): HResult; stdcall;
    procedure SetComplete; safecall;
    procedure SetAbort; safecall;
    procedure EnableCommit; safecall;
    procedure DisableCommit; safecall;
    function IsInTransaction: Bool; stdcall;
    function IsSecurityEnabled: Bool; stdcall;
    function IsCallerInRole(const bstrRole: WideString): Bool; safecall;
  end;

{ IGetContextProperties }

  IGetContextProperties = interface(IUnknown)  //!! Make these all safecall???
    ['{51372AF4-CAE7-11CF-BE81-00AA00A2FA25}']
    function Count: Integer; safecall;
    function GetProperty(const name: WideString): OleVariant; safecall;
    function EnumNames: IEnumNames; safecall;
  end;

{ IEnumNames }

  IEnumNames = interface(IUnknown)
    ['{51372AF2-CAE7-11CF-BE81-00AA00A2FA25}']
    function Next(celt: UINT; out rgname: WideString;
      out pceltFetched: UINT): HResult; stdcall;
    function Skip(celt: UINT): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out enm: IEnumNames): HResult; stdcall;
  end;

{ ISecurityProperty }

  ISecurityProperty = interface(IUnknown)  
    ['{51372AEA-CAE7-11CF-BE81-00AA00A2FA25}']
    function GetDirectCreatorSID(out sid: PSID): HResult; stdcall;  
    function GetOriginalCreatorSID(out sid: PSID): HResult; stdcall;
    function GetDirectCallerSID(out sid: PSID): HResult; stdcall;
    function GetOriginalCallerSID(out sid: PSID): HResult; stdcall;
    function ReleaseSID(sid: PSID): HResult; stdcall;
  end;

{ IObjectControl }

  IObjectControl = interface(IUnknown)
    ['{51372AEC-CAE7-11CF-BE81-00AA00A2FA25}']
    procedure Activate; safecall;
    procedure Deactivate; stdcall;
    function CanBePooled: Bool; stdcall;
  end;

{ IObjectContextActivity }

  IObjectContextActivity = interface(IUnknown)
    ['{51372AFC-CAE7-11CF-BE81-00AA00A2FA25}']
    function GetActivityId: TGuid; safecall;
  end;

{ ITransactionContext }

  ITransactionContext = interface(IDispatch)
    ['{7999FC21-D3C6-11CF-ACAB-00A024A55AEF}']
    function CreateInstance(const pszProgId: WideString): OleVariant; safecall;
    procedure Commit; safecall;
    procedure Abort; safecall;
  end;

{ ITransactionContextEx }

  ITransactionContextEx = interface(IUnknown)
    ['{7999FC22-D3C6-11CF-ACAB-00A024A55AEF}']
    function CreateInstance(const cid, rid: TGUID; out pv): HRESULT; stdcall;
    function Commit: HResult; stdcall;
    function Abort: HResult; stdcall;
  end;

{ ISharedProperty }

  ISharedProperty = interface(IDispatch)
    ['{2A005C01-A5DE-11CF-9E66-00AA00A3F464}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pVal: OleVariant); safecall;
    property Value: OleVariant read Get_Value write Set_Value;
  end;

{ ISharedPropertyGroup }

  ISharedPropertyGroup = interface(IDispatch)
    ['{2A005C07-A5DE-11CF-9E66-00AA00A3F464}']
    function CreatePropertyByPosition(Index: Integer{!! SYSINT}; out fExists: WordBool): ISharedProperty; safecall;
    function Get_PropertyByPosition(Index: Integer{!! SYSINT}): ISharedProperty; safecall;
    function CreateProperty(const Name: WideString; out fExists: WordBool): ISharedProperty; safecall;
    function Get_PropertyByName(const Name: WideString): ISharedProperty; safecall;
    property PropertyByPosition[Index: Integer{!! SYSINT}]: ISharedProperty read Get_PropertyByPosition;
    property PropertyByName[const Name: WideString]: ISharedProperty read Get_PropertyByName;
  end;

{ ISharedPropertyGroupManager }

  ISharedPropertyGroupManager = interface(IDispatch)
    ['{2A005C0D-A5DE-11CF-9E66-00AA00A3F464}']
    function CreatePropertyGroup(const Name: WideString; var LockMode: Integer;
      var RelMode: Integer; out fExists: WordBool): ISharedPropertyGroup; safecall;
    function Get_Group(const Name: WideString): ISharedPropertyGroup; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Group[const Name: WideString]: ISharedPropertyGroup read Get_Group;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ Object APIs }

function GetObjectContext: IObjectContext;
function SafeRef(rid: TGUID; Unk: IUnknown): Pointer;

{ Client APIs }

function CreateTransactionContext: ITransactionContext;
function CreateTransactionContextEx: ITransactionContextEx;

{ Server APIs }
function CreateSharedPropertyGroupManager: ISharedPropertyGroupManager;
function CreateSharedPropertyGroup(const Name: WideString): ISharedPropertyGroup;

implementation

uses ComObj;

type
  TGetObjectContextProc = function(var ObjectContext: IObjectContext): HRESULT; cdecl;
  TSafeRefProc = function(rid: TGUID; Unk: IUnknown): Pointer; cdecl;
var
  GetObjectContextProc: TGetObjectContextProc = nil;
  SafeRefProc: TSafeRefProc = nil;
  MtsProcsLoaded: Boolean = False;

procedure LoadMtsProcs;
var
  Mtxdll: HModule;
begin
  if MtsProcsLoaded then Exit;
  MtsProcsLoaded := True;
  Mtxdll := GetModuleHandle('mtxex.dll');
  if mtxdll <> 0 then
  begin
    @GetObjectContextProc := GetProcAddress(Mtxdll, 'GetObjectContext');
    @SafeRefProc := GetProcAddress(Mtxdll, 'SafeRef');
  end;
end;

function GetObjectContext: IObjectContext;
begin
  LoadMtsProcs;
  if Assigned(GetObjectContextProc) then
    OleCheck(GetObjectContextProc(Result))
  else
    Result := nil;
end;

function SafeRef(rid: TGUID; Unk: IUnknown): Pointer;
begin
  LoadMtsProcs;
  if Assigned(SafeRefProc) then
    Result := SafeRef(rid, Unk)
  else
  begin
    Unk._AddRef;
    Result := Pointer(Unk);
  end;
end;

function CreateTransactionContext: ITransactionContext;
begin
  Result := CreateComObject(CLASS_TransactionContext) as ITransactionContext;
end;

function CreateTransactionContextEx: ITransactionContextEx;
begin
  Result := CreateComObject(CLASS_TransactionContextEx) as ITransactionContextEx;
end;

function CreateSharedPropertyGroupManager: ISharedPropertyGroupManager;
begin
  Result := CreateComObject(CLASS_SharedPropertyGroupManager) as ISharedPropertyGroupManager;
end;

function CreateSharedPropertyGroup(const Name: WideString): ISharedPropertyGroup;
var
  Exists: WordBool;
  LockMode: Integer;
  RelMode: Integer; 
begin
  LockMode := LockSetGet;
  RelMode := Process;
  with CreateSharedPropertyGroupManager do
    Result := CreatePropertyGroup(Name, LockMode, RelMode, Exists);
end;

end.
