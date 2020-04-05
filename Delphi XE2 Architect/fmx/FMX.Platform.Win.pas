{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Win;

{$I FMX.Defines.inc}

(*$HPPEMIT '#if defined(WIN32) && defined(CreateWindow)'*)
(*$HPPEMIT '  #define __SAVE_CREATEWINDOW CreateWindow'*)
(*$HPPEMIT '  #undef  CreateWindow'*)
(*$HPPEMIT '#endif'*)

(*$HPPEMIT END '#if defined(__SAVE_CREATEWINDOW)'*)
(*$HPPEMIT END '  #define CreateWindow __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '  #undef  __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '#endif'*)

(*$HPPEMIT '#define NO_USING_NAMESPACE_FMX.PLATFORM_WIN' *)

interface

uses
  Winapi.Windows, FMX.Forms, FMX.Platform, FMX.Types;

function ActualPlatformClass: TPlatformClass;
function FindWindow(Handle: HWND): TCommonCustomForm;
function FmxHandleToHWND(FmxHandle: TFmxHandle): HWND;

implementation

{$R *.res}

uses
  Winapi.CommDlg, Winapi.Messages, Winapi.ActiveX, Winapi.ShlObj,
  Winapi.MMSystem, Winapi.ShellAPI, Winapi.MultiMon, Winapi.Imm,
  System.Types, System.Variants, System.SysUtils, System.Classes,
  System.UITypes, System.Math, System.StrUtils, System.SyncObjs,
  FMX.Consts, FMX.Menus, FMX.Dialogs, FMX.Printer, FMX.Printer.Win,
  FMX.Canvas.D2D, System.Generics.Collections;

type

  TOpenMenuItem = class(TMenuItem);
  TOpenCustomForm = class(TCommonCustomForm);

  MySTGMEDIUM = record // for compatibility
    Tymed: DWORD;
    Case Integer Of
      0:
        (HBITMAP: HBITMAP; UnkForRelease: Pointer { IUnknown } );
      1:
        (HMETAFILEPICT: THandle);
      2:
        (HENHMETAFILE: THandle);
      3:
        (HGLOBAL: HGLOBAL);
      4:
        (lpszFileName: POleStr);
      5:
        (stm: Pointer { IStream } );
      6:
        (stg: Pointer { IStorage } );
  end;

{ TDropTarget }

  TDropTarget = class(TComponent, IDropTarget)
  private
    Form: TCommonCustomForm;
    function GetDataObject: TDragObject;
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    function DragOver(grfKeyState: Longint; pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
  end;

{ TDropSource }

  TDataObjectInfo = record
    FormatEtc: TFormatEtc;
    StgMedium: TStgMedium;
    OwnedByDataObject: Boolean;
  end;

  TDataObjectInfoArray = array of TDataObjectInfo;

  TDropSource = class(TComponent, IDataObject, IDropSource)
  private
    Data: TDragObject;
    Formats: TDataObjectInfoArray;
    { IDropSource }
    function QueryContinueDrag(fEscapePressed: bool; grfKeyState: Longint): HResult; stdcall;
    function GiveFeedback(dwEffect: Longint): HResult; stdcall;
    { IDataObject }
    function GetData(const FormatEtcIn: TFormatEtc; out Medium: TStgMedium): HResult; stdcall;
    function GetDataHere(const FormatEtc: TFormatEtc; out Medium: TStgMedium): HResult; stdcall;
    function QueryGetData(const FormatEtc: TFormatEtc): HResult; stdcall;
    function GetCanonicalFormatEtc(const FormatEtc: TFormatEtc; out FormatEtcout: TFormatEtc): HResult; stdcall;
    function SetData(const FormatEtc: TFormatEtc; var Medium: TStgMedium; fRelease: Bool): HRESULT; stdcall;
    function EnumFormatEtc(dwDirection: Longint; out EnumFormatEtc: IEnumFormatEtc): HResult; stdcall;
    function dAdvise(const FormatEtc: TFormatEtc; advf: Longint; const advsink: IAdviseSink;
      out dwConnection: Longint): HResult; stdcall;
    function dUnadvise(dwConnection: Longint): HResult; stdcall;
    function EnumdAdvise(out EnumAdvise: IEnumStatData): HResult; stdcall;
    { For IDropSourceHelper }
    function FindFormatEtc(TestFormatEtc: TFormatEtc): Integer;
    function EqualFormatEtc(FormatEtc1, FormatEtc2: TFormatEtc): Boolean;
    function HGlobalClone(HGLOBAL: THandle): THandle;
    function RetrieveOwnedStgMedium(Format: TFormatEtc; var StgMedium: TStgMedium): HResult;
    function StgMediumIncRef(const InStgMedium: TStgMedium; var OutStgMedium: TStgMedium;
      CopyInMedium: Boolean): HResult;
    function CanonicalIUnknown(const TestUnknown: IUnknown): IUnknown;
  end;

type
  TWin32Timerinfo = record
    TimerID: UINT;           // the Windows timer ID for this timer
    TimerHandle: TFmxHandle; // the unique FMX Handle for this timer
    TimerFunc: TTimerProc;   // owner function to handle timer
  end;

{ TPlatformWin }

  TPlatformWin = class(TPlatform)
  private
    FHandleCounter: TFmxHandle;
    FHWndMap: TDictionary<TFmxHandle, HWND>;
    FNoStaysOpenList: TList<TCommonCustomForm>;
    FTimerData: TList<TWin32TimerInfo>;
    FDiableUpdateState: Boolean;
    function NewFmxHandle: TFmxHandle;
    procedure ValidateHandle(FmxHandle: TFmxHandle);
    function HandleToHWND(FmxHandle: TFmxHandle): HWND;
    function AllocWndHandle(Wnd: HWND): TFmxHandle;
    procedure DeleteWndHandle(FmxHandle: TFmxHandle);
    function AllocTimerHandle(Wnd: HWND): TFmxHandle;
    procedure DeleteTimerHandle(FmxHandle: TFmxHandle);
    procedure UpdateLayer(AForm: TCommonCustomForm);
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
    function GetTick: Single; override;
    { Window }
    function CreateWindow(AForm: TCommonCustomForm): TFmxHandle; override;
    procedure DestroyWindow(AForm: TCommonCustomForm); override;
    procedure ReleaseWindow(AForm: TCommonCustomForm); override;
    procedure SetWindowState(AForm: TCommonCustomForm; const AState: TWindowState); override;
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
    procedure ReleaseCapture(AForm: TCommonCustomForm); override;
    function ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    function ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF; override;
    { Menus }
    procedure StartMenuLoop(const AView: IMenuView); override;
    function ShortCutToText(ShortCut: TShortCut): string; override;
    procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState); override;
    function TextToShortCut(Text: string):integer; override;
    procedure CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer); override;
    procedure UpdateMenuItem(const AItem: TMenuItem); override;
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
    function GetCurrentLangID: string; override;
    function GetLocaleFirstDayOfWeek: string; override;
    { Dialogs }
    function DialogOpenFiles(var FileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; override;
    function DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean; override;
    function PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
      AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; override;
    function DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF;
      var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean; override;
    function DialogSaveFiles(var AFileName: TFileName; const AInitDir, ADefaultExt, AFilter, ATitle: string;
      var AFilterIndex: Integer; var AFiles: TStrings; var AOptions: TOpenOptions): Boolean; override;
    function DialogPrinterSetup: Boolean; override;
    { Text Service }
    function GetTextServiceClass: TTextServiceClass; override;
  end;

const
  WM_ADDUPDATERECT = WM_USER + 123;
  WM_RELEASEFORM = WM_USER + 125;

var
  WindowAtom: TAtom;
  WindowAtomString: string;
  DropAtom: TAtom;
  DropAtomString: string;
  CF_OBJECT: Longint;

function ActualPlatformClass: TPlatformClass;
begin
  Result := TPlatformWin;
end;

function HBmpFromBitmap(Bitmap: TBitmap): THandle;
var
  BitmapInfo: TBitmapInfo;
  BitmapHandle: cardinal;
  BitmapBits: Pointer;
begin
  FillChar(BitmapInfo, SizeOf(BitmapInfo), 0);
  with BitmapInfo.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biPlanes := 1;
    biBitCount := 32;
    biCompression := BI_RGB;
    biWidth := Bitmap.Width;
    if biWidth <= 0 then
      biWidth := 1;
    biHeight := -Bitmap.Height;
    if biHeight >= 0 then
      biHeight := -1;
  end;
  Result := CreateDIBSection(0, BitmapInfo, DIB_RGB_COLORS, Pointer(BitmapBits), 0, 0);
  if BitmapBits <> nil then
    Move(Bitmap.StartLine^, BitmapBits^, Bitmap.Width * Bitmap.Height * 4);
end;

function FindTopMostWindow(ActiveWindow: HWnd): HWnd; forward;

{ TPlatformWin }

constructor TPlatformWin.Create;
begin
  inherited;
  WindowAtomString := Format('FIREMONKEY%.8X', [GetCurrentProcessID]);
  WindowAtom := GlobalAddAtomW(PChar(WindowAtomString));
  DropAtomString := Format('FIREMONKEYDROP%.8X', [GetCurrentProcessID]);
  DropAtom := GlobalAddAtomW(PChar(DropAtomString));
  CF_OBJECT := RegisterClipBoardFormatW(PChar('WindowAtomString'));
  FNoStaysOpenList := TList<TCommonCustomForm>.Create;
  FTimerData := TList<TWin32TimerInfo>.Create;
  FHwndMap := TDictionary<TFmxHandle, HWND>.Create;
  FHandleCounter := 128; // Start counting handles at 128. All valid handles have lower nibble = 0;
  Application := TApplication.Create(nil);
end;

procedure TPlatformWin.DeleteTimerHandle(FmxHandle: TFmxHandle);
begin

end;

procedure TPlatformWin.DeleteWndHandle(FmxHandle: TFmxHandle);
begin

end;

destructor TPlatformWin.Destroy;
begin
  FreeAndNil(Application);
  FHwndMap.Free;
  FTimerData.Free;
  FNoStaysOpenList.Free;
  inherited;
end;

{ App }

procedure TPlatformWin.Run;
begin
  { checking for canvas }
  if GlobalUseDirect2D then
    SetD2DDefault;

  Application.RealCreateForms;
  repeat
    try
      Application.HandleMessage;
    except
      Application.HandleException(Self);
    end;
  until Application.Terminated;
end;

procedure TPlatformWin.Terminate;
begin
  PostQuitMessage(0);
end;

function TPlatformWin.HandleMessage: Boolean;
var
  Msg: TMsg;
begin
  Result := False;
  if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
  begin
    Result := True;
    if Msg.Message <> WM_QUIT then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end
    else
      Application.Terminated := True;
  end;
end;

function TPlatformWin.HandleToHWND(FmxHandle: TFmxHandle): HWND;
begin
  TMonitor.Enter(FHWndMap);
  try
    ValidateHandle(FmxHandle);
    if FHWndMap.ContainsKey(FmxHandle) then
      Result := FHWndMap[FmxHandle]
    else
  finally
    TMonitor.Exit(FHWndMap);
  end;
end;

procedure TPlatformWin.WaitMessage;
begin
  Winapi.Windows.WaitMessage;
end;

{ Timer }

procedure TimerCallBackProc(window_hwnd: hwnd; Msg: Longint; idEvent: UINT; dwTime: Longint); stdcall;
var
  PlatformWin: TPlatformWin;
  Index: Integer;
begin
  try
    PlatformWin := Platform as TPlatformWin;
    Index := PlatformWin.FTimerData.Count;
    while (Index > 0) do
    begin
      Dec(Index);
      with PlatformWin.FTimerData[Index] do
        if TimerID = idEvent then
        begin
          TimerFunc;
          Break;
        end;
    end;
  except
    on EInvalidCast do
      // An invalid cast is a silent error, others are not.
    else
      raise;
  end;
end;

function TPlatformWin.CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle;
var
  TimerInfo: TWin32TimerInfo;
begin
  Result := 0;
  if (Interval > 0) and (Assigned(TimerFunc)) then
  begin
    TimerInfo.TimerFunc := TimerFunc;
    TimerInfo.TimerID := Winapi.Windows.SetTimer(0, 0, Interval, @TimerCallBackProc);
    if TimerInfo.TimerID <> 0 then
    begin
      TimerInfo.TimerHandle := NewFmxHandle;
      FTimerData.Add(TimerInfo);
      Result := TimerInfo.TimerHandle;
    end;
  end;
end;

function TPlatformWin.DestroyTimer(Timer: TFmxHandle): Boolean;
var
  Index: Integer;
  TimerInfo: TWin32TimerInfo;
begin
  ValidateHandle(Timer);
  Result := False;
  Index := FTimerData.Count;
  while (Index > 0) do
  begin
    Dec(Index);
    with FTimerData[Index] do
      if TimerHandle = Timer then
      begin
        Result := Winapi.Windows.KillTimer(0, TimerID);
        FTimerData.Delete(Index);
      end;
  end;
end;

function TPlatformWin.GetTick: Single;
begin
  Result := timeGetTime / 1000;
end;

{ Text Service }

// Missing API.
function ImmAssociateContextEx(hWnd: HWND; hImc: HIMC; dwFlag: DWORD): HIMC; stdcall;
  external imm32 name 'ImmAssociateContextEx' delayed;

const
  IACE_CHILDREN        = $0001;
  IACE_DEFAULT         = $0010;
  IACE_IGNORENOCONTEXT = $0020;

type
  TTextServiceWin = class(TTextService)
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
    CompAttrBuf: Array of Byte;
    ImmCompCursorPos: Integer;
    CompClauseBuf: Array of DWORD;

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

    procedure DrawSingleLine2( Canvas: TCanvas; const S: string;
      const ARect: TRectF; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter ); override;

    function HasMarkedText: boolean; override;

    function GetImeMode: TImeMode; override;
    procedure SetImeMode(const Value: TImeMode); override;

    { Windows }
    constructor Create(const Owner: TControl; SupportMultiLine: Boolean); override;
    destructor Destroy; override;

  end;

{ Text Service }

constructor TTextServiceWin.Create(const Owner: TControl; SupportMultiLine: Boolean);
begin
  inherited;
end;

destructor TTextServiceWin.Destroy;
begin
  inherited;
end;


function TTextServiceWin.GetText: string;
begin
  Result := FText;
end;

procedure TTextServiceWin.SetText(const Value: string);
begin
  FText := Value;
end;

function TTextServiceWin.GetCaretPostion: TPoint;
begin
  Result := FCaretPostion;
end;

procedure TTextServiceWin.SetCaretPostion(const Value: TPoint);
begin
  FCaretPostion := Value;
end;

procedure TTextServiceWin.InternalSetMarkedText( const AMarkedText: string );
begin
  FMarkedText := AMarkedText;
  // Need update.
  (FOwner as ITextServiceControl).UpdateCaretPoint;
end;

function TTextServiceWin.InternalGetMarkedText: string;
begin
  Result := FMarkedText;
end;

function TTextServiceWin.CombinedText: string;
begin
  if FMarkedText <> '' then
    Result := Copy(FText, 1, FCaretPostion.X) + FMarkedText + Copy(FText, FCaretPostion.X + 1, MaxInt)
  else
    Result := FText;
end;

function TTextServiceWin.TargetClausePosition: TPoint;
begin
  Result := FCaretPostion;
  Result.X := Result.X + ImmCompCursorPos;
end;

procedure TTextServiceWin.EnterControl(const FormHandle: TFmxHandle);
var
  wHandle: HWND;
  CForm: TCompositionForm;
  H : HIMC;
begin
  wHandle := FmxHandleToHWND(FormHandle);
  ImmAssociateContextEx(wHandle, 0, IACE_DEFAULT);
  H := ImmGetContext(wHandle);
  if H <> 0 then
  begin
    with CForm do
    begin
      dwStyle := CFS_POINT;
      ptCurrentPos := (FOwner as ITextServiceControl).GetTargetClausePointF.Round;
    end;
    ImmSetCompositionWindow(H, @CForm);
  end;
end;

procedure TTextServiceWin.ExitControl(const FormHandle: TFmxHandle);
begin
  ImmAssociateContextEx(FmxHandleToHWND(FormHandle), 0, IACE_IGNORENOCONTEXT);
end;

procedure TTextServiceWin.DrawSingleLine( Canvas: TCanvas;
      const ARect: TRectF; const FirstVisibleChar: integer; const Font: TFont;
      const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign;
      const AVTextAlign: TTextAlign = TTextAlign.taCenter );

  function _TextWidth(const Str: string): Single;
  var
    R: TRectF;
  begin
    R := TRectF.Create(0, 0, 0, 0);
    GetMeasureBitmap.Canvas.Font.Assign(Font);
    GetMeasureBitmap.Canvas.MeasureText(R, Str, False,
      Flags, TTextAlign.taLeading, TTextAlign.taCenter);
    Result := RectWidth(R);
  end;

var
  i: Integer;
  MarkedLineBottom: Single;
  S: String;
begin
  S := CombinedText;
  Canvas.FillText(ARect, Copy(S, FirstVisibleChar, Length(S) - FirstVisibleChar + 1), False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 2;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  try
    MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
    for I := 1 to Length(FMarkedText) do
    begin
      case CompAttrBuf[I-1] of
        ATTR_INPUT:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdDash
        end;
        ATTR_TARGET_CONVERTED:	
        begin
          Canvas.StrokeThickness := 2;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_CONVERTED:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_TARGET_NOTCONVERTED:
        begin
          Canvas.StrokeThickness := 4;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_INPUT_ERROR:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdDot
        end;
      end;

      Canvas.DrawLine(
        PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + I-1)) - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
               MarkedLineBottom),
        PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + I))   - _TextWidth(Copy(S, 1, FirstVisibleChar-1)),
               MarkedLineBottom),
        AOpacity);
    end;
  finally
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
end;

