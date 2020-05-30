unit Account_s;

{This file was generated on 5 Apr 2001 13:09:17 GMT by version 03.03.03.C1.A1 }
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file                     }
{C:\CO86DA~1\Account.idl.                                                     }

{Delphi Pascal unit      : Account_s                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  Account_i,
  Account_c;

type
  TAccountSkeleton = class;

  TAccountSkeleton = class(CORBA.TCorbaObject, Account_i.Account)
  private
    FImplementation : Account;
  public
    constructor Create(const InstanceName: string; const Impl: Account);
    destructor Destroy; override;
    function GetImplementation : Account;
    function  balance : Single;
  published
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TAccountSkeleton.Create(const InstanceName : string; const Impl : Account_i.Account);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Account', 'IDL:Account:1.0');
  FImplementation := Impl;
end;

destructor TAccountSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TAccountSkeleton.GetImplementation : Account_i.Account;
begin
  result := FImplementation as Account_i.Account;
end;

function  TAccountSkeleton.balance : Single;
begin
  Result := FImplementation.balance;
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


initialization


end.