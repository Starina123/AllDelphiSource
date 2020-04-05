{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Mac;

interface

uses FMX.Types, FMX.Platform, Macapi.ObjectiveC;

function ActualPlatformClass: TPlatformClass;
function FmxHandleToObjC(FmxHandle: TFmxHandle): IObjectiveC;

implementation

{$R *.res}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.TypInfo, System.SyncObjs,
  FMX.Forms, FMX.Dialogs, FMX.Menus, Macapi.CocoaTypes, Macapi.Foundation, Macapi.AppKit,
  Macapi.ObjCRuntime, Macapi.CoreFoundation, System.RegularExpressions, System.StrUtils,
  System.Variants, FMX.Consts, System.Generics.Collections, FMX.Context.Mac;

type
{$M+}
  TApplicationDelegate = class(TOCLocal, NSApplicationDelegate)
  public
    procedure applicationWillTerminate(Notification: Pointer); cdecl;
    procedure applicationDidFinishLaunching(Notification: Pointer); cdecl;
  end;

  { TPlatformCocoa }

  TPlatformCocoa = class(TPlatform)
  private
    NSApp: NSApplication;
    FAppDelegate: NSApplicationDelegate;
    FRunLoopObserver: CFRunLoopObserverRef;
    FAppKitMod: HMODULE;
    FHandleCounter: TFmxHandle;
    FObjectiveCMap: TDictionary<TFmxHandle, IObjectiveC>;
    FModalStack: TStack<TCommonCustomForm>;
    FRestartModal: Boolean;
    function NewFmxHandle: TFmxHandle;
    procedure ValidateHandle(FmxHandle: TFmxHandle);
    function HandleToObjC(FmxHandle: TFmxHandle): IObjectiveC; overload;
    function HandleToObjC(FmxHandle: TFmxHandle; const IID: TGUID; out Intf): Boolean; overload;
    function AllocHandle(const Objc: IObjectiveC): TFmxHandle;
    procedure DeleteHandle(FmxHandle: TFmxHandle);
    procedure CreateChildMenuItems(AChildMenu: IItemsContainer; AParentMenu: NSMenu);
    procedure CreateApplicationMenu;
    procedure DoReleaseWindow(AForm: TCommonCustomForm);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { App }
    procedure Run; override;
    procedure Terminate; override;
    function HandleMessage: Boolean; override;
    procedure WaitMessage; override;
    { System Metrics }
    function GetDefaultFontFamilyName: String; override;
    { Timer }
    function CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle; override;
    function DestroyTimer(Timer: TFmxHandle): Boolean; override;
    function GetTick: single; override;
    { Window }
    function FindForm(AHandle: TFmxHandle): TCommonCustomForm; override;
    function CreateWindow(AForm: TCommonCustomForm): TFmxHandle; override;
    procedure DestroyWindow(AForm: TCommonCustomForm); override;
    procedure ReleaseWindow(AForm: TCommonCustomForm); override;
    procedure ShowWindow(AForm: TCommonCustomForm); override;
    procedure HideWindow(AForm: TCommonCustomForm); override;
    function ShowWindowModal(AForm: TCommonCustomForm): TModalResult; override;
    procedure InvalidateWindowRect(AForm: TCommonCustomForm; R: TRectF); override;
    procedure SetWindowRect(AForm: TCommonCustomForm; ARect: TRectF); override;
    function GetWindowRect(AForm: TCommonCustomForm): TRectF; override;
    function GetClientSize(AForm: TCommonCustomForm): TPointF; override;
    procedure SetClientSize(AForm: TCommonCustomForm; const ASize: TPointF); override;
    procedure SetWindowCaption(AForm: TCommonCustomForm; const ACaption: string); override;
    procedure SetCapture(AForm: TCommonCustomForm); override;
    procedure SetWindowState(AForm: TCommonCustomForm; const AState: TWindowState); override;
    procedure ReleaseCapture(AForm: TCommonCustomForm); override;
    function ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    function ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    { Menus }
    procedure StartMenuLoop(const AView: IMenuView); override;
    function ShortCutToText(ShortCut: TShortCut): string; override;
    procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState); override;
    function TextToShortCut(Text: String): integer; override;
    procedure CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer); override;
    procedure UpdateMenuItem(const AItem: TMenuItem); override;
    { Drag and Drop }
    procedure BeginDragDrop(AForm: TCommonCustomForm; const Data: TDragObject; ABitmap: TBitmap);
      override;
    { Clipboard }
    procedure SetClipboard(Value: Variant); override;
    function GetClipboard: Variant; override;
    { Cursor }
    procedure SetCursor(AForm: TCommonCustomForm; const ACursor: TCursor); override;
    { Mouse }
    function GetMousePos: TPointF; override;
    { Screen }
    function GetScreenSize: TPointF; override;
    { International }
    function GetCurrentLangID: string; override;
    function GetLocaleFirstDayOfWeek: string; override;
    { Dialogs }
    function DialogOpenFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; override;
    function DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean; override;
    function PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF; AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; override;
    function DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF; var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; override;
    function DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; override;
    function DialogPrinterSetup: Boolean; override;
    { Text Service }
    function GetTextServiceClass: TTextServiceClass; override;
  end;

{$M+}
  TFMXWindow = class;
  TTextServiceCocoa = class;

  TFMXViewBase = class(TOCLocal, NSTextInputClient)
  private
    FOwner: TFMXWindow;
    FShift: TShiftState;
    FMarkedRange: NSRange;
    FBackingStore: NSMutableAttributedString;//NSTextStorage;
    FSelectedRange: NSRange;
  protected
    function GetNativeView: NSView;
  public
    constructor Create(AOwner: TFMXWindow);
    destructor Destroy; override;
    function acceptsFirstResponder: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
    procedure rightMouseDown(theEvent: NSEvent); cdecl;
    procedure rightMouseUp(theEvent: NSEvent); cdecl;
    procedure drawRect(dirtyRect: NSRect); cdecl;
//    function menuForEvent(event: Pointer {NSEvent}): Pointer; {NSMenu}      // May need to do something special to delegate this method.
    procedure keyDown(event: NSEvent); cdecl;
    procedure keyUp(event: NSEvent); cdecl;
    procedure mouseUp(event: NSEvent); cdecl;
    procedure mouseDown(event: NSEvent); cdecl;
    procedure mouseDragged(event: NSEvent); cdecl;
    procedure mouseMoved(event: NSEvent); cdecl;
    procedure scrollWheel(event: NSEvent); cdecl;
    { NSTextInputClient }
    procedure insertText(text: Pointer {NSString}; replacementRange: NSRange); cdecl;
    procedure doCommandBySelector(selector: SEL); cdecl;
    procedure setMarkedText(text: Pointer {NSString}; selectedRange: NSRange; replacementRange: NSRange); cdecl;
    procedure unMarkText; cdecl;
    function selectedRange: NSRange; cdecl;
    function markedRange: NSRange; cdecl;
    function hasMarkedText: Boolean; cdecl;
    function attributedSubstringForProposedRange(aRange: NSRange; actualRange: PNSRange): NSAttributedString; cdecl;
    function validAttributesForMarkedText: Pointer {NSArray}; cdecl;
    function firstRectForCharacterRange(aRange: NSRange; actualRange: PNSRange): NSRect; cdecl;
    function characterIndexForPoint(aPoint: NSPoint): NSUInteger; cdecl;
    function attributedString: NSAttributedString; cdecl;
    function fractionOfDistanceThroughGlyphForPoint(aPoint: NSPoint): CGFloat; cdecl;
    function baselineDeltaForCharacterAtIndex(anIndex: NSUInteger): CGFloat; cdecl;
    function windowLevel: NSInteger; cdecl;
    function drawsVerticallyForCharacterAtIndex(charIndex: NSUInteger): Boolean; cdecl;
    { Text Service }
    function FocusedTextService: TTextServiceCocoa;
    procedure UpdateTextServiceControl;
    { }
    property NativeView: NSView read GetNativeView;
    property Owner: TFMXWindow read FOwner;
  end;

  FMXView = interface(NSView)
    ['{56304E8C-08A2-4386-B116-D4E364FDC2AD}']
    function acceptsFirstResponder: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
    procedure rightMouseDown(theEvent: NSEvent); cdecl;
    procedure rightMouseUp(theEvent: NSEvent); cdecl;
    procedure drawRect(dirtyRect: NSRect); cdecl;
    procedure keyDown(event: NSEvent); cdecl;
    procedure keyUp(event: NSEvent); cdecl;
    procedure mouseUp(event: NSEvent); cdecl;
    procedure mouseDown(event: NSEvent); cdecl;
    procedure mouseDragged(event: NSEvent); cdecl;
    procedure mouseMoved(event: NSEvent); cdecl;
    procedure scrollWheel(event: NSEvent); cdecl;
  end;

  TFMXView = class(TFMXViewBase, NSTextInputClient)
  public
    constructor Create(AOwner: TFMXWindow; AFRameRect: NSRect);
    function GetObjectiveCClass: PTypeInfo; override;
  end;

  FMXView3D = interface(NSOpenGLView)
    ['{FC9E6699-53C6-4117-BAF0-A7BD455BAF75}']
    function acceptsFirstResponder: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
    procedure rightMouseDown(theEvent: NSEvent); cdecl;
    procedure rightMouseUp(theEvent: NSEvent); cdecl;
    procedure drawRect(dirtyRect: NSRect); cdecl;
    procedure keyDown(event: NSEvent); cdecl;
    procedure keyUp(event: NSEvent); cdecl;
    procedure mouseUp(event: NSEvent); cdecl;
    procedure mouseDown(event: NSEvent); cdecl;
    procedure mouseDragged(event: NSEvent); cdecl;
    procedure mouseMoved(event: NSEvent); cdecl;
    procedure scrollWheel(event: NSEvent); cdecl;
  end;

  TFMXView3D = class(TFMXViewBase, NSTextInputClient)
  public
    constructor Create(AOwner: TFMXWindow; AFrameRect: NSRect);
    destructor Destroy; override;
    function GetObjectiveCClass: PTypeInfo; override;
  end;

  FMXWindow = interface(NSWindow)
    ['{A4C4B329-38C4-401F-8937-1C380801B1C8}']
    function draggingEntered(Sender: Pointer): NSDragOperation; cdecl;
    procedure draggingExited(Sender: Pointer {id}); cdecl;
    function draggingUpdated(Sender: Pointer): NSDragOperation; cdecl;
    function performDragOperation(Sender: Pointer): Boolean; cdecl;
    function canBecomeKeyWindow: Boolean; cdecl;
    function canBecomeMainWindow: Boolean; cdecl;
    function acceptsFirstResponder: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
    function performKeyEquivalent(event: NSEvent): Boolean; cdecl;
  end;

  FMXPanelWindow = interface(NSPanel)
    ['{52EB2081-6E73-4D3E-8EF9-8008275A7D6B}']
    function draggingEntered(Sender: Pointer): NSDragOperation; cdecl;
    procedure draggingExited(Sender: Pointer {id}); cdecl;
    function draggingUpdated(Sender: Pointer): NSDragOperation; cdecl;
    function performDragOperation(Sender: Pointer): Boolean; cdecl;
    function canBecomeKeyWindow: Boolean; cdecl;
    function canBecomeMainWindow: Boolean; cdecl;
    function acceptsFirstResponder: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
  end;

  TFMXWindow = class(TOCLocal) //(NSWindow)
  private
    FViewObj: TFMXViewBase;
    FDelegate: NSWindowDelegate;
    FDelayRelease: Boolean;
  protected
    function GetView: NSView;
  public
    NeedUpdateShadow: Boolean;
    Wnd: TCommonCustomForm;
    LastEvent: NSEvent; // for DragNDrop
    function GetObjectiveCClass: PTypeInfo; override;
    destructor Destroy; override;
    function windowShouldClose(Sender: Pointer {id}): Boolean; cdecl;
    procedure windowWillClose(notification: NSNotification); cdecl;
    procedure windowDidBecomeKey(notification: NSNotification); cdecl;
    procedure windowDidResignKey(notification: NSNotification); cdecl;
    procedure windowDidResize(notification: NSNotification); cdecl;
    procedure windowDidMove(notification: NSNotification); cdecl;
    function draggingEntered(Sender: Pointer {NSDraggingInfo}): NSDragOperation; cdecl;
    procedure draggingExited(Sender: Pointer {NSDraggingInfo} {id}); cdecl;
    function draggingUpdated(Sender: Pointer {NSDraggingInfo}): NSDragOperation; cdecl;
    function performDragOperation(Sender: Pointer {NSDraggingInfo}): Boolean; cdecl;
    function acceptsFirstResponder: Boolean; cdecl;
    function canBecomeKeyWindow: Boolean; cdecl;
    function canBecomeMainWindow: Boolean; cdecl;
    function becomeFirstResponder: Boolean; cdecl;
    function resignFirstResponder: Boolean; cdecl;
    function performKeyEquivalent(event: NSEvent): Boolean; cdecl;
    property View: NSView read GetView;
  end;
  PFMXWindow = ^TFMXWindow;

  TFMXPanelWindow = class(TFMXWindow)
  public
    function GetObjectiveCClass: PTypeInfo; override;
    function canBecomeMainWindow: Boolean; cdecl;
  end;

  { TTextServiceCocoa }
  TTextServiceCocoa = class(TTextService)
  private
    FCaretPostion: TPoint;
    FText : string;
    FMarkedText : string;
    FImeMode: TImeMode;
  protected
    function GetText: string; override;
    procedure SetText(const Value: string); override;
    function GetCaretPostion: TPoint; override;
    procedure SetCaretPostion(const Value: TPoint); override;

  public
    procedure InternalSetMarkedText( const AMarkedText: string ); override;
    function InternalGetMarkedText: string; override;

    function CombinedText: string; override;
    function TargetClausePosition: TPoint; override;

    procedure EnterControl(const FormHandle: TFmxHandle); override;
    procedure ExitControl(const FormHandle: TFmxHandle); override;


    procedure DrawSingleLine( Canvas: TCanvas;
      const ARect: TRectF; const FirstVisibleChar: integer; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); override;

    procedure DrawSingleLine2( Canvas: TCanvas;
      const S: string;
      const ARect: TRectF;

      const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); override;

    function HasMarkedText: boolean; override;

    function GetImeMode: TImeMode; override;
    procedure SetImeMode(const Value: TImeMode); override;

    { Cocoa }
  private
    FMarkedRange: NSRange;
    FSelectedRange: NSRange;
  public
    constructor Create(const Owner: TControl; SupportMultiLine: Boolean); override;
    destructor Destroy; override;
//    function InternalGetMarkedRect: TRectF; virtual;
    procedure SetMarkedRange(const Value: NSRange);
    procedure SetSselectedRange(const Value: NSRange);
  end;


//procedure ShortCutToKey(ShortCut: TShortCut; var Key: Char; var ModifierMask: NSUInteger); forward;
(*
implementation

{$R *.res}

uses {FMX.Canvas.Mac, }System.RegularExpressions, System.StrUtils, System.Variants, FMX.Consts;
*)
function ActualPlatformClass: TPlatformClass;
begin
  Result := TPlatformCocoa;
end;

procedure ShortCutToMACKey(ShortCut: TShortCut; var Key: Char; var ModifierMask: NSUInteger);
var
  K: byte;
begin
  K := Lo(ShortCut);
  ModifierMask := 0;
  case K of
    Ord('A')..Ord('Z') : Key := Char(K+ Ord('a') - Ord('A'));
    $08 : Key := Char(NSBackspaceCharacter);
    $09 : Key := Char(NSTabCharacter);
    $0d : Key := Char(NSEnterCharacter);
    $21 : Key := Char(NSPageUpFunctionKey);
    $22 : Key := Char(NSPageDownFunctionKey);
    $23 : Key := Char(NSEndFunctionKey);
    $24 : Key := Char(NSHomeFunctionKey);
    $25 : Key := Char(NSLeftArrowFunctionKey);
    $26 : Key := Char(NSUpArrowFunctionKey);
    $27 : Key := Char(NSRightArrowFunctionKey);
    $28 : Key := Char(NSDownArrowFunctionKey);
    $2e : Key := Char(NSDeleteCharacter);
    $70..$87 : Key := Char(NSF1FunctionKey+(K-$70));
  else
    Key := Chr(K);
  end;
  if ShortCut and scCommand <> 0 then
    ModifierMask := ModifierMask or NSCommandKeyMask;
  if ShortCut and scShift <> 0 then
    ModifierMask := ModifierMask or NSShiftKeyMask;
  if ShortCut and scCtrl <> 0 then
    ModifierMask := ModifierMask or NSControlKeyMask;
  if ShortCut and scAlt <> 0 then
    ModifierMask := ModifierMask or NSAlternateKeyMask;
