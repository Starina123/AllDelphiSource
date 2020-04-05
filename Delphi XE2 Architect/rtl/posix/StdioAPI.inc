{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

function __rename(OldPath, NewPath: PAnsiChar): Integer; cdecl;
  external libc name _PU + 'rename';
{$EXTERNALSYM __rename}

function remove(Path: PAnsiChar): Integer; cdecl;
  external libc name _PU + 'remove';
{$EXTERNALSYM remove}

function tmpnam(Path: PAnsiChar): PAnsiChar; cdecl;
  external libc name _PU + 'tmpnam';
{$EXTERNALSYM remove}
