{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Layers3D;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Types3D, FMX_Layouts, FMX_Video, FMX_Objects;

type

{ TAbstractLayer3D }

  TAbstractLayer3D = class(TControl3D, IAlignableObject, IAlignRoot)
  private
    FPlane: TMeshData;
    FOnLayerMouseMove: TMouseMoveEvent;
    FOnLayerMouseDown: TMouseEvent;
    FOnLayerMouseUp: TMouseEvent;
    FDisableLayerEvent: Boolean;
    FAlign: TAlignLayout;
    FAnchors: TAnchors;
    FPadding: TBounds;
    FMargins: TBounds;
    FModulationColor: TAlphaColor;
    FResolution: Integer;
    FLayerWidth, FLayerHeight: Integer;
    FLastWidth, FLastHeight: single;
    procedure MarginsChanged(Sender: TObject); virtual;
    procedure PaddingChanged(Sender: TObject); virtual;
    procedure SetResolution(const Value: Integer);
    procedure SetModulationColor(const Value: TAlphaColor);
    function IsAnchorsStored: Boolean;
  protected
    procedure MouseMove3D(Shift: TShiftState; X, Y: Single; rayPos, rayDir: TVector3D); override;
    procedure MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single;
      rayPos, rayDir: TVector3D); override;
    procedure MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single;
      rayPos, rayDir: TVector3D); override;
    procedure Apply; override;
    procedure Render; override;
    procedure Resize3D; override;
    procedure SetDepth(const Value: Single); override;
    procedure SetProjection(const Value: TProjection); override;
    { Layer }
    procedure LayerMouseMove(Shift: TShiftState; X, Y: Single); virtual;
    procedure LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure LayerResized; virtual;
    { IAlignRoot }
    procedure Realign; virtual;
    { IAlignableObject }
    function GetAlign: TAlignLayout;
    procedure SetAlign(const Value: TAlignLayout); virtual;
    function GetAnchors: TAnchors;
    procedure SetAnchors(const Value: TAnchors); virtual;
    function GetPadding: TBounds;
    procedure SetBounds(X, Y, AWidth, AHeight: Single);
    function GetWidth: single;
    function GetHeight: single;
    function GetLeft: single;
    function GetTop: single;
    function GetAllowAlign: Boolean;
    { }
    procedure Loaded; override;
    { Layer }
    property LayerWidth: Integer read FLayerWidth;
    property LayerHeight: Integer read FLayerHeight;
    property Resolution: Integer read FResolution write SetResolution;
    {Hiden property RAID 295966}
    property Anchors: TAnchors read FAnchors write SetAnchors stored IsAnchorsStored default [TAnchorKind.akLeft, TAnchorKind.akTop];
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const rayPos, rayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
    property ModulationColor: TAlphaColor read FModulationColor write SetModulationColor default TAlphaColors.White;
  published
    property Align: TAlignLayout read FAlign write SetAlign default TAlignLayout.alNone;
//    property Anchors: TAnchors read FAnchors write SetAnchors stored IsAnchorsStored default [TAnchorKind.akLeft, TAnchorKind.akTop];
    property Margins: TBounds read FMargins write FMargins;
    property Padding: TBounds read FPadding write FPadding;
    property TwoSide default True;
    property OnLayerMouseMove: TMouseMoveEvent read FOnLayerMouseMove write FOnLayerMouseMove;
    property OnLayerMouseDown: TMouseEvent read FOnLayerMouseDown write FOnLayerMouseDown;
    property OnLayerMouseUp: TMouseEvent read FOnLayerMouseUp write FOnLayerMouseUp;
  end;

{ TLayout3D }

  TLayout3D = class(TAbstractLayer3D)
  protected
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

{ TImage3D }

  TImage3D = class(TAbstractLayer3D)
  private
    FBitmap: TBitmap;
    procedure SetBitmap(const Value: TBitmap);
  protected
    procedure DoBitmapChanged(Sender: TObject);
    procedure Apply; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Bitmap: TBitmap read FBitmap write SetBitmap;
  end;

{ TCustomBufferLayer3D }

  TCustomBufferLayer3D = class(TAbstractLayer3D)
  private
    FOnUpdateBuffer: TNotifyEvent;
  protected
    FBuffer: TBitmap;
    procedure Apply; override;
    function GetBitmap: TBitmap; virtual;
    { Layer }
    procedure LayerResized; override;
    { BufferLayer }
    procedure DoUpdateBuffer; virtual;
    property OnUpdateBuffer: TNotifyEvent read FOnUpdateBuffer write FOnUpdateBuffer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Buffer: TBitmap read FBuffer;
  end;

{ TBufferLayer3D }

  TBufferLayer3D = class(TCustomBufferLayer3D)
  published
    property OnUpdateBuffer;
    property Resolution;
  end;

