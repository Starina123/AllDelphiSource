unit Bank_i;

{This file was generated on 11 Aug 2000 20:05:00 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_i                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA;

type
  Account = interface;

  Account = interface
    ['{C0319DB9-7E87-7106-5298-57866F358F70}']
    function  balance : Single;
  end;


implementation


initialization


end.