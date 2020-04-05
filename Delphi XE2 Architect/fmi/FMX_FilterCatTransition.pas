{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_FilterCatTransition;

interface

{$I FMX_Defines.inc}

uses
  FMX_Filter;

type

  TRippleTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TBloodTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TBandedSwirlTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TBlindTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TCircleTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TMagnifyTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TCrumpleTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TDissolveTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TDropTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TFadeTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TBrightTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TPixelateTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TBlurTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TWiggleTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TShapeTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TRotateCrumpleTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TSaturateTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TSlideInTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TSwirlTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TWaterTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TWaveTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TLineTransition = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

implementation

uses Variants;

{ TRippleTransition }

constructor TRippleTransition.Create;
const
  DX9PS2BIN: array [0..791] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $BF, $00, $00, $00, $00, $CC, $CC, $CC, $3D, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $00, $00, $A0, $41, $83, $F9, $22, $3E, $00, $00, $00, $3F, $CD, $CC, $4C, $3D, $51, $00, $00, $05, $03, $00, $0F, $A0, $DB, $0F, $C9, $40, $DB, $0F, $49, $C0, $0A, $D7, $23, $3C,
    $00, $00, $80, $3F, $51, $00, $00, $05, $04, $00, $0F, $A0, $01, $0D, $D0, $B5, $61, $0B, $B6, $B7, $AB, $AA, $2A, $3B, $89, $88, $88, $39, $51, $00, $00, $05, $05, $00, $0F, $A0, $AB, $AA, $AA, $BC,
    $00, $00, $00, $BE, $00, $00, $80, $3F, $00, $00, $00, $3F, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $01, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $0C, $80, $03, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $A0, $00, $00, $AA, $81, $00, $00, $FF, $80,
    $01, $00, $00, $02, $01, $00, $09, $80, $01, $00, $E4, $A0, $05, $00, $00, $03, $00, $00, $02, $80, $01, $00, $FF, $80, $00, $00, $00, $A0, $02, $00, $00, $03, $02, $00, $03, $80, $00, $00, $E4, $B0,
    $01, $00, $55, $A0, $5A, $00, $00, $04, $00, $00, $04, $80, $02, $00, $E4, $80, $02, $00, $E4, $80, $01, $00, $AA, $A0, $07, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $06, $00, $00, $02,
    $00, $00, $08, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $02, $00, $03, $80, $02, $00, $E4, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $FF, $80, $02, $00, $00, $A0,
    $00, $00, $55, $81, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $80, $02, $00, $55, $A0, $02, $00, $AA, $A0, $13, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80, $04, $00, $00, $04,
    $00, $00, $02, $80, $00, $00, $55, $80, $03, $00, $00, $A0, $03, $00, $55, $A0, $25, $00, $00, $04, $03, $00, $01, $80, $00, $00, $55, $80, $04, $00, $E4, $A0, $05, $00, $E4, $A0, $05, $00, $00, $03,
    $00, $00, $01, $80, $00, $00, $00, $80, $03, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $02, $00, $FF, $A0, $00, $00, $FF, $80, $04, $00, $00, $04, $00, $00, $03, $80,
    $02, $00, $E4, $80, $00, $00, $00, $80, $01, $00, $55, $A1, $05, $00, $00, $03, $00, $00, $04, $80, $01, $00, $00, $80, $00, $00, $00, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $03, $00, $00, $80,
    $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $00, $80, $02, $00, $FF, $A0, $00, $00, $FF, $80, $04, $00, $00, $04, $01, $00, $03, $80, $02, $00, $E4, $80, $00, $00, $FF, $80,
    $01, $00, $55, $A1, $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $80, $01, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $12, $00, $00, $04,
    $03, $00, $0F, $80, $00, $00, $AA, $80, $02, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0],'#13+
    '		{ 0.0099999998, 0.5, 20, 10 },'#13+
    '		{ 0.050000001, 1 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.xy, fragment.texcoord[0], -c[1].y;'#13+
    'MUL R0.zw, R0.xyxy, R0.xyxy;'#13+
    'ADD R0.z, R0, R0.w;'#13+
    'MOV R1.x, c[0];'#13+
    'MUL R2.x, R1, c[1];'#13+
    'RSQ R0.z, R0.z;'#13+
    'RCP R0.w, R0.z;'#13+
    'MUL R1.x, -R2, c[1].w;'#13+
    'MAD R1.x, R0.w, c[1].z, R1;'#13+
    'COS R1.x, R1.x;'#13+
    'ADD R1.y, -R2.x, c[2];'#13+
    'MUL R1.y, R1, R1.x;'#13+
    'MUL R1.x, R2, R1;'#13+
    'MAD R1.x, R1, c[2], R0.w;'#13+
    'MAD R1.y, R1, c[2].x, R0.w;'#13+
    'MUL R0.zw, R0.z, R0.xyxy;'#13+
    'MAD R0.xy, R0.zwzw, R1.x, c[1].y;'#13+
    'MAD R1.xy, R0.zwzw, R1.y, c[1].y;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'TEX R1, R1, texture[1], 2D;'#13+
    'ADD R1, R1, -R0;'#13+
    'MAD result.color, R2.x, R1, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'float _TMP0;'#13+
    'float _TMP1;'#13+
    'vec4 _TMP6;'#13+
    'vec2 _toUV0007;'#13+
    'vec2 _normToUV0007;'#13+
    'float _wave0007;'#13+
    'float _progress0007;'#13+
    'float _offset10007;'#13+
    'float _offset20007;'#13+
    'vec2 _newUV10007;'#13+
    'vec2 _newUV20007;'#13+
    'vec4 _c10007;'#13+
    'vec4 _c20007;'#13+
    'float _TMP8;'#13+
    'float _a0017;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0007 = PSParam0.x/1.00000000E+002;'#13+
    '    _toUV0007 = TEX0.xy - vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _TMP0 = dot(_toUV0007, _toUV0007);'#13+
    '    _TMP1 = inversesqrt(_TMP0);'#13+
    '    _TMP8 = 1.00000000E+000/_TMP1;'#13+
    '    _normToUV0007 = _toUV0007/_TMP8;'#13+
    '    _a0017 = 2.00000000E+001*_TMP8 - 1.00000000E+001*_progress0007;'#13+
    '    _wave0007 = cos(_a0017);'#13+
    '    _offset10007 = _progress0007*_wave0007*5.00000007E-002;'#13+
    '    _offset20007 = (1.00000000E+000 - _progress0007)*_wave0007*5.00000007E-002;'#13+
    '    _newUV10007 = vec2( 5.00000000E-001, 5.00000000E-001) + _normToUV0007*(_TMP8 + _offset10007);'#13+
    '    _newUV20007 = vec2( 5.00000000E-001, 5.00000000E-001) + _normToUV0007*(_TMP8 + _offset20007);'#13+
    '    _c10007 = texture2D(texture0, _newUV10007);'#13+
    '    _c20007 = texture2D(texture1, _newUV20007);'#13+
    '    _TMP6 = _c10007 + _progress0007*(_c20007 - _c10007);'#13+
    '    gl_FragColor = _TMP6;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TRippleTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('RippleTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TBloodTransition }

constructor TBloodTransition.Create;
const
  DX9PS2BIN: array [0..567] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DC, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D5, $00, $00, $00,
    $80, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C3, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $43, $6C, $6F, $75, $64, $49, $6E, $70, $75, $74, $00, $AB, $04, $00, $0C, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $52, $61, $6E, $64,
    $6F, $6D, $53, $65, $65, $64, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66,
    $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $01, $80, $00, $00, $00, $B0, $01, $00, $00, $02,
    $00, $00, $02, $80, $01, $00, $00, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $02, $08, $E4, $A0, $01, $00, $00, $02, $01, $00, $08, $80, $02, $00, $00, $A0, $05, $00, $00, $03,
    $00, $00, $02, $80, $01, $00, $FF, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $00, $00, $55, $80, $0A, $00, $00, $03, $01, $00, $01, $80,
    $00, $00, $00, $80, $02, $00, $55, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $01, $00, $00, $81, $00, $00, $55, $B0, $01, $00, $00, $02, $00, $00, $01, $80, $00, $00, $00, $B0, $01, $00, $00, $02,
    $01, $00, $03, $80, $00, $00, $E4, $80, $13, $00, $00, $02, $02, $00, $03, $80, $01, $00, $E4, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03,
    $02, $00, $0F, $80, $02, $00, $E4, $80, $01, $08, $E4, $A0, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $55, $81, $02, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R0.z, R0.x, c[2].x;'#13+
    'MOV R0.y, c[1].x;'#13+
    'MOV R0.x, fragment.texcoord[0];'#13+
    'TEX R0.x, R0, texture[2], 2D;'#13+
    'MAD R0.x, R0.z, R0, R0.z;'#13+
    'MIN R0.x, R0, c[2].y;'#13+
    'ADD R0.x, fragment.texcoord[0].y, -R0;'#13+
    'SLT R1.z, c[2], R0.x;'#13+
    'ABS R2.x, R1.z;'#13+
    'MOV R1.y, R0.x;'#13+
    'MOV R1.x, fragment.texcoord[0];'#13+
    'FRC R0.zw, R1.xyxy;'#13+
    'TEX R0, R0.zwzw, texture[1], 2D;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'CMP R2.x, -R2, c[2].z, c[2].y;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec2 _TMP1;'#13+
    'vec4 _TMP0;'#13+
    'vec4 _TMP8;'#13+
    'vec2 _uv0009;'#13+
    'float _offset0009;'#13+
    'float _progress0009;'#13+
    'vec2 _c0011;'#13+
    'float _a0013;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _uv0009 = TEX0.xy;'#13+
    '    _progress0009 = PSParam0.x/1.00000000E+002;'#13+
    '    _c0011 = vec2(TEX0.x, PSParam1.x);'#13+
    '    _TMP0 = texture2D(texture2, _c0011);'#13+
    '    _a0013 = _progress0009 + _progress0009*_TMP0.x;'#13+
    '    _offset0009 = min(_a0013, 1.00000000E+000);'#13+
    '    _uv0009.y = TEX0.y - _offset0009;'#13+
    '    if (_uv0009.y > 0.0) { '#13+
    '        _TMP8 = texture2D(texture0, _uv0009);'#13+
    '    } else {'#13+
    '        _TMP1 = fract(_uv0009);'#13+
    '        _TMP8 = texture2D(texture1, _TMP1);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP8;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
  FNeedInternalSecondTex := 'clouds';
end;

