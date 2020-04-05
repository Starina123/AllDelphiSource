{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.FilterCatTiles;

interface

{$I FMX.Defines.inc}

uses
  FMX.Filter;

type

  TTilerFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

implementation


{ TTilerFilter }

constructor TTilerFilter.Create;
const
  DX9PS2BIN: array [0..455] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $4C, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $07, $01, $00, $00, $00, $02, $FF, $FF, $05, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $00, $01, $00, $00, 
    $80, $00, $00, $00, $02, $00, $02, $00, $01, $00, $0A, $00, $94, $00, $00, $00, $00, $00, $00, $00, $A4, $00, $00, $00, $02, $00, $01, $00, $01, $00, $06, $00, $94, $00, $00, $00, $00, $00, $00, $00, 
    $B8, $00, $00, $00, $02, $00, $03, $00, $01, $00, $0E, $00, $94, $00, $00, $00, $00, $00, $00, $00, $C7, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $94, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $48, $6F, $72, $69, $7A, $6F, $6E, $74, $61, $6C, $4F, $66, $66, $73, $65, $74, $00, $AB, $AB, $AB, 
    $00, $00, $03, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $48, $6F, $72, $69, $7A, $6F, $6E, $74, $61, $6C, $54, $69, $6C, $65, $43, $6F, $75, $6E, $74, $00, $56, $65, $72, $74, 
    $69, $63, $61, $6C, $4F, $66, $66, $73, $65, $74, $00, $56, $65, $72, $74, $69, $63, $61, $6C, $54, $69, $6C, $65, $43, $6F, $75, $6E, $74, $00, $69, $6D, $70, $6C, $69, $63, $69, $74, $49, $6E, $70, 
    $75, $74, $53, $61, $6D, $70, $6C, $65, $72, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, 
    $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $1F, $00, $00, $02, $00, $00, $00, $80, 
    $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $01, $00, $00, $02, $00, $00, $08, $80, $01, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $01, $80, $00, $00, $00, $B0, 
    $00, $00, $FF, $80, $02, $00, $00, $A0, $13, $00, $00, $02, $00, $00, $01, $80, $00, $00, $00, $80, $01, $00, $00, $02, $01, $00, $08, $80, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $04, $80, 
    $00, $00, $55, $B0, $01, $00, $FF, $80, $03, $00, $00, $A0, $13, $00, $00, $02, $00, $00, $02, $80, $00, $00, $AA, $80, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $00, $08, $E4, $A0, 
    $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar = 
    '!!ARBfp1.0'#13+
    'PARAM c[4] = { program.local[0..3] };'#13+
    'TEMP R0;'#13+
    'MUL R0.y, fragment.texcoord[0], c[0].x;'#13+
    'MUL R0.x, fragment.texcoord[0], c[1];'#13+
    'ADD R0.y, R0, c[3].x;'#13+
    'ADD R0.x, R0, c[2];'#13+
    'FRC R0.y, R0;'#13+
    'FRC R0.x, R0;'#13+
    'TEX result.color, R0, texture[0], 2D;'#13+
    'END';
  GLSLF: PAnsiChar = 
    'vec4 _ret_0;'#13+
    'float _TMP1;'#13+
    'float _TMP0;'#13+
    'float _x0008;'#13+
    'float _x0010;'#13+
    'varying vec4 TEX0;'#13+
    'uniform vec4 PSParam0;'#13+
    'uniform vec4 PSParam1;'#13+
    'uniform vec4 PSParam2;'#13+
    'uniform vec4 PSParam3;'#13+
    'uniform sampler2D texture0;'#13+
    'void main()'#13+
    '{'#13+
    '    vec2 _newUv;'#13+
    '    _x0008 = TEX0.x*PSParam1.x + PSParam2.x;'#13+
    '    _TMP0 = fract(_x0008);'#13+
    '    _x0010 = TEX0.y*PSParam0.x + PSParam3.x;'#13+
    '    _TMP1 = fract(_x0010);'#13+
    '    _newUv = vec2(_TMP0, _TMP1);'#13+
    '    _ret_0 = texture2D(texture0, _newUv);'#13+
    '    gl_FragColor = _ret_0;'#13+
    '    return;'#13+
    '} ';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX9PS2BIN, ARBFP1, GLSLF);
end;

class function TTilerFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('Tiler', 'Pixel shader tiles the image across multiple rows and columns', [
    FilterValueRec('VerticalTileCount', 'The number of verical tiles to add to the output. The higher the value the more tiles.', TShaderValueType.vtFloat, 4, 0, 20),
    FilterValueRec('HorizontalTileCount', 'The number of horizontal tiles to add to the output. The higher the value the more tiles.', TShaderValueType.vtFloat, 3, 0, 20),
    FilterValueRec('HorizontalOffset', 'Change the horizontal offset of each tile.', TShaderValueType.vtFloat, 0, 0, 1),
    FilterValueRec('VerticalOffset', 'Change the vertical offset of each tile.', TShaderValueType.vtFloat, 0, 0, 1)
  ]);
end;

initialization
  RegisterFilter('Tiles', TTilerFilter);
end.
