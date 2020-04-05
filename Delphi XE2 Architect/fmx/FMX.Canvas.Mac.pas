{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Canvas.Mac;

{$I FMX.Defines.inc}
{$H+}

interface

implementation {===============================================================}

uses
  System.Classes, System.SysUtils, System.Math, System.Types, System.UITypes, FMX.Types, Macapi.CocoaTypes,
  Macapi.CoreGraphics, FMX.Platform, Macapi.CoreFoundation, Macapi.ImageIO, Macapi.CoreText,
  FMX.Printer.Mac;

const
  libPrintCore = '/System/Library/Frameworks/ApplicationServices.framework/Frameworks/PrintCore.framework/PrintCore';

                                                                                         
// and must be removed after delivery
function PMSessionGetCGGraphicsContext(printSession: PMPrintSession; context: PCGContextRef): OSStatus; cdecl; external libPrintCore name '_PMSessionGetCGGraphicsContext';

type
  TQuartzCanvasSaveState = class(TCanvasSaveState)
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Assign(Source: TPersistent); override;
  end;

  { TBitmapCodecQuartz }

  TBitmapCodecQuartz = class(TBitmapCodec)
  private
  public
  published
    class function GetFileTypes: string; override;
    class function GetImageSize(const AFileName: string): TPointF; override;
    function LoadFromFile(const AFileName: string; const Rotate: single; var Bitmap: TBitmap): Boolean; override;
    function LoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: single; const UseEmbedded: Boolean;var Bitmap: TBitmap): Boolean; override;
    function SaveToFile(const AFileName: string; var Bitmap: TBitmap; const Params: string = ''): Boolean; override;
    function LoadFromStream(const AStream: TStream; var Bitmap: TBitmap): Boolean; override;
    function SaveToStream(const AStream: TStream; var Bitmap: TBitmap; const Format: string;
      const Params: string = ''): Boolean; override;
  end;

  { TCanvasQuartz }

  TCanvasQuartz = class(TCanvas)
  private
    FFunc: CGFunctionRef;
    FBitmapRef: CGImageRef;
    FCallback: CGFunctionCallbacks;
    FShading: CGShadingRef;
    FContext: CGContextRef;
    FFontScale: single;
    function Context: CGContextRef; inline;
    function CreateSaveState: TCanvasSaveState; override;
    procedure SetClipRects(const ARects: array of TRectF);
    // calculates the origin of the Canvas depending on the output device;
    // the result is useful for the coordinate system inversion
    function CalcOrigin: TPointF;
    function GetScaleFactor: TPointF;
  protected
    // adapts the coordinate system to make it usable as on Win32; for printers
    // it adapts the coordinate system units to the selected printer resolution
    procedure AdaptCoordinateSystem;

    procedure ApplyFill(ARect: TRectF; const AOpacity: single);
    procedure DeApplyFill(ARect: TRectF; const AOpacity: single);
    procedure ApplyStroke(ARect: TRectF; const AOpacity: single);
    procedure FontChanged(Sender: TObject); override;
    class function GetBitmapScanline(Bitmap: TBitmap; y: Integer): PAlphaColorArray; override;
    { Bitmaps }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); override;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); override;
    procedure FreeBuffer; override;
    { scene }
    function DoBeginScene(const AClipRects: PClipRects = nil): Boolean; override;
    procedure DoEndScene; override;
  public
    constructor CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer); override;
    constructor CreateFromBitmap(const ABitmap: TBitmap); override;
    constructor CreateFromPrinter(const APrinter: TAbstractPrinter); override;
    { buffer }
    procedure ResizeBuffer(const AWidth, AHeight: Integer); override;
    procedure FlushBufferRect(const X, Y: Integer; const Context; const ARect: TRectF); override;
    procedure Clear(const Color: TAlphaColor); override;
    procedure ClearRect(const ARect: TRectF; const AColor: TAlphaColor = 0); override;
    { matrix }
    procedure SetMatrix(const M: TMatrix); override;
    procedure MultyMatrix(const M: TMatrix); override;
    { cliping }
    procedure IntersectClipRect(const ARect: TRectF); override;
    procedure ExcludeClipRect(const ARect: TRectF); override;
    { drawing }
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: single); override;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: single; const ACorners: TCorners; const AOpacity: single;
      const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: single; const ACorners: TCorners; const AOpacity: single;
      const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: single); override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: single); override;
    function PtInPath(const APoint: TPointF; const APath: TPathData): Boolean; override;
    procedure FillPath(const APath: TPathData; const AOpacity: single); override;
    procedure DrawPath(const APath: TPathData; const AOpacity: single); override;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DsTRectF: TRectF; const AOpacity: single; const HighSpeed: Boolean = False); override;
    procedure FillText(const ARect: TRectF; const AText: string;
      const WordWrap: Boolean; const AOpacity: Single;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    procedure MeasureText(var ARect: TRectF;
      const AText: string; const WordWrap: Boolean;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    function TextToPath(Path: TPathData; const ARect: TRectF; const AText: string; const WordWrap: Boolean; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean; override;

    // the X and Y factors by which the canvas is scaled
    property ScaleFactor: TPointF read GetScaleFactor;
  end;

function CGRectFromRect(const R: TRectF): CGRect; forward;

var
  MyColorSpace: CGColorSpaceRef;

function ColorSpace: CGColorSpaceRef;
begin
  if MyColorSpace = nil then
    MyColorSpace := CGColorSpaceCreateDeviceRGB;
  Result := MyColorSpace;
end;

function kUTTypePng: CFStringRef; inline;
begin
  Result := CFSTR('public.png');
end;
function kUTTypeJpeg: CFStringRef; inline;
begin
  Result := CFSTR('public.jpeg');
end;
function kUTTypeJPEG2000: CFStringRef; inline;
begin
  Result := CFSTR('public.jpeg-2000');
end;
function kUTTypeBmp: CFStringRef; inline;
begin
  Result := CFSTR('com.microsoft.bmp');
end;
function kUTTypeTiff: CFStringRef; inline;
begin
  Result := CFSTR('public.tiff');
end;
function kUTTypeGif: CFStringRef; inline;
begin
  Result := CFSTR('com.compuserve.gif');
end;

{ TBitmapCodecQuartz }

class function TBitmapCodecQuartz.GetFileTypes: string;
begin
  Result := '*.jpg;*.jpeg;*.gif;*.tif;*.tiff;*.psd;*.jp2;*.png;*.bmp;*.tga;*.icns';
end;

class function TBitmapCodecQuartz.GetImageSize(const AFileName: string): TPointF;
var
  path: CFStringRef;
  url: CFURLRef;
  imgSourceRef: CGImageSourceRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
begin
  Result := PointF(0, 0);
  path := CFStringCreateWithCString(nil, PAnsiChar(UTF8Encode(AFileName)), kCFStringEncodingUTF8);
  url := CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, False);
  CFRelease (path);
  imgSourceRef := CGImageSourceCreateWithURL(url, nil);
  CFRelease (url);
  if imgSourceRef <> nil then
  begin
    ImgRef := CGImageSourceCreateImageAtIndex(imgSourceRef, 0, nil);
    if ImgRef <> nil then
    begin
      Result := PointF(CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef));
      CGImageRelease(imgRef);
    end;
    CFRelease(imgSourceRef);
  end;
end;

function TBitmapCodecQuartz.LoadFromStream(const AStream: TStream; var Bitmap: TBitmap): Boolean;
var
  provider: CGDataProviderRef;
  memStream: TMemoryStream;
  imgSourceRef: CGImageSourceRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
begin
  Result := False;
  memStream := TMemoryStream.Create;
  memStream.CopyFrom(AStream, AStream.Size);
  memStream.Position := 0;
  provider := CGDataProviderCreateWithData(nil, memStream.Memory, memStream.Size, nil);
  if provider <> nil then
  begin
    imgSourceRef := CGImageSourceCreateWithDataProvider(provider, nil);
    if imgSourceRef <> nil then
    begin
      ImgRef := CGImageSourceCreateImageAtIndex(imgSourceRef, 0, nil);
      if ImgRef <> nil then
      begin
        Bitmap.SetSize(CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef));
        ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
           Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
        CGContextDrawImage(ctxRef, CGRectFromRect(RectF(0, 0, Bitmap.Width, Bitmap.Height)), imgRef);
        CGContextRelease(ctxRef);
        CGImageRelease(imgRef);
        Result := True;
      end;
      CFRelease(imgSourceRef);
    end;
    CGDataProviderRelease(provider);
  end;
  memStream.Free;
end;

function streamPutBytesCallback(info: Pointer; buffer: {const} Pointer; count: Longword ): Longword; cdecl;
begin
  Result := TStream(info).Write(buffer^, count);
end;

procedure streamReleaseInfoCallback( info: Pointer );
begin
//  TMemoryStream(info).Free;
end;

function TBitmapCodecQuartz.SaveToStream(const AStream: TStream; var Bitmap: TBitmap; const Format: string;
      const Params: string = ''): Boolean;
var
  consumer: CGDataConsumerRef;
  imgDestRef: CGImageDestinationRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
  encoderType: CFStringRef;
  callback: CGDataConsumerCallbacks;
  keys: array [0..10] of pointer;
  value: array [0..10] of pointer;
  floatVal: single;
  S, param, name, val: AnsiString;
  dict: CFDictionaryRef;
