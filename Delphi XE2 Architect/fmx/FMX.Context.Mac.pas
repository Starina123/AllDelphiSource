{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Context.Mac;

{$I FMX.Defines.inc}

interface

procedure SelectOpenGLContext;

implementation {===============================================================}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.Math, FMX.Types, Macapi.CocoaTypes, Macapi.AppKit,
  FMX.Types3D, FMX.Platform, Macapi.OpenGL, FMX.Filter, FMX.Context.Mac.GLSL;

type

  { TContextOpenGL }

  TContextOpenGL = class(TContext3D)
  private
    { buffers }
    FRenderBuf: GLuint;
    FFrameBuf: GLuint;
    FDepthBuf: GLuint;
    FColorBufTex: GLuint;
    FContextObject: NSOpenGLContext;
    procedure ApplyVertices(const Vertices: TVertexBuffer;
      const Indices: TIndexBuffer; const Opacity: Single);
    procedure UnApplyVertices;
  protected
    procedure ApplyContextState(AState: TContextState); override;
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
    destructor Destroy; override;
    { buffer }
    procedure Resize; override;
    { buffer }
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

    property ContextObject: NSOpenGLContext read FContextObject;
  end;
  
  T_T2F_C4U_N3F_V3F = packed record
    T: TPointF;
    C: TAlphaColor;
    N: TPoint3D;
    V: TPoint3D;
  end;

function ColorToGlColor(AColor: TAlphaColor): TVector3D;
begin
  Result.X := TAlphaColorRec(AColor).R / $FF;
  Result.Y := TAlphaColorRec(AColor).G / $FF;
  Result.Z := TAlphaColorRec(AColor).B / $FF;
  Result.W := TAlphaColorRec(AColor).A / $FF;
end;

{ TContextOpenGL }

var
  FirstContext: TContextOpenGL;

const
  attrs: array  [0..5] of NSOpenGLPixelFormatAttribute =
    (
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFADepthSize, 24,
		NSOpenGLPFAStencilSize, 8,
                0
    );
  attrs2: array  [0..11] of NSOpenGLPixelFormatAttribute =
    (
		NSOpenGLPFAAccelerated,
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFADepthSize, 24,
		NSOpenGLPFAStencilSize, 8,
                NSOpenGLPFAMultisample,
                NSOpenGLPFASampleBuffers, 1,
                NSOpenGLPFASamples, 2,
                0
    );
  attrs4: array  [0..11] of NSOpenGLPixelFormatAttribute =
    (
		NSOpenGLPFAAccelerated,
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFADepthSize, 24,
		NSOpenGLPFAStencilSize, 8,
                NSOpenGLPFAMultisample,
                NSOpenGLPFASampleBuffers, 1,
                NSOpenGLPFASamples, 4,
                0
    );

constructor TContextOpenGL.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
var
  PixelFormat: NSOpenGLPixelFormat;
  PF: Pointer;
  Ctx: NSOpenGLContext;
begin
  inherited;

  PF := nil;
  case FMultisample of
    TMultisample.ms4Samples:
      begin
        PixelFormat := TNSOpenGLPixelFormat.Create;
        PF := PixelFormat.initWithAttributes(@attrs4[0]);
        if PF = nil then
        begin
          PixelFormat := TNSOpenGLPixelFormat.Create;
          PF := PixelFormat.initWithAttributes(@attrs2[0]);
        end;
      end;
    TMultisample.ms2Samples:
      begin
        PixelFormat := TNSOpenGLPixelFormat.Create;
        PF := PixelFormat.initWithAttributes(@attrs2[0]);
      end;
  end;
  if PF = nil then
  begin
    PixelFormat := TNSOpenGLPixelFormat.Create;
    PF := PixelFormat.initWithAttributes(@attrs[0]);
  end;

  PixelFormat := TNSOpenGLPixelFormat.Wrap(PF);

  Ctx := TNSOpenGLContext.Create;
  if FirstContext = nil then
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, nil));
    FirstContext := Self;
  end
  else
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, FirstContext.ContextObject));
  PixelFormat.release;

  // set context to the view
  TNSOpenGLView.Wrap(Pointer(Platform.FindForm(Parent).ContextHandle)).setOpenGLContext(FContextObject);

  FContextObject.makeCurrentContext;

  glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP_SGIS, GL_FALSE);

  CreateBuffer;
