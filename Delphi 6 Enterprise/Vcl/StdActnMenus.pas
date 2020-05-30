
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1995-2001 Borland Software Corporation }
{                                                       }
{*******************************************************}

unit StdActnMenus;

interface

uses Windows, Messages, Classes, Controls, Graphics, Buttons, ActnMenus;

type

{ TStandardMenuItem }

  TStandardMenuItem = class(TCustomMenuItem)
  protected
    procedure DrawBackground(var PaintRect: TRect); override;
    procedure DrawGlyph(const Location: TPoint); override;
    procedure DrawSeparator(const Offset: Integer); override;
    procedure DrawText(var Rect: TRect; var Flags: Cardinal; Text: String); override;
  end;

{ TStandardMenuButton }

  TStandardMenuButton = class(TCustomMenuButton);

{ TStarndardMenuPopup }

  TStandardMenuPopup = class(TCustomActionPopupMenu)
  protected
    procedure NCPaint(DC: HDC); override;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize);
      message WM_NCCALCSIZE;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TStandardAddRemoveItem }

  TStandardAddRemoveItem = class(TCustomAddRemoveItem)
  protected
    procedure DrawBackground(var PaintRect: TRect); override;
    procedure DrawGlyph(const Location: TPoint); override;
    procedure DrawText(var Rect: TRect; var Flags: Cardinal; Text: String); override;
  end;

{ TStandardCustomizePopup }

  TStandardCustomizePopup = class(TCustomizeActionToolBar)
  public
    constructor Create(AOwner: TComponent); override;
  end;

procedure RegisterStandardMenus;

implementation

uses Menus, ActnList, ToolWin, GraphUtil;

const
  FillStyles: array[Boolean] of Integer = (BF_MIDDLE, 0);
  FrameStyle: array[Boolean] of Integer = (BDR_RAISEDINNER, BDR_SUNKENOUTER);
  EdgesOffset: array[Boolean] of Integer = (0, 1);

{ TStandardMenuItem }

procedure TStandardMenuItem.DrawSeparator(const Offset: Integer);
begin
  inherited DrawSeparator(13);
end;

procedure TStandardMenuItem.DrawBackground(var PaintRect: TRect);
begin
  if ActionClient = nil then exit;

  // TODO -oSDT: Need to check BiDi flags here to determine the size of the rect
  if ((Selected and Enabled) or (Selected and not MouseSelected)) and
     not ActionBar.DesignMode then
  begin
    Canvas.Brush.Color := clHighlight;
    if ActionClient.HasGlyph or IsChecked then
      Inc(PaintRect.Left, 21)
    else
      Inc(PaintRect.Left);
    Dec(PaintRect.Right, 2);
  end
  else
    if ActionClient.Unused or ActionClient.Separator and
       ((ActionClient.Index > 0) and
        ActionClient.ActionClients[ActionClient.Index - 1].Unused) and
       ((ActionClient.Index < ActionClient.Collection.Count - 1) and
        ActionClient.ActionClients[ActionClient.Index + 1].Unused) then
      Canvas.Brush.Color := GetHighLightColor(Color)
    else
      Canvas.Brush.Color := clMenu;
  inherited DrawBackground(PaintRect);
end;

procedure TStandardMenuItem.DrawGlyph(const Location: TPoint);
var
  FrameRect: TRect;
begin
  if (HasGlyph and ActionClient.ShowGlyph) or IsChecked then
  begin
    FrameRect := Rect(Location.X - 1, 0, Location.X + 18, Self.Height);
    if ((Selected and Enabled) or (Selected and not MouseSelected)) or IsChecked then
    begin
      Inc(FrameRect.Top, EdgesOffset[ebTop in Edges]);
      Dec(FrameRect.Bottom, EdgesOffset[ebBottom in Edges]);
