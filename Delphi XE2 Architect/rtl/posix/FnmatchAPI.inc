{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{ Match STRING against the filename pattern PATTERN,
   returning zero if it matches, FNM_NOMATCH if not.  }
function fnmatch(Pattern: PAnsiChar; FName: PAnsiChar; Flags: Integer): Integer; cdecl;
  external libc name _PU + 'fnmatch';
{$EXTERNALSYM fnmatch}
