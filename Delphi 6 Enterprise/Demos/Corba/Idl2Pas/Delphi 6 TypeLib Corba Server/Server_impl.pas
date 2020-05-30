unit Server_impl;

{This file was generated on 16 Jun 2000 17:01:40 GMT by version 03.03.03.C1.04}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file server.idl.         }

{Delphi Pascal unit      : Server_impl                                        }
{derived from IDL module : Server                                             }



interface

uses
  SysUtils,
  CORBA,
  Server_i,
  Server_c;

type
  TIMyTest = class;
  TMyTestFactory = class;

  TIMyTest = class(TInterfacedObject, Server_i.IMyTest)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  Get_X : Integer;
  end;

  TMyTestFactory = class(TInterfacedObject, Server_i.MyTestFactory)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest;
  end;


implementation

constructor TIMyTest.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TIMyTest.Get_X : Integer;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

constructor TMyTestFactory.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TMyTestFactory.CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;


initialization


end.