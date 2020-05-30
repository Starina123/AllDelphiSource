unit Bank_s;

{This file was generated on 11 Aug 2000 20:16:15 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Bank_s                                             }
{derived from IDL module : Bank                                               }



interface

uses
  CORBA,
  Bank_i,
  Bank_c;

type
  TCheckingSkeleton = class;
  TSavingsSkeleton = class;

  TCheckingSkeleton = class(CORBA.TCorbaObject, Bank_i.Checking)
  private
    FImplementation : Checking;
  public
    constructor Create(const InstanceName: string; const Impl: Checking);
    destructor Destroy; override;
    function GetImplementation : Checking;
    function  balance : Single;
  published
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TSavingsSkeleton = class(CORBA.TCorbaObject, Bank_i.Savings)
  private
    FImplementation : Savings;
  public
    constructor Create(const InstanceName: string; const Impl: Savings);
    destructor Destroy; override;
    function GetImplementation : Savings;
    function  interest_rate : Single;
    function  balance : Single;
  published
    procedure _interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TCheckingSkeleton.Create(const InstanceName : string; const Impl : Bank_i.Checking);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Checking', 'IDL:Bank/Checking:1.0');
  FImplementation := Impl;
end;

destructor TCheckingSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TCheckingSkeleton.GetImplementation : Bank_i.Checking;
begin
  result := FImplementation as Bank_i.Checking;
end;

function  TCheckingSkeleton.balance : Single;
begin
  Result := FImplementation.balance;
end;

procedure TCheckingSkeleton._balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := balance;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

constructor TSavingsSkeleton.Create(const InstanceName : string; const Impl : Bank_i.Savings);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Savings', 'IDL:Bank/Savings:1.0');
  FImplementation := Impl;
end;

destructor TSavingsSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TSavingsSkeleton.GetImplementation : Bank_i.Savings;
begin
  result := FImplementation as Bank_i.Savings;
end;

function  TSavingsSkeleton.interest_rate : Single;
begin
  Result := FImplementation.interest_rate;
end;

function  TSavingsSkeleton.balance : Single;
begin
  Result := FImplementation.balance;
end;

procedure TSavingsSkeleton._interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := interest_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

procedure TSavingsSkeleton._balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := balance;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;


initialization


end.