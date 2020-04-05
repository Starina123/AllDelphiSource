{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Canvas_GDIP;

{$I FMX_Defines.inc}

interface

implementation

uses
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX, Winapi.GDIPOBJ, Winapi.GDIPAPI, Winapi.GDIPUTIL,
  Classes, SysUtils, Math, Types, UITypes,
  FMX_Consts, FMX_Types, FMX_Printer, FMX_Printer_Win;

type

{ TGDIPCanvasSaveState }

  TGDIPCanvasSaveState = class(TCanvasSaveState)
  private
    FState: GraphicsState;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Assign(Source: TPersistent); override;
  end;

{ TBitmapCodecGdiPlus }

  TBitmapCodecGdiPlus = class(TBitmapCodec)
  published
    class function GetFileTypes: WideString; override;
    class function GetImageSize(const AFileName: WideString): TPointF; override;
    function LoadFromFile(const AFileName: WideString; const Rotate: Single;
      var Bitmap: TBitmap): Boolean; override;
    function SaveToFile(const AFileName: WideString; var Bitmap: TBitmap;
      const Params: WideString = ''): Boolean; override;
    function LoadThumbnailFromFile(const AFileName: WideString;
      const AFitWidth, AFitHeight: Single; const UseEmbedded: Boolean;
      var Bitmap: TBitmap): Boolean; override;
    function LoadFromStream(const AStream: TStream; var Bitmap: TBitmap)
      : Boolean; override;
    function SaveToStream(const AStream: TStream; var Bitmap: TBitmap;
      const Format: WideString; const Params: WideString = ''): Boolean; override;
  end;

{ TCanvasGdiPlus }

  TCanvasGdiPlus = class(TCanvas)
  private
    FBitmapInfo: TBitmapInfo;
    FBufferBitmap: THandle;
    FGPGraphics: TGPGraphics;
    FGPPen: TGPPen;
    FGPPenBrush: TGPBrush;
    FGPBrush: TGPBrush;
    FGPFamily: TGPFontFamily;
    FFontCollection: TGPPrivateFontCollection;
    FFontScale: Single;
    function GetGraphics: TGPGraphics; inline;
    function CreateSaveState: TCanvasSaveState; override;
    procedure SetClipRects(const ARects: array of TRectF);
  protected
    procedure ApplyFill(ARect: TRectF; const AOpacity: Single);
    procedure ApplyStroke(ARect: TRectF; const AOpacity: Single);
    procedure FontChanged(Sender: TObject); override;
    procedure IntFillPath(P: TGPGraphicsPath; R: TRectF; Opacity: Single);
    procedure IntFillRect(R: TRectF; Opacity: Single);
    class function GetBitmapScanline(Bitmap: TBitmap; y: Integer) : PAlphaColorArray; override;
    { Bitmaps }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); override;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); override;
    procedure FreeBuffer; override;
    { begin and }
    function DoBeginScene(const AClipRects: PClipRects = nil): Boolean; override;
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
    procedure DrawLine(const APt1, APt2: TPointF;
      const AOpacity: Single); override;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single;
      const ACorners: TCorners; const AOpacity: Single;
      const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single;
      const ACorners: TCorners; const AOpacity: Single;
      const ACornerType: TCornerType = TCornerType.ctRound); override;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); override;
    function LoadFontFromStream(AStream: TStream): Boolean; override;
    procedure FillText(const ARect: TRectF; const AText: WideString;
      const WordWrap: Boolean; const AOpacity: Single;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    procedure MeasureText(var ARect: TRectF;
      const AText: WideString; const WordWrap: Boolean;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter); override;
    function TextToPath(Path: TPathData; const ARect: TRectF;
      const AText: WideString; const WordWrap: Boolean;
      const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean; override;
    function PtInPath(const APoint: TPointF;
      const APath: TPathData): Boolean; override;
    procedure FillPath(const APath: TPathData; const AOpacity: Single); override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); override;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF;
      const AOpacity: Single; const HighSpeed: Boolean = False); override;
    procedure DrawThumbnail(const ABitmap: TBitmap;
      const Width, Height: Single); override;

    property Graphics: TGPGraphics read GetGraphics;
  end;

function GPRectFromRect(const R: TRectF): TGPRectF;
begin
  Result.X := R.Left;
  Result.y := R.Top;
  Result.Width := R.Right - R.Left;
  Result.Height := R.Bottom - R.Top;
end;

function GPRectFromRectTruncated(const R: TRectF): TGPRectF;
begin
  Result.X := Trunc(R.Left);
  Result.y := Trunc(R.Top);
  Result.Width := Trunc(R.Right) - Trunc(R.Left);
  Result.Height := Trunc(R.Bottom) - Trunc(R.Top);
end;

type

{ TMyStreamAdapter }

  TMyStreamAdapter = class(TInterfacedObject, IStream)
  public
    FStream: TStream;
    FOwnership: TStreamOwnership;
  public
    constructor Create(Stream: TStream;
      Ownership: TStreamOwnership = soReference);
    destructor Destroy; override;
    {$IFDEF FPC}
    function Read(pv : Pointer;cb : DWORD;pcbRead : PDWORD) : HRESULT; virtual; stdcall;
    function Write(pv : Pointer;cb : DWORD;pcbWritten : PDWORD): HRESULT; virtual; stdcall;
    {$ELSE}
    function Read(pv: Pointer; cb: Longint; pcbRead: PLongint): HResult; virtual; stdcall;
    function Write(pv: Pointer; cb: Longint; pcbWritten: PLongint): HResult; virtual; stdcall;
    {$ENDIF}
    function Seek(dlibMove: Largeint; dwOrigin: Longint;
      out libNewPosition: Largeint): HRESULT; virtual; stdcall;
    function SetSize(libNewSize: Largeint): HRESULT; virtual; stdcall;
    function CopyTo(stm: IStream; cb: Largeint; out cbRead: Largeint;
      out cbWritten: Largeint): HRESULT; virtual; stdcall;
    function Commit(grfCommitFlags: Longint): HRESULT; virtual; stdcall;
    function Revert: HRESULT; virtual; stdcall;
    function LockRegion(libOffset: Largeint; cb: Largeint; dwLockType: Longint)
      : HRESULT; virtual; stdcall;
    function UnlockRegion(libOffset: Largeint; cb: Largeint;
      dwLockType: Longint): HRESULT; virtual; stdcall;
    function Stat(out statstg: TStatStg; grfStatFlag: Longint): HRESULT;
      virtual; stdcall;
    function Clone(out stm: IStream): HRESULT; virtual; stdcall;
    property Stream: TStream read FStream;
    property StreamOwnership: TStreamOwnership read FOwnership write FOwnership;
  end;

{ TMyStreamAdapter }

constructor TMyStreamAdapter.Create(Stream: TStream;
  Ownership: TStreamOwnership);
begin
  inherited Create;
  FStream := Stream;
  FOwnership := Ownership;
end;

destructor TMyStreamAdapter.Destroy;
begin
  if FOwnership = soOwned then
  begin
    FStream.Free;
    FStream := nil;
  end;
  inherited Destroy;
end;

{$IFDEF FPC}
function TMyStreamAdapter.Read(pv : Pointer;cb : DWORD;pcbRead : PDWORD): HResult;
{$ELSE}
function TMyStreamAdapter.Read(pv: Pointer; cb: longint; pcbRead: PLongint): HResult;
{$ENDIF}
var
  NumRead: DWORD;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumRead := FStream.Read(pv^, cb);
    if pcbRead <> Nil then
      pcbRead^ := NumRead;
    Result := S_OK;
  except
    Result := S_FALSE;
  end;
end;

function TMyStreamAdapter.LockRegion(libOffset: Largeint; cb: Largeint;
  dwLockType: Longint): HRESULT;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function TMyStreamAdapter.UnlockRegion(libOffset: Largeint; cb: Largeint;
  dwLockType: Longint): HRESULT;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function TMyStreamAdapter.Commit(grfCommitFlags: Longint): HRESULT;
begin
  Result := S_OK;
end;

{$IFDEF FPC}
function TMyStreamAdapter.Write(pv : Pointer;cb : DWORD;pcbWritten : PDWORD): HResult;
{$ELSE}
function TMyStreamAdapter.Write(pv: Pointer; cb: Longint; pcbWritten: PLongint): HResult;
{$ENDIF}
var
  NumWritten: DWORD;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumWritten := FStream.Write(pv^, cb);
    if pcbWritten <> Nil then
      pcbWritten^ := NumWritten;
    Result := S_OK;
  except
    Result := STG_E_CANTSAVE;
  end;
end;

function TMyStreamAdapter.Seek(dlibMove: Largeint; dwOrigin: Longint;
  out libNewPosition: Largeint): HRESULT;
var
  NewPos: Largeint;
begin
  try
    if (dwOrigin < STREAM_SEEK_SET) or (dwOrigin > STREAM_SEEK_END) then
    begin
      Result := STG_E_INVALIDFUNCTION;
      Exit;
    end;
    NewPos := FStream.Seek(dlibMove, dwOrigin);
    if @libNewPosition <> nil then
      libNewPosition := NewPos;
    Result := S_OK;
  except
    Result := STG_E_INVALIDPOINTER;
  end;
end;

function TMyStreamAdapter.SetSize(libNewSize: Largeint): HRESULT;
begin
  try
    FStream.Size := libNewSize;
    if libNewSize <> FStream.Size then
      Result := E_FAIL
    else
      Result := S_OK;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TMyStreamAdapter.CopyTo(stm: IStream; cb: Largeint;
  out cbRead: Largeint; out cbWritten: Largeint): HRESULT;
const
  MaxBufSize = 1024 * 1024; // 1mb
