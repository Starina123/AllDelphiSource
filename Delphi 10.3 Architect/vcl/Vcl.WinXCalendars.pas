{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.WinXCalendars;

interface

uses
  WinApi.Windows, WinApi.Messages,
  Vcl.Controls, Vcl.Graphics, System.Classes, System.Generics.Collections,
  Vcl.Themes, Vcl.Forms, Vcl.ExtCtrls;

const
  clCalendarHighlighColor = $919191;
  clCalendarBorderColor = $E6E6E6;
  clCalendarTodayColor = $D77800;

type
  {$SCOPEDENUMS ON}
  TSelectionMode = (smNone, smSingle, smMultiple);
  TDisplayMode = (dmMonth, dmYear, dmDecade);
  TDateNavigatorButtonOrientation = (nboNone, nboNext, nboPrev);
  TDaysOfWeek = (dwSunday, dwMonday, dwTuesday, dwWednesday, dwThursday, dwFriday, dwSaturday);
  TViewInfoProperties = set of (vpToday, vpHighlighted, vpSelected, vpCurrent, vpFocused, vpHighlightToday,
    vpFirstOfGroup);

  TItemsInRow = 2..8;

  TCustomCalendarView = class;
  TCalendarHeaderInfo = class;
  TDrawParams = class;
  TDrawViewInfoParams = class;
  TCellItemViewInfo = class;
  TCalendarViewDrawer = class;
  TCustomCalendarPicker = class;

  TChangeViewEvent = procedure(Sender: TObject; OldMode: TDisplayMode; NewMode: TDisplayMode) of object;
  TDrawEvent = procedure(Sender: TObject; DrawParams: TDrawParams; var Text: string) of object;
  TDrawNavigationEvent = procedure(Sender: TObject; DrawParams: TDrawParams;
    Orientation: TDateNavigatorButtonOrientation) of object;
  TDrawDayOfWeekEvent = procedure(Sender: TObject; DrawParams: TDrawParams;
      DayNumber: Integer; var Text: string) of object;
  TDrawViewInfoEvent = procedure(Sender: TObject; DrawParams: TDrawViewInfoParams;
    CalendarViewViewInfo: TCellItemViewInfo) of object;

  ICalendarViewController = interface
    ['{8392BA23-E395-44F9-974E-6194078CDC44}']
    procedure AnimateNavigation(AImage: TBitmap; AForward: Boolean);
    procedure AnimateViewChange(APrevImage: TBitmap; ANewImage: TBitmap; const ASourceRect: TRect;
      const ADestRect: TRect; AZoomOut: Boolean);
    function CanSetDisplayDate(ADate: TDate): Boolean;
    procedure ClickOnDate(ADate: TDate);
    function GetBorderColor: TColor;
    function GetBorderSize: Integer;
    function GetColor: TColor;
    function GetCurrentPPI: Integer;
    function GetDisplayMode: TDisplayMode;
    function GetDrawer: TCalendarViewDrawer;
    function GetEnabled: Boolean;
    function GetFirstDayOfWeek: TDaysOfWeek;
    function GetFont: TFont;
    function GetHighlightToday: Boolean;
    function GetNumberOfWeeksInView: TItemsInRow;
    function GetOnDrawDayItem: TDrawViewInfoEvent;
    function GetOnDrawMonthItem: TDrawViewInfoEvent;
    function GetOnDrawYearItem: TDrawViewInfoEvent;
    function GetOwner: TObject;
    function GetShowDayOfWeek: Boolean;
    function IsDateSelected(const ADate: TDate): Boolean;
    function LimitDate(const ADate: TDate): TDate;
    procedure Navigate(AForward: Boolean);
    procedure SetDisplayDate(const Value: TDate);
    procedure SetDisplayMode(const Value: TDisplayMode);
    procedure SetFocusedDate(const ADate: TDate);
    procedure ClearFocusedItems;
    function GetLastFocusedItem: Integer;
    procedure SetLastFocusedItem(const Value: Integer);
    property BorderColor: TColor read GetBorderColor;
    property BorderSize: Integer read GetBorderSize;
    property Color: TColor read GetColor;
    property CurrentPPI: Integer read GetCurrentPPI;
    property DisplayMode: TDisplayMode read GetDisplayMode write SetDisplayMode;
    property Drawer: TCalendarViewDrawer read GetDrawer;
    property Enabled: Boolean read GetEnabled;
    property FirstDayOfWeek: TDaysOfWeek read GetFirstDayOfWeek;
    property Font: TFont read GetFont;
    property HighlightToday: Boolean read GetHighlightToday;
    property LastFocusedItem: Integer read GetLastFocusedItem write
        SetLastFocusedItem;
    property NumberOfWeeksInView: TItemsInRow read GetNumberOfWeeksInView;
    property Owner: TObject read GetOwner;
    property ShowDayOfWeek: Boolean read GetShowDayOfWeek;
    property OnDrawDayItem: TDrawViewInfoEvent read GetOnDrawDayItem;
    property OnDrawMonthItem: TDrawViewInfoEvent read GetOnDrawMonthItem;
    property OnDrawYearItem: TDrawViewInfoEvent read GetOnDrawYearItem;
  end;

  /// <summary>
  /// TBaseCalendarAnimation is the base class for the animation in Calendar.
  /// </summary>
  TBaseCalendarAnimation = class
  private
    FDuration: Cardinal;
    FInterval: Cardinal;
    FIsStarted: Boolean;
    FOnFinished: TNotifyEvent;
    FOnStarted: TNotifyEvent;
    FTimer: TTimer;
    FWhenStarted: Cardinal;
    procedure SetDuration(const Value: Cardinal);
    procedure SetInterval(const Value: Cardinal);
    procedure TimerTick(Sender: TObject);
  protected
    /// <summary>Descendants of TBaseCalendarAnimation implement the Animate method to run the animation.</summary>
    procedure Animate(ACurrent: Cardinal); virtual; abstract;
    /// <summary>Descendants of TBaseCalendarAnimation implement the DoPrepare method to prepare any internal parameters for the animation.</summary>
    procedure DoPrepare; virtual; abstract;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    /// <summary>Occurs when the calendar animation finishes. The Finish method calls the OnFinished event.</summary>
    procedure Finish;
    /// <summary>Prepares the duration, interval parameters and calls the StartDefault method.</summary>
    procedure Start(ADuration: Cardinal; AInterval: Cardinal);
    /// <summary>Prepares the parameters and starts the animation.</summary>
    procedure StartDefault;
    /// <summary>Specifies how many milliseconds an animation takes to complete.</summary>
    property Duration: Cardinal read FDuration write SetDuration;
    /// <summary>Specifies the interval in which the animation steps appear.</summary>
    property Interval: Cardinal read FInterval write SetInterval;
    /// <summary>Indicates whether the animation is in process.</summary>
    property IsStarted: Boolean read FIsStarted write FIsStarted;
    /// <summary>Points the processor's tick when the animation has started.</summary>
    property WhenStarted: Cardinal read FWhenStarted;
    /// <summary>Occurs when the animation is finished.</summary>
    property OnFinished: TNotifyEvent read FOnFinished write FOnFinished;
    /// <summary>Occurs when the animation is started.</summary>
    property OnStarted: TNotifyEvent read FOnStarted write FOnStarted;
  end;

  TSlideDirection = (sdUp, sdDown);

  /// <summary>
  /// TSlideCalendarAnimation is the class for a slide animation in Calendar.
  /// </summary>
  TSlideCalendarAnimation = class(TBaseCalendarAnimation)
  private
    FAnimateBitmap: TBitmap;
    FCoeff: Double;
    FDestination: TCanvas;
    FDestinationRect: TRect;
    FDirection: TSlideDirection;
    FWholeMovement: Integer;
    procedure SetAnimateBitmap(const Value: TBitmap);
  protected
    procedure Animate(ACurrent: Cardinal); override;
    procedure DoPrepare; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    /// <summary>Specifies where the bitmap of the next or previous month is drawn.</summary>
    property AnimateBitmap: TBitmap read FAnimateBitmap write SetAnimateBitmap;
    /// <summary>Is a link to the canvas of TCalendarView.</summary>
    property Destination: TCanvas read FDestination write FDestination;
    /// <summary>Specifies the rectangle where AnimateBitmap is drawn during the animation process.  </summary>
    property DestinationRect: TRect read FDestinationRect write FDestinationRect;
    /// <summary>Specifies the direction of the slide animation. </summary>
    property Direction: TSlideDirection read FDirection write FDirection;
  end;

  TZoomMode = (zmOut, zmIn);

  /// <summary>
  /// TZoomCalendarAnimation is the base class for a zoom animation in Calendar.
  /// </summary>
  TZoomCalendarAnimation = class(TBaseCalendarAnimation)
  private
    FBackColor: TColor;
    FDestination: TCanvas;
    FDestinationRect: TRect;
    FNewImage: TBitmap;
    FPrevImage: TBitmap;
    FSourceRect: TRect;
    FZoomMode: TZoomMode;
    procedure SetNewImage(const Value: TBitmap);
    procedure SetPrevImage(const Value: TBitmap);
  protected
    procedure Animate(ACurrent: Cardinal); override;
    procedure DoPrepare; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    property BackColor: TColor read FBackColor write FBackColor;
    property Destination: TCanvas read FDestination write FDestination;
    property DestinationRect: TRect read FDestinationRect write FDestinationRect;
    property NewImage: TBitmap read FNewImage write SetNewImage;
    property PrevImage: TBitmap read FPrevImage write SetPrevImage;
    property SourceRect: TRect read FSourceRect write FSourceRect;
    property ZoomMode: TZoomMode read FZoomMode write FZoomMode;
  end;

  /// <summary>
  /// TCalendarViewController is the Class controller of CalendarView.
  /// </summary>
  TCalendarViewController = class(TInterfacedObject, ICalendarViewController)
  strict private
    FAnimation: TBaseCalendarAnimation;
    FCalendarView: TCustomCalendarView;
    procedure AnimateNavigation(AImage: TBitmap; AForward: Boolean);
    procedure AnimateViewChange(APrevImage: TBitmap; ANewImage: TBitmap; const ASourceRect: TRect;
      const ADestRect: TRect; AZoomOut: Boolean);
    procedure AnimationFinished(Sender: TObject);
    function CanSetDisplayDate(ADate: TDate): Boolean;
    function GetBorderColor: TColor;
    function GetBorderSize: Integer;
    function GetColor: TColor;
    function GetCurrentPPI: Integer;
    function GetDisplayMode: TDisplayMode;
    function GetDrawer: TCalendarViewDrawer;
    function GetEnabled: Boolean;
    function GetFirstDayOfWeek: TDaysOfWeek;
    function GetFont: TFont;
    function GetHighlightToday: Boolean;
    function GetNumberOfWeeksInView: TItemsInRow;
    function GetOnDrawDayItem: TDrawViewInfoEvent;
    function GetOnDrawMonthItem: TDrawViewInfoEvent;
    function GetOnDrawYearItem: TDrawViewInfoEvent;
    function GetOwner: TObject;
    function GetShowDayOfWeek: Boolean;
    function IsDateSelected(const ADate: TDate): Boolean;
    function LimitDate(const ADate: TDate): TDate;
    procedure Navigate(AForward: Boolean);
    procedure SetDisplayDate(const Value: TDate);
    procedure SetDisplayMode(const Value: TDisplayMode);
    procedure SetFocusedDate(const ADate: TDate);
    procedure ClearFocusedItems;
    function GetLastFocusedItem: Integer;
    procedure SetLastFocusedItem(const Value: Integer);
  public
    constructor Create(ACalendarView: TCustomCalendarView);
    destructor Destroy; override;
    /// <summary>Calls the ClickOnDate method of CalendarView</summary>
    procedure ClickOnDate(ADate: TDate);
    /// <summary>Specifies the current number of pixels per inch. </summary>
    property CurrentPPI: Integer read GetCurrentPPI;
    /// <summary>Specifies and updates the DisplayMode property of CalendarView.</summary>
    property DisplayMode: TDisplayMode read GetDisplayMode write SetDisplayMode;
    /// <summary>Specifies and updates the FirstDayOfWeek property of CalendarView.</summary>
    property FirstDayOfWeek: TDaysOfWeek read GetFirstDayOfWeek;
    /// <summary>Specifies and updates the HighlightToday property of CalendarView.</summary>
    property HighlightToday: Boolean read GetHighlightToday;
    /// <summary>The Owner property is a link to CalendarView component.</summary>
    property Owner: TObject read GetOwner;
    /// <summary>Is a link to the OnDrawDayItem event of CalendarView.</summary>
    property OnDrawDayItem: TDrawViewInfoEvent read GetOnDrawDayItem;
    /// <summary>a link to the OnDrawMonthItem event of CalendarView.</summary>
    property OnDrawMonthItem: TDrawViewInfoEvent read GetOnDrawMonthItem;
    /// <summary>Is a link to the OnDrawYearItem event of CalendarView.</summary>
    property OnDrawYearItem: TDrawViewInfoEvent read GetOnDrawYearItem;
  end;

  /// <summary>
  /// Use TDrawParams to change the drawing of the TCalendarView items.
  /// </summary>
  TDrawParams = class
  strict private
    FBkColor: TColor;
    FCanvas: TCanvas;
    FDrawRect: TRect;
    FFont: TFont;
    FForegroundColor: TColor;
    FHandled: Boolean;
    procedure SetFont(const Value: TFont);
  private
    FFocused: Boolean;
  public
    constructor Create(const DrawRect: TRect); reintroduce; overload;
    destructor Destroy; override;
    /// <summary>Determines which background color to use when drawing.</summary>
    property BkColor: TColor read FBkColor write FBkColor;
    /// <summary>Specifies the Canvas where the drawing takes place.</summary>
    property Canvas: TCanvas read FCanvas write FCanvas;
    /// <summary>Specifies whether calendar item is focused.</summary>
    property Focused: Boolean read FFocused write FFocused;
    /// <summary>Specifies the rectangle where the drawing takes place.</summary>
    property DrawRect: TRect read FDrawRect;
    /// <summary>Specifies the font for the appropriate calendar item.</summary>
    property Font: TFont read FFont write SetFont;
    /// <summary>Specifies the foreground color of the element.</summary>
    property ForegroundColor: TColor read FForegroundColor write FForegroundColor;
    /// <summary>Specifies if the user draws the calendar by him/herself. </summary>
    property Handled: Boolean read FHandled write FHandled;
  end;

  /// <summary>
  /// TDrawViewInfoParams class is used for parameter for events of TDrawViewInfoEvent.
  /// </summary>
  TDrawViewInfoParams = class(TDrawParams)
  strict private
    FBorderColor: TColor;
    FBorderWidth: Integer;
    FFocusedColor: TColor;
    FFocusRectWidth: Integer;
    FGroupText: string;
    FSelectionColor: TColor;
    FText: string;
    FViewInfoProperties: TViewInfoProperties;
  public
    /// <summary>Determines whether a single line border is drawn around the grid and calendar elements.</summary>
    property BorderColor: TColor read FBorderColor write FBorderColor;
    /// <summary>Specifies the border width of the CalendarView item in pixels.</summary>
    property BorderWidth: Integer read FBorderWidth write FBorderWidth;
    /// <summary>Specifies the color of the dotted focus rectangle.</summary>
    property FocusedColor: TColor read FFocusedColor write FFocusedColor;
    /// <summary>Specifies the width of the sides of the dotted focus rectangle.</summary>
    property FocusRectWidth: Integer read FFocusRectWidth write FFocusRectWidth;
    /// <summary>Specifies the label of the first element in the group
    /// Month name for first day in Month View
    /// Year for January in Year View</summary>
    property GroupText: string read FGroupText write FGroupText;
    /// <summary>Specifies the color for selecting the elements.</summary>
    property SelectionColor: TColor read FSelectionColor write FSelectionColor;
    /// <summary>Specifies the text of the element.</summary>
    property Text: string read FText write FText;
    /// <summary>Is the set of properties that indicate whether the item is Today, Highlighted, Selected, Current, Focused, or First of group.</summary>
    property ViewInfoProperties: TViewInfoProperties read FViewInfoProperties write FViewInfoProperties;
  end;

  /// <summary>
  /// TCalendarViewInfoBase is a base class of the TCalendarView elements.
  /// </summary>
  TCalendarViewInfoBase = class abstract
  strict private
    FChildren: TObjectList<TCalendarViewInfoBase>;
    FHighlighted: Boolean;
    FOnDestroy: TNotifyEvent;
    FParent: TCalendarViewInfoBase;
    FPosition: TPoint;
    FSize: TSize;
    FFocused: Boolean;
    function GetGlobalRect: TRect;
    function GetHeight: Integer;
    function GetLeft: Integer;
    function GetLocalRect: TRect;
    function GetSizeRect: TRect;
    function GetTop: Integer;
    function GetWidth: Integer;
    procedure SetHeight(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  strict protected
    function GetTabOrder: Integer; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Adds a new object to the list of children.</summary>
    function AddChild<T: class>(const AChild: T): T;
    /// <summary>Occurs when the users click on the item.</summary>
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); virtual;
    /// <summary>Checks whether the specified point is in the GlobalRect of the item.</summary>
    function ContainsPoint(const Point: TPoint): Boolean; virtual;
    /// <summary>Draws the item.</summary>
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); virtual;
    /// <summary>Calls the Draw method of the children.</summary>
    procedure DrawChildren(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController);
    /// <summary>Calls the Draw method with the specified position of the item.</summary>
    procedure DrawDefault(ACanvas: TCanvas; ADrawer: TCalendarViewDrawer; const AController: ICalendarViewController);
    /// <summary>Calls the Draw method, but the image is painted to in-memory bitmap first, and then drawn to the control. </summary>
    procedure DrawDefaultBuffered(ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController);
    /// <summary>Searches for the child control at the specified position.</summary>
    function FindAtPoint(const Point: TPoint): TCalendarViewInfoBase;
    /// <summary>Specifies the children of the control.</summary>
    property Children: TObjectList<TCalendarViewInfoBase> read FChildren;
    /// <summary>Indicates whether the focused rectangle is drawn.</summary>
    property Focused: Boolean read FFocused write FFocused;
    /// <summary>Specifies the size and location of a certain item on CalendarView control.</summary>
    property GlobalRect: TRect read GetGlobalRect;
    /// <summary>Specifies the height of the item.</summary>
    property Height: Integer read GetHeight write SetHeight;
    /// <summary>Indicates whether the item appears highlighted.</summary>
    property Highlighted: Boolean read FHighlighted write FHighlighted;
    /// <summary>Specifies the horizontal coordinate of the left edge of the item.</summary>
    property Left: Integer read GetLeft write SetLeft;
    /// <summary>Specifies the size and location of a certain item on the parent.</summary>
    property LocalRect: TRect read GetLocalRect;
    /// <summary>Specifies the parent of ViewInfo.</summary>
    property Parent: TCalendarViewInfoBase read FParent;
    /// <summary>Specifies the position of the item on its parent. </summary>
    property Position: TPoint read FPosition write FPosition;
    /// <summary>Specifies the size of the item.</summary>
    property Size: TSize read FSize write FSize;
    /// <summary>Specifies the size of the rectangle.</summary>
    property SizeRect: TRect read GetSizeRect;
    /// <summary>Specifies tab order of the CalendarViewInfoBase.</summary>
    property TabOrder: Integer read GetTabOrder;
    /// <summary>Specifies the top point of the item. </summary>
    property Top: Integer read GetTop write SetTop;
    /// <summary>Specifies the width of the item. </summary>
    property Width: Integer read GetWidth write SetWidth;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

  /// <summary>
  /// TCustomCalendarHeaderItem is a base class for Header items of CalendarView.
  /// </summary>
  TCustomCalendarHeaderItem = class abstract(TCalendarViewInfoBase)
  strict private
    FHeaderInfo: TCalendarHeaderInfo;
  public
    constructor Create(const CalendarHeader: TCalendarHeaderInfo); reintroduce;
    /// <summary>Is a link to the HeaderInfo property of CalendarView.</summary>
    property HeaderInfo: TCalendarHeaderInfo read FHeaderInfo;
  end;

  /// <summary>
  /// Specifies details for the header text of CalendarView.
  /// </summary>
  TCalendarHeaderText = class(TCustomCalendarHeaderItem)
  strict private
    FText: string;
  strict protected
    function GetTabOrder: Integer; override;
  public
    /// <summary>Calculates the size of the calendar header text.</summary>
    procedure Calculate(ACanvas: TCanvas; const ASize: TSize);
    /// <summary>Switches the display mode of CalendarView to the next value (from month to year, from year to decade, etc.)</summary>
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); override;
    /// <summary>Draws the header text.</summary>
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
    /// <summary>Specifies the text for the calendar header.</summary>
    property Text: string read FText write FText;
  end;

  /// <summary>
  /// TCalendarHeaderNavigatorButton specifies details for the navigation button of CalendarView.
  /// </summary>
  TCalendarHeaderNavigatorButton = class(TCustomCalendarHeaderItem)
  strict private
    FOrientation: TDateNavigatorButtonOrientation;
    FTabOrder: Integer;
  strict protected
    function GetTabOrder: Integer; override;
  public
    constructor Create(const CalendarHeader: TCalendarHeaderInfo; const ATabOrder:
        Integer); reintroduce;
    /// <summary>Calculates the size of the navigation button.</summary>
    procedure Calculate(AHeight: Integer);
    /// <summary>Switches months of CalendarView to the next or previous.</summary>
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); override;
    /// <summary>Draws the navigation button.</summary>
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
    /// <summary>Specifies the orientation of the navigation button (next, previous).</summary>
    property Orientation: TDateNavigatorButtonOrientation read FOrientation write FOrientation;
  end;

  /// <summary>
  /// TCalendarDaysOfWeekViewInfo specifies details for the names of the days of the week for CalendarView.
  /// </summary>
  TCalendarDaysOfWeekViewInfo = class(TCustomCalendarHeaderItem)
  public
    /// <summary>Calculates the size of the labels of the days of the week. </summary>
    procedure Calculate(const ASize: TSize);
    /// <summary>Draws the labels of the days of the week.</summary>
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
  end;

  /// <summary>
  /// Use THeaderInfo to format the look of the header of CalendarView and CalendarPicker.
  /// </summary>
  TCalendarHeaderInfo = class(TComponent)
  strict private
    FCalendarView: TCustomCalendarView;
    FDaysOfWeekFont: TFont;
    FDrawer: TCalendarViewDrawer;
    FFont: TFont;
    FFontColor: TColor;
    FHighlightFontColor: TColor;
    FOnChange: TNotifyEvent;
    FOnDrawDayOfWeek: TDrawDayOfWeekEvent;
    FOnDrawHeader: TDrawEvent;
    FOnDrawNavigationButton: TDrawNavigationEvent;
    procedure ObjectChanged(Senter: TObject);
    procedure SetDaysOfWeekFont(const Value: TFont);
    procedure SetFont(const Value: TFont);
    procedure SetFontColor(const Value: TColor);
    procedure SetHighlightFontColor(const Value: TColor);
  private
    procedure SetOnDrawDayOfWeek(const Value: TDrawDayOfWeekEvent);
    procedure SetOnDrawHeader(const Value: TDrawEvent);
    procedure SetOnDrawNavigationButton(const Value: TDrawNavigationEvent);
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    /// <summary>Changed method is called when CalendarHeaderInfo is changed.</summary>
    procedure Changed;
    /// <summary>Calls the OnDrawDayOfWeek event.</summary>
    procedure DoOnDrawDayOfWeek(DrawParams: TDrawParams; DayNumber: Integer; var Text: string);
    /// <summary>Calls the OnDrawHeaderWeek event.</summary>
    procedure DoOnDrawHeader(DrawParams: TDrawParams; var Text: string);
    /// <summary>Calls the OnDrawNavigationButton event.</summary>
    procedure DoOnDrawNavigationButton(DrawParams: TDrawParams; Orientation: TDateNavigatorButtonOrientation);
    /// <summary>OnChange event is called when CalendarHeaderInfo is changed.</summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    /// <summary>Specifies the font for the days of the week</summary>
    property DaysOfWeekFont: TFont read FDaysOfWeekFont write SetDaysOfWeekFont;
    /// <summary>Specifies the font of header of the CalendarView.</summary>
    property Font: TFont read FFont write SetFont;
    /// <summary>Specifies the font color for the CalendarView header elements.</summary>
    property FontColor: TColor read FFontColor write SetFontColor default clBlack;
    /// <summary>Specifies the color for highlighting the CalendarView header elements.</summary>
    property HighlightFontColor: TColor read FHighlightFontColor write SetHighlightFontColor default clHighlight;
    /// <summary>OnDrawDayOfWeek event occurs when the day of the week is drown.</summary>
    property OnDrawDayOfWeek: TDrawDayOfWeekEvent read FOnDrawDayOfWeek write SetOnDrawDayOfWeek;
    /// <summary>OnDrawHeader event occurs when the header is drown.</summary>
    property OnDrawHeader: TDrawEvent read FOnDrawHeader write SetOnDrawHeader;
    /// <summary>OnDrawNavigationButton event occurs when the navigation button is drown.</summary>
    property OnDrawNavigationButton: TDrawNavigationEvent read FOnDrawNavigationButton write SetOnDrawNavigationButton;
  end;

  /// <summary>
  /// TCellItemViewInfo is a base class of ViewInfo for the cells of CalendarView.
  /// </summary>
  TCellItemViewInfo = class abstract(TCalendarViewInfoBase)
  strict protected
    FCell: TPoint;
    FDate: TDate;
    function CellText: string; virtual; abstract;
    function GroupText: string; virtual; abstract;
    function ItemIsCurrent: Boolean; virtual; abstract;
  protected
    procedure PrepareDrawParams(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController);
  public
    constructor Create(const ACell: TPoint; const ADate: TDate); reintroduce;
    /// <summary>Calls the OnDraw event of CalendarView.</summary>
    procedure DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController); virtual; abstract;
    /// <summary>Draws CellItemsView.</summary>
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
    /// <summary>Specifies the coordinates of the certain cell as it is on the grid.</summary>
    property Cell: TPoint read FCell;
    /// <summary>Specifies the date of the cell.</summary>
    property Date: TDate read FDate;
  end;

  /// <summary>
  /// TCellDayInfo is a Cell Info used in a CalendarView Monthly Display mode.
  /// </summary>
  TCellDayInfo = class(TCellItemViewInfo)
  strict protected
    function CellText: string; override;
    function GroupText: string; override;
    function ItemIsCurrent: Boolean; override;
  public
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); override;
    procedure DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController); override;
  end;

  /// <summary>
  /// TCellDayInfo is a Cell Info used in a CalendarView Yearly Display mode.
  /// </summary>
  TCellMonthInfo = class(TCellItemViewInfo)
  strict protected
    function CellText: string; override;
    function GroupText: string; override;
    function ItemIsCurrent: Boolean; override;
  public
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); override;
    procedure DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController); override;
  end;

  /// <summary>
  /// TCellDayInfo is a Cell Info used in a CalendarView Decade Display mode.
  /// </summary>
  TCellYearInfo = class(TCellItemViewInfo)
  strict protected
    function CellText: string; override;
    function GroupText: string; override;
    function ItemIsCurrent: Boolean; override;
  public
    procedure Click(const AController: ICalendarViewController; ByMouse: Boolean); override;
    procedure DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController); override;
  end;

  /// <summary>
  /// TCalendarNavigationButtons is a class that puts the navigation buttons together.
  /// </summary>
  TCalendarNavigationButtons = class(TCalendarViewInfoBase)
  strict private
    FButtonNext: TCalendarHeaderNavigatorButton;
    FButtonPrev: TCalendarHeaderNavigatorButton;
  public
    constructor Create(const CalendarHeader: TCalendarHeaderInfo);
    procedure Calculate(const ASize: TSize);
    property ButtonNext: TCalendarHeaderNavigatorButton read FButtonNext;
    property ButtonPrev: TCalendarHeaderNavigatorButton read FButtonPrev;
  end;

  /// <summary>
  /// THeaderViewInfo is a class that represents view info of a TCalendarView header
  /// </summary>
  THeaderViewInfo = class(TCalendarViewInfoBase)
  strict private
    FHeaderInfo: TCalendarHeaderInfo;
    FHeaderText: TCalendarHeaderText;
    FNavigationButtons: TCalendarNavigationButtons;
  public
    constructor Create(const AHeaderInfo: TCalendarHeaderInfo);
    procedure Calculate(const ASize: TSize);
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
    /// <summary>Is a link to the TCalendarHeaderInfo class.</summary>
    property HeaderInfo: TCalendarHeaderInfo read FHeaderInfo;
    /// <summary>Is a link to the TCalendarHeaderText class.</summary>
    property HeaderText: TCalendarHeaderText read FHeaderText;
    /// <summary>Is a link to the TCalendarNavigationButtons class.</summary>
    property NavigationButtons: TCalendarNavigationButtons read FNavigationButtons;
  end;

  TFocusDirection = (fdUp, fdDown, fdLeft, fdRight, fdPageUp, fdPageDown);
  {$SCOPEDENUMS OFF}

  /// <summary>
  /// TCalendarCellItemsViewInfo is a class that represents a view info of elements of the CalendarView - days, monthes, years
  /// </summary>
  TCalendarCellItemsViewInfo = class abstract(TCalendarViewInfoBase)
  strict private
    FActualDate: TDate;
    FCellHeight: Integer;
    FController: ICalendarViewController;
    FDisplayMode: TDisplayMode;
    FFocusedDate: TDate;
    FInAnimationState: Boolean;
    FStartDate: TDate;
    function GetCellCount: Integer;
    function GetCells(Index: Integer): TCellItemViewInfo;
    function GetCountInCol: Integer;
    function GetCountInRow: Integer;
    function GetFocusedCell: TPoint;
    function GetFocusedCellIndex: Integer;
    function GetFocusedCellInfo: TCellItemViewInfo;
    procedure SetFocusedCell(const Value: TPoint);
    procedure SetFocusedCellIndex(const Value: Integer);
    procedure SetFocusedDate(const Value: TDate);
    procedure SetInAnimationState(const Value: Boolean);
  private
    FDisplayFocused: Boolean;
  strict protected
    function GetTabOrder: Integer; override;
  public
    constructor Create(const AController: ICalendarViewController; ADisplayMode: TDisplayMode);
    destructor Destroy; override;
    /// <summary>Creates and recreates elements of the Calendar grid, calculates the size of the calendar grid.</summary>
    procedure Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer; ARowCount: Integer);
    /// <summary>Descendants of TCalendarCellItemsViewInfo implement the ItemIsFirstOfGroup method to indicate whether the specified date is the date of the first element of the group.</summary>
    function ItemIsFirstOfGroup(ADate: TDate): Boolean; virtual; abstract;
    /// <summary>Descendants of TCalendarCellItemsViewInfo implement the ItemIsInCurrentRange method to indicate whether the specified date is in the current range.</summary>
    function ItemIsInCurrentRange(ADate: TDate): Boolean; virtual; abstract;
    /// <summary>Specifies the actual date displayed on CalendarView.</summary>
    property ActualDate: TDate read FActualDate write FActualDate;
    /// <summary>Specifies how many elements on the grid the TCalendarView control contains.</summary>
    property CellCount: Integer read GetCellCount;
    /// <summary>Specifies the height of TCalendarView cells in pixels.</summary>
    property CellHeight: Integer read FCellHeight;
    /// <summary>Gives the access to cells in TCalendarView.</summary>
    property Cells[Index: Integer]: TCellItemViewInfo read GetCells;
    /// <summary>Specifies how many cells a column contains.</summary>
    property CountInCol: Integer read GetCountInCol;
    /// <summary>Specifies how many cells a row contains.</summary>
    property CountInRow: Integer read GetCountInRow;
    /// <summary>Indicates whether the focused rectangle is drawn.</summary>
    property DisplayFocused: Boolean read FDisplayFocused write FDisplayFocused;
    /// <summary>Shows the current display mode when a user interacts with the control.</summary>
    property DisplayMode: TDisplayMode read FDisplayMode;
    /// <summary>Specifies the coordinates of the focused cell as an element on the grid.</summary>
    property FocusedCell: TPoint read GetFocusedCell write SetFocusedCell;
    /// <summary>Specifies the index of the focused cell.</summary>
    property FocusedCellIndex: Integer read GetFocusedCellIndex write SetFocusedCellIndex;
    /// <summary>Specifies the Cell Item View Info of the focused cell.</summary>
    property FocusedCellInfo: TCellItemViewInfo read GetFocusedCellInfo;
    /// <summary>Specifies the focused date.</summary>
    property FocusedDate: TDate read FFocusedDate write SetFocusedDate;
    /// <summary>Indicates whether the calendar is in the animation state.</summary>
    property InAnimationState: Boolean read FInAnimationState write SetInAnimationState;
    /// <summary>Specifies the date of the first day displayed in TCalendarView.</summary>
    property StartDate: TDate read FStartDate write FStartDate;
  end;

  /// <summary>
  /// TCalendarCellItemsMonthlyViewInfo is a base class for the Calendar View Info, which represents cells on the grid in the month view.
  /// </summary>
  TCalendarCellItemsMonthlyViewInfo = class(TCalendarCellItemsViewInfo)
  public
    function ItemIsFirstOfGroup(ADate: TDate): Boolean; override;
    function ItemIsInCurrentRange(ADate: TDate): Boolean; override;
  end;

  /// <summary>
  /// TCalendarCellItemsYearlyViewInfo is a base class for the Calendar View Info, which represents cells on the grid in the year view.
  /// </summary>
  TCalendarCellItemsYearlyViewInfo = class(TCalendarCellItemsViewInfo)
  public
    function ItemIsFirstOfGroup(ADate: TDate): Boolean; override;
    function ItemIsInCurrentRange(ADate: TDate): Boolean; override;
  end;

  /// <summary>
  /// TCalendarCellItemsDecadeViewInfo is a base class for the Calendar View Info, which represents cells on the calendar grid in the decade view.
  /// </summary>
  TCalendarCellItemsDecadeViewInfo = class(TCalendarCellItemsViewInfo)
    function ItemIsFirstOfGroup(ADate: TDate): Boolean; override;
    function ItemIsInCurrentRange(ADate: TDate): Boolean; override;
  end;

  /// <summary>
  /// TCalendarViewViewInfoBase is a Base class for the Calendar View Info, which represents the calendar grid.
  /// </summary>
  TCalendarViewViewInfoBase = class abstract(TCalendarViewInfoBase)
  strict private
    FBody: TCalendarViewInfoBase;
    FController: ICalendarViewController;
    FHeader: THeaderViewInfo;
    FHeaderInfo: TCalendarHeaderInfo;
  private
    FDrawer: TCalendarViewDrawer;
  strict protected
    FCellsInfo: TCalendarCellItemsViewInfo;
    /// <summary>Runs the date changing animation. When the animation finishes the method sets the new date.</summary>
    procedure AnimateAndSet(AForward: Boolean; ADisableStates: Boolean; APrevStartDate: TDate; ANewStartDate: TDate;
      ANewActualDate: TDate);
    /// <summary>Descendants of TCalendarViewViewInfoBase implement the Diff method to get the number of elements between two dates.</summary>
    function Diff(AStart: TDate; AEnd: TDate): Integer; virtual; abstract;
    /// <summary>Returns the actual date of the CellViewItemInfo.</summary>
    function GetActualDate: TDate; virtual;
    /// <summary>Descendants of TCalendarViewViewInfoBase implement the GetDisplayMode method to specify a certain display mode in each descendant.</summary>
    function GetDisplayMode: TDisplayMode; virtual; abstract;
    /// <summary>Returns the focused date of CellViewItemInfo.</summary>
    function GetFocusedDate: TDate; virtual;
    /// <summary>Descendants of TCalendarViewViewInfoBase implement the GetHeaderText method to specify the text of the header, formatted in a specific for each display mode way.</summary>
    function GetHeaderText: string; virtual; abstract;
    /// <summary>Descendants of TCalendarViewViewInfoBase implement the GetNextDate method to get the date, which will be displayed next to the currently selected one.</summary>
    function GetNextDate: TDate; virtual; abstract;
    /// <summary>Returns the start date of CellViewItemInfo.</summary>
    function GetStartDate: TDate; virtual;
    /// <summary>Sets the actual date of CellViewItemInfo and calls the Calculate method.</summary>
    procedure SetActualDate(const Value: TDate); virtual;
    /// <summary>Sets the focused date of CellViewItemInfo.</summary>
    procedure SetFocusedDate(const Value: TDate); virtual;
    /// <summary>Sets the start date of CellViewItemInfo and calls Calculate method.</summary>
    procedure SetStartDate(const Value: TDate); virtual;
  public
    constructor Create(const AHeaderInfo: TCalendarHeaderInfo; const AController:
        ICalendarViewController; ADrawer: TCalendarViewDrawer); virtual;
    /// <summary>Creates and recreates elements of the Calendar grid, calculates the size of the calendar grid.</summary>
    procedure Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer); virtual; abstract;
    procedure Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
      const AController: ICalendarViewController); override;
    /// <summary>Calculates the new focused cell depending on the direction parameter.</summary>
    procedure FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController); virtual; abstract;
    /// <summary>Descendants of TCalendarViewViewInfoBase implement the Navigate method to switch to next month, year or decade.  </summary>
    procedure Navigate(AForward: Boolean); virtual; abstract;
    /// <summary>Is the actual date of the CellViewItemInfo.</summary>
    property ActualDate: TDate read GetActualDate write SetActualDate;
    /// <summary>Is a container for TCalendarView elements.</summary>
    property Body: TCalendarViewInfoBase read FBody;
    /// <summary>Represents the calendar grid cells. It is a link to Calendar View Info.</summary>
    property CellsInfo: TCalendarCellItemsViewInfo read FCellsInfo;
    /// <summary>Is a controller of TCalendarView.</summary>
    property Controller: ICalendarViewController read FController;
    /// <summary>Specifies a certain display mode in each ancestor.</summary>
    property DisplayMode: TDisplayMode read GetDisplayMode;
    /// <summary>is focused date of CellViewItemInfo.</summary>
    property FocusedDate: TDate read GetFocusedDate write SetFocusedDate;
    /// <summary>Is a link to CalendarheaderViewInfo.</summary>
    property Header: THeaderViewInfo read FHeader;
    /// <summary>Is a link to CalendarHeader.</summary>
    property HeaderInfo: TCalendarHeaderInfo read FHeaderInfo;
    /// <summary>Is the date, which will be displayed next to the currently selected.</summary>
    property NextDate: TDate read GetNextDate;
    /// <summary>Is the date, which is the start date of CellViewItemInfo.</summary>
    property StartDate: TDate read GetStartDate write SetStartDate;
  end;

  /// <summary>
  /// TCalendarViewMonthlyViewInfo is a class for the Calendar View Info, which represents the calendar grid in Monthly view
  /// </summary>
  TCalendarViewMonthlyViewInfo = class(TCalendarViewViewInfoBase)
  strict private
    FWeekDays: TCalendarDaysOfWeekViewInfo;
  strict protected
    function Diff(AStart: TDate; AEnd: TDate): Integer; override;
    function GetDisplayMode: TDisplayMode; override;
    function GetHeaderText: string; override;
    function GetNextDate: TDate; override;
    procedure SetActualDate(const Value: TDate); override;
    procedure SetFocusedDate(const Value: TDate); override;
    procedure SetStartDate(const Value: TDate); override;
  public
    constructor Create(const AHeaderInfo: TCalendarHeaderInfo; const AController:
        ICalendarViewController; ADrawer: TCalendarViewDrawer); override;
    procedure Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer); override;
    function CorrectStartDate(const Value: TDate): TDate;
    procedure FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController); override;
    procedure Navigate(AForward: Boolean); override;
    /// <summary>Represents the names of days of week line in the header. Is a link to DaysOfWeekViewInfo.</summary>
    property WeekDays: TCalendarDaysOfWeekViewInfo read FWeekDays;
  end;

  /// <summary>
  /// TCalendarViewYearlyViewInfo is a class for the Calendar View Info, which represents the calendar grid in Yearly view
  /// </summary>
  TCalendarViewYearlyViewInfo = class(TCalendarViewViewInfoBase)
  strict protected
    function Diff(AStart: TDate; AEnd: TDate): Integer; override;
    function GetDisplayMode: TDisplayMode; override;
    function GetHeaderText: string; override;
    function GetNextDate: TDate; override;
    procedure SetActualDate(const Value: TDate); override;
    procedure SetStartDate(const Value: TDate); override;
  public
    constructor Create(const AHeaderInfo: TCalendarHeaderInfo; const AController:
        ICalendarViewController; ADrawer: TCalendarViewDrawer); override;
    procedure Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer); override;
    function CorrectStartDate(const Value: TDate): TDate;
    procedure FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController); override;
    procedure Navigate(AForward: Boolean); override;
  end;

  /// <summary>
  /// TCalendarViewMonthlyViewInfo is a class for the Calendar View Info, which represents the calendar grid in Decade view
  /// </summary>
  TCalendarViewDecadeViewInfo = class(TCalendarViewViewInfoBase)
  strict protected
    function Diff(AStart: TDate; AEnd: TDate): Integer; override;
    function GetDisplayMode: TDisplayMode; override;
    function GetHeaderText: string; override;
    function GetNextDate: TDate; override;
  public
    constructor Create(const AHeaderInfo: TCalendarHeaderInfo; const AController:
        ICalendarViewController; ADrawer: TCalendarViewDrawer); override;
    procedure Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer); override;
    procedure FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController); override;
    procedure Navigate(AForward: Boolean); override;
  end;

  /// <summary>
  /// TCalendarViewDrawer is a base class for drawing CalendarView.
  /// </summary>
  TCalendarViewDrawer = class abstract
  strict protected
    FCalendarView: TCustomCalendarView;
    /// <summary>Mixes the given colors.</summary>
    function MiddleColor(AColor1, AColor2: TColor; Coeff : Double = 0.5): TColor;
  protected
    /// <summary>Draws the focused rectangle.</summary>
    procedure DrawFocusRect(ACanvas: TCanvas; const ARect: TRect; AWith: Integer; ALength: Integer;
      ASkipLength: Integer);
  public
    constructor Create(const ACalendarView: TCustomCalendarView); reintroduce;
    /// <summary>Draws items for CalendarView</summary>
    procedure DrawCalendarItem(ADrawParams: TDrawViewInfoParams; ACanvas: TCanvas;
      AViewInfo: TCellItemViewInfo); virtual;
    /// <summary>Draws the CalendarPicker.</summary>
    procedure DrawCalendarPicker(ADrawParams: TDrawParams; ACanvas: TCanvas; ACalendarPicker:
        TCustomCalendarPicker; ABorderSize, AIconSize: Integer); virtual; abstract;
    /// <summary>Draws the days of the week.</summary>
    procedure DrawDayOfWeek(ADrawParams: TDrawParams; ACanvas: TCanvas; const AText: string); virtual;
    /// <summary>Draws the rectangle for the header.</summary>
    procedure DrawHeaderRect(ADrawParams: TDrawParams; Canvas: TCanvas); virtual;
    /// <summary>Draws the header text.</summary>
    procedure DrawHeaderText(ADrawParams: TDrawParams; ACanvas: TCanvas; AText:
        string); virtual;
    /// <summary>Draws the navigation buttons - next and previous.</summary>
    procedure DrawNavigatorButtons(ADrawParams: TDrawParams; ACanvas: TCanvas; AOrientation:
        TDateNavigatorButtonOrientation; AArrowWidth: Integer); virtual;
    /// <summary>Prepares the drawing parameters for the CalendarPicker.</summary>
    procedure PrepareCalendarBackground(var AColor: TColor; AEnabled: Boolean); virtual;
    /// <summary>Prepares the drawing parameters of the calendar background.</summary>
    procedure PrepareCalendarPickerParams(ADrawParams: TDrawParams; ACalendarPicker: TCustomCalendarPicker;
      AHot, APressed, AEnabled: Boolean); virtual;
    /// <summary>Prepares the drawing parameters of cells.</summary>
    procedure PrepareCellStyleParams(ADrawParams: TDrawViewInfoParams; AViewInfo: TCellItemViewInfo;
        AEnabled: Boolean); virtual;
    /// <summary>Prepares the drawing parameter for the days of the week.</summary>
    procedure PrepareDaysOfWeekParams(ADrawParams: TDrawParams; AEnabled: Boolean); virtual;
    /// <summary>Prepares the parameters of the header. </summary>
    procedure PrepareHeaderParams(ADrawParams: TDrawParams; AHeader: TCalendarHeaderInfo; AEnabled:
        Boolean); virtual;
    /// <summary>Prepares the parameters for the header text. </summary>
    procedure PrepareHeaderTextParams(ADrawParams: TDrawParams; AHeader: TCalendarHeaderText;
      AHighlited: Boolean; AEnabled: Boolean); virtual;
    /// <summary>Prepares the parameters for the navigation buttons. </summary>
    procedure PrepareNavigatorButtonsParams(ADrawParams: TDrawParams; AButton:
        TCalendarHeaderNavigatorButton; AEnabled: Boolean); virtual;
  end;

  /// <summary>
  /// TCalendarViewDrawerNative is a base class for drawing CalendarView.
  /// </summary>
  TCalendarViewDrawerNative = class(TCalendarViewDrawer)
  strict private
    FButtonBitmap: TBitmap;
  protected
    /// <summary>Loads the calendar icon from resources.</summary>
    procedure LoadImage;
  public
    constructor Create(const ACalendarView: TCustomCalendarView);
    destructor Destroy; override;
    procedure DrawCalendarPicker(ADrawParams: TDrawParams; ACanvas: TCanvas; ACalendarPicker:
        TCustomCalendarPicker; ABorderSize, AIconSize: Integer); override;
  end;

  /// <summary>
  /// TCalendarViewDrawerNative is a class for drawing CalendarView. It is used when custom VCL styles are active
  /// </summary>
  TCalendarViewDrawerStyled = class(TCalendarViewDrawer)
  protected
    function GetActiveArrowColor(AEnabled: Boolean): TColor;
    function GetActiveBorderColor: TColor;
    function GetArrowColor(AEnabled: Boolean): TColor;
    function GetBackgroundColor(AEnabled: Boolean): TColor;
    function GetBorderColor: TColor;
    function GetFocusFrameColor(AEnabled: Boolean): TColor;
    function GetHeaderActiveTextColor(AEnabled: Boolean): TColor;
    function GetHeaderTextColor(AEnabled: Boolean): TColor;
    function GetHotFrameColor(AEnabled: Boolean): TColor;
    function GetInActiveCellBGColor(AEnabled: Boolean): TColor;
    function GetInActiveCellTextColor(AEnabled: Boolean): TColor;
    function GetLineColor: TColor;
    function GetSelectionColor(AEnabled: Boolean): TColor;
    function GetSelectionColorText(AEnabled: Boolean): TColor;
    function GetSelectionFrameColor(AEnabled: Boolean): TColor;
    function GetTextColor(AEnabled: Boolean): TColor;
    function GetWeekDayColor(AEnabled: Boolean): TColor;
  public
    procedure DrawCalendarPicker(ADrawParams: TDrawParams; ACanvas: TCanvas; ACalendarPicker:
        TCustomCalendarPicker; ABorderSize, AIconSize: Integer); override;
    procedure PrepareCalendarBackground(var AColor: TColor; AEnabled: Boolean); override;
    procedure PrepareCalendarPickerParams(ADrawParams: TDrawParams; ACalendarPicker:
        TCustomCalendarPicker; AHot, APressed, AEnabled: Boolean); override;
    procedure PrepareCellStyleParams(ADrawParams: TDrawViewInfoParams; AViewInfo: TCellItemViewInfo;
        AEnabled: Boolean); override;
    procedure PrepareDaysOfWeekParams(ADrawParams: TDrawParams; AEnabled: Boolean); override;
    procedure PrepareHeaderParams(ADrawParams: TDrawParams; AHeader: TCalendarHeaderInfo; AEnabled: Boolean); override;
    procedure PrepareHeaderTextParams(ADrawParams: TDrawParams; AHeader: TCalendarHeaderText;
      AHighlited: Boolean; AEnabled: Boolean); override;
    procedure PrepareNavigatorButtonsParams(ADrawParams: TDrawParams; AButton:
        TCalendarHeaderNavigatorButton; AEnabled: Boolean); override;
  end;

  /// <summary>
  /// TCustomCalendarView is the base class for TCalendarView.
  /// </summary>
  TCustomCalendarView = class(TCustomControl)
  strict private
    FBorderColor: TColor;
    FBorderSize: Integer;
    FBorderStyle: TBorderStyle;
    FChangeCounter: Integer;
    FController: ICalendarViewController;
    FDisabledColor: TColor;
    FDisplayMode: TDisplayMode;
    FDrawer: TCalendarViewDrawer;
    FFirstDayOfWeek: TDaysOfWeek;
    FFirstYear: Integer;
    FFocusedColor: TColor;
    FHeaderInfo: TCalendarHeaderInfo;
    FHighlightColor: TColor;
    FLastHoverItem: TCalendarViewInfoBase;
    FLastYear: Integer;
    FMaxYear: Integer;
    FMinYear: Integer;
    FNumberOfWeeksInView: TItemsInRow;
    FOnChange: TNotifyEvent;
    FOnChangeView: TChangeViewEvent;
    FOnDrawDayItem: TDrawViewInfoEvent;
    FOnDrawMonthItem: TDrawViewInfoEvent;
    FOnDrawYearItem: TDrawViewInfoEvent;
    FSelectedDates: TList<TDate>;
    FSelectionColor: TColor;
    FShowFirstOfGroupLabel: Boolean;
    FTodayColor: TColor;
    FViewInfo: TCalendarViewViewInfoBase;
    FWasChanged: Boolean;
    procedure BeginUpdate;
    procedure Changed;
    function CreateViewInfo(ADisplayMode: TDisplayMode): TCalendarViewViewInfoBase;
    procedure DoOnChange;
    procedure DoOnChangeView(OldMode: TDisplayMode; NewMode: TDisplayMode);
    function DoStoreDate: Boolean;
    procedure EndUpdate;
    function GetDate: TDate;
    function GetSelectedDates(const Index: Integer): TDate;
    function GetSelectionCount: Integer;
    function GetShowDayOfWeek: Boolean;
    procedure HoverItemDestroyed(Sender: TObject);
    procedure LayoutChanged;
    procedure RecalculateViewInfo;
    procedure RedrawItem(AItem: TCalendarViewInfoBase);
    procedure SetBorderStyle(const Value: TBorderStyle);
    procedure SetCurrentHoverItem(const ANewItem: TCalendarViewInfoBase);
    procedure SetDate(const Value: TDate);
    procedure SetDisplayMode(const Value: TDisplayMode);
    procedure SetFirstDayOfWeek(const Value: TDaysOfWeek);
    procedure SetFirstYear(const Value: Integer);
    procedure SetHighlightToday(const Value: Boolean);
    procedure SetLastYear(const Value: Integer);
    procedure SetMaxYear(const Value: Integer);
    procedure SetMinYear(const Value: Integer);
    procedure SetSelectionMode(const Value: TSelectionMode);
    procedure SetShowDayOfWeek(const Value: Boolean);
    function SetFocusedViewInfo(AForward: Boolean): Boolean;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
  private
    FLastFocusedItemIndex: Integer;
    function IsDateSelected(Date: TDate): Boolean;
    function LimitDate(const ADate: TDate): TDate;
    procedure SetBorderColor(const Value: TColor);
    procedure SetDisabledColor(const Value: TColor);
    procedure SetFocusedColor(const Value: TColor);
    procedure ClearFocusedItems;
    function GetFocusedItem: TCalendarViewInfoBase;
    procedure SetHighlightColor(const Value: TColor);
    procedure SetNumberOfWeeksInView(const Value: TItemsInRow);
    procedure SetSelectionColor(const Value: TColor);
    procedure SetShowFirstOfGroupLabel(const Value: Boolean);
    procedure SetTodayColor(const Value: TColor);
    procedure SetCellsFocused;
  strict protected
    FHighlightToday: Boolean;
    FSelectionMode: TSelectionMode;
    FShowDayOfWeek: Boolean;
    function TabIsCyclic: Boolean; virtual;
  protected
    /// <summary>Verifies if the date is within the FirstYear and LastYear range if they are defined.</summary>
    function CanSetDisplayDate(const Date: TDate): Boolean;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    /// <summary>Is called when users click on a certain date.</summary>
    procedure ClickOnDate(const ADate: TDate);
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMStyleChanged(var Message: TMessage); message CM_STYLECHANGED;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
    /// <summary>Creates a new drawer of a particular class depending if a Custom VCL style is active or not.</summary>
    function CreateDrawer: TCalendarViewDrawer; virtual;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    /// <summary>Called when the drawer is needed.</summary>
    function NeedDrawer: TCalendarViewDrawer;
    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    /// <summary>Determines color of a single line border is drawn around the grid.</summary>
    property BorderColor: TColor read FBorderColor write SetBorderColor default clCalendarBorderColor;
    /// <summary>Specifies the date for the calendar to display or date selection.</summary>
    property Date: TDate read GetDate write SetDate stored DoStoreDate;
    /// <summary>Specifies what color is used for the disabled days.</summary>
    property DisabledColor: TColor read FDisabledColor write SetDisabledColor default clBtnFace;
    /// <summary>Indicates the initial display mode.</summary>
    property DisplayMode: TDisplayMode read FDisplayMode write SetDisplayMode default TDisplayMode.dmMonth;
    /// <summary>Determines the first year to be displayed in the CalendarView.</summary>
    property FirstYear: Integer read FFirstYear write SetFirstYear default 0;
    /// <summary>Specifies the color of the dotted focus rectangle.</summary>
    property FocusedColor: TColor read FFocusedColor write SetFocusedColor default clGray;
    /// <summary>Use the HeaderInfo property to change the look of TCalendarView header.</summary>
    property HeaderInfo: TCalendarHeaderInfo read FHeaderInfo;
    /// <summary>Specifies the color for highlighting the CalendarView header elements.</summary>
    property HighlightColor: TColor read FHighlightColor write SetHighlightColor default
        clCalendarHighlighColor;
    /// <summary>Specifies the color for highlighting the day that stands for today.</summary>
    property HighlightToday: Boolean read FHighlightToday write SetHighlightToday default True;
    /// <summary>Specifies the last year displayed in TCalendarView.</summary>
    property LastYear: Integer read FLastYear write SetLastYear default 0;
    /// <summary>Specifies the last year that a user can select.</summary>
    property MaxYear: Integer read FMaxYear write SetMaxYear default 0;
    /// <summary>Specifies the first year that a user can select.</summary>
    property MinYear: Integer read FMinYear write SetMinYear default 0;
    /// <summary>Specifies what color is used for selected rectangle.</summary>
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor default clHighlight;
    /// <summary>Specifies how many dates may be selected at a time.</summary>
    property SelectionMode: TSelectionMode read FSelectionMode write SetSelectionMode default TSelectionMode.smSingle;
    /// <summary>Indicates whether the abbreviations for the names of the days of the week are visible on TCalendarView.</summary>
    property ShowDayOfWeek: Boolean read GetShowDayOfWeek write SetShowDayOfWeek default True;
    /// <summary>Indicates whether the label of the first element in the group is visible.</summary>
    property ShowFirstOfGroupLabel: Boolean read FShowFirstOfGroupLabel write SetShowFirstOfGroupLabel default False;
    /// <summary>Specifies what color is used to highlight the day standing for today.</summary>
    property TodayColor: TColor read FTodayColor write SetTodayColor default clCalendarTodayColor;
    /// <summary>OnChange event occurs when the calendar changes.</summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    /// <summary>OnChangeView event occurs when the user switches among available views.</summary>
    property OnChangeView: TChangeViewEvent read FOnChangeView write FOnChangeView;
    /// <summary>OnDrawDayItem event occurs when the day item is drawn.</summary>
    property OnDrawDayItem: TDrawViewInfoEvent read FOnDrawDayItem write FOnDrawDayItem;
    /// <summary>OnDrawMonthItem event occurs when the month item is drawn.</summary>
    property OnDrawMonthItem: TDrawViewInfoEvent read FOnDrawMonthItem write FOnDrawMonthItem;
    /// <summary>OnDrawYearItem event occurs when the year item is drawn.</summary>
    property OnDrawYearItem: TDrawViewInfoEvent read FOnDrawYearItem write FOnDrawYearItem;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    /// <summary>AddToSelectedDates adds dates to the selected ones.</summary>
    procedure AddToSelectedDates(const Values: array of TDate); overload;
    /// <summary>AddToSelectedDates adds the date to the selected ones.</summary>
    procedure AddToSelectedDates(const Value: TDate); overload;
    /// <summary>AnimationFinished is called when the animation finishes.</summary>
    procedure AnimationFinished(Sender: TObject);
    /// <summary>NeedCurrentViewInfo is called when the current view info is needed. </summary>
    function NeedCurrentViewInfo: TCalendarViewViewInfoBase;
    /// <summary>Removes the selection of dates.</summary>
    function RemoveFromSelectedDates(const Value: TDate): Boolean;
    /// <summary>Sets the date displayed in the CalendarView.</summary>
    procedure SetDisplayDate(const ADate: TDate);
    /// <summary>Specifies the size of the border.</summary>
    property BorderSize: Integer read FBorderSize;
    /// <summary>Specifies the style of the border.</summary>
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    /// <summary>Defines what day is set as the first day of the week.</summary>
    property FirstDayOfWeek: TDaysOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek default TDaysOfWeek.dwSunday;
    /// <summary>Defines count of weeks in the ValendarView.</summary>
    property NumberOfWeeksInView: TItemsInRow read FNumberOfWeeksInView write
        SetNumberOfWeeksInView default 6;
    /// <summary>Lists the selected dates.</summary>
    property SelectedDates[const Index: Integer]: TDate read GetSelectedDates;
    /// <summary>Specifies how many dates are selected.</summary>
    property SelectionCount: Integer read GetSelectionCount;
  end;

  TCalendarView = class(TCustomCalendarView)
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderColor;
    property BorderStyle;
    property Color default clWhite;
    property Cursor;
    property Date;
    property DisabledColor;
    property DisplayMode;
    property Enabled;
    property FirstDayOfWeek;
    property FirstYear;
    property FocusedColor;
    property Font;
    property HeaderInfo;
    property Height default 337;
    property HighlightColor;
    property HighlightToday;
    property LastYear;
    property MaxYear;
    property MinYear;
    property NumberOfWeeksInView;
    property OnChange;
    property OnChangeView;
    property OnClick;
    property OnDblClick;
    property OnDrawDayItem;
    property OnDrawMonthItem;
    property OnDrawYearItem;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property SelectionColor;
    property SelectionMode;
    property ShowDayOfWeek;
    property ShowFirstOfGroupLabel;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property TodayColor;
    property Touch;
    property Visible;
    property Width default 294;
  end;

  /// <summary>
  /// TPopupCalendarView is used to popup CalendarView from the CalendarPicker
  /// </summary>
  TPopupCalendarView = class(TCustomCalendarView)
  private
    procedure CMMouseActivate(var Message: TCMMouseActivate); message CM_MOUSEACTIVATE;
  strict protected
    function TabIsCyclic: Boolean; override;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  /// <summary>
  /// TCustomCalendarPicker is the base class for the CalendarPicker control.
  /// </summary>
  TCustomCalendarPicker = class(TCustomControl)
  private
    FCalendarView: TPopupCalendarView;
    FDate: TDate;
    FDateFormat: string;
    FDisplayMode: TDisplayMode;
    FDroppedDown: Boolean;
    FHot: Boolean;
    FIsEmpty: Boolean;
    FOnChange: TNotifyEvent;
    FOnCloseUp: TNotifyEvent;
    FPressed: Boolean;
    FTextHint: string;
    procedure CalendarViewChange(Sender: TObject);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DoOnChange;
    function GetBorderColor: TColor;
    function GetCalendarHeaderInfo: TCalendarHeaderInfo;
    function GetColor: TColor;
    function GetDate: TDate;
    function GetDisabledColor: TColor;
    function GetFirstDayOfWeek: TDaysOfWeek;
    function GetFirstYear: Integer;
    function GetHighlightColor: TColor;
    function GetHighlightToday: Boolean;
    function GetIsEmpty: Boolean;
    function GetLastYear: Integer;
    function GetMaxYear: Integer;
    function GetMinYear: Integer;
    function GetNumberOfWeeksInView: TItemsInRow;
    function GetOnCalendarChangeView: TChangeViewEvent;
    function GetOnCalendarDrawDayItem: TDrawViewInfoEvent;
    function GetOnCalendarDrawMonthItem: TDrawViewInfoEvent;
    function GetOnCalendarDrawYearItem: TDrawViewInfoEvent;
    function GetSelectionColor: TColor;
    function GetShowDayOfWeek: Boolean;
    function GetShowFirstOfGroupLabel: Boolean;
    function GetTodayColor: TColor;
    procedure SetBorderColor(const Value: TColor);
    procedure SetColor(const Value: TColor);
    procedure SetDate(const Value: TDate);
    procedure SetDateFormat(const Value: string);
    procedure SetDisabledColor(const Value: TColor);
    procedure SetDisplayMode(const Value: TDisplayMode);
    procedure SetFirstDayOfWeek(const Value: TDaysOfWeek);
    procedure SetFirstYear(const Value: Integer);
    procedure SetHighlightColor(const Value: TColor);
    procedure SetHighlightToday(const Value: Boolean);
    procedure SetIsEmpty(const Value: Boolean);
    procedure SetLastYear(const Value: Integer);
    procedure SetMaxYear(const Value: Integer);
    procedure SetMinYear(const Value: Integer);
    procedure SetNumberOfWeeksInView(const Value: TItemsInRow);
    procedure SetOnCalendarChangeView(const Value: TChangeViewEvent);
    procedure SetOnCalendarDrawDayItem(const Value: TDrawViewInfoEvent);
    procedure SetOnCalendarDrawMonthItem(const Value: TDrawViewInfoEvent);
    procedure SetOnCalendarDrawYearItem(const Value: TDrawViewInfoEvent);
    procedure SetSelectionColor(const Value: TColor);
    procedure SetShowDayOfWeek(const Value: Boolean);
    procedure SetShowFirstOfGroupLabel(const Value: Boolean);
    procedure SetTextHint(const Value: string);
    procedure SetTodayColor(const Value: TColor);
    function StoreDate: Boolean;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
  protected
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    /// <summary>Occurs when the users click on the item.</summary>
    procedure Click; override;
    /// <summary>Closes an opened CalendarView.</summary>
    procedure CloseUp(Accept: Boolean);
    /// <summary>Is called when some key is pressed.</summary>
    procedure CNKeyDown(var Message: TMessage); message CN_KEYDOWN;
    /// <summary>Is called when a mouse wheel is scrolled down.</summary>
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    /// <summary>Is called when a mouse wheel is scrolled up.</summary>
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    /// <summary>Opens the drop-down CalendarView</summary>
    procedure DropDown;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Paint; override;
    /// <summary>BorderColor property forwards the BorderColor property from the CalendarView.</summary>
    property BorderColor: TColor read GetBorderColor write SetBorderColor default clCalendarBorderColor;
    /// <summary>CalendarHeaderInfo property forwards the CalendarHeaderInfo property from the CalendarView.</summary>
    property CalendarHeaderInfo: TCalendarHeaderInfo read GetCalendarHeaderInfo;
    /// <summary>Color property forwards the Color property from the CalendarView.</summary>
    property Color: TColor read GetColor write SetColor default clBlack;
    /// <summary>Date property indicates currently selected date. Returns NullDate is no date is selected.</summary>
    property Date: TDate read GetDate write SetDate stored StoreDate;
    /// <summary>DateFormat property forwards the DateFormat property from the CalendarView.</summary>
    property DateFormat: string read FDateFormat write SetDateFormat;
    /// <summary>DisabledColor property forwards the DisabledColor property from the CalendarView.</summary>
    property DisabledColor: TColor read GetDisabledColor write SetDisabledColor default clBtnFace;
    /// <summary>DisplayMode property forwards the DisplayMode property from the CalendarView.</summary>
    property DisplayMode: TDisplayMode read FDisplayMode write SetDisplayMode default TDisplayMode.dmMonth;
    /// <summary>FirstDayOfWeek property forwards the FirstDayOfWeek property from the CalendarView.</summary>
    property FirstDayOfWeek: TDaysOfWeek read GetFirstDayOfWeek write SetFirstDayOfWeek default TDaysOfWeek.dwSunday;
    /// <summary>FirstYear property forwards the FirstYear property from the CalendarView.</summary>
    property FirstYear: Integer read GetFirstYear write SetFirstYear default 0;
    /// <summary>HighlightColor property forwards the HighlightColor property from the CalendarView.</summary>
    property HighlightColor: TColor read GetHighlightColor write SetHighlightColor default clCalendarHighlighColor;
    /// <summary>HighlightToday property forwards the HighlightToday property from the CalendarView.</summary>
    property HighlightToday: Boolean read GetHighlightToday write SetHighlightToday default True;
    /// <summary>IsEmpty property forwards the IsEmpty property from the CalendarView.</summary>
    property IsEmpty: Boolean read GetIsEmpty write SetIsEmpty default True;
    /// <summary>LastYear property forwards the LastYear property from the CalendarView.</summary>
    property LastYear: Integer read GetLastYear write SetLastYear default 0;
    /// <summary>MaxYear property forwards the MaxYear property from the CalendarView.</summary>
    property MaxYear: Integer read GetMaxYear write SetMaxYear default 0;
    /// <summary>MinYear property forwards the MinYear property from the CalendarView.</summary>
    property MinYear: Integer read GetMinYear write SetMinYear default 0;
    /// <summary>NumberOfWeeksInView property forwards the NumberOfWeeksInView property from the CalendarView.</summary>
    property NumberOfWeeksInView: TItemsInRow read GetNumberOfWeeksInView write SetNumberOfWeeksInView;
    /// <summary>SelectionColor property forwards the SelectionColor property from the CalendarView.</summary>
    property SelectionColor: TColor read GetSelectionColor write SetSelectionColor default clHighlight;
    /// <summary>ShowDayOfWeek property forwards the ShowDayOfWeek property from the CalendarView.</summary>
    property ShowDayOfWeek: Boolean read GetShowDayOfWeek write SetShowDayOfWeek default True;
    /// <summary>ShowFirstOfGroupLabel property forwards the ShowFirstOfGroupLabel property from the CalendarView.</summary>
    property ShowFirstOfGroupLabel: Boolean read GetShowFirstOfGroupLabel write SetShowFirstOfGroupLabel default False;
    property TabStop default True;
    /// <summary>TextHint is shown in DatePicker when no date is selected.</summary>
    property TextHint: string read FTextHint write SetTextHint;
    /// <summary>TodayColor property forwards the TodayColor property from the CalendarView.</summary>
    property TodayColor: TColor read GetTodayColor write SetTodayColor default clCalendarTodayColor;
    property Width default 140;
    /// <summary>Occurs to specify what happens when the display mode is changing.</summary>
    property OnCalendarChangeView: TChangeViewEvent read GetOnCalendarChangeView write SetOnCalendarChangeView;
    /// <summary>Occurs when the day item is drawn.</summary>
    property OnCalendarDrawDayItem: TDrawViewInfoEvent read GetOnCalendarDrawDayItem write SetOnCalendarDrawDayItem;
    /// <summary>Occurs when the month item is drawn.</summary>
    property OnCalendarDrawMonthItem: TDrawViewInfoEvent read GetOnCalendarDrawMonthItem write SetOnCalendarDrawMonthItem;
    /// <summary>Occurs when the year item is drawn.</summary>
    property OnCalendarDrawYearItem: TDrawViewInfoEvent read GetOnCalendarDrawYearItem write SetOnCalendarDrawYearItem;
    /// <summary>Occurs when users select or deselect certain date.</summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    /// <summary>Occurs when the drop-down CalendarView is closed.</summary>
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
  public
    constructor Create(Owner: TComponent); override;
  end;

  TCalendarPicker = class(TCustomCalendarPicker)
  public
    property DateFormat;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderColor;
    property CalendarHeaderInfo;
    property Color;
    property Cursor;
    property Date;
    property DisabledColor;
    property DisplayMode;
    property Enabled;
    property FirstDayOfWeek;
    property FirstYear;
    property Font;
    property HighlightColor;
    property HighlightToday;
    property IsEmpty;
    property LastYear;
    property MaxYear;
    property MinYear;
    property OnCalendarChangeView;
    property OnCalendarDrawDayItem;
    property OnCalendarDrawMonthItem;
    property OnCalendarDrawYearItem;
    property OnChange;
    property OnCloseUp;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property SelectionColor;
    property ShowDayOfWeek;
    property ShowFirstOfGroupLabel;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TextHint;
    property TodayColor;
    property Visible;
    property Width;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, System.Math, System.Types, Vcl.Consts;

