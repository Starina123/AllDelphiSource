{******************************************************************************}
{                                                                              }
{                    CodeGear Delphi Runtime Library                           }
{                                                                              }
{                      Header conversion of pcre.h                             }
{                                                                              }
{                Translator: Embarcadero Technologies, Inc.                    }
{                                                                              }
{                   Based on original translations by:                         }
{                                                                              }
{                            Florent Ouchet                                    }
{                            Mario R. Carro                                    }
{                            Robert Rossmair                                   }
{                            Peter Thornqvist                                  }
{                            Jan Goyvaerts                                     }
{                                                                              }
{******************************************************************************}

{******************************************************************************}
{                                                                              }
{ PCRE LICENCE                                                                 }
{ ------------                                                                 }
{                                                                              }
{ PCRE is a library of functions to support regular expressions whose syntax   }
{ and semantics are as close as possible to those of the Perl 5 language.      }
{                                                                              }
{ Release 7 of PCRE is distributed under the terms of the "BSD" licence, as    }
{ specified below. The documentation for PCRE, supplied in the "doc"           }
{ directory, is distributed under the same terms as the software itself.       }
{                                                                              }
{ The basic library functions are written in C and are freestanding. Also      }
{ included in the distribution is a set of C++ wrapper functions.              }
{                                                                              }
{                                                                              }
{ THE BASIC LIBRARY FUNCTIONS                                                  }
{ ---------------------------                                                  }
{                                                                              }
{ Written by:       Philip Hazel                                               }
{ Email local part: ph10                                                       }
{ Email domain:     cam.ac.uk                                                  }
{                                                                              }
{ University of Cambridge Computing Service,                                   }
{ Cambridge, England.                                                          }
{                                                                              }
{ Copyright (c) 1997-2009 University of Cambridge                              }
{ All rights reserved.                                                         }
{                                                                              }
{                                                                              }
{ THE C++ WRAPPER FUNCTIONS                                                    }
{ -------------------------                                                    }
{                                                                              }
{ Contributed by:   Google Inc.                                                }
{                                                                              }
{ Copyright (c) 2007-2008, Google Inc.                                         }
{ All rights reserved.                                                         }
{                                                                              }
{                                                                              }
{ THE "BSD" LICENCE                                                            }
{ -----------------                                                            }
{                                                                              }
{ Redistribution and use in source and binary forms, with or without           }
{ modification, are permitted provided that the following conditions are met:  }
{                                                                              }
{     * Redistributions of source code must retain the above copyright notice, }
{       this list of conditions and the following disclaimer.                  }
{                                                                              }
{     * Redistributions in binary form must reproduce the above copyright      }
{       notice, this list of conditions and the following disclaimer in the    }
{       documentation and/or other materials provided with the distribution.   }
{                                                                              }
{     * Neither the name of the University of Cambridge nor the name of Google }
{       Inc. nor the names of their contributors may be used to endorse or     }
{       promote products derived from this software without specific prior     }
{       written permission.                                                    }
{                                                                              }
{ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"  }
{ AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE    }
{ IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE   }
{ ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE     }
{ LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR          }
{ CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF         }
{ SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS     }
{ INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN      }
{ CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)      }
{ ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE   }
{ POSSIBILITY OF SUCH DAMAGE.                                                  }
{                                                                              }
{ End                                                                          }
{                                                                              }
{******************************************************************************}

unit System.RegularExpressionsAPI;

interface

(*************************************************
*       Perl-Compatible Regular Expressions      *
*************************************************)

{$WEAKPACKAGEUNIT ON}

const
  MAX_PATTERN_LENGTH = $10003;
  MAX_QUANTIFY_REPEAT = $10000;
  MAX_CAPTURE_COUNT = $FFFF;
  MAX_NESTING_DEPTH = 200;

