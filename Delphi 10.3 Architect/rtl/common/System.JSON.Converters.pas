{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.JSON.Converters;

interface

uses System.Generics.Collections, System.TypInfo, System.Rtti, System.JSON.Writers, System.JSON.Readers, System.JSON.Serializers;

type
  // --------------------------------------------------------------------- //
  // Converter for Enums
  // --------------------------------------------------------------------- //
  TJsonEnumNameConverter = class(TJsonConverter)
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for Sets
  // --------------------------------------------------------------------- //
  TJsonSetNamesConverter = class(TJsonConverter)
  private
    function ExtractSetValue(ATypeInf: PTypeInfo; const AValue: TValue): Int64;
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for creating custom objects
  // --------------------------------------------------------------------- //
  TJsonCustomCreationConverter<T> = class(TJsonConverter)
  private
    FType: PTypeInfo;
  protected
    function CreateInstance(ATypeInf: PTypeInfo): TValue; virtual; abstract;
  public
    constructor Create;
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
    function CanWrite: Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TListHelper
  // --------------------------------------------------------------------- //
  TJsonListHelperConverter = class(TJsonConverter)
  private
    FRttiCtx: TRttiContext;
  public
    constructor Create;
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TList
  // --------------------------------------------------------------------- //
  TJsonListConverter<V> = class(TJsonConverter)
  protected
    function CreateInstance: TList<V>; virtual;
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TStack
  // --------------------------------------------------------------------- //
  TJsonStackConverter<V> = class(TJsonConverter)
  protected
    function CreateInstance: TStack<V>; virtual;
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TQueue
  // --------------------------------------------------------------------- //
  TJsonQueueConverter<V> = class(TJsonConverter)
  protected
    function CreateInstance: TQueue<V>; virtual;
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TDictionary
  // --------------------------------------------------------------------- //
  TJsonDictionaryConverter<K, V> = class(TJsonConverter)
  protected
    function CreateDictionary: TDictionary<K, V>; virtual;
    function PropertyToKey(const APropertyName: string): K; virtual; abstract;
    function KeyToProperty(const AKey: K): string; virtual; abstract;
    function ReadKey(const AReader: TJsonReader; const ASerializer: TJsonSerializer): string;
    function ReadValue(const AReader: TJsonReader; const ASerializer: TJsonSerializer): V; virtual;
    procedure WriteValue(const AWriter: TJsonWriter; const AValue: V; const ASerializer: TJsonSerializer); virtual;
  public
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer); override;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; override;
    function CanConvert(ATypeInf: PTypeInfo): Boolean; override;
  end;

  // --------------------------------------------------------------------- //
  // Converter for TDictionary with string keys
  // --------------------------------------------------------------------- //
  TJsonStringDictionaryConverter<V> = class(TJsonDictionaryConverter<string, V>)
  protected
    function PropertyToKey(const APropertyName: string): string; override;
    function KeyToProperty(const AKey: string): string; override;
  end;

implementation

uses System.SysUtils, System.JSON.Types, System.JSON.Utils, System.JSONConsts;

{ TJsonListHelperConverter }

constructor TJsonListHelperConverter.Create;
begin
  inherited Create;
  FRttiCtx := TRttiContext.Create;
end;

function TJsonListHelperConverter.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := ATypeInf = TypeInfo(System.Generics.Collections.TListHelper);
end;

