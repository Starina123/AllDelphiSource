{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXStreamPlatform;

interface

uses
  Data.DBXCommon,
  Data.DBXPlatform,
  Data.DBXStream,
  Data.DBXCommonTable,
  Data.DBXJSON,
  Data.SqlTimSt,
  Data.FMTBcd,
  System.Classes,
  System.SysUtils
;

type

  TDBXJSonRow = class(TDBXStreamerRow)
    private
//      FReaderHandle:          Integer;
      FDbxStreamReader:       TDbxJSonStreamReader;
      FDbxStreamWriter:       TDbxJSonStreamWriter;
      FDbxRowBuffer:          TDBXRowBuffer;
      FDBXLookAheadStreamReader:   TDBXLookAheadStreamReader;
      FBcdFormat:             Integer;
      FOwnsRow:               Boolean;
//      FLastParameterOrdinal:  Integer;

//      procedure CreateBlobStream(Ordinal: Integer; var Stream: TStream);
      procedure ProcessStringOverFlow(DbxValue: TDBXWideStringValue); overload;
      procedure ProcessStringOverFlow(DbxValue: TDBXAnsiStringValue); overload;
      procedure ProcessStringOverFlow(DbxValue: TDBXByteArrayValue); overload;
      function CanRead(Value: TDBXValue): Boolean;
    protected
      function  UseExtendedTypes: Boolean; override;
      procedure GetAnsiString(DbxValue: TDBXAnsiStringValue; var AnsiStringVar: TDBXAnsiStringBuilder; var IsNull: LongBool); override;
      procedure GetWideChars(DbxValue: TDBXWideStringValue; var WideChars: TDBXWideChars; var Count: Integer; var IsNull: LongBool); override;
      procedure GetAnsiChars(DbxValue: TDBXAnsiStringValue; var AnsiChars: TDBXAnsiChars; var Count: Integer; var IsNull: LongBool); override;
      procedure GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool; var IsNull: LongBool); override;
      procedure GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte; var IsNull: LongBool); override;
      procedure GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt; var IsNull: LongBool); override;
      procedure GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word; var IsNull: LongBool); override;
      procedure GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt; var IsNull: LongBool); override;
      procedure GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32; var IsNull: LongBool); override;
      procedure GetInt64(DbxValue: TDBXInt64Value; var Value: Int64; var IsNull: LongBool); override;
      procedure GetSingle(DbxValue: TDBXSingleValue; var Value: Single; var IsNull: LongBool); override;
      procedure GetDouble(DbxValue: TDBXDoubleValue; var Value: Double; var IsNull: LongBool); override;
      procedure GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd; var IsNull: LongBool); override;
      procedure GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate; var IsNull: LongBool); override;
      procedure GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime; var IsNull: LongBool); override;
      procedure GetTimeStamp(DbxValue: TDBXTimeStampValue; var Value: TSQLTimeStamp; var IsNull: LongBool); override;
      procedure GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue; var Value: TSQLTimeStampOffset; var IsNull: LongBool); override;
      procedure GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64; const Buffer: TBytes; BufferOffset, Length: Int64; var ReturnLength: Int64; var IsNull: LongBool); override;
      procedure GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64; var IsNull: LongBool); override;
      procedure GetStream(DbxValue: TDBXStreamValue; var Stream: TStream; var IsNull: LongBool); overload; override;
      procedure GetStream(DbxValue: TDBXWideStringValue; var Stream: TStream; var IsNull: LongBool); overload; override;
      procedure GetStreamBytes(DbxValue: TDBXStreamValue; const Buffer: TBytes; BufferOffset, Length, ReturnLength: Int64; var IsNull: LongBool); override;
      procedure GetStreamLength(DbxValue: TDBXStreamValue; StreamLength: Int64; var IsNull: LongBool); override;
      procedure GetDBXReader(DbxValue: TDBXReaderValue; var Value: TDBXReader; var IsNull: LongBool); override;

      procedure GetJSONValue(DbxValue: TDBXJSONValue; var Value: TJSONValue; var IsNull: LongBool); override;
      procedure SetJSONValue(DbxValue: TDBXJSONValue; Value: TJSONValue); override;
      procedure GetCallbackValue(DbxValue: TDBXCallbackValue; var Value: TDBXCallback; var IsNull: LongBool); override;
      procedure SetCallbackValue(DbxValue: TDBXCallbackValue; Value: TDBXCallback); override;
      function  IsStoredNull(DbxValue: TDBXValue): boolean; override;

      procedure SetNull(DbxValue: TDBXValue); override;
      procedure SetString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString); override;
      procedure SetWideChars(DbxValue: TDBXWideStringValue; const Value: UnicodeString); override;
      procedure SetAnsiChars(DbxValue: TDBXAnsiStringValue; const Value: AnsiString); override;
      procedure SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean); override;
      procedure SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte); override;
      procedure SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt); override;
      procedure SetUInt16(DbxValue: TDBXUInt16Value; Value: Word); override;
      procedure SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt); override;
      procedure SetInt32(DbxValue: TDBXInt32Value; Value: TInt32); override;
      procedure SetInt64(DbxValue: TDBXInt64Value; Value: Int64); override;
      procedure SetDouble(DbxValue: TDBXDoubleValue; Value: Double); override;
      procedure SetSingle(DbxValue: TDBXSingleValue; Value: Single); override;

      procedure SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd); override;

      procedure SetDate(DbxValue: TDBXDateValue; Value: TDBXDate); override;
      procedure SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime); override;

      procedure SetTimestamp(DbxValue: TDBXTimeStampValue; var Value: TSQLTimeStamp); override;
      procedure SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue; var Value: TSQLTimeStampOffset); override;

      procedure SetDynamicBytes( DbxValue:     TDBXValue;
                          Offset:       Int64;
                          const Buffer: TBytes;
                          BufferOffset: Int64;
                          Count:       Int64); override;
      procedure SetAnsiMemo(DbxValue: TDBXAnsiMemoValue; const Value: AnsiString); override;
      procedure SetWideMemo(DbxValue: TDBXWideMemoValue; const Value: UnicodeString); override;
      procedure SetDBXReader(DbxValue: TDBXReaderValue; Value: TDBXReader); override;


      function  GetObjectTypeName(Ordinal: TInt32): UnicodeString; override;

      procedure SetStream(DbxValue:     TDBXStreamValue;
                          StreamReader: TDBXStreamReader); overload; override;
      function  CreateCustomValue(const ValueType: TDBXValueType): TDBXValue; override;
      procedure SetValueType(ValueType: TDBXValueType); override;
    public
      property RowBuffer: TDBXRowBuffer read FDbxRowBuffer;
      property BcdFormat: Integer read FBcdFormat write FBcdFormat;
      constructor Create( DBXContext: TDBXContext;
                          DbxStreamReader: TDbxJSonStreamReader;
                          DbxStreamWriter: TDbxJSonStreamWriter;
                          DbxRowBuffer: TDBXRowBuffer;
                          AOwnsRow: Boolean);
      destructor Destroy; override;
      procedure ClearParameters; override;

  end;


