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

unit Posix.Fnmatch;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

uses
  Posix.Base;

{$IFDEF MACOS}
{$I osx/FnMatchTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/FnMatchTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/FnMatchTypes.inc}
{$ENDIF}

{$I FnMatchAPI.inc}

implementation

end.