function TJsonListHelperConverter.ReadJson(const AReader: TJsonReader;
  ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  LStartReading: Boolean;
begin
  LStartReading := False;
  // Unmarshal TList<T>.FListHelper as dynamic array using 10.3 layout
  if AReader.TokenType = TJsonToken.StartArray then
    LStartReading := True
  else
  // Unmarshal TList<T>.FListHelper as dynamic array using 10.2 layout
  begin
    AReader.Read;
    if (AReader.TokenType = TJsonToken.PropertyName) and
       SameText(AReader.Value.AsString, 'FCount') then
    begin
      AReader.Read;
      if AReader.TokenType = TJsonToken.Integer then
      begin
        AReader.Read;
        if AReader.TokenType = TJsonToken.EndObject then
        begin
          AReader.Read;
          if (AReader.TokenType = TJsonToken.PropertyName) and
             SameText(AReader.Value.AsString, 'FItems') then
          begin
            AReader.Read;
            LStartReading := True;
          end;
        end;
      end;
    end;
  end;
  if LStartReading then
  begin
    Result := AExistingValue;
    SetTListHelperValueFromArrayValue(FRttiCtx, Result,
      function (AArrType: TRttiType): TValue
      var
        LpArr: Pointer;
        LSize: NativeInt;
      begin
        LSize := 0;
        LpArr := nil;
        DynArraySetLength(LpArr, AArrType.Handle, 1, @LSize);
        TValue.Make(@LpArr, AArrType.Handle, Result);
        ASerializer.Populate(AReader, Result);
      end);
  end;
end;

procedure TJsonListHelperConverter.WriteJson(const AWriter: TJsonWriter;
  const AValue: TValue; const ASerializer: TJsonSerializer);
var
  LCount: Integer;
  LValArr: TValue;
  I: Integer;
begin
  LValArr := GetArrayValueFromTListHelperValue(FRttiCtx, AValue, LCount);

  if JSONSerializationVersion <= 32 then
  begin
    AWriter.WriteStartObject;
    AWriter.WritePropertyName('FCount');
    AWriter.WriteValue(LCount);
    AWriter.WriteEndObject;

    AWriter.WritePropertyName('FItems');
  end;
  AWriter.WriteStartArray;
  for I := 0 to LCount - 1 do
    ASerializer.Serialize(AWriter, LValArr.GetArrayElement(I));
  AWriter.WriteEndArray;
end;

{ TJsonListConverter<V> }

function TJsonListConverter<V>.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := TJsonTypeUtils.InheritsFrom(ATypeInf, TList<V>)
end;

function TJsonListConverter<V>.CreateInstance: TList<V>;
begin
          
                                           
                                                                                                   
                                                                       
                                                   
                                                       
   
  Result := TList<V>.Create;
end;

function TJsonListConverter<V>.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  List: TList<V>;
  Arr: TArray<V>;
begin
  if AReader.TokenType = TJsonToken.Null then
    Result := nil
  else
  begin
    ASerializer.Populate(AReader, Arr);
    if AExistingValue.IsEmpty then
      List := CreateInstance
    else
      List := AExistingValue.AsType<TList<V>>;
    List.AddRange(Arr);
    Result := TValue.From(List);
  end;
end;

procedure TJsonListConverter<V>.WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
  const ASerializer: TJsonSerializer);
var
  List: TList<V>;
  Arr: TArray<V>;
begin
  if AValue.TryAsType(List) then
    ASerializer.Serialize(AWriter, List.ToArray)
  else
    raise EJsonException.Create(Format(SConverterNotMatchingType, [AValue.TypeInfo^.Name, TList<V>.ClassName]));
end;

{ TJsonDictionaryConverter<K, V> }

function TJsonDictionaryConverter<K, V>.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  if ATypeInf^.Kind = tkClass then
    Result := ATypeInf.TypeData^.ClassType.InheritsFrom(TDictionary<K, V>)
  else
    Result := False;
end;

function TJsonDictionaryConverter<K, V>.CreateDictionary: TDictionary<K, V>;
begin
  Result := TObjectDictionary<K, V>.Create;
end;

function TJsonDictionaryConverter<K, V>.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo;
  const AExistingValue: TValue; const ASerializer: TJsonSerializer): TValue;
var
  Dictionary: TDictionary<K, V>;
  LKey: K;
  LValue: V;
begin
  if AReader.TokenType = TJsonToken.Null then
    Result := nil
  else
  begin
    if AExistingValue.IsEmpty then
      Dictionary := CreateDictionary
    else
      Dictionary := AExistingValue.AsType<TDictionary<K, V>>;
    LKey := PropertyToKey(ReadKey(AReader, ASerializer));
    while AReader.TokenType <> TJsonToken.EndObject do
    begin
      LValue := ReadValue(AReader, ASerializer);
      Dictionary.AddOrSetValue(LKey, LValue);
      LKey := PropertyToKey(ReadKey(AReader, ASerializer));
    end;
  end;
  Result := TValue.From(Dictionary);
end;

function TJsonDictionaryConverter<K, V>.ReadKey(const AReader: TJsonReader; const ASerializer: TJsonSerializer): string;
begin
  AReader.Read;
  case AReader.TokenType of
    TJsonToken.EndObject:; // skip
    TJsonToken.PropertyName:
      Result := AReader.Value.AsString;
  else
    raise Exception.Create('');
  end;
end;

function TJsonDictionaryConverter<K, V>.ReadValue(const AReader: TJsonReader; const ASerializer: TJsonSerializer): V;
begin
  Result := ASerializer.Deserialize<V>(AReader);
end;

procedure TJsonDictionaryConverter<K, V>.WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
  const ASerializer: TJsonSerializer);
var
  Dictionary: TDictionary<K, V>;
  LValue: V;
  LKey: K;
