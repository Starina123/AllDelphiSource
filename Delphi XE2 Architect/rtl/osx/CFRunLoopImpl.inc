{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

var
  _kCFRunLoopDefaultMode: Pointer = nil;
  _kCFRunLoopCommonModes: Pointer = nil;

function kCFRunLoopDefaultMode: CFStringRef;
begin
  if _kCFRunLoopDefaultMode = nil then
    _kCFRunLoopDefaultMode := dlsym(CFModule, PAnsiChar('kCFRunLoopDefaultMode'));
  Result := CFStringRef(_kCFRunLoopDefaultMode^);
end;

function kCFRunLoopCommonModes: CFStringRef;
begin
  if _kCFRunLoopCommonModes = nil then
    _kCFRunLoopCommonModes := dlsym(CFModule, PAnsiChar('kCFRunLoopCommonModes'));
  Result := CFStringRef(_kCFRunLoopCommonModes^);
end;
