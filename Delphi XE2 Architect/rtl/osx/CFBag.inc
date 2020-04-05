{*******************************************************}
{                                                       }
{              Delphi Runtime Library                   }
{                                                       }
{          File: CFBag.h                                }
{          Copyright (c) 1998-2009, Apple Inc.          }
{          All Rights Reserved.                         }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$IFNDEF __COREFOUNDATION_CFBAG__}

{$DEFINE __COREFOUNDATION_CFBAG__}

{$I CFBase.inc}

type
  CFBagRetainCallBack = function(allocator: CFAllocatorRef; 
    value: Pointer): Pointer; cdecl;
  {$EXTERNALSYM CFBagRetainCallBack}
  CFBagReleaseCallBack = procedure(allocator: CFAllocatorRef; 
    value: Pointer); cdecl;
  {$EXTERNALSYM CFBagReleaseCallBack}
  CFBagCopyDescriptionCallBack = function(value: Pointer): CFStringRef; cdecl;
  {$EXTERNALSYM CFBagCopyDescriptionCallBack}
  CFBagEqualCallBack = function(value1: Pointer; 
    value2: Pointer): Boolean; cdecl;
  {$EXTERNALSYM CFBagEqualCallBack}
  CFBagHashCallBack = function(value: Pointer): CFHashCode; cdecl;
  {$EXTERNALSYM CFBagHashCallBack}

  PCFBagCallBacks = ^CFBagCallBacks;
  CFBagCallBacks = record
    version: CFIndex;
    retain: CFBagRetainCallBack;
    release: CFBagReleaseCallBack;
    copyDescription: CFBagCopyDescriptionCallBack;
    equal: CFBagEqualCallBack;
    hash: CFBagHashCallBack;
  end;
  {$EXTERNALSYM CFBagCallBacks}

function kCFTypeBagCallBacks: CFBagCallBacks;
{$EXTERNALSYM kCFTypeBagCallBacks}
function kCFCopyStringBagCallBacks: CFBagCallBacks;
{$EXTERNALSYM kCFCopyStringBagCallBacks}

type
  CFBagApplierFunction = procedure(value: Pointer; context: Pointer); cdecl;
  {$EXTERNALSYM CFBagApplierFunction}

  PCFBagRef = ^CFBagRef;
  CFBagRef = ^__CFBag;
  {$EXTERNALSYM CFBagRef}
  __CFBag = record
  end;
  {$EXTERNALSYM __CFBag}

  PCFMutableBagRef = ^CFMutableBagRef;
  CFMutableBagRef = ^__CFBag;
  {$EXTERNALSYM CFMutableBagRef}

function CFBagGetTypeID: CFTypeID; cdecl;
  external CoreFoundationLib name '_CFBagGetTypeID';
{$EXTERNALSYM CFBagGetTypeID}

function CFBagCreate(allocator: CFAllocatorRef; values: Pointer;
  numValues: CFIndex; callBacks: PCFBagCallBacks): CFBagRef; cdecl;
  external CoreFoundationLib name '_CFBagCreate';
{$EXTERNALSYM CFBagCreate}

function CFBagCreateCopy(allocator: CFAllocatorRef;
  theBag: CFBagRef): CFBagRef; cdecl;
  external CoreFoundationLib name '_CFBagCreateCopy';
{$EXTERNALSYM CFBagCreateCopy}

function CFBagCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex;
  callBacks: PCFBagCallBacks): CFMutableBagRef; cdecl;
  external CoreFoundationLib name '_CFBagCreateMutable';
{$EXTERNALSYM CFBagCreateMutable}

function CFBagCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theBag: CFBagRef): CFMutableBagRef; cdecl;
  external CoreFoundationLib name '_CFBagCreateMutableCopy';
{$EXTERNALSYM CFBagCreateMutableCopy}

function CFBagGetCount(theBag: CFBagRef): CFIndex; cdecl;
  external CoreFoundationLib name '_CFBagGetCount';
{$EXTERNALSYM CFBagGetCount}

function CFBagGetCountOfValue(theBag: CFBagRef; value: Pointer): CFIndex; cdecl;
  external CoreFoundationLib name '_CFBagGetCountOfValue';
{$EXTERNALSYM CFBagGetCountOfValue}

function CFBagContainsValue(theBag: CFBagRef; value: Pointer): Boolean; cdecl;
  external CoreFoundationLib name '_CFBagContainsValue';
{$EXTERNALSYM CFBagContainsValue}

function CFBagGetValue(theBag: CFBagRef; value: Pointer): Pointer; cdecl;
  external CoreFoundationLib name '_CFBagGetValue';
{$EXTERNALSYM CFBagGetValue}

function CFBagGetValueIfPresent(theBag: CFBagRef; candidate: Pointer;
  value: Pointer): Boolean; cdecl;
  external CoreFoundationLib name '_CFBagGetValueIfPresent';
{$EXTERNALSYM CFBagGetValueIfPresent}

procedure CFBagGetValues(theBag: CFBagRef; values: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagGetValues';
{$EXTERNALSYM CFBagGetValues}

procedure CFBagApplyFunction(theBag: CFBagRef; applier: CFBagApplierFunction;
  context: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagApplyFunction';
{$EXTERNALSYM CFBagApplyFunction}

procedure CFBagAddValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagAddValue';
{$EXTERNALSYM CFBagAddValue}

procedure CFBagReplaceValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagReplaceValue';
{$EXTERNALSYM CFBagReplaceValue}

procedure CFBagSetValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagSetValue';
{$EXTERNALSYM CFBagSetValue}

procedure CFBagRemoveValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external CoreFoundationLib name '_CFBagRemoveValue';
{$EXTERNALSYM CFBagRemoveValue}

procedure CFBagRemoveAllValues(theBag: CFMutableBagRef); cdecl;
  external CoreFoundationLib name '_CFBagRemoveAllValues';
{$EXTERNALSYM CFBagRemoveAllValues}

{$ENDIF !__COREFOUNDATION_CFBAG__}