class function TBloodTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('BloodTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0.3, 0, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TBandedSwirlTransition }

constructor TBandedSwirlTransition.Create;
const
  DX9PS2BIN: array [0..1347] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $4D, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $09, $01, $00, $00, $00, $02, $FF, $FF, $06, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $02, $01, $00, $00,
    $94, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $A0, $00, $00, $00, $00, $00, $00, $00, $B0, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $BC, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $BC, $00, $00, $00, $00, $00, $00, $00, $D5, $00, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $DC, $00, $00, $00, $00, $00, $00, $00,
    $EC, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $A0, $00, $00, $00, $00, $00, $00, $00, $F6, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $A0, $00, $00, $00, $00, $00, $00, $00,
    $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB,
    $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $63, $65, $6E, $74, $65, $72, $00, $01, $00, $03, $00, $01, $00, $02, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $66, $72, $65, $71, $75, $65, $6E, $63, $79, $00, $74, $77, $69, $73, $74, $41, $6D, $6F, $75, $6E, $74, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63,
    $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $51, $00, $00, $05,
    $04, $00, $0F, $A0, $04, $1D, $A9, $BE, $38, $F7, $7F, $3F, $00, $00, $00, $00, $00, $00, $80, $3F, $51, $00, $00, $05, $05, $00, $0F, $A0, $00, $00, $00, $00, $5F, $AE, $AA, $3C, $36, $5A, $AE, $BD,
    $E2, $76, $38, $3E, $51, $00, $00, $05, $06, $00, $0F, $A0, $00, $00, $00, $C0, $DB, $0F, $C9, $3F, $DB, $0F, $49, $C0, $DB, $0F, $C9, $40, $51, $00, $00, $05, $07, $00, $0F, $A0, $83, $F9, $22, $3E,
    $00, $00, $00, $3F, $0A, $D7, $23, $3C, $00, $00, $00, $00, $51, $00, $00, $05, $08, $00, $0F, $A0, $01, $0D, $D0, $B5, $61, $0B, $B6, $B7, $AB, $AA, $2A, $3B, $89, $88, $88, $39, $51, $00, $00, $05,
    $09, $00, $0F, $A0, $AB, $AA, $AA, $BC, $00, $00, $00, $BE, $00, $00, $80, $3F, $00, $00, $00, $3F, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90,
    $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $03, $00, $E4, $A1, $5A, $00, $00, $04, $00, $00, $04, $80,
    $00, $00, $E4, $80, $00, $00, $E4, $80, $05, $00, $00, $A0, $07, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $80, $00, $00, $AA, $80,
    $06, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $23, $00, $00, $02, $00, $00, $08, $80, $00, $00, $55, $80, $23, $00, $00, $02, $01, $00, $08, $80, $00, $00, $00, $80, $0B, $00, $00, $03,
    $02, $00, $08, $80, $00, $00, $FF, $80, $01, $00, $FF, $80, $06, $00, $00, $02, $01, $00, $01, $80, $02, $00, $FF, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $01, $00, $FF, $80, $00, $00, $FF, $80,
    $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $81, $01, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $02, $00, $00, $80, $05, $00, $00, $03, $01, $00, $02, $80,
    $01, $00, $00, $80, $01, $00, $00, $80, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $05, $00, $55, $A0, $05, $00, $AA, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80,
    $01, $00, $AA, $80, $05, $00, $FF, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $00, $A0, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $55, $80,
    $01, $00, $AA, $80, $04, $00, $55, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $01, $00, $55, $80, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $00, $80, $06, $00, $00, $A0,
    $06, $00, $55, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $FF, $80, $04, $00, $AA, $A0, $04, $00, $FF, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $55, $80, $00, $00, $FF, $80,
    $01, $00, $00, $80, $58, $00, $00, $04, $01, $00, $01, $80, $00, $00, $00, $80, $04, $00, $AA, $A0, $04, $00, $FF, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $00, $80, $06, $00, $AA, $A0,
    $00, $00, $FF, $80, $02, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $FF, $80, $0A, $00, $00, $03, $01, $00, $02, $80, $00, $00, $00, $80, $00, $00, $55, $80, $0B, $00, $00, $03,
    $01, $00, $04, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $01, $80, $01, $00, $55, $80, $04, $00, $AA, $A0, $04, $00, $FF, $A0, $58, $00, $00, $04, $00, $00, $02, $80,
    $01, $00, $AA, $80, $04, $00, $FF, $A0, $04, $00, $AA, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80,
    $01, $00, $00, $81, $00, $00, $FF, $80, $05, $00, $00, $03, $00, $00, $02, $80, $00, $00, $AA, $80, $02, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $80, $07, $00, $00, $A0,
    $07, $00, $55, $A0, $13, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $80, $06, $00, $FF, $A0, $06, $00, $AA, $A0, $25, $00, $00, $04,
    $01, $00, $02, $80, $00, $00, $55, $80, $08, $00, $E4, $A0, $09, $00, $E4, $A0, $05, $00, $00, $03, $00, $00, $02, $80, $01, $00, $55, $80, $01, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $02, $80,
    $00, $00, $55, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $55, $80, $07, $00, $AA, $A0, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80,
    $07, $00, $00, $A0, $07, $00, $55, $A0, $13, $00, $00, $02, $00, $00, $01, $80, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $06, $00, $FF, $A0, $06, $00, $AA, $A0,
    $25, $00, $00, $04, $01, $00, $03, $80, $00, $00, $00, $80, $08, $00, $E4, $A0, $09, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $AA, $80, $03, $00, $E4, $A0,
    $13, $00, $00, $02, $00, $00, $03, $80, $00, $00, $E4, $80, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0,
    $01, $08, $E4, $A0, $01, $00, $00, $02, $02, $00, $04, $80, $07, $00, $AA, $A0, $05, $00, $00, $03, $02, $00, $01, $80, $02, $00, $AA, $80, $00, $00, $00, $A0, $12, $00, $00, $04, $03, $00, $0F, $80,
    $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[7] = { program.local[0..3],'#13+
    '		{ 0.0099999998, 0, 1, -0.01348047 },'#13+
    '		{ 0.05747731, 0.1212391, 0.1956359, 0.33299461 },'#13+
    '		{ 0.99999559, 1.570796, 3.141593 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.zw, fragment.texcoord[0].xyxy, -c[3].xyxy;'#13+
    'MUL R0.xy, R0.zwzw, R0.zwzw;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'RSQ R0.x, R0.x;'#13+
    'MUL R0.zw, R0.x, R0;'#13+
    'ABS R1.x, R0.z;'#13+
    'ABS R0.y, R0.w;'#13+
    'MAX R1.y, R1.x, R0;'#13+
    'RCP R1.z, R1.y;'#13+
    'MIN R1.y, R1.x, R0;'#13+
    'MUL R1.y, R1, R1.z;'#13+
    'MUL R1.z, R1.y, R1.y;'#13+
    'MUL R1.w, R1.z, c[4];'#13+
    'SLT R0.y, R1.x, R0;'#13+
    'ADD R1.w, R1, c[5].x;'#13+
    'MAD R1.w, R1, R1.z, -c[5].y;'#13+
    'MAD R1.w, R1, R1.z, c[5].z;'#13+
    'MAD R1.w, R1, R1.z, -c[5];'#13+
    'MAD R1.z, R1.w, R1, c[6].x;'#13+
    'MUL R1.x, R1.z, R1.y;'#13+
    'ABS R0.y, R0;'#13+
    'SLT R0.z, R0, c[4].y;'#13+
    'ABS R0.z, R0;'#13+
    'MOV R2.x, c[0];'#13+
    'ADD R1.y, -R1.x, c[6];'#13+
    'CMP R0.y, -R0, c[4], c[4].z;'#13+
    'CMP R1.x, -R0.y, R1, R1.y;'#13+
    'SLT R0.y, R0.w, c[4];'#13+
    'ABS R0.y, R0;'#13+
    'ADD R1.y, -R1.x, c[6].z;'#13+
    'CMP R0.z, -R0, c[4].y, c[4];'#13+
    'CMP R0.z, -R0, R1.x, R1.y;'#13+
    'CMP R0.y, -R0, c[4], c[4].z;'#13+
    'CMP R0.w, -R0.y, R0.z, -R0.z;'#13+
    'RCP R0.z, R0.x;'#13+
    'MUL R0.x, R0.z, c[2];'#13+
    'MOV R0.y, c[1].x;'#13+
    'MUL R0.y, R0, c[4].x;'#13+
    'SIN R0.x, R0.x;'#13+
    'MUL R0.x, R0, R0.y;'#13+
    'MAD R0.x, R0, c[0], R0.w;'#13+
    'SIN R0.y, R0.x;'#13+
    'COS R0.x, R0.x;'#13+
    'MAD R0.xy, R0, R0.z, c[3];'#13+
    'FRC R0.xy, R0;'#13+
    'TEX R1, R0, texture[0], 2D;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MUL R2.x, R2, c[4];'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec2 _TMP1;'#13+
    'float _TMP0;'#13+
    'float _TMP7;'#13+
    'float _TMP6;'#13+
    'float _TMP3;'#13+
    'float _TMP5;'#13+
    'float _TMP4;'#13+
    'float _TMP2;'#13+
    'float _TMP8;'#13+
    'vec4 _TMP15;'#13+
    'vec2 _toUV0016;'#13+
    'vec2 _normToUV0016;'#13+
    'float _angle0016;'#13+
    'vec2 _newUV0016;'#13+
    'vec4 _c10016;'#13+
    'vec4 _c20016;'#13+
    'float _TMP17;'#13+
    'float _t30026;'#13+
    'float _t10026;'#13+
    'float _t00026;'#13+
    'float _t40026;'#13+
    'float _a0040;'#13+
    'float _s0041;'#13+
    'float _c0041;'#13+
    'float _t0053;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _toUV0016 = TEX0.xy - PSParam3.xy;'#13+
    '    _TMP2 = dot(_toUV0016, _toUV0016);'#13+
    '    _TMP8 = inversesqrt(_TMP2);'#13+
    '    _TMP17 = 1.00000000E+000/_TMP8;'#13+
    '    _normToUV0016 = _toUV0016/_TMP17;'#13+
    '    _t30026 = abs(_normToUV0016.x);'#13+
    '    _t10026 = abs(_normToUV0016.y);'#13+
    '    _t00026 = max(_t30026, _t10026);'#13+
    '    _t10026 = min(_t30026, _t10026);'#13+
    '    _t30026 = 1.00000000E+000/_t00026;'#13+
    '    _t30026 = _t10026*_t30026;'#13+
    '    _t40026 = _t30026*_t30026;'#13+
    '    _t00026 = -1.34804696E-002*_t40026 + 5.74773103E-002;'#13+
    '    _t00026 = _t00026*_t40026 - 1.21239103E-001;'#13+
    '    _t00026 = _t00026*_t40026 + 1.95635900E-001;'#13+
    '    _t00026 = _t00026*_t40026 - 3.32994610E-001;'#13+
    '    _t00026 = _t00026*_t40026 + 9.99995589E-001;'#13+
    '    _t30026 = _t00026*_t30026;'#13+
    '    _TMP4 = abs(_normToUV0016.y);'#13+
    '    _TMP5 = abs(_normToUV0016.x);'#13+
    '    if (_TMP4 > _TMP5) { '#13+
    '        _TMP3 = 1.57079601E+000 - _t30026;'#13+
    '    } else {'#13+
    '        _TMP3 = _t30026;'#13+
    '    } // end if'#13+
    '    if (_normToUV0016.x < 0.0) { '#13+
    '        _TMP6 = 3.14159298E+000 - _TMP3;'#13+
    '    } else {'#13+
    '        _TMP6 = _TMP3;'#13+
    '    } // end if'#13+
    '    if (_normToUV0016.y < 0.0) { '#13+
    '        _TMP7 = -_TMP6;'#13+
    '    } else {'#13+
    '        _TMP7 = _TMP6;'#13+
    '    } // end if'#13+
    '    _a0040 = _TMP17*PSParam2.x;'#13+
    '    _TMP0 = sin(_a0040);'#13+
    '    _angle0016 = _TMP7 + _TMP0*(PSParam1.x/1.00000000E+002)*PSParam0.x;'#13+
    '    _s0041 = sin(_angle0016);'#13+
    '    _c0041 = cos(_angle0016);'#13+
    '    _newUV0016.y = _s0041;'#13+
    '    _newUV0016.x = _c0041;'#13+
    '    _newUV0016 = _newUV0016*_TMP17 + PSParam3.xy;'#13+
    '    _TMP1 = fract(_newUV0016);'#13+
    '    _c10016 = texture2D(texture0, _TMP1);'#13+
    '    _c20016 = texture2D(texture1, TEX0.xy);'#13+
    '    _t0053 = PSParam0.x/1.00000000E+002;'#13+
    '    _TMP15 = _c10016 + _t0053*(_c20016 - _c10016);'#13+
    '    gl_FragColor = _TMP15;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TBandedSwirlTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('BandedSwirlTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Strength', 'The amount of twist to the spiral.', TShaderValueType.vtFloat, 1, 0, 10),
    FilterValueRec('Frequency', 'The frequency of the spiral.', TShaderValueType.vtFloat, 20, 0, 100),
    FilterValueRec('Center', 'The center point of the ripples.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TBlindTransition }

constructor TBlindTransition.Create;
const
  DX9PS2BIN: array [0..431] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $3B, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $C0, $00, $00, $00, $00, $02, $FF, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $B9, $00, $00, $00,
    $6C, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $7C, $00, $00, $00, $00, $00, $00, $00, $8C, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $7C, $00, $00, $00, $00, $00, $00, $00,
    $95, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A0, $00, $00, $00, $00, $00, $00, $00, $B0, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A0, $00, $00, $00, $00, $00, $00, $00,
    $4E, $75, $6D, $62, $65, $72, $4F, $66, $42, $6C, $69, $6E, $64, $73, $00, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73,
    $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $70, $73, $5F,
    $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20,
    $00, $AB, $AB, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0,
    $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $05, $00, $00, $03, $02, $00, $08, $80, $00, $00, $55, $B0, $01, $00, $00, $A0, $13, $00, $00, $02, $02, $00, $01, $80,
    $02, $00, $FF, $80, $01, $00, $00, $02, $03, $00, $08, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $02, $00, $01, $80, $03, $00, $FF, $80, $02, $00, $00, $A1, $02, $00, $00, $80, $58, $00, $00, $04,
    $00, $00, $0F, $80, $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.y, c[0].x;'#13+
    'MUL R0.x, fragment.texcoord[0].y, c[1];'#13+
    'MUL R0.y, R0, c[2].x;'#13+
    'FRC R0.x, R0;'#13+
    'SLT R1.x, R0, R0.y;'#13+
    'ABS R2.x, R1;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[1], 2D;'#13+
    'CMP R2.x, -R2, c[2].z, c[2].y;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'float _TMP0;'#13+
    'vec4 _TMP6;'#13+
    'float _x0009;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _x0009 = TEX0.y*PSParam1.x;'#13+
    '    _TMP0 = fract(_x0009);'#13+
    '    if (_TMP0 < PSParam0.x/1.00000000E+002) { '#13+
    '        _TMP6 = texture2D(texture1, TEX0.xy);'#13+
    '    } else {'#13+
    '        _TMP6 = texture2D(texture0, TEX0.xy);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP6;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TBlindTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('BlindTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('NumberOfBlinds', 'The number of Blinds strips', TShaderValueType.vtFloat, 5, 2, 15),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TCircleTransition }

constructor TCircleTransition.Create;
const
  DX9PS2BIN: array [0..663] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $4E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0C, $01, $00, $00, $00, $02, $FF, $FF, $06, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $05, $01, $00, $00,
    $94, $00, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $A0, $00, $00, $00, $00, $00, $00, $00, $B0, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $BC, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $BC, $00, $00, $00, $00, $00, $00, $00, $D8, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $BC, $00, $00, $00, $00, $00, $00, $00,
    $E1, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $EC, $00, $00, $00, $00, $00, $00, $00, $FC, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $EC, $00, $00, $00, $00, $00, $00, $00,
    $43, $65, $6E, $74, $65, $72, $50, $6F, $69, $6E, $74, $00, $01, $00, $03, $00, $01, $00, $02, $00, $01, $00, $00, $00, $00, $00, $00, $00, $43, $69, $72, $63, $6C, $65, $53, $69, $7A, $65, $00, $AB,
    $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $46, $75, $7A, $7A, $79, $41, $6D, $6F, $75, $6E, $74, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $54, $65, $78,
    $74, $75, $72, $65, $31, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00,
    $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB,
    $51, $00, $00, $05, $04, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $40, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03,
    $01, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $02, $00, $00, $03, $02, $00, $03, $80, $00, $00, $E4, $B0, $03, $00, $E4, $A1, $5A, $00, $00, $04, $02, $00, $01, $80, $02, $00, $E4, $80,
    $02, $00, $E4, $80, $04, $00, $AA, $A0, $07, $00, $00, $02, $02, $00, $01, $80, $02, $00, $00, $80, $06, $00, $00, $02, $02, $00, $01, $80, $02, $00, $00, $80, $01, $00, $00, $02, $03, $00, $03, $80,
    $04, $00, $E4, $A0, $05, $00, $00, $03, $02, $00, $02, $80, $03, $00, $00, $80, $00, $00, $00, $A0, $01, $00, $00, $02, $03, $00, $01, $80, $01, $00, $00, $A0, $04, $00, $00, $04, $02, $00, $04, $80,
    $03, $00, $00, $80, $03, $00, $55, $80, $02, $00, $00, $A0, $04, $00, $00, $04, $02, $00, $02, $80, $02, $00, $55, $80, $02, $00, $AA, $80, $01, $00, $00, $A1, $02, $00, $00, $03, $02, $00, $01, $80,
    $02, $00, $00, $80, $02, $00, $55, $81, $02, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $80, $01, $00, $00, $A0, $02, $00, $00, $03, $02, $00, $02, $80, $01, $00, $00, $A0, $01, $00, $00, $A0,
    $06, $00, $00, $02, $02, $00, $02, $80, $02, $00, $55, $80, $05, $00, $00, $03, $02, $00, $11, $80, $02, $00, $00, $80, $02, $00, $55, $80, $12, $00, $00, $04, $03, $00, $0F, $80, $02, $00, $00, $80,
    $00, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[5] = { program.local[0..3],'#13+
    '		{ 0.0099999998, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R2.xy, fragment.texcoord[0], -c[3];'#13+
    'MUL R2.xy, R2, R2;'#13+
    'ADD R2.x, R2, R2.y;'#13+
    'MOV R2.y, c[4];'#13+
    'MUL R2.y, R2, c[1].x;'#13+
    'ADD R2.z, R2.y, c[2].x;'#13+
    'RSQ R2.x, R2.x;'#13+
    'MOV R2.w, c[0].x;'#13+
    'MUL R2.w, R2, c[4].x;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[0], 2D;'#13+
    'ADD R1, R1, -R0;'#13+
    'MAD R2.z, R2.w, R2, -c[1].x;'#13+
    'RCP R2.x, R2.x;'#13+
    'ADD R2.x, R2, -R2.z;'#13+
    'RCP R2.y, R2.y;'#13+
    'ADD R2.x, R2, c[1];'#13+
    'MUL_SAT R2.x, R2, R2.y;'#13+
    'MAD result.color, R2.x, R1, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'float _TMP2;'#13+
    'float _TMP0;'#13+
    'float _TMP1;'#13+
    'vec4 _TMP10;'#13+
    'float _radius0011;'#13+
    'float _progress0011;'#13+
    'float _distFromCircle0011;'#13+
    'vec4 _c10011;'#13+
    'vec4 _c20011;'#13+
    'float _TMP12;'#13+
    'vec2 _v0013;'#13+
    'float _x0025;'#13+
    'float _TMP26;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0011 = PSParam0.x/1.00000000E+002;'#13+
    '    _radius0011 = -PSParam1.x + _progress0011*(PSParam2.x + 2.00000000E+000*PSParam1.x);'#13+
    '    _v0013 = TEX0.xy - PSParam3.xy;'#13+
    '    _TMP0 = dot(_v0013, _v0013);'#13+
    '    _TMP1 = inversesqrt(_TMP0);'#13+
    '    _TMP12 = 1.00000000E+000/_TMP1;'#13+
    '    _distFromCircle0011 = _TMP12 - _radius0011;'#13+
    '    _c10011 = texture2D(texture0, TEX0.xy);'#13+
    '    _c20011 = texture2D(texture1, TEX0.xy);'#13+
    '    _x0025 = (_distFromCircle0011 + PSParam1.x)/(2.00000000E+000*PSParam1.x);'#13+
    '    _TMP2 = min(1.00000000E+000, _x0025);'#13+
    '    _TMP26 = max(0.0, _TMP2);'#13+
    '    _TMP10 = _c20011 + _TMP26*(_c10011 - _c20011);'#13+
    '    gl_FragColor = _TMP10;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TCircleTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('CircleTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('FuzzyAmount', 'The fuzziness factor.', TShaderValueType.vtFloat, 0.1, 0, 1),
    FilterValueRec('Size', 'The size of the circle.', TShaderValueType.vtFloat, 1, 0, 2),
    FilterValueRec('Center', 'The center point of effect.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TMagnifyTransition }

constructor TMagnifyTransition.Create;
const
  DX9PS2BIN: array [0..799] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $3F, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $D0, $00, $00, $00, $00, $02, $FF, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $C9, $00, $00, $00,
    $6C, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $78, $00, $00, $00, $00, $00, $00, $00, $88, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $94, $00, $00, $00, $00, $00, $00, $00,
    $A4, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $B0, $00, $00, $00, $00, $00, $00, $00, $C0, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $B0, $00, $00, $00, $00, $00, $00, $00,
    $43, $65, $6E, $74, $65, $72, $50, $6F, $69, $6E, $74, $00, $01, $00, $03, $00, $01, $00, $02, $00, $01, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB,
    $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20,
    $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0, $6A, $B4, $E7, $3B, $00, $00, $00, $00, $00, $00, $00, $3F,
    $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0,
    $01, $00, $00, $02, $00, $00, $08, $80, $02, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $00, $A0, $02, $00, $00, $03, $01, $00, $03, $80, $00, $00, $E4, $B0,
    $01, $00, $E4, $A1, $5A, $00, $00, $04, $00, $00, $02, $80, $01, $00, $E4, $80, $01, $00, $E4, $80, $02, $00, $55, $A0, $07, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80, $05, $00, $00, $03,
    $01, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $55, $80, $06, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80, $04, $00, $00, $04, $02, $00, $03, $80, $00, $00, $00, $80, $01, $00, $E4, $80,
    $01, $00, $E4, $A0, $02, $00, $00, $03, $02, $00, $03, $80, $02, $00, $E4, $81, $00, $00, $E4, $B0, $5A, $00, $00, $04, $00, $00, $04, $80, $02, $00, $E4, $80, $02, $00, $E4, $80, $02, $00, $55, $A0,
    $07, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $06, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $23, $00, $00, $02, $02, $00, $03, $80, $01, $00, $E4, $80, $0B, $00, $00, $03,
    $01, $00, $04, $80, $02, $00, $55, $80, $02, $00, $00, $80, $04, $00, $00, $04, $01, $00, $08, $80, $00, $00, $00, $A0, $00, $00, $FF, $81, $01, $00, $AA, $80, $06, $00, $00, $02, $01, $00, $08, $80,
    $01, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $08, $80, $00, $00, $AA, $80, $01, $00, $FF, $80, $05, $00, $00, $03, $02, $00, $03, $80, $01, $00, $E4, $80, $01, $00, $AA, $80, $05, $00, $00, $03,
    $00, $00, $04, $80, $01, $00, $AA, $80, $02, $00, $AA, $A0, $04, $00, $00, $04, $02, $00, $03, $80, $01, $00, $FF, $80, $02, $00, $E4, $80, $01, $00, $E4, $A0, $05, $00, $00, $03, $01, $00, $03, $80,
    $01, $00, $E4, $80, $00, $00, $AA, $80, $0A, $00, $00, $03, $01, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $00, $80, $06, $00, $00, $02, $00, $00, $01, $80, $01, $00, $AA, $80, $05, $00, $00, $03,
    $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $04, $00, $00, $04, $01, $00, $03, $80, $00, $00, $00, $80, $01, $00, $E4, $80, $01, $00, $E4, $A0, $42, $00, $00, $03, $02, $00, $0F, $80,
    $02, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $01, $08, $E4, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $A0, $00, $00, $FF, $81,
    $00, $00, $55, $80, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $00, $80, $02, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00

  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[4] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 0.5, 1, 0 },'#13+
    '		{ 0.70710677 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.zw, fragment.texcoord[0].xyxy, -c[1].xyxy;'#13+
    'MUL R0.xy, R0.zwzw, R0.zwzw;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'RSQ R0.x, R0.x;'#13+
    'MUL R0.zw, R0.x, R0;'#13+
    'ABS R1.xy, R0.zwzw;'#13+
    'SLT R1.z, R1.y, R1.x;'#13+
    'ABS R1.z, R1;'#13+
    'MOV R0.y, c[0].x;'#13+
    'MUL R0.y, R0, c[2].x;'#13+
    'MUL R2.y, R0, c[3].x;'#13+
    'CMP R2.z, -R1, c[2].w, c[2];'#13+
    'RCP R0.x, R0.x;'#13+
    'SLT R1.z, R0.x, R2.y;'#13+
    'MUL R0.y, R1.z, R2.z;'#13+
    'CMP R0.y, -R0, R1, R1.x;'#13+
    'MUL R0.y, R0, c[2];'#13+
    'MIN R1.w, R2.y, R0.y;'#13+
    'ABS R2.x, R1.z;'#13+
    'CMP R2.x, -R2, c[2].w, c[2].z;'#13+
    'RCP R1.w, R1.w;'#13+
    'MUL R1.w, R0.x, R1;'#13+
    'MUL R0.xy, R0.zwzw, R0.y;'#13+
    'MAD R1.zw, R1.w, R0.xyxy, c[1].xyxy;'#13+
    'MAD R0.xy, R2.y, R0.zwzw, c[1];'#13+
    'MUL R2.z, R2.x, R2;'#13+
    'CMP R1.x, -R2.z, R1.y, R1;'#13+
    'ADD R0.xy, fragment.texcoord[0], -R0;'#13+
    'MUL R0.xy, R0, R0;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'ADD R0.y, -R2, R1.x;'#13+
    'MUL R0.zw, R0, R1.x;'#13+
    'RSQ R0.x, R0.x;'#13+
    'RCP R0.y, R0.y;'#13+
    'RCP R0.x, R0.x;'#13+
    'MUL R0.x, R0, R0.y;'#13+
    'MAD R0.xy, R0.x, R0.zwzw, c[1];'#13+
    'TEX R1, R1.zwzw, texture[1], 2D;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'float _TMP2;'#13+
    'float _TMP4;'#13+
    'float _TMP3;'#13+
    'vec4 _TMP10;'#13+
    'float _radius0011;'#13+
    'float _progress0011;'#13+
    'vec2 _toUV0011;'#13+
    'vec2 _normToUV0011;'#13+
    'float _distFromCenterToEdge10011;'#13+
    'vec2 _edgePoint10011;'#13+
    'float _minRadius10011;'#13+
    'float _percentFromCenterToRadius10011;'#13+
    'vec2 _newUV10011;'#13+
    'vec2 _edgePoint20011;'#13+
    'float _distFromRadiusToEdge10011;'#13+
    'vec2 _radiusPoint10011;'#13+
    'vec2 _radiusToUV10011;'#13+
    'float _percentFromRadiusToEdge10011;'#13+
    'vec2 _newUV20011;'#13+
    'float _TMP12;'#13+
    'vec2 _dir0021;'#13+
    'vec2 _dir0031;'#13+
    'float _TMP34;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0011 = PSParam0.x/1.00000000E+002;'#13+
    '    _radius0011 = _progress0011*7.07106769E-001;'#13+
    '    _toUV0011 = TEX0.xy - PSParam1.xy;'#13+
    '    _TMP2 = dot(_toUV0011, _toUV0011);'#13+
    '    _TMP4 = inversesqrt(_TMP2);'#13+
    '    _TMP12 = 1.00000000E+000/_TMP4;'#13+
    '    _normToUV0011 = _toUV0011/_TMP12;'#13+
    '    if (_TMP12 < _radius0011) { '#13+
    '        _dir0021 = abs(_normToUV0011);'#13+
    '        if (_dir0021.x > _dir0021.y) { '#13+
    '            _TMP3 = _dir0021.x;'#13+
    '        } else {'#13+
    '            _TMP3 = _dir0021.y;'#13+
    '        } // end if'#13+
    '        _distFromCenterToEdge10011 = _TMP3/2.00000000E+000;'#13+
    '        _edgePoint10011 = PSParam1.xy + _distFromCenterToEdge10011*_normToUV0011;'#13+
    '        _minRadius10011 = min(_radius0011, _distFromCenterToEdge10011);'#13+
    '        _percentFromCenterToRadius10011 = _TMP12/_minRadius10011;'#13+
    '        _newUV10011 = PSParam1.xy + _percentFromCenterToRadius10011*(_edgePoint10011 - PSParam1.xy);'#13+
    '        _TMP10 = texture2D(texture1, _newUV10011);'#13+
    '    } else {'#13+
    '        _dir0031 = abs(_normToUV0011);'#13+
    '        if (_dir0031.x > _dir0031.y) { '#13+
    '            _TMP3 = _dir0031.x;'#13+
    '        } else {'#13+
    '            _TMP3 = _dir0031.y;'#13+
    '        } // end if'#13+
    '        _edgePoint20011 = PSParam1.xy + _TMP3*_normToUV0011;'#13+
    '        _distFromRadiusToEdge10011 = _TMP3 - _radius0011;'#13+
    '        _radiusPoint10011 = PSParam1.xy + _radius0011*_normToUV0011;'#13+
    '        _radiusToUV10011 = TEX0.xy - _radiusPoint10011;'#13+
    '        _TMP2 = dot(_radiusToUV10011, _radiusToUV10011);'#13+
    '        _TMP4 = inversesqrt(_TMP2);'#13+
    '        _TMP34 = 1.00000000E+000/_TMP4;'#13+
    '        _percentFromRadiusToEdge10011 = _TMP34/_distFromRadiusToEdge10011;'#13+
    '        _newUV20011 = PSParam1.xy + _percentFromRadiusToEdge10011*(_edgePoint20011 - PSParam1.xy);'#13+
    '        _TMP10 = texture2D(texture0, _newUV20011);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP10;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TMagnifyTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('MagnifyTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Center', 'The center point of effect.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TCrumpleTransition }

constructor TCrumpleTransition.Create;
const
  DX9PS2BIN: array [0..699] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $66, $66, $66, $3F, $CD, $CC, $4C, $3E, $0A, $D7, $A3, $3C, $51, $00, $00, $05, $03, $00, $0F, $A0, $00, $00, $00, $40, $00, $00, $80, $BF, $0A, $D7, $A3, $3C, $00, $00, $80, $3F,
    $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $02, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $0B, $80, $02, $00, $E4, $A0, $0A, $00, $00, $03, $01, $00, $08, $80, $01, $00, $00, $A0, $00, $00, $55, $80, $04, $00, $00, $04,
    $00, $00, $02, $80, $00, $00, $55, $B0, $02, $00, $AA, $A0, $01, $00, $FF, $80, $13, $00, $00, $02, $01, $00, $02, $80, $00, $00, $55, $80, $05, $00, $00, $03, $01, $00, $01, $80, $00, $00, $00, $B0,
    $02, $00, $AA, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $02, $08, $E4, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $00, $A0, $03, $00, $55, $A0,
    $01, $00, $00, $02, $02, $00, $0E, $80, $03, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $00, $A0, $02, $00, $AA, $80, $02, $00, $55, $80, $02, $00, $00, $03, $00, $00, $02, $80,
    $00, $00, $55, $81, $03, $00, $FF, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $FF, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $00, $00, $00, $A0, $02, $00, $AA, $81,
    $02, $00, $FF, $80, $58, $00, $00, $04, $00, $00, $02, $80, $00, $00, $FF, $80, $00, $00, $AA, $80, $00, $00, $55, $80, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $55, $80,
    $00, $00, $E4, $B0, $13, $00, $00, $02, $01, $00, $03, $80, $01, $00, $E4, $80, $42, $00, $00, $03, $02, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80,
    $01, $00, $E4, $80, $01, $08, $E4, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $00, $A0, $12, $00, $00, $04, $03, $00, $0F, $80, $00, $00, $00, $80, $01, $00, $E4, $80,
    $02, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[4] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 0.2, 0.89999998, 2 },'#13+
    '		{ 1, 2, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[2].z;'#13+
    'MIN R0.y, R0.x, c[1].x;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[2];'#13+
    'MUL R0.z, R2.x, c[2].w;'#13+
    'MAD R0.y, fragment.texcoord[0], c[2], R0;'#13+
    'ADD R1.x, -R0.z, c[3].y;'#13+
    'ADD R0.w, R0.z, -c[3].x;'#13+
    'CMP R0.z, -R0.w, R1.x, R0;'#13+
    'FRC R0.y, R0;'#13+
    'MUL R0.x, fragment.texcoord[0], c[2].y;'#13+
    'TEX R0.xy, R0, texture[2], 2D;'#13+
    'MUL R0.xy, R0, c[2].w;'#13+
    'ADD R0.xy, R0, -c[3].x;'#13+
    'MAD R0.xy, R0, R0.z, fragment.texcoord[0];'#13+
    'FRC R0.xy, R0;'#13+
    'TEX R1, R0, texture[0], 2D;'#13+
    'TEX R0, R0, texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec2 _TMP4;'#13+
    'vec2 _TMP3;'#13+
    'vec4 _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP0;'#13+
    'vec4 _TMP11;'#13+
    'vec2 _offset0012;'#13+
    'float _p0012;'#13+
    'float _progress0012;'#13+
    'vec4 _c10012;'#13+
    'vec4 _c20012;'#13+
    'float _x0016;'#13+
    'vec2 _c0018;'#13+
    'vec2 _x0020;'#13+
    'vec2 _x0024;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0012 = PSParam0.x/1.00000000E+002;'#13+
    '    _TMP0 = min(8.99999976E-001, PSParam1.x);'#13+
    '    _x0016 = TEX0.y/5.00000000E+000 + _TMP0;'#13+
    '    _TMP1 = fract(_x0016);'#13+
    '    _c0018 = vec2(TEX0.x/5.00000000E+000, _TMP1);'#13+
    '    _TMP2 = texture2D(texture2, _c0018);'#13+
    '    _offset0012 = _TMP2.xy*2.00000000E+000 - 1.00000000E+000;'#13+
    '    _p0012 = _progress0012*2.00000000E+000;'#13+
    '    if (_p0012 > 1.00000000E+000) { '#13+
    '        _p0012 = 1.00000000E+000 - (_p0012 - 1.00000000E+000);'#13+
    '    } // end if'#13+
    '    _x0020 = TEX0.xy + _offset0012*_p0012;'#13+
    '    _TMP3 = fract(_x0020);'#13+
    '    _c10012 = texture2D(texture0, _TMP3);'#13+
    '    _x0024 = TEX0.xy + _offset0012*_p0012;'#13+
    '    _TMP4 = fract(_x0024);'#13+
    '    _c20012 = texture2D(texture1, _TMP4);'#13+
    '    _TMP11 = _c10012 + _progress0012*(_c20012 - _c10012);'#13+
    '    gl_FragColor = _TMP11;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TCrumpleTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('CrumpleTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0, -1, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TDissolveTransition }

