unit ejb_sidl_java_sql_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_sql_i                                }
{derived from IDL module : sql                                                }



interface

uses
  CORBA;

type
  Date = interface;
  Time = interface;
  Timestamp = interface;

  Date = interface
    ['{53B882A9-254B-D3A0-24D9-CB4366F297C9}']
    function  _get_time : Int64;
    procedure _set_time (const time : Int64);
    property  time : Int64 read _get_time write _set_time;
  end;

  Time = interface
    ['{4A689788-18FF-E321-505B-E04A1709A35D}']
    function  _get_time1 : Int64;
    procedure _set_time1 (const time1 : Int64);
    property  time1 : Int64 read _get_time1 write _set_time1;
  end;

  Timestamp = interface
    ['{8CFA614B-6EFD-2A09-1098-B5E900C94E41}']
    function  _get_time : Int64;
    procedure _set_time (const time : Int64);
    property  time : Int64 read _get_time write _set_time;
  end;


implementation


initialization


end.