procedure TTextServiceWin.DrawSingleLine2( Canvas: TCanvas; const S: string;
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
    GetMeasureBitmap.Canvas.MeasureText(R, Str, False,
      Flags, TTextAlign.taLeading, TTextAlign.taCenter);
    Result := RectWidth(R);
  end;

var
  i: Integer;
  MarkedLineBottom: Single;
//  S: String;
begin
{$IFDEF __LOG}
writeln('*TTextServiceWin.DrawSingleLine -- enter');
writeln('');
writeln('             Text:', Text);
writeln('      FMarkedText:', FMarkedText);
writeln('    CaretPosition:', CaretPosition.X, '/', CaretPosition.Y);
{$ENDIF __LOG}
//  S := Copy(Text, 1, CaretPosition.X) + FMarkedText + Copy(Text, CaretPosition.X+1,  MaxInt);
{$IFDEF __LOG}
writeln(' S:', S);
{$ENDIF __LOG}
  Canvas.FillText(ARect, S, False,
    AOpacity, Flags, ATextAlign, AVTextAlign);

  Canvas.Stroke.Assign(Canvas.Fill);
  Canvas.StrokeThickness := 2;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  try
    MarkedLineBottom := ARect.Top + (ARect.Height / 2) + Font.Size / 2;
    for I := 1 to Length(FMarkedText) do
    begin
      case CompAttrBuf[I-1] of
        ATTR_INPUT:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdDash
        end;
        ATTR_TARGET_CONVERTED:	
        begin
          Canvas.StrokeThickness := 2;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_CONVERTED:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_TARGET_NOTCONVERTED:	
        begin
          Canvas.StrokeThickness := 4;
          Canvas.StrokeDash := TStrokeDash.sdSolid;
        end;
        ATTR_INPUT_ERROR:	
        begin
          Canvas.StrokeThickness := 1;
          Canvas.StrokeDash := TStrokeDash.sdDot
        end;
      end;

      Canvas.DrawLine(
        PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + I-1)), MarkedLineBottom),
        PointF(ARect.Left + _TextWidth(Copy(S, 1, CaretPosition.X + I)),   MarkedLineBottom),
        AOpacity);
    end;
  finally
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
{$IFDEF __LOG}
writeln('*TTextServiceWin.DrawSingleLine -- exit');
{$ENDIF __LOG}
end;

function TTextServiceWin.HasMarkedText: boolean;
begin
  Result := FMarkedText <> '';
end;

function TTextServiceWin.GetImeMode: TImeMode;
begin
  Result := FImeMode;
end;

procedure TTextServiceWin.SetImeMode(const Value: TImeMode);
begin
  FImeMode := Value;
end;

function TPlatformWin.GetTextServiceClass: TTextServiceClass;
begin
  Result := TTextServiceWin;
end;

{ Window }

type
  PRgnRects = ^TRgnRects;
  TRgnRects = array [0 .. 0] of TRect;

function FindWindow(Handle: HWND): TCommonCustomForm;
begin
  Result := nil;
  if (Handle <> 0) then
  begin
    if GlobalFindAtomW(PChar(WindowAtomString)) = WindowAtom then
      Result := Pointer(GetProp(Handle, MakeIntAtom(WindowAtom)))
    else
      Result := nil;
  end;
end;

function FmxHandleToHWND(FmxHandle: TFmxHandle): HWND;
begin
  Result := (Platform as TPlatformWin).HandleToHWND(FmxHandle);
end;

function FindDropTarget(Handle: HWND): TDropTarget;
begin
  Result := nil;
  if (Handle <> 0) then
  begin
    if GlobalFindAtomW(PChar(DropAtomString)) = DropAtom then
      Result := Pointer(GetProp(Handle, MakeIntAtom(DropAtom)))
    else
      Result := nil;
  end;
end;

function KeysToShiftState(Keys: Word): TShiftState;
begin
  Result := [];
  if Keys and MK_SHIFT <> 0 then
    Include(Result, ssShift);
  if Keys and MK_CONTROL <> 0 then
    Include(Result, ssCtrl);
  if Keys and MK_LBUTTON <> 0 then
    Include(Result, ssLeft);
  if Keys and MK_RBUTTON <> 0 then
    Include(Result, ssRight);
  if Keys and MK_MBUTTON <> 0 then
    Include(Result, ssMiddle);
  if GetKeyState(VK_MENU) < 0 then
    Include(Result, ssAlt);
end;

function KeyDataToShiftState(KeyData: Longint): TShiftState;
const
  AltMask = $20000000;
{$IFDEF LINUX}
  CtrlMask = $10000000;
  ShiftMask = $08000000;
{$ENDIF}
begin
  Result := [];
  if GetKeyState(VK_SHIFT) < 0 then
    Include(Result, ssShift);
  if GetKeyState(VK_CONTROL) < 0 then
    Include(Result, ssCtrl);
  if KeyData and AltMask <> 0 then
    Include(Result, ssAlt);
{$IFDEF LINUX}
  if KeyData and CtrlMask <> 0 then
    Include(Result, ssCtrl);
  if KeyData and ShiftMask <> 0 then
    Include(Result, ssShift);
{$ENDIF}
end;