{ TCustomLayer3D }

  TCustomLayer3D = class(TCustomBufferLayer3D, IScene, IContainerObject)
  private
    FDisableUpdate: Boolean;
    FMousePos, FDownPos: TPointF;
    FResizeSize, FResizePos, FResizeStartPos, FDownSize: TPointF;
    FDragging, FResizing: Boolean;
    FFill: TBrush;
    FTransparency: Boolean;
    FDrawing: Boolean;
    FStyleBook: TStyleBook;
    FActiveControl: TStyledControl;
    FAnimatedCaret: Boolean;
    FStyleLookup: WideString;
    FNeedStyleLookup: Boolean;
    FResourceLink: TControl;
    FOnPaint: TOnPaintEvent;
    procedure SetActiveControl(AControl: TStyledControl);
    procedure SetFill(const Value: TBrush);
    procedure FillChanged(Sender: TObject);
    { IScene }
    function GetCanvas: TCanvas;
    function GetComponent: TComponent;
    function GetUpdateRectsCount: Integer;
    function GetUpdateRect(const Index: Integer): TRectF;
    function GetCaptured: IControl;
    procedure SetCaptured(const Value: IControl);
    function GetFocused: IControl;
    procedure SetFocused(const Value: IControl);
    function GetMousePos: TPointF;
    procedure BeginDrag;
    procedure BeginResize;
    function GetTransparency: Boolean;
    function GetStyleBook: TStyleBook;
    function LocalToScreen(P: TPointF): TPointF;
    function ScreenToLocal(P: TPointF): TPointF;
    function GetActiveControl: TStyledControl;
    procedure SetStyleBook(const Value: TStyleBook);
    function GetAnimatedCaret: Boolean;
    { IContainerObject }
    function GetContainerWidth: Single;
    function GetContainerHeight: Single;
    procedure SetStyleLookup(const Value: WideString);
  protected
    FUpdateRects: array of TRectF;
    procedure LayerResized; override;
    procedure DoUpdateBuffer; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function ObjectAtPoint(P: TPointF): IControl; override;
    function FindTarget(P: TPointF; const Data: TDragObject): IControl; override;
    procedure SetVisible(const Value: Boolean); override;
    { resources }
    procedure ApplyStyleLookup; virtual;
    function GetStyleObject: TControl;
    procedure DoPaint(const Canvas: TCanvas; const ARect: TRectF); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateStyle;
    procedure Invalidate;
    { children }
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    { paint }
    procedure AddUpdateRect(R: TRectF);
    { }
    property Canvas: TCanvas read GetCanvas;
  published
    property ActiveControl: TStyledControl read FActiveControl write SetActiveControl;
    property AnimatedCaret: Boolean read FAnimatedCaret write FAnimatedCaret default True;
    property Fill: TBrush read FFill write SetFill;
    property StyleLookup: WideString read FStyleLookup write SetStyleLookup;
    property StyleBook: TStyleBook read FStyleBook write SetStyleBook;
    property Transparency: Boolean read FTransparency write FTransparency default False;
    property OnPaint: TOnPaintEvent read FOnPaint write FOnPaint;
  end;

{ TLayer3D }

  TLayer3D = class(TCustomLayer3D)
  published
    property Fill;
    property StyleBook;
  end;

{ TTextLayer3D }

  TTextLayer3D = class(TCustomLayer3D)
  private
    FText: TText;
    function GetText: WideString;
    procedure SetText(const Value: WideString);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
    function GetBrush: TBrush;
    procedure SetBrush(const Value: TBrush);
  protected
    procedure ApplyStyleLookup; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Font: TFont read GetFont write SetFont;
    property Fill: TBrush read GetBrush write SetBrush;
    property Text: WideString read GetText write SetText;
    property HitTest default False;
    property ZWrite default False;
  end;

implementation

uses Math, TypInfo, SysUtils, FMX_Forms;

{ TAbstractLayer3D }

constructor TAbstractLayer3D.Create(AOwner: TComponent);
begin
  inherited;
  FResolution := 50;
  FModulationColor := $FFFFFFFF;
  FMargins := TBounds.Create(RectF(0, 0, 0, 0));
  FMargins.OnChange := MarginsChanged;
  FPadding := TBounds.Create(RectF(0, 0, 0, 0));
  FPadding.OnChange := PaddingChanged;
  FPlane := TMeshData.Create;
  FPlane.VertexBuffer.Length := 4;
  FPlane.VertexBuffer.Vertices[0] := Point3D(-0.5, -0.5, 1);
  FPlane.VertexBuffer.TexCoord0[0] := PointF(0, 0);
  FPlane.VertexBuffer.Vertices[1] := Point3D(0.5, -0.5, 1);
  FPlane.VertexBuffer.TexCoord0[1] := PointF(1, 0);
  FPlane.VertexBuffer.Vertices[2] := Point3D(0.5, 0.5, 1);
  FPlane.VertexBuffer.TexCoord0[2] := PointF(1, 1);
  FPlane.VertexBuffer.Vertices[3] := Point3D(-0.5, 0.5, 1);
  FPlane.VertexBuffer.TexCoord0[3] := PointF(0, 1);

  FPlane.IndexBuffer.Length := 6;
  FPlane.IndexBuffer[0] := 0;
  FPlane.IndexBuffer[1] := 1;
  FPlane.IndexBuffer[2] := 3;
  FPlane.IndexBuffer[3] := 3;
  FPlane.IndexBuffer[4] := 1;
  FPlane.IndexBuffer[5] := 2;
  SetSize(5, 4, 0.01);
  TwoSide := True;
