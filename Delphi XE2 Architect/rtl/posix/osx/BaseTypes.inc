{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

const
  libc        = '/usr/lib/libc.dylib';
  libpthread  = '/usr/lib/libpthread.dylib';
  libiconv    = '/usr/lib/libiconv.dylib';
  libdl       = '/usr/lib/libdl.dylib';
  // On Mac OSX, cdecl names have a preceeding underscore
  _PU = '_';
  {$EXTERNALSYM _PU}
  _INODE_SUFFIX = '$INODE64';
  {$EXTERNALSYM _INODE_SUFFIX}
