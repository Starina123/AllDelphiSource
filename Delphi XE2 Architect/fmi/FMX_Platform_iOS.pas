{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Platform_iOS;

{$linkframework OpenGLES}
{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  {$IFDEF DARWIN}
  iPhoneAll,
  CFBase, CFString,
  CGContext, CGImage, CGBitmapContext, CGGeometry, CGColorSpace,
  {$ENDIF}
  Classes, SysUtils, Variants, TypInfo, UITypes, FMX_Types, 
  FMX_Types3D, FMX_Forms, FMX_Platform, FMX_Menus, FMX_Dialogs;

type

  { TPlatformCocoa }

  TPlatformCocoa = class(TPlatform)
  private
    FKeyboardView: UIView;
    FIdleTimer: TTimer;
    FIdle: Boolean;
    procedure DoUpdateTimer(Sender: TObject);
    procedure DoIdleTimer(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { App }
    procedure Run; override;
    procedure Terminate; override;
    function HandleMessage: Boolean; override;
    procedure WaitMessage; override;
    { System Metrics }
    function GetDefaultFontFamilyName: WideString; override;
    { Timer }
    function CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle; override;
    function DestroyTimer(Timer: TFmxHandle): Boolean; override;
    function GetTick: single; override;
    { Window }
    function FindForm(AHandle: TFmxHandle): TCommonCustomForm; override;
    function CreateWindow(AForm: TCommonCustomForm): THandle; override;
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
    procedure SetWindowCaption(AForm: TCommonCustomForm; const ACaption: WideString); override;
    procedure SetCapture(AForm: TCommonCustomForm); override;
    procedure ReleaseCapture(AForm: TCommonCustomForm); override;
    function ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    function ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    { Drag and Drop }
    procedure BeginDragDrop(AForm: TCommonCustomForm; const Data: TDragObject; ABitmap: TBitmap); override;
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
    function GetCurrentLangID: WideString; override;
    function GetLocaleFirstDayOfWeek: WideString; override;
    { Dialogs }
    function DialogOpenFiles(var FileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: WideString;
      var AFilterIndex: Integer; var AFiles: TWideStrings; var AOptions: TOpenOptions): Boolean; override;
    function DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean; override; 
    function DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF; var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; override;
    function DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: WideString;
      var AFilterIndex: Integer; var AFiles: TWideStrings; var AOptions: TOpenOptions): Boolean; override;
    { Text Service }
    function GetTextServiceClass: TTextServiceClass; override;
    { Keyboard }
    function ShowVirtualKeyboard(AControl: TFmxObject): Boolean; override;
    function HideVirtualKeyboard: Boolean; override;
    { Menus }
    procedure StartMenuLoop(const AView: IMenuView); override;
    procedure CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer); override;
    procedure UpdateMenuItem(const AItem: TMenuItem); override;
    function ShortCutToText(ShortCut: TShortCut): WideString; override;
    procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState); override;
  end;

function ActualPlatformClass: TPlatformClass;

implementation

{$R *.res}

function ActualPlatformClass: TPlatformClass;
begin
  Result := TPlatformCocoa;
end;

type
  THackForm = class(TCommonCustomForm);

  ApplicationDelegate = objcclass(NSObject)
    procedure applicationDidFinishLaunching(notification: UIApplication); message 'applicationDidFinishLaunching:';
    procedure applicationWillTerminate(notification : UIApplication); message 'applicationWillTerminate:';
 end;

  { TUIViewController }
  TUIViewController = objcclass(UIViewController)
  private
  public
    function shouldAutorotateToInterfaceOrientation(AinterfaceOrientation: UIInterfaceOrientation): Boolean; override;
    procedure didReceiveMemoryWarning; override;
    procedure didAnimateFirstHalfOfRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation); override;
    procedure didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation); override;
  end;

  { TUIWindow }

  TUIWindow = objcclass(UIWindow)
  protected
  public
    Text: UITextField;
    mainView: UIView;
    mainController: TUIViewController;
  end;

  { TTextServiceCocoa }
  TTextServiceCocoa = class(TTextService)
  private
    FCaretPostion: TPoint;
    FText : WideString;
    FMarkedText : WideString;
    FImeMode: TImeMode;
  protected
    function GetText: WideString; override;
    procedure SetText(const Value: WideString); override;
    function GetCaretPostion: TPoint; override;
    procedure SetCaretPostion(const Value: TPoint); override;

  public
    procedure InternalSetMarkedText( const AMarkedText: WideString ); override;
    function InternalGetMarkedText: WideString; override;

    function CombinedText: WideString; override;
    function TargetClausePosition: TPoint; override;

    procedure EnterControl(const FormHandle: TFmxHandle); override;
    procedure ExitControl(const FormHandle: TFmxHandle); override;


    procedure DrawSingleLine( Canvas: TCanvas;
      const ARect: TRectF; const FirstVisibleChar: integer; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); override;

    procedure DrawSingleLine2( Canvas: TCanvas;
      const S: WideString;
      const ARect: TRectF;

      const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); override;

    function HasMarkedText: boolean; override;

    function GetImeMode: TImeMode; override;
    procedure SetImeMode(const Value: TImeMode); override;

    { Cocoa }
    constructor Create(const Owner: TControl; SupportMultiLine: Boolean); override;
    destructor Destroy; override;
//    function InternalGetMarkedRect: TRectF; virtual;

  end;

