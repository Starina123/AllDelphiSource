{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBPlatform;


interface

uses System.SysUtils, Data.FMTBcd, Data.DB
{$IF DEFINED(CLR)}
  , System.Runtime.InteropServices
{$IFEND}
;
type

TPlatformBytes = class
  class procedure StringToBytes(Value: String; Bytes: array of byte); static;
  class procedure WideStringToBytes(Value: WideString; Bytes: array of byte); static;
  class procedure Int16ToBytes(Value: SmallInt; Bytes: array of byte); static;
  class procedure Int32ToBytes(Value: Integer; Bytes: array of byte); static;
  class procedure Int64ToBytes(Value: Int64; Bytes: array of byte); static;
  class procedure DoubleToBytes(Value: Double; Bytes: array of byte); static;
  class procedure BcdToBytes(Value: TBcd; Bytes: array of byte); static;
  class procedure TimeStampToBytes(Value: TBcd; Bytes: array of byte); static;
end;

{$IF DEFINED(CLR)}
  TValueBuffer  = IntPtr;
  TPSResult     = TObject;
{$ELSE}
  TValueBuffer  = Pointer;
  TPSResult     = Pointer;
{$IFEND}

TPlatformRecordBuffer = class
  class function CreateRecordBuffer(Length:  Integer): TRecordBuffer; static;
  class procedure Free(Buffer: TRecordBuffer); static;
  class procedure SetFMTBcd(Buffer: TRecordBuffer; value: TBcd); static;
  class procedure GetFMTBcd(Buffer: TRecordBuffer; var value: TBcd); static;
  class procedure FillChar(Buffer: TRecordBuffer; Length: Integer; value: Byte); static;
  class procedure Copy(Buffer: TRecordBuffer; Dest: TBytes; Offset: Integer; Length: Integer); static;
end;

TPlatformValueBuffer = class
  class function CreateValueBuffer(Length:  Integer): TValueBuffer; static;
  class procedure Free(Buffer: TValueBuffer); static;
  class procedure Copy(Buffer: TValueBuffer; Dest: TBytes; Offset: Integer; Count: Integer); overload; static; inline;
  class procedure Copy(Source: TBytes; Offset: Integer; Buffer: TValueBuffer; Count: Integer); overload; static; inline;
end;

TPlatformPSResult = class
  class procedure SetPSResult(var PSResult: TPSResult; Value: TObject); static;
end;

TPlatformField = class
  class function AsWideString(Field: TField): WideString; static;
end;



implementation

{ TPlatformRecordBuffer }

{$IF DEFINED(CLR)}
class function TPlatformRecordBuffer.CreateRecordBuffer(
  Length: Integer): TRecordBuffer;
begin
  Result := Marshal.AllocHGlobal(Length);
end;
class procedure TPlatformRecordBuffer.Free(Buffer: TRecordBuffer);
begin
  Marshal.FreeHGlobal(Buffer);
end;
class procedure TPlatformRecordBuffer.SetFMTBcd(Buffer: TRecordBuffer;
  value: TBcd);
begin
  Assert(false, 'TPlatformRecordBuffer.SetFMTBcd not implemented yet');
//        TBcd.ToBytes(AsFMTBcd)
//        TBcd(Buffer^) := AsFMTBcd

end;

class procedure TPlatformRecordBuffer.FillChar(Buffer: TRecordBuffer;
  Length: Integer; value: Byte);
var
  J: Integer;
begin
  for J := 0 to Length - 1 do
    Marshal.WriteByte(Buffer, J, value);
end;

class procedure TPlatformRecordBuffer.GetFMTBcd(Buffer: TRecordBuffer;
  var value: TBcd);
var
  Temp: TBytes;
begin
  SetLength(Temp, SizeOfTBcd);
  Marshal.Copy(Buffer, Temp, 0, SizeOfTBcd);
  value := TBcd.FromBytes(Temp);
end;

class procedure TPlatformRecordBuffer.Copy(Buffer: TRecordBuffer;
  Dest: array of Byte; Offset, Length: Integer);
begin
  Marshal.Copy(Buffer, Dest, Offset, Length);
end;


{$ELSE}

class function TPlatformRecordBuffer.CreateRecordBuffer(
  Length: Integer): TRecordBuffer;
begin
  Result := AllocMem(Length);
end;

class procedure TPlatformRecordBuffer.Free(Buffer: TRecordBuffer);
begin
  FreeMem(Buffer);
end;

class procedure TPlatformRecordBuffer.FillChar(Buffer: TRecordBuffer;
  Length: Integer; value: Byte);
begin
  System.FillChar(Buffer^, Length, value);
end;

class procedure TPlatformRecordBuffer.SetFMTBcd(Buffer: TRecordBuffer;
  value: TBcd);
begin
       TBcd(Pointer(Buffer)^) := value;
end;


class procedure TPlatformRecordBuffer.GetFMTBcd(Buffer: TRecordBuffer;
  var value: TBcd);
var
  SBcd: string;
begin
  SBcd := BcdToStr(PBcd(Buffer)^);
  value := StrToBcd(SBcd);
end;

class procedure TPlatformRecordBuffer.Copy(Buffer: TRecordBuffer;
  Dest: TBytes; Offset, Length: Integer);
begin
  Move(Buffer^, Dest[Offset], Length);
end;

{$IFEND}


{ TPlatformPSResult }

{$IF DEFINED(CLR)}
class procedure TPlatformPSResult.SetPSResult(var PSResult: TPSResult;
  Value: TObject);
begin
  PSResult := Value;
end;
{$ELSE}
class procedure TPlatformPSResult.SetPSResult(var PSResult: TPSResult;
  Value: TObject);
begin
  TObject(PSResult^) := Value;
end;
{$IFEND}

{ TPlatformField }

{$IF DEFINED(CLR)}
class function TPlatformField.AsWideString(Field: TField): WideString;
begin
  Result := Field.AsString;
end;
{$ELSE}
class function TPlatformField.AsWideString(Field: TField): WideString;
begin
  Result := Field.AsWideString;
end;
{$IFEND}


{ TPlatformValueBuffer }

{$IF DEFINED(CLR)}

class function TPlatformValueBuffer.CreateValueBuffer(
  Length: Integer): TValueBuffer;
begin
  Result := Marshal.AllocHGlobal(Length);
end;
class procedure TPlatformValueBuffer.Free(Buffer: TValueBuffer);
begin
  Marshal.FreeHGlobal(Buffer);
end;

class procedure TPlatformValueBuffer.Copy(Buffer: TValueBuffer;
  Dest: TBytes; Offset: Integer; Count: Integer);
begin
  Marshal.Copy(Buffer, Dest, Offset, Count);
end;

class procedure TPlatformValueBuffer.Copy(Source: TBytes;
  Offset: Integer; Buffer: TValueBuffer; Count: Integer);
begin
  Marshal.Copy(Source, Offset, Buffer, Count);
end;

{$ELSE}

class function TPlatformValueBuffer.CreateValueBuffer(
  Length: Integer): TValueBuffer;
begin
  Result := AllocMem(Length);
end;

class procedure TPlatformValueBuffer.Free(Buffer: TValueBuffer);
begin
  FreeMem(Buffer);
end;

{$INLINE ON}
class procedure TPlatformValueBuffer.Copy(Buffer: TValueBuffer;
  Dest: TBytes; Offset, Count: Integer);
begin
  Move(Buffer^, Dest[Offset], Count);
end;

class procedure TPlatformValueBuffer.Copy(Source: TBytes;
  Offset: Integer; Buffer: TValueBuffer; Count: Integer);
begin
  Move(Source[Offset], Buffer^, Count);
end;
{$INLINE OFF}
{$IFEND}



{ TPlatformBytes }

class procedure TPlatformBytes.BcdToBytes(Value: TBcd; Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.DoubleToBytes(Value: Double;
  Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.Int16ToBytes(Value: SmallInt;
  Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.Int32ToBytes(Value: Integer;
  Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.Int64ToBytes(Value: Int64; Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.StringToBytes(Value: String;
  Bytes: array of byte);
begin
  Assert(false);
{$IF DEFINED(CLR)}
{$ELSE}
//  Move(PCHAR(Value), Bytes, Length(Value));
{$IFEND}
end;

class procedure TPlatformBytes.TimeStampToBytes(Value: TBcd;
  Bytes: array of byte);
begin
  Assert(false);
end;

class procedure TPlatformBytes.WideStringToBytes(Value: WideString;
  Bytes: array of byte);
begin
  Assert(false);
end;

end.