end;

constructor TContextOpenGL.CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
var
  PixelFormat: NSOpenGLPixelFormat;
  SaveContext: NSOpenGLContext;
  Ctx: NSOpenGLContext;
  PF: Pointer;
  Status: Integer;
begin
  inherited;
  PF := nil;
  case FMultisample of
    TMultisample.ms4Samples:
      begin
        PixelFormat := TNSOpenGLPixelFormat.Create;
        PF := PixelFormat.initWithAttributes(@attrs4[0]);
        if PF = nil then
        begin
          PixelFormat := TNSOpenGLPixelFormat.Create;
          PF := PixelFormat.initWithAttributes(@attrs2[0]);
        end;
      end;
    TMultisample.ms2Samples:
      begin
        PixelFormat := TNSOpenGLPixelFormat.Create;
        PF := PixelFormat.initWithAttributes(@attrs2[0]);
      end;
  end;
  if PF = nil then
  begin
    PixelFormat := TNSOpenGLPixelFormat.Create;
    PF := PixelFormat.initWithAttributes(@attrs[0]);
  end;
  Ctx := TNSOpenGLContext.Create;
  if FirstContext = nil then
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, nil));
//    FHandle := THandle(FContextObject);
    FirstContext := Self;
  end
  else
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, FirstContext.ContextObject));
//    FHandle := THandle(FContextObject);
  end;
  PixelFormat.release;
  SaveContext := TNSOpenGLContext.Wrap(TNSOpenGLContext.OCClass.currentContext);
  FContextObject.makeCurrentContext;

  { create buffers }
  glGenFramebuffersEXT(1, @FFrameBuf);
  glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, FFrameBuf);

  glGenRenderbuffersEXT(1, @FRenderBuf);
  glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, FRenderBuf);
  glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_RGBA, FWidth, FHeight);
  glFrameBufferRenderBufferEXT(GL_FRAMEBUFFER_EXT, GL_COLOR_ATTACHMENT0_EXT, GL_RENDERBUFFER_EXT, FRenderBuf);
  glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, 0);

  if FDepthStencil then
  begin
    glGenRenderbuffersEXT(1, @FDepthBuf);
    glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, FDepthBuf);
    glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_DEPTH24_STENCIL8_EXT, FWidth, FHeight);
    glFramebufferRenderbufferEXT(GL_FRAMEBUFFER_EXT, GL_DEPTH_ATTACHMENT_EXT, GL_RENDERBUFFER_EXT, FDepthBuf);
    glFramebufferRenderbufferEXT(GL_FRAMEBUFFER_EXT, GL_STENCIL_ATTACHMENT_EXT, GL_RENDERBUFFER_EXT, FDepthBuf);
    glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, 0);
  end;

  Status := glCheckFramebufferStatusEXT(GL_FRAMEBUFFER_EXT);
  if Status <> GL_FRAMEBUFFER_COMPLETE_EXT then
    Writeln('frame buffer not complete');
  glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, 0);

  glGenTextures(1, @FColorBufTex);
  glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP_SGIS, GL_FALSE);
  
  SaveContext.makeCurrentContext;

  CreateBuffer;
end;

destructor TContextOpenGL.Destroy;
begin
  if FContextObject <> nil then
    FContextObject.makeCurrentContext;
  if FColorBufTex <> 0 then
    glDeleteTextures(1, @FColorBufTex);
  if FDepthBuf <> 0 then
     glDeleteRenderbuffersEXT(1, @FDepthBuf);
  if FRenderBuf <> 0 then
     glDeleteRenderbuffersEXT(1, @FRenderBuf);
  if FFrameBuf <> 0 then
     glDeleteFramebuffersEXT(1, @FFrameBuf);
  glDeleteTextures(1, @FColorBufTex);
  if FContextObject <> nil then
    FContextObject.release;
  FContextObject := nil;
  inherited;
  if FirstContext = Self then
    FirstContext := nil;
  if ShaderDevice = Self then
    ShaderDevice := nil;
end;

