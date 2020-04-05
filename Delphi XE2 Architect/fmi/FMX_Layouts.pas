{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Layouts;

{$I FMX_Defines.inc}
{$H+}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Ani, FMX_Controls;

type

{ TLayout }

  TLayout = class(TControl)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  published
    property HitTest default False;
  end;

{ TScaledLayout }

  TScaledLayout = class(TControl)
  private
    FOriginalWidth: Single;
    FOriginalHeight: Single;
    procedure SetOriginalWidth(const Value: Single);
    procedure SetOriginalHeight(const Value: Single);
  protected
    function GetChildrenMatrix: TMatrix; override;
    procedure SetHeight(const Value: Single); override;
    procedure SetWidth(const Value: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure Realign; override;
  published
    property OriginalWidth: Single read FOriginalWidth write SetOriginalWidth;
    property OriginalHeight: Single read FOriginalHeight write SetOriginalHeight;
  end;

{ TScrollContent }

  TScrollContent = class(TContent)
  protected
    function GetClipRect: TRectF; override;
    function ObjectAtPoint(P: TPointF): IControl; override;
    function GetUpdateRect: TRectF; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
  end;

{ TScrollBox }

  TScrollBox = class(TStyledControl)
  private
    FAutoHide: Boolean;
    FDisableMouseWheel: Boolean;
    FDown: Boolean;
    FHScrollAni: TFloatAnimation;
    FHScrollTrack: single;
    FHScrollTrackMinAni: TFloatAnimation;
    FHScrollTrackMaxAni: TFloatAnimation;
    FVScrollAni: TFloatAnimation;
    FVScrollTrack: single;
    FVScrollTrackMinAni: TFloatAnimation;
    FVScrollTrackMaxAni: TFloatAnimation;
    FAnimated: Boolean;
    FShowScrollBars: Boolean;
    FShowSizeGrip: Boolean;
    FMouseTracking: Boolean;
    FUseSmallScrollBars: Boolean;
    procedure SetShowScrollBars(const Value: Boolean);
    procedure SetShowSizeGrip(const Value: Boolean);
    procedure SetUseSmallScrollBars(const Value: Boolean);
    function GetVScrollBar: TScrollBar;
    function GetHScrollBar: TScrollBar;
    procedure CreateVScrollTrackAni;
    procedure CreateHScrollTrackAni;
  protected
    FScrollDesign: TPointF;
    FContent: TScrollContent;
    FHScrollBar: TScrollBar;
    FVScrollBar: TScrollBar;
    FContentLayout: TControl;
    FDownPos: TPointF;
    FLastDelta: TPointF;
    FCurrentPos: TPointF;
    { VCL }
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadScrollDesign(Reader: TReader);
    procedure WriteScrollDesign(Writer: TWriter);
    { }
    procedure ContentAddObject(AObject: TFmxObject); virtual;
    procedure ContentBeforeRemoveObject(AObject: TFmxObject); virtual;
    procedure ContentRemoveObject(AObject: TFmxObject); virtual;
    procedure HScrollChange(Sender: TObject); virtual;
    procedure VScrollChange(Sender: TObject); virtual;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure CreateVScrollAni;
    procedure CreateHScrollAni;
    function ContentRect: TRectF;
    function VScrollBarValue: Single;
    function HScrollBarValue: Single;
    function GetContentBounds: TRectF; virtual;
    procedure RealignContent(R: TRectF); virtual;
    property ContentLayout: TControl read FContentLayout;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure Sort(Compare: TFmxObjectSortCompare); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure Realign; override;
    procedure Center;
    procedure ScrollTo(const Dx, Dy: Single);
    procedure InViewRect(const Rect: TRectF);
    function ClientWidth: Single;
    function ClientHeight: Single;
    property HScrollBar: TScrollBar read GetHScrollBar;
    property VScrollBar: TScrollBar read GetVScrollBar;
  published
    property AutoHide: Boolean read FAutoHide write FAutoHide default True;
    property Animated: Boolean read FAnimated write FAnimated default True;
    property DisableMouseWheel: Boolean read FDisableMouseWheel write FDisableMouseWheel default False;
    property MouseTracking: Boolean read FMouseTracking write FMouseTracking default False;
    property ShowScrollBars: Boolean read FShowScrollBars write SetShowScrollBars default True;
    property ShowSizeGrip: Boolean read FShowSizeGrip write SetShowSizeGrip default False;
    property UseSmallScrollBars: Boolean read FUseSmallScrollBars write SetUseSmallScrollBars default False;
  end;

{ TVertScrollBox }

  TVertScrollBox = class(TScrollBox)
  protected
    function GetContentBounds: TRectF; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TFramedScrollBox }

  TFramedScrollBox = class(TScrollBox)
  end;

{ TFramedVertScrollBox }

  TFramedVertScrollBox = class(TVertScrollBox)
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TGridLayout }

  TGridLayout = class(TControl)
  private
    FItemWidth: Single;
    FItemHeight: Single;
    FOrientation: TOrientation;
    procedure SetItemHeight(const Value: Single);
    procedure SetItemWidth(const Value: Single);
    procedure SetOrientation(const Value: TOrientation);
  protected
    procedure Realign; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddObject(AObject: TFmxObject); override;
  published
    property ItemHeight: Single read FItemHeight write SetItemHeight;
    property ItemWidth: Single read FItemWidth write SetItemWidth;
    property Orientation: TOrientation read FOrientation write SetOrientation;
  end;

