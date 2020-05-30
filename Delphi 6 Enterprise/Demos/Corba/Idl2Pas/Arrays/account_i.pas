unit account_i;

{This file was generated on 27 Oct 2000 17:52:20 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Arrays\account.idl.                                     }

{Delphi Pascal unit      : account_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  Account = interface;

  ArrayType = array[0..2] of SmallInt;

  Account = interface
    ['{E7212AF9-E924-C196-5091-3A5C29275F4B}']
    function  balance (const myArray : account_i.ArrayType): Single;
  end;


implementation


initialization


end.