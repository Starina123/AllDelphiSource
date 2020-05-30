unit account_c;

{This file was generated on 11 Aug 2000 20:15:27 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : account_c                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  account_i;

type
  TIntSeqHelper = class;
  TAccountHelper = class;
  TAccountStub = class;

  TIntSeqHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : account_i.IntSeq);
    class function  Extract(const _A: CORBA.Any): account_i.IntSeq;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : account_i.IntSeq;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : account_i.IntSeq);
  end;

  TAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : account_i.Account);
    class function  Extract(var _A: CORBA.Any) : account_i.Account;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : account_i.Account;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : account_i.Account);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : account_i.Account;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : account_i.Account; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : account_i.Account; overload;
  end;

  TAccountStub = class(CORBA.TCORBAObject, account_i.Account)
  public
    function  balance ( const mySeq : account_i.IntSeq): Single; virtual;
  end;


implementation

class procedure TIntSeqHelper.Insert(var _A : CORBA.Any; const _Value : account_i.IntSeq);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TIntSeqHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TIntSeqHelper.TypeCode, _Output);
end;

class function TIntSeqHelper.Extract(const _A : CORBA.Any): account_i.IntSeq;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TIntSeqHelper.Read(_Input);
end;

class function  TIntSeqHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(5, ORB.CreateTC(Integer(tk_long)));
end;

class function  TIntSeqHelper.RepositoryId: string;
begin
  Result := 'IDL:IntSeq:1.0';
end;

class function  TIntSeqHelper.Read(const _Input : CORBA.InputStream) : account_i.IntSeq;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  if (L0 > 5) then raise MARSHAL.Create(0, COMPLETED_YES);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      _Input.ReadULong(Result[I0]);
    end;
  end;
end;

class procedure TIntSeqHelper.Write(const _Output: CORBA.OutputStream; const _Value: account_i.IntSeq);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  if (L0 > 5) then raise MARSHAL.Create(0, COMPLETED_NO);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      _Output.WriteULong(_Value[I0]);
    end;
  end;
end;

class procedure TAccountHelper.Insert(var _A : CORBA.Any; const _Value : account_i.Account);
begin
  _A := Orb.MakeObjectRef( TAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Extract(var _A : CORBA.Any): account_i.Account;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TAccountHelper.Narrow(_obj, True);
end;

class function TAccountHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Account');
end;

class function TAccountHelper.RepositoryId : string;
begin
  Result := 'IDL:Account:1.0';
end;

class function TAccountHelper.Read(const _Input : CORBA.InputStream) : account_i.Account;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : account_i.Account);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : account_i.Account;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(account_i.Account, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAccountStub.Create(_Obj);
end;

class function TAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : account_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : account_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAccountStub.balance ( const mySeq : account_i.IntSeq): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  account_c.TIntSeqHelper.Write(_Output, mySeq);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.