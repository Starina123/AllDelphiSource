{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFTypeArrayCallBacks: Pointer = nil;

function kCFTypeArrayCallBacks: CFArrayCallBacks;
begin
  if _kCFTypeArrayCallBacks = nil then
    _kCFTypeArrayCallBacks := dlsym(CFModule, PAnsiChar('kCFTypeArrayCallBacks'));
  Result := CFArrayCallBacks(_kCFTypeArrayCallBacks^);
end;


