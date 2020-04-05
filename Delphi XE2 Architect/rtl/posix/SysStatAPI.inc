{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


{ Set file access permissions for FileName to MODE.
   This takes an `int' MODE argument because that
   is what `mode_t's get widened to.  }
function chmod(FileName: PAnsiChar; Mode: mode_t): Integer; cdecl;
  external libc name _PU + 'chmod';
{$EXTERNALSYM chmod}

{ Set file access permissions of the file FD is open on to MODE.  }
function fchmod(FileDes: Integer; Mode: mode_t): Integer; cdecl;
  external libc name _PU + 'fchmod';
{$EXTERNALSYM fchmod}

{ Get file attributes for the file, device, pipe, or socket
   that file descriptor FD is open on and put them in BUF.  }
function fstat(FileDes: Integer; var StatBuffer: _stat): Integer; cdecl;
  external libc name _PU + 'fstat' + _INODE_SUFFIX;
{$EXTERNALSYM fstat}

{ Get file attributes about FileName and put them in BUF.
   If FileName is a symbolic link, do not follow it.  }
function lstat(FileName: PAnsiChar; var StatBuffer: _stat): Integer; cdecl;
  external libc name _PU + 'lstat' + _INODE_SUFFIX;
{$EXTERNALSYM lstat}

{ Create a new directory named PATH, with permission bits MODE.  }
function __mkdir(PathName: PAnsiChar; Mode: mode_t): Integer; cdecl;
  external libc name _PU + 'mkdir';
{$EXTERNALSYM __mkdir}

{ Create a new FIFO named PATH, with permission bits MODE.  }
function mkfifo(PathName: PAnsiChar; Mode: mode_t): Integer; cdecl;
  external libc name _PU + 'mkfifo';
{$EXTERNALSYM mkfifo}

{ Get file attributes for FileName and put them in BUF.  }
function stat(FileName: PAnsiChar; var StatBuffer: _stat): Integer; cdecl;
  external libc name _PU + 'stat' + _INODE_SUFFIX;
{$EXTERNALSYM stat}

{ Create a device file named PATH, with permission and special bits MODE
   and device number DEV (which can be constructed from major and minor
   device numbers with the `makedev' macro above).  }
function mknod(Pathname: PAnsiChar; Mode: mode_t; Device: dev_t): Integer; cdecl;
  external libc name _PU + 'mknod';
{$EXTERNALSYM mknod}
