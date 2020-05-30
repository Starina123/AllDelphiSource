unit Broker_i;

{This file was generated on 11 Aug 2000 20:13:59 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file broker.idl.         }

{Delphi Pascal unit      : Broker_i                                           }
{derived from IDL module : Broker                                             }



interface

uses
  CORBA;

type
  MoneyMarket = interface;
  MarginAccount = interface;
  InvestmentAccount = interface;

  MoneyMarket = interface
    ['{C677419D-9DA0-B2E8-BED7-21BC2CB8F8BC}']
    function  interest_rate : Single;
  end;

  MarginAccount = interface
    ['{659248C1-EF08-383F-66E2-9340D85358F8}']
    function  margin_rate : Single;
  end;

  InvestmentAccount = interface (Broker_i.MoneyMarket)
    ['{190521A5-DCC6-F256-5698-7A09F583CD1D}']
    function  balance : Single;
    function  margin_rate : Single;
  end;


implementation


initialization


end.