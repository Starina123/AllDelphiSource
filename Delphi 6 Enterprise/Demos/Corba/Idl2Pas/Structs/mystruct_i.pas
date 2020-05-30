unit mystruct_i;

{This file was generated on 11 Aug 2000 20:16:58 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file mystruct.idl.       }

{Delphi Pascal unit      : mystruct_i                                         }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  MyStructType = interface;
  Account = interface;

  MyStructType = interface
    ['{44AD6CE9-72D0-7AAA-C89D-F121E29DEC57}']
    function  _get_s : SmallInt;
    procedure _set_s (const s : SmallInt);
    function  _get_l : Integer;
    procedure _set_l (const l : Integer);
    function  _get_st : AnsiString;
    procedure _set_st (const st : AnsiString);
    property  s : SmallInt read _get_s write _set_s;
    property  l : Integer read _get_l write _set_l;
    property  st : AnsiString read _get_st write _set_st;
  end;

  Account = interface
    ['{047D6870-94B0-BEB9-3CBD-817BBAC35C65}']
    function  balance (const inMyStruct : mystruct_i.MyStructType;
                       out   outMyStruct : mystruct_i.MyStructType;
                       var   inoutMyStruct : mystruct_i.MyStructType): Single;
  end;


implementation


initialization


end.