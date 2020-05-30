unit employee_s;

{This file was generated on 11 Aug 2000 20:12:57 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file employee.idl.       }

{Delphi Pascal unit      : employee_s                                         }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  employee_i,
  employee_c;

type
  TEmployeeSkeleton = class;

  TEmployeeSkeleton = class(CORBA.TCorbaObject, employee_i.Employee)
  private
    FImplementation : Employee;
  public
    constructor Create(const InstanceName: string; const Impl: Employee);
    destructor Destroy; override;
    function GetImplementation : Employee;
    function  getEmployeesByName ( const name : AnsiString): ANY;
    function  getEmployeesByNameXML ( const name : AnsiString): AnsiString;
  published
    procedure _getEmployeesByName(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getEmployeesByNameXML(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TEmployeeSkeleton.Create(const InstanceName : string; const Impl : employee_i.Employee);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Employee', 'IDL:Employee:1.0');
  FImplementation := Impl;
end;

destructor TEmployeeSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TEmployeeSkeleton.GetImplementation : employee_i.Employee;
begin
  result := FImplementation as employee_i.Employee;
end;

function  TEmployeeSkeleton.getEmployeesByName ( const name : AnsiString): ANY;
begin
  Result := FImplementation.getEmployeesByName( name);
end;

function  TEmployeeSkeleton.getEmployeesByNameXML ( const name : AnsiString): AnsiString;
begin
  Result := FImplementation.getEmployeesByNameXML( name);
end;

procedure TEmployeeSkeleton._getEmployeesByName(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _name : AnsiString;
  _Result : ANY;
begin
  _Input.ReadString(_name);
  _Result := getEmployeesByName( _name);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;

procedure TEmployeeSkeleton._getEmployeesByNameXML(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _name : AnsiString;
  _Result : AnsiString;
begin
  _Input.ReadString(_name);
  _Result := getEmployeesByNameXML( _name);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteString(_Result);
end;


initialization


end.