begin
  callback.putBytes := @streamPutBytesCallback;
  callback.releaseConsumer := @streamReleaseInfoCallback;
  consumer := CGDataConsumerCreate(AStream, @callback);

  encoderType := kUTTypePng;
  if (LowerCase(Format) = 'jpg') or (LowerCase(Format) = 'jpeg') then
    encoderType := kUTTypeJpeg;
  if (LowerCase(Format) = 'jp2') then
    encoderType := kUTTypeJPEG2000;
  if (LowerCase(Format) = 'bmp') then
    encoderType := kUTTypeBmp;
  if (LowerCase(Format) = 'png') then
    encoderType := kUTTypePng;
  if (LowerCase(Format) = 'tif') or (LowerCase(Format) = 'tiff') then
    encoderType := kUTTypeTiff;
  if (LowerCase(Format) = 'gif') then
    encoderType := kUTTypeGif;

  imgDestRef := CGImageDestinationCreateWithDataConsumer(consumer, encoderType, 1, nil);
  if imgDestRef <> nil then
  begin
    ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
       Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
    imgRef := CGBitmapContextCreateImage(ctxRef);
    if imgRef <> nil then
    begin
      dict := nil;
      { set params }
      if Params <> '' then
      begin
        S := Params;
        while S <> '' do
        begin
          param := GetToken(S, ' ');
          name := GetToken(param, '=');
          val := GetToken(param, '');
          if System.SysUtils.CompareText(name, 'quality') = 0 then
          begin
            floatVal := strToFloat(val) / 100;
            keys[0] := CFSTR('kCGImageDestinationLossyCompressionQuality');
            value[0] := CFNumberCreate(nil, kCFNumberFloat32Type, @floatVal);
            dict := CFDictionaryCreate(nil, @keys[0], @value[0], 1, nil, nil);
            CGImageDestinationSetProperties(imgDestRef, dict);
          end;
        end;
      end;
      CGImageDestinationAddImage(imgDestRef, imgRef, dict);
      CGImageDestinationFinalize(imgDestRef);
      if dict <> nil then
        CFRelease(dict);
    end;
    CGImageRelease(imgRef);
    CGContextRelease(ctxRef);

    CFRelease(imgDestRef);
  end;
end;

function TBitmapCodecQuartz.LoadFromFile(const AFileName: string; const Rotate: single;
  var Bitmap: TBitmap): Boolean;
var
  path: CFStringRef;
  url: CFURLRef;
  imgSourceRef: CGImageSourceRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
  M, M2: TMatrix;
  R: TRectF;
  Pts: array [1..4] of TPointF;
begin
  Result := False;
  path := CFStringCreateWithCString(nil, PAnsiChar(UTF8Encode(AFileName)), kCFStringEncodingUTF8);
  url := CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, False);
  CFRelease (path);
  imgSourceRef := CGImageSourceCreateWithURL(url, nil);
  CFRelease (url);
  if imgSourceRef <> nil then
  begin
    ImgRef := CGImageSourceCreateImageAtIndex(imgSourceRef, 0, nil);
    if ImgRef <> nil then
    begin
      if Rotate <> 0.0 then
      begin
        M := IdentityMatrix;
        M.m31 := -(CGImageGetWidth(ImgRef) / 2);
        M.m32 := -(CGImageGetHeight(ImgRef) / 2);
        M := MatrixMultiply(M, CreateRotationMatrix(DegToRad(-Rotate)));
        { calc new size }
        Pts[1] := PointF(VectorTransform(Vector(0, 0), M));
        Pts[2] := PointF(VectorTransform(Vector(CGImageGetWidth(ImgRef), 0), M));
        Pts[3] := PointF(VectorTransform(Vector(CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef)), M));
        Pts[4] := PointF(VectorTransform(Vector(0, CGImageGetHeight(ImgRef)), M));
        R := NormalizeRectF(Pts);
        { translate }
        M2 := IdentityMatrix;
        M2.m31 := RectWidth(R) / 2;
        M2.m32 := RectHeight(R) / 2;
        M := MatrixMultiply(M, M2);
        { rotate }
        Bitmap.SetSize(Trunc(RectWidth(R)), Trunc(RectHeight(R)));
          ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
             Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
          with M do
            CGContextConcatCTM(CtxRef, CGAffineTransformMake(m11, m12, m21, m22, m31, m32));
          CGContextDrawImage(ctxRef, CGRectFromRect(RectF(0, 0, CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef))), imgRef);
          CGContextRelease(ctxRef);
      end
      else
      begin
        Bitmap.SetSize(CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef));
          ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
           Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
        CGContextDrawImage(ctxRef, CGRectFromRect(RectF(0, 0, Bitmap.Width, Bitmap.Height)), imgRef);
        CGContextRelease(ctxRef);
      end;
      Result := True;
      CGImageRelease(imgRef);
    end;
    CFRelease(imgSourceRef);
  end;
end;

function TBitmapCodecQuartz.LoadThumbnailFromFile(const AFileName: string;
  const AFitWidth, AFitHeight: single; const UseEmbedded: Boolean; var Bitmap: TBitmap): Boolean;
var
  path: CFStringRef;
  url: CFURLRef;
  imgSourceRef: CGImageSourceRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
  dict: CFDictionaryRef;
  keys: array [0..10] of pointer;
  value: array [0..10] of pointer;
  intValue: Cardinal;
  R: TRectF;
  scale: Single;
begin
  Result := False;
  path := CFStringCreateWithCString(nil, PAnsiChar(UTF8Encode(AFileName)), kCFStringEncodingUTF8);
  url := CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, False);
  CFRelease (path);
  imgSourceRef := CGImageSourceCreateWithURL(url, nil);
  CFRelease (url);
  if imgSourceRef <> nil then
  begin
    if UseEmbedded then
    begin
      keys[0] := CFSTR('kCGImageSourceCreateThumbnailFromImageAlways');
      value[0] := kCFBooleanFalse;
      keys[1] := CFSTR('kCGImageSourceCreateThumbnailFromImageIfAbsent');
      value[1] := kCFBooleanFalse;
      keys[2] := CFSTR('kCGImageSourceThumbnailMaxPixelSize');
      if AFitWidth > AFitHeight then
        intValue := trunc(AFitWidth)
      else
        intValue := trunc(AFitHeight);
      value[2] := CFNumberCreate(nil, kCFNumberSInt32Type, @intValue);
      dict := CFDictionaryCreate(nil, @keys[0], @value[0], 3, nil, nil);
      ImgRef := CGImageSourceCreateThumbnailAtIndex(imgSourceRef, 0, dict);
      CFRelease(dict);
    end
    else
      ImgRef := nil;
    if ImgRef <> nil then
    begin
      Bitmap.SetSize(CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef));
        ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
         Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
      CGContextDrawImage(ctxRef, CGRectFromRect(RectF(0, 0, Bitmap.Width, Bitmap.Height)), imgRef);
      CGContextRelease(ctxRef);
      CGImageRelease(imgRef);
      Result := True;
    end
    else
    begin
      // Create thumbnail manually
      ImgRef := CGImageSourceCreateImageAtIndex(imgSourceRef, 0, nil);
      if ImgRef <> nil then
      begin
        R := RectF(0, 0, CGImageGetWidth(ImgRef), CGImageGetHeight(ImgRef));
        scale := FitRect(R, RectF(0, 0, AFitWidth, AFitHeight));
        if scale = 0 then
          scale := 0.001;
        if scale < 1 then
          scale := 1;
        Bitmap.SetSize(Trunc(R.Width), Trunc(R.Height));
        ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
          Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
        CGContextDrawImage(ctxRef, CGRectFromRect(RectF(0, 0, Bitmap.Width, Bitmap.Height)), imgRef);
        CGContextRelease(ctxRef);
      end;
    end;
    CFRelease(imgSourceRef);
  end;
end;

function TBitmapCodecQuartz.SaveToFile(const AFileName: string;
  var Bitmap: TBitmap; const Params: string = ''): Boolean;
var
  path: CFStringRef;
  url: CFURLRef;
  imgDestRef: CGImageDestinationRef;
  imgRef: CGImageRef;
  ctxRef: CGContextRef;
  bits: PAlphaColorArray;
  encoderType: CFStringRef;
  keys: array [0..10] of pointer;
  value: array [0..10] of pointer;
  floatVal: single;
  S, param, name, val: AnsiString;
  dict: CFDictionaryRef;
