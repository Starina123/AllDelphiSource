{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{      Copyright(c) 1995-2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{  Helpers for C++ JSON binding.                        }
{*******************************************************}

unit System.Internal.JSONHlpr;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

uses System.Json;

procedure InitInstantiations(I: Integer);

implementation

uses System.SysUtils;

type
  TJSONHlpr = class
    class function HelperGetValue<T>(JV: TJSONValue; const APath: string; const AValue: T): T; static;
  end;

class function TJSONHlpr.HelperGetValue<T>(JV: TJSONValue; const APath: string; const AValue: T): T;
var
  Val: T;
begin
  Val := AValue;
  if JV.TryGetValue(APath, Val) then
    Val := JV.GetValue<T>(APath, Val)
  else if JV.TryGetValue<T>(Val) then
    Val := JV.GetValue<T>(APath);
  Result := Val;
end;

var
  g_JSONArray: TJSONArray;
  g_JSONObject: TJSONObject;

function JSONGetValue(JSONVal: TJSONValue; const APath: string; I: Integer; const ADefaultValue: Variant): Variant;
begin
  Result := ADefaultValue;
  if JSONVal = nil then
    Exit;
  case I of
    0:  Result := TJSONHlpr.HelperGetValue<string>(JSONVal, APath, string(''));
{$IFNDEF NEXTGEN}
    1:  Result := TJSONHlpr.HelperGetValue<AnsiChar>(JSONVal, APath, AnsiChar(0));
    2:  Result := TJSONHlpr.HelperGetValue<WideString>(JSONVal, APath, WideString(''));
    3:  Result := TJSONHlpr.HelperGetValue<AnsiString>(JSONVal, APath, AnsiString(''));
{$ENDIF}
    4:  Result := TJSONHlpr.HelperGetValue<UTF8String>(JSONVal, APath, UTF8String(''));
    5:  Result := TJSONHlpr.HelperGetValue<Cardinal>(JSONVal, APath, Cardinal(0));
    6:  Result := TJSONHlpr.HelperGetValue<Integer>(JSONVal, APath, 0);
    7:  Result := TJSONHlpr.HelperGetValue<ShortInt>(JSONVal, APath, ShortInt(0));
    8:  Result := TJSONHlpr.HelperGetValue<Word>(JSONVal, APath, Word(0));
    9:  Result := TJSONHlpr.HelperGetValue<Byte>(JSONVal, APath, Byte(0));
    10: Result := TJSONHlpr.HelperGetValue<SmallInt>(JSONVal, APath, SmallInt(0));
    11: Result := TJSONHlpr.HelperGetValue<Char>(JSONVal, APath, Char(0));
    12: Result := TJSONHlpr.HelperGetValue<Boolean>(JSONVal, APath, False);
    13: Result := TJSONHlpr.HelperGetValue<WideChar>(JSONVal, APath, WideChar(0));
    14: Result := TJSONHlpr.HelperGetValue<Real>(JSONVal, APath, Real(0.0));
    15: Result := TJSONHlpr.HelperGetValue<Double>(JSONVal, APath, Double(0.0));
    16: Result := TJSONHlpr.HelperGetValue<Extended>(JSONVal, APath, Extended(0.0));
    17: Result := TJSONHlpr.HelperGetValue<Int64>(JSONVal, APath, Int64(0));
    18: Result := TJSONHlpr.HelperGetValue<UInt64>(JSONVal, APath, UInt64(0));
    19: Result := TJSONHlpr.HelperGetValue<Currency>(JSONVal, APath, Currency(0));
    20: Result := TJSONHlpr.HelperGetValue<TDateTime>(JSONVal, APath, Now);
    21:           TJSONHlpr.HelperGetValue<TJSONArray>(JSONVal, APath, g_JSONArray);
    22:           TJSONHlpr.HelperGetValue<TJSONObject>(JSONVal, APath, g_JSONObject);
  end;
end;

procedure InitInstantiations(I: Integer);
begin
  JSONGetValue(nil, '', I, '');
end;

end.
