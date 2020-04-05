{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Canvas_D2D;

{$I FMX_Defines.inc}

interface

procedure SetD2DDefault;

implementation

uses
  Winapi.Windows, Winapi.Messages, Winapi.MultiMon, Winapi.ActiveX, Winapi.Wincodec,
  Winapi.D3D10, Winapi.D2D1, Winapi.DxgiFormat, Winapi.DxgiType, Winapi.DXGI,
  Types, Classes, SysUtils,  Math, System.Win.ComObj,
  UITypes, FMX_Types, FMX_Platform_Win, FMX_Forms;

var
  Res: HResult;

const
  TargetMode: TD2D1RenderTargetType = D2D1_RENDER_TARGET_TYPE_DEFAULT;
  // Use mix-mode - SW-HW. Wait for DXGI and DX10 units in RTL

var
  Factory: ID2D1Factory;
  DWriteFactory: IDWriteFactory;
  ImagingFactoryVariable: IWICImagingFactory;

function ImagingFactory: IWICImagingFactory;
begin
  if ImagingFactoryVariable = nil then
    CoCreateInstance(CLSID_WICImagingFactory, nil, CLSCTX_INPROC_SERVER or CLSCTX_LOCAL_SERVER,
      IUnknown, ImagingFactoryVariable);
  Result := ImagingFactoryVariable;
end;

type

{ TD2DCanvasSaveState }

  TD2DCanvasSaveState = class(TCanvasSaveState)
  private
    FStateBlock: ID2D1DrawingStateBlock;
    FLayer: ID2D1Layer;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Assign(Source: TPersistent); override;
    procedure CreateLayer(const RenderTarget: ID2D1RenderTarget); inline;

    property Layer: ID2D1Layer read FLayer;
  end;

{ TBitmapCodecWIC }

  TBitmapCodecWIC = class(TBitmapCodec)
  published
    class function GetFileTypes: WideString; override;
    class function GetImageSize(const AFileName: WideString): TPointF; override;
    function LoadFromFile(const AFileName: WideString; const Rotate: Single; var Bitmap: TBitmap): Boolean; override;
    function SaveToFile(const AFileName: WideString; var Bitmap: TBitmap; const Params: WideString = ''): Boolean; override;
    function LoadThumbnailFromFile(const AFileName: WideString; const AFitWidth, AFitHeight: Single;
      const UseEmbedded: Boolean; var Bitmap: TBitmap): Boolean; override;
    function LoadFromStream(const AStream: TStream; var Bitmap: TBitmap): Boolean; override;
    function SaveToStream(const AStream: TStream; var Bitmap: TBitmap; const Format: WideString;
      const Params: WideString = ''): Boolean; override;
  end;

{ TCanvasD2D }

  TCanvasD2D = class(TCanvas)
  private
    FBitmapInfo: TBitmapInfo;
    FBufferBitmap: THandle;
    FBrush: ID2D1Brush;
    FStrokeBrush: ID2D1Brush;
    FStrokeStyle: ID2D1StrokeStyle;
    FLayer: ID2D1Layer;
    FWICBitmap: IWICBitmap;
    FCurrentSaveState: TD2DCanvasSaveState;
    FTarget: ID2D1RenderTarget;
    procedure CreateResources;
    procedure DisposeResources;
    function GetRenderTarget: ID2D1RenderTarget; inline;
    procedure SetClipRects(const ARects: array of TRectF); 
  protected
    FLocaleName: WideString;
    procedure ApplyFill(ARect: TRectF; const AOpacity: Single);
    procedure ApplyStroke(ARect: TRectF; const AOpacity: Single);
    procedure FontChanged(Sender: TObject); override;
    procedure IntFillPath(P: ID2D1Geometry; R: TRectF; Opacity: Single);
    procedure IntFillRect(R: TRectF; Opacity: Single);
    class function GetBitmapScanline(Bitmap: TBitmap; y: Integer): PAlphaColorArray; override;
    { Bitmaps }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); override;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); override;
    procedure FreeBuffer; override;
    function CreateSaveState: TCanvasSaveState; override;
    { begin and }
    function DoBeginScene(const AClipRects: PClipRects = nil): Boolean; override;
    procedure DoEndScene; override;
  public
    constructor CreateFromWindow(const AParent: THandle; const AWidth, AHeight: Integer); override;
    constructor CreateFromBitmap(const ABitmap: TBitmap); override;
    constructor CreateFromPrinter(const APrinter: TAbstractPrinter); override;
    destructor Destroy; override;
    { buffer }
    procedure ResizeBuffer(const AWidth, AHeight: Integer); override;
    procedure FlushBufferRect(const X, y: Integer; const Context; const ARect: TRectF); override;
    procedure Clear(const Color: TAlphaColor); override;
    procedure ClearRect(const ARect: TRectF; const AColor: TAlphaColor = 0); override;
    { matrix }
    procedure SetMatrix(const M: TMatrix); override;
    procedure MultyMatrix(const M: TMatrix); override;
    { cliping }
    procedure IntersectClipRect(const ARect: TRectF); override;
    procedure ExcludeClipRect(const ARect: TRectF); override;
    { drawing }
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); override;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); override;
    procedure FillText(const ARect: TRectF; const AText: WideString; const WordWrap: Boolean;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    procedure MeasureText(var ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    procedure MeasureLines(ALines: TLineMetricInfo; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    function TextToPath(Path: TPathData; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean; override;
    function PtInPath(const APoint: TPointF; const APath: TPathData): Boolean; override;
    procedure FillPath(const APath: TPathData; const AOpacity: Single); override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); override;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single;
      const HighSpeed: Boolean = False); override;
    procedure DrawThumbnail(const ABitmap: TBitmap; const Width, Height: Single); override;

    property RenderTarget: ID2D1RenderTarget read GetRenderTarget;
  end;

{ TBitmapCodecWIC }

class function TBitmapCodecWIC.GetFileTypes: WideString;
begin
  Result := '*.bmp;*.jpg;*.jpeg;*.png;*.tif;*.tiff;*.gif;*.ico;*.wmp'
end;

class function TBitmapCodecWIC.GetImageSize(const AFileName: WideString): TPointF;
var
  bmp: IWICBitmapSource;
  dec: IWICBitmapDecoder;
  frame: IWICBitmapFrameDecode;
  conv: IWICFormatConverter;
  W, H: UINT;
  fn: WideString;
begin
  W := 0;
  H := 0;
  fn := AFileName;
  ImagingFactory.CreateDecoderFromFilename(PWideChar(fn), GUID_NULL, $FFFFFFFF,
    WICDecodeMetadataCacheOnDemand, dec);
  if Assigned(dec) then
  begin
    dec.GetFrame(0, frame);
    if Assigned(frame) then
    begin
      frame.GetSize(W, H);
    end;
  end;
  Result := PointF(W, H);
end;

function TBitmapCodecWIC.LoadFromFile(const AFileName: WideString; const Rotate: Single; var Bitmap: TBitmap): Boolean;
var
  bmp: IWICBitmapSource;
  dec: IWICBitmapDecoder;
  frame: IWICBitmapFrameDecode;
  conv: IWICFormatConverter;
  W, H: UINT;
  FS: TStream;
  SA: TStreamAdapter;
begin
  Result := False;
  FS := TFileStream.Create(AFileName, fmOpenRead);
  SA := TStreamAdapter.Create(FS);
  try
    ImagingFactory.CreateDecoderFromStream(SA, GUID_NULL, WICDecodeMetadataCacheOnDemand, dec);
    if Assigned(dec) then
    begin
      dec.GetFrame(0, frame);
      if Assigned(frame) then
      begin
        ImagingFactory.CreateFormatConverter(conv);
        Res := conv.Initialize(frame, GUID_WICPixelFormat32bppPBGRA, WICBitmapDitherTypeNone, nil, 0, 0);
        if Res = 0 then
        begin
          conv.GetSize(W, H);

          Bitmap.SetSize(W, H);
          Res := conv.CopyPixels(nil, W * 4, W * H * 4, PByte(Bitmap.Startline));
          Result := True;
        end;
      end;
    end;
  finally
    FS.Free;
  end;
end;

function TBitmapCodecWIC.LoadFromStream(const AStream: TStream; var Bitmap: TBitmap): Boolean;
var
  bmp: IWICBitmapSource;
  dec: IWICBitmapDecoder;
  mem: TMemoryStream;
  stream: IWICStream;
  frame: IWICBitmapFrameDecode;
  conv: IWICFormatConverter;
  W, H: UINT;
begin
  Result := False;
  mem := TMemoryStream.Create;
  mem.CopyFrom(AStream, AStream.Size);
  ImagingFactory.CreateStream(stream);
  stream.InitializeFromMemory(mem.Memory, mem.Size);

  ImagingFactory.CreateDecoderFromStream(stream, GUID_NULL, WICDecodeMetadataCacheOnDemand, dec);
  if Assigned(dec) then
  begin
    dec.GetFrame(0, frame);
    if Assigned(frame) then
    begin
      ImagingFactory.CreateFormatConverter(conv);
      Res := conv.Initialize(frame, GUID_WICPixelFormat32bppPBGRA, WICBitmapDitherTypeNone, nil, 0, 0);
      if Res = 0 then
      begin
        conv.GetSize(W, H);

        Bitmap.SetSize(W, H);
        Res := conv.CopyPixels(nil, W * 4, W * H * 4, PByte(Bitmap.Startline));
        Result := True;
      end;
    end;
  end;
  mem.Free;
end;

function TBitmapCodecWIC.LoadThumbnailFromFile(const AFileName: WideString; const AFitWidth, AFitHeight: Single;
  const UseEmbedded: Boolean; var Bitmap: TBitmap): Boolean;
var
  bmp: IWICBitmapSource;
  dec: IWICBitmapDecoder;
  scale: Single;
  scaler: IWICBitmapScaler;
  frame: IWICBitmapFrameDecode;
  conv: IWICFormatConverter;
  W, H: UINT;
  R: TRectF;
  fn: WideString;
begin
  fn := AFileName;
  Result := False;
  ImagingFactory.CreateDecoderFromFilename(PWideChar(fn), GUID_NULL, $FFFFFFFF, WICDecodeMetadataCacheOnDemand, dec);
  if Assigned(dec) then
  begin
    dec.GetFrame(0, frame);
    if UseEmbedded then
      frame.GetThumbnail(bmp);
    if Assigned(bmp) then
    begin
      ImagingFactory.CreateFormatConverter(conv);
      Res := conv.Initialize(bmp, GUID_WICPixelFormat32bppPBGRA, WICBitmapDitherTypeNone, nil, 0, 0);
      if Res = 0 then
      begin
        conv.GetSize(W, H);

        Bitmap.SetSize(W, H);
        Bitmap.Clear($FFFF0000);
        Res := conv.CopyPixels(nil, W * 4, W * H * 4, PByte(Bitmap.Startline));
        Result := True;
      end;
    end
    else
    begin
      if Assigned(frame) then
      begin
        frame.GetSize(W, H);
        R := RectF(0, 0, W, H);
        scale := FitRect(R, RectF(0, 0, AFitWidth, AFitHeight));
        if scale = 0 then
          scale := 0.001;
        if scale < 1 then
          scale := 1;

        ImagingFactory.CreateBitmapScaler(scaler);
        Res := scaler.Initialize(frame, round(W / scale), round(H / scale), WICBitmapInterpolationModeLinear);

        ImagingFactory.CreateFormatConverter(conv);
        Res := conv.Initialize(scaler, GUID_WICPixelFormat32bppPBGRA, WICBitmapDitherTypeNone, nil, 0, 0);
        if Res = 0 then
        begin
          conv.GetSize(W, H);

          Bitmap.SetSize(W, H);
          Bitmap.Clear($FFFF0000);
          Res := conv.CopyPixels(nil, W * 4, W * H * 4, PByte(Bitmap.Startline));
          Result := True;
        end;
      end;
    end;
  end;
end;

function TBitmapCodecWIC.SaveToFile(const AFileName: WideString; var Bitmap: TBitmap; const Params: WideString): Boolean;
var
  bmp: IWICBitmap;
  enc: IWICBitmapEncoder;
  encoderType: TGUID;
  stream: IWICStream;
  frame: IWICBitmapFrameEncode;
  conv: IWICFormatConverter;
  props: IPropertyBag2;
  W, H: UINT;
  fn: WideString;
  pformat: WICPixelFormatGUID;
  buf: PByte;
  pname: TPropBag2;
  pvalue: Variant;
  S, param, name, value: ansistring;
  i: Integer;
begin
  fn := AFileName;
  Result := False;
  encoderType := GUID_ContainerFormatPng;
  if (LowerCase(ExtractFileExt(AFileName)) = '.jpg') or (LowerCase(ExtractFileExt(AFileName)) = '.jpeg') then
    encoderType := GUID_ContainerFormatJpeg;
  if (LowerCase(ExtractFileExt(AFileName)) = '.bmp') then
    encoderType := GUID_ContainerFormatBmp;
  if (LowerCase(ExtractFileExt(AFileName)) = '.png') then
    encoderType := GUID_ContainerFormatPng;
  if (LowerCase(ExtractFileExt(AFileName)) = '.tif') or (LowerCase(ExtractFileExt(AFileName)) = '.tiff') then
    encoderType := GUID_ContainerFormatTiff;
  if (LowerCase(ExtractFileExt(AFileName)) = '.gif') then
    encoderType := GUID_ContainerFormatGif;
  if (LowerCase(ExtractFileExt(AFileName)) = '.wmp') then
    encoderType := GUID_ContainerFormatWmp;
  ImagingFactory.CreateEncoder(encoderType, GUID_NULL, enc);
  if Assigned(enc) then
  begin
    ImagingFactory.CreateStream(stream);
    stream.InitializeFromFilename(PWideChar(fn), $FFFFFFFF);
    enc.Initialize(stream, WICBitmapEncoderNoCache);
    enc.CreateNewFrame(frame, props);
    if Assigned(frame) then
    begin
      { set params }
      { if Params <> '' then
        begin
        S := Params;
        i := 0;
        while S <> '' do
        begin
        param := GetToken(S, ' ');
        name := GetToken(param, '=');
        value := GetToken(param, '');
        if CompareText(name, 'quality') = 0 then
        begin
        Fillchar(pname, SizeOf(pname), 0);
        pname.dwType := 1;//PROPBAG2_TYPE_DATA;
        pname.vt := VT_VARIANT;
        pname.pstrName := PWideChar(string('ImageQuality'));
        pvalue := vgStrToFloat(value) / 100;
        Res := props.Write(1, @pname, @value);
        end;
        Inc(i);
        end;
        end; }
      Res := frame.Initialize(props);
      { }
      Res := frame.SetSize(Bitmap.Width, Bitmap.Height);
      pformat := GUID_WICPixelFormat32bppPBGRA;
      Res := frame.SetPixelFormat(pformat);
      if IsEqualGuid(pformat, GUID_WICPixelFormat32bppPBGRA) then
      begin
        Res := frame.WritePixels(Bitmap.Height, Bitmap.Width * 4, Bitmap.Width * Bitmap.Height * 4,
          PByte(Bitmap.Startline));
        Res := frame.Commit;
        Res := enc.Commit;
      end
      else
      begin
        ImagingFactory.CreateBitmapFromMemory(Bitmap.Width, Bitmap.Height, GUID_WICPixelFormat32bppPBGRA,
          Bitmap.Width * 4, Bitmap.Width * Bitmap.Height * 4, PByte(Bitmap.Startline), bmp);
        ImagingFactory.CreateFormatConverter(conv);
        Res := conv.Initialize(bmp, pformat, WICBitmapDitherTypeNone, nil, 0, 0);
        Res := frame.WriteSource(bmp, nil);
        Res := frame.Commit;
        Res := enc.Commit;
      end;
    end;
  end;
end;

function TBitmapCodecWIC.SaveToStream(const AStream: TStream; var Bitmap: TBitmap;
  const Format, Params: WideString): Boolean;
var
  bmp: IWICBitmap;
  enc: IWICBitmapEncoder;
  encoderType: TGUID;
  stream: IWICStream;
  frame: IWICBitmapFrameEncode;
  conv: IWICFormatConverter;
  props: IPropertyBag2;
  W, H: cardinal;
  fn: WideString;
  pformat: WICPixelFormatGUID;
  buf: PByte;
  str: Pointer;
  strSize: Integer;
  stg: TStatStg;
begin
  Result := False;
  encoderType := GUID_ContainerFormatPng;
  if SameText(Format, 'jpeg') then
    encoderType := GUID_ContainerFormatJpeg;
  if SameText(Format, 'jpg') then
    encoderType := GUID_ContainerFormatJpeg;
  if SameText(Format, 'png') then
    encoderType := GUID_ContainerFormatPng;
  if SameText(Format, 'bmp') then
    encoderType := GUID_ContainerFormatBmp;
  if SameText(Format, 'tif') then
    encoderType := GUID_ContainerFormatTiff;
  if SameText(Format, 'tiff') then
    encoderType := GUID_ContainerFormatTiff;
  if SameText(Format, 'gif') then
    encoderType := GUID_ContainerFormatGif;
  if SameText(Format, 'wmp') then
    encoderType := GUID_ContainerFormatWmp;
  ImagingFactory.CreateEncoder(encoderType, GUID_NULL, enc);
  if Assigned(enc) then
  begin
    ImagingFactory.CreateStream(stream);
    stream.InitializeFromIStream(TStreamAdapter.Create(AStream) as IStream);
    enc.Initialize(stream, WICBitmapEncoderNoCache);
    enc.CreateNewFrame(frame, props);
    if Assigned(frame) then
    begin
      frame.Initialize(props);
      Res := frame.SetSize(Bitmap.Width, Bitmap.Height);
      pformat := GUID_WICPixelFormat32bppPBGRA;
      Res := frame.SetPixelFormat(pformat);
      if IsEqualGuid(pformat, GUID_WICPixelFormat32bppPBGRA) then
      begin
        Res := frame.WritePixels(Bitmap.Height, Bitmap.Width * 4, Bitmap.Width * Bitmap.Height * 4,
          PByte(Bitmap.Startline));
        Res := frame.Commit;
        Res := enc.Commit;
      end
      else
      begin
        ImagingFactory.CreateBitmapFromMemory(Bitmap.Width, Bitmap.Height, GUID_WICPixelFormat32bppPBGRA,
          Bitmap.Width * 4, Bitmap.Width * Bitmap.Height * 4, PByte(Bitmap.Startline), bmp);
        ImagingFactory.CreateFormatConverter(conv);
        Res := conv.Initialize(bmp, pformat, WICBitmapDitherTypeNone, nil, 0, 0);
        Res := frame.WriteSource(bmp, nil);
        Res := frame.Commit;
        Res := enc.Commit;
      end;
    end;
  end;
end;

{ Canvas }

const
  D2DERR_RECREATE_TARGET = HResult($8899000C);

var
  IdentM: D2D_MATRIX_3X2_F;

procedure SetD2DDefault;
var
  dx10lib: THandle;
  g_pd3dDevice: ID3D10Device;
  SavedExceptionMask: TArithmeticExceptionMask;
begin
  if GlobalUseDirect2DSoftware then
  begin
    TargetMode := D2D1_RENDER_TARGET_TYPE_SOFTWARE;
    DefaultCanvasClass := TCanvasD2D;
    DefaultBitmapCodecClass := TBitmapCodecWIC;
  end
  else
  begin
    { check for support for DX10 hardware }
    SavedExceptionMask := GetExceptionMask;
    SetExceptionMask(exAllArithmeticExceptions);
    try
      dx10lib := LoadLibrary(D3D10dll);
      if dx10lib <> 0 then
      try
        if GetProcAddress(dx10lib, 'D3D10CreateDevice') <> nil then
        begin
          if Succeeded(D3D10CreateDevice(nil, D3D10_DRIVER_TYPE_HARDWARE, 0, 0, D3D10_SDK_VERSION, g_pd3dDevice)) then
          begin
            g_pd3dDevice := nil;
            Res := D2D1CreateFactory(D2D1_FACTORY_TYPE_MULTI_THREADED, ID2D1Factory, nil, Factory);
            if (Factory <> nil) and (Res = S_OK) then
            begin
              Factory := nil;
              DefaultCanvasClass := TCanvasD2D;
              DefaultBitmapCodecClass := TBitmapCodecWIC;
            end;
          end;
      end;
      finally
        FreeLibrary(dx10Lib);
      end;
    finally
      SetExceptionMask(SavedExceptionMask); // restore SSE's exception mask.
    end;
  end;
end;

function D2Rect(const R: TRectF): TD2D1RectF; inline;
begin
  Result := TD2D1RectF(R);
end;

function D2Color(const AColor: TAlphaColor; const Opacity: Single): TD2D1ColorF; inline;
begin
  with TAlphaColorRec(AColor) do
    Result := D2D1ColorF(R / $FF, G / $FF, B / $FF, (A / $FF) * Opacity);
end;

function D2Point(X, y: Single): TD2D1Point2F; inline;
begin
  Result.X := X;
  Result.y := y;
end;

function D2Size(W, H: cardinal): TD2DSizeU; inline;
begin
  Result.Width := W;
  Result.Height := H;
end;

function D2Matrix(M: TMatrix): TD2D1Matrix3X2F;
begin
  Result._11 := M.m11;
  Result._12 := M.m12;
  Result._21 := M.m21;
  Result._22 := M.m22;
  Result._31 := M.m31;
  Result._32 := M.m32;
end;

function MatrixToD2(M: TD2D1Matrix3X2F): TMatrix;
begin
  Result.m11 := M._11;
  Result.m12 := M._12;
  Result.m21 := M._21;
  Result.m22 := M._22;
  Result.m31 := M._31;
  Result.m32 := M._32;
end;

function D2Bezier(x1, y1, x2, y2, x3, y3: Single): TD2D1BezierSegment;
begin
  Result.Point1.X := x1;
  Result.Point1.y := y1;
  Result.Point2.X := x2;
  Result.Point2.y := y2;
  Result.Point3.X := x3;
  Result.Point3.y := y3;
end;

function D2Ellipse(R: TRectF): TD2D1Ellipse;
begin
  Result.Point.X := (R.Right + R.Left) / 2;
  Result.Point.y := (R.Bottom + R.Top) / 2;
  Result.RadiusX := (R.Right - R.Left) / 2;
  Result.RadiusY := (R.Bottom - R.Top) / 2;
end;

function D2FontStyle(Style: TFontStyles): TDWriteFontStyle; inline;
begin
  Result := 0;
  if TFontStyle.fsItalic in Style then
    Result := Result + DWRITE_FONT_STYLE_OBLIQUE;
end;

function D2FontWeight(Style: TFontStyles): TDWriteFontWeight; inline;
begin
  Result := DWRITE_FONT_WEIGHT_REGULAR;
  if TFontStyle.fsBold in Style then
    Result := DWRITE_FONT_WEIGHT_BOLD;
end;

function BitmapProp(DXGI: DXGI_Format; AlphaMode: TD2D1AlphaMode): TD2D1BitmapProperties;
begin
  Result.PixelFormat.Format := DXGI;
  Result.PixelFormat.AlphaMode := AlphaMode;
  Result.DpiX := 0;
  Result.DpiY := 0;
end;

{ TCanvasD2D }

var
  D2DLoadcount: Integer = 0;

procedure AddD2DRef;
begin
  if Factory = nil then
  begin
    D2D1CreateFactory(D2D1_FACTORY_TYPE_MULTI_THREADED, ID2D1Factory, nil, Factory);
    DWriteCreateFactory(DWRITE_FACTORY_TYPE_SHARED, IDWriteFactory, IUnknown(DWriteFactory));
  end;
  D2DLoadcount := D2DLoadcount + 1;
end;

procedure DecD2DRef;
begin
  D2DLoadcount := D2DLoadcount - 1;
  if D2DLoadcount = 0 then
  begin
    DWriteFactory := nil;
    Factory := nil;
  end;
end;

constructor TCanvasD2D.CreateFromWindow(const AParent: THandle; const AWidth, AHeight: Integer);
var
  Form: TCommonCustomForm;
begin
  AddD2DRef;
  Form := FindWindow(FmxHandleToHWND(AParent));
  if (Form <> nil) and (Form.Transparency) then
    FBuffered := True;
  inherited;
end;

constructor TCanvasD2D.CreateFromBitmap(const ABitmap: TBitmap);
begin
  AddD2DRef;
  inherited;
  FBitmap := ABitmap;
  FBitmap.HandleAdd(Self);
  if ImagingFactory <> nil then
  begin
    ImagingFactory.CreateBitmapFromMemory(FBitmap.Width, FBitmap.Height, GUID_WICPixelFormat32bppPBGRA,
      FBitmap.Width * 4, FBitmap.Width * FBitmap.Height * 4, PByte(FBitmap.Startline), FWICBitmap);
    CreateResources;
  end;
end;

constructor TCanvasD2D.CreateFromPrinter(const APrinter: TAbstractPrinter);
begin
  // Just a stub implementation - not used.
end;

destructor TCanvasD2D.Destroy;
begin
  if FBitmap <> nil then
    FBitmap.HandleRemove(Self);
  inherited Destroy;
  DecD2DRef;
end;

procedure TCanvasD2D.FreeBuffer;
begin
  DisposeResources;
  if FBuffered then
  begin
    if FBufferBitmap = 0 then
      Exit;
    if FBufferHandle <> 0 then
      DeleteDC(FBufferHandle);
    if FBufferBitmap <> 0 then
      DeleteObject(FBufferBitmap);
    FBufferBitmap := 0;
  end;
end;

procedure TCanvasD2D.CreateResources;
var
  SizeInPixels: D2D1_SIZE_U;
  P: TD2D1RenderTargetProperties;
begin
  if FTarget = nil then
  begin
    SizeInPixels.Width := FWidth;
    SizeInPixels.Height := FHeight;
    if (FBitmap <> nil) then
    begin
      if FWICBitmap <> nil then
      begin
        P := D2D1RenderTargetProperties(TargetMode, D2D1PixelFormat(DXGI_FORMAT_B8G8R8A8_UNORM,
          D2D1_ALPHA_MODE_PREMULTIPLIED));
        Factory.CreateWicBitmapRenderTarget(FWICBitmap, P, FTarget);
      end;
    end
    else
    begin
      if FBuffered then
      begin
        if FBufferHandle = 0 then
        begin
          if ImagingFactory <> nil then
          begin
            ImagingFactory.CreateBitmapFromMemory(FBitmap.Width, FBitmap.Height, GUID_WICPixelFormat32bppPBGRA,
              FBitmap.Width * 4, FBitmap.Width * FBitmap.Height * 4, PByte(FBitmap.Startline), FWICBitmap);
            P := D2D1RenderTargetProperties(TargetMode, D2D1PixelFormat(DXGI_FORMAT_B8G8R8A8_UNORM,
              D2D1_ALPHA_MODE_PREMULTIPLIED));
            Factory.CreateWicBitmapRenderTarget(FWICBitmap, P, FTarget);
          end;
        end
        else
        begin
          Factory.CreateDCRenderTarget(D2D1RenderTargetProperties(TargetMode,
            D2D1PixelFormat(DXGI_FORMAT_B8G8R8A8_UNORM, D2D1_ALPHA_MODE_PREMULTIPLIED)),
            ID2D1DCRenderTarget(FTarget));
          ID2D1DCRenderTarget(FTarget).BindDC(FBufferHandle, Rect(0, 0, FWidth, FHeight));
        end;
      end
      else
      begin
        Factory.CreateHWndRenderTarget(D2D1RenderTargetProperties(TargetMode,
          D2D1PixelFormat(DXGI_FORMAT_B8G8R8A8_UNORM, D2D1_ALPHA_MODE_PREMULTIPLIED)),
          D2D1HwndRenderTargetProperties(FmxHandleToHWND(FParent), SizeInPixels), ID2D1HwndRenderTarget(FTarget));
      end;
    end;
    if FTarget <> nil then
    begin
      FTarget.SetDpi(96, 96);
      FTarget.SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE_DEFAULT);
    end;
  end
end;

function TCanvasD2D.CreateSaveState: TCanvasSaveState;
begin
  Result := TD2DCanvasSaveState.Create;
end;

procedure TCanvasD2D.DisposeResources;
begin
  FStrokeBrush := nil;
  FBrush := nil;
  FLayer := nil;
  FTarget := nil;
  FWICBitmap := nil;
end;

procedure TCanvasD2D.Clear(const Color: TAlphaColor);
begin
  FTarget.Clear(D2Color(Color, 1));
end;

procedure TCanvasD2D.ClearRect(const ARect: TRectF; const AColor: TAlphaColor);
begin
  FTarget.Clear(D2Color(AColor, 1));
end;

procedure TCanvasD2D.ResizeBuffer(const AWidth, AHeight: Integer);
var
  Size: D2D1_SIZE_U;
begin
  if (AWidth = FWidth) and (AHeight = FHeight) then
    Exit;
  if (FParent <> 0) and not FBuffered and (FTarget <> nil) then
  begin
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth <= 0 then
      FWidth := 1;
    if FHeight <= 0 then
      FHeight := 1;
    Size.Width := AWidth;
    Size.Height := AHeight;
    ID2D1HwndRenderTarget(FTarget).Resize(Size);
    FResized := True;
    Exit;
  end;
  FreeBuffer;
  FWidth := AWidth;
  FHeight := AHeight;
  if FWidth <= 0 then
    FWidth := 1;
  if FHeight <= 0 then
    FHeight := 1;
  FResized := True;
  if FBuffered then
  begin
    with FBitmapInfo.bmiHeader do
    begin
      biSize := SizeOf(TBitmapInfoHeader);
      biPlanes := 1;
      biBitCount := 32;
      biCompression := BI_RGB;
      biWidth := AWidth;
      if biWidth <= 0 then
        biWidth := 1;
      biHeight := -AHeight;
      if biHeight >= 0 then
        biHeight := -1;
    end;
    { Create new DIB }
    try
      FBufferBitmap := CreateDIBSection(0, FBitmapInfo, DIB_RGB_COLORS, Pointer(FBufferBits), 0, 0);
      if FBufferBits = nil then
        RaiseLastOSError;
      try
        FBufferHandle := CreateCompatibleDC(0);
        if FBufferHandle = 0 then
          RaiseLastOSError;
        try
          if SelectObject(FBufferHandle, FBufferBitmap) = 0 then
            RaiseLastOSError;
        except
          DeleteDC(FBufferHandle);
          FBufferHandle := 0;
          raise;
        end;
      except
        DeleteObject(FBufferBitmap);
        FBufferBits := nil;
        raise;
      end;
    except
      FBufferBitmap := 0;
      raise;
    end;
  end;
end;

procedure TCanvasD2D.FlushBufferRect(const X, y: Integer; const Context; const ARect: TRectF);
var
  R: TRect;
begin
  if (FBufferBitmap = 0) and (HDC(Context) <> 0) then
  begin
    R := Rect(Trunc(ARect.Left), Trunc(ARect.Top), Ceil(ARect.Right), Ceil(ARect.Bottom));
    BitBlt(HDC(Context), X + R.Left, y + R.Top, R.Right - R.Left, R.Bottom - R.Top,
      FBufferHandle, R.Left, R.Top, SRCCOPY);
  end;
end;

function TCanvasD2D.DoBeginScene(const AClipRects: PClipRects = nil): Boolean;
var
  S: Longword;
  P: WICInProcPointer;
  R: WICRect;
  L: IWICBitmapLock;
begin
  if (FTarget <> nil) and (FWICBitmap <> nil) and (FBitmap.HandlesNeedUpdate[Self]) then
  begin
    FTarget := nil;
    R := WICRect(Rect(0, 0, FBitmap.Width, FBitmap.Height));
    Res := FWICBitmap.Lock(R, WICBitmapLockWrite, L);
    if L <> nil then
    begin
      L.GetDataPointer(S, P);
      Move(FBitmap.StartLine^, P^, S);
      L := nil;
    end;
    FBitmap.HandlesNeedUpdate[Self] := True;
  end;
  CreateResources;
  Result := inherited DoBeginScene(AClipRects) and (FTarget <> nil);
  if Result then
  begin
    FCurrentSaveState := nil;
    if (FParent <> 0) and not(FBuffered) then
      Result := (LongWord(ID2D1HwndRenderTarget(FTarget).CheckWindowState) and
        LongWord(D2D1_WINDOW_STATE_OCCLUDED) = 0);
    if Result then
    begin
      FTarget.BeginDraw;
      if AClipRects <> nil then
        SetClipRects(AClipRects^);
    end;
  end;
end;

procedure TCanvasD2D.DoEndScene;
var
  Res: HResult;
  t1, t2: TD2D1Tag;
begin
  if FTarget <> nil then
  begin
    if FLayer <> nil then
    begin
      FTarget.PopLayer;
      FLayer := nil;
    end;
    Res := FTarget.Flush(@t1, @t2);
    if (Res <> 0) or (t1 <> 0) or (t2 <> 0) then ;
    Res := FTarget.EndDraw;
    if Res = D2DERR_RECREATE_TARGET then
    begin
      DisposeResources;
    end;
    if FWICBitmap <> nil then
    begin
      Res := FWICBitmap.CopyPixels(nil, Width * 4, Width * Height * 4, PByte(FBitmap.Startline));
    end;
  end;
  inherited;
end;

class function TCanvasD2D.GetBitmapScanline(Bitmap: TBitmap; y: Integer): PAlphaColorArray;
begin
  if (y >= 0) and (y < Bitmap.Height) and (Bitmap.Startline <> nil) then
    Result := @PAlphaColorArray(Bitmap.Startline)[(y) * Bitmap.Width]
  else
    Result := nil;
end;

function TCanvasD2D.GetRenderTarget: ID2D1RenderTarget;
begin
  Result := FTarget;
end;

procedure TCanvasD2D.SetMatrix(const M: TMatrix);
begin
  FMatrix := M;
  if FTarget <> nil then
    FTarget.SetTransform(D2Matrix(FMatrix));
end;

procedure TCanvasD2D.MultyMatrix(const M: TMatrix);
var
  T: TMatrix;
  D2T: TD2D1Matrix3X2F;
begin
  inherited;
  FTarget.GetTransform(D2T);
  T := MatrixToD2(D2T);
  T := MatrixMultiply(M, T);
  FTarget.SetTransform(D2Matrix(T));
end;

procedure TCanvasD2D.SetClipRects(const ARects: array of TRectF);
var
  i: Integer;
  Geoms: array of ID2D1Geometry;
  FClipGeom: ID2D1GeometryGroup;
  LayerPar: TD2D1LayerParameters;
  R: TRectF;
begin
  if Length(ARects) > 0 then
  begin
    FTarget.SetTransform(D2Matrix(IdentityMatrix));
    // First clear
    for i := 0 to High(ARects) do
    begin
      R := ARects[i];
      FTarget.PushAxisAlignedClip(D2Rect(R), D2D1_ANTIALIAS_MODE_ALIASED);
      FTarget.Clear(D2Color(0, 0));
      FTarget.PopAxisAlignedClip;
    end;
    FClipGeom := nil;
    // Second create clipregion
    SetLength(Geoms, Length(ARects));
    for i := 0 to High(ARects) do
    begin
      Factory.CreateRectangleGeometry(D2Rect(ARects[i]), ID2D1RectangleGeometry(Geoms[i]));
    end;
    Factory.CreateGeometryGroup(D2D1_FILL_MODE_WINDING, @Geoms[0], Length(Geoms), FClipGeom);
    for i := 0 to High(ARects) do
    begin
      Geoms[i] := nil;
    end;
    // Apply clips
    FTarget.CreateLayer(nil, FLayer);
    LayerPar.ContentBounds := D2Rect(RectF(0, 0, FWidth, FHeight));
    LayerPar.GeometricMask := FClipGeom;
    LayerPar.MaskAntialiasMode := D2D1_ANTIALIAS_MODE_ALIASED;
    LayerPar.MaskTransform := D2Matrix(IdentityMatrix);
    LayerPar.Opacity := 1;
    LayerPar.OpacityBrush := nil;
    LayerPar.LayerOptions := D2D1_LAYER_OPTIONS_NONE;
    FTarget.PushLayer(LayerPar, FLayer);
    FClipGeom := nil;
  end;
end;

procedure TCanvasD2D.IntersectClipRect(const ARect: TRectF);
var
  Geom: ID2D1RectangleGeometry;
  LayerPar: TD2D1LayerParameters;
begin
  if FCurrentSaveState <> nil then
  begin
    OleCheck(Factory.CreateRectangleGeometry(D2Rect(ARect), Geom));
    if Assigned(Geom) then
    begin
      FCurrentSaveState.CreateLayer(RenderTarget);
      LayerPar.ContentBounds := D2Rect(RectF(0, 0, 400000, 400000));
      LayerPar.GeometricMask := Geom;
      LayerPar.MaskAntialiasMode := D2D1_ANTIALIAS_MODE_ALIASED;
      LayerPar.MaskTransform := D2Matrix(IdentityMatrix);
      LayerPar.Opacity := 1;
      LayerPar.OpacityBrush := nil;
      LayerPar.LayerOptions := D2D1_LAYER_OPTIONS_NONE;
      FTarget.PushLayer(LayerPar, FCurrentSaveState.Layer);
      Geom := nil;
    end;
  end;
end;

procedure TCanvasD2D.ExcludeClipRect(const ARect: TRectF);
var
  i: Integer;
  Geoms: array [0 .. 3] of ID2D1RectangleGeometry;
  R: TRectF;
  RR: array [0 .. 3] of TRectF;
  GeomGroup: ID2D1GeometryGroup;
  LayerPar: TD2D1LayerParameters;
begin
  if FCurrentSaveState <> nil then
  begin
    R := ARect;
    RR[0] := RectF(-FWidth, -FWidth, R.Left, FHeight);
    RR[1] := RectF(R.Right, -FHeight, FWidth, FHeight);
    RR[2] := RectF(R.Left, -FHeight, R.Right, R.Top);
    RR[3] := RectF(R.Left, R.Bottom, R.Right, FHeight);
    for i := 0 to High(RR) do
      OleCheck(Factory.CreateRectangleGeometry(D2Rect(RR[i]), Geoms[i]));
    OleCheck(Factory.CreateGeometryGroup(D2D1_FILL_MODE_WINDING, @Geoms[0], Length(Geoms), GeomGroup));
    if Assigned(GeomGroup) then
    begin
      FCurrentSaveState.CreateLayer(RenderTarget);
      LayerPar.ContentBounds := D2Rect(RectF(-FWidth, -FHeight, 400000, 400000));
      LayerPar.GeometricMask := GeomGroup;
      LayerPar.MaskAntialiasMode := D2D1_ANTIALIAS_MODE_ALIASED;
      LayerPar.MaskTransform := D2Matrix(IdentityMatrix);
      LayerPar.Opacity := 1;
      LayerPar.OpacityBrush := nil;
      LayerPar.LayerOptions := D2D1_LAYER_OPTIONS_NONE;
      FTarget.PushLayer(LayerPar, FCurrentSaveState.Layer);
    end;
  end;
end;

procedure TCanvasD2D.ApplyFill(ARect: TRectF; const AOpacity: Single);
var
  C: TAlphaColor;
  i: Integer;
  count: Integer;
  B: TBitmap;
  M: TMatrix;
  grad: array [0 .. 100] of TD2D1GradientStop;
  gradcol: ID2D1GradientStopCollection;
  gradbrushprop: TD2D1LinearGradientBrushProperties;
  rgradbrushprop: TD2D1RadialGradientBrushProperties;
  bitmapbrushprop: TD2D1BitmapBrushProperties;
  brushprop: TD2D1BrushProperties;
  d2dbmp: ID2D1Bitmap;
begin
  FBrush := nil;
  if (FFill.Kind = TBrushKind.bkResource) and (FFill.Resource <> nil) and (FFill.Resource.Brush <> nil) then
    FFill.Assign(FFill.Resource.Brush);

  with FFill do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          FTarget.CreateSolidColorBrush(D2Color(FFill.Color, AOpacity), nil, ID2D1SolidColorBrush(FBrush));
        end;
      TBrushKind.bkGradient:
        begin
          if Gradient.Points.count > 1 then
          begin
            count := 0;
            if Gradient.Points[0].Offset > 0 then
            begin
              grad[count].Color := D2Color(MakeColor(Gradient.Points[0].IntColor, AOpacity), 1);
              grad[count].Position := 0;
              count := count + 1;
            end;
            for i := 0 to Gradient.Points.count - 1 do
            begin
              grad[i + count].Color := D2Color(MakeColor(Gradient.Points[i].IntColor, AOpacity), 1);
              grad[i + count].Position := Gradient.Points[i].Offset;
            end;
            if Gradient.Points[Gradient.Points.count - 1].Offset < 1 then
            begin
              count := count + 1;
              grad[Gradient.Points.count + count - 1].Color :=
                D2Color(MakeColor(Gradient.Points[Gradient.Points.count - 1].IntColor, AOpacity), 1);
              grad[Gradient.Points.count + count - 1].Position := 1;
            end;

            if Gradient.Style = TGradientStyle.gsLinear then
            begin
              { Linear }
              FTarget.CreateGradientStopCollection(@grad[0], Gradient.Points.count + count, D2D1_GAMMA_2_2,
                D2D1_EXTEND_MODE_CLAMP, gradcol);
              gradbrushprop.StartPoint := D2Point(ARect.Left + Gradient.StartPosition.X * ARect.Width,
                ARect.Top + Gradient.StartPosition.y * ARect.Height);
              gradbrushprop.EndPoint := D2Point(ARect.Left + Gradient.StopPosition.X * ARect.Width,
                ARect.Top + Gradient.StopPosition.y * ARect.Height);
              FTarget.CreateLinearGradientBrush(gradbrushprop, nil, gradcol, ID2D1LinearGradientBrush(FBrush));
              gradcol := nil;
            end
            else
            begin
              { Radial }
              for i := 0 to Gradient.Points.count + count - 1 do
                grad[i].Position := 1 - grad[i].Position;
              FTarget.CreateGradientStopCollection(@grad[0], Gradient.Points.count + count, D2D1_GAMMA_2_2,
                D2D1_EXTEND_MODE_CLAMP, gradcol);
              rgradbrushprop.GradientOriginOffset := TD2D1Point2F(Point(0, 0));
              rgradbrushprop.Center := TD2D1Point2F(
                PointF(Gradient.RadialTransform.RotationCenter.X * RectWidth(ARect),
                Gradient.RadialTransform.RotationCenter.y * RectHeight(ARect)));
              rgradbrushprop.RadiusX := RectWidth(ARect) / 2;
              rgradbrushprop.RadiusY := RectHeight(ARect) / 2;
              FTarget.CreateRadialGradientBrush(rgradbrushprop, nil, gradcol, ID2D1RadialGradientBrush(FBrush));
              gradcol := nil;
            end;
          end
          else
            FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FBrush));
        end;
      TBrushKind.bkResource:
        begin
        end;
      TBrushKind.bkGrab:
        begin
        end;
      TBrushKind.bkBitmap:
        begin
          B := Bitmap.Bitmap;
          if (B <> nil) and (B.ResourceBitmap <> nil) then
            B := B.ResourceBitmap;
          if (B <> nil) and (B.Width > 0) and (B.Height > 0) then
          begin
            UpdateBitmapHandle(B);
            bitmapbrushprop.InterpolationMode := D2D1_BITMAP_INTERPOLATION_MODE_LINEAR;
            brushprop.Opacity := AOpacity;
            M := IdentityMatrix;
            case Bitmap.WrapMode of
              TWrapMode.wmTile:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_WRAP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_WRAP;
                end;
              TWrapMode.wmTileOriginal:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_CLAMP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_CLAMP;
                end;
              TWrapMode.wmTileStretch:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_WRAP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_WRAP;
                  M.m11 := (RectWidth(ARect) + (StrokeThickness / 2)) / B.Width;
                  M.m22 := (RectHeight(ARect) + (StrokeThickness / 2)) / B.Height;
                end;
            end;
            brushprop.Transform := D2Matrix(M);
            d2dbmp := ID2D1Bitmap(B.Handles[Self]);
            FTarget.CreateBitmapBrush(d2dbmp, @bitmapbrushprop, @brushprop, ID2D1BitmapBrush(FBrush));
          end
          else
            FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FBrush));
        end;
    else
      FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FBrush));
    end;
  end;
