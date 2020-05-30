unit ejb_currencyconverter_s;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file ejb.idl.            }

{Delphi Pascal unit      : ejb_currencyconverter_s                            }
{derived from IDL module : currencyconverter                                  }



interface

uses
  CORBA,
  ejb_currencyconverter_i,
  ejb_currencyconverter_c;

type
  TEuroConverterSkeleton = class;
  TEuroConverterHomeSkeleton = class;

  TEuroConverterSkeleton = class(CORBA.TCorbaObject, ejb_currencyconverter_i.EuroConverter)
  private
    FImplementation : EuroConverter;
  public
    constructor Create(const InstanceName: string; const Impl: EuroConverter);
    destructor Destroy; override;
    function GetImplementation : EuroConverter;
    function  hfl2float ( const arg0 : Single): Single;
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
    function  getPrimaryKey : ANY;
    procedure remove ;
  published
    procedure _hfl2float(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getEJBHome(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getPrimaryKey(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TEuroConverterHomeSkeleton = class(CORBA.TCorbaObject, ejb_currencyconverter_i.EuroConverterHome)
  private
    FImplementation : EuroConverterHome;
  public
    constructor Create(const InstanceName: string; const Impl: EuroConverterHome);
    destructor Destroy; override;
    function GetImplementation : EuroConverterHome;
    function  _create : ejb_currencyconverter_i.EuroConverter;
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
    procedure remove ( const primaryKey : ANY);
    function  getSimplifiedIDL : AnsiString;
  published
    procedure __create(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getEJBMetaData(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getSimplifiedIDL(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TEuroConverterSkeleton.Create(const InstanceName : string; const Impl : ejb_currencyconverter_i.EuroConverter);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'EuroConverter', 'IDL:currencyconverter/EuroConverter:1.0');
  FImplementation := Impl;
end;

destructor TEuroConverterSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TEuroConverterSkeleton.GetImplementation : ejb_currencyconverter_i.EuroConverter;
begin
  result := FImplementation as ejb_currencyconverter_i.EuroConverter;
end;

function  TEuroConverterSkeleton.hfl2float ( const arg0 : Single): Single;
begin
  Result := FImplementation.hfl2float( arg0);
end;

function  TEuroConverterSkeleton.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := FImplementation.getEJBHome;
end;

function  TEuroConverterSkeleton.getPrimaryKey : ANY;
begin
  Result := FImplementation.getPrimaryKey;
end;

procedure TEuroConverterSkeleton.remove ;
begin
  FImplementation.remove;
end;

procedure TEuroConverterSkeleton._hfl2float(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _arg0 : Single;
  _Result : Single;
begin
  _Input.ReadFloat(_arg0);
  _Result := hfl2float( _arg0);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

procedure TEuroConverterSkeleton._getEJBHome(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ejb_sidl_javax_ejb_i.EJBHome;
begin
  _Result := getEJBHome;
  GetReplyBuffer(_Cookie, _Output);
  ejb_sidl_javax_ejb_c.TEJBHomeHelper.Write(_Output, _Result);
end;

procedure TEuroConverterSkeleton._getPrimaryKey(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ANY;
begin
  _Result := getPrimaryKey;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;

procedure TEuroConverterSkeleton._remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  remove;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TEuroConverterHomeSkeleton.Create(const InstanceName : string; const Impl : ejb_currencyconverter_i.EuroConverterHome);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'EuroConverterHome', 'IDL:currencyconverter/EuroConverterHome:1.0');
  FImplementation := Impl;
end;

destructor TEuroConverterHomeSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TEuroConverterHomeSkeleton.GetImplementation : ejb_currencyconverter_i.EuroConverterHome;
begin
  result := FImplementation as ejb_currencyconverter_i.EuroConverterHome;
end;

function  TEuroConverterHomeSkeleton._create : ejb_currencyconverter_i.EuroConverter;
begin
  Result := FImplementation._create;
end;

function  TEuroConverterHomeSkeleton.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  Result := FImplementation.getEJBMetaData;
end;

procedure TEuroConverterHomeSkeleton.remove ( const primaryKey : ANY);
begin
  FImplementation.remove( primaryKey);
end;

function  TEuroConverterHomeSkeleton.getSimplifiedIDL : AnsiString;
begin
  Result := FImplementation.getSimplifiedIDL;
end;

procedure TEuroConverterHomeSkeleton.__create(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ejb_currencyconverter_i.EuroConverter;
begin
  try
    _Result := _create;
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
  ejb_currencyconverter_c.TEuroConverterHelper.Write(_Output, _Result);
end;

procedure TEuroConverterHomeSkeleton._getEJBMetaData(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  _Result := getEJBMetaData;
  GetReplyBuffer(_Cookie, _Output);
  ejb_sidl_javax_ejb_c.TEJBMetaDataHelper.Write(_Output, _Result);
end;

procedure TEuroConverterHomeSkeleton._remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _primaryKey : ANY;
begin
  _Input.ReadAny(_primaryKey);
  remove( _primaryKey);
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TEuroConverterHomeSkeleton._getSimplifiedIDL(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : AnsiString;
begin
  _Result := getSimplifiedIDL;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteString(_Result);
end;


initialization


end.