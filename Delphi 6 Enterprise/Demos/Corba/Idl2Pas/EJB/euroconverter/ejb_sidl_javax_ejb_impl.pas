unit ejb_sidl_javax_ejb_impl;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_javax_ejb_impl                            }
{derived from IDL module : ejb                                                }



interface

uses
  SysUtils,
  CORBA,
  ejb_sidl_javax_ejb_i,
  ejb_sidl_javax_ejb_c;

type
  TEJBHome = class;
  TEJBObject = class;

  TEJBHome = class(TInterfacedObject, ejb_sidl_javax_ejb_i.EJBHome)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
    procedure remove ( const primaryKey : ANY);
    function  getSimplifiedIDL : AnsiString;
  end;

  TEJBObject = class(TInterfacedObject, ejb_sidl_javax_ejb_i.EJBObject)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
    function  getPrimaryKey : ANY;
    procedure remove ;
  end;


implementation

constructor TEJBHome.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEJBHome.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

procedure TEJBHome.remove ( const primaryKey : ANY);
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEJBHome.getSimplifiedIDL : AnsiString;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

constructor TEJBObject.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEJBObject.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEJBObject.getPrimaryKey : ANY;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

procedure TEJBObject.remove ;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;


initialization


end.