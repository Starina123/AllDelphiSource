{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Objects3D;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Objects, FMX_Types3D, FMX_Video;

{$SCOPEDENUMS ON}

type

{ TGrid3D }

  TGrid3D = class(TControl3D)
  private
    FLineColor: TAlphaColor;
    FFrequency: Single;
    FMarks: Single;
    procedure SetLineColor(const Value: TAlphaColor);
    function GetLineColor: TAlphaColor;
    procedure SetFrequency(const Value: Single);
    procedure SetMarks(const Value: Single);
  protected
    procedure SetDepth(const Value: Single); override;
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property Marks: Single read FMarks write SetMarks;
    property Frequency: Single read FFrequency write SetFrequency;
    property LineColor: TAlphaColor read GetLineColor write SetLineColor;
  end;

{ TShape3D }

  TShape3D = class(TControl3D)
  private
    FMaterial: TMaterial;
    procedure SetMaterial(const Value: TMaterial);
  protected
    procedure MaterialChanged(Sender: TObject);
    procedure Apply; override;
    procedure UnApply; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Material: TMaterial read FMaterial write SetMaterial;
  end;

{ TStrokeCube }

  TStrokeCube = class(TShape3D)
  protected
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  end;

{ TCustomMesh }

  TCustomMesh = class(TShape3D)
  private
    FData: TMeshData;
    procedure SetData(const Value: TMeshData);
  protected
    procedure DoMeshChanged(Sender: TObject);
    procedure Render; override;
    property Data: TMeshData read FData write SetData;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  end;

{ TCube }

  TCube = class(TCustomMesh)
  private
    FSubdivisionsWidth: Integer;
    FSubdivisionsDepth: Integer;
    FSubdivisionsHeight: Integer;
    procedure SetSubdivisionsDepth(const Value: Integer);
    procedure SetSubdivisionsHeight(const Value: Integer);
    procedure SetSubdivisionsWidth(const Value: Integer);
  protected
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property SubdivisionsDepth: Integer read FSubdivisionsDepth write SetSubdivisionsDepth default 8;
    property SubdivisionsHeight: Integer read FSubdivisionsHeight write SetSubdivisionsHeight default 8;
    property SubdivisionsWidth: Integer read FSubdivisionsWidth write SetSubdivisionsWidth default 8;
  end;

{ TPlane }

  TPlane = class(TCustomMesh)
  private
    FSubdivisionsWidth: Integer;
    FSubdivisionsHeight: Integer;
    procedure SetSubdivisionsHeight(const Value: Integer);
    procedure SetSubdivisionsWidth(const Value: Integer);
  protected
    procedure SetDepth(const Value: Single); override;
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property SubdivisionsHeight: Integer read FSubdivisionsHeight write SetSubdivisionsHeight default 16;
    property SubdivisionsWidth: Integer read FSubdivisionsWidth write SetSubdivisionsWidth default 16;
  end;

{ TDisk }

  TDisk = class(TCustomMesh)
  private
    FSubdivisionsAxes: Integer;
    FSubdivisionsCap: Integer;
    procedure SetSubdivisionsAxes(const Value: Integer);
    procedure SetSubdivisionsCap(const Value: Integer);
  protected
    procedure SetHeight(const Value: Single); override;
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property SubdivisionsAxes: Integer read FSubdivisionsAxes write SetSubdivisionsAxes default 16;
    property SubdivisionsCap: Integer read FSubdivisionsCap write SetSubdivisionsCap default 1;
  end;

{ TMesh }

  TMesh = class(TCustomMesh)
  protected
    procedure Render; override;
  published
    property Data;
  end;

{ TSphere }

  TSphere = class(TCustomMesh)
  private
    FSubdivisionsAxes: Integer;
    FSubdivisionsHeight: Integer;
    procedure SetSubdivisionsAxes(const Value: Integer);
    procedure SetSubdivisionsHeight(const Value: Integer);
  protected
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property SubdivisionsAxes: Integer read FSubdivisionsAxes write SetSubdivisionsAxes default 16;
    property SubdivisionsHeight: Integer read FSubdivisionsHeight write SetSubdivisionsHeight default 12;
  end;

{ TCylinder }

  TCylinder = class(TCustomMesh)
  private
    FSubdivisionsAxes: Integer;
    FSubdivisionsCap: Integer;
    FSubdivisionsHeight: Integer;
    procedure SetSubdivisionsAxes(const Value: Integer);
    procedure SetSubdivisionsCap(const Value: Integer);
    procedure SetSubdivisionsHeight(const Value: Integer);
  protected
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property SubdivisionsAxes: Integer read FSubdivisionsAxes write SetSubdivisionsAxes default 12;
    property SubdivisionsCap: Integer read FSubdivisionsCap write SetSubdivisionsCap default 1;
    property SubdivisionsHeight: Integer read FSubdivisionsHeight write SetSubdivisionsHeight default 1;
  end;

{ TRoundCube }

  TRoundCube = class(TCustomMesh)
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TCone }

  TCone = class(TCustomMesh)
  private
    FSubdivisionsAxes: Integer;
    FSubdivisionsCap: Integer;
    FSubdivisionsHeight: Integer;
    procedure SetSubdivisionsAxes(const Value: Integer);
    procedure SetSubdivisionsCap(const Value: Integer);
    procedure SetSubdivisionsHeight(const Value: Integer);
  protected
    procedure RebuildMesh;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property SubdivisionsAxes: Integer read FSubdivisionsAxes write SetSubdivisionsAxes default 12;
    property SubdivisionsCap: Integer read FSubdivisionsCap write SetSubdivisionsCap default 1;
    property SubdivisionsHeight: Integer read FSubdivisionsHeight write SetSubdivisionsHeight default 1;
  end;

{ Pseudo 3D Objects }

  TExtrudedShapeSide = (esFront, esBack, esShaft);

  TExtrudedShapeSides = set of TExtrudedShapeSide;

{ TExtrudedShape3D }

  TExtrudedShape3D = class(TShape3D)
  private
    FFlatness: Single;
    FSides: TExtrudedShapeSides;
    FMaterialShaft: TMaterial;
    FMaterialBack: TMaterial;
    procedure SetFlatness(const Value: Single);
    procedure SetSides(const Value: TExtrudedShapeSides);
    procedure SetMaterialBack(const Value: TMaterial);
    procedure SetMaterialShaft(const Value: TMaterial);
  protected
    procedure Apply; override;
    procedure Render; override;
    procedure ShapeMouseMove(Shift: TShiftState; X, Y: Single); virtual;
    procedure ShapeMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure ShapeMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
    procedure MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
    procedure MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property Flatness: Single read FFlatness write SetFlatness;
    property Sides: TExtrudedShapeSides read FSides write SetSides;
    property MaterialBack: TMaterial read FMaterialBack write SetMaterialBack;
    property MaterialShaft: TMaterial read FMaterialShaft write SetMaterialShaft;
  end;

{ TRectangle3D }

  TRectangle3D = class(TExtrudedShape3D)
  private
    FYRadius: Single;
    FXRadius: Single;
    FCorners: TCorners;
    FCornerType: TCornerType;
    procedure SetXRadius(const Value: Single);
    procedure SetYRadius(const Value: Single);
    function IsCornersStored: Boolean;
    procedure SetCorners(const Value: TCorners);
    procedure SetCornerType(const Value: TCornerType);
  protected
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property XRadius: Single read FXRadius write SetXRadius;
    property YRadius: Single read FYRadius write SetYRadius;
    property Corners: TCorners read FCorners write SetCorners stored IsCornersStored;
    property CornerType: TCornerType read FCornerType write SetCornerType;
  end;

{ TEllipse3D }

  TEllipse3D = class(TExtrudedShape3D)
  protected
    procedure Render; override;
  end;

{ TText3D }

  TText3D = class(TExtrudedShape3D)
  private
    FFont: TFont;
    FText: WideString;
    FWordWrap: Boolean;
    FStretch: Boolean;
    FVertTextAlign: TTextAlign;
    FHorzTextAlign: TTextAlign;
    procedure SetFont(const Value: TFont);
    procedure SetText(const Value: WideString);
    procedure SetHorzTextAlign(const Value: TTextAlign);
    procedure SetStretch(const Value: Boolean);
    procedure SetVertTextAlign(const Value: TTextAlign);
    procedure SetWordWrap(const Value: Boolean);
  protected
    procedure FontChanged(Sender: TObject);
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetTextBounds: TRectF;
    function GetPathBounds: TRectF;
    function GetPathLength: Single;
  published
    property Font: TFont read FFont write SetFont;
    property HorzTextAlign: TTextAlign read FHorzTextAlign write SetHorzTextAlign default TTextAlign.taCenter;
    property VertTextAlign: TTextAlign read FVertTextAlign write SetVertTextAlign default TTextAlign.taCenter;
    property Text: WideString read FText write SetText;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default True;
  end;

{ TPath3D }

  TPath3D = class(TExtrudedShape3D)
  private
    FPath: TPathData;
    FWrapMode: TPathWrapMode;
    procedure SetPath(const Value: TPathData);
    procedure SetWrapMode(const Value: TPathWrapMode);
  protected
    procedure PathChanged(Sender: TObject);
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Path: TPathData read FPath write SetPath;
    property WrapMode: TPathWrapMode read FWrapMode write SetWrapMode default TPathWrapMode.pwStretch;
  end;

{ Designer }

  TSelectionPointKind = (spMove, spRotation);

{ TSelectionPoint3D }

  TSelectionPoint3D = class(TControl3D)
  private
    FOnTrack: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FPressed: Boolean;
    FOldRayPos, FOldRayDir: TVector3D;
    FWorkPlane: TPosition3D;
    FKind: TSelectionPointKind;
    FAngle: Single;
    procedure SetWorkPlane(const Value: TPosition3D);
  protected
    procedure Render; override;
    procedure MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
    procedure MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
    procedure MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); override;
    procedure DoMouseEnter; override;
    procedure DoMouseLeave; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
    property Pressed: Boolean read FPressed;
    property Angle: Single read FAngle;
  published
    property Kind: TSelectionPointKind read FKind write FKind default TSelectionPointKind.spMove;
    property WorkPlane: TPosition3D read FWorkPlane write SetWorkPlane;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnTrack: TNotifyEvent read FOnTrack write FOnTrack;
  end;

{ TModel3D }

  TMeshDynArray = array of TMesh;

  TMeshCollection = TMeshDynArray;

  TModel3D = class(TDummy)
  private
    FMeshCollection: TMeshCollection;
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadModel(Stream: TStream);
    procedure WriteModel(Stream: TStream);
    procedure UpdateMeshCollection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; virtual;
    function LoadFromFile(const AFileName: WideString): Boolean; virtual;
  published
    property MeshCollection: TMeshCollection read FMeshCollection;
  end;

implementation

uses UIConsts, Math, FMX_Import;

type
  THackMaterial = class(TMaterial);

{ TGrid3D }

constructor TGrid3D.Create(AOwner: TComponent);
begin
  inherited;
  FFrequency := 1;
  FMarks := 4;
  FLineColor := $50505050;
  Depth := 0.001;
end;

procedure TGrid3D.Render;
var
  X, Y: Single;
begin
  inherited;
  Context.SetContextState(TContextState.csLightOff);
  Context.SetTextureUnit(0, nil);
  X := 0;
  Y := 0;
  while X < Width / 2 do
  begin
    if (frac(X) = 0) and (frac(X / Marks) = 0) then
      Context.SetColor(TMaterialColor.mcDiffuse, MakeColor(FLineColor and $FFFFFF or $A0000000, AbsoluteOpacity))
    else
      Context.SetColor(TMaterialColor.mcDiffuse, MakeColor(FLineColor, AbsoluteOpacity));
    Context.DrawLine(Vector3D(X, -Height / 2, 0), Vector3D(X, Height / 2, 0), AbsoluteOpacity);
    Context.DrawLine(Vector3D(-X, -Height / 2, 0), Vector3D(-X, Height / 2, 0), AbsoluteOpacity);
    X := X + FFrequency;
  end;
  while Y < Height / 2 do
  begin
    if (frac(Y) = 0) and (frac(Y / Marks) = 0) then
      Context.SetColor(TMaterialColor.mcDiffuse, MakeColor(FLineColor and $FFFFFF or $A0000000, AbsoluteOpacity))
    else
      Context.SetColor(TMaterialColor.mcDiffuse, MakeColor(FLineColor, AbsoluteOpacity));
    Context.DrawLine(Vector3D(-Width / 2, Y, 0), Vector3D(Width / 2, Y, 0), AbsoluteOpacity);
    Context.DrawLine(Vector3D(-Width / 2, -Y, 0), Vector3D(Width / 2, -Y, 0), AbsoluteOpacity);
    Y := Y + FFrequency;
  end;
end;

function TGrid3D.GetLineColor: TAlphaColor;
begin
  Result := FLineColor;
  //AlphaColorToString(FLineColor)
end;

procedure TGrid3D.SetLineColor(const Value: TAlphaColor);
//var
//  NewColor: TAlphaColor;
begin
//  NewColor := StringToAlphaColor(Value);
  if Value <> FLineColor then
    FLineColor := Value;
end;

procedure TGrid3D.SetFrequency(const Value: Single);
begin
  if FFrequency <> Value then
  begin
    FFrequency := Value;
    if FFrequency <= 0 then
      FFrequency := 0.01;
    Repaint;
  end;
end;

function TGrid3D.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  IPoint: TVector3D;
begin
  if RayCastPlaneIntersect(RayPos, RayDir, Vector3D(0,0,0), Vector3D(0, 0, -1), IPoint) and (Abs(IPoint.X) < Width / 2) and (Abs(IPoint.Y) < Height / 2) then
  begin
    Result := True;
    Intersection := LocalToAbsoluteVector(IPoint);
  end
  else
    Result := False;
end;

procedure TGrid3D.SetDepth(const Value: Single);
begin
  inherited SetDepth(0.001);
end;

procedure TGrid3D.SetMarks(const Value: Single);
begin
  if FMarks <> Value then
  begin
    FMarks := Value;
    Repaint;
  end;
end;

{ TShape3D }

constructor TShape3D.Create(AOwner: TComponent);
begin
  inherited;
  FMaterial := TMaterial.Create;
  FMaterial.OnChanged := MaterialChanged;
end;

destructor TShape3D.Destroy;
begin
  FMaterial.Free;
  inherited;
end;

procedure TShape3D.Apply;
begin
  inherited;
  Context.SetMaterial(FMaterial);
end;

procedure TShape3D.UnApply;
begin
  inherited;
end;