var
  pool: NSAutoreleasePool;
  mainWindow: TUIWindow;
  GlobalDragging: Boolean;
  GlobalDragObject: TDragObject;
  GlobalDragBitmap: TBitmap;
  GlobalDragPosition: TPointF;
  GlobalDragAccept: Boolean;

procedure ApplicationDelegate.applicationDidFinishLaunching(notification: UIApplication);
begin
  { create window }
  mainWindow := TUIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds);
  mainWindow.setAutoresizesSubviews(True);
  mainWindow.makeKeyAndVisible;
  { }
  mainWindow.mainView := UIView.alloc.initWithFrame(CGRectMake(0, 20, mainWindow.bounds.size.Width, mainWindow.bounds.size.Height - 20));
  mainWindow.mainView.setAutoresizesSubviews(True);
  mainWindow.mainView.setOpaque(True);
  mainWindow.mainController := TUIViewController.alloc.initWithNibName_bundle(nil, nil);
  mainWindow.mainController.setView(mainWindow.mainView);
  mainWindow.AddSubView(mainWindow.mainView);
  { }
  Application.RealCreateForms;
  UIDevice.currentDevice.beginGeneratingDeviceOrientationNotifications;
end;

procedure ApplicationDelegate.applicationWillTerminate(notification : UIApplication);
begin
  mainWindow.release;
end;

{ TUIViewController }

function TUIViewController.shouldAutorotateToInterfaceOrientation(
  AinterfaceOrientation: UIInterfaceOrientation): Boolean;
begin
  Result := True;
end;

procedure TUIViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;
end;

procedure TUIViewController.didAnimateFirstHalfOfRotationToInterfaceOrientation(
  toInterfaceOrientation: UIInterfaceOrientation);
begin
  inherited didAnimateFirstHalfOfRotationToInterfaceOrientation(
    toInterfaceOrientation);
  if Application.MainForm <> nil then
  begin
    with UIView(Application.MainForm.Handle).frame do
      Application.MainForm.SetBounds(round(origin.x), round(origin.y), round(size.width), round(size.height));
  end;
end;

procedure TUIViewController.didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation);
begin
  inherited didRotateFromInterfaceOrientation(fromInterfaceOrientation);
  if Application.MainForm <> nil then
  begin
    with UIView(Application.MainForm.Handle).frame do
      Application.MainForm.SetBounds(round(origin.x), round(origin.y), round(size.width), round(size.height));
  end;
end;

{ TPlatformCocoa }

constructor TPlatformCocoa.Create(AOwner: TComponent);
begin
  inherited;
  GlobalUseHWEffects := False; // Force use CPU effects on iOS device
  pool := NSAutoreleasePool.new;
  Application := TApplication.Create(nil);
end;

destructor TPlatformCocoa.Destroy;
begin
  Application.Free;
  Application := nil;
  pool.release;
  inherited;
end;

{ App =========================================================================}

procedure TPlatformCocoa.Run;
begin
  FIdleTimer := TTimer.Create(Application);
  FIdleTimer.OnTimer := @DoIdleTimer;
  {}
  ExitCode := UIApplicationMain(argc, argv, nil, NSSTR('ApplicationDelegate'));
end;

procedure TPlatformCocoa.DoIdleTimer(Sender: TObject);
begin
  FIdle := True;
  try
    Application.HandleMessage;
  finally
    FIdle := False;
  end;
end;

procedure TPlatformCocoa.Terminate;
begin
//  NSApp.terminate(nil);
end;

function TPlatformCocoa.HandleMessage: Boolean;
begin
  if not FIdle then
    NSRunLoop.currentRunLoop.runUntilDate(NSDate.dateWithTimeIntervalSinceNow(0.1));
  Result := False;
end;

procedure TPlatformCocoa.WaitMessage;
begin
  NSRunLoop.currentRunLoop.runMode_beforeDate(NSDefaultRunLoopMode, NSDate.date);
end;

function TPlatformCocoa.GetDefaultFontFamilyName: WideString;
begin
  Result := 'Helvetica';
end;

{ Timer =======================================================================}

type

  TCocoaTimerObject = objcclass(NSObject)
    func : TTimerProc;
    procedure timerEvent; message 'timerEvent';
    class function initWithFunc(afunc: TTimerProc): TCocoaTimerObject; message 'initWithFunc:';
  end;

procedure TCocoaTimerObject.timerEvent;
begin
  if Assigned(@func) then func;
end;

class function TCocoaTimerObject.initWithFunc(afunc: TTimerProc): TCocoaTimerObject;
begin
  Result:=alloc;
  Result.func:=afunc;
end;

function TPlatformCocoa.CreateTimer(Interval: Integer;
  TimerFunc: TTimerProc): TFmxHandle;
var
  timer : NSTimer;
  user  : TCocoaTimerObject;