end;

destructor TAbstractLayer3D.Destroy;
begin
  FreeAndNil(FPlane);
  FMargins.Free;
  FPadding.Free;
  inherited;
end;

procedure TAbstractLayer3D.Realign;
begin
  if csDestroying in ComponentState then
    Exit;
  if (Abs(FLayerWidth) < 1) or (Abs(FLayerHeight) < 1) then
    Exit;
  if FChildren = nil then
    Exit;
  if FChildren.Count = 0 then
    Exit;
  if FDisableAlign then
    Exit;
  AlignObjects(Self, FMargins, FLayerWidth, FLayerHeight, FLastWidth, FLastHeight, FDisableAlign);
end;

function TAbstractLayer3D.IsAnchorsStored: Boolean;
begin
  Result := Anchors <> AnchorAlign[Align];
end;

procedure TAbstractLayer3D.Apply;
begin
  inherited;
  Context.SetColor(TMaterialColor.mcDiffuse, FModulationColor);
  Context.SetContextState(TContextState.csTexDisable);
  Context.SetContextState(TContextState.csLightOff);
end;

procedure TAbstractLayer3D.Render;
var
  Offset: TPoint3D;
  M: TMatrix3D;
begin
  if Projection = TProjection.pjCamera then
    Context.FillMesh(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), FPlane, AbsoluteOpacity)
  else
  begin
    M := AbsoluteMatrix;
    Offset := Point3D(Context.PixelToPixelPolygonOffset.X, Context.PixelToPixelPolygonOffset.Y, 0);
    M.m41 := trunc(M.m41);
    M.m42 := trunc(M.m42);
    Context.SetMatrix(M);
    Context.FillMesh(Vector3D(Offset.X + frac(FWidth / 2), Offset.Y + frac(FHeight / 2), 0), Vector3D(FWidth, FHeight, FDepth), FPlane, AbsoluteOpacity);
  end;
end;

function TAbstractLayer3D.RayCastIntersect(const rayPos, rayDir: TVector3D;
  var Intersection: TVector3D): Boolean;
var
  IP: TVector3D;
begin
  Result := inherited;
end;

procedure TAbstractLayer3D.MouseMove3D(Shift: TShiftState;
  X, Y: Single; rayPos, rayDir: TVector3D);
var
  P3, rPos, rDir: TVector3D;
begin
  FDisableLayerEvent := True;
  try
    inherited;
  finally
    FDisableLayerEvent := False;
  end;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.X + (Width / 2)) / Width) * FLayerWidth);
    Y := (((P3.Y + (Height / 2)) / Height) * FLayerHeight);
  end
  else
    Exit;
  LayerMouseMove(Shift, X, Y);
end;

procedure TAbstractLayer3D.MouseDown3D(Button: TMouseButton;
  Shift: TShiftState; X, Y: Single; rayPos, rayDir: TVector3D);
var
  P3, rPos, rDir: TVector3D;
begin
  FDisableLayerEvent := True;
  try
    inherited;
  finally
    FDisableLayerEvent := False;
  end;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.X + (Width / 2)) / Width) * FLayerWidth);
    Y := (((P3.Y + (Height / 2)) / Height) * FLayerHeight);
  end
  else
    Exit;
  LayerMouseDown(Button, Shift, X, Y);
end;

procedure TAbstractLayer3D.MouseUp3D(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single; rayPos, rayDir: TVector3D);
var
  P3, rPos, rDir: TVector3D;
begin
  FDisableLayerEvent := True;
  try
    inherited;
  finally
    FDisableLayerEvent := False;
  end;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.X + (Width / 2)) / Width) * FLayerWidth);
    Y := (((P3.Y + (Height / 2)) / Height) * FLayerHeight);
  end
  else
    Exit;
  LayerMouseUp(Button, Shift, X, Y);
end;

procedure TAbstractLayer3D.LayerMouseMove(Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FOnLayerMouseMove) then
    FOnLayerMouseMove(Self, Shift, trunc(X), trunc(Y));
end;

procedure TAbstractLayer3D.LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FOnLayerMouseDown) then
    FOnLayerMouseDown(Self, Button, Shift, trunc(X), trunc(Y));
end;

procedure TAbstractLayer3D.LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FOnLayerMouseUp) then
    FOnLayerMouseUp(Self, Button, Shift, trunc(X), trunc(Y));
end;

procedure TAbstractLayer3D.SetAlign(const Value: TAlignLayout);
var
  AlignRoot: IAlignRoot;
begin
  if FAlign <> Value then
  begin
    FAlign := Value;
    if Projection <> TProjection.pjScreen then
      FAlign := TAlignLayout.alNone;
    if (FAlign <> TAlignLayout.alNone) and not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
      AlignRoot.Realign;
  end;
