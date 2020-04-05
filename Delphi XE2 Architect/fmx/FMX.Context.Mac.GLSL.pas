{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Context.Mac.GLSL;

{$I FMX.Defines.inc}

interface

procedure SetOpenGLSLAsDefault;

implementation {===============================================================}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.Math, FMX.Types, Macapi.CocoaTypes, Macapi.AppKit,
  FMX.Types3D, FMX.Platform, Macapi.OpenGL, FMX.Filter;

const

  ATTRIB_VERTEX     = 0;
  ATTRIB_NORMAL     = 1;
  ATTRIB_COLOR      = 2;
  ATTRIB_TEXCOORD0  = 3;
  
type

  { TContextOpenGLSL }

  TContextOpenGLSL = class(TContext3D)
  private
    { buffers }
    FRenderBuf: GLuint;
    FFrameBuf: GLuint;
    FDepthBuf: GLuint;
    FColorBufTex: GLuint;
    FContextObject: NSOpenGLContext;
    { }
    FCurrentProgram: Integer;
    { Params }
    FTex0Loc: Integer;
    FTex1Loc: Integer;
    FTex2Loc: Integer;
    FTex3Loc: Integer;
    FVSParamLoc: array [0..95] of Integer;
    FPSParamLoc: array [0..7] of Integer;
    function BuildShader(AType: Integer; ACode: PAnsichar): Integer;
    procedure UseProgram(VS, PS: Integer); 
    {}
    function MakeCurrent: Boolean;
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

procedure SetOpenGLSLAsDefault;
begin
  DefaultContextClass := TContextOpenGLSL
end;

{ TContextOpenGLSL }

var
  FirstContextGLSL: TContextOpenGLSL;

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

constructor TContextOpenGLSL.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
var
  i: Integer;
  St: TContextState;
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
  if FirstContextGLSL = nil then
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, nil));
//    FHandle := THandle(FContextObject);
    FirstContextGLSL := Self;
  end
  else
    begin
      FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, FirstContextGLSL.ContextObject));
//      FHandle := THandle(FContextObject);
    end;
  PixelFormat.release;

  // set context to the view
  TNSOpenGLView.Wrap(Pointer(Platform.FindForm(Parent).ContextHandle)).setOpenGLContext(FContextObject);

  FContextObject.makeCurrentContext;

  glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP_SGIS, GL_FALSE);

  CreateBuffer;
end;

constructor TContextOpenGLSL.CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
var
  i: Integer;
  St: TContextState;
  PixelFormat: NSOpenGLPixelFormat;
  SaveContext: NSOpenGLContext;
  Ctx: NSOpenGLContext;
  PF: Pointer;
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
  if FirstContextGLSL = nil then
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, nil));
    FirstContextGLSL := Self;
  end
  else
  begin
    FContextObject := TNSOpenGLContext.Wrap(Ctx.initWithFormat(PixelFormat, FirstContextGLSL.ContextObject));
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

  i := glCheckFramebufferStatusEXT(GL_FRAMEBUFFER_EXT);
  if i <> GL_FRAMEBUFFER_COMPLETE_EXT then
    writeln('frame buffer not complete');
  glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, 0);

  glGenTextures(1, @FColorBufTex);

  glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP_SGIS, GL_FALSE);
  CreateBuffer;

  SaveContext.makeCurrentContext;
end;

destructor TContextOpenGLSL.Destroy;
begin
  if FContextObject <> nil then
    FContextObject.makeCurrentContext;
  if FCurrentProgram <> 0 then
    glDeleteProgram(FCurrentProgram);
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
  if FirstContextGLSL = Self then
    FirstContextGLSL := nil;
  if ShaderDevice = Self then
    ShaderDevice := nil;
end;

procedure TContextOpenGLSL.Resize;
var
  S: TContextState;
  status: Integer;
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
      status := glCheckFramebufferStatusEXT(GL_FRAMEBUFFER_EXT);
      if status <> GL_FRAMEBUFFER_COMPLETE_EXT then
        writeln('frame buffer not complete');
    end else
      FContextObject.update;
  end;
