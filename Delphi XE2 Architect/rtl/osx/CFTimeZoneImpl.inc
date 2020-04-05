{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFTimeZoneSystemTimeZoneDidChangeNotification: Pointer = nil;

function kCFTimeZoneSystemTimeZoneDidChangeNotification: CFStringRef;
begin
  if _kCFTimeZoneSystemTimeZoneDidChangeNotification = nil then
    _kCFTimeZoneSystemTimeZoneDidChangeNotification := dlsym(CFModule, PAnsiChar('kCFTimeZoneSystemTimeZoneDidChangeNotification'));
  Result := _kCFTimeZoneSystemTimeZoneDidChangeNotification;
end;
