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

unit Posix.StdDef;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

{$IFDEF MACOS}
{$I osx/StdDefTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/StdDefTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/StdDefTypes.inc}
{$ENDIF}

implementation

end.
