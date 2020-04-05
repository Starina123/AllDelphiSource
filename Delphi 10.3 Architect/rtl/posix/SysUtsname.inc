{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ Put information about the system in NAME.  }

function uname(var __name: TUTSName): Integer; cdecl;
  external libc name _PU + 'uname';
{$EXTERNALSYM uname}