end;

procedure TAbstractLayer3D.SetAnchors(const Value: TAnchors);
begin
  if FAnchors <> Value then
  begin
    FAnchors := Value;
{    if (FParent <> nil) and (FParent is TControl) and (FAnchors <> [akLeft, akTop]) then
    begin
      TControl(FParent).FNeedAlign := True;
    end;}
  end;
end;

procedure TAbstractLayer3D.SetDepth(const Value: Single);
begin
  inherited SetDepth(0.01);
end;

function TAbstractLayer3D.GetAlign: TAlignLayout;
begin
  Result := FAlign;
end;

function TAbstractLayer3D.GetAllowAlign: Boolean;
begin
  Result := (Projection = TProjection.pjScreen) and Visible;
end;

function TAbstractLayer3D.GetAnchors: TAnchors;
begin
  Result := FAnchors;
end;

function TAbstractLayer3D.GetHeight: single;
begin
  Result := FHeight;
end;

function TAbstractLayer3D.GetPadding: TBounds;
begin
  Result := FPadding;
end;

function TAbstractLayer3D.GetLeft: single;
begin
  Result := Position.X - (Width / 2);
  if Parent is TAbstractLayer3D then
    Result := Result + TAbstractLayer3D(Parent).FLayerWidth / 2;
end;

function TAbstractLayer3D.GetTop: single;
begin
  Result := Position.Y - (Height / 2);
  if Parent is TAbstractLayer3D then
    Result := Result + TAbstractLayer3D(Parent).FLayerHeight / 2;
end;

function TAbstractLayer3D.GetWidth: single;
begin
  Result := Width;
end;

procedure TAbstractLayer3D.SetBounds(X, Y, AWidth, AHeight: Single);
begin
  if Parent is TAbstractLayer3D then
  begin
    Position.X := X + (AWidth / 2) - TAbstractLayer3D(Parent).FLayerWidth / 2;
    Position.Y := Y + (AHeight / 2) - TAbstractLayer3D(Parent).FLayerHeight / 2;
  end
  else
  begin
    Position.X := X + (AWidth / 2);
    Position.Y := Y + (AHeight / 2);
  end;
  SetSize(AWidth, AHeight, Depth);
end;

procedure TAbstractLayer3D.LayerResized;
begin
  Realign;
end;

procedure TAbstractLayer3D.Loaded;
begin
  inherited;
  Resize3D;
end;

procedure TAbstractLayer3D.Resize3D;
var
  AlignRoot: IAlignRoot;
begin
  inherited;
  if (csLoading in ComponentState) then Exit;
  if Projection = TProjection.pjCamera then
  begin
    FLayerWidth := Round(Width * FResolution);
    FLayerHeight := Round(Height * FResolution);
  end
  else
  begin
    FLayerHeight := Round(Height);
    FLayerWidth := Round(Width);
  end;
  if (FLayerWidth > 0) and (FLayerHeight > 0) then
    LayerResized;
  if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
    AlignRoot.Realign;
end;

procedure TAbstractLayer3D.PaddingChanged(Sender: TObject);
var
  AlignRoot: IAlignRoot;
begin
  if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
    AlignRoot.Realign;
end;

procedure TAbstractLayer3D.MarginsChanged(Sender: TObject);
begin
  Realign;
end;

procedure TAbstractLayer3D.SetResolution(const Value: Integer);
begin
  if FResolution <> Value then
  begin
    FResolution := Value;
    if FResolution < 1 then
      FResolution := 1;
    if FResolution > 256 then
      FResolution := 256;
    Resize3D;
  end;
end;

procedure TAbstractLayer3D.SetModulationColor(const Value: TAlphaColor);
begin
  if FModulationColor <> Value then
  begin
    FModulationColor := Value;
    Repaint;
  end;
end;

procedure TAbstractLayer3D.SetProjection(const Value: TProjection);
var
  i: Integer;
begin
  if Value <> Projection then
  begin
    FProjection := Value;
    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
        if (Children[i] is TControl3D) then
          TControl3D(FChildren[i]).Projection := Value;
    if not (csLoading in ComponentState) then
    begin
      if FProjection = TProjection.pjScreen then
      begin
        SetSize(FLayerWidth, FLayerHeight, Depth);
        if (FViewport <> nil) and (FViewport.Context <> nil) then
          Position.Point := Point3D(FViewport.Context.Width / 2, FViewport.Context.Height / 2, 0);
      end
      else
      begin
        if FResolution > 0 then
          SetSize(FLayerWidth / FResolution, FLayerHeight / FResolution, Depth);
        Position.Point := Point3D(0, 0, 0);
      end;
      Repaint;
    end;
  end;
end;

{ TLayout3D }

constructor TLayout3D.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TLayout3D.Destroy;
begin
  inherited;
end;

procedure TLayout3D.Render;
begin
end;

{ TImage3D }

constructor TImage3D.Create(AOwner: TComponent);
begin
  inherited;
  FBitmap := TBitmap.Create(0, 0);
  FBitmap.OnChange := DoBitmapChanged;