begin
  path := CFStringCreateWithCString(nil, PAnsiChar(UTF8Encode(AFileName)), kCFStringEncodingUTF8);
  url := CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, False);
  CFRelease (path);
  encoderType := nil;
  if (LowerCase(ExtractFileExt(AFileName)) = '.jpg') or (LowerCase(ExtractFileExt(AFileName)) = '.jpeg') then
    encoderType := kUTTypeJpeg;
  if (LowerCase(ExtractFileExt(AFileName)) = '.jp2') then
    encoderType := kUTTypeJPEG2000;
  if (LowerCase(ExtractFileExt(AFileName)) = '.bmp') then
    encoderType := kUTTypeBmp;
  if (LowerCase(ExtractFileExt(AFileName)) = '.png') then
    encoderType := kUTTypePng;
  if (LowerCase(ExtractFileExt(AFileName)) = '.tif') or (LowerCase(ExtractFileExt(AFileName)) = '.tiff') then
    encoderType := kUTTypeTiff;
  if (LowerCase(ExtractFileExt(AFileName)) = '.gif') then
    encoderType := kUTTypeGif;
  if encoderType <> nil then
  begin
    imgDestRef := CGImageDestinationCreateWithURL(url, encoderType, 1, nil);

    CFRelease (url);
    if imgDestRef <> nil then
    begin
        ctxRef := CGBitmapContextCreate(Bitmap.StartLine, Bitmap.Width, Bitmap.Height, 8,
           Bitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
        imgRef := CGBitmapContextCreateImage(ctxRef);
        if imgRef <> nil then
        begin
          dict := nil;
          { set params }
          if Params <> '' then
          begin
            S := Params;
            while S <> '' do
            begin
              param := GetToken(S, ' ');
              name := GetToken(param, '=');
              val := GetToken(param, '');
              if System.SysUtils.CompareText(name, 'quality') = 0 then
              begin
                floatVal := strToFloat(val) / 100;
                keys[0] := CFSTR('kCGImageDestinationLossyCompressionQuality');
                value[0] := CFNumberCreate(nil, kCFNumberFloat32Type, @floatVal);
                dict := CFDictionaryCreate(nil, @keys[0], @value[0], 1, nil, nil);
                CGImageDestinationSetProperties(imgDestRef, dict);
              end;
            end;
          end;
          CGImageDestinationAddImage(imgDestRef, imgRef, dict);
          CGImageDestinationFinalize(imgDestRef);
          if dict <> nil then
            CFRelease(dict);
        end;
        CGImageRelease(imgRef);
        CGContextRelease(ctxRef);
      CFRelease(imgDestRef);
    end;
  end;
end;

{ TCanvasQuartz }

const
  inputRange: array [1..2] of single = (0, 1);

type

  TRGBFloat = packed record
    r, g, b, a: single;
  end;

function CGColor(const C: TAlphaColor; Opacity: single = 1): TRGBFloat;
var
  cc: TAlphaColor;
begin
  cc := MakeColor(C, Opacity);
  Result.a := TAlphaColorRec(cc).a / $FF;
  Result.r := TAlphaColorRec(cc).r / $FF;
  Result.g := TAlphaColorRec(cc).g / $FF;
  Result.b := TAlphaColorRec(cc).b / $FF;
end;

function CGRectFromRect(const R: TRectF): CGRect;
begin
  Result.origin.x := R.Left;
  Result.origin.Y := R.Top;
  Result.size.Width := R.Right - R.Left;
  Result.size.Height := R.Bottom - R.Top;
end;

procedure CGContextDrawTiledImage(CtxRef: CGContextRef; ARect: TRectF; Img: CGImageRef; Bitmap: TBitmap);
var
  x, y: Integer;
  CR: CGRect;
begin
  if Bitmap.Width * Bitmap.Height = 0 then Exit;
  for x := 0 to Trunc(RectWidth(ARect) / Bitmap.Width)  do
    for y := 0 to Trunc(RectHeight(ARect) / Bitmap.Height) do
    begin
      CR := CGRectFromRect(RectF(ARect.Left + (Bitmap.Width * x), ARect.Top + (Bitmap.Height * y),
        ARect.Left + (Bitmap.Width * (x + 1)), ARect.Top + (Bitmap.Height * (y + 1))));
      CR.origin.y := -ARect.Top - (Bitmap.Height * (y + 1));
      CGContextDrawImage(CtxRef, CR, Img);
    end;
end;

var
  ColorArray: array [0..100] of THandle;
  OffsetArray: array [0..100] of single;

const
  SavedCount = 2000;

constructor TCanvasQuartz.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer);
begin
  inherited ;
  FFontScale := 1.0;
end;

function TCanvasQuartz.CreateSaveState: TCanvasSaveState;
begin
  Result := TQuartzCanvasSaveState.Create;
end;

constructor TCanvasQuartz.CreateFromBitmap(const ABitmap: TBitmap);
begin
  inherited;
  FBitmap := ABitmap;
  FFontScale := 1.0;
end;

constructor TCanvasQuartz.CreateFromPrinter(const APrinter: TAbstractPrinter);
begin
  inherited;
  FFontScale := 1.0;
end;

procedure TCanvasQuartz.FreeBuffer;
begin
end;

procedure TCanvasQuartz.ResizeBuffer(const AWidth, AHeight: Integer);
begin
  if (AWidth = FWidth) and (AHeight = FHeight) then Exit;
  FreeBuffer;
  FWidth := AWidth;
  FHeight := AHeight;
  if FWidth <= 0 then FWidth := 1;
  if FHeight <= 0 then FHeight := 1;
  FResized := True;
end;

procedure TCanvasQuartz.FlushBufferRect(const X, Y: Integer; const Context; const ARect: TRectF);
begin
end;

procedure TCanvasQuartz.Clear(const Color: TAlphaColor);
begin
  if Context = nil then Exit;
    CGContextClearRect(Context, CGRectFromRect(RectF(0, 0, FWidth, FHeight)));
  with CGColor(Color, 1) do
    CGContextSetRGBFillColor(Context, r, g, b, a);
  CGContextFillRect(Context, CGRectFromRect(RectF(0, 0, FWidth, FHeight)));
end;

procedure TCanvasQuartz.ClearRect(const ARect: TRectF; const AColor: TAlphaColor);
begin
  if Context = nil then Exit;
  CGContextClearRect(Context, CGRectFromRect(ARect));
  with CGColor(AColor, 1) do
    CGContextSetRGBFillColor(Context, r, g, b, a);
  CGContextFillRect(Context, CGRectFromRect(ARect));
end;

function TCanvasQuartz.DoBeginScene(const AClipRects: PClipRects = nil): Boolean;
begin
  if FContext = nil then
  begin
    if FParent <> 0 then
      FContext := CGContextRef(Platform.FindForm(FParent).ContextHandle)
    else
    if FBitmap <> nil then
      FContext := CGBitmapContextCreate(FBitmap.Startline, FBitmap.Width, FBitmap.Height, 8,
        FBitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast)
    else
    if FPrinter is TPrinterMac then
      PMSessionGetCGGraphicsContext(TPrinterMac(FPrinter).PrintInfo.PMPrintSession, @FContext);
  end;

  FFontScale := 1;
  if Assigned(FPrinter) and (TPrinterMac(FPrinter).ActivePrinter.ActiveDPIIndex >= 0) then
    FFontScale := TPrinterMac(FPrinter).ActivePrinter.ActiveDPI.X / 96;
  
  Result := inherited DoBeginScene(AClipRects) and (FContext <> nil);
  if Result and (AClipRects <> nil) then
    SetClipRects(AClipRects^);
end;

procedure TCanvasQuartz.DoEndScene;
begin
  inherited DoEndScene;
  if FBitmap <> nil then
    CGContextRelease(Context);
  if (FParent <> 0) or (FBitmap <> nil) or (FPrinter <> nil) then
    FContext := nil;
end;

class function TCanvasQuartz.GetBitmapScanline(Bitmap: TBitmap; y: Integer): PAlphaColorArray;
begin
  if (y >= 0) and (y < Bitmap.Height) and (Bitmap.StartLine <> nil) then
    Result := @PAlphaColorArray(Bitmap.StartLine)[y * Bitmap.Width]
  else
    Result := nil;
end;

function TCanvasQuartz.GetScaleFactor: TPointF;
var
  PrinterMac: TPrinterMac;
begin
  Result := TPointF.Create(1, -1);

  if Assigned(FPrinter) then
  begin
    PrinterMac := TPrinterMac(FPrinter);

    // larger coordinates factor means more coordinates, which in turn means
    // that figures are smaller since we have a bigger canvas
    Result.X := Result.X * 1 / PrinterMac.CoordFactor.X;
    Result.Y := Result.Y * 1 / PrinterMac.CoordFactor.Y;
  end;
end;

function TCanvasQuartz.CalcOrigin: TPointF;
var
  Margins: TRectF;
begin
  if Assigned(FPrinter) then
  begin
    Margins := TPrinterMac(FPrinter).PaperMargins;
    Result.X := Margins.Left;
    Result.Y := FHeight + Margins.Bottom;
  end
  else
  begin
    Result.X := 0;
    Result.Y := FHeight;
  end;
end;

procedure TCanvasQuartz.SetMatrix(const M: TMatrix);
var
  IM: TMatrix;
  CurM: CGAffineTransform;
  Origin: TPointF;
begin
  FMatrix := M;
  { restore CTM }
  if Context = nil then Exit;
  CurM := CGContextGetCTM(Context);
  IM := IdentityMatrix;
  with IM do
  begin
    m11 := CurM.a;
    m12 := CurM.b;
    m21 := CurM.c;
    m22 := CurM.d;
    m31 := CurM.tx;
    m32 := CurM.ty;
  end;
  InvertMatrix(IM);

  if Context = nil then Exit;
  with IM do
    CGContextConcatCTM(Context, CGAffineTransformMake(m11, m12, m21, m22, m31, m32));

  // Quartz inverse
  AdaptCoordinateSystem;
  { Set new }
  with FMatrix do
    CGContextConcatCTM(Context, CGAffineTransformMake(m11, m12, m21, m22, m31, m32));
end;

procedure TCanvasQuartz.MultyMatrix(const M: TMatrix);
var
  IM: TMatrix;
  CurM: CGAffineTransform;
  Origin: TPointF;
begin
  FMatrix := MatrixMultiply(M, FMatrix);
  { restore CTM }
  if Context = nil then Exit;
  CurM := CGContextGetCTM(Context);
  IM := IdentityMatrix;
  with IM do
  begin
    m11 := CurM.a;
    m12 := CurM.b;
    m21 := CurM.c;
    m22 := CurM.d;
    m31 := CurM.tx;
    m32 := CurM.ty;
  end;
  InvertMatrix(IM);

  if Context = nil then Exit;
  with IM do
    CGContextConcatCTM(Context, CGAffineTransformMake(m11, m12, m21, m22, m31, m32));

  AdaptCoordinateSystem;
  { Set new }
  with FMatrix do
    CGContextConcatCTM(Context, CGAffineTransformMake(m11, m12, m21, m22, m31, m32));