var
  Buffer: Pointer;
  BufSize, N, I, R: Integer;
  BytesRead, BytesWritten, W: Largeint;
begin
  Result := S_OK;
  BytesRead := 0;
  BytesWritten := 0;
  try
    if cb > MaxBufSize then
      BufSize := MaxBufSize
    else
      BufSize := Integer(cb);
    GetMem(Buffer, BufSize);
    try
      while cb > 0 do
      begin
        if cb > MaxInt then
          I := MaxInt
        else
          I := cb;
        while I > 0 do
        begin
          if I > BufSize then
            N := BufSize
          else
            N := I;
          R := FStream.Read(Buffer^, N);
          if R = 0 then
            Exit; // The end of the stream was hit.
          Inc(BytesRead, R);
          W := 0;
          Result := stm.Write(Buffer, R, @W);
          Inc(BytesWritten, W);
          if (Result = S_OK) and (Integer(W) <> R) then
            Result := E_FAIL;
          if Result <> S_OK then
            Exit;
          Dec(I, R);
          Dec(cb, R);
        end;
      end;
    finally
      FreeMem(Buffer);
      if (@cbWritten <> nil) then
        cbWritten := BytesWritten;
      if (@cbRead <> nil) then
        cbRead := BytesRead;
    end;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TMyStreamAdapter.Revert: HRESULT;
begin
  Result := STG_E_REVERTED;
end;

function DateTimeToFileTime(FileTime: TDateTime): TFileTime;
var
  LocalFileTime, Ft: TFileTime;
  SystemTime: TSystemTime;
begin
  Result.dwLowDateTime := 0;
  Result.dwHighDateTime := 0;
  DateTimeToSystemTime(FileTime, SystemTime);
  SystemTimeToFileTime(SystemTime, LocalFileTime);
  LocalFileTimeToFileTime(LocalFileTime, Ft);
  Result := Ft;
end;

function TMyStreamAdapter.Stat(out statstg: TStatStg;
  grfStatFlag: Longint): HRESULT;
begin
  Result := S_OK;
  try
    if (@statstg <> nil) then
    begin
      FillChar(statstg, SizeOf(statstg), 0);
      with statstg do
      begin
        dwType := STGTY_STREAM;
        cbSize := Stream.Size;
        mTime := DateTimeToFileTime(now);
        cTime := DateTimeToFileTime(now);
        aTime := DateTimeToFileTime(now);
        grfLocksSupported := LOCK_WRITE;
      end;
    end;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TMyStreamAdapter.Clone(out stm: IStream): HRESULT;
begin
  Result := E_NOTIMPL;
end;

{ TBitmapCodecGdiPlus }

class function TBitmapCodecGdiPlus.GetFileTypes: WideString;
begin
  Result := '*.bmp;*.jpg;*.jpeg;*.png;*.tif;*.tiff;*.gif;*.ico'
end;

class function TBitmapCodecGdiPlus.GetImageSize(const AFileName: WideString): TPointF;
var
  img: TGPImage;
  S: TStream;
  adapter: TMyStreamAdapter;
begin
  S := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  adapter := TMyStreamAdapter.Create(S);
  try
    img := TGPImage.Create(adapter, True);
    Result := PointF(img.GetWidth, img.GetHeight);
    img.Free;
  finally
    S.Free;
  end;
end;

function TBitmapCodecGdiPlus.LoadFromFile(const AFileName: WideString;
  const Rotate: Single; var Bitmap: TBitmap): Boolean;
var
  img: TGPImage;
  bmp: TGPBitmap;
  graphics: TGPGraphics;
  M, M2: TMatrix;
  Pts: array [1 .. 4] of TPointF;
  GM: TGPMatrix;
  R: TRectF;
  BD: TBitmapData;
  S: TStream;
  adapter: TMyStreamAdapter;
begin
  Result := False;
  S := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  adapter := TMyStreamAdapter.Create(S);
  try
    img := TGPImage.Create(adapter, True);
    if img.GetWidth * img.GetHeight <> 0 then
    begin
      if (frac(Rotate) = 0) and (Trunc(Rotate) mod 90 = 0) then
      begin
        // create bitmap and copy to TBitmap
        if (Trunc(Rotate) mod 360 = 90) or (Trunc(Rotate) mod 360 = 270) then
          Bitmap.SetSize(img.GetHeight, img.GetWidth)
        else
          Bitmap.SetSize(img.GetWidth, img.GetHeight);

        bmp := TGPBitmap.Create(adapter, True);
        if Trunc(Rotate) mod 360 = 90 then
          bmp.RotateFlip(Rotate90FlipNone);
        if Trunc(Rotate) mod 360 = 180 then
          bmp.RotateFlip(Rotate180FlipNone);
        if Trunc(Rotate) mod 360 = 270 then
          bmp.RotateFlip(Rotate270FlipNone);
        if bmp.LockBits(MakeRect(0, 0, Bitmap.Width, Bitmap.Height),
          ImageLockModeRead, PixelFormat32bppPARGB, BD) = OK then
        begin
          Move(BD.Scan0^, Bitmap.StartLine^, Bitmap.Width * Bitmap.Height * 4);
          bmp.UnlockBits(BD)
        end;
        bmp.Free;
      end
      else
      begin
        M := IdentityMatrix;
        M.m31 := -(img.GetWidth / 2);
        M.m32 := -(img.GetHeight / 2);
        M := MatrixMultiply(M, CreateRotationMatrix(DegToRad(Rotate)));
        { calc new size }
        Pts[1] := PointF(VectorTransform(Vector(0, 0), M));
        Pts[2] := PointF(VectorTransform(Vector(img.GetWidth, 0), M));
        Pts[3] := PointF(VectorTransform(Vector(img.GetWidth,
          img.GetHeight), M));
        Pts[4] := PointF(VectorTransform(Vector(0, img.GetHeight), M));
        R := NormalizeRectF(Pts);
        { translate }
        M2 := IdentityMatrix;
        M2.m31 := RectWidth(R) / 2;
        M2.m32 := RectHeight(R) / 2;
        M := MatrixMultiply(M, M2);
        { rotate }
        Bitmap.SetSize(Trunc(RectWidth(R)), Trunc(RectHeight(R)));

        bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
          PixelFormat32bppPARGB, PBYTE(Bitmap.StartLine));
        graphics := TGPGraphics.Create(bmp);
        with M do
          GM := TGPMatrix.Create(m11, m12, m21, m22, m31, m32);
        graphics.SetTransform(GM);
        GM.Free;
        graphics.DrawImage(img, 0, 0, img.GetWidth, img.GetHeight);
        graphics.Free;
        bmp.Free;
      end;
      Result := True;
    end;
    img.Free;
  finally
    S.Free;
  end;
end;

function TBitmapCodecGdiPlus.LoadThumbnailFromFile(const AFileName: WideString;
  const AFitWidth, AFitHeight: Single; const UseEmbedded: Boolean;
  var Bitmap: TBitmap): Boolean;
var
  R: TRectF;
  thumb, img: TGPImage;
  bmp: TGPBitmap;
  graphics: TGPGraphics;
  bits: PAlphaColorArray;
  scale: Single;
  S: TStream;
  adapter: TMyStreamAdapter;
begin
  Result := False;
  S := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  adapter := TMyStreamAdapter.Create(S);
  try
    img := TGPImage.Create(adapter, True);
    if img.GetWidth * img.GetHeight <> 0 then
    begin
      { calc thumb size }
      R := RectF(0, 0, img.GetWidth, img.GetHeight);
      scale := FitRect(R, RectF(0, 0, AFitWidth, AFitHeight));
      if scale = 0 then
        scale := 0.001;
      if scale < 1 then
        scale := 1;
      { create thumb }
      if UseEmbedded then
      begin
        thumb := img.GetThumbnailImage(Trunc(img.GetWidth / scale),
          Trunc(img.GetHeight / scale));
        if thumb <> nil then
        begin
          { create bitmap and copy to TBitmap }
          Bitmap.SetSize(thumb.GetWidth, thumb.GetHeight);
          bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
            PixelFormat32bppPARGB, PBYTE(Bitmap.Scanline[0]));
          graphics := TGPGraphics.Create(bmp);
          graphics.DrawImage(thumb, 0, 0, Bitmap.Width, Bitmap.Height);
          graphics.Free;
          bmp.Free;
          thumb.Free;
        end;
      end
      else
      begin
        { create from original }
        Bitmap.SetSize(Trunc(RectWidth(R)), Trunc(RectHeight(R)));
        bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
          PixelFormat32bppPARGB, PBYTE(Bitmap.Scanline[0]));
        bmp.SetResolution(img.GetHorizontalResolution / scale,
          img.GetVerticalResolution / scale);
        graphics := TGPGraphics.Create(bmp);
        graphics.SetInterpolationMode(InterpolationModeHighQuality);
        graphics.DrawImage(img, 0, 0);
        graphics.Free;
        bmp.Free;
      end;
      Result := True;
    end;
    img.Free;
  finally
    S.Free;
  end;
end;

function TBitmapCodecGdiPlus.LoadFromStream(const AStream: TStream;
  var Bitmap: TBitmap): Boolean;
var
  img: TGPImage;
  bmp: TGPBitmap;
  graphics: TGPGraphics;
  adapter: TMyStreamAdapter;
begin
  Result := False;
  adapter := TMyStreamAdapter.Create(AStream);
  img := TGPImage.Create(adapter, True);
  if img.GetWidth * img.GetHeight <> 0 then
  begin
    { create bitmap and copy to TBitmap }
    Bitmap.SetSize(img.GetWidth, img.GetHeight);
    bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
      PixelFormat32bppPARGB, PBYTE(Bitmap.Scanline[0]));
    graphics := TGPGraphics.Create(bmp);
    graphics.DrawImage(img, 0, 0, Bitmap.Width, Bitmap.Height);
    graphics.Free;
    bmp.Free;
    Result := True;
  end;
  img.Free;
