unit Bank_c;

{This file was generated on 11 Aug 2000 20:11:56 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_c                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA,
  Bank_i;

type
  TerrStructHelper = class;
  TerrStruct = class;
  EAccountOverRun = class;
  EFoo = class;
  EThrowOne = class;
  TAccountHelper = class;
  TAccountStub = class;

  TerrStructHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : Bank_i.errStruct);
    class function  Extract(const _A: CORBA.Any): Bank_i.errStruct;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : Bank_i.errStruct;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.errStruct);
  end;

  TerrStruct = class (TInterfacedObject, Bank_i.errStruct)
  private
    myInt : SmallInt;
    myStr : AnsiString;
    constructor Create; overload;
  public
    function  _get_myInt : SmallInt; virtual;
    procedure _set_myInt ( const _value : SmallInt ); virtual;
    function  _get_myStr : AnsiString; virtual;
    procedure _set_myStr ( const _value : AnsiString ); virtual;
    constructor Create (const myInt : SmallInt;
                            const myStr : AnsiString
                       ); overload;
  end;

  EAccountOverRun = class(UserException)
  private
    Fvalue : Single;
  protected
    function  _get_value : Single; virtual;
  public
    property  value : Single read _get_value;
    constructor Create; overload;
    constructor Create(const value : Single); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  EFoo = class(UserException)
  private
    FmyStruct : Bank_i.errStruct;
  protected
    function  _get_myStruct : Bank_i.errStruct; virtual;
  public
    property  myStruct : Bank_i.errStruct read _get_myStruct;
    constructor Create; overload;
    constructor Create(const myStruct : Bank_i.errStruct); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  EThrowOne = class(UserException)
  private
    Fst : AnsiString;
  protected
    function  _get_st : AnsiString; virtual;
  public
    property  st : AnsiString read _get_st;
    constructor Create; overload;
    constructor Create(const st : AnsiString); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Bank_i.Account);
    class function  Extract(var _A: CORBA.Any) : Bank_i.Account;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Bank_i.Account;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Account);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Bank_i.Account;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Account; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Account; overload;
  end;

  TAccountStub = class(CORBA.TCORBAObject, Bank_i.Account)
  public
    function  balance : Single; virtual;
    procedure deposit ( const value : Single); virtual;
    procedure withdrawl ( const value : Single); virtual;
    procedure DoException ; virtual;
  end;


implementation


var

  AccountOverRunDesc : PExceptionDescription;

  FooDesc : PExceptionDescription;

  ThrowOneDesc : PExceptionDescription;

class procedure TerrStructHelper.Insert(var _A : CORBA.Any; const _Value : Bank_i.errStruct);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TerrStructHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TerrStructHelper.TypeCode, _Output);
end;

class function TerrStructHelper.Extract(const _A : CORBA.Any) : Bank_i.errStruct;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TerrStructHelper.Read(_Input);
end;

class function TerrStructHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 2);
  _Seq[0].Name := 'myInt';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_short));
  _Seq[1].Name := 'myStr';
  _Seq[1].TC   := ORB.CreateTC(Integer(tk_string));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'errStruct', _Seq);
end;

class function TerrStructHelper.RepositoryId : string;
begin
  Result := 'IDL:Bank/errStruct:1.0';
end;

class function TerrStructHelper.Read(const _Input : CORBA.InputStream) : Bank_i.errStruct;
var
  _Value : Bank_c.TerrStruct;
begin
  _Value := Bank_c.TerrStruct.Create;
  _Input.ReadShort(_Value.myInt);
  _Input.ReadString(_Value.myStr);
  Result := _Value;
end;

class procedure TerrStructHelper.Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.errStruct);
begin
  _Output.WriteShort(_Value.myInt);
  _Output.WriteString(_Value.myStr);
end;

constructor TerrStruct.Create;
begin
  inherited Create;
end;

constructor TerrStruct.Create(const myInt: SmallInt;
                              const myStr: AnsiString);
begin
  Self.myInt := myInt;
  Self.myStr := myStr;
end;

function  TerrStruct._get_myInt: SmallInt;
begin
  Result := myInt;
end;

procedure TerrStruct._set_myInt(const _Value : SmallInt);
begin
  myInt := _Value;
end;