end;

procedure TCanvasQuartz.SetClipRects(const ARects: array of TRectF);
var
  i: Integer;
  Rcts: array of CGRect;
begin
  if Context = nil then Exit;

  SetLength(Rcts, Length(ARects));
  for i := 0 to High(ARects) do
  begin
    Rcts[i] := CGRectFromRect(ARects[i]);
  end;
  CGContextClipToRects(Context, @Rcts[0], Length(Rcts));
end;

procedure TCanvasQuartz.IntersectClipRect(const ARect: TRectF);
begin
  if Context = nil then Exit;
  CGContextClipToRect(Context, CGRectFromRect(ARect));
end;

procedure TCanvasQuartz.ExcludeClipRect(const ARect: TRectF);
var
  R: TRectF;
  RR: array [0..3] of CGRect;
begin
  if Context = nil then Exit;
  R := ARect;
  RR[0] := CGRectFromRect(RectF(-FWidth, -FWidth, R.left, FHeight));
  RR[1] := CGRectFromRect(RectF(R.Right, -FHeight, FWidth, FHeight));
  RR[2] := CGRectFromRect(RectF(R.left, -FHeight, R.Right, R.top));
  RR[3] := CGRectFromRect(RectF(R.left, R.bottom, R.Right, FHeight));
  CGContextClipToRects(Context, @RR[0], 4);
end;

var
  ShadeOpacity: single;

procedure myLinearShadingValues(info: Pointer; inp: {const} PSingle {Float32Ptr}; val: PSingle {Float32Ptr}); cdecl;
var
  c: TAlphaColor;
begin
  if info <> nil then
  begin
    c := MakeColor(TGradient(info).InterpolateColor(inp^), ShadeOpacity);
    val^ := TAlphaColorRec(c).R / $FF;
    Inc(val);
    val^ := TAlphaColorRec(c).G / $FF;
    Inc(val);
    val^ := TAlphaColorRec(c).B / $FF;
    Inc(val);
    val^ := TAlphaColorRec(c).A / $FF;
    Inc(val);
  end;
end;

function TCanvasQuartz.Context: CGContextRef;
begin
  Result := FContext;
end;

procedure TCanvasQuartz.AdaptCoordinateSystem;
var
  PrinterMac: TPrinterMac;
  Origin: TPointF;
begin
  // calculate the scaling factor for the printer canvas
  if Assigned(FPrinter) then
  begin
    PrinterMac := TPrinterMac(FPrinter);
    ResizeBuffer(PrinterMac.PageWidth , PrinterMac.PageHeight);
  end;

  Origin := CalcOrigin;
  CGContextTranslateCTM(Context, Origin.X, Origin.Y);
  CGContextScaleCTM(Context, ScaleFactor.X, ScaleFactor.Y);
end;

procedure TCanvasQuartz.ApplyFill(ARect: TRectF; const AOpacity: single);
begin
  if Context = nil then Exit;

  if (FFill.Kind = TBrushKind.bkResource) and (FFill.Resource <> nil) and (FFill.Resource.Brush <> nil) then
    FFill.Assign(FFill.Resource.Brush);

  with FFill do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          with CGColor(Color, AOpacity) do
            CGContextSetRGBFillColor(Context, r, g, b, a);
        end;
      TBrushKind.bkGradient:
        begin
          FCallback.version := 0;
          FCallback.evaluate := @myLinearShadingValues;
          FCallback.releaseInfo:= nil;
          ShadeOpacity := AOpacity;
          FFunc := CGFunctionCreate(FFill.Gradient, 1, @inputRange, 4, nil, @FCallback);
          FShading := CGShadingCreateAxial(ColorSpace,
            CGPoint(PointF(ARect.Left + Gradient.StartPosition.X * ARect.Width, ARect.Top + Gradient.StartPosition.Y * ARect.Height)),
            CGPoint(PointF(ARect.Left + Gradient.StopPosition.X * ARect.Width, ARect.Top + Gradient.StopPosition.Y * ARect.Height)),
            FFunc,
            1, 1);
        end;
      TBrushKind.bkResource:
        begin
        end;
      TBrushKind.bkGrab:
        begin
        end;
      TBrushKind.bkBitmap:
        begin
          if (Bitmap.Bitmap <> nil) and (Bitmap.Bitmap.Width > 0) and (Bitmap.Bitmap.Height > 0) then
          begin
            UpdateBitmapHandle(Bitmap.Bitmap);
            if (Bitmap.Bitmap.Handles[Self] <> nil) then
            begin
              CGContextSetAlpha(Context, AOpacity);
              FBitmapRef := CGBitmapContextCreateImage(CGContextRef(Bitmap.Bitmap.Handles[Self]));
            end;
          end;
        end;
    else
      CGContextSetRGBFillColor(Context, 0, 0, 0, 0);
    end;
  end;
end;

procedure TCanvasQuartz.DeApplyFill(ARect: TRectF; const AOpacity: single);
begin
  if Context = nil then Exit;

  with FFill do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
        end;
      TBrushKind.bkGradient:
        begin
          CGShadingRelease(FShading);
          CGFunctionRelease(FFunc);
        end;
      TBrushKind.bkResource:
        begin
        end;
      TBrushKind.bkGrab:
        begin
        end;
      TBrushKind.bkBitmap:
        begin
          CGContextSetAlpha(Context, 1);
          CFRelease(FBitmapRef);
        end;
    end;
  end;
  FShading := nil;
  FBitmapRef := nil;
end;

procedure TCanvasQuartz.ApplyStroke(ARect: TRectF; const AOpacity: single);
var
  i: Integer;
  dash: array of single;
begin
  if Context = nil then Exit;

  if (FStroke.Kind = TBrushKind.bkResource) and (FStroke.Resource <> nil) and (FStroke.Resource.Brush <> nil) then
    FStroke.Assign(FStroke.Resource.Brush);

  with FStroke do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          with CGColor(Color, AOpacity) do
            CGContextSetRGBStrokeColor(Context, r, g, b, a);
        end;
      TBrushKind.bkGradient:
        begin
        end;
      TBrushKind.bkBitmap:
        begin
{          if (Bitmap.Bitmap <> nil) and (Bitmap.Bitmap.Width > 0) and (Bitmap.Bitmap.Height > 0) then
          begin
            UpdateBitmap(Bitmap.Bitmap);
            if (Bitmap.Bitmap.Handle <> 0) then
            begin
              if Bitmap.WrapMode <> wmTileStretch then
                FGPPenBrush := TGPTextureBrush.Create(TGPBitmap(Bitmap.Bitmap.Handle), TWrapMode(Bitmap.WrapMode))
              else
              begin
                FGPPenBrush := TGPTextureBrush.Create(TGPBitmap(Bitmap.Bitmap.Handle), WrapModeClamp);
                TGPTextureBrush(FGPPenBrush).ScaleTransform(RectWidth(ARect) / Bitmap.Bitmap.Width, RectHeight(ARect) / Bitmap.Bitmap.Height);
              end;
            end
            else
              FGPPenBrush := TGPSolidBrush.Create($00000000);
          end
          else
            FGPPenBrush := TGPSolidBrush.Create($00000000);}
        end;
    else
      CGContextSetRGBStrokeColor(Context, 0, 0, 0, 0);
    end;
  end;
  case StrokeCap of
    TStrokeCap.scFlat: CGContextSetLineCap(Context, kCGLineCapButt);
    TStrokeCap.scRound: CGContextSetLineCap(Context, kCGLineCapRound);
  end;
  if Length(FDash) > 0 then
  begin
    SetLength(dash, Length(FDash));
    for i := 0 to High(FDash) do
    begin
      dash[i] := FDash[i] * StrokeThickness;
      if (StrokeCap = TStrokeCap.scRound) then
      begin
        if odd(i) then
          dash[i] := (FDash[i] + 1) * StrokeThickness
        else
          dash[i] := (FDash[i] - 1) * StrokeThickness;
      end;
    end;
    CGContextSetLineDash(Context, FDashOffset, @dash[0], Length(FDash));
  end
  else
    CGContextSetLineDash(Context, 0, nil, 0);
  case StrokeJoin of
    TStrokeJoin.sjMiter: CGContextSetLineJoin(Context, kCGLineJoinMiter);
    TStrokeJoin.sjRound: CGContextSetLineJoin(Context, kCGLineJoinRound);
    TStrokeJoin.sjBevel: CGContextSetLineJoin(Context, kCGLineJoinBevel);
  end;
  CGContextSetLineWidth(Context, StrokeThickness);
end;

procedure TCanvasQuartz.FontChanged(Sender: TObject);
begin
end;

procedure TCanvasQuartz.DrawLine(const APt1, APt2: TPointF; const AOpacity: single);
begin
  if Context = nil then Exit;
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(RectF(APt1.X, APt1.Y, APt2.X, APt2.Y), AOpacity);
    CGContextBeginPath(Context);
    CGContextMoveToPoint(Context, APt1.X, APt1.Y);
    CGContextAddLineToPoint(Context, APt2.X, APt2.Y);
    CGContextClosePath(Context);
    CGContextStrokePath(Context);
  end;
end;

procedure TCanvasQuartz.DrawRect(const ARect: TRectF;
  const XRadius, YRadius: single; const ACorners: TCorners; const AOpacity: single;
  const ACornerType: TCornerType = TCornerType.ctRound);
var
  x1, x2, y1, y2: single;
  R: TRectF;
