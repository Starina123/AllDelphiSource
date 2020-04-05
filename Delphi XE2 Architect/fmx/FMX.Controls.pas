{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Controls;

{$I FMX.Defines.inc}
interface

uses
  System.Classes, System.Types, System.UITypes,
  FMX.Forms, FMX.Types, FMX.Objects, FMX.Ani;

{$SCOPEDENUMS ON}

type

{ TPanel }

  TPanel = class(TStyledControl)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property StyleLookup;
  end;

{ TCalloutPanel }

  TCalloutPanel = class(TPanel)
  private
    FCalloutLength: Single;
    FCalloutWidth: Single;
    FCalloutPosition: TCalloutPosition;
    FCalloutOffset: Single;
    procedure SetCalloutLength(const Value: Single);
    procedure SetCalloutPosition(const Value: TCalloutPosition);
    procedure SetCalloutWidth(const Value: Single);
    procedure SetCalloutOffset(const Value: Single);
  protected
    procedure ApplyStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CalloutWidth: Single read FCalloutWidth write SetCalloutWidth;
    property CalloutLength: Single read FCalloutLength write SetCalloutLength;
    property CalloutPosition: TCalloutPosition read FCalloutPosition write SetCalloutPosition
      default TCalloutPosition.cpTop;
    property CalloutOffset: Single read FCalloutOffset write SetCalloutOffset;
  end;

{ TLabel }

  TLabel = class(TTextControl)
  private
    FWordWrap: Boolean;
    FAutoSize: Boolean;
    procedure SetWordWrap(const Value: Boolean);
    procedure SetAutoSize(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure SetText(const Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property AutoTranslate default True;
    property BindingSource;
    property Font;
    property TextAlign;
    property VertTextAlign;
    property Text;
    property StyleLookup;
    property HitTest default False;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default True;
  end;

{ TCustomButton }

  TCustomButton = class(TTextControl)
  private
    FPressing: Boolean;
    FIsPressed: Boolean;
    FModalResult: TModalResult;
    FStaysPressed: Boolean;
    FRepeatTimer: TTimer;
    FRepeat: Boolean;
    procedure SetIsPressed(const Value: Boolean);
  protected
    procedure Click; override;
    procedure DblClick; override;
    procedure SetData(const Value: Variant); override;
    procedure ApplyStyle; override;
    procedure DoRepeatTimer(Sender: TObject);
    procedure DoRepeatDelayTimer(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
  published
    property Action;
    property AutoTranslate default True;
    property StaysPressed: Boolean read FStaysPressed write FStaysPressed default False;
    { triggers }
    property IsPressed: Boolean read FIsPressed write SetIsPressed default False;
    { props }
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Font;
    property ModalResult: TModalResult read FModalResult write FModalResult default mrNone;
    property TextAlign default TTextAlign.taCenter;
    property Text;
    property RepeatClick: Boolean read FRepeat write FRepeat default False;
    property WordWrap default False;
    property StyleLookup;
  end;

{ TButton }

  TButton = class(TCustomButton)
  private
    FDefault: Boolean;
    FCancel: Boolean;
  protected
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
  published
    property CanFocus default True;
    property DisableFocusEffect;
    property Default: Boolean read FDefault write FDefault default False;
    property Cancel: Boolean read FCancel write FCancel default False;
    property TabOrder;
  end;

  TSpeedButton = class(TCustomButton)
  end;

{ TCheckBox }

  TCheckBox = class(TTextControl)
  private
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FIsPressed: Boolean;
    FIsChecked: Boolean;
    procedure SetIsChecked(const Value: Boolean);
  protected
    procedure DoExit; override;
    procedure ApplyStyle; override;
    function CanObserve(const ID: Integer): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
  published
    { triggers }
    property IsPressed: Boolean read FIsPressed default False;
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    { props }
    property AutoTranslate default True;
    property BindingSource;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Font;
    property TextAlign;
    property Text;
    property StyleLookup;
    property WordWrap;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TRadioButton }

  TRadioButton = class(TTextControl)
  private
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FIsPressed: Boolean;
    FIsChecked: Boolean;
    FGroupName: string;
    procedure SetIsChecked(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure DoEnter; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
  published
    { triggers }
    property IsPressed: Boolean read FIsPressed;
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    { props }
    property AutoTranslate default True;
    property BindingSource;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Font;
    property TextAlign;
    property Text;
    property StyleLookup;
    property WordWrap;
    property GroupName: string read FGroupName write FGroupName;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TGroupBox }

  TGroupBox = class(TTextControl)
  protected
    procedure ApplyStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoTranslate default True;
    property Font;
    property Text;
    property StyleLookup;
  end;

{ TStatusBar }

  TStatusBar = class(TStyledControl)
  private
    FShowSizeGrip: Boolean;
    procedure SetShowSizeGrip(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align default TAlignLayout.alBottom;
    property StyleLookup;
    property ShowSizeGrip: Boolean read FShowSizeGrip write SetShowSizeGrip;
  end;

{ TToolBar }

  TToolBar = class(TStyledControl)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align default TAlignLayout.alTop;
    property StyleLookup;
  end;

{ TSizeGrip }

  TSizeGrip = class(TStyledControl, ISizeGrip)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property StyleLookup;
  end;

{ TSplitter }

  TSplitter = class(TStyledControl)
  private
    FPressed: Boolean;
    FControl: TControl;
    FDownPos: TPointF;
    FMinSize: Single;
    FMaxSize: Single;
    FNewSize, FOldSize: Single;
    FSplit: Single;
    FShowGrip: Boolean;
    procedure SetShowGrip(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure Paint; override;
    procedure SetAlign(const Value: TAlignLayout); override;
    function FindObject: TControl;
    procedure CalcSplitSize(X, Y: Single; var NewSize, Split: Single);
    procedure UpdateSize(X, Y: Single);
    function DoCanResize(var NewSize: Single): Boolean;
    procedure UpdateControlSize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  published
    property MinSize: Single read FMinSize write FMinSize;
    property ShowGrip: Boolean read FShowGrip write SetShowGrip default True;
  end;

{ TProgressBar }

  TProgressBar = class(TStyledControl)
  private
    FMin: Single;
    FValue: Single;
    FMax: Single;
    FOrientation: TOrientation;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetOrientation(const Value: TOrientation);
    procedure SetValue(const Value: Single);
  protected
    procedure ApplyStyle; override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
  published
    property BindingSource;
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Value: Single read FValue write SetValue;
    property StyleLookup;
  end;

{ TThumb }

  TCustomTrack = class;
  TScrollBar = class;

  TThumb = class(TStyledControl)
  private
    FTrack: TCustomTrack;
    FDownOffset: TPointF;
    FPressed: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  published
    property IsPressed: Boolean read FPressed;
    property StyleLookup;
  end;

{ TCustomTrack }

  TCustomTrack = class(TStyledControl)
  private
    procedure SetFrequency(const Value: Single);
    function GetIsTracking: Boolean;
  protected
    FOnChange, FOnTracking: TNotifyEvent;
    FValue: Single;
    FMin: Single;
    FMax: Single;
    FViewportSize: Single;
    FIgnoreViewportSize: boolean;
    FOrientation: TOrientation;
    FTracking: Boolean;
    FFrequency: Single;
    FThumb: TThumb;
    FTrack: TControl;
    function CanObserve(const ID: Integer): Boolean; override;
    procedure SetMax(const Value: Single); virtual;
    procedure SetMin(const Value: Single); virtual;
    procedure SetValue(Value: Single); virtual;
    procedure SetViewportSize(const Value: Single);
    procedure SetOrientation(const Value: TOrientation); virtual;
    function GetThumbRect: TRectF;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoThumbClick(Sender: TObject);
    procedure DoThumbDblClick(Sender: TObject);
    procedure EndTracking; virtual;
    function GetThumbSize(var IgnoreViewportSize: boolean): integer; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    property IsTracking: Boolean read GetIsTracking;
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Frequency: Single read FFrequency write SetFrequency;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Value: Single read FValue write SetValue;
    property ViewportSize: Single read FViewportSize write SetViewportSize;
    property Tracking: Boolean read FTracking write FTracking default True;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnTracking: TNotifyEvent read FOnTracking write FOnTracking;
  end;

{ TTrack }

  TTrack = class(TCustomTrack)
  published
    property BindingSource;
    property StyleLookup;
    property Min;
    property Max;
    property Frequency;
    property Orientation;
    property Value;
    property ViewportSize;
    property Tracking;
    property OnChange;
  end;

{ TTrackBar }

  TTrackBar = class(TCustomTrack)
  protected
    procedure SetMax(const Value: Single); override;
    procedure SetMin(const Value: Single); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BindingSource;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property StyleLookup;
    property Min;
    property Max;
    property Frequency;
    property Orientation;
    property Value;
    property Tracking;
    property OnChange;
  end;

{ TBitmapTrackBar }

  TBitmapTrackBar = class(TTrackBar)
  protected
    FBitmap: TBitmap;
    FBackground: TShape;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function GetDefaultStyleLookupName: string; override;
    procedure UpdateBitmap;
    procedure FillBitmap; virtual;
    procedure SetOrientation(const Value: TOrientation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
  end;

{ TSwitch }

  TSwitch = class(TCustomTrack)
  private
    FBitmap: TBitmap;
    FOnBrush, FOffBrush: TBrush;
    FBackground: TShape;
    FOnSwitch: TNotifyEvent;
    FIsChecked: Boolean;
    procedure UpdateBitmap;
    procedure FillBitmap; virtual;
    procedure SetIsChecked(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure SetValue(Value: Single); override;
    procedure SetOrientation(const Value: TOrientation); override;
    procedure EndTracking; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
  published
    property StyleLookup;
    property IsChecked: Boolean read FIsChecked write SetIsChecked;
    property OnSwitch: TNotifyEvent read FOnSwitch write FOnSwitch;
  end;

{ TScrollBar }

  TScrollBar = class(TStyledControl)
  private
    FOnChange: TNotifyEvent;
    FValue: Single;
    FMin: Single;
    FMax: Single;
    FViewportSize: Single;
    FOrientation: TOrientation;
    FSmallChange: Single;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetValue(const Value: Single);
    procedure SetViewportSize(const Value: Single);
    procedure SetOrientation(const Value: TOrientation);
  protected
    FTrack: TCustomTrack;
    FMinButton: TCustomButton;
    FMaxButton: TCustomButton;
    procedure DoTrackChanged(Sender: TObject);
    procedure DoMinButtonClick(Sender: TObject);
    procedure DoMaxButtonClick(Sender: TObject);
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    function CanObserve(const ID: Integer): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateScroll;
  published
    property BindingSource;
    property StyleLookup;
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Value: Single read FValue write SetValue;
    property ViewportSize: Single read FViewportSize write SetViewportSize;
    property SmallChange: Single read FSmallChange write FSmallChange;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TSmallScrollBar }

  TSmallScrollBar = class(TScrollBar)
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TAniIndicator }

  TAniIndicatorStyle = (aiLinear, aiCircular);

  TAniIndicator = class(TStyledControl)
  private
    FDragTimer: TTimer;
    FLayout: TControl;
    FAni: TFloatAnimation;
    FEnabled: Boolean;
    FStyle: TAniIndicatorStyle;
    FFill: TBrush;
    procedure SetEnabled(const Value: Boolean);
    procedure SetStyle(const Value: TAniIndicatorStyle);
  protected  
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Style: TAniIndicatorStyle read FStyle write SetStyle default TAniIndicatorStyle.aiLinear;
  end;

{ TArcDial }

  TArcDial = class(TStyledControl)
  private
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FOldPos: TPointF;
    FSaveValue, FValue: Single;
    FFrequency: Single;
    FTracking: Boolean;
    FShowValue: Boolean;
    procedure SetValue(const Value: Single);
    procedure SetShowValue(const Value: Boolean);
  protected
    function Tick: TControl;
    function Text: TText;
    procedure ApplyStyle; override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  published
    { props }
    property BindingSource;
    property StyleLookup;
    property Frequency: Single read FFrequency write FFrequency;
    property Tracking: Boolean read FTracking write FTracking default True;
    property ShowValue: Boolean read FShowValue write SetShowValue default False;
    property Value: Single read FValue write SetValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TExpanderButton }

  TExpanderButton = class(TCustomButton)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CanFocus default False;
  end;

  TExpander = class(TTextControl)
  private
    FShowCheck: Boolean;
    FIsChecked: Boolean;
    FOnCheckChange: TNotifyEvent;
    procedure DoButtonClick(Sender: TObject);
    procedure SetIsChecked(const Value: Boolean);
    procedure SetShowCheck(const Value: Boolean);
  protected
    FIsExpanded: Boolean;
    FContent: TContent;
    FButton: TCustomButton;
    FCheck: TCheckBox;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure SetIsExpanded(const Value: Boolean); virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadContentSize(Reader: TReader);
    procedure WriteContentSize(Writer: TWriter);
    procedure DoCheckChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    procedure AddObject(AObject: TFmxObject); override;
  published
    property Font;
    property TextAlign;
    property Text;
    property StyleLookup;
    property AutoTranslate default True;
    property IsExpanded: Boolean read FIsExpanded write SetIsExpanded default True;
    property IsChecked: Boolean read FIsChecked write SetIsChecked default True;
    property ShowCheck: Boolean read FShowCheck write SetShowCheck;
    property OnCheckChange: TNotifyEvent read FOnCheckChange write FOnCheckChange;
  end;

  TImageControl = class(TStyledControl)
  private
    FImage: TImage;
    FOnChange: TNotifyEvent;
    FBitmap: TBitmap;
    FEnableOpenDialog: Boolean;
    procedure SetBitmap(const Value: TBitmap);
  protected
    function CanObserve(const ID: Integer): Boolean; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Click; override;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
    procedure DoBitmapChanged(Sender: TObject); virtual;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CanFocus default True;
    property DisableFocusEffect;
    property EnableOpenDialog: Boolean read FEnableOpenDialog write FEnableOpenDialog default True;
    property TabOrder;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TPathLabel }

  TPathLabel = class(TStyledControl)
  private
    FData: TPathData;
    FWrapMode: TPathWrapMode;
    FPath: TCustomPath;
    function GetWrapMode: TPathWrapMode;
    procedure SetWrapMode(const Value: TPathWrapMode);
    function GetData: TPathData;
    procedure SetData(const Value: TPathData);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BindingSource;
    property Data: TPathData read GetData write SetData;
    property HitTest default False;
    property StyleLookup;
    property WrapMode: TPathWrapMode read GetWrapMode write SetWrapMode
      default TPathWrapMode.pwStretch;
  end;

implementation

uses
  System.Math, System.TypInfo, System.SysUtils, System.Variants, FMX.Layouts;

{ TPanel }

constructor TPanel.Create(AOwner: TComponent);
begin
  inherited;
  Width := 120;
  Height := 100;
end;

{ TCalloutPanel }

constructor TCalloutPanel.Create(AOwner: TComponent);
begin
  inherited;
  FCalloutWidth := 23;
  FCalloutLength := 11;
end;

procedure TCalloutPanel.ApplyStyle;
var
  Back: TFmxObject;
begin
  inherited;
  Back := FindStyleResource('Background');
  if (Back = nil) and (FResourceLink is TCalloutRectangle) then
    Back := FResourceLink;
  if (Back <> nil) and (Back is TCalloutRectangle) then
  begin
    TCalloutRectangle(Back).CalloutWidth := FCalloutWidth;
    TCalloutRectangle(Back).CalloutLength := FCalloutLength;
    TCalloutRectangle(Back).CalloutPosition := FCalloutPosition;
    TCalloutRectangle(Back).CalloutOffset := FCalloutOffset;
  end;
end;

procedure TCalloutPanel.SetCalloutLength(const Value: Single);
begin
  if FCalloutLength <> Value then
  begin
    FCalloutLength := Value;
    case FCalloutPosition of
      TCalloutPosition.cpTop:   Margins.Top := Value;
      TCalloutPosition.cpLeft:  Margins.Left := Value;
      TCalloutPosition.cpBottom:Margins.Bottom := Value ;
      TCalloutPosition.cpRight: Margins.Right := Value;
    end;
    ApplyStyle;
  end;
end;

procedure TCalloutPanel.SetCalloutPosition(const Value: TCalloutPosition);
begin
  if FCalloutPosition <> Value then
  begin
    FCalloutPosition := Value;
    ApplyStyle;
  end;
end;

procedure TCalloutPanel.SetCalloutWidth(const Value: Single);
begin
  if FCalloutWidth <> Value then
  begin
    FCalloutWidth := Value;
    ApplyStyle;
  end;
end;

procedure TCalloutPanel.SetCalloutOffset(const Value: Single);
begin
  if FCalloutOffset <> Value then
  begin
    FCalloutOffset := Value;
    ApplyStyle;
  end;
end;

{ TStatusBar }

constructor TStatusBar.Create(AOwner: TComponent);
begin
  inherited;
  FShowSizeGrip := True;
  Height := 22;
  Align := TAlignLayout.alBottom;
  SetAcceptsControls(False);
end;

procedure TStatusBar.ApplyStyle;
var
  sizeGrip: TFmxObject;
begin
  inherited;
  sizeGrip := FindStyleResource('sizegrip');
  if (sizeGrip <> nil) and (sizeGrip is TControl) then
  begin
    TControl(sizeGrip).Visible := FShowSizeGrip;
    if not(csDesigning in ComponentState) then
    begin
      TControl(sizeGrip).Locked := False;
      TControl(sizeGrip).HitTest := True;
    end;
  end;
end;

procedure TStatusBar.SetShowSizeGrip(const Value: Boolean);
begin
  if FShowSizeGrip <> Value then
  begin
    FShowSizeGrip := Value;
    StyleLookup := FStyleLookup;
  end;
end;

{ TToolBar }

constructor TToolBar.Create(AOwner: TComponent);
begin
  inherited;
  Height := 40;
  Align := TAlignLayout.alTop;
end;

{ TLabel }

constructor TLabel.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  Width := 120;
  Height := 15;
  FWordWrap := True;
  HitTest := False;
  SetAcceptsControls(False);
end;

procedure TLabel.ApplyStyle;
var
  T: TFmxObject;
  S: TAlignLayout;
begin
  inherited;
  T := FindStyleResource('text');
  if (T <> nil) and (T is TText) then
  begin
    TText(T).WordWrap := WordWrap;
    if AutoSize and (FText <> '') then
    begin
      FWordWrap := False;
      TText(T).WordWrap := False;
      TText(T).VertTextAlign := TTextAlign.taLeading;
      TText(T).HorzTextAlign := TTextAlign.taLeading;

      S := TText(T).Align;
      TText(T).Align := TAlignLayout.alNone;
      TText(T).AutoSize := True;
      Width := TText(T).Width;
      Height := TText(T).Height;
      TText(T).AutoSize := False;
      TText(T).Align := S;
    end;
  end;
end;

procedure TLabel.SetWordWrap(const Value: Boolean);
var
  T: TFmxObject;
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    T := FindStyleResource('text');
    if (T <> nil) and (T is TText) then
      TText(T).WordWrap := Value;
  end;
end;

procedure TLabel.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if FAutoSize then
    begin
      ApplyStyle;
    end;
  end;
end;

procedure TLabel.SetText(const Value: string);
begin
  if Value <> FText then
  begin
    inherited;
    if FAutoSize then
      ApplyStyle;
  end
  else
    inherited;
end;

{ TCustomButton }

procedure TCustomButton.ApplyStyle;
begin
  inherited;
  if IsPressed then
  begin
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

constructor TCustomButton.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  WordWrap := False;
  TextAlign := TTextAlign.taCenter;
  Width := 80;
  Height := 22;
  AutoCapture := True;
  CanFocus := True;
  SetAcceptsControls(False);
end;

destructor TCustomButton.Destroy;
begin
  inherited;
end;

procedure TCustomButton.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (Key = vkReturn) or (Key = vkSpace) then
  begin
    Click;
  end;
end;

procedure TCustomButton.DoRepeatTimer(Sender: TObject);
begin
  Click;
end;

procedure TCustomButton.DoRepeatDelayTimer(Sender: TObject);
begin
  FRepeatTimer.OnTimer := DoRepeatTimer;
  FRepeatTimer.Interval := 100;
end;

procedure TCustomButton.DblClick;
begin
  inherited;
  Click;
end;

procedure TCustomButton.Click;
var
  O: TComponent;
begin
  if Assigned(Self) and (ModalResult <> mrNone) then
  begin
    O := Scene.GetObject;
    while O <> nil do
    begin
      if (O is TCommonCustomForm) then
      begin
        TCommonCustomForm(O).ModalResult := FModalResult;
        Break;
      end;
      O := O.Owner;
    end;
  end;
  inherited;
end;

procedure TCustomButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    if FStaysPressed then
      FIsPressed := not FIsPressed
    else
    begin
      FIsPressed := True;
      if FRepeat then
      begin
        if FRepeatTimer = nil then
        begin
          FRepeatTimer := TTimer.Create(Self);
          FRepeatTimer.Interval := 500;
        end;
        FRepeatTimer.OnTimer := DoRepeatDelayTimer;
        FRepeatTimer.Enabled := True;
      end;
    end;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

procedure TCustomButton.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (ssLeft in Shift) and (FPressing) then
  begin
    if FIsPressed <> PointInRect(PointF(X, Y), LocalRect) then
    begin
      if not FStaysPressed then
      begin
        FIsPressed := PointInRect(PointF(X, Y), LocalRect);
        StartTriggerAnimation(Self, 'IsPressed');
        ApplyTriggerEffect(Self, 'IsPressed');
      end;
    end;
  end;
end;

procedure TCustomButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FPressing then
  begin
    if FRepeatTimer <> nil then
      FRepeatTimer.Enabled := False;
    FPressing := False;
    if not FStaysPressed then
    begin
      FIsPressed := False;
      StartTriggerAnimation(Self, 'IsPressed');
      ApplyTriggerEffect(Self, 'IsPressed');
    end;
  end;
  inherited;
end;

procedure TCustomButton.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnClick := VariantToEvent(Value);
end;

procedure TCustomButton.SetIsPressed(const Value: Boolean);
begin
  if FStaysPressed then
  begin
    if Value <> FIsPressed then
    begin
      FIsPressed := Value;
      StartTriggerAnimation(Self, 'IsPressed');
      ApplyTriggerEffect(Self, 'IsPressed');
    end;
  end;
end;

{ TButton }

procedure TButton.DialogKey(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Default and (Key = vkReturn) then
  begin
    Click;
    Key := 0;
  end;
  if Cancel and (Key = vkEscape) then
  begin
    Click;
    Key := 0;
  end;
end;

{ TCheckBox }

constructor TCheckBox.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  AutoCapture := True;
  CanFocus := True;
  TextAlign := TTextAlign.taLeading;
  Width := 120;
  Height := 19;
  SetAcceptsControls(False);
end;

destructor TCheckBox.Destroy;
begin
  inherited;
end;

procedure TCheckBox.DoExit;
begin
  inherited;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
end;

function TCheckBox.GetData: Variant;
begin
  Result := IsChecked;
end;

procedure TCheckBox.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsType(Value, varBoolean) then
    IsChecked := Value
  else
    IsChecked := False;
end;

procedure TCheckBox.ApplyStyle;
begin
  inherited;
  if IsChecked then
    StartTriggerAnimation(Self, 'IsChecked');
end;

procedure TCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit;
    FPressing := True;
    FIsPressed := True;
    StartTriggerAnimation(Self, 'IsPressed');
  end;
end;

procedure TCheckBox.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (ssLeft in Shift) and (FPressing) then
  begin
    if FIsPressed <> PointInRect(PointF(X, Y), LocalRect) then
    begin
      FIsPressed := PointInRect(PointF(X, Y), LocalRect);
      StartTriggerAnimation(Self, 'IsPressed');
    end;
  end;
end;

procedure TCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressing then
  begin
    FPressing := False;
    FIsPressed := False;

    if PointInRect(PointF(X, Y), LocalRect) then
    begin
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        if TLinkObservers.EditLinkEdit(Observers) then
          TLinkObservers.EditLinkModified(Observers)
        else
        begin
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end;
      end;
      IsChecked := not IsChecked;
    end
  end;
end;

function TCheckBox.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
end;

procedure TCheckBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (Key = vkReturn) or (Key = vkSpace) then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
    begin
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit;
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
      begin
        TLinkObservers.EditLinkReset(Observers);
        Exit;
      end;
    end;
    IsChecked := not IsChecked;
  end;
end;

procedure TCheckBox.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    StartTriggerAnimation(Self, 'IsChecked');
    if Assigned(FOnChange) then
    begin
      FOnChange(Self);
    end;
  end;
end;

{ TRadioButton }

constructor TRadioButton.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  AutoCapture := True;
  CanFocus := True;
  TextAlign := TTextAlign.taLeading;
  Width := 120;
  Height := 19;
  SetAcceptsControls(False);
end;

destructor TRadioButton.Destroy;
begin
  inherited;
end;

function TRadioButton.GetData: Variant;
begin
  Result := IsChecked;
end;

procedure TRadioButton.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsType(Value, varBoolean) then
    IsChecked := Value
  else
    IsChecked := False;
end;

procedure TRadioButton.ApplyStyle;
begin
  inherited;
  if IsChecked then
    StartTriggerAnimation(Self, 'IsChecked');
end;

procedure TRadioButton.DoEnter;
begin
  inherited;
end;

procedure TRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    FIsPressed := True;
    StartTriggerAnimation(Self, 'IsPressed');
  end;
end;

procedure TRadioButton.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (ssLeft in Shift) and (FPressing) then
  begin
    if FIsPressed <> PointInRect(PointF(X, Y), LocalRect) then
    begin
      FIsPressed := PointInRect(PointF(X, Y), LocalRect);
      StartTriggerAnimation(Self, 'IsPressed');
    end;
  end;
end;

procedure TRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressing then
  begin
    FPressing := False;
    FIsPressed := False;
    if PointInRect(PointF(X, Y), LocalRect) then
    begin
      IsChecked := not IsChecked;
    end
  end;
end;

procedure TRadioButton.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (Key = vkReturn) or (Key = vkSpace) then
  begin
    IsChecked := not IsChecked;
  end;
end;

procedure TRadioButton.SetIsChecked(const Value: Boolean);
var
  List: TList;
  LUncheck: TList;
  i, C, cc: Integer;
begin
  if FIsChecked <> Value then
  begin
    // allows check/uncheck in design-mode
    if (csDesigning in ComponentState) and FIsChecked then
      FIsChecked := Value
    else
    begin
      if Value then
        FIsChecked := Value;
      { group }
      C := 0;
      cc := 0;
      if (FRoot <> nil) and (FRoot.GetObject <> nil) then
      begin
        List := TList.Create;
        LUncheck := TList.Create;
        try
          FRoot.GetObject.AddControlsToList(List);
          for i := 0 to List.Count - 1 do
            if (TFmxObject(List[i]) is TRadioButton) and (TFmxObject(List[i]) <> Self) and
              (TRadioButton(List[i]).CheckForAllowFocus) and (TRadioButton(List[i]).GroupName = GroupName) then
            begin
              if TRadioButton(List[i]).IsChecked then
                cc := cc + 1;
              if Value then
                LUncheck.Add(List[i]);
              C := C + 1;
            end;
          for i := 0 to LUncheck.Count - 1 do
            TRadioButton(LUncheck[i]).IsChecked := False;
        finally
          List.Free;
          LUncheck.Free;
        end;
      end;
      { check }
      if not Value and (C = 0) then
        Exit;
      if not Value and (cc = 0) then
        Exit;
      FIsChecked := Value;
    end;
    // visual feedback
    StartTriggerAnimation(Self, 'IsChecked');
    { event }
    if Assigned(FOnChange) then
    begin
      FOnChange(Self);
    end;
  end;
end;

{ TSizeGrip }

constructor TSizeGrip.Create(AOwner: TComponent);
begin
  inherited;
  SetAcceptsControls(False);
end;

destructor TSizeGrip.Destroy;
begin
  inherited;
end;

{ TGroupBox }

constructor TGroupBox.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  CanFocus := False;
  Width := 120;
  Height := 100;
end;

destructor TGroupBox.Destroy;
begin
  inherited;
end;

procedure TGroupBox.ApplyStyle;
begin
  inherited;
end;

{ TSplitter }

constructor TSplitter.Create(AOwner: TComponent);
begin
  inherited;
  FMinSize := 20;
  FShowGrip := True;
  AutoCapture := True;
  Width := 5;
  Align := TAlignLayout.alLeft;
  Cursor := crHSplit;
  SetAcceptsControls(False);
end;

destructor TSplitter.Destroy;
begin
  inherited;
end;

procedure TSplitter.ApplyStyle;
var
  grip: TFmxObject;
begin
  inherited;
  grip := FindStyleResource('grip');
  if (grip <> nil) and (grip is TControl) then
  begin
    TControl(grip).Visible := FShowGrip;
  end;
end;

procedure TSplitter.Paint;
var
  R: TRectF;
begin
  inherited;
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
end;

procedure TSplitter.SetAlign(const Value: TAlignLayout);
begin
  inherited;
  if Align in [TAlignLayout.alTop, TAlignLayout.alBottom] then
    Cursor := crVSplit
  else
    Cursor := crHSplit;
end;

function TSplitter.FindObject: TControl;
var
  P: TPointF;
  i: Integer;
  R: TRectF;
begin
  Result := nil;
  P := Position.Point;
  case Align of
    TAlignLayout.alLeft, TAlignLayout.alMostLeft:
      P.X := P.X - 1;
    TAlignLayout.alRight, TAlignLayout.alMostRight:
      P.X := P.X + Width + 1;
    TAlignLayout.alTop:
      P.Y := P.Y - 1;
    TAlignLayout.alBottom:
      P.Y := P.Y + Height + 1;
  else
    Exit;
  end;
  if Parent <> nil then
    for i := 0 to Parent.ChildrenCount - 1 do
    begin
      if not(Parent.Children[i] is TControl) then
        Continue;
      if TControl(Parent.Children[i]).Locked then
        Continue;
      if (Align in [TAlignLayout.alLeft, TAlignLayout.alMostLeft, TAlignLayout.alRight, TAlignLayout.alMostRight]) and
        not((TControl(Parent.Children[i]).Align in [TAlignLayout.alLeft, TAlignLayout.alMostLeft, TAlignLayout.alRight, TAlignLayout.alMostRight])) then
        Continue;
      if (Align in [TAlignLayout.alTop, TAlignLayout.alBottom, TAlignLayout.alMostTop, TAlignLayout.alMostBottom]) and
        not((TControl(Parent.Children[i]).Align in [TAlignLayout.alTop, TAlignLayout.alBottom, TAlignLayout.alMostTop, TAlignLayout.alMostBottom])) then
        Continue;

      Result := TControl(Parent.Children[i]);
      if Result.Visible then
      begin
        R := Result.LocalRect;
        OffsetRect(R, Result.Position.X, Result.Position.Y);
        if (R.right - R.left) = 0 then
          if Align in [TAlignLayout.alTop, TAlignLayout.alLeft, TAlignLayout.alMostLeft] then
            R.left := R.left - 1
          else
            R.right := R.right + 1;
        if (R.bottom - R.top) = 0 then
          if Align in [TAlignLayout.alTop, TAlignLayout.alLeft, TAlignLayout.alMostLeft] then
            R.top := R.top - 1
          else
            R.bottom := R.bottom + 1;
        if PointInRect(P, R) then
          Exit;
      end;
    end;
  Result := nil;
end;

procedure TSplitter.UpdateSize(X, Y: Single);
begin
  CalcSplitSize(X, Y, FNewSize, FSplit);
end;

procedure TSplitter.CalcSplitSize(X, Y: Single; var NewSize, Split: Single);
var
  S: Single;
begin
  if Align in [TAlignLayout.alLeft, TAlignLayout.alRight, TAlignLayout.alMostLeft, TAlignLayout.alMostRight] then
    Split := X - FDownPos.X
  else
    Split := Y - FDownPos.Y;
  S := 0;
  case Align of
    TAlignLayout.alLeft, TAlignLayout.alMostLeft:
      S := FControl.Width + Split;
    TAlignLayout.alRight, TAlignLayout.alMostRight:
      S := FControl.Width - Split;
    TAlignLayout.alTop:
      S := FControl.Height + Split;
    TAlignLayout.alBottom:
      S := FControl.Height - Split;
  end;
  NewSize := S;
  if S < FMinSize then
    NewSize := FMinSize
  else if S > FMaxSize then
    NewSize := FMaxSize;
  if S <> NewSize then
  begin
    if Align in [TAlignLayout.alRight, TAlignLayout.alMostRight, TAlignLayout.alBottom] then
      S := S - NewSize
    else
      S := NewSize - S;
    Split := Split + S;
  end;
end;

function TSplitter.DoCanResize(var NewSize: Single): Boolean;
begin
  Result := True;
  if (NewSize <= FMinSize) { and FAutoSnap } then
    NewSize := FMinSize;
end;

procedure TSplitter.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  i: Integer;
  C: IContainerObject;
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and Supports(Parent, IContainerObject, C) then
  begin
    FPressed := True;
    FDownPos := PointF(X, Y);
    FControl := FindObject;
    if Assigned(FControl) then
    begin
      if Align in [TAlignLayout.alLeft, TAlignLayout.alMostLeft, TAlignLayout.alRight, TAlignLayout.alMostRight] then
      begin
        FMaxSize := C.ContainerWidth - FMinSize;
        if Parent is TControl then
          FMaxSize := FMaxSize - TControl(Parent).Margins.left - TControl(Parent).Margins.right;
        for i := 0 to Parent.ChildrenCount - 1 do
        begin
          if not(Parent.Children[i] is TControl) then
            Continue;
          with TControl(Parent.Children[i]) do
            if (Align in [TAlignLayout.alLeft, TAlignLayout.alRight, TAlignLayout.alMostLeft, TAlignLayout.alMostRight]) then
              FMaxSize := FMaxSize - Width - Padding.left - Padding.right;
        end;
        FMaxSize := FMaxSize + FControl.Width;
      end
      else
      begin
        FMaxSize := C.ContainerHeight - FMinSize;
        if Parent is TControl then
          FMaxSize := FMaxSize - TControl(Parent).Margins.top - TControl(Parent).Margins.bottom;
        for i := 0 to Parent.ChildrenCount - 1 do
        begin
          if not(Parent.Children[i] is TControl) then
            Continue;
          with TControl(Parent.Children[i]) do
            if Align in [TAlignLayout.alTop, TAlignLayout.alBottom] then
              FMaxSize := FMaxSize - Height - Padding.top - Padding.bottom;
        end;
        FMaxSize := FMaxSize + FControl.Height;
      end;
      UpdateSize(X, Y);
    end;
  end;
end;

procedure TSplitter.MouseMove(Shift: TShiftState; X, Y: Single);
var
  NewSize, Split: Single;
begin
  inherited;
  if FPressed and Assigned(FControl) then
  begin
    CalcSplitSize(X, Y, NewSize, Split);
    if DoCanResize(NewSize) then
    begin
      FNewSize := NewSize;
      FSplit := Split;
      UpdateControlSize;
    end;
  end;
end;

procedure TSplitter.UpdateControlSize;
begin
  if FNewSize <> FOldSize then
  begin
    case Align of
      TAlignLayout.alLeft, TAlignLayout.alMostLeft:
        FControl.Width := FNewSize;
      TAlignLayout.alTop:
        FControl.Height := FNewSize;
      TAlignLayout.alRight, TAlignLayout.alMostRight:
        begin
          FControl.Position.X := FControl.Position.X + (FControl.Width - FNewSize);
          FControl.Width := FNewSize;
        end;
      TAlignLayout.alBottom:
        begin
          FControl.Position.Y := FControl.Position.Y + (FControl.Height - FNewSize);
          FControl.Height := FNewSize;
        end;
    end;
    // if Assigned(FOnMoved) then FOnMoved(Self);
    FOldSize := FNewSize;
  end;
end;

procedure TSplitter.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FPressed := False;
  FControl := nil;
end;

procedure TSplitter.SetShowGrip(const Value: Boolean);
begin
  if FShowGrip <> Value then
  begin
    FShowGrip := Value;
    ApplyStyle;
  end;
end;

{ TProgressBar }

constructor TProgressBar.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
  FMax := 100;
  Width := 100;
  Height := 20;
  SetAcceptsControls(False);
end;

destructor TProgressBar.Destroy;
begin
  inherited;
end;

function TProgressBar.GetData: Variant;
begin
  Result := Value;
end;

procedure TProgressBar.SetData(const Value: Variant);
begin
  if VarIsNumeric(Value) then
    Self.Value := Value
  else
    Self.Value := Min
end;

procedure TProgressBar.ApplyStyle;
var
  i: TFmxObject;
begin
  inherited;
  if Orientation = TOrientation.orHorizontal then
  begin
    i := FindStyleResource('hindicator');
    if (i <> nil) and (i is TControl) then
      TControl(i).StartTriggerAnimation(Self, 'IsVisible');
  end
  else
  begin
    i := FindStyleResource('vindicator');
    if (i <> nil) and (i is TControl) then
      TControl(i).StartTriggerAnimation(Self, 'IsVisible');
  end;
  Realign;
end;

procedure TProgressBar.Realign;
var
  hI, vI, T: TFmxObject;
begin
  if not FDisableAlign then
  begin
    FDisableAlign := True;
    T := nil;
    case Orientation of
      TOrientation.orHorizontal:
      begin
        T := FindStyleResource('vtrack');
        if (T <> nil) and (T is TControl) then
          TControl(T).Visible := False;
        T := FindStyleResource('htrack')
      end;
      TOrientation.orVertical:
      begin
        T := FindStyleResource('htrack');
        if (T <> nil) and (T is TControl) then
          TControl(T).Visible := False;
        T := FindStyleResource('vtrack');
      end;
    end;
    if T = nil then
      T := FindStyleResource('track');
    if (T <> nil) and (T is TControl) then
      TControl(T).Visible := True;
    if (T <> nil) and (T is TControl) and (Max > Min) then
    begin
      hI := FindStyleResource('hindicator');
      vI := FindStyleResource('vindicator');
      if Orientation = TOrientation.orHorizontal then
      begin
        if (hI <> nil) and (hI is TControl) then
        begin
          TControl(hI).Width := ((Value - Min) / (Max - Min)) *
            (TControl(T).Width - TControl(T).Margins.left - TControl(T).Margins.right - TControl(hI)
            .Padding.left - TControl(hI).Padding.right);
          TControl(hI).Visible := TControl(hI).Width > 2;
        end;
        if (vI <> nil) and (vI is TControl) then
          TControl(vI).Visible := False;
      end
      else
      begin
        if (vI <> nil) and (vI is TControl) then
        begin
          TControl(vI).Height := ((Value - Min) / (Max - Min)) *
            (TControl(T).Height - TControl(T).Margins.top - TControl(T).Margins.bottom -
            TControl(hI).Padding.top - TControl(hI).Padding.bottom);
          TControl(vI).Visible := TControl(vI).Height > 2;
        end;
        if (hI <> nil) and (hI is TControl) then
          TControl(hI).Visible := False;
      end;
    end;
    FDisableAlign := False;
  end;
  inherited;
end;

procedure TProgressBar.SetMax(const Value: Single);
begin
  if FMax <> Value then
  begin
    FMax := Value;
    if FValue > FMax then
      FValue := FMax;
  end;
end;

procedure TProgressBar.SetMin(const Value: Single);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    if FValue < FMin then
      FValue := FMin;
  end;
end;

procedure TProgressBar.SetOrientation(const Value: TOrientation);
var
  T: Single;
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    // swap
    if {(csDesigning in ComponentState) and} not(csLoading in ComponentState) then
    begin
      T := Width;
      Width := Height;
      Height := T;
    end;
    Realign;
  end;
end;

procedure TProgressBar.SetValue(const Value: Single);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    if FValue > FMax then
      FValue := FMax;
    if FValue < FMin then
      FValue := FMin;
    Realign;
  end;
end;

{ TThumb }

constructor TThumb.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
  AutoCapture := True;
end;

destructor TThumb.Destroy;
begin
  inherited;
end;

procedure TThumb.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and Enabled then
  begin
    FPressed := True;
    FDownOffset := PointF(X, Y);
    if FTrack <> nil then
      FTrack.SetFocus;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

function ValueToPos(MinValue, MaxValue, ViewportSize, ThumbSize, TrackSize, Value: Single; IgnoreViewportSize: boolean): Single;
var ValRel: Double;
begin
  Result := ThumbSize / 2;
  if (ViewportSize < 0) or IgnoreViewportSize then
    ViewportSize := 0;
  ValRel := MaxValue - MinValue - ViewportSize;
  if ValRel > 0 then
  begin
    ValRel := (Value - MinValue) / ValRel;
    Result := (TrackSize - ThumbSize) * ValRel + Result;
  end;
end;

function PosToValue(MinValue, MaxValue, ViewportSize, ThumbSize, TrackSize, Pos: Single; IgnoreViewportSize: boolean): Single;
var ValRel: Double;
begin
  Result := MinValue;
  if (ViewportSize < 0) or IgnoreViewportSize then
    ViewportSize := 0;
  ValRel := TrackSize - ThumbSize;
  if ValRel > 0 then
  begin
    ValRel := (Pos - ThumbSize / 2) / ValRel;
    if ValRel < 0 then
      ValRel := 0;
    if ValRel > 1 then
      ValRel := 1;
    Result := MinValue + ValRel * (MaxValue - MinValue - ViewportSize);
  end;
end;

procedure TThumb.MouseMove(Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  LValue: Single;
begin
  if FTrack  <> nil then
    LValue := FTrack.Value
  else
    LValue := 0;
  inherited;
  if FPressed and (FTrack <> nil) and (Enabled) and (Parent <> nil) and (Parent is TControl) then
  begin
    if FTrack.Orientation = TOrientation.orHorizontal then
    begin
      P := FTrack.AbsoluteToLocal(LocalToAbsolute(PointF(X, 0)));
      P.X := P.X - FDownOffset.X + Width / 2;
      with FTrack do
        Value := PosToValue(FMin, FMax, FViewportSize, self.Width, Width, P.X, FIgnoreViewportSize);
    end
    else
    begin
      P := FTrack.AbsoluteToLocal(LocalToAbsolute(PointF(0, Y)));
      P.Y := P.Y - FDownOffset.Y + Height / 2;
      with FTrack do
        Value := PosToValue(FMin, FMax, FViewportSize, self.Height, Height, P.Y, FIgnoreViewportSize);
    end;
  end;
  if (FTrack <> nil) and (FTrack.Value <> LValue) then
    if FTrack.Observers.IsObserving(TObserverMapping.PositionLinkID) then
      TLinkObservers.PositionLinkPosChanged(FTrack.Observers);
end;

procedure TThumb.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  V: Single;
  LValue: Single;
begin
  if FTrack <> nil then
    LValue := FTrack.Value
  else
    LValue := 0;
  inherited;

  if FPressed then
  begin
    FTrack.EndTracking;
    if not FTrack.Tracking and Assigned(FTrack.FOnChange) then
    begin
      FTrack.FTracking := True;
      V := FTrack.FValue;
      FTrack.FValue := $FFFF;
      FTrack.Value := V;
      FTrack.FTracking := False;
    end;
    FPressed := False;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;

  // the click can start (meaning MouseDown) on the trackbar and end
  // (meaning MouseUp) on the thumb; in this case, synthetize a MouseUp on
  // the trackbar to generate the click
  if Assigned(FTrack) and FTrack.FPressed then
    FTrack.MouseUp(Button, Shift, X, Y);

  if (FTrack <> nil) and (LValue <> FTrack.Value) then
    if Observers.IsObserving(TObserverMapping.PositionLinkID) then
      TLinkObservers.PositionLinkPosChanged(Observers);
end;

{ TCustomTrack }

function TCustomTrack.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

constructor TCustomTrack.Create(AOwner: TComponent);
begin
  inherited;
  FViewportSize := 0;
  FMax := 100;
  FValue:= FMin;
  FTracking := True;
  Width := 100;
  Height := 15;
end;

destructor TCustomTrack.Destroy;
begin
  inherited;
end;

function TCustomTrack.GetData: Variant;
begin
  Result := Value;
end;

procedure TCustomTrack.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsNumeric(Value) then
    Self.Value := Value
  else
    Self.Value := Min
end;

function TCustomTrack.GetThumbSize(var IgnoreViewportSize: boolean): integer;
var lSize: Double;
begin
  Result := 0;
  lSize := 5;
  case Orientation of
    TOrientation.orHorizontal:
    begin
      if FViewportSize > 0 then
        lSize := FViewportSize / (FMax - FMin) * Width
      else
        lSize := Height;
      Result := Round(System.Math.Min(System.Math.MaxValue([lSize, Height / 2, 5]), Width));
    end;
    TOrientation.orVertical:
    begin
      if FViewportSize > 0 then
        lSize := FViewportSize / (FMax - FMin) * Height
      else
        lSize := Width;
      Result := Round(System.Math.Min(System.Math.MaxValue([lSize, Width / 2, 5]), Height));
    end;
  end;
  if Result < 5 then
    Result := 0;
  IgnoreViewportSize := Result <= (lSize - 1);
end;

function TCustomTrack.GetThumbRect: TRectF;
var Pos, Size: Single;
begin
  Result := LocalRect;
  Size := GetThumbSize(FIgnoreViewportSize);
  case Orientation of
    TOrientation.orHorizontal:
    begin
      Pos := ValueToPos(FMin, FMax, FViewportSize, Size, Width, FValue, FIgnoreViewportSize);
      Size := Size / 2;
      Result := RectF(Pos - Size, 0, Pos + Size, Height);
    end;
    TOrientation.orVertical:
    begin
      Pos := ValueToPos(FMin, FMax, FViewportSize, Size, Height, FValue, FIgnoreViewportSize);
      Size := Size / 2;
      Result := RectF(0, Pos - Size, Width, Pos + Size);
    end;
  end;
  if (FThumb <> nil) and (FThumb.Parent <> nil) and (FThumb.Parent is TControl) then
  begin
    if RectWidth(Result) > TControl(FThumb.Parent).Margins.left + FThumb.Padding.left + TControl(FThumb.Parent)
      .Margins.right - FThumb.Padding.right then
    begin
      Result.left := Result.left + TControl(FThumb.Parent).Margins.left + FThumb.Padding.left;
      Result.right := Result.right - TControl(FThumb.Parent).Margins.right - FThumb.Padding.right;
    end;
    Result.top := Result.top + TControl(FThumb.Parent).Margins.top + FThumb.Padding.top;
    Result.bottom := Result.bottom - TControl(FThumb.Parent).Margins.bottom - FThumb.Padding.bottom;
  end;
end;

procedure TCustomTrack.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  T := FindStyleResource('vthumb');
  if (T <> nil) and (T is TThumb) then
  begin
    if Orientation = TOrientation.orHorizontal then
      TControl(T).Visible := False
    else
    begin
      TControl(T).Visible := True;
      FThumb := TThumb(T);
    end;
  end;
  T := FindStyleResource('hthumb');
  if (T <> nil) and (T is TThumb) then
  begin
    if Orientation = TOrientation.orVertical then
      TControl(T).Visible := False
    else
    begin
      TControl(T).Visible := True;
      FThumb := TThumb(T);
    end;
  end;
  T := FindStyleResource('thumb');
  if (T <> nil) and (T is TThumb) then
  begin
    FThumb := TThumb(T);
    FThumb.FTrack := Self;
  end;
  if FThumb <> nil then
    FThumb.FTrack := Self;

  T := FindStyleResource('vtrack');
  if (T <> nil) and (T is TControl) then
  begin
    if Orientation = TOrientation.orHorizontal then
      TControl(T).Visible := False
    else
    begin
      TControl(T).Visible := True;
      FTrack := TControl(T);
    end;
  end;
  T := FindStyleResource('htrack');
  if (T <> nil) and (T is TControl) then
  begin
    if Orientation = TOrientation.orVertical then
      TControl(T).Visible := False
    else
    begin
      TControl(T).Visible := True;
      FTrack := TControl(T);
    end;
  end;
  T := FindStyleResource('track');
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).Visible := True;
    FTrack := TControl(T);
  end;

  // forward the thumb clicks and dblClicks to the trackbar events
  if Assigned(FThumb) then
  begin
    FThumb.OnClick := DoThumbClick;
    FThumb.OnDblClick := DoThumbDblClick;
  end;

  Realign;
end;

procedure TCustomTrack.FreeStyle;
begin
  inherited;
  FThumb := nil;
  FTrack := nil;
end;

procedure TCustomTrack.Realign;
var R: TRectF;
begin
  inherited;
  if FThumb <> nil then
  begin
    R := GetThumbRect;
    with R do
      FThumb.Visible := not ((Right <= Left) or (Bottom <= Top));
    FThumb.BoundsRect := R;
  end;
end;

procedure TCustomTrack.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  LValue: single;
  Size: integer;
begin
  LValue := Value;
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    Size := GetThumbSize(FIgnoreViewportSize);
    case Orientation of
      TOrientation.orHorizontal:
        LValue := PosToValue(FMin, FMax, FViewportSize, Size, Width, X, FIgnoreViewportSize);
      TOrientation.orVertical:
        LValue := PosToValue(FMin, FMax, FViewportSize, Size, Height, Y, FIgnoreViewportSize);
    end;
    if not SameValue(Value, LValue) then
    begin
      Value := LValue;
      if Observers.IsObserving(TObserverMapping.PositionLinkID) then
        TLinkObservers.PositionLinkPosChanged(Observers);
    end;
  end;
end;

procedure TCustomTrack.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
end;

procedure TCustomTrack.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
end;

procedure TCustomTrack.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  inc: Single;
  LValue: Single;
begin
  LValue := Value;
  inc := Frequency;
  if inc = 0 then
    inc := 1;
  inherited;
  case Key of
    vkHome:
      Value := Min;
    vkEnd:
      Value := Max;
    vkUp:
      Value := Value - inc;
    vkDown:
      Value := Value + inc;
    vkLeft:
      Value := Value - inc;
    vkRight:
      Value := Value + inc;
  else
    Exit;
  end;
  if not Tracking and Assigned(FOnChange) then
    FOnChange(Self);
  Key := 0;

  if LValue <> Value then
    if Observers.IsObserving(TObserverMapping.PositionLinkID) then
      TLinkObservers.PositionLinkPosChanged(Observers);
end;

procedure TCustomTrack.SetMax(const Value: Single);
begin
  if FMax <> Value then
  begin
    FMax := Value;
    if FMax < FMin then
      FMax := FMin + 0.001;
    if FViewportSize > (FMax - FMin) then
      FViewportSize := FMax - FMin;
    if FValue > FMax - FViewportSize then
      FValue := FMax - FViewportSize;
    Realign;
  end;
end;

procedure TCustomTrack.SetMin(const Value: Single);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    if FValue < FMin then
      FValue:= FMin;
    Realign;
  end;
end;

procedure TCustomTrack.SetOrientation(const Value: TOrientation);
var
  T: Single;
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    // swap
    if {(csDesigning in ComponentState) and} not(csLoading in ComponentState) then
    begin
      T := Width;
      Width := Height;
      Height := T;
    end;
    UpdateStyle;
  end;
end;

function TCustomTrack.GetIsTracking: Boolean;
begin
  Result := (FThumb <> nil) and FThumb.FPressed;
end;

procedure TCustomTrack.SetFrequency(const Value: Single);
begin
  if FFrequency <> Value then
  begin
    FFrequency := Value;
//  The value of the CustomTrack should not be changed imediately that frequency value is changed
// see RAID 283664
//    if FFrequency <> 0 then
//      Self.Value := Round(Self.Value / Frequency) * Frequency;
  end;
end;

procedure TCustomTrack.SetValue(Value: Single);
var lValue: Single;
begin
  lValue := Value;
  if FFrequency <> 0 then
    lValue:= Round(lValue / Frequency) * Frequency;
  lValue := System.Math.Max(FMin,
                            System.Math.MinValue([FMax - FViewportSize,
                                                  FMax,
                                                  lValue]));
  if (FValue <> lValue) then
  begin
    FValue:= lValue;
    if GetIsTracking and Assigned(FOnTracking) then
      FOnTracking(Self);
    if Tracking and Assigned(FBindingObjects) then
      ToBindingObjects;
    if GetIsTracking and Tracking and Assigned(FOnChange) then
      FOnChange(Self)
    else if not GetIsTracking and Assigned(FOnChange) then
      FOnChange(Self);
    Realign;
  end;
end;

procedure TCustomTrack.SetViewportSize(const Value: Single);
begin
  if FViewportSize <> Value then
  begin
    FViewportSize := Value;
    if FViewportSize > (FMax - FMin) then
      FViewportSize := FMax - FMin;
    if FValue > FMax - FViewportSize then
      Self.Value := FMax - FViewportSize;
    Realign;
  end;
end;

procedure TCustomTrack.DoThumbClick(Sender: TObject);
begin
  if Assigned(OnClick) then
    OnClick(Self);
end;

procedure TCustomTrack.DoThumbDblClick(Sender: TObject);
begin
  if Assigned(OnDblClick) then
    OnDblClick(Self);
end;

procedure TCustomTrack.EndTracking;
begin
end;

{ TTrackBar }

constructor TTrackBar.Create(AOwner: TComponent);
begin
  inherited;
  FViewportSize := 0;
  CanFocus := True;
  SetAcceptsControls(False);
end;

{ TBitmapTrackBar }

constructor TBitmapTrackBar.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TBitmapTrackBar.Destroy;
begin
  if FBitmap <> nil then
    FreeAndNil(FBitmap);
  inherited;
end;

procedure TBitmapTrackBar.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  T := FindStyleResource('htrack');
  if (T <> nil) and (T is TShape) and (Orientation = TOrientation.orHorizontal) then
  begin
    FBackground := TShape(T);
    UpdateBitmap;
  end;
  T := FindStyleResource('vtrack');
  if (T <> nil) and (T is TShape) and (Orientation = TOrientation.orVertical) then
  begin
    FBackground := TShape(T);
    UpdateBitmap;
  end;
end;

procedure TBitmapTrackBar.FreeStyle;
begin
  FBackground := nil;
  inherited;
end;

function TBitmapTrackBar.GetDefaultStyleLookupName: string;
begin
  Result := 'trackbarstyle';
end;

procedure TBitmapTrackBar.Realign;
begin
  inherited;
  UpdateBitmap;
end;

procedure TBitmapTrackBar.SetOrientation(const Value: TOrientation);
begin
  if Value <> FOrientation then
  begin
    inherited;
    if FBitmap <> nil then
      FreeAndNil(FBitmap);
    UpdateBitmap;
  end;
end;

procedure TBitmapTrackBar.UpdateBitmap;
begin
  if FBackground = nil then
    Exit;

  if FBitmap <> nil then
    if (FBitmap.Width <> trunc(FBackground.Width)) or (FBitmap.Height <> trunc(FBackground.Height)) then
    begin
      FreeAndNil(FBitmap);
    end;

  if FBitmap = nil then
  begin
    FBitmap := TBitmap.Create(trunc(FBackground.Width), trunc(FBackground.Height));
    FillBitmap;
  end;
  FBackground.Fill.Kind := TBrushKind.bkBitmap;
  FBackground.Fill.Bitmap.Bitmap := FBitmap;

  Repaint;
end;

procedure TBitmapTrackBar.FillBitmap;
begin
end;

{ TSwitch }

constructor TSwitch.Create(AOwner: TComponent);
begin
  inherited;
  FOnBrush := TBrush.Create(TBrushKind.bkNone, claWhite);
  FOffBrush := TBrush.Create(TBrushKind.bkNone, claWhite);
  Width := 64;
  Height := 24;
  SetAcceptsControls(False);
end;

destructor TSwitch.Destroy;
begin
  FreeAndNil(FOnBrush);
  FreeAndNil(FOffBrush);
  if FBitmap <> nil then
    FreeAndNil(FBitmap);
  inherited;
end;

procedure TSwitch.EndTracking;
begin
  if FValue > FMax / 2 then
  begin
    inherited Value := FMax;
    SetIsChecked(True);
  end;
  if FValue < FMax / 2 then
  begin
    inherited Value := FMin;
    SetIsChecked(False);
  end;
end;

procedure TSwitch.ApplyStyle;
var
  T: TFmxObject;
  NeedUpdate: Boolean;
begin
  inherited;
  NeedUpdate := False;
  T := FindStyleResource('htrack');
  if (T <> nil) and (T is TShape) and (Orientation = TOrientation.orHorizontal) then
  begin
    FBackground := TShape(T);
    NeedUpdate := True;
  end;
  T := FindStyleResource('vtrack');
  if (T <> nil) and (T is TShape) and (Orientation = TOrientation.orVertical) then
  begin
    FBackground := TShape(T);
    NeedUpdate := True;
  end;
  if FBackground = nil then
  begin
    T := FindStyleResource('track');
    if (T <> nil) and (T is TShape) then
    begin
      FBackground := TShape(T);
      NeedUpdate := True;
    end;
  end;
  T := FindStyleResource('on');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FOnBrush.Assign(TBrushObject(T).Brush);
    NeedUpdate := True;
  end;
  T := FindStyleResource('off');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FOffBrush.Assign(TBrushObject(T).Brush);
    NeedUpdate := True;
  end;
  if NeedUpdate then
    UpdateBitmap;
end;

procedure TSwitch.FreeStyle;
begin
  FBackground := nil;
  inherited;
end;

procedure TSwitch.Realign;
begin
  inherited;
  UpdateBitmap;
end;

procedure TSwitch.SetOrientation(const Value: TOrientation);
begin
  if Value <> FOrientation then
  begin
    inherited;
    if FBitmap <> nil then
      FreeAndNil(FBitmap);
    UpdateBitmap;
  end;
end;

procedure TSwitch.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    if FIsChecked then
      inherited Value := Max
    else
      inherited Value := Min;
    if Assigned(FOnSwitch) then
      FOnSwitch(Self);
  end;
end;

procedure TSwitch.SetValue(Value: Single);
begin
  if Value <> FValue then
  begin
    FValue:= Value;
    if FFrequency <> 0 then
      FValue:= Round(Value / Frequency) * Frequency;
    if FValue > FMax - FViewportSize then
      FValue:= FMax - FViewportSize;
    if FValue < FMin then
      FValue:= FMin;

    if GetIsTracking and Assigned(FOnTracking) then
      FOnTracking(Self);
    if Tracking and Assigned(FBindingObjects) then
      ToBindingObjects;
    if not GetIsTracking then
    begin
      if FValue > FMax / 2 then
      begin
        FValue := FMax;
        SetIsChecked(True);
      end;
      if FValue < FMax / 2 then
      begin
        FValue := FMin;
        SetIsChecked(False);
      end;
    end;
    Realign;
    UpdateBitmap;
  end;
end;

procedure TSwitch.UpdateBitmap;
begin
  if FBackground = nil then
    Exit;

  if FBitmap = nil then
    FBitmap := TBitmap.Create(trunc(FBackground.Width), trunc(FBackground.Height));
    
  if FBitmap <> nil then
  begin
    if (FBitmap.Width <> trunc(FBackground.Width)) or (FBitmap.Height <> trunc(FBackground.Height)) then
    begin
      FreeAndNil(FBitmap);
      FBitmap := TBitmap.Create(trunc(FBackground.Width), trunc(FBackground.Height));
    end;
    FillBitmap;
  end;
    
  FBackground.Fill.Kind := TBrushKind.bkBitmap;
  FBackground.Fill.Bitmap.Bitmap := FBitmap;

  Repaint;
end;

procedure TSwitch.FillBitmap;
var
  Pos: Single;
  M: TMatrix;
begin
  if (Orientation = TOrientation.orHorizontal) then
  begin
    Pos := (GetThumbRect.Left + GetThumbRect.Right) / 2;
    if FBitmap.Canvas.BeginScene then
    try
      FBitmap.Canvas.Clear(0);
      FBitmap.Canvas.Fill.Assign(FOnBrush);
      FBitmap.Canvas.FillRect(RectF(0, 0, Pos, FBitmap.Height), 0, 0, [], 1);
      FBitmap.Canvas.Fill.Assign(FOffBrush);
      FBitmap.Canvas.FillRect(RectF(Pos, 0, FBitmap.Width, FBitmap.Height), 0, 0, [], 1);
    finally
      FBitmap.Canvas.EndScene;
    end;
  end
  else
  begin
    Pos := (GetThumbRect.Top + GetThumbRect.Bottom) / 2;
    if FBitmap.Canvas.BeginScene then
    try
      FBitmap.Canvas.Clear(0);
      M := CreateRotationMatrix(DegToRad(90));
      M.m31 := FBitmap.Width;
      FBitmap.Canvas.SetMatrix(M);
      FBitmap.Canvas.Fill.Assign(FOnBrush);
      FBitmap.Canvas.FillRect(RectF(0, 0, Pos, FBitmap.Width), 0, 0, [], 1);
      FBitmap.Canvas.Fill.Assign(FOffBrush);
      FBitmap.Canvas.FillRect(RectF(Pos, 0, FBitmap.Height, FBitmap.Width), 0, 0, [], 1);
    finally
      FBitmap.Canvas.EndScene;
    end;
  end;
end;

{ TScrollBar }

constructor TScrollBar.Create(AOwner: TComponent);
begin
  inherited;
  FMax := 100;
  FViewportSize := 0;
  FSmallChange := 1;
  Width := 150;
  Height := 18;
  SetAcceptsControls(False);
end;

destructor TScrollBar.Destroy;
begin
  inherited;
end;

function TScrollBar.GetData: Variant;
begin
  Result := Value;
end;

procedure TScrollBar.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsNumeric(Value) then
    Self.Value := Value
  else
    Self.Value := Min
end;

procedure TScrollBar.ApplyStyle;
var
  T: TFmxObject;
  HT, VT: TCustomTrack;
  LB, TB: TCustomButton;
  RB, BB: TCustomButton;
begin
  inherited;
  HT := nil;
  VT := nil;
  T := FindStyleResource('htrack');
  if T = nil then
    T := FindStyleResource('track');
  if (T <> nil) and (T is TCustomTrack) then
  begin
    HT := TCustomTrack(T);
    HT.FOrientation := TOrientation.orHorizontal;
    HT.FMax := Max;
    HT.FMin := Min;
    HT.FValue := Value;
    HT.ViewportSize := ViewportSize;
    HT.Visible := Orientation = TOrientation.orHorizontal;
    HT.OnChange := DoTrackChanged;
    HT.CanFocus := False;
    if HT.Visible then
      HT.Realign;
  end;
  T := FindStyleResource('vtrack');
  if T = nil then
    T := FindStyleResource('track');
  if (T <> nil) and (T is TCustomTrack) then
  begin
    VT := TCustomTrack(T);
    VT.FOrientation := TOrientation.orVertical;
    VT.FMax := Max;
    VT.FMin := Min;
    VT.FValue := Value;
    VT.ViewportSize := ViewportSize;
    VT.Visible := Orientation = TOrientation.orVertical;
    VT.OnChange := DoTrackChanged;
    VT.CanFocus := False;
    if VT.Visible then
      VT.Realign;
  end;
  if Orientation = TOrientation.orVertical then
    FTrack := VT
  else
    FTrack := HT;

  TB := nil;
  LB := nil;
  T := FindStyleResource('leftbutton');
  if (T <> nil) and (T is TCustomButton) then
  begin
    LB := TCustomButton(T);
    LB.OnClick := DoMinButtonClick;
    LB.Visible := Orientation = TOrientation.orHorizontal;
    LB.CanFocus := False;
  end;

  T := FindStyleResource('topbutton');
  if (T <> nil) and (T is TCustomButton) then
  begin
    TB := TCustomButton(T);
    TB.OnClick := DoMinButtonClick;
    TB.Visible := Orientation = TOrientation.orVertical;
    TB.CanFocus := False;
  end;

  if Orientation = TOrientation.orVertical then
    FMinButton := TB
  else
    FMinButton := LB;

  RB := nil;
  BB := nil;
  T := FindStyleResource('rightbutton');
  if (T <> nil) and (T is TCustomButton) then
  begin
    RB := TCustomButton(T);
    RB.OnClick := DoMaxButtonClick;
    RB.Visible := Orientation = TOrientation.orHorizontal;
    RB.CanFocus := False;
  end;

  T := FindStyleResource('bottombutton');
  if (T <> nil) and (T is TCustomButton) then
  begin
    BB := TCustomButton(T);
    BB.OnClick := DoMaxButtonClick;
    BB.Visible := Orientation = TOrientation.orVertical;
    BB.CanFocus := False;
  end;

  if Orientation = TOrientation.orVertical then
    FMaxButton := BB
  else
    FMaxButton := RB;
end;

procedure TScrollBar.FreeStyle;
begin
  inherited;
  FTrack := nil;
  FMinButton := nil;
  FMaxButton := nil;
end;

function TScrollBar.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

procedure TScrollBar.DoTrackChanged(Sender: TObject);
begin
  Value := TCustomTrack(Sender).Value;
  if Observers.IsObserving(TObserverMapping.PositionLinkID) then
    TLinkObservers.PositionLinkPosChanged(Observers);
end;

procedure TScrollBar.DoMinButtonClick(Sender: TObject);
begin
  Value := Value - SmallChange;
  if Observers.IsObserving(TObserverMapping.PositionLinkID) then
    TLinkObservers.PositionLinkPosChanged(Observers);
end;

procedure TScrollBar.DoMaxButtonClick(Sender: TObject);
begin
  Value := Value + SmallChange;
  if Observers.IsObserving(TObserverMapping.PositionLinkID) then
    TLinkObservers.PositionLinkPosChanged(Observers);
end;

procedure TScrollBar.UpdateScroll;
begin
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  try
    if FTrack <> nil then
    begin
      FTrack.Max := Max;
      FTrack.Min := Min;
      FTrack.Value := Value;
      FTrack.ViewportSize := ViewportSize;
    end;
  finally
    FDisableAlign := False;
  end;
  inherited;
end;

procedure TScrollBar.SetMax(const Value: Single);
begin
  if FMax <> Value then
  begin
    FMax := Value;
    if FMax < FMin then
      FMax := FMin + 0.001;
    if FValue > FMax - FViewportSize then
      Self.Value := FMax - FViewportSize;
    if FViewportSize > (FMax - FMin) then
      FViewportSize := FMax - FMin;
    UpdateScroll;
  end;
end;

procedure TScrollBar.SetMin(const Value: Single);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    if FValue < FMin then
      Self.Value := FMin;
    UpdateScroll;
  end;
end;

procedure TScrollBar.SetOrientation(const Value: TOrientation);
var
  T: Single;
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    // swap
    if (csDesigning in ComponentState) and not(csLoading in ComponentState) then
    begin
      T := Width;
      Width := Height;
      Height := T;
    end;
    UpdateStyle;
  end;
end;

procedure TScrollBar.SetValue(const Value: Single);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    if FValue > FMax - FViewportSize then
      FValue := FMax - FViewportSize;
    if FValue < FMin then
      FValue := FMin;
    if Assigned(FBindingObjects) then
      ToBindingObjects;
    if Assigned(FOnChange) then
      FOnChange(Self);
    UpdateScroll;
  end;
end;

procedure TScrollBar.SetViewportSize(const Value: Single);
begin
  if FViewportSize <> Value then
  begin
    FViewportSize := Value;
    if FViewportSize > (FMax - FMin) then
      FViewportSize := FMax - FMin;
    if FValue > FMax - FViewportSize then
      Self.Value := FMax - FViewportSize;
    UpdateScroll;
  end;
end;

{ TSmallScrollBar }

constructor TSmallScrollBar.Create(AOwner: TComponent);
begin
  inherited;
  Height := 8;
end;

{ TAniIndicator }

constructor TAniIndicator.Create(AOwner: TComponent);
begin
  inherited;
  FStyleLookup := 'labelstyle';
  FFill := TBrush.Create(TBrushKind.bkSolid, $FFBABABA);
  FLayout := TControl.Create(Self);
  FLayout.Parent := Self;
  FLayout.Align := TAlignLayout.alContents;
  FLayout.Locked := True;
  FLayout.Stored := False;
  FAni := TFloatAnimation.Create(Self);
  FAni.Parent := FLayout;
  FAni.Loop := True;
  FAni.StartValue := 0;
  FAni.StopValue := 360;
  FAni.Duration := 10;
  FAni.PropertyName := 'RotationAngle';
  SetAcceptsControls(False);
end;

destructor TAniIndicator.Destroy;
begin
  FFill.Free;
  inherited;
end;

procedure TAniIndicator.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('text');
  if (O <> nil) and (O is TText) then
  begin
    TText(O).Text := '';
    FFill.Assign(TText(O).Fill);
  end;
end;

procedure TAniIndicator.FreeStyle;
begin
  inherited;
end;

procedure TAniIndicator.Paint;
var
  a: Integer;
  P, P2: TPointF;
  wSize, eSize: Single;
  V: Single;
begin
  if Width < Height then
    wSize := Width / 2
  else
    wSize := Height / 2;
  eSize := wSize / 3.7;
  wSize := wSize - eSize;

  case FStyle of
    TAniIndicatorStyle.aiLinear:
      begin
        Canvas.Stroke.Kind := TBrushKind.bkSolid;
        Canvas.StrokeThickness := eSize / 2;
        for a := 0 to 11 do
        begin
          P := PointF(Width / 2 + (cos(DegToRad(a * 30)) * wSize), Height / 2 + (sin(DegToRad(a * 30)) * wSize));
          P2 := PointF(Width / 2 + (cos(DegToRad(a * 30)) * (wSize / 2)), Height / 2 + (sin(DegToRad(a * 30)) * (wSize / 2)));
          Canvas.Stroke.Assign(FFill);
          Canvas.DrawLine(P, P2, Opacity * 0.2);
          if FEnabled then
          begin
            V := ((trunc(FLayout.RotationAngle) + (30 - trunc((a / 12) * 30))) mod 30) / 30;
            if V > 1 then
              V := Abs(V - 2);
            V := 1 - V;
            Canvas.Stroke.Assign(FFill);
            Canvas.DrawLine(P, P2, V * Opacity);
          end;
        end;
      end;
    TAniIndicatorStyle.aiCircular:
      begin
        Canvas.Stroke.Kind := TBrushKind.bkNone;
        for a := 0 to 7 do
        begin
          P := PointF(Width / 2 + (cos(DegToRad(a * 45)) * wSize), Height / 2 + (sin(DegToRad(a * 45)) * wSize));
          Canvas.Fill.Assign(FFill);
          Canvas.FillEllipse(RectF(P.X - eSize, P.Y - eSize, P.X + eSize, P.Y + eSize), Opacity * 0.2);
          if FEnabled then
          begin
            V := ((trunc(FLayout.RotationAngle) + (30 - trunc((a / 7) * 30))) mod 30) / 30;
            if V > 1 then
              V := Abs(V - 2);
            V := 1 - V;
            Canvas.Fill.Assign(FFill);
            Canvas.FillEllipse(RectF(P.X - eSize, P.Y - eSize, P.X + eSize, P.Y + eSize), V * Opacity);
          end;
        end;
      end;
  end;
end;

procedure TAniIndicator.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if FEnabled then
    begin
      FAni.Start;
    end
    else
      FAni.Stop;
  end;
end;

procedure TAniIndicator.SetStyle(const Value: TAniIndicatorStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Repaint;
  end;
end;

{ TArcDial }

constructor TArcDial.Create(AOwner: TComponent);
begin
  inherited;
  Width := 30;
  Height := 30;
  FFrequency := 0;
  FTracking := True;
  AutoCapture := True;
  SetAcceptsControls(False);
end;

destructor TArcDial.Destroy;
begin
  inherited;
end;

function TArcDial.GetData: Variant;
begin
  Result := Value;
end;

procedure TArcDial.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsNumeric(Value) then
    Self.Value := Value
  else
    Self.Value := 0
end;

procedure TArcDial.ApplyStyle;
begin
  inherited;
  Tick;
  Text;
end;

function TArcDial.Tick: TControl;
var
  T: TFmxObject;
begin
  T := FindStyleResource('tick');
  if (T <> nil) and (T is TControl) then
  begin
    Result := TControl(T);
    Result.RotationAngle := -FValue;
  end
  else
    Result := nil;
end;

function TArcDial.Text: TText;
var
  T: TFmxObject;
begin
  T := FindStyleResource('tracktext');
  if (T <> nil) and (T is TText) then
  begin
    TText(T).Visible := False; // FPressing;
    TText(T).Text := IntToStr(Round(Value)) + System.WideChar($B0);
    if FPressing and not FTracking then
      TText(T).Opacity := 1
    else
      TText(T).Opacity := 0;
  end;

  T := FindStyleResource('text');
  if (T <> nil) and (T is TText) then
  begin
    Result := TText(T);
    Result.Visible := FShowValue;
    Result.Text := IntToStr(Round(Value)) + System.WideChar($B0);
    if not FShowValue then
      Result.Opacity := 0
    else
      Result.Opacity := 1;
  end
  else
    Result := nil;
end;

procedure TArcDial.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    FOldPos := PointF(X, Y);
    FSaveValue := Value;
    Text;
  end;
end;

procedure TArcDial.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (ssLeft in Shift) and (FPressing) then
  begin
    Value := VectorAngle(Vector(1, 0), Vector(X - (Width / 2), Y - (Height / 2)));
    FOldPos := PointF(X, Y);
    Text;
  end;
end;

procedure TArcDial.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressing then
  begin
    FPressing := False;
    Text;
    if Value <> FSaveValue then
      if Assigned(FOnChange) then
        FOnChange(Self);
  end;
end;

procedure TArcDial.Paint;
begin
  inherited;
end;

procedure TArcDial.SetValue(const Value: Single);
begin
  if (FFrequency = 0) then
  begin
    if (FValue <> Value) then
    begin
      FValue := Value;
      if Tick <> nil then
        Tick.RotationAngle := -FValue
      else
        Repaint;
      Text;
      if Assigned(FOnChange) and (not FPressing or FTracking) then
        FOnChange(Self);
    end;
  end
  else
  begin
    if FValue <> Round(Value / FFrequency) * FFrequency then
    begin
      FValue := Round(Value / FFrequency) * FFrequency;
      if Tick <> nil then
        Tick.RotationAngle := -FValue
      else
        Repaint;
      Text;
      if Assigned(FOnChange) and (not FPressing or FTracking) then
        FOnChange(Self);
    end;
  end;
end;

procedure TArcDial.SetShowValue(const Value: Boolean);
begin
  if FShowValue <> Value then
  begin
    FShowValue := Value;
    Text;
    Repaint;
  end;
end;

procedure TTrackBar.Loaded;
begin
  inherited;
end;

procedure TTrackBar.SetMax(const Value: Single);
begin
  if FMax <> Value then
  begin
    inherited;
  end;
end;

procedure TTrackBar.SetMin(const Value: Single);
begin
  inherited;
  if FMin <> Value then
  begin
    inherited;
  end;
end;

{ TExpanderButton }

constructor TExpanderButton.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
end;

destructor TExpanderButton.Destroy;
begin
  inherited;
end;

{ TExpander }

constructor TExpander.Create(AOwner: TComponent);
begin
  inherited;
  Width := 130;
  Height := 130;

  FAutoTranslate := True;

  FIsExpanded := True;
  FIsChecked := True;

  FContent := TContent.Create(Self);
  FContent.Parent := Self;
  FContent.ClipChildren := False;
  FContent.HitTest := False;
  FContent.Locked := True;
  FContent.Stored := False;
  FContent.Padding.top := 25;
  FContent.Width := Width;
  FContent.Height := Height;
end;

procedure TExpander.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject <> FContent) and (AObject <> FResourceLink) then
  begin
    FContent.AddObject(AObject);
  end
  else
    inherited;
end;

procedure TExpander.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('checkbox');
  if (O <> nil) and (O is TCheckBox) then
  begin
    FCheck := TCheckBox(O);
    FCheck.Visible := FShowCheck;
    FCheck.IsChecked := FIsChecked;
    FCheck.OnChange := DoCheckChange;
  end;
  O := FindStyleResource('button');
  if (O <> nil) and (O is TCustomButton) then
  begin
    FButton := TCustomButton(O);
    FButton.OnClick := DoButtonClick;
    FButton.ApplyStyleLookup;
    if not IsExpanded then
      FButton.StartTriggerAnimation(Self, 'IsExpanded');
    FButton.CanFocus := False;
  end;
  StartTriggerAnimation(Self, 'IsExpanded');
end;

procedure TExpander.FreeStyle;
begin
  inherited;
  FCheck := nil;
  FButton := nil;
end;

destructor TExpander.Destroy;
begin
  inherited;
end;

procedure TExpander.DoButtonClick(Sender: TObject);
begin
  IsExpanded := not FIsExpanded;
end;

procedure TExpander.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('ContentSize', ReadContentSize, WriteContentSize, True);
end;

procedure TExpander.ReadContentSize(Reader: TReader);
begin
  if FContent <> nil then
    FContent.Height := StrToInt(Reader.ReadString);
end;

procedure TExpander.WriteContentSize(Writer: TWriter);
begin
  if FContent <> nil then
    Writer.WriteString(IntToStr(Round(FContent.Height)));
end;

procedure TExpander.Realign;
begin
  inherited;
  if csLoading in ComponentState then
    Exit;
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  { content }
  if (FContent <> nil) and (IsExpanded) then
  begin
    FContent.Position.X := 0;
    FContent.Position.Y := FContent.Padding.top;
    FContent.Width := Width;
    FContent.Height := Height - FContent.Padding.top;
  end;
  FDisableAlign := False;
end;

procedure TExpander.SetIsExpanded(const Value: Boolean);
begin
  if FIsExpanded <> Value then
  begin
    if (FResourceLink = nil) and not (csLoading in ComponentState) then
      ApplyStyleLookup;
    FIsExpanded := Value;
    if FIsExpanded then
    begin
      FContent.Visible := FIsExpanded;
      if FButton <> nil then
        Height := FButton.Height + FContent.Height;
      Repaint;
    end
    else
    begin
      Repaint;
      FContent.Visible := FIsExpanded;
      if FButton <> nil then
        Height := FButton.Height;
    end;
    StartTriggerAnimation(Self, 'IsExpanded');
    if FButton <> nil then
      FButton.StartTriggerAnimation(Self, 'IsExpanded');
  end;
end;

procedure TExpander.DoCheckChange(Sender: TObject);
begin
  if (FCheck <> nil) then
  begin
    FIsChecked := FCheck.IsChecked;
    FContent.Enabled := FIsChecked;
    if Assigned(OnCheckChange) then
      OnCheckChange(Self);
  end;
end;

procedure TExpander.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    FContent.Enabled := FIsChecked;
    if FCheck <> nil then
      FCheck.IsChecked := FIsChecked;
  end;
end;

procedure TExpander.SetShowCheck(const Value: Boolean);
begin
  if FShowCheck <> Value then
  begin
    FShowCheck := Value;
    if FCheck <> nil then
      FCheck.Visible := FShowCheck;
  end;
end;

{ TImageControl }

constructor TImageControl.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  FEnableOpenDialog := True;
  FBitmap := TBitmap.Create(0, 0);
  FBitmap.OnChange := DoBitmapChanged;
  SetAcceptsControls(False);
end;

destructor TImageControl.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TImageControl.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('image');
  if (O <> nil) and (O is TImage) then
  begin
    FImage := TImage(O);
    FImage.Bitmap.Assign(FBitmap);
  end;
end;

procedure TImageControl.FreeStyle;
begin
  inherited;
  FImage := nil;
end;

function TImageControl.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
end;

procedure TImageControl.Click;
{ var
  D: TOpenDialog; }
begin
  inherited;
  if not FEnableOpenDialog then
    Exit;
  { D := TOpenDialog.Create(nil);
    D.Filter := DefaultFilterClass.GetFileTypes;
    if D.Execute then
    begin
    Bitmap.LoadFromFile(D.FileName);
    end;
    D.Free; }
end;

procedure TImageControl.DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
begin
  inherited;
  // accept correct image file or TImage
  Accept := ((Length(Data.Files) > 0) and FileExists(Data.Files[0]) and
    (Pos(ExtractFileExt(LowerCase(Data.Files[0])), LowerCase(DefaultBitmapCodecClass.GetFileTypes)) > 0)) or (Data.Source is TImage);
end;

procedure TImageControl.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  inherited;
  if Data.Source is TImage then
  begin
    Bitmap.Assign(TImage(Data.Source).Bitmap);
  end
  else if Length(Data.Files) > 0 then
  begin
    Bitmap.LoadFromFile(Data.Files[0]);
  end;
end;

procedure TImageControl.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TImageControl.DoBitmapChanged(Sender: TObject);
var
  R: TRectF;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if TLinkObservers.EditLinkEdit(Observers) then
      TLinkObservers.EditLinkModified(Observers);
  end;

  if FImage <> nil then
  begin
    { create thumbnail }
    R := RectF(0, 0, FBitmap.Width, FBitmap.Height);
    FitRect(R, RectF(0, 0, FImage.Width, FImage.Height));
    FImage.Bitmap.SetSize(Round(RectWidth(R)), Round(RectHeight(R)));
    if FImage.Bitmap.Canvas.BeginScene then
    try
      FImage.Bitmap.Canvas.Clear(0);
      FImage.Bitmap.Canvas.DrawBitmap(FBitmap, RectF(0, 0, FBitmap.Width, FBitmap.Height),
        RectF(0, 0, FImage.Bitmap.Width, FImage.Bitmap.Height), 1);
    finally
      FImage.Bitmap.Canvas.EndScene;
    end;
    FImage.Repaint;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;

  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkIsEditing(Observers) then
      TLinkObservers.EditLinkUpdate(Observers);
end;

function TImageControl.GetData: Variant;
begin
  Result := ObjectToVariant(Bitmap);
end;

procedure TImageControl.SetData(const Value: Variant);
begin
  if VarIsNull(Value) then
    Bitmap.SetSize(1, 1)
  else if VarIsObject(Value) then
  begin
    if VariantToObject(Value) is TPersistent then
      Bitmap.Assign(TPersistent(VariantToObject(Value)));
  end
  else if VarIsStr(Value) then
    Bitmap.LoadFromFile(Value)
end;

{ TPathLabel }

constructor TPathLabel.Create(AOwner: TComponent);
begin
  inherited;
  FPath := TPath.Create(nil);
  FPath.Parent := Self;
  FPath.Stored := False;
  FPath.Locked := True;
  FPath.HitTest := False;
  FPath.Align := TAlignLayout.alContents;
  SetAcceptsControls(False);
end;

destructor TPathLabel.Destroy;
begin
  FreeAndNil(FPath);
  inherited;
end;

procedure TPathLabel.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('text');
  if (O <> nil) and (O is TText) then
  begin
    TText(O).Text := '';
    if (FPath <> nil) then
    begin
      FPath.Fill.Assign(TText(O).Fill);
      FPath.Stroke.Assign(TText(O).Fill);
    end;
  end;
end;

procedure TPathLabel.FreeStyle;
begin
  inherited;
end;

function TPathLabel.GetData: TPathData;
begin
  Result := FPath.Data;
end;

function TPathLabel.GetWrapMode: TPathWrapMode;
begin
  Result := FPath.WrapMode;
end;

procedure TPathLabel.SetData(const Value: TPathData);
begin
  FPath.Data.Assign(Value);
end;

procedure TPathLabel.SetWrapMode(const Value: TPathWrapMode);
begin
  FPath.WrapMode := Value;
end;

initialization
  RegisterFmxClasses([TThumb, TExpanderButton, TSizeGrip,TCheckBox, TRadioButton,
    TGroupBox, TPanel, TCalloutPanel, TLabel, TImageControl, TPathLabel, TProgressBar,
    TTrack, TScrollBar, TSmallScrollBar, TAniIndicator, TExpander, TTrackBar, TSplitter,
    TStatusBar, TToolBar, TButton, TSpeedButton, TArcDial, TSwitch]);
end.

