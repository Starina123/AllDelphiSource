unit AnyTest_c;

{This file was generated on 27 Oct 2000 17:40:35 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Any\AnyTest.idl.                                        }

{Delphi Pascal unit      : AnyTest_c                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  AnyTest_i;

type
  TMyTestHelper = class;
  TMyTestStub = class;

  TMyTestHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : AnyTest_i.MyTest);
    class function  Extract(var _A: CORBA.Any) : AnyTest_i.MyTest;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : AnyTest_i.MyTest;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : AnyTest_i.MyTest);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : AnyTest_i.MyTest;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : AnyTest_i.MyTest; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : AnyTest_i.MyTest; overload;
  end;

  TMyTestStub = class(CORBA.TCORBAObject, AnyTest_i.MyTest)
  public
    function  GetAny : ANY; virtual;
  end;


implementation

class procedure TMyTestHelper.Insert(var _A : CORBA.Any; const _Value : AnyTest_i.MyTest);
begin
  _A := Orb.MakeObjectRef( TMyTestHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TMyTestHelper.Extract(var _A : CORBA.Any): AnyTest_i.MyTest;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TMyTestHelper.Narrow(_obj, True);
end;

class function TMyTestHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'MyTest');
end;

class function TMyTestHelper.RepositoryId : string;
begin
  Result := 'IDL:MyTest:1.0';
end;

class function TMyTestHelper.Read(const _Input : CORBA.InputStream) : AnyTest_i.MyTest;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TMyTestHelper.Write(const _Output : CORBA.OutputStream; const _Value : AnyTest_i.MyTest);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TMyTestHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : AnyTest_i.MyTest;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(AnyTest_i.MyTest, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TMyTestStub.Create(_Obj);
end;

class function TMyTestHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : AnyTest_i.MyTest;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TMyTestHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : AnyTest_i.MyTest;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TMyTestStub.GetAny : ANY;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('GetAny',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;


initialization


end.