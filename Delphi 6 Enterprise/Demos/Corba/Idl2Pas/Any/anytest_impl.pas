unit anytest_impl;

{This file was generated on 11 Aug 2000 21:11:29 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file anytest.idl.        }

{Delphi Pascal unit      : anytest_impl                                       }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  anytest_i,
  anytest_c;

type
  TMyTest = class;

  TMyTest = class(TInterfacedObject, anytest_i.MyTest)
  public
    constructor Create;
    function  GetAny : ANY;
  end;


implementation
uses ServerMain;

constructor TMyTest.Create;
begin
  inherited;
end;

function  TMyTest.GetAny : ANY;
begin
  Result := StrToInt(Form1.Edit1.Text);
end;


initialization


end.