begin
  user := TCocoaTimerObject.initWithFunc(TimerFunc);

  timer := NSTimer.timerWithTimeInterval_target_selector_userInfo_repeats(
    Interval/1000, user, objcselector(user.timerEvent), user, True);

  NSRunLoop.currentRunLoop.addTimer_forMode(timer, NSDefaultRunLoopMode);

  {user is retained (twice, because it's target), by the timer and }
  {released (twice) on timer invalidation}
  user.release;

  Result := cardinal(timer);
end;

function TPlatformCocoa.DestroyTimer(Timer: TFmxHandle): Boolean;
var
  obj : NSObject;
begin
  obj := NSObject(Timer);
  try
    Result := Assigned(obj) and obj.isKindOfClass_(NSTimer);
  except
    Result := False;
  end;
  if not Result then Exit;
  NSTimer(obj).invalidate;
end;

function TPlatformCocoa.GetTick: single;
var
  H, M, S, MS: word;
begin
  DecodeTime(time, H, M, S, MS);
  Result := ((((H * 60 * 60) + (M * 60) + S) * 1000) + MS) / 1000;
end;

{ Window ======================================================================}

{ Text Service }

constructor TTextServiceCocoa.Create(const Owner: TControl; SupportMultiLine: Boolean);
begin
  inherited;
end;

destructor TTextServiceCocoa.Destroy;
begin
  inherited;
end;

function TTextServiceCocoa.GetText: WideString;
begin
  Result := FText;
end;

procedure TTextServiceCocoa.SetText(const Value: WideString);
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

procedure TTextServiceCocoa.InternalSetMarkedText( const AMarkedText: WideString );
begin
  FMarkedText := AMarkedText;
end;

function TTextServiceCocoa.InternalGetMarkedText: WideString;
begin
  Result := FMarkedText;
end;

function TTextServiceCocoa.CombinedText: WideString;
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

  function _TextWidth(const Str: WideString): Single;
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
  BeforeCaret, AfterCaret: WideString;
  WholeTextWidth: Single;
  EditRectWidth: Single;
  MarkedLineBottom: Single;
  S: WideString;
begin
  S := Copy(Text, 1, CaretPosition.X) + FMarkedText + Copy(Text, CaretPosition.X+1,  MaxInt);
  Canvas.FillText(ARect, Copy(S, FirstVisibleChar, Length(S) - FirstVisibleChar + 1), False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 2;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X))                       - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Length(FMarkedText))) - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
                         MarkedLineBottom),
                  AOpacity);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;

end;

procedure TTextServiceCocoa.DrawSingleLine2( Canvas: TCanvas;
      const S: WideString;
      const ARect: TRectF;

      const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter );

  function _TextWidth(const Str: WideString): Single;
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
  BeforeCaret, AfterCaret: WideString;
  WholeTextWidth: Single;
  EditRectWidth: Single;
  MarkedLineBottom: Single;
begin
  Canvas.FillText(ARect, S, False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 2;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
  Canvas.DrawLine(PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X))                       - _TextWidth(Copy(S, 1, 1-1)),
                         MarkedLineBottom),
                  PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + Length(FMarkedText))) - _TextWidth(Copy(S, 1, 1-1)),
                         MarkedLineBottom),
                  AOpacity);
  Canvas.StrokeThickness := 1;
  Canvas.StrokeDash := TStrokeDash.sdSolid;

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

function TPlatformCocoa.GetTextServiceClass: TTextServiceClass;
begin
  Result := TTextServiceCocoa;
end;