end;

destructor TImage3D.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TImage3D.DoBitmapChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TImage3D.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TImage3D.Apply;
var
  B: TBitmap;
begin
  inherited ;
  B := FBitmap;
  if FBitmap.ResourceBitmap <> nil then
    B := FBitmap.ResourceBitmap;
  if not B.IsEmpty then
  begin
    Context.SetContextState(TContextState.csTexLinear);
    Context.SetContextState(TContextState.csTexModulate);
    Context.SetTextureUnit(0, B);
  end;
end;

{ TCustomBufferLayer3D }

constructor TCustomBufferLayer3D.Create(AOwner: TComponent);
begin
  inherited;
  FBuffer := TBitmap.Create(FLayerWidth, FLayerHeight);
end;

destructor TCustomBufferLayer3D.Destroy;
begin
  FreeAndNil(FBuffer);
  inherited;
end;

procedure TCustomBufferLayer3D.DoUpdateBuffer;
begin
  if (FBuffer <> nil) and Assigned(FOnUpdateBuffer) then
    FOnUpdateBuffer(Self);
end;

procedure TCustomBufferLayer3D.Apply;
begin
  inherited;
  DoUpdateBuffer;
  Context.SetContextState(TContextState.csTexLinear);
  Context.SetContextState(TContextState.csTexModulate);
  Context.SetTextureUnit(0, FBuffer);
end;

function TCustomBufferLayer3D.GetBitmap: TBitmap;
begin
  Result := FBuffer;
end;

procedure TCustomBufferLayer3D.LayerResized;
begin
  inherited ;
  if FBuffer <> nil then
    FBuffer.SetSize(FLayerWidth, FLayerHeight);
end;

{ TCustomLayer3D }

type
  TOpenControl = class(TControl);

constructor TCustomLayer3D.Create(AOwner: TComponent);
begin
  inherited;
  AddScene(Self);
  FStyleLookup := 'backgroundstyle';
  FNeedStyleLookup := True;
  FAnimatedCaret := True;
  ShowHint := True;
  DisableDragHighlight := True;
  Width := 8;
  Depth := 8;
  AutoCapture := True;
  FDesignInteract := True;
  FFill := TBrush.Create(TBrushKind.bkNone, TAlphaColors.White);
  FFill.OnChanged := FillChanged;
end;

destructor TCustomLayer3D.Destroy;
begin
  DeleteChildren;
  if FChildren <> nil then
    FreeAndNil(FChildren);
  FreeAndNil(FFill);
  RemoveScene(Self);
  inherited;
end;

procedure TCustomLayer3D.AddUpdateRect(R: TRectF);
begin
  if FDisableUpdate then
    Exit;
  if csDestroying in ComponentState then
    Exit;

  R := RectF(trunc(R.Left), trunc(R.Top), trunc(R.Right) + 1,
    trunc(R.Bottom) + 1);
  if not IntersectRect(R, RectF(0, 0, FLayerWidth, FLayerHeight)) then
    Exit;

  SetLength(FUpdateRects, Length(FUpdateRects) + 1);
  FUpdateRects[High(FUpdateRects)] := R;
  Repaint;
end;

procedure TCustomLayer3D.LayerResized;
begin
  inherited;
  AddUpdateRect(RectF(0, 0, FLayerWidth, FLayerHeight));
end;

procedure TCustomLayer3D.DoPaint(const Canvas: TCanvas; const ARect: TRectF);
begin
  if Assigned(FOnPaint) then
    FOnPaint(Self, Canvas, ARect);
end;

procedure TCustomLayer3D.DoUpdateBuffer;
var
  i, j: Integer;
  R: TRectF;
  CallOnPaint, AllowPaint: Boolean;
  State: Pointer;
