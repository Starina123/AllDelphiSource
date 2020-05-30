unit Bank_impl;

{This file was generated on 19 Jun 2000 15:50:28 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_impl                                          }
{derived from IDL module : Bank                                               }



interface

uses
  SysUtils,
  CORBA,
  Bank_i,
  Bank_c;

type
  TRates = class;
  TAccount = class;

  TRates = class(TInterfacedObject, Bank_i.Rates)
  protected
    _interest_rate : single;
  public
    constructor Create;
    function  get_interest_rate : Single;
  end;

  TAccount = class(TInterfacedObject, Bank_i.Account)
  protected
    _balance : single;
  public
    constructor Create;
    function  balance : Single;
    function  get_rates(const myRates : Bank_i.Rates): Single;
  end;


implementation

constructor TRates.Create;
begin
  inherited;
  _interest_rate := random * 10;
end;

function  TRates.get_interest_rate : Single;
begin
  result := _interest_rate;
end;

constructor TAccount.Create;
begin
  inherited;
  _balance := random * 10000;
end;

function  TAccount.balance : Single;
begin
  result := _balance;
end;

function  TAccount.get_rates ( const myRates : Bank_i.Rates): Single;
begin
  result := myRates.get_interest_rate;
end;


initialization

  randomize;

end.