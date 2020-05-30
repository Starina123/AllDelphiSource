unit account_s;

{This file was generated on 11 Aug 2000 20:01:05 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : account_s                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  account_i,
  account_c;

type
  TAccountSkeleton = class;

  TAccountSkeleton = class(CORBA.TCorbaObject, account_i.Account)
  private
    FImplementation : Account;
  public
    constructor Create(const InstanceName: string; const Impl: Account);
    destructor Destroy; override;
    function GetImplementation : Account;
    function  _get_YearOpened : SmallInt;
    procedure _set_YearOpened ( const YearOpened : SmallInt);
    function  _get_GotToaster : Boolean;
    function  balance : Single;
  published

    procedure __get_YearOpened(const _Input: CORBA.InputStream; _Cookie: Pointer);

    procedure __set_YearOpened(const _Input: CORBA.InputStream; _Cookie: Pointer);

    procedure __get_GotToaster(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TAccountSkeleton.Create(const InstanceName : string; const Impl : account_i.Account);
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

function TAccountSkeleton.GetImplementation : account_i.Account;
begin
  result := FImplementation as account_i.Account;
end;


function  TAccountSkeleton._get_YearOpened : SmallInt;
begin
  Result := FImplementation._get_YearOpened;
end;


procedure TAccountSkeleton._set_YearOpened ( const YearOpened : SmallInt);
begin
  FImplementation._set_YearOpened( YearOpened);
end;


function  TAccountSkeleton._get_GotToaster : Boolean;
begin
  Result := FImplementation._get_GotToaster;
end;


procedure TAccountSkeleton.__get_YearOpened(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : SmallInt;
begin
  _Result := _get_YearOpened;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteShort(_Result);
end;


procedure TAccountSkeleton.__set_YearOpened(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _YearOpened : SmallInt;
begin
  _Input.ReadShort(_YearOpened);
  _set_YearOpened( _YearOpened);
  GetReplyBuffer(_Cookie, _Output);
end;


procedure TAccountSkeleton.__get_GotToaster(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Boolean;
begin
  _Result := _get_GotToaster;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteBoolean(_Result);
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