const
  (* Options *)
  PCRE_CASELESS = $00000001;
  PCRE_MULTILINE = $00000002;
  PCRE_DOTALL = $00000004;
  PCRE_EXTENDED = $00000008;
  PCRE_ANCHORED = $00000010;
  PCRE_DOLLAR_ENDONLY = $00000020;
  PCRE_EXTRA = $00000040;
  PCRE_NOTBOL = $00000080;
  PCRE_NOTEOL = $00000100;
  PCRE_UNGREEDY = $00000200;
  PCRE_NOTEMPTY = $00000400;
  PCRE_UTF8 = $00000800;
  PCRE_NO_AUTO_CAPTURE = $00001000;
  PCRE_NO_UTF8_CHECK = $00002000;
  PCRE_AUTO_CALLOUT = $00004000;
  PCRE_PARTIAL = $00008000;
  PCRE_DFA_SHORTEST = $00010000;
  PCRE_DFA_RESTART = $00020000;
  PCRE_FIRSTLINE = $00040000;
  PCRE_DUPNAMES = $00080000;
  PCRE_NEWLINE_CR = $00100000;
  PCRE_NEWLINE_LF = $00200000;
  PCRE_NEWLINE_CRLF = $00300000;
  PCRE_NEWLINE_ANY = $00400000;
  PCRE_NEWLINE_ANYCRLF = $00500000;
  PCRE_BSR_ANYCRLF = $00800000;
  PCRE_BSR_UNICODE = $01000000;
  PCRE_JAVASCRIPT_COMPAT = $02000000;
  PCRE_NO_START_OPTIMIZE = $04000000;
  PCRE_NO_START_OPTIMISE = $04000000;

  (* Exec-time and get-time error codes *)

  PCRE_ERROR_NOMATCH = -1;
  PCRE_ERROR_NULL = -2;
  PCRE_ERROR_BADOPTION = -3;
  PCRE_ERROR_BADMAGIC = -4;
  PCRE_ERROR_UNKNOWN_NODE = -5;
  PCRE_ERROR_NOMEMORY = -6;
  PCRE_ERROR_NOSUBSTRING = -7;
  PCRE_ERROR_MATCHLIMIT = -8;
  PCRE_ERROR_CALLOUT = -9;  (* Never used by PCRE itself *)
  PCRE_ERROR_BADUTF8 = -10;
  PCRE_ERROR_BADUTF8_OFFSET = -11;
  PCRE_ERROR_PARTIAL = -12;
  PCRE_ERROR_BADPARTIAL = -13;
  PCRE_ERROR_INTERNAL = -14;
  PCRE_ERROR_BADCOUNT = -15;
  PCRE_ERROR_DFA_UITEM = -16;
  PCRE_ERROR_DFA_UCOND = -17;
  PCRE_ERROR_DFA_UMLIMIT = -18;
  PCRE_ERROR_DFA_WSSIZE = -19;
  PCRE_ERROR_DFA_RECURSE = -20;
  PCRE_ERROR_RECURSIONLIMIT = -21;
  PCRE_ERROR_NULLWSLIMIT = -22;  (* No longer actually used *)
  PCRE_ERROR_BADNEWLINE = -23;

  (* Request types for pcre_fullinfo() *)

  PCRE_INFO_OPTIONS = 0;
  PCRE_INFO_SIZE = 1;
  PCRE_INFO_CAPTURECOUNT = 2;
  PCRE_INFO_BACKREFMAX = 3;
  PCRE_INFO_FIRSTCHAR = 4;
  PCRE_INFO_FIRSTTABLE = 5;
  PCRE_INFO_LASTLITERAL = 6;
  PCRE_INFO_NAMEENTRYSIZE = 7;
  PCRE_INFO_NAMECOUNT = 8;
  PCRE_INFO_NAMETABLE = 9;
  PCRE_INFO_STUDYSIZE = 10;
  PCRE_INFO_DEFAULT_TABLES = 11;
  PCRE_INFO_OKPARTIAL = 12;
  PCRE_INFO_JCHANGED = 13;
  PCRE_INFO_HASCRORLF = 14;

  (* Request types for pcre_config() *)
  PCRE_CONFIG_UTF8 = 0;
  PCRE_CONFIG_NEWLINE = 1;
  PCRE_CONFIG_LINK_SIZE = 2;
  PCRE_CONFIG_POSIX_MALLOC_THRESHOLD = 3;
  PCRE_CONFIG_MATCH_LIMIT = 4;
  PCRE_CONFIG_STACKRECURSE = 5;
  PCRE_CONFIG_UNICODE_PROPERTIES = 6;
  PCRE_CONFIG_MATCH_LIMIT_RECURSION = 7;
  PCRE_CONFIG_BSR = 8;

  (* Bit flags for the pcre_extra structure *)

  PCRE_EXTRA_STUDY_DATA = $0001;
  PCRE_EXTRA_MATCH_LIMIT = $0002;
  PCRE_EXTRA_CALLOUT_DATA = $0004;
  PCRE_EXTRA_TABLES = $0008;
  PCRE_EXTRA_MATCH_LIMIT_RECURSION = $0010;

