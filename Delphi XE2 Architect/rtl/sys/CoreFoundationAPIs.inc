{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{
  System.pas and SysInit.pas cannot use the CoreFoundation unit,
  so we manually include the definitions here.
}

const
  CoreFoundationLib = '/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation';

type
  CFArrayRef = Pointer;
  CFIndex = Integer;
  CFLocaleRef = Pointer;
  CFStringRef = Pointer;
  CFTypeRef = Pointer;
  CFBundleRef = Pointer;
  CFURLRef = Pointer;

  PCFRange = ^CFRange;
  CFRange = record
    location: CFIndex;
    length: CFIndex;
  end;

procedure CFRelease(cf: CFTypeRef); cdecl;
  external CoreFoundationLib name '_CFRelease';

function CFLocaleCopyCurrent: CFLocaleRef; cdecl;
  external CoreFoundationLib name '_CFLocaleCopyCurrent';

function CFLocaleGetIdentifier(locale: CFLocaleRef): CFStringRef; cdecl;
  external CoreFoundationLib name '_CFLocaleGetIdentifier';

function CFStringGetLength(theString: CFStringRef): CFIndex; cdecl;
  external CoreFoundationLib name '_CFStringGetLength';

procedure CFStringGetCharacters(theString: CFStringRef; range: CFRange;
  buffer: PWideChar); cdecl;
  external CoreFoundationLib name '_CFStringGetCharacters';

function CFLocaleCopyPreferredLanguages: CFArrayRef; cdecl;
  external CoreFoundationLib name '_CFLocaleCopyPreferredLanguages';

function CFArrayGetCount(theArray: CFArrayRef): CFIndex; cdecl;
  external CoreFoundationLib name '_CFArrayGetCount';

function CFArrayGetValueAtIndex(theArray: CFArrayRef; idx: CFIndex): Pointer; cdecl;
  external CoreFoundationLib name '_CFArrayGetValueAtIndex';

function CFStringConvertEncodingToWindowsCodepage(
  encoding: UInt32): UInt32; cdecl;
  external CoreFoundationLib name '_CFStringConvertEncodingToWindowsCodepage';

function CFStringGetSystemEncoding: UInt32; cdecl; 
  external CoreFoundationLib name '_CFStringGetSystemEncoding';

function CFBundleGetMainBundle: CFBundleRef; cdecl;
  external CoreFoundationLib name '_CFBundleGetMainBundle';

function CFBundleCopyResourceURL(bundle: CFBundleRef; resourceName: CFStringRef;
  resourceType: CFStringRef;   subDirName: CFStringRef): CFURLRef; cdecl;
  external CoreFoundationLib name '_CFBundleCopyResourceURL';

function CFURLCopyFileSystemPath(anURL: CFURLRef; pathStyle: UInt32): CFStringRef; cdecl;
  external CoreFoundationLib name '_CFURLCopyFileSystemPath';

function CFStringCreateWithCharacters(alloc: pointer;
  chars: PWideChar; numChars: CFIndex): CFStringRef; cdecl;
  external CoreFoundationLib name '_CFStringCreateWithCharacters';