end;

var
  NSFMXPBoardtype: NSString;
//  pool: NSAutoreleasePool;
//  appDel: ApplicationDelegate;
//  NSVGScenePBoardtype: NSString;

{ TApplicationDelegate }

procedure TApplicationDelegate.applicationWillTerminate(Notification: Pointer);
begin
  Application.Free;
  Application := nil;
end;

procedure TApplicationDelegate.applicationDidFinishLaunching(Notification: Pointer);
begin

end;

{ TPlatformCocoa }

constructor TPlatformCocoa.Create(AOwner: TComponent);
var
  AutoReleasePool: NSAutoreleasePool;
begin
  inherited;
  FAppKitMod := LoadLibrary('/System/Library/Frameworks/AppKit.framework/AppKit');
  AutoReleasePool := TNSAutoreleasePool.Create;
  try
    AutoReleasePool.init;
    NSApp := TNSApplication.Wrap(TNSApplication.OCClass.sharedApplication);
    FAppDelegate := TApplicationDelegate.Create;
    NSApp.setDelegate(FAppDelegate);
    Application := TApplication.Create(nil);
    FObjectiveCMap := TDictionary<TFmxHandle, IObjectiveC>.Create;
  finally
    AutoReleasePool.release;
  end;
  NSFMXPBoardtype := NSSTR('NSFMXPBoardtype' + IntToStr(Integer(Pointer(Application))));
  SelectOpenGLContext;
end;

destructor TPlatformCocoa.Destroy;
begin
  if FModalStack <> nil then
    FModalStack.Free;
  FreeLibrary(FAppKitMod);
  FreeAndNil(Application);
  FObjectiveCMap.Free;
  inherited;
end;

{ App =========================================================================}

procedure RunLoopObserverCallback(observer: CFRunLoopObserverRef; activity: CFRunLoopActivity; info: Pointer); cdecl;
var
  Done: Boolean;
begin
  Done := False;
  if (TThread.CurrentThread.ThreadID = MainThreadID) then
    CheckSynchronize;
  Application.DoIdle(Done);
end;

procedure TPlatformCocoa.Run;
begin
  Application.RealCreateForms;
  CreateApplicationMenu;
  FRunLoopObserver := CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, True, 0, RunLoopObserverCallback, nil);
  CFRunLoopAddObserver(CFRunLoopGetCurrent, FRunLoopObserver, kCFRunLoopCommonModes);
  NSApp.Run;
end;

procedure TPlatformCocoa.Terminate;
begin
  NSApp.terminate(nil);
end;

function TPlatformCocoa.HandleToObjC(FmxHandle: TFmxHandle): IObjectiveC;
begin
  TMonitor.Enter(FObjectiveCMap);
  try
    ValidateHandle(FmxHandle);
    if FObjectiveCMap.ContainsKey(FmxHandle) then
      Result := FObjectiveCMap[FmxHandle]
    else
      Result := nil;
  finally
    TMonitor.Exit(FObjectiveCMap);
  end;
end;

function TPlatformCocoa.HandleMessage: Boolean;
begin
  WaitMessage;
  Result := false;
end;

procedure TPlatformCocoa.WaitMessage;
var
  TimeoutDate: NSDate;
begin
  TimeoutDate := TNSDate.Wrap(TNSDate.OCClass.dateWithTimeIntervalSinceNow(0.1));
  NSApp.nextEventMatchingMask(NSAnyEventMask, TimeoutDate, NSDefaultRunLoopMode, False);
end;

{ Timer =======================================================================}

type
  CocoaTimer = interface(NSObject)
    ['{337887FF-BA77-4703-BE0E-34DC1CB26276}']
    procedure timerEvent; cdecl;
                                                                                  
    procedure release; cdecl;
  end;

  TCocoaTimer = class(TOCLocal)
  private
    FFunc : TTimerProc;
  public
    function GetObjectiveCClass: PTypeInfo; override;
    procedure timerEvent; cdecl;
    procedure SetTimerFunc(AFunc: TTimerProc);
    procedure release; cdecl;
  end;

function TCocoaTimer.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(CocoaTimer);
end;

procedure TCocoaTimer.timerEvent;
begin
  if Assigned(@FFunc) then FFunc;
end;

procedure TCocoaTimer.release;
var
  RC: Integer;
begin
  RC := NSObject(Super).retainCount;
  NSObject(Super).release;
  if RC = 1 then
    Destroy;
end;

procedure TCocoaTimer.SetTimerFunc(AFunc: TTimerProc);
begin
  FFunc := AFunc;
end;

function TPlatformCocoa.CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle;
var
  Timer: NSTimer;
  User: TCocoaTimer;
  LInterval: NSTimeInterval;
begin
  User := TCocoaTimer.Create;
  try
    User.SetTimerFunc(TimerFunc);
    LInterval := Interval/1000;

    Timer := TNSTimer.Wrap(TNSTimer.OCClass.scheduledTimerWithTimeInterval(LInterval,
      User.GetObjectID, sel_getUid('timerEvent'), User.GetObjectID, True));

    Result := AllocHandle(Timer);
  finally
    {user is retained (twice, because it's target), by the timer and }
    {released (twice) on timer invalidation}
    NSObject(User.Super).release;
  end;
end;

function TPlatformCocoa.DestroyTimer(Timer: TFmxHandle): Boolean;
var
  CocoaTimer: NSTimer;
begin
  Result := False;
  if HandleToObjC(Timer, NSTimer, CocoaTimer) then
  begin
    Result := True;
    CocoaTimer.invalidate;
    DeleteHandle(Timer);
  end;
end;

function TPlatformCocoa.GetTick: single;
var
  H, M, S, MS: word;
begin
  DecodeTime(time, H, M, S, MS);
  Result := ((((H * 60 * 60) + (M * 60) + S) * 1000) + MS) / 1000;
end;

{ Window ======================================================================}

const
  kCGBaseWindowLevelKey = 0;
  kCGMinimumWindowLevelKey = 1;
  kCGDesktopWindowLevelKey = 2;
  kCGBackstopMenuLevelKey = 3;
  kCGNormalWindowLevelKey = 4;
  kCGFloatingWindowLevelKey = 5;
  kCGTornOffMenuWindowLevelKey = 6;
  kCGDockWindowLevelKey = 7;
  kCGMainMenuWindowLevelKey = 8;
  kCGStatusWindowLevelKey = 9;
  kCGModalPanelWindowLevelKey = 10;
  kCGPopUpMenuWindowLevelKey = 11;
  kCGDraggingWindowLevelKey = 12;
  kCGScreenSaverWindowLevelKey = 13;
  kCGMaximumWindowLevelKey = 14;
  kCGOverlayWindowLevelKey = 15;
  kCGHelpWindowLevelKey = 16;
  kCGUtilityWindowLevelKey = 17;
  kCGDesktopIconWindowLevelKey = 18;
  kCGCursorWindowLevelKey = 19;
  kCGAssistiveTechHighWindowLevelKey = 20;
  kCGNumberOfWindowLevelKeys = 21; { Must be last. }

{ TFMXView }

function TFMXView.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(FMXView);
end;

constructor TFMXView.Create(AOwner: TFMXWindow; AFrameRect: NSRect);
var
  V: Pointer;
begin
  inherited Create(AOwner);
  V := NSView(Super).initWithFrame(AFrameRect);
  if GetObjectID <> V then
    UpdateObjectID(V);
end;

{ Text Service }

constructor TTextServiceCocoa.Create(const Owner: TControl; SupportMultiLine: Boolean);
begin
  inherited;
end;

destructor TTextServiceCocoa.Destroy;
begin
  inherited;
end;

function TTextServiceCocoa.GetText: string;
begin
  Result := FText;
end;

procedure TTextServiceCocoa.SetText(const Value: string);
begin
  FText := Value;
end;

function TTextServiceCocoa.GetCaretPostion: TPoint;
begin
  Result := FCaretPostion;
end;

procedure TTextServiceCocoa.SetCaretPostion(const Value: TPoint);
begin
  FCaretPostion := Value;
end;

procedure TTextServiceCocoa.InternalSetMarkedText( const AMarkedText: string );
begin
  FMarkedText := AMarkedText;
end;

function TTextServiceCocoa.InternalGetMarkedText: string;
begin
  Result := FMarkedText;
end;

function TTextServiceCocoa.CombinedText: string;
begin
  if FMarkedText <> '' then
    Result := Copy(FText, 1, FCaretPostion.X) + FMarkedText + Copy(FText, FCaretPostion.X + 1, MaxInt)
  else
    Result := FText;
end;

function TTextServiceCocoa.TargetClausePosition: TPoint;
begin
  Result := CaretPosition;
end;

procedure TTextServiceCocoa.EnterControl(const FormHandle: TFmxHandle);
begin
end;

procedure TTextServiceCocoa.ExitControl(const FormHandle: TFmxHandle);
begin
end;

procedure TTextServiceCocoa.DrawSingleLine( Canvas: TCanvas;
      const ARect: TRectF; const FirstVisibleChar: integer; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter );

  function _TextWidth(const Str: string): Single;
  var
    R: TRectF;
  begin
    R := TRectF.Create(0, 0, 0, 0);
    GetMeasureBitmap.Canvas.Font.Assign(Font);
    GetMeasureBitmap.Canvas.MeasureText(R, Str, False, Flags, TTextAlign.taLeading, TTextAlign.taCenter);
    Result := RectWidth(R);
  end;

var
  i: Integer;
  R: TRectF;
  State: TCanvasSaveState;
  BeforeCaret, AfterCaret: string;
  WholeTextWidth: Single;
  EditRectWidth: Single;
  MarkedLineBottom: Single;
  S: String;
begin
  S := Copy(Text, 1, CaretPosition.X) + FMarkedText + Copy(Text, CaretPosition.X+1,  MaxInt);
  Canvas.FillText(ARect, Copy(S, FirstVisibleChar, Length(S) - FirstVisibleChar + 1), False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X))                       - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FMarkedRange.length))) - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  AOpacity);
  Canvas.StrokeThickness := 3;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FSelectedRange.location)))                       - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FSelectedRange.location) + Integer(FSelectedRange.length))) - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  AOpacity);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
end;

procedure TTextServiceCocoa.DrawSingleLine2( Canvas: TCanvas;
      const S: string;
      const ARect: TRectF;

      const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter );

  function _TextWidth(const Str: string): Single;
  var
    R: TRectF;
  begin
    R := TRectF.Create(0, 0, 0, 0);
    GetMeasureBitmap.Canvas.Font.Assign(Font);
    GetMeasureBitmap.Canvas.MeasureText(R, Str, False, Flags, TTextAlign.taLeading, TTextAlign.taCenter);
    Result := RectWidth(R);
  end;

var
  i: Integer;
  R: TRectF;
  State: TCanvasSaveState;
  BeforeCaret, AfterCaret: string;
  WholeTextWidth: Single;
  EditRectWidth: Single;
  MarkedLineBottom: Single;
begin
{$IFDEF __LOG}
writeln('*TTextServiceCocoa.DrawSingleLine2- enter');
writeln('             S:[', S, ']');
writeln('   FMarkedText:[', FMarkedText, ']');
writeln('FSelectedRange: loc:', FSelectedRange.location, ' len:', FSelectedRange.length);
writeln('  FMarkedRange: loc:', FMarkedRange.location, ' len:', FMarkedRange.length);
{$ENDIF}

  Canvas.FillText(ARect, S, False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X)),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FMarkedRange.length))),
                         MarkedLineBottom),
                  AOpacity);

  Canvas.StrokeThickness := 3;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FSelectedRange.location))),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Integer(FSelectedRange.location) + Integer(FSelectedRange.length))),
                         MarkedLineBottom),
                  AOpacity);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;

{$IFDEF __LOG}
writeln('*TTextServiceCocoa.DrawSingleLine2- exit');
{$ENDIF}
end;

function TTextServiceCocoa.HasMarkedText: boolean;
begin
  Result := FMarkedText <> '';
end;

function TTextServiceCocoa.GetImeMode: TImeMode;
begin
  Result := FImeMode;
end;

procedure TTextServiceCocoa.SetImeMode(const Value: TImeMode);
begin
  FImeMode := Value;
end;

procedure TTextServiceCocoa.SetMarkedRange(const Value: NSRange);
begin
  FMarkedRange := Value;
end;

procedure TTextServiceCocoa.SetSselectedRange(const Value: NSRange);
begin
  FSelectedRange := Value;
end;

function TPlatformCocoa.GetTextServiceClass: TTextServiceClass;
begin
  Result := TTextServiceCocoa;
end;

{ TFMXViewBase }

constructor TFMXViewBase.Create(AOwner: TFMXWindow);
//var
//  LayoutMgr: NSLayoutManager;
//  TextContainer: NSTextContainer;
//  R: TRectF;
//  IMEContainerSize: NSSize;
//  ParaStyle: NSMutableParagraphStyle;
//  DefaultAttribs: NSMutableDictionary;
begin
  inherited Create;
  FOwner := AOwner;
  FBackingStore := TNSMutableAttributedString.Create;
  FBackingStore := TNSMutableAttributedString.Wrap(FBackingStore.initWithString(NSSTR('')));
  FMarkedRange.location := NSNotFound;
  FMarkedRange.length := 0;
  FSelectedRange.location := 0;
  FSelectedRange.length := 0;
  UpdateTextServiceControl;
end;

destructor TFMXViewBase.Destroy;
begin
  FBackingStore.release;
  FOwner := nil;
  inherited;
end;

procedure TFMXViewBase.drawRect(dirtyRect: NSRect);
var
  VR: TRectF;
  nctx: NSGraphicsContext;
  boundRect: NSRect;
begin
  boundRect := NSView(Super).bounds;
  VR := RectF(dirtyRect.origin.x, boundRect.size.height - dirtyRect.origin.y - dirtyRect.size.height,
    dirtyRect.origin.x + dirtyRect.size.width, boundRect.size.height - dirtyRect.origin.y);

  if (FOwner <> nil) and (FOwner.Wnd <> nil) and not (FOwner.Wnd is TCustomForm3D) then
  begin
    nctx := TNSGraphicsContext.Wrap(TNSGraphicsContext.OCClass.currentContext);

    FOwner.Wnd.ContextHandle := THandle(nctx.graphicsPort);
    FOwner.Wnd.PaintRects([VR]);
    FOwner.Wnd.ContextHandle := 0;

    if FOwner.NeedUpdateShadow and NSWindow(FOwner.Super).isVisible then
    begin
      NSWindow(FOwner.Super).invalidateShadow;
      FOwner.NeedUpdateShadow := False;
    end;
  end;

  if (FOwner <> nil) and (FOwner.Wnd is TCustomForm3D) then
  begin
    FOwner.Wnd.PaintRects([VR]);
    if FOwner.NeedUpdateShadow and FOwner.Wnd.Visible { isVisible} then
    begin
      NSWindow(FOwner.Super).invalidateShadow;
      FOwner.NeedUpdateShadow := False;
    end;
  end;
end;

function TFMXViewBase.GetNativeView: NSView;
begin
  Result := NSView(Super);
end;

function ShiftStateFromModFlags(M: NSUInteger): TShiftState;
begin
  Result := [];
  if M and NSShiftKeyMask = NSShiftKeyMask then
  begin
    Include(Result, ssShift);
    M := M and not NSShiftKeyMask;
  end;
  if M and NSControlKeyMask = NSControlKeyMask then
  begin
    Include(Result, ssCtrl);
    M := M and not NSControlKeyMask;
  end;
  if M and NSAlternateKeyMask = NSAlternateKeyMask then
  begin
    Include(Result, ssAlt);
    M := M and not NSAlternateKeyMask;
  end;
  if M and NSCommandKeyMask = NSCommandKeyMask then
  begin
    Include(Result, ssCommand);
  end;
end;

procedure TFMXViewBase.rightMouseDown(theEvent: NSEvent);
var
  mp: NSPoint;
  SS: TShiftState;
begin
  mp := theEvent.locationInWindow;
  mp.y := NativeView.bounds.size.height - mp.y;
  SS := [ssRight] + ShiftStateFromModFlags(theEvent.modifierFlags);
  try
    FOwner.Wnd.mouseDown(TMouseButton.mbRight, SS, mp.x, mp.y);
  except
    Application.HandleException(Self);
  end;
  NativeView.rightMouseDown(theEvent);