type
  (* Types *)
  PPAnsiChar = ^PAnsiChar;
  PPPAnsiChar = ^PPAnsiChar;
  PInteger = ^Integer;

  real_pcre = packed record
    {magic_number: Longword;
    size: Integer;
    tables: PAnsiChar;
    options: Longword;
    top_bracket: Word;
    top_backref: word;
    first_char: PAnsiChar;
    req_char: PAnsiChar;
    code: array [0..0] of AnsiChar;}
  end;
  TPCRE = real_pcre;
  PPCRE = ^TPCRE;

  real_pcre_extra = packed record
    {options: PAnsiChar;
    start_bits: array [0..31] of AnsiChar;}
    flags: Cardinal;        (* Bits for which fields are set *)
    study_data: Pointer;    (* Opaque data from pcre_study() *)
    match_limit: Cardinal;  (* Maximum number of calls to match() *)
    callout_data: Pointer;  (* Data passed back in callouts *)
    tables: PAnsiChar;      (* Pointer to character tables *)
    match_limit_recursion: Cardinal; (* Max recursive calls to match() *)
  end;
  TPCREExtra = real_pcre_extra;
  PPCREExtra = ^TPCREExtra;

  pcre_callout_block = packed record
    version: Integer;           (* Identifies version of block *)
  (* ------------------------ Version 0 ------------------------------- *)
    callout_number: Integer;    (* Number compiled into pattern *)
    offset_vector: PInteger;    (* The offset vector *)
    subject: PAnsiChar;         (* The subject being matched *)
    subject_length: Integer;    (* The length of the subject *)
    start_match: Integer;       (* Offset to start of this match attempt *)
    current_position: Integer;  (* Where we currently are in the subject *)
    capture_top: Integer;       (* Max current capture *)
    capture_last: Integer;      (* Most recently closed capture *)
    callout_data: Pointer;      (* Data passed in with the call *)
  (* ------------------- Added for Version 1 -------------------------- *)
    pattern_position: Integer;  (* Offset to next item in the pattern *)
    next_item_length: Integer;  (* Length of next item in the pattern *)
  (* ------------------------------------------------------------------ *)
  end;

  pcre_malloc_callback = function(Size: Integer): Pointer; cdecl;
  pcre_free_callback = procedure(P: Pointer); cdecl;
  pcre_stack_malloc_callback = function(Size: Integer): Pointer; cdecl;
  pcre_stack_free_callback = procedure(P: Pointer); cdecl;
  pcre_callout_callback = function(var callout_block: pcre_callout_block): Integer; cdecl;

procedure SetPCREMallocCallback(const Value: pcre_malloc_callback);
function GetPCREMallocCallback: pcre_malloc_callback;
function CallPCREMalloc(Size: Integer): Pointer;

procedure SetPCREFreeCallback(const Value: pcre_free_callback);
function GetPCREFreeCallback: pcre_free_callback;
procedure CallPCREFree(P: Pointer);

procedure SetPCREStackMallocCallback(const Value: pcre_stack_malloc_callback);
function GetPCREStackMallocCallback: pcre_stack_malloc_callback;
function CallPCREStackMalloc(Size: Integer): Pointer;

procedure SetPCREStackFreeCallback(const Value: pcre_stack_free_callback);
function GetPCREStackFreeCallback: pcre_stack_free_callback;
procedure CallPCREStackFree(P: Pointer);

procedure SetPCRECalloutCallback(const Value: pcre_callout_callback);
function GetPCRECalloutCallback: pcre_callout_callback;
function CallPCRECallout(var callout_block: pcre_callout_block): Integer;

const
{$IFDEF MACOS}
  {$DEFINE __DLL}
  PCRELib = 'libpcre.dylib';
  PU = '_';
{$ENDIF MACOS}
{$IFDEF MSWINDOWS}
  {$IFDEF CPUX86}
  PU = '_';
  {$ELSE}
  PU = '';
  {$ENDIF}
{$ENDIF}

(* Functions *)

function pcre_compile(const pattern: PAnsiChar; options: Integer;
  const errptr: PPAnsiChar; erroffset: PInteger; const tableptr: PAnsiChar): PPCRE;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_compile';