procedure TContextOpenGL.Resize;
var
  Status: Integer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if FFrameBuf <> 0 then
    begin
      glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, FFrameBuf);
      if FRenderBuf <> 0 then
      begin
        glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, FRenderBuf);
        glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_RGBA, FWidth, FHeight);
      end;
      if FDepthBuf <> 0 then
      begin
        glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, FDepthBuf);
        glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_DEPTH24_STENCIL8_EXT, FWidth, FHeight);
      end;
      Status := glCheckFramebufferStatusEXT(GL_FRAMEBUFFER_EXT);
      if Status <> GL_FRAMEBUFFER_COMPLETE_EXT then
        writeln('frame buffer not complete');
    end 
    else
      FContextObject.update;
  end;
end;

function TContextOpenGL.GetValid: Boolean;
begin
  Result := FContextObject <> nil;
end;

function TContextOpenGL.DoBeginScene: Boolean;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;

    if FFrameBuf <> 0 then
      glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, FFrameBuf);

    glViewport(0, 0, FWidth, FHeight);
    
    { Render }
    Result := inherited DoBeginScene;

    if FDepthStencil then
      glEnable(GL_DEPTH_TEST);

    glEnable(GL_BLEND);
    glEnable(GL_ALPHA_TEST);

    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

    glFrontFace(GL_CW);

    glDisable(GL_LIGHT0);
    glDisable(GL_LIGHT1);
    glDisable(GL_LIGHT2);
    glDisable(GL_LIGHT3);
    glDisable(GL_LIGHT4);
    glDisable(GL_LIGHT5);
    glDisable(GL_LIGHT6);
    glDisable(GL_LIGHT7);
    
    glEnable(GL_NORMALIZE);
  end else
    Result := False;
end;

procedure TContextOpenGL.DoEndScene(const CopyTarget: Boolean = True);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if (FBitmap <> nil) and CopyTarget then
    begin
      glFlush();
      glReadPixels(0, 0, FWidth, FHeight, GL_RGBA, GL_UNSIGNED_BYTE, FBitmap.StartLine);
      FBitmap.FlipVertical;
    end else
      FContextObject.flushBuffer;
  end;
end;

procedure TContextOpenGL.ApplyContextState(AState: TContextState);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    case AState of
      TContextState.csZTestOn:
        begin
          glEnable(GL_DEPTH_TEST);
          glDepthFunc(GL_LEQUAL);
          glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
        end;
      TContextState.csZTestOff: glDisable(GL_DEPTH_TEST);
      TContextState.csZWriteOn: glDepthMask(1);
      TContextState.csZWriteOff: glDepthMask(0);
      TContextState.csAlphaTestOn: glEnable(GL_ALPHA_TEST);
      TContextState.csAlphaTestOff: glDisable(GL_ALPHA_TEST);
      TContextState.csAlphaBlendOn: glEnable(GL_BLEND);
      TContextState.csAlphaBlendOff: glDisable(GL_BLEND);
      TContextState.csStencilOn: glEnable(GL_STENCIL_TEST);
      TContextState.csStencilOff: glDisable(GL_STENCIL_TEST);
      TContextState.csColorWriteOn: glColorMask(1, 1, 1, 1);
      TContextState.csColorWriteOff: glColorMask(0, 0, 0, 0);
      TContextState.csFrontFace:
        begin
          glCullFace(GL_BACK);
          glEnable(GL_CULL_FACE);
        end;
      TContextState.csBackFace:
        begin
          glCullFace(GL_FRONT);
          glEnable(GL_CULL_FACE);
        end;
      TContextState.csAllFace: glDisable(GL_CULL_FACE);
      TContextState.csBlendAdditive: glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
      TContextState.csBlendNormal: glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
      TContextState.csFlat: glShadeModel(GL_FLAT);
      TContextState.csGouraud: glShadeModel(GL_SMOOTH);
      TContextState.csFrame: glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
      TContextState.csSolid: glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
      TContextState.csTexNearest:
        begin
          glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
          glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        end;
      TContextState.csTexLinear:
        begin
          glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
          glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        end;
    end;
  end;
end;

procedure TContextOpenGL.Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal);
var
  Flags: Integer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    Flags := 0;
    if FDepthStencil and (TClearTarget.ctDepth in ATarget) then
    begin
      Flags := Flags or GL_DEPTH_BUFFER_BIT;
      glClearDepth(1.0);
    end;
    if FDepthStencil and (TClearTarget.ctStencil in ATarget) then
    begin
      Flags := Flags or GL_STENCIL_BUFFER_BIT;
      glClearStencil(0);
    end;
    if (TClearTarget.cTColor in ATarget) then
    begin
      Flags := Flags or GL_COLOR_BUFFER_BIT;
      glClearColor(TAlphaColorRec(AColor).R / $FF, TAlphaColorRec(AColor).G / $FF, TAlphaColorRec(AColor).B / $FF, TAlphaColorRec(AColor).A / $FF);
    end;
    glClear(Flags);
  end;
