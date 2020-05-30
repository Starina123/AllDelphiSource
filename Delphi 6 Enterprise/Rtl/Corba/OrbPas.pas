{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

unit OrbPas;

interface

uses Windows, ActiveX, Variants, SysUtils;

type
  ICorbaObj = interface;
  IMarshalInBuffer = interface;
  IMarshalOutBuffer = interface;
  ISkeleton = interface;
  IStub = interface;
  IBOA = interface;
  IORB = interface;
  ISkeletonObject = interface;
  IStubObject = interface;

  CorbaBoolean = ByteBool;
  CorbaULong = Integer;
  PCorbaAny = type Pointer;
  PCorbaObject = type Pointer;
  PCorbaOrb = type Pointer;
  PCorbaInterfaceDef = type Pointer;
  PMarshalInbuffer = type Pointer;
  PMarshalOutbuffer = type Pointer;
  PUserExceptionProxy = type Pointer;
  PExceptionDescription = type Pointer;

  TArgv = array of string;

  ICorbaObj = interface
    ['{47E946E1-BEA1-11D1-AA8A-00C04FB16F42}']
    function CorbaObject: PCorbaObject; stdcall;
    function IsLocal: CorbaBoolean; stdcall;
  end;

  IMarshalInBuffer = interface
    ['{47E946E2-BEA1-11D1-AA8A-00C04FB16F42}']
    function Buffer: PMarshalInbuffer; stdcall;
    function GetText: PChar; stdcall;
    function GetChar: Shortint; stdcall;
    function GetUnsignedChar: Byte; stdcall;
    function GetShort: Smallint; stdcall;
    function GetUnsignedShort: Word; stdcall;
    function GetLong: Integer; stdcall;
    function GetUnsignedLong: UINT; stdcall;
    function GetFloat: Single; stdcall;
    function GetDouble: Double; stdcall;
    function GetWideText: PWideChar; stdcall;
    function GetWidechar: Word; stdcall;
    function GetAny: PCorbaAny; stdcall;
    procedure GetObject(out Obj: ICorbaObj; ref_cnt: CorbaBoolean = True); stdcall;
  end;

  IMarshalOutBuffer = interface
    ['{47E946E3-BEA1-11D1-AA8A-00C04FB16F42}']
    function Buffer: PMarshalOutbuffer; stdcall;
    procedure PutText(Value: PChar); stdcall;
    procedure PutChar(Value: Shortint); stdcall;
    procedure PutUnsignedChar(Value: Byte); stdcall;
    procedure PutShort(Value: Smallint); stdcall;
    procedure PutUnsignedShort(Value: Word); stdcall;
    procedure PutLong(Value: Integer); stdcall;
    procedure PutUnsignedLong(Value: UINT); stdcall;
    procedure PutFloat(Value: Single); stdcall;
    procedure PutDouble(Value: Double); stdcall;
    procedure PutWideText(Value: PWideChar); stdcall;
    procedure PutWidechar(Value: Word); stdcall;
    procedure PutAny(Value: PCorbaAny); stdcall;
    procedure PutObject(const Value: ICorbaObj); stdcall;
  end;

  ISkeleton = interface(ICorbaObj)
    ['{47E946E4-BEA1-11D1-AA8A-00C04FB16F42}']
    procedure GetImplementation(out Impl: IUnknown); stdcall;
    procedure GetReplyBuffer(cookie: Pointer; out Outbuf: IMarshalOutBuffer); stdcall;
  end;

  IStub = interface(ICorbaObj)
    ['{47E946E5-BEA1-11D1-AA8A-00C04FB16F42}']
    procedure CreateRequest(Operation: PChar; ResponseExpected: CorbaBoolean; out Outbuf: IMarshalOutBuffer); stdcall;
    procedure Invoke(const Outbuf: IMarshalOutBuffer; out Inbuf: IMarshalInBuffer); stdcall;
    function GetInterface: PCorbaInterfaceDef; stdcall;
    function NonExistent: CorbaBoolean; stdcall;
    function Hash(Maximum: CorbaULong): CorbaULong; stdcall;
    function IsA(LogicalTypeId: PChar): CorbaBoolean; stdcall;
    procedure SetPrincipal(Bytes: Pointer; Length: CorbaULong); stdcall;
    function RepositoryID: PChar; stdcall;
    function Dispatch(CallDesc: PCallDesc; Params: Pointer; out Result: Variant): Integer; stdcall;
  end;

  TCKind = (tk_null, tk_void, tk_short, tk_long, tk_ushort, tk_ulong, tk_float,
    tk_double, tk_boolean, tk_char, tk_octet, tk_any, tk_TypeCode, tk_Principal,
    tk_objref, tk_struct, tk_union, tk_enum, tk_string, tk_sequence, tk_array,
    tk_alias, tk_except, tk_longlong, tk_ulonglong, tk_longdouble, tk_wchar,
    tk_wstring, tk_fixed);

  ITypeCode = interface
    ['{D3D381F7-D944-11D1-AAEC-00C04FB17A72}']
    function Kind: TCKind; stdcall;
    procedure ContentType(out tc: ITypeCode); stdcall;
    function DefaultIndex: Integer; stdcall;
    procedure DiscriminatorType(out tc: ITypeCode); stdcall;
    function Equal(const tc: ITypeCode): CorbaBoolean; stdcall;
    function Id: PChar; stdcall;
    function Length: CorbaULong; stdcall;
    function MemberCount: CorbaULong; stdcall;
    function MemberLabel(index: CorbaULong): PCorbaAny; stdcall;
    function MemberName(index: CorbaULong): PChar; stdcall;
    procedure MemberType(index: CorbaULong; out tc: ITypeCode); stdcall;
    function Name: PChar; stdcall;
    function Parameter(index: Integer): PCorbaAny; stdcall;
    function ParameterCount: Integer; stdcall;
  end;

  IBOA = interface
    ['{47E946E6-BEA1-11D1-AA8A-00C04FB16F42}']
    procedure ObjIsReady(const Skeleton: ISkeleton); stdcall;
    procedure ImplIsReady; stdcall;
    procedure Deactivate(const Skeleton: ISkeleton); stdcall;
    function GetPrincipalLength(Skeleton: ISkeleton): Integer; stdcall;
    function GetPrincipal(Skeleton: ISkeleton; Bytes: Pointer): Integer; stdcall;
  end;

  TStructMember = record
    Name: string;
    TC: ITypeCode;
  end;

  TStructMembers = array of TStructMember;

  IORB = interface
    ['{47E946E7-BEA1-11D1-AA8A-00C04FB16F42}']
    function Orb: PCorbaOrb stdcall;
    procedure BOAInit(Argc: Integer; const Argv: TArgv; out BOA: IBOA); stdcall;
    function ObjectToString(const Obj: IStub): PChar; stdcall;
    procedure StringToObject(Str: PChar; out Obj: IStub); stdcall;
    procedure Shutdown; stdcall;
    procedure FindRepositoryTC(RepID: PChar; out TC: ITypeCode); stdcall;
    procedure CreateTC(Kind: TCKind; out TC: ITypeCode); stdcall;
    procedure CreateArrayTC(Bound: CorbaULong; const TC: ITypeCode;
      out Result: ITypeCode); stdcall;
    procedure CreateSequenceTC(Bound: CorbaULong; const TC: ITypeCode;
      out Result: ITypeCode); stdcall;
    function MakeAny(const TC: ITypeCode; VS: array of Variant): PCorbaAny; stdcall;
    function DispatchStruct(Any: PCorbaAny; CallDesc: PCallDesc; Params: Pointer;
      out Result: Variant): Integer; stdcall;
    procedure CreateAliasTC(RepID: PChar; TypeName: PChar; const TC: ITypeCode; out Result: ITypeCode); stdcall;
    procedure CreateStructTC(Kind: TCKind; RepId, Name: PChar; Members: TStructMembers; nMember: Integer; out Result: ITypeCode); stdcall;
    procedure CreateObjRefTC(RepId, Name: PChar; out Result: ITypeCode); stdcall;
  end;

  ISkeletonObject = interface
    ['{47E946E8-BEA1-11D1-AA8A-00C04FB16F42}']
    procedure GetSkeleton(out Skeleton: ISkeleton); stdcall;
    procedure GetImplementation(out Impl: IUnknown); stdcall;
    function Execute(Operation: PChar; const Strm: IMarshalInBuffer;
      Cookie: Pointer): CorbaBoolean; stdcall;
  end;

  IStubObject = interface
    ['{47E946E9-BEA1-11D1-AA8A-00C04FB16F42}']
    procedure GetStub(out stub :IStub); stdcall;
  end;

type
  TCopyUserExceptionProc = procedure (const InBuf: IMarshalInBuffer) of object; register;
  TThrowUserExceptionProc = procedure of object; register;
  TUserExceptionFactoryProc = function : PUserExceptionProxy; cdecl;

procedure InitORB(const Argv: TArgv; out Orb: IORB);
procedure CorbaStringFree(Str: PChar);
procedure CorbaWStringFree(Str: PWideChar);
function CorbaDuplicateAny(Any: PCorbaAny): PCorbaAny;
procedure CorbaReleaseAny(Any: PCorbaAny);
procedure CorbaAnyType(Any: PCorbaAny; out TypeCode: ITypeCode);
procedure CreateSkeleton(InterfaceName: PChar;
  const DelphiObject: ISkeletonObject; Serialize: CorbaBoolean;
  InstanceName, RepositoryID: PChar; ClientRefCount: CorbaBoolean;
  out Skeleton: ISkeleton);
procedure BindStub(RepositoryID, InstanceName, HostName: PChar; const Orb: IORB;
  RefCountServer: CorbaBoolean; out Stub: IStub);
function VariantToAny(Value: PVariant): PCorbaAny;
function AnyToVariant(Value: PCorbaAny; OV: PVariant): Boolean;
function SequenceToVariant(Value: PCorbaAny; OV: PVariant): Boolean;
function CreateUserException(copy: TCopyUserExceptionProc; throwobj: TThrowUserExceptionProc): PUserExceptionProxy;
function RegisterUserException(Name, RepositoryID: PChar; Factory: TUserExceptionFactoryProc): PExceptionDescription;
procedure UnRegisterUserException(Description: PExceptionDescription);

implementation

uses CorbCnst;

var
  OrbDll: THandle = 0;

type
  TInitOrbProc = procedure(Argc: Integer; const Argv: TArgv; out Orb: IORB); stdcall;
  TCorbaStringFreeProc = procedure(Str: PChar); stdcall;
  TCorbaWStringFreeProc = procedure(Str: PWideChar); stdcall;
  TCorbaDuplicateAnyProc = function(Any: PCorbaAny): PCorbaAny; stdcall;
  TCorbaReleaseAnyProc = procedure(Any: PCorbaAny); stdcall;
  TCorbaAnyTypeProc = procedure (Any: PCorbaAny; out TypeCode: ITypeCode); stdcall;
  TCreateSkeletonProc = procedure(InterfaceName: PChar;
    const DelphiObject: ISkeletonObject; Serialize: CorbaBoolean;
    InstanceName, RepositoryID: PChar; ClientRefCount: CorbaBoolean;
    out Skeleton: ISkeleton); stdcall;
  TBindStubProc = procedure(RepositoryID, InstanceID, HostName: PChar; const Orb: IORB;
    RefCountServer: CorbaBoolean; out Stub: IStub); stdcall;
  TVariantToAnyProc = function(Value: PVariant): PCorbaAny; stdcall;
  TAnyToVariantProc = function(Value: PCorbaAny; OV: PVariant): WordBool; stdcall;
  TPascalClearVariantProc = procedure (var V: Variant); stdcall;
  TPascalChangeTypeProc = function (var Dest, Source: Variant; VTCode: Integer): WordBool; stdcall;
  TInitAnyCallbacks = procedure (pcv: TPascalClearVariantProc; pct: TPascalChangeTypeProc); stdcall;
  TCreateUserExceptionProc = function (copy: TCopyUserExceptionProc; throwobj: TThrowUserExceptionProc): PUserExceptionProxy; stdcall;
  TRegisterUserExceptionProc = function (Name, RepositoryID: PChar; Factory: TUserExceptionFactoryProc): PExceptionDescription; stdcall;
  TUnRegisterUserExceptionProc = procedure (Description: PExceptionDescription); stdcall;

procedure PascalClearVariantImpl(var V: Variant); stdcall;
begin
  V := Unassigned;
end;

function PascalChangeTypeImpl(var Dest, Source: Variant; VTCode: Integer): WordBool; stdcall;
begin
  Result := True;
  try
    Dest := VarAsType(Source, VTCode);
  except
    Result := False;
  end;
end;

var
  InitOrbProc: TInitOrbProc;
  CorbaStringFreeProc: TCorbaStringFreeProc;
  CorbaWStringFreeProc: TCorbaWStringFreeProc;
  CorbaReleaseAnyProc: TCorbaReleaseAnyProc;
  CorbaAnyTypeProc: TCorbaAnyTypeProc;
  CorbaDuplicateAnyProc: TCorbaDuplicateAnyProc;
  CreateSkeletonProc: TCreateSkeletonProc;
  BindStubProc: TBindStubProc;
  VariantToAnyProc: TVariantToAnyProc;
  AnyToVariantProc: TAnyToVariantProc;
  SequenceToVariantProc: TAnyToVariantProc;
  CreateUserExceptionProc: TCreateUserExceptionProc;
  RegisterUserExceptionProc: TRegisterUserExceptionProc;
  UnRegisterUserExceptionProc: TUnRegisterUserExceptionProc;

procedure LoadOrbProcs;
const
  orbpas = 'orbpas60.dll';
var
  InitAnyCallbacks: TInitAnyCallbacks;
begin
  if OrbDll > HINSTANCE_ERROR then Exit;
  OrbDll := LoadLibrary(PChar(orbpas));
  if OrbDll <= HINSTANCE_ERROR then
    raise Exception.CreateFmt('%s: %s', [SysErrorMessage(GetLastError), orbpas]);
  @InitORBProc := GetProcAddress(OrbDll, 'ORB_init');
  @CorbaStringFreeProc := GetProcAddress(OrbDll, 'String_Free');
  @CorbaWStringFreeProc := GetProcAddress(OrbDll, 'WString_Free');
  @CorbaDuplicateAnyProc := GetProcAddress(OrbDll, 'DuplicateAny');
  @CorbaReleaseAnyProc := GetProcAddress(OrbDll, 'ReleaseAny');
  @CorbaAnyTypeProc := GetProcAddress(OrbDll, 'AnyType');
  @CreateSkeletonProc := GetProcAddress(OrbDll, 'DelphiServant_Create');
  @BindStubProc := GetProcAddress(OrbDll, 'DelphiStub_Bind');
  @VariantToAnyProc := GetProcAddress(OrbDll, 'VariantToAny');
  @AnyToVariantProc := GetProcAddress(OrbDll, 'Any2Variant');
  @SequenceToVariantProc := GetProcAddress(OrbDll, 'Sequence2Variant');
  @InitAnyCallbacks := GetProcAddress(OrbDll, 'InitAnyCallbacks');
  if Assigned(InitAnyCallbacks) then
    InitAnyCallbacks(PascalClearVariantImpl, PascalChangeTypeImpl);
  @CreateUserExceptionProc := GetProcAddress(OrbDll, 'CreateDelphiException');
  @RegisterUserExceptionProc := GetProcAddress(OrbDll, 'RegisterDelphiException');
  @UnRegisterUserExceptionProc := GetProcAddress(OrbDll, 'UnRegisterDelphiException');
end;

procedure ValidateProc(var Proc);
begin
  if Pointer(Proc) = nil then raise Exception.CreateRes(@sCorbaNotInitialized);
end;

procedure InitORB(const Argv: TArgv; out Orb: IORB);
begin
  LoadOrbProcs;
  ValidateProc(InitORBProc);
  InitORBProc(Length(Argv), Argv, Orb);
end;

procedure CorbaStringFree(Str: PChar);
begin
  ValidateProc(CorbaStringFreeProc);
  CorbaStringFreeProc(Str);
end;

procedure CorbaWStringFree(Str: PWideChar);
begin
  ValidateProc(CorbaWStringFreeProc);
  CorbaWStringFreeProc(Str);
end;

function CorbaDuplicateAny(Any: PCorbaAny): PCorbaAny;
begin
  ValidateProc(CorbaDuplicateAnyProc);
  Result := CorbaDuplicateAnyProc(Any);
end;

procedure CorbaReleaseAny(Any: PCorbaAny);
begin
  ValidateProc(CorbaReleaseAnyProc);
  CorbaReleaseAnyProc(Any);
end;

procedure CorbaAnyType(Any: PCorbaAny; out TypeCode: ITypeCode);
begin
  ValidateProc(CorbaAnyTypeProc);
  CorbaAnyTypeProc(Any, TypeCode);
end;

procedure CreateSkeleton(InterfaceName: PChar;
  const DelphiObject: ISkeletonObject; Serialize: CorbaBoolean;
  InstanceName, RepositoryID: PChar; ClientRefCount: CorbaBoolean;
  out Skeleton: ISkeleton);
begin
  ValidateProc(CreateSkeletonProc);
  CreateSkeletonProc(InterfaceName, DelphiObject, Serialize, InstanceName,
    RepositoryID, ClientRefCount, Skeleton);
end;

procedure BindStub(RepositoryID, InstanceName, HostName: PChar; const Orb: IORB;
  RefCountServer: CorbaBoolean; out Stub: IStub);
begin
  ValidateProc(BindStubProc);
  BindStubProc(RepositoryID, InstanceName, HostName, Orb, RefCountServer, Stub);
end;

function VariantToAny(Value: PVariant): PCorbaAny;
begin
  ValidateProc(VariantToAnyProc);
  Result := VariantToAnyProc(Value);
end;

function AnyToVariant(Value: PCorbaAny; OV: PVariant): Boolean;
begin
  ValidateProc(AnyToVariantProc);
  Result := AnyToVariantProc(Value, OV);
end;

function SequenceToVariant(Value: PCorbaAny; OV: PVariant): Boolean;
begin
  ValidateProc(SequenceToVariantProc);
  Result := SequenceToVariantProc(Value, OV);
end;

function CreateUserException(copy: TCopyUserExceptionProc; throwobj: TThrowUserExceptionProc): PUserExceptionProxy;
begin
  ValidateProc(CreateUserExceptionProc);
  Result := CreateUserExceptionProc(copy, throwobj);
end;

function RegisterUserException(Name, RepositoryID: PChar; Factory: TUserExceptionFactoryProc): PExceptionDescription;
begin
  ValidateProc(RegisterUserExceptionProc);
  Result := RegisterUserExceptionProc(Name, RepositoryID, Factory);
end;

procedure UnRegisterUserException(Description: PExceptionDescription);
begin
  ValidateProc(UnRegisterUserExceptionProc);
  UnRegisterUserExceptionProc(Description);
end;

initialization

finalization
  // jmt.  Do not unload because threads created by orb_br.dll
  // may be active. 
  // if OrbDll > HINSTANCE_ERROR then FreeLibrary(OrbDll);

end.
