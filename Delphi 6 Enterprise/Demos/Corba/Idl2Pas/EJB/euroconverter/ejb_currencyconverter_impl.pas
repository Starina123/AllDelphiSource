unit ejb_currencyconverter_impl;

{This file was generated on 28 Feb 2001 10:06:56 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file ejb.idl.            }

{Delphi Pascal unit      : ejb_currencyconverter_impl                         }
{derived from IDL module : currencyconverter                                  }



interface

uses
  SysUtils,
  CORBA,
  ejb_currencyconverter_i,
  ejb_currencyconverter_c;

type
  TEuroConverter = class;
  TEuroConverterHome = class;

  TEuroConverter = class(TInterfacedObject, ejb_currencyconverter_i.EuroConverter)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  hfl2float ( const arg0 : Single): Single;
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
    function  getPrimaryKey : ANY;
    procedure remove ;
  end;

  TEuroConverterHome = class(TInterfacedObject, ejb_currencyconverter_i.EuroConverterHome)
  protected
    {******************************}
    {*** User variables go here ***}
    {******************************}
  public
    constructor Create;
    function  _create : ejb_currencyconverter_i.EuroConverter;
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
    procedure remove ( const primaryKey : ANY);
    function  getSimplifiedIDL : AnsiString;
  end;


implementation

constructor TEuroConverter.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverter.hfl2float ( const arg0 : Single): Single;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverter.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverter.getPrimaryKey : ANY;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

procedure TEuroConverter.remove ;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

constructor TEuroConverterHome.Create;
begin
  inherited;
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverterHome._create : ejb_currencyconverter_i.EuroConverter;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverterHome.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

procedure TEuroConverterHome.remove ( const primaryKey : ANY);
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

function  TEuroConverterHome.getSimplifiedIDL : AnsiString;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;


initialization


end.