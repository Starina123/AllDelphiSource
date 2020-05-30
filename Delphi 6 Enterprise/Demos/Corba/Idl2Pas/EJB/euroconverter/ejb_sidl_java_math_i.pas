unit ejb_sidl_java_math_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_math_i                               }
{derived from IDL module : math                                               }



interface

uses
  CORBA;

type
  BigDecimal = interface;

  BigDecimal = interface
    ['{11E24B67-78CB-B652-71E6-2C3024EBD704}']
    function  _get_value : AnsiString;
    procedure _set_value (const value : AnsiString);
    property  value : AnsiString read _get_value write _set_value;
  end;


implementation


initialization


end.