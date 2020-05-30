unit Bank_c;

{This file was generated on 11 Aug 2000 20:16:15 GMT by version 03.03.03.C1.06}
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
  TCheckingHelper = class;
  TCheckingStub = class;
  TSavingsHelper = class;
  TSavingsStub = class;

  TCheckingHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Bank_i.Checking);
    class function  Extract(var _A: CORBA.Any) : Bank_i.Checking;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Bank_i.Checking;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Checking);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Bank_i.Checking;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Checking; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Checking; overload;
  end;

  TCheckingStub = class(CORBA.TCORBAObject, Bank_i.Checking)
  public
    function  balance : Single; virtual;
  end;

  TSavingsHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Bank_i.Savings);
    class function  Extract(var _A: CORBA.Any) : Bank_i.Savings;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Bank_i.Savings;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Savings);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Bank_i.Savings;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Savings; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Savings; overload;
  end;

  TSavingsStub = class(CORBA.TCORBAObject, Bank_i.Savings)
  public
    function  interest_rate : Single; virtual;
    function  balance : Single; virtual;
  end;


implementation

class procedure TCheckingHelper.Insert(var _A : CORBA.Any; const _Value : Bank_i.Checking);
begin
  _A := Orb.MakeObjectRef( TCheckingHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TCheckingHelper.Extract(var _A : CORBA.Any): Bank_i.Checking;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TCheckingHelper.Narrow(_obj, True);
end;

class function TCheckingHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Checking');
end;

class function TCheckingHelper.RepositoryId : string;
begin
  Result := 'IDL:Bank/Checking:1.0';
end;

class function TCheckingHelper.Read(const _Input : CORBA.InputStream) : Bank_i.Checking;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TCheckingHelper.Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Checking);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TCheckingHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Bank_i.Checking;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Bank_i.Checking, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TCheckingStub.Create(_Obj);
end;

class function TCheckingHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Checking;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TCheckingHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Checking;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TCheckingStub.balance : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

class procedure TSavingsHelper.Insert(var _A : CORBA.Any; const _Value : Bank_i.Savings);
begin
  _A := Orb.MakeObjectRef( TSavingsHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TSavingsHelper.Extract(var _A : CORBA.Any): Bank_i.Savings;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TSavingsHelper.Narrow(_obj, True);
end;

class function TSavingsHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Savings');
end;

class function TSavingsHelper.RepositoryId : string;
begin
  Result := 'IDL:Bank/Savings:1.0';
end;

class function TSavingsHelper.Read(const _Input : CORBA.InputStream) : Bank_i.Savings;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TSavingsHelper.Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Savings);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TSavingsHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Bank_i.Savings;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Bank_i.Savings, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TSavingsStub.Create(_Obj);
end;

class function TSavingsHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Savings;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TSavingsHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Savings;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TSavingsStub.interest_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('interest_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

function  TSavingsStub.balance : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.