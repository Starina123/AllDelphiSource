unit Server_s;

{This file was generated on 11 Aug 2000 20:06:56 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file server.idl.         }

{Delphi Pascal unit      : Server_s                                           }
{derived from IDL module : Server                                             }



interface

uses
  CORBA,
  Server_i,
  Server_c;

type
  TIMyTestSkeleton = class;
  TMyTestFactorySkeleton = class;

  TIMyTestSkeleton = class(CORBA.TCorbaObject, Server_i.IMyTest)
  private
    FImplementation : IMyTest;
  public
    constructor Create(const InstanceName: string; const Impl: IMyTest);
    destructor Destroy; override;
    function GetImplementation : IMyTest;
    function  Get_X : Integer;
  published
    procedure _Get_X(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TMyTestFactorySkeleton = class(CORBA.TCorbaObject, Server_i.MyTestFactory)
  private
    FImplementation : MyTestFactory;
  public
    constructor Create(const InstanceName: string; const Impl: MyTestFactory);
    destructor Destroy; override;
    function GetImplementation : MyTestFactory;
    function  CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest;
  published
    procedure _CreateInstance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TIMyTestSkeleton.Create(const InstanceName : string; const Impl : Server_i.IMyTest);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'IMyTest', 'IDL:Server/IMyTest:1.0');
  FImplementation := Impl;
end;

destructor TIMyTestSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TIMyTestSkeleton.GetImplementation : Server_i.IMyTest;
begin
  result := FImplementation as Server_i.IMyTest;
end;

function  TIMyTestSkeleton.Get_X : Integer;
begin
  Result := FImplementation.Get_X;
end;

procedure TIMyTestSkeleton._Get_X(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Integer;
begin
  _Result := Get_X;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteLong(_Result);
end;

constructor TMyTestFactorySkeleton.Create(const InstanceName : string; const Impl : Server_i.MyTestFactory);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'MyTestFactory', 'IDL:Server/MyTestFactory:1.0');
  FImplementation := Impl;
end;

destructor TMyTestFactorySkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TMyTestFactorySkeleton.GetImplementation : Server_i.MyTestFactory;
begin
  result := FImplementation as Server_i.MyTestFactory;
end;

function  TMyTestFactorySkeleton.CreateInstance ( const InstanceName : AnsiString): Server_i.IMyTest;
begin
  Result := FImplementation.CreateInstance( InstanceName);
end;

procedure TMyTestFactorySkeleton._CreateInstance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _InstanceName : AnsiString;
  _Result : Server_i.IMyTest;
begin
  _Input.ReadString(_InstanceName);
  _Result := CreateInstance( _InstanceName);
  GetReplyBuffer(_Cookie, _Output);
  Server_c.TIMyTestHelper.Write(_Output, _Result);
end;


initialization


end.