end;

procedure TCanvasD2D.ApplyStroke(ARect: TRectF; const AOpacity: Single);
var
  i: Integer;
  StyleProp: TD2D1StrokeStyleProperties;
  count: Integer;
  B: TBitmap;
  M: TMatrix;
  grad: array [0 .. 100] of TD2D1GradientStop;
  gradcol: ID2D1GradientStopCollection;
  gradbrushprop: TD2D1LinearGradientBrushProperties;
  rgradbrushprop: TD2D1RadialGradientBrushProperties;
  bitmapbrushprop: TD2D1BitmapBrushProperties;
  brushprop: TD2D1BrushProperties;
  d2dbmp: ID2D1Bitmap;

begin
  FStrokeBrush := nil;
  FStrokeStyle := nil;
  if (FStroke.Kind = TBrushKind.bkResource) and (FStroke.Resource <> nil) and
     (FStroke.Resource.Brush <> nil) then
    FStroke.Assign(FStroke.Resource.Brush);

  with FStroke do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          FTarget.CreateSolidColorBrush(D2Color(FStroke.Color, AOpacity), nil,
            ID2D1SolidColorBrush(FStrokeBrush));
        end;
      TBrushKind.bkBitmap:
        begin
          B := Bitmap.Bitmap;
          if (B <> nil) and (B.ResourceBitmap <> nil) then
            B := B.ResourceBitmap;
          if (B <> nil) and (B.Width > 0) and (B.Height > 0) then
          begin
            UpdateBitmapHandle(B);
            bitmapbrushprop.InterpolationMode := D2D1_BITMAP_INTERPOLATION_MODE_LINEAR;
            brushprop.Opacity := AOpacity;
            M := IdentityMatrix;
            case Bitmap.WrapMode of
              TWrapMode.wmTile:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_WRAP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_WRAP;
                end;
              TWrapMode.wmTileOriginal:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_CLAMP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_CLAMP;
                end;
              TWrapMode.wmTileStretch:
                begin
                  bitmapbrushprop.ExtendModeX := D2D1_EXTEND_MODE_WRAP;
                  bitmapbrushprop.ExtendModeY := D2D1_EXTEND_MODE_WRAP;
                  M.m11 := (RectWidth(ARect) + (StrokeThickness / 2)) / B.Width;
                  M.m22 := (RectHeight(ARect) + (StrokeThickness / 2)) / B.Height;
                end;
            end;
            brushprop.Transform := D2Matrix(M);
            d2dbmp := ID2D1Bitmap(B.Handles[Self]);
            FTarget.CreateBitmapBrush(d2dbmp, @bitmapbrushprop, @brushprop, ID2D1BitmapBrush(FStrokeBrush));
          end
          else
            FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FBrush));
        end;
      TBrushKind.bkGradient:
        begin
          if Gradient.Points.count > 1 then
          begin
            count := 0;
            if Gradient.Points[0].Offset > 0 then
            begin
              grad[count].Color := D2Color(MakeColor(Gradient.Points[0].IntColor, AOpacity), 1);
              grad[count].Position := 0;
              count := count + 1;
            end;
            for i := 0 to Gradient.Points.count - 1 do
            begin
              grad[i + count].Color := D2Color(MakeColor(Gradient.Points[i].IntColor, AOpacity), 1);
              grad[i + count].Position := Gradient.Points[i].Offset;
            end;
            if Gradient.Points[Gradient.Points.count - 1].Offset < 1 then
            begin
              count := count + 1;
              grad[Gradient.Points.count + count - 1].Color :=
                D2Color(MakeColor(Gradient.Points[Gradient.Points.count - 1].IntColor, AOpacity), 1);
              grad[Gradient.Points.count + count - 1].Position := 1;
            end;

            if Gradient.Style = TGradientStyle.gsLinear then
            begin
              { Linear }
              FTarget.CreateGradientStopCollection(@grad[0], Gradient.Points.count + count, D2D1_GAMMA_2_2,
                D2D1_EXTEND_MODE_CLAMP, gradcol);
              gradbrushprop.StartPoint := D2Point(ARect.Left + Gradient.StartPosition.X * ARect.Width,
                ARect.Top + Gradient.StartPosition.y * ARect.Height);
              gradbrushprop.EndPoint := D2Point(ARect.Left + Gradient.StopPosition.X * ARect.Width,
                ARect.Top + Gradient.StopPosition.y * ARect.Height);
              FTarget.CreateLinearGradientBrush(gradbrushprop, nil, gradcol, ID2D1LinearGradientBrush(FStrokeBrush));
              gradcol := nil;
            end
            else
            begin
              { Radial }
              for i := 0 to Gradient.Points.count + count - 1 do
                grad[i].Position := 1 - grad[i].Position;
              FTarget.CreateGradientStopCollection(@grad[0], Gradient.Points.count + count, D2D1_GAMMA_2_2,
                D2D1_EXTEND_MODE_CLAMP, gradcol);
              rgradbrushprop.GradientOriginOffset := TD2D1Point2F(Point(0, 0));
              rgradbrushprop.Center := TD2D1Point2F(
                PointF(Gradient.RadialTransform.RotationCenter.X * RectWidth(ARect),
                Gradient.RadialTransform.RotationCenter.y * RectHeight(ARect)));
              rgradbrushprop.RadiusX := RectWidth(ARect) / 2;
              rgradbrushprop.RadiusY := RectHeight(ARect) / 2;
              FTarget.CreateRadialGradientBrush(rgradbrushprop, nil, gradcol, ID2D1RadialGradientBrush(FStrokeBrush));
              gradcol := nil;
            end;
          end
          else
            FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FStrokeBrush));
        end;
    else
      FTarget.CreateSolidColorBrush(D2Color(0, 0), nil, ID2D1SolidColorBrush(FStrokeBrush));
    end;
  end;

  case StrokeCap of
    TStrokeCap.scFlat:
      StyleProp.DashCap := D2D1_CAP_STYLE_SQUARE;
    TStrokeCap.scRound:
      StyleProp.DashCap := D2D1_CAP_STYLE_ROUND;
  end;
  StyleProp.StartCap := StyleProp.DashCap;
  StyleProp.EndCap := StyleProp.DashCap;
  case StrokeJoin of
    TStrokeJoin.sjMiter:
      StyleProp.LineJoin := D2D1_LINE_JOIN_MITER;
    TStrokeJoin.sjRound:
      StyleProp.LineJoin := D2D1_LINE_JOIN_ROUND;
    TStrokeJoin.sjBevel:
      StyleProp.LineJoin := D2D1_LINE_JOIN_BEVEL;
  end;
  StyleProp.MiterLimit := 10;
  StyleProp.DashOffset := FDashOffset;
  StyleProp.DashStyle := TD2D1DashStyle(StrokeDash);

  if StrokeDash = TStrokeDash.sdCustom then
    Factory.CreateStrokeStyle(StyleProp, @FDash[0], Length(FDash), FStrokeStyle)
  else
    Factory.CreateStrokeStyle(StyleProp, nil, 0, FStrokeStyle)