constructor TDissolveTransition.Create;
const
  DX9PS2BIN: array [0..487] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $6E, $6F, $69, $73, $65, $49, $6E, $70, $75, $74, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0, $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $01, $00, $00, $A0,
    $13, $00, $00, $02, $00, $00, $03, $80, $00, $00, $E4, $80, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $02, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0,
    $00, $08, $E4, $A0, $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $01, $00, $00, $02, $03, $00, $08, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $01, $80,
    $03, $00, $FF, $80, $02, $00, $00, $A0, $00, $00, $00, $81, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $00, $80, $02, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.xy, fragment.texcoord[0], c[1].x;'#13+
    'FRC R0.xy, R0;'#13+
    'TEX R0.x, R0, texture[2], 2D;'#13+
    'MOV R0.z, c[0].x;'#13+
    'MUL R0.y, R0.z, c[2].x;'#13+
    'SLT R1.x, R0.y, R0;'#13+
    'ABS R2.x, R1;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[0], 2D;'#13+
    'CMP R2.x, -R2, c[2].z, c[2].y;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec4 _TMP1;'#13+
    'vec2 _TMP0;'#13+
    'vec4 _TMP8;'#13+
    'float _progress0009;'#13+
    'vec2 _x0011;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0009 = PSParam0.x/1.00000000E+002;'#13+
    '    _x0011 = TEX0.xy + PSParam1.x;'#13+
    '    _TMP0 = fract(_x0011);'#13+
    '    _TMP1 = texture2D(texture2, _TMP0);'#13+
    '    if (_TMP1.x > _progress0009) { '#13+
    '        _TMP8 = texture2D(texture0, TEX0.xy);'#13+
    '    } else {'#13+
    '        _TMP8 = texture2D(texture1, TEX0.xy);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP8;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TDissolveTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('DissolveTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0, -1, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TDropTransition }

constructor TDropTransition.Create;
const
  DX9PS2BIN: array [0..603] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $CD, $CC, $4C, $3E, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $B0, $02, $00, $55, $A0,
    $01, $00, $00, $02, $00, $00, $02, $80, $01, $00, $00, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $02, $08, $E4, $A0, $01, $00, $00, $02, $01, $00, $08, $80, $02, $00, $00, $A0,
    $05, $00, $00, $03, $00, $00, $02, $80, $01, $00, $FF, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $01, $00, $02, $80, $00, $00, $00, $81, $00, $00, $55, $80, $00, $00, $55, $B0, $01, $00, $00, $02,
    $01, $00, $01, $80, $00, $00, $00, $B0, $01, $00, $00, $02, $02, $00, $13, $80, $01, $00, $E4, $80, $02, $00, $00, $03, $02, $00, $03, $80, $01, $00, $E4, $81, $02, $00, $E4, $80, $5A, $00, $00, $04,
    $00, $00, $01, $80, $02, $00, $E4, $80, $02, $00, $E4, $80, $02, $00, $AA, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $02, $00, $0F, $80,
    $00, $00, $E4, $B0, $01, $08, $E4, $A0, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $81, $01, $00, $E4, $80, $02, $00, $AA, $A0, $12, $00, $00, $04, $03, $00, $0F, $80, $00, $00, $55, $80,
    $02, $00, $E4, $80, $01, $00, $E4, $80, $58, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $FF, $81, $02, $00, $E4, $80, $03, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80,
    $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0.2, 0.0099999998, 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R3.y, R0.x, c[2];'#13+
    'MOV R0.y, c[1].x;'#13+
    'MUL R0.x, fragment.texcoord[0], c[2];'#13+
    'TEX R0.x, R0, texture[2], 2D;'#13+
    'MAD R0.y, -R0.x, R3, fragment.texcoord[0];'#13+
    'MOV R0.x, fragment.texcoord[0];'#13+
    'MOV_SAT R0.zw, R0.xyxy;'#13+
    'ADD R0.zw, R0, -R0.xyxy;'#13+
    'ABS R0.zw, R0;'#13+
    'CMP R0.zw, -R0, c[2].z, c[2].w;'#13+
    'ADD_SAT R0.z, R0, R0.w;'#13+
    'ABS R1.x, R0.z;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'CMP R1.x, -R1, c[2].w, c[2].z;'#13+
    'CMP R1, -R1.x, R0, c[2].w;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'SGE R3.x, c[2].w, R1.w;'#13+
    'ADD R2, -R1, R0;'#13+
    'MAD R1, R3.y, R2, R1;'#13+
    'ABS R3.x, R3;'#13+
    'CMP R2.x, -R3, c[2].w, c[2].z;'#13+
    'CMP result.color, -R2.x, R1, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec2 _TMP2;'#13+
    'vec4 _TMP0;'#13+
    'vec4 _TMP8;'#13+
    'float _offset0009;'#13+
    'float _progress0009;'#13+
    'vec4 _c20009;'#13+
    'vec2 _c0011;'#13+
    'vec4 _TMP12;'#13+
    'vec2 _uv0013;'#13+
    'vec2 _TMP16;'#13+
    'bvec2 _a0025;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0009 = PSParam0.x/1.00000000E+002;'#13+
    '    _c0011 = vec2(TEX0.x/5.00000000E+000, PSParam1.x);'#13+
    '    _TMP0 = texture2D(texture2, _c0011);'#13+
    '    _offset0009 = -_TMP0.x;'#13+
    '    _uv0013 = vec2(TEX0.x, TEX0.y + _offset0009*_progress0009);'#13+
    '    _TMP2 = min(vec2( 1.00000000E+000, 1.00000000E+000), _uv0013);'#13+
    '    _TMP16 = max(vec2( 0.0, 0.0), _TMP2);'#13+
    '    _a0025 = bvec2(bool((_TMP16 - _uv0013).x), bool((_TMP16 - _uv0013).y));'#13+
    '    if (_a0025.x || _a0025.y) { '#13+
    '        _TMP12 = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } else {'#13+
    '        _TMP12 = texture2D(texture0, _uv0013);'#13+
    '    } // end if'#13+
    '    _c20009 = texture2D(texture1, TEX0.xy);'#13+
    '    if (_TMP12.w <= 0.0) { '#13+
    '        _TMP8 = _c20009;'#13+
    '    } else {'#13+
    '        _TMP8 = _TMP12 + _progress0009*(_c20009 - _TMP12);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP8;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TDropTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('DropTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0, -1, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TFadeTransition }

constructor TFadeTransition.Create;
const
  DX9PS2BIN: array [0..367] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02,
    $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80,
    $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $01, $00, $00, $02, $02, $00, $08, $80, $00, $00, $00, $A0, $05, $00, $00, $03,
    $02, $00, $01, $80, $02, $00, $FF, $80, $01, $00, $00, $A0, $12, $00, $00, $04, $03, $00, $0F, $80, $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[2] = { program.local[0],'#13+
    '		{ 0.0099999998 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R2.x, c[0];'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R1, R1, -R0;'#13+
    'MUL R2.x, R2, c[1];'#13+
    'MAD result.color, R2.x, R1, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec4 _TMP4;'#13+
    'vec4 _c10005;'#13+
    'vec4 _c20005;'#13+
    'float _progress0005;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0005 = PSParam0.x/1.00000000E+002;'#13+
    '    _c10005 = texture2D(texture0, TEX0.xy);'#13+
    '    _c20005 = texture2D(texture1, TEX0.xy);'#13+
    '    _TMP4 = _c10005 + _progress0005*(_c20005 - _c10005);'#13+
    '    gl_FragColor = _TMP4;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TFadeTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('FadeTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TBrightTransition }

constructor TBrightTransition.Create;
const
  DX9PS2BIN: array [0..1647] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $17, $B7, $D1, $B8, $00, $00, $80, $3F, $17, $B7, $D1, $38, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $00, $00, $80, $3F, $CD, $CC, $8C, $3F, $66, $66, $66, $3F, $00, $00, $00, $00, $51, $00, $00, $05, $03, $00, $0F, $A0, $00, $00, $00, $00, $17, $B7, $D1, $B8, $17, $B7, $D1, $B8,
    $17, $B7, $D1, $38, $51, $00, $00, $05, $04, $00, $0F, $A0, $17, $B7, $D1, $B8, $17, $B7, $51, $39, $17, $B7, $51, $39, $00, $00, $00, $00, $51, $00, $00, $05, $05, $00, $0F, $A0, $17, $B7, $D1, $38,
    $00, $00, $00, $00, $17, $B7, $D1, $38, $00, $00, $00, $00, $51, $00, $00, $05, $06, $00, $0F, $A0, $17, $B7, $D1, $38, $17, $B7, $51, $39, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02,
    $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $08, $80,
    $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $03, $80, $00, $00, $FF, $80, $01, $00, $55, $A0, $00, $00, $E4, $B0, $04, $00, $00, $04, $01, $00, $03, $80, $00, $00, $FF, $80, $03, $00, $E4, $A0,
    $00, $00, $E4, $B0, $04, $00, $00, $04, $02, $00, $03, $80, $00, $00, $FF, $80, $03, $00, $1B, $A0, $00, $00, $E4, $B0, $04, $00, $00, $04, $03, $00, $03, $80, $00, $00, $FF, $80, $03, $00, $D2, $A0,
    $00, $00, $E4, $B0, $04, $00, $00, $04, $04, $00, $03, $80, $00, $00, $FF, $80, $05, $00, $E4, $A0, $00, $00, $E4, $B0, $04, $00, $00, $04, $05, $00, $03, $80, $00, $00, $FF, $80, $03, $00, $1B, $A1,
    $00, $00, $E4, $B0, $04, $00, $00, $04, $06, $00, $03, $80, $00, $00, $FF, $80, $05, $00, $C9, $A0, $00, $00, $E4, $B0, $04, $00, $00, $04, $07, $00, $03, $80, $00, $00, $FF, $80, $01, $00, $FF, $A0,
    $00, $00, $E4, $B0, $04, $00, $00, $04, $08, $00, $03, $80, $00, $00, $FF, $80, $04, $00, $E4, $A0, $00, $00, $E4, $B0, $42, $00, $00, $03, $09, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0,
    $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $02, $00, $0F, $80, $02, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $03, $00, $0F, $80,
    $03, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $0A, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80, $04, $00, $E4, $80, $00, $08, $E4, $A0,
    $42, $00, $00, $03, $05, $00, $0F, $80, $05, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $06, $00, $0F, $80, $06, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $08, $00, $0F, $80,
    $08, $00, $E4, $80, $00, $08, $E4, $A0, $08, $00, $00, $03, $00, $00, $01, $80, $09, $00, $E4, $80, $02, $00, $E4, $A0, $0A, $00, $00, $03, $07, $00, $04, $80, $00, $00, $00, $80, $01, $00, $AA, $A0,
    $08, $00, $00, $03, $07, $00, $08, $80, $01, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $01, $80, $07, $00, $AA, $81, $07, $00, $FF, $80, $0A, $00, $00, $03, $00, $00, $02, $80,
    $07, $00, $AA, $80, $07, $00, $FF, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $80, $09, $00, $E4, $80, $01, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, $02, $00, $E4, $80,
    $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $04, $80, $00, $00, $55, $81, $00, $00, $00, $80, $0A, $00, $00, $03, $07, $00, $04, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04,
    $01, $00, $0F, $80, $00, $00, $AA, $80, $01, $00, $E4, $80, $02, $00, $E4, $80, $08, $00, $00, $03, $07, $00, $08, $80, $03, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $01, $80,
    $07, $00, $AA, $81, $07, $00, $FF, $80, $0A, $00, $00, $03, $00, $00, $02, $80, $07, $00, $AA, $80, $07, $00, $FF, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $80, $01, $00, $E4, $80,
    $03, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, $0A, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $04, $80, $00, $00, $55, $81, $00, $00, $00, $80, $0A, $00, $00, $03,
    $02, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $AA, $80, $01, $00, $E4, $80, $0A, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80,
    $04, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $02, $00, $00, $81, $00, $00, $00, $80, $0A, $00, $00, $03, $03, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $80,
    $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $80, $01, $00, $E4, $80, $04, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, $05, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03,
    $00, $00, $02, $80, $03, $00, $00, $81, $00, $00, $00, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $03, $00, $00, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $80,
    $01, $00, $E4, $80, $05, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, $06, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $02, $00, $00, $81, $00, $00, $00, $80,
    $0A, $00, $00, $03, $03, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $80, $01, $00, $E4, $80, $06, $00, $E4, $80, $04, $00, $00, $04,
    $00, $00, $03, $80, $00, $00, $FF, $80, $04, $00, $1B, $A0, $00, $00, $E4, $B0, $42, $00, $00, $03, $02, $00, $0F, $80, $07, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80,
    $00, $00, $E4, $80, $00, $08, $E4, $A0, $08, $00, $00, $03, $00, $00, $01, $80, $02, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $03, $00, $00, $81, $00, $00, $00, $80,
    $0A, $00, $00, $03, $05, $00, $01, $80, $03, $00, $00, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $80, $01, $00, $E4, $80, $02, $00, $E4, $80, $08, $00, $00, $03,
    $00, $00, $01, $80, $08, $00, $E4, $80, $02, $00, $E4, $A0, $02, $00, $00, $03, $00, $00, $02, $80, $05, $00, $00, $81, $00, $00, $00, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $05, $00, $00, $80,
    $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $80, $01, $00, $E4, $80, $08, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, $04, $00, $E4, $80, $02, $00, $E4, $A0,
    $02, $00, $00, $03, $00, $00, $02, $80, $02, $00, $00, $81, $00, $00, $00, $80, $0A, $00, $00, $03, $03, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80,
    $00, $00, $55, $80, $01, $00, $E4, $80, $04, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $03, $80, $00, $00, $FF, $80, $06, $00, $E4, $A0, $00, $00, $E4, $B0, $42, $00, $00, $03, $02, $00, $0F, $80,
    $00, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $08, $00, $00, $03, $00, $00, $01, $80, $02, $00, $E4, $80, $02, $00, $E4, $A0,
    $02, $00, $00, $03, $00, $00, $01, $80, $03, $00, $00, $81, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $80, $01, $00, $E4, $80, $02, $00, $E4, $80, $05, $00, $00, $03,
    $00, $00, $01, $80, $00, $00, $FF, $80, $01, $00, $00, $A0, $12, $00, $00, $04, $02, $00, $0F, $80, $00, $00, $00, $80, $04, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $02, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[4] = { program.local[0],'#13+
    '		{ 0.0099999998, 1, 2, 0 },'#13+
    '		{ 1, 1.1, 0.89999998, -1 },'#13+
    '		{ -1, 2, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.z, R0.x, c[1].x;'#13+
    'MUL R2.w, R2.z, c[1].x;'#13+
    'ADD R0.xy, fragment.texcoord[0], -R2.w;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.y, R3.x, -c[1];'#13+
    'CMP R1, R3.y, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[3].zxzw, fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'CMP R3.y, R3, R3.x, c[1];'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[2].xwzw, fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R0, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[3].xzzw, fragment.texcoord[0];'#13+
    'TEX R1, R2, texture[0], 2D;'#13+
    'CMP R2.y, R3.z, R3.x, R3;'#13+
    'DP3 R2.x, R1, c[2];'#13+
    'ADD R3.x, R2, -R2.y;'#13+
    'CMP R1, R3.x, R1, R0;'#13+
    'CMP R3.y, R3.x, R2.x, R2;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[1].ywzw, fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[2].wxzw, fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[1].wyzw, fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'ADD R2.xy, fragment.texcoord[0], R2.w;'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R1, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[3], fragment.texcoord[0];'#13+
    'TEX R0, R2, texture[0], 2D;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'DP3 R3.x, R0, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'CMP R0, R3.z, R0, R1;'#13+
    'MAD R2.xy, R2.w, c[1].wzzw, fragment.texcoord[0];'#13+
    'TEX R1, R2, texture[0], 2D;'#13+
    'CMP R3.y, R3.z, R3.x, R3;'#13+
    'DP3 R3.x, R1, c[2];'#13+
    'ADD R3.z, R3.x, -R3.y;'#13+
    'MAD R2.xy, R2.w, c[1].yzzw, fragment.texcoord[0];'#13+
    'CMP R0, R3.z, R1, R0;'#13+
    'TEX R1, R2, texture[0], 2D;'#13+
    'DP3 R2.x, R1, c[2];'#13+
    'CMP R2.y, R3.z, R3.x, R3;'#13+
    'ADD R2.x, R2, -R2.y;'#13+
    'CMP R1, R2.x, R1, R0;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.z, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _TMP5;'#13+
    'float _offset0006;'#13+
    'float _progress0006;'#13+
    'float _leastBright0006;'#13+
    'vec2 _newUV10006;'#13+
    'vec4 _color10006;'#13+
    'float _brightness10006;'#13+
    'vec4 _leastBrightColor0006;'#13+
    'vec4 _impl0006;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0006 = PSParam0.x/1.00000000E+002;'#13+
    '    _offset0006 = 9.99999978E-003*_progress0006;'#13+
    '    _leastBright0006 = 1.00000000E+000;'#13+
    '    _newUV10006 = TEX0.xy + vec2(-_offset0006, -_offset0006);'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < 1.00000000E+000) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 0.0, -1.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 1.00000000E+000, -1.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( -1.00000000E+000, 0.0)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _color10006 = texture2D(texture0, TEX0.xy);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 1.00000000E+000, 0.0)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( -1.00000000E+000, 1.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 0.0, 1.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2(_offset0006, _offset0006);'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( -1.00000000E+000, 2.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 0.0, 2.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBright0006 = _brightness10006;'#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _newUV10006 = TEX0.xy + vec2( 1.00000000E+000, 2.00000000E+000)*_offset0006;'#13+
    '    _color10006 = texture2D(texture0, _newUV10006);'#13+
    '    _brightness10006 = dot(_color10006.xyz, vec3( 1.00000000E+000, 1.10000002E+000, 8.99999976E-001));'#13+
    '    if (_brightness10006 < _leastBright0006) { '#13+
    '        _leastBrightColor0006 = _color10006;'#13+
    '    } // end if'#13+
    '    _impl0006 = texture2D(texture1, TEX0.xy);'#13+
    '    _TMP5 = _leastBrightColor0006 + _progress0006*(_impl0006 - _leastBrightColor0006);'#13+
    '    gl_FragColor = _TMP5;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TBrightTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('BrightTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TPixelateTransition }