implementation

{ TLayout }

constructor TLayout.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := False;
end;

destructor TLayout.Destroy;
begin
  inherited;
end;

procedure TLayout.Paint;
var
  R: TRectF;
begin
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
end;

{ TScrollContent }

constructor TScrollContent.Create(AOwner: TComponent);
begin
  inherited;
  ClipChildren := True;
  SetAcceptsControls(False);
end;

function TScrollContent.GetClipRect: TRectF;
begin
  if (Parent <> nil) and (Parent is TScrollBox) and
    (TScrollBox(Parent).ContentLayout <> nil) then
  begin
    Result := TScrollBox(Parent).ContentLayout.LocalRect;
    if (TScrollBox(Parent).VScrollBar <> nil) and
      (TScrollBox(Parent).VScrollBar.Enabled) then
      OffsetRect(Result, 0, TScrollBox(Parent).VScrollBar.Value);
    if (TScrollBox(Parent).HScrollBar <> nil) and
      (TScrollBox(Parent).HScrollBar.Enabled) then
      OffsetRect(Result, TScrollBox(Parent).HScrollBar.Value, 0);
  end
  else
    Result := inherited GetClipRect;
end;

function TScrollContent.ObjectAtPoint(P: TPointF): IControl;
begin
  Result := inherited ObjectAtPoint(P);
  if Result <> nil then
  begin
    if FScene <> nil then
      P := FScene.ScreenToLocal(P);
    P := AbsoluteToLocal(P);
    if not PointInRect(P, ClipRect) then
      Result := nil;
  end;
end;

procedure TScrollContent.AddObject(AObject: TFmxObject);
begin
  inherited;
  if (Parent <> nil) and (Parent is TScrollBox) then
    TScrollBox(Parent).ContentAddObject(AObject);
end;

procedure TScrollContent.RemoveObject(AObject: TFmxObject);
begin
  if (Parent <> nil) and (Parent is TScrollBox) then
    TScrollBox(Parent).ContentBeforeRemoveObject(AObject);
  inherited;
  if (Parent <> nil) and (Parent is TScrollBox) then
    TScrollBox(Parent).ContentRemoveObject(AObject);
end;

function TScrollContent.GetUpdateRect: TRectF;
begin
  if FRecalcUpdateRect then
  begin
    if (Parent <> nil) and (Parent is TScrollBox) then
    begin
      if (TScrollBox(Parent).ContentLayout <> nil) then
        FUpdateRect := TScrollBox(Parent).ContentLayout.UpdateRect
      else
        FUpdateRect := TScrollBox(Parent).UpdateRect;
    end;
  end;
  Result := FUpdateRect;
end;

{ TScrollBox }

constructor TScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoCapture := True;
  FAnimated := True;
  FAutoHide := True;
  FShowScrollBars := True;
  FContent := TScrollContent.Create(Self);
  FContent.Parent := Self;
  FContent.Stored := False;
  FContent.Locked := True;
  FContent.HitTest := False;
end;

destructor TScrollBox.Destroy;
begin
  FContent := nil;
  inherited;
end;

procedure TScrollBox.FreeStyle;
begin
  inherited;
  FContentLayout := nil;
  FHScrollBar := nil;
  FVScrollBar := nil;
end;

