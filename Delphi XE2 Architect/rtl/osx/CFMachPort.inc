{*******************************************************}
{                                                       }
{              Delphi Runtime Library                   }
{                                                       }
{          File: CFMachPort.h                           }
{          Copyright (c) 1998-2009, Apple Inc.          }
{          All Rights Reserved.                         }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$IFNDEF __COREFOUNDATION_CFMACHPORT__}

{$DEFINE __COREFOUNDATION_CFMACHPORT__}

{$I CFRunLoop.inc}

type
  PCFMachPortRef = ^CFMachPortRef;
  CFMachPortRef = ^__CFMachPort;
  {$EXTERNALSYM CFMachPortRef}
  __CFMachPort = record
  end;
  {$EXTERNALSYM __CFMachPort}

  PCFMachPortContext = ^CFMachPortContext;
  CFMachPortContext = record
    version: CFIndex;
    info: Pointer;
    retain: CFAllocatorRetainCallback;
    release: CFAllocatorReleaseCallBack;
    copyDescription: CFAllocatorCopyDescriptionCallback;
  end;
  {$EXTERNALSYM CFMachPortContext}

  CFMachPortCallBack = procedure(port: CFMachPortRef; msg: Pointer; 
    size: CFIndex; info: Pointer); cdecl;
  {$EXTERNALSYM CFMachPortCallBack}
  CFMachPortInvalidationCallBack = procedure(port: CFMachPortRef; 
    info: Pointer); cdecl;
  {$EXTERNALSYM CFMachPortInvalidationCallBack}

function CFMachPortGetTypeID: CFTypeID; cdecl;
  external CoreFoundationLib name '_CFMachPortGetTypeID';
{$EXTERNALSYM CFMachPortGetTypeID}

function CFMachPortCreate(allocator: CFAllocatorRef; 
  callout: CFMachPortCallBack; context: PCFMachPortContext;
  shouldFreeInfo: PBoolean): CFMachPortRef; cdecl;
  external CoreFoundationLib name '_CFMachPortCreate';
{$EXTERNALSYM CFMachPortCreate}
function CFMachPortCreateWithPort(allocator: CFAllocatorRef; 
  portNum: mach_port_t; callout: CFMachPortCallBack; 
  context: PCFMachPortContext; shouldFreeInfo: PBoolean): CFMachPortRef; cdecl;
  external CoreFoundationLib name '_CFMachPortCreateWithPort';
{$EXTERNALSYM CFMachPortCreateWithPort}

function CFMachPortGetPort(port: CFMachPortRef): mach_port_t; cdecl;
  external CoreFoundationLib name '_CFMachPortGetPort';
{$EXTERNALSYM CFMachPortGetPort}
procedure CFMachPortGetContext(port: CFMachPortRef; 
  out context: CFMachPortContext); cdecl;
  external CoreFoundationLib name '_CFMachPortGetContext';
{$EXTERNALSYM CFMachPortGetContext}
procedure CFMachPortInvalidate(port: CFMachPortRef); cdecl;
  external CoreFoundationLib name '_CFMachPortInvalidate';
{$EXTERNALSYM CFMachPortInvalidate}
function CFMachPortIsValid(port: CFMachPortRef): Boolean; cdecl;
  external CoreFoundationLib name '_CFMachPortIsValid';
{$EXTERNALSYM CFMachPortIsValid}
function CFMachPortGetInvalidationCallBack(
  port: CFMachPortRef): CFMachPortInvalidationCallBack; cdecl;
  external CoreFoundationLib name '_CFMachPortGetInvalidationCallBack';
{$EXTERNALSYM CFMachPortGetInvalidationCallBack}
procedure CFMachPortSetInvalidationCallBack(port: CFMachPortRef; 
  callout: CFMachPortInvalidationCallBack); cdecl;
  external CoreFoundationLib name '_CFMachPortSetInvalidationCallBack';
{$EXTERNALSYM CFMachPortSetInvalidationCallBack}

function CFMachPortCreateRunLoopSource(allocator: CFAllocatorRef; 
  port: CFMachPortRef; order: CFIndex): CFRunLoopSourceRef; cdecl;
  external CoreFoundationLib name '_CFMachPortCreateRunLoopSource';
{$EXTERNALSYM CFMachPortCreateRunLoopSource}


{$ENDIF !__COREFOUNDATION_CFMACHPORT__}

