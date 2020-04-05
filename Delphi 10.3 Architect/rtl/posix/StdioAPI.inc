{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

function __rename(OldPath, NewPath: MarshaledAString): Integer; cdecl;
  external libc name _PU + 'rename';
{$EXTERNALSYM __rename}

function remove(Path: MarshaledAString): Integer; cdecl;
  external libc name _PU + 'remove';
{$EXTERNALSYM remove}

{$IFNDEF LINUX}
function tmpnam(Path: MarshaledAString): MarshaledAString; cdecl;
  external libc name _PU + 'tmpnam';
{$EXTERNALSYM tmpnam}

function tempnam(const Path: MarshaledAString; const Prefix: MarshaledAString): MarshaledAString; cdecl;
  external libc name _PU + 'tempnam';
{$EXTERNALSYM tempnam}
{$ENDIF !LINUX}