end;

function TContextOpenGLSL.GetValid: Boolean;
begin
  Result := FContextObject <> nil;
end;

function TContextOpenGLSL.MakeCurrent: Boolean;
begin
  Result := True;
  if not Valid then
    Result := False;
  if Valid then
    FContextObject.makeCurrentContext;
end;

function TContextOpenGLSL.DoBeginScene: Boolean;
var
  Color, Dir: TVector3D;
  i: Integer;
  S: TContextState;
  M: TMatrix3D;
  V: NSOpenGLView;
  CH: Pointer;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if FBitmap = nil then
    begin
      CH := Pointer(Platform.FindForm(Parent).ContextHandle);
      V := TNSOpenGLView.Wrap(CH);
      FContextObject.setView(V);
    end;
    if FFrameBuf <> 0 then
      glBindFramebufferEXT(GL_FRAMEBUFFER_EXT, FFrameBuf);
    glViewport(0, 0, FWidth, FHeight);

    { Render }
    Result := inherited DoBeginScene;

    glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP_SGIS, GL_FALSE);

    if FDepthStencil then
      glEnable(GL_DEPTH_TEST);

    glEnable(GL_BLEND);
    glEnable(GL_ALPHA_TEST);

    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

    glFrontFace(GL_CW);

    glDisable(GL_LIGHTING);
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

procedure TContextOpenGLSL.DoEndScene(const CopyTarget: Boolean = True);
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

procedure TContextOpenGLSL.ApplyContextState(AState: TContextState);
var
  M: TMatrix3D;
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

function TContextOpenGLSL.BuildShader(AType: Integer; ACode: PAnsichar): Integer;
var
  log: AnsiString;
  compiled: Integer;
begin
  if not MakeCurrent then Exit;

  Result := glCreateShader(AType);
  glShaderSource(Result, 1, @ACode, nil);
  glCompileShader(Result);
  glGetShaderiv(Result, GL_COMPILE_STATUS, @compiled);
  if compiled = 0 then
  begin
    glGetShaderiv(Result, GL_INFO_LOG_LENGTH, @compiled);
    if (compiled > 0) then
    begin
        SetLength(log, compiled);
        glGetShaderInfoLog(Result, compiled, @compiled, PAnsiChar(log));
        if AType = GL_VERTEX_SHADER then
          writeln('Vertex shader compilation error:')
        else
          writeln('Pixel shader compilation error:');
        writeln(Log);
    end;
  end;
end;

procedure TContextOpenGLSL.UseProgram(VS, PS: Integer);
var
  S, log: AnsiString;
  i, compiled: Integer;