begin
  inherited ;
  if FDrawing then Exit;
  if Length(FUpdateRects) > 0 then
  begin
    FDrawing := True;
    try
      ApplyStyleLookup;
      { Split rects if rects too more }
      if (Length(FUpdateRects) > 20) then
      begin
        for i := 1 to High(FUpdateRects) do
          FUpdateRects[0] := UnionRect(FUpdateRects[0], FUpdateRects[i]);
        SetLength(FUpdateRects, 1);
      end;
      if Canvas.BeginScene(@FUpdateRects) then
      try
          if (FFill.Kind = TBrushKind.bkNone) or
             ((FFill.Color and $FF000000 = 0) and (FFill.Kind = TBrushKind.bkSolid)) then
          begin
            for i := 0 to High(FUpdateRects) do
            begin
              if Transparency then
                Canvas.ClearRect(FUpdateRects[i], 0)
              else
                Canvas.ClearRect(FUpdateRects[i], FFill.Color and $FFFFFF);
            end;
          end
          else
          begin
            Canvas.Fill.Assign(FFill);
            Canvas.FillRect(RectF(-1, -1, LayerWidth + 1, LayerHeight + 1), 0, 0, AllCorners, 1);
          end;
          { reset }
          Canvas.StrokeThickness := 1;
          Canvas.StrokeCap := TStrokeCap.scFlat;
          Canvas.StrokeJoin := TStrokeJoin.sjMiter;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
          Canvas.Stroke.Kind := TBrushKind.bkSolid;
          Canvas.Fill.Kind := TBrushKind.bkSolid;
          { Children }
          CallOnPaint := False;
          for i := 0 to ChildrenCount - 1 do
            if (Children[i] is TControl) and
              ((TControl(FChildren[i]).Visible) or (not TControl(FChildren[i]).Visible and
              (csDesigning in ComponentState) and not TControl(FChildren[i]).Locked)) then
              with TOpenControl(FChildren[i]) do
              begin
                if (csDesigning in ComponentState) and not DesignVisible then
                  Continue;
                if (RectWidth(UpdateRect) = 0) or (RectHeight(UpdateRect) = 0) then
                  Continue;
                if (Self.Children[i] = FResourceLink) then
                begin
                  if Self.Transparency then Continue;
                  if (Self.Fill.Kind <> TBrushKind.bkNone) then Continue;
                  if (Self.Fill.Kind = TBrushKind.bkSolid) and (Self.Fill.Color <> Fill.DefaultColor) then Continue;
                end;

                AllowPaint := False;
                if (csDesigning in ComponentState) or InPaintTo then
                  AllowPaint := True;
                if not AllowPaint then
                begin
                  R := UnionRect(ChildrenRect, UpdateRect);
                  for j := 0 to High(FUpdateRects) do
                    if IntersectRect(FUpdateRects[j], R) then
                    begin
                      AllowPaint := True;
                      Break;
                    end;
                end;
                if AllowPaint then
                begin
                  if not HasAfterPaintEffect then
                    ApplyEffect;
                  Painting;
                  DoPaint;
                  AfterPaint;
                  if HasAfterPaintEffect then
                    ApplyEffect;
                end;
                { Call OnPaint after style painted }
                if (Self.Children[i] = FResourceLink) then
                begin
                  Self.Canvas.SetMatrix(IdentityMatrix);
                  Self.DoPaint(Self.Canvas, RectF(0, 0, LayerWidth, LayerHeight));
                  CallOnPaint := True;
                end;
              end;
          { Call OnPaint if style not loaded }
          if not CallOnPaint then
          begin
            Canvas.SetMatrix(IdentityMatrix);
            DoPaint(Canvas, RectF(0, 0, LayerWidth, LayerHeight));
          end;
      finally
        Canvas.EndScene;
      end;
    finally
      SetLength(FUpdateRects, 0);
      FDrawing := False;
    end;
  end;
end;

procedure TCustomLayer3D.AddObject(AObject: TFmxObject);
begin
  inherited AddObject(AObject);
  if (AObject is TControl) then
    TControl(AObject).SetNewScene(Self);
  if (AObject is TControl) then
  begin
    TControl(AObject).RecalcOpacity;
    TControl(AObject).RecalcAbsolute;
    TControl(AObject).RecalcUpdateRect;
    if (TControl(AObject).Align <> TAlignLayout.alNone) then
      Realign
    else
      Invalidate;
  end;
end;

procedure TCustomLayer3D.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if (AObject is TControl) then
    TControl(AObject).SetNewScene(nil);
end;

procedure TCustomLayer3D.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FStyleBook) then
    StyleBook := nil;
end;

function TCustomLayer3D.ObjectAtPoint(P: TPointF): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
  IP, rPos, rDir: TVector3D;
  VP: TPointF;
begin
  Result := nil;
  if (Context <> nil) and (GlobalProjection = Projection) then
  begin
    VP := P;
    if FViewport <> nil then
      VP := FViewport.ScreenToLocal(VP);
    Context.Pick(VP.X, VP.Y, FProjection, rPos, rDir);
    if CheckHitTest(HitTest) and RayCastIntersect(AbsoluteToLocalVector(rPos), Vector3DNormalize(AbsoluteToLocalVector(rDir)), IP) then
    begin
      if (Projection = TProjection.pjScreen) and (Vector3DLength(Vector3DSubtract(IP, rPos)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, rPos));
        Result := Self;
      end;
      if (Projection = TProjection.pjCamera) and (Context.CurrentCamera <> nil) and
        (Vector3DLength(Vector3DSubtract(IP, Context.CurrentCamera.AbsolutePosition)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, Context.CurrentCamera.AbsolutePosition));
        Result := Self;
      end;
    end;
  end;
  if Result <> nil then
  begin
    for i := ChildrenCount - 1 downto 0 do
    begin
      Obj := Children[i];
      if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.GetVisible and not(csDesigning in ComponentState) then
        Continue;
      NewObj := NewObj.ObjectAtPoint(P);
      if NewObj <> nil then
      begin
        Result := NewObj;
        Exit;
      end;
    end;
  end;
end;

procedure TCustomLayer3D.SetFill(const Value: TBrush);
begin
  FFill.Assign(Value);
end;