function WMPaint(hwnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  i, rgnStatus: Integer;
  Region: HRgn;
  RegionSize: Integer;
  RegionData: PRgnData;
  R: TRect;
  LForm: TCommonCustomForm;
  UpdateRects: array of TRectF;
  PS: TPaintStruct;
  PlatformWin: TPlatformWin;
  Wnd: Winapi.Windows.HWND;
begin
  LForm := FindWindow(hwnd);
  if LForm <> nil then
  begin
    PlatformWin := Platform as TPlatformWin;
    Wnd := PlatformWin.HandleToHWND(LForm.Handle);
    Region := CreateRectRgn(0, 0, 1, 1);
    if Region <> 0 then
    try
      rgnStatus := GetUpdateRgn(Wnd, Region, False);
      if (rgnStatus = 2) or (rgnStatus = 3) then
      begin
        RegionSize := GetRegionData(Region, $FFFF, nil);
        if RegionSize > 0 then
        begin
          GetMem(RegionData, RegionSize);
          try
            RegionSize := GetRegionData(Region, RegionSize, RegionData);
            if RegionSize = RegionSize then
            begin
              SetLength(UpdateRects, RegionData.rdh.nCount);
              for i := 0 to RegionData.rdh.nCount - 1 do
              begin
                R := PRgnRects(@RegionData.buffer[0])[i];
                with R do
                  UpdateRects[i] := RectF(Left, Top, Right, Bottom);
              end;
            end;
          finally
            FreeMem(RegionData, RegionSize);
          end;

          LForm.ContextHandle := BeginPaint(Wnd, PS);
          try
            LForm.PaintRects(UpdateRects);                                                                     
            LForm.ContextHandle := 0;
          finally
            EndPaint(Wnd, PS);
          end;
        end;
      end;
    finally
      DeleteObject(Region);
    end;
  end;
  Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
end;

procedure AssignToLogFont(var LogFont: TLogFont; Font: TFont);
var
  ppi: Integer;
begin
  FillChar(LogFont, SizeOf(LogFont), 0);
  with LogFont do
  begin
    ppi := 96;
    lfHeight := -MulDiv(trunc(Font.size), ppi, 72);
    if (TFontStyle.fsBold in Font.Style) then
      lfWeight := FW_BOLD
    else
      lfWeight := FW_NORMAL;
    lfItalic := BYTE(TFontStyle.fsItalic in Font.Style);
    lfUnderline := 0;
    lfStrikeOut := 0;
    StrPCopy(lfFaceName, Font.Family);
    lfQuality := DEFAULT_QUALITY;
    lfOutPrecision := OUT_DEFAULT_PRECIS;
    lfClipPrecision := CLIP_DEFAULT_PRECIS;
    lfPitchAndFamily := DEFAULT_PITCH;
  end;
end;

function WMImeStartComposition(hWnd: HWND; uMsg: UINT; wParam: wParam; lParam: lParam): LRESULT;
var
  IMC: HIMC;
  IWR: TRectF;
  Font: TFont;
  LogFont: TLogFont;
  CF: TCompositionForm;
begin
  Result := DefWindowProc(hWnd, uMsg, wParam, lParam);
end;

function WMImeComposition(AForm: TCommonCustomForm; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
var
  I: Integer;
  IMC: HIMC;
  S: String;
//   AttrBuf: Array of Byte;
//   CursorPos: Integer;
//   ClauseBuf: Array of DWORD;
  Size: Integer;
  Key: Word;
  Ch: WideChar;
  Wnd: HWND;
  PlatformWin: TPlatformWin;
  TSObj: ITextServiceControl;
  TS: TTextServiceWin;
begin
  PlatformWin := Platform as TPlatformWin;
  Wnd := PlatformWin.HandleToHWND(AForm.Handle);
  Result := 0;

  if (lParam and GCS_RESULTSTR) <> 0 then
  begin
    IMC := ImmGetContext(Wnd);
    if IMC <> 0 then
    begin
      try
        if (AForm.Focused <> nil) and Supports(AForm.Focused, ITextServiceControl, TSObj) then
          TTextServiceWin(TSObj.GetTextService).InternalSetMarkedText('');
        Size := ImmGetCompositionString(IMC, GCS_RESULTSTR, nil, 0);
        SetLength(S, Size div sizeof(Char));
        ImmGetCompositionString(IMC, GCS_RESULTSTR, PChar(S), Size);
      finally
        ImmReleaseContext(Wnd, IMC);
      end;
      for I := 1 to Length(S) do
      begin
        Key := 0;
        Ch := S[I];
        AForm.KeyDown(Key, Ch, []);
        AForm.KeyUp(Key, Ch, []);
      end;
    end;
    Result := 0;
    if (GetKeyboardLayout(0) and $FFFF) = $0412 then // Special support for Korean IME
      PostMessage(Wnd, WM_IME_STARTCOMPOSITION, 0, 0);
  end
  else
  if (lParam and GCS_COMPSTR) <> 0 then
  begin
    IMC := ImmGetContext(Wnd);
    if IMC <> 0 then
    begin
      try
        if (AForm.Focused <> nil) and Supports(AForm.Focused, ITextServiceControl, TSObj) then
        begin
          TS := TTextServiceWin(TSObj.GetTextService);
//          TTextServiceWin(IMEObj.GetTextService).InternalSetMarkedText(S);

          Size := ImmGetCompositionString(IMC, GCS_COMPSTR, nil, 0);
          SetLength(S, Size div sizeof(Char));
          ImmGetCompositionString(IMC, GCS_COMPSTR, PChar(S), Size);
          TS.InternalSetMarkedText(S);

          if (lParam and GCS_COMPATTR) <> 0 then
          begin
            Size := ImmGetCompositionString(IMC, GCS_COMPATTR, nil, 0);
            SetLength(TS.CompAttrBuf, Size);
            ImmGetCompositionString(IMC, GCS_COMPATTR, @(TS.CompAttrBuf[0]), Size);
          end;

          if (lParam and GCS_CURSORPOS) <> 0 then
            TS.ImmCompCursorPos := ImmGetCompositionString(IMC, GCS_CURSORPOS, nil, 0);

          if (lParam and GCS_COMPCLAUSE) <> 0 then
          begin
            Size := ImmGetCompositionString(IMC, GCS_COMPCLAUSE, nil, 0);
            SetLength(TS.CompClauseBuf, Size div sizeof(DWORD));
            ImmGetCompositionString(IMC, GCS_COMPCLAUSE, @(TS.CompClauseBuf[0]), Size);
          end;
        end;
      finally
        ImmReleaseContext(Wnd, IMC);
      end;
    end;
    Result := 0;
  end
  else
    Result := DefWindowProc(Wnd, uMsg, wParam, lParam);
end;

function SetIMEWndPosition(AForm: TCommonCustomForm; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
var
  IMC: HIMC;
  Wnd: HWND;
  PlatformWin: TPlatformWin;
  Candidate: TCandidateForm;
  TargetClausePoint: TPointF;
  TSObj: ITextServiceControl;
  TS: TTextServiceWin;
begin
  PlatformWin := Platform as TPlatformWin;
  Wnd := PlatformWin.HandleToHWND(AForm.Handle);

  IMC := ImmGetContext(Wnd);
  if IMC <> 0 then
  begin
    try
      if (AForm.Focused <> nil) and Supports(AForm.Focused, ITextServiceControl, TSObj) then
      begin
        TS := TTextServiceWin(TSObj.GetTextService);
        TargetClausePoint := TSObj.GetTargetClausePointF; // Return Composition caret point that is relative to parent form.
        Candidate.dwIndex := 0;
//          Candidate.dwStyle := CFS_FORCE_POSITION;
        Candidate.dwStyle := CFS_POINT;

//          CaretPoint.X := CaretPoint.X + Round(((AForm as IRoot).Focused.GetObject as TStyledControl).Position.X);
//          CaretPoint.Y := CaretPoint.Y + Round(((AForm as IRoot).Focused.GetObject as TStyledControl).Position.Y);
        Candidate.ptCurrentPos := TargetClausePoint.Round;

        ImmSetCandidateWindow(IMC, @Candidate);

      end;
    finally
      ImmReleaseContext(Wnd, IMC);
    end;
  end;
end;

function WMImeNotify(AForm: TCommonCustomForm; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
begin
  if wParam = IMN_OPENCANDIDATE then
  begin
    Result := SetIMEWndPosition(AForm, uMsg, wParam, lParam);
  end;
end;

type
  PDestroyChildData = ^TDestroyChildData;
  TDestroyChildData = record
    Parent: HWND;
    Recreating: Boolean;
  end;

var
  LastKeyIsDeadKey : Boolean = False;

function WndProc(hwnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  UpdateRects: array of TRectF;
  LForm: TCommonCustomForm;
  PlatformWin: TPlatformWin;
  Wnd: Winapi.Windows.HWND;
  ToCloseList: TList<TCommonCustomForm>;

  procedure ProcessUpdateMessages;
  var
    Msg: TMsg;
  begin
    SetLength(UpdateRects, 1);
    UpdateRects[0] := RectF(TSmallPoint(cardinal(wParam)).X, TSmallPoint(cardinal(wParam)).Y,
      TSmallPoint(cardinal(lParam)).X, TSmallPoint(cardinal(lParam)).Y);
    while PeekMessage(Msg, hwnd, WM_ADDUPDATERECT, WM_ADDUPDATERECT, PM_REMOVE) do
    begin
      if Msg.Message = WM_QUIT then
      begin
        { Repost WM_QUIT messages }
        PostQuitMessage(Msg.wParam);
        break;
      end;
      SetLength(UpdateRects, Length(UpdateRects) + 1);
      UpdateRects[High(UpdateRects)] := RectF(TSmallPoint(cardinal(Msg.wParam)).X, TSmallPoint(cardinal(Msg.wParam)).Y,
        TSmallPoint(cardinal(Msg.lParam)).X, TSmallPoint(cardinal(Msg.lParam)).Y);
    end;
  end;

  procedure CloseNoStaysOpen;
  begin
    if LForm.StaysOpen then
      with PlatformWin do
        if FNoStaysOpenList.Count > 0 then
          while FNoStaysOpenList.Count > 0 do
            FNoStaysOpenList[FNoStaysOpenList.Count - 1].Close;
  end;

  procedure CloseNoStaysOpen1;
  var
    I: Integer;
  begin
    if LForm.StaysOpen then
      ToCloseList := TList<TCommonCustomForm>.Create(PlatformWin.FNoStaysOpenList)
    else
      ToCloseList := nil;
  end;

  procedure CloseNoStaysOpen2;
  var
    I: Integer;
  begin
    if ToCloseList <> nil then begin
      for I := ToCloseList.Count - 1 downto 0 do
          ToCloseList[I].Close;
      ToCloseList.Free;
    end
  end;

  function DispatchMouseWheelToPopups : Boolean;
  var
    I: Integer;
    Handled: Boolean;
  begin
    Handled := False;
    if LForm.StaysOpen then
      with PlatformWin do
        if FNoStaysOpenList.Count > 0 then
          for I := FNoStaysOpenList.Count - 1 downto 0 do
          begin
            FNoStaysOpenList[I].MouseWheel(KeysToShiftState(wParam),
                                            TSmallPoint(cardinal(wParam)).Y,
                                            Handled);
            if Handled then break;
          end;

    Result := Handled;
  end;

var
  PS: TPaintStruct;
  R: TRect;
  P: TPoint;
  H: Boolean;
  key: Word;
  ch: WideChar;
  tme: TTRACKMOUSEEVENT;
  tMsg: TMessage;
  Placement: TWindowPlacement;
  TSObj: ITextServiceControl;
  Msg: tagMsg;
begin
                                                                       
  Result := 0;
  LForm := FindWindow(hwnd);

  // Check to see if this is a design message
  if (LForm <> nil) and (LForm.Designer <> nil) then
  begin
    tMsg.Msg := uMsg;
    tMsg.WParam := wParam;
    tMsg.LParam := lParam;
    tMsg.Result := 0;
    if LForm.Designer.IsDesignMsg(LForm, tMsg) then Exit;
  end;

  if (LForm <> nil) then
  begin
    PlatformWin := Platform as TPlatformWin;
    Wnd := PlatformWin.HandleToHWND(LForm.Handle);
    try
      case uMsg of
        $B000 + 74: // CM_DESTROYHANDLE
          begin
            if (LForm.ClassName = 'TFormContainerForm') and (wParam = 1) then
            begin
              // IDE parent recreate
              SetParent(Wnd, GetDesktopWindow);
              SetWindowPos(Wnd, 0, $A000, $A000, 10, 10, SWP_NOSIZE or SWP_NOZORDER);
            end;
          end;
        WM_DESTROY:
          begin
            Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
          end;
        WM_ACTIVATE:
          begin
            if not(TFmxFormState.fsRecreating in LForm.FormState) then
            begin
              if wParam > 0 then
              begin
                ImmAssociateContextEx(hWnd, 0, IACE_IGNORENOCONTEXT);
                LForm.Activate;
                SetIMEWndPosition(LForm, uMsg, wParam, lParam);
              end
              else
              begin
                LForm.Deactivate;
                CloseNoStaysOpen;
              end;
            end;
            Result := 0;
          end;
        WM_MOUSEACTIVATE:
          begin
            if not(TFmxFormState.fsRecreating in LForm.FormState) then
            begin
              if not LForm.ShowActivated then
                Result := MA_NOACTIVATE
              else
                Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
              // Default result if nothing happens
            end;
          end;
        WM_ERASEBKGND:
          begin
            Result := 1;
          end;
        WM_PAINT:
          begin
            Result := WMPaint(hwnd, uMsg, wParam, lParam);
          end;
        WM_ADDUPDATERECT:
          begin
            ProcessUpdateMessages;
            LForm.PaintRects(UpdateRects);
            PlatformWin.UpdateLayer(LForm);
          end;
        WM_WINDOWPOSCHANGING:
          begin
            if ([csLoading, csDesigning] * LForm.ComponentState = [csLoading]) then
            begin
              if (LForm.Position in [TFormPosition.poDefault, TFormPosition.poDefaultPosOnly]) and
			    (LForm.WindowState <> TWindowState.wsMaximized) then
              begin
                with PWindowPos(lParam)^ do
                  flags := flags or SWP_NOMOVE;
              end;
              if (LForm.Position in [TFormPosition.poDefault, TFormPosition.poDefaultSizeOnly]) and
			    (LForm.BorderStyle in [TFmxFormBorderStyle.bsSizeable, TFmxFormBorderStyle.bsSizeToolWin]) then
              begin
                with PWindowPos(lParam)^ do
                  flags := flags or SWP_NOSIZE;
              end;
            end;
            CloseNoStaysOpen;
            Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
          end;
        WM_WINDOWPOSCHANGED:
          begin
            Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
            if (PWindowPos(lParam)^.flags and SWP_NOSIZE = 0) or
               (PWindowPos(lParam)^.flags and SWP_NOMOVE = 0) then
            begin
              GetWindowRect(hwnd, R);
              LForm.SetBounds(R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top);
            end;
            { update state }
            TPlatformWin(Platform).FDiableUpdateState := True;
            try
              Placement.length := SizeOf(TWindowPlacement);
              GetWindowPlacement(hwnd, Placement);
              case Placement.showCmd of
                SW_SHOWMINIMIZED: LForm.WindowState := TWindowState.wsMinimized;
                SW_SHOWMAXIMIZED: LForm.WindowState := TWindowState.wsMaximized;
              else
                LForm.WindowState := TWindowState.wsNormal;
              end;
            finally
              TPlatformWin(Platform).FDiableUpdateState := False;
            end;
          end;
        WM_CLOSE:
          begin
            LForm.Close;
          end;
        WM_LBUTTONDOWN:
          begin
            CloseNoStaysOpen1;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbLeft, KeysToShiftState(wParam), P.X, P.Y);
            CloseNoStaysOpen2;
          end;
        WM_LBUTTONDBLCLK:
          begin
            CloseNoStaysOpen1;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbLeft, KeysToShiftState(wParam) + [ssDouble], P.X, P.Y);
            CloseNoStaysOpen2;
          end;
        WM_LBUTTONUP:
          begin
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseUp(TMouseButton.mbLeft, KeysToShiftState(wParam), P.X, P.Y);
          end;
        WM_RBUTTONDOWN:
          begin
            CloseNoStaysOpen;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbRight, KeysToShiftState(wParam), P.X, P.Y);
          end;
        WM_RBUTTONDBLCLK:
          begin
            CloseNoStaysOpen;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbRight, KeysToShiftState(wParam) + [ssDouble], P.X, P.Y);
          end;
        WM_RBUTTONUP:
          begin
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseUp(TMouseButton.mbRight, KeysToShiftState(wParam), P.X, P.Y);
          end;
        WM_MBUTTONDOWN:
          begin
            CloseNoStaysOpen;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbMiddle, KeysToShiftState(wParam), P.X, P.Y);
          end;
        WM_MBUTTONUP:
          begin
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseUp(TMouseButton.mbMiddle, KeysToShiftState(wParam), P.X, P.Y);
          end;
        WM_MBUTTONDBLCLK:
          begin
            CloseNoStaysOpen;
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseDown(TMouseButton.mbMiddle, KeysToShiftState(wParam) + [ssDouble], P.X, P.Y);
          end;
        WM_MOUSEMOVE:
          begin
            GetCursorPos(P);
            ScreenToClient(Wnd, P);
            LForm.MouseMove(KeysToShiftState(wParam), P.X, P.Y);
            tme.cbSize := SizeOf(tme);
            tme.hwndTrack := Wnd;
            tme.dwFlags := TME_LEAVE;
            tme.dwHoverTime := 1;
            TrackMouseEvent(tme);
          end;
        WM_MOUSELEAVE:
          begin
            LForm.MouseLeave;
          end;
        WM_MOUSEWHEEL:
          begin
            H := DispatchMouseWheelToPopups;

            if not H then
              LForm.MouseWheel(KeysToShiftState(wParam),
                               TSmallPoint(cardinal(wParam)).Y, H);

            Result := Integer(H = True);
          end;
        WM_GETDLGCODE:
          begin
            Result := DLGC_WANTTAB or dlgc_WantArrows or DLGC_WANTCHARS;
          end;
        WM_CHAR:
          begin
            ch := WideChar(wParam);
            key := 0;
            LForm.KeyDown(key, ch, KeyDataToShiftState(lParam));
            LForm.KeyUp(key, ch, KeyDataToShiftState(lParam));
            Result := 0;
          end;
        WM_SYSKEYDOWN,
        WM_KEYDOWN:
          begin
            // Check if this key translates to a WM_CHAR message
            // and if it does, pass KeyDown with character code
            // and clear the original WM_CHAR from the queue
            Msg.hwnd := hwnd;
            Msg.message := uMsg;
            Msg.wParam := wParam;
            Msg.lParam := lParam;
            Result := 0;

            LastKeyIsDeadKey := false;
            if PeekMessage(Msg, hwnd, WM_DEADCHAR, WM_DEADCHAR, PM_NOREMOVE + PM_NOYIELD) then begin
              LastKeyIsDeadKey := true;
            end
            else
            if TranslateMessage(Msg) then
            begin
              if PeekMessage(Msg, hwnd, WM_CHAR, WM_CHAR, PM_REMOVE) then
              begin
                key := wParam;
                ch := WideChar(Msg.wParam);
                // clear duplicate WM_CHAR
                PeekMessage(Msg, hwnd, WM_CHAR, WM_CHAR, PM_REMOVE);
                LForm.KeyDown(key, ch, KeyDataToShiftState(lParam));
              end
              else
              begin
                key := wParam;
                ch := #0;
                LForm.KeyDown(key, ch, KeyDataToShiftState(lParam));
              end
            end;

          // always let the system handle system shortcuts
          if uMsg = WM_SYSKEYDOWN then
            Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
          end;
        WM_DEADCHAR:
          begin
            PeekMessage(Msg, hwnd, WM_DEADCHAR, WM_DEADCHAR, PM_REMOVE);
            PeekMessage(Msg, hwnd, WM_CHAR, WM_CHAR, PM_REMOVE);
          end;
        WM_KEYUP:
          begin
            ch := #0;
            key := wParam;
            
            if LastKeyIsDeadKey then begin
              Result := 0;
            end else
            begin
              Msg.hwnd := hwnd;
              Msg.message := WM_KEYDOWN;
              Msg.wParam := wParam;
              Msg.lParam := Msg.lParam and $7fffffff;
              if TranslateMessage(Msg) then
                if PeekMessage(Msg, hwnd, WM_CHAR, WM_CHAR, PM_REMOVE) then
                begin
                  //key := 0;
                  ch := WideChar(Msg.wParam);
                end;
              LForm.KeyUp(key, ch, KeyDataToShiftState(lParam));
              Result := 0;
            end
          end;
        WM_SYSKEYUP:
          begin
            if (wParam = VK_MENU) or (wParam = VK_F10) then
            begin
              LForm.EnterMenuLoop;
              Result := 0;
            end
            else
              Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
          end;
        WM_RELEASEFORM:
          begin
            LForm.Free;
          end;
        { IME }
        WM_INPUTLANGCHANGE:
          begin
//            OnInputLangChange();

          end;
        WM_IME_SETCONTEXT:
          begin
            // Request the candidate windows only
            Result := DefWindowProc(hwnd, uMsg, wParam, lParam and ISC_SHOWUIALLCANDIDATEWINDOW);
          end;
        WM_IME_STARTCOMPOSITION:
          begin
//            InitCompStringData();
//            *trapped = true;
            Result := WMImeStartComposition(hWnd, uMsg, wParam, lParam);
          end;
        WM_IME_COMPOSITION:
          begin
            Result := WMImeComposition(LForm, uMsg, wParam, lParam);
          end;
        WM_IME_ENDCOMPOSITION:
          begin
//            CancelCompString( g_hwndCurr );
//            InitCompStringData();

