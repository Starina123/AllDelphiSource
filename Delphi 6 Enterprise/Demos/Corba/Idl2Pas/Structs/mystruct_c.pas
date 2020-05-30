unit mystruct_c;

{This file was generated on 11 Aug 2000 20:16:59 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file mystruct.idl.       }

{Delphi Pascal unit      : mystruct_c                                         }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  mystruct_i;

type
  TMyStructTypeHelper = class;
  TMyStructType = class;
  TAccountHelper = class;
  TAccountStub = class;

  TMyStructTypeHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : mystruct_i.MyStructType);
    class function  Extract(const _A: CORBA.Any): mystruct_i.MyStructType;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : mystruct_i.MyStructType;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : mystruct_i.MyStructType);
  end;

  TMyStructType = class (TInterfacedObject, mystruct_i.MyStructType)
  private
    s : SmallInt;
    l : Integer;
    st : AnsiString;
    constructor Create; overload;
  public
    function  _get_s : SmallInt; virtual;
    procedure _set_s ( const _value : SmallInt ); virtual;
    function  _get_l : Integer; virtual;
    procedure _set_l ( const _value : Integer ); virtual;
    function  _get_st : AnsiString; virtual;
    procedure _set_st ( const _value : AnsiString ); virtual;
    constructor Create (const s : SmallInt;
                            const l : Integer;
                            const st : AnsiString
                       ); overload;
  end;

  TAccountHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : mystruct_i.Account);
    class function  Extract(var _A: CORBA.Any) : mystruct_i.Account;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : mystruct_i.Account;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : mystruct_i.Account);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : mystruct_i.Account;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : mystruct_i.Account; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : mystruct_i.Account; overload;
  end;

  TAccountStub = class(CORBA.TCORBAObject, mystruct_i.Account)
  public
    function  balance ( const inMyStruct : mystruct_i.MyStructType;
                        out   outMyStruct : mystruct_i.MyStructType;
                        var   inoutMyStruct : mystruct_i.MyStructType): Single; virtual;
  end;


implementation

class procedure TMyStructTypeHelper.Insert(var _A : CORBA.Any; const _Value : mystruct_i.MyStructType);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TMyStructTypeHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TMyStructTypeHelper.TypeCode, _Output);
end;

class function TMyStructTypeHelper.Extract(const _A : CORBA.Any) : mystruct_i.MyStructType;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TMyStructTypeHelper.Read(_Input);
end;

class function TMyStructTypeHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 3);
  _Seq[0].Name := 's';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_short));
  _Seq[1].Name := 'l';
  _Seq[1].TC   := ORB.CreateTC(Integer(tk_long));
  _Seq[2].Name := 'st';
  _Seq[2].TC   := ORB.CreateTC(Integer(tk_string));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'MyStructType', _Seq);
end;

class function TMyStructTypeHelper.RepositoryId : string;
begin
  Result := 'IDL:MyStructType:1.0';
end;

class function TMyStructTypeHelper.Read(const _Input : CORBA.InputStream) : mystruct_i.MyStructType;
var
  _Value : mystruct_c.TMyStructType;
begin
  _Value := mystruct_c.TMyStructType.Create;
  _Input.ReadShort(_Value.s);
  _Input.ReadLong(_Value.l);
  _Input.ReadString(_Value.st);
  Result := _Value;
end;

class procedure TMyStructTypeHelper.Write(const _Output : CORBA.OutputStream; const _Value : mystruct_i.MyStructType);
begin
  _Output.WriteShort(_Value.s);
  _Output.WriteLong(_Value.l);
  _Output.WriteString(_Value.st);
end;

constructor TMyStructType.Create;
begin
  inherited Create;
end;

constructor TMyStructType.Create(const s: SmallInt;
                                 const l: Integer;
                                 const st: AnsiString);
begin
  Self.s := s;
  Self.l := l;
  Self.st := st;
end;

function  TMyStructType._get_s: SmallInt;
begin
  Result := s;
end;

procedure TMyStructType._set_s(const _Value : SmallInt);
begin
  s := _Value;
end;

function  TMyStructType._get_l: Integer;
begin
  Result := l;
end;

procedure TMyStructType._set_l(const _Value : Integer);
begin
  l := _Value;
end;

function  TMyStructType._get_st: AnsiString;
begin
  Result := st;
end;

procedure TMyStructType._set_st(const _Value : AnsiString);
begin
  st := _Value;
end;

class procedure TAccountHelper.Insert(var _A : CORBA.Any; const _Value : mystruct_i.Account);
begin
  _A := Orb.MakeObjectRef( TAccountHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Extract(var _A : CORBA.Any): mystruct_i.Account;
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

class function TAccountHelper.Read(const _Input : CORBA.InputStream) : mystruct_i.Account;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAccountHelper.Write(const _Output : CORBA.OutputStream; const _Value : mystruct_i.Account);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAccountHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : mystruct_i.Account;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(mystruct_i.Account, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAccountStub.Create(_Obj);
end;

class function TAccountHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : mystruct_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAccountHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : mystruct_i.Account;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAccountStub.balance ( const inMyStruct : mystruct_i.MyStructType;
                                 out   outMyStruct : mystruct_i.MyStructType;
                                 var   inoutMyStruct : mystruct_i.MyStructType): Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('balance',True, _Output);
  mystruct_c.TMyStructTypeHelper.Write(_Output, inMyStruct);
  mystruct_c.TMyStructTypeHelper.Write(_Output, inoutMyStruct);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
  outMyStruct := mystruct_c.TMyStructTypeHelper.Read(_Input);
  inoutMyStruct := mystruct_c.TMyStructTypeHelper.Read(_Input);
end;


initialization


end.