procedure TScrollBox.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('sizegrip');
  if (B <> nil) and (B is TControl) then
    TControl(B).Visible := FShowSizeGrip;

  // hide all before align
  B := FindStyleResource('vscrollbar');
  if (B <> nil) and (B is TControl) then
    TControl(B).Visible := False;
  B := FindStyleResource('hscrollbar');
  if (B <> nil) and (B is TControl) then
    TControl(B).Visible := False;
  B := FindStyleResource('vsmallscrollbar');
  if (B <> nil) and (B is TControl) then
    TControl(B).Visible := False;
  B := FindStyleResource('hsmallscrollbar');
  if (B <> nil) and (B is TControl) then
    TControl(B).Visible := False;
  if FUseSmallScrollBars then
  begin
    B := FindStyleResource('vsmallscrollbar');
    if (B <> nil) and (B is TScrollBar) then
    begin
      FVScrollBar := TScrollBar(B);
      FVScrollBar.OnChange := VScrollChange;
      FVScrollBar.Locked := True;
      if FVScrollBar.Tag = 0 then
        FVScrollBar.Tag := Integer(FVScrollBar.Align);
    end;
    B := FindStyleResource('hsmallscrollbar');
    if (B <> nil) and (B is TScrollBar) then
    begin
      FHScrollBar := TScrollBar(B);
      FHScrollBar.OnChange := HScrollChange;
      FHScrollBar.Locked := True;
      if FHScrollBar.Tag = 0 then
        FHScrollBar.Tag := Integer(FHScrollBar.Align);
    end;
  end;
  if not FUseSmallScrollBars or ((FVScrollBar = nil) or (FHScrollBar = nil))
  then
  begin
    B := FindStyleResource('vscrollbar');
    if (B <> nil) and (B is TScrollBar) then
    begin
      FVScrollBar := TScrollBar(B);
      FVScrollBar.OnChange := VScrollChange;
      FVScrollBar.Locked := True;
      if FVScrollBar.Tag = 0 then
        FVScrollBar.Tag := Integer(FVScrollBar.Align);
    end;
    B := FindStyleResource('hscrollbar');
    if (B <> nil) and (B is TScrollBar) then
    begin
      FHScrollBar := TScrollBar(B);
      FHScrollBar.OnChange := HScrollChange;
      FHScrollBar.Locked := True;
      if FHScrollBar.Tag = 0 then
        FHScrollBar.Tag := Integer(FHScrollBar.Align);
    end;
  end;
  B := FindStyleResource('content');
  if (B <> nil) and (B is TControl) then
    FContentLayout := TControl(B);

  Realign;
  FVScrollAni := nil;
  FHScrollAni := nil;
end;

function TScrollBox.GetContentBounds: TRectF;
var
  i: Integer;
  R, LocalR: TRectF;
begin
  Result := RectF(0, 0, Width, Height);
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    R := ContentLayout.LocalRect;
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TControl then
        if (TControl(FContent.Children[i]).Visible) then
        begin
          if (csDesigning in ComponentState) and not (csDesigning in FContent.Children[i].ComponentState) then Continue;
          LocalR := TControl(FContent.Children[i]).ParentedRect;
          R := UnionRect(R, LocalR);
        end;
    Result := R;
  end;
end;

function TScrollBox.GetHScrollBar: TScrollBar;
begin
  if FHScrollBar = nil then
    ApplyStyleLookup;
  Result := FHScrollBar;
end;

function TScrollBox.GetVScrollBar: TScrollBar;
begin
  if FVScrollBar = nil then
    ApplyStyleLookup;
  Result := FVScrollBar;
end;

procedure TScrollBox.RealignContent(R: TRectF);
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    FContent.SetBounds(R.Left, R.Top, RectWidth(R), RectHeight(R));
    FContent.FRecalcUpdateRect := True; // need to recalc
  end;
end;

procedure TScrollBox.Realign;

  procedure IntAlign;
  var
    R: TRectF;
  begin
    R := GetContentBounds;
    if RectWidth(R) * RectHeight(R) = 0 then
      Exit;
    OffsetRect(R, ContentLayout.Position.X, ContentLayout.Position.Y);
    if (HScrollBar <> nil) and (HScrollBar.Enabled) then
      OffsetRect(R, -FScrollDesign.X, 0);
    if (VScrollBar <> nil) and (VScrollBar.Enabled) then
      OffsetRect(R, 0, -FScrollDesign.Y);
    RealignContent(R);
    // realign resource
    if (ContentLayout.Parent <> nil) and (ContentLayout.Parent is TControl) then
      TControl(ContentLayout.Parent).BeginUpdate;
    if (VScrollBar <> nil) then
    begin
      VScrollBar.Enabled := RectHeight(R) > ContentLayout.Height;
      if FAutoHide then
        VScrollBar.Visible := VScrollBar.Enabled;
      if not FShowScrollBars then
      begin
        VScrollBar.Opacity := 0;
        VScrollBar.Align := TAlignLayout.alNone;
      end
      else
      begin
        VScrollBar.Opacity := 1;
        VScrollBar.Align := TAlignLayout(VScrollBar.Tag);
      end;
    end;
    if (HScrollBar <> nil) then
    begin
      HScrollBar.Enabled := RectWidth(R) > ContentLayout.Width;
      if FAutoHide then
        HScrollBar.Visible := HScrollBar.Enabled;
      if not FShowScrollBars then
      begin
        HScrollBar.Opacity := 0;
        HScrollBar.Align := TAlignLayout.alNone;
      end
      else
      begin
        HScrollBar.Opacity := 1;
        HScrollBar.Align := TAlignLayout(HScrollBar.Tag);
        if (VScrollBar <> nil) and (VScrollBar.Enabled) then
          HScrollBar.Padding.right := VScrollBar.Width;
      end;
    end;
    if (ContentLayout.Parent <> nil) and (ContentLayout.Parent is TControl) then
    begin
      TControl(ContentLayout.Parent).EndUpdate;
      TControl(ContentLayout.Parent).Realign;
    end;
    // align scrollbars
    if (VScrollBar <> nil) then
    begin
      VScrollBar.Enabled := RectHeight(R) > ContentLayout.Height;
      if FAutoHide then
        VScrollBar.Visible := VScrollBar.Enabled;
      if not FShowScrollBars then
      begin
        VScrollBar.Opacity := 0;
        VScrollBar.Align := TAlignLayout.alNone;
        VScrollBar.Position.Y := Width + 100;
      end
      else
      begin
        VScrollBar.Opacity := 1;
        VScrollBar.HitTest := True;
        VScrollBar.Align := TAlignLayout(VScrollBar.Tag);
      end;
      VScrollBar.BringToFront;
      if VScrollBar.Visible and (ContentLayout <> nil) then
      begin
        VScrollBar.Max := RectHeight(R);
        VScrollBar.TagFloat := VScrollBar.Max;
        VScrollBar.ViewportSize := ContentLayout.Height;
        VScrollBar.SmallChange := VScrollBar.ViewportSize / 5;
        VScrollBar.Value := FScrollDesign.Y;
      end
      else
      begin
        VScrollBar.Value := 0;
      end;
    end;
    if (HScrollBar <> nil) then
    begin
      HScrollBar.Enabled := RectWidth(R) > ContentLayout.Width;
      HScrollBar.Padding.right := 0;
      if FAutoHide then
        HScrollBar.Visible := HScrollBar.Enabled;
      if not FShowScrollBars then
      begin
        HScrollBar.Opacity := 0;
        HScrollBar.Align := TAlignLayout.alNone;
        HScrollBar.Position.Y := Height + 100;
      end
      else
      begin
        HScrollBar.Opacity := 1;
        HScrollBar.Align := TAlignLayout(HScrollBar.Tag);
        if (VScrollBar <> nil) and (VScrollBar.Enabled) then
          HScrollBar.Padding.right := VScrollBar.Width;
      end;
      HScrollBar.BringToFront;
      if HScrollBar.Visible and (ContentLayout <> nil) then
      begin
        HScrollBar.Max := RectWidth(R);
        HScrollBar.TagFloat := HScrollBar.Max;
        HScrollBar.ViewportSize := ContentLayout.Width;
        HScrollBar.SmallChange := HScrollBar.ViewportSize / 5;
        HScrollBar.Value := ContentLayout.Position.X - FContent.Position.X;
      end
      else
        HScrollBar.Value := 0;
    end;
  end;

