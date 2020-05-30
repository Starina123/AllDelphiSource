unit account_i;

{This file was generated on 11 Aug 2000 20:15:27 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : account_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  Account = interface;

  IntSeq = array[0..4] of Cardinal;

  Account = interface
    ['{CCA93F75-76F2-5E04-F6AA-C8FBCFFD4784}']
    function  balance (const mySeq : account_i.IntSeq): Single;
  end;


implementation


initialization


end.