end;

function TBitmapCodecGdiPlus.SaveToStream(const AStream: TStream;
  var Bitmap: TBitmap; const Format: WideString; const Params: WideString = '')
  : Boolean;
var
  bmp: TGPBitmap;
  adapter: TMyStreamAdapter;
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;
  IntValue: Integer;
  S, param, name, value: ansistring;
  encoder: ansistring;
  I: Integer;
begin
  encoder := 'image/png';
  if LowerCase(Format) = 'jpeg' then
    encoder := 'image/jpeg';
  if LowerCase(Format) = 'jpg' then
    encoder := 'image/jpeg';
  if LowerCase(Format) = 'png' then
    encoder := 'image/png';
  if LowerCase(Format) = 'bmp' then
    encoder := 'image/bmp';
  if LowerCase(Format) = 'tif' then
    encoder := 'image/tiff';
  if LowerCase(Format) = 'tiff' then
    encoder := 'image/tiff';
  if LowerCase(Format) = 'gif' then
    encoder := 'image/gif';
  if GetEncoderClsid(encoder, encoderClsid) >= 0 then
  begin
    adapter := TMyStreamAdapter.Create(AStream);
    bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
      PixelFormat32bppPARGB, PBYTE(Bitmap.Scanline[0]));
    { set params }
    if Params <> '' then
    begin
      S := Params;
      I := 0;
      while S <> '' do
      begin
        param := GetToken(S, ' ');
        name := GetToken(param, '=');
        value := GetToken(param, '');
        if CompareText(name, 'quality') = 0 then
        begin
          encoderParameters.Parameter[I].Guid := EncoderQuality;
          encoderParameters.Parameter[I].NumberOfValues := 1;
          encoderParameters.Parameter[I].Type_ := EncoderParameterValueTypeLong;
          IntValue := strToInt(value);
          encoderParameters.Parameter[I].value := @IntValue;
        end;
        Inc(I);
      end;
      encoderParameters.Count := I;
      { save }
      bmp.Save(adapter, encoderClsid, @encoderParameters);
    end
    else
      bmp.Save(adapter, encoderClsid);
    bmp.Free;
  end;
end;

function TBitmapCodecGdiPlus.SaveToFile(const AFileName: WideString;
  var Bitmap: TBitmap; const Params: WideString = ''): Boolean;
var
  S, param, name, value: ansistring;
  bmp: TGPBitmap;
  adapter: TMyStreamAdapter;
  encoderClsid: TGUID;
  encoderType: ansistring;
  I, IntValue: Integer;
  encoderParameters: TEncoderParameters;
begin
  encoderType := '';
  if (LowerCase(ExtractFileExt(AFileName)) = '.jpg') or
    (LowerCase(ExtractFileExt(AFileName)) = '.jpeg') then
    encoderType := 'image/jpeg';
  if (LowerCase(ExtractFileExt(AFileName)) = '.bmp') then
    encoderType := 'image/bmp';
  if (LowerCase(ExtractFileExt(AFileName)) = '.png') then
    encoderType := 'image/png';
  if (LowerCase(ExtractFileExt(AFileName)) = '.tif') or
    (LowerCase(ExtractFileExt(AFileName)) = '.tiff') then
    encoderType := 'image/tiff';
  if (LowerCase(ExtractFileExt(AFileName)) = '.gif') then
    encoderType := 'image/gif';
  if GetEncoderClsid(encoderType, encoderClsid) >= 0 then
  begin
    bmp := TGPBitmap.Create(Bitmap.Width, Bitmap.Height, Bitmap.Width * 4,
      PixelFormat32bppPARGB, PBYTE(Bitmap.Scanline[0]));
    { set params }
    if Params <> '' then
    begin
      S := Params;
      I := 0;
      while S <> '' do
      begin
        param := GetToken(S, ' ');
        name := GetToken(param, '=');
        value := GetToken(param, '');
        if CompareText(name, 'quality') = 0 then
        begin
          encoderParameters.Parameter[I].Guid := EncoderQuality;
          encoderParameters.Parameter[I].NumberOfValues := 1;
          encoderParameters.Parameter[I].Type_ := EncoderParameterValueTypeLong;
          IntValue := strToInt(value);
          encoderParameters.Parameter[I].value := @IntValue;
        end;
        Inc(I);
      end;
      encoderParameters.Count := I;
      { save }
      bmp.Save(AFileName, encoderClsid, @encoderParameters);
    end
    else
      bmp.Save(AFileName, encoderClsid);
    bmp.Free;
  end;
end;

{ TCanvasGdiPlus }

const
  imgColorMatrix: TColorMatrix = ((1, 0.0, 0.0, 0.0, 0.0),
    (0.0, 1.0, 0.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0, 0.0),
    (0.0, 0.0, 0.0, 0.1, 0.0), (0.0, 0.0, 0.0, 0.0, 1.0));

  TextContrast = 6;
  SmothingDefault = SmoothingMode(5); // 8x8

var
  ColorArray: array [0 .. 100] of TGPColor;
  OffsetArray: array [0 .. 100] of Single;

function vgStyleToGPStyle(S: TFontStyles): Integer;
begin
  Result := 0;
  if TFontStyle.fsBold in S then
    Result := Result or FontStyleBold;
  if TFontStyle.fsItalic in S then
    Result := Result or FontStyleItalic;
  if TFontStyle.fsUnderline in S then
    Result := Result or FontStyleUnderline;
  if TFontStyle.fsStrikeOut in S then
    Result := Result or FontStyleStrikeout;
end;

constructor TCanvasGdiPlus.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer);
begin
  FBuffered := True;
  inherited CreateFromWindow(AParent, AWidth, AHeight);
  FGPPen := TGPPen.Create($FF000000);
  FGPPenBrush := TGPSolidBrush.Create($FF000000);
  FGPBrush := TGPSolidBrush.Create($FFFFFFFF);
  FGPFamily := TGPFontFamily.Create('Tahoma');
  FFontScale := 1;
end;

function TCanvasGdiPlus.CreateSaveState: TCanvasSaveState;
begin
  Result := TGDIPCanvasSaveState.Create;
end;

constructor TCanvasGdiPlus.CreateFromBitmap(const ABitmap: TBitmap);
begin
  inherited CreateFromBitmap(ABitmap);
  UpdateBitmapHandle(FBitmap);
  FGPGraphics := TGPGraphics.Create(TGPBitmap(FBitmap.Handles[Self]));
  FGPGraphics.SetSmoothingMode(SmothingDefault);
  FGPGraphics.SetPixelOffsetMode(PixelOffsetModeHalf);
  FGPGraphics.SetInterpolationMode(InterpolationModeHighQuality);
  FGPGraphics.SetTextContrast(TextContrast);
  if GlobalUseGDIPlusClearType then
    FGPGraphics.SetTextRenderingHint(TextRenderingHintClearTypeGridFit)
  else
    FGPGraphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  FGPPen := TGPPen.Create($FF000000);
  FGPPenBrush := TGPSolidBrush.Create($FF000000);
  FGPBrush := TGPSolidBrush.Create($FFFFFFFF);
  FGPFamily := TGPFontFamily.Create('Tahoma');
  FFontScale := 96 / FGPGraphics.GetDpiX;
end;

constructor TCanvasGdiPlus.CreateFromPrinter(const APrinter: TAbstractPrinter);
var
  PrinterWin: TPrinterWin;
begin
  inherited CreateFromPrinter(APrinter);
  if APrinter is TPrinterWin then
  begin
    // calling the constructor through the canvas instance makes the canvas
    // update the DC handle if APrinter is the same printer for the canvas
    if Assigned(FPrinter) and (APrinter = FPrinter) then
    begin
      FGPGraphics.Free;
      FGPPen.Free;
      FGPPenBrush.Free;
      FGPBrush.Free;
      FGPFamily.Free;
    end;
    // initialize the canvas size
    PrinterWin := TPrinterWin(APrinter);
    FWidth := PrinterWin.PageWidth;
    FHeight := PrinterWin.PageHeight;

    // create the underlying GDIPlus canvas object
    FGPGraphics := TGPGraphics.Create(PrinterWin.Handle);
    FGPGraphics.SetPageUnit(UnitPixel);
    FGPGraphics.SetSmoothingMode(SmothingDefault);
    FGPGraphics.SetPixelOffsetMode(PixelOffsetModeHalf);
    FGPGraphics.SetInterpolationMode(InterpolationModeHighQuality);
    FGPGraphics.SetTextContrast(TextContrast);
    FGPPen := TGPPen.Create($FF000000);
    FGPPenBrush := TGPSolidBrush.Create($FF000000);
    FGPBrush := TGPSolidBrush.Create($FFFFFFFF);
    FGPFamily := TGPFontFamily.Create('Tahoma');
    FFontScale := 1;
  end
  else
    raise EPrinter.CreateResFmt(@SInvalidPrinterClass, [APrinter.ClassName]);
end;

destructor TCanvasGdiPlus.Destroy;
begin
  FreeAndNil(FFontCollection);
  FGPFamily.Free;
  FGPBrush.Free;
  FGPPenBrush.Free;
  FGPPen.Free;
  inherited Destroy;
end;

procedure TCanvasGdiPlus.FreeBuffer;
begin
  FreeAndNil(FGPGraphics);
  if FBuffered then
  begin
    if FBufferHandle = 0 then
      Exit;
    if FBufferHandle <> 0 then
      DeleteDC(FBufferHandle);
    FBufferHandle := 0;
    if FBufferBitmap <> 0 then
      DeleteObject(FBufferBitmap);
    FBufferBitmap := 0;
  end;
