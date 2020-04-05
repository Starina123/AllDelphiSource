{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFNumberFormatterCurrencyCode: Pointer = nil;
  _kCFNumberFormatterDecimalSeparator: Pointer = nil;
  _kCFNumberFormatterCurrencyDecimalSeparator: Pointer = nil;
  _kCFNumberFormatterAlwaysShowDecimalSeparator: Pointer = nil;
  _kCFNumberFormatterGroupingSeparator: Pointer = nil;
  _kCFNumberFormatterUseGroupingSeparator: Pointer = nil;
  _kCFNumberFormatterPercentSymbol: Pointer = nil;
  _kCFNumberFormatterZeroSymbol: Pointer = nil;
  _kCFNumberFormatterNaNSymbol: Pointer = nil;
  _kCFNumberFormatterInfinitySymbol: Pointer = nil;
  _kCFNumberFormatterMinusSign: Pointer = nil;
  _kCFNumberFormatterPlusSign: Pointer = nil;
  _kCFNumberFormatterCurrencySymbol: Pointer = nil;
  _kCFNumberFormatterExponentSymbol: Pointer = nil;
  _kCFNumberFormatterMinIntegerDigits: Pointer = nil;
  _kCFNumberFormatterMaxIntegerDigits: Pointer = nil;
  _kCFNumberFormatterMinFractionDigits: Pointer = nil;
  _kCFNumberFormatterMaxFractionDigits: Pointer = nil;
  _kCFNumberFormatterGroupingSize: Pointer = nil;
  _kCFNumberFormatterSecondaryGroupingSize: Pointer = nil;
  _kCFNumberFormatterRoundingMode: Pointer = nil;
  _kCFNumberFormatterRoundingIncrement: Pointer = nil;
  _kCFNumberFormatterFormatWidth: Pointer = nil;
  _kCFNumberFormatterPaddingPosition: Pointer = nil;
  _kCFNumberFormatterPaddingCharacter: Pointer = nil;
  _kCFNumberFormatterDefaultFormat: Pointer = nil;
  _kCFNumberFormatterMultiplier: Pointer = nil;
  _kCFNumberFormatterPositivePrefix: Pointer = nil;
  _kCFNumberFormatterPositiveSuffix: Pointer = nil;
  _kCFNumberFormatterNegativePrefix: Pointer = nil;
  _kCFNumberFormatterNegativeSuffix: Pointer = nil;
  _kCFNumberFormatterPerMillSymbol: Pointer = nil;
  _kCFNumberFormatterInternationalCurrencySymbol: Pointer = nil;
  _kCFNumberFormatterCurrencyGroupingSeparator: Pointer = nil;
  _kCFNumberFormatterIsLenient: Pointer = nil;
  _kCFNumberFormatterUseSignificantDigits: Pointer = nil;
  _kCFNumberFormatterMinSignificantDigits: Pointer = nil;
  _kCFNumberFormatterMaxSignificantDigits: Pointer = nil;

function kCFNumberFormatterCurrencyCode: CFStringRef;
begin
  if _kCFNumberFormatterCurrencyCode = nil then
    _kCFNumberFormatterCurrencyCode := dlsym(CFModule, PAnsiChar('kCFNumberFormatterCurrencyCode'));
  Result := CFStringRef(_kCFNumberFormatterCurrencyCode^);
end;

function kCFNumberFormatterDecimalSeparator: CFStringRef;
begin
  if _kCFNumberFormatterDecimalSeparator = nil then
    _kCFNumberFormatterDecimalSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterDecimalSeparator'));
  Result := CFStringRef(_kCFNumberFormatterDecimalSeparator^);
end;

function kCFNumberFormatterCurrencyDecimalSeparator: CFStringRef;
begin
  if _kCFNumberFormatterCurrencyDecimalSeparator = nil then
    _kCFNumberFormatterCurrencyDecimalSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterCurrencyDecimalSeparator'));
  Result := CFStringRef(_kCFNumberFormatterCurrencyDecimalSeparator^);
end;

function kCFNumberFormatterAlwaysShowDecimalSeparator: CFStringRef;
begin
  if _kCFNumberFormatterAlwaysShowDecimalSeparator = nil then
    _kCFNumberFormatterAlwaysShowDecimalSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterAlwaysShowDecimalSeparator'));
  Result := CFStringRef(_kCFNumberFormatterAlwaysShowDecimalSeparator^);
end;

function kCFNumberFormatterGroupingSeparator: CFStringRef;
begin
  if _kCFNumberFormatterGroupingSeparator = nil then
    _kCFNumberFormatterGroupingSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterGroupingSeparator'));
  Result := CFStringRef(_kCFNumberFormatterGroupingSeparator^);
end;

function kCFNumberFormatterUseGroupingSeparator: CFStringRef;
begin
  if _kCFNumberFormatterUseGroupingSeparator = nil then
    _kCFNumberFormatterUseGroupingSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterUseGroupingSeparator'));
  Result := CFStringRef(_kCFNumberFormatterUseGroupingSeparator^);
end;

function kCFNumberFormatterPercentSymbol: CFStringRef;
begin
  if _kCFNumberFormatterPercentSymbol = nil then
    _kCFNumberFormatterPercentSymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPercentSymbol'));
  Result := CFStringRef(_kCFNumberFormatterPercentSymbol^);
end;

function kCFNumberFormatterZeroSymbol: CFStringRef;
begin
  if _kCFNumberFormatterZeroSymbol = nil then
    _kCFNumberFormatterZeroSymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterZeroSymbol'));
  Result := CFStringRef(_kCFNumberFormatterZeroSymbol^);
end;

function kCFNumberFormatterNaNSymbol: CFStringRef;
begin
  if _kCFNumberFormatterNaNSymbol = nil then
    _kCFNumberFormatterNaNSymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterNaNSymbol'));
  Result := CFStringRef(_kCFNumberFormatterNaNSymbol^);
end;

function kCFNumberFormatterInfinitySymbol: CFStringRef;
begin
  if _kCFNumberFormatterInfinitySymbol = nil then
    _kCFNumberFormatterInfinitySymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterInfinitySymbol'));
  Result := CFStringRef(_kCFNumberFormatterInfinitySymbol^);
end;

function kCFNumberFormatterMinusSign: CFStringRef;
begin
  if _kCFNumberFormatterMinusSign = nil then
    _kCFNumberFormatterMinusSign := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMinusSign'));
  Result := CFStringRef(_kCFNumberFormatterMinusSign^);
end;

function kCFNumberFormatterPlusSign: CFStringRef;
begin
  if _kCFNumberFormatterPlusSign = nil then
    _kCFNumberFormatterPlusSign := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPlusSign'));
  Result := CFStringRef(_kCFNumberFormatterPlusSign^);
end;

function kCFNumberFormatterCurrencySymbol: CFStringRef;
begin
  if _kCFNumberFormatterCurrencySymbol = nil then
    _kCFNumberFormatterCurrencySymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterCurrencySymbol'));
  Result := CFStringRef(_kCFNumberFormatterCurrencySymbol^);
end;

function kCFNumberFormatterExponentSymbol: CFStringRef;
begin
  if _kCFNumberFormatterExponentSymbol = nil then
    _kCFNumberFormatterExponentSymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterExponentSymbol'));
  Result := CFStringRef(_kCFNumberFormatterExponentSymbol^);
end;

function kCFNumberFormatterMinIntegerDigits: CFStringRef;
begin
  if _kCFNumberFormatterMinIntegerDigits = nil then
    _kCFNumberFormatterMinIntegerDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMinIntegerDigits'));
  Result := CFStringRef(_kCFNumberFormatterMinIntegerDigits^);
end;

function kCFNumberFormatterMaxIntegerDigits: CFStringRef;
begin
  if _kCFNumberFormatterMaxIntegerDigits = nil then
    _kCFNumberFormatterMaxIntegerDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMaxIntegerDigits'));
  Result := CFStringRef(_kCFNumberFormatterMaxIntegerDigits^);
end;

function kCFNumberFormatterMinFractionDigits: CFStringRef;
begin
  if _kCFNumberFormatterMinFractionDigits = nil then
    _kCFNumberFormatterMinFractionDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMinFractionDigits'));
  Result := CFStringRef(_kCFNumberFormatterMinFractionDigits^);
end;

function kCFNumberFormatterMaxFractionDigits: CFStringRef;
begin
  if _kCFNumberFormatterMaxFractionDigits = nil then
    _kCFNumberFormatterMaxFractionDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMaxFractionDigits'));
  Result := CFStringRef(_kCFNumberFormatterMaxFractionDigits^);
end;

function kCFNumberFormatterGroupingSize: CFStringRef;
begin
  if _kCFNumberFormatterGroupingSize = nil then
    _kCFNumberFormatterGroupingSize := dlsym(CFModule, PAnsiChar('kCFNumberFormatterGroupingSize'));
  Result := CFStringRef(_kCFNumberFormatterGroupingSize^);
end;

function kCFNumberFormatterSecondaryGroupingSize: CFStringRef;
begin
  if _kCFNumberFormatterSecondaryGroupingSize = nil then
    _kCFNumberFormatterSecondaryGroupingSize := dlsym(CFModule, PAnsiChar('kCFNumberFormatterSecondaryGroupingSize'));
  Result := CFStringRef(_kCFNumberFormatterSecondaryGroupingSize^);
end;

function kCFNumberFormatterRoundingMode: CFStringRef;
begin
  if _kCFNumberFormatterRoundingMode = nil then
    _kCFNumberFormatterRoundingMode := dlsym(CFModule, PAnsiChar('kCFNumberFormatterRoundingMode'));
  Result := CFStringRef(_kCFNumberFormatterRoundingMode^);
end;

function kCFNumberFormatterRoundingIncrement: CFStringRef;
begin
  if _kCFNumberFormatterRoundingIncrement = nil then
    _kCFNumberFormatterRoundingIncrement := dlsym(CFModule, PAnsiChar('kCFNumberFormatterRoundingIncrement'));
  Result := CFStringRef(_kCFNumberFormatterRoundingIncrement^);
end;

function kCFNumberFormatterFormatWidth: CFStringRef;
begin
  if _kCFNumberFormatterFormatWidth = nil then
    _kCFNumberFormatterFormatWidth := dlsym(CFModule, PAnsiChar('kCFNumberFormatterFormatWidth'));
  Result := CFStringRef(_kCFNumberFormatterFormatWidth^);
end;

function kCFNumberFormatterPaddingPosition: CFStringRef;
begin
  if _kCFNumberFormatterPaddingPosition = nil then
    _kCFNumberFormatterPaddingPosition := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPaddingPosition'));
  Result := CFStringRef(_kCFNumberFormatterPaddingPosition^);
end;

function kCFNumberFormatterPaddingCharacter: CFStringRef;
begin
  if _kCFNumberFormatterPaddingCharacter = nil then
    _kCFNumberFormatterPaddingCharacter := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPaddingCharacter'));
  Result := CFStringRef(_kCFNumberFormatterPaddingCharacter^);
end;

function kCFNumberFormatterDefaultFormat: CFStringRef;
begin
  if _kCFNumberFormatterDefaultFormat = nil then
    _kCFNumberFormatterDefaultFormat := dlsym(CFModule, PAnsiChar('kCFNumberFormatterDefaultFormat'));
  Result := CFStringRef(_kCFNumberFormatterDefaultFormat^);
end;

function kCFNumberFormatterMultiplier: CFStringRef;
begin
  if _kCFNumberFormatterMultiplier = nil then
    _kCFNumberFormatterMultiplier := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMultiplier'));
  Result := CFStringRef(_kCFNumberFormatterMultiplier^);
end;

function kCFNumberFormatterPositivePrefix: CFStringRef;
begin
  if _kCFNumberFormatterPositivePrefix = nil then
    _kCFNumberFormatterPositivePrefix := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPositivePrefix'));
  Result := CFStringRef(_kCFNumberFormatterPositivePrefix^);
end;

function kCFNumberFormatterPositiveSuffix: CFStringRef;
begin
  if _kCFNumberFormatterPositiveSuffix = nil then
    _kCFNumberFormatterPositiveSuffix := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPositiveSuffix'));
  Result := CFStringRef(_kCFNumberFormatterPositiveSuffix^);
end;

function kCFNumberFormatterNegativePrefix: CFStringRef;
begin
  if _kCFNumberFormatterNegativePrefix = nil then
    _kCFNumberFormatterNegativePrefix := dlsym(CFModule, PAnsiChar('kCFNumberFormatterNegativePrefix'));
  Result := CFStringRef(_kCFNumberFormatterNegativePrefix^);
end;

function kCFNumberFormatterNegativeSuffix: CFStringRef;
begin
  if _kCFNumberFormatterNegativeSuffix = nil then
    _kCFNumberFormatterNegativeSuffix := dlsym(CFModule, PAnsiChar('kCFNumberFormatterNegativeSuffix'));
  Result := CFStringRef(_kCFNumberFormatterNegativeSuffix^);
end;

function kCFNumberFormatterPerMillSymbol: CFStringRef;
begin
  if _kCFNumberFormatterPerMillSymbol = nil then
    _kCFNumberFormatterPerMillSymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterPerMillSymbol'));
  Result := CFStringRef(_kCFNumberFormatterPerMillSymbol^);
end;

function kCFNumberFormatterInternationalCurrencySymbol: CFStringRef;
begin
  if _kCFNumberFormatterInternationalCurrencySymbol = nil then
    _kCFNumberFormatterInternationalCurrencySymbol := dlsym(CFModule, PAnsiChar('kCFNumberFormatterInternationalCurrencySymbol'));
  Result := CFStringRef(_kCFNumberFormatterInternationalCurrencySymbol^);
end;

function kCFNumberFormatterCurrencyGroupingSeparator: CFStringRef;
begin
  if _kCFNumberFormatterCurrencyGroupingSeparator = nil then
    _kCFNumberFormatterCurrencyGroupingSeparator := dlsym(CFModule, PAnsiChar('kCFNumberFormatterCurrencyGroupingSeparator'));
  Result := CFStringRef(_kCFNumberFormatterCurrencyGroupingSeparator^);
end;

function kCFNumberFormatterIsLenient: CFStringRef;
begin
  if _kCFNumberFormatterIsLenient = nil then
    _kCFNumberFormatterIsLenient := dlsym(CFModule, PAnsiChar('kCFNumberFormatterIsLenient'));
  Result := CFStringRef(_kCFNumberFormatterIsLenient^);
end;

function kCFNumberFormatterUseSignificantDigits: CFStringRef;
begin
  if _kCFNumberFormatterUseSignificantDigits = nil then
    _kCFNumberFormatterUseSignificantDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterUseSignificantDigits'));
  Result := CFStringRef(_kCFNumberFormatterUseSignificantDigits^);
end;

function kCFNumberFormatterMinSignificantDigits: CFStringRef;
begin
  if _kCFNumberFormatterMinSignificantDigits = nil then
    _kCFNumberFormatterMinSignificantDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMinSignificantDigits'));
  Result := CFStringRef(_kCFNumberFormatterMinSignificantDigits^);
end;

function kCFNumberFormatterMaxSignificantDigits: CFStringRef;
begin
  if _kCFNumberFormatterMaxSignificantDigits = nil then
    _kCFNumberFormatterMaxSignificantDigits := dlsym(CFModule, PAnsiChar('kCFNumberFormatterMaxSignificantDigits'));
  Result := CFStringRef(_kCFNumberFormatterMaxSignificantDigits^);
end;