procedure TShape3D.MaterialChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TShape3D.SetMaterial(const Value: TMaterial);
begin
  FMaterial.Assign(Value);
end;

{ TStrokeCube }

constructor TStrokeCube.Create(AOwner: TComponent);
begin
  inherited;
  Material.Lighting := False;
end;

destructor TStrokeCube.Destroy;
begin
  inherited;
end;

procedure TStrokeCube.Render;
begin
  inherited;
  Context.DrawCube(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
end;

function TStrokeCube.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := inherited;
end;

{ TCustomMesh }

constructor TCustomMesh.Create(AOwner: TComponent);
begin
  inherited;
  FData := TMeshData.Create;
  FData.OnChanged := DoMeshChanged;
end;

destructor TCustomMesh.Destroy;
begin
  FData.Free;
  inherited;
end;

function TCustomMesh.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  if FData.RayCastIntersect(Width, Height, Depth, RayPos, RayDir, Intersection) then
  begin
    Intersection := LocalToAbsoluteVector(Intersection);
    Result := True;
  end
  else if csDesigning in ComponentState then
    Result := inherited
  else
    Result := False;
end;

procedure TCustomMesh.Render;
begin
  Context.SetMatrix(Matrix3DMultiply(CreateScaleMatrix3D(Vector3D(Width, Height, Depth)), AbsoluteMatrix));
  Context.DrawTrianglesList(FData.VertexBuffer, FData.IndexBuffer, AbsoluteOpacity);
end;

procedure TCustomMesh.SetData(const Value: TMeshData);
begin
  FData.Assign(Value);
end;

procedure TCustomMesh.DoMeshChanged(Sender: TObject);
begin
  Repaint;
end;

{ TPlane }

constructor TPlane.Create(AOwner: TComponent);
begin
  inherited;
  Depth := 0.001;
  FSubdivisionsWidth := 16;
  FSubdivisionsHeight := 16;
  RebuildMesh;
end;

procedure TPlane.RebuildMesh;
var
  X, Y: Integer;
begin
  FData.VertexBuffer.Length := (FSubdivisionsWidth + 1) * (FSubdivisionsHeight + 1);
  for Y := 0 to FSubdivisionsHeight do
    for X := 0 to FSubdivisionsWidth do
    begin
      FData.VertexBuffer.Vertices[X + (Y * (FSubdivisionsWidth + 1))] := Point3D(-0.5 + (X / FSubdivisionsWidth), 0.5 - (Y / FSubdivisionsHeight), 0);
      FData.VertexBuffer.Normals[X + (Y * (FSubdivisionsWidth + 1))] := Point3D(0, 0, -1);
      FData.VertexBuffer.TexCoord0[X + (Y * (FSubdivisionsWidth + 1))] := PointF(X / FSubdivisionsWidth, Y / FSubdivisionsHeight);
    end;
  FData.IndexBuffer.Length := FSubdivisionsWidth * FSubdivisionsHeight * 6;
  for Y := 0 to FSubdivisionsHeight - 1 do
    for X := 0 to FSubdivisionsWidth - 1 do
    begin
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 0] := X + (Y * (FSubdivisionsWidth + 1));
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 2] := X + 1 + (Y * (FSubdivisionsWidth + 1));
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 1] := X + ((Y + 1) * (FSubdivisionsWidth + 1));
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 3] := X + ((Y + 1) * (FSubdivisionsWidth + 1));
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 5] := X + 1 + (Y * (FSubdivisionsWidth + 1));
      FData.IndexBuffer[(X + (Y * (FSubdivisionsWidth + 0))) * 6 + 4] := X + 1 + ((Y + 1) * (FSubdivisionsWidth + 1));
    end;
end;

function TPlane.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  IPoint: TVector3D;
begin
  if RayCastPlaneIntersect(RayPos, RayDir, Vector3D(0,0,0), Vector3D(0, 0, -1), IPoint) and (Abs(IPoint.X) < Width / 2) and (Abs(IPoint.Y) < Height / 2) then
  begin
    Result := True;
    Intersection := LocalToAbsoluteVector(IPoint);
  end
  else
    Result := False;
end;

procedure TPlane.SetDepth(const Value: Single);
begin
  inherited SetDepth(0.001);
end;

procedure TPlane.SetSubdivisionsHeight(const Value: Integer);
begin
  if FSubdivisionsHeight <> Value then
  begin
    FSubdivisionsHeight := Value;
    if FSubdivisionsHeight < 1 then
      FSubdivisionsHeight := 1;
    RebuildMesh;
  end;
end;

procedure TPlane.SetSubdivisionsWidth(const Value: Integer);
begin
  if FSubdivisionsWidth <> Value then
  begin
    FSubdivisionsWidth := Value; 
    if FSubdivisionsWidth < 1 then
      FSubdivisionsWidth := 1;
    RebuildMesh;
  end;
end;

{ TDisk }

constructor TDisk.Create(AOwner: TComponent);
begin
  inherited;
  Height := 0.001;
  FSubdivisionsAxes := 16;
  FSubdivisionsCap := 1;
  RebuildMesh;
end;

function TDisk.RayCastIntersect(const RayPos, RayDir: TVector3D;
  var Intersection: TVector3D): Boolean;
var
  IPoint: TVector3D;
begin
  if RayCastPlaneIntersect(RayPos, RayDir, Vector3D(0,0,0), Vector3D(0, -1, 0), IPoint) and (Width > 0) and (Depth > 0) and
     (Sqr(IPoint.X / (Width / 2)) + Sqr(IPoint.Z / (Depth / 2)) <= 1) then
  begin
    Result := True;
    Intersection := LocalToAbsoluteVector(IPoint);
  end
  else
    Result := False;
end;

procedure TDisk.RebuildMesh;
var
  A, H, AA, HH: Integer;
  Theta, Phi: Single;
  DTheta, DPhi: Single;
  PhiSin, PhiCos: Extended;
  IdxCount: Integer;
  VerticesWidth: Integer;
begin
  VerticesWidth := (FSubdivisionsAxes + 1);
  FData.VertexBuffer.Length := (FSubdivisionsCap) * VerticesWidth + 1;
  FData.IndexBuffer.Length := (FSubdivisionsCap - 1) * FSubdivisionsAxes * 6 + (FSubdivisionsAxes * 3);
  DPhi := DegToRad(360) / FSubdivisionsAxes;
  IdxCount := 0;
  // fill indices
  FData.VertexBuffer.Vertices[FData.VertexBuffer.Length - 1] := Point3D(0, 0, 0); 
  FData.VertexBuffer.TexCoord0[FData.VertexBuffer.Length - 1] := PointF(0.5, 0.5);
  FData.VertexBuffer.Normals[FData.VertexBuffer.Length - 1] := Point3D(0, -1, 0);
  for H := 0 to FSubdivisionsCap - 1 do
  begin
    Phi := 0;
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Phi, PhiSin, PhiCos);
      FData.VertexBuffer.Vertices[A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0, PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap));
      FData.VertexBuffer.TexCoord0[A + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      FData.VertexBuffer.Normals[A + (H * VerticesWidth)] := Point3D(0, -1, 0);
      if A = 0 then 
      begin
        FData.VertexBuffer.Vertices[FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0, PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap));
        FData.VertexBuffer.TexCoord0[FSubdivisionsAxes + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
        FData.VertexBuffer.Normals[FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(0, -1, 0);
      end;
      AA := A + 1;
      HH := H - 1;
      if H = 0 then
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := FData.VertexBuffer.Length - 1;
        FData.IndexBuffer.Indices[IdxCount + 2] := AA + (H * VerticesWidth);
        IdxCount := IdxCount + 3;                                           
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      Phi := Phi + DPhi;
    end;
  end;
end;

procedure TDisk.SetHeight(const Value: Single);
begin
  inherited SetHeight(0.001);
end;

procedure TDisk.SetSubdivisionsAxes(const Value: Integer);
begin
  if FSubdivisionsAxes <> Value then
  begin
    FSubdivisionsAxes := Value;
    if FSubdivisionsAxes < 3 then
      FSubdivisionsAxes := 3;
    RebuildMesh;
  end;
end;

procedure TDisk.SetSubdivisionsCap(const Value: Integer);
begin
  if FSubdivisionsCap <> Value then
  begin
    FSubdivisionsCap := Value;
    if FSubdivisionsCap < 1 then
      FSubdivisionsCap := 1;
    RebuildMesh;
  end;
end;

{ TCube }

constructor TCube.Create(AOwner: TComponent);
begin
  inherited;
  FSubdivisionsDepth := 8;
  FSubdivisionsHeight := 8;
  FSubdivisionsWidth := 8;
  RebuildMesh;
end;

destructor TCube.Destroy;
begin
  inherited;
end;

procedure TCube.RebuildMesh;
var
  X, Y: Integer;
  Face: Integer;
  FaceVertexLength: Integer;
  FaceIndexLength: Integer;
  VertexOffset: Integer;
  IndexOffset: Integer;
begin
  FData.VertexBuffer.Length := 
    (FSubdivisionsWidth + 1) * (FSubdivisionsHeight + 1) * 2 +
    (FSubdivisionsDepth + 1) * (FSubdivisionsWidth + 1) * 2 +
    (FSubdivisionsDepth + 1) * (FSubdivisionsHeight + 1) * 2;
  FData.IndexBuffer.Length := 
    (FSubdivisionsWidth) * (FSubdivisionsHeight) * 6 * 2 +
    (FSubdivisionsDepth) * (FSubdivisionsWidth) * 6 * 2 +
    (FSubdivisionsDepth) * (FSubdivisionsHeight) * 6 * 2;

  VertexOffset := 0;
  IndexOffset := 0;
  FaceVertexLength := (FSubdivisionsWidth + 1) * (FSubdivisionsHeight + 1);
  FaceIndexLength := FSubdivisionsWidth * FSubdivisionsHeight * 6;
  for Face := 0 to 1 do
  begin
    for Y := 0 to FSubdivisionsHeight do
      for X := 0 to FSubdivisionsWidth do
      begin
        if not Odd(Face) then
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(-0.5 + (X / FSubdivisionsWidth), -0.5 + (Y / FSubdivisionsHeight), -0.5);
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(0, 0, -1);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := PointF(X / FSubdivisionsWidth, Y / FSubdivisionsHeight);
        end
        else
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(-0.5 + (X / FSubdivisionsWidth), -0.5 + (Y / FSubdivisionsHeight), 0.5);
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(0, 0, 1);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := PointF(1 - X / FSubdivisionsWidth, Y / FSubdivisionsHeight);
        end;
      end;
    for Y := 0 to FSubdivisionsHeight - 1 do
      for X := 0 to FSubdivisionsWidth - 1 do
      begin
        if Odd(Face) then
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsWidth + 1));
        end
        else
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsWidth + 1));
        end;
      end;
  end; 
  VertexOffset := VertexOffset + FaceVertexLength * 2;
  IndexOffset := IndexOffset + FaceIndexLength * 2;
  FaceVertexLength := (FSubdivisionsDepth + 1) * (FSubdivisionsWidth + 1);
  FaceIndexLength := FSubdivisionsDepth * FSubdivisionsWidth * 6;
  for Face := 0 to 1 do
  begin
    for Y := 0 to FSubdivisionsDepth do
      for X := 0 to FSubdivisionsWidth do
      begin
        if Odd(Face) then
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(-0.5 + (X / FSubdivisionsWidth), -0.5, -0.5 + (Y / FSubdivisionsDepth));
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(0, -1, 0);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := PointF(X / FSubdivisionsWidth, 1 - Y / FSubdivisionsDepth);
        end
        else
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(-0.5 + (X / FSubdivisionsWidth), 0.5, -0.5 + (Y / FSubdivisionsDepth));
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := Point3D(0, 1, 0);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1))] := PointF(X / FSubdivisionsWidth, Y / FSubdivisionsDepth);
        end;
      end;
    for Y := 0 to FSubdivisionsDepth - 1 do
      for X := 0 to FSubdivisionsWidth - 1 do
      begin
        if Odd(Face) then
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsWidth + 1));
        end
        else
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsWidth + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsWidth + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsWidth + 1));
        end;
      end;
  end; 
  VertexOffset := VertexOffset + FaceVertexLength * 2;
  IndexOffset := IndexOffset + FaceIndexLength * 2;
  FaceVertexLength := (FSubdivisionsDepth + 1) * (FSubdivisionsHeight + 1);
  FaceIndexLength := FSubdivisionsDepth * FSubdivisionsHeight * 6;
  for Face := 0 to 1 do
  begin
    for Y := 0 to FSubdivisionsDepth do
      for X := 0 to FSubdivisionsHeight do
      begin
        if Odd(Face) then
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := Point3D(-0.5, -0.5 + (X / FSubdivisionsHeight), -0.5 + (Y / FSubdivisionsDepth));
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := Point3D(-1, 0, 0);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := PointF(1 - Y / FSubdivisionsDepth, X / FSubdivisionsHeight);
        end
        else
        begin
          FData.VertexBuffer.Vertices[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := Point3D(0.5, -0.5 + (X / FSubdivisionsHeight), -0.5 + (Y / FSubdivisionsDepth));
          FData.VertexBuffer.Normals[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := Point3D(1, 0, 0);
          FData.VertexBuffer.TexCoord0[VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1))] := PointF(Y / FSubdivisionsDepth, X / FSubdivisionsHeight);
        end;
      end;
    for Y := 0 to FSubdivisionsDepth - 1 do
      for X := 0 to FSubdivisionsHeight - 1 do
      begin
        if not Odd(Face) then
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsHeight + 1));
        end
        else
        begin
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 0] := VertexOffset + (Face * FaceVertexLength) + X + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 1] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 2] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 3] := VertexOffset + (Face * FaceVertexLength) + X + ((Y + 1) * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 4] := VertexOffset + (Face * FaceVertexLength) + X + 1 + (Y * (FSubdivisionsHeight + 1));
          FData.IndexBuffer[IndexOffset + (Face * FaceIndexLength) + (X + (Y * (FSubdivisionsHeight + 0))) * 6 + 5] := VertexOffset + (Face * FaceVertexLength) + X + 1 + ((Y + 1) * (FSubdivisionsHeight + 1));
        end;
      end;
  end; 
end;

function TCube.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  INear, IFar: TVector3D;
begin
  // Calling inherited will search through the MeshData for intersection. This is
  // wasted effort for such a simple shape.
  Result := RayCastCuboidIntersect(RayPos, RayDir, Vector3D(0,0,0), Width, Height, Depth, INear, IFar) > 0;
  if Result then
    Intersection := LocalToAbsoluteVector(INear);