end;

procedure TContextOpenGL.ApplyVertices(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
var
  i: Integer;
  TempVer: array of T_T2F_C4U_N3F_V3F;
  C: TVector3D;
begin
  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  
  glGetMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @C);
  C.W := Opacity;
  glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @C);

  if Vertices.Format = [TVertexFormat.vfVertex, TVertexFormat.vfTexCoord0] then
    glInterleavedArrays(GL_T2F_V3F, 0, Vertices.Buffer);
  if Vertices.Format = [TVertexFormat.vfVertex, TVertexFormat.vfNormal, TVertexFormat.vfTexCoord0] then
    glInterleavedArrays(GL_T2F_N3F_V3F, 0, Vertices.Buffer);
  if Vertices.Format = [TVertexFormat.vfVertex, TVertexFormat.vfNormal, TVertexFormat.vfDiffuse, TVertexFormat.vfTexCoord0] then
  begin
    SetLength(TempVer, Vertices.Length);
    for i := 0 to Vertices.Length - 1 do
    begin
      with TempVer[i] do
      begin
        T := Vertices.TexCoord0[i];
        C := CorrectColor(Vertices.Diffuse[i]);
        N := Vertices.Normals[i];
        V := Vertices.Vertices[i];
      end;
    end;
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);

    glTexCoordPointer(2, GL_FLOAT, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0])));
    glColorPointer(4, GL_UNSIGNED_BYTE, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0]) + 2 * 4));
    glNormalPointer(GL_FLOAT, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0]) + 3 * 4));
    glVertexPointer(3, GL_FLOAT, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0]) + 6 * 4));
  end
  else
  if Vertices.Format = [TVertexFormat.vfVertex, TVertexFormat.vfDiffuse] then
  begin
    SetLength(TempVer, Vertices.Length);
    for i := 0 to Vertices.Length - 1 do
    begin
      with TempVer[i] do
      begin
        C := CorrectColor(Vertices.Diffuse[i]);
        V := Vertices.Vertices[i];
      end;
    end;
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);

    glColorPointer(4, GL_UNSIGNED_BYTE, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0]) + 2 * 4));
    glVertexPointer(3, GL_FLOAT, SizeOf(T_T2F_C4U_N3F_V3F), Pointer(Integer(@TempVer[0]) + 6 * 4));
  end
  else
  begin
    if TVertexFormat.vfVertex in Vertices.Format then
    begin
      glEnableClientState(GL_VERTEX_ARRAY);
      glVertexPointer(3, GL_FLOAT, Vertices.VertexSize, Vertices.Buffer);
    end;
    if TVertexFormat.vfNormal in Vertices.Format then
    begin
      glEnableClientState(GL_NORMAL_ARRAY);
      glNormalPointer(GL_FLOAT, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    end;
    if TVertexFormat.vfTexCoord0 in Vertices.Format then
    begin
      glEnableClientState(GL_TEXTURE_COORD_ARRAY);
      glTexCoordPointer(2, GL_FLOAT, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    end;
  end;

  glEnableClientState(GL_INDEX_ARRAY);
  glIndexPointer(GL_UNSIGNED_SHORT, 0, Indices.Buffer);
end;

procedure TContextOpenGL.AssignToBitmap(Dest: TBitmap);
begin
  Dest.SetSize(FWidth, FHeight);
  glReadPixels(0, 0, FWidth, FHeight, GL_RGBA, GL_UNSIGNED_BYTE, Dest.StartLine);
  Dest.FlipVertical;
end;

procedure TContextOpenGL.UnApplyVertices;
begin
  glDisableClientState(GL_INDEX_ARRAY);
  glDisableClientState(GL_VERTEX_ARRAY);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_NORMAL_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);
end;

procedure TContextOpenGL.DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_TRIANGLES, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.DrawTrianglesStrip(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_TRIANGLE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.DrawTrianglesFan(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_TRIANGLE_FAN, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.DrawLinesList(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_LINES, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.DrawLinesStrip(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_LINE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.DrawPointsList(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix;
    try
      glMultMatrixf(@FCurrentMatrix);
      ApplyVertices(Vertices, Indices, Opacity);
      glDrawElements(GL_POINTS, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
      UnApplyVertices;
    finally
      glPopMatrix;
    end;
  end;
end;

procedure TContextOpenGL.SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix);
begin
end;

procedure TContextOpenGL.SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glActiveTexture(GL_TEXTURE0 + AUnit);
    if ABitmap = nil then
    begin
      glBindTexture(GL_TEXTURE_2D, 0);
      Exit;
    end;
    UpdateBitmapHandle(ABitmap);
    glBindTexture(GL_TEXTURE_2D, Integer(ABitmap.Handles[FirstContext]));
    glActiveTexture(GL_TEXTURE0);
  end;
end;

procedure TContextOpenGL.SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil);
var
  I: Integer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;

    glActiveTexture(GL_TEXTURE0 + AUnit);
    if FColorBufTex = 0 then
      glGenTextures(1, @FColorBufTex);
    glBindTexture(GL_TEXTURE_2D, FColorBufTex);
    if FCurrentStates[TContextState.csTexLinear] then
    begin
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    end
    else
    begin
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    end;
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    if (ARect <> nil) then
    begin
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ARect.Truncate.Width, ARect.Truncate.Height, 0, GL_RGBA, GL_UNSIGNED_BYTE, nil);
      for I := 0 to ARect.Truncate.Height - 1 do
        glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, I, 0, FHeight - I - 1, ARect.Truncate.Width, 1);
    end
    else
    begin
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, FWidth, FHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, nil);
      for I := 0 to FHeight - 1 do
        glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, FHeight - I - 1, 0, I, FWidth, 1);
    end;

    glActiveTexture(GL_TEXTURE0);
  end;
end;

procedure TContextOpenGL.SetStencilOp(const Fail, ZFail, ZPass: TStencilOp);
var
  gFail, gZFail, gZPass: GLenum;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    case Fail of
      TStencilOp.soKeep: gFail := GL_KEEP;
      TStencilOp.soZero: gFail := GL_ZERO;
      TStencilOp.soReplace: gFail := GL_KEEP;
      TStencilOp.soIncrease: gFail := GL_INCR;
      TStencilOp.soDecrease: gFail := GL_DECR;
      TStencilOp.soInvert: gFail := GL_INVERT;
    end;
    case ZFail of
      TStencilOp.soKeep: gZFail := GL_KEEP;
      TStencilOp.soZero: gZFail := GL_ZERO;
      TStencilOp.soReplace: gZFail := GL_KEEP;
      TStencilOp.soIncrease: gZFail := GL_INCR;
      TStencilOp.soDecrease: gZFail := GL_DECR;
      TStencilOp.soInvert: gZFail := GL_INVERT;
    end;
    case ZPass of
      TStencilOp.soKeep: gZPass := GL_KEEP;
      TStencilOp.soZero: gZPass := GL_ZERO;
      TStencilOp.soReplace: gZPass := GL_KEEP;
      TStencilOp.soIncrease: gZPass := GL_INCR;
      TStencilOp.soDecrease: gZPass := GL_DECR;
      TStencilOp.soInvert: gZPass := GL_INVERT;
    end;
    glStencilOp(gFail, gZFail, gZPass);
  end;
end;

procedure TContextOpenGL.SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal);
var
  gFunc: GLenum;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    case Func of
      TStencilFunc.sfNever: gFunc := GL_NEVER;
      TStencilFunc.sfLess: gFunc := GL_LESS;
      TStencilFunc.sfLequal: gFunc := GL_LEQUAL;
      TStencilFunc.sfGreater: gFunc := GL_GREATER;
      TStencilFunc.fsGequal: gFunc := GL_GEQUAL;
      TStencilFunc.sfEqual: gFunc := GL_EQUAL;
      TStencilFunc.sfNotEqual: gFunc := GL_NOTEQUAL;
      TStencilFunc.sfAlways: gFunc := GL_ALWAYS;
    end;
    glStencilFunc(gFunc, Ref, Mask);
  end;
