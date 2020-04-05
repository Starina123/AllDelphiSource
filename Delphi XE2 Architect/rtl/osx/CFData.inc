{*******************************************************}
{                                                       }
{              Delphi Runtime Library                   }
{                                                       }
{          File: CFData.h                               }
{          Copyright (c) 1998-2009, Apple Inc.          }
{          All Rights Reserved.                         }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$IF NOT DEFINED(__COREFOUNDATION_CFDATA__)}

{$DEFINE __COREFOUNDATION_CFDATA__}

{$I CFBase.inc}

type
  PCFDataRef = ^CFDataRef;
  CFDataRef = ^__CFData;
  {$EXTERNALSYM CFDataRef}
  __CFData = record
  end;
  {$EXTERNALSYM __CFData}

  PCFMutableDataRef = ^CFMutableDataRef;
  CFMutableDataRef = ^__CFData;
  {$EXTERNALSYM CFMutableDataRef}

function CFDataGetTypeID: CFTypeID; cdecl;
  external CoreFoundationLib name '_CFDataGetTypeID';
{$EXTERNALSYM CFDataGetTypeID}

function CFDataCreate(allocator: CFAllocatorRef; bytes: PByte;
  length: CFIndex): CFDataRef; cdecl;
  external CoreFoundationLib name '_CFDataCreate';
{$EXTERNALSYM CFDataCreate}

function CFDataCreateWithBytesNoCopy(allocator: CFAllocatorRef;
  bytes: PByte; length: CFIndex; bytesDeallocator: CFAllocatorRef): CFDataRef; cdecl;
  external CoreFoundationLib name '_CFDataCreateWithBytesNoCopy';
{$EXTERNALSYM CFDataCreateWithBytesNoCopy}
{ Pass kCFAllocatorNull as bytesDeallocator to assure the bytes aren't freed }

function CFDataCreateCopy(allocator: CFAllocatorRef; theData: CFDataRef): CFDataRef; cdecl;
  external CoreFoundationLib name '_CFDataCreateCopy';
{$EXTERNALSYM CFDataCreateCopy}

function CFDataCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex): CFMutableDataRef; cdecl;
  external CoreFoundationLib name '_CFDataCreateMutable';
{$EXTERNALSYM CFDataCreateMutable}

function CFDataCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theData: CFDataRef): CFMutableDataRef; cdecl;
  external CoreFoundationLib name '_CFDataCreateMutableCopy';
{$EXTERNALSYM CFDataCreateMutableCopy}

function CFDataGetLength(theData: CFDataRef): CFIndex; cdecl;
  external CoreFoundationLib name '_CFDataGetLength';
{$EXTERNALSYM CFDataGetLength}

function CFDataGetBytePtr(theData: CFDataRef): PByte; cdecl;
  external CoreFoundationLib name '_CFDataGetBytePtr';
{$EXTERNALSYM CFDataGetBytePtr}

function CFDataGetMutableBytePtr(theData: CFMutableDataRef): PByte; cdecl;
  external CoreFoundationLib name '_CFDataGetMutableBytePtr';
{$EXTERNALSYM CFDataGetMutableBytePtr}

procedure CFDataGetBytes(theData: CFDataRef; range: CFRange; buffer: PByte); cdecl;
  external CoreFoundationLib name '_CFDataGetBytes';
{$EXTERNALSYM CFDataGetBytes}

procedure CFDataSetLength(theData: CFMutableDataRef; length: CFIndex); cdecl;
  external CoreFoundationLib name '_CFDataSetLength';
{$EXTERNALSYM CFDataSetLength}

procedure CFDataIncreaseLength(theData: CFMutableDataRef; extraLength: CFIndex); cdecl;
  external CoreFoundationLib name '_CFDataIncreaseLength';
{$EXTERNALSYM CFDataIncreaseLength}

procedure CFDataAppendBytes(theData: CFMutableDataRef; bytes: PByte; length: CFIndex); cdecl;
  external CoreFoundationLib name '_CFDataAppendBytes';
{$EXTERNALSYM CFDataAppendBytes}

procedure CFDataReplaceBytes(theData: CFMutableDataRef; range: CFRange;
  newBytes: PByte; newLength: CFIndex); cdecl;
  external CoreFoundationLib name '_CFDataReplaceBytes';
{$EXTERNALSYM CFDataReplaceBytes}

procedure CFDataDeleteBytes(theData: CFMutableDataRef; range: CFRange); cdecl;
  external CoreFoundationLib name '_CFDataDeleteBytes';
{$EXTERNALSYM CFDataDeleteBytes}

const
  kCFDataSearchBackwards   = 1 shl 0;
  {$EXTERNALSYM kCFDataSearchBackwards}
  kCFDataSearchAnchored   = 1 shl 1;
  {$EXTERNALSYM kCFDataSearchAnchored}

type
  CFDataSearchFlags = CFOptionFlags;
  {$EXTERNALSYM CFDataSearchFlags}

function CFDataFind(theData: CFDataRef; dataToFind: CFDataRef;
  searchRange: CFRange; compareOptions: CFDataSearchFlags): CFRange; cdecl;
  external CoreFoundationLib name '_CFDataFind';
{$EXTERNALSYM CFDataFind}

{$IFEND !__COREFOUNDATION_CFDATA__}