const
  DaysCalendarColCount = 7;
  DaysCalendarRowCount = 6;
  MonthesCalendarMaxColCount = 4;
  MonthesCalendarMaxRowCount = 4;
  DecadesCalendarMaxColCount = 4;
  DecadesCalendarMaxRowCount = 4;
  DaysCalendarItemCount = DaysCalendarColCount * DaysCalendarRowCount;
  MonthesCalendarItemCount = MonthesCalendarMaxColCount * MonthesCalendarMaxRowCount;
  DecadesCalenderItemCount = DecadesCalendarMaxColCount * DecadesCalendarMaxRowCount;
  NullDate: TDate = -700000;
  CalendarPickerIconSize = 24;

type
  TViewInfoUtils = class
  public
    class function GetLocalBounds(const AItems: array of TCalendarViewInfoBase): TRect;
  end;

{$R WinXCalendars.res}

function StartOfWeek(const ADate: TDate; AFirstDayOfWeek: TDaysOfWeek): TDate;
var
  LDays: Integer;
begin
  LDays := Ord(AFirstDayOfWeek) - (DayOfWeek(ADate) - 1);
  if LDays > 0 then
    Dec(LDays, 7);
  Result := ADate + LDays;
end;

var
  CalendarType: CALTYPE;

function GetCalendarStr(Locale, CalType: Integer): string;
begin
  SetLength(Result, GetCalendarInfo(Locale, CalendarType, CalType, nil, 0, nil));
  if Length(Result) > 0 then
    SetLength(Result, GetCalendarInfo(Locale, CalendarType, CalType, PChar(Result), Length(Result), nil)-1);
