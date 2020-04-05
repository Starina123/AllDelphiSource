{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_TabControl;

{$I FMX_Defines.inc}

interface

uses
  Classes, UITypes, FMX_Types, FMX_Controls;

type

{ TTabItem }

  TTabItem = class(TTextControl)
  private
    FIndex: Integer;
    FContent: TContent;
    FIsSelected: Boolean;
    procedure SetIndex(const Value: Integer);
  protected
    procedure ApplyStyle; override;
    procedure SetVisible(const Value: Boolean); override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure Realign; override;
    procedure Select(ASelected: Boolean);
  published
    { trigger }
    property IsSelected: Boolean read FIsSelected;
    { props }
    property AutoTranslate default True;
    property Font;
    property Index: Integer read FIndex write SetIndex;
    property TextAlign default TTextAlign.taLeading;
    property VertTextAlign;
    property Text;
    property StyleLookup;
    property WordWrap default True;
  end;

{ TTabControl }

  TTabControl = class(TStyledControl, IItemsContainer)
  private
    FTabIndex: Integer;
    FOnChange: TNotifyEvent;
    FTabHeight: Single;
    FFullSize: Boolean;
    FBackground: TControl;
    procedure SetTabIndex(const Value: integer);
    procedure SetTabHeight(const Value: Single);
    procedure SetFullSize(const Value: Boolean);
    procedure FixTabSize;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetActiveTab: TTabItem;
    procedure SetActiveTab(const Value: TTabItem);
  protected
    function GetTabItem(AIndex: Integer): TTabItem;
    function GetTabCount: Integer;
    procedure Resize; virtual;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure PaintChildren; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    property TabCount: Integer read GetTabCount;
    property Tabs[AIndex: Integer]: TTabItem read GetTabItem;
    property ActiveTab: TTabItem read GetActiveTab write SetActiveTab;
  published
    property StyleLookup;
    property FullSize: Boolean read FFullSize write SetFullSize default False;
    property TabIndex: Integer read FTabIndex write SetTabIndex default -1;
    property TabHeight: Single read FTabHeight write SetTabHeight;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

uses
  Types, FMX_Ani, FMX_Layouts;

type
  THackTabItem = class(TTabItem);

{ TTabItem }

constructor TTabItem.Create(AOwner: TComponent);
begin
  inherited;
  FContent := TContent.Create(nil);
  FContent.Parent := Self;
  FContent.Locked := True;
  FContent.Stored := False;
  FContent.HitTest := False;
  FContent.Visible := False;
  FDesignInteractive := True;
  FAutoTranslate := True;
  TextAlign := TTextAlign.taLeading;
  Height := 20;
  Width := 80;
  HitTest := True;
end;

procedure TTabItem.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject <> FContent) and (AObject <> FResourceLink) then
    FContent.AddObject(AObject)
  else
    inherited;
end;

procedure TTabItem.ApplyStyle;
begin
  inherited;
  if (Parent <> nil) and (Parent is TTabControl) and
    (TTabControl(Parent).TabIndex = Index) then
    Select(True)
  else
    Select(False)
end;

destructor TTabItem.Destroy;
begin
  inherited;
end;

procedure TTabItem.Realign;
var
  P: TPointF;
  S: TPointF;
begin
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  try
    if (FContent <> nil) and (Parent <> nil) and (Parent is TTabControl) then
    begin
      P.X := TTabControl(Parent).Margins.Left + FContent.Padding.Left;
      P.Y := Self.Height + TTabControl(Parent).Margins.Top + FContent.Padding.Top;

      P := AbsoluteToLocal(TTabControl(Parent).LocalToAbsolute(P));

      S.X := TTabControl(Parent).Width - TTabControl(Parent).Margins.Left - TTabControl(Parent).Margins.Right - FContent.Padding.Left -
        FContent.Padding.Right;
      S.Y := TTabControl(Parent).Height - Self.Height -
        TTabControl(Parent).Margins.Top - TTabControl(Parent).Margins.Bottom -
        FContent.Padding.Top - FContent.Padding.Bottom;
      FContent.SetBounds(P.X, P.Y, S.X, S.Y);
    end;
  finally
    FDisableAlign := False;
  end;
  inherited;
end;

procedure TTabItem.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    if (Parent <> nil) and (Parent is TTabControl) then
    begin
      TTabControl(Parent).TabIndex := Index;
    end;
  end;
end;