begin
  if Context = nil then Exit;
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(ARect, AOpacity);
    if (XRadius < Epsilon) and (YRadius < Epsilon) then
    begin
      CGContextStrokeRect(Context, CGRectFromRect(ARect));
    end
    else
    begin
      R := ARect;
      x1 := XRadius;
      if RectWidth(R) - (x1 * 2) < 0 then
        x1 := RectWidth(R) / 2;
      x2 := XRadius * CurveKappaInv;
      y1 := YRadius;
      if RectHeight(R) - (y1 * 2) < 0 then
        y1 := RectHeight(R) / 2;
      y2 := YRadius * CurveKappaInv;
      CGContextBeginPath(Context);
      CGContextMoveToPoint(Context, R.Left, R.Top + y1);
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Left + x2, R.Top + y1);
              CGContextAddLineToPoint(Context, R.Left + x1, R.Top + y2);
              CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Left, R.Top + (y2), R.Left + x2, R.Top, R.Left + x1, R.Top)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Left, R.Top);
        CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
      end;
      CGContextAddLineToPoint(Context, R.Right - x1, R.Top);
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Right - x1, R.Top + y2);
              CGContextAddLineToPoint(Context, R.Right - x2, R.Top + y1);
              CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Right - x2, R.Top, R.Right, R.Top + (y2), R.Right, R.Top + y1)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Right, R.Top);
        CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
      end;
      CGContextAddLineToPoint(Context, R.Right, R.Bottom - y1);
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Right - x2, R.Bottom - y1, R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Right - x2, R.Bottom - y1);
              CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom - y2);
              CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Right, R.Bottom - (y2), R.Right - x2, R.Bottom, R.Right - x1, R.Bottom)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Right, R.Bottom);
        CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
      end;
      CGContextAddLineToPoint(Context, R.Left + x1, R.Bottom);
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Left + x1, R.Bottom - y2, R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Left + x1, R.Bottom - y2);
              CGContextAddLineToPoint(Context, R.Left + x2, R.Bottom - y1);
              CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Left + x2, R.Bottom, R.Left, R.Bottom - (y2), R.Left, R.Bottom - y1)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Left, R.Bottom);
        CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
      end;
      CGContextClosePath(Context);
      CGContextStrokePath(Context);
    end;
  end;
end;

procedure TCanvasQuartz.FillRect(const ARect: TRectF; const XRadius, YRadius: single; const ACorners: TCorners; const AOpacity: single;
  const ACornerType: TCornerType = TCornerType.ctRound);
var
  x1, x2, y1, y2: single;
  R: TRectF;
begin
  if Context = nil then Exit;
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    CGContextSaveGState(Context);
    ApplyFill(ARect, AOpacity);

    CGContextBeginPath(Context);
    if (XRadius < Epsilon) and (YRadius < Epsilon) then
    begin
      CGContextAddRect(Context, CGRectFromRect(ARect));
    end
    else
    begin
      R := ARect;
      x1 := XRadius;
      if RectWidth(R) - (x1 * 2) < 0 then
        x1 := RectWidth(R) / 2;
      x2 := XRadius * CurveKappaInv;
      y1 := YRadius;
      if RectHeight(R) - (y1 * 2) < 0 then
        y1 := RectHeight(R) / 2;
      y2 := YRadius * CurveKappaInv;
      CGContextMoveToPoint(Context, R.Left, R.Top + y1);
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Left + x2, R.Top + y1);
              CGContextAddLineToPoint(Context, R.Left + x1, R.Top + y2);
              CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Left, R.Top + (y2), R.Left + x2, R.Top, R.Left + x1, R.Top)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Left, R.Top);
        CGContextAddLineToPoint(Context, R.Left + x1, R.Top);
      end;
      CGContextAddLineToPoint(Context, R.Right - x1, R.Top);
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Right - x1, R.Top + y2);
              CGContextAddLineToPoint(Context, R.Right - x2, R.Top + y1);
              CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Right - x2, R.Top, R.Right, R.Top + (y2), R.Right, R.Top + y1)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Right, R.Top);
        CGContextAddLineToPoint(Context, R.Right, R.Top + y1);
      end;
      CGContextAddLineToPoint(Context, R.Right, R.Bottom - y1);
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Right - x2, R.Bottom - y1, R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Right - x2, R.Bottom - y1);
              CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom - y2);
              CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Right, R.Bottom - (y2), R.Right - x2, R.Bottom, R.Right - x1, R.Bottom)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Right, R.Bottom);
        CGContextAddLineToPoint(Context, R.Right - x1, R.Bottom);
      end;
      CGContextAddLineToPoint(Context, R.Left + x1, R.Bottom);
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel: CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
          TCornerType.ctInnerRound: CGContextAddCurveToPoint(Context, R.Left + x1, R.Bottom - y2, R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
          TCornerType.ctInnerLine:
            begin
              CGContextAddLineToPoint(Context, R.Left + x1, R.Bottom - y2);
              CGContextAddLineToPoint(Context, R.Left + x2, R.Bottom - y1);
              CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
            end;
        else
          CGContextAddCurveToPoint(Context, R.Left + x2, R.Bottom, R.Left, R.Bottom - (y2), R.Left, R.Bottom - y1)
        end;
      end
      else
      begin
        CGContextAddLineToPoint(Context, R.Left, R.Bottom);
        CGContextAddLineToPoint(Context, R.Left, R.Bottom - y1);
      end;
    end;
    CGContextClosePath(Context);

    if (FBitmapRef <> nil) and (FFill.Bitmap.Bitmap.Handles[Self] <> nil) then
    begin
      CGContextClip(Context);
      case FFill.Bitmap.WrapMode of
        TWrapMode.wmTile:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawTiledImage(Context, ARect, FBitmapRef, FFill.Bitmap.Bitmap);
          end;
        TWrapMode.wmTileOriginal:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(ARect.Left, ARect.Top, ARect.Left + FFill.Bitmap.Bitmap.Width, -ARect.Top - FFill.Bitmap.Bitmap.Height)), FBitmapRef);
          end;
        TWrapMode.wmTileStretch:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(ARect.Left, ARect.Top, ARect.Right, -ARect.Bottom)), FBitmapRef);
          end;
      end;
    end
    else
    if FShading <> nil then
    begin
      CGContextClip(Context);
      CGContextDrawShading(Context, FShading)
    end
    else
      CGContextFillPath(Context);

    DeApplyFill(ARect, AOpacity);
    CGContextRestoreGState(Context);
  end;
end;

procedure TCanvasQuartz.DrawEllipse(const ARect: TRectF; const AOpacity: single);
begin
  if Context = nil then Exit;
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(ARect, AOpacity);
    CGContextStrokeEllipseInRect(Context, CGRectFromRect(ARect));
  end;
end;

procedure TCanvasQuartz.FillEllipse(const ARect: TRectF; const AOpacity: single);
begin
  if Context = nil then Exit;
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    CGContextSaveGState(Context);
    ApplyFill(ARect, AOpacity);

    CGContextBeginPath(Context);
    CGContextAddEllipseInRect(Context, CGRectFromRect(ARect));
    CGContextClosePath(Context);

    if (FBitmapRef <> nil) and (FFill.Bitmap.Bitmap.Handles[Self] <> nil) then
    begin
      CGContextClip(Context);
      case FFill.Bitmap.WrapMode of
        TWrapMode.wmTile:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawTiledImage(Context, ARect, FBitmapRef, FFill.Bitmap.Bitmap);
          end;
        TWrapMode.wmTileOriginal:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(ARect.Left, ARect.Top, ARect.Left + FFill.Bitmap.Bitmap.Width, -ARect.Top - FFill.Bitmap.Bitmap.Height)), FBitmapRef);
          end;
        TWrapMode.wmTileStretch:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(ARect.Left, ARect.Top, ARect.Right, -ARect.Bottom)), FBitmapRef);
          end;
      end;
    end
    else
    if FShading <> nil then
    begin
      CGContextClip(Context);
      CGContextDrawShading(Context, FShading)
    end
    else
      CGContextFillPath(Context);

    DeApplyFill(ARect, AOpacity);
    CGContextRestoreGState(Context);
  end;
end;

{ Bitmaps }

procedure TCanvasQuartz.DrawBitmap(const ABitmap: TBitmap;
  const SrcRect, DsTRectF: TRectF; const AOpacity: single; const HighSpeed: Boolean = False);
var
  R, SubR: CGRect;
  ImgRef, SubImgRef: CGImageRef;
begin
  if Context = nil then Exit;
  if ABitmap = nil then Exit;

  UpdateBitmapHandle(ABitmap);
  if (ABitmap.Handles[Self] <> nil) then
  begin
    R := CGRectFromRect(DsTRectF);
    if (SrcRect.Left = 0) and (SrcRect.Top = 0) and (SrcRect.Right = ABitmap.Width) and (SrcRect.Bottom = ABitmap.Height) then
    begin
      ImgRef := CGBitmapContextCreateImage(CGContextRef(ABitmap.Handles[Self]));
      if ImgRef <> nil then
      begin
        CGContextSaveGState(Context);
        CGContextSetAlpha(Context, AOpacity);

        if HighSpeed then
          CGContextSetInterpolationQuality(Context, kCGInterpolationNone)
        else
          CGContextSetInterpolationQuality(Context, kCGInterpolationDefault);

        // flip
        R.origin.y := -DsTRectF.Bottom;
        CGContextScaleCTM(Context, 1, -1);
        //

        CGContextDrawImage(Context, R, ImgRef);

        CGContextRestoreGState(Context);

        CGImageRelease(ImgRef);
      end;
    end
    else
    begin
      SubR := CGRectFromRect(SrcRect);

      ImgRef := CGBitmapContextCreateImage(CGContextRef(ABitmap.Handles[Self]));
      if ImgRef <> nil then
      begin
        SubImgRef := CGImageCreateWithImageInRect(ImgRef, SubR);
        if SubImgRef <> nil then
        begin
          CGContextSaveGState(Context);
          CGContextSetAlpha(Context, AOpacity);
          if HighSpeed then
            CGContextSetInterpolationQuality(Context, kCGInterpolationNone)
          else
            CGContextSetInterpolationQuality(Context, kCGInterpolationDefault);

          // flip
          R.origin.y := -DsTRectF.Bottom;
          CGContextScaleCTM(Context, 1, -1);
          //
          CGContextDrawImage(Context, R, SubImgRef);
          CGImageRelease(SubImgRef);
          CGContextRestoreGState(Context);
        end;
        CGImageRelease(ImgRef);
      end;
    end;
  end;
