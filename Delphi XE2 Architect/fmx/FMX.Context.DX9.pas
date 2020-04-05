{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Context.DX9;

{$I FMX.Defines.inc}

interface

uses                                                         
  Winapi.Direct3D9, FMX.Types3D;

type
  TCustomDirectXContext = class(TContext3D)
  protected
    FDevice: IDirect3DDevice9;
  public
    property Device: IDirect3DDevice9 read FDevice;
  end;

var
  Direct3D9Obj: IDirect3D9 = nil;

implementation

uses
  Winapi.Windows, Winapi.DXTypes, System.Win.ComObj, System.Types, System.UITypes, System.SysUtils, System.Classes,
  FMX.Types, FMX.Forms, FMX.Platform.Win;

var
  VBSize: Integer = $FFFF * 32;
  IBSize: Integer = $FFFF * 2 * 2;

type

{ TDirectXContext }

  TDirectXContext = class(TCustomDirectXContext)
  private class var
    FIsVistaDevice: Boolean;
    FVistaShared: IDirect3DDevice9Ex;
    FVistaVB: IDirect3DVertexBuffer9;
    FVistaIB: IDirect3DIndexBuffer9;
    FVistaVBPtr: THandle;
    FVistaIBPtr: THandle;
    FVistaVBLockPos: Integer;
    FVistaIBLockPos: Integer;
  private
    FPresentParams: TD3DPresentParameters;
    FSample: TD3DMultiSampleType;
    FLightCount: Integer;
    FVB: IDirect3DVertexBuffer9;
    FIB: IDirect3DIndexBuffer9;
    VBLockPos, IBLockPos: Integer;
    FAllowSample, FAllowSample4: Boolean;
    { window buffer - for layer }
    FBitmapInfo: TBitmapInfo;
    FBufferBitmap: THandle;
    FShaders: IInterfaceList;
    { buffer }
    FSysMemBuf, FColorBuf, FColorBuf2, FDepthBuf: IDirect3DSurface9;
    FColorBufTex: IDirect3DTexture9;
    function GetPresentParameters(FmxHandle: TFmxHandle): TD3DPresentParameters; overload; inline;
    function GetPresentParameters(Wnd: HWnd): TD3DPresentParameters; overload;
    function AddShader(const Shader: IInterface): TContextShader;
    procedure RemoveShader(Shader: TContextShader);
    function ShaderToVertexShader(Shader: TContextShader): IDirect3DVertexShader9;
    function ShaderToPixelShader(Shader: TContextShader): IDirect3DPixelShader9;
    function ValidBuffers(const Vertices: TVertexBuffer; const Indices: TIndexBuffer): Boolean;
  protected
    procedure ApplyContextState(AState: TContextState); override;
    function GetPixelToPixelPolygonOffset: TPointF; override;
    { Bitmaps }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); override;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); override;
    { Assign }
    procedure AssignToBitmap(Dest: TBitmap); override;
    function GetValid: Boolean; override;
  public
    constructor CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
    { buffer }
    procedure CreateBuffer; override;
    procedure Resize; override;
    procedure FreeBuffer; override;
    { scene }
    function DoBeginScene: Boolean; override;
    procedure DoEndScene(const CopyTarget: Boolean = True); override;
    { low-level }
    procedure SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix); override;
    procedure SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap); override;
    procedure SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil); override;
    procedure SetStencilOp(const Fail, ZFail, ZPass: TStencilOp); override;
    procedure SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal); override;
    procedure Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal); override;
    procedure DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    procedure DrawTrianglesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    procedure DrawTrianglesFan(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    procedure DrawLinesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    procedure DrawLinesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    procedure DrawPointsList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); override;
    { vertex shaders }
    function CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader; override;
    procedure DestroyVertexShader(const Shader: TContextShader); override;
    procedure SetVertexShader(const Shader: TContextShader); override;
    procedure SetVertexShaderVector(Index: Integer; const V: TVector3D); override;
    procedure SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D); override;
    { pixel shader }
    function CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader; override;
    procedure DestroyPixelShader(const Shader: TContextShader); override;
    procedure SetPixelShader(const Shader: TContextShader); override;
    procedure SetPixelShaderVector(Index: Integer; const V: TVector3D); override;
    procedure SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D); override;
  end;

var
  IsVistaDevice: Boolean = False;
  VistaShared: IDirect3DDevice9Ex = nil;
  VistaVB: IDirect3DVertexBuffer9 = nil;
  VistaIB: IDirect3DIndexBuffer9 = nil;
  VistaVBPtr: THandle = 0;
  VistaIBPtr: THandle = 0;
  VistaVBLockPos: Integer = 0;
  VistaIBLockPos: Integer = 0;

function ColorToD3DColor(const AColor: TAlphaColor): TD3DColorValue;
begin
  Result.r := TAlphaColorRec(AColor).r / $FF;
  Result.g := TAlphaColorRec(AColor).g / $FF;
  Result.b := TAlphaColorRec(AColor).b / $FF;
  Result.a := TAlphaColorRec(AColor).a / $FF;
end;

function makeD3DVector(const V: TVector3D): TD3DVector;
begin
  Result.X := V.X;
  Result.Y := V.Y;
  Result.Z := V.Z;
end;

function D3DMatrix(M: TMatrix3D): TD3DMatrix;
begin
  Result := TD3DMatrix(M);
end;

function CheckVistaDevice: Boolean;
var
  L: THandle;
begin
  L := LoadLibrary('d3d9.dll');
  try
    IsVistaDevice := GetProcAddress(L, 'Direct3DCreate9Ex') <> nil;
    Result := IsVistaDevice;
  finally
    FreeLibrary(L);
  end;
end;

{ TDirectXContext }

procedure CalcMaxBitmapSize;
var
  Caps: TD3DCaps9;
begin
  { Create device }
  if Direct3D9Obj = nil then
  begin
    if CheckVistaDevice then
    begin
      Direct3DCreate9Ex(D3D_SDK_VERSION, IDirect3D9Ex(Direct3D9Obj));
      if not Assigned(Direct3D9Obj) then
        Direct3D9Obj := IDirect3D9(_Direct3DCreate9(D3D_SDK_VERSION));
    end
    else
      Direct3D9Obj := IDirect3D9(_Direct3DCreate9(D3D_SDK_VERSION));
    if Direct3D9Obj <> nil then
    begin
      Direct3D9Obj.GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, Caps);
      MaxBitmapSize := Caps.MaxTextureWidth;
    end
    else
      GlobalUseHWEffects := False;
  end;