procedure TTabItem.Select(ASelected: Boolean);
begin
  FIsSelected := ASelected;
  StartTriggerAnimation(Self, 'IsSelected');
  ApplyTriggerEffect(Self, 'IsSelected');
end;

procedure TTabItem.SetIndex(const Value: Integer);
begin
  if FIndex <> Value then
  begin
    inherited Index := Value;
    Realign;
  end;
end;

procedure TTabItem.SetVisible(const Value: Boolean);
var
  S: TTabItem;
begin
  if Value <> Visible then
  begin
    S := TTabControl(Parent).GetTabItem(TTabControl(Parent).TabIndex);
    inherited;
    if not Visible and IsSelected then
    begin
      Select(False);
      TTabControl(Parent).FTabIndex := -1;
      if Index >= TTabControl(Parent).TabCount then
        TTabControl(Parent).TabIndex := TTabControl(Parent).TabCount - 1
      else
        TTabControl(Parent).TabIndex := Index;
    end
    else
    begin
      TTabControl(Parent).Realign;
      if S <> nil then
      begin
        TTabControl(Parent).FTabIndex := -1;
        TTabControl(Parent).TabIndex := S.Index;
      end;
    end;
  end;
end;

procedure TTabItem.Resize;
begin
  inherited ;

  if Assigned(Parent) then
  begin
    TTabControl(Parent).Realign;
    TTabControl(Parent).FixTabSize;
  end;
end;

{ TTabControl }

constructor TTabControl.Create(AOwner: TComponent);
begin
  inherited;
  FTabIndex := -1;
  AutoCapture := True;
  Width := 200;
  Height := 200;
  FTabHeight:= 20;
  SetAcceptsControls(False);
end;

destructor TTabControl.Destroy;
begin
  inherited;
end;

procedure TTabControl.FixTabSize;
var
  AWidth, AutoWidth, MinWidth: Single;
  i: integer;
  fitWidth: Single;
  bChanged: boolean;
begin
  bChanged := False;
  // check for total width larger than the client area of the component
  AutoWidth := 0;
  for i := 0 to TabCount - 1 do
    AutoWidth := AutoWidth + Tabs[i].Width;

  if AutoWidth > Width then
  begin
    AutoWidth := Width;
    AWidth := AutoWidth / TabCount;
    MinWidth := Canvas.TextWidth('X...');
    if AWidth < MinWidth then
      AWidth := MinWidth;
    for i := 0 to TabCount - 1 do
      Tabs[i].Width := AWidth;
    bChanged := True;
  end;

  if bChanged then Realign;
end;

procedure TTabControl.FreeStyle;
begin
  inherited;
  FBackground := nil;
end;

function TTabControl.GetActiveTab: TTabItem;
begin
  if (TabIndex >= 0) and (TabIndex < TabCount) then
    Result := Tabs[TabIndex]
  else
    Result := nil;
end;

function TTabControl.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Tabs[AIndex];
end;

function TTabControl.GetItemsCount: Integer;
begin
  Result := TabCount;
end;

procedure TTabControl.AddObject(AObject: TFmxObject);
begin
  if (AObject <> FResourceLink) and not (AObject is TEffect) and not(AObject is TAnimation) and
     not (AObject is TTabItem) and (ActiveTab <> nil) then
  begin
    ActiveTab.AddObject(AObject);
  end
  else
    inherited;

  if AObject is TTabItem then
  begin
    Realign;
    // ensures all tabs are resized to the dimension of their text width
    FixTabSize;
  end;
end;

procedure TTabControl.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('background');
  if (B <> nil) and (B is TControl) then
    FBackground := TControl(B);
  Realign;
end;

procedure TTabControl.PaintChildren;
var
  Sel: TTabItem;
  SaveOp: Single;
begin
  Sel := GetTabItem(TabIndex);
  if (Sel <> nil) and (Sel.Visible) then
  begin
    SaveOp := Sel.Opacity;
    Sel.FDisablePaint := True;
    inherited;
    Sel.FDisablePaint := False;

    Canvas.SetMatrix(Sel.AbsoluteMatrix);
    Sel.Painting;
    Sel.Paint;
    Sel.PaintChildren;
  end
  else
    inherited;
end;

procedure TTabControl.Realign;
var
  Idx, i: Integer;
  CurX, CurY: Single;
  AutoWidth, MaxHeight: Single;
  B: TFmxObject;