constructor TPixelateTransition.Create;
const
  DX9PS2BIN: array [0..611] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $BF, $0A, $D7, $A3, $3C, $00, $00, $80, $3F, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $00, $00, $7A, $44, $00, $00, $A0, $40, $0A, $D7, $23, $3C, $CD, $CC, $CC, $BE, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90,
    $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $0F, $80, $01, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $00, $A0,
    $00, $00, $AA, $81, $00, $00, $FF, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $A0, $00, $00, $00, $80, $00, $00, $55, $80, $02, $00, $00, $03, $00, $00, $02, $80, $00, $00, $00, $80,
    $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $55, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $00, $80,
    $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $00, $00, $E4, $B0, $00, $00, $00, $80, $01, $00, $55, $A1,
    $06, $00, $00, $02, $00, $00, $01, $80, $00, $00, $00, $80, $13, $00, $00, $02, $02, $00, $03, $80, $01, $00, $E4, $80, $02, $00, $00, $03, $01, $00, $03, $80, $01, $00, $E4, $80, $02, $00, $E4, $81,
    $05, $00, $00, $03, $00, $00, $03, $80, $00, $00, $00, $80, $01, $00, $E4, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $00, $00, $0F, $80,
    $00, $00, $E4, $80, $01, $08, $E4, $A0, $01, $00, $00, $02, $02, $00, $0C, $80, $02, $00, $E4, $A0, $04, $00, $00, $04, $02, $00, $01, $80, $00, $00, $00, $A0, $02, $00, $AA, $80, $02, $00, $FF, $80,
    $05, $00, $00, $03, $02, $00, $11, $80, $02, $00, $00, $80, $02, $00, $55, $A0, $12, $00, $00, $04, $03, $00, $0F, $80, $02, $00, $00, $80, $00, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02,
    $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0],'#13+
    '		{ 0.0099999998, 0.40000001, 5, 0.5 },'#13+
    '		{ 0, 1, 2, 1000 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[1];'#13+
    'SLT R0.x, R2, c[1].w;'#13+
    'ADD R0.y, R2.x, -c[1].w;'#13+
    'MAD R0.z, -R2.x, c[2], c[2].y;'#13+
    'ABS R0.x, R0;'#13+
    'ADD R2.x, R2, -c[1].y;'#13+
    'MUL R0.y, R0, c[2].z;'#13+
    'CMP R0.x, -R0, c[2], c[2].y;'#13+
    'CMP R0.x, -R0, R0.y, R0.z;'#13+
    'MUL R0.x, R0, R0;'#13+
    'MUL R0.x, R0, c[2].w;'#13+
    'ADD R0.x, R0, c[1].z;'#13+
    'MAD R0.zw, fragment.texcoord[0].xyxy, R0.x, c[1].w;'#13+
    'RCP R1.x, R0.x;'#13+
    'FLR R0.xy, R0.zwzw;'#13+
    'MUL R1.xy, R0, R1.x;'#13+
    'TEX R0, R1, texture[1], 2D;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MUL_SAT R2.x, R2, c[1].z;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'float _TMP1;'#13+
    'vec4 _TMP5;'#13+
    'float _progress0006;'#13+
    'float _segment_progress0006;'#13+
    'float _pixels0006;'#13+
    'vec2 _newUV0006;'#13+
    'vec4 _c10006;'#13+
    'vec4 _c20006;'#13+
    'vec2 _TMP7;'#13+
    'vec2 _a0008;'#13+
    'vec2 _x0010;'#13+
    'float _x0016;'#13+
    'float _TMP17;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0006 = PSParam0.x/1.00000000E+002;'#13+
    '    if (_progress0006 < 5.00000000E-001) { '#13+
    '        _segment_progress0006 = 1.00000000E+000 - _progress0006*2.00000000E+000;'#13+
    '    } else {'#13+
    '        _segment_progress0006 = (_progress0006 - 5.00000000E-001)*2.00000000E+000;'#13+
    '    } // end if'#13+
    '    _pixels0006 = 5.00000000E+000 + 1.00000000E+003*_segment_progress0006*_segment_progress0006;'#13+
    '    _a0008 = TEX0.xy*_pixels0006;'#13+
    '    _x0010 = _a0008 + 5.00000000E-001;'#13+
    '    _TMP7 = floor(_x0010);'#13+
    '    _newUV0006 = _TMP7/_pixels0006;'#13+
    '    _c10006 = texture2D(texture0, _newUV0006);'#13+
    '    _c20006 = texture2D(texture1, _newUV0006);'#13+
    '    _x0016 = (_progress0006 - 4.00000006E-001)/2.00000003E-001;'#13+
    '    _TMP1 = min(1.00000000E+000, _x0016);'#13+
    '    _TMP17 = max(0.0, _TMP1);'#13+
    '    _TMP5 = _c10006 + _TMP17*(_c20006 - _c10006);'#13+
    '    gl_FragColor = _TMP5;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TPixelateTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('PixelateTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TBlurTransition }

constructor TBlurTransition.Create;
const
  DX9PS2BIN: array [0..1791] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $BF, $17, $B7, $51, $39, $00, $00, $00, $40, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $00, $00, $40, $40, $00, $00, $80, $40, $00, $00, $A0, $40, $00, $00, $C0, $40, $51, $00, $00, $05, $03, $00, $0F, $A0, $00, $00, $E0, $40, $00, $00, $00, $41, $00, $00, $10, $41,
    $00, $00, $20, $41, $51, $00, $00, $05, $04, $00, $0F, $A0, $00, $00, $30, $41, $00, $00, $40, $41, $00, $00, $50, $41, $00, $00, $60, $41, $51, $00, $00, $05, $05, $00, $0F, $A0, $00, $00, $70, $41,
    $00, $00, $80, $41, $00, $00, $88, $41, $00, $00, $90, $41, $51, $00, $00, $05, $06, $00, $0F, $A0, $00, $00, $98, $41, $00, $00, $A0, $41, $00, $00, $A8, $41, $00, $00, $B0, $41, $51, $00, $00, $05,
    $07, $00, $0F, $A0, $00, $00, $B8, $41, $AB, $AA, $2A, $3D, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90,
    $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $02, $00, $00, $03, $01, $00, $03, $80,
    $00, $00, $E4, $B0, $01, $00, $55, $A0, $01, $00, $00, $02, $02, $00, $05, $80, $01, $00, $E4, $A0, $05, $00, $00, $03, $01, $00, $04, $80, $02, $00, $AA, $80, $00, $00, $00, $A0, $04, $00, $00, $04,
    $03, $00, $03, $80, $01, $00, $E4, $80, $01, $00, $AA, $81, $00, $00, $E4, $B0, $05, $00, $00, $03, $01, $00, $03, $80, $01, $00, $E4, $80, $01, $00, $AA, $80, $04, $00, $00, $04, $04, $00, $03, $80,
    $01, $00, $E4, $80, $01, $00, $FF, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $05, $00, $03, $80, $01, $00, $E4, $80, $02, $00, $00, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $06, $00, $03, $80,
    $01, $00, $E4, $80, $02, $00, $55, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $07, $00, $03, $80, $01, $00, $E4, $80, $02, $00, $AA, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $08, $00, $03, $80,
    $01, $00, $E4, $80, $02, $00, $FF, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $09, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $00, $A1, $00, $00, $E4, $B0, $42, $00, $00, $03, $03, $00, $0F, $80,
    $03, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80, $04, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $05, $00, $0F, $80, $05, $00, $E4, $80, $00, $08, $E4, $A0,
    $42, $00, $00, $03, $06, $00, $0F, $80, $06, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $07, $00, $0F, $80, $07, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $08, $00, $0F, $80,
    $08, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $09, $00, $0F, $80, $09, $00, $E4, $80, $00, $08, $E4, $A0, $02, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $03, $00, $E4, $80,
    $02, $00, $00, $03, $00, $00, $0F, $80, $04, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $05, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80,
    $06, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $07, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $08, $00, $E4, $80, $00, $00, $E4, $80,
    $02, $00, $00, $03, $00, $00, $0F, $80, $09, $00, $E4, $80, $00, $00, $E4, $80, $04, $00, $00, $04, $03, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $55, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04,
    $04, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $AA, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $05, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $FF, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04,
    $06, $00, $03, $80, $01, $00, $E4, $80, $04, $00, $00, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $07, $00, $03, $80, $01, $00, $E4, $80, $04, $00, $55, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04,
    $08, $00, $03, $80, $01, $00, $E4, $80, $04, $00, $AA, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $09, $00, $03, $80, $01, $00, $E4, $80, $04, $00, $FF, $A1, $00, $00, $E4, $B0, $42, $00, $00, $03,
    $03, $00, $0F, $80, $03, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80, $04, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $05, $00, $0F, $80, $05, $00, $E4, $80,
    $00, $08, $E4, $A0, $42, $00, $00, $03, $06, $00, $0F, $80, $06, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $07, $00, $0F, $80, $07, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03,
    $08, $00, $0F, $80, $08, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $09, $00, $0F, $80, $09, $00, $E4, $80, $00, $08, $E4, $A0, $02, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80,
    $03, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $04, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $05, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03,
    $00, $00, $0F, $80, $06, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $07, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $08, $00, $E4, $80,
    $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $09, $00, $E4, $80, $00, $00, $E4, $80, $04, $00, $00, $04, $03, $00, $03, $80, $01, $00, $E4, $80, $05, $00, $00, $A1, $00, $00, $E4, $B0,
    $04, $00, $00, $04, $04, $00, $03, $80, $01, $00, $E4, $80, $05, $00, $55, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $05, $00, $03, $80, $01, $00, $E4, $80, $05, $00, $AA, $A1, $00, $00, $E4, $B0,
    $04, $00, $00, $04, $06, $00, $03, $80, $01, $00, $E4, $80, $05, $00, $FF, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $07, $00, $03, $80, $01, $00, $E4, $80, $06, $00, $00, $A1, $00, $00, $E4, $B0,
    $04, $00, $00, $04, $08, $00, $03, $80, $01, $00, $E4, $80, $06, $00, $55, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $09, $00, $03, $80, $01, $00, $E4, $80, $06, $00, $AA, $A1, $00, $00, $E4, $B0,
    $04, $00, $00, $04, $0A, $00, $03, $80, $01, $00, $E4, $80, $06, $00, $FF, $A1, $00, $00, $E4, $B0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $07, $00, $00, $A1, $00, $00, $E4, $B0,
    $42, $00, $00, $03, $03, $00, $0F, $80, $03, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80, $04, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $05, $00, $0F, $80,
    $05, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $06, $00, $0F, $80, $06, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $07, $00, $0F, $80, $07, $00, $E4, $80, $00, $08, $E4, $A0,
    $42, $00, $00, $03, $08, $00, $0F, $80, $08, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $09, $00, $0F, $80, $09, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $0A, $00, $0F, $80,
    $0A, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $02, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $03, $00, $E4, $80,
    $02, $00, $00, $03, $00, $00, $0F, $80, $04, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $05, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80,
    $06, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $07, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $08, $00, $E4, $80, $00, $00, $E4, $80,
    $02, $00, $00, $03, $00, $00, $0F, $80, $09, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80, $0A, $00, $E4, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $80,
    $01, $00, $E4, $80, $00, $00, $E4, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $04, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $E4, $80, $07, $00, $55, $A1,
    $01, $00, $E4, $80, $05, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $07, $00, $55, $A0, $05, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $A0, $04, $00, $00, $04,
    $00, $00, $0F, $80, $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[8] = { program.local[0],'#13+
    '		{ 0.0099999998, 0.041666668, 0.5, 0.02 },'#13+
    '		{ 2, 3, 4, 5 },'#13+
    '		{ 6, 7, 8, 9 },'#13+
    '		{ 10, 11, 12, 13 },'#13+
    '		{ 14, 15, 16, 17 },'#13+
    '		{ 18, 19, 20, 21 },'#13+
    '		{ 22, 23 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R3.z, R0.x, c[1].x;'#13+
    'MUL R2.z, R3, c[1].w;'#13+
    'ADD R2.xy, fragment.texcoord[0], -c[1].z;'#13+
    'MAD R1.xy, -R2, R2.z, fragment.texcoord[0];'#13+
    'MUL R3.xy, R2, R2.z;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[2].x, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[2].y, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[2].z, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[2].w, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[3].x, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[3].y, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[3].z, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[3].w, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[4].x, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[4].y, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[4].z, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[4].w, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[5].x, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[5].y, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[5].z, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[5].w, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[6].x, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[6].y, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R2, R0, R1;'#13+
    'MAD R0.xy, -R3, c[6].z, fragment.texcoord[0];'#13+
    'MAD R1.xy, -R3, c[6].w, fragment.texcoord[0];'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ADD R0, R2, R0;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'ADD R0, R0, R1;'#13+
    'MAD R1.xy, -R3, c[7].x, fragment.texcoord[0];'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'MAD R2.xy, -R3, c[7].y, fragment.texcoord[0];'#13+
    'ADD R0, R0, R1;'#13+
    'TEX R2, R2, texture[0], 2D;'#13+
    'ADD R1, R0, R2;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'MUL R2, R1, c[1].y;'#13+
    'MAD R0, -R1, c[1].y, R0;'#13+
    'MAD result.color, R3.z, R0, R2;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec4 _TMP1;'#13+
    'vec4 _TMP6;'#13+
    'vec2 _toUV0007;'#13+
    'vec4 _c10007;'#13+
    'float _s0007;'#13+
    'float _progress0007;'#13+
    'vec4 _c20007;'#13+
    'vec2 _c0009;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0007 = PSParam0.x/1.00000000E+002;'#13+
    '    _toUV0007 = TEX0.xy - vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _s0007 = _progress0007*1.99999996E-002;'#13+
    '    _TMP1 = texture2D(texture0, TEX0.xy);'#13+
    '    _c10007 = _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*2.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*3.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*4.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*5.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*6.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*7.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*8.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*9.00000000E+000;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.00000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.10000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.20000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.30000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.40000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.50000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.60000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.70000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.80000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*1.90000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*2.00000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*2.10000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*2.20000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c0009 = TEX0.xy - _toUV0007*_s0007*2.30000000E+001;'#13+
    '    _TMP1 = texture2D(texture0, _c0009);'#13+
    '    _c10007 = _c10007 + _TMP1;'#13+
    '    _c10007 = _c10007/vec4( 2.40000000E+001, 2.40000000E+001, 2.40000000E+001, 2.40000000E+001);'#13+
    '    _c20007 = texture2D(texture1, TEX0.xy);'#13+
    '    _TMP6 = _c10007 + _progress0007*(_c20007 - _c10007);'#13+
    '    gl_FragColor = _TMP6;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TBlurTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('BlurTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TWiggleTransition }

