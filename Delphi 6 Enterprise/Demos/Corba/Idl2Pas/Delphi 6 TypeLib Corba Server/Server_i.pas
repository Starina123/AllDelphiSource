unit Server_i;

{This file was generated on 11 Aug 2000 20:06:56 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file server.idl.         }

{Delphi Pascal unit      : Server_i                                           }
{derived from IDL module : Server                                             }



interface

uses
  CORBA;

type
  IMyTest = interface;
  MyTestFactory = interface;

  IMyTest = interface
    ['{22DEF4B3-44A1-84CA-3525-8C65DDCD4DF1}']
    function  Get_X : Integer;
  end;

  MyTestFactory = interface
    ['{DF4CB059-0ACA-EACB-4D6C-98E391B0E46C}']
    function  CreateInstance (const InstanceName : AnsiString): Server_i.IMyTest;
  end;


implementation


initialization


end.