var
  R, NewR: TRectF;
begin
  if csDestroying in ComponentState then
    Exit;
  inherited;
  if csLoading in ComponentState then
    Exit;
  if ContentLayout = nil then
    Exit;
  if FDisableAlign then
    Exit;
  if FUpdating > 0 then
    Exit;
  FDisableAlign := True;
  try
    R := ContentLayout.LocalRect;
    IntAlign;
    NewR := ContentLayout.LocalRect;
    if (RectWidth(NewR) <> RectWidth(R)) or (RectHeight(NewR) <> RectHeight(R))
    then
    begin
      IntAlign;
    end;
  finally
    FDisableAlign := False;
  end;
end;

function TScrollBox.ContentRect: TRectF;
begin
  if ContentLayout <> nil then
    Result := ContentLayout.ParentedRect
  else
    Result := LocalRect;
end;

function TScrollBox.VScrollBarValue: Single;
begin
  if (VScrollBar <> nil) and (VScrollBar.Visible) then
    Result := VScrollBar.Value
  else
    Result := 0;
end;

function TScrollBox.HScrollBarValue: Single;
begin
  if (HScrollBar <> nil) and (HScrollBar.Visible) then
    Result := HScrollBar.Value
  else
    Result := 0;
end;

procedure TScrollBox.HScrollChange(Sender: TObject);
begin
  if ContentLayout = nil then
    Exit;
  if HScrollBar.Visible then
    FContent.Position.X := ContentLayout.Position.X - HScrollBar.Value
  else
    FContent.Position.X := ContentLayout.Position.X;
  FScrollDesign.X := HScrollBar.Value;
end;

procedure TScrollBox.VScrollChange(Sender: TObject);
begin
  if ContentLayout = nil then
    Exit;
  if VScrollBar.Visible then
    FContent.Position.Y := ContentLayout.Position.Y - VScrollBar.Value
  else
    FContent.Position.Y := ContentLayout.Position.Y;
  FScrollDesign.Y := VScrollBar.Value;
end;

procedure TScrollBox.CreateHScrollAni;
begin
  if FHScrollAni = nil then
  begin
    FHScrollAni := TFloatAnimation.Create(Self);
    FHScrollAni.Parent := HScrollBar;
    FHScrollAni.AnimationType := TAnimationType.atOut;
    FHScrollAni.Interpolation := TInterpolationType.itQuadratic;
    FHScrollAni.Duration := 0.7;
    FHScrollAni.PropertyName := 'Value';
    FHScrollAni.StartFromCurrent := True;
  end;
end;

