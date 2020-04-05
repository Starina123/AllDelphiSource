{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{   Copyright(c) 2011 Embarcadero Technologies, Inc.    }
{                                                       }
{*******************************************************}

{*******************************************************}
{          Windows NT C RTL bindings to msvcrt.dll      }
{*******************************************************}

{ *************************************************************************  }
{                                                                            }
{  This unit provides references to the standard C runtime functions which   }
{  are required for supporting C object files that are linked into modules   }
{  in the Delphi Rtl and VclImg packages. Currently this includes            }
{  the following units:                                                      }
{                                                                            }
{     System.Zlib.pas                    (Rtl package)                       }
{     System.RegularExpressionsAPI.pas   (Rtl package)                       }
{     Vcl.Imaging.jpeg.pas               (VclImg package)                    }
{     MidasLib.pas                       (Dsnap code, not packaged)          }
{                                                                            }
{  This unit is not intended to provide a comprehensive interface to the     }
{  entire C RTL or the msvcrt.dll to which it links. Use of this unit        }
{  for applications other than those listed above is provided without        }
{  support of any kind.                                                      }
{                                                                            }
{  Embarcadero Technologies reserves the right to make any modifications     }
{  to this unit in future releases which may, or may not, change the         }
{  exposed interface. Use at your own risk.                                  }
{                                                                            }
{  This software is provided 'as-is', without any express or implied         }
{  warranty.  In no event will the authors be held liable for any damages    }
{  arising from the use of this software.                                    }
{                                                                            }
{ *************************************************************************  }

unit System.Win.Crtl;

interface

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

uses Winapi.Windows;

const
  msvcrt = 'msvcrt.dll';
  {$EXTERNALSYM msvcrt}

type
  va_list = Pointer;
  {$EXTERNALSYM va_list}

{ ----------------------------------------------------- }
{       Memory                                          }
{ ----------------------------------------------------- }

function  malloc(size: size_t): Pointer; cdecl;
{$EXTERNALSYM malloc}

function realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
{$EXTERNALSYM realloc}

procedure  free(pBlock: Pointer); cdecl;
{$EXTERNALSYM free}

{ ----------------------------------------------------- }
{       CString                                         }
{ ----------------------------------------------------- }

function  memchr(s: Pointer; c: Integer; n: size_t): Pointer; cdecl; external msvcrt;
{$EXTERNALSYM memchr}

function  memcmp(buf1: Pointer; buf2: Pointer; n: size_t): Integer; cdecl; external msvcrt;
{$EXTERNALSYM memcmp}

function  memcpy(dest, src: Pointer; count: size_t): Pointer; cdecl; external msvcrt;
{$EXTERNALSYM memcpy}

function  memmove(dest, src: Pointer; count: size_t): Pointer; cdecl; external msvcrt;
{$EXTERNALSYM memmove}

function  memset(dest: Pointer; val: Integer; count: size_t): Pointer; cdecl; external msvcrt;
{$EXTERNALSYM memset}

function  strcat(dest: PAnsiChar; src: PAnsiChar): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strcat}

function  strcpy(dest, src: PAnsiChar): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strcpy}

function  strncpy(dest, src: PAnsiChar; n: size_t): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strncpy}

function  strcmp(s1: PAnsiChar; s2: PAnsiChar): Integer; cdecl; external msvcrt;
{$EXTERNALSYM strcmp}

function  strncmp(s1: PAnsiChar; s2: PAnsiChar; n: size_t): Integer; cdecl; external msvcrt;
{$EXTERNALSYM strncmp}

function  strlen(s: PAnsiChar): size_t; cdecl; external msvcrt;
{$EXTERNALSYM strlen}

function  strnlen(s: PAnsiChar; n: size_t): size_t; cdecl; external msvcrt;
{$EXTERNALSYM strnlen}

function  strchr(__s: PAnsiChar; __c: Integer): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strchr}

function  strerror(__errnum: Integer): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strerror}

function strcspn(const str1, str2: PAnsiChar): size_t; cdecl; external msvcrt;
{$EXTERNALSYM strcspn}

function stricmp(const str1, str2: PAnsiChar): Integer; cdecl; external msvcrt name '_stricmp';
{$EXTERNALSYM stricmp}

function _stricmp(const str1, str2: PAnsiChar): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _stricmp}

function _mbscspn(const str, strCharSet: PWideChar): size_t; cdecl; external msvcrt;
{$EXTERNALSYM _mbscspn}

function mbstowcs(pwcs: PWideChar; const s: PWideChar;n: size_t): size_t; cdecl; external msvcrt;
{$EXTERNALSYM mbstowcs}