end;

procedure TFMXViewBase.rightMouseUp(theEvent: NSEvent);
var
  mp: NSPoint;
  SS: TShiftState;
begin
  mp := theEvent.locationInWindow;
  mp.y := NativeView.bounds.size.height - mp.y;
  SS := [ssRight] + ShiftStateFromModFlags(theEvent.modifierFlags);
  try
    FOwner.Wnd.mouseUp(TMouseButton.mbRight, SS, mp.x, mp.y);
  except
    Application.HandleException(Self);
  end;
  NativeView.rightMouseUp(theEvent);
end;

procedure TFMXViewBase.mouseUp(event: NSEvent);
var
  mp: NSPoint;
  SS: TShiftState;
begin
  FOwner.LastEvent := nil;
  mp := event.locationInWindow;
  mp.y := TNSView.Wrap(event.window.contentView).bounds.size.height - mp.y;
  SS := [ssLeft] + ShiftStateFromModFlags(event.modifierFlags);
  try
    FOwner.Wnd.MouseUp(TMouseButton.mbLeft, SS, mp.x, mp.y);
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXViewBase.mouseDown(event: NSEvent);
var
  mp: NSPoint;
  SS: TShiftState;
begin
  mp := event.locationInWindow;
  mp.y := TNSView.Wrap(event.window.contentView).bounds.size.height - mp.y;
  FOwner.LastEvent:= event;
  SS := [ssLeft] + ShiftStateFromModFlags(event.modifierFlags);
  if event.clickCount = 2 then
    Include(SS, ssDouble);
  try
    FOwner.Wnd.MouseDown(TMouseButton.mbLeft, SS, mp.x, mp.y);
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXViewBase.mouseDragged(event: NSEvent);
var
  mp: NSPoint;
begin
  if event.window <> nil then
  begin
    mp := event.locationInWindow;
    mp.y := TNSView.Wrap(event.window.contentView).bounds.size.height - mp.y;
    try
      FOwner.LastEvent := event;
      FOwner.Wnd.MouseMove([ssLeft], mp.x, mp.y);
      FOwner.LastEvent := nil;
    except
      Application.HandleException(Self);
    end;
  end;
end;

procedure TFMXViewBase.mouseMoved(event: NSEvent);
var
  mp: NSPoint;
begin
  mp := event.locationInWindow;
  mp.y := TNSView.Wrap(event.window.contentView).bounds.size.height - mp.y;
  try
    FOwner.Wnd.MouseMove([], mp.x, mp.y);
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXViewBase.scrollWheel(event: NSEvent);
var
  H: Boolean;
begin
  H := False;
  if event.deltaY <> 0 then
  begin
    try
      FOwner.Wnd.MouseWheel([], round(event.deltaY * 120), H);
    except
      Application.HandleException(Self);
    end;
  end;
end;

const
  KEY_ENTER        = $24;
  KEY_SPACE        = $31;
  KEY_ESC          = $35;
  KEY_F1           = $7A;
  KEY_F2           = $78;
  KEY_F3           = $63;
  KEY_F4           = $76;
  KEY_F5           = $60;
  KEY_F6           = $61;
  KEY_F7           = $62;
  KEY_F8           = $64;
  KEY_F9           = $65;
  KEY_F10          = $6D;
  KEY_F11          = $67;
  KEY_F12          = $6F;
  KEY_POWER        = $7F7F;
  KEY_TAB          = $30;
  KEY_INS          = $72;
  KEY_DEL          = $75;
  KEY_HOME         = $73;
  KEY_END          = $77;
  KEY_PAGUP        = $74;
  KEY_PAGDN        = $79;
  KEY_UP           = $7E;
  KEY_DOWN         = $7D;
  KEY_LEFT         = $7B;
  KEY_RIGHT        = $7C;
  KEY_NUMLOCK      = $47;
  KEY_NUMPAD0      = $52;
  KEY_NUMPAD1      = $53;
  KEY_NUMPAD2      = $54;
  KEY_NUMPAD3      = $55;
  KEY_NUMPAD4      = $56;
  KEY_NUMPAD5      = $57;
  KEY_NUMPAD6      = $58;
  KEY_NUMPAD7      = $59;
  KEY_NUMPAD8      = $5b;
  KEY_NUMPAD9      = $5c;
  KEY_PADDIV       = $4B;
  KEY_PADMULT      = $43;
  KEY_PADSUB       = $4E;
  KEY_PADADD       = $45;
  KEY_PADDEC       = $41;
  KEY_PADENTER     = $4C;
  KEY_BACKSPACE    = $33;
  KEY_CAPSLOCK     = $39;
  KEY_TILDE        = 50; // `/~ key
  KEY_MINUS        = 27; // -/_ key
  KEY_EQUAL        = 24; // =/+ key
  KEY_BACKSLASH    = 42; // \/| key
  KEY_LEFTBRACKET  = 33; // [/{ key
  KEY_RIGHTBRACKET = 30; // ]/} key
  KEY_SEMICOLON    = 41; // ;/: key
  KEY_QUOTE        = 39; // '/" key
  KEY_COMMA        = 43; // ,/< key
  KEY_PERIOD       = 47; // ./> key
  KEY_SLASH        = 44; // //? key

function VKeyFromKeyCode(AKeyCode: Word): Integer;
begin
  Result := 0;
  case AKeyCode of
    KEY_F1       : Result:=vkF1;
    KEY_F2       : Result:=vkF2;
    KEY_F3       : Result:=vkF3;
    KEY_F4       : Result:=vkF4;
    KEY_F5       : Result:=vkF5;
    KEY_F6       : Result:=vkF6;
    KEY_F7       : Result:=vkF7;
    KEY_F8       : Result:=vkF8;
    KEY_F9       : Result:=vkF9;
    KEY_F10      : Result:=vkF10;
    KEY_F11      : Result:=vkF11;
    KEY_F12      : Result:=vkF12;
    KEY_TAB      : Result:=vkTab;
    KEY_INS      : Result:=vkInsert;
    KEY_DEL      : Result:=vkDelete;
    KEY_HOME     : Result:=vkHome;
    KEY_END      : Result:=vkEnd;
    KEY_PAGUP    : Result:=vkPrior;
    KEY_PAGDN    : Result:=vkNext;
    KEY_UP       : Result:=vkUp;
    KEY_DOWN     : Result:=vkDown;
    KEY_LEFT     : Result:= vkLeft;
    KEY_RIGHT    : Result:= vkRight;
    KEY_NUMLOCK  : Result:= vkNumLock;
    KEY_NUMPAD0  : Result:=vkNumpad0;
    KEY_NUMPAD1  : Result:=vkNumpad1;
    KEY_NUMPAD2  : Result:=vkNumpad2;
    KEY_NUMPAD3  : Result:=vkNumpad3;
    KEY_NUMPAD4  : Result:=vkNumpad4;
    KEY_NUMPAD5  : Result:=vkNumpad5;
    KEY_NUMPAD6  : Result:=vkNumpad6;
    KEY_NUMPAD7  : Result:=vkNumpad7;
    KEY_NUMPAD8  : Result:=vkNumpad8;
    KEY_NUMPAD9  : Result:=vkNumpad9;
    KEY_PADDIV   : Result:=vkDivide;
    KEY_PADMULT  : Result:=vkMultiply;
    KEY_PADSUB   : Result:=vkSubtract;
    KEY_PADADD   : Result:=vkAdd;
    KEY_PADDEC   : Result:=vkDecimal;
    KEY_BACKSPACE: Result := vkBack;
    KEY_ENTER    : Result := vkReturn;
    KEY_ESC      : Result := vkEscape;
  end;
end;

procedure TFMXViewBase.keyDown(event: NSEvent);
var
  K: word;
  Ch: WideChar;
  Shift: TShiftState;
  VKKeyCode: Integer;
begin
                                                        
  if hasMarkedText then // IME's conversion window.is active.
  begin
    NativeView.inputContext.handleEvent(event);
    exit;
  end;
  Shift := [] + ShiftStateFromModFlags(event.modifierFlags);
  VKKeyCode := VKeyFromKeyCode(event.keyCode);
  if VKKeyCode <> 0 then
  begin
    K := VKKeyCode;
    Ch := #0;
    FOwner.FDelayRelease := True;
    try
      try
        FOwner.Wnd.KeyDown(K, Ch, Shift);
        if (K <> 0) and (VKKeyCode  >= vkNumpad0) and (VKKeyCode <= vkDivide) then
          NativeView.inputContext.handleEvent(event);
      except
        Application.HandleException(Self);
      end;
    finally
      FOwner.FDelayRelease := False;
      if csDestroying in FOwner.Wnd.ComponentState then
        FOwner.Wnd.Release;
    end;
    Exit;
  end;
  FShift := Shift;

  NativeView.inputContext.handleEvent(event);
//  if FMarkRange.length = 0 then
//  begin
//    K := event.keyCode;
//    Ch := #0;
//    FOwner.Wnd.KeyDown(K, Ch, Shift);
//  end;
end;

procedure TFMXViewBase.keyUp(event: NSEvent);
var
  S: string;
  K: word;
  Ch: WideChar;
  Shift: TShiftState;
  VKKeyCode: Integer;
begin
  if hasMarkedText then // IME's conversion window.is active.
    exit;
  FShift := [];
  Shift := [] + ShiftStateFromModFlags(event.modifierFlags);

  VKKeyCode := VKeyFromKeyCode(event.keyCode);
  if VKKeyCode <> 0 then
  begin
    K := VKKeyCode;
    Ch := #0;
    try
      FOwner.Wnd.KeyUp(K, Ch, Shift);
    except
      Application.HandleException(Self);
    end;
    Exit;
  end
  else
  begin
    S := UTF8ToString(event.characters.UTF8String);
    if Length(S) > 0 then
    begin
      K := 0;
      Ch := S[1];
      try
        FOwner.Wnd.KeyUp(K, Ch, Shift);
      except
        Application.HandleException(Self);
      end;
    end;
  end;
end;

function TFMXViewBase.acceptsFirstResponder: Boolean;
begin
  Result := True;
end;

function TFMXViewBase.becomeFirstResponder: Boolean;
begin
  Result := True;
end;

function TFMXViewBase.resignFirstResponder: Boolean;
begin
  Result := True;
end;

{ NSTextInputClient implementation }

function TFMXViewBase.firstRectForCharacterRange(aRange: NSRange;
  actualRange: PNSRange): NSRect;
var
  glyphRect: NSRect;
  R: TRectF;
  TSObj: ITextServiceControl;
begin

  if (FOwner.Wnd.Focused <> nil) and Supports(FOwner.Wnd.Focused, ITextServiceControl, TSObj) then
  begin
    R := TRectF.Create(TSObj.GetTargetClausePointF);
  end
  else
  begin
    R := TControl(FOwner.Wnd.Focused.GetObject).AbsoluteRect;
  end;

  glyphRect := MakeNSRect(R.Left, NativeView.bounds.size.height-R.Bottom, R.Right - R.Left, R.Bottom - R.Top);
//   Convert the rect to screen coordinates
  glyphRect := NativeView.convertRectToBase(glyphRect);
  glyphRect.origin := NativeView.window.convertBaseToScreen(glyphRect.origin);
  Result := glyphRect;
end;

function TFMXViewBase.hasMarkedText: Boolean;
begin
  Result := FMarkedRange.location <> NSNotFound;
end;

function ToNSString(const text : Pointer; var NStr: NSString): Boolean;
begin
  if TNSObject.Wrap(text).isKindOfClass(objc_getClass(PAnsiChar('NSAttributedString'))) then
  begin
    NStr := TNSString.Wrap(objc_msgSend(text, sel_getUid(PAnsiChar('string'))));
    Result := True;
  end
  else
  begin
    NStr := TNSString.Wrap(text);
    Result := False;
  end;
end;

procedure TFMXViewBase.insertText(text: Pointer{NSString}; replacementRange: NSRange);
var
  i: Integer;
  K: Word;
  R : NSRange;
  Ch: WideChar;
  Str: string;
  NStr: NSString;
  IsAttrString: Boolean;
  TSC: ITextServiceControl;
begin
  unmarkText;
  NativeView.inputContext.invalidateCharacterCoordinates;
  IsAttrString := ToNSString(text, NStr);
//  if TNSObject.Wrap(text).isKindOfClass(objc_getClass(PAnsiChar('NSAttributedString'))) then
//  begin
//    NStr := TNSString.Wrap(objc_msgSend(text, sel_getUid(PAnsiChar('string'))));
//    IsAttrString := True;
//  end
//  else
//  begin
//    NStr := TNSString.Wrap(text);
//    IsAttrString := False;
//  end;

  if NStr.length > 0 then
  begin
    Str := UTF8ToString(NStr.UTF8String);
    for i := 1 to Length(Str) do
    begin
      K := 0;
      Ch := Str[i];
      try
        FOwner.Wnd.KeyDown(K, Ch, FShift);
      except
        Application.HandleException(Self);
      end;
    end;

    // Get a valid range
    if replacementRange.location = NSNotFound then
      if FMarkedRange.location <> NSNotFound then
        replacementRange := FMarkedRange
      else
        replacementRange := FSelectedRange
    else
    begin
      replacementRange.location := 0;
      replacementRange.length := 0;
    end;

    // Add the text
    FBackingStore.beginEditing;
    try
      if NStr.length = 0 then
      begin
        FBackingStore.deleteCharactersInRange(replacementRange);
        unmarkText;
      end
      else
      begin
        FMarkedRange.location := replacementRange.location;
        FMarkedRange.length := NStr.length;
        UpdateTextServiceControl;

        if IsAttrString then
          FBackingStore.replaceCharactersInRange(replacementRange, TNSAttributedString.Wrap(text))
        else
          FBackingStore.replaceCharactersInRange(replacementRange, TNSString.Wrap(text));
        unmarkText;
      end;
    finally
      FBackingStore.endEditing;
    end;
    NativeView.inputContext.invalidateCharacterCoordinates;
    NativeView.setNeedsDisplay(True);
  end;
  FBackingStore.beginEditing;
  R.location := 0;
  R.length := FBackingStore.mutableString.length;
  FBackingStore.deleteCharactersInRange(R);
  FBackingStore.endEditing;

  FMarkedRange.location := NSNotFound;
  FMarkedRange.length := 0;
  FSelectedRange.location := 0;
  FSelectedRange.length := 0;
  UpdateTextServiceControl;
end;

function TFMXViewBase.selectedRange: NSRange;
begin
  Result := FSelectedRange;
end;

procedure TFMXViewBase.setMarkedText(text: Pointer {NSString}; selectedRange,
  replacementRange: NSRange);
var
  NStr: NSString;
  IsAttrString: Boolean;
  TSC: ITextServiceControl;
begin
//function ToNSString(const text : Pointer; var NStr: NSString): Boolean;
  IsAttrString := ToNSString(text, NStr);
//  if TNSObject.Wrap(text).isKindOfClass(objc_getClass(PAnsiChar('NSAttributedString'))) then
//  begin
//    NStr := TNSString.Wrap(objc_msgSend(text, sel_getUid(PAnsiChar('string'))));
//    IsAttrString := True;
//  end
//  else
//  begin
//    NStr := TNSString.Wrap(text);
//    IsAttrString := False;
//  end;

  NativeView.inputContext.invalidateCharacterCoordinates;
  try
    if (FOwner.Wnd.Focused <> nil) and Supports(FOwner.Wnd.Focused, ITextServiceControl, TSC) then
      TSC.GetTextService.InternalSetMarkedText(UTF8ToString(NStr.UTF8String));
  except
    Application.HandleException(Self);
  end;
  // Get a valid range
  if replacementRange.location = NSNotFound then
    if FMarkedRange.location <> NSNotFound then
      replacementRange := FMarkedRange
    else
      replacementRange := FSelectedRange
  else
  begin
    replacementRange.location := 0;
    replacementRange.length := 0;
  end;

  // Add the text
  FBackingStore.beginEditing;
  try
    if NStr.length = 0 then
    begin
      FBackingStore.deleteCharactersInRange(replacementRange);
      unmarkText;
    end
    else
    begin
      FMarkedRange.location := replacementRange.location;
      FMarkedRange.length := NStr.length;
      UpdateTextServiceControl;
      if IsAttrString then
        FBackingStore.replaceCharactersInRange(replacementRange, TNSAttributedString.Wrap(text))
      else
        FBackingStore.replaceCharactersInRange(replacementRange, TNSString.Wrap(text));
    end;
  finally
    FBackingStore.endEditing;
  end;

  // Redisplay
  FSelectedRange.location := replacementRange.location + selectedRange.location;
  FSelectedRange.length := selectedRange.length;
  UpdateTextServiceControl;

  NativeView.inputContext.invalidateCharacterCoordinates;
  NativeView.setNeedsDisplay(True);