type

  { TUIView }

  { TUITextPosition }

  TUITextPosition = objcclass(UITextPosition)
  private
    FValue: Integer;
  public
    function initWith_Value(Value: Integer): TUITextPosition; message 'Value:';
  end;

  { TUITextRange }

  TUITextRange = objcclass(UITextRange)
  private
    FRange: NSRange;
  public
    function isEmpty: Boolean; override;
    function start: UITextPosition; override;
    function _end: UITextPosition; message 'end';
    function initWith_Location_Length(Location, Length: Integer): TUITextRange; message 'Location:Length:';
  end;

  TUIView = objcclass(UIView, UIKeyInputProtocol, UITextInputProtocol, UITextInputTraitsProtocol)
  public
    Form: TCommonCustomForm;
    Orientation: UIInterfaceOrientation;
    Controller: TUIViewController;
    FMarkRange: NSRange;
    FMarkText: NSString;
    FText: NSString;
    FKeyboardType: TVirtualKeyboardType;
    procedure touchesBegan_withEvent(touches: NSSet; event: UIEvent); override;
    procedure touchesMoved_withEvent(touches: NSSet; event: UIEvent); override;
    procedure touchesEnded_withEvent(touches: NSSet; event: UIEvent); override;
    function canBecomeFirstResponder: Boolean; override;
    function canResignFirstResponder: Boolean; override;
    function isFirstResponder: Boolean; override;
    { UIKeyInputProtocol }
    function hasText: Boolean; message 'hasText';
    procedure insertText(text: NSString); message 'insertText:';
    procedure deleteBackward; message 'deleteBackward';
    { UITextInputProtocol }
    function textInRange(range: UITextRange): NSString; message 'textInRange:';
    procedure replaceRange_withText(range: UITextRange; text: NSString); message 'replaceRange:withText:';
    procedure setSelectedTextRange (newValue: UITextRange); message 'setSelectedTextRange:';
    function selectedTextRange: UITextRange; message 'selectedTextRange';
    function markedTextRange: UITextRange; message 'markedTextRange';
    procedure setMarkedTextStyle (newValue: NSDictionary); message 'setMarkedTextStyle:';
    function markedTextStyle: NSDictionary; message 'markedTextStyle';
    procedure setMarkedText_selectedRange(markedText: NSString; selectedRange: NSRange); message 'setMarkedText:selectedRange:';
    procedure unmarkText; message 'unmarkText';
    function beginningOfDocument: UITextPosition; message 'beginningOfDocument';
    function endOfDocument: UITextPosition; message 'endOfDocument';
    function textRangeFromPosition_toPosition(fromPosition: UITextPosition; toPosition: UITextPosition): UITextRange; message 'textRangeFromPosition:toPosition:';
    function positionFromPosition_offset(position: UITextPosition; offset: NSInteger): UITextPosition; message 'positionFromPosition:offset:';
    function positionFromPosition_inDirection_offset(position: UITextPosition; direction: UITextLayoutDirection; offset: NSInteger): UITextPosition; message 'positionFromPosition:inDirection:offset:';
    function comparePosition_toPosition(position: UITextPosition; other: UITextPosition): NSComparisonResult; message 'comparePosition:toPosition:';
    function offsetFromPosition_toPosition(from: UITextPosition; toPosition: UITextPosition): NSInteger; message 'offsetFromPosition:toPosition:';
    procedure setInputDelegate (newValue: id); message 'setInputDelegate:';
    function inputDelegate: id; message 'inputDelegate';
    function tokenizer: id; message 'tokenizer';
    function positionWithinRange_farthestInDirection(range: UITextRange; direction: UITextLayoutDirection): UITextPosition; message 'positionWithinRange:farthestInDirection:';
    function characterRangeByExtendingPosition_inDirection(position: UITextPosition; direction: UITextLayoutDirection): UITextRange; message 'characterRangeByExtendingPosition:inDirection:';
    function baseWritingDirectionForPosition_inDirection(position: UITextPosition; direction: UITextStorageDirection): UITextWritingDirection; message 'baseWritingDirectionForPosition:inDirection:';
    procedure setBaseWritingDirection_forRange(writingDirection: UITextWritingDirection; range: UITextRange); message 'setBaseWritingDirection:forRange:';
    function firstRectForRange(range: UITextRange): CGRect; message 'firstRectForRange:';
    function caretRectForPosition(position: UITextPosition): CGRect; message 'caretRectForPosition:';
    function closestPositionToPoint(point: CGPoint): UITextPosition; message 'closestPositionToPoint:';
    function closestPositionToPoint_withinRange(point: CGPoint; range: UITextRange): UITextPosition; message 'closestPositionToPoint:withinRange:';
    function characterRangeAtPoint(point: CGPoint): UITextRange; message 'characterRangeAtPoint:';
    { UITextInputTraitsProtocol }
    function autocapitalizationType: UITextAutocapitalizationType; message 'autocapitalizationType';
    function autocorrectionType: UITextAutocorrectionType; message 'autocorrectionType';
    function enablesReturnKeyAutomatically: Boolean; message 'enablesReturnKeyAutomatically';
    function keyboardAppearance: UIKeyboardAppearance; message 'keyboardAppearance';
    function keyboardType: UIKeyboardType; message 'keyboardType';
    function returnKeyType: UIReturnKeyType; message 'returnKeyType';
    function secureTextEntry: Boolean; message 'secureTextEntry';
  end;

  { TUIView2D }
  TUIView2D = objcclass(TUIView)
  public
    procedure drawRect(r: CGRect); override;
  end;

  { TUIView3D }

  TUIView3D = objcclass(TUIView)
  public
    UpdateTimer: TTimer;
    class function layerClass: Pobjc_class; override;
  end;

{ TUITextPosition }

function TUITextPosition.initWith_Value(Value: Integer): TUITextPosition;
begin
  FValue := Value;
  Result := Self;
end;

{ TUITextRange }

function TUITextRange.isEmpty: Boolean;
begin
  Result := FRange.length = 0;
end;

function TUITextRange.start: UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(FRange.location);
end;

function TUITextRange._end: UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(FRange.location + FRange.length);
end;

function TUITextRange.initWith_Location_Length(Location, Length: Integer): TUITextRange;
begin
  FRange.Location := Location;
  FRange.Length := Length;
  Result := Self;
end;

{ TUIView }

  function GetTouchCoord(touches: NSSet; Window: UIView; var x, y: single): Boolean;
  var
      st    : NSSet;
      touch : UITouch;
      p     : CGPoint;
  begin
      Result := Assigned(touches);
      if not Result then Exit;
      st := NSSet(touches);
      Result := st.count = 1;
      if not Result then Exit;

      touch := UITouch(st.anyObject);
      p := touch.locationInView(Window);
      x := p.x;
      y := p.y;
  end;

procedure TUIView.touchesBegan_withEvent(touches: NSSet; event: UIEvent);
var
  x, y : single;
begin
  if not GetTouchCoord(touches, self, x, y) then Exit;
  GlobalDragPosition := PointF(x, y);
  Form.MouseDown(TMouseButton.mbLeft, [], x, y);
  inherited touchesBegan_withEvent(touches, event);
end;

procedure TUIView.touchesMoved_withEvent(touches: NSSet; event: UIEvent);
var
  x, y : single;
begin
  if not GetTouchCoord(touches, self, x, y) then Exit;
  if GlobalDragging then
  begin
    GlobalDragPosition := PointF(x, y);
    GlobalDragAccept := False;
    Form.DragOver(GlobalDragObject, GlobalDragPosition, GlobalDragAccept);
    Form.Invalidate;
  end
  else
    Form.MouseMove([ssLeft], x, y);
  inherited touchesMoved_withEvent(touches, event);
end;

procedure TUIView.touchesEnded_withEvent(touches: NSSet; event: UIEvent);
var
  x, y : single;
begin
  if not GetTouchCoord(touches, self, x, y) then Exit;
  if GlobalDragging then
  begin
    if GlobalDragAccept then
      Form.DragDrop(GlobalDragObject, GlobalDragPosition);
    GlobalDragging := False;
    Form.Invalidate;
  end
  else
    Form.MouseUp(TMouseButton.mbLeft, [], x, y);
  inherited touchesEnded_withEvent(touches, event);