implementation


function TDBXJSonRow.CanRead(Value: TDBXValue): Boolean;
var
  ValueType: TDBXValueType;
begin
  ValueType := Value.ValueType;
  if TDBXDriverHelp.IsReadOnlyValueType(ValueType) then
    Result := true
  else
  begin
    case ValueType.ParameterDirection of
      TDBXParameterDirections.InParameter:
        Result := not FDbxRowBuffer.Client;
      TDBXParameterDirections.InOutParameter:
        Result := True;
      else
        Result := FDbxRowBuffer.Client;
    end;
  end;
end;

procedure TDBXJSonRow.ClearParameters;
begin
  FDBXRowBuffer.Cancel();
end;

constructor TDBXJSonRow.Create(DBXContext: TDBXContext;
  DbxStreamReader: TDbxJSonStreamReader;
  DbxStreamWriter: TDbxJSonStreamWriter;
  DbxRowBuffer: TDBXRowBuffer;
  AOwnsRow: Boolean);

begin
  inherited Create(DBXContext);
  FDbxStreamReader := DbxStreamReader;
  FDBXStreamWriter := DbxStreamWriter;
  FDBXRowBuffer    := DbxRowBuffer;
  FOwnsRow         := AOwnsRow;
end;



procedure TDBXJSonRow.GetAnsiString(DbxValue: TDBXAnsiStringValue;
  var AnsiStringVar: TDBXAnsiStringBuilder; var IsNull: LongBool);