end;

procedure CreateVistaShared;
var
  PP: TD3DPresentParameters;
  Res: HResult;
  Caps: TD3DCaps9;
  VP: cardinal;
begin
  VistaVBPtr := 0;
  VistaIBPtr := 0;
  if not IsVistaDevice then Exit;
  if VistaShared <> nil then Exit;
  Exit;
  FillChar(PP, SizeOf(PP), 0);
  PP.hDeviceWindow := GetDesktopWindow;
  PP.Windowed := True;
  PP.BackBufferWidth := 2;
  PP.BackBufferHeight := 2;
  PP.BackBufferFormat := D3DFMT_A8R8G8B8;
  PP.BackBufferCount := 1;
  PP.EnableAutoDepthStencil := False;
  PP.SwapEffect := D3DSWAPEFFECT_DISCARD;
  PP.PresentationInterval := D3DPRESENT_INTERVAL_IMMEDIATE;

  Direct3D9Obj.GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, Caps);
  if (Caps.DevCaps and D3DDEVCAPS_HWTRANSFORMANDLIGHT = D3DDEVCAPS_HWTRANSFORMANDLIGHT) then
  begin
    if Caps.DevCaps and D3DDEVCAPS_PUREDEVICE = D3DDEVCAPS_PUREDEVICE then
      VP := D3DCREATE_PUREDEVICE or D3DCREATE_HARDWARE_VERTEXPROCESSING
    else
      VP := D3DCREATE_HARDWARE_VERTEXPROCESSING;
  end else
    VP := D3DCREATE_SOFTWARE_VERTEXPROCESSING;
  VP := VP or D3DCREATE_MULTITHREADED or D3DCREATE_FPU_PRESERVE;

  Res := IDirect3D9Ex(Direct3D9Obj).CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, 0, VP, @PP, nil, IDirect3DDevice9Ex(VistaShared));
  if Res <> S_OK then Exit;

  VistaShared.SetRenderTarget(0, nil);

{  Res := VistaShared.CreateVertexBuffer(VBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ,
    D3DPOOL_DEFAULT, VistaVB, @VistaVBPtr);
  Res := VistaShared.CreateIndexBuffer(IBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16,
    D3DPOOL_DEFAULT, VistaIB, @VistaIBPtr);}
end;

procedure DestroyVistaShared;
begin
  VistaVB := nil;
  VistaIB := nil;
  VistaShared := nil;
end;

{ TDirectXContext }

constructor TDirectXContext.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
  const AMultisample: TMultisample; const ADepthStencil: Boolean);
var
  Res: HResult;
  VP: cardinal;
  Caps: TD3DCaps9;
  Form: TCommonCustomForm;
begin
  CalcMaxBitmapSize;
  Form := FindWindow(FmxHandleToHWND(AParent));
  if (Form <> nil) and (Form.Transparency) then
    FBuffered := True;
  inherited;

  { Create Shared Device }
  CreateVistaShared;

  { Create device }
  if Direct3D9Obj <> nil then
  begin
    Direct3D9Obj.GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, Caps);
    if Caps.VS20Caps.NumTemps < 96 then
      VP := D3DCREATE_SOFTWARE_VERTEXPROCESSING
    else
      if (Caps.DevCaps and D3DDEVCAPS_HWTRANSFORMANDLIGHT = D3DDEVCAPS_HWTRANSFORMANDLIGHT) then
      begin
        if Caps.DevCaps and D3DDEVCAPS_PUREDEVICE = D3DDEVCAPS_PUREDEVICE then
          VP := D3DCREATE_PUREDEVICE or D3DCREATE_HARDWARE_VERTEXPROCESSING
        else
          VP := D3DCREATE_HARDWARE_VERTEXPROCESSING;
      end else
        VP := D3DCREATE_SOFTWARE_VERTEXPROCESSING;
    VP := VP or D3DCREATE_MULTITHREADED or D3DCREATE_FPU_PRESERVE;

    FAllowSample := Succeeded(Direct3D9Obj.CheckDeviceMultiSampleType(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, D3DFMT_A8R8G8B8, True, D3DMULTISAMPLE_2_SAMPLES, nil));
    FAllowSample4 := Succeeded(Direct3D9Obj.CheckDeviceMultiSampleType(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, D3DFMT_A8R8G8B8, True, D3DMULTISAMPLE_4_SAMPLES, nil));

    { Create device }
    FPresentParams := GetPresentParameters(Parent);
    if IsVistaDevice then
      Res := IDirect3D9Ex(Direct3D9Obj).CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, 0, VP, @FPresentParams, nil, IDirect3DDevice9Ex(FDevice));
    if not IsVistaDevice or Failed(Res) or (FDevice = nil) then
    begin
      IsVistaDevice := False;
      Res := Direct3D9Obj.CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, 0, VP, @FPresentParams, FDevice);
    end;
    if Failed(Res) then
    begin
      GlobalUseHWEffects := False;
      Exit;
    end;

  //  IDirect3DDevice9(FDevice).GetDeviceCaps(Caps);

    CreateBuffer;
  end;
end;

constructor TDirectXContext.CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
  const ADepthStencil: Boolean);
var
  Res: HResult;
  VP: cardinal;
  Caps: TD3DCaps9;
