{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFTypeSetCallBacks: Pointer = nil;
  _kCFCopyStringSetCallBacks: Pointer = nil;

function kCFTypeSetCallBacks: CFSetCallBacks;
begin
  if _kCFTypeSetCallBacks = nil then
    _kCFTypeSetCallBacks := dlsym(CFModule, PAnsiChar('kCFTypeSetCallBacks'));
  Result := CFSetCallBacks(_kCFTypeSetCallBacks^);
end;

function kCFCopyStringSetCallBacks: CFSetCallBacks;
begin
  if _kCFCopyStringSetCallBacks = nil then
    _kCFCopyStringSetCallBacks := dlsym(CFModule, PAnsiChar('kCFCopyStringSetCallBacks'));
  Result := CFSetCallBacks(_kCFCopyStringSetCallBacks^);
end;