end;

function TUIView.canBecomeFirstResponder: Boolean;
begin
  Result := True;
end;

function TUIView.canResignFirstResponder: Boolean;
begin
  Result := True;
end;

function TUIView.isFirstResponder: Boolean;
begin
  Result := True;
end;

{ UIKeyInputProtocol }

function TUIView.hasText: Boolean;
begin
  Result := (FText <> nil) and (FText.length > 0);
end;

procedure TUIView.insertText(text: NSString);
var
  i: Integer;
  K: Word;
  Ch: System.WideChar;
  Str: WideString;
begin
  if text.length > 0 then
  begin
    Str := UTF8Decode(text.UTF8String);
    for i := 1 to Length(Str) do
    begin
      K := 0;
      Ch := Str[i];
      if Ch = #10 then
      begin
        K := vkReturn;
        Ch := #0;
        Form.KeyDown(K, Ch, []);
      end
      else
        Form.KeyDown(K, Ch, []);
    end;
  end;
end;

procedure TUIView.deleteBackward;
var
  K: Word;
  Ch: System.WideChar;
  Str: WideString;
begin
  K := vkBack;
  Ch := #0;
  Form.KeyDown(K, Ch, []);
end;

{ UITextInputProtocol }

function TUIView.textInRange(range: UITextRange): NSString;
begin
  if (range = nil) or (TUITextRange(range).FRange.length = 0) then
    Result := NSSTR('')
  else
    Result := FText.substringWithRange(TUITextRange(range).FRange);
end;

procedure TUIView.replaceRange_withText(range: UITextRange; text: NSString);
var
  i: Integer;
  K: Word;
  Ch: System.WideChar;
  Str: WideString;
begin
  unmarkText;
  if text.length > 0 then
  begin
    Str := UTF8Decode(text.UTF8String);
    for i := 1 to Length(Str) do
    begin
      K := 0;
      Ch := Str[i];
      Form.KeyDown(K, Ch, []);
    end;
  end;
end;

procedure TUIView.setSelectedTextRange(newValue: UITextRange);
begin
end;

function TUIView.selectedTextRange: UITextRange;
begin
  Result := nil;
end;

function TUIView.markedTextRange: UITextRange;
begin
  if FMarkRange.Length = 0 then
    Result := nil
  else
    Result := TUITextRange.alloc.initWith_Location_Length(FMarkRange.Location, FMarkRange.Length);
end;

procedure TUIView.setMarkedTextStyle(newValue: NSDictionary);
begin
end;

function TUIView.markedTextStyle: NSDictionary;
begin
  Result := nil;
end;

procedure TUIView.setMarkedText_selectedRange(markedText: NSString;
  selectedRange: NSRange);
begin
  TTextServiceCocoa((Form.Focused as ITextServiceControl).GetTextService).InternalSetMarkedText(UTF8Decode(markedText.UTF8String));
  FMarkText := markedText;
  FMarkRange.location := 0;
  FMarkRange.length :=  markedText.length;
end;

procedure TUIView.unmarkText;
var
  i: Integer;
  K: Word;
  Ch: System.WideChar;
  Str: WideString;
begin
  TTextServiceCocoa((Form.Focused as ITextServiceControl).GetTextService).InternalSetMarkedText('');
  FMarkRange.location := 0;
  FMarkRange.length := 0;
  if (FMarkText <> nil) and (FMarkText.length > 0) then
  begin
    Str := UTF8Decode(FMarkText.UTF8String);
    for i := 1 to Length(Str) do
    begin
      K := 0;
      Ch := Str[i];
      Form.KeyDown(K, Ch, []);
    end;
  end;
  FMarkText := nil;
end;

function TUIView.beginningOfDocument: UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(0);
end;

function TUIView.endOfDocument: UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(FText.length);
end;

function TUIView.textRangeFromPosition_toPosition(fromPosition: UITextPosition;
  toPosition: UITextPosition): UITextRange;
begin
  Result := TUITextRange.alloc.initWith_Location_Length(TUITextPosition(fromPosition).FValue, TUITextPosition(toPosition).FValue - TUITextPosition(fromPosition).FValue);
end;

function TUIView.positionFromPosition_offset(position: UITextPosition;
  offset: NSInteger): UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(TUITextPosition(position).FValue + offset);
end;

function TUIView.positionFromPosition_inDirection_offset(
  position: UITextPosition; direction: UITextLayoutDirection; offset: NSInteger
  ): UITextPosition;
begin
  case direction of
    UITextLayoutDirectionRight: Result := TUITextPosition.alloc.initWith_Value(TUITextPosition(position).FValue + offset);
    UITextLayoutDirectionLeft: Result := TUITextPosition.alloc.initWith_Value(TUITextPosition(position).FValue + offset);
    UITextLayoutDirectionUp: Result := TUITextPosition.alloc.initWith_Value(TUITextPosition(position).FValue + offset);
    UITextLayoutDirectionDown: Result := TUITextPosition.alloc.initWith_Value(TUITextPosition(position).FValue + offset);
  end;
end;

function TUIView.comparePosition_toPosition(position: UITextPosition;
  other: UITextPosition): NSComparisonResult;
