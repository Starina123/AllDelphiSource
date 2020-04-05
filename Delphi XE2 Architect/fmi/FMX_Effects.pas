{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Effects;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Filter;

type

{ TBlurEffect }

  TBlurEffect = class(TEffect)
  private
    FBlur: TFilter;
    FSoftness: Single;
    procedure SetSoftness(const Value: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  published
    property Softness: Single read FSoftness write SetSoftness;
  end;

{ TShadowEffect }

  TShadowEffect = class(TEffect)
  private
    FGlow: TFilter;
    FDistance: Single;
    FSoftness: Single;
    FShadowColor: TAlphaColor;
    FOpacity: Single;
    FDirection: Single;
    procedure SetDistance(const Value: Single);
    procedure SetSoftness(const Value: Single);
    procedure SetShadowColor(const Value: TAlphaColor);
    procedure SetOpacity(const Value: Single);
    function GetShadowColor: TAlphaColor;
    procedure SetDirection(const Value: Single);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  published
    property Distance: Single read FDistance write SetDistance;
    property Direction: Single read FDirection write SetDirection;
    property Softness: Single read FSoftness write SetSoftness;
    property Opacity: Single read FOpacity write SetOpacity;
    property ShadowColor: TAlphaColor read GetShadowColor write SetShadowColor;
  end;

{ TGlowEffect }

  TGlowEffect = class(TEffect)
  private
    FGlow: TFilter;
    FGlowColor: TAlphaColor;
    FSoftness: Single;
    FOpacity: Single;
    procedure SetSoftness(const Value: Single);
    function GetGlowColor: TAlphaColor;
    procedure SetGlowColor(const Value: TAlphaColor);
    procedure SetOpacity(const Value: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
  published
    property Softness: Single read FSoftness write SetSoftness;
    property GlowColor: TAlphaColor read GetGlowColor write SetGlowColor;
    property Opacity: Single read FOpacity write SetOpacity;
  end;

{ TInnerGlowEffect }

  TInnerGlowEffect = class(TEffect)
  private
    FInnerGlow: TFilter;
    FGlowColor: TAlphaColor;
    FSoftness: Single;
    FOpacity: Single;
    procedure SetSoftness(const Value: Single);
    function GetGlowColor: TAlphaColor;
    procedure SetGlowColor(const Value: TAlphaColor);
    procedure SetOpacity(const Value: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  published
    property Softness: Single read FSoftness write SetSoftness;
    property GlowColor: TAlphaColor read GetGlowColor write SetGlowColor;
    property Opacity: Single read FOpacity write SetOpacity;
  end;

{ TBevelEffect }

  TBevelEffect = class(TEffect)
  private
    FDirection: Single;
    FSize: Integer;
    procedure SetDirection(const Value: Single);
    procedure SetSize(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  published
    property Direction: Single read FDirection write SetDirection;
    property Size: Integer read FSize write SetSize;
  end;

{ TReflectionEffect }

  TReflectionEffect = class(TEffect)
  private
    FOffset: Integer;
    FOpacity: Single;
    FLength: Single;
    FReflection: TFilter;
    procedure SetOpacity(const Value: Single);
    procedure SetOffset(const Value: Integer);
    procedure SetLength(const Value: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; override;
    function GetOffset: TPointF; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  published
    property Opacity: Single read FOpacity write SetOpacity;
    property Offset: Integer read FOffset write SetOffset;
    property Length: Single read FLength write SetLength;
  end;

procedure Blur(const Canvas: TCanvas; const Bitmap: TBitmap;
  const Radius: Integer; UseAlpha: Boolean = True);

implementation

uses
  Math, SysUtils;

type
  PIntArray = ^TIntArray;
  TIntArray = array [0 .. 0] of Integer;

// Stack Blur Algorithm by Mario Klingemann <mario@quasimondo.com>

procedure Blur(const Canvas: TCanvas; const Bitmap: TBitmap;
  const Radius: Integer; UseAlpha: Boolean = True);
var
  pix: PAlphaColorArray;
  w, h, wm, hm, wh, vdiv: Integer;
  rsum, gsum, bsum, asum, x, y, i, yp, yi, yw: Integer;
  P: cardinal;
  divsum: Integer;
  stackpointer, stackstart: Integer;
  sir: PAlphaColorRec;
  rbs, r1, routsum, goutsum, boutsum, aoutsum, rinsum, ginsum, binsum,
  ainsum: Integer;
  dv: PIntArray;
  vmin: PIntArray;
  r, g, b, a: PIntArray;
  stack: PAlphaColorArray;
begin
  if (Radius < 1) then
    Exit;

  pix := Bitmap.Scanline[0];

  w := Bitmap.width;
  h := Bitmap.height;
  wm := w - 1;
  hm := h - 1;
  wh := w * h;
  vdiv := Radius + Radius + 1;

  GetMem(r, wh * SizeOf(Integer));
  GetMem(g, wh * SizeOf(Integer));
  GetMem(b, wh * SizeOf(Integer));
  GetMem(a, wh * SizeOf(Integer));
  GetMem(vmin, max(w, h) * SizeOf(Integer));
  try
    divsum := (vdiv + 1) shr 1;
    divsum := divsum * divsum;
    GetMem(dv, 256 * divsum * SizeOf(Integer));
    for i := 0 to 256 * divsum - 1 do
      dv[i] := (i div divsum);

    yw := 0;
    yi := 0;

    GetMem(stack, vdiv * SizeOf(TAlphaColor));

    r1 := Radius + 1;

    for y := 0 to h - 1 do
    begin
      rinsum := 0;
      ginsum := 0;
      binsum := 0;
      ainsum := 0;
      routsum := 0;
      goutsum := 0;
      boutsum := 0;
      aoutsum := 0;
      rsum := 0;
      gsum := 0;
      bsum := 0;
      asum := 0;
      for i := -Radius to Radius do
      begin
        P := pix[yi + min(wm, max(i, 0))];
        sir := @stack[i + Radius];
        sir.Color := P;
        rbs := r1 - abs(i);
        rsum := rsum + (sir.r * rbs);
        gsum := gsum + (sir.g * rbs);
        bsum := bsum + (sir.b * rbs);
        if UseAlpha then
          asum := asum + (sir.a * rbs);
        if (i > 0) then
        begin
          rinsum := rinsum + sir.r;
          ginsum := ginsum + sir.g;
          binsum := binsum + sir.b;
          if UseAlpha then
            ainsum := ainsum + sir.a;
        end
        else
        begin
          routsum := routsum + sir.r;
          goutsum := goutsum + sir.g;
          boutsum := boutsum + sir.b;
          if UseAlpha then
            aoutsum := aoutsum + sir.a;
        end
      end;
      stackpointer := Radius;

      for x := 0 to w - 1 do
      begin
        r[yi] := dv[rsum];
        g[yi] := dv[gsum];
        b[yi] := dv[bsum];
        if UseAlpha then
          a[yi] := dv[asum];

        rsum := rsum - routsum;
        gsum := gsum - goutsum;
        bsum := bsum - boutsum;
        if UseAlpha then
          asum := asum - aoutsum;

        stackstart := stackpointer - Radius + vdiv;
        sir := @stack[stackstart mod vdiv];

        routsum := routsum - sir.r;
        goutsum := goutsum - sir.g;
        boutsum := boutsum - sir.b;
        if UseAlpha then
          aoutsum := aoutsum - sir.a;

        if (y = 0) then
        begin
          vmin[x] := min(x + Radius + 1, wm);
        end;
        P := pix[yw + vmin[x]];
        sir.Color := P;

        rinsum := rinsum + sir.r;
        ginsum := ginsum + sir.g;
        binsum := binsum + sir.b;
        if UseAlpha then
          ainsum := ainsum + sir.a;

        rsum := rsum + rinsum;
        gsum := gsum + ginsum;
        bsum := bsum + binsum;
        if UseAlpha then
          asum := asum + ainsum;

        stackpointer := (stackpointer + 1) mod vdiv;
        sir := @stack[(stackpointer) mod vdiv];

        routsum := routsum + sir.r;
        goutsum := goutsum + sir.g;
        boutsum := boutsum + sir.b;
        if UseAlpha then
          aoutsum := aoutsum + sir.a;

        rinsum := rinsum - sir.r;
        ginsum := ginsum - sir.g;
        binsum := binsum - sir.b;
        if UseAlpha then
          ainsum := ainsum - sir.a;

        yi := yi + 1;
      end;
      yw := yw + w;
    end;

    for x := 0 to w - 1 do
    begin
      rinsum := 0;
      ginsum := 0;
      binsum := 0;
      ainsum := 0;
      routsum := 0;
      goutsum := 0;
      boutsum := 0;
      aoutsum := 0;
      rsum := 0;
      gsum := 0;
      bsum := 0;
      asum := 0;
      yp := -Radius * w;
      for i := -Radius to Radius do
      begin
        yi := max(0, yp) + x;

        sir := @stack[i + Radius];

        sir.r := r[yi];
        sir.g := g[yi];
        sir.b := b[yi];
        if UseAlpha then
          sir.a := a[yi];

        rbs := r1 - abs(i);

        rsum := rsum + (r[yi] * rbs);
        gsum := gsum + (g[yi] * rbs);
        bsum := bsum + (b[yi] * rbs);
        if UseAlpha then
          asum := asum + (a[yi] * rbs);

        if (i > 0) then
        begin
          rinsum := rinsum + sir.r;
          ginsum := ginsum + sir.g;
          binsum := binsum + sir.b;
          if UseAlpha then
            ainsum := ainsum + sir.a;
        end
        else
        begin
          routsum := routsum + sir.r;
          goutsum := goutsum + sir.g;
          boutsum := boutsum + sir.b;
          if UseAlpha then
            aoutsum := aoutsum + sir.a;
        end;

        if (i < hm) then
        begin
          yp := yp + w;
        end
      end;
      yi := x;
      stackpointer := Radius;
      for y := 0 to h - 1 do
      begin
        pix[yi] := (dv[asum] shl 24) or (dv[rsum] shl 16) or (dv[gsum] shl 8)
          or dv[bsum];

        rsum := rsum - routsum;
        gsum := gsum - goutsum;
        bsum := bsum - boutsum;
        if UseAlpha then
          asum := asum - aoutsum;

        stackstart := stackpointer - Radius + vdiv;
        sir := @stack[stackstart mod vdiv];

        routsum := routsum - sir.r;
        goutsum := goutsum - sir.g;
        boutsum := boutsum - sir.b;
        if UseAlpha then
          aoutsum := aoutsum - sir.a;

        if (x = 0) then
        begin
          vmin[y] := min(y + r1, hm) * w;
        end;
        P := x + vmin[y];

        sir.r := r[P];
        sir.g := g[P];
        sir.b := b[P];
        if UseAlpha then
          sir.a := a[P];

        rinsum := rinsum + sir.r;
        ginsum := ginsum + sir.g;
        binsum := binsum + sir.b;
        if UseAlpha then
          ainsum := ainsum + sir.a;

        rsum := rsum + rinsum;
        gsum := gsum + ginsum;
        bsum := bsum + binsum;
        if UseAlpha then
          asum := asum + ainsum;

        stackpointer := (stackpointer + 1) mod vdiv;
        sir := @stack[stackpointer];

        routsum := routsum + sir.r;
        goutsum := goutsum + sir.g;
        boutsum := boutsum + sir.b;
        if UseAlpha then
          aoutsum := aoutsum + sir.a;

        rinsum := rinsum - sir.r;
        ginsum := ginsum - sir.g;
        binsum := binsum - sir.b;
        if UseAlpha then
          ainsum := ainsum - sir.a;

        yi := yi + w;
      end;
    end;
  finally
    FreeMem(stack, vdiv * SizeOf(TAlphaColor));
    FreeMem(dv, 256 * divsum * SizeOf(Integer));
    FreeMem(vmin, max(w, h) * SizeOf(Integer));
    FreeMem(a, wh * SizeOf(Integer));
    FreeMem(r, wh * SizeOf(Integer));
    FreeMem(g, wh * SizeOf(Integer));
    FreeMem(b, wh * SizeOf(Integer));
  end;
  Bitmap.UpdateHandles;
end;

{ TBlurEffect }

constructor TBlurEffect.Create(AOwner: TComponent);
begin
  inherited;
  FBlur := FilterByName('GaussianBlur');
  DisablePaint := True;
  FSoftness := 0.3;
end;

destructor TBlurEffect.Destroy;
begin
  if FBlur <> nil then
    FBlur.Free;
  inherited;
end;

function TBlurEffect.GetOffset: TPointF;
begin
  Result := TPointF.Create(Trunc(FSoftness * 20), Trunc(FSoftness * 20));
end;

function TBlurEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
  Result.Inflate(Trunc(FSoftness * 20), Trunc(FSoftness * 20));
end;

procedure TBlurEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap;
  const Data: Single);
begin
  { stack blur version }
  if FSoftness > 0 then
  begin
    if (FBlur <> nil) and GlobalUseHWEffects then
    begin
      FBlur.Values['Input'] := VarFromBitmap(Visual);
      FBlur.Values['BlurAmount'] := FSoftness;
      Visual.Assign(TBitmap(VarToBitmap(FBlur.Values['Output'])));
    end
    else
    begin
      // Software mode
      Blur(Canvas, Visual, Trunc(FSoftness * 15));
    end;
  end;
end;

procedure TBlurEffect.SetSoftness(const Value: Single);
begin
  if FSoftness <> Value then
  begin
    FSoftness := Value;
    if FSoftness < 0 then
      FSoftness := 0;
    if FSoftness > 9 then
      FSoftness := 9;
    UpdateParentEffects;
  end;
end;

{ TShadowEffect }

constructor TShadowEffect.Create(AOwner: TComponent);
begin
  inherited;
  FGlow := FilterByName('Glow');
  DisablePaint := False;
  FShadowColor := $FF000000;
  FDirection := 45;
  FOpacity := 0.6;
  FSoftness := 0.3;
  FDistance := 3;
end;

destructor TShadowEffect.Destroy;
begin
  if FGlow <> nil then
    FGlow.Free;
  inherited;
end;

function TShadowEffect.GetOffset: TPointF;
var
  S, C: Extended;
begin
  SinCos(DegToRad(FDirection), S, C);
  Result := TPointF.Create(Trunc(FSoftness * 20), Trunc(FSoftness * 20));
end;

function TShadowEffect.GetRect(const ARect: TRectF): TRectF;
var
  S, C: Extended;
begin
  Result := ARect;
  InflateRect(Result, Trunc(FSoftness * 20), Trunc(FSoftness * 20));
  SinCos(DegToRad(FDirection), S, C);
  OffsetRect(Result, FDistance * C, FDistance * S);
end;

function TShadowEffect.GetShadowColor: TAlphaColor;
begin
  Result := FShadowColor;
end;

procedure TShadowEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap;
  const Data: Single);
begin
  if (FGlow <> nil) and GlobalUseHWEffects then
  begin
    FGlow.Values['Color'] := PremultiplyAlpha(MakeColor(FShadowColor, FOpacity));
    FGlow.Values['Input'] := VarFromBitmap(Visual);
    FGlow.Values['BlurAmount'] := FSoftness * 2;
    Visual.Assign(TBitmap(VarToBitmap(FGlow.Values['Output'])));
  end
  else 
  begin
    Visual.FillColor(MakeColor(CorrectColor(FShadowColor), FOpacity));
    Blur(Canvas, Visual, Trunc(5 + FSoftness * 10));
  end;
end;

procedure TShadowEffect.SetDirection(const Value: Single);
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    UpdateParentEffects;
  end;
end;

procedure TShadowEffect.SetDistance(const Value: Single);
begin
  if FDistance <> Value then
  begin
    FDistance := Value;
    UpdateParentEffects;
  end;
end;

procedure TShadowEffect.SetOpacity(const Value: Single);
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    if FOpacity < 0 then
      FOpacity := 0;
    if FOpacity > 1 then
      FOpacity := 1;
    UpdateParentEffects;
  end;
end;

procedure TShadowEffect.SetShadowColor(const Value: TAlphaColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    UpdateParentEffects;
  end;
end;

procedure TShadowEffect.SetSoftness(const Value: Single);
begin
  if FSoftness <> Value then
  begin
    FSoftness := Value;
    if FSoftness < 0 then
      FSoftness := 0;
    if FSoftness > 3 then
      FSoftness := 3;
    UpdateParentEffects;
  end;
end;

{ TGlowEffect }

constructor TGlowEffect.Create(AOwner: TComponent);
begin
  inherited;
  DisablePaint := False;
  FGlow := FilterByName('Glow');
  FGlowColor := $FFFFD700;
  FSoftness := 0.4;
  FOpacity := 0.9;
end;

destructor TGlowEffect.Destroy;
begin
  FreeAndNil(FGlow);
  inherited;
end;

function TGlowEffect.GetGlowColor: TAlphaColor;
begin
  Result := FGlowColor;
end;

function TGlowEffect.GetOffset: TPointF;
begin
  Result := TPointF.Create(4 + Trunc(FSoftness * 23), 4 + Trunc(FSoftness * 23));
end;

function TGlowEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
  InflateRect(Result, 4 + Trunc(FSoftness * 23), 4 + Trunc(FSoftness * 23));
end;

procedure TGlowEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap;
  const Data: Single);
begin
  if (FGlow <> nil) and GlobalUseHWEffects then
  begin
    FGlow.Values['Color'] := PremultiplyAlpha(MakeColor(FGlowColor, FOpacity));
    FGlow.Values['Input'] := VarFromBitmap(Visual);
    FGlow.Values['BlurAmount'] := FSoftness * 2;
    Visual.Assign(TBitmap(VarToBitmap(FGlow.Values['Output'])));
  end
  else
  begin
    { fill color }
    Visual.FillColor(MakeColor(CorrectColor(FGlowColor), FOpacity));
    { stack blur version }
    Blur(Canvas, Visual, Trunc(5 + FSoftness * 10));
  end;
end;

procedure TGlowEffect.SetGlowColor(const Value: TAlphaColor);
begin
  if FGlowColor <> Value then
  begin
    FGlowColor := Value;
    UpdateParentEffects;
  end;
end;

procedure TGlowEffect.SetOpacity(const Value: Single);
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    if FOpacity < 0 then
      FOpacity := 0;
    if FOpacity > 1 then
      FOpacity := 1;
    UpdateParentEffects;
  end;
end;

procedure TGlowEffect.SetSoftness(const Value: Single);
begin
  if FSoftness <> Value then
  begin
    FSoftness := Value;
    if FSoftness < 0 then
      FSoftness := 0;
    if FSoftness > 9 then
      FSoftness := 9;
    UpdateParentEffects;
  end;
end;

{ TInnerGlowEffect }

constructor TInnerGlowEffect.Create(AOwner: TComponent);
begin
  inherited;
  FInnerGlow := FilterByName('InnerGlow');
  AfterPaint := True;
  FGlowColor := $FFFFD700;
  FSoftness := 0.4;
  FOpacity := 0.9;
end;

destructor TInnerGlowEffect.Destroy;
begin
  FreeAndNil(FInnerGlow);
  inherited;
end;

function TInnerGlowEffect.GetOffset: TPointF;
begin
  Result := TPointF.Create(Trunc(FSoftness * 20), Trunc(FSoftness * 20));
end;

function TInnerGlowEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
  InflateRect(Result, Trunc(FSoftness * 20), Trunc(FSoftness * 20));
end;

procedure TInnerGlowEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap;
  const Data: Single);
var
  Mask: PByteArray;
begin
  if (FInnerGlow <> nil) and GlobalUseHWEffects then
  begin
    FInnerGlow.Values['Color'] := PremultiplyAlpha(MakeColor(FGlowColor, FOpacity));
    FInnerGlow.Values['Input'] := VarFromBitmap(Visual);
    FInnerGlow.Values['BlurAmount'] := FSoftness * 2;
    Visual.Assign(TBitmap(VarToBitmap(FInnerGlow.Values['Output'])));
  end
  else
  begin
    { invert }
    Visual.InvertAlpha;
    { create mask }
    Mask := Visual.CreateMask;
    { fill color }
    Visual.FillColor(MakeColor(CorrectColor(FGlowColor), FOpacity));
    { stack blur version }
    Blur(Canvas, Visual, Trunc(5 + FSoftness * 10));
    { apply mask }
    Visual.ApplyMask(Mask);
    { free mask }
    FreeMem(Mask, Visual.width * Visual.height);
  end;
end;

function TInnerGlowEffect.GetGlowColor: TAlphaColor;
begin
  Result := FGlowColor;
end;

procedure TInnerGlowEffect.SetGlowColor(const Value: TAlphaColor);
begin
  if FGlowColor <> Value then
  begin
    FGlowColor := Value;
    UpdateParentEffects;
  end;
end;

procedure TInnerGlowEffect.SetOpacity(const Value: Single);
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    if FOpacity < 0 then
      FOpacity := 0;
    if FOpacity > 1 then
      FOpacity := 1;
    UpdateParentEffects;
  end;
end;

procedure TInnerGlowEffect.SetSoftness(const Value: Single);
begin
  if FSoftness <> Value then
  begin
    FSoftness := Value;
    if FSoftness < 0 then
      FSoftness := 0;
    if FSoftness > 9 then
      FSoftness := 9;
    UpdateParentEffects;
  end;
end;

{ TBevelEffect }

constructor TBevelEffect.Create(AOwner: TComponent);
begin
  inherited;
  DisablePaint := True;
  FDirection := 45;
  FSize := 10;
end;

destructor TBevelEffect.Destroy;
begin
  inherited;
end;

function TBevelEffect.GetOffset: TPointF;
begin
  Result := PointF(5, 5);
end;

function TBevelEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
  InflateRect(Result, 5, 5);
end;

function VectorAngleCosine(const V1, V2: TVector): Single;
var
  dot, len1, len2: Single;
begin
  len1 := sqrt((V1.x * V1.x) + (V1.y * V1.y) + (V1.w * V1.w));
  len2 := sqrt((V2.x * V2.x) + (V2.y * V2.y) + (V2.w * V2.w));
  dot := (V1.V[0] * V2.V[0] + V1.V[1] * V2.V[1] + V1.V[2] * V2.V[2]);
  Result := len1 * len2;
  if abs(Result) > 1E-40 then
    Result := dot / Result
  else
    Result := 1;
end;

procedure TBevelEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap;
  const Data: Single);
var
  DestBits, Bits: PAlphaColorRecArray;
  i, j: Integer;
  a, h0, h1, h2, h3: Single;
  alpha: byte;
  light, n, V, b: TVector;
  LightMap: TBitmap;
begin
  if FSize = 0 then
    Exit;

  DestBits := PAlphaColorRecArray(Visual.Scanline[0]);
  { create lightmap }
  LightMap := TBitmap.Create(Visual.width, Visual.height);
  Bits := PAlphaColorRecArray(LightMap.Scanline[0]);
  { copy bitmap }
  System.Move(DestBits^, Bits^, Visual.width * Visual.height * 4);
  { blur - make HeightMap }
  Blur(Canvas, LightMap, FSize);
  { calculate lighting }
  a := DegToRad(FDirection);
  light.x := cos(a);
  light.y := 0;
  light.w := sin(a);
  { make normalmap from hightmap }
  for j := Visual.height - 2 downto 0 do
  begin
    for i := Visual.width - 2 downto 0 do
    begin
      // only calc not transparent pixels
{$IFDEF FPC_BIG_ENDIAN}
      alpha := DestBits[(i) + ((j) * Visual.width)].Color and $FF;
{$ELSE}
      alpha := DestBits[(i) + ((j) * Visual.width)].a;
{$ENDIF}
      if alpha > 0 then
      begin
{$IFDEF FPC_BIG_ENDIAN}
        h0 := (Bits[i + ((j + 1) * Visual.width)].Color and $FF) / $FF;
        // .height(x  ,z+1);
        h1 := (Bits[(i + 1) + ((j + 1) * Visual.width)].Color and $FF) / $FF;
        // height(x+1,z+1);
        h2 := (Bits[(i + 1) + (j * Visual.width)].Color and $FF) / $FF;
        // height(x+1,  z);
        h3 := (Bits[(i + 1) + ((j + 1) * Visual.width)].Color and $FF) / $FF;
        // height(x  ,  z);
{$ELSE}
        h0 := (Bits[i + ((j + 1) * Visual.width)].Color and $FF000000 shr 24) /
          $FF; // .height(x  ,z+1);
        h1 := (Bits[(i + 1) + ((j + 1) * Visual.width)].Color and
          $FF000000 shr 24) / $FF; // height(x+1,z+1);
        h2 := (Bits[(i + 1) + (j * Visual.width)].Color and $FF000000 shr 24) /
          $FF; // height(x+1,  z);
        h3 := (Bits[(i + 1) + ((j + 1) * Visual.width)].Color and
          $FF000000 shr 24) / $FF; // height(x  ,  z);
{$ENDIF}
        V.x := 1.0;
        V.y := h2 - h3;
        V.w := 0;

        b.x := 0;
        b.y := h0 - h3;
        b.w := 1; // vector length

        // calc normal
        n.x := b.y * V.w - V.y * b.w;
        n.y := V.x * b.w - b.x * V.w;
        n.w := b.x * V.y - V.x * b.y;

        // normalize
        n.x := n.x / b.w;
        n.y := n.y / b.w;
        n.w := n.w / b.w;

        // calc light
        a := VectorAngleCosine(light, n) * FSize;

        // set value
{$IFDEF FPC_BIG_ENDIAN}
        Color := DestBits[(i) + ((j) * Visual.width)].Color;
        ReverseBytes(@Color, 4);
        DestBits[(i) + ((j) * Visual.width)].Color :=
          PremultiplyAlpha(MakeColor(ChangeHSL(Color, 0, 0, a * 0.4),
          alpha / $FF));
        ReverseBytes(@DestBits[(i) + ((j) * Visual.width)], 4);
{$ELSE}
        DestBits[(i) + ((j) * Visual.width)].Color :=
          PremultiplyAlpha(MakeColor(ChangeHSL(DestBits[(i) + ((j) * Visual.width)
          ].Color, 0, 0, a * 0.4), alpha / $FF));
{$ENDIF}
      end;
    end;
  end;
  LightMap.Free;
end;

procedure TBevelEffect.SetDirection(const Value: Single);
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    UpdateParentEffects;
  end;
end;

procedure TBevelEffect.SetSize(const Value: Integer);
begin
  if FSize <> Value then
  begin
    FSize := Value;
    UpdateParentEffects;
  end;
end;

{ TReflectionEffect }

constructor TReflectionEffect.Create(AOwner: TComponent);
begin
  inherited;
  // DisablePaint := True;
  FReflection := FilterByName('Reflection');
  FOffset := 0;
  FLength := 0.5;
  FOpacity := 0.5;
end;

destructor TReflectionEffect.Destroy;
begin
  FreeAndNil(FReflection);
  inherited;
end;

function TReflectionEffect.GetOffset: TPointF;
begin
  Result := PointF(2, 2);
end;

function TReflectionEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
  InflateRect(Result, 2, 2);
  OffsetRect(Result, 0, RectHeight(ARect) + FOffset);
end;

procedure TReflectionEffect.ProcessEffect(Canvas: TCanvas;
  const Visual: TBitmap; const Data: Single);
var
  Bits: PAlphaColorRecArray;
  C, a, i, j: Integer;
  alpha: byte;
  Color: cardinal;
begin
  if (FReflection <> nil) and GlobalUseHWEffects then
  begin
    FReflection.Values['Opacity'] := FOpacity;
    FReflection.Values['Length'] := FLength;
    FReflection.Values['Input'] := VarFromBitmap(Visual);
    Visual.Assign(TBitmap(VarToBitmap(FReflection.Values['Output'])));
  end
  else
  begin
    Bits := PAlphaColorRecArray(Visual.Scanline[0]);
    C := Visual.height - 1;
    a := round(C * FLength);
    { without Offset }
    Visual.FlipVertical;
    { set alpha }
    for j := 0 to C do
      if j > (C - a) then
        for i := 0 to Visual.width - 1 do
        begin
          // only calc not transparent pixels
  {$IFDEF FPC_BIG_ENDIAN}
          alpha := Bits[i + (Visual.height - 1 - j) * Visual.width].Color and $FF;
  {$ELSE}
          alpha := Bits[i + (Visual.height - 1 - j) * Visual.width].a;
  {$ENDIF}
          if alpha > 0 then
          begin
  {$IFDEF FPC_BIG_ENDIAN}
            Color := Bits[i + (Visual.height - 1 - j) * Visual.width].Color;
            ReverseBytes(@Color, 4);
            TAlphaColorRec(Color).a := Trunc(((j - (C - a)) / a) * FOpacity * alpha);
            Bits[i + (Visual.height - 1 - j) * Visual.width].Color :=
              PremultiplyAlpha(Color);
            ReverseBytes(@Bits[i + (Visual.height - 1 - j) * Visual.width], 4);
  {$ELSE}
            Bits[i + (Visual.height - 1 - j) * Visual.width].a :=
              Trunc(((j - (C - a)) / a) * FOpacity * alpha);
            Bits[i + (Visual.height - 1 - j) * Visual.width].Color :=
              PremultiplyAlpha(Bits[i + (Visual.height - 1 - j) *
              Visual.width].Color);
  {$ENDIF}
          end;
        end
      else
        FillLongword(@Bits[(Visual.height - 1 - j) * Visual.width],
          Visual.width, $0);
  end;
end;

procedure TReflectionEffect.SetLength(const Value: Single);
begin
  if FLength <> Value then
  begin
    FLength := Value;
    if FLength < 0.1 then
      FLength := 0.1;
    if FLength > 1 then
      FLength := 1;
    UpdateParentEffects;
  end;
end;

procedure TReflectionEffect.SetOffset(const Value: Integer);
begin
  if FOffset <> Value then
  begin
    FOffset := Value;
    UpdateParentEffects;
  end;
end;

procedure TReflectionEffect.SetOpacity(const Value: Single);
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    UpdateParentEffects;
  end;
end;

initialization
  RegisterFmxClasses([TShadowEffect, TBlurEffect, TGlowEffect,
    TInnerGlowEffect, TBevelEffect, TReflectionEffect]);
end.