begin
  if not MakeCurrent then Exit;
  if (FCurrentVS = VS) and (FCurrentPS = PS) then Exit;
  FCurrentVS := VS;
  FCurrentPS := PS;
  if (FCurrentVS = 0) or (FCurrentPS = 0) then Exit;
 
  if FCurrentProgram <> 0 then
    glDeleteProgram(FCurrentProgram);
  FCurrentProgram := glCreateProgram();
  glAttachShader(FCurrentProgram, FCurrentVS);
  glAttachShader(FCurrentProgram, FCurrentPS);

  glBindAttribLocation(FCurrentProgram, ATTRIB_VERTEX, 'a_position');
  glBindAttribLocation(FCurrentProgram, ATTRIB_NORMAL, 'a_normal');
  glBindAttribLocation(FCurrentProgram, ATTRIB_TEXCOORD0, 'a_texcoord0');
  glBindAttribLocation(FCurrentProgram, ATTRIB_COLOR, 'a_color');

  glLinkProgram(FCurrentProgram);
  glGetProgramiv(FCurrentProgram, GL_LINK_STATUS, @compiled);
  if compiled = 0 then
  begin
    glGetProgramiv(FCurrentProgram, GL_INFO_LOG_LENGTH, @compiled);
    if (compiled > 0) then
    begin
      SetLength(log, compiled);
      glGetProgramInfoLog(FCurrentProgram, compiled, @compiled, PAnsiChar(log));
      writeln('program link error ');
      writeln(Log);
      Exit;
    end;
  end;
  FTex0Loc := glGetUniformLocation(FCurrentProgram, 'texture0');
  FTex1Loc := glGetUniformLocation(FCurrentProgram, 'texture1');
  FTex2Loc := glGetUniformLocation(FCurrentProgram, 'texture2');
  FTex3Loc := glGetUniformLocation(FCurrentProgram, 'texture3');
  for i := 0 to High(FVSParamLoc) do
  begin
    S := 'VSParam' + InttoStr(i);
    FVSParamLoc[i] := glGetUniformLocation(FCurrentProgram, PAnsiChar(S));
  end;
  for i := 0 to High(FPSParamLoc) do
  begin
    S := 'PSParam' + InttoStr(i);
    FPSParamLoc[i] := glGetUniformLocation(FCurrentProgram, PAnsiChar(S));
  end;
  glUseProgram(FCurrentProgram);
  if FTex0Loc >= 0 then
    glUniform1i(FTex0Loc, 0);
  if FTex1Loc >= 0 then
    glUniform1i(FTex1Loc, 1);
  if FTex2Loc >= 0 then
    glUniform1i(FTex2Loc, 2);
  if FTex3Loc >= 0 then
    glUniform1i(FTex3Loc, 3);
end;

procedure TContextOpenGLSL.Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal);
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

procedure TContextOpenGLSL.AssignToBitmap(Dest: TBitmap);
begin
  Dest.SetSize(FWidth, FHeight);
  glReadPixels(0, 0, FWidth, FHeight, GL_RGBA, GL_UNSIGNED_BYTE, Dest.StartLine);
  Dest.FlipVertical;
end;