end;

function GetDateFormatStr(Locale: Integer; aDate: TDate; aFormatString: string): string;
var
  SystemTime: TSystemTime;
begin
  with SystemTime do DecodeDate(aDate, wYear, wMonth, wDay);
  SetLength(Result, GetDateFormat(Locale, 0, @SystemTime, PChar(aFormatString), nil, 0));
  if Length(Result) > 0 then
    SetLength(Result, GetDateFormat(Locale, 0, @SystemTime, PChar(aFormatString), PChar(Result), Length(Result))-1);
end;

function GetShortDayName(Day: Integer): string;
begin
  // Day : 1:Sun .. 7:Sat
  // CAL_SABBREVDAYNAME1+0 : Mon  ... CAL_SABBREVDAYNAME1+6 : Sun
  Result := GetCalendarStr(LOCALE_USER_DEFAULT, CAL_SABBREVDAYNAME1 + ((Day+5) mod 7) );
end;

function GetShortMonthName(Month: Integer): string;
begin
  Result := GetCalendarStr(LOCALE_USER_DEFAULT, CAL_SABBREVMONTHNAME1 - 1 + Month);
end;

function GetShortYearMonth: string;
begin
  Result := GetCalendarStr(LOCALE_USER_DEFAULT, CAL_SYEARMONTH);
end;


type
  TSpecialFormatType = (tYearGroup, tYearCellText, tYearNumber, tYearlyViewHeader);
  TCalendarFormatTable = array[TSpecialFormatType] of string;

var
  CalFormatJapan,
//  CalFormatTaiwan,
  CalFormatKorea: TCalendarFormatTable;

procedure InitCalendarFormatTable;
//ResourceString
const
  CalFormatJapanYearGroup = 'e'#$5E74;
  CalFormatJapanYearCellText = 'e';
  CalFormatJapanYearNumber = 'eeee';
  CalFormatJapanYearlyViewHeader = 'gg e'#$5E74;
  CalFormatKoreaYearGroup = 'eeee'#$B144;
  CalFormatKoreaYearCellText = 'eeee';
  CalFormatKoreaYearNumber = 'eeee';
  CalFormatKoreaYearlyViewHeader = 'gg eeee'#$B144;
begin
  CalFormatJapan[tYearGroup] := CalFormatJapanYearGroup;
  CalFormatJapan[tYearCellText] := CalFormatJapanYearCellText;
  CalFormatJapan[tYearNumber] := CalFormatJapanYearNumber;
  CalFormatJapan[tYearlyViewHeader] := CalFormatJapanYearlyViewHeader;
  CalFormatKorea[tYearGroup] := CalFormatKoreaYearGroup;
  CalFormatKorea[tYearCellText] := CalFormatKoreaYearCellText;
  CalFormatKorea[tYearNumber] := CalFormatKoreaYearNumber;
  CalFormatKorea[tYearlyViewHeader] := CalFormatKoreaYearlyViewHeader;
end;

function GetSpecialFormat(aFormatType: TSpecialFormatType): string;
begin
  Result := '';
  case CalendarType of
    CAL_JAPAN: Result := CalFormatJapan[aFormatType];
  //CAL_TAIWAN: Result := CalFormatTaiwan[aFormatType];
    CAL_KOREA: Result := CalFormatKorea[aFormatType];
  else
    Result := 'yyyy';
  end;
end;

{ TBaseCalendarAnimation }

constructor TBaseCalendarAnimation.Create;
begin
  inherited Create;
end;

destructor TBaseCalendarAnimation.Destroy;
begin
  FreeAndNil(FTimer);
  inherited;
end;

procedure TBaseCalendarAnimation.Finish;
begin
  if (IsStarted) then
  begin
    Animate(Duration);
    FreeAndNil(FTimer);
    FIsStarted := False;
    if Assigned(OnFinished) then
      OnFinished(Self);
  end;
end;

procedure TBaseCalendarAnimation.SetDuration(const Value: Cardinal);
begin
  FDuration := Value;
end;

procedure TBaseCalendarAnimation.SetInterval(const Value: Cardinal);
begin
  FInterval := Value;
end;

procedure TBaseCalendarAnimation.Start(ADuration: Cardinal; AInterval: Cardinal);
begin
  Duration := ADuration;
  Interval := AInterval;
  StartDefault;
end;

procedure TBaseCalendarAnimation.StartDefault;
begin
  FWhenStarted := GetTickCount;
  DoPrepare;

  FreeAndNil(FTimer);
  FTimer := TTimer.Create(Application);
  FTimer.OnTimer := TimerTick;
  FTimer.Interval := Interval;
  FTimer.Enabled := True;

  FIsStarted := True;
  TimerTick(FTimer);

  if Assigned(OnStarted) then
    OnStarted(Self);
end;

procedure TBaseCalendarAnimation.TimerTick(Sender: TObject);
var
  LCurrent: Cardinal;
begin
  LCurrent := GetTickCount - WhenStarted;
  if (LCurrent + Interval >= Duration) then
    Finish
  else
    Animate(LCurrent);
end;

{ TSlideCalendarAnimation }

constructor TSlideCalendarAnimation.Create;
begin
  inherited;
  FAnimateBitmap := TBitmap.Create;
end;

destructor TSlideCalendarAnimation.Destroy;
begin
  FAnimateBitmap.Free;
  inherited;
end;

procedure TSlideCalendarAnimation.Animate(ACurrent: Cardinal);
var
  LPosition: Integer;
  LSourceRect: TRect;
begin
  if (FAnimateBitmap = nil) or (FDestination = nil) then
    Exit;

  LPosition := Min(FWholeMovement, Round(ACurrent * FCoeff));

  LSourceRect := DestinationRect;
  LSourceRect.Offset(-LSourceRect.Left, -LSourceRect.Top);

  case Direction of
    TSlideDirection.sdUp:
      LSourceRect.Offset(0, LPosition);
    TSlideDirection.sdDown:
      LSourceRect.Offset(0, FWholeMovement - LPosition);
  end;

  Destination.CopyRect(DestinationRect, AnimateBitmap.Canvas, LSourceRect);
end;

procedure TSlideCalendarAnimation.DoPrepare;
begin
  Assert(FAnimateBitmap <> nil);
  Assert(FDestination <> nil);

  FWholeMovement := Max(0, FAnimateBitmap.Height - FDestinationRect.Height);
  FCoeff := FWholeMovement / Duration;
end;

procedure TSlideCalendarAnimation.SetAnimateBitmap(const Value: TBitmap);
begin
  FAnimateBitmap.Assign(Value);
end;

{ TZoomCalendarAnimation }

constructor TZoomCalendarAnimation.Create;
begin
  inherited;
  FNewImage := TBitmap.Create;
  FPrevImage := TBitmap.Create;
end;

destructor TZoomCalendarAnimation.Destroy;
begin
  FreeAndNil(FNewImage);
  FreeAndNil(FPrevImage);
  inherited;
end;

procedure TZoomCalendarAnimation.Animate(ACurrent: Cardinal);
const
  cHideAlpha = 80;
  cShowAlpha = 150;
var
  LBlendFunction: BLENDFUNCTION;
  LOffset: TPoint;
  LBackBitmap: TBitmap;
  LDestRect: TRect;
  LDestHeightOffset: Integer;
  LNewImageRect: TRect;
  LImageSizeRect: TRect;
  LDestWidthOffset: Integer;
  LSourceHeightOffset: Integer;
  LSourceWidthOffset: Integer;