end;

procedure TCanvasQuartz.UpdateBitmapHandle(ABitmap: TBitmap);
begin
  { update bitmap to Quartz bitmap }
  if ABitmap = nil then Exit;
  { create - if need }
  if ABitmap.Handles[Self] = nil then
  begin
    ABitmap.HandleAdd(Self);
    ABitmap.Handles[Self] := CGBitmapContextCreate(ABitmap.StartLine, ABitmap.Width, ABitmap.Height, 8,
      ABitmap.Width * 4, ColorSpace, kCGImageAlphaPremultipliedLast);
    ABitmap.HandlesNeedUpdate[Self] := False;
    ABitmap.AddFreeNotify(Self);
    FBitmaps.Add(ABitmap);
  end;
end;

procedure TCanvasQuartz.DestroyBitmapHandle(ABitmap: TBitmap);
begin
  if (ABitmap <> nil) then
  begin
    FBitmaps.Remove(ABitmap);
    ABitmap.RemoveFreeNotify(Self);
    CGContextRelease(CGContextRef(ABitmap.Handles[Self]));
    ABitmap.HandleRemove(Self);
  end;
end;

{ Path }

procedure TCanvasQuartz.DrawPath(const APath: TPathData; const AOpacity: single);
var
  i: Integer;
  CP1, CP2: TPointF;
begin
  if Context = nil then Exit;
  if FStroke.Kind = TBrushKind.bkNone then Exit;
  if APath.IsEmpty then Exit;
  ApplyStroke(APath.GetBounds, AOpacity);
  { draw }
  CGContextSaveGState(Context);
  CGContextBeginPath(Context);
  i := 0;
  while i < APath.Count do
  begin
    case APath[i].Kind of
      TPathPointKind.ppMoveTo:
        begin
          CGContextMoveToPoint(Context, APath[i].Point.X, APath[i].Point.Y);
        end;
      TPathPointKind.ppLineTo:
        begin
          CGContextAddLineToPoint(Context, APath[i].Point.X, APath[i].Point.Y);
        end;
      TPathPointKind.ppCurveTo:
        begin
          CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CGContextAddCurveToPoint(Context, CP1.X,
            CP1.Y,
            CP2.X,
            CP2.Y,
            APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppClose:
        begin
          CGContextClosePath(Context);
        end;
    end;
    inc(i);
  end;
  CGContextStrokePath(Context);
  CGContextRestoreGState(Context);
end;

procedure TCanvasQuartz.FillPath(const APath: TPathData; const AOpacity: single);
var
  i: Integer;
  B: TRectF;
  CP1, CP2: TPointF;
begin
  if Context = nil then Exit;
  if FFill.Kind = TBrushKind.bkNone then Exit;
  if APath.IsEmpty then Exit;

  B := APath.GetBounds;
  ApplyFill(B, AOpacity);
  CGContextSaveGState(Context);
  i := 0;
  while i < APath.Count do
  begin
    case APath[i].Kind of
      TPathPointKind.ppMoveTo:
        begin
          CGContextMoveToPoint(Context, APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppLineTo:
        begin
          CGContextAddLineToPoint(Context, APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppCurveTo:
        begin
          CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CGContextAddCurveToPoint(Context, CP1.X,
            CP1.Y,
            CP2.X,
            CP2.Y,
            APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppClose:
        begin
          CGContextClosePath(Context);
        end;
    end;
    inc(i);
  end;

  if (FBitmapRef <> nil) and (FFill.Bitmap.Bitmap.Handles[Self] <> nil) then
  begin
    CGContextClip(Context);
    case FFill.Bitmap.WrapMode of
        TWrapMode.wmTile:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawTiledImage(Context, B, FBitmapRef, FFill.Bitmap.Bitmap);
          end;
        TWrapMode.wmTileOriginal:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(B.Left, B.Top, B.Left + FFill.Bitmap.Bitmap.Width, -B.Top - FFill.Bitmap.Bitmap.Height)), FBitmapRef);
          end;
        TWrapMode.wmTileStretch:
          begin
            CGContextScaleCTM(Context, 1, -1);
            CGContextDrawImage(Context, CGRectFromRect(RectF(B.Left, B.Top, B.Right, -B.Bottom)), FBitmapRef);
          end;
    end;
  end
  else
  if FShading <> nil then
  begin
    CGContextClip(Context);
    CGContextDrawShading(Context, FShading)
  end
  else
    CGContextFillPath(Context);

  DeApplyFill(B, AOpacity);
  CGContextRestoreGState(Context);
end;

function TCanvasQuartz.PtInPath(const APoint: TPointF; const APath: TPathData): Boolean;
var
  i: Integer;
  B: TRectF;
  CP1, CP2: TPointF;
begin
  Result := False;
  if Context = nil then Exit;
  if APath.IsEmpty then Exit;
  { draw }
  B := APath.GetBounds;
  CGContextSaveGState(Context);
  CGContextTranslateCTM(Context, B.Left, B.Top);
  CGContextBeginPath(Context);
  i := 0;
  while i < APath.Count do
  begin
    case APath[i].Kind of
      TPathPointKind.ppMoveTo:
        begin
          CGContextMoveToPoint(Context, APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppLineTo:
        begin
          CGContextAddLineToPoint(Context, APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppCurveTo:
        begin
          CP1 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CP2 := PointF(APath[i].Point.X, APath[i].Point.Y);
          Inc(i);
          CGContextAddCurveToPoint(Context, CP1.X,
            CP1.Y,
            CP2.X,
            CP2.Y,
            APath[i].Point.X,
            APath[i].Point.Y);
        end;
      TPathPointKind.ppClose:
        begin
          CGContextClosePath(Context);
        end;
    end;
    inc(i);
  end;
  CGContextRestoreGState(Context);
  Result := CGContextPathContainsPoint(Context, CGPoint(APoint), kCGPathFillStroke) > 0;
end;

function measureFrame(frame: CTFrameRef): TPointF;
var
  framePath: CGPathRef;
  frameRect: CGRect;
  lines: CFArrayRef;
  numLines: CFIndex;
  maxWidth: CGFloat;
  textHeight: CGFloat;
  lastLineIndex: CFIndex;
  index: CFIndex;
  ascent, descent, leading, width: CGFloat;
  line: CTLineRef;
  lastLineOrigin: CGPoint;
begin
  framePath := CTFrameGetPath(frame);
  frameRect := CGPathGetBoundingBox(framePath);
  lines := CTFrameGetLines(frame);
  numLines := CFArrayGetCount(lines);
  maxWidth := 0;
  textHeight := 0;
  lastLineIndex := numLines - 1;

  for index := 0 to numLines - 1 do
  begin
    line := CTLineRef(CFArrayGetValueAtIndex(lines, index));
    width := CTLineGetTypographicBounds(line, @ascent,  @descent, @leading);
    if (width > maxWidth) then
      maxWidth := width;
    if (index = lastLineIndex) then
    begin
      CTFrameGetLineOrigins(frame, CFRangeMake(lastLineIndex, 1), @lastLineOrigin);
      textHeight := CGRectGetMaxY(frameRect) - lastLineOrigin.y + descent;
    end;
  end;
  Result := PointF(maxWidth, textHeight);
end;

procedure TCanvasQuartz.FillText(const ARect: TRectF; const AText: string;
      const WordWrap: Boolean; const AOpacity: Single;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  path: CGMutablePathRef;
  bounds: CGRect;
  str: CFStringRef;
  attr: CFMutableAttributedStringRef;
  framesetter: CTFramesetterRef;
  frame: CTFrameRef;
  fontref, newFontRef: CTFontRef;
  alignment: byte;
  wrapping: byte;
  direction: shortint;
  settings: array of CTParagraphStyleSetting;
  paragraphStyle: CTParagraphStyleRef;
  textSize: TPointF;
  textColor: CGColorRef;
  rgba: array [0..3] of single;
  yoffset: single;
  underline: CFNumberRef;
  int: Cardinal;

  leftLines: CFArrayRef;
  origins: array of CGPoint;
  lineIndex: NSInteger;
  i, j: Integer;
  runs: CFArrayRef;
  lineBounds: CGRect;
  oneLine: CTLineRef;
  offset: CGFloat;
  oneRun: CTRunRef;
  ascent: CGFloat;
  descent: CGFloat;
  rwidth: CGFloat;
  y: CGFloat;
begin
  if Context = nil then Exit;
  if FFill.Kind = TBrushKind.bkNone then Exit;
  if Length(AText) = 0 then Exit;

  CGContextSaveGState(Context);

  CGContextClipToRect(Context, CGRectFromRect(ARect));

  CGContextSetTextMatrix(Context, CGAffineTransformMakeScale(1.0, 1.0));

  CGContextTranslateCTM(Context, 0, ARect.Bottom);
  CGContextScaleCTM(Context, 1, -1);

  path := CGPathCreateMutable();
  bounds := CGRectFromRect(ARect);
  bounds.size.height := $FFFF;
  yoffset := bounds.size.height - RectHeight(ARect);
  CGContextTranslateCTM(context, 0, -yoffset);
  if not WordWrap then
    bounds.size.width := $FFFF;
  CGPathAddRect(path, nil, bounds);

  str := CFStringCreateWithCharacters(kCFAllocatorDefault, PChar(AText), Length(AText));
  attr := CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
  CFAttributedStringReplaceString(attr, CFRangeMake(0, 0), str);

  CFAttributedStringBeginEditing(attr);
  try
    fontref := CTFontCreateWithName(CFSTR(Font.Family), Font.Size * FFontScale, nil);
    if (TFontStyle.fsBold in Font.Style) then
    begin
      newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontBoldTrait, kCTFontBoldTrait);
      if newFontRef <> nil then
      begin
        CFRelease(fontref);
        fontref := newFontRef;
      end;
    end;
    if (TFontStyle.fsItalic in Font.Style) then
    begin
      newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontItalicTrait, kCTFontItalicTrait);
      if newFontRef <> nil then
      begin
        CFRelease(fontref);
        fontref := newFontRef;
      end;
    end;

    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTFontAttributeName, fontref);
    if TFontStyle.fsUnderline in Font.Style then
    begin
      int := kCTUnderlineStyleSingle;
      underline := CFNumberCreate(nil, kCFNumberSInt32Type, @int);
      CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTUnderlineStyleAttributeName, underline);
    end;

    with TAlphaColorRec(MakeColor(Fill.Color, AOpacity)) do
    begin
      rgba[0] := R / $FF;
      rgba[1] := G / $FF;
      rgba[2] := B / $FF;
      rgba[3] := A / $FF;
    end;
    textColor := CGColorCreate(ColorSpace, @rgba[0]);
    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTForegroundColorAttributeName, textColor);
    CFRelease(textColor);

    SetLength(settings, Length(settings) + 1);
    case ATextAlign of
      TTextAlign.taCenter: alignment := kCTCenterTextAlignment;
      TTextAlign.taLeading: alignment := kCTLeftTextAlignment;
      TTextAlign.taTrailing: alignment := kCTRightTextAlignment;
    end;
    settings[High(settings)].spec := kCTParagraphStyleSpecifierAlignment;
    settings[High(settings)].valueSize := sizeof(alignment);
    settings[High(settings)].value := @alignment;

    SetLength(settings, Length(settings) + 1);
    if WordWrap then
      wrapping := kCTLineBreakByWordWrapping
    else
      wrapping := kCTLineBreakByClipping;
    settings[High(settings)].spec := kCTParagraphStyleSpecifierLineBreakMode;
    settings[High(settings)].valueSize := SizeOf(wrapping);
    settings[High(settings)].value := @wrapping;

    if TFillTextFlag.ftRightToLeft in Flags then
    begin
      SetLength(settings, Length(settings) + 1);
      direction := kCTWritingDirectionRightToLeft;
      settings[High(settings)].spec := kCTParagraphStyleSpecifierBaseWritingDirection;
      settings[High(settings)].valueSize := SizeOf(direction);
      settings[High(settings)].value := @direction;
    end;

    paragraphStyle := CTParagraphStyleCreate(@settings[0], length(settings));

    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTParagraphStyleAttributeName, paragraphStyle);
  finally
    CFAttributedStringEndEditing(attr);
  end;

  framesetter := CTFramesetterCreateWithAttributedString(CFAttributedStringRef(attr));
  CFRelease(attr);

  frame := CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil);
  CFRelease(framesetter);

  textSize := measureFrame(frame);
  case AVTextAlign of
    TTextAlign.taCenter:
      CGContextTranslateCTM(Context, 0, -(ARect.Bottom - textSize.y) / 2);
    TTextAlign.taTrailing:
      CGContextTranslateCTM(Context, 0, -(ARect.Bottom - textSize.y));
    TTextAlign.taLeading: ;
  end;

  if not WordWrap then
  begin
    case ATextAlign of
      TTextAlign.taCenter:
        CGContextTranslateCTM(Context, -($FFFF / 2) + (RectWidth(ARect) / 2), 0);
      TTextAlign.taLeading: ;
      TTextAlign.taTrailing:
        CGContextTranslateCTM(Context, -$FFFF + RectWidth(ARect), 0);
    end;
  end;

  CGContextTranslateCTM(Context, 0, -ARect.Top);
  CTFrameDraw(frame, Context);

  { strikeout }
  if TFontStyle.fsStrikeOut in Font.Style then
  begin
    CGContextSetTextPosition(Context, 0, 0);
    leftLines := CTFrameGetLines(frame);
    SetLength(origins, CFArrayGetCount(leftLines));
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), @origins[0]);
    lineIndex := 0;
    for i := 0 to High(origins) do
    begin
      oneLine := CFArrayGetValueAtIndex(leftLines, i);
      runs := CTLineGetGlyphRuns(oneLine);
      lineBounds := CTLineGetImageBounds(oneLine, Context);
      lineBounds.origin.x := lineBounds.origin.x + origins[lineIndex].x;
      lineBounds.origin.y := lineBounds.origin.y + origins[lineIndex].y;
      lineIndex := lineIndex + 1;
      offset := 0;
      for j := 0 to CFArrayGetCount(runs) - 1 do
      begin
        oneRun := CFArrayGetValueAtIndex(runs, j);
        ascent := 0;
        descent := 0;
        rwidth := CTRunGetTypographicBounds(oneRun, CFRangeMake(0, 0), @ascent, @descent, nil);
        bounds := CGRectFromRect(RectF(lineBounds.origin.x + offset, lineBounds.origin.y, lineBounds.origin.x + offset + rwidth,
          lineBounds.origin.y + Font.Size - descent));
        if (bounds.origin.x + bounds.size.width > CGRectGetMaxX(lineBounds)) then
          bounds.size.width := CGRectGetMaxX(lineBounds) - bounds.origin.x;
        with CGColor(Fill.Color, AOpacity) do
          CGContextSetRGBStrokeColor(Context, r, g, b, a);
        y := round(bounds.origin.y + bounds.size.height / 2.0);
        CGContextMoveToPoint(Context, bounds.origin.x, y);
        CGContextAddLineToPoint(Context, bounds.origin.x + bounds.size.width, y);
        CGContextStrokePath(Context);
        offset := offset + width;
      end;
    end;
  end;
  { }
  CFRelease(frame);
  CFRelease(fontref);
  CFRelease(paragraphStyle);
  CFRelease(path);

  CGContextRestoreGState(Context);
