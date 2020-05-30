unit employee_i;

{This file was generated on 11 Aug 2000 20:12:57 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file employee.idl.       }

{Delphi Pascal unit      : employee_i                                         }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  Employee = interface;

  Employee = interface
    ['{743D1C9A-4E84-0D9E-F460-969FE58E5437}']
    function  getEmployeesByName (const name : AnsiString): ANY;
    function  getEmployeesByNameXML (const name : AnsiString): AnsiString;
  end;


implementation


initialization


end.