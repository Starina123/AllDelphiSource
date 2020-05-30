unit Broker_impl;

{This file was generated on 16 Jun 2000 16:15:16 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file broker.idl.         }

{Delphi Pascal unit      : Broker_impl                                        }
{derived from IDL module : Broker                                             }



interface

uses
  SysUtils,
  CORBA,
  Broker_i,
  Broker_c;

type
  TMoneyMarket = class;
  TMarginAccount = class;
  TInvestmentAccount = class;

  TMoneyMarket = class(TInterfacedObject, Broker_i.MoneyMarket)
  protected
    _interest_rate : Single;
  public
    constructor Create;
    function  interest_rate : Single;
  end;

  TMarginAccount = class(TInterfacedObject, Broker_i.MarginAccount)
  protected
    _margin_rate : Single;
  public
    constructor Create;
    function  margin_rate : Single;
  end;

  TInvestmentAccount = class(Broker_impl.TMoneyMarket, Broker_i.MarginAccount, Broker_i.InvestmentAccount)
  protected
    _margin_rate : Single;
    _balance : Single;
  public
    constructor Create;
    function  balance : Single;
    function  margin_rate : Single;
    function  interest_rate : Single;
  end;


implementation

uses ServerMain;


constructor TMoneyMarket.Create;
begin
  inherited;
  _interest_rate := 7.00;
end;

function  TMoneyMarket.interest_rate : Single;
begin
  Result := _interest_rate;
  Form1.Memo1.Lines.Add('Got a Money Market Interest Rate request');
end;

constructor TMarginAccount.Create;
begin
  inherited;
  _margin_rate := 9.00;
end;

function  TMarginAccount.margin_rate : Single;
begin
  result := _margin_rate;
end;

constructor TInvestmentAccount.Create;
begin
  inherited;
  _margin_rate := Random * 10;
  _balance := Random * 10000;
  _interest_rate := 15.00;
end;

function  TInvestmentAccount.balance : Single;
begin
  Result := _balance;
  Form1.Memo1.Lines.Add('Got a Margin Account Balance request');
end;

function  TInvestmentAccount.margin_rate : Single;
begin
  Result := _margin_rate;
  Form1.Memo1.Lines.Add('Got a Margin Account Margin Rate request');
end;

function  TInvestmentAccount.interest_rate : Single;
begin
  result := _interest_rate;
end;


initialization
  Randomize;
end.
