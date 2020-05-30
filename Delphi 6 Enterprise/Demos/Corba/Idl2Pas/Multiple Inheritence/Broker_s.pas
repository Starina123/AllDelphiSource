unit Broker_s;

{This file was generated on 11 Aug 2000 20:13:59 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file broker.idl.         }

{Delphi Pascal unit      : Broker_s                                           }
{derived from IDL module : Broker                                             }



interface

uses
  CORBA,
  Broker_i,
  Broker_c;

type
  TMoneyMarketSkeleton = class;
  TMarginAccountSkeleton = class;
  TInvestmentAccountSkeleton = class;

  TMoneyMarketSkeleton = class(CORBA.TCorbaObject, Broker_i.MoneyMarket)
  private
    FImplementation : MoneyMarket;
  public
    constructor Create(const InstanceName: string; const Impl: MoneyMarket);
    destructor Destroy; override;
    function GetImplementation : MoneyMarket;
    function  interest_rate : Single;
  published
    procedure _interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TMarginAccountSkeleton = class(CORBA.TCorbaObject, Broker_i.MarginAccount)
  private
    FImplementation : MarginAccount;
  public
    constructor Create(const InstanceName: string; const Impl: MarginAccount);
    destructor Destroy; override;
    function GetImplementation : MarginAccount;
    function  margin_rate : Single;
  published
    procedure _margin_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TInvestmentAccountSkeleton = class(Broker_s.TMoneyMarketSkeleton, Broker_i.InvestmentAccount)
  private
    FImplementation : InvestmentAccount;
  public
    constructor Create(const InstanceName: string; const Impl: InvestmentAccount);
    destructor Destroy; override;
    function GetImplementation : InvestmentAccount;
    function  balance : Single;
    function  interest_rate : Single;
    function  margin_rate : Single;
  published
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _margin_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TMoneyMarketSkeleton.Create(const InstanceName : string; const Impl : Broker_i.MoneyMarket);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'MoneyMarket', 'IDL:Broker/MoneyMarket:1.0');
  FImplementation := Impl;
end;

destructor TMoneyMarketSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TMoneyMarketSkeleton.GetImplementation : Broker_i.MoneyMarket;
begin
  result := FImplementation as Broker_i.MoneyMarket;
end;

function  TMoneyMarketSkeleton.interest_rate : Single;
begin
  Result := FImplementation.interest_rate;
end;

procedure TMoneyMarketSkeleton._interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := interest_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

constructor TMarginAccountSkeleton.Create(const InstanceName : string; const Impl : Broker_i.MarginAccount);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'MarginAccount', 'IDL:Broker/MarginAccount:1.0');
  FImplementation := Impl;
end;

destructor TMarginAccountSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TMarginAccountSkeleton.GetImplementation : Broker_i.MarginAccount;
begin
  result := FImplementation as Broker_i.MarginAccount;
end;

function  TMarginAccountSkeleton.margin_rate : Single;
begin
  Result := FImplementation.margin_rate;
end;

procedure TMarginAccountSkeleton._margin_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := margin_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

constructor TInvestmentAccountSkeleton.Create(const InstanceName : string; const Impl : Broker_i.InvestmentAccount);
begin
  inherited CreateSkeleton(InstanceName, 'InvestmentAccount', 'IDL:Broker/InvestmentAccount:1.0');
  FImplementation := Impl;
end;

destructor TInvestmentAccountSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TInvestmentAccountSkeleton.GetImplementation : Broker_i.InvestmentAccount;
begin
  result := FImplementation as Broker_i.InvestmentAccount;
end;

function  TInvestmentAccountSkeleton.balance : Single;
begin
  Result := FImplementation.balance;
end;

function  TInvestmentAccountSkeleton.interest_rate : Single;
begin
  Result := FImplementation.interest_rate;
end;

function  TInvestmentAccountSkeleton.margin_rate : Single;
begin
  Result := FImplementation.margin_rate;
end;

procedure TInvestmentAccountSkeleton._balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := balance;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

procedure TInvestmentAccountSkeleton._interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := interest_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

procedure TInvestmentAccountSkeleton._margin_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := margin_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;


initialization


end.