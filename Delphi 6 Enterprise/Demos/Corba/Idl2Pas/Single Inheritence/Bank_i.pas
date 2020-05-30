unit Bank_i;

{This file was generated on 11 Aug 2000 20:16:15 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_i                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA;

type
  Checking = interface;
  Savings = interface;

  Checking = interface
    ['{B9E5CF0A-731B-8C61-1D29-FB839B2A77EC}']
    function  balance : Single;
  end;

  Savings = interface (Bank_i.Checking)
    ['{7248AA90-3C6D-CA58-E781-D22941988DD1}']
    function  interest_rate : Single;
  end;


implementation


initialization


end.