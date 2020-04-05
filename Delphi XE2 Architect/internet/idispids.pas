unit Idispids;

interface

uses Winapi.Windows;

{ +------------------------------------------------------------------------- }

{  Microsoft Windows }
{  Copyright 1995-1998 Microsoft Corporation. All Rights Reserved. }

{  File: idispids.h }

{ -------------------------------------------------------------------------- }

const
  DISPID_READYSTATE                                 = -525; 
  DISPID_READYSTATECHANGE                           = -609; 
  DISPID_AMBIENT_TRANSFERPRIORITY                   = -728; 
  DISPID_AMBIENT_OFFLINEIFNOTCONNECTED              = -5501; 
  DISPID_AMBIENT_SILENT                             = -5502; 

{ Until these appear in OLECTL.H }
{$IFNDEF DISPID_AMBIENT_CODEPAGE}
  DISPID_AMBIENT_CODEPAGE             = -725; 
  DISPID_AMBIENT_CHARSET              = -727; 
{$ENDIF}

implementation


end.
