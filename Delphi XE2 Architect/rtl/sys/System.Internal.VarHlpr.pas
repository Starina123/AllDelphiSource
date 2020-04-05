{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{*******************************************************}
{          Helpers for C++ Variant binding.             }
{*******************************************************}

unit System.Internal.VarHlpr;

interface

  procedure VariantClear(var V: Variant);
  procedure VariantArrayRedim(var V: Variant; High: Integer);
  procedure VariantCast(const src: Variant; var dst: Variant; vt: Integer);

  procedure VariantCpy(const src: Variant; var dst: Variant);
  procedure VariantAdd(const src: Variant; var dst: Variant);
  procedure VariantSub(const src: Variant; var dst: Variant);
  procedure VariantMul(const src: Variant; var dst: Variant);
  procedure VariantDiv(const src: Variant; var dst: Variant);
  procedure VariantMod(const src: Variant; var dst: Variant);
  procedure VariantAnd(const src: Variant; var dst: Variant);
  procedure VariantOr(const src: Variant; var dst: Variant);
  procedure VariantXor(const src: Variant; var dst: Variant);
  procedure VariantShl(const src: Variant; var dst: Variant);
  procedure VariantShr(const src: Variant; var dst: Variant);

  function  VariantAdd2(const V1: Variant; const V2: Variant): Variant;
  function  VariantSub2(const V1: Variant; const V2: Variant): Variant;
  function  VariantMul2(const V1: Variant; const V2: Variant): Variant;
  function  VariantDiv2(const V1: Variant; const V2: Variant): Variant;
  function  VariantMod2(const V1: Variant; const V2: Variant): Variant;
  function  VariantAnd2(const V1: Variant; const V2: Variant): Variant;
  function  VariantOr2(const V1: Variant; const V2: Variant): Variant;
  function  VariantXor2(const V1: Variant; const V2: Variant): Variant;
  function  VariantShl2(const V1: Variant; const V2: Variant): Variant;
  function  VariantShr2(const V1: Variant; const V2: Variant): Variant;
  function  VariantNot(const V1: Variant): Variant;
  function  VariantNeg(const V1: Variant): Variant;

  function  VariantGetElement(const V: Variant; i1: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3, i4: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3, i4, i5: integer): Variant; overload;

  procedure VariantPutElement(var V: Variant; const data: Variant; i1: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4, i5: integer); overload;

  procedure VariantFromUnicodeString(var V: Variant; const Str: UnicodeString);
  procedure VariantToUnicodeString(const V: Variant; var Str: UnicodeString);


implementation

uses System.Variants;

{ C++Builder helpers, implementation }

procedure VariantClear(var V: Variant);
begin
  VarClear(V);
end;

procedure VariantCast(const src: Variant; var dst: Variant; vt: Integer);
begin
  VarCast(dst, src, vt);
end;

procedure VariantArrayRedim(var V: Variant; High: Integer);
begin
  VarArrayRedim(V, High);
end;

procedure VariantCpy(const src: Variant; var dst: Variant);
begin
  dst := src;
end;

procedure VariantAdd(const src: Variant; var dst: Variant);
begin
  dst := dst + src;
end;

procedure VariantSub(const src: Variant; var dst: Variant);
begin
  dst := dst - src;
end;

procedure VariantMul(const src: Variant; var dst: Variant);
begin
  dst := dst * src;
end;

procedure VariantDiv(const src: Variant; var dst: Variant);
begin
  dst := dst / src;
end;

procedure VariantMod(const src: Variant; var dst: Variant);
begin
  dst := dst mod src;
end;

procedure VariantAnd(const src: Variant; var dst: Variant);
begin
  dst := dst and src;
end;

procedure VariantOr(const src: Variant; var dst: Variant);
begin
  dst := dst or src;
end;

procedure VariantXor(const src: Variant; var dst: Variant);
begin
  dst := dst xor src;
end;

procedure VariantShl(const src: Variant; var dst: Variant);
begin
  dst := dst shl src;
end;

procedure VariantShr(const src: Variant; var dst: Variant);
begin
  dst := dst shr src;
end;

function  VariantCmpEQ(const v1: Variant; const V2: Variant): Boolean;
begin
  Result := v1 = v2;
end;

function  VariantCmpLT(const V1: Variant; const V2: Variant): Boolean;
begin
  Result := V1 < V2;
end;

function  VariantCmpGT(const V1: Variant; const V2: Variant): Boolean;
begin
  Result := V1 > V2;
end;

function  VariantAdd2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := v1 + V2;
end;

function  VariantSub2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 - V2;
end;

function  VariantMul2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 * V2;
end;

function  VariantDiv2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 / V2;
end;

function  VariantMod2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 mod V2;
end;

function  VariantAnd2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 and V2;
end;

function  VariantOr2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 or V2;
end;

function  VariantXor2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 xor V2;
end;

function  VariantShl2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 shl V2;
end;

function  VariantShr2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 shr V2;
end;

function  VariantNot(const V1: Variant): Variant;
begin
  Result := not V1;
end;

function  VariantNeg(const V1: Variant): Variant;
begin
  Result := -V1;
end;

function  VariantGetElement(const V: Variant; i1: integer): Variant; overload;
begin
  Result := V[i1];
end;

function  VariantGetElement(const V: Variant; i1, i2: integer): Variant; overload;
begin
  Result := V[i1, i2];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3: integer): Variant; overload;
begin
  Result := V[I1, i2, i3];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3, i4: integer): Variant; overload;
begin
  Result := V[i1, i2, i3, i4];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3, i4, i5: integer): Variant; overload;
begin
  Result := V[i1, i2, i3, i4, i5];
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1: integer); overload;
begin
  V[i1] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2: integer); overload;
begin
  V[i1, i2] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3: integer); overload;
begin
  V[i1, i2, i3] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4: integer); overload;
begin
  V[i1, i2, i3, i4] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4, i5: integer); overload;
begin
  V[i1, i2, i3, i4, i5] := data;
end;

procedure VariantFromUnicodeString(var V: Variant; const Str: UnicodeString);
begin
  V := Str;
end;

procedure VariantToUnicodeString(const V: Variant; var Str: UnicodeString);
begin
  Str := V;
end;


end.

