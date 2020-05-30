{*******************************************************}
{                                                       }
{      Copyright (C) 1999-2000 Inprise Corporation      }
{                                                       }
{*******************************************************}
unit employee_impl;

{This file was generated on 10 Jul 2000 06:31:47 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file employee.idl.       }

{Delphi Pascal unit      : employee_impl                                      }
{derived from IDL module : default                                            }



interface

uses
  SysUtils,
  CORBA,
  employee_i,
  employee_c;

type
  TEmployee = class;

  TEmployee = class(TInterfacedObject, employee_i.Employee)
  public
    constructor Create;
    function  getEmployeesByName ( const name : AnsiString): ANY;
    function  getEmployeesByNameXML ( const name : AnsiString): AnsiString;
  end;


implementation

uses dmEmployee,DMPooler, provider,DSIntf,ServerMain;

constructor TEmployee.Create;
begin
  inherited;
end;

function  TEmployee.getEmployeesByName ( const name : AnsiString): ANY;
var
  DM: TdmEmploy;
  RecsOut: Integer;
  Options: TGetRecordOptions;
begin
  Options := [grMetaData,grReset];   //must specify meta data
  DM := ModulePooler.GetModule as TdmEmploy; //Get instance of datamodule from Pool
  try
    DM.qryEmployee.Close;
    DM.qryEmployee.ParamByName('name').AsString:= name + '%';
    //show the hit count on the main form
    Inc(Form1.HitCount);
    Form1.Label1.Caption := Format('Hit Count = %d', [Form1.HitCount]);
    DM.qryEmployee.Open;
    Result:=DM.proEmployee.GetRecords(-1, RecsOut, Byte(Options));
    DM.qryEmployee.Close;
  finally
    ModulePooler.FreeModule(DM);//Return instance of DataModule to pool
  end;
end;

function  TEmployee.getEmployeesByNameXML ( const name : AnsiString): AnsiString;
var
  DM: TdmEmploy;
  RecsOut: Integer;
  Options: TGetRecordOptions;
  ByteArray: OleVariant;
begin
  Options := [grMetaData,grXML,grReset];
  DM := ModulePooler.GetModule as TdmEmploy; //Get instance of datamodule from Pool
  try
    DM.qryEmployee.Close;
    DM.qryEmployee.ParamByName('name').AsString:= name + '%';
    DM.qryEmployee.Open;
    //show the hit count on the main form
    Inc(Form1.HitCount);
    Form1.Label1.Caption := Format('Hit Count = %d', [Form1.HitCount]);
    ByteArray:=DM.proEmployee.GetRecords(-1, RecsOut, Byte(Options));
    Result:=VariantArrayToString(ByteArray);
    DM.qryEmployee.Close;
  finally
    ModulePooler.FreeModule(DM);//Return instance of DataModule to pool
  end;
end;


initialization
  //Set Class of DataModule we want to pool
  ModulePooler.ModuleClass := TdmEmploy;

end.