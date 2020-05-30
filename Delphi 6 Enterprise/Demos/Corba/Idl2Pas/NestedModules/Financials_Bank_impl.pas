unit Financials_Bank_impl;

{This file was generated on 16 Jun 2000 17:07:52 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Financials_Bank_impl                               }
{derived from IDL module : Bank                                               }



interface

uses
  SysUtils,
  CORBA,
  Financials_Bank_i,
  Financials_Bank_c;

type
  TAccount = class;

  TAccount = class(TInterfacedObject, Financials_Bank_i.Account)
  protected
    _balance : single;
  public
    constructor Create;
    function  balance : Single;
  end;


implementation

constructor TAccount.Create;
begin
  inherited;
  _balance := random * 10000;
end;

function  TAccount.balance : Single;
begin
  result := _balance;
end;


initialization
  randomize;

end.