unit ejb_sidl_java_util_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_util_i                               }
{derived from IDL module : util                                               }



interface

uses
  CORBA;

type
  Date = interface;

  Collection = array of ANY;

  Enumeration = array of ANY;

  List = array of ANY;

  Vector = array of ANY;

  Date = interface
    ['{5B7A7F78-F706-EF28-926D-26477D27E47E}']
    function  _get_time : Int64;
    procedure _set_time (const time : Int64);
    property  time : Int64 read _get_time write _set_time;
  end;


implementation


initialization


end.