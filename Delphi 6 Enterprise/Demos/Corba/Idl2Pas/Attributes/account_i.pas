unit account_i;

{This file was generated on 11 Aug 2000 20:01:05 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : account_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  Account = interface;

  Account = interface
    ['{13537AE1-AC0A-9B86-C599-B532459BC0E9}']
    function  _get_YearOpened : SmallInt;
    procedure _set_YearOpened (const YearOpened : SmallInt);
    function  _get_GotToaster : Boolean;
    function  balance : Single;
    property  YearOpened : SmallInt read _get_YearOpened write _set_YearOpened;
    property  GotToaster : Boolean read _get_GotToaster;
  end;


implementation


initialization


end.