begin
  if Destination = nil then
    Exit;

  LBackBitmap := TBitmap.Create;
  try
    LOffset := DestinationRect.TopLeft;

    // prepare background
    LDestRect := DestinationRect;
    LDestRect.Offset(-LOffset.X, -LOffset.Y);
    LBackBitmap.SetSize(LDestRect.Width, LDestRect.Height);
    LBackBitmap.Canvas.Brush.Color := BackColor;
    LBackBitmap.Canvas.FillRect(LDestRect);

    LBlendFunction.BlendOp := AC_SRC_OVER;
    LBlendFunction.BlendFlags := 0;
    LBlendFunction.AlphaFormat := 0;

    LDestWidthOffset := Round((DestinationRect.Width / Duration) * ACurrent);
    LDestHeightOffset := Round((DestinationRect.Height / Duration) * ACurrent);

    LSourceWidthOffset := Round((SourceRect.Width / Duration) * ACurrent);
    LSourceHeightOffset := Round((SourceRect.Height / Duration) * ACurrent);

    case ZoomMode of
      TZoomMode.zmOut:
        begin
          if NewImage.Width <> 0 then
          begin
            LBlendFunction.SourceConstantAlpha := Trunc((cShowAlpha / Duration) * ACurrent);

            LNewImageRect := DestinationRect;
            LNewImageRect.Offset(-LOffset.X, -LOffset.Y);
            LNewImageRect.Inflate(-(LNewImageRect.Width - LDestWidthOffset) div 2,
              -(LNewImageRect.Height - LDestHeightOffset) div 2);

            LImageSizeRect := TRect.Create(0, 0, NewImage.Width, NewImage.Height);

            AlphaBlend(LBackBitmap.Canvas.Handle, LNewImageRect.Left, LNewImageRect.Top, LNewImageRect.Width,
              LNewImageRect.Height, NewImage.Canvas.Handle, LImageSizeRect.Left, LImageSizeRect.Top,
              LImageSizeRect.Width, LImageSizeRect.Height, LBlendFunction);
          end;

          if PrevImage.Width <> 0 then
          begin
            LBlendFunction.SourceConstantAlpha := cHideAlpha - Trunc((cHideAlpha / Duration) * ACurrent);

            LNewImageRect := SourceRect;
            LNewImageRect.Offset(-LOffset.X, -LOffset.Y);
            LNewImageRect.Inflate(LSourceWidthOffset div 2, LSourceHeightOffset div 2);

            LImageSizeRect := TRect.Create(0, 0, PrevImage.Width, PrevImage.Height);

            AlphaBlend(LBackBitmap.Canvas.Handle, LNewImageRect.Left, LNewImageRect.Top, LNewImageRect.Width,
              LNewImageRect.Height, PrevImage.Canvas.Handle, LImageSizeRect.Left, LImageSizeRect.Top,
              LImageSizeRect.Width, LImageSizeRect.Height, LBlendFunction);
          end;
        end;
      TZoomMode.zmIn:
        begin
          if PrevImage.Width <> 0 then
          begin
            LBlendFunction.SourceConstantAlpha := cHideAlpha - Trunc((cHideAlpha / Duration) * ACurrent);

            LNewImageRect := SourceRect;
            LNewImageRect.Offset(-LOffset.X, -LOffset.Y);
            LNewImageRect.Inflate(-LSourceWidthOffset div 2, -LSourceHeightOffset div 2);

            LImageSizeRect := TRect.Create(0, 0, PrevImage.Width, PrevImage.Height);

            AlphaBlend(LBackBitmap.Canvas.Handle, LNewImageRect.Left, LNewImageRect.Top, LNewImageRect.Width,
              LNewImageRect.Height, PrevImage.Canvas.Handle, LImageSizeRect.Left, LImageSizeRect.Top,
              LImageSizeRect.Width, LImageSizeRect.Height, LBlendFunction);
          end;

          if NewImage.Width <> 0 then
          begin
            LBlendFunction.SourceConstantAlpha := Trunc((cShowAlpha / Duration) * ACurrent);

            LNewImageRect := DestinationRect;
            LNewImageRect.Offset(-LOffset.X, -LOffset.Y);
            LNewImageRect.Inflate((LNewImageRect.Width - LDestWidthOffset) div 2,
              (LNewImageRect.Height - LDestHeightOffset) div 2);

            LImageSizeRect := TRect.Create(0, 0, NewImage.Width, NewImage.Height);

            AlphaBlend(LBackBitmap.Canvas.Handle, LNewImageRect.Left, LNewImageRect.Top, LNewImageRect.Width,
              LNewImageRect.Height, NewImage.Canvas.Handle, LImageSizeRect.Left, LImageSizeRect.Top,
              LImageSizeRect.Width, LImageSizeRect.Height, LBlendFunction);
          end;
        end;
    end;

    Destination.CopyRect(DestinationRect, LBackBitmap.Canvas, LDestRect);

  finally
    LBackBitmap.Free;
  end;
end;

procedure TZoomCalendarAnimation.DoPrepare;
begin
  Assert(FDestination <> nil);
end;

procedure TZoomCalendarAnimation.SetNewImage(const Value: TBitmap);
begin
  FNewImage.Assign(Value);
end;

procedure TZoomCalendarAnimation.SetPrevImage(const Value: TBitmap);
begin
  FPrevImage.Assign(Value);
end;

{ TCustomCalendarView }

constructor TCustomCalendarView.Create(Owner: TComponent);

  procedure InitializaFont(const AFont: TFont; const Size: Integer);
  begin
    AFont.Name := 'Segoe UI'; // do not localize
    AFont.Size := Size;
  end;

begin
  inherited;

  FNumberOfWeeksInView := 6;

  Height := 337;
  Width := 294;
  TabStop := True;
  FHighlightToday := True;
  FSelectionMode := TSelectionMode.smSingle;
  FShowDayOfWeek := True;
  FShowFirstOfGroupLabel := False;

  DoubleBuffered := True;

  ControlStyle := ControlStyle - [csCaptureMouse];
  FController := TCalendarViewController.Create(Self);

  FHeaderInfo := TCalendarHeaderInfo.Create(Self);

  FSelectedDates := TList<TDate>.Create;

  FFirstDayOfWeek := TDaysOfWeek.dwSunday;
  if csDesigning in ComponentState then
    AddToSelectedDates(System.SysUtils.Date);
  SetDisplayDate(System.SysUtils.Date);

  Color := clWhite;
  SelectionColor := clHighlight;
  DisabledColor := clBtnFace;
  HighlightColor := clCalendarHighlighColor;
  BorderColor := clCalendarBorderColor;
  FocusedColor := clGray;
  TodayColor := clCalendarTodayColor;

  Font.Color := clWindowText;
  InitializaFont(Font, 15);
  InitializaFont(HeaderInfo.Font, 15);
  InitializaFont(HeaderInfo.DaysOfWeekFont, 10);

  FDisplayMode := TDisplayMode.dmMonth;
  BorderStyle := bsSingle;
  FLastFocusedItemIndex := 3;
end;

destructor TCustomCalendarView.Destroy;
begin
  FreeAndNil(FViewInfo);
  FreeAndNil(FDrawer);
  FreeAndNil(FHeaderInfo);
  FreeAndNil(FSelectedDates);
  inherited;
end;

procedure TCustomCalendarView.AddToSelectedDates(const Values: array of TDate);
var
  Value: TDate;
begin
  BeginUpdate;
  try
    for Value in Values do
      AddToSelectedDates(Value);
    LayoutChanged;
  finally
    EndUpdate;
  end;
end;

procedure TCustomCalendarView.AddToSelectedDates(const Value: TDate);
var
  LNewDate: TDate;
begin
  if Value = NullDate then
    Exit;

  LNewDate := Trunc(LimitDate(Value));

  case SelectionMode of
    TSelectionMode.smSingle:
      begin
        if Date <> LNewDate then
        begin
          Date := LNewDate;
        end;
      end;
    TSelectionMode.smMultiple:
      if not IsDateSelected(LNewDate) then
      begin
        FSelectedDates.Add(LNewDate);
        Changed;
      end;
  end;
end;

procedure TCustomCalendarView.AnimationFinished(Sender: TObject);
begin
  Invalidate;
end;

procedure TCustomCalendarView.BeginUpdate;
begin
  Inc(FChangeCounter);
end;

function TCustomCalendarView.CanSetDisplayDate(const Date: TDate): Boolean;
begin
  Result := ((FirstYear = 0) or (YearOf(Date) >= FirstYear)) and ((LastYear = 0) or (YearOf(Date) <= LastYear));
end;

procedure TCustomCalendarView.Changed;
begin
  if FChangeCounter > 0 then
    FWasChanged := True
  else
  begin
    FWasChanged := False;
    DoOnChange;
    Invalidate;
  end;
end;

procedure TCustomCalendarView.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  FHeaderInfo.Font.Height := MulDiv(FHeaderInfo.Font.Height, M, D);
  FHeaderInfo.DaysOfWeekFont.Height := MulDiv(FHeaderInfo.DaysOfWeekFont.Height, M, D);
  FBorderSize := MulDiv(FBorderSize, M, D);

  NeedCurrentViewInfo.Calculate(ClientRect.Size, NeedDrawer);
end;

procedure TCustomCalendarView.ClearFocusedItems;
var
  ViewInfo: TCalendarViewInfoBase;
begin
  ViewInfo := GetFocusedItem;
  if Assigned(ViewInfo) then
    ViewInfo.Focused := False;
  Invalidate;
end;

procedure TCustomCalendarView.ClickOnDate(const ADate: TDate);
begin
  case SelectionMode of
    TSelectionMode.smSingle:
      begin
        if IsDateSelected(ADate) then
          RemoveFromSelectedDates(ADate)
        else
        begin
          if SelectionCount > 0 then
            FSelectedDates.Clear;
          AddToSelectedDates(ADate);
        end;
      end;
    TSelectionMode.smMultiple:
      begin
        if IsDateSelected(ADate) then
          RemoveFromSelectedDates(ADate)
        else
          AddToSelectedDates(ADate);
      end;
  end;

  InvalidateRect(Handle, NeedCurrentViewInfo.CellsInfo.GlobalRect, False);
end;

procedure TCustomCalendarView.CMFocusChanged(var Message: TCMFocusChanged);
var
  LViewInfo: TCalendarViewInfoBase;
begin
  if Message.Sender = Self then
  begin
    LViewInfo := GetFocusedItem;
    if Assigned(LViewInfo) then
    begin
      FLastFocusedItemIndex := LViewInfo.TabOrder;
      LViewInfo.Focused := True;
      if LViewInfo is TCalendarCellItemsViewInfo then
        SetCellsFocused;
    end;
    Invalidate;
  end
  else
    ClearFocusedItems;
  inherited;
end;

procedure TCustomCalendarView.CMMouseLeave(var Message: TMessage);
begin
  SetCurrentHoverItem(nil);
  inherited;
end;

procedure TCustomCalendarView.CMStyleChanged(var Message: TMessage);
begin
  FreeAndNil(FDrawer);
end;

procedure TCustomCalendarView.CNKeyDown(var Message: TWMKeyDown);
var
  LCell: TCellItemViewInfo;
  LViewInfo: TCalendarViewInfoBase;
begin
  if FViewInfo = nil then
  begin
    inherited;
    Exit;
  end;

  case Message.CharCode of
    VK_PRIOR:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdPageUp, FController);
    VK_NEXT:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdPageDown, FController);
    VK_UP:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdUp, FController);
    VK_DOWN:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdDown, FController);
    VK_LEFT:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdLeft, FController);
    VK_RIGHT:
      if FViewInfo.CellsInfo.TabOrder = FLastFocusedItemIndex then
        FViewInfo.FocusCell(TFocusDirection.fdRight, FController);
    VK_SPACE, VK_RETURN:
      begin
        LViewInfo := GetFocusedItem;
          if Assigned(LViewInfo) then
            if LViewInfo.TabOrder = FLastFocusedItemIndex then
              if (FViewInfo.CellsInfo <> LViewInfo) then
                LViewInfo.Click(FController, False)
              else
              begin
                LCell := FViewInfo.CellsInfo.FocusedCellInfo;
                if LCell <> nil then
                  LCell.Click(FController, False);
              end;
      end;
    VK_TAB:
      if not SetFocusedViewInfo(GetKeyState(VK_SHIFT) >= 0) then
        inherited;
  end;
end;

function TCustomCalendarView.CreateDrawer: TCalendarViewDrawer;
begin
  if TStyleManager.IsCustomStyleActive then
    Result := TCalendarViewDrawerStyled.Create(Self)
  else
    Result := TCalendarViewDrawerNative.Create(Self);
end;

function TCustomCalendarView.CreateViewInfo(ADisplayMode: TDisplayMode): TCalendarViewViewInfoBase;
begin
  Result := nil;

  case DisplayMode of
    TDisplayMode.dmMonth:
      Result := TCalendarViewMonthlyViewInfo.Create(FHeaderInfo, FController, NeedDrawer);
    TDisplayMode.dmYear:
      Result := TCalendarViewYearlyViewInfo.Create(FHeaderInfo, FController, NeedDrawer);
    TDisplayMode.dmDecade:
      Result := TCalendarViewDecadeViewInfo.Create(FHeaderInfo, FController, NeedDrawer);
  else
    Assert(False, 'ViewInfo not created');
  end;
end;

function TCustomCalendarView.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := True;
  NeedCurrentViewInfo.Navigate(True);
end;

function TCustomCalendarView.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := True;
  NeedCurrentViewInfo.Navigate(False);
end;

procedure TCustomCalendarView.DoOnChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TCustomCalendarView.DoOnChangeView(OldMode: TDisplayMode; NewMode: TDisplayMode);
begin
  if Assigned(FOnChangeView) then
    FOnChangeView(Self, OldMode, NewMode);
end;

function TCustomCalendarView.DoStoreDate: Boolean;
begin
  Result := SelectionMode = TSelectionMode.smSingle;
end;

procedure TCustomCalendarView.EndUpdate;
begin
  Dec(FChangeCounter);
  if (FChangeCounter = 0) then
  begin
    if FWasChanged then
    begin
      FWasChanged := False;
      DoOnChange;
    end;
  end;
end;

function TCustomCalendarView.GetDate: TDate;
begin
  if SelectionMode = TSelectionMode.smNone then
    Result := NeedCurrentViewInfo.FocusedDate
  else if (FSelectedDates.Count > 0) then
    Result := FSelectedDates[FSelectedDates.Count - 1]
  else
    Result := NullDate;
end;

function TCustomCalendarView.GetFocusedItem: TCalendarViewInfoBase;

  function LocateNextItem(const AItem: TCalendarViewInfoBase): TCalendarViewInfoBase;
  var
    i: Integer;
  begin
    if AItem.TabOrder = FLastFocusedItemIndex then
      Exit(AItem);
    for i := 0 to AItem.Children.Count - 1 do
    begin
      Result := LocateNextItem(AItem.Children[i]);
      if Assigned(Result) then
        Exit;
    end;
    Result := nil;
  end;

begin
  Result := LocateNextItem(NeedCurrentViewInfo);
end;

function TCustomCalendarView.GetSelectedDates(const Index: Integer): TDate;
begin
  Result := FSelectedDates[Index];
end;

function TCustomCalendarView.GetSelectionCount: Integer;
begin
  Result := FSelectedDates.Count;
end;

function TCustomCalendarView.GetShowDayOfWeek: Boolean;
begin
  Result := FShowDayOfWeek;
end;

procedure TCustomCalendarView.HoverItemDestroyed(Sender: TObject);
begin
  FLastHoverItem := nil;
end;

function TCustomCalendarView.IsDateSelected(Date: TDate): Boolean;
begin
  Result := (FSelectedDates.IndexOf(Date) >= 0);
end;

procedure TCustomCalendarView.LayoutChanged;
begin
  if csDestroying in ComponentState then
    Exit;
  RecalculateViewInfo;
  Invalidate;
end;

function TCustomCalendarView.LimitDate(const ADate: TDate): TDate;
begin
  Result := ADate;

  if (MinYear <> 0) and (YearOf(Result) < MinYear) then
    Result := EncodeDate(MinYear, 1, 1);

  if (MaxYear <> 0) and (YearOf(Result) > MaxYear) then
    Result := EncodeDate(MaxYear + 1, 1, 1) - 1;
end;

function TCustomCalendarView.NeedCurrentViewInfo: TCalendarViewViewInfoBase;
begin
  if (FViewInfo <> nil) then
    Exit(FViewInfo);

  FViewInfo := CreateViewInfo(DisplayMode);
  Result := FViewInfo;
end;

function TCustomCalendarView.NeedDrawer: TCalendarViewDrawer;
begin
  if (FDrawer = nil) then
    FDrawer := CreateDrawer;
  Result := FDrawer;
end;

procedure TCustomCalendarView.Paint;
var
  LViewInfo: TCalendarViewViewInfoBase;
begin
  LViewInfo := NeedCurrentViewInfo;
  LViewInfo.DrawDefaultBuffered(Canvas, NeedDrawer, FController);
end;

procedure TCustomCalendarView.RecalculateViewInfo;
begin
  if HandleAllocated and not ClientRect.IsEmpty then
  begin
    FLastHoverItem := nil; // can be destroyed;
    NeedCurrentViewInfo.Calculate(ClientRect.Size, NeedDrawer);
  end;
end;

procedure TCustomCalendarView.RedrawItem(AItem: TCalendarViewInfoBase);
begin
  if (AItem = nil) then
    Exit;

  AItem.DrawDefaultBuffered(Canvas, NeedDrawer, FController);
end;

function TCustomCalendarView.RemoveFromSelectedDates(const Value: TDate): Boolean;
begin
  Result := True;
  case SelectionMode of
    TSelectionMode.smSingle:
      Date := NullDate;
    TSelectionMode.smMultiple:
      begin
        Result := FSelectedDates.Remove(Trunc(Value)) >= 0;
        Changed;
      end;
  end;
end;

procedure TCustomCalendarView.SetBorderColor(const Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    LayoutChanged;
  end;
end;

procedure TCustomCalendarView.SetBorderStyle(const Value: TBorderStyle);
begin
  if FBorderStyle = Value then
    Exit;
  FBorderStyle := Value;
  if FBorderStyle = bsSingle then
    FBorderSize := MulDiv(1, FCurrentPPI, Screen.PixelsPerInch)
  else
    FBorderSize := 0;
  LayoutChanged;
end;

procedure TCustomCalendarView.SetCellsFocused;
var
  CellItemsViewInfo: TCalendarCellItemsViewInfo;
  LFocusedDate: TDate;
begin
  CellItemsViewInfo := GetFocusedItem as TCalendarCellItemsViewInfo;
  LFocusedDate := FViewInfo.FocusedDate;
  if LFocusedDate = 0 then
    LFocusedDate := FViewInfo.ActualDate;
  CellItemsViewInfo.FocusedDate := LFocusedDate;
  CellItemsViewInfo.DisplayFocused := Focused;
end;

procedure TCustomCalendarView.SetCurrentHoverItem(const ANewItem: TCalendarViewInfoBase);
begin
  if (FLastHoverItem <> ANewItem) then
  begin
    if (FLastHoverItem <> nil) then
    begin
      FLastHoverItem.Highlighted := False;
      RedrawItem(FLastHoverItem);
      FLastHoverItem.OnDestroy := nil;
    end;
    FLastHoverItem := ANewItem;
    if (FLastHoverItem <> nil) then
    begin
      FLastHoverItem.Highlighted := True;
      FLastHoverItem.OnDestroy := HoverItemDestroyed;
      RedrawItem(FLastHoverItem);
    end;
  end;
end;

procedure TCustomCalendarView.SetDate(const Value: TDate);
var
  LNewDate: TDate;
begin
  if (Value = NullDate) or (Value = 0) then
  begin
    if (FSelectedDates.Count > 0) then
    begin
      FSelectedDates.Clear;
      Changed;
    end;
  end
  else
  begin
    LNewDate := LimitDate(Value);
    if (FSelectedDates.Count <> 1) or (Date <> LNewDate) then
    begin
      FSelectedDates.Clear;
      FSelectedDates.Add(Trunc(LNewDate));
      Changed;
    end;
  end;

  if (Date <> NullDate) and (Date <> 0) and (FViewInfo <> nil) then
    FViewInfo.ActualDate := Date;

  LayoutChanged;
end;

procedure TCustomCalendarView.SetDisabledColor(const Value: TColor);
begin
  if FDisabledColor <> Value then
  begin
    FDisabledColor := Value;
    LayoutChanged;
  end;
end;

procedure TCustomCalendarView.SetDisplayDate(const ADate: TDate);
begin
  if not CanSetDisplayDate(ADate) then
    Exit;

  NeedCurrentViewInfo.ActualDate := ADate;
  LayoutChanged;
end;

procedure TCustomCalendarView.SetDisplayMode(const Value: TDisplayMode);
var
  LSourceRect, LDestRect: TRect;
  LPrevBitmap: TBitmap;
  LNewBitmap: TBitmap;
  LPrevValue: TDisplayMode;
  LStartDate: TDate;
  LSize: TSize;
  LActualDate: TDate;
  LDisplayFocused: Boolean;
  LViewInfo: TCalendarViewInfoBase;
begin
  if FDisplayMode = Value then
    Exit;

  LPrevValue := FDisplayMode;

  if (FViewInfo <> nil) then
  begin
    LPrevBitmap := nil;
    LNewBitmap := nil;
    try
      LPrevBitmap := TBitmap.Create;
      LNewBitmap := TBitmap.Create;

      LStartDate := FViewInfo.StartDate;
      LActualDate := FViewInfo.ActualDate;
      LSourceRect := FViewInfo.Body.GlobalRect;
      LDisplayFocused := FViewInfo.CellsInfo.DisplayFocused;
      LSize := FViewInfo.Body.Size;
      LPrevBitmap.SetSize(LSize.cx, LSize.cy);
      FViewInfo.CellsInfo.InAnimationState := True;
      try
        FViewInfo.Body.Draw(Point(0, 0), LPrevBitmap.Canvas, NeedDrawer, FController);
      finally
        FViewInfo.CellsInfo.InAnimationState := False;
      end;

      FreeAndNil(FViewInfo);
      FDisplayMode := Value;
      FViewInfo := CreateViewInfo(Value);

      FViewInfo.StartDate := LStartDate;
      FViewInfo.ActualDate := LActualDate;
      FViewInfo.CellsInfo.DisplayFocused := LDisplayFocused;
      LViewInfo := GetFocusedItem;
      if Assigned(LViewInfo) then
      begin
        FLastFocusedItemIndex := LViewInfo.TabOrder;
        LViewInfo.Focused := True;
      end;

      FViewInfo.Calculate(ClientRect.Size, NeedDrawer);
      LSize := FViewInfo.CellsInfo.Size;
      LNewBitmap.SetSize(LSize.cx, LSize.cy);

      FViewInfo.CellsInfo.InAnimationState := True;
      try
        FViewInfo.Body.Draw(Point(0, 0), LNewBitmap.Canvas, NeedDrawer, FController);
      finally
        FViewInfo.CellsInfo.InAnimationState := False;
      end;

      LDestRect := FViewInfo.Body.GlobalRect;
      FController.AnimateViewChange(LPrevBitmap, LNewBitmap, LSourceRect, LDestRect, LPrevValue > Value);

    finally
      LPrevBitmap.Free;
      LNewBitmap.Free;
    end;
  end;

  DoOnChangeView(LPrevValue, Value);
end;

procedure TCustomCalendarView.SetFirstDayOfWeek(const Value: TDaysOfWeek);
begin
  if Ord(Value) > (DaysCalendarColCount - 1) then
    FFirstDayOfWeek := TDaysOfWeek(Ord(Value) mod DaysCalendarColCount)
  else
    FFirstDayOfWeek := Value;
  if FViewInfo <> nil then
    if Date <> NullDate then
      FViewInfo.ActualDate := Date
    else
      FViewInfo.ActualDate := System.SysUtils.Date;
  LayoutChanged;
end;

procedure TCustomCalendarView.SetFirstYear(const Value: Integer);
begin
  FFirstYear := Value;
end;

procedure TCustomCalendarView.SetFocusedColor(const Value: TColor);
begin
  if FFocusedColor <> Value then
  begin
    FFocusedColor := Value;
    LayoutChanged;
  end;
end;

function TCustomCalendarView.SetFocusedViewInfo(AForward: Boolean): Boolean;
var
  Cycled: Boolean;
  CellItemsViewInfo: TCalendarViewInfoBase;
begin
  Result := False;
  CellItemsViewInfo := GetFocusedItem;
  if Assigned(CellItemsViewInfo) then
  begin
    CellItemsViewInfo.Focused := False;
    if CellItemsViewInfo is TCalendarCellItemsViewInfo then
      (CellItemsViewInfo as TCalendarCellItemsViewInfo).DisplayFocused := False;
  end;
  Inc(FLastFocusedItemIndex, ifthen(AForward, 1, -1));

  Cycled := False;
  if FLastFocusedItemIndex < 0 then
  begin
    FLastFocusedItemIndex := 3;
    Cycled := True;
  end
  else if FLastFocusedItemIndex > 3 then
  begin
    FLastFocusedItemIndex := 0;
    Cycled := True;
  end;

  CellItemsViewInfo := GetFocusedItem;
  if Assigned(CellItemsViewInfo) then
  begin
    CellItemsViewInfo.Focused := True;
    if TabIsCyclic or not Cycled then
      Result := True;
    if Result and (CellItemsViewInfo is TCalendarCellItemsViewInfo) then
      SetCellsFocused;
  end;
  Invalidate;
end;

procedure TCustomCalendarView.SetHighlightColor(const Value: TColor);
begin
  if FHighlightColor <> Value then
  begin
    FHighlightColor := Value;
    LayoutChanged;
  end;
end;

procedure TCustomCalendarView.SetHighlightToday(const Value: Boolean);
begin
  if HighlightToday = Value then
    Exit;
  FHighlightToday := Value;
  Invalidate;
end;

procedure TCustomCalendarView.SetLastYear(const Value: Integer);
begin
  FLastYear := Value;
end;

procedure TCustomCalendarView.SetMaxYear(const Value: Integer);
begin
  FMaxYear := Value;
end;

procedure TCustomCalendarView.SetMinYear(const Value: Integer);
begin
  FMinYear := Value;
end;

procedure TCustomCalendarView.SetNumberOfWeeksInView(const Value: TItemsInRow);
begin
  if FNumberOfWeeksInView = Value then
    Exit;
  FNumberOfWeeksInView := Value;
  LayoutChanged;
end;

procedure TCustomCalendarView.SetSelectionColor(const Value: TColor);
begin
  if FSelectionColor <> Value then
  begin
    FSelectionColor := Value;
    LayoutChanged;
  end;
end;

procedure TCustomCalendarView.SetSelectionMode(const Value: TSelectionMode);
begin
  FSelectionMode := Value;
end;

procedure TCustomCalendarView.SetShowDayOfWeek(const Value: Boolean);
var
  LStartDate: TDate;
  LActualDate: TDate;
  CellItemsViewInfo: TCalendarViewViewInfoBase;
begin
  if FShowDayOfWeek = Value then
    Exit;
  LStartDate := FViewInfo.StartDate;
  LActualDate := FViewInfo.ActualDate;

  FreeAndNil(FViewInfo);

  FShowDayOfWeek := Value;
  CellItemsViewInfo := NeedCurrentViewInfo;
  CellItemsViewInfo.StartDate := LStartDate;
  CellItemsViewInfo.ActualDate := LActualDate;
  NeedCurrentViewInfo.Calculate(ClientRect.Size, NeedDrawer);

  Invalidate;
end;

procedure TCustomCalendarView.SetShowFirstOfGroupLabel(const Value: Boolean);
begin
  FShowFirstOfGroupLabel := Value;
  Invalidate;
end;

procedure TCustomCalendarView.SetTodayColor(const Value: TColor);
begin
  if FTodayColor <> Value then
  begin
    FTodayColor := Value;
    LayoutChanged;
  end;
end;

function TCustomCalendarView.TabIsCyclic: Boolean;
begin
  Result := False;
end;

procedure TCustomCalendarView.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Brush.Color := Color;
  inherited;
end;

procedure TCustomCalendarView.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := Message.Result or DLGC_WANTARROWS;
end;

procedure TCustomCalendarView.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if CanFocus and TabStop then
    SetFocus;
  inherited;
end;

procedure TCustomCalendarView.WMLButtonUp(var Message: TWMLButtonUp);
var
  i, LSign: Integer;
  LRemoveSelection: Boolean;
  LItem: TCalendarViewInfoBase;
begin
  if FViewInfo <> nil then
    LItem := NeedCurrentViewInfo.FindAtPoint(Point(Message.XPos, Message.YPos))
  else
    LItem := nil;

  SetCurrentHoverItem(nil);

  if (DisplayMode = TDisplayMode.dmMonth) and (SelectionMode = TSelectionMode.smMultiple) and (GetKeyState(VK_SHIFT) < 0) and
    (FViewInfo.FocusedDate <> NullDate) and (FViewInfo.FocusedDate <> 0) then
  begin
    LSign := IfThen(FViewInfo.FocusedDate > TCellItemViewInfo(LItem).Date, -1, 1);
    LRemoveSelection := True;
    for i := 0 to Abs(DaysBetween(FViewInfo.FocusedDate, TCellItemViewInfo(LItem).Date)) do
    begin
      LRemoveSelection := LRemoveSelection and IsDateSelected(IncDay(FViewInfo.FocusedDate, i * LSign));
      if not LRemoveSelection then
        Break;
    end;
    for i := 0 to Abs(DaysBetween(FViewInfo.FocusedDate, TCellItemViewInfo(LItem).Date)) do
      if LRemoveSelection then
        RemoveFromSelectedDates(IncDay(FViewInfo.FocusedDate, i * LSign))
      else
        AddToSelectedDates(IncDay(FViewInfo.FocusedDate, i * LSign));
  end
  else if (LItem <> nil) then
  begin
    RedrawItem(LItem);
    LItem.Click(FController, True);
    ClearFocusedItems;
  end;

  inherited;
end;

procedure TCustomCalendarView.WMMouseMove(var Message: TWMMouseMove);
var
  LMouseOver: TCalendarViewInfoBase;
begin
  LMouseOver := NeedCurrentViewInfo.FindAtPoint(Point(Message.XPos, Message.YPos));
  SetCurrentHoverItem(LMouseOver);
  inherited;
end;

procedure TCustomCalendarView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  LayoutChanged;
  inherited;
end;

{ TCalendarHeaderInfo }

constructor TCalendarHeaderInfo.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FCalendarView := TCustomCalendarView(Owner);
  FDrawer := FCalendarView.NeedDrawer;

  FHighlightFontColor := clHighlight;
  FFontColor := clBlack;

  FFont := TFont.Create;
  FFont.OnChange := ObjectChanged;

  FDaysOfWeekFont := TFont.Create;
  FDaysOfWeekFont.OnChange := ObjectChanged;

  Include(FComponentStyle, csSubComponent);
  Name := 'HeaderInfo'; // do not localize
end;

destructor TCalendarHeaderInfo.Destroy;
begin
  FreeAndNil(FDaysOfWeekFont);
  FreeAndNil(FFont);
  inherited;
end;

procedure TCalendarHeaderInfo.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TCalendarHeaderInfo.DoOnDrawDayOfWeek(DrawParams: TDrawParams; DayNumber: Integer; var Text: string);
begin
  if Assigned(FOnDrawDayOfWeek) then
    FOnDrawDayOfWeek(Self, DrawParams, DayNumber, Text);
end;

procedure TCalendarHeaderInfo.DoOnDrawHeader(DrawParams: TDrawParams; var Text: string);
begin
  if Assigned(FOnDrawHeader) then
    FOnDrawHeader(Self, DrawParams, Text);
end;

procedure TCalendarHeaderInfo.DoOnDrawNavigationButton(DrawParams: TDrawParams;
  Orientation: TDateNavigatorButtonOrientation);
begin
  if Assigned(FOnDrawNavigationButton) then
    FOnDrawNavigationButton(Self, DrawParams, Orientation);
end;

procedure TCalendarHeaderInfo.ObjectChanged(Senter: TObject);
begin
  Changed;
end;

procedure TCalendarHeaderInfo.SetDaysOfWeekFont(const Value: TFont);
begin
  FDaysOfWeekFont.Assign(Value);
  FCalendarView.Invalidate;
end;

procedure TCalendarHeaderInfo.SetFont(const Value: TFont);
begin
  Font.Assign(Value);
  FCalendarView.Invalidate;
end;

procedure TCalendarHeaderInfo.SetFontColor(const Value: TColor);
begin
  if (Value = FFontColor) then
    Exit;

  FFontColor := Value;
  Changed;
end;

procedure TCalendarHeaderInfo.SetHighlightFontColor(const Value: TColor);
begin
  FHighlightFontColor := Value;
  Changed;
end;

procedure TCalendarHeaderInfo.SetOnDrawDayOfWeek(const Value: TDrawDayOfWeekEvent);
begin
  FOnDrawDayOfWeek := Value;
  Changed;
end;

procedure TCalendarHeaderInfo.SetOnDrawHeader(const Value: TDrawEvent);
begin
  FOnDrawHeader := Value;
  Changed;
end;

procedure TCalendarHeaderInfo.SetOnDrawNavigationButton(const Value: TDrawNavigationEvent);
begin
  FOnDrawNavigationButton := Value;
  Changed;
end;

{ TCellDayInfo }

function TCellDayInfo.CellText: string;
begin
  Result := FormatDateTime('d', Date);//do not localize
end;

procedure TCellDayInfo.Click(const AController: ICalendarViewController; ByMouse: Boolean);
begin
  if (Parent is TCalendarCellItemsViewInfo) then
  begin
    TCalendarCellItemsViewInfo(Parent).FocusedDate := Date;
    TCalendarCellItemsViewInfo(Parent).DisplayFocused := not ByMouse;
    AController.ClearFocusedItems;
    TCalendarCellItemsViewInfo(Parent).Focused := True;
    AController.LastFocusedItem := TCalendarCellItemsViewInfo(Parent).TabOrder;
  end;

  AController.ClickOnDate(Date);
end;

procedure TCellDayInfo.DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController);
begin
  if Assigned(AController.OnDrawDayItem) then
    AController.OnDrawDayItem(AController.Owner, ADrawParams, Self);