end;

procedure TCanvasGdiPlus.ResizeBuffer(const AWidth, AHeight: Integer);
begin
  if (AWidth = FWidth) and (AHeight = FHeight) then
    Exit;
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
    { Initialization }
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
    FGPGraphics := TGPGraphics.Create(FBufferHandle);
    FGPGraphics.SetSmoothingMode(SmothingDefault);
    FGPGraphics.SetInterpolationMode(InterpolationModeHighQuality);
    FGPGraphics.SetPixelOffsetMode(PixelOffsetModeHalf);
    FGPGraphics.SetTextContrast(TextContrast);
    if GlobalUseGDIPlusClearType then
      FGPGraphics.SetTextRenderingHint(TextRenderingHintClearTypeGridFit)
    else
      FGPGraphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
    FFontScale := 96 / FGPGraphics.GetDpiX;
  end;
end;

procedure TCanvasGdiPlus.FlushBufferRect(const X, y: Integer; const Context; const ARect: TRectF);
var
  R: TRect;
begin
  if (FBufferHandle <> 0) and (HDC(Context) <> 0) then
  begin
    R := Rect(Trunc(ARect.Left), Trunc(ARect.Top), Ceil(ARect.Right), Ceil(ARect.Bottom));
    with R do
      Winapi.Windows.BitBlt(HDC(Context), X + R.Left, y + R.Top, R.Right - R.Left, R.Bottom - R.Top, FBufferHandle, R.Left, R.Top, SRCCOPY);
  end;
end;

function TCanvasGdiPlus.DoBeginScene(const AClipRects: PClipRects): Boolean;
begin
  Result := inherited DoBeginScene(AClipRects);
  if Result and (AClipRects <> nil) then
    SetClipRects(AClipRects^);
end;

procedure TCanvasGdiPlus.Clear(const Color: TAlphaColor);
begin
  FGPGraphics.Clear(Color)
end;

procedure TCanvasGdiPlus.ClearRect(const ARect: TRectF; const AColor: TAlphaColor);
var
  R: TRect;
  SaveIndex: Integer;
begin
  SaveIndex := FGPGraphics.Save;
  try
    FGPGraphics.IntersectClip(GPRectFromRect(ARect));
    FGPGraphics.Clear(AColor);
  finally
    FGPGraphics.Restore(SaveIndex);
  end;
end;

class function TCanvasGdiPlus.GetBitmapScanline(Bitmap: TBitmap; y: Integer)
  : PAlphaColorArray;
begin
  if (y >= 0) and (y < Bitmap.Height) and (Bitmap.StartLine <> nil) then
    Result := @PAlphaColorArray(Bitmap.StartLine)[(y) * Bitmap.Width]
  else
    Result := nil;
end;

function TCanvasGdiPlus.GetGraphics: TGPGraphics;
begin
  Result := FGPGraphics;
end;

procedure TCanvasGdiPlus.SetMatrix(const M: TMatrix);
var
  GM: TGPMatrix;
begin
  FMatrix := M;
  with FMatrix do
  begin
    GM := TGPMatrix.Create(m11, m12, m21, m22, m31, m32);
    GM.Shear(m13, m23);
  end;
  FGPGraphics.SetTransform(GM);
  GM.Free;
end;

procedure TCanvasGdiPlus.MultyMatrix(const M: TMatrix);
var
  GM: TGPMatrix;
begin
  inherited;
  with M do
  begin
    GM := TGPMatrix.Create(m11, m12, m21, m22, m31, m32);
    GM.Shear(m13, m23);
  end;
  FGPGraphics.MultiplyTransform(GM);
  GM.Free;
end;

procedure TCanvasGdiPlus.SetClipRects(const ARects: array of TRectF);
var
  I: Integer;
  R: TGPRegion;
  GM: TGPMatrix;
begin
  R := TGPRegion.Create;
  R.MakeEmpty;
  for I := 0 to High(ARects) do
  begin
    R.Union(GPRectFromRect(ARects[I]));
  end;
  FGPGraphics.SetClip(R);
  R.Free;
end;

procedure TCanvasGdiPlus.IntersectClipRect(const ARect: TRectF);
begin
  FGPGraphics.IntersectClip(MakeRect(ARect.Left, ARect.Top,
    ARect.Right - ARect.Left, ARect.Bottom - ARect.Top));
end;

procedure TCanvasGdiPlus.ExcludeClipRect(const ARect: TRectF);
begin
  FGPGraphics.ExcludeClip(GPRectFromRect(ARect));
end;

procedure TCanvasGdiPlus.ApplyFill(ARect: TRectF; const AOpacity: Single);
var
  C: TAlphaColor;
  I: Integer;
  Count: Integer;
  B: TBitmap;
  P: TGPGraphicsPath;
  M: TGPMatrix;
  CM: TColorMatrix;
  ImageAttributes: TGPImageAttributes;
begin
  if FGPBrush <> nil then
    FreeAndNil(FGPBrush);
  if (FFill.Kind = TBrushKind.bkResource) and (FFill.Resource <> nil) and
    (FFill.Resource.Brush <> nil) then
    FFill.Assign(FFill.Resource.Brush);

  with FFill do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          FGPBrush := TGPSolidBrush.Create(MakeColor(Color, AOpacity));
        end;
      TBrushKind.bkGradient:
        begin
          if Gradient.Points.Count > 1 then
          begin
            Count := 0;

            if Gradient.Points[0].Offset > 0 then
            begin
              ColorArray[Count] := MakeColor(Gradient.Points[0].IntColor,
                AOpacity);
              OffsetArray[Count] := 0;
              Count := Count + 1;
            end;
            for I := 0 to Gradient.Points.Count - 1 do
            begin
              ColorArray[I + Count] := MakeColor(Gradient.Points[I].IntColor,
                AOpacity);
              OffsetArray[I + Count] := Gradient.Points[I].Offset;
            end;
            if Gradient.Points[Gradient.Points.Count - 1].Offset < 1 then
            begin
              Count := Count + 1;
              ColorArray[Gradient.Points.Count + Count - 1] :=
                MakeColor(Gradient.Points[Gradient.Points.Count - 1].IntColor,
                AOpacity);
              OffsetArray[Gradient.Points.Count + Count - 1] := 1;
            end;

            if Gradient.Style = TGradientStyle.gsLinear then
            begin
              { Linear }
              FGPBrush := TGPLinearGradientBrush.Create
                (MakePoint(ARect.Left + Gradient.StartPosition.X * ARect.Width,
                ARect.Top + Gradient.StartPosition.y * ARect.Height),
                MakePoint(ARect.Left + Gradient.StopPosition.X * ARect.Width,
                ARect.Top + Gradient.StopPosition.y * ARect.Height),
                Color, Color);
              TGPLinearGradientBrush(FGPBrush).SetWrapMode(WrapModeTileFlipX);
              TGPLinearGradientBrush(FGPBrush).SetInterpolationColors
                (PGPColor(@ColorArray), PSingle(@OffsetArray),
                Gradient.Points.Count + Count);
            end
            else
            begin
              { Radial }
              P := TGPGraphicsPath.Create;
              P.AddEllipse(GPRectFromRect(ARect));
              FGPBrush := TGPPathGradientBrush.Create(P);
              P.Free;
              with Gradient.RadialTransform do
                M := TGPMatrix.Create(Matrix.m11, Matrix.m12, Matrix.m21,
                  Matrix.m22, Matrix.m31, Matrix.m32);
              TGPPathGradientBrush(FGPBrush).SetTransform(M);
              M.Free;
              TGPPathGradientBrush(FGPBrush).SetWrapMode(WrapModeClamp);
              TGPPathGradientBrush(FGPBrush).SetInterpolationColors
                (PARGB(@ColorArray), PSingle(@OffsetArray),
                Gradient.Points.Count + Count);
            end;
          end
          else
            FGPBrush := TGPSolidBrush.Create(MakeColor(Color, AOpacity));
        end;
      TBrushKind.bkResource:
        begin
          FGPBrush := TGPSolidBrush.Create($00000000);
        end;
      TBrushKind.bkGrab:
        begin
          FGPBrush := TGPSolidBrush.Create($00000000);
        end;
      TBrushKind.bkBitmap:
        begin
          B := Bitmap.Bitmap;
          if (B <> nil) and (B.ResourceBitmap <> nil) then
            B := B.ResourceBitmap;
          if (B <> nil) and (B.Width > 0) and (B.Height > 0) then
          begin
            UpdateBitmapHandle(B);
            if (B.HandleExists(Self)) then
            begin
              CM := imgColorMatrix;
              CM[3][3] := AOpacity;
              if AOpacity <> 1 then
              begin
                ImageAttributes := TGPImageAttributes.Create;
                ImageAttributes.SetColorMatrix(CM, ColorMatrixFlagsDefault,
                  ColorAdjustTypeBitmap);
              end
              else
                ImageAttributes := nil;
              if Bitmap.WrapMode <> TWrapMode.wmTileStretch then
              begin
                FGPBrush := TGPTextureBrush.Create
                  (TGPBitmap(B.Handles[Self]),
                  GPRectFromRect(RectF(0, 0, B.Width, B.Height)),
                  ImageAttributes);
                if Bitmap.WrapMode = TWrapMode.wmTileOriginal then
                  TGPTextureBrush(FGPBrush).SetWrapMode(Winapi.GDIPAPI.TWrapMode.WrapModeClamp)
                else
                  TGPTextureBrush(FGPBrush).SetWrapMode(Winapi.GDIPAPI.TWrapMode.WrapModeTile);
              end
              else
              begin
                FGPBrush := TGPTextureBrush.Create
                  (TGPBitmap(B.Handles[Self]),
                  GPRectFromRect(RectF(0, 0, B.Width, B.Height)),
                  ImageAttributes);
                TGPTextureBrush(FGPBrush).SetWrapMode(WrapModeClamp);
                TGPTextureBrush(FGPBrush).ScaleTransform(
                  (RectWidth(ARect) + (StrokeThickness / 2)) /
                  B.Width, (RectHeight(ARect) + (StrokeThickness / 2)) /
                  B.Height);
              end;
              if AOpacity <> 1 then
                ImageAttributes.Free;
            end
            else
              FGPBrush := TGPSolidBrush.Create($00000000);
          end
          else
            FGPBrush := TGPSolidBrush.Create($00000000);
        end;
    else
      FGPBrush := TGPSolidBrush.Create($00000000);
    end;
  end;