begin
  inherited;

end;

procedure TDBXJSonRow.GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd;
  var IsNull: LongBool);
var
  Value64: Int64;
  SignSpecialPlaces: Byte;
  Buf: TDBXWideChars;
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    if FBcdFormat = TDBXBcdFormat.BinaryRead then
    begin
      FDbxRowBuffer.ReadBigDecimalBuffer;
      if FDbxRowBuffer.BigDecimalFitsInInt64 then
      begin
        Value64 := FDbxRowBuffer.BigDecimalBufferAsInt64;
        Value   := StrToBcd(IntToStr(Value64));
        if FDbxRowBuffer.BigDecimalSignum < 0 then
          SignSpecialPlaces := $80
        else
          SignSpecialPlaces := $0;
        SignSpecialPlaces := SignSpecialPlaces + FDbxRowBuffer.BigDecimalScale;
        Value.SignSpecialPlaces := SignSpecialPlaces;
      end else // Temp, need big int div and mod.
        raise TDBXError.Create(TDBXErrorCodes.InvalidLength, 'BCD to big');
    end else
    begin
      SetLength(Buf, 64);
      FDbxRowBuffer.Decoder.InitWideCharsDecoder(Buf);
      Value := StrToBcd(FDbxRowBuffer.ReadString(RowHandle), GetUSFormat);
    end;
  end;
end;

procedure TDBXJSonRow.GetBoolean(DbxValue: TDBXBooleanValue; var Value,
  IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadBoolean;
  end;
end;

procedure TDBXJSonRow.GetByteLength(DbxValue: TDBXByteArrayValue;
  var ByteLength: Int64; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if CanRead(DbxValue) then
  begin
    IsNull := FDbxRowBuffer.Null;
    if not IsNull then
    begin
      FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
      if not FDbxRowBuffer.BlobHeader and not FDbxRowBuffer.LastParameterBlobSegment then
        ByteLength := -1
      else
        ByteLength := FDbxRowBuffer.ReadReaderBlobSize;
    end;
  end;
end;

procedure TDBXJSonRow.GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64;
  const Buffer: TBytes; BufferOffset, Length: Int64; var ReturnLength: Int64;
  var IsNull: LongBool);
var
  Stream: TStream;
begin
  GetStream(TDBXDriverHelp.GetNonDelegate(DbxValue) as  TDBXStreamValue, Stream, IsNull);
  if IsNull then
    ReturnLength := 0
  else
  begin
    try
      ReturnLength := TDBXStream(Stream).ReadBytes(Buffer, BufferOffset, Length)
    finally
      FreeAndNil(Stream);
    end;
  end;
end;

procedure TDBXJSonRow.GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate;
  var IsNull: LongBool);
var
  Int64Value: Int64;
  DateTime: TDateTime;
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Int64Value := FDbxRowBuffer.ReadInt64;
    DateTime := EncodeDate(Int64Value shr 9, (Int64Value shr 5) and $f, Int64Value and $1F);
    Value := DateTimeToTimeStamp(DateTime).Date;
  end;
end;


procedure TDBXJSonRow.GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadSingle;
  end;
end;