end;

function TCellDayInfo.GroupText: string;
begin
  Result := GetShortMonthName(MonthOfTheYear(Date));
end;

function TCellDayInfo.ItemIsCurrent: Boolean;
begin
  Result := Date = System.SysUtils.Date;
end;

{ TCellItemViewInfo }

constructor TCellItemViewInfo.Create(const ACell: TPoint; const ADate: TDate);
begin
  inherited Create;
  FCell := ACell;
  FDate := ADate;
end;

procedure TCellItemViewInfo.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LDrawParams: TDrawViewInfoParams;
  LDrawRect: TRect;
begin
  LDrawRect := SizeRect;
  LDrawRect.Offset(APosition);

  LDrawParams := TDrawViewInfoParams.Create(LDrawRect);
  try
    PrepareDrawParams(LDrawParams, AController);
    LDrawParams.Canvas := ACanvas;

    ADrawer.PrepareCellStyleParams(LDrawParams, Self, AController.Enabled);

    DoDrawItem(LDrawParams, AController);
    if not LDrawParams.Handled then
      ADrawer.DrawCalendarItem(LDrawParams, ACanvas, Self);
  finally
    FreeAndNil(LDrawParams);
  end;
end;

procedure TCellItemViewInfo.PrepareDrawParams(ADrawParams: TDrawViewInfoParams; AController:
    ICalendarViewController);
var
  LViewInfoProperties: TViewInfoProperties;
  LCellsInfo: TCalendarCellItemsViewInfo;
begin
  LViewInfoProperties := ADrawParams.ViewInfoProperties;

  if (Parent is TCalendarCellItemsViewInfo) then
  begin
    LCellsInfo := TCalendarCellItemsViewInfo(Parent);

    if ItemIsCurrent then
      Include(LViewInfoProperties, vpToday);
    if Highlighted then
      Include(LViewInfoProperties, vpHighlighted);

    if (LCellsInfo.DisplayMode = TDisplayMode.dmMonth) and AController.IsDateSelected(Date) then
      Include(LViewInfoProperties, vpSelected);

    if AController.HighlightToday then
      Include(LViewInfoProperties, vpHighlightToday);

    if (not LCellsInfo.InAnimationState and (LCellsInfo.FocusedDate = Date) and LCellsInfo.DisplayFocused) then
      Include(LViewInfoProperties, vpFocused);

    if (LCellsInfo.InAnimationState or (LCellsInfo.ItemIsInCurrentRange(Date))) then
      Include(LViewInfoProperties, vpCurrent);
    if (LCellsInfo.ItemIsFirstOfGroup(Date)) then
      Include(LViewInfoProperties, vpFirstOfGroup);
  end;

  ADrawParams.ViewInfoProperties := LViewInfoProperties;

  ADrawParams.FocusRectWidth := MulDiv(2, AController.CurrentPPI, Screen.PixelsPerInch);
  ADrawParams.BorderWidth := MulDiv(1, AController.CurrentPPI, Screen.PixelsPerInch);
  ADrawParams.Text := CellText;
  ADrawParams.GroupText := GroupText;

end;

{ TCellMonthInfo }

function TCellMonthInfo.CellText: string;
begin
  Result := GetShortMonthName(MonthOf(Date));
end;

procedure TCellMonthInfo.Click(const AController: ICalendarViewController; ByMouse: Boolean);
var
  LDate: TDate;
begin
  if not AController.CanSetDisplayDate(Date) then
    Exit;

  if (Parent is TCalendarCellItemsViewInfo) then
    TCalendarCellItemsViewInfo(Parent).FocusedCell := Cell;

  LDate := Date;
  if AController.DisplayMode > TDisplayMode.dmMonth then
    AController.DisplayMode := Pred(AController.DisplayMode);

  AController.SetDisplayDate(LDate);
end;

procedure TCellMonthInfo.DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController);
begin
  if Assigned(AController.OnDrawMonthItem) then
    AController.OnDrawMonthItem(AController.Owner, ADrawParams, Self);
end;

function TCellMonthInfo.GroupText: string;
begin
  Result := FormatDateTime(GetSpecialFormat(tYearGroup), Date);
end;

function TCellMonthInfo.ItemIsCurrent: Boolean;
begin
  Result := StartOfTheMonth(Date) = StartOfTheMonth(System.SysUtils.Date);
end;

{ TCustomCalendarHeaderItem }

constructor TCustomCalendarHeaderItem.Create(const CalendarHeader: TCalendarHeaderInfo);
begin
  inherited Create;
  FHeaderInfo := CalendarHeader;
end;

{ TCalendarHeaderText }

procedure TCalendarHeaderText.Calculate(ACanvas: TCanvas; const ASize: TSize);
var
  LTextHeight: Integer;
  LTextWidth: Integer;
  LFontHeight: Integer;
begin
  ACanvas.Font := HeaderInfo.Font;
  LFontHeight := ACanvas.TextHeight('Iq');
  LTextHeight := Min(ASize.cy, LFontHeight);
  LTextWidth := Min(ASize.cx, ACanvas.TextWidth(Text));
  Size := TSize.Create(LTextWidth + 2, LTextHeight);
end;

procedure TCalendarHeaderText.Click(const AController: ICalendarViewController; ByMouse: Boolean);
begin
  inherited;
  if AController.DisplayMode < TDisplayMode.dmDecade then
    AController.DisplayMode := Succ(AController.DisplayMode);
end;

procedure TCalendarHeaderText.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LText: string;
  LDrawRect: TRect;
  LDrawParams: TDrawParams;
begin
  LDrawRect := TRect.Create(APosition, Width, Height);
  LDrawParams := TDrawParams.Create(LDrawRect);
  try
    LText := Text;
    ADrawer.PrepareHeaderTextParams(LDrawParams, Self, Highlighted, AController.Enabled);
    HeaderInfo.DoOnDrawHeader(LDrawParams, LText);
    if LDrawParams.Handled then
      Exit;
    ADrawer.DrawHeaderText(LDrawParams, ACanvas, LText);
  finally
    FreeAndNil(LDrawParams);
  end;
end;

function TCalendarHeaderText.GetTabOrder: Integer;
begin
  Result := 0;
end;

{ TCalendarHeaderNavigatorButton }

procedure TCalendarHeaderNavigatorButton.Calculate(AHeight: Integer);
begin
  Size := TSize.Create(AHeight, AHeight);
end;

procedure TCalendarHeaderNavigatorButton.Click(const AController: ICalendarViewController; ByMouse:
    Boolean);
begin
  inherited;
  AController.Navigate(Orientation = TDateNavigatorButtonOrientation.nboNext);
end;

constructor TCalendarHeaderNavigatorButton.Create(const CalendarHeader:
    TCalendarHeaderInfo; const ATabOrder: Integer);
begin
  inherited Create(CalendarHeader);
  FTabOrder := ATabOrder;
end;

procedure TCalendarHeaderNavigatorButton.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LDrawRect: TRect;
  LDrawParams: TDrawParams;
begin
  inherited;

  LDrawRect := TRect.Create(APosition, Width, Height);
  LDrawRect.Inflate(-1, -1);
  LDrawParams := TDrawParams.Create(LDrawRect);
  try
    ADrawer.PrepareNavigatorButtonsParams(LDrawParams, Self, AController.Enabled);
    HeaderInfo.DoOnDrawNavigationButton(LDrawParams, Orientation);
    if LDrawParams.Handled then
      Exit;
    ADrawer.DrawNavigatorButtons(LDrawParams, ACanvas, Orientation, MulDiv(2, AController.CurrentPPI, Screen.PixelsPerInch));
  finally
    FreeAndNil(LDrawParams);
  end;
end;

function TCalendarHeaderNavigatorButton.GetTabOrder: Integer;
begin
  Result := FTabOrder;
end;

{ TCalendarDaysOfWeekViewInfo }

procedure TCalendarDaysOfWeekViewInfo.Calculate(const ASize: TSize);
begin
  Size := ASize;
end;

procedure TCalendarDaysOfWeekViewInfo.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  i: Integer;
  LRectWidth: Double;
  LText: string;
  LDrawRect: TRect;
  LDrawParams: TDrawParams;
  LColor: TColor;
begin
  LRectWidth := Width / DaysCalendarColCount;
  LDrawRect := SizeRect;
  LDrawRect.Offset(APosition);

  ACanvas.Brush.Style := bsSolid;
  ADrawer.PrepareCalendarBackground(LColor, AController.Enabled);
  ACanvas.Brush.Color := LColor;
  ACanvas.FillRect(LDrawRect);

  for i := 0 to DaysCalendarColCount - 1 do
  begin
    LDrawRect := Rect(Round(i * LRectWidth), 0, Round(i * LRectWidth + LRectWidth), Height);
    LDrawRect.Offset(APosition);
    LDrawRect.Inflate(-1, -1);
    LDrawParams := TDrawParams.Create(LDrawRect);
    try
      ADrawer.PrepareDaysOfWeekParams(LDrawParams, AController.Enabled);
      LText := GetShortDayName((i + Ord(AController.FirstDayOfWeek)) mod DaysCalendarColCount + 1);
      HeaderInfo.DoOnDrawDayOfWeek(LDrawParams, i, LText);
      if LDrawParams.Handled then
        Continue;
      ADrawer.DrawDayOfWeek(LDrawParams, ACanvas, LText);
    finally
      FreeAndNil(LDrawParams)
    end;
  end;
end;

{ TCellYearInfo }

function TCellYearInfo.CellText: string;
begin
  Result := FormatDateTime(GetSpecialFormat(tYearCellText), Date);
end;

procedure TCellYearInfo.Click(const AController: ICalendarViewController; ByMouse: Boolean);
begin
  if not AController.CanSetDisplayDate(Date) then
    Exit;

  if (Parent is TCalendarCellItemsViewInfo) then
    TCalendarCellItemsViewInfo(Parent).FocusedCell := Cell;

  AController.SetDisplayDate(Date);
  if AController.DisplayMode > TDisplayMode.dmMonth then
    AController.DisplayMode := Pred(AController.DisplayMode);
end;

procedure TCellYearInfo.DoDrawItem(ADrawParams: TDrawViewInfoParams; AController: ICalendarViewController);
begin
  if Assigned(AController.OnDrawYearItem) then
    AController.OnDrawYearItem(AController.Owner, ADrawParams, Self);
end;

function TCellYearInfo.GroupText: string;
begin
  case CalendarType of
    CAL_JAPAN,
  //CAL_TAIWAN,
    CAL_KOREA: Result := GetDateFormatStr(LOCALE_USER_DEFAULT, Date, 'g');
  else
    Result := ''; // For non-ERA calendar system, Avoiding 'A.D'
  end;
end;

function TCellYearInfo.ItemIsCurrent: Boolean;
begin
  Result := YearOf(Date) = YearOf(System.SysUtils.Date)
end;

{ TDrawParams }

constructor TDrawParams.Create(const DrawRect: TRect);
begin
  inherited Create;
  FDrawRect := DrawRect;
  FHandled := False;
  FFont := TFont.Create;
end;

destructor TDrawParams.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TDrawParams.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

{ TCalendarViewDrawer }

constructor TCalendarViewDrawer.Create(const ACalendarView: TCustomCalendarView);
begin
  inherited Create;
  FCalendarView := ACalendarView;
end;

procedure TCalendarViewDrawer.DrawCalendarItem(ADrawParams: TDrawViewInfoParams; ACanvas: TCanvas;
  AViewInfo: TCellItemViewInfo);
const
  GroupHeaderRectPercent = 0.4;
  GroupHeaderFontPercent = 0.5;
var
  LDrawRect: TRect;
  LDrawGroupRect: TRect;
  LCaption: string;
  LTextAttr: TTextFormat;
begin
  ACanvas.Brush.Color := ADrawParams.BkColor;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := ADrawParams.BorderWidth;
  ACanvas.Pen.Color := ADrawParams.BorderColor;

  LDrawRect := ADrawParams.DrawRect;
  LDrawGroupRect := LDrawRect.SplitRect(srTop, GroupHeaderRectPercent);
  ACanvas.Rectangle(LDrawRect);

  LDrawRect.Inflate(-ADrawParams.BorderWidth, -ADrawParams.BorderWidth);

  if AViewInfo.Highlighted or (vpSelected in ADrawParams.ViewInfoProperties) or
    (vpFocused in ADrawParams.ViewInfoProperties) then
  begin
    ACanvas.Pen.Color := ADrawParams.SelectionColor;
    ACanvas.Pen.Width := ADrawParams.FocusRectWidth;
    ACanvas.Pen.Style := psInsideFrame;

    if AViewInfo.Highlighted or (vpSelected in ADrawParams.ViewInfoProperties) then
    begin
      ACanvas.Rectangle(LDrawRect);
    end;

    if vpFocused in ADrawParams.ViewInfoProperties then
    begin
      ACanvas.Brush.Color := ADrawParams.FocusedColor;
      ACanvas.Brush.Style := bsSolid;
      DrawFocusRect(ACanvas, LDrawRect, ADrawParams.FocusRectWidth, 1, 1);
      ACanvas.Brush.Color := ADrawParams.BkColor;
    end;

    if (ADrawParams.ViewInfoProperties >= [vpHighlightToday, vpSelected, vpToday]) then
    begin
      LDrawRect.Inflate(-ADrawParams.FocusRectWidth, -ADrawParams.FocusRectWidth);
      ACanvas.Pen.Color := ADrawParams.ForegroundColor;
      ACanvas.Rectangle(LDrawRect);
    end;
  end;

  if (vpFirstOfGroup in ADrawParams.ViewInfoProperties) and FCalendarView.ShowFirstOfGroupLabel then
  begin
    LCaption := ADrawParams.GroupText;
    ACanvas.Font.Assign(ADrawParams.Font);
    ACanvas.Font.Size := Round(ACanvas.Font.Size * GroupHeaderFontPercent);
    ACanvas.Font.Color := ADrawParams.ForegroundColor;
    ACanvas.Brush.Style := bsClear;
    LTextAttr := [tfCenter, tfBottom, tfSingleLine];
    ACanvas.TextRect(LDrawGroupRect, LCaption, LTextAttr);
  end;

  LCaption := ADrawParams.Text;
  LTextAttr := [tfCenter, tfVerticalCenter, tfSingleLine];
  ACanvas.Font.Assign(ADrawParams.Font);
  ACanvas.Brush.Style := bsClear;
  ACanvas.Font.Color := ADrawParams.ForegroundColor;
  if FCalendarView.UseRightToLeftAlignment then
    LTextAttr := LTextAttr + [tfRight, tfRtlReading] - [tfLeft];
  ACanvas.TextRect(LDrawRect, LCaption, LTextAttr);
end;

procedure TCalendarViewDrawer.DrawDayOfWeek(ADrawParams: TDrawParams; ACanvas: TCanvas; const AText: string);
var
  DrawRect: TRect;
  Text: string;
  LTextAttr: TTextFormat;
begin
  DrawRect := ADrawParams.DrawRect;
  Text := AText;
  ACanvas.Font.Assign(ADrawParams.Font);
  ACanvas.Font.Color := ADrawParams.ForegroundColor;
  ACanvas.Brush.Color := ADrawParams.BkColor;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ADrawParams.DrawRect);
  LTextAttr := [tfCenter, tfBottom, tfSingleLine];
  if FCalendarView.UseRightToLeftAlignment then
    LTextAttr := LTextAttr + [tfRight, tfRtlReading] - [tfLeft];
  ACanvas.TextRect(DrawRect, Text, LTextAttr);
end;

procedure TCalendarViewDrawer.DrawFocusRect(ACanvas: TCanvas; const ARect: TRect; AWith: Integer; ALength: Integer;
  ASkipLength: Integer);
type
  TDrawState = record
    IsSkip: Boolean;
    ToDraw: Integer;
  end;

  procedure DrawLine(var ADrawn: TDrawState; const AStart: TPoint; const AEnd: TPoint; const ARectOffset: TPoint);
  var
    LCurrent: TPoint;
    LDrawRect: TRect;
    LNext: TPoint;
    LNeedToDraw: Integer;
    LOffset: TPoint;
  begin
    LOffset := Point(Sign(AEnd.X - AStart.X), Sign(AEnd.Y - AStart.Y));

    LCurrent := AStart;

    while True do
    begin
      if ADrawn.ToDraw = 0 then
      begin
        if ADrawn.IsSkip then
        begin
          ADrawn.ToDraw := ALength;
          ADrawn.IsSkip := False;
        end
        else
        begin
          ADrawn.ToDraw := ASkipLength;
          ADrawn.IsSkip := True;
        end;
      end;

      LNeedToDraw := (Abs(LCurrent.X - AEnd.X) + Abs(LCurrent.Y - AEnd.Y)) div AWith;
      if LNeedToDraw = 0 then
        Exit;

      LNeedToDraw := Min(ADrawn.ToDraw, LNeedToDraw);
      ADrawn.ToDraw := ADrawn.ToDraw - LNeedToDraw;

      LNext := LCurrent;
      LNext.Offset(LOffset.X * LNeedToDraw * AWith, LOffset.Y * LNeedToDraw * AWith);

      if not ADrawn.IsSkip then
      begin
        LDrawRect := TRect.Create(Point(Min(LCurrent.X, LNext.X), Min(LCurrent.Y, LNext.Y)),
          Max(AWith, Abs(LCurrent.X - LNext.X)), Max(AWith, Abs(LCurrent.Y - LNext.Y)));

        LDrawRect.Offset(ARectOffset);
        ACanvas.FillRect(LDrawRect);
      end;

      LCurrent := LNext;
    end;
  end;

var
  ADrawn: TDrawState;
begin
  ADrawn.IsSkip := True;
  ADrawn.ToDraw := 0;

  DrawLine(ADrawn, ARect.TopLeft, Point(ARect.Right, ARect.Top), Point(0, 0));
  DrawLine(ADrawn, Point(ARect.Right, ARect.Top + AWith), ARect.BottomRight, Point(-AWith, 0));
  DrawLine(ADrawn, Point(ARect.Right - AWith, ARect.Bottom), Point(ARect.Left, ARect.Bottom), Point(0, -AWith));
  DrawLine(ADrawn, Point(ARect.Left, ARect.Bottom - AWith), Point(ARect.Left, ARect.Top + AWith), Point(0, 0));
end;

procedure TCalendarViewDrawer.DrawHeaderRect(ADrawParams: TDrawParams; Canvas: TCanvas);
begin
  Canvas.Brush.Color := ADrawParams.BkColor;
  Canvas.FillRect(ADrawParams.DrawRect);
end;

procedure TCalendarViewDrawer.DrawHeaderText(ADrawParams: TDrawParams; ACanvas:
    TCanvas; AText: string);
