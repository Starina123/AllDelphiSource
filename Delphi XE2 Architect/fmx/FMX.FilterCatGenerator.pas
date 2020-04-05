{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.FilterCatGenerator;

interface

{$I FMX.Defines.inc}

uses
  FMX.Filter;

type

  TFillFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

  TFillOpaqueFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

implementation

{ TFillFilter }

constructor TFillFilter.Create;
const
  DX9PS2BIN: array [0..147] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $1F, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $53, $00, $00, $00, $00, $02, $FF, $FF, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $4C, $00, $00, $00,
    $30, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $3C, $00, $00, $00, $00, $00, $00, $00, $46, $69, $6C, $6C, $43, $6F, $6C, $6F, $72, $00, $AB, $AB, $01, $00, $03, $00, $01, $00, $04, $00,
    $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65,
    $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $A0, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[1] = { program.local[0] };'#13+
    'MOV result.color, c[0];'#13+
    'END';
  GLSLF: PAnsiChar =
    'uniform vec4 PSParam0;'#13+
    'void main()'#13+
    '{'#13+
    '    gl_FragColor = PSParam0;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TFillFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('Fill', 'Generates a solid color.', [
    FilterValueRec('Color', 'The fill color.', TShaderValueType.vtColor, $FF203040, 0, 0)
  ]);
end;

{ TFillOpaqueFilter }

constructor TFillOpaqueFilter.Create;
const
  DX9PS2BIN: array [0..291] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $2A, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $7F, $00, $00, $00, $00, $02, $FF, $FF, $02, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $78, $00, $00, $00,
    $44, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $50, $00, $00, $00, $00, $00, $00, $00, $60, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $68, $00, $00, $00, $00, $00, $00, $00,
    $46, $69, $6C, $6C, $43, $6F, $6C, $6F, $72, $00, $AB, $AB, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $69, $6E, $70, $75, $74, $00, $AB, $AB, $04, $00, $0C, $00,
    $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53,
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $01, $00, $0F, $A0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0,
    $05, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $FF, $80, $00, $00, $E4, $A0, $58, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $FF, $81, $01, $00, $00, $A0, $01, $00, $E4, $80, $01, $00, $00, $02,
    $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar =
    '!!ARBfp1.0'#13+
    'PARAM c[2] = { program.local[0],'#13+
    '		{ 1, 0 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEX R0.w, fragment.texcoord[0], texture[0], 2D;'#13+
    'SLT R0.x, c[1].y, R0.w;'#13+
    'ABS R1.x, R0;'#13+
    'MUL R0, R0.w, c[0];'#13+
    'CMP R1.x, -R1, c[1].y, c[1];'#13+
    'CMP result.color, -R1.x, c[1].y, R0;'#13+
    'END';
  GLSLF: PAnsiChar =
    'varying vec4 TEX0;'#13+
    'uniform sampler2D texture0;'#13+
    'uniform vec4 PSParam0;'#13+
    'void main()'#13+
    '{'#13+
    '    vec4 _Color;'#13+
    '    _Color = texture2D(texture0, TEX0.xy);'#13+
    '    if (_Color.w > 0.0) { '#13+
    '        _Color = PSParam0*_Color.w;'#13+
    '    } else {'#13+
    '        _Color = vec4( 0.0, 0.0, 0.0, 0.0);'#13+
    '    } // end if'#13+
    '    gl_FragColor = _Color;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TFillOpaqueFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('FillRGB', 'Fill all pixels with not empty alpha.', [
    FilterValueRec('Color', 'The fill color.', TShaderValueType.vtColor, $FF203040, 0, 0)
  ]);
end;

initialization
  RegisterFilter('Generator', TFillFilter);
  RegisterFilter('Generator', TFillOpaqueFilter);
end.
