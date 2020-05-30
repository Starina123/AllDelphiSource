unit Broker_c;

{This file was generated on 11 Aug 2000 20:13:59 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file broker.idl.         }

{Delphi Pascal unit      : Broker_c                                           }
{derived from IDL module : Broker                                             }



interface

uses
  CORBA,
  Broker_i;

type
  TMoneyMarketHelper = class;
  TMoneyMarketStub = class;
  TMarginAccountHelper = class;
  TMarginAccountStub = class;
  TInvestmentAccountHelper = class;
  TInvestmentAccountStub = class;

  TMoneyMarketHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Broker_i.MoneyMarket);
    class function  Extract(var _A: CORBA.Any) : Broker_i.MoneyMarket;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Broker_i.MoneyMarket;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.MoneyMarket);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Broker_i.MoneyMarket;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Broker_i.MoneyMarket; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Broker_i.MoneyMarket; overload;
  end;

  TMoneyMarketStub = class(CORBA.TCORBAObject, Broker_i.MoneyMarket)
  public
    function  interest_rate : Single; virtual;
  end;

  TMarginAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Broker_i.MarginAccount);
    class function  Extract(var _A: CORBA.Any) : Broker_i.MarginAccount;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Broker_i.MarginAccount;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.MarginAccount);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Broker_i.MarginAccount;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Broker_i.MarginAccount; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Broker_i.MarginAccount; overload;
  end;

  TMarginAccountStub = class(CORBA.TCORBAObject, Broker_i.MarginAccount)
  public
    function  margin_rate : Single; virtual;
  end;

  TInvestmentAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Broker_i.InvestmentAccount);
    class function  Extract(var _A: CORBA.Any) : Broker_i.InvestmentAccount;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Broker_i.InvestmentAccount;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.InvestmentAccount);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Broker_i.InvestmentAccount;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Broker_i.InvestmentAccount; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Broker_i.InvestmentAccount; overload;
  end;

  TInvestmentAccountStub = class(Broker_c.TMoneyMarketStub, Broker_i.MarginAccount, Broker_i.InvestmentAccount)
  public
    function  balance : Single; virtual;
    function  margin_rate : Single; virtual;
    function  interest_rate : Single; virtual;
  end;


implementation

class procedure TMoneyMarketHelper.Insert(var _A : CORBA.Any; const _Value : Broker_i.MoneyMarket);
begin
  _A := Orb.MakeObjectRef( TMoneyMarketHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TMoneyMarketHelper.Extract(var _A : CORBA.Any): Broker_i.MoneyMarket;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TMoneyMarketHelper.Narrow(_obj, True);
end;

class function TMoneyMarketHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'MoneyMarket');
end;

class function TMoneyMarketHelper.RepositoryId : string;
begin
  Result := 'IDL:Broker/MoneyMarket:1.0';
end;

class function TMoneyMarketHelper.Read(const _Input : CORBA.InputStream) : Broker_i.MoneyMarket;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TMoneyMarketHelper.Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.MoneyMarket);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TMoneyMarketHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Broker_i.MoneyMarket;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Broker_i.MoneyMarket, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TMoneyMarketStub.Create(_Obj);
end;

class function TMoneyMarketHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Broker_i.MoneyMarket;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TMoneyMarketHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Broker_i.MoneyMarket;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TMoneyMarketStub.interest_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('interest_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

class procedure TMarginAccountHelper.Insert(var _A : CORBA.Any; const _Value : Broker_i.MarginAccount);
begin
  _A := Orb.MakeObjectRef( TMarginAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TMarginAccountHelper.Extract(var _A : CORBA.Any): Broker_i.MarginAccount;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TMarginAccountHelper.Narrow(_obj, True);
end;

class function TMarginAccountHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'MarginAccount');
end;

class function TMarginAccountHelper.RepositoryId : string;
begin
  Result := 'IDL:Broker/MarginAccount:1.0';
end;

class function TMarginAccountHelper.Read(const _Input : CORBA.InputStream) : Broker_i.MarginAccount;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TMarginAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.MarginAccount);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TMarginAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Broker_i.MarginAccount;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Broker_i.MarginAccount, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TMarginAccountStub.Create(_Obj);
end;

class function TMarginAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Broker_i.MarginAccount;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TMarginAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Broker_i.MarginAccount;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TMarginAccountStub.margin_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('margin_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

class procedure TInvestmentAccountHelper.Insert(var _A : CORBA.Any; const _Value : Broker_i.InvestmentAccount);
begin
  _A := Orb.MakeObjectRef( TInvestmentAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TInvestmentAccountHelper.Extract(var _A : CORBA.Any): Broker_i.InvestmentAccount;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TInvestmentAccountHelper.Narrow(_obj, True);
end;

class function TInvestmentAccountHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'InvestmentAccount');
end;

class function TInvestmentAccountHelper.RepositoryId : string;
begin
  Result := 'IDL:Broker/InvestmentAccount:1.0';
end;

class function TInvestmentAccountHelper.Read(const _Input : CORBA.InputStream) : Broker_i.InvestmentAccount;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TInvestmentAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : Broker_i.InvestmentAccount);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TInvestmentAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Broker_i.InvestmentAccount;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Broker_i.InvestmentAccount, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TInvestmentAccountStub.Create(_Obj);
end;

class function TInvestmentAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Broker_i.InvestmentAccount;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TInvestmentAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Broker_i.InvestmentAccount;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TInvestmentAccountStub.balance : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

function  TInvestmentAccountStub.margin_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('margin_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

function  TInvestmentAccountStub.interest_rate : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('interest_rate',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.