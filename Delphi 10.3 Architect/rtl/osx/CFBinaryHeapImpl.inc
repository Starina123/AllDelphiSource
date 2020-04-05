{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


var
  _kCFStringBinaryHeapCallBacks: Pointer = nil;

function kCFStringBinaryHeapCallBacks: CFBinaryHeapCallBacks;
begin
  if _kCFStringBinaryHeapCallBacks = nil then
    _kCFStringBinaryHeapCallBacks := dlsym(CFModule, MarshaledAString('kCFStringBinaryHeapCallBacks'));
  Result := CFBinaryHeapCallBacks(_kCFStringBinaryHeapCallBacks^);
end;