end;

procedure TFMXViewBase.unMarkText;
var
  R : NSRange;
  TSC: ITextServiceControl;
begin
//  NativeView.inputContext.invalidateCharacterCoordinates;
  try
    if (FOwner.Wnd.Focused <> Nil) and Supports(FOwner.Wnd.Focused, ITextServiceControl, TSC) then
      TSC.GetTextService.InternalSetMarkedText('');
  except
    Application.HandleException(Self);
  end;

  FMarkedRange.location := NSNotFound;
  FMarkedRange.length := 0;
  UpdateTextServiceControl;

  NativeView.inputContext.discardMarkedText;


//writeln(' unMarkText|BS Old:', UTF8ToString(FBackingStore.mutableString.UTF8String));
//  FBackingStore.beginEditing;
//  R.location := 0;
//  R.length := FBackingStore.mutableString.length;
//  FBackingStore.deleteCharactersInRange(R);
//  FBackingStore.endEditing;
//writeln(' unMarkText|BS New:', UTF8ToString(FBackingStore.mutableString.UTF8String));

end;

function TFMXViewBase.validAttributesForMarkedText: Pointer {NSArray};
var
  Attribs: array[0..1] of Pointer;
  Attrib: NSString;
  AttrArray: NSArray;
begin
  Attrib := NSMarkedClauseSegmentAttributeName;
  Attribs[0] := (Attrib as ILocalObject).GetObjectID;
  Attrib := NSGlyphInfoAttributeName;
  Attribs[1] := (Attrib as ILocalObject).GetObjectID;
  AttrArray := TNSArray.Wrap(TNSArray.OCClass.arrayWithObjects(@Attribs[0], 2));
  Result := (AttrArray as ILocalObject).GetObjectID;

//  Attrib := NSMarkedClauseSegmentAttributeName;
//  Attribs[0] := (Attrib as ILocalObject).GetObjectID;
//  AttrArray := TNSArray.Wrap(TNSArray.OCClass.arrayWithObjects(@Attribs[0], 1));
//  Result := (AttrArray as ILocalObject).GetObjectID;
end;

procedure TFMXViewBase.doCommandBySelector(selector: SEL);
begin
  NativeView.doCommandBySelector(selector);
end;

function TFMXViewBase.drawsVerticallyForCharacterAtIndex(
  charIndex: NSUInteger): Boolean;
begin
  Result := False;
end;

function TFMXViewBase.fractionOfDistanceThroughGlyphForPoint(
  aPoint: NSPoint): CGFloat;
begin
  Result := 0;
end;

function TFMXViewBase.windowLevel: NSInteger;
begin
  Result := NativeView.window.level;
end;

function TFMXViewBase.FocusedTextService: TTextServiceCocoa;
var
  TSC : ITextServiceControl;
begin
  Result := nil;
  if Owner <> nil then
    if Owner.Wnd <> nil then
      if Owner.Wnd.Focused <> nil then
        if Supports(FOwner.Wnd.Focused, ITextServiceControl, TSC) then
          Result := TTextServiceCocoa(TSC.GetTextService);
end;

procedure TFMXViewBase.UpdateTextServiceControl;
var
  TSC: ITextServiceControl;
begin
  if (FOwner.Wnd.Focused <> Nil) and Supports(FOwner.Wnd.Focused, ITextServiceControl, TSC) then
  begin
    TTextServiceCocoa( TSC.GetTextService ).SetMarkedRange(FMarkedRange);
    TTextServiceCocoa( TSC.GetTextService ).SetSselectedRange(FSelectedRange);
  end;
end;

function TFMXViewBase.attributedString: NSAttributedString;
begin
  Result := FBackingStore;
end;

function TFMXViewBase.attributedSubstringForProposedRange(aRange: NSRange;
  actualRange: PNSRange): NSAttributedString;
begin
  // Get a valid range
  if actualRange <> nil then
  begin
    if (aRange.location <> NSNotFound) and (aRange.location < (FBackingStore.length - 1)) then
      actualRange^.location := aRange.location
    else
      actualRange^.location := 0;
    if (aRange.length) <= (FBackingStore.length - actualRange^.location) then
      actualRange^.length := aRange.length
    else
      actualRange^.length := FBackingStore.length - actualRange^.location - 1;

    // Get the backing store matching the range
    if (actualRange^.location = 0) and (actualRange^.length = FBackingStore.length) then
    begin
      Result := FBackingStore;
    end
    else
    begin
      Result := FBackingStore.attributedSubstringFromRange(actualRange^);
    end;
  end
  else
    Result := nil;
end;

function TFMXViewBase.baselineDeltaForCharacterAtIndex(
  anIndex: NSUInteger): CGFloat;
begin
  Result := 0;
end;

function TFMXViewBase.characterIndexForPoint(aPoint: NSPoint): NSUInteger;
begin
  Result := 0;
end;

function TFMXViewBase.markedRange: NSRange;
begin
  Result := FMarkedRange;
end;

{ TFMXView3D }

constructor TFMXView3D.Create(AOwner: TFMXWindow; AFrameRect: NSRect);
var
  V: Pointer;
begin
  inherited Create(AOwner);
  V := NSOpenGLView(Super).initWithFrame(AFrameRect, TNSOpenGLView.OCClass.defaultPixelFormat);
  if GetObjectID <> V then
    UpdateObjectID(V);
end;

destructor TFMXView3D.Destroy;
begin
  NSOpenGLView(Super).clearGLContext;
  inherited;
end;

function TFMXView3D.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(FMXView3D);
end;

{ TFMXWindow}

function TFMXWindow.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(FMXWindow);
end;

function TFMXWindow.GetView: NSView;
begin
  Result := FViewObj.NativeView;
end;

function TFMXWindow.windowShouldClose(Sender: Pointer {id}): Boolean;
begin
  Result := False;
  if Application = nil then
    Exit;
  if Application.Terminated then
    Exit;
  try
    Result := Wnd.CloseQuery;
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXWindow.windowWillClose(notification: NSNotification);
begin
  if Application = nil then
    Exit;
  if Application.Terminated then
    Exit;
  if Wnd <> nil then
    try
      Wnd.Close;
    except
      Application.HandleException(Self);
    end;
end;

procedure TFMXWindow.windowDidBecomeKey(notification: NSNotification);
begin
  try
    Wnd.Activate;
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXWindow.windowDidResignKey(notification: NSNotification);
begin
  if (Application = nil) or (Application.Terminated) then
    Exit;
  if Wnd <> nil then
  begin
    try
      Wnd.Deactivate;
      if not Wnd.StaysOpen then
        Wnd.Close;
    except
      Application.HandleException(Self);
    end;
  end;
end;

procedure TFMXWindow.windowDidResize(notification: NSNotification);
var
  LFrame: NSRect;
begin
  LFrame := NSWindow(Super).frame;
  try
    Wnd.SetBounds(round(LFrame.origin.x),
      round(TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - LFrame.origin.y - LFrame.size.height),
      round(LFrame.size.width), round(LFrame.size.height));
  except
    Application.HandleException(Self);
  end;
end;

procedure TFMXWindow.windowDidMove(notification: NSNotification);
var
  LFrame: NSRect;
begin
  LFrame := NSWindow(Super).frame;
  try
    Wnd.SetBounds(round(LFrame.origin.x),
      round(TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - LFrame.origin.y - LFrame.size.height),
      round(LFrame.size.width), round(LFrame.size.height));
  except
    Application.HandleException(Self);
  end;
end;

var
  GlobalData: TDragObject;

function GetDataObject(sender: NSDraggingInfo): TDragObject;
var
  PBoard: NSPasteboard;
  Str: NSString;
  Arr: NSArray;
  W: string;
  I: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);

  PBoard := sender.draggingPasteboard;
  if PBoard.types.containsObject((NSFMXPboardType as ILocalObject).GetObjectID) then
  begin
    Result := GlobalData;
    Exit;
  end;

  if PBoard.types.containsObject((NSPasteboardTypeString as ILocalObject).GetObjectID) then
  begin
    Str := PBoard.stringForType(NSPasteboardTypeString);
    W := UTF8ToString(str.UTF8String);
    Result.Data := W;
  end;

  if PBoard.types.containsObject((NSFilenamesPboardType as ILocalObject).GetObjectID) then
  begin
    Arr := TNSArray.Wrap(PBoard.propertyListForType(NSFilenamesPboardType));
    SetLength(Result.Files, Arr.count);
    for I := 0 to Arr.count - 1 do
    begin
      Str := TNSString.Wrap(Arr.objectAtIndex(I));
      W := UTF8ToString(Str.UTF8String);
      Result.Files[I] := W;
    end;
  end;
end;

function TFMXWindow.draggingEntered(Sender: Pointer): NSDragOperation;
var
  mp: NSPoint;
  P: TPointF;
  DragInfo: NSDraggingInfo;
begin
  DragInfo := TNSDraggingInfo.Wrap(Sender);
  mp := DragInfo.draggingLocation;
  mp.y := View.bounds.size.height - mp.y;
  P := PointF(mp.x, mp.y);
  try
    Wnd.DragEnter(GetDataObject(DragInfo), Wnd.ClientToScreen(P));
  except
    Application.HandleException(Self);
  end;
  Result := NSDragOperationEvery;
end;

procedure TFMXWindow.draggingExited(Sender: Pointer {id});
begin
  try
    Wnd.DragLeave;
  except
    Application.HandleException(Self);
  end;
end;

function TFMXWindow.draggingUpdated(Sender: Pointer): NSDragOperation;
var
  mp: NSPoint;
  P: TPointF;
  Accept: Boolean;
  DragInfo: NSDraggingInfo;
begin
  DragInfo := TNSDraggingInfo.Wrap(Sender);
  mp := DragInfo.draggingLocation;
  mp.y := View.bounds.size.height - mp.y;
  P := PointF(mp.x, mp.y);
  Accept := False;
  try
    Wnd.DragOver(GetDataObject(DragInfo), Wnd.ClientToScreen(P), Accept);
  except
    Application.HandleException(Self);
  end;
  if Accept then
    Result := NSDragOperationLink
  else
    Result := NSDragOperationNone;
end;

function TFMXWindow.performDragOperation(Sender: Pointer): Boolean;
var
  mp: NSPoint;
  P: TPointF;
  DragInfo: NSDraggingInfo;
begin
  DragInfo := TNSDraggingInfo.Wrap(Sender);
  mp := DragInfo.draggingLocation;
  mp.y := View.bounds.size.height - mp.y;
  P := PointF(mp.x, mp.y);
  try
    Wnd.DragDrop(GetDataObject(DragInfo), Wnd.ClientToScreen(P));
  except
    Application.HandleException(Self);
  end;
  Result := True;
end;

function TFMXWindow.performKeyEquivalent(event: NSEvent): Boolean;
var
  NSChars: NSString;
  ShortcutKey: string;
  Key: Char;
  VKKeyCode: Word;
  I: Integer;
  Shift: TShiftState;
begin
  Result := False;
  if True then
  if (FViewObj <> Nil) and FViewObj.hasMarkedText then
    // IME's conversion window.is active.
    exit;
  VKKeyCode := VKeyFromKeyCode(event.keyCode);
  Shift := ShiftStateFromModFlags(event.modifierFlags);
  if VKKeyCode <> 0 then
  begin
    Key := #0;
    Wnd.KeyDown(VKKeyCode, Key, Shift);
    Result := True;
  end
  else
  begin
    NSChars := event.charactersIgnoringModifiers;
    if NSChars <> nil then
    begin
      ShortcutKey := UTF8ToString(NSChars.UTF8String);
      for I := 1 to Length(ShortcutKey) do
      begin
        Key := ShortcutKey[I];
        if (Key = SMenuAppQuitKey) and (Shift = [ssCommand]) then
          Application.Terminate
        else
        begin
          VKKeyCode := 0;
          Wnd.KeyDown(Word(Key), Key, Shift);
          //Wnd.KeyDown(VKKeyCode, Key, Shift);
          if Key = #0 then
            Result := True;
        end;
      end;
    end;
  end;
end;

function TFMXWindow.acceptsFirstResponder: Boolean;
begin
  Result := True;
end;

function TFMXWindow.becomeFirstResponder: Boolean;
begin
  Result := True;
end;

function TFMXWindow.resignFirstResponder: Boolean;
begin
  Result := True;
end;

function TFMXWindow.canBecomeKeyWindow: Boolean;
begin
  if (Wnd <> nil) and (Wnd.Handle <> 0) then
    Result := True
  else
    Result := False;
end;

function TFMXWindow.canBecomeMainWindow: Boolean;
begin
  Result := True;
end;

destructor TFMXWindow.Destroy;
begin
  if FViewObj <> nil then
  begin
    FViewObj.NativeView.setHidden(True);
    NSWindow(Super).setContentView(nil);
    FViewObj.NativeView.release;
    if FViewObj is TFMXView3D then
    begin
      FViewObj._Release;
      FViewObj := nil;
    end
    else
      FreeAndNil(FViewObj);
  end;
  if FDelegate <> nil then
  begin
    FDelegate := nil;
    NSWindow(Super).setDelegate(nil);
  end;
  if Wnd.Handle <> 0 then
    NSWindow(Super).close;
  inherited;
end;

{ TFMXWindowDelegate }

type
  TFMXWindowDelegate = class(TOCLocal, NSWindowDelegate)
  private
    FWindow: TFMXWindow;
  public
    constructor Create(AOwner: TFMXWindow);
    destructor Destroy; override;
    function windowShouldClose(Sender: Pointer {id}): Boolean; cdecl;
    procedure windowWillClose(notification: NSNotification); cdecl;
    procedure windowDidBecomeKey(notification: NSNotification); cdecl;
    procedure windowDidResignKey(notification: NSNotification); cdecl;
    procedure windowDidResize(notification: NSNotification); cdecl;
    procedure windowDidMove(notification: NSNotification); cdecl;
  end;

constructor TFMXWindowDelegate.Create(AOwner: TFMXWindow);
begin
  inherited Create;
  FWindow := AOwner;
end;

destructor TFMXWindowDelegate.Destroy;
begin
  FWindow := nil;
  inherited;
end;

procedure TFMXWindowDelegate.windowDidBecomeKey(notification: NSNotification);
begin
  FWindow.windowDidBecomeKey(notification);
end;

procedure TFMXWindowDelegate.windowDidMove(notification: NSNotification);
begin
  FWindow.windowDidMove(notification);
end;

procedure TFMXWindowDelegate.windowDidResignKey(notification: NSNotification);
begin
  FWindow.windowDidResignKey(notification);
end;

procedure TFMXWindowDelegate.windowDidResize(notification: NSNotification);
begin
  FWindow.windowDidResize(notification);
end;

function TFMXWindowDelegate.windowShouldClose(Sender: Pointer): Boolean;
begin
  Result := FWindow.windowShouldClose(Sender);
end;

procedure TFMXWindowDelegate.windowWillClose(notification: NSNotification);
var
  NSApp: NSApplication;
  ModWin: NSWindow;
begin
  NSApp := TNSApplication.Wrap(TNSApplication.OCClass.sharedApplication);
  ModWin := NSApp.modalWindow;
  if (ModWin <> nil) and (FWindow <> nil) and
    ((ModWin as ILocalObject).GetObjectID = (FWindow.Super as ILocalObject).GetObjectID) then
  begin
    NSApp.abortModal;
  end;
  FWindow.windowWillClose(notification);
end;

function TPlatformCocoa.FindForm(AHandle: TFmxHandle): TCommonCustomForm;
begin
  Result := TFMXWindow(HandleToObjC(AHandle)).Wnd;
end;

function TPlatformCocoa.CreateWindow(AForm: TCommonCustomForm): TFmxHandle;
var
  Style: NSUInteger;
  FMXWin: TFMXWindow;
  NSWin: NSWindow;
  NSTitle: NSString;
  R: NSRect;
  LocalObj: ILocalObject;
  DraggedTypes: array[0..3] of Pointer;
  RegTypes: NSArray;