begin
  if not AValue.TryAsType(Dictionary) then
    raise EJsonException.Create(Format(SConverterNotMatchingType, [AValue.TypeInfo^.Name, TDictionary<K, V>.ClassName]));

  AWriter.WriteStartObject;
  for LKey in Dictionary.Keys do
  begin
    AWriter.WritePropertyName(KeyToProperty(LKey));
    WriteValue(AWriter, Dictionary[LKey], ASerializer);
  end;
  AWriter.WriteEndObject;
end;

procedure TJsonDictionaryConverter<K, V>.WriteValue(const AWriter: TJsonWriter; const AValue: V;
  const ASerializer: TJsonSerializer);
begin
  ASerializer.Serialize<V>(AWriter, AValue);
end;

{ TJsonStringDictionaryConverter<V> }

function TJsonStringDictionaryConverter<V>.KeyToProperty(const AKey: string): string;
begin
  Result := AKey;
end;

function TJsonStringDictionaryConverter<V>.PropertyToKey(const APropertyName: string): string;
begin
  Result := APropertyName;
end;

{ TJsonCustomCreationConverter<T> }

function TJsonCustomCreationConverter<T>.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := TJsonTypeUtils.IsAssignableFrom(ATypeInf, FType);
end;

function TJsonCustomCreationConverter<T>.CanWrite: Boolean;
begin
  Result := False;
end;

constructor TJsonCustomCreationConverter<T>.Create;
begin
  FType := TypeInfo(T);
end;

function TJsonCustomCreationConverter<T>.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo;
  const AExistingValue: TValue; const ASerializer: TJsonSerializer): TValue;
var
  LValue: T;
begin
  if AReader.TokenType = TJsonToken.Null then
    Result := nil
  else
  begin
    Result := CreateInstance(ATypeInf);
    if Result.IsEmpty then
      raise EJsonException.Create(SErrorTypeNotInstantiable);
  end;
  ASerializer.Populate(AReader, Result);
end;

procedure TJsonCustomCreationConverter<T>.WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
  const ASerializer: TJsonSerializer);
begin
  raise EJsonException.Create(SWriteJsonNotImplemented);
end;

{ TEnumNamesConverter }

function TJsonEnumNameConverter.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := ATypeInf^.Kind = tkEnumeration;
end;

function TJsonEnumNameConverter.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  LEnumValue: Integer;
  TypeData: PTypeData;
begin
  LEnumValue := GetEnumValue(ATypeInf, AReader.Value.AsString);
  TypeData := ATypeInf^.TypeData;
  if (LEnumValue >= TypeData^.MinValue) and (LEnumValue <= TypeData^.MaxValue) then
    TValue.Make(@LEnumValue, ATypeInf, Result)
  else
    raise EJsonException.Create(Format(SConverterStringNotMatchingEnum, [AReader.Value.AsString, ATypeInf^.Name]));
end;

procedure TJsonEnumNameConverter.WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer);
begin
  AWriter.WriteValue(GetEnumName(AValue.TypeInfo, AValue.AsOrdinal));
end;

{ TJsonStackConverter<V> }

function TJsonStackConverter<V>.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := TJsonTypeUtils.InheritsFrom(ATypeInf, TStack<V>)
end;

function TJsonStackConverter<V>.CreateInstance: TStack<V>;
begin
  Result := TStack<V>.Create;
end;

function TJsonStackConverter<V>.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  Stack: TStack<V>;
  Arr: TArray<V>;
  Val: V;
begin
  if AReader.TokenType = TJsonToken.Null then
    Result := nil
  else
  begin
    ASerializer.Populate(AReader, Arr);
    if AExistingValue.IsEmpty then
      Stack := CreateInstance
    else
      Stack := AExistingValue.AsType<TStack<V>>;
    for Val in Arr do
      Stack.Push(Val);
    Result := TValue.From(Stack);
  end;
end;

procedure TJsonStackConverter<V>.WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
  const ASerializer: TJsonSerializer);
var
  Stack: TStack<V>;
  Arr: TArray<V>;
begin
  if AValue.TryAsType(Stack) then
    ASerializer.Serialize(AWriter, Stack.ToArray)
  else
    raise EJsonException.Create(Format(SConverterNotMatchingType, [AValue.TypeInfo^.Name, TStack<V>.ClassName]));
end;

{ TJsonQueueConverter<V> }

function TJsonQueueConverter<V>.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := TJsonTypeUtils.InheritsFrom(ATypeInf, TQueue<V>)
end;

function TJsonQueueConverter<V>.CreateInstance: TQueue<V>;
begin
  Result := TQueue<V>.Create;
