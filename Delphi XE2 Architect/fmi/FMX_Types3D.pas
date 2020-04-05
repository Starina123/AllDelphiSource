{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Types3D;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes, FMX_Types;

{$SCOPEDENUMS ON}

const

  MaxBitmapSize: Integer = 2048;
  MaxLights: Integer = 8;

  DefaultAmbient: TAlphaColor = $FF202020;
  DefaultDiffuse: TAlphaColor = $FFFFFFFF;
  DefaultSpecular: TAlphaColor = $FF606060;
  DefaultShininess = 30;

{ Points and rects }

type

  TPoint3D = record
    X: Single;
    Y: Single;
    Z: Single;
  end;
  PPoint3D = ^TPoint3D;

  TBox = record
    Left, Top, Near, Right, Bottom, Far: Single;
  end;

  TVector3DType = array [0..3] of Single;

  PVector3D = ^TVector3D;

  TVector3D = record
    case Integer of
      0: (V: TVector3DType;);
      1: (X: Single;
          Y: Single;
          Z: Single;
          W: Single;);
  end;

  PVector3DArray = ^TVector3DArray;
  TVector3DArray = array [0 .. 0 shr 2] of TVector3D;

  TMatrix3DType = array [0..3] of TVector3D;

  TMatrix3D = record
    case Integer of
      0: (M: TMatrix3DType;);
      1: (m11, m12, m13, m14: Single;
          m21, m22, m23, m24: Single;
          m31, m32, m33, m34: Single;
          m41, m42, m43, m44: Single);
  end;

  PQuaternion3D = ^TQuaternion3D;

  TQuaternion3D = record
    ImagPart: TVector3D;
    RealPart: Single;
  end;

  TMatrix3DDynArray = array of TMatrix3D;
  TPoint3DDynArray = array of TPoint3D;
  TPointFDynArray = array of TPointF;

const

  IdentityQuaternion: TQuaternion3D = (ImagPart: (X: 0; Y: 0; Z: 0; W: 0); RealPart: 1);

  IdentityMatrix3D: TMatrix3D = (m11: 1.0; m12: 0.0; m13: 0.0; m14: 0.0; m21: 0.0; m22: 1.0;
    m23: 0.0; m24: 0.0; m31: 0.0; m32: 0.0; m33: 1.0; m34: 0.0; m41: 0.0; m42: 0.0; m43: 0.0; m44: 1.0;);

  XHmgVector: TVector3D = (X: 1; Y: 0; Z: 0; W: 0);
  YHmgVector: TVector3D = (X: 0; Y: 1; Z: 0; W: 0);
  ZHmgVector: TVector3D = (X: 0; Y: 0; Z: 1; W: 0);
  WHmgVector: TVector3D = (X: 0; Y: 0; Z: 0; W: 1);
  XYHmgVector: TVector3D = (X: 1; Y: 1; Z: 0; W: 0);
  XYZHmgVector: TVector3D = (X: 1; Y: 1; Z: 1; W: 0);
  XYZWHmgVector: TVector3D = (X: 1; Y: 1; Z: 1; W: 1);

  NullVector3D: TVector3D = (X: 0; Y: 0; Z: 0; W: 1);
  NullPoint3D: TPoint3D = (X: 0; Y: 0; Z: 0);

type

  TContext3D = class;
  TViewport3D = class;
  TControl3D = class;
  TCamera = class;
  TLight = class;
  TDummy = class;
  TVertexBuffer = class;
  TIndexBuffer = class;

  IViewport3D = interface
    ['{EF9EE200-8CF4-438E-A598-5601083E6EA2}']
    function GetObject: TFmxObject;
    function GetContext: TContext3D;
    function GetScene: IScene;
    function GetDesignCamera: TCamera;
    procedure SetDesignCamera(const ACamera: TCamera);
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
    procedure NeedRender;
    { access }
    property DesignCamera: TCamera read GetDesignCamera write SetDesignCamera;
    property Scene: IScene read GetScene;
    property Context: TContext3D read GetContext;
  end;

{ TPosition3D }

  TPosition3D = class(TPersistent)
  private
    FOnChange: TNotifyEvent;
    FSave: TVector3D;
    FY: Single;
    FX: Single;
    FZ: Single;
    FDefaultValue: TPoint3D;
    FOnChangeY: TNotifyEvent;
    FOnChangeX: TNotifyEvent;
    FOnChangeZ: TNotifyEvent;
    procedure SetPoint3D(const Value: TPoint3D);
    procedure SetX(const Value: Single);
    procedure SetY(const Value: Single);
    procedure SetZ(const Value: Single);
    function GetPoint3D: TPoint3D;
    function GetVector: TVector3D;
    procedure SetVector(const Value: TVector3D);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadPoint(Reader: TReader);
    procedure WritePoint(Writer: TWriter);
  public
    constructor Create(const ADefaultValue: TPoint3D); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure SetPoint3DNoChange(const P: TPoint3D);
    procedure SetVectorNoChange(const P: TVector3D);
    function Empty: Boolean;
    property Point: TPoint3D read GetPoint3D write SetPoint3D;
    property Vector: TVector3D read GetVector write SetVector;
    property DefaultValue: TPoint3D read FDefaultValue write FDefaultValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeX: TNotifyEvent read FOnChangeX write FOnChangeX;
    property OnChangeY: TNotifyEvent read FOnChangeY write FOnChangeY;
    property OnChangeZ: TNotifyEvent read FOnChangeZ write FOnChangeZ;
  published
    property X: Single read FX write SetX stored False;
    property Y: Single read FY write SetY stored False;
    property Z: Single read FZ write SetZ stored False;
  end;

{ TMeshData }

  TMeshVertex = packed record
    x, y, z: single;
    nx, ny, nz: single;
    tu, tv: single;
  end;

  TMeshData = class(TPersistent)
  private
    FVertexBuffer: TVertexBuffer;
    FIndexBuffer: TIndexBuffer;
    FOnChanged: TNotifyEvent;
    FRecalcBounds: Boolean;
    FSize: TPoint3D;
    function GetNormals: AnsiString;
    function GetPoint3Ds: AnsiString;
    function GetTexCoordinates: AnsiString;
    procedure SetNormals(const Value: AnsiString);
    procedure SetPoint3Ds(const Value: AnsiString);
    procedure SetTexCoordinates(const Value: AnsiString);
    function GetTriangleIndices: AnsiString;
    procedure SetTriangleIndices(const Value: AnsiString);
  protected
    procedure Assign(Source: TPersistent); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadMesh(Stream: TStream);
    procedure WriteMesh(Stream: TStream);
  public
    constructor Create; virtual;
    procedure AssignFromMeshVertex(const Vertices: array of TMeshVertex; const Indices: array of Word);
    destructor Destroy; override;
    procedure Clear;
    procedure CalcNormals;
    function RayCastIntersect(const Width, Height, Depth: single; const RayPos, RayDir: TVector3D;
      var Intersection: TVector3D): Boolean;
    property VertexBuffer: TVertexBuffer read FVertexBuffer;
    property IndexBuffer: TIndexBuffer read FIndexBuffer;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Normals: AnsiString read GetNormals write SetNormals stored False;
    property Points: AnsiString read GetPoint3Ds write SetPoint3Ds stored False;
    property TexCoordinates: AnsiString read GetTexCoordinates write SetTexCoordinates stored False;
    property TriangleIndices: AnsiString read GetTriangleIndices write SetTriangleIndices stored False;
  end;

{ TMaterial }

  TTextureMode = (tmModulate, tmReplace);

  TTextureFiltering = (tfNearest, tfLinear);
  
  TShadeMode = (smFlat, smGouraud);

  TFillMode = (fmSolid, fmWireframe);

  TMaterial = class(TPersistent)
  private
    FOnChanged: TNotifyEvent;
    FDiffuse: TAlphaColor;
    FAmbient: TAlphaColor;
    FModulation: TTextureMode;
    FLighting: Boolean;
    FShadeMode: TShadeMode;
    FFillMode: TFillMode;
    FSpecular: TAlphaColor;
    FEmissive: TAlphaColor;
    FTexture: TBitmap;
    FShininess: Integer;
    FTextureFiltering: TTextureFiltering;
    procedure SetDiffuse(const Value: TAlphaColor);
    procedure SetAmbient(const Value: TAlphaColor);
    procedure SetModulation(const Value: TTextureMode);
    procedure SetLighting(const Value: Boolean);
    procedure SetShadeMode(const Value: TShadeMode);
    procedure SetFillMode(const Value: TFillMode);
    procedure SetSpecular(const Value: TAlphaColor);
    procedure SetEmissive(const Value: TAlphaColor);
    function IsAmbientStored: Boolean;
    function IsDiffuseStored: Boolean;
    function IsEmissiveStored: Boolean;
    function IsSpecularStored: Boolean;
    procedure SetTexture(const Value: TBitmap);
    procedure DoTextureChanged(Sender: TObject);
    procedure SetShininess(const Value: Integer);
    procedure SetTextureFiltering(const Value: TTextureFiltering);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Diffuse: TAlphaColor read FDiffuse write SetDiffuse stored IsDiffuseStored;
    property Ambient: TAlphaColor read FAmbient write SetAmbient stored IsAmbientStored;
    property Emissive: TAlphaColor read FEmissive write SetEmissive stored IsEmissiveStored;
    property Specular: TAlphaColor read FSpecular write SetSpecular stored IsSpecularStored;
    property Lighting: Boolean read FLighting write SetLighting default True;
    property FillMode: TFillMode read FFillMode write SetFillMode default TFillMode.fmSolid;
    property Modulation: TTextureMode read FModulation write SetModulation default TTextureMode.tmModulate;
    property Texture: TBitmap read FTexture write SetTexture;
    property TextureFiltering: TTextureFiltering read FTextureFiltering write SetTextureFiltering default TTextureFiltering.tfLinear;
    property ShadeMode: TShadeMode read FShadeMode write SetShadeMode default TShadeMode.smGouraud;
    property Shininess: Integer read FShininess write SetShininess default DefaultShininess;
  end;

{ TVertexBuffer }

  TVertexFormat = (
    vfVertex,
    vfNormal,
    vfDiffuse,
    vfSpecular,
    vfTexCoord0,
    vfTexCoord1,
    vfTexCoord2,
    vfTexCoord3
  );
  TVertexFormats = set of TVertexFormat;

  TVertexBuffer = class(TPersistent)
  private
    FBuffer: Pointer;
    FFormat: TVertexFormats;
    FLength: Integer;
    FSize: Integer;
    FVertexSize: Integer;
    FTexCoord0: Integer;
    FTexCoord1: Integer;
    FTexCoord2: Integer;
    FTexCoord3: Integer;
    FDiffuse: Integer;
    FSpecular: Integer;
    FNormal: Integer;
    function GetVertices(AIndex: Integer): TPoint3D;
    function GetTexCoord0(AIndex: Integer): TPointF;
    function GetDiffuse(AIndex: Integer): TAlphaColor;
    function GetNormals(AIndex: Integer): TPoint3D;
    function GetSpecular(AIndex: Integer): TAlphaColor;
    function GetTexCoord1(AIndex: Integer): TPointF;
    function GetTexCoord2(AIndex: Integer): TPointF;
    function GetTexCoord3(AIndex: Integer): TPointF;
    procedure SetVertices(AIndex: Integer; const Value: TPoint3D); inline;
    procedure SetDiffuse(AIndex: Integer; const Value: TAlphaColor); inline;
    procedure SetNormals(AIndex: Integer; const Value: TPoint3D); inline;
    procedure SetSpecular(AIndex: Integer; const Value: TAlphaColor); inline;
    procedure SetTexCoord0(AIndex: Integer; const Value: TPointF); inline;
    procedure SetTexCoord1(AIndex: Integer; const Value: TPointF); inline;
    procedure SetTexCoord2(AIndex: Integer; const Value: TPointF); inline;
    procedure SetTexCoord3(AIndex: Integer; const Value: TPointF); inline;
    procedure SetLength(const Value: Integer);
  protected
    procedure Assign(Source: TPersistent); override;
  public
    constructor Create(const AFormat: TVertexFormats; const ALength: Integer); virtual;
    destructor Destroy; override;
    property Buffer: Pointer read FBuffer;
    property Size: Integer read FSize;
    property VertexSize: Integer read FVertexSize;
    property Length: Integer read FLength write SetLength;
    property Format: TVertexFormats read FFormat;
    { items access }
    property Vertices[AIndex: Integer]: TPoint3D read GetVertices write SetVertices;
    property Normals[AIndex: Integer]: TPoint3D read GetNormals write SetNormals;
    property Diffuse[AIndex: Integer]: TAlphaColor read GetDiffuse write SetDiffuse;
    property Specular[AIndex: Integer]: TAlphaColor read GetSpecular write SetSpecular;
    property TexCoord0[AIndex: Integer]: TPointF read GetTexCoord0 write SetTexCoord0;
    property TexCoord1[AIndex: Integer]: TPointF read GetTexCoord1 write SetTexCoord1;
    property TexCoord2[AIndex: Integer]: TPointF read GetTexCoord2 write SetTexCoord2;
    property TexCoord3[AIndex: Integer]: TPointF read GetTexCoord3 write SetTexCoord3;
  end;

{ TIndexBuffer }

  TIndexBuffer = class(TPersistent)
  private
    FBuffer: Pointer;
    FLength: Integer;
    FSize: Integer;
    function GetIndices(AIndex: Integer): Integer; inline;
    procedure SetIndices(AIndex: Integer; const Value: Integer); inline;
    procedure SetLength(const Value: Integer);
  protected
    procedure Assign(Source: TPersistent); override;
  public
    constructor Create(const ALength: Integer); virtual;
    destructor Destroy; override;
    property Buffer: Pointer read FBuffer;
    property Size: Integer read FSize;
    property Length: Integer read FLength write SetLength;
    { items access }
    property Indices[AIndex: Integer]: Integer read GetIndices write SetIndices; default;
  end;

  TProjection = (pjCamera, pjScreen);

  TMultisample = (msNone, ms2Samples, ms4Samples);

  TClearTarget = (ctColor, ctDepth, ctStencil);
  TClearTargets = set of TClearTarget;

  TStencilOp = (
    soKeep,
    soZero,
    soReplace,
    soIncrease,
    soDecrease,
    soInvert
  );

  TStencilFunc = (
    sfNever,
    sfLess,
    sfLequal,
    sfGreater,
    fsGequal,
    sfEqual,
    sfNotEqual,
    sfAlways
  );

  TMaterialColor = (
    mcDiffuse,
    mcAmbient,
    mcSpecular,
    mcEmissive
  );

{ TContext3D }

  TContextState = (
    // 2D screen matrix
    cs2DScene,
    // 3D camera matrix
    cs3DScene,
    // Lights
    csLightOn, csLightOff,
    // Depth
    csZTestOn, csZTestOff,
    csZWriteOn, csZWriteOff,
    // Alpha Blending
    csAlphaTestOn, csAlphaTestOff,
    csAlphaBlendOn, csAlphaBlendOff,
    // Stencil
    csStencilOn, csStencilOff,
    // Color
    csColorWriteOn, csColorWriteOff,
    // Faces
    csFrontFace, csBackFace, csAllFace,
    // Blending mode
    csBlendAdditive, csBlendNormal,
    // Tex stretch
    csTexNearest, csTexLinear,
    // Tex modulation
    csTexDisable, csTexReplace, csTexModulate,
    // fill mode
    csFrame, csSolid,
    // shade mode
    csFlat, csGouraud
  );

  TContextShader = type THandle;

  TContext3D = class(TInterfacedPersistent, IFreeNotification)
  private
    FBeginSceneCount: integer;
  protected
    FParent: TFmxHandle;
    FWidth, FHeight: Integer;
    FBitmap: TBitmap;
    FViewport: TViewport3D;
    FBitmaps: TList;
    { buffer }
    FBuffered: Boolean;
    FBufferBits: Pointer;
    FBufferHandle: THandle;
    { style }
    FMultisample: TMultisample;
    FDepthStencil: Boolean;
    { lights }
    FLights: TList;
    { states }
    FCurrentStates: array [TContextState] of Boolean;
    FCurrentCamera: TCamera;
    FCurrentCameraMatrix: TMatrix3D;
    FCurrentCameraInvMatrix: TMatrix3D;
    FCurrentMatrix: TMatrix3D;
    FCurrentDiffuse: TAlphaColor;
    FCurrentSpecular: TAlphaColor;
    FCurrentAmbient: TAlphaColor;
    FCurrentEmissive: TAlphaColor;
    FCurrentOpacity: Single;
    FCurrentShininess: Integer;
    FCurrentColoredVertices: Boolean;
    FCurrentVS: TContextShader;
    FCurrentPS: TContextShader;
    { paintto }
    FPaintToMatrix: TMatrix3D;
    { default shaders }
    FDefaultVS_NoLight: TContextShader;
    FDefaultVS_1Light: TContextShader;
    FDefaultVS_2Light: TContextShader;
    FDefaultVS_3Light: TContextShader;
    FDefaultVS_4Light: TContextShader;
    FDefaultVS_Full: TContextShader;
    FDefaultPS: TContextShader;
    procedure ApplyContextState(AState: TContextState); virtual; abstract;
    function GetProjectionMatrix: TMatrix3D; virtual;
    function GetScreenMatrix: TMatrix3D; virtual;
    function GetPixelToPixelPolygonOffset: TPointF; virtual;
    { TPersistent }
    procedure AssignTo(Dest: TPersistent); override;
    procedure AssignToBitmap(Dest: TBitmap); virtual; abstract;
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
    { Bitmap  }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); virtual; abstract;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); virtual; abstract;
    { validation }
    function GetValid: Boolean; virtual; abstract;
    { shader params }
    procedure SetParams;
    procedure CreateDefaultShaders; 
    procedure FreeDefaultShaders; 
    function DoBeginScene: Boolean; virtual;
    procedure DoEndScene(const CopyTarget: Boolean = True); virtual;
  public
    { Don't call contructor directly from TContext3D - only using DefaultContextClass variable }
    constructor CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); virtual;
    constructor CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); virtual;
    destructor Destroy; override;
    procedure SetMultisample(const Multisample: TMultisample); virtual;
    procedure SetSize(const AWidth, AHeight: Integer);
    { buffer }
    procedure FreeBuffer; virtual; 
    procedure Resize; virtual; abstract;
    procedure CreateBuffer; virtual; 
    { lights }
    procedure AddLight(const ALight: TLight);
    procedure DeleteLight(const ALight: TLight);
    { rendering }
    procedure ResetScene; // default settings
    function BeginScene: Boolean;
    procedure EndScene(const CopyTarget: Boolean = True);
    property BeginSceneCount: integer read FBeginSceneCount;
    { low-level - must be overrided }
    procedure Clear(const ATarget: TClearTargets; const AColor: TAlphaColor; const ADepth: single; const AStencil: Cardinal); virtual; abstract;
    procedure SetCamera(const Camera: TCamera); virtual;
    procedure SetColor(const AMaterialColor: TMaterialColor; AColor: TAlphaColor); virtual;
    procedure SetMatrix(const M: TMatrix3D); virtual; 
    procedure SetContextState(const State: TContextState); virtual;
    procedure SetStencilOp(const Fail, ZFail, ZPass: TStencilOp); virtual; abstract;
    procedure SetStencilFunc(const Func: TStencilfunc; Ref, Mask: cardinal); virtual; abstract;
    procedure SetTextureMatrix(const AUnit: Integer; const AMatrix: TMatrix); virtual; abstract;
    procedure SetTextureUnit(const AUnit: Integer; const ABitmap: TBitmap); virtual; abstract;
    procedure SetTextureUnitFromContext(const AUnit: Integer; const ARect: PRectF = nil); virtual; abstract;
    procedure DrawTrianglesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    procedure DrawTrianglesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    procedure DrawTrianglesFan(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    procedure DrawLinesList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    procedure DrawLinesStrip(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    procedure DrawPointsList(const Vertices: TVertexBuffer; const Indices: TIndexBuffer; const Opacity: Single); virtual; abstract;
    { vertex shaders }
    function CreateVertexShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader; virtual; abstract;
    procedure DestroyVertexShader(const Shader: TContextShader); virtual; abstract;
    procedure SetVertexShader(const Shader: TContextShader); virtual; abstract;
    procedure SetVertexShaderVector(Index: Integer; const V: TVector3D); virtual; abstract;
    procedure SetVertexShaderMatrix(Index: Integer; const M: TMatrix3D); virtual; abstract;
    { pixel shaders }
    function CreatePixelShader(DXCode, ARBCode, GLSLCode: Pointer): TContextShader; virtual; abstract;
    procedure DestroyPixelShader(const Shader: TContextShader); virtual; abstract;
    procedure SetPixelShader(const Shader: TContextShader); virtual; abstract;
    procedure SetPixelShaderVector(Index: Integer; const V: TVector3D); virtual; abstract;
    procedure SetPixelShaderMatrix(Index: Integer; const M: TMatrix3D); virtual; abstract;
    { pick }
    procedure Pick(X, Y: Single; const AProj: TProjection; var RayPos, RayDir: TVector3D);
    function WorldToScreen(const AProj: TProjection; const P: TPoint3D): TPoint3D;
    { high-level - implemented in TContext3D }
    { drawing }
    procedure SetMaterial(const AMaterial: TMaterial);
    procedure DrawLine(const StartPoint, EndPoint: TVector3D; const Opacity: Single);
    procedure DrawCube(const Center, Size: TVector3D; const Opacity: Single);
    procedure FillCube(const Center, Size: TVector3D; const Opacity: Single);
    procedure FillMesh(const Center, Size: TVector3D; const MeshData: TMeshData; const Opacity: Single);
    { pseudo 2D }
    procedure FillPolygon(const Center, Size: TVector3D; const Rect: TRectF; const Points: TPolygon;
      const Opacity: Single; Front: Boolean = True; Back: Boolean = True; Left: Boolean = True);
    procedure FillRect(const Rect: TRectF; const Depth, Opacity: Single);
    { acces }
    property CurrentMatrix: TMatrix3D read FCurrentMatrix;
    property CurrentCamera: TCamera read FCurrentCamera;
    property CurrentCameraMatrix: TMatrix3D read FCurrentCameraMatrix;
    property CurrentCameraInvMatrix: TMatrix3D read FCurrentCameraInvMatrix;
    property CurrentPojectionMatrix: TMatrix3D read GetProjectionMatrix;
    property CurrentScreenMatrix: TMatrix3D read GetScreenMatrix;
    property PixelToPixelPolygonOffset: TPointF read GetPixelToPixelPolygonOffset;
    property Height: Integer read FHeight;
    property Width: Integer read FWidth;
    { internal usage }
    // Window handle ( for example HWnd )
    property Parent: TFmxHandle read FParent write FParent;
    // Buffer if exists
    property Buffered: Boolean read FBuffered;
    property BufferBits: Pointer read FBufferBits;
    property BufferHandle: THandle read FBufferHandle; // HDC
    { Is this a valid/active context? }
    property Valid: Boolean read GetValid;
  end;

{ TControl3D }

  TContext3DClass = class of TContext3D;

  TMouseEvent3D = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single;
    RayPos, RayDir: TVector3D) of object;
  TMouseMoveEvent3D = procedure(Sender: TObject; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D) of object;

  TRenderEvent = procedure(Sender: TObject; Context: TContext3D) of object;

  TDragEnterEvent3D = procedure(Sender: TObject; const Data: TDragObject; const Point: TPoint3D) of object;
  TDragOverEvent3D = procedure(Sender: TObject; const Data: TDragObject; const Point: TPoint3D; var Accept: Boolean)
    of object;
  TDragDropEvent3D = procedure(Sender: TObject; const Data: TDragObject; const Point: TPoint3D) of object;

  PObjectAtPointData = ^TObjectAtPointData;
  TObjectAtPointData = record
    Distance: single;
    Projection: TProjection;
  end;

  TControl3D = class(TFmxObject, IControl)
  private
    FVisible: Boolean;
    FOnMouseUp: TMouseEvent3D;
    FOnMouseDown: TMouseEvent3D;
    FOnMouseMove: TMouseMoveEvent3D;
    FOnMouseWheel: TMouseWheelEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FMouseInObject: Boolean;
    FHitTest: Boolean;
    FClipChildren: Boolean;
    FAutoCapture: Boolean;
    FLocked: Boolean;
    FTempContext: TContext3D;
    FPosition: TPosition3D;
    FQuaternion: TQuaternion3D;
    FRotationAngle: TPosition3D;
    FScale: TPosition3D;
    FSkew: TPosition3D;
    FCanFocus: Boolean;
    FIsMouseOver: Boolean;
    FIsFocused: Boolean;
    FRotationCenter: TPosition3D;
    FOnKeyUp: TKeyEvent;
    FOnKeyDown: TKeyEvent;
    FOnRender: TRenderEvent;
    FDesignVisible: Boolean;
    FTwoSide: Boolean;
    FDragMode: TDragMode;
    FDisableDragHighlight: Boolean;
    FOnDragEnter: TDragEnterEvent3D;
    FOnDragDrop: TDragDropEvent3D;
    FOnDragEnd: TNotifyEvent;
    FOnDragLeave: TNotifyEvent;
    FOnDragOver: TDragOverEvent3D;
    FIsDragOver: Boolean;
    FShowHint: Boolean;
    FHint: WideString;
    FPopupMenu: TPopup;
    FPressed, FDoubleClick: Boolean;
    FCursor: TCursor;
    FShowContextMenu: Boolean;
    FTabOrder: TTabOrder;
    FAcceptsControls: boolean;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    function GetInvertAbsoluteMatrix: TMatrix3D;
    procedure SetHitTest(const Value: Boolean);
    procedure SetClipChildren(const Value: Boolean);
    function GetContext: TContext3D;
    procedure SetLocked(const Value: Boolean);
    procedure SetTempContext(const Value: TContext3D);
    procedure SetOpacity(const Value: Single);
    function IsOpacityStored: Boolean;
    function GetAbsolutePosition: TVector3D;
    function GetAbsoluteUp: TVector3D;
    function GetAbsoluteDirection: TVector3D;
    function GetAbsoluteLeft: TVector3D;
    procedure SetAbsolutePosition(Value: TVector3D);
    function GetScreenBounds: TRectF;
    procedure ReadQuaternion(Reader: TReader);
    procedure WriteQuaternion(Writer: TWriter);
    procedure SetZWrite(const Value: Boolean);
    procedure SetDesignVisible(const Value: Boolean);
    procedure SetTabOrder(const Value: TTabOrder);
    function GetTabOrder: TTabOrder;
    function GetCursor: TCursor;
  protected
    FZWrite: Boolean;
    FProjection: TProjection;
    FViewport: IViewport3D;
    FHeight, FLastHeight: Single;
    FWidth, FLastWidth: Single;
    FDepth, FLastDepth: Single;
    FLocalMatrix: TMatrix3D;
    FAbsoluteMatrix: TMatrix3D;
    FInvAbsoluteMatrix: TMatrix3D;
    FRecalcAbsolute: Boolean;
    FDisableAlign: Boolean;
    FCanResize, FCanRotate: Boolean;
    FBody: Integer;
    FDesignInteract: Boolean;
    FDesignLocked: Boolean;
    FOpacity, FAbsoluteOpacity: Single;
    FRecalcOpacity: Boolean;
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    function CheckHitTest(const AHitTest: Boolean): Boolean;
    { props }
    procedure SetVisible(const Value: Boolean); virtual;
    procedure SetHeight(const Value: Single); virtual;
    procedure SetWidth(const Value: Single); virtual;
    procedure SetDepth(const Value: Single); virtual;
    procedure SetProjection(const Value: TProjection); virtual;
    { matrix }
    function GetAbsoluteMatrix: TMatrix3D; virtual;
    { opacity }
    function GetAbsoluteOpacity: Single; virtual;
    procedure RecalcOpacity; virtual;
    { design }
    procedure DesignSelect; virtual;
    procedure DesignClick; virtual;
    { events }
    procedure Capture;
    procedure ReleaseCapture;
    procedure MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); virtual;
    procedure MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); virtual;
    procedure MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D); virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); virtual;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    procedure DialogKey(var Key: Word; Shift: TShiftState); virtual;
    procedure Click; virtual;
    procedure DblClick; virtual;
    procedure ContextMenu(const ScreenPosition: TPoint3D); virtual;
    procedure DragEnter(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); virtual;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragLeave; virtual;
    procedure DragEnd; virtual;
    { IControl }
    procedure DoMouseEnter; virtual;
    procedure DoMouseLeave; virtual;
    procedure DoEnter; virtual;
    procedure DoExit; virtual;
    function ObjectAtPoint(P: TPointF): IControl; virtual;
    function GetObject: TFmxObject;
    function GetVisible: Boolean;
    function GetDesignInteractive: Boolean;
    function AbsoluteToLocal(P: TPointF): TPointF;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure MouseMove(Shift: TShiftState; X, Y: Single);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    function GetTabOrderValue: TTabOrder;
    procedure UpdateTabOrder(Value: TTabOrder);
    function CheckForAllowFocus: Boolean;
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
    procedure BeginAutoDrag;
    function GetDragMode: TDragMode;
    procedure SetDragMode(const ADragMode: TDragMode);
    function GetParent: TFmxObject;
    function GetLocked: Boolean;
    function GetHitTest: Boolean;
    function GetAcceptsControls: boolean;
    procedure SetAcceptsControls(const Value: boolean);

    function FindTarget(P: TPointF; const Data: TDragObject): IControl; virtual;
    { paint }
    procedure Apply; virtual;
    procedure Render; virtual;
    procedure RenderChildren; virtual;
    procedure UnApply; virtual;
    { alignment }
    procedure Resize3D; virtual;
    { changes }
    procedure MatrixChanged(Sender: TObject); virtual;
    procedure RotateXChanged(Sender: TObject); virtual;
    procedure RotateYChanged(Sender: TObject); virtual;
    procedure RotateZChanged(Sender: TObject); virtual;
    { props }
    property MouseInObject: Boolean read FMouseInObject write FMouseInObject;
    property Skew: TPosition3D read FSkew write FSkew;
    property TempContext: TContext3D read FTempContext write SetTempContext;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    procedure SetNewViewport(AViewport: IViewport3D); virtual;
    { Calculate best fit size using AWidth and AHeight, create TBitmap object and render to this bitmap. }
    procedure PaintToBitmap(ABitmap: TBitmap; AWidth, AHeight: Integer; ClearColor: TAlphaColor;
      AutoFit: Boolean = False; const AMultisample: TMultisample = TMultisample.msNone);
    { Create SuperSampled object's snapshot using tile-rendering and interpolation. Multisample can be 1..16 }
    procedure CreateHighMultisampleSnapshot(ABitmap: TBitmap; AWidth, AHeight: Integer; ClearColor: TAlphaColor;
      Multisample: Integer);
    { Create tile-part of snaphot. Tiles can be merge. }
    procedure CreateTileSnapshot(ABitmap: TBitmap; AWidth, AHeight, OffsetX, OffsetY: Integer;
      Scale: Single; ClearColor: TAlphaColor);
    procedure CopyRotationFrom(const AObject: TControl3D);
    procedure RecalcAbsolute; virtual;
    function AbsoluteToLocal3D(P: TPoint3D): TPoint3D; virtual;
    function LocalToAbsolute3D(P: TPoint3D): TPoint3D; virtual;
    function AbsoluteToLocalVector(P: TVector3D): TVector3D; virtual;
    function LocalToAbsoluteVector(P: TVector3D): TVector3D; virtual;
    procedure SetSize(const AWidth, AHeight, ADepth: single);
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; virtual;
    procedure ResetRotationAngle;
    procedure SetFocus;
    procedure Repaint;
    procedure Lock;
    procedure DoRender;
    property AbsoluteMatrix: TMatrix3D read GetAbsoluteMatrix;
    property LocalMatrix: TMatrix3D read FLocalMatrix;
    property AbsolutePosition: TVector3D read GetAbsolutePosition write SetAbsolutePosition;
    property AbsoluteUp: TVector3D read GetAbsoluteUp;
    property AbsoluteDirection: TVector3D read GetAbsoluteDirection;
    property AbsoluteLeft: TVector3D read GetAbsoluteLeft;
    property AbsoluteOpacity: Single read GetAbsoluteOpacity;
    property InvertAbsoluteMatrix: TMatrix3D read GetInvertAbsoluteMatrix;
    property Context: TContext3D read GetContext;
    property DesignInteract: Boolean read FDesignInteract;
    property AutoCapture: Boolean read FAutoCapture write FAutoCapture default False;
    property RotationCenter: TPosition3D read FRotationCenter write FRotationCenter;
    property ScreenBounds: TRectF read GetScreenBounds;
    property CanFocus: Boolean read FCanFocus write FCanFocus;
    property TabOrder: TTabOrder read GetTabOrder write SetTabOrder;
    property DesignLocked: Boolean read FDesignLocked write FDesignLocked;
    property DisableDragHighlight: Boolean read FDisableDragHighlight write FDisableDragHighlight default False;
    property Hint: WideString read FHint write FHint;
    property ShowHint: Boolean read FShowHint write FShowHint default False;
  published
    { triggers }
    property IsDragOver: Boolean read FIsDragOver;
    property IsMouseOver: Boolean read FIsMouseOver;
    property IsFocused: Boolean read FIsFocused;
    property IsVisible: Boolean read FVisible;
    { props }
    property Cursor: TCursor read GetCursor write FCursor default crDefault;
    property DragMode: TDragMode read GetDragMode write SetDragMode default TDragMode.dmManual;
    property DesignVisible: Boolean read FDesignVisible write SetDesignVisible default True;
    property Position: TPosition3D read FPosition write FPosition;
    property Scale: TPosition3D read FScale write FScale;
    property RotationAngle: TPosition3D read FRotationAngle write FRotationAngle;
    property Locked: Boolean read FLocked write SetLocked default False;
    property Width: Single read FWidth write SetWidth;
    property Height: Single read FHeight write SetHeight;
    property Depth: Single read FDepth write SetDepth;
    property Opacity: Single read FOpacity write SetOpacity stored IsOpacityStored;
    property Projection: TProjection read FProjection write SetProjection default TProjection.pjCamera;
    property HitTest: Boolean read FHitTest write SetHitTest default True;
//    property Hint: WideString read FHint write FHint;
//    property ShowHint: Boolean read FShowHint write FShowHint default False;
    property ShowContextMenu: Boolean read FShowContextMenu write FShowContextMenu default True;
    property TwoSide: Boolean read FTwoSide write FTwoSide default False;
    property Visible: Boolean read FVisible write SetVisible default True;
    property ZWrite: Boolean read FZWrite write SetZWrite default True;
    property OnDragEnter: TDragEnterEvent3D read FOnDragEnter write FOnDragEnter;
    property OnDragLeave: TNotifyEvent read FOnDragLeave write FOnDragLeave;
    property OnDragOver: TDragOverEvent3D read FOnDragOver write FOnDragOver;
    property OnDragDrop: TDragDropEvent3D read FOnDragDrop write FOnDragDrop;
    property OnDragEnd: TNotifyEvent read FOnDragEnd write FOnDragEnd;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TMouseEvent3D read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TMouseMoveEvent3D read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TMouseEvent3D read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnRender: TRenderEvent read FOnRender write FOnRender;
  end;

{ TCamera }

  TCamera = class(TControl3D)
  private
    FSaveCamera: TCamera;
    FTarget: TControl3D;
    procedure SetTarget(const Value: TControl3D);
  protected
    procedure Render; override;
    procedure DesignClick; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property HitTest default False;
    property Target: TControl3D read FTarget write SetTarget;
  end;

{ TLight }

  TLightType = (ltDirectional, ltPoint, ltSpot);

  TLight = class(TControl3D)
  private
    FEnabled: Boolean;
    FLightType: TLightType;
    FConstantAttenuation: Single;
    FQuadraticAttenuation: Single;
    FLinearAttenuation: Single;
    FSpotCutOff: Single;
    FSpotExponent: Single;
    FDiffuse: TAlphaColor;
    FSpecular: TAlphaColor;
    FAmbient: TAlphaColor;
    procedure SetLightType(const Value: TLightType);
    procedure SetEnabled(const Value: Boolean);
    procedure SetConstantAttenuation(const Value: Single);
    procedure SetLinearAttenuation(const Value: Single);
    procedure SetQuadraticAttenuation(const Value: Single);
    procedure SetSpotCutOff(const Value: Single);
    procedure SetSpotExponent(const Value: Single);
    procedure SetDiffuse(const Value: TAlphaColor);
    procedure SetSpecular(const Value: TAlphaColor);
    procedure SetAmbient(const Value: TAlphaColor);
  protected
    procedure Render; override;
    procedure SetNewViewport(AViewport: IViewport3D); override;
    procedure SetHeight(const Value: Single); override;
    procedure SetWidth(const Value: Single); override;
    procedure SetDepth(const Value: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property Ambient: TAlphaColor read FAmbient write SetAmbient;
    property HitTest default False;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Diffuse: TAlphaColor read FDiffuse write SetDiffuse;
    property ConstantAttenuation: Single read FConstantAttenuation write SetConstantAttenuation;
    property LinearAttenuation: Single read FLinearAttenuation write SetLinearAttenuation;
    property LightType: TLightType read FLightType write SetLightType;
    property QuadraticAttenuation: Single read FQuadraticAttenuation write SetQuadraticAttenuation;
    property Specular: TAlphaColor read FSpecular write SetSpecular;
    property SpotCutOff: Single read FSpotCutOff write SetSpotCutOff;
    property SpotExponent: Single read FSpotExponent write SetSpotExponent;
  end;

{ TDummy }

  TDummy = class(TControl3D)
  protected
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property HitTest default False;
  end;

{ TProxyObject }

  TProxyObject = class(TControl3D)
  private
    FSourceObject: TControl3D;
    procedure SetSourceObject(const Value: TControl3D);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Render; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean; override;
  published
    property SourceObject: TControl3D read FSourceObject write SetSourceObject;
  end;

{ TViewport3D }

  TViewport3D = class(TControl, IViewport3D)
  private
    FBuffer: TBitmap;
    FContext: TContext3D;
    FCamera: TCamera;
    FLights: TList;
    FDesignGrid: TControl3D;
    FDesignCamera: TCamera;
    FDesignCameraZ: TDummy;
    FDesignCameraX: TDummy;
    FFill: TAlphaColor;
    FMultisample: TMultisample;
    FUsingDesignCamera: Boolean;
    FDrawing: Boolean;
    FLastWidth, FLastHeight: single;
    FDisableAlign: Boolean;
    procedure SetFill(const Value: TAlphaColor);
    procedure SetMultisample(const Value: TMultisample);
    function GetFill: TAlphaColor;
  protected
    procedure Paint; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function FindTarget(P: TPointF; const Data: TDragObject): IControl; override;
    function ObjectAtPoint(P: TPointF): IControl; override;
    { IViewport3D }
    function GetObject: TFmxObject;
    function GetContext: TContext3D;
    function GetScene: IScene;
    function GetDesignCamera: TCamera;
    procedure SetDesignCamera(const ACamera: TCamera);
    procedure NeedRender;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    property Context: TContext3D read FContext write FContext;
    { children }
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
  published
    property Multisample: TMultisample read FMultisample write SetMultisample default TMultisample.ms4Samples;
    property Color: TAlphaColor read GetFill write SetFill default TAlphaColors.White;
    property Camera: TCamera read FCamera write FCamera;
    property UsingDesignCamera: Boolean read FUsingDesignCamera write FUsingDesignCamera default True;
  end;

var
  DefaultContextClass: TContext3DClass = nil;

{ Utils }

function Point3D(X, Y, Z: Single): TPoint3D; overload;
function Point3D(const P: TVector3D): TPoint3D; overload;

function Point3DToString(R: TPoint3D): AnsiString;
function StringToPoint3D(S: AnsiString): TPoint3D;

function ColorToVector3D(AColor: TAlphaColor): TVector3D;

function VertexSize(const AFormat: TVertexFormats): Integer;
function GetVertexOffset(const APosition: TVertexFormat; const AFormat: TVertexFormats): Integer;

function Vector3D(const X, Y, Z: Single; const W: Single = 1.0): TVector3D; overload;
function Vector3D(const Point: TPoint3D; const W: Single = 1.0): TVector3D; overload;

function MidPoint(const p1, p2: TVector3D): TVector3D;

procedure SetVector3D(var V: TVector3D; const X, Y, Z: Single; const W: Single = 1.0);
function Vector3DNorm(const V: TVector3D): Single;
procedure NormalizeVector3D(var V: TVector3D);
function Vector3DNormalize(const V: TVector3D): TVector3D;
function Vector3DAdd(const v1: TVector3D; const v2: TVector3D): TVector3D;
procedure AddVector3D(var v1: TVector3D; const v2: TVector3D);
procedure CombineVector3D(var v1: TVector3D; const v2: TVector3D; f: Single);
function Vector3DReflect(const V, N: TVector3D): TVector3D;
function Vector3DAddScale(const v1: TVector3D; const v2: Single): TVector3D;
function Vector3DSubtract(const v1: TVector3D; const v2: TVector3D): TVector3D;
function Vector3DScale(const V: TVector3D; factor: Single): TVector3D;
function PointProject(const P, Origin, Direction: TVector3D): Single;
function Vector3DToColor(const AColor: TVector3D): TAlphaColor;
function Point3DToVector3D(const APoint:TPoint3D):TVector3D;
function Vector3DToPoint3D(const AVector:TVector3D):TPoint3D;

function VectorDistance2(const v1, v2: TVector3D): Single;
function Vector3DLength(const V: TVector3D): Single;
function Matrix3DMultiply(const M1, M2: TMatrix3D): TMatrix3D;
function Matrix3DDeterminant(const M: TMatrix3D): Single;
procedure AdjointMatrix3D(var M: TMatrix3D);
procedure ScaleMatrix3D(var M: TMatrix3D; const factor: Single);
procedure InvertMatrix(var M: TMatrix3D);
procedure TransposeMatrix3D(var M: TMatrix3D);
function Vector3DCrossProduct(const v1, v2: TVector3D): TVector3D;
function Vector3DDotProduct(const v1, v2: TVector3D): Single;
function Vector3DAngleCosine(const v1, v2: TVector3D): Single;
function Vector3DTransform(const V: TVector3D; const M: TMatrix3D): TVector3D;
function CalcPlaneNormal(const p1, p2, p3: TVector3D): TVector3D;
procedure RotateVector(var Vector: TVector3D; const axis: TVector3D; angle: Single);
function CreateRotationMatrix3D(const AnAxis: TVector3D; Angle: Single): TMatrix3D; overload;
function CreateRotationMatrix3D(const Y, P, R: Single): TMatrix3D; overload;
function CreateYawPitchRollMatrix3D(const Y, P, R: Single): TMatrix3D;
function CreateScaleMatrix3D(const AScale: TVector3D): TMatrix3D;
function CreateTranslateMatrix3D(const ATranslate: TVector3D): TMatrix3D;
function AxisRotationToMatrix3D(AAxis: TVector3D; AAngle: Single) : TMatrix3D;

{ Matrix }

function Matrix3D(const m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33,
  m34, m41, m42, m43, m44:Single): TMatrix3D; overload;
function Matrix3D(const LArr: TSingleDynArray):TMatrix3D;  overload;
function MatrixOrthoLH(W, h, zn, zf: Single): TMatrix3D;
function MatrixOrthoOffCenterLH(l, R, b, t, zn, zf: Single): TMatrix3D;
function MatrixOrthoOffCenterRH(l, R, b, t, zn, zf: Single): TMatrix3D;
function MatrixPerspectiveFovRH(flovy, aspect, zn, zf: Single): TMatrix3D;
function MatrixPerspectiveFovLH(flovy, aspect, zn, zf: Single): TMatrix3D;
function MatrixPerspectiveOffCenterLH(l, R, b, t, zn, zf: Single): TMatrix3D;
function MatrixLookAtRH(const Eye, At, Up: TVector3D): TMatrix3D;
function MatrixLookAtLH(const Eye, At, Up: TVector3D): TMatrix3D;
function MatrixLookAtDirRH(const Pos, Dir, Up: TVector3D): TMatrix3D;
function MatrixLookAtDirLH(const Pos, Dir, Up: TVector3D): TMatrix3D;

{ Quaternion }

procedure NormalizeQuaternion(var q: TQuaternion3D);
function QuaternionToMatrix(Quaternion: TQuaternion3D): TMatrix3D;
function QuaternionMultiply(const qL, qR: TQuaternion3D): TQuaternion3D;
function QuaternionFromAngleAxis(const angle: Single; const axis: TVector3D): TQuaternion3D;
function QuaternionFromMatrix(const Matrix: TMatrix3D): TQuaternion3D;

function RSqrt(V: Single): Single;
function ISqrt(i: Integer): Integer;

{ Intersection }

function RayCastPlaneIntersect(const RayPos, RayDir: TVector3D; const PlanePoint, PlaneNormal: TVector3D;
  var Intersection: TVector3D): Boolean;

function RayCastSphereIntersect(const RayPos, RayDir: TVector3D; const SphereCenter: TVector3D;
  const SphereRadius: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;

function RayCastEllipsoidIntersect(const RayPos, RayDir: TVector3D; const EllipsoidCenter: TVector3D;
  const XRadius, YRadius, ZRadius: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;

function RayCastCuboidIntersect(const RayPos, RayDir: TVector3D; const CuboidCenter: TVector3D;
  const Width, Height, Depth: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;

function RayCastTriangleIntersect(const RayPos, RayDir: TVector3D; const Vertex1, Vertex2, Vertex3: TVector3D;
  var Intersection: TVector3D): Boolean;

{ Used for correct Pick }
var
  GlobalDistance: Single = 0;
  GlobalProjection: TProjection;

implementation

uses
  SysUtils, Math,  TypInfo, FMX_Objects3D;

type
  TOpenObject = class(TFmxObject);

{ Utils }

const

  // to be used as descriptive indices
  X = 0;
  Y = 1;
  Z = 2;
  W = 3;

  cZero: Single = 0.0;
  cOne: Single = 1.0;
  cOneDotFive: Single = 0.5;

function Point3D(X, Y, Z: Single): TPoint3D;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function Point3D(const P: TVector3D): TPoint3D;
begin
  Result.X := P.X;
  Result.Y := P.Y;
  Result.Z := P.Z;
end;

function Point3DToString(R: TPoint3D): AnsiString;
begin
  Result := '(' + FloatToStr(R.X, USFormatSettings) + ',' + FloatToStr(R.Y, USFormatSettings) + ',' +
    FloatToStr(R.Z, USFormatSettings) + ')';
end;

function StringToPoint3D(S: AnsiString): TPoint3D;
begin
  try
    GetToken(S, ',()');
    Result.X := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Y := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Z := StrToFloat(GetToken(S, ',()'), USFormatSettings);
  except
    Result := Point3D(0, 0, 0);
  end;
end;

function ColorToVector3D(AColor: TAlphaColor): TVector3D;
begin
  Result.X := TAlphaColorRec(AColor).R / $FF;
  Result.Y := TAlphaColorRec(AColor).G / $FF;
  Result.Z := TAlphaColorRec(AColor).B / $FF;
  Result.W := TAlphaColorRec(AColor).A / $FF;
end;

{ Vertices }

function VertexSize(const AFormat: TVertexFormats): Integer;
begin
  Result := 0;
  if TVertexFormat.vfVertex in AFormat then
    Result := Result + SizeOf(Single) * 3;
  if TVertexFormat.vfNormal in AFormat then
    Result := Result + SizeOf(Single) * 3;
  if TVertexFormat.vfDiffuse in AFormat then
    Result := Result + SizeOf(Cardinal);
  if TVertexFormat.vfSpecular in AFormat then
    Result := Result + SizeOf(Cardinal);
  if TVertexFormat.vfTexCoord0 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if TVertexFormat.vfTexCoord1 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if TVertexFormat.vfTexCoord2 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if TVertexFormat.vfTexCoord3 in AFormat then
    Result := Result + SizeOf(Single) * 2;
end;

function GetVertexOffset(const APosition: TVertexFormat; const AFormat: TVertexFormats): Integer;
begin
  Result := 0;
  if TVertexFormat.vfVertex in AFormat then
    Result := Result + SizeOf(Single) * 3;
  if APosition = TVertexFormat.vfNormal then Exit;
  if TVertexFormat.vfNormal in AFormat then
    Result := Result + SizeOf(Single) * 3;
  if APosition = TVertexFormat.vfDiffuse then Exit;
  if TVertexFormat.vfDiffuse in AFormat then
    Result := Result + SizeOf(Cardinal);
  if APosition = TVertexFormat.vfSpecular then Exit;
  if TVertexFormat.vfSpecular in AFormat then
    Result := Result + SizeOf(Cardinal);
  if APosition = TVertexFormat.vfTexCoord0 then Exit;
  if TVertexFormat.vfTexCoord0 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if APosition = TVertexFormat.vfTexCoord1 then Exit;
  if TVertexFormat.vfTexCoord1 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if APosition = TVertexFormat.vfTexCoord2 then Exit;
  if TVertexFormat.vfTexCoord2 in AFormat then
    Result := Result + SizeOf(Single) * 2;
  if APosition = TVertexFormat.vfTexCoord3 then Exit;
  if TVertexFormat.vfTexCoord3 in AFormat then
    Result := Result + SizeOf(Single) * 2;
end;

function Vector3D(const X, Y, Z: Single; const W: Single = 1.0): TVector3D;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

function Vector3D(const Point: TPoint3D; const W: Single = 1.0): TVector3D;
begin
  Result.X := Point.X;
  Result.Y := Point.Y;
  Result.Z := Point.Z;
  Result.W := W;
end;

function MidPoint(const p1, p2: TVector3D): TVector3D;
begin
  Result.X := (p1.X + p2.X) / 2;
  Result.Y := (p1.Y + p2.Y) / 2;
  Result.Z := (p1.Z + p2.Z) / 2;
  Result.W := 1;
end;

procedure NormalizePlane(var Plane: TVector3D);
var
  N: Single;
begin
  N := RSqrt(abs(Plane.X * Plane.X + Plane.Y * Plane.Y + Plane.Z * Plane.Z));
  Plane.X := Plane.X * N;
  Plane.Y := Plane.Y * N;
  Plane.Z := Plane.Z * N;
  Plane.W := 1.0;
end;

function PlaneEvaluatePoint(const Plane: TVector3D; const Point: TVector3D): Single;
begin
  Result := Plane.X * Point.X + Plane.Y * Point.Y + Plane.Z * Point.Z + Plane.W;
end;

procedure SetVector3D(var V: TVector3D; const X, Y, Z: Single; const W: Single = 1.0);
begin
  V := Vector3D(X, Y, Z, W);
end;

function Vector3DNorm(const V: TVector3D): Single;
begin
  Result := (V.X * V.X) + (V.Y * V.Y) + (V.Z * V.Z);
end;

procedure NormalizeVector3D(var V: TVector3D);
var
  invLen: Single;
begin
  invLen := RSqrt(abs(Vector3DNorm(V)));
  V.X := V.X * invLen;
  V.Y := V.Y * invLen;
  V.Z := V.Z * invLen;
  V.W := 0.0;
end;

function Vector3DNormalize(const V: TVector3D): TVector3D;
var
  invLen: Single;
begin
  invLen := RSqrt(abs(Vector3DNorm(V)));
  Result.X := V.X * invLen;
  Result.Y := V.Y * invLen;
  Result.Z := V.Z * invLen;
  Result.W := 0.0;
end;

function Vector3DAdd(const v1: TVector3D; const v2: TVector3D): TVector3D;
begin
  Result.X := v1.X + v2.X;
  Result.Y := v1.Y + v2.Y;
  Result.Z := v1.Z + v2.Z;
  Result.W := 1.0;
end;

procedure Vector3DCombine(const Vector1, Vector2: TVector3D; const F: Single; var VectorResult: TVector3D); overload;
begin
  VectorResult.X := Vector1.X + (F * Vector2.X);
  VectorResult.Y := Vector1.Y + (F * Vector2.Y);
  VectorResult.Z := Vector1.Z + (F * Vector2.Z);
  VectorResult.W := 1.0;
end;

function Vector3DCombine(const Vector1, Vector2: TVector3D; const F1, F2: Single): TVector3D; overload;
begin
  Result.X := (F1 * Vector1.X) + (F2 * Vector2.X);
  Result.Y := (F1 * Vector1.Y) + (F2 * Vector2.Y);
  Result.Z := (F1 * Vector1.Z) + (F2 * Vector2.Z);
  Result.W := 1.0;
end;

function Vector3DReflect(const V, N: TVector3D): TVector3D;
begin
  Result := Vector3DCombine(V, N, 1, -2 * Vector3DDotProduct(V, N));
end;

function Vector3DAddScale(const v1: TVector3D; const v2: Single): TVector3D;
begin
  Result.X := v1.X + v2;
  Result.Y := v1.Y + v2;
  Result.Z := v1.Z + v2;
  Result.W := 1.0;
end;

procedure AddVector3D(var v1: TVector3D; const v2: TVector3D);
begin
  v1 := Vector3DAdd(v1, v2);
end;

procedure CombineVector3D(var v1: TVector3D; const v2: TVector3D; f: Single);
begin
  v1.X := v1.X + v2.X * f;
  v1.Y := v1.Y + v2.Y * f;
  v1.Z := v1.Z + v2.Z * f;
  v1.W := 1.0;
end;

function Vector3DSubtract(const v1: TVector3D; const v2: TVector3D): TVector3D;
begin
  Result.X := v1.X - v2.X;
  Result.Y := v1.Y - v2.Y;
  Result.Z := v1.Z - v2.Z;
  Result.W := 1.0;
end;

function Vector3DLength(const V: TVector3D): Single;
begin
  Result := Sqrt(Vector3DNorm(V));
end;

function Vector3DScale(const V: TVector3D; factor: Single): TVector3D;
begin
  Result.X := V.X * factor;
  Result.Y := V.Y * factor;
  Result.Z := V.Z * factor;
  Result.W := 1;
end;

function Vector3DToColor(const AColor: TVector3D): TAlphaColor;
begin
  Result := MakeColor(Trunc(AColor.x * $FF),
                      Trunc(AColor.y * $FF),
                      Trunc(AColor.z * $FF), $FF);
end;

function Point3DToVector3D(const APoint:TPoint3D):TVector3D;
begin
   result.X := APoint.X;
   result.Y := APoint.Y;
   result.Z := APoint.Z;
   result.W := 1;
end;

function Vector3DToPoint3D(const AVector:TVector3D):TPoint3D;
begin
   result.X := AVector.X;
   result.Y := AVector.Y;
   result.Z := AVector.Z;
end;

function PointProject(const P, Origin, Direction: TVector3D): Single;
begin
  Result := Direction.X * (P.X - Origin.X) + Direction.Y * (P.Y - Origin.Y) + Direction.Z * (P.Z - Origin.Z);
end;

function VectorDistance2(const v1, v2: TVector3D): Single;
begin
  Result := Sqr(v2.X - v1.X) + Sqr(v2.Y - v1.Y) + Sqr(v2.Z - v1.Z);
end;

function Matrix3DMultiply(const M1, M2: TMatrix3D): TMatrix3D;
begin
  Result.M[X].V[X] := M1.M[X].V[X] * M2.M[X].V[X] + M1.M[X].V[Y] * M2.M[Y].V[X] + M1.M[X].V[Z] * M2.M[Z].V[X] +
    M1.M[X].V[W] * M2.M[W].V[X];
  Result.M[X].V[Y] := M1.M[X].V[X] * M2.M[X].V[Y] + M1.M[X].V[Y] * M2.M[Y].V[Y] + M1.M[X].V[Z] * M2.M[Z].V[Y] +
    M1.M[X].V[W] * M2.M[W].V[Y];
  Result.M[X].V[Z] := M1.M[X].V[X] * M2.M[X].V[Z] + M1.M[X].V[Y] * M2.M[Y].V[Z] + M1.M[X].V[Z] * M2.M[Z].V[Z] +
    M1.M[X].V[W] * M2.M[W].V[Z];
  Result.M[X].V[W] := M1.M[X].V[X] * M2.M[X].V[W] + M1.M[X].V[Y] * M2.M[Y].V[W] + M1.M[X].V[Z] * M2.M[Z].V[W] +
    M1.M[X].V[W] * M2.M[W].V[W];
  Result.M[Y].V[X] := M1.M[Y].V[X] * M2.M[X].V[X] + M1.M[Y].V[Y] * M2.M[Y].V[X] + M1.M[Y].V[Z] * M2.M[Z].V[X] +
    M1.M[Y].V[W] * M2.M[W].V[X];
  Result.M[Y].V[Y] := M1.M[Y].V[X] * M2.M[X].V[Y] + M1.M[Y].V[Y] * M2.M[Y].V[Y] + M1.M[Y].V[Z] * M2.M[Z].V[Y] +
    M1.M[Y].V[W] * M2.M[W].V[Y];
  Result.M[Y].V[Z] := M1.M[Y].V[X] * M2.M[X].V[Z] + M1.M[Y].V[Y] * M2.M[Y].V[Z] + M1.M[Y].V[Z] * M2.M[Z].V[Z] +
    M1.M[Y].V[W] * M2.M[W].V[Z];
  Result.M[Y].V[W] := M1.M[Y].V[X] * M2.M[X].V[W] + M1.M[Y].V[Y] * M2.M[Y].V[W] + M1.M[Y].V[Z] * M2.M[Z].V[W] +
    M1.M[Y].V[W] * M2.M[W].V[W];
  Result.M[Z].V[X] := M1.M[Z].V[X] * M2.M[X].V[X] + M1.M[Z].V[Y] * M2.M[Y].V[X] + M1.M[Z].V[Z] * M2.M[Z].V[X] +
    M1.M[Z].V[W] * M2.M[W].V[X];
  Result.M[Z].V[Y] := M1.M[Z].V[X] * M2.M[X].V[Y] + M1.M[Z].V[Y] * M2.M[Y].V[Y] + M1.M[Z].V[Z] * M2.M[Z].V[Y] +
    M1.M[Z].V[W] * M2.M[W].V[Y];
  Result.M[Z].V[Z] := M1.M[Z].V[X] * M2.M[X].V[Z] + M1.M[Z].V[Y] * M2.M[Y].V[Z] + M1.M[Z].V[Z] * M2.M[Z].V[Z] +
    M1.M[Z].V[W] * M2.M[W].V[Z];
  Result.M[Z].V[W] := M1.M[Z].V[X] * M2.M[X].V[W] + M1.M[Z].V[Y] * M2.M[Y].V[W] + M1.M[Z].V[Z] * M2.M[Z].V[W] +
    M1.M[Z].V[W] * M2.M[W].V[W];
  Result.M[W].V[X] := M1.M[W].V[X] * M2.M[X].V[X] + M1.M[W].V[Y] * M2.M[Y].V[X] + M1.M[W].V[Z] * M2.M[Z].V[X] +
    M1.M[W].V[W] * M2.M[W].V[X];
  Result.M[W].V[Y] := M1.M[W].V[X] * M2.M[X].V[Y] + M1.M[W].V[Y] * M2.M[Y].V[Y] + M1.M[W].V[Z] * M2.M[Z].V[Y] +
    M1.M[W].V[W] * M2.M[W].V[Y];
  Result.M[W].V[Z] := M1.M[W].V[X] * M2.M[X].V[Z] + M1.M[W].V[Y] * M2.M[Y].V[Z] + M1.M[W].V[Z] * M2.M[Z].V[Z] +
    M1.M[W].V[W] * M2.M[W].V[Z];
  Result.M[W].V[W] := M1.M[W].V[X] * M2.M[X].V[W] + M1.M[W].V[Y] * M2.M[Y].V[W] + M1.M[W].V[Z] * M2.M[Z].V[W] +
    M1.M[W].V[W] * M2.M[W].V[W];
end;

function Vector3DCrossProduct(const v1, v2: TVector3D): TVector3D;
begin
  Result.X := v1.Y * v2.Z - v1.Z * v2.Y;
  Result.Y := v1.Z * v2.X - v1.X * v2.Z;
  Result.Z := v1.X * v2.Y - v1.Y * v2.X;
  Result.W := 1.0;
end;

function Vector3DDotProduct(const v1, v2: TVector3D): Single;
begin
  Result := v1.X * v2.X + v1.Y * v2.Y + v1.Z * v2.Z;
end;

function CalcPlaneNormal(const p1, p2, p3: TVector3D): TVector3D;
var
  v1, v2: TVector3D;
begin
  v1 := Vector3DSubtract(p2, p1);
  v2 := Vector3DSubtract(p3, p1);
  Result := Vector3DCrossProduct(v1, v2);
  Result := Vector3DNormalize(Result);
end;

function Vector3DAngleCosine(const v1, v2: TVector3D): Single;
begin
  Result := Vector3DLength(v1) * Vector3DLength(v2);
  if abs(Result) > Epsilon then
    Result := Vector3DDotProduct(v1, v2) / Result
  else
    Result := Vector3DDotProduct(v1, v2) / Epsilon;
end;

function Vector3DTransform(const V: TVector3D; const M: TMatrix3D): TVector3D;
begin
  Result.V[X] := V.V[X] * M.M[X].V[X] + V.V[Y] * M.M[Y].V[X] + V.V[Z] * M.M[Z].V[X] + V.V[W] * M.M[W].V[X];
  Result.V[Y] := V.V[X] * M.M[X].V[Y] + V.V[Y] * M.M[Y].V[Y] + V.V[Z] * M.M[Z].V[Y] + V.V[W] * M.M[W].V[Y];
  Result.V[Z] := V.V[X] * M.M[X].V[Z] + V.V[Y] * M.M[Y].V[Z] + V.V[Z] * M.M[Z].V[Z] + V.V[W] * M.M[W].V[Z];
  Result.V[W] := 1;
end;

procedure RotateVector(var Vector: TVector3D; const axis: TVector3D; angle: Single);
var
  rotMatrix: TMatrix3D;
begin
  rotMatrix := CreateRotationMatrix3D(axis, angle);
  Vector := Vector3DTransform(Vector, rotMatrix);
end;

function MatrixDetInternal(const a1, a2, a3, b1, b2, b3, c1, c2, c3: Single): Single; inline;
begin
  Result := a1 * (b2 * c3 - b3 * c2) - b1 * (a2 * c3 - a3 * c2) + c1 * (a2 * b3 - a3 * b2);
end;

function Matrix3DDeterminant(const M: TMatrix3D): Single;
begin
  Result :=
    M.M[X].V[X] * MatrixDetInternal(M.M[Y].V[Y], M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[Z],
    M.M[Z].V[Z], M.M[W].V[Z], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W]) -
    M.M[X].V[Y] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Z],
    M.M[Z].V[Z], M.M[W].V[Z], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W]) +
    M.M[X].V[Z] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Y],
    M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W]) -
    M.M[X].V[W] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Y],
    M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[Z], M.M[Z].V[Z], M.M[W].V[Z]);
end;

procedure AdjointMatrix3D(var M: TMatrix3D);
var
  a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4: Single;
begin
  a1 := M.M[X].V[X];
  b1 := M.M[X].V[Y];
  c1 := M.M[X].V[Z];
  d1 := M.M[X].V[W];
  a2 := M.M[Y].V[X];
  b2 := M.M[Y].V[Y];
  c2 := M.M[Y].V[Z];
  d2 := M.M[Y].V[W];
  a3 := M.M[Z].V[X];
  b3 := M.M[Z].V[Y];
  c3 := M.M[Z].V[Z];
  d3 := M.M[Z].V[W];
  a4 := M.M[W].V[X];
  b4 := M.M[W].V[Y];
  c4 := M.M[W].V[Z];
  d4 := M.M[W].V[W];

  // row column labeling reversed since we transpose rows & columns
  M.M[X].V[X] := MatrixDetInternal(b2, b3, b4, c2, c3, c4, d2, d3, d4);
  M.M[Y].V[X] := -MatrixDetInternal(a2, a3, a4, c2, c3, c4, d2, d3, d4);
  M.M[Z].V[X] := MatrixDetInternal(a2, a3, a4, b2, b3, b4, d2, d3, d4);
  M.M[W].V[X] := -MatrixDetInternal(a2, a3, a4, b2, b3, b4, c2, c3, c4);

  M.M[X].V[Y] := -MatrixDetInternal(b1, b3, b4, c1, c3, c4, d1, d3, d4);
  M.M[Y].V[Y] := MatrixDetInternal(a1, a3, a4, c1, c3, c4, d1, d3, d4);
  M.M[Z].V[Y] := -MatrixDetInternal(a1, a3, a4, b1, b3, b4, d1, d3, d4);
  M.M[W].V[Y] := MatrixDetInternal(a1, a3, a4, b1, b3, b4, c1, c3, c4);

  M.M[X].V[Z] := MatrixDetInternal(b1, b2, b4, c1, c2, c4, d1, d2, d4);
  M.M[Y].V[Z] := -MatrixDetInternal(a1, a2, a4, c1, c2, c4, d1, d2, d4);
  M.M[Z].V[Z] := MatrixDetInternal(a1, a2, a4, b1, b2, b4, d1, d2, d4);
  M.M[W].V[Z] := -MatrixDetInternal(a1, a2, a4, b1, b2, b4, c1, c2, c4);

  M.M[X].V[W] := -MatrixDetInternal(b1, b2, b3, c1, c2, c3, d1, d2, d3);
  M.M[Y].V[W] := MatrixDetInternal(a1, a2, a3, c1, c2, c3, d1, d2, d3);
  M.M[Z].V[W] := -MatrixDetInternal(a1, a2, a3, b1, b2, b3, d1, d2, d3);
  M.M[W].V[W] := MatrixDetInternal(a1, a2, a3, b1, b2, b3, c1, c2, c3);
end;

procedure ScaleMatrix3D(var M: TMatrix3D; const factor: Single);
var
  i: Integer;
begin
  for i := 0 to 3 do
  begin
    M.M[i].V[0] := M.M[i].V[0] * factor;
    M.M[i].V[1] := M.M[i].V[1] * factor;
    M.M[i].V[2] := M.M[i].V[2] * factor;
    M.M[i].V[3] := M.M[i].V[3] * factor;
  end;
end;

procedure TransposeMatrix3D(var M: TMatrix3D);
var
  f: Single;
begin
  f := M.M[0].V[1];
  M.M[0].V[1] := M.M[1].V[0];
  M.M[1].V[0] := f;
  f := M.M[0].V[2];
  M.M[0].V[2] := M.M[2].V[0];
  M.M[2].V[0] := f;
  f := M.M[0].V[3];
  M.M[0].V[3] := M.M[3].V[0];
  M.M[3].V[0] := f;
  f := M.M[1].V[2];
  M.M[1].V[2] := M.M[2].V[1];
  M.M[2].V[1] := f;
  f := M.M[1].V[3];
  M.M[1].V[3] := M.M[3].V[1];
  M.M[3].V[1] := f;
  f := M.M[2].V[3];
  M.M[2].V[3] := M.M[3].V[2];
  M.M[3].V[2] := f;
end;

procedure InvertMatrix(var M: TMatrix3D);
var
  det: Single;
begin
  det := Matrix3DDeterminant(M);
  if abs(det) < Epsilon then
    M := IdentityMatrix3D
  else
  begin
    AdjointMatrix3D(M);
    ScaleMatrix3D(M, 1 / det);
  end;
end;

function CreateRotationMatrix3D(const AnAxis: TVector3D; Angle: Single): TMatrix3D;
var
  Axis: TVector3D;
  Cos, Sin, OneMinusCos: Extended;
begin
  SinCos(NormalizeAngle(Angle), Sin, Cos);
  OneMinusCos := 1 - Cos;
  Axis := Vector3DNormalize(AnAxis);

  FillChar(Result, SizeOf(Result), 0);

  Result.M[X].V[X] := (OneMinusCos * Axis.V[0] * Axis.V[0]) + Cos;
  Result.M[X].V[Y] := (OneMinusCos * Axis.V[0] * Axis.V[1]) - (Axis.V[2] * Sin);
  Result.M[X].V[Z] := (OneMinusCos * Axis.V[2] * Axis.V[0]) + (Axis.V[1] * Sin);

  Result.M[Y].V[X] := (OneMinusCos * Axis.V[0] * Axis.V[1]) + (Axis.V[2] * Sin);
  Result.M[Y].V[Y] := (OneMinusCos * Axis.V[1] * Axis.V[1]) + Cos;
  Result.M[Y].V[Z] := (OneMinusCos * Axis.V[1] * Axis.V[2]) - (Axis.V[0] * Sin);

  Result.M[Z].V[X] := (OneMinusCos * Axis.V[2] * Axis.V[0]) - (Axis.V[1] * Sin);
  Result.M[Z].V[Y] := (OneMinusCos * Axis.V[1] * Axis.V[2]) + (Axis.V[0] * Sin);
  Result.M[Z].V[Z] := (OneMinusCos * Axis.V[2] * Axis.V[2]) + Cos;

  Result.M[W].V[W] := 1;
end;

function QuaternionRot(const R, P, Y: Single): TQuaternion3D;
var
  qp, qy, qR: TQuaternion3D;
begin
  qR := QuaternionFromAngleAxis(R, Vector3D(0, 0, 1));
  qp := QuaternionFromAngleAxis(P, Vector3D(0, 1, 0));
  qy := QuaternionFromAngleAxis(Y, Vector3D(1, 0, 0));
  Result := QuaternionMultiply(qR, QuaternionMultiply(qp, qy));
end;

function CreateRotationMatrix3D(const Y, P, R: Single): TMatrix3D;
var
  q: TQuaternion3D;
begin
  q := QuaternionRot(R, P, Y);
  Result := QuaternionToMatrix(q);
end;

function Matrix3D(const
  m11, m12, m13, m14,
  m21, m22, m23, m24,
  m31, m32, m33, m34,
  m41, m42, m43, m44 : Single): TMatrix3D; overload;
begin
  Result.m11 := m11; Result.m12 := m12; Result.m13 := m13; Result.m14 := m14;
  Result.m21 := m21; Result.m22 := m22; Result.m23 := m23; Result.m24 := m24;
  Result.m31 := m31; Result.m32 := m32; Result.m33 := m33; Result.m34 := m34;
  Result.m41 := m41; Result.m42 := m42; Result.m43 := m43; Result.m44 := m44;
end;


function Matrix3D(const LArr: TSingleDynArray):TMatrix3d; overload;
begin
    result := Matrix3D(
      LArr[0],LArr[4],LArr[8],LArr[12],
      LArr[1],LArr[5],LArr[9],LArr[13],
      LArr[2],LArr[6],LArr[10],LArr[14],
      LArr[3],LArr[7],LArr[11],LArr[15]);
end;

function MatrixOrthoLH(W, h, zn, zf: Single): TMatrix3D;
begin
  Result := IdentityMatrix3D;
  Result.m11 := 2 / W;
  Result.m22 := 2 / h;
  Result.m33 := 1 / (zf - zn);
  Result.m42 := zn / (zn - zf);
end;

function MatrixOrthoOffCenterLH(l, R, b, t, zn, zf: Single): TMatrix3D;
begin
  Result := IdentityMatrix3D;
  Result.m11 := 2 / (R - l);
  Result.m22 := 2 / (t - b);
  Result.m33 := 1 / (zf - zn);
  Result.m41 := (l + R) / (l - R);
  Result.m42 := (t + b) / (b - t);
  Result.m43 := zn / (zn - zf);
end;

function MatrixOrthoOffCenterRH(l, R, b, t, zn, zf: Single): TMatrix3D;
begin
  Result := IdentityMatrix3D;
  Result.m11 := 2 / (R - l);
  Result.m22 := 2 / (t - b);
  Result.m33 := 1 / (zn - zf);
  Result.m41 := (l + R) / (l - R);
  Result.m42 := (t + b) / (b - t);
  Result.m43 := zn / (zn - zf);
end;

function MatrixPerspectiveOffCenterLH(l, R, b, t, zn, zf: Single): TMatrix3D;
begin
  Result := IdentityMatrix3D;
  Result.m11 := (2 * zn) / (R - l);
  Result.m22 := (2 * zn) / (t - b);
  { Result.m31 := (l + r) / (r - l);
    Result.m32 := (t + b) / (t - b); }
  Result.m34 := -1;
  Result.m33 := 1;
  Result.m43 := 0; // (zn * zf) / (zn - zf);
end;

{$EXCESSPRECISION OFF}

function MatrixPerspectiveFovRH(flovy, aspect, zn, zf: Single): TMatrix3D;
var
  yScale, xScale, h, W: Single;
begin
  yScale := cot(flovy / 2.0);
  xScale := yScale / aspect;
  h := cos(flovy / 2) / sin(flovy / 2);
  W := h / aspect;
  Result := IdentityMatrix3D;
  Result.m11 := xScale;
  Result.m22 := yScale;
  Result.m33 := (zf / (zn - zf));
  Result.m34 := -1;
  Result.m43 := zn * zf / (zn - zf);
  Result.m44 := 0;
end;

function MatrixPerspectiveFovLH(flovy, aspect, zn, zf: Single): TMatrix3D;
var
  yScale, xScale, h, W: Single;
begin
  yScale := cot(flovy / 2);
  xScale := yScale / aspect;
  h := cos(flovy / 2) / sin(flovy / 2);
  W := h / aspect;
  Result := IdentityMatrix3D;
  Result.m11 := xScale;
  Result.m22 := yScale;
  Result.m33 := (zf / (zf - zn));
  Result.m34 := 1;
  Result.m43 := -zn * zf / (zf - zn);
  Result.m44 := 0;
end;

function MatrixLookAtRH(const Eye, At, Up: TVector3D): TMatrix3D;
var
  zaxis, xaxis, yaxis: TVector3D;
begin
  zaxis := Vector3DNormalize(Vector3DSubtract(Eye, At));
  zaxis.V[3] := 0;
  xaxis := Vector3DNormalize(Vector3DCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := Vector3DCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix3D;
  Result.m11 := xaxis.X;
  Result.m12 := yaxis.X;
  Result.m13 := zaxis.X;
  Result.m21 := xaxis.Y;
  Result.m22 := yaxis.Y;
  Result.m23 := zaxis.Y;
  Result.m31 := xaxis.Z;
  Result.m32 := yaxis.Z;
  Result.m33 := zaxis.Z;
  Result.m41 := -Vector3DDotProduct(xaxis, Eye);
  Result.m42 := -Vector3DDotProduct(yaxis, Eye);
  Result.m43 := -Vector3DDotProduct(zaxis, Eye);
end;

function MatrixLookAtLH(const Eye, At, Up: TVector3D): TMatrix3D;
var
  zaxis, xaxis, yaxis: TVector3D;
begin
  zaxis := Vector3DNormalize(Vector3DSubtract(At, Eye));
  zaxis.V[3] := 0;
  xaxis := Vector3DNormalize(Vector3DCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := Vector3DCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix3D;
  Result.m11 := xaxis.X;
  Result.m12 := yaxis.X;
  Result.m13 := zaxis.X;
  Result.m21 := xaxis.Y;
  Result.m22 := yaxis.Y;
  Result.m23 := zaxis.Y;
  Result.m31 := xaxis.Z;
  Result.m32 := yaxis.Z;
  Result.m33 := zaxis.Z;
  Result.m41 := -Vector3DDotProduct(xaxis, Eye);
  Result.m42 := -Vector3DDotProduct(yaxis, Eye);
  Result.m43 := -Vector3DDotProduct(zaxis, Eye);
end;

function MatrixLookAtDirRH(const Pos, Dir, Up: TVector3D): TMatrix3D;
var
  zaxis, xaxis, yaxis: TVector3D;
begin
  zaxis := Vector3DNormalize(Dir);
  zaxis.V[3] := 0;
  xaxis := Vector3DNormalize(Vector3DCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := Vector3DCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix3D;
  Result.m11 := xaxis.X;
  Result.m12 := yaxis.X;
  Result.m13 := zaxis.X;
  Result.m21 := xaxis.Y;
  Result.m22 := yaxis.Y;
  Result.m23 := zaxis.Y;
  Result.m31 := xaxis.Z;
  Result.m32 := yaxis.Z;
  Result.m33 := zaxis.Z;
  Result.m41 := -Vector3DDotProduct(xaxis, Pos);
  Result.m42 := -Vector3DDotProduct(yaxis, Pos);
  Result.m43 := -Vector3DDotProduct(zaxis, Pos);
end;

function MatrixLookAtDirLH(const Pos, Dir, Up: TVector3D): TMatrix3D;
var
  zaxis, xaxis, yaxis: TVector3D;
begin
  zaxis := Vector3DNormalize(Vector3DScale(Dir, -1));
  zaxis.V[3] := 0;
  xaxis := Vector3DNormalize(Vector3DCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := Vector3DCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix3D;
  Result.m11 := xaxis.X;
  Result.m12 := yaxis.X;
  Result.m13 := zaxis.X;
  Result.m21 := xaxis.Y;
  Result.m22 := yaxis.Y;
  Result.m23 := zaxis.Y;
  Result.m31 := xaxis.Z;
  Result.m32 := yaxis.Z;
  Result.m33 := zaxis.Z;
  Result.m41 := -Vector3DDotProduct(xaxis, Pos);
  Result.m42 := -Vector3DDotProduct(yaxis, Pos);
  Result.m43 := -Vector3DDotProduct(zaxis, Pos);
end;

function RSqrt(V: Single): Single;
var
  R: double;
begin
  R := abs(V);
  if R > 0 then
    Result := 1 / Sqrt(R)
  else
    Result := 1;
end;

function ISqrt(i: Integer): Integer;
begin
{$HINTS OFF}
  i := abs(i);
  if i > 0 then
    Result := Round(Sqrt(i))
  else
    Result := 1;
{$HINTS ON}
end;

function IsEssentiallyZero(const Value: Single): Boolean;
begin
  Result := ((Value < Epsilon2) and (Value > -Epsilon2));
end;

function IsNotEssentiallyZero(const Value: Single): Boolean;
begin
  Result := ((Value > Epsilon2) or (Value < -Epsilon2));
end;

{
  See: http://en.wikipedia.org/wiki/Line–sphere_intersection
  See: http://www.ccs.neu.edu/home/fell/CSU540/programs/RayTracingFormulas.htm
}
function RayCastSphereIntersect(const RayPos, RayDir: TVector3D; const SphereCenter: TVector3D;
  const SphereRadius: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;
var
  A, B, C, B2, FourAC, Discriminant, LRoot, TwoA, LFactor: Single;
  LTempVec: TVector3D;
begin
  A := RayDir.X * RayDir.X + RayDir.Y * RayDir.Y + RayDir.Z * RayDir.Z;
  b := 2 * (
    RayDir.X * (RayPos.X - SphereCenter.X)
    + RayDir.Y * (RayPos.Y - SphereCenter.Y)
    + RayDir.Z * (RayPos.Z - SphereCenter.Z)
  );
  C := SphereCenter.X * SphereCenter.X + SphereCenter.Y * SphereCenter.Y + SphereCenter.Z * SphereCenter.Z
    + RayPos.X * RayPos.X + RayPos.Y * RayPos.Y + RayPos.Z * RayPos.Z
    - 2 * (SphereCenter.X * RayPos.X + SphereCenter.Y * RayPos.Y + SphereCenter.Z * RayPos.Z) - SphereRadius * SphereRadius;

  B2 := B * B;
  FourAC := 4 * A * C;
  discriminant := b2 - fourac;

  if (discriminant < 0) then
  begin
    Result := 0;
  end
  else if (discriminant = 0) then
  begin
    Result := 1;
    LFactor := -B / (2 * A); // we already know the descriminant is 0
    IntersectionNear := Vector3DAdd(RayPos, Vector3DScale(RayDir, LFactor));
    IntersectionFar := IntersectionNear;
  end
  else
  begin
    Result := 2;
    LRoot := Sqrt(B2 - FourAC);
    TwoA := 2 * A;
    LFactor := (-B - LRoot)/TwoA;
    IntersectionNear := Vector3DAdd(RayPos, Vector3DScale(RayDir, LFactor));
    LFactor := (-B + LRoot)/TwoA;
    IntersectionFar := Vector3DAdd(RayPos, Vector3DScale(RayDir, LFactor));
    if VectorDistance2(RayPos, IntersectionNear) > VectorDistance2(RayPos, IntersectionFar) then
    begin
      LTempVec := IntersectionNear;
      IntersectionNear := IntersectionFar;
      IntersectionFar := LTempVec;
    end;
  end;
end;

{
  We can use the Sphere Intersect algorithm if we distort space so we have a single common radius
}
function RayCastEllipsoidIntersect(const RayPos, RayDir: TVector3D; const EllipsoidCenter: TVector3D;
  const XRadius, YRadius, ZRadius: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;
var
  LCommonRadius, LFactorX, LFactorY, LFactorZ: Single;
  LRayPos, LRayDir, LSphereCenter: TVector3D;
begin
  // avoid degenerate cases (where ellipsoid is a plane or line)
  if IsNotEssentiallyZero(XRadius) and IsNotEssentiallyZero(YRadius) and IsNotEssentiallyZero(ZRadius) then
  begin
    LCommonRadius := XRadius;
    LCommonRadius := Max(LCommonRadius, YRadius);
    LCommonRadius := Max(LCommonRadius, ZRadius);
    LFactorX := LCommonRadius/XRadius;
    LFactorY := LCommonRadius/YRadius;
    LFactorZ := LCommonRadius/ZRadius;
    LRayPos := Vector3D(RayPos.X * LFactorX, RayPos.Y * LFactorY, RayPos.Z * LFactorZ);
    LRayDir := Vector3D(RayDir.X * LFactorX, RayDir.Y * LFactorY, RayDir.Z * LFactorZ);
    LSphereCenter := Vector3D(EllipsoidCenter.X * LFactorX, EllipsoidCenter.Y * LFactorY, EllipsoidCenter.Z * LFactorZ);
    Result := RayCastSphereIntersect(LRayPos, LRayDir, LSphereCenter, LCommonRadius, IntersectionNear, IntersectionFar);
    // adjust intersection points as needed
    if Result > 0 then
    begin
      IntersectionNear.X := IntersectionNear.X / LFactorX;
      IntersectionNear.Y := IntersectionNear.Y / LFactorY;
      IntersectionNear.Z := IntersectionNear.Z / LFactorZ;
      IntersectionFar.X := IntersectionFar.X / LFactorX;
      IntersectionFar.Y := IntersectionFar.Y / LFactorY;
      IntersectionFar.Z := IntersectionFar.Z / LFactorZ;
    end;
  end
  else
    Result := 0;
end;

function RayCastCuboidIntersect(const RayPos, RayDir: TVector3D; const CuboidCenter: TVector3D;
  const Width, Height, Depth: Single; var IntersectionNear, IntersectionFar: TVector3D): Integer;
var
  LWidth, LHeight, LDepth: Single;
  LContinueSearch: Boolean;
  A, B, C: Single;
  LIntercepts: array [0..1] of TVector3D;
  LDimensionVec, LThicknessVec: TVector3D;
  I: Integer;
const
  Root3Over2: Single = 0.866025404;

  function TryEllipsoidShortcut(const W, H, D: Single): Boolean;
  var
    LMax, LMin: Single;
  begin
    LMin := W;
    LMin := Min(LMin, H);
    LMin := Min(LMin, D);
    LMax := W;
    LMax := Max(LMax, H);
    LMax := Max(LMax, D);
    Result := (LMin/LMax) > 0.1;
  end;

  function Inside(const Value: TVector3D): Boolean;
  begin
    Result := (Abs(Value.X - CuboidCenter.X) <= (0.501 * LWidth))
      and (Abs(Value.Y - CuboidCenter.Y) <= (0.501 * LHeight))
      and (Abs(Value.Z - CuboidCenter.Z) <= (0.501 * LDepth));
  end;

  // FireMonkey layers (which are basically 2D) have a hard coded thickness of 0.01
  function IsThickerThan2DLayer(const Value: Single): Boolean;
  begin
    Result := (Value > 0.01) or (Value < -0.01);
  end;

begin
  LWidth := Abs(Width);
  LHeight := Abs(Height);
  LDepth := Abs(Depth);
  if (LWidth = 0) or (LHeight = 0) or (LDepth = 0) then 
  begin
    Result := 0;
    Exit;
  end;

  // To find the real answer, we need to see how the ray intersects with the faces of the cuboid.
  // As a shortcut, we can see if there is intersection with an ellipsoid that encompasses the
  // entirety of the cuboid. Don't bother if the aspect ratio is too large.
  if TryEllipsoidShortcut(LWidth, LHeight, LDepth) then
  begin
    // Derivation:
    //
    // Equation of ellipsoid (http://en.wikipedia.org/wiki/Ellipsoid):
    //
    // (x^2)/(a^2) + (y^2)/(b^2) + (z^2)/(c^2) = 1
    //
    // We also know that for the ellipsoid inscribed INSIDE the cuboid:
    //
    //  a' = Width/2
    //  b' = Height/2
    //  c' = Depth/2
    //
    // To find the ellipsoid which encloses the cuboid, we need to simply scale
    // up the ellipsoid which is inscribed within. Thus:
    //
    //  a = factor * a' = factor * Width/2
    //  b = factor * b' = factor * Height/2
    //  c = factor * c' = factor * Depth/2
    //
    // We know one solution for the equation of the ellipsoid which encloses the
    // cuboid is found when:
    //
    // x = Width/2
    // y = Height/2
    // z = Depth/2
    //
    // thus:
    //
    // ((Width/2)^2)/(a^2) + ((Height/2)^2)/(b^2)) + ((Depth/2)^2)/(c^2) = 1
    //
    // substitute a, b, c and simplify:
    //
    // 1/factor^2 + 1/factor^2 + 1/factor^2 = 1
    //
    // 3/factor^2 = 1
    //
    // factor = SquareRoot(3)
    //
    // yielding:
    //
    //  a = SquareRoot(3) * Width/2
    //  b = SquareRoot(3) * Height/2
    //  c = SquareRoot(3) * Depth/2

    A := Root3Over2 * LWidth;
    B := Root3Over2 * LHeight;
    C := Root3Over2 * LDepth;

    LContinueSearch := RayCastEllipsoidIntersect(RayPos, RayDir, CuboidCenter, A, B, C, LIntercepts[0], LIntercepts[1]) > 0;
  end
  else
    LContinueSearch := True;

  if LContinueSearch then
  begin
    // We failed the ellipsoid check, now we need to do the hard work and check each face
    Result := 0;

    // store these in a vector so we can iterate over them
    LDimensionVec := Vector3D(LWidth/2, LHeight/2, LDepth/2);
    LThicknessVec := Vector3D(Min(LHeight, LDepth), Min(LWidth, LDepth), Min(LWidth, LHeight));

    for I := 0 to 2 do
    begin
      if (Result < 2) and IsNotEssentiallyZero(RayDir.V[I])
        and IsThickerThan2DLayer(LThicknessVec.V[I]) then
      begin
        LIntercepts[Result] := Vector3DAdd(RayPos, Vector3DScale(RayDir,
          (CuboidCenter.V[I] - LDimensionVec.V[I] - RayPos.V[I]) / RayDir.V[I]));
        if Inside(LIntercepts[Result]) then
          Inc(Result);

        if (Result < 2) then
        begin
          LIntercepts[Result] := Vector3DAdd(RayPos, Vector3DScale(RayDir,
            (CuboidCenter.V[I] + LDimensionVec.V[I] - RayPos.V[I]) / RayDir.V[I]));
          if Inside(LIntercepts[Result]) then
            Inc(Result);
        end;
      end;
    end;

    if Result = 1 then
    begin
      IntersectionNear := LIntercepts[0];
      IntersectionFar := LIntercepts[0];
    end
    else if Result = 2 then
    begin
      if VectorDistance2(RayPos, LIntercepts[0]) < VectorDistance2(RayPos, LIntercepts[1]) then
      begin
        IntersectionNear := LIntercepts[0];
        IntersectionFar := LIntercepts[1];
      end
      else
      begin
        IntersectionNear := LIntercepts[1];
        IntersectionFar := LIntercepts[0];
      end;
    end;
  end
  else
    Result := 0;
end;

{
  See: http://en.wikipedia.org/wiki/Line-plane_intersection
  See: http://paulbourke.net/geometry/planeline/
}
function RayCastPlaneIntersect(const RayPos, RayDir: TVector3D; const PlanePoint, PlaneNormal: TVector3D;
  var Intersection: TVector3D): Boolean;
var
  LDotProd, LFactor: Single;
begin
  // Is the Ray parallel to the plane?
  LDotProd := Vector3DDotProduct(RayDir, PlaneNormal);
  if IsNotEssentiallyZero(LDotProd) then
  begin
    LFactor := Vector3DDotProduct(Vector3DSubtract(PlanePoint, RayPos), PlaneNormal) / LDotProd;
    if LFactor > 0 then
    begin
      Result := True;
      Intersection := Vector3DAdd(RayPos, Vector3DScale(RayDir, LFactor));
    end
    else
      Result := False; // The Ray points away from the plane
  end
  else
    Result := False;
end;

{
  See: http://en.wikipedia.org/wiki/Barycentric_coordinate_system_(mathematics)#Determining_if_a_point_is_inside_a_triangle
  See: http://mathworld.wolfram.com/BarycentricCoordinates.html
  See: http://www.blackpawn.com/texts/pointinpoly/default.html
}

function SameSide(const P1, P2: TVector3D; A, B: TVector3D): Boolean;
var 
  CP1, CP2: TVector3D;
begin
  CP1 := Vector3DCrossProduct(Vector3DSubtract(B, A), Vector3DSubtract(P1, A));
  CP2 := Vector3DCrossProduct(Vector3DSubtract(B, A), Vector3DSubtract(P2, A));
  if Vector3DDotProduct(CP1, CP2) >= 0 then 
    Result := True
  else 
    Result := False;
end;

function RayCastTriangleIntersect(const RayPos, RayDir: TVector3D; const Vertex1, Vertex2, Vertex3: TVector3D;
  var Intersection: TVector3D): Boolean;
var
  N, P, A, B, C: TVector3D;
begin
  A := Vector3DSubtract(Vertex1, Vertex2);
  B := Vector3DSubtract(Vertex2, Vertex3);
  C := Vector3DSubtract(Vertex3, Vertex1);
  N := Vector3DCrossProduct(A, C);
  if RayCastPlaneIntersect(RayPos, RayDir, Vertex1, N, P) then
  begin
    if SameSide(P, A, B, C) and SameSide(P, B, A, C) and SameSide(P, C, A, B) then 
      Result := True
    else 
      Result := False;
  end;
end;

procedure NegateVector(var V: TVector3D);
begin
  V.X := -V.X;
  V.Y := -V.Y;
  V.Z := -V.Z;
end;

function QuaternionMagnitude(const q: TQuaternion3D): Single;
begin
  Result := Sqrt(Vector3DNorm(q.ImagPart) + q.RealPart * q.RealPart);
end;

function QuaternionFromAngleAxis(const angle: Single; const axis: TVector3D): TQuaternion3D;
var
  S: Single;
{$IFDEF FPC}
  LAngle: Single;
{$ENDIF}
begin
{$IFDEF FPC}
  LAngle := DegToRad(angle * cOneDotFive);
  S := Sin(LAngle);
  Result.RealPart := Cos(LAngle);
{$ELSE}
  SinCos(DegToRad(angle * cOneDotFive), S, Result.RealPart);
{$ENDIF}
  Result.ImagPart := Vector3DScale(axis, S / Vector3DLength(axis));
end;

function QuaternionMultiply(const qL, qR: TQuaternion3D): TQuaternion3D;
begin
  Result.RealPart := qL.RealPart * qR.RealPart - qL.ImagPart.X * qR.ImagPart.X - qL.ImagPart.Y * qR.ImagPart.Y - qL.ImagPart.Z * qR.ImagPart.Z;
  Result.ImagPart.X := qL.RealPart * qR.ImagPart.X + qR.RealPart * qL.ImagPart.X + qL.ImagPart.Y * qR.ImagPart.Z - qL.ImagPart.Z * qR.ImagPart.Y;
  Result.ImagPart.Y := qL.RealPart * qR.ImagPart.Y + qR.RealPart * qL.ImagPart.Y + qL.ImagPart.Z * qR.ImagPart.X - qL.ImagPart.X * qR.ImagPart.Z;
  Result.ImagPart.Z := qL.RealPart * qR.ImagPart.Z + qR.RealPart * qL.ImagPart.Z + qL.ImagPart.X * qR.ImagPart.Y - qL.ImagPart.Y * qR.ImagPart.X;
  Result.ImagPart.W := 1;
end;

function QuaternionFromRollPitchYaw(const R, P, Y: Single): TQuaternion3D;
var
  qp, qy, qR: TQuaternion3D;
begin
  qR := QuaternionFromAngleAxis(R, Vector3D(0, 0, 1));
  qp := QuaternionFromAngleAxis(P, Vector3D(1, 0, 0));
  qy := QuaternionFromAngleAxis(Y, Vector3D(0, 1, 0));

  Result := qy;
  Result := QuaternionMultiply(qp, Result);
  Result := QuaternionMultiply(qR, Result);
end;

procedure NormalizeQuaternion(var q: TQuaternion3D);
var
  M, f: Single;
begin
  M := QuaternionMagnitude(q);
  if M > EPSILON2 then
  begin
    f := 1 / M;
    q.ImagPart := Vector3DScale(q.ImagPart, f);
    q.RealPart := q.RealPart * f;
  end
  else
    q := IdentityQuaternion;
end;

function QuaternionToMatrix(Quaternion: TQuaternion3D): TMatrix3D;
var
  W, X, Y, Z, xx, xy, xz, xw, yy, yz, yw, zz, zw: Single;
begin
  NormalizeQuaternion(Quaternion);
  W := Quaternion.RealPart;
  X := Quaternion.ImagPart.X;
  Y := Quaternion.ImagPart.Y;
  Z := Quaternion.ImagPart.Z;
  xx := X * X;
  xy := X * Y;
  xz := X * Z;
  xw := X * W;
  yy := Y * Y;
  yz := Y * Z;
  yw := Y * W;
  zz := Z * Z;
  zw := Z * W;
  FillChar(Result, Sizeof(Result), 0);
  Result.M11 := 1 - 2 * (yy + zz);
  Result.M21 := 2 * (xy - zw);
  Result.M31 := 2 * (xz + yw);
  Result.M12 := 2 * (xy + zw);
  Result.M22 := 1 - 2 * (xx + zz);
  Result.M32 := 2 * (yz - xw);
  Result.M13 := 2 * (xz - yw);
  Result.M23 := 2 * (yz + xw);
  Result.M33 := 1 - 2 * (xx + yy);
  Result.M44 := 1;
end;

function QuaternionFromMatrix(const Matrix: TMatrix3D): TQuaternion3D;
var
  Trace, S: double;
begin
  Result.ImagPart.W := 1.0;
  Trace := Matrix.m11 + Matrix.m22 + Matrix.m33;
  if Trace > EPSILON then
  begin
    S := 0.5 / Sqrt(Trace + 1.0);
    Result.ImagPart.X := (Matrix.M23 - Matrix.M32) * S;
    Result.ImagPart.Y := (Matrix.M31 - Matrix.M13) * S;
    Result.ImagPart.Z := (Matrix.M12 - Matrix.M21) * S;
    Result.RealPart := 0.25 / S;
  end
  else if (Matrix.M11 > Matrix.M22) and (Matrix.M11 > Matrix.M33) then
  begin
    S := Sqrt(Max(EPSILON, cOne + Matrix.M11 - Matrix.M22 - Matrix.M33)) * 2.0;
    Result.ImagPart.X := 0.25 * S;
    Result.ImagPart.Y := (Matrix.M12 + Matrix.M21) / S;
    Result.ImagPart.Z := (Matrix.M31 + Matrix.M13) / S;
    Result.RealPart := (Matrix.M23 - Matrix.M32) / S;
  end
  else if (Matrix.M22 > Matrix.M33) then
  begin
    S := Sqrt(Max(EPSILON, cOne + Matrix.M22 - Matrix.M11 - Matrix.M33)) * 2.0;
    Result.ImagPart.X := (Matrix.M12 + Matrix.M21) / S;
    Result.ImagPart.Y := 0.25 * S;
    Result.ImagPart.X := (Matrix.M23 + Matrix.M32) / S;
    Result.RealPart := (Matrix.M31 - Matrix.M13) / S;
  end else
  begin
    S := Sqrt(Max(EPSILON, cOne + Matrix.M33 - Matrix.M11 - Matrix.M22)) * 2.0;
    Result.ImagPart.X := (Matrix.M31 + Matrix.M13) / S;
    Result.ImagPart.Y := (Matrix.M23 + Matrix.M32) / S;
    Result.ImagPart.Z := 0.25 * S;
    Result.RealPart := (Matrix.M12 - Matrix.M21) / S;
  end;
  NormalizeQuaternion(Result);
end;

function CreateYawPitchRollMatrix3D(const Y, P, R: Single): TMatrix3D;
var
  q: TQuaternion3D;
begin
  q := QuaternionFromRollPitchYaw(R, P, Y);
  Result := QuaternionToMatrix(q);
end;

function CreateScaleMatrix3D(const AScale: TVector3D): TMatrix3D;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.M11 := AScale.x;
  Result.M22 := AScale.y;
  Result.M33 := AScale.z;
  Result.M44 := 1;
end;

function CreateTranslateMatrix3D(const ATranslate: TVector3D): TMatrix3D;
begin
  Result := IdentityMatrix3D;
  Result.M41 := ATranslate.x;
  Result.M42 := ATranslate.y;
  Result.M43 := ATranslate.z;
end;

function AxisRotationToMatrix3D(AAxis: TVector3D; AAngle: Single) : TMatrix3D;
var
  cosine, sine, Len, onecosine: double;
begin
  AAngle := AAngle * PI / 180;
  sine := sin(AAngle);
  cosine := cos(AAngle);
  onecosine := 1 - cosine;
  Len := Vector3DLength(AAxis);

  if Len = 0 then
     Result := IdentityMatrix3D
  else
  begin
    AAxis := Vector3DScale(AAxis,1/Len);

    Result.m11 := (onecosine * AAxis.x * AAxis.x) + cosine;
    Result.m21 := (onecosine * AAxis.x * AAxis.y) - (AAxis.z * Sine);
    Result.m31 := (onecosine * AAxis.z * AAxis.x) + (AAxis.y * Sine);
    Result.m41 := 0;

    Result.m12 := (onecosine * AAxis.x * AAxis.y) + (AAxis.z * Sine);
    Result.m22 := (onecosine * AAxis.y * AAxis.y) + cosine;
    Result.m32 := (onecosine * AAxis.y * AAxis.z) - (AAxis.x * Sine);
    Result.m42 := 0;

    Result.m13 := (onecosine * AAxis.z * AAxis.x) - (AAxis.y * Sine);
    Result.m23 := (onecosine * AAxis.y * AAxis.z) + (AAxis.x * Sine);
    Result.m33 := (onecosine * AAxis.z * AAxis.z) + cosine;
    Result.m43 := 0;

    Result.m14 := 0;
    Result.m24 := 0;
    Result.m34 := 0;
    Result.m44 := 1;
  end;
end;

{$EXCESSPRECISION ON}

{ TPosition3D }

constructor TPosition3D.Create(const ADefaultValue: TPoint3D);
begin
  inherited Create;
  FDefaultValue := ADefaultValue;
  FX := FDefaultValue.X;
  FY := FDefaultValue.Y;
  FZ := FDefaultValue.Z;
  FSave := Vector3D(FX, FY, FZ);
end;

procedure TPosition3D.Assign(Source: TPersistent);
begin
  if Source is TPosition3D then
  begin
    Point := TPosition3D(Source).Point;
    FSave := Vector;
  end
  else
    inherited
end;

procedure TPosition3D.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Point', ReadPoint, WritePoint, (FX <> DefaultValue.X) or
    (FY <> DefaultValue.Y) or (FZ <> DefaultValue.Z));
end;

procedure TPosition3D.ReadPoint(Reader: TReader);
begin
  Point := StringToPoint3D(Reader.ReadString);
end;

procedure TPosition3D.WritePoint(Writer: TWriter);
begin
  Writer.WriteString(Point3DToString(Point));
end;

function TPosition3D.GetVector: TVector3D;
begin
  Result := Vector3D(FX, FY, FZ);
end;

procedure TPosition3D.SetVector(const Value: TVector3D);
begin
  SetPoint3D(Point3D(Value));
end;

function TPosition3D.GetPoint3D: TPoint3D;
begin
  Result := Point3D(FX, FY, FZ);
end;

procedure TPosition3D.SetVectorNoChange(const P: TVector3D);
begin
  FSave := Vector3D(FX, FY, FZ);
  FX := P.X;
  FY := P.Y;
  FZ := P.Z;
end;

procedure TPosition3D.SetPoint3DNoChange(const P: TPoint3D);
begin
  FSave := Vector3D(FX, FY, FZ);
  FX := P.X;
  FY := P.Y;
  FZ := P.Z;
end;

procedure TPosition3D.SetPoint3D(const Value: TPoint3D);
begin
  FSave := Vector3D(FX, FY, FZ);
  FX := Value.X;
  FY := Value.Y;
  FZ := Value.Z;
  if Assigned(OnChange) then
    OnChange(Self);
end;

procedure TPosition3D.SetX(const Value: Single);
begin
  if FX <> Value then
  begin
    FSave.X := FX;
    FX := Value;
    if Assigned(OnChangeX) then
      OnChangeX(Self)
    else if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TPosition3D.SetY(const Value: Single);
begin
  if FY <> Value then
  begin
    FSave.Y := FY;
    FY := Value;
    if Assigned(OnChangeY) then
      OnChangeY(Self)
    else if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TPosition3D.SetZ(const Value: Single);
begin
  if FZ <> Value then
  begin
    FSave.Z := FZ;
    FZ := Value;
    if Assigned(OnChangeZ) then
      OnChangeZ(Self)
    else if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

function TPosition3D.Empty: Boolean;
begin
  Result := (FX = 0) and (FY = 0) and (FZ = 0);
end;

{ TMeshData }

constructor TMeshData.Create;
begin
  inherited;
  FVertexBuffer := TVertexBuffer.Create([TVertexFormat.vfVertex, TVertexFormat.vfNormal, TVertexFormat.vfTexCoord0], 0);
  FIndexBuffer := TIndexBuffer.Create(0);
end;

destructor TMeshData.Destroy;
begin
  FVertexBuffer.Free;
  FIndexBuffer.Free;
  inherited;
end;

procedure TMeshData.Assign(Source: TPersistent);
begin
  if Source is TMeshData then
  begin
    FVertexBuffer.Assign(TMeshData(Source).FVertexBuffer);
    FIndexBuffer.Assign(TMeshData(Source).FIndexBuffer);
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited
end;

procedure TMeshData.AssignFromMeshVertex(const Vertices: array of TMeshVertex; const Indices: array of Word);
begin
  FVertexBuffer.Length := Length(Vertices);
  Move(Vertices[0], FVertexBuffer.Buffer^, FVertexBuffer.Size);
  FIndexBuffer.Length := Length(Indices);
  Move(Indices[0], FIndexBuffer.Buffer^, FIndexBuffer.Size);
end;

procedure TMeshData.CalcNormals;
var
  i, j: Integer;
  vn: TVector3D;
begin
  for i := 0 to FIndexBuffer.Length - 1 do
    FVertexBuffer.Normals[FIndexBuffer[i]] := Point3D(0, 0, 0);

  for i := 0 to (IndexBuffer.Length div 3) - 1 do
  begin
    j := i * 3;
    if False { CCW } then
      vn := CalcPlaneNormal(Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 0]].X, FVertexBuffer.Vertices[FIndexBuffer[j + 0]].Y,
        FVertexBuffer.Vertices[FIndexBuffer[j + 0]].Z), Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 1]].X,
        FVertexBuffer.Vertices[FIndexBuffer[j + 1]].Y, FVertexBuffer.Vertices[FIndexBuffer[j + 1]].Z),
        Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 2]].X, FVertexBuffer.Vertices[FIndexBuffer[j + 2]].Y,
        FVertexBuffer.Vertices[FIndexBuffer[j + 2]].Z))
    else
      vn := CalcPlaneNormal(Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 2]].X, FVertexBuffer.Vertices[FIndexBuffer[j + 2]].Y,
        FVertexBuffer.Vertices[FIndexBuffer[j + 2]].Z), Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 1]].X,
        FVertexBuffer.Vertices[FIndexBuffer[j + 1]].Y, FVertexBuffer.Vertices[FIndexBuffer[j + 1]].Z),
        Vector3D(FVertexBuffer.Vertices[FIndexBuffer[j + 0]].X, FVertexBuffer.Vertices[FIndexBuffer[j + 0]].Y,
        FVertexBuffer.Vertices[FIndexBuffer[j + 0]].Z));

    with FVertexBuffer.Normals[FIndexBuffer[j + 0]] do
      FVertexBuffer.Normals[FIndexBuffer[j + 0]] := Point3D(X + vn.X, Y + vn.Y, Z + vn.Z);
    with FVertexBuffer.Normals[FIndexBuffer[j + 1]] do
      FVertexBuffer.Normals[FIndexBuffer[j + 1]] := Point3D(X + vn.X, Y + vn.Y, Z + vn.Z);
    with FVertexBuffer.Normals[FIndexBuffer[j + 2]] do
      FVertexBuffer.Normals[FIndexBuffer[j + 2]] := Point3D(X + vn.X, Y + vn.Y, Z + vn.Z);
  end;
end;

procedure TMeshData.Clear;
begin
  FVertexBuffer.Length := 0;
  FIndexBuffer.Length := 0;
end;

procedure TMeshData.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Mesh', ReadMesh, WriteMesh, FVertexBuffer.Size > 0);
end;

function TMeshData.RayCastIntersect(const Width, Height, Depth: single;
  const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  INear, IFar, P1, P2, P3: TVector3D;
  I: Integer;
begin
  // Start with a simple test of the bounding cuboid
  Result := RayCastCuboidIntersect(RayPos, RayDir, Vector3D(0,0,0), Width, Height, Depth, INear, IFar) > 0;
  if Result then
  begin
    // Now, reset the result and check the triangles
    Result := False;
    if (VertexBuffer.Size > 0) and (IndexBuffer.Size > 0) then
    begin
      for I := 0 to (IndexBuffer.Length div 3) - 1 do
      begin
        if (IndexBuffer[(I * 3) + 0] < VertexBuffer.Length) and
          (IndexBuffer[(I * 3) + 1] < VertexBuffer.Length) and
          (IndexBuffer[(I * 3) + 2] < VertexBuffer.Length) then
        begin
          with VertexBuffer.Vertices[IndexBuffer[(I * 3) + 0]] do
            P1 := Vector3D(X * Width, Y * Height, Z * Depth);
          with VertexBuffer.Vertices[IndexBuffer[(I * 3) + 1]] do
            P2 := Vector3D(X * Width, Y * Height, Z * Depth);
          with VertexBuffer.Vertices[IndexBuffer[(I * 3) + 2]] do
            P3 := Vector3D(X * Width, Y * Height, Z * Depth);
          if RayCastTriangleIntersect(RayPos, RayDir, P1, P2, P3, INear)
          then
          begin
            Intersection := INear;
            Result := True;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMeshData.ReadMesh(Stream: TStream);
var
  l: Cardinal;
begin
  Stream.Read(l, SizeOf(l));
  FVertexBuffer.Length := l;
  Stream.Read(FVertexBuffer.Buffer^, FVertexBuffer.Size);
  Stream.Read(l, SizeOf(l));
  FIndexBuffer.Length := l;
  Stream.Read(FIndexBuffer.Buffer^, FIndexBuffer.Size);
end;

procedure TMeshData.WriteMesh(Stream: TStream);
var
  l: Cardinal;
begin
  l := FVertexBuffer.Length;
  Stream.Write(l, SizeOf(l));
  Stream.Write(FVertexBuffer.Buffer^, FVertexBuffer.Size);
  l := FIndexBuffer.Length;
  Stream.Write(l, SizeOf(l));
  Stream.Write(FIndexBuffer.Buffer^, FIndexBuffer.Size);
end;

function TMeshData.GetNormals: AnsiString;
{$IFNDEF FPC}
var
  i: Integer;
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create(FVertexBuffer.Length * (3 * 12 + 4));
  try
    for i := 0 to (FVertexBuffer.Length - 1) do
    begin
      SB.Append(FloatToStr(FVertexBuffer.Normals[i].x, USFormatSettings));
      SB.Append(' ');
      SB.Append(FloatToStr(FVertexBuffer.Normals[i].y, USFormatSettings));
      SB.Append(' ');
      SB.Append(FloatToStr(FVertexBuffer.Normals[i].z, USFormatSettings));
      SB.Append('  ');
    end;
    Result := SB.ToString;
    Result := Trim(Result);
  finally
    SB.Free;
  end;
end;
{$ELSE}
var
  S: AnsiString;
  i, Pos: Integer;
begin
  SetLength(Result, FVertexBuffer.Length * (3 * 12 + 4));
  Pos := 0;
  for i := 0 to (FVertexBuffer.Length - 1) do
  begin
    S := FloatToStr(FVertexBuffer.Normals[i].x, USFormatSettings) + ' ' + FloatToStr(FVertexBuffer.Normals[i].y, USFormatSettings) + ' '
      + FloatToStr(FVertexBuffer.Normals[i].z, USFormatSettings) + '  ';
    System.Move(PWideChar(S)^, PByteArray(Result)[Pos], Length(S));
    Pos := Pos + Length(S);
  end;
  SetLength(Result, Pos);
end;
{$ENDIF}

function TMeshData.GetPoint3Ds: AnsiString;
{$IFNDEF FPC}
var
  i: Integer;
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create(FVertexBuffer.Length * (3 * 12 + 4));
  try
    for i := 0 to (FVertexBuffer.Length - 1) do
    begin
      SB.Append(FloatToStr(FVertexBuffer.Vertices[i].x, USFormatSettings));
      SB.Append(' ');
      SB.Append(FloatToStr(FVertexBuffer.Vertices[i].y, USFormatSettings));
      SB.Append(' ');
      SB.Append(FloatToStr(FVertexBuffer.Vertices[i].z, USFormatSettings));
      SB.Append('  ');
    end;
    Result := SB.ToString;
    Result := Trim(Result);
  finally
    SB.Free;
  end;
end;
{$ELSE}
var
  S: AnsiString;
  i, Pos: Integer;
begin
  SetLength(Result, FVertexBuffer.Length * (3 * 12 + 4));
  Pos := 0;
  for i := 0 to (FVertexBuffer.Length - 1) do
  begin
    S := FloatToStr(FVertexBuffer.Vertices[i].X, USFormatSettings) + ' ' + FloatToStr(FVertexBuffer.Vertices[i].Y, USFormatSettings) + ' ' +
      FloatToStr(FVertexBuffer.Vertices[i].Z, USFormatSettings) + '  ';
    System.Move(PWideChar(S)^, PByteArray(Result)[Pos], Length(S));
    Pos := Pos + Length(S);
  end;
  SetLength(Result, Pos);
end;
{$ENDIF}

function TMeshData.GetTexCoordinates: AnsiString;
{$IFNDEF FPC}
var
  i: Integer;
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create(FVertexBuffer.Length * (2 * 12 + 4));
  try
    for i := 0 to (FVertexBuffer.Length - 1) do
    begin
      SB.Append(FloatToStr(FVertexBuffer.TexCoord0[i].x, USFormatSettings));
      SB.Append(' ');
      SB.Append(FloatToStr(FVertexBuffer.TexCoord0[i].y, USFormatSettings));
      SB.Append('  ');
    end;
    Result := SB.ToString;
    Result := Trim(Result);
  finally
    SB.Free;
  end;
end;
{$ELSE}
var
  S: AnsiString;
  i, Pos: Integer;
begin
  SetLength(Result, FVertexBuffer.Length * (2 * 12 + 4));
  Pos := 0;
  for i := 0 to (FVertexBuffer.Length - 1) do
  begin
    S := FloatToStr(FVertexBuffer.TexCoord0[i].x, USFormatSettings) + ' ' + FloatToStr(FVertexBuffer.TexCoord0[i].y,
      USFormatSettings) + '  ';
    System.Move(PWideChar(S)^, PByteArray(Result)[Pos], Length(S));
    Pos := Pos + Length(S);
  end;
  SetLength(Result, Pos);
end;
{$ENDIF}

function TMeshData.GetTriangleIndices: AnsiString;
{$IFNDEF FPC}
var
  i: Integer;
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create(FIndexBuffer.Length * 7);
  try
    for i := 0 to (FIndexBuffer.Length - 1) do
    begin
      SB.Append(FloatToStr(FIndexBuffer[i], USFormatSettings));
      SB.Append(' ');
      if (i + 1) mod 3 = 0 then
      SB.Append('  ');
    end;
    Result := SB.ToString;
    Result := Trim(Result);
  finally
    SB.Free;
  end;
end;
{$ELSE}
var
  S: AnsiString;
  i, Pos: Integer;
begin
  SetLength(Result, (FIndexBuffer.Length - 1) * (7));
  Pos := 0;
  for i := 0 to (FIndexBuffer.Length - 1) do
  begin
    S := FloatToStr(FIndexBuffer[i], USFormatSettings) + ' ';
    if (i + 1) mod 3 = 0 then
      S := S + ' ';
    System.Move(PWideChar(S)^, PByteArray(Result)[Pos], Length(S));
    Pos := Pos + Length(S);
  end;
  SetLength(Result, Pos);
end;
{$ENDIF}

procedure TMeshData.SetNormals(const Value: AnsiString);
var
  Pos, Count: Integer;
  Val: WideString;
begin
  // ensure a last separator
  Val := Value + ' ,';

  // calc size
  Pos := 1;
  Count := 0;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      WideGetToken(Pos, Val, ' ,');
      WideGetToken(Pos, Val, ' ,');
      WideGetToken(Pos, Val, ' ,');
    except
    end;
  end;
  // fill
  FVertexBuffer.Length := Count;
  Pos := 1;
  Count := 0;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      FVertexBuffer.Normals[Count - 1] := Point3D(
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings),
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings),
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings)
      );
    except
    end;
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TMeshData.SetPoint3Ds(const Value: AnsiString);
var
  Pos, Count: Integer;
  Val: WideString;
begin
  // ensure a last separator
  Val := Value + ' ,';

  // calc size
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      WideGetToken(Pos, Val, ' ,');
      WideGetToken(Pos, Val, ' ,');
      WideGetToken(Pos, Val, ' ,');
    except
    end;
  end;
  // fill
  FVertexBuffer.Length := Count;
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      FVertexBuffer.Vertices[Count - 1] := Point3D(
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings),
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings),
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings)
      );
    except
    end;
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TMeshData.SetTexCoordinates(const Value: AnsiString);
var
  Pos, Count: Integer;
  Val: WideString;
begin
  // ensure a last separator
  Val := Value + ' ';

  // calc size
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      WideGetToken(Pos, Val, ' ,');
      WideGetToken(Pos, Val, ' ,');
    except
    end;
  end;
  // calc size
  FVertexBuffer.Length := Count;
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      FVertexBuffer.TexCoord0[Count - 1] := PointF(
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings),
        StrToFloat(WideGetToken(Pos, Val, ' ,'), USFormatSettings));
    except
    end;
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TMeshData.SetTriangleIndices(const Value: AnsiString);
var
  Pos, Count: Integer;
  Val: WideString;
begin
  // ensure a last separator
  Val := Value + ' ,';

  // calc zise
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      WideGetToken(Pos, Val, ' ,');
    except
    end;
  end;
  // fill
  FIndexBuffer.Length := Count;
  Count := 0;
  Pos := 1;
  while Pos < Length(Val) do
  begin
    try
      Count := Count + 1;
      FIndexBuffer[Count - 1] := StrToInt(WideGetToken(Pos, Val, ' ,'));
    except
    end;
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

{ TMaterial }

constructor TMaterial.Create;
begin
  inherited;
  FDiffuse := DefaultDiffuse;
  FAmbient := DefaultAmbient;
  FSpecular := DefaultSpecular;
  FEmissive := 0;
  FShininess := DefaultShininess;
  FLighting := True;
  FShadeMode := TShadeMode.smGouraud;
  FTextureFiltering := TTextureFiltering.tfLinear;
  FTexture := TBitmap.Create(0, 0);
  FTexture.OnChange := DoTextureChanged;
end;

destructor TMaterial.Destroy;
begin
  FreeAndNil(FTexture);
  inherited;
end;

procedure TMaterial.DoTextureChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TMaterial.IsAmbientStored: Boolean;
begin
  Result := FAmbient <> DefaultAmbient;
end;

function TMaterial.IsDiffuseStored: Boolean;
begin
  Result := FDiffuse <> DefaultDiffuse;
end;

function TMaterial.IsEmissiveStored: Boolean;
begin
  Result := FEmissive <> 0;
end;

function TMaterial.IsSpecularStored: Boolean;
begin
  Result := FSpecular <> DefaultSpecular;
end;

procedure TMaterial.Assign(Source: TPersistent);
begin
  if Source is TMaterial then
  begin
    FDiffuse := (Source as TMaterial).FDiffuse;
    FAmbient := (Source as TMaterial).FAmbient;
    FEmissive := (Source as TMaterial).FEmissive;
    FSpecular := (Source as TMaterial).FSpecular;
    FLighting := (Source as TMaterial).FLighting;
    FModulation := (Source as TMaterial).FModulation;
    FShadeMode := (Source as TMaterial).FShadeMode;
    FFillMode := (Source as TMaterial).FFillMode;
    FTextureFiltering := (Source as TMaterial).FTextureFiltering;
    FTexture.Assign((Source as TMaterial).FTexture);
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited
end;

procedure TMaterial.SetModulation(const Value: TTextureMode);
begin
  if FModulation <> Value then
  begin
    FModulation := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetLighting(const Value: Boolean);
begin
  if FLighting <> Value then
  begin
    FLighting := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetAmbient(const Value: TAlphaColor);
begin
  if FAmbient <> Value then
  begin
    FAmbient := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetShadeMode(const Value: TShadeMode);
begin
  if FShadeMode <> Value then
  begin
    FShadeMode := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetShininess(const Value: Integer);
begin
  if FShininess <> Value then
  begin
    FShininess := Value;
    if FShininess < 0 then FShininess := 0;
    if FShininess > 128 then FShininess := 128;
  end;
end;

procedure TMaterial.SetFillMode(const Value: TFillMode);
begin
  if FFillMode <> Value then
  begin
    FFillMode := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetSpecular(const Value: TAlphaColor);
begin
  if FSpecular <> Value then
  begin
    FSpecular := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetTexture(const Value: TBitmap);
begin
  FTexture.Assign(Value);
end;

procedure TMaterial.SetTextureFiltering(const Value: TTextureFiltering);
begin
  if FTextureFiltering <> Value then
  begin
    FTextureFiltering := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetDiffuse(const Value: TAlphaColor);
begin
  if FDiffuse <> Value then
  begin
    FDiffuse := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TMaterial.SetEmissive(const Value: TAlphaColor);
begin
  if FEmissive <> Value then
  begin
    FEmissive := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TIndexBuffer }

constructor TIndexBuffer.Create(const ALength: Integer);
begin
  inherited Create;
  FLength := ALength;
  FSize := FLength * 2;
  GetMem(FBuffer, Size);
end;

destructor TIndexBuffer.Destroy;
begin
  FreeMem(FBuffer);
  inherited;
end;

procedure TIndexBuffer.Assign(Source: TPersistent);
begin
  if Source is TIndexBuffer then
  begin
    FreeMem(FBuffer);
    FLength := TIndexBuffer(Source).FLength;
    FSize := FLength * 2;
    GetMem(FBuffer, Size);
    Move(TIndexBuffer(Source).Buffer^, Buffer^, Size);
  end
  else
    inherited;
end;

function TIndexBuffer.GetIndices(AIndex: Integer): Integer;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PWordArray(FBuffer)[AIndex];
end;

procedure TIndexBuffer.SetIndices(AIndex: Integer; const Value: Integer);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PWordArray(FBuffer)[AIndex] := Value
end;

procedure TIndexBuffer.SetLength(const Value: Integer);
var
  Buf: Pointer;
  SaveLength: Integer;
begin
  if FLength <> Value then
  begin
    if FLength < Value then
      SaveLength := FLength
    else
      SaveLength := Value;
    GetMem(Buf, SaveLength * 2);
    try
      Move(FBuffer^, Buf^, SaveLength * 2);
      FreeMem(FBuffer);
      FLength := Value;
      FSize := FLength * 2;
      GetMem(FBuffer, FSize);
      Move(Buf^, FBuffer^, SaveLength * 2);
    finally
      FreeMem(Buf);
    end;
  end;
end;

{ TVertexBuffer }

constructor TVertexBuffer.Create(const AFormat: TVertexFormats;
  const ALength: Integer);
begin
  inherited Create;
  FFormat := AFormat;
  FLength := ALength;
  FVertexSize := FMX_Types3D.VertexSize(FFormat);
  FSize := FVertexSize * FLength;
  GetMem(FBuffer, Size);

  FTexCoord0 := GetVertexOffset(TVertexFormat.vfTexCoord0, FFormat);
  FTexCoord1 := GetVertexOffset(TVertexFormat.vfTexCoord1, FFormat);
  FTexCoord2 := GetVertexOffset(TVertexFormat.vfTexCoord2, FFormat);
  FTexCoord3 := GetVertexOffset(TVertexFormat.vfTexCoord3, FFormat);
  FDiffuse := GetVertexOffset(TVertexFormat.vfDiffuse, FFormat);
  FSpecular := GetVertexOffset(TVertexFormat.vfSpecular, FFormat);
  FNormal := GetVertexOffset(TVertexFormat.vfNormal, FFormat);
end;

destructor TVertexBuffer.Destroy;
begin
  FreeMem(FBuffer);
  inherited;
end;

procedure TVertexBuffer.Assign(Source: TPersistent);
begin
  if Source is TVertexBuffer then
  begin
    FreeMem(FBuffer);
    FFormat := TVertexBuffer(Source).FFormat;
    FLength := TVertexBuffer(Source).FLength;
    FVertexSize := FMX_Types3D.VertexSize(FFormat);
    FSize := FVertexSize * FLength;
    GetMem(FBuffer, Size);
    Move(TVertexBuffer(Source).Buffer^, Buffer^, Size);
  end
  else
    inherited;
end;

function TVertexBuffer.GetVertices(AIndex: Integer): TPoint3D;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PPoint3D(@PByteArray(FBuffer)[AIndex * FVertexSize])^;
end;

procedure TVertexBuffer.SetVertices(AIndex: Integer; const Value: TPoint3D);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPoint3D(@PByteArray(FBuffer)[AIndex * FVertexSize])^ := Value;
end;

function TVertexBuffer.GetTexCoord0(AIndex: Integer): TPointF;
begin
  Result := PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord0])^;
end;

procedure TVertexBuffer.SetTexCoord0(AIndex: Integer; const Value: TPointF);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord0])^ := Value;
end;

function TVertexBuffer.GetTexCoord1(AIndex: Integer): TPointF;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord1])^;
end;

procedure TVertexBuffer.SetTexCoord1(AIndex: Integer; const Value: TPointF);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord1])^ := Value;
end;

function TVertexBuffer.GetTexCoord2(AIndex: Integer): TPointF;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord2])^;
end;

procedure TVertexBuffer.SetTexCoord2(AIndex: Integer; const Value: TPointF);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord2])^ := Value;
end;

function TVertexBuffer.GetTexCoord3(AIndex: Integer): TPointF;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord3])^;
end;

procedure TVertexBuffer.SetTexCoord3(AIndex: Integer; const Value: TPointF);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPointF(@PByteArray(FBuffer)[AIndex * FVertexSize + FTexCoord3])^ := Value;
end;

function TVertexBuffer.GetDiffuse(AIndex: Integer): TAlphaColor;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PColor(@PByteArray(FBuffer)[AIndex * FVertexSize + FDiffuse])^;
end;

procedure TVertexBuffer.SetDiffuse(AIndex: Integer; const Value: TAlphaColor);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PColor(@PByteArray(FBuffer)[AIndex * FVertexSize + FDiffuse])^ := Value;
end;

procedure TVertexBuffer.SetLength(const Value: Integer);
var
  SaveLength: Integer;
  Buf: Pointer;
begin
  if FLength <> Value then
  begin
    if FLength < Value then
      SaveLength := FLength
    else
      SaveLength := Value;
    GetMem(Buf, SaveLength * FVertexSize);
    try
      Move(FBuffer^, Buf^, SaveLength * FVertexSize);
      FreeMem(FBuffer);
      FLength := Value;
      FSize := FLength * FVertexSize;
      GetMem(FBuffer, FSize);
      Move(Buf^, FBuffer^, SaveLength * FVertexSize);
    finally
      FreeMem(Buf);
    end;
  end;
end;

function TVertexBuffer.GetNormals(AIndex: Integer): TPoint3D;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PPoint3D(@PByteArray(FBuffer)[AIndex * FVertexSize + FNormal])^;
end;

procedure TVertexBuffer.SetNormals(AIndex: Integer; const Value: TPoint3D);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PPoint3D(@PByteArray(FBuffer)[AIndex * FVertexSize + FNormal])^ := Value;
end;

function TVertexBuffer.GetSpecular(AIndex: Integer): TAlphaColor;
begin
  assert((AIndex >= 0) and (AIndex < Length));
  Result := PColor(@PByteArray(FBuffer)[AIndex * FVertexSize + FSpecular])^;
end;

procedure TVertexBuffer.SetSpecular(AIndex: Integer; const Value: TAlphaColor);
begin
  assert((AIndex >= 0) and (AIndex < Length));
  PColor(@PByteArray(FBuffer)[AIndex * FVertexSize + FSpecular])^ := Value;
end;

{ TContext3D }

constructor TContext3D.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
  const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited Create;
  FParent := AParent;
  FMultisample := AMultisample;
  FDepthStencil := ADepthStencil;
  FPaintToMatrix := IdentityMatrix3D;
  FWidth := AWidth;
  FHeight := AHeight;
  FBitmaps := TList.Create;
  FLights := TList.Create;
end;

constructor TContext3D.CreateFromBitmap(const ABitmap: TBitmap; const AMultisample: TMultisample;
  const ADepthStencil: Boolean);
begin
  inherited Create;
  FMultisample := AMultisample;
  FDepthStencil := ADepthStencil;
  FBitmap := ABitmap;
  FPaintToMatrix := IdentityMatrix3D;
  FWidth := FBitmap.Width;
  FHeight := FBitmap.Height;
  FBitmaps := TList.Create;
  FLights := TList.Create;
end;

destructor TContext3D.Destroy;
var
  I: Integer;
begin
  if FBitmaps.Count > 0 then
    for I := FBitmaps.Count - 1 downto 0 do
      FreeNotification(TBitmap(FBitmaps[I]));
  FBitmaps.Free;
  FreeBuffer;
  FLights.Free;
  inherited;
end;

procedure TContext3D.FreeNotification(AObject: TObject);
begin
  if (AObject <> nil) and (AObject is TBitmap) then
    DestroyBitmapHandle(TBitmap(AObject));
end;

function TContext3D.GetScreenMatrix: TMatrix3D;
var
  matProj, scaleMatrix, transMatrix, orthoProj: TMatrix3D;
begin
  orthoProj := MatrixOrthoOffCenterRH(0, FWidth, 0, FHeight, 1, 1000);
  matProj := MatrixPerspectiveFovRH(cPI / 6, FWidth / FHeight, 1, 1000);

  transMatrix := IdentityMatrix3D;
  transMatrix.m41 := 0;
  transMatrix.m42 := 0;
  transMatrix.m43 := -2;
  matProj := Matrix3DMultiply(transMatrix, matProj);

  scaleMatrix := IdentityMatrix3D;
  scaleMatrix.m11 := (orthoProj.m11 / matProj.m11) * 2;
  scaleMatrix.m22 := -(orthoProj.m11 / matProj.m11) * 2;
  scaleMatrix.m33 := -(orthoProj.m11 / matProj.m11) * 2;
  matProj := Matrix3DMultiply(scaleMatrix, matProj);

  transMatrix := IdentityMatrix3D;
  transMatrix.m41 := -FWidth / 2;
  transMatrix.m42 := -FHeight / 2;
  transMatrix.m43 := 0;
  matProj := Matrix3DMultiply(transMatrix, matProj);

  Result := matProj;
end;

procedure TContext3D.AddLight(const ALight: TLight);
begin
  FLights.Add(ALight);
  if FViewport <> nil then
    FViewport.NeedRender;
end;

procedure TContext3D.DeleteLight(const ALight: TLight);
begin
  FLights.Remove(ALight);
  if FViewport <> nil then
    FViewport.NeedRender;
end;

function TContext3D.GetPixelToPixelPolygonOffset: TPointF;
begin
  Result := PointF(0, 0);
end;

function TContext3D.GetProjectionMatrix: TMatrix3D;
begin
  Result := MatrixPerspectiveFovRH(cPI / 4, FWidth / FHeight, 1.0, 1000.0);
  if (FPaintToMatrix.m41 <> 0) or (FPaintToMatrix.m11 <> 1) then
  begin
    Result := Matrix3DMultiply(Result, FPaintToMatrix);
  end;
end;

procedure TContext3D.CreateBuffer;
begin
  CreateDefaultShaders;
end;

procedure TContext3D.FreeBuffer;
begin
  FreeDefaultShaders;
end;

const
  DX9VS2BIN_NoLight: array [0..603] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $3D, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $C8, $00, $00, $00, $00, $03, $FE, $FF, $04, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $C1, $00, $00, $00, 
    $6C, $00, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $78, $00, $00, $00, $00, $00, $00, $00, $88, $00, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $98, $00, $00, $00, $00, $00, $00, $00, 
    $A8, $00, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $98, $00, $00, $00, $00, $00, $00, $00, $B9, $00, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $98, $00, $00, $00, $00, $00, $00, $00, 
    $4D, $56, $50, $4D, $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, 
    $73, $65, $00, $AB, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $6F, $70, $74, 
    $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, $72, $20, $43, 
    $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $AB, $AB, $AB, $51, $00, $00, $05, $04, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $80, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, 
    $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, 
    $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $03, $E0, $01, $00, $00, $02, $00, $00, $07, $80, $04, $00, $E4, $A0, 
    $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $8C, $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, 
    $01, $00, $E4, $90, $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $80, $00, $00, $00, $80, $01, $00, $E4, $80, $0E, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, 
    $11, $00, $24, $A0, $00, $00, $95, $80, $00, $00, $6A, $80, $02, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $E4, $80, $00, $00, $E4, $81, $23, $00, $00, $02, $02, $00, $01, $80, $0C, $00, $00, $A0, 
    $0D, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $81, $02, $00, $00, $80, $04, $00, $00, $04, $01, $00, $0F, $E0, $02, $00, $00, $80, $01, $00, $E4, $80, $00, $00, $E4, $80, $05, $00, $00, $03, 
    $00, $00, $0F, $80, $01, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, 
    $02, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $01, $00, $00, $02, $02, $00, $03, $E0, $02, $00, $E4, $90, 
    $FF, $FF, $00, $00
  );
  DX9VS2BIN_1Light: array [0..2267] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $8E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0F, $02, $00, $00, $00, $03, $FE, $FF, $0A, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $08, $02, $00, $00, 
    $E4, $00, $00, $00, $02, $00, $13, $00, $07, $00, $4E, $00, $70, $01, $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $9C, $01, $00, $00, $02, $00, $10, $00, $01, $00, $42, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $AC, $01, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $BB, $01, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $CC, $01, $00, $00, $02, $00, $12, $00, $01, $00, $4A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $01, $00, $00, $02, $00, $0F, $00, $01, $00, $3E, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $EA, $01, $00, $00, $02, $00, $04, $00, $04, $00, $12, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $F4, $01, $00, $00, $02, $00, $08, $00, $03, $00, $22, $00, $8C, $01, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $4C, $69, $67, $68, $74, $73, $00, $4F, $70, $74, $73, $00, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $41, $74, $74, $6E, $00, $50, $6F, $73, $00, $44, $69, $72, 
    $00, $44, $69, $66, $66, $75, $73, $65, $43, $6F, $6C, $6F, $72, $00, $53, $70, $65, $63, $75, $6C, $61, $72, $43, $6F, $6C, $6F, $72, $00, $41, $6D, $62, $69, $65, $6E, $74, $43, $6F, $6C, $6F, $72, 
    $00, $AB, $AB, $AB, $EB, $00, $00, $00, $F0, $00, $00, $00, $00, $01, $00, $00, $F0, $00, $00, $00, $05, $01, $00, $00, $F0, $00, $00, $00, $09, $01, $00, $00, $F0, $00, $00, $00, $0D, $01, $00, $00, 
    $F0, $00, $00, $00, $1A, $01, $00, $00, $F0, $00, $00, $00, $28, $01, $00, $00, $F0, $00, $00, $00, $05, $00, $00, $00, $01, $00, $1C, $00, $01, $00, $07, $00, $38, $01, $00, $00, $4D, $56, $50, $4D, 
    $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $41, $6D, $62, $69, $65, $6E, $74, $00, 
    $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, $73, $65, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, 
    $4F, $70, $74, $73, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $53, $70, $65, $63, $75, $6C, $61, $72, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, $77, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, 
    $77, $49, $54, $00, $6F, $70, $74, $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, 
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $0B, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $C0, $00, $00, $80, $3F, 
    $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $03, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, $02, $00, $0F, $90, $1F, $00, $00, $02, 
    $05, $00, $00, $80, $03, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, $1F, $00, $00, $02, $05, $00, $00, $80, 
    $02, $00, $03, $E0, $01, $00, $00, $02, $02, $00, $03, $E0, $03, $00, $E4, $90, $23, $00, $00, $02, $00, $00, $01, $80, $0C, $00, $00, $A0, $29, $00, $03, $02, $00, $00, $00, $81, $00, $00, $00, $80, 
    $01, $00, $00, $02, $00, $00, $01, $80, $0B, $00, $00, $A0, $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $8C, 
    $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, $02, $00, $E4, $90, $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $E0, $00, $00, $00, $80, $01, $00, $E4, $80, 
    $0E, $00, $E4, $A0, $2A, $00, $00, $00, $05, $00, $00, $03, $00, $00, $07, $80, $09, $00, $E4, $A0, $01, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, $08, $00, $E4, $A0, $01, $00, $00, $90, 
    $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, $0A, $00, $E4, $A0, $01, $00, $AA, $90, $00, $00, $E4, $80, $24, $00, $00, $02, $01, $00, $07, $80, $00, $00, $E4, $80, $05, $00, $00, $03, 
    $00, $00, $07, $80, $05, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, $04, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, 
    $06, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $07, $80, $00, $00, $E4, $80, $07, $00, $E4, $A0, $23, $00, $00, $02, $00, $00, $08, $80, $13, $00, $55, $A0, 
    $29, $00, $03, $02, $00, $00, $FF, $81, $00, $00, $FF, $80, $08, $00, $00, $03, $00, $00, $08, $80, $01, $00, $E4, $81, $16, $00, $E4, $A0, $0B, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $80, 
    $0B, $00, $55, $A0, $0C, $00, $00, $03, $01, $00, $08, $80, $0B, $00, $55, $A0, $00, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $01, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $07, $00, $00, $02, 
    $02, $00, $01, $80, $02, $00, $00, $80, $04, $00, $00, $04, $02, $00, $07, $80, $00, $00, $E4, $80, $02, $00, $00, $81, $16, $00, $E4, $A0, $24, $00, $00, $02, $03, $00, $07, $80, $02, $00, $E4, $80, 
    $08, $00, $00, $03, $02, $00, $01, $80, $01, $00, $E4, $81, $03, $00, $E4, $80, $0B, $00, $00, $03, $02, $00, $01, $80, $02, $00, $00, $80, $0B, $00, $55, $A0, $20, $00, $00, $03, $03, $00, $01, $80, 
    $02, $00, $00, $80, $12, $00, $00, $A0, $05, $00, $00, $03, $02, $00, $0F, $80, $03, $00, $00, $80, $18, $00, $E4, $A0, $05, $00, $00, $03, $02, $00, $0F, $80, $01, $00, $FF, $80, $02, $00, $E4, $80, 
    $05, $00, $00, $03, $03, $00, $0F, $80, $00, $00, $FF, $80, $17, $00, $E4, $A0, $2A, $00, $00, $00, $01, $00, $00, $02, $03, $00, $0F, $80, $0B, $00, $55, $A0, $01, $00, $00, $02, $02, $00, $0F, $80, 
    $0B, $00, $55, $A0, $2B, $00, $00, $00, $01, $00, $00, $02, $04, $00, $0F, $80, $0B, $00, $E4, $A0, $02, $00, $00, $03, $04, $00, $05, $80, $04, $00, $E4, $80, $13, $00, $55, $A0, $29, $00, $03, $02, 
    $04, $00, $00, $8C, $04, $00, $00, $8B, $08, $00, $00, $03, $00, $00, $08, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $02, $00, $00, $03, 
    $05, $00, $07, $80, $00, $00, $E4, $80, $15, $00, $E4, $A1, $08, $00, $00, $03, $01, $00, $08, $80, $05, $00, $E4, $80, $05, $00, $E4, $80, $07, $00, $00, $02, $01, $00, $08, $80, $01, $00, $FF, $80, 
    $05, $00, $00, $03, $05, $00, $07, $80, $05, $00, $E4, $80, $01, $00, $FF, $80, $04, $00, $00, $04, $06, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $81, $05, $00, $E4, $81, $24, $00, $00, $02, 
    $07, $00, $07, $80, $06, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $08, $80, $01, $00, $E4, $80, $07, $00, $E4, $80, $0B, $00, $00, $03, $00, $00, $08, $80, $00, $00, $FF, $80, $0B, $00, $55, $A0, 
    $20, $00, $00, $03, $04, $00, $01, $80, $00, $00, $FF, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $00, $00, $08, $80, $01, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $08, $80, $00, $00, $FF, $80, 
    $00, $00, $FF, $80, $04, $00, $00, $04, $00, $00, $08, $80, $14, $00, $55, $A0, $00, $00, $FF, $80, $14, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $08, $80, $01, $00, $FF, $80, $14, $00, $AA, $A0, 
    $00, $00, $FF, $80, $06, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $08, $00, $00, $03, $01, $00, $08, $80, $01, $00, $E4, $80, $05, $00, $E4, $81, $0B, $00, $00, $03, $01, $00, $08, $80, 
    $01, $00, $FF, $80, $0B, $00, $55, $A0, $0C, $00, $00, $03, $05, $00, $01, $80, $0B, $00, $55, $A0, $01, $00, $FF, $80, $05, $00, $00, $03, $06, $00, $0F, $80, $04, $00, $00, $80, $18, $00, $E4, $A0, 
    $04, $00, $00, $04, $02, $00, $0F, $80, $05, $00, $00, $80, $06, $00, $E4, $80, $02, $00, $E4, $80, $05, $00, $00, $03, $05, $00, $0F, $80, $01, $00, $FF, $80, $17, $00, $E4, $A0, $04, $00, $00, $04, 
    $03, $00, $0F, $80, $05, $00, $E4, $80, $00, $00, $FF, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $29, $00, $03, $02, $04, $00, $AA, $8C, $04, $00, $AA, $8B, $08, $00, $00, $03, $00, $00, $08, $80, 
    $00, $00, $E4, $80, $00, $00, $E4, $80, $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $02, $00, $00, $03, $05, $00, $07, $80, $00, $00, $E4, $80, $15, $00, $E4, $A1, $08, $00, $00, $03, 
    $01, $00, $08, $80, $05, $00, $E4, $80, $05, $00, $E4, $80, $07, $00, $00, $02, $01, $00, $08, $80, $01, $00, $FF, $80, $05, $00, $00, $03, $05, $00, $07, $80, $05, $00, $E4, $80, $01, $00, $FF, $80, 
    $04, $00, $00, $04, $00, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $81, $05, $00, $E4, $81, $24, $00, $00, $02, $06, $00, $07, $80, $00, $00, $E4, $80, $08, $00, $00, $03, $00, $00, $01, $80, 
    $01, $00, $E4, $80, $06, $00, $E4, $80, $06, $00, $00, $02, $00, $00, $02, $80, $01, $00, $FF, $80, $05, $00, $00, $03, $00, $00, $04, $80, $00, $00, $55, $80, $00, $00, $55, $80, $04, $00, $00, $04, 
    $00, $00, $02, $80, $14, $00, $55, $A0, $00, $00, $55, $80, $14, $00, $00, $A0, $04, $00, $00, $04, $00, $00, $02, $80, $00, $00, $AA, $80, $14, $00, $AA, $A0, $00, $00, $55, $80, $06, $00, $00, $02, 
    $00, $00, $02, $80, $00, $00, $55, $80, $08, $00, $00, $03, $00, $00, $04, $80, $05, $00, $E4, $80, $16, $00, $E4, $A0, $20, $00, $00, $03, $01, $00, $08, $80, $00, $00, $AA, $80, $13, $00, $FF, $A0, 
    $0C, $00, $00, $03, $00, $00, $04, $80, $13, $00, $AA, $A0, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $04, $80, $01, $00, $FF, $80, $00, $00, $AA, $80, $05, $00, $00, $03, $00, $00, $02, $80, 
    $00, $00, $55, $80, $00, $00, $AA, $80, $0B, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0B, $00, $55, $A0, $20, $00, $00, $03, $01, $00, $08, $80, $00, $00, $00, $80, $12, $00, $00, $A0, 
    $08, $00, $00, $03, $00, $00, $01, $80, $01, $00, $E4, $80, $05, $00, $E4, $81, $0B, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0B, $00, $55, $A0, $0C, $00, $00, $03, $00, $00, $04, $80, 
    $0B, $00, $55, $A0, $00, $00, $00, $80, $05, $00, $00, $03, $01, $00, $0F, $80, $01, $00, $FF, $80, $18, $00, $E4, $A0, $04, $00, $00, $04, $02, $00, $0F, $80, $00, $00, $AA, $80, $01, $00, $E4, $80, 
    $02, $00, $E4, $80, $05, $00, $00, $03, $01, $00, $0F, $80, $00, $00, $00, $80, $17, $00, $E4, $A0, $04, $00, $00, $04, $03, $00, $0F, $80, $01, $00, $E4, $80, $00, $00, $55, $80, $03, $00, $E4, $80, 
    $2B, $00, $00, $00, $05, $00, $00, $03, $00, $00, $0F, $80, $03, $00, $E4, $80, $0E, $00, $E4, $A0, $01, $00, $00, $02, $01, $00, $0F, $80, $19, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, 
    $01, $00, $E4, $80, $10, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $E4, $80, $0F, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $0F, $80, 
    $11, $00, $24, $A0, $04, $00, $7F, $80, $04, $00, $D5, $80, $02, $00, $00, $03, $01, $00, $0F, $E0, $00, $00, $E4, $80, $01, $00, $E4, $80, $2B, $00, $00, $00, $05, $00, $00, $03, $00, $00, $0F, $80, 
    $01, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $E4, $A0, 
    $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $FF, $FF, $00, $00
  );
  DX9VS2BIN_2Light: array [0..2439] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $8E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0F, $02, $00, $00, $00, $03, $FE, $FF, $0A, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $08, $02, $00, $00, 
    $E4, $00, $00, $00, $02, $00, $13, $00, $0E, $00, $4E, $00, $70, $01, $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $9C, $01, $00, $00, $02, $00, $10, $00, $01, $00, $42, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $AC, $01, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $BB, $01, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $CC, $01, $00, $00, $02, $00, $12, $00, $01, $00, $4A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $01, $00, $00, $02, $00, $0F, $00, $01, $00, $3E, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $EA, $01, $00, $00, $02, $00, $04, $00, $04, $00, $12, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $F4, $01, $00, $00, $02, $00, $08, $00, $03, $00, $22, $00, $8C, $01, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $4C, $69, $67, $68, $74, $73, $00, $4F, $70, $74, $73, $00, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $41, $74, $74, $6E, $00, $50, $6F, $73, $00, $44, $69, $72, 
    $00, $44, $69, $66, $66, $75, $73, $65, $43, $6F, $6C, $6F, $72, $00, $53, $70, $65, $63, $75, $6C, $61, $72, $43, $6F, $6C, $6F, $72, $00, $41, $6D, $62, $69, $65, $6E, $74, $43, $6F, $6C, $6F, $72, 
    $00, $AB, $AB, $AB, $EB, $00, $00, $00, $F0, $00, $00, $00, $00, $01, $00, $00, $F0, $00, $00, $00, $05, $01, $00, $00, $F0, $00, $00, $00, $09, $01, $00, $00, $F0, $00, $00, $00, $0D, $01, $00, $00, 
    $F0, $00, $00, $00, $1A, $01, $00, $00, $F0, $00, $00, $00, $28, $01, $00, $00, $F0, $00, $00, $00, $05, $00, $00, $00, $01, $00, $1C, $00, $02, $00, $07, $00, $38, $01, $00, $00, $4D, $56, $50, $4D, 
    $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $41, $6D, $62, $69, $65, $6E, $74, $00, 
    $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, $73, $65, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, 
    $4F, $70, $74, $73, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $53, $70, $65, $63, $75, $6C, $61, $72, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, $77, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, 
    $77, $49, $54, $00, $6F, $70, $74, $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, 
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $0B, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $40, $00, $00, $00, $00, $00, $00, $E0, $40, 
    $30, $00, $00, $05, $00, $00, $0F, $F0, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, 
    $03, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, $02, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $03, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, 
    $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $03, $E0, $01, $00, $00, $02, $02, $00, $03, $E0, $03, $00, $E4, $90, 
    $23, $00, $00, $02, $00, $00, $01, $80, $0C, $00, $00, $A0, $29, $00, $03, $02, $00, $00, $00, $81, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $01, $80, $0B, $00, $00, $A0, $02, $00, $00, $03, 
    $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $8C, $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, $02, $00, $E4, $90, 
    $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $E0, $00, $00, $00, $80, $01, $00, $E4, $80, $0E, $00, $E4, $A0, $2A, $00, $00, $00, $05, $00, $00, $03, $00, $00, $07, $80, 
    $05, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, $04, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, $06, $00, $E4, $A0, 
    $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $07, $80, $00, $00, $E4, $80, $07, $00, $E4, $A0, $08, $00, $00, $03, $00, $00, $08, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, 
    $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $07, $80, $09, $00, $E4, $A0, $01, $00, $55, $90, $04, $00, $00, $04, $01, $00, $07, $80, $08, $00, $E4, $A0, 
    $01, $00, $00, $90, $01, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $07, $80, $0A, $00, $E4, $A0, $01, $00, $AA, $90, $01, $00, $E4, $80, $24, $00, $00, $02, $02, $00, $07, $80, $01, $00, $E4, $80, 
    $05, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $80, $01, $00, $00, $02, $03, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $04, $00, $0F, $80, $0B, $00, $AA, $A0, 
    $01, $00, $00, $02, $05, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $01, $00, $08, $80, $0B, $00, $AA, $A0, $26, $00, $00, $01, $00, $00, $E4, $F0, $05, $00, $00, $03, $02, $00, $08, $80, 
    $01, $00, $FF, $80, $0B, $00, $FF, $A0, $2E, $00, $00, $02, $00, $00, $01, $B0, $02, $00, $FF, $80, $02, $00, $00, $04, $05, $00, $0F, $80, $05, $00, $E4, $80, $19, $20, $E4, $A0, $00, $00, $00, $B0, 
    $23, $00, $00, $03, $02, $00, $08, $80, $13, $20, $55, $A0, $00, $00, $00, $B0, $29, $00, $03, $02, $02, $00, $FF, $81, $02, $00, $FF, $80, $08, $00, $00, $04, $02, $00, $08, $80, $02, $00, $E4, $81, 
    $16, $20, $E4, $A0, $00, $00, $00, $B0, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, 
    $04, $00, $00, $05, $06, $00, $0E, $80, $00, $00, $90, $80, $00, $00, $FF, $81, $16, $20, $90, $A0, $00, $00, $00, $B0, $24, $00, $00, $02, $07, $00, $07, $80, $06, $00, $F9, $80, $08, $00, $00, $03, 
    $06, $00, $02, $80, $02, $00, $E4, $81, $07, $00, $E4, $80, $0B, $00, $00, $03, $06, $00, $02, $80, $06, $00, $55, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $07, $00, $01, $80, $06, $00, $55, $80, 
    $12, $00, $00, $A0, $05, $00, $00, $04, $07, $00, $0F, $80, $07, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $07, $00, $E4, $80, 
    $04, $00, $E4, $80, $04, $00, $00, $05, $03, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $03, $00, $E4, $80, $2B, $00, $00, $00, $01, $00, $00, $02, $06, $00, $03, $80, 
    $0B, $00, $E4, $A0, $02, $00, $00, $04, $06, $00, $03, $80, $06, $00, $E4, $8C, $13, $20, $55, $A0, $00, $00, $00, $B0, $29, $00, $03, $02, $06, $00, $00, $8C, $06, $00, $00, $8B, $02, $00, $00, $04, 
    $06, $00, $0D, $80, $00, $00, $94, $80, $15, $20, $94, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $F8, $80, $06, $00, $F8, $80, $07, $00, $00, $02, $02, $00, $08, $80, 
    $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $F8, $80, $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, 
    $07, $00, $01, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $07, $00, $01, $80, $07, $00, $00, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $08, $00, $01, $80, $07, $00, $00, $80, 
    $12, $00, $00, $A0, $06, $00, $00, $02, $07, $00, $01, $80, $02, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $02, $80, $07, $00, $00, $80, $07, $00, $00, $80, $04, $00, $00, $06, $07, $00, $01, $80, 
    $14, $20, $55, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, $04, $00, $00, $05, $07, $00, $01, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, 
    $07, $00, $00, $80, $06, $00, $00, $02, $07, $00, $01, $80, $07, $00, $00, $80, $05, $00, $00, $03, $06, $00, $0D, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, 
    $02, $00, $E4, $80, $06, $00, $F8, $81, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, 
    $05, $00, $00, $04, $08, $00, $0F, $80, $08, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $08, $00, $E4, $80, $04, $00, $E4, $80, 
    $05, $00, $00, $04, $08, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $08, $00, $E4, $80, $07, $00, $00, $80, $03, $00, $E4, $80, 
    $2B, $00, $00, $00, $29, $00, $03, $02, $06, $00, $55, $8C, $06, $00, $55, $8B, $02, $00, $00, $04, $06, $00, $07, $80, $00, $00, $E4, $80, $15, $20, $E4, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, 
    $02, $00, $08, $80, $06, $00, $E4, $80, $06, $00, $E4, $80, $07, $00, $00, $02, $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $81, 
    $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, $06, $00, $08, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $06, $00, $08, $80, 
    $06, $00, $FF, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $07, $00, $01, $80, $06, $00, $FF, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $06, $00, $08, $80, $02, $00, $FF, $80, $05, $00, $00, $03, 
    $07, $00, $02, $80, $06, $00, $FF, $80, $06, $00, $FF, $80, $04, $00, $00, $06, $06, $00, $08, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, 
    $04, $00, $00, $05, $06, $00, $08, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $06, $00, $00, $02, $06, $00, $08, $80, $06, $00, $FF, $80, $05, $00, $00, $03, 
    $06, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $80, $06, $00, $E4, $81, $08, $00, $00, $04, $06, $00, $01, $80, $06, $00, $E4, $80, 
    $16, $20, $E4, $A0, $00, $00, $00, $B0, $20, $00, $00, $04, $07, $00, $02, $80, $06, $00, $00, $80, $13, $20, $FF, $A0, $00, $00, $00, $B0, $0C, $00, $00, $04, $06, $00, $01, $80, $13, $20, $AA, $A0, 
    $00, $00, $00, $B0, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $07, $00, $55, $80, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $06, $00, $FF, $80, $06, $00, $00, $80, 
    $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $02, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $07, $00, $0F, $80, 
    $07, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $55, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, $07, $00, $0F, $80, 
    $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $00, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $02, $00, $00, $03, 
    $01, $00, $08, $80, $01, $00, $FF, $80, $0B, $00, $00, $A1, $27, $00, $00, $00, $05, $00, $00, $03, $00, $00, $0F, $80, $03, $00, $E4, $80, $0E, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, 
    $05, $00, $E4, $80, $10, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $04, $00, $E4, $80, $0F, $00, $E4, $A0, $00, $00, $E4, $80, $01, $00, $00, $02, $01, $00, $05, $80, 
    $0B, $00, $E4, $A0, $04, $00, $00, $04, $01, $00, $0F, $80, $11, $00, $24, $A0, $01, $00, $80, $8B, $01, $00, $2A, $8B, $02, $00, $00, $03, $01, $00, $0F, $E0, $00, $00, $E4, $80, $01, $00, $E4, $80, 
    $2B, $00, $00, $00, $05, $00, $00, $03, $00, $00, $0F, $80, $01, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, 
    $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $FF, $FF, $00, $00
    
  );
  DX9VS2BIN_3Light: array [0..2463] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $8E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0F, $02, $00, $00, $00, $03, $FE, $FF, $0A, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $08, $02, $00, $00, 
    $E4, $00, $00, $00, $02, $00, $13, $00, $15, $00, $4E, $00, $70, $01, $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $9C, $01, $00, $00, $02, $00, $10, $00, $01, $00, $42, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $AC, $01, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $BB, $01, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $CC, $01, $00, $00, $02, $00, $12, $00, $01, $00, $4A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $01, $00, $00, $02, $00, $0F, $00, $01, $00, $3E, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $EA, $01, $00, $00, $02, $00, $04, $00, $04, $00, $12, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $F4, $01, $00, $00, $02, $00, $08, $00, $03, $00, $22, $00, $8C, $01, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $4C, $69, $67, $68, $74, $73, $00, $4F, $70, $74, $73, $00, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $41, $74, $74, $6E, $00, $50, $6F, $73, $00, $44, $69, $72, 
    $00, $44, $69, $66, $66, $75, $73, $65, $43, $6F, $6C, $6F, $72, $00, $53, $70, $65, $63, $75, $6C, $61, $72, $43, $6F, $6C, $6F, $72, $00, $41, $6D, $62, $69, $65, $6E, $74, $43, $6F, $6C, $6F, $72, 
    $00, $AB, $AB, $AB, $EB, $00, $00, $00, $F0, $00, $00, $00, $00, $01, $00, $00, $F0, $00, $00, $00, $05, $01, $00, $00, $F0, $00, $00, $00, $09, $01, $00, $00, $F0, $00, $00, $00, $0D, $01, $00, $00, 
    $F0, $00, $00, $00, $1A, $01, $00, $00, $F0, $00, $00, $00, $28, $01, $00, $00, $F0, $00, $00, $00, $05, $00, $00, $00, $01, $00, $1C, $00, $03, $00, $07, $00, $38, $01, $00, $00, $4D, $56, $50, $4D, 
    $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $41, $6D, $62, $69, $65, $6E, $74, $00, 
    $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, $73, $65, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, 
    $4F, $70, $74, $73, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $53, $70, $65, $63, $75, $6C, $61, $72, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, $77, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, 
    $77, $49, $54, $00, $6F, $70, $74, $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, 
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $0B, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $E0, $40, 
    $51, $00, $00, $05, $0D, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $30, $00, $00, $05, $00, $00, $0F, $F0, $03, $00, $00, $00, $00, $00, $00, $00, 
    $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $03, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, 
    $02, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $03, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, 
    $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $03, $E0, $01, $00, $00, $02, $02, $00, $03, $E0, $03, $00, $E4, $90, $23, $00, $00, $02, $00, $00, $01, $80, $0C, $00, $00, $A0, $29, $00, $03, $02, 
    $00, $00, $00, $81, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $01, $80, $0B, $00, $00, $A0, $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, 
    $00, $00, $01, $80, $00, $00, $00, $8C, $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, $02, $00, $E4, $90, $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $E0, 
    $00, $00, $00, $80, $01, $00, $E4, $80, $0E, $00, $E4, $A0, $2A, $00, $00, $00, $05, $00, $00, $03, $00, $00, $07, $80, $05, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, 
    $04, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, $06, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $07, $80, 
    $00, $00, $E4, $80, $07, $00, $E4, $A0, $08, $00, $00, $03, $00, $00, $08, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $05, $00, $00, $03, 
    $01, $00, $07, $80, $09, $00, $E4, $A0, $01, $00, $55, $90, $04, $00, $00, $04, $01, $00, $07, $80, $08, $00, $E4, $A0, $01, $00, $00, $90, $01, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $07, $80, 
    $0A, $00, $E4, $A0, $01, $00, $AA, $90, $01, $00, $E4, $80, $24, $00, $00, $02, $02, $00, $07, $80, $01, $00, $E4, $80, $05, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $80, 
    $01, $00, $00, $02, $03, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $04, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $05, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, 
    $01, $00, $08, $80, $0B, $00, $AA, $A0, $26, $00, $00, $01, $00, $00, $E4, $F0, $05, $00, $00, $03, $02, $00, $08, $80, $01, $00, $FF, $80, $0B, $00, $FF, $A0, $2E, $00, $00, $02, $00, $00, $01, $B0, 
    $02, $00, $FF, $80, $02, $00, $00, $04, $05, $00, $0F, $80, $05, $00, $E4, $80, $19, $20, $E4, $A0, $00, $00, $00, $B0, $23, $00, $00, $03, $02, $00, $08, $80, $13, $20, $55, $A0, $00, $00, $00, $B0, 
    $29, $00, $03, $02, $02, $00, $FF, $81, $02, $00, $FF, $80, $08, $00, $00, $04, $02, $00, $08, $80, $02, $00, $E4, $81, $16, $20, $E4, $A0, $00, $00, $00, $B0, $0B, $00, $00, $03, $02, $00, $08, $80, 
    $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $04, $00, $00, $05, $06, $00, $0E, $80, $00, $00, $90, $80, $00, $00, $FF, $81, 
    $16, $20, $90, $A0, $00, $00, $00, $B0, $24, $00, $00, $02, $07, $00, $07, $80, $06, $00, $F9, $80, $08, $00, $00, $03, $06, $00, $02, $80, $02, $00, $E4, $81, $07, $00, $E4, $80, $0B, $00, $00, $03, 
    $06, $00, $02, $80, $06, $00, $55, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $07, $00, $01, $80, $06, $00, $55, $80, $12, $00, $00, $A0, $05, $00, $00, $04, $07, $00, $0F, $80, $07, $00, $00, $80, 
    $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $04, $00, $00, $05, $03, $00, $0F, $80, $02, $00, $FF, $80, 
    $17, $20, $E4, $A0, $00, $00, $00, $B0, $03, $00, $E4, $80, $2B, $00, $00, $00, $01, $00, $00, $03, $06, $00, $02, $80, $13, $20, $55, $A0, $00, $00, $00, $B0, $02, $00, $00, $03, $06, $00, $03, $80, 
    $06, $00, $55, $80, $0D, $00, $E4, $A0, $29, $00, $03, $02, $06, $00, $00, $8C, $06, $00, $00, $8B, $02, $00, $00, $04, $06, $00, $0D, $80, $00, $00, $94, $80, $15, $20, $94, $A1, $00, $00, $00, $B0, 
    $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $F8, $80, $06, $00, $F8, $80, $07, $00, $00, $02, $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $F8, $80, 
    $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, $07, $00, $01, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, 
    $07, $00, $01, $80, $07, $00, $00, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $08, $00, $01, $80, $07, $00, $00, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $07, $00, $01, $80, $02, $00, $FF, $80, 
    $05, $00, $00, $03, $07, $00, $02, $80, $07, $00, $00, $80, $07, $00, $00, $80, $04, $00, $00, $06, $07, $00, $01, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $14, $20, $00, $A0, 
    $00, $00, $00, $B0, $04, $00, $00, $05, $07, $00, $01, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $06, $00, $00, $02, $07, $00, $01, $80, $07, $00, $00, $80, 
    $05, $00, $00, $03, $06, $00, $0D, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $80, $06, $00, $F8, $81, $0B, $00, $00, $03, $02, $00, $08, $80, 
    $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $08, $00, $0F, $80, $08, $00, $00, $80, $18, $20, $E4, $A0, 
    $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $08, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, $08, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, 
    $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $08, $00, $E4, $80, $07, $00, $00, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $29, $00, $03, $02, $06, $00, $55, $8C, $06, $00, $55, $8B, 
    $02, $00, $00, $04, $06, $00, $07, $80, $00, $00, $E4, $80, $15, $20, $E4, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $E4, $80, $06, $00, $E4, $80, $07, $00, $00, $02, 
    $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, 
    $08, $00, $00, $03, $06, $00, $08, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $06, $00, $08, $80, $06, $00, $FF, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $07, $00, $01, $80, 
    $06, $00, $FF, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $06, $00, $08, $80, $02, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $02, $80, $06, $00, $FF, $80, $06, $00, $FF, $80, $04, $00, $00, $06, 
    $06, $00, $08, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, $04, $00, $00, $05, $06, $00, $08, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, 
    $00, $00, $00, $B0, $06, $00, $FF, $80, $06, $00, $00, $02, $06, $00, $08, $80, $06, $00, $FF, $80, $05, $00, $00, $03, $06, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, 
    $02, $00, $08, $80, $02, $00, $E4, $80, $06, $00, $E4, $81, $08, $00, $00, $04, $06, $00, $01, $80, $06, $00, $E4, $80, $16, $20, $E4, $A0, $00, $00, $00, $B0, $20, $00, $00, $04, $07, $00, $02, $80, 
    $06, $00, $00, $80, $13, $20, $FF, $A0, $00, $00, $00, $B0, $0C, $00, $00, $04, $06, $00, $01, $80, $13, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, 
    $07, $00, $55, $80, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $06, $00, $FF, $80, $06, $00, $00, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, 
    $0C, $00, $00, $03, $06, $00, $02, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $07, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, 
    $04, $00, $0F, $80, $06, $00, $55, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, 
    $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $00, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $02, $00, $00, $03, $01, $00, $08, $80, $01, $00, $FF, $80, $0B, $00, $00, $A1, $27, $00, $00, $00, 
    $05, $00, $00, $03, $00, $00, $0F, $80, $03, $00, $E4, $80, $0E, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, $05, $00, $E4, $80, $10, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, 
    $00, $00, $0F, $80, $04, $00, $E4, $80, $0F, $00, $E4, $A0, $00, $00, $E4, $80, $01, $00, $00, $02, $01, $00, $05, $80, $0B, $00, $E4, $A0, $04, $00, $00, $04, $01, $00, $0F, $80, $11, $00, $24, $A0, 
    $01, $00, $80, $8B, $01, $00, $2A, $8B, $02, $00, $00, $03, $01, $00, $0F, $E0, $00, $00, $E4, $80, $01, $00, $E4, $80, $2B, $00, $00, $00, $05, $00, $00, $03, $00, $00, $0F, $80, $01, $00, $E4, $A0, 
    $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $E4, $A0, $00, $00, $AA, $90, 
    $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $FF, $FF, $00, $00
  );
  DX9VS2BIN_4Light: array [0..2483] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $8E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0F, $02, $00, $00, $00, $03, $FE, $FF, $0A, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $08, $02, $00, $00, 
    $E4, $00, $00, $00, $02, $00, $13, $00, $1C, $00, $4E, $00, $70, $01, $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $9C, $01, $00, $00, $02, $00, $10, $00, $01, $00, $42, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $AC, $01, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $BB, $01, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $CC, $01, $00, $00, $02, $00, $12, $00, $01, $00, $4A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $01, $00, $00, $02, $00, $0F, $00, $01, $00, $3E, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $EA, $01, $00, $00, $02, $00, $04, $00, $04, $00, $12, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $F4, $01, $00, $00, $02, $00, $08, $00, $03, $00, $22, $00, $8C, $01, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $4C, $69, $67, $68, $74, $73, $00, $4F, $70, $74, $73, $00, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $41, $74, $74, $6E, $00, $50, $6F, $73, $00, $44, $69, $72, 
    $00, $44, $69, $66, $66, $75, $73, $65, $43, $6F, $6C, $6F, $72, $00, $53, $70, $65, $63, $75, $6C, $61, $72, $43, $6F, $6C, $6F, $72, $00, $41, $6D, $62, $69, $65, $6E, $74, $43, $6F, $6C, $6F, $72, 
    $00, $AB, $AB, $AB, $EB, $00, $00, $00, $F0, $00, $00, $00, $00, $01, $00, $00, $F0, $00, $00, $00, $05, $01, $00, $00, $F0, $00, $00, $00, $09, $01, $00, $00, $F0, $00, $00, $00, $0D, $01, $00, $00, 
    $F0, $00, $00, $00, $1A, $01, $00, $00, $F0, $00, $00, $00, $28, $01, $00, $00, $F0, $00, $00, $00, $05, $00, $00, $00, $01, $00, $1C, $00, $04, $00, $07, $00, $38, $01, $00, $00, $4D, $56, $50, $4D, 
    $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $41, $6D, $62, $69, $65, $6E, $74, $00, 
    $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, $73, $65, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, 
    $4F, $70, $74, $73, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $53, $70, $65, $63, $75, $6C, $61, $72, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, $77, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, 
    $77, $49, $54, $00, $6F, $70, $74, $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, 
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $0B, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $E0, $40, 
    $51, $00, $00, $05, $0D, $00, $0F, $A0, $00, $00, $00, $C0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00, $30, $00, $00, $05, $00, $00, $0F, $F0, $04, $00, $00, $00, $00, $00, $00, $00, 
    $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $03, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, 
    $02, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $03, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, 
    $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $03, $E0, $05, $00, $00, $03, $00, $00, $0F, $80, $01, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, 
    $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $02, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, 
    $03, $00, $E4, $A0, $23, $00, $00, $02, $00, $00, $01, $80, $0C, $00, $00, $A0, $29, $00, $03, $02, $00, $00, $00, $81, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $01, $80, $0B, $00, $00, $A0, 
    $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $8C, $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, 
    $02, $00, $E4, $90, $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $E0, $00, $00, $00, $80, $01, $00, $E4, $80, $0E, $00, $E4, $A0, $2A, $00, $00, $00, $05, $00, $00, $03, 
    $00, $00, $07, $80, $05, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, $04, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, 
    $06, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $07, $80, $00, $00, $E4, $80, $07, $00, $E4, $A0, $08, $00, $00, $03, $00, $00, $08, $80, $00, $00, $E4, $80, 
    $00, $00, $E4, $80, $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $05, $00, $00, $03, $01, $00, $07, $80, $09, $00, $E4, $A0, $01, $00, $55, $90, $04, $00, $00, $04, $01, $00, $07, $80, 
    $08, $00, $E4, $A0, $01, $00, $00, $90, $01, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $07, $80, $0A, $00, $E4, $A0, $01, $00, $AA, $90, $01, $00, $E4, $80, $24, $00, $00, $02, $02, $00, $07, $80, 
    $01, $00, $E4, $80, $05, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $80, $01, $00, $00, $02, $03, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $04, $00, $0F, $80, 
    $0B, $00, $AA, $A0, $01, $00, $00, $02, $05, $00, $0F, $80, $0B, $00, $AA, $A0, $01, $00, $00, $02, $01, $00, $08, $80, $0B, $00, $AA, $A0, $26, $00, $00, $01, $00, $00, $E4, $F0, $05, $00, $00, $03, 
    $02, $00, $08, $80, $01, $00, $FF, $80, $0B, $00, $FF, $A0, $2E, $00, $00, $02, $00, $00, $01, $B0, $02, $00, $FF, $80, $02, $00, $00, $04, $05, $00, $0F, $80, $05, $00, $E4, $80, $19, $20, $E4, $A0, 
    $00, $00, $00, $B0, $01, $00, $00, $03, $06, $00, $02, $80, $13, $20, $55, $A0, $00, $00, $00, $B0, $02, $00, $00, $03, $06, $00, $03, $80, $06, $00, $55, $80, $0D, $00, $E4, $A0, $29, $00, $03, $02, 
    $06, $00, $00, $8C, $06, $00, $00, $8B, $02, $00, $00, $04, $06, $00, $0D, $80, $00, $00, $94, $80, $15, $20, $94, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $F8, $80, 
    $06, $00, $F8, $80, $07, $00, $00, $02, $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $F8, $80, $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, 
    $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, $07, $00, $01, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $07, $00, $01, $80, $07, $00, $00, $80, $0B, $00, $AA, $A0, 
    $20, $00, $00, $03, $08, $00, $01, $80, $07, $00, $00, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $07, $00, $01, $80, $02, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $02, $80, $07, $00, $00, $80, 
    $07, $00, $00, $80, $04, $00, $00, $06, $07, $00, $01, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, $04, $00, $00, $05, $07, $00, $01, $80, 
    $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $06, $00, $00, $02, $07, $00, $01, $80, $07, $00, $00, $80, $05, $00, $00, $03, $06, $00, $0D, $80, $06, $00, $E4, $80, 
    $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $80, $06, $00, $F8, $81, $08, $00, $00, $04, $06, $00, $01, $80, $06, $00, $F8, $80, $16, $20, $E4, $A0, $00, $00, $00, $B0, 
    $20, $00, $00, $04, $07, $00, $02, $80, $06, $00, $00, $80, $13, $20, $FF, $A0, $00, $00, $00, $B0, $0C, $00, $00, $04, $06, $00, $01, $80, $13, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $00, $80, 
    $05, $00, $00, $03, $06, $00, $01, $80, $07, $00, $55, $80, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $07, $00, $00, $80, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $04, $80, 
    $08, $00, $00, $80, $06, $00, $00, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $08, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, 
    $05, $00, $00, $04, $07, $00, $0F, $80, $06, $00, $AA, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $FF, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, 
    $05, $00, $00, $04, $07, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $00, $80, $03, $00, $E4, $80, 
    $2B, $00, $00, $00, $29, $00, $03, $02, $06, $00, $55, $8C, $06, $00, $55, $8B, $02, $00, $00, $04, $06, $00, $07, $80, $00, $00, $E4, $80, $15, $20, $E4, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, 
    $02, $00, $08, $80, $06, $00, $E4, $80, $06, $00, $E4, $80, $07, $00, $00, $02, $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $81, 
    $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, $06, $00, $08, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $06, $00, $08, $80, 
    $06, $00, $FF, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $07, $00, $01, $80, $06, $00, $FF, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $06, $00, $08, $80, $02, $00, $FF, $80, $05, $00, $00, $03, 
    $07, $00, $02, $80, $06, $00, $FF, $80, $06, $00, $FF, $80, $04, $00, $00, $06, $06, $00, $08, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, 
    $04, $00, $00, $05, $06, $00, $08, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $06, $00, $00, $02, $06, $00, $08, $80, $06, $00, $FF, $80, $05, $00, $00, $03, 
    $07, $00, $01, $80, $07, $00, $00, $80, $06, $00, $FF, $80, $05, $00, $00, $03, $06, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $80, 
    $06, $00, $E4, $81, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, 
    $07, $00, $0F, $80, $07, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, 
    $07, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $FF, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, 
    $23, $00, $00, $03, $02, $00, $08, $80, $13, $20, $55, $A0, $00, $00, $00, $B0, $29, $00, $03, $02, $02, $00, $FF, $81, $02, $00, $FF, $80, $04, $00, $00, $05, $06, $00, $07, $80, $00, $00, $E4, $80, 
    $00, $00, $FF, $81, $16, $20, $E4, $A0, $00, $00, $00, $B0, $24, $00, $00, $02, $07, $00, $07, $80, $06, $00, $E4, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $81, $07, $00, $E4, $80, 
    $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $20, $00, $00, $03, $06, $00, $01, $80, $02, $00, $FF, $80, $12, $00, $00, $A0, $08, $00, $00, $04, $02, $00, $08, $80, 
    $02, $00, $E4, $81, $16, $20, $E4, $A0, $00, $00, $00, $B0, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0B, $00, $AA, $A0, $04, $00, $00, $05, $03, $00, $0F, $80, $17, $20, $E4, $A0, 
    $00, $00, $00, $B0, $02, $00, $FF, $80, $03, $00, $E4, $80, $0C, $00, $00, $03, $02, $00, $08, $80, $0B, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $06, $00, $0F, $80, $06, $00, $00, $80, 
    $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $02, $00, $FF, $80, $06, $00, $E4, $80, $04, $00, $E4, $80, $2B, $00, $00, $00, $02, $00, $00, $03, $01, $00, $08, $80, 
    $01, $00, $FF, $80, $0B, $00, $00, $A1, $27, $00, $00, $00, $01, $00, $00, $02, $00, $00, $05, $80, $0B, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, $11, $00, $24, $A0, $00, $00, $80, $8B, 
    $00, $00, $2A, $8B, $04, $00, $00, $04, $00, $00, $0F, $80, $05, $00, $E4, $80, $10, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $03, $00, $E4, $80, $0E, $00, $E4, $A0, 
    $00, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $1F, $E0, $04, $00, $E4, $80, $0F, $00, $E4, $A0, $00, $00, $E4, $80, $2B, $00, $00, $00, $01, $00, $00, $02, $02, $00, $03, $E0, $03, $00, $E4, $90, 
    $FF, $FF, $00, $00
  );
  DX9VS2BIN_Full: array [0..2515] of byte = (
    $00, $03, $FE, $FF, $FE, $FF, $8E, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $0F, $02, $00, $00, $00, $03, $FE, $FF, $0A, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $08, $02, $00, $00, 
    $E4, $00, $00, $00, $02, $00, $13, $00, $38, $00, $4E, $00, $70, $01, $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $00, $04, $00, $02, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $9C, $01, $00, $00, $02, $00, $10, $00, $01, $00, $42, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $AC, $01, $00, $00, $02, $00, $0E, $00, $01, $00, $3A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $BB, $01, $00, $00, $02, $00, $11, $00, $01, $00, $46, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $CC, $01, $00, $00, $02, $00, $12, $00, $01, $00, $4A, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $D9, $01, $00, $00, $02, $00, $0F, $00, $01, $00, $3E, $00, $F0, $00, $00, $00, $00, $00, $00, $00, $EA, $01, $00, $00, $02, $00, $04, $00, $04, $00, $12, $00, $8C, $01, $00, $00, $00, $00, $00, $00, 
    $F4, $01, $00, $00, $02, $00, $08, $00, $03, $00, $22, $00, $8C, $01, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $02, $00, $0C, $00, $01, $00, $32, $00, $F0, $00, $00, $00, $00, $00, $00, $00, 
    $4C, $69, $67, $68, $74, $73, $00, $4F, $70, $74, $73, $00, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $41, $74, $74, $6E, $00, $50, $6F, $73, $00, $44, $69, $72, 
    $00, $44, $69, $66, $66, $75, $73, $65, $43, $6F, $6C, $6F, $72, $00, $53, $70, $65, $63, $75, $6C, $61, $72, $43, $6F, $6C, $6F, $72, $00, $41, $6D, $62, $69, $65, $6E, $74, $43, $6F, $6C, $6F, $72, 
    $00, $AB, $AB, $AB, $EB, $00, $00, $00, $F0, $00, $00, $00, $00, $01, $00, $00, $F0, $00, $00, $00, $05, $01, $00, $00, $F0, $00, $00, $00, $09, $01, $00, $00, $F0, $00, $00, $00, $0D, $01, $00, $00, 
    $F0, $00, $00, $00, $1A, $01, $00, $00, $F0, $00, $00, $00, $28, $01, $00, $00, $F0, $00, $00, $00, $05, $00, $00, $00, $01, $00, $1C, $00, $08, $00, $07, $00, $38, $01, $00, $00, $4D, $56, $50, $4D, 
    $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $41, $6D, $62, $69, $65, $6E, $74, $00, 
    $4D, $61, $74, $65, $72, $69, $61, $6C, $44, $69, $66, $75, $73, $65, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $45, $6D, $69, $73, $73, $69, $6F, $6E, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, 
    $4F, $70, $74, $73, $00, $4D, $61, $74, $65, $72, $69, $61, $6C, $53, $70, $65, $63, $75, $6C, $61, $72, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, $77, $00, $4D, $6F, $64, $65, $6C, $56, $69, $65, 
    $77, $49, $54, $00, $6F, $70, $74, $69, $6F, $6E, $73, $00, $76, $73, $5F, $33, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, 
    $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $0B, $00, $0F, $A0, $00, $00, $00, $C0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00, 
    $51, $00, $00, $05, $0D, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $E0, $40, $30, $00, $00, $05, $00, $00, $0F, $F0, $08, $00, $00, $00, $00, $00, $00, $00, 
    $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $03, $00, $00, $80, $01, $00, $0F, $90, $1F, $00, $00, $02, $0A, $00, $00, $80, 
    $02, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $03, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $E0, $1F, $00, $00, $02, $0A, $00, $00, $80, $01, $00, $0F, $E0, 
    $1F, $00, $00, $02, $05, $00, $00, $80, $02, $00, $03, $E0, $01, $00, $00, $02, $02, $00, $03, $E0, $03, $00, $E4, $90, $23, $00, $00, $02, $00, $00, $01, $80, $0C, $00, $00, $A0, $29, $00, $03, $02, 
    $00, $00, $00, $81, $00, $00, $00, $80, $01, $00, $00, $02, $00, $00, $01, $80, $0D, $00, $00, $A0, $02, $00, $00, $03, $00, $00, $01, $80, $00, $00, $00, $80, $0C, $00, $55, $A0, $0D, $00, $00, $03, 
    $00, $00, $01, $80, $00, $00, $00, $8C, $00, $00, $00, $8B, $04, $00, $00, $04, $01, $00, $0F, $80, $02, $00, $E4, $90, $0E, $00, $E4, $A0, $0E, $00, $E4, $A1, $04, $00, $00, $04, $01, $00, $0F, $E0, 
    $00, $00, $00, $80, $01, $00, $E4, $80, $0E, $00, $E4, $A0, $2A, $00, $00, $00, $05, $00, $00, $03, $00, $00, $07, $80, $05, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $07, $80, 
    $04, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $07, $80, $06, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $07, $80, 
    $00, $00, $E4, $80, $07, $00, $E4, $A0, $08, $00, $00, $03, $00, $00, $08, $80, $00, $00, $E4, $80, $00, $00, $E4, $80, $07, $00, $00, $02, $00, $00, $08, $80, $00, $00, $FF, $80, $05, $00, $00, $03, 
    $01, $00, $07, $80, $09, $00, $E4, $A0, $01, $00, $55, $90, $04, $00, $00, $04, $01, $00, $07, $80, $08, $00, $E4, $A0, $01, $00, $00, $90, $01, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $07, $80, 
    $0A, $00, $E4, $A0, $01, $00, $AA, $90, $01, $00, $E4, $80, $24, $00, $00, $02, $02, $00, $07, $80, $01, $00, $E4, $80, $05, $00, $00, $03, $01, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $80, 
    $01, $00, $00, $02, $03, $00, $0F, $80, $0D, $00, $AA, $A0, $01, $00, $00, $02, $04, $00, $0F, $80, $0D, $00, $AA, $A0, $01, $00, $00, $02, $05, $00, $0F, $80, $0D, $00, $AA, $A0, $01, $00, $00, $02, 
    $01, $00, $08, $80, $0D, $00, $AA, $A0, $26, $00, $00, $01, $00, $00, $E4, $F0, $05, $00, $00, $03, $02, $00, $08, $80, $01, $00, $FF, $80, $0D, $00, $FF, $A0, $2E, $00, $00, $02, $00, $00, $01, $B0, 
    $02, $00, $FF, $80, $01, $00, $00, $02, $06, $00, $04, $80, $0D, $00, $AA, $A0, $29, $00, $04, $03, $06, $00, $AA, $80, $13, $20, $00, $A0, $00, $00, $00, $B0, $01, $00, $00, $03, $06, $00, $02, $80, 
    $13, $20, $55, $A0, $00, $00, $00, $B0, $02, $00, $00, $03, $06, $00, $03, $80, $06, $00, $55, $80, $0B, $00, $E4, $A0, $29, $00, $03, $02, $06, $00, $00, $8C, $06, $00, $00, $8B, $02, $00, $00, $04, 
    $06, $00, $0D, $80, $00, $00, $94, $80, $15, $20, $94, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $F8, $80, $06, $00, $F8, $80, $07, $00, $00, $02, $02, $00, $08, $80, 
    $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $F8, $80, $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, $07, $00, $E4, $80, $08, $00, $00, $03, 
    $07, $00, $01, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $07, $00, $01, $80, $07, $00, $00, $80, $0D, $00, $AA, $A0, $20, $00, $00, $03, $08, $00, $01, $80, $07, $00, $00, $80, 
    $12, $00, $00, $A0, $06, $00, $00, $02, $07, $00, $01, $80, $02, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $02, $80, $07, $00, $00, $80, $07, $00, $00, $80, $04, $00, $00, $06, $07, $00, $01, $80, 
    $14, $20, $55, $A0, $00, $00, $00, $B0, $07, $00, $00, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, $04, $00, $00, $05, $07, $00, $01, $80, $07, $00, $55, $80, $14, $20, $AA, $A0, $00, $00, $00, $B0, 
    $07, $00, $00, $80, $06, $00, $00, $02, $07, $00, $01, $80, $07, $00, $00, $80, $05, $00, $00, $03, $06, $00, $0D, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, 
    $02, $00, $E4, $80, $06, $00, $F8, $81, $08, $00, $00, $04, $06, $00, $01, $80, $06, $00, $F8, $80, $16, $20, $E4, $A0, $00, $00, $00, $B0, $20, $00, $00, $04, $07, $00, $02, $80, $06, $00, $00, $80, 
    $13, $20, $FF, $A0, $00, $00, $00, $B0, $0C, $00, $00, $04, $06, $00, $01, $80, $13, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $07, $00, $55, $80, 
    $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $01, $80, $07, $00, $00, $80, $06, $00, $00, $80, $05, $00, $00, $03, $06, $00, $04, $80, $08, $00, $00, $80, $06, $00, $00, $80, $0B, $00, $00, $03, 
    $02, $00, $08, $80, $02, $00, $FF, $80, $0D, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $08, $80, $0D, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $06, $00, $AA, $80, 
    $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $FF, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $02, $00, $FF, $80, 
    $17, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $00, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $29, $00, $03, $02, $06, $00, $55, $8C, 
    $06, $00, $55, $8B, $02, $00, $00, $04, $06, $00, $07, $80, $00, $00, $E4, $80, $15, $20, $E4, $A1, $00, $00, $00, $B0, $08, $00, $00, $03, $02, $00, $08, $80, $06, $00, $E4, $80, $06, $00, $E4, $80, 
    $07, $00, $00, $02, $02, $00, $08, $80, $02, $00, $FF, $80, $04, $00, $00, $04, $07, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $81, $01, $00, $E4, $81, $24, $00, $00, $02, $08, $00, $07, $80, 
    $07, $00, $E4, $80, $08, $00, $00, $03, $06, $00, $08, $80, $02, $00, $E4, $80, $08, $00, $E4, $80, $0B, $00, $00, $03, $06, $00, $08, $80, $06, $00, $FF, $80, $0D, $00, $AA, $A0, $20, $00, $00, $03, 
    $07, $00, $01, $80, $06, $00, $FF, $80, $12, $00, $00, $A0, $06, $00, $00, $02, $06, $00, $08, $80, $02, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $02, $80, $06, $00, $FF, $80, $06, $00, $FF, $80, 
    $04, $00, $00, $06, $06, $00, $08, $80, $14, $20, $55, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $14, $20, $00, $A0, $00, $00, $00, $B0, $04, $00, $00, $05, $06, $00, $08, $80, $07, $00, $55, $80, 
    $14, $20, $AA, $A0, $00, $00, $00, $B0, $06, $00, $FF, $80, $06, $00, $00, $02, $06, $00, $08, $80, $06, $00, $FF, $80, $05, $00, $00, $03, $07, $00, $01, $80, $07, $00, $00, $80, $06, $00, $FF, $80, 
    $05, $00, $00, $03, $06, $00, $07, $80, $06, $00, $E4, $80, $02, $00, $FF, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $80, $06, $00, $E4, $81, $0B, $00, $00, $03, $02, $00, $08, $80, 
    $02, $00, $FF, $80, $0D, $00, $AA, $A0, $0C, $00, $00, $03, $06, $00, $01, $80, $0D, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $07, $00, $00, $80, $18, $20, $E4, $A0, 
    $00, $00, $00, $B0, $04, $00, $00, $04, $04, $00, $0F, $80, $06, $00, $00, $80, $07, $00, $E4, $80, $04, $00, $E4, $80, $05, $00, $00, $04, $07, $00, $0F, $80, $02, $00, $FF, $80, $17, $20, $E4, $A0, 
    $00, $00, $00, $B0, $04, $00, $00, $04, $03, $00, $0F, $80, $07, $00, $E4, $80, $06, $00, $FF, $80, $03, $00, $E4, $80, $2B, $00, $00, $00, $23, $00, $00, $03, $02, $00, $08, $80, $13, $20, $55, $A0, 
    $00, $00, $00, $B0, $29, $00, $03, $02, $02, $00, $FF, $81, $02, $00, $FF, $80, $04, $00, $00, $05, $06, $00, $07, $80, $00, $00, $E4, $80, $00, $00, $FF, $81, $16, $20, $E4, $A0, $00, $00, $00, $B0, 
    $24, $00, $00, $02, $07, $00, $07, $80, $06, $00, $E4, $80, $08, $00, $00, $03, $02, $00, $08, $80, $02, $00, $E4, $81, $07, $00, $E4, $80, $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, 
    $0D, $00, $AA, $A0, $20, $00, $00, $03, $06, $00, $01, $80, $02, $00, $FF, $80, $12, $00, $00, $A0, $08, $00, $00, $04, $02, $00, $08, $80, $02, $00, $E4, $81, $16, $20, $E4, $A0, $00, $00, $00, $B0, 
    $0B, $00, $00, $03, $02, $00, $08, $80, $02, $00, $FF, $80, $0D, $00, $AA, $A0, $04, $00, $00, $05, $03, $00, $0F, $80, $17, $20, $E4, $A0, $00, $00, $00, $B0, $02, $00, $FF, $80, $03, $00, $E4, $80, 
    $0C, $00, $00, $03, $02, $00, $08, $80, $0D, $00, $AA, $A0, $02, $00, $FF, $80, $05, $00, $00, $04, $06, $00, $0F, $80, $06, $00, $00, $80, $18, $20, $E4, $A0, $00, $00, $00, $B0, $04, $00, $00, $04, 
    $04, $00, $0F, $80, $02, $00, $FF, $80, $06, $00, $E4, $80, $04, $00, $E4, $80, $2B, $00, $00, $00, $02, $00, $00, $04, $05, $00, $0F, $80, $05, $00, $E4, $80, $19, $20, $E4, $A0, $00, $00, $00, $B0, 
    $2B, $00, $00, $00, $02, $00, $00, $03, $01, $00, $08, $80, $01, $00, $FF, $80, $0D, $00, $00, $A1, $27, $00, $00, $00, $01, $00, $00, $02, $00, $00, $05, $80, $0D, $00, $E4, $A0, $04, $00, $00, $04, 
    $00, $00, $0F, $80, $11, $00, $24, $A0, $00, $00, $80, $8B, $00, $00, $2A, $8B, $04, $00, $00, $04, $00, $00, $0F, $80, $05, $00, $E4, $80, $10, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, 
    $00, $00, $0F, $80, $03, $00, $E4, $80, $0E, $00, $E4, $A0, $00, $00, $E4, $80, $04, $00, $00, $04, $01, $00, $0F, $E0, $04, $00, $E4, $80, $0F, $00, $E4, $A0, $00, $00, $E4, $80, $2B, $00, $00, $00, 
    $05, $00, $00, $03, $00, $00, $0F, $80, $01, $00, $E4, $A0, $00, $00, $55, $90, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, 
    $00, $00, $0F, $80, $02, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $E0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $FF, $FF, $00, $00
  );
  ARBVP1_NoLight: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[20] = { program.local[0..18],'#13+
    '		{ 0, 1 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R0.x, c[19].y;'#13+
    'ADD R0.x, -R0, c[12].y;'#13+
    'ABS R0.x, R0;'#13+
    'SGE R1.x, c[19], R0;'#13+
    'ABS R1.y, R1.x;'#13+
    'ABS R1.x, c[12];'#13+
    'MUL R0, vertex.color, c[14];'#13+
    'SGE R2.x, c[19], R1;'#13+
    'SGE R1.y, c[19].x, R1;'#13+
    'MUL R2.y, R2.x, R1;'#13+
    'ADD R1, -R0, c[14];'#13+
    'MAD R1, R1, R2.y, R0;'#13+
    'ABS R0.w, R2.x;'#13+
    'SGE R2.x, c[19], R0.w;'#13+
    'MOV R0.xyz, c[17];'#13+
    'MOV R0.w, c[19].y;'#13+
    'ADD R0, R0, -R1;'#13+
    'MAD result.color, R0, R2.x, R1;'#13+
    'MOV R0.w, c[19].y;'#13+
    'MOV R0.xyz, vertex.position;'#13+
    'DP4 result.position.w, R0, c[3];'#13+
    'DP4 result.position.z, R0, c[2];'#13+
    'DP4 result.position.y, R0, c[1];'#13+
    'DP4 result.position.x, R0, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  ARBVP1_1Light: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[27] = { program.local[0..25],'#13+
    '		{ 0, 1, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'TEMP R4;'#13+
    'TEMP R5;'#13+
    'TEMP R6;'#13+
    'MOV R0.w, c[26].y;'#13+
    'MOV R0.xyz, vertex.position;'#13+
    'MOV R3.xyz, vertex.normal;'#13+
    'MOV R3.w, c[26].x;'#13+
    'DP4 R5.z, R3, c[10];'#13+
    'DP4 R5.x, R3, c[8];'#13+
    'DP4 R5.y, R3, c[9];'#13+
    'DP3 R3.x, R5, R5;'#13+
    'DP4 R1.z, R0, c[6];'#13+
    'DP4 R1.x, R0, c[4];'#13+
    'DP4 R1.y, R0, c[5];'#13+
    'ADD R2.xyz, R1, -c[21];'#13+
    'DP3 R1.w, R2, R2;'#13+
    'RSQ R2.w, R1.w;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'MUL R2.xyz, R2.w, R2;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MAD R4.xyz, -R1.w, R1, -R2;'#13+
    'DP3 R4.w, R4, R4;'#13+
    'RSQ R3.w, R3.x;'#13+
    'RSQ R3.y, R4.w;'#13+
    'MUL R3.xyz, R3.y, R4;'#13+
    'MUL R4.xyz, R3.w, R5;'#13+
    'DP3 R3.x, R4, R3;'#13+
    'DP3 R3.y, R4, -R2;'#13+
    'MAX R6.z, R3.y, c[26].x;'#13+
    'DP3 R3.y, R2, c[22];'#13+
    'RCP R2.x, R2.w;'#13+
    'MAX R3.x, R3, c[26];'#13+
    'MOV R5.xy, c[26].yzzw;'#13+
    'POW R3.x, R3.x, c[18].x;'#13+
    'SLT R2.w, c[19].z, R3.y;'#13+
    'MAD R2.z, R2.x, c[20].y, c[20].x;'#13+
    'MUL R2.y, R2.x, c[20].z;'#13+
    'MAD R2.x, R2.y, R2, R2.z;'#13+
    'RCP R5.w, R2.x;'#13+
    'ABS R2.y, R2.w;'#13+
    'POW R2.z, R3.y, c[19].w;'#13+
    'SGE R3.y, c[26].x, R2;'#13+
    'ABS R2.y, c[12].x;'#13+
    'SGE R4.w, c[26].x, R2.y;'#13+
    'ABS R2.y, R4.w;'#13+
    'ADD R2.w, -R5.y, c[19].y;'#13+
    'ABS R2.w, R2;'#13+
    'SGE R6.x, c[26], R2.y;'#13+
    'SGE R2.w, c[26].x, R2;'#13+
    'MUL R5.y, R6.x, R2.w;'#13+
    'MUL R2.y, R5, R3;'#13+
    'SLT R3.w, c[26].x, R6.z;'#13+
    'MAD R2.y, -R2.z, R2, R2.z;'#13+
    'MUL R5.z, R5.w, R2.y;'#13+
    'MUL R2.x, R3, R5.z;'#13+
    'MUL R3.y, R3.w, R5;'#13+
    'MUL R2, R2.x, c[24];'#13+
    'MUL R2, R2, R3.y;'#13+
    'MUL R6.y, R3.x, R5.w;'#13+
    'MAD R3.xyz, -R1.w, R1, c[22];'#13+
    'MUL R1, R6.y, c[24];'#13+
    'DP3 R6.w, R3, R3;'#13+
    'ADD R6.y, -R5.x, c[19];'#13+
    'RSQ R6.w, R6.w;'#13+
    'MUL R3.xyz, R6.w, R3;'#13+
    'DP3 R3.x, -R4, R3;'#13+
    'DP3 R4.y, -R4, c[22];'#13+
    'MAX R4.y, R4, c[26].x;'#13+
    'ABS R6.y, R6;'#13+
    'SGE R6.y, c[26].x, R6;'#13+
    'ABS R4.x, c[19].y;'#13+
    'SGE R4.x, c[26], R4;'#13+
    'MUL R4.x, R6, R4;'#13+
    'SLT R4.z, c[26].x, R4.y;'#13+
    'MUL R4.z, R4.x, R4;'#13+
    'MUL R6.y, R6.x, R6;'#13+
    'MAX R6.w, R3.x, c[26].x;'#13+
    'MUL R3.x, R6.y, R3.w;'#13+
    'MAD R3, R1, R3.x, R2;'#13+
    'POW R1.x, R6.w, c[18].x;'#13+
    'MUL R1, R1.x, c[24];'#13+
    'MAD R1, R1, R4.z, R3;'#13+
    'MUL R2, R6.z, c[23];'#13+
    'MUL R3, R5.w, R2;'#13+
    'MUL R2, R5.z, R2;'#13+
    'MUL R2, R5.y, R2;'#13+
    'MAD R3, R6.y, R3, R2;'#13+
    'ADD R4.z, -R5.x, c[12].y;'#13+
    'MUL R2, R4.y, c[23];'#13+
    'MAD R2, R4.x, R2, R3;'#13+
    'ABS R4.z, R4;'#13+
    'SGE R4.z, c[26].x, R4;'#13+
    'ABS R4.y, R4.z;'#13+
    'SGE R4.x, c[26], R4.y;'#13+
    'MUL R3, vertex.color, c[14];'#13+
    'MUL R5.x, R4.w, R4;'#13+
    'ADD R4, -R3, c[14];'#13+
    'MAD R4, R4, R5.x, R3;'#13+
    'MOV R3.xyz, c[17];'#13+
    'MOV R3.w, c[26].y;'#13+
    'ADD R5, R3, -R4;'#13+
    'MOV R3, c[16];'#13+
    'MAD R4, R6.x, R5, R4;'#13+
    'MUL R3, R3, c[25];'#13+
    'MAD R3, R6.x, R3, R4;'#13+
    'MUL R2, R2, c[14];'#13+
    'MAD R2, R6.x, R2, R3;'#13+
    'MUL R1, R1, c[15];'#13+
    'MAD R1, R1, R6.x, R2;'#13+
    'MIN R2, R1, c[26].y;'#13+
    'MAX R2, R2, c[26].x;'#13+
    'ADD R2, R2, -R1;'#13+
    'MAD result.color, R2, R6.x, R1;'#13+
    'DP4 result.position.w, R0, c[3];'#13+
    'DP4 result.position.z, R0, c[2];'#13+
    'DP4 result.position.y, R0, c[1];'#13+
    'DP4 result.position.x, R0, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  ARBVP1_2Light: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[34] = { program.local[0..32],'#13+
    '		{ 0, 1, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'TEMP R4;'#13+
    'TEMP R5;'#13+
    'TEMP R6;'#13+
    'TEMP R7;'#13+
    'TEMP R8;'#13+
    'TEMP R9;'#13+
    'MOV R1.w, c[33].y;'#13+
    'MOV R1.xyz, vertex.position;'#13+
    'DP4 R4.z, R1, c[6];'#13+
    'DP4 R4.x, R1, c[4];'#13+
    'DP4 R4.y, R1, c[5];'#13+
    'ADD R2.xyz, R4, -c[21];'#13+
    'DP3 R0.x, R2, R2;'#13+
    'RSQ R3.w, R0.x;'#13+
    'MUL R3.xyz, R3.w, R2;'#13+
    'DP3 R0.x, R4, R4;'#13+
    'RSQ R8.z, R0.x;'#13+
    'MAD R0.xyz, -R8.z, R4, -R3;'#13+
    'DP3 R0.w, R0, R0;'#13+
    'RSQ R0.w, R0.w;'#13+
    'MUL R2.xyz, R0.w, R0;'#13+
    'MOV R7.xy, c[33].yzzw;'#13+
    'MOV R0.w, c[33].x;'#13+
    'MOV R0.xyz, vertex.normal;'#13+
    'DP4 R5.z, R0, c[10];'#13+
    'DP4 R5.x, R0, c[8];'#13+
    'DP4 R5.y, R0, c[9];'#13+
    'DP3 R0.w, R5, R5;'#13+
    'MAD R0.xyz, -R8.z, R4, c[22];'#13+
    'RSQ R0.w, R0.w;'#13+
    'MUL R6.xyz, R0.w, R5;'#13+
    'DP3 R0.w, R6, R2;'#13+
    'DP3 R2.z, -R6, c[22];'#13+
    'DP3 R2.w, R0, R0;'#13+
    'RSQ R2.x, R2.w;'#13+
    'MAX R4.w, R2.z, c[33].x;'#13+
    'MUL R0.xyz, R2.x, R0;'#13+
    'DP3 R2.x, -R6, R0;'#13+
    'MAX R2.x, R2, c[33];'#13+
    'POW R2.y, R2.x, c[18].x;'#13+
    'ABS R2.x, c[12];'#13+
    'SGE R5.w, c[33].x, R2.x;'#13+
    'ABS R2.x, R5.w;'#13+
    'MAX R0.w, R0, c[33].x;'#13+
    'POW R0.w, R0.w, c[18].x;'#13+
    'ABS R2.z, c[19].y;'#13+
    'SGE R6.w, c[33].x, R2.x;'#13+
    'SGE R2.z, c[33].x, R2;'#13+
    'SLT R2.w, c[33].x, R4;'#13+
    'MUL R7.w, R6, R2.z;'#13+
    'MUL R5.x, R7.w, R2.w;'#13+
    'MUL R2, R2.y, c[24];'#13+
    'MUL R2, R2, R5.x;'#13+
    'DP3 R5.x, R6, -R3;'#13+
    'MAX R8.w, R5.x, c[33].x;'#13+
    'ADD R5.y, -R7.x, c[19];'#13+
    'ABS R5.x, R5.y;'#13+
    'SGE R5.y, c[33].x, R5.x;'#13+
    'ADD R5.x, -R7.y, c[19].y;'#13+
    'ABS R5.x, R5;'#13+
    'SGE R5.x, c[33], R5;'#13+
    'SLT R8.y, c[33].x, R8.w;'#13+
    'MUL R8.x, R6.w, R5;'#13+
    'MUL R7.z, R6.w, R5.y;'#13+
    'MUL R5.y, R8, R7.z;'#13+
    'MUL R0, R0.w, c[24];'#13+
    'MAD R2, R0, R5.y, R2;'#13+
    'MUL R9.x, R8, R8.y;'#13+
    'MAD R0, R9.x, R0, R2;'#13+
    'MAD R2.xyz, -R8.z, R4, c[29];'#13+
    'ADD R5.xyz, R4, -c[28];'#13+
    'DP3 R8.y, R5, R5;'#13+
    'RSQ R8.y, R8.y;'#13+
    'MUL R5.xyz, R8.y, R5;'#13+
    'MAD R4.xyz, -R8.z, R4, -R5;'#13+
    'DP3 R2.w, R2, R2;'#13+
    'RSQ R8.z, R2.w;'#13+
    'DP3 R2.w, R4, R4;'#13+
    'MUL R2.xyz, R8.z, R2;'#13+
    'DP3 R8.z, -R6, R2;'#13+
    'RSQ R2.w, R2.w;'#13+
    'MUL R2.xyz, R2.w, R4;'#13+
    'DP3 R2.x, R6, R2;'#13+
    'DP3 R4.z, -R6, c[29];'#13+
    'MAX R2.w, R8.z, c[33].x;'#13+
    'MAX R9.x, R4.z, c[33];'#13+
    'ABS R4.y, c[26];'#13+
    'SGE R4.y, c[33].x, R4;'#13+
    'MAX R4.x, R2, c[33];'#13+
    'POW R2.y, R2.w, c[18].x;'#13+
    'MUL R2, R2.y, c[31];'#13+
    'MUL R8.z, R6.w, R4.y;'#13+
    'SLT R4.z, c[33].x, R9.x;'#13+
    'MUL R4.y, R8.z, R4.z;'#13+
    'MAD R0, R2, R4.y, R0;'#13+
    'POW R2.x, R4.x, c[18].x;'#13+
    'DP3 R4.x, R6, -R5;'#13+
    'DP3 R5.y, R5, c[29];'#13+
    'MAX R6.z, R4.x, c[33].x;'#13+
    'ADD R4.y, -R7.x, c[26];'#13+
    'ABS R4.z, R4.y;'#13+
    'ADD R4.y, -R7, c[26];'#13+
    'SGE R4.z, c[33].x, R4;'#13+
    'SLT R5.z, c[26], R5.y;'#13+
    'ABS R4.y, R4;'#13+
    'SGE R4.y, c[33].x, R4;'#13+
    'MUL R6.x, R6.w, R4.y;'#13+
    'RCP R3.w, R3.w;'#13+
    'MUL R6.y, R6.w, R4.z;'#13+
    'SLT R4.x, c[33], R6.z;'#13+
    'MUL R4.z, R4.x, R6.y;'#13+
    'MUL R2, R2.x, c[31];'#13+
    'MAD R0, R2, R4.z, R0;'#13+
    'MUL R4.x, R6, R4;'#13+
    'MAD R2, R4.x, R2, R0;'#13+
    'MUL R0, R8.w, c[23];'#13+
    'MAD R4.y, R3.w, c[20], c[20].x;'#13+
    'MUL R4.x, R3.w, c[20].z;'#13+
    'MAD R3.w, R4.x, R3, R4.y;'#13+
    'DP3 R8.w, R3, c[22];'#13+
    'SLT R4.x, c[19].z, R8.w;'#13+
    'ABS R9.y, R4.x;'#13+
    'RCP R7.y, R3.w;'#13+
    'MUL R4, R4.w, c[23];'#13+
    'SGE R9.y, c[33].x, R9;'#13+
    'MUL R4, R7.w, R4;'#13+
    'MUL R3, R0, R7.y;'#13+
    'MAD R3, R7.z, R3, R4;'#13+
    'RCP R4.x, R8.y;'#13+
    'MAD R4.z, R4.x, c[27].y, c[27].x;'#13+
    'MUL R4.y, R4.x, c[27].z;'#13+
    'MAD R4.x, R4.y, R4, R4.z;'#13+
    'RCP R5.x, R4.x;'#13+
    'ABS R5.z, R5;'#13+
    'POW R8.w, R8.w, c[19].w;'#13+
    'MUL R9.y, R8.x, R9;'#13+
    'MAD R8.w, -R8, R9.y, R8;'#13+
    'MUL R7.y, R7, R8.w;'#13+
    'MUL R0, R0, R7.y;'#13+
    'MAD R3, R8.x, R0, R3;'#13+
    'MUL R0, R9.x, c[30];'#13+
    'MAD R0, R8.z, R0, R3;'#13+
    'MUL R3, R6.z, c[30];'#13+
    'MUL R4, R3, R5.x;'#13+
    'MAD R0, R6.y, R4, R0;'#13+
    'SGE R4.y, c[33].x, R5.z;'#13+
    'POW R4.x, R5.y, c[26].w;'#13+
    'MUL R4.y, R6.x, R4;'#13+
    'MAD R4.x, -R4, R4.y, R4;'#13+
    'MUL R4.x, R5, R4;'#13+
    'MUL R3, R3, R4.x;'#13+
    'ADD R4.y, -R7.x, c[12];'#13+
    'ABS R4.y, R4;'#13+
    'MAD R0, R6.x, R3, R0;'#13+
    'SGE R4.x, c[33], R4.y;'#13+
    'ABS R3.x, R4;'#13+
    'MUL R4, R0, c[14];'#13+
    'SGE R3.x, c[33], R3;'#13+
    'MUL R0, vertex.color, c[14];'#13+
    'MUL R5.x, R5.w, R3;'#13+
    'ADD R3, -R0, c[14];'#13+
    'MAD R5, R3, R5.x, R0;'#13+
    'MOV R3, c[32];'#13+
    'ADD R3, R3, c[25];'#13+
    'MAD R3, R3, c[16], R4;'#13+
    'MOV R0.xyz, c[17];'#13+
    'MOV R0.w, c[33].y;'#13+
    'ADD R0, R0, -R5;'#13+
    'MAD R0, R6.w, R0, R5;'#13+
    'MAD R2, R2, c[15], R3;'#13+
    'MAD result.color, R2, R6.w, R0;'#13+
    'DP4 result.position.w, R1, c[3];'#13+
    'DP4 result.position.z, R1, c[2];'#13+
    'DP4 result.position.y, R1, c[1];'#13+
    'DP4 result.position.x, R1, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  ARBVP1_3Light: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[41] = { program.local[0..39],'#13+
    '		{ 0, 1, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'TEMP R4;'#13+
    'TEMP R5;'#13+
    'TEMP R6;'#13+
    'TEMP R7;'#13+
    'TEMP R8;'#13+
    'TEMP R9;'#13+
    'TEMP R10;'#13+
    'TEMP R11;'#13+
    'MOV R8.xy, c[40].yzzw;'#13+
    'MOV R0.w, c[40].y;'#13+
    'MOV R0.xyz, vertex.position;'#13+
    'DP4 R4.z, R0, c[6];'#13+
    'DP4 R4.x, R0, c[4];'#13+
    'DP4 R4.y, R0, c[5];'#13+
    'ADD R2.xyz, R4, -c[21];'#13+
    'DP3 R1.x, R2, R2;'#13+
    'RSQ R3.w, R1.x;'#13+
    'MUL R3.xyz, R3.w, R2;'#13+
    'DP3 R1.x, R4, R4;'#13+
    'RSQ R11.x, R1.x;'#13+
    'MAD R1.xyz, -R11.x, R4, -R3;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R2.xyz, R1.w, R1;'#13+
    'MAD R5.xyz, -R11.x, R4, c[22];'#13+
    'MOV R1.xyz, vertex.normal;'#13+
    'MOV R1.w, c[40].x;'#13+
    'DP4 R6.z, R1, c[10];'#13+
    'DP4 R6.x, R1, c[8];'#13+
    'DP4 R6.y, R1, c[9];'#13+
    'DP3 R1.x, R6, R6;'#13+
    'DP3 R1.y, R5, R5;'#13+
    'RSQ R1.x, R1.x;'#13+
    'MUL R7.xyz, R1.x, R6;'#13+
    'DP3 R1.w, R7, R2;'#13+
    'DP3 R4.w, -R7, c[22];'#13+
    'RSQ R1.y, R1.y;'#13+
    'MUL R1.xyz, R1.y, R5;'#13+
    'DP3 R1.y, -R7, R1;'#13+
    'MAX R1.w, R1, c[40].x;'#13+
    'MAX R2.x, R1.y, c[40];'#13+
    'MAX R4.w, R4, c[40].x;'#13+
    'ABS R5.x, c[12];'#13+
    'SGE R5.w, c[40].x, R5.x;'#13+
    'ABS R5.x, R5.w;'#13+
    'POW R1.x, R1.w, c[18].x;'#13+
    'POW R2.x, R2.x, c[18].x;'#13+
    'ABS R5.y, c[19];'#13+
    'SGE R6.w, c[40].x, R5.x;'#13+
    'SGE R5.y, c[40].x, R5;'#13+
    'MUL R10.z, R6.w, R5.y;'#13+
    'SLT R5.z, c[40].x, R4.w;'#13+
    'ADD R5.y, -R8.x, c[19];'#13+
    'MUL R1, R1.x, c[24];'#13+
    'MUL R5.x, R10.z, R5.z;'#13+
    'MUL R2, R2.x, c[24];'#13+
    'MUL R2, R2, R5.x;'#13+
    'DP3 R5.x, R7, -R3;'#13+
    'MAX R10.w, R5.x, c[40].x;'#13+
    'ABS R5.y, R5;'#13+
    'SGE R5.x, c[40], R5.y;'#13+
    'MUL R10.x, R6.w, R5;'#13+
    'SLT R6.y, c[40].x, R10.w;'#13+
    'MUL R5.y, R6, R10.x;'#13+
    'ADD R5.x, -R8.y, c[19].y;'#13+
    'ABS R5.x, R5;'#13+
    'SGE R6.x, c[40], R5;'#13+
    'MAD R2, R1, R5.y, R2;'#13+
    'MUL R9.x, R6.w, R6;'#13+
    'ADD R5.xyz, R4, -c[28];'#13+
    'DP3 R6.x, R5, R5;'#13+
    'MUL R6.y, R9.x, R6;'#13+
    'MAD R2, R6.y, R1, R2;'#13+
    'RSQ R7.w, R6.x;'#13+
    'MUL R6.xyz, R7.w, R5;'#13+
    'MAD R1.xyz, -R11.x, R4, -R6;'#13+
    'MAD R5.xyz, -R11.x, R4, c[29];'#13+
    'DP3 R8.z, R5, R5;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R8.z, R8.z;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R1;'#13+
    'MUL R5.xyz, R8.z, R5;'#13+
    'DP3 R1.w, -R7, R5;'#13+
    'DP3 R1.x, R7, R1;'#13+
    'DP3 R5.z, -R7, c[29];'#13+
    'MAX R8.w, R5.z, c[40].x;'#13+
    'MAX R1.y, R1.w, c[40].x;'#13+
    'MAX R1.x, R1, c[40];'#13+
    'ABS R5.y, c[26];'#13+
    'SGE R5.y, c[40].x, R5;'#13+
    'POW R5.x, R1.x, c[18].x;'#13+
    'POW R1.y, R1.y, c[18].x;'#13+
    'MUL R8.z, R6.w, R5.y;'#13+
    'SLT R5.z, c[40].x, R8.w;'#13+
    'MUL R5.y, R8.z, R5.z;'#13+
    'MUL R1, R1.y, c[31];'#13+
    'MAD R2, R1, R5.y, R2;'#13+
    'MUL R1, R5.x, c[31];'#13+
    'DP3 R5.x, R7, -R6;'#13+
    'MAX R9.y, R5.x, c[40].x;'#13+
    'ADD R5.y, -R8.x, c[26];'#13+
    'ABS R5.x, R5.y;'#13+
    'SGE R5.y, c[40].x, R5.x;'#13+
    'ADD R5.x, -R8.y, c[26].y;'#13+
    'ABS R5.x, R5;'#13+
    'SGE R5.x, c[40], R5;'#13+
    'MUL R9.w, R6, R5.x;'#13+
    'SLT R10.y, c[40].x, R9;'#13+
    'MUL R9.z, R6.w, R5.y;'#13+
    'MUL R5.y, R10, R9.z;'#13+
    'MAD R2, R1, R5.y, R2;'#13+
    'MUL R11.y, R9.w, R10;'#13+
    'MAD R1, R11.y, R1, R2;'#13+
    'MAD R2.xyz, -R11.x, R4, c[36];'#13+
    'ADD R5.xyz, R4, -c[35];'#13+
    'DP3 R10.y, R5, R5;'#13+
    'RSQ R10.y, R10.y;'#13+
    'MUL R5.xyz, R10.y, R5;'#13+
    'MAD R4.xyz, -R11.x, R4, -R5;'#13+
    'DP3 R2.w, R2, R2;'#13+
    'RSQ R11.x, R2.w;'#13+
    'DP3 R2.w, R4, R4;'#13+
    'MUL R2.xyz, R11.x, R2;'#13+
    'DP3 R11.x, -R7, R2;'#13+
    'RSQ R2.w, R2.w;'#13+
    'MUL R2.xyz, R2.w, R4;'#13+
    'DP3 R2.x, R7, R2;'#13+
    'DP3 R4.z, -R7, c[36];'#13+
    'MAX R2.w, R11.x, c[40].x;'#13+
    'MAX R11.y, R4.z, c[40].x;'#13+
    'ABS R4.y, c[33];'#13+
    'SGE R4.y, c[40].x, R4;'#13+
    'MAX R4.x, R2, c[40];'#13+
    'POW R2.y, R2.w, c[18].x;'#13+
    'MUL R2, R2.y, c[38];'#13+
    'MUL R11.x, R6.w, R4.y;'#13+
    'SLT R4.z, c[40].x, R11.y;'#13+
    'MUL R4.y, R11.x, R4.z;'#13+
    'MAD R1, R2, R4.y, R1;'#13+
    'POW R2.x, R4.x, c[18].x;'#13+
    'DP3 R4.x, R7, -R5;'#13+
    'MAX R7.x, R4, c[40];'#13+
    'ADD R4.y, -R8.x, c[33];'#13+
    'ABS R4.z, R4.y;'#13+
    'ADD R4.y, -R8, c[33];'#13+
    'SGE R4.z, c[40].x, R4;'#13+
    'ABS R4.y, R4;'#13+
    'SGE R4.y, c[40].x, R4;'#13+
    'DP3 R5.y, R5, c[36];'#13+
    'MUL R7.y, R6.w, R4;'#13+
    'RCP R3.w, R3.w;'#13+
    'MUL R2, R2.x, c[38];'#13+
    'MUL R7.z, R6.w, R4;'#13+
    'SLT R4.x, c[40], R7;'#13+
    'MUL R4.z, R4.x, R7;'#13+
    'MAD R1, R2, R4.z, R1;'#13+
    'MUL R4.x, R7.y, R4;'#13+
    'MAD R1, R4.x, R2, R1;'#13+
    'MUL R2, R10.w, c[23];'#13+
    'MAD R4.y, R3.w, c[20], c[20].x;'#13+
    'MUL R4.x, R3.w, c[20].z;'#13+
    'MAD R3.w, R4.x, R3, R4.y;'#13+
    'DP3 R10.w, R3, c[22];'#13+
    'SLT R4.x, c[19].z, R10.w;'#13+
    'ABS R11.z, R4.x;'#13+
    'RCP R8.y, R3.w;'#13+
    'MUL R4, R4.w, c[23];'#13+
    'SGE R11.z, c[40].x, R11;'#13+
    'MUL R4, R10.z, R4;'#13+
    'MUL R3, R2, R8.y;'#13+
    'MAD R3, R10.x, R3, R4;'#13+
    'RCP R4.x, R7.w;'#13+
    'DP3 R4.w, R6, c[29];'#13+
    'SLT R6.x, c[26].z, R4.w;'#13+
    'MAD R4.z, R4.x, c[27].y, c[27].x;'#13+
    'MUL R4.y, R4.x, c[27].z;'#13+
    'MAD R4.x, R4.y, R4, R4.z;'#13+
    'ABS R4.y, R6.x;'#13+
    'RCP R6.x, R4.x;'#13+
    'SGE R4.y, c[40].x, R4;'#13+
    'POW R4.x, R4.w, c[26].w;'#13+
    'MUL R4.y, R9.w, R4;'#13+
    'MAD R6.y, -R4.x, R4, R4.x;'#13+
    'POW R10.w, R10.w, c[19].w;'#13+
    'MUL R11.z, R9.x, R11;'#13+
    'MAD R10.w, -R10, R11.z, R10;'#13+
    'MUL R8.y, R8, R10.w;'#13+
    'MUL R2, R2, R8.y;'#13+
    'MAD R2, R9.x, R2, R3;'#13+
    'MUL R3, R8.w, c[30];'#13+
    'MAD R2, R8.z, R3, R2;'#13+
    'MUL R3, R9.y, c[30];'#13+
    'MUL R4, R3, R6.x;'#13+
    'MAD R2, R9.z, R4, R2;'#13+
    'RCP R4.x, R10.y;'#13+
    'MUL R6.x, R6, R6.y;'#13+
    'MUL R3, R3, R6.x;'#13+
    'MAD R2, R9.w, R3, R2;'#13+
    'MUL R3, R11.y, c[37];'#13+
    'MAD R2, R11.x, R3, R2;'#13+
    'MAD R4.z, R4.x, c[34].y, c[34].x;'#13+
    'MUL R4.y, R4.x, c[34].z;'#13+
    'MAD R4.x, R4.y, R4, R4.z;'#13+
    'SLT R4.y, c[33].z, R5;'#13+
    'ABS R5.z, R4.y;'#13+
    'SGE R5.z, c[40].x, R5;'#13+
    'RCP R5.x, R4.x;'#13+
    'MUL R3, R7.x, c[37];'#13+
    'MUL R4, R3, R5.x;'#13+
    'MAD R2, R7.z, R4, R2;'#13+
    'MUL R5.z, R7.y, R5;'#13+
    'POW R5.y, R5.y, c[33].w;'#13+
    'MAD R5.y, -R5, R5.z, R5;'#13+
    'MUL R4.x, R5, R5.y;'#13+
    'MUL R3, R3, R4.x;'#13+
    'MAD R2, R7.y, R3, R2;'#13+
    'ADD R4.y, -R8.x, c[12];'#13+
    'ABS R4.x, R4.y;'#13+
    'SGE R3.x, c[40], R4;'#13+
    'ABS R4.x, R3;'#13+
    'SGE R5.x, c[40], R4;'#13+
    'MOV R3, c[32];'#13+
    'MUL R4, vertex.color, c[14];'#13+
    'MUL R6.x, R5.w, R5;'#13+
    'ADD R5, -R4, c[14];'#13+
    'MAD R5, R5, R6.x, R4;'#13+
    'ADD R4, R3, c[25];'#13+
    'MUL R2, R2, c[14];'#13+
    'ADD R4, R4, c[39];'#13+
    'MAD R2, R4, c[16], R2;'#13+
    'MOV R3.xyz, c[17];'#13+
    'MOV R3.w, c[40].y;'#13+
    'ADD R3, R3, -R5;'#13+
    'MAD R3, R6.w, R3, R5;'#13+
    'MAD R1, R1, c[15], R2;'#13+
    'MAD result.color, R1, R6.w, R3;'#13+
    'DP4 result.position.w, R0, c[3];'#13+
    'DP4 result.position.z, R0, c[2];'#13+
    'DP4 result.position.y, R0, c[1];'#13+
    'DP4 result.position.x, R0, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  ARBVP1_4Light: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[48] = { program.local[0..46],'#13+
    '		{ 1, 0, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'TEMP R4;'#13+
    'TEMP R5;'#13+
    'TEMP R6;'#13+
    'TEMP R7;'#13+
    'TEMP R8;'#13+
    'TEMP R9;'#13+
    'TEMP R10;'#13+
    'TEMP R11;'#13+
    'TEMP R12;'#13+
    'MOV R7.xy, c[47].xzzw;'#13+
    'MOV R1.w, c[47].x;'#13+
    'MOV R1.xyz, vertex.position;'#13+
    'DP4 R3.z, R1, c[6];'#13+
    'DP4 R3.x, R1, c[4];'#13+
    'DP4 R3.y, R1, c[5];'#13+
    'ADD R2.xyz, R3, -c[21];'#13+
    'DP3 R0.x, R2, R2;'#13+
    'RSQ R2.w, R0.x;'#13+
    'DP3 R0.x, R3, R3;'#13+
    'RSQ R11.w, R0.x;'#13+
    'MUL R2.xyz, R2.w, R2;'#13+
    'MAD R4.xyz, -R11.w, R3, -R2;'#13+
    'DP3 R3.w, R4, R4;'#13+
    'MOV R0.xyz, vertex.normal;'#13+
    'MOV R0.w, c[47].y;'#13+
    'DP4 R5.z, R0, c[10];'#13+
    'DP4 R5.x, R0, c[8];'#13+
    'DP4 R5.y, R0, c[9];'#13+
    'DP3 R0.x, R5, R5;'#13+
    'RSQ R0.w, R0.x;'#13+
    'MUL R5.xyz, R0.w, R5;'#13+
    'DP3 R0.w, R5, -R2;'#13+
    'RSQ R0.y, R3.w;'#13+
    'MUL R0.xyz, R0.y, R4;'#13+
    'DP3 R0.x, R5, R0;'#13+
    'DP3 R2.x, R2, c[22];'#13+
    'DP3 R12.y, -R5, c[36];'#13+
    'MAX R3.w, R0, c[47].y;'#13+
    'MAX R0.x, R0, c[47].y;'#13+
    'POW R4.x, R0.x, c[18].x;'#13+
    'RCP R0.x, R2.w;'#13+
    'MAX R12.y, R12, c[47];'#13+
    'SLT R6.x, c[47].y, R3.w;'#13+
    'SLT R2.y, c[19].z, R2.x;'#13+
    'MAD R0.z, R0.x, c[20].y, c[20].x;'#13+
    'MUL R0.y, R0.x, c[20].z;'#13+
    'MAD R0.y, R0, R0.x, R0.z;'#13+
    'ABS R0.x, R2.y;'#13+
    'POW R0.z, R2.x, c[19].w;'#13+
    'SGE R2.y, c[47], R0.x;'#13+
    'ABS R0.x, c[12];'#13+
    'SGE R5.w, c[47].y, R0.x;'#13+
    'ABS R0.x, R5.w;'#13+
    'ADD R2.x, -R7.y, c[19].y;'#13+
    'ABS R2.x, R2;'#13+
    'SGE R6.w, c[47].y, R0.x;'#13+
    'SGE R2.x, c[47].y, R2;'#13+
    'MUL R11.z, R6.w, R2.x;'#13+
    'MUL R0.x, R11.z, R2.y;'#13+
    'MAD R0.x, -R0.z, R0, R0.z;'#13+
    'RCP R11.x, R0.y;'#13+
    'MUL R4.w, R11.x, R0.x;'#13+
    'MUL R0.x, R4, R4.w;'#13+
    'MUL R0, R0.x, c[24];'#13+
    'MUL R2.x, R6, R11.z;'#13+
    'MUL R2, R0, R2.x;'#13+
    'ADD R4.y, -R7.x, c[19];'#13+
    'ABS R0.y, R4;'#13+
    'MUL R0.x, R4, R11;'#13+
    'SGE R4.x, c[47].y, R0.y;'#13+
    'MUL R10.w, R6, R4.x;'#13+
    'MUL R0, R0.x, c[24];'#13+
    'MUL R6.y, R10.w, R6.x;'#13+
    'MAD R2, R0, R6.y, R2;'#13+
    'MAD R0.xyz, -R11.w, R3, c[22];'#13+
    'ADD R4.xyz, R3, -c[28];'#13+
    'DP3 R6.x, R4, R4;'#13+
    'RSQ R7.z, R6.x;'#13+
    'MUL R4.xyz, R7.z, R4;'#13+
    'DP3 R0.w, R0, R0;'#13+
    'RSQ R7.w, R0.w;'#13+
    'MAD R6.xyz, -R11.w, R3, -R4;'#13+
    'DP3 R0.w, R6, R6;'#13+
    'MUL R0.xyz, R7.w, R0;'#13+
    'DP3 R7.w, -R5, R0;'#13+
    'RSQ R0.w, R0.w;'#13+
    'MUL R0.xyz, R0.w, R6;'#13+
    'DP3 R0.x, R5, R0;'#13+
    'DP3 R6.z, -R5, c[22];'#13+
    'MAX R0.w, R7, c[47].y;'#13+
    'MAX R9.y, R6.z, c[47];'#13+
    'MAX R6.x, R0, c[47].y;'#13+
    'POW R0.y, R0.w, c[18].x;'#13+
    'ABS R6.y, c[19];'#13+
    'SGE R6.y, c[47], R6;'#13+
    'MUL R0, R0.y, c[24];'#13+
    'MUL R9.x, R6.w, R6.y;'#13+
    'SLT R6.z, c[47].y, R9.y;'#13+
    'MUL R6.y, R9.x, R6.z;'#13+
    'MAD R2, R0, R6.y, R2;'#13+
    'DP3 R0.w, R5, -R4;'#13+
    'RCP R0.x, R7.z;'#13+
    'MAX R10.y, R0.w, c[47];'#13+
    'DP3 R4.x, R4, c[29];'#13+
    'POW R6.x, R6.x, c[18].x;'#13+
    'MAD R0.z, R0.x, c[27].y, c[27].x;'#13+
    'MUL R0.y, R0.x, c[27].z;'#13+
    'MAD R0.x, R0.y, R0, R0.z;'#13+
    'POW R0.y, R4.x, c[26].w;'#13+
    'ADD R0.z, -R7.y, c[26].y;'#13+
    'SLT R4.x, c[26].z, R4;'#13+
    'ABS R0.z, R0;'#13+
    'SGE R0.z, c[47].y, R0;'#13+
    'ABS R4.x, R4;'#13+
    'MUL R8.z, R6.w, R0;'#13+
    'SGE R4.x, c[47].y, R4;'#13+
    'MUL R0.z, R8, R4.x;'#13+
    'SLT R6.y, c[47], R10;'#13+
    'RCP R8.x, R0.x;'#13+
    'MAD R0.y, -R0, R0.z, R0;'#13+
    'MUL R8.w, R8.x, R0.y;'#13+
    'MUL R0.x, R6, R8.w;'#13+
    'MUL R0, R0.x, c[31];'#13+
    'MUL R4.y, R6, R8.z;'#13+
    'MAD R2, R0, R4.y, R2;'#13+
    'ADD R4.x, -R7, c[26].y;'#13+
    'ABS R0.y, R4.x;'#13+
    'SGE R4.x, c[47].y, R0.y;'#13+
    'MUL R8.y, R6.w, R4.x;'#13+
    'MUL R0.x, R6, R8;'#13+
    'ADD R4.xyz, R3, -c[35];'#13+
    'DP3 R6.x, R4, R4;'#13+
    'RSQ R9.z, R6.x;'#13+
    'MUL R4.xyz, R9.z, R4;'#13+
    'MUL R0, R0.x, c[31];'#13+
    'MUL R6.y, R8, R6;'#13+
    'MAD R2, R0, R6.y, R2;'#13+
    'MAD R0.xyz, -R11.w, R3, c[29];'#13+
    'DP3 R0.w, R0, R0;'#13+
    'RSQ R7.z, R0.w;'#13+
    'MAD R6.xyz, -R11.w, R3, -R4;'#13+
    'DP3 R0.w, R6, R6;'#13+
    'MUL R0.xyz, R7.z, R0;'#13+
    'DP3 R7.z, -R5, R0;'#13+
    'RSQ R0.w, R0.w;'#13+
    'MUL R0.xyz, R0.w, R6;'#13+
    'DP3 R0.x, R5, R0;'#13+
    'DP3 R6.z, -R5, c[29];'#13+
    'MAX R0.w, R7.z, c[47].y;'#13+
    'MAX R7.w, R6.z, c[47].y;'#13+
    'MAX R6.x, R0, c[47].y;'#13+
    'POW R0.y, R0.w, c[18].x;'#13+
    'ABS R6.y, c[26];'#13+
    'SGE R6.y, c[47], R6;'#13+
    'MUL R7.z, R6.w, R6.y;'#13+
    'SLT R6.z, c[47].y, R7.w;'#13+
    'POW R6.x, R6.x, c[18].x;'#13+
    'MUL R6.y, R7.z, R6.z;'#13+
    'MUL R0, R0.y, c[31];'#13+
    'MAD R0, R0, R6.y, R2;'#13+
    'RCP R2.x, R9.z;'#13+
    'DP3 R2.w, R4, c[36];'#13+
    'MAD R2.z, R2.x, c[34].y, c[34].x;'#13+
    'MUL R2.y, R2.x, c[34].z;'#13+
    'MAD R2.x, R2.y, R2, R2.z;'#13+
    'RCP R9.z, R2.x;'#13+
    'DP3 R2.x, R5, -R4;'#13+
    'MAX R10.z, R2.x, c[47].y;'#13+
    'POW R2.y, R2.w, c[33].w;'#13+
    'ADD R2.z, -R7.y, c[33].y;'#13+
    'SLT R2.w, c[33].z, R2;'#13+
    'ABS R2.z, R2;'#13+
    'SGE R2.z, c[47].y, R2;'#13+
    'ABS R2.w, R2;'#13+
    'ADD R4.y, -R7.x, c[33];'#13+
    'MUL R9.w, R6, R2.z;'#13+
    'SGE R2.w, c[47].y, R2;'#13+
    'MUL R2.z, R9.w, R2.w;'#13+
    'MAD R2.y, -R2, R2.z, R2;'#13+
    'MUL R10.x, R9.z, R2.y;'#13+
    'MUL R2.y, R6.x, R10.x;'#13+
    'SLT R4.x, c[47].y, R10.z;'#13+
    'MUL R4.z, R4.x, R9.w;'#13+
    'MUL R2, R2.y, c[38];'#13+
    'MAD R2, R2, R4.z, R0;'#13+
    'ABS R4.y, R4;'#13+
    'SGE R0.y, c[47], R4;'#13+
    'MUL R11.y, R6.w, R0;'#13+
    'MUL R0.x, R6, R9.z;'#13+
    'MUL R0, R0.x, c[38];'#13+
    'MUL R4.x, R11.y, R4;'#13+
    'MAD R2, R0, R4.x, R2;'#13+
    'MAD R0.xyz, -R11.w, R3, c[36];'#13+
    'ADD R4.xyz, R3, -c[42];'#13+
    'DP3 R0.w, R4, R4;'#13+
    'RSQ R12.z, R0.w;'#13+
    'DP3 R6.x, R0, R0;'#13+
    'RSQ R0.w, R6.x;'#13+
    'MUL R6.xyz, R0.w, R0;'#13+
    'MUL R4.xyz, R12.z, R4;'#13+
    'MAD R0.xyz, -R11.w, R3, -R4;'#13+
    'DP3 R6.x, -R5, R6;'#13+
    'DP3 R0.w, R0, R0;'#13+
    'MAX R6.x, R6, c[47].y;'#13+
    'POW R12.x, R6.x, c[18].x;'#13+
    'RSQ R0.w, R0.w;'#13+
    'MUL R6.xyz, R0.w, R0;'#13+
    'MUL R0, R12.x, c[38];'#13+
    'ABS R12.x, c[33].y;'#13+
    'SGE R12.x, c[47].y, R12;'#13+
    'MAD R3.xyz, -R11.w, R3, c[43];'#13+
    'MUL R12.x, R6.w, R12;'#13+
    'SLT R12.w, c[47].y, R12.y;'#13+
    'MUL R12.w, R12.x, R12;'#13+
    'MAD R0, R0, R12.w, R2;'#13+
    'RCP R2.y, R12.z;'#13+
    'DP3 R2.x, R5, R6;'#13+
    'MAX R2.x, R2, c[47].y;'#13+
    'MAD R2.w, R2.y, c[41].y, c[41].x;'#13+
    'MUL R2.z, R2.y, c[41];'#13+
    'MAD R2.y, R2.z, R2, R2.w;'#13+
    'DP3 R2.z, R4, c[43];'#13+
    'RCP R6.x, R2.y;'#13+
    'POW R2.x, R2.x, c[18].x;'#13+
    'MUL R12.z, R2.x, R6.x;'#13+
    'POW R2.y, R2.z, c[40].w;'#13+
    'ADD R2.w, -R7.y, c[40].y;'#13+
    'SLT R6.y, c[40].z, R2.z;'#13+
    'ABS R2.z, R2.w;'#13+
    'ABS R2.w, R6.y;'#13+
    'SGE R2.z, c[47].y, R2;'#13+
    'MUL R6.y, R6.w, R2.z;'#13+
    'SGE R2.w, c[47].y, R2;'#13+
    'MUL R2.z, R6.y, R2.w;'#13+
    'MAD R2.z, -R2.y, R2, R2.y;'#13+
    'DP3 R2.y, R5, -R4;'#13+
    'MUL R7.y, R6.x, R2.z;'#13+
    'MAX R6.z, R2.y, c[47].y;'#13+
    'SLT R4.x, c[47].y, R6.z;'#13+
    'MUL R2.x, R2, R7.y;'#13+
    'ADD R4.z, -R7.x, c[40].y;'#13+
    'ABS R4.z, R4;'#13+
    'SGE R4.z, c[47].y, R4;'#13+
    'MUL R4.y, R4.x, R6;'#13+
    'MUL R2, R2.x, c[45];'#13+
    'MAD R2, R2, R4.y, R0;'#13+
    'DP3 R4.y, R3, R3;'#13+
    'RSQ R4.y, R4.y;'#13+
    'MUL R3.xyz, R4.y, R3;'#13+
    'DP3 R3.x, -R5, R3;'#13+
    'DP3 R5.y, -R5, c[43];'#13+
    'MUL R11.w, R6, R4.z;'#13+
    'MAX R5.y, R5, c[47];'#13+
    'ABS R5.x, c[40].y;'#13+
    'SGE R5.x, c[47].y, R5;'#13+
    'MUL R0, R12.z, c[45];'#13+
    'MUL R3.y, R11.w, R4.x;'#13+
    'MAD R2, R0, R3.y, R2;'#13+
    'MAX R0.x, R3, c[47].y;'#13+
    'MUL R3, R3.w, c[23];'#13+
    'MUL R4, R4.w, R3;'#13+
    'POW R0.x, R0.x, c[18].x;'#13+
    'MUL R5.x, R6.w, R5;'#13+
    'SLT R5.z, c[47].y, R5.y;'#13+
    'MUL R5.z, R5.x, R5;'#13+
    'MUL R0, R0.x, c[45];'#13+
    'MAD R0, R0, R5.z, R2;'#13+
    'MUL R2, R11.z, R4;'#13+
    'MUL R3, R11.x, R3;'#13+
    'MAD R4, R10.w, R3, R2;'#13+
    'MUL R3, R9.y, c[23];'#13+
    'MAD R3, R9.x, R3, R4;'#13+
    'MUL R2, R10.y, c[30];'#13+
    'MUL R4, R8.w, R2;'#13+
    'MAD R3, R8.z, R4, R3;'#13+
    'MUL R2, R8.x, R2;'#13+
    'MAD R2, R8.y, R2, R3;'#13+
    'MUL R4, R7.w, c[30];'#13+
    'MUL R3, R10.z, c[37];'#13+
    'MAD R2, R7.z, R4, R2;'#13+
    'MUL R4, R10.x, R3;'#13+
    'MAD R2, R9.w, R4, R2;'#13+
    'MUL R3, R9.z, R3;'#13+
    'MAD R2, R11.y, R3, R2;'#13+
    'MUL R4, R12.y, c[37];'#13+
    'MUL R3, R6.z, c[44];'#13+
    'MAD R2, R12.x, R4, R2;'#13+
    'MUL R4, R7.y, R3;'#13+
    'MAD R2, R6.y, R4, R2;'#13+
    'MUL R3, R6.x, R3;'#13+
    'MAD R2, R11.w, R3, R2;'#13+
    'MUL R3, R5.y, c[44];'#13+
    'MAD R2, R5.x, R3, R2;'#13+
    'ADD R4.x, -R7, c[12].y;'#13+
    'ABS R4.x, R4;'#13+
    'SGE R4.x, c[47].y, R4;'#13+
    'ABS R4.x, R4;'#13+
    'SGE R5.x, c[47].y, R4;'#13+
    'MOV R3, c[32];'#13+
    'ADD R3, R3, c[25];'#13+
    'MUL R4, vertex.color, c[14];'#13+
    'MUL R6.x, R5.w, R5;'#13+
    'ADD R5, -R4, c[14];'#13+
    'MAD R5, R5, R6.x, R4;'#13+
    'ADD R4, R3, c[39];'#13+
    'ADD R4, R4, c[46];'#13+
    'MOV R3.xyz, c[17];'#13+
    'MOV R3.w, c[47].x;'#13+
    'ADD R3, R3, -R5;'#13+
    'MAD R3, R6.w, R3, R5;'#13+
    'MUL R4, R4, c[16];'#13+
    'MAD R3, R6.w, R4, R3;'#13+
    'MUL R2, R2, c[14];'#13+
    'MAD R2, R6.w, R2, R3;'#13+
    'MUL R0, R0, c[15];'#13+
    'MAD R0, R0, R6.w, R2;'#13+
    'MIN R2, R0, c[47].x;'#13+
    'MAX R2, R2, c[47].y;'#13+
    'ADD R2, R2, -R0;'#13+
    'MAD result.color, R2, R6.w, R0;'#13+
    'DP4 result.position.w, R1, c[3];'#13+
    'DP4 result.position.z, R1, c[2];'#13+
    'DP4 result.position.y, R1, c[1];'#13+
    'DP4 result.position.x, R1, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  ARBVP1_Full: PAnsiChar = 
    '!!ARBvp1.0'#13+
    'PARAM c[76] = { program.local[0..74],'#13+
    '		{ 1, 0, 2 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'TEMP R3;'#13+
    'TEMP R4;'#13+
    'TEMP R5;'#13+
    'TEMP R6;'#13+
    'TEMP R7;'#13+
    'TEMP R8;'#13+
    'TEMP R9;'#13+
    'TEMP R10;'#13+
    'TEMP R11;'#13+
    'TEMP R12;'#13+
    'TEMP R13;'#13+
    'TEMP R14;'#13+
    'TEMP R15;'#13+
    'TEMP R16;'#13+
    'TEMP R17;'#13+
    'TEMP R18;'#13+
    'TEMP R19;'#13+
    'ABS R6.w, c[19].y;'#13+
    'MOV R0.w, c[75].x;'#13+
    'MOV R0.xyz, vertex.position;'#13+
    'DP4 R3.z, R0, c[6];'#13+
    'DP4 R3.x, R0, c[4];'#13+
    'DP4 R3.y, R0, c[5];'#13+
    'ADD R1.xyz, R3, -c[21];'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R2.w, R1.w;'#13+
    'DP3 R1.w, R3, R3;'#13+
    'RSQ R4.w, R1.w;'#13+
    'MUL R1.xyz, R2.w, R1;'#13+
    'MAD R4.xyz, -R4.w, R3, -R1;'#13+
    'DP3 R3.w, R4, R4;'#13+
    'RSQ R3.w, R3.w;'#13+
    'MUL R4.xyz, R3.w, R4;'#13+
    'MOV R5.xyz, vertex.normal;'#13+
    'MOV R5.w, c[75].y;'#13+
    'DP4 R2.z, R5, c[10];'#13+
    'DP4 R2.x, R5, c[8];'#13+
    'DP4 R2.y, R5, c[9];'#13+
    'DP3 R1.w, R2, R2;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R6.xyz, R1.w, R2;'#13+
    'DP3 R1.w, R6, R4;'#13+
    'MOV R5.xy, c[75].xzzw;'#13+
    'DP3 R2.x, R1, c[22];'#13+
    'DP3 R7.x, -R6, c[22];'#13+
    'DP3 R19.y, -R6, c[64];'#13+
    'MAX R17.y, R7.x, c[75];'#13+
    'MAX R1.w, R1, c[75].y;'#13+
    'POW R4.x, R1.w, c[18].x;'#13+
    'DP3 R1.w, R6, -R1;'#13+
    'RCP R1.x, R2.w;'#13+
    'MAX R18.w, R1, c[75].y;'#13+
    'MAX R19.y, R19, c[75];'#13+
    'SLT R2.y, c[19].z, R2.x;'#13+
    'MAD R1.z, R1.x, c[20].y, c[20].x;'#13+
    'MUL R1.y, R1.x, c[20].z;'#13+
    'MAD R1.y, R1, R1.x, R1.z;'#13+
    'ABS R1.x, R2.y;'#13+
    'POW R1.z, R2.x, c[19].w;'#13+
    'SGE R2.y, c[75], R1.x;'#13+
    'ABS R1.x, c[12];'#13+
    'SGE R7.z, c[75].y, R1.x;'#13+
    'ADD R2.x, -R5.y, c[19].y;'#13+
    'ABS R1.x, R7.z;'#13+
    'ABS R2.x, R2;'#13+
    'SGE R7.y, c[75], R1.x;'#13+
    'SGE R2.x, c[75].y, R2;'#13+
    'MUL R18.y, R7, R2.x;'#13+
    'SLT R5.z, c[75].y, R18.w;'#13+
    'MUL R1.x, R18.y, R2.y;'#13+
    'SGE R6.w, c[75].y, R6;'#13+
    'MAD R1.x, -R1.z, R1, R1.z;'#13+
    'RCP R18.x, R1.y;'#13+
    'MUL R3.w, R18.x, R1.x;'#13+
    'MUL R1.x, R4, R3.w;'#13+
    'MUL R1, R1.x, c[24];'#13+
    'MUL R2.x, R5.z, R18.y;'#13+
    'MUL R2, R1, R2.x;'#13+
    'ADD R4.y, -R5.x, c[19];'#13+
    'ABS R1.y, R4;'#13+
    'MUL R1.x, R4, R18;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R17.w, R7.y, R4.x;'#13+
    'MUL R1, R1.x, c[24];'#13+
    'MUL R5.w, R17, R5.z;'#13+
    'MAD R2, R1, R5.w, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[22];'#13+
    'ADD R4.xyz, R3, -c[28];'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R5.w, R1.w;'#13+
    'MUL R1.xyz, R5.w, R1;'#13+
    'DP3 R5.z, R4, R4;'#13+
    'RSQ R5.z, R5.z;'#13+
    'MUL R4.xyz, R5.z, R4;'#13+
    'MAD R8.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R1.w, R8, R8;'#13+
    'DP3 R5.w, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R8;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'MAX R1.w, R5, c[75].y;'#13+
    'MAX R5.w, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'MUL R1, R1.y, c[24];'#13+
    'MUL R17.x, R7.y, R6.w;'#13+
    'SLT R7.x, c[75].y, R17.y;'#13+
    'MUL R6.w, R17.x, R7.x;'#13+
    'MAD R2, R1, R6.w, R2;'#13+
    'DP3 R1.w, R6, -R4;'#13+
    'RCP R1.x, R5.z;'#13+
    'DP3 R7.x, -R6, c[29];'#13+
    'MAX R17.z, R1.w, c[75].y;'#13+
    'MAX R14.x, R7, c[75].y;'#13+
    'ABS R6.w, c[26].y;'#13+
    'SGE R6.w, c[75].y, R6;'#13+
    'DP3 R4.x, R4, c[29];'#13+
    'POW R5.w, R5.w, c[18].x;'#13+
    'MAD R1.z, R1.x, c[27].y, c[27].x;'#13+
    'MUL R1.y, R1.x, c[27].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'POW R1.y, R4.x, c[26].w;'#13+
    'ADD R1.z, -R5.y, c[26].y;'#13+
    'SLT R4.x, c[26].z, R4;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'ABS R4.x, R4;'#13+
    'MUL R16.y, R7, R1.z;'#13+
    'SLT R5.z, c[75].y, R17;'#13+
    'SGE R4.x, c[75].y, R4;'#13+
    'MUL R1.z, R16.y, R4.x;'#13+
    'RCP R16.x, R1.x;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R16.z, R16.x, R1.y;'#13+
    'MUL R1.x, R5.w, R16.z;'#13+
    'MUL R1, R1.x, c[31];'#13+
    'MUL R4.y, R5.z, R16;'#13+
    'MAD R2, R1, R4.y, R2;'#13+
    'ADD R4.x, -R5, c[26].y;'#13+
    'ABS R1.y, R4.x;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R15.x, R7.y, R4;'#13+
    'MUL R1.x, R5.w, R16;'#13+
    'MUL R1, R1.x, c[31];'#13+
    'MUL R5.w, R15.x, R5.z;'#13+
    'MAD R2, R1, R5.w, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[29];'#13+
    'ADD R4.xyz, R3, -c[35];'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R5.w, R1.w;'#13+
    'MUL R1.xyz, R5.w, R1;'#13+
    'DP3 R5.z, R4, R4;'#13+
    'RSQ R5.z, R5.z;'#13+
    'MUL R4.xyz, R5.z, R4;'#13+
    'MAD R8.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R1.w, R8, R8;'#13+
    'DP3 R5.w, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R8;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'MAX R1.w, R5, c[75].y;'#13+
    'MAX R5.w, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'MUL R1, R1.y, c[31];'#13+
    'MUL R13.w, R7.y, R6;'#13+
    'SLT R7.x, c[75].y, R14;'#13+
    'MUL R6.w, R13, R7.x;'#13+
    'MAD R2, R1, R6.w, R2;'#13+
    'DP3 R1.w, R6, -R4;'#13+
    'RCP R1.x, R5.z;'#13+
    'DP3 R7.x, -R6, c[36];'#13+
    'MAX R14.w, R1, c[75].y;'#13+
    'MAX R11.z, R7.x, c[75].y;'#13+
    'ABS R6.w, c[33].y;'#13+
    'SGE R6.w, c[75].y, R6;'#13+
    'DP3 R4.x, R4, c[36];'#13+
    'POW R5.w, R5.w, c[18].x;'#13+
    'MAD R1.z, R1.x, c[34].y, c[34].x;'#13+
    'MUL R1.y, R1.x, c[34].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'POW R1.y, R4.x, c[33].w;'#13+
    'ADD R1.z, -R5.y, c[33].y;'#13+
    'SLT R4.x, c[33].z, R4;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'ABS R4.x, R4;'#13+
    'MUL R12.y, R7, R1.z;'#13+
    'SLT R5.z, c[75].y, R14.w;'#13+
    'SGE R4.x, c[75].y, R4;'#13+
    'MUL R1.z, R12.y, R4.x;'#13+
    'RCP R11.w, R1.x;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R12.z, R11.w, R1.y;'#13+
    'MUL R1.x, R5.w, R12.z;'#13+
    'MUL R1, R1.x, c[38];'#13+
    'MUL R4.y, R5.z, R12;'#13+
    'MAD R2, R1, R4.y, R2;'#13+
    'ADD R4.x, -R5, c[33].y;'#13+
    'ABS R1.y, R4.x;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R12.x, R7.y, R4;'#13+
    'MUL R1.x, R5.w, R11.w;'#13+
    'MUL R1, R1.x, c[38];'#13+
    'MUL R5.w, R12.x, R5.z;'#13+
    'MAD R2, R1, R5.w, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[36];'#13+
    'ADD R4.xyz, R3, -c[42];'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R5.w, R1.w;'#13+
    'MUL R1.xyz, R5.w, R1;'#13+
    'DP3 R5.z, R4, R4;'#13+
    'RSQ R5.z, R5.z;'#13+
    'MUL R4.xyz, R5.z, R4;'#13+
    'MAD R8.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R1.w, R8, R8;'#13+
    'DP3 R5.w, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R8;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'MAX R1.w, R5, c[75].y;'#13+
    'MAX R5.w, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'MUL R1, R1.y, c[38];'#13+
    'MUL R11.y, R7, R6.w;'#13+
    'SLT R7.x, c[75].y, R11.z;'#13+
    'MUL R6.w, R11.y, R7.x;'#13+
    'MAD R2, R1, R6.w, R2;'#13+
    'DP3 R1.w, R6, -R4;'#13+
    'RCP R1.x, R5.z;'#13+
    'DP3 R7.x, -R6, c[43];'#13+
    'MAX R10.z, R1.w, c[75].y;'#13+
    'MAX R9.w, R7.x, c[75].y;'#13+
    'ABS R6.w, c[40].y;'#13+
    'SGE R6.w, c[75].y, R6;'#13+
    'DP3 R4.x, R4, c[43];'#13+
    'POW R5.w, R5.w, c[18].x;'#13+
    'MAD R1.z, R1.x, c[41].y, c[41].x;'#13+
    'MUL R1.y, R1.x, c[41].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'POW R1.y, R4.x, c[40].w;'#13+
    'ADD R1.z, -R5.y, c[40].y;'#13+
    'SLT R4.x, c[40].z, R4;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'ABS R4.x, R4;'#13+
    'MUL R10.w, R7.y, R1.z;'#13+
    'SLT R5.z, c[75].y, R10;'#13+
    'SGE R4.x, c[75].y, R4;'#13+
    'MUL R1.z, R10.w, R4.x;'#13+
    'RCP R10.x, R1.x;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R11.x, R10, R1.y;'#13+
    'MUL R1.x, R5.w, R11;'#13+
    'MUL R1, R1.x, c[45];'#13+
    'MUL R4.y, R5.z, R10.w;'#13+
    'MAD R2, R1, R4.y, R2;'#13+
    'ADD R4.x, -R5, c[40].y;'#13+
    'ABS R1.y, R4.x;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R10.y, R7, R4.x;'#13+
    'MUL R1.x, R5.w, R10;'#13+
    'MUL R1, R1.x, c[45];'#13+
    'MUL R5.w, R10.y, R5.z;'#13+
    'MAD R2, R1, R5.w, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[43];'#13+
    'ADD R4.xyz, R3, -c[49];'#13+
    'DP3 R5.z, R4, R4;'#13+
    'RSQ R5.w, R5.z;'#13+
    'MUL R4.xyz, R5.w, R4;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R5.z, R1.w;'#13+
    'MAD R8.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R1.w, R8, R8;'#13+
    'MUL R1.xyz, R5.z, R1;'#13+
    'DP3 R5.z, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R8;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'MAX R1.w, R5.z, c[75].y;'#13+
    'MAX R5.z, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'MUL R1, R1.y, c[45];'#13+
    'MUL R9.z, R7.y, R6.w;'#13+
    'SLT R7.x, c[75].y, R9.w;'#13+
    'MUL R6.w, R9.z, R7.x;'#13+
    'MAD R2, R1, R6.w, R2;'#13+
    'DP3 R1.w, R6, -R4;'#13+
    'RCP R1.x, R5.w;'#13+
    'DP3 R7.x, -R6, c[50];'#13+
    'MAX R8.w, R1, c[75].y;'#13+
    'MAX R8.x, R7, c[75].y;'#13+
    'ABS R6.w, c[47].y;'#13+
    'SGE R6.w, c[75].y, R6;'#13+
    'DP3 R4.x, R4, c[50];'#13+
    'POW R5.z, R5.z, c[18].x;'#13+
    'MAD R1.z, R1.x, c[48].y, c[48].x;'#13+
    'MUL R1.y, R1.x, c[48].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'POW R1.y, R4.x, c[47].w;'#13+
    'ADD R1.z, -R5.y, c[47].y;'#13+
    'SLT R4.x, c[47].z, R4;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'ABS R4.x, R4;'#13+
    'MUL R9.x, R7.y, R1.z;'#13+
    'SGE R4.x, c[75].y, R4;'#13+
    'MUL R1.z, R9.x, R4.x;'#13+
    'SLT R5.w, c[75].y, R8;'#13+
    'RCP R8.y, R1.x;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R9.y, R8, R1;'#13+
    'MUL R1.x, R5.z, R9.y;'#13+
    'MUL R1, R1.x, c[52];'#13+
    'MUL R4.y, R5.w, R9.x;'#13+
    'MAD R2, R1, R4.y, R2;'#13+
    'ADD R4.x, -R5, c[47].y;'#13+
    'ABS R1.y, R4.x;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R8.z, R7.y, R4.x;'#13+
    'MUL R1.x, R5.z, R8.y;'#13+
    'ADD R4.xyz, R3, -c[56];'#13+
    'DP3 R5.z, R4, R4;'#13+
    'RSQ R5.z, R5.z;'#13+
    'MUL R4.xyz, R5.z, R4;'#13+
    'MAD R13.xyz, -R4.w, R3, -R4;'#13+
    'MUL R1, R1.x, c[52];'#13+
    'MUL R5.w, R8.z, R5;'#13+
    'MAD R2, R1, R5.w, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[50];'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R5.w, R1.w;'#13+
    'DP3 R1.w, R13, R13;'#13+
    'MUL R1.xyz, R5.w, R1;'#13+
    'DP3 R5.w, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R13;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'MAX R1.w, R5, c[75].y;'#13+
    'MAX R5.w, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'MUL R1, R1.y, c[52];'#13+
    'POW R12.w, R5.w, c[18].x;'#13+
    'MUL R7.w, R7.y, R6;'#13+
    'SLT R7.x, c[75].y, R8;'#13+
    'MUL R6.w, R7, R7.x;'#13+
    'MAD R2, R1, R6.w, R2;'#13+
    'RCP R1.x, R5.z;'#13+
    'DP3 R1.w, R6, -R4;'#13+
    'MAX R5.z, R1.w, c[75].y;'#13+
    'DP3 R4.x, R4, c[57];'#13+
    'SLT R13.x, c[75].y, R5.z;'#13+
    'MAD R1.z, R1.x, c[55].y, c[55].x;'#13+
    'MUL R1.y, R1.x, c[55].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'POW R1.y, R4.x, c[54].w;'#13+
    'ADD R1.z, -R5.y, c[54].y;'#13+
    'SLT R4.x, c[54].z, R4;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'MUL R7.x, R7.y, R1.z;'#13+
    'ABS R4.x, R4;'#13+
    'SGE R4.x, c[75].y, R4;'#13+
    'MUL R1.z, R7.x, R4.x;'#13+
    'RCP R6.w, R1.x;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R5.w, R6, R1.y;'#13+
    'MUL R1.x, R12.w, R5.w;'#13+
    'MUL R1, R1.x, c[59];'#13+
    'MUL R4.y, R13.x, R7.x;'#13+
    'MAD R2, R1, R4.y, R2;'#13+
    'ADD R4.x, -R5, c[54].y;'#13+
    'ABS R1.y, R4.x;'#13+
    'SGE R4.x, c[75].y, R1.y;'#13+
    'MUL R1.x, R12.w, R6.w;'#13+
    'MUL R12.w, R7.y, R4.x;'#13+
    'MUL R1, R1.x, c[59];'#13+
    'MUL R13.y, R12.w, R13.x;'#13+
    'MAD R2, R1, R13.y, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[57];'#13+
    'ADD R4.xyz, R3, -c[63];'#13+
    'DP3 R13.x, R4, R4;'#13+
    'RSQ R15.y, R13.x;'#13+
    'MUL R4.xyz, R15.y, R4;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'RSQ R14.y, R1.w;'#13+
    'MAD R13.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R1.w, R13, R13;'#13+
    'MUL R1.xyz, R14.y, R1;'#13+
    'DP3 R14.y, -R6, R1;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R1.xyz, R1.w, R13;'#13+
    'DP3 R1.x, R6, R1;'#13+
    'DP3 R13.z, -R6, c[57];'#13+
    'MAX R1.w, R14.y, c[75].y;'#13+
    'MAX R14.z, R13, c[75].y;'#13+
    'MAX R13.x, R1, c[75].y;'#13+
    'POW R1.y, R1.w, c[18].x;'#13+
    'ABS R13.y, c[54];'#13+
    'SGE R13.y, c[75], R13;'#13+
    'MUL R1, R1.y, c[59];'#13+
    'MUL R14.y, R7, R13;'#13+
    'SLT R13.z, c[75].y, R14;'#13+
    'MUL R13.y, R14, R13.z;'#13+
    'MAD R2, R1, R13.y, R2;'#13+
    'RCP R1.x, R15.y;'#13+
    'DP3 R1.w, R4, c[64];'#13+
    'POW R13.x, R13.x, c[18].x;'#13+
    'MAD R1.z, R1.x, c[62].y, c[62].x;'#13+
    'MUL R1.y, R1.x, c[62].z;'#13+
    'MAD R1.x, R1.y, R1, R1.z;'#13+
    'RCP R15.y, R1.x;'#13+
    'DP3 R1.x, R6, -R4;'#13+
    'MAX R16.w, R1.x, c[75].y;'#13+
    'POW R1.y, R1.w, c[61].w;'#13+
    'ADD R1.z, -R5.y, c[61].y;'#13+
    'ADD R4.y, -R5.x, c[61];'#13+
    'SLT R1.w, c[61].z, R1;'#13+
    'ABS R1.z, R1;'#13+
    'SGE R1.z, c[75].y, R1;'#13+
    'ABS R1.w, R1;'#13+
    'MUL R15.z, R7.y, R1;'#13+
    'SGE R1.w, c[75].y, R1;'#13+
    'MUL R1.z, R15, R1.w;'#13+
    'MAD R1.y, -R1, R1.z, R1;'#13+
    'MUL R15.w, R15.y, R1.y;'#13+
    'MUL R1.y, R13.x, R15.w;'#13+
    'SLT R4.x, c[75].y, R16.w;'#13+
    'MUL R1, R1.y, c[66];'#13+
    'MUL R4.z, R4.x, R15;'#13+
    'MAD R2, R1, R4.z, R2;'#13+
    'ABS R4.y, R4;'#13+
    'SGE R1.y, c[75], R4;'#13+
    'MUL R18.z, R7.y, R1.y;'#13+
    'MUL R1.x, R13, R15.y;'#13+
    'MUL R1, R1.x, c[66];'#13+
    'MUL R4.x, R18.z, R4;'#13+
    'MAD R2, R1, R4.x, R2;'#13+
    'MAD R1.xyz, -R4.w, R3, c[64];'#13+
    'ADD R4.xyz, R3, -c[70];'#13+
    'DP3 R1.w, R4, R4;'#13+
    'RSQ R19.z, R1.w;'#13+
    'DP3 R13.x, R1, R1;'#13+
    'RSQ R1.w, R13.x;'#13+
    'MUL R13.xyz, R1.w, R1;'#13+
    'MUL R4.xyz, R19.z, R4;'#13+
    'MAD R1.xyz, -R4.w, R3, -R4;'#13+
    'DP3 R13.x, -R6, R13;'#13+
    'DP3 R1.w, R1, R1;'#13+
    'MAX R13.x, R13, c[75].y;'#13+
    'POW R19.x, R13.x, c[18].x;'#13+
    'RSQ R1.w, R1.w;'#13+
    'MUL R13.xyz, R1.w, R1;'#13+
    'MUL R1, R19.x, c[66];'#13+
    'ABS R19.x, c[61].y;'#13+
    'SGE R19.x, c[75].y, R19;'#13+
    'MAD R3.xyz, -R4.w, R3, c[71];'#13+
    'MUL R19.x, R7.y, R19;'#13+
    'SLT R19.w, c[75].y, R19.y;'#13+
    'MUL R19.w, R19.x, R19;'#13+
    'MAD R1, R1, R19.w, R2;'#13+
    'RCP R2.y, R19.z;'#13+
    'DP3 R2.x, R6, R13;'#13+
    'MAX R2.x, R2, c[75].y;'#13+
    'MAD R2.w, R2.y, c[69].y, c[69].x;'#13+
    'MUL R2.z, R2.y, c[69];'#13+
    'MAD R2.y, R2.z, R2, R2.w;'#13+
    'DP3 R2.z, R4, c[71];'#13+
    'RCP R13.x, R2.y;'#13+
    'ADD R2.w, -R5.y, c[68].y;'#13+
    'POW R2.x, R2.x, c[18].x;'#13+
    'MUL R19.z, R2.x, R13.x;'#13+
    'POW R2.y, R2.z, c[68].w;'#13+
    'SLT R5.y, c[68].z, R2.z;'#13+
    'ABS R2.z, R2.w;'#13+
    'ABS R2.w, R5.y;'#13+
    'SGE R2.z, c[75].y, R2;'#13+
    'MUL R5.y, R7, R2.z;'#13+
    'SGE R2.w, c[75].y, R2;'#13+
    'MUL R2.z, R5.y, R2.w;'#13+
    'MAD R2.z, -R2.y, R2, R2.y;'#13+
    'DP3 R2.y, R6, -R4;'#13+
    'MUL R13.z, R13.x, R2;'#13+
    'MAX R13.y, R2, c[75];'#13+
    'SLT R4.x, c[75].y, R13.y;'#13+
    'ADD R4.z, -R5.x, c[68].y;'#13+
    'MUL R2.x, R2, R13.z;'#13+
    'ABS R4.z, R4;'#13+
    'MUL R4.y, R4.x, R5;'#13+
    'MUL R2, R2.x, c[73];'#13+
    'MAD R2, R2, R4.y, R1;'#13+
    'DP3 R4.y, R3, R3;'#13+
    'RSQ R4.y, R4.y;'#13+
    'MUL R3.xyz, R4.y, R3;'#13+
    'DP3 R3.x, -R6, R3;'#13+
    'DP3 R6.y, -R6, c[71];'#13+
    'MAX R6.y, R6, c[75];'#13+
    'ABS R6.x, c[68].y;'#13+
    'SGE R6.x, c[75].y, R6;'#13+
    'MUL R1, R19.z, c[73];'#13+
    'SGE R4.z, c[75].y, R4;'#13+
    'MUL R19.z, R7.y, R4;'#13+
    'MUL R3.y, R19.z, R4.x;'#13+
    'MAD R4, R1, R3.y, R2;'#13+
    'MAX R2.x, R3, c[75].y;'#13+
    'MUL R6.x, R7.y, R6;'#13+
    'SLT R6.z, c[75].y, R6.y;'#13+
    'MUL R1, R18.w, c[23];'#13+
    'POW R3.x, R2.x, c[18].x;'#13+
    'MUL R2, R3.w, R1;'#13+
    'MUL R6.z, R6.x, R6;'#13+
    'MUL R3, R3.x, c[73];'#13+
    'MAD R3, R3, R6.z, R4;'#13+
    'MUL R2, R18.y, R2;'#13+
    'MUL R1, R18.x, R1;'#13+
    'MAD R4, R17.w, R1, R2;'#13+
    'MUL R2, R17.y, c[23];'#13+
    'MAD R4, R17.x, R2, R4;'#13+
    'MUL R1, R17.z, c[30];'#13+
    'MUL R2, R16.z, R1;'#13+
    'MAD R2, R16.y, R2, R4;'#13+
    'MUL R1, R16.x, R1;'#13+
    'MAD R4, R15.x, R1, R2;'#13+
    'MUL R2, R14.x, c[30];'#13+
    'MAD R4, R13.w, R2, R4;'#13+
    'MUL R1, R14.w, c[37];'#13+
    'MUL R2, R12.z, R1;'#13+
    'MAD R2, R12.y, R2, R4;'#13+
    'MUL R1, R11.w, R1;'#13+
    'MAD R1, R12.x, R1, R2;'#13+
    'MUL R4, R11.z, c[37];'#13+
    'MUL R2, R10.z, c[44];'#13+
    'MAD R1, R11.y, R4, R1;'#13+
    'MUL R4, R11.x, R2;'#13+
    'MAD R1, R10.w, R4, R1;'#13+
    'MUL R2, R10.x, R2;'#13+
    'MAD R1, R10.y, R2, R1;'#13+
    'MUL R4, R9.w, c[44];'#13+
    'MUL R2, R8.w, c[51];'#13+
    'MAD R1, R9.z, R4, R1;'#13+
    'MUL R4, R9.y, R2;'#13+
    'MAD R1, R9.x, R4, R1;'#13+
    'MUL R2, R8.y, R2;'#13+
    'MAD R1, R8.z, R2, R1;'#13+
    'MUL R4, R8.x, c[51];'#13+
    'MUL R2, R5.z, c[58];'#13+
    'MAD R1, R7.w, R4, R1;'#13+
    'MUL R4, R5.w, R2;'#13+
    'MAD R1, R7.x, R4, R1;'#13+
    'MUL R2, R6.w, R2;'#13+
    'MAD R1, R12.w, R2, R1;'#13+
    'MUL R4, R14.z, c[58];'#13+
    'MUL R2, R16.w, c[65];'#13+
    'MAD R1, R14.y, R4, R1;'#13+
    'MUL R4, R15.w, R2;'#13+
    'MAD R1, R15.z, R4, R1;'#13+
    'MUL R2, R15.y, R2;'#13+
    'MAD R1, R18.z, R2, R1;'#13+
    'MUL R4, R19.y, c[65];'#13+
    'MUL R2, R13.y, c[72];'#13+
    'MAD R1, R19.x, R4, R1;'#13+
    'MUL R4, R13.z, R2;'#13+
    'MAD R1, R5.y, R4, R1;'#13+
    'MUL R2, R13.x, R2;'#13+
    'MAD R2, R19.z, R2, R1;'#13+
    'MUL R4, R6.y, c[72];'#13+
    'MAD R4, R6.x, R4, R2;'#13+
    'ADD R2.x, -R5, c[12].y;'#13+
    'MOV R1, c[32];'#13+
    'ADD R1, R1, c[25];'#13+
    'ADD R1, R1, c[39];'#13+
    'ABS R2.x, R2;'#13+
    'ADD R1, R1, c[46];'#13+
    'SGE R2.x, c[75].y, R2;'#13+
    'ABS R2.x, R2;'#13+
    'SGE R5.x, c[75].y, R2;'#13+
    'ADD R1, R1, c[53];'#13+
    'ADD R1, R1, c[60];'#13+
    'MUL R2, vertex.color, c[14];'#13+
    'MUL R6.x, R7.z, R5;'#13+
    'ADD R5, -R2, c[14];'#13+
    'MAD R5, R5, R6.x, R2;'#13+
    'ADD R2, R1, c[67];'#13+
    'ADD R2, R2, c[74];'#13+
    'MOV R1.xyz, c[17];'#13+
    'MOV R1.w, c[75].x;'#13+
    'ADD R1, R1, -R5;'#13+
    'MAD R1, R7.y, R1, R5;'#13+
    'MUL R2, R2, c[16];'#13+
    'MAD R2, R7.y, R2, R1;'#13+
    'MUL R1, R4, c[14];'#13+
    'MAD R2, R7.y, R1, R2;'#13+
    'MUL R1, R3, c[15];'#13+
    'MAD R1, R1, R7.y, R2;'#13+
    'MIN R2, R1, c[75].x;'#13+
    'MAX R2, R2, c[75].y;'#13+
    'ADD R2, R2, -R1;'#13+
    'MAD result.color, R2, R7.y, R1;'#13+
    'DP4 result.position.w, R0, c[3];'#13+
    'DP4 result.position.z, R0, c[2];'#13+
    'DP4 result.position.y, R0, c[1];'#13+
    'DP4 result.position.x, R0, c[0];'#13+
    'MOV result.texcoord[0].xy, vertex.texcoord[0];'#13+
    'END';
  GLES_GLSLV_NoLight: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void main() {'#13+
    '  gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    '  if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    } '#13+
    '  } else {'#13+
    '    COLOR0 = vec4(VSParam17.xyz, 1.0);'#13+
    '  }'#13+
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  GLES_GLSLV_1Light: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'uniform vec4 VSParam19;'#13+ // ligth1 Opts
    'uniform vec4 VSParam20;'#13+ // light1 Attn
    'uniform vec4 VSParam21;'#13+ // light1 Pos
    'uniform vec4 VSParam22;'#13+ // light1 Dir
    'uniform vec4 VSParam23;'#13+ // light1 Diffuse
    'uniform vec4 VSParam24;'#13+ // light1 Specular
    'uniform vec4 VSParam25;'#13+ // light1 Ambient

    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void Lighting(vec3 normal, vec3 eyeDir, vec3 lightDir, vec4 lightColor, vec4 lightSpecularColor, float attenuation) {'#13+
    '	float NdotL = max(dot(normal, lightDir), 0.0);'#13+
    '	DiffuseLight += NdotL * lightColor * attenuation;'#13+
    '	if (NdotL > 0.0) {'#13+
    '   vec3 halfVector = normalize(lightDir + eyeDir);'#13+
    '   float NdotH = max(0.0, dot(normal, halfVector));'#13+
    '   float specular = pow(NdotH, VSParam18.x);'#13+
    '   SpecularLight += lightSpecularColor * (specular * attenuation);'#13+
    ' }'#13+  
    '}'#13+
    
    'void DirectionalLight(vec3 normal, vec3 vertexPos, vec4 LDir, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 eyeDir = -normalize(vertexPos);'#13+
    ' Lighting(-normal, eyeDir, LDir.xyz, LDiffuse, LSpecular, 1.0);'#13+
    '}'#13+
    
    'void PointLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LAttn, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 vp = vertexPos - LPos.xyz;'#13+
    ' float d = length(vp);'#13+
    '	vec3 lightDir = -normalize(vp);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+

    'void SpotLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LDir, vec4 LAttn, vec4 LOpts, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 VP = vertexPos - LPos.xyz;'#13+
    ' float d = length(VP);'#13+
    '	vec3 lightDir = -normalize(VP);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    '	float spotDot = dot(-lightDir, LDir.xyz);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	float spotattenuation;'#13+
    '	if (spotDot > LOpts.z) {'#13+
    '     	  spotattenuation = pow(spotDot, LOpts.w);'#13+
    '	} else {'#13+
    '          spotattenuation = 0.0;'#13+
    '        }'#13+
    ' attenuation *= spotattenuation;'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+  

    'void main() {'#13+
    ' gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    ' DiffuseLight = vec4(0.0);'#13+
    ' SpecularLight = vec4(0.0);'#13+
    ' AmbientLight = vec4(0.0);'#13+
    ' if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    }'#13+
    ' } else {'#13+  
    '    vec3 normal = normalize((VSParam8 * vec4(a_normal, 0)).xyz);'#13+
    '    vec3 ecPosition = (VSParam4 * vec4(a_position, 1.0)).xyz;'#13+
    // light 1
    '    if (VSParam19.x > 0.0) {'#13+
    '      if (VSParam19.y == 0.0)'#13+
    '        DirectionalLight(normal, ecPosition, VSParam22, VSParam23, VSParam24);'#13+
    '      if (VSParam19.y == 1.0)'#13+
    '        PointLight(normal, ecPosition, VSParam21, VSParam20, VSParam23, VSParam24);'#13+
    '      if (VSParam19.y == 2.0)'#13+
    '        SpotLight(normal, ecPosition, VSParam21, VSParam22, VSParam20, VSParam19, VSParam23, VSParam24);'#13+
    '      AmbientLight += VSParam25;'#13+
    '    }'#13+ 
    
    '    COLOR0 = vec4(VSParam17.xyz, 1);'#13+
    '    COLOR0 += AmbientLight * VSParam16 + DiffuseLight * VSParam14 + SpecularLight * VSParam15;'#13+
    '    COLOR0 = clamp(COLOR0, 0.0, 1.0 );'#13+
  
    '  }'#13+ 
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  GLES_GLSLV_2Light: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'uniform vec4 VSParam19;'#13+ // ligth1 Opts
    'uniform vec4 VSParam20;'#13+ // light1 Attn
    'uniform vec4 VSParam21;'#13+ // light1 Pos
    'uniform vec4 VSParam22;'#13+ // light1 Dir
    'uniform vec4 VSParam23;'#13+ // light1 Diffuse
    'uniform vec4 VSParam24;'#13+ // light1 Specular
    'uniform vec4 VSParam25;'#13+ // light1 Ambient

    'uniform vec4 VSParam26;'#13+ // ligth2 Opts
    'uniform vec4 VSParam27;'#13+ // light2 Attn
    'uniform vec4 VSParam28;'#13+ // light2 Pos
    'uniform vec4 VSParam29;'#13+ // light2 Dir
    'uniform vec4 VSParam30;'#13+ // light2 Diffuse
    'uniform vec4 VSParam31;'#13+ // light2 Specular
    'uniform vec4 VSParam32;'#13+ // light2 Ambient

    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void Lighting(vec3 normal, vec3 eyeDir, vec3 lightDir, vec4 lightColor, vec4 lightSpecularColor, float attenuation) {'#13+
    '	float NdotL = max(dot(normal, lightDir), 0.0);'#13+
    '	DiffuseLight += NdotL * lightColor * attenuation;'#13+
    '	if (NdotL > 0.0) {'#13+
    '   vec3 halfVector = normalize(lightDir + eyeDir);'#13+
    '   float NdotH = max(0.0, dot(normal, halfVector));'#13+
    '   float specular = pow(NdotH, VSParam18.x);'#13+
    '   SpecularLight += lightSpecularColor * (specular * attenuation);'#13+
    ' }'#13+  
    '}'#13+
    
    'void DirectionalLight(vec3 normal, vec3 vertexPos, vec4 LDir, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 eyeDir = -normalize(vertexPos);'#13+
    ' Lighting(-normal, eyeDir, LDir.xyz, LDiffuse, LSpecular, 1.0);'#13+
    '}'#13+
    
    'void PointLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LAttn, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 vp = vertexPos - LPos.xyz;'#13+
    ' float d = length(vp);'#13+
    '	vec3 lightDir = -normalize(vp);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+

    'void SpotLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LDir, vec4 LAttn, vec4 LOpts, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 VP = vertexPos - LPos.xyz;'#13+
    ' float d = length(VP);'#13+
    '	vec3 lightDir = -normalize(VP);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    '	float spotDot = dot(-lightDir, LDir.xyz);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	float spotattenuation;'#13+
    '	if (spotDot > LOpts.z) {'#13+
    '     	  spotattenuation = pow(spotDot, LOpts.w);'#13+
    '	} else {'#13+
    '          spotattenuation = 0.0;'#13+
    '        }'#13+
    ' attenuation *= spotattenuation;'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+ 

    'void main() {'#13+
    '  gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    ' DiffuseLight = vec4(0.0);'#13+
    ' SpecularLight = vec4(0.0);'#13+
    ' AmbientLight = vec4(0.0);'#13+
    ' if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    }'#13+
    '  } else'#13+  
    '  {'#13+
    '    vec3 normal = normalize((VSParam8 * vec4(a_normal, 0)).xyz);'#13+
    '    vec3 ecPosition = (VSParam4 * vec4(a_position, 1.0)).xyz;'#13+
    // light 0
    '  if (VSParam19.x > 0.0) {'#13+
    '    if (VSParam19.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam22, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam21, VSParam20, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam21, VSParam22, VSParam20, VSParam19, VSParam23, VSParam24);'#13+
    '    AmbientLight += VSParam25;'#13+
    '  }'#13+
    // light 1
    '  if (VSParam26.x > 0.0) {'#13+
    '    if (VSParam26.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam29, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam28, VSParam27, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam28, VSParam29, VSParam27, VSParam26, VSParam30, VSParam31);'#13+
    '    AmbientLight += VSParam32;'#13+
    '  }'#13+
    
    '    COLOR0 = vec4(VSParam17.xyz, 1);'#13+
    '    COLOR0 += AmbientLight * VSParam16 + DiffuseLight * VSParam14 + SpecularLight * VSParam15;'#13+
    '  COLOR0 = clamp(COLOR0, 0.0, 1.0 );'#13+

    '  }'#13+ 
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  GLES_GLSLV_3Light: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'uniform vec4 VSParam19;'#13+ // ligth1 Opts
    'uniform vec4 VSParam20;'#13+ // light1 Attn
    'uniform vec4 VSParam21;'#13+ // light1 Pos
    'uniform vec4 VSParam22;'#13+ // light1 Dir
    'uniform vec4 VSParam23;'#13+ // light1 Diffuse
    'uniform vec4 VSParam24;'#13+ // light1 Specular
    'uniform vec4 VSParam25;'#13+ // light1 Ambient

    'uniform vec4 VSParam26;'#13+ // ligth2 Opts
    'uniform vec4 VSParam27;'#13+ // light2 Attn
    'uniform vec4 VSParam28;'#13+ // light2 Pos
    'uniform vec4 VSParam29;'#13+ // light2 Dir
    'uniform vec4 VSParam30;'#13+ // light2 Diffuse
    'uniform vec4 VSParam31;'#13+ // light2 Specular
    'uniform vec4 VSParam32;'#13+ // light2 Ambient

    'uniform vec4 VSParam33;'#13+ // ligth3 Opts
    'uniform vec4 VSParam34;'#13+ // light3 Attn
    'uniform vec4 VSParam35;'#13+ // light3 Pos
    'uniform vec4 VSParam36;'#13+ // light3 Dir
    'uniform vec4 VSParam37;'#13+ // light3 Diffuse
    'uniform vec4 VSParam38;'#13+ // light3 Specular
    'uniform vec4 VSParam39;'#13+ // light3 Ambient

    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void Lighting(vec3 normal, vec3 eyeDir, vec3 lightDir, vec4 lightColor, vec4 lightSpecularColor, float attenuation) {'#13+
    '	float NdotL = max(dot(normal, lightDir), 0.0);'#13+
    '	DiffuseLight += NdotL * lightColor * attenuation;'#13+
    '	if (NdotL > 0.0) {'#13+
    '   vec3 halfVector = normalize(lightDir + eyeDir);'#13+
    '   float NdotH = max(0.0, dot(normal, halfVector));'#13+
    '   float specular = pow(NdotH, VSParam18.x);'#13+
    '   SpecularLight += lightSpecularColor * (specular * attenuation);'#13+
    ' }'#13+  
    '}'#13+
    
    'void DirectionalLight(vec3 normal, vec3 vertexPos, vec4 LDir, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 eyeDir = -normalize(vertexPos);'#13+
    ' Lighting(-normal, eyeDir, LDir.xyz, LDiffuse, LSpecular, 1.0);'#13+
    '}'#13+
    
    'void PointLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LAttn, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 vp = vertexPos - LPos.xyz;'#13+
    ' float d = length(vp);'#13+
    '	vec3 lightDir = -normalize(vp);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+

    'void SpotLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LDir, vec4 LAttn, vec4 LOpts, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 VP = vertexPos - LPos.xyz;'#13+
    ' float d = length(VP);'#13+
    '	vec3 lightDir = -normalize(VP);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    '	float spotDot = dot(-lightDir, LDir.xyz);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	float spotattenuation;'#13+
    '	if (spotDot > LOpts.z) {'#13+
    '     	  spotattenuation = pow(spotDot, LOpts.w);'#13+
    '	} else {'#13+
    '          spotattenuation = 0.0;'#13+
    '        }'#13+
    ' attenuation *= spotattenuation;'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+ 

    'void main() {'#13+
    '  gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    ' DiffuseLight = vec4(0.0);'#13+
    ' SpecularLight = vec4(0.0);'#13+
    ' AmbientLight = vec4(0.0);'#13+
    ' if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    }'#13+
    '  } else'#13+  
    '  {'#13+
    '    vec3 normal = normalize((VSParam8 * vec4(a_normal, 0)).xyz);'#13+
    '    vec3 ecPosition = (VSParam4 * vec4(a_position, 1.0)).xyz;'#13+
    // light 1
    '  if (VSParam19.x > 0.0) {'#13+
    '    if (VSParam19.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam22, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam21, VSParam20, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam21, VSParam22, VSParam20, VSParam19, VSParam23, VSParam24);'#13+
    '    AmbientLight += VSParam25;'#13+
    '  }'#13+
    // light 2
    '  if (VSParam26.x > 0.0) {'#13+
    '    if (VSParam26.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam29, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam28, VSParam27, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam28, VSParam29, VSParam27, VSParam26, VSParam30, VSParam31);'#13+
    '    AmbientLight += VSParam32;'#13+
    '  }'#13+
    // light 3
    '  if (VSParam33.x > 0.0) {'#13+
    '    if (VSParam33.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam36, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam35, VSParam34, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam35, VSParam36, VSParam34, VSParam33, VSParam37, VSParam38);'#13+
    '    AmbientLight += VSParam39;'#13+
    '  }'#13+  
    
    '    COLOR0 = vec4(VSParam17.xyz, 1);'#13+
    '    COLOR0 += AmbientLight * VSParam16 + DiffuseLight * VSParam14 + SpecularLight * VSParam15;'#13+
    '  COLOR0 = clamp(COLOR0, 0.0, 1.0 );'#13+

    '  }'#13+ 
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  GLES_GLSLV_4Light: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'uniform vec4 VSParam19;'#13+ // ligth1 Opts
    'uniform vec4 VSParam20;'#13+ // light1 Attn
    'uniform vec4 VSParam21;'#13+ // light1 Pos
    'uniform vec4 VSParam22;'#13+ // light1 Dir
    'uniform vec4 VSParam23;'#13+ // light1 Diffuse
    'uniform vec4 VSParam24;'#13+ // light1 Specular
    'uniform vec4 VSParam25;'#13+ // light1 Ambient

    'uniform vec4 VSParam26;'#13+ // ligth2 Opts
    'uniform vec4 VSParam27;'#13+ // light2 Attn
    'uniform vec4 VSParam28;'#13+ // light2 Pos
    'uniform vec4 VSParam29;'#13+ // light2 Dir
    'uniform vec4 VSParam30;'#13+ // light2 Diffuse
    'uniform vec4 VSParam31;'#13+ // light2 Specular
    'uniform vec4 VSParam32;'#13+ // light2 Ambient

    'uniform vec4 VSParam33;'#13+ // ligth3 Opts
    'uniform vec4 VSParam34;'#13+ // light3 Attn
    'uniform vec4 VSParam35;'#13+ // light3 Pos
    'uniform vec4 VSParam36;'#13+ // light3 Dir
    'uniform vec4 VSParam37;'#13+ // light3 Diffuse
    'uniform vec4 VSParam38;'#13+ // light3 Specular
    'uniform vec4 VSParam39;'#13+ // light3 Ambient

    'uniform vec4 VSParam40;'#13+ // ligth4 Opts
    'uniform vec4 VSParam41;'#13+ // light4 Attn
    'uniform vec4 VSParam42;'#13+ // light4 Pos
    'uniform vec4 VSParam43;'#13+ // light4 Dir
    'uniform vec4 VSParam44;'#13+ // light4 Diffuse
    'uniform vec4 VSParam45;'#13+ // light4 Specular
    'uniform vec4 VSParam46;'#13+ // light4 Ambient
    
    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void Lighting(vec3 normal, vec3 eyeDir, vec3 lightDir, vec4 lightColor, vec4 lightSpecularColor, float atten) {'#13+
    '	float NdotL = max(0.0, dot(normal, lightDir));'#13+
    '	DiffuseLight += lightColor * NdotL * atten;'#13+
    '	if (NdotL > 0.0) {'#13+
    '   vec3 halfVector = normalize(lightDir + eyeDir);'#13+
    '   float NdotH = max(0.0, dot(normal, halfVector));'#13+
    '   float specular = pow(NdotH, VSParam18.x);'#13+
    '   SpecularLight += lightSpecularColor * specular * atten;'#13+
    ' }'#13+  
    '}'#13+
    
    'void DirectionalLight(vec3 normal, vec3 vertexPos, vec4 LDir, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 eyeDir = -normalize(vertexPos);'#13+
    ' Lighting(-normal, eyeDir, LDir.xyz, LDiffuse, LSpecular, 1.0);'#13+
    '}'#13+
    
    'void PointLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LAttn, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 vp = vertexPos - LPos.xyz;'#13+
    ' float d = length(vp);'#13+
    '	vec3 lightDir = -normalize(vp);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+

    'void SpotLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LDir, vec4 LAttn, vec4 LOpts, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 VP = vertexPos - LPos.xyz;'#13+
    ' float d = length(VP);'#13+
    '	vec3 lightDir = -normalize(VP);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    '	float spotDot = dot(-lightDir, LDir.xyz);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	float spotattenuation;'#13+
    '	if (spotDot > LOpts.z) {'#13+
    '     	  spotattenuation = pow(spotDot, LOpts.w);'#13+
    '	} else {'#13+
    '          spotattenuation = 0.0;'#13+
    '        }'#13+
    ' attenuation *= spotattenuation;'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+ 

    'void main() {'#13+
    ' gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    ' DiffuseLight = vec4(0.0);'#13+
    ' SpecularLight = vec4(0.0);'#13+
    ' AmbientLight = vec4(0.0);'#13+
    ' if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    }'#13+
    '  } else {'#13+  
    '    vec3 normal = normalize((VSParam8 * vec4(a_normal, 0)).xyz);'#13+
    '    vec3 ecPosition = (VSParam4 * vec4(a_position, 1.0)).xyz;'#13+
    // light 1
    '  if (VSParam19.x > 0.0) {'#13+
    '    if (VSParam19.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam22, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam21, VSParam20, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam21, VSParam22, VSParam20, VSParam19, VSParam23, VSParam24);'#13+
    '    AmbientLight += VSParam25;'#13+
    '  }'#13+
    // light 2
    '  if (VSParam26.x > 0.0) {'#13+
    '    if (VSParam26.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam29, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam28, VSParam27, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam28, VSParam29, VSParam27, VSParam26, VSParam30, VSParam31);'#13+
    '    AmbientLight += VSParam32;'#13+
    '  }'#13+
    // light 3
    '  if (VSParam33.x > 0.0) {'#13+
    '    if (VSParam33.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam36, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam35, VSParam34, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam35, VSParam36, VSParam34, VSParam33, VSParam37, VSParam38);'#13+
    '    AmbientLight += VSParam39;'#13+
    '  }'#13+  
    // light 4
    '  if (VSParam40.x > 0.0) {'#13+
    '    if (VSParam40.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam43, VSParam44, VSParam45);'#13+
    '    if (VSParam40.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam42, VSParam41, VSParam44, VSParam45);'#13+
    '    if (VSParam40.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam42, VSParam43, VSParam41, VSParam40, VSParam44, VSParam45);'#13+
    '    AmbientLight += VSParam46;'#13+
    '  }'#13+  
    
    '  COLOR0 = vec4(VSParam17.xyz, 1.0);'#13+
    '  COLOR0 += (AmbientLight * VSParam16);'#13+
    '  COLOR0 += (DiffuseLight * VSParam14);'#13+
    '  COLOR0 += (SpecularLight * VSParam15);'#13+
    '  COLOR0 = clamp(COLOR0, 0.0, 1.0 );'#13+
    '  }'#13+ 
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  GLES_GLSLV_Full: PAnsiChar = 
    'attribute vec3 a_position;'#13+
    'attribute vec3 a_normal;'#13+
    'attribute vec4 a_color;'#13+
    'attribute vec2 a_texcoord0;'#13+

    'varying vec4 COLOR0;'#13+
    'varying vec4 TEX0;'#13+

    'uniform mat4 VSParam0;'#13+ // MPVMatrix
    'uniform mat4 VSParam4;'#13+ // ModelView
    'uniform mat4 VSParam8;'#13+ // ModelViewIT

    'uniform vec4 VSParam12;'#13+ // options
    'uniform vec4 VSParam13;'#13+ // reserver

    'uniform vec4 VSParam14;'#13+ // material diffuse
    'uniform vec4 VSParam15;'#13+ // material specular
    'uniform vec4 VSParam16;'#13+ // material ambient
    'uniform vec4 VSParam17;'#13+ // material emission
    'uniform vec4 VSParam18;'#13+ // material opts
    
    'uniform vec4 VSParam19;'#13+ // ligth1 Opts
    'uniform vec4 VSParam20;'#13+ // light1 Attn
    'uniform vec4 VSParam21;'#13+ // light1 Pos
    'uniform vec4 VSParam22;'#13+ // light1 Dir
    'uniform vec4 VSParam23;'#13+ // light1 Diffuse
    'uniform vec4 VSParam24;'#13+ // light1 Specular
    'uniform vec4 VSParam25;'#13+ // light1 Ambient

    'uniform vec4 VSParam26;'#13+ // ligth2 Opts
    'uniform vec4 VSParam27;'#13+ // light2 Attn
    'uniform vec4 VSParam28;'#13+ // light2 Pos
    'uniform vec4 VSParam29;'#13+ // light2 Dir
    'uniform vec4 VSParam30;'#13+ // light2 Diffuse
    'uniform vec4 VSParam31;'#13+ // light2 Specular
    'uniform vec4 VSParam32;'#13+ // light2 Ambient

    'uniform vec4 VSParam33;'#13+ // ligth3 Opts
    'uniform vec4 VSParam34;'#13+ // light3 Attn
    'uniform vec4 VSParam35;'#13+ // light3 Pos
    'uniform vec4 VSParam36;'#13+ // light3 Dir
    'uniform vec4 VSParam37;'#13+ // light3 Diffuse
    'uniform vec4 VSParam38;'#13+ // light3 Specular
    'uniform vec4 VSParam39;'#13+ // light3 Ambient

    'uniform vec4 VSParam40;'#13+ // ligth4 Opts
    'uniform vec4 VSParam41;'#13+ // light4 Attn
    'uniform vec4 VSParam42;'#13+ // light4 Pos
    'uniform vec4 VSParam43;'#13+ // light4 Dir
    'uniform vec4 VSParam44;'#13+ // light4 Diffuse
    'uniform vec4 VSParam45;'#13+ // light4 Specular
    'uniform vec4 VSParam46;'#13+ // light4 Ambient

    'uniform vec4 VSParam47;'#13+ // ligth5 Opts
    'uniform vec4 VSParam48;'#13+ // light5 Attn
    'uniform vec4 VSParam49;'#13+ // light5 Pos
    'uniform vec4 VSParam50;'#13+ // light5 Dir
    'uniform vec4 VSParam51;'#13+ // light5 Diffuse
    'uniform vec4 VSParam52;'#13+ // light5 Specular
    'uniform vec4 VSParam53;'#13+ // light5 Ambient

    'uniform vec4 VSParam54;'#13+ // ligth6 Opts
    'uniform vec4 VSParam55;'#13+ // light6 Attn
    'uniform vec4 VSParam56;'#13+ // light6 Pos
    'uniform vec4 VSParam57;'#13+ // light6 Dir
    'uniform vec4 VSParam58;'#13+ // light6 Diffuse
    'uniform vec4 VSParam59;'#13+ // light6 Specular
    'uniform vec4 VSParam60;'#13+ // light6 Ambient

    'uniform vec4 VSParam61;'#13+ // ligth7 Opts
    'uniform vec4 VSParam62;'#13+ // light7 Attn
    'uniform vec4 VSParam63;'#13+ // light7 Pos
    'uniform vec4 VSParam64;'#13+ // light7 Dir
    'uniform vec4 VSParam65;'#13+ // light7 Diffuse
    'uniform vec4 VSParam66;'#13+ // light7 Specular
    'uniform vec4 VSParam67;'#13+ // light7 Ambient

    'uniform vec4 VSParam68;'#13+ // ligth8 Opts
    'uniform vec4 VSParam69;'#13+ // light8 Attn
    'uniform vec4 VSParam70;'#13+ // light8 Pos
    'uniform vec4 VSParam71;'#13+ // light8 Dir
    'uniform vec4 VSParam72;'#13+ // light8 Diffuse
    'uniform vec4 VSParam73;'#13+ // light8 Specular
    'uniform vec4 VSParam74;'#13+ // light8 Ambient
    
    'vec4 DiffuseLight;'#13+
    'vec4 SpecularLight;'#13+
    'vec4 AmbientLight;'#13+

    'void Lighting(vec3 normal, vec3 eyeDir, vec3 lightDir, vec4 lightColor, vec4 lightSpecularColor, float atten) {'#13+
    '	float NdotL = max(0.0, dot(normal, lightDir));'#13+
    '	DiffuseLight += lightColor * NdotL * atten;'#13+
    '	if (NdotL > 0.0) {'#13+
    '   vec3 halfVector = normalize(lightDir + eyeDir);'#13+
    '   float NdotH = max(0.0, dot(normal, halfVector));'#13+
    '   float specular = pow(NdotH, VSParam18.x);'#13+
    '   SpecularLight += lightSpecularColor * specular * atten;'#13+
    ' }'#13+  
    '}'#13+
    
    'void DirectionalLight(vec3 normal, vec3 vertexPos, vec4 LDir, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 eyeDir = -normalize(vertexPos);'#13+
    ' Lighting(-normal, eyeDir, LDir.xyz, LDiffuse, LSpecular, 1.0);'#13+
    '}'#13+
    
    'void PointLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LAttn, vec4 LDiffuse, vec4 LSpecular){'#13+
    ' vec3 vp = vertexPos - LPos.xyz;'#13+
    ' float d = length(vp);'#13+
    '	vec3 lightDir = -normalize(vp);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+

    'void SpotLight(vec3 normal, vec3 vertexPos,   vec4 LPos, vec4 LDir, vec4 LAttn, vec4 LOpts, vec4 LDiffuse, vec4 LSpecular) {'#13+
    ' vec3 VP = vertexPos - LPos.xyz;'#13+
    ' float d = length(VP);'#13+
    '	vec3 lightDir = -normalize(VP);'#13+
    '	vec3 eyeDir = -normalize(vertexPos);'#13+
    '	float spotDot = dot(-lightDir, LDir.xyz);'#13+
    ' float attenuation = 1.0 / (LAttn.x + LAttn.y * d + LAttn.z * d * d);'#13+
    '	float spotattenuation;'#13+
    '	if (spotDot > LOpts.z) {'#13+
    '     	  spotattenuation = pow(spotDot, LOpts.w);'#13+
    '	} else {'#13+
    '          spotattenuation = 0.0;'#13+
    '        }'#13+
    ' attenuation *= spotattenuation;'#13+
    '	Lighting(normal, eyeDir, lightDir, LDiffuse, LSpecular, attenuation);'#13+
    '}'#13+ 

    'void main() {'#13+
    ' gl_Position = VSParam0 * vec4(a_position, 1.0);'#13+
    ' DiffuseLight = vec4(0.0);'#13+
    ' SpecularLight = vec4(0.0);'#13+
    ' AmbientLight = vec4(0.0);'#13+
    ' if (VSParam12.x == 0.0) {'#13+
    '    if (VSParam12.y == 1.0) {'#13+
    '      COLOR0 = a_color * VSParam14;'#13+
    '    } else {'#13+
    '      COLOR0 = VSParam14;'#13+
    '    }'#13+
    '  } else'#13+  
    '  {'#13+
    '    vec3 normal = normalize((VSParam8 * vec4(a_normal, 0)).xyz);'#13+
    '    vec3 ecPosition = (VSParam4 * vec4(a_position, 1.0)).xyz;'#13+
    // light 1
    '  if (VSParam19.x > 0.0) {'#13+
    '    if (VSParam19.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam22, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam21, VSParam20, VSParam23, VSParam24);'#13+
    '    if (VSParam19.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam21, VSParam22, VSParam20, VSParam19, VSParam23, VSParam24);'#13+
    '    AmbientLight += VSParam25;'#13+
    '  }'#13+
    // light 2
    '  if (VSParam26.x > 0.0) {'#13+
    '    if (VSParam26.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam29, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam28, VSParam27, VSParam30, VSParam31);'#13+
    '    if (VSParam26.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam28, VSParam29, VSParam27, VSParam26, VSParam30, VSParam31);'#13+
    '    AmbientLight += VSParam32;'#13+
    '  }'#13+
    // light 3
    '  if (VSParam33.x > 0.0) {'#13+
    '    if (VSParam33.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam36, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam35, VSParam34, VSParam37, VSParam38);'#13+
    '    if (VSParam33.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam35, VSParam36, VSParam34, VSParam33, VSParam37, VSParam38);'#13+
    '    AmbientLight += VSParam39;'#13+
    '  }'#13+  
    // light 4
    '  if (VSParam40.x > 0.0) {'#13+
    '    if (VSParam40.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam43, VSParam44, VSParam45);'#13+
    '    if (VSParam40.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam42, VSParam41, VSParam44, VSParam45);'#13+
    '    if (VSParam40.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam42, VSParam43, VSParam41, VSParam40, VSParam44, VSParam45);'#13+
    '    AmbientLight += VSParam46;'#13+
    '  }'#13+  
    // light 5
    '  if (VSParam47.x > 0.0) {'#13+
    '    if (VSParam47.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam50, VSParam51, VSParam52);'#13+
    '    if (VSParam47.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam49, VSParam48, VSParam51, VSParam52);'#13+
    '    if (VSParam47.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam49, VSParam50, VSParam48, VSParam47, VSParam51, VSParam52);'#13+
    '    AmbientLight += VSParam53;'#13+
    '  }'#13+  
    // light 6
    '  if (VSParam54.x > 0.0) {'#13+
    '    if (VSParam54.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam57, VSParam58, VSParam59);'#13+
    '    if (VSParam54.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam56, VSParam55, VSParam58, VSParam59);'#13+
    '    if (VSParam54.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam56, VSParam57, VSParam55, VSParam54, VSParam58, VSParam59);'#13+
    '    AmbientLight += VSParam60;'#13+
    '  }'#13+  
    // light 7
    '  if (VSParam61.x > 0.0) {'#13+
    '    if (VSParam61.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam64, VSParam65, VSParam66);'#13+
    '    if (VSParam61.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam63, VSParam62, VSParam65, VSParam66);'#13+
    '    if (VSParam61.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam63, VSParam64, VSParam62, VSParam61, VSParam65, VSParam66);'#13+
    '    AmbientLight += VSParam67;'#13+
    '  }'#13+  
    // light 8
    '  if (VSParam68.x > 0.0) {'#13+
    '    if (VSParam68.y == 0.0)'#13+
    '      DirectionalLight(normal, ecPosition, VSParam71, VSParam72, VSParam73);'#13+
    '    if (VSParam68.y == 1.0)'#13+
    '      PointLight(normal, ecPosition, VSParam70, VSParam69, VSParam72, VSParam73);'#13+
    '    if (VSParam68.y == 2.0)'#13+
    '      SpotLight(normal, ecPosition, VSParam70, VSParam71, VSParam69, VSParam68, VSParam72, VSParam73);'#13+
    '    AmbientLight += VSParam74;'#13+
    '  }'#13+   
    
    '  COLOR0 = vec4(VSParam17.xyz, 1.0);'#13+
    '  COLOR0 += (AmbientLight * VSParam16);'#13+
    '  COLOR0 += (DiffuseLight * VSParam14);'#13+
    '  COLOR0 += (SpecularLight * VSParam15);'#13+
    '  COLOR0 = clamp(COLOR0, 0.0, 1.0 );'#13+
    '  }'#13+ 
    '  TEX0 = vec4(a_texcoord0, 0, 0);'#13+
    '}';
  DX9PS2BIN: array [0..411] of byte = (
    $00, $02, $FF, $FF, $FE, $FF, $29, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $7B, $00, $00, $00, $00, $02, $FF, $FF, $02, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $74, $00, $00, $00, 
    $44, $00, $00, $00, $02, $00, $00, $00, $01, $00, $02, $00, $48, $00, $00, $00, $00, $00, $00, $00, $58, $00, $00, $00, $03, $00, $00, $00, $01, $00, $02, $00, $64, $00, $00, $00, $00, $00, $00, $00, 
    $6D, $6F, $00, $AB, $01, $00, $03, $00, $01, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $74, $65, $78, $74, $75, $72, $65, $30, $00, $AB, $AB, $AB, $04, $00, $0C, $00, $01, $00, $01, $00, 
    $01, $00, $00, $00, $00, $00, $00, $00, $70, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65, 
    $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $51, $00, $00, $05, $01, $00, $0F, $A0, $00, $00, $80, $BF, $00, $00, $00, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $02, 
    $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $03, $B0, $1F, $00, $00, $02, $00, $00, $00, $90, $00, $08, $0F, $A0, $42, $00, $00, $03, $00, $00, $0F, $80, 
    $00, $00, $E4, $B0, $00, $08, $E4, $A0, $01, $00, $00, $02, $01, $00, $08, $80, $00, $00, $00, $A0, $02, $00, $00, $03, $01, $00, $01, $80, $01, $00, $FF, $80, $01, $00, $55, $A0, $05, $00, $00, $03, 
    $01, $00, $01, $80, $01, $00, $00, $80, $01, $00, $00, $80, $02, $00, $00, $03, $01, $00, $02, $80, $01, $00, $FF, $80, $01, $00, $00, $A0, $05, $00, $00, $03, $01, $00, $02, $80, $01, $00, $55, $80, 
    $01, $00, $55, $80, $58, $00, $00, $04, $02, $00, $0F, $80, $01, $00, $55, $81, $00, $00, $E4, $80, $00, $00, $E4, $90, $05, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $00, $00, $E4, $90, 
    $58, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $00, $81, $00, $00, $E4, $80, $02, $00, $E4, $80, $05, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $00, $00, $55, $A0, $01, $00, $00, $02, 
    $00, $08, $0F, $80, $00, $00, $E4, $80, $FF, $FF, $00, $00
  );
  ARBFP1: PAnsiChar = 
    '!!ARBfp1.0'#13+
    'PARAM c[3] = { program.local[0..1],'#13+
    '		{ 2, 1 } };'#13+
    'TEMP R0;'#13+
    'TEMP R1;'#13+
    'TEMP R2;'#13+
    'MOV R2.xy, c[2];'#13+
    'ABS R1.x, c[0];'#13+
    'CMP R1, -R1.x, R0, fragment.color.primary;'#13+
    'ADD R2.y, -R2, c[0].x;'#13+
    'ADD R2.x, -R2, c[0];'#13+
    'TEX R0, fragment.texcoord[0], texture[0], 2D;'#13+
    'ABS R2.y, R2;'#13+
    'CMP R1, -R2.y, R1, R0;'#13+
    'MUL R0, fragment.color.primary, R0;'#13+
    'ABS R2.x, R2;'#13+
    'CMP R0, -R2.x, R1, R0;'#13+
    'MUL result.color, R0, c[0].y;'#13+
    'END';
  GLES_GLSLF: PAnsiChar = 
    'uniform sampler2D texture0;'+
    'uniform vec4 PSParam0;'+
    'varying vec4 COLOR0;'+
    'varying vec4 TEX0;'+
    'void main() {'+
    '  if (PSParam0.x == 0.0)'+
    '    gl_FragColor = COLOR0;'+
    '  if (PSParam0.x == 1.0)'+
    '    gl_FragColor = texture2D(texture0, TEX0.xy);'+
    '  if (PSParam0.x == 2.0)'+
    '    gl_FragColor = COLOR0 * texture2D(texture0, TEX0.xy);'+
    '  gl_FragColor *= PSParam0.y;'+ 
    '}';
    
procedure TContext3D.CreateDefaultShaders;
begin    
  FDefaultVS_NoLight := CreateVertexShader(@DX9VS2BIN_NoLight, ARBVP1_NoLight, GLES_GLSLV_NoLight);
  FDefaultVS_1Light := CreateVertexShader(@DX9VS2BIN_1Light, ARBVP1_1Light, GLES_GLSLV_1Light);
  FDefaultVS_2Light := CreateVertexShader(@DX9VS2BIN_2Light, ARBVP1_2Light, GLES_GLSLV_2Light);
  FDefaultVS_3Light := CreateVertexShader(@DX9VS2BIN_3Light, ARBVP1_3Light, GLES_GLSLV_3Light);
  FDefaultVS_4Light := CreateVertexShader(@DX9VS2BIN_4Light, ARBVP1_4Light, GLES_GLSLV_4Light);
  FDefaultVS_Full := CreateVertexShader(@DX9VS2BIN_Full, ARBVP1_Full, GLES_GLSLV_Full);
  FDefaultPS := CreatePixelShader(@DX9PS2BIN, ARBFP1, GLES_GLSLF);
end;

procedure TContext3D.FreeDefaultShaders;
begin
  DestroyPixelShader(FDefaultPS);
  DestroyVertexShader(FDefaultVS_NoLight);
  DestroyVertexShader(FDefaultVS_1Light);
  DestroyVertexShader(FDefaultVS_2Light);
  DestroyVertexShader(FDefaultVS_3Light);
  DestroyVertexShader(FDefaultVS_4Light);
  DestroyVertexShader(FDefaultVS_Full);
end;

procedure TContext3D.SetParams;
type
  TOptions = packed record
    Lighting: Single;
    ColoredVertices: Single;
    z, w: Single;
  end;
  TLightOpts = packed record
    Enabled: Single;
    Kind: Single;
    SpotCosCutoff: Single;
    SpotExponent: Single;
  end;
  TPixelOpts = packed record
    Modulation: Single;
    Opacity: Single;
    z, w: Single;
  end;
var
  MVP, ModelView: TMatrix3D;
  Options: TOptions;
  LightOpts: TLightOpts;
  PixelOpts: TPixelOpts;
  I, CLight: integer;
begin
  // vertex shader  
  if (FCurrentVS = FDefaultVS_NoLight) or (FCurrentVS = FDefaultVS_1Light) or (FCurrentVS = FDefaultVS_2Light) or 
     (FCurrentVS = FDefaultVS_3Light) or (FCurrentVS = FDefaultVS_4Light) or (FCurrentVS = FDefaultVS_Full) then
  begin
    // matrix
    ModelView := FCurrentMatrix;
    if FCurrentStates[TContextState.cs3DScene] then
      MVP := Matrix3DMultiply(CurrentCameraMatrix, CurrentPojectionMatrix)
    else
      MVP := CurrentScreenMatrix;
    MVP := Matrix3DMultiply(ModelView, MVP);
    // MVP
    SetVertexShaderMatrix(0, MVP); 
    // ModelView
    SetVertexShaderMatrix(4, ModelView); 
    InvertMatrix(ModelView);
    TransposeMatrix3D(ModelView);
    // ModelView inverse transpose
    SetVertexShaderMatrix(8, ModelView); 
    // Options
    if FCurrentStates[TContextState.csLightOn] then
      Options.Lighting := 1;
    if FCurrentStates[TContextState.csLightOff] then
      Options.Lighting := 0;
    if FCurrentColoredVertices then
      Options.ColoredVertices := 1
    else
      Options.ColoredVertices := 0;
    Options.z := 0;
    Options.w := 0;
    SetVertexShaderVector(12, TVector3D(Options));
    SetVertexShaderVector(13, Vector3D(0, 0, 0, 0)); 
    // material
    SetVertexShaderVector(14, ColorToVector3D(FCurrentDiffuse)); 
    SetVertexShaderVector(15, ColorToVector3D(FCurrentSpecular)); 
    SetVertexShaderVector(16, ColorToVector3D(FCurrentAmbient)); 
    SetVertexShaderVector(17, ColorToVector3D(FCurrentEmissive)); 
    SetVertexShaderVector(18, Vector3D(FCurrentShininess, 0, 0, 0)); // x - shininess
    // lights
    if FCurrentStates[TContextState.csLightOn] then
    begin
      CLight := 0;
      for i := 0 to Min(MaxLights, FLights.Count) - 1 do
        if TLight(FLights[i]).Enabled then
          with TLight(FLights[i]) do
          begin
            LightOpts.Enabled := 1;
            LightOpts.Kind := Integer(LightType);
            LightOpts.SpotCosCutoff := cos(DegToRad(SpotCutoff));
            LightOpts.SpotExponent := SpotExponent;
            SetVertexShaderVector(19 + (CLight * 7), TVector3D(LightOpts)); // options
            SetVertexShaderVector(20 + (CLight * 7), Vector3D(ConstantAttenuation, LinearAttenuation, QuadraticAttenuation, 0)); // attn
            SetVertexShaderVector(21 + (CLight * 7), AbsolutePosition); // pos
            SetVertexShaderVector(22 + (CLight * 7), AbsoluteDirection); // dir
            SetVertexShaderVector(23 + (CLight * 7), ColorToVector3D(Diffuse)); // diffuse color
            SetVertexShaderVector(24 + (CLight * 7), ColorToVector3D(Specular)); // specular color
            SetVertexShaderVector(25 + (CLight * 7), ColorToVector3D(Ambient)); // ambient color
            Inc(CLight);
          end;
      if CLight < MaxLights then
        for i := CLight to MaxLights - 1 do
          SetVertexShaderVector(19 + (i * 7), Vector3D(0, 0, 0, 0)); // disable 
    end;
  end;
  // pixel shader  
  if FCurrentPS = FDefaultPS then 
  begin
    // modulation, opacity
    if FCurrentStates[TContextState.csTexDisable] then
      PixelOpts.Modulation := 0;
    if FCurrentStates[TContextState.csTexReplace] then
      PixelOpts.Modulation := 1;
    if FCurrentStates[TContextState.csTexModulate] then
      PixelOpts.Modulation := 2;
    PixelOpts.Opacity := FCurrentOpacity;
    PixelOpts.z := 0;
    PixelOpts.w := 0;
    SetPixelShaderVector(0, TVector3D(PixelOpts)); 
  end;
end;

function TContext3D.DoBeginScene: Boolean;
var
  I, LCount: Integer;
begin
  Result := True;
  Fillchar(FCurrentStates, SizeOf(FCurrentStates), 0);
  // apply default shaders
  FCurrentColoredVertices := False;
  FCurrentOpacity := 1;
  FCurrentShininess := 30;
  // set default shaders
  LCount := 0;
  for I := 0 to FLights.Count - 1 do
    if TLight(FLights[i]).Enabled then
      LCount := LCount + 1;
  case LCount of
    0: SetVertexShader(FDefaultVS_NoLight);
    1: SetVertexShader(FDefaultVS_1Light);
    2: SetVertexShader(FDefaultVS_2Light);
    3: SetVertexShader(FDefaultVS_3Light);
    4: SetVertexShader(FDefaultVS_4Light);
  else
    SetVertexShader(FDefaultVS_Full);
  end;
  SetPixelShader(FDefaultPS);
end;

procedure TContext3D.ResetScene;
begin
  SetContextState(TContextState.csGouraud);
  SetContextState(TContextState.cs3DScene);
  SetContextState(TContextState.csZTestOn);
  SetContextState(TContextState.csZWriteOn);
  SetContextState(TContextState.csFrontFace);
  SetContextState(TContextState.csAlphaBlendOn);
  SetContextState(TContextState.csAlphaTestOn);
  SetColor(TMaterialColor.mcAmbient, DefaultAmbient);
  SetColor(TMaterialColor.mcDiffuse, DefaultDiffuse);
  SetColor(TMaterialColor.mcSpecular, DefaultSpecular);
  SetColor(TMaterialColor.mcEmissive, 0);
end;

procedure TContext3D.DoEndScene(const CopyTarget: Boolean = True);
begin
end;

procedure TContext3D.AssignTo(Dest: TPersistent);
begin
  if Dest is TBitmap then
    AssignToBitmap(TBitmap(Dest))
  else
    inherited;
end;

function TContext3D.BeginScene: Boolean;
begin
  if FBeginSceneCount = 0 then
    Result := DoBeginScene
  else
    Result := FBeginSceneCount > 0;
  if Result then
    inc(FBeginSceneCount);
end;

procedure TContext3D.EndScene(const CopyTarget: Boolean);
begin
  if FBeginSceneCount = 1 then
    DoEndScene(CopyTarget);
  if FBeginSceneCount > 0 then
    dec(FBeginSceneCount);
end;

procedure TContext3D.SetMaterial(const AMaterial: TMaterial);
begin
  SetColor(TMaterialColor.mcDiffuse, AMaterial.Diffuse);
  SetColor(TMaterialColor.mcAmbient, AMaterial.Ambient);
  SetColor(TMaterialColor.mcSpecular, AMaterial.Specular);
  SetColor(TMaterialColor.mcEmissive, AMaterial.Emissive);
  FCurrentShininess := AMaterial.Shininess;

  if (AMaterial.Texture.ResourceBitmap <> nil) then
  begin
    SetTextureUnit(0, AMaterial.Texture.ResourceBitmap);
    if AMaterial.Modulation = TTextureMode.tmReplace then
      SetContextState(TContextState.csTexReplace)
    else
      SetContextState(TContextState.csTexModulate);
    if AMaterial.TextureFiltering = TTextureFiltering.tfNearest then
      SetContextState(TContextState.csTexNearest)
    else
      SetContextState(TContextState.csTexLinear);
  end
  else
  if (not AMaterial.Texture.IsEmpty) then
  begin
    SetTextureUnit(0, AMaterial.Texture);
    if AMaterial.Modulation = TTextureMode.tmReplace then
      SetContextState(TContextState.csTexReplace)
    else
      SetContextState(TContextState.csTexModulate);
    if AMaterial.TextureFiltering = TTextureFiltering.tfNearest then
      SetContextState(TContextState.csTexNearest)
    else
      SetContextState(TContextState.csTexLinear);
  end
  else
  begin
    SetTextureUnit(0, nil);
    SetTextureMatrix(0, IdentityMatrix);
    SetContextState(TContextState.csTexDisable);
  end;
  
  if AMaterial.ShadeMode = TShadeMode.smFlat then
    SetContextState(TContextState.csFlat)
  else
    SetContextState(TContextState.csGouraud);

  if AMaterial.FillMode = TFillMode.fmSolid then
    SetContextState(TContextState.csSolid)
  else
    SetContextState(TContextState.csFrame);

  if AMaterial.Lighting then
    SetContextState(TContextState.csLightOn)
  else
    SetContextState(TContextState.csLightOff);
end;

procedure TContext3D.SetCamera(const Camera: TCamera);
begin
  FCurrentCamera := Camera;
  if (FCurrentCamera = nil) then Exit;
{  if (FCurrentCamera.Target <> nil) then
  begin
    FCurrentCameraMatrix := MatrixLookAtDirRH(Camera.AbsoluteMatrix.M[3],
      Vector3DSubtract(Camera.Target.AbsolutePosition, Camera.AbsolutePosition), Camera.AbsoluteMatrix.M[2]);
  end
  else}
    FCurrentCameraMatrix := MatrixLookAtDirRH(Camera.AbsolutePosition, Vector3DScale(Camera.AbsoluteDirection, -1),
      Vector3DScale(Camera.AbsoluteUp, -1));
  FCurrentCameraInvMatrix := FCurrentCameraMatrix;
  InvertMatrix(FCurrentCameraInvMatrix);
end;

procedure TContext3D.SetColor(const AMaterialColor: TMaterialColor; AColor: TAlphaColor);
begin
  if AMaterialColor = TMaterialColor.mcSpecular then
    FCurrentSpecular := AColor;
  if AMaterialColor = TMaterialColor.mcDiffuse then
    FCurrentDiffuse := AColor;
  if AMaterialColor = TMaterialColor.mcAmbient then
    FCurrentAmbient := AColor;
  if AMaterialColor = TMaterialColor.mcEmissive then
    FCurrentEmissive := AColor;
end;

procedure TContext3D.SetContextState(const State: TContextState);
begin
  if not FCurrentStates[State] then
  begin
    FCurrentStates[State] := True;
    case State of
      TContextState.cs2DScene:
        FCurrentStates[TContextState.cs3DScene] := False;
      TContextState.cs3DScene:
        FCurrentStates[TContextState.cs2DScene] := False;
      TContextState.csLightOn:
        FCurrentStates[TContextState.csLightOff] := False;
      TContextState.csLightOff:
        FCurrentStates[TContextState.csLightOn] := False;
      TContextState.csZTestOn:
        FCurrentStates[TContextState.csZTestOff] := False;
      TContextState.csZTestOff:
        FCurrentStates[TContextState.csZTestOn] := False;
      TContextState.csZWriteOn:
        FCurrentStates[TContextState.csZWriteOff] := False;
      TContextState.csZWriteOff:
        FCurrentStates[TContextState.csZWriteOn] := False;
      TContextState.csAlphaTestOn:
        FCurrentStates[TContextState.csAlphaTestOff] := False;
      TContextState.csAlphaTestOff:
        FCurrentStates[TContextState.csAlphaTestOn] := False;
      TContextState.csAlphaBlendOn:
        FCurrentStates[TContextState.csAlphaBlendOff] := False;
      TContextState.csAlphaBlendOff:
        FCurrentStates[TContextState.csAlphaBlendOn] := False;
      TContextState.csStencilOn:
        FCurrentStates[TContextState.csStencilOff] := False;
      TContextState.csStencilOff:
        FCurrentStates[TContextState.csStencilOn] := False;
      TContextState.csColorWriteOn:
        FCurrentStates[TContextState.csColorWriteOff] := False;
      TContextState.csColorWriteOff:
        FCurrentStates[TContextState.csColorWriteOn] := False;
      TContextState.csFrontFace:
        begin
          FCurrentStates[TContextState.csBackFace] := False;
          FCurrentStates[TContextState.csAllFace] := False;
        end;
      TContextState.csBackFace:
        begin
          FCurrentStates[TContextState.csAllFace] := False;
          FCurrentStates[TContextState.csFrontFace] := False;
        end;
      TContextState.csAllFace:
        begin
          FCurrentStates[TContextState.csBackFace] := False;
          FCurrentStates[TContextState.csFrontFace] := False;
        end;
      { Blending }
      TContextState.csBlendAdditive:
        FCurrentStates[TContextState.csBlendNormal] := False;
      TContextState.csBlendNormal:
        FCurrentStates[TContextState.csBlendAdditive] := False;
      { Tex stretch }
      TContextState.csTexNearest:
        FCurrentStates[TContextState.csTexLinear] := False;
      TContextState.csTexLinear:
        FCurrentStates[TContextState.csTexNearest] := False;
      { Tex modulation }
      TContextState.csTexDisable:
        begin
          FCurrentStates[TContextState.csTexModulate] := False;
          FCurrentStates[TContextState.csTexReplace] := False;
        end;
      TContextState.csTexReplace:
        begin
          FCurrentStates[TContextState.csTexModulate] := False;
          FCurrentStates[TContextState.csTexDisable] := False;
        end;
      TContextState.csTexModulate:
        begin
          FCurrentStates[TContextState.csTexDisable] := False;
          FCurrentStates[TContextState.csTexReplace] := False;
        end;
      { Fill }
      TContextState.csFrame:
        FCurrentStates[TContextState.csSolid] := False;
      TContextState.csSolid:
        FCurrentStates[TContextState.csFrame] := False;
      { Shade }
      TContextState.csFlat:
        FCurrentStates[TContextState.csGouraud] := False;
      TContextState.csGouraud:
        FCurrentStates[TContextState.csFlat] := False;
    end;
    ApplyContextState(State);
  end;
end;

procedure TContext3D.SetSize(const AWidth, AHeight: Integer);
begin
  if (FWidth <> AWidth) or (FHeight <> AHeight) then
  begin
    FreeBuffer;
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth < 1 then FWidth := 1;
    if FHeight < 1 then FHeight := 1;
    Resize;
    // clear matrix state
    FCurrentStates[TContextState.cs2DScene] := False;
    FCurrentStates[TContextState.cs3DScene] := False;
    //
    CreateBuffer;
  end;
end;

procedure TContext3D.SetMultisample(const Multisample: TMultisample);
begin
  if FMultisample <> Multisample then
  begin
    FreeBuffer;
    FMultisample := Multisample;
    CreateBuffer;
  end;
end;

procedure TContext3D.SetMatrix(const M: TMatrix3D);
begin
  FCurrentMatrix := M;
end;

procedure TContext3D.Pick(X, Y: Single; const AProj: TProjection; var RayPos, RayDir: TVector3D);
var
  matProj: TMatrix3D;
  vPos, vNear: TVector3D;
begin
  if AProj = TProjection.pjCamera then
  begin
    { camera }
    matProj := GetProjectionMatrix;
    // Compute the vector of the pick ray in screen space
    vPos := Vector3D(0, 0, 0);
    vNear := Vector3D((1.0 - (2.0 * (X / FWidth))) / matProj.m11, -(1.0 - (2.0 * (Y / FHeight))) / matProj.m22, 1);
    // Get the inverse view matrix
    if FCurrentCamera <> nil then
    begin
      // Transform the screen space pick ray into 3D space
      vPos := Vector3DTransform(vPos, FCurrentCameraInvMatrix);
      vNear := Vector3DTransform(vNear, FCurrentCameraInvMatrix);
    end;
    RayPos := vPos;
    RayDir := Vector3DNormalize(Vector3DSubtract(vPos, vNear));
  end
  else
  begin
    { screen }
    matProj := GetScreenMatrix;
    InvertMatrix(matProj);
    vPos := Vector3D(0, 0, 0);
    vPos := Vector3DTransform(vPos, matProj);
    // Old behavior
    vPos := Vector3D(FWidth / 2, FHeight / 2, vPos.Z * 2);
    vNear := Vector3D(X, Y, 0);
    RayPos := vPos;
    RayDir := Vector3DNormalize(Vector3DSubtract(vNear, vPos));
  end;
end;

function TContext3D.WorldToScreen(const AProj: TProjection; const P: TPoint3D): TPoint3D;
var
  matProj: TMatrix3D;
begin
  if AProj = TProjection.pjCamera then
  begin
    { camera }
    matProj := FCurrentCameraMatrix;
    Result := Point3D(Vector3DTransform(Vector3D(P), matProj));

    matProj := GetProjectionMatrix;
    if Result.Z <> 0 then
    begin
      Result.X := -((Result.X / Result.Z) * matProj.m11 - 1) * FWidth / 2;
      Result.Y := ((Result.Y / Result.Z) * matProj.m22 + 1) * FHeight / 2;
    end;
  end
  else
  begin
    { screen }
    matProj := GetScreenMatrix;
    Result := P;
  end;
end;

procedure TContext3D.DrawCube(const Center, Size: TVector3D; const Opacity: Single);
var
  i: Integer;
  a, b: TVector3D;
  Pts: array [0 .. 24] of TVector3D;
begin
  a := Vector3DAdd(Center, Vector3DScale(Size, -0.5));
  b := Vector3DAdd(Center, Vector3DScale(Size, 0.5));
  begin
    Pts[0] := Vector3D(a.X, a.Y, b.Z);
    Pts[1] := Vector3D(b.X, a.Y, b.Z);
    Pts[2] := Vector3D(a.X, a.Y, a.Z);
    Pts[3] := Vector3D(b.X, a.Y, a.Z);
    Pts[4] := Vector3D(a.X, b.Y, b.Z);
    Pts[5] := Vector3D(b.X, b.Y, b.Z);
    Pts[6] := Vector3D(a.X, b.Y, a.Z);
    Pts[7] := Vector3D(b.X, b.Y, a.Z);

    Pts[8] := Vector3D(a.X, a.Y, a.Z);
    Pts[9] := Vector3D(a.X, b.Y, a.Z);
    Pts[10] := Vector3D(a.X, a.Y, b.Z);
    Pts[11] := Vector3D(a.X, b.Y, b.Z);
    Pts[12] := Vector3D(b.X, a.Y, a.Z);
    Pts[13] := Vector3D(b.X, b.Y, a.Z);
    Pts[14] := Vector3D(b.X, a.Y, b.Z);
    Pts[15] := Vector3D(b.X, b.Y, b.Z);

    Pts[16] := Vector3D(a.X, a.Y, a.Z);
    Pts[17] := Vector3D(a.X, a.Y, b.Z);
    Pts[18] := Vector3D(b.X, a.Y, a.Z);
    Pts[19] := Vector3D(b.X, a.Y, b.Z);
    Pts[20] := Vector3D(a.X, b.Y, a.Z);
    Pts[21] := Vector3D(a.X, b.Y, b.Z);
    Pts[22] := Vector3D(b.X, b.Y, a.Z);
    Pts[23] := Vector3D(b.X, b.Y, b.Z);
  end;
  for i := 0 to 11 do
    DrawLine(Pts[i * 2], Pts[i * 2 + 1], Opacity);
end;

procedure TContext3D.DrawLine(const StartPoint, EndPoint: TVector3D;
  const Opacity: Single);
var
  Ver: TVertexBuffer;
  Idx: TIndexBuffer;
begin
  Ver := TVertexBuffer.Create([TVertexFormat.vfVertex], 2);
  Ver.Vertices[0] := Point3D(StartPoint);
  Ver.Vertices[1] := Point3D(EndPoint);
  Idx := TIndexBuffer.Create(2);
  Idx[0] := 0;
  Idx[1] := 1;
  DrawLinesList(Ver, Idx, Opacity);
  Idx.Free;
  Ver.Free;
end;

procedure TContext3D.FillCube(const Center, Size: TVector3D; const Opacity: Single);
var
  Ver: TVertexBuffer;
  Idx: TIndexBuffer;
  tx1, ty1, tx2, ty2: Single;
  a, b, n: TVector3D;
  i: Integer;
begin
  a := Vector3DAdd(Center, Vector3DScale(Size, -0.5));
  b := Vector3DAdd(Center, Vector3DScale(Size, 0.5));
  tx1 := 0;
  ty1 := 0;
  tx2 := 1;
  ty2 := 1;
  { front }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(a.X, a.Y, b.Z), Vector3D(b.X, a.Y, b.Z)),
    Vector3DSubtract(Vector3D(a.X, a.Y, b.Z), Vector3D(b.X, a.Y, a.Z)));
  n := Vector3DScale(n, -1);
  Ver := TVertexBuffer.Create([TVertexFormat.vfVertex, TVertexFormat.vfNormal, TVertexFormat.vfTexCoord0], 24);
  Ver.Vertices[0] := Point3D(a.X, a.Y, b.Z); Ver.Normals[0] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[0] := PointF(tx1, ty1);
  Ver.Vertices[1] := Point3D(b.X, a.Y, b.Z); Ver.Normals[1] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[1] := PointF(tx2, ty1);
  Ver.Vertices[2] := Point3D(b.X, a.Y, a.Z); Ver.Normals[2] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[2] := PointF(tx2, ty2);
  Ver.Vertices[3] := Point3D(a.X, a.Y, a.Z); Ver.Normals[3] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[3] := PointF(tx1, ty2);
  { right }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(b.X, a.Y, b.Z), Vector3D(b.X, b.Y, b.Z)),
    Vector3DSubtract(Vector3D(b.X, a.Y, b.Z), Vector3D(b.X, b.Y, a.Z)));
  n := Vector3DScale(n, -1);
  Ver.Vertices[4] := Point3D(b.X, a.Y, b.Z); Ver.Normals[4] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[4] := PointF(tx1, ty1);
  Ver.Vertices[5] := Point3D(b.X, b.Y, b.Z); Ver.Normals[5] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[5] := PointF(tx2, ty1);
  Ver.Vertices[6] := Point3D(b.X, b.Y, a.Z); Ver.Normals[6] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[6] := PointF(tx2, ty2);
  Ver.Vertices[7] := Point3D(b.X, a.Y, a.Z); Ver.Normals[7] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[7] := PointF(tx1, ty2);
  { left }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(a.X, b.Y, b.Z), Vector3D(a.X, a.Y, b.Z)),
    Vector3DSubtract(Vector3D(a.X, b.Y, b.Z), Vector3D(a.X, a.Y, a.Z)));
  n := Vector3DScale(n, -1);
  Ver.Vertices[8] := Point3D(a.X, b.Y, b.Z); Ver.Normals[8] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[8] := PointF(tx1, ty1);
  Ver.Vertices[9] := Point3D(a.X, a.Y, b.Z); Ver.Normals[9] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[9] := PointF(tx2, ty1);
  Ver.Vertices[10] := Point3D(a.X, a.Y, a.Z); Ver.Normals[10] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[10] := PointF(tx2, ty2);
  Ver.Vertices[11] := Point3D(a.X, b.Y, a.Z); Ver.Normals[11] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[11] := PointF(tx1, ty2);
  { back }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(b.X, b.Y, b.Z), Vector3D(a.X, b.Y, b.Z)),
    Vector3DSubtract(Vector3D(b.X, b.Y, b.Z), Vector3D(a.X, b.Y, a.Z)));
  n := Vector3DScale(n, -1);
  Ver.Vertices[12] := Point3D(b.X, b.Y, b.Z); Ver.Normals[12] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[12] := PointF(tx1, ty1);
  Ver.Vertices[13] := Point3D(a.X, b.Y, b.Z); Ver.Normals[13] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[13] := PointF(tx2, ty1);
  Ver.Vertices[14] := Point3D(a.X, b.Y, a.Z); Ver.Normals[14] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[14] := PointF(tx2, ty2);
  Ver.Vertices[15] := Point3D(b.X, b.Y, a.Z); Ver.Normals[15] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[15] := PointF(tx1, ty2);
  { top }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(a.X, b.Y, b.Z), Vector3D(b.X, b.Y, b.Z)),
    Vector3DSubtract(Vector3D(a.X, b.Y, b.Z), Vector3D(b.X, a.Y, b.Z)));
  n := Vector3DScale(n, -1);
  Ver.Vertices[16] := Point3D(a.X, b.Y, b.Z); Ver.Normals[16] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[16] := PointF(tx1, ty1);
  Ver.Vertices[17] := Point3D(b.X, b.Y, b.Z); Ver.Normals[17] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[17] := PointF(tx2, ty1);
  Ver.Vertices[18] := Point3D(b.X, a.Y, b.Z); Ver.Normals[18] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[18] := PointF(tx2, ty2);
  Ver.Vertices[19] := Point3D(a.X, a.Y, b.Z); Ver.Normals[19] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[19] := PointF(tx1, ty2);
  { bottom }
  n := Vector3DCrossProduct(Vector3DSubtract(Vector3D(a.X, a.Y, a.Z), Vector3D(b.X, a.Y, a.Z)),
    Vector3DSubtract(Vector3D(a.X, a.Y, a.Z), Vector3D(b.X, b.Y, a.Z)));
  n := Vector3DScale(n, -1);
  Ver.Vertices[20] := Point3D(a.X, a.Y, a.Z); Ver.Normals[20] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[20] := PointF(tx1, ty1);
  Ver.Vertices[21] := Point3D(b.X, a.Y, a.Z); Ver.Normals[21] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[21] := PointF(tx2, ty1);
  Ver.Vertices[22] := Point3D(b.X, b.Y, a.Z); Ver.Normals[22] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[22] := PointF(tx2, ty2);
  Ver.Vertices[23] := Point3D(a.X, b.Y, a.Z); Ver.Normals[23] := Point3D(n.X, n.Y, n.Z); Ver.TexCoord0[23] := PointF(tx1, ty2);

  { indexs }
  Idx := TIndexBuffer.Create(36);
  for i := 0 to 5 do
  begin
    Idx[i * 6 + 0] := (i * 4) + 0;
    Idx[i * 6 + 1] := (i * 4) + 1;
    Idx[i * 6 + 2] := (i * 4) + 3;
    Idx[i * 6 + 3] := (i * 4) + 3;
    Idx[i * 6 + 4] := (i * 4) + 1;
    Idx[i * 6 + 5] := (i * 4) + 2;
  end;

  DrawTrianglesList(Ver, Idx, Opacity);
  Idx.Free;
  Ver.Free;
end;

procedure TContext3D.FillMesh(const Center, Size: TVector3D; const MeshData: TMeshData; const Opacity: Single);
var
  SaveMatrix, M: TMatrix3D;
begin
  if MeshData.VertexBuffer.Size = 0 then
    Exit;
  if MeshData.IndexBuffer.Size = 0 then
    Exit;

  M := Matrix3DMultiply(CreateScaleMatrix3D(Size), CreateTranslateMatrix3D(Vector3D(Center.X, Center.Y, Center.Z)));
  SaveMatrix := FCurrentMatrix;
  FCurrentMatrix := Matrix3DMultiply(M, FCurrentMatrix);
  DrawTrianglesList(MeshData.FVertexBuffer, MeshData.IndexBuffer, Opacity);
  SetMatrix(SaveMatrix);
    end;

procedure TContext3D.FillRect(const Rect: TRectF; const Depth, Opacity: Single);
var
  P: TPolygon;
begin
  SetLength(P, 5);
  P[0] := Rect.TopLeft;
  P[1] := PointF(Rect.Right, Rect.Top);
  P[2] := Rect.BottomRight;
  P[3] := PointF(Rect.Left, Rect.Bottom);
  P[4] := Rect.TopLeft;
  FillPolygon(Vector3D((Rect.Left + Rect.Right) / 2, (Rect.Top + Rect.Bottom) / 2, 0),
    Vector3D(RectWidth(Rect), RectHeight(Rect), Depth), Rect, P, Opacity);
end;

procedure TContext3D.FillPolygon(const Center, Size: TVector3D; const Rect: TRectF;
  const Points: TPolygon; const Opacity: Single; Front: Boolean = True; Back: Boolean = True;
  Left: Boolean = True);
var
  Ver: TVertexBuffer;
  Idx: TIndexBuffer;
  MeshData: TMeshData;
  a, b: TVector3D;
  C: TAlphaColor;
  i, j: Integer;
  //Flags: cardinal;
  startIndex: Integer;
  leftLen, curPos: Single;
begin
  if Length(Points) = 0 then
    Exit;
  { calc bounds }
  a := Vector3D($FFFF, $FFFF, 0);
  b := Vector3D(-$FFFF, -$FFFF, 0);
  leftLen := 0;
  for i := 0 to High(Points) do
  begin
    if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
      continue;
    with Points[i] do
    begin
      if X < a.X then
        a.X := X;
      if Y < a.Y then
        a.Y := Y;
      if X > b.X then
        b.X := X;
      if Y > b.Y then
        b.Y := Y;
      if Left and (i > 0) then
      begin
        if Points[i - 1].X >= $FFFF then
        begin
          leftLen := leftLen + VectorLength(Vector(X - Points[i - 2].X, Y - Points[i - 2].Y));
        end
        else
        begin
          leftLen := leftLen + VectorLength(Vector(X - Points[i - 1].X, Y - Points[i - 1].Y));
        end;
      end;
    end;
  end;
  if not IsRectEmpty(Rect) then
  begin
    if Rect.Left < a.X then
      a.X := Rect.Left;
    if Rect.Top < a.Y then
      a.Y := Rect.Top;
    if Rect.Right > b.X then
      b.X := Rect.Right;
    if Rect.Bottom > b.Y then
      b.Y := Rect.Bottom;
  end;

  Ver := TVertexBuffer.Create([TVertexFormat.vfVertex, TVertexFormat.vfNormal, TVertexFormat.vfTexCoord0], 0);
  Idx := TIndexBuffer.Create(0);

  { Front face }
  if Front then
  begin
    Ver.Length := Length(Points);
    { set vertices }
    for i := 0 to High(Points) do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
        continue;
      with Point3D((Points[i].X - a.X) / Abs(b.X - a.X), (Points[i].Y - a.Y) / Abs(b.Y - a.Y), 1) do
        Ver.Vertices[i] := Point3D(Center.X - (Size.X / 2) + (X * Size.X),
          Center.Y - (Size.Y / 2) + (Y * Size.Y), Center.Z - (Size.Z / 2) + (Z * Size.Z));
      Ver.Normals[i] := Point3D(0, 0, 1);
      Ver.TexCoord0[i] := PointF(0.02 + (X * 0.96), 0.02 + (Y * 0.96));
    end;
    { Set indices }
    Idx.Length := High(Points) * 3;
    startIndex := 0;
    j := 0;
    for i := 0 to High(Points) - 1 do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
      begin
        startIndex := i + 1;
        continue;
      end;
      Idx[(j * 3) + 0] := startIndex;
      Idx[(j * 3) + 1] := i + 1;
      Idx[(j * 3) + 2] := i;
      Inc(j);
    end;
    Idx.Length := (j - 1) * 3;
    { write to stencil }
    SetContextState(TContextState.csStencilOn);
    Clear([TClearTarget.ctStencil], 0, 0, 0);
    SetContextState(TContextState.csColorWriteOff);
    SetContextState(TContextState.csZWriteOff);
    SetStencilFunc(TStencilFunc.sfAlways, 0, $FF);
    SetStencilOp(TStencilOp.soKeep, TStencilOp.soKeep, TStencilOp.soInvert);
    SetContextState(TContextState.csAllFace);
    DrawTrianglesList(Ver, Idx, 1);
    SetContextState(TContextState.csZWriteOn);
    SetContextState(TContextState.csColorWriteOn);
    { just paint rect using stencil }
    Ver.Length := 4;
      Ver.Vertices[0] := Point3D(Center.X - (Size.X / 2), Center.Y - (Size.Y / 2), Center.Z + (Size.Z / 2));
      Ver.Normals[0] := Point3D(0, 0, 1);
      Ver.TexCoord0[0] := PointF(0, 0);

      Ver.Vertices[1] := Point3D(Center.X + (Size.X / 2), Center.Y - (Size.Y / 2), Center.Z + (Size.Z / 2));
      Ver.Normals[1] := Point3D(0, 0, 1);
      Ver.TexCoord0[1] := PointF(1, 0);

      Ver.Vertices[2] := Point3D(Center.X + (Size.X / 2), Center.Y + (Size.Y / 2), Center.Z + (Size.Z / 2));
      Ver.Normals[2] := Point3D(0, 0, 1);
      Ver.TexCoord0[2] := PointF(1, 1);

      Ver.Vertices[3] := Point3D(Center.X - (Size.X / 2), Center.Y + (Size.Y / 2), Center.Z + (Size.Z / 2));
      Ver.Normals[3] := Point3D(0, 0, 1);
      Ver.TexCoord0[3] := PointF(0, 1);
    { indexs }
    Idx.Length := 6;
    Idx[0] := 0;
    Idx[1] := 3;
    Idx[2] := 1;
    Idx[3] := 1;
    Idx[4] := 3;
    Idx[5] := 2;
    SetStencilFunc(TStencilFunc.sfNotEqual, 0, $FF);
    SetStencilOp(TStencilOp.soKeep, TStencilOp.soKeep, TStencilOp.soKeep);
    SetContextState(TContextState.csFrontFace);
    DrawTrianglesList(Ver, Idx, Opacity);
    SetContextState(TContextState.csStencilOff);
  end;

  { Back Face }
  if Back then
  begin
    Ver.Length := Length(Points);
    { set vertices }
    for i := 0 to High(Points) do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
        continue;
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
        continue;
      with Point3D((Points[i].X - a.X) / Abs(b.X - a.X), (Points[i].Y - a.Y) / Abs(b.Y - a.Y), 0) do
        Ver.Vertices[i] := Point3D(Center.X - (Size.X / 2) + (X * Size.X),
          Center.Y - (Size.Y / 2) + (Y * Size.Y), Center.Z - (Size.Z / 2) + (Z * Size.Z));
      Ver.Normals[i] := Point3D(0, 0, -1);
      Ver.TexCoord0[i] := PointF(0.02 + (X * 0.96), 0.02 + (Y * 0.96));
    end;
    { Set indices }
    Idx.Length := (High(Points)) * 3;
    startIndex := 0;
    j := 0;
    for i := 0 to High(Points) - 1 do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
      begin
        startIndex := i + 1;
        continue;
      end;
      Idx[(j * 3) + 0] := startIndex;
      Idx[(j * 3) + 1] := i + 1;
      Idx[(j * 3) + 2] := i;
      Inc(j);
    end;
    Idx.Length := (j - 1) * 3;
    { write to stencil }
    SetContextState(TContextState.csStencilOn);
    Clear([TClearTarget.ctStencil], 0, 0, 0);
    SetContextState(TContextState.csColorWriteOff);
    SetContextState(TContextState.csZWriteOff);
    SetStencilFunc(TStencilFunc.sfAlways, 0, $FF);
    SetStencilOp(TStencilOp.soKeep, TStencilOp.soKeep, TStencilOp.soInvert);
    SetContextState(TContextState.csAllFace);
    DrawTrianglesList(Ver, Idx, 1);
    SetContextState(TContextState.csZWriteOn);
    SetContextState(TContextState.csColorWriteOn);
    { just paint rect using stencil }
    Ver.Length := 4;
      Ver.Vertices[0] := Point3D(Center.X - (Size.X / 2), Center.Y - (Size.Y / 2), Center.Z - (Size.Z / 2));
      Ver.Normals[0] := Point3D(0, 0, -1);
      Ver.TexCoord0[0] := PointF(0, 0);

      Ver.Vertices[1] := Point3D(Center.X + (Size.X / 2), Center.Y - (Size.Y / 2), Center.Z - (Size.Z / 2));
      Ver.Normals[1] := Point3D(0, 0, -1);
      Ver.TexCoord0[1] := PointF(1, 0);

      Ver.Vertices[2] := Point3D(Center.X + (Size.X / 2), Center.Y + (Size.Y / 2), Center.Z - (Size.Z / 2));
      Ver.Normals[2] := Point3D(0, 0, -1);
      Ver.TexCoord0[2] := PointF(1, 1);

      Ver.Vertices[3] := Point3D(Center.X - (Size.X / 2), Center.Y + (Size.Y / 2), Center.Z - (Size.Z / 2));
      Ver.Normals[3] := Point3D(0, 0, -1);
      Ver.TexCoord0[3] := PointF(0, 1);
    { indexs }
    Idx.Length := 6;
    Idx[0] := 0;
    Idx[1] := 1;
    Idx[2] := 3;
    Idx[3] := 1;
    Idx[4] := 2;
    Idx[5] := 3;
    SetStencilFunc(TStencilFunc.sfNotEqual, 0, $FF);
    SetStencilOp(TStencilOp.soKeep, TStencilOp.soKeep, TStencilOp.soKeep);
    SetContextState(TContextState.csFrontFace);
    DrawTrianglesList(Ver, Idx, Opacity);
    SetContextState(TContextState.csStencilOff);
  end;

  { sides }
  if Left and (leftLen > 0) then
  begin
    Ver.Length := Length(Points) * 2;
    { set vertices }
    curPos := 0;
    for i := 0 to High(Points) do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
        continue;
      if (i > 0) then
      begin
        if Points[i - 1].X >= $FFFF then
          curPos := curPos + VectorLength(Vector(Points[i].X - Points[i - 2].X,
            Points[i].Y - Points[i - 2].Y))
        else
          curPos := curPos + VectorLength(Vector(Points[i].X - Points[i - 1].X,
            Points[i].Y - Points[i - 1].Y));
      end;
      with Point3D((Points[i].X - a.X) / Abs(b.X - a.X), ((Points[i].Y - a.Y) / Abs(b.Y - a.Y)), 1) do
          Ver.Vertices[i] := Point3D(Center.X - (Size.X / 2) + (X * Size.X),
            Center.Y - (Size.Y / 2) + (Y * Size.Y), Center.Z - (Size.Z / 2) + Z * Size.Z);
      Ver.TexCoord0[i] := PointF(0, curPos / leftLen);

      with Point3D((Points[i].X - a.X) / Abs(b.X - a.X), ((Points[i].Y - a.Y) / Abs(b.Y - a.Y)), 0) do
          Ver.Vertices[Length(Points) + i] := Point3D(Center.X - (Size.X / 2) + (X * Size.X),
            Center.Y - (Size.Y / 2) + (Y * Size.Y), Center.Z - (Size.Z / 2) + Z * Size.Z);
      Ver.TexCoord0[Length(Points) + i] := PointF(1, curPos / leftLen);
    end;
    { set indices }
    Idx.Length := (High(Points)) * 6;
    j := 0;
    for i := 0 to High(Points) - 1 do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then
      begin
        continue;
      end;
      if (Points[i + 1].X >= $FFFF) and (Points[i + 1].X >= $FFFF) then
      begin
        continue;
      end;
      Idx[(j * 6) + 0] := i;
      Idx[(j * 6) + 2] := Length(Points) + i;
      Idx[(j * 6) + 1] := Length(Points) + i + 1;
      Idx[(j * 6) + 3] := Length(Points) + i + 1;
      Idx[(j * 6) + 5] := i + 1;
      Idx[(j * 6) + 4] := i;
      Inc(j);
    end;
    Idx.Length := (j - 0) * 6;

    { calc normals }
    MeshData := TMeshData.Create;
    MeshData.VertexBuffer.Assign(Ver);
    MeshData.IndexBuffer.Assign(Idx);
    MeshData.CalcNormals;
    Ver.Assign(MeshData.VertexBuffer);
    MeshData.Free;
    { draw }
    DrawTrianglesList(Ver, Idx, Opacity);
  end;

  { free }
  Ver.Free;
  Idx.Free;
end;

{ TControl3D }

constructor TControl3D.Create(AOwner: TComponent);
begin
  inherited;
  FCursor := crDefault;
  FShowContextMenu := True;
  FCanResize := True;
  FCanRotate := True;
  FOpacity := 1;
  FZWrite := True;
  FLocalMatrix := IdentityMatrix3D;
  FQuaternion := IdentityQuaternion;
  FPosition := TPosition3D.Create(Point3D(0, 0, 0));
  FPosition.OnChange := MatrixChanged;
  FScale := TPosition3D.Create(Point3D(1, 1, 1));
  FScale.OnChange := MatrixChanged;
  FSkew := TPosition3D.Create(Point3D(0, 0, 0));
  FSkew.OnChange := MatrixChanged;
  FRotationAngle := TPosition3D.Create(Point3D(0, 0, 0));
  FRotationAngle.OnChangeX := RotateXChanged;
  FRotationAngle.OnChangeY := RotateYChanged;
  FRotationAngle.OnChangeZ := RotateZChanged;
  FRotationCenter := TPosition3D.Create(Point3D(0, 0, 0));
  FRotationCenter.OnChange := MatrixChanged;
  FWidth := 1;
  FLastWidth := FWidth;
  FHeight := 1;
  FLastHeight := FHeight;
  FDepth := 1;
  FLastDepth := FDepth;
  FVisible := True;
  FHitTest := True;
  FRecalcAbsolute := True;
  FRecalcOpacity := True;
  FDesignVisible := True;
  FAcceptsControls := True;
end;

destructor TControl3D.Destroy;
begin
  FAbsoluteOpacity := 0;
  FVisible := False;
  FRotationCenter.Free;
  FRotationAngle.Free;
  FScale.Free;
  FSkew.Free;
  FPosition.Free;
  inherited;
end;

procedure TControl3D.Loaded;
begin
  inherited;
  MatrixChanged(Self);
end;

procedure TControl3D.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject = nil then
    Exit;
  if (AObject is TControl3D) then
  begin
    TControl3D(AObject).SetNewViewport(FViewport);
    if TempContext <> nil then
      TControl3D(AObject).TempContext := TempContext;
    TControl3D(AObject).RecalcOpacity;
    TControl3D(AObject).RecalcAbsolute;
  end;
end;

procedure TControl3D.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if (AObject is TControl3D) then
  begin
    TControl3D(AObject).Repaint;
    TControl3D(AObject).SetNewViewport(nil);
  end;
end;

procedure TControl3D.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Quanternion', ReadQuaternion, WriteQuaternion, (FQuaternion.ImagPart.X <> 0) or
    (FQuaternion.ImagPart.Y <> 0) or (FQuaternion.ImagPart.Z <> 0) or (FQuaternion.RealPart <> 0));
end;

procedure TControl3D.ReadQuaternion(Reader: TReader);
var
  S: AnsiString;
begin
  S := Reader.ReadString;
  try
    GetToken(S, ',()');
    FQuaternion.ImagPart.X := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    FQuaternion.ImagPart.Y := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    FQuaternion.ImagPart.Z := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    FQuaternion.ImagPart.W := 0;
    FQuaternion.RealPart := StrToFloat(GetToken(S, ',()'), USFormatSettings);
  except
  end;
end;

procedure TControl3D.WriteQuaternion(Writer: TWriter);
var
  S: WideString;
begin
  S := '(' + FloatToStr(FQuaternion.ImagPart.X, USFormatSettings) + ',' + FloatToStr(FQuaternion.ImagPart.Y,
    USFormatSettings) + ',' + FloatToStr(FQuaternion.ImagPart.Z, USFormatSettings) + ',' +
    FloatToStr(FQuaternion.RealPart, USFormatSettings) + ')';
  Writer.WriteString(S);
end;

{ matrix }

procedure TControl3D.RotateXChanged(Sender: TObject);
var
  q: TQuaternion3D;
  a: Single;
begin
  a := NormalizeAngle(RotationAngle.FX - RotationAngle.FSave.X);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(a, Vector3D(1, 0, 0) { AbsoluteRight } );
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotationAngle.FX := NormalizeAngle(RotationAngle.FX);
    RotationAngle.FSave.X := RotationAngle.FX;
  end;
end;

procedure TControl3D.RotateYChanged(Sender: TObject);
var
  q: TQuaternion3D;
  a: Single;
begin
  a := NormalizeAngle(RotationAngle.FY - RotationAngle.FSave.Y);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(a, Vector3D(0, 1, 0) { AbsoluteDirection } );
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotationAngle.FY := NormalizeAngle(RotationAngle.FY);
    RotationAngle.FSave.Y := RotationAngle.FY;
  end;
end;

procedure TControl3D.RotateZChanged(Sender: TObject);
var
  q: TQuaternion3D;
  a: Single;
begin
  a := NormalizeAngle(RotationAngle.FZ - RotationAngle.FSave.Z);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(a, Vector3D(0, 0, 1) { AbsoluteUp } );
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotationAngle.FZ := NormalizeAngle(RotationAngle.FZ);
    RotationAngle.FSave.Z := RotationAngle.FZ;
  end;
end;

procedure TControl3D.ResetRotationAngle;
begin
  FQuaternion := IdentityQuaternion;
  MatrixChanged(Self);
  RotationAngle.FZ := 0;
  RotationAngle.FSave.Z := 0;
  RotationAngle.FY := 0;
  RotationAngle.FSave.Y := 0;
  RotationAngle.FX := 0;
  RotationAngle.FSave.X := 0;
end;

procedure TControl3D.MatrixChanged(Sender: TObject);
var
  LeftVector, DirectionVector, UpVector: TVector3D;
  rotMatrix: TMatrix3D;
begin
  UpVector := Vector3D(0, 1, 0);
  DirectionVector := Vector3D(0, 0, 1);
  if (FRotationAngle.X <> 0) or (FRotationAngle.Y <> 0) or (FRotationAngle.Z <> 0) then
  begin
    rotMatrix := QuaternionToMatrix(FQuaternion);
    UpVector := Vector3DTransform(UpVector, rotMatrix);
    DirectionVector := Vector3DTransform(DirectionVector, rotMatrix);
  end
  else
  begin
    RotationAngle.FSave := Vector3D(0, 0, 0);
    FQuaternion := IdentityQuaternion;
  end;
  LeftVector := Vector3DCrossProduct(UpVector, DirectionVector);
  FLocalMatrix.M[0] := Vector3DScale(LeftVector, Scale.X);
  FLocalMatrix.m14 := 0;
  FLocalMatrix.M[1] := Vector3DScale(UpVector, Scale.Y);
  FLocalMatrix.m24 := 0;
  FLocalMatrix.M[2] := Vector3DScale(DirectionVector, Scale.Z);
  FLocalMatrix.m34 := 0;
  FLocalMatrix.m41 := FPosition.X;
  FLocalMatrix.m42 := FPosition.Y;
  FLocalMatrix.m43 := FPosition.Z;
  RecalcAbsolute;
  Repaint;
end;

procedure TControl3D.Resize3D;
begin
end;

function TControl3D.GetAbsoluteMatrix: TMatrix3D;
begin
  if FRecalcAbsolute then
  begin
    if (FParent <> nil) and (FParent is TControl3D) then
      FAbsoluteMatrix := Matrix3DMultiply(FLocalMatrix, TControl3D(FParent).AbsoluteMatrix)
    else
      FAbsoluteMatrix := FLocalMatrix;

    Result := FAbsoluteMatrix;
    FInvAbsoluteMatrix := FAbsoluteMatrix;
    InvertMatrix(FInvAbsoluteMatrix);

    FRecalcAbsolute := False;
    Repaint;
  end
  else
  begin
    Result := FAbsoluteMatrix;
  end;
end;

function TControl3D.GetInvertAbsoluteMatrix: TMatrix3D;
begin
  AbsoluteMatrix; // require this call to force recalulation if need
  Result := FInvAbsoluteMatrix;
end;

function TControl3D.GetDesignInteractive: Boolean;
begin
  Result := False;
end;

function TControl3D.GetAbsoluteDirection: TVector3D;
begin
  Result := AbsoluteMatrix.M[2];
end;

function TControl3D.GetAbsoluteLeft: TVector3D;
begin
  Result := AbsoluteMatrix.M[0];
end;

function TControl3D.GetAbsoluteUp: TVector3D;
begin
  Result := AbsoluteMatrix.M[1];
end;

function TControl3D.GetAbsolutePosition: TVector3D;
begin
  Result := AbsoluteMatrix.M[3];
end;

function TControl3D.ScreenToLocal(P: TPointF): TPointF;
begin
  if (FViewport <> nil) then
    P := FViewport.ScreenToLocal(P);
  Result := P;
end;

function TControl3D.LocalToScreen(P: TPointF): TPointF;
begin
  Result := P;
  if (FViewport <> nil) then
    P := FViewport.LocalToScreen(P);
end;

procedure TControl3D.SetAbsolutePosition(Value: TVector3D);
begin
  if (Parent <> nil) and (Parent is TControl3D) then
    Position.Vector := Vector3D(AbsoluteToLocal3D(Point3D(Value)))
  else
    Position.Vector := Value;
end;

function TControl3D.GetLocked: Boolean;
begin
  Result := FLocked;
end;

function TControl3D.GetParent: TFmxObject;
begin
  Result := Parent;
end;

function TControl3D.GetScreenBounds: TRectF;
var
  Pts: array [0 .. 7] of TPoint3D;
  a, b: TPoint3D;
  i: Integer;
begin
  if Context = nil then
  begin
    Result := RectF(0, 0, 0, 0);
    Exit;
  end;
  Pts[0] := Point3D(Width / 2, Height / 2, Depth / 2);
  Pts[1] := Point3D(-Width / 2, Height / 2, Depth / 2);
  Pts[2] := Point3D(-Width / 2, -Height / 2, Depth / 2);
  Pts[3] := Point3D(-Width / 2, -Height / 2, -Depth / 2);
  Pts[4] := Point3D(Width / 2, -Height / 2, Depth / 2);
  Pts[5] := Point3D(Width / 2, Height / 2, -Depth / 2);
  Pts[6] := Point3D(Width / 2, -Height / 2, -Depth / 2);
  Pts[7] := Point3D(-Width / 2, Height / 2, -Depth / 2);
  for i := 0 to High(Pts) do
    Pts[i] := Context.WorldToScreen(Projection, LocalToAbsolute3D(Pts[i]));
  { normalize }
  a := Point3D($FFFF, $FFFF, $FFFF);
  b := Point3D(-$FFFF, -$FFFF, -$FFFF);
  for i := 0 to High(Pts) do
  begin
    If Pts[i].X < a.X then
      a.X := Pts[i].X;
    If Pts[i].Y < a.Y then
      a.Y := Pts[i].Y;
    If Pts[i].X > b.X then
      b.X := Pts[i].X;
    If Pts[i].Y > b.Y then
      b.Y := Pts[i].Y;
  end;
  Result := RectF(a.X, a.Y, b.X, b.Y);
end;

procedure TControl3D.RecalcAbsolute;
var
  i: Integer;
  Child: TControl3D;
begin
  FRecalcAbsolute := True;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if not(Children[i] is TControl3D) then
        Continue;
      Child := FChildren[i];
      TControl3D(Child).RecalcAbsolute;
    end;
end;

function TControl3D.AbsoluteToLocalVector(P: TVector3D): TVector3D;
begin
  Result := Vector3DTransform(P, InvertAbsoluteMatrix);
end;

function TControl3D.LocalToAbsoluteVector(P: TVector3D): TVector3D;
begin
  Result := Vector3DTransform(P, AbsoluteMatrix);
end;

function TControl3D.AbsoluteToLocal(P: TPointF): TPointF;
begin
  Result := P;
end;

function TControl3D.AbsoluteToLocal3D(P: TPoint3D): TPoint3D;
var
  V: TVector3D;
begin
  V := Vector3D(P.X, P.Y, P.Z);
  V := Vector3DTransform(V, InvertAbsoluteMatrix);
  Result := Point3D(V.X, V.Y, V.Z);
end;

function TControl3D.LocalToAbsolute3D(P: TPoint3D): TPoint3D;
var
  V: TVector3D;
begin
  V := Vector3D(P.X, P.Y, P.Z);
  V := Vector3DTransform(V, AbsoluteMatrix);
  Result := Point3D(V.X, V.Y, V.Z);
end;

{ Opacity }

function TControl3D.GetAbsoluteOpacity: Single;
begin
  if FRecalcOpacity then
  begin
    if (FParent <> nil) and (FParent is TControl3D) then
      FAbsoluteOpacity := FOpacity * TControl3D(FParent).AbsoluteOpacity
    else
      FAbsoluteOpacity := FOpacity;

    Result := FAbsoluteOpacity;
    FRecalcOpacity := False;
  end
  else
  begin
    Result := FAbsoluteOpacity;
  end;
end;

procedure TControl3D.RecalcOpacity;
var
  i: Integer;
  Child: TControl3D;
begin
  FRecalcOpacity := True;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if not(Children[i] is TControl3D) then
        Continue;
      Child := TControl3D(Children[i]);
      TControl3D(Child).RecalcOpacity;
    end;
end;

procedure TControl3D.SetLocked(const Value: Boolean);
begin
  FLocked := Value;
end;

procedure TControl3D.SetNewViewport(AViewport: IViewport3D);
var
  i: Integer;
begin
  FViewport := AViewport;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for i := 0 to FChildren.Count - 1 do
      if TFmxObject(FChildren[i]) is TControl3D then
        TControl3D(FChildren[i]).SetNewViewport(FViewport);
end;

{ methods }

function TControl3D.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
var
  INear, IFar: TVector3D;
begin
  Result := RayCastCuboidIntersect(RayPos, RayDir, Vector3D(0,0,0), Width, Height, Depth, INear, IFar) > 0;
  if Result then
    Intersection := LocalToAbsoluteVector(INear);
end;

function TControl3D.CheckForAllowFocus: Boolean;
begin
  Result := Visible and CanFocus;
end;

function TControl3D.CheckHitTest(const AHitTest: Boolean): Boolean;
begin
  Result := FHitTest;
  if (csDesigning in ComponentState) then
    Result := True;
  if (csDesigning in ComponentState) and FLocked then
    Result := False;
  if (csDesigning in ComponentState) and not FDesignVisible then
    Result := False;
  if (csDesigning in ComponentState) and FDesignLocked then
    Result := False;
end;

function TControl3D.ObjectAtPoint(P: TPointF): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
  IP, rPos, rDir: TVector3D;
begin
  Result := nil;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.GetVisible and not(csDesigning in ComponentState) then
      Continue;
    NewObj := NewObj.ObjectAtPoint(P);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if (Result = nil) and (Context <> nil) and (Visible) and (GlobalProjection = Projection) then
  begin
    if FViewport <> nil then
      P := FViewport.ScreenToLocal(P);
    Context.Pick(P.X, P.Y, FProjection, rPos, rDir);
    if CheckHitTest(HitTest) and RayCastIntersect(AbsoluteToLocalVector(rPos), Vector3DNormalize(AbsoluteToLocalVector(rDir)), IP) then
    begin
      if (Projection = TProjection.pjScreen) and (Vector3DLength(Vector3DSubtract(IP, rPos)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, rPos));
        Result := Self;
      end;
      if (Projection = TProjection.pjCamera) and (Context.FCurrentCamera <> nil) and
        (Vector3DLength(Vector3DSubtract(IP, Context.FCurrentCamera.AbsolutePosition)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, Context.FCurrentCamera.AbsolutePosition));
        Result := Self;
      end;
    end;
  end;
end;

function TControl3D.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
  IP, rPos, rDir: TVector3D;
  Accept: Boolean;
begin
  Result := nil;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.GetVisible and not(csDesigning in ComponentState) then
      Continue;
    NewObj := NewObj.FindTarget(P, Data);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if (Result = nil) and (Context <> nil) then
  begin
    if FViewport <> nil then
      P := FViewport.ScreenToLocal(P);
    Context.Pick(P.X, P.Y, FProjection, rPos, rDir);
    if CheckHitTest(HitTest) and RayCastIntersect(AbsoluteToLocalVector(rPos),
      Vector3DNormalize(AbsoluteToLocalVector(rDir)), IP) and (GlobalProjection = Projection) then
    begin
      if (Projection = TProjection.pjScreen) and (Vector3DLength(Vector3DSubtract(IP, rPos)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, rPos));
        Accept := False;
        DragOver(Data, P, Accept);
        if Accept then
          Result := Self;
      end;
      if (Projection = TProjection.pjCamera) and (Context.FCurrentCamera <> nil) and
        (Vector3DLength(Vector3DSubtract(IP, Context.FCurrentCamera.AbsolutePosition)) < GlobalDistance) then
      begin
        GlobalDistance := Vector3DLength(Vector3DSubtract(IP, Context.FCurrentCamera.AbsolutePosition));
        Accept := False;
        DragOver(Data, P, Accept);
        if Accept then
          Result := Self;
      end;
    end;
  end;
end;

function TControl3D.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TControl3D.GetContext: TContext3D;
begin
  if FTempContext <> nil then
    Result := FTempContext
  else if FViewport <> nil then
    Result := FViewport.GetContext
  else
    Result := nil;
end;

function TControl3D.GetCursor: TCursor;
begin
  Result := FCursor;
end;

function TControl3D.GetDragMode: TDragMode;
begin
  Result := FDragMode;
end;

function TControl3D.GetHitTest: Boolean;
begin
  Result := FHitTest;
end;

function TControl3D.GetAcceptsControls: boolean;
begin
  Result := FAcceptsControls;
end;

procedure TControl3D.BeginAutoDrag;
var
  S, B: TBitmap;
begin
  S := TBitmap.Create(0, 0);
  try
    B := TBitmap.Create(48, 48);
    try
      PaintToBitmap(S, 128, 128, 0, False, TMultisample.msNone);
      if B.Canvas.BeginScene then
      try
        B.Canvas.DrawBitmap(S, RectF(0, 0, S.Width, S.Height), RectF(0, 0, B.Width, B.Height), 0.7);
      finally
        B.Canvas.EndScene;
      end;
      FRoot.BeginInternalDrag(Self, B);
    finally
      B.Free;
    end;
  finally
    S.Free;
  end;
end;

procedure TControl3D.Apply;
begin
  if FZWrite then
    Context.SetContextState(TContextState.csZWriteOn)
  else
    Context.SetContextState(TContextState.csZWriteOff);
  if Projection = TProjection.pjCamera then
    Context.SetContextState(TContextState.cs3DScene)
  else
    Context.SetContextState(TContextState.cs2DScene);
  if TwoSide then
    Context.SetContextState(TContextState.csAllFace)
  else
    Context.SetContextState(TContextState.csFrontFace);
  Context.SetMatrix(AbsoluteMatrix);

  Context.SetContextState(TContextState.csSolid);
end;

procedure TControl3D.Render;
begin
end;

procedure TControl3D.DoRender;
begin
  Apply;
  Render;
  if Assigned(FOnRender) then
  begin
    FOnRender(Self, Context);
  end;
  UnApply;
  if not FDisableDragHighlight and (IsDragOver) then
  begin
    Context.SetMatrix(AbsoluteMatrix);
    Context.Setcolor(TMaterialColor.mcDiffuse, $B2005ACC);
    Context.SetContextState(TContextState.csGouraud);
    Context.SetContextState(TContextState.csZWriteOn);
    Context.SetContextState(TContextState.csLightOff);
    Context.SetContextState(TContextState.csTexDisable);
    Context.FillCube(Vector3D(0, 0, 0), Vector3D(Width + 0.01, Height + 0.01, Depth + 0.01), 0.4);
  end;
  RenderChildren;
end;

procedure TControl3D.RenderChildren;
var
  i: Integer;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if Children[i] is TControl3D and ((TControl3D(FChildren[i]).Visible) or
        (not TControl3D(FChildren[i]).Visible and (csDesigning in ComponentState) and not TControl3D(FChildren[i]).Locked)) then
      begin
        with TControl3D(FChildren[i]) do
        begin
          if (csDesigning in ComponentState) and not FDesignVisible then
            Continue;
          DoRender;
        end;
      end;
end;

procedure TControl3D.UnApply;
begin
end;

procedure TControl3D.PaintToBitmap(ABitmap: TBitmap; AWidth, AHeight: Integer; ClearColor: TAlphaColor;
  AutoFit: Boolean = False; const AMultisample: TMultisample = TMultisample.msNone);
var
  B: TBitmap;
  FillR, R: TRectF;
  i, j: Integer;
  ratio: single;
  FitR: TRectF;
  S, t: TMatrix3D;
  Scale: Single;
  BitmapContext: TContext3D;
begin
  if AutoFit then
  begin
    { Render to bitmap }
    B := TBitmap.Create(0, 0);
    try
      PaintToBitmap(b, AWidth, AHeight, 0, False, TMultisample.msNone); // - render with alpha
      { calc best size }
      R := RectF(b.Width, b.Height, 0, 0);
      for i := 0 to b.Width - 1 do
        for j := 0 to b.Height - 1 do
        begin
          if TColorRec(b.Scanline[j][i]).a > 0 then
          begin
            if i < R.Left then
              R.Left := i;
            if j < R.Top then
              R.Top := j;
            if i > R.Right then
              R.Right := i;
            if j > R.Bottom then
              R.Bottom := j;
          end;
        end;
      FillR := R;
      ratio := FitRect(R, RectF(0, 0, AWidth, AHeight));
      if (ratio > 0) and (ratio < 1) then
      begin
        ABitmap.SetSize(AWidth, AHeight);
        // render again to better size
        PaintToBitmap(b, Round(AWidth / ratio), Round(AHeight / ratio), 0, False, TMultisample.msNone);
        { calc again }
        R := RectF(b.Width, b.Height, 0, 0);
        for i := 0 to b.Width - 1 do
          for j := 0 to b.Height - 1 do
          begin
            if TColorRec(b.Scanline[j][i]).a > 0 then
            begin
              if i < R.Left then
                R.Left := i;
              if j < R.Top then
                R.Top := j;
              if i > R.Right then
                R.Right := i;
              if j > R.Bottom then
                R.Bottom := j;
            end;
          end;
        FillR := R;
        FitRect(FillR, RectF(0, 0, AWidth, AHeight));
        ABitmap.Clear(CorrectColor(ClearColor));
        ABitmap.Canvas.DrawBitmap(b, RectF(R.Left, R.Top, R.Left + RectWidth(R), R.Top + RectHeight(FillR)),
          FillR, 1, True);
      end;
    finally
      B.Free;
    end;
  end
  else
  begin
    R := ScreenBounds;
    if IsRectEmpty(R) then
      Exit;
    FitR := R;
    if AWidth > MaxBitmapSize then
      AWidth := MaxBitmapSize;
    if AHeight > MaxBitmapSize then
      AHeight := MaxBitmapSize;
    Scale := 1 / FitRect(FitR, RectF(0, 0, AWidth, AHeight));

    ABitmap.SetSize(Round(RectWidth(R) * Scale), Round(RectHeight(R) * Scale));
    BitmapContext := DefaultContextClass.CreateFromBitmap(ABitmap, AMultisample, True);
    if Assigned(FViewport) then
    begin
      S := IdentityMatrix3D;
      S.m11 := FViewport.GetContext.Height / RectHeight(R);
      S.m22 := S.m11;

      t := IdentityMatrix3D;
      t.m41 := ( { OffsetX + } ((FViewport.GetContext.Width / 2) - ((R.Left + R.Right) / 2))) / RectWidth(R) * 2;
      t.m42 := -( { OffsetY + } ((FViewport.GetContext.Height / 2) - ((R.Top + R.Bottom) / 2))) / RectHeight(R) * 2;
      BitmapContext.FPaintToMatrix := Matrix3DMultiply(S, t);
    end;

    TempContext := BitmapContext;
    try
      if Assigned(FViewport) then
      begin
        Context.FCurrentCameraMatrix := FViewport.Context.FCurrentCameraMatrix;
        Context.FCurrentCameraInvMatrix := FViewport.Context.FCurrentCameraInvMatrix;
      end;
      // copy lights
      for i := 0 to FViewport.Context.FLights.Count - 1 do
        Context.FLights.Add(FViewport.Context.FLights[i]);
      // render
      if Context.BeginScene then
      try
        Context.ResetScene;
        Context.Clear([TClearTarget.ctColor, TClearTarget.ctDepth], ClearColor, 1.0, 0);
        Apply;
        DoRender;
        UnApply;
        RenderChildren;
      finally
        Context.EndScene;
      end;
    finally
      TempContext := nil;
    end;
    BitmapContext.Free;
  end;
end;

procedure TControl3D.CreateTileSnapshot(ABitmap: TBitmap; AWidth, AHeight, OffsetX, OffsetY: Integer;
  Scale: Single; ClearColor: TAlphaColor);
var
  i: Integer;
  FitR, R: TRectF;
  S, t: TMatrix3D;
  BitmapContext: TContext3D;
begin
  R := ScreenBounds;
  if IsRectEmpty(R) then Exit;
  FitR := RectF(R.left * Scale, R.Top * Scale, R.Right * Scale, R.Bottom * Scale);
  if AWidth > MaxBitmapSize then AWidth := MaxBitmapSize;
  if AHeight > MaxBitmapSize then AHeight := MaxBitmapSize;
  RectCenter(FitR, RectF(0, 0, AWidth, AHeight));

  ABitmap.SetSize(AWidth, AHeight);
  BitmapContext := DefaultContextClass.CreateFromBitmap(ABitmap, TMultisample.msNone, True);
  if Assigned(FViewport) and (FViewport.Context <> nil) then
  begin
    S := IdentityMatrix3D;
    S.m11 := Min(FViewport.Context.Height / AHeight, (FViewport.Context.Width / AWidth)) * Scale;
    S.m22 := S.m11;

    T := IdentityMatrix3D;
    T.m41 := (((-FitR.Left - offsetx) / Scale) + ((FViewport.Context.Width / 2) - ((R.Left + R.Right) / 2))) / AWidth * 2 * Scale;
    T.m42 := -(((-FitR.Top - offsety) / Scale) + ((FViewport.Context.Height / 2) - ((R.Top + R.Bottom) / 2))) / AHeight * 2 * Scale;

    TempContext := BitmapContext;
    try
      TempContext.FPaintToMatrix := Matrix3DMultiply(S, T);
      if Assigned(FViewport) then
      begin
        { clone camera and lights }
        Context.ResetScene;
        { set matrix and camera }
        Context.FCurrentCameraMatrix := FViewport.Context.FCurrentCameraMatrix;
        Context.FCurrentCameraInvMatrix := FViewport.Context.FCurrentCameraInvMatrix;
        { copy lights }
        for i := 0 to FViewport.Context.FLights.Count - 1 do
          Context.FLights.Add(FViewport.Context.FLights[i]);
      end;
      // render
      if Context.BeginScene then
      try
        Context.ResetScene;
        Context.Clear([TClearTarget.ctColor, TClearTarget.ctDepth], ClearColor, 1.0, 0);
        Apply;
        DoRender;
        UnApply;
        RenderChildren;
      finally  
        Context.EndScene;
      end;
    finally
      TempContext := nil;
    end;
  end;  
  BitmapContext.Free;
end;

procedure TControl3D.CreateHighMultisampleSnapshot(ABitmap: TBitmap; AWidth, AHeight: Integer; ClearColor: TAlphaColor;
  Multisample: Integer);
const
  TileSize = 512;
var
  i, j: Integer;
  Sample: TBitmap;
  Tile: TBitmap;
  R, FitR, TileR: TRectF;
  factor: Single;
begin
  if Multisample < 1 then Multisample := 1;
  if Multisample > 16 then Multisample := 16;
  R := ScreenBounds;
  FitR := R;
  factor := FitRect(FitR, RectF(0, 0, AWidth, AHeight));
  if factor < 1 then
  begin
    R := RectF(R.Left / factor, R.Top / factor, R.Right / factor, R.Bottom / factor);
    RectCenter(R, RectF(0, 0, AWidth, AHeight));
  end
  else
    R := FitR;

  Sample := TBitmap.Create(round(RectWidth(R) * Multisample), round(RectHeight(R) * Multisample));
  Tile := TBitmap.Create(TileSize, TileSize);
  try
    if Sample.Canvas.BeginScene then
    try
      for i := 0 to Sample.Width div TileSize do
        for j := 0 to Sample.Height div TileSize do
          begin
            CreateTileSnapshot(Tile, TileSize, TileSize, i * TileSize, j * TileSize, Multisample / factor, ClearColor);
            TileR := RectF(0, 0, TileSize, TileSize);
            OffsetRect(TileR, i * TileSize, j * TileSize);
            Sample.Canvas.DrawBitmap(Tile, RectF(0, 0, TileSize, TileSize), TileR, 1, True);
          end;
    finally
      Sample.Canvas.EndScene;
    end;

    ABitmap.SetSize(AWidth, AHeight);
    if ABitmap.Canvas.BeginScene then
    try
      ABitmap.Canvas.DrawBitmap(Sample, RectF(0, 0, Sample.Width, Sample.Height), R, 1);
    finally
      ABitmap.Canvas.EndScene;
    end;
  finally
    Tile.Free;
    Sample.Free; 
  end;
end;

procedure TControl3D.Repaint;
begin
  if not Visible then
    Exit;
  if FViewport = nil then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  FViewport.NeedRender;
end;

procedure TControl3D.Lock;
var
  i: Integer;
begin
  Locked := True;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if Children[i] is TControl3D then
        TControl3D(FChildren[i]).Lock;
end;

{ bounds }

procedure TControl3D.DesignSelect;
begin
end;

procedure TControl3D.DesignClick;
begin
end;

{ events }

procedure TControl3D.DialogKey(var Key: Word; Shift: TShiftState);
begin
end;

procedure TControl3D.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  if Assigned(FOnKeyDown) then
    FOnKeyDown(Self, Key, KeyChar, Shift);
end;

procedure TControl3D.KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  if Assigned(FOnKeyUp) then
    FOnKeyUp(Self, Key, KeyChar, Shift);
end;

procedure TControl3D.Capture;
begin
  if (Root <> nil) then
    Root.SetCaptured(Self);
end;

procedure TControl3D.ReleaseCapture;
begin
  if (Root <> nil) then
    Root.SetCaptured(nil);
end;

procedure TControl3D.DoMouseEnter;
begin
  FIsMouseOver := True;
  StartTriggerAnimation(Self, 'IsMouseOver');
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TControl3D.DoMouseLeave;
begin
  FIsMouseOver := False;
  StartTriggerAnimation(Self, 'IsMouseOver');
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

procedure TControl3D.DoEnter;
begin
  FIsFocused := True;
  StartTriggerAnimation(Self, 'IsFocused');
end;

procedure TControl3D.DoExit;
begin
  FIsFocused := False;
  Repaint;
  StartTriggerAnimation(Self, 'IsFocused');
end;

procedure TControl3D.SetFocus;
begin
  if not FIsFocused and (Root <> nil) then
    Root.SetFocused(Self);
end;

procedure TControl3D.UpdateTabOrder(Value: TTabOrder);
var
  CurIndex, Count: Integer;
begin
  CurIndex := GetTabOrder;
  if (CurIndex >= 0) and (Parent <> nil) and (TOpenObject(Parent).FTabList <> nil) then
  begin
    Count := TOpenObject(Parent).FTabList.Count;
    if Value < 0 then
      Value := 0;
    if Value >= Count then
      Value := Count - 1;
    if Value <> CurIndex then
    begin
      TOpenObject(Parent).FTabList.Delete(CurIndex);
      TOpenObject(Parent).FTabList.Insert(Value, Pointer(AsIControl));
    end;
  end;
end;

function TControl3D.GetTabOrder: TTabOrder;
begin
  if (Parent <> nil) and (TOpenObject(Parent).FTabList <> nil) then
    Result := TOpenObject(Parent).FTabList.IndexOf(Pointer(AsIControl))
  else
    Result := -1;
end;

function TControl3D.GetTabOrderValue: TTabOrder;
begin
  Result := FTabOrder;
end;

function TControl3D.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TControl3D.ContextMenu(const ScreenPosition: TPoint3D);
begin
  { if FPopupMenu <> nil then
    begin
    FPopupMenu.PopupComponent := Self;
    FPopupMenu.Popup(round(ScreenPosition.X), round(ScreenPosition.Y));
    end; }
end;

procedure TControl3D.CopyRotationFrom(const AObject: TControl3D);
begin
  FRotationAngle.SetPoint3DNoChange(AObject.RotationAngle.Point);
  FQuaternion := AObject.FQuaternion;
  MatrixChanged(Self);
end;

procedure TControl3D.Click;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TControl3D.DblClick;
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Self);
end;

procedure TControl3D.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  RayDir, RayPos: TVector3D;
begin
  if not (csDesigning in ComponentState) and not FIsFocused and (FRoot <> nil) and
    (((FRoot.GetFocused <> nil) and (FRoot.GetFocused.GetObject <> Self)) or (FRoot.GetFocused = nil)) then
    SetFocus;

  P := PointF(X, Y);
  Context.Pick(P.X, P.Y, FProjection, RayPos, RayDir);
  RayPos := AbsoluteToLocalVector(RayPos);
  RayDir := Vector3DNormalize(AbsoluteToLocalVector(RayDir));
  MouseDown3D(Button, Shift, P.X, P.Y, RayPos, RayDir);
end;

procedure TControl3D.MouseMove(Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  RayDir, RayPos: TVector3D;
begin
  P := PointF(X, Y);
  Context.Pick(P.X, P.Y, FProjection, RayPos, RayDir);
  RayPos := AbsoluteToLocalVector(RayPos);
  RayDir := Vector3DNormalize(AbsoluteToLocalVector(RayDir));
  MouseMove3D(Shift, P.X, P.Y, RayPos, RayDir);
end;

procedure TControl3D.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  RayDir, RayPos: TVector3D;
begin
  P := PointF(X, Y);
  Context.Pick(P.X, P.Y, FProjection, RayPos, RayDir);
  RayPos := AbsoluteToLocalVector(RayPos);
  RayDir := Vector3DNormalize(AbsoluteToLocalVector(RayDir));
  MouseUp3D(Button, Shift, P.X, P.Y, RayPos, RayDir);
end;

procedure TControl3D.MouseDown3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single;
  RayPos, RayDir: TVector3D);
//var
//  P: TPoint3D;
//  VP: TPoint3D;
begin
  if not(csDesigning in ComponentState) and CanFocus and not FIsFocused then
    SetFocus;
  if Assigned(FOnMouseDown) then
    FOnMouseDown(Self, Button, Shift, X, Y, RayPos, RayDir);
   {if (Button = TMouseButton.mbRight) and FShowContextMenu then
    begin
    VP := LocalToAbsolute(Point3D(X, Y, 0));
    P := Point(Trunc(VP.X), Trunc(VP.Y));
    P := Scene.ClientToScreen(P);
    ContextMenu(PointF(P.X, P.Y));
    Exit;
    end; }
  if FAutoCapture then
    Capture;
  if (ssDouble in Shift) then
  begin
    FPressed := True;
    FDoubleClick := True;
  end
  else if Button = TMouseButton.mbLeft then
  begin
    FPressed := True;
  end;
end;

procedure TControl3D.MouseMove3D(Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
begin
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, Shift, X, Y, RayPos, RayDir);
end;

procedure TControl3D.MouseUp3D(Button: TMouseButton; Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
begin
  if FAutoCapture then
    ReleaseCapture;
  if FPressed and not (FDoubleClick) and (FIsMouseOver) then
  begin
    FPressed := False;
    Click;
  end
  else if FPressed and (FDoubleClick) and (FIsMouseOver) then
  begin
    FDoubleClick := False;
    FPressed := False;
    DblClick;
  end;
  if Assigned(FOnMouseUp) then
    FOnMouseUp(Self, Button, Shift, X, Y, RayPos, RayDir);
end;

procedure TControl3D.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  if Assigned(FOnMouseWheel) then
    FOnMouseWheel(Self, Shift, WheelDelta, Handled);
end;

procedure TControl3D.DragEnter(const Data: TDragObject; const Point: TPointF);
begin
  FIsDragOver := True;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragEnter) then
    OnDragEnter(Self, Data, NullPoint3D);
end;

procedure TControl3D.DragLeave;
begin
  FIsDragOver := False;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragLeave) then
    OnDragLeave(Self);
end;

procedure TControl3D.DragEnd;
begin
  // Call mouse up - for effects - inside control
  if DragMode = TDragMode.dmAutomatic then
    MouseUp3D(TMouseButton.mbLeft, [ssLeft], $FFFF, $FFFF, Vector3D($FFFF, $FFFF, 0), Vector3D(1, 0, 0));
  if Assigned(OnDragEnd) then
    OnDragEnd(Self);
end;

procedure TControl3D.DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
begin
  if Assigned(OnDragOver) then
    OnDragOver(Self, Data, NullPoint3D, Accept);
end;

procedure TControl3D.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  FIsDragOver := False;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragDrop) then
    OnDragDrop(Self, Data, NullPoint3D);
end;

{ properties }

procedure TControl3D.SetTabOrder(const Value: TTabOrder);
begin
end;

procedure TControl3D.SetTempContext(const Value: TContext3D);
var
  i: Integer;
begin
  FTempContext := Value;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for i := 0 to FChildren.Count - 1 do
      if (Children[i] is TControl3D) then
        TControl3D(FChildren[i]).TempContext := Value;
end;

procedure TControl3D.SetHitTest(const Value: Boolean);
begin
  FHitTest := Value;
end;

procedure TControl3D.SetAcceptsControls(const Value: boolean);
begin
  FAcceptsControls := Value;
end;

procedure TControl3D.SetClipChildren(const Value: Boolean);
begin
  if FClipChildren <> Value then
  begin
    FClipChildren := Value;
    Repaint;
  end;
end;

procedure TControl3D.SetProjection(const Value: TProjection);
const
  Fit: single = 25;
var
  i: Integer;
begin
  if FProjection <> Value then
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
        SetSize(Fit * Width, Fit * Height, Fit * Depth);
        if (FViewport <> nil) and (FViewport.Context <> nil) then
          Position.Point := Point3D(FViewport.Context.Width / 2, FViewport.Context.Height / 2, 0);
      end
      else
      begin
        SetSize(Width / Fit, Height / Fit, Depth / Fit);
        Position.Point := Point3D(0, 0, 0);
      end;
      Repaint;
    end;
  end;
end;

procedure TControl3D.SetSize(const AWidth, AHeight, ADepth: single);
begin
  Width := AWidth;
  Height := AHeight;
  Depth := ADepth;
end;

procedure TControl3D.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    if FVisible then
      Repaint;
    FVisible := Value;
    if FVisible then
      Repaint;
    if FVisible then
      StartTriggerAnimation(Self, 'IsVisible')
    else if FIsFocused then
      FRoot.SetFocused(nil);
  end;
end;

procedure TControl3D.SetHeight(const Value: Single);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    Resize3D;
    if (FHeight < 0) and (csDesigning in ComponentState) then
    begin
      FHeight := abs(FHeight);
      FScale.Y := -FScale.Y;
    end;
    if not (csLoading in ComponentState) then
    begin
      Repaint;
    end;
  end;
end;

procedure TControl3D.SetWidth(const Value: Single);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Resize3D;
    if (FWidth < 0) and (csDesigning in ComponentState) then
    begin
      FWidth := abs(FWidth);
      FScale.X := -FScale.X;
    end;
    if not(csLoading in ComponentState) then
    begin
      Repaint;
    end;
  end;
end;

procedure TControl3D.SetDepth(const Value: Single);
begin
  if FDepth <> Value then
  begin
    FDepth := Value;
    Resize3D;
    if (FDepth < 0) and (csDesigning in ComponentState) then
    begin
      FDepth := abs(FDepth);
      FScale.Z := -FScale.Z;
    end;
    if not (csLoading in ComponentState) then
    begin
      Repaint;
    end;
  end;
end;

function TControl3D.IsOpacityStored: Boolean;
begin
  //Result := FOpacity <> 1;
  Result := True;
end;

procedure TControl3D.SetZWrite(const Value: Boolean);
begin
  if FZWrite <> Value then
  begin
    FZWrite := Value;
    Repaint;
  end;
end;

procedure TControl3D.SetDesignVisible(const Value: Boolean);
begin
  if FDesignVisible <> Value then
  begin
    FDesignVisible := Value;
    if (csDesigning in ComponentState) then
      Repaint;
  end;
end;

procedure TControl3D.SetDragMode(const ADragMode: TDragMode);
begin
  FDragMode := ADragMode;
end;

procedure TControl3D.SetOpacity(const Value: Single);
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    if FOpacity < 0 then
      FOpacity := 0;
    if FOpacity > 1 then
      FOpacity := 1;
    RecalcOpacity;
    Repaint;
  end;
end;

{ TCamera }

constructor TCamera.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := False;
  FCanResize := False;
  Position.Point := Point3D(0, 0, -5);
end;

destructor TCamera.Destroy;
begin
  inherited;
end;

procedure TCamera.DesignClick;
begin
  inherited;
  if FViewport <> nil then
  begin
    if FSaveCamera = nil then
    begin
      FSaveCamera := FViewport.DesignCamera;
      FViewport.DesignCamera := Self;
      Repaint;
    end
    else
    begin
      FViewport.DesignCamera := FSaveCamera;
      FSaveCamera := nil;
    end;
  end;
end;

procedure TCamera.Render;
begin
  if Tag = $FFFE then
    Exit;
  if (csDesigning in ComponentState) then
  begin
    Context.SetContextState(TContextState.csLightOff);
    Context.SetContextState(TContextState.csTexDisable);
    Context.SetColor(TMaterialColor.mcDiffuse, $FF60A799);
    Context.FillCube(Vector3D(0, 0, 0), Vector3D(0.8, 0.8, 0.8), 1);
    Context.SetColor(TMaterialColor.mcDiffuse, $FF9C60A7);
    Context.FillCube(Vector3D(0, 0, 0.5), Vector3D(0.3, 0.3, 1.4), 1);
    Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3D(0, 0, 1), 1000), 1);
  end;
end;

function TCamera.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := False;
  if (csDesigning in ComponentState) then
    Result := inherited;
end;

procedure TCamera.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTarget) then
  begin
    FTarget := nil;
    MatrixChanged(Self);
  end;
end;

procedure TCamera.SetTarget(const Value: TControl3D);
begin
  FTarget := Value;
end;

{ TLight }

constructor TLight.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := False;
  FEnabled := True;
  FCanResize := False;
  FSpotCutOff := 180;
  FSpotExponent := 0;
  FConstantAttenuation := 1;
  FQuadraticAttenuation := 0;
  FLinearAttenuation := 0;
  FAmbient := $FF202020;
  FSpecular := $FFFFFFFF;
  FDiffuse := $FFA0A0A0;
end;

destructor TLight.Destroy;
begin
  inherited;
end;

procedure TLight.Render;
var
  i: Integer;
begin
  if (csDesigning in ComponentState) then
  begin
    Context.SetContextState(TContextState.csTexDisable);
    Context.SetContextState(TContextState.csLightOff);
    Context.SetColor(TMaterialColor.mcDiffuse, TAlphaColors.Yellow);
    Context.FillCube(Vector3D(0, 0, 0), Vector3DScale(Vector3D(Width, Height, Depth), 0.8), 1);
    Context.SetColor(TMaterialColor.mcDiffuse, TAlphaColors.Navy);
    Context.DrawCube(Vector3D(0, 0, 0), Vector3DScale(Vector3D(Width, Height, Depth), 0.8), 1);
    case LightType of
      TLightType.ltDirectional:
        begin
          Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3D(0, 0, 1), Width * 5), 1);
        end;
      TLightType.ltPoint:
        begin
          for i := 1 to 18 do
            Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3D(cos(DegToRad(i * 20)), sin(DegToRad(i * 20)),
              0), Width * 2), 1);
          for i := 1 to 18 do
            Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3D(cos(DegToRad(i * 20)), 0,
              sin(DegToRad(i * 20))), Width * 2), 1);
        end;
      TLightType.ltSpot:
        begin
          Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3DNormalize(Vector3D(0.2, -0.2, 1)), Width * 5), 1);
          Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3DNormalize(Vector3D(0.2, 0.2, 1)), Width * 5), 1);
          Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3DNormalize(Vector3D(-0.2, 0.2, 1)), Width * 5), 1);
          Context.DrawLine(Vector3D(0, 0, 0), Vector3DScale(Vector3DNormalize(Vector3D(-0.2, -0.2, 1)), Width * 5), 1);
        end;
    end;
  end;
end;

function TLight.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := False;
  if (csDesigning in ComponentState) then
    Result := inherited;
end;

procedure TLight.SetDepth(const Value: Single);
begin
  if Projection = TProjection.pjCamera then
    inherited SetDepth(1)
  else
    inherited SetDepth(25);
end;

procedure TLight.SetDiffuse(const Value: TAlphaColor);
begin
  if FDiffuse <> Value then
  begin
    FDiffuse := Value;
  end;
end;

procedure TLight.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if (FViewport <> nil) then
      FViewport.NeedRender;
  end;
end;

procedure TLight.SetHeight(const Value: Single);
begin
  if Projection = TProjection.pjCamera then
    inherited SetHeight(1)
  else
    inherited SetHeight(25);
end;

procedure TLight.SetLightType(const Value: TLightType);
begin
  if FLightType <> Value then
  begin
  FLightType := Value;
    case FLightType of
      TLightType.ltPoint:
        begin
          SpotCutOff := 180;
          SpotExponent := 0;
end;
      TLightType.ltSpot:
        begin
          SpotCutOff := 60;
          SpotExponent := 4;
        end;
    end;
  end;
end;

procedure TLight.SetAmbient(const Value: TAlphaColor);
begin
  if FAmbient <> Value then
  begin
    FAmbient := Value;
  end;
end;

procedure TLight.SetConstantAttenuation(const Value: Single);
begin
  if FConstantAttenuation <> Value then
  begin
    FConstantAttenuation := Value;
  end;
end;

procedure TLight.SetLinearAttenuation(const Value: Single);
begin
  if FLinearAttenuation <> Value then
  begin
    FLinearAttenuation := Value;
  end;
end;

procedure TLight.SetQuadraticAttenuation(const Value: Single);
begin
  if FQuadraticAttenuation <> Value then
  begin
    FQuadraticAttenuation := Value;
  end;
end;

procedure TLight.SetSpecular(const Value: TAlphaColor);
begin
  if FSpecular <> Value then
  begin
    FSpecular := Value;
  end;
end;

procedure TLight.SetSpotCutOff(const Value: Single);
begin
  if FSpotCutOff <> Value then
  begin
    FSpotCutOff := Value;
  end;
end;

procedure TLight.SetSpotExponent(const Value: Single);
begin
  if FSpotExponent <> Value then
  begin
    FSpotExponent := Value;
  end;
end;

procedure TLight.SetNewViewport(AViewport: IViewport3D);
begin
  if (FViewport <> nil) and (FViewport.Context <> nil) then
    FViewport.Context.DeleteLight(Self);
  inherited;
  if (FViewport <> nil) and (FViewport.Context <> nil) then
    FViewport.Context.AddLight(Self);
end;

procedure TLight.SetWidth(const Value: Single);
begin
  if Projection = TProjection.pjCamera then
    inherited SetWidth(1)
  else
    inherited SetWidth(25);
end;

{ TDummy }

constructor TDummy.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := False;
end;

destructor TDummy.Destroy;
begin
  inherited;
end;
                     
procedure TDummy.Render;
begin
  if Tag = $FFFE then
    Exit;

  if (csDesigning in ComponentState) and not Locked then
  begin
    Context.SetColor(TMaterialColor.mcDiffuse, $8060A799);
    Context.DrawCube(Vector3D(0, 0, 0), Vector3D(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

function TDummy.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := False;
  if (csDesigning in ComponentState) then
    Result := inherited;
end;

{ TProxyObject }

constructor TProxyObject.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TProxyObject.Destroy;
begin
  inherited;
end;

procedure TProxyObject.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FSourceObject) then
    SourceObject := nil;
end;

procedure TProxyObject.Render;
var
  SaveM: TMatrix3D;
  SaveS: TVector3D;
begin
  if FSourceObject <> nil then
  begin
    SaveM := FSourceObject.FAbsoluteMatrix;
    SaveS.X := FSourceObject.FWidth;
    SaveS.Y := FSourceObject.FHeight;
    SaveS.Z := FSourceObject.FDepth;
    FSourceObject.FAbsoluteMatrix := AbsoluteMatrix;
    FSourceObject.FWidth := FWidth;
    FSourceObject.FHeight := FHeight;
    FSourceObject.FDepth := FDepth;
    // FSourceObject.RecalcAbsolute;
    FSourceObject.Apply;
    FSourceObject.Render;
    FSourceObject.UnApply;
    FSourceObject.RenderChildren;
    FSourceObject.FAbsoluteMatrix := SaveM;
    FSourceObject.FWidth := SaveS.X;
    FSourceObject.FHeight := SaveS.Y;
    FSourceObject.FDepth := SaveS.Z;
    // FSourceObject.RecalcAbsolute;
  end;
end;

function TProxyObject.RayCastIntersect(const RayPos, RayDir: TVector3D; var Intersection: TVector3D): Boolean;
begin
  Result := inherited;
end;

procedure TProxyObject.SetSourceObject(const Value: TControl3D);
begin
  if (FSourceObject <> Value) and (Value <> Self) then
  begin
    FSourceObject := Value;
    Repaint;
  end;
end;

{ TViewport3D }

constructor TViewport3D.Create(AOwner: TComponent);
begin
  inherited;
  AutoCapture := True;
  ShowHint := True;
  Width := 100;
  Height := 100;
  FMultisample := TMultisample.ms4Samples;
  FBuffer := TBitmap.Create(100, 100);
  FContext := DefaultContextClass.CreateFromBitmap(FBuffer, FMultisample, True);
  FLights := TList.Create;

  FUsingDesignCamera := True;
  FFill := TAlphaColors.White;

  FDesignCameraZ := TDummy.Create(Self);
  with FDesignCameraZ do
  begin
    Tag := $FFFE;
    Locked := True;
    Stored := False;
  end;
  AddObject(FDesignCameraZ);

  FDesignCameraX := TDummy.Create(Self);
  with FDesignCameraX do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraZ;
    Locked := True;
    Stored := False;
    RotationAngle.X := -20;
  end;

  FDesignCamera := TCamera.Create(Self);
  with FDesignCamera do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraX;
    Locked := True;
    Stored := False;
    Position.Point := Point3D(0, 0, -20);
  end;
end;

destructor TViewport3D.Destroy;
begin
  DeleteChildren;
  FLights.Free;
  if (FContext <> nil) then
    FreeAndNil(FContext);
  if (FBuffer <> nil) then
    FreeAndNil(FBuffer);
  if FChildren <> nil then
    FreeAndNil(FChildren);
  FreeAndNil(FContext);
  inherited;
end;

procedure TViewport3D.Paint;
var
  R: TRectF;
  i: Integer;
begin
  if (csDesigning in ComponentState) then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
  if Context = nil then Exit;
  if FDrawing then Exit;
  FDrawing := True;
  try
    if Context.BeginScene then
    try
        { set matrix and camera }
        if Camera <> nil then
          Context.SetCamera(Camera);
        { Design Camera }
        if (csDesigning in ComponentState) or FUsingDesignCamera then
          Context.SetCamera(FDesignCamera);
        { set states }
        Context.ResetScene;
        { start }
        Context.Clear([TClearTarget.ctColor, TClearTarget.ctDepth], FFill, 1.0, 0);
        { reset }
        if FChildren <> nil then
          for i := 0 to FChildren.Count - 1 do
          begin
            if not (TFmxObject(FChildren[i]) is TControl3D) then Continue;
            if TControl3D(FChildren[i]).Visible or (not TControl3D(FChildren[i]).Visible and (csDesigning in TControl3D(FChildren[i]).ComponentState) and not TControl3D(FChildren[i]).Locked) then
            begin
              if not(TObject(FChildren[i]) is TControl3D) then
                Continue;
              if (csDesigning in ComponentState) and not TControl3D(FChildren[i]).DesignVisible then
                Continue;
              TControl3D(FChildren[i]).DoRender;
            end;
          end;
    finally
      Context.EndScene;
    end;
  finally
    { off flag }
    FDrawing := False;
  end;
  { draw }
  inherited Canvas.DrawBitmap(FBuffer, RectF(0, 0, FBuffer.Width, FBuffer.Height),
    RectF(0, 0, FBuffer.Width, FBuffer.Height), AbsoluteOpacity, True);
end;

procedure TViewport3D.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TControl3D then
  begin
    TControl3D(AObject).SetNewViewport(Self);
    TControl3D(AObject).Repaint;
  end;
  if (csDesigning in ComponentState) and (AObject is TCamera) and (AObject.Tag <> $FFFE) then
    Camera := TCamera(AObject);
end;

procedure TViewport3D.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TControl3D then
    TControl3D(AObject).SetNewViewport(nil);
end;

procedure TViewport3D.Realign;
begin
  inherited;
  if (Context <> nil) then
  begin
    FBuffer.SetSize(Trunc(Width), Trunc(Height));
    Context.SetSize(Trunc(Width), Trunc(Height));
    AlignObjects(Self, Margins, FBuffer.Width, FBuffer.Height, FLastWidth, FLastHeight, FDisableAlign);
  end;
end;

procedure TViewport3D.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FCamera) then
    FCamera := nil;
end;

function TViewport3D.ObjectAtPoint(P: TPointF): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
begin
  Result := nil;
  NewObj := inherited ObjectAtPoint(P);
  if NewObj = nil then Exit;
  NewObj := nil;

  // first screen projection
  GlobalDistance := $FFFF;
  GlobalProjection := TProjection.pjScreen;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.GetVisible and not(csDesigning in ComponentState) then
      Continue;
    NewObj := NewObj.ObjectAtPoint(P);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if Result = nil then
  begin
    // second camera projection
    GlobalDistance := $FFFF;
    GlobalProjection := TProjection.pjCamera;
    for i := ChildrenCount - 1 downto 0 do
    begin
      Obj := Children[i];
      if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.GetVisible and not(csDesigning in ComponentState) then
        Continue;
      NewObj := NewObj.ObjectAtPoint(P);
      if NewObj <> nil then
        Result := NewObj;
    end;
  end;
  if Result = nil then
    Result := inherited ObjectAtPoint(P);
end;

function TViewport3D.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
begin
  Result := nil;
  // first screen projection
  GlobalDistance := $FFFF;
  GlobalProjection := TProjection.pjScreen;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.Visible then
      Continue;
    NewObj := NewObj.FindTarget(P, Data);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if Result = nil then
  begin
    // second camera projection
    GlobalDistance := $FFFF;
    GlobalProjection := TProjection.pjCamera;
    for i := ChildrenCount - 1 downto 0 do
    begin
      Obj := Children[i];
      if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.Visible then
        Continue;
      NewObj := NewObj.FindTarget(P, Data);
      if NewObj <> nil then
        Result := NewObj;
    end;
  end;
  if Result = nil then
    Result := inherited FindTarget(P, Data);
end;

function TViewport3D.GetFill: TAlphaColor;
begin
  Result := FFill;
end;

procedure TViewport3D.SetFill(const Value: TAlphaColor);
begin
  if FFill <> Value then
  begin
    FFill := Value;
    Repaint;
  end;
end;

procedure TViewport3D.SetMultisample(const Value: TMultisample);
begin
  if FMultisample <> Value then
  begin
    FMultisample := Value;
    if Context <> nil then
      Context.SetMultisample(FMultisample);
  end;
end;

{ IViewport3D }

function TViewport3D.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TViewport3D.GetContext: TContext3D;
begin
  Result := FContext;
end;

function TViewport3D.GetScene: IScene;
begin
  Result := Scene;
end;

function TViewport3D.GetDesignCamera: TCamera;
begin
  Result := FDesignCamera;
end;

procedure TViewport3D.SetDesignCamera(const ACamera: TCamera);
begin
  FDesignCamera := ACamera;
end;

procedure TViewport3D.NeedRender;
begin
  Repaint;
  UpdateEffects;
end;

initialization
  RegisterFmxClasses([TPosition3D, TMeshData, TMaterial, TCamera, TLight, TDummy,
    TProxyObject, TViewport3D], [TPosition3D, TMeshData, TMaterial]);
end.