begin
  if AForm.Owner is TPopup then
    FMXWin := TFMXPanelWindow.Create
  else
    FMXWin := TFMXWindow.Create;
  NSWin := NSWindow(FMXWin.Super);
  if AForm.Transparency or (AForm.BorderStyle = TFmxFormBorderStyle.bsNone) then
    Style := NSBorderlessWindowMask
  else
  begin
    Style := NSTitledWindowMask or NSUnifiedTitleAndToolbarWindowMask;
    if AForm.BorderStyle <> TFmxFormBorderStyle.bsNone then
    begin
      if TBorderIcon.biMinimize in AForm.BorderIcons then
        Style := Style or NSMiniaturizableWindowMask;
      if TBorderIcon.biMaximize in AForm.BorderIcons then
        Style := Style or NSWindowZoomButton;
      if TBorderIcon.biSystemMenu in AForm.BorderIcons then
        Style := Style or NSClosableWindowMask;
    end;
    if AForm.BorderStyle in [TFmxFormBorderStyle.bsSizeable, TFmxFormBorderStyle.bsSizeToolWin] then
      Style := Style or NSResizableWindowMask;
  end;
  R := TNSWindow.OCClass.contentRectForFrameRect(MakeNSRect(AForm.Left,
    TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - AForm.Top - AForm.height,
    AForm.width, AForm.height), Style);
  NSWin.initWithContentRect(R, Style, NSBackingStoreBuffered, True);
  NSWin.setAcceptsMouseMovedEvents(True);
  NSWin.setReleasedWhenClosed(False);
  NSWin.setBackgroundColor(TNSColor.Wrap(TNSColor.OCClass.clearColor));
  NSWin.setShowsToolbarButton(True);
  if Supports(NSWin, NSPanel) then
    (NSWin as NSPanel).setWorksWhenModal(True);
  NSWin.useOptimizedDrawing(True);
  NSTitle := NSSTR(AForm.Caption);
  NSWin.setTitle(NSTitle);
  if AForm.TopMost then
    NSWin.setLevel(kCGModalPanelWindowLevelKey);
  FMXWin.Wnd := AForm;

  if AForm is TCustomForm3D then
    FMXWin.FViewObj := TFMXView3D.Create(FMXWin, R)
  else
    FMXWin.FViewObj := TFMXView.Create(FMXWin, R);
  if AForm is TCustomForm3D then
  begin
    if Supports(FMXWin.FViewObj, ILocalObject, LocalObj) then
    begin
      AForm.ContextHandle := THandle(LocalObj.GetObjectID);
      FMXWin.FViewObj._AddRef;
    end;
  end;
  NSWin.setContentView(FMXWin.View);

  if AForm.Transparency then
    NSWin.setOpaque(False)
  else
    NSWin.setOpaque(True);
  NSWin.setHasShadow(True);

  DraggedTypes[0] := (NSPasteboardTypeString as ILocalObject).GetObjectID;
  DraggedTypes[1] := (NSFMXPBoardtype as ILocalObject).GetObjectID;
  DraggedTypes[2] := (NSFilenamesPboardType as ILocalObject).GetObjectID;
  DraggedTypes[3] := nil;
  RegTypes := TNSArray.Wrap(TNSArray.OCClass.arrayWithObjects(@DraggedTypes[0], 3));
  NSWin.registerForDraggedTypes(RegTypes);

  FMXWin.FDelegate := TFMXWindowDelegate.Create(FMXWin);
  NSWin.setDelegate(FMXWin.FDelegate);

  Result := AllocHandle(FMXWin);
end;

procedure TPlatformCocoa.DestroyWindow(AForm: TCommonCustomForm);
var
  FMXWin: TFMXWindow;
  NSWin: NSWindow;
begin
  if AForm.Handle <> 0 then
  begin
    FMXWin := TFMXWindow(HandleToObjC(AForm.Handle));
    NSWin := NSWindow(FMXWin.Super);
    if NSWin.isVisible then
      NSWin.orderOut(nil);
    DeleteHandle(AForm.Handle);
    AForm.Handle := 0;
    if AForm is TCustomForm3D then
      AForm.ContextHandle := 0;
  end;
end;

procedure TPlatformCocoa.ReleaseWindow(AForm: TCommonCustomForm);
begin
  if AForm <> nil then
  begin
    if (TFmxFormState.fsModal in AForm.FormState) or
      ((AForm.Handle <> 0) and (TFMXWindow(HandleToObjC(AForm.Handle)).FDelayRelease)) then
      AForm.Destroying
    else
      DoReleaseWindow(AForm);
  end;
end;

procedure TPlatformCocoa.DoReleaseWindow(AForm: TCommonCustomForm);
var
  FMXWin: TFMXWindow;
begin
  if AForm <> nil then
  begin
    if AForm.Handle <> 0 then
    begin
      FMXWin := TFMXWindow(HandleToObjC(AForm.Handle));
      NSWindow(FMXWin.Super).setOneShot(True);
      NSWindow(FMXWin.Super).orderOut(nil);
    end;
    AForm.Free;
  end;
end;

procedure TPlatformCocoa.SetWindowRect(AForm: TCommonCustomForm; ARect: TRectF);
var
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  NSWin.setFrame(MakeNSRect(ARect.Left, TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - ARect.Bottom,
    ARect.Right - ARect.Left, ARect.Bottom - ARect.Top), True);
end;

procedure TPlatformCocoa.InvalidateWindowRect(AForm: TCommonCustomForm; R: TRectF);
var
  FMXWin: TFMXWindow;
begin
  if IntersectRect(R, RectF(0, 0, AForm.width, AForm.height)) then
  begin
    FMXWin := TFMXWindow(HandleToObjC(AForm.Handle));
    FMXWin.View.setNeedsDisplayInRect(MakeNSRect(R.Left, FMXWin.View.bounds.size.height - R.Bottom, R.Right - R.Left, R.Bottom - R.Top));
  end;
end;

function TPlatformCocoa.AllocHandle(const Objc: IObjectiveC): TFmxHandle;
begin
  Result := NewFmxHandle;
  TMonitor.Enter(FObjectiveCMap);
  try
    FObjectiveCMap.Add(Result, Objc);
  finally
    TMonitor.Exit(FObjectiveCMap);
  end;
end;

function TPlatformCocoa.NewFmxHandle: TFmxHandle;
begin
{$IFDEF CPUX64}
  Result := TInterlocked.Add(Int64(FHandleCounter), 16);
{$ENDIF}
{$IFDEF CPUX86}
  Result := TInterlocked.Add(Integer(FHandleCounter), 16);
{$ENDIF}
end;

function TPlatformCocoa.GetWindowRect(AForm: TCommonCustomForm): TRectF;
var
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  Result := TRectF(NSWin.frame);
end;

procedure TPlatformCocoa.SetWindowCaption(AForm: TCommonCustomForm; const ACaption: string);
var
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  NSWin.setTitle(NSSTR(ACaption));
end;

procedure TPlatformCocoa.SetWindowState(AForm: TCommonCustomForm; const AState: TWindowState);
var
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);

  case AState of
  TWindowState.wsMinimized: if not NSWin.isMiniaturized then NSWin.performMiniaturize(nil);
  TWindowState.wsNormal:
    begin
      if NSWin.isMiniaturized then NSWin.performMiniaturize(nil);
      if NSWin.isZoomed then NSWin.performZoom(nil);
    end;
  TWindowState.wsMaximized: if not NSWin.isZoomed then NSWin.performZoom(nil);
  end;
end;

procedure TPlatformCocoa.ReleaseCapture(AForm: TCommonCustomForm);
begin
//  Windows.ReleaseCapture;
end;

procedure TPlatformCocoa.SetCapture(AForm: TCommonCustomForm);
begin
//  Windows.SetCapture(AHandle);
end;

function TPlatformCocoa.GetClientSize(AForm: TCommonCustomForm): TPointF;
var
  LView: NSView;
begin
  LView := TFMXWindow(HandleToObjC(AForm.Handle)).View;
  Result := PointF(LView.frame.size.width, LView.frame.size.height);
end;

procedure TPlatformCocoa.HideWindow(AForm: TCommonCustomForm);
begin
  if (AForm <> nil) and (AForm.Handle <> 0) then
    NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super).orderOut(nil);
end;

procedure TPlatformCocoa.ShowWindow(AForm: TCommonCustomForm);
var
  FMXWin: TFMXWindow;
  NSWin: NSWindow;
  frame: NSRect;
begin
  FMXWin := TFMXWindow(HandleToObjC(AForm.Handle));
  NSWin := NSWindow(FMXWin.Super);
  NSWin.makeKeyAndOrderFront((NSApp as ILocalObject).GetObjectID);
  if AForm = Application.MainForm then
    NSWin.makeMainWindow;
  frame := NSWin.frame;
  AForm.SetBounds(round(frame.origin.x),
    round(TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - frame.origin.y - frame.size.height),
    round(frame.size.width), round(frame.size.height));
//  if AForm.Transparency then
//    TFMXWindowDelegate(Pointer(AForm.Handle)).NeedUpdateShadow := True;
end;

function TPlatformCocoa.ShowWindowModal(AForm: TCommonCustomForm): TModalResult;
var
  Session: NSModalSession;
  MR: Integer;
  NSWin: NSWindow;
begin
  if FModalStack = nil then
    FModalStack := TStack<TCommonCustomForm>.Create;
  FRestartModal := False;
  FModalStack.Push(AForm);
  try
    Result := mrNone;
    NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
    NSWin.retain;
    try
      AForm.Show;
      AForm.ModalResult := mrNone;
      Session := NSApp.beginModalSessionForWindow(NSWin);
      while True do
      begin
        MR := NSApp.runModalSession(Session);
        if MR <> NSRunContinuesResponse then
        begin
          if FRestartModal then
          begin
            FRestartModal := False;
            NSApp.endModalSession(Session);
            Session := NSApp.beginModalSessionForWindow(NSWin);
            Continue;
          end;
          AForm.CloseModal;
          if AForm.Visible then
            AForm.Hide;
          Result := AForm.ModalResult;
          if csDestroying in AForm.ComponentState then
            DoReleaseWindow(AForm);
          FModalStack.Pop;
          if FModalStack.Count > 0 then
            FRestartModal := True;
          Break;
        end;
        if AForm.ModalResult <> 0 then
        begin
          NSApp.stopModal;
          Continue;
        end;
        Application.HandleMessage;
      end;
      NSApp.endModalSession(Session);
    finally
      NSWin.release;
    end;
  finally
    if (FModalStack.Count > 0) and (FModalStack.Peek = AForm) then
      FModalStack.Pop;
  end;
end;

function TPlatformCocoa.ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
var
  np: NSPoint;
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  np := NSPoint(Point);
  np.y := TNSView.Wrap(NSWin.contentView).bounds.size.height - np.y;
  Result := TPointF(NSWin.convertBaseToScreen(np));
  Result.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - Result.y;
end;

function TPlatformCocoa.ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
var
  np: NSPoint;
  NSWin: NSWindow;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  np := NSPoint(Point);
  np.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - np.y;
  Result := TPointF(NSWin.convertScreenToBase(np));
  Result.y := TNSView.Wrap(NSWin.contentView).bounds.size.height - Result.y;
end;

{ Menus }

type
  TOpenMenuItem = class(TMenuItem);

procedure TPlatformCocoa.StartMenuLoop(const AView: IMenuView);

 procedure EndLoop;
 var
   View: IMenuView;
 begin
   View := AView;
   while View <> nil do
   begin
     View.Loop := False;
     View.Selected := nil;
     View := View.ParentView;
   end;
 end;

 function ContinueLoop: Boolean;
 begin
   Result := AView.Loop;
 end;

 procedure SelectPrev(AView: IMenuView);
 var
   i: Integer;
 begin
   if AView.GetObject = nil then Exit;
   if AView.Selected = nil then
   begin
     for i := AView.GetObject.ChildrenCount - 1 downto 0 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Break;
       end;
   end
   else
   begin
     for i := AView.Selected.Index - 1 downto 0 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Exit;
       end;
     { Select from end }
     for i := AView.GetObject.ChildrenCount - 1 downto 0 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Break;
       end;
   end;
 end;

 procedure SelectNext(AView: IMenuView);
 var
   i: Integer;
 begin
   if AView.GetObject = nil then Exit;
   if AView.Selected = nil then
   begin
     for i := 0 to AView.GetObject.ChildrenCount - 1 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Break;
       end;
   end
   else
   begin
     for i := AView.Selected.Index + 1 to AView.GetObject.ChildrenCount - 1 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Exit;
       end;
     { Select from start }
     for i := 0 to AView.GetObject.ChildrenCount - 1 do
       if AView.GetObject.Children[i] is TMenuITem then
       begin
         AView.Selected := TMenuItem(AView.GetObject.Children[i]);
         Break;
       end;
   end;
 end;

var
  WP: NSPoint;
  P: TPointF;
  InMenus: Boolean;
  CurrentView, NewView: IMenuView;
  Obj: IControl;
  AutoPopupTime: Integer;
  TPos, TOldPos: TPointF;
  event: NSEvent;
begin
  AView.Loop := True;
  TPos := TOldPos;
  AutoPopupTime := 0;
  try
    event := NSApp.nextEventMatchingMask(NSAnyEventMask, TNSDate.Wrap(TNSDate.OCClass.distantFuture), NSDefaultRunLoopMode, True);
    while ContinueLoop and (event <> nil) do
    begin
      case event.&type of
{       WM_WINDOWPOSCHANGING: begin
          EndLoop;
          Exit;
        end;
        WM_QUIT, WM_NCLBUTTONDOWN..WM_NCMBUTTONDBLCLK:
          begin
            EndLoop;
            Continue;
          end;
}
        NSPeriodic:
          begin
            if (AView <> nil) then
            begin
              TPos := GetMousePos;
              AutoPopupTime := AutoPopupTime + 50;
              // Check auto popup
              if (TPos.X = TOldPos.X) and (TPos.Y = TOldPos.Y) then
              begin
                if (AutoPopupTime >= 500) then
                begin
                  Obj := AView.ObjectAtPoint(TPos);
                  if (Obj <> nil) and (Obj.GetObject is TMenuItem) and (TOpenMenuItem(Obj.GetObject).HavePopup) then
                  begin
                    TOpenMenuItem(Obj.GetObject).NeedPopup;
                  end;
                  AutoPopupTime := 0;
                end
              end
              else
                AutoPopupTime := 0;
              TOldPos := TPos;
            end;
          end;
        NSMouseMoved:
          begin
            { Handle MouseOver }
            WP := event.locationInWindow;
            if event.window <> nil then
              WP := event.window.convertBaseToScreen(WP);
            WP.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - WP.y;
            P := PointF(WP.X, WP.Y);
            Obj := AView.ObjectAtPoint(P);
            { Default }
            NSApp.sendEvent(event);
            { Handle menus }
            AutoPopupTime := 0;
            { Find top level menu }
            CurrentView := AView;
            while CurrentView.ParentView <> nil do
              CurrentView := CurrentView.ParentView;
            { Check all items }
            while CurrentView <> nil do
            begin
              Obj := CurrentView.ObjectAtPoint(P);
              if (Obj <> nil) and (Obj.GetObject is TMenuItem) and not (TMenuItem(Obj.GetObject).IsSelected) then
              begin
                if (CurrentView <> AView) then
                begin
                  NewView := AView;
                  while NewView <> CurrentView do
                  begin
                    NewView.Loop := False;
                    NewView := NewView.ParentView;
                  end;
                  TOpenMenuItem(Obj.GetObject).NeedPopup;
                  Exit;
                end;
              end;
              CurrentView := CurrentView.ChildView;
            end;
          end;
        NSLeftMouseDown:
          begin
            { Handle MouseOver if mouse over not menuitem }
            WP := event.locationInWindow;
            if event.window <> nil then
              WP := event.window.convertBaseToScreen(WP);
            WP.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - WP.y;
            P := PointF(WP.X, WP.Y);
            Obj := AView.ObjectAtPoint(P);
            if (Obj <> nil) and not (Obj is TMenuItem) then
            begin
              NSApp.sendEvent(event);
            end
            else
            begin
              { Menus }
              if (Obj <> nil) and (Obj.GetObject is TMenuItem) then
              begin
                if not (TMenuItem(Obj.GetObject).IsSelected) and TMenuItem(Obj.GetObject).HavePopup then
                  TOpenMenuItem(Obj.GetObject).NeedPopup
                else
                begin
                  EndLoop;
                  TOpenMenuItem(Obj.GetObject).Click;
                end;
              end
              else
              begin
                CurrentView := AView;
                InMenus := False;
                while (CurrentView <> nil) and not InMenus do
                begin
                  if not (CurrentView.IsMenuBar) and (CurrentView.ObjectAtPoint(P) <> nil) then
                    InMenus := True;
                  CurrentView := CurrentView.ParentView;
                end;
                if not InMenus then
                  EndLoop;
              end;
			end;
          end;
        NSLeftMouseUp:
          begin
            { Handle MouseOver if mouse over not menuitem }
            WP := event.locationInWindow;
            if event.window <> nil then
              WP := event.window.convertBaseToScreen(WP);
            WP.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - WP.y;
            P := PointF(WP.X, WP.Y);
            Obj := AView.ObjectAtPoint(P);
            if (Obj <> nil) and not (Obj is TMenuItem) then
            begin
              NSApp.sendEvent(event);
            end;
          end;
        NSKeyDown:
          begin
            case event.keyCode of
              KEY_ENTER:
                begin
                  if (AView.Selected <> nil) then
                  begin
                    if AView.Selected.HavePopup then
                      AView.Selected.NeedPopup
                    else
                    begin
                      TOpenMenuItem(AView.Selected).Click;
                      EndLoop;
                    end;
                  end;
                end;
              KEY_ESC:
                begin
                  AView.Selected := nil;
                  Exit;
                end;
              KEY_LEFT:
                begin
                  if (AView.ParentView <> nil) then
                    if (AView.ParentView.IsMenuBar) then
                    begin
                      AView.Loop := False;
                      SelectPrev(AView.ParentView);
                      if AView.ParentView.Selected <> nil then
                        AView.ParentView.Selected.NeedPopup;
                      Exit;
                    end
                    else
                    begin
                      AView.Loop := False;
                    end;
                end;
              KEY_RIGHT:
                begin
                  if (AView.ParentView <> nil) then
                    if (AView.ParentView.IsMenuBar) then
                    begin
                      AView.Loop := False;
                      SelectNext(AView.ParentView);
                      if AView.ParentView.Selected <> nil then
                        AView.ParentView.Selected.NeedPopup;
                      Exit;
                    end
                    else
                    begin
                      AView.Loop := False;
                    end;
                end;
              KEY_UP:
                SelectPrev(AView);
              KEY_DOWN:
                SelectNext(AView);
            end; // case event.keyCode of
          end; // NSKeyDown
