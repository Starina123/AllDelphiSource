{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
  libc = 'libc.so';
  libpthread = 'libpthread.so.0';
  libiconv = 'libc.so.6';
  libdl = 'libdl.so.2';

{$IF not Declared(_PU)}
const
  // On Linux, cdecl names do not have a preceeding underscore
  _PU = '';
  {$EXTERNALSYM _PU}
{$ENDIF}  

const
  _INODE_SUFFIX = '';
