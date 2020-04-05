{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.WinXPickers;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Generics.Collections,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Forms;

const
  DefaultPickerWidth = 150;
  DefaultPickerHeight = 32;
  DefaultPickerDropDownCount = 7;
  DefaultPickerHotColor = clBtnHighlight;
  DefaultPickerHighlightColor = clBtnFace;
  DefaultPickerSelectionColor = clHighlight;
  DefaultPickerSelectionFontColor = clHighlightText;

type
  TPickerPopupControl = class;
  TPickerCellDrawInfo = class;
  TBasePickerControl = class;

  /// <summary>
  ///   TDrawPickerCellEvent represents the method type used for cell draw events in picker based controls.
  /// </summary>
  TDrawPickerCellEvent = procedure(Sender: TObject; PickerCellDrawInfo: TPickerCellDrawInfo) of object;

  TPickerButtonState = (pbsNone, pbsHot, pbsPressed);
  TPickerButtonType = (pbtNone, pbtUp, pbtDown, pbtOk, pbtCancel);
  TMinuteIncrement = 1 .. 30;

  /// <summary>
  ///   Support class used to represent a scroll button in a picker column.
  /// </summary>
  TPickerButton = class
  strict private
    FBoundsRect: TRect;
    FButtonType: TPickerButtonType;
    FState: TPickerButtonState;
  public
    property BoundsRect: TRect read FBoundsRect write FBoundsRect;
    property ButtonType: TPickerButtonType read FButtonType write FButtonType;
    property State: TPickerButtonState read FState write FState;
  end;

  /// <summary>
  ///   Abstract class that represents a data column in a picker-based control.
  /// </summary>
  TPickerColumn = class abstract
  strict private
    FBounds: TRect;
    FDownButton: TPickerButton;
    FDrawOffset: Integer;
    FDropDownBounds: TRect;
    FUpButton: TPickerButton;
    procedure SetDrawOffset(Value: Integer);
  strict protected
    function GetCurrentValue: Integer; virtual; abstract;
    procedure SetCurrentValue(Value: Integer); virtual; abstract;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function CalcNextValue(Value: Integer; out NewNextValue: Integer; Delta: Integer): Integer; virtual;
    function GetCyclicValue(Value: Integer): Integer; virtual;
    function GetMaxValue: Integer; virtual; abstract;
    function GetMinSize(Canvas: TCanvas; Font: TFont): TSize; virtual;
    function GetMinValue: Integer; virtual; abstract;
    function GetValueString(Value: Integer): string; virtual;
    function IsCyclic: Boolean; virtual;
    function LimitValue(Value: Integer): Integer; virtual;
    function NextValue(Value: Integer; out NextValue: Integer): Boolean; virtual;
    function PreviousValue(Value: Integer; out PrevValue: Integer): Boolean; virtual;
    property Bounds: TRect read FBounds write FBounds;
    property CurrentValue: Integer read GetCurrentValue write SetCurrentValue;
    property DownButton: TPickerButton read FDownButton write FDownButton;
    property DrawOffset: Integer read FDrawOffset write SetDrawOffset;
    property DropDownBounds: TRect read FDropDownBounds write FDropDownBounds;
    property UpButton: TPickerButton read FUpButton write FUpButton;
  end;

  TPickerColumnClass = class of TPickerColumn;

  IDateProvider = interface
    ['{DA63E195-F908-471E-84A7-471D47430EC7}']
    function GetDate: TDate;
    function GetMaxYear: Integer;
    function GetMinYear: Integer;
    procedure SetDate(Value: TDate);
    procedure SetMaxYear(Value: Integer);
    procedure SetMinYear(Value: Integer);
    property Date: TDate read GetDate write SetDate;
    property MaxYear: Integer read GetMaxYear write SetMaxYear;
    property MinYear: Integer read GetMinYear write SetMinYear;
  end;

  ITimeProvider = interface
    ['{F73D637B-8A48-49EF-9D5A-51B4C8E933F4}']
    function GetMinutesIncrement: TMinuteIncrement;
    function GetTime: TTime;
    function GetUseAmPm: Boolean;
    procedure SetMinutesIncrement(Value: TMinuteIncrement);
    procedure SetTime(Value: TTime);
    procedure SetUseAmPm(Value: Boolean);
    property MinutesIncrement: TMinuteIncrement read GetMinutesIncrement write SetMinutesIncrement;
    property Time: TTime read GetTime write SetTime;
    property UseAmPm: Boolean read GetUseAmPm write SetUseAmPm;
  end;

  TDateProvider = class(TInterfacedObject, IDateProvider)
  strict private
    FDate: TDate;
    FMaxYear: Integer;
    FMinYear: Integer;
    function GetDate: TDate;
    function GetMaxYear: Integer;
    function GetMinYear: Integer;
    procedure SetDate(Value: TDate);
    procedure SetMaxYear(Value: Integer);
    procedure SetMinYear(Value: Integer);
  public
    property Date: TDate read GetDate write SetDate;
    property MaxYear: Integer read GetMaxYear write SetMaxYear;
    property MinYear: Integer read GetMinYear write SetMinYear;
  end;

  TTimeProvider = class(TInterfacedObject, ITimeProvider)
  strict private
    FMinutesIncrement: TMinuteIncrement;
    FTime: TTime;
    FUseAmPm: Boolean;
    function GetMinutesIncrement: TMinuteIncrement;
    function GetTime: TTime;
    function GetUseAmPm: Boolean;
    procedure SetMinutesIncrement(Value: TMinuteIncrement);
    procedure SetTime(Value: TTime);
    procedure SetUseAmPm(Value: Boolean);
  public
    property MinutesIncrement: TMinuteIncrement read GetMinutesIncrement write SetMinutesIncrement;
    property Time: TTime read GetTime write SetTime;
    property UseAmPm: Boolean read GetUseAmPm write SetUseAmPm;
  end;

  /// <summary>
  ///   Base class for date-related picker columns.
  /// </summary>
  TDateColumn = class(TPickerColumn)
  strict private
    FDateProvider: IDateProvider;
    function GetActualDate: TDate;
    procedure SetActualDate(Value: TDate);
  public
    constructor Create(const DateProvider: IDateProvider); reintroduce; virtual;
    property ActualDate: TDate read GetActualDate write SetActualDate;
    property DateProvider: IDateProvider read FDateProvider;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the month portion of a date.
  /// </summary>
  TPickerMonthColumn = class(TDateColumn)
  strict private
    FMonthFormat: string;
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    property MonthFormat: string read FMonthFormat write FMonthFormat;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the day portion of a date.
  /// </summary>
  TPickerDayColumn = class(TDateColumn)
  strict private
    FDaysFormat: string;
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    property DaysFormat: string read FDaysFormat write FDaysFormat;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the year portion of a date.
  /// </summary>
  TPickerYearColumn = class(TDateColumn)
  strict private
    FYearFormat: string;
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    function IsCyclic: Boolean; override;
    property YearFormat: string read FYearFormat write FYearFormat;
  end;

  /// <summary>
  ///   Base class for time-related picker columns.
  /// </summary>
  TTimeColumn = class(TPickerColumn)
  strict private
    FTimeProvider: ITimeProvider;
    function GetActualTime: TTime;
    procedure SetActualTime(Value: TTime);
  public
    constructor Create(const TimeProvider: ITimeProvider); reintroduce; virtual;
    property ActualTime: TTime read GetActualTime write SetActualTime;
    property TimeProvider: ITimeProvider read FTimeProvider;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the hour portion of a time.
  /// </summary>
  TPickerHourColumn = class(TTimeColumn)
  strict private
    FHourFormat: string;
    procedure SetHourFormat(const Value: string);
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    property HourFormat: string read FHourFormat write SetHourFormat;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the minute portion of a time.
  /// </summary>
  TPickerMinuteColumn = class(TTimeColumn)
  strict private
    FMinuteFormat: string;
    procedure SetMinuteFormat(const Value: string);
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    function NextValue(Value: Integer; out NextValue: Integer): Boolean; override;
    function PreviousValue(Value: Integer; out PrevValue: Integer): Boolean; override;
    property MinuteFormat: string read FMinuteFormat write SetMinuteFormat;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the second portion of a time.
  /// </summary>
  TPickerSecondColumn = class(TTimeColumn)
  strict private
    FSecondFormat: string;
    procedure SetSecondFormat(const Value: string);
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    property SecondFormat: string read FSecondFormat write SetSecondFormat;
  end;

  /// <summary>
  ///   TPickerColumn descendant for handling the AM/PM portion of a time.
  /// </summary>
  TPickerAMPMColumn = class(TTimeColumn)
  strict private
    FAm: Boolean;
    FAMPMFormat: string;
    procedure SetAMPMFormat(const Value: string);
  strict protected
    function GetCurrentValue: Integer; override;
    procedure SetCurrentValue(Value: Integer); override;
  public
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetValueString(Value: Integer): string; override;
    function IsCyclic: Boolean; override;
    property AMPMFormat: string read FAMPMFormat write SetAMPMFormat;
  end;

  /// <summary>
  ///   Support class to manage visualization attributes of the picker.
  /// </summary>
  TPickerViewInfo = class
  private
    FBorderColor: TColor;
    FBorderSize: Integer;
    FColor: TColor;
    FDropDownCount: Integer;
    FFont: TFont;
    FHighlightColor: TColor;
    FItemHeight: Integer;
    FShowOkCancel: Boolean;
    procedure SetFont(Value: TFont);
  public
    constructor Create;
    destructor Destroy; override;

    property BorderColor: TColor read FBorderColor write FBorderColor;
    property BorderSize: Integer read FBorderSize write FBorderSize;
    property Color: TColor read FColor write FColor;
    property DropDownCount: Integer read FDropDownCount write FDropDownCount;
    property Font: TFont read FFont write SetFont;
    property HighlightColor: TColor read FHighlightColor write FHighlightColor;
    property ItemHeight: Integer read FItemHeight write FItemHeight;
    property ShowOkCancel: Boolean read FShowOkCancel write FShowOkCancel;
  end;

  /// <summary>
  ///   Support class that represents the elements necessary to draw a picker column cell.
  /// </summary>
  TPickerCellDrawInfo = class
  strict private
    FBounds: TRect;
    FColor: TColor;
    FFont: TFont;
    FHighlightColor: TColor;
    FHighlighted: Boolean;
    FText: string;
    procedure SetFont(Value: TFont);
  public
    constructor Create;
    destructor Destroy; override;
    property Bounds: TRect read FBounds write FBounds;
    property Color: TColor read FColor write FColor;
    property Font: TFont read FFont write SetFont;
    property HighlightColor: TColor read FHighlightColor write FHighlightColor;
    property Highlighted: Boolean read FHighlighted write FHighlighted;
    property Text: string read FText write FText;
  end;

  TPickerCellDrawInfoInternal = class(TPickerCellDrawInfo)
  strict private
    FBorderColor: TColor;
    FBorderSize: Integer;
    FSelected: Boolean;
  public
    property BorderColor: TColor read FBorderColor write FBorderColor;
    property BorderSize: Integer read FBorderSize write FBorderSize;
    property Selected: Boolean read FSelected write FSelected;
  end;

  /// <summary>
  ///   Support class that represents the elements necessary to draw a picker button.
  /// </summary>
  TPickerButtonDrawInfo = class
  strict private
    FBorderWidth: Integer;
    FButton: TPickerButton;
    FColor: TColor;
    FForegroundColor: TColor;
    FPenWidth: Integer;
    function GetButtonType: TPickerButtonType;
  public
    property BorderWidth: Integer read FBorderWidth write FBorderWidth;
    property Button: TPickerButton read FButton write FButton;
    property ButtonType: TPickerButtonType read GetButtonType;
    property Color: TColor read FColor write FColor;
    property ForegroundColor: TColor read FForegroundColor write FForegroundColor;
    property PenWidth: Integer read FPenWidth write FPenWidth;
  end;

  TPickerOkCancelButtons = class
  private
    FBounds: TRect;
    FCancelButton: TPickerButton;
    FOkButton: TPickerButton;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Calculate(Rect: TRect; ItemHeight, BorderWidth: Integer);
    property Bounds: TRect read FBounds write FBounds;
    property CancelButton: TPickerButton read FCancelButton write FCancelButton;
    property OkButton: TPickerButton read FOkButton write FOkButton;
  end;

  /// <summary>
  ///   Abstract class that defines the various methods necessary to draw a picker control.
  /// </summary>
  TPickerDrawer = class abstract
  strict protected
    FPickerControl: TBasePickerControl;
    function MiddleColor(Color1, Color2: TColor; Coeff: Double = 0.5): TColor;
  public
    constructor Create(Picker: TBasePickerControl); virtual;
    procedure DrawCell(Canvas: TCanvas; DrawInfo: TPickerCellDrawInfoInternal); virtual;
    procedure DrawOkCancel(Canvas: TCanvas; Buttons: TPickerOkCancelButtons;
      DrawInfo: TPickerButtonDrawInfo; BorderColor: TColor); virtual;
    procedure DrawPickerBorder(Canvas: TCanvas; BorderWidth: Integer;
      PickerColumn: TPickerColumn; BorderColor: TColor); virtual;
    procedure DrawPickerButton(Canvas: TCanvas; DrawInfo: TPickerButtonDrawInfo); virtual;
    procedure DrawPickerCell(Canvas: TCanvas; DrawInfo: TPickerCellDrawInfoInternal); virtual;
    procedure DrawPickerColumn(Canvas: TCanvas; DrawRect: TRect; Color: TColor);
    procedure DrawSelectedRect(Canvas: TCanvas; var DrawRect: TRect; BorderWidth: Integer);
    function GetBorderColor(Hot, Pressed: Boolean): TColor; virtual;
    function GetButtonColor(Hot, Pressed: Boolean): TColor; virtual;
    function GetButtonFontColor(Hot, Pressed: Boolean): TColor; virtual;
    function GetColor(Hot, Pressed, Enabled: Boolean): TColor; virtual;
    function GetFontColor: TColor; virtual;
    function GetHighlightColor: TColor; virtual;
    function GetPopupColor: TColor; virtual;
    function GetSelectionColor: TColor; virtual;
    function GetSelectionFontColor: TColor; virtual;
  end;

  /// <summary>
  ///   TPickerDrawer descendant class that is used to draw a picker control when not using a custom VCL style.
  /// </summary>
  TPickerDrawerNative = class(TPickerDrawer)
  end;

  /// <summary>
  ///   TPickerDrawer descendant class that is used to draw a picker control when using a custom VCL style.
  /// </summary>
  TPickerDrawerStyled = class(TPickerDrawer)
  public
    function GetBorderColor(Hot, Pressed: Boolean): TColor; override;
    function GetButtonColor(Hot, Pressed: Boolean): TColor; override;
    function GetButtonFontColor(Hot, Pressed: Boolean): TColor; override;
    function GetColor(Hot, Pressed, Enabled: Boolean): TColor; override;
    function GetFontColor: TColor; override;
    function GetHighlightColor: TColor; override;
    function GetPopupColor: TColor; override;
    function GetSelectionColor: TColor; override;
    function GetSelectionFontColor: TColor; override;
  end;

  /// <summary>
  ///   Base class that defines basic behavior of a picker style control.
  /// </summary>
  TBasePickerControl = class abstract(TCustomControl)
  strict private
    FBorderColor: TColor;
    FBorderStyle: TBorderStyle;
    FDropDownCount: Integer;
    FDroppedDown: Boolean;
    FHighlightColor: TColor;
    FHotColor: TColor;
    FHot: Boolean;
    FOnChange: TNotifyEvent;
    FOnCloseUp: TNotifyEvent;
    FOnDrawCell: TDrawPickerCellEvent;
    FOnDrawPickerCell: TDrawPickerCellEvent;
    FPopupColor: TColor;
    FPressed: Boolean;
    FSelectionColor: TColor;
    FSelectionFontColor: TColor;
    FShowOkCancel: Boolean;
    procedure SetBorderColor(Value: TColor);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetDropDownCount(Value: Integer);
    procedure SetHighlightColor(Value: TColor);
    procedure SetHot(Value: Boolean);
    procedure SetHotColor(Value: TColor);
    procedure SetPopupColor(Value: TColor);
    procedure SetPressed(Value: Boolean);
    procedure SetSelectionColor(Value: TColor);
    procedure SetSelectionFontColor(Value: TColor);
    procedure SetShowOkCancel(Value: Boolean);
    property Hot: Boolean read FHot write SetHot;
    property Pressed: Boolean read FPressed write SetPressed;

    procedure CMCancelMode(var Msg: TCMCancelMode); message CM_CANCELMODE;
    procedure CMDialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure CMStyleChanged(var Msg: TMessage); message CM_STYLECHANGED;
    procedure CNKeyDown(var Msg: TMessage); message CN_KEYDOWN;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
  protected const
    DefaultBorderColor = clBtnShadow;
    DefaultPopupColor = clWindow;
    DefaultFontSize = 12;
  protected
    FBorderSize: Integer;
    FColumns: TObjectList<TPickerColumn>;
    FDrawer: TPickerDrawer;
    FPopupControl: TPickerPopupControl;

    procedure AcceptDropDown; virtual; abstract;
    procedure AdjustSize; override;
    function CalcSizes(MinSize: TSize): TSize;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure Click; override;
    function CreateDrawer: TPickerDrawer; virtual;
    procedure CreateWnd; override;
    procedure DefineColumns(Columns: TList<TPickerColumn>); virtual; abstract;
    procedure InitColumns; virtual; abstract;
    procedure InitPopup;
    procedure DoDrawPickerCell(Sender: TObject; PickerCellDrawInfo: TPickerCellDrawInfo);
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure DoOnChange;
    function GetColumnByClass<T: TPickerColumn>: T;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function NeedDrawer: TPickerDrawer;
    procedure Paint; override;
    procedure ParseFormat(const Format: string); virtual; abstract;
    procedure RejectDropDown; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary>
    ///   Call CanModify to determine if the picker control can be modified.
    /// </summary>
    function CanModify: Boolean; virtual;
    /// <summary>
    ///   Use this method to close up the popup picker columns.
    /// </summary>
    /// <param name="Accept">
    ///   When True, use the currently selected column values to set the underlying data value. When False, reset the
    ///   underlying data value to the value before the popup was invoked.
    /// </param>
    procedure CloseUp(Accept: Boolean);
    /// <summary>
    ///   Use this method to programmatically display the popup columns for the picker control.
    /// </summary>
    procedure DropDown;

    /// <summary>
    ///   Specifies the color of the border.
    /// </summary>
    property BorderColor: TColor read FBorderColor write SetBorderColor default DefaultBorderColor;
    /// <summary>
    ///   Specifies the style of the border: single or none.
    /// </summary>
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    /// <summary>
    ///   Specifies the number of cells displayed in each picker column when the popup is visible.
    /// </summary>
    property DropDownCount: Integer read FDropDownCount write SetDropDownCount default DefaultPickerDropDownCount;
    /// <summary>
    ///   Specifies the color used when highlighting a cell.
    /// </summary>
    property HighlightColor: TColor read FHighlightColor write SetHighlightColor default DefaultPickerHighlightColor;
    /// <summary>
    ///   Specifies the background color of the cells when the control has focus or the mouse is positioned over the
    ///   control.
    /// </summary>
    property HotColor: TColor read FHotColor write SetHotColor default DefaultPickerHotColor;
    /// <summary>
    ///   Specifies the background color of the popup panel.
    /// </summary>
    property PopupColor: TColor read FPopupColor write SetPopupColor default DefaultPopupColor;
    /// <summary>
    ///   Specifies the color of the currently selected column values.
    /// </summary>
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor default DefaultPickerSelectionColor;
    /// <summary>
    ///   Specifies the color of the font for the currently selected column values
    /// </summary>
    property SelectionFontColor: TColor read FSelectionFontColor write SetSelectionFontColor default DefaultPickerSelectionFontColor;
    /// <summary>
    ///   Specifies whether OK and Cancel buttons are visible on the popup panel.
    /// </summary>
    property ShowOkCancel: Boolean read FShowOkCancel write SetShowOkCancel default True;

    /// <summary>
    ///   Occurs when the underlying data value represented by the picker control changes.
    /// </summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    /// <summary>
    ///   Occurs when the popup panel is closed.
    /// </summary>
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    /// <summary>
    ///   Occurs when a cell needs to be drawn and the popup panel is not visible.
    /// </summary>
    property OnDrawCell: TDrawPickerCellEvent read FOnDrawCell write FOnDrawCell;
    /// <summary>
    ///   Occurs when a popup column cell needs to be drawn.
    /// </summary>
    property OnDrawPickerCell: TDrawPickerCellEvent read FOnDrawPickerCell write FOnDrawPickerCell;
  end;

  /// <summary>
  ///   TCustomDatePicker defines the base functionality of a date picker.
  /// </summary>
  TCustomDatePicker = class(TBasePickerControl)
  strict private
    FDate: TDate;
    FDateFormat: string;
    FDateProvider: IDateProvider;
    function GetDate: TDate;
    function GetDateFromColumns: TDate;
    function GetDayVisible: Boolean;
    function GetMaxYear: Integer;
    function GetMinYear: Integer;
    function GetMonthVisible: Boolean;
    function GetYearVisible: Boolean;
    procedure SetDate(Value: TDate);
    procedure SetDateFormat(const Value: string);
    procedure SetDateToColumns(Value: TDate);
    procedure SetMaxYear(Value: Integer);
    procedure SetMinYear(Value: Integer);
  protected
    procedure DefineColumns(Columns: TList<TPickerColumn>); override;
    procedure InitColumns; override;
    procedure AcceptDropDown; override;
    procedure RejectDropDown; override;
    procedure ParseFormat(const Format: string); override;
  protected const
    DefaultMinYear = 1900;
    DefaultMaxYear = 3000;
  public
    constructor Create(AOwner: TComponent); override;

    /// <summary>
    ///   Specifies the date value of the picker control.
    /// </summary>
    property Date: TDate read GetDate write SetDate;
    /// <summary>
    ///   Specifies the format of the date elements used to define which columns are visible.
    /// </summary>
    property DateFormat: string read FDateFormat write SetDateFormat;
    /// <summary>
    ///   Use this property to determine if the day date element is a visible column in the date picker.
    /// </summary>
    property DayVisible: Boolean read GetDayVisible;
    /// <summary>
    ///   Specifies the maximum year that can be represented by the date picker. Default is 3000.
    /// </summary>
    property MaxYear: Integer read GetMaxYear write SetMaxYear default DefaultMaxYear;
    /// <summary>
    ///   Specifies the minimum year that can be represented by the date picker. Default is 1900.
    /// </summary>
    property MinYear: Integer read GetMinYear write SetMinYear default DefaultMinYear;
    /// <summary>
    ///   Use this property to determine if the month date element is a visible column in the date picker.
    /// </summary>
    property MonthVisible: Boolean read GetMonthVisible;
    /// <summary>
    ///   Use this property to determine if the year date element is a visible column in the date picker.
    /// </summary>
    property YearVisible: Boolean read GetYearVisible;
  end;

  /// <summary>
  ///   TCustomTimePicker defines the base functionality of a time picker.
  /// </summary>
  TCustomTimePicker = class(TBasePickerControl)
  strict private
    FTime: TTime;
    FTimeFormat: string;
    FTimeProvider: ITimeProvider;
    function GetMinuteIncrement: TMinuteIncrement;
    function GetTimeFromColumns: TTime;
    procedure SetMinuteIncrement(Value: TMinuteIncrement);
    procedure SetTime(Value: TTime);
    procedure SetTimeFormat(const Value: string);
    procedure SetTimeToColumns(Value: TTime);
  protected
    procedure DefineColumns(Columns: TList<TPickerColumn>); override;
    procedure InitColumns; override;
    procedure AcceptDropDown; override;
    procedure RejectDropDown; override;
    procedure ParseFormat(const Format: string); override;
  public
    constructor Create(AOwner: TComponent); override;

    /// <summary>
    ///   Specifies the granularity of minute values available in the minute column when the popup panel is visible.
    /// </summary>
    property MinuteIncrement: TMinuteIncrement read GetMinuteIncrement write SetMinuteIncrement default 1;
    /// <summary>
    ///   Specifies the time value of the picker control.
    /// </summary>
    property Time: TTime read FTime write SetTime;
    /// <summary>
    ///   Specifies the format of the time elements used to define which columns are visible.
    /// </summary>
    property TimeFormat: string read FTimeFormat write SetTimeFormat;
  end;

  /// <summary>
  ///   TDatePicker is a picker style control that allows the user to specify a date. Each element of the date (day,
  ///   month, year) is selected using a popup scrolling list of values appropriate for the date element.
  /// </summary>
  TDatePicker = class(TCustomDatePicker)
  published
    property Align;
    property Anchors;
    property BorderStyle;
    property Color default clWindow;
    property Date;
    property DateFormat;
    property DropDownCount;
    property Enabled;
    property Font;
    property Height default DefaultPickerHeight;
    property HighlightColor;
    property MaxYear;
    property MinYear;
    property PopupColor;
    property PopupMenu;
    property SelectionColor;
    property SelectionFontColor;
    property ShowHint;
    property ShowOkCancel;
    property StyleElements;
    property TabOrder;
    property TabStop default True;
    property Width default DefaultPickerWidth;

    property OnChange;
    property OnClick;
    property OnCloseUp;
    property OnDblClick;
    property OnDrawCell;
    property OnDrawPickerCell;
  end;

  /// <summary>
  ///   TTimePicker is a picker style control that allows the user to specify a time. Each element of the time (hour,
  ///   minute, second, am/pm) is selected using a popup scrolling list of values appropriate for the time element.
  /// </summary>
  TTimePicker = class(TCustomTimePicker)
  published
    property Align;
    property Anchors;
    property BorderStyle;
    property Color default clWindow;
    property DropDownCount;
    property Enabled;
    property Font;
    property Height default DefaultPickerHeight;
    property HighlightColor;
    property MinuteIncrement;
    property PopupColor;
    property PopupMenu;
    property SelectionColor;
    property SelectionFontColor;
    property ShowHint;
    property ShowOkCancel;
    property StyleElements;
    property TabOrder;
    property TabStop default True;
    property Time;
    property TimeFormat;
    property Width default DefaultPickerWidth;
    property OnChange;
    property OnClick;
    property OnCloseUp;
    property OnDblClick;
    property OnDrawCell;
    property OnDrawPickerCell;
  end;

  TBasePickerAnimation = class
  strict private
    FDuration: Cardinal;
    FInterval: Cardinal;
    FIsStarted: Boolean;
    FOnFinished: TNotifyEvent;
    FOnStarted: TNotifyEvent;
    FTimer: TTimer;
    FWhenStarted: Cardinal;
    procedure TimerTick(Sender: TObject);
  strict protected
    procedure Animate(Current: Cardinal); virtual; abstract;
    procedure DoOnFinish; virtual;
    procedure DoPrepare; virtual;
  public
    destructor Destroy; override;
    procedure Finish;
    procedure Start(Duration, Interval: Cardinal);
    procedure StartDefault;
    property Duration: Cardinal read FDuration write FDuration;
    property Interval: Cardinal read FInterval write FInterval;
    property IsStarted: Boolean read FIsStarted write FIsStarted;
    property WhenStarted: Cardinal read FWhenStarted;
    property OnFinished: TNotifyEvent read FOnFinished write FOnFinished;
    property OnStarted: TNotifyEvent read FOnStarted write FOnStarted;
  end;

  TPickerSlideAnimation = class(TBasePickerAnimation)
  strict private
    FCoef: Double;
    FColumn: TPickerColumn;
    FControl: TPickerPopupControl;
    FDelta: Integer;
    FNextValue: Integer;
  strict protected
    procedure Animate(Current: Cardinal); override;
    procedure DoOnFinish; override;
    procedure DoPrepare; override;
  public
    property Column: TPickerColumn read FColumn write FColumn;
    property Control: TPickerPopupControl read FControl write FControl;
    property Delta: Integer read FDelta write FDelta;
    property NextValue: Integer read FNextValue write FNextValue;
  end;

  /// <summary>
  ///   Support class that is used to manage the showing and hiding of the popup picker columns associated with a
  ///   picker control.
  /// </summary>
  TPickerPopupControl = class(TCustomControl)
  private
    FAnimation: TBasePickerAnimation;
    FBorderColor: TColor;
    FBorderSize: Integer;
    FColumns: TArray<TPickerColumn>;
    FDrawer: TPickerDrawer;
    FDropDownCount: Integer;
    FHighlightColor: TColor;
    FHotColor: TColor;
    FItemHeight: Integer;
    FMouseOver: Integer;
    FMouseOverPoint: TPoint;
    FMouseOverValue: Integer;
    FOkCancelButtons: TPickerOkCancelButtons;
    FOnDrawCell: TDrawPickerCellEvent;
    FParentOwner: TWinControl;
    FSelectionColor: TColor;
    FSelectionFontColor: TColor;
    FSelectRect: TRect;
    FShowOkCancel: Boolean;
    procedure AnimateColumnValueChanged(Column: TPickerColumn; NextValue, Delta: Integer);
    procedure Calculate;
    function GetCellValueByMousePos(Point: TPoint; out ResultValue, ResultDelta: Integer): Boolean;
    function GetColumnByMousePos(Point: TPoint): TPickerColumn;
    procedure SetBorderColor(Value: TColor);
    procedure SetDropDownCount(Value: Integer);
    procedure SetHighlightColor(Value: TColor);
    procedure SetHotColor(Value: TColor);
    procedure SetMouseOver(Value: Integer);
    procedure SetMouseOverPoint(Value: TPoint);
    procedure SetMouseOverValue(Value: Integer);
    procedure SetSelectionColor(Value: TColor);
    procedure SetSelectionFontColor(Value: TColor);
    procedure SetShowOkCancel(Value: Boolean);
    procedure UpdateHoverItems(Point: TPoint);

    procedure CMMouseActivate(var Msg: TCMMouseActivate); message CM_MOUSEACTIVATE;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure CNKeyDown(var Msg: TWMKeyDown); message CN_KEYDOWN;
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
  protected const
    ArrowWidth = 2;
    ScrollButtonHeight = 16;
  protected
    procedure DoDrawCell(Sender: TObject; PickerCellDrawInfo: TPickerCellDrawInfo);
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure PaintCell(Canvas: TCanvas; Rect: TRect; const Text: string;
      Drawer: TPickerDrawer; Highlighted, Selected: Boolean); virtual;
    procedure PaintColumn(Canvas: TCanvas; Column: TPickerColumn;
      Drawer: TPickerDrawer; ColumnIndex: Integer); overload; virtual;
    procedure PaintColumn(Column: TPickerColumn; Drawer: TPickerDrawer;
      ColumnIndex: Integer); overload; virtual;
    procedure PaintOkCancel(Canvas: TCanvas; Drawer: TPickerDrawer); virtual;
    property MouseOver: Integer read FMouseOver write SetMouseOver;
    property MouseOverPoint: TPoint read FMouseOverPoint write SetMouseOverPoint;
    property MouseOverValue: Integer read FMouseOverValue write SetMouseOverValue;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AnimationFinished(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Init(ParentOwner: TWinControl; Columns: TList<TPickerColumn>;
      ViewInfo: TPickerViewInfo; OnDrawEvent: TDrawPickerCellEvent; Drawer: TPickerDrawer);
    procedure PaintColumns(const Canvas: TCanvas; const Drawer: TPickerDrawer);

    property BorderColor: TColor read FBorderColor write SetBorderColor;
    property DropDownCount: Integer read FDropDownCount write SetDropDownCount default DefaultPickerDropDownCount;
    property HighlightColor: TColor read FHighlightColor write SetHighlightColor default DefaultPickerHighlightColor;
    property HotColor: TColor read FHotColor write SetHotColor default DefaultPickerHotColor;
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor default DefaultPickerSelectionColor;
    property SelectionFontColor: TColor read FSelectionFontColor write SetSelectionFontColor default DefaultPickerSelectionFontColor;
    property ShowOkCancel: Boolean read FShowOkCancel write SetShowOkCancel;
    property OnDrawCell: TDrawPickerCellEvent read FOnDrawCell write FOnDrawCell;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.DateUtils,
  System.Types,
  System.UIConsts,
  Vcl.Themes,
  Vcl.Styles,
  System.RegularExpressions;

{$WARN IMPLICIT_INTEGER_CAST_LOSS OFF}
{$WARN IMPLICIT_CONVERSION_LOSS OFF}

{ TPickerColumn }

constructor TPickerColumn.Create;
begin
  inherited;
  FUpButton := TPickerButton.Create;
  FUpButton.ButtonType := pbtUp;
  FDownButton := TPickerButton.Create;
  FDownButton.ButtonType := pbtDown;
end;

destructor TPickerColumn.Destroy;
begin
  FreeAndNil(FUpButton);
  FreeAndNil(FDownButton);
  inherited;
end;

function TPickerColumn.CalcNextValue(Value: Integer; out NewNextValue: Integer; Delta: Integer): Integer;
begin
  Result := 0;
  NewNextValue := Value;
  while Delta <> 0 do
  begin
    if Delta < 0 then
    begin
      if not PreviousValue(NewNextValue, NewNextValue) then
        Exit;
      Inc(Delta);
      Dec(Result);
    end
    else
    begin
      if not NextValue(NewNextValue, NewNextValue) then
        Exit;
      Dec(Delta);
      Inc(Result);
    end;
  end;
end;

function TPickerColumn.GetCyclicValue(Value: Integer): Integer;
var
  RangeSize, ModValue: Integer;
begin
  RangeSize := (GetMaxValue - GetMinValue) + 1;
  ModValue := (Value - GetMinValue) mod RangeSize;

  if ModValue < 0 then
    ModValue := RangeSize + ModValue;

  Result := ModValue + GetMinValue;
end;

function TPickerColumn.GetMinSize(Canvas: TCanvas; Font: TFont): TSize;
var
  Str: string;
  MinRect: TRect;
  Delta: Integer;
begin
  Str := GetValueString(GetMaxValue);
  MinRect := Rect(0, 0, 10, 10);
  DrawText(Canvas.Handle, PChar(Str), Str.Length, MinRect, DT_CALCRECT);
  Delta := MinRect.Height div 3;
  InflateRect(MinRect, Delta, Delta);
  Result := MinRect.Size;
end;

function TPickerColumn.GetValueString(Value: Integer): string;
begin
  Result := IntToStr(Value);
end;

function TPickerColumn.IsCyclic: Boolean;
begin
  Result := True;
end;

function TPickerColumn.LimitValue(Value: Integer): Integer;
begin
  Result := Min(GetMaxValue, Max(GetMinValue, Value));
end;

function TPickerColumn.NextValue(Value: Integer; out NextValue: Integer): Boolean;
begin
  Result := True;
  if Value >= GetMaxValue then
  begin
    if IsCyclic then
      NextValue := GetMinValue
    else
      Result := False;
  end
  else
    NextValue := Value + 1;
end;

function TPickerColumn.PreviousValue(Value: Integer; out PrevValue: Integer): Boolean;
begin
  Result := True;
  if Value <= GetMinValue then
  begin
    if IsCyclic then
      PrevValue := GetMaxValue
    else
      Result := False;
  end
  else
    PrevValue := Value - 1;
end;

procedure TPickerColumn.SetDrawOffset(Value: Integer);
begin
  FDrawOffset := Value;
end;

{ TPickerMonthColumn }

function TPickerMonthColumn.GetCurrentValue: Integer;
begin
  Result := MonthOf(ActualDate);
end;

function TPickerMonthColumn.GetMaxValue: Integer;
begin
  Result := 12;
end;

function TPickerMonthColumn.GetMinValue: Integer;
begin
  Result := 1;
end;

function TPickerMonthColumn.GetValueString(Value: Integer): string;
begin
  Result := FormatDateTime(MonthFormat, EncodeDate(1901, Value, 1));
end;

procedure TPickerMonthColumn.SetCurrentValue(Value: Integer);
var
  Year, Month, Day, MaxDays: Word;
begin
  DecodeDate(ActualDate, Year, Month, Day);
  MaxDays := DaysInMonth(EncodeDate(Year, Value, 1));
  if Day > MaxDays then
    Day := MaxDays;
  ActualDate := EncodeDate(Year, Value, Day);
end;

{ TPickerDrawer }

constructor TPickerDrawer.Create(Picker: TBasePickerControl);
begin
  inherited Create;
  FPickerControl := Picker;
end;

procedure TPickerDrawer.DrawCell(Canvas: TCanvas; DrawInfo: TPickerCellDrawInfoInternal);
var
  DrawRect: TRect;
  Text: string;
begin
  DrawRect := DrawInfo.Bounds;
  Text := DrawInfo.Text;
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Assign(DrawInfo.Font);
  DrawRect.Inflate(-DrawInfo.BorderSize, -DrawInfo.BorderSize);
  if not DrawInfo.Selected then
  begin
    if DrawInfo.Highlighted then
      Canvas.Brush.Color := DrawInfo.HighlightColor
    else
      Canvas.Brush.Color := DrawInfo.Color;
    Canvas.Brush.Style := bsSolid;
    Canvas.FillRect(DrawInfo.Bounds);
  end
  else
    Canvas.Font.Color := GetSelectionFontColor;

  Canvas.TextRect(DrawRect, Text, [tfCenter, tfVerticalCenter, tfSingleLine]);
end;

procedure TPickerDrawer.DrawOkCancel(Canvas: TCanvas; Buttons: TPickerOkCancelButtons;
  DrawInfo: TPickerButtonDrawInfo; BorderColor: TColor);
var
  DrawButtonInfo: TPickerButtonDrawInfo;
begin
  Canvas.Brush.Color := DrawInfo.Color;
  Canvas.Pen.Width := DrawInfo.BorderWidth;
  Canvas.Pen.Color := BorderColor;
  Canvas.Pen.Style := psInsideFrame;
  Canvas.Rectangle(Buttons.Bounds);
  DrawButtonInfo := TPickerButtonDrawInfo.Create;
  try
    DrawButtonInfo.Button := Buttons.OkButton;
    DrawButtonInfo.BorderWidth := DrawInfo.BorderWidth;
    DrawButtonInfo.Color := DrawInfo.Color;
    DrawButtonInfo.ForegroundColor := DrawInfo.ForegroundColor;
    DrawButtonInfo.PenWidth := DrawInfo.PenWidth;
    DrawPickerButton(Canvas, DrawButtonInfo);
    DrawButtonInfo.Button := Buttons.CancelButton;
    DrawPickerButton(Canvas, DrawButtonInfo);
  finally
    FreeAndNil(DrawButtonInfo);
  end;
end;

procedure TPickerDrawer.DrawPickerBorder(Canvas: TCanvas; BorderWidth: Integer;
  PickerColumn: TPickerColumn; BorderColor: TColor);
var
  DrawRect: TRect;
begin
  DrawRect := PickerColumn.DropDownBounds;
  if BorderWidth <> 0 then
  begin
    Canvas.Pen.Style := psInsideFrame;
    Canvas.Pen.Color := BorderColor;
    Canvas.Pen.Width := BorderWidth;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle(DrawRect);
    DrawRect.Inflate(-BorderWidth, -BorderWidth);
  end;
end;

procedure TPickerDrawer.DrawPickerButton(Canvas: TCanvas; DrawInfo: TPickerButtonDrawInfo);

  procedure DrawArrow(const DrawRect: TRect; Up: Boolean);
  var
    Points: array [0 .. 2] of TPoint;
    TriangleHeight, TriangleWidth, TriangleBotton, TriangleTop: Integer;
  begin
    TriangleHeight := DrawRect.Height div 2;
    TriangleWidth := TriangleHeight * 2;
    TriangleBotton := (DrawRect.Height - TriangleHeight) div 2 + DrawRect.Top +
      TriangleHeight;
    TriangleTop := (DrawRect.Height - TriangleHeight) div 2 + DrawRect.Top;
    if Up then
    begin
      Points[0] := Point(DrawRect.Left, TriangleBotton);
      Points[1] := Point(DrawRect.Left + TriangleHeight,
        (DrawRect.Height - TriangleHeight) div 2 + DrawRect.Top);
      Points[2] := Point(DrawRect.Left + TriangleWidth, TriangleBotton);
    end
    else
    begin
      Points[0] := Point(DrawRect.Left, TriangleTop);
      Points[1] := Point(DrawRect.Left + TriangleHeight,
        (DrawRect.Height - TriangleHeight) div 2 + DrawRect.Top +
        TriangleHeight);
      Points[2] := Point(DrawRect.Left + TriangleWidth, TriangleTop);
    end;
    Canvas.Polyline(Points);
  end;

  procedure DrawOk(const DrawRect: TRect);
  var
    Points: array [0 .. 2] of TPoint;
    CheckHeight, CheckWidth, CheckTop: Integer;
  begin
    Canvas.Pen.Width := DrawInfo.PenWidth;
    CheckHeight := DrawRect.Height div 2;
    CheckWidth := CheckHeight * 2;
    CheckTop := (DrawRect.Height - CheckHeight) div 2 + DrawRect.Top;
    Points[0] := Point(DrawRect.Left + (CheckHeight div 3) * 2,
      CheckTop + (CheckHeight div 3) * 2);
    Points[1] := Point(DrawRect.Left + CheckHeight,
      (DrawRect.Height - CheckHeight) div 2 + DrawRect.Top + CheckHeight);
    Points[2] := Point(DrawRect.Left + CheckWidth, CheckTop);
    Canvas.Polyline(Points);
  end;

  procedure DrawCancel(const DrawRect: TRect);
  var
    XHeight: Integer;
  begin
    Canvas.Pen.Width := DrawInfo.PenWidth;
    XHeight := (DrawRect.Height div 4);
    DrawRect.Inflate(-XHeight, -XHeight);
    Canvas.MoveTo(DrawRect.Left, DrawRect.Top);
    Canvas.LineTo(DrawRect.Right, DrawRect.Bottom);
    Canvas.MoveTo(DrawRect.Right, DrawRect.Top);
    Canvas.LineTo(DrawRect.Left, DrawRect.Bottom);
  end;

var
  ButtonRect, ArrowRect: TRect;
  RectHeigth: Integer;
begin
  ButtonRect := DrawInfo.Button.BoundsRect;
  RectHeigth := ButtonRect.Height;
  Canvas.Brush.Color := GetButtonColor(DrawInfo.Button.State = pbsHot, DrawInfo.Button.State = pbsPressed);

  Canvas.FillRect(ButtonRect);
  Canvas.Pen.Width := DrawInfo.PenWidth;
  Canvas.Pen.Color := GetButtonFontColor(DrawInfo.Button.State = pbsHot, DrawInfo.Button.State = pbsPressed);

  ArrowRect := ButtonRect;
  ArrowRect.Inflate(-(ButtonRect.Width - RectHeigth) div 2, 0);
  if ArrowRect.Width > ArrowRect.Height then
    ArrowRect.Inflate(-(ArrowRect.Width - ArrowRect.Height) div 2, 0)
  else
    ArrowRect.Inflate(0, -(ArrowRect.Height - ArrowRect.Width) div 2);
  if ArrowRect.Height <> ArrowRect.Width then
    ArrowRect.Width := ArrowRect.Height;

  case DrawInfo.ButtonType of
    pbtUp:
      DrawArrow(ArrowRect, True);
    pbtDown:
      DrawArrow(ArrowRect, False);
    pbtOk:
      DrawOk(ArrowRect);
    pbtCancel:
      DrawCancel(ArrowRect);
  end;
end;

procedure TPickerDrawer.DrawPickerCell(Canvas: TCanvas; DrawInfo: TPickerCellDrawInfoInternal);
var
  DrawRect: TRect;
  Text: string;
begin
  DrawRect := DrawInfo.Bounds;
  Canvas.Pen.Width := DrawInfo.BorderSize;
  Canvas.Pen.Style := psInsideFrame;
  Canvas.Brush.Color := DrawInfo.Color;
  Canvas.Pen.Color := DrawInfo.BorderColor;
  Canvas.FillRect(DrawRect);
  if DrawInfo.BorderSize <> 0 then
    Canvas.Rectangle(DrawRect);
  Text := DrawInfo.Text;
  Canvas.Font.Assign(DrawInfo.Font);
  DrawRect.Inflate(-DrawInfo.BorderSize, -DrawInfo.BorderSize);
  Canvas.TextRect(DrawRect, Text, [tfCenter, tfVerticalCenter, tfSingleLine]);
end;

procedure TPickerDrawer.DrawPickerColumn(Canvas: TCanvas; DrawRect: TRect; Color: TColor);
begin
  Canvas.Pen.Style := psClear;
  Canvas.Brush.Color := Color;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(DrawRect);
end;

procedure TPickerDrawer.DrawSelectedRect(Canvas: TCanvas; var DrawRect: TRect;
  BorderWidth: Integer);
begin
  DrawRect.Inflate(-BorderWidth, 0);
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := GetSelectionColor;
  Canvas.Pen.Style := psInsideFrame;
  Canvas.FillRect(DrawRect);
end;

function TPickerDrawer.GetBorderColor(Hot, Pressed: Boolean): TColor;
begin
  if Pressed then
    Result := clBtnHighlight
  else if Hot then
    Result := clWindowFrame
  else
    Result := FPickerControl.BorderColor;
end;

function TPickerDrawer.GetButtonColor(Hot, Pressed: Boolean): TColor;
begin
  if Pressed then
    Result := clBtnShadow
  else if Hot then
    Result := clInactiveBorder
  else
    Result := clBtnFace;
end;

function TPickerDrawer.GetButtonFontColor(Hot, Pressed: Boolean): TColor;
begin
  Result := clBtnText;
end;

function TPickerDrawer.GetColor(Hot, Pressed, Enabled: Boolean): TColor;
begin
  if Hot then
    Result := FPickerControl.HotColor
  else if not Enabled then
    Result := clBtnFace
  else
    Result := FPickerControl.Color;
end;

function TPickerDrawer.GetFontColor: TColor;
begin
  Result := FPickerControl.Font.Color;
end;

function TPickerDrawer.GetHighlightColor: TColor;
begin
  Result := FPickerControl.HighlightColor;
end;

function TPickerDrawer.GetPopupColor: TColor;
begin
  Result := FPickerControl.PopupColor;
end;

function TPickerDrawer.GetSelectionColor: TColor;
begin
  Result := FPickerControl.SelectionColor;
end;

function TPickerDrawer.GetSelectionFontColor: TColor;
begin
  Result := FPickerControl.SelectionFontColor;
end;

function TPickerDrawer.MiddleColor(Color1, Color2: TColor;
  Coeff: Double = 0.5): TColor;

  function Approx(C1, C2: Integer): Integer;
  begin
    Result := C1 + Round((C2 - C1) * Coeff);
  end;

begin
  Color1 := ColorToRGB(Color1);
  Color2 := ColorToRGB(Color2);

  Result := RGB(Approx(GetRValue(Color1), GetRValue(Color2)),
    Approx(GetGValue(Color1), GetGValue(Color2)), Approx(GetBValue(Color1),
    GetBValue(Color2)));
end;

{ TDateColumn }

constructor TDateColumn.Create(const DateProvider: IDateProvider);
begin
  inherited Create;
  Assert(DateProvider <> nil);
  FDateProvider := DateProvider;
end;

function TDateColumn.GetActualDate: TDate;
begin
  Result := DateProvider.Date;
end;

procedure TDateColumn.SetActualDate(Value: TDate);
begin
  DateProvider.Date := Value;
end;

{ TPickerDayColumn }

function TPickerDayColumn.GetCurrentValue: Integer;
begin
  Result := DayOf(ActualDate);
end;

function TPickerDayColumn.GetMaxValue: Integer;
begin
  Result := DaysInAMonth(YearOf(ActualDate), MonthOf(ActualDate));
end;

function TPickerDayColumn.GetMinValue: Integer;
begin
  Result := 1;
end;

function TPickerDayColumn.GetValueString(Value: Integer): string;
begin
  Result := FormatDateTime(DaysFormat, EncodeDate(YearOf(ActualDate),
    MonthOf(ActualDate), Value));
end;

procedure TPickerDayColumn.SetCurrentValue(Value: Integer);
var
  Year, Month, Day, MaxDays: Word;
begin
  DecodeDate(ActualDate, Year, Month, Day);
  Day := Value;
  MaxDays := DaysInMonth(EncodeDate(Year, Month, 1));
  if Day > MaxDays then
    Day := MaxDays;
  ActualDate := EncodeDate(Year, Month, Day);
end;

{ TPickerCellDrawInfo }

constructor TPickerCellDrawInfo.Create;
begin
  inherited;
  FFont := TFont.Create;
end;

destructor TPickerCellDrawInfo.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TPickerCellDrawInfo.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

{ TBasePickerControl }

constructor TBasePickerControl.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csCaptureMouse, csNeedsBorderPaint, csClickEvents, csOpaque,
    csDoubleClicks, csReflector, csPannable];

  Font.Color := clWindowText;
  Font.Name := 'Segoe UI'; // do not localize
  Font.Size := DefaultFontSize;
  HighlightColor := DefaultPickerHighlightColor;
  HotColor := DefaultPickerHotColor;
  SelectionColor := DefaultPickerSelectionColor;
  SelectionFontColor := DefaultPickerSelectionFontColor;
  FDropDownCount := DefaultPickerDropDownCount;
  ShowOkCancel := True;
  FColumns := TObjectList<TPickerColumn>.Create(True);
  FBorderSize := 1;
  BorderStyle := bsSingle;
  ParentColor := False;
  Color := clWindow;
  BorderColor := DefaultBorderColor;
  PopupColor := DefaultPopupColor;
  TabStop := True;
  Width := DefaultPickerWidth;
  Height := DefaultPickerHeight;
end;

destructor TBasePickerControl.Destroy;
begin
  if FDroppedDown then
    CloseUp(False);
  FreeAndNil(FColumns);
  FreeAndNil(FDrawer);
  inherited;
end;

procedure TBasePickerControl.AdjustSize;
var
  NewSize: TSize;
begin
  if not(csLoading in ComponentState) and HandleAllocated then
  begin
    NewSize := CalcSizes(ClientRect.Size);
    SetWindowPos(Handle, 0, 0, 0, NewSize.cx, NewSize.cy, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOZORDER);
    RequestAlign;
  end;
end;

function TBasePickerControl.CalcSizes(MinSize: TSize): TSize;
var
  Columns: TList<TPickerColumn>;
  LastItem, CurrentColumn: TPickerColumn;
  I, Offset, ContentWidth, LMinColumnsWidth, NewWidth, MinHeight: Integer;
  NewSize: TSize;
  Coeff: Double;
begin
  Columns := TList<TPickerColumn>.Create;
  try
    DefineColumns(Columns);
    if Columns.Count = 0 then
    begin
      Result := MinSize;
      Exit;
    end;

    LMinColumnsWidth := 0;
    MinHeight := MinSize.cy;

    for CurrentColumn in Columns do
    begin
      NewSize := CurrentColumn.GetMinSize(Canvas, Font);
      CurrentColumn.Bounds := TRect.Create(Point(0, 0), NewSize.cx, NewSize.cy);

      MinHeight := Max(NewSize.cy, MinHeight);
      Inc(LMinColumnsWidth, NewSize.cx);
    end;

    ContentWidth := Max(LMinColumnsWidth, MinSize.cx - FBorderSize * 2);
    NewWidth := ContentWidth + FBorderSize * 2;
    Coeff := ContentWidth / LMinColumnsWidth;
    Offset := 0;

    for I := 0 to Columns.Count - 1 do
    begin
      CurrentColumn := Columns[I];
      CurrentColumn.Bounds := TRect.Create(Point(Offset, 0), Trunc(CurrentColumn.Bounds.Width * Coeff), MinHeight);
      Offset := CurrentColumn.Bounds.Right;
    end;

    if Offset < NewWidth - FBorderSize then
    begin
      LastItem := Columns[Columns.Count - 1];
      LastItem.Bounds.Width := LastItem.Bounds.Width + NewWidth - Offset;
    end;

    Result.cx := NewWidth;
    Result.cy := MinHeight;
  finally
    FreeAndNil(Columns);
  end;
end;

function TBasePickerControl.CanModify: Boolean;
begin
  Result := True;
end;

function TBasePickerControl.CanResize(var NewWidth, NewHeight: Integer)
  : Boolean;
var
  NewSize: TSize;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if Result then
  begin
    NewSize := CalcSizes(TSize.Create(NewWidth, NewHeight));
    NewWidth := NewSize.cx;
    NewHeight := NewSize.cy;
  end;
end;

procedure TBasePickerControl.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited ChangeScale(M, D, isDpiChange);
  FBorderSize := MulDiv(FBorderSize, M, D);
  if Assigned(FPopupControl) then
    FPopupControl.ChangeScale(M, D, isDpiChange);
end;

procedure TBasePickerControl.Click;
begin
  inherited;
  if FDroppedDown then
    CloseUp(True)
  else
    DropDown;
end;

procedure TBasePickerControl.CloseUp(Accept: Boolean);
begin
  if FDroppedDown then
  begin
    if GetCapture <> 0 then
      SendMessage(GetCapture, WM_CANCELMODE, 0, 0);

    if HandleAllocated then
      SetWindowPos(FPopupControl.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
        SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);

    FDroppedDown := False;
    if Accept and CanModify then
      AcceptDropDown
    else
      RejectDropDown;
    Invalidate;
    if Assigned(FOnCloseUp) then
      FOnCloseUp(Self);
  end;
end;

procedure TBasePickerControl.CMCancelMode(var Msg: TCMCancelMode);
begin
  if (Msg.Sender <> Self) and (Msg.Sender <> FPopupControl) then
    CloseUp(not ShowOkCancel);
end;

procedure TBasePickerControl.CMDialogKey(var Msg: TCMDialogKey);
begin
  if (Msg.CharCode in [VK_RETURN, VK_ESCAPE]) and FDroppedDown then
  begin
    CloseUp(Msg.CharCode = VK_RETURN);
    Msg.Result := 1;
  end
  else
    inherited;
end;

procedure TBasePickerControl.CMMouseEnter(var Msg: TMessage);
begin
  Hot := True;
  inherited;
end;

procedure TBasePickerControl.CMMouseLeave(var Msg: TMessage);
begin
  Hot := False;
  inherited;
end;

procedure TBasePickerControl.CMStyleChanged(var Msg: TMessage);
begin
  inherited;
  FreeAndNil(FDrawer);
end;

procedure TBasePickerControl.CNKeyDown(var Msg: TMessage);
begin
  if Msg.WParam in [VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN] then
    FPopupControl.Perform(Msg.Msg, Msg.WParam, Msg.LParam)
  else
    inherited;
end;

function TBasePickerControl.CreateDrawer: TPickerDrawer;
begin
  if TStyleManager.IsCustomStyleActive then
    Result := TPickerDrawerStyled.Create(Self)
  else
    Result := TPickerDrawerNative.Create(Self);
end;

procedure TBasePickerControl.CreateWnd;
begin
  inherited;
  AdjustSize;
end;

procedure TBasePickerControl.DoDrawPickerCell(Sender: TObject; PickerCellDrawInfo: TPickerCellDrawInfo);
begin
  if Assigned(FOnDrawPickerCell) then
    FOnDrawPickerCell(Sender, PickerCellDrawInfo);
end;

function TBasePickerControl.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if FDroppedDown then
    Result := FPopupControl.DoMouseWheelDown(Shift, MousePos);
end;

function TBasePickerControl.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if FDroppedDown then
    Result := FPopupControl.DoMouseWheelUp(Shift, MousePos);
end;

procedure TBasePickerControl.DoOnChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TBasePickerControl.DropDown;

  function CalcDropDownPosition: TPoint;
  begin
    Result := ClientToScreen(ParentToClient(Point(Left, Top)));
    Result.Offset(-(FPopupControl.Width - Width) div 2,
      -(FPopupControl.Height - Height) div 2 + FPopupControl.FItemHeight div 2);
    if Result.Y + FPopupControl.Height > Screen.DesktopHeight then
      Result.Y := Screen.DesktopHeight - FPopupControl.Height;
    if Result.X + FPopupControl.Width > Screen.DesktopWidth then
      Result.X := Screen.DesktopWidth - FPopupControl.Width;
    if Result.Y < 0 then
      Result.Y := 0;
    if Result.X < 0 then
      Result.X := 0;
  end;

var
  LPosition: TPoint;
begin
  if FDroppedDown then
    Exit;
  InitPopup;
  LPosition := CalcDropDownPosition;
  SetWindowPos(FPopupControl.Handle, HWND_TOP, LPosition.X, LPosition.Y, 0, 0,
    SWP_NOSIZE or SWP_NOACTIVATE or SWP_FRAMECHANGED or SWP_SHOWWINDOW);
  FDroppedDown := True;
end;

function TBasePickerControl.GetColumnByClass<T>: T;
var
  Column: TPickerColumn;
begin
  for Column in FColumns do
    if Column is T then
      Exit(Column as T);
  Result := nil;
end;

procedure TBasePickerControl.InitPopup;
var
  LColumns: TList<TPickerColumn>;
  ViewInfo: TPickerViewInfo;
begin
  LColumns := TList<TPickerColumn>.Create;
  try
    DefineColumns(LColumns);

    if FPopupControl = nil then
      FPopupControl := TPickerPopupControl.Create(Self);
    ViewInfo := TPickerViewInfo.Create;
    try
      ViewInfo.BorderColor := BorderColor;
      ViewInfo.BorderSize := FBorderSize;
      ViewInfo.Color := PopupColor;
      ViewInfo.Font := Font;
      ViewInfo.DropDownCount := DropDownCount;
      ViewInfo.ItemHeight := ClientHeight;
      ViewInfo.ShowOkCancel := ShowOkCancel;
      ViewInfo.HighlightColor := HighlightColor;
      FPopupControl.Init(Self, LColumns, ViewInfo, FOnDrawCell, NeedDrawer);
    finally
      FreeAndNil(ViewInfo);
    end;
  finally
    LColumns.Free;
  end;
end;

procedure TBasePickerControl.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((ssAlt in Shift) and ((Key = VK_UP) or (Key = VK_DOWN))) or
    (Key = VK_RETURN) or (Key = VK_SPACE) then
  begin
    if FDroppedDown then
      CloseUp(True)
    else
      DropDown;
  end;
  if Key = VK_BACK then
    CloseUp(False);
end;

function TBasePickerControl.NeedDrawer: TPickerDrawer;
begin
  if FDrawer = nil then
    FDrawer := CreateDrawer;
  Result := FDrawer;
end;

procedure TBasePickerControl.Paint;
var
  Column: TPickerColumn;
  DrawInfo: TPickerCellDrawInfoInternal;
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Width, Height);
    for Column in FColumns do
    begin
      DrawInfo := TPickerCellDrawInfoInternal.Create;
      try
        DrawInfo.Bounds := Column.Bounds;
        DrawInfo.BorderColor := NeedDrawer.GetBorderColor(Hot or Focused, Pressed);
        DrawInfo.BorderSize := FBorderSize;
        DrawInfo.Color := NeedDrawer.GetColor(Hot or Focused, Pressed, Enabled);
        DrawInfo.Font.Assign(Font);
        DrawInfo.Font.Color := NeedDrawer.GetFontColor;
        DrawInfo.Text := Column.GetValueString(Column.CurrentValue);
        DoDrawPickerCell(Self, DrawInfo);
        NeedDrawer.DrawPickerCell(Bitmap.Canvas, DrawInfo);
      finally
        FreeAndNil(DrawInfo);
      end;
    end;
    Canvas.CopyRect(ClientRect, Bitmap.Canvas, ClientRect);
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TBasePickerControl.SetBorderColor(Value: TColor);
begin
  FBorderColor := Value;
  if Assigned(FPopupControl) then
    FPopupControl.BorderColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle = Value then
    Exit;
  FBorderStyle := Value;
  if FBorderStyle = bsSingle then
    FBorderSize := MulDiv(1, Screen.PixelsPerInch, 96)
  else
    FBorderSize := 0;
  Invalidate;