(*
              WM_CHAR, WM_SYSCHAR:
              begin
                if FItems.FindItemByChar(Char(Msg.wParam)) <> nil then
                begin
                  FSelItem := FItems.FindItemByChar(Char(Msg.wParam));
                  if FSelItem <> nil then InvalidateItem(FSelItem);
                  PostMessage(Window.Handle, WM_KEYDOWN, VK_RETURN, 0)
                end;
              end;
            end;
*)
      else
        begin
          NSApp.sendEvent(event);
        end;
      end; // case
      event := NSApp.nextEventMatchingMask(NSAnyEventMask, TNSDate.Wrap(TNSDate.OCClass.distantFuture), NSDefaultRunLoopMode, True);
    end; // while
  finally
    AView.Loop := False;
  end;
end;

function TPlatformCocoa.HandleToObjC(FmxHandle: TFmxHandle; const IID: TGUID; out Intf): Boolean;
begin
  Result := Supports(HandleToObjC(FmxHandle), IID, Intf);
end;

procedure TPlatformCocoa.ShortCutToKey(ShortCut: TShortCut; var Key: Word;
  var Shift: TShiftState);
var
  K: char;
  KByte: byte;
  ModifierMask: NSUInteger;
begin
   KByte:= Lo(Shortcut);
   ModifierMask:= 0;

   case KByte of
    Ord('A')..Ord('Z') : K := Chr(KByte+ Ord('a') - Ord('A'))
   else
    K:= Chr(KByte);
   end;

  Key:= Word(K);

  if ShortCut and scCommand <> 0 then
    ModifierMask := ModifierMask or NSCommandKeyMask;
  if ShortCut and scShift <> 0 then
    ModifierMask := ModifierMask or NSShiftKeyMask;
  if ShortCut and scCtrl <> 0 then
    ModifierMask := ModifierMask or NSControlKeyMask;
  if ShortCut and scAlt <> 0 then
    ModifierMask := ModifierMask or NSAlternateKeyMask;

   Shift:= ShiftStateFromModFlags(ModifierMask);
end;

function TPlatformCocoa.ShortCutToText(ShortCut: TShortCut): string;
var
  Name: String;
  key: Byte;
begin
  Key:= Lo(Word(ShortCut));
  case Key of
    Ord('A')..Ord('Z') : Name := Chr(Key);
    $08 : Name := Chr($2328); //(NSBackspaceCharacter);
    $09 : Name := Chr($002A); //(NSTabCharacter);
    $0d : Name := Chr($2305); //(NSEnterCharacter);
    $21 : Name := Chr($21DE); //(NSPageUpFunctionKey);
    $22 : Name := Chr($21DF); //(NSPageDownFunctionKey);
    $23 : Name := Chr($2198); //(NSEndFunctionKey);
    $24 : Name := Chr($2196); //(NSHomeFunctionKey);
    $25 : Name := Chr($27F6); //(NSLeftArrowFunctionKey);
    $26 : Name := Chr($2191); //(NSUpArrowFunctionKey);
    $27 : Name := Chr($27F5); //(NSRightArrowFunctionKey);
    $28 : Name := Chr($2193); //(NSDownArrowFunctionKey);
    $2e : Name := Chr($2326); //(NSDeleteCharacter);
    $70..$87: Name := 'F' + IntToStr(Key - $6F); //(NSF1FunctionKey+Ord(Key)-$70);
  end;
  Result:= '';
  if Name <> '' then
  begin
    if ShortCut and scCommand <> 0 then
      Result:= Result + Chr($2318); // Command modifier (place of interest sign)
    if ShortCut and scCtrl <> 0 then
      Result:= Result + Chr($2303); // Ctrl modifier (up arrowhead)
    if ShortCut and scShift <> 0 then
      Result:= Result + Chr($21E7); // Shift modifier (upwards white arrow)
    if ShortCut and scAlt <> 0 then
      Result:= Result + Chr($2325); // option modifier (option key)
    Result:= Result + Name;
  end;
end;

type
  TMenuMACKeyCap = (mkcBkSp, mkcTab, mkcEsc, mkcEnter, mkcSpace, mkcPgUp,
    mkcPgDn, mkcEnd, mkcHome, mkcLeft, mkcUp, mkcRight, mkcDown, mkcIns,
    mkcDel, mkcShift, mkcCtrl, mkcAlt, mkcCmd);

var
  MenuMACKeyCaps: array[TMenuMACKeyCap] of string = (
    SmkcBkSp, SmkcTab, SmkcEsc, SmkcEnter, SmkcSpace, SmkcPgUp,
    SmkcPgDn, SmkcEnd, SmkcHome, SmkcLeft, SmkcUp, SmkcRight,
    SmkcDown, SmkcIns, SmkcDel, SmkcShift, SmkcCtrl, SmkcAlt, SmkcCmd);

function TPlatformCocoa.TextToShortCut(Text: String): integer;
{ If the front of Text is equal to Front then remove the matching piece
    from Text and return True, otherwise return False }

  function CompareFront(var Text: string; const Front: string): Boolean;
  begin
    Result := False;
    if (Length(Text) >= Length(Front)) and
      (AnsiStrLIComp(PChar(Text), PChar(Front), Length(Front)) = 0) then
    begin
      Result := True;
      Delete(Text, 1, Length(Front));
    end;
  end;

var
  Key: TShortCut;
  Shift: TShortCut;
begin
  Result := 0;
  Shift := 0;
  while True do
  begin
    if CompareFront(Text, MenuMACKeyCaps[mkcShift]) then Shift := Shift or scShift
    else if CompareFront(Text, '^') then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuMACKeyCaps[mkcCtrl]) then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuMACKeyCaps[mkcAlt]) then Shift := Shift or scAlt
    else if CompareFront(Text, MenuMACKeyCaps[mkcCmd]) then Shift:= Shift or scCommand
    else Break;
  end;
  if Text = '' then Exit;
  for Key := $08 to $255 do { Copy range from table in ShortCutToText }
    if AnsiCompareText(Text, ShortCutToText(Key)) = 0 then
    begin
      Result := Key or Shift;
      Exit;
    end;
end;
  { TFMXOSMenuItem }

type
  FMXOSMenuItem = interface(NSMenuItem)
    ['{A922028A-C1EE-41AF-8345-26671E6879AD}']
    procedure DispatchMenuClick(Sender: Pointer); cdecl;
  end;

  TFMXOSMenuItem = class(TOCLocal)
  private
    FMXMenuItem: TMenuItem;
  public
    constructor Create(AFMXMenuItem: TMenuItem);
    function GetObjectiveCClass: PTypeInfo; override;
    procedure DispatchMenuClick(Sender: Pointer); cdecl;
  end;

constructor TFMXOSMenuItem.Create(AFMXMenuItem: TMenuItem);
var
  Key: Char;
  ModMask: NSUInteger;
begin
  inherited Create;
  FMXMenuItem := AFMXMenuItem;
  ShortCutToMACKey(FMXMenuItem.ShortCut, Key, ModMask);
  UpdateObjectID(NSMenuItem(Super).initWithTitle(NSSTR(FMXMenuItem.Text),
    sel_getUid(PAnsiChar('DispatchMenuClick:')), NSSTR(Key)));
  NSMenuItem(Super).setKeyEquivalentModifierMask(ModMask);
  NSMenuItem(Super).setTarget(GetObjectID);
end;

procedure TFMXOSMenuItem.DispatchMenuClick(Sender: Pointer);
begin
  try
    if Assigned(FMXMenuItem.OnClick) then
      FMXMenuItem.OnClick(Self);
  except
    Application.HandleException(Self);
  end;
end;

function TFMXOSMenuItem.GetObjectiveCClass: PTypeInfo;
begin
    Result := TypeInfo(FMXOSMenuItem);
end;

procedure TPlatformCocoa.CreateChildMenuItems(AChildMenu: IItemsContainer; AParentMenu: NSMenu);
var
  J: Integer;
  LChildMenuItem: TMenuItem;
  LNSSubMenuItem: TFMXOSMenuItem;
  LNewSubMenu: NSMenu;
begin
  for J := 0 to AChildMenu.GetItemsCount - 1 do
  begin
    LChildMenuItem := TMenuItem(AChildMenu.GetItem(J));

    if LChildMenuItem.Visible then
      if LChildMenuItem.Text = '-' then
        AParentMenu.addItem(TNSMenuItem.Wrap(TNSMenuItem.OCClass.separatorItem))
      else
      begin
        LNSSubMenuItem := TFMXOSMenuItem.Create(LChildMenuItem);
        LChildMenuItem.Handle := AllocHandle(LNSSubMenuItem);
        if (AChildMenu.GetItem(J) as IItemsContainer).GetItemsCount > 0 then
        begin
          LNewSubMenu := TNSMenu.Create;
          LNewSubMenu := TNSMenu.Wrap(LNewSubMenu.initWithTitle(NSSTR(TMenuItem(AChildMenu.GetItem(J)).Text)));
          CreateChildMenuItems((AChildMenu.GetItem(J) as IItemsContainer), LNewSubMenu);
          NSMenuItem(LNSSubMenuItem.Super).setSubmenu(LNewSubMenu);
        end;
        AParentMenu.addItem(NSMenuItem(LNSSubMenuItem.Super));
      end;

  end;
end;

var
   AppNSMenuItem: NSMenuItem;

procedure TPlatformCocoa.CreateApplicationMenu;
var
  LAppMenu: NSMenu;
  LNSMenuItem: NSMenuItem;
  LQuitItem: NSMenuItem;
  MenuBar: NSMenu;
  AppBundle: NSBundle;
  AppNameKey: Pointer;
  NSAppName: NSString;
  FMXAppName: string;
begin
  MenuBar := NSApp.mainMenu;
  if MenuBar = nil then
  begin
    MenuBar := TNSMenu.Create;
    MenuBar := TNSMenu.Wrap(MenuBar.initWithTitle(NSSTR('')));
  end;

  LAppMenu := TNSMenu.Create;
  LAppMenu := TNSMenu.Wrap(LAppMenu.initWithTitle(NSSTR('NSAppleMenu')));
  LNSMenuItem := TNSMenuItem.Create;
  LNSMenuItem := TNSMenuItem.Wrap(LNSMenuItem.initWithTitle(NSSTR(''), nil, NSSTR('')));
  LNSMenuItem.setSubmenu(LAppMenu);

  if Application.ApplicationMenuItems <> nil then
  begin
    CreateChildMenuItems(Application.ApplicationMenuItems, LAppMenu);
  end
  else
  begin
    if Application.Title <> '' then
      FMXAppName := Application.Title
    else
    begin
      AppNameKey := (NSSTR('CFBundleName') as ILocalObject).GetObjectID;
      AppBundle := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
      NSAppName := TNSString.Wrap(AppBundle.infoDictionary.objectForKey(AppNameKey));
      FMXAppName := UTF8ToString(NSAppName.UTF8String);
    end;
    LQuitItem := TNSMenuItem.Create;
    LQuitItem := TNSMenuItem.Wrap(LQuitItem.initWithTitle(NSSTR(Format(SMenuAppQuit, [FMXAppName])),
      sel_getUid(PAnsiChar('terminate:')), NSSTR(SMenuAppQuitKey)));
    LAppMenu.addItem(LQuitItem);
  end;
  if MenuBar <> nil then
    MenuBar.insertItem(LNSMenuItem, 0);
  AppNSMenuItem:= LNSMenuItem;
  NSApp.setMainMenu(MenuBar);
end;

procedure TPlatformCocoa.CreateOSMenu(AForm: TCommonCustomForm;
  const AMenu: IItemsContainer);

var
  MenuBar: NSMenu;
  LNSMenuItem: NSMenuItem;
  LNewMenu: NSMenu;
  MenuItem: TMenuItem;
  I: Integer;
begin
  MenuBar := TNSMenu.Create;
  MenuBar := TNSMenu.Wrap(MenuBar.initWithTitle(NSSTR('')));

  if (MenuBar <> nil)  and (AppNsMenuItem <> nil) then
  begin
    NSApp.mainMenu.removeItem(AppNSMenuItem);
    MenuBar.insertItem(AppNSMenuItem, 0);
  end;
  // TMainMenu items

  if AMenu <> nil then
  begin
    for I := 0 to AMenu.GetItemsCount - 1 do
    begin
      MenuItem := TMenuItem(AMenu.GetItem(I));

      if MenuItem.Visible then
      begin
        LNewMenu := TNSMenu.Create;
        LNewMenu := TNSMenu.Wrap(LNewMenu.initWithTitle(NSSTR(MenuItem.Text)));
        LNSMenuItem := TNSMenuItem.Create;
        LNSMenuItem := TNSMenuItem.Wrap(LNSMenuItem.initWithTitle(NSSTR(''), nil, NSSTR('')));
        LNSMenuItem.setSubmenu(LNewMenu);
        CreateChildMenuItems((MenuItem as IItemsContainer), LNewMenu);
        MenuItem.Handle := AllocHandle(LNSMenuItem);
        MenuBar.addItem(LNSMenuItem);
      end;

    end;
  end;

  NSApp.setMainMenu(MenuBar);

end;

procedure TPlatformCocoa.UpdateMenuItem(const AItem: TMenuItem);
var
  P: TFMXObject;
  RootMenu: TFMXObject;
  Root: IItemsContainer;
begin
  P := AItem;
  RootMenu := nil;
  while P.Parent <> nil do
  begin
    if P.Parent is TContent then
      P := P.Parent;
    if (P is TMenuBar) or (P is TMainMenu) then
      RootMenu := P;
    P := P.Parent;
  end;
  if (AItem.Root <> nil) and (AItem.Root.GetObject is TCommonCustomForm) and (RootMenu <> nil) and Supports(RootMenu, IItemsContainer, Root) then
  begin
    CreateOSMenu(TCommonCustomForm(AItem.Root.GetObject), Root);
  end;
end;

procedure TPlatformCocoa.ValidateHandle(FmxHandle: TFmxHandle);
begin
  if (FmxHandle and $F <> 0) then
    raise EInvalidFmxHandle.CreateResFmt(@SInvalidFmxHandle, [HexDisplayPrefix, SizeOf(TFmxHandle) * 2, FmxHandle]);