//            LForm.SetMarkedText('');
            if (LForm.Focused <> nil) and Supports(LForm.Focused, ITextServiceControl, TSObj) then
              TTextServiceWin(TSObj.GetTextService).InternalSetMarkedText('');
          end;
        WM_IME_NOTIFY:
          begin
            Result := WMImeNotify(LForm, uMsg, wParam, lParam);
          end;
//        WM_IME_SETCONTEXT:
//          begin
//            { TODO -cIME : For Korean IME only? }
//          end;
        { }
        WM_COMMAND:
          begin
            TOpenMenuItem(Pointer(wParam)).Click;
            Result := 0;
          end;
      else
        Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
        // Default result if nothing happens
      end;
    except
      on E: Exception do
        Application.HandleException(E);
    end;
  end else
    Result := DefWindowProc(hwnd, uMsg, wParam, lParam);
  // Default result if nothing happens
end;

function TPlatformWin.CreateWindow(AForm: TCommonCustomForm): TFmxHandle;
var
  WindowClass: TWndClass;
  DropTarget: TDropTarget;
  Style, ExStyle: DWORD;
  Wnd: HWND;
  ParentWnd: HWND;
  WndClassName: string;
begin
  WndClassName := 'FM' + AForm.ClassName;
  if not GetClassInfo(hInstance, PChar(WndClassName), WindowClass) then
  begin
    FillChar(WindowClass, SizeOf(WindowClass), 0);
    WindowClass.Style := CS_DBLCLKS or CS_HREDRAW or CS_VREDRAW;
    WindowClass.lpfnWndProc := @WndProc;
    WindowClass.cbClsExtra := 0;
    WindowClass.cbWndExtra := 0;
    WindowClass.hInstance := hInstance;
    WindowClass.hIcon := LoadIconW(MainInstance, PChar('MAINICON'));
    WindowClass.hCursor := LoadCursorW(0, PChar(IDC_ARROW));
    WindowClass.hbrBackground := GetStockObject(NULL_BRUSH);
    WindowClass.lpszMenuName := nil;
    WindowClass.lpszClassName := PChar(WndClassName);
    if Winapi.Windows.RegisterClass(WindowClass) = 0 then
      RaiseLastOSError;
  end;

  Style := 0;
  ExStyle := 0;
  if (csDesigning in AForm.ComponentState) or (AForm.ClassName = 'TFormContainerForm') then
  begin
    // Only in IDE
    Style := Style or WS_CLIPCHILDREN or WS_CLIPSIBLINGS or WS_CHILDWINDOW;
    ExStyle := ExStyle;
  end
  else
  if AForm.Transparency then
  begin
    Style := Style or WS_POPUP;
    ExStyle := ExStyle or WS_EX_LAYERED;
    if (Application.MainForm <> nil) and (AForm <> Application.MainForm) then
      ExStyle := ExStyle or WS_EX_TOOLWINDOW; // disable taskbar
  end
  else
  begin
    case AForm.BorderStyle of
      TFmxFormBorderStyle.bsNone:
        begin
          Style := Style or WS_POPUP or WS_SYSMENU;
          ExStyle := ExStyle { or WS_EX_TOOLWINDOW }; // disable taskbar
        end;
      TFmxFormBorderStyle.bsSingle, TFmxFormBorderStyle.bsToolWindow:
        Style := Style or (WS_CAPTION or WS_BORDER);
      TFmxFormBorderStyle.bsSizeable, TFmxFormBorderStyle.bsSizeToolWin:
        Style := Style or (WS_CAPTION or WS_THICKFRAME);
    end;
    if AForm.BorderStyle in [TFmxFormBorderStyle.bsToolWindow, TFmxFormBorderStyle.bsSizeToolWin] then
    begin
      ExStyle := ExStyle or WS_EX_TOOLWINDOW;
      if (Application.MainForm = nil) or (Application.MainForm = AForm) then
        ExStyle := ExStyle or WS_EX_APPWINDOW;
    end;
    if AForm.BorderStyle <> TFmxFormBorderStyle.bsNone then
    begin
      if TBorderIcon.biMinimize in AForm.BorderIcons then
        Style := Style or WS_MINIMIZEBOX;
      if TBorderIcon.biMaximize in AForm.BorderIcons then
        Style := Style or WS_MAXIMIZEBOX;
      if TBorderIcon.biSystemMenu in AForm.BorderIcons then
        Style := Style or WS_SYSMENU;
    end;
  end;

  // modal forms must have an owner window
  if TFmxFormState.fsModal in AForm.FormState then
    ParentWnd := GetActiveWindow
  else
    ParentWnd := GetDesktopWindow;

  Wnd := CreateWindowEx(ExStyle, WindowClass.lpszClassName, PChar(AForm.Caption), Style,
    Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
    ParentWnd, 0, hInstance, nil);
  if Wnd <> 0 then
  begin
    SetProp(Wnd, MakeIntAtom(WindowAtom), THandle(AForm));

    DropTarget := TDropTarget.Create(nil);
    DropTarget.Form := AForm;
    SetProp(Wnd, MakeIntAtom(DropAtom), THandle(DropTarget));

    if not ((csDesigning in AForm.ComponentState) or (AForm.ClassName = 'TFormContainerForm')) then
      RegisterDragDrop(Wnd, DropTarget);
    Result := NewFmxHandle;
    FHWndMap.Add(Result, Wnd);
  end else
    RaiseLastOSError;
end;

procedure TPlatformWin.DestroyWindow(AForm: TCommonCustomForm);
var
  Wnd: HWND;
begin
  HideWindow(AForm);

  Wnd := HandleToHWND(AForm.Handle);
  if not ((csDesigning in AForm.ComponentState) or (AForm.ClassName = 'TFormContainerForm')) then
    RevokeDragDrop(Wnd);

  FindDropTarget(Wnd).Free;

  Winapi.Windows.DestroyWindow(Wnd);
  FHWndMap.Remove(AForm.Handle);
end;

procedure TPlatformWin.ReleaseWindow(AForm: TCommonCustomForm);
begin
  PostMessage(HandleToHWND(AForm.Handle), WM_RELEASEFORM, 0, 0);
end;

procedure TPlatformWin.InvalidateWindowRect(AForm: TCommonCustomForm; R: TRectF);
var
  WR: TRect;
  Wnd: HWND;
begin
  if IntersectRect(R, RectF(0, 0, AForm.ClientWidth, AForm.ClientHeight)) then
  begin
    Wnd := HandleToHWND(AForm.Handle);
    if AForm.Transparency and not (csDesigning in AForm.ComponentState) then
    begin
      PostMessage(Wnd, WM_ADDUPDATERECT, Integer(SmallPoint(Round(R.Left), Round(R.Top))),
        Integer(SmallPoint(Round(R.Right), Round(R.Bottom))));
    end
    else
    begin
      WR := Rect(trunc(R.Left), trunc(R.Top), ceil(R.Right), ceil(R.Bottom));
      Winapi.Windows.InvalidateRect(Wnd, @WR, False);
    end;
  end;
end;

function TPlatformWin.NewFmxHandle: TFmxHandle;
begin
{$IFDEF CPUX64}
  Result := TInterlocked.Add(Int64(FHandleCounter), 16);
{$ENDIF}  
{$IFDEF CPUX86}
  Result := TInterlocked.Add(Integer(FHandleCounter), 16);
{$ENDIF}  
end;

procedure TPlatformWin.UpdateLayer(AForm: TCommonCustomForm);
var
  Blend: TBlendFunction;
  Origin, Size, BitmapOrigin: TPoint;
begin
  if AForm is TCustomForm then
  begin
    if TForm(AForm).Canvas <> nil then
    begin
      Origin := Point(AForm.Left, AForm.Top);
      Size := Point(AForm.Width, AForm.Height);
      { Update }
      with Blend do
      begin
        BlendOp := AC_SRC_OVER;
        AlphaFormat := $01; // AC_SRC_ALPHA;
        BlendFlags := 0;
        SourceConstantAlpha := $FF;
      end;
      BitmapOrigin := Point(0, 0);

      UpdateLayeredWindow(HandleToHWND(AForm.Handle), 0, @Origin, @Size, TForm(AForm).Canvas.BufferHandle, @BitmapOrigin, $00000000, @Blend,
        ULW_ALPHA);
    end;
  end else if AForm is TCustomForm3D then
  begin
    if (TCustomForm3D(AForm).Context <> nil) and TCustomForm3D(AForm).Context.Valid then
    begin
      Origin := Point(AForm.Left, AForm.Top);
      Size := Point(AForm.Width, AForm.Height);
      { Update }
      with Blend do
      begin
        BlendOp := AC_SRC_OVER;
        AlphaFormat := $01; // AC_SRC_ALPHA;
        BlendFlags := 0;
        SourceConstantAlpha := $FF;
      end;
      BitmapOrigin := Point(0, 0);

      UpdateLayeredWindow(HandleToHWND(AForm.Handle), 0, @Origin, @Size, TForm3D(AForm).Context.BufferHandle, @BitmapOrigin, $00000000, @Blend,
        ULW_ALPHA);
    end;
  end;
end;

function TPlatformWin.GetWindowRect(AForm: TCommonCustomForm): TRectF;
var
  WR: TRect;
begin
  Winapi.Windows.GetWindowRect(HandleToHWND(AForm.Handle), WR);
  Result := RectF(WR.Left, WR.Top, WR.Right, WR.Bottom);
end;

procedure TPlatformWin.SetWindowRect(AForm: TCommonCustomForm; ARect: TRectF);
begin
  if AForm.WindowState = TWindowState.wsNormal then
    SetWindowPos(HandleToHWND(AForm.Handle), 0, Round(ARect.Left), Round(ARect.Top),
      Round(ARect.Right - ARect.Left), Round(ARect.Bottom - ARect.Top),
      SWP_NOACTIVATE or SWP_NOZORDER)
end;

procedure TPlatformWin.SetWindowCaption(AForm: TCommonCustomForm; const ACaption: string);
begin
  SetWindowText(HandleToHWND(AForm.Handle), ACaption);
end;

procedure TPlatformWin.ReleaseCapture(AForm: TCommonCustomForm);
begin
  Winapi.Windows.ReleaseCapture;
end;

procedure TPlatformWin.SetCapture(AForm: TCommonCustomForm);
begin
  Winapi.Windows.SetCapture(HandleToHWND(AForm.Handle));
end;

function TPlatformWin.GetClientSize(AForm: TCommonCustomForm): TPointF;
var
  CR: TRect;
begin
  if GetClientRect(HandleToHWND(AForm.Handle), CR) then
    Result := PointF(CR.Right - CR.Left, CR.Bottom - CR.Top)
  else
    Result := PointF(0, 0)
end;

procedure TPlatformWin.SetClientSize(AForm: TCommonCustomForm; const ASize: TPointF);
var
  CR, WR: TRect;
  Wnd: HWND;
begin
  Wnd := HandleToHWND(AForm.Handle);
  GetClientRect(Wnd, CR);
  Winapi.Windows.ClientToScreen(Wnd, CR.TopLeft);
  Winapi.Windows.ClientToScreen(Wnd, CR.BottomRight);
  Winapi.Windows.GetWindowRect(Wnd, WR);
  if (WR.Width  <> Round(ASize.X) + (CR.Left - WR.Left) + (WR.Right  - CR.Right)) or
     (WR.Height <> Round(ASize.Y) + (CR.Top  - WR.Top)  + (WR.Bottom - CR.Bottom)) then
    Winapi.Windows.SetWindowPos(Wnd, 0, WR.Left, WR.Top,
      Round(ASize.X) + (CR.Left - WR.Left) + (WR.Right - CR.Right),
      Round(ASize.Y) + (CR.Top  - WR.Top)  + (WR.Bottom - CR.Bottom),
      SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE);
end;

procedure TPlatformWin.HideWindow(AForm: TCommonCustomForm);
var
  ActiveWindow: HWND;
begin
  if FNoStaysOpenList.IndexOf(AForm) >= 0 then
    FNoStaysOpenList.Remove(AForm);

  SetWindowPos(HandleToHWND(AForm.Handle), 0, 0, 0, 0, 0,
    SWP_HIDEWINDOW or SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE);

  ActiveWindow := GetActiveWindow;
  SetActiveWindow(ActiveWindow);
  
  SetFocus(FindTopMostWindow(0));
end;

const
  ShowCommands: array[TWindowState] of Integer =
    (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED);

procedure TPlatformWin.ShowWindow(AForm: TCommonCustomForm);
var
  Wnd: HWND;