//      if not (csDesigning in ComponentState) then
      Windows.DrawEdge(Canvas.Handle, FrameRect, FrameStyle[IsChecked],
        FillStyles[Transparent] or BF_RECT);
      if not Transparent then
      begin
        if not Selected and IsChecked then
          Canvas.Brush.Bitmap := AllocPatternBitmap(Color, GetHighLightColor(Color))
        else
          if ActionClient.Unused then
            Canvas.Brush.Color := GetHighLightColor(Color)
          else
            Canvas.Brush.Color := Color;
        InflateRect(FrameRect, -1, -1);
        Canvas.FillRect(FrameRect);
      end;
    end;
  end;
  if not HasGlyph and IsChecked then
  begin
    Canvas.Pen.Color := clBlack;
    DrawCheck(Canvas, Point(Location.X + 4, Location.Y + 4), 2);
  end;
  inherited DrawGlyph(Location);
end;

procedure TStandardMenuItem.DrawText(var Rect: TRect; var Flags: Cardinal;
  Text: String);
begin
  if Enabled or (csDesigning in ComponentState) then
  begin
    if Selected then
      Canvas.Font.Color := clHighlightText
    else
      Canvas.Font.Color := clMenuText;
    inherited DrawText(Rect, Flags, Text)
  end
  else
  begin
    Canvas.Brush.Style := bsClear;
    if not Selected or (csDesigning in ComponentState) then
    begin
      OffsetRect(Rect, 1, 1);
      Canvas.Font.Color := clWhite;
      Windows.DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
      OffsetRect(Rect, -1, -1);
    end;
    Canvas.Font.Color := clGrayText;
    Windows.DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
  end;
end;

{ TStandardMenuPopup }

constructor TStandardMenuPopup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ParentColor := False;
  Color := clMenu;
end;

procedure TStandardMenuPopup.NCPaint(DC: HDC);
const
  InnerStyles: array[TEdgeStyle] of Integer = (0, BDR_RAISEDINNER, BDR_SUNKENINNER);
  OuterStyles: array[TEdgeStyle] of Integer = (0, BDR_RAISEDOUTER, BDR_SUNKENOUTER);
  Ctl3DStyles: array[Boolean] of Integer = (BF_MONO, 0);
var
  RC, RW: TRect;
  EdgeBdrs: TEdgeBorders;
  EdgeStyle: Integer;
begin
  Windows.GetClientRect(Handle, RC);
  GetWindowRect(Handle, RW);
  MapWindowPoints(0, Handle, RW, 2);
  OffsetRect(RC, -RW.Left, -RW.Top);
  ExcludeClipRect(DC, RC.Left, RC.Top, RC.Right, RC.Bottom);
  { Draw borders in non-client area }
  OffsetRect(RW, -RW.Left, -RW.Top);
  if Expanded and ActionClient.Items.HideUnused then
  begin
    EdgeBdrs := [ebTop, ebLeft];
    DrawEdge(DC, RW, InnerStyles[EdgeInner] or OuterStyles[EdgeOuter],
      Byte(EdgeBdrs) or Ctl3DStyles[Ctl3D] or BF_ADJUST);
    if (FindLastVisibleItem <> nil) and not FindLastVisibleItem.Unused then
      EdgeStyle := BDR_RAISEDINNER
    else
      EdgeStyle := 0;
    EdgeBdrs := [ebBottom];
    DrawEdge(DC, RW, EdgeStyle or OuterStyles[EdgeOuter],
      Byte(EdgeBdrs) or Ctl3DStyles[Ctl3D] or BF_ADJUST);
    EdgeBdrs := [ebRight];
    DrawEdge(DC, RW, OuterStyles[EdgeOuter],
      Byte(EdgeBdrs) or Ctl3DStyles[Ctl3D] or BF_ADJUST)
  end
  else
    DrawEdge(DC, RW, InnerStyles[EdgeInner] or OuterStyles[EdgeOuter],
      Byte(EdgeBorders) or Ctl3DStyles[Ctl3D] or BF_ADJUST);
  { Erase parts not drawn }
  IntersectClipRect(DC, RW.Left, RW.Top, RW.Right, RW.Bottom);
  Windows.FillRect(DC, RW, Brush.Handle);
end;