end;

{ Drag and Drop ===============================================================}

function NSImageFromBitmap(Bmp: TBitmap): NSImage;
var
  mem: TMemoryStream;
  Data: NSData;
begin
  mem := TMemoryStream.Create;
  Bmp.SaveToStream(mem);
  Data := TNSData.Wrap(TNSData.OCClass.dataWithBytes(mem.Memory, mem.Size));
//  Data := NSData.dataWithBytes_length(mem.Memory, mem.size);
  Result := TNSImage.Create;
  Result := TNSImage.Wrap(Result.initWithData(Data));
  mem.Free;
end;

procedure TPlatformCocoa.BeginDragDrop(AForm: TCommonCustomForm; const Data: TDragObject;
  ABitmap: TBitmap);
var
  Img: NSImage;
  Loc: NSPoint;
  Pboard: NSPasteboard;
  PBoardTypes: NSArray;
  FMXPBoardTypePtr: Pointer;
  LocObj: ILocalObject;
  FMXWin: TFMXWindow;
  ViewPtr: Pointer;
  PboardPtr: Pointer;
begin
  Img := NSImageFromBitmap(ABitmap);
  Pboard := TNSPasteboard.Wrap(TNSPasteboard.OCClass.pasteboardWithName(NSDragPboard));
  if Supports(NSFMXPBoardType, ILocalObject, LocObj) then
    FMXPBoardTypePtr := LocObj.GetObjectID
  else
    FMXPBoardTypePtr := nil;
  PBoardTypes := TNSArray.Wrap(TNSArray.OCClass.arrayWithObject(FMXPBoardTypePtr));

  if Supports(PBoard, ILocalObject, LocObj) then
    PboardPtr := LocObj.GetObjectID
  else
    PboardPtr := nil;
  Pboard.declareTypes(PBoardTypes, PboardPtr);
{  if not VarIsObject(Data.Data) and VarIsStr(Data.Data) then
    pboard.setString_forType(NSStr(PChar(Utf8Encode(Data.Data))), NSStringPBoardtype);}
  GlobalData := Data;
  FMXWin := TFMXWindow(HandleToObjC(AForm.Handle));
  if FMXWin.LastEvent <> nil then
  begin
    loc := FMXWin.LastEvent.locationInWindow;
    loc.x := loc.x - (ABitmap.width div 2);
    loc.y := loc.y - (ABitmap.height div 2);
    if Supports(FMXWin.View, ILocalObject, LocObj) then
      ViewPtr := LocObj.GetObjectID
    else
      ViewPtr := nil;
    NSWindow(FMXWin.Super).dragImage(img, loc, NSSize(Point(0, 0)), FMXWin.LastEvent, pboard, ViewPtr, True);
    FMXWin.LastEvent := nil;
  end;
end;

procedure TPlatformCocoa.SetClientSize(AForm: TCommonCustomForm; const ASize: TPointF);
var
  NSWin: NSWindow;
  OldFrame, Frame, R: NSRect;
begin
  NSWin := NSWindow(TFMXWindow(HandleToObjC(AForm.Handle)).Super);
  if NSWin.isVisible then
  begin
    OldFrame := NSWin.frame;
    R.origin := OldFrame.origin;
    R.size := NSSize(ASize);
    Frame := NSWin.frameRectForContentRect(R);
    Frame.origin.x := OldFrame.origin.x;
    Frame.origin.y := OldFrame.origin.y + OldFrame.size.height - Frame.size.height;
    NSWin.setFrame(Frame, True);
  end
  else
    NSWin.setContentSize(NSSize(ASize));
end;

{ Clipboard ===============================================================}

procedure TPlatformCocoa.SetClipboard(Value: Variant);
var
  W: string;
  pb: NSPasteboard;
  types: NSArray;
begin
  if VarIsStr(Value) then
  begin
    W := Value;
    pb := TNSPasteboard.Wrap(TNSPasteboard.OCClass.generalPasteboard);
    types := TNSArray.Wrap(TNSArray.OCClass.arrayWithObject((NSPasteboardTypeString as ILocalObject).GetObjectID));
    pb.declareTypes(types, (pb as ILocalObject).GetObjectID);
    pb.setString(NSSTR(W), NSPasteboardTypeString);
  end;
end;

function TPlatformCocoa.GetClipboard: Variant;
var
  W: string;
  pb: NSPasteboard;
  str: NSString;
begin
  Result := NULL;
  pb := TNSPasteboard.Wrap(TNSPasteboard.OCClass.generalPasteboard);
  str := pb.stringForType(NSPasteboardTypeString);
  if str <> nil then
  begin
    W := UTF8ToString(str.UTF8String);
    Result := W;
  end;
end;

procedure TPlatformCocoa.SetCursor(AForm: TCommonCustomForm; const ACursor: TCursor);
const
  SizeNWSECursor: array [0..192] of byte = (
    $89, $50, $4E, $47, $0D, $0A, $1A, $0A, $00, $00, $00, $0D, $49, $48, $44, $52, $00, $00, $00, $10, $00, $00, $00, $10, $08, $06, $00, $00, $00, $1F, $F3, $FF, $61, $00, $00, $00, $88, $49, $44, $41,
    $54, $78, $9C, $AC, $93, $4B, $0A, $C0, $20, $0C, $44, $45, $8A, $69, $D7, $5D, $7B, $00, $0F, $98, $EB, $6B, $15, $8C, $44, $F1, $1B, $3A, $20, $BA, $D0, $E7, $4C, $A2, $4A, $FD, $A1, $30, $D1, $36,
    $20, $4D, $69, $00, $40, $59, $8B, $00, $FC, $B0, $08, $60, $8C, $A9, $6E, $BF, $A2, $44, $0E, $08, $82, $88, $EA, $8D, $DA, $02, $78, $EF, $43, $0B, $63, $31, $EE, $29, $80, $67, $26, $88, $D6, $BA,
    $82, $58, $6B, $97, $69, $CA, $A6, $91, $93, $AD, $16, $3F, $51, $23, $48, $8A, $D9, $44, $EB, $8B, $AA, $3F, $2B, $F0, $3A, $4F, $16, $41, $A8, $C5, $47, $00, $96, $F7, $DC, $81, $73, $AE, $FB, $C8,
    $44, $0E, $C4, $1F, $6D, $A5, $0F, $00, $00, $FF, $FF, $03, $00, $FD, $DF, $FC, $72, $CD, $04, $2F, $27, $00, $00, $00, $00, $49, $45, $4E, $44, $AE, $42, $60, $82
  );
  SizeNESWCursor: array [0..211] of byte = (
    $89, $50, $4E, $47, $0D, $0A, $1A, $0A, $00, $00, $00, $0D, $49, $48, $44, $52, $00, $00, $00, $10, $00, $00, $00, $10, $08, $06, $00, $00, $00, $1F, $F3, $FF, $61, $00, $00, $00, $9B, $49, $44, $41,
    $54, $78, $9C, $9C, $93, $51, $0E, $C0, $10, $0C, $86, $3D, $88, $CC, $F3, $0E, $E3, $2A, $2E, $E2, $04, $6E, $E0, $C5, $5D, $DC, $4D, $4C, $93, $CD, $1A, $46, $AD, $7F, $D2, $14, $49, $3F, $D5, $96,
    $10, $0B, $95, $52, $48, $23, $55, $D6, $DA, $03, $80, $EB, $ED, $17, $20, $E7, $CC, $06, $1C, $29, $A5, $96, $85, $52, $AA, $79, $12, $A0, $AB, $62, $8C, $BC, $27, $9C, $55, $21, $84, $21, $18, $45,
    $CD, $01, $52, $4A, $E1, $9C, $FB, $0C, $F6, $DE, $F7, $5D, $79, $0B, $85, $4F, $26, $37, $C3, $42, $0E, $33, $70, $6F, $86, $14, $B7, $AB, $8D, $01, $5F, $85, $32, $C6, $C0, $42, $93, $00, $DC, $A2,
    $27, $D8, $5A, $0B, $DD, $58, $8F, $EC, $2C, $03, $18, $1E, $54, $13, $FE, $13, $B6, $01, $33, $ED, $02, $78, $5F, $B5, $EA, $02, $00, $00, $FF, $FF, $03, $00, $27, $CE, $7B, $C4, $F5, $A4, $B6, $D6,
    $00, $00, $00, $00, $49, $45, $4E, $44, $AE, $42, $60, $82
  );
  SizeAllCursor: array [0..174] of byte = (
    $89, $50, $4E, $47, $0D, $0A, $1A, $0A, $00, $00, $00, $0D, $49, $48, $44, $52, $00, $00, $00, $10, $00, $00, $00, $10, $08, $06, $00, $00, $00, $1F, $F3, $FF, $61, $00, $00, $00, $09, $70, $48, $59,
    $73, $00, $00, $0B, $13, $00, $00, $0B, $13, $01, $00, $9A, $9C, $18, $00, $00, $00, $61, $49, $44, $41, $54, $78, $9C, $AC, $53, $CB, $0A, $00, $20, $0C, $1A, $F4, $FF, $DF, $6C, $10, $74, $68, $0F,
    $17, $65, $E0, $A9, $74, $BA, $36, $03, $60, $04, $FB, $94, $6F, $28, $D9, $6C, $2C, $30, $91, $96, $DC, $89, $5C, $91, $99, $48, $95, $19, $49, $84, $E3, $2A, $13, $F0, $55, $B2, $CA, $C1, $49, $D5,
    $B0, $D2, $81, $17, $A5, $99, $3B, $04, $AB, $AF, $02, $DF, $11, $24, $4D, $94, $7C, $A3, $64, $90, $24, $A3, $2C, $59, $A6, $EB, $75, $9E, $00, $00, $00, $FF, $FF, $03, $00, $3A, $00, $A6, $5B, $CC,
    $0B, $A4, $58, $00, $00, $00, $00, $49, $45, $4E, $44, $AE, $42, $60, $82
  );
  WaitCursor: array [0..124] of byte = (
    $89, $50, $4E, $47, $0D, $0A, $1A, $0A, $00, $00, $00, $0D, $49, $48, $44, $52, $00, $00, $00, $10, $00, $00, $00, $10, $08, $06, $00, $00, $00, $1F, $F3, $FF, $61, $00, $00, $00, $44, $49, $44, $41,
    $54, $78, $9C, $62, $60, $C0, $0E, $FE, $E3, $C0, $44, $83, $21, $6E, $C0, $7F, $5C, $80, $18, $43, $70, $6A, $26, $D6, $10, $BA, $19, $80, $D3, $10, $6C, $0A, $C9, $33, $00, $59, $03, $45, $5E, $C0,
    $65, $00, $94, $4D, $5A, $38, $10, $B2, $1D, $C5, $10, $1C, $98, $68, $30, $84, $0C, $00, $00, $00, $00, $FF, $FF, $03, $00, $A9, $31, $25, $E9, $C0, $2C, $FB, $9B, $00, $00, $00, $00, $49, $45, $4E,
    $44, $AE, $42, $60, $82
  );
  HelpCursor: array [0..238] of byte = (
    $89, $50, $4E, $47, $0D, $0A, $1A, $0A, $00, $00, $00, $0D, $49, $48, $44, $52, $00, $00, $00, $12, $00, $00, $00, $12, $08, $06, $00, $00, $00, $56, $CE, $8E, $57, $00, $00, $00, $B6, $49, $44, $41,
    $54, $78, $9C, $A4, $94, $3B, $12, $80, $20, $0C, $44, $69, $6C, $6D, $6C, $BC, $83, $8D, $B5, $F7, $E0, $FE, $37, $01, $89, $93, $8C, $61, $F9, $18, $21, $33, $19, $15, $C9, $73, $B3, $46, $9D, $83,
    $88, $31, $52, $36, $03, $F7, $17, $C5, $1A, $E2, $BD, $0F, $74, $89, $49, $EB, $9F, $30, $06, $05, $81, $70, $51, $D0, $6B, $66, $18, $15, $49, $01, $9F, $9F, $29, $77, $BD, $CE, $F7, $E8, $B8, $98,
    $40, $1A, $D6, $00, $ED, $05, $4C, $79, $94, $B5, $C1, $80, $0B, $40, $D2, $1A, $A9, $5D, $BB, $AA, $30, $1B, $1E, $5D, $29, $B7, $AE, $57, $FC, $A4, $23, $ED, $CF, $D4, $00, $A4, $AF, $08, $D5, $C1,
    $5B, $FC, $0F, $11, $D0, $34, $44, $83, $A6, $20, $4E, $08, $EF, $A7, $61, $32, $B7, $0A, $A9, $F8, $53, $CE, $8E, $05, $E4, $CA, $21, $1C, $F2, $A7, $A6, $68, $BC, $3D, $F0, $28, $53, $64, $F9, $11,
    $48, $3C, $83, $59, $83, $FC, $8D, $85, $8B, $B7, $2F, $C8, $0D, $00, $00, $FF, $FF, $03, $00, $A5, $D1, $28, $C9, $B0, $25, $E3, $01, $00, $00, $00, $00, $49, $45, $4E, $44, $AE, $42, $60, $82
  );
var
  C: NSCursor;
  Image: NSImage;
  Data: NSData;
begin
  case ACursor of
    crCross: C := TNSCursor.Wrap(TNSCursor.OCClass.crosshairCursor);
    crArrow: C := TNSCursor.Wrap(TNSCursor.OCClass.arrowCursor);
    crIBeam: C := TNSCursor.Wrap(TNSCursor.OCClass.IBeamCursor);
    crSizeNS: C := TNSCursor.Wrap(TNSCursor.OCClass.resizeUpDownCursor);
    crSizeWE: C := TNSCursor.Wrap(TNSCursor.OCClass.resizeLeftRightCursor);
    crUpArrow: C := TNSCursor.Wrap(TNSCursor.OCClass.resizeUpCursor);
    crDrag, crMultiDrag:  C := TNSCursor.Wrap(TNSCursor.OCClass.dragCopyCursor);
    crHSplit: C := TNSCursor.Wrap(TNSCursor.OCClass.resizeLeftRightCursor);
    crVSplit: C := TNSCursor.Wrap(TNSCursor.OCClass.resizeUpDownCursor);
    crNoDrop, crNo: C := TNSCursor.Wrap(TNSCursor.OCClass.operationNotAllowedCursor);
    crHandPoint: C := TNSCursor.Wrap(TNSCursor.OCClass.pointingHandCursor);
    crAppStart, crSQLWait, crHourGlass:
      begin
        Data := TNSData.Wrap(TNSData.Create.initWithBytes(@WaitCursor[0], Length(WaitCursor)));
        Image := TNSImage.Wrap(TNSImage.Create.initWithData(Data));
        C := TNSCursor.Wrap(TNSCursor.Create.initWithImage(Image, NSPoint(PointF(10, 10))));
      end;
    crHelp:
      begin
        Data := TNSData.Wrap(TNSData.Create.initWithBytes(@HelpCursor[0], Length(HelpCursor)));
        Image := TNSImage.Wrap(TNSImage.Create.initWithData(Data));
        C := TNSCursor.Wrap(TNSCursor.Create.initWithImage(Image, NSPoint(PointF(10, 10))));
      end;
    crSizeNWSE:
      begin
        Data := TNSData.Wrap(TNSData.Create.initWithBytes(@SizeNWSECursor[0], Length(SizeNWSECursor)));
        Image := TNSImage.Wrap(TNSImage.Create.initWithData(Data));
        C := TNSCursor.Wrap(TNSCursor.Create.initWithImage(Image, NSPoint(PointF(10, 10))));
      end;
    crSizeNESW:
      begin
        Data := TNSData.Wrap(TNSData.Create.initWithBytes(@SizeNESWCursor[0], Length(SizeNESWCursor)));
        Image := TNSImage.Wrap(TNSImage.Create.initWithData(Data));
        C := TNSCursor.Wrap(TNSCursor.Create.initWithImage(Image, NSPoint(PointF(10, 10))));
      end;
    crSizeAll:
      begin
        Data := TNSData.Wrap(TNSData.Create.initWithBytes(@SizeAllCursor[0], Length(SizeAllCursor)));
        Image := TNSImage.Wrap(TNSImage.Create.initWithData(Data));
        C := TNSCursor.Wrap(TNSCursor.Create.initWithImage(Image, NSPoint(PointF(10, 10))));
      end;
  else
    C := TNSCursor.Wrap(TNSCursor.OCClass.arrowCursor);
  end;
  C.push;
