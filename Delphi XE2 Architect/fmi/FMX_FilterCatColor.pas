{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_FilterCatColor;

interface

{$I FMX_Defines.inc}

uses
  FMX_Filter;

type

  TInvertFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TMonochromeFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TColorKeyAlphaFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TMaskToAlphaFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

implementation

{ TInvertFilter }

constructor TInvertFilter.Create;
const
  DX: array [0..215] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $22, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $5F, $00, $00, $00, $00, $02, $FF, $FF, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $58, $00, $00, $00,
    $30, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $48, $00, $00, $00, $00, $00, $00, $00, $69, $6D, $70, $6C, $69, $63, $69, $74, $49, $6E, $70, $75, $74, $53, $61, $6D, $70, $6C, $65, $72,
    $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29,
    $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $02, $00, $00, $03, $00, $00, $07, $80, $00, $00, $E4, $81, $00, $00, $FF, $80,
    $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  GL: PAnsiChar =
    '!!ARBfp1.0'#13+
    'TEMP R0;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'ADD result.color.xyz, R0.w, -R0;'#13+
    'MOV result.color.w, R0;'#13+
    'END';
  GLES: PAnsiChar =
    'uniform sampler2D texture0;'+
    'varying vec4 TEX0;'+
    'void main() {'+
    'gl_FragColor = texture2D(texture0, TEX0.xy);'+
    'gl_FragColor = vec4(gl_FragColor.a - gl_FragColor.rgb, gl_FragColor.a);'+
    '}';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX, GL, GLES);
end;

class function TInvertFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('Invert', 'An effect that inverts all colors.', [
  ]);
end;

{ TMonochromeFilter }

constructor TMonochromeFilter.Create;
const
  DX9PS2BIN: array [0..223] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $1E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $4F, $00, $00, $00, $00, $02, $FF, $FF, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $48, $00, $00, $00,
    $30, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $38, $00, $00, $00, $00, $00, $00, $00, $69, $6E, $70, $75, $74, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F,
    $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $00, $00, $0F, $A0, $D0, $B3, $59, $3E, $59, $17, $37, $3F, $98, $DD, $93, $3D, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80,
    $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $08, $00, $00, $03, $00, $00, $07, $80,
    $00, $00, $E4, $80, $00, $00, $E4, $A0, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[1] = { { 0.21259999, 0.71520001, 0.0722 } };'#13+
    'TEMP R0;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'DP3 result.color.xyz, R0, c[0];'#13+
    'MOV result.color.w, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _ret_0;'#13+
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'void main()'#13+
    '{'#13+
    '    vec4 _color;'#13+
    '    float _gray;'#13+
    '    _color = texture2D(texture0, TEX0.xy);'#13+
    '    _gray = dot(_color.xyz, vec3( 2.12599993E-001, 7.15200007E-001, 7.22000003E-002));'#13+
    '    _ret_0 = vec4(_gray, _gray, _gray, _color.w);'#13+
    '    gl_FragColor = _ret_0;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TMonochromeFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('Monochrome', 'Remaps colors so they fall within shades of a single color.', [
  ]);
end;

{ TColorKeyAlphaFilter }

