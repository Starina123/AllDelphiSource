unit AnyTest_s;

{This file was generated on 27 Oct 2000 17:40:35 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\Examples\IDL2PA~1\Any\AnyTest.idl.                                        }

{Delphi Pascal unit      : AnyTest_s                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  AnyTest_i,
  AnyTest_c;

type
  TMyTestSkeleton = class;

  TMyTestSkeleton = class(CORBA.TCorbaObject, AnyTest_i.MyTest)
  private
    FImplementation : MyTest;
  public
    constructor Create(const InstanceName: string; const Impl: MyTest);
    destructor Destroy; override;
    function GetImplementation : MyTest;
    function  GetAny : ANY;
  published
    procedure _GetAny(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TMyTestSkeleton.Create(const InstanceName : string; const Impl : AnyTest_i.MyTest);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'MyTest', 'IDL:MyTest:1.0');
  FImplementation := Impl;
end;

destructor TMyTestSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TMyTestSkeleton.GetImplementation : AnyTest_i.MyTest;
begin
  result := FImplementation as AnyTest_i.MyTest;
end;

function  TMyTestSkeleton.GetAny : ANY;
begin
  Result := FImplementation.GetAny;
end;

procedure TMyTestSkeleton._GetAny(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ANY;
begin
  _Result := GetAny;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;


initialization


end.