end;

procedure TCube.SetSubdivisionsDepth(const Value: Integer);
begin
  if FSubdivisionsDepth <> Value then
  begin
    FSubdivisionsDepth := Value;
    if FSubdivisionsDepth < 1 then
      FSubdivisionsDepth := 1;
    RebuildMesh;
  end;
end;

procedure TCube.SetSubdivisionsHeight(const Value: Integer);
begin
  if FSubdivisionsHeight <> Value then
  begin
    FSubdivisionsHeight := Value;
    if FSubdivisionsHeight < 1 then
      FSubdivisionsHeight := 1;
    RebuildMesh;
  end;
end;

procedure TCube.SetSubdivisionsWidth(const Value: Integer);
begin
  if FSubdivisionsWidth <> Value then
  begin
    FSubdivisionsWidth := Value;
    if FSubdivisionsWidth < 1 then
      FSubdivisionsWidth := 1;
    RebuildMesh;
  end;
end;

{ TSphere }
constructor TSphere.Create(AOwner: TComponent);
begin
  inherited;
  FSubdivisionsAxes := 16;
  FSubdivisionsHeight := 12;
  RebuildMesh;
end;

procedure TSphere.RebuildMesh;
var
  A, H, AA, HH: Integer;
  Theta, Phi: Single;
  DTheta, DPhi: Single;
  {$IFDEF FPC}
  ThetaSin, ThetaCos: Extended;
  PhiSin, PhiCos: Extended;
  {$ELSE}
  ThetaSin, ThetaCos: Extended;
  PhiSin, PhiCos: Extended;
  {$ENDIF}
  IdxCount: Integer;
  VerticesWidth: Integer;
  N, N1, N2: TPoint3D;
