{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_FilterCatComposite;

interface

{$I FMX_Defines.inc}

uses
  FMX_Filter;

type

  TNormalBlendFilter = class(TShaderFilter)
  protected
    class function FilterAttr: TFilterRec; override;
  public
    constructor Create; override;
  end;

implementation

uses
  Variants;

{ TNormalBlendFilter }

constructor TNormalBlendFilter.Create;
const
  DX: array [0..299] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $25, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $69, $00, $00, $00, $00, $02, $FF, $FF, $02, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $62, $00, $00, $00, 
    $44, $00, $00, $00, $03, $00, $01, $00, $01, $00, $06, $00, $4C, $00, $00, $00, $00, $00, $00, $00, $5C, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $4C, $00, $00, $00, $00, $00, $00, $00, 
    $62, $6C, $65, $6E, $64, $00, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $69, $6E, $70, $75, $74, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, 
    $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $51, $00, $00, $05, 
    $00, $00, $0F, $A0, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, 
    $00, $08, $0F, $A0, $1F, $00, $00, $02, $00, $00, $00, $90, $01, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $B0, $00, $08, $E4, $A0, $42, $00, $00, $03, $01, $00, $0F, $80, 
    $00, $00, $E4, $B0, $01, $08, $E4, $A0, $02, $00, $00, $03, $02, $00, $08, $80, $01, $00, $FF, $81, $00, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $FF, $80, $00, $00, $E4, $80, 
    $01, $00, $E4, $80, $01, $00, $00, $02, $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  GL: array [0..223] of byte = (
    $21, $21, $41, $52, $42, $66, $70, $31, $2E, $30, $0D, $0A, $50, $41, $52, $41, $4D, $20, $63, $5B, $31, $5D, $20, $3D, $20, $7B, $20, $7B, $20, $31, $20, $7D, $20, $7D, $3B, $0D, $0A, $54, $45, $4D,
    $50, $20, $52, $30, $3B, $0D, $0A, $54, $45, $4D, $50, $20, $52, $31, $3B, $0D, $0A, $54, $45, $4D, $50, $20, $52, $32, $3B, $0D, $0A, $54, $45, $58, $20, $52, $30, $2C, $20, $66, $72, $61, $67, $6D,
    $65, $6E, $74, $2E, $74, $65, $78, $63, $6F, $6F, $72, $64, $5B, $30, $5D, $2C, $20, $74, $65, $78, $74, $75, $72, $65, $5B, $31, $5D, $2C, $20, $32, $44, $3B, $0D, $0A, $54, $45, $58, $20, $52, $31,
    $2C, $20, $66, $72, $61, $67, $6D, $65, $6E, $74, $2E, $74, $65, $78, $63, $6F, $6F, $72, $64, $5B, $30, $5D, $2C, $20, $74, $65, $78, $74, $75, $72, $65, $5B, $30, $5D, $2C, $20, $32, $44, $3B, $0D,
    $0A, $41, $44, $44, $20, $52, $32, $2E, $78, $2C, $20, $2D, $52, $30, $2E, $77, $2C, $20, $63, $5B, $30, $5D, $3B, $0D, $0A, $4D, $41, $44, $20, $72, $65, $73, $75, $6C, $74, $2E, $63, $6F, $6C, $6F,
    $72, $2C, $20, $52, $32, $2E, $78, $2C, $20, $52, $31, $2C, $20, $52, $30, $3B, $0D, $0A, $45, $4E, $44, $0D, $0A, 0
  );
  GLES: PAnsiChar =
    'varying vec4 TEX0;'+
    'uniform sampler2D texture0;'+
    'uniform sampler2D texture1;'+
    'void main()'+
    '{'+
    '    vec4 texture0Color;'+
    '    vec4 texture1Color;'+
    '    texture0Color = texture2D(texture0, TEX0.xy);'+
    '    texture1Color = texture2D(texture1, TEX0.xy);'+
    '    texture0Color = (1.00000000E+000 - texture1Color.w)*texture0Color + texture1Color;'+
    '    gl_FragColor = texture0Color;'+
    '    return;'+
    '}';
begin
  inherited;
  FShaders[FPassCount] := ShaderDevice.CreatePixelShader(@DX, @GL, GLES);
end;

class function TNormalBlendFilter.FilterAttr: TFilterRec;
begin
  Result := FilterRec('NormalBlend', 'Normal blending of two images.', [
    FilterValueRec('Target', 'The target bitmap.', TShaderValueType.vtBitmap, NULL, NULL, NULL)
  ]);
end;

initialization
  RegisterFilter('Composite', TNormalBlendFilter);
end.