function wcslen(str: PWideChar): size_t; cdecl; external msvcrt;
{$EXTERNALSYM wcslen}

function wcsnlen(str: PWideChar; n: size_t): size_t; cdecl; external msvcrt;
{$EXTERNALSYM wcsnlen}

function wcstombs(s:Pointer; const pwcs:Pointer; n:Integer):Integer; cdecl; external msvcrt;
{$EXTERNALSYM wcstombs}

function strstr(const str1, str2: PAnsiChar): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM strstr}

{ ----------------------------------------------------- }
{       Locale                                          }
{ ----------------------------------------------------- }

function  tolower(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM tolower}

function  toupper(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM toupper}

function  towlower(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM towlower}

function  towupper(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM towupper}

function  isalnum(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isalnum}

function  isalpha(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isalpha}

function  iscntrl(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM iscntrl}

function  isdigit(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isdigit}

function  isgraph(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isgraph}

function  islower(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM islower}

function  isprint(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isprint}

function  ispunct(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM ispunct}

function  isspace(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isspace}

function  isupper(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isupper}

function  isxdigit(__ch: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM isxdigit}

function _ismbblead(c: Cardinal): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _ismbblead}


{ ----------------------------------------------------- }
{       IO                                              }
{ ----------------------------------------------------- }

function _open(const __path: PAnsiChar; __access: Integer; __permission: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _open}

function _close(__handle: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _close}

function _lseek(__handle: Integer; __offset: Integer; __fromwhere: Integer): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _lseek}

function _read(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _read}

function _write(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _write}