procedure TDBXJSonRow.GetDouble(DbxValue: TDBXDoubleValue;
  var Value: Double; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    if DbxValue.ValueType.SubType = TDBXDataTypes.SingleType then
      Value := FDbxRowBuffer.ReadSingle
    else
      Value := FDbxRowBuffer.ReadDouble;
  end;
end;

procedure TDBXJSonRow.GetInt16(DbxValue: TDBXInt16Value;
  var Value: SmallInt; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadInt16;
  end;
end;

procedure TDBXJSonRow.GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadInt32;
  end;
end;

procedure TDBXJSonRow.GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadInt64;
  end;
end;

procedure TDBXJSonRow.GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadInt8;
  end;
end;

function TDBXJSonRow.GetObjectTypeName(Ordinal: TInt32): UnicodeString;
begin

end;

procedure TDBXJSonRow.GetStream(DbxValue: TDBXStreamValue;
  var Stream: TStream; var IsNull: LongBool);
var
  BytesStream:  TDBXBytesStream;
  BlobStream:   TDBXStreamReaderStream;
  Reader:       TDBXStreamReader;
  Size:         Int64;
  Bytes:        TBytes;

begin
  if CanRead(DbxValue) then
  begin
    FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
    if FDbxRowBuffer.Null then
      IsNull := True
    else
    begin
      IsNull := False;
      if FDbxRowBuffer.BlobHeader or not FDbxRowBuffer.LastParameterBlobSegment then
      begin
        Reader := FDbxRowBuffer.ReadBlobStreamReader(RowHandle);
        Size   := FDbxStreamReader.ReadBufferSize;
        BlobStream := TDBXStreamReaderStream.Create(Reader, Size);
        Stream := BlobStream;
      end
      else
      begin
        Size := FDbxRowBuffer.ReadReaderBlobSize;
        SetLength(Bytes, Integer(Size));
        FDbxRowBuffer.ReadBytes(Bytes, 0, Size);
        BytesStream := TDBXBytesStream.Create(Bytes, Size);
        Stream := BytesStream;
      end;
    end;
  end;
end;

procedure TDBXJSonRow.GetStream(DbxValue: TDBXWideStringValue;
  var Stream: TStream; var IsNull: LongBool);
var
  BytesStream: TDBXBytesStream;
  Buffer: TBytes;
  Size: Int64;
begin
  if CanRead(DbxValue) then
  begin
    if FDbxRowBuffer.Null then
    begin
      IsNull := True;
      Stream := nil;
    end
    else
    begin
      IsNull := False;
      Buffer := FDbxRowBuffer.ReadStringBytes(RowHandle);
      Size := FDbxRowBuffer.StringBytesLength;
      BytesStream := TDBXBytesStream.Create(Buffer, Size);
      Stream := BytesStream;
    end;
//    if FDbxRowBuffer.BlobHeader then
//    begin
//      if FDBXLookAheadStreamReader = nil then
//        FDBXLookAheadStreamReader := TDBXLookAheadStreamReader.Create;
//      CreateBlobStream(DbxValue.ValueType.Ordinal, BlobStream);
//      try
//        FDBXLookAheadStreamReader.SetStream(Stream);
//        BytesStream.FBuffer := FDbxRowBuffer.ReadStringBytes(FDBXLookAheadStreamReader);
//        BytesStream.FSize := FDbxRowBuffer.StringBytesLength;
//      finally
//        BlobStream.Free;
//      end;
//    end else
//    begin
//      BytesStream := TDBXClientBytesStream.Create;
//      BytesStream.FBuffer := FDbxRowBuffer.ReadStringBytes;
//      BytesStream.FSize := FDbxRowBuffer.StringBytesLength;
//      Stream := BytesStream;
//    end;
  end;
end;

function TDBXJSonRow.CreateCustomValue(const ValueType: TDBXValueType): TDBXValue;
begin
  Result := nil;
  case ValueType.DataType of
    TDBXDataTypes.WideStringType:
      Result := TDBXWideCharsValue.Create(ValueType);
    TDBXDataTypes.AnsiStringType:
      Result := TDBXAnsiCharsValue.Create(ValueType);
    TDBXDataTypes.BlobType:
      case ValueType.SubType of
        TDBXDataTypes.HMemoSubType,
        TDBXDataTypes.MemoSubType:
          Result := TDBXAnsiCharsValue.Create(ValueType);
        TDBXDataTypes.WideMemoSubType:
          Result := TDBXWideCharsValue.Create(ValueType);
      end;
  end;
end;

destructor TDBXJSonRow.Destroy;
begin
  FreeAndNil(FDBXLookAheadStreamReader);
  if FOwnsRow then
    FreeAndNil(FDbxRowBuffer);
  inherited;
end;

procedure TDBXJSonRow.GetStreamBytes(DbxValue: TDBXStreamValue;
  const Buffer: TBytes; BufferOffset, Length, ReturnLength: Int64;
  var IsNull: LongBool);
begin
  inherited;
end;



procedure TDBXJSonRow.GetStreamLength(DbxValue: TDBXStreamValue;
  StreamLength: Int64; var IsNull: LongBool);
begin
  inherited;

end;

procedure TDBXJSonRow.GetDBXReader(DbxValue: TDBXReaderValue;
  var Value: TDBXReader; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    DbxValue.Handle := FDbxRowBuffer.ReadInt32;
  end;
end;

procedure TDBXJSonRow.GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime;
  var IsNull: LongBool);
var
  Int64Value: Int64;
  DateTime: TDateTime;
  Hours: Word;
  Minutes: Word;
  Seconds: Word;
  Milliseconds: Word;
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Int64Value := FDbxRowBuffer.ReadInt64;
    //  FDbxRowBuffer.WriteInt64((Year shl 9) or (Month shl 5) or Day);
    Milliseconds  := Int64Value mod 1000;
    Int64Value    := Int64Value div 1000;
    Seconds       := Int64Value mod 60;
    Int64Value    := Int64Value div 60;
    Minutes       := Int64Value mod 60;
    Hours         := Int64Value div 60;
    DateTime := EncodeTime(Hours, Minutes, Seconds, Milliseconds);
    Value := DateTimeToTimeStamp(DateTime).Time;
  end;
end;

procedure TDBXJSonRow.GetTimeStamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp; var IsNull: LongBool);
var
  Int64Value: Int64;
  TimeInt64: Int64;
  DateTime: TDateTime;
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Int64Value := FDbxRowBuffer.ReadTimestamp;
    Int64Value := (Int64Value + (Int64(UnixDateDelta) * MSecsPerDay));
    DateTime := Int64Value div MSecsPerDay;

    TimeInt64 := Int64Value mod MSecsPerDay;
    if TimeInt64 < 0 then
    begin
      TimeInt64 := MSecsPerDay + TimeInt64;
      DateTime := DateTime-1;
    end;

    Value := DateTimeToSQLTimeStamp(DateTime);

    Value.Fractions := FDbxRowBuffer.ReadTimestampNanos div (1000*1000);
    TimeInt64       := TimeInt64 div 1000;
    Value.Second    := TimeInt64 mod 60;
    TimeInt64       := TimeInt64 div 60;
    Value.Minute    := TimeInt64 mod 60;
    Value.Hour      := TimeInt64 div 60;
  end;
end;

procedure TDBXJSonRow.GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := StrToSQLTimeStampOffset(
               FDbxRowBuffer.ReadString(RowHandle)
               , GetUSFormat
             );
  end;
end;

procedure TDBXJSonRow.GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadInt16;
  end;
end;

procedure TDBXJSonRow.GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
  var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    Value := FDbxRowBuffer.ReadByte;
  end;
end;

procedure TDBXJSonRow.GetJSONValue(DbxValue: TDBXJSONValue; var Value: TJSONValue; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField( DbxValue.ValueType.Ordinal );
  if FDbxRowBuffer.Null then
    isNull := true
  else
  begin
    isNull := false;
    Value := DbxValue.CreateJSONValue( FDbxRowBuffer.buf, FDbxRowBuffer.JsonByteBlockOffset,
                          FDbxRowBuffer.DecodeJSONByteBlockSize );
  end;
end;

procedure TDBXJSonRow.GetCallbackValue(DbxValue: TDBXCallbackValue; var Value: TDBXCallback; var IsNull: LongBool);
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
    isNull := true
  else
  begin
    isNull := false;
    Value := DbxValue.CreateCallbackDelegate(DbxValue.ValueType.Ordinal);
  end;
end;

procedure TDBXJSonRow.GetWideChars(DbxValue: TDBXWideStringValue;
  var WideChars: TDBXWideChars; var Count: Integer;  var IsNull: LongBool);
var
  MaxStringSize: Integer;
  StringLength: Integer;
begin
    FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    StringLength := FDbxRowBuffer.EncodedStringLength;
    // Return the whole string.  TParam for a return value Size property defaults
    // to 2 when not set.  DBXCommon addes 1 for null terminator.  Size is not
    // really needed here and just causes string values to be truncated incorrectly.
    //
//    if DbxValue.ValueType.Size < 1 then
//    begin
      MaxStringSize := StringLength + 1;
      if Length(WideChars) < MaxStringSize then
      begin
        SetLength(WideChars, MaxStringSize);
      end;
//    end;
    Count := FDbxRowBuffer.ReadChars(RowHandle, WideChars, StringLength);
    if Count > StringLength then
    begin
      WideChars := FDbxRowBuffer.Decoder.DecodeBuf;
    end;

  end;

end;

procedure TDBXJSonRow.GetAnsiChars(DbxValue: TDBXAnsiStringValue;
  var AnsiChars: TDBXAnsiChars; var Count: Integer;  var IsNull: LongBool);
var
  MaxStringSize:  Integer;
  StringLength:   Integer;
  AnsiBytes:      TBytes;
  ReadBytes:      Integer;
  Reader:         TDBXStreamReader;
  MaxReadSize:    Integer;
begin
  FDbxRowBuffer.GoToField(DbxValue.ValueType.Ordinal);
  if FDbxRowBuffer.Null then
  begin
    isNull := true;
  end else
  begin
    isNull := false;
    StringLength := FDbxRowBuffer.EncodedStringLength;
    MaxStringSize := StringLength + 1;
    if DbxValue.ValueType.Size < 1 then
    begin
      if Length(AnsiChars) < MaxStringSize then
      begin
        SetLength(AnsiChars, MaxStringSize);
      end;
    end;
    if Length(AnsiChars) < StringLength then
      SetLength(AnsiChars, StringLength);
    if FDbxRowBuffer.LastParameterBlobSegment then
    begin
      SetLength(AnsiBytes, StringLength);
      Count := FDbxRowBuffer.ReadInlineAnsiChars(RowHandle, AnsiBytes, StringLength);
      TDBXPlatform.CopyBytesToAnsiChars(AnsiBytes, 0, AnsiChars, 0, Count);
    end
    else
    begin

      MaxReadSize := FDbxRowBuffer.MinBufferSize;
      SetLength(AnsiBytes, MaxReadSize);
      ReadBytes := MaxReadSize;
      Count := 0;
      Reader := FDbxRowBuffer.ReadBlobStreamReader(RowHandle);
      try
        while ReadBytes > 0 do
        begin
          ReadBytes := Reader.Read(AnsiBytes, 0, MaxReadSize);
          if ReadBytes > 0 then
          begin
            SetLength(AnsiChars, Count + ReadBytes);
            TDBXPlatform.CopyBytesToAnsiChars(AnsiBytes, 0, AnsiChars, Count, ReadBytes);
            inc(Count, ReadBytes);
          end;
        end;
      finally
        Reader.Free;
      end;
    end;


  end;

end;

procedure TDBXJSonRow.ProcessStringOverFlow(DbxValue: TDBXByteArrayValue);
var
  StreamReader:  TDBXByteStreamReader;
  Bytes: TBytes;
begin
  Bytes := FDbxRowBuffer.OverflowStringBytes;
  StreamReader := TDBXByteStreamReader.Create(Bytes, 0, Length(Bytes));

  TDBXDriverHelp.SetOverflowBytes((TDBXDriverHelp.GetNonDelegate(DbxValue) as TDBXByteArrayValue),
                                   StreamReader);
end;

procedure TDBXJSonRow.ProcessStringOverFlow(DbxValue: TDBXWideStringValue);
var
  StreamReader:  TDBXByteStreamReader;
  Bytes: TBytes;
begin
  Bytes := FDbxRowBuffer.OverflowStringBytes;
  StreamReader := TDBXByteStreamReader.Create(Bytes, 0, Length(Bytes));

  TDBXDriverHelp.SetOverflowBytes(TDBXDriverHelp.GetNonDelegate(DbxValue) as TDBXWideStringValue, StreamReader);
end;

procedure TDBXJSonRow.ProcessStringOverFlow(DbxValue: TDBXAnsiStringValue);
var
  StreamReader:  TDBXByteStreamReader;
  Bytes: TBytes;
begin
  Bytes := FDbxRowBuffer.OverflowStringBytes;
  StreamReader := TDBXByteStreamReader.Create(Bytes, 0, Length(Bytes));

  TDBXDriverHelp.SetOverflowBytes((TDBXDriverHelp.GetNonDelegate(DbxValue) as TDBXAnsiStringValue),
                                   StreamReader);
end;

procedure TDBXJSonRow.SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd);
begin
  FDbxRowBuffer.WriteString(BcdToStr(Value, GetUSFormat));
end;

procedure TDBXJSonRow.SetBoolean(DbxValue: TDBXBooleanValue;
  Value: Boolean);
begin
  FDbxRowBuffer.WriteBoolean(Value);
end;

procedure TDBXJSonRow.SetJSONValue(DbxValue: TDBXJSONValue; Value: TJSONValue);
var
  jsonOffset: Integer;
  byteOffset: Integer;
begin
  if Value = nil then
    FDbxRowBuffer.WriteNull
  else
  begin
    byteOffset := FDbxRowBuffer.PrepareJSONByteBlock( Value.EstimatedByteSize );

    jsonOffset := Value.ToBytes( FDbxRowBuffer.buf, byteOffset );
    FDbxRowBuffer.encodeJSONByteBlockSize( jsonOffset - byteOffset );
  end;
end;

procedure TDBXJSonRow.SetCallbackValue(DbxValue: TDBXCallbackValue; Value: TDBXCallback);
begin
  if Value = nil then
    FDbxRowBuffer.WriteNull
  else
  begin
    FDbxRowBuffer.WriteCallback;
  end;
end;


function TDBXJSonRow.IsStoredNull(DbxValue: TDBXValue): boolean;
begin
  FDbxRowBuffer.GoToField( DbxValue.ValueType.Ordinal );
  Result := FDbxRowBuffer.Null;
end;

procedure TDBXJSonRow.SetDate(DbxValue: TDBXDateValue; Value: TDBXDate);
var
  TimeStamp: TTimeStamp;
  DateTime: TDateTime;
  Month: Word;
  Day: Word;
  Year: Word;
begin
  TimeStamp.Time := 0;
  TimeStamp.Date := Value;
  DateTime := TimeStampToDateTime(TimeStamp);
  DecodeDate(DateTime, Year, Month, Day);
  FDbxRowBuffer.WriteInt64((Year shl 9) or (Month shl 5) or Day);
end;

procedure TDBXJSonRow.SetSingle(DbxValue: TDBXSingleValue; Value: Single);
begin
  FDbxRowBuffer.WriteSingle(Value)
end;

procedure TDBXJSonRow.SetDouble(DbxValue: TDBXDoubleValue; Value: Double);
begin
  if DbxValue.ValueType.SubType = TDBXDataTypes.SingleType then
    FDbxRowBuffer.WriteSingle(Value)
  else
    FDbxRowBuffer.WriteDouble(Value);
end;

procedure TDBXJSonRow.SetDynamicBytes(DbxValue: TDBXValue; Offset: Int64;
  const Buffer: TBytes; BufferOffset, Count: Int64);
begin
  inherited;

end;

procedure TDBXJSonRow.SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt);
begin
                                                                     
  //FDbxRowBuffer.WriteShort(Value);
  FDbxRowBuffer.WriteInt32(Value);
