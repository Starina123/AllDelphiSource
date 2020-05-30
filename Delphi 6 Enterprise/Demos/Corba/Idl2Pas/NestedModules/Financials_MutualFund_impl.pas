unit Financials_MutualFund_impl;

{This file was generated on 16 Jun 2000 17:07:51 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Financials_MutualFund_impl                         }
{derived from IDL module : MutualFund                                         }



interface

uses
  SysUtils,
  CORBA,
  Financials_MutualFund_i,
  Financials_MutualFund_c;

type
  TAsset = class;

  TAsset = class(TInterfacedObject, Financials_MutualFund_i.Asset)
  protected
    _nav : single;
  public
    constructor Create;
    function  nav : Single;
  end;


implementation

constructor TAsset.Create;
begin
  inherited;
  _nav := random * 10000;
end;

function  TAsset.nav : Single;
begin
  result := _nav;
end;


initialization
  randomize;

end.