end;

procedure TCanvasGdiPlus.ApplyStroke(ARect: TRectF; const AOpacity: Single);
var
  I: Integer;
  Count: Integer;
  P: TGPGraphicsPath;
  M: TGPMatrix;

begin
  if FGPPen <> nil then
    FreeAndNil(FGPPen);
  if FGPPenBrush <> nil then
    FreeAndNil(FGPPenBrush);
  if (FStroke.Kind = TBrushKind.bkResource) and (FStroke.Resource <> nil) and
    (FStroke.Resource.Brush <> nil) then
    FStroke.Assign(FStroke.Resource.Brush);

  with FStroke do
  begin
    case Kind of
      TBrushKind.bkSolid:
        begin
          FGPPenBrush := TGPSolidBrush.Create(MakeColor(Color, AOpacity));
        end;
      TBrushKind.bkGradient:
        begin
          if Gradient.Points.Count > 1 then
          begin
            Count := 0;

            if Gradient.Points[0].Offset > 0 then
            begin
              ColorArray[Count] := MakeColor(Gradient.Points[0].IntColor,
                AOpacity);
              OffsetArray[Count] := 0;
              Count := Count + 1;
            end;
            for I := 0 to Gradient.Points.Count - 1 do
            begin
              ColorArray[I + Count] := MakeColor(Gradient.Points[I].IntColor,
                AOpacity);
              OffsetArray[I + Count] := Gradient.Points[I].Offset;
            end;
            if Gradient.Points[Gradient.Points.Count - 1].Offset < 1 then
            begin
              Count := Count + 1;
              ColorArray[Gradient.Points.Count + Count - 1] :=
                MakeColor(Gradient.Points[Gradient.Points.Count - 1].IntColor,
                AOpacity);
              OffsetArray[Gradient.Points.Count + Count - 1] := 1;
            end;

            if Gradient.Style = TGradientStyle.gsLinear then
            begin
              { Linear }
              FGPPenBrush := TGPLinearGradientBrush.Create
                (MakePoint(ARect.Left + Gradient.StartPosition.X * ARect.Width,
                ARect.Top + Gradient.StartPosition.y * ARect.Height),
                MakePoint(ARect.Left + Gradient.StopPosition.X * ARect.Width,
                ARect.Top + Gradient.StopPosition.y * ARect.Height),
                Color, Color);
              TGPLinearGradientBrush(FGPPenBrush).SetWrapMode(WrapModeTileFlipX);
              TGPLinearGradientBrush(FGPPenBrush).SetInterpolationColors
                (PGPColor(@ColorArray), PSingle(@OffsetArray),
                Gradient.Points.Count + Count);
            end
            else
            begin
              { Radial }
              P := TGPGraphicsPath.Create;
              P.AddEllipse(GPRectFromRect(ARect));
              FGPPenBrush := TGPPathGradientBrush.Create(P);
              P.Free;
              with Gradient.RadialTransform do
                M := TGPMatrix.Create(Matrix.m11, Matrix.m12, Matrix.m21,
                  Matrix.m22, Matrix.m31, Matrix.m32);
              TGPPathGradientBrush(FGPPenBrush).SetTransform(M);
              M.Free;
              TGPPathGradientBrush(FGPPenBrush).SetWrapMode(WrapModeClamp);
              TGPPathGradientBrush(FGPPenBrush).SetInterpolationColors
                (PARGB(@ColorArray), PSingle(@OffsetArray),
                Gradient.Points.Count + Count);
            end;
          end
          else
            FGPPenBrush := TGPSolidBrush.Create(MakeColor(Color, AOpacity));
        end;
      TBrushKind.bkGrab:
        begin
          FGPPenBrush := TGPSolidBrush.Create($00000000);
        end;
      TBrushKind.bkBitmap:
        begin
          if (Bitmap.Bitmap <> nil) and (Bitmap.Bitmap.Width > 0) and
            (Bitmap.Bitmap.Height > 0) then
          begin
            UpdateBitmapHandle(Bitmap.Bitmap);
            if (Bitmap.Bitmap.HandleExists(Self)) then
            begin
              if Bitmap.WrapMode <> TWrapMode.wmTileStretch then
                FGPPenBrush := TGPTextureBrush.Create
                  (TGPBitmap(Bitmap.Bitmap.Handles[Self]),
                  Winapi.GDIPAPI.TWrapMode(Bitmap.WrapMode))
              else
              begin
                FGPPenBrush := TGPTextureBrush.Create
                  (TGPBitmap(Bitmap.Bitmap.Handles[Self]),
                  WrapModeClamp);
                TGPTextureBrush(FGPPenBrush)
                  .ScaleTransform(RectWidth(ARect) / Bitmap.Bitmap.Width,
                  RectHeight(ARect) / Bitmap.Bitmap.Height);
              end;
            end
            else
              FGPPenBrush := TGPSolidBrush.Create($00000000);
          end
          else
            FGPPenBrush := TGPSolidBrush.Create($00000000);
        end;
    else
      FGPPenBrush := TGPSolidBrush.Create($00000000);
    end;
  end;

  FGPPen := TGPPen.Create(FGPPenBrush);
  case StrokeCap of
    TStrokeCap.scFlat:
      FGPPen.SetLineCap(LineCapFlat, LineCapFlat, DashCapFlat);
    TStrokeCap.scRound:
      FGPPen.SetLineCap(LineCapRound, LineCapRound, DashCapRound);
  end;
  if Length(FDash) > 0 then
  begin
    FGPPen.SetDashOffset(FDashOffset);
    FGPPen.SetDashPattern(@FDash[0], Length(FDash));
  end
  else
    FGPPen.SetDashStyle(DashStyleSolid);
  case StrokeJoin of
    TStrokeJoin.sjMiter:
      FGPPen.SetLineJoin(LineJoinMiter);
    TStrokeJoin.sjRound:
      FGPPen.SetLineJoin(LineJoinRound);
    TStrokeJoin.sjBevel:
      FGPPen.SetLineJoin(LineJoinBevel);
  end;
  FGPPen.SetWidth(StrokeThickness);
end;

procedure TCanvasGdiPlus.FontChanged(Sender: TObject);
begin
  FreeAndNil(FGPFamily);
  FGPFamily := TGPFontFamily.Create(FFont.Family, FFontCollection);
  if not FGPFamily.IsAvailable then
  begin
    FGPFamily.Free;
    FGPFamily := TGPFontFamily.Create(FFont.Family);
    if not FGPFamily.IsAvailable then
    begin
      FGPFamily.Free;
      FGPFamily := TGPFontFamily.GenericSansSerif.Clone;
    end
  end;
end;

procedure TCanvasGdiPlus.DrawLine(const APt1, APt2: TPointF;
  const AOpacity: Single);
begin
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(RectF(APt1.X, APt1.y, APt2.X, APt2.y), AOpacity);
    FGPGraphics.DrawLine(FGPPen, APt1.X, APt1.y, APt2.X, APt2.y);
  end;
end;

procedure TCanvasGdiPlus.IntFillRect(R: TRectF; Opacity: Single);
var
  State: TCanvasSaveState;
  GPR: TGPRectF;
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
        FGPGraphics.IntersectClip(GPRectFromRect(R));
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
      FGPGraphics.FillRectangle(FGPBrush, GPRectFromRect(R));
    end;
  end;
end;

procedure TCanvasGdiPlus.IntFillPath(P: TGPGraphicsPath; R: TRectF; Opacity: Single);
var
  State: TCanvasSaveState;
  Rg: TGPRegion;
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
        Rg := TGPRegion.Create(P);
        FGPGraphics.IntersectClip(Rg);
        Rg.Free;
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
      FGPGraphics.FillPath(FGPBrush, P);
    end;
  end;
end;

procedure TCanvasGdiPlus.DrawRect(const ARect: TRectF;
  const XRadius, YRadius: Single; const ACorners: TCorners;
  const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound);
var
  Path: TGPGraphicsPath;
  x1, x2, y1, y2: Single;
  R: TRectF;
