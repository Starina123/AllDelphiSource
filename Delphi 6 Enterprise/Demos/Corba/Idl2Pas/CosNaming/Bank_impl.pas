unit Bank_impl;

{This file was generated on 8 May 2000 16:19:22 GMT by version 03.03.03.C1.01 }
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
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  balance : Single;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TAccount.balance : Single;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
  Result := StrToFloat(Form1.Edit1.Text);
end;


initialization


end.