function pcre_compile2(const pattern: PAnsiChar; options: Integer;
  const errorcodeptr: PInteger; const errorptr: PPAnsiChar; erroroffset: PInteger;
  const tables: PAnsiChar): PPCRE;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_compile2';
function pcre_config(what: Integer; where: Pointer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_config';
function pcre_copy_named_substring(const code: PPCRE; const subject: PAnsiChar;
  ovector: PInteger; stringcount: Integer; const stringname: PAnsiChar;
  buffer: PAnsiChar; size: Integer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_copy_named_substring';
function pcre_copy_substring(const subject: PAnsiChar; ovector: PInteger;
  stringcount, stringnumber: Integer; buffer: PAnsiChar; buffersize: Integer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_copy_substring';
function pcre_dfa_exec(const argument_re: PPCRE; const extra_data: PPCREExtra;
  const subject: PAnsiChar; length: Integer; start_offset: Integer;
  options: Integer; offsets: PInteger; offsetcount: Integer; workspace: PInteger;
  wscount: Integer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_dfa_exec';
function pcre_exec(const code: PPCRE; const extra: PPCREExtra; const subject: PAnsiChar;
  length, startoffset, options: Integer; ovector: PInteger; ovecsize: Integer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_exec';
procedure pcre_free_substring(stringptr: PAnsiChar);
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_free_substring';
procedure pcre_free_substring_list(stringlistptr: PPAnsiChar);
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_free_substring_list';
function pcre_fullinfo(const code: PPCRE; const extra: PPCREExtra;
  what: Integer; where: Pointer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_fullinfo';
function pcre_get_named_substring(const code: PPCRE; const subject: PAnsiChar;
  ovector: PInteger; stringcount: Integer; const stringname: PAnsiChar;
  const stringptr: PPAnsiChar): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_get_named_substring';
function pcre_get_stringnumber(const code: PPCRE; const stringname: PAnsiChar): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_get_stringnumber';
function pcre_get_stringtable_entries(const code: PPCRE; const stringname: PAnsiChar;
  firstptr: PPAnsiChar; lastptr: PPAnsiChar): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_get_stringtable_entries';
function pcre_get_substring(const subject: PAnsiChar; ovector: PInteger;
  stringcount, stringnumber: Integer; const stringptr: PPAnsiChar): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_get_substring';
function pcre_get_substring_list(const subject: PAnsiChar; ovector: PInteger;
  stringcount: Integer; listptr: PPPAnsiChar): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_get_substring_list';
function pcre_info(const code: PPCRE; optptr, firstcharptr: PInteger): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_info';
function pcre_maketables: PAnsiChar;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_maketables';
function pcre_refcount(argument_re: PPCRE; adjust: Integer): Integer;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_refcount';
function pcre_study(const code: PPCRE; options: Integer; const errptr: PPAnsiChar): PPCREExtra;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_study';
function pcre_version: PAnsiChar;
  cdecl; external {$IFDEF __DLL} PCRELib {$ENDIF} name PU + 'pcre_version';

// Calling pcre_free in the DLL causes an access violation error; use pcre_dispose instead
procedure pcre_dispose(pattern, hints, chartable: Pointer);

implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
  System.Win.Crtl, {$NOINCLUDE System.Win.Crtl}
{$ENDIF MSWINDOWS}
  System.SysUtils, System.Character;

{$IFDEF MSWINDOWS}
{$L pcre_compile.obj}
{$L pcre_config.obj}
{$L pcre_dfa_exec.obj}
{$L pcre_exec.obj}
{$L pcre_fullinfo.obj}
{$L pcre_get.obj}
{$L pcre_globals.obj}
{$L pcre_info.obj}
{$L pcre_maketables.obj}
{$L pcre_newline.obj}
{$L pcre_ord2utf8.obj}
{$L pcre_refcount.obj}
{$L pcre_study.obj}
{$L pcre_tables.obj}
{$L pcre_try_flipped.obj}
{$L pcre_ucd.obj}
{$L pcre_valid_utf8.obj}
{$L pcre_version.obj}
{$L pcre_xclass.obj}
{$L pcre_default_tables.obj}
{$ENDIF MSWINDOWS}

// user's defined callbacks
var
  pcre_malloc_user: pcre_malloc_callback;
  pcre_free_user: pcre_free_callback;
  pcre_stack_malloc_user: pcre_stack_malloc_callback;
  pcre_stack_free_user: pcre_stack_free_callback;
  pcre_callout_user: pcre_callout_callback;

function __pcre_malloc(Size: Integer): Pointer; cdecl;
begin
  if Assigned(pcre_malloc_user) then
    Result := pcre_malloc_user(Size)
  else
    Result := AllocMem(Size);
end;

function __pcre_stack_malloc(Size: Integer): Pointer; cdecl;
begin
  if Assigned(pcre_stack_malloc_user) then
    Result := pcre_stack_malloc_user(Size)
  else
    Result := AllocMem(Size);
end;

procedure __pcre_free(P: Pointer); cdecl;
begin
  if Assigned(pcre_free_user) then
    pcre_free_user(P)
  else
    FreeMem(P);
end;

procedure __pcre_stack_free(P: Pointer); cdecl;
begin
  if Assigned(pcre_stack_free_user) then
    pcre_stack_free_user(P)
  else
    FreeMem(P);
end;

function __pcre_callout(var callout_block: pcre_callout_block): Integer; cdecl;
begin
  if Assigned(pcre_callout_user) then
    Result := pcre_callout_user(callout_block)
  else
    Result := 0;
end;

{$IFDEF WIN32}
const
  _pcre_malloc: ^pcre_malloc_callback = @__pcre_malloc;
  _pcre_free: ^pcre_free_callback = @__pcre_free;
  _pcre_stack_malloc: ^pcre_stack_malloc_callback = @__pcre_malloc;
  _pcre_stack_free: ^pcre_stack_free_callback = @__pcre_free;
  _pcre_callout: ^pcre_callout_callback = @__pcre_callout;
{$ENDIF}
{$IFDEF WIN64}
const
  pcre_malloc: ^pcre_malloc_callback = @__pcre_malloc;
  pcre_free: ^pcre_free_callback = @__pcre_free;
  pcre_stack_malloc: ^pcre_stack_malloc_callback = @__pcre_malloc;
  pcre_stack_free: ^pcre_stack_free_callback = @__pcre_free;
  pcre_callout: ^pcre_callout_callback = @__pcre_callout;
{$ENDIF}

procedure SetPCREMallocCallback(const Value: pcre_malloc_callback);
begin
  pcre_malloc_user := Value;
end;

function GetPCREMallocCallback: pcre_malloc_callback;
begin
  Result := pcre_malloc_user;
end;

function CallPCREMalloc(Size: Integer): Pointer;
begin
  Result := __pcre_malloc(Size);
end;

procedure SetPCREFreeCallback(const Value: pcre_free_callback);
begin
  pcre_free_user := Value;
end;

function GetPCREFreeCallback: pcre_free_callback;
begin
  Result := pcre_free_user;
end;

procedure CallPCREFree(P: Pointer);
begin
  __pcre_free(P);
end;

procedure SetPCREStackMallocCallback(const Value: pcre_stack_malloc_callback);
begin
  pcre_stack_malloc_user := Value;
end;

function GetPCREStackMallocCallback: pcre_stack_malloc_callback;
begin
  Result := pcre_stack_malloc_user;
end;

function CallPCREStackMalloc(Size: Integer): Pointer;
begin
  Result := __pcre_stack_malloc(Size);
end;

procedure SetPCREStackFreeCallback(const Value: pcre_stack_free_callback);
begin
  pcre_stack_free_user := Value;
end;

function GetPCREStackFreeCallback: pcre_stack_free_callback;
begin
  Result := pcre_stack_free_user;
end;

procedure CallPCREStackFree(P: Pointer);
begin
  __pcre_stack_free(P);
end;

procedure SetPCRECalloutCallback(const Value: pcre_callout_callback);
begin
  pcre_callout_user := Value;
end;

function GetPCRECalloutCallback: pcre_callout_callback;
begin
  Result := pcre_callout_user;
end;

function CallPCRECallout(var callout_block: pcre_callout_block): Integer;
begin
  Result := __pcre_callout(callout_block);
end;

procedure pcre_dispose(pattern, hints, chartable: Pointer);
begin
  if pattern <> nil then
    __pcre_free(pattern);
  if hints <> nil then
    __pcre_free(hints);
  if chartable <> nil then
    __pcre_free(chartable);
end;

end.
