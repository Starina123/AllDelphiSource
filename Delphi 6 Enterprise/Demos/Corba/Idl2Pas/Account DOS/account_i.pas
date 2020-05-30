unit account_i;

{This file was generated on 11 Aug 2000 19:55:07 GMT by version 03.03.03.C1.06}
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
    ['{83526766-66BD-BD4A-33E4-B591163925A8}']
    function  balance : Single;
  end;


implementation


initialization


end.