end;

procedure TDBXJSonRow.SetInt32(DbxValue: TDBXInt32Value; Value: TInt32);
begin
  FDbxRowBuffer.WriteInt32(Value);
end;

procedure TDBXJSonRow.SetInt64(DbxValue: TDBXInt64Value; Value: Int64);
begin
  FDbxRowBuffer.WriteInt64(Value);
end;

procedure TDBXJSonRow.SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt);
begin
  FDbxRowBuffer.WriteInt32(Value);
end;

procedure TDBXJSonRow.SetNull(DbxValue: TDBXValue);
begin
  FDbxRowBuffer.WriteNull;
end;

procedure TDBXJSonRow.SetStream(DbxValue: TDBXStreamValue; StreamReader: TDBXStreamReader);
begin
  FDbxRowBuffer.WriteBytes(StreamReader);
end;


procedure TDBXJSonRow.SetString(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  SetAnsiChars(DbxValue, Value);
end;

procedure TDBXJSonRow.SetDBXReader(DbxValue: TDBXReaderValue;
  Value: TDBXReader);
begin
  FDbxRowBuffer.WriteInt32(DbxValue.Handle);
  RecordDBXReaderSet(DbxValue.ValueType);
end;

procedure TDBXJSonRow.SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime);
var
  TimeStamp: TTimeStamp;
  DateTime: TDateTime;
  Hour: Word;
  Minutes: Word;
  Seconds: Word;
  Milliseconds: Word;
