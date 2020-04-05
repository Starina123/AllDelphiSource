{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_ASE_Lexer;

{$IFDEF FPC}
{$mode delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes, {$IFNDEF FPC}System.Generics.Defaults, {$ENDIF}
  TypInfo;

type
  TASEToken = (atUnknown, atEOF, atKeyWord, atIdent, atString, atInteger,
    atFloat, atColon, atOpenBracket, atCloseBracket, atComma);

  TKeyWord = (kw_UNKNOWN, // special position, for all unknown key words
    kw_3DSMAX_ASCIIEXPORT,
    kw_COMMENT,
    kw_SCENE,
      kw_SCENE_FILENAME,
      kw_SCENE_FIRSTFRAME,
      kw_SCENE_LASTFRAME,
      kw_SCENE_FRAMESPEED,
      kw_SCENE_TICKSPERFRAME,
      kw_SCENE_BACKGROUND_STATIC,
      kw_SCENE_AMBIENT_STATIC,
    kw_MATERIAL_LIST,
      kw_MATERIAL_COUNT,
      kw_MATERIAL,
        kw_MATERIAL_NAME,
        kw_MATERIAL_CLASS,
        kw_MATERIAL_AMBIENT,
        kw_MATERIAL_DIFFUSE,
        kw_MATERIAL_SPECULAR,
        kw_MATERIAL_SHINE,
        kw_MATERIAL_SHINESTRENGTH,
        kw_MATERIAL_TRANSPARENCY,
        kw_MATERIAL_WIRESIZE,
        kw_MATERIAL_SHADING,
        kw_MATERIAL_XP_FALLOFF,
        kw_MATERIAL_SELFILLUM,
        kw_MATERIAL_FALLOFF,
        kw_MATERIAL_XP_TYPE,
        kw_NUMSUBMTLS,
        kw_SUBMATERIAL,
        kw_MAP_DIFFUSE,
          kw_MAP_NAME,
          kw_MAP_CLASS,
          kw_MAP_SUBNO,
          kw_MAP_AMOUNT,
          kw_BITMAP,
          kw_MAP_TYPE,
          kw_UVW_U_OFFSET,
          kw_UVW_V_OFFSET,
          kw_UVW_U_TILING,
          kw_UVW_V_TILING,
          kw_UVW_ANGLE,
          kw_UVW_BLUR,
          kw_UVW_BLUR_OFFSET,
          kw_UVW_NOUSE_AMT,
          kw_UVW_NOISE_SIZE,
          kw_UVW_NOISE_LEVEL,
          kw_UVW_NOISE_PHASE,
          kw_BITMAP_FILTER,
    kw_GEOMOBJECT,
      kw_NODE_NAME,
      kw_NODE_TM,
        // kw_NODE_NAME,
        kw_INHERIT_POS,
        kw_INHERIT_ROT,
        kw_INHERIT_SCL,
        kw_TM_ROW0,
        kw_TM_ROW1,
        kw_TM_ROW2,
        kw_TM_ROW3,
        kw_TM_POS,
        kw_TM_ROTAXIS,
        kw_TM_ROTANGLE,
        kw_TM_SCALE,
        kw_TM_SCALEAXIS,
        kw_TM_SCALEAXISANG,
      kw_MESH,
        kw_TIMEVALUE,
        kw_MESH_NUMVERTEX,
        kw_MESH_NUMFACES,
        kw_MESH_VERTEX_LIST,
          kw_MESH_VERTEX,
        kw_MESH_FACE_LIST,
          kw_MESH_FACE,
          kw_MESH_SMOOTHING,
          kw_MESH_MTLID,
        kw_MESH_NUMTVERTEX,
        kw_MESH_TVERTLIST,
          kw_MESH_TVERT,
        kw_MESH_NUMTVFACES,
        kw_MESH_TFACELIST,
          kw_MESH_TFACE,
        kw_MESH_NORMALS,
          kw_MESH_FACENORMAL,
          kw_MESH_VERTEXNORMAL,
    kw_PROP_MOTIONBLUR,
    kw_PROP_CASTSHADOW,
    kw_PROP_RECVSHADOW,
    kw_MATERIAL_REF
  );

  TKeyWordRec = record
    Str: WideString;
    Hash: Integer;
  end;

const
{$J+}
  // hash table for fast text processing
  // completed in implementation section
  KEY_WORDS: array[TKeyWord] of TKeyWordRec = (
    (Str: ''                         ),
    (Str: '*3DSMAX_ASCIIEXPORT'      ),
    (Str: '*COMMENT'                 ),
    (Str: '*SCENE'                   ),
    (Str: '*SCENE_FILENAME'          ),
    (Str: '*SCENE_FIRSTFRAME'        ),
    (Str: '*SCENE_LASTFRAME'         ),
    (Str: '*SCENE_FRAMESPEED'        ),
    (Str: '*SCENE_TICKSPERFRAME'     ),
    (Str: '*SCENE_BACKGROUND_STATIC' ),
    (Str: '*SCENE_AMBIENT_STATIC'    ),
    (Str: '*MATERIAL_LIST'           ),
    (Str: '*MATERIAL_COUNT'          ),
    (Str: '*MATERIAL'                ),
    (Str: '*MATERIAL_NAME'           ),
    (Str: '*MATERIAL_CLASS'          ),
    (Str: '*MATERIAL_AMBIENT'        ),
    (Str: '*MATERIAL_DIFFUSE'        ),
    (Str: '*MATERIAL_SPECULAR'       ),
    (Str: '*MATERIAL_SHINE'          ),
    (Str: '*MATERIAL_SHINESTRENGTH'  ),
    (Str: '*MATERIAL_TRANSPARENCY'   ),
    (Str: '*MATERIAL_WIRESIZE'       ),
    (Str: '*MATERIAL_SHADING'        ),
    (Str: '*MATERIAL_XP_FALLOFF'     ),
    (Str: '*MATERIAL_SELFILLUM'      ),
    (Str: '*MATERIAL_FALLOFF'        ),
    (Str: '*MATERIAL_XP_TYPE'        ),
    (Str: '*NUMSUBMTLS'              ),
    (Str: '*SUBMATERIAL'             ),
    (Str: '*MAP_DIFFUSE'             ),
    (Str: '*MAP_NAME'                ),
    (Str: '*MAP_CLASS'               ),
    (Str: '*MAP_SUBNO'               ),
    (Str: '*MAP_AMOUNT'              ),
    (Str: '*BITMAP'                  ),
    (Str: '*MAP_TYPE'                ),
    (Str: '*UVW_U_OFFSET'            ),
    (Str: '*UVW_V_OFFSET'            ),
    (Str: '*UVW_U_TILING'            ),
    (Str: '*UVW_V_TILING'            ),
    (Str: '*UVW_ANGLE'               ),
    (Str: '*UVW_BLUR'                ),
    (Str: '*UVW_BLUR_OFFSET'         ),
    (Str: '*UVW_NOUSE_AMT'           ),
    (Str: '*UVW_NOISE_SIZE'          ),
    (Str: '*UVW_NOISE_LEVEL'         ),
    (Str: '*UVW_NOISE_PHASE'         ),
    (Str: '*BITMAP_FILTER'           ),
    (Str: '*GEOMOBJECT'              ),
    (Str: '*NODE_NAME'               ),
    (Str: '*NODE_TM'                 ),
    (Str: '*INHERIT_POS'             ),
    (Str: '*INHERIT_ROT'             ),
    (Str: '*INHERIT_SCL'             ),
    (Str: '*TM_ROW0'                 ),
    (Str: '*TM_ROW1'                 ),
    (Str: '*TM_ROW2'                 ),
    (Str: '*TM_ROW3'                 ),
    (Str: '*TM_POS'                  ),
    (Str: '*TM_ROTAXIS'              ),
    (Str: '*TM_ROTANGLE'             ),
    (Str: '*TM_SCALE'                ),
    (Str: '*TM_SCALEAXIS'            ),
    (Str: '*TM_SCALEAXISANG'         ),
    (Str: '*MESH'                    ),
    (Str: '*TIMEVALUE'               ),
    (Str: '*MESH_NUMVERTEX'          ),
    (Str: '*MESH_NUMFACES'           ),
    (Str: '*MESH_VERTEX_LIST'        ),
    (Str: '*MESH_VERTEX'             ),
    (Str: '*MESH_FACE_LIST'          ),
    (Str: '*MESH_FACE'               ),
    (Str: '*MESH_SMOOTHING'          ),
    (Str: '*MESH_MTLID'              ),
    (Str: '*MESH_NUMTVERTEX'         ),
    (Str: '*MESH_TVERTLIST'          ),
    (Str: '*MESH_TVERT'              ),
    (Str: '*MESH_NUMTVFACES'         ),
    (Str: '*MESH_TFACELIST'          ),
    (Str: '*MESH_TFACE'              ),
    (Str: '*MESH_NORMALS'            ),
    (Str: '*MESH_FACENORMAL'         ),
    (Str: '*MESH_VERTEXNORMAL'       ),
    (Str: '*PROP_MOTIONBLUR'         ),
    (Str: '*PROP_CASTSHADOW'         ),
    (Str: '*PROP_RECVSHADOW'         ),
    (Str: '*MATERIAL_REF'            )
  );
{$J-}

type
  TAseLexer = class
  strict private
    procedure StringToKeyWord;
    procedure SkipBlanks; inline;
  private
    FAhead: Boolean;
    FASE: TextFile;
    FToken: TASEToken;

    FUseCommaToken: boolean;

    FC: PCHAR;
    FLine: WideString;
    FLineId: Integer;
    FString: WideString;
    FKeyWord: TKeyWord;
    FFormatSettings: TFormatSettings;

    function GetTokenFloat: Single;
    function GetTokenInteger: Integer;
  public
    constructor Create(const AFileName: WideString);
    destructor Destroy; override;

    function NextToken: TASEToken;
    procedure NextTokenExpected(AToken: TASEToken); inline;
    procedure TokenExpected(AToken: TASEToken);
    property Token: TASEToken read FToken;

    procedure SkipKeyWordBlock;

    property TokenKeyWord: TKeyWord read FKeyWord;
    property TokenString: WideString read FString;
    property TokenIdent: WideString read FString;
    property TokenFloat: Single read GetTokenFloat;
    property TokenInteger: Integer read GetTokenInteger;

    property Ahead: boolean read FAhead write FAhead;
    property UseCommaToken: boolean read FUseCommaToken write FUseCommaToken;
  end;

  EAseLexerError = class(Exception);

implementation

uses
  FMX_Consts;

{ TAseParser }

constructor TAseLexer.Create(const AFileName: WideString);
begin
  AssignFile(FASE, AFileName);
  Reset(FASE);
{$IFDEF FPC}
  FFormatSettings := DefaultFormatSettings;
{$ELSE}
  FFormatSettings := TFormatSettings.Create;
{$ENDIF}
end;

destructor TAseLexer.Destroy;
begin
  CloseFile(FAse);
  inherited;
end;

function TAseLexer.GetTokenFloat: Single;
begin
  Result := StrToFloat(FString, FFormatSettings);
end;

function TAseLexer.GetTokenInteger: Integer;
begin
  Result := StrToInt(FString);
end;

function TAseLexer.NextToken: TASEToken;
var
  LLine: AnsiString;
begin
  if FAhead then
  begin
    FAhead := False;
    Exit(FToken);
  end;

  if FToken = atEOF then
    Exit(atEOF);

  while True do
  begin
    if (FC = nil) or (FC^ = #0) then
    begin
      if EOF(FASE) then
      begin
        FToken := atEOF;
        Exit(atEOF);
      end;

      ReadLn(FASE, LLine);
      FLine := String(LLine);
      Inc(FLineId);
      if FLine = '' then
        Continue;
      FC := @FLine[1];
    end;
    //
    SkipBlanks;

    if FC^ <> #0 then
      Break;
  end;

  FToken := atUnknown;

  case FC^ of
    '*':
      begin
        FString := '*';
        Inc(FC);

        while AnsiChar(FC^) in ['A'..'Z', '_', '0'..'9'] do
        begin
          FString := FString + FC^;
          Inc(FC);
        end;

        FToken := atKeyWord;
        StringToKeyWord;
      end;
    '"':
      begin
        FString := '';
        Inc(FC);

        while not (AnsiChar(FC^) in [#13, #10, #0, '"']) do
        begin
          FString := FString + FC^;
          Inc(FC);
        end;

        if FC^ <> '"' then
          raise EAseLexerError.CreateResFmt(@SAseLexerCharError, [FLineId, '"', FC^])
        else
          Inc(FC);

        FToken := atString;
      end;
    '{':
      begin
        FToken := atOpenBracket;
        Inc(FC);
      end;
    '}':
      begin
        FToken := atCloseBracket;
        Inc(FC);
      end;
    ':':
      begin
        FToken := atColon;
        Inc(FC);
      end;
    'a'..'z', 'A'..'Z', '_':
      begin
        FString := FC^;
        Inc(FC);

        while AnsiChar(FC^) in ['A'..'Z', '_', '0'..'9', 'a'..'z'] do
        begin
          FString := FString + FC^;
          Inc(FC);
        end;

        FToken := atIdent;
      end;
    '-', '0'..'9':
      begin
        FString := FC^;
        Inc(FC);

        while AnsiChar(FC^) in ['0'..'9'] do
        begin
          FString := FString + FC^;
          Inc(FC);
        end;

        if (not FUseCommaToken and (AnsiChar(FC^) in ['.', ',']))
          or (AnsiChar(FC^) = '.') then
        begin
          FFormatSettings.DecimalSeparator := FC^;
          FString := FString + FC^;
          Inc(FC);
          while AnsiChar(FC^) in ['0'..'9'] do
          begin
            FString := FString + FC^;
            Inc(FC);
          end;
          FToken := atFloat;
        end
        else
          FToken := atInteger;
      end;
    ',':
      if FUseCommaToken then
      begin
        FToken := atComma;
        Inc(FC);
      end;
  end;

  Result := FToken;
end;

procedure TAseLexer.NextTokenExpected(AToken: TASEToken);
begin
  NextToken;
  TokenExpected(AToken);
end;

procedure TAseLexer.SkipBlanks;
begin
  while AnsiChar(FC^) in [#1..#32] do
    Inc(FC);
end;

procedure TAseLexer.SkipKeyWordBlock;
var
  LBracketCount: Integer;
begin
  Assert(Token = atKeyWord);

  if NextToken = atOpenBracket then
  begin
    LBracketCount := 1;
    repeat
      case NextToken of
        atOpenBracket: Inc(LBracketCount);
        atCloseBracket: Dec(LBracketCount);
        atEOF: Exit;
      end;
    until (Token = atEOF) or (LBracketCount = 0);
    // NextToken;
  end
  else
  begin
    while not (NextToken in [atKeyWord, atEOF, atCloseBracket]) do
    {none};

    FAhead := True;
  end;
end;

{$IFDEF FPC}

{ BobJenkinsHash }

function Rot(x, k: Cardinal): Cardinal; inline;
begin
  Result := (x shl k) or (x shr (32 - k));
end;

procedure Mix(var a, b, c: Cardinal); inline;
begin
  Dec(a, c); a := a xor Rot(c, 4); Inc(c, b);
  Dec(b, a); b := b xor Rot(a, 6); Inc(a, c);
  Dec(c, b); c := c xor Rot(b, 8); Inc(b, a);
  Dec(a, c); a := a xor Rot(c,16); Inc(c, b);
  Dec(b, a); b := b xor Rot(a,19); Inc(a, c);
  Dec(c, b); c := c xor Rot(b, 4); Inc(b, a);
end;

procedure Final(var a, b, c: Cardinal); inline;
begin
  c := c xor b; Dec(c, Rot(b,14));
  a := a xor c; Dec(a, Rot(c,11));
  b := b xor a; Dec(b, Rot(a,25));
  c := c xor b; Dec(c, Rot(b,16));
  a := a xor c; Dec(a, Rot(c, 4));
  b := b xor a; Dec(b, Rot(a,14));
  c := c xor b; Dec(c, Rot(b,24));
end;

type
  TCardinalArray = array[0..$FF] of Cardinal;
  TByteArray = array[0..$FF] of Byte;

function HashLittle(const Data; Len, InitVal: Integer): Integer;
var
  pb: ^TByteArray;
  pd: ^TCardinalArray absolute pb;
  a, b, c: Cardinal;
label
  case_1, case_2, case_3, case_4, case_5, case_6,
  case_7, case_8, case_9, case_10, case_11, case_12;
begin
  a := Cardinal($DEADBEEF) + Cardinal(Len shl 2) + Cardinal(InitVal);
  b := a;
  c := a;

  pb := @Data;

  // 4-byte aligned data
  if (Cardinal(pb) and 3) = 0 then
  begin
    while Len > 12 do
    begin
      Inc(a, pd[0]);
      Inc(b, pd[1]);
      Inc(c, pd[2]);
      Mix(a, b, c);
      Dec(Len, 12);
      Inc(pd, 3);
    end;

    case Len of
      0: Exit(Integer(c));
      1: Inc(a, pd[0] and $FF);
      2: Inc(a, pd[0] and $FFFF);
      3: Inc(a, pd[0] and $FFFFFF);
      4: Inc(a, pd[0]);
      5:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1] and $FF);
      end;
      6:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1] and $FFFF);
      end;
      7:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1] and $FFFFFF);
      end;
      8:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1]);
      end;
      9:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1]);
        Inc(c, pd[2] and $FF);
      end;
      10:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1]);
        Inc(c, pd[2] and $FFFF);
      end;
      11:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1]);
        Inc(c, pd[2] and $FFFFFF);
      end;
      12:
      begin
        Inc(a, pd[0]);
        Inc(b, pd[1]);
        Inc(c, pd[2]);
      end;
    end;
  end
  else
  begin
    // Ignoring rare case of 2-byte aligned data. This handles all other cases.
    while Len > 12 do
    begin
      Inc(a, pb[0] + pb[1] shl 8 + pb[2] shl 16 + pb[3] shl 24);
      Inc(b, pb[4] + pb[5] shl 8 + pb[6] shl 16 + pb[7] shl 24);
      Inc(c, pb[8] + pb[9] shl 8 + pb[10] shl 16 + pb[11] shl 24);
      Mix(a, b, c);
      Dec(Len, 12);
      Inc(pb, 12);
    end;

    case Len of
      0: Exit(c);
      1: goto case_1;
      2: goto case_2;
      3: goto case_3;
      4: goto case_4;
      5: goto case_5;
      6: goto case_6;
      7: goto case_7;
      8: goto case_8;
      9: goto case_9;
      10: goto case_10;
      11: goto case_11;
      12: goto case_12;
    end;