end;

procedure TContextOpenGL.UpdateBitmapHandle(ABitmap: TBitmap);
var
  i: Integer;
  Tex: THandle;
begin
  if ABitmap = nil then Exit;
  if ABitmap.Width * ABitmap.Height = 0 then
  begin
    ABitmap.HandlesNeedUpdate[FirstContext] := False;
    Exit;
  end;
  if FContextObject = nil then
    Exit;
  FContextObject.makeCurrentContext;
  { create - if need }
  if not ABitmap.HandleExists(FirstContext) then
  begin
    glGenTextures(1, @Tex);
    glBindTexture(GL_TEXTURE_2D, Tex);
    if FCurrentStates[TContextState.csTexLinear] then
    begin
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    end
    else
    begin
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    end;
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ABitmap.Width, ABitmap.Height, 0,
      GL_RGBA, GL_UNSIGNED_BYTE, ABitmap.Startline);
    ABitmap.AddFreeNotify(FirstContext);
    ABitmap.HandleAdd(FirstContext);
    ABitmap.Handles[FirstContext] := Pointer(Tex);
    ABitmap.HandlesNeedUpdate[FirstContext] := False;
    FirstContext.FBitmaps.Add(ABitmap);
  end
  else
    if ABitmap.HandlesNeedUpdate[FirstContext] then
    begin
      Tex := THandle(ABitmap.Handles[FirstContext]);
      glBindTexture(GL_TEXTURE_2D, Tex);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ABitmap.Width, ABitmap.Height, 0,
        GL_RGBA, GL_UNSIGNED_BYTE, ABitmap.Startline);
      ABitmap.HandlesNeedUpdate[FirstContext] := False;
    end;
