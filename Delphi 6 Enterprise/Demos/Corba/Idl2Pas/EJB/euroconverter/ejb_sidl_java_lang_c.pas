unit ejb_sidl_java_lang_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_java_lang_c                               }
{derived from IDL module : lang                                               }



interface

uses
  CORBA,
  ejb_sidl_java_lang_i;

type
  TClassHelper = class;
  TClass = class;

  TClassHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_java_lang_i._Class);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_java_lang_i._Class;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_java_lang_i._Class;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_lang_i._Class);
  end;

  TClass = class (TInterfacedObject, ejb_sidl_java_lang_i._Class)
  private
    idlName : AnsiString;
    javaName : AnsiString;
    constructor Create; overload;
  public
    function  _get_idlName : AnsiString; virtual;
    procedure _set_idlName ( const _value : AnsiString ); virtual;
    function  _get_javaName : AnsiString; virtual;
    procedure _set_javaName ( const _value : AnsiString ); virtual;
    constructor Create (const idlName : AnsiString;
                            const javaName : AnsiString
                       ); overload;
  end;


implementation

class procedure TClassHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_java_lang_i._Class);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TClassHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TClassHelper.TypeCode, _Output);
end;

class function TClassHelper.Extract(const _A : CORBA.Any) : ejb_sidl_java_lang_i._Class;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TClassHelper.Read(_Input);
end;

class function TClassHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 2);
  _Seq[0].Name := 'idlName';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_string));
  _Seq[1].Name := 'javaName';
  _Seq[1].TC   := ORB.CreateTC(Integer(tk_string));
  Result := ORB.MakeStructureTypecode(RepositoryID, '_Class', _Seq);
end;

class function TClassHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/java/lang/Class:1.0';
end;

class function TClassHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_java_lang_i._Class;
var
  _Value : ejb_sidl_java_lang_c.TClass;
begin
  _Value := ejb_sidl_java_lang_c.TClass.Create;
  _Input.ReadString(_Value.idlName);
  _Input.ReadString(_Value.javaName);
  Result := _Value;
end;

class procedure TClassHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_java_lang_i._Class);
begin
  _Output.WriteString(_Value.idlName);
  _Output.WriteString(_Value.javaName);
end;

constructor TClass.Create;
begin
  inherited Create;
end;

constructor TClass.Create(const idlName: AnsiString;
                          const javaName: AnsiString);
begin
  Self.idlName := idlName;
  Self.javaName := javaName;
end;

function  TClass._get_idlName: AnsiString;
begin
  Result := idlName;
end;

procedure TClass._set_idlName(const _Value : AnsiString);
begin
  idlName := _Value;
end;

function  TClass._get_javaName: AnsiString;
begin
  Result := javaName;
end;

procedure TClass._set_javaName(const _Value : AnsiString);
begin
  javaName := _Value;
end;


initialization


end.