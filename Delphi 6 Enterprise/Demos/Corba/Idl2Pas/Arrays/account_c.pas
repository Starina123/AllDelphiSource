unit account_c;

{This file was generated on 27 Oct 2000 17:52:20 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Arrays\account.idl.                                     }

{Delphi Pascal unit      : account_c                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  account_i;

type
  TArrayTypeHelper = class;
  TAccountHelper = class;
  TAccountStub = class;

  TArrayTypeHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : account_i.ArrayType);
    class function  Extract(const _A: CORBA.Any): account_i.ArrayType;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : account_i.ArrayType;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : account_i.ArrayType);
  end;

  TAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : account_i.Account);
    class function  Extract(var _A: CORBA.Any) : account_i.Account;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : account_i.Account;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : account_i.Account);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : account_i.Account;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : account_i.Account; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : account_i.Account; overload;
  end;

  TAccountStub = class(CORBA.TCORBAObject, account_i.Account)
  public
    function  balance ( const myArray : account_i.ArrayType): Single; virtual;
  end;


implementation

class procedure TArrayTypeHelper.Insert(var _A: CORBA.Any; const _Value : account_i.ArrayType);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TArrayTypeHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TArrayTypeHelper.TypeCode, _Output);
end;

class function  TArrayTypeHelper.Extract(const _A : CORBA.Any): account_i.ArrayType;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TArrayTypeHelper.Read(_Input);
end;

class function  TArrayTypeHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateArrayTC(3, ORB.CreateTC(Integer(tk_short)));
end;

class function  TArrayTypeHelper.RepositoryId: string;
begin
  Result := 'IDL:ArrayType:1.0';
end;

class function  TArrayTypeHelper.Read(const _Input: CORBA.InputStream) : account_i.ArrayType;
var
  I0 : Cardinal;
begin
  for I0 := 0 to 2 do
  begin
    _Input.ReadShort(Result[I0]);
  end;
end;

class procedure TArrayTypeHelper.Write(const _Output: CORBA.OutputStream; const _Value: account_i.ArrayType);
var
  I0 : Cardinal;
begin
  for I0 := 0 to 2 do
  begin
    _Output.WriteShort(_Value[I0]);
  end;
end;

class procedure TAccountHelper.Insert(var _A : CORBA.Any; const _Value : account_i.Account);
begin
  _A := Orb.MakeObjectRef( TAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Extract(var _A : CORBA.Any): account_i.Account;
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
  Result := 'IDL:Account:1.0';
end;

class function TAccountHelper.Read(const _Input : CORBA.InputStream) : account_i.Account;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : account_i.Account);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : account_i.Account;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(account_i.Account, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAccountStub.Create(_Obj);
end;

class function TAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : account_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : account_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAccountStub.balance ( const myArray : account_i.ArrayType): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  account_c.TArrayTypeHelper.Write(_Output, myArray);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.