begin
  Wnd := HandleToHWND(AForm.Handle);
  if not AForm.ShowActivated then
    Winapi.Windows.ShowWindow(Wnd, SW_SHOWNOACTIVATE)
  else
    Winapi.Windows.ShowWindow(Wnd, ShowCommands[AForm.WindowState] or SW_SHOWNORMAL);
  if AForm.Transparency and not (csDesigning in AForm.ComponentState) then
    PostMessage(FmxHandleToHWND(AForm.Handle), WM_ADDUPDATERECT, Integer(SmallPoint(0, 0)),
      Integer(SmallPoint(AForm.Width, AForm.Height)));
  if AForm.TopMost then
    SetWindowPos(Wnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  if not AForm.StaysOpen and (FNoStaysOpenList.IndexOf(AForm) < 0) then
    FNoStaysOpenList.Add(AForm);
end;

procedure TPlatformWin.SetWindowState(AForm: TCommonCustomForm; const AState: TWindowState);
begin
  if not FDiableUpdateState then
    Winapi.Windows.ShowWindow(HandleToHWND(AForm.Handle), ShowCommands[AState]);
end;

type
  PTaskWindow = ^TTaskWindow;
  TTaskWindow = record
    Next: PTaskWindow;
    Window: hwnd;
  end;

var
  TaskActiveWindow: HWND = 0;
  TaskFirstWindow: HWND = 0;
  TaskFirstTopMost: HWND = 0;
  TaskWindowList: PTaskWindow = nil;

function DoDisableWindow(Window: hwnd; Data: Longint): bool; stdcall;
var
  P: PTaskWindow;
begin
  if (Window <> TaskActiveWindow) and IsWindowVisible(Window) and IsWindowEnabled(Window) then
  begin
    New(P);
    P^.Next := TaskWindowList;
    P^.Window := Window;
    TaskWindowList := P;
    EnableWindow(Window, False);
  end;
  Result := True;
end;

procedure EnableTaskWindows(WindowList: Pointer);
var
  P: PTaskWindow;
begin
  while WindowList <> nil do
  begin
    P := WindowList;
    if IsWindow(P^.Window) then
      EnableWindow(P^.Window, True);
    WindowList := P^.Next;
    Dispose(P);
  end;
end;

function DisableTaskWindows(ActiveWindow: HWND): Pointer;
var
  SaveActiveWindow: hwnd;
  SaveWindowList: Pointer;
begin
  Result := nil;
  SaveActiveWindow := TaskActiveWindow;
  SaveWindowList := TaskWindowList;
  TaskActiveWindow := ActiveWindow;
  TaskWindowList := nil;
  try
    try
      EnumThreadWindows(GetCurrentThreadID, @DoDisableWindow, 0);
      Result := TaskWindowList;
    except
      EnableTaskWindows(TaskWindowList);
      raise;
    end;
  finally
    TaskWindowList := SaveWindowList;
    TaskActiveWindow := SaveActiveWindow;
  end;
end;

function DoFindWindow(Window: HWnd; Param: LPARAM): Bool; {$IFNDEF CLR}stdcall;{$ENDIF}
begin
  if (Window <> TaskActiveWindow) and
    IsWindowVisible(Window) and IsWindowEnabled(Window) then
    if GetWindowLong(Window, GWL_EXSTYLE) and WS_EX_TOPMOST = 0 then
    begin
      if TaskFirstWindow = 0 then TaskFirstWindow := Window;
    end else
    begin
      if TaskFirstTopMost = 0 then TaskFirstTopMost := Window;
    end;
  Result := True;
end;

function FindTopMostWindow(ActiveWindow: HWnd): HWnd;
var
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate!
begin
  TaskActiveWindow := ActiveWindow;
  TaskFirstWindow := 0;
  TaskFirstTopMost := 0;
  EnumProc := @DoFindWindow;
  EnumThreadWindows(GetCurrentThreadID, EnumProc, 0);
  if TaskFirstWindow <> 0 then
    Result := TaskFirstWindow else
    Result := TaskFirstTopMost;
end;

type
  THackForm = class(TCommonCustomForm);

function TPlatformWin.ShowWindowModal(AForm: TCommonCustomForm): TModalResult;
var
  WindowList: Pointer;
  ActiveWindow: hwnd;
begin
  if GetCapture <> 0 then
    SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  Winapi.Windows.ReleaseCapture;
  ActiveWindow := GetActiveWindow;
  // recreate the WinApi handle of the form in order to make the underlying
  // window owned by ActiveWindow
  THackForm(AForm).Recreate;
  WindowList := DisableTaskWindows(0);
  try
    AForm.Show;
    AForm.ModalResult := mrNone;
    SetActiveWindow(FmxHandleToHWND(AForm.Handle));
    SetFocus(FmxHandleToHWND(AForm.Handle));

    repeat
      if not Application.HandleMessage then
        Platform.WaitMessage;
      if Application.Terminated then
        AForm.ModalResult := mrCancel
      else if AForm.ModalResult <> mrNone then
        AForm.CloseModal;
    until AForm.ModalResult <> mrNone;

    if GetActiveWindow <> FmxHandleToHWND(AForm.Handle) then ActiveWindow := 0;
    if AForm.Visible then AForm.Hide;
  finally
    EnableTaskWindows(WindowList);
  end;

  Result := AForm.ModalResult;
end;

function TPlatformWin.ClientToScreen(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
var
  P: TPoint;
begin
  P := System.Types.Point(Round(Point.X), Round(Point.Y));
  Winapi.Windows.ClientToScreen(HandleToHWND(AForm.Handle), P);
  Result := PointF(P.X, P.Y);
end;

function TPlatformWin.ScreenToClient(AForm: TCommonCustomForm; const Point: TPointF): TPointF;
var
  P: TPoint;
begin
  P := System.Types.Point(Round(Point.X), Round(Point.Y));
  Winapi.Windows.ScreenToClient(HandleToHWND(AForm.Handle), P);
  Result := PointF(P.X, P.Y);
end;

{ Menus }

procedure TPlatformWin.StartMenuLoop(const AView: IMenuView);
var
  FirstLoop: Boolean;

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
  Msg: TMsg;
  WP: TPoint;
  P: TPointF;
  InMenus: Boolean;
  CurrentView, NewView: IMenuView;
  Obj: IControl;
  AutoPopupTime: Integer;
  TimerId: THandle;
  TPos, TOldPos: TPoint;
begin
  AView.Loop := True;
  TOldPos := Point(0, 0);
  TPos := TOldPos;
  TimerId := SetTimer(0, 0, 50, nil);
  try
    FirstLoop := True;
    while ContinueLoop do
    begin
                                                         
      if FirstLoop then
        FirstLoop := False
      else
        WaitMessage;

      while ContinueLoop and PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE) do
      begin
        case Msg.message of
          WM_WINDOWPOSCHANGING:
            begin
              EndLoop;
              Exit;
            end;
          WM_QUIT, WM_NCLBUTTONDOWN..WM_NCMBUTTONDBLCLK:
            begin
              EndLoop;
              Continue;
            end;
          WM_TIMER:
            begin
              if (Msg.hwnd = 0) or (AView <> nil) then
              begin
                if GetCursorPos(TPos) then
                begin
                  AutoPopupTime := AutoPopupTime + 50;
                  { Check auto popup }
                  GetCursorPos(TPos);
                  if (TPos.X = TOldPos.X) and (TPos.Y = TOldPos.Y) then
                  begin
                    if (AutoPopupTime >= 500) then
                    begin
                      Obj := AView.ObjectAtPoint(PointF(TPos.X, TPos.Y));
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
              end
              else
                TranslateMessage(Msg);
            end;
        end;
        if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
        begin
          case Msg.message of
            WM_CONTEXTMENU: ;
            WM_MOUSEFIRST..WM_MOUSELAST:
            begin
              case Msg.message of
                WM_MOUSEMOVE: begin
                  { Handle MouseOver }
                  {$IFDEF CPUX64}
                  WP := SmallPointToPoint(TSmallPoint(Cardinal(Msg.lParam)));
                  {$ELSE}
                  WP := SmallPointToPoint(TSmallPoint(Msg.lParam));
                  {$ENDIF}
                  Winapi.Windows.ClientToScreen(Msg.hwnd, WP);
                  P := PointF(WP.X, WP.Y);
                  Obj := AView.ObjectAtPoint(P);
                  TranslateMessage(Msg);
                  DispatchMessage(Msg);
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
                  Continue;
                end;
                WM_LBUTTONDOWN: begin
                  { Handle MouseOver if mouse over not menuitem }
                  {$IFDEF CPUX64}
                  WP := SmallPointToPoint(TSmallPoint(Cardinal(Msg.lParam)));
                  {$ELSE}
                  WP := SmallPointToPoint(TSmallPoint(Msg.lParam));
                  {$ENDIF}
                  Winapi.Windows.ClientToScreen(Msg.hwnd, WP);
                  P := PointF(WP.X, WP.Y);
                  Obj := AView.ObjectAtPoint(P);
                  if (Obj <> nil) and not (Obj is TMenuItem) then
                  begin
                    TranslateMessage(Msg);
                    DispatchMessage(Msg);
                    Continue;
                  end;
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
                WM_LBUTTONUP: begin
                  { Handle MouseOver if mouse over not menuitem }
                  {$IFDEF CPUX64}
                  WP := SmallPointToPoint(TSmallPoint(Cardinal(Msg.lParam)));
                  {$ELSE}
                  WP := SmallPointToPoint(TSmallPoint(Msg.lParam));
                  {$ENDIF}
                  Winapi.Windows.ClientToScreen(Msg.hwnd, WP);
                  P := PointF(WP.X, WP.Y);
                  Obj := AView.ObjectAtPoint(P);
                  if (Obj <> nil) and not (Obj is TMenuItem) then
                  begin
                    TranslateMessage(Msg);
                    DispatchMessage(Msg);
                    Continue;
                  end;
                end;
              end;
            end;
            WM_KEYFIRST..WM_KEYLAST:
              if (GetKeyState(VK_LBUTTON) >= 0) then
                case Msg.message of
                  WM_KEYDOWN, WM_SYSKEYDOWN:
                    case Msg.wParam of
                      VK_TAB: begin
                      end;
                      VK_RETURN: begin
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
                      VK_SPACE: begin
                      end;
                      VK_ESCAPE: begin
                        AView.Selected := nil;
                        Exit;
                      end;
                      VK_MENU, VK_F10:
                        EndLoop;
                      VK_LEFT: begin
                        if AView.IsMenuBar then
                        begin
                          SelectPrev(AView);
                        end
                        else
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
                      VK_RIGHT: begin
                        if AView.IsMenuBar then
                        begin
                          SelectNext(AView);
                        end
                        else
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
                      end;
                      VK_UP:
                        if not AView.IsMenuBar then
                          SelectPrev(AView);
                      VK_DOWN:
                        if not AView.IsMenuBar then
                          SelectNext(AView)
                        else
                          if AView.Selected <> nil then
                            AView.Selected.NeedPopup;
                    end;
                  WM_CHAR, WM_SYSCHAR:
                  begin
{                    if FItems.FindItemByChar(Char(Msg.wParam)) <> nil then
                    begin
                      FSelItem := FItems.FindItemByChar(Char(Msg.wParam));
                      if FSelItem <> nil then InvalidateItem(FSelItem);
                      PostMessage(Window.Handle, WM_KEYDOWN, VK_RETURN, 0)
                    end;}
                  end;
                end;
          else
            TranslateMessage(Msg);
            DispatchMessage(Msg);
          end;
        end;
      end;
    end;
  finally
    KillTimer(0, TimerId);
    AView.Loop := False;
    Winapi.Windows.ReleaseCapture;
  end;
end;

type
  TMenuKeyCap = (mkcBkSp, mkcTab, mkcEsc, mkcEnter, mkcSpace, mkcPgUp,
    mkcPgDn, mkcEnd, mkcHome, mkcLeft, mkcUp, mkcRight, mkcDown, mkcIns,
    mkcDel, mkcShift, mkcCtrl, mkcAlt);

var
  MenuKeyCaps: array[TMenuKeyCap] of string = (
    SmkcBkSp, SmkcTab, SmkcEsc, SmkcEnter, SmkcSpace, SmkcPgUp,
    SmkcPgDn, SmkcEnd, SmkcHome, SmkcLeft, SmkcUp, SmkcRight,
    SmkcDown, SmkcIns, SmkcDel, SmkcShift, SmkcCtrl, SmkcAlt);

procedure TPlatformWin.ShortCutToKey(ShortCut: TShortCut; var Key: Word;
  var Shift: TShiftState);
begin
  Key := ShortCut and not (scShift + scCtrl + scAlt);
  Shift := [];
  if ShortCut and scShift <> 0 then Include(Shift, ssShift);
  if ShortCut and scCtrl <> 0 then Include(Shift, ssCtrl);
  if ShortCut and scAlt <> 0 then Include(Shift, ssAlt);
end;

function TPlatformWin.ShortCutToText(ShortCut: TShortCut): string;

  function GetSpecialName(ShortCut: TShortCut): string;
  var
    ScanCode: Integer;
    KeyName: array[0..255] of Char;
  begin
    Result := '';
    ScanCode := MapVirtualKey(LoByte(Word(ShortCut)), 0) shl 16;
    if ScanCode <> 0 then
    begin
      GetKeyNameText(ScanCode, KeyName, Length(KeyName));
      GetSpecialName := KeyName;
    end;
  end;

var
  Name: string;
  Key: Byte;
begin
  Key := LoByte(Word(ShortCut));
  case Key of
    $08, $09:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcBkSp) + Key - $08)];
    $0D: Name := MenuKeyCaps[mkcEnter];
    $1B: Name := MenuKeyCaps[mkcEsc];
    $20..$28:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcSpace) + Key - $20)];
    $2D..$2E:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcIns) + Key - $2D)];
    $30..$39: Name := Chr(Key - $30 + Ord('0'));
    $41..$5A: Name := Chr(Key - $41 + Ord('A'));
    $60..$69: Name := Chr(Key - $60 + Ord('0'));
    $70..$87: Name := 'F' + IntToStr(Key - $6F);
  else
    Name := GetSpecialName(ShortCut);
  end;
  if Name <> '' then
  begin
    Result := '';
    if ShortCut and scShift <> 0 then Result := Result + MenuKeyCaps[mkcShift];
    if ShortCut and scCtrl <> 0 then Result := Result + MenuKeyCaps[mkcCtrl];
    if ShortCut and scAlt <> 0 then Result := Result + MenuKeyCaps[mkcAlt];
    Result := Result + Name;
  end
  else Result := '';
end;

function TPlatformWin.TextToShortCut(Text: string): integer;
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
    if CompareFront(Text, MenuKeyCaps[mkcShift]) then Shift := Shift or scShift
    else if CompareFront(Text, '^') then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuKeyCaps[mkcCtrl]) then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuKeyCaps[mkcAlt]) then Shift := Shift or scAlt
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

{ OS Menu }