end;

procedure TBasePickerControl.SetDropdownCount(Value: Integer);
begin
  FDropDownCount := Value;
end;

procedure TBasePickerControl.SetHighlightColor(Value: TColor);
begin
  FHighlightColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetHotColor(Value: TColor);
begin
  FHotColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetHot(Value: Boolean);
begin
  FHot := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetPopupColor(Value: TColor);
begin
  FPopupColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetPressed(Value: Boolean);
begin
  if FPressed = Value then
    Exit;
  FPressed := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetSelectionColor(Value: TColor);
begin
  FSelectionColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetSelectionFontColor(Value: TColor);
begin
  FSelectionFontColor := Value;
  Invalidate;
end;

procedure TBasePickerControl.SetShowOkCancel(Value: Boolean);
begin
  FShowOkCancel := Value;
end;

procedure TBasePickerControl.WMKillFocus(var Msg: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
  Invalidate;
end;

procedure TBasePickerControl.WMLButtonDown(var Msg: TWMLButtonDown);
begin
  if CanFocus then
    SetFocus;
  Pressed := True;
  inherited;
end;

procedure TBasePickerControl.WMLButtonUp(var Msg: TWMLButtonUp);
begin
  Pressed := False;
  inherited;
end;

procedure TBasePickerControl.WMSetFocus(var Msg: TWMSetFocus);
begin
  Invalidate;
  inherited;
end;

{ TCustomDatePicker }

constructor TCustomDatePicker.Create(AOwner: TComponent);
begin
  inherited;
  FDateProvider := TDateProvider.Create;
  FDateFormat := FormatSettings.ShortDateFormat;
  Date := Today;
  ParseFormat(FDateFormat);
  MaxYear := DefaultMaxYear;
  MinYear := DefaultMinYear;

  InitColumns;
end;

procedure TCustomDatePicker.AcceptDropDown;
begin
  Date := GetDateFromColumns;
end;

procedure TCustomDatePicker.DefineColumns(Columns: TList<TPickerColumn>);
var
  Column: TPickerColumn;
begin
  if Assigned(FColumns) then
  begin
    for Column in FColumns do
      Columns.Add(Column);

    SetDateToColumns(Date);
  end;
end;

function TCustomDatePicker.GetDate: TDate;
begin
  Result := FDate;
end;

function TCustomDatePicker.GetDateFromColumns: TDate;
var
  Column: TPickerColumn;
  DayColumn: TPickerDayColumn absolute Column;
  YearColumn: TPickerYearColumn absolute Column;
  MonthColumn: TPickerMonthColumn absolute Column;
  Year, Month, Day: Word;
begin
  DecodeDate(FDate, Year, Month, Day);

  if Assigned(FColumns) then
    for Column in FColumns do
    begin
      if Column is TPickerYearColumn then
        Year := YearColumn.CurrentValue
      else if Column is TPickerMonthColumn then
        Month := MonthColumn.CurrentValue
      else if Column is TPickerDayColumn then
        Day := DayColumn.CurrentValue
    end;

  Result := EncodeDate(Year, Month, Day);
end;

function TCustomDatePicker.GetDayVisible: Boolean;
var
  Column: TPickerColumn;
begin
  for Column in FColumns do
    if Column is TPickerDayColumn then
      Exit(True);
  Result := False;
end;

function TCustomDatePicker.GetMaxYear: Integer;
begin
  Result := FDateProvider.MaxYear;
end;

function TCustomDatePicker.GetMinYear: Integer;
begin
  Result := FDateProvider.MinYear;
end;

function TCustomDatePicker.GetMonthVisible: Boolean;
var
  Column: TPickerColumn;
begin
  for Column in FColumns do
    if Column is TPickerMonthColumn then
      Exit(True);
  Result := False;
end;

function TCustomDatePicker.GetYearVisible: Boolean;
var
  Column: TPickerColumn;
begin
  for Column in FColumns do
    if Column is TPickerYearColumn then
      Exit(True);
  Result := False;
end;

procedure TCustomDatePicker.InitColumns;
begin
  SetDateToColumns(Date);
  if HandleAllocated then
    CalcSizes(ClientRect.Size);
end;

procedure TCustomDatePicker.ParseFormat(const Format: string);
const
  DateFormatRegExpt = '(yyyy|yy|y)|(m{1,4})|(d{1,6})'; // do not localize
var
  Match: TMatch;
  Matches: TMatchCollection;
  Value: string;
  DayColumn: TPickerDayColumn;
  YearColumn: TPickerYearColumn;
  MonthColumn: TPickerMonthColumn;
begin
  FreeAndNil(FColumns);
  FColumns := TObjectList<TPickerColumn>.Create(True);

  Matches := TRegEx.Matches(Format, DateFormatRegExpt, [roSingleLine, roIgnoreCase, roNotEmpty]);

  for Match in Matches do
  begin
    if not Match.Success then
      Continue;

    Value := Match.Value;
    if Value.Length = 0 then
      Continue;

    case LowerCase(Value)[1] of
      'y':
        begin
          YearColumn := TPickerYearColumn.Create(FDateProvider);
          YearColumn.YearFormat := Value;
          FColumns.Add(YearColumn);
        end;
      'm':
        begin
          MonthColumn := TPickerMonthColumn.Create(FDateProvider);
          MonthColumn.MonthFormat := Value;
          FColumns.Add(MonthColumn);
        end;
      'd':
        begin
          DayColumn := TPickerDayColumn.Create(FDateProvider);
          DayColumn.DaysFormat := Value;
          FColumns.Add(DayColumn);
        end;
    end;
  end;
end;

procedure TCustomDatePicker.RejectDropDown;
begin
  SetDateToColumns(Date);
end;

procedure TCustomDatePicker.SetDate(Value: TDate);
begin
  if FDate = Value then
    Exit;
  FDate := Value;
  DoOnChange;
  SetDateToColumns(FDate);
  Invalidate;
end;

procedure TCustomDatePicker.SetDateFormat(const Value: string);
begin
  if FDateFormat = Value then
    Exit;
  FDateFormat := Value;
  ParseFormat(FDateFormat);
  InitColumns;
  Invalidate;
end;

procedure TCustomDatePicker.SetDateToColumns(Value: TDate);
var
  DayColumn: TPickerDayColumn;
  YearColumn: TPickerYearColumn;
  MonthColumn: TPickerMonthColumn;
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);

  if Assigned(FColumns) then
  begin
    YearColumn := GetColumnByClass<TPickerYearColumn>;
    if Assigned(YearColumn) then
      YearColumn.CurrentValue := Year;
    MonthColumn := GetColumnByClass<TPickerMonthColumn>;;
    if Assigned(MonthColumn) then
      MonthColumn.CurrentValue := Month;
    DayColumn := GetColumnByClass<TPickerDayColumn>;;
    if Assigned(DayColumn) then
      DayColumn.CurrentValue := Day;
  end;