end;

procedure TCanvasQuartz.MeasureText(var ARect: TRectF;
      const AText: string; const WordWrap: Boolean;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  path: CGMutablePathRef;
  bounds: CGRect;
  str: CFStringRef;
  attr: CFMutableAttributedStringRef;
  framesetter: CTFramesetterRef;
  frame: CTFrameRef;
  fontref, newFontRef: CTFontRef;
  alignment: byte;
  wrapping: byte;
  direction: shortint;
  settings: array of CTParagraphStyleSetting;
  paragraphStyle: CTParagraphStyleRef;
  textSize: TPointF;
  textR: TRectF;
  yoffset: single;
  underline: CFNumberRef;
  int: Cardinal;
begin
  if (Length(AText) = 0) then
  begin
    ARect.Right := ARect.Left;
    Exit;
  end;

  path := CGPathCreateMutable();
  bounds := CGRectFromRect(ARect);
  bounds.size.height := $FFFF;
  yoffset := bounds.size.height - RectHeight(ARect);
  if not WordWrap then
    bounds.size.width := $FFFF;
  CGPathAddRect(path, nil, bounds);

  str := CFStringCreateWithCharacters(kCFAllocatorDefault, PChar(AText), Length(AText));
  attr := CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
  CFAttributedStringReplaceString(attr, CFRangeMake(0, 0), str);

  CFAttributedStringBeginEditing(attr);
  try
    fontref := CTFontCreateWithName(CFSTR(Font.Family), Font.Size * FFontScale, nil);
    if (TFontStyle.fsBold in Font.Style) then
    begin
      newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontBoldTrait, kCTFontBoldTrait);
      if newFontRef <> nil then
      begin
        CFRelease(fontref);
        fontref := newFontRef;
      end;
    end;
    if (TFontStyle.fsItalic in Font.Style) then
    begin
      newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontItalicTrait, kCTFontItalicTrait);
      if newFontRef <> nil then
      begin
        CFRelease(fontref);
        fontref := newFontRef;
      end;
    end;

    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTFontAttributeName, fontref);
    if TFontStyle.fsUnderline in Font.Style then
    begin
      int := kCTUnderlineStyleSingle;
      underline := CFNumberCreate(nil, kCFNumberSInt32Type, @int);
      CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTUnderlineStyleAttributeName, underline);
    end;

    SetLength(settings, Length(settings) + 1);
    case ATextAlign of
      TTextAlign.taCenter: alignment := kCTCenterTextAlignment;
      TTextAlign.taLeading: alignment := kCTLeftTextAlignment;
      TTextAlign.taTrailing: alignment := kCTRightTextAlignment;
    end;
    settings[High(settings)].spec := kCTParagraphStyleSpecifierAlignment;
    settings[High(settings)].valueSize := sizeof(alignment);
    settings[High(settings)].value := @alignment;

    SetLength(settings, Length(settings) + 1);
    if WordWrap then
      wrapping := kCTLineBreakByWordWrapping
    else
      wrapping := kCTLineBreakByClipping;
    settings[High(settings)].spec := kCTParagraphStyleSpecifierLineBreakMode;
    settings[High(settings)].valueSize := SizeOf(wrapping);
    settings[High(settings)].value := @wrapping;

    if TFillTextFlag.ftRightToLeft in Flags then
    begin
      SetLength(settings, Length(settings) + 1);
      direction := kCTWritingDirectionRightToLeft;
      settings[High(settings)].spec := kCTParagraphStyleSpecifierBaseWritingDirection;
      settings[High(settings)].valueSize := SizeOf(direction);
      settings[High(settings)].value := @direction;
    end;

    paragraphStyle := CTParagraphStyleCreate(@settings[0], Length(settings));
    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTParagraphStyleAttributeName, paragraphStyle);
  finally
    CFAttributedStringEndEditing(attr);
  end;

  framesetter := CTFramesetterCreateWithAttributedString(CFAttributedStringRef(attr));
  CFRelease(attr);

  frame := CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil);
  CFRelease(framesetter);

  TextR.TopLeft := PointF(0, 0);
  TextR.BottomRight := measureFrame(frame);

  CFRelease(frame);
  CFRelease(fontref);
  CFRelease(paragraphStyle);
  CFRelease(path);
  // align
  case ATextAlign of
    TTextAlign.taCenter:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, Trunc((RectWidth(ARect) - RectWidth(TextR)) / 2), 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
    TTextAlign.taLeading:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
    TTextAlign.taTrailing:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, Trunc((RectWidth(ARect) - RectWidth(TextR))), 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
  end;
  case AVTextAlign of
    TTextAlign.taCenter:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, Trunc((RectHeight(ARect) - RectHeight(TextR)) / 2));
        OffsetRect(TextR, 0, ARect.Top);
      end;
    TTextAlign.taLeading:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, ARect.Top);
      end;
    TTextAlign.taTrailing:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, Trunc((RectHeight(ARect) - RectHeight(TextR))));
        OffsetRect(TextR, 0, ARect.Top);
      end;
  end;
  // result
  ARect := TextR;
