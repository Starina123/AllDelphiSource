{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Context_GLES;

{$I FMX_Defines.inc}

interface

{$linkframework QuartzCore}
{$IFDEF DARWIN}
{$modeswitch objectivec1}
{$ENDIF}

uses
  {$IFDEF WINDOWS}
  Windows,
  {$ENDIF}
  {$IFDEF DARWIN}
  iPhoneAll,
  {$ENDIF}
  Classes, SysUtils, UITypes, gles20, FMX_Types, FMX_Types3D, FMX_Platform;

type

  { TContextOpenGL }

  TContextOpenGL = class(TContext3D)
  private
    AllowSample: Boolean;
    { buffers }
    FRenderBuf: Integer;
    FFrameBuf: Integer;
    FDepthBuf: Integer;
    FColorBufTex: Integer;
    FContextObject: EAGLContext;
    { }
    FCurrentProgram: Integer;
    FCurrentWireFrame: Boolean;
    { Params }
    FTex0Loc: Integer;
    FTex1Loc: Integer;
    FTex2Loc: Integer;
    FTex3Loc: Integer;
    FVSParamLoc: array [0..95] of Integer;
    FPSParamLoc: array [0..7] of Integer;
    {}
    function BuildShader(AType: Integer; ACode: PAnsichar): Integer;
    { }
    procedure UseProgram(VS, PS: Integer); 
    function MakeCurrent: Boolean; inline;
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
    procedure CreateBuffer; override;
    procedure Resize; override;
    procedure FreeBuffer; override;
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
    property ContextObject: EAGLContext read FContextObject;
  published
  end;

implementation {===============================================================}

uses
  FMX_Filter;

function ColorToGlColor(AColor: TAlphaColor): TVector3D;
begin
  Result.X := TAlphaColorRec(AColor).R / $FF;
  Result.Y := TAlphaColorRec(AColor).G / $FF;
  Result.Z := TAlphaColorRec(AColor).B / $FF;
  Result.W := TAlphaColorRec(AColor).A / $FF;
end;

const

  ATTRIB_VERTEX     = 0;
  ATTRIB_NORMAL     = 1;
  ATTRIB_COLOR    = 2;
  ATTRIB_TEXCOORD0  = 3;

var
  FirstContext: TContextOpenGL;

{ TContextOpenGL }

constructor TContextOpenGL.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
var
  Status: Integer;
begin
  inherited;
  {$IFDEF IOS}
  if FirstContext = nil then
  begin
    FirstContext := Self;
//    FHandle := THandle(EAGLContext.alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FContextObject := EAGLContext.alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2);
    EAGLContext.setCurrentContext(FContextObject);
  end
  else
  begin
//    FHandle := THandle(EAGLContext.alloc.initWithAPI_sharegroup(kEAGLRenderingAPIOpenGLES2, EAGLContext(FirstContext.Handle).sharegroup));
    FContextObject := EAGLContext.alloc.initWithAPI_sharegroup(kEAGLRenderingAPIOpenGLES2, FirstContext.ContextObject.sharegroup);
    EAGLContext.setCurrentContext(FContextObject);
  end;
  {$ENDIF}
  glGenFramebuffers(1, @FFrameBuf);
  glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

  glGenRenderbuffers(1, @FRenderBuf);
  glBindRenderbuffer(GL_RENDERBUFFER, FRenderBuf);
  if Parent <> 0 then
    FContextObject.renderbufferStorage_fromDrawable(GL_RENDERBUFFER, CAEAGLLayer(Platform.FindForm(Parent).ContextHandle))
  else
  if FBitmap <> nil then
    glRenderbufferStorage(GL_RENDERBUFFER, GL_RGBA8_OES, FWidth, FHeight);
  glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBuf);
  glBindRenderbuffer(GL_RENDERBUFFER, 0);

  if FDepthStencil then
  begin
    glGenRenderbuffers(1, @FDepthBuf);
    glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, FWidth, FHeight);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
    glBindRenderbuffer(GL_RENDERBUFFER, 0);
  end;
  Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
  if (status <> GL_FRAMEBUFFER_COMPLETE) then
    Writeln('failed to make complete framebuffer object ' + InttoStr(status));
  glBindFramebuffer(GL_FRAMEBUFFER, 0);

  CreateBuffer;
end;

constructor TContextOpenGL.CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
var
  Status: Integer;
begin
  inherited;
  {$IFDEF IOS}
  if FirstContext = nil then
  begin
    FirstContext := Self;
//    FHandle := THandle(EAGLContext.alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FContextObject := EAGLContext.alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2);
    EAGLContext.setCurrentContext(FContextObject);
  end
  else
  begin