procedure TScrollBox.CreateHScrollTrackAni;
begin
  if FHScrollTrackMinAni = nil then
  begin
    FHScrollTrackMinAni := TFloatAnimation.Create(Self);
    FHScrollTrackMinAni.Parent := HScrollBar;
    FHScrollTrackMinAni.AnimationType := TAnimationType.atOut;
    FHScrollTrackMinAni.Interpolation := TInterpolationType.itQuadratic;
    FHScrollTrackMinAni.Duration := 0.7;
    FHScrollTrackMinAni.PropertyName := 'Min';
    FHScrollTrackMinAni.StartFromCurrent := True;
  end;
  if FHScrollTrackMaxAni = nil then
  begin
    FHScrollTrackMaxAni := TFloatAnimation.Create(Self);
    FHScrollTrackMaxAni.Parent := HScrollBar;
    FHScrollTrackMaxAni.AnimationType := TAnimationType.atOut;
    FHScrollTrackMaxAni.Interpolation := TInterpolationType.itQuadratic;
    FHScrollTrackMaxAni.Duration := 0.7;
    FHScrollTrackMaxAni.PropertyName := 'Max';
    FHScrollTrackMaxAni.StartFromCurrent := True;
  end;
end;

procedure TScrollBox.CreateVScrollAni;
begin
  if FVScrollAni = nil then
  begin
    FVScrollAni := TFloatAnimation.Create(Self);
    FVScrollAni.Parent := VScrollBar;
    FVScrollAni.AnimationType := TAnimationType.atOut;
    FVScrollAni.Interpolation := TInterpolationType.itQuadratic;
    FVScrollAni.Duration := 0.7;
    FVScrollAni.PropertyName := 'Value';
    FVScrollAni.StartFromCurrent := True;
  end;
end;

procedure TScrollBox.CreateVScrollTrackAni;
begin
  if FVScrollTrackMinAni = nil then
  begin
    FVScrollTrackMinAni := TFloatAnimation.Create(Self);
    FVScrollTrackMinAni.Parent := VScrollBar;
    FVScrollTrackMinAni.AnimationType := TAnimationType.atOut;
    FVScrollTrackMinAni.Interpolation := TInterpolationType.itQuadratic;
    FVScrollTrackMinAni.Duration := 0.7;
    FVScrollTrackMinAni.PropertyName := 'Min';
    FVScrollTrackMinAni.StartFromCurrent := True;
  end;
  if FVScrollTrackMaxAni = nil then
  begin
    FVScrollTrackMaxAni := TFloatAnimation.Create(Self);
    FVScrollTrackMaxAni.Parent := VScrollBar;
    FVScrollTrackMaxAni.AnimationType := TAnimationType.atOut;
    FVScrollTrackMaxAni.Interpolation := TInterpolationType.itQuadratic;
    FVScrollTrackMaxAni.Duration := 0.7;
    FVScrollTrackMaxAni.PropertyName := 'Max';
    FVScrollTrackMaxAni.StartFromCurrent := True;
  end;
end;

procedure TScrollBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and FMouseTracking then
  begin
    FLastDelta := PointF(0, 0);
    FDownPos := PointF(X, Y);
    FCurrentPos := PointF(X, Y);
    FDown := True;
    if (FVScrollAni <> nil) and FVScrollAni.Running then
      FVScrollAni.StopAtCurrent;
    if (FHScrollAni <> nil) and FHScrollAni.Running then
      FHScrollAni.StopAtCurrent;

    if (FVScrollTrackMinAni <> nil) and FVScrollTrackMinAni.Running then
      FVScrollTrackMinAni.StopAtCurrent;
    if (FVScrollTrackMaxAni <> nil) and FVScrollTrackMaxAni.Running then
      FVScrollTrackMaxAni.StopAtCurrent;
    if (FHScrollTrackMinAni <> nil) and FHScrollTrackMinAni.Running then
      FHScrollTrackMinAni.StopAtCurrent;
    if (FHScrollTrackMaxAni <> nil) and FHScrollTrackMaxAni.Running then
      FHScrollTrackMaxAni.StopAtCurrent;

    if (VScrollBar <> nil) then
      FVScrollTrack := VScrollBar.Value;
    if (HScrollBar <> nil) then
      FHScrollTrack := HScrollBar.Value;
  end;
end;

procedure TScrollBox.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FDown and FMouseTracking then
  begin
    if (VScrollBar <> nil) and (VScrollBar.Visible) then
    begin
      VScrollBar.Value := VScrollBar.Value - (Y - FCurrentPos.Y);
      FVScrollTrack := FVScrollTrack - (Y - FCurrentPos.Y);
      if FVScrollTrack < 0 then
        VScrollBar.Min := FVScrollTrack;
      if FVScrollTrack > VScrollBar.Max - VScrollBar.ViewportSize then
        VScrollBar.Max := FVScrollTrack + VScrollBar.ViewportSize;
      FLastDelta.Y := (Y - FCurrentPos.Y);
    end;
    if (HScrollBar <> nil) and (HScrollBar.Visible) then
    begin
      HScrollBar.Value := HScrollBar.Value - (X - FCurrentPos.X);
      FHScrollTrack := FHScrollTrack - (X - FCurrentPos.X);
      if FHScrollTrack < 0 then
        HScrollBar.Min := FHScrollTrack;
      if FHScrollTrack > HScrollBar.Max - HScrollBar.ViewportSize then
        HScrollBar.Max := FHScrollTrack + HScrollBar.ViewportSize;
      FLastDelta.X := (X - FCurrentPos.X);
    end;
    FCurrentPos := PointF(X, Y);
  end;
