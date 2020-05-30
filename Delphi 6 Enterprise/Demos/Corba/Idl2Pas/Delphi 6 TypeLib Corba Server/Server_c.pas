unit Server_c;

{This file was generated on 11 Aug 2000 20:06:56 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file server.idl.         }

{Delphi Pascal unit      : Server_c                                           }
{derived from IDL module : Server                                             }



interface

uses
  CORBA,
  Server_i;

type
  TIMyTestHelper = class;
  TIMyTestStub = class;
  TMyTestFactoryHelper = class;
  TMyTestFactoryStub = class;

  TIMyTestHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Server_i.IMyTest);
    class function  Extract(var _A: CORBA.Any) : Server_i.IMyTest;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Server_i.IMyTest;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Server_i.IMyTest);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Server_i.IMyTest;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Server_i.IMyTest; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Server_i.IMyTest; overload;
  end;

  TIMyTestStub = class(CORBA.TCORBAObject, Server_i.IMyTest)
  public
    function  Get_X : Integer; virtual;
  end;

  TMyTestFactoryHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Server_i.MyTestFactory);
    class function  Extract(var _A: CORBA.Any) : Server_i.MyTestFactory;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Server_i.MyTestFactory;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Server_i.MyTestFactory);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Server_i.MyTestFactory;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Server_i.MyTestFactory; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Server_i.MyTestFactory; overload;
  end;

  TMyTestFactoryStub = class(CORBA.TCORBAObject, Server_i.MyTestFactory)
  public
    function  CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest; virtual;
  end;


implementation

class procedure TIMyTestHelper.Insert(var _A : CORBA.Any; const _Value : Server_i.IMyTest);
begin
  _A := Orb.MakeObjectRef( TIMyTestHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TIMyTestHelper.Extract(var _A : CORBA.Any): Server_i.IMyTest;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TIMyTestHelper.Narrow(_obj, True);
end;

class function TIMyTestHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'IMyTest');
end;

class function TIMyTestHelper.RepositoryId : string;
begin
  Result := 'IDL:Server/IMyTest:1.0';
end;

class function TIMyTestHelper.Read(const _Input : CORBA.InputStream) : Server_i.IMyTest;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TIMyTestHelper.Write(const _Output : CORBA.OutputStream; const _Value : Server_i.IMyTest);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TIMyTestHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Server_i.IMyTest;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Server_i.IMyTest, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TIMyTestStub.Create(_Obj);
end;

class function TIMyTestHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Server_i.IMyTest;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TIMyTestHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Server_i.IMyTest;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TIMyTestStub.Get_X : Integer;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('Get_X',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadLong(Result);
end;

class procedure TMyTestFactoryHelper.Insert(var _A : CORBA.Any; const _Value : Server_i.MyTestFactory);
begin
  _A := Orb.MakeObjectRef( TMyTestFactoryHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TMyTestFactoryHelper.Extract(var _A : CORBA.Any): Server_i.MyTestFactory;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TMyTestFactoryHelper.Narrow(_obj, True);
end;

class function TMyTestFactoryHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'MyTestFactory');
end;

class function TMyTestFactoryHelper.RepositoryId : string;
begin
  Result := 'IDL:Server/MyTestFactory:1.0';
end;

class function TMyTestFactoryHelper.Read(const _Input : CORBA.InputStream) : Server_i.MyTestFactory;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TMyTestFactoryHelper.Write(const _Output : CORBA.OutputStream; const _Value : Server_i.MyTestFactory);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TMyTestFactoryHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Server_i.MyTestFactory;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Server_i.MyTestFactory, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TMyTestFactoryStub.Create(_Obj);
end;

class function TMyTestFactoryHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Server_i.MyTestFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TMyTestFactoryHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Server_i.MyTestFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TMyTestFactoryStub.CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('CreateInstance',True, _Output);
  _Output.WriteString(InstanceName);
  inherited _Invoke(_Output, _Input);
  Result := Server_c.TIMyTestHelper.Read(_Input);
end;


initialization


end.