unit myunion_s;

{This file was generated on 11 Aug 2000 20:17:46 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file myunion.idl.        }

{Delphi Pascal unit      : myunion_s                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  myunion_i,
  myunion_c;

type
  TAccountSkeleton = class;

  TAccountSkeleton = class(CORBA.TCorbaObject, myunion_i.Account)
  private
    FImplementation : Account;
  public
    constructor Create(const InstanceName: string; const Impl: Account);
    destructor Destroy; override;
    function GetImplementation : Account;
    function  balance ( const myUnion : myunion_i.UnionType): Single;
  published
    procedure _balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TAccountSkeleton.Create(const InstanceName : string; const Impl : myunion_i.Account);
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

function TAccountSkeleton.GetImplementation : myunion_i.Account;
begin
  result := FImplementation as myunion_i.Account;
end;

function  TAccountSkeleton.balance ( const myUnion : myunion_i.UnionType): Single;
begin
  Result := FImplementation.balance( myUnion);
end;

procedure TAccountSkeleton._balance(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _myUnion : myunion_i.UnionType;
  _Result : Single;
begin
  _myUnion := myunion_c.TUnionTypeHelper.Read(_Input);
  _Result := balance( _myUnion);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;


initialization


end.