end;

procedure TContextOpenGL.DestroyBitmapHandle(ABitmap: TBitmap);
var
  Tex: cardinal;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if (ABitmap.HandleExists(FirstContext)) then
    begin
      ABitmap.RemoveFreeNotify(FirstContext);

      Tex := THandle(ABitmap.Handles[FirstContext]);
      if Tex <> 0 then
        glDeleteTextures(1, @Tex);

      FirstContext.FBitmaps.Remove(ABitmap);

      ABitmap.HandleRemove(FirstContext);
    end;
  end;
end;

{ vertex shaders }

function TContextOpenGL.CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
var
  errorPos, Shader: Integer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if ARBCode <> nil then
    begin
      glEnable(GL_VERTEX_PROGRAM_ARB);
      try
        glGenProgramsARB(1, @Shader);
        if Shader <> 0 then
        begin
          glBindProgramARB(GL_VERTEX_PROGRAM_ARB, Shader);
          glProgramStringARB(GL_VERTEX_PROGRAM_ARB, GL_PROGRAM_FORMAT_ASCII_ARB, strlen(PAnsiChar(ARBCode)), PAnsiChar(ARBCode));
          glGetIntegerv(GL_PROGRAM_ERROR_POSITION_ARB, @errorPos);
          if errorPos = -1 then
            Result := TContextShader(Shader)
          else
          begin
            Result := 0;
            glDeleteProgramsARB(GL_VERTEX_PROGRAM_ARB, @Shader);
  //          Writeln('Vertex shader error');
          end;
        end
        else
        begin
          Result := 0;
  //        Writeln('Vertex shader error');
        end;
      finally
        glDisable(GL_VERTEX_PROGRAM_ARB);
      end;
    end;
  end;
end;

procedure TContextOpenGL.DestroyVertexShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if Shader <> 0 then
    begin
      glDeleteProgramsARB(1, @Shader);
//      Shader := 0;
    end;
  end;
end;

procedure TContextOpenGL.SetVertexShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if Shader = 0 then
      glDisable(GL_VERTEX_PROGRAM_ARB)
    else
    begin
      glEnable(GL_VERTEX_PROGRAM_ARB);
      glBindProgramARB(GL_VERTEX_PROGRAM_ARB, Integer(Shader));
    end;
    FCurrentVS := Shader;
  end;
end;

procedure TContextOpenGL.SetVertexShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glProgramLocalParameter4fARB(GL_VERTEX_PROGRAM_ARB, Index, V.X, V.Y, V.Z, V.W);
  end;
end;