begin
  if other = nil then
    Result := NSOrderedDescending
  else
  if TUITextPosition(position).FValue > TUITextPosition(other).FValue then
    Result := NSOrderedAscending
  else
  if TUITextPosition(position).FValue < TUITextPosition(other).FValue then
    Result := NSOrderedDescending
  else
    Result := NSOrderedSame;
end;

function TUIView.offsetFromPosition_toPosition(from: UITextPosition;
  toPosition: UITextPosition): NSInteger;
begin
  Result := TUITextPosition(toPosition).FValue - TUITextPosition(from).FValue;
end;

procedure TUIView.setInputDelegate(newValue: id);
begin
end;

function TUIView.inputDelegate: id;
begin
  Result := nil;
end;

function TUIView.tokenizer: id;
begin
  Result := UITextInputStringTokenizer.alloc.initWithTextInput(Self);
end;

function TUIView.positionWithinRange_farthestInDirection(range: UITextRange;
  direction: UITextLayoutDirection): UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(0);
end;

function TUIView.characterRangeByExtendingPosition_inDirection(
  position: UITextPosition; direction: UITextLayoutDirection): UITextRange;
begin
  Result := TUITextRange.alloc.initWith_Location_Length(0, 0);
end;

function TUIView.baseWritingDirectionForPosition_inDirection(
  position: UITextPosition; direction: UITextStorageDirection): UITextWritingDirection;
begin
end;

procedure TUIView.setBaseWritingDirection_forRange(
  writingDirection: UITextWritingDirection; range: UITextRange);
begin
end;

function TUIView.firstRectForRange(range: UITextRange): CGRect;
var
  glyphRect: CGRect;
  R: TRectF;
  TSObj: ITextServiceControl;
begin
  if (Form.Focused <> nil) and Supports(Form.Focused, ITextServiceControl, TSObj) then
  begin
    R := TRectF.Create(TSObj.GetTargetClausePointF);
  end
  else
  begin
    R := TControl(Form.Focused.GetObject).AbsoluteRect;
  end;

  with R do
    glyphRect := CGRectMake(Left, Top, Right - Left, Bottom - Top);
  Result := glyphRect;
end;

function TUIView.caretRectForPosition(position: UITextPosition): CGRect;
begin
  Result := CGRectMake(0, 0, 0, 0);
end;

function TUIView.closestPositionToPoint(point: CGPoint): UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(0);
end;

function TUIView.closestPositionToPoint_withinRange(point: CGPoint;
  range: UITextRange): UITextPosition;
begin
  Result := TUITextPosition.alloc.initWith_Value(0);
end;

function TUIView.characterRangeAtPoint(point: CGPoint): UITextRange;
begin
  Result := TUITextRange.alloc.initWith_Location_Length(0, 0);
end;

{ UITextInputTraits protocol }

function TUIView.autocapitalizationType: UITextAutocapitalizationType;
begin
  Result := UITextAutocapitalizationTypeNone;
end;

function TUIView.autocorrectionType: UITextAutocorrectionType;
begin
  if FKeyboardType <> TVirtualKeyboardType.vktDefault then
    Result := UITextAutocorrectionTypeNo
  else
    Result := UITextAutocorrectionTypeDefault;
end;

function TUIView.enablesReturnKeyAutomatically: Boolean;
begin
  Result := False;
end;

function TUIView.keyboardAppearance: UIKeyboardAppearance;
begin
  Result := UIKeyboardAppearanceDefault;
end;

function TUIView.keyboardType: UIKeyboardType;
begin
  case FKeyboardType of
    TVirtualKeyboardType.vktNumbersAndPunctuation:
      Result := UIKeyboardTypeNumbersAndPunctuation;
    TVirtualKeyboardType.vktNumberPad:
      Result := UIKeyboardTypeNumberPad;
    TVirtualKeyboardType.vktPhonePad:
      Result := UIKeyboardTypePhonePad;
    else
      Result := UIKeyboardTypeDefault;
  end;
end;

function TUIView.returnKeyType: UIReturnKeyType;
begin
  Result := UIReturnKeyDefault;
end;

function TUIView.secureTextEntry: Boolean;
begin
  Result := False;
end;

{ TUIView2D }

procedure TUIView2D.drawRect(r: CGRect);
begin
  if Form <> nil then
  begin
    Form.ContextHandle := THandle(UIGraphicsGetCurrentContext);
    Form.PaintRects([RectF(r.origin.x, r.origin.y, r.origin.x + r.size.width, r.origin.y + r.size.height)]);
    if GlobalDragging and (GlobalDragBitmap <> nil) then
    begin
      with TCustomForm(Form) do
      begin
        if Canvas.BeginScene then
        try
          with ScreenToClient(GlobalDragPosition) do
            Canvas.DrawBitmap(GlobalDragBitmap, RectF(0, 0, GlobalDragBitmap.Width, GlobalDragBitmap.Height),
              RectF(X - GlobalDragBitmap.Width / 2, Y - GlobalDragBitmap.Height / 2,
                X + GlobalDragBitmap.Width / 2, Y + GlobalDragBitmap.Height / 2), 1);
        finally
          Canvas.EndScene;
        end;
        if Canvas.Buffered then
          Canvas.FlushBufferRect(0, 0, ContextHandle, RectF(0, 0, Canvas.Width, Canvas.Height));
      end;
    end;
    Form.ContextHandle := 0;
  end;
end;

{ TUIView3D }

class function TUIView3D.layerClass: Pobjc_class;
begin
  Result := CAEAGLLayer;
end;

