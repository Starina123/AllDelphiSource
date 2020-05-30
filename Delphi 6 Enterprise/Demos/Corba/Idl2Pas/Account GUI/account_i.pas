unit account_i;

{This file was generated on 27 Oct 2000 17:23:24 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\ACCOUN~1\account.idl.                                   }

{Delphi Pascal unit      : account_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  Account = interface;

  Account = interface
    ['{83526766-66BD-BD4A-33E4-B591163925A8}']
    function  balance : Single;
  end;


implementation


initialization


end.