procedure TStandardMenuPopup.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  Message.Result := WVR_VALIDRECTS;
  if Expanded then
    Inc(Message.CalcSize_Params^.rgrc[0].Right);
end;

{ TStandardAddRemoveItem }

procedure TStandardAddRemoveItem.DrawGlyph(const Location: TPoint);
var
  FrameRect: TRect;
begin
  if HasGlyph then
  begin
    FrameRect := Rect(Location.X - 1, 0, Location.X + 18, Self.Height);
    if ((Selected and Enabled) or (Selected and not MouseSelected)) or IsChecked then
    begin
      Inc(FrameRect.Top, EdgesOffset[ebTop in Edges]);
      Dec(FrameRect.Bottom, EdgesOffset[ebBottom in Edges]);
      if not (csDesigning in ComponentState) then
        Windows.DrawEdge(Canvas.Handle, FrameRect, FrameStyle[IsChecked],
          FillStyles[Transparent] or BF_RECT);
      if not Transparent then
      begin
        if not Selected then
          Canvas.Brush.Bitmap := AllocPatternBitmap(Color, GetHighLightColor(Color))
        else
          Canvas.Brush.Color := Color;
        InflateRect(FrameRect, -1, -1);
        Canvas.FillRect(FrameRect);
      end;
    end;
  end;
  if not HasGlyph and IsChecked then
  begin
    Canvas.Pen.Color := clBlack;
    DrawCheck(Canvas, Point(Location.X + 4, Location.Y + 4), 2);
  end;
  inherited DrawGlyph(Location);
  if Menu.RootMenu.ParentControl.ActionBar.ActionClient.Items[ActionClient.Index].Visible then
  begin
    FrameRect := Rect(2 - 1, 0, 18, Self.Height);
    Inc(FrameRect.Top, EdgesOffset[ebTop in Edges]);
    Dec(FrameRect.Bottom, EdgesOffset[ebBottom in Edges]);
    if not (csDesigning in ComponentState) then
      Windows.DrawEdge(Canvas.Handle, FrameRect, FrameStyle[True],
        FillStyles[False] or BF_RECT);
    if not Transparent then
    begin
      if not Selected then
        Canvas.Brush.Bitmap := AllocPatternBitmap(Color, GetHighLightColor(Color))
      else
        Canvas.Brush.Color := GetHighLightColor(Color);
      InflateRect(FrameRect, -1, -1);
      Canvas.FillRect(FrameRect);
    end;
    DrawCheck(Canvas, Point(6, Height div 2 + 1), 2, True);
  end;
end;

procedure TStandardAddRemoveItem.DrawBackground(var PaintRect: TRect);
begin
  if ActionClient = nil then exit;

  // TODO -oSDT: Need to check BiDi flags here to determine the size of the rect
  if ((Selected and Enabled) or (Selected and not MouseSelected)) and
     not ActionBar.DesignMode then
  begin
    Canvas.Brush.Color := clHighlight;
    if ActionClient.HasGlyph or IsChecked then
      Inc(PaintRect.Left, 22)
    else
      Inc(PaintRect.Left);
    Dec(PaintRect.Right, 2);
  end
  else
    Canvas.Brush.Color := clMenu;
  inherited DrawBackground(PaintRect);
end;

procedure TStandardAddRemoveItem.DrawText(var Rect: TRect; var Flags: Cardinal;
  Text: String);
begin
  if Selected then
    Canvas.Font.Color := clHighlightText
  else
    Canvas.Font.Color := clMenuText;
  inherited DrawText(Rect, Flags, Text)
end;

{ TStandardCustomizePopup }

constructor TStandardCustomizePopup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ParentColor := False;
  Color := clMenu;
end;

procedure RegisterStandardMenus;
begin
  MenuItemControlClass := TStandardMenuItem;
  MenuAddRemoveItemClass := TStandardAddRemoveItem;
  MenuButtonControlClass := TStandardMenuButton;
  MenuPopupClass := TStandardMenuPopup;
  MenuCustomizePopupClass := TStandardCustomizePopup;
end;

initialization
  RegisterStandardMenus;
end.