end;

procedure TCustomDatePicker.SetMaxYear(Value: Integer);
begin
  FDateProvider.MaxYear := Value;
end;

procedure TCustomDatePicker.SetMinYear(Value: Integer);
begin
  FDateProvider.MinYear := Value;
end;

{ TPickerYearColumn }

function TPickerYearColumn.GetCurrentValue: Integer;
begin
  Result := YearOf(ActualDate);
end;

function TPickerYearColumn.GetMaxValue: Integer;
begin
  Result := DateProvider.MaxYear;
end;

function TPickerYearColumn.GetMinValue: Integer;
begin
  Result := DateProvider.MinYear;
end;

function TPickerYearColumn.GetValueString(Value: Integer): string;
begin
  Result := FormatDateTime(YearFormat, EncodeDate(Value, 1, 1));
end;

function TPickerYearColumn.IsCyclic: Boolean;
begin
  Result := False;
end;

procedure TPickerYearColumn.SetCurrentValue(Value: Integer);
var
  Year, Month, Day, MaxDays: Word;
begin
  DecodeDate(ActualDate, Year, Month, Day);
  MaxDays := DaysInMonth(EncodeDate(Value, Month, 1));
  if Day > MaxDays then
    Day := MaxDays;
  ActualDate := EncodeDate(Value, Month, Day);