end;

procedure TCanvasD2D.FontChanged(Sender: TObject);
begin
end;

procedure TCanvasD2D.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single);
begin
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(RectF(APt1.X, APt1.y, APt2.X, APt2.y), AOpacity);
    FTarget.DrawLine(D2Point(APt1.X, APt1.y), D2Point(APt2.X, APt2.y), FStrokeBrush,
      StrokeThickness, FStrokeStyle);
  end;
end;

procedure TCanvasD2D.IntFillRect(R: TRectF; Opacity: Single);
var
  State: TCanvasSaveState;
  Visual: TControl;
  M: TMatrix;
  SaveOpacity: Single;
  SaveStroke: TBrush;
  SaveStrokeThickness: Single;
begin
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    if FFill.Kind = TBrushKind.bkGrab then
    begin
      State := SaveState;
      try
        if FFill.Grab.Control <> nil then
        begin
          Visual := FFill.Grab.Control;
          SaveOpacity := Visual.Opacity;
          SaveStroke := TBrush.Create(TBrushKind.bkSolid, $FF000000);
          SaveStroke.Assign(Stroke);
          SaveStrokeThickness := StrokeThickness;
          Visual.Opacity := Opacity;

          Visual.PaintTo(Self, R);

          Visual.Opacity := SaveOpacity;
          Stroke.Assign(SaveStroke);
          SaveStroke.Free;
          StrokeThickness := SaveStrokeThickness;
        end;
      finally
        RestoreState(State);
      end;
    end
    else
    begin
      ApplyFill(R, Opacity);
      FTarget.FillRectangle(D2Rect(R), FBrush);
    end;
  end;