begin
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    R := ARect;
    ApplyStroke(R, AOpacity);
    if (XRadius < Epsilon) and (YRadius < Epsilon) then
    begin
      FGPGraphics.DrawRectangle(FGPPen, GPRectFromRect(R));
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
      Path := TGPGraphicsPath.Create;
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Left, R.Top + y1, R.Left + x1, R.Top);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Left, R.Top + y1, R.Left + x2, R.Top + y1,
              R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Left, R.Top + y1, R.Left + x2, R.Top + y1);
              Path.AddLine(R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2);
              Path.AddLine(R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
            end;
        else
          Path.AddBezier(R.Left, R.Top + y1, R.Left, R.Top + (y2), R.Left + x2,
            R.Top, R.Left + x1, R.Top)
        end;
      end
      else
      begin
        Path.AddLine(R.Left, R.Top + y1, R.Left, R.Top);
        Path.AddLine(R.Left, R.Top, R.Left + x1, R.Top);
      end;
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Right - x1, R.Top, R.Right, R.Top + y1);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Right - x1, R.Top, R.Right - x1, R.Top + y2,
              R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Right - x1, R.Top, R.Right - x1, R.Top + y2);
              Path.AddLine(R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1);
              Path.AddLine(R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
            end;
        else
          Path.AddBezier(R.Right - x1, R.Top, R.Right - x2, R.Top, R.Right,
            R.Top + (y2), R.Right, R.Top + y1)
        end;
      end
      else
      begin
        Path.AddLine(R.Right - x1, R.Top, R.Right, R.Top);
        Path.AddLine(R.Right, R.Top, R.Right, R.Top + y1);
      end;
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Right, R.Bottom - y1, R.Right - x1, R.Bottom);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Right, R.Bottom - y1, R.Right - x2, R.Bottom - y1,
              R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Right, R.Bottom - y1, R.Right - x2, R.Bottom - y1);
              Path.AddLine(R.Right - x2, R.Bottom - y1, R.Right - x1,
                R.Bottom - y2);
              Path.AddLine(R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
            end;
        else
          Path.AddBezier(R.Right, R.Bottom - y1, R.Right, R.Bottom - (y2),
            R.Right - x2, R.Bottom, R.Right - x1, R.Bottom)
        end;
      end
      else
      begin
        Path.AddLine(R.Right, R.Bottom - y1, R.Right, R.Bottom);
        Path.AddLine(R.Right, R.Bottom, R.Right - x1, R.Bottom);
      end;
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Left + x1, R.Bottom, R.Left, R.Bottom - y1);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Left + x1, R.Bottom, R.Left + x1, R.Bottom - y2,
              R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Left + x1, R.Bottom, R.Left + x1, R.Bottom - y2);
              Path.AddLine(R.Left + x1, R.Bottom - y2, R.Left + x2,
                R.Bottom - y1);
              Path.AddLine(R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
            end;
        else
          Path.AddBezier(R.Left + x1, R.Bottom, R.Left + x2, R.Bottom, R.Left,
            R.Bottom - (y2), R.Left, R.Bottom - y1)
        end;
      end
      else
      begin
        Path.AddLine(R.Left + x1, R.Bottom, R.Left, R.Bottom);
        Path.AddLine(R.Left, R.Bottom, R.Left, R.Bottom - y1);
      end;
{$IFDEF FLATTEN}
      Path.Flatten();
{$ENDIF}
      Path.CloseFigure;
      FGPGraphics.DrawPath(FGPPen, Path);
      Path.Free;
    end;
  end;
end;

procedure TCanvasGdiPlus.FillRect(const ARect: TRectF;
  const XRadius, YRadius: Single; const ACorners: TCorners;
  const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound);
var
  Path: TGPGraphicsPath;
  x1, x2, y1, y2: Single;
  R: TRectF;
begin
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    R := ARect;
    if ((XRadius = 0) and (YRadius = 0)) or (ACorners = []) then
    begin
      IntFillRect(R, AOpacity);
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
      Path := TGPGraphicsPath.Create;
      if TCorner.crTopLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Left, R.Top + y1, R.Left + x1, R.Top);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Left, R.Top + y1, R.Left + x2, R.Top + y1,
              R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Left, R.Top + y1, R.Left + x2, R.Top + y1);
              Path.AddLine(R.Left + x2, R.Top + y1, R.Left + x1, R.Top + y2);
              Path.AddLine(R.Left + x1, R.Top + y2, R.Left + x1, R.Top);
            end;
        else
          Path.AddBezier(R.Left, R.Top + y1, R.Left, R.Top + (y2), R.Left + x2,
            R.Top, R.Left + x1, R.Top)
        end;
      end
      else
      begin
        Path.AddLine(R.Left, R.Top + y1, R.Left, R.Top);
        Path.AddLine(R.Left, R.Top, R.Left + x1, R.Top);
      end;
      if TCorner.crTopRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Right - x1, R.Top, R.Right, R.Top + y1);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Right - x1, R.Top, R.Right - x1, R.Top + y2,
              R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Right - x1, R.Top, R.Right - x1, R.Top + y2);
              Path.AddLine(R.Right - x1, R.Top + y2, R.Right - x2, R.Top + y1);
              Path.AddLine(R.Right - x2, R.Top + y1, R.Right, R.Top + y1);
            end;
        else
          Path.AddBezier(R.Right - x1, R.Top, R.Right - x2, R.Top, R.Right,
            R.Top + (y2), R.Right, R.Top + y1)
        end;
      end
      else
      begin
        Path.AddLine(R.Right - x1, R.Top, R.Right, R.Top);
        Path.AddLine(R.Right, R.Top, R.Right, R.Top + y1);
      end;
      if TCorner.crBottomRight in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Right, R.Bottom - y1, R.Right - x1, R.Bottom);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Right, R.Bottom - y1, R.Right - x2, R.Bottom - y1,
              R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Right, R.Bottom - y1, R.Right - x2, R.Bottom - y1);
              Path.AddLine(R.Right - x2, R.Bottom - y1, R.Right - x1,
                R.Bottom - y2);
              Path.AddLine(R.Right - x1, R.Bottom - y2, R.Right - x1, R.Bottom);
            end;
        else
          Path.AddBezier(R.Right, R.Bottom - y1, R.Right, R.Bottom - (y2),
            R.Right - x2, R.Bottom, R.Right - x1, R.Bottom)
        end;
      end
      else
      begin
        Path.AddLine(R.Right, R.Bottom - y1, R.Right, R.Bottom);
        Path.AddLine(R.Right, R.Bottom, R.Right - x1, R.Bottom);
      end;
      if TCorner.crBottomLeft in ACorners then
      begin
        case ACornerType of
          // ctRound - default
          TCornerType.ctBevel:
            Path.AddLine(R.Left + x1, R.Bottom, R.Left, R.Bottom - y1);
          TCornerType.ctInnerRound:
            Path.AddBezier(R.Left + x1, R.Bottom, R.Left + x1, R.Bottom - y2,
              R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
          TCornerType.ctInnerLine:
            begin
              Path.AddLine(R.Left + x1, R.Bottom, R.Left + x1, R.Bottom - y2);
              Path.AddLine(R.Left + x1, R.Bottom - y2, R.Left + x2,
                R.Bottom - y1);
              Path.AddLine(R.Left + x2, R.Bottom - y1, R.Left, R.Bottom - y1);
            end;
        else
          Path.AddBezier(R.Left + x1, R.Bottom, R.Left + x2, R.Bottom, R.Left,
            R.Bottom - (y2), R.Left, R.Bottom - y1)
        end;
      end
      else
      begin
        Path.AddLine(R.Left + x1, R.Bottom, R.Left, R.Bottom);
        Path.AddLine(R.Left, R.Bottom, R.Left, R.Bottom - y1);
      end;
{$IFDEF FLATTEN}
      Path.Flatten();
{$ENDIF}
      Path.CloseFigure;
      IntFillPath(Path, ARect, AOpacity);
      Path.Free;
    end;
  end;
end;

procedure TCanvasGdiPlus.DrawEllipse(const ARect: TRectF;
  const AOpacity: Single);
var
  R: TRectF;
  P: TGPGraphicsPath;
begin
  if FStroke.Kind <> TBrushKind.bkNone then
  begin
    ApplyStroke(ARect, AOpacity);
    R := RectF(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
    FGPGraphics.DrawEllipse(FGPPen, GPRectFromRect(R));
  end;
end;

procedure TCanvasGdiPlus.FillEllipse(const ARect: TRectF;
  const AOpacity: Single);
var
  R: TRectF;
  P: TGPGraphicsPath;
begin
  if FFill.Kind <> TBrushKind.bkNone then
  begin
    P := TGPGraphicsPath.Create();
    R := RectF(ARect.Left, ARect.Top, ARect.Right - ARect.Left,
      ARect.Bottom - ARect.Top);
    P.AddEllipse(R.Left, R.Top, R.Right, R.Bottom);
    IntFillPath(P, R, AOpacity);
    P.Free;
  end;
end;

function TCanvasGdiPlus.LoadFontFromStream(AStream: TStream): Boolean;
var
  Stream: TMemoryStream;
begin
  if FFontCollection = nil then
    FFontCollection := TGPPrivateFontCollection.Create;
  Stream := TMemoryStream.Create;
  Stream.CopyFrom(AStream, AStream.Size);
  FFontCollection.AddMemoryFont(Stream.Memory, Stream.Size);
  Stream.Free;
end;

procedure TCanvasGdiPlus.FillText(const ARect: TRectF;
  const AText: WideString; const WordWrap: Boolean; const AOpacity: Single;
  const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
  const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  State: GraphicsState;
  StringFormat: TGPStringFormat;
  Font: TGPFont;
  R: TRectF;
begin
  if (FFill.Kind <> TBrushKind.bkNone) and (AText <> '') then
  begin
    StringFormat := TGPStringFormat.Create(StringFormatFlagsNoClip);
    StringFormat.SetTrimming(StringTrimmingNone);
    if not WordWrap then
      StringFormat.SetFormatFlags(StringFormat.GetFormatFlags or
        StringFormatFlagsNoWrap);
    if TFillTextFlag.ftRightToLeft in Flags then
      StringFormat.SetFormatFlags(StringFormat.GetFormatFlags or
        StringFormatFlagsDirectionRightToLeft);
    if not FGPFamily.IsStyleAvailable(vgStyleToGPStyle(FFont.Style)) then
    begin
      Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale), 0);
      if Font = nil then
        Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale),
          vgStyleToGPStyle(FFont.Style));
    end
    else
      Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale),
        vgStyleToGPStyle(FFont.Style), UnitPoint);
    // formating
    case ATextAlign of
      TTextAlign.taCenter:
        begin
          StringFormat.SetAlignment(StringAlignmentCenter);
        end;
      TTextAlign.taLeading:
        begin
          StringFormat.SetAlignment(StringAlignmentNear);
        end;
      TTextAlign.taTrailing:
        begin
          StringFormat.SetAlignment(StringAlignmentFar);
        end;
    end;
    case AVTextAlign of
      TTextAlign.taCenter:
        begin
          StringFormat.SetLineAlignment(StringAlignmentCenter);
        end;
      TTextAlign.taLeading:
        begin
          StringFormat.SetLineAlignment(StringAlignmentNear);
        end;
      TTextAlign.taTrailing:
        begin
          StringFormat.SetLineAlignment(StringAlignmentFar);
        end;
    end;
    // calc correct rect
    if AOpacity = 1 then
      ApplyFill(ARect, AOpacity * 0.99)
    else
      ApplyFill(ARect, AOpacity);

    State := FGPGraphics.Save;
    try
      FGPGraphics.IntersectClip(MakeRect(ARect.Left, ARect.Top, ARect.Right - ARect.Left, ARect.Bottom - ARect.Top));
      FGPGraphics.DrawString(AText, -1, Font, GPRectFromRect(ARect), StringFormat, FGPBrush);
    finally
      FGPGraphics.Restore(State);
    end;
    Font.Free;
    StringFormat.Free;
  end;
