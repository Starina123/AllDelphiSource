unit employee_c;

{This file was generated on 11 Aug 2000 20:12:57 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file employee.idl.       }

{Delphi Pascal unit      : employee_c                                         }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  employee_i;

type
  TEmployeeHelper = class;
  TEmployeeStub = class;

  TEmployeeHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : employee_i.Employee);
    class function  Extract(var _A: CORBA.Any) : employee_i.Employee;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : employee_i.Employee;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : employee_i.Employee);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : employee_i.Employee;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : employee_i.Employee; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : employee_i.Employee; overload;
  end;

  TEmployeeStub = class(CORBA.TCORBAObject, employee_i.Employee)
  public
    function  getEmployeesByName ( const name : AnsiString): ANY; virtual;
    function  getEmployeesByNameXML ( const name : AnsiString): AnsiString; virtual;
  end;


implementation

class procedure TEmployeeHelper.Insert(var _A : CORBA.Any; const _Value : employee_i.Employee);
begin
  _A := Orb.MakeObjectRef( TEmployeeHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEmployeeHelper.Extract(var _A : CORBA.Any): employee_i.Employee;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEmployeeHelper.Narrow(_obj, True);
end;

class function TEmployeeHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Employee');
end;

class function TEmployeeHelper.RepositoryId : string;
begin
  Result := 'IDL:Employee:1.0';
end;

class function TEmployeeHelper.Read(const _Input : CORBA.InputStream) : employee_i.Employee;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TEmployeeHelper.Write(const _Output : CORBA.OutputStream; const _Value : employee_i.Employee);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEmployeeHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : employee_i.Employee;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(employee_i.Employee, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEmployeeStub.Create(_Obj);
end;

class function TEmployeeHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : employee_i.Employee;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEmployeeHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : employee_i.Employee;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEmployeeStub.getEmployeesByName ( const name : AnsiString): ANY;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEmployeesByName',True, _Output);
  _Output.WriteString(name);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;

function  TEmployeeStub.getEmployeesByNameXML ( const name : AnsiString): AnsiString;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEmployeesByNameXML',True, _Output);
  _Output.WriteString(name);
  inherited _Invoke(_Output, _Input);
  _Input.ReadString(Result);
end;


initialization


end.