case_12:
    Inc(c, pb[11] shl 24);
case_11:
    Inc(c, pb[10] shl 16);
case_10:
    Inc(c, pb[9] shl 8);
case_9:
    Inc(c, pb[8]);
case_8:
    Inc(b, pb[7] shl 24);
case_7:
    Inc(b, pb[6] shl 16);
case_6:
    Inc(b, pb[5] shl 8);
case_5:
    Inc(b, pb[4]);
case_4:
    Inc(a, pb[3] shl 24);
case_3:
    Inc(a, pb[2] shl 16);
case_2:
    Inc(a, pb[1] shl 8);
case_1:
    Inc(a, pb[0]);
  end;

  Final(a, b, c);
  Result := Integer(c);
end;

function BobJenkinsHash(const Data; Len, InitData: Integer): Integer;
begin
  Result := HashLittle(Data, Len, InitData);
end;

{$ENDIF}

procedure TAseLexer.StringToKeyWord;
var
  kw: TKeyWord;
  LHash: Integer;
begin
  LHash := BobJenkinsHash(FString[1], Length(FString) * SizeOf(FString[1]), 2004);

  FKeyWord := kw_UNKNOWN;
  for kw := Succ(Low(TKeyWord)) to High(TKeyWord) do
    if KEY_WORDS[kw].Hash = LHash then
      if AnsiSameStr(FString, KEY_WORDS[kw].Str) then
      begin
        FKeyWord := kw;
        Exit;
      end;
end;

procedure TAseLexer.TokenExpected(AToken: TASEToken);
begin
  if FToken <> AToken then
    raise EAseLexerError.CreateResFmt(@SAseLexerTokenError, [FLineId,
        GetEnumName(TypeInfo(TASEToken), Integer(AToken)),
        GetEnumName(TypeInfo(TASEToken), Integer(FToken))]);
end;

procedure InitializeKeyWordsHash;
var
  kw: TKeyWord;
begin
  for kw := Succ(Low(TKeyWord)) to High(TKeyWord) do
    KEY_WORDS[kw].Hash := BobJenkinsHash(KEY_WORDS[kw].Str[1],
      Length(KEY_WORDS[kw].Str) * SizeOf(KEY_WORDS[kw].Str[1]), 2004);
end;

begin
  InitializeKeyWordsHash;
end.