end;

procedure TCanvasD2D.IntFillPath(P: ID2D1Geometry; R: TRectF; Opacity: Single);
begin
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    if FFill.Kind = TBrushKind.bkGrab then
    begin
    end
    else
    begin
      ApplyFill(R, Opacity);
      FTarget.FillGeometry(P, FBrush, nil);
    end;
  end;
end;

procedure TCanvasD2D.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single;
  const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound);
var
  Geometry: ID2D1PathGeometry;
  Path: ID2D1GeometrySink;
  x1, x2, y1, y2: Single;
  R: TRectF;
begin
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    R := ARect;
    ApplyStroke(R, AOpacity);
    if (XRadius < Epsilon) and (YRadius < Epsilon) then
    begin
      FTarget.DrawRectangle(D2Rect(ARect), FStrokeBrush, StrokeThickness, FStrokeStyle);
    end
    else
    begin
      x1 := XRadius;
      if RectWidth(R) - (x1 * 2) < 0 then
        x1 := (XRadius * (RectWidth(R) / (x1 * 2)));
      x2 := x1 * CurveKappaInv;
      y1 := YRadius;
      if RectHeight(R) - (y1 * 2) < 0 then
        y1 := (YRadius * (RectHeight(R) / (y1 * 2)));
      y2 := y1 * CurveKappaInv;
      Factory.CreatePathGeometry(Geometry);
      Geometry.Open(Path);
      Path.BeginFigure(D2Point(R.Left, R.Top + y1), D2D1_FIGURE_BEGIN_FILLED);
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Left + x1, R.Top));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2, R.Left + x1, R.Top));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Left + x2, R.Top + y1));
              Path.AddLine(D2Point(R.Left + x1, R.Top + y2));
              Path.AddLine(D2Point(R.Left + x1, R.Top));
            end;
        else
          Path.AddBezier(D2Bezier(R.Left, R.Top + (y2), R.Left + x2, R.Top, R.Left + x1, R.Top))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Left, R.Top));
        Path.AddLine(D2Point(R.Left + x1, R.Top));
      end;
      Path.AddLine(D2Point(R.Right - x1, R.Top));
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Right, R.Top + y1));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1, R.Right,
              R.Top + y1));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Right - x1, R.Top + y2));
              Path.AddLine(D2Point(R.Right - x2, R.Top + y1));
              Path.AddLine(D2Point(R.Right, R.Top + y1));
            end;
        else
          Path.AddBezier(D2Bezier(R.Right - x2, R.Top, R.Right, R.Top + (y2), R.Right, R.Top + y1))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Right, R.Top));
        Path.AddLine(D2Point(R.Right, R.Top + y1));
      end;
      Path.AddLine(D2Point(R.Right, R.Bottom - y1));
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Right - x1, R.Bottom));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Right - x2, R.Bottom - y1, R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Right - x2, R.Bottom - y1));
              Path.AddLine(D2Point(R.Right - x1, R.Bottom - y2));
              Path.AddLine(D2Point(R.Right - x1, R.Bottom));
            end;
        else
          Path.AddBezier(D2Bezier(R.Right, R.Bottom - (y2), R.Right - x2, R.Bottom, R.Right - x1, R.Bottom))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Right, R.Bottom));
        Path.AddLine(D2Point(R.Right - x1, R.Bottom));
      end;
      Path.AddLine(D2Point(R.Left + x1, R.Bottom));
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Left, R.Bottom - y1));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Left + x1, R.Bottom - y2, R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Left + x1, R.Bottom - y2));
              Path.AddLine(D2Point(R.Left + x2, R.Bottom - y1));
              Path.AddLine(D2Point(R.Left, R.Bottom - y1));
            end;
        else
          Path.AddBezier(D2Bezier(R.Left + x2, R.Bottom, R.Left, R.Bottom - (y2), R.Left, R.Bottom - y1))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Left, R.Bottom));
        Path.AddLine(D2Point(R.Left, R.Bottom - y1));
      end;
      Path.EndFigure(D2D1_FIGURE_END_CLOSED);
      Path.Close;
      Path := nil;
      FTarget.DrawGeometry(Geometry, FStrokeBrush, StrokeThickness, FStrokeStyle);
      Geometry := nil;
    end;
  end;
