{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{
 N.B.  This header is marked obsolete in the POSIX spec.
}

{ Set the access and modification times of FILE to those given in
   *FILE_TIMES.  If FILE_TIMES is NULL, set them to the current time.  }
function utime(FileName: PAnsiChar; var FileTimes: utimbuf): Integer; cdecl;
  external libc name _PU + 'utime';
{$EXTERNALSYM utime}