end;

{ TPickerPopupControl }

constructor TPickerPopupControl.Create(AOwner: TComponent);
begin
  inherited;
  DoubleBuffered := True;
  Height := 300;
  Width := 200;
  FBorderSize := 2;
  FMouseOver := -1;
  FDropDownCount := DefaultPickerDropDownCount;
  FHighlightColor := DefaultPickerHighlightColor;
  FHotColor := DefaultPickerHotColor;
  FSelectionColor := DefaultPickerSelectionColor;
  FSelectionFontColor := DefaultPickerSelectionFontColor;
  FOkCancelButtons := TPickerOkCancelButtons.Create
end;

destructor TPickerPopupControl.Destroy;
begin
  FreeAndNil(FOkCancelButtons);
  FreeAndNil(FAnimation);
  inherited;
end;

procedure TPickerPopupControl.AnimateColumnValueChanged(Column: TPickerColumn;
  NextValue, Delta: Integer);
var
  Animation: TPickerSlideAnimation;
begin
  if FAnimation <> nil then
    FAnimation.Finish;
  FreeAndNil(FAnimation);
  Animation := TPickerSlideAnimation.Create;
  FAnimation := Animation;
  Animation.NextValue := NextValue;
  Animation.Control := Self;
  Animation.Duration := 250;
  Animation.Interval := 10;
  Animation.Column := Column;
  Animation.Delta := -Delta;
  Animation.StartDefault;
  Animation.OnFinished := AnimationFinished;