procedure TPlatformWin.CreateOSMenu(AForm: TCommonCustomForm; const AMenu: IItemsContainer);

  procedure InsertItems(Parent: HMENU; Item: TMenuItem);
  var
    i: Integer;
    PopupMenu: HMENU;
    Child: IItemsContainer;
    Flags: Integer;
  begin
    if Supports(Item, IItemsContainer, Child) and (Child.GetItemsCount > 0) then
    begin
      if Item.Visible then
      begin
        PopupMenu := CreateMenu;
        AppendMenu(Parent, MF_STRING or MF_POPUP, PopupMenu, PChar(Item.Text));
        Item.Handle := PopupMenu;
        for i := 0 to Child.GetItemsCount - 1 do
        begin
          if Child.GetItem(i) is TMenuItem then
            InsertItems(PopupMenu, TMenuItem(Child.GetItem(i)));
        end;
      end;
    end
    else
    begin
      if Item.Visible then
      begin
        Flags := 0;
        if Item.IsChecked then
          Flags := Flags or MF_CHECKED
        else
          Flags := Flags or MF_UNCHECKED;
        if Item.Enabled then
          Flags := Flags or MF_ENABLED
        else
          Flags := Flags or MF_DISABLED;
        if (Item.Text = '-')  then
          AppendMenu(Parent, Flags or MF_SEPARATOR, THandle(Item), nil)
        else
          begin
          if (ShortCutToText(Item.ShortCut) <> '') and  not(Item.Parent is TMainMenu)  then
            AppendMenu(Parent, Flags or MF_STRING, THandle(Item), PChar(Item.Text+ #9 + ShortCutToText(Item.ShortCut)))
          else
            AppendMenu(Parent, Flags or MF_STRING, THandle(Item), PChar(Item.Text));
          end;
        Item.Handle := Parent;
      end;
    end;
  end;

var
  R: TRect;
  Handle: HMENU;
  i: Integer;
begin
  if AMenu = nil then
  begin
    SetMenu(HandleToHWND(AForm.Handle), 0);
    TOpenCustomForm(AForm).ResizeHandle;
    Exit;
  end;
  Handle := CreateMenu;
  for i := 0 to AMenu.GetItemsCount - 1 do
    if (AMenu.GetItem(i) is TMenuItem) and TMenuItem(AMenu.GetItem(i)).Visible then
      InsertItems(Handle, TMenuItem(AMenu.GetItem(i)));
  SetMenu(HandleToHWND(AForm.Handle), Handle);
  TOpenCustomForm(AForm).ResizeHandle;
end;

procedure TPlatformWin.UpdateMenuItem(const AItem: TMenuItem);
var
  Flags: Integer;
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
  end
  else
  begin
    if AItem.Handle <> 0 then
    begin
      if AItem.Visible then
      begin
        if AItem.Text = '-' then
        begin
          ModifyMenu(AItem.Handle, THandle(AItem), MF_SEPARATOR, THandle(AItem), nil);
          Exit;
        end;
        Flags := 0;
        if AItem.IsChecked then
          Flags := Flags or MF_CHECKED
        else
          Flags := Flags or MF_UNCHECKED;
        if AItem.Enabled then
          Flags := Flags or MF_ENABLED
        else
          Flags := Flags or MF_DISABLED;
        ModifyMenuW(AItem.Handle, THandle(AItem), MF_BYCOMMAND or MF_STRING or Flags, THandle(AItem), PChar(AItem.Text));
      end;
    end;
  end;
end;

procedure TPlatformWin.ValidateHandle(FmxHandle: TFmxHandle);
begin
  if (FmxHandle and $F <> 0) then
    raise EInvalidFmxHandle.CreateResFmt(@SInvalidFmxHandle, [HexDisplayPrefix, SizeOf(TFmxHandle) * 2, FmxHandle]);
end;

{ Drag and Drop }

const
  SID_IDropTargetHelper = '{4657278B-411B-11d2-839A-00C04FD918D0}';
  CLSID_DragDropHelper: TGUID = (D1: $4657278A; D2: $411B; D3: $11D2; D4: ($83, $9A, $00, $C0, $4F, $D9, $18, $D0));

type
  IDropTargetHelper = interface(IUnknown)
    [SID_IDropTargetHelper]
    function DragEnter(hwndTarget: hwnd; const dataObj: IDataObject; var pt: TPoint;
      dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function DragOver(var pt: TPoint; dwEffect: Longint): HResult; stdcall;
    function Drop(const dataObj: IDataObject; var pt: TPoint; dwEffect: Longint): HResult; stdcall;
    function Show(Show: bool): HResult; stdcall;
  end;

var
  FDropTargetHelper: IDropTargetHelper;
  FDataObj: IDataObject;

function TDropTarget.GetDataObject: TDragObject;
var
  FormatEtc: TFormatEtc;
  StgMedium: TStgMedium;
  str: string;
  Drop: HDrop;
  i, numFiles: Integer;
  buffer: array [0 .. MAX_PATH] of Char;
begin
  FillChar(Result, SizeOf(Result), 0);
  if FDataObj = nil then Exit;
  // get file name first
  with FormatEtc do
  begin
    cfFormat := CF_HDROP;
    ptd := nil;
    dwAspect := DVASPECT_CONTENT;
    lindex := -1;
    Tymed := TYMED_HGLOBAL;
  end;
  // get FireMonkey
  FormatEtc.cfFormat := CF_OBJECT;
  if FDataObj.GetData(FormatEtc, StgMedium) = S_OK then
  begin
    Result := TDropSource(StgMedium.HGLOBAL).Data;
    Exit;
  end;
  // files
  str := '';
  FormatEtc.cfFormat := CF_HDROP;
  if FDataObj.GetData(FormatEtc, StgMedium) = S_OK then
  begin
    try
      drop := HDrop(GlobalLock(stgMedium.hGlobal));
      { Replace Text }
      numFiles := DragQueryFile(Drop, $FFFFFFFF, nil, 0);
      SetLength(Result.Files, numFiles);
      for i := 0 to numFiles - 1 do
      begin
        DragQueryFile(Drop, i, @buffer, Length(buffer));
        Result.Files[i] := buffer;
        if i = 0 then
          Result.Data := Result.Files[0];
      end;
    finally
      GlobalUnlock(stgMedium.hGlobal);
      { Free the memory }
      ReleaseStgMedium(StgMedium);
    end;
    Exit;
  end;
  // get text
  FormatEtc.cfFormat := CF_UNICODETEXT;
  if FDataObj.GetData(FormatEtc, StgMedium) = S_OK then
  begin
    try
      { Lock the global memory handle to get a pointer to the data }
      str := PChar(GlobalLock(StgMedium.HGLOBAL));
      Result.Data := str;
    finally
      { Finished with the pointer }
      GlobalUnlock(StgMedium.HGLOBAL);
      { Free the memory }
      ReleaseStgMedium(StgMedium);
    end;
    Exit;
  end;
end;

function TDropTarget.DragEnter(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
  var dwEffect: Longint): HResult;
var
  Res: HResult;
begin
  try
    FDataObj := dataObj;
    Result := S_OK;
    dwEffect := DROPEFFECT_NONE;
    if (Succeeded(CoCreateInstance(CLSID_DragDropHelper, nil, CLSCTX_INPROC_SERVER, IDropTargetHelper,
      FDropTargetHelper))) and (FDropTargetHelper <> nil) then
    begin
      Res := FDropTargetHelper.DragEnter(FmxHandleToHWND(Form.Handle), dataObj, pt, dwEffect);
      if (Failed(Res)) then
        FDropTargetHelper := nil;
    end;
  except
    dwEffect := DROPEFFECT_NONE;
    Result := E_UNEXPECTED;
  end;
end;

function TDropTarget.DragOver(grfKeyState: Longint; pt: TPoint; var dwEffect: Longint): HResult;
var
  P: TPointF;
  Accept: Boolean;
begin
  Result := E_UNEXPECTED;
  try
    dwEffect := DROPEFFECT_NONE;
    P := PointF(pt.X, pt.Y);
    Accept := False;
    Form.DragOver(GetDataObject, P, Accept);
    if Accept then
      dwEffect := DROPEFFECT_LINK;
    // do NOT translate the screen coordinates to form coordinates because
    // it seems that the drop target helper needs screen coordinates
    if FDropTargetHelper <> nil then
      FDropTargetHelper.DragOver(pt, dwEffect);
    Result := S_OK;
  except
    dwEffect := DROPEFFECT_NONE;
    Result := E_UNEXPECTED;
  end;
end;

function TDropTarget.DragLeave: HResult;
begin
  Form.DragLeave;
  if (FDropTargetHelper <> nil) then
    FDropTargetHelper.DragLeave;
  FDropTargetHelper := nil;
  FDataObj := nil;
  Result := S_OK;
end;

function TDropTarget.Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
  var dwEffect: Longint): HResult;
var
  P: TPointF;
begin
  Result := S_OK;
  try
    if (dataObj = nil) then
      Exit;
    P := PointF(pt.X, pt.Y);
    Form.DragDrop(GetDataObject, P);
    // do NOT translate the screen coordinates to form coordinates because
    // it seems that the drop target helper needs screen coordinates
    if (FDropTargetHelper <> nil) then
      FDropTargetHelper.Drop(dataObj, pt, dwEffect)
  finally
    FDataObj := nil;
    FDropTargetHelper := nil;
  end;
end;

{ TDropSource }

{ IDropSource }

function TDropSource.QueryContinueDrag(fEscapePressed: bool; grfKeyState: Integer): HResult;
var
  ContinueDrop: Boolean;
begin
  if fEscapePressed then
    Result := DRAGDROP_S_CANCEL
  else if (grfKeyState and (MK_LBUTTON or MK_RBUTTON) = 0) then
  begin
    ContinueDrop := True;
    if ContinueDrop then
      Result := DRAGDROP_S_DROP
    else
      Result := DRAGDROP_S_CANCEL;
  end
  else
    Result := S_OK;
end;

function TDropSource.GiveFeedback(dwEffect: Integer): HResult;
begin
  Result := S_OK; // DRAGDROP_S_USEDEFAULTCURSORS;
end;

{ IDataObject }

function TDropSource.dAdvise(const FormatEtc: TFormatEtc; advf: Longint; const advsink: IAdviseSink;
  out dwConnection: Longint): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

function TDropSource.dUnadvise(dwConnection: Longint): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

function TDropSource.EnumdAdvise(out EnumAdvise: IEnumStatData): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

function TDropSource.EnumFormatEtc(dwDirection: Longint; out EnumFormatEtc: IEnumFormatEtc): HResult;
begin
  if (dwDirection = DATADIR_GET) then
    Result := S_OK
  else
    Result := E_NOTIMPL;
end;

function TDropSource.GetCanonicalFormatEtc(const FormatEtc: TFormatEtc; out FormatEtcout: TFormatEtc): HResult;
begin
  Result := DATA_S_SAMEFORMATETC;
end;

function TDropSource.EqualFormatEtc(FormatEtc1, FormatEtc2: TFormatEtc): Boolean;
begin
  Result := (FormatEtc1.cfFormat = FormatEtc2.cfFormat) and (FormatEtc1.ptd = FormatEtc2.ptd) and
    (FormatEtc1.dwAspect = FormatEtc2.dwAspect) and (FormatEtc1.lindex = FormatEtc2.lindex) and
    (FormatEtc1.Tymed = FormatEtc2.Tymed)
end;

function TDropSource.FindFormatEtc(TestFormatEtc: TFormatEtc): Integer;
var
  i: Integer;
  Found: Boolean;
begin
  i := 0;
  Found := False;
  Result := -1;
  while (i < Length(Formats)) and not Found do
  begin
    Found := EqualFormatEtc(Formats[i].FormatEtc, TestFormatEtc);
    if Found then
      Result := i;
    Inc(i);
  end
end;

function TDropSource.HGlobalClone(HGLOBAL: THandle): THandle;
// Returns a global memory block that is a copy of the passed memory block.
var
  size: LongWord;
  Data, NewData: PByte;
begin
  size := GlobalSize(HGLOBAL);
  Result := GlobalAlloc(GPTR, size);
  Data := GlobalLock(HGLOBAL);
  try
    NewData := GlobalLock(Result);
    try
      Move(Data, NewData, size);
    finally
      GlobalUnlock(Result);
    end
  finally
    GlobalUnlock(HGLOBAL)
  end
end;

function TDropSource.RetrieveOwnedStgMedium(Format: TFormatEtc; var StgMedium: TStgMedium): HResult;
var
  i: Integer;
begin
  Result := E_INVALIDARG;
  i := FindFormatEtc(Format);
  if (i > -1) and Formats[i].OwnedByDataObject then
    Result := StgMediumIncRef(Formats[i].StgMedium, StgMedium, False)
end;

function TDropSource.StgMediumIncRef(const InStgMedium: TStgMedium; var OutStgMedium: TStgMedium;
  CopyInMedium: Boolean): HResult;
begin
  Result := S_OK;
  // Simply copy all fields to start with.
  OutStgMedium := InStgMedium;
  case InStgMedium.Tymed of
    TYMED_HGLOBAL:
      begin
        if CopyInMedium then
        begin
          // Generate a unique copy of the data passed
          OutStgMedium.HGLOBAL := HGlobalClone(InStgMedium.HGLOBAL);
          if OutStgMedium.HGLOBAL = 0 then
            Result := E_OUTOFMEMORY
        end
        else
          // Don't generate a copy just use ourselves and the copy previoiusly saved
          MySTGMEDIUM(OutStgMedium).UnkForRelease := Pointer(Self as IDataObject) // Does increase RefCount
      end;
    TYMED_FILE:
      begin
        if CopyInMedium then
        begin
          OutStgMedium.lpszFileName := CoTaskMemAlloc(lstrLenW(InStgMedium.lpszFileName));
          // !!          StrCopyW(PChar(OutStgMedium.lpszFileName), PChar(InStgMedium.lpszFileName))
        end
        else
          MySTGMEDIUM(OutStgMedium).UnkForRelease := Pointer(Self as IDataObject) // Does increase RefCount
      end;
    TYMED_ISTREAM:
                                              
      IUnknown(MySTGMEDIUM(OutStgMedium).stm)._AddRef;
    TYMED_ISTORAGE:
      IUnknown(MySTGMEDIUM(OutStgMedium).stg)._AddRef;
    TYMED_GDI:
      if not CopyInMedium then
        MySTGMEDIUM(OutStgMedium).UnkForRelease := Pointer(Self as IDataObject)
        // Does not increase RefCount
      else
        Result := DV_E_TYMED; // Don't know how to copy GDI objects right now
    TYMED_MFPICT:
      if not CopyInMedium then
        MySTGMEDIUM(OutStgMedium).UnkForRelease := Pointer(Self as IDataObject)
        // Does not increase RefCount
      else
        Result := DV_E_TYMED;
    // Don't know how to copy MetaFile objects right now
    TYMED_ENHMF:
      if not CopyInMedium then
        MySTGMEDIUM(OutStgMedium).UnkForRelease := Pointer(Self as IDataObject)
        // Does not increase RefCount
      else
        Result := DV_E_TYMED;
    // Don't know how to copy enhanced metafiles objects right now
  else
    Result := DV_E_TYMED
  end;

  // I still have to do this. The Compiler will call _Release on the above Self as IDataObject
  // casts which is not what is necessary.  The DataObject is released correctly.
  if Assigned(MySTGMEDIUM(OutStgMedium).UnkForRelease) and (Result = S_OK) then
    IUnknown(MySTGMEDIUM(OutStgMedium).UnkForRelease)._AddRef
end;

function TDropSource.GetData(const FormatEtcIn: TFormatEtc; out Medium: TStgMedium): HResult;
var
  Global: cardinal;
  P: Pointer;
  W: string;
  B: TBitmap;
  BitmapHandle: cardinal;
begin
  FillChar(Medium, SizeOf(Medium), 0);
  Result := DV_E_FORMATETC;
  if QueryGetData(FormatEtcIn) <> S_OK then
    Exit;

  if FormatEtcIn.cfFormat = CF_OBJECT then
  begin
    Medium.Tymed := TYMED_HGLOBAL;
    Medium.HGLOBAL := THandle(Self);
    Result := S_OK;
    Exit;
  end;
  case FormatEtcIn.cfFormat of
    CF_UNICODETEXT:
      begin
        W := Data.Data;
        Global := GlobalAlloc(0, (Length(W) + 1) * 2);
        P := GlobalLock(Global);
        try
          Move(PChar(W)^, P^, GlobalSize(Global));
        finally
          GlobalUnlock(Global);
        end;
        Medium.Tymed := TYMED_HGLOBAL;
        Medium.HGLOBAL := Global;
        Result := S_OK;
      end;
    CF_BITMAP:
      begin
        if VarIsObject(Data.Data) and (VariantToObject(Data.Data) is TBitmap) then
        begin
          B := TBitmap(VariantToObject(Data.Data));
          BitmapHandle := HBmpFromBitmap(B);
          if BitmapHandle <> 0 then
          begin
            Medium.Tymed := TYMED_GDI;
            Medium.HBITMAP := BitmapHandle;
            Result := S_OK;
          end;
        end
      end;
  end;
  if Result <> S_OK then
    if Assigned(Formats) then
    begin
      { Do we support this type of Data? }
      Result := QueryGetData(FormatEtcIn);
      if Result = S_OK then
      begin
        // If the data is owned by the IDataObject just retrieve and return it.
        if RetrieveOwnedStgMedium(FormatEtcIn, Medium) = E_INVALIDARG then
          Result := E_UNEXPECTED
      end
    end
end;

function TDropSource.GetDataHere(const FormatEtc: TFormatEtc; out Medium: TStgMedium): HResult;
begin
  Result := E_NOTIMPL;
end;

function TDropSource.QueryGetData(const FormatEtc: TFormatEtc): HResult;
var
  i: Integer;
begin
  Result := DV_E_FORMATETC;
  if FormatEtc.cfFormat = CF_OBJECT then
  begin
    Result := S_OK;
    Exit;
  end;
  case FormatEtc.cfFormat of
    CF_UNICODETEXT:
      begin
        if VarIsStr(Data.Data) and not VarIsObject(Data.Data) then
          Result := S_OK;
      end;
    CF_BITMAP:
      begin
        if VarIsObject(Data.Data) and (VariantToObject(Data.Data) is TBitmap) then
          Result := S_OK;
      end;
  end;
  if Result <> S_OK then
  begin
    if Assigned(Formats) then
    begin
      i := 0;
      Result := DV_E_FORMATETC;
      while (i < Length(Formats)) and (Result = DV_E_FORMATETC) do
      begin
        if Formats[i].FormatEtc.cfFormat = FormatEtc.cfFormat then
        begin
          if (Formats[i].FormatEtc.dwAspect = FormatEtc.dwAspect) then
          begin
            if (Formats[i].FormatEtc.Tymed and FormatEtc.Tymed <> 0) then
              Result := S_OK
            else
              Result := DV_E_TYMED;
          end
          else
            Result := DV_E_DVASPECT;
        end
        else
          Result := DV_E_FORMATETC;
        Inc(i)
      end
    end
    else
      Result := E_UNEXPECTED;
  end;
end;

function TDropSource.CanonicalIUnknown(const TestUnknown: IUnknown): IUnknown;
// Uses COM object identity: An explicit call to the IUnknown::QueryInterface
// method, requesting the IUnknown interface, will always return the same
// pointer.
begin
  if Assigned(TestUnknown) then
  begin
    if Supports(TestUnknown, IUnknown, Result) then
      IUnknown(Result)._Release
      // Don't actually need it just need the pointer value
    else
      Result := TestUnknown
  end
  else
    Result := TestUnknown
end;

function TDropSource.SetData(const FormatEtc: TFormatEtc; var Medium: TStgMedium; fRelease: Bool): HRESULT;
var
  Index: Integer;
begin
  // See if we already have a format of that type available.
  Index := FindFormatEtc(FormatEtc);
  if Index > -1 then
  begin
    // Yes we already have that format type stored.  Just use the TClipboardFormat
    // in the List after releasing the data
    ReleaseStgMedium(Formats[Index].StgMedium);
    FillChar(Formats[Index].StgMedium, SizeOf(Formats[Index].StgMedium), #0);
  end
  else
  begin
    // It is a new format so create a new TDataObjectInfo record and store it in
    // the Format array
    SetLength(Formats, Length(Formats) + 1);
    Formats[Length(Formats) - 1].FormatEtc := FormatEtc;
    Index := Length(Formats) - 1;
  end;
  // The data is owned by the TClipboardFormat object
  Formats[Index].OwnedByDataObject := True;

  if fRelease then
  begin
    // We are simply being given the data and we take control of it.
    Formats[Index].StgMedium := Medium;
    Result := S_OK
  end
  else
    // We need to reference count or copy the data and keep our own references
    // to it.
    Result := StgMediumIncRef(Medium, Formats[Index].StgMedium, True);

  // Can get a circular reference if the client calls GetData then calls
  // SetData with the same StgMedium.  Because the unkForRelease and for
  // the IDataObject can be marshalled it is necessary to get pointers that
  // can be correctly compared.
  // See the IDragSourceHelper article by Raymond Chen at MSDN.
  if Assigned(MySTGMEDIUM(Formats[Index].StgMedium).UnkForRelease) then
  begin
    if CanonicalIUnknown(Self) = CanonicalIUnknown(IUnknown(MySTGMEDIUM(Formats[Index].StgMedium).UnkForRelease)) then
    begin
      IUnknown(MySTGMEDIUM(Formats[Index].StgMedium).UnkForRelease)._Release;
      MySTGMEDIUM(Formats[Index].StgMedium).UnkForRelease := nil
    end;
  end;
end;

{ Platform DragDrop }

function TPlatformWin.AllocTimerHandle(Wnd: HWND): TFmxHandle;
begin

end;

function TPlatformWin.AllocWndHandle(Wnd: HWND): TFmxHandle;
begin
  Result := NewFmxHandle;
end;

procedure TPlatformWin.BeginDragDrop(AForm: TCommonCustomForm; const Data: TDragObject; ABitmap: TBitmap);
var
  D: TDropSource;
  DropEffect: Longint;
  DragSourceHelper: IDragSourceHelper;
  SHDRAGIMAGE: TSHDRAGIMAGE;
begin
  D := TDropSource.Create(nil);
  try
    D.Data := Data;

    if (Succeeded(CoCreateInstance(CLSID_DragDropHelper, nil, CLSCTX_INPROC_SERVER, IDragSourceHelper, DragSourceHelper)))
      and (DragSourceHelper <> nil) then
    begin
      FillChar(SHDRAGIMAGE, SizeOf(SHDRAGIMAGE), 0);
      SHDRAGIMAGE.sizeDragImage.cx := ABitmap.Width;
      SHDRAGIMAGE.sizeDragImage.cy := ABitmap.Height;
      SHDRAGIMAGE.ptOffset.X := (ABitmap.Width div 2);
      SHDRAGIMAGE.ptOffset.Y := (ABitmap.Height div 2);
      SHDRAGIMAGE.hbmpDragImage := HBmpFromBitmap(ABitmap);
      if not Succeeded(DragSourceHelper.InitializeFromBitmap(@SHDRAGIMAGE, D)) then
        DeleteObject(SHDRAGIMAGE.hbmpDragImage);
    end;

    DoDragDrop(D, D, DROPEFFECT_LINK or DROPEFFECT_COPY or DROPEFFECT_MOVE, DropEffect);

    if Assigned(DragSourceHelper) then
      DragSourceHelper := nil;
  finally
    D.Free;
  end;
end;

{ Clipboard }

function TPlatformWin.GetClipboard: Variant;
var
  Data: THandle;
  W: string;
begin
  Result := NULL;
  OpenClipboard(0);
  Data := GetClipboardData(CF_UNICODETEXT);
  if Data <> 0 then
  begin
    W := PChar(GlobalLock(Data));
    Result := W;
    GlobalUnlock(Data);
  end;
  CloseClipboard;
end;

procedure TPlatformWin.SetClipboard(Value: Variant);
var
  Data: THandle;
  DataPtr: Pointer;
  W: string;
begin
  if not VarIsObject(Value) and VarIsStr(Value) then
  begin
    OpenClipboard(0);
    EmptyClipboard;
    try
      W := Value;
      Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, (Length(W) + 1) * 2);
      try
        DataPtr := GlobalLock(Data);
        try
          Move(PChar(W)^, DataPtr^, GlobalSize(Data));
          SetClipboardData(CF_UNICODETEXT, Data);
        finally
          GlobalUnlock(Data);
        end;
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipboard;
    end;
  end;
end;

{ Mouse }

procedure TPlatformWin.SetCursor(AForm: TCommonCustomForm; const ACursor: TCursor);
const
  CursorMap: array[crSizeAll..crArrow] of PChar = (
    IDC_SIZEALL, IDC_HAND, IDC_HELP, IDC_APPSTARTING, IDC_NO, {IDC_SQLWAIT}IDC_WAIT,
    {IDC_MULTIDRAG}IDC_ARROW, {IDC_VSPLIT}IDC_SIZENS, {IDC_HSPLIT}IDC_SIZEWE, {IDC_NODROP}IDC_NO, {IDC_DRAG}IDC_ARROW, IDC_WAIT,
    IDC_UPARROW, IDC_SIZEWE, IDC_SIZENWSE, IDC_SIZENS, IDC_SIZENESW, IDC_SIZEALL,
    IDC_IBEAM, IDC_CROSS, IDC_ARROW);
var
  C: HCursor;
begin
  if (ACursor < 0) then
  begin
    C := LoadCursorW(0, CursorMap[ACursor]);
    Winapi.Windows.SetCursor(C);
  end;
end;

function TPlatformWin.GetMousePos: TPointF;
var
  P: TPoint;
begin
  GetCursorPos(P);
  Result := PointF(P.X, P.Y);
end;

{ Screen }

function TPlatformWin.GetScreenSize: TPointF;
var
  WR: TRect;
begin
  Winapi.Windows.GetWindowRect(GetDesktopWindow, WR);
  Result := PointF(WR.Right, WR.Bottom);
end;

function TPlatformWin.GetCurrentLangID: string;
var
  buffer: array [1 .. 2] of {$IFDEF Wince}WideChar{$ELSE}Char{$ENDIF};
  UserLCID: LCID;
begin
  // defaults
  UserLCID := GetUserDefaultLCID;
  if GetLocaleInfo(UserLCID, LOCALE_SISO639LANGNAME, @buffer[1], 2) <> 0 then
    Result := buffer
  else
    Result := 'en'
end;

function TPlatformWin.GetDefaultFontFamilyName: String;
var
  VI: TOSVersionInfo;
begin
  FillChar(VI, SizeOf(VI), 0);
  VI.dwOSVersionInfoSize := SizeOf(VI);
  GetVersionEx(VI);
  if VI.dwMajorVersion >= 6 then
    Result := 'Segoe UI'
  else
    Result := 'Tahoma';
end;

function TPlatformWin.GetLocaleFirstDayOfWeek: string;
var
  buffer: array[0..1] of char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, buffer, SizeOf(buffer));
  Result:= buffer;
end;

procedure GetFileNames(var OpenFileName: TOpenFilenameW; var AFileName: TFileName; var AFiles: TStrings; AOptions: TOpenOptions);
var
  Separator: WideChar;

  function ExtractFileName(P: PChar; var S: TFilename): PChar;
  begin
    Result := AnsiStrScan(P, Separator);
    if Result = nil then
    begin
      S := P;
      Result := StrEnd(P);
    end
    else
    begin
      SetString(S, P, Result - P);
      Inc(Result);
    end;
  end;

  procedure ExtractFileNames(P: PChar);
  var
    DirName, FileName: TFilename;
  begin
    P := ExtractFileName(P, DirName);
    P := ExtractFileName(P, FileName);
    if FileName = '' then
      AFiles.Add(DirName)
    else
    begin
      if AnsiLastChar(DirName)^ <> '\' then
        DirName := DirName + '\';
      repeat
        if (FileName[1] <> '\') and ((Length(FileName) <= 3) or
          (FileName[2] <> ':') or (FileName[3] <> '\')) then
          FileName := DirName + FileName;
        AFiles.Add(FileName);
        P := ExtractFileName(P, FileName);
      until FileName = '';
    end;
  end;

begin
  Separator := #0;
  if (TOpenOption.ofAllowMultiSelect in AOptions) and
    (TOpenOption.ofOldStyleDialog in AOptions) then
    Separator := ' ';
  with OpenFileName do
  begin
    if TOpenOption.ofAllowMultiSelect in AOptions then
    begin
      ExtractFileNames(lpstrFile);
      AFileName := AFiles[0];
    end else
    begin
      ExtractFileName(lpstrFile, AFileName);
      AFiles.Add(AFileName);
    end;
  end;
end;

function DialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR; stdcall;
begin
  Result := 0;
end;

function TPlatformWin.DialogOpenFiles;
const
  FileNameBufferLen = 1000;
  OpenOptions: array [TOpenOption] of DWORD = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY,
    OFN_ENABLESIZING, OFN_DONTADDTORECENT, OFN_FORCESHOWHIDDEN);
var
  //Flags: DWORD;
  OpenFile: TOpenFilenameW;
  FileNameBuffer: PChar;
  FileNameBufferSize: Integer;
  InitialDir, Filter, DefaultExt: string;
  Option: TOpenOption;

  function AllocFilterStr(const s: string): string;
  var
    SepPos: Integer;
  begin
    Result := '';
    if s <> '' then
    begin
      Result := s + #0; // double null terminators
      SepPos := Pos('|', Result) - 1;
      while SepPos >= 0 do
      begin
        Result[SepPos + 1] := #0; // adjust because OP strings are 1-offset
        Inc(SepPos);
        SepPos := PosEx('|', Result, SepPos + 1) - 1;
      end;
      Result := Result + #0; // add final null terminator
    end;
  end;

begin
  Result := False;
  InitialDir := AInitDir;
  DefaultExt := ADefaultExt;
  Filter := AllocFilterStr(AFilter);
  if (FileName <> '') and (FileName[Length(FileName)] = PathDelim) then
  begin
    // if the filename contains a directory, set the initial directory
    // and clear the filename
    InitialDir := Copy(FileName, 1, Length(FileName) - 1);
    FileName := '';
  end;

  if (DefaultExt = '') or (DefaultExt = null) then
    DefaultExt := '*';

  FileNameBuffer := AllocMem(FileNameBufferLen * 2 + 2);

  if Length(FileName) > FileNameBufferLen then
    FileNameBufferSize := FileNameBufferLen
  else
    FileNameBufferSize := Length(FileName);

  Move(PChar(FileName)^, FileNameBuffer^, FileNameBufferSize * 2);

  if (Filter = '') or (Filter = null) then
     // Default -> avoid empty combobox
    Filter := 'All File Types(*.*)' + #0 + '*.*' + #0 + #0;

  AFiles.Clear;

  FillChar(OpenFile, SizeOf(OpenFile), 0);
  OpenFile.hInstance := hInstance;
  with OpenFile do
  begin
    lStructSize := SizeOf(OpenFile);
    hWndOwner := 0;

    nFilterIndex := 0;

    lpStrFile := FileNameBuffer;
    lpstrFilter := PChar(Filter);
    if ATitle <>'' then
      lpstrTitle := PChar(ATitle);
    lpstrInitialDir := PChar(InitialDir);
    lpstrDefExt := PChar(DefaultExt);
    lpStrFile := FileNameBuffer;

    nMaxFile := FileNameBufferLen + 1; // Size in TCHARs
    nFilterIndex := AFilterIndex;

    Flags := OFN_EXPLORER;
    for Option := Low(Option) to High(Option) do
      if Option in AOptions then
        Flags := Flags or OpenOptions[Option];

    if TOpenOption.ofOldStyleDialog in AOptions then
      begin
        Flags := Flags and (not OFN_EXPLORER);
        lpfnHook := DialogHook;
        Flags := Flags or OFN_ENABLEHOOK;
      end;
  end;

  Result := GetOpenFileNameW(OpenFile);

  if Result then
  begin
    FileName := FileNameBuffer;
    GetFileNames(OpenFile, FileName, AFiles, AOptions);
    if (OpenFile.flags and OFN_EXTENSIONDIFFERENT) <> 0 then
      Include(AOptions, TOpenOption.ofExtensionDifferent)
    else
      Exclude(AOptions, TOpenOption.ofExtensionDifferent);
    if (OpenFile.flags and OFN_READONLY) <> 0 then
      Include(AOptions, TOpenOption.ofReadOnly)
    else
      Exclude(AOptions, TOpenOption.ofReadOnly);
    AFilterIndex := OpenFile.nFilterIndex;
  end;
  FreeMem(FileNameBuffer);
end;


function TPlatformWin.DialogSaveFiles;
const
  FileNameBufferLen = 1000;
  OpenOptions: array [TOpenOption] of DWORD = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY,
    OFN_ENABLESIZING, OFN_DONTADDTORECENT, OFN_FORCESHOWHIDDEN);
var
  Flags: DWORD;
  SaveFile: TOpenFilenameW;
  FileNameBuffer: PChar;
  FileNameBufferSize: Integer;
  InitialDir, Filter, DefaultExt: string;
  Option: TOpenOption;

  function AllocFilterStr(const s: string): string;
  var
    SepPos: Integer;
  begin
    Result := '';
    if s <> '' then
    begin
      Result := s + #0; // double null terminators
      SepPos := Pos('|', Result) - 1;
      while SepPos >= 0 do
      begin
        Result[SepPos + 1] := #0; // adjust because OP strings are 1-offset
        Inc(SepPos);
        SepPos := PosEx('|', Result, SepPos + 1) - 1;
      end;
    end;
    Result := Result + #0; // add final null terminator
  end;

begin
  Result := False;
  InitialDir := AInitDir;
  DefaultExt := ADefaultExt;
  Filter := AllocFilterStr(AFilter);
  if (AFileName <> '') and (AFileName[Length(AFileName)] = PathDelim) then
  begin
    // if the filename contains a directory, set the initial directory
    // and clear the filename
    InitialDir := copy(AFileName, 1, Length(AFileName) - 1);
    AFileName := '';
  end;
  if (DefaultExt = '') or (DefaultExt = null) then
    DefaultExt := '*';

  FileNameBuffer := AllocMem(FileNameBufferLen * 2 + 2);

  if Length(AFileName) > FileNameBufferLen then
    FileNameBufferSize := FileNameBufferLen
  else
    FileNameBufferSize := Length(AFileName);

  Move(PChar(AFileName)^, FileNameBuffer^, FileNameBufferSize * 2);

  if (Filter = '') or (Filter = null) then
    Filter := 'All File Types(*.*)' + #0 + '*.*' + #0 + #0;
    // Default -> avoid empty combobox

   AFiles.Clear;

  FillChar(SaveFile, SizeOf(SaveFile), 0);
  SaveFile.hInstance := hInstance;
  with SaveFile do
  begin
    lStructSize := SizeOf(SaveFile);
    hWndOwner := 0;
    nFilterIndex := 0;

    lpStrFile := FileNameBuffer;
    lpstrFilter := PChar(Filter);
    if ATitle <>'' then
      lpstrTitle := PChar(ATitle);
    lpstrInitialDir := PChar(InitialDir);
    lpstrDefExt := PChar(DefaultExt);
    lpStrFile := FileNameBuffer;

    nMaxFile := FileNameBufferLen + 1; // Size in TCHARs
    nFilterIndex := AFilterIndex;

    Flags := OFN_EXPLORER;
    for Option := Low(Option) to High(Option) do
      if Option in AOptions then
        Flags := Flags or OpenOptions[Option];
    if TOpenOption.ofAllowMultiSelect in AOptions then
      Flags := Flags or OFN_ALLOWMULTISELECT;
  end;

  Result := GetSaveFileName(SaveFile);

  if Result then begin
    AFileName := FileNameBuffer;
  GetFileNames(SaveFile, AFileName, AFiles, AOptions);
  if (flags and OFN_EXTENSIONDIFFERENT) <> 0 then
    Include(AOptions, TOpenOption.ofExtensionDifferent)
  else
    Exclude(AOptions, TOpenOption.ofExtensionDifferent);
  if (flags and OFN_READONLY) <> 0 then
    Include(AOptions, TOpenOption.ofReadOnly)
  else
    Exclude(AOptions, TOpenOption.ofReadOnly);
  with SaveFile do
    AFilterIndex := nFilterIndex;
	end;
  FreeMem(FileNameBuffer);
end;

procedure GetPrinter(var DeviceMode, DeviceNames: HGLOBAL);
var
  Device, Driver, Port: array[0..1023] of char;
  DevNames: PDevNames;
  Offset: PChar;
begin
  (Printer as TPrinterWin).GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNames) +
     (StrLen(Device) + StrLen(Driver) + StrLen(Port) + 3) * SizeOf(Char));
    DevNames := PDevNames(GlobalLock(DeviceNames));
    try
      Offset := PChar(PByte(DevNames) + SizeOf(TDevnames));
      with DevNames^ do
      begin
        wDriverOffset := Offset - PChar(DevNames);
        Offset := StrECopy(Offset, Driver) + 1;
        wDeviceOffset := Offset - PChar(DevNames);
        Offset := StrECopy(Offset, Device) + 1;
        wOutputOffset := Offset - PChar(DevNames);;
        StrCopy(Offset, Port);
      end;
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;

