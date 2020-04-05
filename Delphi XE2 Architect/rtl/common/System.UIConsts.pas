{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.UIConsts;

interface

uses System.UITypes, System.Classes;

{ Cursor string functions }

function CursorToString(Cursor: TCursor): string;
function StringToCursor(const S: string): TCursor;
procedure GetCursorValues(const Proc: TGetStrProc);
function CursorToIdent(Cursor: Longint; var Ident: string): Boolean;
function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean;
procedure RegisterCursorIntegerConsts;

{ TColor string functions }

function ColorToString(Color: TColor): string;
function StringToColor(const S: string): TColor;
procedure GetColorValues(Proc: TGetStrProc);
function ColorToIdent(Color: Longint; var Ident: string): Boolean;
function IdentToColor(const Ident: string; var Color: Longint): Boolean;
procedure RegisterColorIntegerConsts;

{ TAlphaColor string functions }

procedure GetAlphaColorValues(Proc: TGetStrProc);
function AlphaColorToString(Value: TAlphaColor): string;
function StringToAlphaColor(const Value: string): TAlphaColor;
function AlphaColorToIdent(Color: Longint; var Ident: string): Boolean;
function IdentToAlphaColor(const Ident: string; var Color: Longint): Boolean;
procedure RegisterAlphaColorIntegerConsts;

implementation

uses System.SysUtils;

{ Cursor translation function }

const
  DeadCursors = 1;

const
  Cursors: array[0..21] of TIdentMapEntry = (
    (Value: crDefault;      Name: 'crDefault'),
    (Value: crArrow;        Name: 'crArrow'),
    (Value: crCross;        Name: 'crCross'),
    (Value: crIBeam;        Name: 'crIBeam'),
    (Value: crSizeNESW;     Name: 'crSizeNESW'),
    (Value: crSizeNS;       Name: 'crSizeNS'),
    (Value: crSizeNWSE;     Name: 'crSizeNWSE'),
    (Value: crSizeWE;       Name: 'crSizeWE'),
    (Value: crUpArrow;      Name: 'crUpArrow'),
    (Value: crHourGlass;    Name: 'crHourGlass'),
    (Value: crDrag;         Name: 'crDrag'),
    (Value: crNoDrop;       Name: 'crNoDrop'),
    (Value: crHSplit;       Name: 'crHSplit'),
    (Value: crVSplit;       Name: 'crVSplit'),
    (Value: crMultiDrag;    Name: 'crMultiDrag'),
    (Value: crSQLWait;      Name: 'crSQLWait'),
    (Value: crNo;           Name: 'crNo'),
    (Value: crAppStart;     Name: 'crAppStart'),
    (Value: crHelp;         Name: 'crHelp'),
    (Value: crHandPoint;    Name: 'crHandPoint'),
    (Value: crSizeAll;      Name: 'crSizeAll'),

    { Dead cursors }
    (Value: crSize;         Name: 'crSize'));

function CursorToString(Cursor: TCursor): string;
begin
  if not CursorToIdent(Cursor, Result) then
    FmtStr(Result, '%d', [Cursor]);
end;

function StringToCursor(const S: string): TCursor;
var
  L: Longint;
begin
  if not IdentToCursor(S, L) then L := StrToInt(S);
  Result := L;
end;

procedure GetCursorValues(const Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := Low(Cursors) to High(Cursors) - DeadCursors do Proc(Cursors[I].Name);
end;

function CursorToIdent(Cursor: Longint; var Ident: string): Boolean;
begin
  Result := IntToIdent(Cursor, Ident, Cursors);
end;

function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean;
begin
  Result := IdentToInt(Ident, Cursor, Cursors);
end;

procedure RegisterCursorIntegerConsts;
begin
  if not Assigned(FindIntToIdent(TypeInfo(TCursor))) then
    RegisterIntegerConsts(TypeInfo(TCursor), IdentToCursor, CursorToIdent);
end;

{ Color mapping routines }

const
  Colors: array[0..51] of TIdentMapEntry = (
    (Value: TColors.Black; Name: 'clBlack'),
    (Value: TColors.Maroon; Name: 'clMaroon'),
    (Value: TColors.Green; Name: 'clGreen'),
    (Value: TColors.Olive; Name: 'clOlive'),
    (Value: TColors.Navy; Name: 'clNavy'),
    (Value: TColors.Purple; Name: 'clPurple'),
    (Value: TColors.Teal; Name: 'clTeal'),
    (Value: TColors.Gray; Name: 'clGray'),
    (Value: TColors.Silver; Name: 'clSilver'),
    (Value: TColors.Red; Name: 'clRed'),
    (Value: TColors.Lime; Name: 'clLime'),
    (Value: TColors.Yellow; Name: 'clYellow'),
    (Value: TColors.Blue; Name: 'clBlue'),
    (Value: TColors.Fuchsia; Name: 'clFuchsia'),
    (Value: TColors.Aqua; Name: 'clAqua'),
    (Value: TColors.White; Name: 'clWhite'),

    (Value: TColors.MoneyGreen; Name: 'clMoneyGreen'),
    // Use LegacySkyBlue to maintain consistency in VCL colors
    (Value: TColors.LegacySkyBlue; Name: 'clSkyBlue'),
    (Value: TColors.Cream; Name: 'clCream'),
    (Value: TColors.MedGray; Name: 'clMedGray'),

    (Value: TColors.SysActiveBorder; Name: 'clActiveBorder'),
    (Value: TColors.SysActiveCaption; Name: 'clActiveCaption'),
    (Value: TColors.SysAppWorkSpace; Name: 'clAppWorkSpace'),
    (Value: TColors.SysBackground; Name: 'clBackground'),
    (Value: TColors.SysBtnFace; Name: 'clBtnFace'),
    (Value: TColors.SysBtnHighlight; Name: 'clBtnHighlight'),
    (Value: TColors.SysBtnShadow; Name: 'clBtnShadow'),
    (Value: TColors.SysBtnText; Name: 'clBtnText'),
    (Value: TColors.SysCaptionText; Name: 'clCaptionText'),
    (Value: TColors.SysDefault; Name: 'clDefault'),
    (Value: TColors.SysGradientActiveCaption; Name: 'clGradientActiveCaption'),
    (Value: TColors.SysGradientInactiveCaption; Name: 'clGradientInactiveCaption'),
    (Value: TColors.SysGrayText; Name: 'clGrayText'),
    (Value: TColors.SysHighlight; Name: 'clHighlight'),
    (Value: TColors.SysHighlightText; Name: 'clHighlightText'),
    (Value: TColors.SysHotLight; Name: 'clHotLight'),
    (Value: TColors.SysInactiveBorder; Name: 'clInactiveBorder'),
    (Value: TColors.SysInactiveCaption; Name: 'clInactiveCaption'),
    (Value: TColors.SysInactiveCaptionText; Name: 'clInactiveCaptionText'),
    (Value: TColors.SysInfoBk; Name: 'clInfoBk'),
    (Value: TColors.SysInfoText; Name: 'clInfoText'),
    (Value: TColors.SysMenu; Name: 'clMenu'),
    (Value: TColors.SysMenuBar; Name: 'clMenuBar'),
    (Value: TColors.SysMenuHighlight; Name: 'clMenuHighlight'),
    (Value: TColors.SysMenuText; Name: 'clMenuText'),
    (Value: TColors.SysNone; Name: 'clNone'),
    (Value: TColors.SysScrollBar; Name: 'clScrollBar'),
    (Value: TColors.Sys3DDkShadow; Name: 'cl3DDkShadow'),
    (Value: TColors.Sys3DLight; Name: 'cl3DLight'),
    (Value: TColors.SysWindow; Name: 'clWindow'),
    (Value: TColors.SysWindowFrame; Name: 'clWindowFrame'),
    (Value: TColors.SysWindowText; Name: 'clWindowText'));

function ColorToString(Color: TColor): string;
begin
  if not ColorToIdent(Color, Result) then
    FmtStr(Result, '%s%0.8x', [HexDisplayPrefix, Integer(Color)]);
end;

function StringToColor(const S: string): TColor;
var
  LColor: LongInt;
begin
  if not IdentToColor(S, LColor) then
    Result := TColor(StrToInt(S))
  else
    Result := TColor(LColor);
end;

procedure GetColorValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := Low(Colors) to High(Colors) do Proc(Colors[I].Name);
end;

function ColorToIdent(Color: Longint; var Ident: string): Boolean;
begin
  Result := IntToIdent(Color, Ident, Colors);
end;

function IdentToColor(const Ident: string; var Color: Longint): Boolean;
begin
  Result := IdentToInt(Ident, Color, Colors);
end;

procedure RegisterColorIntegerConsts;
begin
  if not Assigned(FindIntToIdent(TypeInfo(TColor))) then
    RegisterIntegerConsts(TypeInfo(TColor), IdentToColor, ColorToIdent);
end;

{ Colors ======================================================================== }

const
  AlphaColors: array [0..147] of TIdentMapEntry = (
    (Value: Integer($FFF0F8FF); Name: 'claAliceblue'),
    (Value: Integer($FFFAEBD7); Name: 'claAntiquewhite'),
    (Value: Integer($FF00FFFF); Name: 'claAqua'),
    (Value: Integer($FF7FFFD4); Name: 'claAquamarine'),
    (Value: Integer($FFF0FFFF); Name: 'claAzure'),
    (Value: Integer($FFF5F5DC); Name: 'claBeige'),
    (Value: Integer($FFFFE4C4); Name: 'claBisque'),
    (Value: Integer($FF000000); Name: 'claBlack';),
    (Value: Integer($FFFFEBCD); Name: 'claBlanchedalmond'),
    (Value: Integer($FF0000FF); Name: 'claBlue'),
    (Value: Integer($FF8A2BE2); Name: 'claBlueviolet'),
    (Value: Integer($FFA52A2A); Name: 'claBrown'),
    (Value: Integer($FFDEB887); Name: 'claBurlywood'),
    (Value: Integer($FF5F9EA0); Name: 'claCadetblue'),
    (Value: Integer($FF7FFF00); Name: 'claChartreuse'),
    (Value: Integer($FFD2691E); Name: 'claChocolate'),
    (Value: Integer($FFFF7F50); Name: 'claCoral'),
    (Value: Integer($FF6495ED); Name: 'claCornflowerblue'),
    (Value: Integer($FFFFF8DC); Name: 'claCornsilk'),
    (Value: Integer($FFDC143C); Name: 'claCrimson'),
    (Value: Integer($FF00FFFF); Name: 'claCyan'),
    (Value: Integer($FF00008B); Name: 'claDarkblue'),
    (Value: Integer($FF008B8B); Name: 'claDarkcyan'),
    (Value: Integer($FFB8860B); Name: 'claDarkgoldenrod'),
    (Value: Integer($FFA9A9A9); Name: 'claDarkgray'),
    (Value: Integer($FF006400); Name: 'claDarkgreen'),
    (Value: Integer($FFA9A9A9); Name: 'claDarkgrey'),
    (Value: Integer($FFBDB76B); Name: 'claDarkkhaki'),
    (Value: Integer($FF8B008B); Name: 'claDarkmagenta'),
    (Value: Integer($FF556B2F); Name: 'claDarkolivegreen'),
    (Value: Integer($FFFF8C00); Name: 'claDarkorange'),
    (Value: Integer($FF9932CC); Name: 'claDarkorchid'),
    (Value: Integer($FF8B0000); Name: 'claDarkred'),
    (Value: Integer($FFE9967A); Name: 'claDarksalmon'),
    (Value: Integer($FF8FBC8F); Name: 'claDarkseagreen'),
    (Value: Integer($FF483D8B); Name: 'claDarkslateblue'),
    (Value: Integer($FF2F4F4F); Name: 'claDarkslategray'),
    (Value: Integer($FF2F4F4F); Name: 'claDarkslategrey'),
    (Value: Integer($FF00CED1); Name: 'claDarkturquoise'),
    (Value: Integer($FF9400D3); Name: 'claDarkviolet'),
    (Value: Integer($FFFF1493); Name: 'claDeeppink'),
    (Value: Integer($FF00BFFF); Name: 'claDeepskyblue'),
    (Value: Integer($FF696969); Name: 'claDimgray'),
    (Value: Integer($FF696969); Name: 'claDimgrey'),
    (Value: Integer($FF1E90FF); Name: 'claDodgerblue'),
    (Value: Integer($FFB22222); Name: 'claFirebrick'),
    (Value: Integer($FFFFFAF0); Name: 'claFloralwhite'),
    (Value: Integer($FF228B22); Name: 'claForestgreen'),
    (Value: Integer($FFFF00FF); Name: 'claFuchsia'),
    (Value: Integer($FFDCDCDC); Name: 'claGainsboro'),
    (Value: Integer($FFF8F8FF); Name: 'claGhostwhite'),
    (Value: Integer($FFFFD700); Name: 'claGold'),
    (Value: Integer($FFDAA520); Name: 'claGoldenrod'),
    (Value: Integer($FF808080); Name: 'claGray'),
    (Value: Integer($FF008000); Name: 'claGreen'),
    (Value: Integer($FFADFF2F); Name: 'claGreenyellow'),
    (Value: Integer($FF808080); Name: 'claGrey'),
    (Value: Integer($FFF0FFF0); Name: 'claHoneydew'),
    (Value: Integer($FFFF69B4); Name: 'claHotpink'),
    (Value: Integer($FFCD5C5C); Name: 'claIndianred'),
    (Value: Integer($FF4B0082); Name: 'claIndigo'),
    (Value: Integer($FFFFFFF0); Name: 'claIvory'),
    (Value: Integer($FFF0E68C); Name: 'claKhaki'),
    (Value: Integer($FFE6E6FA); Name: 'claLavender'),
    (Value: Integer($FFFFF0F5); Name: 'claLavenderblush'),
    (Value: Integer($FF7CFC00); Name: 'claLawngreen'),
    (Value: Integer($FFFFFACD); Name: 'claLemonchiffon'),
    (Value: Integer($FFADD8E6); Name: 'claLightblue'),
    (Value: Integer($FFF08080); Name: 'claLightcoral'),
    (Value: Integer($FFE0FFFF); Name: 'claLightcyan'),
    (Value: Integer($FFFAFAD2); Name: 'claLightgoldenrodyellow'),
    (Value: Integer($FFD3D3D3); Name: 'claLightgray'),
    (Value: Integer($FF90EE90); Name: 'claLightgreen'),
    (Value: Integer($FFD3D3D3); Name: 'claLightgrey'),
    (Value: Integer($FFFFB6C1); Name: 'claLightpink'),
    (Value: Integer($FFFFA07A); Name: 'claLightsalmon'),
    (Value: Integer($FF20B2AA); Name: 'claLightseagreen'),
    (Value: Integer($FF87CEFA); Name: 'claLightskyblue'),
    (Value: Integer($FF778899); Name: 'claLightslategray'),
    (Value: Integer($FF778899); Name: 'claLightslategrey'),
    (Value: Integer($FFB0C4DE); Name: 'claLightsteelblue'),
    (Value: Integer($FFFFFFE0); Name: 'claLightyellow'),
    (Value: Integer($FF00FF00); Name: 'claLime'),
    (Value: Integer($FF32CD32); Name: 'claLimegreen'),
    (Value: Integer($FFFAF0E6); Name: 'claLinen'),
    (Value: Integer($FFFF00FF); Name: 'claMagenta'),
    (Value: Integer($FF800000); Name: 'claMaroon'),
    (Value: Integer($FF66CDAA); Name: 'claMediumaquamarine'),
    (Value: Integer($FF0000CD); Name: 'claMediumblue'),
    (Value: Integer($FFBA55D3); Name: 'claMediumorchid'),
    (Value: Integer($FF9370DB); Name: 'claMediumpurple'),
    (Value: Integer($FF3CB371); Name: 'claMediumseagreen'),
    (Value: Integer($FF7B68EE); Name: 'claMediumslateblue'),
    (Value: Integer($FF00FA9A); Name: 'claMediumspringgreen'),
    (Value: Integer($FF48D1CC); Name: 'claMediumturquoise'),
    (Value: Integer($FFC71585); Name: 'claMediumvioletred'),
    (Value: Integer($FF191970); Name: 'claMidnightblue'),
    (Value: Integer($FFF5FFFA); Name: 'claMintcream'),
    (Value: Integer($FFFFE4E1); Name: 'claMistyrose'),
    (Value: Integer($FFFFE4B5); Name: 'claMoccasin'),
    (Value: Integer($FFFFDEAD); Name: 'claNavajowhite'),
    (Value: Integer($FF000080); Name: 'claNavy'),
    (Value: Integer($FFFDF5E6); Name: 'claOldlace'),
    (Value: Integer($FF808000); Name: 'claOlive'),
    (Value: Integer($FF6B8E23); Name: 'claOlivedrab'),
    (Value: Integer($FFFFA500); Name: 'claOrange'),
    (Value: Integer($FFFF4500); Name: 'claOrangered'),
    (Value: Integer($FFDA70D6); Name: 'claOrchid'),
    (Value: Integer($FFEEE8AA); Name: 'claPalegoldenrod'),
    (Value: Integer($FF98FB98); Name: 'claPalegreen'),
    (Value: Integer($FFAFEEEE); Name: 'claPaleturquoise'),
    (Value: Integer($FFDB7093); Name: 'claPalevioletred'),
    (Value: Integer($FFFFEFD5); Name: 'claPapayawhip'),
    (Value: Integer($FFFFDAB9); Name: 'claPeachpuff'),
    (Value: Integer($FFCD853F); Name: 'claPeru'),
    (Value: Integer($FFFFC0CB); Name: 'claPink'),
    (Value: Integer($FFDDA0DD); Name: 'claPlum'),
    (Value: Integer($FFB0E0E6); Name: 'claPowderblue'),
    (Value: Integer($FF800080); Name: 'claPurple'),
    (Value: Integer($FFFF0000); Name: 'claRed'),
    (Value: Integer($FFBC8F8F); Name: 'claRosybrown'),
    (Value: Integer($FF4169E1); Name: 'claRoyalblue'),
    (Value: Integer($FF8B4513); Name: 'claSaddlebrown'),
    (Value: Integer($FFFA8072); Name: 'claSalmon'),
    (Value: Integer($FFF4A460); Name: 'claSandybrown'),
    (Value: Integer($FF2E8B57); Name: 'claSeagreen'),
    (Value: Integer($FFFFF5EE); Name: 'claSeashell'),
    (Value: Integer($FFA0522D); Name: 'claSienna'),
    (Value: Integer($FFC0C0C0); Name: 'claSilver'),
    (Value: Integer($FF87CEEB); Name: 'claSkyblue'),
    (Value: Integer($FF6A5ACD); Name: 'claSlateblue'),
    (Value: Integer($FF708090); Name: 'claSlategray'),
    (Value: Integer($FF708090); Name: 'claSlategrey'),
    (Value: Integer($FFFFFAFA); Name: 'claSnow'),
    (Value: Integer($FF00FF7F); Name: 'claSpringgreen'),
    (Value: Integer($FF4682B4); Name: 'claSteelblue'),
    (Value: Integer($FFD2B48C); Name: 'claTan'),
    (Value: Integer($FF008080); Name: 'claTeal'),
    (Value: Integer($FFD8BFD8); Name: 'claThistle'),
    (Value: Integer($FFFF6347); Name: 'claTomato'),
    (Value: Integer($FF40E0D0); Name: 'claTurquoise'),
    (Value: Integer($FFEE82EE); Name: 'claViolet'),
    (Value: Integer($FFF5DEB3); Name: 'claWheat'),
    (Value: Integer($FFFFFFFF); Name: 'claWhite'),
    (Value: Integer($FFF5F5F5); Name: 'claWhitesmoke'),
    (Value: Integer($FFFFFF00); Name: 'claYellow'),
    (Value: Integer($FF9ACD32); Name: 'claYellowgreen'),
    (Value: Integer($0); Name: 'claNull')
  );

{ TAlphaColor string functions }

procedure GetAlphaColorValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := Low(AlphaColors) to High(AlphaColors) do
    Proc(AlphaColorToString(TAlphaColor(AlphaColors[I].Value)));
end;

function AlphaColorToString(Value: TAlphaColor): string;
begin
  AlphaColorToIdent(Longint(Value), Result);
  if Result[1] = 'x' then
    Result[1] := '#'
  else
    Delete(Result, 1, 3);
end;

function StringToAlphaColor(const Value: string): TAlphaColor;
var
  LValue: string;
  LColor: Longint;
begin
  LValue := Value;
  if LValue = #0 then
    LValue := '$0'
  else if (LValue <> '') and ((LValue[1] = '#') or (LValue[1] = 'x')) then
    LValue[1] := '$';

  if (not IdentToAlphaColor('cla' + LValue, LColor)) and (not IdentToAlphaColor(LValue, LColor)) then
    Result := TAlphaColor(StrToInt64(LValue))
  else
    Result := TAlphaColor(LColor);
end;

function AlphaColorToIdent(Color: Longint; var Ident: string): Boolean;
begin
  Result := IntToIdent(Color, Ident, AlphaColors);
  if not Result then
  begin
    Ident := 'x' + IntToHex(Color, 8);
    Result := True;
  end;
end;

function IdentToAlphaColor(const Ident: string; var Color: Longint): Boolean;
var
  LIdent: string;
begin
  LIdent := Ident;
  if (Length(LIdent) > 0) and (LIdent[1] = 'x') then
  begin
    Color := Longint(StringToAlphaColor(LIdent));
    Result := True;
  end else
    Result := IdentToInt(LIdent, Color, AlphaColors);
  // Allow "clXXXX" constants and convert it to TAlphaColor
  if not Result and (Length(LIdent) > 3) then
  begin
    Insert('a', LIdent, 3);
    Result := IdentToInt(LIdent, Longint(Color), AlphaColors);
  end;
end;

procedure RegisterAlphaColorIntegerConsts;
begin
  if not Assigned(FindIntToIdent(TypeInfo(TAlphaColor))) then
    RegisterIntegerConsts(TypeInfo(TAlphaColor), IdentToAlphaColor, AlphaColorToIdent);
end;

end.