end;

procedure TPickerPopupControl.AnimationFinished(Sender: TObject);
var
  Animation: TPickerSlideAnimation;
begin
  Animation := (Sender as TPickerSlideAnimation);
  Animation.Column.CurrentValue := (Sender as TPickerSlideAnimation).NextValue;
  UpdateHoverItems(Self.ScreenToClient(Mouse.CursorPos));
  Invalidate;
end;

procedure TPickerPopupControl.Calculate;
var
  Column: TPickerColumn;
  NewWidth, NewHeight, OkCancelHeight: Integer;
begin
  NewHeight := DropDownCount * FItemHeight;
  NewWidth := 0;
  for Column in FColumns do
  begin
    Column.DropDownBounds := Rect(Column.Bounds.Left, 0, Column.Bounds.Right,
      NewHeight);
    Column.UpButton.BoundsRect := Column.DropDownBounds.SplitRect(srTop,
      MulDiv(ScrollButtonHeight, Screen.PixelsPerInch, 96));
    Column.UpButton.BoundsRect.Inflate(-FBorderSize, -FBorderSize);
    Column.DownButton.BoundsRect := Column.DropDownBounds.SplitRect(srBottom,
      MulDiv(ScrollButtonHeight, Screen.PixelsPerInch, 96));
    Column.DownButton.BoundsRect.Inflate(-FBorderSize, -FBorderSize);
    NewWidth := NewWidth + Column.DropDownBounds.Width;
  end;

  if ShowOkCancel then
  begin
    NewHeight := NewHeight + FItemHeight;
    OkCancelHeight := FItemHeight;
  end else
    OkCancelHeight := 0;

  SetBounds(Left, Top, NewWidth, NewHeight);
  FSelectRect := Rect(0, Round((NewHeight - FItemHeight) / 2 - OkCancelHeight div 2), Width,
    Round((NewHeight - FItemHeight) / 2) + FItemHeight - OkCancelHeight div 2);

  if ShowOkCancel then
    FOkCancelButtons.Calculate(ClientRect, FItemHeight, FBorderSize);
