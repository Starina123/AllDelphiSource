{*******************************************************}
{                                                       }
{       Borland Delphi Sample                           }
{                                                       }
{       Copyright (c) 2001 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit DrawBtn;

interface

uses
  Windows, Messages, SysUtils, Classes;

function DrawButton(Params: TStrings; var ContentType: string): TStream;

const
  sTxt = 'Txt';
  sFontName = 'FontName';
  sFontSize = 'FontSize';
  sFontColor = 'FontColor';
  sColor = 'Color';
  sTLColor = 'TLColor';
  sBRColor = 'BRColor';
  sFocusColor = 'FocusColor';
  sWidth = 'Width';
  sHeight = 'Height';
  sUp = 'Up';
  sEnabled = 'Enabled';
  sFocused = 'Focused';
  sBackground = 'Background';
  sGlyph = 'Glyph';
  sFontBold = 'FontBold';
  sFontItalic = 'FontItalic';
  sFontUnderline = 'FontUnderline';
  sFontStrikeOut = 'FontStrikeOut';

implementation

uses
  ExtCtrls, StdCtrls, Controls, Forms, Graphics, JPEG;

function GetIntegerValue(const Value : String; Default : Integer) : Integer;
begin
  if Value = '' then
    Result := Default
  else
    try
      Result := StrToInt(Value);
    except
      Result := Default;
    end;
end;

function GetBooleanValue(const Value : String; Default : Boolean) : Boolean;
begin
  if Value = '' then
    Result := Default
  else
    try
      Result := StrToBool(Value);
    except
      Result := Default;
    end;
end;

function GetColorValue(const Value : String; Default : TColor) : TColor;
  function HTMLColor(const S : String) : String;
  begin
    if S = '' then
      Result := ''
    else
      if S[1] = '#' then
        Result := '$'+S[6]+S[7]+S[4]+S[5]+S[2]+S[3]
      else
        Result := S;
  end;
begin
  if Value = '' then
    Result := Default
  else
    try
      Result := StringToColor(HTMLColor(Value));
    except
      Result := Default;
    end;
end;

function DrawButton(Params: TStrings; var ContentType: string): TStream;
var
  Txt, FontName,
  Background, Glyph : String;
  FontColor, Color,
  TLColor, BRColor,
  FocusColor        : TColor;
  FontSize,
  ButtonWidth,
  ButtonHeight      : Integer;
  FontBold,
  FontItalic,
  FontUnderline,
  FontStrikeOut,
  Up, Enabled,
  Focused           : Boolean;
  Bitmap, BMP       : TBitmap;

begin
  // Get parameter values and set defaults if required
  with Params do begin
    Txt := Values[sTxt];
    FontName := Values[sFontName];
    FontSize := GetIntegerValue(Values[sFontSize],8);
    FontColor := GetColorValue(Values[sFontColor],clBlack);
    Color := GetColorValue(Values[sColor],clBtnFace);
    TLColor := GetColorValue(Values[sTLColor],clWhite);
    BRColor := GetColorValue(Values[sBRColor],clGray);
    FocusColor := GetColorValue(Values[sFocusColor],clYellow);
    ButtonWidth := GetIntegerValue(Values[sWidth],75);
    ButtonHeight := GetIntegerValue(Values[sHeight],25);
    Up := GetBooleanValue(Values[sUp],True);
    Enabled := GetBooleanValue(Values[sEnabled],True);
    Focused := GetBooleanValue(Values[sFocused],False);
    Background := Values[sBackground];
    Glyph := Values[sGlyph];
    FontBold := GetBooleanValue(Values[sFontBold],False);
    FontItalic := GetBooleanValue(Values[sFontItalic],False);
    FontUnderline := GetBooleanValue(Values[sFontUnderline],False);
    FontStrikeOut := GetBooleanValue(Values[sFontStrikeOut],False);
  end;

  Bitmap := TBitmap.Create;
  try
    with Bitmap do begin
      Width := ButtonWidth;
      Height := ButtonHeight;
      with Canvas do begin
        with Font do begin
          Name := FontName;
          Size := FontSize;
          Color := FontColor;
          Style := [];
          if FontBold then
            Style := Style+[fsBold];
          if FontItalic then
            Style := Style+[fsItalic];
          if FontUnderline then
            Style := Style+[fsUnderline];
          if FontStrikeOut then
            Style := Style+[fsStrikeOut];
        end;
        if not Enabled then begin
          // Draw the background area for the button
          Brush.Color := Color;
          FillRect(Rect(0,0,Width,Height));
          // Draw the background
{
          if Background <> '' then begin
            BMP := TBitmap.Create;
            BMP.LoadFromFile('buttons'+PathDelim+Background+'.bmp');
            StretchDraw(Rect(1,1,Width-2,Height-2),BMP);
            BMP.Free;
          end;
}
          // Draw the glyph
          if Glyph <> '' then begin
            BMP := TBitmap.Create;
            try
              BMP.LoadFromFile('buttons'+PathDelim+Glyph+'.bmp');
              BMP.Canvas.CopyRect(Rect(0,0,16,16),BMP.Canvas,Rect(16,0,32,16));
              BMP.Transparent := True;
              BMP.Width := 16;  // Clip off the disabled piece
              Draw(8,(Height div 2)-8,BMP);
            except
            end;
            BMP.Free;
          end;
          // Draw the left and top edges
          Brush.Color := TLColor;
          FrameRect(Rect(0,0,Width,1));
          FrameRect(Rect(0,1,Width-1,2));
          FrameRect(Rect(0,0,1,Height));
          FrameRect(Rect(1,0,2,Height-1));
          // Draw the right and bottom edges
          Brush.Color := BRColor;
          FrameRect(Rect(Width,0,Width,Height));
          FrameRect(Rect(Width-1,1,Width-1,Height));
          FrameRect(Rect(1,Height,Width,Height));
          FrameRect(Rect(2,Height-1,Width,Height-1));
          // Draw the caption
          Brush.Style := bsClear;
          Font.Color := clGray;
          TextOut((Width-Canvas.TextWidth(Txt)) div 2,(Height-Canvas.TextHeight(Txt)) div 2,Txt);
        end else
          if Up then begin
            // Draw the background area for the button
            Brush.Color := Color;
            FillRect(Rect(0,0,Width,Height));
            // Draw the background
            if Background <> '' then begin
              BMP := TBitmap.Create;
              try
                BMP.LoadFromFile('buttons'+PathDelim+Background+'.bmp');
                StretchDraw(Rect(1,1,Width-2,Height-2),BMP);
              except
              end;
              BMP.Free;
            end;
            // Draw the glyph
            if Glyph <> '' then begin
              BMP := TBitmap.Create;
              try
                BMP.LoadFromFile('buttons'+PathDelim+Glyph+'.bmp');
                BMP.Transparent := True;
                BMP.Width := 16;  // Clip off the disabled piece
                Draw(8,(Height div 2)-8,BMP);
              except
              end;
              BMP.Free;
            end;
            // Draw the left and top edges
            Brush.Color := TLColor;
            FrameRect(Rect(0,0,Width,1));
            FrameRect(Rect(0,1,Width-1,2));
            FrameRect(Rect(0,0,1,Height));
            FrameRect(Rect(1,0,2,Height-1));
            // Draw the right and bottom edges
            Brush.Color := BRColor;
            FrameRect(Rect(Width,0,Width,Height));
            FrameRect(Rect(Width-1,1,Width-1,Height));
            FrameRect(Rect(1,Height,Width,Height));
            FrameRect(Rect(2,Height-1,Width,Height-1));
            // Draw the caption
            Brush.Style := bsClear;
            TextOut((Width-Canvas.TextWidth(Txt)) div 2,(Height-Canvas.TextHeight(Txt)) div 2,Txt);
            // Draw the focus rect
            if Focused then begin
              Brush.Style := bsSolid;
              Brush.Color := FocusColor;
              FrameRect(Rect(0,0,Width,Height));
            end;
          end else begin
            // Draw the background area for the button
            Brush.Color := Color;
            FillRect(Rect(0,0,Width,Height));
            // Draw the background
            if Background <> '' then begin
              BMP := TBitmap.Create;
              try
                BMP.LoadFromFile('buttons'+PathDelim+Background+'.bmp');
                StretchDraw(Rect(2,2,Width-1,Height-1),BMP);
              except
              end;
              BMP.Free;
            end;
            // Draw the glyph
            if Glyph <> '' then begin
              BMP := TBitmap.Create;
              try
                BMP.LoadFromFile('buttons'+PathDelim+Glyph+'.bmp');
                BMP.Transparent := True;
                BMP.Width := 16;  // Clip off the
                Draw(9,(Height div 2)-7,BMP);
              except
              end;
              BMP.Free;
            end;
            // Draw the left and top edges
            Brush.Color := BRColor;
            FrameRect(Rect(0,0,Width,1));
            FrameRect(Rect(0,1,Width-1,2));
            FrameRect(Rect(0,0,1,Height));
            FrameRect(Rect(1,0,2,Height-1));
            // Draw the right and bottom edges
            Brush.Color := BRColor;
            FrameRect(Rect(Width,0,Width,Height));
            FrameRect(Rect(Width-1,1,Width-1,Height));
            FrameRect(Rect(1,Height,Width,Height));
            FrameRect(Rect(2,Height-1,Width,Height-1));
            // Draw the caption
            Brush.Style := bsClear;
            TextOut(((Width-Canvas.TextWidth(Txt)) div 2)+1,((Height-Canvas.TextHeight(Txt)) div 2)+1,Txt);
          end;
      end;
    end;
  except
    Bitmap.Free;
    raise;
  end;
  Result := TMemoryStream.Create;
  try
    with TJPEGImage.Create do begin
      try
        CompressionQuality := 100;
        Assign(Bitmap);
        SaveToStream(Result);
      finally
        Free;
      end;
    end;
  except
    Result.Free;
    raise;
  end;
  ContentType := 'image/jpeg';
end;

end.