function TPlatformCocoa.FindForm(AHandle: TFmxHandle): TCommonCustomForm;
begin
  Result := TUIView(AHandle).Form;
end;

function TPlatformCocoa.CreateWindow(AForm: TCommonCustomForm): THandle;
var
  View: TUIView;
  Layer: CAEAGLLayer;
  R: CGRect;
begin
  if Application.MainForm = nil then
    R := CGRectMake(0, 0, mainWindow.mainView.bounds.size.Width, mainWindow.mainView.bounds.size.Height)
  else
  begin
    R := CGRectMake(AForm.Left, AForm.Top, AForm.Width, AForm.Height);
  end;
  if AForm is TForm3D then
  begin
    View := TUIView3D.alloc.initWithFrame(R);
    Layer := CAEAGLLayer(View.layer);
    Layer.SetOpaque(True);
    AForm.ContextHandle := THandle(Layer);
  end
  else
    View := TUIView2D.alloc.initWithFrame(R);
  View.Form := AForm;

  if Application.MainForm = nil then
    View.setAutoresizingMask(UIViewAutoresizingFlexibleLeftMargin or
      UIViewAutoresizingFlexibleWidth or
      UIViewAutoresizingFlexibleRightMargin or
      UIViewAutoresizingFlexibleTopMargin or
      UIViewAutoresizingFlexibleHeight or
      UIViewAutoresizingFlexibleBottomMargin);

  if AForm.Transparency then
    View.setOpaque(False)
  else
    View.setOpaque(True);

  mainWindow.mainView.AddSubView(View);

  Result := THandle(View);
  AForm.Handle := Result;

  View.setHidden(True);
end;

procedure TPlatformCocoa.DestroyWindow(AForm: TCommonCustomForm);
begin
  TUIView(AForm.Handle).removeFromSuperview;
  TUIView(AForm.Handle).release;
  AForm.Handle := 0;
end;

procedure TPlatformCocoa.ReleaseWindow(AForm: TCommonCustomForm);
begin
  TUIView(AForm.Handle).removeFromSuperview;
  AForm.Handle := 0;
end;

function TPlatformCocoa.GetWindowRect(AForm: TCommonCustomForm): TRectF;
begin
  if (AForm = Application.MainForm) or (Application.MainForm = nil) then
    with mainWindow.mainView.bounds do
      Result := RectF(origin.x, origin.y, origin.x + size.width, origin.y + size.height)
  else
    with TUIView(AForm.Handle).frame do
      Result := RectF(origin.x, origin.y, origin.x + size.width, origin.y + size.height);
end;

procedure TPlatformCocoa.SetWindowRect(AForm: TCommonCustomForm; ARect: TRectF);
begin
  if AForm.Handle <> 0 then
  begin
    if (AForm = Application.MainForm) or (Application.MainForm = nil) then
//      TUIView(AForm.Handle).setFrame(mainWindow.mainView.bounds)
    else
      TUIView(AForm.Handle).setFrame(CGRectMake(ARect.Left, ARect.Top, ARect.Right - ARect.Left, ARect.Bottom - ARect.Top))
  end;
end;

function TPlatformCocoa.GetClientSize(AForm: TCommonCustomForm): TPointF;
begin
  if (AForm = Application.MainForm) or (Application.MainForm = nil) then
    Result := TPointF(mainWindow.mainView.bounds.size)
  else
    Result := TPointF(TUIView(AForm.Handle).bounds.size);
end;

procedure TPlatformCocoa.SetClientSize(AForm: TCommonCustomForm; const ASize: TPointF);
begin
  if (AForm = Application.MainForm) or (Application.MainForm = nil) then
//    TUIView(AForm.Handle).setBounds(mainWindow.mainView.bounds)
  else
  begin
    AForm.SetBounds(AForm.Left, AForm.Top, Round(ASize.X), Round(ASize.Y));
  end;
end;

procedure TPlatformCocoa.DoUpdateTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  TForm(TTimer(Sender).TagObject).PaintRects([GetWindowRect(TForm(TTimer(Sender).TagObject))])
end;

procedure TPlatformCocoa.InvalidateWindowRect(AForm: TCommonCustomForm; R: TRectF);
begin
  if AForm is TForm3D then
  begin
    if TUIView3D(AForm.Handle).UpdateTimer = nil then
    begin
      TUIView3D(AForm.Handle).UpdateTimer := TTimer.Create(Self);
      TUIView3D(AForm.Handle).UpdateTimer.Interval := round(1000 / 30);
      TUIView3D(AForm.Handle).UpdateTimer.OnTimer := @DoUpdateTimer;
      TUIView3D(AForm.Handle).UpdateTimer.TagObject := AForm;
    end;
    TUIView3D(AForm.Handle).UpdateTimer.Enabled := True;
  end
  else
    TUIView(AForm.Handle).setNeedsDisplayInRect(CGRectMake(R.left, R.top, R.right - R.left, R.bottom - R.top));
end;

procedure TPlatformCocoa.SetWindowCaption(AForm: TCommonCustomForm; const ACaption: WideString);
begin
end;

procedure TPlatformCocoa.ReleaseCapture(AForm: TCommonCustomForm);
begin
end;

procedure TPlatformCocoa.SetCapture(AForm: TCommonCustomForm);
begin
end;

procedure TPlatformCocoa.HideWindow(AForm: TCommonCustomForm);
begin
  TUIView(AForm.Handle).setHidden(True);
end;