constructor TWiggleTransition.Create;
const
  DX9PS2BIN: array [0..1395] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00, 
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00, 
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00, 
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, 
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, 
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, 
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0, 
    $00, $00, $00, $00, $00, $00, $80, $3F, $00, $00, $00, $C0, $DB, $0F, $C9, $3F, $51, $00, $00, $05, $03, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $BF, $00, $00, $00, $00, $E2, $76, $38, $3E, 
    $51, $00, $00, $05, $04, $00, $0F, $A0, $5F, $AE, $AA, $3C, $36, $5A, $AE, $BD, $04, $1D, $A9, $BE, $38, $F7, $7F, $3F, $51, $00, $00, $05, $05, $00, $0F, $A0, $DB, $0F, $49, $C0, $D8, $0F, $49, $40, 
    $86, $F9, $22, $3E, $CD, $CC, $4C, $3E, $51, $00, $00, $05, $06, $00, $0F, $A0, $0E, $74, $5A, $3B, $0A, $D7, $23, $3C, $00, $00, $80, $3F, $9A, $99, $99, $3E, $1F, $00, $00, $02, $00, $00, $00, $80, 
    $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0, 
    $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $03, $00, $55, $A0, $5A, $00, $00, $04, $00, $00, $04, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $03, $00, $AA, $A0, $07, $00, $00, $02, 
    $00, $00, $04, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $80, $00, $00, $AA, $80, $06, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $23, $00, $00, $02, 
    $00, $00, $08, $80, $00, $00, $55, $80, $23, $00, $00, $02, $01, $00, $08, $80, $00, $00, $00, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $00, $00, $FF, $80, $01, $00, $FF, $80, $06, $00, $00, $02, 
    $01, $00, $01, $80, $02, $00, $FF, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $01, $00, $FF, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $81, $01, $00, $FF, $80, 
    $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $02, $00, $00, $80, $05, $00, $00, $03, $01, $00, $02, $80, $01, $00, $00, $80, $01, $00, $00, $80, $04, $00, $00, $04, $01, $00, $04, $80, 
    $01, $00, $55, $80, $04, $00, $00, $A0, $04, $00, $55, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $03, $00, $FF, $A0, $04, $00, $00, $04, $01, $00, $04, $80, 
    $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $AA, $A0, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $FF, $A0, $05, $00, $00, $03, $01, $00, $01, $80, 
    $01, $00, $00, $80, $01, $00, $55, $80, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $00, $80, $02, $00, $AA, $A0, $02, $00, $FF, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $FF, $80, 
    $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $55, $80, $00, $00, $FF, $80, $01, $00, $00, $80, $58, $00, $00, $04, $01, $00, $01, $80, $00, $00, $00, $80, 
    $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $00, $80, $05, $00, $00, $A0, $00, $00, $FF, $80, $02, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80, 
    $00, $00, $FF, $80, $0A, $00, $00, $03, $01, $00, $02, $80, $00, $00, $00, $80, $00, $00, $55, $80, $58, $00, $00, $04, $01, $00, $02, $80, $01, $00, $55, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, 
    $0B, $00, $00, $03, $01, $00, $04, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04, $01, $00, $04, $80, $01, $00, $AA, $80, $02, $00, $55, $A0, $02, $00, $00, $A0, $05, $00, $00, $03, 
    $01, $00, $02, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $55, $80, $01, $00, $00, $81, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, 
    $00, $00, $FF, $80, $05, $00, $55, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80, $05, $00, $AA, $A0, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $AA, $80, $05, $00, $FF, $A0, 
    $01, $00, $00, $02, $02, $00, $07, $80, $06, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $00, $00, $00, $A0, $02, $00, $00, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, 
    $00, $00, $FF, $80, $01, $00, $00, $A0, $13, $00, $00, $02, $01, $00, $02, $80, $00, $00, $FF, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $02, $08, $E4, $A0, $04, $00, $00, $04, 
    $00, $00, $08, $80, $01, $00, $00, $80, $02, $00, $AA, $A1, $02, $00, $55, $A1, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $80, $00, $00, $FF, $80, $04, $00, $00, $04, $01, $00, $01, $80, 
    $00, $00, $00, $A0, $02, $00, $55, $81, $02, $00, $AA, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $01, $00, $00, $80, $06, $00, $FF, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80, 
    $02, $00, $00, $80, $04, $00, $00, $04, $01, $00, $01, $80, $01, $00, $00, $80, $00, $00, $AA, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $01, $00, $03, $80, $00, $00, $E4, $80, $01, $00, $00, $80, 
    $03, $00, $55, $A1, $13, $00, $00, $02, $01, $00, $03, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $02, $00, $01, $80, $03, $00, $00, $A0, $05, $00, $00, $03, $01, $00, $04, $80, $02, $00, $00, $80, 
    $00, $00, $00, $A0, $0A, $00, $00, $03, $02, $00, $01, $80, $01, $00, $AA, $80, $06, $00, $FF, $A0, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $80, $02, $00, $00, $80, $04, $00, $00, $04, 
    $01, $00, $08, $80, $00, $00, $FF, $80, $00, $00, $AA, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $03, $80, $00, $00, $E4, $80, $01, $00, $FF, $80, $03, $00, $55, $A1, $13, $00, $00, $02, 
    $00, $00, $03, $80, $00, $00, $E4, $80, $42, $00, $00, $03, $02, $00, $0F, $80, $01, $00, $E4, $80, $01, $08, $E4, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, 
    $12, $00, $00, $04, $03, $00, $0F, $80, $01, $00, $AA, $80, $02, $00, $E4, $80, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar = 
    '!!ARBfp1.0'#13+
    'PARAM c[7] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 0.5, 0, 1 },'#13+
    '		{ -0.01348047, 0.05747731, 0.1212391, 0.1956359 },'#13+
    '		{ 0.33299461, 0.99999559, 1.570796, 3.141593 },'#13+
    '		{ 3.141592, 0.15915498, 0.33333334, 0.2 },'#13+
    '		{ 2, 0.30000001 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.zw, fragment.texcoord[0].xyxy, -c[2].y;'#13+
    'MUL R0.xy, R0.zwzw, R0.zwzw;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'RSQ R0.x, R0.x;'#13+
    'MUL R0.zw, R0.x, R0;'#13+
    'ABS R1.x, R0.z;'#13+
    'ABS R0.y, R0.w;'#13+
    'MAX R1.y, R1.x, R0;'#13+
    'RCP R1.z, R1.y;'#13+
    'MIN R1.y, R1.x, R0;'#13+
    'MUL R1.y, R1, R1.z;'#13+
    'MUL R1.z, R1.y, R1.y;'#13+
    'MAD R1.w, R1.z, c[3].x, c[3].y;'#13+
    'MAD R1.w, R1, R1.z, -c[3].z;'#13+
    'MAD R1.w, R1, R1.z, c[3];'#13+
    'MAD R1.w, R1, R1.z, -c[4].x;'#13+
    'SLT R0.y, R1.x, R0;'#13+
    'MAD R1.z, R1.w, R1, c[4].y;'#13+
    'MUL R1.x, R1.z, R1.y;'#13+
    'ABS R0.y, R0;'#13+
    'ADD R1.y, -R1.x, c[4].z;'#13+
    'CMP R0.y, -R0, c[2].z, c[2].w;'#13+
    'CMP R1.y, -R0, R1.x, R1;'#13+
    'SLT R1.x, R0.z, c[2].z;'#13+
    'SLT R0.y, R0.w, c[2].z;'#13+
    'ABS R1.x, R1;'#13+
    'ADD R1.z, -R1.y, c[4].w;'#13+
    'CMP R1.x, -R1, c[2].z, c[2].w;'#13+
    'CMP R1.y, -R1.x, R1, R1.z;'#13+
    'ABS R0.y, R0;'#13+
    'CMP R1.x, -R0.y, c[2].z, c[2].w;'#13+
    'RCP R0.y, R0.x;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[2];'#13+
    'CMP R0.x, -R1, R1.y, -R1.y;'#13+
    'MUL R1.z, R0.y, c[5].w;'#13+
    'MAD R1.z, R2.x, c[5], R1;'#13+
    'ADD R1.x, R1.z, c[1];'#13+
    'FRC R1.y, R1.x;'#13+
    'ADD R0.x, R0, c[5];'#13+
    'MUL R1.x, R0, c[5].y;'#13+
    'TEX R0.x, R1, texture[2], 2D;'#13+
    'MUL R0.x, R0, c[6];'#13+
    'ADD R1.x, -R2, c[2].w;'#13+
    'ADD R0.x, R0, -c[2].w;'#13+
    'MIN R1.y, R2.x, c[6];'#13+
    'MUL R1.y, R0.x, R1;'#13+
    'MIN R1.x, R1, c[6].y;'#13+
    'MUL R0.x, R0, R1;'#13+
    'MUL R1.x, R0.y, R1.y;'#13+
    'MAD R1.y, R1.x, c[6].x, R0;'#13+
    'MUL R0.x, R0, R0.y;'#13+
    'MAD R1.x, R0, c[6], R0.y;'#13+
    'MAD R0.xy, R0.zwzw, R1.y, c[2].y;'#13+
    'MAD R0.zw, R0, R1.x, c[2].y;'#13+
    'FRC R1.xy, R0;'#13+
    'FRC R0.xy, R0.zwzw;'#13+
    'TEX R1, R1, texture[0], 2D;'#13+
    'TEX R0, R0, texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar = 
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec2 _TMP6;'#13+
    'vec2 _TMP5;'#13+
    'float _TMP4;'#13+
    'float _TMP3;'#13+
    'vec4 _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP12;'#13+
    'float _TMP11;'#13+
    'float _TMP8;'#13+
    'float _TMP10;'#13+
    'float _TMP9;'#13+
    'float _TMP7;'#13+
    'float _TMP13;'#13+
    'vec4 _TMP20;'#13+
    'vec2 _toUV0021;'#13+
    'vec2 _normToUV0021;'#13+
    'float _angle0021;'#13+
    'float _progress0021;'#13+
    'float _offset10021;'#13+
    'float _offset20021;'#13+
    'vec4 _c10021;'#13+
    'vec4 _c20021;'#13+
    'float _TMP22;'#13+
    'float _t30031;'#13+
    'float _t10031;'#13+
    'float _t00031;'#13+
    'float _t40031;'#13+
    'float _x0045;'#13+
    'vec2 _c0047;'#13+
    'float _b0049;'#13+
    'vec2 _x0053;'#13+
    'vec2 _x0057;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0021 = PSParam0.x/1.00000000E+002;'#13+
    '    _toUV0021 = TEX0.xy - vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _TMP7 = dot(_toUV0021, _toUV0021);'#13+
    '    _TMP13 = inversesqrt(_TMP7);'#13+
    '    _TMP22 = 1.00000000E+000/_TMP13;'#13+
    '    _normToUV0021 = _toUV0021/_TMP22;'#13+
    '    _t30031 = abs(_normToUV0021.x);'#13+
    '    _t10031 = abs(_normToUV0021.y);'#13+
    '    _t00031 = max(_t30031, _t10031);'#13+
    '    _t10031 = min(_t30031, _t10031);'#13+
    '    _t30031 = 1.00000000E+000/_t00031;'#13+
    '    _t30031 = _t10031*_t30031;'#13+
    '    _t40031 = _t30031*_t30031;'#13+
    '    _t00031 = -1.34804696E-002*_t40031 + 5.74773103E-002;'#13+
    '    _t00031 = _t00031*_t40031 - 1.21239103E-001;'#13+
    '    _t00031 = _t00031*_t40031 + 1.95635900E-001;'#13+
    '    _t00031 = _t00031*_t40031 - 3.32994610E-001;'#13+
    '    _t00031 = _t00031*_t40031 + 9.99995589E-001;'#13+
    '    _t30031 = _t00031*_t30031;'#13+
    '    _TMP9 = abs(_normToUV0021.y);'#13+
    '    _TMP10 = abs(_normToUV0021.x);'#13+
    '    if (_TMP9 > _TMP10) { '#13+
    '        _TMP8 = 1.57079601E+000 - _t30031;'#13+
    '    } else {'#13+
    '        _TMP8 = _t30031;'#13+
    '    } // end if'#13+
    '    if (_normToUV0021.x < 0.0) { '#13+
    '        _TMP11 = 3.14159298E+000 - _TMP8;'#13+
    '    } else {'#13+
    '        _TMP11 = _TMP8;'#13+
    '    } // end if'#13+
    '    if (_normToUV0021.y < 0.0) { '#13+
    '        _TMP12 = -_TMP11;'#13+
    '    } else {'#13+
    '        _TMP12 = _TMP11;'#13+
    '    } // end if'#13+
    '    _angle0021 = (_TMP12 + 3.14159203E+000)/6.28318405E+000;'#13+
    '    _x0045 = _progress0021/3.00000000E+000 + _TMP22/5.00000000E+000 + PSParam1.x;'#13+
    '    _TMP1 = fract(_x0045);'#13+
    '    _c0047 = vec2(_angle0021, _TMP1);'#13+
    '    _TMP2 = texture2D(texture2, _c0047);'#13+
    '    _offset10021 = _TMP2.x*2.00000000E+000 - 1.00000000E+000;'#13+
    '    _b0049 = 1.00000000E+000 - _progress0021;'#13+
    '    _TMP3 = min(3.00000012E-001, _b0049);'#13+
    '    _offset20021 = _offset10021*2.00000000E+000*_TMP3*_TMP22;'#13+
    '    _TMP4 = min(3.00000012E-001, _progress0021);'#13+
    '    _offset10021 = _offset10021*2.00000000E+000*_TMP4*_TMP22;'#13+
    '    _x0053 = vec2( 5.00000000E-001, 5.00000000E-001) + _normToUV0021*(_TMP22 + _offset10021);'#13+
    '    _TMP5 = fract(_x0053);'#13+
    '    _c10021 = texture2D(texture0, _TMP5);'#13+
    '    _x0057 = vec2( 5.00000000E-001, 5.00000000E-001) + _normToUV0021*(_TMP22 + _offset20021);'#13+
    '    _TMP6 = fract(_x0057);'#13+
    '    _c20021 = texture2D(texture1, _TMP6);'#13+
    '    _TMP20 = _c10021 + _progress0021*(_c20021 - _c10021);'#13+
    '    gl_FragColor = _TMP20;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TWiggleTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('WiggleTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TShapeTransition }

constructor TShapeTransition.Create;
const
  DX9PS2BIN: array [0..1191] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $00, $00, $00, $00, $00, $00, $80, $3F, $00, $00, $00, $C0, $DB, $0F, $C9, $3F, $51, $00, $00, $05, $03, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $BF, $00, $00, $00, $00, $E2, $76, $38, $3E,
    $51, $00, $00, $05, $04, $00, $0F, $A0, $5F, $AE, $AA, $3C, $36, $5A, $AE, $BD, $04, $1D, $A9, $BE, $38, $F7, $7F, $3F, $51, $00, $00, $05, $05, $00, $0F, $A0, $DB, $0F, $49, $C0, $D8, $0F, $49, $40,
    $86, $F9, $22, $3E, $6F, $12, $03, $3B, $51, $00, $00, $05, $06, $00, $0F, $A0, $6A, $B4, $E7, $3B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80,
    $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0,
    $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $03, $00, $55, $A0, $5A, $00, $00, $04, $00, $00, $04, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $03, $00, $AA, $A0, $07, $00, $00, $02,
    $00, $00, $04, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $80, $00, $00, $AA, $80, $06, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $23, $00, $00, $02,
    $00, $00, $08, $80, $00, $00, $55, $80, $23, $00, $00, $02, $01, $00, $08, $80, $00, $00, $00, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $00, $00, $FF, $80, $01, $00, $FF, $80, $06, $00, $00, $02,
    $01, $00, $01, $80, $02, $00, $FF, $80, $0A, $00, $00, $03, $02, $00, $01, $80, $01, $00, $FF, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $81, $01, $00, $FF, $80,
    $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $02, $00, $00, $80, $05, $00, $00, $03, $01, $00, $02, $80, $01, $00, $00, $80, $01, $00, $00, $80, $04, $00, $00, $04, $01, $00, $04, $80,
    $01, $00, $55, $80, $04, $00, $00, $A0, $04, $00, $55, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $03, $00, $FF, $A0, $04, $00, $00, $04, $01, $00, $04, $80,
    $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $AA, $A0, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $FF, $A0, $05, $00, $00, $03, $01, $00, $01, $80,
    $01, $00, $00, $80, $01, $00, $55, $80, $04, $00, $00, $04, $01, $00, $02, $80, $01, $00, $00, $80, $02, $00, $AA, $A0, $02, $00, $FF, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $FF, $80,
    $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $55, $80, $00, $00, $FF, $80, $01, $00, $00, $80, $58, $00, $00, $04, $01, $00, $01, $80, $00, $00, $00, $80,
    $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $00, $80, $05, $00, $00, $A0, $00, $00, $FF, $80, $02, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80,
    $00, $00, $FF, $80, $0A, $00, $00, $03, $01, $00, $02, $80, $00, $00, $00, $80, $00, $00, $55, $80, $0B, $00, $00, $03, $01, $00, $04, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04,
    $00, $00, $01, $80, $01, $00, $55, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $58, $00, $00, $04, $00, $00, $02, $80, $01, $00, $AA, $80, $02, $00, $55, $A0, $02, $00, $00, $A0, $05, $00, $00, $03,
    $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $01, $00, $00, $81, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $01, $80,
    $00, $00, $00, $80, $05, $00, $55, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $05, $00, $AA, $A0, $01, $00, $00, $02, $00, $00, $08, $80, $05, $00, $FF, $A0, $01, $00, $00, $02,
    $01, $00, $01, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $00, $80, $00, $00, $FF, $80, $01, $00, $00, $A0, $13, $00, $00, $02, $00, $00, $02, $80, $00, $00, $FF, $80,
    $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $80, $02, $08, $E4, $A0, $42, $00, $00, $03, $03, $00, $0F, $80, $00, $00, $E4, $B0, $01, $08, $E4, $A0, $42, $00, $00, $03, $04, $00, $0F, $80,
    $00, $00, $E4, $B0, $00, $08, $E4, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $01, $00, $00, $80, $03, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $80,
    $04, $00, $00, $04, $00, $00, $01, $80, $01, $00, $00, $80, $06, $00, $00, $A0, $00, $00, $00, $80, $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $AA, $80, $00, $00, $00, $81, $58, $00, $00, $04,
    $00, $00, $0F, $80, $00, $00, $00, $80, $04, $00, $E4, $80, $03, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[6] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 0.15915498, 0.2, 1 },'#13+
    '		{ 0, 0.5, 0.70710677, -0.01348047 },'#13+
    '		{ 0.05747731, 0.1212391, 0.1956359, 0.33299461 },'#13+
    '		{ 0.99999559, 1.570796, 3.141593, 3.141592 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.zw, fragment.texcoord[0].xyxy, -c[3].y;'#13+
    'MUL R0.xy, R0.zwzw, R0.zwzw;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'RSQ R0.y, R0.x;'#13+
    'MUL R1.xy, R0.y, R0.zwzw;'#13+
    'ABS R0.z, R1.y;'#13+
    'ABS R0.x, R1;'#13+
    'MAX R0.w, R0.x, R0.z;'#13+
    'RCP R1.z, R0.w;'#13+
    'MIN R0.w, R0.x, R0.z;'#13+
    'SLT R0.x, R0, R0.z;'#13+
    'MUL R0.w, R0, R1.z;'#13+
    'MUL R1.z, R0.w, R0.w;'#13+
    'MUL R1.w, R1.z, c[3];'#13+
    'ADD R1.w, R1, c[4].x;'#13+
    'MAD R1.w, R1, R1.z, -c[4].y;'#13+
    'MAD R1.w, R1, R1.z, c[4].z;'#13+
    'MAD R1.w, R1, R1.z, -c[4];'#13+
    'MAD R1.z, R1.w, R1, c[5].x;'#13+
    'MUL R0.w, R1.z, R0;'#13+
    'MOV R0.z, c[2].w;'#13+
    'ABS R0.x, R0;'#13+
    'CMP R1.w, -R0.x, c[3].x, R0.z;'#13+
    'ADD R1.z, -R0.w, c[5].y;'#13+
    'SLT R0.x, R1, c[3];'#13+
    'ABS R1.x, R0;'#13+
    'CMP R0.w, -R1, R0, R1.z;'#13+
    'ADD R0.x, -R0.w, c[5].z;'#13+
    'CMP R1.x, -R1, c[3], R0.z;'#13+
    'CMP R1.x, -R1, R0.w, R0;'#13+
    'SLT R0.w, R1.y, c[3].x;'#13+
    'ABS R1.y, R0.w;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R0.w, R0.x, c[2].x;'#13+
    'CMP R0.x, -R1.y, c[3], R0.z;'#13+
    'CMP R0.x, -R0, R1, -R1;'#13+
    'MUL R1.y, R0.w, c[2].z;'#13+
    'ADD R1.x, R1.y, c[1];'#13+
    'FRC R1.y, R1.x;'#13+
    'ADD R0.x, R0, c[5].w;'#13+
    'MUL R1.x, R0, c[2].y;'#13+
    'TEX R0.x, R1, texture[2], 2D;'#13+
    'MUL R0.x, R0.w, R0;'#13+
    'MAD R0.w, R0, c[3].z, R0.x;'#13+
    'RCP R0.x, R0.y;'#13+
    'SLT R0.x, R0, R0.w;'#13+
    'ABS R0.x, R0;'#13+
    'CMP R2.x, -R0, c[3], R0.z;'#13+
    'TEX R1, fragment.texcoord[0], texture[1], 2D;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec4 _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP10;'#13+
    'float _TMP9;'#13+
    'float _TMP6;'#13+
    'float _TMP8;'#13+
    'float _TMP7;'#13+
    'float _TMP5;'#13+
    'float _TMP4;'#13+
    'float _TMP3;'#13+
    'float _TMP11;'#13+
    'vec4 _TMP18;'#13+
    'float _radius0019;'#13+
    'float _progress0019;'#13+
    'vec2 _fromCenter0019;'#13+
    'vec2 _toUV0019;'#13+
    'float _angle0019;'#13+
    'float _TMP20;'#13+
    'float _t30035;'#13+
    'float _t10035;'#13+
    'float _t00035;'#13+
    'float _t40035;'#13+
    'float _x0049;'#13+
    'vec2 _c0051;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0019 = PSParam0.x/1.00000000E+002;'#13+
    '    _radius0019 = _progress0019*7.07106769E-001;'#13+
    '    _fromCenter0019 = TEX0.xy - vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _TMP3 = dot(_fromCenter0019, _fromCenter0019);'#13+
    '    _TMP11 = inversesqrt(_TMP3);'#13+
    '    _TMP20 = 1.00000000E+000/_TMP11;'#13+
    '    _TMP4 = dot(_fromCenter0019, _fromCenter0019);'#13+
    '    _TMP5 = inversesqrt(_TMP4);'#13+
    '    _toUV0019 = _TMP5*_fromCenter0019;'#13+
    '    _t30035 = abs(_toUV0019.x);'#13+
    '    _t10035 = abs(_toUV0019.y);'#13+
    '    _t00035 = max(_t30035, _t10035);'#13+
    '    _t10035 = min(_t30035, _t10035);'#13+
    '    _t30035 = 1.00000000E+000/_t00035;'#13+
    '    _t30035 = _t10035*_t30035;'#13+
    '    _t40035 = _t30035*_t30035;'#13+
    '    _t00035 = -1.34804696E-002*_t40035 + 5.74773103E-002;'#13+
    '    _t00035 = _t00035*_t40035 - 1.21239103E-001;'#13+
    '    _t00035 = _t00035*_t40035 + 1.95635900E-001;'#13+
    '    _t00035 = _t00035*_t40035 - 3.32994610E-001;'#13+
    '    _t00035 = _t00035*_t40035 + 9.99995589E-001;'#13+
    '    _t30035 = _t00035*_t30035;'#13+
    '    _TMP7 = abs(_toUV0019.y);'#13+
    '    _TMP8 = abs(_toUV0019.x);'#13+
    '    if (_TMP7 > _TMP8) { '#13+
    '        _TMP6 = 1.57079601E+000 - _t30035;'#13+
    '    } else {'#13+
    '        _TMP6 = _t30035;'#13+
    '    } // end if'#13+
    '    if (_toUV0019.x < 0.0) { '#13+
    '        _TMP9 = 3.14159298E+000 - _TMP6;'#13+
    '    } else {'#13+
    '        _TMP9 = _TMP6;'#13+
    '    } // end if'#13+
    '    if (_toUV0019.y < 0.0) { '#13+
    '        _TMP10 = -_TMP9;'#13+
    '    } else {'#13+
    '        _TMP10 = _TMP9;'#13+
    '    } // end if'#13+
    '    _angle0019 = (_TMP10 + 3.14159203E+000)/6.28318405E+000;'#13+
    '    _x0049 = PSParam1.x + _progress0019/5.00000000E+000;'#13+
    '    _TMP1 = fract(_x0049);'#13+
    '    _c0051 = vec2(_angle0019, _TMP1);'#13+
    '    _TMP2 = texture2D(texture2, _c0051);'#13+
    '    _radius0019 = _radius0019 + _progress0019*_TMP2.x;'#13+
    '    if (_TMP20 < _radius0019) { '#13+
    '        _TMP18 = texture2D(texture1, TEX0.xy);'#13+
    '    } else {'#13+
    '        _TMP18 = texture2D(texture0, TEX0.xy);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP18;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TShapeTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('ShapeTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TRotateCrumpleTransition }