var
  LDrawRect: TRect;
  LText: string;
  LTextAttr: TTextFormat;
begin
  ACanvas.Brush.Color := ADrawParams.BkColor;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Font.Assign(ADrawParams.Font);
  ACanvas.Font.Color := ADrawParams.ForegroundColor;

  LText := AText;
  LDrawRect := ADrawParams.DrawRect;
  ACanvas.FillRect(LDrawRect);
  LDrawRect.Inflate(-1, -1);
  if FCalendarView.UseRightToLeftAlignment then
    LTextAttr := LTextAttr + [tfRight, tfRtlReading] - [tfLeft];
  ACanvas.TextRect(LDrawRect, LText, [tfVerticalCenter, tfSingleLine, tfBottom]);
  if ADrawParams.Focused then
  begin
    ACanvas.Brush.Color := ADrawParams.ForegroundColor;
    DrawFocusRect(ACanvas, LDrawRect, MulDiv(2, FCalendarView.GetParentCurrentDpi, Screen.PixelsPerInch), 1, 1);
  end;
end;

procedure TCalendarViewDrawer.DrawNavigatorButtons(ADrawParams: TDrawParams; ACanvas: TCanvas;
    AOrientation: TDateNavigatorButtonOrientation; AArrowWidth: Integer);
var
  LPoints: array [0 .. 2] of TPoint;
  LDrawRect: TRect;
  LTriangleHeight: Integer;
  LTriangleWidth: Integer;
  LTriangleBotton: Integer;
  LTriangleTop: Integer;
begin
  LDrawRect := ADrawParams.DrawRect;
  LTriangleHeight := LDrawRect.Height div 2;
  LTriangleWidth := LTriangleHeight * 2;
  LTriangleBotton := (LDrawRect.Height - LTriangleHeight) div 2 + LDrawRect.Top + LTriangleHeight;
  LTriangleTop := (LDrawRect.Height - LTriangleHeight) div 2 + LDrawRect.Top;

  ACanvas.Pen.Width := AArrowWidth;
  ACanvas.Pen.Color := ADrawParams.ForegroundColor;
  ACanvas.Brush.Color := ADrawParams.BkColor;
  case AOrientation of
    TDateNavigatorButtonOrientation.nboPrev:
      begin
        LPoints[0] := Point(LDrawRect.Left, LTriangleBotton);
        LPoints[1] := Point(LDrawRect.Left + LTriangleHeight, (LDrawRect.Height - LTriangleHeight) div 2 +
          LDrawRect.Top);
        LPoints[2] := Point(LDrawRect.Left + LTriangleWidth, LTriangleBotton);
      end;
    TDateNavigatorButtonOrientation.nboNext:
      begin
        LPoints[0] := Point(LDrawRect.Left, LTriangleTop);
        LPoints[1] := Point(LDrawRect.Left + LTriangleHeight, (LDrawRect.Height - LTriangleHeight) div 2 + LDrawRect.Top
          + LTriangleHeight);
        LPoints[2] := Point(LDrawRect.Left + LTriangleWidth, LTriangleTop);
      end;
  end;
  ACanvas.Polyline(LPoints);
  if ADrawParams.Focused then begin
    ACanvas.Brush.Color := ADrawParams.ForegroundColor;
    DrawFocusRect(ACanvas, LDrawRect, MulDiv(2, FCalendarView.GetParentCurrentDpi, Screen.PixelsPerInch), 1, 1);
  end;
end;

function TCalendarViewDrawer.MiddleColor(AColor1, AColor2: TColor; Coeff : Double = 0.5): TColor;
  function Approx(C1, C2 : Integer) : Integer;
  begin
    Result := C1 + Round((C2 - C1) * Coeff);
  end;
begin
  AColor1 := ColorToRGB(AColor1);
  AColor2 := ColorToRGB(AColor2);

  Result := RGB(Approx(GetRValue(AColor1), GetRValue(AColor2)),
    Approx(GetGValue(AColor1), GetGValue(AColor2)),
    Approx(GetBValue(AColor1), GetBValue(AColor2)));
end;

procedure TCalendarViewDrawer.PrepareCalendarBackground(var AColor: TColor; AEnabled: Boolean);
begin
  AColor := FCalendarView.Color;
  if not AEnabled then
    AColor := MiddleColor(AColor, clBtnFace);
end;

procedure TCalendarViewDrawer.PrepareCalendarPickerParams(ADrawParams: TDrawParams;
    ACalendarPicker: TCustomCalendarPicker; AHot, APressed, AEnabled: Boolean);
begin
  ADrawParams.Font.Assign(ACalendarPicker.Font);
  if AHot then
    ADrawParams.BkColor := clBtnHighlight
  else
    ADrawParams.BkColor := ACalendarPicker.Color;
  if APressed then
    ADrawParams.ForegroundColor := clBtnHighlight
  else if AHot then
    ADrawParams.ForegroundColor := clBtnShadow
  else
    ADrawParams.ForegroundColor := ACalendarPicker.BorderColor;
end;

procedure TCalendarViewDrawer.PrepareCellStyleParams(ADrawParams: TDrawViewInfoParams; AViewInfo:
    TCellItemViewInfo; AEnabled: Boolean);
begin
  ADrawParams.Font.Assign(FCalendarView.Font);
  ADrawParams.ForegroundColor := FCalendarView.Font.Color;
  ADrawParams.FocusedColor := FCalendarView.FocusedColor;

  if FCalendarView.HighlightToday and (vpToday in ADrawParams.ViewInfoProperties) then
  begin
    ADrawParams.BkColor := FCalendarView.TodayColor;
    ADrawParams.ForegroundColor := clHighlightText;
    ADrawParams.FocusedColor := FCalendarView.Color;
  end
  else
  begin
    if vpCurrent in ADrawParams.ViewInfoProperties then
      ADrawParams.BkColor := FCalendarView.Color
    else
      ADrawParams.BkColor := FCalendarView.DisabledColor;
  end;

  ADrawParams.BorderColor := FCalendarView.BorderColor;
  if AViewInfo.Highlighted and (vpSelected in ADrawParams.ViewInfoProperties) then
    ADrawParams.SelectionColor := MiddleColor(FCalendarView.SelectionColor, FCalendarView.HighlightColor)
  else if AViewInfo.Highlighted then
    ADrawParams.SelectionColor := FCalendarView.HighlightColor
  else if (vpSelected in ADrawParams.ViewInfoProperties) then
  begin
    ADrawParams.FocusedColor := FCalendarView.Color;
    ADrawParams.SelectionColor := FCalendarView.SelectionColor
  end;
end;

procedure TCalendarViewDrawer.PrepareDaysOfWeekParams(ADrawParams: TDrawParams; AEnabled: Boolean);
begin
  ADrawParams.Font.Assign(FCalendarView.HeaderInfo.DaysOfWeekFont);
  ADrawParams.BkColor := FCalendarView.Color;
  ADrawParams.ForegroundColor := FCalendarView.HeaderInfo.FontColor;
end;

procedure TCalendarViewDrawer.PrepareHeaderParams(ADrawParams: TDrawParams; AHeader:
    TCalendarHeaderInfo; AEnabled: Boolean);
begin
  ADrawParams.BkColor := FCalendarView.Color;
end;

procedure TCalendarViewDrawer.PrepareHeaderTextParams(ADrawParams: TDrawParams; AHeader:
    TCalendarHeaderText; AHighlited: Boolean; AEnabled: Boolean);
begin
  ADrawParams.BkColor := FCalendarView.Color;
  ADrawParams.Font.Assign(FCalendarView.HeaderInfo.Font);
  ADrawParams.Focused := (AHeader.TabOrder > -1) and AHeader.Focused;
  if AHeader.Highlighted then
    ADrawParams.ForegroundColor := FCalendarView.HeaderInfo.HighlightFontColor
  else
    ADrawParams.ForegroundColor := FCalendarView.HeaderInfo.FontColor;
end;

procedure TCalendarViewDrawer.PrepareNavigatorButtonsParams(ADrawParams: TDrawParams; AButton:
    TCalendarHeaderNavigatorButton; AEnabled: Boolean);
begin
  ADrawParams.BkColor := FCalendarView.Color;
  ADrawParams.Focused := (AButton.TabOrder > -1) and AButton.Focused;
  if AButton.Highlighted then
    ADrawParams.ForegroundColor := FCalendarView.HeaderInfo.HighlightFontColor
  else
    ADrawParams.ForegroundColor := FCalendarView.HeaderInfo.FontColor;
end;

procedure TCalendarViewDrawerStyled.DrawCalendarPicker(ADrawParams: TDrawParams; ACanvas: TCanvas;
    ACalendarPicker: TCustomCalendarPicker; ABorderSize, AIconSize: Integer);
var
  LDrawParams: TDrawParams;
  TextRect, ButtonRect: TRect;
  TextAttr: TTextFormat;
  Text: string;
begin
  ACanvas.Brush.Color := ADrawParams.BkColor;
  ACanvas.Pen.Width := ABorderSize;
  ACanvas.Pen.Style := psInsideFrame;
  ACanvas.Pen.Color := ADrawParams.ForegroundColor;
  ACanvas.Rectangle(0, 0, ADrawParams.DrawRect.Width, ADrawParams.DrawRect.Height);

  if ACalendarPicker.IsEmpty then
    Text := ACalendarPicker.TextHint
  else
    Text := FormatDateTime(ACalendarPicker.DateFormat, ACalendarPicker.Date);

  TextAttr := [tfCenter, tfVerticalCenter, tfSingleLine];
  if FCalendarView.UseRightToLeftAlignment then
    TextAttr := TextAttr + [tfRight, tfRtlReading] - [tfLeft];
  TextRect := Rect(ABorderSize, ABorderSize, ADrawParams.DrawRect.Width - AIconSize - ABorderSize * 2,
    ADrawParams.DrawRect.Height - ABorderSize * 2);
  ACanvas.Font.Assign(ADrawParams.Font);
  ACanvas.TextRect(TextRect, Text, TextAttr);

  ButtonRect := ADrawParams.DrawRect;
  ButtonRect.Inflate(-ABorderSize * 2, 0);
  ButtonRect.Inflate(-ButtonRect.Height div 4, -ButtonRect.Height div 4);
  ButtonRect := TRect.Create(ButtonRect.Right - ButtonRect.Height, ButtonRect.Top, ButtonRect.Right, ButtonRect.Bottom);

  LDrawParams := TDrawParams.Create(ButtonRect);
  try
    LDrawParams.ForegroundColor := GetArrowColor(ACalendarPicker.Enabled);
    DrawNavigatorButtons(LDrawParams, ACanvas, TDateNavigatorButtonOrientation.nboNext, MulDiv(2, ACalendarPicker.GetParentCurrentDpi, Screen.PixelsPerInch));
  finally
    FreeAndNil(LDrawParams);
  end;
end;

function TCalendarViewDrawerStyled.GetActiveArrowColor(AEnabled: Boolean): TColor;
begin
  Result := GetTextColor(AEnabled);
end;

function TCalendarViewDrawerStyled.GetActiveBorderColor: TColor;
begin
  Result := StyleServices.GetSystemColor(clHighLight);
end;

function TCalendarViewDrawerStyled.GetArrowColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetBackgroundColor(AEnabled), GetTextColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetBackgroundColor(AEnabled: Boolean): TColor;
begin
  Result := StyleServices.GetStyleColor(scEdit);
  if not AEnabled then
    Result := MiddleColor(Result, StyleServices.GetSystemColor(clBtnFace));
end;

function TCalendarViewDrawerStyled.GetBorderColor: TColor;
begin
  Result := StyleServices.GetStyleColor(scBorder);
end;

function TCalendarViewDrawerStyled.GetFocusFrameColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetBackgroundColor(AEnabled), GetHotFrameColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetHeaderActiveTextColor(AEnabled: Boolean): TColor;
begin
  Result := GetSelectionColor(AEnabled);
end;

function TCalendarViewDrawerStyled.GetHeaderTextColor(AEnabled: Boolean): TColor;
begin
  Result := GetTextColor(AEnabled);
end;

function TCalendarViewDrawerStyled.GetHotFrameColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetBackgroundColor(AEnabled), GetTextColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetInActiveCellBGColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(StyleServices.GetSystemColor(clBtnFace), GetBackgroundColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetInActiveCellTextColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetInActiveCellBGColor(AEnabled), GetTextColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetLineColor: TColor;
begin
  StyleServices.GetElementColor(StyleServices.GetElementDetails(tgCellNormal), ecBorderColor, Result);
end;

function TCalendarViewDrawerStyled.GetSelectionColor(AEnabled: Boolean): TColor;
begin
  Result := StyleServices.GetSystemColor(clHighLight);
  if not AEnabled then
    Result := MiddleColor(Result, GetBackgroundColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetSelectionColorText(AEnabled: Boolean): TColor;
begin
  Result := StyleServices.GetSystemColor(clHighLightText);
  if not AEnabled then
    Result := MiddleColor(Result, GetSelectionColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetSelectionFrameColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetBackgroundColor(AEnabled), GetTextColor(AEnabled));
end;

function TCalendarViewDrawerStyled.GetTextColor(AEnabled: Boolean): TColor;
begin
  if AEnabled then
    Result := StyleServices.GetStyleFontColor(sfEditBoxTextNormal)
  else
    Result := StyleServices.GetStyleFontColor(sfEditBoxTextDisabled);
end;

function TCalendarViewDrawerStyled.GetWeekDayColor(AEnabled: Boolean): TColor;
begin
  Result := MiddleColor(GetBackgroundColor(AEnabled), GetTextColor(AEnabled));
end;

{ TCalendarViewDrawerStyled }

procedure TCalendarViewDrawerStyled.PrepareCalendarBackground(var AColor: TColor; AEnabled:
    Boolean);
begin
  inherited;
  if seClient in FCalendarView.StyleElements then
    AColor := GetBackgroundColor(AEnabled);
end;

procedure TCalendarViewDrawerStyled.PrepareCalendarPickerParams(ADrawParams: TDrawParams;
  ACalendarPicker: TCustomCalendarPicker; AHot, APressed, AEnabled: Boolean);
var
  LColor: TColor;
begin
  inherited;

  if seClient in ACalendarPicker.StyleElements then
  begin
    ADrawParams.BkColor := GetBackgroundColor(AEnabled);
  end;

  if seBorder in ACalendarPicker.StyleElements then
  begin
    if AHot then
      LColor := GetActiveBorderColor
    else
      LColor := MiddleColor(GetActiveBorderColor, ADrawParams.BkColor);

    ADrawParams.ForegroundColor := LColor;
  end;

  if seFont in ACalendarPicker.StyleElements then
  begin
    ADrawParams.Font.Color := GetTextColor(AEnabled);
  end;
end;

procedure TCalendarViewDrawerStyled.PrepareCellStyleParams(ADrawParams: TDrawViewInfoParams;
    AViewInfo: TCellItemViewInfo; AEnabled: Boolean);
begin
  inherited;

  if FCalendarView.HighlightToday and (vpToday in ADrawParams.ViewInfoProperties) then
  begin
    if (seClient in FCalendarView.StyleElements) then
      ADrawParams.BkColor := GetSelectionColor(AEnabled);
    if (seFont in FCalendarView.StyleElements) then
      ADrawParams.ForegroundColor := GetBackgroundColor(AEnabled);
  end
  else
  begin
    if vpCurrent in ADrawParams.ViewInfoProperties then
    begin
      if (seClient in FCalendarView.StyleElements) then
        ADrawParams.BkColor := GetBackgroundColor(AEnabled);
      if (seFont in FCalendarView.StyleElements) then
        ADrawParams.ForegroundColor := GetTextColor(AEnabled);
    end
    else
    begin
      if (seClient in FCalendarView.StyleElements) then
        ADrawParams.BkColor := GetInActiveCellBGColor(AEnabled);
      if (seFont in FCalendarView.StyleElements) then
        ADrawParams.ForegroundColor := GetInActiveCellTextColor(AEnabled);
    end;
  end;

  if (seBorder in FCalendarView.StyleElements) then
    ADrawParams.BorderColor := GetBorderColor;

  if AViewInfo.Highlighted and (vpSelected in ADrawParams.ViewInfoProperties) then
  begin
    if (seClient in FCalendarView.StyleElements) then
      ADrawParams.SelectionColor := MiddleColor(GetSelectionColor(AEnabled), GetSelectionFrameColor(AEnabled))
  end
  else if AViewInfo.Highlighted then
  begin
    if (seClient in FCalendarView.StyleElements) then
      ADrawParams.SelectionColor := GetSelectionFrameColor(AEnabled);
  end
  else if (vpSelected in ADrawParams.ViewInfoProperties) then
    if (seClient in FCalendarView.StyleElements) then
      ADrawParams.SelectionColor := GetSelectionColor(AEnabled);
end;

procedure TCalendarViewDrawerStyled.PrepareDaysOfWeekParams(ADrawParams: TDrawParams; AEnabled: Boolean);
begin
  inherited;
  if seClient in FCalendarView.StyleElements then
    ADrawParams.BkColor := GetBackgroundColor(AEnabled);

  if seFont in FCalendarView.StyleElements then
    ADrawParams.ForegroundColor := GetTextColor(AEnabled);
end;

procedure TCalendarViewDrawerStyled.PrepareHeaderParams(ADrawParams: TDrawParams; AHeader:
    TCalendarHeaderInfo; AEnabled: Boolean);
begin
  inherited;
  if seClient in FCalendarView.StyleElements then
    ADrawParams.BkColor := GetBackgroundColor(AEnabled);
end;

procedure TCalendarViewDrawerStyled.PrepareHeaderTextParams(ADrawParams: TDrawParams; AHeader:
    TCalendarHeaderText; AHighlited: Boolean; AEnabled: Boolean);
begin
  inherited;
  if seClient in FCalendarView.StyleElements then
    ADrawParams.BkColor := GetBackgroundColor(AEnabled);

  if seFont in FCalendarView.StyleElements then
  begin
    if AHeader.Highlighted then
      ADrawParams.ForegroundColor := GetHeaderActiveTextColor(AEnabled)
    else
      ADrawParams.ForegroundColor := GetHeaderTextColor(AEnabled);
  end;
end;

procedure TCalendarViewDrawerStyled.PrepareNavigatorButtonsParams(ADrawParams: TDrawParams;
  AButton: TCalendarHeaderNavigatorButton; AEnabled: Boolean);
begin
  inherited;
  if seClient in FCalendarView.StyleElements then
    ADrawParams.BkColor := GetBackgroundColor(AEnabled);

  if seFont in FCalendarView.StyleElements then
  begin
    if AButton.Highlighted then
      ADrawParams.ForegroundColor := GetActiveArrowColor(AEnabled)
    else
      ADrawParams.ForegroundColor := GetArrowColor(AEnabled);
  end;
end;

{ TCustomCalendarPicker }

constructor TCustomCalendarPicker.Create(Owner: TComponent);
begin
  inherited;

  Height := 32;
  Width := 140;

  FCalendarView := TPopupCalendarView.Create(Self);
  FCalendarView.TabStop := False;
  FCalendarView.OnChange := CalendarViewChange;
  FCalendarView.DisplayMode := TDisplayMode.dmMonth;
  FCalendarView.SelectionMode := TSelectionMode.smSingle;
  FDate := FCalendarView.Date;

  FIsEmpty := True;
  FDroppedDown := False;
  Font.Name := 'Segoe UI'; // do not localize
  Font.Size := 12;
  Font.Color := clGray;
  ControlStyle := [csCaptureMouse, csNeedsBorderPaint, csClickEvents, csOpaque, csDoubleClicks, csFixedHeight,
    csReflector, csPannable];
  TabStop := True;
  FDateFormat := FormatSettings.ShortDateFormat;
  TextHint := sSelectADate;
  Color := clWindow;
  FHot := False;
  FPressed := False;
end;

procedure TCustomCalendarPicker.CalendarViewChange(Sender: TObject);
begin
  if (FDroppedDown) and (FCalendarView.Date <> NullDate) then
    CloseUp(True);
  FDate := FCalendarView.Date;
  Invalidate;
end;

procedure TCustomCalendarPicker.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  Height := MulDiv(Height, M, D);
  FCalendarView.ChangeScale(M, D, isDpiChange);
end;

procedure TCustomCalendarPicker.Click;
begin
  inherited;
  if FDroppedDown then
    CloseUp(True)
  else
    DropDown;
end;

procedure TCustomCalendarPicker.CloseUp(Accept: Boolean);
begin
  if FDroppedDown then
  begin
    if GetCapture <> 0 then
      SendMessage(GetCapture, WM_CANCELMODE, 0, 0);

    if HandleAllocated then
      SetWindowPos(FCalendarView.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or
        SWP_HIDEWINDOW);

    FDroppedDown := False;
    Invalidate;
    if Accept then
      SetDate(FCalendarView.Date);
    if Assigned(FOnCloseUp) then
      FOnCloseUp(Self);
  end;
end;

procedure TCustomCalendarPicker.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FCalendarView) then
    CloseUp(False);
end;

procedure TCustomCalendarPicker.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Message.CharCode = VK_ESCAPE) and FDroppedDown then
  begin
    CloseUp(False);
    Message.Result := 1;
  end
  else
    inherited;
end;

procedure TCustomCalendarPicker.CMMouseEnter(var Message: TMessage);
begin
  FHot := True;
  Invalidate;
  inherited;
end;

procedure TCustomCalendarPicker.CMMouseLeave(var Message: TMessage);
begin
  FHot := False;
  Invalidate;
  inherited;
end;

procedure TCustomCalendarPicker.CNKeyDown(var Message: TMessage);
begin
  if FDroppedDown and (Message.WParam in [VK_PRIOR, VK_NEXT, VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN, VK_SPACE, VK_RETURN]) or
    ((Message.WParam = VK_TAB) and FDroppedDown) then
    FCalendarView.Perform(Message.Msg, Message.WParam, Message.LParam)
  else if ((Message.WParam = VK_SPACE) or (Message.WParam = VK_RETURN)) and not FDroppedDown then
    DropDown
  else
    inherited;
end;

function TCustomCalendarPicker.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if FDroppedDown then
    Result := FCalendarView.DoMouseWheelDown(Shift, MousePos);
end;

function TCustomCalendarPicker.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if FDroppedDown then
    Result := FCalendarView.DoMouseWheelUp(Shift, MousePos);
end;

procedure TCustomCalendarPicker.DoOnChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TCustomCalendarPicker.DropDown;

  procedure CalcDropDownPosition(out Position: TPoint);
  var
    InitialPos: TPoint;
  begin
    InitialPos := ClientToScreen(ParentToClient(Point(Left, Top)));
    Position := InitialPos;
    Position.Offset(-(FCalendarView.Width - Width) div 2, Height);
    if Position.Y + FCalendarView.Height > Screen.DesktopHeight then
    begin
      Position.Y := Position.Y - FCalendarView.Height - Height;
      if Position.Y < 0 then
        Position.Y := InitialPos.Y - (FCalendarView.Height + Height) div 2;
    end;
    if Position.X < 0 then
    begin
      Position.X := Max(0, Left);
    end;
    if Position.X + FCalendarView.Width > Screen.DesktopWidth then
      Position.X := Screen.DesktopWidth - FCalendarView.Width;
  end;

var
  Position: TPoint;
begin
  if IsEmpty then
    FCalendarView.SetDisplayDate(System.SysUtils.Date)
  else
    FCalendarView.SetDisplayDate(Date);

  FCalendarView.Date := Date;
  FCalendarView.DisplayMode := DisplayMode;

  CalcDropDownPosition(Position);

  SetWindowPos(FCalendarView.Handle, HWND_TOP, Position.X, Position.Y, 0, 0, SWP_NOSIZE or SWP_NOACTIVATE or
    SWP_FRAMECHANGED or SWP_SHOWWINDOW);

  FDroppedDown := True;
end;

function TCustomCalendarPicker.GetBorderColor: TColor;
begin
  Result := FCalendarView.BorderColor;
end;

function TCustomCalendarPicker.GetCalendarHeaderInfo: TCalendarHeaderInfo;
begin
  Result := FCalendarView.HeaderInfo;
end;

function TCustomCalendarPicker.GetColor: TColor;
begin
  Result := FCalendarView.Color;
end;

function TCustomCalendarPicker.GetDate: TDate;
begin
  if (csDesigning in ComponentState) and (FDate = NullDate) then
    Result := System.SysUtils.Date
  else
    Result := FDate;
end;

function TCustomCalendarPicker.GetDisabledColor: TColor;
begin
  Result := FCalendarView.DisabledColor;
end;

function TCustomCalendarPicker.GetFirstDayOfWeek: TDaysOfWeek;
begin
  Result := FCalendarView.FirstDayOfWeek;
end;

function TCustomCalendarPicker.GetFirstYear: Integer;
begin
  Result := FCalendarView.FirstYear;
end;

function TCustomCalendarPicker.GetHighlightColor: TColor;
begin
  Result := FCalendarView.HighlightColor;
end;

function TCustomCalendarPicker.GetHighlightToday: Boolean;
begin
  Result := FCalendarView.HighlightToday;
end;

function TCustomCalendarPicker.GetIsEmpty: Boolean;
begin
  Result := FIsEmpty or (Date = NullDate);
end;

function TCustomCalendarPicker.GetLastYear: Integer;
begin
  Result := FCalendarView.LastYear;
end;

function TCustomCalendarPicker.GetMaxYear: Integer;
begin
  Result := FCalendarView.MaxYear;
end;

function TCustomCalendarPicker.GetMinYear: Integer;
begin
  Result := FCalendarView.MinYear;
end;

function TCustomCalendarPicker.GetNumberOfWeeksInView: TItemsInRow;
begin
  Result := FCalendarView.NumberOfWeeksInView;
end;

function TCustomCalendarPicker.GetOnCalendarChangeView: TChangeViewEvent;
begin
  Result := FCalendarView.OnChangeView;
end;

function TCustomCalendarPicker.GetOnCalendarDrawDayItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawDayItem;
end;

function TCustomCalendarPicker.GetOnCalendarDrawMonthItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawMonthItem;
end;

function TCustomCalendarPicker.GetOnCalendarDrawYearItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawYearItem;
end;

function TCustomCalendarPicker.GetSelectionColor: TColor;
begin
  Result := FCalendarView.SelectionColor;
