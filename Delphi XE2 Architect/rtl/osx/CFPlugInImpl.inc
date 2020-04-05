{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFPlugInDynamicRegistrationKey: Pointer = nil;
  _kCFPlugInDynamicRegisterFunctionKey: Pointer = nil;
  _kCFPlugInUnloadFunctionKey: Pointer = nil;
  _kCFPlugInFactoriesKey: Pointer = nil;
  _kCFPlugInTypesKey: Pointer = nil;

function kCFPlugInDynamicRegistrationKey: CFStringRef;
begin
  if _kCFPlugInDynamicRegistrationKey = nil then
    _kCFPlugInDynamicRegistrationKey := dlsym(CFModule, PAnsiChar('kCFPlugInDynamicRegistrationKey'));
  Result := CFStringRef(_kCFPlugInDynamicRegistrationKey^);
end;

function kCFPlugInDynamicRegisterFunctionKey: CFStringRef;
begin
  if _kCFPlugInDynamicRegisterFunctionKey = nil then
    _kCFPlugInDynamicRegisterFunctionKey := dlsym(CFModule, PAnsiChar('kCFPlugInDynamicRegisterFunctionKey'));
  Result := CFStringRef(_kCFPlugInDynamicRegisterFunctionKey^);
end;

function kCFPlugInUnloadFunctionKey: CFStringRef;
begin
  if _kCFPlugInUnloadFunctionKey = nil then
    _kCFPlugInUnloadFunctionKey := dlsym(CFModule, PAnsiChar('kCFPlugInUnloadFunctionKey'));
  Result := CFStringRef(_kCFPlugInUnloadFunctionKey^);
end;

function kCFPlugInFactoriesKey: CFStringRef;
begin
  if _kCFPlugInFactoriesKey = nil then
    _kCFPlugInFactoriesKey := dlsym(CFModule, PAnsiChar('kCFPlugInFactoriesKey'));
  Result := CFStringRef(_kCFPlugInFactoriesKey^);
end;

function kCFPlugInTypesKey: CFStringRef;
begin
  if _kCFPlugInTypesKey = nil then
    _kCFPlugInTypesKey := dlsym(CFModule, PAnsiChar('kCFPlugInTypesKey'));
  Result := CFStringRef(_kCFPlugInTypesKey^);
end;

