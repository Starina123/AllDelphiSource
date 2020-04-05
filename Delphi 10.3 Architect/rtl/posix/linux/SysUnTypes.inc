{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  sockaddr_un = record
    sun_family: sa_family_t;
    sun_path: packed array[0..108-1] of Byte;  { Path name.  }
  end;
  {$EXTERNALSYM sockaddr_un}
  Psockaddr_un = ^sockaddr_un;
