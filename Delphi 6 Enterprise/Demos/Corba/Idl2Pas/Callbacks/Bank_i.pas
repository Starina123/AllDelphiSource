unit Bank_i;

{This file was generated on 11 Aug 2000 20:02:21 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_i                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA;

type
  Rates = interface;
  Account = interface;

  Rates = interface
    ['{BDF1CB5A-E1F3-B6FA-A7B3-211046560AB2}']
    function  get_interest_rate : Single;
  end;

  Account = interface
    ['{144D6BBE-3CC5-7025-E499-450AFEFD8DCC}']
    function  balance : Single;
    function  get_rates (const myRates : Bank_i.Rates): Single;
  end;


implementation


initialization


end.