begin
  TimeStamp.Time := Value;
  TimeStamp.Date := DateDelta;
  DateTime := TimeStampToDateTime(TimeStamp);
  DecodeTime(DateTime, Hour, Minutes, Seconds, Milliseconds);
  FDbxRowBuffer.WriteInt64(     (Hour * (60*60*1000))
                            +  (Minutes * (60*1000))
                            +  (Seconds * 1000)
                            +  (Milliseconds)
                          );
end;

procedure TDBXJSonRow.SetTimestamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp);
var
  Int64Value: Int64;
  DateTime: TDateTime;
  Days: Integer;
begin
  DateTime := SQLTimeStampToDateTime(Value);
  Days := Trunc(DateTime);
  Dec(Days, UnixDateDelta);
  Int64Value := Int64(Days) * MSecsPerDay;
  Inc(Int64Value, Value.Hour * 60 * 60 * 1000);
  Inc(Int64Value, Value.Minute * 60 * 1000);
  Inc(Int64Value, Value.Second * 1000);
//  Inc(Int64Value, Value.Fractions);
  FDbxRowBuffer.WriteTimestamp(Int64Value, Value.Fractions*1000*1000);
end;

procedure TDBXJSonRow.SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset);
begin
  FDbxRowBuffer.WriteString(SQLTimeStampOffsetToStr('m/d/yyyy h:nn:ss:zz', Value, GetUSFormat));