begin
  CalcMaxBitmapSize;
  inherited;
  { Create Shared Device }
  CreateVistaShared;

  { Create device }
  if Direct3D9Obj <> nil then
  begin
    Direct3D9Obj.GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, Caps);
    if Caps.VS20Caps.NumTemps < 96 then
      VP := D3DCREATE_SOFTWARE_VERTEXPROCESSING
    else
      if (Caps.DevCaps and D3DDEVCAPS_HWTRANSFORMANDLIGHT = D3DDEVCAPS_HWTRANSFORMANDLIGHT) then
      begin
        if Caps.DevCaps and D3DDEVCAPS_PUREDEVICE = D3DDEVCAPS_PUREDEVICE then
          VP := D3DCREATE_PUREDEVICE or D3DCREATE_HARDWARE_VERTEXPROCESSING
        else
          VP := D3DCREATE_HARDWARE_VERTEXPROCESSING;
      end else
        VP := D3DCREATE_SOFTWARE_VERTEXPROCESSING;
    VP := VP or D3DCREATE_MULTITHREADED or D3DCREATE_FPU_PRESERVE;

    FAllowSample := Succeeded(Direct3D9Obj.CheckDeviceMultiSampleType(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, D3DFMT_A8R8G8B8, True, D3DMULTISAMPLE_2_SAMPLES, nil));
    FAllowSample4 := Succeeded(Direct3D9Obj.CheckDeviceMultiSampleType(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, D3DFMT_A8R8G8B8, True, D3DMULTISAMPLE_4_SAMPLES, nil));

    { Create device }
    FPresentParams := GetPresentParameters(GetDesktopWindow);
    if IsVistaDevice then
      Res := IDirect3D9Ex(Direct3D9Obj).CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, 0, VP, @FPresentParams, nil, IDirect3DDevice9Ex(FDevice));
    if not IsVistaDevice or Failed(Res) or (FDevice = nil) then
    begin
      IsVistaDevice := False;
      Res := Direct3D9Obj.CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, 0, VP, @FPresentParams, FDevice);
    end;
    if Failed(Res) then
    begin
      GlobalUseHWEffects := False;
      Exit;
    end;
  //  IDirect3DDevice9(FDevice).GetDeviceCaps(Caps);

    CreateBuffer;
  end;
end;

function TDirectXContext.GetPresentParameters(FmxHandle: TFmxHandle): TD3DPresentParameters;
begin
  Result := GetPresentParameters(FmxHandleToHWND(FmxHandle));
end;

function TDirectXContext.GetPixelToPixelPolygonOffset: TPointF;
begin
  Result := PointF(-0.5, -0.5);
end;

function TDirectXContext.GetPresentParameters(Wnd: HWnd): TD3DPresentParameters;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.hDeviceWindow := Wnd;
  Result.Windowed := True;
  Result.BackBufferWidth := FWidth;
  Result.BackBufferHeight := FHeight;
  Result.BackBufferFormat := D3DFMT_A8R8G8B8;
  if FWidth = 0 then
    Result.BackBufferWidth := 2;
  if FHeight = 0 then
    Result.BackBufferHeight := 2;

  Result.BackBufferCount := 1;

  Result.EnableAutoDepthStencil := FDepthStencil;
  Result.AutoDepthStencilFormat := D3DFMT_D24S8; // D3DFMT_D16;

  Result.SwapEffect := D3DSWAPEFFECT_DISCARD;

  Result.PresentationInterval := D3DPRESENT_INTERVAL_IMMEDIATE;

  if (FMultisample = TMultisample.ms4Samples) and FAllowSample4 then
    Result.MultiSampleType := D3DMULTISAMPLE_4_SAMPLES
  else if (FMultisample in [TMultisample.ms2Samples, TMultisample.ms4Samples]) and FAllowSample then
    Result.MultiSampleType := D3DMULTISAMPLE_2_SAMPLES;
  FSample := Result.MultiSampleType;
end;

function TDirectXContext.GetValid: Boolean;
begin
  Result := FDevice <> nil;
end;

procedure TDirectXContext.CreateBuffer;
var
  Res: HResult;
  VP: cardinal;
  BackBuffer: IDirect3DSurface9;
  i, ModeCount: Integer;
  Mode, Mode1: TD3DDisplayMode;
  S: TContextState;
begin
  if Valid then
  begin
    { Create RenderTarget }
    if (FBitmap <> nil) then
    begin
      Res := FDevice.CreateRenderTarget(FBitmap.Width, FBitmap.Height, D3DFMT_A8R8G8B8, FSample, 0, False, FColorBuf, nil);
      FDevice.SetRenderTarget(0, FColorBuf);

      if FDepthStencil then
      begin
        Res := FDevice.CreateDepthStencilSurface(FBitmap.Width, FBitmap.Height, D3DFMT_D24S8, FSample, 0, True, FDepthBuf, nil);
        FDevice.SetDepthStencilSurface(FDepthBuf);
      end else
        FDevice.SetDepthStencilSurface(nil);

      Res := FDevice.CreateOffscreenPlainSurface(FBitmap.Width, FBitmap.Height, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, FSysMemBuf, nil);
      if FAILED(Res) then;

      if ((FMultisample = TMultisample.ms4Samples) and FAllowSample4) or ((FMultisample in [TMultisample.ms2Samples, TMultisample.ms4Samples]) and FAllowSample) then
        Res := FDevice.CreateRenderTarget(FWidth, FHeight, D3DFMT_A8R8G8B8, D3DMULTISAMPLE_NONE, 0, False, FColorBuf2, nil);
    end;

    if FBuffered then
    begin
      with FBitmapInfo.bmiHeader do
      begin
        biSize := SizeOf(TBitmapInfoHeader);
        biPlanes := 1;
        biBitCount := 32;
        biCompression := BI_RGB;
        biWidth := FWidth;
        if biWidth <= 0 then
          biWidth := 1;
        biHeight := -FHeight;
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
      { RenderTarget }
      Res := FDevice.CreateRenderTarget(FWidth, FHeight, D3DFMT_A8R8G8B8, FSample, 0, False, FColorBuf, nil);
      FAILED(FDevice.SetRenderTarget(0, FColorBuf));

      if FDepthStencil then
      begin
        Res := FDevice.CreateDepthStencilSurface(FWidth, FHeight, D3DFMT_D24S8, FSample, 0, True, FDepthBuf, nil);
        FAILED(FDevice.SetDepthStencilSurface(FDepthBuf));
      end
      else
        FAILED(FDevice.SetDepthStencilSurface(nil));

      Res := FDevice.CreateOffscreenPlainSurface(FWidth, FHeight, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, FSysMemBuf, nil);
      if FAILED(Res) then;

      if ((FMultisample = TMultisample.ms4Samples) and (FAllowSample4)) or
        ((FMultisample in [TMultisample.ms2Samples, TMultisample.ms4Samples]) and (FAllowSample)) then
        Res := FDevice.CreateRenderTarget(FWidth, FHeight, D3DFMT_A8R8G8B8, D3DMULTISAMPLE_NONE, 0, False, FColorBuf2, nil);
    end;
    { Prepare object }
    if VistaVBPtr <> 0 then
      FDevice.CreateVertexBuffer(VBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, @VistaVBPtr)
    else
      FDevice.CreateVertexBuffer(VBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, nil);
    if VistaIBPtr <> 0 then
      FDevice.CreateIndexBuffer(IBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, @VistaIBPtr)
    else
      FDevice.CreateIndexBuffer(IBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, nil);
  end;
  inherited ;