//    FHandle := THandle(EAGLContext.alloc.initWithAPI_sharegroup(kEAGLRenderingAPIOpenGLES2, EAGLContext(FirstContext.Handle).sharegroup));
    FContextObject := EAGLContext.alloc.initWithAPI_sharegroup(kEAGLRenderingAPIOpenGLES2, FirstContext.ContextObject.sharegroup);
    EAGLContext.setCurrentContext(FContextObject);
  end;
  {$ENDIF}
  glGenFramebuffers(1, @FFrameBuf);
  glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

  glGenRenderbuffers(1, @FRenderBuf);
  glBindRenderbuffer(GL_RENDERBUFFER, FRenderBuf);
  glRenderbufferStorage(GL_RENDERBUFFER, GL_RGBA8_OES, FWidth, FHeight);
  glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBuf);
  glBindRenderbuffer(GL_RENDERBUFFER, 0);

  if FDepthStencil then
  begin
    glGenRenderbuffers(1, @FDepthBuf);
    glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, FWidth, FHeight);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
    glBindRenderbuffer(GL_RENDERBUFFER, 0);
  end;
  Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
  if (status <> GL_FRAMEBUFFER_COMPLETE) then
    Writeln('failed to make complete framebuffer object ' + InttoStr(status));
  glBindFramebuffer(GL_FRAMEBUFFER, 0);

  CreateBuffer;
end;

destructor TContextOpenGL.Destroy;
begin
  if FCurrentProgram <> 0 then
    glDeleteProgram(FCurrentProgram);
  MakeCurrent;
  FreeBuffer;
  if FDepthBuf <> 0 then
    glDeleteRenderbuffers(1, @FDepthBuf);
  if FRenderBuf <> 0 then
    glDeleteRenderbuffers(1, @FRenderBuf);
  if FFrameBuf <> 0 then
    glDeleteFramebuffers(1, @FFrameBuf);
  {$IFDEF DARWIN}
  if Valid then
    FContextObject.release;
  {$ENDIF}
  inherited;
  if FirstContext = Self then
    FirstContext := nil;
  if ShaderDevice = Self then
    ShaderDevice := nil;
end;

procedure TContextOpenGL.CreateBuffer;
begin
  inherited ;
end;

procedure TContextOpenGL.Resize;
begin
  if not MakeCurrent then Exit;

  glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);
  glBindRenderbuffer(GL_RENDERBUFFER, FRenderBuf);
  if Parent <> 0 then
    FContextObject.renderbufferStorage_fromDrawable(GL_RENDERBUFFER, CAEAGLLayer(Platform.FindForm(Parent).ContextHandle))
  else
  if (FBitmap <> nil) then
    glRenderbufferStorage(GL_RENDERBUFFER, GL_RGBA8_OES, FWidth, FHeight);
  glBindRenderbuffer(GL_RENDERBUFFER, 0);
  if FDepthStencil then
  begin
    glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, FWidth, FHeight);
    glBindRenderbuffer(GL_RENDERBUFFER, 0);
  end;
end;

procedure TContextOpenGL.FreeBuffer;
begin
  inherited ;
end;

procedure TContextOpenGL.AssignToBitmap(Dest: TBitmap);
begin
  Dest.SetSize(FWidth, FHeight);
  glReadPixels(0, 0, FWidth, FHeight, GL_RGBA, GL_UNSIGNED_BYTE, Dest.StartLine);
  Dest.FlipVertical;
end;

function TContextOpenGL.BuildShader(AType: Integer; ACode: PAnsichar): Integer;
var
  log: AnsiString;
  compiled: Integer;
  Code: AnsiString;
begin
  if not MakeCurrent then Exit;

  Code := 'precision mediump float;'#13 + ACode;

  Result := glCreateShader(AType);
  glShaderSource(Result, 1, PPAnsichar(@Code), nil);
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

procedure TContextOpenGL.UseProgram(VS, PS: Integer);
var
  log: AnsiString;
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
    FVSParamLoc[i] := glGetUniformLocation(FCurrentProgram, PAnsiChar('VSParam' + InttoStr(i)));
  for i := 0 to High(FPSParamLoc) do
    FPSParamLoc[i] := glGetUniformLocation(FCurrentProgram, PAnsiChar('PSParam' + InttoStr(i)));
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

function TContextOpenGL.MakeCurrent: Boolean;
begin
  Result := True;
  if not Valid then
    Result := False;
  if Valid and (EAGLContext.currentContext <> FContextObject) then
    EAGLContext.setCurrentContext(FContextObject);
end;

function TContextOpenGL.GetValid: Boolean;
begin
  Result := FContextObject <> nil;
end;

