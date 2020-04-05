{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Platform;

{$I FMX.Defines.inc}

(*$HPPEMIT '#if defined(WIN32) && defined(CreateWindow)'*)
(*$HPPEMIT '  #define __SAVE_CREATEWINDOW CreateWindow'*)
(*$HPPEMIT '  #undef  CreateWindow'*)
(*$HPPEMIT '#endif'*)

(*$HPPEMIT END '#if defined(__SAVE_CREATEWINDOW)'*)
(*$HPPEMIT END '  #define CreateWindow __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '  #undef  __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '#endif'*)

interface

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, FMX.Types, FMX.Forms, FMX.Menus, FMX.Dialogs;

type
  EInvalidFmxHandle = class(Exception);

{ Abstract platform class }

{ TPlatform }

  TPlatform = class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Application }
    procedure Run; virtual; abstract;
    procedure Terminate; virtual; abstract;
    function HandleMessage: Boolean; virtual; abstract;
    procedure WaitMessage; virtual; abstract;
    { System Metrics }
    function GetDefaultFontFamilyName: String; virtual; abstract;
    { Timer }
    function CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle; virtual; abstract;
    function DestroyTimer(Timer: TFmxHandle): Boolean; virtual; abstract;
    function GetTick: Single; virtual; abstract;
    { Window }
    function FindForm(AHandle: TFmxHandle): TCommonCustomForm; virtual; abstract;
    function CreateWindow(AForm: TCommonCustomForm): TFmxHandle; virtual; abstract;
    procedure DestroyWindow(AForm: TCommonCustomForm); virtual; abstract;
    procedure ReleaseWindow(AForm: TCommonCustomForm); virtual; abstract;
    procedure SetWindowState(AForm: TCommonCustomForm; const AState: TWindowState); virtual; abstract;
    procedure ShowWindow(AForm: TCommonCustomForm); virtual; abstract;
    procedure HideWindow(AForm: TCommonCustomForm); virtual; abstract;
    function ShowWindowModal(AForm: TCommonCustomForm): TModalResult; virtual; abstract;
    procedure InvalidateWindowRect(AForm: TCommonCustomForm; R: TRectF); virtual; abstract;
    procedure SetWindowRect(AForm: TCommonCustomForm; ARect: TRectF); virtual; abstract;
    function GetWindowRect(AForm: TCommonCustomForm): TRectF; virtual; abstract;
    function GetClientSize(AForm: TCommonCustomForm): TPointF; virtual; abstract;
    procedure SetClientSize(AForm: TCommonCustomForm; const ASize: TPointF); virtual; abstract;
    procedure SetWindowCaption(AForm: TCommonCustomForm; const ACaption: string); virtual; abstract;
    procedure SetCapture(AForm: TCommonCustomForm); virtual; abstract;
    procedure ReleaseCapture(AForm: TCommonCustomForm); virtual; abstract;
    function ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF; virtual; abstract;
    function ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF; virtual; abstract;
    { Menus }
    procedure StartMenuLoop(const AView: IMenuView); virtual; abstract;
    function ShortCutToText(ShortCut: TShortCut): string; virtual; abstract;
	  procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState); virtual; abstract;
    function TextToShortCut(Text: string): integer; virtual; abstract;
    procedure CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer); virtual; abstract;
    procedure UpdateMenuItem(const AItem: TMenuItem); virtual; abstract;
    { Drag and Drop }
    procedure BeginDragDrop(AForm: TCommonCustomForm; const Data: TDragObject; ABitmap: TBitmap); virtual; abstract;
    { Clipboard }
    procedure SetClipboard(Value: Variant); virtual; abstract;
    function GetClipboard: Variant; virtual; abstract;
    { Cursor }
    procedure SetCursor(AForm: TCommonCustomForm; const ACursor: TCursor); virtual; abstract;
    { Mouse }
    function GetMousePos: TPointF; virtual; abstract;
    { Screen }
    function GetScreenSize: TPointF; virtual; abstract;
    { International }
    function GetCurrentLangID: string; virtual; abstract;
    function GetLocaleFirstDayOfWeek: string; virtual; abstract;
    { Dialogs }
    function DialogOpenFiles(var FileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; virtual; abstract;
    function DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean; virtual; abstract;
    function PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
      AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; virtual; abstract;
    function DialogPageSetup(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
      var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; virtual; abstract;
    function DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; virtual; abstract;
    function DialogPrinterSetup: Boolean; virtual; abstract;
    { Keyboard }
    function ShowVirtualKeyboard(AControl: TFmxObject): Boolean; virtual;
    function HideVirtualKeyboard: Boolean; virtual;
    { Text Service }
    function GetTextServiceClass: TTextServiceClass; virtual; abstract;
  end;

  TPlatformClass = class of TPlatform;

function PlatformClass: TPlatformClass;

var
  Platform: TPlatform = nil;

implementation

{$IFDEF IOS}
uses
  FMX.Platform.iOS, FMX.Canvas.iOS, FMX.Context.GLES;
{$ENDIF}

{$IFDEF MACOS}
uses
  FMX.Platform.Mac, FMX.Canvas.Mac, FMX.Context.Mac;
{$ENDIF}

{$IFDEF MSWINDOWS}
uses
  FMX.Platform.Win, FMX.Context.DX9;
{$ENDIF}

function PlatformClass: TPlatformClass;
begin
  Result := ActualPlatformClass;
end;

{ TPlatform }

constructor TPlatform.Create;
begin
  inherited;
end;

destructor TPlatform.Destroy;
begin
  inherited;
end;

function TPlatform.ShowVirtualKeyboard(AControl: TFmxObject): Boolean;
begin
  Result := False;
end;

function TPlatform.HideVirtualKeyboard: Boolean;
begin
  Result := False;
end;

end.