end;

procedure TDirectXContext.RemoveShader(Shader: TContextShader);
begin
  if (FShaders <> nil) and (Shader <> 0) then
    FShaders[Shader] := nil;
end;

procedure TDirectXContext.Resize;
var
  Res: HResult;
begin
  if Valid and (FParent <> 0) and (FBitmap = nil) then
  begin
    if IsVistaDevice then
    begin
      // Vista+
      FPresentParams := GetPresentParameters(FParent);
      Res := IDirect3DDevice9Ex(FDevice).ResetEx(FPresentParams, nil);
    end
    else
    begin
      // XP
      FPresentParams := GetPresentParameters(FParent);
      Res := FDevice.Reset(FPresentParams);
    end;
    Assert(Res = S_OK, 'Device not reset');
  end;
end;

procedure TDirectXContext.FreeBuffer;
var
  i: Integer;
  S: TContextState;
begin
  inherited ;
  if Valid then
  begin
    if FBuffered then
    begin
      if FBufferBitmap = 0 then Exit;
      DeleteObject(FBufferBitmap);
      FBufferBitmap := 0;
    end;
    { texture free - only in Windows prior Vista}
    if FBitmap = nil then
      if not IsVistaDevice then
      begin
        for i := FBitmaps.Count - 1 downto 0 do
          DestroyBitmapHandle(TBitmap(FBitmaps[i]));
        FBitmaps.Clear;
      end;
    FColorBufTex := nil;
    FSysMemBuf := nil;
    FColorBuf2 := nil;
    FColorBuf := nil;
    FDepthBuf := nil;
    FIB := nil;
    FVB := nil;
    VBLockPos := 0;
    IBLockPos := 0;
  end;
end;

procedure TDirectXContext.Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal);
var
  Flags: Integer;
begin
  if Valid then
  begin
    Flags := 0;
    if FDepthStencil and (TClearTarget.ctDepth in ATarget) then
      Flags := Flags or D3DCLEAR_ZBUFFER;
    if FDepthStencil and (TClearTarget.ctStencil in ATarget) then
      Flags := Flags or D3DCLEAR_STENCIL;
    if (TClearTarget.ctColor in ATarget) then
      Flags := Flags or D3DCLEAR_TARGET;
    FDevice.Clear(0, nil, Flags, AColor, ADepth, AStencil)
  end;
end;

procedure TDirectXContext.AssignToBitmap(Dest: TBitmap);
var
  RT: IDirect3DSurface9;
  Surface: TD3DLockedRect;
begin
  Dest.SetSize(FWidth, FHeight);
  if FSysMemBuf = nil then
  begin
    if FAILED(FDevice.CreateOffscreenPlainSurface(FWidth, FHeight, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, FSysMemBuf, nil)) then Exit;
    if (FSample <> D3DMULTISAMPLE_NONE) then
      FDevice.CreateRenderTarget(FWidth, FHeight, D3DFMT_A8R8G8B8, D3DMULTISAMPLE_NONE, 0, False, FColorBuf2, nil);
  end;
  if (FColorBuf <> nil) and (FColorBuf2 <> nil) then
  begin
    if not FAILED(FDevice.StretchRect(FColorBuf, nil, FColorBuf2, nil, D3DTEXF_LINEAR)) then
    begin
      if not FAILED(FDevice.GetRenderTargetData(FColorBuf2, FSysMemBuf)) then
      begin
        if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
        begin
          Move(Surface.pBits^, Dest.Startline^, Dest.Width * Dest.Height * 4);
          FSysMemBuf.UnlockRect;
        end;
      end;
    end;
  end
  else
  if (FColorBuf <> nil) then
  begin
    { normal }
    if not FAILED(FDevice.GetRenderTargetData(FColorBuf, FSysMemBuf)) then
    begin
      if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
      begin
        Move(Surface.pBits^, Dest.Startline^, Dest.Width * Dest.Height * 4);
        FSysMemBuf.UnlockRect;
      end
    end;
  end
  else 
  begin
    FDevice.GetRenderTarget(0, RT);
    if FColorBuf2 <> nil then
    begin
      FDevice.StretchRect(RT, nil, FColorBuf2, nil, D3DTEXF_LINEAR);
      if (RT <> nil) and not FAILED(FDevice.GetRenderTargetData(FColorBuf2, FSysMemBuf)) then
      begin
        if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
        begin
          Move(Surface.pBits^, Dest.Startline^, Dest.Width * Dest.Height * 4);
          FSysMemBuf.UnlockRect;
        end
      end;
    end
    else
    begin
      if (RT <> nil) and not FAILED(FDevice.GetRenderTargetData(RT, FSysMemBuf)) then
      begin
        if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
        begin
          Move(Surface.pBits^, Dest.Startline^, Dest.Width * Dest.Height * 4);
          FSysMemBuf.UnlockRect;
        end
      end;
    end;
  end;
  Dest.UpdateHandles;
end;

function TDirectXContext.DoBeginScene: Boolean;
var
  Res: HResult;
  I: Integer;