function  TerrStruct._get_myStr: AnsiString;
begin
  Result := myStr;
end;

procedure TerrStruct._set_myStr(const _Value : AnsiString);
begin
  myStr := _Value;
end;


function  EAccountOverRun._get_value : Single;
begin
  Result := Fvalue;
end;


constructor EAccountOverRun.Create;
begin
  inherited Create;
end;

constructor EAccountOverRun.Create(const value : Single);
begin
  inherited Create;
  Fvalue := value;
end;

procedure EAccountOverRun.Copy(const _Input: InputStream);
begin
  _Input.ReadFloat(Fvalue);
end;

procedure EAccountOverRun.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:Bank/AccountOverRun:1.0');
  _Output.WriteFloat(Fvalue);
end;
function  AccountOverRun_Factory: PExceptionProxy; cdecl;
begin
  with Bank_c.EAccountOverRun.Create() do Result := Proxy;
end;


function  EFoo._get_myStruct : Bank_i.errStruct;
begin
  Result := FmyStruct;
end;


constructor EFoo.Create;
begin
  inherited Create;
end;

constructor EFoo.Create(const myStruct : Bank_i.errStruct);
begin
  inherited Create;
  FmyStruct := myStruct;
end;

procedure EFoo.Copy(const _Input: InputStream);
begin
  FmyStruct := Bank_c.TerrStructHelper.Read(_Input);
end;

procedure EFoo.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:Bank/Foo:1.0');
  Bank_c.TerrStructHelper.Write(_Output, FmyStruct);
end;
function  Foo_Factory: PExceptionProxy; cdecl;
begin
  with Bank_c.EFoo.Create() do Result := Proxy;
end;


function  EThrowOne._get_st : AnsiString;
begin
  Result := Fst;
end;


constructor EThrowOne.Create;
begin
  inherited Create;
end;

constructor EThrowOne.Create(const st : AnsiString);
begin
  inherited Create;
  Fst := st;
end;

procedure EThrowOne.Copy(const _Input: InputStream);
begin
  _Input.ReadString(Fst);
end;

procedure EThrowOne.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:Bank/ThrowOne:1.0');
  _Output.WriteString(Fst);
end;
function  ThrowOne_Factory: PExceptionProxy; cdecl;
begin
  with Bank_c.EThrowOne.Create() do Result := Proxy;
end;

class procedure TAccountHelper.Insert(var _A : CORBA.Any; const _Value : Bank_i.Account);
begin
  _A := Orb.MakeObjectRef( TAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Extract(var _A : CORBA.Any): Bank_i.Account;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TAccountHelper.Narrow(_obj, True);
end;

class function TAccountHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Account');
end;

class function TAccountHelper.RepositoryId : string;
begin
  Result := 'IDL:Bank/Account:1.0';
end;

class function TAccountHelper.Read(const _Input : CORBA.InputStream) : Bank_i.Account;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Account);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Bank_i.Account;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Bank_i.Account, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAccountStub.Create(_Obj);
end;

class function TAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAccountStub.balance : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

procedure TAccountStub.deposit ( const value : Single);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('deposit',True, _Output);
  _Output.WriteFloat(value);
  inherited _Invoke(_Output, _Input);
end;

procedure TAccountStub.withdrawl ( const value : Single);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('withdrawl',True, _Output);
  _Output.WriteFloat(value);
  inherited _Invoke(_Output, _Input);
end;

procedure TAccountStub.DoException ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('DoException',True, _Output);
  inherited _Invoke(_Output, _Input);
end;


initialization
Bank_c.AccountOverRunDesc := RegisterUserException('AccountOverRun', 'IDL:Bank/AccountOverRun:1.0', @Bank_c.AccountOverRun_Factory);
Bank_c.FooDesc := RegisterUserException('Foo', 'IDL:Bank/Foo:1.0', @Bank_c.Foo_Factory);
Bank_c.ThrowOneDesc := RegisterUserException('ThrowOne', 'IDL:Bank/ThrowOne:1.0', @Bank_c.ThrowOne_Factory);


finalization
UnRegisterUserException(Bank_c.AccountOverRunDesc);
UnRegisterUserException(Bank_c.FooDesc);
UnRegisterUserException(Bank_c.ThrowOneDesc);


end.