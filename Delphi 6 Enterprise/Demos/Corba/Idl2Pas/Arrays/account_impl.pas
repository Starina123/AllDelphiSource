unit account_impl;

{This file was generated on 27 Oct 2000 17:44:34 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Arrays\account.idl.                                     }

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
  public
    constructor Create;
    function  balance ( const myArray : account_i.ArrayType): Single;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
end;

function  TAccount.balance(const myArray : account_i.ArrayType): Single;
var
  j: Integer;
begin
  for j := 0 to 2 do
  begin
    Form1.Memo1.Lines.Add('myArray[' + IntToStr(j) + '] = ' + IntToStr(myArray[j]) );
  end;
  result := random * 100;
end;


initialization
  randomize;

end.