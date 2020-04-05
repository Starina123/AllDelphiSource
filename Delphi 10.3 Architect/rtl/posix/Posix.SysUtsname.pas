{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2017-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit Posix.SysUtsname;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

uses Posix.Base;

{$HPPEMIT '#include <sys/utsname.h>' }

{$IFDEF MACOS}
{$I osx/SysUtsnameTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/SysUtsnameTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/SysUtsnameTypes.inc}
{$ENDIF}

{$I SysUtsname.inc}

implementation

end.