end;

function TCustomCalendarPicker.GetShowDayOfWeek: Boolean;
begin
  Result := FCalendarView.ShowDayOfWeek;
end;

function TCustomCalendarPicker.GetShowFirstOfGroupLabel: Boolean;
begin
  Result := FCalendarView.ShowFirstOfGroupLabel;
end;

function TCustomCalendarPicker.GetTodayColor: TColor;
begin
  Result := FCalendarView.TodayColor;
end;

procedure TCustomCalendarPicker.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (ssAlt in Shift) and ((Key = VK_UP) or (Key = VK_DOWN)) then
    if FDroppedDown then
      CloseUp(True)
    else
      DropDown;
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    Date := NullDate;
    CloseUp(False);
  end;
end;

procedure TCustomCalendarPicker.Paint;
var
  DrawParams: TDrawParams;
begin
  DrawParams := TDrawParams.Create(ClientRect);
  try
    FCalendarView.NeedDrawer.PrepareCalendarPickerParams(DrawParams, Self, FHot or Focused, FPressed, Enabled);
    FCalendarView.NeedDrawer.DrawCalendarPicker(DrawParams, Canvas, Self, MulDiv(2, FCurrentPPI, Screen.PixelsPerInch),
      MulDiv(CalendarPickerIconSize, FCurrentPPI, Screen.PixelsPerInch));
  finally
    FreeAndNil(DrawParams);
  end;
end;

procedure TCustomCalendarPicker.SetBorderColor(const Value: TColor);
begin
  FCalendarView.BorderColor := Value;
end;

procedure TCustomCalendarPicker.SetColor(const Value: TColor);
begin
  FCalendarView.Color := Value;
  Invalidate;
end;

procedure TCustomCalendarPicker.SetDate(const Value: TDate);
begin
  if FDroppedDown then
    FCalendarView.Date := Value;

  if FDate = Value then
    Exit;

  FDate := Value;
  FIsEmpty := Value = NullDate;

  Invalidate;
  DoOnChange;
end;

procedure TCustomCalendarPicker.SetDateFormat(const Value: string);
begin
  FDateFormat := Value;
  Invalidate;
end;

procedure TCustomCalendarPicker.SetDisabledColor(const Value: TColor);
begin
  FCalendarView.DisabledColor := Value;
end;

procedure TCustomCalendarPicker.SetDisplayMode(const Value: TDisplayMode);
begin
  FDisplayMode := Value;
  FCalendarView.DisplayMode := Value;
end;

procedure TCustomCalendarPicker.SetFirstDayOfWeek(const Value: TDaysOfWeek);
begin
  FCalendarView.FirstDayOfWeek := Value;
end;

procedure TCustomCalendarPicker.SetFirstYear(const Value: Integer);
begin
  FCalendarView.FirstYear := Value;
end;

procedure TCustomCalendarPicker.SetHighlightColor(const Value: TColor);
begin
  FCalendarView.HighlightColor := Value;
end;

procedure TCustomCalendarPicker.SetHighlightToday(const Value: Boolean);
begin
  FCalendarView.HighlightToday := Value;
end;

procedure TCustomCalendarPicker.SetIsEmpty(const Value: Boolean);
begin
  FIsEmpty := Value;
  if Value then
    Date := NullDate;
end;

procedure TCustomCalendarPicker.SetLastYear(const Value: Integer);
begin
  FCalendarView.LastYear := Value;
end;

procedure TCustomCalendarPicker.SetMaxYear(const Value: Integer);
begin
  FCalendarView.MaxYear := Value;
end;

procedure TCustomCalendarPicker.SetMinYear(const Value: Integer);
begin
  FCalendarView.MinYear := Value;
end;

procedure TCustomCalendarPicker.SetNumberOfWeeksInView(const Value:
    TItemsInRow);
begin
  FCalendarView.NumberOfWeeksInView := Value;
end;

procedure TCustomCalendarPicker.SetOnCalendarChangeView(const Value: TChangeViewEvent);
begin
  FCalendarView.OnChangeView := Value;
end;

procedure TCustomCalendarPicker.SetOnCalendarDrawDayItem(const Value: TDrawViewInfoEvent);
begin
  FCalendarView.OnDrawDayItem := Value;
end;

procedure TCustomCalendarPicker.SetOnCalendarDrawMonthItem(const Value: TDrawViewInfoEvent);
begin
  FCalendarView.OnDrawMonthItem := Value;
end;

procedure TCustomCalendarPicker.SetOnCalendarDrawYearItem(const Value: TDrawViewInfoEvent);
begin
  FCalendarView.OnDrawYearItem := Value;
end;

procedure TCustomCalendarPicker.SetSelectionColor(const Value: TColor);
begin
  FCalendarView.SelectionColor := Value;
end;

procedure TCustomCalendarPicker.SetShowDayOfWeek(const Value: Boolean);
begin
  FCalendarView.ShowDayOfWeek := Value;
end;

procedure TCustomCalendarPicker.SetShowFirstOfGroupLabel(const Value: Boolean);
begin
  FCalendarView.ShowFirstOfGroupLabel := Value;
end;

procedure TCustomCalendarPicker.SetTextHint(const Value: string);
begin
  FTextHint := Value;
  Invalidate;
end;

procedure TCustomCalendarPicker.SetTodayColor(const Value: TColor);
begin
  FCalendarView.TodayColor := Value;
end;

function TCustomCalendarPicker.StoreDate: Boolean;
begin
  Result := not FIsEmpty;
end;

procedure TCustomCalendarPicker.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
  Invalidate;
end;

procedure TCustomCalendarPicker.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if CanFocus then
    SetFocus;
  FPressed := True;
  Invalidate;
  inherited;
end;

procedure TCustomCalendarPicker.WMLButtonUp(var Message: TWMLButtonUp);
begin
  FPressed := False;
  Invalidate;
  inherited;
end;

procedure TCustomCalendarPicker.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

{ TCalendarViewMonthlyViewInfo }

constructor TCalendarViewMonthlyViewInfo.Create(const AHeaderInfo: TCalendarHeaderInfo; const
    AController: ICalendarViewController; ADrawer: TCalendarViewDrawer);
begin
  inherited;
  FCellsInfo := Body.AddChild(TCalendarCellItemsMonthlyViewInfo.Create(AController, TDisplayMode.dmMonth));
  if AController.ShowDayOfWeek then
    FWeekDays := Body.AddChild(TCalendarDaysOfWeekViewInfo.Create(AHeaderInfo))
  else
    FWeekDays := nil;

  CalendarType := StrToIntDef(GetLocaleStr(LOCALE_USER_DEFAULT, LOCALE_ICALENDARTYPE, ''), CAL_GREGORIAN)
end;

procedure TCalendarViewMonthlyViewInfo.Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer);
var
  LClientSize: TSize;
begin
  LClientSize := ASize.Subtract(TSize.Create(Controller.BorderSize * 2, Controller.BorderSize * 2));

  Header.HeaderText.Text := GetHeaderText;
  Header.Calculate(LClientSize);
  Header.Left := Controller.BorderSize;
  Header.Top := Controller.BorderSize;

  if (WeekDays <> nil) then
  begin
    WeekDays.Calculate(TSize.Create(LClientSize.cx, Header.Size.cy));
    WeekDays.Left := 0;
    WeekDays.Top := 0;

    CellsInfo.Calculate(TSize.Create(LClientSize.cx, LClientSize.cy - (Header.Height + WeekDays.Height)),
      ADrawer, Controller.NumberOfWeeksInView);
    CellsInfo.Top := WeekDays.LocalRect.Bottom;

    Body.Top := Header.LocalRect.Bottom;
    Body.Left := Controller.BorderSize;
    Body.Size := TViewInfoUtils.GetLocalBounds([WeekDays, CellsInfo]).Size;
  end
  else
  begin
    CellsInfo.Calculate(TSize.Create(LClientSize.cx, LClientSize.cy - Header.Height),
      ADrawer, Controller.NumberOfWeeksInView);
    CellsInfo.Top := 0;

    Body.Top := Header.LocalRect.Bottom;
    Body.Left := Controller.BorderSize;
    Body.Size := CellsInfo.Size;
  end;

  Size := ASize;
end;

function TCalendarViewMonthlyViewInfo.CorrectStartDate(const Value: TDate): TDate;
begin
  Result := StartOfWeek(StartOfTheMonth(Value + DaysCalendarColCount), Controller.FirstDayOfWeek);
end;

function TCalendarViewMonthlyViewInfo.Diff(AStart: TDate; AEnd: TDate): Integer;
begin
  Result := Trunc(AEnd - AStart);
end;

procedure TCalendarViewMonthlyViewInfo.FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController);
var
  LNewDate: TDate;
  LPrevDate: TDate;
begin
  LPrevDate := FocusedDate;
  if LPrevDate < StartDate then
    LPrevDate := StartDate;

  LNewDate := LPrevDate;

  case ADirection of
    TFocusDirection.fdUp:
      LNewDate := LNewDate - CellsInfo.CountInRow;
    TFocusDirection.fdDown:
      LNewDate := LNewDate + CellsInfo.CountInRow;
    TFocusDirection.fdLeft:
      LNewDate := LNewDate - 1;
    TFocusDirection.fdRight:
      LNewDate := LNewDate + 1;
    TFocusDirection.fdPageUp:
      LNewDate := LNewDate - CellsInfo.CountInCol * CellsInfo.CountInRow;
    TFocusDirection.fdPageDown:
      LNewDate := LNewDate + CellsInfo.CountInCol * CellsInfo.CountInRow;
  end;

  LNewDate := AController.LimitDate(LNewDate);

  if (MonthOf(LNewDate) <> MonthOf(LPrevDate)) then
  begin
    if (LNewDate < LPrevDate) then
      StartDate := LNewDate - CellsInfo.CountInRow * 2
    else
      StartDate := LNewDate + CellsInfo.CountInRow * 2;
  end
  else
  begin
    if (LNewDate < StartDate) or (LNewDate > StartDate + CellsInfo.CountInCol * CellsInfo.CountInRow) then
    begin
      StartDate := LNewDate;
    end;
  end;

  FocusedDate := LNewDate;

  CellsInfo.DisplayFocused := True;
  AController.SetFocusedDate(FocusedDate);
end;

function TCalendarViewMonthlyViewInfo.GetDisplayMode: TDisplayMode;
begin
  Result := TDisplayMode.dmMonth;
end;

function TCalendarViewMonthlyViewInfo.GetHeaderText: string;
begin
  Result := GetDateFormatStr(LOCALE_USER_DEFAULT, ActualDate, GetShortYearMonth);
end;

function TCalendarViewMonthlyViewInfo.GetNextDate: TDate;
begin
  Result := StartDate + CellsInfo.CountInCol * CellsInfo.CountInRow;
end;

procedure TCalendarViewMonthlyViewInfo.Navigate(AForward: Boolean);
var
  LActualDate: TDate;
  LPrevStartDate: TDate;
  LStartDate: TDate;
begin
  LPrevStartDate := StartDate;
  LActualDate := IncMonth(StartOfTheMonth(StartDate + DaysCalendarColCount), IfThen(AForward, 1, -1));
  LStartDate := CorrectStartDate(LActualDate);

  if AForward then
  begin
    if not Controller.CanSetDisplayDate(LActualDate) then
      // limited move
      Exit;
  end
  else if not Controller.CanSetDisplayDate(LActualDate) then
    // limited move
    Exit;
  CellsInfo.DisplayFocused := True;
  AnimateAndSet(AForward, True, LPrevStartDate, LStartDate, LActualDate);
end;

procedure TCalendarViewMonthlyViewInfo.SetActualDate(const Value: TDate);
begin
  CellsInfo.ActualDate := Value;
  CellsInfo.StartDate := CorrectStartDate(StartOfTheMonth(Value));
  Calculate(Size, FDrawer);
end;

procedure TCalendarViewMonthlyViewInfo.SetFocusedDate(const Value: TDate);
begin
  if (MonthOf(FocusedDate) <> MonthOf(Value)) then
  begin
    ActualDate := Value;
  end;

  CellsInfo.FocusedDate := Value;
end;

procedure TCalendarViewMonthlyViewInfo.SetStartDate(const Value: TDate);
var
  LStartDate: TDate;
begin
  if (StartDate = Value) then
    Exit;

  LStartDate := CorrectStartDate(Value);

  if (LStartDate = StartDate) then
    Exit;

  if DayOf(LStartDate) > 1 then
    CellsInfo.ActualDate := StartOfTheMonth(IncMonth(LStartDate))
  else
    CellsInfo.ActualDate := StartOfTheMonth(LStartDate);

  CellsInfo.StartDate := LStartDate;

  Calculate(Size, FDrawer);
end;

{ TCalendarViewViewInfoBase }

constructor TCalendarViewViewInfoBase.Create(const AHeaderInfo: TCalendarHeaderInfo; const
    AController: ICalendarViewController; ADrawer: TCalendarViewDrawer);
begin
  inherited Create;
  FHeaderInfo := AHeaderInfo;
  FBody := AddChild(TCalendarViewInfoBase.Create);
  FController := AController;
  FDrawer := ADrawer;
  FHeader := AddChild(THeaderViewInfo.Create(AHeaderInfo));
end;

procedure TCalendarViewViewInfoBase.AnimateAndSet(AForward: Boolean; ADisableStates: Boolean; APrevStartDate: TDate;
  ANewStartDate: TDate; ANewActualDate: TDate);
var
  LCellsSize: TSize;
  LDifference: Integer;
  LFinalBitmap: TBitmap;
begin
  LCellsSize := CellsInfo.Size;

  LFinalBitmap := TBitmap.Create;
  try
    if AForward then
    begin
      LDifference := Abs(Diff(ANewStartDate, APrevStartDate)) div CellsInfo.CountInRow;

      CellsInfo.Calculate(TSize.Create(LCellsSize.cx, LCellsSize.cy + CellsInfo.CellHeight * LDifference),
        FDrawer, CellsInfo.CountInCol + LDifference);

      LFinalBitmap.SetSize(CellsInfo.Size.cx, CellsInfo.Size.cy);
      CellsInfo.InAnimationState := ADisableStates;
      try
        CellsInfo.Draw(Point(0, 0), LFinalBitmap.Canvas, Controller.Drawer, Controller);
      finally
        CellsInfo.InAnimationState := False;
      end;

      StartDate := ANewStartDate;
    end
    else
    begin
      StartDate := ANewStartDate;

      LDifference := Abs(Diff(StartDate, APrevStartDate)) div CellsInfo.CountInRow;

      CellsInfo.Calculate(TSize.Create(LCellsSize.cx, LCellsSize.cy + CellsInfo.CellHeight * LDifference),
        FDrawer, CellsInfo.CountInCol + LDifference);

      LFinalBitmap.SetSize(CellsInfo.Size.cx, CellsInfo.Size.cy);
      CellsInfo.InAnimationState := ADisableStates;
      try
        CellsInfo.Draw(Point(0, 0), LFinalBitmap.Canvas, Controller.Drawer, Controller);
      finally
        CellsInfo.InAnimationState := False;
      end;
    end;

    StartDate := ANewStartDate;
    ActualDate := ANewActualDate;

    // recalculate without additional row
    CellsInfo.Calculate(LCellsSize, FDrawer, CellsInfo.CountInCol);

    Controller.AnimateNavigation(LFinalBitmap, AForward);
  finally
    LFinalBitmap.Free;
  end;
end;

procedure TCalendarViewViewInfoBase.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LDrawRect: TRect;
begin
  ACanvas.Brush.Color := AController.Color;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Color := AController.BorderColor;
  ACanvas.Pen.Width := AController.BorderSize;

  LDrawRect := SizeRect;
  LDrawRect.Offset(APosition);
  ACanvas.Rectangle(LDrawRect);

  DrawChildren(APosition, ACanvas, ADrawer, AController);
end;

function TCalendarViewViewInfoBase.GetActualDate: TDate;
begin
  Result := FCellsInfo.ActualDate;
end;

function TCalendarViewViewInfoBase.GetFocusedDate: TDate;
begin
  Result := FCellsInfo.FocusedDate;
end;

function TCalendarViewViewInfoBase.GetStartDate: TDate;
begin
  Result := FCellsInfo.StartDate;
end;

procedure TCalendarViewViewInfoBase.SetActualDate(const Value: TDate);
begin
  FCellsInfo.ActualDate := Value;
  Calculate(Size, FDrawer);
end;

procedure TCalendarViewViewInfoBase.SetFocusedDate(const Value: TDate);
begin
  FCellsInfo.FocusedDate := Value;
end;

procedure TCalendarViewViewInfoBase.SetStartDate(const Value: TDate);
begin
  FCellsInfo.StartDate := Value;
  Calculate(Size, FDrawer);
end;

{ TCalendarCellItemsViewInfo }

constructor TCalendarCellItemsViewInfo.Create(const AController: ICalendarViewController; ADisplayMode: TDisplayMode);
begin
  inherited Create;
  FController := AController;
  FDisplayMode := ADisplayMode;
  FInAnimationState := False;
end;

destructor TCalendarCellItemsViewInfo.Destroy;
begin
  inherited;
end;

procedure TCalendarCellItemsViewInfo.Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer;
    ARowCount: Integer);
var
  LCellHeight: Double;
  LCellWidth: Double;
  i: Integer;
  LCellViewInfo: TCellItemViewInfo;
  LPrevCellViewInfo: TCellItemViewInfo;
  LChild: TCalendarViewInfoBase;
  LNewSize: TSize;
begin
  Children.Clear;

  case DisplayMode of
    TDisplayMode.dmMonth:
      begin
        for i := 0 to CountInRow * ARowCount - 1 do
        begin
          LCellViewInfo := TCellDayInfo.Create(Point(i mod CountInRow, i div CountInRow), StartDate + i);
          AddChild(LCellViewInfo);
        end;
      end;
    TDisplayMode.dmYear:
      begin
        for i := 0 to CountInRow * ARowCount - 1 do
        begin
          LCellViewInfo := TCellMonthInfo.Create(Point(i mod CountInRow, i div CountInRow), IncMonth(StartDate, i));
          AddChild(LCellViewInfo);
        end;
      end;
    TDisplayMode.dmDecade:
      begin
        for i := 0 to CountInRow * ARowCount - 1 do
        begin
          LCellViewInfo := TCellYearInfo.Create(Point(i mod CountInRow, i div CountInRow), IncYear(StartDate, i));
          AddChild(LCellViewInfo);
        end;
      end;
  end;

  LNewSize := ASize;

  Size := LNewSize;

  LCellWidth := LNewSize.cx / CountInRow;
  LCellHeight := LNewSize.cy / ARowCount;

  if LNewSize.cx > 0 then
  begin

    for LChild in Children do
    begin
      LCellViewInfo := LChild as TCellItemViewInfo;

      LCellViewInfo.Left := Round(LCellViewInfo.Cell.X * LCellWidth);
      LCellViewInfo.Top := Round(LCellViewInfo.Cell.Y * LCellHeight);

      LCellViewInfo.Width := Trunc(LCellWidth);
      LCellViewInfo.Height := Trunc(LCellHeight);

      if LCellViewInfo.Cell.X > 0 then
      begin
        LPrevCellViewInfo := Cells[LCellViewInfo.Cell.Y * CountInRow + LCellViewInfo.Cell.X - 1];
        LPrevCellViewInfo.Width := LCellViewInfo.Left - LPrevCellViewInfo.Left;
      end;

      if LCellViewInfo.Cell.Y > 0 then
      begin
        LPrevCellViewInfo := Cells[(LCellViewInfo.Cell.Y - 1) * CountInRow + LCellViewInfo.Cell.X];
        LPrevCellViewInfo.Height := LCellViewInfo.Top - LPrevCellViewInfo.Top;
      end;

      if (LCellViewInfo.Cell.X = CountInRow - 1) then
      begin
        LCellViewInfo.Width := LNewSize.cx - LCellViewInfo.Left;
      end;

      if (LCellViewInfo.Cell.Y = ARowCount - 1) then
      begin
        LCellViewInfo.Height := LNewSize.cy - LCellViewInfo.Top;
      end;
    end;

  end;

  FCellHeight := Trunc(LCellHeight);
end;

function TCalendarCellItemsViewInfo.GetCellCount: Integer;
begin
  Result := Children.Count;
end;

function TCalendarCellItemsViewInfo.GetCells(Index: Integer): TCellItemViewInfo;
begin
  Result := Children[Index] as TCellItemViewInfo;
end;

function TCalendarCellItemsViewInfo.GetCountInCol: Integer;
begin
  case DisplayMode of
    TDisplayMode.dmMonth:
      Result := FController.NumberOfWeeksInView;
    TDisplayMode.dmYear:
      Result := MonthesCalendarMaxRowCount;
    TDisplayMode.dmDecade:
      Result := DecadesCalendarMaxRowCount;
  else
    Result := 0;
  end;
end;

function TCalendarCellItemsViewInfo.GetCountInRow: Integer;
begin
  case DisplayMode of
    TDisplayMode.dmMonth:
      Result := DaysCalendarColCount;
    TDisplayMode.dmYear:
      Result := MonthesCalendarMaxColCount;
    TDisplayMode.dmDecade:
      Result := DecadesCalendarMaxColCount;
  else
    Result := 0;
  end;
end;

function TCalendarCellItemsViewInfo.GetFocusedCell: TPoint;
begin
  Result := Point(FocusedCellIndex mod CountInRow, FocusedCellIndex div CountInRow);
end;

function TCalendarCellItemsViewInfo.GetFocusedCellIndex: Integer;
var
  i: Integer;
begin
  for i := 0 to CellCount - 1 do
    if (Cells[i].Date = FocusedDate) then
      Exit(i);

  Result := 0;
end;

function TCalendarCellItemsViewInfo.GetFocusedCellInfo: TCellItemViewInfo;
var
  LIndex: Integer;
begin
  LIndex := FocusedCellIndex;
  if (LIndex < 0) or (LIndex >= CellCount) then
    Result := nil
  else
    Result := Cells[LIndex];
end;

function TCalendarCellItemsViewInfo.GetTabOrder: Integer;
begin
  Result := 3;
end;

procedure TCalendarCellItemsViewInfo.SetFocusedCell(const Value: TPoint);
begin
  FocusedDate := Cells[Value.Y * CountInRow + Value.X].Date;
end;

procedure TCalendarCellItemsViewInfo.SetFocusedCellIndex(const Value: Integer);
begin
  if (Value < 0) or (Value >= CellCount) then
    FocusedDate := NullDate
  else
    FocusedDate := Cells[Value].Date;
end;

procedure TCalendarCellItemsViewInfo.SetFocusedDate(const Value: TDate);
begin
  FFocusedDate := Value;
end;

procedure TCalendarCellItemsViewInfo.SetInAnimationState(const Value: Boolean);
begin
  FInAnimationState := Value;
end;

{ THeaderViewInfo }

constructor THeaderViewInfo.Create(const AHeaderInfo: TCalendarHeaderInfo);
begin
  inherited Create;
  FHeaderInfo := AHeaderInfo;
  FHeaderText := AddChild(TCalendarHeaderText.Create(AHeaderInfo));
  FNavigationButtons := AddChild(TCalendarNavigationButtons.Create(AHeaderInfo));
end;

procedure THeaderViewInfo.Calculate(const ASize: TSize);
var
  LCanvas: TCanvas;
  LTextHeight: Integer;
begin
  LCanvas := TCanvas.Create;
  try
    LCanvas.Handle := GetDC(0);
    try
      HeaderText.Calculate(LCanvas, ASize);
    finally
      ReleaseDC(0, LCanvas.Handle);
    end;

    LTextHeight := HeaderText.Height;
    HeaderText.Left := 10;
    HeaderText.Height := LTextHeight + LTextHeight div 3; // increase height

    NavigationButtons.Calculate(TSize.Create(ASize.cx - 15 - HeaderText.Width, LTextHeight));
    NavigationButtons.Top := (HeaderText.Height - LTextHeight) div 2;
    NavigationButtons.Left := ASize.cx - 15 - NavigationButtons.Width;

    Size := TSize.Create(ASize.cx, HeaderText.Height);
  finally
    LCanvas.Free;
  end;
end;

procedure THeaderViewInfo.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LDrawParams: TDrawParams;
begin
  LDrawParams := TDrawParams.Create(TRect.Create(APosition, Width, Height));
  try
    ADrawer.PrepareHeaderParams(LDrawParams, HeaderInfo, AController.Enabled);
    ADrawer.DrawHeaderRect(LDrawParams, ACanvas);
    ACanvas.Brush.Color := LDrawParams.BkColor;
  finally
    FreeAndNil(LDrawParams);
  end;

  inherited;
end;

{ TCalendarNavigationButtons }

constructor TCalendarNavigationButtons.Create(const CalendarHeader: TCalendarHeaderInfo);
begin
  inherited Create;
  FButtonPrev := AddChild(TCalendarHeaderNavigatorButton.Create(CalendarHeader, 1));
  FButtonPrev.Orientation := TDateNavigatorButtonOrientation.nboPrev;

  FButtonNext := AddChild(TCalendarHeaderNavigatorButton.Create(CalendarHeader, 2));
  FButtonNext.Orientation := TDateNavigatorButtonOrientation.nboNext;
end;

procedure TCalendarNavigationButtons.Calculate(const ASize: TSize);
const
  Delta = 8;
begin
  FButtonPrev.Calculate(ASize.cy - Delta);
  FButtonPrev.Top := Delta div 2;
  FButtonPrev.Left := 0;

  FButtonNext.Calculate(ASize.cy - Delta);
  FButtonNext.Top := Delta div 2;
  FButtonNext.Left := FButtonPrev.LocalRect.Right + 20;

  Size := TViewInfoUtils.GetLocalBounds([FButtonPrev, FButtonNext]).Size;
end;

{ TCalendarViewInfoBase }

constructor TCalendarViewInfoBase.Create;
begin
  FChildren := TObjectList<TCalendarViewInfoBase>.Create(True);
  FFocused := False;
end;

destructor TCalendarViewInfoBase.Destroy;
begin
  if Assigned(FOnDestroy) then
    FOnDestroy(Self);

  FreeAndNil(FChildren);
  inherited;
end;

