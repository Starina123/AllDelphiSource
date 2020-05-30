unit account_impl;

{This file was generated on 27 Oct 2000 17:19:58 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\ACCOUN~1\account.idl.                                   }

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
    {******************************}
    {*** User variables go here ***}
    {******************************}
    _balance : Single;
  public
    constructor Create;
    function  balance : Single;
  end;


implementation

constructor TAccount.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
  _balance := random * 10000;
end;

function  TAccount.balance : Single;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
  result := _balance;
end;


initialization
  randomize;

end.