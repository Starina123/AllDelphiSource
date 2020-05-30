unit Bank_i;

{This file was generated on 11 Aug 2000 20:11:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_i                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA;

type
  errStruct = interface;
  Account = interface;

  errStruct = interface
    ['{51C5AB89-24C5-143C-323E-5CFEBEF27D21}']
    function  _get_myInt : SmallInt;
    procedure _set_myInt (const myInt : SmallInt);
    function  _get_myStr : AnsiString;
    procedure _set_myStr (const myStr : AnsiString);
    property  myInt : SmallInt read _get_myInt write _set_myInt;
    property  myStr : AnsiString read _get_myStr write _set_myStr;
  end;

  Account = interface
    ['{838D242D-0A78-C1F6-EDEA-1E5B70BB4C8E}']
    function  balance : Single;
    procedure deposit (const value : Single);
    procedure withdrawl (const value : Single);
    procedure DoException ;
  end;


implementation


initialization


end.