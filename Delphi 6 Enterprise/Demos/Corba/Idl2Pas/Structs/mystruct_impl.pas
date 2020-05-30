unit mystruct_impl;

{This file was generated on 16 Jun 2000 16:32:28 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file mystruct.idl.       }

{Delphi Pascal unit      : mystruct_impl                                      }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  mystruct_i,
  mystruct_c;

type
  TAccount = class;

  TAccount = class(TInterfacedObject, mystruct_i.Account)
  protected
    _balance : Single;
  public
    constructor Create;
    function  balance ( const inMyStruct : mystruct_i.MyStructType;
                        out   outMyStruct : mystruct_i.MyStructType;
                        var   inoutMyStruct : mystruct_i.MyStructType): Single;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
  _balance := Random * 1000;
end;

function  TAccount.balance ( const inMyStruct : mystruct_i.MyStructType;
                             out   outMyStruct : mystruct_i.MyStructType;
                             var   inoutMyStruct : mystruct_i.MyStructType): Single;
begin
  Result := _balance;
  with Form1 do
  begin
    Memo1.Lines.Add('Got a balance call from the client...');
    Memo1.Lines.Add('Struct1 =(' + IntToStr(inMyStruct.s) + ', ' + IntToStr(inMyStruct.l) + ', ' + inMyStruct.st + ')');
    Memo1.Lines.Add('Struct3 =(' + IntToStr(inoutMyStruct.s) + ', ' + IntToStr(inoutMyStruct.l) + ', ' + inoutMyStruct.st + ')');
    Memo1.Lines.Add('');

    Memo1.Lines.Add('Making Struct 2 = 5, 55, Hello from Server - Struct 2');
    outMyStruct := TMyStructType.Create(5, 55, 'Hello from Server - Struct 2');

    Memo1.Lines.Add('Making Struct 3 = 500, 550, Hello again from Server - Struct 3');
    inoutMyStruct.s := 500;
    inoutMyStruct.l := 550;
    inoutMyStruct.st := 'Hello again from Server - Struct 3';
  end;
end;


initialization
  Randomize;


end.