{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Macapi.ObjCRuntime;

{$WEAKPACKAGEUNIT}

interface

const
  libobjc = 'libobjc.A.dylib';

  YES: Integer = 1;
  NO: Integer = 0;
  
type
  SEL = Pointer;
  obj_super = packed record
    receiver: Pointer;
    cls: Pointer;
  end;
  Pobj_super = ^obj_super;

// Exported C methods in the Objective-C runtime
function objc_getClass(const name: PAnsiChar): Pointer; cdecl;
  external libobjc name '_objc_getClass';
function objc_getClassList(buffer: Pointer; bufferLen: Integer): Integer; cdecl;
  external libobjc name '_objc_getClassList';
function objc_allocateClassPair(superclass: Pointer; name: PAnsiChar; ExtraBytes: Longword)
  : Pointer; cdecl; external libobjc name '_objc_allocateClassPair';
procedure objc_registerClassPair(Cls: Pointer); cdecl;
  external libobjc name '_objc_registerClassPair';
function objc_addClass(Cls: Pointer): Integer; cdecl; external libobjc name '_objc_addClass';

function objc_msgSend(theReceiver: Pointer; theSelector: Pointer): Pointer; cdecl; varargs;
  external libobjc name '_objc_msgSend';

function objc_msgSend_stret(theReceiver: Pointer; theSelector: Pointer): Extended; cdecl; varargs;
  external libobjc name '_objc_msgSend_stret';

function objc_msgSend_fpret(theReceiver: Pointer; theSelector: Pointer): Extended; cdecl; varargs;
  external libobjc name '_objc_msgSend_fpret';

function objc_msgSendSuper(theReceiver: Pobj_super; theSelector: Pointer): Pointer; cdecl; varargs;
  external libobjc name '_objc_msgSendSuper';

function objc_msgSendSuper_stret(theReceiver: Pobj_super; theSelector: Pointer): Extended; cdecl; varargs;
  external libobjc name '_objc_msgSendSuper_stret';

function objc_getProtocol(const name: PAnsiChar): Pointer; cdecl; external libobjc name '_objc_getProtocol';

function sel_getUid(const str: PAnsiChar): SEL; cdecl; external libobjc name '_sel_getUid';
function sel_registerName(const str: PAnsiChar): SEL; cdecl; external libobjc name '_sel_registerName';
function sel_getName(Selector: Pointer): PAnsiChar; cdecl; external libobjc name '_sel_getName';
function class_copyMethodList(Cls: Pointer; var OutCount: Integer): Pointer; cdecl; external libobjc name '_class_copyMethodList';
function class_addMethod(Cls: Pointer; theSelector: Pointer; Impl: Pointer; types: PAnsiChar)
  : Integer; cdecl; external libobjc name '_class_addMethod';
function class_addIvar(Cls: Pointer; name: PAnsiChar; Size: Integer; alignment: Byte;
  types: PAnsiChar): Integer; cdecl; external libobjc name '_class_addIvar';
function class_addProtocol(Cls: Pointer; protocol: Pointer): Integer; cdecl; external libobjc name '_class_addProtocol';
function class_getInstanceMethod(Cls: Pointer; Selector: Pointer): Pointer; cdecl;
  external libobjc name '_class_getInstanceMethod';
function class_getName(Cls: Pointer): PAnsiChar; cdecl; external libobjc name '_class_getName';
function object_getInstanceVariable(obj: Pointer; name: PAnsiChar; out value: Pointer): Pointer;
  cdecl; external libobjc name '_object_getInstanceVariable';
function object_getClass(obj: Pointer): Pointer;
  cdecl; external libobjc name '_object_getClass';
function object_setInstanceVariable(obj: Pointer; name: PAnsiChar; value: Pointer): Pointer; cdecl;
  external libobjc name '_object_setInstanceVariable';
function method_getTypeEncoding(Method: Pointer): PAnsiChar; cdecl;
  external libobjc name '_method_getTypeEncoding';

implementation

end.
