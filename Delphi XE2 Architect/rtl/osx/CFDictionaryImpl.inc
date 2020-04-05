{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFTypeDictionaryKeyCallBacks: Pointer = nil;
  _kCFCopyStringDictionaryKeyCallBacks: Pointer = nil;
  _kCFTypeDictionaryValueCallBacks: Pointer = nil;

function kCFTypeDictionaryKeyCallBacks: CFDictionaryKeyCallBacks;
begin
  if _kCFTypeDictionaryKeyCallBacks = nil then
    _kCFTypeDictionaryKeyCallBacks := dlsym(CFModule, PAnsiChar('kCFTypeDictionaryKeyCallBacks'));
  Result := CFDictionaryKeyCallBacks(_kCFTypeDictionaryKeyCallBacks^);
end;

function kCFCopyStringDictionaryKeyCallBacks: CFDictionaryKeyCallBacks;
begin
  if _kCFCopyStringDictionaryKeyCallBacks = nil then
    _kCFCopyStringDictionaryKeyCallBacks := dlsym(CFModule, PAnsiChar('kCFCopyStringDictionaryKeyCallBacks'));
  Result := CFDictionaryKeyCallBacks(_kCFCopyStringDictionaryKeyCallBacks^);
end;

function kCFTypeDictionaryValueCallBacks: CFDictionaryValueCallBacks;
begin
  if _kCFTypeDictionaryValueCallBacks = nil then
    _kCFTypeDictionaryValueCallBacks := dlsym(CFModule, PAnsiChar('kCFTypeDictionaryValueCallBacks'));
  Result := CFDictionaryValueCallBacks(_kCFTypeDictionaryValueCallBacks^);
end;

