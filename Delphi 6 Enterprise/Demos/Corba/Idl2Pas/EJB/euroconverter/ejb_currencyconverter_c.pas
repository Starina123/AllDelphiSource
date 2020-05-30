unit ejb_currencyconverter_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file ejb.idl.            }

{Delphi Pascal unit      : ejb_currencyconverter_c                            }
{derived from IDL module : currencyconverter                                  }



interface

uses
  CORBA,
  ejb_currencyconverter_i,
  ejb_sidl_javax_ejb_i,
  ejb_sidl_javax_ejb_c;

type
  TEuroConverterHelper = class;
  TEuroConverterStub = class;
  TEuroConverterHomeHelper = class;
  TEuroConverterHomeStub = class;

  TEuroConverterHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ejb_currencyconverter_i.EuroConverter);
    class function  Extract(var _A: CORBA.Any) : ejb_currencyconverter_i.EuroConverter;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_currencyconverter_i.EuroConverter;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_currencyconverter_i.EuroConverter);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ejb_currencyconverter_i.EuroConverter;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ejb_currencyconverter_i.EuroConverter; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ejb_currencyconverter_i.EuroConverter; overload;
  end;

  TEuroConverterStub = class(CORBA.TCORBAObject, ejb_currencyconverter_i.EuroConverter)
  public
    function  hfl2float ( const arg0 : Single): Single; virtual;
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome; virtual;
    function  getPrimaryKey : ANY; virtual;
    procedure remove ; virtual;
  end;

  TEuroConverterHomeHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ejb_currencyconverter_i.EuroConverterHome);
    class function  Extract(var _A: CORBA.Any) : ejb_currencyconverter_i.EuroConverterHome;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_currencyconverter_i.EuroConverterHome;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_currencyconverter_i.EuroConverterHome);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ejb_currencyconverter_i.EuroConverterHome;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ejb_currencyconverter_i.EuroConverterHome; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ejb_currencyconverter_i.EuroConverterHome; overload;
  end;

  TEuroConverterHomeStub = class(CORBA.TCORBAObject, ejb_currencyconverter_i.EuroConverterHome)
  public
    function  _create : ejb_currencyconverter_i.EuroConverter; virtual;
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData; virtual;
    procedure remove ( const primaryKey : ANY); virtual;
    function  getSimplifiedIDL : AnsiString; virtual;
  end;


implementation

class procedure TEuroConverterHelper.Insert(var _A : CORBA.Any; const _Value : ejb_currencyconverter_i.EuroConverter);
begin
  _A := Orb.MakeObjectRef( TEuroConverterHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEuroConverterHelper.Extract(var _A : CORBA.Any): ejb_currencyconverter_i.EuroConverter;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEuroConverterHelper.Narrow(_obj, True);
end;

class function TEuroConverterHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EuroConverter');
end;

class function TEuroConverterHelper.RepositoryId : string;
begin
  Result := 'IDL:currencyconverter/EuroConverter:1.0';
end;

class function TEuroConverterHelper.Read(const _Input : CORBA.InputStream) : ejb_currencyconverter_i.EuroConverter;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TEuroConverterHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_currencyconverter_i.EuroConverter);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEuroConverterHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ejb_currencyconverter_i.EuroConverter;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ejb_currencyconverter_i.EuroConverter, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEuroConverterStub.Create(_Obj);
end;

class function TEuroConverterHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ejb_currencyconverter_i.EuroConverter;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEuroConverterHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ejb_currencyconverter_i.EuroConverter;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEuroConverterStub.hfl2float ( const arg0 : Single): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('hfl2float',True, _Output);
  _Output.WriteFloat(arg0);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;

function  TEuroConverterStub.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEJBHome',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := ejb_sidl_javax_ejb_c.TEJBHomeHelper.Read(_Input);
end;

function  TEuroConverterStub.getPrimaryKey : ANY;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getPrimaryKey',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;

procedure TEuroConverterStub.remove ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('remove',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TEuroConverterHomeHelper.Insert(var _A : CORBA.Any; const _Value : ejb_currencyconverter_i.EuroConverterHome);
begin
  _A := Orb.MakeObjectRef( TEuroConverterHomeHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEuroConverterHomeHelper.Extract(var _A : CORBA.Any): ejb_currencyconverter_i.EuroConverterHome;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEuroConverterHomeHelper.Narrow(_obj, True);
end;

class function TEuroConverterHomeHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EuroConverterHome');
end;

class function TEuroConverterHomeHelper.RepositoryId : string;
begin
  Result := 'IDL:currencyconverter/EuroConverterHome:1.0';
end;

class function TEuroConverterHomeHelper.Read(const _Input : CORBA.InputStream) : ejb_currencyconverter_i.EuroConverterHome;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TEuroConverterHomeHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_currencyconverter_i.EuroConverterHome);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEuroConverterHomeHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ejb_currencyconverter_i.EuroConverterHome;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ejb_currencyconverter_i.EuroConverterHome, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEuroConverterHomeStub.Create(_Obj);
end;

class function TEuroConverterHomeHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ejb_currencyconverter_i.EuroConverterHome;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEuroConverterHomeHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ejb_currencyconverter_i.EuroConverterHome;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEuroConverterHomeStub._create : ejb_currencyconverter_i.EuroConverter;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := ejb_currencyconverter_c.TEuroConverterHelper.Read(_Input);
end;

function  TEuroConverterHomeStub.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEJBMetaData',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := ejb_sidl_javax_ejb_c.TEJBMetaDataHelper.Read(_Input);
end;

procedure TEuroConverterHomeStub.remove ( const primaryKey : ANY);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('remove',True, _Output);
  _Output.WriteAny(primaryKey);
  inherited _Invoke(_Output, _Input);
end;

function  TEuroConverterHomeStub.getSimplifiedIDL : AnsiString;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getSimplifiedIDL',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadString(Result);
end;


initialization


end.