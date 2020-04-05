{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_FilterCatGeometry;

interface

{$I FMX_Defines.inc}

uses
  FMX_Filter;

type

  TAffineMatrix = packed record
    m11, m12, m31: Single;
    m21, m22, m32: Single;
    m13, m23, m33: Single;
  end;

  TAffineFilter = class(TShaderFilter)
  protected
    FMatrix, FInvMatrix: TAffineMatrix;
    procedure CalcMatrix(W, H: Integer); virtual;
    procedure LoadShader; override;
    procedure CalcSize(var W, H: Integer); override;
  public
    constructor Create; override;
    class function FilterAttr: TFilterRec; override;
  end;

  TPerspectiveFilter = class(TShaderFilter)
  protected
    FMatrix, FInvMatrix: TAffineMatrix;
    procedure LoadShader; override;
    procedure CalcSize(var W, H: Integer); override;
    procedure CalcMatrix(W, H: Integer); virtual;
  public
    class function FilterAttr: TFilterRec; override;
    constructor Create; override;
  end;

  TCropFilter = class(TShaderFilter)
  protected
    procedure CalcSize(var W, H: Integer); override;
  public
    class function FilterAttr: TFilterRec; override;
    constructor Create; override;
  end;

implementation

uses
  Types, FMX_Types3D{$IFDEF FPC}, FMX_Types{$ENDIF};

{ TAffineFilter }

const
  Epsilon: Single = 1e-40;
  cPIdiv180: Single =  0.017453292;
  IdentityMatrix: TAffineMatrix = (m11:1.0; m12:0.0; m31:0.0;
                                     m21:0.0; m22:1.0; m32:0.0;
                                     m13:0.0; m23:0.0; m33:1.0);

function fxMatrixMultiply(const M1, M2: TAffineMatrix): TAffineMatrix;
begin
  Result.m11 := M1.m11 * M2.m11 + M1.m12 * M2.m21 + M1.m13 * M2.m31;
  Result.m12 := M1.m11 * M2.m12 + M1.m12 * M2.m22 + M1.m13 * M2.m32;
  Result.m13 := M1.m11 * M2.m13 + M1.m12 * M2.m23 + M1.m13 * M2.m33;
  Result.m21 := M1.m21 * M2.m11 + M1.m22 * M2.m21 + M1.m23 * M2.m31;
  Result.m22 := M1.m21 * M2.m12 + M1.m22 * M2.m22 + M1.m23 * M2.m32;
  Result.m23 := M1.m21 * M2.m13 + M1.m22 * M2.m23 + M1.m23 * M2.m33;
  Result.m31 := M1.m31 * M2.m11 + M1.m32 * M2.m21 + M1.m33 * M2.m31;
  Result.m32 := M1.m31 * M2.m12 + M1.m32 * M2.m22 + M1.m33 * M2.m32;
  Result.m33 := M1.m31 * M2.m13 + M1.m32 * M2.m23 + M1.m33 * M2.m33;
end;

function fxCreateRotationMatrix(angle: Single): TAffineMatrix;
var
  cosine, sine: Single;
begin
  sine := sin(angle);
  cosine := cos(angle);

  Result := IdentityMatrix;
  Result.m11 := cosine;
  Result.m12 := sine;
  Result.m21 := -sine;
  Result.m22 := cosine;
end;

function vgPointTransform(const V: TPointF; const M: TAffineMatrix): TPointF;
var
  z: Single;
begin
  Result.X := V.X * M.m11 + V.Y * M.m21 + M.m31;
  Result.Y := V.X * M.m12 + V.Y * M.m22 + M.m32;
  z := M.m13 * V.x + M.m23 * V.y + 1;
  if z = 0 then Exit;
  if z = 1 then
  begin
    Result.X := V.X * M.m11 + V.Y * M.m21 + M.m31;
    Result.Y := V.X * M.m12 + V.Y * M.m22 + M.m32;
  end
  else
  begin
    z := 1 / z;
    Result.X := (V.X * M.m11 + V.Y * M.m21 + M.m31) * z;
    Result.Y := (V.X * M.m12 + V.Y * M.m22 + M.m32) * z;
  end;
end;

function fxShaderMatrixDeterminant(const M: TAffineMatrix): Single;
begin
  Result := M.m11 * (M.m22 * M.m33 - M.m32 * M.m23)
          - M.m12 * (M.m21 * M.m33 - M.m31 * M.m23)
          + M.m13 * (M.m21 * M.m32 - M.m31 * M.m22);
end;

procedure fxAdjointMatrix(var M: TAffineMatrix);
var
   a1, a2, a3,
   b1, b2, b3,
   c1, c2, c3: Single;
begin
   a1:= M.m11; a2:= M.m12; a3 := M.m13;
   b1:= M.m21; b2:= M.m22; b3 := M.m23;
   c1:= M.m31; c2:= M.m32; c3 := M.m33;
   M.m11 := (b2*c3-c2*b3);
   M.m21 :=-(b1*c3-c1*b3);
   M.m31 := (b1*c2-c1*b2);

   M.m12 :=-(a2*c3-c2*a3);
   M.m22 := (a1*c3-c1*a3);
   M.m32 :=-(a1*c2-c1*a2);

   M.m13 := (a2*b3-b2*a3);
   M.m23 :=-(a1*b3-b1*a3);
   M.m33 := (a1*b2-b1*a2);
end;

procedure fxScaleMatrix(var M: TAffineMatrix; const factor: Single);
begin
  M.m11 := M.m11 * Factor;
  M.m12 := M.m12 * Factor;
  M.m21 := M.m21 * Factor;
  M.m22 := M.m22 * Factor;
  M.m31 := M.m31 * Factor;
  M.m32 := M.m32 * Factor;
  M.m13 := M.m13 * Factor;
  M.m23 := M.m23 * Factor;
  M.m33 := M.m33 * Factor;
end;

procedure fxInvertMatrix(var M: TAffineMatrix);
var
   det : Single;
begin
  det := fxShaderMatrixDeterminant(M);
  if Abs(Det) < EPSILON then
     M := IdentityMatrix
  else
  begin
    fxAdjointMatrix(M);
    fxScaleMatrix(M, 1/det);
  end;
end;

constructor TAffineFilter.Create;
const
  DX9PS2BIN: array [0..571] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $32, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $9F, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $98, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $60, $00, $00, $00, $00, $00, $00, $00, $70, $00, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $60, $00, $00, $00, $00, $00, $00, $00,
    $78, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $88, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $72, $69, $78, $31, $00, $01, $00, $03, $00, $01, $00, $03, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $4D, $61, $74, $72, $69, $78, $32, $00, $69, $6D, $70, $6C, $69, $63, $69, $74, $49, $6E, $70, $75, $74, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F,
    $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $00, $00, $0F, $A0, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80,
    $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $55, $B0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $01, $80,
    $00, $00, $00, $B0, $02, $00, $00, $A0, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $02, $00, $AA, $A0, $02, $00, $00, $03, $00, $00, $04, $80, $00, $00, $00, $81,
    $00, $00, $00, $A0, $58, $00, $00, $04, $00, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $00, $A0, $00, $00, $55, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $00, $80, $00, $00, $00, $A0,
    $00, $00, $55, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $FF, $80, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $55, $B0, $03, $00, $55, $A0, $04, $00, $00, $04,
    $00, $00, $08, $80, $00, $00, $00, $B0, $03, $00, $00, $A0, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $02, $80, $00, $00, $FF, $80, $03, $00, $AA, $A0, $58, $00, $00, $04, $00, $00, $08, $80,
    $00, $00, $55, $80, $00, $00, $00, $A0, $00, $00, $55, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $55, $81,
    $00, $00, $00, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, $58, $00, $00, $04, $00, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $00, $A0, $00, $00, $55, $A0,
    $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $AA, $80, $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $00, $81, $00, $00, $55, $A0, $01, $00, $E4, $80, $01, $00, $00, $02,
    $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[5] = { program.local[0..3],'#13+
    '		{ 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'MUL R0.x, fragment.texcoord[0].y, c[2].y;'#13+
    'MAD R0.y, fragment.texcoord[0].x, c[2].x, R0.x;'#13+
    'ADD R0.x, R0.y, c[2].z;'#13+
    'MUL R0.z, fragment.texcoord[0].y, c[3].y;'#13+
    'MAD R0.w, fragment.texcoord[0].x, c[3].x, R0.z;'#13+
    'ADD R1.x, R0.w, c[3].z;'#13+
    'SGE R0.z, c[4].x, R0.x;'#13+
    'SGE R0.y, R0, -c[2].z;'#13+
    'MUL R0.y, R0, R0.z;'#13+
    'SGE R0.z, R0.w, -c[3];'#13+
    'MUL R0.y, R0, R0.z;'#13+
    'SGE R0.w, c[4].x, R1.x;'#13+
    'MUL R0.z, R0.y, R0.w;'#13+
    'MOV R0.y, R1.x;'#13+
    'ABS R1.x, R0.z;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'CMP R1.x, -R1, c[4].y, c[4];'#13+
    'CMP result.color, -R1.x, c[4].y, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _TMP0;'#13+
    'vec2 _newval0008;'#13+
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'void main()'#13+
    '{'#13+
    '    bool _isValid;'#13+
    '    _newval0008.x = TEX0.x*PSParam2.x + TEX0.y*PSParam2.y + PSParam2.z;'#13+
    '    _newval0008.y = TEX0.x*PSParam3.x + TEX0.y*PSParam3.y + PSParam3.z;'#13+
    '    _isValid = _newval0008.x >= 0.0 && _newval0008.x <= 1.00000000E+000 && _newval0008.y >= 0.0 && _newval0008.y <= 1.00000000E+000;'#13+
    '    if (_isValid) { '#13+
    '        _TMP0 = texture2D(texture0, _newval0008);'#13+
    '    } else {'#13+
    '        _TMP0 = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP0;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FAntiAlise := True;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

procedure TAffineFilter.CalcSize(var W, H: Integer);
var
  P: TPointF;
  W1, H1, WW, HH: Single;
  S: TAffineMatrix;
begin
  CalcMatrix(FInput.Width, FInput.Height);
  W1 := -100;
  H1 := -100;
  WW := 100;
  HH := 100;
  P.x := 1; P.y := 1;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 0; P.y := 1;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 0; P.y := 0;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 1; P.y := 0;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  W := round((W1 - WW) * FInput.Width);
  H := round((H1 - HH) * FInput.Height);
  // Recalc matrix
  S := IdentityMatrix;
  S.m11 := FInput.Width / W;
  S.m22 := FInput.Height / H;
  S.m31 := -WW * S.m11;
  S.m32 := -HH * S.m22;
  FMatrix := fxMatrixMultiply(FMatrix, S);
  FInvMatrix := FMatrix;
  fxInvertMatrix(FInvMatrix);
end;

procedure TAffineFilter.CalcMatrix(W, H: Integer);
var
  S, US, T, R, UT: TAffineMatrix;
begin
  S := IdentityMatrix;
  S.m11 := W;
  S.m22 := H;
  T := IdentityMatrix;
  T.m31 := -VarToPoint(Values['Center']).X / FInput.Width;
  T.m32 := -VarToPoint(Values['Center']).Y / FInput.Height;
  R := fxCreateRotationMatrix(Values['Rotation'] * cPIdiv180);
  UT := IdentityMatrix;
  UT.m31 := VarToPoint(Values['Center']).X / FInput.Width;
  UT.m32 := VarToPoint(Values['Center']).Y / FInput.Height;
  US := IdentityMatrix;
  US.m11 := 1 / W;
  US.m22 := 1 / H;
  FMatrix := fxMatrixMultiply(T, S);
  FMatrix := fxMatrixMultiply(FMatrix, R);
  FMatrix := fxMatrixMultiply(FMatrix, US);
  FMatrix := fxMatrixMultiply(FMatrix, UT);
  S := IdentityMatrix;
  S.m11 := Values['Scale'];
  S.m22 := Values['Scale'];
  FMatrix := fxMatrixMultiply(FMatrix, S);
end;

procedure TAffineFilter.LoadShader;
begin
  ShaderDevice.SetPixelShader(FShaders[FPass]);
  ShaderDevice.SetPixelShaderVector(2, Vector3D(FInvMatrix.m11, FInvMatrix.m21, FInvMatrix.m31, 0));
  ShaderDevice.SetPixelShaderVector(3, Vector3D(FInvMatrix.m12, FInvMatrix.m22, FInvMatrix.m32, 0));
end;

class function TAffineFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('AffineTransform', 'Applies an affine transform to an image.', [
    FilterValueRec('Center', 'The center point of the rotation.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Rotation', 'Rotation angle in degrees.', TShaderValueType.vtFloat, 0, -180, 180),
    FilterValueRec('Scale', 'Scale value as floating.', TShaderValueType.vtFloat, 1, 0.05, 4)
  ]);
end;

{ TPerspectiveFilter }

constructor TPerspectiveFilter.Create;
const
  DX9PS2BIN: array [0..747] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $39, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $BB, $00, $00, $00, $00, $02, $FF, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $B4, $00, $00, $00,
    $6C, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $74, $00, $00, $00, $00, $00, $00, $00, $84, $00, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $74, $00, $00, $00, $00, $00, $00, $00,
    $8C, $00, $00, $00, $02, $00, $04, $00, $01, $00, $12, $00, $74, $00, $00, $00, $00, $00, $00, $00, $94, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A4, $00, $00, $00, $00, $00, $00, $00,
    $4D, $61, $74, $72, $69, $78, $31, $00, $01, $00, $03, $00, $01, $00, $03, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $72, $69, $78, $32, $00, $4D, $61, $74, $72, $69, $78, $33, $00,
    $69, $6D, $70, $6C, $69, $63, $69, $74, $49, $6E, $70, $75, $74, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D,
    $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05,
    $00, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90,
    $00, $08, $0F, $A0, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $55, $B0, $04, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $04, $00, $00, $A0, $00, $00, $00, $B0, $00, $00, $FF, $80,
    $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $04, $00, $AA, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $00, $00, $00, $80, $00, $00, $00, $A0, $06, $00, $00, $02, $00, $00, $01, $80,
    $00, $00, $00, $80, $05, $00, $00, $03, $00, $00, $02, $80, $00, $00, $55, $80, $00, $00, $55, $80, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $55, $B0, $02, $00, $55, $A0, $04, $00, $00, $04,
    $00, $00, $04, $80, $00, $00, $00, $B0, $02, $00, $00, $A0, $00, $00, $AA, $80, $02, $00, $00, $03, $01, $00, $01, $80, $00, $00, $AA, $80, $02, $00, $AA, $A0, $05, $00, $00, $03, $02, $00, $01, $80,
    $00, $00, $00, $80, $01, $00, $00, $80, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $55, $B0, $03, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $00, $B0, $03, $00, $00, $A0,
    $00, $00, $AA, $80, $02, $00, $00, $03, $01, $00, $02, $80, $00, $00, $AA, $80, $03, $00, $AA, $A0, $05, $00, $00, $03, $02, $00, $02, $80, $00, $00, $00, $80, $01, $00, $55, $80, $58, $00, $00, $04,
    $00, $00, $03, $80, $00, $00, $55, $81, $01, $00, $E4, $80, $02, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $04, $80, $00, $00, $00, $81, $00, $00, $55, $A0, $58, $00, $00, $04, $00, $00, $04, $80,
    $00, $00, $AA, $80, $00, $00, $55, $A0, $00, $00, $AA, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $00, $80, $00, $00, $55, $A0, $00, $00, $AA, $A0, $05, $00, $00, $03, $00, $00, $04, $80,
    $00, $00, $AA, $80, $00, $00, $FF, $80, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $55, $80, $00, $00, $55, $A0, $00, $00, $AA, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $AA, $80,
    $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $55, $81, $00, $00, $55, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, $58, $00, $00, $04,
    $00, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $55, $A0, $00, $00, $AA, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $AA, $80, $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $0F, $80,
    $00, $00, $00, $81, $00, $00, $AA, $A0, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[6] = { program.local[0..4],'#13+
    '		{ 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'MUL R0.x, fragment.texcoord[0].y, c[4].y;'#13+
    'MAD R0.x, fragment.texcoord[0], c[4], R0;'#13+
    'ADD R0.w, R0.x, c[4].z;'#13+
    'RCP R0.z, R0.w;'#13+
    'MUL R0.y, fragment.texcoord[0], c[3];'#13+
    'MAD R0.y, fragment.texcoord[0].x, c[3].x, R0;'#13+
    'ADD R0.x, R0.y, c[3].z;'#13+
    'ADD R0.w, R0, -c[5].x;'#13+
    'MUL R1.x, fragment.texcoord[0].y, c[2].y;'#13+
    'ABS R0.w, R0;'#13+
    'MAD R1.x, fragment.texcoord[0], c[2], R1;'#13+
    'CMP R0.w, -R0, c[5].y, c[5].x;'#13+
    'ABS R0.w, R0;'#13+
    'MUL R0.y, R0.z, R0.x;'#13+
    'ADD R1.x, R1, c[2].z;'#13+
    'CMP R0.w, -R0, c[5].y, c[5].x;'#13+
    'MUL R0.z, R1.x, R0;'#13+
    'CMP R0.z, -R0.w, R0, R1.x;'#13+
    'CMP R0.x, -R0.w, R0.y, R0;'#13+
    'SGE R0.w, c[5].x, R0.z;'#13+
    'SGE R0.y, R0.z, c[5];'#13+
    'MUL R0.y, R0, R0.w;'#13+
    'SGE R0.w, R0.x, c[5].y;'#13+
    'MUL R0.y, R0, R0.w;'#13+
    'SGE R1.x, c[5], R0;'#13+
    'MUL R0.y, R0, R1.x;'#13+
    'ABS R1.x, R0.y;'#13+
    'MOV R0.w, R0.x;'#13+
    'TEX R0, R0.zwzw, texture[0], 2D;'#13+
    'CMP R1.x, -R1, c[5].y, c[5];'#13+
    'CMP result.color, -R1.x, c[5].y, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _TMP0;'#13+
    'float _z0009;'#13+
    'vec2 _newval0009;'#13+
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'uniform vec4 PSParam4;'#13+
    'void main()'#13+
    '{'#13+
    '    bool _isValid;'#13+
    '    _z0009 = PSParam4.x*TEX0.x + PSParam4.y*TEX0.y + PSParam4.z;'#13+
    '    if (_z0009 == 1.00000000E+000) { // if begin'#13+
    '        _newval0009.x = TEX0.x*PSParam2.x + TEX0.y*PSParam2.y + PSParam2.z;'#13+
    '        _newval0009.y = TEX0.x*PSParam3.x + TEX0.y*PSParam3.y + PSParam3.z;'#13+
    '    } else {'#13+
    '        _z0009 = 1.00000000E+000/_z0009;'#13+
    '        _newval0009.x = (TEX0.x*PSParam2.x + TEX0.y*PSParam2.y + PSParam2.z)*_z0009;'#13+
    '        _newval0009.y = (TEX0.x*PSParam3.x + TEX0.y*PSParam3.y + PSParam3.z)*_z0009;'#13+
    '    } // end if'#13+
    '    _isValid = _newval0009.x >= 0.00000000E+000 && _newval0009.x <= 1.00000000E+000 && _newval0009.y >= 0.00000000E+000 && _newval0009.y <= 1.00000000E+000;'#13+
    '    if (_isValid) { // if begin'#13+
    '        _TMP0 = texture2D(texture0, _newval0009);'#13+
    '    } else {'#13+
    '        _TMP0 = vec4( 0.00000000E+000, 0.00000000E+000, 0.00000000E+000, 0.00000000E+000);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP0;'#13+
    '    return;'#13+
    '}';
begin
  inherited;
  FAntiAlise := True;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

procedure TPerspectiveFilter.CalcSize(var W, H: Integer);
var
  P: TPointF;
  W1, H1, WW, HH: Single;
  S: TAffineMatrix;
begin
  CalcMatrix(FInput.Width, FInput.Height);
  W1 := -100;
  H1 := -100;
  WW := 100;
  HH := 100;
  P.x := 1; P.y := 1;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 0; P.y := 1;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 0; P.y := 0;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  P.x := 1; P.y := 0;
  P := vgPointTransform(P, FMatrix);
  if P.x > W1 then W1 := P.x;
  if P.y > H1 then H1 := P.y;
  if P.x < WW then WW := P.x;
  if P.y < HH then HH := P.y;
  W := FInput.Width;
  H := FInput.Height;
  W := round((W1 - WW) * FInput.Width);
  H := round((H1 - HH) * FInput.Height);
  // Recalc matrix
  S := IdentityMatrix;
  S.m11 := FInput.Width / W;
  S.m22 := FInput.Height / H;
  S.m31 := -WW * S.m11;
  S.m32 := -HH * S.m22;
  FMatrix := fxMatrixMultiply(FMatrix, S);
  FInvMatrix := FMatrix;
  fxInvertMatrix(FInvMatrix);
end;

procedure TPerspectiveFilter.CalcMatrix(W, H: Integer);
var
  Wx0, Wy0, Wx1, Wy1, Wx2, Wy2, Wx3, Wy3: Single;
  dx1, dx2, px, dy1, dy2, py: Single;
  g, hh, k: Single;
begin
  with ValuesAsPoint['TopLeft'] do
  begin
    Wx0 := x / W;
    Wy0 := y / H;
  end;
  with ValuesAsPoint['TopRight'] do
  begin
    Wx1 := x / W;
    Wy1 := y / H;
  end;
  with ValuesAsPoint['BottomRight'] do
  begin
    Wx2 := x / W;
    Wy2 := y / H;
  end;
  with ValuesAsPoint['BottomLeft'] do
  begin
    Wx3 := x / W;
    Wy3 := y / H;
  end;
  px  := Wx0 - Wx1 + Wx2 - Wx3;
  py  := Wy0 - Wy1 + Wy2 - Wy3;
  dx1 := Wx1 - Wx2;
  dx2 := Wx3 - Wx2;
  dy1 := Wy1 - Wy2;
  dy2 := Wy3 - Wy2;
  k := dx1 * dy2 - dx2 * dy1;
  if k <> 0 then
  begin
    g := (px * dy2 - py * dx2) / k;
    hh := (dx1 * py - dy1 * px) / k;

    FMatrix.m11 := Wx1 - Wx0 + g * Wx1;
    FMatrix.m21 := Wx3 - Wx0 + hh * Wx3;
    FMatrix.m31 := Wx0;
    FMatrix.m12 := Wy1 - Wy0 + g * Wy1;
    FMatrix.m22 := Wy3 - Wy0 + hh * Wy3;
    FMatrix.m32 := Wy0;
    FMatrix.m13 := g;
    FMatrix.m23 := hh;
    FMatrix.m33 := 1;
  end
  else
    FillChar(FMatrix, SizeOf(FMatrix), 0);
end;

procedure TPerspectiveFilter.LoadShader;
begin
  ShaderDevice.SetPixelShader(FShaders[FPass]);
  ShaderDevice.SetPixelShaderVector(2, Vector3D(FInvMatrix.m11, FInvMatrix.m21, FInvMatrix.m31, 0));
  ShaderDevice.SetPixelShaderVector(3, Vector3D(FInvMatrix.m12, FInvMatrix.m22, FInvMatrix.m32, 0));
  ShaderDevice.SetPixelShaderVector(4, Vector3D(FInvMatrix.m13, FInvMatrix.m23, FInvMatrix.m33, 0));
end;

class function TPerspectiveFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('PerspectiveTransform', 'Applies an perspective transform to an image.', [
    FilterValueRec('TopLeft', 'Top left point of result transformation.', TShaderValueType.vtPoint, VarFromPointXY(0, 0), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('TopRight', 'Top right point of result transformation.', TShaderValueType.vtPoint, VarFromPointXY(300, 0), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('BottomRight', 'Bottom right point of result transformation.', TShaderValueType.vtPoint, VarFromPointXY(350, 300), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('BottomLeft', 'Bottom left point of result transformation.', TShaderValueType.vtPoint, VarFromPointXY(0, 300), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535))
  ]);
end;

{ TCropFilter }

constructor TCropFilter.Create;
const
  DX9PS2BIN: array [0..527] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $30, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $97, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $90, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $5C, $00, $00, $00, $00, $00, $00, $00, $6C, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $5C, $00, $00, $00, $00, $00, $00, $00,
    $6F, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $4C, $54, $00, $AB, $01, $00, $03, $00, $01, $00, $02, $00, $01, $00, $00, $00, $00, $00, $00, $00,
    $52, $42, $00, $69, $6D, $70, $6C, $69, $63, $69, $74, $49, $6E, $70, $75, $74, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32,
    $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00,
    $51, $00, $00, $05, $02, $00, $0F, $A0, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $00, $08, $0F, $A0, $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $00, $00, $E4, $A0, $01, $00, $00, $02, $01, $00, $03, $80, $00, $00, $E4, $A0, $02, $00, $00, $03,
    $01, $00, $03, $80, $01, $00, $E4, $81, $01, $00, $E4, $A0, $05, $00, $00, $03, $02, $00, $03, $80, $00, $00, $E4, $80, $01, $00, $E4, $80, $58, $00, $00, $04, $00, $00, $04, $80, $02, $00, $00, $80,
    $02, $00, $00, $A0, $02, $00, $55, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $02, $00, $55, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $42, $00, $00, $03, $02, $00, $0F, $80, $02, $00, $E4, $80,
    $00, $08, $E4, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $FF, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $01, $00, $00, $81, $02, $00, $00, $A0,
    $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $80, $01, $00, $55, $81, $02, $00, $00, $A0, $58, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $02, $00, $00, $A0, $02, $00, $55, $A0,
    $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $AA, $80, $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $05, $00, $00, $03,
    $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $55, $80, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $00, $81, $02, $00, $55, $A0, $02, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'MOV R0.xy, c[0];'#13+
    'ADD R0.zw, -R0.xyxy, c[1].xyxy;'#13+
    'ADD R0.xy, fragment.texcoord[0], c[0];'#13+
    'MUL R0.xy, R0, R0.zwzw;'#13+
    'SGE R0.w, R0.y, c[2].y;'#13+
    'SGE R0.z, R0.x, c[2].y;'#13+
    'MUL R1.x, R0.z, R0.w;'#13+
    'SGE R0.z, c[2].x, R0.x;'#13+
    'SGE R0.w, c[2].x, R0.y;'#13+
    'MUL R0.z, R1.x, R0;'#13+
    'MUL R0.z, R0, R0.w;'#13+
    'ABS R1.x, R0.z;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'CMP R1.x, -R1, c[2].y, c[2];'#13+
    'CMP result.color, -R1.x, c[2].y, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _TMP0;'#13+
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'void main()'#13+
    '{'#13+
    '    vec2 _newCoord;'#13+
    '    bool _isValid;'#13+
    '    _newCoord = TEX0.xy + PSParam0.xy;'#13+
    '    _newCoord = _newCoord*(PSParam1.xy - PSParam0.xy);'#13+
    '    _isValid = _newCoord.x >= 0.00000000E+000 && _newCoord.y >= 0.00000000E+000 && _newCoord.x <= 1.00000000E+000 && _newCoord.y <= 1.00000000E+000;'#13+
    '    if (_isValid) { // if begin'#13+
    '        _TMP0 = texture2D(texture0, _newCoord);'#13+
    '    } else {'#13+
    '        _TMP0 = vec4( 0.00000000E+000, 0.00000000E+000, 0.00000000E+000, 0.00000000E+000);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP0;'#13+
    '    return;'#13+
    '}';
begin
  inherited;
  FShaders[1] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

procedure TCropFilter.CalcSize(var W, H: Integer);
begin
  W := round((VarToPoint(Values['RightBottom']).x - VarToPoint(Values['LeftTop']).x));
  H := round((VarToPoint(Values['RightBottom']).y - VarToPoint(Values['LeftTop']).y));
end;

class function TCropFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('Crop', 'The size and shape of the cropped image depend on the rectangle you specify.', [
    FilterValueRec('LeftTop', 'Left-top corner of cropping rect', TShaderValueType.vtPoint, VarFromPointXY(0, 0), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('RightBottom', 'Left-top corner of cropping rect', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535))
  ]);
end;

initialization
  RegisterFilter('Geometry', TAffineFilter);
  RegisterFilter('Geometry', TPerspectiveFilter);
  RegisterFilter('Geometry', TCropFilter);
end.
