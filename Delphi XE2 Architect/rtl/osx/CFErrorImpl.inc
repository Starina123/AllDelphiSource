{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFErrorDomainPOSIX: Pointer = nil;
  _kCFErrorDomainOSStatus: Pointer = nil;
  _kCFErrorDomainMach: Pointer = nil;
  _kCFErrorDomainCocoa: Pointer = nil;
  _kCFErrorLocalizedDescriptionKey: Pointer = nil;
  _kCFErrorLocalizedFailureReasonKey: Pointer = nil;
  _kCFErrorLocalizedRecoverySuggestionKey: Pointer = nil;
  _kCFErrorDescriptionKey: Pointer = nil;
  _kCFErrorUnderlyingErrorKey: Pointer = nil;

function kCFErrorDomainPOSIX: CFStringRef;
begin
  if _kCFErrorDomainPOSIX = nil then
    _kCFErrorDomainPOSIX := dlsym(CFModule, PAnsiChar('kCFErrorDomainPOSIX'));
  Result := CFStringRef(_kCFErrorDomainPOSIX^);
end;

function kCFErrorDomainOSStatus: CFStringRef;
begin
  if _kCFErrorDomainOSStatus = nil then
    _kCFErrorDomainOSStatus := dlsym(CFModule, PAnsiChar('kCFErrorDomainOSStatus'));
  Result := CFStringRef(_kCFErrorDomainOSStatus^);
end;

function kCFErrorDomainMach: CFStringRef;
begin
  if _kCFErrorDomainMach = nil then
    _kCFErrorDomainMach := dlsym(CFModule, PAnsiChar('kCFErrorDomainMach'));
  Result := CFStringRef(_kCFErrorDomainMach^);
end;

function kCFErrorDomainCocoa: CFStringRef;
begin
  if _kCFErrorDomainCocoa = nil then
    _kCFErrorDomainCocoa := dlsym(CFModule, PAnsiChar('kCFErrorDomainCocoa'));
  Result := CFStringRef(_kCFErrorDomainCocoa^);
end;

function kCFErrorLocalizedDescriptionKey: CFStringRef;
begin
  if _kCFErrorLocalizedDescriptionKey = nil then
    _kCFErrorLocalizedDescriptionKey := dlsym(CFModule, PAnsiChar('kCFErrorLocalizedDescriptionKey'));
  Result := CFStringRef(_kCFErrorLocalizedDescriptionKey^);
end;

function kCFErrorLocalizedFailureReasonKey: CFStringRef;
begin
  if _kCFErrorLocalizedFailureReasonKey = nil then
    _kCFErrorLocalizedFailureReasonKey := dlsym(CFModule, PAnsiChar('kCFErrorLocalizedFailureReasonKey'));
  Result := CFStringRef(_kCFErrorLocalizedFailureReasonKey^);
end;

function kCFErrorLocalizedRecoverySuggestionKey: CFStringRef;
begin
  if _kCFErrorLocalizedRecoverySuggestionKey = nil then
    _kCFErrorLocalizedRecoverySuggestionKey := dlsym(CFModule, PAnsiChar('kCFErrorLocalizedRecoverySuggestionKey'));
  Result := CFStringRef(_kCFErrorLocalizedRecoverySuggestionKey^);
end;

function kCFErrorDescriptionKey: CFStringRef;
begin
  if _kCFErrorDescriptionKey = nil then
    _kCFErrorDescriptionKey := dlsym(CFModule, PAnsiChar('kCFErrorDescriptionKey'));
  Result := CFStringRef(_kCFErrorDescriptionKey^);
end;

function kCFErrorUnderlyingErrorKey: CFStringRef;
begin
  if _kCFErrorUnderlyingErrorKey = nil then
    _kCFErrorUnderlyingErrorKey := dlsym(CFModule, PAnsiChar('kCFErrorUnderlyingErrorKey'));
  Result := CFStringRef(_kCFErrorUnderlyingErrorKey^);
end;

