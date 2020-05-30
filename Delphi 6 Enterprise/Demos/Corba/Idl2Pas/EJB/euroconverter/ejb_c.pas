unit ejb_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file ejb.idl.            }

{Delphi Pascal unit      : ejb_c                                              }
{derived from IDL module : default                                            }



interface

uses
  CORBA,
  ejb_i;

type
  TSequence_of_AnyHelper = class;

  TSequence_of_AnyHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_i.Sequence_of_Any);
    class function  Extract(const _A: CORBA.Any): ejb_i.Sequence_of_Any;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_i.Sequence_of_Any;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_i.Sequence_of_Any);
  end;


implementation

class procedure TSequence_of_AnyHelper.Insert(var _A : CORBA.Any; const _Value : ejb_i.Sequence_of_Any);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TSequence_of_AnyHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TSequence_of_AnyHelper.TypeCode, _Output);
end;

class function TSequence_of_AnyHelper.Extract(const _A : CORBA.Any): ejb_i.Sequence_of_Any;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TSequence_of_AnyHelper.Read(_Input);
end;

class function  TSequence_of_AnyHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, ORB.CreateTC(Integer(tk_any)));
end;

class function  TSequence_of_AnyHelper.RepositoryId: string;
begin
  Result := 'IDL:Sequence_of_Any:1.0';
end;

class function  TSequence_of_AnyHelper.Read(const _Input : CORBA.InputStream) : ejb_i.Sequence_of_Any;
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

class procedure TSequence_of_AnyHelper.Write(const _Output: CORBA.OutputStream; const _Value: ejb_i.Sequence_of_Any);
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


initialization


end.