end;

procedure TCanvasD2D.FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
  const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound);
var
  Geometry: ID2D1PathGeometry;
  Path: ID2D1GeometrySink;
  x1, x2, y1, y2: Single;
  R: TRectF;
begin
  if (FTarget <> nil) and (FFill.Kind <> TBrushKind.bkNone) then
  begin
    if ((XRadius = 0) and (YRadius = 0)) or (ACorners = []) then
    begin
      IntFillRect(ARect, AOpacity);
    end else
    begin
      R := ARect;
      x1 := XRadius;
      if RectWidth(R) - (x1 * 2) < 0 then
        x1 := (XRadius * (RectWidth(R) / (x1 * 2)));
      x2 := x1 * CurveKappaInv;
      y1 := YRadius;
      if RectHeight(R) - (y1 * 2) < 0 then
        y1 := (YRadius * (RectHeight(R) / (y1 * 2)));
      y2 := y1 * CurveKappaInv;
      Factory.CreatePathGeometry(Geometry);
      Geometry.Open(Path);
      Path.BeginFigure(D2Point(R.Left, R.Top + y1), D2D1_FIGURE_BEGIN_FILLED);
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Left + x1, R.Top));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2, R.Left + x1, R.Top));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Left + x2, R.Top + y1));
              Path.AddLine(D2Point(R.Left + x1, R.Top + y2));
              Path.AddLine(D2Point(R.Left + x1, R.Top));
            end;
        else
          Path.AddBezier(D2Bezier(R.Left, R.Top + (y2), R.Left + x2, R.Top, R.Left + x1, R.Top))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Left, R.Top));
        Path.AddLine(D2Point(R.Left + x1, R.Top));
      end;
      Path.AddLine(D2Point(R.Right - x1, R.Top));
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Right, R.Top + y1));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1, R.Right, R.Top + y1));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Right - x1, R.Top + y2));
              Path.AddLine(D2Point(R.Right - x2, R.Top + y1));
              Path.AddLine(D2Point(R.Right, R.Top + y1));
            end;
        else
          Path.AddBezier(D2Bezier(R.Right - x2, R.Top, R.Right, R.Top + (y2), R.Right, R.Top + y1))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Right, R.Top));
        Path.AddLine(D2Point(R.Right, R.Top + y1));
      end;
      Path.AddLine(D2Point(R.Right, R.Bottom - y1));
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Right - x1, R.Bottom));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Right - x2, R.Bottom - y1, R.Right - x1, R.Bottom - y2,
              R.Right - x1, R.Bottom));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Right - x2, R.Bottom - y1));
              Path.AddLine(D2Point(R.Right - x1, R.Bottom - y2));
              Path.AddLine(D2Point(R.Right - x1, R.Bottom));
            end;
        else
          Path.AddBezier(D2Bezier(R.Right, R.Bottom - (y2), R.Right - x2, R.Bottom, R.Right - x1, R.Bottom))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Right, R.Bottom));
        Path.AddLine(D2Point(R.Right - x1, R.Bottom));
      end;
      Path.AddLine(D2Point(R.Left + x1, R.Bottom));
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(D2Point(R.Left, R.Bottom - y1));
          TCornerType.ctInnerRound:
            Path.AddBezier(D2Bezier(R.Left + x1, R.Bottom - y2, R.Left + x2, R.Bottom - y1,
              R.Left, R.Bottom - y1));
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(D2Point(R.Left + x1, R.Bottom - y2));
              Path.AddLine(D2Point(R.Left + x2, R.Bottom - y1));
              Path.AddLine(D2Point(R.Left, R.Bottom - y1));
            end;
        else
          Path.AddBezier(D2Bezier(R.Left + x2, R.Bottom, R.Left, R.Bottom - (y2), R.Left, R.Bottom - y1))
        end;
      end
      else
      begin
        Path.AddLine(D2Point(R.Left, R.Bottom));
        Path.AddLine(D2Point(R.Left, R.Bottom - y1));
      end;
      Path.EndFigure(D2D1_FIGURE_END_CLOSED);
      Path.Close;
      Path := nil;
      IntFillPath(Geometry, ARect, AOpacity);
      Geometry := nil;
    end;
  end;