constructor TRotateCrumpleTransition.Create;
const
  DX9PS2BIN: array [0..1375] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $00, $00, $00, $00, $00, $00, $80, $3F, $00, $00, $00, $C0, $DB, $0F, $C9, $3F, $51, $00, $00, $05, $03, $00, $0F, $A0, $0A, $D7, $23, $3C, $66, $66, $66, $3F, $CD, $CC, $CC, $3D, $00, $00, $00, $00,
    $51, $00, $00, $05, $04, $00, $0F, $A0, $00, $00, $00, $40, $00, $00, $80, $BF, $5F, $AE, $AA, $3C, $36, $5A, $AE, $BD, $51, $00, $00, $05, $05, $00, $0F, $A0, $E2, $76, $38, $3E, $04, $1D, $A9, $BE,
    $38, $F7, $7F, $3F, $DB, $0F, $49, $C0, $51, $00, $00, $05, $06, $00, $0F, $A0, $FB, $AD, $80, $3D, $83, $F9, $22, $3E, $00, $00, $00, $3F, $00, $00, $00, $00, $51, $00, $00, $05, $07, $00, $0F, $A0,
    $DB, $0F, $C9, $40, $DB, $0F, $49, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $51, $00, $00, $05, $08, $00, $0F, $A0, $01, $0D, $D0, $B5, $61, $0B, $B6, $B7, $AB, $AA, $2A, $3B, $89, $88, $88, $39,
    $51, $00, $00, $05, $09, $00, $0F, $A0, $AB, $AA, $AA, $BC, $00, $00, $00, $BE, $00, $00, $80, $3F, $00, $00, $00, $3F, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $02, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $03, $80,
    $03, $00, $E4, $A0, $0A, $00, $00, $03, $01, $00, $08, $80, $01, $00, $00, $A0, $00, $00, $55, $80, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $55, $B0, $03, $00, $AA, $A0, $01, $00, $FF, $80,
    $13, $00, $00, $02, $01, $00, $02, $80, $00, $00, $55, $80, $05, $00, $00, $03, $01, $00, $01, $80, $00, $00, $00, $B0, $03, $00, $AA, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80,
    $02, $08, $E4, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $04, $00, $00, $A0, $04, $00, $55, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $AA, $A0,
    $00, $00, $E4, $B0, $02, $00, $00, $03, $02, $00, $03, $80, $01, $00, $E4, $81, $00, $00, $E4, $B0, $5A, $00, $00, $04, $00, $00, $02, $80, $02, $00, $E4, $80, $02, $00, $E4, $80, $03, $00, $FF, $A0,
    $07, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80, $05, $00, $00, $03, $02, $00, $03, $80, $02, $00, $E4, $80, $00, $00, $55, $80, $06, $00, $00, $02, $00, $00, $02, $80, $00, $00, $55, $80,
    $23, $00, $00, $02, $00, $00, $04, $80, $02, $00, $55, $80, $23, $00, $00, $02, $00, $00, $08, $80, $02, $00, $00, $80, $0B, $00, $00, $03, $01, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $FF, $80,
    $06, $00, $00, $02, $01, $00, $04, $80, $01, $00, $AA, $80, $0A, $00, $00, $03, $01, $00, $08, $80, $00, $00, $FF, $80, $00, $00, $AA, $80, $02, $00, $00, $03, $00, $00, $04, $80, $00, $00, $AA, $81,
    $00, $00, $FF, $80, $05, $00, $00, $03, $00, $00, $08, $80, $01, $00, $AA, $80, $01, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $04, $80, $00, $00, $FF, $80, $00, $00, $FF, $80, $04, $00, $00, $04,
    $01, $00, $08, $80, $01, $00, $AA, $80, $04, $00, $AA, $A0, $04, $00, $FF, $A0, $04, $00, $00, $04, $01, $00, $08, $80, $01, $00, $AA, $80, $01, $00, $FF, $80, $05, $00, $00, $A0, $04, $00, $00, $04,
    $01, $00, $08, $80, $01, $00, $AA, $80, $01, $00, $FF, $80, $05, $00, $55, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $AA, $80, $01, $00, $FF, $80, $05, $00, $AA, $A0, $05, $00, $00, $03,
    $00, $00, $08, $80, $00, $00, $FF, $80, $01, $00, $AA, $80, $04, $00, $00, $04, $01, $00, $04, $80, $00, $00, $FF, $80, $02, $00, $AA, $A0, $02, $00, $FF, $A0, $58, $00, $00, $04, $01, $00, $08, $80,
    $00, $00, $AA, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $04, $80, $01, $00, $AA, $80, $01, $00, $FF, $80, $00, $00, $FF, $80, $58, $00, $00, $04, $00, $00, $08, $80,
    $02, $00, $00, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $FF, $80, $05, $00, $FF, $A0, $00, $00, $AA, $80, $02, $00, $00, $03, $00, $00, $08, $80,
    $00, $00, $AA, $80, $00, $00, $AA, $80, $0A, $00, $00, $03, $01, $00, $04, $80, $02, $00, $00, $80, $02, $00, $55, $80, $0B, $00, $00, $03, $01, $00, $08, $80, $02, $00, $55, $80, $02, $00, $00, $80,
    $58, $00, $00, $04, $01, $00, $04, $80, $01, $00, $AA, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $58, $00, $00, $04, $01, $00, $08, $80, $01, $00, $FF, $80, $02, $00, $55, $A0, $02, $00, $00, $A0,
    $05, $00, $00, $03, $01, $00, $04, $80, $01, $00, $FF, $80, $01, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $04, $80, $01, $00, $AA, $80, $00, $00, $FF, $81, $00, $00, $AA, $80, $01, $00, $00, $02,
    $00, $00, $08, $80, $06, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $00, $A0, $00, $00, $FF, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $AA, $80,
    $06, $00, $55, $A0, $06, $00, $AA, $A0, $13, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $AA, $80, $07, $00, $00, $A0, $07, $00, $55, $A0,
    $25, $00, $00, $04, $02, $00, $03, $80, $00, $00, $AA, $80, $08, $00, $E4, $A0, $09, $00, $E4, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $02, $00, $E4, $80, $00, $00, $55, $80, $01, $00, $E4, $80,
    $13, $00, $00, $02, $01, $00, $03, $80, $01, $00, $E4, $80, $42, $00, $00, $03, $02, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80,
    $01, $08, $E4, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $00, $A0, $12, $00, $00, $04, $03, $00, $0F, $80, $00, $00, $00, $80, $01, $00, $E4, $80, $02, $00, $E4, $80,
    $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[6] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 6.2831841, 0.1, 0.89999998 },'#13+
    '		{ 2, 1, 0, -0.01348047 },'#13+
    '		{ 0.05747731, 0.1212391, 0.1956359, 0.33299461 },'#13+
    '		{ 0.99999559, 1.570796, 3.141593 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[2].w;'#13+
    'MIN R0.x, R0, c[1];'#13+
    'MAD R0.x, fragment.texcoord[0].y, c[2].z, R0;'#13+
    'FRC R0.y, R0.x;'#13+
    'MUL R0.x, fragment.texcoord[0], c[2].z;'#13+
    'TEX R0.xy, R0, texture[2], 2D;'#13+
    'MAD R0.xy, R0, c[3].x, -c[3].y;'#13+
    'MUL R0.xy, R0, c[2].z;'#13+
    'MUL R0.zw, -R0.xyxy, -R0.xyxy;'#13+
    'ADD R0.z, R0, R0.w;'#13+
    'RSQ R1.x, R0.z;'#13+
    'MUL R0.zw, R1.x, -R0.xyxy;'#13+
    'ABS R1.z, R0;'#13+
    'ABS R1.y, R0.w;'#13+
    'MAX R1.w, R1.z, R1.y;'#13+
    'RCP R2.x, R1.w;'#13+
    'MIN R1.w, R1.z, R1.y;'#13+
    'MUL R1.w, R1, R2.x;'#13+
    'MUL R2.x, R1.w, R1.w;'#13+
    'MUL R2.y, R2.x, c[3].w;'#13+
    'SLT R1.y, R1.z, R1;'#13+
    'ADD R2.y, R2, c[4].x;'#13+
    'MAD R2.y, R2, R2.x, -c[4];'#13+
    'MAD R2.y, R2, R2.x, c[4].z;'#13+
    'MAD R2.y, R2, R2.x, -c[4].w;'#13+
    'MAD R2.x, R2.y, R2, c[5];'#13+
    'MUL R1.z, R2.x, R1.w;'#13+
    'ABS R1.y, R1;'#13+
    'ADD R1.w, -R1.z, c[5].y;'#13+
    'CMP R1.y, -R1, c[3].z, c[3];'#13+
    'CMP R1.z, -R1.y, R1, R1.w;'#13+
    'SLT R1.y, R0.z, c[3].z;'#13+
    'SLT R0.z, R0.w, c[3];'#13+
    'ABS R0.w, R1.y;'#13+
    'ADD R1.w, -R1.z, c[5].z;'#13+
    'CMP R0.w, -R0, c[3].z, c[3].y;'#13+
    'CMP R1.y, -R0.w, R1.z, R1.w;'#13+
    'ADD R1.zw, R0.xyxy, fragment.texcoord[0].xyxy;'#13+
    'ABS R0.z, R0;'#13+
    'CMP R0.w, -R0.z, c[3].z, c[3].y;'#13+
    'MOV R0.z, c[0].x;'#13+
    'CMP R0.w, -R0, R1.y, -R1.y;'#13+
    'MUL R2.x, R0.z, c[2];'#13+
    'MAD R0.w, R2.x, c[2].y, R0;'#13+
    'COS R0.z, R0.w;'#13+
    'SIN R0.w, R0.w;'#13+
    'RCP R0.x, R1.x;'#13+
    'MAD R0.xy, R0.zwzw, R0.x, R1.zwzw;'#13+
    'FRC R0.xy, R0;'#13+
    'TEX R1, R0, texture[0], 2D;'#13+
    'TEX R0, R0, texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec2 _TMP4;'#13+
    'vec2 _TMP3;'#13+
    'float _TMP10;'#13+
    'float _TMP9;'#13+
    'float _TMP6;'#13+
    'float _TMP8;'#13+
    'float _TMP7;'#13+
    'float _TMP5;'#13+
    'float _TMP11;'#13+
    'vec4 _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP0;'#13+
    'vec4 _TMP18;'#13+
    'vec2 _offset0019;'#13+
    'vec2 _center0019;'#13+
    'vec2 _toUV0019;'#13+
    'vec2 _normToUV0019;'#13+
    'float _angle0019;'#13+
    'float _progress0019;'#13+
    'vec2 _newOffset0019;'#13+
    'vec4 _c10019;'#13+
    'vec4 _c20019;'#13+
    'float _x0023;'#13+
    'vec2 _c0025;'#13+
    'float _TMP26;'#13+
    'float _t30035;'#13+
    'float _t10035;'#13+
    'float _t00035;'#13+
    'float _t40035;'#13+
    'float _s0048;'#13+
    'float _c0048;'#13+
    'vec2 _x0054;'#13+
    'vec2 _x0058;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0019 = PSParam0.x/1.00000000E+002;'#13+
    '    _TMP0 = min(8.99999976E-001, PSParam1.x);'#13+
    '    _x0023 = TEX0.y/1.00000000E+001 + _TMP0;'#13+
    '    _TMP1 = fract(_x0023);'#13+
    '    _c0025 = vec2(TEX0.x/1.00000000E+001, _TMP1);'#13+
    '    _TMP2 = texture2D(texture2, _c0025);'#13+
    '    _offset0019 = _TMP2.xy*2.00000000E+000 - 1.00000000E+000;'#13+
    '    _center0019 = TEX0.xy + _offset0019/1.00000000E+001;'#13+
    '    _toUV0019 = TEX0.xy - _center0019;'#13+
    '    _TMP5 = dot(_toUV0019, _toUV0019);'#13+
    '    _TMP11 = inversesqrt(_TMP5);'#13+
    '    _TMP26 = 1.00000000E+000/_TMP11;'#13+
    '    _normToUV0019 = _toUV0019/_TMP26;'#13+
    '    _t30035 = abs(_normToUV0019.x);'#13+
    '    _t10035 = abs(_normToUV0019.y);'#13+
    '    _t00035 = max(_t30035, _t10035);'#13+
    '    _t10035 = min(_t30035, _t10035);'#13+
    '    _t30035 = 1.00000000E+000/_t00035;'#13+
    '    _t30035 = _t10035*_t30035;'#13+
    '    _t40035 = _t30035*_t30035;'#13+
    '    _t00035 = -1.34804696E-002*_t40035 + 5.74773103E-002;'#13+
    '    _t00035 = _t00035*_t40035 - 1.21239103E-001;'#13+
    '    _t00035 = _t00035*_t40035 + 1.95635900E-001;'#13+
    '    _t00035 = _t00035*_t40035 - 3.32994610E-001;'#13+
    '    _t00035 = _t00035*_t40035 + 9.99995589E-001;'#13+
    '    _t30035 = _t00035*_t30035;'#13+
    '    _TMP7 = abs(_normToUV0019.y);'#13+
    '    _TMP8 = abs(_normToUV0019.x);'#13+
    '    if (_TMP7 > _TMP8) { '#13+
    '        _TMP6 = 1.57079601E+000 - _t30035;'#13+
    '    } else {'#13+
    '        _TMP6 = _t30035;'#13+
    '    } // end if'#13+
    '    if (_normToUV0019.x < 0.0) { '#13+
    '        _TMP9 = 3.14159298E+000 - _TMP6;'#13+
    '    } else {'#13+
    '        _TMP9 = _TMP6;'#13+
    '    } // end if'#13+
    '    if (_normToUV0019.y < 0.0) { '#13+
    '        _TMP10 = -_TMP9;'#13+
    '    } else {'#13+
    '        _TMP10 = _TMP9;'#13+
    '    } // end if'#13+
    '    _angle0019 = _TMP10 + 6.28318405E+000*_progress0019;'#13+
    '    _s0048 = sin(_angle0019);'#13+
    '    _c0048 = cos(_angle0019);'#13+
    '    _newOffset0019.y = _s0048;'#13+
    '    _newOffset0019.x = _c0048;'#13+
    '    _newOffset0019 = _newOffset0019*vec2(_TMP26, _TMP26);'#13+
    '    _x0054 = _center0019 + _newOffset0019;'#13+
    '    _TMP3 = fract(_x0054);'#13+
    '    _c10019 = texture2D(texture0, _TMP3);'#13+
    '    _x0058 = _center0019 + _newOffset0019;'#13+
    '    _TMP4 = fract(_x0058);'#13+
    '    _c20019 = texture2D(texture1, _TMP4);'#13+
    '    _TMP18 = _c10019 + _progress0019*(_c20019 - _c10019);'#13+
    '    gl_FragColor = _TMP18;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TRotateCrumpleTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('RotateCrumpleTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0, -1, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TSaturateTransition }