procedure SetPrinter(DeviceMode, DeviceNames: HGLOBAL);
var
  DevNames: PDevNames;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    with DevNames^ do
      (Printer as TPrinterWin).SetPrinter(PChar(DevNames) + wDeviceOffset,
        PChar(DevNames) + wDriverOffset,
        PChar(DevNames) + wOutputOffset, DeviceMode);
  finally
    GlobalUnlock(DeviceNames);
    GlobalFree(DeviceNames);
  end;
end;

function CopyData(Handle: THandle): THandle;
var
  Src, Dest: PChar;
  Size: Integer;
begin
  if Handle <> 0 then
  begin
    Size := GlobalSize(Handle);
    Result := GlobalAlloc(GHND, Size);
    if Result <> 0 then
      try
        Src := GlobalLock(Handle);
        Dest := GlobalLock(Result);
        if (Src <> nil) and (Dest <> nil) then Move(Src^, Dest^, Size);
      finally
        GlobalUnlock(Handle);
        GlobalUnlock(Result);
      end
  end
  else
    Result := 0;
end;

function TPlatformWin.DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean;
const
  PrintRanges: array [TPrintRange] of Integer = (PD_ALLPAGES, PD_SELECTION,
    PD_PAGENUMS);
var
  PrintDlgRec: TPrintDlg;
  DevHandle: HGLOBAL;