begin
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  try
    { move all non TabItem to end of list }
    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
        if not(TFmxObject(FChildren[i]) is TTabItem) then
          TFmxObject(FChildren[i]).Index := FChildren.Count - 1;
    { calc max height }
    MaxHeight := 0;
    Idx := 0;
    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
        if TFmxObject(FChildren[i]) is TTabItem then
          with TTabItem(FChildren[i]) do
          begin
            if not Visible then
              Continue;
            FIndex := Idx;
            if Height + Padding.top + Padding.bottom > MaxHeight then
              MaxHeight := Height + Padding.top + Padding.bottom;
            Idx := Idx + 1;
          end;
    if Idx = 0 then
      MaxHeight := 0
    else if FTabHeight > 0 then
      MaxHeight := FTabHeight;
    { background }
    if FResourceLink <> nil then
    begin
      B := FResourceLink;
      if (B <> nil) and (B is TControl) then
        begin
          TControl(B).Align := TAlignLayout.alNone;
          TControl(B).SetBounds(TControl(B).Padding.left, MaxHeight + TControl(B).Padding.top,
            Width - TControl(B).Padding.left - TControl(B).Padding.top,
            Height - MaxHeight - TControl(B).Padding.top - TControl(B).Padding.bottom);
          TControl(B).BringToFront;
        end;
    end;
    { align }
    CurX := 0;
    CurY := 0;
    AutoWidth:= Width;
    if FBackground <> nil then
      AutoWidth := Width - FBackground.Margins.left - FBackground.Margins.right;
    if FFullSize and (Idx > 0) then
      AutoWidth := AutoWidth / Idx
    else
      AutoWidth := AutoWidth;

    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
        if TFmxObject(FChildren[i]) is TTabItem then
          with TTabItem(FChildren[i]) do
          begin
            if not Visible then
              Continue;
            Align := TAlignLayout.alNone;

            FContent.Align := TAlignLayout.alNone;
            FContent.Visible := Index = TabIndex;
            FContent.DesignVisible := (Index = TabIndex);
            FContent.ClipChildren := True;
            if FContent.Visible then
              FContent.BringToFront;

            if FFullSize then
              SetBounds(CurX + Padding.left, CurY + Padding.top, AutoWidth,
                MaxHeight - Padding.top - Padding.bottom)
            else
              SetBounds(CurX + Padding.left, CurY + Padding.top, Width,
                MaxHeight - Padding.top - Padding.bottom);
            CurX := CurX + Padding.left + Width + Padding.right;
          end;
  finally
    FDisableAlign := False;
  end;
  inherited;
end;

function TTabControl.GetTabCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TFmxObject(FChildren[i]) is TTabItem then
      begin
        if TTabItem(FChildren[i]).Visible then
        begin
          Inc(Result);
        end;
      end;
end;

function TTabControl.GetTabItem(AIndex: Integer): TTabItem;
var
  Idx, i: Integer;
begin
  { calc max height }
  Idx := 0;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TFmxObject(FChildren[i]) is TTabItem then
      begin
        if TTabItem(FChildren[i]).Visible then
        begin
          if (Idx = AIndex) then
          begin
            Result := TTabItem(FChildren[i]);
            Exit;
          end;
          Inc(Idx);
        end;
      end;
  Result := nil;
end;

procedure TTabControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
    Realign;
end;

procedure TTabControl.SetTabIndex(const Value: Integer);
begin
  if FTabIndex <> Value then
  begin
    if GetTabItem(FTabIndex) <> nil then
      GetTabItem(FTabIndex).Select(False);
    FTabIndex := Value;
    Realign;
    if GetTabItem(FTabIndex) <> nil then
      GetTabItem(FTabIndex).Select(True);
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TTabControl.SetActiveTab(const Value: TTabItem);
begin
  TabIndex := Value.Index;
end;

procedure TTabControl.SetTabHeight(const Value: Single);
var
  i: Integer;
begin
  if FTabHeight <> Value then
  begin
    FTabHeight := Value;
    for i := 0 to TabCount - 1 do
      Tabs[i].Height:= Value;
    Realign;
  end;
end;

procedure TTabControl.SetFullSize(const Value: Boolean);
begin
  if FFullSize <> Value then
  begin
    FFullSize := Value;
    Realign;
  end;
end;

procedure TTabControl.Resize;
begin
  FixTabSize;
  inherited ;
end;

initialization
  RegisterFmxClasses([TTabControl, TTabItem]);
end.
