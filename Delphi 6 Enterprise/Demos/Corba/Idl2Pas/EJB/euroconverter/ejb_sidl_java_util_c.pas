unit ejb_sidl_java_util_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_util_c                               }
{derived from IDL module : util                                               }



interface

uses
  CORBA,
  ejb_sidl_java_util_i;

type
  TCollectionHelper = class;
  TEnumerationHelper = class;
  TListHelper = class;
  TVectorHelper = class;
  TDateHelper = class;
  TDate = class;

  TCollectionHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_util_i.Collection);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_util_i.Collection;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_util_i.Collection;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.Collection);
  end;

  TEnumerationHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_util_i.Enumeration);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_util_i.Enumeration;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_util_i.Enumeration;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.Enumeration);
  end;

  TListHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_util_i.List);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_util_i.List;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_util_i.List;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.List);
  end;

  TVectorHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_util_i.Vector);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_util_i.Vector;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_util_i.Vector;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.Vector);
  end;

  TDateHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_util_i.Date);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_util_i.Date;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_util_i.Date;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.Date);
  end;

  TDate = class (TInterfacedObject, ejb_sidl_java_util_i.Date)
  private
    time : Int64;
    constructor Create; overload;
  public
    function  _get_time : Int64; virtual;
    procedure _set_time ( const _value : Int64 ); virtual;
    constructor Create (const time : Int64
                       ); overload;
  end;


implementation

class procedure TCollectionHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_util_i.Collection);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TCollectionHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TCollectionHelper.TypeCode, _Output);
end;

class function TCollectionHelper.Extract(const _A : CORBA.Any): ejb_sidl_java_util_i.Collection;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TCollectionHelper.Read(_Input);
end;

class function  TCollectionHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, ORB.CreateTC(Integer(tk_any)));
end;

class function  TCollectionHelper.RepositoryId: string;
begin
  Result := 'IDL:borland.com/sidl/java/util/Collection:1.0';
end;

class function  TCollectionHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_util_i.Collection;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      _Input.ReadAny(Result[I0]);
    end;
  end;
end;

class procedure TCollectionHelper.Write(const _Output: CORBA.OutputStream; const _Value: ejb_sidl_java_util_i.Collection);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      _Output.WriteAny(_Value[I0]);
    end;
  end;
end;

class procedure TEnumerationHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_util_i.Enumeration);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TEnumerationHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TEnumerationHelper.TypeCode, _Output);
end;

class function TEnumerationHelper.Extract(const _A : CORBA.Any): ejb_sidl_java_util_i.Enumeration;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TEnumerationHelper.Read(_Input);
end;

class function  TEnumerationHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, ORB.CreateTC(Integer(tk_any)));
end;

class function  TEnumerationHelper.RepositoryId: string;
begin
  Result := 'IDL:borland.com/sidl/java/util/Enumeration:1.0';
end;

class function  TEnumerationHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_util_i.Enumeration;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      _Input.ReadAny(Result[I0]);
    end;
  end;
end;

class procedure TEnumerationHelper.Write(const _Output: CORBA.OutputStream; const _Value: ejb_sidl_java_util_i.Enumeration);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      _Output.WriteAny(_Value[I0]);
    end;
  end;
end;

class procedure TListHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_util_i.List);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TListHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TListHelper.TypeCode, _Output);
end;

class function TListHelper.Extract(const _A : CORBA.Any): ejb_sidl_java_util_i.List;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TListHelper.Read(_Input);
end;

class function  TListHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, ORB.CreateTC(Integer(tk_any)));
end;

class function  TListHelper.RepositoryId: string;
begin
  Result := 'IDL:borland.com/sidl/java/util/List:1.0';
end;

class function  TListHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_util_i.List;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      _Input.ReadAny(Result[I0]);
    end;
  end;
end;

class procedure TListHelper.Write(const _Output: CORBA.OutputStream; const _Value: ejb_sidl_java_util_i.List);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      _Output.WriteAny(_Value[I0]);
    end;
  end;
end;

class procedure TVectorHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_util_i.Vector);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TVectorHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TVectorHelper.TypeCode, _Output);
end;

class function TVectorHelper.Extract(const _A : CORBA.Any): ejb_sidl_java_util_i.Vector;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TVectorHelper.Read(_Input);
end;

class function  TVectorHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, ORB.CreateTC(Integer(tk_any)));
end;

class function  TVectorHelper.RepositoryId: string;
begin
  Result := 'IDL:borland.com/sidl/java/util/Vector:1.0';
end;

class function  TVectorHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_util_i.Vector;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      _Input.ReadAny(Result[I0]);
    end;
  end;
end;

class procedure TVectorHelper.Write(const _Output: CORBA.OutputStream; const _Value: ejb_sidl_java_util_i.Vector);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      _Output.WriteAny(_Value[I0]);
    end;
  end;
end;

class procedure TDateHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_util_i.Date);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TDateHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TDateHelper.TypeCode, _Output);
end;

class function TDateHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_util_i.Date;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TDateHelper.Read(_Input);
end;

class function TDateHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 1);
  _Seq[0].Name := 'time';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_longlong));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'Date', _Seq);
end;

class function TDateHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/java/util/Date:1.0';
end;

class function TDateHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_util_i.Date;
var
  _Value : ejb_sidl_java_util_c.TDate;
begin
  _Value := ejb_sidl_java_util_c.TDate.Create;
  _Input.ReadLongLong(_Value.time);
  Result := _Value;
end;

class procedure TDateHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_util_i.Date);
begin
  _Output.WriteLongLong(_Value.time);
end;

constructor TDate.Create;
begin
  inherited Create;
end;

constructor TDate.Create(const time: Int64);
begin
  Self.time := time;
end;

function  TDate._get_time: Int64;
begin
  Result := time;
end;

procedure TDate._set_time(const _Value : Int64);
begin
  time := _Value;
end;


initialization


end.