constructor TColorKeyAlphaFilter.Create;
const
  DX9PS2BIN: array [0..435] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $3A, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $BF, $00, $00, $00, $00, $02, $FF, $FF, $03, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $B8, $00, $00, $00,
    $58, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, $74, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $80, $00, $00, $00, $00, $00, $00, $00,
    $90, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $A8, $00, $00, $00, $00, $00, $00, $00, $43, $6F, $6C, $6F, $72, $4B, $65, $79, $00, $AB, $AB, $AB, $01, $00, $03, $00, $01, $00, $04, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $54, $6F, $6C, $65, $72, $61, $6E, $63, $65, $00, $AB, $AB, $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $69, $6D, $70, $6C,
    $69, $63, $69, $74, $49, $6E, $70, $75, $74, $53, $61, $6D, $70, $6C, $65, $72, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32,
    $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00,
    $51, $00, $00, $05, $02, $00, $0F, $A0, $00, $00, $00, $00, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02,
    $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $02, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $E4, $A1,
    $23, $00, $00, $02, $01, $00, $07, $80, $01, $00, $E4, $80, $02, $00, $00, $03, $01, $00, $07, $80, $01, $00, $E4, $80, $01, $00, $00, $A1, $58, $00, $00, $04, $01, $00, $07, $80, $01, $00, $E4, $80,
    $02, $00, $00, $A0, $02, $00, $55, $A0, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $55, $80, $01, $00, $00, $80, $05, $00, $00, $03, $01, $00, $01, $80, $01, $00, $AA, $80, $01, $00, $00, $80,
    $58, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $00, $81, $00, $00, $E4, $80, $02, $00, $00, $A0, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'ADD R1.xyz, R0, -c[0];'#13+
    'ABS R1.xyz, R1;'#13+
    'SLT R1.xyz, R1, c[1].x;'#13+
    'MUL R1.x, R1, R1.y;'#13+
    'MUL R1.x, R1, R1.z;'#13+
    'CMP result.color, -R1.x, c[2].x, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec3 _TMP0;'#13+
    'vec3 _a0007;'#13+
    'bvec3 _a0009;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform sampler2D texture0;'#13+
    'void main()'#13+
    '{'#13+
    '    vec4 _color;'#13+
    '    _color = texture2D(texture0, TEX0.xy);'#13+
    '    _a0007 = _color.xyz - PSParam0.xyz;'#13+
    '    _TMP0 = abs(_a0007);'#13+
    '    _a0009 = bvec3(_TMP0.x < PSParam1.x, _TMP0.y < PSParam1.x, _TMP0.z < PSParam1.x);'#13+
    '    if (_a0009.x && _a0009.y && _a0009.z) { '#13+
    '        _color.xyzw = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _color;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TColorKeyAlphaFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('ColorKeyAlpha', 'An effect that makes pixels of a particular color transparent.', [
    FilterValueRec('ColorKey', 'The color that becomes transparent.', TShaderValueType.vtFloat, 0, -1, 1),
    FilterValueRec('Tolerance', 'The tolerance in color differences.', TShaderValueType.vtFloat, 0.3, 0, 1)
  ]);
end;

{ TMaskToAlphaFilter }

constructor TMaskToAlphaFilter.Create;
const
  DX9PS2BIN: array [0..223] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $1E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $4F, $00, $00, $00, $00, $02, $FF, $FF, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $48, $00, $00, $00,
    $30, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $38, $00, $00, $00, $00, $00, $00, $00, $69, $6E, $70, $75, $74, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00,
    $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F,
    $6D, $70, $69, $6C, $65, $72, $20, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80,
    $00, $00, $E4, $B0, $00, $08, $E4, $A0, $06, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $80, $01, $00, $00, $02,
    $01, $00, $08, $80, $00, $00, $00, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $01, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'TEMP R0;'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'RCP R0.w, R0.w;'#13+
    'MUL result.color.xyz, R0, R0.w;'#13+
    'MOV result.color.w, R0.x;'#13+
    'END';
  GLSLF: PAnsiChar =
    'vec4 _ret_0;'#13+
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'void main()'#13+
    '{'#13+
    '    vec4 _originalColor;'#13+
    '    vec3 _rgb;'#13+
    '    _originalColor = texture2D(texture0, TEX0.xy);'#13+
    '    _rgb = _originalColor.xyz/_originalColor.w;'#13+
    '    _ret_0 = vec4(_rgb.x, _rgb.y, _rgb.z, _originalColor.x);'#13+
    '    gl_FragColor = _ret_0;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TMaskToAlphaFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('MaskToAlpha', 'Converts a grayscale image to a white image that is masked by alpha.', [
  ]);
end;

initialization
  RegisterFilter('Color', TInvertFilter);
  RegisterFilter('Color', TMonochromeFilter);
  RegisterFilter('Color', TColorKeyAlphaFilter);
  RegisterFilter('Color', TMaskToAlphaFilter);
end.
