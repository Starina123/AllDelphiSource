unit Bank_impl;

{This file was generated on 15 Jun 2000 15:40:10 GMT by version 03.03.03.C1.04}
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
    procedure deposit ( const value : Single);
    procedure withdrawl ( const value : Single);
    procedure DoException ;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 1000;
end;

function  TAccount.balance : Single;
begin
  Result := _balance;
  Form1.Memo1.Lines.Add('Got a balance call from the client...');
end;

procedure TAccount.deposit ( const value : Single);
begin
  _balance := _balance +  value;
end;

procedure TAccount.withdrawl ( const value : Single);
begin
  if (value > _balance) then
    raise EAccountOverRun.Create(_balance)
  else
    _balance := _balance - value;
end;

procedure TAccount.DoException;
var myFooStruct : errStruct;
begin
  myFooStruct := TerrStruct.Create(12345, 'This is the struct guy');
  raise EFoo.Create(myFooStruct);

  (* You can choose to raise the ThrowOne exception instead. You can't
     throw both at the same time *)
  //raise EThrowOne.Create('This is the Throw One Exception');
end;


initialization
  Randomize;

end.