begin
  if Valid then
  begin
    { Check device }
    Res := FDevice.TestCooperativeLevel;
    if FAILED(Res) then
    begin
      if (D3DERR_DEVICELOST = Res) then
      begin
        Exit;
      end;
      if (D3DERR_DEVICENOTRESET = Res) then
      begin
        FreeBuffer;
        CreateBuffer;
        if FAILED(Res) then
          Exit;
      end;
    end;
    { Render }
    if FAILED(FDevice.BeginScene) then Exit;
    try
      Result := inherited DoBeginScene;
      if not Result then
      begin
        FDevice.EndScene;
        Exit;
      end;
    except
      FDevice.EndScene;
      raise;
    end;
    { Common states }
    FDevice.SetRenderState(D3DRS_STENCILENABLE, iFALSE);
    if not FDepthStencil then
    begin
      FDevice.SetRenderState(D3DRS_ZENABLE, iFALSE);
    end;

    FDevice.SetRenderState(D3DRS_SPECULARENABLE, iFALSE);

    FDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_ONE);
    FDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);

    FDevice.SetRenderState(D3DRS_CLIPPING, iTRUE);
    FDevice.SetRenderState(D3DRS_CLIPPLANEENABLE, iFALSE);

    FDevice.SetRenderState(D3DRS_NORMALIZENORMALS, iTRUE);
    // disable default T&L
    FDevice.SetRenderState(D3DRS_FOGENABLE, iFALSE);
    FDevice.SetRenderState(D3DRS_LIGHTING, iFALSE);
    FDevice.SetRenderState(D3DRS_COLORVERTEX, iFALSE);
  end else
    Result := False;
end;

procedure TDirectXContext.DoEndScene(const CopyTarget: Boolean = True);
var
  Res: HResult;
  Surface: TD3DLockedRect;
  r: TRect;
  i, j: Integer;
begin
  if Valid then
  begin
    if not FAILED(FDevice.TestCooperativeLevel) then
    begin
      Res := FDevice.EndScene;
      if FBitmap = nil then
      begin
        if IsVistaDevice then
          IDirect3DDevice9Ex(FDevice).PresentEx(nil, nil, 0, nil, 0)
        else
          FDevice.Present(nil, nil, 0, nil);
      end;
    end;
    if (FBitmap <> nil) and CopyTarget then
    begin
      if (Assigned(FColorBuf2)) then
      begin
        r := Rect(0, 0, FWidth, FHeight);
        if not FAILED(FDevice.StretchRect(FColorBuf, @r, FColorBuf2, @r, D3DTEXF_LINEAR)) then
        begin
          if not FAILED(FDevice.GetRenderTargetData(FColorBuf2, FSysMemBuf)) then
          begin
            if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
            begin
              Move(Surface.pBits^, FBitmap.Startline^, FBitmap.Width * FBitmap.Height * 4);
              FSysMemBuf.UnlockRect;
            end;
          end;
        end;
      end
      else
      begin
        { normal }
        if not FAILED(FDevice.GetRenderTargetData(FColorBuf, FSysMemBuf)) then
        begin
          if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
          begin
            Move(Surface.pBits^, FBitmap.Startline^, FBitmap.Width * FBitmap.Height * 4);
            FSysMemBuf.UnlockRect;
          end
        end;
      end;
      FBitmap.UpdateHandles;
    end;
    if FBuffered and (FBufferBitmap <> 0) then
    begin
      if (Assigned(FColorBuf2)) then
      begin
        R := Rect(0, 0, FWidth, FHeight);
        if not FAILED(FDevice.StretchRect(FColorBuf, @R, FColorBuf2, @R, D3DTEXF_LINEAR)) then
        begin
          if not FAILED(FDevice.GetRenderTargetData(FColorBuf2, FSysMemBuf)) then
          begin
            if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
            begin
              Move(Surface.pBits^, FBufferBits^, FWidth * FHeight * 4);
              FSysMemBuf.UnlockRect;
            end;
          end;
        end;
      end
      else
      begin
        { normal }
        if not FAILED(FDevice.GetRenderTargetData(FColorBuf, FSysMemBuf)) then
        begin
          if not FAILED(FSysMemBuf.LockRect(Surface, nil, 0)) then
          begin
            Move(Surface.pBits^, FBufferBits^, FWidth * FHeight * 4);
            FSysMemBuf.UnlockRect;
          end
        end;
      end;
    end;
  end;
end;

function TDirectXContext.AddShader(const Shader: IInterface): TContextShader;
begin
  if FShaders = nil then
  begin
    FShaders := TInterfaceList.Create;
    // Fill in the first slot with a dummy entry. This will make it so that a TContextShader value of 0 is invalid.
    FShaders.Add(TInterfacedObject.Create);
  end;
  Result := 0;
  while (Result < FShaders.Count) and (FShaders[Result] <> nil) do
    Inc(Result);
  if Result < FShaders.Count then
    FShaders[Result] := Shader
  else
    Result := FShaders.Add(Shader);
end;

