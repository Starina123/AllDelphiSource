unit account_impl;

{This file was generated on 15 Jun 2000 20:42:11 GMT by version 03.03.03.C1.04}
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
    _YearOpened : SmallInt;
    _GotToaster : Boolean;
    function  _get_YearOpened : SmallInt;
    procedure _set_YearOpened (const YearOpened : SmallInt);
    function  _get_GotToaster : Boolean;
  public
    constructor Create;
    function  balance : Single;
    property  YearOpened : SmallInt read _get_YearOpened write _set_YearOpened;
    property  GotToaster : Boolean read _get_GotToaster;
  end;


implementation

uses ServerMain;

constructor TAccount.Create;
begin
  inherited;
    _balance := Random * 1000;
    _YearOpened := 1995;
    _GotToaster := True;
end;


function  TAccount._get_YearOpened : SmallInt;
begin
  Result := _YearOpened;
end;

procedure TAccount._set_YearOpened ( const YearOpened : SmallInt);
begin
  _YearOpened := YearOpened;
end;

function  TAccount._get_GotToaster : Boolean;
begin
  Result := _GotToaster;
end;

function  TAccount.balance : Single;
begin
  Result := _balance;
  Form1.Memo1.Lines.Add('Got a balance call from the client...');
end;

initialization
  Randomize;

end.