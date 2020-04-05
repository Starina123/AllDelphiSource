{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Types;

{$I FMX_Defines.inc}
{$MINENUMSIZE 4}
{$H+}

interface

uses
  Types, UITypes, Variants, Classes, SysUtils,
{$IFDEF FPC}
  fgl;
{$ELSE}
  System.Generics.Collections;
{$ENDIF}

{$SCOPEDENUMS ON}

const
{$HPPEMIT '#define FireMonkeyVersion 16.3'}
  FireMonkeyVersion = 16.3;
  InvalidCanvasState: Pointer = Pointer($FFFFFFFF);

{ Global Settings }

var
  // On low-end hardware or mobile bitmap effects are slowly
  GlobalDisableFocusEffect: Boolean = False;
  // Use Direct2D in Windows Vista or Windows 7 by default
  GlobalUseDirect2D: Boolean = True;
  // Use Direct2D in Windows Vista or Windows 7 in software mode
  GlobalUseDirect2DSoftware: Boolean = False;
  // Use ClearType rendering in GDI+ renderer
  GlobalUseGDIPlusClearType: Boolean = True;
  // Use HW accelerated effect if possible
  GlobalUseHWEffects: Boolean = True;

{$IFDEF FPCCOMP}
{$I FMX_Types_FPC.inc}
{$ENDIF}

{$IFDEF FPC}
{$I FMX_Types_FPC.inc}
{$ENDIF}

type

{$IFDEF FPCCOMP}
  TWideStringList = TStringList;
  TWideStrings = TStrings;
{$ENDIF}

  PPointArray = ^TPointArray;
  TPointArray = array [0 .. 0] of TPointF;

                                                             
  TCorner = (crTopLeft, crTopRight, crBottomLeft, crBottomRight);

  TCorners = set of TCorner;

  TCornerType = (ctRound, ctBevel, ctInnerRound, ctInnerLine);

  TSide = (sdTop, sdLeft, sdBottom, sdRight);

  TSides = set of TSide;

  PAlphaColorArray = ^TAlphaColorArray;
  TAlphaColorArray = array [0 .. MaxInt div 4 - 1] of TAlphaColor;

  PAlphaColorRecArray = ^TAlphaColorRecArray;
  TAlphaColorRecArray = array [0 .. MaxInt div 4 - 1] of TAlphaColorRec;

const
  claAliceblue = TAlphaColors.AliceBlue;
  claAntiquewhite = TAlphaColors.Antiquewhite;
  claAqua = TAlphaColors.Aqua;
  claAquamarine = TAlphaColors.Aquamarine;
  claAzure = TAlphaColors.Azure;
  claBeige = TAlphaColors.Beige;
  claBisque = TAlphaColors.Bisque;
  claBlack = TAlphaColors.Black;
  claBlanchedalmond = TAlphaColors.Blanchedalmond;
  claBlue = TAlphaColors.Blue;
  claBlueviolet = TAlphaColors.Blueviolet;
  claBrown = TAlphaColors.Brown;
  claBurlywood = TAlphaColors.Burlywood;
  claCadetblue = TAlphaColors.Cadetblue;
  claChartreuse = TAlphaColors.Chartreuse;
  claChocolate = TAlphaColors.Chocolate;
  claCoral = TAlphaColors.Coral;
  claCornflowerblue = TAlphaColors.Cornflowerblue;
  claCornsilk = TAlphaColors.Cornsilk;
  claCrimson = TAlphaColors.Crimson;
  claCyan = TAlphaColors.Cyan;
  claDarkblue = TAlphaColors.Darkblue;
  claDarkcyan = TAlphaColors.Darkcyan;
  claDarkgoldenrod = TAlphaColors.Darkgoldenrod;
  claDarkgray = TAlphaColors.Darkgray;
  claDarkgreen = TAlphaColors.Darkgreen;
  claDarkgrey = TAlphaColors.Darkgrey;
  claDarkkhaki = TAlphaColors.Darkkhaki;
  claDarkmagenta = TAlphaColors.Darkmagenta;
  claDarkolivegreen = TAlphaColors.Darkolivegreen;
  claDarkorange = TAlphaColors.Darkorange;
  claDarkorchid = TAlphaColors.Darkorchid;
  claDarkred = TAlphaColors.Darkred;
  claDarksalmon = TAlphaColors.Darksalmon;
  claDarkseagreen = TAlphaColors.Darkseagreen;
  claDarkslateblue = TAlphaColors.Darkslateblue;
  claDarkslategray = TAlphaColors.Darkslategray;
  claDarkslategrey = TAlphaColors.Darkslategrey;
  claDarkturquoise = TAlphaColors.Darkturquoise;
  claDarkviolet = TAlphaColors.Darkviolet;
  claDeeppink = TAlphaColors.Deeppink;
  claDeepskyblue = TAlphaColors.Deepskyblue;
  claDimgray = TAlphaColors.Dimgray;
  claDimgrey = TAlphaColors.Dimgrey;
  claDodgerblue = TAlphaColors.Dodgerblue;
  claFirebrick = TAlphaColors.Firebrick;
  claFloralwhite = TAlphaColors.Floralwhite;
  claForestgreen = TAlphaColors.Forestgreen;
  claFuchsia = TAlphaColors.Fuchsia;
  claGainsboro = TAlphaColors.Gainsboro;
  claGhostwhite = TAlphaColors.Ghostwhite;
  claGold = TAlphaColors.Gold;
  claGoldenrod = TAlphaColors.Goldenrod;
  claGray = TAlphaColors.Gray;
  claGreen = TAlphaColors.Green;
  claGreenyellow = TAlphaColors.Greenyellow;
  claGrey = TAlphaColors.Grey;
  claHoneydew = TAlphaColors.Honeydew;
  claHotpink = TAlphaColors.Hotpink;
  claIndianred = TAlphaColors.Indianred;
  claIndigo = TAlphaColors.Indigo;
  claIvory = TAlphaColors.Ivory;
  claKhaki = TAlphaColors.Khaki;
  claLavender = TAlphaColors.Lavender;
  claLavenderblush = TAlphaColors.Lavenderblush;
  claLawngreen = TAlphaColors.Lawngreen;
  claLemonchiffon = TAlphaColors.Lemonchiffon;
  claLightblue = TAlphaColors.Lightblue;
  claLightcoral = TAlphaColors.Lightcoral;
  claLightcyan = TAlphaColors.Lightcyan;
  claLightgoldenrodyellow = TAlphaColors.Lightgoldenrodyellow;
  claLightgray = TAlphaColors.Lightgray;
  claLightgreen = TAlphaColors.Lightgreen;
  claLightgrey = TAlphaColors.Lightgrey;
  claLightpink = TAlphaColors.Lightpink;
  claLightsalmon = TAlphaColors.Lightsalmon;
  claLightseagreen = TAlphaColors.Lightseagreen;
  claLightskyblue = TAlphaColors.Lightskyblue;
  claLightslategray = TAlphaColors.Lightslategray;
  claLightslategrey = TAlphaColors.Lightslategrey;
  claLightsteelblue = TAlphaColors.Lightsteelblue;
  claLightyellow = TAlphaColors.Lightyellow;
  claLime = TAlphaColors.Lime;
  claLimegreen = TAlphaColors.Limegreen;
  claLinen = TAlphaColors.Linen;
  claMagenta = TAlphaColors.Magenta;
  claMaroon = TAlphaColors.Maroon;
  claMediumaquamarine = TAlphaColors.Mediumaquamarine;
  claMediumblue = TAlphaColors.Mediumblue;
  claMediumorchid = TAlphaColors.Mediumorchid;
  claMediumpurple = TAlphaColors.Mediumpurple;
  claMediumseagreen = TAlphaColors.Mediumseagreen;
  claMediumslateblue = TAlphaColors.Mediumslateblue;
  claMediumspringgreen = TAlphaColors.Mediumspringgreen;
  claMediumturquoise = TAlphaColors.Mediumturquoise;
  claMediumvioletred = TAlphaColors.Mediumvioletred;
  claMidnightblue = TAlphaColors.Midnightblue;
  claMintcream = TAlphaColors.Mintcream;
  claMistyrose = TAlphaColors.Mistyrose;
  claMoccasin = TAlphaColors.Moccasin;
  claNavajowhite = TAlphaColors.Navajowhite;
  claNavy = TAlphaColors.Navy;
  claOldlace = TAlphaColors.Oldlace;
  claOlive = TAlphaColors.Olive;
  claOlivedrab = TAlphaColors.Olivedrab;
  claOrange = TAlphaColors.Orange;
  claOrangered = TAlphaColors.Orangered;
  claOrchid = TAlphaColors.Orchid;
  claPalegoldenrod = TAlphaColors.Palegoldenrod;
  claPalegreen = TAlphaColors.Palegreen;
  claPaleturquoise = TAlphaColors.Paleturquoise;
  claPalevioletred = TAlphaColors.Palevioletred;
  claPapayawhip = TAlphaColors.Papayawhip;
  claPeachpuff = TAlphaColors.Peachpuff;
  claPeru = TAlphaColors.Peru;
  claPink = TAlphaColors.Pink;
  claPlum = TAlphaColors.Plum;
  claPowderblue = TAlphaColors.Powderblue;
  claPurple = TAlphaColors.Purple;
  claRed = TAlphaColors.Red;
  claRosybrown = TAlphaColors.Rosybrown;
  claRoyalblue = TAlphaColors.Royalblue;
  claSaddlebrown = TAlphaColors.Saddlebrown;
  claSalmon = TAlphaColors.Salmon;
  claSandybrown = TAlphaColors.Sandybrown;
  claSeagreen = TAlphaColors.Seagreen;
  claSeashell = TAlphaColors.Seashell;
  claSienna = TAlphaColors.Sienna;
  claSilver = TAlphaColors.Silver;
  claSkyblue = TAlphaColors.Skyblue;
  claSlateblue = TAlphaColors.Slateblue;
  claSlategray = TAlphaColors.Slategray;
  claSlategrey = TAlphaColors.Slategrey;
  claSnow = TAlphaColors.Snow;
  claSpringgreen = TAlphaColors.Springgreen;
  claSteelblue = TAlphaColors.Steelblue;
  claTan = TAlphaColors.Tan;
  claTeal = TAlphaColors.Teal;
  claThistle = TAlphaColors.Thistle;
  claTomato = TAlphaColors.Tomato;
  claTurquoise = TAlphaColors.Turquoise;
  claViolet = TAlphaColors.Violet;
  claWheat = TAlphaColors.Wheat;
  claWhite = TAlphaColors.White;
  claWhitesmoke = TAlphaColors.Whitesmoke;
  claYellow = TAlphaColors.Yellow;
  claYellowgreen = TAlphaColors.Yellowgreen;
  claNull = TAlphaColors.Null;

const
  IdentityMatrix: TMatrix = (m11: 1.0; m12: 0.0; m13: 0.0; m21: 0.0; m22: 1.0; m23: 0.0; m31: 0.0; m32: 0.0; m33: 1.0);
  NullRect: TRectF = (Left: 0; Top: 0; Right: 0; Bottom: 0);

  AllCorners: TCorners = [TCorner.crTopLeft, TCorner.crTopRight,
    TCorner.crBottomLeft, TCorner.crBottomRight];

  AllSides: TSides = [TSide.sdTop, TSide.sdLeft, TSide.sdBottom, TSide.sdRight];

  ClosePolygon: TPointF = (X: $FFFF; Y: $FFFF);

type

  TAlignLayout = (alNone, alTop, alLeft, alRight, alBottom, alMostTop, alMostBottom, alMostLeft, alMostRight, alClient,
    alContents, alCenter, alVertCenter, alHorzCenter, alHorizontal, alVertical, alScale, alFit, alFitLeft, alFitRight);

  TImeMode = (imDontCare, // All IMEs
              imDisable,  // All IMEs
              imClose,    // Chinese and Japanese only
              imOpen,     // Chinese and Japanese only
              imSAlpha,   // Japanese and Korea
              imAlpha,    // Japanese and Korea
              imHira,     // Japanese only
              imSKata,    // Japanese only
              imKata,     // Japanese only
              imChineseClose, // Chinese IME only
              imOnHalf,   // Chinese IME only
              imSHanguel, // Korean IME only
              imHanguel   // Korean IME only
              );

  TDragObject = record
    Source: TObject;
    Files: array of string;
    Data: Variant;
  end;

  TFmxHandle = THandle;

  TCanvas = class;
  TFmxObject = class;
  TFmxObjectClass = class of TFmxObject;
  TControl = class;
  TStyleBook = class;
  TStyledControl = class;
  TBitmap = class;
  TBounds = class;
  TTextService = class;
  TLineMetricInfo = class;

  IFreeNotification = interface
    ['{63F90BB9-3889-4B25-83AF-A17A7A6250AE}']
    procedure FreeNotification(AObject: TObject);
  end;

  IContainerObject = interface
    ['{EFCF762F-1955-4347-B63D-60FBF7D72113}']
    function GetContainerWidth: Single;
    function GetContainerHeight: Single;
    property ContainerWidth: single read GetContainerWidth;
    property ContainerHeight: single read GetContainerHeight;
  end;

  IControl = interface
    ['{92525E9E-CB12-4374-AD66-E4067B0977F8}']
    function GetObject: TFmxObject;
    procedure SetFocus;
    procedure DoEnter;
    procedure DoExit;
    procedure DoMouseEnter;
    procedure DoMouseLeave;
    procedure AddFreeNotify(const AObject: IFreeNotification);
    procedure RemoveFreeNotify(const AObject: IFreeNotification);
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
    function ObjectAtPoint(P: TPointF): IControl;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure MouseMove(Shift: TShiftState; X, Y: Single);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
    procedure KeyDown(var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
    procedure KeyUp(var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
    procedure DialogKey(var Key: Word; Shift: TShiftState);
    function FindTarget(P: TPointF; const Data: TDragObject): IControl;
    procedure DragEnter(const Data: TDragObject; const Point: TPointF);
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
    procedure DragDrop(const Data: TDragObject; const Point: TPointF);
    procedure DragLeave;
    procedure DragEnd;
    function CheckForAllowFocus: Boolean;
    function GetTabOrderValue: TTabOrder;
    procedure UpdateTabOrder(Value: TTabOrder);
    procedure Repaint;
    function GetDragMode: TDragMode;
    procedure SetDragMode(const ADragMode: TDragMode);
    procedure BeginAutoDrag;
    function GetParent: TFmxObject;
    function GetLocked: Boolean;
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
    function GetHitTest: Boolean;
    function GetCursor: TCursor;
    function GetDesignInteractive: Boolean;
    function GetAcceptsControls: Boolean;
    { access }
    property Cursor: TCursor read GetCursor;
    property DragMode: TDragMode read GetDragMode write SetDragMode;
    property DesignInteractive: Boolean read GetDesignInteractive;
    property Parent: TFmxObject read GetParent;
    property Locked: Boolean read GetLocked;
    property HitTest: Boolean read GetHitTest;
    property Visible: Boolean read GetVisible write SetVisible;
    property AcceptsControls: Boolean read GetAcceptsControls;
  end;

  IRoot = interface
    ['{CB12996D-E6B0-4390-9C41-8661444C7B5E}']
    procedure AddObject(AObject: TFmxObject);
    procedure InsertObject(Index: Integer; AObject: TFmxObject);
    procedure RemoveObject(AObject: TFmxObject); overload;
    procedure RemoveObject(Index: Integer); overload;
    procedure BeginInternalDrag(Source: TObject; ABitmap: TBitmap);
    function GetActiveControl: TStyledControl;
    procedure SetActiveControl(AControl: TStyledControl);
    function GetCaptured: IControl;
    procedure SetCaptured(const Value: IControl);
    function GetFocused: IControl;
    procedure SetFocused(const Value: IControl);
    function GetObject: TFmxObject;
    function GetBiDiMode: TBiDiMode;
    { access }
    property Captured: IControl read GetCaptured write SetCaptured;
    property Focused: IControl read GetFocused write SetFocused;
    property BiDiMode: TBiDiMode read GetBiDiMode;
  end;

  IScene = interface
    ['{F2C95BEC-D9F0-43BE-B872-499B6BC5C92E}']
    procedure AddUpdateRect(R: TRectF);
    function GetStyleBook: TStyleBook;
    procedure SetStyleBook(const Value: TStyleBook);
    procedure UpdateStyle;
    function GetUpdateRectsCount: Integer;
    function GetUpdateRect(const Index: Integer): TRectF;
    function GetObject: TFmxObject;
    function GetCanvas: TCanvas;
    function GetTransparency: Boolean;
    function LocalToScreen(P: TPointF): TPointF;
    function ScreenToLocal(P: TPointF): TPointF;
    function GetAnimatedCaret: Boolean;
    { access }
    property Canvas: TCanvas read GetCanvas;
    property StyleBook: TStyleBook read GetStyleBook write SetStyleBook;
  end;

  IAlignRoot = interface
    ['{85177A60-A2B8-474C-A495-CAD7D3A82A26}']
    procedure Realign;
  end;

  ///  <summary>Enumeration used by controls which support IVirtualKeyboardControl
  ///  interface to control the type of on-screen keyboard to be displayed.
  ///  The values may have different interpretations on different devices, but
  ///  should generally follow these guidelines:
  ///  <para><c>vktDefault:</c> An alpha-numeric keyboard for general
  ///  text entry</para>
  ///  <para><c>vktNumbersAndPunctuation:</c> A keyboard which provides for numeric
  ///  entry and punctuation symbols.</para>
  ///  <para><c>vktNumberPad:</c> A numeric-only keyboard.</para>
  ///  <para><c>vktPhonePad:</c> A keyboard for entering a telephone number,
  ///  including '*' and '#' symbols.</para></summary>
  TVirtualKeyboardType = (vktDefault, vktNumbersAndPunctuation, vktNumberPad, vktPhonePad);

  /// <summary>Controls which implement this interface can set the style of on-screen
  ///  keyboard which will be displayed when the control is activated. This
  ///  setting is used only on devices which use an on-screen keyboard. It is ignored
  ///  on devices which use a physical keyboard for text entry.</summary>
  IVirtualKeyboardControl = interface
    ['{2E1C38E6-942D-4F53-90C0-7899536411B3}']
    procedure SetKeyboardType(Value: TVirtualKeyboardType);
    function GetKeyboardType: TVirtualKeyboardType;
    property KeyboardType: TVirtualKeyboardType read GetKeyboardType write SetKeyboardType;
  end;

  IAlignableObject = interface
    ['{9231E7A9-13F9-48B3-BF25-41F7B31F891F}']
    function GetAlign: TAlignLayout;
    procedure SetAlign(const Value: TAlignLayout);
    function GetAnchors: TAnchors;
    procedure SetAnchors(const Value: TAnchors);
    function GetPadding: TBounds;
    procedure SetBounds(X, Y, AWidth, AHeight: Single);
    function GetWidth: single;
    function GetHeight: single;
    function GetLeft: single;
    function GetTop: single;
    function GetAllowAlign: Boolean;
    { access }
    property Align: TAlignLayout read GetAlign write SetAlign;
    property AllowAlign: Boolean read GetAllowAlign;
    property Anchors: TAnchors read GetAnchors write SetAnchors;
    property Padding: TBounds read GetPadding;
    property Left: single read GetLeft;
    property Height: single read GetHeight;
    property Width: single read GetWidth;
    property Top: single read GetTop;
  end;

  IItemsContainer = interface
    ['{9BDF3339-93F8-4291-A975-5965F7C10A37}']
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetObject: TFmxObject;
  end;

  ITextServiceControl = interface
    ['{081F7739-10D3-4E5F-BB3D-A610AB6C675C}']
    function GetTextService: TTextService;
    procedure UpdateCaretPoint;
    function GetTargetClausePointF: TPointF;
  end;

  TSplineVector = array [0..3] of Single;
  TSplineMatrix = array of TSplineVector;

  TSpline = class(TObject)
  private
    matX, matY: TSplineMatrix;
    len: Integer;
  public
    constructor Create(const Polygon: TPolygon);
    destructor Destroy; override;
    procedure SplineXY(const t: Single; var X, Y: Single);
  end;

{ TBounds }

  TBounds = class(TPersistent)
  private
    FRight: Single;
    FBottom: Single;
    FTop: Single;
    FLeft: Single;
    FOnChange: TNotifyEvent;
    FDefaultValue: TRectF;
    function GetRect: TRectF;
    procedure SetRect(const Value: TRectF);
    procedure SetBottom(const Value: Single);
    procedure SetLeft(const Value: Single);
    procedure SetRight(const Value: Single);
    procedure SetTop(const Value: Single);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadRect(Reader: TReader);
    procedure WriteRect(Writer: TWriter);
  public
    constructor Create(const ADefaultValue: TRectF); virtual;
    procedure Assign(Source: TPersistent); override;
    function MarginRect(const R: TRectF): TRectF;
    function PaddinRect(const R: TRectF): TRectF;
    function Width: Single;
    function Height: Single;
    property Rect: TRectF read GetRect write SetRect;
    property DefaultValue: TRectF read FDefaultValue write FDefaultValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    function Empty: Boolean;
    function MarginEmpty: Boolean;
  published
    property Left: Single read FLeft write SetLeft stored False;
    property Top: Single read FTop write SetTop stored False;
    property Right: Single read FRight write SetRight stored False;
    property Bottom: Single read FBottom write SetBottom stored False;
  end;

{ TPosition }

  TPosition = class(TPersistent)
  private
    FOnChange: TNotifyEvent;
    FY: Single;
    FX: Single;
    FDefaultValue: TPointF;
    procedure SetPoint(const Value: TPointF);
    procedure SetX(const Value: Single);
    procedure SetY(const Value: Single);
    function GetPoint: TPointF;
    function GetVector: TVector;
    procedure SetVector(const Value: TVector);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadPoint(Reader: TReader);
    procedure WritePoint(Writer: TWriter);
  public
    constructor Create(const ADefaultValue: TPointF); virtual;
    procedure Assign(Source: TPersistent); override;
    function Empty: Boolean;
    procedure Reflect(const Normal: TVector);
    property Point: TPointF read GetPoint write SetPoint;
    property Vector: TVector read GetVector write SetVector;
    property DefaultValue: TPointF read FDefaultValue write FDefaultValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property X: Single read FX write SetX stored False;
    property Y: Single read FY write SetY stored False;
  end;

{ TTransform }

  TTransform = class(TPersistent)
  private
    FMatrix: TMatrix;
    FRotationAngle: Single;
    FPosition: TPosition;
    FScale: TPosition;
    FSkew: TPosition;
    FRotationCenter: TPosition;
    FOnChanged: TNotifyEvent;
    procedure SetRotationAngle(const Value: Single);
  protected
    procedure MatrixChanged(Sender: TObject);
    property Skew: TPosition read FSkew write FSkew;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Matrix: TMatrix read FMatrix;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Position: TPosition read FPosition write FPosition;
    property Scale: TPosition read FScale write FScale;
    property RotationAngle: Single read FRotationAngle write SetRotationAngle;
    property RotationCenter: TPosition read FRotationCenter write FRotationCenter;
  end;

{ TGradientPoint }

  TGradientPoint = class(TCollectionItem)
  private
    FColor: TAlphaColor;
    FOffset: Single;
    function GetColor: TAlphaColor;
    procedure SetColor(const Value: TAlphaColor);
  public
    procedure Assign(Source: TPersistent); override;
    property IntColor: TAlphaColor read FColor write FColor;
  published
    property Color: TAlphaColor read GetColor write SetColor;
    property Offset: Single read FOffset write FOffset;
  end;

{ TGradientPoints }

  TGradientPoints = class(TCollection)
  private
    function GetPoint(Index: Integer): TGradientPoint;
  public
    property Points[Index: Integer]: TGradientPoint read GetPoint; default;
  end;

{ TGradient }

  TGradientStyle = (gsLinear, gsRadial);

  TGradient = class(TPersistent)
  private
    FPoints: TGradientPoints;
    FOnChanged: TNotifyEvent;
    FStartPosition: TPosition;
    FStopPosition: TPosition;
    FStyle: TGradientStyle;
    FRadialTransform: TTransform;
    procedure SetStartPosition(const Value: TPosition);
    procedure SetStopPosition(const Value: TPosition);
    procedure PositionChanged(Sender: TObject);
    procedure SetColor(const Value: TAlphaColor);
    procedure SetColor1(const Value: TAlphaColor);
    function IsLinearStored: Boolean;
    procedure SetStyle(const Value: TGradientStyle);
    function IsRadialStored: Boolean;
    procedure SetRadialTransform(const Value: TTransform);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Change;
    function InterpolateColor(Offset: Single): TAlphaColor;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    { fast access }
    property Color: TAlphaColor write SetColor;
    property Color1: TAlphaColor write SetColor1;
  published
    property Points: TGradientPoints read FPoints write FPoints;
    property Style: TGradientStyle read FStyle write SetStyle default TGradientStyle.gsLinear;
    { linear }
    property StartPosition: TPosition read FStartPosition write SetStartPosition stored IsLinearStored;
    property StopPosition: TPosition read FStopPosition write SetStopPosition stored IsLinearStored;
    { radial }
    property RadialTransform: TTransform read FRadialTransform write SetRadialTransform stored IsRadialStored;
  end;

{ TBrushGrab }

  TBrushGrab = class(TInterfacedPersistent, IFreeNotification)
  private
    FOnChanged: TNotifyEvent;
    FControl: TControl;
    procedure SetControl(const Value: TControl);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Control: TControl read FControl write SetControl;
  end;

{ TBrushResource }

  TBrush = class;
  TBrushObject = class;

  TBrushResource = class(TInterfacedPersistent, IFreeNotification)
  private
    FStyleResource: TBrushObject;
    FStyleLookup: WideString;
    FOnChanged: TNotifyEvent;
    function GetBrush: TBrush;
    procedure SetStyleResource(const Value: TBrushObject);
    function GetStyleLookup: WideString;
    procedure SetStyleLookup(const Value: WideString);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
  public
    destructor Destroy; override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    procedure Assign(Source: TPersistent); override;
    property Brush: TBrush read GetBrush;
  published
    property StyleResource: TBrushObject read FStyleResource write SetStyleResource stored False;
    property StyleLookup: WideString read GetStyleLookup write SetStyleLookup;
  end;

{ TBrushBitmap }

  TWrapMode = (wmTile, wmTileOriginal, wmTileStretch);

  TBrushBitmap = class(TInterfacedPersistent)
  private
    FOnChanged: TNotifyEvent;
    FBitmap: TBitmap;
    FWrapMode: TWrapMode;
    procedure SetWrapMode(const Value: TWrapMode);
    procedure SetBitmap(Value: TBitmap);
  protected
    procedure DoChanged; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    procedure Assign(Source: TPersistent); override;
  published
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property WrapMode: TWrapMode read FWrapMode write SetWrapMode;
  end;

{ TBrush }

  TBrushKind = (bkNone, bkSolid, bkGradient, bkBitmap, bkResource, bkGrab);

  TBrush = class(TPersistent)
  private
    FColor: TAlphaColor;
    FKind: TBrushKind;
    FOnChanged: TNotifyEvent;
    FGradient: TGradient;
    FGrab: TBrushGrab;
    FDefaultKind: TBrushKind;
    FDefaultColor: TAlphaColor;
    FResource: TBrushResource;
    FBitmap: TBrushBitmap;
    FOnGradientChanged: TNotifyEvent;
    procedure SetColor(const Value: TAlphaColor);
    procedure SetKind(const Value: TBrushKind);
    procedure SetGradient(const Value: TGradient);
    procedure SetGrab(const Value: TBrushGrab);
    function IsColorStored: Boolean;
    function IsGradientStored: Boolean;
    function IsGrabStored: Boolean;
    function GetColor: TAlphaColor;
    function IsKindStored: Boolean;
    procedure SetResource(const Value: TBrushResource);
    function IsResourceStored: Boolean;
    function IsBitmapStored: Boolean;
  protected
    procedure GradientChanged(Sender: TObject);
    procedure GrabChanged(Sender: TObject);
    procedure ResourceChanged(Sender: TObject);
    procedure BitmapChanged(Sender: TObject);
  public
    constructor Create(const ADefaultKind: TBrushKind; const ADefaultColor: TAlphaColor);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnGradientChanged: TNotifyEvent read FOnGradientChanged write FOnGradientChanged;
    property DefaultColor: TAlphaColor read FDefaultColor write FDefaultColor;
    property DefaultKind: TBrushKind read FDefaultKind write FDefaultKind;
  published
    property Color: TAlphaColor read GetColor write SetColor stored IsColorStored;
    property Bitmap: TBrushBitmap read FBitmap write FBitmap stored IsBitmapStored;
    property Kind: TBrushKind read FKind write SetKind stored IsKindStored;
    property Gradient: TGradient read FGradient write SetGradient stored IsGradientStored;
    property Resource: TBrushResource read FResource write SetResource stored IsResourceStored;
    property Grab: TBrushGrab read FGrab write SetGrab stored IsGrabStored;
  end;

{ TFont }

  TFont = class(TPersistent)
  private
    FSize: Single;
    FFamily: TFontName;
    FStyle: TFontStyles;
    FOnChanged: TNotifyEvent;
    procedure SetFamily(const Value: TFontName);
    procedure SetSize(const Value: Single);
    procedure SetStyle(const Value: TFontStyles);
    function IsFamilyStored: Boolean;
    function IsSizeStored: Boolean;
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Family: TFontName read FFamily write SetFamily stored IsFamilyStored;
    property Size: Single read FSize write SetSize stored IsSizeStored;
    property Style: TFontStyles read FStyle write SetStyle default [];
  end;

  TTextAlign = (taCenter, taLeading, taTrailing);

{ TBitmapCodec }
  TBitmapCodecClass = class of TBitmapCodec;

  TBitmapCodec = class(TPersistent)
  public
    { Class static method for C++ access }
    class function GetDefaultBitmapCodec(C: TBitmapCodecClass): TBitmapCodec; static;
  published
    class function GetFileTypes: WideString; virtual;
    class function GetImageSize(const AFileName: WideString): TPointF; virtual;
    function LoadFromFile(const AFileName: WideString; const Rotate: Single; var Bitmap: TBitmap): Boolean;
      virtual; abstract;
    function LoadThumbnailFromFile(const AFileName: WideString; const AFitWidth, AFitHeight: Single;
      const UseEmbedded: Boolean; var Bitmap: TBitmap): Boolean; virtual; abstract;
    function SaveToFile(const AFileName: WideString; var Bitmap: TBitmap; const Params: WideString = ''): Boolean;
      virtual; abstract;
    function LoadFromStream(const AStream: TStream; var Bitmap: TBitmap): Boolean; virtual; abstract;
    { Format is a string from "jpeg,png,bmp" }
    function SaveToStream(const AStream: TStream; var Bitmap: TBitmap; const Format: WideString;
      const Params: WideString = ''): Boolean; virtual; abstract;
  end;

{ TBitmap }

  TBitmapHandle = record
    Item: Pointer;
    Data: Pointer;
    NeedUpdate: Boolean;
  end;

  TBitmapObject = class;

  TBitmap = class(TInterfacedPersistent, IStreamPersist, IFreeNotification)
  private
    FNotifyList: TList;
    FBits: PAlphaColorArray;
    FHeight: Integer;
    FOnChange: TNotifyEvent;
    FWidth: Integer;
    FResource: TObject;
    FStyleLookup: WideString;
    function GetCanvas: TCanvas;
    function GetScanline(Y: Integer): PAlphaColorArray;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    function GetPixels(X, Y: Integer): TAlphaColor;
    function GetStyleLookup: WideString;
    procedure SetStyleLookup(const Value: WideString);
    function GetBitmap: TBitmap;
    function GetHandle(AItem: Pointer): Pointer;
    procedure SetHandle(AItem: Pointer; const Value: Pointer);
    function GetNeedUpdate(AItem: Pointer): Boolean;
    procedure SetNeedUpdate(AItem: Pointer; const Value: Boolean);
    procedure SetPixels(X, Y: Integer; const Value: TAlphaColor);
  protected
    { internal }
    FCanvas: TCanvas;
    FHandles: array of TBitmapHandle;
    procedure Recreate;
    { vcl }
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadBitmap(Stream: TStream);
    procedure WriteBitmap(Stream: TStream);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
  public
    constructor Create(const AWidth, AHeight: Integer); virtual;
    constructor CreateFromStream(const AStream: TStream); virtual;
    constructor CreateFromFile(const AFileName: WideString); virtual;
    constructor CreateFromBitmapAndMask(const Bitmap, Mask: TBitmap);
    procedure Assign(Source: TPersistent); override;
    destructor Destroy; override;
    procedure SetSize(const AWidth, AHeight: Integer);
    procedure Clear(const AColor: TAlphaColor); virtual;
    procedure ClearRect(const ARect: TRectF; const AColor: TAlphaColor = 0); virtual;
    procedure BitmapChanged;
    function IsEmpty: Boolean;
    { Force update real device's handle }
    procedure UpdateHandles;
    { FreeNotify }
    procedure AddFreeNotify(const AObject: IFreeNotification);
    procedure RemoveFreeNotify(const AObject: IFreeNotification);
    { Manipulation }
    procedure Rotate(const Angle: Single);
    procedure FlipHorizontal;
    procedure FlipVertical;
    procedure InvertAlpha;
    procedure FillColor(const Color: TAlphaColor);
    { Mask }
    function CreateMask: PByteArray;
    procedure ApplyMask(const Mask: PByteArray; const DstX: Integer = 0; const DstY: Integer = 0);
    { Thumb }
    function CreateThumbnail(const Width, Height: Integer): TBitmap;
    { I/O }
    procedure LoadFromFile(const AFileName: WideString; const Rotate: Single = 0);
    procedure LoadThumbnailFromFile(const AFileName: WideString; const AFitWidth, AFitHeight: Single;
      const UseEmbedded: Boolean = True);
    procedure SaveToFile(const AFileName: WideString; const Params: WideString = '');
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    { Real device's handle manipulation - because one TBitmap can be used in different devices (for ex. Direct3D and GDI+), we need native handle for each device }
    procedure HandleRemove(AItem: Pointer);
    procedure HandleAdd(AItem: Pointer);
    function HandleExists(AItem: Pointer): Boolean;
    property Handles[AItem: Pointer]: Pointer read GetHandle write SetHandle;
    property HandlesNeedUpdate[AItem: Pointer]: Boolean read GetNeedUpdate write SetNeedUpdate;
    { Access proeprties }
    property Canvas: TCanvas read GetCanvas;
    property Pixels[X, Y: Integer]: TAlphaColor read GetPixels write SetPixels;
    property ScanLine[Y: Integer]: PAlphaColorArray read GetScanline;
    property StartLine: PAlphaColorArray read FBits;
    property Width: Integer read FWidth write SetWidth;
    property Height: Integer read FHeight write SetHeight;
    { internal usage only }
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property ResourceBitmap: TBitmap read GetBitmap; // use to resource link
  published
    property StyleLookup: WideString read GetStyleLookup write SetStyleLookup;
  end;

{ TPathData }

  TPathPointKind = (ppMoveTo, ppLineTo, ppCurveTo, ppClose);

  TPathPoint = packed record
    Kind: TPathPointKind;
    Point: TPointF;
  end;

  TPathObject = class;

  TPathData = class(TInterfacedPersistent, IFreeNotification)
  private
    FOnChanged: TNotifyEvent;
    FStyleResource: TPathObject;
    FStyleLookup: WideString;
    FStartPoint: TPointF;
    FPathData: array of TPathPoint;
    FRecalcBounds: Boolean;
    FBounds: TRectF;
    function GetPathString: AnsiString;
    procedure SetPathString(const Value: AnsiString);
    procedure AddArcSvgPart(const Center, Radius: TPointF; StartAngle, SweepAngle: Single);
    procedure AddArcSvg(const P1, Radius: TPointF; Angle: Single; const LargeFlag, SweepFlag: Boolean; const P2: TPointF);
    procedure SetStyleResource(const Value: TPathObject);
    function GetStyleLookup: WideString;
    procedure SetStyleLookup(const Value: WideString);
    function GetPath: TPathData;
    function GetCount: Integer; inline;
    function GetPoint(AIndex: Integer): TPathPoint; inline;
  protected
    { rtl }
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadPath(Stream: TStream);
    procedure WritePath(Stream: TStream);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    { creation }
    function LastPoint: TPointF;
    procedure MoveTo(const P: TPointF);
    procedure MoveToRel(const P: TPointF);
    procedure LineTo(const P: TPointF);
    procedure LineToRel(const P: TPointF);
    procedure HLineTo(const X: Single);
    procedure HLineToRel(const X: Single);
    procedure VLineTo(const Y: Single);
    procedure VLineToRel(const Y: Single);
    procedure CurveTo(const ControlPoint1, ControlPoint2, EndPoint: TPointF);
    procedure CurveToRel(const ControlPoint1, ControlPoint2, EndPoint: TPointF);
    procedure SmoothCurveTo(const ControlPoint2, EndPoint: TPointF);
    procedure SmoothCurveToRel(const ControlPoint2, EndPoint: TPointF);
    procedure ClosePath;
    { shapes }
    procedure AddEllipse(const ARect: TRectF);
    procedure AddRectangle(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const ACornerType: TCornerType = TCornerType.ctRound);
    procedure AddArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single);
    { modification }
    procedure Clear;
    procedure Flatten(const Flatness: Single = 0.25);
    procedure Scale(const scaleX, scaleY: Single);
    procedure Translate(const dX, dY: Single);
    procedure FitToRect(const ARect: TRectF);
    procedure ApplyMatrix(const M: TMatrix);
    { params }
    function GetBounds: TRectF;
    { convert }
    function FlattenToPolygon(var Polygon: TPolygon; const Flatness: Single = 0.25): TPointF;
    function IsEmpty: Boolean;
    { access }
    property Count: Integer read GetCount;
    property Points[AIndex: Integer]: TPathPoint read GetPoint; default;
    { resoruces }
    property ResourcePath: TPathData read GetPath;
  published
    property Data: AnsiString read GetPathString write SetPathString stored False;
    { This property allow to link path with PathObject. }
    property StyleResource: TPathObject read FStyleResource write SetStyleResource stored False;
    { This property allow to link path with PathObject by name. }
    property StyleLookup: WideString read GetStyleLookup write SetStyleLookup;
  end;

{ TCanvasSaveState }

  TStrokeCap = (scFlat, scRound);

  TStrokeJoin = (sjMiter, sjRound, sjBevel);

  TStrokeDash = (sdSolid, sdDash, sdDot, sdDashDot, sdDashDotDot, sdCustom);

  TDashArray = array of Single;

  TCanvasSaveState = class(TPersistent)
  private
    FAssigned: Boolean;
    FMatrix: TMatrix;
    FFill, FStroke: TBrush;
    FStrokeThickness: Single;
    FStrokeCap: TStrokeCap;
    FStrokeJoin: TStrokeJoin;
    FStrokeDash: TStrokeDash;
    FDash: TDashArray;
    FDashOffset: Single;
    FFont: TFont;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property Assigned: Boolean read FAssigned;
  end;

{ TCanvas }

  TFillTextFlag = (ftRightToLeft);

  TFillTextFlags = set of TFillTextFlag;

  TAbstractPrinter = class(TPersistent);

{$IFDEF FPC}
  TCanvasSaveStateList = TFPGObjectList<TCanvasSaveState>;
{$ENDIF}

  PClipRects = ^TClipRects;
  TClipRects = array of TRectF;
  
  TCanvasClass = class of TCanvas;

  TCanvas = class(TInterfacedPersistent, IFreeNotification)
  private
    procedure SetFill(const Value: TBrush); type
{$IFNDEF FPC}
    TCanvasSaveStateList = TObjectList<TCanvasSaveState>;
{$ENDIF}
  protected
    FWidth, FHeight: Integer;
    FMatrix: TMatrix;
    FFill: TBrush;
    FStroke: TBrush;
    FStrokeThickness: Single;
    FStrokeCap: TStrokeCap;
    FStrokeJoin: TStrokeJoin;
    FStrokeDash: TStrokeDash;
    FDash: TDashArray;
    FDashOffset: Single;
    FFont: TFont;
    FBitmap: TBitmap;
    FResized: Boolean;
    FCanvasSaveData: TCanvasSaveStateList;
    FBuffered: Boolean;
    FBufferBits: Pointer;
    FBufferHandle: THandle;
    FParent: TFmxHandle;
    FBitmaps: TList;
    FBeginSceneCount: integer;
    FPrinter: TAbstractPrinter;
    procedure FontChanged(Sender: TObject); virtual;
    procedure SetStrokeDash(const Value: TStrokeDash);
    procedure AssignTo(Dest: TPersistent); override;
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
    { Bitmap  }
    procedure UpdateBitmapHandle(ABitmap: TBitmap); virtual; abstract;
    procedure DestroyBitmapHandle(ABitmap: TBitmap); virtual; abstract;
    class function GetBitmapScanline(Bitmap: TBitmap; y: Integer) : PAlphaColorArray; virtual;
    { Window }
    procedure FreeBuffer; virtual; abstract;
    function CreateSaveState: TCanvasSaveState; virtual;
    procedure Initialize;
    { scene }
    function DoBeginScene(const AClipRects: PClipRects = nil): Boolean; virtual;
    procedure DoEndScene; virtual;
  public
    { Don't call contructor directly from TCanvas - only using DefaultCanvasClass variable }
    constructor CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer); virtual;
    { Class static method for C++ access }
    class function GetDefaultCanvas(const AParent: TFmxHandle; const AWidth, AHeight: Integer;
                          C: TCanvasClass): TCanvas; overload; static;
    { Create from TBitmap - called directly from TBitmap }
    constructor CreateFromBitmap(const ABitmap: TBitmap); virtual;
    { Class static method for C++ access }
    class function GetDefaultCanvas(const ABitmap: TBitmap;
                          C: TCanvasClass): TCanvas; overload; static;
    { Create from native handle (HDC on Windows, CGContextRef on Mac OS X) - used in TPrinter }
    constructor CreateFromPrinter(const APrinter: TAbstractPrinter); virtual;
    { Class static method for C++ access }
    class function GetDefaultCanvas(const APrinter: TAbstractPrinter;
                          C: TCanvasClass): TCanvas; overload; static;
    destructor Destroy; override;
    { used only on Window canvas }
    procedure FlushBufferRect(const X, Y: Integer; const Context; const ARect: TRectF); virtual; abstract;
    procedure ResizeBuffer(const AWidth, AHeight: Integer); virtual; abstract;
    { scene }
    function BeginScene(AClipRects: PClipRects = nil): Boolean;
    procedure EndScene;
    property BeginSceneCount: integer read FBeginSceneCount;
    { buffer }
    procedure Clear(const Color: TAlphaColor); virtual; abstract;
    procedure ClearRect(const ARect: TRectF; const AColor: TAlphaColor = 0); virtual; abstract;
    { matrix }
    procedure SetMatrix(const M: TMatrix); virtual;
    procedure MultyMatrix(const M: TMatrix); virtual;
    { state }
    function SaveState: TCanvasSaveState;
    procedure RestoreState(State: TCanvasSaveState);
    { clipping }
    procedure IntersectClipRect(const ARect: TRectF); virtual; abstract;
    procedure ExcludeClipRect(const ARect: TRectF); virtual; abstract;
    { drawing }
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); virtual; abstract;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound); virtual; abstract;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const AOpacity: Single; const ACornerType: TCornerType = TCornerType.ctRound); virtual; abstract;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); virtual; abstract;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); virtual; abstract;
    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
    function PtInPath(const APoint: TPointF; const APath: TPathData): Boolean; virtual; abstract;
    procedure FillPath(const APath: TPathData; const AOpacity: Single); virtual; abstract;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); virtual; abstract;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single;
      const HighSpeed: Boolean = False); virtual; abstract;
    procedure DrawThumbnail(const ABitmap: TBitmap; const Width, Height: Single); virtual; abstract;
    { routines }
    procedure DrawRectSides(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
      const AOpacity: Single; const ASides: TSides; const ACornerType: TCornerType = TCornerType.ctRound);
    { linear polygon }
    procedure FillPolygon(const Points: TPolygon; const AOpacity: Single); virtual;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single); virtual;
    { text }
    function LoadFontFromStream(AStream: TStream): Boolean; virtual;
    procedure FillText(const ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const AOpacity: Single;
      const Flags: TFillTextFlags; const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter);
      virtual; abstract;
    procedure MeasureText(var ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter); virtual; abstract;
    procedure MeasureLines(ALines: TLineMetricInfo; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter); virtual;
    function TextToPath(Path: TPathData; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean;
      const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter): Boolean; virtual; abstract;
    function TextWidth(const AText: WideString): Single;
    function TextHeight(const AText: WideString): Single;
    { dash and cap }
    procedure SetCustomDash(const Dash: array of Single; Offset: Single);
    { properties }
    property Stroke: TBrush read FStroke;
    property StrokeThickness: Single read FStrokeThickness write FStrokeThickness;
    property StrokeCap: TStrokeCap read FStrokeCap write FStrokeCap;
    property StrokeDash: TStrokeDash read FStrokeDash write SetStrokeDash;
    property StrokeJoin: TStrokeJoin read FStrokeJoin write FStrokeJoin;
    property Fill: TBrush read FFill write SetFill;
    property Font: TFont read FFont;
    { usage in PaintTo }
    property Matrix: TMatrix read FMatrix;
    { read only }
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    // Buffer if exists
    property Buffered: Boolean read FBuffered;
    property BufferBits: Pointer read FBufferBits;
    property BufferHandle: THandle read FBufferHandle; // HDC
  end;

  TPrinterCanvas = class(TCanvas)
  end;

  TPrinterCanvasClass = class of TPrinterCanvas;

  TMouseEvent = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single) of object;
  TMouseMoveEvent = procedure(Sender: TObject; Shift: TShiftState; X, Y: Single) of object;
  TMouseWheelEvent = procedure(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean) of object;
  TKeyEvent = procedure(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState) of object;
  TProcessTickEvent = procedure(Sender: TObject; time, deltaTime: Single) of object;

  TAnimationType = (atIn, atOut, atInOut);

  TInterpolationType = (itLinear, itQuadratic, itCubic, itQuartic,
    itQuintic, itSinusoidal, itExponential, itCircular,
    itElastic, itBack, itBounce);

  TFmxObjectSortCompare = function(item1, item2: TFmxObject): Integer;

{ TFmxObject }

  TFmxObject = class(TComponent, IFreeNotification)
  private
    FStored: Boolean;
    FStyleName: WideString;
    FNotifyList: TList;
    FTagObject: TObject;
    FTagFloat: Single;
    FTagString: WideString;
    FBindingName: WideString;
    FIndex: Integer;
{$IFDEF FPC}
    FObservers: TObservers;
{$ENDIF}
    procedure ReaderSetName(Reader: TReader; Component: TComponent; var Name: String);
    procedure ReaderError(Reader: TReader; const Message: String; var Handled: Boolean);
    procedure SetStyleName(const Value: WideString);
    procedure SetStored(const Value: Boolean);
    function GetChild(Index: Integer): TFmxObject; 
    function GetChildrenCount: Integer;
    procedure SetBindingName(const Value: WideString);
    function GetIndex: Integer;
    procedure FixupTabList;
    procedure SetIndex(Idx: Integer);
  protected
    FRoot: IRoot;
    FChildren: TList;
    FParent: TFmxObject;
    FTabList: TList;
    function GetBackIndex: Integer; virtual;
    procedure DoReleaseTimer(Sender: TObject);
    { RTL }
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetParentComponent(Value: TComponent); override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    { parent }
    procedure ChangeParent; virtual;
    procedure SetParent(const Value: TFmxObject); virtual;
    function HasClipParent: TControl;
    procedure ChangeOrder; virtual;
    { binding }
    function GetBinding(const Index: WideString): Variant; virtual;
    procedure SetBinding(const Index: WideString; const Value: Variant); virtual;
    function GetData: Variant; virtual;
    procedure SetData(const Value: Variant); virtual;
    { internal streaming }
    procedure IntLoadFromBinStream(const AStream: TStream);
    procedure IntSaveToBinStream(const AStream: TStream);
    { ani }
    procedure DoAniFinished(Sender: TObject);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject); virtual;
{$IFDEF FPC}
    function CanObserve(const ID: Integer): Boolean; virtual;
    procedure OnObserverAdded(const ID: Integer; const Observer: IObserver); virtual;
    function GetObservers: TObservers; virtual;
    function OnCanObserve(const ID: Integer): Boolean; virtual;
    procedure ObserverAdded(const ID: Integer; const Observer: IObserver); virtual;
    property Observers: TObservers read GetObservers;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Release(Delay: Single = 0.1);
    { check for support interface }
    function IsIControl: Boolean;
    function AsIControl: IControl;
    procedure SetRoot(ARoot: IRoot);
    { design }
    procedure SetDesign(Value: Boolean; SetChildren: Boolean = True);
    function ItemClass: WideString; virtual;
    { clone }
    function Clone(const AOwner: TComponent): TFmxObject;
    procedure CloneChildFromStream(AStream: TStream);
    { childs }
    procedure AddObject(AObject: TFmxObject); virtual;
    procedure InsertObject(Index: Integer; AObject: TFmxObject); virtual;
    procedure RemoveObject(AObject: TFmxObject); overload; virtual;
    procedure RemoveObject(Index: Integer); overload; virtual;
    procedure Exchange(AObject1, AObject2: TFmxObject); virtual;
    procedure DeleteChildren; virtual;
    function IsChildren(AObject: TFmxObject): Boolean; virtual;
    procedure BringToFront;
    procedure SendToBack;
    procedure AddObjectsToList(const AList: TList);
    procedure AddControlsToList(const AList: TList);
    procedure Sort(Compare: TFmxObjectSortCompare); virtual;
    { notify }
    procedure AddFreeNotify(const AObject: IFreeNotification);
    procedure RemoveFreeNotify(const AObject: IFreeNotification);
    { tab }
    procedure GetTabOrderList(const List: TList; AChildren: Boolean);
    { i/o }
    procedure LoadFromStream(const AStream: TStream);
    procedure SaveToStream(const Stream: TStream);
    procedure LoadFromBinStream(const AStream: TStream);
    procedure SaveToBinStream(const AStream: TStream);
    { resource }
    function FindStyleResource(const AStyleLookup: WideString): TFmxObject; virtual;
    procedure UpdateStyle; virtual;
    { animations }
    procedure StartAnimation(const AName: WideString); virtual;
    procedure StopAnimation(const AName: WideString); virtual;
    procedure StartTriggerAnimation(AInstance: TFmxObject; const ATrigger: WideString); virtual;
    procedure StartTriggerAnimationWait(AInstance: TFmxObject; const ATrigger: WideString); virtual;
    procedure StopTriggerAnimation(AInstance: TFmxObject); virtual;
    procedure ApplyTriggerEffect(AInstance: TFmxObject; const ATrigger: WideString); virtual;
    { animation property }
    procedure AnimateFloat(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
      AType: TAnimationType = TAnimationType.atIn;
      AInterpolation: TInterpolationType = TInterpolationType.itLinear);
    procedure AnimateColor(const APropertyName: WideString; NewValue: TAlphaColor; Duration: Single = 0.2;
      AType: TAnimationType = TAnimationType.atIn;
      AInterpolation: TInterpolationType = TInterpolationType.itLinear);
    procedure AnimateFloatDelay(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
      Delay: Single = 0.0; AType: TAnimationType = TAnimationType.atIn;
      AInterpolation: TInterpolationType = TInterpolationType.itLinear);
    procedure AnimateFloatWait(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
      AType: TAnimationType = TAnimationType.atIn;
      AInterpolation: TInterpolationType = TInterpolationType.itLinear);
    procedure StopPropertyAnimation(const APropertyName: WideString);
    { }
    property Root: IRoot read FRoot;
    property Stored: Boolean read FStored write SetStored;
    { }
    property TagObject: TObject read FTagObject write FTagObject;
    property TagFloat: Single read FTagFloat write FTagFloat;
    property TagString: WideString read FTagString write FTagString;
    { children }
    property ChildrenCount: Integer read GetChildrenCount;
    property Children[Index: Integer]: TFmxObject read GetChild;
    { binding }
    function FindBinding(const ABinding: WideString): TFmxObject;
    property Data: Variant read GetData write SetData;
    property Binding[const Index: WideString]: Variant read GetBinding write SetBinding;
    property Parent: TFmxObject read FParent write SetParent;
    property Index: Integer read GetIndex write SetIndex;
  published
    property BindingName: WideString read FBindingName write SetBindingName;
    property StyleName: WideString read FStyleName write SetStyleName;
  end;

{ TAnimation }

  TTrigger = type string;

  TAnimation = class(TFmxObject)
  private
    FDuration: Single;
    FDelay, FDelayTime: Single;
    FTime: Single;
    FInverse: Boolean;
    FTrigger, FTriggerInverse: TTrigger;
    FLoop: Boolean;
    FPause: Boolean;
    FRunning: Boolean;
    FOnFinish: TNotifyEvent;
    FOnProcess: TNotifyEvent;
    FInterpolation: TInterpolationType;
    FAnimationType: TAnimationType;
    FEnabled: Boolean;
    FAutoReverse: Boolean;
    procedure SetEnabled(const Value: Boolean);
  protected
    function NormalizedTime: Single;
    procedure ProcessAnimation; virtual;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Stop; virtual;
    procedure StopAtCurrent; virtual;
    procedure StartTrigger(AInstance: TFmxObject; const ATrigger: WideString); virtual;
    procedure ProcessTick(time, deltaTime: Single);
    property Running: Boolean read FRunning;
    property Pause: Boolean read FPause write FPause;
  published
    property AnimationType: TAnimationType read FAnimationType write FAnimationType default TAnimationType.atIn;
    property AutoReverse: Boolean read FAutoReverse write FAutoReverse default False;
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Delay: Single read FDelay write FDelay;
    property Duration: Single read FDuration write FDuration;
    property Interpolation: TInterpolationType read FInterpolation write FInterpolation default TInterpolationType.itLinear;
    property Inverse: Boolean read FInverse write FInverse default False;
    property Loop: Boolean read FLoop write FLoop default False;
    property Trigger: TTrigger read FTrigger write FTrigger;
    property TriggerInverse: TTrigger read FTriggerInverse write FTriggerInverse;
    property OnProcess: TNotifyEvent read FOnProcess write FOnProcess;
    property OnFinish: TNotifyEvent read FOnFinish write FOnFinish;
  end;

{ TEffect }

  TEffect = class(TFmxObject)
  private
    FEnabled: Boolean;
    FTrigger: TTrigger;
    procedure SetEnabled(const Value: Boolean);
  protected
    DisablePaint: Boolean;
    AfterPaint: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRect(const ARect: TRectF): TRectF; virtual;
    function GetOffset: TPointF; virtual;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); virtual;
    procedure ApplyTrigger(AInstance: TFmxObject; const ATrigger: WideString); virtual;
    procedure UpdateParentEffects;
    property GetDisablePaint: Boolean read DisablePaint;
  published
    property Trigger: TTrigger read FTrigger write FTrigger;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
  end;

{ TControl }

  TOnPaintEvent = procedure(Sender: TObject; Canvas: TCanvas; const ARect: TRectF) of object;
  TDragEnterEvent = procedure(Sender: TObject; const Data: TDragObject; const Point: TPointF) of object;
  TDragOverEvent = procedure(Sender: TObject; const Data: TDragObject; const Point: TPointF; var Accept: Boolean) of object;
  TDragDropEvent = procedure(Sender: TObject; const Data: TDragObject; const Point: TPointF) of object;
  TCanFocusEvent = procedure(Sender: TObject; var ACanFocus: Boolean) of object;

  TCustomPopupMenu = class(TFmxObject)
  protected
    FPopupComponent: TComponent;
  public
    procedure Popup(X, Y: Single); virtual; abstract;
    property PopupComponent: TComponent read FPopupComponent write FPopupComponent;
  end;

  TControl = class(TFmxObject, IControl, IContainerObject, IAlignRoot, IAlignableObject)
  private
    FOnMouseUp: TMouseEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseWheel: TMouseWheelEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FMouseInObject: Boolean;
    FHitTest: Boolean;
    FClipChildren: Boolean;
    FAutoCapture: Boolean;
    FMargins: TBounds;
    FAlign: TAlignLayout;
    FDisableDefaultAlign: Boolean;
    FPadding: TBounds;
    FTempCanvas: TCanvas;
    FRotationAngle: Single;
    FPosition: TPosition;
    FScale: TPosition;
    FSkew: TPosition;
    FRotationCenter: TPosition;
    FCanFocus: Boolean;
    FIsMouseOver: Boolean;
    FIsFocused: Boolean;
    FOnCanFocus: TCanFocusEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TNotifyEvent;
    FDisableFocusEffect: Boolean;
    FClipParent: Boolean;
    FVelocity: TPosition;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    FDesignVisible: Boolean;
    FOnPaint: TOnPaintEvent;
    FOnPainting: TOnPaintEvent;
    FCanClip: Boolean;
    FCursor: TCursor;
    FDragMode: TDragMode;
    FEnableDragHighlight: Boolean;
    FOnDragEnter: TDragEnterEvent;
    FOnDragDrop: TDragDropEvent;
    FOnDragLeave: TNotifyEvent;
    FOnDragOver: TDragOverEvent;
    FOnDragEnd: TNotifyEvent;
    FIsDragOver: Boolean;
    FOnKeyDown: TKeyEvent;
    FOnKeyUp: TKeyEvent;
    FHint: WideString;
    FShowHint: Boolean;
    FPopupMenu: TCustomPopupMenu;
    FRecalcEnabled, FEnabled, FAbsoluteEnabled: Boolean;
    FTabOrder: TTabOrder;
    FTabList: TList;
    FNeedAlign: Boolean;
    FOnApplyStyleLookup: TNotifyEvent;
    FAnchors: TAnchors;
    FOnResize: TNotifyEvent;
    FUpdateEffects: Boolean;
    FDisableEffect: Boolean;
    FAcceptsControls: boolean;
    procedure CreateCaret;
    procedure SetEnabled(const Value: Boolean);
    function GetInvertAbsoluteMatrix: TMatrix;
    procedure SetRotationAngle(const Value: Single);
    procedure SetPosition(const Value: TPosition);
    procedure SetHitTest(const Value: Boolean);
    procedure SetClipChildren(const Value: Boolean);
    function CheckHitTest(const AHitTest: Boolean): Boolean;
    function GetCanvas: TCanvas;
    procedure SetLocked(const Value: Boolean);
    procedure SetTempCanvas(const Value: TCanvas);
    procedure SetOpacity(const Value: Single);
    procedure SetDesignVisible(const Value: Boolean);
    procedure SetTabOrder(const Value: TTabOrder);
    procedure UpdateDesignVisible(const Value: Boolean);
    function IsOpacityStored: Boolean;
    procedure SetCursor(const Value: TCursor);
    function GetAbsoluteWidth: Single;
    function GetAbsoluteHeight: Single;
    function GetTabOrder: TTabOrder;
    function IsAnchorsStored: Boolean;
    function GetCursor: TCursor;
    function GetAbsoluteHasEffect: Boolean;
    function GetAbsoluteHasDisablePaintEffect: Boolean;
    function GetAbsoluteHasAfterPaintEffect: Boolean;
  protected
    FScene: IScene;
    FHeight, FLastHeight: Single;
    FWidth, FLastWidth: Single;
    FVisible: Boolean;
    FLocalMatrix: TMatrix;
    FAbsoluteMatrix: TMatrix;
    FInvAbsoluteMatrix: TMatrix;
    FEffectBitmap: TBitmap;
    FLocked: Boolean;
    FOpacity, FAbsoluteOpacity: Single;
    FInPaintTo: Boolean;
    FInPaintToAbsMatrix, FInPaintToInvMatrix: TMatrix;
    FUpdateRect: TRectF;
    FCaret: TControl;
    FPressed, FDoubleClick: Boolean;
    FAbsoluteHasEffect: Boolean;
    FAbsoluteHasDisablePaintEffect: Boolean;
    FAbsoluteHasAfterPaintEffect: Boolean;
    FUpdating: Integer;
    FDisablePaint: Boolean;
    FDisableAlign: Boolean;
    FRecalcOpacity: Boolean;
    FRecalcUpdateRect: Boolean;
    FRecalcAbsolute: Boolean;
    FRecalcHasEffect: Boolean;
    FDesignInteractive: Boolean;
    {added for aligment using a relation between align and anchors}
    FAnchorMove: Boolean;
    FAnchorRules: TPointF;
    FAnchorOrigin: TPointF;
    FOriginalParentSize: TPointF;
    FLeft: Single;
    FTop: Single;
    FExplicitLeft: Single;
    FExplicitTop: Single;
    FExplicitWidth: Single;
    FExplicitHeight: Single;
    procedure SetInPaintTo(Value: Boolean);
    { }
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ChangeOrder; override;
    procedure SetVisible(const Value: Boolean); virtual;
    { matrix }
    procedure SetHeight(const Value: Single); virtual;
    procedure SetWidth(const Value: Single); virtual;
    function GetAbsoluteRect: TRectF; virtual;
    function GetAbsoluteMatrix: TMatrix; virtual;
    function GetChildrenMatrix: TMatrix; virtual;
    function GetAbsoluteScale: TPointF; virtual;
    function GetLocalRect: TRectF; virtual;
    function GetUpdateRect: TRectF; virtual;
    function GetBoundsRect: TRectF; virtual;
    function GetParentedRect: TRectF; virtual;
    function GetClipRect: TRectF; virtual;
    function GetEffectsRect: TRectF; virtual;
    function GetAbsoluteEnabled: Boolean; virtual;
    function GetChildrenRect: TRectF;
    procedure SetBoundsRect(const Value: TRectF); virtual;
    procedure RecalcAbsoluteNow;
    procedure SetPopupMenu(Value: TCustomPopupMenu);
    { opacity }
    function GetAbsoluteOpacity: Single; virtual;
    { events }
    procedure BeginAutoDrag; virtual;
    procedure Capture;
    procedure ReleaseCapture;
    procedure Click; virtual;
    procedure DblClick; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); virtual;
    procedure KeyDown(var Key: Word; var KeyChar: WideChar; Shift: TShiftState); virtual;
    procedure KeyUp(var Key: Word; var KeyChar: WideChar; Shift: TShiftState); virtual;
    procedure DialogKey(var Key: Word; Shift: TShiftState); virtual;
    procedure ContextMenu(const ScreenPosition: TPointF); virtual;
    procedure DragEnter(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); virtual;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragLeave; virtual;
    procedure DragEnd; virtual;
    function EnterChildren(AObject: TControl): Boolean; virtual;
    function GetParentedVisible: Boolean; virtual;
    { IAlignableObject }
    function GetAlign: TAlignLayout;
    procedure SetAlign(const Value: TAlignLayout); virtual;
    function GetAnchors: TAnchors;
    procedure SetAnchors(const Value: TAnchors); virtual;
    function GetPadding: TBounds;
    function GetWidth: single;
    function GetHeight: single;
    function GetLeft: single;
    function GetTop: single;
    function GetAllowAlign: Boolean;
    { IContainerObject }
    function GetContainerWidth: Single;
    function GetContainerHeight: Single;
    { IControl }
    function GetObject: TFmxObject;
    function GetVisible: Boolean;
    function GetDesignInteractive: Boolean;
    procedure DoEnter; virtual;
    procedure DoExit; virtual;
    procedure DoMouseEnter; virtual;
    procedure DoMouseLeave; virtual;
    function GetTabOrderValue: TTabOrder;
    procedure UpdateTabOrder(Value: TTabOrder);
    function CheckForAllowFocus: Boolean;
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
    function GetDragMode: TDragMode;
    procedure SetDragMode(const ADragMode: TDragMode);
    function GetParent: TFmxObject;
    function GetLocked: Boolean;
    function GetHitTest: Boolean;
    function GetAcceptsControls: Boolean;
    procedure SetAcceptsControls(const Value: boolean);

    function FindTarget(P: TPointF; const Data: TDragObject): IControl; virtual;
    function ObjectAtPoint(P: TPointF): IControl; virtual;
    { bi-di }
    function FillTextFlags: TFillTextFlags; virtual;
    { control resources }
    procedure ApplyStyleLookup; virtual;
    { paint }
    procedure Paint; virtual;
    procedure PaintChildren; virtual;
    { changes }
    procedure MarginsChanged(Sender: TObject); virtual;
    procedure PaddingChanged(Sender: TObject); virtual;
    procedure MatrixChanged(Sender: TObject); virtual;
    procedure Resize; virtual;
    { props }
    property TempCanvas: TCanvas read FTempCanvas write SetTempCanvas;
    property Skew: TPosition read FSkew write FSkew;
    {added for aligment using a relation between align and anchors}
    procedure SetLeft(const Value: Single);
    procedure SetTop(const Value: Single);
    procedure UpdateExplicitBounds;
    procedure UpdateAnchorRules;
    procedure UpdateControlOriginalParentSize(AControl: TFmxObject; var AOriginalParentSize: TPointF);
    procedure SetParent(const Value: TFmxObject); override;
    property Left: Single read FLeft write SetLeft;
    property Top: Single read FTop write SetTop;
    property ExplicitLeft: Single read FExplicitLeft;
    property ExplicitTop: Single read FExplicitTop;
    property ExplicitWidth: Single read FExplicitWidth;
    property ExplicitHeight: Single read FExplicitHeight;
    property Anchors: TAnchors read FAnchors write SetAnchors stored IsAnchorsStored default [TAnchorKind.akLeft, TAnchorKind.akTop];
    property Hint: WideString read FHint write FHint;
    property ShowHint: Boolean read FShowHint write FShowHint default False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    procedure SetNewScene(AScene: IScene); virtual;
    procedure SetBounds(X, Y, AWidth, AHeight: Single); virtual;
    { matrix }
    function AbsoluteToLocal(P: TPointF): TPointF; virtual;
    function LocalToAbsolute(P: TPointF): TPointF; virtual;
    function AbsoluteToLocalVector(P: TVector): TVector; virtual;
    function LocalToAbsoluteVector(P: TVector): TVector; virtual;
    function PointInObject(X, Y: Single): Boolean; virtual;
    { optimizations }
    procedure RecalcUpdateRect; virtual;
    procedure RecalcNeedAlign; virtual;
    procedure RecalcOpacity; virtual;
    procedure RecalcAbsolute; virtual;
    procedure RecalcEnabled; virtual;
    procedure RecalcHasEffect; virtual;
    { drag and drop }
    function MakeScreenshot: TBitmap;
    { caret }
    procedure ShowCaretProc;
    procedure SetCaretPos(const APoint: TPointF);
    procedure SetCaretSize(const ASize: TPointF);
    procedure SetCaretColor(const AColor: TAlphaColor);
    procedure HideCaret;
    { align }
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    procedure Realign; virtual;
    { paining }
    procedure ApplyEffect;
    procedure Painting; virtual;
    procedure DoPaint; virtual;
    procedure AfterPaint; virtual;
    { effects }
    procedure UpdateEffects;
    { }
    procedure SetFocus;
    procedure PaintTo(const ACanvas: TCanvas; const ARect: TRectF; const AParent: TFmxObject = nil);
    procedure Repaint;
    procedure InvalidateRect(ARect: TRectF);
    procedure Lock;
    property AbsoluteMatrix: TMatrix read GetAbsoluteMatrix;
    property AbsoluteOpacity: Single read GetAbsoluteOpacity;
    property AbsoluteWidth: Single read GetAbsoluteWidth;
    property AbsoluteHeight: Single read GetAbsoluteHeight;
    property AbsoluteScale: TPointF read GetAbsoluteScale;
    property AbsoluteEnabled: Boolean read GetAbsoluteEnabled;
    property HasEffect: Boolean read GetAbsoluteHasEffect;
    property HasDisablePaintEffect: Boolean read GetAbsoluteHasDisablePaintEffect;
    property HasAfterPaintEffect: Boolean read GetAbsoluteHasAfterPaintEffect;
    property ChildrenRect: TRectF read GetChildrenRect;
    property InvertAbsoluteMatrix: TMatrix read GetInvertAbsoluteMatrix;
    property InPaintTo: Boolean read FInPaintTo;
    property LocalRect: TRectF read GetLocalRect;
    property AbsoluteRect: TRectF read GetAbsoluteRect;
    property UpdateRect: TRectF read GetUpdateRect;
    property BoundsRect: TRectF read GetBoundsRect write SetBoundsRect;
    property ParentedRect: TRectF read GetParentedRect;
    property ParentedVisible: Boolean read GetParentedVisible;
    property ClipRect: TRectF read GetClipRect;
    property Canvas: TCanvas read GetCanvas;
    property Scene: IScene read FScene;
    property AutoCapture: Boolean read FAutoCapture write FAutoCapture default False;
    property CanFocus: Boolean read FCanFocus write FCanFocus default False;
    property DisableFocusEffect: Boolean read FDisableFocusEffect write FDisableFocusEffect default False;
    property DisableDefaultAlign: Boolean read FDisableDefaultAlign write FDisableDefaultAlign;
    property TabOrder: TTabOrder read GetTabOrder write SetTabOrder default -1;
  published
    { triggers }
    property IsMouseOver: Boolean read FIsMouseOver;
    property IsDragOver: Boolean read FIsDragOver;
    property IsFocused: Boolean read FIsFocused;
    property IsVisible: Boolean read FVisible;
    { props }
    property Align: TAlignLayout read FAlign write SetAlign default TAlignLayout.alNone;
//    property Anchors: TAnchors read FAnchors write SetAnchors stored IsAnchorsStored default [TAnchorKind.akLeft, TAnchorKind.akTop];
    property Cursor: TCursor read GetCursor write SetCursor default crDefault;
    property DragMode: TDragMode read GetDragMode write SetDragMode default TDragMode.dmManual;
    property EnableDragHighlight: Boolean read FEnableDragHighlight write FEnableDragHighlight default True;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Position: TPosition read FPosition write SetPosition;
    property RotationAngle: Single read FRotationAngle write SetRotationAngle;
    property RotationCenter: TPosition read FRotationCenter write FRotationCenter;
    property Locked: Boolean read FLocked write SetLocked default False;
    property Width: Single read GetWidth write SetWidth;
    property Height: Single read GetHeight write SetHeight;
    property Margins: TBounds read FMargins write FMargins;
    property Padding: TBounds read FPadding write FPadding;
    property Opacity: Single read FOpacity write SetOpacity stored IsOpacityStored;
    property ClipChildren: Boolean read FClipChildren write SetClipChildren default False;
    property ClipParent: Boolean read FClipParent write FClipParent default False;
    property HitTest: Boolean read FHitTest write SetHitTest default True;

//    property Hint: WideString read FHint write FHint;
//    property ShowHint: Boolean read FShowHint write FShowHint default False;
    property CanClip: Boolean read FCanClip write FCanClip default True;
    property PopupMenu: TCustomPopupMenu read FPopupMenu write SetPopupMenu;
    property Scale: TPosition read FScale write FScale;
    property Visible: Boolean read FVisible write SetVisible default True;
    property DesignVisible: Boolean read FDesignVisible write SetDesignVisible default True;
    property OnDragEnter: TDragEnterEvent read FOnDragEnter write FOnDragEnter;
    property OnDragLeave: TNotifyEvent read FOnDragLeave write FOnDragLeave;
    property OnDragOver: TDragOverEvent read FOnDragOver write FOnDragOver;
    property OnDragDrop: TDragDropEvent read FOnDragDrop write FOnDragDrop;
    property OnDragEnd: TNotifyEvent read FOnDragEnd write FOnDragEnd;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnCanFocus: TCanFocusEvent read FOnCanFocus write FOnCanFocus;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnPainting: TOnPaintEvent read FOnPainting write FOnPainting;
    property OnPaint: TOnPaintEvent read FOnPaint write FOnPaint;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnApplyStyleLookup: TNotifyEvent read FOnApplyStyleLookup write FOnApplyStyleLookup;
  end;

{ TBrushObject }

  TBrushObject = class(TFmxObject)
  private
    FBrush: TBrush;
  protected
    procedure SetName(const NewName: TComponentName); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Brush: TBrush read FBrush write FBrush;
  end;

{ TPathObject }

  TPathObject = class(TFmxObject)
  private
    FPath: TPathData;
  protected
    procedure SetName(const NewName: TComponentName); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Path: TPathData read FPath write FPath;
  end;

{ TBitmapObject }

  TBitmapObject = class(TFmxObject)
  private
    FBitmap: TBitmap;
  protected
    procedure SetName(const NewName: TComponentName); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Bitmap: TBitmap read FBitmap write FBitmap;
  end;

  TOrientation = (orHorizontal, orVertical);

{ TControlActionLink }

  TControlActionLink = class;

  TControlActionLink = class(TBasicAction)
  protected
    FClient: TStyledControl;
    { procedure AssignClient(AClient: TObject); override;
      function IsCaptionLinked: Boolean; override;
      function IsEnabledLinked: Boolean; override;
      function IsHelpLinked: Boolean;  override;
      function IsHintLinked: Boolean; override;
      function IsVisibleLinked: Boolean; override;
      function IsOnExecuteLinked: Boolean; override;
      function DoShowHint(var HintStr: WideString): Boolean; virtual;
      procedure SetCaption(const Value: WideString); override;
      procedure SetEnabled(Value: Boolean); override;
      procedure SetHelpContext(Value: THelpContext); override;
      procedure SetHelpKeyword(const Value: WideString); override;
      procedure SetHelpType(Value: THelpType); override;
      procedure SetHint(const Value: WideString); override;
      procedure SetVisible(Value: Boolean); override;
      procedure SetOnExecute(Value: TNotifyEvent); override; }
  end;

  TControlActionLinkClass = class of TControlActionLink;

{ TStyledControl }

  TStyledControl = class(TControl)
  private
    procedure SetStyleLookup(const Value: WideString);
    procedure SetBindingSource(const Value: TStyledControl);
  protected
    FStyleLookup: WideString;
    FResourceLink: TFmxObject;
    FNeedStyleLookup: Boolean;
    FBindingObjects: TList;
    FBindingSource: TStyledControl;
    FAutoTranslate: Boolean;
    FActionLink: TControlActionLink;
    FHelpType: THelpType;
    FHelpKeyword: WideString;
    FHelpContext: THelpContext;
    function GetBackIndex: Integer; override;
    function IsHelpContextStored: Boolean;
    procedure SetHelpContext(const Value: THelpContext);
    procedure SetHelpKeyword(const Value: WideString);
    function GetAction: TBasicAction; virtual;
    procedure SetAction(Value: TBasicAction);
    procedure DoActionChange(Sender: TObject);
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); virtual;
    procedure InitiateAction; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    { control }
    procedure ApplyStyle; virtual;
    procedure FreeStyle; virtual;
    function GetDefaultStyleLookupName: WideString; virtual;
    procedure DoEnter; override;
    { }
    procedure Painting; override;
    function GetStyleObject: TControl; virtual;
    { binding }
    procedure SetData(const Value: Variant); override;
    procedure ToBindingObjects;
    procedure AddBindingObject(AObject: TStyledControl);
    procedure RemoveBindingObject(AObject: TStyledControl);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindStyleResource(const AStyleLookup: WideString): TFmxObject; override;
    procedure ApplyStyleLookup; override;
    procedure UpdateStyle; override;
    property BindingSource: TStyledControl read FBindingSource write SetBindingSource;
    property AutoTranslate: Boolean read FAutoTranslate write FAutoTranslate;
    property Action: TBasicAction read GetAction write SetAction;
    property DefaultStyleLookupName: WideString read GetDefaultStyleLookupName;
  published
    property HelpType: THelpType read FHelpType write FHelpType default htContext;
    property HelpKeyword: WideString read FHelpKeyword write SetHelpKeyword stored IsHelpContextStored;
    property HelpContext: THelpContext read FHelpContext write SetHelpContext stored IsHelpContextStored default 0;
    property StyleLookup: WideString read FStyleLookup write SetStyleLookup;
    property TabOrder default -1;
  end;

{ TTextControl }

  TTextControl = class(TStyledControl)
  private
    FFont: TFont;
    FTextAlign: TTextAlign;
    FVertTextAlign: TTextAlign;
    FFontFill: TBrush;
    FWordWrap: Boolean;
    function GetText: WideString;
    procedure SetFont(const Value: TFont);
    procedure SetTextAlign(const Value: TTextAlign);
    procedure SetVertTextAlign(const Value: TTextAlign);
    procedure SetFontFill(const Value: TBrush);
    procedure FontFillChanged(Sender: TObject);
    procedure SetWordWrap(const Value: Boolean);
  protected
    FText: WideString;
    FTextObject: TFmxObject;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure SetText(const Value: WideString); virtual;
    procedure FontChanged(Sender: TObject); virtual;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure SetName(const Value: TComponentName); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Font: TFont read FFont write SetFont;
    property FontFill: TBrush read FFontFill write SetFontFill;
    property Text: WideString read GetText write SetText;
    property VertTextAlign: TTextAlign read FVertTextAlign write SetVertTextAlign default TTextAlign.taCenter;
    property TextAlign: TTextAlign read FTextAlign write SetTextAlign default TTextAlign.taLeading;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  end;

{ TContent }

  TContent = class(TControl)
  private
  protected
    FParentAligning: Boolean;
    function GetParentComponent: TComponent; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
  published
  end;

  ISizeGrip = interface
    ['{F8850930-E967-413F-B7C6-68C3C1A7A648}']
  end;

{ TStyleBook }

  TStyleBook = class(TFmxObject)
  private
    FResource: TWideStrings;
    FRoot: TFmxObject;
    FSceneList: TList;
    FFileName: WideString;
    FDesignResource: WideString;
    procedure SetResource(const Value: TWideStrings);
    procedure SetFileName(const Value: WideString);
    procedure DoResourceChanged(Sender: TObject);
    procedure LoadFromFile;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    { vcl }
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadResources(Stream: TStream);
    procedure WriteResources(Stream: TStream);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddSceneUpdater(const Scene: IScene);
    procedure RemoveSceneUpdater(const Scene: IScene);
    procedure FillStrings;
    procedure UpdateScenes;
    property Root: TFmxObject read FRoot write FRoot;
    { design-time }
    property DesignResource: WideString read FDesignResource write FDesignResource;
  published
    property Resource: TWideStrings read FResource write SetResource;
    property FileName: WideString read FFileName write SetFileName;
  end;

{ TLang }

  TLang = class(TFmxObject)
  private
    FLang: WideString;
    FResources: TWideStrings;
    FOriginal: TWideStrings;
    FAutoSelect: Boolean;
    FFileName: WideString;
    FStoreInForm: Boolean;
    procedure SetLang(const Value: WideString);
    function GetLangStr(const Index: WideString): TWideStrings;
  protected
    { vcl }
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadResources(Stream: TStream);
    procedure WriteResources(Stream: TStream);
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddLang(const AName: WideString);
    procedure LoadFromFile(const AFileName: WideString);
    procedure SaveToFile(const AFileName: WideString);
    property Original: TWideStrings read FOriginal;
    property Resources: TWideStrings read FResources;
    property LangStr[const Index: WideString]: TWideStrings read GetLangStr;
  published
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
    property FileName: WideString read FFileName write FFileName;
    property StoreInForm: Boolean read FStoreInForm write FStoreInForm default True;
    property Lang: WideString read FLang write SetLang;
  end;

{ TTimer }

  TTimerProc = procedure of object;

  TTimer = class(TFmxObject)
  private
    FInterval: Cardinal;
    FTimerHandle: TFmxHandle;
    FOnTimer: TNotifyEvent;
    FEnabled: Boolean;
    procedure Timer;
  protected
    procedure SetEnabled(Value: Boolean); virtual;
    procedure SetInterval(Value: Cardinal); virtual;
    procedure SetOnTimer(Value: TNotifyEvent); virtual;
    procedure DoOnTimer; virtual;
    procedure UpdateTimer; virtual;
    procedure KillTimer; virtual;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

{ TPopup }

  TPlacement = (plBottom, plTop, plLeft, plRight,
    plCenter, plBottomCenter, plTopCenter, plLeftCenter,
    plRightCenter, plAbsolute, plMouse, plMouseCenter);

  TPopup = class(TStyledControl)
  private
    FSaveParent: TFmxObject;
    FSaveFocused: IControl;
    FSaveScale: TPointF;
    FPopupForm: TFmxObject;
    FIsOpen: Boolean;
    FStaysOpen: Boolean;
    FPlacement: TPlacement;
    FPlacementTarget: TControl;
    FPlacementRectangle: TBounds;
    FHorizontalOffset: Single;
    FVerticalOffset: Single;
    FDragWithParent: Boolean;
    FAnimating: Boolean;
    FStyleBook: TStyleBook;
    FModalResult: TModalResult;
    FModal: Boolean;
    FDragTimer: TTimer;
    FOnClosePopup: TNotifyEvent;
    procedure SetIsOpen(const Value: Boolean);
    procedure SetPlacementRectangle(const Value: TBounds);
    procedure SetModalResult(const Value: TModalResult);
    procedure DoTimer(Sender: TObject);
  protected
    procedure ApplyPlacement; virtual;
    procedure Paint; override;
    procedure DoExit; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
    procedure DoFormClose(Sender: TObject; var Action: TCloseAction);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PopupModal: TModalResult; virtual;
    procedure Popup; virtual;
    procedure ClosePopup; virtual;
    property ModalResult: TModalResult read FModalResult write SetModalResult;
  published
    property IsOpen: Boolean read FIsOpen write SetIsOpen;
    property HorizontalOffset: Single read FHorizontalOffset write FHorizontalOffset;
    property VerticalOffset: Single read FVerticalOffset write FVerticalOffset;
    property Placement: TPlacement read FPlacement write FPlacement default TPlacement.plBottom;
    property PlacementTarget: TControl read FPlacementTarget write FPlacementTarget;
    property PlacementRectangle: TBounds read FPlacementRectangle write SetPlacementRectangle;
    property StaysOpen: Boolean read FStaysOpen write FStaysOpen default False;
    property StyleBook: TStyleBook read FStyleBook write FStyleBook;
    property DragWithParent: Boolean read FDragWithParent write FDragWithParent default False;
    property OnClosePopup: TNotifyEvent read FOnClosePopup write FOnClosePopup;
    property StyleLookup;
    property Visible default False;
  end;

{ TTextService }

  TTextService = class
  protected
    FOwner: TControl;
    FMultiLine: Boolean;
    function GetText: WideString; virtual; abstract;
    procedure SetText(const Value: WideString); virtual; abstract;
    function GetCaretPostion: TPoint; virtual; abstract;
    procedure SetCaretPostion(const Value: TPoint); virtual; abstract;
  public
    constructor Create(const Owner: TControl; SupportMultiLine: Boolean); virtual;
    destructor Destroy; override;
    { Text ssupport }
    procedure InternalSetMarkedText( const AMarkedText: WideString ); virtual; abstract;
    function InternalGetMarkedText: WideString; virtual; abstract;
    function CombinedText: WideString; virtual; abstract;
    function TargetClausePosition: TPoint; virtual; abstract;
    function HasMarkedText: boolean; virtual; abstract;
    { Enter/Exit }
    procedure EnterControl(const FormHandle: TFmxHandle); virtual; abstract;
    procedure ExitControl(const FormHandle: TFmxHandle); virtual; abstract;
    { Drawing Lines }
    procedure DrawSingleLine( Canvas: TCanvas;
      const ARect: TRectF; const FirstVisibleChar: integer; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); virtual; abstract;
    procedure DrawSingleLine2( Canvas: TCanvas; const S: WideString;
      const ARect: TRectF; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); virtual; abstract;
    { IME Mode }
    function GetImeMode: TImeMode; virtual; abstract;
    procedure SetImeMode(const Value: TImeMode); virtual; abstract;
    { Cursor movement }
    function GetNextWordBeginPosition(StartPosition: Integer): Integer; virtual;
    function GetPrevWordBeginPosition(StartPosition: Integer): Integer; virtual;
    function GetNextCharacterPosition(StartPosition: Integer): Integer; virtual;
    function GetPrevCharacterPosition(StartPosition: Integer): Integer; virtual;

    property CaretPosition: TPoint read GetCaretPostion write SetCaretPostion;
    property Text: WideString read GetText write SetText;
    property ImeMode: TImeMode read GetImeMode write SetImeMode default TImeMode.imDontCare;
  end;

  TTextServiceClass = class of TTextService;

{ TLineInfo }
  PLineMetric = ^TLineMetric;
  TLineMetric = record
    Index: integer;
    Len: integer;
  end;

  TLineMetricInfo = class
  protected
    FLineMetrics: array of TLineMetric;
    function GetCount: integer; virtual;
    function GetMetrics(Index: Integer): PLineMetric; virtual;
    procedure SetCount(const Value: Integer); virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    property Count: integer read GetCount write SetCount;
    property Metrics[ind: integer]: PLineMetric read GetMetrics;
  end;

var
  AniFrameRate: Integer = 30;
  AniThread: TTimer;
  SceneList: TList;
  DefaultCanvasClass: TCanvasClass;
  DefaultPrinterCanvasClass: TCanvasClass;
  DefaultBitmapCodecClass: TBitmapCodecClass;
  USFormatSettings: TFormatSettings; // used for correct string to float convertion

function GetMeasureBitmap: TBitmap;

function FindRCData(Instance: THandle; const RCDataName: WideString): Boolean;
function CreateObjectFromStream(AOwner: TComponent; const AStream: TStream): TFmxObject;
procedure MergeObjectFromStream(AObject: TFmxObject; const AStream: TStream);
function CreateObjectFromBinStream(AOwner: TComponent; const AStream: TStream): TFmxObject;
function LoadObjectFromStream(AObject: TFmxObject; const AStream: TStream): TFmxObject;

{ Resources }

procedure AddResource(const AObject: TFmxObject);
procedure RemoveResource(const AObject: TFmxObject);
function FindStyleResource(const AStyleLookup: WideString): TFmxObject;

{ Scenes }

procedure AddScene(const AScene: IScene);
procedure RemoveScene(const AScene: IScene);

{ Lang }

procedure LoadLangFromFile(const AFileName: WideString);
procedure LoadLangFromStrings(AStr: TWideStrings);
procedure ResetLang;
procedure UpdateLang;

{ Align }

procedure AlignObjects(AParent: TFmxObject; AMargins: TBounds; AParentWidth, AParentHeight: single;
  var ALastWidth, ALastHeight: single; var ADisableAlign: Boolean);

type
  TCustomTranslateProc = function(const AText: WideString): WideString;

var
  CustomTranslateProc: TCustomTranslateProc;

{ This function use to collect string which can be translated. Just place this function at Application start. }

procedure CollectLangStart;
procedure CollectLangFinish;
{ This function return Strings with collected text }
function CollectLangStrings: TWideStrings;

function Translate(const AText: WideString): WideString;
function TranslateText(const AText: WideString): WideString;

{ Strings }

function PointToString(R: TPointF): AnsiString;
function StringToPoint(S: AnsiString): TPointF;

function RectToString(R: TRectF): AnsiString;
function StringToRect(S: AnsiString): TRectF;

{ Geometry }

function NormalizeAngle(const Angle: Single): Single;
function FitRect(var R: TRectF; BoundsRect: TRectF): Single;
function IsRectEmpty(Rect: TRectF): Boolean;
function PointInRect(const P: TPointF; const Rect: TRectF): Boolean;

function Vector(const X, Y: Single; const W: Single = 1.0): TVector; overload;
function Vector(const P: TPointF; const W: Single = 1.0): TVector; overload;
function VectorTransform(const V: TVector; const M: TMatrix): TVector;
function VectorAdd(const v1: TVector; const v2: TVector): TVector;
function VectorSubtract(const v1: TVector; const v2: TVector): TVector;
function VectorNorm(const V: TVector): Single;
function VectorNormalize(const V: TVector): TVector;
function VectorScale(const V: TVector; factor: Single): TVector;
function VectorLength(const V: TVector): Single;
function VectorDotProduct(const v1, v2: TVector): Single;
function VectorAngleCosine(const v1, v2: TVector): Single;
function VectorCrossProductZ(const v1, v2: TVector): Single;
function VectorReflect(const V, N: TVector): TVector;
function VectorAngle(const V, N: TVector): Single;

function MatrixMultiply(const M1, M2: TMatrix): TMatrix;
function MatrixDeterminant(const M: TMatrix): Single;
procedure AdjointMatrix(var M: TMatrix);
procedure ScaleMatrix(var M: TMatrix; const factor: Single);
procedure InvertMatrix(var M: TMatrix);

function CreateRotationMatrix(const Angle: Single): TMatrix;
function CreateScaleMatrix(const ScaleX, ScaleY: Single): TMatrix;
function CreateTranslateMatrix(const DX, DY: Single): TMatrix;

{ Colors }

function AppendColor(Start, Stop: TAlphaColor): TAlphaColor;
function SubtractColor(Start, Stop: TAlphaColor): TAlphaColor;
function RGBtoBGR(const C: TAlphaColor): TAlphaColor;
function CorrectColor(const C: TAlphaColor): TAlphaColor;
function PremultiplyAlpha(const C: TAlphaColor): TAlphaColor;
function UnpremultiplyAlpha(const C: TAlphaColor): TAlphaColor;
function MakeColor(R, G, B: Byte; A: Byte = $FF): TAlphaColor; overload;
function MakeColor(const C: TAlphaColor; const AOpacity: Single): TAlphaColor; overload;
function HSLtoRGB(H, S, L: Single): TAlphaColor;
procedure RGBtoHSL(RGB: TAlphaColor; out H, S, L: Single);
function ChangeHSL(const C: TAlphaColor; dH, dS, dL: Single): TAlphaColor;

{ Animation }

function InterpolateSingle(const Start, Stop, t: Single): Single;
function InterpolateRotation(Start, Stop, t: Single): Single;
function InterpolateColor(Start, Stop: TAlphaColor; t: Single): TAlphaColor;

function InterpolateLinear(t, B, C, D: Single): Single;
function InterpolateSine(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateQuint(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateQuart(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateQuad(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateExpo(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateElastic(t, B, C, D, A, P: Single; AType: TAnimationType): Single;
function InterpolateCubic(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateCirc(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateBounce(t, B, C, D: Single; AType: TAnimationType): Single;
function InterpolateBack(t, B, C, D, S: Single; AType: TAnimationType): Single;

{ Helper functions }

procedure ReverseBytes(P: Pointer; Count: Integer);
procedure FillLongword(Src: Pointer; Count: Integer; Value: longword);
procedure FillAlpha(Src: Pointer; Count: Integer; Alpha: Byte);
procedure FillLongwordRect(Src: Pointer; W, H, X1, Y1, X2, Y2: Integer; Value: longword);
function GetToken(var S: AnsiString; Separators: AnsiString; Stop: AnsiString = ''): AnsiString;
function WideGetToken(var Pos: Integer; const S: WideString; const Separators: WideString; const Stop: WideString = ''): WideString;
function MinMax(X, mi, ma: Single): Single;

function VarIsObject(Value: Variant): Boolean;
function ObjectToVariant(const AObject: TObject): Variant;
function VariantToObject(const Value: Variant): TObject;
function VarIsEvent(Value: Variant): Boolean;
function EventToVariant(const AMethod: TNotifyEvent): Variant;
function VariantToEvent(const Value: Variant): TNotifyEvent;
function IsHandleValid(Hnd: TFmxHandle): Boolean;

procedure RegisterFmxClasses(RegClasses: array of TPersistentClass); overload;
procedure RegisterFmxClasses(RegClasses: array of TPersistentClass;
  GroupClasses: array of TPersistentClass); overload;

{ C++Builder metaclass access functions }

function GetDefaultBitmapCodec(C: TBitmapCodecClass): TBitmapCodec;

var
  AnchorAlign: array [TAlignLayout] of TAnchors = (
    { alNone }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop],

    { alTop }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight],

    { alLeft }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { alRight }
    [TAnchorKind.akRight,
     TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { alBottom }
    [TAnchorKind.akLeft,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alMostTop }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight],

    { alMostBottom }
    [TAnchorKind.akLeft,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alMostLeft }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { alMostRight }
    [TAnchorKind.akRight,
     TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { alClient }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alContents }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alCenter }
    [],

    { alVertCenter }
    [TAnchorKind.akLeft,
     TAnchorKind.akRight],

    { alHorzCenter }
    [TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { vaHorizintal }
    [TAnchorKind.akLeft,
     TAnchorKind.akRight],

    { alVertical }
    [TAnchorKind.akTop,
     TAnchorKind.akBottom],

    { alScale }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alFit }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alFitLeft }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom],

    { alFitRight }
    [TAnchorKind.akLeft,
     TAnchorKind.akTop,
     TAnchorKind.akRight,
     TAnchorKind.akBottom]
  );

implementation

uses
  TypInfo, Math, UIConsts,
  FMX_Platform, FMX_Filter, FMX_Forms, FMX_Ani, FMX_Layouts, FMX_Objects,
  FMX_ListBox, FMX_Grid, FMX_Menus, FMX_Consts;

{$IFDEF FPC}
{$I FMX_Types_FPC_Impl.inc}
{$ENDIF}

{$IFDEF FPCCOMP}
{$I FMX_Types_FPC_Impl.inc}
{$ENDIF}

var
  MeasureBitmap: TBitmap;

function GetMeasureBitmap: TBitmap;
begin
  if MeasureBitmap = nil then
    MeasureBitmap := TBitmap.Create(1, 1);
  Result := MeasureBitmap;
end;

function VarIsObject(Value: Variant): Boolean;
var
  S: WideString;
begin
  S := Value;
{$IFDEF FPCCOMP}
  if (S <> '') and (Pos(WideString('vgobj'), S) = 1) then
{$ELSE}
  if (S <> '') and (Pos('vgobj', S) = 1) then
{$ENDIF}
    Result := True
  else
    Result := False;
end;

function ObjectToVariant(const AObject: TObject): Variant;
begin
  Result := 'vgobj' + IntToStr(Integer(Pointer(AObject)));
end;

function VariantToObject(const Value: Variant): TObject;
var
  S: WideString;
begin
  S := Value;
{$IFDEF FPCCOMP}
  if (S <> '') and (Pos(WideString('vgobj'), S) = 1) then
{$ELSE}
  if (S <> '') and (Pos('vgobj', S) = 1) then
{$ENDIF}
    Result := TObject(Pointer(StrToInt(Copy(S, 6, 10))))
  else
    Result := nil;
end;

function VarIsEvent(Value: Variant): Boolean;
var
  S: WideString;
begin
  if VarIsStr(Value) then
  begin
    S := Value;
{$IFDEF FPCCOMP}
    if (S <> '') and (Pos(WideString('vgmet'), S) = 1) then
{$ELSE}
    if (S <> '') and (Pos('vgmet', S) = 1) then
{$ENDIF}
      Result := True
    else
      Result := False;
  end
  else
    Result := False
end;

function EventToVariant(const AMethod: TNotifyEvent): Variant;
begin
  Result := 'vgmet' + IntToHex(Integer(TMethod(AMethod).Data), 8) + IntToHex(Integer(TMethod(AMethod).Code), 8);
end;

function VariantToEvent(const Value: Variant): TNotifyEvent;
var
  S: WideString;
begin
  S := Value;
{$IFDEF FPCCOMP}
  if (S <> '') and (Pos(WideString('vgmet'), S) = 1) then
{$ELSE}
  if (S <> '') and (Pos('vgmet', S) = 1) then
{$ENDIF}
  begin
    TMethod(Result).Data := Pointer(StrToInt('$' + Copy(S, 6, 8)));
    TMethod(Result).Code := Pointer(StrToInt('$' + Copy(S, 14, 8)));
  end
  else
  begin
    Result := nil;
  end;
end;

function IsHandleValid(Hnd: TFmxHandle): Boolean;
begin
  Result := (Hnd <> 0);
end;

procedure RegisterFmxClasses(RegClasses: array of TPersistentClass;
  GroupClasses: array of TPersistentClass);
var
  I: Integer;
begin
  StartClassGroup(TFmxObject);
  ActivateClassGroup(TFmxObject);
  for I := Low(GroupClasses) to High(GroupClasses) do
    Classes.GroupDescendentsWith(GroupClasses[I], TFmxObject);
  for I := Low(RegClasses) to High(RegClasses) do
    Classes.RegisterClass(RegClasses[I]);
end;

procedure RegisterFmxClasses(RegClasses: array of TPersistentClass);
begin
  RegisterFmxClasses(RegClasses, []);
end;

{ Resources }

var
  ResourceList: TList = nil;
  
procedure AddResource(const AObject: TFmxObject);
begin
  if ResourceList = nil then
  begin
    ResourceList := TList.Create;
    ResourceList.Capacity := 100;
  end;
  if ResourceList.IndexOf(AObject) < 0 then
    ResourceList.Add(AObject);
end;

procedure RemoveResource(const AObject: TFmxObject);
var
  Idx: Integer;
begin
  if ResourceList <> nil then
  begin
    Idx := ResourceList.IndexOf(AObject);
    if Idx >= 0 then
      ResourceList.Delete(Idx);
  end;
end;

function FindStyleResource(const AStyleLookup: WideString): TFmxObject;
var
  I: Integer;
begin
  Result := nil;
  if ResourceList <> nil then
    for I := ResourceList.Count - 1 downto 0 do
      if (ResourceList[I] <> nil) and TFmxObject(ResourceList[I]).Stored then
        if CompareText(TFmxObject(ResourceList[I]).StyleName, AStyleLookup) = 0 then
        begin
          Result := TFmxObject(ResourceList[I]);
          Break;
        end;
end;

function FindRCData(Instance: THandle; const RCDataName: WideString): Boolean;
{$IFDEF FPC}
var
  S: AnsiString;
{$ENDIF}
begin
  Result := False;
{$IFDEF FPC}
  S := RCDataName;
  Result := System.FindResource(Instance, PAnsiChar(S), RT_RCDATA) <> 0;
{$ELSE}
  Result := System.FindResource(Instance, PWideChar(RCDataName), RT_RCDATA) <> 0;
{$ENDIF}
end;

function CreateObjectFromStream(AOwner: TComponent; const AStream: TStream): TFmxObject;
var
  Reader: TReader;
  SavePos: Longint;
  I: Integer;
  Flags: TFilerFlags;
  ClassName: WideString;
  ObjClass: TFmxObjectClass;
  BinStream: TStream;
begin
  // Ensure the correct class group is active
  ActivateClassGroup(TFmxObject);
  Result := nil;
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(AStream, BinStream);
      BinStream.Position := 0;

      Reader := TReader.Create(BinStream, 4096);
{$IFDEF FPC}
      Reader.Driver.BeginRootComponent;
      ClassName := Reader.Driver.ReadStr;
{$ELSE}
      Reader.ReadSignature;
      Reader.ReadPrefix(Flags, I);
      ClassName := Reader.ReadStr;
{$ENDIF}
      ObjClass := TFmxObjectClass(GetClass(ClassName));
      if ObjClass <> nil then
      begin
        Result := ObjClass.Create(AOwner);
        if Result <> nil then
        begin
          BinStream.Position := 0;
          Result.IntLoadFromBinStream(BinStream);
        end;
      end
      else
        Result := nil;
      Reader.Free;
    finally
      BinStream.Free;
    end;
  except
    Result := nil;
  end;
end;

function CreateObjectFromBinStream(AOwner: TComponent; const AStream: TStream): TFmxObject;
var
  Reader: TReader;
  SavePos: Longint;
  I: Integer;
  Flags: TFilerFlags;
  ClassName: WideString;
  ObjClass: TFmxObjectClass;
begin
  // Ensure the correct class group is active
  ActivateClassGroup(TFmxObject);
  Result := nil;
  try
    SavePos := AStream.Position;

    Reader := TReader.Create(AStream, 4096);
{$IFDEF FPC}
    Reader.Driver.BeginRootComponent;
    ClassName := Reader.Driver.ReadStr;
{$ELSE}
    Reader.ReadSignature;
    Reader.ReadPrefix(Flags, I);
    ClassName := Reader.ReadStr;
{$ENDIF}
    ObjClass := TFmxObjectClass(GetClass(ClassName));
    if ObjClass <> nil then
    begin
      Result := ObjClass.Create(AOwner);
      if Result <> nil then
      begin
        AStream.Position := SavePos;
        Result.IntLoadFromBinStream(AStream);
      end;
    end;
    Reader.Free;
  except
    Result := nil;
  end;
end;

procedure ZeroOwner(AObj: TFmxObject);
var
  I: Integer;
begin
  if AObj.Owner <> nil then
    AObj.Owner.RemoveComponent(AObj); // set Owner = nil to disable freeing whene Owner is destroyed 
  for I := 0 to AObj.ChildrenCount - 1 do
    ZeroOwner(AObj.Children[I]);
end;

procedure MergeObjectFromStream(AObject: TFmxObject; const AStream: TStream);
var
  I: Integer;
  Obj: TFmxObject;
begin
  Obj := CreateObjectFromStream(AObject.Owner, AStream);
  if Obj <> nil then
  begin
    for I := Obj.ChildrenCount - 1 downto 0 do
    begin
      ZeroOwner(Obj.Children[I]);
      Obj.Children[I].Parent := AObject;
    end;
    Obj.Free;
  end;
end;

function LoadObjectFromStream(AObject: TFmxObject; const AStream: TStream): TFmxObject;
var
  Reader: TReader;
  SavePos: Longint;
  I: Integer;
  Flags: TFilerFlags;
  ClassName: WideString;
  ObjClass: TFmxObjectClass;
  BinStream: TStream;
begin
  Result := nil;
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(AStream, BinStream);
      BinStream.Position := 0;
      Result := AObject;
      if Result <> nil then
      begin
        BinStream.Position := 0;
        Result.IntLoadFromBinStream(BinStream);
      end;
      Reader.Free;
    finally
      BinStream.Free;
    end;
  except
    Result := nil;
  end;
end;

{ Scenes }

var
  NeedResetLang: Boolean;

procedure AddScene(const AScene: IScene);
begin
  if SceneList = nil then
    SceneList := TList.Create;
  if SceneList.IndexOf(Pointer(AScene)) < 0 then
    SceneList.Add(Pointer(AScene));
end;

procedure RemoveScene(const AScene: IScene);
begin
  if SceneList <> nil then
    SceneList.Remove(Pointer(AScene));
end;

{ Lang }

var
  CollectLang, Lang: TWideStrings;

procedure CollectLangStart;
begin
  ResetLang;
  if CollectLang = nil then
  begin
    CollectLang := TWideStringList.Create;
//    TWideStringList(CollectLang).Sorted := True;
    TWideStringList(CollectLang).CaseSensitive := True;
  end;
end;

procedure CollectLangFinish;
begin
  if CollectLang <> nil then
    FreeAndNil(CollectLang);
end;

function CollectLangStrings: TWideStrings;
begin
  Result := CollectLang;
end;

procedure CollectLangSave;
begin
  if CollectLang <> nil then
  begin
    CollectLang.SaveToFile(ExtractFilePath(ParamStr(0)) + 'lang.lng');
  end;
end;

procedure LoadLangFromFile(const AFileName: WideString);
begin
  if not FileExists(AFileName) then
    Exit;
  ResetLang;
  if Lang = nil then
  begin
    Lang := TWideStringList.Create;
//    TWideStringList(Lang).Sorted := True;
    TWideStringList(Lang).CaseSensitive := True;
  end;
  Lang.LoadFromFile(AFileName);
  UpdateLang;
end;

procedure LoadLangFromStrings(AStr: TWideStrings);
begin
  if AStr = nil then
    Exit;
  ResetLang;
  if Lang = nil then
  begin
    Lang := TWideStringList.Create;
//    TWideStringList(Lang).Sorted := True;
    TWideStringList(Lang).CaseSensitive := True;
  end;
  Lang.Assign(AStr);
  UpdateLang;
end;

procedure ResetLang;
begin
  if Lang <> nil then
  begin
    NeedResetLang := True;
    try
      UpdateLang;
    finally
      NeedResetLang := False;
      FreeAndNil(Lang);
    end;
  end;
end;

procedure UpdateLang;
var
  I: Integer;
begin
  if SceneList <> nil then
  begin
    for I := 0 to SceneList.Count - 1 do
      IScene(SceneList[I]).UpdateStyle;
  end;
end;

function IndexOfValueStr(Str: TWideStrings; const Name: WideString): Integer;
var
  P: Integer;
  S: WideString;
begin
  for Result := 0 to Str.Count - 1 do
  begin
    S := Str[Result];
{$IFDEF FPCCOMP}
    P := Pos(WideString('='), S);
{$ELSE}
    P := Pos('=', S);
{$ENDIF}
    if (P > 0) and (CompareStr(Copy(S, P + 1, Length(S)), Name) = 0) then Exit;
  end;
  Result := -1;
end;

function Translate(const AText: WideString): WideString;
var
  Idx: Integer;
begin
  if AText = '' then
  begin
    Result := '';
    Exit;
  end;
  if Assigned(CustomTranslateProc) then
  begin
    if CustomTranslateProc(AText) <> '' then
      Result := CustomTranslateProc(AText)
    else
      Result := AText;
    Exit;
  end;
  if CollectLang <> nil then
  begin
    if CollectLang.IndexOf(AText) < 0 then
      CollectLang.Add(AText)
  end;
  if Lang <> nil then
  begin
    if not NeedResetLang then
    begin
      Idx := Lang.IndexOfName(AText);
      if Idx >= 0 then
        Result := Lang.ValueFromIndex[Idx]
      else
        Result := AText;
    end
    else
    begin
      Idx := IndexOfValueStr(Lang, AText);
      if Idx >= 0 then
        Result := Lang.Names[Idx];
      if Result = '' then
        Result := AText;
    end;
  end
  else
    Result := AText;
end;

function TranslateText(const AText: WideString): WideString;
begin
  Result := Translate(AText);
end;

{ Align procedure }

type

  TAlignInfo = record
    AlignList: TList;
    ObjectIndex: Integer;
    Align: TAlignLayout;
    Scratch: Integer;
  end;

procedure AlignObjects(AParent: TFmxObject; AMargins: TBounds; AParentWidth,
  AParentHeight: single; var ALastWidth, ALastHeight: single;
  var ADisableAlign: Boolean);
var
  i: Integer;
  R: TRectF;
  AlignList: TList;

  function InsertBefore(C1, C2: IAlignableObject; AAlign: TAlignLayout): Boolean;
  begin
    Result := False;
    case AAlign of
      TAlignLayout.alTop, TAlignLayout.alMostTop:
        Result := C1.Top < C2.Top;
      TAlignLayout.alBottom, TAlignLayout.alMostBottom:
        Result := (C1.Top + C1.Height) >= (C2.Top + C2.Height);
      TAlignLayout.alLeft, TAlignLayout.alMostLeft:
        Result := C1.Left < C2.Left;
      TAlignLayout.alRight, TAlignLayout.alMostRight:
        Result := (C1.Left + C1.Width) >= (C2.Left + C2.Width);
    end;
  end;

  procedure DoPosition(Control: IAlignableObject; AAlign: TAlignLayout; AlignInfo: TAlignInfo);
  var
    NewLeft, NewTop, NewWidth, NewHeight: Single;
    cR, mR: TRectF;
    fitScale: Single;
  begin
    with R do
    begin
      if (AAlign = TAlignLayout.alNone) or (Control.Anchors <> AnchorAlign[AAlign]) then
      begin
        NewLeft := Control.Left;
        NewTop := Control.Top;
        NewWidth := Control.Width;
        NewHeight := Control.Height;
        if TAnchorKind.akRight in Control.Anchors then
          if TAnchorKind.akLeft in Control.Anchors then
            // The AnchorRules.X is the original FContext.Width
            NewWidth := AParentWidth - (ALastWidth - Control.Width)
          else
            // The AnchorRules.X is the original left
            NewLeft := AParentWidth - (ALastWidth - Control.Left)
        else if not (TAnchorKind.akLeft in Control.Anchors) then
          // The AnchorRules.X is the original middle of the AControl
          NewLeft := (Control.Width * AParentWidth / ALastWidth) - NewWidth / 2;
        if TAnchorKind.akBottom in Control.Anchors then
          if TAnchorKind.akTop in Control.Anchors then
            // The AnchorRules.Y is the original FContext.Height
            NewHeight := AParentHeight - (ALastHeight - Control.Height)
          else
            // The AnchorRules.Y is the original top
            NewTop := AParentHeight - (ALastHeight - Control.Top)
        else if not (TAnchorKind.akTop in Control.Anchors) then
          // The AnchorRules.Y is the original middle of the AControl
          NewTop := (Control.Height * AParentHeight / ALastHeight) - NewHeight / 2;
        Control.SetBounds(NewLeft + Control.Padding.Left, NewTop + Control.Padding.Top,
          NewWidth - Control.Padding.Left - Control.Padding.Right, NewHeight - Control.Padding.Top -
          Control.Padding.Bottom);
        if AAlign = TAlignLayout.alNone then Exit;
      end;

      NewWidth := Right - Left;
      if (NewWidth < 0) or (AAlign in [TAlignLayout.alLeft, TAlignLayout.alRight, TAlignLayout.alVertical,
        TAlignLayout.alMostLeft, TAlignLayout.alMostRight]) then
        NewWidth := Control.Width + Control.Padding.Left + Control.Padding.Right;
      NewHeight := Bottom - Top;
      if (NewHeight < 0) or (AAlign in [TAlignLayout.alTop, TAlignLayout.alBottom, TAlignLayout.alMostTop,
        TAlignLayout.alMostBottom, TAlignLayout.alHorizontal]) then
        NewHeight := Control.Height + Control.Padding.Top + Control.Padding.Bottom;
      NewLeft := Left;
      NewTop := Top;
      if (AAlign in [TAlignLayout.alVertical]) then
        NewLeft := Control.Left + Control.Padding.Left;
      if (AAlign in [TAlignLayout.alHorizontal]) then
        NewTop := Control.Top + Control.Padding.Top;
      case AAlign of
        TAlignLayout.alTop, TAlignLayout.alMostTop:
          Top := Top + NewHeight;
        TAlignLayout.alBottom, TAlignLayout.alMostBottom:
          begin
            Bottom := Bottom - NewHeight;
            NewTop := Bottom;
          end;
        TAlignLayout.alLeft, TAlignLayout.alMostLeft:
          Left := Left + NewWidth;
        TAlignLayout.alRight, TAlignLayout.alMostRight:
          begin
            Right := Right - NewWidth;
            NewLeft := Right;
          end;
        TAlignLayout.alContents:
          begin
            NewLeft := 0;
            NewTop := 0;
            NewWidth := AParentWidth;
            NewHeight := AParentHeight;
            Control.SetBounds(NewLeft + Control.Padding.Left, NewTop + Control.Padding.Top,
              NewWidth - Control.Padding.Left - Control.Padding.Right, NewHeight - Control.Padding.Top -
              Control.Padding.Bottom);
            Exit;
          end;
        TAlignLayout.alFit, TAlignLayout.alFitLeft, TAlignLayout.alFitRight:
          begin
            // mR := Rect(Margins.Left, Margins.Top, AParentWidth - Margins.Right, AParentHeight - Margins.Bottom);
            mR := RectF(0, 0, AParentWidth, AParentHeight);
            cR := RectF(Control.Left - Control.Padding.Left, Control.Top - Control.Padding.Top,
              Control.Left + Control.Width + Control.Padding.Right,
              Control.Top + Control.Height + Control.Padding.Bottom);
            fitScale := FitRect(cR, mR);
            if (fitScale > 0) and (fitScale < 1) then
            begin
              cR.Left := cR.Left / fitScale;
              cR.Right := cR.Right / fitScale;
              cR.Top := cR.Top / fitScale;
              cR.Bottom := cR.Bottom / fitScale;
              RectCenter(cR, mR);
              if AAlign = TAlignLayout.alFitLeft then
                OffsetRect(cR, mR.Left - cR.Left, 0);
              if AAlign = TAlignLayout.alFitRight then
                OffsetRect(cR, mR.Right - cR.Right, 0);
              NewLeft := cR.Left;
              NewTop := cR.Top;
              NewWidth := cR.Right - cR.Left;
              NewHeight := cR.Bottom - cR.Top;
            end
            else
            begin
              if AAlign = TAlignLayout.alFitLeft then
                OffsetRect(cR, mR.Left - cR.Left, 0);
              if AAlign = TAlignLayout.alFitRight then
                OffsetRect(cR, mR.Right - cR.Right, 0);
              NewLeft := cR.Left;
              NewTop := cR.Top;
              NewWidth := cR.Right - cR.Left;
              NewHeight := cR.Bottom - cR.Top;
            end;
            Control.SetBounds(NewLeft + Control.Padding.Left, NewTop + Control.Padding.Top,
              NewWidth - Control.Padding.Left - Control.Padding.Right, NewHeight - Control.Padding.Top -
              Control.Padding.Bottom);
            if AAlign = TAlignLayout.alFitLeft then
              Left := Left + NewWidth;
            if AAlign = TAlignLayout.alFitRight then
              Right := Right - NewWidth;
            Exit;
          end;
        TAlignLayout.alCenter:
          begin
            NewLeft := Left +
              Trunc((NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right)) / 2);
            NewWidth := (Control.Width + Control.Padding.Left + Control.Padding.Right);
            NewTop := Top +
              Trunc((NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom)) / 2);
            NewHeight := (Control.Height + Control.Padding.Top + Control.Padding.Bottom);
          end;
        TAlignLayout.alHorzCenter:
          begin
            NewLeft := Left +
              Trunc((NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right)) / 2);
            NewWidth := (Control.Width + Control.Padding.Left + Control.Padding.Right);
          end;
        TAlignLayout.alVertCenter:
          begin
            NewTop := Top +
              Trunc((NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom)) / 2);
            NewHeight := (Control.Height + Control.Padding.Top + Control.Padding.Bottom);
          end;
      end;
    end;

    if (AAlign = TAlignLayout.alScale) then
    begin
      if (ALastWidth > 0) and (ALastHeight > 0) and (AParentWidth > 0) and (AParentHeight > 0) then
      begin
        Control.SetBounds(Control.Left * (AParentWidth / ALastWidth),
          Control.Top * (AParentHeight / ALastHeight), Control.Width * (AParentWidth / ALastWidth),
          Control.Height * (AParentHeight / ALastHeight));
      end;
      Exit;
    end
    else
    begin
      Control.SetBounds(NewLeft + Control.Padding.Left, NewTop + Control.Padding.Top,
        NewWidth - Control.Padding.Left - Control.Padding.Right, NewHeight - Control.Padding.Top -
        Control.Padding.Bottom);
    end;

    { Adjust client RectF if control didn't resize as we expected }
    if (Control.Width + Control.Padding.Left + Control.Padding.Right <> NewWidth) or
      (Control.Height + Control.Padding.Top + Control.Padding.Bottom <> NewHeight) then
      with R do
        case AAlign of
          TAlignLayout.alTop:
            Top := Top - (NewHeight - (Control.Height + Control.Padding.Left + Control.Padding.Right));
          TAlignLayout.alBottom:
            Bottom := Bottom + (NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom));
          TAlignLayout.alLeft:
            Left := Left - (NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right));
          TAlignLayout.alRight:
            Right := Right + (NewWidth - (Control.Width + Control.Padding.Top + Control.Padding.Bottom));
          TAlignLayout.alClient:
            begin
              Right := Right + NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right);
              Bottom := Bottom + NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom);
            end;
        end;
  end;

  procedure DoAlign(AAlign: TAlignLayout);
  var
    i, j: Integer;
    Control: IAlignableObject;
    AlignInfo: TAlignInfo;
  begin
    AlignList.Clear;
    for i := 0 to AParent.FChildren.Count - 1 do
    begin
      if not Supports(AParent.Children[i], IAlignableObject, Control) then
        Continue;
      if (Control.Align = AAlign) and (Control.AllowAlign) then
      begin
        j := 0;
        while (j < AlignList.Count) and not InsertBefore(Control, IAlignableObject(AlignList[j]), AAlign) do
          Inc(j);
        AlignList.Insert(j, Pointer(Control));
      end;
    end;
    for i := 0 to AlignList.Count - 1 do
    begin
      AlignInfo.AlignList := AlignList;
      AlignInfo.ObjectIndex := i;
      AlignInfo.Align := AAlign;
      DoPosition(IAlignableObject(AlignList[i]), AAlign, AlignInfo);
    end;
  end;

begin
  if csDestroying in AParent.ComponentState then Exit;
  if AParent.FChildren = nil then
    Exit;
  if AParent.FChildren.Count = 0 then
    Exit;
  if ADisableAlign then Exit;
  if csLoading in AParent.ComponentState then
  begin
    ALastWidth := AParentWidth;
    ALastHeight := AParentHeight;
    Exit;
  end;
  if (Abs(AParentWidth) < 1) or (Abs(AParentWidth) < 1) then
    Exit;
  if ALastWidth = 0 then
    ALastWidth := AParentWidth;
  if ALastHeight = 0 then
    ALastHeight := AParentHeight;

  ADisableAlign := True;
  try
    R := RectF(0, 0, AParentWidth, AParentHeight);
    if AMargins <> nil then
      R := AMargins.MarginRect(R);
    AlignList := TList.Create;
    try
      // Align
      DoAlign(TAlignLayout.alMostTop);
      DoAlign(TAlignLayout.alMostBottom);
      DoAlign(TAlignLayout.alMostLeft);
      DoAlign(TAlignLayout.alMostRight);
      DoAlign(TAlignLayout.alTop);
      DoAlign(TAlignLayout.alBottom);
      DoAlign(TAlignLayout.alLeft);
      DoAlign(TAlignLayout.alRight);
      DoAlign(TAlignLayout.alFitLeft);
      DoAlign(TAlignLayout.alFitRight);
      DoAlign(TAlignLayout.alClient);
      DoAlign(TAlignLayout.alHorizontal);
      DoAlign(TAlignLayout.alVertical);
      DoAlign(TAlignLayout.alContents);
      DoAlign(TAlignLayout.alCenter);
      DoAlign(TAlignLayout.alHorzCenter);
      DoAlign(TAlignLayout.alVertCenter);
      DoAlign(TAlignLayout.alScale);
      DoAlign(TAlignLayout.alFit);
      // Anchors
//      DoAlign(TAlignLayout.alNone);
    finally
      AlignList.Free;
    end;
    ALastWidth := AParentWidth;
    ALastHeight := AParentHeight;
  finally
    ADisableAlign := False;
  end;
end;

{ Geom }

function GetToken(var S: AnsiString; Separators: AnsiString; Stop: AnsiString = ''): AnsiString;
var
  I, len: Integer;
  CopyS: AnsiString;
begin
  Result := '';
  CopyS := S;
  len := Length(CopyS);
  for I := 1 to len do
  begin
    if Pos(CopyS[I], Stop) > 0 then
      Break;
    Delete(S, 1, 1);
    if Pos(CopyS[I], Separators) > 0 then
    begin
      Result := Result;
      Break;
    end;
    Result := Result + CopyS[I];
  end;
  Result := Trim(Result);
  S := Trim(S);
end;

function WideGetToken(var Pos: Integer; const S: WideString; const Separators: WideString;
  const Stop: WideString = ''): WideString;
var
  len: Integer;
begin
  Result := '';
  len := Length(S);
  { skip first separators }
  while Pos <= len do
  begin
    if System.Pos(S[Pos], Separators) <= 0 then
      Break;
    Inc(Pos);
  end;
  { get }
  while Pos <= len do
  begin
    if System.Pos(S[Pos], Stop) > 0 then
      Break;
    if System.Pos(S[Pos], Separators) > 0 then
      Break;
    Result := Result + S[Pos];
    Inc(Pos);
  end;
  { skip separators }
  while Pos <= len do
  begin
    if System.Pos(S[Pos], Separators) <= 0 then
      Break;
    inc(Pos);
  end;
end;

procedure ReverseBytes(P: Pointer; Count: Integer);
var
  P1: PByte;
  P2: PByte;
  C: Byte;
begin
  P1 := PByte(P);
  P2 := PByte(P) + Count - 1;
  while P1 < P2 do
  begin
    C := P1^;
    P1^ := P2^;
    P2^ := C;
    System.inc(P1);
    System.dec(P2);
  end;
end;

procedure FillAlpha(Src: Pointer; Count: Integer; Alpha: Byte);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    PAlphaColorRecArray(Src)[I].A := Alpha;
end;

procedure FillLongword(Src: Pointer; Count: Integer; Value: longword);
var
  I: Integer;
  S: PAlphaColorArray;
begin
  if Value = 0 then
    FillChar(Src^, Count * 4, 0)
  else if Value = $FFFFFFFF then
    FillChar(Src^, Count * 4, $FF)
  else
  begin
    S := PAlphaColorArray(Src);
    for I := 0 to Count - 1 do
      S[I] := Value;
  end;
end;

procedure FillLongwordRect(Src: Pointer; W, H, X1, Y1, X2, Y2: Integer; Value: longword);
var
  j: Integer;
begin
  if X2 > W then
    X2 := W;
  if Y2 > H then
    Y2 := H;
  if X1 > X2 then
    X1 := X1;
  if Y1 > Y2 then
    Y1 := Y2;
  for j := Y1 to Y2 - 1 do
  begin
    if Value = 0 then
      FillChar(PAlphaColorArray(Src)[X1 + (j * W)], (X2 - X1) * 4, 0)
    else if Value = $FFFFFFFF then
      FillChar(PAlphaColorArray(Src)[X1 + (j * W)], (X2 - X1) * 4, $FF)
    else
      FillLongword(@PAlphaColorArray(Src)[X1 + (j * W)], X2 - X1, Value);
  end;
end;

function MinMax(X, mi, ma: Single): Single;
begin
  if (X < mi) then
    Result := mi
  else if (X > ma) then
    Result := ma
  else
    Result := X;
end;

{ Colors }

function RGBtoBGR(const C: TAlphaColor): TAlphaColor;
begin
  Result := C;
  TAlphaColorRec(Result).R := TAlphaColorRec(C).B;
  TAlphaColorRec(Result).B := TAlphaColorRec(C).R;
end;

function CorrectColor(const C: TAlphaColor): TAlphaColor;
begin
  Result := C;
{$IFNDEF MSWINDOWS}
  TColorRec(Result).R := TColorRec(C).B;
  TColorRec(Result).B := TColorRec(C).R;
{$ENDIF}
end;

function PremultiplyAlpha(const C: TAlphaColor): TAlphaColor;
begin
  if TAlphaColorRec(C).A = 0 then
    Result := 0
  else if TAlphaColorRec(C).A = $FF then
    Result := C
  else
  begin
    TAlphaColorRec(Result).R := trunc(TAlphaColorRec(C).R * (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).G := trunc(TAlphaColorRec(C).G * (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).B := trunc(TAlphaColorRec(C).B * (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).A := TAlphaColorRec(C).A;
  end;
end;

function UnpremultiplyAlpha(const C: TAlphaColor): TAlphaColor;
begin
  if TAlphaColorRec(C).A = 0 then
    Result := 0
  else if TAlphaColorRec(C).A = $FF then
    Result := C
  else
  begin
    TAlphaColorRec(Result).R := trunc(TAlphaColorRec(C).R / (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).G := trunc(TAlphaColorRec(C).G / (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).B := trunc(TAlphaColorRec(C).B / (TAlphaColorRec(C).A / $FF));
    TAlphaColorRec(Result).A := TAlphaColorRec(C).A;
  end;
end;

function MakeColor(const C: TAlphaColor; const AOpacity: Single): TAlphaColor;
begin
  Result := C;
  if AOpacity < 1 then
    TAlphaColorRec(Result).A := trunc(TAlphaColorRec(C).A * AOpacity);
end;

function MakeColor(R, G, B: Byte; A: Byte = $FF): TAlphaColor;
begin
  TAlphaColorRec(Result).R := R;
  TAlphaColorRec(Result).G := G;
  TAlphaColorRec(Result).B := B;
  TAlphaColorRec(Result).A := A;
end;

function ChangeHSL(const C: TAlphaColor; dH, dS, dL: Single): TAlphaColor;
var
  H, S, L: Single;
  A: Byte;
begin
  A := TAlphaColorRec(C).A;
  RGBtoHSL(C, H, S, L);
  H := H + dH;
  if H < 0 then
    H := H + 1;
  if H > 1 then
    H := H - 1;
  S := S + dS;
  if S < 0 then
    S := 0;
  if S > 1 then
    S := 1;
  L := L + dL;
  if L < 0 then
    L := 0;
  if L > 1 then
    L := 1;
  Result := HSLtoRGB(H, S, L);
  TAlphaColorRec(Result).A := A;
end;

function HSLtoRGB(H, S, L: Single): TAlphaColor;

  function hue2rgb(P, q, t: Single): Single;
  begin
    if (t < 0) then
      t := t + 1;
    if (t > 1) then
      t := t - 1;
    if (t < 1 / 6) then
    begin
      Result := P + (q - P) * 6 * t;
      Exit;
    end;
    if (t < 1 / 2) then
    begin
      Result := q;
      Exit;
    end;
    if (t < 2 / 3) then
    begin
      Result := P + (q - P) * (2 / 3 - t) * 6;
      Exit;
    end;
    Result := P;
  end;

var
  R, G, B: Single;
  q, P: Single;
begin
  if (S = 0) then
  begin
    R := L;
    G := L;
    B := L;
  end else
  begin
    if (L < 0.5) then
      q := L * (1 + S)
    else
      q := L + S - L * S;
    P := 2 * L - q;
    R := hue2rgb(P, q, H + 1 / 3);
    G := hue2rgb(P, q, H);
    B := hue2rgb(P, q, H - 1 / 3);
  end;
  Result := MakeColor(round(R * $FF), round(G * $FF), round(B * $FF));
end;

procedure RGBtoHSL(RGB: TAlphaColor; out H, S, L: Single);
var
  R, G, B: Single;
  D, mx, mn: Single;
begin
  R := TAlphaColorRec(RGB).R / $FF;
  G := TAlphaColorRec(RGB).G / $FF;
  B := TAlphaColorRec(RGB).B / $FF;
  mx := Max(Max(R, G), B);
  mn := Min(Min(R, G), B);
  H := (mx + mn) / 2;
  L := H;
  S := H;
  if (mx = mn) then
  begin
    S := 0;
    H := 0;
  end
  else
  begin
    D := mx - mn;
    if L > 0.5 then
      S := D / (2 - mx - mn)
    else
      S := D / (mx + mn);
    if (mx = R) then
      H := (G - B) / D
    else if (mx = G) then
      H := (B - R) / D + 2
    else
      H := (R - G) / D + 4;
    H := H / 6;
    if H < 0 then
      H := H + 1;
  end;
end;

{ math }

function NormalizeAngle(const Angle: Single): Single;
begin
  Result := Angle - Int(Angle * cInv360) * c360;
  if Result < -c180 then
    Result := Result + c360;
end;
function FitRect(var R: TRectF; BoundsRect: TRectF): Single;
var
  ratio: Single;
begin
  Result := 1;
  if RectWidth(BoundsRect) * RectHeight(BoundsRect) = 0 then
    Exit;

  if (RectWidth(R) / RectWidth(BoundsRect)) > (RectHeight(R) / RectHeight(BoundsRect)) then
    ratio := RectWidth(R) / RectWidth(BoundsRect)
  else
    ratio := RectHeight(R) / RectHeight(BoundsRect);

  if ratio < 1 then
  begin
    R := RectF(0, 0, RectWidth(R), RectHeight(R));
  end
  else
  begin
    R := RectF(0, 0, round(RectWidth(R) / ratio), round(RectHeight(R) / ratio));
  end;

  Result := ratio;
  RectCenter(R, BoundsRect);
end;

function IsRectEmpty(Rect: TRectF): Boolean;
begin
  Result := (RectWidth(Rect) <= 0) or (RectHeight(Rect) <= 0);
end;

function PointInRect(const P: TPointF; const Rect: TRectF): Boolean;
begin
  Result := (P.X >= Rect.Left) and (P.X <= Rect.Right) and (P.Y >= Rect.Top) and (P.Y <= Rect.Bottom);
end;

function RectToString(R: TRectF): AnsiString;
begin
  Result := '(' + FloatToStr(R.Left, USFormatSettings) + ',' + FloatToStr(R.Top, USFormatSettings) + ',' + FloatToStr(R.Right, USFormatSettings) + ',' +
    FloatToStr(R.Bottom, USFormatSettings) + ')';
end;

function StringToRect(S: AnsiString): TRectF;
begin
  try
    GetToken(S, ',()');
    Result.Left := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Top := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Right := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Bottom := StrToFloat(GetToken(S, ',()'), USFormatSettings);
  except
    Result := RectF(0, 0, 0, 0);
  end;
end;

function Point(const V: TVector): TPointF;
begin
  Result.X := V.X;
  Result.Y := V.Y;
end;

function PointToString(R: TPointF): AnsiString;
begin
  Result := '(' + FloatToStr(R.X, USFormatSettings) + ',' + FloatToStr(R.Y, USFormatSettings) + ')';
end;

function StringToPoint(S: AnsiString): TPointF;
begin
  try
    GetToken(S, ',()');
    Result.X := StrToFloat(GetToken(S, ',()'), USFormatSettings);
    Result.Y := StrToFloat(GetToken(S, ',()'), USFormatSettings);
  except
    Result := PointF(0, 0);
  end;
end;

function MatrixMultiply(const M1, M2: TMatrix): TMatrix;
begin
  Result.m11 := M1.m11 * M2.m11 + M1.m12 * M2.m21 + M1.m13 * M2.m31;
  Result.m12 := M1.m11 * M2.m12 + M1.m12 * M2.m22 + M1.m13 * M2.m32;
  Result.m13 := M1.m11 * M2.m13 + M1.m12 * M2.m23 + M1.m13 * M2.m33;
  Result.m21 := M1.m21 * M2.m11 + M1.m22 * M2.m21 + M1.m23 * M2.m31;
  Result.m22 := M1.m21 * M2.m12 + M1.m22 * M2.m22 + M1.m23 * M2.m32;
  Result.m23 := M1.m21 * M2.m13 + M1.m22 * M2.m23 + M1.m23 * M2.m33;
  Result.m31 := M1.m31 * M2.m11 + M1.m32 * M2.m21 + M1.m33 * M2.m31;
  Result.m32 := M1.m31 * M2.m12 + M1.m32 * M2.m22 + M1.m33 * M2.m32;
  Result.m33 := M1.m31 * M2.m13 + M1.m32 * M2.m23 + M1.m33 * M2.m33;
end;

function MatrixDeterminant(const M: TMatrix): Single;
begin
  Result := M.M[0].V[0] * (M.M[1].V[1] * M.M[2].V[2] - M.M[2].V[1] * M.M[1].V[2]) - M.M[0].V[1] *
    (M.M[1].V[0] * M.M[2].V[2] - M.M[2].V[0] * M.M[1].V[2]) + M.M[0].V[2] *
    (M.M[1].V[0] * M.M[2].V[1] - M.M[2].V[0] * M.M[1].V[1]);
end;

procedure AdjointMatrix(var M: TMatrix);
var
  a1, a2, a3, b1, b2, b3, c1, c2, c3: Single;
begin
  a1 := M.M[0].V[0];
  a2 := M.M[0].V[1];
  a3 := M.M[0].V[2];
  b1 := M.M[1].V[0];
  b2 := M.M[1].V[1];
  b3 := M.M[1].V[2];
  c1 := M.M[2].V[0];
  c2 := M.M[2].V[1];
  c3 := M.M[2].V[2];
  M.M[0].V[0] := (b2 * c3 - c2 * b3);
  M.M[1].V[0] := -(b1 * c3 - c1 * b3);
  M.M[2].V[0] := (b1 * c2 - c1 * b2);

  M.M[0].V[1] := -(a2 * c3 - c2 * a3);
  M.M[1].V[1] := (a1 * c3 - c1 * a3);
  M.M[2].V[1] := -(a1 * c2 - c1 * a2);

  M.M[0].V[2] := (a2 * b3 - b2 * a3);
  M.M[1].V[2] := -(a1 * b3 - b1 * a3);
  M.M[2].V[2] := (a1 * b2 - b1 * a2);
end;

procedure ScaleMatrix(var M: TMatrix; const factor: Single);
var
  I: Integer;
begin
  for I := 0 to 2 do
  begin
    M.M[I].V[0] := M.M[I].V[0] * factor;
    M.M[I].V[1] := M.M[I].V[1] * factor;
    M.M[I].V[2] := M.M[I].V[2] * factor;
  end;
end;

procedure InvertMatrix(var M: TMatrix);
var
  det: Single;
begin
  det := MatrixDeterminant(M);
  if Abs(det) < Epsilon then
    M := IdentityMatrix
  else
  begin
    AdjointMatrix(M);
    ScaleMatrix(M, 1 / det);
  end;
end;

function Vector(const X, Y: Single; const W: Single = 1.0): TVector;
begin
  Result.X := X;
  Result.Y := Y;
  Result.W := W;
end;

function Vector(const P: TPointF; const W: Single = 1.0): TVector;
begin
  Result.X := P.X;
  Result.Y := P.Y;
  Result.W := W;
end;

function VectorTransform(const V: TVector; const M: TMatrix): TVector;
begin
  Result.V[0] := V.V[0] * M.M[0].V[0] + V.V[1] * M.M[1].V[0] + V.V[2] * M.M[2].V[0];
  Result.V[1] := V.V[0] * M.M[0].V[1] + V.V[1] * M.M[1].V[1] + V.V[2] * M.M[2].V[1];
  Result.V[2] := 1.0;
end;

function VectorAdd(const v1: TVector; const v2: TVector): TVector;
begin
  Result.V[0] := v1.V[0] + v2.V[0];
  Result.V[1] := v1.V[1] + v2.V[1];
  Result.W := 1.0;
end;

function VectorSubtract(const v1: TVector; const v2: TVector): TVector;
begin
  Result.V[0] := v1.V[0] - v2.V[0];
  Result.V[1] := v1.V[1] - v2.V[1];
  Result.W := 1.0;
end;

function VectorNorm(const V: TVector): Single;
begin
  Result := V.V[0] * V.V[0] + V.V[1] * V.V[1];
end;

function RSqrt(V: Single): Single;
var
  R: double;
begin
  R := Abs(V);
  if (R > 0) then
    Result := 1 / Sqrt(R)
  else
    Result := 1;
end;

function VectorNormalize(const V: TVector): TVector;
var
  invLen: Single;
begin
  invLen := RSqrt(Abs(VectorNorm(V)));
  Result.V[0] := V.V[0] * invLen;
  Result.V[1] := V.V[1] * invLen;
  Result.V[2] := 0.0;
end;

function VectorScale(const V: TVector; factor: Single): TVector;
begin
  Result.V[0] := V.V[0] * factor;
  Result.V[1] := V.V[1] * factor;
  Result.W := 1;
end;

function VectorLength(const V: TVector): Single;
begin
  Result := Sqrt(VectorNorm(V));
end;

function VectorDotProduct(const v1, v2: TVector): Single;
begin
  Result := v1.V[0] * v2.V[0] + v1.V[1] * v2.V[1];
end;

function VectorAngleCosine(const v1, v2: TVector): Single;
begin
  if (VectorLength(v1) <> 0) and (VectorLength(v2) <> 0) then
  begin
    Result := VectorDotProduct(v1, v2) / (VectorLength(v1) * VectorLength(v2));
    if Result > 1 then
      Result := 1;
  end
  else
    Result := 0;
end;

function VectorCrossProductZ(const v1, v2: TVector): Single;
begin
  // 3D Cross with Z = 0
  Result := v1.X * v2.Y - v1.Y * v2.X;
end;

function VectorReflect(const V, N: TVector): TVector;
begin
  Result := VectorAdd(V, VectorScale(N, -2 * VectorDotProduct(V, N)));
end;

function VectorAngle(const V, N: TVector): Single;
begin
  if VectorCrossProductZ(V, N) < 0 then
    Result := RadToDeg(ArcCos(VectorAngleCosine(V, N)))
  else
    Result := -RadToDeg(ArcCos(VectorAngleCosine(V, N)));
end;

function CreateRotationMatrix(const Angle: Single): TMatrix;
var
  cosine, sine: Extended;
begin
  SinCos(Angle, sine, cosine);

  Result.m11 := cosine;
  Result.m12 := sine;
  Result.m13 := 0;
  Result.m21 := -sine;
  Result.m22 := cosine;
  Result.m23 := 0;

  Result.m31 := 0;
  Result.m32 := 0;
  Result.m33 := 1;
end;

function CreateScaleMatrix(const ScaleX, ScaleY: Single): TMatrix;
begin
  Result := IdentityMatrix;
  Result.m11 := ScaleX;
  Result.m22 := ScaleY;
end;

function CreateTranslateMatrix(const DX, DY: Single): TMatrix;
begin
  Result := IdentityMatrix;
  Result.m31 := DX;
  Result.m32 := DY;
end;

function InterpolateSingle(const Start, Stop, t: Single): Single;
begin
  Result := Start + (Stop - Start) * t;
end;

function InterpolateRotation(Start, Stop, t: Single): Single;
begin
  Result := InterpolateSingle(Start, Stop, t);
end;

function InterpolateColor(Start, Stop: TAlphaColor; t: Single): TAlphaColor;
begin
  TAlphaColorRec(Result).A := TAlphaColorRec(Start).A + trunc((TAlphaColorRec(Stop).A - TAlphaColorRec(Start).A) * t);
  TAlphaColorRec(Result).R := TAlphaColorRec(Start).R + trunc((TAlphaColorRec(Stop).R - TAlphaColorRec(Start).R) * t);
  TAlphaColorRec(Result).G := TAlphaColorRec(Start).G + trunc((TAlphaColorRec(Stop).G - TAlphaColorRec(Start).G) * t);
  TAlphaColorRec(Result).B := TAlphaColorRec(Start).B + trunc((TAlphaColorRec(Stop).B - TAlphaColorRec(Start).B) * t);
end;

function AppendColor(Start, Stop: TAlphaColor): TAlphaColor;
begin
  if TAlphaColorRec(Start).A + TAlphaColorRec(Stop).A < $FF then
    TAlphaColorRec(Result).A := TAlphaColorRec(Start).A + TAlphaColorRec(Stop).A
  else
    TAlphaColorRec(Result).A := $FF;
  if TAlphaColorRec(Start).R + TAlphaColorRec(Stop).R < $FF then
    TAlphaColorRec(Result).R := TAlphaColorRec(Start).R + TAlphaColorRec(Stop).R
  else
    TAlphaColorRec(Result).R := $FF;
  if TAlphaColorRec(Start).G + TAlphaColorRec(Stop).G < $FF then
    TAlphaColorRec(Result).G := TAlphaColorRec(Start).G + TAlphaColorRec(Stop).G
  else
    TAlphaColorRec(Result).G := $FF;
  if TAlphaColorRec(Start).B + TAlphaColorRec(Stop).B < $FF then
    TAlphaColorRec(Result).B := TAlphaColorRec(Start).B + TAlphaColorRec(Stop).B
  else
    TAlphaColorRec(Result).B := $FF;
end;

function SubtractColor(Start, Stop: TAlphaColor): TAlphaColor;
begin
  if TAlphaColorRec(Start).A - TAlphaColorRec(Stop).A < $FF then
    TAlphaColorRec(Result).A := TAlphaColorRec(Start).A - TAlphaColorRec(Stop).A
  else
    TAlphaColorRec(Result).A := $FF;
  if TAlphaColorRec(Start).R - TAlphaColorRec(Stop).R < $FF then
    TAlphaColorRec(Result).R := TAlphaColorRec(Start).R - TAlphaColorRec(Stop).R
  else
    TAlphaColorRec(Result).R := $FF;
  if TAlphaColorRec(Start).G - TAlphaColorRec(Stop).G < $FF then
    TAlphaColorRec(Result).G := TAlphaColorRec(Start).G - TAlphaColorRec(Stop).G
  else
    TAlphaColorRec(Result).G := $FF;
  if TAlphaColorRec(Start).B - TAlphaColorRec(Stop).B < $FF then
    TAlphaColorRec(Result).B := TAlphaColorRec(Start).B - TAlphaColorRec(Stop).B
  else
    TAlphaColorRec(Result).B := $FF;
end;

{ Interpolation }

{ interpolations }

function InterpolateBack(t, B, C, D, S: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        if S = 0 then
          S := 1.70158;
        t := t / D;
        Result := C * t * t * ((S + 1) * t - S) + B;
      end;
    TAnimationType.atOut:
      begin
        if S = 0 then
          S := 1.70158;
        t := t / D - 1;
        Result := C * (t * t * ((S + 1) * t + S) + 1) + B;
      end;
    TAnimationType.atInOut:
      begin
        if S = 0 then
          S := 1.70158;
        t := t / (D / 2);
        if t < 1 then
        begin
          S := S * 1.525;
          Result := C / 2 * (t * t * ((S + 1) * t - S)) + B;
        end
        else
        begin
          t := t - 2;
          S := S * 1.525;
          Result := C / 2 * (t * t * ((S + 1) * t + S) + 2) + B;
        end;
      end;
  end;
end;

function InterpolateBounce(t, B, C, D: Single; AType: TAnimationType): Single;
  function _EaseOut(t, B, C, D: Single): Single;
  begin
    t := t / D;
    if t < 1 / 2.75 then
    begin
      Result := C * (7.5625 * t * t) + B;
    end
    else if t < 2 / 2.72 then
    begin
      t := t - (1.5 / 2.75);
      Result := C * (7.5625 * t * t + 0.75) + B;
    end
    else if t < 2.5 / 2.75 then
    begin
      t := t - (2.25 / 2.75);
      Result := C * (7.5625 * t * t + 0.9375) + B;
    end
    else
    begin
      t := t - (2.625 / 2.75);
      Result := C * (7.5625 * t * t + 0.984375) + B;
    end;
  end;
  function _EaseIn(t, B, C, D: Single): Single;
  begin
    Result := C - _EaseOut(D - t, 0, C, D) + B;
  end;

begin
  case AType of
    TAnimationType.atIn:
      begin
        Result := _EaseIn(t, B, C, D);
      end;
    TAnimationType.atOut:
      begin
        Result := _EaseOut(t, B, C, D);
      end;
    TAnimationType.atInOut:
      begin
        if t < D / 2 then
          Result := _EaseIn(t * 2, 0, C, D) * 0.5 + B
        else
          Result := _EaseOut(t * 2 - D, 0, C, D) * 0.5 + C * 0.5 + B;
      end;
  end;
end;

function InterpolateCirc(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        t := t / D;
        Result := -C * (Sqrt(1 - t * t) - 1) + B;
      end;
    TAnimationType.atOut:
      begin
        t := t / D - 1;
        Result := C * Sqrt(1 - t * t) + B;
      end;
    TAnimationType.atInOut:
      begin
        t := t / (D / 2);
        if t < 1 then
          Result := -C / 2 * (Sqrt(1 - t * t) - 1) + B
        else
        begin
          t := t - 2;
          Result := C / 2 * (Sqrt(1 - t * t) + 1) + B;
        end;
      end;
  end;
end;

function InterpolateCubic(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        t := t / D;
        Result := C * t * t * t + B;
      end;
    TAnimationType.atOut:
      begin
        t := t / D - 1;
        Result := C * (t * t * t + 1) + B;
      end;
    TAnimationType.atInOut:
      begin
        t := t / (D / 2);
        if t < 1 then
          Result := C / 2 * t * t * t + B
        else
        begin
          t := t - 2;
          Result := C / 2 * (t * t * t + 2) + B;
        end;
      end;
  end;
end;

function InterpolateElastic(t, B, C, D, A, P: Single; AType: TAnimationType): Single;
var
  S: Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        if t = 0 then
        begin
          Result := B;
          Exit;
        end;
        t := t / D;
        if t = 1 then
        begin
          Result := B + C;
          Exit;
        end;
        if P = 0 then
          P := D * 0.3;
        if (A = 0) or (A < Abs(C)) then
        begin
          A := C;
          S := P / 4;
        end
        else
        begin
          S := P / (2 * Pi) * ArcSin({$IFNDEF FPC}Extended{$ENDIF}(C / A));
        end;
        t := t - 1;
        Result := -(A * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(10 * t)) * Sin((t * D - S) * (2 * Pi) / P)) + B;
      end;
    TAnimationType.atOut:
      begin
        if t = 0 then
        begin
          Result := B;
          Exit;
        end;
        t := t / D;
        if t = 1 then
        begin
          Result := B + C;
          Exit;
        end;
        if P = 0 then
          P := D * 0.3;
        if (A = 0) or (A < Abs(C)) then
        begin
          A := C;
          S := P / 4;
        end
        else
        begin
          S := P / (2 * Pi) * ArcSin({$IFNDEF FPC}Extended{$ENDIF}(C / A));
        end;
        Result := A * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(-10 * t)) * Sin((t * D - S) * (2 * Pi) / P) + C + B;
      end;
    TAnimationType.atInOut:
      begin
        if t = 0 then
        begin
          Result := B;
          Exit;
        end;
        t := t / (D / 2);
        if t = 2 then
        begin
          Result := B + C;
          Exit;
        end;
        if P = 0 then
          P := D * (0.3 * 1.5);
        if (A = 0) or (A < Abs(C)) then
        begin
          A := C;
          S := P / 4;
        end
        else
        begin
          S := P / (2 * Pi) * ArcSin({$IFNDEF FPC}Extended{$ENDIF}(C / A));
        end;

        if t < 1 then
        begin
          t := t - 1;
          Result := -0.5 * (A * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(10 * t)) * Sin((t * D - S) * (2 * Pi) / P)) + B;
        end
        else
        begin
          t := t - 1;
          Result := A * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(-10 * t)) * Sin((t * D - S) * (2 * Pi) / P) * 0.5 + C + B;
        end;
      end;
  end;
end;

function InterpolateExpo(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        If t = 0 Then
          Result := B
        else
          Result := C * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(10 * (t / D - 1))) + B;
      end;
    TAnimationType.atOut:
      begin
        If t = D then
          Result := B + C
        else
          Result := C * (-Power(2, {$IFNDEF FPC}Extended{$ENDIF}(-10 * t / D)) + 1) + B;
      end;
    TAnimationType.atInOut:
      begin
        if t = 0 then
        begin
          Result := B;
          Exit;
        end;
        if t = D then
        begin
          Result := B + C;
          Exit;
        end;
        t := t / (D / 2);
        if t < 1 then
          Result := C / 2 * Power(2, {$IFNDEF FPC}Extended{$ENDIF}(10 * (t - 1))) + B
        else
        begin
          t := t - 1;
          Result := C / 2 * (-Power(2, {$IFNDEF FPC}Extended{$ENDIF}(-10 * t)) + 2) + B;
        end;
      end;
  end;
end;

function InterpolateLinear(t, B, C, D: Single): Single;
begin
  Result := C * t / D + B;
end;

function InterpolateQuad(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        t := t / D;
        Result := C * t * t + B;
      end;
    TAnimationType.atOut:
      begin
        t := t / D;
        Result := -C * t * (t - 2) + B;
      end;
    TAnimationType.atInOut:
      begin
        t := t / (D / 2);

        if t < 1 then
          Result := C / 2 * t * t + B
        else
        begin
          t := t - 1;
          Result := -C / 2 * (t * (t - 2) - 1) + B;
        end;
      end;
  end;
end;

function InterpolateQuart(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        t := t / D;
        Result := C * t * t * t * t + B;
      end;
    TAnimationType.atOut:
      begin
        t := t / D - 1;
        Result := -C * (t * t * t * t - 1) + B;
      end;
    TAnimationType.atInOut:
      begin
        t := t / (D / 2);
        if t < 1 then
          Result := C / 2 * t * t * t * t + B
        else
        begin
          t := t - 2;
          Result := -C / 2 * (t * t * t * t - 2) + B;
        end;
      end;
  end;
end;

function InterpolateQuint(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        t := t / D;
        Result := C * t * t * t * t * t + B;
      end;
    TAnimationType.atOut:
      begin
        t := t / D - 1;
        Result := C * (t * t * t * t * t + 1) + B;
      end;
    TAnimationType.atInOut:
      begin
        t := t / (D / 2);
        if t < 1 then
          Result := C / 2 * t * t * t * t * t + B
        else
        begin
          t := t - 2;
          Result := C / 2 * (t * t * t * t * t + 2) + B;
        end;
      end;
  end;
end;

function InterpolateSine(t, B, C, D: Single; AType: TAnimationType): Single;
begin
  case AType of
    TAnimationType.atIn:
      begin
        Result := -C * Cos(t / D * (Pi / 2)) + C + B;
      end;
    TAnimationType.atOut:
      begin
        Result := C * Sin(t / D * (Pi / 2)) + B;
      end;
    TAnimationType.atInOut:
      begin
        Result := -C / 2 * (Cos(Pi * t / D) - 1) + B;
      end;
  end;
end;

{ Spline }

{
  See: http://en.wikipedia.org/wiki/Cubic_Hermite_spline
}
function KochanekBartelsInterpolate(const Factor: Single; const SplineMatrix: TSplineMatrix;
  const Closed: Boolean = False): Single;
var
  h00, h10, h01, h11: Single;
  LFactor, LFactorSquared, LFactorCubed: Single;
  I, Ip1: Integer;
begin

  I := Trunc(Factor);
  LFactor := Factor - I;

  Ip1 := I + 1;

  if Ip1 >= Length(SplineMatrix) then
    if Closed then
      Ip1 := Ip1 - Length(SplineMatrix)
    else
      Ip1 := Length(SplineMatrix) - 1;

  LFactorSquared := LFactor * LFactor;
  LFactorCubed := LFactorSquared * LFactor;

  h00 := (2 * LFactorCubed) - (3 * LFactorSquared) + 1;
  h10 := LFactorCubed - (2 * LFactorSquared) + LFactor;
  h01 := (-2 * LFactorCubed) + (3 * LFactorSquared);
  h11 := LFactorCubed - LFactorSquared;

  Result := (h00 * SplineMatrix[I][0]) + (h10 * SplineMatrix[I][1]) + (h01 * SplineMatrix[Ip1][0]) + (h11 * SplineMatrix[I][2]);
end;

{
  See: http://en.wikipedia.org/wiki/Kochanek–Bartels_spline
}
procedure CalculateKochanekBartelsTangents(const Tension, Bias, Continuity: Single;
  const SplineMatrix: TSplineMatrix; const Closed: Boolean = False);
var
  I, Im1, Ip1, Ip2, LHigh: Integer;
begin
  LHigh := High(SplineMatrix);
  for I := 0 to LHigh do
  begin
    Im1 := I - 1;
    if Im1 < 0 then
      if Closed then
        Im1 := LHigh
      else
        Im1 := 0;

    Ip1 := I + 1;
    if Ip1 > LHigh then
      if Closed then
        Ip1 := 0
      else
        Ip1 := LHigh;

    Ip2 := I + 2;
    if Ip2 > LHigh then
      if Closed then
        Ip2 := Ip2 - Length(SplineMatrix)
      else
        Ip2 := LHigh;

    SplineMatrix[I][1] := 0.5 * (1 - Tension) * ((1 + Bias) * (1 + Continuity) * (SplineMatrix[I][0] - SplineMatrix[Im1][0])
      + (1 - Bias) * (1 - Continuity) * (SplineMatrix[Ip1][0] - SplineMatrix[I][0]));

    SplineMatrix[I][2] := 0.5 * (1 - Tension) * ((1 + Bias) * (1 - Continuity) * (SplineMatrix[Ip1][0] - SplineMatrix[I][0])
      + (1 - Bias) * (1 + Continuity) * (SplineMatrix[Ip2][0] - SplineMatrix[Ip1][0]));

  end;

end;

constructor TSpline.Create(const Polygon: TPolygon);
var
  I: Integer;
const
  Tension: Single = 0.0;
  Bias: Single = 0.0;
  Continuity: Single = 0.0;
begin
  inherited Create;

  // We don't want to break the interface, so we are going to store data in TSplineMatrix
  //
  // TSplineVector = array [0..3] of Single;
  //
  // Index 0 : Value
  // Index 1 : Tangent i
  // Index 2 : Tangent i+1
  // Index 4 : Unused
  SetLength(matX, Length(Polygon));
  SetLength(matY, Length(Polygon));
  for I := 0 to Length(Polygon) - 1 do
  begin
    matX[I][0] := Polygon[I].X;
    matY[I][0] := Polygon[I].Y;
  end;
  CalculateKochanekBartelsTangents(Tension, Bias, Continuity, matX);
  CalculateKochanekBartelsTangents(Tension, Bias, Continuity, matY);
end;

destructor TSpline.Destroy;
begin
  inherited;
end;

procedure TSpline.SplineXY(const t: Single; var X, Y: Single);
begin
  X := KochanekBartelsInterpolate(t, matX);
  Y := KochanekBartelsInterpolate(t, matY);
end;

{ TBounds }

constructor TBounds.Create(const ADefaultValue: TRectF);
begin
  inherited Create;
  FDefaultValue := ADefaultValue;
  Rect := FDefaultValue;
end;

procedure TBounds.Assign(Source: TPersistent);
begin
  if Source is TBounds then
  begin
    Rect := TBounds(Source).Rect;
  end
  else
    inherited
end;

function TBounds.GetRect: TRectF;
begin
  Result := RectF(FLeft, FTop, FRight, FBottom);
end;

function TBounds.MarginRect(const R: TRectF): TRectF;
begin
  Result := RectF(R.Left + FLeft, R.Top + FTop, R.Right - FRight, R.Bottom - FBottom);
end;

function TBounds.PaddinRect(const R: TRectF): TRectF;
begin
  Result := RectF(R.Left - FLeft, R.Top - FTop, R.Right + FRight, R.Bottom + FBottom);
end;

function TBounds.Width: Single;
begin
  Result := RectWidth(Rect);
end;

function TBounds.Height: Single;
begin
  Result := RectHeight(Rect);
end;

function TBounds.MarginEmpty: Boolean;
begin
  Result := (FLeft = 0) and (FTop = 0) and (FRight = 0) and (FBottom = 0);
end;

function TBounds.Empty: Boolean;
begin
  Result := IsRectEmpty(Rect)
end;

procedure TBounds.SetBottom(const Value: Single);
begin
  if FBottom <> Value then
  begin
    FBottom := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TBounds.SetLeft(const Value: Single);
begin
  if FLeft <> Value then
  begin
    FLeft := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TBounds.SetRight(const Value: Single);
begin
  if FRight <> Value then
  begin
    FRight := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TBounds.SetTop(const Value: Single);
begin
  if FTop <> Value then
  begin
    FTop := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TBounds.SetRect(const Value: TRectF);
begin
  if (FLeft <> Value.Left) or (FTop <> Value.Top) or (FRight <> Value.Right) or (FBottom <> Value.Bottom) then
  begin
    FLeft := Value.Left;
    FTop := Value.Top;
    FRight := Value.Right;
    FBottom := Value.Bottom;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TBounds.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Rect', ReadRect, WriteRect, (FLeft <> DefaultValue.Left) or (FTop <> DefaultValue.Top) or
    (FRight <> DefaultValue.Right) or (FBottom <> DefaultValue.Bottom));
end;

procedure TBounds.ReadRect(Reader: TReader);
begin
  Rect := StringToRect(Reader.ReadString);
end;

procedure TBounds.WriteRect(Writer: TWriter);
begin
  Writer.WriteString(RectToString(Rect));
end;

{ TPosition }

constructor TPosition.Create(const ADefaultValue: TPointF);
begin
  inherited Create;
  FDefaultValue := ADefaultValue;
  FX := FDefaultValue.X;
  FY := FDefaultValue.Y;
end;

procedure TPosition.Assign(Source: TPersistent);
begin
  if Source is TPosition then
  begin
    Point := TPosition(Source).Point;
  end
  else
    inherited
end;

function TPosition.Empty: Boolean;
begin
  Result := (FX = 0) and (FY = 0);
end;

procedure TPosition.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Point', ReadPoint, WritePoint, (FX <> DefaultValue.X) or (FY <> DefaultValue.Y));
end;

procedure TPosition.ReadPoint(Reader: TReader);
begin
  Point := StringToPoint(Reader.ReadString);
end;

procedure TPosition.WritePoint(Writer: TWriter);
begin
  Writer.WriteString(PointToString(Point));
end;

function TPosition.GetPoint: TPointF;
begin
  Result := PointF(FX, FY);
end;

procedure TPosition.SetPoint(const Value: TPointF);
begin
  FX := Value.X;
  FY := Value.Y;
  if Assigned(OnChange) then
    OnChange(Self);
end;

procedure TPosition.SetX(const Value: Single);
begin
  if FX <> Value then
  begin
    FX := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TPosition.SetY(const Value: Single);
begin
  if FY <> Value then
  begin
    FY := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

{ TTransform }

constructor TTransform.Create;
begin
  inherited;
  FMatrix := IdentityMatrix;
  FPosition := TPosition.Create(PointF(0, 0));
  FPosition.OnChange := MatrixChanged;
  FScale := TPosition.Create(PointF(1, 1));
  FScale.OnChange := MatrixChanged;
  FSkew := TPosition.Create(PointF(0, 0));
  FSkew.OnChange := MatrixChanged;
  FRotationCenter := TPosition.Create(PointF(0.5, 0.5));
  FRotationCenter.OnChange := MatrixChanged;
end;

destructor TTransform.Destroy;
begin
  FRotationCenter.Free;
  FScale.Free;
  FSkew.Free;
  FPosition.Free;
  inherited;
end;

procedure TTransform.Assign(Source: TPersistent);
begin
  if Source is TTransform then
  begin
    FPosition.FX := TTransform(Source).Position.FX;
    FPosition.FY := TTransform(Source).Position.FY;
    FScale.FX := TTransform(Source).Scale.FX;
    FScale.FY := TTransform(Source).Scale.FY;
    FSkew.FX := TTransform(Source).Skew.FX;
    FSkew.FY := TTransform(Source).Skew.FY;
    FRotationCenter.FX := TTransform(Source).RotationCenter.FX;
    FRotationCenter.FY := TTransform(Source).RotationCenter.FY;
    MatrixChanged(Self);
  end
  else
    inherited
end;

procedure TTransform.MatrixChanged(Sender: TObject);
begin
  FMatrix := IdentityMatrix;
  FMatrix.m31 := FPosition.X;
  FMatrix.m32 := FPosition.Y;
  FMatrix.m13 := FSkew.X;
  FMatrix.m23 := FSkew.Y;
  FMatrix.m11 := FScale.X;
  FMatrix.m22 := FScale.Y;
  if FRotationAngle <> 0 then
  begin
    { M1 := IdentityMatrix;
      M1.m31 := -FRotationCenter.X * FWidth;
      M1.m32 := -FRotationCenter.Y * FHeight;
      M2 := IdentityMatrix;
      M2.m31 := FRotationCenter.X * FWidth;
      M2.m32 := FRotationCenter.Y * FHeight;
      RotMatrix := MatrixMultiply(M1, MatrixMultiply(CreateRotationMatrix(DegToRad(FRotationAngle)), M2));
      FMatrix := MatrixMultiply(RotMatrix, FMatrix); }
    FMatrix := MatrixMultiply(CreateRotationMatrix(DegToRad(FRotationAngle)), FMatrix);
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TTransform.SetRotationAngle(const Value: Single);
begin
  if FRotationAngle <> Value then
  begin
    FRotationAngle := Value;
  end;
end;

{ TBrushGrab }

constructor TBrushGrab.Create;
begin
  inherited;
end;

procedure TBrushGrab.Assign(Source: TPersistent);
begin
  if Source is TBrushGrab then
  begin
    Control := TBrushGrab(Source).Control;
  end
  else
    inherited;
end;

destructor TBrushGrab.Destroy;
begin
  if FControl <> nil then
  begin
    FControl.RemoveFreeNotify(Self);
    FControl := nil;
  end;
  inherited;
end;

procedure TBrushGrab.FreeNotification(AObject: TObject);
begin
  if AObject = Control then
    FControl := nil;
end;

procedure TBrushGrab.SetControl(const Value: TControl);
begin
  if FControl <> Value then
  begin
    if FControl <> nil then
      FControl.RemoveFreeNotify(Self);
    FControl := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
    if FControl <> nil then
      FControl.AddFreeNotify(Self);
  end;
end;

function TPosition.GetVector: TVector;
begin
  Result := FMX_Types.Vector(FX, FY);
end;

procedure TPosition.SetVector(const Value: TVector);
begin
  Point := PointF(Value.X, Value.Y);
end;

procedure TPosition.Reflect(const Normal: TVector);
begin
  Vector := VectorReflect(Vector, Normal);
end;

{ TGradientPoint }

procedure TGradientPoint.Assign(Source: TPersistent);
begin
  if Source is TGradientPoint then
  begin
    FColor := TGradientPoint(Source).FColor;
    FOffset := TGradientPoint(Source).FOffset;
  end
  else
    inherited;
end;

function TGradientPoint.GetColor: TAlphaColor;
begin
  Result := FColor;
end;

procedure TGradientPoint.SetColor(const Value: TAlphaColor);
begin
  FColor := Value;
end;

{ TGradientPoints }

function TGradientPoints.GetPoint(Index: Integer): TGradientPoint;
begin
  Result := TGradientPoint(Items[Index]);
end;

{ TGradient }

constructor TGradient.Create;
begin
  inherited;
  FStartPosition := TPosition.Create(PointF(0, 0));
  FStartPosition.OnChange := PositionChanged;
  FStopPosition := TPosition.Create(PointF(0, 1));
  FStopPosition.OnChange := PositionChanged;
  FRadialTransform := TTransform.Create;
  FRadialTransform.OnChanged := PositionChanged;
  FPoints := TGradientPoints.Create(TGradientPoint);
  with TGradientPoint(FPoints.Add) do
  begin
    IntColor := $FF000000;
  end;
  with TGradientPoint(FPoints.Add) do
  begin
    IntColor := $FFFFFFFF;
    Offset := 1;
  end;
end;

procedure TGradient.Assign(Source: TPersistent);
var
  SaveChanged: TNotifyEvent;
begin
  if Source is TGradient then
  begin
    SaveChanged := FOnChanged;
    FOnChanged := nil;
    FPoints.Clear;
    FPoints.Assign(TGradient(Source).FPoints);
    FStyle := TGradient(Source).Style;
    if FStyle = TGradientStyle.gsLinear then
    begin
      FStopPosition.Assign(TGradient(Source).StopPosition);
      FStartPosition.Assign(TGradient(Source).StartPosition);
    end
    else
    begin
      FRadialTransform.Assign(TGradient(Source).RadialTransform);
    end;
    FOnChanged := SaveChanged;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited;
end;

destructor TGradient.Destroy;
begin
  FStartPosition.Free;
  FStopPosition.Free;
  FRadialTransform.Free;
  FPoints.Free;
  inherited;
end;

procedure TGradient.Change;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TGradient.InterpolateColor(Offset: Single): TAlphaColor;
var
  I: Integer;
begin
  if FPoints.Count > 1 then
  begin
    if Offset < 0 then
      Offset := 0;
    if Offset > 1 then
      Offset := 1;
    if Offset < FPoints[0].Offset then
    begin
      Result := Points[0].IntColor;
      Exit;
    end;
    if Offset > FPoints[FPoints.Count - 1].Offset then
    begin
      Result := FPoints[FPoints.Count - 1].IntColor;
      Exit;
    end;
    for I := 0 to FPoints.Count - 2 do
    begin
      if (Offset < Points[I].Offset) then
        Continue;
      if Points[I + 1].Offset - Points[I].Offset <= 0 then
        Result := Points[I].IntColor
      else if (I = FPoints.Count - 2) and (Offset > Points[Points.Count - 1].Offset) then // last
        Result := Points[Points.Count - 1].IntColor
      else
        Result := FMX_Types.InterpolateColor(Points[I].IntColor, Points[I + 1].IntColor,
          (Offset - Points[I].Offset) / (Points[I + 1].Offset - Points[I].Offset));
    end;
  end
  else
    Result := 0;
end;

procedure TGradient.PositionChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TGradient.IsLinearStored: Boolean;
begin
  Result := FStyle = TGradientStyle.gsLinear;
end;

function TGradient.IsRadialStored: Boolean;
begin
  Result := FStyle = TGradientStyle.gsRadial;
end;

procedure TGradient.SetRadialTransform(const Value: TTransform);
begin
  FRadialTransform.Assign(Value);
end;

procedure TGradient.SetStartPosition(const Value: TPosition);
begin
  FStartPosition.Assign(Value);
end;

procedure TGradient.SetStopPosition(const Value: TPosition);
begin
  FStopPosition.Assign(Value);
end;

procedure TGradient.SetColor(const Value: TAlphaColor);
begin
  if (FPoints.Count > 0) and (Points[0].Color <> Value) then
  begin
    Points[0].Color := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TGradient.SetColor1(const Value: TAlphaColor);
begin
  if (FPoints.Count > 1) and (Points[1].Color <> Value) then
  begin
    Points[1].Color := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TGradient.SetStyle(const Value: TGradientStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TBrushResource }

destructor TBrushResource.Destroy;
begin
  if FStyleResource <> nil then
  begin
    FStyleResource.RemoveFreeNotify(Self);
    FStyleResource := nil;
  end;
  inherited;
end;

procedure TBrushResource.FreeNotification(AObject: TObject);
begin
  if AObject = FStyleResource then
    FStyleResource := nil;
end;

procedure TBrushResource.Assign(Source: TPersistent);
begin
  if Source is TBrushResource then
  begin
    StyleResource := TBrushResource(Source).StyleResource;
    FStyleLookup := TBrushResource(Source).StyleLookup;
  end
  else
    inherited;
end;

procedure TBrushResource.SetStyleResource(const Value: TBrushObject);
begin
  if FStyleResource <> Value then
  begin
    if FStyleResource <> nil then
      FStyleResource.RemoveFreeNotify(Self);
    FStyleResource := Value;
    if FStyleResource <> nil then
    begin
      FStyleLookup := FStyleResource.StyleName;
      FStyleResource.AddFreeNotify(Self);
    end;
  end;
end;

function TBrushResource.GetStyleLookup: WideString;
begin
  Result := FStyleLookup;
end;

procedure TBrushResource.SetStyleLookup(const Value: WideString);
begin
  if Value <> FStyleLookup then
  begin
    FStyleLookup := Value;
  end;
end;

function TBrushResource.GetBrush: TBrush;
var
  O: TFmxObject;
begin
  Result := nil;
  if FStyleResource <> nil then
  begin
    Result := TBrushObject(FStyleResource).Brush;
  end
  else if FStyleLookup <> '' then
  begin
    O := FindStyleResource(FStyleLookup);
    if O is TBrushObject then
      StyleResource := TBrushObject(O);
    if FStyleResource <> nil then
      Result := TBrushObject(FStyleResource).Brush;
  end;
end;

{ TBrushBitmap }

constructor TBrushBitmap.Create;
begin
  inherited Create;
  FBitmap := TBitmap.Create(0, 0);
end;

destructor TBrushBitmap.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TBrushBitmap.DoChanged;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TBrushBitmap.Assign(Source: TPersistent);
begin
  if Source is TBrushBitmap then
  begin
    FWrapMode := TBrushBitmap(Source).FWrapMode;
    FBitmap.Assign(TBrushBitmap(Source).FBitmap);
    DoChanged;
  end
  else
    inherited;
end;

procedure TBrushBitmap.SetWrapMode(const Value: TWrapMode);
begin
  if FWrapMode <> Value then
  begin
    FWrapMode := Value;
    DoChanged;
  end;
end;

procedure TBrushBitmap.SetBitmap(Value: TBitmap);
begin
  FBitmap.Assign(Value);
  DoChanged;
end;

{ TBrush }

constructor TBrush.Create;
begin
  inherited Create;
  FDefaultKind := ADefaultKind;
  FDefaultColor := ADefaultColor;
  FColor := ADefaultColor;
  FKind := FDefaultKind;
  FGradient := TGradient.Create;
  FGradient.OnChanged := GradientChanged;
  FGrab := TBrushGrab.Create;
  FGrab.OnChanged := GrabChanged;
  FResource := TBrushResource.Create;
  FResource.OnChanged := ResourceChanged;
  FBitmap := TBrushBitmap.Create;
  FBitmap.OnChanged := BitmapChanged;
  FBitmap.Bitmap.OnChange := BitmapChanged;
end;

destructor TBrush.Destroy;
begin
  FBitmap.Free;
  FGrab.Free;
  FResource.Free;
  FGradient.Free;
  inherited;
end;

procedure TBrush.Assign(Source: TPersistent);
var
  SaveChange: TNotifyEvent;
begin
  if Source is TBrush then
  begin
    SaveChange := FOnChanged;
    FOnChanged := nil;
    FDefaultKind := (Source as TBrush).FDefaultKind;
    FDefaultColor := (Source as TBrush).FDefaultColor;
    FColor := (Source as TBrush).Color;
    FKind := (Source as TBrush).Kind;
    case FKind of
      TBrushKind.bkGradient:
        FGradient.Assign((Source as TBrush).Gradient);
      TBrushKind.bkResource:
        FResource.Assign((Source as TBrush).Resource);
      TBrushKind.bkGrab:
        FGrab.Assign((Source as TBrush).Grab);
      TBrushKind.bkBitmap:
        FBitmap.Assign((Source as TBrush).Bitmap);
    end;
    FOnChanged := SaveChange;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited;
end;

procedure TBrush.GradientChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  if Assigned(FOnGradientChanged) then
    FOnGradientChanged(Self);
end;

procedure TBrush.GrabChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TBrush.ResourceChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TBrush.BitmapChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TBrush.IsBitmapStored: Boolean;
begin
  Result := (FKind = TBrushKind.bkBitmap);
end;

function TBrush.IsColorStored: Boolean;
begin
  Result := (FKind = TBrushKind.bkSolid) and (FColor <> FDefaultColor);
end;

function TBrush.IsGradientStored: Boolean;
begin
  Result := FKind = TBrushKind.bkGradient;
end;

function TBrush.IsKindStored: Boolean;
begin
  Result := FKind <> FDefaultKind;
end;

function TBrush.IsGrabStored: Boolean;
begin
  Result := FKind = TBrushKind.bkGrab;
end;

function TBrush.IsResourceStored: Boolean;
begin
  Result := FKind = TBrushKind.bkResource;
end;

procedure TBrush.SetResource(const Value: TBrushResource);
begin
  FResource := Value;
end;

procedure TBrush.SetGradient(const Value: TGradient);
begin
  FGradient.Assign(Value);
end;

procedure TBrush.SetGrab(const Value: TBrushGrab);
begin
  FGrab := Value;
end;

function TBrush.GetColor: TAlphaColor;
begin
  Result := FColor;
end;

procedure TBrush.SetColor(const Value: TAlphaColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    if FKind = TBrushKind.bkGradient then
      FGradient.Color := Value
    else if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TBrush.SetKind(const Value: TBrushKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TFont }

constructor TFont.Create;
begin
  inherited;
  FSize := 11;
  FFamily := Platform.GetDefaultFontFamilyName;
end;

destructor TFont.Destroy;
begin
  inherited;
end;

procedure TFont.Assign(Source: TPersistent);
begin
  if Source is TFont then
  begin
    FFamily := (Source as TFont).Family;
    FSize := (Source as TFont).Size;
    FStyle := (Source as TFont).Style;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited;
end;

procedure TFont.AssignTo(Dest: TPersistent);
begin
  inherited;
end;

function TFont.IsSizeStored: Boolean;
begin
  Result := FSize <> 11;
end;

function TFont.IsFamilyStored: Boolean;
begin
  Result := FFamily <> Platform.GetDefaultFontFamilyName;
end;

procedure TFont.SetFamily(const Value: TFontName);
begin
  if FFamily <> Value then
  begin
    FFamily := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TFont.SetSize(const Value: Single);
begin
  if FSize <> Value then
  begin
    FSize := Value;
    if FSize < 1 then
      FSize := 1;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TFont.SetStyle(const Value: TFontStyles);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

class function TBitmapCodec.GetDefaultBitmapCodec(C: TBitmapCodecClass): TBitmapCodec;
begin
  Result := C.Create;
end;

class function TBitmapCodec.GetFileTypes: WideString;
begin
  Result := '';
end;

class function TBitmapCodec.GetImageSize(const AFileName: WideString): TPointF;
begin
  Result := PointF(0, 0);
end;

{ TBitmap }

constructor TBitmap.Create(const AWidth, AHeight: Integer);
begin
  inherited Create;
  FWidth := AWidth;
  FHeight := AHeight;
  Recreate;
end;

constructor TBitmap.CreateFromStream(const AStream: TStream);
begin
  Create(0, 0);
  LoadFromStream(AStream);
end;

constructor TBitmap.CreateFromFile(const AFileName: WideString);
begin
  Create(0, 0);
  LoadFromFile(AFileName);
end;

constructor TBitmap.CreateFromBitmapAndMask(const Bitmap, Mask: TBitmap);
var
  I: Integer;
begin
  Create(Bitmap.Width, Bitmap.Height);
  if (Bitmap.Width <> Mask.Width) or (Bitmap.Height <> Mask.Height) then
    Exit;
  for I := 0 to FHeight * FWidth - 1 do
  begin
    PAlphaColorRecArray(FBits)[I] := PAlphaColorRecArray(Bitmap.FBits)[I];
    PAlphaColorRecArray(FBits)[I].A := PAlphaColorRecArray(Mask.FBits)[I].R;
  end;
end;

destructor TBitmap.Destroy;
var
  I: Integer;
begin
  if FNotifyList <> nil then
  begin
    for I := FNotifyList.Count - 1 downto 0 do
      IFreeNotification(FNotifyList[I]).FreeNotification(Self);
    FreeAndNil(FNotifyList);
  end;
  if FResource <> nil then
  begin
    if FResource <> nil then
    begin
      if FResource is TBitmapObject then
        TBitmapObject(FResource).RemoveFreeNotify(Self);
      if FResource is TImage then
        TImage(FResource).RemoveFreeNotify(Self);
    end;
    FResource := nil;
  end;
  FreeAndNil(FCanvas);
  if FBits <> nil then
    FreeMem(FBits, FWidth * FHeight * SizeOf(TAlphaColor));
  inherited;
end;

procedure TBitmap.UpdateHandles;
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    FHandles[I].NeedUpdate := True;
end;

procedure TBitmap.AddFreeNotify(const AObject: IFreeNotification);
begin
  if FNotifyList = nil then
    FNotifyList := TList.Create;
  FNotifyList.Add(Pointer(AObject));
end;

procedure TBitmap.RemoveFreeNotify(const AObject: IFreeNotification);
begin
  if FNotifyList <> nil then
    FNotifyList.Remove(Pointer(AObject));
end;

function TBitmap.GetStyleLookup: WideString;
begin
  Result := FStyleLookup;
end;

procedure TBitmap.SetStyleLookup(const Value: WideString);
begin
  if Value <> FStyleLookup then
  begin
    if FResource <> nil then
    begin
      if FResource <> nil then
      begin
        if FResource is TBitmapObject then
          TBitmapObject(FResource).RemoveFreeNotify(Self);
        if FResource is TImage then
          TImage(FResource).RemoveFreeNotify(Self);
      end;
      FResource := nil;
    end;
    FStyleLookup := Value;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

function TBitmap.GetBitmap: TBitmap;
var
  FN: IFreeNotification;
begin
  Result := nil;
  if FResource <> nil then
  begin
    if FResource is TBitmapObject then
      Result := TBitmapObject(FResource).Bitmap
    else
    if FResource is TImage then
      Result := TImage(FResource).Bitmap
  end
  else
  if FStyleLookup <> '' then
  begin
    FResource := FindStyleResource(FStyleLookup);
    if FResource is TBitmapObject then
    begin
      TBitmapObject(FResource).AddFreeNotify(Self);
      Result := TBitmapObject(FResource).Bitmap;
    end
    else
    if FResource is TImage then
    begin
      TImage(FResource).AddFreeNotify(Self);
      Result := TImage(FResource).Bitmap;
    end;
  end;
end;

procedure TBitmap.SetSize(const AWidth, AHeight: Integer);
begin
  if (FWidth <> AWidth) or (FHeight <> AHeight) then
  begin
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth < 0 then FWidth := 0;
    if FHeight < 0 then FHeight := 0;
    Recreate;
    BitmapChanged;
  end;
end;

procedure TBitmap.Recreate;
var
  I: Integer;
begin
  if FNotifyList <> nil then
  begin
    for I := FNotifyList.Count - 1 downto 0 do
      IFreeNotification(FNotifyList[I]).FreeNotification(Self);
    FreeAndNil(FNotifyList);
  end;

  FreeAndNil(FCanvas);
  FCanvas := nil;
  if FBits <> nil then
    FreeMem(FBits);
  FBits := nil;

  if not IsEmpty then
  begin
    GetMem(FBits, FWidth * FHeight * SizeOf(TAlphaColor));
    FillChar(FBits^, FWidth * FHeight * 4, 0);
  end;
  UpdateHandles;
end;

procedure TBitmap.Clear(const AColor: TAlphaColor);
begin
  if FBits <> nil then
  begin
    FillLongword(FBits, FWidth * FHeight, PremultiplyAlpha(CorrectColor(AColor)));
    UpdateHandles;
    BitmapChanged;
  end;
end;

procedure TBitmap.ClearRect(const ARect: TRectF; const AColor: TAlphaColor);
var
  R: TRectF;
begin
  if FBits <> nil then
  begin
    R := ARect;
    if R.Left < 0 then
      R.Left := 0;
    if R.Top < 0 then
      R.Top := 0;
    if R.Right > FWidth then
      R.Right := FWidth;
    if R.Bottom > FHeight then
      R.Bottom := FHeight;
    if R.Bottom < R.Top then
      R.Bottom := R.Top;
    if R.Right < R.Left then
      R.Right := R.Left;
    if (R.Right < 0) or (R.Top < 0) or (R.Left > FWidth) or (R.Top > FHeight) then
      Exit;
    FillLongwordRect(FBits, FWidth, FHeight, trunc(R.Left), trunc(R.Top), trunc(R.Right), trunc(R.Bottom),
      PremultiplyAlpha(AColor));
    UpdateHandles;
  end;
end;

function TBitmap.GetPixels(X, Y: Integer): TAlphaColor;
begin
  if (X >= 0) and (Y >= 0) and (X < FWidth) and (Y < FHeight) and (FBits <> nil) then
    Result := FBits[X + (Y * FWidth)]
  else
    Result := 0;
end;

procedure TBitmap.SetPixels(X, Y: Integer; const Value: TAlphaColor);
begin
  if (X >= 0) and (Y >= 0) and (X < FWidth) and (Y < FHeight) and (FBits <> nil) then
  begin
    FBits[X + (Y * FWidth)] := Value;
    UpdateHandles;
  end;
end;

procedure TBitmap.BitmapChanged;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TBitmap.IsEmpty: Boolean;
begin
  Result := FWidth * FHeight = 0;
end;

procedure TBitmap.Assign(Source: TPersistent);
begin
  if Source is TBitmap then
  begin
    if TBitmap(Source).ResourceBitmap <> nil then
    begin
      FStyleLookup := TBitmap(Source).FStyleLookup;
      BitmapChanged;
    end else
    begin
      FResource := nil;
      FStyleLookup := '';
      SetSize(TBitmap(Source).Width, TBitmap(Source).Height);
      Move(TBitmap(Source).FBits^, FBits^, Width * Height * 4);
      UpdateHandles;
      BitmapChanged;
    end;
  end else
    inherited;
end;

procedure TBitmap.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('PNG', ReadBitmap, WriteBitmap, FWidth * FHeight > 0);
end;

procedure TBitmap.ReadBitmap(Stream: TStream);
begin
  LoadFromStream(Stream);
end;

procedure TBitmap.WriteBitmap(Stream: TStream);
begin
  SaveToStream(Stream);
end;

procedure TBitmap.Rotate(const Angle: Single);
var
  temp: TBitmap;
  M, M2: TMatrix;
  Pts: array [1 .. 4] of TPointF;
  R: TRectF;
begin
  if Angle = 0 then
    Exit;

  M := IdentityMatrix;
  M.m31 := -FWidth / 2;
  M.m32 := -FHeight / 2;
  M := MatrixMultiply(M, CreateRotationMatrix(DegToRad(Angle)));
  { calc new size }
  Pts[1] := Point(VectorTransform(Vector(0, 0), M));
  Pts[2] := Point(VectorTransform(Vector(FWidth, 0), M));
  Pts[3] := Point(VectorTransform(Vector(FWidth, FHeight), M));
  Pts[4] := Point(VectorTransform(Vector(0, FHeight), M));
  R := NormalizeRectF(Pts);
  { translate }
  M2 := IdentityMatrix;
  M2.m31 := RectWidth(R) / 2;
  M2.m32 := RectHeight(R) / 2;
  M := MatrixMultiply(M, M2);
  { rotate }
  temp := TBitmap.Create(trunc(RectWidth(R)), trunc(RectHeight(R)));
  if temp.Canvas.BeginScene then
  try
    temp.Canvas.Clear(0);
    temp.Canvas.SetMatrix(M);
    temp.Canvas.DrawBitmap(Self, RectF(0, 0, FWidth, FHeight), RectF(0, 0, FWidth, FHeight), 1);
  finally
    temp.Canvas.EndScene;
  end;
  Assign(temp);
  temp.Free;
end;

procedure TBitmap.FlipHorizontal;
var
  I, J: Integer;
  tmp: TAlphaColor;
begin
  for j := 0 to Height - 1 do
    for I := 0 to (Width - 1) div 2 do
    begin
      tmp := Scanline[j][Width - 1 - I];
      Scanline[j][Width - 1 - I] := Scanline[j][I];
      Scanline[j][I] := tmp;
    end;
  UpdateHandles;
  BitmapChanged;
end;

procedure TBitmap.FlipVertical;
var
  I: Integer;
  tmp: PAlphaColorArray;
begin
  GetMem(tmp, Width * 4);
  for I := 0 to (Height - 1) div 2 do
  begin
    System.Move(Scanline[Height - 1 - I][0], tmp[0], Width * 4);
    System.Move(Scanline[I][0], Scanline[Height - 1 - I][0], Width * 4);
    System.Move(tmp[0], Scanline[I][0], Width * 4);
  end;
  UpdateHandles;
  BitmapChanged;
  FreeMem(tmp, Width * 4);
end;

procedure TBitmap.FreeNotification(AObject: TObject);
begin
  if FResource = AObject then
    FResource := nil;
end;

procedure TBitmap.InvertAlpha;
var
  I, j: Integer;
  Bits: PAlphaColorRecArray;
begin
  Bits := PAlphaColorRecArray(StartLine);
  for j := 0 to Height - 1 do
    for I := 0 to Width - 1 do
    begin
      Bits[I + (j * Width)].Color := UnpremultiplyAlpha(Bits[I + (j * Width)].Color);
      TAlphaColorRec(Bits[(I) + ((j) * Width)]).A := $FF - TAlphaColorRec(Bits[(I) + ((j) * Width)]).A;
      Bits[I + (j * Width)].Color := PremultiplyAlpha(Bits[I + (j * Width)].Color);
    end;
  UpdateHandles;
  BitmapChanged;
end;

procedure TBitmap.FillColor(const Color: TAlphaColor);
var
  Bits: PAlphaColorRecArray;
  I, j: Integer;
  A: Byte;
begin
  Bits := PAlphaColorRecArray(StartLine);
  for j := 0 to Height - 1 do
  begin
    for I := 0 to Width - 1 do
    begin
{$IFDEF FPC_BIG_ENDIAN}
      A := TColorRec(Bits[(I) + ((j) * Width)]).Color and $FF;
{$ELSE}
      A := TAlphaColorRec(Bits[(I) + ((j) * Width)]).A;
{$ENDIF}
      if A > 0 then
      begin
        Bits[(I) + ((j) * Width)].Color := PremultiplyAlpha(MakeColor(Color, A / $FF));
{$IFDEF FPC_BIG_ENDIAN}
        ReverseBytes(@Bits[(I) + ((j) * Width)].Color, 4);
{$ENDIF}
      end;
    end
  end;
  if Assigned(FOnChange) then
    FOnChange(Self);
  UpdateHandles;
end;

function TBitmap.CreateMask: PByteArray;
var
  A: Byte;
  Bits: PAlphaColorRecArray;
  I, j: Integer;
begin
  GetMem(Result, Width * Height);
  FillChar(Result^, Width * Height, 0);
  Bits := PAlphaColorRecArray(StartLine);
  for j := 0 to Height - 1 do
  begin
    for I := 0 to Width - 1 do
    begin
{$IFDEF FPC_BIG_ENDIAN}
      A := TColorRec(Bits[(I) + ((j) * Width)]).Color and $FF;
{$ELSE}
      A := TAlphaColorRec(Bits[(I) + ((j) * Width)]).A;
{$ENDIF}
      if A > 0 then
      begin
        Result[I + (j * Width)] := A;
      end;
    end
  end;
end;

procedure TBitmap.ApplyMask(const Mask: PByteArray; const DstX: Integer = 0; const DstY: Integer = 0);
var
  Bits: PAlphaColorRecArray;
  I, j: Integer;
begin
  Bits := PAlphaColorRecArray(StartLine);
  for j := 0 to Height - 1 do
  begin
    for I := 0 to Width - 1 do
    begin
      if (I - DstX < 0) or (I - DstX > Width - 1) or (j - DstY < 0) or (j - DstY > Height - 1) then
        Continue;

      if Mask[I - DstX + ((j - DstY) * Width)] > 0 then
      begin
        Bits[I + (j * Width)].Color := PremultiplyAlpha(MakeColor(UnpremultiplyAlpha(Bits[I + (j * Width)].Color),
          ($FF - Mask[I - DstX + ((j - DstY) * Width)]) / $FF))
      end;
{$IFDEF FPC_BIG_ENDIAN}
      ReverseBytes(@Bits[(I) + ((j) * Width)].Color, 4);
{$ENDIF}
    end
  end;
  if Assigned(FOnChange) then
    FOnChange(Self);
  UpdateHandles;
end;

function TBitmap.CreateThumbnail(const Width, Height: Integer): TBitmap;
begin
  Result := TBitmap.Create(Width, Height);
  if Result.Canvas.BeginScene then
  try
    Result.Canvas.DrawThumbnail(Self, Width, Height);
  finally
    Result.Canvas.EndScene;
  end;
end;

procedure TBitmap.LoadFromFile(const AFileName: WideString; const Rotate: Single = 0);
var
  Filter: TBitmapCodec;
begin
  if not FileExists(AFileName) then
    Exit;
  Filter := DefaultBitmapCodecClass.Create;
  if Filter.LoadFromFile(AFileName, Rotate, Self) then
  begin
    UpdateHandles;
    BitmapChanged;
  end;
  Filter.Free;
end;

procedure TBitmap.LoadThumbnailFromFile(const AFileName: WideString; const AFitWidth, AFitHeight: Single;
  const UseEmbedded: Boolean = True);
var
  Filter: TBitmapCodec;
begin
  Filter := DefaultBitmapCodecClass.Create;
  if Filter.LoadThumbnailFromFile(AFileName, AFitWidth, AFitHeight, UseEmbedded, Self) then
  begin
    UpdateHandles;
    BitmapChanged;
  end;
  Filter.Free;
end;

procedure TBitmap.SaveToFile(const AFileName: WideString; const Params: WideString = '');
var
  Filter: TBitmapCodec;
begin
  Filter := DefaultBitmapCodecClass.Create;
  Filter.SaveToFile(AFileName, Self, Params);
  Filter.Free;
end;

procedure TBitmap.LoadFromStream(Stream: TStream);
var
  Filter: TBitmapCodec;
  S: TStream;
begin
  if Stream.Position > 0 then
  begin
    // need to create temp stream
    S := TMemoryStream.Create;
    S.CopyFrom(Stream, Stream.Size - Stream.Position);
    S.Position := 0;
    Filter := DefaultBitmapCodecClass.Create;
    if Filter.LoadFromStream(S, Self) then
    begin
      UpdateHandles;
      BitmapChanged;
    end;
    Filter.Free;
    S.Free;
  end
  else
    if Stream.Size = 0 then
      Clear(0)
    else
    begin
      Filter := DefaultBitmapCodecClass.Create;
      if Filter.LoadFromStream(Stream, Self) then
      begin
        UpdateHandles;
        BitmapChanged;
      end;
      Filter.Free;
    end;
end;

procedure TBitmap.SaveToStream(Stream: TStream);
var
  Filter: TBitmapCodec;
begin
  Filter := DefaultBitmapCodecClass.Create;
  Filter.SaveToStream(Stream, Self, 'png');
  Filter.Free;
end;

procedure TBitmap.SetHeight(const Value: Integer);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    Recreate;
    BitmapChanged;
  end;
end;

procedure TBitmap.SetWidth(const Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Recreate;
    BitmapChanged;
  end;
end;

function TBitmap.GetCanvas: TCanvas;
begin
  if FCanvas = nil then
  begin
    FCanvas := DefaultCanvasClass.CreateFromBitmap(Self);
    FCanvas.SetMatrix(IdentityMatrix);
  end;
  Result := FCanvas;
end;

function TBitmap.HandleExists(AItem: Pointer): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

procedure TBitmap.HandleAdd(AItem: Pointer);
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
      Exit;
  SetLength(FHandles, Length(FHandles) + 1);
  FHandles[High(FHandles)].Item := AItem;
  FHandles[High(FHandles)].Data := nil;
  FHandles[High(FHandles)].NeedUpdate := False;
end;

procedure TBitmap.HandleRemove(AItem: Pointer);
var
  I, j: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
      Break;
  if I < Length(FHandles) then
  begin
    for j := I to High(FHandles) - 1 do
      FHandles[j] := FHandles[j + 1];
    SetLength(FHandles, Length(FHandles) - 1);
  end;
end;

function TBitmap.GetHandle(AItem: Pointer): Pointer;
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
    begin
      Result := FHandles[I].Data;
      Exit;
    end;
  Result := nil;
end;

procedure TBitmap.SetHandle(AItem: Pointer; const Value: Pointer);
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
    begin
      FHandles[I].Data := Value;
      Exit;
    end;
end;

function TBitmap.GetNeedUpdate(AItem: Pointer): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
    begin
      Result := FHandles[I].NeedUpdate;
      Exit;
    end;
  Result := False;
end;

procedure TBitmap.SetNeedUpdate(AItem: Pointer; const Value: Boolean);
var
  I: Integer;
begin
  for I := 0 to High(FHandles) do
    if FHandles[I].Item = AItem then
    begin
      FHandles[I].NeedUpdate := Value;
      Exit;
    end;
end;

function TBitmap.GetScanline(Y: Integer): PAlphaColorArray;
begin
  Result := DefaultCanvasClass.GetBitmapScanline(Self, Y);
end;

{ TPath }

constructor TPathData.Create;
begin
  inherited Create;
  FRecalcBounds := True;
end;

destructor TPathData.Destroy;
begin
  if FStyleResource <> nil then
  begin
    FStyleResource.RemoveFreeNotify(Self);
    FStyleResource := nil;
  end;
  inherited;
end;

procedure TPathData.Assign(Source: TPersistent);
begin
  if Source is TPathData then
  begin
    if TPathData(Source).ResourcePath <> nil then
    begin
      StyleResource := TPathData(Source).StyleResource;
      FStyleLookup := TPathData(Source).StyleLookup;
      if Assigned(FOnChanged) then
        FOnChanged(Self);
    end
    else
    begin
      SetLength(FPathData, TPathData(Source).Count);
      System.Move(TPathData(Source).FPathData[0], FPathData[0], SizeOf(TPathPoint) * Count);
      if Assigned(FOnChanged) then
        FOnChanged(Self);
    end;
  end
  else
    inherited
end;

procedure TPathData.SetStyleResource(const Value: TPathObject);
begin
  if FStyleResource <> Value then
  begin
    if FStyleResource <> nil then
      FStyleResource.RemoveFreeNotify(Self);
    FStyleResource := Value;
    if FStyleResource <> nil then
    begin
      FStyleLookup := FStyleResource.StyleName;
      FStyleResource.AddFreeNotify(Self);
    end
    else
      FStyleLookup := '';
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

function TPathData.GetStyleLookup: WideString;
begin
  Result := FStyleLookup;
end;

procedure TPathData.SetStyleLookup(const Value: WideString);
begin
  if Value <> FStyleLookup then
  begin
    FStyleLookup := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

function TPathData.GetPath: TPathData;
var
  O: TFmxObject;
begin
  Result := nil;
  if FStyleResource <> nil then
  begin
    Result := TPathObject(FStyleResource).Path;
  end
  else if FStyleLookup <> '' then
  begin
    O := FindStyleResource(FStyleLookup);
    if O is TPathObject then
      StyleResource := TPathObject(O);
    if FStyleResource <> nil then
      Result := TPathObject(FStyleResource).Path;
  end;
end;

function TPathData.GetCount: Integer;
begin
  Result := Length(FPathData);
end;

function TPathData.GetPoint(AIndex: Integer): TPathPoint;
begin
  Result := FPathData[AIndex];
end;

procedure TPathData.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Path', ReadPath, WritePath, Count > 0);
end;

procedure TPathData.ReadPath(Stream: TStream);
var
  S: Longint;
  I: Integer;
  k: Byte;
  P: TPointF;
begin
  Stream.Read(S, SizeOf(S));
{$IFDEF FPC_BIG_ENDIAN}
  ReverseBytes(@S, 4);
{$ENDIF}
  SetLength(FPathData, S);
  if S > 0 then
  begin
    if (Stream.Size - 4) div S = 9 then
    begin
      for I := 0 to S - 1 do
      begin
        Stream.Read(k, 1);
        Stream.Read(P, SizeOf(P));
{$IFDEF FPC_BIG_ENDIAN}
        ReverseBytes(@P.X, 4);
        ReverseBytes(@P.Y, 4);
{$ENDIF}
        FPathData[I].Kind := TPathPointKind(k);
        FPathData[I].Point := P;
      end;
    end
    else
    begin
      Stream.Read(FPathData[0], S * SizeOf(TPathPoint));
{$IFDEF FPC_BIG_ENDIAN}
      for I := 0 to S * 3 - 1 do
        ReverseBytes(@PColorArray(PathData)[I], 4);
{$ENDIF}
    end;
  end;
  FRecalcBounds := True;
end;

procedure TPathData.WritePath(Stream: TStream);
var
  S: Longint;
begin
  S := Count;
  Stream.Write(S, SizeOf(S));
  if S > 0 then
    Stream.Write(FPathData[0], S * SizeOf(TPathPoint));
end;

function TPathData.LastPoint: TPointF;
begin
  if Count > 0 then
    Result := FPathData[High(FPathData)].Point
  else
    Result := PointF(0, 0);
end;

procedure TPathData.MoveTo(const P: TPointF);
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppMoveTo;
  FPathData[High(FPathData)].Point := P;
  FStartPoint := FPathData[High(FPathData)].Point;
  FRecalcBounds := True;
end;

procedure TPathData.MoveToRel(const P: TPointF);
begin
  with LastPoint do
  begin
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppMoveTo;
    FPathData[High(FPathData)].Point := PointF(X + P.X, Y + P.Y);
  end;
  FStartPoint := FPathData[High(FPathData)].Point;
  FRecalcBounds := True;
end;

procedure TPathData.LineTo(const P: TPointF);
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
  FPathData[High(FPathData)].Point := P;
  FRecalcBounds := True;
end;

procedure TPathData.LineToRel(const P: TPointF);
begin
  with LastPoint do
  begin
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
    FPathData[High(FPathData)].Point := PointF(X + P.X, Y + P.Y);
  end;
  FRecalcBounds := True;
end;

procedure TPathData.HLineTo(const X: Single);
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
  FPathData[High(FPathData)].Point := PointF(X, FPathData[High(FPathData) - 1].Point.Y);
  FRecalcBounds := True;
end;

procedure TPathData.HLineToRel(const X: Single);
var
  LP: TPointF;
begin
  LP := LastPoint;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
  FPathData[High(FPathData)].Point := PointF(LP.X + X, LP.Y);
  FRecalcBounds := True;
end;

procedure TPathData.VLineTo(const Y: Single);
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
  FPathData[High(FPathData)].Point := PointF(FPathData[High(FPathData) - 1].Point.X, Y);
  FRecalcBounds := True;
end;

procedure TPathData.VLineToRel(const Y: Single);
var
  LP: TPointF;
begin
  LP := LastPoint;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppLineTo;
  FPathData[High(FPathData)].Point := PointF(LP.X, LP.Y + Y);
  FRecalcBounds := True;
end;

procedure TPathData.CurveTo(const ControlPoint1, ControlPoint2, EndPoint: TPointF);
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := ControlPoint1;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := ControlPoint2;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := EndPoint;
  FRecalcBounds := True;
end;

procedure TPathData.CurveToRel(const ControlPoint1, ControlPoint2, EndPoint: TPointF);
begin
  with LastPoint do
  begin
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(X + ControlPoint1.X, Y + ControlPoint1.Y);
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(X + ControlPoint2.X, Y + ControlPoint2.Y);;
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(X + EndPoint.X, Y + EndPoint.Y);;
  end;
  FRecalcBounds := True;
end;

procedure TPathData.SmoothCurveTo(const ControlPoint2, EndPoint: TPointF);
var
  ControlPoint1: TPointF;
begin
  if Count > 2 then
  begin
    ControlPoint1.X := LastPoint.X + (LastPoint.X - FPathData[High(FPathData) - 1].Point.X);
    ControlPoint1.Y := LastPoint.Y + (LastPoint.Y - FPathData[High(FPathData) - 1].Point.Y);
  end
  else
    ControlPoint1 := ControlPoint2;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := ControlPoint1;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := ControlPoint2;
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
  FPathData[High(FPathData)].Point := EndPoint;
  FRecalcBounds := True;
end;

procedure TPathData.SmoothCurveToRel(const ControlPoint2, EndPoint: TPointF);
var
  ControlPoint1: TPointF;
begin
  if Count > 2 then
  begin
    ControlPoint1.X := LastPoint.X + (LastPoint.X - FPathData[High(FPathData) - 1].Point.X);
    ControlPoint1.Y := LastPoint.Y + (LastPoint.Y - FPathData[High(FPathData) - 1].Point.Y);
  end
  else
    ControlPoint1 := ControlPoint2;
  with LastPoint do
  begin
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(ControlPoint1.X, ControlPoint1.Y);
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(X + ControlPoint2.X, Y + ControlPoint2.Y);;
    SetLength(FPathData, Count + 1);
    FPathData[High(FPathData)].Kind := TPathPointKind.ppCurveTo;
    FPathData[High(FPathData)].Point := PointF(X + EndPoint.X, Y + EndPoint.Y);;
  end;
  FRecalcBounds := True;
end;

procedure TPathData.ClosePath;
begin
  SetLength(FPathData, Count + 1);
  FPathData[High(FPathData)].Kind := TPathPointKind.ppClose;
  FPathData[High(FPathData)].Point := FStartPoint;
  FRecalcBounds := True;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TPathData.Clear;
begin
  FRecalcBounds := True;
  SetLength(FPathData, 0);
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TPathData.GetBounds: TRectF;
var
  I: Integer;
begin
  if Length(FPathData) = 0 then
  begin
    Result := RectF(0, 0, 0, 0);
    Exit;
  end;
  if FRecalcBounds then
  begin
    Result := RectF($FFFF, $FFFF, -$FFFF, -$FFFF);
    for I := 0 to High(FPathData) do
    begin
      if FPathData[I].Kind = TPathPointKind.ppClose then
        Continue;

      if FPathData[I].Point.X < Result.Left then
        Result.Left := FPathData[I].Point.X;
      if FPathData[I].Point.X > Result.Right then
        Result.Right := FPathData[I].Point.X;
      if FPathData[I].Point.Y < Result.Top then
        Result.Top := FPathData[I].Point.Y;
      if FPathData[I].Point.Y > Result.Bottom then
        Result.Bottom := FPathData[I].Point.Y;
    end;
    // add small amount
    if RectWidth(Result) = 0 then
      Result.Right := Result.Left + 0.001;
    if RectHeight(Result) = 0 then
      Result.Bottom := Result.Top + 0.001;
    FBounds := Result;  
    FRecalcBounds := False;
  end
  else
    Result := FBounds;
end;

procedure TPathData.Scale(const scaleX, scaleY: Single);
var
  I: Integer;
begin
  if Length(FPathData) > 0 then
  begin
    FRecalcBounds := True;
    for I := 0 to High(FPathData) do
      case FPathData[I].Kind of
        TPathPointKind.ppMoveTo, TPathPointKind.ppLineTo, TPathPointKind.ppCurveTo:
          begin
            FPathData[I].Point.X := FPathData[I].Point.X * scaleX;
            FPathData[I].Point.Y := FPathData[I].Point.Y * scaleY;
          end;
        TPathPointKind.ppClose:
          begin
          end;
      end;
  end;
end;

procedure TPathData.Translate(const dX, dY: Single);
var
  I: Integer;
begin
  if Count > 0 then
  begin
    FRecalcBounds := True;
    for I := 0 to High(FPathData) do
      case FPathData[I].Kind of
        TPathPointKind.ppMoveTo, TPathPointKind.ppLineTo, TPathPointKind.ppCurveTo:
          begin
            FPathData[I].Point.X := FPathData[I].Point.X + dX;
            FPathData[I].Point.Y := FPathData[I].Point.Y + dY;
          end;
        TPathPointKind.ppClose:
          begin
          end;
      end;
  end;
end;

procedure TPathData.FitToRect(const ARect: TRectF);
var
  B: TRectF;
begin
  B := GetBounds;
  Translate(-B.Left, -B.Top);
  Scale(RectWidth(ARect) / RectWidth(B), RectHeight(ARect) / RectHeight(B));
  Translate(ARect.Left, ARect.Top);
end;

procedure TPathData.ApplyMatrix(const M: TMatrix);
var
  I: Integer;
begin
  if Length(FPathData) > 0 then
  begin
    FRecalcBounds := True;
    for I := 0 to High(FPathData) do
      case FPathData[I].Kind of
        TPathPointKind.ppMoveTo, TPathPointKind.ppLineTo, TPathPointKind.ppCurveTo:
          begin
            with VectorTransform(Vector(FPathData[I].Point), M) do
              FPathData[I].Point := PointF(X, Y);
          end;
        TPathPointKind.ppClose:
          begin
          end;
      end;
  end;
end;

procedure TPathData.Flatten(const Flatness: Single = 0.25);

  procedure CalculateBezierCoefficients(const Bezier: TCubicBezier; out ax, bx, cx, ay, by, cy: Single);
  begin
    cx := 3.0 * (Bezier[1].X - Bezier[0].X);
    cy := 3.0 * (Bezier[1].Y - Bezier[0].Y);
    bx := 3.0 * (Bezier[2].X - Bezier[1].X) - cx;
    by := 3.0 * (Bezier[2].Y - Bezier[1].Y) - cy;
    ax := Bezier[3].X - Bezier[0].X - cx - bx;
    ay := Bezier[3].Y - Bezier[0].Y - cy - by;
  end;

  function PointOnBezier(const StartPoint: TPointF; const ax, bx, cx, ay, by, cy, t: Single): TPointF;
  var
    tSqr: Single;
    tCube: Single;
  begin
    tSqr := t * t;
    tCube := tSqr * t;
    Result.X := (ax * tCube) + (bx * tSqr) + (cx * t) + StartPoint.X;
    Result.Y := (ay * tCube) + (by * tSqr) + (cy * t) + StartPoint.Y;
  end;

  function CreateBezier(const Bezier: TCubicBezier; const PointCount: Integer): TPolygon;
  var
    ax: Single;
    bx: Single;
    cx: Single;
    ay: Single;
    by: Single;
    cy: Single;
    dT: Single;
    t: Single;
    I: Integer;
  begin
    if PointCount = 0 then
      Exit;
    dT := 1.0 / (1.0 * PointCount - 1.0);
    t := 0.0;
    SetLength(Result, PointCount);
    CalculateBezierCoefficients(Bezier, ax, bx, cx, ay, by, cy);
    for I := 0 to PointCount - 1 do
    begin
      Result[I] := PointOnBezier(Bezier[0], ax, bx, cx, ay, by, cy, t);
      t := t + dT;
    end;
  end;

var
  I, j: Integer;
  BPts: TPolygon;
  B: TCubicBezier;
  len: Single;
  SegCount: Integer;
  OldPathData: array of TPathPoint;
  CurPoint: TPointF;
  F, S: Single;
  Bounds, R: TRectF;
begin
  { scale }
  if Length(FPathData) > 0 then
  begin
    FRecalcBounds := True;
    Bounds := GetBounds;
    R := Bounds;
    FitRect(R, RectF(0, 0, 100, 100));
    S := Min({$IFNDEF FPC}Extended{$ENDIF}(RectWidth(Bounds) / 100), {$IFNDEF FPC}Extended{$ENDIF}(RectHeight(Bounds) / 100));
    F := Flatness * S;
    if F < 0.05 then
      F := 0.05;

    { copy data }
    SetLength(OldPathData, Count);
    System.Move(FPathData[0], OldPathData[0], Count * SizeOf(FPathData[0]));
    SetLength(FPathData, 0);

    I := 0;
    while I < Length(OldPathData) do
    begin
      case OldPathData[I].Kind of
        TPathPointKind.ppMoveTo:
          begin
            MoveTo(OldPathData[I].Point);
            CurPoint := OldPathData[I].Point;
          end;
        TPathPointKind.ppLineTo:
          begin
            LineTo(OldPathData[I].Point);
            CurPoint := OldPathData[I].Point;
          end;
        TPathPointKind.ppCurveTo:
          begin
            B[0] := CurPoint;
            B[1] := OldPathData[I].Point;
            inc(I);
            B[2] := OldPathData[I].Point;
            inc(I);
            B[3] := OldPathData[I].Point;
            len := VectorLength(VectorSubtract(Vector(B[1]), Vector(B[3])));
            SegCount := round(len / F);
            if SegCount < 2 then
              SegCount := 2;
            BPts := CreateBezier(B, SegCount);
            for j := 0 to High(BPts) do
            begin
              LineTo(BPts[j]);
            end;
            CurPoint := OldPathData[I].Point;
          end;
        TPathPointKind.ppClose:
          begin
            ClosePath;
          end;
      end;
      inc(I);
    end;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

function TPathData.FlattenToPolygon(var Polygon: TPolygon; const Flatness: Single = 0.25): TPointF;

  procedure CalculateBezierCoefficients(const Bezier: TCubicBezier; out ax, bx, cx, ay, by, cy: Single);
  begin
    cx := 3.0 * (Bezier[1].X - Bezier[0].X);
    cy := 3.0 * (Bezier[1].Y - Bezier[0].Y);
    bx := 3.0 * (Bezier[2].X - Bezier[1].X) - cx;
    by := 3.0 * (Bezier[2].Y - Bezier[1].Y) - cy;
    ax := Bezier[3].X - Bezier[0].X - cx - bx;
    ay := Bezier[3].Y - Bezier[0].Y - cy - by;
  end;

  function PointOnBezier(const StartPoint: TPointF; const ax, bx, cx, ay, by, cy, t: Single): TPointF;
  var
    tSqr: Single;
    tCube: Single;
  begin
    tSqr := t * t;
    tCube := tSqr * t;
    Result.X := (ax * tCube) + (bx * tSqr) + (cx * t) + StartPoint.X;
    Result.Y := (ay * tCube) + (by * tSqr) + (cy * t) + StartPoint.Y;
  end;

  function CreateBezier(const Bezier: TCubicBezier; const PointCount: Integer): TPolygon;
  var
    ax: Single;
    bx: Single;
    cx: Single;
    ay: Single;
    by: Single;
    cy: Single;
    dT: Single;
    t: Single;
    I: Integer;
  begin
    if PointCount = 0 then
      Exit;
    dT := 1.0 / (1.0 * PointCount - 1.0);
    t := 0.0;
    SetLength(Result, PointCount);
    CalculateBezierCoefficients(Bezier, ax, bx, cx, ay, by, cy);
    for I := 0 to PointCount - 1 do
    begin
      Result[I] := PointOnBezier(Bezier[0], ax, bx, cx, ay, by, cy, t);
      t := t + dT;
    end;
  end;

var
  I, j: Integer;
  BPts: TPolygon;
  B: TCubicBezier;
  SP, CurPoint: TPointF;
  len: Single;
  SegCount: Integer;
  F, S: Single;
  Bounds, R: TRectF;
begin
  Result := PointF(0, 0);
  SetLength(Polygon, 0);
  if Length(FPathData) > 0 then
  begin
    FRecalcBounds := True;
    Bounds := GetBounds;
    R := Bounds;
    FitRect(R, RectF(0, 0, 100, 100));
    S := Min({$IFNDEF FPC}Extended{$ENDIF}(RectWidth(Bounds) / 100), {$IFNDEF FPC}Extended{$ENDIF}(RectHeight(Bounds) / 100));
    F := Flatness * S;
    if F < 0.05 then
      F := 0.05;

    I := 0;
    while I < Count do
    begin
      case FPathData[I].Kind of
        TPathPointKind.ppMoveTo:
          begin
            SetLength(Polygon, Length(Polygon) + 1);
            Polygon[High(Polygon)] := FPathData[I].Point;
            CurPoint := FPathData[I].Point;
            SP := CurPoint;
          end;
        TPathPointKind.ppLineTo:
          begin
            SetLength(Polygon, Length(Polygon) + 1);
            Polygon[High(Polygon)] := FPathData[I].Point;
            CurPoint := FPathData[I].Point;
          end;
        TPathPointKind.ppCurveTo:
          begin
            B[0] := CurPoint;
            B[1] := FPathData[I].Point;
            inc(I);
            B[2] := FPathData[I].Point;
            inc(I);
            B[3] := FPathData[I].Point;
            len := VectorLength(VectorSubtract(Vector(B[1]), Vector(B[3])));
            SegCount := round(len / F);
            if SegCount < 2 then
              SegCount := 2;
            BPts := CreateBezier(B, SegCount);
            for j := 0 to High(BPts) do
            begin
              SetLength(Polygon, Length(Polygon) + 1);
              Polygon[High(Polygon)] := BPts[j];
            end;
            CurPoint := FPathData[I].Point;
          end;
        TPathPointKind.ppClose:
          begin
            SetLength(Polygon, Length(Polygon) + 1);
            Polygon[High(Polygon)] := SP;
            SetLength(Polygon, Length(Polygon) + 1);
            Polygon[High(Polygon)] := ClosePolygon;
          end;
      end;
      inc(I);
    end;
    with GetBounds do
      Result := PointF(Abs(Right - Left), Abs(Bottom - Top));
  end;
end;

procedure TPathData.FreeNotification(AObject: TObject);
begin
  if FStyleResource = AObject then
    FStyleResource := nil;
end;

procedure TPathData.AddEllipse(const ARect: TRectF);
var
  cx, cy: Single;
  px, py: Single;
begin
  cx := (ARect.Left + ARect.Right) / 2;
  cy := (ARect.Top + ARect.Bottom) / 2;
  px := CurveKappa * (RectWidth(ARect) / 2);
  py := CurveKappa * (RectHeight(ARect) / 2);
  MoveTo(PointF(ARect.Left, cy));
  CurveTo(PointF(ARect.Left, cy - py), PointF(cx - px, ARect.Top), PointF(cx, ARect.Top));
  CurveTo(PointF(cx + px, ARect.Top), PointF(ARect.Right, cy - py), PointF(ARect.Right, cy));
  CurveTo(PointF(ARect.Right, cy + py), PointF(cx + px, ARect.Bottom), PointF(cx, ARect.Bottom));
  CurveTo(PointF(cx - px, ARect.Bottom), PointF(ARect.Left, cy + py), PointF(ARect.Left, cy));
end;

procedure TPathData.AddRectangle(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
  const ACornerType: TCornerType = TCornerType.ctRound);
var
  R: TRectF;
  X1, X2, Y1, Y2: Single;
begin
  R := ARect;
  X1 := XRadius;
  if RectWidth(R) - (X1 * 2) < 0 then
    X1 := (XRadius * (RectWidth(R) / (X1 * 2)));
  X2 := X1 / 2;
  Y1 := YRadius;
  if RectHeight(R) - (Y1 * 2) < 0 then
    Y1 := (YRadius * (RectHeight(R) / (Y1 * 2)));
  Y2 := Y1 / 2;

  MoveTo(PointF(R.Left, R.Top + Y1));
  if TCorner.crTopLeft in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        LineTo(PointF(R.Left + X1, R.Top));
      TCornerType.ctInnerRound:
        CurveTo(PointF(R.Left + X2, R.Top + Y1), PointF(R.Left + X1, R.Top + Y2), PointF(R.Left + X1, R.Top));
      TCornerType.ctInnerLine:
        begin
          LineTo(PointF(R.Left + X2, R.Top + Y1));
          LineTo(PointF(R.Left + X1, R.Top + Y2));
          LineTo(PointF(R.Left + X1, R.Top));
        end;
    else
      CurveTo(PointF(R.Left, R.Top + (Y2)), PointF(R.Left + X2, R.Top), PointF(R.Left + X1, R.Top))
    end;
  end
  else
  begin
    LineTo(PointF(R.Left, R.Top));
    LineTo(PointF(R.Left + X1, R.Top));
  end;
  LineTo(PointF(R.Right - X1, R.Top));
  if TCorner.crTopRight in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        LineTo(PointF(R.Right, R.Top + Y1));
      TCornerType.ctInnerRound:
        CurveTo(PointF(R.Right - X1, R.Top + Y2), PointF(R.Right - X2, R.Top + Y1), PointF(R.Right, R.Top + Y1));
      TCornerType.ctInnerLine:
        begin
          LineTo(PointF(R.Right - X1, R.Top + Y2));
          LineTo(PointF(R.Right - X2, R.Top + Y1));
          LineTo(PointF(R.Right, R.Top + Y1));
        end;
    else
      CurveTo(PointF(R.Right - X2, R.Top), PointF(R.Right, R.Top + (Y2)), PointF(R.Right, R.Top + Y1))
    end;
  end
  else
  begin
    LineTo(PointF(R.Right, R.Top));
    LineTo(PointF(R.Right, R.Top + Y1));
  end;
  LineTo(PointF(R.Right, R.Bottom - Y1));
  if TCorner.crBottomRight in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        LineTo(PointF(R.Right - X1, R.Bottom));
      TCornerType.ctInnerRound:
        CurveTo(PointF(R.Right - X2, R.Bottom - Y1), PointF(R.Right - X1, R.Bottom - Y2), PointF(R.Right - X1, R.Bottom));
      TCornerType.ctInnerLine:
        begin
          LineTo(PointF(R.Right - X2, R.Bottom - Y1));
          LineTo(PointF(R.Right - X1, R.Bottom - Y2));
          LineTo(PointF(R.Right - X1, R.Bottom));
        end;
    else
      CurveTo(PointF(R.Right, R.Bottom - (Y2)), PointF(R.Right - X2, R.Bottom), PointF(R.Right - X1, R.Bottom))
    end;
  end
  else
  begin
    LineTo(PointF(R.Right, R.Bottom));
    LineTo(PointF(R.Right - X1, R.Bottom));
  end;
  LineTo(PointF(R.Left + X1, R.Bottom));
  if TCorner.crBottomLeft in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        LineTo(PointF(R.Left, R.Bottom - Y1));
      TCornerType.ctInnerRound:
        CurveTo(PointF(R.Left + X1, R.Bottom - Y2), PointF(R.Left + X2, R.Bottom - Y1), PointF(R.Left, R.Bottom - Y1));
      TCornerType.ctInnerLine:
        begin
          LineTo(PointF(R.Left + X1, R.Bottom - Y2));
          LineTo(PointF(R.Left + X2, R.Bottom - Y1));
          LineTo(PointF(R.Left, R.Bottom - Y1));
        end;
    else
      CurveTo(PointF(R.Left + X2, R.Bottom), PointF(R.Left, R.Bottom - (Y2)), PointF(R.Left, R.Bottom - Y1))
    end;
  end
  else
  begin
    LineTo(PointF(R.Left, R.Bottom));
    LineTo(PointF(R.Left, R.Bottom - Y1));
  end;
  ClosePath;
end;

procedure DrawArcWithBezier(Path: TPathData; CenterX, CenterY, RadiusX, RadiusY, StartAngle, SweepRange: Single;
  UseMoveTo: Boolean);
var
  Coord: array [0 .. 3] of TPointF;
  Pts: array [0 .. 3] of TPointF;
  A, B, C, X, Y: Single;
  ss, cc: Single;
  I: Integer;
begin
  if SweepRange = 0 then
  begin
    if UseMoveTo then
    begin
      if (Length(Path.FPathData) = 0) then
        Path.MoveTo(PointF(CenterX + RadiusX * Cos(StartAngle), CenterY - RadiusY * Sin(StartAngle)))
      else
        Path.LineTo(PointF(CenterX + RadiusX * Cos(StartAngle), CenterY - RadiusY * Sin(StartAngle)));
    end;
    Path.LineTo(PointF(CenterX + RadiusX * Cos(StartAngle), CenterY - RadiusY * Sin(StartAngle)));
    Exit;
  end;
  B := Sin(SweepRange / 2);
  C := Cos(SweepRange / 2);
  A := 1 - C;
  X := A * 4.0 / 3.0;
  Y := B - X * C / B;
  ss := Sin(StartAngle + SweepRange / 2);
  cc := Cos(StartAngle + SweepRange / 2);
  Coord[0] := PointF(C, -B);
  Coord[1] := PointF(C + X, -Y);
  Coord[2] := PointF(C + X, Y);
  Coord[3] := PointF(C, B);
  for I := 0 to 3 do
  begin
    Pts[I] := PointF(CenterX + RadiusX * (Coord[I].X * cc - Coord[I].Y * ss),
      CenterY + RadiusY * (Coord[I].X * ss + Coord[I].Y * cc));
  end;
  if UseMoveTo then
  begin
    if (Length(Path.FPathData) = 0) then
      Path.MoveTo(Pts[0])
    else
      Path.LineTo(Pts[0]);
  end;
  Path.CurveTo(Pts[1], Pts[2], Pts[3]);
end;

procedure TPathData.AddArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single);
const
  bezier_arc_angle_epsilon = 0.01;
var
  UseMoveTo: Boolean;
  I: Integer;
  F: Single;
  total_sweep, local_sweep, prev_sweep: Single;
  done: Boolean;
begin
  StartAngle := DegToRad(StartAngle);
  SweepAngle := DegToRad(SweepAngle);

  I := trunc(StartAngle / (2.0 * cPI));
  F := StartAngle - (I * 2.0 * cPI);

  StartAngle := F;

  if SweepAngle >= 2.0 * cPI then
    SweepAngle := 2.0 * cPI;
  if SweepAngle <= -2.0 * cPI then
    SweepAngle := -2.0 * cPI;

  if Abs(SweepAngle) < 1E-10 then
  begin
    Exit;
  end;

  total_sweep := 0.0;

  done := False;
  UseMoveTo := True;
  repeat
    if SweepAngle < 0.0 then
    begin
      prev_sweep := total_sweep;
      local_sweep := -cPI * 0.5;
      total_sweep := total_sweep - (cPI * 0.5);
      if total_sweep <= SweepAngle + bezier_arc_angle_epsilon then
      begin
        local_sweep := SweepAngle - prev_sweep;
        done := True;
      end;
    end
    else
    begin
      prev_sweep := total_sweep;
      local_sweep := cPI * 0.5;
      total_sweep := total_sweep + (Pi * 0.5);
      if total_sweep >= SweepAngle - bezier_arc_angle_epsilon then
      begin
        local_sweep := SweepAngle - prev_sweep;
        done := True;
      end;
    end;
    DrawArcWithBezier(Self, Center.X, Center.Y, Radius.X, Radius.Y, StartAngle, local_sweep, UseMoveTo);
    UseMoveTo := False;
    StartAngle := StartAngle + local_sweep;
  until done;
end;

procedure TPathData.AddArcSvgPart(const Center, Radius: TPointF; StartAngle, SweepAngle: Single);
const
  bezier_arc_angle_epsilon = 0.01;
var
  UseMoveTo: Boolean;
  I: Integer;
  F: Single;
  total_sweep, local_sweep, prev_sweep: Single;
  done: Boolean;
begin
  StartAngle := DegToRad(StartAngle);
  SweepAngle := DegToRad(SweepAngle);

  I := trunc(StartAngle / (2.0 * cPI));
  F := StartAngle - (I * 2.0 * cPI);

  StartAngle := F;

  if SweepAngle >= 2.0 * cPI then
    SweepAngle := 2.0 * cPI;
  if SweepAngle <= -2.0 * cPI then
    SweepAngle := -2.0 * cPI;

  if Abs(SweepAngle) < 1E-10 then
  begin
    Exit;
  end;

  total_sweep := 0.0;

  done := False;
  UseMoveTo := False;
  repeat
    if SweepAngle < 0.0 then
    begin
      prev_sweep := total_sweep;
      local_sweep := -cPI * 0.5;
      total_sweep := total_sweep - (cPI * 0.5);
      if total_sweep <= SweepAngle + bezier_arc_angle_epsilon then
      begin
        local_sweep := SweepAngle - prev_sweep;
        done := True;
      end;
    end
    else
    begin
      prev_sweep := total_sweep;
      local_sweep := cPI * 0.5;
      total_sweep := total_sweep + (Pi * 0.5);
      if total_sweep >= SweepAngle - bezier_arc_angle_epsilon then
      begin
        local_sweep := SweepAngle - prev_sweep;
        done := True;
      end;
    end;
    DrawArcWithBezier(Self, Center.X, Center.Y, Radius.X, Radius.Y, StartAngle, local_sweep, UseMoveTo);
    UseMoveTo := False;
    StartAngle := StartAngle + local_sweep;
  until done;
end;

procedure TPathData.AddArcSvg(const P1, Radius: TPointF; Angle: Single; const LargeFlag, SweepFlag: Boolean;
  const P2: TPointF);
var
  I: Integer;
  m_radii_ok: Boolean;
  V, P, N, sq, rx, ry, x0, y0, X1, Y1, X2, Y2, cx, cy, ux, uy, vx, vy,

    dx2, dy2, prx, pry, px1, py1, cx1, cy1, sx2, sy2,

    sign, coef,

    radii_check, start_angle, sweep_angle,

    cos_a, sin_a: Single;
  tm: TMatrix;
  len: Integer;
begin
  rx := Radius.X;
  ry := Radius.Y;
  x0 := P1.X;
  y0 := P1.Y;
  X2 := P2.X;
  Y2 := P2.Y;
  Angle := DegToRad(Angle);

  m_radii_ok := True;

  if rx < 0.0 then
    rx := -rx;

  if ry < 0.0 then
    ry := -rx;

  // Calculate the middle point between
  // the current and the final points
  dx2 := (x0 - X2) / 2.0;
  dy2 := (y0 - Y2) / 2.0;

  // Convert angle from degrees to radians
  cos_a := Cos(Angle);
  sin_a := Sin(Angle);

  // Calculate (x1, y1)
  X1 := cos_a * dx2 + sin_a * dy2;
  Y1 := -sin_a * dx2 + cos_a * dy2;

  // Ensure radii are large enough
  prx := rx * rx;
  pry := ry * ry;
  px1 := X1 * X1;
  py1 := Y1 * Y1;

  // Check that radii are large enough
  radii_check := px1 / prx + py1 / pry;

  if radii_check > 1.0 then
  begin
    rx := Sqrt(radii_check) * rx;
    ry := Sqrt(radii_check) * ry;
    prx := rx * rx;
    pry := ry * ry;

    if radii_check > 10.0 then
      m_radii_ok := False;

  end;

  // Calculate (cx1, cy1)
  if LargeFlag = SweepFlag then
    sign := -1.0
  else
    sign := 1.0;

  sq := (prx * pry - prx * py1 - pry * px1) / (prx * py1 + pry * px1);

  if sq < 0 then
    coef := sign * Sqrt(0)
  else
    coef := sign * Sqrt(sq);

  cx1 := coef * ((rx * Y1) / ry);
  cy1 := coef * -((ry * X1) / rx);

  // Calculate (cx, cy) from (cx1, cy1)
  sx2 := (x0 + X2) / 2.0;
  sy2 := (y0 + Y2) / 2.0;
  cx := sx2 + (cos_a * cx1 - sin_a * cy1);
  cy := sy2 + (sin_a * cx1 + cos_a * cy1);

  // Calculate the start_angle (angle1) and the sweep_angle (dangle)
  ux := (X1 - cx1) / rx;
  uy := (Y1 - cy1) / ry;
  vx := (-X1 - cx1) / rx;
  vy := (-Y1 - cy1) / ry;

  // Calculate the angle start
  N := Sqrt(ux * ux + uy * uy);
  P := ux; // (1 * ux ) + (0 * uy )

  if uy < 0 then
    sign := -1.0
  else
    sign := 1.0;

  V := P / N;

  if V < -1.0 then
    V := -1.0;

  if V > 1.0 then
    V := 1.0;

  start_angle := sign * ArcCos(V);

  // Calculate the sweep angle
  N := Sqrt((ux * ux + uy * uy) * (vx * vx + vy * vy));
  P := ux * vx + uy * vy;

  if ux * vy - uy * vx < 0 then
    sign := -1.0
  else
    sign := 1.0;

  V := P / N;

  if V < -1.0 then
    V := -1.0;

  if V > 1.0 then
    V := 1.0;

  sweep_angle := sign * ArcCos(V);

  if (not SweepFlag) and (sweep_angle > 0) then
    sweep_angle := sweep_angle - Pi * 2.0
  else if SweepFlag and (sweep_angle < 0) then
    sweep_angle := sweep_angle + Pi * 2.0;

  len := Count;
  AddArcSvgPart(PointF(0, 0), PointF(rx, ry), RadToDeg(start_angle), RadToDeg(sweep_angle));

  tm := IdentityMatrix;
  tm.m31 := cx;
  tm.m32 := cy;
  tm := MatrixMultiply(CreateRotationMatrix(Angle), tm);

  I := len;
  while I < Count do
  begin
    with VectorTransform(Vector(FPathData[I].Point), tm) do
      FPathData[I].Point := PointF(X, Y);
    inc(I);
  end;
end;

function TPathData.IsEmpty: Boolean;
begin
  Result := (Length(FPathData) = 0) or (GetBounds.Width * GetBounds.Height = 0);
end;

function TPathData.GetPathString: AnsiString;
var
  I: Integer;
begin
  Result := '';
  I := 0;
  while I < Count do
  begin
    case FPathData[I].Kind of
      TPathPointKind.ppMoveTo:
        Result := Result + 'M ' + FloatToStr(FPathData[I].Point.X, USFormatSettings) + ',' + FloatToStr(FPathData[I].Point.Y, USFormatSettings) + ' ';
      TPathPointKind.ppLineTo:
        Result := Result + 'L ' + FloatToStr(FPathData[I].Point.X, USFormatSettings) + ',' + FloatToStr(FPathData[I].Point.Y, USFormatSettings) + ' ';
      TPathPointKind.ppCurveTo:
        begin
          Result := Result + 'C ' + FloatToStr(FPathData[I].Point.X, USFormatSettings) + ',' + FloatToStr(FPathData[I].Point.Y, USFormatSettings) + ' ' +
            FloatToStr(FPathData[I + 1].Point.X, USFormatSettings) + ',' + FloatToStr(FPathData[I + 1].Point.Y, USFormatSettings) + ' ' +
            FloatToStr(FPathData[I + 2].Point.X, USFormatSettings) + ',' + FloatToStr(FPathData[I + 2].Point.Y, USFormatSettings) + ' ';
          inc(I, 2);
        end;
      TPathPointKind.ppClose:
        Result := Result + 'Z ';
    end;
    inc(I);
  end;
end;

function GetTok(const S: AnsiString; var Pos: Integer): AnsiString;
begin
  Result := '';
  if Pos > Length(S) then
    Exit;
  while (Pos <= Length(S)) and (S[Pos] in [' ']) do
    inc(Pos);
  while Pos <= Length(S) do
  begin
    if System.Pos(S[Pos], AnsiString('zmlchvsqtaZMLCHVSQTA')) = 0 then
      Break;
    Result := Result + S[Pos];
    Inc(Pos);
  end;
end;

function GetNum(const S: AnsiString; var Pos: Integer): AnsiString;
begin
  Result := '';
  if Pos > Length(S) then
    Exit;
  while (Pos <= Length(S)) and (S[Pos] in [' ']) do
    inc(Pos);
  while Pos <= Length(S) do
  begin
    if (S[Pos] = 'e') then
    begin
      Result := Result + S[Pos];
      Inc(Pos);
      Continue;
    end;
    if (S[Pos] = '-') and (Length(Result) > 0) and (Result[Length(Result)] = 'e') then
    begin
      Result := Result + S[Pos];
      Inc(Pos);
      Continue;
    end;
    if (Result <> '') and (S[Pos] = '-') then
      Break;
    if (System.Pos(S[Pos], AnsiString('0123456789.')) = 0) and not((Pos = Pos) and (S[Pos] = '-')) then
      Break;
    Result := Result + S[Pos];
    Inc(Pos);
  end;
  while S[Pos] in [' '] do
    inc(Pos);
end;

function GetPointFromStr(const S: AnsiString; var Pos: Integer): TPointF;
var
  X, Y: AnsiString;
begin
  Result := PointF(0, 0);
  if Pos > Length(S) then
    Exit;
  while (Pos <= Length(S)) and (S[Pos] in [',', ' ']) do
    inc(Pos);
  X := GetNum(S, Pos);
  while (Pos <= Length(S)) and (S[Pos] in [',', ' ']) do
    inc(Pos);
  Y := GetNum(S, Pos);
  while (Pos <= Length(S)) and (S[Pos] in [',', ' ']) do
    inc(Pos);
  Result := PointF(StrToFloat(X, USFormatSettings), StrToFloat(Y, USFormatSettings));
end;

procedure TPathData.SetPathString(const Value: AnsiString);
const
  TokSep = ' '#10#13;
  TokStop = '0123456789-';
  NumSep = ' ,'#10#13;
  NumStop = 'zmlchvsqtaZMLCHVSQTA';
var
  S, toks: AnsiString;
  tok: AnsiChar;
  R, CP1, CP2: TPointF;
  Angle: Single;
  large, sweet: Boolean;
  lastlen, Pos, I: Integer;
begin
  { change every #10#13 to space }
  for I := 1 to Length(Value) do
  begin
    if Value[I] in [#9, #10, #13] then
      S := S + ' '
    else
      S := S + Value[I];
  end;
  { }
  SetLength(FPathData, 0);
  Pos := 1;
  while S <> '' do
  begin
    lastlen := Pos;
    toks := GetTok(S, Pos);
    while toks <> '' do
    begin
      tok := toks[1];
      Delete(toks, 1, 1);
      try
        if (tok in ['z', 'Z']) then
        begin
          ClosePath;
        end;
        if (tok in ['M']) then
        begin
          MoveTo(GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            LineTo(GetPointFromStr(S, Pos));
          end;
        end;
        if (tok in ['m']) then
        begin
          MoveToRel(GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            LineToRel(GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'L') then
        begin
          LineTo(GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            LineTo(GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'l') then
        begin
          LineToRel(GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            LineToRel(GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'C') then
        begin
          CP1 := GetPointFromStr(S, Pos);
          CP2 := GetPointFromStr(S, Pos);
          CurveTo(CP1, CP2, GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            CP1 := GetPointFromStr(S, Pos);
            CP2 := GetPointFromStr(S, Pos);
            CurveTo(CP1, CP2, GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'c') then
        begin
          CP1 := GetPointFromStr(S, Pos);
          CP2 := GetPointFromStr(S, Pos);
          CurveToRel(CP1, CP2, GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            CP1 := GetPointFromStr(S, Pos);
            CP2 := GetPointFromStr(S, Pos);
            CurveToRel(CP1, CP2, GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'S') then
        begin
          CP2 := GetPointFromStr(S, Pos);
          SmoothCurveTo(CP2, GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            CP2 := GetPointFromStr(S, Pos);
            SmoothCurveTo(CP2, GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 's') then
        begin
          CP2 := GetPointFromStr(S, Pos);
          SmoothCurveToRel(CP2, GetPointFromStr(S, Pos));
          while (S <> '') and (S[Pos] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-']) do
          begin
            { next points }
            CP2 := GetPointFromStr(S, Pos);
            SmoothCurveToRel(CP2, GetPointFromStr(S, Pos));
          end;
        end;
        if (tok = 'H') then
        begin
          // skip horizontal line
          HLineTo(StrToFloat(GetNum(S, Pos), USFormatSettings));
        end;
        if (tok = 'h') then
        begin
          // skip horizontal line
          HLineToRel(StrToFloat(GetNum(S, Pos), USFormatSettings));
        end;
        if (tok = 'V') then
        begin
          // skip vertical line
          VLineTo(StrToFloat(GetNum(S, Pos), USFormatSettings));
        end;
        if (tok = 'v') then
        begin
          // skip vertical line
          VLineToRel(StrToFloat(GetNum(S, Pos), USFormatSettings));
        end;
        if (tok = 'Q') then
        begin
          // skip quadratic bezier
          GetPointFromStr(S, Pos);
          GetPointFromStr(S, Pos);
        end;
        if (tok = 'q') then
        begin
          // skip quadratic bezier
          GetPointFromStr(S, Pos);
          GetPointFromStr(S, Pos);
        end;
        if (tok = 'T') then
        begin
          // skip show qudratic bezier
          GetPointFromStr(S, Pos);
        end;
        if (tok = 't') then
        begin
          // skip show qudratic bezier
          GetPointFromStr(S, Pos);
        end;
        if (tok = 'A') then
        begin
          // arc
          if Count > 0 then
            CP1 := FPathData[High(FPathData)].Point
          else
            CP1 := PointF(0, 0);
          R := GetPointFromStr(S, Pos);
          Angle := StrToFloat(GetNum(S, Pos), USFormatSettings);
          with GetPointFromStr(S, Pos) do
          begin
            large := X = 1;
            sweet := Y = 1;
          end;
          CP2 := GetPointFromStr(S, Pos);
          AddArcSvg(CP1, R, Angle, large, sweet, CP2);
        end;
        if (tok = 'a') then
        begin
          // arc rel
          if Count > 0 then
            CP1 := FPathData[High(FPathData)].Point
          else
            CP1 := PointF(0, 0);
          R := GetPointFromStr(S, Pos);
          Angle := StrToFloat(GetNum(S, Pos), USFormatSettings);
          with GetPointFromStr(S, Pos) do
          begin
            large := X = 1;
            sweet := Y = 1;
          end;
          CP2 := GetPointFromStr(S, Pos);
          CP2.X := CP1.X + CP2.X;
          CP2.Y := CP1.Y + CP2.Y;
          AddArcSvg(CP1, R, Angle, large, sweet, CP2);
        end;
      except
      end;
    end;
    if lastlen = Pos then
    begin
      Pos := 0;
      Break;
    end;
  end;
  FRecalcBounds := True;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

{ TCanvas }

constructor TCanvas.CreateFromWindow(const AParent: TFmxHandle; const AWidth, AHeight: Integer);
begin
  inherited Create;
  FParent := AParent;
  Initialize;
  ResizeBuffer(AWidth, AHeight);
end;

constructor TCanvas.CreateFromBitmap(const ABitmap: TBitmap);
begin
  inherited Create;
  FBitmap := ABitmap;
  FWidth := ABitmap.Width;
  FHeight := ABitmap.Height;
  Initialize;
end;

constructor TCanvas.CreateFromPrinter(const APrinter: TAbstractPrinter);
begin
  inherited Create;
  Initialize;
  FPrinter := APrinter;
end;

destructor TCanvas.Destroy;
var
  I: Integer;
begin
  if FBitmaps.Count > 0 then
    for I := FBitmaps.Count - 1 downto 0 do
      FreeNotification(TBitmap(FBitmaps[I]));
  FBitmaps.Free;
  FCanvasSaveData.Free;
  FFont.Free;
  FStroke.Free;
  FFill.Free;
  FreeBuffer;
  inherited;
end;

procedure TCanvas.AssignTo(Dest: TPersistent);
var
  I: Integer;
begin
  if Dest is TBitmap then
  begin
    TBitmap(Dest).SetSize(FWidth, FHeight);
    if FBuffered then
      for I := 0 to FHeight - 1 do
        System.Move(PAlphaColorArray(FBufferBits)[(I) * FWidth], TBitmap(Dest).Scanline[I]^, FWidth * 4);
  end
  else
    inherited;
end;

function TCanvas.DoBeginScene(const AClipRects: PClipRects = nil): Boolean;
begin
  StrokeThickness := 1;
  StrokeCap := TStrokeCap.scFlat;
  StrokeJoin := TStrokeJoin.sjMiter;
  StrokeDash := TStrokeDash.sdSolid;
  Stroke.Kind := TBrushKind.bkSolid;
  Fill.Kind := TBrushKind.bkSolid;
  SetMatrix(IdentityMatrix);
  Result := True;
end;

procedure TCanvas.DoEndScene;
begin
  if FBitmap <> nil then
    FBitmap.UpdateHandles;
end;

function TCanvas.BeginScene(AClipRects: PClipRects = nil): Boolean;
begin
  if FBeginSceneCount = 0 then
    Result := DoBeginScene(AClipRects)
  else
    Result := FBeginSceneCount > 0;
  if Result then
    inc(FBeginSceneCount);
end;

procedure TCanvas.EndScene;
begin
  if FBeginSceneCount = 1 then
    DoEndScene;
  if FBeginSceneCount > 0 then
    dec(FBeginSceneCount);
end;

procedure TCanvas.SetMatrix(const M: TMatrix);
begin
  FMatrix := M;
end;

procedure TCanvas.MultyMatrix(const M: TMatrix);
begin
end;

function TCanvas.CreateSaveState: TCanvasSaveState;
begin
  Result := TCanvasSaveState.Create;
end;

procedure TCanvas.RestoreState(State: TCanvasSaveState);
begin
  if FCanvasSaveData.IndexOf(State) >= 0 then
    Assign(State);
end;

procedure TCanvas.FontChanged(Sender: TObject);
begin
end;

procedure TCanvas.FreeNotification(AObject: TObject);
begin
  if (AObject <> nil) and (AObject is TBitmap) then
    DestroyBitmapHandle(TBitmap(AObject));
end;

class function TCanvas.GetBitmapScanline(Bitmap: TBitmap; y: Integer): PAlphaColorArray;
begin
  Result := nil;
end;

class function TCanvas.GetDefaultCanvas(const AParent: TFmxHandle; const AWidth,
  AHeight: Integer; C: TCanvasClass): TCanvas;
begin
  Result := C.CreateFromWindow(AParent, AWidth, AHeight);
end;

class function TCanvas.GetDefaultCanvas(const ABitmap: TBitmap;
  C: TCanvasClass): TCanvas;
begin
  Result := C.CreateFromBitmap(ABitmap);
end;

class function TCanvas.GetDefaultCanvas(const APrinter: TAbstractPrinter;
  C: TCanvasClass): TCanvas;
begin
  Result := C.CreateFromPrinter(APrinter);
end;

procedure TCanvas.Initialize;
begin
  FStroke := TBrush.Create(TBrushKind.bkSolid, $FF000000);
  FFill := TBrush.Create(TBrushKind.bkSolid, $FFFFFFFF);
  FFont := TFont.Create;
  FFont.OnChanged := FontChanged;
  FBitmaps := TList.Create;
  FCanvasSaveData := TCanvasSaveStateList.Create;
end;

function TCanvas.LoadFontFromStream(AStream: TStream): Boolean;
begin
end;

procedure TCanvas.MeasureLines(ALines: TLineMetricInfo; const ARect: TRectF; const AText: WideString; const WordWrap: Boolean; const Flags: TFillTextFlags;
  const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.taCenter);
var
  WStartChar, WSaveChar, WCurChar, WCutOffChar: Integer;
  LCurChar: Integer;
  TmpS: WideString;
  WWidth: Single;
  LEditRectWidth: Single;
  Tok, LText: WideString;

  function _IsSurrogate(Surrogate: WideChar): Boolean;
  begin
    Result := (Integer(Surrogate) >= $D800) and (Integer(Surrogate) <= $DFFF);
  end;

  function _WideGetToken(var Pos: Integer; const S: WideString): WideString;
  const
  //#$0020   SPACE
  //#$0021 ! EXCLAMATION MARK
  //#$002C , COMMA
  //#$002D - HYPHEN-MINUS
  //#$002E . FULL STOP
  //#$003A : COLON
  //#$003B ; SEMICOLON
  //#$003F ? QUESTION MARK
    BasicSeparatos: WideString = #$0020#$0021#$002C#$002D#$002E#$003A#$003B#$003F;
    MaxBasicSeparators: WideChar = #$003F;
  var
    len: Integer;
    ch: WideChar;
  begin
    Result := '';
    len := Length(S);
    { skip first separators }
    while Pos <= len do
    begin
      ch := S[Pos];
      if (ch > MaxBasicSeparators) or (System.Pos(ch, BasicSeparatos) <= 0) then
        Break;
      if _IsSurrogate(ch) then
        Inc(Pos, 2)
      else
        Inc(Pos, 1);
    end;
    { get }
    while Pos <= len do
    begin
      ch := S[Pos];
      if (ch <= MaxBasicSeparators) and (System.Pos(ch, BasicSeparatos) > 0) then
        Break;
      if _IsSurrogate(ch) then
      begin
        Result := Result + Copy(S, Pos, 2);
        Inc(Pos, 2)
      end
      else
      begin
        Result := Result + S[Pos];
        Inc(Pos, 1);
      end;
    end;
    { skip separators }
    while Pos <= len do
    begin
      ch := S[Pos];
      if (ch > MaxBasicSeparators) or (System.Pos(ch, BasicSeparatos) <= 0) then
        Break;
      if _IsSurrogate(ch) then
        Inc(Pos, 2)
      else
        Inc(Pos, 1);
    end;
  end;

  function RoundToPowerOf2(I: Integer): Integer;
  begin
    I := I or (I shr 1);
    I := I or (I shr 2);
    I := I or (I shr 4);
    I := I or (I shr 8);
    I := I or (I shr 16);
    Result := I + 1;
  end;

  function CutOffPoint(TmpS: WideString; Width: Single): integer;
  var
    W : Single;
    Delta: Integer;
  begin
    Delta := RoundToPowerOf2(Length(TmpS)) div 2;
    Result := Delta;

    while Delta > 0 do
    begin
      W := TextWidth(Copy(TmpS, 1, Result));
      if W > Width then
        Result := Result - Delta;
      Delta := Delta div 2;
      Result := Result + Delta;
    end;
  end;

begin
  ALines.Count := 0;
  if AText = '' then
    Exit;

  ALines.Count := 1;
  with ARect do
    LEditRectWidth := Right - Left;

  // first check linecreaks
  LText := AText;
  TmpS := '';
  LCurChar := 1;
  ALines.Count := 1;
  ALines.Metrics[0].Index := 1;
  while LCurChar <= Length(LText) do
  begin
    if (LText[LCurChar] = #13) or (LText[LCurChar] = #10) then
    begin
      if (LText[LCurChar] = #13) and (LCurChar + 1 <= Length(LText)) then
        if LText[LCurChar + 1] = #10 then
          Inc(LCurChar);

      if WordWrap and (TextWidth(TmpS) > LEditRectWidth) then
      begin
        WCurChar := 1;
        WStartChar := 1;
        WSaveChar := 1;
        Tok := _WideGetToken(WCurChar, TmpS);
        while Tok <> '' do
        begin
          WWidth := TextWidth(Copy(TmpS, WStartChar, WCurChar - WStartChar));
          if WWidth > LEditRectWidth then
          begin
            if WSaveChar = WStartChar then
            begin
              WCutOffChar := CutOffPoint(Copy(TmpS, WStartChar, WCurChar - WStartChar), LEditRectWidth);
              ALines.Metrics[ALines.Count - 1].Len := WCutoffChar;
              WCurChar := WStartChar + WCutOffChar;
              WSaveChar := WStartChar + WCutOffChar;
              WStartChar := WStartChar + WCutOffChar;
            end
            else
            begin
              ALines.Metrics[ALines.Count - 1].Len := WSaveChar - WStartChar;
              WStartChar := WSaveChar;
            end;
            ALines.Count := ALines.Count + 1;
            ALines.Metrics[ALines.Count - 1].Index :=
              ALines.Metrics[ALines.Count - 2].Index + ALines.Metrics[ALines.Count - 2].Len;
          end;
          WSaveChar := WCurChar;
          Tok := _WideGetToken(WCurChar, TmpS);
          if WSaveChar = WCurChar then
            Break; { !!! - error }
        end;

        ALines.Metrics[ALines.Count - 1].Len := WCurChar - WStartChar;
      end
      else
        ALines.Metrics[ALines.Count - 1].Len := Length(Tmps);

      ALines.Count := ALines.Count + 1;
      ALines.Metrics[ALines.Count - 1].Index := LCurChar + 1;

      TmpS := '';
    end
    else
      TmpS := TmpS + LText[LCurChar];
    Inc(LCurChar);
  end;

// last line
  if WordWrap and (TextWidth(TmpS) > LEditRectWidth) then
  begin
    WCurChar := 1;
    WStartChar := 1;
    WSaveChar := 1;
    Tok := _WideGetToken(WCurChar, TmpS);
    while Tok <> '' do
    begin
      Tok := Copy(TmpS, WStartChar, WCurChar - WStartChar);

      WWidth := TextWidth(Copy(TmpS, WStartChar, WCurChar - WStartChar));
      if WWidth > LEditRectWidth then
      begin
        if WSaveChar = WStartChar then
        begin
          WCutOffChar := CutOffPoint(Copy(TmpS, WStartChar, WCurChar - WStartChar), LEditRectWidth);
          ALines.Metrics[ALines.Count - 1].Len := WCutoffChar;
          WCurChar := WStartChar + WCutOffChar;
          WSaveChar := WStartChar + WCutOffChar;
          WStartChar := WStartChar + WCutOffChar;
        end
        else
        begin
          ALines.Metrics[ALines.Count - 1].Len := WSaveChar - WStartChar;
          WStartChar := WSaveChar;
        end;
        ALines.Count := ALines.Count + 1;
        ALines.Metrics[ALines.Count - 1].Index :=
          ALines.Metrics[ALines.Count - 2].Index + ALines.Metrics[ALines.Count - 2].Len;
      end;

      WSaveChar := WCurChar;
      Tok := _WideGetToken(WCurChar, TmpS);
      if WSaveChar = WCurChar then
        Break; { !!! - error }
    end;
    ALines.Metrics[ALines.Count - 1].Len := WCurChar - WStartChar;
  end
  else
    ALines.Metrics[ALines.Count - 1].Len := Length(Tmps);
end;

function TCanvas.TextHeight(const AText: WideString): Single;
var
  R: TRectF;
begin
  R := RectF(0, 0, 10000, 10000);
  MeasureText(R, AText, False, [], TTextAlign.taLeading, TTextAlign.taLeading);
  Result := R.Bottom;
end;

function TCanvas.TextWidth(const AText: WideString): Single;
var
  R: TRectF;
begin
  R := RectF(0, 0, 10000, 20);
  MeasureText(R, AText, False, [], TTextAlign.taLeading, TTextAlign.taCenter);
  Result := R.Right;
end;

procedure TCanvas.FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
var
  P: TPathData;
begin
  P := TPathData.Create;
  P.AddArc(Center, Radius, StartAngle, SweepAngle);
  FillPath(P, AOpacity);
  P.Free;
end;

procedure TCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
var
  P: TPathData;
begin
  P := TPathData.Create;
  P.AddArc(Center, Radius, StartAngle, SweepAngle);
  DrawPath(P, AOpacity);
  P.Free;
end;

procedure TCanvas.SetStrokeDash(const Value: TStrokeDash);
begin
  if Value <> FStrokeDash then
  begin
    FStrokeDash := Value;
    case FStrokeDash of
      TStrokeDash.sdSolid:
        begin
          FDashOffset := 0;
          SetLength(FDash, 0);
        end;
      TStrokeDash.sdDash:
        begin
          FDashOffset := 0;
          SetLength(FDash, 2);
          FDash[0] := 1 * 3;
          FDash[1] := 1;
        end;
      TStrokeDash.sdDot:
        begin
          FDashOffset := 0;
          SetLength(FDash, 2);
          FDash[0] := 1;
          FDash[1] := 1;
        end;
      TStrokeDash.sdDashDot:
        begin
          FDashOffset := 0;
          SetLength(FDash, 4);
          FDash[0] := 1 * 3;
          FDash[1] := 1;
          FDash[2] := 1;
          FDash[3] := 1;
        end;
      TStrokeDash.sdDashDotDot:
        begin
          FDashOffset := 0;
          SetLength(FDash, 6);
          FDash[0] := 1 * 3;
          FDash[1] := 1;
          FDash[2] := 1;
          FDash[3] := 1;
          FDash[4] := 1;
          FDash[5] := 1;
        end;
      TStrokeDash.sdCustom:
        ;
    else
      FDashOffset := 0;
      SetLength(FDash, 0);
    end;
  end;
end;

function TCanvas.SaveState: TCanvasSaveState;
begin
  for Result in FCanvasSaveData do
  begin
    if not Result.Assigned then
    begin
      Result.Assign(Self);
      Exit;
    end;
  end;
  Result := CreateSaveState;
  try
    Result.Assign(Self);
    FCanvasSaveData.Add(Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure TCanvas.SetCustomDash(const Dash: array of Single; Offset: Single);
var
  I: Integer;
begin
  FStrokeDash := TStrokeDash.sdCustom;
  SetLength(FDash, Length(Dash));
  for I := 0 to High(Dash) do
    FDash[I] := Dash[I];
  FDashOffset := Offset;
end;

procedure TCanvas.SetFill(const Value: TBrush);
begin
  FFill.Assign(Value);
end;

procedure TCanvas.FillPolygon(const Points: TPolygon; const AOpacity: Single);
var
  I: Integer;
  Path: TPathData;
begin
  Path := TPathData.Create;
  for I := 0 to High(Points) do
  begin
    if I = 0 then
      Path.MoveTo(Points[I])
    else
    if (Points[I].X = ClosePolygon.X) and (Points[I].Y = ClosePolygon.Y) then
      Path.ClosePath
    else
      Path.LineTo(Points[I]);
  end;
  Path.ClosePath;
  FillPath(Path, AOpacity);
  Path.Free;
end;

procedure TCanvas.DrawPolygon(const Points: TPolygon; const AOpacity: Single);
var
  I: Integer;
  Path: TPathData;
begin
  Path := TPathData.Create;
  for I := 0 to High(Points) do
  begin
    if I = 0 then
      Path.MoveTo(Points[I])
    else
    if (Points[I].X = ClosePolygon.X) and (Points[I].Y = ClosePolygon.Y) then
      Path.ClosePath
    else
      Path.LineTo(Points[I]);
  end;
  DrawPath(Path, AOpacity);
  Path.Free;
end;

procedure TCanvas.DrawRectSides(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners;
  const AOpacity: Single; const ASides: TSides; const ACornerType: TCornerType = TCornerType.ctRound);
var
  Path: TPathData;
  X1, X2, Y1, Y2: Single;
  R: TRectF;
begin
  R := ARect;
  X1 := XRadius;
  if RectWidth(R) - (X1 * 2) < 0 then
    if X1 <> 0 then // guard divide by zero
      X1 := (XRadius * (RectWidth(R) / (X1 * 2)));
  X2 := X1 / 2;
  Y1 := YRadius;
  if RectHeight(R) - (Y1 * 2) < 0 then
    if Y1 <> 0 then // guard divide by zero
      Y1 := (YRadius * (RectHeight(R) / (Y1 * 2)));
  Y2 := Y1 / 2;
  Path := TPathData.Create;
  Path.MoveTo(PointF(R.Left, R.Top + Y1));
  if TCorner.crTopLeft in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        Path.LineTo(PointF(R.Left + X1, R.Top));
      TCornerType.ctInnerRound:
        Path.CurveTo(PointF(R.Left + X2, R.Top + Y1), PointF(R.Left + X1, R.Top + Y2), PointF(R.Left + X1, R.Top));
      TCornerType.ctInnerLine:
        begin
          Path.LineTo(PointF(R.Left + X2, R.Top + Y1));
          Path.LineTo(PointF(R.Left + X1, R.Top + Y2));
          Path.LineTo(PointF(R.Left + X1, R.Top));
        end;
    else
      Path.CurveTo(PointF(R.Left, R.Top + (Y2)), PointF(R.Left + X2, R.Top), PointF(R.Left + X1, R.Top))
    end;
  end
  else
  begin
    if TSide.sdLeft in ASides then
      Path.LineTo(PointF(R.Left, R.Top))
    else
      Path.MoveTo(PointF(R.Left, R.Top));
    if TSide.sdTop in ASides then
      Path.LineTo(PointF(R.Left + X1, R.Top))
    else
      Path.MoveTo(PointF(R.Left + X1, R.Top));
  end;
  if not(TSide.sdTop in ASides) then
    Path.MoveTo(PointF(R.Right - X1, R.Top))
  else
    Path.LineTo(PointF(R.Right - X1, R.Top));
  if TCorner.crTopRight in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        Path.LineTo(PointF(R.Right, R.Top + Y1));
      TCornerType.ctInnerRound:
        Path.CurveTo(PointF(R.Right - X1, R.Top + Y2), PointF(R.Right - X2, R.Top + Y1), PointF(R.Right, R.Top + Y1));
      TCornerType.ctInnerLine:
        begin
          Path.LineTo(PointF(R.Right - X1, R.Top + Y2));
          Path.LineTo(PointF(R.Right - X2, R.Top + Y1));
          Path.LineTo(PointF(R.Right, R.Top + Y1));
        end;
    else
      Path.CurveTo(PointF(R.Right - X2, R.Top), PointF(R.Right, R.Top + (Y2)), PointF(R.Right, R.Top + Y1))
    end;
  end
  else
  begin
    if TSide.sdTop in ASides then
      Path.LineTo(PointF(R.Right, R.Top))
    else
      Path.MoveTo(PointF(R.Right, R.Top));
    if TSide.sdRight in ASides then
      Path.LineTo(PointF(R.Right, R.Top + Y1))
    else
      Path.MoveTo(PointF(R.Right, R.Top + Y1));
  end;
  if not(TSide.sdRight in ASides) then
    Path.MoveTo(PointF(R.Right, R.Bottom - Y1))
  else
    Path.LineTo(PointF(R.Right, R.Bottom - Y1));
  if TCorner.crBottomRight in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        Path.LineTo(PointF(R.Right - X1, R.Bottom));
      TCornerType.ctInnerRound:
        Path.CurveTo(PointF(R.Right - X2, R.Bottom - Y1), PointF(R.Right - X1, R.Bottom - Y2),
          PointF(R.Right - X1, R.Bottom));
      TCornerType.ctInnerLine:
        begin
          Path.LineTo(PointF(R.Right - X2, R.Bottom - Y1));
          Path.LineTo(PointF(R.Right - X1, R.Bottom - Y2));
          Path.LineTo(PointF(R.Right - X1, R.Bottom));
        end;
    else
      Path.CurveTo(PointF(R.Right, R.Bottom - (Y2)), PointF(R.Right - X2, R.Bottom), PointF(R.Right - X1, R.Bottom))
    end;
  end
  else
  begin
    if TSide.sdRight in ASides then
      Path.LineTo(PointF(R.Right, R.Bottom))
    else
      Path.MoveTo(PointF(R.Right, R.Bottom));
    if TSide.sdBottom in ASides then
      Path.LineTo(PointF(R.Right - X1, R.Bottom))
    else
      Path.MoveTo(PointF(R.Right - X1, R.Bottom));
  end;
  if not(TSide.sdBottom in ASides) then
    Path.MoveTo(PointF(R.Left + X1, R.Bottom))
  else
    Path.LineTo(PointF(R.Left + X1, R.Bottom));
  if TCorner.crBottomLeft in ACorners then
  begin
    case ACornerType of
      // ctRound - default
      TCornerType.ctBevel:
        Path.LineTo(PointF(R.Left, R.Bottom - Y1));
      TCornerType.ctInnerRound:
        Path.CurveTo(PointF(R.Left + X1, R.Bottom - Y2), PointF(R.Left + X2, R.Bottom - Y1),
          PointF(R.Left, R.Bottom - Y1));
      TCornerType.ctInnerLine:
        begin
          Path.LineTo(PointF(R.Left + X1, R.Bottom - Y2));
          Path.LineTo(PointF(R.Left + X2, R.Bottom - Y1));
          Path.LineTo(PointF(R.Left, R.Bottom - Y1));
        end;
    else
      Path.CurveTo(PointF(R.Left + X2, R.Bottom), PointF(R.Left, R.Bottom - (Y2)), PointF(R.Left, R.Bottom - Y1))
    end;
  end
  else
  begin
    if TSide.sdBottom in ASides then
      Path.LineTo(PointF(R.Left, R.Bottom))
    else
      Path.MoveTo(PointF(R.Left, R.Bottom));
    if TSide.sdLeft in ASides then
      Path.LineTo(PointF(R.Left, R.Bottom - Y1))
    else
      Path.MoveTo(PointF(R.Left, R.Bottom - Y1));
  end;
  if (TSide.sdLeft in ASides) then
  begin
    Path.LineTo(PointF(R.Left, R.Top + Y1));
  end;
  DrawPath(Path, AOpacity);
  Path.Free;
end;

{ TAniThread }

type

  TAniThread = class(TTimer)
  private
    FAniList: TList;
    FStartTime, FTime, FDeltaTime: Single;
    procedure OneStep;
    procedure DoSyncTimer(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
  end;

constructor TAniThread.Create;
begin
  inherited Create(nil);
  if AniFrameRate < 5 then
    AniFrameRate := 5;
  Interval := trunc(1000 / AniFrameRate / 10) * 10;
  if (Interval <= 0) then Interval := 1;

  OnTimer := DoSyncTimer;
  FAniList := TList.Create;
  FStartTime := Platform.GetTick;
end;

destructor TAniThread.Destroy;
begin
  FreeAndNil(FAniList);
  inherited;
end;

procedure TAniThread.DoSyncTimer(Sender: TObject);
begin
  OneStep;
  if AniFrameRate < 5 then
    AniFrameRate := 5;
  Interval := trunc(1000 / AniFrameRate / 10) * 10;
  if (Interval <= 0) then Interval := 1;
end;

procedure TAniThread.OneStep;
var
  I: Integer;
  NewTime: Single;
begin
  NewTime := Platform.GetTick - FStartTime;
  if NewTime <= FTime then
    Exit;
  FDeltaTime := NewTime - FTime;
  FTime := NewTime;
  if FAniList.Count > 0 then
  begin
    I := FAniList.Count - 1;
    while I >= 0 do
    begin
      if TAnimation(FAniList[I]).FRunning then
      begin
        if (TAnimation(FAniList[I]).BindingName <> '') and
          (CompareText(TAnimation(FAniList[I]).BindingName, 'caret') = 0) then
        begin
          TAnimation(FAniList[I]).Tag := TAnimation(FAniList[I]).Tag + 1;
          if TAnimation(FAniList[I]).Tag mod 12 = 0 then
          begin
            TAnimation(FAniList[I]).ProcessTick(FTime, FDeltaTime);
          end;
        end
        else
          TAnimation(FAniList[I]).ProcessTick(FTime, FDeltaTime);
      end;
      dec(I);
      if I >= FAniList.Count then
        I := FAniList.Count - 1;
    end;
  end;
end;

{ TAnimation }

constructor TAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := False;
  Duration := 0.2;
end;

destructor TAnimation.Destroy;
begin
  if AniThread <> nil then
    TAniThread(AniThread).FAniList.Remove(Self);
  inherited;
end;

procedure TAnimation.Loaded;
begin
  inherited;
  if not(csDesigning in ComponentState) and Enabled then
    Start;
end;

procedure TAnimation.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if not(csDesigning in ComponentState) and not(csLoading in ComponentState) and
      not(csReading in ComponentState) then
    begin
      if FEnabled then
        Start
      else
        Stop;
    end;
  end;
end;

function TAnimation.NormalizedTime: Single;
begin
  if (FDuration > 0) and (FDelayTime <= 0) then
  begin
    case FInterpolation of
      TInterpolationType.itLinear:
        Result := InterpolateLinear(FTime, 0, 1, FDuration);
      TInterpolationType.itQuadratic:
        Result := InterpolateQuad(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itCubic:
        Result := InterpolateCubic(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itQuartic:
        Result := InterpolateQuart(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itQuintic:
        Result := InterpolateQuint(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itSinusoidal:
        Result := InterpolateSine(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itExponential:
        Result := InterpolateExpo(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itCircular:
        Result := InterpolateCirc(FTime, 0, 1, FDuration, FAnimationType);
      TInterpolationType.itElastic:
        Result := InterpolateElastic(FTime, 0, 1, FDuration, 0, 0, FAnimationType);
      TInterpolationType.itBack:
        Result := InterpolateBack(FTime, 0, 1, FDuration, 0, FAnimationType);
      TInterpolationType.itBounce:
        Result := InterpolateBounce(FTime, 0, 1, FDuration, FAnimationType);
    end;
  end
  else
    Result := 0;
end;

procedure TAnimation.ProcessAnimation;
begin
end;

procedure TAnimation.ProcessTick(time, deltaTime: Single);
begin
  inherited;
  if (csDesigning in ComponentState) then
    Exit;
  if csDestroying in ComponentState then
    Exit;

  if (Parent <> nil) and (Parent.IsIControl) and (not Parent.AsIControl.Visible) then
    Stop;

  if not FRunning then
    Exit;
  if FPause then
    Exit;

  if (FDelay > 0) and (FDelayTime <> 0) then
  begin
    if FDelayTime > 0 then
    begin
      FDelayTime := FDelayTime - deltaTime;
      if FDelayTime <= 0 then
      begin
        Start;
        FDelayTime := 0;
      end;
    end;
    Exit;
  end;

  if FInverse then
    FTime := FTime - deltaTime
  else
    FTime := FTime + deltaTime;
  if FTime >= FDuration then
  begin
    FTime := FDuration;
    if FLoop then
    begin
      if FAutoReverse then
      begin
        FInverse := True;
        FTime := FDuration;
      end
      else
        FTime := 0;
    end
    else
      FRunning := False;
  end
  else if FTime <= 0 then
  begin
    FTime := 0;
    if FLoop then
    begin
      if FAutoReverse then
      begin
        FInverse := False;
        FTime := 0;
      end
      else
        FTime := FDuration;
    end
    else
      FRunning := False;
  end;

  ProcessAnimation;
  if Assigned(FOnProcess) then
    FOnProcess(Self);

  if not FRunning then
  begin
    if AniThread <> nil then
      TAniThread(AniThread).FAniList.Remove(Self);
    if Assigned(FOnFinish) then
      FOnFinish(Self);
  end;
end;

procedure TAnimation.Start;
begin
  if (Parent <> nil) and (Parent.IsIControl) and (not Parent.AsIControl.Visible) then
    Exit;
  if (Abs(FDuration) < 0.001) or (FRoot = nil) or (csDesigning in ComponentState) then
  begin
    { imediatly animation }
    FDelayTime := 0;
    if FInverse then
    begin
      FTime := 0;
      FDuration := 1;
    end
    else
    begin
      FTime := 1;
      FDuration := 1;
    end;
    FRunning := True;
    ProcessAnimation;
    FRunning := False;
    FTime := 0;
    FDuration := 0.00001;
    if Assigned(FOnFinish) then
      FOnFinish(Self);
  end
  else
  begin
    FDelayTime := FDelay;
    FRunning := True;
    if FInverse then
      FTime := FDuration
    else
      FTime := 0;
    if FDelay = 0 then
      ProcessAnimation;

    if AniThread = nil then
      AniThread := TAniThread.Create;

    if TAniThread(AniThread).FAniList.IndexOf(Self) < 0 then
      TAniThread(AniThread).FAniList.Add(Self);
    FEnabled := True;
  end;
end;

procedure TAnimation.Stop;
begin
  if not FRunning then
    Exit;

  if AniThread <> nil then
    TAniThread(AniThread).FAniList.Remove(Self);

  if FInverse then
    FTime := 0
  else
    FTime := FDuration;
  ProcessAnimation;
  FRunning := False;
  if Assigned(FOnFinish) then
    FOnFinish(Self);
end;

procedure TAnimation.StopAtCurrent;
begin
  if not FRunning then
    Exit;

  if AniThread <> nil then
    TAniThread(AniThread).FAniList.Remove(Self);

  if FInverse then
    FTime := 0
  else
    FTime := FDuration;
  FRunning := False;
  FEnabled := False;
  if Assigned(FOnFinish) then
    FOnFinish(Self);
end;

procedure TAnimation.StartTrigger(AInstance: TFmxObject; const ATrigger: WideString);
var
  StartValue: Boolean;
  Line, Setter, Prop, Value: AnsiString;
begin
  if AInstance = nil then
    Exit;
  if (FTriggerInverse <> '') and (Pos(LowerCase(ATrigger), LowerCase(FTriggerInverse)) > 0) then
  begin
    Line := FTriggerInverse;
    Setter := GetToken(Line, ';');
    StartValue := False;
    while Setter <> '' do
    begin
      Prop := GetToken(Setter, '=');
      Value := Setter;
      if GetPropInfo(AInstance, Prop, [{$IFDEF FPC}tkBool{$ELSE}tkEnumeration{$ENDIF}]) <> nil then
      begin
{$IFDEF FPC}
        StartValue := False;
        if (CompareText(Value, 'True') = 0) and (GetOrdProp(AInstance, Prop) > 0) then
          StartValue := True;
        if (CompareText(Value, 'False') = 0) and (GetOrdProp(AInstance, Prop) = 0) then
          StartValue := True;
{$ELSE}
        StartValue := CompareText(GetEnumProp(AInstance, Prop), Value) = 0;
{$ENDIF}
        if not StartValue then
          Break;
      end;
      Setter := GetToken(Line, ';');
    end;
    if StartValue then
    begin
      Inverse := True;
      Start;
      Exit;
    end;
  end;
  if (FTrigger <> '') and (Pos(LowerCase(ATrigger), LowerCase(FTrigger)) > 0) then
  begin
    Line := FTrigger;
    Setter := GetToken(Line, ';');
    StartValue := False;
    while Setter <> '' do
    begin
      Prop := GetToken(Setter, '=');
      Value := Setter;
      if GetPropInfo(AInstance, Prop, [{$IFDEF FPC}tkBool{$ELSE}tkEnumeration{$ENDIF}]) <> nil then
      begin
{$IFDEF FPC}
        StartValue := False;
        if (CompareText(Value, 'True') = 0) and (GetOrdProp(AInstance, Prop) > 0) then
          StartValue := True;
        if (CompareText(Value, 'False') = 0) and (GetOrdProp(AInstance, Prop) = 0) then
          StartValue := True;
{$ELSE}
        StartValue := CompareText(GetEnumProp(AInstance, Prop), Value) = 0;
{$ENDIF}
        if not StartValue then
          Exit;
      end;
      Setter := GetToken(Line, ';');
    end;
    if StartValue then
    begin
      if FTriggerInverse <> '' then
        Inverse := False;
      Start;
    end;
  end;
end;

{ TEffect }

constructor TEffect.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := True;
end;

destructor TEffect.Destroy;
begin
  inherited;
end;

function TEffect.GetOffset: TPointF;
begin
  Result := PointF(0, 0);
end;

function TEffect.GetRect(const ARect: TRectF): TRectF;
begin
  Result := ARect;
end;

procedure TEffect.ApplyTrigger(AInstance: TFmxObject; const ATrigger: WideString);
var
  StartValue: Boolean;
  Line, Setter, Prop, Value: AnsiString;
begin
  if FTrigger = '' then
    Exit;
  if AInstance = nil then
    Exit;
  if Pos(LowerCase(ATrigger), LowerCase(FTrigger)) = 0 then
    Exit;

  Line := FTrigger;
  Setter := GetToken(Line, ';');
  StartValue := False;
  while Setter <> '' do
  begin
    Prop := GetToken(Setter, '=');
    Value := Setter;
    if GetPropInfo(AInstance, Prop, [{$IFDEF FPC}tkBool{$ELSE}tkEnumeration{$ENDIF}]) <> nil then
    begin
{$IFDEF FPC}
      StartValue := False;
      if (CompareText(Value, 'True') = 0) and (GetOrdProp(AInstance, Prop) > 0) then
        StartValue := True;
      if (CompareText(Value, 'False') = 0) and (GetOrdProp(AInstance, Prop) = 0) then
        StartValue := True;
{$ELSE}
      StartValue := CompareText(GetEnumProp(AInstance, Prop), Value) = 0;
{$ENDIF}
    end;
    Setter := GetToken(Line, ';');
  end;
  Enabled := StartValue;
end;

procedure TEffect.UpdateParentEffects;
var
  SaveEnabled: Boolean;
begin
  if not(csLoading in ComponentState) then
    if (Parent <> nil) and (Parent is TControl) then
    begin
      TControl(Parent).UpdateEffects;
      TControl(Parent).FRecalcUpdateRect := True;
      TControl(Parent).FRecalcHasEffect := True;
      // update if enabled = False (erase effect )
      SaveEnabled := FEnabled;
      FEnabled := True;
      TControl(Parent).Repaint;
      FEnabled := SaveEnabled;
      TControl(Parent).FRecalcHasEffect := True;
    end;
end;

procedure TEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single);
begin
end;

procedure TEffect.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if (Parent <> nil) and (Parent is TControl) then
      TControl(Parent).RecalcHasEffect;
    UpdateParentEffects;
  end;
end;

{ TFmxObject }

constructor TFmxObject.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIndex := -1;
  FStored := True;
end;

destructor TFmxObject.Destroy;
var
  I: Integer;
begin
  { NotifList }
  if FNotifyList <> nil then
  begin
    for I := FNotifyList.Count - 1 downto 0 do
      IFreeNotification(FNotifyList[I]).FreeNotification(Self);
    FreeAndNil(FNotifyList);
  end;
  { Remove from ResorcesList }
  RemoveResource(Self);
  { }
  if FParent <> nil then
    FParent.RemoveObject(Self);
  FRoot := nil;
  DeleteChildren;
  FreeAndNil(FTabList);
  inherited;
end;

procedure TFmxObject.Release(Delay: Single = 0.1);
var
  ReleaseTimer: TTimer;
begin
  Parent := nil;
  ReleaseTimer := TTimer.Create(Self);
  ReleaseTimer.OnTimer := DoReleaseTimer;
  ReleaseTimer.Interval := round(Delay * 1000);
  ReleaseTimer.Enabled := True;
end;

procedure TFmxObject.DoReleaseTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  Free;
end;

function TFmxObject.ItemClass: WideString;
begin
  Result := '';
end;

procedure TFmxObject.AddFreeNotify(const AObject: IFreeNotification);
begin
  if FNotifyList = nil then
    FNotifyList := TList.Create;
  FNotifyList.Add(Pointer(AObject));
end;

procedure TFmxObject.RemoveFreeNotify(const AObject: IFreeNotification);
begin
  if FNotifyList <> nil then
    FNotifyList.Remove(Pointer(AObject));
end;

procedure TFmxObject.RemoveObject(Index: Integer);
begin
  if (FChildren <> nil) and (Index < FChildren.Count) then
    RemoveObject(FChildren[Index]);
end;

procedure TFmxObject.FreeNotification(AObject: TObject);
begin
  if AObject is TComponent then
    Notification(TComponent(AObject), opRemove);
end;

procedure TFmxObject.ReaderSetName(Reader: TReader; Component: TComponent; var Name: String);
begin
  Name := '';
end;

procedure TFmxObject.ReaderError(Reader: TReader; const Message: String; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TFmxObject.LoadFromStream(const AStream: TStream);
var
  BinStream: TStream;
begin
  { store }
  BinStream := TMemoryStream.Create;
  try
    ObjectTextToBinary(AStream, BinStream);
    BinStream.Position := 0;
    LoadFromBinStream(BinStream);
  finally
    BinStream.Free;
  end;
end;

{$IFDEF FPC}
function TFmxObject.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
end;

function TFmxObject.OnCanObserve(const ID: Integer): Boolean;
begin
  Result := False;
end;

function TFmxObject.GetObservers: TObservers;
begin
  if FObservers = nil then
  begin
    FObservers := TObservers.Create;
  end;
  Result := FObservers;
end;

procedure TFmxObject.OnObserverAdded(const ID: Integer; const Observer: IObserver);
begin
end;

procedure TFmxObject.ObserverAdded(const ID: Integer; const Observer: IObserver);
begin

end;
{$ENDIF}

procedure TFmxObject.SaveToStream(const Stream: TStream);
var
  BinStream: TStream;
begin
  { store }
  BinStream := TMemoryStream.Create;
  try
    BinStream.WriteComponent(Self);
    BinStream.Position := 0;
    ObjectBinaryToText(BinStream, Stream);
  finally
    BinStream.Free;
  end;
end;

procedure TFmxObject.LoadFromBinStream(const AStream: TStream);
var
  R: TReader;
begin
  R := TReader.Create(AStream, 1024);
  R.OnError := ReaderError;
  try
    R.ReadRootComponent(Self);
  finally
    R.Free;
  end;
end;

procedure TFmxObject.SaveToBinStream(const AStream: TStream);
begin
  AStream.WriteComponent(Self);
end;

procedure TFmxObject.InsertObject(Index: Integer; AObject: TFmxObject);
var
  I: Integer;
  Obj: IControl;
begin
  if AObject <> nil then
  begin
    if AObject.Parent <> nil then
    begin
      AObject.Parent := nil;
      if FChildren <> nil  then
        if FChildren.Count = 0 then
          Index := 0
        else
          if Index > FChildren.Count - 1 then
            Index := FChildren.Count - 1;
    end;
    if FChildren = nil then
    begin
      FChildren := TList.Create;
      FChildren.Capacity := 10;
    end;
    if FChildren.IndexOf(AObject) < 0 then
    begin
      FChildren.Insert(Index, AObject);
      AObject.FParent := Self;
      AObject.SetRoot(FRoot);
      AObject.ChangeParent;
      if csDesigning in ComponentState then
        AObject.SetDesign(True, True);
      if (IInterface(AObject).QueryInterface(IControl, Obj) = 0) then
      begin
        if FTabList = nil then
          FTabList := TList.Create;
        FTabList.Add(Pointer(Obj));
      end;
      if Index < FChildren.Count - 1 then
        for I := Index to FChildren.Count - 1 do
          TFmxObject(FChildren[I]).FIndex := -1;
    end;
  end;
end;

procedure TFmxObject.IntLoadFromBinStream(const AStream: TStream);
var
  R: TReader;
begin
  R := TReader.Create(AStream, 1024);
  R.OnSetName := ReaderSetName;
  R.OnError := ReaderError;
  try
    R.ReadRootComponent(Self);
  finally
    R.Free;
  end;
end;

procedure TFmxObject.IntSaveToBinStream(const AStream: TStream);
var
  SaveName: WideString;
begin
  { store }
  SaveName := Name;
  Name := '';
  AStream.WriteComponent(Self);
  Name := SaveName;
end;

function TFmxObject.IsIControl: Boolean;
begin
  Result := GetInterfaceEntry(IControl) <> nil;
end;

function TFmxObject.IsChildren(AObject: TFmxObject): Boolean;
begin
  Result := False;
  while not Result and Assigned(AObject) do
  begin
    Result := AObject.Equals(Self);
    if not Result then
      AObject := AObject.Parent;
  end;
end;

function TFmxObject.AsIControl: IControl;
begin
  QueryInterface(IControl, Result);
end;

{$IFNDEF FPC}
function IsUniqueGlobalNameProc(const Name: string): Boolean;
begin
  if Length(Name) = 0 then
    Result := True
  else
    Result := FindGlobalComponent(Name) = nil;
end;
{$ENDIF}

function TFmxObject.Clone(const AOwner: TComponent): TFmxObject;
var
  S: TStream;
  SaveName: WideString;
{$IFNDEF FPC}
  FSaveIsUniqueGlobalComponentName: TIsUniqueGlobalComponentName;
{$ENDIF}
begin
  S := TMemoryStream.Create;
  try
    { store }
    SaveName := Name;
    Name := '';
    S.WriteComponent(Self);
    Name := SaveName;
    S.Position := 0;
    { load }
    Result := TFmxObjectClass(ClassType).Create(AOwner);
    if Result <> nil then
    begin
{$IFNDEF FPC}
      FSaveIsUniqueGlobalComponentName := IsUniqueGlobalComponentNameProc;
      IsUniqueGlobalComponentNameProc := IsUniqueGlobalNameProc;
      try
{$ENDIF}
        Result.IntLoadFromBinStream(S);
{$IFNDEF FPC}
      finally
        IsUniqueGlobalComponentNameProc := FSaveIsUniqueGlobalComponentName;
      end;
{$ENDIF}
    end;
  finally
    S.Free;
  end;
end;

procedure TFmxObject.CloneChildFromStream(AStream: TStream);
var
  I: Integer;
  Obj: TFmxObject;
begin
  Obj := CreateObjectFromStream(Self, AStream);
  if (Obj <> nil) and (Obj.FChildren <> nil) and (Obj.FChildren.Count > 0) then
  begin
    { delete self childs }
    DeleteChildren;
    { copy parent }
    for I := 0 to Obj.FChildren.Count - 1 do
    begin
      if TFmxObject(Obj.FChildren[0]) is TControl then
        TControl(Obj.FChildren[0]).Locked := True;
      TFmxObject(Obj.FChildren[0]).Stored := False;
      TFmxObject(Obj.FChildren[0]).Parent := Self;
    end;
    { realign to new size }
    if Obj is TControl and (Self is TControl) then
    begin
      TControl(Self).FLastWidth := TControl(Obj).Width;
      TControl(Self).FLastHeight := TControl(Obj).Height;
      TControl(Self).Realign;
    end;
  end;
end;

procedure TControl.SetLeft(const Value: Single);
begin
  FLeft := Value;
  if csReading in ComponentState then
    FExplicitLeft := FLeft;

end;

procedure TControl.SetLocked(const Value: Boolean);
begin
  FLocked := Value;
end;

function TFmxObject.HasClipParent: TControl;
var
  I: Integer;
begin
  Result := nil;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      if (TFmxObject(FChildren[I]) is TControl) and (TControl(FChildren[I]).ClipParent) then
      begin
        Result := TControl(FChildren[I]);
        Exit;
      end;
end;

function TControl.GetEffectsRect: TRectF;
var
  I: Integer;
begin
  Result := LocalRect;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if (TFmxObject(FChildren[I]) is TEffect) and (TEffect(FChildren[I]).Enabled) then
        Result := UnionRect(Result, TEffect(FChildren[I]).GetRect(LocalRect));
    end;
end;

function TControl.GetHeight: single;
begin
  Result := FHeight;
end;

function TControl.GetHitTest: Boolean;
begin
  Result := FHitTest;
end;

function TControl.GetAcceptsControls: Boolean;
begin
  Result := FAcceptsControls;
end;

function TControl.GetAbsoluteHasAfterPaintEffect: Boolean;
begin
  if FRecalcHasEffect then
    HasEffect; // Force recalc
  Result := FAbsoluteHasAfterPaintEffect;
end;

function TControl.GetAbsoluteHasDisablePaintEffect: Boolean;
begin
  if FRecalcHasEffect then
    HasEffect; // Force recalc
  Result := FAbsoluteHasDisablePaintEffect;
end;

function TControl.GetAbsoluteHasEffect: Boolean;
var
  I: Integer;
  NeedUpdate: Boolean;
begin
  if FRecalcHasEffect then
  begin
    FAbsoluteHasEffect := False;
    FAbsoluteHasDisablePaintEffect := False;
    FAbsoluteHasAfterPaintEffect := False;
    if FDisableEffect then
    begin
      Result := FAbsoluteHasEffect;
      Exit;
    end;
    NeedUpdate := False;
    if FChildren <> nil then
      for I := 0 to FChildren.Count - 1 do
      begin
        if (TFmxObject(FChildren[I]) is TEffect) and (TEffect(FChildren[I]).Enabled) then
        begin
          if not FAbsoluteHasEffect then
            NeedUpdate := True;
          FAbsoluteHasEffect := True;
          if TEffect(FChildren[I]).DisablePaint then
            FAbsoluteHasDisablePaintEffect := True;
          if TEffect(FChildren[I]).AfterPaint then
            FAbsoluteHasAfterPaintEffect := True;
          Break;
        end;
      end;
    FRecalcHasEffect := False;
    if NeedUpdate then
      UpdateEffects;
  end;
  Result := FAbsoluteHasEffect;
end;

procedure TControl.RecalcHasEffect;
begin
  FRecalcHasEffect := True;
  if (Parent <> nil) and (Parent is TControl) then
    TControl(Parent).RecalcHasEffect;
end;

{ Property animation }

procedure TFmxObject.AnimateColor(const APropertyName: WideString; NewValue: TAlphaColor; Duration: Single = 0.2;
  AType: TAnimationType = TAnimationType.atIn;
  AInterpolation: TInterpolationType = TInterpolationType.itLinear);
var
  A: TColorAnimation;
begin
  StopPropertyAnimation(APropertyName);
  A := TColorAnimation.Create(Self);
  A.Parent := Self;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.OnFinish := DoAniFinished;
  A.Duration := Duration;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := True;
  A.StopValue := NewValue;
  A.Start;
end;

procedure TFmxObject.AnimateFloat(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
  AType: TAnimationType = TAnimationType.atIn;
  AInterpolation: TInterpolationType = TInterpolationType.itLinear);
var
  A: TFloatAnimation;
begin
  StopPropertyAnimation(APropertyName);
  A := TFloatAnimation.Create(Self);
  A.Parent := Self;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.OnFinish := DoAniFinished;
  A.Duration := Duration;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := True;
  A.StopValue := NewValue;
  A.Start;
end;

procedure TFmxObject.AnimateFloatDelay(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
  Delay: Single = 0.0; AType: TAnimationType = TAnimationType.atIn;
  AInterpolation: TInterpolationType = TInterpolationType.itLinear);
var
  A: TFloatAnimation;
begin
  A := TFloatAnimation.Create(Self);
  A.Parent := Self;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.Delay := Delay;
  A.Duration := Duration;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := True;
  A.StopValue := NewValue;
  A.Start;
end;

procedure TFmxObject.AnimateFloatWait(const APropertyName: WideString; const NewValue: Single; Duration: Single = 0.2;
  AType: TAnimationType = TAnimationType.atIn;
  AInterpolation: TInterpolationType = TInterpolationType.itLinear);
var
  A: TFloatAnimation;
begin
  StopPropertyAnimation(APropertyName);
  A := TFloatAnimation.Create(Self);
  try
    A.Parent := Self;
    A.AnimationType := AType;
    A.Interpolation := AInterpolation;
    A.Duration := Duration;
    A.PropertyName := APropertyName;
    A.StartFromCurrent := True;
    A.StopValue := NewValue;
    A.Start;
    while A.FRunning do
    begin
      Application.ProcessMessages;
      Sleep(0);
    end;
  finally
    A.Free;
  end;
end;

procedure TFmxObject.StopPropertyAnimation(const APropertyName: WideString);
var
  i: Integer;
begin
  for i := 0 to ChildrenCount - 1 do
  begin
    if (Children[i] is TFloatAnimation) and (CompareText(TFloatAnimation(Children[i]).PropertyName, APropertyName) = 0) then
    begin
      TFloatAnimation(Children[i]).Stop;
    end;
    if (Children[i] is TColorAnimation) and (CompareText(TColorAnimation(Children[i]).PropertyName, APropertyName) = 0) then
    begin
      TColorAnimation(Children[i]).Stop;
    end;
  end;
end;

procedure TFmxObject.DoAniFinished(Sender: TObject);
begin
  TAnimation(Sender).Free;
end;

{ Animations }

procedure TFmxObject.StartAnimation(const AName: WideString);
var
  I: Integer;
  E: TAnimation;
begin
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if TFmxObject(FChildren[I]) is TAnimation then
        if CompareText(TAnimation(FChildren[I]).Name, AName) = 0 then
        begin
          E := TAnimation(FChildren[I]);
          E.Start;
        end;
    end;
end;

procedure TFmxObject.StopAnimation(const AName: WideString);
var
  I: Integer;
  E: TAnimation;
begin
  if FChildren <> nil then
    for I := FChildren.Count - 1 downto 0 do
      if TFmxObject(FChildren[I]) is TAnimation then
        if CompareText(TAnimation(FChildren[I]).Name, AName) = 0 then
        begin
          E := TAnimation(FChildren[I]);
          E.Stop;
        end;
end;

procedure TFmxObject.StartTriggerAnimation(AInstance: TFmxObject; const ATrigger: WideString);
var
  I: Integer;
begin
  StopTriggerAnimation(AInstance);
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if TFmxObject(FChildren[I]) is TAnimation then
        TAnimation(FChildren[I]).StartTrigger(AInstance, ATrigger);
      { locked objects }
      if TFmxObject(FChildren[I]).IsIControl and Children[I].AsIControl.Locked and
        not Children[I].AsIControl.HitTest then
      begin
        TFmxObject(FChildren[I]).StartTriggerAnimation(AInstance, ATrigger);
      end;
    end;
end;

procedure TFmxObject.StartTriggerAnimationWait(AInstance: TFmxObject; const ATrigger: WideString);
var
  I: Integer;
begin
  StopTriggerAnimation(AInstance);
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if TFmxObject(FChildren[I]) is TAnimation then
      begin
        TAnimation(FChildren[I]).StartTrigger(AInstance, ATrigger);
        while TAnimation(FChildren[I]).Running do
        begin
          Application.ProcessMessages;
          Sleep(0);
        end;
      end;
      { locked objects }
      if TFmxObject(FChildren[I]).IsIControl and Children[I].AsIControl.Locked and
        not Children[I].AsIControl.HitTest then
      begin
        TFmxObject(FChildren[I]).StartTriggerAnimationWait(AInstance, ATrigger);
      end;
    end;
end;

procedure TFmxObject.StopTriggerAnimation(AInstance: TFmxObject);
var
  I: Integer;
  E: TAnimation;
begin
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if TFmxObject(FChildren[I]) is TAnimation then
        if TAnimation(FChildren[I]).Trigger <> '' then
        begin
          E := TAnimation(FChildren[I]);
          E.Stop;
        end;
      { locked objects }
      if TFmxObject(FChildren[I]).IsIControl and Children[I].AsIControl.Locked and
        not Children[I].AsIControl.HitTest then
      begin
        TFmxObject(FChildren[I]).StopTriggerAnimation(AInstance);
      end;
    end;
end;

procedure TFmxObject.ApplyTriggerEffect(AInstance: TFmxObject; const ATrigger: WideString);
var
  I: Integer;
begin
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if TFmxObject(FChildren[I]) is TEffect then
        TEffect(FChildren[I]).ApplyTrigger(AInstance, ATrigger);
      { locked objects }
      if TFmxObject(FChildren[I]).IsIControl and Children[I].AsIControl.Locked and
        not Children[I].AsIControl.HitTest then
      begin
        TFmxObject(FChildren[I]).ApplyTriggerEffect(AInstance, ATrigger);
      end;
    end;
end;

procedure TFmxObject.SetRoot(ARoot: IRoot);
var
  I: Integer;
begin
  FRoot := ARoot;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for I := 0 to FChildren.Count - 1 do
      TFmxObject(FChildren[I]).SetRoot(FRoot);
end;

procedure TFmxObject.ChangeOrder;
begin
end;

procedure TFmxObject.ChangeParent;
begin
end;

procedure TFmxObject.SetParent(const Value: TFmxObject);
begin
  if Value = Self then Exit;
  if Parent <> Value then
  begin
    if IsChildren(Value) then
       raise EInvalidOperation.CreateRes(@SCannotCreateCircularDependence);
    if FParent <> nil then
      FParent.RemoveObject(Self);
    if Value <> nil then
      Value.AddObject(Self)
    else
      FParent := Value;
  end;
end;

function TFmxObject.GetChild(Index: Integer): TFmxObject;
begin
  if (FChildren <> nil) and (Index < FChildren.Count) then
    Result := TFmxObject(FChildren[Index])
  else
    Result := nil;
end;

function TFmxObject.GetChildrenCount: Integer;
begin
  if (FChildren <> nil) then
    Result := FChildren.Count
  else
    Result := 0;
end;

procedure TFmxObject.SetParentComponent(Value: TComponent);
var
  R: IRoot;
begin
  inherited;
  if FParent <> nil then
    FParent.RemoveObject(Self);

  if (Value <> nil) and (Value is TFmxObject) then
  begin
    TFmxObject(Value).AddObject(Self);
  end
  else if (IInterface(Value).QueryInterface(IRoot, R) = 0) then
  begin
    R.AddObject(Self);
  end
end;

procedure TFmxObject.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I, j: Integer;
begin
  inherited ;
  if (Self is TContent) then
    Exit;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if (TFmxObject(FChildren[I]) is TContent) and (TContent(FChildren[I]).FChildren <> nil) then
      begin
        for j := 0 to TContent(FChildren[I]).FChildren.Count - 1 do
          if TFmxObject(TContent(FChildren[I]).FChildren[j]).Stored then
            Proc(TComponent(TContent(FChildren[I]).FChildren[j]));
      end;
      if TFmxObject(FChildren[I]).Stored then
      begin
        Proc(TComponent(FChildren[I]));
      end;
    end;
end;

function TFmxObject.GetParentComponent: TComponent;
begin
  if (FParent <> nil) and (FParent is TContent) then
    Result := TContent(FParent).Parent
  else
  if (FParent <> nil) and (FParent is TComboListBox) then
    Result := TComboListBox(FParent).Parent
  else
    Result := FParent;
  if (Result = nil) and (FRoot <> nil) then
    Result := FRoot.GetObject;
end;

function TFmxObject.HasParent: Boolean;
begin
  Result := FParent <> nil;
end;

{ binding }

function TFmxObject.GetData: Variant;
begin
  Result := Name;
end;

procedure TFmxObject.SetData(const Value: Variant);
begin
end;

procedure TFmxObject.SetDesign(Value, SetChildren: Boolean);
var
  I: Integer;
begin
  SetDesigning(Value, SetChildren);
  if SetChildren then
    for I := 0 to ChildrenCount - 1 do
      Children[I].SetDesign(Value);
end;

function TFmxObject.GetBackIndex: Integer;
begin
  Result := 0;
end;

function TFmxObject.GetBinding(const Index: WideString): Variant;
var
  Obj: TFmxObject;
begin
  Obj := FindBinding(Index);
  if Obj <> nil then
    Result := Obj.Data
  else
    Result := '';
end;

procedure TFmxObject.SetBinding(const Index: WideString; const Value: Variant);
var
  Obj: TFmxObject;
begin
  Obj := FindBinding(Index);
  if Obj <> nil then
  begin
    try
      Obj.Data := Value;
    except
    end;
  end;
end;

function TFmxObject.FindBinding(const ABinding: WideString): TFmxObject;
var
  I: Integer;
begin
  Result := nil;
  if CompareText(BindingName, ABinding) = 0 then
  begin
    Result := Self;
    Exit;
  end;
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for I := 0 to FChildren.Count - 1 do
    begin
      if CompareText(TFmxObject(FChildren[I]).BindingName, ABinding) = 0 then
      begin
        Result := TFmxObject(FChildren[I]);
        Exit;
      end;
      Result := TFmxObject(FChildren[I]).FindBinding(ABinding);
      if Result <> nil then
        Exit;
    end;
  end;
end;

procedure TFmxObject.SetBindingName(const Value: WideString);
begin
  if FBindingName <> Value then
  begin
    FBindingName := Value;
  end;
end;

{ }

function TFmxObject.FindStyleResource(const AStyleLookup: WideString): TFmxObject;
var
  I: Integer;
begin
  Result := nil;
  if AStyleLookup = '' then
    Exit;
                                                                             
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for I := 0 to FChildren.Count - 1 do
    begin
      if CompareText(TFmxObject(FChildren[I]).StyleName, AStyleLookup) = 0 then
      begin
        Result := TFmxObject(FChildren[I]);
        Exit;
      end;
                                                                         
      if TFmxObject(FChildren[I]) is TStyledControl then
        Continue;

      Result := TFmxObject(FChildren[I]).FindStyleResource(AStyleLookup);
      if Result <> nil then
        Exit;
    end;
  end;
end;

procedure TFmxObject.SetStyleName(const Value: WideString);
var
  Idx: Integer;
begin
  if FStyleName <> Value then
  begin
    FStyleName := Value;
    if ResourceList <> nil then
    begin
      Idx := ResourceList.IndexOf(Self);
      if (Idx >= 0) and (FStyleName = '') then
        ResourceList.Delete(Idx);
    end;
    if (FStyleName <> '') and Stored then
      AddResource(Self);
  end;
end;

procedure TFmxObject.SetStored(const Value: Boolean);
var
  I: Integer;
begin
  if FStored <> Value then
  begin
    FStored := Value;
    if (FChildren <> nil) and (FChildren.Count > 0) then
    begin
      for I := 0 to FChildren.Count - 1 do
      begin
        TFmxObject(FChildren[I]).Stored := Value;
      end;
    end;
    if not Stored then
      RemoveResource(Self);
  end;
end;

procedure TFmxObject.UpdateStyle;
var
  I: Integer;
begin
  if csLoading in ComponentState then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for I := 0 to FChildren.Count - 1 do
    begin
      TFmxObject(FChildren[I]).UpdateStyle;
    end;
  end;
end;

procedure TFmxObject.DeleteChildren;
var
  I: Integer;
  Child: TFmxObject;
begin
  if Assigned(FChildren) then
  begin
    for I := FChildren.Count - 1 downto 0 do
    begin
      Child := TFmxObject(FChildren[I]);
      FChildren.Delete(I);
      Child.FParent := nil;
      Child.SetRoot(nil);
      Child.Free;
    end;
    FreeAndNil(FChildren);
  end;
  FreeAndNil(FTabList);
end;

procedure TFmxObject.AddObjectsToList(const AList: TList);
var
  I: Integer;
begin
  AList.Add(Self);
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      TFmxObject(FChildren[I]).AddObjectsToList(AList);
end;

procedure TFmxObject.AddControlsToList(const AList: TList);
var
  I: Integer;
begin
  if (Self is TStyledControl) then
    AList.Add(Self);
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      TFmxObject(FChildren[I]).AddControlsToList(AList);
end;

procedure TFmxObject.AddObject(AObject: TFmxObject);
begin
  if FChildren <> nil then
    InsertObject(FChildren.Count, AObject)
  else
    InsertObject(0, AObject);
end;

procedure TFmxObject.Sort(Compare: TFmxObjectSortCompare);
begin
  if FChildren <> nil then
    FChildren.Sort(TListSortCompare(Compare));
end;

function TFmxObject.GetIndex: Integer;
begin
  if (FIndex < 0) and (FParent <> nil) then
    FIndex := FParent.FChildren.IndexOf(Self);
  Result := FIndex;
end;

procedure TFmxObject.SetIndex(Idx: Integer);
var
  I: Integer;
begin
  if (Parent <> nil) and (Parent.FChildren.IndexOf(Self) >= 0) then
  begin
    Parent.FChildren.Remove(Self);
    if (Idx < 0) then
      Idx := 0;
    if (Idx > 0) and (Idx > Parent.FChildren.Count) then
      Idx := Parent.FChildren.Count;
    Parent.FChildren.Insert(Idx, Self);
    // recalc Index
    for I := 0 to Parent.FChildren.Count - 1 do
      TFmxObject(Parent.FChildren[I]).FIndex := -1;
    ChangeOrder;
  end;
end;

procedure TFmxObject.Exchange(AObject1, AObject2: TFmxObject);
var
  Idx: Integer;
begin
  if (FChildren <> nil) and (AObject1.Parent = Self) and (AObject2.Parent = Self) then
  begin
    FChildren.Exchange(AObject1.Index, AObject2.Index);
    Idx := AObject1.FIndex;
    AObject1.FIndex := AObject2.Index;
    AObject2.FIndex := Idx;
    ChangeOrder;
  end;
end;

procedure TFmxObject.RemoveObject(AObject: TFmxObject);
var
  I: Integer;
  Obj: IControl;
begin
  if Supports(AObject, IControl, Obj) and (FTabList <> nil) then
    FTabList.Remove(Pointer(Obj));
  if (FChildren <> nil) and (FChildren.IndexOf(AObject) >= 0) then
  begin
    AObject.FParent := nil;
    AObject.SetRoot(nil);
    if AObject.FIndex >= 0 then
      for I := AObject.FIndex to FChildren.Count - 1 do
        TFmxObject(FChildren[I]).FIndex := -1;
    FChildren.Remove(AObject);
  end;
end;

procedure TFmxObject.GetTabOrderList(const List: TList; AChildren: Boolean);
var
  I: Integer;
  Control: IControl;
begin
  if FTabList <> nil then
    for I := 0 to FTabList.Count - 1 do
    begin
      Control := IControl(FTabList[I]);
      List.Add(Pointer(Control));
      if AChildren and (Control.GetObject is TFmxObject) then
        TFmxObject(Control).GetTabOrderList(List, AChildren);
    end;
end;

procedure TFmxObject.FixupTabList;
var
  I, j: Integer;
  List: TList;
  Control: IControl;
begin
  if not(Root = nil) then
    Exit;
  if FTabList = nil then
    Exit;
  List := TList.Create;
  try
    List.Count := FTabList.Count;
    for I := 0 to FTabList.Count - 1 do
    begin
      Control := IControl(FTabList[I]);
      j := Control.GetTabOrderValue;
      if (j >= 0) and (j < FTabList.Count) then
        List[j] := Pointer(Control);
    end;
    for I := 0 to FTabList.Count - 1 do
    begin
      Control := IControl(List[I]);
      if Control <> nil then
        Control.UpdateTabOrder(I);
    end;
  finally
    List.Free;
  end;
end;

procedure TFmxObject.BringToFront;
var
  I: Integer;
begin
  if (Parent <> nil) and (Parent.FChildren <> nil) then
  begin
    Parent.FChildren.Remove(Self);
    Parent.FChildren.Add(Self);
    // recalc Index
    for I := 0 to Parent.FChildren.Count - 1 do
      TFmxObject(Parent.FChildren[I]).FIndex := -1;
    ChangeOrder;
  end;
end;

procedure TFmxObject.SendToBack;
var
  I: Integer;
begin
  if (Parent <> nil) and (Parent.FChildren <> nil) then
  begin
    Parent.FChildren.Remove(Self);
    Parent.FChildren.Insert(Parent.GetBackIndex, Self);
    // recalc Index
    for I := 0 to Parent.FChildren.Count - 1 do
      TFmxObject(Parent.FChildren[I]).FIndex := -1;
    ChangeOrder;
  end;
end;

{ TControl }

constructor TControl.Create(AOwner: TComponent);
begin
  inherited;
  FTabOrder := -1;
  FEnabled := True;
  FRecalcEnabled := True;
  FEnableDragHighlight := True;
  FDesignVisible := True;
  FOpacity := 1;
  FLocalMatrix := IdentityMatrix;
  FPosition := TPosition.Create(PointF(0, 0));
  FPosition.OnChange := MatrixChanged;
  FScale := TPosition.Create(PointF(1, 1));
  FScale.OnChange := MatrixChanged;
  FSkew := TPosition.Create(PointF(0, 0));
  FSkew.OnChange := MatrixChanged;
  FRotationCenter := TPosition.Create(PointF(0.5, 0.5));
  FRotationCenter.OnChange := MatrixChanged;
  FMargins := TBounds.Create(RectF(0, 0, 0, 0));
  FMargins.OnChange := MarginsChanged;
  FPadding := TBounds.Create(RectF(0, 0, 0, 0));
  FPadding.OnChange := PaddingChanged;
  FAnchors := [TAnchorKind.akLeft, TAnchorKind.akTop];
  FWidth := 50;
  FLastWidth := FWidth;
  FHeight := 50;
  FLastHeight := FHeight;
  FVisible := True;
  FHitTest := True;
  FRecalcAbsolute := True;
  FRecalcOpacity := True;
  FUpdateEffects := True;
  FRecalcUpdateRect := True;
  FCanFocus := False;
  FCanClip := True;
  FAcceptsControls := True;
end;

destructor TControl.Destroy;
begin
  FreeAndNil(FEffectBitmap);
  FMargins.Free;
  FPadding.Free;
  FRotationCenter.Free;
  FScale.Free;
  FSkew.Free;
  FPosition.Free;
  inherited;
end;

procedure TControl.Loaded;
begin
  inherited;
  FLastWidth := FWidth;
  FLastHeight := FHeight;
  MatrixChanged(Self);
  if (FChildren <> nil) and (FChildren.Count > 0) then
    Realign;
  FixupTabList;
end;

procedure TControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited ;
  if (Operation = opRemove) and (AComponent = FPopupMenu) then
    FPopupMenu := nil;
end;

procedure TControl.AddObject(AObject: TFmxObject);
begin
  inherited AddObject(AObject);
  if AObject = nil then
    Exit;
  if (AObject is TControl) and (TControl(AObject).Align <> TAlignLayout.alNone) then
    FNeedAlign := True;
  if (AObject is TEffect) and (TEffect(AObject).Enabled) then
  begin
    RecalcHasEffect;
    if not (csLoading in ComponentState) then
      Repaint;
  end;
  if (AObject is TControl) then
  begin
    TControl(AObject).SetNewScene(FScene);
    if TempCanvas <> nil then
      TControl(AObject).TempCanvas := TempCanvas;
    if FInPaintTo then
      TControl(AObject).FInPaintTo := True;
    TControl(AObject).FUpdating := TControl(Self).FUpdating;
    TControl(AObject).RecalcOpacity;
    TControl(AObject).RecalcAbsolute;
    TControl(AObject).RecalcUpdateRect;
    RecalcHasEffect;
    if HasEffect then
    begin
      UpdateEffects;
      Repaint;
    end;
    if (TControl(AObject).Align <> TAlignLayout.alNone) then
      Realign
    else
      Repaint;
  end;
end;

procedure TControl.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if (AObject is TControl) then
  begin
    TControl(AObject).FUpdating := 0;
    TControl(AObject).Repaint;
    TControl(AObject).SetNewScene(nil);
  end;
  if AObject is TEffect then
    RecalcHasEffect;
  if (AObject is TControl) then
  begin
    RecalcNeedAlign;
    if TControl(AObject).TempCanvas <> nil then
      TControl(AObject).TempCanvas := nil;
    if TControl(AObject).FInPaintTo then
      TControl(AObject).FInPaintTo := False;
  end;
end;

{ matrix }

procedure TControl.MatrixChanged(Sender: TObject);
var
  RotMatrix: TMatrix;
  M1, M2: TMatrix;
begin
  if (not FInPaintTo) and (FUpdating = 0) then
    Repaint;
  FLocalMatrix := IdentityMatrix;
  FLocalMatrix.m31 := FPosition.X;
  FLocalMatrix.m32 := FPosition.Y;
  FLocalMatrix.m11 := FScale.X;
  FLocalMatrix.m22 := FScale.Y;
  if FRotationAngle <> 0 then
  begin
    M1 := IdentityMatrix;
    M1.m31 := -FRotationCenter.X * FWidth { * FScale.X };
    M1.m32 := -FRotationCenter.Y * FHeight { * FScale.Y };
    M2 := IdentityMatrix;
    M2.m31 := FRotationCenter.X * FWidth { * FScale.X };
    M2.m32 := FRotationCenter.Y * FHeight { * FScale.Y };
    RotMatrix := MatrixMultiply(M1, MatrixMultiply(CreateRotationMatrix(DegToRad(FRotationAngle)), M2));
    FLocalMatrix := MatrixMultiply(RotMatrix, FLocalMatrix);
  end;
  RecalcAbsolute;
  RecalcUpdateRect;
  UpdateEffects;
  if (not FInPaintTo) and (FUpdating = 0) then
    Repaint;
end;

procedure TControl.RecalcUpdateRect;
var
  I: Integer;
begin
  if (Parent <> nil) and (Parent is TControl) and not(TControl(Parent).ClipChildren) and
    ((Position.X < 0) or (Position.Y < 0) or (Position.X + Width < TControl(Parent).Width) or
    (Position.Y + Height < TControl(Parent).Height)) then
    TControl(Parent).FRecalcUpdateRect := True;

  FRecalcUpdateRect := True;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if not(Children[I] is TControl) then
        Continue;
      TControl(FChildren[I]).RecalcUpdateRect;
    end;
end;

function TControl.GetUpdateRect: TRectF;
var
  R: TRectF;
  P: TFmxObject;
  I: Integer;
begin
  if FRecalcUpdateRect then
  begin
    FRecalcUpdateRect := False;
    FUpdating := FUpdating + 1;
    FUpdateRect := AbsoluteRect;
    if not(csLoading in ComponentState) then
    begin
      P := Parent;
      while (P <> nil) and (P is TControl) do
      begin
        if TControl(P).ClipChildren then
          IntersectRect(FUpdateRect, FUpdateRect, TControl(P).UpdateRect);
        P := P.Parent;
      end;
      { focused }
      if CanFocus and IsFocused then
        InflateRect(FUpdateRect, 5, 5);
      { Effects }
      if HasEffect and not ClipChildren then
      begin
        R := GetEffectsRect;
        with R do
          R := NormalizeRectF([LocalToAbsolute(PointF(Left, Top)), LocalToAbsolute(PointF(Right, Top)),
            LocalToAbsolute(PointF(Right, Bottom)), LocalToAbsolute(PointF(Left, Bottom))]);
        FUpdateRect := UnionRect(FUpdateRect, R);
      end;
      { Children }
      if not ClipChildren and (FChildren <> nil) then
      begin
        for I := 0 to FChildren.Count - 1 do
        begin
          if not(Children[I] is TControl) then
            Continue;
          if not TControl(FChildren[I]).Visible then
            Continue;
          R := TControl(FChildren[I]).UpdateRect;
          FUpdateRect := UnionRect(FUpdateRect, R);
        end;
      end;
      { inflate rect - remove antialiasing artefacts }
      if not FUpdateRect.IsEmpty then
        InflateRect(FUpdateRect, 1, 1);
    end;
    FUpdating := FUpdating - 1;
  end;
  Result := FUpdateRect;
end;

function TControl.GetVisible: Boolean;
begin
  Result := Visible;
end;

function TControl.GetWidth: single;
begin
  Result := FWidth;
end;

function TControl.GetChildrenRect: TRectF;
var
  I: Integer;
begin
  Result := AbsoluteRect;
  { children }
  if not ClipChildren and (FChildren <> nil) then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) and (TControl(FChildren[I]).Visible) then
        Result := UnionRect(Result, TControl(FChildren[I]).GetChildrenRect);
end;

function TControl.GetAbsoluteWidth: Single;
var
  V: TVector;
begin
  V := LocalToAbsoluteVector(Vector(Width, Height));
  Result := V.X;
end;

function TControl.GetAlign: TAlignLayout;
begin
  Result := FAlign;
end;

function TControl.GetAllowAlign: Boolean;
begin
  Result := Visible or ((FAnchors * [TAnchorKind.akRight, TAnchorKind.akBottom] <> []) and (FAlign = TAlignLayout.alNone));
end;

function TControl.GetAnchors: TAnchors;
begin
  Result := FAnchors;
end;

function TControl.GetAbsoluteHeight: Single;
var
  V: TVector;
begin
  V := LocalToAbsoluteVector(Vector(Width, Height));
  Result := V.Y;
end;

function TControl.GetAbsoluteScale: TPointF;
var
  P: TFmxObject;
begin
  Result := Scale.Point;
  P := Parent;
  while P <> nil do
  begin
    if P is TControl then
    begin
      Result.X := Result.X * TControl(P).Scale.X;
      Result.Y := Result.Y * TControl(P).Scale.Y;
    end;
    P := P.Parent;
  end;
end;

function TControl.GetChildrenMatrix: TMatrix;
begin
  Result := IdentityMatrix;
end;

function TControl.GetAbsoluteMatrix: TMatrix;
begin
  if FRecalcAbsolute then
  begin
    if (FParent <> nil) and (FParent is TControl) then
    begin
      FAbsoluteMatrix := MatrixMultiply(MatrixMultiply(FLocalMatrix, TControl(Parent).GetChildrenMatrix),
        TControl(Parent).AbsoluteMatrix);
    end
    else
      FAbsoluteMatrix := FLocalMatrix;

    Result := FAbsoluteMatrix;
    FInvAbsoluteMatrix := FAbsoluteMatrix;
    InvertMatrix(FInvAbsoluteMatrix);
    
    FRecalcAbsolute := False;
    if (not FInPaintTo) and (FUpdating = 0) then
      Repaint;
  end
  else
  begin
    Result := FAbsoluteMatrix;
  end;
end;

function TControl.GetInvertAbsoluteMatrix: TMatrix;
begin
  AbsoluteMatrix; // Force recalaculation if need
  Result := FInvAbsoluteMatrix;
end;

procedure TControl.RecalcAbsoluteNow;
var
  I: Integer;
  Child: TControl;
begin
  AbsoluteMatrix;
  // recalc
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if not(Children[I] is TControl) then
        Continue;
      Child := TControl(FChildren[I]);
      TControl(Child).RecalcAbsoluteNow;
    end;
end;

procedure TControl.RecalcAbsolute;
var
  I: Integer;
  Child: TControl;
begin
  FRecalcAbsolute := True;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if not(Children[I] is TControl) then
        Continue;
      Child := TControl(FChildren[I]);
      TControl(Child).RecalcAbsolute;
    end;
end;

function TControl.AbsoluteToLocalVector(P: TVector): TVector;
begin
  P.W := 0;
  if FInPaintTo then
    Result := VectorTransform(P, FInPaintToAbsMatrix)
  else
    Result := VectorTransform(P, InvertAbsoluteMatrix);
end;

function TControl.LocalToAbsoluteVector(P: TVector): TVector;
begin
  P.W := 0;
  if FInPaintTo then
    Result := VectorTransform(P, FInPaintToInvMatrix)
  else
    Result := VectorTransform(P, AbsoluteMatrix);
end;

function TControl.AbsoluteToLocal(P: TPointF): TPointF;
var
  V: TVector;
begin
  V.X := P.X;
  V.Y := P.Y;
  V.W := 1;
  if FInPaintTo then
    V := VectorTransform(V, FInPaintToInvMatrix)
  else
    V := VectorTransform(V, InvertAbsoluteMatrix);
  Result.X := V.X;
  Result.Y := V.Y;
end;

function TControl.LocalToAbsolute(P: TPointF): TPointF;
var
  V: TVector;
begin
  V.X := P.X;
  V.Y := P.Y;
  V.W := 1;
  if FInPaintTo then
    V := VectorTransform(V, FInPaintToAbsMatrix)
  else
    V := VectorTransform(V, AbsoluteMatrix);
  Result := PointF(V.X, V.Y);
end;

{ Opacity }

function TControl.GetAbsoluteOpacity: Single;
begin
  if FRecalcOpacity then
  begin
    if (FParent <> nil) and (FParent is TControl) then
      FAbsoluteOpacity := FOpacity * TControl(Parent).AbsoluteOpacity
    else
      FAbsoluteOpacity := FOpacity;

    if not AbsoluteEnabled { and (FScene <> nil) {and ((FScene.GetRoot <> Self) and (FScene.GetRoot <> Parent)) }
    then
      FAbsoluteOpacity := FAbsoluteOpacity * 0.8;

    Result := FAbsoluteOpacity;

    FRecalcOpacity := False;
  end
  else
  begin
    Result := FAbsoluteOpacity;
  end;
end;

procedure TControl.RecalcOpacity;
var
  I: Integer;
  Child: TControl;
begin
  FRecalcOpacity := True;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if not(Children[I] is TControl) then
        Continue;
      Child := TControl(FChildren[I]);
      TControl(Child).RecalcOpacity;
    end;
end;

{ methods }

procedure TControl.CreateCaret;
var
  A: TFloatAnimation;
begin
  if FCaret = nil then
  begin
    FCaret := TRectangle.Create(Self);
    FCaret.Parent := Self;
    FCaret.Width := 3;
    FCaret.Height := 20;
    FCaret.Stored := False;
    FCaret.HitTest := False;
    FCaret.Locked := True;
    TRectangle(FCaret).Fill.Color := TAlphaColors.Blue;
    TRectangle(FCaret).Stroke.Kind := TBrushKind.bkNone;
    if (FScene <> nil) and (FScene.GetAnimatedCaret) then
    begin
      A := TFloatAnimation.Create(Self);
      A.BindingName := 'caret';
      A.Parent := FCaret;
      A.StartValue := 1;
      A.Duration := 0.001;
      A.PropertyName := 'Opacity';
      A.StopValue := 0;
      A.AutoReverse := True;
      A.Loop := True;
      A.Enabled := False;
    end;
    FCaret.Visible := False;
  end;
end;

procedure TControl.ShowCaretProc;
begin
  if FCaret = nil then
    CreateCaret;

  FCaret.Visible := True;
  if (FCaret.FindBinding('caret') <> nil) and not TFloatAnimation(FCaret.FindBinding('caret')).Running then
    TFloatAnimation(FCaret.FindBinding('caret')).Start;
end;

procedure TControl.SetCaretPos(const APoint: TPointF);
begin
  if FCaret = nil then
    CreateCaret;
  FCaret.Opacity := 1;
  FCaret.Position.Point := PointF(round(APoint.X), round(APoint.Y));
end;

procedure TControl.SetCaretSize(const ASize: TPointF);
begin
  if FCaret = nil then
    CreateCaret;
  FCaret.Width := ASize.X;
  FCaret.Height := ASize.Y;
end;

procedure TControl.SetCaretColor(const AColor: TAlphaColor);
begin
  if FCaret = nil then
    CreateCaret;
  TRectangle(FCaret).Fill.Color := AColor;
end;

procedure TControl.HideCaret;
begin
  if FCaret <> nil then
    FCaret.Visible := False;
end;

function TControl.PointInObject(X, Y: Single): Boolean;
var
  P: TPointF;
begin
  Result := False;
  P := AbsoluteToLocal(PointF(X, Y));
  if (P.X >= 0) and (P.X <= Width) and (P.Y >= 0) and (P.Y <= Height) then
  begin
    Result := True;
  end;
end;

function TControl.ScreenToLocal(P: TPointF): TPointF;
begin
  if Scene <> nil then
    Result := AbsoluteToLocal(Scene.ScreenToLocal(P))
  else
    Result := AbsoluteToLocal(P);
end;

function TControl.LocalToScreen(P: TPointF): TPointF;
begin
  if Scene <> nil then
    Result := Scene.LocalToScreen(LocalToAbsolute(P))
  else
    Result := LocalToAbsolute(P);
end;

procedure TControl.ChangeOrder;
var
  AlignRoot: IAlignRoot;
begin
  inherited;
  if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
    AlignRoot.Realign;
  Repaint;
end;

function TControl.CheckForAllowFocus: Boolean;
begin
  Result := ParentedVisible and CanFocus and AbsoluteEnabled
end;

function TControl.CheckHitTest(const AHitTest: Boolean): Boolean;
begin
  Result := FHitTest;
  if (csDesigning in ComponentState) then
    Result := True;
  if (csDesigning in ComponentState) and FLocked then
    Result := False;
  if (csDesigning in ComponentState) and not FDesignVisible then
    Result := False;
end;

function TControl.FillTextFlags: TFillTextFlags;
begin
  if (FRoot <> nil) and (FRoot.BiDiMode = bdRightToLeft) then
  begin
    Result := [TFillTextFlag.ftRightToLeft]
  end
  else
    Result := [];
end;

function TControl.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  I: Integer;
  NewObj: IControl;
  LP: TPointF;
begin
  Result := nil;
  if not Visible then
    Exit;
  if not AbsoluteEnabled and not(csDesigning in ComponentState) then
    Exit;
  LP := P;
  if FScene <> nil then
    LP := FScene.ScreenToLocal(LP);
  if ClipChildren and not PointInObject(LP.X, LP.Y) then
    Exit;
  if FChildren <> nil then
    for I := FChildren.Count - 1 downto 0 do
    begin
      if TFmxObject(FChildren[I]).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.Visible then
        Continue;

      NewObj := NewObj.FindTarget(P, Data);
      if NewObj <> nil then
      begin
        Result := NewObj;
        Exit;
      end;
    end;

  if PointInObject(LP.X, LP.Y) and CheckHitTest(HitTest) then
    Result := Self;
end;

function TControl.ObjectAtPoint(P: TPointF): IControl;
var
  I: Integer;
  NewObj: IControl;
  LP: TPointF;
begin
  if not FDesignVisible and (csDesigning in ComponentState) then
  begin
    Result := nil;
    Exit;
  end;
  if not Visible and not(csDesigning in ComponentState) then
  begin
    Result := nil;
    Exit;
  end;
  if (Self is TStyledControl) and not TStyledControl(Self).AbsoluteEnabled and not(csDesigning in ComponentState) then
  begin
    Result := nil;
    Exit;
  end;
  LP := P;
  if FScene <> nil then
    LP := FScene.ScreenToLocal(LP);
  if ClipChildren and not PointInObject(LP.X, LP.Y) then
  begin
    Result := nil;
    Exit;
  end;
  if FChildren <> nil then
    for I := FChildren.Count - 1 downto 0 do
    begin
      if TFmxObject(FChildren[I]).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.GetVisible and not(csDesigning in ComponentState) then
        Continue;

      NewObj := NewObj.ObjectAtPoint(P);
      if NewObj <> nil then
      begin
        Result := NewObj;
        Exit;
      end;
    end;

  Result := nil;
  if PointInObject(LP.X, LP.Y) and CheckHitTest(HitTest) then
    Result := Self;
end;

function TControl.GetCanvas: TCanvas;
begin
  if FTempCanvas <> nil then
    Result := FTempCanvas
  else if FScene <> nil then
    Result := FScene.GetCanvas
  else
    Result := nil;
end;

procedure TControl.SetInPaintTo(Value: Boolean);
var
  I: Integer;
begin
  FInPaintTo := Value;
  FInPaintToAbsMatrix := AbsoluteMatrix;
  FInPaintToInvMatrix := InvertAbsoluteMatrix;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) then
        TControl(FChildren[I]).SetInPaintTo(Value);
end;

procedure TControl.PaintTo(const ACanvas: TCanvas; const ARect: TRectF; const AParent: TFmxObject = nil);
var
  CanvasState: TCanvasSaveState;
  SaveTempCanvas: TCanvas;
  SaveDisableAlign: Boolean;
  SavePos: TPointF;
  SaveScale: TPointF;
  SaveParent: TFmxObject;
  SaveRotate: Single;
  SaveInPaintTo: Boolean;
begin
  if Width * Height = 0 then
    Exit;
  // Force load resources
  ApplyStyleLookup;
  // Paintto
  SaveDisableAlign := FDisableAlign;
  SaveInPaintTo := FInPaintTo;
  FDisableAlign := True;
  try
    SetInPaintTo(True);
    SaveTempCanvas := TempCanvas;
    try
      TempCanvas := ACanvas;
      CanvasState := TempCanvas.SaveState;
      try
        { save }
        SavePos := Position.Point;
        SaveScale := Scale.Point;
        SaveParent := FParent;
        SaveRotate := RotationAngle;
        FParent := AParent;
        FPosition.FX := ARect.Left;
        FPosition.FY := ARect.Top;
        FScale.FX := RectWidth(ARect) / Width;
        FScale.FY := RectHeight(ARect) / Height;
        FRotationAngle := 0;
        MatrixChanged(Self);

        { paint }
        RecalcHasEffect;
        TempCanvas.SetMatrix(AbsoluteMatrix);
        Painting;
        DoPaint;
        AfterPaint;

        { restore }
        FRotationAngle := SaveRotate;
        FPosition.FX := SavePos.X;
        FPosition.FY := SavePos.Y;
        FScale.FX := SaveScale.X;
        FScale.FY := SaveScale.Y;
        FParent := SaveParent;
        MatrixChanged(Self);
        RecalcUpdateRect;
        RecalcAbsoluteNow;
        RecalcOpacity;
        RecalcEnabled;
        RecalcHasEffect;
      finally
        TempCanvas.RestoreState(CanvasState);
      end;
    finally
      TempCanvas := SaveTempCanvas;
    end;
  finally
    SetInPaintTo(SaveInPaintTo);
    FDisableAlign := SaveDisableAlign;
  end;
end;

procedure TControl.UpdateEffects;
begin
  if HasEffect then
    FUpdateEffects := True;
  if Parent is TControl then
    TControl(Parent).UpdateEffects;
end;

procedure TControl.UpdateExplicitBounds;
begin
if not (csReading in ComponentState) then
  begin
    FExplicitLeft := FLeft;
    FExplicitTop := FTop;
    FExplicitWidth := FWidth;
    FExplicitHeight := FHeight;
  end;
end;

procedure TControl.ApplyEffect;
var
  I: Integer;
  State: TCanvasSaveState;
  M: TMatrix;
  R: TRectF;
  Effect: TEffect;
  EffectRect: TRectF;
begin
  if FChildren = nil then
    Exit;
  if FScene = nil then
    Exit;
  if FDisableEffect then
    Exit;
  if not HasEffect then
    Exit;

  State := Canvas.SaveState;
  try
    if not FUpdateEffects then
    begin
      if FEffectBitmap <> nil then
      begin
        Canvas.SetMatrix(AbsoluteMatrix);
        for I := 0 to FChildren.Count - 1 do
          if (TFmxObject(FChildren[I]) is TEffect) and (TEffect(FChildren[I]).Enabled) then
          begin
            Effect := TEffect(FChildren[I]);
            EffectRect := Effect.GetRect(RectF(0, 0, Width, Height));
            Canvas.DrawBitmap(FEffectBitmap, RectF(0, 0, FEffectBitmap.Width, FEffectBitmap.Height), EffectRect, AbsoluteOpacity, RotationAngle = 0);
            Break;
          end;
      end;
    end
    else
    begin
      for I := 0 to FChildren.Count - 1 do
        if (TFmxObject(FChildren[I]) is TEffect) and (TEffect(FChildren[I]).Enabled) then
        begin
          Effect := TEffect(FChildren[I]);
          EffectRect := Effect.GetRect(RectF(0, 0, Width, Height));
          with GetAbsoluteScale do
            MultiplyRect(EffectRect, X, Y);
          if FEffectBitmap = nil then
          begin
            { create }
            FEffectBitmap := TBitmap.Create(trunc(RectWidth(EffectRect)), trunc(RectHeight(EffectRect)));
          end
          else if (FEffectBitmap.Width <> trunc(RectWidth(EffectRect))) or
            (FEffectBitmap.Height <> trunc(RectHeight(EffectRect))) then
          begin
            { resize }
            FEffectBitmap.SetSize(trunc(RectWidth(EffectRect)), trunc(RectHeight(EffectRect)));
          end;
          { Paint Self }
          if FEffectBitmap.Canvas.BeginScene then
          try
            FEffectBitmap.Canvas.Clear(0);
            FEffectBitmap.Canvas.SetMatrix(IdentityMatrix);
            R := RectF(Effect.GetOffset.X, Effect.GetOffset.Y, (Effect.GetOffset.X + Width), (Effect.GetOffset.Y + Height));
            with GetAbsoluteScale do
              MultiplyRect(R, X, Y);

            PaintTo(FEffectBitmap.Canvas, R);
          finally
            FEffectBitmap.Canvas.EndScene;
          end;
          { apply effects }
          with GetAbsoluteScale do
          begin
            Effect.ProcessEffect(FEffectBitmap.Canvas, FEffectBitmap, X);
            { draw effectBitmap }
            MultiplyRect(EffectRect, 1 / X, 1 / Y);
          end;
          Canvas.SetMatrix(AbsoluteMatrix);
          Canvas.DrawBitmap(FEffectBitmap, RectF(0, 0, FEffectBitmap.Width, FEffectBitmap.Height), 
            EffectRect, AbsoluteOpacity, RotationAngle = 0);
          Break;
        end; 
      FUpdateEffects := False;
    end;
  finally
    Canvas.RestoreState(State);
  end;
end;

procedure TControl.ApplyStyleLookup;
begin
end;

procedure TControl.Painting;
var
  State: TCanvasSaveState;
begin
  if ClipChildren then
  begin
    State := Canvas.SaveState;
    try
      Canvas.SetMatrix(AbsoluteMatrix);
      Canvas.IntersectClipRect(ClipRect);
      if Assigned(FOnPainting) then
        FOnPainting(Self, Canvas, LocalRect);
    finally
      Canvas.RestoreState(State);
    end;
  end
  else
  begin
    Canvas.SetMatrix(AbsoluteMatrix);
    if Assigned(FOnPainting) then
      FOnPainting(Self, Canvas, LocalRect);
  end;
end;

procedure TControl.Paint;
begin
end;

procedure TControl.DoPaint;
var
  ClipParentObject: TControl;
  State, State1: TCanvasSaveState;
  R: TRectF;
  B: TBitmap;
begin
  if FDisablePaint then Exit;

  if not HasDisablePaintEffect or FInPaintTo then
  begin
    ClipParentObject := HasClipParent;
    if ClipParentObject <> nil then
    begin
      State1 := Canvas.SaveState;
      try
        Canvas.SetMatrix(ClipParentObject.AbsoluteMatrix);
        R := ClipParentObject.LocalRect;
        Canvas.ExcludeClipRect(R);
        Canvas.SetMatrix(AbsoluteMatrix);

        if ClipChildren then
        begin
          // Clip self
          State := Canvas.SaveState;
          try
            Canvas.SetMatrix(AbsoluteMatrix);
            Canvas.IntersectClipRect(ClipRect);
            Paint;
          finally
            Canvas.RestoreState(State);
          end;
        end else
        begin
          Paint;
        end;
      finally
        Canvas.RestoreState(State1);
      end;
      PaintChildren;
      if Assigned(FOnPaint) then
      begin
        Canvas.SetMatrix(AbsoluteMatrix);
        FOnPaint(Self, Canvas, LocalRect);
      end;
    end
    else
    begin
      if ClipChildren then
      begin
        // Clip self
        State := Canvas.SaveState;
        try
          Canvas.SetMatrix(AbsoluteMatrix);
          Canvas.IntersectClipRect(ClipRect);
          Paint;
        finally
          Canvas.RestoreState(State);
        end;
      end
      else
      begin
        Paint;
      end;
      Canvas.SetMatrix(AbsoluteMatrix);
      PaintChildren;
      if Assigned(FOnPaint) then
      begin
        Canvas.SetMatrix(AbsoluteMatrix);
        FOnPaint(Self, Canvas, LocalRect);
      end;
    end;
  end;
  if IsDragOver and EnableDragHighlight then
  begin
    Canvas.SetMatrix(AbsoluteMatrix);
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $B2005ACC;
    Canvas.StrokeCap := TStrokeCap.scFlat;
    Canvas.StrokeJoin := TStrokeJoin.sjMiter;
    Canvas.StrokeDash := TStrokeDash.sdSolid;
    Canvas.StrokeThickness := 3;
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.DrawRect(R, 1, 1, AllCorners, 1);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
end;

procedure TControl.AfterPaint;
begin
end;

procedure TControl.PaintChildren;
var
  I, j: Integer;
  R: TRectF;
  State: TCanvasSaveState;
  AllowPaint: Boolean;
begin
  if FScene = nil then
    Exit;
  if FChildren <> nil then
  begin
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) and
        ((TControl(FChildren[I]).Visible) or (not TControl(FChildren[I]).Visible and (csDesigning in ComponentState) and not TControl(FChildren[I]).Locked)) then
        with TControl(FChildren[I]) do
        begin
          if (csDesigning in ComponentState) and not FDesignVisible then
            Continue;
          if not FInPaintTo and ((RectWidth(UpdateRect) = 0) or (RectHeight(UpdateRect) = 0)) then
            Continue;
          if Self.ClipChildren and not IntersectRect(Self.UpdateRect, UpdateRect) then
            Continue;
          // Check visibility
          AllowPaint := False;
          if (csDesigning in ComponentState) or FInPaintTo then
            AllowPaint := True;
          if not AllowPaint then
          begin
            R := UnionRect(GetChildrenRect, UpdateRect);
            for j := 0 to FScene.GetUpdateRectsCount - 1 do
              if IntersectRect(FScene.GetUpdateRect(j), R) then
              begin
                AllowPaint := True;
                Break;
              end;
          end;
          // Paint
          if AllowPaint then
          begin
            State := nil;
            try
              if Self.FClipChildren and CanClip then
              begin
                State := Canvas.SaveState;
                Canvas.SetMatrix(Self.AbsoluteMatrix);
                Canvas.IntersectClipRect(Self.ClipRect);
              end;
              if HasEffect and not HasAfterPaintEffect then
                ApplyEffect;
              Painting;
              DoPaint;
              AfterPaint;
            finally
              if State <> nil then
                Canvas.RestoreState(State);
            end;
            if HasAfterPaintEffect then
              ApplyEffect;
          end;
        end;
  end;
end;

function TControl.GetParentedVisible: Boolean;
var
  P: TFmxObject;
begin
  P := Self;
  Result := False;
  while P <> nil do
  begin
    if P is TControl and not TControl(P).Visible then
      Exit;
    P := P.Parent;
  end;
  Result := True;
end;

procedure TControl.InvalidateRect(ARect: TRectF);
begin
  if not Visible and not(csDesigning in ComponentState) then
    Exit;
  if FScene = nil then
    Exit;
  if (csDesigning in ComponentState) and not FDesignVisible then
    Exit;;
  if not(csDesigning in ComponentState) and not ParentedVisible then
    Exit;;
  ARect.TopLeft := LocalToAbsolute(ARect.TopLeft);
  ARect.BottomRight := LocalToAbsolute(ARect.BottomRight);
  FScene.AddUpdateRect(ARect);
end;

function TControl.IsAnchorsStored: Boolean;
begin
  Result := Anchors <> AnchorAlign[Align];
end;

procedure TControl.Repaint;
begin
  if not Visible and not(csDesigning in ComponentState) then
    Exit;
  if FScene = nil then
    Exit;
  if (csDesigning in ComponentState) and not FDesignVisible then
    Exit;;
  if not(csDesigning in ComponentState) and not ParentedVisible then
    Exit;
  if FUpdating > 0 then Exit;
  if HasDisablePaintEffect then
    UpdateEffects;
  if FInPaintTo then Exit;
  FScene.AddUpdateRect(UpdateRect);
end;

procedure TControl.Resize;
begin
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TControl.Lock;
var
  I: Integer;
begin
  Locked := True;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) then
        TControl(FChildren[I]).Lock;
end;

{ bounds }

function TControl.GetLeft: single;
begin
  Result := Position.X;
end;

function TControl.GetLocalRect: TRectF;
begin
  Result := RectF(0, 0, FWidth, FHeight);
end;

function TControl.GetLocked: Boolean;
begin
  Result := FLocked;
end;

function TControl.GetAbsoluteRect: TRectF;
begin
  Result := NormalizeRectF([LocalToAbsolute(PointF(0, 0)), LocalToAbsolute(PointF(Width, 0)),
    LocalToAbsolute(PointF(Width, Height)), LocalToAbsolute(PointF(0, Height))]);
end;

function TControl.GetClipRect: TRectF;
begin
  Result := RectF(0, 0, Width, Height);
end;

function TControl.GetContainerHeight: Single;
begin
  Result := Height;
end;

function TControl.GetContainerWidth: Single;
begin
  Result := Width;
end;

function TControl.GetCursor: TCursor;
begin
  Result := FCursor;
end;

function TControl.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TControl.GetDragMode: TDragMode;
begin
  Result := FDragMode;
end;

function TControl.GetBoundsRect: TRectF;
begin
  Result := RectF(0, 0, Width, Height);
end;

function TControl.GetPadding: TBounds;
begin
  Result := FPadding;
end;

function TControl.GetParent: TFmxObject;
begin
  Result := Parent;
end;

function TControl.GetParentedRect: TRectF;
begin
  Result := RectF(0, 0, Width, Height);
  OffsetRect(Result, Position.X, Position.Y);
end;

procedure TControl.SetBoundsRect(const Value: TRectF);
begin
  with Value do
    SetBounds(Left, Top, Right - Left, Bottom - Top);
end;

{ }

procedure TControl.PaddingChanged(Sender: TObject);
var
  AlignRoot: IAlignRoot;
begin
  if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
    AlignRoot.Realign;
end;

procedure TControl.MarginsChanged(Sender: TObject);
begin
  Realign;
end;

procedure TControl.BeginUpdate;
var
  I: Integer;
begin
  FUpdating := FUpdating + 1;
  for I := 0 to ChildrenCount - 1 do
    if (Children[I] is TControl) then
      TControl(FChildren[I]).BeginUpdate;
end;

procedure TControl.EndUpdate;
var
  I: Integer;
begin
  FUpdating := FUpdating - 1;
  for I := 0 to ChildrenCount - 1 do
    if (Children[I] is TControl) then
      TControl(FChildren[I]).EndUpdate;
  if FUpdating = 0 then
    Realign;
end;

procedure TControl.RecalcNeedAlign;
var
  I: Integer;
begin
  FNeedAlign := False;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
    begin
      if not((Children[I] is TControl)) then
        Continue;
      if TControl(FChildren[I]).Align <> TAlignLayout.alNone then
      begin
        FNeedAlign := True;
        Break;
      end;
    end;
end;

procedure TControl.Realign;
begin
  if csDestroying in ComponentState then
    Exit;
  if (Abs(FWidth) < 1) or (Abs(FHeight) < 1) then
    Exit;
  if FDisableDefaultAlign then
    Exit;
  if FDisableAlign then
    Exit;
  if FUpdating > 0 then
    Exit;
  if csLoading in ComponentState then
  begin
    FLastWidth := FWidth;
    FLastHeight := FHeight;
    Exit;
  end;
  if ((FLastWidth <> FWidth) or (FLastHeight <> FHeight)) and HasEffect then
    UpdateEffects;
  if not FNeedAlign then
    Exit;
  AlignObjects(Self, FMargins, FWidth, FHeight, FLastWidth, FLastHeight, FDisableAlign);
end;

{ events }

procedure TControl.KeyDown(var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
var
  VP: TPointF;
begin
  if (Key = vkApps) then
  begin
    VP := LocalToAbsolute(PointF(Width / 2, Height / 2));
    VP := Scene.LocalToScreen(VP);
    ContextMenu(VP);
  end
  else if Assigned(FOnKeyDown) then
    FOnKeyDown(Self, Key, KeyChar, Shift);
end;

procedure TControl.KeyUp(var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
begin
  if Assigned(FOnKeyUp) then
    FOnKeyUp(Self, Key, KeyChar, Shift);
end;

procedure TControl.DialogKey(var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) and (TControl(FChildren[I]).Visible or (Children[I] is TContent)) and TControl(FChildren[I]).Enabled
      then
      begin
        TControl(FChildren[I]).DialogKey(Key, Shift);
        if Key = 0 then
          Break;
      end;
end;

procedure TControl.Capture;
begin
  if (FRoot <> nil) then
    FRoot.Captured := Self;
end;

procedure TControl.ReleaseCapture;
begin
  if (FRoot <> nil) and (FRoot.Captured <> nil) and (FRoot.Captured.GetObject = Self) then
  begin
    FRoot.SetCaptured(nil);
  end;
end;

procedure TControl.DoMouseEnter;
begin
  FIsMouseOver := True;
  StartTriggerAnimation(Self, 'IsMouseOver');
  ApplyTriggerEffect(Self, 'IsMouseOver');
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TControl.DoMouseLeave;
begin
  FIsMouseOver := False;
  StartTriggerAnimation(Self, 'IsMouseOver');
  ApplyTriggerEffect(Self, 'IsMouseOver');
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

function TControl.EnterChildren(AObject: TControl): Boolean;
begin
  Result := False;
end;

procedure TControl.DoEnter;
var
  P: TFmxObject;
begin
  if not CanFocus then
    Exit;

  P := Parent;
  while P <> nil do
  begin
    if P is TControl then
      if TControl(P).EnterChildren(Self) then
        Break;
    P := P.Parent;
  end;
  FIsFocused := True;
  FRecalcUpdateRect := True;
  Repaint;
  if Assigned(FOnEnter) then
    FOnEnter(Self);
  if DisableFocusEffect then
    Exit;
  if GlobalDisableFocusEffect then
    Exit;
  StartTriggerAnimation(Self, 'IsFocused');
  ApplyTriggerEffect(Self, 'IsFocused');
end;

procedure TControl.SetNewScene(AScene: IScene);
var
  I: Integer;
begin
  if (AScene = nil) and (FIsFocused) then
    Exit;
  FScene := AScene;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for I := 0 to FChildren.Count - 1 do
      if TFmxObject(FChildren[I]) is TControl then
        TControl(FChildren[I]).SetNewScene(FScene);
end;

procedure TControl.DoExit;
begin
  if not CanFocus then
    Exit;

  FRecalcUpdateRect := True;
  Repaint;
  FIsFocused := False;
  if Assigned(FOnExit) then
    FOnExit(Self);
  if DisableFocusEffect then
    Exit;
  if GlobalDisableFocusEffect then
    Exit;
  StartTriggerAnimation(Self, 'IsFocused');
  ApplyTriggerEffect(Self, 'IsFocused');
end;

procedure TControl.SetFocus;
var
  C: Boolean;
begin
  if not CanFocus then
    Exit;
  if Assigned(FOnCanFocus) then
  begin
    C := True;
    FOnCanFocus(Self, C);
    if not C then
      Exit;
  end;
  FRoot.SetFocused(Self);
end;

procedure TControl.ContextMenu(const ScreenPosition: TPointF);
begin
  if FPopupMenu <> nil then
  begin
    FPopupMenu.PopupComponent := Self;
    FPopupMenu.Popup(round(ScreenPosition.X), round(ScreenPosition.Y));
    Exit;
  end;
end;

procedure TControl.Click;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TControl.DblClick;
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Self);
end;

function TControl.MakeScreenshot: TBitmap;
begin
  Result := TBitmap.Create(round(Width), round(Height));
  Result.Clear(0);

  if Result.Canvas.BeginScene then
  try
    PaintTo(Result.Canvas, RectF(0, 0, Result.Width, Result.Height));
  finally
    Result.Canvas.EndScene;
  end;
end;

procedure TControl.BeginAutoDrag;
var
  B, S: TBitmap;
  R: TRectF;
begin
  S := MakeScreenshot;
  try
    B := nil;
    try
      if (S.Width > 512) or (S.Height > 512) then
      begin
        R := RectF(0, 0, S.Width, S.Height);
        FitRect(R, RectF(0, 0, 512, 512));
        B := TBitmap.Create(Round(RectWidth(R)), Round(RectHeight(R)));
        if B.Canvas.BeginScene then
        try
          B.Canvas.DrawBitmap(S, RectF(0, 0, S.Width, S.Height), RectF(0, 0, B.Width, B.Height), 0.7, True);
        finally
          B.Canvas.EndScene;
        end;
      end else
      begin
        B := TBitmap.Create(S.Width, S.Height);
        if B.Canvas.BeginScene then
        try
          B.Canvas.DrawBitmap(S, RectF(0, 0, B.Width, B.Height), RectF(0, 0, B.Width, B.Height), 0.7, True);
        finally
          B.Canvas.EndScene;
        end;
      end;
      FRoot.BeginInternalDrag(Self, B);
    finally
      B.Free;
    end;
  finally
    S.Free;
  end;
end;

procedure TControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  VP: TPointF;
begin
  if not(csDesigning in ComponentState) and CanFocus and not FIsFocused and (FRoot <> nil) and
    (((FRoot.GetFocused <> nil) and (FRoot.GetFocused.GetObject <> Self)) or (FRoot.GetFocused = nil)) then
    SetFocus;
  if Assigned(FOnMouseDown) then
    FOnMouseDown(Self, Button, Shift, X, Y);
  if (Button = TMouseButton.mbRight)
{$IFDEF MACOS}
    or ((Button = TMouseButton.mbLeft) and (Shift = [ssLeft, ssCtrl]))
{$ENDIF}
  then
  begin
    VP := LocalToAbsolute(PointF(X, Y));
    VP := Scene.LocalToScreen(VP);
    ContextMenu(VP);
    Exit;
  end;
  if FAutoCapture then
    Capture;
  if (ssDouble in Shift) then
  begin
    DblClick;
    FDoubleClick := True;
  end
  else if Button = TMouseButton.mbLeft then
  begin
    FPressed := True;
  end;
end;

procedure TControl.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, Shift, X, Y);
end;

procedure TControl.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  ReleaseCapture;
  if Assigned(FOnMouseUp) then
    FOnMouseUp(Self, Button, Shift, X, Y);
  if FPressed and not(FDoubleClick) and PointInRect(PointF(X, Y), LocalRect) then
  begin
    FPressed := False;
    Click;
  end;
  FPressed := False;
  FDoubleClick := False;
end;

procedure TControl.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  if Assigned(FOnMouseWheel) then
    FOnMouseWheel(Self, Shift, WheelDelta, Handled)
end;

procedure TControl.DragEnter(const Data: TDragObject; const Point: TPointF);
begin
  FIsDragOver := True;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  ApplyTriggerEffect(Self, 'IsDragOver');
  if Assigned(OnDragEnter) then
    OnDragEnter(Self, Data, Point);
end;

procedure TControl.DragLeave;
begin
  FIsDragOver := False;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  ApplyTriggerEffect(Self, 'IsDragOver');
  if Assigned(OnDragLeave) then
    OnDragLeave(Self);
end;

procedure TControl.DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
begin
  if Assigned(OnDragOver) then
    OnDragOver(Self, Data, Point, Accept);
end;

procedure TControl.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  FIsDragOver := False;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  ApplyTriggerEffect(Self, 'IsDragOver');
  if Assigned(OnDragDrop) then
    OnDragDrop(Self, Data, Point);
end;

procedure TControl.DragEnd;
begin
  // Call mouse up - for effects - inside control
  if DragMode = TDragMode.dmAutomatic then
    MouseUp(TMouseButton.mbLeft, [ssLeft], $FFFF, $FFFF);
  if Assigned(OnDragEnd) then
    OnDragEnd(Self);
end;

{ controls }

procedure TControl.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    RecalcEnabled;
    RecalcOpacity;
    Repaint;
  end;
end;

function TControl.GetDesignInteractive: Boolean;
begin
  Result := FDesignInteractive;
end;

function TControl.GetAbsoluteEnabled: Boolean;
begin
  if FRecalcEnabled then
  begin
    if (FParent <> nil) and (FParent is TControl) and (not TControl(Parent).AbsoluteEnabled) then
      FAbsoluteEnabled := False
    else
      FAbsoluteEnabled := FEnabled;

    Result := FAbsoluteEnabled;
    FRecalcEnabled := False;

    if not Result and (FScene <> nil) and CanFocus and IsFocused then
      FRoot.SetFocused(nil);
  end
  else
  begin
    Result := FAbsoluteEnabled;
  end;
end;

procedure TControl.RecalcEnabled;
var
  I: Integer;
begin
  FRecalcEnabled := True;
  if FChildren <> nil then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) then
        TControl(FChildren[I]).RecalcEnabled;
end;

{ properties }

procedure TControl.SetTempCanvas(const Value: TCanvas);
var
  I: Integer;
begin
  FTempCanvas := Value;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for I := 0 to FChildren.Count - 1 do
      if (Children[I] is TControl) then
        TControl(FChildren[I]).TempCanvas := Value;
end;

procedure TControl.SetTop(const Value: Single);
begin
  FTop := Value;
  if csReading in ComponentState then
    FExplicitTop := FTop;
end;

procedure TControl.SetHitTest(const Value: Boolean);
begin
  FHitTest := Value;
end;

procedure TControl.SetAcceptsControls(const Value: boolean);
begin
  FAcceptsControls := Value;
end;

procedure TControl.SetClipChildren(const Value: Boolean);
begin
  if FClipChildren <> Value then
  begin
    FClipChildren := Value;
    Repaint;
  end;
end;

procedure TControl.SetAlign(const Value: TAlignLayout);
var
  AlignRoot: IAlignRoot;
  OldAlign: TAlignLayout;
begin
  if FAlign <> Value then
  begin
    OldAlign:= FAlign;
    FAlign := Value;
    Anchors:= AnchorAlign[Value];
    if not(csLoading in ComponentState)and (not (csDesigning in ComponentState) or
      (Parent <> nil)) then
      if ((OldAlign in [TAlignLayout.alTop, TAlignLayout.alBottom, TAlignLayout.alMostTop, TAlignLayout.alMostBottom]) =
        (Value in [TAlignLayout.alRight, TAlignLayout.alLeft, TAlignLayout.alMostRight, TAlignLayout.alMostLeft]))
        and not (OldAlign in [TAlignLayout.alNone, TAlignLayout.alClient, TAlignLayout.alContents])
        and not (Value in [TAlignLayout.alNone, TAlignLayout.alClient, TAlignLayout.alContents])  then
        SetBounds(Left, Top, Width, Height)
      else if (OldAlign <> TAlignLayout.alNone) and (Value = TAlignLayout.alNone) then
        SetBounds(FExplicitLeft, FExplicitTop, FExplicitWidth, FExplicitHeight);
   end;
   if (FParent <> nil) and (FParent is TControl) then
   begin
      TControl(Parent).FNeedAlign := True;
      if not(csLoading in ComponentState) then
      begin
        if Parent is TControl then
          TControl(Parent).Realign
      end;
    end
    else
    if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
      AlignRoot.Realign;
end;

procedure TControl.SetAnchors(const Value: TAnchors);
var
  OldAnchors: TAnchors;
begin
  if FAnchors <> Value then
  begin
    OldAnchors:= FAnchors;
    FAnchors := Value;
    if not (csLoading in ComponentState) then
      if (OldAnchors <> [TAnchorKind.akLeft, TAnchorKind.akTop]) and (FAnchors = [TAnchorKind.akLeft, TAnchorKind.akTop]) and
        ((FExplicitLeft <> Left) or (FExplicitTop <> Top) or (FExplicitWidth <> Width)
        or (FExplicitHeight <> Height)) then
        SetBounds(FExplicitLeft, FExplicitTop, FExplicitWidth, FExplicitHeight)
      else
        UpdateAnchorRules;
    if (FParent <> nil) and (FParent is TControl) and (FAnchors <> [TAnchorKind.akLeft, TAnchorKind.akTop]) then
    begin
      TControl(FParent).FNeedAlign := True;
    end;
  end;
end;

procedure TControl.SetVisible(const Value: Boolean);
var
  AlignRoot: IAlignRoot;
begin
  if FVisible <> Value then
  begin
    if FVisible then
    begin
      if FScene <> nil then
        FScene.AddUpdateRect(UpdateRect);
    end;
    FVisible := Value;
    if not(csLoading in ComponentState) and (Align <> TAlignLayout.alNone) then
    begin
      if (Parent <> nil) and (Parent is TControl) then
        TControl(Parent).Realign
      else
        if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
          AlignRoot.Realign;
    end;
    if FVisible then
    begin
      RecalcUpdateRect;
      if FScene <> nil then
        FScene.AddUpdateRect(UpdateRect);
      StartTriggerAnimation(Self, 'IsVisible');
    end
    else if CanFocus and FIsFocused then
      FRoot.SetFocused(nil);
  end;
end;

procedure TControl.SetParent(const Value: TFmxObject);
begin
  InvalidateRect(BoundsRect);
  inherited;
end;

procedure TControl.SetPopupMenu(Value: TCustomPopupMenu);
begin
  if FPopupMenu <> Value then
  begin
    if FPopupMenu <> nil then
      FPopupMenu.RemoveFreeNotification(Self);
    FPopupMenu := Value;
    if FPopupMenu <> nil then
      FPopupMenu.FreeNotification(Self);
  end;
end;

procedure TControl.SetPosition(const Value: TPosition);
begin
  FPosition.Assign(Value);
end;

procedure TControl.SetRotationAngle(const Value: Single);
begin
  if FRotationAngle <> Value then
  begin
    if  not isNaN(NormalizeAngle(Value)) then
        FRotationAngle := NormalizeAngle(Value);
    MatrixChanged(Self);
  end;
end;

procedure TControl.SetBounds(X, Y, AWidth, AHeight: Single);
var
  SizeChanged: Boolean;
  AlignRoot: IAlignRoot;
begin
  Repaint;
  SizeChanged := False;
  if (FHeight <> AHeight) then
  begin
    FHeight := AHeight;
    SizeChanged := True;
  end;
  if (FWidth <> AWidth) then
  begin
    FWidth := AWidth;
    SizeChanged := True;
  end;

  if (X <> FPosition.X) or (Y <> FPosition.Y) then
  begin
    FPosition.FX := X;
    FPosition.FY := Y;
    FLeft:= FPosition.FX;
    FTop:= FPosition.FY;
    MatrixChanged(Self);
  end;

  UpdateAnchorRules;
  UpdateExplicitBounds;

  if not(csLoading in ComponentState) and (Align <> TAlignLayout.alNone) then
  begin
    if (Parent <> nil) and (Parent is TControl) then
      TControl(Parent).Realign
    else
      if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
        AlignRoot.Realign;
  end;
  if not(csLoading in ComponentState) and (SizeChanged) then
  begin
    Resize;
    if (FChildren <> nil) then
      Realign;
  end;
  if not(csLoading in ComponentState) then
  begin
    RecalcUpdateRect;
    Repaint;
  end;
end;

procedure TControl.SetHeight(const Value: Single);
var
  AlignRoot: IAlignRoot;
begin
  if FHeight <> Value then
  begin
    Repaint;
    FHeight := Value;
    Resize;
    if not (csLoading in ComponentState) then
    begin
      UpdateEffects;
      RecalcUpdateRect;
      Repaint;
      if ((Align <> TAlignLayout.alNone) or (Parent is TScrollContent)) then
      begin
        if (Parent <> nil) and (Parent is TControl) then
          TControl(Parent).Realign
        else
          if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
            AlignRoot.Realign;
      end;
      if (FChildren <> nil) then
        Realign;
    end;
    if csReading in ComponentState then
      FExplicitHeight := FHeight;
  end;
end;

procedure TControl.SetWidth(const Value: Single);
var
  AlignRoot: IAlignRoot;
begin
  if FWidth <> Value then
  begin
    Repaint;
    FWidth := Value;
    Resize;
    if not(csLoading in ComponentState) then
    begin
      UpdateEffects;
      RecalcUpdateRect;
      Repaint;
      if ((Align <> TAlignLayout.alNone) or (Parent is TScrollContent)) then
      begin
        if (Parent <> nil) and (Parent is TControl) then
          TControl(Parent).Realign
        else
          if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
            AlignRoot.Realign;
      end;
      if (FChildren <> nil) then
        Realign;
    end;
    if csReading in ComponentState then
      FExplicitWidth := FWidth;
  end;
end;

function TControl.IsOpacityStored: Boolean;
begin
  Result := FOpacity <> 1;
end;

procedure TControl.SetOpacity(const Value: Single);
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

procedure TControl.UpdateAnchorRules;
var
  Anchors: TAnchors;
begin
  if not FAnchorMove and not (csLoading in ComponentState) then
  begin
    Anchors := FAnchors;
    FAnchorOrigin := PointF(Margins.Left + Margins.Width / 2, Margins.Top + Margins.Height / 2);
    if Anchors = [TAnchorKind.akLeft, TAnchorKind.akTop] then
    begin
      FOriginalParentSize.X := 0;
      FOriginalParentSize.Y := 0;
      Exit;
    end;
    if TAnchorKind.akRight in Anchors then
      if TAnchorKind.akLeft in Anchors then
        FAnchorRules.X := Margins.Width else
        FAnchorRules.X := Margins.Left
    else
      FAnchorRules.X := Margins.Left + Margins.Width / 2;
    if TAnchorKind.akBottom in Anchors then
      if TAnchorKind.akTop in Anchors then
        FAnchorRules.Y := Margins.Height else
        FAnchorRules.Y := Margins.Top
    else
      FAnchorRules.Y := Margins.Top + Margins.Height / 2;
    if Parent <> nil then
      UpdateControlOriginalParentSize(Self, FOriginalParentSize);
  end;
end;

procedure TControl.UpdateControlOriginalParentSize(AControl: TFmxObject;
  var AOriginalParentSize: TPointF);
begin
  if csReading in ComponentState then
    begin
      if not (csDesigning in AControl.ComponentState) then
        AOriginalParentSize.X:= AbsoluteRect.Left;
        AOriginalParentSize.Y:= AbsoluteRect.Top;
    end
    else
    begin
      AOriginalParentSize.X := Width;
      AOriginalParentSize.Y := Height;
    end;
    AOriginalParentSize.X:= AOriginalParentSize.X - (Padding.Left + Padding.Right);
    AOriginalParentSize.Y:= AOriginalParentSize.Y - (Padding.Top + Padding.Bottom);
end;

procedure TControl.UpdateDesignVisible(const Value: Boolean);
var
  I: Integer;
begin
  FDesignVisible := Value;
  for I := 0 to ChildrenCount - 1 do
  begin
    if Children[I] is TControl then
      TControl(Children[I]).UpdateDesignVisible(Value);
  end;
end;

procedure TControl.SetDesignVisible(const Value: Boolean);
begin
  if FDesignVisible <> Value then
  begin
    FDesignVisible := Value;
    if (csDesigning in ComponentState) and (Parent <> nil) and (Parent is TControl) then
    begin
      TControl(Parent).Repaint;
    end;
  end;
end;

procedure TControl.SetDragMode(const ADragMode: TDragMode);
begin
  FDragMode := ADragMode;
end;

procedure TControl.SetCursor(const Value: TCursor);
var
  Obj: IControl;
begin
  if FCursor <> Value then
  begin
    FCursor := Value;
    if (Root <> nil) and (Root.Captured = nil) and not (csLoading in ComponentState) then
    begin
      Obj := ObjectAtPoint(Platform.GetMousePos);
      if (Obj <> nil) and (Obj.GetObject = Self) then
        Platform.SetCursor(nil, FCursor);  
    end;
  end;
end;

function TControl.GetTabOrderValue: TTabOrder;
begin
  Result := FTabOrder;
end;

function TControl.GetTop: single;
begin
  Result := Position.Y;
end;

function TControl.GetTabOrder: TTabOrder;
begin
  if (Parent <> nil) and (Parent.FTabList <> nil) then
    Result := Parent.FTabList.IndexOf(Pointer(AsIControl))
  else
    Result := -1;
end;

procedure TControl.UpdateTabOrder(Value: TTabOrder);
var
  CurIndex, Count: Integer;
begin
  CurIndex := GetTabOrder;
  if (CurIndex >= 0) and (Parent <> nil) and (Parent.FTabList <> nil) then
  begin
    Count := Parent.FTabList.Count;
    if Value < 0 then
      Value := 0;
    if Value >= Count then
      Value := Count - 1;
    if Value <> CurIndex then
    begin
      Parent.FTabList.Delete(CurIndex);
      Parent.FTabList.Insert(Value, Pointer(AsIControl));
    end;
  end;
end;

procedure TControl.SetTabOrder(const Value: TTabOrder);
begin
  if csLoading in ComponentState then
    FTabOrder := Value
  else
    UpdateTabOrder(Value);
end;

{ TBrushObject }

constructor TBrushObject.Create(AOwner: TComponent);
begin
  inherited;
  FBrush := TBrush.Create(TBrushKind.bkSolid, $FFFFFFFF);
end;

destructor TBrushObject.Destroy;
begin
  FreeAndNil(FBrush);
  inherited;
end;

procedure TBrushObject.SetName(const NewName: TComponentName);
begin
  inherited;
  if FStyleName = '' then
    FStyleName := Name;
end;

{ TPathObject }

constructor TPathObject.Create(AOwner: TComponent);
begin
  inherited;
  FPath := TPathData.Create();
end;

destructor TPathObject.Destroy;
begin
  FreeAndNil(FPath);
  inherited;
end;

procedure TPathObject.SetName(const NewName: TComponentName);
begin
  inherited;
  if FStyleName = '' then
    FStyleName := Name;
end;

{ TBitmapObject }

constructor TBitmapObject.Create(AOwner: TComponent);
begin
  inherited;
  FBitmap := TBitmap.Create(1, 1);
end;

destructor TBitmapObject.Destroy;
begin
  FreeAndNil(FBitmap);
  inherited;
end;

procedure TBitmapObject.SetName(const NewName: TComponentName);
begin
  inherited;
  if FStyleName = '' then
    FStyleName := Name;
end;

{ TStyledControl }

constructor TStyledControl.Create(AOwner: TComponent);
begin
  inherited;
  FHelpType := htContext;
  FHelpContext := 0;
  FNeedStyleLookup := True;
end;

destructor TStyledControl.Destroy;
var
  I: Integer;
begin
{$IFNDEF NOVCL}
  if FActionLink <> nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end;
{$ENDIF}
  if FBindingObjects <> nil then
  begin
    for I := FBindingObjects.Count - 1 downto 0 do
      RemoveBindingObject(TStyledControl(FBindingObjects[I]));
    FreeAndNil(FBindingObjects);
  end;
  inherited;
end;

procedure TStyledControl.Loaded;
begin
  inherited;
  if (FRoot <> nil) and (FRoot.GetActiveControl = Self) then
    SetFocus;
end;

procedure TStyledControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (FBindingSource = AComponent) then
    BindingSource := nil;
  if (Operation = opRemove) and (FBindingObjects <> nil) and (FBindingObjects.IndexOf(AComponent) >= 0) then
    FBindingObjects.Remove(AComponent);
{$IFNDEF NOVCL}
  if (Operation = opRemove) and (AComponent = Action) then
    Action := nil;
{$ENDIF}
end;

procedure TStyledControl.SetData(const Value: Variant);
begin
end;

procedure TStyledControl.AddBindingObject(AObject: TStyledControl);
begin
  if FBindingObjects = nil then
    FBindingObjects := TList.Create;
  if FBindingObjects.IndexOf(AObject) < 0 then
  begin
    AObject.AddFreeNotify(Self);
    FBindingObjects.Add(AObject);

    ToBindingObjects;
  end;
end;

procedure TStyledControl.RemoveBindingObject(AObject: TStyledControl);
begin
  if FBindingObjects = nil then
    Exit;
  if FBindingObjects.IndexOf(AObject) >= 0 then
  begin
    AObject.RemoveFreeNotify(Self);
    FBindingObjects.Remove(AObject);
  end;
end;

procedure TStyledControl.SetBindingSource(const Value: TStyledControl);
begin
  if FBindingSource <> Value then
  begin
    if FBindingSource <> nil then
      FBindingSource.RemoveBindingObject(Self);
    FBindingSource := Value;
    if FBindingSource <> nil then
      FBindingSource.AddBindingObject(Self);
  end;
end;

procedure TStyledControl.ToBindingObjects;
var
  I: Integer;
begin
  if FBindingObjects = nil then
    Exit;
  for I := 0 to FBindingObjects.Count - 1 do
    TFmxObject(FBindingObjects[I]).Data := Data;
end;

function TStyledControl.FindStyleResource(const AStyleLookup: WideString): TFmxObject;
begin
  Result := nil;
  if FResourceLink <> nil then
    Result := FResourceLink.FindStyleResource(AStyleLookup);
  if Result = nil then
    Result := inherited FindStyleResource(AStyleLookup);
end;

function TStyledControl.GetStyleObject: TControl;

  function FindStyleInObject(ASource: TFmxObject; const AStyleName: WideString): TControl;
  var
    SaveStyleName: WideString;
    ResourceObject: TControl;
    Obj: TFmxObject;
  begin
    ResourceObject := nil;
    if Assigned(ASource) then
    begin
      Obj := TControl(ASource.FindStyleResource(AStyleName));
      if Obj <> nil then
      begin
        SaveStyleName := Obj.StyleName;
        try
          Obj.FStyleName := '';
          ResourceObject := TControl(Obj.Clone(nil));
        finally
          Obj.FStyleName := SaveStyleName;
        end;
      end;
    end;
    Result := ResourceObject;
  end;

var
  Obj: TFmxObject;
  ResourceObject: TControl;
  S: TStream;
  SaveStyleName, StyleName: WideString;
  SaveStored: Boolean;
begin
  ResourceObject := nil;
  if (FStyleLookup <> '') and (FStyleLookup = FStyleName) then
  begin
    Result := ResourceObject;
    Exit;
    // Stack Overflow
  end;
  if (FStyleLookup <> '') then
  begin
    { style }
    Obj := nil;
    if (FScene <> nil) and (FScene.GetStyleBook <> nil) and (FScene.GetStyleBook.FRoot <> nil) then
      Obj := TControl(FScene.GetStyleBook.FRoot.FindStyleResource(FStyleLookup));
    if Obj = nil then
      if Application.DefaultStyles <> nil then
        Obj := TControl(Application.DefaultStyles.FindStyleResource(FStyleLookup));
    if Obj = nil then
      Obj := FMX_Types.FindStyleResource(FStyleLookup);
    if (Obj <> nil) and (Obj is TControl) then
    begin
      SaveStyleName := Obj.StyleName;
      try
        Obj.FStyleName := '';
        ResourceObject := TControl(Obj.Clone(nil));
      finally
        Obj.FStyleName := SaveStyleName;
      end;
    end;
  end;
  if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
  begin
    if (FScene <> nil) and (FScene.GetStyleBook <> nil) and (FScene.GetStyleBook.FRoot <> nil) then
    begin
      if FStyleLookup <> '' then
      begin
        StyleName := FStyleLookup;
        ResourceObject := FindStyleInObject(FScene.GetStyleBook.FRoot, StyleName);
      end;
      if ResourceObject = nil then
      begin
        StyleName := GetDefaultStyleLookupName;
        ResourceObject := FindStyleInObject(FScene.GetStyleBook.FRoot, StyleName);
      end;
      if ResourceObject = nil then
      begin
        StyleName := ClassName + 'style';
        Delete(StyleName, 1, 1); // just remove T
        ResourceObject := FindStyleInObject(FScene.GetStyleBook.FRoot, StyleName);
      end;
    end;
    if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
    begin
      if FStyleLookup <> '' then
      begin
        StyleName := FStyleLookup;
        ResourceObject := FindStyleInObject(Application.DefaultStyles, StyleName);
      end;
      if ResourceObject = nil then
      begin
        StyleName := GetDefaultStyleLookupName;
        ResourceObject := FindStyleInObject(Application.DefaultStyles, StyleName);
      end;
      if ResourceObject = nil then
      begin
        StyleName := ClassName + 'style';
        Delete(StyleName, 1, 1); // just remove T
        ResourceObject := FindStyleInObject(Application.DefaultStyles, StyleName);
      end;
      if ResourceObject = nil then
      begin
        // try parent Class
        StyleName := ClassParent.ClassName + 'style';
        Delete(StyleName, 1, 1); // just remove T
        ResourceObject := FindStyleInObject(Application.DefaultStyles, StyleName);
      end;
    end;
  end;
  Result := ResourceObject;
end;

procedure CallLoaded(Obj: TFmxObject);
var
  I: Integer;
begin
  Obj.Loaded;
  for I := 0 to Obj.ChildrenCount - 1 do
    CallLoaded(Obj.Children[I]);
end;

procedure TStyledControl.ApplyStyleLookup;
var
  ResourceObject: TControl;
begin
  if FNeedStyleLookup then
  begin
    inherited;
    FNeedStyleLookup := False;
    ResourceObject := GetStyleObject;
    if ResourceObject <> nil then
    begin
      if csLoading in ResourceObject.ComponentState then
        CallLoaded(ResourceObject);
      if FResourceLink <> nil then
      begin
        FreeStyle;
        FResourceLink.Release;
        FResourceLink := nil;
      end;
      ResourceObject.FAlign := TAlignLayout.alContents;
      ResourceObject.SetBounds(0, 0, Width, Height);
      ResourceObject.DesignVisible := True;
      FResourceLink := ResourceObject;
      ResourceObject.SetAcceptsControls(False);
      AddObject(ResourceObject);
      { bring to front }
      FChildren.Remove(ResourceObject);
      FChildren.Insert(0, ResourceObject);
      { }
      ResourceObject.Stored := False;
      ResourceObject.Lock;
      ApplyStyle;
      FUpdateEffects := True;
      if Assigned(FOnApplyStyleLookup) then
        FOnApplyStyleLookup(Self);
    end;
  end;
end;

procedure TStyledControl.UpdateStyle;
begin
  if csLoading in ComponentState then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  inherited;
  FNeedStyleLookup := True;
  ApplyStyleLookup;
end;

procedure TStyledControl.ApplyStyle;
var
  NewT: WideString;
begin
  if FIsFocused and CanFocus and not FDisableFocusEffect and not GlobalDisableFocusEffect then
  begin
    FRecalcUpdateRect := True;
    Repaint;
    StartTriggerAnimation(Self, 'IsFocused');
    ApplyTriggerEffect(Self, 'IsFocused');
  end;
  { translate }
  if FAutoTranslate and ShowHint and (Hint <> '') then
  begin
    NewT := Translate(Hint);
    // need for collection texts
    if not(csDesigning in ComponentState) then
      Hint := NewT;
  end;
end;

procedure TStyledControl.FreeStyle;
begin
end;

function TStyledControl.GetDefaultStyleLookupName: WideString;
begin
  Result := ClassName + 'style';
  Delete(Result, 1, 1); // just remove T
end;

procedure TStyledControl.DoEnter;
begin
  ApplyStyleLookup;
  inherited;
end;

procedure TStyledControl.Painting;
begin
  inherited;
  ApplyStyleLookup;
end;

procedure TStyledControl.SetStyleLookup(const Value: WideString);
begin
  FStyleLookup := Value;
  FNeedStyleLookup := True;
  if not(csLoading in ComponentState) and (FUpdating = 0) then
  begin
    ApplyStyleLookup;
  end;
end;

procedure TStyledControl.InitiateAction;
begin
{$IFNDEF NOVCL}
  if FActionLink <> nil then
    FActionLink.Update;
{$ENDIF}
end;

procedure TStyledControl.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  { if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
    if Self is TTextControl then
    if not CheckDefaults or (TTextControl(Self).Text = '') or (TTextControl(Self).Text = Self.Name) then
    TTextControl(Self).Text := Caption;
    if not CheckDefaults or (Self.Enabled = True) then
    Self.Enabled := Enabled;
    if not CheckDefaults or (Self.Hint = '') then
    Self.Hint := Hint;
    if not CheckDefaults or (Self.Visible = True) then
    Self.Visible := Visible;
    if not CheckDefaults or not Assigned(Self.OnClick) then
    Self.OnClick := OnExecute;
    end; }
end;

procedure TStyledControl.DoActionChange(Sender: TObject);
begin
  if Sender = Action then
    ActionChange(Sender, False);
end;

function TStyledControl.GetAction: TBasicAction;
begin
  { if FActionLink <> nil then
    Result := FActionLink.Action
    else }
  Result := nil;
end;

function TStyledControl.GetBackIndex: Integer;
begin
  Result := 1;
end;

procedure TStyledControl.SetAction(Value: TBasicAction);
begin
  { if Value = nil then
    begin
    FActionLink.Free;
    FActionLink := nil;
    end
    else
    begin
    if FActionLink = nil then
    FActionLink := TControlActionLink.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    ActionChange(Value, csLoading in Value.ComponentState);
    Value.FreeNotification(Self);
    end; }
end;

function TStyledControl.IsHelpContextStored: Boolean;
begin
  // Result := (FActionLink = nil) or not FActionLink.IsHelpContextLinked;
  Result := (FHelpContext <> 0);
end;

procedure TStyledControl.SetHelpContext(const Value: THelpContext);
begin
  if not(csLoading in ComponentState) then
    FHelpType := htContext;
  FHelpContext := Value;
end;

procedure TStyledControl.SetHelpKeyword(const Value: WideString);
begin
  if not(csLoading in ComponentState) then
    FHelpType := htKeyword;
  FHelpKeyword := Value;
end;

{ TTextControl }

constructor TTextControl.Create(AOwner: TComponent);
begin
  inherited;
  FFont := TFont.Create;
  FFont.OnChanged := FontChanged;
  FFontFill := TBrush.Create(TBrushKind.bkSolid, $FF000000);
  FFontFill.OnChanged := FontFillChanged;
  FWordWrap := False;
  FTextAlign := TTextAlign.taLeading;
end;

destructor TTextControl.Destroy;
begin
  FFontFill.Free;
  FFont.Free;
  inherited;
end;

procedure TTextControl.SetName(const Value: TComponentName);
var
  ChangeText: Boolean;
begin
  ChangeText := not(csLoading in ComponentState) and (Name = Text) and
    ((Owner = nil) or not(Owner is TComponent) or not(csLoading in TComponent(Owner).ComponentState));
  inherited SetName(Value);
  if ChangeText then
    Text := Value;
end;

function TTextControl.GetData: Variant;
begin
  Result := Text;
end;

procedure TTextControl.SetData(const Value: Variant);
begin
  if VarIsNull(Value) then
    Text := ''
  else if VarIsType(Value, varDate) then
    Text := DateTimeToStr(VarToDateTime(Value))
  else
    Text := VarToWideStr(Value);
end;

procedure TTextControl.ApplyStyle;
var
  ForegroundExists: Boolean;
  NewT: WideString;
  S: TFmxObject;
begin
  inherited;
  { from style }
  S := FindStyleResource('foreground');
  if (S <> nil) and (S is TBrushObject) then
  begin
    FontFill.Assign(TBrushObject(S).Brush);
    ForegroundExists := True;
  end
  else
    ForegroundExists := False;
  { to style }
  S := FindStyleResource('text');
  if (S <> nil) and (S is TText) then
  begin
    FTextObject := S;
    TText(FTextObject).Text := FText;
    TText(FTextObject).HorzTextAlign := FTextAlign;
    TText(FTextObject).VertTextAlign := FVertTextAlign;
    TText(FTextObject).WordWrap := FWordWrap;
    TText(FTextObject).Font.Assign(FFont);
    if ForegroundExists then
      TText(FTextObject).Fill.Assign(FFontFill);
  end
  else if (S <> nil) and (S is TTextControl) then
  begin
    FTextObject := S;
    TTextControl(FTextObject).Text := FText;
    TTextControl(FTextObject).TextAlign := FTextAlign;
    TTextControl(FTextObject).VertTextAlign := FVertTextAlign;
    TTextControl(FTextObject).WordWrap := FWordWrap;
    TTextControl(FTextObject).Font.Assign(FFont);
    if ForegroundExists  then
      TTextControl(FTextObject).FontFill.Assign(FFontFill);
  end;
  { translate }
  if FAutoTranslate and (FText <> '') then
  begin
    NewT := Translate(Text); // need for collection texts
    if not(csDesigning in ComponentState) then
      Text := NewT;
  end;
end;

procedure TTextControl.FontChanged(Sender: TObject);
var
  TextCtrl: TText;
  W: Single;
begin
  if (FTextObject <> nil) and (FTextObject is TText) then
  begin
    TextCtrl := TText(FTextObject);

    TextCtrl.Font.Assign(FFont);
    TextCtrl.Width := Min(TextCtrl.Width, Width - TextCtrl.Position.X - 5);

    Repaint;
  end;
end;

procedure TTextControl.FontFillChanged(Sender: TObject);
begin
  if (FTextObject <> nil) and (FTextObject is TText) then
    TText(FTextObject).Fill.Assign(FontFill);
end;

procedure TTextControl.FreeStyle;
begin
  FTextObject := nil;
  inherited;
end;

function TTextControl.GetText: WideString;
begin
  Result := FText;
end;

procedure TTextControl.SetText(const Value: WideString);
begin
  if FText <> Value then
  begin
    FText := Value;
    if (FTextObject <> nil) and (GetPropInfo(FTextObject, 'Text') <> nil) then
    begin
      SetStrProp(FTextObject, 'Text', Text);
      if FTextObject is TControl then
        TControl(FTextObject).UpdateEffects;
    end
    else if (FResourceLink <> nil) and (FResourceLink is TText) then
      TText(FResourceLink).Text := FText
    else
      Repaint;
    UpdateEffects;
  end;
end;

procedure TTextControl.SetFontFill(const Value: TBrush);
begin
  FFontFill := Value;
end;

procedure TTextControl.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TTextControl.SetTextAlign(const Value: TTextAlign);
begin
  FTextAlign := Value;
  if (FTextObject <> nil) and (FTextObject is TText) then
    TText(FTextObject).HorzTextAlign := FTextAlign
  else
    Repaint;
end;

procedure TTextControl.SetVertTextAlign(const Value: TTextAlign);
begin
  FVertTextAlign := Value;
  FTextObject := FindStyleResource('text');
  if (FTextObject <> nil) and (FTextObject is TText) then
    TText(FTextObject).VertTextAlign := FVertTextAlign
  else
    Repaint;
end;

procedure TTextControl.SetWordWrap(const Value: Boolean);
begin
  FWordWrap := Value;
  if (FTextObject <> nil) and (FTextObject is TText) then
    TText(FTextObject).WordWrap := Value;
end;

{ TContent }

constructor TContent.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TContent.Destroy;
begin
  inherited;
end;

function TContent.GetParentComponent: TComponent;
begin
  Result := inherited GetParentComponent;
end;

procedure TContent.Realign;
var
  AlignRoot: IAlignRoot;
begin
  if (Parent <> nil) and not(csLoading in Parent.ComponentState) then
    inherited;
  if (Parent <> nil) and not FParentAligning and not(csLoading in ComponentState) then
  begin
    FParentAligning := True;
    if (Parent is TControl) then
      TControl(Parent).Realign
    else
      if not(csLoading in ComponentState) and Supports(Parent, IAlignRoot, AlignRoot) then
        AlignRoot.Realign;
    FParentAligning := False;
  end;
end;

{ TStyleBook }

constructor TStyleBook.Create(AOwner: TComponent);
begin
  inherited;
  FResource := TWideStringList.Create;
  TWideStringList(FResource).OnChange := DoResourceChanged;
  FSceneList := TList.Create;
end;

destructor TStyleBook.Destroy;
begin
  FreeAndNil(FRoot);
  FreeAndNil(FSceneList);
  FreeAndNil(FResource);
  inherited;
end;

procedure TStyleBook.Loaded;
begin
  inherited;
  if FFileName <> '' then LoadFromFile;
end;

procedure TStyleBook.LoadFromFile;
var
  S: TStream;
  SR: TSearchRec;
  FName: WideString;
begin
  if not(csLoading in ComponentState) then
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + FFileName) then
      FName := ExtractFilePath(ParamStr(0)) + FFileName
    else if FileExists(FFileName) then
      FName := FFileName
    else
      FName := '';
        
    if FName <> '' then
    begin
      FResource.LoadFromFile(FName);
      // load custom styles
      if FRoot <> nil then
      begin
        if FindFirst(ChangeFileExt(FName, '.*.Style'), $FFFF, SR) = 0 then
        begin
          try
            repeat
              S := TFileStream.Create(ExtractFilePath(FName) + SR.Name, fmOpenRead);
              try
                MergeObjectFromStream(FRoot, S);
              finally
                S.Free;
              end;
            until FindNext(SR) <> 0;
          finally
            FindClose(SR);
          end;
        end;
        FillStrings;
      end;
    end;
  end;
end;

procedure TStyleBook.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('ResourcesBin', ReadResources, WriteResources, False);
end;

procedure TStyleBook.ReadResources(Stream: TStream);
begin
  if FRoot <> nil then
    FRoot.Free;
  FRoot := CreateObjectFromBinStream(nil, Stream);
  if FRoot <> nil then
  begin
    if FRoot is TControl then
      TControl(FRoot).UpdateDesignVisible(True);
    UpdateScenes;
  end;
end;

procedure TStyleBook.WriteResources(Stream: TStream);
begin
  if FRoot <> nil then
    FRoot.SaveToBinStream(Stream);
end;

procedure TStyleBook.FillStrings;
var
  M: TMemoryStream;
  SaveChanged: TNotifyEvent;
begin
  if FRoot <> nil then
  begin
    M := TMemoryStream.Create;
    FRoot.SaveToStream(M);
    M.Position := 0;
    SaveChanged := TWideStringList(FResource).OnChange;
    TWideStringList(FResource).OnChange := nil;
    TWideStringList(FResource).LoadFromStream(M);
    TWideStringList(FResource).OnChange := SaveChanged;
    M.Free;
  end;
end;

procedure TStyleBook.UpdateScenes;
var
  I: Integer;
begin
  for I := 0 to FSceneList.Count - 1 do
    if IScene(FSceneList[I]) <> nil then
      IScene(FSceneList[I]).UpdateStyle;
end;

procedure TStyleBook.DoResourceChanged(Sender: TObject);
var
  S: TStream;
  R: AnsiString;
begin
  FreeAndNil(FRoot);
  S := TMemoryStream.Create;
  try
    R := FResource.Text;
    S.Write(PAnsiChar(R)^, Length(R));
    if S.Position > 0 then
    begin
      S.Position := 0;
      FRoot := CreateObjectFromStream(nil, S);
      if FRoot is TControl then
      begin
        TControl(FRoot).UpdateDesignVisible(True);
        TControl(FRoot).Updated;
      end;
    end;
  finally
    S.Free;
  end;
  UpdateScenes;
end;

procedure TStyleBook.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
end;

procedure TStyleBook.SetFileName(const Value: WideString);
begin
  if FFileName <> Value then
  begin
    FFileName := Value;
    LoadFromFile;
  end;
end;

procedure TStyleBook.SetResource(const Value: TWideStrings);
begin
  FResource.Assign(Value);
end;

procedure TStyleBook.AddSceneUpdater(const Scene: IScene);
begin
  FSceneList.Add(Pointer(Scene));
end;

procedure TStyleBook.RemoveSceneUpdater(const Scene: IScene);
begin
  if FSceneList <> nil then
    FSceneList.Remove(Pointer(Scene));
end;

{ TLang }

function ReadString(S: TStream): WideString;
var
  L: Integer;
begin
  L := 0;
  S.Read(L, SizeOf(L));
  SetLength(Result, L);
  S.Read(Pointer(Result)^, L * 2);
end;

procedure WriteString(S: TStream; const Value: WideString);
var
  L: Integer;
begin
  L := Length(Value);
  S.Write(L, SizeOf(L));
  S.Write(Pointer(Value)^, L * 2);
end;

constructor TLang.Create(AOwner: TComponent);
begin
  inherited;
  FOriginal := TWideStringList.Create;
  FResources := TWideStringList.Create;
  FAutoSelect := True;
  FStoreInForm := True;
end;

destructor TLang.Destroy;
var
  I: Integer;
begin
  for I := 0 to FResources.Count - 1 do
    TWideStrings(FResources.Objects[I]).Free;
  FResources.Free;
  FOriginal.Free;
  inherited;
end;

procedure TLang.Loaded;
begin
  inherited;
  if (FFileName <> '') and (FileExists(ExtractFileName(ParamStr(0)) + FFileName)) then
    LoadFromFile(ExtractFileName(ParamStr(0)) + FFileName);
  if FAutoSelect then
    FLang := Platform.GetCurrentLangID;
  if FLang <> '' then
    LoadLangFromStrings(LangStr[FLang]);
end;

procedure TLang.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('ResourcesBin', ReadResources, WriteResources, StoreInForm and (FResources.Count > 0));
end;

procedure TLang.ReadResources(Stream: TStream);
var
  len: Cardinal;
  I: Integer;
  N: WideString;
  Str: TWideStrings;
begin
  FOriginal.Text := ReadString(Stream);
  Stream.Read(len, 4);
  for I := 0 to len - 1 do
  begin
    N := ReadString(Stream);
    Str := TWideStringList.Create;
//    TWideStringList(Str).Sorted := True;
    TWideStringList(Str).CaseSensitive := True;
    Str.Text := ReadString(Stream);
    FResources.AddObject(N, Str);
  end;
end;

procedure TLang.WriteResources(Stream: TStream);
var
  len: Cardinal;
  I: Integer;
begin
  WriteString(Stream, FOriginal.Text);
  len := FResources.Count;
  Stream.Write(len, 4);
  for I := 0 to len - 1 do
  begin
    WriteString(Stream, FResources[I]);
    WriteString(Stream, TWideStrings(FResources.Objects[I]).Text);
  end;
end;

procedure TLang.LoadFromFile(const AFileName: WideString);
var
  S: TFileStream;
begin
  if FileExists(AFileName) then
  begin
    S := TFileStream.Create(AFileName, fmOpenRead);
    ReadResources(S);
    S.Free;
  end;
end;

procedure TLang.SaveToFile(const AFileName: WideString);
var
  S: TFileStream;
begin
  S := TFileStream.Create(AFileName, fmCreate);
  WriteResources(S);
  S.Free;
end;

procedure TLang.AddLang(const AName: WideString);
var
  Idx: Integer;
  Str: TWideStrings;
begin
  Idx := FResources.IndexOf(AName);
  if Idx < 0 then
  begin
    Str := TWideStringList.Create;
//    TWideStringList(Str).Sorted := True;
    TWideStringList(Str).CaseSensitive := True;
    FResources.AddObject(AName, Str);
  end;
end;

function TLang.GetLangStr(const Index: WideString): TWideStrings;
var
  Idx: Integer;
begin
  Idx := FResources.IndexOf(Index);
  if Idx >= 0 then
    Result := TWideStrings(FResources.Objects[Idx])
  else
    Result := nil;
end;

procedure TLang.SetLang(const Value: WideString);
begin
  FLang := Value;
  if not(csLoading in ComponentState) then
  begin
    if FLang = 'en' then
      ResetLang
    else
      LoadLangFromStrings(LangStr[FLang]);
  end;
end;

{ TControlActionLink }

(* procedure TControlActionLink.AssignClient(AClient: TObject);
  begin
  FClient := AClient as TStyledControl;
  end;

  function TControlActionLink.DoShowHint(var HintStr: WideString): Boolean;
  begin
  Result := True;
  if Action is TCustomAction then
  begin
  if TCustomAction(Action).DoHint(HintStr) and Application.HintShortCuts and
  (TCustomAction(Action).ShortCut <> scNone) then
  begin
  {      if HintStr <> '' then
  HintStr := Format('%s (%s)', [HintStr, ShortCutToText(TCustomAction(Action).ShortCut)]);}
  end;
  end;
  end;

  function TControlActionLink.IsCaptionLinked: Boolean;
  begin
  Result := inherited IsCaptionLinked and
  (FClient is TTextControl) and (TTextControl(FClient).Text = (Action as TCustomAction).Caption);
  end;

  function TControlActionLink.IsEnabledLinked: Boolean;
  begin
  Result := inherited IsEnabledLinked and
  (FClient.Enabled = (Action as TCustomAction).Enabled);
  end;

  function TControlActionLink.IsHintLinked: Boolean;
  begin
  Result := inherited IsHintLinked and
  (FClient.Hint = (Action as TCustomAction).Hint);
  end;

  function TControlActionLink.IsVisibleLinked: Boolean;
  begin
  Result := inherited IsVisibleLinked and
  (FClient.Visible = (Action as TCustomAction).Visible);
  end;

  function TControlActionLink.IsOnExecuteLinked: Boolean;
  begin
  Result := inherited IsOnExecuteLinked and
  (@FClient.OnClick = @Action.OnExecute);
  end;

  function TControlActionLink.IsHelpLinked: Boolean;
  begin
  Result := inherited IsHelpLinked and
  (FClient.HelpContext = TCustomAction(Action).HelpContext) and
  (FClient.HelpKeyword = TCustomAction(Action).HelpKeyword) and
  (FClient.HelpType = TCustomAction(Action).HelpType);
  end;

  procedure TControlActionLink.SetHelpKeyword(const Value: WideString);
  begin
  if IsHelpLinked then FClient.HelpKeyword := Value;
  end;

  procedure TControlActionLink.SetHelpContext(Value: THelpContext);
  begin
  if IsHelpLinked then FClient.HelpContext := Value;
  end;

  procedure TControlActionLink.SetHelpType(Value: THelpType);
  begin
  if IsHelpLinked then FClient.HelpType := Value;
  end;

  procedure TControlActionLink.SetCaption(const Value: WideString);
  begin
  if IsCaptionLinked then TTextControl(FClient).Text := Value;
  end;

  procedure TControlActionLink.SetEnabled(Value: Boolean);
  begin
  if IsEnabledLinked then FClient.Enabled := Value;
  end;

  procedure TControlActionLink.SetHint(const Value: WideString);
  begin
  if IsHintLinked then FClient.Hint := Value;
  end;

  procedure TControlActionLink.SetVisible(Value: Boolean);
  begin
  if IsVisibleLinked then FClient.Visible := Value;
  end;

  procedure TControlActionLink.SetOnExecute(Value: TNotifyEvent);
  begin
  if IsOnExecuteLinked then FClient.OnClick := Value;
  end; *)

var
  PopupList: TList;

procedure CloseAllPopups;
var
  I: Integer;
begin
  { close other popups }
  if (PopupList.Count > 0) then
  begin
    for I := PopupList.Count - 1 downto 0 do
      TPopup(PopupList[I]).ClosePopup;
  end;
end;

{ TPopup }

constructor TPopup.Create(AOwner: TComponent);
begin
  inherited;
  FPlacementRectangle := TBounds.Create(RectF(0, 0, 0, 0));
  Visible := False;
  CanFocus := True;
  SetAcceptsControls(False);
end;

destructor TPopup.Destroy;
begin
  ClosePopup;
  FPlacementRectangle.Free;
  inherited;
end;

procedure TPopup.Paint;
var
  R: TRectF;
begin
  inherited;
  if (csDesigning in ComponentState) then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
  end;
end;

procedure TPopup.ApplyPlacement;
var
  Target: TControl;
  AbsolutePos, LocalPos: TPointF;
  Pos: TPointF;
begin
  Target := PlacementTarget;

  if (Target = nil) and (Parent <> nil) and (Parent is TControl) then
    Target := TControl(Parent);
  if Target = nil then
  begin
    case Placement of
      TPlacement.plBottom:
        begin
          LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Bottom + VerticalOffset);
        end;
      TPlacement.plTop:
        begin
          LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Top - Height -
            VerticalOffset);
        end;
      TPlacement.plLeft:
        begin
          LocalPos := PointF(FPlacementRectangle.Left - Width - HorizontalOffset,
            FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plRight:
        begin
          LocalPos := PointF(FPlacementRectangle.Right + HorizontalOffset, FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plBottomCenter:
        begin
          LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Bottom + VerticalOffset);
        end;
      TPlacement.plTopCenter:
        begin
          LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Top - Height -
            VerticalOffset);
        end;
      TPlacement.plLeftCenter:
        begin
          LocalPos := PointF(FPlacementRectangle.Left - Width - HorizontalOffset,
            FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plRightCenter:
        begin
          LocalPos := PointF(FPlacementRectangle.Right + HorizontalOffset, FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plCenter:
        begin
          LocalPos := PointF(FPlacementRectangle.Left + (FPlacementRectangle.Right - FPlacementRectangle.Left - Width) /
            2, FPlacementRectangle.Top + (FPlacementRectangle.Bottom - FPlacementRectangle.Top - Height) / 2);
          LocalPos.X := LocalPos.X + HorizontalOffset;
          LocalPos.Y := LocalPos.Y + VerticalOffset;
        end;
      TPlacement.plAbsolute:
        begin
          TForm(FPopupForm).Left := Round(FPlacementRectangle.Left);
          TForm(FPopupForm).Top := Round(FPlacementRectangle.Top);
          Exit;
        end;
      TPlacement.plMouse:
        begin
          Pos := Platform.GetMousePos;
          TForm(FPopupForm).Left := Round(Pos.X);
          TForm(FPopupForm).Top := Round(Pos.Y);
          Exit;
        end;
      TPlacement.plMouseCenter:
        begin
          Pos := Platform.GetMousePos;
          TForm(FPopupForm).Left := Round(Pos.X) - Round(Width / 2);
          TForm(FPopupForm).Top := Round(Pos.Y);
          Exit;
        end;
    end;
    if FScene <> nil then
      Pos := FScene.LocalToScreen(PointF(LocalPos.X, LocalPos.Y))
    else
      Pos := LocalPos;
  end
  else
  begin
    case Placement of
      TPlacement.plBottom:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(HorizontalOffset, Target.Height + VerticalOffset)
          else
            LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Bottom + VerticalOffset);
        end;
      TPlacement.plTop:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(HorizontalOffset, -Height - HorizontalOffset)
          else
            LocalPos := PointF(FPlacementRectangle.Left + HorizontalOffset, FPlacementRectangle.Top - Height -
              VerticalOffset);
        end;
      TPlacement.plLeft:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(-Width - HorizontalOffset, VerticalOffset)
          else
            LocalPos := PointF(FPlacementRectangle.Left - Width - HorizontalOffset,
              FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plRight:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(Target.Width + HorizontalOffset, VerticalOffset)
          else
            LocalPos := PointF(FPlacementRectangle.Right + HorizontalOffset, FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plBottomCenter:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(HorizontalOffset - (Width / 2) + (Target.Width / 2), Target.Height + VerticalOffset)
          else
            LocalPos := PointF((FPlacementRectangle.Left + FPlacementRectangle.Right) / 2 - (Width / 2) +
              HorizontalOffset, FPlacementRectangle.Bottom + VerticalOffset);
        end;
      TPlacement.plTopCenter:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(HorizontalOffset - (Width / 2) + (Target.Width / 2), -Height - HorizontalOffset)
          else
            LocalPos := PointF((FPlacementRectangle.Left + FPlacementRectangle.Right) / 2 - (Width / 2) +
              HorizontalOffset, FPlacementRectangle.Top - Height - VerticalOffset);
        end;
      TPlacement.plLeftCenter:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(-Width - HorizontalOffset, VerticalOffset - (Height / 2) + (Target.Height / 2))
          else
            LocalPos := PointF(FPlacementRectangle.Left - Width - HorizontalOffset,
              FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plRightCenter:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF(Target.Width + HorizontalOffset, VerticalOffset - (Height / 2) + (Target.Height / 2))
          else
            LocalPos := PointF(FPlacementRectangle.Right + HorizontalOffset, FPlacementRectangle.Top + VerticalOffset);
        end;
      TPlacement.plCenter:
        begin
          if FPlacementRectangle.Empty then
            LocalPos := PointF((Target.Width - Width) / 2, (Target.Height - Height) / 2)
          else
            LocalPos := PointF(FPlacementRectangle.Left + (FPlacementRectangle.Right - FPlacementRectangle.Left - Width)
              / 2, FPlacementRectangle.Top + (FPlacementRectangle.Bottom - FPlacementRectangle.Top - Height) / 2);
          LocalPos.X := LocalPos.X + HorizontalOffset;
          LocalPos.Y := LocalPos.Y + VerticalOffset;
        end;
      TPlacement.plAbsolute:
        begin
          TForm(FPopupForm).Left := Round(FPlacementRectangle.Left);
          TForm(FPopupForm).Top := Round(FPlacementRectangle.Top);
          Exit;
        end;
      TPlacement.plMouse:
        begin
          Pos := Platform.GetMousePos;
          TForm(FPopupForm).Left := Round(Pos.X);
          TForm(FPopupForm).Top := Round(Pos.Y);
          Exit;
        end;
      TPlacement.plMouseCenter:
        begin
          Pos := Platform.GetMousePos;
          TForm(FPopupForm).Left := Round(Pos.X) - Round(Width / 2);
          TForm(FPopupForm).Top := Round(Pos.Y);
          Exit;
        end;
    end;
    AbsolutePos := Target.LocalToScreen(LocalPos);
    Pos := PointF(AbsolutePos.X, AbsolutePos.Y);
  end;

  TForm(FPopupForm).Left := Round(Pos.X);
  TForm(FPopupForm).Top := Round(Pos.Y);
end;

procedure TPopup.Popup;
var
  NewStyle: TStyleBook;
begin
  if FAnimating then
  begin
    FIsOpen := False;
    Exit;
  end;

  FSaveScale := Scale.Point;
  FSaveParent := Parent;
  FPopupForm := TForm.CreateNew(Self);
  TForm(FPopupForm).BeginUpdate;
  try
    TForm(FPopupForm).TopMost := True;
    TForm(FPopupForm).ShowActivated := False;
    TForm(FPopupForm).StaysOpen := StaysOpen;
    TForm(FPopupForm).BorderStyle := TFmxFormBorderStyle.bsNone;
    TForm(FPopupForm).Fill.Kind := TBrushKind.bkNone;
    TForm(FPopupForm).Transparency := True;
    TForm(FPopupForm).SetBounds(0, 0, round(Width * AbsoluteMatrix.m11), round(Height * AbsoluteMatrix.m22));
    TForm(FPopupForm).OnClose := DoFormClose;
  finally
    TForm(FPopupForm).EndUpdate;
  end;

  TForm(FPopupForm).StyleBook := FStyleBook;
  Scale.X := AbsoluteMatrix.m11;
  Scale.Y := AbsoluteMatrix.m22;
  ApplyPlacement;
  { get style }
  if (FStyleBook = nil) and (FScene <> nil) then
    NewStyle := FScene.GetStyleBook
  else
    NewStyle := FStyleBook;
  { show }
  Visible := True;
  { add self }
  FSaveParent := Parent;
  FPopupForm.AddObject(Self);
  { set new scene }
  SetNewScene(TForm(FPopupForm));
  { change style }
  if NewStyle <> nil then
    TForm(FPopupForm).StyleBook := NewStyle;
  { apply resoruces }
  FNeedStyleLookup := True;
  ApplyStyleLookup;
  { show }
  TForm(FPopupForm).Show;

  if PopupList = nil then
    PopupList := TList.Create;
  if not StaysOpen then
    PopupList.Add(Self);
  { trigger }
  FIsOpen := True;
  ApplyTriggerEffect(Self, 'IsOpen');
  StartTriggerAnimation(Self, 'IsOpen');
  { drag timer }
  if FDragWithParent then
  begin
    FDragTimer := TTimer.Create(Self);
    FDragTimer.Interval := 10;
    FDragTimer.OnTimer := DoTimer;
    FDragTimer.Enabled := True;
  end;
end;

procedure TPopup.SetModalResult(const Value: TModalResult);
begin
  FModalResult := Value;
end;

function TPopup.PopupModal: TModalResult;
begin
  if FAnimating then
  begin
    FIsOpen := False;
    Exit;
  end;
  { if FPopupForm <> nil then
    begin
    if FModal then
    begin
    FModalResult := mrCancel;
    FModal := False;
    Exit;
    end;
    ClosePopup;
    Exit;
    end; }
  Popup;
  FModalResult := TForm(FPopupForm).ShowModal;
  Result := FModalResult;
  ClosePopup;
end;

procedure TPopup.DialogKey(var Key: Word; Shift: TShiftState);
begin
  inherited DialogKey(Key, Shift);
  if (Key = vkEscape) and IsOpen and not StaysOpen then
  begin
    IsOpen := False;
    Key := 0;
  end;
end;

procedure TPopup.ClosePopup;
var
  Idx, I: Integer;
begin
  if FAnimating then
    Exit;
  if (FPopupForm = nil) then
    Exit;
  if FModal and (FModalResult = 0) then
  begin
    ModalResult := mrCancel;
    Exit;
  end;
  { drag timer }
  FreeAndNil(FDragTimer);
  { trigger }
  FAnimating := True;
  FIsOpen := False;
  if not(csDestroying in ComponentState) then
  begin
    ApplyTriggerEffect(Self, 'IsOpen');
    StartTriggerAnimationWait(Self, 'IsOpen');
  end;
  { hide }
  Visible := False;
  { remove self }
  FPopupForm.RemoveObject(Self);
  TForm(FPopupForm).StyleBook := nil;
  SetNewScene(nil);
  { free }
  FPopupForm.RemoveObject(Self);
  Parent := FSaveParent;
  FSaveParent := nil;
  TForm(FPopupForm).Release;
  FPopupForm := nil;
  Scale.Point := FSaveScale;
  FAnimating := False;
  if Assigned(FOnClosePopup) then
    FOnClosePopup(Self);
  if (PopupList <> nil) then
    PopupList.Remove(Self);
end;

procedure TPopup.DoExit;
begin
  inherited;
end;

procedure TPopup.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (AComponent = FPlacementTarget) and (Operation = opRemove) then
    FPlacementTarget := nil;
  if (AComponent = FSaveParent) and (Operation = opRemove) then
    FSaveParent := nil;
end;

procedure TPopup.SetIsOpen(const Value: Boolean);
begin
  if FIsOpen <> Value then
  begin
    if (csDesigning in ComponentState) then
    begin
      FIsOpen := False;
      Exit;
    end;
    FIsOpen := Value;
    if FIsOpen then
      Popup
    else
      ClosePopup;
  end;
end;

procedure TPopup.DoFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FIsOpen) and (not StaysOpen) then
  begin
    if FModal then
    begin
      TForm(FPopupForm).ModalResult := mrCancel;
      Action := TCloseAction.caFree;
    end
    else
      ClosePopup;
  end;
end;

procedure TPopup.DoTimer(Sender: TObject);
begin
  if not (Placement in [TPlacement.plMouse, TPlacement.plMouseCenter]) then
    ApplyPlacement;
end;

procedure TPopup.SetPlacementRectangle(const Value: TBounds);
begin
end;

{ TTimer }

const
  cIdNoTimer = TFmxHandle(-1);

constructor TTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInterval := 1000;
  FTimerHandle := cIdNoTimer;
  FEnabled := True;
end;

destructor TTimer.Destroy;
begin
  FOnTimer := nil;
  FEnabled := False;
  KillTimer;
  inherited Destroy;
end;

procedure TTimer.KillTimer;
begin
  if FTimerHandle <> cIdNoTimer then
  begin
    Platform.DestroyTimer(FTimerHandle);
    FTimerHandle := cIdNoTimer;
  end;
end;

procedure TTimer.Loaded;
begin
  inherited Loaded;
  UpdateTimer;
end;

procedure TTimer.UpdateTimer;
begin
  KillTimer;
  if (FEnabled) and (FInterval > 0) and (([csDesigning, csLoading, csDestroying] * ComponentState = [])) and
    Assigned(FOnTimer) then
  begin
    FTimerHandle := Platform.CreateTimer(FInterval, Timer);
  end;
end;

procedure TTimer.Timer;
begin
  if (FEnabled) and (FInterval > 0) then
    DoOnTimer;
end;

procedure TTimer.SetOnTimer(Value: TNotifyEvent);
begin
  if @Value = @FOnTimer then
    Exit;
  FOnTimer := Value;
  UpdateTimer;
end;

procedure TTimer.DoOnTimer;
begin
  if Assigned(FOnTimer) then
    FOnTimer(Self);
end;

procedure TTimer.SetEnabled(Value: Boolean);
begin
  if (Value <> FEnabled) then
  begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TTimer.SetInterval(Value: Cardinal);
begin
  if (Value <> FInterval) then
  begin
    FInterval := Value;
    UpdateTimer;
  end;
end;

{ TCanvasSaveState }

procedure TCanvasSaveState.Assign(Source: TPersistent);
var
  LCanvas: TCanvas;
begin
  if Source is TCanvas then
  begin
    LCanvas := TCanvas(Source);
    Self.FAssigned := True;
    Self.FMatrix := LCanvas.FMatrix;
    Self.FFill.Assign(LCanvas.Fill);
    Self.FStroke.Assign(LCanvas.Stroke);
    Self.FFont.Assign(LCanvas.Font);
    Self.FStrokeThickness := LCanvas.StrokeThickness;
    Self.FStrokeCap := LCanvas.StrokeCap;
    Self.FStrokeJoin := LCanvas.StrokeJoin;
    Self.FStrokeDash := LCanvas.StrokeDash;
    Self.FDash := Copy(LCanvas.FDash);
    Self.FDashOffset := LCanvas.FDashOffset;
  end else
    inherited;
end;

procedure TCanvasSaveState.AssignTo(Dest: TPersistent);
var
  LCanvas: TCanvas;
begin
  if Dest is TCanvas then
  begin
    LCanvas := TCanvas(Dest);
    Self.FAssigned := False;
    LCanvas.SetMatrix(Self.FMatrix);
    LCanvas.Fill.Assign(Self.FFill);
    LCanvas.Stroke.Assign(Self.FStroke);
    LCanvas.Font.Assign(Self.FFont);
    LCanvas.FStrokeThickness := Self.FStrokeThickness;
    LCanvas.FStrokeCap := Self.FStrokeCap;
    LCanvas.FStrokeJoin := Self.FStrokeJoin;
    LCanvas.FStrokeDash := Self.FStrokeDash;
    LCanvas.FDash := Copy(Self.FDash);
    LCanvas.FDashOffset := Self.FDashOffset;
  end else
    inherited;
end;

constructor TCanvasSaveState.Create;
begin
  inherited Create;
  FFont := TFont.Create;
  FFill := TBrush.Create(TBrushKind.bkSolid, TAlphaColors.Black);
  FStroke := TBrush.Create(TBrushKind.bkSolid, TAlphaColors.White);
end;

destructor TCanvasSaveState.Destroy;
begin
  FFont.Free;
  FFill.Free;
  FStroke.Free;
  inherited;
end;

procedure FreeFmxGlobals;
begin
  FreeAndNil(PopupList);
  FreeAndNil(AniThread);
  FreeAndNil(ResourceList);
  FreeAndNil(CollectLang);
  FreeAndNil(Lang);
  FreeAndNil(SceneList);
  FreeAndNil(MeasureBitmap);
  FreeAndNil(Platform);
end;

function GetDefaultBitmapCodec(C: TBitmapCodecClass): TBitmapCodec;
begin
  Result := C.Create;
end;

{ TTextService }

constructor TTextService.Create(const Owner: TControl; SupportMultiLine: Boolean);
var
  P : TPoint;
begin
  inherited Create;
  FOwner := Owner;
  FMultiLine := SupportMultiLine;
  P.X := 0; P.Y := 0;
  CaretPosition := P;
end;

destructor TTextService.Destroy;
begin
  FOwner := nil;
  inherited Destroy;
end;

function TTextService.GetNextWordBeginPosition(StartPosition: Integer): Integer;
var
  SpaceFound, WordFound: Boolean;
  LLineText: WideString;
  CurPos: Integer;
  CurLine: Integer;
begin
  Result := StartPosition;

  if FMultiLine then
  begin
    //
  end
  else
  begin
    SpaceFound := False;
    WordFound := False;
    while (Result + 2 <= Length(Text)) and ((not((Text[Result + 1] <> Space) and SpaceFound)) or not WordFound) do
    begin
      if Text[Result + 1] = Space then
        SpaceFound := True;
      if Text[Result + 1] <> Space then
      begin
        WordFound := True;
        SpaceFound := False;
      end;

      Result := Result + 1;
    end;
    if not SpaceFound then
      Result := Result + 1;
  end;
end;

function TTextService.GetPrevWordBeginPosition(StartPosition: Integer): Integer;
var
  WordFound: Boolean;
begin
  Result := StartPosition;
  if FMultiLine then
  begin
    //
  end
  else
  begin
    WordFound := False;
    while (Result > 0) and ((Text[Result] <> Space) or not WordFound) do
    begin
      if Text[Result] <> Space then
        WordFound := True;
      Result := Result - 1;
    end;
  end;
end;

function TTextService.GetNextCharacterPosition(StartPosition: Integer): Integer;
begin
  if FMultiLine then
  begin
    //
  end
  else
  begin
    Result := StartPosition + 1;
  end;
end;

function TTextService.GetPrevCharacterPosition(StartPosition: Integer): Integer;
begin
  if FMultiLine then
  begin
    //
  end
  else
  begin
    Result := StartPosition - 1;
  end;
end;

{ TLineMetricInfo }

constructor TLineMetricInfo.Create;
begin
  inherited;
  Clear;
end;

destructor TLineMetricInfo.Destroy;
begin
  Clear;
  inherited;
end;

function TLineMetricInfo.GetCount: integer;
begin
  Result := Length(FLineMetrics);
end;

function TLineMetricInfo.GetMetrics(Index: Integer): PLineMetric;
begin
  Result := @FLineMetrics[Index];
end;

procedure TLineMetricInfo.SetCount(const Value: Integer);
begin
  if Count <> Value then
    SetLength(FLineMetrics, Value);
end;

procedure TLineMetricInfo.Clear;
begin
  SetLength(FLineMetrics, 0);
end;

initialization
  RegisterFmxClasses([TBitmap, TPathData, TBrush, TBounds, TPosition, TGradient,
    TGradientPoints, TGradientPoint, TBrushGrab, TStyleBook, TFmxObject, TStyledControl,
    TContent, TBrushObject, TPathObject, TBitmapObject, TPopup, TTimer],
    [TBrushGrab, TBitmap, TPathData, TBounds, TPosition, TGradient, TBrush,
    TGradientPoints, TGradientPoint]);

  //RegisterIntegerConsts(TypeInfo(TAlphaColor), IdentToColor, ColorToIdent);
  RegisterAlphaColorIntegerConsts;
  RegisterCursorIntegerConsts;

  {$IFNDEF FPC}
  USFormatSettings := TFormatSettings.Create('en-us');
  {$ELSE}
  USFormatSettings.DecimalSeparator := '.';
  {$ENDIF}
finalization
  FreeFmxGlobals;
end.