procedure TDirectXContext.ApplyContextState(AState: TContextState);
begin
  if Valid then
  begin
    case AState of
      TContextState.csZTestOn:
        begin
          FDevice.SetRenderState(D3DRS_ZENABLE, iTRUE);
          FDevice.SetRenderState(D3DRS_ZFUNC, D3DCMP_LESSEQUAL);
        end;
      TContextState.csZTestOff:
        begin
          FDevice.SetRenderState(D3DRS_ZENABLE, iFALSE);
        end;
      TContextState.csZWriteOn:
        begin
          FDevice.SetRenderState(D3DRS_ZWRITEENABLE, iTRUE);
        end;
      TContextState.csZWriteOff:
        begin
          FDevice.SetRenderState(D3DRS_ZWRITEENABLE, iFALSE);
        end;
      TContextState.csAlphaTestOn:
        begin
          FDevice.SetRenderState(D3DRS_ALPHATESTENABLE, iTRUE);
        end;
      TContextState.csAlphaTestOff:
        begin
          FDevice.SetRenderState(D3DRS_ALPHATESTENABLE, iFALSE);
        end;
      TContextState.csAlphaBlendOn:
        begin
          FDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, iTRUE);
        end;
      TContextState.csAlphaBlendOff:
        begin
          FDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, iFALSE);
        end;
      TContextState.csStencilOn:
        begin
          FDevice.SetRenderState(D3DRS_STENCILENABLE, iTRUE);
        end;
      TContextState.csStencilOff:
        begin
          FDevice.SetRenderState(D3DRS_STENCILENABLE, iFALSE);
        end;
      TContextState.csColorWriteOn:
        begin
          FDevice.SetRenderState(D3DRS_COLORWRITEENABLE, $FFFFFFFF);
        end;
      TContextState.csColorWriteOff:
        begin
          FDevice.SetRenderState(D3DRS_COLORWRITEENABLE, 0);
        end;
      TContextState.csFrontFace:
        begin
          FDevice.SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);
        end;
      TContextState.csBackFace:
        begin
          FDevice.SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
        end;
      TContextState.csAllFace:
        begin
          FDevice.SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
        end;
      TContextState.csBlendAdditive:
        begin
          FDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
          FDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);
        end;
      TContextState.csBlendNormal:
        begin
          FDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
          FDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
        end;
      { Tex stretch }
      TContextState.csTexNearest:
        begin
          FDevice.SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(1, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(1, D3DSAMP_MINFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(1, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(2, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(2, D3DSAMP_MINFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(2, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(3, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(3, D3DSAMP_MINFILTER, D3DTEXF_POINT);
          FDevice.SetSamplerState(3, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
        end;
      TContextState.csTexLinear:
        begin
          FDevice.SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(1, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(1, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(1, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(2, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(2, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(2, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(3, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(3, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
          FDevice.SetSamplerState(3, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
        end;
      TContextState.csFrame:
        FDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
      TContextState.csSolid:
        FDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
      TContextState.csFlat:
        FDevice.SetRenderState(D3DRS_SHADEMODE, D3DSHADE_FLAT);
      TContextState.csGouraud:
        FDevice.SetRenderState(D3DRS_SHADEMODE, D3DSHADE_GOURAUD);
    end;
  end;
end;

procedure TDirectXContext.SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix);
var
  M: TMatrix3D;
begin
  FDevice.SetTextureStageState(0, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_COUNT2);
  M := IdentityMatrix3D;
  FDevice.SetTransform(D3DTS_TEXTURE0, D3DMatrix(M));
end;

procedure TDirectXContext.SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap);
var
  Tex: IDirect3DTexture9;
begin
  if ABitmap = nil then
  begin
    FDevice.SetTexture(AUnit, nil);
    Exit;
  end;
  UpdateBitmapHandle(ABitmap);
  if ABitmap.HandleExists(Self) then
  begin
    Tex := IDirect3DTexture9(ABitmap.Handles[Self]);
    FDevice.SetTexture(AUnit, Tex);
  end;
end;

procedure TDirectXContext.SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil);
var
  R: TRect;
  Res: HResult;
  RT, Surface: IDirect3DSurface9;
  Desc: TD3DSurfaceDesc;
begin
  { Create RenderTarget texture}
  if FColorBufTex = nil then
  begin
    if ARect <> nil then
      FDevice.CreateTexture(trunc(ARect.Width), trunc(ARect.Height), 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, FColorBufTex, nil)
    else
      FDevice.CreateTexture(FWidth, FHeight, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, FColorBufTex, nil);
  end;

  if FColorBufTex <> nil then
  begin
    FColorBufTex.GetLevelDesc(0, Desc);
    if ARect <> nil then
    begin
      if (Desc.Width <> trunc(ARect.Width)) or (Desc.Height <> trunc(ARect.Height)) then
      begin
        FColorBufTex := nil;
        FDevice.CreateTexture(trunc(ARect.Width), trunc(ARect.Height), 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, FColorBufTex, nil)
      end;
      FColorBufTex.GetSurfaceLevel(0, Surface);
      R := ARect^.Truncate;
      if FColorBuf = nil then
      begin
        FDevice.GetRenderTarget(0, RT);
        if RT <> nil then
          Res := FDevice.StretchRect(RT, @R, Surface, @R, D3DTEXF_POINT);
      end
      else
        Res := FDevice.StretchRect(FColorBuf, @R, Surface, @R, D3DTEXF_POINT);
      Surface := nil;
    end
    else
    begin
      if (Desc.Width <> FWidth) or (Desc.Height <> FHeight) then
      begin
        FColorBufTex := nil;
        FDevice.CreateTexture(FWidth, FHeight, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, FColorBufTex, nil)
      end;
      FColorBufTex.GetSurfaceLevel(0, Surface);
      if FColorBuf = nil then
      begin
        FDevice.GetRenderTarget(0, RT);
        if RT <> nil then
          Res := FDevice.StretchRect(RT, nil, Surface, nil, D3DTEXF_POINT);
      end
      else
        Res := FDevice.StretchRect(RT, nil, Surface, nil, D3DTEXF_POINT);
      Surface := nil;
    end;
    Res := FDevice.SetTexture(AUnit, FColorBufTex);
  end;
end;

procedure TDirectXContext.SetStencilOp(const Fail, ZFail, ZPass: TStencilOp);
begin
  case Fail of
    TStencilOp.soKeep: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
    TStencilOp.soZero: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_ZERO);
    TStencilOp.soReplace: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_REPLACE);
    TStencilOp.soIncrease: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_INCRSAT);
    TStencilOp.soDecrease: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_DECRSAT);
    TStencilOp.soInvert: FDevice.SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_INVERT);
  end;
  case ZFail of
    TStencilOp.soKeep: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
    TStencilOp.soZero: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_ZERO);
    TStencilOp.soReplace: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_REPLACE);
    TStencilOp.soIncrease: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_INCRSAT);
    TStencilOp.soDecrease: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_DECRSAT);
    TStencilOp.soInvert: FDevice.SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_INVERT);
  end;
  case ZPass of
    TStencilOp.soKeep: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
    TStencilOp.soZero: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_ZERO);
    TStencilOp.soReplace: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_REPLACE);
    TStencilOp.soIncrease: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_INCRSAT);
    TStencilOp.soDecrease: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_DECRSAT);
    TStencilOp.soInvert: FDevice.SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_INVERT);
  end;
end;

procedure TDirectXContext.SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal);
begin
  case Func of
    TStencilFunc.sfNever: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_NEVER);
    TStencilFunc.sfLess: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_LESS);
    TStencilFunc.sfLequal: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_LESSEQUAL);
    TStencilFunc.sfGreater: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_GREATER);
    TStencilFunc.fsGequal: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_GREATEREQUAL);
    TStencilFunc.sfEqual: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_EQUAL);
    TStencilFunc.sfNotEqual: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_NOTEQUAL);
    TStencilFunc.sfAlways: FDevice.SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
  end;
  FDevice.SetRenderState(D3DRS_STENCILREF, Ref);
  FDevice.SetRenderState(D3DRS_STENCILMASK, Mask);
end;

function TDirectXContext.ValidBuffers(const Vertices: TVertexBuffer; const Indices: TIndexBuffer): Boolean;
var
  R: HResult;