procedure TCustomLayer3D.FillChanged(Sender: TObject);
begin
  SetLength(FUpdateRects, 0);
  AddUpdateRect(RectF(0, 0, FLayerWidth, FLayerHeight));
end;

function TCustomLayer3D.GetActiveControl: TStyledControl;
begin
  Result := FActiveControl;
end;

function TCustomLayer3D.GetCanvas: TCanvas;
begin
  Result := FBuffer.Canvas;
end;

function TCustomLayer3D.GetComponent: TComponent;
begin
  Result := Self;
end;

function TCustomLayer3D.GetContainerHeight: Single;
begin
  Result := LayerHeight;
end;

function TCustomLayer3D.GetContainerWidth: Single;
begin
  Result := LayerWidth;
end;

function TCustomLayer3D.GetUpdateRectsCount: Integer;
begin
  Result := Length(FUpdateRects);
end;

procedure TCustomLayer3D.Invalidate;
begin
  AddUpdateRect(RectF(0, 0, FLayerWidth, FLayerHeight));
end;

function TCustomLayer3D.GetUpdateRect(const Index: Integer): TRectF;
begin
  Result := FUpdateRects[Index];
end;

function TCustomLayer3D.GetCaptured: IControl;
begin
  if (Root <> nil) then
    Result := Root.GetCaptured
  else
    Result := nil;
end;

procedure TCustomLayer3D.SetCaptured(const Value: IControl);
begin
  if (Root <> nil) then
    Root.SetCaptured(Value);
end;

function TCustomLayer3D.GetFocused: IControl;
begin
  if (Root <> nil) then
    Result := Root.GetFocused
  else
    Result := nil;
end;

procedure TCustomLayer3D.SetFocused(const Value: IControl);
begin
  if (Root <> nil) then
    Root.SetFocused(Value);
end;

function TCustomLayer3D.GetMousePos: TPointF;
begin
  Result := FMousePos;
end;

function TCustomLayer3D.GetStyleObject: TControl;
var
  Obj: TFmxObject;
  ResourceObject: TControl;
  S: TStream;
  StyleName: WideString;
begin
  ResourceObject := nil;
  if (FStyleLookup <> '') then
  begin
    { style }
    Obj := TControl(FindStyleResource(FStyleLookup));
    if Obj = nil then
      if Application.DefaultStyles <> nil then
        Obj := TControl(Application.DefaultStyles.FindStyleResource(FStyleLookup));
    if Obj = nil then
      Obj := FMX_Types.FindStyleResource(FStyleLookup);
    if (Obj <> nil) and (Obj is TControl) then
    begin
      ResourceObject := TControl(Obj.Clone(nil));
      ResourceObject.StyleName := '';
    end;
  end;
  if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
  begin
    if FStyleLookup <> '' then
    begin
      StyleName := FStyleLookup;
      ResourceObject := TControl(FindStyleResource(StyleName));
      if ResourceObject <> nil then
        ResourceObject := TControl(ResourceObject.Clone(nil));
    end;
    if ResourceObject = nil then
    begin
      StyleName := ClassName + 'style';
      Delete(StyleName, 1, 1); // just remove T
      ResourceObject := TControl(FindStyleResource(StyleName));
      if ResourceObject <> nil then
        ResourceObject := TControl(ResourceObject.Clone(nil))
    end;
    if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
    begin
      if FStyleLookup <> '' then
      begin
        StyleName := FStyleLookup;
        ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
        if ResourceObject <> nil then
          ResourceObject := TControl(ResourceObject.Clone(nil));
      end;
      if ResourceObject = nil then
      begin
        StyleName := ClassName + 'style';
        Delete(StyleName, 1, 1); // just remove T
        ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
        if ResourceObject <> nil then
          ResourceObject := TControl(ResourceObject.Clone(nil))
        else
        begin
          // try parent Class
          StyleName := ClassParent.ClassName + 'style';
          Delete(StyleName, 1, 1); // just remove T
          ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
          if ResourceObject <> nil then
            ResourceObject := TControl(ResourceObject.Clone(nil));
        end;
      end;
    end;
  end;
  Result := ResourceObject;
end;

procedure TCustomLayer3D.ApplyStyleLookup;
var
  ResourceObject: TControl;
begin
  if FNeedStyleLookup then
  begin
    FNeedStyleLookup := False;
    ResourceObject := GetStyleObject;
    if ResourceObject <> nil then
    begin
      if FResourceLink <> nil then
      begin
        FResourceLink.Free;
        FResourceLink := nil;
      end;
      ResourceObject.Align := TAlignLayout.alContents;
      ResourceObject.DesignVisible := True;
      FResourceLink := ResourceObject;
      AddObject(ResourceObject);
      { bring to front }
      FChildren.Remove(ResourceObject);
      FChildren.Insert(0, ResourceObject);
      Realign;
      { }
      ResourceObject.Stored := False;
      ResourceObject.Lock;
    end;
  end;
end;

procedure TCustomLayer3D.BeginDrag;
begin
  FDragging := True;
  FDownPos := FMousePos;
  Capture;
end;