procedure TContextOpenGL.SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D);
var
  V: TVector3D;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    V := Vector3D(M.m11, M.m21, M.m31, M.m41);
    glProgramLocalParameter4fARB(GL_VERTEX_PROGRAM_ARB, Index + 0, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m12, M.m22, M.m32, M.m42);
    glProgramLocalParameter4fARB(GL_VERTEX_PROGRAM_ARB, Index + 1, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m13, M.m23, M.m33, M.m43);
    glProgramLocalParameter4fARB(GL_VERTEX_PROGRAM_ARB, Index + 2, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m14, M.m24, M.m33, M.m44);
    glProgramLocalParameter4fARB(GL_VERTEX_PROGRAM_ARB, Index + 3, V.X, V.Y, V.Z, V.W);
  end;
end;

{ pixel shader }

function TContextOpenGL.CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
var
  errorPos, Shader: Integer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glEnable(GL_FRAGMENT_PROGRAM_ARB);
    try
      glGenProgramsARB(1, @Shader);
      if Shader <> 0 then
      begin
        glBindProgramARB(GL_FRAGMENT_PROGRAM_ARB, Shader);
        glProgramStringARB(GL_FRAGMENT_PROGRAM_ARB, GL_PROGRAM_FORMAT_ASCII_ARB, strlen(PAnsiChar(ARBCode)), PAnsiChar(ARBCode));
        glGetIntegerv(GL_PROGRAM_ERROR_POSITION_ARB, @errorPos);
        if errorPos = -1 then
          Result := TContextShader(Shader)
        else
        begin
          Result := 0;
          glDeleteProgramsARB(1, @Shader);
//          Writeln('Pixel shader error');
        end;
      end else
        Result := 0;
    finally
      glDisable(GL_FRAGMENT_PROGRAM_ARB);
    end;
  end;
end;

procedure TContextOpenGL.DestroyPixelShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if Shader <> 0 then
    begin
      glDeleteProgramsARB(1, @Shader);
//      Shader := 0;
    end;
  end;
end;

procedure TContextOpenGL.SetPixelShader(const Shader: TContextShader);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if Shader = 0 then
      glDisable(GL_FRAGMENT_PROGRAM_ARB)
    else
    begin
      glEnable(GL_FRAGMENT_PROGRAM_ARB);
      glBindProgramARB(GL_FRAGMENT_PROGRAM_ARB, Integer(Shader));
      FCurrentPS := Shader;
    end;
  end;
end;

procedure TContextOpenGL.SetPixelShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    glProgramLocalParameter4fARB(GL_FRAGMENT_PROGRAM_ARB, Index, V.X, V.Y, V.Z, V.W);
  end;
end;

procedure TContextOpenGL.SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D);
var
  V: TVector3D;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    V := Vector3D(M.m11, M.m21, M.m31, M.m41);
    glProgramLocalParameter4fARB(GL_FRAGMENT_PROGRAM_ARB, Index + 0, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m12, M.m22, M.m32, M.m42);
    glProgramLocalParameter4fARB(GL_FRAGMENT_PROGRAM_ARB, Index + 1, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m13, M.m23, M.m33, M.m43);
    glProgramLocalParameter4fARB(GL_FRAGMENT_PROGRAM_ARB, Index + 2, V.X, V.Y, V.Z, V.W);
    V := Vector3D(M.m14, M.m24, M.m33, M.m44);
    glProgramLocalParameter4fARB(GL_FRAGMENT_PROGRAM_ARB, Index + 3, V.X, V.Y, V.Z, V.W);
  end;
end;

var
  OpenGLHandle: HMODULE;
 
procedure SelectOpenGLContext;
var
  Vendor: String;
  PixelFormat: NSOpenGLPixelFormat;
  Ctx: NSOpenGLContext;
begin
  OpenGLHandle := InitOpenGL;
  
  PixelFormat := TNSOpenGLPixelFormat.Create;
  PixelFormat := TNSOpenGLPixelFormat.Wrap(PixelFormat.initWithAttributes(@attrs[0]));
  try
    Ctx := TNSOpenGLContext.Create;
    Ctx := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, nil));
    try
      Ctx.makeCurrentContext;

      Vendor := PAnsiChar(glGetString(GL_VENDOR));
      if CompareText(Vendor, 'NVIDIA Corporation') = 0 then
        SetOpenGLSLAsDefault 
      else
        DefaultContextClass := TContextOpenGL;
    finally
      Ctx.release;
    end;
  finally
    PixelFormat.release;
  end;
end;

initialization
finalization
  if FirstContext <> nil then
    FirstContext.Free;
  FreeLibrary(OpenGLHandle);
end.