end;

procedure TPickerPopupControl.CMMouseActivate(var Msg: TCMMouseActivate);
begin
  Msg.Result := MA_NOACTIVATE;
end;

procedure TPickerPopupControl.CMMouseLeave(var Msg: TMessage);
begin
  MouseOver := -1;
  FOkCancelButtons.OkButton.State := pbsNone;
  FOkCancelButtons.CancelButton.State := pbsNone;
  InvalidateRect(Handle, FOkCancelButtons.Bounds, False);
  inherited;
end;

procedure TPickerPopupControl.CNKeyDown(var Msg: TWMKeyDown);
var
  NextValue, Delta: Integer;
  Column: TPickerColumn;
begin
  case Msg.CharCode of
    VK_UP, VK_DOWN:
      begin
        MouseOver := Max(0, MouseOver);
        Column := FColumns[MouseOver];
        if Assigned(Column) then
        begin
          Delta := 1;
          if Msg.CharCode = VK_UP then
            Delta := Column.CalcNextValue(Column.CurrentValue,
              NextValue, -Delta)
          else
            Delta := Column.CalcNextValue(Column.CurrentValue,
              NextValue, Delta);
          if Delta <> 0 then
            AnimateColumnValueChanged(Column, NextValue, Delta);
        end;
      end;
    VK_LEFT:
      if MouseOver > 0 then
        MouseOver := MouseOver - 1;
    VK_RIGHT:
      if MouseOver < Length(FColumns) - 1 then
        MouseOver := MouseOver + 1;
  end;
end;

procedure TPickerPopupControl.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := (Params.Style or WS_POPUP) and (not WS_CHILD);
  Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
  Params.WndParent := FParentOwner.Handle;
end;

procedure TPickerPopupControl.DoDrawCell(Sender: TObject; PickerCellDrawInfo: TPickerCellDrawInfo);
begin
  if Assigned(FOnDrawCell) then
    FOnDrawCell(Sender, PickerCellDrawInfo);
end;

function TPickerPopupControl.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
var
  Column: TPickerColumn;
  NextValue, Delta: Integer;
begin
  MousePos := ScreenToClient(MousePos);
  Column := GetColumnByMousePos(MousePos);
  Result := False;
  if ssCtrl in Shift then
    Delta := Mouse.WheelScrollLines
  else
    Delta := 1;
  if Assigned(Column) then
  begin
    Delta := Column.CalcNextValue(Column.CurrentValue, NextValue, Delta);
    if Delta <> 0 then
    begin
      AnimateColumnValueChanged(Column, NextValue, Delta);
      Result := True;
    end;
  end;
end;

function TPickerPopupControl.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
var
  Column: TPickerColumn;
  PrevValue, Delta: Integer;
begin
  MousePos := ScreenToClient(MousePos);
  Column := GetColumnByMousePos(MousePos);
  Result := False;

  if ssCtrl in Shift then
    Delta := -Mouse.WheelScrollLines
  else
    Delta := -1;
  if Assigned(Column) then
  begin
    Delta := Column.CalcNextValue(Column.CurrentValue, PrevValue, Delta);
    if Delta <> 0 then
    begin
      AnimateColumnValueChanged(Column, PrevValue, Delta);
      Result := True;
    end;
  end;
end;

function TPickerPopupControl.GetCellValueByMousePos(Point: TPoint;
  out ResultValue, ResultDelta: Integer): Boolean;
var
  Value, Delta: Integer;
  Column: TPickerColumn;
begin
  Column := GetColumnByMousePos(Point);
  if not Assigned(Column) then
    Exit(False);

  Value := Column.CurrentValue;
  ResultDelta := 0;

  if FSelectRect.Contains(Point) then
    Exit(True);

  if Point.Y < FSelectRect.Top then
    Delta := (Point.Y - FSelectRect.Top) div (FItemHeight - FBorderSize * 2) - 1
  else
    Delta := (Point.Y - FSelectRect.Bottom)
      div (FItemHeight - FBorderSize * 2) + 1;

  Result := Column.CalcNextValue(Value, Value, Delta) = Delta;
  if Result then
  begin
    ResultValue := Value;
    ResultDelta := Delta;
  end;
end;

function TPickerPopupControl.GetColumnByMousePos(Point: TPoint): TPickerColumn;
var
  Column: TPickerColumn;
begin
  for Column in FColumns do
    if Column.DropDownBounds.Contains(Point) then
      Exit(Column);
  Result := nil;
end;

procedure TPickerPopupControl.Init(ParentOwner: TWinControl; Columns: TList<TPickerColumn>;
  ViewInfo: TPickerViewInfo; OnDrawEvent: TDrawPickerCellEvent; Drawer: TPickerDrawer);
begin
  FParentOwner := ParentOwner;
  FColumns := Columns.ToArray;
  DropDownCount := ViewInfo.DropDownCount;
  FItemHeight := ViewInfo.ItemHeight;
  FDrawer := Drawer;
  Font.Assign(ViewInfo.Font);
  BorderColor := ViewInfo.BorderColor;
  Color := ViewInfo.Color;
  HighlightColor := ViewInfo.HighlightColor;
  FBorderSize := ViewInfo.BorderSize;
  ShowOkCancel := ViewInfo.ShowOkCancel;
  OnDrawCell := OnDrawEvent;
  Calculate;
end;

procedure TPickerPopupControl.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  UpdateHoverItems(Point(X, Y));
  inherited;
end;

procedure TPickerPopupControl.Paint;
var
  Bitmap: TBitmap;
  DrawRect: TRect;
begin
  DrawRect := ClientRect;
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(DrawRect.Width, DrawRect.Height);
    PaintColumns(Bitmap.Canvas, FDrawer);
    PaintOkCancel(Bitmap.Canvas, FDrawer);
    Canvas.CopyRect(DrawRect, Bitmap.Canvas, DrawRect);
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TPickerPopupControl.PaintCell(Canvas: TCanvas; Rect: TRect; const Text: string;
  Drawer: TPickerDrawer; Highlighted, Selected: Boolean);
var
  DrawInfo: TPickerCellDrawInfoInternal;
begin
  DrawInfo := TPickerCellDrawInfoInternal.Create;
  try
    DrawInfo.Bounds := Rect;
    DrawInfo.Text := Text;
    DrawInfo.BorderColor := Drawer.GetBorderColor(False, False);
    DrawInfo.Font.Assign(Font);
    DrawInfo.Color := Drawer.GetPopupColor;
    DrawInfo.HighlightColor := Drawer.GetHighlightColor;
    DrawInfo.Highlighted := Highlighted;
    DrawInfo.Font.Color := Drawer.GetFontColor;
    DrawInfo.Selected := Selected;
    DrawInfo.BorderSize := FBorderSize;
    DoDrawCell(Self, DrawInfo);
    Drawer.DrawCell(Canvas, DrawInfo);
  finally
    FreeAndNil(DrawInfo);
  end;
end;

procedure TPickerPopupControl.PaintColumn(Canvas: TCanvas; Column: TPickerColumn;
  Drawer: TPickerDrawer; ColumnIndex: Integer);

  procedure LocalPaintCell(DrawRect: TRect; Value: Integer; DrawHighlighted, DrawSelected: Boolean);
  var
    Highlighted: Boolean;
    SelectedPart, UnselectedPart: TRect;
    DrawRegion: HRGN;
  begin
    Highlighted := DrawHighlighted and (ColumnIndex = FMouseOver) and
      (FMouseOverValue = Value) and (DrawRect.Contains(MouseOverPoint)) and
      not FSelectRect.Contains(MouseOverPoint);

    if FSelectRect.IntersectsWith(DrawRect) then
    begin
      SelectedPart := TRect.Intersect(FSelectRect, DrawRect);
      SubtractRect(UnselectedPart, DrawRect, SelectedPart);

      DrawRegion := CreateRectRgn(SelectedPart.Left, SelectedPart.Top, SelectedPart.Right, SelectedPart.Bottom);
      try
        SelectClipRgn(Canvas.Handle, DrawRegion);
        PaintCell(Canvas, DrawRect, Column.GetValueString(Value), Drawer,
          Highlighted, True);
        SelectClipRgn(Canvas.Handle, HRGN(nil));
      finally
        DeleteObject(DrawRegion);
      end;

      DrawRegion := CreateRectRgn(UnselectedPart.Left, UnselectedPart.Top, UnselectedPart.Right, UnselectedPart.Bottom);
      try
        SelectClipRgn(Canvas.Handle, DrawRegion);
        PaintCell(Canvas, DrawRect, Column.GetValueString(Value), Drawer,
          Highlighted, False);
        SelectClipRgn(Canvas.Handle, HRGN(nil));
      finally
        DeleteObject(DrawRegion);
      end;
    end
    else
      PaintCell(Canvas, DrawRect, Column.GetValueString(Value), Drawer, Highlighted, DrawSelected);
  end;

var
  CurrentValue, DrawArrowWidth: Integer;
  PickerRect, DrawRect, SelectedRect: TRect;
  DrawButtonInfo: TPickerButtonDrawInfo;
begin
  Drawer.DrawPickerColumn(Canvas, Column.DropDownBounds, Drawer.GetPopupColor);
  PickerRect := Column.DropDownBounds;

  // draw selected rect
  SelectedRect := Rect(PickerRect.Left, FSelectRect.Top, PickerRect.Right, FSelectRect.Bottom);
  CurrentValue := Column.CurrentValue;
  DrawRect := SelectedRect;
  Drawer.DrawSelectedRect(Canvas, SelectedRect, FBorderSize);

  // draw upper values
  DrawRect.Offset(0, Column.DrawOffset);
  while (DrawRect.Top + DrawRect.Height >= 0) and
    (CurrentValue >= Column.GetMinValue) do
  begin
    LocalPaintCell(DrawRect, CurrentValue, Column.DrawOffset = 0,
      (Column.CurrentValue = CurrentValue) and (DrawRect.IntersectsWith(SelectedRect)));
    DrawRect.Offset(0, -DrawRect.Height);
    if not Column.PreviousValue(CurrentValue, CurrentValue) then
      Break;
  end;

  // draw lower values
  DrawRect := SelectedRect;
  DrawRect.Offset(0, Column.DrawOffset);
  CurrentValue := Column.CurrentValue;
  while Column.NextValue(CurrentValue, CurrentValue) and
    ((DrawRect.Bottom - PickerRect.Bottom) < (0)) and
    (CurrentValue <= Column.GetMaxValue) do
  begin
    DrawRect.Offset(0, DrawRect.Height);
    LocalPaintCell(DrawRect, CurrentValue, Column.DrawOffset = 0,
      DrawRect = SelectedRect);
  end;

  Drawer.DrawPickerBorder(Canvas, FBorderSize, Column, Drawer.GetBorderColor(False, False));

  if ColumnIndex = FMouseOver then
  begin
    DrawArrowWidth := MulDiv(ArrowWidth, Screen.PixelsPerInch, 96);
    DrawButtonInfo := TPickerButtonDrawInfo.Create;
    try
      DrawButtonInfo.Button := Column.UpButton;
      DrawButtonInfo.BorderWidth := BorderWidth;
      DrawButtonInfo.Color := Color;
      DrawButtonInfo.ForegroundColor := Drawer.GetFontColor;
      DrawButtonInfo.PenWidth := DrawArrowWidth;
      Drawer.DrawPickerButton(Canvas, DrawButtonInfo);
      DrawButtonInfo.Button := Column.DownButton;
      Drawer.DrawPickerButton(Canvas, DrawButtonInfo);
    finally
      FreeAndNil(DrawButtonInfo);
    end;
  end;
end;

procedure TPickerPopupControl.PaintColumn(Column: TPickerColumn; Drawer: TPickerDrawer;
  ColumnIndex: Integer);