procedure TPlatformCocoa.ShowWindow(AForm: TCommonCustomForm);
begin
  TUIView(AForm.Handle).setHidden(False);
  mainWindow.mainView.bringSubviewToFront(TUIView(AForm.Handle));
end;

function TPlatformCocoa.ShowWindowModal(AForm: TCommonCustomForm): TModalResult;
var
  R: CGRect;
  BackView: UIView;
begin
  try
    R := CGRectMake(0, 0, mainWindow.mainView.bounds.size.Width, mainWindow.mainView.bounds.size.Height);
    BackView := UIView.alloc.initWithFrame(R);
    mainWindow.mainView.AddSubView(BackView);

    AForm.Show;
    AForm.ModalResult := mrNone;
    repeat
      if not Application.HandleMessage then
        Platform.WaitMessage;
      if Application.Terminated then
        AForm.ModalResult := mrCancel
      else if AForm.ModalResult <> mrNone then
        AForm.CloseModal;
    until AForm.ModalResult <> mrNone;
    AForm.Hide;
  finally
    BackView.removeFromSuperview;
    BackView.release;
  end;
  Result := AForm.ModalResult;
end;

function TPlatformCocoa.ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
begin
  Result := Point;
end;

function TPlatformCocoa.ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
begin
  Result := Point;
end;

{ Drag and Drop ===============================================================}

procedure TPlatformCocoa.BeginDragDrop(AForm: TCommonCustomForm;
  const Data: TDragObject; ABitmap: TBitmap);
begin
  GlobalDragging := True;
  GlobalDragObject := Data;
  GlobalDragBitmap := ABitmap;
  AForm.Invalidate;
end;

{ Clipboard ===============================================================}

procedure TPlatformCocoa.SetClipboard(Value: Variant);
begin
end;

function TPlatformCocoa.GetClipboard: Variant;
begin
end;

{ Cursor }

procedure TPlatformCocoa.SetCursor(AForm: TCommonCustomForm; const ACursor: TCursor);
begin
end;

{ Mouse  ===============================================================}

function TPlatformCocoa.GetMousePos: TPointF;
begin
  Result := PointF(0, 0);
end;

function TPlatformCocoa.GetScreenSize: TPointF;
begin
  Result := PointF(mainWindow.mainView.bounds.size.Width, mainWindow.mainView.bounds.size.Height);
end;

{ International ===============================================================}

function TPlatformCocoa.GetCurrentLangID: WideString;
begin
  Result := 'en'
end;

function TPlatformCocoa.GetLocaleFirstDayOfWeek: WideString;
var
  Cal: NSCalendar;
  FirstDay: Integer;
begin
  Cal:= NSCalendar.currentCalendar;
  FirstDay:= Cal.firstWeekday;
  Result:= IntToStr(FirstDay);
end;

{ Dialogs ===============================================================}

function TPlatformCocoa.DialogOpenFiles(var FileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: WideString;
      var AFilterIndex: Integer; var AFiles: TWideStrings; var AOptions: TOpenOptions): Boolean;
begin
  Result:=False;
end;

function TPlatformCocoa.DialogPrint(var ACollate, APrintToFile: Boolean;
  var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer;
  var APrintRange: TPrintRange; AOptions: TPrintDialogOptions): Boolean;
begin
  Result:=False;
end;

function TPlatformCocoa.DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF; var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
begin
  Result:=False;
end;

function TPlatformCocoa.DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: WideString;
      var AFilterIndex: Integer; var AFiles: TWideStrings; var AOptions: TOpenOptions): Boolean;
begin
  Result:=False;
end;

{ Keyboard }

function TPlatformCocoa.ShowVirtualKeyboard(AControl: TFmxObject): Boolean;
var
  VirtKBControl: IVirtualKeyboardControl;
begin
  if (AControl <> nil) and (AControl.Root <> nil) and (AControl.Root.GetObject is TCommonCustomForm) then
    FKeyboardView := TUIView(TCommonCustomForm(AControl.Root.GetObject).Handle)
  else
    FKeyboardView := TUIView(Application.MainForm.Handle);
  if (AControl <> nil) and Supports(AControl, IVirtualKeyboardControl, VirtKBControl) then
    TUIView(FKeyboardView).FKeyboardType := VirtKBControl.KeyboardType
  else
    TUIView(FKeyboardView).FKeyboardType := TVirtualKeyboardType.vktDefault;
  TUIView(FKeyboardView).unmarkText;
  TUIView(FKeyboardView).FText := NSSTR('');
  FKeyboardView.becomeFirstResponder;
  Result := True;
end;

function TPlatformCocoa.HideVirtualKeyboard: Boolean;
begin
  if FKeyboardView <> nil then
  begin
    FKeyboardView.resignFirstResponder;
    TUIView(FKeyboardView).FText := NSSTR('');
  end;
  FKeyboardView := nil;
  Result := True;
end;

{ Menus }

procedure TPlatformCocoa.StartMenuLoop(const AView: IMenuView); 
begin
end;

procedure TPlatformCocoa.CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer); 
begin
end;

procedure TPlatformCocoa.UpdateMenuItem(const AItem: TMenuItem); 
begin
end;

procedure TPlatformCocoa.ShortCutToKey(ShortCut: TShortCut; var Key: Word;
  var Shift: TShiftState);
begin
end;

function TPlatformCocoa.ShortCutToText(ShortCut: TShortCut): WideString;
begin
  Result:= '';
end;

initialization
  GlobalDisableFocusEffect := True;
finalization
end.