end;

procedure TDBXJSonRow.SetUInt16(DbxValue: TDBXUInt16Value; Value: Word);
begin
  FDbxRowBuffer.WriteInt32(Value);
end;

procedure TDBXJSonRow.SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte);
begin
  FDbxRowBuffer.WriteInt32(Value);
end;

procedure TDBXJSonRow.SetValueType(ValueType: TDBXValueType);
begin
end;

procedure TDBXJSonRow.SetWideChars(DbxValue: TDBXWideStringValue;
  const Value: UnicodeString);
begin
  if not FDbxRowBuffer.WriteString(Value) then
  begin
    ProcessStringOverflow(DbxValue);
  end;
end;



procedure TDBXJSonRow.SetAnsiChars(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  if not FDbxRowBuffer.WriteString(String(Value)) then
  begin
    ProcessStringOverflow(DbxValue);
  end;
end;



procedure TDBXJSonRow.SetAnsiMemo(DbxValue: TDBXAnsiMemoValue;
  const Value: AnsiString);
begin
  if not FDbxRowBuffer.WriteString(String(Value)) then
  begin
    ProcessStringOverflow(DbxValue);
  end;
end;


procedure TDBXJSonRow.SetWideMemo(DbxValue: TDBXWideMemoValue;
  const Value: UnicodeString);
begin
  if not FDbxRowBuffer.WriteString(Value) then
  begin
    ProcessStringOverflow(DbxValue);
  end;
end;

function TDBXJSonRow.UseExtendedTypes: Boolean;
begin
  Result := true;
end;


end.