function TCalendarViewInfoBase.AddChild<T>(const AChild: T): T;
begin
  Assert(AChild <> nil);
  FChildren.Add(AChild as TCalendarViewInfoBase);
  (AChild as TCalendarViewInfoBase).FParent := Self;
  Result := AChild;
end;

procedure TCalendarViewInfoBase.Click(const AController: ICalendarViewController; ByMouse: Boolean);
begin
  AController.ClearFocusedItems;
  AController.LastFocusedItem := Self.TabOrder;
  Focused := True;
end;

function TCalendarViewInfoBase.ContainsPoint(const Point: TPoint): Boolean;
begin
  Result := GlobalRect.Contains(Point);
end;

procedure TCalendarViewInfoBase.Draw(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LDrawRect: TRect;
  LColor: TColor;
begin
  LDrawRect := SizeRect;
  LDrawRect.Offset(APosition);
  ACanvas.Brush.Style := bsSolid;
  ADrawer.PrepareCalendarBackground(LColor, AController.Enabled);
  ACanvas.Brush.Color := LColor;

  ACanvas.FillRect(LDrawRect);

  DrawChildren(APosition, ACanvas, ADrawer, AController);
end;

procedure TCalendarViewInfoBase.DrawChildren(const APosition: TPoint; ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LChild: TCalendarViewInfoBase;
  LPosition: TPoint;
begin
  for LChild in Children do
  begin
    LPosition := APosition;
    LPosition.Offset(LChild.Position);
    LChild.Draw(LPosition, ACanvas, ADrawer, AController)
  end;
end;

procedure TCalendarViewInfoBase.DrawDefault(ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LRect: TRect;
begin
  LRect := GlobalRect;
  Draw(LRect.TopLeft, ACanvas, ADrawer, AController);
end;

procedure TCalendarViewInfoBase.DrawDefaultBuffered(ACanvas: TCanvas; ADrawer: TCalendarViewDrawer;
  const AController: ICalendarViewController);
var
  LBitmap: TBitmap;
  LRect: TRect;
begin
  LBitmap := TBitmap.Create;
  try
    LRect := GlobalRect;
    LBitmap.SetSize(LRect.Width, LRect.Height);
    LBitmap.Canvas.FillRect(Rect(0, 0, Width, Height));

    Draw(Point(0, 0), LBitmap.Canvas, ADrawer, AController);
    ACanvas.CopyRect(LRect, LBitmap.Canvas, Rect(0, 0, LBitmap.Width, LBitmap.Height));
  finally
    LBitmap.Free;
  end;
end;

function TCalendarViewInfoBase.FindAtPoint(const Point: TPoint): TCalendarViewInfoBase;
var
  LChild: TCalendarViewInfoBase;
begin
  if GlobalRect.Contains(Point) then
  begin
    for LChild in FChildren do
    begin
      Result := LChild.FindAtPoint(Point);
      if (Result <> nil) then
        Exit;
    end;

    Result := Self;
  end
  else
    Result := nil;
end;

function TCalendarViewInfoBase.GetGlobalRect: TRect;
var
  LPosition: TPoint;
  LCurrent: TCalendarViewInfoBase;
begin
  LPosition := Position;
  LCurrent := Parent;
  while (LCurrent <> nil) do
  begin
    LPosition.Offset(LCurrent.Position);
    LCurrent := LCurrent.Parent;
  end;

  Result := SizeRect;
  Result.Offset(LPosition);
end;

function TCalendarViewInfoBase.GetHeight: Integer;
begin
  Result := FSize.cy;
end;

function TCalendarViewInfoBase.GetLeft: Integer;
begin
  Result := FPosition.X;
end;

function TCalendarViewInfoBase.GetLocalRect: TRect;
begin
  Result := GetSizeRect;
  Result.Offset(Position);
end;

function TCalendarViewInfoBase.GetSizeRect: TRect;
begin
  Result := TRect.Create(0, 0, Width, Height);
end;

function TCalendarViewInfoBase.GetTabOrder: Integer;
begin
  Result := -1;
end;

function TCalendarViewInfoBase.GetTop: Integer;
begin
  Result := FPosition.Y;
end;

function TCalendarViewInfoBase.GetWidth: Integer;
begin
  Result := FSize.cx;
end;

procedure TCalendarViewInfoBase.SetHeight(const Value: Integer);
begin
  FSize.cy := Value;
end;

procedure TCalendarViewInfoBase.SetLeft(const Value: Integer);
begin
  FPosition.X := Value;
end;

procedure TCalendarViewInfoBase.SetTop(const Value: Integer);
begin
  FPosition.Y := Value;
end;

procedure TCalendarViewInfoBase.SetWidth(const Value: Integer);
begin
  FSize.cx := Value;
end;

{ TCalendarViewYearlyViewInfo }

constructor TCalendarViewYearlyViewInfo.Create(const AHeaderInfo: TCalendarHeaderInfo; const
    AController: ICalendarViewController; ADrawer: TCalendarViewDrawer);
begin
  inherited;
  FCellsInfo := Body.AddChild(TCalendarCellItemsYearlyViewInfo.Create(AController, TDisplayMode.dmYear));
end;

procedure TCalendarViewYearlyViewInfo.Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer);
var
  LClientSize: TSize;
begin
  LClientSize := ASize.Subtract(TSize.Create(Controller.BorderSize * 2, Controller.BorderSize * 2));

  Header.HeaderText.Text := GetHeaderText;
  Header.Calculate(LClientSize);
  Header.Left := Controller.BorderSize;
  Header.Top := Controller.BorderSize;

  CellsInfo.Calculate(TSize.Create(LClientSize.cx, LClientSize.cy - Header.Height), ADrawer,
    MonthesCalendarMaxRowCount);
  CellsInfo.Top := 0;

  Body.Top := Header.LocalRect.Bottom;
  Body.Left := Controller.BorderSize;
  Body.Size := CellsInfo.Size;

  Size := ASize;
end;

function TCalendarViewYearlyViewInfo.CorrectStartDate(const Value: TDate): TDate;
begin
  Result := StartOfTheMonth(Controller.LimitDate(Value));
end;

function TCalendarViewYearlyViewInfo.Diff(AStart: TDate; AEnd: TDate): Integer;
begin
  Result := Trunc((YearOf(AEnd) - YearOf(AStart)) * 12 + (MonthOf(AEnd) - MonthOf(AStart)));
end;

procedure TCalendarViewYearlyViewInfo.FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController);
var
  LIndex: Integer;
  LNewDate: TDate;
  LDiff: Integer;
  LCorrectedDate: TDate;
begin
  LIndex := CellsInfo.FocusedCellIndex;
  case ADirection of
    TFocusDirection.fdUp:
      Dec(LIndex, CellsInfo.CountInRow);
    TFocusDirection.fdDown:
      Inc(LIndex, CellsInfo.CountInRow);
    TFocusDirection.fdLeft:
      Dec(LIndex);
    TFocusDirection.fdRight:
      Inc(LIndex);
    TFocusDirection.fdPageUp:
      Dec(LIndex, CellsInfo.CountInCol * CellsInfo.CountInRow);
    TFocusDirection.fdPageDown:
      Inc(LIndex, CellsInfo.CountInCol * CellsInfo.CountInRow);
  end;

  LNewDate := IncMonth(StartDate, LIndex);
  LCorrectedDate := AController.LimitDate(LNewDate);
  if (LCorrectedDate <> LNewDate) then
    Exit; // limitation

  LNewDate := LCorrectedDate;

  LDiff := Diff(StartDate, LNewDate);
  if (LDiff < 0) then
  begin
    StartDate := IncYear(StartDate, -1);
  end
  else if (LDiff >= CellsInfo.CountInCol * CellsInfo.CountInRow) then
  begin
    StartDate := IncYear(StartDate, 1);
  end;

  FocusedDate := LNewDate;

  CellsInfo.DisplayFocused := True;
  AController.SetFocusedDate(LNewDate);
end;

function TCalendarViewYearlyViewInfo.GetDisplayMode: TDisplayMode;
begin
  Result := TDisplayMode.dmYear;
end;

function TCalendarViewYearlyViewInfo.GetHeaderText: string;
begin
  Result := FormatDateTime(GetSpecialFormat(tYearlyViewHeader), ActualDate);
end;

function TCalendarViewYearlyViewInfo.GetNextDate: TDate;
begin
  Result := IncMonth(StartDate, CellsInfo.CountInCol * CellsInfo.CountInRow);
end;

procedure TCalendarViewYearlyViewInfo.Navigate(AForward: Boolean);
var
  LStartDate: TDate;
  LCorrectedDate: TDate;
  LPrevStartDate: TDate;
begin
  LPrevStartDate := StartDate;
  LStartDate := IncMonth(StartOfTheMonth(LPrevStartDate), IfThen(AForward, 1, -1) * CellsInfo.CountInRow);

  LCorrectedDate := Controller.LimitDate(LStartDate);
  if MonthOf(LStartDate) <> MonthOf(LCorrectedDate) then
  begin
    // limited move
    Exit;
  end;

  AnimateAndSet(AForward, False, LPrevStartDate, LStartDate, LStartDate);
end;

procedure TCalendarViewYearlyViewInfo.SetActualDate(const Value: TDate);
begin
  if ActualDate = Value then
    Exit;

  CellsInfo.ActualDate := Value;

  if (Value < StartDate) or (Value >= NextDate) then
    CellsInfo.StartDate := CorrectStartDate(Value);

  Calculate(Size, FDrawer);
end;

procedure TCalendarViewYearlyViewInfo.SetStartDate(const Value: TDate);
var
  LStartDate: TDate;
begin
  LStartDate := CorrectStartDate(Value);
  if StartDate = LStartDate then
    Exit;

  if MonthOf(LStartDate) > 1 then
    CellsInfo.ActualDate := StartOfTheYear(IncYear(LStartDate))
  else
    CellsInfo.ActualDate := StartOfTheYear(LStartDate);

  CellsInfo.StartDate := LStartDate;
  Calculate(Size, FDrawer);
end;

{ TCalendarViewDecadeViewInfo }

constructor TCalendarViewDecadeViewInfo.Create(const AHeaderInfo: TCalendarHeaderInfo; const
    AController: ICalendarViewController; ADrawer: TCalendarViewDrawer);
begin
  inherited;
  FCellsInfo := Body.AddChild(TCalendarCellItemsDecadeViewInfo.Create(AController, TDisplayMode.dmDecade));
end;

procedure TCalendarViewDecadeViewInfo.Calculate(const ASize: TSize; ADrawer: TCalendarViewDrawer);
var
  LClientSize: TSize;
begin
  LClientSize := ASize.Subtract(TSize.Create(Controller.BorderSize * 2, Controller.BorderSize * 2));

  Header.HeaderText.Text := GetHeaderText;
  Header.Calculate(LClientSize);
  Header.Left := Controller.BorderSize;
  Header.Top := Controller.BorderSize;

  CellsInfo.Calculate(TSize.Create(LClientSize.cx, LClientSize.cy - Header.Height),
    FDrawer, DecadesCalendarMaxRowCount);
  CellsInfo.Top := 0;

  Body.Top := Header.LocalRect.Bottom;
  Body.Left := Controller.BorderSize;
  Body.Size := CellsInfo.Size;

  Size := ASize;
end;

function TCalendarViewDecadeViewInfo.Diff(AStart: TDate; AEnd: TDate): Integer;
begin
  Result := YearOf(AStart) - YearOf(AEnd);
end;

procedure TCalendarViewDecadeViewInfo.FocusCell(ADirection: TFocusDirection; AController: ICalendarViewController);
var
  LIndex: Integer;
  LNewDate: TDate;
begin
  LIndex := CellsInfo.FocusedCellIndex;
  case ADirection of
    TFocusDirection.fdUp:
      Dec(LIndex, CellsInfo.CountInRow);
    TFocusDirection.fdDown:
      Inc(LIndex, CellsInfo.CountInRow);
    TFocusDirection.fdLeft:
      Dec(LIndex);
    TFocusDirection.fdRight:
      Inc(LIndex);
    TFocusDirection.fdPageUp:
      Dec(LIndex, CellsInfo.CountInCol * CellsInfo.CountInRow);
    TFocusDirection.fdPageDown:
      Inc(LIndex, CellsInfo.CountInCol * CellsInfo.CountInRow);
  end;

  LNewDate := IncYear(StartDate, LIndex * 10);
  LNewDate := AController.LimitDate(LNewDate);

  CellsInfo.DisplayFocused := True;
  AController.SetFocusedDate(LNewDate);
end;

function TCalendarViewDecadeViewInfo.GetDisplayMode: TDisplayMode;
begin
  Result := TDisplayMode.dmDecade;
end;

//resourcestring
const
  sDecadeViewHeader = '%d - %d';

function TCalendarViewDecadeViewInfo.GetHeaderText: string;
var
  Year, Month, Day: Word;
  ActualYear, DecadeStartYear, DecadeEndYear: Integer;
begin
  ActualYear := FormatDateTime(GetSpecialFormat(tYearNumber), ActualDate).ToInteger;
  DecodeDate(ActualDate, Year, Month, Day);
  DecadeStartYear := ActualYear div 10 * 10;

  // one day before 10 years later
  DecadeEndYear := FormatDateTime(GetSpecialFormat(tYearNumber),
    EncodeDate(Year - (ActualYear - DecadeStartYear) + 10, 1, 1) -1).ToInteger;
  if DecadeStartYear = 0 then Inc(DecadeStartYear); // avoid year 0.
  Result := Format(sDecadeViewHeader, [DecadeStartYear, DecadeEndYear]);
end;

function TCalendarViewDecadeViewInfo.GetNextDate: TDate;
begin
  Result := IncYear(StartDate, 10 * CellsInfo.CountInCol * CellsInfo.CountInRow);
end;

procedure TCalendarViewDecadeViewInfo.Navigate(AForward: Boolean);
var
  LStartDate: TDate;
  LCorrectedDate: TDate;
  LPrevStartDate: TDate;
begin
  LPrevStartDate := StartDate;
  LStartDate := IncYear(StartOfTheYear(LPrevStartDate), IfThen(AForward, 1, -1) * CellsInfo.CountInRow);

  LCorrectedDate := Controller.LimitDate(LStartDate);
  if YearOf(LStartDate) <> YearOf(LCorrectedDate) then
  begin
    // limited move
    Exit;
  end;

  AnimateAndSet(AForward, False, LPrevStartDate, LStartDate, LStartDate);
end;

{ TCalendarViewController }

constructor TCalendarViewController.Create(ACalendarView: TCustomCalendarView);
begin
  inherited Create;
  FCalendarView := ACalendarView;
end;

destructor TCalendarViewController.Destroy;
begin
  FreeAndNil(FAnimation);
  inherited;
end;

procedure TCalendarViewController.AnimateNavigation(AImage: TBitmap; AForward: Boolean);
var
  LViewInfo: TCalendarViewViewInfoBase;
  LAnimation: TSlideCalendarAnimation;
begin
  FreeAndNil(FAnimation);

  LViewInfo := FCalendarView.NeedCurrentViewInfo;

  LAnimation := TSlideCalendarAnimation.Create;
  FAnimation := LAnimation;

  if AForward then
    LAnimation.Direction := TSlideDirection.sdUp
  else
    LAnimation.Direction := TSlideDirection.sdDown;

  LAnimation.Duration := 250;
  LAnimation.Interval := 10;
  LAnimation.AnimateBitmap := AImage;
  LAnimation.Destination := FCalendarView.Canvas;
  LAnimation.DestinationRect := LViewInfo.CellsInfo.GlobalRect;
  LAnimation.OnFinished := AnimationFinished;

  LAnimation.StartDefault;
end;

procedure TCalendarViewController.AnimateViewChange(APrevImage: TBitmap; ANewImage: TBitmap; const ASourceRect: TRect;
  const ADestRect: TRect; AZoomOut: Boolean);
var
  LColor: TColor;
  LAnimation: TZoomCalendarAnimation;
begin
  FreeAndNil(FAnimation);

  LAnimation := TZoomCalendarAnimation.Create;
  FAnimation := LAnimation;

  LAnimation.Duration := 250;
  LAnimation.Interval := 10;

  FCalendarView.NeedDrawer.PrepareCalendarBackground(LColor, True);

  LAnimation.BackColor := LColor;
  LAnimation.PrevImage := APrevImage;
  LAnimation.NewImage := ANewImage;
  LAnimation.DestinationRect := ADestRect;
  LAnimation.SourceRect := ASourceRect;
  LAnimation.Destination := FCalendarView.Canvas;;
  LAnimation.OnFinished := AnimationFinished;
  if (AZoomOut) then
    LAnimation.ZoomMode := TZoomMode.zmOut
  else
    LAnimation.ZoomMode := TZoomMode.zmIn;

  FAnimation := LAnimation;
  FAnimation.StartDefault;
end;

procedure TCalendarViewController.AnimationFinished(Sender: TObject);
begin
  FCalendarView.Invalidate;
end;

function TCalendarViewController.CanSetDisplayDate(ADate: TDate): Boolean;
begin
  Result := FCalendarView.CanSetDisplayDate(ADate);
end;

procedure TCalendarViewController.ClearFocusedItems;
begin
  FCalendarView.ClearFocusedItems;
end;

procedure TCalendarViewController.ClickOnDate(ADate: TDate);
begin
  FCalendarView.ClickOnDate(ADate);
end;

function TCalendarViewController.GetBorderColor: TColor;
begin
  Result := FCalendarView.BorderColor;
end;

function TCalendarViewController.GetBorderSize: Integer;
begin
  Result := FCalendarView.BorderSize;
end;

function TCalendarViewController.GetColor: TColor;
begin
  Result := FCalendarView.Color;
end;

function TCalendarViewController.GetCurrentPPI: Integer;
begin
  Result := FCalendarView.GetParentCurrentDpi;
end;

function TCalendarViewController.GetDisplayMode: TDisplayMode;
begin
  Result := FCalendarView.DisplayMode;
end;

function TCalendarViewController.GetDrawer: TCalendarViewDrawer;
begin
  Result := FCalendarView.NeedDrawer;
end;

function TCalendarViewController.GetEnabled: Boolean;
begin
  Result := FCalendarView.Enabled;
end;

function TCalendarViewController.GetFirstDayOfWeek: TDaysOfWeek;
begin
  Result := FCalendarView.FirstDayOfWeek;
end;

function TCalendarViewController.GetFont: TFont;
begin
  Result := FCalendarView.Font;
end;

function TCalendarViewController.GetHighlightToday: Boolean;
begin
  Result := FCalendarView.HighlightToday;
end;

function TCalendarViewController.GetLastFocusedItem: Integer;
begin
  Result := FCalendarView.FLastFocusedItemIndex;
end;

function TCalendarViewController.GetNumberOfWeeksInView: TItemsInRow;
begin
  Result := FCalendarView.NumberOfWeeksInView;
end;

function TCalendarViewController.GetOnDrawDayItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawDayItem;
end;

function TCalendarViewController.GetOnDrawMonthItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawMonthItem;
end;

function TCalendarViewController.GetOnDrawYearItem: TDrawViewInfoEvent;
begin
  Result := FCalendarView.OnDrawYearItem;
end;

function TCalendarViewController.GetOwner: TObject;
begin
  Result := FCalendarView;
end;

function TCalendarViewController.GetShowDayOfWeek: Boolean;
begin
  Result := FCalendarView.ShowDayOfWeek;
end;

function TCalendarViewController.IsDateSelected(const ADate: TDate): Boolean;
begin
  Result := FCalendarView.IsDateSelected(ADate);
end;

function TCalendarViewController.LimitDate(const ADate: TDate): TDate;
begin
  Result := FCalendarView.LimitDate(ADate);
end;

procedure TCalendarViewController.Navigate(AForward: Boolean);
begin
  FCalendarView.NeedCurrentViewInfo.Navigate(AForward);
end;

procedure TCalendarViewController.SetDisplayDate(const Value: TDate);
begin
  FCalendarView.SetDisplayDate(Value);
end;

procedure TCalendarViewController.SetDisplayMode(const Value: TDisplayMode);
begin
  FCalendarView.DisplayMode := Value;
end;

procedure TCalendarViewController.SetFocusedDate(const ADate: TDate);
begin
  FCalendarView.Invalidate;
end;

procedure TCalendarViewController.SetLastFocusedItem(const Value: Integer);
begin
  FCalendarView.FLastFocusedItemIndex := Value;
end;

{ TViewInfoUtils }

class function TViewInfoUtils.GetLocalBounds(const AItems: array of TCalendarViewInfoBase): TRect;
var
  i: Integer;
begin
  Result := TRect.Empty;
  for i := 0 to Length(AItems) - 1 do
    Result.Union(AItems[i].LocalRect);
end;

{ TCalendarCellItemsMonthlyViewInfo }

function TCalendarCellItemsMonthlyViewInfo.ItemIsFirstOfGroup(ADate: TDate): Boolean;
begin
  Result := DayOfTheMonth(ADate) = 1;
end;

function TCalendarCellItemsMonthlyViewInfo.ItemIsInCurrentRange(ADate: TDate): Boolean;
var
  ACurrent: TDate;
begin
  if (ADate < StartDate) or (ADate >= StartDate + CountInCol * CountInRow) then
    Exit(False);

  if (StartOfTheMonth(StartDate) = StartDate) then
    ACurrent := StartDate
  else
    ACurrent := StartOfTheMonth(StartDate + CountInRow);

  Result := MonthOf(ACurrent) = MonthOf(ADate);
end;

{ TCalendarCellItemsYearlyViewInfo }

function TCalendarCellItemsYearlyViewInfo.ItemIsFirstOfGroup(ADate: TDate): Boolean;
begin
  Result := MonthOfTheYear(ADate) = 1;
end;

function TCalendarCellItemsYearlyViewInfo.ItemIsInCurrentRange(ADate: TDate): Boolean;
begin
  Result := YearOf(ActualDate) = YearOf(ADate);
end;

{ TCalendarCellItemsDecadeViewInfo }

function TCalendarCellItemsDecadeViewInfo.ItemIsFirstOfGroup(ADate: TDate): Boolean;
var
  Year, Month, Day: Word;
  DecadeStart, DecadeEnd: TDate;
  ActualYear: Integer;
begin
  ActualYear := FormatDateTime(GetSpecialFormat(tYearNumber), ActualDate).ToInteger;

  DecodeDate(ActualDate, Year, Month, Day);
  Year := Year - (ActualYear mod 10); // recalculate Gregorian calendar year
  DecadeStart := EncodeDate(Year, 1, 1);
  // a years later
  DecadeEnd := EncodeDate(Year + 1, 1, 1);

  Result := (DecadeStart <= ADate) and (ADate < DecadeEnd);
end;

function TCalendarCellItemsDecadeViewInfo.ItemIsInCurrentRange(ADate: TDate): Boolean;
var
  Year, Month, Day: Word;
  DecadeStart, DecadeEnd: TDate;
  ActualYear: Integer;
begin
  ActualYear := FormatDateTime(GetSpecialFormat(tYearNumber), ActualDate).ToInteger;

  DecodeDate(ActualDate, Year, Month, Day);
  Year := Year - (ActualYear mod 10); // recalculate Gregorian calendar year
  DecadeStart := EncodeDate(Year, 1, 1);
  // 10 years later
  DecadeEnd := EncodeDate(Year + 10, 1, 1);

  Result := (DecadeStart <= ADate) and (ADate < DecadeEnd);
end;

procedure TPopupCalendarView.CMMouseActivate(var Message: TCMMouseActivate);
begin
  Message.Result := MA_NOACTIVATE;
end;

procedure TPopupCalendarView.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := (Params.Style or WS_POPUP) and (not WS_CHILD);
  Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;

function TPopupCalendarView.TabIsCyclic: Boolean;
begin
  Result := True;
end;

{ TCalendarViewDrawerNative }

constructor TCalendarViewDrawerNative.Create(const ACalendarView: TCustomCalendarView);
begin
  inherited;
  FButtonBitmap := TBitmap.Create;
  LoadImage;
end;

destructor TCalendarViewDrawerNative.Destroy;
begin
  FreeAndNil(FButtonBitmap);
  inherited;
end;

procedure TCalendarViewDrawerNative.DrawCalendarPicker(ADrawParams: TDrawParams; ACanvas: TCanvas;
    ACalendarPicker: TCustomCalendarPicker; ABorderSize, AIconSize: Integer);
var
  TextRect, ButtonRect: TRect;
  TextAttr: TTextFormat;
  Text: string;
begin
  ACanvas.Brush.Color := ADrawParams.BkColor;
  ACanvas.Pen.Width := ABorderSize;
  ACanvas.Pen.Style := psInsideFrame;
  ACanvas.Pen.Color := ADrawParams.ForegroundColor;
  ACanvas.Rectangle(0, 0, ADrawParams.DrawRect.Width, ADrawParams.DrawRect.Height);

  if ACalendarPicker.IsEmpty then
    Text := ACalendarPicker.TextHint
  else
    Text := FormatDateTime(ACalendarPicker.DateFormat, ACalendarPicker.Date);

  TextAttr := [tfCenter, tfVerticalCenter, tfSingleLine];
  if FCalendarView.UseRightToLeftAlignment then
    TextAttr := TextAttr + [tfRight, tfRtlReading] - [tfLeft];
  TextRect := Rect(ABorderSize, ABorderSize, ADrawParams.DrawRect.Width - AIconSize - ABorderSize * 2,
    ADrawParams.DrawRect.Height - ABorderSize * 2);
  ACanvas.Font.Assign(ADrawParams.Font);
  ACanvas.TextRect(TextRect, Text, TextAttr);

  ButtonRect := ADrawParams.DrawRect;
  ButtonRect.Inflate(-ABorderSize * 2, -ABorderSize * 2);
  ButtonRect.Left := ADrawParams.DrawRect.Right - AIconSize;

  ACanvas.CopyMode := cmMergeCopy;
  ACanvas.CopyRect(ButtonRect, FButtonBitmap.Canvas,
    Rect(0, 0, CalendarPickerIconSize, CalendarPickerIconSize));
end;

procedure TCalendarViewDrawerNative.LoadImage;
begin
  FButtonBitmap.LoadFromResourceName(HInstance, 'CALENDAR_PICKER_BUTTON'); // do not localize
end;

initialization
  InitCalendarFormatTable;
end.