constructor TSaturateTransition.Create;
const
  DX9PS2BIN: array [0..487] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $A3, $3C, $00, $00, $80, $3F, $0A, $D7, $23, $3C, $CD, $CC, $4C, $3F, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $0A, $D7, $23, $3C, $CD, $CC, $4C, $BF, $00, $00, $A0, $40, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90,
    $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80,
    $00, $00, $E4, $B0, $01, $08, $E4, $A0, $01, $00, $00, $02, $02, $00, $08, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $02, $00, $01, $80, $02, $00, $FF, $80, $02, $00, $00, $A0, $02, $00, $55, $A0,
    $05, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $80, $02, $00, $AA, $A0, $04, $00, $00, $04, $02, $00, $02, $80, $02, $00, $FF, $80, $01, $00, $00, $A0, $01, $00, $55, $A0, $05, $00, $00, $03,
    $00, $00, $1F, $80, $00, $00, $E4, $80, $02, $00, $55, $80, $12, $00, $00, $04, $03, $00, $0F, $80, $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $01, $80,
    $02, $00, $FF, $80, $01, $00, $AA, $A1, $01, $00, $FF, $A0, $58, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $00, $80, $00, $00, $E4, $80, $03, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80,
    $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0],'#13+
    '		{ 0.0099999998, 1, 0, 0.80000001 },'#13+
    '		{ 2, 5 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[1];'#13+
    'MUL R0.x, R2, c[2];'#13+
    'ADD R2.y, R0.x, c[1];'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'MUL_SAT R0, R0, R2.y;'#13+
    'SLT R2.y, c[1].w, R2.x;'#13+
    'TEX R1, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R2.x, R2, -c[1].w;'#13+
    'ADD R1, -R0, R1;'#13+
    'MUL R1, R2.x, R1;'#13+
    'ABS R2.x, R2.y;'#13+
    'MAD R1, R1, c[2].y, R0;'#13+
    'CMP R2.x, -R2, c[1].z, c[1].y;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _TMP0;'#13+
    'vec4 _TMP4;'#13+
    'vec4 _c10005;'#13+
    'float _progress0005;'#13+
    'vec4 _c20005;'#13+
    'float _new_progress10005;'#13+
    'vec4 _x0009;'#13+
    'vec4 _TMP10;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0005 = PSParam0.x/1.00000000E+002;'#13+
    '    _c10005 = texture2D(texture0, TEX0.xy);'#13+
    '    _x0009 = _c10005*(2.00000000E+000*_progress0005 + 1.00000000E+000);'#13+
    '    _TMP0 = min(vec4( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000, 1.00000000E+000), _x0009);'#13+
    '    _TMP10 = max(vec4( 0.0, 0.0, 0.0, 0.0), _TMP0);'#13+
    '    _c20005 = texture2D(texture1, TEX0.xy);'#13+
    '    if (_progress0005 > 8.00000012E-001) { '#13+
    '        _new_progress10005 = (_progress0005 - 8.00000012E-001)*5.00000000E+000;'#13+
    '        _TMP4 = _TMP10 + _new_progress10005*(_c20005 - _TMP10);'#13+
    '    } else {'#13+
    '        _TMP4 = _TMP10;'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP4;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TSaturateTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('SaturateTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TSlideInTransition }

constructor TSlideInTransition.Create;
const
  DX9PS2BIN: array [0..495] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $3F, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $D3, $00, $00, $00, $00, $02, $FF, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $CC, $00, $00, $00,
    $6C, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $78, $00, $00, $00, $00, $00, $00, $00, $88, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $94, $00, $00, $00, $00, $00, $00, $00,
    $A4, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $94, $00, $00, $00, $00, $00, $00, $00, $AD, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $BC, $00, $00, $00, $00, $00, $00, $00,
    $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB,
    $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $73, $6C, $69, $64, $65, $41, $6D, $6F, $75, $6E, $74, $00, $AB, $AB, $AB,
    $01, $00, $03, $00, $01, $00, $02, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44,
    $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $02, $00, $0F, $A0, $0A, $D7, $23, $3C, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0,
    $01, $00, $00, $02, $00, $00, $08, $80, $02, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $03, $80, $01, $00, $E4, $A0,
    $00, $00, $00, $80, $00, $00, $E4, $B0, $01, $00, $00, $02, $01, $00, $13, $80, $00, $00, $E4, $80, $02, $00, $00, $03, $01, $00, $03, $80, $00, $00, $E4, $81, $01, $00, $E4, $80, $5A, $00, $00, $04,
    $00, $00, $04, $80, $01, $00, $E4, $80, $01, $00, $E4, $80, $02, $00, $55, $A0, $13, $00, $00, $02, $01, $00, $03, $80, $00, $00, $E4, $80, $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $80,
    $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $01, $08, $E4, $A0, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $AA, $81, $02, $00, $E4, $80, $01, $00, $E4, $80,
    $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R0.x, R0, c[2];'#13+
    'MAD R0.xy, R0.x, c[1], fragment.texcoord[0];'#13+
    'MOV_SAT R0.zw, R0.xyxy;'#13+
    'ADD R0.zw, R0, -R0.xyxy;'#13+
    'ABS R0.zw, R0;'#13+
    'CMP R0.zw, -R0, c[2].y, c[2].z;'#13+
    'ADD_SAT R1.z, R0, R0.w;'#13+
    'FRC R1.xy, R0;'#13+
    'CMP R1.xy, -R1.z, R1, R0;'#13+
    'ABS R2.x, R1.z;'#13+
    'TEX R0, R1, texture[0], 2D;'#13+
    'TEX R1, R1, texture[1], 2D;'#13+
    'CMP R2.x, -R2, c[2].z, c[2].y;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'vec2 _TMP1;'#13+
    'vec4 _TMP7;'#13+
    'vec2 _uv0008;'#13+
    'float _progress0008;'#13+
    'vec2 _TMP11;'#13+
    'bvec2 _a0024;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0008 = PSParam0.x/1.00000000E+002;'#13+
    '    _uv0008 = TEX0.xy + PSParam1.xy*_progress0008;'#13+
    '    _TMP1 = min(vec2( 1.00000000E+000, 1.00000000E+000), _uv0008);'#13+
    '    _TMP11 = max(vec2( 0.0, 0.0), _TMP1);'#13+
    '    _a0024 = bvec2(bool((_TMP11 - _uv0008).x), bool((_TMP11 - _uv0008).y));'#13+
    '    if (_a0024.x || _a0024.y) { '#13+
    '        _uv0008 = fract(_uv0008);'#13+
    '        _TMP7 = texture2D(texture1, _uv0008);'#13+
    '    } else {'#13+
    '        _TMP7 = texture2D(texture0, _uv0008);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP7;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TSlideInTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('SlideTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('SlideAmount', 'The center point of the ripples.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(-65535, -65535), VarFromPointXY(65535, 65535)),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TSwirlTransition }

constructor TSwirlTransition.Create;
const
  DX9PS2BIN: array [0..1243] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $3B, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $C0, $00, $00, $00, $00, $02, $FF, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $B9, $00, $00, $00,
    $6C, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $78, $00, $00, $00, $00, $00, $00, $00, $88, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $94, $00, $00, $00, $00, $00, $00, $00,
    $A4, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $94, $00, $00, $00, $00, $00, $00, $00, $AD, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $78, $00, $00, $00, $00, $00, $00, $00,
    $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB,
    $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $32, $00, $74, $77, $69, $73, $74, $41, $6D, $6F, $75, $6E, $74, $00, $70, $73, $5F,
    $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20,
    $00, $AB, $AB, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0, $00, $00, $00, $00, $00, $00, $80, $3F, $00, $00, $00, $C0, $DB, $0F, $C9, $3F, $51, $00, $00, $05, $03, $00, $0F, $A0, $0A, $D7, $23, $3C,
    $00, $00, $00, $BF, $00, $00, $00, $00, $E2, $76, $38, $3E, $51, $00, $00, $05, $04, $00, $0F, $A0, $5F, $AE, $AA, $3C, $36, $5A, $AE, $BD, $04, $1D, $A9, $BE, $38, $F7, $7F, $3F, $51, $00, $00, $05,
    $05, $00, $0F, $A0, $DB, $0F, $49, $C0, $83, $F9, $22, $3E, $00, $00, $00, $3F, $DB, $0F, $C9, $40, $51, $00, $00, $05, $06, $00, $0F, $A0, $01, $0D, $D0, $B5, $61, $0B, $B6, $B7, $AB, $AA, $2A, $3B,
    $89, $88, $88, $39, $51, $00, $00, $05, $07, $00, $0F, $A0, $AB, $AA, $AA, $BC, $00, $00, $00, $BE, $00, $00, $80, $3F, $00, $00, $00, $3F, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $02, $00, $00, $03, $00, $00, $03, $80, $00, $00, $E4, $B0, $03, $00, $55, $A0,
    $5A, $00, $00, $04, $00, $00, $04, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $03, $00, $AA, $A0, $07, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $03, $80,
    $00, $00, $E4, $80, $00, $00, $AA, $80, $06, $00, $00, $02, $00, $00, $04, $80, $00, $00, $AA, $80, $23, $00, $00, $02, $00, $00, $08, $80, $00, $00, $55, $80, $23, $00, $00, $02, $01, $00, $08, $80,
    $00, $00, $00, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $00, $00, $FF, $80, $01, $00, $FF, $80, $06, $00, $00, $02, $01, $00, $01, $80, $02, $00, $FF, $80, $0A, $00, $00, $03, $02, $00, $01, $80,
    $01, $00, $FF, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $81, $01, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $02, $00, $00, $80,
    $05, $00, $00, $03, $01, $00, $02, $80, $01, $00, $00, $80, $01, $00, $00, $80, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $04, $00, $00, $A0, $04, $00, $55, $A0, $04, $00, $00, $04,
    $01, $00, $04, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $03, $00, $FF, $A0, $04, $00, $00, $04, $01, $00, $04, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $AA, $A0, $04, $00, $00, $04,
    $01, $00, $02, $80, $01, $00, $55, $80, $01, $00, $AA, $80, $04, $00, $FF, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $00, $80, $01, $00, $55, $80, $04, $00, $00, $04, $01, $00, $02, $80,
    $01, $00, $00, $80, $02, $00, $AA, $A0, $02, $00, $FF, $A0, $58, $00, $00, $04, $00, $00, $08, $80, $00, $00, $FF, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80,
    $01, $00, $55, $80, $00, $00, $FF, $80, $01, $00, $00, $80, $58, $00, $00, $04, $01, $00, $01, $80, $00, $00, $00, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $04, $00, $00, $04, $00, $00, $08, $80,
    $01, $00, $00, $80, $05, $00, $00, $A0, $00, $00, $FF, $80, $02, $00, $00, $03, $01, $00, $01, $80, $00, $00, $FF, $80, $00, $00, $FF, $80, $0A, $00, $00, $03, $01, $00, $02, $80, $00, $00, $00, $80,
    $00, $00, $55, $80, $0B, $00, $00, $03, $01, $00, $04, $80, $00, $00, $55, $80, $00, $00, $00, $80, $58, $00, $00, $04, $00, $00, $01, $80, $01, $00, $55, $80, $02, $00, $00, $A0, $02, $00, $55, $A0,
    $58, $00, $00, $04, $00, $00, $02, $80, $01, $00, $AA, $80, $02, $00, $55, $A0, $02, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $00, $80, $04, $00, $00, $04,
    $00, $00, $01, $80, $00, $00, $00, $80, $01, $00, $00, $81, $00, $00, $FF, $80, $05, $00, $00, $03, $00, $00, $02, $80, $00, $00, $AA, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $02, $80,
    $00, $00, $55, $80, $01, $00, $00, $A0, $01, $00, $00, $02, $00, $00, $08, $80, $03, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $80, $00, $00, $00, $A0, $04, $00, $00, $04,
    $00, $00, $01, $80, $00, $00, $55, $80, $00, $00, $FF, $80, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $05, $00, $55, $A0, $05, $00, $AA, $A0, $13, $00, $00, $02,
    $00, $00, $01, $80, $00, $00, $00, $80, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $80, $05, $00, $FF, $A0, $05, $00, $00, $A0, $25, $00, $00, $04, $01, $00, $03, $80, $00, $00, $00, $80,
    $06, $00, $E4, $A0, $07, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $AA, $80, $03, $00, $55, $A1, $01, $00, $00, $02, $01, $00, $13, $80, $00, $00, $E4, $80,
    $02, $00, $00, $03, $01, $00, $03, $80, $00, $00, $E4, $81, $01, $00, $E4, $80, $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $03, $00, $0F, $80,
    $00, $00, $E4, $B0, $01, $08, $E4, $A0, $5A, $00, $00, $04, $00, $00, $01, $80, $01, $00, $E4, $80, $01, $00, $E4, $80, $03, $00, $AA, $A0, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $81,
    $02, $00, $E4, $80, $03, $00, $AA, $A0, $12, $00, $00, $04, $02, $00, $0F, $80, $00, $00, $FF, $80, $03, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $02, $00, $E4, $80,
    $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[5] = { program.local[0..1],'#13+
    '		{ 0.0099999998, 0.5, 0, 1 },'#13+
    '		{ -0.01348047, 0.05747731, 0.1212391, 0.1956359 },'#13+
    '		{ 0.33299461, 0.99999559, 1.570796, 3.141593 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'ADD R0.zw, fragment.texcoord[0].xyxy, -c[2].y;'#13+
    'MUL R0.xy, R0.zwzw, R0.zwzw;'#13+
    'ADD R0.x, R0, R0.y;'#13+
    'RSQ R0.x, R0.x;'#13+
    'MUL R0.zw, R0.x, R0;'#13+
    'ABS R1.x, R0.z;'#13+
    'ABS R0.y, R0.w;'#13+
    'MAX R1.y, R1.x, R0;'#13+
    'RCP R1.z, R1.y;'#13+
    'MIN R1.y, R1.x, R0;'#13+
    'MUL R1.y, R1, R1.z;'#13+
    'MUL R1.z, R1.y, R1.y;'#13+
    'MAD R1.w, R1.z, c[3].x, c[3].y;'#13+
    'MAD R1.w, R1, R1.z, -c[3].z;'#13+
    'MAD R1.w, R1, R1.z, c[3];'#13+
    'MAD R1.w, R1, R1.z, -c[4].x;'#13+
    'SLT R0.y, R1.x, R0;'#13+
    'MAD R1.z, R1.w, R1, c[4].y;'#13+
    'MUL R1.x, R1.z, R1.y;'#13+
    'ABS R0.y, R0;'#13+
    'SLT R0.z, R0, c[2];'#13+
    'ABS R0.z, R0;'#13+
    'ADD R1.y, -R1.x, c[4].z;'#13+
    'CMP R0.y, -R0, c[2].z, c[2].w;'#13+
    'CMP R1.x, -R0.y, R1, R1.y;'#13+
    'SLT R0.y, R0.w, c[2].z;'#13+
    'ABS R0.y, R0;'#13+
    'ADD R1.y, -R1.x, c[4].w;'#13+
    'CMP R0.z, -R0, c[2], c[2].w;'#13+
    'CMP R0.w, -R0.z, R1.x, R1.y;'#13+
    'RCP R0.z, R0.x;'#13+
    'CMP R0.y, -R0, c[2].z, c[2].w;'#13+
    'CMP R0.w, -R0.y, R0, -R0;'#13+
    'MUL R0.y, R0.z, R0.z;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[2];'#13+
    'MUL R0.y, R0, c[1].x;'#13+
    'MAD R0.x, R2, R0.y, R0.w;'#13+
    'SIN R0.y, R0.x;'#13+
    'COS R0.x, R0.x;'#13+
    'MAD R0.xy, R0, R0.z, c[2].y;'#13+
    'MOV_SAT R0.zw, R0.xyxy;'#13+
    'ADD R0.zw, R0, -R0.xyxy;'#13+
    'ABS R0.zw, R0;'#13+
    'CMP R0.zw, -R0, c[2].w, c[2].z;'#13+
    'ADD_SAT R0.z, R0, R0.w;'#13+
    'ABS R1.x, R0.z;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'CMP R1.x, -R1, c[2].z, c[2].w;'#13+
    'CMP R1, -R1.x, R0, c[2].z;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec2 _TMP8;'#13+
    'float _TMP5;'#13+
    'float _TMP4;'#13+
    'float _TMP1;'#13+
    'float _TMP3;'#13+
    'float _TMP2;'#13+
    'float _TMP0;'#13+
    'float _TMP7;'#13+
    'vec4 _TMP13;'#13+
    'vec2 _toUV0014;'#13+
    'vec2 _normToUV0014;'#13+
    'float _angle0014;'#13+
    'float _progress0014;'#13+
    'vec2 _newUV0014;'#13+
    'vec4 _c20014;'#13+
    'float _TMP15;'#13+
    'float _t30024;'#13+
    'float _t10024;'#13+
    'float _t00024;'#13+
    'float _t40024;'#13+
    'float _s0037;'#13+
    'float _c0037;'#13+
    'vec4 _TMP42;'#13+
    'vec2 _TMP46;'#13+
    'bvec2 _a0055;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0014 = PSParam0.x/1.00000000E+002;'#13+
    '    _toUV0014 = TEX0.xy - vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _TMP0 = dot(_toUV0014, _toUV0014);'#13+
    '    _TMP7 = inversesqrt(_TMP0);'#13+
    '    _TMP15 = 1.00000000E+000/_TMP7;'#13+
    '    _normToUV0014 = _toUV0014/_TMP15;'#13+
    '    _t30024 = abs(_normToUV0014.x);'#13+
    '    _t10024 = abs(_normToUV0014.y);'#13+
    '    _t00024 = max(_t30024, _t10024);'#13+
    '    _t10024 = min(_t30024, _t10024);'#13+
    '    _t30024 = 1.00000000E+000/_t00024;'#13+
    '    _t30024 = _t10024*_t30024;'#13+
    '    _t40024 = _t30024*_t30024;'#13+
    '    _t00024 = -1.34804696E-002*_t40024 + 5.74773103E-002;'#13+
    '    _t00024 = _t00024*_t40024 - 1.21239103E-001;'#13+
    '    _t00024 = _t00024*_t40024 + 1.95635900E-001;'#13+
    '    _t00024 = _t00024*_t40024 - 3.32994610E-001;'#13+
    '    _t00024 = _t00024*_t40024 + 9.99995589E-001;'#13+
    '    _t30024 = _t00024*_t30024;'#13+
    '    _TMP2 = abs(_normToUV0014.y);'#13+
    '    _TMP3 = abs(_normToUV0014.x);'#13+
    '    if (_TMP2 > _TMP3) { '#13+
    '        _TMP1 = 1.57079601E+000 - _t30024;'#13+
    '    } else {'#13+
    '        _TMP1 = _t30024;'#13+
    '    } // end if'#13+
    '    if (_normToUV0014.x < 0.0) { '#13+
    '        _TMP4 = 3.14159298E+000 - _TMP1;'#13+
    '    } else {'#13+
    '        _TMP4 = _TMP1;'#13+
    '    } // end if'#13+
    '    if (_normToUV0014.y < 0.0) { '#13+
    '        _TMP5 = -_TMP4;'#13+
    '    } else {'#13+
    '        _TMP5 = _TMP4;'#13+
    '    } // end if'#13+
    '    _angle0014 = _TMP5 + _TMP15*_TMP15*PSParam1.x*_progress0014;'#13+
    '    _s0037 = sin(_angle0014);'#13+
    '    _c0037 = cos(_angle0014);'#13+
    '    _newUV0014.y = _s0037;'#13+
    '    _newUV0014.x = _c0037;'#13+
    '    _newUV0014 = _newUV0014*vec2(_TMP15, _TMP15);'#13+
    '    _newUV0014 = _newUV0014 + vec2( 5.00000000E-001, 5.00000000E-001);'#13+
    '    _TMP8 = min(vec2( 1.00000000E+000, 1.00000000E+000), _newUV0014);'#13+
    '    _TMP46 = max(vec2( 0.0, 0.0), _TMP8);'#13+
    '    _a0055 = bvec2(bool((_TMP46 - _newUV0014).x), bool((_TMP46 - _newUV0014).y));'#13+
    '    if (_a0055.x || _a0055.y) { '#13+
    '        _TMP42 = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } else {'#13+
    '        _TMP42 = texture2D(texture0, _newUV0014);'#13+
    '    } // end if'#13+
    '    _c20014 = texture2D(texture1, TEX0.xy);'#13+
    '    _TMP13 = _TMP42 + _progress0014*(_c20014 - _TMP42);'#13+
    '    gl_FragColor = _TMP13;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TSwirlTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('SwirlTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Strength', 'The amount of twist to the spiral.', TShaderValueType.vtFloat, 30, -70, 70),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TWaterTransition }

constructor TWaterTransition.Create;
const
  DX9PS2BIN: array [0..615] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $42, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $DE, $00, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $D7, $00, $00, $00,
    $80, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $9C, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $B8, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $C1, $00, $00, $00, $03, $00, $02, $00, $01, $00, $0A, $00, $A8, $00, $00, $00, $00, $00, $00, $00,
    $CC, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $8C, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $54, $65, $78, $74, $75, $72, $65, $4D, $61, $70, $00, $72, $61, $6E, $64, $6F, $6D, $53, $65, $65, $64, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73,
    $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $51, $00, $00, $05, $02, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $66, $66, $66, $3F, $CD, $CC, $CC, $3D, $00, $00, $00, $00, $51, $00, $00, $05, $03, $00, $0F, $A0, $00, $00, $00, $40, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00,
    $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $02, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $03, $80, $02, $00, $E4, $A0, $0A, $00, $00, $03, $01, $00, $08, $80, $01, $00, $00, $A0, $00, $00, $55, $80, $04, $00, $00, $04,
    $00, $00, $02, $80, $00, $00, $55, $B0, $02, $00, $AA, $A0, $01, $00, $FF, $80, $13, $00, $00, $02, $01, $00, $02, $80, $00, $00, $55, $80, $05, $00, $00, $03, $01, $00, $01, $80, $00, $00, $00, $B0,
    $02, $00, $AA, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $02, $08, $E4, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $03, $00, $00, $A0, $03, $00, $55, $A0,
    $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $01, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $00, $80, $00, $00, $E4, $B0, $13, $00, $00, $02,
    $01, $00, $03, $80, $01, $00, $E4, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $01, $08, $E4, $A0, $42, $00, $00, $03, $02, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0,
    $12, $00, $00, $04, $03, $00, $0F, $80, $00, $00, $00, $80, $02, $00, $E4, $80, $01, $00, $E4, $80, $58, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $FF, $81, $02, $00, $E4, $80, $03, $00, $E4, $80,
    $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[4] = { program.local[0..1],'#13+
    '		{ 0.1, 0.0099999998, 1, 0 },'#13+
    '		{ 0.89999998, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'MOV R0.z, c[0].x;'#13+
    'MOV R0.x, c[3];'#13+
    'MIN R0.x, R0, c[1];'#13+
    'MAD R0.x, fragment.texcoord[0].y, c[2], R0;'#13+
    'FRC R0.y, R0.x;'#13+
    'MUL R0.x, fragment.texcoord[0], c[2];'#13+
    'TEX R0.xy, R0, texture[2], 2D;'#13+
    'MUL R0.xy, R0, c[3].y;'#13+
    'MUL R3.y, R0.z, c[2];'#13+
    'ADD R0.xy, R0, -c[2].z;'#13+
    'MAD R0.xy, R0, R3.y, fragment.texcoord[0];'#13+
    'FRC R0.xy, R0;'#13+
    'TEX R0, R0, texture[1], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[0], 2D;'#13+
    'SGE R3.x, c[2].w, R0.w;'#13+
    'ADD R2, -R0, R1;'#13+
    'MAD R0, R3.y, R2, R0;'#13+
    'ABS R3.x, R3;'#13+
    'CMP R2.x, -R3, c[2].w, c[2].z;'#13+
    'CMP result.color, -R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec2 _TMP3;'#13+
    'vec4 _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP0;'#13+
    'vec4 _TMP9;'#13+
    'vec2 _offset0010;'#13+
    'float _progress0010;'#13+
    'vec4 _c10010;'#13+
    'vec4 _c20010;'#13+
    'float _x0014;'#13+
    'vec2 _c0016;'#13+
    'vec2 _x0018;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'uniform sampler2D texture2;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0010 = PSParam0.x/1.00000000E+002;'#13+
    '    _TMP0 = min(8.99999976E-001, PSParam1.x);'#13+
    '    _x0014 = TEX0.y/1.00000000E+001 + _TMP0;'#13+
    '    _TMP1 = fract(_x0014);'#13+
    '    _c0016 = vec2(TEX0.x/1.00000000E+001, _TMP1);'#13+
    '    _TMP2 = texture2D(texture2, _c0016);'#13+
    '    _offset0010 = _TMP2.xy*2.00000000E+000 - 1.00000000E+000;'#13+
    '    _x0018 = TEX0.xy + _offset0010*_progress0010;'#13+
    '    _TMP3 = fract(_x0018);'#13+
    '    _c10010 = texture2D(texture0, _TMP3);'#13+
    '    _c20010 = texture2D(texture1, TEX0.xy);'#13+
    '    if (_c10010.w <= 0.0) { '#13+
    '        _TMP9 = _c20010;'#13+
    '    } else {'#13+
    '        _TMP9 = _c10010 + _progress0010*(_c20010 - _c10010);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _TMP9;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FNeedInternalSecondTex := 'clouds';
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TWaterTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('WaterTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('RandomSeed', 'The seed value that determines dripiness.', TShaderValueType.vtFloat, 0.3, 0, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TWaveTransition }

constructor TWaveTransition.Create;
const
  DX9PS2BIN: array [0..699] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $33, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $A0, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $99, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $80, $00, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43,
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $01, $00, $0F, $A0, $0A, $D7, $23, $3C, $6F, $12, $83, $3A, $29, $5C, $0F, $3E, $00, $00, $A0, $41, $51, $00, $00, $05,
    $02, $00, $0F, $A0, $83, $F9, $22, $3E, $00, $00, $00, $3F, $DB, $0F, $C9, $40, $DB, $0F, $49, $C0, $51, $00, $00, $05, $03, $00, $0F, $A0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $51, $00, $00, $05, $04, $00, $0F, $A0, $01, $0D, $D0, $B5, $61, $0B, $B6, $B7, $AB, $AA, $2A, $3B, $89, $88, $88, $39, $51, $00, $00, $05, $05, $00, $0F, $A0, $AB, $AA, $AA, $BC,
    $00, $00, $00, $BE, $00, $00, $80, $3F, $00, $00, $00, $3F, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $01, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $07, $80, $01, $00, $E4, $A0, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $AA, $80, $00, $00, $00, $A0, $04, $00, $00, $04,
    $00, $00, $04, $80, $00, $00, $55, $B0, $01, $00, $FF, $A0, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $AA, $80, $02, $00, $00, $A0, $02, $00, $55, $A0, $13, $00, $00, $02,
    $00, $00, $04, $80, $00, $00, $AA, $80, $04, $00, $00, $04, $00, $00, $04, $80, $00, $00, $AA, $80, $02, $00, $AA, $A0, $02, $00, $FF, $A0, $25, $00, $00, $04, $01, $00, $02, $80, $00, $00, $AA, $80,
    $04, $00, $E4, $A0, $05, $00, $E4, $A0, $05, $00, $00, $03, $00, $00, $02, $80, $00, $00, $55, $80, $00, $00, $00, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $55, $80, $00, $00, $55, $80,
    $01, $00, $00, $02, $01, $00, $02, $80, $03, $00, $00, $A0, $02, $00, $00, $03, $01, $00, $03, $80, $01, $00, $E4, $80, $00, $00, $E4, $B0, $01, $00, $00, $02, $02, $00, $13, $80, $01, $00, $E4, $80,
    $02, $00, $00, $03, $02, $00, $03, $80, $01, $00, $E4, $81, $02, $00, $E4, $80, $42, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $08, $E4, $A0, $42, $00, $00, $03, $03, $00, $0F, $80,
    $00, $00, $E4, $B0, $01, $08, $E4, $A0, $5A, $00, $00, $04, $00, $00, $02, $80, $02, $00, $E4, $80, $02, $00, $E4, $80, $03, $00, $00, $A0, $58, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $55, $81,
    $01, $00, $E4, $80, $03, $00, $00, $A0, $05, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $00, $00, $00, $A0, $12, $00, $00, $04, $02, $00, $0F, $80, $00, $00, $00, $80, $03, $00, $E4, $80,
    $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $02, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0],'#13+
    '		{ 20, 14, 0.0099999998, 1 },'#13+
    '		{ 0, 0.1 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[0];'#13+
    'MUL R2.x, R0, c[1].z;'#13+
    'MUL R0.x, R2, c[1].y;'#13+
    'MAD R0.x, fragment.texcoord[0].y, c[1], R0;'#13+
    'SIN R0.x, R0.x;'#13+
    'MUL R0.x, R2, R0;'#13+
    'MOV R0.y, c[2].x;'#13+
    'MUL R0.x, R0, c[2].y;'#13+
    'ADD R0.xy, fragment.texcoord[0], R0;'#13+
    'MOV_SAT R0.zw, R0.xyxy;'#13+
    'ADD R1.xy, R0.zwzw, -R0;'#13+
    'MOV R0.z, c[2].x;'#13+
    'ABS R1.xy, R1;'#13+
    'CMP R1.xy, -R1, c[1].w, R0.z;'#13+
    'ADD_SAT R1.y, R1.x, R1;'#13+
    'TEX R0, R0, texture[0], 2D;'#13+
    'ABS R1.y, R1;'#13+
    'MOV R1.x, c[1].w;'#13+
    'CMP R1.x, -R1.y, c[2], R1;'#13+
    'CMP R1, -R1.x, R0, c[2].x;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R2.x, R0, R1;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec2 _TMP2;'#13+
    'float _TMP0;'#13+
    'vec4 _TMP6;'#13+
    'float _progress0007;'#13+
    'vec2 _newUV0007;'#13+
    'vec4 _c20007;'#13+
    'float _a0009;'#13+
    'vec4 _TMP10;'#13+
    'vec2 _TMP14;'#13+
    'bvec2 _a0023;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0007 = PSParam0.x/1.00000000E+002;'#13+
    '    _a0009 = 2.00000000E+001*TEX0.y + 1.40000000E+001*_progress0007;'#13+
    '    _TMP0 = sin(_a0009);'#13+
    '    _newUV0007 = TEX0.xy + vec2(1.00000001E-001*_progress0007*_TMP0, 0.0);'#13+
    '    _TMP2 = min(vec2( 1.00000000E+000, 1.00000000E+000), _newUV0007);'#13+
    '    _TMP14 = max(vec2( 0.0, 0.0), _TMP2);'#13+
    '    _a0023 = bvec2(bool((_TMP14 - _newUV0007).x), bool((_TMP14 - _newUV0007).y));'#13+
    '    if (_a0023.x || _a0023.y) { '#13+
    '        _TMP10 = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } else {'#13+
    '        _TMP10 = texture2D(texture0, _newUV0007);'#13+
    '    } // end if'#13+
    '    _c20007 = texture2D(texture1, TEX0.xy);'#13+
    '    _TMP6 = _TMP10 + _progress0007*(_c20007 - _TMP10);'#13+
    '    gl_FragColor = _TMP6;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TWaveTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('WaveTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

{ TLineTransition }

constructor TLineTransition.Create;
const
  DX9PS2BIN: array [0..683] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $56, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $2D, $01, $00, $00, $00, $02, $FF, $FF, $07, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $26, $01, $00, $00,
    $A8, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $B4, $00, $00, $00, $00, $00, $00, $00, $C4, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $D0, $00, $00, $00, $00, $00, $00, $00,
    $E0, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $D0, $00, $00, $00, $00, $00, $00, $00, $E9, $00, $00, $00, $02, $00, $04, $00, $01, $00, $12, $00, $B4, $00, $00, $00, $00, $00, $00, $00,
    $F5, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $00, $01, $00, $00, $00, $00, $00, $00, $10, $01, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $00, $01, $00, $00, $00, $00, $00, $00,
    $1B, $01, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $00, $01, $00, $00, $00, $00, $00, $00, $50, $72, $6F, $67, $72, $65, $73, $73, $00, $AB, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74, $75, $72, $65, $31, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $54, $65, $78, $74,
    $75, $72, $65, $32, $00, $66, $75, $7A, $7A, $79, $41, $6D, $6F, $75, $6E, $74, $00, $6C, $69, $6E, $65, $4E, $6F, $72, $6D, $61, $6C, $00, $01, $00, $03, $00, $01, $00, $02, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $6C, $69, $6E, $65, $4F, $66, $66, $73, $65, $74, $00, $6C, $69, $6E, $65, $4F, $72, $69, $67, $69, $6E, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F,
    $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $51, $00, $00, $05, $05, $00, $0F, $A0,
    $0A, $D7, $23, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0,
    $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $E4, $B0,
    $01, $08, $E4, $A0, $01, $00, $00, $02, $02, $00, $03, $80, $05, $00, $E4, $A0, $05, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $80, $00, $00, $00, $A0, $01, $00, $00, $02, $03, $00, $03, $80,
    $01, $00, $E4, $A0, $02, $00, $00, $03, $03, $00, $03, $80, $03, $00, $E4, $81, $03, $00, $E4, $A0, $04, $00, $00, $04, $03, $00, $03, $80, $02, $00, $00, $80, $03, $00, $E4, $80, $01, $00, $E4, $A0,
    $02, $00, $00, $03, $03, $00, $03, $80, $03, $00, $E4, $81, $00, $00, $E4, $B0, $5A, $00, $00, $04, $02, $00, $01, $80, $02, $00, $E4, $A0, $02, $00, $E4, $A0, $02, $00, $55, $80, $07, $00, $00, $02,
    $02, $00, $01, $80, $02, $00, $00, $80, $05, $00, $00, $03, $02, $00, $03, $80, $02, $00, $00, $80, $02, $00, $E4, $A0, $5A, $00, $00, $04, $02, $00, $01, $80, $02, $00, $E4, $80, $03, $00, $E4, $80,
    $04, $00, $00, $A0, $02, $00, $00, $03, $02, $00, $02, $80, $04, $00, $00, $A0, $04, $00, $00, $A0, $06, $00, $00, $02, $02, $00, $02, $80, $02, $00, $55, $80, $05, $00, $00, $03, $02, $00, $11, $80,
    $02, $00, $00, $80, $02, $00, $55, $80, $12, $00, $00, $04, $03, $00, $0F, $80, $02, $00, $00, $80, $00, $00, $E4, $80, $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $03, $00, $E4, $80,
    $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[6] = { program.local[0..4],'#13+
    '		{ 0.0099999998, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'MUL R2.xy, c[2], c[2];'#13+
    'ADD R2.z, R2.x, R2.y;'#13+
    'MOV R2.xy, c[1];'#13+
    'MOV R2.w, c[0].x;'#13+
    'RSQ R3.x, R2.z;'#13+
    'TEX R0, fragment.texcoord[0], texture[1], 2D;'#13+
    'TEX R1, fragment.texcoord[0], texture[0], 2D;'#13+
    'MUL R2.w, R2, c[5].x;'#13+
    'ADD R2.xy, -R2, c[3];'#13+
    'MAD R2.xy, R2.w, R2, c[1];'#13+
    'ADD R2.zw, fragment.texcoord[0].xyxy, -R2.xyxy;'#13+
    'MUL R2.xy, R3.x, c[2];'#13+
    'MUL R2.xy, R2, R2.zwzw;'#13+
    'ADD R2.x, R2, R2.y;'#13+
    'MOV R3.x, c[5].y;'#13+
    'MUL R2.z, R3.x, c[4].x;'#13+
    'ADD R1, R1, -R0;'#13+
    'RCP R2.y, R2.z;'#13+
    'ADD R2.x, R2, c[4];'#13+
    'MUL_SAT R2.x, R2, R2.y;'#13+
    'MAD result.color, R2.x, R1, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'struct VS_OUTPUT {'#13+
    '    vec4 _Color;'#13+
    '    vec2 _UV;'#13+
    '};'#13+
    'float _TMP2;'#13+
    'float _TMP1;'#13+
    'float _TMP0;'#13+
    'vec4 _TMP11;'#13+
    'vec2 _currentLineOrigin0012;'#13+
    'float _progress0012;'#13+
    'vec2 _normLineNormal0012;'#13+
    'vec4 _c10012;'#13+
    'vec4 _c20012;'#13+
    'float _distFromLine0012;'#13+
    'vec2 _b0026;'#13+
    'float _x0028;'#13+
    'float _TMP29;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'uniform vec4 PSParam4;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform sampler2D texture1;'#13+
    'void main()'#13+
    '{'#13+
    '    _progress0012 = PSParam0.x/1.00000000E+002;'#13+
    '    _currentLineOrigin0012 = PSParam1.xy + _progress0012*(PSParam3.xy - PSParam1.xy);'#13+
    '    _TMP0 = dot(PSParam2.xy, PSParam2.xy);'#13+
    '    _TMP1 = inversesqrt(_TMP0);'#13+
    '    _normLineNormal0012 = _TMP1*PSParam2.xy;'#13+
    '    _c10012 = texture2D(texture0, TEX0.xy);'#13+
    '    _c20012 = texture2D(texture1, TEX0.xy);'#13+
    '    _b0026 = TEX0.xy - _currentLineOrigin0012;'#13+
    '    _distFromLine0012 = dot(_normLineNormal0012, _b0026);'#13+
    '    _x0028 = (_distFromLine0012 + PSParam4.x)/(2.00000000E+000*PSParam4.x);'#13+
    '    _TMP2 = min(1.00000000E+000, _x0028);'#13+
    '    _TMP29 = max(0.0, _TMP2);'#13+
    '    _TMP11 = _c20012 + _TMP29*(_c10012 - _c20012);'#13+
    '    gl_FragColor = _TMP11;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TLineTransition.FilterAttr: TFilterRec;
begin
  Result := FilterRec('LineTransition', 'A transition effect.', [
    FilterValueRec('Progress', 'The amount(%) of the transition from first texture to the second texture.', TShaderValueType.vtFloat, 30, 0, 100),
    FilterValueRec('Origin', 'The line origin.', TShaderValueType.vtPoint, VarFromPointXY(0, 0), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Normal', 'The line normal.', TShaderValueType.vtPoint, VarFromPointXY(150, 150), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('Offset', 'The line offset.', TShaderValueType.vtPoint, VarFromPointXY(400, 400), VarFromPointXY(0, 0), VarFromPointXY(65535, 65535)),
    FilterValueRec('FuzzyAmount', 'The fuzziness factor.', TShaderValueType.vtFloat, 0.1, 0, 1),
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

initialization
  RegisterFilter('Transition', TBandedSwirlTransition);
  RegisterFilter('Transition', TBlindTransition);
  RegisterFilter('Transition', TBloodTransition);
  RegisterFilter('Transition', TCircleTransition);
  RegisterFilter('Transition', TMagnifyTransition);
  RegisterFilter('Transition', TCrumpleTransition);
  RegisterFilter('Transition', TDissolveTransition);
  RegisterFilter('Transition', TDropTransition);
  RegisterFilter('Transition', TFadeTransition);
  RegisterFilter('Transition', TBrightTransition);
  RegisterFilter('Transition', TPixelateTransition);
  RegisterFilter('Transition', TBlurTransition);
  RegisterFilter('Transition', TWiggleTransition);
  RegisterFilter('Transition', TShapeTransition);
  RegisterFilter('Transition', TRippleTransition);
  RegisterFilter('Transition', TRotateCrumpleTransition);
  RegisterFilter('Transition', TSaturateTransition);
  RegisterFilter('Transition', TSlideInTransition);
  RegisterFilter('Transition', TSwirlTransition);
  RegisterFilter('Transition', TWaterTransition);
  RegisterFilter('Transition', TWaveTransition);
  RegisterFilter('Transition', TLineTransition);
end.