var
  Bitmap: TBitmap;
  DestRect: TRect;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Width, Height);
    PaintColumn(Bitmap.Canvas, Column, Drawer, ColumnIndex);
    DestRect := Column.DropDownBounds;
    DestRect.Offset(FBorderSize, FBorderSize);
    Canvas.CopyRect(Column.DropDownBounds, Bitmap.Canvas, Column.DropDownBounds);
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TPickerPopupControl.PaintColumns(const Canvas: TCanvas;
  const Drawer: TPickerDrawer);
var
  I: Integer;
begin
  for I := 0 to Length(FColumns) - 1 do
    PaintColumn(Canvas, FColumns[I], FDrawer, I);
end;

procedure TPickerPopupControl.PaintOkCancel(Canvas: TCanvas; Drawer: TPickerDrawer);
var
  Bitmap: TBitmap;
  DrawButtonInfo: TPickerButtonDrawInfo;
  DrawArrowWidth: Integer;
begin
  if not ShowOkCancel then
    Exit;
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Width, Height);
    DrawArrowWidth := MulDiv(ArrowWidth, Screen.PixelsPerInch, 96);

    DrawButtonInfo := TPickerButtonDrawInfo.Create;
    try
      DrawButtonInfo.Button := FOkCancelButtons.OkButton;
      DrawButtonInfo.BorderWidth := BorderWidth;
      DrawButtonInfo.Color := Color;
      DrawButtonInfo.ForegroundColor := Drawer.GetFontColor;
      DrawButtonInfo.PenWidth := DrawArrowWidth;
      Drawer.DrawOkCancel(Bitmap.Canvas, FOkCancelButtons, DrawButtonInfo, Drawer.GetBorderColor(False, False));
    finally
      FreeAndNil(DrawButtonInfo);
    end;
    Canvas.CopyRect(FOkCancelButtons.Bounds, Bitmap.Canvas, FOkCancelButtons.Bounds);
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TPickerPopupControl.SetBorderColor(Value: TColor);
begin
  FBorderColor := Value;
  Invalidate;
end;

procedure TPickerPopupControl.SetDropdownCount(Value: Integer);
begin
  FDropDownCount := Value;
end;

procedure TPickerPopupControl.SetHighlightColor(Value: TColor);
begin
  FHighlightColor := Value;
  Invalidate;
end;

procedure TPickerPopupControl.SetHotColor(Value: TColor);
begin
  FHotColor := Value;
  Invalidate;
end;

procedure TPickerPopupControl.SetMouseOver(Value: Integer);
begin
  if FMouseOver = Value then
    Exit;
  if FMouseOver <> -1 then
    PaintColumn(FColumns[FMouseOver], FDrawer, Value);
  FMouseOver := Value;
  if Value <> -1 then
    PaintColumn(FColumns[FMouseOver], FDrawer, Value);
end;

procedure TPickerPopupControl.SetMouseOverPoint(Value: TPoint);
begin
  if FMouseOverPoint = Value then
    Exit;
  FMouseOverPoint := Value
end;

procedure TPickerPopupControl.SetMouseOverValue(Value: Integer);
begin
  if FMouseOverValue = Value then
    Exit;
  FMouseOverValue := Value;
end;

procedure TPickerPopupControl.SetSelectionColor(Value: TColor);
begin
  FSelectionColor := Value;
  Invalidate;
end;

procedure TPickerPopupControl.SetSelectionFontColor(Value: TColor);
begin
  FSelectionFontColor := Value;
  Invalidate;
end;

procedure TPickerPopupControl.SetShowOkCancel(Value: Boolean);
begin
  FShowOkCancel := Value;
end;

procedure TPickerPopupControl.UpdateHoverItems(Point: TPoint);
var
  i, Value, Delta: Integer;
begin
  for i := 0 to Length(FColumns) - 1 do
  begin
    if FColumns[i].DropDownBounds.Contains(Point) then
    begin
      MouseOver := i;
      if FColumns[i].UpButton.BoundsRect.Contains(Point) then
      begin
        MouseOverValue := -1;
        FColumns[i].UpButton.State := pbsHot;
      end
      else if FColumns[i].DownButton.BoundsRect.Contains(Point) then
      begin
        MouseOverValue := -1;
        FColumns[i].DownButton.State := pbsHot
      end
      else
      begin
        FColumns[i].UpButton.State := pbsNone;
        FColumns[i].DownButton.State := pbsNone;
        if GetCellValueByMousePos(Point, Value, Delta) then
        begin
          MouseOverValue := Value;
          MouseOverPoint := Point;
        end;
      end;
      InvalidateRect(Handle, FColumns[i].DropDownBounds, False);
      Break;
    end
    else
    begin
      FColumns[i].UpButton.State := pbsNone;
      FColumns[i].DownButton.State := pbsNone;
      InvalidateRect(Handle, FColumns[i].UpButton.BoundsRect, False);
      InvalidateRect(Handle, FColumns[i].DownButton.BoundsRect, False);
    end;
  end;

  if ShowOkCancel and FOkCancelButtons.OkButton.BoundsRect.Contains(Point) then
  begin
    FOkCancelButtons.OkButton.State := pbsHot;
    MouseOver := -1;
  end
  else
    FOkCancelButtons.OkButton.State := pbsNone;

  if ShowOkCancel and FOkCancelButtons.CancelButton.BoundsRect.Contains(Point)
  then
  begin
    FOkCancelButtons.CancelButton.State := pbsHot;
    MouseOver := -1;
  end
  else
    FOkCancelButtons.CancelButton.State := pbsNone;
  InvalidateRect(Handle, FOkCancelButtons.Bounds, False);
end;

procedure TPickerPopupControl.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  Msg.Result := Msg.Result or DLGC_WANTARROWS;
end;

procedure TPickerPopupControl.WMLButtonDown(var Msg: TWMLButtonDown);
var
  P: TPoint;
  Value, Delta: Integer;
  Column: TPickerColumn;
begin
  inherited;

  P := Point(Msg.XPos, Msg.YPos);

  if FOkCancelButtons.OkButton.BoundsRect.Contains(P) and
    (FParentOwner is TBasePickerControl) then
  begin
    FOkCancelButtons.OkButton.State := pbsPressed;
    PaintOkCancel(Canvas, FDrawer);
  end
  else if FOkCancelButtons.CancelButton.BoundsRect.Contains(P) and
    (FParentOwner is TBasePickerControl) then
  begin
    FOkCancelButtons.CancelButton.State := pbsPressed;
    PaintOkCancel(Canvas, FDrawer);
  end;

  Column := GetColumnByMousePos(P);
  if not Assigned(Column) then
    Exit;

  if Column.UpButton.BoundsRect.Contains(P) then
  begin
    if Column.PreviousValue(Column.CurrentValue, Value) then
      AnimateColumnValueChanged(Column, Value, -1);
    Column.UpButton.State := pbsPressed;
  end
  else if Column.DownButton.BoundsRect.Contains(P) then
  begin
    if Column.NextValue(Column.CurrentValue, Value) then
      AnimateColumnValueChanged(Column, Value, 1);
    Column.DownButton.State := pbsPressed;
  end
  else if GetCellValueByMousePos(P, Value, Delta) and (Delta <> 0) then
    AnimateColumnValueChanged(Column, Value, Delta);
end;

procedure TPickerPopupControl.WMLButtonUp(var Msg: TWMLButtonUp);
var
  P: TPoint;
begin
  inherited;

  P := Point(Msg.XPos, Msg.YPos);

  if FOkCancelButtons.OkButton.BoundsRect.Contains(P) and
    (FParentOwner is TBasePickerControl) then
    (FParentOwner as TBasePickerControl).CloseUp(True)
  else if FOkCancelButtons.CancelButton.BoundsRect.Contains(P) and
    (FParentOwner is TBasePickerControl) then
    (FParentOwner as TBasePickerControl).CloseUp(False);
end;

{ TPickerSlideAnimation }

procedure TPickerSlideAnimation.Animate(Current: Cardinal);
begin
  Column.DrawOffset := Round(FCoef * Current);
  FControl.PaintColumn(Column, FControl.FDrawer, FControl.MouseOver);
end;

procedure TPickerSlideAnimation.DoOnFinish;
begin
  Column.DrawOffset := 0;
  Column.CurrentValue := NextValue;
  inherited;
end;

procedure TPickerSlideAnimation.DoPrepare;
begin
  inherited;
  FCoef := (Delta * FControl.FItemHeight) / Duration;
  FControl.MouseOverValue := -1;
end;

{ TDateProvider }

function TDateProvider.GetDate: TDate;
begin
  Result := FDate;
end;

function TDateProvider.GetMaxYear: Integer;
begin
  Result := FMaxYear;
end;

function TDateProvider.GetMinYear: Integer;
begin
  Result := FMinYear;
end;

procedure TDateProvider.SetDate(Value: TDate);
begin
  FDate := Value;
end;

procedure TDateProvider.SetMaxYear(Value: Integer);
begin
  FMaxYear := Value;
end;

procedure TDateProvider.SetMinYear(Value: Integer);
begin
  FMinYear := Value;
end;

destructor TBasePickerAnimation.Destroy;
begin
  FreeAndNil(FTimer);
  inherited;
end;

procedure TBasePickerAnimation.DoOnFinish;
begin
  if Assigned(OnFinished) then
    OnFinished(Self);
end;

procedure TBasePickerAnimation.DoPrepare;
begin

end;

procedure TBasePickerAnimation.Finish;
begin
  if (IsStarted) then
  begin
    Animate(Duration);
    FreeAndNil(FTimer);
    FIsStarted := False;
    DoOnFinish;
  end;
end;

procedure TBasePickerAnimation.Start(Duration, Interval: Cardinal);
begin
  FDuration := Duration;
  FInterval := Interval;
  StartDefault;
end;

procedure TBasePickerAnimation.StartDefault;
begin
  FWhenStarted := GetTickCount;
  DoPrepare;

  FreeAndNil(FTimer);
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := TimerTick;
  FTimer.Interval := Interval;
  FTimer.Enabled := True;

  FIsStarted := True;
  TimerTick(FTimer);

  if Assigned(OnStarted) then
    OnStarted(Self);
end;

procedure TBasePickerAnimation.TimerTick(Sender: TObject);
var
  Current: Cardinal;
begin
  Current := GetTickCount - WhenStarted;
  if (Current + Interval >= Duration) then
    Finish
  else
    Animate(Current);
end;

{ TTimeProvider }

function TTimeProvider.GetMinutesIncrement: TMinuteIncrement;
begin
  Result := FMinutesIncrement;
end;

function TTimeProvider.GetTime: TTime;
begin
  Result := FTime;
end;

function TTimeProvider.GetUseAmPm: Boolean;
begin
  Result := FUseAmPm;
end;

procedure TTimeProvider.SetMinutesIncrement(Value: TMinuteIncrement);
begin
  FMinutesIncrement := Value;
end;

procedure TTimeProvider.SetTime(Value: TTime);
begin
  FTime := Value;
end;

procedure TTimeProvider.SetUseAmPm(Value: Boolean);
begin
  FUseAmPm := Value;
end;

{ TTimeColumn }

constructor TTimeColumn.Create(const TimeProvider: ITimeProvider);
begin
  inherited Create;
  FTimeProvider := TimeProvider;
end;

function TTimeColumn.GetActualTime: TTime;
begin
  Result := FTimeProvider.Time;
end;

procedure TTimeColumn.SetActualTime(Value: TTime);
begin
  FTimeProvider.Time := Value;
end;

function TPickerHourColumn.GetCurrentValue: Integer;
begin
  if TimeProvider.UseAmPm and (HourOf(ActualTime) > 12) then
    Result := HourOf(ActualTime) - 12
  else
    Result := HourOf(ActualTime);
  if TimeProvider.UseAmPm and (Result = 0) then
    Result := 12;
end;

function TPickerHourColumn.GetMaxValue: Integer;
begin
  if TimeProvider.UseAmPm then
    Result := 12
  else
    Result := 23;
end;

function TPickerHourColumn.GetMinValue: Integer;
begin
  Result := Ord(TimeProvider.UseAmPm);
end;

function TPickerHourColumn.GetValueString(Value: Integer): string;
begin
  if (TimeProvider.UseAmPm) and (Value > 12) then
    Result := FormatDateTime(FHourFormat, EncodeTime(Value - 12,
      MinuteOf(ActualTime), SecondOf(ActualTime), MilliSecondOf(ActualTime)))
  else
  begin
    if (TimeProvider.UseAmPm) and (Value = 0) then
      Value := 12;
    Result := FormatDateTime(FHourFormat,
      EncodeTime(Value, MinuteOf(ActualTime), SecondOf(ActualTime),
      MilliSecondOf(ActualTime)));
  end;
end;

procedure TPickerHourColumn.SetCurrentValue(Value: Integer);
var
  Hour, Minute, Second, MiliSecond: Word;
begin
  DecodeTime(ActualTime, Hour, Minute, Second, MiliSecond);
  ActualTime := EncodeTime(Value, Minute, Second, MiliSecond);
end;

procedure TPickerHourColumn.SetHourFormat(const Value: string);
begin
  FHourFormat := Value;
end;

function TPickerMinuteColumn.GetCurrentValue: Integer;
begin
  Result := MinuteOf(ActualTime);
end;

function TPickerMinuteColumn.GetMaxValue: Integer;
begin
  Result := Trunc(59 / TimeProvider.MinutesIncrement) *
    TimeProvider.MinutesIncrement;
end;

function TPickerMinuteColumn.GetMinValue: Integer;
begin
  Result := 0;
end;

function TPickerMinuteColumn.GetValueString(Value: Integer): string;
var
  TempFormat: string;
  // 'mm' pattern could be treated as minutes or months as well, so it should be forced to 'nn'
begin
  TempFormat := StringReplace(FMinuteFormat, 'm', 'n',
    [rfReplaceAll, rfIgnoreCase]);
  Result := FormatDateTime(TempFormat, EncodeTime(HourOf(ActualTime), Value,
    SecondOf(ActualTime), MilliSecondOf(ActualTime)));
