{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ stdlib.h }
type
  div_t = record
    quot: Integer;
    rem: Integer;
  end;
  {$EXTERNALSYM div_t}

  ldiv_t = record
    quote: LongInt;
    rem: LongInt;
  end;
  {$EXTERNALSYM ldiv_t}
  
  lldiv_t = record
    quot: Int64;
    rem: Int64;
  end;
  {$EXTERNALSYM lldiv_t}
  Plldiv_t = ^lldiv_t;
  
  TCompareProc = function(const p1, p2: Pointer): Integer; cdecl;
  TAtexitFunc = procedure;