end;

procedure TScrollBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  if FDown and FMouseTracking then
  begin
    FDown := False;
    // animation
    if FAnimated and (VScrollBar.Min < 0) and (FVScrollTrack <> VScrollBar.Value) and not ((FVScrollTrackMinAni <> nil) and (FVScrollTrackMinAni.Running)) then
    begin
      CreateVScrollTrackAni;
      if FVScrollTrackMinAni.Running then
        FVScrollTrackMinAni.StopAtCurrent
      else
        FVScrollTrackMinAni.StartValue := VScrollBar.Min;
      FVScrollTrackMinAni.StopValue := 0;
      FVScrollTrackMinAni.Start;
    end
    else
    if FAnimated and (VScrollBar.Max > VScrollBar.TagFloat) and (FVScrollTrack <> VScrollBar.Value) and not ((FVScrollTrackMaxAni <> nil) and (FVScrollTrackMaxAni.Running)) then
    begin
      CreateVScrollTrackAni;
      if FVScrollTrackMaxAni.Running then
        FVScrollTrackMaxAni.StopAtCurrent
      else
        FVScrollTrackMaxAni.StartValue := VScrollBar.Max;
      FVScrollTrackMaxAni.StopValue := VScrollBar.TagFloat;
      FVScrollTrackMaxAni.Start;
    end
    else
    if FAnimated and (HScrollBar.Min < 0) and (FHScrollTrack <> HScrollBar.Value) and not ((FHScrollTrackMinAni <> nil) and (FHScrollTrackMinAni.Running)) then
    begin
      CreateHScrollTrackAni;
      if FHScrollTrackMinAni.Running then
        FHScrollTrackMinAni.StopAtCurrent
      else
        FHScrollTrackMinAni.StartValue := HScrollBar.Min;
      FHScrollTrackMinAni.StopValue := 0;
      FHScrollTrackMinAni.Start;
    end
    else
    if FAnimated and (HScrollBar.Max > HScrollBar.TagFloat) and (FHScrollTrack <> HScrollBar.Value) and not ((FHScrollTrackMaxAni <> nil) and (FHScrollTrackMaxAni.Running)) then
    begin
      CreateHScrollTrackAni;
      if FHScrollTrackMaxAni.Running then
        FHScrollTrackMaxAni.StopAtCurrent
      else
        FHScrollTrackMaxAni.StartValue := HScrollBar.Max;
      FHScrollTrackMaxAni.StopValue := HScrollBar.TagFloat;
      FHScrollTrackMaxAni.Start;
    end
    else 
    if FAnimated then
    begin
      if (VScrollBar <> nil) and (VScrollBar.Visible) and (FLastDelta.Y <> 0) then
      begin
        CreateVScrollAni;
        if FVScrollAni.Running then
          FVScrollAni.StopAtCurrent;
        FVScrollAni.StopValue := VScrollBar.Value - (FLastDelta.Y * 7);
        if FVScrollAni.StopValue < 0 then
        begin
          FVScrollBar.Min := FVScrollAni.StopValue;
          CreateVScrollTrackAni;
          if FVScrollTrackMinAni.Running then
            FVScrollTrackMinAni.StopAtCurrent
          else
            FVScrollTrackMinAni.StartValue := VScrollBar.Min;
          FVScrollTrackMinAni.StopValue := 0;
          FVScrollTrackMinAni.Start;
        end;
        if FVScrollAni.StopValue > FVScrollBar.Max then
        begin
          FVScrollBar.Max := FVScrollAni.StopValue;
          CreateVScrollTrackAni;
          if FVScrollTrackMaxAni.Running then
            FVScrollTrackMaxAni.StopAtCurrent
          else
            FVScrollTrackMaxAni.StartValue := VScrollBar.Max;
          FVScrollTrackMaxAni.StopValue := VScrollBar.TagFloat;
          FVScrollTrackMaxAni.Start;
        end;
        FVScrollAni.Start;
      end;
      if (HScrollBar <> nil) and (HScrollBar.Visible) and (FLastDelta.X <> 0) then
      begin
        CreateHScrollAni;
        if FHScrollAni.Running then
          FHScrollAni.StopAtCurrent;
        FHScrollAni.StopValue := HScrollBar.Value - (FLastDelta.X * 7);
        if FHScrollAni.StopValue < 0 then
        begin
          FHScrollBar.Min := FHScrollAni.StopValue;
          CreateHScrollTrackAni;
          if FHScrollTrackMinAni.Running then
            FHScrollTrackMinAni.StopAtCurrent
          else
            FHScrollTrackMinAni.StartValue := HScrollBar.Min;
          FHScrollTrackMinAni.StopValue := 0;
          FHScrollTrackMinAni.Start;
        end;
        if FHScrollAni.StopValue > FHScrollBar.Max then
        begin
          FHScrollBar.Max := FHScrollAni.StopValue;
          CreateHScrollTrackAni;
          if FHScrollTrackMaxAni.Running then
            FHScrollTrackMaxAni.StopAtCurrent
          else
            FHScrollTrackMaxAni.StartValue := HScrollBar.Max;
          FHScrollTrackMaxAni.StopValue := HScrollBar.TagFloat;
          FHScrollTrackMaxAni.Start;
        end;
        FHScrollAni.Start;
      end; 
    end;
  end;