end;

{ Mouse  ===============================================================}

function TPlatformCocoa.GetMousePos: TPointF;
var
  P: NSPoint;
begin
  P := TNSEvent.OCClass.mouseLocation;
  Result := TPointF.Create(P.x, P.y);
  Result.y := TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size.height - Result.y;
end;

function TPlatformCocoa.GetScreenSize: TPointF;
begin
  Result := TPointF(TNSScreen.Wrap(TNSScreen.OCClass.mainScreen).frame.size)
end;

{ International ===============================================================}

function TPlatformCocoa.GetCurrentLangID: string;
begin
  Result := UTF8ToString(TNSLocale.Wrap(TNSLocale.OCClass.currentLocale).localeIdentifier.UTF8String);
  if Length(Result) > 2 then
    Delete(Result, 3, MaxInt);
end;

function TPlatformCocoa.GetDefaultFontFamilyName: String;
begin
  Result := 'Helvetica';
end;

function TPlatformCocoa.GetLocaleFirstDayOfWeek: string;
var
  cal: NSCalendar;
  firstDay: NSUInteger;
begin
  cal:= TNSCalendar.Wrap(TNSCalendar.OCClass.currentCalendar);
  firstDay:= Cal.firstWeekday;
  Result:= IntToStr(firstDay);
end;


{ Dialogs ===============================================================}

function TPlatformCocoa.DialogOpenFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
  var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean;
var
  OpenFile: NSOpenPanel;
  DefaultExt: string;
  Filter: NSArray;
  InitialDir: NSURL;
  outcome: NSInteger;
  I: Integer;

  function AllocFilterStr(const S: string): NSArray;
  var
    input, pattern: string;
    FileTypes: array of string;
    outcome, aux: TArray<string>;
    i, j: Integer;
    FileTypesNS: array of Pointer;
    NStr: NSString;
    LocObj: ILocalObject;
  begin
    // First, split the string by using '|' as a separator
    input := S;
    pattern := '\|';

    outcome := TRegEx.Split(input, pattern);

    pattern := '\*\.';
    SetLength(FileTypes, 0);

    for i := 0 to length(outcome) - 1 do
    begin
      if Odd(i) then
        if outcome[i] <> '*.*' then
          if AnsiLeftStr(outcome[i], 2) = '*.' then
          begin
            aux := TRegEx.Split(outcome[i], pattern);
            for j := 0 to length(aux) - 1 do
            begin
              aux[j] := Trim(aux[j]);
              if aux[j] <> '' then
              begin
                if AnsiEndsStr(';', aux[j]) then
                  aux[j] := AnsiLeftStr(aux[j], length(aux[j]) - 1);
                SetLength(FileTypes, length(FileTypes) + 1);
                FileTypes[length(FileTypes) - 1] := aux[j];
              end;
            end;
          end;
    end;

    // create the NSArray from the FileTypes array
    SetLength(FileTypesNS, length(FileTypes));
    for i := 0 to length(FileTypes) - 1 do
    begin
      NStr := NSSTR(FileTypes[i]);
      if Supports(NStr, ILocalObject, LocObj) then
        FileTypesNS[i] := LocObj.GetObjectID;
    end;
    Result := TNSArray.Wrap(TNSArray.OCClass.arrayWithObjects(@FileTypesNS[0],
      length(FileTypes)));
  end;

begin
  Result := False;
  DefaultExt := ADefaultExt;

  OpenFile := TNSOpenPanel.Wrap(TNSOpenPanel.OCClass.openPanel);

  OpenFile.setAllowsMultipleSelection(TOpenOption.ofAllowMultiSelect in AOptions);
  OpenFile.setCanChooseFiles(True);
  OpenFile.setCanChooseDirectories(True);

  AFiles.Clear;

  if AInitDir <> '' then
  begin
    InitialDir := TNSURL.Create;
    InitialDir.initFileURLWithPath(NSSTR(AInitDir));
    OpenFile.setDirectoryURL(InitialDir);
  end;

  if AFileName <> '' then
  begin
    OpenFile.setNameFieldStringValue(NSSTR(AFileName));
  end;

  if AFilter <> '' then
  begin
    Filter := AllocFilterStr(AFilter);
    OpenFile.setAllowedFileTypes(Filter);
  end;

  if ATitle <> '' then
    OpenFile.setTitle(NSSTR(ATitle));

  OpenFile.retain;
  try
    outcome := OpenFile.runModal;
    if (FModalStack <> nil) and (FModalStack.Count > 0) then
      FRestartModal := True;
    if outcome = NSOKButton then
    begin
      for I := 0 to OpenFile.URLs.count - 1 do
        AFiles.Add(UTF8ToString(TNSUrl.Wrap(OpenFile.URLs.objectAtIndex(I)).relativePath.UTF8String));

      if AFiles.Count > 0 then
        AFileName := AFiles[0];

      if DefaultExt <> '' then
        if ExtractFileExt(AFileName) = '' then
          ChangeFileExt(AFileName, DefaultExt);
      Result := True;
    end;
  finally
    OpenFile.release;
  end;
end;

// Cocoa string constants used for printing
const
  AppKitFwk: string = '/System/Library/Frameworks/AppKit.framework/AppKit';
  
function NSPrintPrinter: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintPrinter');
end;

function NSPrintCopies: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintCopies');
end;

function NSPrintAllPages: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintAllPages');
end;

function NSPrintFirstPage: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintFirstPage');
end;

function NSPrintLastPage: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintLastPage');
end;

function NSPrintMustCollate: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintMustCollate');
end;

function NSPrintReversePageOrder: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintReversePageOrder');
end;

function NSPrintJobDisposition: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintJobDisposition');
end;

function NSPrintSavePath: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintSavePath');
end;

function NSPrintPagesAcross: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintPagesAcross');
end;

function NSPrintPagesDown: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintPagesDown');
end;

function NSPrintTime: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintTime');
end;

function NSPrintDetailedErrorReporting: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintDetailedErrorReporting');
end;

function NSPrintFaxNumber: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintFaxNumber');
end;

function NSPrintPrinterName: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintPrinterName');
end;

function NSPrintHeaderAndFooter: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintHeaderAndFooter');
end;

function NSPrintSelectionOnly: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintSelectionOnly');
end;

function NSPrintJobSavingURL: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintJobSavingURL');
end;

function NSPrintJobSavingFileNameExtensionHidden: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintJobSavingFileNameExtensionHidden');
end;

function NSPrintSpoolJob: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintSpoolJob');
end;

function NSPrintPreviewJob: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintPreviewJob');
end;

function NSPrintSaveJob: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintSaveJob');
end;

function NSPrintCancelJob: NSString;
begin
  Result := CocoaNSStringConst(AppKitFwk, 'NSPrintCancelJob');
end;

function TPlatformCocoa.DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean;
var
  printPanel: NSPrintPanel;
  printInfo: NSPrintInfo;
  outcome : NSInteger;
  dict: NSMutableDictionary;
begin
  Result := False;

  printInfo := TNSPrintInfo.Wrap(TNSPrintInfo.OCClass.sharedPrintInfo);
  printPanel := TNSPrintPanel.Wrap(TNSPrintPanel.OCClass.printPanel);
  dict := printInfo.dictionary;

  dict.setValue(TNSNumber.OCClass.numberWithBool(ACollate), NSPrintMustCollate);
  dict.setValue(TNSNumber.OCClass.numberWithInt(AFromPage), NSPrintFirstpage);
  dict.setValue(TNSNumber.OCClass.numberWithInt(AToPage), NSPrintLastPage);
  dict.setValue(TNSNumber.OCClass.numberWithInt(ACopies), NSPrintCopies);
  if APrintrange = TPrintRange.prAllPages then
    dict.setValue(TNSNumber.OCClass.numberWithBool(True), NSPrintAllPages);
  if TPrintDialogOption.poPrintToFile in AOptions then
   printInfo.setJobDisposition(NSPrintSaveJob);

  printPanel.retain;
  try
    outcome := printPanel.runModalWithPrintInfo(printInfo);
    if outcome = NSOKButton then
    begin
      ACollate := TNSNumber.Wrap(printInfo.dictionary.valueForKey(NSPrintMustCollate)).boolValue();
      ACopies := TNSNumber.Wrap(printInfo.dictionary.valueForKey(NSPrintCopies)).integerValue();
      if printInfo.jobDisposition = NSPrintSaveJob then
        APrintToFile := True;
      if TNSNumber.Wrap(printInfo.dictionary.valueForKey(NSPrintAllPages)).boolValue() = True then
        APrintRange := TPrintRange.prAllPages
      else
      begin
        APrintRange := TPrintRange.prPageNums;
        AFromPage := TNSNumber.Wrap(printInfo.dictionary.valueForKey(NSPrintFirstpage)).integerValue();
        AToPage := TNSNumber.Wrap(printInfo.dictionary.valueForKey(NSPrintLastPage)).integerValue();
      end;
      Result := True;
    end;
  finally
    printPanel.release;
  end;
end;

function TPlatformCocoa.PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF; AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
begin
	Result := False;
end;

function TPlatformCocoa.DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF;
  var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
const
  POINTS_PER_INCHES = 72;
  MM_PER_INCH = 25.4;
var
  pageSetup: NSPageLayout;
  printInfo: NSPrintInfo;
  outcome: Integer;
  newSize: TPointF;

  function ToPoints(Value: Single): Single;
  begin
    Result := Value /1000;
    Result := Result * POINTS_PER_INCHES;
    if AUnits = TPageMeasureUnits.pmMillimeters then
    begin
      Result := Result / MM_PER_INCH;
    end;
  end;

  function FromPoints(Value: Single): Single;
  begin
    Result := Value * 1000;
    Result := Result / POINTS_PER_INCHES;
    if AUnits = TPageMeasureUnits.pmMillimeters then
    begin
      Result := Result * MM_PER_INCH;
    end;
  end;

begin
  Result := False;
  printInfo := TNSPrintInfo.Wrap(TNSPrintInfo.OCClass.sharedPrintInfo);
  pageSetup := TNSPageLayout.Wrap(TNSPageLayout.OCClass.pageLayout);

  //Calculate paper size for MAC side
  newSize.X := ToPoints(APaperSize.X);
  newSize.y := ToPoints(APaperSize.y);
  printInfo.setPaperSize(NSSize(newSize));

  //If psoMargins is set, use the margins specified by the user,
  //else, let the panel use the defaults.
  if TPageSetupDialogOption.psoMargins in AOptions then
  begin
    printInfo.setLeftMargin(ToPoints(AMargin.Left));
    printInfo.setTopMargin(ToPoints(AMargin.Top));
    printInfo.setRightMargin(ToPoints(AMargin.Right));
    printInfo.setBottomMargin(ToPoints(AMargin.Bottom));
  end;

  printInfo.setHorizontallyCentered(False);
  printInfo.setVerticallyCentered(False);

  pageSetup.retain;
  try
    outcome := pageSetup.runModalWithPrintInfo(printInfo);
    if outcome = NSOKButton then
    begin
      APaperSize := TPointF(printInfo.paperSize);
      //transfrom from points into inches
      APaperSize.X := FromPoints(APaperSize.X);
      APaperSize.y := FromPoints(APaperSize.Y);

      // Set the margins to the values from the dialog.
      AMargin.Left := round(FromPoints(printInfo.LeftMargin));
      AMargin.Top := round(FromPoints(printInfo.TopMargin));
      AMargin.Right := round(FromPoints(printInfo.RightMargin));
      AMargin.Bottom := round(FromPoints(printInfo.BottomMargin));

      //if psoMinMargins is set in options, then adjust the margins to fit
      if TPageSetupDialogOption.psoMinMargins in AOptions then
      begin
        if AMargin.Left < AMinMargin.Left then
          AMargin.Left := AMinMargin.Left;
        if AMargin.Top < AMinMargin.Top then
          AMargin.Top := AMinMargin.Top;
        if AMargin.Right < AMinMargin.Right then
          AMargin.Right := AMinMargin.Right;
        if AMargin.Bottom < AMinMargin.Bottom then
          AMargin.Bottom := AMinMargin.Bottom;
      end;
      //SetPrinter(hDevMode, hDevNames)
      Result := True;
    end;
  finally
    pageSetup.release;
  end;
end;

function TPlatformCocoa.DialogPrinterSetup: Boolean;
begin
  Result := False;
end;

function TPlatformCocoa.DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
  var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean;
var
  SaveFile: NSSavePanel;
  DefaultExt: string;
  Filter: NSArray;
  InitialDir: NSURL;
  outcome : NSInteger;

  function AllocFilterStr(const S: string): NSArray;
  var
    input, pattern: string;
    FileTypes: array of string;
    outcome, aux: TArray<string>;
    i, j: Integer;
    FileTypesNS: array of Pointer;
	  NStr: NSString;
    LocObj: ILocalObject;
  begin
    // First, split the string by using '|' as a separator
    input := S;
    pattern := '\|';

    outcome := TRegEx.Split(input, pattern);

    pattern := '\*\.';
    SetLength(FileTypes, 0);

    for i := 0 to length(outcome) - 1 do
    begin
      if Odd(i) then
        if outcome[i] <> '*.*' then
          if AnsiLeftStr(outcome[i], 2) = '*.' then
          begin
            // Split the string by using '*.' as a separator
            aux := TRegEx.Split(outcome[i], pattern);
            for j := 0 to length(aux) - 1 do
            begin
              aux[j] := Trim(aux[j]);
              if aux[j] <> '' then
              begin
                //Remove the ';' if necessary
                if AnsiEndsStr(';', aux[j]) then
                  aux[j] := AnsiLeftStr(aux[j], length(aux[j]) - 1);
                SetLength(FileTypes, length(FileTypes) + 1);
                FileTypes[length(FileTypes) - 1] := aux[j];
              end;
            end;
          end;
    end;

    // create the NSArray from the FileTypes array
    SetLength(FileTypesNS, length(FileTypes));
    for i := 0 to Length(FileTypes) - 1 do
    begin
      NStr := NSSTR(FileTypes[i]);
      if Supports(NStr, ILocalObject, LocObj) then
        FileTypesNS[i] := LocObj.GetObjectID;
    end;
    Result := TNSArray.Wrap(TNSArray.OCClass.arrayWithObjects(@FileTypesNS[0], length(FileTypes)));
  end;

begin
  Result := False;

  //SaveFile := TNSSavePanel.Create;
  SaveFile := TNSSavePanel.Wrap(TNSSavePanel.OCClass.savePanel);

  if AInitDir <> '' then
  begin
    InitialDir := TNSURL.Create;
    InitialDir.initFileURLWithPath(NSSTR(AInitDir));
    SaveFile.setDirectoryURL(InitialDir);
  end;

  if AFileName <> '' then
  begin
    SaveFile.setNameFieldStringValue(NSSTR(AFileName));
  end;

  if AFilter <> '' then
  begin
    Filter := AllocFilterStr(AFilter);
    SaveFile.setAllowedFileTypes(Filter);
  end;

  if ATitle <> '' then
    SaveFile.setTitle(NSSTR(ATitle));

  SaveFile.retain;
  try
    outcome := SaveFile.runModal;
    if (FModalStack <> nil) and (FModalStack.Count > 0) then
      FRestartModal := True;
    if outcome = NSOKButton then
    begin
      AFileName := UTF8ToString(SaveFile.URL.relativePath.UTF8String);
      if DefaultExt <> '' then
        if ExtractFileExt(AFileName) = '' then
          ChangeFileExt(AFileName, DefaultExt);
      Result := True;
    end;
  finally
    SaveFile.release;
  end;
end;

procedure TPlatformCocoa.DeleteHandle(FmxHandle: TFmxHandle);
begin
  ValidateHandle(FmxHandle);
  TMonitor.Enter(FObjectiveCMap);
  try
    FObjectiveCMap.Remove(FmxHandle);
  finally
    TMonitor.Exit(FObjectiveCMap);
  end;
end;

function FmxHandleToObjC(FmxHandle: TFmxHandle): IObjectiveC;
begin
  Result := (Platform as TPlatformCocoa).HandleToObjC(FmxHandle);
end;

{ TFMXPanelWindow }

function TFMXPanelWindow.canBecomeMainWindow: Boolean;
begin
  Result := False;
end;

function TFMXPanelWindow.GetObjectiveCClass: PTypeInfo;
begin
    Result := TypeInfo(FMXPanelWindow);
end;

end.
