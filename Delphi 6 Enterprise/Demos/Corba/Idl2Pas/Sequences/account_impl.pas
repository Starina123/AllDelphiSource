unit account_impl;

{This file was generated on 13 Jun 2000 21:12:13 GMT by version 03.03.03.C1.04}
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
    function  balance ( const mySeq : account_i.IntSeq): Single;
  end;

implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 1000;
end;

function  TAccount.balance ( const mySeq : account_i.IntSeq): Single;
var k : integer;
begin
  Result := _balance;
  //display the sequence that comes over the wire
  for k := 0 to High(mySeq) do
    Form1.Memo1.Lines.Add('mySeq[' + IntToStr(k) + '] = ' + IntToStr(mySeq[k]));
end;

initialization
  Randomize;

end.
