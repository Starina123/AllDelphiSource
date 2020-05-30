unit Bank_impl;

{This file was generated on 10 Jun 2000 11:31:17 GMT by version 03.03.03.C1.04}
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
  TAccount = class;

  TAccount = class(TInterfacedObject, Bank_i.Account)
  protected
    _balance : Single;
  public
    constructor Create;
    function  balance : Single;
    function  get_rates(const myRates : Bank_i.Rates): Single;
  end;

implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 10000;
end;

function  TAccount.balance : Single;
begin
  Result := _balance;
  Form1.Memo1.Lines.Add('Got a balance call from the client...');
end;

function  TAccount.get_rates(const myRates : Bank_i.Rates): Single;
begin
  result := myRates.get_interest_rate;

  Form1.Memo1.Lines.Add('Interest Rate from Rates arg call = ' +
    FormatFloat('##0.00%', result));
end;


initialization
  randomize;

end.