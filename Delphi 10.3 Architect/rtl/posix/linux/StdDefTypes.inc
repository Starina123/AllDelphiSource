{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


type
  ptrdiff_t = NativeInt;

  {$EXTERNALSYM ptrdiff_t}
  Pptrdiff_t = ^ptrdiff_t;

  wchar_t = Int32;
  {$EXTERNALSYM wchar_t}
  Pwchar_t = ^wchar_t;

  size_t = NativeUInt;

  {$EXTERNALSYM size_t}
  Psize_t = ^size_t;