end;

procedure TScrollBox.MouseWheel(Shift: TShiftState; WheelDelta: Integer;
  var Handled: Boolean);
begin
  inherited;
  if not Handled and not(FDisableMouseWheel) and (VScrollBar <> nil) and (VScrollBar.Visible) then
  begin
    if FAnimated then
    begin
      CreateVScrollAni;
      if FVScrollAni.Running then
        FVScrollAni.StopAtCurrent;
      FVScrollAni.StopValue := VScrollBar.Value -
        (VScrollBar.SmallChange * 3 * (WheelDelta / 120));
      FVScrollAni.Start;
    end
    else
      VScrollBar.Value := VScrollBar.Value -
        (VScrollBar.SmallChange * 3 * (WheelDelta / 120));
    Handled := True;
  end;
  if not Handled and not(FDisableMouseWheel) and (HScrollBar <> nil) and
    (HScrollBar.Visible) then
  begin
    if FAnimated then
    begin
      CreateHScrollAni;
      if FHScrollAni.Running then
        FHScrollAni.StopAtCurrent;
      FHScrollAni.StopValue := HScrollBar.Value -
        (HScrollBar.SmallChange * 3 * (WheelDelta / 120));
      FHScrollAni.Start;
    end
    else
      HScrollBar.Value := HScrollBar.Value -
        (HScrollBar.SmallChange * 3 * (WheelDelta / 120));
    Handled := True;
  end;
end;

procedure TScrollBox.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject <> FContent) and (AObject <> FResourceLink) and
    not (AObject is TEffect) and not (AObject is TAnimation) then
  begin
    FContent.AddObject(AObject);
  end
  else
    inherited;
end;

procedure TScrollBox.Loaded;
begin
  inherited;
  // ScrollTo(-FScrollDesign.X, -FScrollDesign.Y);
end;

procedure TScrollBox.Center;
begin
  if (VScrollBar <> nil) and (VScrollBar.Visible) then
  begin
    VScrollBar.Value := (VScrollBar.Max - VScrollBar.ViewportSize) / 2;
  end;
  if (HScrollBar <> nil) and (HScrollBar.Visible) then
  begin
    HScrollBar.Value := (HScrollBar.Max - HScrollBar.ViewportSize) / 2;
  end;
end;

procedure TScrollBox.ScrollTo(const Dx, Dy: Single);
begin
  if (VScrollBar <> nil) and (VScrollBar.Visible) then
    VScrollBar.Value := VScrollBar.Value - Dy;
  if (HScrollBar <> nil) and (HScrollBar.Visible) then
    HScrollBar.Value := HScrollBar.Value - Dx;
end;

procedure TScrollBox.InViewRect(const Rect: TRectF);
begin
end;

procedure TScrollBox.SetShowScrollBars(const Value: Boolean);
begin
  if FShowScrollBars <> Value then
  begin
    FShowScrollBars := Value;
    Realign;
  end;
end;

procedure TScrollBox.SetShowSizeGrip(const Value: Boolean);
begin
  if FShowSizeGrip <> Value then
  begin
    FShowSizeGrip := Value;
    ApplyStyle;
  end;
end;

procedure TScrollBox.DefineProperties(Filer: TFiler);
begin
  inherited;
  // Filer.DefineProperty('ScrollDesign', ReadScrollDesign, WriteScrollDesign, (FScrollDesign.X <> 0) and (FScrollDesign.Y <> 0));
end;

procedure TScrollBox.ReadScrollDesign(Reader: TReader);
begin
  FScrollDesign := StringToPoint(Reader.ReadString);;
end;

procedure TScrollBox.WriteScrollDesign(Writer: TWriter);
begin
  Writer.WriteString(PointToString(FScrollDesign));
end;

procedure TScrollBox.SetUseSmallScrollBars(const Value: Boolean);
begin
  if FUseSmallScrollBars <> Value then
  begin
    FUseSmallScrollBars := Value;
    ApplyStyle;
  end;
end;

procedure TScrollBox.Sort(Compare: TFmxObjectSortCompare);
begin
  FContent.Sort(Compare);
end;

function TScrollBox.ClientHeight: Single;
begin
  if ContentLayout <> nil then
    Result := ContentLayout.Height
  else
    Result := Height;
end;

function TScrollBox.ClientWidth: Single;
begin
  if ContentLayout <> nil then
    Result := ContentLayout.Width
  else
    Result := Width;
end;