function open(const __path: PAnsiChar; __access: Integer; __permission: Integer): Integer; cdecl; external msvcrt name '_open';
{$EXTERNALSYM open}
function close(__handle: Integer): Integer; cdecl; external msvcrt name '_close';
{$EXTERNALSYM close}
function lseek(__handle: Integer; __offset: Integer; __fromwhere: Integer): Integer; cdecl; external msvcrt name '_lseek';
{$EXTERNALSYM lseek}
function read(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl; external msvcrt name '_read';
{$EXTERNALSYM read}
function write(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl; external msvcrt name '_write';
{$EXTERNALSYM write}

{ ----------------------------------------------------- }
{       Standard IO                                     }
{ ----------------------------------------------------- }

function  printf(format: PAnsiChar {args}): Integer; cdecl; varargs; external msvcrt;
{$EXTERNALSYM printf}

function  fprintf(fHandle: Pointer; format: PAnsiChar {args}): Integer; cdecl; varargs; external msvcrt;
{$EXTERNALSYM fprintf}

function  sprintf(buf: Pointer; format: PAnsiChar {args}): Integer; cdecl; varargs; external msvcrt;
{$EXTERNALSYM sprintf}

function _vsnprintf(buf: Pointer; nzize: size_t; format: PAnsiChar; param: va_list): Integer; cdecl; external msvcrt;
{$EXTERNALSYM _vsnprintf}

{ ----------------------------------------------------- }
{       Conversion                                      }
{ ----------------------------------------------------- }

function _itoa(value: Integer; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM _itoa}

function itoa(value: Integer; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl; external msvcrt name '_itoa';
{$EXTERNALSYM itoa}

function _i64toa(value: Int64; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM _i64toa}

function _atoi64(const str: PAnsiChar): Int64; cdecl; external msvcrt;
{$EXTERNALSYM _atoi64}

function atoi(const str: PAnsiChar): Integer; cdecl; external msvcrt;
{$EXTERNALSYM atoi}

function atof(value: PAnsiChar): Double; cdecl; external msvcrt;
{$EXTERNALSYM atof}

function atol(const str: PAnsiChar): LongInt; cdecl; external msvcrt;
{$EXTERNALSYM atol}

function strtod(value: PAnsiChar; endPtr: PPAnsiChar): Double; cdecl; external msvcrt;
{$EXTERNALSYM strtod}

function gcvt(value: double; digits: Integer; buffer: PAnsiChar): PAnsiChar; cdecl; external msvcrt name '_gcvt';
{$EXTERNALSYM gcvt}
function _gcvt(value: double; digits: Integer; buffer: PAnsiChar): PAnsiChar; cdecl; external msvcrt;
{$EXTERNALSYM _gcvt}

const
  _fltused: Integer = $9875;  // from stubs.c in MS crtl
  {$EXTERNALSYM _fltused}
  _streams: array [0..2] of NativeInt = (0, 1, 2);
  {$EXTERNALSYM _streams}
var
  _errno: Integer;
  {$EXTERNALSYM _errno}
  __errno: Integer;
  {$EXTERNALSYM __errno}
  ___errno: Integer;
  {$EXTERNALSYM ___errno}
  __turboFloat: Integer = 0; // Win32
  {$EXTERNALSYM __turboFloat}


procedure _mbctype; external msvcrt; // Not a function, pointer to data
{$EXTERNALSYM _mbctype}
{$IFDEF WIN64}
procedure _purecall; cdecl;
{$ENDIF}
{$IFDEF WIN32}
procedure __pure_error_;
{$EXTERNALSYM __pure_error_}
function SysFreeMem2(p: Pointer): Integer;
{$EXTERNALSYM SysFreeMem2}
function _malloc(size: size_t): Pointer; cdecl;
{$EXTERNALSYM _malloc}
function _realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
{$EXTERNALSYM _realloc}
procedure _free(pBlock: Pointer); cdecl;
{$EXTERNALSYM _free}

function __atold(value: PAnsiChar; endPtr: PPAnsiChar): Extended; cdecl;
{$EXTERNALSYM __atold}
//-----------------------------------------------------------------------
// __ftol (BCC32 / Win32)
//
// Calls to __ftol are generated by the compiler for code
// that needs to convert a floating point type to an integral type.
//
// Input: floating point number on the top of the '87.
//
// Output: a (signed or unsigned) long in EAX
// All other registers preserved.
//
// Caution: Overflows are ignored.
//-----------------------------------------------------------------------
function _ftol: Integer; cdecl; external; 
{$EXTERNALSYM _ftol}
function __ftol: Integer; cdecl; external; {$L ftol.obj}
{$EXTERNALSYM __ftol}
function __ftoul: Cardinal; cdecl; external; {$L _ftoul.obj}
{$EXTERNALSYM __ftoul}



procedure __mbctype; external msvcrt name '_mbctype'; // Not a function, pointer to data
{$EXTERNALSYM __mbctype}
function  _ltolower(__ch: Integer): Integer; cdecl; external msvcrt name 'tolower';
{$EXTERNALSYM _ltolower}
function  _ltoupper(__ch: Integer): Integer; cdecl; external msvcrt name 'toupper';
{$EXTERNALSYM _ltoupper}
function _ltowlower(c:Integer):Integer; cdecl; external msvcrt name 'towlower';
{$EXTERNALSYM _ltowlower}
function _ltowupper(c:Integer):Integer; cdecl; external msvcrt name 'towupper';
{$EXTERNALSYM _ltowupper}
procedure __ltolower; cdecl; external msvcrt name 'tolower';
{$EXTERNALSYM __ltolower}
procedure __ltoupper; cdecl; external msvcrt name 'toupper';
{$EXTERNALSYM __ltoupper}
procedure __ltowlower; cdecl; external msvcrt name 'towlower';
{$EXTERNALSYM __ltowlower}
procedure __ltowupper; cdecl; external msvcrt name 'towupper';
{$EXTERNALSYM __ltowupper}

procedure _atof; cdecl; external msvcrt name 'atof';
{$EXTERNALSYM _atof}
procedure _atol; cdecl; external msvcrt name 'atol';
{$EXTERNALSYM _atol}
procedure _strcspn; cdecl; external msvcrt name 'strcspn';
{$EXTERNALSYM _strcspn}
procedure _strcat; cdecl; external msvcrt name 'strcat';
{$EXTERNALSYM _strcat}
procedure _strcmp; cdecl; external msvcrt name 'strcmp';
{$EXTERNALSYM _strcmp}
procedure _strncmp; cdecl; external msvcrt name 'strncmp';
{$EXTERNALSYM _strncmp}
procedure _strcpy; cdecl; external msvcrt name 'strcpy';
{$EXTERNALSYM _strcpy}
procedure _strncpy; cdecl; external msvcrt name 'strncpy';
{$EXTERNALSYM _strncpy}
procedure _memmove; cdecl; external msvcrt name 'memmove';
{$EXTERNALSYM _memmove}
procedure _memset; cdecl; external msvcrt name 'memset';
{$EXTERNALSYM _memset}
procedure _memcpy; cdecl; external msvcrt name 'memcpy';
{$EXTERNALSYM _memcpy}
procedure _memcmp; cdecl; external msvcrt name 'memcmp';
{$EXTERNALSYM _memcmp}
procedure _memchr; cdecl; external msvcrt name 'memchr';
{$EXTERNALSYM _memchr}
procedure _strlen; cdecl; external msvcrt name 'strlen';
{$EXTERNALSYM _strlen}
procedure _islower; cdecl; external msvcrt name 'islower';
{$EXTERNALSYM _islower}
procedure _isdigit; cdecl; external msvcrt name 'isdigit';
{$EXTERNALSYM _isdigit}
procedure _isupper; cdecl; external msvcrt name 'isupper';
{$EXTERNALSYM _isupper}
procedure _isalnum; cdecl; external msvcrt name 'isalnum';
{$EXTERNALSYM _isalnum}
procedure _isspace; cdecl; external msvcrt name 'isspace';
{$EXTERNALSYM _isspace}
procedure _isxdigit; cdecl; external msvcrt name 'isxdigit';
{$EXTERNALSYM _isxdigit}
procedure _isgraph; cdecl; external msvcrt name 'isgraph';
{$EXTERNALSYM _isgraph}
procedure _isprint; cdecl; external msvcrt name 'isprint';
{$EXTERNALSYM _isprint}
procedure _ispunct; cdecl; external msvcrt name 'ispunct';
{$EXTERNALSYM _ispunct}
procedure _iscntrl; cdecl; external msvcrt name 'iscntrl';
{$EXTERNALSYM _iscntrl}
procedure _isalpha; cdecl; external msvcrt name 'isalpha';
{$EXTERNALSYM _isalpha}
procedure _strchr; cdecl; external msvcrt name 'strchr';
{$EXTERNALSYM _strchr}
procedure _strnlen; cdecl external msvcrt name 'strnlen';
{$EXTERNALSYM _strnlen}
procedure _wcslen; cdecl external msvcrt name 'wcslen';
{$EXTERNALSYM _wcslen}
procedure _wcsnlen; cdecl external msvcrt name 'wcsnlen';
{$EXTERNALSYM _wcsnlen}
procedure _printf; cdecl external msvcrt name 'printf';
{$EXTERNALSYM _printf}
procedure _fprintf; cdecl external msvcrt name 'fprintf';
{$EXTERNALSYM _fprintf}
procedure _sprintf; cdecl external msvcrt name 'sprintf';
{$EXTERNALSYM _sprintf}
procedure __vsnprintf; cdecl; external msvcrt name '_vsnprintf';
{$EXTERNALSYM __vsnprintf}
procedure _tolower; cdecl external msvcrt name 'tolower';
{$EXTERNALSYM _tolower}
procedure _toupper; cdecl external msvcrt name 'toupper';
{$EXTERNALSYM _toupper}
procedure __mbscspn; cdecl; external msvcrt name '_mbscspn';
{$EXTERNALSYM __mbscspn}
procedure __i64toa; cdecl; external msvcrt name '_i64toa';
{$EXTERNALSYM __i64toa}
procedure __atoi64; cdecl; external msvcrt name '_atoi64';
{$EXTERNALSYM __atoi64}
procedure _strstr; cdecl; external msvcrt name 'strstr';
{$EXTERNALSYM _strstr}
procedure _mbstowcs; cdecl; external msvcrt name 'mbstowcs';
{$EXTERNALSYM _mbstowcs}
procedure _wcstombs; cdecl; external msvcrt name 'wcstombs';
{$EXTERNALSYM _wcstombs}
procedure _strerror; cdecl; external msvcrt name 'strerror';
{$EXTERNALSYM _strerror}
{$ENDIF WIN32}

implementation

uses System.SysUtils, System.Character;

{ ----------------------------------------------------- }
{       Memory                                          }
{ ----------------------------------------------------- }

function  malloc(size: size_t): Pointer; cdecl;
begin
  Result := AllocMem(size);
end;

function realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
begin
  ReallocMem(P, Newsize);
  Result := P;
end;

procedure  free(pBlock: Pointer); cdecl;
begin
  FreeMem(pBlock);
end;

{$IFDEF WIN64}
procedure _purecall; cdecl;
asm
  jmp System.@AbstractError
end;
{$ENDIF}

{$IFDEF WIN32}
function _malloc(size: size_t): Pointer; cdecl;
begin
  Result := AllocMem(size);
end;

function _realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
begin
  ReallocMem(P, Newsize);
  Result := P;
end;

procedure _free(pBlock: Pointer); cdecl;
begin
  FreeMem(pBlock);
end;

procedure __pure_error_;
asm
  JMP  System.@AbstractError
end;

// C++'s free allow NULL pointer.
function SysFreeMem2(p: Pointer): Integer;
begin
  result := 0;
  if (p <> NIL) then result := FreeMemory(p);
end;

function __atold(value: PAnsiChar; endPtr: PPAnsiChar): Extended; cdecl;
var
  s: string;
begin
  s := string(Value);
  if endPtr <> nil then
    endPtr^ := value;
  if not TryStrToFloat(s, Result) then
    Result := 0
  else if endPtr <> nil then
    endPtr^ := PAnsiChar(PByte(Value) + Length(s));
end;
{$ENDIF WIN32}


end.
