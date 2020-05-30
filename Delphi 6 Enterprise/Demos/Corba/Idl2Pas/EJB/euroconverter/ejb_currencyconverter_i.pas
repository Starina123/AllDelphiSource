unit ejb_currencyconverter_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file ejb.idl.            }

{Delphi Pascal unit      : ejb_currencyconverter_i                            }
{derived from IDL module : currencyconverter                                  }



interface

uses
  CORBA,
  ejb_sidl_javax_ejb_i;

type
  EuroConverter = interface;
  EuroConverterHome = interface;

  EuroConverter = interface (ejb_sidl_javax_ejb_i.EJBObject)
    ['{28892D7D-B00A-EE49-99C8-AF8A54F19DB4}']
    function  hfl2float (const arg0 : Single): Single;
  end;

  EuroConverterHome = interface (ejb_sidl_javax_ejb_i.EJBHome)
    ['{50A3B840-C5EB-A464-A63B-4DB042C28427}']
    function  _create : ejb_currencyconverter_i.EuroConverter;
  end;


implementation


initialization


end.