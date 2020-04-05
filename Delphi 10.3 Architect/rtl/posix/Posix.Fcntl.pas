{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit Posix.Fcntl;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

uses Posix.Base, Posix.SysTypes;

(*$HPPEMIT '#include <fcntl.h>' *)
{$DEFINE IN_POSIXFCNTL}

{$IFDEF MACOS}
{$I osx/FcntlTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/FcntlTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/FcntlTypes.inc}
{$ENDIF}

{$I FcntlAPI.inc}


implementation

end.
