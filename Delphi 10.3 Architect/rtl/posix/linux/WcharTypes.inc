{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ wchar.h types }

type

  // TODO -oAntonioT -cLinux64: Check!!!
  {$IFDEF CPU64BITS}
  //wctype_t = LongWord;
  wctype_t = UInt32;
  {$ELSE}
  wctype_t = UInt32;
  {$ENDIF} 
  {$EXTERNALSYM wctype_t}
  Pwctype_t = ^wctype_t;

  {$IFDEF CPU64BITS}
  wint_t = Cardinal;
  {$ELSE}
  wint_t = LongWord;
  {$ENDIF}
  {$EXTERNALSYM wint_t}
  Pwint_t = ^wint_t;

  mbstate_t = record
    __count: Integer;
    __value: record
      case Integer of
        0: (__wch: wint_t);
        1: (__wchb: array [0..4-1] of Byte);
    end;
  end;
  {$EXTERNALSYM mbstate_t}
  Pmbstate_t = ^mbstate_t;
