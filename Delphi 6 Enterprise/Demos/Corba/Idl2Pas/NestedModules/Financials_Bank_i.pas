unit Financials_Bank_i;

{This file was generated on 11 Aug 2000 20:14:44 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Financials_Bank_i                                  }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA;

type
  Account = interface;

  Account = interface
    ['{5812C5E8-1570-7C22-D19C-03D78F623A51}']
    function  balance : Single;
  end;


implementation


initialization


end.