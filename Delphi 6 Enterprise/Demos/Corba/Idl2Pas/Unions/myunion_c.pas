unit myunion_c;

{This file was generated on 11 Aug 2000 20:17:46 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file myunion.idl.        }

{Delphi Pascal unit      : myunion_c                                          }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  myunion_i;

type
  TIdentifierHelper = class;
  TUnionTypeHelper = class;
  TUnionType = class;
  TAccountHelper = class;
  TAccountStub = class;

  TIdentifierHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : myunion_i.Identifier);
    class function  Extract(const _A: CORBA.Any): myunion_i.Identifier;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : myunion_i.Identifier;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : myunion_i.Identifier);
  end;

  TUnionTypeHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : myunion_i.UnionType);
    class function  Extract(const _A: CORBA.Any): myunion_i.UnionType;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : myunion_i.UnionType;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : myunion_i.UnionType);
  end;

  TUnionType = class (TInterfacedObject, myunion_i.UnionType)
  private
    s : SmallInt;
    l : Integer;
    i : myunion_i.Identifier;
    _discriminator : Integer;
  public
    function  _get_s : SmallInt; virtual;
    procedure _set_s ( const _value : SmallInt ); virtual;
    function  _get_l : Integer; virtual;
    procedure _set_l ( const _value : Integer ); virtual;
    function  _get_i : myunion_i.Identifier; virtual;
    procedure _set_i ( const _value : myunion_i.Identifier ); virtual;
    function  _get_discriminator : Integer; virtual;
    constructor Create;
  end;

  TAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : myunion_i.Account);
    class function  Extract(var _A: CORBA.Any) : myunion_i.Account;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : myunion_i.Account;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : myunion_i.Account);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : myunion_i.Account;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : myunion_i.Account; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : myunion_i.Account; overload;
  end;

  TAccountStub = class(CORBA.TCORBAObject, myunion_i.Account)
  public
    function  balance ( const myUnion : myunion_i.UnionType): Single; virtual;
  end;


implementation

class procedure TIdentifierHelper.Insert(var _A : CORBA.Any; const _Value : myunion_i.Identifier);
begin
  _A := _Value;
end;

class function TIdentifierHelper.Extract(const _A : CORBA.Any) : myunion_i.Identifier;
var
  _Input : InputStream;
  _Temp  : AnsiString;
begin
  Orb.GetAny(_A, _Input);
  _Input.ReadString(_Temp);
  Result := myunion_i.Identifier(_Temp);
end;

class function  TIdentifierHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateAliasTC(RepositoryId, 'Identifier', ORB.CreateTC(Integer(0)));
end;

class function  TIdentifierHelper.RepositoryId : string;
begin
  Result := 'IDL:Identifier:1.0';
end;

class function  TIdentifierHelper.Read(const _Input: CORBA.InputStream) : myunion_i.Identifier;
begin
  _Input.ReadString(Result);
end;

class procedure TIdentifierHelper.Write(const _Output : CORBA.OutputStream; const _Value :myunion_i.Identifier);
begin
  _Output.WriteString(_Value);
end;

class procedure TUnionTypeHelper.Insert(var _A : CORBA.Any; const _Value : myunion_i.UnionType);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TUnionTypeHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TUnionTypeHelper.TypeCode, _Output);
end;

class function TUnionTypeHelper.Extract(const _A : CORBA.Any) : myunion_i.UnionType;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TUnionTypeHelper.Read(_Input);
end;

class function TUnionTypeHelper.TypeCode : CORBA.TypeCode;
var
  Seq: UnionMemberSeq;
begin
  SetLength(Seq, 3);
  Seq[0].Member_Name := 's';
  Seq[0].Member_Label:= -1;
  Seq[0].Member_TC   := ORB.CreateTC(Integer(tk_short));
  Seq[1].Member_Name := 'l';
  Seq[1].Member_Label:= 0;
  Seq[1].Member_TC   := ORB.CreateTC(Integer(tk_long));
  Seq[2].Member_Name := 'i';
  Seq[2].Member_Label:= 1;
  Seq[2].Member_TC   := myunion_c.TIdentifierHelper.TypeCode;
  Result := ORB.CreateUnionTC(RepositoryID, 'UnionType', ORB.CreateTC(Integer(tk_long)), Seq);
end;

class function TUnionTypeHelper.RepositoryId: string;
begin
  Result := 'IDL:UnionType:1.0';
end;

class function TUnionTypeHelper.Read(const _Input: CORBA.InputStream): myunion_i.UnionType;
var
  _Value : myunion_c.TUnionType;
begin
  _Value := TUnionType.Create;
  _Input.ReadLong(_Value._discriminator);
  case _Value._discriminator of
    -1 : _Input.ReadShort(_Value.s); 
    0 : _Input.ReadLong(_Value.l); 
    1 : _Value.i := myunion_c.TIdentifierHelper.Read(_Input); 
  end;
  Result := _Value;
end;

class procedure TUnionTypeHelper.Write(const _Output : CORBA.OutputStream; const _Value : myunion_i.UnionType);
begin
  _Output.WriteLong(_Value._discriminator);
  case _Value._discriminator of
    -1 : _Output.WriteShort(_Value.s);
    0 : _Output.WriteLong(_Value.l);
    1 : myunion_c.TIdentifierHelper.Write(_Output, _Value.i);
  end;
end;

constructor TUnionType.Create;
begin
  Self._discriminator := Integer($80000000);
end;

function  TUnionType._get_discriminator: Integer;
begin
  Result := _discriminator;
end;

function  TUnionType._get_s: SmallInt;
begin
  if ( ( _discriminator <> -1 ) 
      )
    then raise BAD_OPERATION.Create(0, COMPLETED_YES);
  Result := s;
end;

procedure TUnionType._set_s(const _Value : SmallInt);
begin
  _discriminator := -1;
  s := _Value;
end;

function  TUnionType._get_l: Integer;
begin
  if ( ( _discriminator <> 0 ) 
      )
    then raise BAD_OPERATION.Create(0, COMPLETED_YES);
  Result := l;
end;

procedure TUnionType._set_l(const _Value : Integer);
begin
  _discriminator := 0;
  l := _Value;
end;

function  TUnionType._get_i: myunion_i.Identifier;
begin
  if ( ( _discriminator <> 1 ) 
      )
    then raise BAD_OPERATION.Create(0, COMPLETED_YES);
  Result := i;
end;

procedure TUnionType._set_i(const _Value : myunion_i.Identifier);
begin
  _discriminator := 1;
  i := _Value;
end;

class procedure TAccountHelper.Insert(var _A : CORBA.Any; const _Value : myunion_i.Account);
begin
  _A := Orb.MakeObjectRef( TAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Extract(var _A : CORBA.Any): myunion_i.Account;
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

class function TAccountHelper.Read(const _Input : CORBA.InputStream) : myunion_i.Account;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : myunion_i.Account);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : myunion_i.Account;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(myunion_i.Account, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAccountStub.Create(_Obj);
end;

class function TAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : myunion_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : myunion_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAccountStub.balance ( const myUnion : myunion_i.UnionType): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  myunion_c.TUnionTypeHelper.Write(_Output, myUnion);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.