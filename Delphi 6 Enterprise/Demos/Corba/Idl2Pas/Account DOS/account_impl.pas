unit account_impl;

{This file was generated on 15 Jun 2000 15:10:50 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : account_impl                                       }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  account_i,
  account_c;

type
  TAccount = class;

  TAccount = class(TInterfacedObject, account_i.Account)
  protected
    _balance : Single;
  public
    constructor Create;
    function balance : Single;
  end;


implementation

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 10000;
end;

function  TAccount.balance : Single;
begin
  Result := _balance;
  writeln('Got a balance call from a client...');
end;


initialization
  randomize;

end.