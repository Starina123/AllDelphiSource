unit myunion_i;

{This file was generated on 11 Aug 2000 20:17:46 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file myunion.idl.        }

{Delphi Pascal unit      : myunion_i                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA;

type
  UnionType = interface;
  Account = interface;

  Identifier = AnsiString;

  UnionType = interface
    ['{2FE5872E-1C9A-37F7-3DBA-916C835D1ACE}']
    function  _get_s : SmallInt;
    procedure _set_s (const s : SmallInt);
    function  _get_l : Integer;
    procedure _set_l (const l : Integer);
    function  _get_i : myunion_i.Identifier;
    procedure _set_i (const i : myunion_i.Identifier);
    function  _get_discriminator : Integer;
    property  s : SmallInt read _get_s write _set_s;
    property  l : Integer read _get_l write _set_l;
    property  i : myunion_i.Identifier read _get_i write _set_i;
    property  _discriminator : Integer read _get_discriminator;
  end;

  Account = interface
    ['{B16D9ECC-EE1D-CC10-D6DE-ABDD00226814}']
    function  balance (const myUnion : myunion_i.UnionType): Single;
  end;


implementation


initialization


end.