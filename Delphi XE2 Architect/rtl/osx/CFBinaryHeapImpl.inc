{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFStringBinaryHeapCallBacks: Pointer = nil;

function kCFStringBinaryHeapCallBacks: CFBinaryHeapCallBacks;
begin
  if _kCFStringBinaryHeapCallBacks = nil then
    _kCFStringBinaryHeapCallBacks := dlsym(CFModule, PAnsiChar('kCFStringBinaryHeapCallBacks'));
  Result := CFBinaryHeapCallBacks(_kCFStringBinaryHeapCallBacks^);
end;