procedure TCustomLayer3D.BeginResize;
begin
  FResizing := True;
  FDownPos := FMousePos;
  FResizePos := PointF(Position.X, Position.Y);
  FResizeStartPos := PointF(Round(Position.X - Width / 2), Round(Position.Y - Height / 2));
  FResizeSize := PointF(Width, Height);
  FDownSize := FResizeSize;
  Capture;
end;

function TCustomLayer3D.GetStyleBook: TStyleBook;
begin
  Result := FStyleBook;
end;

function TCustomLayer3D.ScreenToLocal(P: TPointF): TPointF;
var
  P3, RayPos, RayDir: TVector3D;
begin
  if Context = nil then
  begin
    Result := P;
    Exit;
  end;
  if (FViewport <> nil) then
    Result := FViewport.ScreenToLocal(P)
  else
    Result := P;
  Context.Pick(Result.X, Result.Y, Projection, RayPos, RayDir);
  rayPos := AbsoluteToLocalVector(rayPos);
  rayDir := Vector3DNormalize(AbsoluteToLocalVector(rayDir));
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    Result.X := (((P3.X + (Width / 2)) / Width) * FLayerWidth);
    Result.Y := (((P3.Y + (Height / 2)) / Height) * FLayerHeight);
  end
  else
    Result := PointF(-$FFFF, -$FFFF);
end;

function TCustomLayer3D.LocalToScreen(P: TPointF): TPointF;
var
  P3: TPoint3D;
begin
  if Context = nil then
  begin
    Result := P;
    Exit;
  end;
  P3 := Point3D(-(Width / 2) + (P.X / FLayerWidth) * Width, -(Height / 2) + (P.Y / FLayerHeight) * Height, 0);
  P3 := Context.WorldToScreen(Projection, LocalToAbsolute3D(P3));
  Result := PointF(P3.X, P3.Y);
  if (FViewport <> nil) then
    Result := FViewport.LocalToScreen(Result);
end;

function TCustomLayer3D.GetTransparency: Boolean;
begin
  Result := FTransparency;
end;

procedure TCustomLayer3D.UpdateStyle;
var
  i: Integer;
begin
  for i := 0 to ChildrenCount - 1 do
    Children[i].UpdateStyle;
end;

procedure TCustomLayer3D.SetStyleBook(const Value: TStyleBook);
begin
  if FStyleBook <> Value then
  begin
    if FStyleBook <> nil then
      FStyleBook.RemoveSceneUpdater(Self);
    FStyleBook := Value;
    if FStyleBook <> nil then
      FStyleBook.AddSceneUpdater(Self);

    UpdateStyle;
  end;
end;

function TCustomLayer3D.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
  Accept: Boolean;
  LP: TPointF;
begin
  Result := nil;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.Visible then Continue;
    if not NewObj.HitTest then Continue;
    NewObj := NewObj.FindTarget(P, Data);
    if NewObj <> nil then
    begin
      Result := NewObj;
      Exit;
    end;
  end;
end;

procedure TCustomLayer3D.SetVisible(const Value: Boolean);
begin
  inherited SetVisible(Value);
  if Visible then
    AddUpdateRect(RectF(0, 0, FLayerWidth, FLayerHeight));
end;

procedure TCustomLayer3D.SetActiveControl(AControl: TStyledControl);
begin
  if AControl <> FActiveControl then
  begin
    FActiveControl := AControl;
    if (FActiveControl <> nil) and not(csLoading in ComponentState) then
      FActiveControl.SetFocus;
  end;
end;

procedure TCustomLayer3D.SetStyleLookup(const Value: WideString);
begin
  FStyleLookup := Value;
  FNeedStyleLookup := True;
  if not (csLoading in ComponentState) then
  begin
    ApplyStyleLookup;
  end;
end;

function TCustomLayer3D.GetAnimatedCaret: Boolean;
begin
  Result := FAnimatedCaret;
end;

{ TTextLayer3D }

constructor TTextLayer3D.Create(AOwner: TComponent);
begin
  inherited;
  ZWrite := False;
  HitTest := False;
  FText := TText.Create(Self);
  FText.Locked := True;
  FText.Stored := False;
  FText.Align := TAlignLayout.alContents;
  FText.Parent := Self;
end;

procedure TTextLayer3D.ApplyStyleLookup;
begin
end;

function TTextLayer3D.GetBrush: TBrush;
begin
  Result := FText.Fill;
end;

function TTextLayer3D.GetFont: TFont;
begin
  Result := FText.Font;
end;

function TTextLayer3D.GetText: WideString;
begin
  Result := FText.Text;
end;

procedure TTextLayer3D.SetBrush(const Value: TBrush);
begin
  FText.Fill.Assign(Value);
end;

procedure TTextLayer3D.SetFont(const Value: TFont);
begin
  FText.Font.Assign(Value);
end;

procedure TTextLayer3D.SetText(const Value: WideString);
begin
  FText.Text := Value;
end;

initialization
  RegisterFmxClasses([TLayout3D, TImage3D, TBufferLayer3D, TLayer3D, TTextLayer3D]);
end.
