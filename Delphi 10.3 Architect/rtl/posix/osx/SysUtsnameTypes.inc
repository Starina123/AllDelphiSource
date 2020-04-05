{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2017-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
  _SYS_NAMELEN = 256;
  {$EXTERNALSYM _SYS_NAMELEN}

type
  utsname = record
    { [XSI] Name of OS }
    sysname: array [0.._SYS_NAMELEN-1] of UTF8Char;
    { [XSI] Name of this network node }
    nodename: array [0.._SYS_NAMELEN-1] of UTF8Char;
    { [XSI] Release level }
    release: array [0.._SYS_NAMELEN-1] of UTF8Char;
    { [XSI] Version level }
    version: array [0.._SYS_NAMELEN-1] of UTF8Char;
    { [XSI] Hardware type  }
    machine: array [0.._SYS_NAMELEN-1] of UTF8Char;
  end;
  {$EXTERNALSYM utsname}
  TUTSName = utsname;
  {$EXTERNALSYM TUTSName}
  PUTSName = ^TUTSName;
  {$EXTERNALSYM PUTSName}
