unit Bank_impl;

{This file was generated on 16 Jun 2000 14:17:31 GMT by version 03.03.03.C1.04}
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
  TChecking = class;
  TSavings = class;

  TChecking = class(TInterfacedObject, Bank_i.Checking)
  public
    constructor Create;
    function  balance : Single;
  end;

  TSavings = class(TInterfacedObject, Bank_i.Savings)
  public
    constructor Create;
    function  interest_rate : Single;
    function  balance : Single;
  end;


implementation

uses ServerMain;

{TChecking Implementation}

constructor TChecking.Create;
begin
  inherited;
end;

function  TChecking.balance : Single;
begin
  Result := StrToFloat(Form1.Edit1.Text);
end;

{TSavings Implementation}

constructor TSavings.Create;
begin
  inherited;
end;

function  TSavings.interest_rate : Single;
begin
  Result := StrToFloat(Form1.Edit3.Text);
end;

function  TSavings.balance : Single;
begin
  Result := StrToFloat(Form1.Edit2.Text);
end;

initialization

end.