procedure TContextOpenGLSL.DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;
  if TVertexFormat.vfDiffuse in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_COLOR, 4, GL_UNSIGNED_BYTE, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfDiffuse, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_COLOR);
  end;

  glDrawElements(GL_TRIANGLES, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_COLOR);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.DrawTrianglesStrip(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;

  glDrawElements(GL_TRIANGLE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
  
  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.DrawTrianglesFan(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;

  glDrawElements(GL_TRIANGLE_FAN, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.DrawLinesList(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;

  glDrawElements(GL_LINES, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.DrawLinesStrip(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;

  glDrawElements(GL_LINE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.DrawPointsList(const Vertices: TVertexBuffer;
  const Indices: TIndexBuffer; const Opacity: Single);
begin
  if not MakeCurrent then Exit;

  FCurrentOpacity := Opacity;
  FCurrentColoredVertices := TVertexFormat.vfDiffuse in Vertices.Format;
  SetParams;
  if TVertexFormat.vfVertex in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Vertices.Buffer);
    glEnableVertexAttribArray(ATTRIB_VERTEX);
  end;
  if TVertexFormat.vfNormal in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_NORMAL, 3, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfNormal, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_NORMAL);
  end;
  if TVertexFormat.vfTexCoord0 in Vertices.Format then
  begin
    glVertexAttribPointer(ATTRIB_TEXCOORD0, 2, GL_FLOAT, GL_FALSE, Vertices.VertexSize, Pointer(Integer(Vertices.Buffer) + GetVertexOffset(TVertexFormat.vfTexCoord0, Vertices.Format)));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD0);
  end;

  glDrawElements(GL_POINTS, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGLSL.SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix);
begin
end;

procedure TContextOpenGLSL.SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap);
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
    glBindTexture(GL_TEXTURE_2D, Integer(ABitmap.Handles[FirstContextGLSL]));
    glActiveTexture(GL_TEXTURE0);
  end;
end;

procedure TContextOpenGLSL.SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil);
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

procedure TContextOpenGLSL.SetStencilOp(const Fail, ZFail, ZPass: TStencilOp);
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

procedure TContextOpenGLSL.SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal);
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

procedure TContextOpenGLSL.UpdateBitmapHandle(ABitmap: TBitmap);
var
  i: Integer;
  Tex: THandle;
begin
  if ABitmap = nil then Exit;
  if ABitmap.Width * ABitmap.Height = 0 then
  begin
    ABitmap.HandlesNeedUpdate[FirstContextGLSL] := False;
    Exit;
  end;
  if FContextObject = nil then
    Exit;
  FContextObject.makeCurrentContext;
  { create - if need }
  if not ABitmap.HandleExists(FirstContextGLSL) then
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
    ABitmap.AddFreeNotify(FirstContextGLSL);
    ABitmap.HandleAdd(FirstContextGLSL);
    ABitmap.Handles[FirstContextGLSL] := Pointer(Tex);
    ABitmap.HandlesNeedUpdate[FirstContextGLSL] := False;
    FirstContextGLSL.FBitmaps.Add(ABitmap);
  end
  else
    if ABitmap.HandlesNeedUpdate[FirstContextGLSL] then
    begin
      Tex := THandle(ABitmap.Handles[FirstContextGLSL]);
      glBindTexture(GL_TEXTURE_2D, Tex);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ABitmap.Width, ABitmap.Height, 0,
        GL_RGBA, GL_UNSIGNED_BYTE, ABitmap.Startline);
      ABitmap.HandlesNeedUpdate[FirstContextGLSL] := False;
    end;
end;

procedure TContextOpenGLSL.DestroyBitmapHandle(ABitmap: TBitmap);
var
  Tex: cardinal;
begin
  if Valid then
  begin
    FContextObject.makeCurrentContext;
    if (ABitmap.HandleExists(FirstContextGLSL)) then
    begin
      ABitmap.RemoveFreeNotify(FirstContextGLSL);

      Tex := THandle(ABitmap.Handles[FirstContextGLSL]);
      if Tex <> 0 then
        glDeleteTextures(1, @Tex);

      FirstContextGLSL.FBitmaps.Remove(ABitmap);

      ABitmap.HandleRemove(FirstContextGLSL);
    end;
  end;
end;

{ vertex shaders }

function TContextOpenGLSL.CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
begin
  if Valid and (GLSLCode <> nil) and MakeCurrent then
    Result := TContextShader(BuildShader(GL_VERTEX_SHADER, GLSLCode))
  else
    Result := 0;
end;

procedure TContextOpenGLSL.DestroyVertexShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
  begin
    glDeleteShader(Shader);
  end;
end;

procedure TContextOpenGLSL.SetVertexShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    UseProgram(Shader, FCurrentPS);
end;

procedure TContextOpenGLSL.SetVertexShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid and MakeCurrent then
    glUniform4f(FVSParamLoc[index], V.X, V.Y, V.Z, V.W);
end;

procedure TContextOpenGLSL.SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid and MakeCurrent then
    glUniformMatrix4fv(FVSParamLoc[index], 1, GL_FALSE, @M);
end;

{ pixel shader }

function TContextOpenGLSL.CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
begin
  if Valid and (GLSLCode <> nil) and MakeCurrent then
    Result := TContextShader(BuildShader(GL_FRAGMENT_SHADER, GLSLCode))
  else
    Result := 0;
end;

procedure TContextOpenGLSL.DestroyPixelShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
  begin
    glDeleteShader(Shader);
  end;
end;

procedure TContextOpenGLSL.SetPixelShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    UseProgram(FCurrentVS, Shader);
end;

procedure TContextOpenGLSL.SetPixelShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid and MakeCurrent then
    glUniform4f(FPSParamLoc[index], V.X, V.Y, V.Z, V.W);
end;

procedure TContextOpenGLSL.SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid and MakeCurrent then
    glUniformMatrix4fv(FPSParamLoc[index], 1, GL_FALSE, @M);
end;

initialization
finalization
  if FirstContextGLSL <> nil then
    FirstContextGLSL.Free;
end.