begin
  if Valid and Assigned(FVB) and Assigned(FIB) then
  begin
    if Vertices.Size > VBSize then
    begin
      FVB := nil;
      if VistaVBPtr <> 0 then
        R := FDevice.CreateVertexBuffer(Vertices.Size, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, @VistaVBPtr)
      else
        R := FDevice.CreateVertexBuffer(Vertices.Size, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, nil);
      if FAILED(R) then
      begin
        // resotore
        if VistaVBPtr <> 0 then
          R := FDevice.CreateVertexBuffer(VBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, @VistaVBPtr)
        else
          R := FDevice.CreateVertexBuffer(VBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFVF_XYZ, D3DPOOL_DEFAULT, FVB, nil);
      end
      else
        VBSize := Vertices.Size;
    end;
    if Indices.Size > IBSize then
    begin
      FIB := nil;
      if VistaIBPtr <> 0 then
        R := FDevice.CreateIndexBuffer(Indices.Size, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, @VistaIBPtr)
      else
        R := FDevice.CreateIndexBuffer(Indices.Size, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, nil);
      if FAILED(R) then
      begin
        // resotore
        if VistaIBPtr <> 0 then
          R := FDevice.CreateIndexBuffer(IBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, @VistaIBPtr)
        else
          R := FDevice.CreateIndexBuffer(IBSize, D3DUSAGE_WRITEONLY or D3DUSAGE_DYNAMIC, D3DFMT_INDEX16, D3DPOOL_DEFAULT, FIB, nil);
      end
      else
        IBSize := Indices.Size;
    end;
    Result := (Vertices.Size <= VBSize) and (Indices.Size <= IBSize);
  end
  else
    Result := False;
end;

procedure TDirectXContext.DrawLinesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;
    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end
    else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;
      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_LINELIST, 0, 0, Vertices.Length,
        IBLockPos div 2, Indices.Length div 2));

      VBLockPos := VBLockPos + Vertices.Size;
      IBLockPos := IBLockPos + Indices.Size;
    end;
  end;
end;

procedure TDirectXContext.DrawLinesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;
    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;
      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_LINELIST, 0, 0, Vertices.Length, IBLockPos div 2, Indices.Length - 1));

      VBLockPos := VBLockPos + Vertices.Size;
      IBLockPos := IBLockPos + Indices.Size;
    end;
  end;
end;

procedure TDirectXContext.DrawPointsList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;
    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end
    else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };
        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;
      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_POINTLIST, 0, 0, Vertices.Length, IBLockPos div 2, Indices.Length));

      VBLockPos := VBLockPos + Vertices.Size;
      IBLockPos := IBLockPos + Indices.Size;
    end;
  end;
end;

procedure TDirectXContext.DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;
    
    if VistaVBPtr <> 0 then
      VBLockPos := VistaVBLockPos;

    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end
    else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if VistaIBPtr <> 0 then
          IBLockPos := VistaIBLockPos;
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end
        else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;
      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, Vertices.Length, IBLockPos div 2, Indices.Length div 3));

      VBLockPos := VBLockPos + Vertices.Size;
      if VistaVBPtr <> 0 then
        VistaVBLockPos := VBLockPos;
      IBLockPos := IBLockPos + Indices.Size;
      if VistaIBPtr <> 0 then
        VistaIBLockPos := IBLockPos;
    end;
  end;
end;

procedure TDirectXContext.DrawTrianglesFan(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;
    
    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;

      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_TRIANGLEFAN, 0, 0, Vertices.Length, IBLockPos div 2, Indices.Length - 2));

      VBLockPos := VBLockPos + Vertices.Size;
      IBLockPos := IBLockPos + Indices.Size;
    end;
  end;
end;

procedure TDirectXContext.DrawTrianglesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  Ver: Pointer;
  Idx: ^Word;
  a, b, n: TVector3D;
  i: Integer;
  Flags: Cardinal;
begin
  if Valid and ValidBuffers(Vertices, Indices) then
  begin
    FCurrentOpacity := Opacity;
    FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
    SetParams;

    if VBLockPos + Vertices.Size > VBSize then
    begin
      VBLockPos := 0;
      Flags := D3DLOCK_DISCARD;
    end
    else
      Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

    if Succeeded(FVB.Lock(VBLockPos, Vertices.Size, Pointer(Ver), Flags)) then
    begin
      try
        Move(Vertices.Buffer^, Ver^, Vertices.Size);
        { indexs }
        if IBLockPos + Indices.Size > IBSize then
        begin
          IBLockPos := 0;
          Flags := D3DLOCK_DISCARD;
        end
        else
          Flags := D3DLOCK_NOOVERWRITE { or D3DLOCK_DISCARD };

        if Succeeded(FIB.Lock(IBLockPos, Indices.Size, Pointer(Idx), Flags)) then
        try
          Move(Indices.Buffer^, Idx^, Indices.Size);
        finally
          FIB.Unlock;
        end;
      finally
        { unlock }
        FVB.Unlock;
      end;

      Flags := 0;
      if TVertexFormat.vfVertex in Vertices.Format then
        Flags := Flags or D3DFVF_XYZ;
      if TVertexFormat.vfNormal in Vertices.Format then
        Flags := Flags or D3DFVF_NORMAL;
      if TVertexFormat.vfDiffuse in Vertices.Format then
        Flags := Flags or D3DFVF_DIFFUSE;
      if TVertexFormat.vfSpecular in Vertices.Format then
        Flags := Flags or D3DFVF_SPECULAR;
      if TVertexFormat.vfTexCoord0 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX1;
      if TVertexFormat.vfTexCoord1 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX2;
      if TVertexFormat.vfTexCoord2 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX3;
      if TVertexFormat.vfTexCoord3 in Vertices.Format then
        Flags := Flags or D3DFVF_TEX4;
      FDevice.SetFVF(Flags);
      FDevice.SetIndices(FIB);
      FDevice.SetStreamSource(0, FVB, VBLockPos, Vertices.VertexSize);
      FAILED(FDevice.DrawIndexedPrimitive(D3DPT_TRIANGLESTRIP, 0, 0, Vertices.Length, IBLockPos div 2, Indices.Length - 2));

      VBLockPos := VBLockPos + Vertices.Size;
      IBLockPos := IBLockPos + Indices.Size;
    end;
  end;
end;