end;

procedure TCanvasD2D.DrawEllipse(const ARect: TRectF; const AOpacity: Single);
var
  R: TRectF;
begin
  if (FTarget <> nil) and (FStroke.Kind <> TBrushKind.bkNone) then
  begin
    ApplyStroke(ARect, AOpacity);
    FTarget.DrawEllipse(D2Ellipse(ARect), FStrokeBrush, StrokeThickness, FStrokeStyle);
  end;
end;

procedure TCanvasD2D.FillEllipse(const ARect: TRectF; const AOpacity: Single);
var
  Geometry: ID2D1EllipseGeometry;
begin
  if (FTarget <> nil) and (FFill.Kind <> TBrushKind.bkNone) then
  begin
    if FFill.Kind <> TBrushKind.bkGrab then
    begin
      ApplyFill(ARect, AOpacity);
      FTarget.FillEllipse(D2Ellipse(ARect), FBrush);
    end
    else
    begin
      Factory.CreateEllipseGeometry(D2Ellipse(ARect), Geometry);
      IntFillPath(Geometry, ARect, AOpacity);
      Geometry := nil;
    end;
  end;
end;

procedure TCanvasD2D.FillText(const ARect: TRectF; const AText: WideString; const WordWrap: Boolean;
  const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
  const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  TextRange: TDWriteTextRange;
  TextLayout: IDWriteTextLayout;
  TextFormat: IDWriteTextFormat;
  R: TRectF;
  S: TFontStyle;
  WS: WideString;
begin
  if (FTarget <> nil) and (FFill.Kind <> TBrushKind.bkNone) and (AText <> '') and not (ARect.IsEmpty) then
  begin
    if (ARect.Width < 0) or (ARect.Height < 0) then Exit;
    WS := FFont.Family;
    DWriteFactory.CreateTextFormat(PWideChar(WS), nil, D2FontWeight(FFont.Style),
      D2FontStyle(FFont.Style), DWRITE_FONT_STRETCH_NORMAL, FFont.Size, PWideChar(FLocaleName), TextFormat);
    if TFillTextFlag.ftRightToLeft in Flags then
      TextFormat.SetReadingDirection(DWRITE_READING_DIRECTION_RIGHT_TO_LEFT);
    DWriteFactory.CreateTextLayout(PWideChar(AText), Length(AText), TextFormat, RectWidth(ARect),
      RectHeight(ARect), TextLayout);

    TextRange.StartPosition := 0;
    TextRange.Length := Length(AText);

    if not WordWrap then
      TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_NO_WRAP)
    else
      TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_WRAP);

    if TFontStyle.fsStrikeOut in FFont.Style then
      TextLayout.SetStrikethrough(True, TextRange);

    if TFontStyle.fsUnderline in FFont.Style then
      TextLayout.SetUnderline(True, TextRange);

    // formating
    case AVTextAlign of
      TTextAlign.taCenter:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_CENTER);
        end;
      TTextAlign.taLeading:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_NEAR);
        end;
      TTextAlign.taTrailing:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_FAR);
        end;
    end;
    case ATextAlign of
      TTextAlign.taCenter:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_CENTER);
        end;
      TTextAlign.taLeading:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_LEADING);
        end;
      TTextAlign.taTrailing:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_TRAILING);
        end;
    end;
    // calc correct rect
    ApplyFill(ARect, AOpacity);
    // draw
    FTarget.DrawTextLayout(D2Point(ARect.Left, ARect.Top), TextLayout, FBrush, D2D1_DRAW_TEXT_OPTIONS_CLIP);
    TextFormat := nil;
    TextLayout := nil;
  end;
end;


procedure TCanvasD2D.MeasureText(var ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
  const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  TextRange: TDWriteTextRange;
  TextLayout: IDWriteTextLayout;
  TextMetrics: TDWriteTextMetrics;
  TextFormat: IDWriteTextFormat;
  R: TRectF;
  S: TFontStyle;
  WS: WideString;
begin
  if not WordWrap then
    ARect.Right := ARect.Left;
  if Length(AText) = 0 then
    Exit;

  WS := FFont.Family;
  DWriteFactory.CreateTextFormat(PWideChar(WS), nil, D2FontWeight(FFont.Style), D2FontStyle(FFont.Style),
    DWRITE_FONT_STRETCH_NORMAL, FFont.Size, PWideChar(FLocaleName), TextFormat);
  if TFillTextFlag.ftRightToLeft in Flags then
    TextFormat.SetReadingDirection(DWRITE_READING_DIRECTION_RIGHT_TO_LEFT);

  DWriteFactory.CreateTextLayout(PWideChar(AText), Length(AText), TextFormat, RectWidth(ARect),
    RectHeight(ARect), TextLayout);

  TextRange.StartPosition := 0;
  TextRange.Length := Length(AText);

  if not WordWrap then
    TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_NO_WRAP)
  else
    TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_WRAP);

  if TFontStyle.fsStrikeOut in FFont.Style then
    TextLayout.SetStrikethrough(True, TextRange);

  if TFontStyle.fsUnderline in FFont.Style then
    TextLayout.SetUnderline(True, TextRange);

  // formating
  case AVTextAlign of
    TTextAlign.taCenter:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_CENTER);
      end;
    TTextAlign.taLeading:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_NEAR);
      end;
    TTextAlign.taTrailing:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_FAR);
      end;
  end;
  case ATextAlign of
    TTextAlign.taCenter:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_CENTER);
      end;
    TTextAlign.taLeading:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_LEADING);
      end;
    TTextAlign.taTrailing:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_TRAILING);
      end;
  end;
  // measure
  TextLayout.GetMetrics(TextMetrics);
  ARect := RectF(ARect.Left + TextMetrics.Left, ARect.Top + TextMetrics.Top,
    ARect.Left + TextMetrics.Left + TextMetrics.widthIncludingTrailingWhitespace,
    ARect.Top + TextMetrics.Top + TextMetrics.Height);

  TextFormat := nil;
  TextLayout := nil;