end;

procedure TCanvasGdiPlus.MeasureText(var ARect: TRectF;
  const AText: WideString; const WordWrap: Boolean;
  const Flags: TFillTextFlags; const ATextAlign, AVTextAlign: TTextAlign);
var
  StringFormat: TGPStringFormat;
  Font: TGPFont;
  GR: TGPRectF;
  SaveRect: TRectF;
  charRanges: array [0 .. 2] of TCharacterRange;
  pCharRangeRegions: array of TGPRegion;
  I, Count: Integer;
  B: TGPBitmap;
  G: TGPGraphics;
{$IFDEF CPUX64}
  SavedExceptionMask: TSSEExceptionMask;
{$ENDIF CPUX64}
begin
  if not WordWrap then
    ARect.Right := ARect.Left;
  if Length(AText) = 0 then
    Exit;

  B := nil;
  try
    SaveRect := ARect;
    if FGPGraphics = nil then
    begin
      B := TGPBitmap.Create(1, 1, PixelFormat32bppARGB);
      try
        G := TGPGraphics.Create(B);
        try
          G.SetSmoothingMode(SmothingDefault);
          G.SetInterpolationMode(InterpolationModeHighQuality);
          G.SetPixelOffsetMode(PixelOffsetModeHalf);
          G.SetTextContrast(TextContrast);
          if GlobalUseGDIPlusClearType then
            G.SetTextRenderingHint(TextRenderingHintClearTypeGridFit)
          else
            G.SetTextRenderingHint(TextRenderingHintAntiAlias);
        except
          G.Free;
          raise;
        end;
      except
        B.Free;
        raise;
      end;
      FGPGraphics := G;
    end
    else
      G := nil;

    StringFormat := TGPStringFormat.Create(StringFormatFlagsMeasureTrailingSpaces or StringFormatFlagsNoClip);
    try
      StringFormat.SetTrimming(StringTrimmingNone);
      if not WordWrap then
        StringFormat.SetFormatFlags(StringFormat.GetFormatFlags or
          StringFormatFlagsNoWrap);
      if TFillTextFlag.ftRightToLeft in Flags then
        StringFormat.SetFormatFlags(StringFormat.GetFormatFlags or
          StringFormatFlagsDirectionRightToLeft);
      { measure rect height }
      Font := nil;
      try
        if not FGPFamily.IsStyleAvailable(vgStyleToGPStyle(FFont.Style)) then
        begin
          Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale), 0);
          if Font = nil then
            Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale),
              vgStyleToGPStyle(FFont.Style));
        end
        else
          Font := TGPFont.Create(FGPFamily, (FFont.Size * 0.75 * FFontScale),
            vgStyleToGPStyle(FFont.Style), UnitPoint);
        // formating
        case ATextAlign of
          TTextAlign.taCenter:
            begin
              StringFormat.SetAlignment(StringAlignmentCenter);
            end;
          TTextAlign.taLeading:
            begin
              StringFormat.SetAlignment(StringAlignmentNear);
            end;
          TTextAlign.taTrailing:
            begin
              StringFormat.SetAlignment(StringAlignmentFar);
            end;
        end;
        case AVTextAlign of
          TTextAlign.taCenter:
            begin
              StringFormat.SetLineAlignment(StringAlignmentCenter);
            end;
          TTextAlign.taLeading:
            begin
              StringFormat.SetLineAlignment(StringAlignmentNear);
            end;
          TTextAlign.taTrailing:
            begin
              StringFormat.SetLineAlignment(StringAlignmentFar);
            end;
        end;
        // set char range
        charRanges[0] := MakeCharacterRange(0, Length(AText));
        StringFormat.SetMeasurableCharacterRanges(1, @charRanges);
        Count := StringFormat.GetMeasurableCharacterRangeCount;
        SetLength(pCharRangeRegions, Count);
        if Count > 0 then
          for I := 0 to Count - 1 do
            pCharRangeRegions[I] := TGPRegion.Create;
        // measure
{$IFDEF CPUX64}
        SavedExceptionMask := GetSSEExceptionMask;
        SetSSEExceptionMask(exAllArithmeticExceptions);
        try
{$ENDIF CPUX64}
          FGPGraphics.MeasureCharacterRanges(AText, -1, Font, GPRectFromRect(ARect),
            StringFormat, Count, pCharRangeRegions);
{$IFDEF CPUX64}
        finally
          SetSSEExceptionMask(SavedExceptionMask); // restore SSE's exception mask.
        end;
{$ENDIF CPUX64}
        for I := 0 to Count - 1 do
        begin
          pCharRangeRegions[I].GetBounds(GR, FGPGraphics);
          if I = 0 then
            ARect := RectF(GR.X, GR.y, GR.X + GR.Width, GR.y + GR.Height)
          else
            ARect := UnionRect(ARect, RectF(GR.X, GR.y, GR.X + GR.Width,
              GR.y + GR.Height));
        end;

        if Count > 0 then
          for I := 0 to Count - 1 do
            pCharRangeRegions[I].Free;
        SetLength(pCharRangeRegions, 0);
      finally
        Font.Free;
      end;
      if ATextAlign = TTextAlign.taLeading then
        ARect.Left := SaveRect.Left;
      if AVTextAlign = TTextAlign.taLeading then
        ARect.Top := SaveRect.Top;
    finally
      StringFormat.Free;
    end;
  finally
    if G <> nil then
    begin
      B.Free;
      G.Free;
      FGPGraphics := nil;
    end;
  end;
end;

function TCanvasGdiPlus.TextToPath(Path: TPathData; const ARect: TRectF;
  const AText: WideString; const WordWrap: Boolean; const ATextAlign: TTextAlign;
  const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean;
var
  StringFormat: TGPStringFormat;
  GPPath: TGPGraphicsPath;
  bmp: TGPBitmap;
  Graphics: TGPGraphics;
  bits: cardinal;
  I: Integer;
  SP, CP1, CP2: TPointF;
  Data: Winapi.GDIPAPI.TPathData;
  SavePoints: PGPPointF;
begin
  Result := False;
  if (AText <> '') then
  begin
    if not FGPFamily.IsStyleAvailable(vgStyleToGPStyle(FFont.Style)) then
      Exit;

    Path.Clear;
    bmp := TGPBitmap.Create(1, 1, 1 * 4, PixelFormat32bppARGB, @bits);
    Graphics := TGPGraphics.Create(bmp);

    StringFormat := TGPStringFormat.Create(0);
    StringFormat.SetTrimming(StringTrimmingNone);
    if not WordWrap then
      StringFormat.SetFormatFlags(StringFormat.GetFormatFlags or
        StringFormatFlagsNoWrap or StringFormatFlagsMeasureTrailingSpaces);
    GPPath := TGPGraphicsPath.Create;
    // formating
    case ATextAlign of
      TTextAlign.taCenter:
        begin
          StringFormat.SetAlignment(StringAlignmentCenter);
        end;
      TTextAlign.taLeading:
        begin
          StringFormat.SetAlignment(StringAlignmentNear);
        end;
      TTextAlign.taTrailing:
        begin
          StringFormat.SetAlignment(StringAlignmentFar);
        end;
    end;
    case AVTextAlign of
      TTextAlign.taCenter:
        begin
          StringFormat.SetLineAlignment(StringAlignmentCenter);
        end;
      TTextAlign.taLeading:
        begin
          StringFormat.SetLineAlignment(StringAlignmentNear);
        end;
      TTextAlign.taTrailing:
        begin
          StringFormat.SetLineAlignment(StringAlignmentFar);
        end;
    end;
    // path
    GPPath.AddString(AText, -1, FGPFamily, vgStyleToGPStyle(FFont.Style),
      FFont.Size, GPRectFromRect(ARect), StringFormat);
    // expand path
    Data := Winapi.GDIPAPI.TPathData.Create;
    GPPath.GetPathData(Data);
    SavePoints := Data.Points;
    // calc size
    I := 0;
    while I < Data.Count do
    begin
      if PByteArray(Data.Types)[I] = Integer(PathPointTypeStart) then
      begin
        SP := PointF(Data.Points^.X, Data.Points^.y);
        Path.MoveTo(PointF(Data.Points^.X, Data.Points^.y));
      end;
      if PByteArray(Data.Types)[I] and Integer(PathPointTypeBezier) = Integer(PathPointTypeBezier) then
      begin
        CP1 := PointF(Data.Points^.X, Data.Points^.y);
        Inc(I);
        Inc(Data.Points);
        CP2 := PointF(Data.Points^.X, Data.Points^.y);
        Inc(I);
        Inc(Data.Points);
        Path.CurveTo(CP1, CP2, PointF(Data.Points^.X, Data.Points^.y));
      end;
      if PByteArray(Data.Types)[I] and Integer(PathPointTypeLine) = Integer(PathPointTypeLine) then
      begin
        Path.LineTo(PointF(Data.Points^.X, Data.Points^.y));
      end;
      if PByteArray(Data.Types)[I] and Integer(PathPointTypeCloseSubpath) = Integer(PathPointTypeCloseSubpath) then
      begin
        Path.ClosePath;
      end;
      Inc(I);
      Inc(Data.Points);
    end;
    Result := True;
    //
    Data.Points := SavePoints;
    Data.Free;
    StringFormat.Free;
    GPPath.Free;

    // free
    Graphics.Free;
    bmp.Free;
  end
  else
    Result := False;
end;

{ Bitmaps }

procedure TCanvasGdiPlus.DrawThumbnail(const ABitmap: TBitmap;
  const Width, Height: Single);
var
  scale: Single;
  graphics: TGPGraphics;
begin
  UpdateBitmapHandle(ABitmap);
  if not ABitmap.HandleExists(Self) then
    Exit;
  scale := Width / ABitmap.Width;
  if FBitmap <> nil then
  begin
    FGPGraphics.ScaleTransform(scale, scale);
    FGPGraphics.DrawImage(TGPBitmap(ABitmap.Handles[Self]), 0, 0,
      ABitmap.Width, ABitmap.Height);
  end;
end;

procedure TCanvasGdiPlus.DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF;
  const AOpacity: Single; const HighSpeed: Boolean = False);
