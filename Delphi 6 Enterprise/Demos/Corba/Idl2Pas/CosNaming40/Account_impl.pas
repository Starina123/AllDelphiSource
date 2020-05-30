unit Account_impl;

{This file was generated on 5 Apr 2001 12:47:25 GMT by version 03.03.03.C1.A1 }
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\CO86DA~1\Account.idl.                                                     }

{Delphi Pascal unit      : Account_impl                                       }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  Account_i,
  Account_c;

type
  TAccount = class;

  TAccount = class(TInterfacedObject, Account_i.Account)
  protected
    _balance : Single;
  public
    constructor Create;
    function  balance : Single;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := random(10000);
  Form1.Memo1.Lines.Add('Object is ready...');
  Form1.Memo1.Lines.Add(FormatFloat('Balance = $##,##0.00', _balance));
end;

function  TAccount.balance : Single;
begin
  result := _balance;
  Form1.Memo1.Lines.Add('Got a balance request');
end;


initialization
  randomize;

end.