function TContextOpenGL.DoBeginScene: Boolean;
begin
  Result := False;
  if not MakeCurrent then Exit;
  glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);
  glViewport(0, 0, FWidth, FHeight);
  { Render }
  Result := inherited DoBeginScene;
  { Default shaders }
  if FDepthStencil then
    glEnable(GL_DEPTH_TEST);

  glFrontFace(GL_CW);
  glEnable(GL_BLEND);
  glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
end;

procedure TContextOpenGL.DoEndScene(const CopyTarget: Boolean = True);
begin
  if not MakeCurrent then Exit;
  glBindRenderbuffer(GL_RENDERBUFFER, FRenderBuf);
  if (FBitmap <> nil) and CopyTarget then
  begin
    glFlush;
    glReadPixels(0, 0, FWidth, FHeight, GL_RGBA, GL_UNSIGNED_BYTE, FBitmap.StartLine);
    FBitmap.FlipVertical;
  end
  else
  if Valid then
    FContextObject.presentRenderbuffer(GL_RENDERBUFFER);
end;

procedure TContextOpenGL.ApplyContextState(AState: TContextState);
begin
  if not MakeCurrent then Exit;

  case AState of
    TContextState.csZTestOn:
      begin
        glEnable(GL_DEPTH_TEST);
        glDepthFunc(GL_LEQUAL);
//        glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
      end;
    TContextState.csZTestOff:
      begin
        glDisable(GL_DEPTH_TEST);
      end;
    TContextState.csZWriteOn:
      begin
        glDepthMask(1);
      end;
    TContextState.csZWriteOff:
      begin
        glDepthMask(0);
      end;
    TContextState.csAlphaTestOn:
      begin
//        glEnable(GL_ALPHA_TEST);
      end;
    TContextState.csAlphaTestOff:
      begin
//        glDisable(GL_ALPHA_TEST);
      end;
    TContextState.csAlphaBlendOn:
      begin
        glEnable(GL_BLEND);
      end;
    TContextState.csAlphaBlendOff:
      begin
        glDisable(GL_BLEND);
      end;
    TContextState.csStencilOn:
      begin
        glEnable(GL_STENCIL_TEST);
      end;
    TContextState.csStencilOff:
      begin
        glDisable(GL_STENCIL_TEST);
      end;
    TContextState.csColorWriteOn:
      begin
        glColorMask(1, 1, 1, 1);
      end;
    TContextState.csColorWriteOff:
      begin
        glColorMask(0, 0, 0, 0);
      end;
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
    TContextState.csAllFace:
      begin
        glDisable(GL_CULL_FACE);
      end;
    TContextState.csBlendAdditive:
      begin
        glEnable(GL_BLEND);
      end;
    TContextState.csBlendNormal:
      begin
        glEnable(GL_BLEND);
      end;
    { Tex stretch }
    TContextState.csTexNearest:
      begin
      end;
    TContextState.csTexLinear:
      begin
      end;
//    csFlat: glShadeModel(GL_FLAT);
//    csGouraud: glShadeModel(GL_SMOOTH);
  end;
end;

procedure TContextOpenGL.Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal);
var
  Flags: Integer;
begin
  if not MakeCurrent then Exit;

  Flags := 0;
  if FDepthStencil and (TClearTarget.ctDepth in ATarget) then
  begin
    Flags := Flags or GL_DEPTH_BUFFER_BIT;
    glClearDepthf(1.0);
  end;
  if FDepthStencil and (TClearTarget.ctStencil in ATarget) then
  begin
    Flags := Flags or GL_STENCIL_BUFFER_BIT;
    glClearStencil(0);
  end;
  if (TClearTarget.ctColor in ATarget) then
  begin
    Flags := Flags or GL_COLOR_BUFFER_BIT;
    glClearColor(TAlphaColorRec(AColor).R / $FF, TAlphaColorRec(AColor).G / $FF, TAlphaColorRec(AColor).B / $FF, TAlphaColorRec(AColor).A / $FF);
  end;
  glClear(Flags);
end;

