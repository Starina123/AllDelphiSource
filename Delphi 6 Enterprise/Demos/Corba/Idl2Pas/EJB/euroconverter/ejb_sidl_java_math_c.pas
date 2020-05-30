unit ejb_sidl_java_math_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_math_c                               }
{derived from IDL module : math                                               }



interface

uses
  CORBA,
  ejb_sidl_java_math_i;

type
  TBigDecimalHelper = class;
  TBigDecimal = class;

  TBigDecimalHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_math_i.BigDecimal);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_math_i.BigDecimal;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_math_i.BigDecimal;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_math_i.BigDecimal);
  end;

  TBigDecimal = class (TInterfacedObject, ejb_sidl_java_math_i.BigDecimal)
  private
    value : AnsiString;
    constructor Create; overload;
  public
    function  _get_value : AnsiString; virtual;
    procedure _set_value ( const _value : AnsiString ); virtual;
    constructor Create (const value : AnsiString
                       ); overload;
  end;


implementation

class procedure TBigDecimalHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_math_i.BigDecimal);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TBigDecimalHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TBigDecimalHelper.TypeCode, _Output);
end;

class function TBigDecimalHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_math_i.BigDecimal;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TBigDecimalHelper.Read(_Input);
end;

class function TBigDecimalHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 1);
  _Seq[0].Name := 'value';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_string));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'BigDecimal', _Seq);
end;

class function TBigDecimalHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/java/math/BigDecimal:1.0';
end;

class function TBigDecimalHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_math_i.BigDecimal;
var
  _Value : ejb_sidl_java_math_c.TBigDecimal;
begin
  _Value := ejb_sidl_java_math_c.TBigDecimal.Create;
  _Input.ReadString(_Value.value);
  Result := _Value;
end;

class procedure TBigDecimalHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_math_i.BigDecimal);
begin
  _Output.WriteString(_Value.value);
end;

constructor TBigDecimal.Create;
begin
  inherited Create;
end;

constructor TBigDecimal.Create(const value: AnsiString);
begin
  Self.value := value;
end;

function  TBigDecimal._get_value: AnsiString;
begin
  Result := value;
end;

procedure TBigDecimal._set_value(const _Value : AnsiString);
begin
  value := _Value;
end;


initialization


end.