procedure TDirectXContext.UpdateBitmapHandle(ABitmap: TBitmap);
var
  Tex: IDirect3DTexture9;
  Surface: TD3DLockedRect;
  Desc: TD3DSurfaceDesc;
  P: ^PAlphaColorArray;
  I: Integer;
begin
  if ABitmap <> nil then
  begin
    if ABitmap.Width * ABitmap.Height <> 0 then
    begin
      if Valid then
      begin
        if false and IsVistaDevice then // not worked in nvidia - disabled
        begin
          if not ABitmap.HandleExists(Self) then
          begin
            if Succeeded(FDevice.CreateTexture(ABitmap.Width, ABitmap.Height, 1, D3DUSAGE_DYNAMIC, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, Tex, @ABitmap.StartLine)) then
            begin
              Tex._AddRef;
              ABitmap.AddFreeNotify(Self);
              ABitmap.HandleAdd(Self);
              ABitmap.Handles[Self] := Pointer(Tex);
              ABitmap.HandlesNeedUpdate[Self] := True;
              FBitmaps.Add(ABitmap);
            end;
          end;
        end
        else
        begin
          if not ABitmap.HandleExists(Self) then
          begin
            if Succeeded(FDevice.CreateTexture(ABitmap.Width, ABitmap.Height, 1, D3DUSAGE_DYNAMIC, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, Tex, nil)) then
            begin
              Tex._AddRef;
              ABitmap.AddFreeNotify(Self);
              ABitmap.HandleAdd(Self);
              ABitmap.Handles[Self] := Pointer(Tex);
              ABitmap.HandlesNeedUpdate[Self] := True;
              FBitmaps.Add(ABitmap);
            end;
          end else
            Tex := IDirect3DTexture9(ABitmap.Handles[Self]);

          if ABitmap.HandlesNeedUpdate[Self] then
          begin
            if Succeeded(Tex.LockRect(0, Surface, nil, D3DLOCK_DISCARD)) then
            try
              if Surface.Pitch = (ABitmap.Width * 4) then
                Move(ABitmap.Startline^, Surface.pBits^, ABitmap.Width * ABitmap.Height * 4)
              else
                for I := 0 to ABitmap.Height - 1 do
                begin
                  Move(ABitmap.Scanline[I]^, PByteArray(Surface.pBits)[I * Surface.Pitch], ABitmap.Width * 4);
                end;
            finally
              Tex.UnlockRect(0);
            end;
          end;
        end;
      end;
    end;
    ABitmap.HandlesNeedUpdate[Self] := False;
  end;
end;

procedure TDirectXContext.DestroyBitmapHandle(ABitmap: TBitmap);
var
  Tex: IDirect3DTexture9;
begin
  if ABitmap.HandleExists(Self) then
  begin
    ABitmap.RemoveFreeNotify(Self);

    Tex := IDirect3DTexture9(ABitmap.Handles[Self]);

    FBitmaps.Remove(ABitmap);

    Tex._Release;

    ABitmap.HandleRemove(Self);
  end;
end;

{ Vertex Shader }

function TDirectXContext.CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
var
  Shader: IDirect3DVertexShader9;
begin
  Result := 0;
  if Valid then
  begin
    FDevice.CreateVertexShader(DXCode, Shader);
    if Assigned(Shader) then
      Result := AddShader(Shader);
  end;
end;

procedure TDirectXContext.DestroyVertexShader(const Shader: TContextShader);
begin
  if Valid then
    RemoveShader(Shader);
end;

procedure TDirectXContext.SetVertexShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FDevice.SetVertexShader(ShaderToVertexShader(Shader));
    FCurrentVS := Shader;
  end;
end;

procedure TDirectXContext.SetVertexShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid then
    FDevice.SetVertexShaderConstantF(Index, @V, 1);
end;

function TDirectXContext.ShaderToPixelShader(Shader: TContextShader): IDirect3DPixelShader9;
begin
  if (FShaders <> nil) and (Shader > 0) and (Shader < FShaders.Count) then
    Result := FShaders[Shader] as IDirect3DPixelShader9
  else
    Result := nil;
end;

function TDirectXContext.ShaderToVertexShader(Shader: TContextShader): IDirect3DVertexShader9;
begin
  if (FShaders <> nil) and (Shader > 0) and (Shader < FShaders.Count) then
    Result := FShaders[Shader] as IDirect3DVertexShader9
  else
    Result := nil;
end;

procedure TDirectXContext.SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid then
  begin
    FAILED(FDevice.SetVertexShaderConstantF(Index + 0, @M.M[0], 1));
    FAILED(FDevice.SetVertexShaderConstantF(Index + 1, @M.M[1], 1));
    FAILED(FDevice.SetVertexShaderConstantF(Index + 2, @M.M[2], 1));
    FAILED(FDevice.SetVertexShaderConstantF(Index + 3, @M.M[3], 1));
  end;
end;

{ Pixel Shader }

function TDirectXContext.CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
var
  Shader: IDirect3DPixelShader9;
begin
  Result := 0;
  if Valid then
  begin
    FAILED(FDevice.CreatePixelShader(DXCode, Shader));
    if Assigned(Shader) then
      Result := AddShader(Shader);
  end;
end;

procedure TDirectXContext.DestroyPixelShader(const Shader: TContextShader);
begin
  if Valid then
    RemoveShader(Shader);
end;

procedure TDirectXContext.SetPixelShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FDevice.SetPixelShader(ShaderToPixelShader(Shader));
    FCurrentPS := Shader;
  end;
end;

procedure TDirectXContext.SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid then
  begin
    FAILED(FDevice.SetPixelShaderConstantF(Index + 0, @M.M[0], 1));
    FAILED(FDevice.SetPixelShaderConstantF(Index + 1, @M.M[1], 1));
    FAILED(FDevice.SetPixelShaderConstantF(Index + 2, @M.M[2], 1));
    FAILED(FDevice.SetPixelShaderConstantF(Index + 3, @M.M[3], 1));
  end;
end;

procedure TDirectXContext.SetPixelShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid then
    FDevice.SetPixelShaderConstantF(Index, @V, 1);
end;

initialization
  if Direct3D9Loaded then
    DefaultContextClass := TDirectXContext;
finalization
  DestroyVistaShared;
end.
