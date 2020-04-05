{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFCoreFoundationVersionNumber: Pointer = nil;


function kCFCoreFoundationVersionNumber: Double;
begin
  if _kCFCoreFoundationVersionNumber = nil then
    _kCFCoreFoundationVersionNumber := dlsym(CFModule, PAnsiChar('kCFCoreFoundationVersionNumber'));
  Result := Double(_kCFCoreFoundationVersionNumber^);
end;

function CFRangeMake(loc: CFIndex; len: CFIndex): CFRange;
begin
  Result.location := loc;
  Result.length := len;
end;

var
  _kCFNull: Pointer = nil;
  _kCFAllocatorDefault: Pointer = nil;
  _kCFAllocatorSystemDefault: Pointer = nil;
  _kCFAllocatorMalloc: Pointer = nil;
  _kCFAllocatorMallocZone: Pointer = nil;
  _kCFAllocatorNull: Pointer = nil;
  _kCFAllocatorUseContext: Pointer = nil;

function kCFNull: CFNullRef;
begin
  if _kCFNull = nil then
    _kCFNull := dlsym(CFModule, PAnsiChar('kCFNull'));
  Result := CFNullRef(_kCFNull^);
end;

function kCFAllocatorDefault: CFAllocatorRef;
begin
  if _kCFAllocatorDefault = nil then
    _kCFAllocatorDefault := dlsym(CFModule, PAnsiChar('kCFAllocatorDefault'));
  Result := CFAllocatorRef(_kCFAllocatorDefault^);
end;

function kCFAllocatorSystemDefault: CFAllocatorRef;
begin
  if _kCFAllocatorSystemDefault = nil then
    _kCFAllocatorSystemDefault := dlsym(CFModule, PAnsiChar('kCFAllocatorSystemDefault'));
  Result := CFAllocatorRef(_kCFAllocatorSystemDefault^);
end;

function kCFAllocatorMalloc: CFAllocatorRef;
begin
  if _kCFAllocatorMalloc = nil then
    _kCFAllocatorMalloc := dlsym(CFModule, PAnsiChar('kCFAllocatorMalloc'));
  Result := CFAllocatorRef(_kCFAllocatorMalloc^);
end;

function kCFAllocatorMallocZone: CFAllocatorRef;
begin
  if _kCFAllocatorMallocZone = nil then
    _kCFAllocatorMallocZone := dlsym(CFModule, PAnsiChar('kCFAllocatorMallocZone'));
  Result := CFAllocatorRef(_kCFAllocatorMallocZone^);
end;

function kCFAllocatorNull: CFAllocatorRef;
begin
  if _kCFAllocatorNull = nil then
    _kCFAllocatorNull := dlsym(CFModule, PAnsiChar('kCFAllocatorNull'));
  Result := CFAllocatorRef(_kCFAllocatorNull^);
end;

function kCFAllocatorUseContext: CFAllocatorRef;
begin
  if _kCFAllocatorUseContext = nil then
    _kCFAllocatorUseContext := dlsym(CFModule, PAnsiChar('kCFAllocatorUseContext'));
  Result := CFAllocatorRef(_kCFAllocatorUseContext^);
end;

