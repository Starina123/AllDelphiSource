unit myunion_impl;

{This file was generated on 16 Jun 2000 16:37:51 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file myunion.idl.        }

{Delphi Pascal unit      : myunion_impl                                       }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  myunion_i,
  myunion_c;

type
  TAccount = class;

  TAccount = class(TInterfacedObject, myunion_i.Account)
  protected
    _balance : Single;
  public
    constructor Create;
    function  balance ( const myUnion : myunion_i.UnionType): Single;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 1000;
end;

function  TAccount.balance ( const myUnion : myunion_i.UnionType): Single;
var st : String;
    disc : Integer;
begin
  Result := _balance;
  with Form1 do
  begin
    Memo1.Lines.Add('Got a balance call from the client...');
    disc := myUnion._discriminator;
    case disc of
      -1 :  st := 'discriminator = -1 -- union value = ' + IntToStr(myUnion.s);
       0 :  st := 'discriminator = 0 -- union value = ' + IntToStr(myUnion.l);
       1 :  st := 'discriminator = 1 -- union value = ' + myUnion.i;
    end;
    Memo1.Lines.Add(st);
  end;
end;


initialization
   Randomize;
end.