end;

procedure TCanvasD2D.MeasureLines(ALines: TLineMetricInfo; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
  const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  TextRange: TDWriteTextRange;
  TextLayout: IDWriteTextLayout;
  TextFormat: IDWriteTextFormat;
  RWidth, RHeight: Single;
  WS: WideString;
  P,
  I, LineCount: Cardinal;
  LineMetrics: array of DWRITE_LINE_METRICS;
//  ALineMetric: TLineMetric;
begin
  if Length(AText) = 0 then
    Exit;

  if not WordWrap then
    RWidth := 0
  else
    RWidth := RectWidth(ARect);
  RHeight := RectHeight(ARect);

  WS := FFont.Family;
  DWriteFactory.CreateTextFormat(PWideChar(WS), nil, D2FontWeight(FFont.Style), D2FontStyle(FFont.Style),
    DWRITE_FONT_STRETCH_NORMAL, FFont.Size, PWideChar(FLocaleName), TextFormat);
  if TFillTextFlag.ftRightToLeft in Flags then
    TextFormat.SetReadingDirection(DWRITE_READING_DIRECTION_RIGHT_TO_LEFT);

  DWriteFactory.CreateTextLayout(PWideChar(AText), Length(AText), TextFormat, RWidth, RHeight, TextLayout);

  TextRange.StartPosition := 0;
  TextRange.Length := Length(AText);

  if not WordWrap then
    TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_NO_WRAP)
  else
    TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_WRAP);

  if TFontStyle.fsStrikeOut in FFont.Style then
    TextLayout.SetStrikethrough(True, TextRange);

  if TFontStyle.fsUnderline in FFont.Style then
    TextLayout.SetUnderline(True, TextRange);

  // formating
  case AVTextAlign of
    TTextAlign.taCenter:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_CENTER);
      end;
    TTextAlign.taLeading:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_NEAR);
      end;
    TTextAlign.taTrailing:
      begin
        TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_FAR);
      end;
  end;
  case ATextAlign of
    TTextAlign.taCenter:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_CENTER);
      end;
    TTextAlign.taLeading:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_LEADING);
      end;
    TTextAlign.taTrailing:
      begin
        TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_TRAILING);
      end;
  end;

  // measure
  TextLayout.GetLineMetrics(NIL, 0, LineCount);
  if LineCount > 0 then
  begin
    SetLength(LineMetrics, LineCount);
    TextLayout.GetLineMetrics(@(LineMetrics[0]), LineCount, LineCount);

    ALines.Count := LineCount;
    P := 1;
    for I := 0 to LineCount - 1 do
    begin
      ALines.Metrics[I].Index := P;
//      if LineMetrics[I].newlineLength = 0 then
//        ALines.Metrics[I].LineTypes := []
//      else
//        ALines.Metrics[I].LineTypes := [TLineType.ltWrap];
      P := P + LineMetrics[I].length;
    end;
  end;
  TextFormat := nil;
  TextLayout := nil;
end;

{ Bitmaps }

procedure TCanvasD2D.UpdateBitmapHandle(ABitmap: TBitmap);
var
  B: ID2D1Bitmap;
  R: D2D1_RECT_U;
begin
  if (FTarget <> nil) and (ABitmap <> nil) then
  begin
    if ABitmap.Width * ABitmap.Height = 0 then
    begin
      ABitmap.HandlesNeedUpdate[Self] := False;
      Exit;
    end;
    if not ABitmap.HandleExists(Self) then
    begin
      Res := FTarget.CreateBitmap(D2Size(ABitmap.Width, ABitmap.Height), ABitmap.Startline,
        ABitmap.Width * 4, BitmapProp(DXGI_FORMAT_B8G8R8A8_UNORM, D2D1_ALPHA_MODE_PREMULTIPLIED), B);
      B._AddRef;
      ABitmap.AddFreeNotify(Self);
      ABitmap.HandleAdd(Self);
      ABitmap.Handles[Self] := Pointer(B);
      ABitmap.HandlesNeedUpdate[Self] := False;
      FBitmaps.Add(ABitmap);
    end
    else
      B := ID2D1Bitmap(ABitmap.Handles[Self]);

    if ABitmap.HandlesNeedUpdate[Self] then
    begin
      R.Left := 0;
      R.Top := 0;
      R.Right := ABitmap.Width;
      R.Bottom := ABitmap.Height;
      Res := B.CopyFromMemory(R, ABitmap.StartLine, ABitmap.Width * 4);
      ABitmap.HandlesNeedUpdate[Self] := False;
    end;
  end;
end;

procedure TCanvasD2D.DestroyBitmapHandle(ABitmap: TBitmap);
var
  B: ID2D1Bitmap;
begin
  if (FTarget <> nil) and ABitmap.HandleExists(Self) then
  begin
    FBitmaps.Remove(ABitmap);
    B := ID2D1Bitmap(ABitmap.Handles[Self]);
    B._Release;
    B := nil;

    ABitmap.RemoveFreeNotify(Self);
    ABitmap.HandleRemove(Self);
  end;
end;

procedure TCanvasD2D.DrawThumbnail(const ABitmap: TBitmap; const Width, Height: Single);
var
  scale: Single;
begin
  if ABitmap.Width = 0 then
    Exit;
  scale := Width / ABitmap.Width;
  if FBitmap <> nil then
  begin
    // Fgraphics.ScaleTransform(scale, scale);
    // FTarget.DrawBitmap(ID2D1Bitmap(ABitmap.Handle), @DR, AOpacity, IntMode, @SR);
  end;
end;

procedure TCanvasD2D.DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single;
  const HighSpeed: Boolean = False);
var
  SR, DR: TD2D1RectF;
  IntMode: TD2D1BitmapInterpolationMode;
  B: ID2D1Bitmap;
begin
  if FTarget <> nil then
  begin
    if HighSpeed then
      IntMode := D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR
    else
      IntMode := D2D1_BITMAP_INTERPOLATION_MODE_LINEAR;

    SR := D2Rect(SrcRect);
    DR := D2Rect(DstRect);

    UpdateBitmapHandle(ABitmap);
    B := ID2D1Bitmap(ABitmap.Handles[Self]);
    if B <> nil then
      FTarget.DrawBitmap(B, @DR, AOpacity, IntMode, @SR);
  end;
end;

{ Path }

procedure TCanvasD2D.DrawPath(const APath: TPathData; const AOpacity: Single);
var
  i: Integer;
  CP1, CP2: TPointF;
  Geometry: ID2D1PathGeometry;
  Path: ID2D1GeometrySink;
  Closed: Boolean;
begin
  if (FTarget <> nil) and (FStroke.Kind <> TBrushKind.bkNone) and not APath.IsEmpty then
  begin

    ApplyStroke(APath.GetBounds, AOpacity);

    Factory.CreatePathGeometry(Geometry);
    Geometry.Open(Path);
    i := 0;
    Closed := False;
    while i < APath.Count do
    begin
      case APath[i].Kind of
        TPathPointKind.ppMoveTo:
          begin
            if (i > 0) and (APath[i - 1].Kind <> TPathPointKind.ppClose) then
              Path.EndFigure(D2D1_FIGURE_END_OPEN);
            Path.BeginFigure(D2Point(APath[i].Point.X,
              APath[i].Point.Y), D2D1_FIGURE_BEGIN_FILLED);
          end;
        TPathPointKind.ppLineTo:
          begin
            Path.AddLine(D2Point(APath[i].Point.X,
              APath[i].Point.Y));
          end;
        TPathPointKind.ppCurveTo:
          begin
            CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
            Inc(i);
            CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
            Inc(i);
            Path.AddBezier(D2Bezier(CP1.X, CP1.y, CP2.X, CP2.y, APath[i].Point.X, APath[i].Point.Y));
          end;
        TPathPointKind.ppClose:
          begin
            Path.EndFigure(D2D1_FIGURE_END_CLOSED);
            Closed := True;
          end;
      end;
      Inc(i);
    end;

    if not Closed then
      Path.EndFigure(D2D1_FIGURE_END_OPEN);

    Res := Path.Close;
    FTarget.DrawGeometry(Geometry, FStrokeBrush, StrokeThickness, FStrokeStyle);
  end;
end;

procedure TCanvasD2D.FillPath(const APath: TPathData; const AOpacity: Single);
var
  i: Integer;
  CP1, CP2: TPointF;
  Geometry: ID2D1PathGeometry;
  Path: ID2D1GeometrySink;
  Closed: Boolean;
begin
  if FFill.Kind = TBrushKind.bkNone then
    Exit;
  if APath.IsEmpty then
    Exit;

  Factory.CreatePathGeometry(Geometry);
  Geometry.Open(Path);
  i := 0;
  Closed := False;
  while i < APath.Count do
  begin
    case APath[i].Kind of
      TPathPointKind.ppMoveTo:
        begin
          if (i > 0) and (APath[i - 1].Kind <> TPathPointKind.ppClose) then
            Path.EndFigure(D2D1_FIGURE_END_OPEN);
          Path.BeginFigure(D2Point(APath[i].Point.X,
            APath[i].Point.Y), D2D1_FIGURE_BEGIN_FILLED);
        end;
      TPathPointKind.ppLineTo:
        begin
          Path.AddLine(D2Point(APath[i].Point.X,
            APath[i].Point.Y));
        end;
      TPathPointKind.ppCurveTo:
        begin
          CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          Path.AddBezier(D2Bezier(CP1.X, CP1.y, CP2.X, CP2.y, APath[i].Point.X, APath[i].Point.Y));
        end;
      TPathPointKind.ppClose:
        begin
          Path.EndFigure(D2D1_FIGURE_END_CLOSED);
          Closed := True;
        end;
    end;
    Inc(i);
  end;
  if not Closed then
    Path.EndFigure(D2D1_FIGURE_END_OPEN);

  Path.Close;
  IntFillPath(Geometry, APath.GetBounds, AOpacity);
end;

function TCanvasD2D.PtInPath(const APoint: TPointF; const APath: TPathData): Boolean;
var
  i: Integer;
  B: TRectF;
  CP1, CP2: TPointF;
  Geometry: ID2D1PathGeometry;
  Path: ID2D1GeometrySink;
  Cont: LongBool;
  Closed: Boolean;