end;

procedure PathApplierFunction(info: Pointer; const element: CGPathElement); cdecl;
var
  P, P1, P2: PPointF;
begin
  P := PPointF(element.points);
  case element.type_ of
    kCGPathElementMoveToPoint:
      TPathData(info).MoveTo(P^);
    kCGPathElementAddLineToPoint:
      TPathData(info).LineTo(P^);
    kCGPathElementAddQuadCurveToPoint:
      begin
        P1 := P;
        Inc(P1);
        TPathData(info).CurveTo(P^, P^, P1^);
      end;
    kCGPathElementAddCurveToPoint:
      begin
        P1 := P;
        Inc(P1);
        P2 := P1;
        Inc(P2);
        TPathData(info).CurveTo(P^, P1^, P2^);
      end;
    kCGPathElementCloseSubpath:
      TPathData(info).ClosePath;
  end;
end;

function TCanvasQuartz.TextToPath(Path: TPathData; const ARect: TRectF; const AText: string; const WordWrap: Boolean; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean;
var
  str: CFStringRef;
  attr: CFMutableAttributedStringRef;
  glyphCount: CFIndex;
  fontref, newFontRef: CTFontRef;
  alignment: byte;
  wrapping: byte;
  direction: shortint;
  settings: array of CTParagraphStyleSetting;
  paragraphStyle: CTParagraphStyleRef;
  textSize: TPointF;
  line: CTLineRef;
  runArray: CFArrayRef;
  glyph: CGGlyph;
  position:  CGPoint;
  i: Integer;
  runIndex: CFIndex;
  run: CTRunRef;
  glyphPath: CGPathRef;
  glyphMatrix: CGAffineTransform;
  underline: CFNumberRef;
  int: Cardinal;
  M: TMatrix;
  TextR: TRectF;
begin
  Result := False;
  if Length(AText) = 0 then Exit;

  str := CFStringCreateWithCharacters(kCFAllocatorDefault, PChar(AText), Length(AText));
  attr := CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
  CFAttributedStringReplaceString(attr, CFRangeMake(0, 0), str);

  fontref := CTFontCreateWithName(CFSTR(Font.Family), Font.Size, nil);
  if (TFontStyle.fsBold in Font.Style) then
  begin
    newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontBoldTrait, kCTFontBoldTrait);
    if newFontRef <> nil then
    begin
      CFRelease(fontref);
      fontref := newFontRef;
    end;
  end;
  if (TFontStyle.fsItalic in Font.Style) then
  begin
    newFontRef := CTFontCreateCopyWithSymbolicTraits(fontref, 0, nil, kCTFontItalicTrait, kCTFontItalicTrait);
    if newFontRef <> nil then
    begin
      CFRelease(fontref);
      fontref := newFontRef;
    end;
  end;

  CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTFontAttributeName, fontref);
  if TFontStyle.fsUnderline in Font.Style then
  begin
    int := kCTUnderlineStyleSingle;
    underline := CFNumberCreate(nil, kCFNumberSInt32Type, @int);
    CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), kCTUnderlineStyleAttributeName, underline);
  end;

  SetLength(settings, Length(settings) + 1);
  case ATextAlign of
    TTextAlign.taCenter: alignment := kCTCenterTextAlignment;
    TTextAlign.taLeading: alignment := kCTLeftTextAlignment;
    TTextAlign.taTrailing: alignment := kCTRightTextAlignment;
  end;
  settings[High(settings)].spec := kCTParagraphStyleSpecifierAlignment;
  settings[High(settings)].valueSize := sizeof(alignment);
  settings[High(settings)].value := @alignment;

  SetLength(settings, Length(settings) + 1);
  if WordWrap then
    wrapping := kCTLineBreakByWordWrapping
  else
    wrapping := kCTLineBreakByClipping;
  settings[High(settings)].spec := kCTParagraphStyleSpecifierLineBreakMode;
  settings[High(settings)].valueSize := SizeOf(wrapping);
  settings[High(settings)].value := @wrapping;

{  if TFillTextFlag.ftRightToLeft in Flags then
  begin
    SetLength(settings, Length(settings) + 1);
    direction := kCTWritingDirectionRightToLeft;
    settings[High(settings)].spec := kCTParagraphStyleSpecifierBaseWritingDirection;
    settings[High(settings)].valueSize := SizeOf(direction);
    settings[High(settings)].value := @direction;
  end;}

  paragraphStyle := CTParagraphStyleCreate(@settings[0], length(settings));
  CFAttributedStringSetAttribute(attr, CFRangeMake(0, CFStringGetLength(str)), CFSTR('kCTParagraphStyleAttributeName'), paragraphStyle);
  line := CTLineCreateWithAttributedString(CFAttributedStringRef(attr));
  CFRelease(attr);

  runArray := CTLineGetGlyphRuns(line);

  for runIndex := 0 to CFArrayGetCount(runArray) - 1 do
  begin
    run := CTRunRef(CFArrayGetValueAtIndex(runArray, runIndex));
    glyphCount := CTRunGetGlyphCount(run);
    for i := 0 to glyphCount - 1 do
    begin
      CTRunGetGlyphs(run, CFRangeMake(i, 1), @glyph);
      CTRunGetPositions(run, CFRangeMake(i, 1), @position);
      glyphMatrix := CGAffineTransformTranslate(CGAffineTransformIdentity, position.x, position.y);
      glyphPath := CTFontCreatePathForGlyph(fontref, glyph, @glyphMatrix);
      CGPathApply(glyphPath, Path, @PathApplierFunction);
    end;
  end;

  TextR := Path.GetBounds;

  M := IdentityMatrix;
  M.m22 := -1;
  M.m32 := TextR.Height;
  Path.ApplyMatrix(M);

  TextR := Path.GetBounds;

  case ATextAlign of
    TTextAlign.taCenter:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, Trunc((RectWidth(ARect) - RectWidth(TextR)) / 2), 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
    TTextAlign.taLeading:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
    TTextAlign.taTrailing:
      begin
        OffsetRect(TextR, -TextR.Left, 0);
        OffsetRect(TextR, Trunc((RectWidth(ARect) - RectWidth(TextR))), 0);
        OffsetRect(TextR, ARect.Left, 0);
      end;
  end;
  case AVTextAlign of
    TTextAlign.taCenter:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, Trunc((RectHeight(ARect) - RectHeight(TextR)) / 2));
        OffsetRect(TextR, 0, ARect.Top);
      end;
    TTextAlign.taLeading:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, ARect.Top);
      end;
    TTextAlign.taTrailing:
      begin
        OffsetRect(TextR, 0, -TextR.Top);
        OffsetRect(TextR, 0, Trunc((RectHeight(ARect) - RectHeight(TextR))));
        OffsetRect(TextR, 0, ARect.Top);
      end;
  end;
  Path.Translate(TextR.Left, TextR.Top);

  CFRelease(line);

  Result := True;
end;

{ TQuartzCanvasSaveState }

procedure TQuartzCanvasSaveState.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TCanvasQuartz then
    CGContextSaveGState(TCanvasQuartz(Source).Context);
end;

procedure TQuartzCanvasSaveState.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);
  if Dest is TCanvasQuartz then
    CGContextRestoreGState(TCanvasQuartz(Dest).Context);
end;

initialization
  DefaultCanvasClass := TCanvasQuartz;
  DefaultPrinterCanvasClass := TCanvasQuartz;
  DefaultBitmapCodecClass := TBitmapCodecQuartz;
finalization
  if MyColorSpace <> nil then
    CGColorSpaceRelease(MyColorSpace);
end.