var
  CM: TColorMatrix;
  ImageAttributes: TGPImageAttributes;
  Pts: array [1 .. 4] of TPointF;
begin
  if HighSpeed then
    FGPGraphics.SetInterpolationMode(InterpolationModeNearestNeighbor)
  else
    FGPGraphics.SetInterpolationMode(InterpolationModeHighQuality);
  if (AOpacity < 1) then
  begin
    if (AOpacity = 0) then
      Exit;
    CM := imgColorMatrix;
    CM[3][3] := AOpacity;
    UpdateBitmapHandle(ABitmap);
    if not ABitmap.HandleExists(Self) then
      Exit;
    ImageAttributes := TGPImageAttributes.Create;
    ImageAttributes.SetColorMatrix(CM, ColorMatrixFlagsDefault,
      ColorAdjustTypeBitmap);
    FGPGraphics.DrawImage(TGPBitmap(ABitmap.Handles[Self]),
      MakeRect(DstRect.Left, DstRect.Top, DstRect.Right - DstRect.Left,
      DstRect.Bottom - DstRect.Top), SrcRect.Left, SrcRect.Top,
      SrcRect.Right - SrcRect.Left, SrcRect.Bottom - SrcRect.Top, UnitPixel,
      ImageAttributes);
    ImageAttributes.Free;
  end
  else
  begin
    UpdateBitmapHandle(ABitmap);
    if not ABitmap.HandleExists(Self) then
      Exit;
    FGPGraphics.DrawImage(TGPBitmap(ABitmap.Handles[Self]),
      MakeRect(DstRect.Left, DstRect.Top, DstRect.Right - DstRect.Left,
      DstRect.Bottom - DstRect.Top), SrcRect.Left, SrcRect.Top,
      SrcRect.Right - SrcRect.Left, SrcRect.Bottom - SrcRect.Top, UnitPixel);
  end;
end;

{ Path }

procedure TCanvasGdiPlus.DrawPath(const APath: TPathData; const AOpacity: Single);
var
  I: Integer;
  CP1, CP2, CP, SP: TPointF;
begin
  if not APath.IsEmpty then
  begin
    ApplyStroke(APath.GetBounds, AOpacity);
    I := 0;
    while I < APath.Count do
    begin
      case APath[I].Kind of
        TPathPointKind.ppMoveTo:
          begin
            CP := APath[I].Point;
            SP := CP;
          end;
        TPathPointKind.ppLineTo:
          begin
            FGPGraphics.DrawLine(FGPPen, CP.X, CP.y,
              APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppCurveTo:
          begin
            CP1 := APath[I].Point;
            Inc(I);
            CP2 := APath[I].Point;
            Inc(I);
            FGPGraphics.DrawBezier(FGPPen, CP.X, CP.y, CP1.X, CP1.y, CP2.X, CP2.y,
              APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppClose:
          begin
            FGPGraphics.DrawLine(FGPPen, CP.X, CP.y, SP.X, SP.y);
          end;
      end;
      Inc(I);
    end;
  end;
end;

procedure TCanvasGdiPlus.FillPath(const APath: TPathData; const AOpacity: Single);
var
  I: Integer;
  CP, CP1, CP2: TPointF;
  P: TGPGraphicsPath;
begin
  if not APath.IsEmpty then
  begin
    P := TGPGraphicsPath.Create;
    I := 0;
    while I < APath.Count do
    begin
      case APath[I].Kind of
        TPathPointKind.ppMoveTo:
          begin
            CP := APath[I].Point;
            P.StartFigure;
          end;
        TPathPointKind.ppLineTo:
          begin
            P.AddLine(CP.X, CP.Y, APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppCurveTo:
          begin
            CP1 := APath[I].Point;
            Inc(I);
            CP2 := APath[I].Point;
            Inc(I);
            P.AddBezier(CP.X, CP.Y, CP1.X, CP1.Y, CP2.X, CP2.Y, APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppClose:
          begin
            P.CloseFigure;
          end;
      end;
      Inc(I);
    end;
    IntFillPath(P, APath.GetBounds, AOpacity);
    P.Free;
  end;
end;

function TCanvasGdiPlus.PtInPath(const APoint: TPointF; const APath: TPathData): Boolean;
var
  I: Integer;
  B: TRectF;
  CP, CP1, CP2: TPointF;
  P: TGPGraphicsPath;
begin
  Result := False;
  B :=  APath.GetBounds;
  if not PointInRect(APoint, B) then
    Result := False
  else
  begin
    P := TGPGraphicsPath.Create;
    I := 0;
    while I < APath.Count do
    begin
      case APath[I].Kind of
        TPathPointKind.ppMoveTo:
          begin
            CP := APath[I].Point;
            P.StartFigure;
          end;
        TPathPointKind.ppLineTo:
          begin
            P.AddLine(CP.X, CP.Y, APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppCurveTo:
          begin
            CP1 := APath[I].Point;
            Inc(I);
            CP2 := APath[I].Point;
            Inc(I);
            P.AddBezier(CP.X, CP.Y, CP1.X, CP1.Y, CP2.X, CP2.Y, APath[I].Point.X, APath[I].Point.Y);
            CP := APath[I].Point;
          end;
        TPathPointKind.ppClose:
          begin
            P.CloseFigure;
          end;
      end;
      Inc(I);
    end;

    Result := P.IsVisible(APoint.X, APoint.y);

    P.Free;
  end;
end;

procedure TCanvasGdiPlus.UpdateBitmapHandle(ABitmap: TBitmap);
var
  BD: TBitmapData;
  j: Integer;
begin
  { update bitmap to GDI+ bitmap }
  if ABitmap = nil then
    Exit;
  if ABitmap.IsEmpty then
    Exit;
  { create - if need }
  if not ABitmap.HandleExists(Self) then
  begin
    ABitmap.HandleAdd(Self);
    ABitmap.Handles[Self] := TGPBitmap.Create(ABitmap.Width, ABitmap.Height, ABitmap.Width * 4,
      PixelFormat32bppPARGB, PBYTE(ABitmap.StartLine));
    ABitmap.HandlesNeedUpdate[Self] := False;
    ABitmap.AddFreeNotify(Self);
    FBitmaps.Add(ABitmap);
  end;
  { resize if need }
  if (ABitmap.Width <> TGPBitmap(ABitmap.Handles[Self]).GetWidth)
    or (ABitmap.Height <> TGPBitmap(ABitmap.Handles[Self]).GetHeight) then
  begin
    TGPBitmap(ABitmap.Handles[Self]).Destroy;
    ABitmap.Handles[Self] := TGPBitmap.Create(ABitmap.Width, ABitmap.Height, ABitmap.Width * 4,
      PixelFormat32bppPARGB, PBYTE(ABitmap.StartLine));
    ABitmap.HandlesNeedUpdate[Self] := False;
  end;
end;

procedure TCanvasGdiPlus.DestroyBitmapHandle(ABitmap: TBitmap);
begin
  if (ABitmap.HandleExists(Self)) then
  begin
    FBitmaps.Remove(ABitmap);
    ABitmap.RemoveFreeNotify(Self);
    TGPBitmap(ABitmap.Handles[Self]).Free;
    ABitmap.HandleRemove(Self);
  end;
end;

{ TD2DCanvasSaveState }

procedure TGDIPCanvasSaveState.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TCanvasGdiPlus then
    FState := TCanvasGdiPlus(Source).Graphics.Save;
end;

procedure TGDIPCanvasSaveState.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);
  if Dest is TCanvasGdiPlus then
    TCanvasGdiPlus(Dest).Graphics.Restore(FState);
end;

initialization
  DefaultBitmapCodecClass := TBitmapCodecGdiPlus;
  if DefaultCanvasClass = nil then
    DefaultCanvasClass := TCanvasGdiPlus;
  DefaultPrinterCanvasClass := TCanvasGdiPlus;
end.