procedure TScrollBox.ContentAddObject(AObject: TFmxObject);
begin
end;

procedure TScrollBox.ContentRemoveObject(AObject: TFmxObject);
begin
end;

procedure TScrollBox.ContentBeforeRemoveObject(AObject: TFmxObject);
begin
end;

{ TGridLayout }

procedure TGridLayout.AddObject(AObject: TFmxObject);
begin
  inherited;
  Realign;
end;

constructor TGridLayout.Create(AOwner: TComponent);
begin
  inherited;
  FItemHeight := 64;
  FItemWidth := 64;
end;

procedure TGridLayout.Realign;
var
  i: Integer;
  CurPos: TPointF;
begin
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  { content }
  CurPos := PointF(Margins.Left, Margins.Top);
  for i := 0 to ChildrenCount - 1 do
    if (Children[i] is TControl) then
      with TControl(Children[i]) do
      begin
        if (csDesigning in Self.ComponentState) and not (csDesigning in TControl(Self.Children[i]).ComponentState) then Continue;

        SetBounds(CurPos.X + Padding.Left, CurPos.Y + Padding.Top,
          FItemWidth - Padding.Left - Padding.right, FItemHeight - Padding.Top -
          Padding.bottom);
        if Orientation = TOrientation.orHorizontal then
        begin
          CurPos.X := CurPos.X + FItemWidth;
          if CurPos.X + FItemWidth > Self.Width - Self.Margins.Left -
            Self.Margins.right then
          begin
            CurPos.X := Self.Margins.Left;
            CurPos.Y := CurPos.Y + FItemHeight;
          end;
        end
        else
        begin
          CurPos.Y := CurPos.Y + FItemHeight;
          if CurPos.Y + FItemHeight > Self.Height - Self.Margins.Top -
            Self.Margins.bottom then
          begin
            CurPos.Y := Self.Margins.Top;
            CurPos.X := CurPos.X + FItemWidth;
          end;
        end;
      end;
  FDisableAlign := False;
end;

procedure TGridLayout.SetItemHeight(const Value: Single);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    Realign;
  end;
end;

procedure TGridLayout.SetItemWidth(const Value: Single);
begin
  if FItemWidth <> Value then
  begin
    FItemWidth := Value;
    Realign;
  end;
end;

procedure TGridLayout.SetOrientation(const Value: TOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    Realign;
  end;
end;

{ TScaledLayout }

constructor TScaledLayout.Create(AOwner: TComponent);
begin
  inherited;
  FOriginalWidth := Width;
  FOriginalHeight := Height;
end;

destructor TScaledLayout.Destroy;
begin
  inherited;
end;

procedure TScaledLayout.Realign;
begin
  if (Parent <> nil) and (Parent is TScrollBox) and
    (TScrollBox(Parent).FUpdating > 0) then
    Exit;
  inherited;
  if not((csDesigning in ComponentState)) then
  begin
    RecalcAbsolute;
    FRecalcUpdateRect := True;
  end;
end;

function TScaledLayout.GetChildrenMatrix: TMatrix;
begin
  if ((csDesigning in ComponentState)) then
  begin
    OriginalHeight := Height;
    OriginalWidth := Width;
  end;
  Result := IdentityMatrix;
  Result.m11 := Width / FOriginalWidth;
  Result.m22 := Height / FOriginalHeight;
end;

procedure TScaledLayout.Paint;
var
  R: TRectF;
begin
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
  inherited;
end;

procedure TScaledLayout.SetOriginalHeight(const Value: Single);
begin
  if FOriginalHeight <> Value then
  begin
    FOriginalHeight := Value;
    if FOriginalHeight < 1 then
      FOriginalHeight := 1;
    RecalcAbsolute;
  end;
end;

procedure TScaledLayout.SetOriginalWidth(const Value: Single);
begin
  if FOriginalWidth <> Value then
  begin
    FOriginalWidth := Value;
    if FOriginalWidth < 1 then
      FOriginalWidth := 1;
    RecalcAbsolute;
  end;
end;

procedure TScaledLayout.SetHeight(const Value: Single);
begin
  inherited;
  if (csDesigning in ComponentState) then
    OriginalHeight := Height
  else
    RecalcAbsolute;
end;

procedure TScaledLayout.SetWidth(const Value: Single);
begin
  inherited;
  if (csDesigning in ComponentState) then
    OriginalWidth := Width
  else
    RecalcAbsolute;
end;

{ TVertScrollBox }

constructor TVertScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  FStyleLookup := 'scrollboxstyle';
end;

function TVertScrollBox.GetContentBounds: TRectF;
var
  i: Integer;
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    FContent.Width := ContentLayout.Width;
  end;
  Result := inherited GetContentBounds;
end;

{ TFramedVertScrollBox }

constructor TFramedVertScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  FStyleLookup := 'framedscrollboxstyle';
end;

initialization
  RegisterFmxClasses([TLayout, TScaledLayout, TGridLayout, TScrollBox, TVertScrollBox,
    TFramedScrollBox, TFramedVertScrollBox]);
end.
