unit ejb_sidl_java_lang_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_lang_i                               }
{derived from IDL module : lang                                               }



interface

uses
  CORBA;

type
  _Class = interface;

  _Class = interface
    ['{3A4CD408-C891-093E-3CCE-C9D4875D9C7D}']
    function  _get_idlName : AnsiString;
    procedure _set_idlName (const idlName : AnsiString);
    function  _get_javaName : AnsiString;
    procedure _set_javaName (const javaName : AnsiString);
    property  idlName : AnsiString read _get_idlName write _set_idlName;
    property  javaName : AnsiString read _get_javaName write _set_javaName;
  end;


implementation


initialization


end.