begin
  Result := False;
  B := APath.GetBounds;
  if not PointInRect(APoint, B) then
    Result := False
  else
  begin
    if APath.IsEmpty then
      Exit;
    Factory.CreatePathGeometry(Geometry);
    Geometry.Open(Path);
    i := 0;
    Closed := False;
    while i < APath.Count do
    begin
      case APath[i].Kind of
        TPathPointKind.ppMoveTo:
          begin
            Path.BeginFigure(D2Point(APath[i].Point.X,
              APath[i].Point.Y), D2D1_FIGURE_BEGIN_FILLED);
          end;
        TPathPointKind.ppLineTo:
          begin
            Path.AddLine(D2Point(APath[i].Point.X,
              APath[i].Point.Y));
          end;
        TPathPointKind.ppCurveTo:
          begin
            CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
            Inc(i);
            CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
            Inc(i);
            Path.AddBezier(D2Bezier(CP1.X, CP1.y, CP2.X, CP2.y, APath[i].Point.X, APath[i].Point.Y));
          end;
        TPathPointKind.ppClose:
          begin
            Path.EndFigure(D2D1_FIGURE_END_CLOSED);
            Closed := True;
          end;
      end;
      Inc(i);
    end;
    if not Closed then
      Path.EndFigure(D2D1_FIGURE_END_OPEN);

    Path.Close;
    Geometry.FillContainsPoint(D2Point(APoint.X, APoint.y), IdentM, 1, Cont);

    Result := Cont;
  end;
end;

{ TTextRendering }

type
  TSink = class(TInterfacedPersistent, ID2D1SimplifiedGeometrySink)
  private
    Path: TPathData;
    procedure SetFillMode(FillMode: TD2D1FillMode); stdcall;
    procedure SetSegmentFlags(VertexFlags: TD2D1PathSegment); stdcall;
    procedure BeginFigure(StartPoint: TD2D1Point2F; FigureBegin: TD2D1FigureBegin); stdcall;
    procedure AddLines(Points: PD2D1Point2F;
      (* __in_ecount(pointsCount) *) PointsCount: LongWord); stdcall;
    procedure AddBeziers(Beziers: PD2D1BezierSegment;
      (* __in_ecount(beziersCount) *) BeziersCount: LongWord); stdcall;
    procedure EndFigure(FigureEnd: D2D1_FIGURE_END); stdcall;
    function Close: HResult; stdcall;
  public
  end;

{ TSink }

procedure TSink.BeginFigure(StartPoint: TD2D1Point2F; FigureBegin: TD2D1FigureBegin);
begin
  Path.MoveTo(TPointF(StartPoint));
end;

procedure TSink.AddBeziers(Beziers: PD2D1BezierSegment; BeziersCount: LongWord);
var
  i: Integer;
begin
  for i := 0 to BeziersCount - 1 do
  begin
    Path.CurveTo(TPointF(Beziers.Point1), TPointF(Beziers.Point2), TPointF(Beziers.Point3));
    Inc(Beziers);
  end;
end;

procedure TSink.AddLines(Points: PD2D1Point2F; PointsCount: LongWord);
var
  i: Integer;
begin
  for i := 0 to PointsCount - 1 do
  begin
    Path.LineTo(TPointF(Points^));
    Inc(Points);
  end;
end;

procedure TSink.EndFigure(FigureEnd: D2D1_FIGURE_END);
begin
  Path.ClosePath;
end;

function TSink.Close: HResult;
begin
  Result := S_OK;
end;

procedure TSink.SetFillMode(FillMode: TD2D1FillMode);
begin
end;

procedure TSink.SetSegmentFlags(VertexFlags: TD2D1PathSegment);
begin
end;

type

{ TTextRendering }

  TTextRendering = class(TInterfacedPersistent, IDWriteTextRenderer)
  private
    Canvas: TCanvasD2D;
    function IsPixelSnappingDisabled(clientDrawingContext: Pointer; var isDisabled: BOOL): HResult; stdcall;

    function GetCurrentTransform(clientDrawingContext: Pointer; var Transform: TDwriteMatrix): HResult; stdcall;

    function GetPixelsPerDip(clientDrawingContext: Pointer; var pixelsPerDip: Single): HResult; stdcall;
    function DrawGlyphRun(clientDrawingContext: Pointer; baselineOriginX: Single; baselineOriginY: Single;
      measuringMode: TDWriteMeasuringMode; var glyphRun: TDwriteGlyphRun;
      var glyphRunDescription: TDwriteGlyphRunDescription; const clientDrawingEffect: IUnknown): HResult; stdcall;

    function DrawUnderline(clientDrawingContext: Pointer; baselineOriginX: Single; baselineOriginY: Single;
      var underline: TDwriteUnderline; const clientDrawingEffect: IUnknown): HResult; stdcall;

    function DrawStrikethrough(clientDrawingContext: Pointer; baselineOriginX: Single; baselineOriginY: Single;
      var strikethrough: TDwriteStrikethrough; const clientDrawingEffect: IUnknown): HResult; stdcall;

    function DrawInlineObject(clientDrawingContext: Pointer; originX: Single; originY: Single;
      var inlineObject: IDWriteInlineObject; isSideways: BOOL; isRightToLeft: BOOL;
      const clientDrawingEffect: IUnknown): HResult; stdcall;
  end;

function TTextRendering.DrawGlyphRun(clientDrawingContext: Pointer; baselineOriginX: Single; baselineOriginY: Single;
  measuringMode: TDWriteMeasuringMode; var glyphRun: TDwriteGlyphRun;
  var glyphRunDescription: TDwriteGlyphRunDescription; const clientDrawingEffect: IUnknown): HResult;
var
  pPathGeometry: ID2D1PathGeometry;
  pSink: ID2D1GeometrySink;
  pSimSink: TSink;
begin
  // Create the path geometry.
  Res := Factory.CreatePathGeometry(pPathGeometry);
  // Write to the path geometry using the geometry sink.
  if (SUCCEEDED(Res)) then
    Res := pPathGeometry.Open(pSink);
  // Get the glyph run outline geometries back from DirectWrite and place them within the geometry sink.
  if (SUCCEEDED(Res)) then
  begin
    Res := glyphRun.fontFace.GetGlyphRunOutline(glyphRun.fontEmSize, glyphRun.glyphIndices, glyphRun.glyphAdvances,
      glyphRun.glyphOffsets, glyphRun.glyphCount, glyphRun.isSideways, False { glyphRun.bidiLevel } , pSink);
  end;
  // Close the geometry sink
  if (SUCCEEDED(Res)) then
    Res := pSink.Close();
  // Simplify
  pSimSink := TSink.Create;
  pSimSink.Path := TPathData(clientDrawingContext);
  Res := pPathGeometry.Simplify(D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES, IdentM, 0, pSimSink);
  pSimSink.Close;
  pSimSink.Path.Translate(baselineOriginX, baselineOriginY);
  pSimSink.Free;
end;

function TTextRendering.DrawInlineObject(clientDrawingContext: Pointer; originX: Single; originY: Single;
  var inlineObject: IDWriteInlineObject; isSideways: BOOL; isRightToLeft: BOOL;
  const clientDrawingEffect: IUnknown): HResult;
begin
  Result := S_OK;
end;

function TTextRendering.DrawStrikethrough(clientDrawingContext: Pointer; baselineOriginX: Single;
  baselineOriginY: Single; var strikethrough: TDwriteStrikethrough; const clientDrawingEffect: IUnknown): HResult;
begin
  Result := S_OK;
end;

function TTextRendering.DrawUnderline(clientDrawingContext: Pointer; baselineOriginX: Single; baselineOriginY: Single;
  var underline: TDwriteUnderline; const clientDrawingEffect: IUnknown): HResult;
begin
  Result := S_OK;
end;

function TTextRendering.GetCurrentTransform(clientDrawingContext: Pointer; var Transform: TDwriteMatrix): HResult;
begin
  Transform := TDwriteMatrix(D2Matrix(IdentityMatrix));
  Result := S_OK;
end;

function TTextRendering.GetPixelsPerDip(clientDrawingContext: Pointer; var pixelsPerDip: Single): HResult;
begin
  pixelsPerDip := 1;
  Result := S_OK;
end;

function TTextRendering.IsPixelSnappingDisabled(clientDrawingContext: Pointer; var isDisabled: BOOL): HResult;
begin
  isDisabled := True;
  Result := S_OK;
end;

function TCanvasD2D.TextToPath(Path: TPathData; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean;
  const ATextAlign, AVTextAlign: TTextAlign): Boolean;
var
  TextRange: TDWriteTextRange;
  TextLayout: IDWriteTextLayout;
  TextFormat: IDWriteTextFormat;
  R: TRectF;
  S: TFontStyle;
  WS: WideString;
  MyRenderer: TTextRendering;
begin
  if (AText <> '') then
  begin
    Path.Clear;

    WS := FFont.Family;
    DWriteFactory.CreateTextFormat(PWideChar(WS), nil, D2FontWeight(FFont.Style), D2FontStyle(FFont.Style),
      DWRITE_FONT_STRETCH_NORMAL, FFont.Size, PWideChar(FLocaleName), TextFormat);
    DWriteFactory.CreateTextLayout(PWideChar(AText), Length(AText), TextFormat, RectWidth(ARect), RectHeight(ARect),
      TextLayout);

    TextRange.StartPosition := 0;
    TextRange.Length := Length(AText);

    if not WordWrap then
      TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_NO_WRAP)
    else
      TextLayout.SetWordWrapping(DWRITE_WORD_WRAPPING_WRAP);

    if TFontStyle.fsStrikeOut in FFont.Style then
      TextLayout.SetStrikethrough(True, TextRange);

    if TFontStyle.fsUnderline in FFont.Style then
      TextLayout.SetUnderline(True, TextRange);

    // formating
    case AVTextAlign of
      TTextAlign.taCenter:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_CENTER);
        end;
      TTextAlign.taLeading:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_NEAR);
        end;
      TTextAlign.taTrailing:
        begin
          TextLayout.SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT_FAR);
        end;
    end;
    case ATextAlign of
      TTextAlign.taCenter:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_CENTER);
        end;
      TTextAlign.taLeading:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_LEADING);
        end;
      TTextAlign.taTrailing:
        begin
          TextLayout.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_TRAILING);
        end;
    end;
    // render
    MyRenderer := TTextRendering.Create;
    MyRenderer.Canvas := Self;
    TextLayout.Draw(Path, MyRenderer, 0, 0);
    MyRenderer.Free;
    // free
    Result := True;
  end
  else
    Result := False;
end;

{ TD2DCanvasSaveState }

procedure TD2DCanvasSaveState.Assign(Source: TPersistent);
var
  LSource: TCanvasD2D;
begin
  inherited Assign(Source);
  if Source is TCanvasD2D then
  begin
    LSource := TCanvasD2D(Source);
    OleCheck(Factory.CreateDrawingStateBlock(nil, nil, FStateBlock));
    LSource.RenderTarget.SaveDrawingState(FStateBlock);
    LSource.FCurrentSaveState := Self;
  end;
end;

procedure TD2DCanvasSaveState.AssignTo(Dest: TPersistent);
var
  LDest: TCanvasD2D;
begin
  inherited AssignTo(Dest);
  if Dest is TCanvasD2D then
  begin
    LDest := TCanvasD2D(Dest);
    LDest.FCurrentSaveState := nil;
    LDest.RenderTarget.RestoreDrawingState(FStateBlock);
    if FLayer <> nil then
    begin
      LDest.RenderTarget.PopLayer;
      FLayer := nil;
    end;
  end;
end;

procedure TD2DCanvasSaveState.CreateLayer(const RenderTarget: ID2D1RenderTarget);
begin
  OleCheck(RenderTarget.CreateLayer(nil, FLayer));
end;

initialization
  FillChar(IdentM, SizeOf(IdentM), 0);
  IdentM._11 := 1;
  IdentM._22 := 1;
end.
