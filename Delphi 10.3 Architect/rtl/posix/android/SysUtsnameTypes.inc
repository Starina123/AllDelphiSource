{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2017-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
  SYS_NMLN = 65;
  {$EXTERNALSYM SYS_NMLN}

type
  utsname = record
    sysname: array [0..SYS_NMLN-1] of UTF8Char;
    nodename: array [0..SYS_NMLN-1] of UTF8Char;
    release: array [0..SYS_NMLN-1] of UTF8Char;
    version: array [0..SYS_NMLN-1] of UTF8Char;
    machine: array [0..SYS_NMLN-1] of UTF8Char;
    domainname: array [0..SYS_NMLN-1] of UTF8Char;
  end;
  {$EXTERNALSYM utsname}
  TUTSName = utsname;
  {$EXTERNALSYM TUTSName}
  PUTSName = ^TUTSName;
  {$EXTERNALSYM PUTSName}
