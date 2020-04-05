{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.Json;

/// <summary>
/// REST.Json implements a TJson class that offers several convenience methods:
/// - converting Objects to Json and vice versa
/// - formating Json
/// </summary>

interface

uses
  System.JSON,
  REST.JsonReflect;

type
  TJsonOption = (joIgnoreEmptyStrings, joIgnoreEmptyArrays, joDateIsUTC, joDateFormatUnix, joDateFormatISO8601, joDateFormatMongo, joDateFormatParse);
  TJsonOptions = set of TJsonOption;

  TJson = class(TObject)
  private
    class function ObjectToJsonValue(AObject: TObject; AOptions: TJsonOptions): TJSONValue; static;
    class procedure ProcessOptions(AJsonObject: TJSONObject; AOptions: TJsonOptions); static;
  public
    /// <summary>
    /// Converts any TObject descendant into its Json representation.
    /// </summary>
    class function ObjectToJsonObject(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSONObject;
    /// <summary>
    ///   Converts any TObject decendant into its Json string representation. The resulting string has proper Json
    ///   encoding applied.
    /// </summary>
    class function ObjectToJsonString(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): string;
    class function JsonToObject<T: class, constructor>(AJsonObject: TJSONObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T; overload;
    class function JsonToObject<T: class, constructor>(const AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T; overload;
    class procedure JsonToObject(AObject: TObject; AJsonObject: TJSONObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]); overload;
    class function Format(AJsonValue: TJSONValue): string; deprecated 'Use TJSONAncestor.Format instead';

    /// <summary>
    ///   Encodes the string representation of a TJSONValue descendant so that line breaks, tabulators etc are escaped
    ///   using backslashes.
    /// </summary>
    /// <example>
    ///   {"name":"something\else"} will be encoded as {"name":"something\\else"}
    /// </example>
    class function JsonEncode(AJsonValue: TJSONValue): string; overload;
    class function JsonEncode(const AJsonString: String): string; overload;
  end;

implementation

uses
  System.DateUtils, System.SysUtils, System.Rtti, System.Character, System.JSONConsts,
  System.Generics.Collections,
  REST.Json.Types;

class function TJson.Format(AJsonValue: TJSONValue): string;
begin
  Result := AJsonValue.Format;
end;

class function TJson.JsonToObject<T>(const AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T;
var
  LJson: string;
  LJSONValue: TJSONValue;
  LJSONObject: TJSONObject;
begin
  LJSONValue := TJSONObject.ParseJSONValue(AJson);
  LJSONObject := nil;
  try
    if Assigned(LJSONValue) and (LJSONValue is TJSONObject) then
      LJSONObject := LJSONValue as TJSONObject
    else
    begin
      LJson := AJson.Trim;
      if (LJson = '') and not Assigned(LJSONValue) or
         (LJson <> '') and Assigned(LJSONValue) and LJSONValue.Null then
        Exit(nil)
      else
        raise EConversionError.Create(SCannotCreateObject);
    end;
    Result := JsonToObject<T>(LJSONObject, AOptions);
  finally
    LJSONValue.Free;
  end;
end;

class function TJson.JsonEncode(AJsonValue: TJSONValue): string;
var
  LBytes: TBytes;
begin
  SetLength(LBytes, AJsonValue.ToString.Length * 6); // Length can not be predicted. Worst case: every single char gets escaped
  SetLength(LBytes, AJsonValue.ToBytes(LBytes, 0));  // adjust Array to actual length
  Result := TEncoding.UTF8.GetString(LBytes);
end;

class function TJson.JsonEncode(const AJsonString: string): string;
var
  LJsonValue: TJSONValue;
begin
  LJsonValue := TJSONObject.ParseJSONValue(AJsonString);
  try
    Result := JsonEncode(LJsonValue);
  finally
    LJsonValue.Free;
  end;
end;

class procedure TJson.JsonToObject(AObject: TObject; AJsonObject: TJSONObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]);
var
  LUnMarshaler: TJSONUnMarshal;
begin
  LUnMarshaler := TJSONUnMarshal.Create;
  try
    LUnMarshaler.DateTimeIsUTC  := joDateIsUTC in AOptions;
    if joDateFormatUnix in AOptions then
      LUnMarshaler.DateFormat :=jdfUnix
    else if joDateFormatISO8601 in AOptions then
     LUnMarshaler.DateFormat := jdfISO8601
    else if joDateFormatMongo in AOptions then
      LUnMarshaler.DateFormat := jdfMongo
    else if joDateFormatParse in AOptions then
      LUnMarshaler.DateFormat := jdfParse;

    ProcessOptions(AJsonObject, AOptions);

    LUnMarshaler.CreateObject(AObject.ClassType, AJsonObject, AObject);
  finally
    LUnMarshaler.Free;
  end;
end;

class function TJson.JsonToObject<T>(AJsonObject: TJSONObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T;
var
  LUnMarshaler: TJSONUnMarshal;
begin
  if AJsonObject = nil then
    Exit(nil);

  LUnMarshaler := TJSONUnMarshal.Create;
  try
    LUnMarshaler.DateTimeIsUTC  := joDateIsUTC in AOptions;
    if joDateFormatUnix in AOptions then
      LUnMarshaler.DateFormat :=jdfUnix
    else if joDateFormatISO8601 in AOptions then
      LUnMarshaler.DateFormat := jdfISO8601
    else if joDateFormatMongo in AOptions then
      LUnMarshaler.DateFormat := jdfMongo
    else if joDateFormatParse in AOptions then
      LUnMarshaler.DateFormat := jdfParse;

    ProcessOptions(AJSONObject, AOptions);

    Result := LUnMarshaler.CreateObject(T, AJsonObject) as T;
  finally
    LUnMarshaler.Free;
  end;
end;

class function TJson.ObjectToJsonValue(AObject: TObject; AOptions: TJsonOptions): TJSONValue;
var
  LMarshaler: TJSONMarshal;
begin
  LMarshaler := TJSONMarshal.Create(TJSONConverter.Create);
  try
    LMarshaler.DateTimeIsUTC  := joDateIsUTC in AOptions;
    if joDateFormatUnix in AOptions then
      LMarshaler.DateFormat :=jdfUnix
    else if joDateFormatISO8601 in AOptions then
      LMarshaler.DateFormat := jdfISO8601
    else if joDateFormatMongo in AOptions then
      LMarshaler.DateFormat := jdfMongo
    else if joDateFormatParse in AOptions then
      LMarshaler.DateFormat := jdfParse;

    Result := LMarshaler.Marshal(AObject);
    if Result is TJSONObject then
      ProcessOptions(TJSONObject(Result), AOptions);
  finally
    LMarshaler.Free;
  end;
end;

class function TJson.ObjectToJsonObject(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSONObject;
var
  LJSONValue: TJSONValue;
begin
  LJSONValue := ObjectToJsonValue(AObject, AOptions);
  if LJSONValue.Null then
  begin
    LJSONValue.Free;
    Result := nil;
  end
  else
    Result := LJSONValue as TJSONObject;
end;

class function TJson.ObjectToJsonString(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): string;
var
  LJSONValue: TJSONValue;
begin
  LJSONValue := ObjectToJsonValue(AObject, AOptions);
  try
    Result := JsonEncode(LJSONValue);
  finally
    LJSONValue.Free;
  end;
end;

class procedure TJson.ProcessOptions(AJsonObject: TJSONObject; AOptions: TJsonOptions);
var
  LPair: TJSONPair;
  LItem: TObject;
  i: Integer;

  function IsEmpty(ASet: TJsonOptions): Boolean;
  var
    LElement: TJsonOption;
  begin
    Result := True;
    for LElement in ASet do
    begin
      Result := False;
      break;
    end;
  end;

begin
  if Assigned(AJsonObject) and not IsEmpty(AOptions) then

    for i := AJsonObject.Count - 1 downto 0 do
    begin
      LPair := TJSONPair(AJsonObject.Pairs[i]);
      if LPair.JsonValue is TJSONObject then
        ProcessOptions(TJSONObject(LPair.JsonValue), AOptions)
      else if LPair.JsonValue is TJSONArray then
      begin
        if (joIgnoreEmptyArrays in AOptions) and (TJSONArray(LPair.JsonValue).Count = 0) then
          AJsonObject.RemovePair(LPair.JsonString.Value).DisposeOf
        else
          for LItem in TJSONArray(LPair.JsonValue) do
            if LItem is TJSONObject then
              ProcessOptions(TJSONObject(LItem), AOptions)
      end
      else
        if (joIgnoreEmptyStrings in AOptions) and (LPair.JsonValue.value = '') then
          AJsonObject.RemovePair(LPair.JsonString.Value).DisposeOf;
    end;
end;

end.
