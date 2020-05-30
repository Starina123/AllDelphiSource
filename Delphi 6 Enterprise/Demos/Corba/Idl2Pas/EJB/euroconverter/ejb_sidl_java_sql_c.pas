unit ejb_sidl_java_sql_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_sql_c                                }
{derived from IDL module : sql                                                }



interface

uses
  CORBA,
  ejb_sidl_java_sql_i;

type
  TDateHelper = class;
  TDate = class;
  TTimeHelper = class;
  TTime = class;
  TTimestampHelper = class;
  TTimestamp = class;

  TDateHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_sql_i.Date);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_sql_i.Date;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_sql_i.Date;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Date);
  end;

  TDate = class (TInterfacedObject, ejb_sidl_java_sql_i.Date)
  private
    time : Int64;
    constructor Create; overload;
  public
    function  _get_time : Int64; virtual;
    procedure _set_time ( const _value : Int64 ); virtual;
    constructor Create (const time : Int64
                       ); overload;
  end;

  TTimeHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_sql_i.Time);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_sql_i.Time;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_sql_i.Time;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Time);
  end;

  TTime = class (TInterfacedObject, ejb_sidl_java_sql_i.Time)
  private
    time1 : Int64;
    constructor Create; overload;
  public
    function  _get_time1 : Int64; virtual;
    procedure _set_time1 ( const _value : Int64 ); virtual;
    constructor Create (const time1 : Int64
                       ); overload;
  end;

  TTimestampHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_sql_i.Timestamp);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_sql_i.Timestamp;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_sql_i.Timestamp;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Timestamp);
  end;

  TTimestamp = class (TInterfacedObject, ejb_sidl_java_sql_i.Timestamp)
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

class procedure TDateHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_sql_i.Date);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TDateHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TDateHelper.TypeCode, _Output);
end;

class function TDateHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_sql_i.Date;
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
  Result := 'IDL:borland.com/sidl/java/sql/Date:1.0';
end;

class function TDateHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_sql_i.Date;
var
  _Value : ejb_sidl_java_sql_c.TDate;
begin
  _Value := ejb_sidl_java_sql_c.TDate.Create;
  _Input.ReadLongLong(_Value.time);
  Result := _Value;
end;

class procedure TDateHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Date);
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

class procedure TTimeHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_sql_i.Time);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TTimeHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TTimeHelper.TypeCode, _Output);
end;

class function TTimeHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_sql_i.Time;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TTimeHelper.Read(_Input);
end;

class function TTimeHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 1);
  _Seq[0].Name := 'time1';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_longlong));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'Time', _Seq);
end;

class function TTimeHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/java/sql/Time:1.0';
end;

class function TTimeHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_sql_i.Time;
var
  _Value : ejb_sidl_java_sql_c.TTime;
begin
  _Value := ejb_sidl_java_sql_c.TTime.Create;
  _Input.ReadLongLong(_Value.time1);
  Result := _Value;
end;

class procedure TTimeHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Time);
begin
  _Output.WriteLongLong(_Value.time1);
end;

constructor TTime.Create;
begin
  inherited Create;
end;

constructor TTime.Create(const time1: Int64);
begin
  Self.time1 := time1;
end;

function  TTime._get_time1: Int64;
begin
  Result := time1;
end;

procedure TTime._set_time1(const _Value : Int64);
begin
  time1 := _Value;
end;

class procedure TTimestampHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_sql_i.Timestamp);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TTimestampHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TTimestampHelper.TypeCode, _Output);
end;

class function TTimestampHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_sql_i.Timestamp;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TTimestampHelper.Read(_Input);
end;

class function TTimestampHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 1);
  _Seq[0].Name := 'time';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_longlong));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'Timestamp', _Seq);
end;

class function TTimestampHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/java/sql/Timestamp:1.0';
end;

class function TTimestampHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_sql_i.Timestamp;
var
  _Value : ejb_sidl_java_sql_c.TTimestamp;
begin
  _Value := ejb_sidl_java_sql_c.TTimestamp.Create;
  _Input.ReadLongLong(_Value.time);
  Result := _Value;
end;

class procedure TTimestampHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_sql_i.Timestamp);
begin
  _Output.WriteLongLong(_Value.time);
end;

constructor TTimestamp.Create;
begin
  inherited Create;
end;

constructor TTimestamp.Create(const time: Int64);
begin
  Self.time := time;
end;

function  TTimestamp._get_time: Int64;
begin
  Result := time;
end;

procedure TTimestamp._set_time(const _Value : Int64);
begin
  time := _Value;
end;


initialization


end.