begin
  VerticesWidth := (FSubdivisionsAxes + 1);
  FData.VertexBuffer.Length := (FSubdivisionsHeight + 1) * VerticesWidth - 1;
  FData.IndexBuffer.Length := (FSubdivisionsHeight - 2) * FSubdivisionsAxes * 6 + (FSubdivisionsAxes * 3) + (FSubdivisionsAxes * 3);
  DTheta := DegToRad(180) / FSubdivisionsHeight;
  DPhi := DegToRad(360) / FSubdivisionsAxes;
  IdxCount := 0;
  // fill indices
  Theta := -DegToRad(90);
  for H := 0 to FSubdivisionsHeight - 1 do
  begin
    Phi := 0;
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Theta, ThetaSin, ThetaCos);
      SinCos(Phi, PhiSin, PhiCos);
      FData.VertexBuffer.Vertices[A + (H * VerticesWidth)] := Point3D(ThetaCos * PhiCos * 0.5, ThetaSin * 0.5, ThetaCos * PhiSin * 0.5);
      FData.VertexBuffer.TexCoord0[A + (H * VerticesWidth)] := PointF(A / FSubdivisionsAxes, H / FSubdivisionsHeight);
      if A = 0 then 
      begin
        FData.VertexBuffer.Vertices[FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(ThetaCos * PhiCos * 0.5, ThetaSin * 0.5, ThetaCos * PhiSin * 0.5);
        FData.VertexBuffer.TexCoord0[FSubdivisionsAxes + (H * VerticesWidth)] := PointF(1, H / FSubdivisionsHeight);
      end;
      AA := A + 1;
      HH := H + 1;
      if H = 0 then
      begin
        FData.VertexBuffer.TexCoord0[A + (H * VerticesWidth)] := PointF((A + 0.5) / FSubdivisionsAxes, 0);
        FData.IndexBuffer.Indices[IdxCount + 0] := A;
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := A + (HH * VerticesWidth);
        IdxCount := IdxCount + 3;
      end
      else
      if H = FSubdivisionsHeight - 1 then
      begin
        FData.VertexBuffer.Vertices[A + (FSubdivisionsHeight * VerticesWidth)] := Point3D(0, 0.5, 0); 
        FData.VertexBuffer.TexCoord0[A + (FSubdivisionsHeight * VerticesWidth)] := PointF((A + 0.5) / FSubdivisionsAxes, 1);

        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := A + (HH * VerticesWidth);
        IdxCount := IdxCount + 3; 
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      Phi := Phi + DPhi;
    end;
    Theta := Theta + DTheta;
  end;
  FData.CalcNormals;
  // merge normals at the top
  for A := 0 to FSubdivisionsAxes - 1 do
    FData.VertexBuffer.Normals[A] := Point3D(0, -1, 0);
  // merge normals at the bottom
  for A := 0 to FSubdivisionsAxes - 1 do
    FData.VertexBuffer.Normals[A + (FSubdivisionsHeight * VerticesWidth)] := Point3D(0, 1, 0);
  // merge normals in split
  for H := 1 to FSubdivisionsHeight - 1 do
  begin
    N1 := FData.VertexBuffer.Normals[0 + (H * VerticesWidth)];
    N2 := FData.VertexBuffer.Normals[FSubdivisionsAxes + (H * VerticesWidth)];
    N.X := (N1.X + N2.X) / 2;
    N.Y := (N1.Y + N2.Y) / 2;
    N.Z := (N1.Z + N2.Z) / 2;
    N := Point3D(Vector3DNormalize(Vector3D(N)));
    FData.VertexBuffer.Normals[0 + (H * VerticesWidth)] := N;
    FData.VertexBuffer.Normals[FSubdivisionsAxes + (H * VerticesWidth)] := N;
  end;
end;

function TSphere.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  INear, IFar: TVector3D;
begin
  // Calling inherited will search through the MeshData for intersection. This is
  // wasted effort for such a simple shape.
  Result := RayCastEllipsoidIntersect(RayPos, RayDir, Vector3D(0,0,0), Width/2, Height/2, Depth/2, INear, IFar) > 0;
  if Result then
    Intersection := LocalToAbsoluteVector(INear);
end;

procedure TSphere.SetSubdivisionsAxes(const Value: Integer);
begin
  if FSubdivisionsAxes <> Value then
  begin
    FSubdivisionsAxes := Value;
    if FSubdivisionsAxes < 3 then
      FSubdivisionsAxes := 3;
    if FSubdivisionsAxes > 50 then
      FSubdivisionsAxes := 50;
    RebuildMesh;
  end;
end;

procedure TSphere.SetSubdivisionsHeight(const Value: Integer);
begin
  if FSubdivisionsHeight <> Value then
  begin
    FSubdivisionsHeight := Value;
    if FSubdivisionsHeight < 2 then
      FSubdivisionsHeight := 2;
    if FSubdivisionsHeight > 50 then
      FSubdivisionsHeight := 50;
    RebuildMesh;
  end;
end;

{ TCylinder }

constructor TCylinder.Create(AOwner: TComponent);
begin
  inherited;
  FSubdivisionsAxes := 12;
  FSubdivisionsCap := 2;
  FSubdivisionsHeight := 1;
  RebuildMesh;
end;

procedure TCylinder.RebuildMesh;
var
  A, H, AA, HH: Integer;
  Theta, Phi: Single;
  S, DTheta, DPhi: Single;
  PhiSin, PhiCos: Extended;
  IdxCount: Integer;
  Offset, VerticesWidth: Integer;
  N, N1, N2: TPoint3D;
begin
  VerticesWidth := (FSubdivisionsAxes + 1);
  FData.VertexBuffer.Length := (FSubdivisionsCap * VerticesWidth + 1) * 2 + ((FSubdivisionsHeight + 1) * VerticesWidth);
  FData.IndexBuffer.Length := ((FSubdivisionsCap - 1) * FSubdivisionsAxes * 6 + (FSubdivisionsAxes * 3)) * 2 + 
    FSubdivisionsHeight * FSubdivisionsAxes * 6;
  DPhi := DegToRad(360) / FSubdivisionsAxes;
  IdxCount := 0;
  // bottom and top
  FData.VertexBuffer.Vertices[FData.VertexBuffer.Length - 1] := Point3D(0, 0.5, 0); 
  FData.VertexBuffer.TexCoord0[FData.VertexBuffer.Length - 1] := PointF(0.5, 0.5);
  FData.VertexBuffer.Normals[FData.VertexBuffer.Length - 1] := Point3D(0, 1, 0);
  FData.VertexBuffer.Vertices[FData.VertexBuffer.Length - 2] := Point3D(0, -0.5, 0); 
  FData.VertexBuffer.TexCoord0[FData.VertexBuffer.Length - 2] := PointF(0.5, 0.5);
  FData.VertexBuffer.Normals[FData.VertexBuffer.Length - 2] := Point3D(0, -1, 0);
  Offset := VerticesWidth * FSubdivisionsCap;
  for H := 0 to FSubdivisionsCap - 1 do
  begin
    Phi := 0;
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Phi, PhiSin, PhiCos);
      // bottom
      FData.VertexBuffer.Vertices[A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
      FData.VertexBuffer.TexCoord0[A + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      if A = 0 then 
      begin
        FData.VertexBuffer.Vertices[FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
        FData.VertexBuffer.TexCoord0[FSubdivisionsAxes + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      end;
      AA := A + 1;
      HH := H - 1;
      if H = 0 then
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := FData.VertexBuffer.Length - 1;
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (H * VerticesWidth);
        IdxCount := IdxCount + 3;                                           
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      // top 
      FData.VertexBuffer.Vertices[Offset + A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), -0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
      FData.VertexBuffer.TexCoord0[Offset + A + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      if A = 0 then 
      begin
        FData.VertexBuffer.Vertices[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), -0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
        FData.VertexBuffer.TexCoord0[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, 1 - (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      end;
      if H = 0 then
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := FData.VertexBuffer.Length - 2;
        FData.IndexBuffer.Indices[IdxCount + 2] := Offset + AA + (H * VerticesWidth);
        IdxCount := IdxCount + 3;                                           
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := Offset + AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := Offset + A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := Offset + AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := Offset + AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      Phi := Phi + DPhi;
    end;
  end;
  // sides
  Phi := 0;
  Offset := Offset + VerticesWidth * FSubdivisionsCap;
  for H := 0 to FSubdivisionsHeight - 1 do
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Phi, PhiSin, PhiCos);
      S := 1 - (H / FSubdivisionsHeight);
      FData.VertexBuffer.Vertices[Offset + A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * S, 0.5 - (1 - S), PhiSin * 0.5 * S);
      FData.VertexBuffer.TexCoord0[Offset + A + (H * VerticesWidth)] := PointF(A / FSubdivisionsAxes, S);
      if H = 0 then
      begin
        FData.VertexBuffer.Vertices[Offset + A + (FSubdivisionsHeight * VerticesWidth)] := Point3D(PhiCos * 0.5 * S, -0.5, PhiSin * 0.5 * S);
        FData.VertexBuffer.TexCoord0[Offset + A + (FSubdivisionsHeight * VerticesWidth)] := PointF(A / FSubdivisionsAxes, 0);
      end;
      if A = 0 then
      begin
        FData.VertexBuffer.Vertices[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := FData.VertexBuffer.Vertices[Offset + (H * VerticesWidth)];
        FData.VertexBuffer.TexCoord0[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := PointF(1, S);
        if H = 0 then
        begin
          FData.VertexBuffer.Vertices[Offset + FSubdivisionsAxes + (FSubdivisionsHeight * VerticesWidth)] := Point3D(PhiCos * 0.5 * S, -0.5, PhiSin * 0.5 * S);
          FData.VertexBuffer.TexCoord0[Offset + FSubdivisionsAxes + (FSubdivisionsHeight * VerticesWidth)] := PointF(1, 0);
        end;
      end;
      AA := A + 1;
      HH := H + 1;

      FData.IndexBuffer.Indices[IdxCount + 0] := Offset + A + (H * VerticesWidth);
      FData.IndexBuffer.Indices[IdxCount + 2] := Offset + AA + (HH * VerticesWidth);
      FData.IndexBuffer.Indices[IdxCount + 1] := Offset + A + (HH * VerticesWidth);
      FData.IndexBuffer.Indices[IdxCount + 3] := Offset + A + (H * VerticesWidth);
      FData.IndexBuffer.Indices[IdxCount + 5] := Offset + AA + (H * VerticesWidth);
      FData.IndexBuffer.Indices[IdxCount + 4] := Offset + AA + (HH * VerticesWidth); 
      IdxCount := IdxCount + 6;
      
      Phi := Phi + DPhi;
    end;               
  FData.CalcNormals; 
  // smooth split
  for H := 0 to FSubdivisionsHeight do
  begin
    N1 := FData.VertexBuffer.Normals[Offset + 0 + (H * VerticesWidth)];
    N2 := FData.VertexBuffer.Normals[Offset + FSubdivisionsAxes + (H * VerticesWidth)];
    N.X := (N1.X + N2.X) / 2;
    N.Y := (N1.Y + N2.Y) / 2;
    N.Z := (N1.Z + N2.Z) / 2;
    N := Point3D(Vector3DNormalize(Vector3D(N)));
    FData.VertexBuffer.Normals[Offset + 0 + (H * VerticesWidth)] := N;
    FData.VertexBuffer.Normals[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := N;
  end;
end;

procedure TCylinder.SetSubdivisionsAxes(const Value: Integer);
begin
  if FSubdivisionsAxes <> Value then
  begin
    FSubdivisionsAxes := Value;
    if FSubdivisionsAxes < 3 then
      FSubdivisionsAxes := 3;
    RebuildMesh;
  end;
end;

procedure TCylinder.SetSubdivisionsCap(const Value: Integer);
begin
  if FSubdivisionsCap <> Value then
  begin
    FSubdivisionsCap := Value;
    if FSubdivisionsCap < 1 then
      FSubdivisionsCap := 1;
    RebuildMesh;
  end;
end;

procedure TCylinder.SetSubdivisionsHeight(const Value: Integer);
begin
  if FSubdivisionsHeight <> Value then
  begin
    FSubdivisionsHeight := Value;
    if FSubdivisionsHeight < 1 then
      FSubdivisionsHeight := 1;
    RebuildMesh;
  end;
end;

{ TRoundCube }

const

  RoundCubeVertices: array [0 .. 201] of TMeshVertex = ((X: - 0.42; Y: 0.42; z: 0.5; nx: - 0.0184349; ny: 0.00943183;
    nz: 1.5144; tu: 0.08; tv: 0.08;), (X: 0.42; Y: 0.42; z: 0.5; nx: 0.00943183; ny: 0.0184349; nz: 0.8088; tu: 0.92;
    tv: 0.08;), (X: - 0.42; Y: - 0.42; z: 0.5; nx: - 0.00943183; ny: - 0.0184349; nz: 0.8088; tu: 0.08; tv: 0.92;
    ), (X: 0.42; Y: - 0.42; z: 0.5; nx: 0.0184349; ny: - 0.00943183; nz: 1.5144; tu: 0.92; tv: 0.92;
    ), (X: - 0.42; Y: 0.46; z: 0.489282; nx: - 0.000486155; ny: 0.0444174; nz: 0.0941968; tu: 0.08; tv: 0.04;
    ), (X: - 0.44; Y: 0.454641; z: 0.489282; nx: - 0.00154256; ny: 0.0021282; nz: 0.00378564; tu: 0.06; tv: 0.045359;
    ), (X: - 0.454641; Y: 0.44; z: 0.489282; nx: - 0.00239999; ny: 0.00107179; nz: 0.00378564; tu: 0.045359;
    tv: 0.0599999;), (X: - 0.46; Y: 0.42; z: 0.489282; nx: - 0.0589968; ny: 0.000214357; nz: 0.0841794; tu: 0.04;
    tv: 0.08;), (X: - 0.46; Y: - 0.42; z: 0.489282; nx: - 0.0444174; ny: - 0.000486152; nz: 0.0941968; tu: 0.04;
    tv: 0.92;), (X: - 0.454641; Y: - 0.44; z: 0.489282; nx: - 0.0021282; ny: - 0.00154256; nz: 0.00378564; tu: 0.045359;
    tv: 0.94;), (X: - 0.44; Y: - 0.454641; z: 0.489282; nx: - 0.0010718; ny: - 0.0024; nz: 0.00378564; tu: 0.06;
    tv: 0.954641;), (X: - 0.42; Y: - 0.46; z: 0.489282; nx: - 0.00021436; ny: - 0.0589968; nz: 0.0841795; tu: 0.08;
    tv: 0.96;), (X: 0.42; Y: - 0.46; z: 0.489282; nx: 0.000486156; ny: - 0.0444174; nz: 0.0941969; tu: 0.92; tv: 0.96;
    ), (X: 0.44; Y: - 0.454641; z: 0.489282; nx: 0.00154256; ny: - 0.0021282; nz: 0.00378564; tu: 0.94; tv: 0.954641;
    ), (X: 0.454641; Y: - 0.44; z: 0.489282; nx: 0.0024; ny: - 0.0010718; nz: 0.00378564; tu: 0.954641; tv: 0.94;
    ), (X: 0.46; Y: - 0.42; z: 0.489282; nx: 0.0589968; ny: - 0.000214359; nz: 0.0841795; tu: 0.96; tv: 0.92;
    ), (X: 0.46; Y: 0.42; z: 0.489282; nx: 0.0444174; ny: 0.000486156; nz: 0.0941969; tu: 0.96; tv: 0.08;
    ), (X: 0.454641; Y: 0.44; z: 0.489282; nx: 0.0021282; ny: 0.00154256; nz: 0.00378564; tu: 0.954641; tv: 0.06;
    ), (X: 0.44; Y: 0.454641; z: 0.489282; nx: 0.00107179; ny: 0.0024; nz: 0.00378564; tu: 0.94; tv: 0.045359;
    ), (X: 0.42; Y: 0.46; z: 0.489282; nx: 0.000214357; ny: 0.0589968; nz: 0.0841794; tu: 0.92; tv: 0.04;
    ), (X: - 0.42; Y: 0.489282; z: 0.46; nx: - 0.00107179; ny: 0.0867937; nz: 0.0600113; tu: 0.08; tv: 0.010718;
    ), (X: - 0.454641; Y: 0.48; z: 0.46; nx: - 0.0037282; ny: 0.00591384; nz: 0.00378564; tu: 0.045359; tv: 0.02;
    ), (X: - 0.48; Y: 0.454641; z: 0.46; nx: - 0.00618564; ny: 0.00325743; nz: 0.00378564; tu: 0.02; tv: 0.045359;
    ), (X: - 0.489282; Y: 0.42; z: 0.46; nx: - 0.0947825; ny: 0.000799995; nz: 0.0445744; tu: 0.010718; tv: 0.08;
    ), (X: - 0.489282; Y: - 0.42; z: 0.46; nx: - 0.0867937; ny: - 0.00107179; nz: 0.0600113; tu: 0.010718; tv: 0.92;
    ), (X: - 0.48; Y: - 0.454641; z: 0.46; nx: - 0.00591384; ny: - 0.0037282; nz: 0.00378564; tu: 0.02; tv: 0.954641;
    ), (X: - 0.454641; Y: - 0.48; z: 0.46; nx: - 0.00325744; ny: - 0.00618564; nz: 0.00378564; tu: 0.045359; tv: 0.98;
    ), (X: - 0.42; Y: - 0.489282; z: 0.46; nx: - 0.000800001; ny: - 0.0947825; nz: 0.0445743; tu: 0.08; tv: 0.989282;
    ), (X: 0.42; Y: - 0.489282; z: 0.46; nx: 0.0010718; ny: - 0.0867937; nz: 0.0600112; tu: 0.92; tv: 0.989282;
    ), (X: 0.454641; Y: - 0.48; z: 0.46; nx: 0.0037282; ny: - 0.00591384; nz: 0.00378564; tu: 0.954641; tv: 0.98;
    ), (X: 0.48; Y: - 0.454641; z: 0.46; nx: 0.00618564; ny: - 0.00325743; nz: 0.00378564; tu: 0.98; tv: 0.954641;
    ), (X: 0.489282; Y: - 0.42; z: 0.46; nx: 0.0947825; ny: - 0.000800001; nz: 0.0445743; tu: 0.989282; tv: 0.92;
    ), (X: 0.489282; Y: 0.42; z: 0.46; nx: 0.0867937; ny: 0.0010718; nz: 0.0600112; tu: 0.989282; tv: 0.08;
    ), (X: 0.48; Y: 0.454641; z: 0.46; nx: 0.00591384; ny: 0.0037282; nz: 0.00378564; tu: 0.98; tv: 0.045359;
    ), (X: 0.454641; Y: 0.48; z: 0.46; nx: 0.00325743; ny: 0.00618564; nz: 0.00378564; tu: 0.954641; tv: 0.02;
    ), (X: 0.42; Y: 0.489282; z: 0.46; nx: 0.000799995; ny: 0.0947825; nz: 0.0445744; tu: 0.92; tv: 0.010718;
    ), (X: - 0.42; Y: 0.5; z: 0.42; nx: - 0.00042872; ny: 0.0688001; nz: 0.0184349; tu: 0.08; tv: 0;
    ), (X: - 0.46; Y: 0.489282; z: 0.42; nx: - 0.00197128; ny: 0.00415692; nz: 0.00122871; tu: 0.04; tv: 0.010718;
    ), (X: - 0.489282; Y: 0.46; z: 0.42; nx: - 0.00378564; ny: 0.00261436; nz: 0.00122871; tu: 0.010718; tv: 0.04;
    ), (X: - 0.5; Y: 0.42; z: 0.42; nx: - 0.0365857; ny: 0.0008; nz: 0.00980311; tu: 0; tv: 0.08;
    ), (X: - 0.5; Y: - 0.42; z: 0.42; nx: - 0.0688001; ny: - 0.00042872; nz: 0.0184349; tu: 0; tv: 0.92;
    ), (X: - 0.489282; Y: - 0.46; z: 0.42; nx: - 0.00415693; ny: - 0.00197128; nz: 0.00122872; tu: 0.010718; tv: 0.96;
    ), (X: - 0.46; Y: - 0.489282; z: 0.42; nx: - 0.00261436; ny: - 0.00378564; nz: 0.00122872; tu: 0.04; tv: 0.989282;
    ), (X: - 0.42; Y: - 0.5; z: 0.42; nx: - 0.0008; ny: - 0.0365857; nz: 0.00980306; tu: 0.08; tv: 1;
    ), (X: 0.42; Y: - 0.5; z: 0.42; nx: 0.000428717; ny: - 0.0688001; nz: 0.0184348; tu: 0.92; tv: 1;
    ), (X: 0.46; Y: - 0.489282; z: 0.42; nx: 0.00197128; ny: - 0.00415692; nz: 0.00122872; tu: 0.96; tv: 0.989282;
    ), (X: 0.489282; Y: - 0.46; z: 0.42; nx: 0.00378564; ny: - 0.00261436; nz: 0.00122872; tu: 0.989282; tv: 0.96;
    ), (X: 0.5; Y: - 0.42; z: 0.42; nx: 0.0365857; ny: - 0.0008; nz: 0.00980306; tu: 1; tv: 0.92;
    ), (X: 0.5; Y: 0.42; z: 0.42; nx: 0.0688; ny: 0.000428717; nz: 0.0184348; tu: 1; tv: 0.08;
    ), (X: 0.489282; Y: 0.46; z: 0.42; nx: 0.00415692; ny: 0.00197128; nz: 0.00122872; tu: 0.989282; tv: 0.04;
    ), (X: 0.46; Y: 0.489282; z: 0.42; nx: 0.00261436; ny: 0.00378564; nz: 0.00122872; tu: 0.96; tv: 0.010718;
    ), (X: 0.42; Y: 0.5; z: 0.42; nx: 0.0008; ny: 0.0365857; nz: 0.00980311; tu: 0.92; tv: 0;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: - 0.00900311; ny: 0.0336; nz: 0; tu: 0; tv: 1;
    ), (X: - 0.46; Y: 0.489282; z: - 0.42; nx: - 0.0426031; ny: 0.0917968; nz: 0; tu: 0.00991422; tv: 1;
    ), (X: - 0.489282; Y: 0.46; z: - 0.42; nx: - 0.0827938; ny: 0.0581969; nz: 0; tu: 0.0198284; tv: 1;
    ), (X: - 0.5; Y: 0.42; z: - 0.42; nx: - 0.7728; ny: 0.0180062; nz: 0; tu: 0.0297427; tv: 1;
    ), (X: - 0.5; Y: - 0.42; z: - 0.42; nx: - 1.4448; ny: - 0.00900311; nz: 0; tu: 0.230847; tv: 1;
    ), (X: - 0.489282; Y: - 0.46; z: - 0.42; nx: - 0.0917969; ny: - 0.0426031; nz: 0; tu: 0.240761; tv: 1;
    ), (X: - 0.46; Y: - 0.489282; z: - 0.42; nx: - 0.0581969; ny: - 0.0827938; nz: 0; tu: 0.250676; tv: 1;
    ), (X: - 0.42; Y: - 0.5; z: - 0.42; nx: - 0.0180061; ny: - 0.7728; nz: 0; tu: 0.26059; tv: 1;
    ), (X: 0.42; Y: - 0.5; z: - 0.42; nx: 0.00900306; ny: - 1.4448; nz: 0; tu: 0.461694; tv: 1;
    ), (X: 0.46; Y: - 0.489282; z: - 0.42; nx: 0.042603; ny: - 0.0917969; nz: 0; tu: 0.471609; tv: 1;
    ), (X: 0.489282; Y: - 0.46; z: - 0.42; nx: 0.0827938; ny: - 0.0581969; nz: 0; tu: 0.481523; tv: 1;
    ), (X: 0.5; Y: - 0.42; z: - 0.42; nx: 0.7728; ny: - 0.0180061; nz: 0; tu: 0.491437; tv: 1;
    ), (X: 0.5; Y: 0.42; z: - 0.42; nx: 1.4448; ny: 0.00900306; nz: 0; tu: 0.692542; tv: 1;
    ), (X: 0.489282; Y: 0.46; z: - 0.42; nx: 0.0917968; ny: 0.042603; nz: 0; tu: 0.702456; tv: 1;
    ), (X: 0.46; Y: 0.489282; z: - 0.42; nx: 0.0581969; ny: 0.0827938; nz: 0; tu: 0.71237; tv: 1;
    ), (X: 0.42; Y: 0.5; z: - 0.42; nx: 0.0180062; ny: 0.7728; nz: 0; tu: 0.722284; tv: 1;
    ), (X: - 0.42; Y: 0.489282; z: - 0.46; nx: - 0.000799998; ny: 0.0947825; nz: - 0.0445744; tu: 0.08; tv: 0.989282;
    ), (X: - 0.454641; Y: 0.48; z: - 0.46; nx: - 0.00325744; ny: 0.00618564; nz: - 0.00378564; tu: 0.045359; tv: 0.98;
    ), (X: - 0.48; Y: 0.454641; z: - 0.46; nx: - 0.00591384; ny: 0.0037282; nz: - 0.00378563; tu: 0.02; tv: 0.954641;
    ), (X: - 0.489282; Y: 0.42; z: - 0.46; nx: - 0.0867938; ny: 0.00107179; nz: - 0.0600113; tu: 0.010718; tv: 0.92;
    ), (X: - 0.489282; Y: - 0.42; z: - 0.46; nx: - 0.0947825; ny: - 0.000799996; nz: - 0.0445744; tu: 0.010718;
    tv: 0.08;), (X: - 0.48; Y: - 0.454641; z: - 0.46; nx: - 0.00618564; ny: - 0.00325744; nz: - 0.00378564; tu: 0.02;
    tv: 0.045359;), (X: - 0.454641; Y: - 0.48; z: - 0.46; nx: - 0.0037282; ny: - 0.00591384; nz: - 0.00378564;
    tu: 0.045359; tv: 0.02;), (X: - 0.42; Y: - 0.489282; z: - 0.46; nx: - 0.0010718; ny: - 0.0867938; nz: - 0.0600112;
    tu: 0.08; tv: 0.010718;), (X: 0.42; Y: - 0.489282; z: - 0.46; nx: 0.000800002; ny: - 0.0947825; nz: - 0.0445743;
    tu: 0.92; tv: 0.010718;), (X: 0.454641; Y: - 0.48; z: - 0.46; nx: 0.00325744; ny: - 0.00618564; nz: - 0.00378564;
    tu: 0.954641; tv: 0.02;), (X: 0.48; Y: - 0.454641; z: - 0.46; nx: 0.00591384; ny: - 0.0037282; nz: - 0.00378564;
    tu: 0.98; tv: 0.045359;), (X: 0.489282; Y: - 0.42; z: - 0.46; nx: 0.0867938; ny: - 0.0010718; nz: - 0.0600112;
    tu: 0.989282; tv: 0.08;), (X: 0.489282; Y: 0.42; z: - 0.46; nx: 0.0947825; ny: 0.000800001; nz: - 0.0445743;
    tu: 0.989282; tv: 0.92;), (X: 0.48; Y: 0.454641; z: - 0.46; nx: 0.00618564; ny: 0.00325744; nz: - 0.00378564;
    tu: 0.98; tv: 0.954641;), (X: 0.454641; Y: 0.48; z: - 0.46; nx: 0.0037282; ny: 0.00591384; nz: - 0.00378564;
    tu: 0.954641; tv: 0.98;), (X: 0.42; Y: 0.489282; z: - 0.46; nx: 0.00107179; ny: 0.0867938; nz: - 0.0600113;
    tu: 0.92; tv: 0.989282;), (X: - 0.42; Y: 0.46; z: - 0.489282; nx: - 0.00021436; ny: 0.0589969; nz: - 0.0841794;
    tu: 0.08; tv: 0.96;), (X: - 0.44; Y: 0.454641; z: - 0.489282; nx: - 0.00107179; ny: 0.0024; nz: - 0.00378564;
    tu: 0.06; tv: 0.954641;), (X: - 0.454641; Y: 0.44; z: - 0.489282; nx: - 0.0021282; ny: 0.00154256; nz: - 0.00378564;
    tu: 0.045359; tv: 0.94;), (X: - 0.46; Y: 0.42; z: - 0.489282; nx: - 0.0444174; ny: 0.000486153; nz: - 0.0941968;
    tu: 0.04; tv: 0.92;), (X: - 0.46; Y: - 0.42; z: - 0.489282; nx: - 0.0589969; ny: - 0.000214357; nz: - 0.0841794;
    tu: 0.04; tv: 0.08;), (X: - 0.454641; Y: - 0.44; z: - 0.489282; nx: - 0.0024; ny: - 0.00107179; nz: - 0.00378564;
    tu: 0.045359; tv: 0.06;), (X: - 0.44; Y: - 0.454641; z: - 0.489282; nx: - 0.00154256; ny: - 0.0021282;
    nz: - 0.00378564; tu: 0.06; tv: 0.045359;), (X: - 0.42; Y: - 0.46; z: - 0.489282; nx: - 0.000486157;
    ny: - 0.0444174; nz: - 0.0941969; tu: 0.08; tv: 0.04;), (X: 0.42; Y: - 0.46; z: - 0.489282; nx: 0.00021436;
    ny: - 0.0589969; nz: - 0.0841795; tu: 0.92; tv: 0.04;), (X: 0.44; Y: - 0.454641; z: - 0.489282; nx: 0.0010718;
    ny: - 0.0024; nz: - 0.00378564; tu: 0.94; tv: 0.045359;), (X: 0.454641; Y: - 0.44; z: - 0.489282; nx: 0.0021282;
    ny: - 0.00154256; nz: - 0.00378564; tu: 0.954641; tv: 0.06;), (X: 0.46; Y: - 0.42; z: - 0.489282; nx: 0.0444174;
    ny: - 0.000486157; nz: - 0.0941969; tu: 0.96; tv: 0.08;), (X: 0.46; Y: 0.42; z: - 0.489282; nx: 0.0589969;
    ny: 0.000214359; nz: - 0.0841795; tu: 0.96; tv: 0.92;), (X: 0.454641; Y: 0.44; z: - 0.489282; nx: 0.0024;
    ny: 0.0010718; nz: - 0.00378564; tu: 0.954641; tv: 0.94;), (X: 0.44; Y: 0.454641; z: - 0.489282; nx: 0.00154256;
    ny: 0.0021282; nz: - 0.00378564; tu: 0.94; tv: 0.954641;), (X: 0.42; Y: 0.46; z: - 0.489282; nx: 0.000486153;
    ny: 0.0444174; nz: - 0.0941968; tu: 0.92; tv: 0.96;), (X: 0.42; Y: - 0.42; z: - 0.5; nx: 0.0094318; ny: - 0.0184349;
    nz: - 0.8088; tu: 0.92; tv: 0.08;), (X: - 0.42; Y: - 0.42; z: - 0.5; nx: - 0.0184349; ny: - 0.0094318; nz: - 1.5144;
    tu: 0.08; tv: 0.08;), (X: 0.42; Y: 0.42; z: - 0.5; nx: 0.0184349; ny: 0.0094318; nz: - 1.5144; tu: 0.92; tv: 0.92;
    ), (X: - 0.42; Y: 0.42; z: - 0.5; nx: - 0.0094318; ny: 0.0184349; nz: - 0.8088; tu: 0.08; tv: 0.92;
    ), (X: - 0.42; Y: 0.5; z: 0.42; nx: - 0.00900311; ny: 0.0336; nz: 0; tu: 0; tv: 0;
    ), (X: - 0.42; Y: 0.5; z: 0.42; nx: - 0.00900311; ny: 0.0336; nz: 0; tu: 0; tv: 0;
    ), (X: - 0.46; Y: 0.489282; z: 0.42; nx: - 0.00900311; ny: 0.0336; nz: 0; tu: 0.00991422; tv: 0;
    ), (X: - 0.46; Y: 0.489282; z: 0.42; nx: - 0.0245969; ny: 0.0245969; nz: 0; tu: 0.00991422; tv: 0;
    ), (X: - 0.46; Y: 0.489282; z: 0.42; nx: - 0.0245969; ny: 0.0245969; nz: 0; tu: 0.00991422; tv: 0;
    ), (X: - 0.489282; Y: 0.46; z: 0.42; nx: - 0.0245969; ny: 0.0245969; nz: 0; tu: 0.0198284; tv: 0;
    ), (X: - 0.489282; Y: 0.46; z: 0.42; nx: - 0.0336; ny: 0.00900311; nz: 0; tu: 0.0198284; tv: 0;
    ), (X: - 0.489282; Y: 0.46; z: 0.42; nx: - 0.0336; ny: 0.00900311; nz: 0; tu: 0.0198284; tv: 0;
    ), (X: - 0.5; Y: 0.42; z: 0.42; nx: - 0.0336; ny: 0.00900311; nz: 0; tu: 0.0297427; tv: 0;
    ), (X: - 0.5; Y: 0.42; z: 0.42; nx: - 0.7056; ny: 0; nz: 0; tu: 0.0297427; tv: 0;
    ), (X: - 0.5; Y: 0.42; z: 0.42; nx: - 0.7056; ny: 0; nz: 0; tu: 0.0297427; tv: 0;
    ), (X: - 0.5; Y: - 0.42; z: 0.42; nx: - 0.7056; ny: 0; nz: 0; tu: 0.230847; tv: 0;
    ), (X: - 0.5; Y: - 0.42; z: 0.42; nx: - 0.0336; ny: - 0.00900311; nz: 0; tu: 0.230847; tv: 0;
    ), (X: - 0.5; Y: - 0.42; z: 0.42; nx: - 0.0336; ny: - 0.00900311; nz: 0; tu: 0.230847; tv: 0;
    ), (X: - 0.489282; Y: - 0.46; z: 0.42; nx: - 0.0336; ny: - 0.00900311; nz: 0; tu: 0.240761; tv: 0;
    ), (X: - 0.489282; Y: - 0.46; z: 0.42; nx: - 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.240761; tv: 0;
    ), (X: - 0.489282; Y: - 0.46; z: 0.42; nx: - 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.240761; tv: 0;
    ), (X: - 0.46; Y: - 0.489282; z: 0.42; nx: - 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.250676; tv: 0;
    ), (X: - 0.46; Y: - 0.489282; z: 0.42; nx: - 0.00900306; ny: - 0.0336; nz: 0; tu: 0.250676; tv: 0;
    ), (X: - 0.46; Y: - 0.489282; z: 0.42; nx: - 0.00900306; ny: - 0.0336; nz: 0; tu: 0.250676; tv: 0;
    ), (X: - 0.42; Y: - 0.5; z: 0.42; nx: - 0.00900306; ny: - 0.0336; nz: 0; tu: 0.26059; tv: 0;
    ), (X: - 0.42; Y: - 0.5; z: 0.42; nx: 0; ny: - 0.7056; nz: 0; tu: 0.26059; tv: 0;
    ), (X: - 0.42; Y: - 0.5; z: 0.42; nx: 0; ny: - 0.7056; nz: 0; tu: 0.26059; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: 0.42; nx: 0; ny: - 0.7056; nz: 0; tu: 0.461694; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: 0.42; nx: 0.00900306; ny: - 0.0336; nz: 0; tu: 0.461694; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: 0.42; nx: 0.00900306; ny: - 0.0336; nz: 0; tu: 0.461694; tv: 0;
    ), (X: 0.46; Y: - 0.489282; z: 0.42; nx: 0.00900306; ny: - 0.0336; nz: 0; tu: 0.471609; tv: 0;
    ), (X: 0.46; Y: - 0.489282; z: 0.42; nx: 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.471609; tv: 0;
    ), (X: 0.46; Y: - 0.489282; z: 0.42; nx: 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.471609; tv: 0;
    ), (X: 0.489282; Y: - 0.46; z: 0.42; nx: 0.0245969; ny: - 0.0245969; nz: 0; tu: 0.481523; tv: 0;
    ), (X: 0.489282; Y: - 0.46; z: 0.42; nx: 0.0336; ny: - 0.00900306; nz: 0; tu: 0.481523; tv: 0;
    ), (X: 0.489282; Y: - 0.46; z: 0.42; nx: 0.0336; ny: - 0.00900306; nz: 0; tu: 0.481523; tv: 0;
    ), (X: 0.5; Y: - 0.42; z: 0.42; nx: 0.0336; ny: - 0.00900306; nz: 0; tu: 0.491437; tv: 0;
    ), (X: 0.5; Y: - 0.42; z: 0.42; nx: 0.7056; ny: 0; nz: 0; tu: 0.491437; tv: 0;
    ), (X: 0.5; Y: - 0.42; z: 0.42; nx: 0.7056; ny: 0; nz: 0; tu: 0.491437; tv: 0;
    ), (X: 0.5; Y: 0.42; z: 0.42; nx: 0.7056; ny: 0; nz: 0; tu: 0.692542; tv: 0;
    ), (X: 0.5; Y: 0.42; z: 0.42; nx: 0.0336; ny: 0.00900306; nz: 0; tu: 0.692542; tv: 0;
    ), (X: 0.5; Y: 0.42; z: 0.42; nx: 0.0336; ny: 0.00900306; nz: 0; tu: 0.692542; tv: 0;
    ), (X: 0.489282; Y: 0.46; z: 0.42; nx: 0.0336; ny: 0.00900306; nz: 0; tu: 0.702456; tv: 0;
    ), (X: 0.489282; Y: 0.46; z: 0.42; nx: 0.0245969; ny: 0.0245969; nz: 0; tu: 0.702456; tv: 0;
    ), (X: 0.489282; Y: 0.46; z: 0.42; nx: 0.0245969; ny: 0.0245969; nz: 0; tu: 0.702456; tv: 0;
    ), (X: 0.46; Y: 0.489282; z: 0.42; nx: 0.0245969; ny: 0.0245969; nz: 0; tu: 0.71237; tv: 0;
    ), (X: 0.46; Y: 0.489282; z: 0.42; nx: 0.00900311; ny: 0.0336; nz: 0; tu: 0.71237; tv: 0;
    ), (X: 0.46; Y: 0.489282; z: 0.42; nx: 0.00900311; ny: 0.0336; nz: 0; tu: 0.71237; tv: 0;
    ), (X: 0.42; Y: 0.5; z: 0.42; nx: 0.00900311; ny: 0.0336; nz: 0; tu: 0.722284; tv: 0;
    ), (X: 0.42; Y: 0.5; z: 0.42; nx: 0; ny: 0.7056; nz: 0; tu: 0.722284; tv: 0;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: 0; ny: 0.7056; nz: 0; tu: 1; tv: 1;
    ), (X: 0.42; Y: 0.5; z: 0.42; nx: 0; ny: 0.7056; nz: 0; tu: 0.722284; tv: 0;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: 0; ny: 0.7056; nz: 0; tu: 1; tv: 1;
    ), (X: - 0.42; Y: 0.5; z: 0.42; nx: 0; ny: 0.7056; nz: 0; tu: 1; tv: 0;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: - 0.00037128; ny: 0.00138564; nz: - 0.000371282; tu: 0.08; tv: 1;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: - 0.00042872; ny: 0.0016; nz: - 0.000428716; tu: 0.08; tv: 1;
    ), (X: - 0.46; Y: 0.489282; z: - 0.42; nx: - 0.00042872; ny: 0.0016; nz: - 0.000428716; tu: 0.04; tv: 0.989282;
    ), (X: - 0.46; Y: 0.489282; z: - 0.42; nx: - 0.00101436; ny: 0.00101436; nz: - 0.000371279; tu: 0.04; tv: 0.989282;
    ), (X: - 0.46; Y: 0.489282; z: - 0.42; nx: - 0.00117128; ny: 0.00117128; nz: - 0.000428718; tu: 0.04; tv: 0.989282;
    ), (X: - 0.489282; Y: 0.46; z: - 0.42; nx: - 0.00117128; ny: 0.00117128; nz: - 0.000428718; tu: 0.010718; tv: 0.96;
    ), (X: - 0.489282; Y: 0.46; z: - 0.42; nx: - 0.00138564; ny: 0.00037128; nz: - 0.000371279; tu: 0.010718; tv: 0.96;
    ), (X: - 0.489282; Y: 0.46; z: - 0.42; nx: - 0.0016; ny: 0.000428719; nz: - 0.000428719; tu: 0.010718; tv: 0.96;
    ), (X: - 0.5; Y: 0.42; z: - 0.42; nx: - 0.0016; ny: 0.000428719; nz: - 0.000428719; tu: 0; tv: 0.92;
    ), (X: - 0.5; Y: 0.42; z: - 0.42; nx: - 0.0336; ny: 0; nz: - 0.00900311; tu: 0; tv: 0.92;
    ), (X: - 0.5; Y: 0.42; z: - 0.42; nx: - 0.0336; ny: 0; nz: - 0.00900311; tu: 0; tv: 0.92;
    ), (X: - 0.5; Y: - 0.42; z: - 0.42; nx: - 0.0336; ny: 0; nz: - 0.00900311; tu: 0; tv: 0.08;
    ), (X: - 0.5; Y: - 0.42; z: - 0.42; nx: - 0.00138564; ny: - 0.00037128; nz: - 0.000371282; tu: 0; tv: 0.08;
    ), (X: - 0.5; Y: - 0.42; z: - 0.42; nx: - 0.0016; ny: - 0.00042872; nz: - 0.000428718; tu: 0; tv: 0.08;
    ), (X: - 0.489282; Y: - 0.46; z: - 0.42; nx: - 0.0016; ny: - 0.00042872; nz: - 0.000428718; tu: 0.010718; tv: 0.04;
    ), (X: - 0.489282; Y: - 0.46; z: - 0.42; nx: - 0.00101436; ny: - 0.00101436; nz: - 0.00037128; tu: 0.010718;
    tv: 0.04;), (X: - 0.489282; Y: - 0.46; z: - 0.42; nx: - 0.00117128; ny: - 0.00117128; nz: - 0.000428718;
    tu: 0.010718; tv: 0.04;), (X: - 0.46; Y: - 0.489282; z: - 0.42; nx: - 0.00117128; ny: - 0.00117128;
    nz: - 0.000428718; tu: 0.04; tv: 0.010718;), (X: - 0.46; Y: - 0.489282; z: - 0.42; nx: - 0.000371282;
    ny: - 0.00138564; nz: - 0.000371282; tu: 0.04; tv: 0.010718;), (X: - 0.46; Y: - 0.489282; z: - 0.42;
    nx: - 0.000428717; ny: - 0.0016; nz: - 0.000428717; tu: 0.04; tv: 0.010718;
    ), (X: - 0.42; Y: - 0.5; z: - 0.42; nx: - 0.000428717; ny: - 0.0016; nz: - 0.000428717; tu: 0.08; tv: 0;
    ), (X: - 0.42; Y: - 0.5; z: - 0.42; nx: 0; ny: - 0.0336; nz: - 0.00900306; tu: 0.08; tv: 0;
    ), (X: - 0.42; Y: - 0.5; z: - 0.42; nx: 0; ny: - 0.0336; nz: - 0.00900306; tu: 0.08; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: - 0.42; nx: 0; ny: - 0.0336; nz: - 0.00900306; tu: 0.92; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: - 0.42; nx: 0.000371282; ny: - 0.00138564; nz: - 0.00037128; tu: 0.92; tv: 0;
    ), (X: 0.42; Y: - 0.5; z: - 0.42; nx: 0.000428717; ny: - 0.0016; nz: - 0.000428719; tu: 0.92; tv: 0;
    ), (X: 0.46; Y: - 0.489282; z: - 0.42; nx: 0.000428717; ny: - 0.0016; nz: - 0.000428719; tu: 0.96; tv: 0.010718;
    ), (X: 0.46; Y: - 0.489282; z: - 0.42; nx: 0.00101436; ny: - 0.00101436; nz: - 0.000371281; tu: 0.96; tv: 0.010718;
    ), (X: 0.46; Y: - 0.489282; z: - 0.42; nx: 0.00117128; ny: - 0.00117128; nz: - 0.00042872; tu: 0.96; tv: 0.010718;
    ), (X: 0.489282; Y: - 0.46; z: - 0.42; nx: 0.00117128; ny: - 0.00117128; nz: - 0.00042872; tu: 0.989282; tv: 0.04;
    ), (X: 0.489282; Y: - 0.46; z: - 0.42; nx: 0.00138564; ny: - 0.000371282; nz: - 0.000371282; tu: 0.989282; tv: 0.04;
    ), (X: 0.489282; Y: - 0.46; z: - 0.42; nx: 0.0016; ny: - 0.000428717; nz: - 0.000428717; tu: 0.989282; tv: 0.04;
    ), (X: 0.5; Y: - 0.42; z: - 0.42; nx: 0.0016; ny: - 0.000428717; nz: - 0.000428717; tu: 1; tv: 0.08;
    ), (X: 0.5; Y: - 0.42; z: - 0.42; nx: 0.0336; ny: 0; nz: - 0.00900306; tu: 1; tv: 0.08;
    ), (X: 0.5; Y: - 0.42; z: - 0.42; nx: 0.0336; ny: 0; nz: - 0.00900306; tu: 1; tv: 0.08;
    ), (X: 0.5; Y: 0.42; z: - 0.42; nx: 0.0336; ny: 0; nz: - 0.00900306; tu: 1; tv: 0.92;
    ), (X: 0.5; Y: 0.42; z: - 0.42; nx: 0.00138564; ny: 0.000371282; nz: - 0.00037128; tu: 1; tv: 0.92;
    ), (X: 0.5; Y: 0.42; z: - 0.42; nx: 0.0016; ny: 0.000428717; nz: - 0.000428718; tu: 1; tv: 0.92;
    ), (X: 0.489282; Y: 0.46; z: - 0.42; nx: 0.0016; ny: 0.000428717; nz: - 0.000428718; tu: 0.989282; tv: 0.96;
    ), (X: 0.489282; Y: 0.46; z: - 0.42; nx: 0.00101436; ny: 0.00101436; nz: - 0.00037128; tu: 0.989282; tv: 0.96;
    ), (X: 0.489282; Y: 0.46; z: - 0.42; nx: 0.00117128; ny: 0.00117128; nz: - 0.000428717; tu: 0.989282; tv: 0.96;
    ), (X: 0.46; Y: 0.489282; z: - 0.42; nx: 0.00117128; ny: 0.00117128; nz: - 0.000428717; tu: 0.96; tv: 0.989282;
    ), (X: 0.46; Y: 0.489282; z: - 0.42; nx: 0.00037128; ny: 0.00138564; nz: - 0.00037128; tu: 0.96; tv: 0.989282;
    ), (X: 0.46; Y: 0.489282; z: - 0.42; nx: 0.000428719; ny: 0.0016; nz: - 0.00042872; tu: 0.96; tv: 0.989282;
    ), (X: 0.42; Y: 0.5; z: - 0.42; nx: 0.000428719; ny: 0.0016; nz: - 0.00042872; tu: 0.92; tv: 1;
    ), (X: 0.42; Y: 0.5; z: - 0.42; nx: 0; ny: 0.0336; nz: - 0.00900311; tu: 0.92; tv: 1;
    ), (X: 0.42; Y: 0.5; z: - 0.42; nx: 0; ny: 0.0336; nz: - 0.00900311; tu: 0.92; tv: 1;
    ), (X: - 0.42; Y: 0.5; z: - 0.42; nx: 0; ny: 0.0336; nz: - 0.00900311; tu: 0.08; tv: 1;));

  RoundCubeIndices: array [0 .. 611] of Word = (0, 3, 2, 0, 1, 3, 0, 5, 4, 0, 6, 5, 0, 7, 6, 0, 8, 7, 0, 2, 8, 2, 9, 8,
    2, 10, 9, 2, 11, 10, 2, 12, 11, 2, 3, 12, 3, 13, 12, 3, 14, 13, 3, 15, 14, 3, 16, 15, 3, 1, 16, 1, 17, 16, 1, 18,
    17, 1, 19, 18, 1, 4, 19, 1, 0, 4, 4, 21, 20, 4, 5, 21, 5, 22, 21, 5, 6, 22, 6, 23, 22, 6, 7, 23, 7, 24, 23, 7, 8,
    24, 8, 25, 24, 8, 9, 25, 9, 26, 25, 9, 10, 26, 10, 27, 26, 10, 11, 27, 11, 28, 27, 11, 12, 28, 12, 29, 28, 12, 13,
    29, 13, 30, 29, 13, 14, 30, 14, 31, 30, 14, 15, 31, 15, 32, 31, 15, 16, 32, 16, 33, 32, 16, 17, 33, 17, 34, 33, 17,
    18, 34, 18, 35, 34, 18, 19, 35, 19, 20, 35, 19, 4, 20, 20, 37, 36, 20, 21, 37, 21, 38, 37, 21, 22, 38, 22, 39, 38,
    22, 23, 39, 23, 40, 39, 23, 24, 40, 24, 41, 40, 24, 25, 41, 25, 42, 41, 25, 26, 42, 26, 43, 42, 26, 27, 43, 27, 44,
    43, 27, 28, 44, 28, 45, 44, 28, 29, 45, 29, 46, 45, 29, 30, 46, 30, 47, 46, 30, 31, 47, 31, 48, 47, 31, 32, 48, 32,
    49, 48, 32, 33, 49, 33, 50, 49, 33, 34, 50, 34, 51, 50, 34, 35, 51, 35, 36, 51, 35, 20, 36, 104, 53, 52, 105, 106,
    53, 107, 54, 53, 108, 109, 54, 110, 55, 54, 111, 112, 55, 113, 56, 55, 114, 115, 56, 116, 57, 56, 117, 118, 57, 119,
    58, 57, 120, 121, 58, 122, 59, 58, 123, 124, 59, 125, 60, 59, 126, 127, 60, 128, 61, 60, 129, 130, 61, 131, 62, 61,
    132, 133, 62, 134, 63, 62, 135, 136, 63, 137, 64, 63, 138, 139, 64, 140, 65, 64, 141, 142, 65, 143, 66, 65, 144,
    145, 66, 146, 67, 66, 147, 148, 67, 149, 150, 67, 151, 153, 152, 154, 69, 68, 155, 156, 69, 157, 70, 69, 158, 159,
    70, 160, 71, 70, 161, 162, 71, 163, 72, 71, 164, 165, 72, 166, 73, 72, 167, 168, 73, 169, 74, 73, 170, 171, 74, 172,
    75, 74, 173, 174, 75, 175, 76, 75, 176, 177, 76, 178, 77, 76, 179, 180, 77, 181, 78, 77, 182, 183, 78, 184, 79, 78,
    185, 186, 79, 187, 80, 79, 188, 189, 80, 190, 81, 80, 191, 192, 81, 193, 82, 81, 194, 195, 82, 196, 83, 82, 197,
    198, 83, 199, 68, 83, 200, 201, 68, 68, 85, 84, 68, 69, 85, 69, 86, 85, 69, 70, 86, 70, 87, 86, 70, 71, 87, 71, 88,
    87, 71, 72, 88, 72, 89, 88, 72, 73, 89, 73, 90, 89, 73, 74, 90, 74, 91, 90, 74, 75, 91, 75, 92, 91, 75, 76, 92, 76,
    93, 92, 76, 77, 93, 77, 94, 93, 77, 78, 94, 78, 95, 94, 78, 79, 95, 79, 96, 95, 79, 80, 96, 80, 97, 96, 80, 81, 97,
    81, 98, 97, 81, 82, 98, 82, 99, 98, 82, 83, 99, 83, 84, 99, 83, 68, 84, 84, 85, 103, 85, 86, 103, 86, 87, 103, 87,
    101, 103, 87, 88, 101, 88, 89, 101, 89, 90, 101, 90, 91, 101, 91, 100, 101, 91, 92, 100, 92, 93, 100, 93, 94, 100,
    94, 95, 100, 95, 102, 100, 95, 96, 102, 96, 97, 102, 97, 98, 102, 98, 99, 102, 99, 103, 102, 99, 84, 103, 102, 101,
    100, 102, 103, 101);

constructor TRoundCube.Create(AOwner: TComponent);
begin
  inherited;
  Data.AssignFromMeshVertex(RoundCubeVertices, RoundCubeIndices);
end;

{ TCone }

constructor TCone.Create(AOwner: TComponent);
begin
  inherited;
  FSubdivisionsAxes := 12;
  FSubdivisionsCap := 1;
  FSubdivisionsHeight := 1;
  RebuildMesh;
end;

procedure TCone.RebuildMesh;
var
  A, H, AA, HH: Integer;
  Theta, Phi: Single;
  S, DTheta, DPhi: Single;
  PhiSin, PhiCos: Extended;
  IdxCount: Integer;
  Offset, VerticesWidth: Integer;
  N, N1, N2: TPoint3D;
begin
  VerticesWidth := (FSubdivisionsAxes + 1);
  FData.VertexBuffer.Length := (FSubdivisionsCap) * VerticesWidth + ((FSubdivisionsHeight + 1) * VerticesWidth) + 1;
  FData.IndexBuffer.Length := (FSubdivisionsCap - 1) * FSubdivisionsAxes * 6 + (FSubdivisionsAxes * 3) + 
    (FSubdivisionsHeight - 1) * FSubdivisionsAxes * 6 + (FSubdivisionsAxes * 3);
  DPhi := DegToRad(360) / FSubdivisionsAxes;
  IdxCount := 0;
  // bottom center
  FData.VertexBuffer.Vertices[FData.VertexBuffer.Length - 1] := Point3D(0, 0.5, 0); 
  FData.VertexBuffer.TexCoord0[FData.VertexBuffer.Length - 1] := PointF(0.5, 0.5);
  FData.VertexBuffer.Normals[FData.VertexBuffer.Length - 1] := Point3D(0, 1, 0);
  // bottom
  for H := 0 to FSubdivisionsCap - 1 do
  begin
    Phi := 0;
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Phi, PhiSin, PhiCos);
      FData.VertexBuffer.Vertices[A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
      FData.VertexBuffer.TexCoord0[A + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      if A = 0 then 
      begin
        FData.VertexBuffer.Vertices[FSubdivisionsAxes + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap), 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap)));
        FData.VertexBuffer.TexCoord0[FSubdivisionsAxes + (H * VerticesWidth)] := PointF(PhiCos * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5, (PhiSin * 0.5 * ((H + 1) / FSubdivisionsCap) + 0.5));
      end;
      AA := A + 1;
      HH := H - 1;
      if H = 0 then
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := FData.VertexBuffer.Length - 1;
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (H * VerticesWidth);
        IdxCount := IdxCount + 3;                                           
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      Phi := Phi + DPhi;
    end;
  end;
  // sides
  Phi := 0;
  Offset := VerticesWidth * FSubdivisionsCap;
  for H := 0 to FSubdivisionsHeight - 1 do
    for A := 0 to FSubdivisionsAxes - 1 do
    begin
      SinCos(Phi, PhiSin, PhiCos);
      S := 1 - (H / FSubdivisionsHeight);
      FData.VertexBuffer.Vertices[Offset + A + (H * VerticesWidth)] := Point3D(PhiCos * 0.5 * S, 0.5 - (1 - S), PhiSin * 0.5 * S);
      FData.VertexBuffer.TexCoord0[Offset + A + (H * VerticesWidth)] := PointF(A / FSubdivisionsAxes, S);
      if H = 0 then
      begin
        FData.VertexBuffer.Vertices[Offset + A + (FSubdivisionsHeight * VerticesWidth)] := Point3D(0, -0.5, 0);
        FData.VertexBuffer.TexCoord0[Offset + A + (FSubdivisionsHeight * VerticesWidth)] := PointF(A / FSubdivisionsAxes, 0);
      end;
      if A = 0 then
      begin
        FData.VertexBuffer.Vertices[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := FData.VertexBuffer.Vertices[Offset + (H * VerticesWidth)];
        FData.VertexBuffer.TexCoord0[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := PointF(1, S);
        if H = 0 then
        begin
          FData.VertexBuffer.Vertices[Offset + FSubdivisionsAxes + (FSubdivisionsHeight * VerticesWidth)] := Point3D(0, -0.5, 0);
          FData.VertexBuffer.TexCoord0[Offset + FSubdivisionsAxes + (FSubdivisionsHeight * VerticesWidth)] := PointF(1, 0);
        end;
      end;
      AA := A + 1;
      HH := H + 1;
      if H = FSubdivisionsHeight - 1 then
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := Offset + A + (FSubdivisionsHeight * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := Offset + AA + (H * VerticesWidth);
        IdxCount := IdxCount + 3;                                           
      end
      else
      begin
        FData.IndexBuffer.Indices[IdxCount + 0] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 2] := Offset + AA + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 1] := Offset + A + (HH * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 3] := Offset + A + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 5] := Offset + AA + (H * VerticesWidth);
        FData.IndexBuffer.Indices[IdxCount + 4] := Offset + AA + (HH * VerticesWidth); 
        IdxCount := IdxCount + 6;
      end;
      Phi := Phi + DPhi;
    end;
  FData.CalcNormals; 
  // smooth split
  for H := 0 to FSubdivisionsHeight - 2 do
  begin
    N1 := FData.VertexBuffer.Normals[Offset + 0 + (H * VerticesWidth)];
    N2 := FData.VertexBuffer.Normals[Offset + FSubdivisionsAxes + (H * VerticesWidth)];
    N.X := (N1.X + N2.X) / 2;
    N.Y := (N1.Y + N2.Y) / 2;
    N.Z := (N1.Z + N2.Z) / 2;
    N := Point3D(Vector3DNormalize(Vector3D(N)));
    FData.VertexBuffer.Normals[Offset + 0 + (H * VerticesWidth)] := N;
    FData.VertexBuffer.Normals[Offset + FSubdivisionsAxes + (H * VerticesWidth)] := N;
  end;
end;

procedure TCone.SetSubdivisionsAxes(const Value: Integer);
begin
  if FSubdivisionsAxes <> Value then
  begin
    FSubdivisionsAxes := Value;
    if FSubdivisionsAxes < 3 then
      FSubdivisionsAxes := 3;
    RebuildMesh;
  end;
end;

procedure TCone.SetSubdivisionsCap(const Value: Integer);
begin
  if FSubdivisionsCap <> Value then
  begin
    FSubdivisionsCap := Value;
    if FSubdivisionsCap < 3 then
      FSubdivisionsCap := 3;
    RebuildMesh;
  end;
end;

procedure TCone.SetSubdivisionsHeight(const Value: Integer);
begin
  if FSubdivisionsHeight <> Value then
  begin
    FSubdivisionsHeight := Value;
    if FSubdivisionsHeight < 1 then
      FSubdivisionsHeight := 1;
    RebuildMesh;
  end;
end;

{ TMesh }

procedure TMesh.Render;
begin
  Context.FillMesh(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), FData, AbsoluteOpacity);
end;

{ TExtrudedShape3D }

constructor TExtrudedShape3D.Create(AOwner: TComponent);
begin
  inherited;
  FMaterialBack := TMaterial.Create;
  FMaterialBack.Assign(FMaterial);
  FMaterialBack.OnChanged := MaterialChanged;
  FMaterialShaft := TMaterial.Create;
  FMaterialShaft.Assign(FMaterial);
  FMaterialShaft.OnChanged := MaterialChanged;
  FFlatness := 1;
  FSides := [TExtrudedShapeSide.esFront, TExtrudedShapeSide.esBack, TExtrudedShapeSide.esShaft];
  Width := 4;
  Height := 4;
  Depth := 1;
end;

destructor TExtrudedShape3D.Destroy;
begin
  FMaterialBack.Free;
  FMaterialShaft.Free;
  inherited;
end;

procedure TExtrudedShape3D.Apply;
var
  M: TMatrix3D;
begin
  inherited;
  M := IdentityMatrix3D;
  M.m41 := -Width / 2;
  M.m42 := -Height / 2;
  Context.SetMatrix(Matrix3DMultiply(M, AbsoluteMatrix));
end;

procedure TExtrudedShape3D.Render;
begin
end;

function TExtrudedShape3D.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := inherited;
end;

procedure TExtrudedShape3D.MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
var
  p3, rPos, rDir: TVector3D;
begin
  inherited;
  if RayCastIntersect(RayPos, RayDir, p3) then
  begin
    p3 := AbsoluteToLocalVector(p3);
    X := (((p3.X + (Width / 2)) / Width) * Width);
    Y := (((-p3.z + (Depth / 2)) / Depth) * Depth);
  end
  else
    Exit;
  ShapeMouseMove(Shift, X, Y);
end;

procedure TExtrudedShape3D.MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
var
  p3, rPos, rDir: TVector3D;
begin
  inherited;
  if RayCastIntersect(RayPos, RayDir, p3) then
  begin
    p3 := AbsoluteToLocalVector(p3);
    X := (((p3.X + (Width / 2)) / Width) * Width);
    Y := (((-p3.z + (Depth / 2)) / Depth) * Depth);
  end
  else
    Exit;
  ShapeMouseDown(Button, Shift, X, Y);
end;

procedure TExtrudedShape3D.MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
var
  p3, rPos, rDir: TVector3D;
begin
  inherited;
  if RayCastIntersect(RayPos, RayDir, p3) then
  begin
    p3 := AbsoluteToLocalVector(p3);
    X := (((p3.X + (Width / 2)) / Width) * Width);
    Y := (((-p3.z + (Depth / 2)) / Depth) * Depth);
  end;
  ShapeMouseUp(Button, Shift, X, Y);
end;

procedure TExtrudedShape3D.ShapeMouseMove(Shift: TShiftState; X, Y: Single);
begin
end;

procedure TExtrudedShape3D.ShapeMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
end;

procedure TExtrudedShape3D.ShapeMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
end;

procedure TExtrudedShape3D.SetFlatness(const Value: Single);
begin
  if FFlatness <> Value then
  begin
    FFlatness := Value;
    if FFlatness < 0.05 then
      FFlatness := 0.05;
    Repaint;
  end;
end;

procedure TExtrudedShape3D.SetSides(const Value: TExtrudedShapeSides);
begin
  if FSides <> Value then
  begin
    FSides := Value;
    Repaint;
  end;
end;

procedure TExtrudedShape3D.SetMaterialBack(const Value: TMaterial);
begin
  FMaterialBack.Assign(Value);
end;

procedure TExtrudedShape3D.SetMaterialShaft(const Value: TMaterial);
begin
  FMaterialShaft.Assign(Value);
end;

{ TRectangle3D }

constructor TRectangle3D.Create(AOwner: TComponent);
begin
  inherited;
  FCorners := AllCorners;
end;

destructor TRectangle3D.Destroy;
begin
  inherited;
end;

function TRectangle3D.IsCornersStored: Boolean;
begin
  Result := FCorners <> AllCorners;
end;

procedure TRectangle3D.Render;
var
  S: TPointF;
  VP: TPolygon;
  r: TRectF;
  Path: TPathData;
begin
  inherited;
  Path := TPathData.Create;
  Path.AddRectangle(RectF(0, 0, Width, Height), XRadius, YRadius, FCorners, FCornerType);
  S := Path.FlattenToPolygon(VP, FFlatness);
  if (S.X > 0) and (S.Y > 0) then
  begin
    r := RectF(0, 0, S.X, S.Y);
    { front }
    if TExtrudedShapeSide.esFront in FSides then
    begin
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
    end;
    { back }
    if TExtrudedShapeSide.esBack in FSides then
    begin
      Context.SetMaterial(FMaterialBack);
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
    end;
    { shaft }
    if TExtrudedShapeSide.esShaft in FSides then
    begin
      Context.SetMaterial(FMaterialShaft);
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
    end;
  end;
  Path.Free;
end;

procedure TRectangle3D.SetCorners(const Value: TCorners);
begin
  if FCorners <> Value then
  begin
    FCorners := Value;
    Repaint;
  end;
end;

procedure TRectangle3D.SetCornerType(const Value: TCornerType);
begin
  if FCornerType <> Value then
  begin
    FCornerType := Value;
    Repaint;
  end;
end;

procedure TRectangle3D.SetXRadius(const Value: Single);
begin
  if FXRadius <> Value then
  begin
    FXRadius := Value;
    Repaint;
  end;
end;

procedure TRectangle3D.SetYRadius(const Value: Single);
begin
  if FYRadius <> Value then
  begin
    FYRadius := Value;
    Repaint;
  end;
end;

{ TEllipse3D }

procedure TEllipse3D.Render;
var
  S: TPointF;
  VP: TPolygon;
  r: TRectF;
  Path: TPathData;
begin
  inherited;
  Path := TPathData.Create;

  r := RectF(0, 0, Width, Height);
  Path.AddEllipse(r);

  S := Path.FlattenToPolygon(VP, FFlatness);
  if (S.X > 0) and (S.Y > 0) then
  begin
    r := RectF(0, 0, S.X, S.Y);
    { front }
    if TExtrudedShapeSide.esFront in FSides then
    begin
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
    end;
    { back }
    if TExtrudedShapeSide.esBack in FSides then
    begin
      Context.SetMaterial(FMaterialBack);
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
    end;
    { left }
    if TExtrudedShapeSide.esShaft in FSides then
    begin
      Context.SetMaterial(FMaterialShaft);
      Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
        RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
    end;
  end;
  Path.Free;
end;

{ TText3D }

constructor TText3D.Create(AOwner: TComponent);
begin
  inherited;
  FFont := TFont.Create;
  FFont.OnChanged := FontChanged;
  FFlatness := 1;
  Depth := 0.3;
  Width := 3;
  Height := 2;
  ZWrite := True;
  WordWrap := True;
end;

destructor TText3D.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TText3D.Render;
var
  r: TRectF;
  W, H: Single;
  Path: TPathData;
  VP: TPolygon;
  B: TPointF;
  i: Integer;
  Factor: Single;
begin
  inherited;
  if Text <> '' then
  begin
    if GetMeasureBitmap.Canvas.BeginScene then
    try
      if Projection = TProjection.pjCamera then
        Factor := 10
      else
        Factor := 1;

      GetMeasureBitmap.Canvas.Font.Family := Font.Family;
      GetMeasureBitmap.Canvas.Font.Style := Font.Style;
      GetMeasureBitmap.Canvas.Font.Size := Font.Size * Factor;
      Path := TPathData.Create;
      if Stretch then
      begin
        r := RectF(0, 0, Width * Factor, Height * Factor);
        if GetMeasureBitmap.Canvas.TextToPath(Path, r, Text, WordWrap, HorzTextAlign, VertTextAlign) then
        begin
          B := Path.FlattenToPolygon(VP, FFlatness);
          if (B.X > 0) and (B.Y > 0) then
          begin
            { front }
            if TExtrudedShapeSide.esFront in FSides then
            begin
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
            end;
            { back }
            if TExtrudedShapeSide.esBack in FSides then
            begin
              Context.SetMaterial(FMaterialBack);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
            end;
            { left }
            if TExtrudedShapeSide.esShaft in FSides then
            begin
              Context.SetMaterial(FMaterialShaft);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
            end;
          end;
        end;
      end
      else
      begin
        r := RectF(0, 0, Width * Factor, Height * Factor);
        if GetMeasureBitmap.Canvas.TextToPath(Path, r, Text, WordWrap, HorzTextAlign, VertTextAlign) then
        begin
          if not WordWrap then
          begin
            r := RectF(0, 0, Width * Factor, Height * Factor);
            GetMeasureBitmap.Canvas.MeasureText(r, Text, WordWrap, [], HorzTextAlign, VertTextAlign);
            case HorzTextAlign of
              TTextAlign.taCenter:
                r := RectF(0, 0, Width * Factor, RectHeight(r));
              TTextAlign.taLeading:
                r := RectF(0, 0, Width * Factor, RectHeight(r));
              TTextAlign.taTrailing:
                r := RectF(Width * Factor - RectWidth(r), 0, Width * Factor, RectHeight(r));
            end;
            r := UnionRect(r, RectF(0, 0, Width * Factor, Height * Factor));
          end
          else
          begin
            GetMeasureBitmap.Canvas.MeasureText(r, Text, WordWrap, [], HorzTextAlign, VertTextAlign);
            r := UnionRect(r, RectF(0, 0, Width * Factor, Height * Factor));
          end;
          B := Path.FlattenToPolygon(VP, FFlatness);
          if (B.X > 0) and (B.Y > 0) then
          begin
            { front }
            if TExtrudedShapeSide.esFront in FSides then
            begin
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), r, VP, AbsoluteOpacity, False, True, False);
            end;
            { back }
            if TExtrudedShapeSide.esBack in FSides then
            begin
              Context.SetMaterial(FMaterialBack);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), r, VP, AbsoluteOpacity, True, False, False);
            end;
            { left }
            if TExtrudedShapeSide.esShaft in FSides then
            begin
              Context.SetMaterial(FMaterialShaft);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r) / Factor, RectHeight(r) / Factor,
                Depth), r, VP, AbsoluteOpacity, False, False, True);
            end;
          end;
        end;
      end;
    finally
      GetMeasureBitmap.Canvas.EndScene;
    end;
    Path.Free;
  end;
  if (csDesigning in ComponentState) and not Locked then
  begin
    Context.SetColor(TMaterialColor.mcDiffuse, $8060A799);
    Context.DrawCube(Vector3D(Width / 2, Height / 2, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

function TText3D.GetPathBounds: TRectF;
var
  r: TRectF;
  W, H: Single;
  Bmp: TBitmap;
  Path: TPathData;
  VP: TPolygon;
  B: TPointF;
  i: Integer;
begin
  Result := RectF(0, 0, Width, Height);
  if Text <> '' then
  begin
    Bmp := TBitmap.Create(1, 1);
    Bmp.Canvas.Font.Family := Font.Family;
    Bmp.Canvas.Font.Style := Font.Style;
    Bmp.Canvas.Font.Size := Font.Size;
    Path := TPathData.Create;
    if Stretch then
      r := RectF(0, 0, Width * 10, Height * 10)
    else
    begin
      r := RectF(0, 0, Width * 10, Height * 10);
      if Bmp.Canvas.TextToPath(Path, r, Text, WordWrap, HorzTextAlign, VertTextAlign) then
      begin
        Result := Path.GetBounds;
      end;
    end;
    Path.Free;
    Bmp.Free;

    Result := RectF(Result.Left / 10, Result.Top / 10, Result.Right / 10, Result.Bottom / 10);
  end;
end;

function TText3D.GetTextBounds: TRectF;
var
  r: TRectF;
  W, H: Single;
  B: TBitmap;
  i: Integer;
begin
  Result := RectF(0, 0, 0, 0);
  if Text <> '' then
  begin
    B := TBitmap.Create(1, 1);
    try
      B.Canvas.Font.Family := Font.Family;
      B.Canvas.Font.Style := Font.Style;
      B.Canvas.Font.Size := Font.Size;
      if Stretch then
        r := RectF(0, 0, Width, Height)
      else
      begin
        r := RectF(0, 0, Width * 10, Height * 10);
        B.Canvas.MeasureText(r, Text, WordWrap, [], TTextAlign.taLeading, TTextAlign.taLeading);
        Result := RectF(0, 0, r.Right / 10, r.Bottom / 10);
      end;
    finally
      B.Free;
    end;
  end;
end;

function TText3D.GetPathLength: Single;
var
  r: TRectF;
  W, H: Single;
  Bmp: TBitmap;
  Path: TPathData;
  Points: TPolygon;
  i: Integer;
  len: Single;
begin
  Result := 0;
  if Text <> '' then
  begin
    Bmp := TBitmap.Create(1, 1);
    try
      Bmp.Canvas.Font.Family := Font.Family;
      Bmp.Canvas.Font.Style := Font.Style;
      Bmp.Canvas.Font.Size := Font.Size;
      Path := TPathData.Create;
      try
        if Stretch then
        begin
          r := RectF(0, 0, Width * 10, Height * 10);
          Bmp.Canvas.TextToPath(Path, r, Text, WordWrap, HorzTextAlign, VertTextAlign);
        end
        else
        begin
          r := RectF(0, 0, Width * 10, Height * 10);
          Bmp.Canvas.MeasureText(r, Text, WordWrap, [], TTextAlign.taLeading, VertTextAlign);
          Bmp.Canvas.TextToPath(Path, r, Text, WordWrap, HorzTextAlign, VertTextAlign);
        end;
        Path.FlattenToPolygon(Points, FFlatness);
      finally
        Path.Free;
      end;
    finally
      Bmp.Free;
    end;
    for i := 0 to High(Points) do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
        continue;
      with Points[i] do
      begin
        if (i > 0) then
        begin
          if Points[i - 1].X >= $FFFF then
          begin
            Result := Result + VectorLength(Vector(X - Points[i - 2].X, Y - Points[i - 2].Y));
          end
          else
          begin
            Result := Result + VectorLength(Vector(X - Points[i - 1].X, Y - Points[i - 1].Y));
          end;
        end;
      end;
    end;
    Result := Result / 10;
  end;
end;

procedure TText3D.FontChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TText3D.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TText3D.SetText(const Value: WideString);
begin
  if FText <> Value then
  begin
    FText := Value;
    Repaint;
  end;
end;

procedure TText3D.SetHorzTextAlign(const Value: TTextAlign);
begin
  if FHorzTextAlign <> Value then
  begin
    FHorzTextAlign := Value;
    Repaint;
  end;
end;

procedure TText3D.SetStretch(const Value: Boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Repaint;
  end;
end;

procedure TText3D.SetVertTextAlign(const Value: TTextAlign);
begin
  if FVertTextAlign <> Value then
  begin
    FVertTextAlign := Value;
    Repaint;
  end;
end;

procedure TText3D.SetWordWrap(const Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
  end;
end;

{ TPath3D }

constructor TPath3D.Create(AOwner: TComponent);
begin
  inherited;
  FPath := TPathData.Create;
  FPath.OnChanged := PathChanged;
  FFlatness := 2;
  FWrapMode := TPathWrapMode.pwStretch;
end;

destructor TPath3D.Destroy;
begin
  FPath.Free;
  inherited;
end;

procedure TPath3D.Render;
var
  S: TPointF;
  VP: TPolygon;
  r: TRectF;
  i, j: Integer;
begin
  inherited;
  if not FPath.IsEmpty then
  begin
    case FWrapMode of
      TPathWrapMode.pwOriginal:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            r := RectF(0, 0, S.X, S.Y);
            { front }
            if TExtrudedShapeSide.esFront in FSides then
            begin
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
            end;
            { back }
            if TExtrudedShapeSide.esBack in FSides then
            begin
              Context.SetMaterial(FMaterialBack);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
            end;
            { left }
            if TExtrudedShapeSide.esShaft in FSides then
            begin
              Context.SetMaterial(FMaterialShaft);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
            end;
          end;
        end;
      TPathWrapMode.pwFit:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            r := RectF(0, 0, S.X, S.Y);
            FitRect(r, RectF(0, 0, Width, Height));
            { front }
            if TExtrudedShapeSide.esFront in FSides then
            begin
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
            end;
            { back }
            if TExtrudedShapeSide.esBack in FSides then
            begin
              Context.SetMaterial(FMaterialBack);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
            end;
            { left }
            if TExtrudedShapeSide.esShaft in FSides then
            begin
              Context.SetMaterial(FMaterialShaft);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
            end;
          end;
        end;
      TPathWrapMode.pwStretch:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            r := RectF(0, 0, Width, Height);
            { front }
            if TExtrudedShapeSide.esFront in FSides then
            begin
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
            end;
            { back }
            if TExtrudedShapeSide.esBack in FSides then
            begin
              Context.SetMaterial(FMaterialBack);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
            end;
            { left }
            if TExtrudedShapeSide.esShaft in FSides then
            begin
              Context.SetMaterial(FMaterialShaft);
              Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
            end;
          end;
        end;
      TPathWrapMode.pwTile:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            r := RectF(0, 0, S.X, S.Y);
            for i := 0 to round(Width / RectWidth(r)) do
              for j := 0 to round(Height / RectHeight(r)) do
              begin
                r := RectF(0, 0, S.X, S.Y);
                OffsetRect(r, i * (RectWidth(r)), j * (RectHeight(r)));
                { front }
                if TExtrudedShapeSide.esFront in FSides then
                begin
                  Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                    RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, True, False);
                end;
                { back }
                if TExtrudedShapeSide.esBack in FSides then
                begin
                  Context.SetMaterial(FMaterialBack);
                  Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                    RectF(0, 0, 0, 0), VP, AbsoluteOpacity, True, False, False);
                end;
                { left }
                if TExtrudedShapeSide.esShaft in FSides then
                begin
                  Context.SetMaterial(FMaterialShaft);
                  Context.FillPolygon(Vector3D(Width / 2, Height / 2, 0), Vector3D(RectWidth(r), RectHeight(r), Depth),
                    RectF(0, 0, 0, 0), VP, AbsoluteOpacity, False, False, True);
                end;
              end;
          end;
        end;
    end;
  end;
  if (csDesigning in ComponentState) and not Locked then
  begin
    Context.SetColor(TMaterialColor.mcDiffuse, $8060A799);
    Context.DrawCube(Vector3D(Width / 2, Height / 2, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

procedure TPath3D.PathChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TPath3D.SetPath(const Value: TPathData);
begin
  FPath.Assign(Value);
end;

procedure TPath3D.SetWrapMode(const Value: TPathWrapMode);
begin
  if FWrapMode <> Value then
  begin
    FWrapMode := Value;
    Repaint;
  end;
end;

{ TSelectionPoint3D }

constructor TSelectionPoint3D.Create(AOwner: TComponent);
begin
  inherited;
  FWorkPlane := TPosition3D.Create(Point3D(0, 1, 0));
  AutoCapture := True;
end;

destructor TSelectionPoint3D.Destroy;
begin
  FWorkPlane.Free;
  inherited;
end;

procedure TSelectionPoint3D.DoMouseEnter;
begin
  inherited;
  Repaint;
end;

procedure TSelectionPoint3D.MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single;
  RayPos, RayDir: TVector3D);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressed := True;
    FOldRayPos := RayPos;
    FOldRayDir := RayDir;
    FOldRayPos := LocalToAbsoluteVector(RayPos);
    FOldRayDir := Vector3DNormalize(LocalToAbsoluteVector(RayDir));
    FAngle := 0;
  end;
end;

procedure TSelectionPoint3D.MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
var
  V, V1, V2, M: TVector3D;
  r: TMatrix3D;
begin
  inherited;
  if FPressed then
  begin
    RayPos := LocalToAbsoluteVector(RayPos);
    RayDir := Vector3DNormalize(LocalToAbsoluteVector(RayDir));
    // plane space
    V := FWorkPlane.Vector;
    V.W := 0;
    V := LocalToAbsoluteVector(V);
    if not RayCastPlaneIntersect(FOldRayPos, FOldRayDir, AbsolutePosition, V, V1) then
      Exit;
    if not RayCastPlaneIntersect(RayPos, RayDir, AbsolutePosition, V, V2) then
      Exit;
    // convert to parent space
    if (Parent <> nil) and (Parent is TControl3D) then
    begin
      V1 := TControl3D(Parent).AbsoluteToLocalVector(V1);
      V2 := TControl3D(Parent).AbsoluteToLocalVector(V2);
    end;
    case Kind of
      TSelectionPointKind.spMove:
        begin
          // calc move vector
          M := Vector3DSubtract(V2, V1);
          // move
          Position.Vector := Vector3DAdd(Position.Vector, M);
        end;
      TSelectionPointKind.spRotation:
        begin
          // calc angle
          if (FWorkPlane.X = 0) and (FWorkPlane.Y = 1) and (FWorkPlane.z = 0) then
          begin
            V1 := Vector3D(1, 0, 0);
            V := Vector3D(Vector3DLength(Position.Vector), 0, 0);
            if Vector3DCrossProduct(V1, V2).Y < 0 then
              FAngle := ArcCos(Vector3DAngleCosine(V1, V2))
            else
              FAngle := -ArcCos(Vector3DAngleCosine(V1, V2));
          end
          else if (FWorkPlane.X = 0) and (FWorkPlane.Y = 0) and (FWorkPlane.z = 1) then
          begin
            V1 := Vector3D(1, 0, 0);
            V := Vector3D(Vector3DLength(Position.Vector), 0, 0);
            if Vector3DCrossProduct(V1, V2).z < 0 then
              FAngle := ArcCos(Vector3DAngleCosine(V1, V2))
            else
              FAngle := -ArcCos(Vector3DAngleCosine(V1, V2));
          end
          else if (FWorkPlane.X = 1) and (FWorkPlane.Y = 0) and (FWorkPlane.z = 0) then
          begin
            V1 := Vector3D(0, 1, 0);
            V := Vector3D(Vector3DLength(Position.Vector), 0, 0);
            if Vector3DCrossProduct(V1, V2).X < 0 then
              FAngle := ArcCos(Vector3DAngleCosine(V1, V2))
            else
              FAngle := -ArcCos(Vector3DAngleCosine(V1, V2));
          end;
          V := Vector3D(Vector3DLength(Position.Vector), 0, 0);
          RotateVector(V, FWorkPlane.Vector, FAngle);
          FAngle := RadToDeg(FAngle);
          // move
          Position.Vector := V;
        end;
    end;
    if Assigned(FOnTrack) then
      FOnTrack(Self);
    //
    FOldRayPos := RayPos;
    FOldRayDir := RayDir;
  end;
end;

procedure TSelectionPoint3D.MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single;
  RayPos, RayDir: TVector3D);
begin
  inherited;
  if FPressed then
  begin
    if Assigned(FOnChange) then
      FOnChange(Self);
    FPressed := False;
    Repaint;
  end;
end;

procedure TSelectionPoint3D.DoMouseLeave;
begin
  inherited;
  Repaint;
end;

procedure TSelectionPoint3D.Render;
begin
  Context.SetContextState(TContextState.csTexDisable);
  Context.SetContextState(TContextState.csLightOff);
  if IsMouseOver then
    Context.SetColor(TMaterialColor.mcDiffuse, TAlphaColors.Red)
  else
    Context.SetColor(TMaterialColor.mcDiffuse, TAlphaColors.Blue);
  Context.FillCube(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
  Context.SetColor(TMaterialColor.mcDiffuse, TAlphaColors.White);
  Context.DrawCube(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
end;

function TSelectionPoint3D.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := inherited;
end;

procedure TSelectionPoint3D.SetWorkPlane(const Value: TPosition3D);
begin
  FWorkPlane.Assign(Value);
end;

{ TModel3D }

procedure TModel3D.Clear;
var
  i: Integer;
begin
  if not (csDestroying in ComponentState) then
  for i := 0 to High(FMeshCollection) do
  begin
    RemoveObject(FMeshCollection[i]);
    FMeshCollection[i].Free;
  end;

  FMeshCollection := nil;
end;

constructor TModel3D.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TModel3D.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Data', ReadModel, WriteModel, True);
end;

destructor TModel3D.Destroy;
begin
  Clear;
  inherited;
end;

function TModel3D.LoadFromFile(const AFileName: WideString): Boolean;
var
  I: Integer;
begin
  Clear;
  Result := TModelImportServices.LoadFromFile(AFileName, FMeshCollection, Self);
  UpdateMeshCollection;
end;

procedure TModel3D.ReadModel(Stream: TStream);

  procedure Read(AStream: TStream);
  var
    i, l: Integer;
    LLength: Word;
  begin
    Clear;
    AStream.ReadBuffer(LLength, 2);
    SetLength(FMeshCollection, LLength);
    for i := 0 to LLength - 1 do
    begin
      FMeshCollection[i] := TMesh.Create(Self);
      AStream.ReadComponent(FMeshCollection[i]);
      FMeshCollection[i].Stored := False;
    end;
  end;

begin
  Read(Stream);
  UpdateMeshCollection;
end;

procedure TModel3D.UpdateMeshCollection;
var
  I: Integer;
begin
  for i := 0 to High(FMeshCollection) do
  begin
    FMeshCollection[I].HitTest := False;
    FMeshCollection[I].Lock;
    AddObject(FMeshCollection[I]);
  end;
end;

procedure TModel3D.WriteModel(Stream: TStream);

  procedure Write(AStream: TStream);
  var
    i, l: Integer;
    LLength: Word;
  begin
    LLength := Length(FMeshCollection);
    AStream.WriteBuffer(LLength, 2);
    for i := 0 to LLength - 1 do
    begin
      AStream.WriteComponent(FMeshCollection[i]);
    end;
  end;

begin
  Write(Stream);
end;

initialization
  RegisterFmxClasses([TPlane, TDisk, TCube, TMesh, TSphere, TCylinder, TRoundCube, TCone,
    TGrid3D, TStrokeCube, TText3D, TPath3D, TRectangle3D, TEllipse3D, TSelectionPoint3D,
    TShape3D, TExtrudedShape3D, TModel3D]);
end.
