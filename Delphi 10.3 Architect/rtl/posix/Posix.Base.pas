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

unit Posix.Base;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface


{$IFDEF MACOS}
{$I osx/BaseTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/BaseTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/BaseTypes.inc}
{$ENDIF}

implementation

end.