begin
  Result := False;
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  PrintDlgRec.hInstance := hInstance;
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);
    hWndOwner := 0;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    flags := PrintRanges[APrintRange];
    if ACollate then
      Inc(flags, PD_COLLATE);
    if not(TPrintDialogOption.poPrintToFile in AOptions) then
      Inc(flags, PD_HIDEPRINTTOFILE);
    if not(TPrintDialogOption.poPageNums in AOptions) then
      Inc(flags, PD_NOPAGENUMS);
    if not(TPrintDialogOption.poSelection in AOptions) then
      Inc(flags, PD_NOSELECTION);
    if TPrintDialogOption.poDisablePrintToFile in AOptions then
      Inc(flags, PD_DISABLEPRINTTOFILE);
    if APrintToFile then
      Inc(flags, PD_PRINTTOFILE);
    if TPrintDialogOption.poHelp in AOptions then
      Inc(flags, PD_SHOWHELP);
    if not(TPrintDialogOption.poWarning in AOptions) then
      Inc(flags, PD_NOWARNING);
    nFromPage := AFromPage;
    nToPage := AToPage;
    nMinPage := AMinPage;
    nMaxPage := AMaxPage;
  end;
  Result := PrintDlg(PrintDlgRec);
  with PrintDlgRec do
  begin
    if Result then
    begin
      SetPrinter(hDevMode, hDevNames);
      ACollate := flags and PD_COLLATE <> 0;
      APrintToFile := flags and PD_PRINTTOFILE <> 0;
      if flags and PD_SELECTION <> 0 then
        APrintRange := TPrintRange.prSelection
      else if flags and PD_PAGENUMS <> 0 then
        APrintRange := TPrintRange.prPageNums
      else
        APrintRange := TPrintRange.prAllPages;
      AFromPage := nFromPage;
      AToPage := nToPage;
//      if nCopies = 1 then
//        Copies := Printer.Copies
//      else
//        Copies := nCopies;
    end
    else
    begin
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;

function TPlatformWin.DialogPrinterSetup: Boolean;
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
begin
  Result := FALSE;
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);
    hInstance := SysInit.HInstance;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PD_PRINTSETUP;

    Result := PrintDlg(PrintDlgRec);

    if Result then
      SetPrinter(hDevMode, hDevNames)
    else begin
      if hDevMode <> 0 then GlobalFree(hDevMode);
      if hDevNames <> 0 then GlobalFree(hDevNames);
    end;
  end;
end;

function TPlatformWin.PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF; AUnits: TPageMeasureUnits;
  AOptions: TPageSetupDialogOptions): Boolean;
var
  PageSetupDlgRec: TPageSetupDlg;
begin
  Result := False;
  if TPrinterWin(Printer).Count = 0 then
    Exit;

  FillChar(PageSetupDlgRec, SizeOf(PageSetupDlgRec), 0);
  with PageSetupDlgRec do
  begin
    lStructSize := SizeOf(PageSetupDlgRec);
    hInstance := SysInit.hInstance;
    case AUnits of
      // pmDefault    : Read from locale settings by the dialog
      TPageMeasureUnits.pmInches:
        Inc(flags, PSD_INTHOUSANDTHSOFINCHES);
      TPageMeasureUnits.pmMillimeters:
        Inc(flags, PSD_INHUNDREDTHSOFMILLIMETERS);
    end;
    if TPageSetupDialogOption.psoDefaultMinMargins in AOptions then
      Inc(flags, PSD_DEFAULTMINMARGINS);
    if TPageSetupDialogOption.psoDisableMargins in AOptions then
      Inc(flags, PSD_DISABLEMARGINS);
    if TPageSetupDialogOption.psoDisableOrientation in AOptions then
      Inc(flags, PSD_DISABLEORIENTATION);
    if TPageSetupDialogOption.psoDisablePagePainting in AOptions then
      Inc(flags, PSD_DISABLEPAGEPAINTING);
    if TPageSetupDialogOption.psoDisablePaper in AOptions then
      Inc(flags, PSD_DISABLEPAPER);
    if TPageSetupDialogOption.psoDisablePrinter in AOptions then
      Inc(flags, PSD_DISABLEPRINTER);

    ptPaperSize.X := Round(APaperSize.X);
    ptPaperSize.Y := Round(APaperSize.Y);
    rtMinMargin.Left := AMinMargin.Left;
    rtMinMargin.Top := AMinMargin.Top;
    rtMinMargin.Right := AMinMargin.Right;
    rtMinMargin.Bottom := AMinMargin.Bottom;
    rtMargin.Left := AMargin.Left;
    rtMargin.Top := AMargin.Top;
    rtMargin.Right := AMargin.Right;
    rtMargin.Bottom := AMargin.Bottom;

    Flags := Flags or PSD_RETURNDEFAULT;
    hDevNames := 0;
    hDevMode := 0;
    Result := PageSetupDlg(PageSetupDlgRec);

    if Result then
    begin
      APaperSize.X := ptPaperSize.X;
      APaperSize.Y := ptPaperSize.Y;
      AMargin.Left := rtMargin.Left;
      AMargin.Top := rtMargin.Top;
      AMargin.Right := rtMargin.Right;
      AMargin.Bottom := rtMargin.Bottom;
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;

function TPlatformWin.DialogPageSetup(var AMargin, AMinMargin: TRect;
  var APaperSize: TPointF; var AUnits: TPageMeasureUnits;
  AOptions: TPageSetupDialogOptions): Boolean;
var
  FPageSetupDlgRec: TPageSetupDlg;
  DevHandle: THandle;
begin
  Result := False;
  FillChar(FPageSetupDlgRec, SizeOf(FPageSetupDlgRec), 0);
  with FPageSetupDlgRec do
  begin
    lStructSize := SizeOf(FPageSetupDlgRec);
    hInstance := SysInit.hInstance;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);

    case AUnits of
      TPageMeasureUnits.pmInches:
        Inc(flags, PSD_INTHOUSANDTHSOFINCHES);
      TPageMeasureUnits.pmMillimeters:
        Inc(flags, PSD_INHUNDREDTHSOFMILLIMETERS);
    end;
    if TPageSetupDialogOption.psoDefaultMinMargins in AOptions then
      Inc(flags, PSD_DEFAULTMINMARGINS);
    if TPageSetupDialogOption.psoDisableMargins in AOptions then
      Inc(flags, PSD_DisableMargins);
    if TPageSetupDialogOption.psoDisableOrientation in AOptions then
      Inc(flags, PSD_DISABLEORIENTATION);
    if TPageSetupDialogOption.psoDisablePagePainting in AOptions then
      Inc(flags, PSD_DISABLEPAGEPAINTING);
    if TPageSetupDialogOption.psoDisablePaper in AOptions then
      Inc(flags, PSD_DISABLEPAPER);
    if TPageSetupDialogOption.psoDisablePrinter in AOptions then
      Inc(flags, PSD_DISABLEPRINTER);
    if TPageSetupDialogOption.psoMargins in AOptions then
    begin
      Inc(flags, PSD_MARGINS);
      rtMargin.Left := AMargin.Left;
      rtMargin.Top := AMargin.Top;
      rtMargin.Right := AMargin.Right;
      rtMargin.Bottom := AMargin.Bottom;
    end;
    if TPageSetupDialogOption.psoMinMargins in AOptions then
    begin
      Inc(flags, PSD_MINMARGINS);
      rtMinMargin.Left := AMinMargin.Left;
      rtMinMargin.Top := AMinMargin.Top;
      rtMinMargin.Right := AMinMargin.Right;
      rtMinMargin.Bottom := AMinMargin.Bottom;
    end;
    if TPageSetupDialogOption.psoShowHelp in AOptions then
      Inc(flags, PSD_SHOWHELP);
    if not(TPageSetupDialogOption.psoWarning in AOptions) then
      Inc(flags, PSD_NOWARNING);
    if TPageSetupDialogOption.psoNoNetworkButton in AOptions then
      Inc(flags, PSD_NONETWORKBUTTON);

    // Set the user defined margins and page size
    // ptPaperSize.X := APaperSize.X;
    // ptPaperSize.Y := APaperSize.Y;
  end;

  Result := PageSetupDlg(FPageSetupDlgRec);

  with FPageSetupDlgRec do
  begin
    if Result then
    begin
      APaperSize.X := ptPaperSize.X;
      APaperSize.Y := ptPaperSize.Y;
      AMargin.Left := rtMargin.Left;
      AMargin.Top := rtMargin.Top;
      AMargin.Right := rtMargin.Right;
      AMargin.Bottom := rtMargin.Bottom;
      SetPrinter(hDevMode, hDevNames)
    end
    else
    begin
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;

initialization
  OleInitialize(nil);
finalization
end.
