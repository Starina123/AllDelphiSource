{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


function __open(PathName: PAnsiChar; Flags: Integer; Mode: Integer): Integer; cdecl;
  external libc name _PU + 'open';
{$EXTERNALSYM __open}

function open(PathName: PAnsiChar; Flags: Integer; Mode: Integer): Integer; cdecl;
  external libc name _PU + 'open';
{$EXTERNALSYM open}

{ Do the file control operation described by CMD on FD.
   The remaining arguments are interpreted depending on CMD.  }

function fcntl(Handle: Integer; Command: Integer; var Lock: flock): Integer; cdecl; overload;
  external libc name _PU + 'fcntl';
function fcntl(Handle: Integer; Command: Integer; Arg: Longint): Integer; cdecl; overload;
  external libc name _PU + 'fcntl';
function fcntl(Handle: Integer; Command: Integer): Integer; cdecl; overload;
  external libc name _PU + 'fcntl';
{$EXTERNALSYM fcntl}

function creat(Path: PAnsiChar; Mode: mode_t): Integer; cdecl
  external libc name _PU + 'creat';
{$EXTERNALSYM creat}