procedure TContextOpenGL.DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single);
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

  if FCurrentWireFrame then
    glDrawElements(GL_LINE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer)
  else
    glDrawElements(GL_TRIANGLES, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_COLOR);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGL.DrawTrianglesStrip(const Vertices: TVertexBuffer;
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

  if FCurrentWireFrame then
    glDrawElements(GL_LINE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer)
  else
    glDrawElements(GL_TRIANGLE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);
  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGL.DrawTrianglesFan(const Vertices: TVertexBuffer;
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

  if FCurrentWireFrame then
    glDrawElements(GL_LINE_STRIP, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer)
  else
    glDrawElements(GL_TRIANGLE_FAN, Indices.Length, GL_UNSIGNED_SHORT, Indices.Buffer);

  glDisableVertexAttribArray(ATTRIB_VERTEX);
  glDisableVertexAttribArray(ATTRIB_NORMAL);
  glDisableVertexAttribArray(ATTRIB_TEXCOORD0);
end;

procedure TContextOpenGL.DrawLinesList(const Vertices: TVertexBuffer;
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

procedure TContextOpenGL.DrawLinesStrip(const Vertices: TVertexBuffer;
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

procedure TContextOpenGL.DrawPointsList(const Vertices: TVertexBuffer;
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

procedure TContextOpenGL.SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix);
begin
end;

procedure TContextOpenGL.SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap);
begin
  if MakeCurrent then
  begin
    glActiveTexture(GL_TEXTURE0 + AUnit);
    if ABitmap = nil then
      glBindTexture(GL_TEXTURE_2D, 0)
    else
    begin
      UpdateBitmapHandle(ABitmap);
      glBindTexture(GL_TEXTURE_2D, Integer(ABitmap.Handles[FirstContext]));
    end;
    glActiveTexture(GL_TEXTURE0);
  end;
end;

procedure TContextOpenGL.SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil);
var
  I: Integer;
begin
  if MakeCurrent then
  begin
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
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, trunc(ARect.Width), trunc(ARect.Height), 0, GL_RGBA, GL_UNSIGNED_BYTE, nil);
      for I := 0 to trunc(ARect.Height) - 1 do
        glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, I, 0, FHeight - I - 1, trunc(ARect.Width), 1);
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
  gFail, gZFail, gZPass: Integer;
begin
  if not MakeCurrent then Exit;

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

procedure TContextOpenGL.SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal);
var
  gFunc: Integer;
begin
  if not MakeCurrent then Exit;

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

procedure TContextOpenGL.UpdateBitmapHandle(ABitmap: TBitmap);
var
  Tex: THandle;
  i: Integer;
begin
  if ABitmap = nil then Exit;
  if ABitmap.Width * ABitmap.Height = 0 then
  begin
    ABitmap.HandlesNeedUpdate[FirstContext] := False;
    Exit;
  end;
  if not MakeCurrent then Exit;
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
    FirstContext.FBitmaps.Add(ABitmap);
  end
  else
    if ABitmap.HandlesNeedUpdate[FirstContext] then
    begin
      Tex := THandle(ABitmap.Handles[FirstContext]);
      glBindTexture(GL_TEXTURE_2D, Tex);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ABitmap.Width, ABitmap.Height, 0,
        GL_RGBA, GL_UNSIGNED_BYTE, ABitmap.Startline);
    end;
  ABitmap.HandlesNeedUpdate[FirstContext] := False;
end;

procedure TContextOpenGL.DestroyBitmapHandle(ABitmap: TBitmap);
var
  Tex: cardinal;
begin
  if not MakeCurrent then Exit;

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

{ vertex shaders }

function TContextOpenGL.CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
begin
  if Valid and (GLSLCode <> nil) and MakeCurrent then
    Result := TContextShader(BuildShader(GL_VERTEX_SHADER, GLSLCode))
  else
    Result := 0;
end;

procedure TContextOpenGL.DestroyVertexShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    glDeleteShader(Shader);
end;

procedure TContextOpenGL.SetVertexShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    UseProgram(Shader, FCurrentPS);
end;

procedure TContextOpenGL.SetVertexShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid and MakeCurrent then
    glUniform4f(FVSParamLoc[index], V.X, V.Y, V.Z, V.W);
end;

procedure TContextOpenGL.SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid and MakeCurrent then
    glUniformMatrix4fv(FVSParamLoc[index], 1, GL_FALSE, @M);
end;

{ pixel shader }

function TContextOpenGL.CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader;
begin
  if Valid and (GLSLCode <> nil) and MakeCurrent then
    Result := TContextShader(BuildShader(GL_FRAGMENT_SHADER, GLSLCode))
  else
    Result := 0;
end;

procedure TContextOpenGL.DestroyPixelShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    glDeleteShader(Shader);
end;

procedure TContextOpenGL.SetPixelShader(const Shader: TContextShader);
begin
  if Valid and (Shader <> 0) and MakeCurrent then
    UseProgram(FCurrentVS, Shader);
end;

procedure TContextOpenGL.SetPixelShaderVector(Index: Integer; const V: TVector3D);
begin
  if Valid and MakeCurrent then
    glUniform4f(FPSParamLoc[index], V.X, V.Y, V.Z, V.W);
end;

procedure TContextOpenGL.SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D);
begin
  if Valid and MakeCurrent then
    glUniformMatrix4fv(FPSParamLoc[index], 1, GL_FALSE, @M);
end;

initialization
  DefaultContextClass := TContextOpenGL;
end.
