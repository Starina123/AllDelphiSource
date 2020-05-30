unit Bank_s;

{This file was generated on 11 Aug 2000 20:02:21 GMT by version 03.03.03.C1.06}
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
  TRatesSkeleton = class;
  TAccountSkeleton = class;

  TRatesSkeleton = class(CORBA.TCorbaObject, Bank_i.Rates)
  private
    FImplementation : Rates;
  public
    constructor Create(const InstanceName: string; const Impl: Rates);
    destructor Destroy; override;
    function GetImplementation : Rates;
    function  get_interest_rate : Single;
  published
    procedure _get_interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TAccountSkeleton = class(CORBA.TCorbaObject, Bank_i.Account)
  private
    FImplementation : Account;
  public
    constructor Create(const InstanceName: string; const Impl: Account);
    destructor Destroy; override;
    function GetImplementation : Account;
    function  balance : Single;
    function  get_rates ( const myRates : Bank_i.Rates): Single;
  published
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _get_rates(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TRatesSkeleton.Create(const InstanceName : string; const Impl : Bank_i.Rates);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Rates', 'IDL:Bank/Rates:1.0');
  FImplementation := Impl;
end;

destructor TRatesSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TRatesSkeleton.GetImplementation : Bank_i.Rates;
begin
  result := FImplementation as Bank_i.Rates;
end;

function  TRatesSkeleton.get_interest_rate : Single;
begin
  Result := FImplementation.get_interest_rate;
end;

procedure TRatesSkeleton._get_interest_rate(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := get_interest_rate;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

constructor TAccountSkeleton.Create(const InstanceName : string; const Impl : Bank_i.Account);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Account', 'IDL:Bank/Account:1.0');
  FImplementation := Impl;
end;

destructor TAccountSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TAccountSkeleton.GetImplementation : Bank_i.Account;
begin
  result := FImplementation as Bank_i.Account;
end;

function  TAccountSkeleton.balance : Single;
begin
  Result := FImplementation.balance;
end;

function  TAccountSkeleton.get_rates ( const myRates : Bank_i.Rates): Single;
begin
  Result := FImplementation.get_rates( myRates);
end;

procedure TAccountSkeleton._balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := balance;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;

procedure TAccountSkeleton._get_rates(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _myRates : Bank_i.Rates;
  _Result : Single;
begin
  _myRates := Bank_c.TRatesHelper.Read(_Input);
  _Result := get_rates( _myRates);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;


initialization


end.