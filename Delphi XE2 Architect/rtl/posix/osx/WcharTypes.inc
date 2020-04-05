{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{ wchar.h types }

type
  wctype_t = UInt32;
  {$EXTERNALSYM wctype_t}
  Pwctype_t = ^wctype_t;

  wint_t = Int32;
  {$EXTERNALSYM wint_t}
  Pwint_t = ^wint_t;

  mbstate_t = record
    case Boolean of
    True:  ( mbstate8: array[0..127] of AnsiChar );
    False: ( mbstateL: UInt64 );
  end;
  {$EXTERNALSYM mbstate_t}
  Pmbstate_t = ^mbstate_t;
