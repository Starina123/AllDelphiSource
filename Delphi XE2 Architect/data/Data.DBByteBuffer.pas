{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBByteBuffer;

interface

uses System.SysUtils;

type
  TDBByteBuffer = class
    strict private
      FBuffer:   TBytes;
      FOffset:   Integer;
      FUsed:     Integer;

      procedure CheckSpace(SpaceNeeded: Integer);
    public
      constructor Create; overload;
      constructor Create(Buffer: TBytes); overload;
      constructor Create(Capacity: Integer); overload;
      destructor Destroy; override;
      function  GetBytes: TBytes;
      procedure SetString(Value: String);
      procedure SetBytes(Value: TBytes);
      procedure Append(Value: String); overload;
      procedure Append(Value: TBytes); overload;
{$IF NOT DEFINED(CLR)}
      procedure Append(Value: PChar; Count: Integer); overload;
{$IFEND}
  end;


implementation

{ TDBByteBuffer }

constructor TDBByteBuffer.Create(Buffer: TBytes);
begin
  inherited Create;
  FBuffer := Buffer;
end;

procedure TDBByteBuffer.CheckSpace(SpaceNeeded: Integer);
begin
   if Length(FBuffer) < FUsed + SpaceNeeded then
   begin
      raise ERangeError.Create('CheckSpace');
   end;
end;

procedure TDBByteBuffer.Append(Value: String);
begin
  CheckSpace(Length(Value));
{$IF DEFINED(CLR)}
  System.Array.Copy(BytesOf(Value), FBuffer, Length(Value));
{$ELSE}
  Move(PByte(Value)^, PByte(FBuffer)^, Length(Value));
{$IFEND}
end;

procedure TDBByteBuffer.Append(Value: TBytes);
begin
  CheckSpace(Length(Value));
{$IF DEFINED(CLR)}
  System.Array.Copy(Value, FBuffer, Length(Value));
{$ELSE}
  Move(PChar(Value)^, PChar(FBuffer)^, Length(Value));
{$IFEND}
end;


{$IF NOT DEFINED(CLR)}
procedure TDBByteBuffer.Append(Value: PChar; Count: Integer);
begin
  CheckSpace(Count);
  Move(Value^, PChar(FBuffer)^, Count);
end;
{$IFEND}

constructor TDBByteBuffer.Create(Capacity: Integer);
begin
  inherited Create;
  SetLength(FBuffer, Capacity);
end;

constructor TDBByteBuffer.Create;
begin
  inherited Create;
end;

destructor TDBByteBuffer.Destroy;
begin
  FBuffer := nil;
  inherited;
end;

function TDBByteBuffer.GetBytes: TBytes;
begin
  Result := FBuffer;
end;

procedure TDBByteBuffer.SetBytes(Value: TBytes);
begin
  SetLength(FBuffer, Length(value));
  FOffset := 0;
  Append(Value);
end;

procedure TDBByteBuffer.SetString(Value: String);
begin
  SetLength(FBuffer, Length(value));
  FOffset := 0;
  Append(Value);
end;

end.
