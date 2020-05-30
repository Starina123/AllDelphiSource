unit AnyTest_i;

{This file was generated on 27 Oct 2000 17:40:35 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Any\AnyTest.idl.                                        }

{Delphi Pascal unit      : AnyTest_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  MyTest = interface;

  MyTest = interface
    ['{211D9695-09AD-50E0-EE2B-2CE22F9F98A2}']
    function  GetAny : ANY;
  end;


implementation


initialization


end.