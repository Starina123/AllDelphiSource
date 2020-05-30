unit Bank_c;

{This file was generated on 11 Aug 2000 20:02:21 GMT by version 03.03.03.C1.06}
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
  TRatesHelper = class;
  TRatesStub = class;
  TAccountHelper = class;
  TAccountStub = class;

  TRatesHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Bank_i.Rates);
    class function  Extract(var _A: CORBA.Any) : Bank_i.Rates;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Bank_i.Rates;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Rates);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Bank_i.Rates;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Rates; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Rates; overload;
  end;

  TRatesStub = class(CORBA.TCORBAObject, Bank_i.Rates)
  public
    function  get_interest_rate : Single; virtual;
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
    function  get_rates ( const myRates : Bank_i.Rates): Single; virtual;
  end;


implementation

class procedure TRatesHelper.Insert(var _A : CORBA.Any; const _Value : Bank_i.Rates);
begin
  _A := Orb.MakeObjectRef( TRatesHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TRatesHelper.Extract(var _A : CORBA.Any): Bank_i.Rates;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TRatesHelper.Narrow(_obj, True);
end;

class function TRatesHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Rates');
end;

class function TRatesHelper.RepositoryId : string;
begin
  Result := 'IDL:Bank/Rates:1.0';
end;

class function TRatesHelper.Read(const _Input : CORBA.InputStream) : Bank_i.Rates;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TRatesHelper.Write(const _Output : CORBA.OutputStream; const _Value : Bank_i.Rates);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TRatesHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Bank_i.Rates;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Bank_i.Rates, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TRatesStub.Create(_Obj);
end;

class function TRatesHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Bank_i.Rates;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TRatesHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Bank_i.Rates;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TRatesStub.get_interest_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('get_interest_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
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

function  TAccountStub.get_rates ( const myRates : Bank_i.Rates): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('get_rates',True, _Output);
  Bank_c.TRatesHelper.Write(_Output, myRates);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.