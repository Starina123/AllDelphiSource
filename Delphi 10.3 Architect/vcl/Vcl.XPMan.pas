{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.XPMan;

{$WEAKPACKAGEUNIT ON}
{$HPPEMIT LEGACYHPP}

interface

uses
{$IF DEFINED(CLR)}
  System.ComponentModel.Design.Serialization,
{$ENDIF}
  System.SysUtils, System.Classes;

type
  TXPManifest = class(TComponent)
  end;

{$IF DEFINED(CLR)}
{$R Borland.Vcl.WindowsXP.res}
{$ELSE}
{$R WindowsXP.res}
{$ENDIF}

implementation

end.