end;

function TJsonQueueConverter<V>.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  Queue: TQueue<V>;
  Arr: TArray<V>;
  Val: V;
begin
  if AReader.TokenType = TJsonToken.Null then
    Result := nil
  else
  begin
    ASerializer.Populate(AReader, Arr);
    if AExistingValue.IsEmpty then
      Queue := CreateInstance
    else
      Queue := AExistingValue.AsType<TQueue<V>>;
    for Val in Arr do
      Queue.Enqueue(Val);
    Result := TValue.From(Queue);
  end;
end;

procedure TJsonQueueConverter<V>.WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
  const ASerializer: TJsonSerializer);
var
  Queue: TQueue<V>;
  Arr: TArray<V>;
begin
  if AValue.TryAsType(Queue) then
    ASerializer.Serialize(AWriter, Queue.ToArray)
  else
    raise EJsonException.Create(Format(SConverterNotMatchingType, [AValue.TypeInfo^.Name, TStack<V>.ClassName]));
end;

{ TJsonSetNamesConverter }

function TJsonSetNamesConverter.CanConvert(ATypeInf: PTypeInfo): Boolean;
begin
  Result := (ATypeInf^.Kind = tkSet) and (ATypeInf^.TypeData^.CompType <> nil);
end;

function TJsonSetNamesConverter.ExtractSetValue(ATypeInf: PTypeInfo; const AValue: TValue): Int64;
begin
  case ATypeInf^.TypeData^.OrdType of
    otSByte: Result := Int8(AValue.GetReferenceToRawData^);
    otSWord: Result := Int16(AValue.GetReferenceToRawData^);
    otSLong: Result := Int32(AValue.GetReferenceToRawData^);
    otUByte: Result := UInt8(AValue.GetReferenceToRawData^);
    otUWord: Result := UInt16(AValue.GetReferenceToRawData^);
    otULong: Result := UInt32(AValue.GetReferenceToRawData^);
    else
      Result := 0;
  end;
end;

function TJsonSetNamesConverter.ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
  const ASerializer: TJsonSerializer): TValue;
var
  LSetTypeData, LEnumTypeData: PTypeData;
  LSetType: PTypeInfo;
  LEnumType: PTypeInfo;
  LSetValue: Int64;
  LEnumValue: Integer;
begin
  LSetType := ATypeInf;
  LSetTypeData := LSetType.TypeData;
  LEnumType := LSetType^.TypeData^.CompType^;
  LEnumTypeData := LEnumType^.TypeData;
  LSetValue := ExtractSetValue(LSetType, AExistingValue);
  while AReader.Read and (AReader.TokenType <> TJsonToken.EndArray) do
  begin
    LEnumValue := GetEnumValue(LEnumType, AReader.Value.AsString);
    if (LEnumValue >= LEnumTypeData^.MinValue) and (LEnumValue <= LEnumTypeData^.MaxValue) then
      LSetValue := LSetValue or (1 shl LEnumValue)
    else
      raise EJsonException.Create(Format(SConverterStringNotMatchingEnum, [AReader.Value.AsString, ATypeInf^.Name]));
  end;
 case LSetTypeData^.OrdType of
    otSByte: TValue.Make(Int8(LSetValue), LSetType, Result);
    otSWord: TValue.Make(Int16(LSetValue), LSetType, Result);
    otSLong: TValue.Make(Int32(LSetValue), LSetType, Result);
    otUByte: TValue.Make(UInt8(LSetValue), LSetType, Result);
    otUWord: TValue.Make(UInt16(LSetValue), LSetType, Result);
    otULong: TValue.Make(UInt32(LSetValue), LSetType, Result);
    else
      TValue.Make(0, LSetType, Result);
  end;
end;

procedure TJsonSetNamesConverter.WriteJson(const AWriter: TJsonWriter; const AValue: TValue; const ASerializer: TJsonSerializer);
var
  LEnumTypeData: PTypeData;
  LSetType: PTypeInfo;
  LEnumType: PTypeInfo;
  LSetValue: Int64;
  I: Integer;
begin
  LSetType := AValue.TypeInfo;
  LEnumType := LSetType^.TypeData^.CompType^;
  LEnumTypeData := LEnumType^.TypeData;
  LSetValue := ExtractSetValue(LSetType, AValue);
  AWriter.WriteStartArray;
  for I := 0 to LEnumTypeData^.MaxValue do
    if ((1 shl I) and LSetValue) > 0 then
      AWriter.WriteValue(GetEnumName(LEnumType, I));
  AWriter.WriteEndArray;
end;

end.