end;

function TPickerMinuteColumn.NextValue(Value: Integer; out NextValue: Integer): Boolean;
begin
  Result := True;
  if Value >= GetMaxValue then
  begin
    if IsCyclic then
      NextValue := GetMinValue
    else
      Result := False;
  end
  else
  begin
    NextValue := Round(Value / TimeProvider.MinutesIncrement) *
      TimeProvider.MinutesIncrement + TimeProvider.MinutesIncrement;
  end;
end;

function TPickerMinuteColumn.PreviousValue(Value: Integer; out PrevValue: Integer): Boolean;
begin
  Result := True;
  if Value <= GetMinValue then
  begin
    if IsCyclic then
      PrevValue := GetMaxValue
    else
      Result := False;
  end
  else
  begin
    PrevValue := Round(Value / TimeProvider.MinutesIncrement) *
      TimeProvider.MinutesIncrement - TimeProvider.MinutesIncrement;
  end;
end;

procedure TPickerMinuteColumn.SetCurrentValue(Value: Integer);
var
  Hour, Minute, Second, MiliSecond: Word;
begin
  DecodeTime(ActualTime, Hour, Minute, Second, MiliSecond);
  ActualTime := EncodeTime(Hour, Trunc(Value / TimeProvider.MinutesIncrement) *
    TimeProvider.MinutesIncrement, Second, MiliSecond);
end;

procedure TPickerMinuteColumn.SetMinuteFormat(const Value: string);
begin
  FMinuteFormat := Value;
end;

function TPickerAMPMColumn.GetCurrentValue: Integer;
begin
  Result := Ord(not FAm);
end;

function TPickerAMPMColumn.GetMaxValue: Integer;
begin
  Result := 1;
end;

function TPickerAMPMColumn.GetMinValue: Integer;
begin
  Result := 0;
end;

function TPickerAMPMColumn.GetValueString(Value: Integer): string;
begin
  if Value = 1 then
    Result := FormatDateTime(FAMPMFormat, EncodeTime(13, 0, 0, 0))
  else
    Result := FormatDateTime(FAMPMFormat, EncodeTime(1, 0, 0, 0))
end;

function TPickerAMPMColumn.IsCyclic: Boolean;
begin
  Result := False;
end;

procedure TPickerAMPMColumn.SetAMPMFormat(const Value: string);
begin
  FAMPMFormat := Value;
end;

procedure TPickerAMPMColumn.SetCurrentValue(Value: Integer);
begin
  FAm := Value = 0;
end;

{ TCustomTimePicker }

constructor TCustomTimePicker.Create(AOwner: TComponent);
begin
  inherited;
  FTimeProvider := TTimeProvider.Create;
  Time := Now;
  MinuteIncrement := 1;

  FTimeFormat := FormatSettings.ShortTimeFormat;
  ParseFormat(FTimeFormat);

  InitColumns;
end;

procedure TCustomTimePicker.AcceptDropDown;
begin
  Time := GetTimeFromColumns;
end;

procedure TCustomTimePicker.DefineColumns(Columns: TList<TPickerColumn>);
var
  LColumn: TPickerColumn;
begin
  if not Assigned(FColumns) then
    Exit;
  for LColumn in FColumns do
    Columns.Add(LColumn);
  SetTimeToColumns(Time);
end;

function TCustomTimePicker.GetMinuteIncrement: TMinuteIncrement;
begin
  Result := FTimeProvider.MinutesIncrement;
end;

function TCustomTimePicker.GetTimeFromColumns: TTime;
var
  Column: TPickerColumn;
  HourColumn: TPickerHourColumn absolute Column;
  MinuteColumn: TPickerMinuteColumn absolute Column;
  SecondColumn: TPickerSecondColumn absolute Column;
  AMPMColumn: TPickerAMPMColumn absolute Column;
  Hour, Minute, Second, MiliSecond: Word;
  PM: Boolean;
begin
  DecodeTime(FTime, Hour, Minute, Second, MiliSecond);
  PM := False;

  if FColumns <> nil then
    for Column in FColumns do
    begin
      if Column is TPickerHourColumn then
        Hour := HourColumn.CurrentValue
      else if Column is TPickerMinuteColumn then
        Minute := MinuteColumn.CurrentValue
      else if Column is TPickerAMPMColumn then
        PM := AMPMColumn.CurrentValue = 1
      else if Column is TPickerSecondColumn then
        Second := SecondColumn.CurrentValue;
    end;

  if FTimeProvider.UseAmPm and PM and (Hour < 12) then
    Result := EncodeTime(Hour + 12, Minute, Second, MiliSecond)
  else if FTimeProvider.UseAmPm and not PM and (Hour >= 12) then
    Result := EncodeTime(Hour - 12, Minute, Second, MiliSecond)
  else
    Result := EncodeTime(Hour, Minute, Second, MiliSecond)
end;

procedure TCustomTimePicker.InitColumns;
begin
  SetTimeToColumns(Time);
  if HandleAllocated then
    CalcSizes(ClientRect.Size);
end;

procedure TCustomTimePicker.ParseFormat(const Format: string);
const
  TimeFormatRegExp = '(hh|h)|(nn|n)|(mm|m)|(ss|s)|(ampm)'; // do not localize
var
  Match: TMatch;
  Matches: TMatchCollection;
  Value: string;
  HourColumn: TPickerHourColumn;
  MinuteColumn: TPickerMinuteColumn;
  SecondColumn: TPickerSecondColumn;
  AMPMColumn: TPickerAMPMColumn;
begin
  FreeAndNil(FColumns);
  FColumns := TObjectList<TPickerColumn>.Create(True);

  Matches := TRegEx.Matches(Format, TimeFormatRegExp,
    [roSingleLine, roIgnoreCase, roNotEmpty]);

  FTimeProvider.UseAmPm := Pos('AM', UpperCase(Format)) > 0;

  for Match in Matches do
  begin
    if not Match.Success then
      Continue;

    Value := Match.Value;
    if Value.Length = 0 then
      Continue;

    case LowerCase(Value)[1] of
      'h':
        begin
          HourColumn := TPickerHourColumn.Create(FTimeProvider);
          HourColumn.HourFormat := Value;
          FColumns.Add(HourColumn);
        end;
      'n', 'm':
        begin
          MinuteColumn := TPickerMinuteColumn.Create(FTimeProvider);
          MinuteColumn.MinuteFormat := Value;
          FColumns.Add(MinuteColumn);
        end;
      's':
        begin
          SecondColumn := TPickerSecondColumn.Create(FTimeProvider);
          SecondColumn.SecondFormat := Value;
          FColumns.Add(SecondColumn);
        end;
      'a':
        begin
          AMPMColumn := TPickerAMPMColumn.Create(FTimeProvider);
          AMPMColumn.AMPMFormat := Value;
          FColumns.Add(AMPMColumn);
        end;
    end;
  end;
  AdjustSize;
end;

procedure TCustomTimePicker.RejectDropDown;
begin
  SetTimeToColumns(Time);
end;

procedure TCustomTimePicker.SetMinuteIncrement(Value: TMinuteIncrement);
begin
  FTimeProvider.MinutesIncrement := Value;
end;

procedure TCustomTimePicker.SetTime(Value: TTime);
begin
  if FTime = Value then
    Exit;
  FTime := Value;
  DoOnChange;
  SetTimeToColumns(FTime);
  Invalidate;
end;

procedure TCustomTimePicker.SetTimeFormat(const Value: string);
begin
  if FTimeFormat = Value then
    Exit;
  FTimeFormat := Value;
  ParseFormat(FTimeFormat);
  InitColumns;
  Invalidate;
end;

procedure TCustomTimePicker.SetTimeToColumns(Value: TTime);
var
  Column: TPickerColumn;
  HourColumn: TPickerHourColumn absolute Column;
  MinuteColumn: TPickerMinuteColumn absolute Column;
  SecondColumn: TPickerSecondColumn absolute Column;
  AMPMColumn: TPickerAMPMColumn absolute Column;
  Hour, Minute, Second, MiliSecond: Word;
  AM: Boolean;
begin
  DecodeTime(Value, Hour, Minute, Second, MiliSecond);
  AM := IsAM(Value);

  if Assigned(FColumns) then
    for Column in FColumns do
    begin
      if Column is TPickerHourColumn then
        HourColumn.CurrentValue := Hour
      else if Column is TPickerMinuteColumn then
        MinuteColumn.CurrentValue := Minute
      else if Column is TPickerAMPMColumn then
        AMPMColumn.CurrentValue := Ord(not AM)
      else if Column is TPickerSecondColumn then
        SecondColumn.CurrentValue := Second;
    end;
end;

{ TPickerViewInfo }

constructor TPickerViewInfo.Create;
begin
  inherited;
  FFont := TFont.Create;
end;

destructor TPickerViewInfo.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TPickerViewInfo.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

{ TPickerOkCancelButtons }

constructor TPickerOkCancelButtons.Create;
begin
  inherited;
  FOkButton := TPickerButton.Create;
  FOkButton.ButtonType := pbtOk;
  FCancelButton := TPickerButton.Create;
  FCancelButton.ButtonType := pbtCancel;
end;

destructor TPickerOkCancelButtons.Destroy;
begin
  FreeAndNil(FOkButton);
  FreeAndNil(FCancelButton);
  inherited;
end;

procedure TPickerOkCancelButtons.Calculate(Rect: TRect; ItemHeight, BorderWidth: Integer);
var
  BottomRect, CancelRect: TRect;
begin
  BottomRect := Rect.SplitRect(srBottom, ItemHeight);
  Bounds := BottomRect;
  BottomRect.Inflate(-BorderWidth, -BorderWidth);
  OkButton.BoundsRect := BottomRect.SplitRect(srLeft, 0.5);
  CancelRect := BottomRect.SplitRect(srRight, 0.5);
  CancelRect.Left := OkButton.BoundsRect.Right;
  CancelButton.BoundsRect := CancelRect;
end;

{ TPickerButtonDrawInfo }

function TPickerButtonDrawInfo.GetButtonType: TPickerButtonType;
begin
  Result := FButton.ButtonType;
end;

{ TPickerDrawerStyled }

function TPickerDrawerStyled.GetBorderColor(Hot, Pressed: Boolean): TColor;
begin
  Result := inherited;
  if not (seBorder in FPickerControl.StyleElements) then
    Exit;

  if Pressed or Hot then
    Result := StyleServices.GetSystemColor(clHighlight)
  else
    Result := MiddleColor(StyleServices.GetSystemColor(clHighlight), StyleServices.GetSystemColor(clWindow));
end;

function TPickerDrawerStyled.GetButtonColor(Hot, Pressed: Boolean): TColor;
begin
  Result := inherited;
  if not(seClient in FPickerControl.StyleElements) then
    Exit;

  if Pressed then
    Result := StyleServices.GetStyleColor(scButtonPressed)
  else if Hot then
    Result := StyleServices.GetStyleColor(scButtonHot)
  else
    Result := StyleServices.GetStyleColor(scButtonNormal)
end;

function TPickerDrawerStyled.GetButtonFontColor(Hot, Pressed: Boolean): TColor;
begin
  Result := inherited;
  if not(seClient in FPickerControl.StyleElements) then
    Exit;

  Result := StyleServices.GetSystemColor(clBtnText);
end;

function TPickerDrawerStyled.GetColor(Hot, Pressed, Enabled: Boolean): TColor;
begin
  Result := inherited;
  if not (seClient in FPickerControl.StyleElements) then
    Exit;
  Result := StyleServices.GetStyleColor(scEdit);
  if not Enabled then
    Result := MiddleColor(Result, StyleServices.GetSystemColor(clBtnFace));
end;

function TPickerDrawerStyled.GetFontColor: TColor;
begin
  Result := inherited;
  if seFont in FPickerControl.StyleElements then
    Result := StyleServices.GetStyleFontColor(sfEditBoxTextNormal)
end;

function TPickerDrawerStyled.GetHighlightColor: TColor;
begin
  Result := inherited;
  if seClient in FPickerControl.StyleElements then
    Result := StyleServices.GetSystemColor(clBtnHighlight);
end;

function TPickerDrawerStyled.GetPopupColor: TColor;
begin
  Result := inherited;
  if seClient in FPickerControl.StyleElements then
    Result := StyleServices.GetStyleColor(scGrid);
end;

function TPickerDrawerStyled.GetSelectionColor: TColor;
begin
  Result := inherited;
  if not(seClient in FPickerControl.StyleElements) then
    Exit;
  Result := StyleServices.GetSystemColor(clHighlight);
end;

function TPickerDrawerStyled.GetSelectionFontColor: TColor;
begin
  Result := inherited;
  if not(seClient in FPickerControl.StyleElements) then
    Exit;
  Result := StyleServices.GetSystemColor(clHighlightText);
end;

function TPickerSecondColumn.GetCurrentValue: Integer;
begin
  Result := SecondOf(ActualTime);
end;

function TPickerSecondColumn.GetMaxValue: Integer;
begin
  Result := 59;
end;

function TPickerSecondColumn.GetMinValue: Integer;
begin
  Result := 0;
end;

function TPickerSecondColumn.GetValueString(Value: Integer): string;
begin
  Result := FormatDateTime(FSecondFormat, EncodeTime(HourOf(ActualTime), MinuteOf(ActualTime),
    Value, MilliSecondOf(ActualTime)));
end;

procedure TPickerSecondColumn.SetCurrentValue(Value: Integer);
var
  Hour, Minute, Second, MiliSecond: Word;
begin
  DecodeTime(ActualTime, Hour, Minute, Second, MiliSecond);
  if Value < GetMinValue then
    Second := GetMinValue
  else if Value > GetMaxValue then
    Second := GetMaxValue
  else
    Second := Value;

  ActualTime := EncodeTime(Hour, Minute, Second, MiliSecond);
end;

procedure TPickerSecondColumn.SetSecondFormat(const Value: string);
begin
  FSecondFormat := Value;
end;

end.
