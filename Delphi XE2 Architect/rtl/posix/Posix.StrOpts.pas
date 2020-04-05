{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit Posix.StrOpts platform;

{$WEAKPACKAGEUNIT}

interface

uses
  Posix.Base, Posix.SysTypes;

{$IFDEF MACOSX}
{$I osx/StrOptsTypes.inc}
{$ENDIF MACOSX}
{$IFDEF LINUX}
{$I linux/StrOptsTypes.inc}
{$ENDIF LINUX}

{$I StrOptsAPI.inc}

implementation

end.
