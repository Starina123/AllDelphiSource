{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Memo;

{$I FMX.Defines.inc}

interface

uses
  System.Classes, System.Contnrs, System.Types, System.UITypes,
  FMX.Types, FMX.Controls, FMX.Layouts, FMX.Platform, FMX.Menus;

{$SCOPEDENUMS ON}

type

  TInsertOption = (ioSelected, ioMoveCaret, ioCanUndo, ioUndoPairedWithPrev);
  TInsertOptions = set of TInsertOption;
  TDeleteOption = (doMoveCaret, doCanUndo);
  TDeleteOptions = set of TDeleteOption;

  TActionType = (atDelete, atInsert);

  TLinesBegins = array of Integer;
  PLinesBegins = ^TLinesBegins;

  TCaretPosition = record
    Line, Pos: Integer;
  end;

  TEditAction = record
    ActionType: TActionType;
    PairedWithPrev: Boolean;
    StartPosition: Integer;
    DeletedFragment: string; { For atDelete }
    Length: Integer; { For atInsert }
  end;
  PEditAction = ^TEditAction;

  TMemo = class;

{ TEditActionStack }

  TEditActionStack = class(TStack)
  private
    FOwner: TMemo;
  public
    constructor Create(AOwner: TMemo);
    destructor Destroy; override;

    procedure FragmentInserted(StartPos, FragmentLength: Integer;
      IsPairedWithPrev: Boolean);
    procedure FragmentDeleted(StartPos: Integer; const Fragment: string);
    procedure CaretMovedBy(Shift: Integer);

    function RollBackAction: Boolean;
  end;

{ TMemo }

  TSelArea = array of TRectF;

  TMemo = class(TScrollBox, ITextServiceControl, IVirtualKeyboardControl)
  private
    FNeedChange: Boolean;
    FTextService: TTextService;
    FFontFill: TBrush;
    FFont: TFont;
    FTextAlign: TTextAlign;
    FInternalMustUpdateLines: Boolean;
    FLMouseSelecting: Boolean;
    FOldMPt: TPointF;
    FCaretPosition: TCaretPosition;
    FFirstVisibleChar: Integer;
    FUnwrapLines: TStrings;
    FMemoPopupMenu: TPopupMenu;
    FAutoSelect: Boolean;
    FCharCase: TEditCharCase;
    FHideSelection: Boolean;
    FMaxLength: Integer;
    FReadOnly: Boolean;
    FOnChange: TNotifyEvent;
    FActionStack: TEditActionStack;
    FLines: TStrings;
    FWordWrap: Boolean;
    FLinesBegs: array of Integer;
    FTextWidth: array of Single;
    FCachedFillText: TFillTextFlags;
    FSelStart: TCaretPosition;
    FSelEnd: TCaretPosition;
    FSelected: Boolean;
    FOldSelStartPos, FOldSelEndPos, FOldCaretPos: Integer;
    FSelectionFill: TBrush;
    FOnChangeTracking: TNotifyEvent;
    FContent: TControl;
    FKeyboardType: TVirtualKeyboardType;
    FEmptyFirstLine: boolean;
    function GetSelBeg: TCaretPosition;
    function GetSelEnd: TCaretPosition;
    procedure StorePositions;
    procedure ReadTextData(Reader: TReader);
    procedure RestorePositions;
    procedure SelectAtPos(APos: TCaretPosition);
    procedure SetCaretPosition(const Value: TCaretPosition);
    procedure SetSelLength(const Value: Integer);
    procedure SetSelStart(const Value: Integer);
    function GetSelStart: Integer;
    function GetSelLength: Integer;
    procedure UpdateHScrlBarByCaretPos;
    procedure UpdateVScrlBarByCaretPos;
    function GetSelText: string;
    procedure SetAutoSelect(const Value: Boolean);
    procedure SetCharCase(const Value: TEditCharCase);
    procedure SetHideSelection(const Value: Boolean);
    procedure SetMaxLength(const Value: Integer);
    procedure SelectAtMousePoint;
    function GetNextWordBegin(StartPosition: TCaretPosition): TCaretPosition;
    function GetPrevWordBegin(StartPosition: TCaretPosition): TCaretPosition;
    function GetPositionShift(APos: TCaretPosition; Delta: Integer { char count } ): TCaretPosition;
    procedure MoveCareteBy(Delta: Integer);
    procedure MoveCaretLeft;
    procedure MoveCaretRight;
    procedure MoveCaretVertical(LineDelta: Integer);
    procedure MoveCaretDown;
    procedure MoveCaretUp;
    procedure MoveCaretPageUp;
    procedure MoveCaretPageDown;
    procedure UpdateCaretPosition(UpdateScrllBars: Boolean);
    procedure SetLines(const Value: TStrings);
    procedure GetLineBounds(LineIndex: Integer;
      var LineBeg, LineLength: Integer);
    function GetLineCount: Integer;
    function GetLine(Index: Integer): string;
    // Returns Line without special symbols at the end.
    function GetLineInternal(Index: Integer): string;
    // Returns Line with special symbols at the end.
    procedure InsertLine(Index: Integer; const S: string);
    procedure DeleteLine(Index: Integer);
    procedure ClearLines;
    procedure SetWordWrap(const Value: Boolean);
    function GetPageSize: Single;
    procedure ResetLineWidthCache;
    function GetLineWidth(LineNum: Integer): Single;
    function GetWidestLine: Integer;
    function FillLocalLinesBegs(PText: PString; ABegChar, AEndChar: Integer;
      TmpLinesBegs: PLinesBegins): Integer;
    procedure UpdateRngLinesBegs(PText: PString;
      AUpdBegLine, AUpdEndLine, AUpdBegChar, AUpdEndChar, ACharDelta,
      AOldWidestLineWidth: Integer);
    function GetShowSelection: Boolean;
    function GetLineRealEnd(AStartPos: TCaretPosition; PText: PString)
      : TCaretPosition;
    procedure SetFont(const Value: TFont);
    procedure SetFontFill( const Value: TBrush);
    procedure SetTextAlign(const Value: TTextAlign);
    function TextWidth(const Str: string): Single;
    procedure HScrlBarChange(Sender: TObject);
    procedure SetUpdateState(Updating: Boolean);
    function GetUnwrapLines: TStrings;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    function GetImeMode: TImeMode; virtual;
    procedure SetImeMode(const Value: TImeMode); virtual;
    { ITextServiceControl }
    function GetTextService: TTextService; virtual;
    procedure UpdateCaretPoint; virtual;
    function GetTargetClausePointF: TPointF;
    { IVirtualKeyboardControl }
    procedure SetKeyboardType(Value: TVirtualKeyboardType);
    function GetKeyboardType: TVirtualKeyboardType;
  protected
    FOffScreenBitmap: TBitmap;
    FInternalUpdating: Boolean;
    FWidestLineIndex: Integer;
    function CanObserve(const ID: Integer): Boolean; override;
    function GetLineHeight: Single;
    function GetPointPosition(Pt: TPointF): TCaretPosition;
    function GetText: string; virtual;
    procedure SetText(const Value: string); virtual;
    function GetSelArea: TSelArea; virtual;
    procedure DrawPasswordChar(SymbolRect: TRectF; Selected: Boolean); virtual;
    procedure CreatePopupMenu; virtual;
    procedure UpdatePopupMenuItems; virtual;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function ContentPos: TPointF;
    procedure Change; virtual;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure DoContentPaintWithCache(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    function ValidText(const NewText: string): Boolean; virtual;
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
    // override;
    procedure ContextMenu(const ScreenPosition: TPointF); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure HScrollChange(Sender: TObject); override;
    procedure VScrollChange(Sender: TObject); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; x, y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; x, y: Single); override;
    procedure MouseMove(Shift: TShiftState; x, y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure SelectWord;
    procedure FontChanged(Sender: TObject);
    procedure DoUndo(Sender: TObject);
    procedure DoCut(Sender: TObject);
    procedure DoCopy(Sender: TObject);
    procedure DoPaste(Sender: TObject);
    procedure DoDelete(Sender: TObject);
    procedure DoSelectAll(Sender: TObject);
    procedure UpdateLines;
    procedure RepaintEdit;
    { inherited }
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function GetContentBounds: TRectF; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CopyToClipboard;
    procedure PasteFromClipboard;
    procedure CutToClipboard;
    procedure ClearSelection;
    procedure SelectAll;
    procedure GoToTextEnd;
    procedure GoToTextBegin;
    procedure GotoLineEnd;
    procedure GoToLineBegin;
    function GetPositionPoint(ACaretPos: TCaretPosition): TPointF;
    procedure UnDo;
    procedure InsertAfter(Position: TCaretPosition; const S: string; Options: TInsertOptions);
    procedure DeleteFrom(Position: TCaretPosition; ALength: Integer; Options: TDeleteOptions);
    function TextPosToPos(APos: Integer): TCaretPosition;
    function PosToTextPos(APostion: TCaretPosition): Integer;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelText: string read GetSelText;
    property Text: string read GetText write SetText;
    property CaretPosition: TCaretPosition read FCaretPosition write SetCaretPosition;
    property LineWidth[LineNum: Integer]: Single read GetLineWidth;
    { return unwrapped lines }
    property UnwrapLines: TStrings read GetUnwrapLines;
    { custom colors - only work when style was loaded }
    property FontFill: TBrush read FFontFill write setFontFill;
    property SelectionFill: TBrush read FSelectionFill;
  published
    property Cursor default crIBeam;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property AutoSelect: Boolean read FAutoSelect write SetAutoSelect default True;
    property CharCase: TEditCharCase read FCharCase write SetCharCase default TEditCharCase.ecNormal;
    property Enabled;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property Lines: TStrings read FLines write SetLines;
    property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeTracking: TNotifyEvent read FOnChangeTracking write FOnChangeTracking;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property Font: TFont read FFont write SetFont;
    property TextAlign: TTextAlign read FTextAlign write SetTextAlign default TTextAlign.taLeading;
    property StyleLookup;
    property KeyboardType: TVirtualKeyboardType read GetKeyboardType write SetKeyboardType;
    property ImeMode: TImeMode read GetImeMode write SetImeMode default TImeMode.imDontCare;
  end;

function ComposeCaretPos(ALine, APos: Integer): TCaretPosition;

implementation

uses
  System.SysUtils, System.Variants, FMX.Consts;

type

{ TMemoLines }

  TMemoLines = class(TStrings)
  private
    FMemo: TMemo;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

procedure TMemoLines.Clear;
begin
  FMemo.ClearLines;
  FMemo.Change;
end;

procedure TMemoLines.Delete(Index: Integer);
begin
  FMemo.DeleteLine(Index);
  FMemo.Change;
end;

procedure TMemoLines.Insert(Index: Integer; const S: string);
begin
  FMemo.InsertLine(Index, S);
  FMemo.Change;
end;

function TMemoLines.Get(Index: Integer): string;
begin
  Result := FMemo.GetLine(Index);
end;

function TMemoLines.GetCount: Integer;
begin
  Result := FMemo.GetLineCount;
end;

procedure TMemoLines.SetUpdateState(Updating: Boolean);
begin
  inherited;
  FMemo.SetUpdateState(Updating);
end;

function ComposeCaretPos(ALine, APos: Integer): TCaretPosition;
begin
  with Result do
  begin
    Line := ALine;
    Pos := APos;
  end;
end;

{ TMemo }

constructor TMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextService := Platform.GetTextServiceClass.Create(self, True);
  FTextAlign := TTextAlign.taLeading;
  FFont := TFont.Create;
  FFont.OnChanged := FontChanged;
  FFontFill := TBrush.Create(TBrushKind.bkSolid, $FF000000);
  FFontFill.OnChanged := FontChanged;
  FSelectionFill := TBrush.Create(TBrushKind.bkSolid, $802A8ADF);
  FLines := TMemoLines.Create;
  FKeyboardType := TVirtualKeyboardType.vktDefault;
  (FLines as TMemoLines).FMemo := Self;
  CanFocus := True;
  Cursor := crIBeam;
  FInternalMustUpdateLines := True;

  CreatePopupMenu;

  FActionStack := TEditActionStack.Create(Self);

  FAutoSelect := True;
  FCharCase := TEditCharCase.ecNormal;
  FHideSelection := True;
  FMaxLength := 0;
  FReadOnly := False;

  FLMouseSelecting := False;
  FOldMPt := PointF(0, 0);

  FInternalUpdating := False;

  with FCaretPosition do
  begin
    Line := 0;
    Pos := 0;
  end;
  FTextService.ImeMode := TImeMode.imDontCare;

  FSelStart := ComposeCaretPos(0, 0);
  FSelEnd := ComposeCaretPos(0, 0);
  FSelected := False;

  FOldSelStartPos := -1;
  FOldSelEndPos := -1;
  FOldCaretPos := -1;

  AutoCapture := True;

  FWidestLineIndex := 0;
  FCachedFillText := [];
  SetLength(FTextWidth, 0);

  Width := 100;
  SetAcceptsControls(False);
end;

destructor TMemo.Destroy;
begin
  FreeAndNil(FOffScreenBitmap);
  if FUnwrapLines <> nil then
    FUnwrapLines.Free;
  FSelectionFill.Free;
  FFontFill.Free;
  FFont.Free;
  FActionStack.Free;
{$IFNDEF NOVCL}
  FMemoPopupMenu.Free;
{$ENDIF}
  FLines.Free;
  FTextService.Free;
  inherited;
end;

procedure TMemo.DoEnter;
begin
  inherited;
  FNeedChange := False;
  UpdateCaretPosition(False);
  ShowCaretProc;
  if Platform.ShowVirtualKeyboard(Self) then
  begin
    CaretPosition := TextPosToPos(Length(Text));
  end
  else
  begin
    with FCaretPosition do
    begin
      Line := 0;
      Pos := 0;
    end;
    if AutoSelect then
      SelectAll;
  end;
end;

procedure TMemo.DoExit;
begin
  Platform.HideVirtualKeyboard;
  inherited;
  HideCaret;
  FreeAndNil(FOffScreenBitmap);
  Change;

  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
end;

function TMemo.TextWidth(const Str: string): Single;
var
  R: TRectF;
begin
  R := ContentRect;
  R.Right := 10000;
  Canvas.Font.Assign(Font);
  Canvas.MeasureText(R, Str, False, FillTextFlags, TextAlign, TTextAlign.taCenter);
  Result := RectWidth(R);
end;

function TMemo.GetPositionPoint(ACaretPos: TCaretPosition): TPointF;
var
  WholeTextWidth: Single;
  EditRectWidth: Single;
  LineText: string;
begin
  Result.x := ContentRect.Left;
  Result.y := ContentRect.Top + (GetLineHeight * ACaretPos.Line) -
    VScrollBarValue;
  WholeTextWidth := 0;
  if Canvas = nil then
    Exit;

  if ((ACaretPos.Line < Lines.Count) and (Lines.Count > 0)) or FTextService.HasMarkedText then
  begin
    if FTextService.HasMarkedText then
    begin
      LineText := Lines[ACaretPos.Line];
      LineText := Copy(LineText, 1, FCaretPosition.Pos) + FTextService.InternalGetMarkedText + Copy(LineText, FCaretPosition.Pos + 1, MaxInt);
      WholeTextWidth := TextWidth(LineText);
    end
    else
    begin
      LineText := Lines[ACaretPos.Line];
      WholeTextWidth := LineWidth[ACaretPos.Line];
    end;

    if ACaretPos.Pos > 0 then
    begin
      if ACaretPos.Pos <= Length(LineText) then
        Result.x := Result.x + TextWidth(Copy(LineText, 1, ACaretPos.Pos))
      else
        Result.x := Result.x + WholeTextWidth;
    end;
  end;
  EditRectWidth := ContentRect.Right - ContentRect.Left;
  if WholeTextWidth < EditRectWidth then
    case FTextAlign of
      TTextAlign.taTrailing:
        Result.x := Result.x + (EditRectWidth - WholeTextWidth);
      TTextAlign.taCenter:
        Result.x := Result.x + ((EditRectWidth - WholeTextWidth) / 2);
    end;
  Result.x := Result.x - HScrollBarValue;
end;

function TMemo.GetPointPosition(Pt: TPointF): TCaretPosition;
var
  CurX: double;
  TmpX, WholeTextWidth, EditRectWidth: Single;
  LineText: string;
  LLine: Integer;
  LPos: Integer;
  TmpPt: TPointF;
  LEdiTRect: TRectF;
begin
  with Result do
  begin
    Line := 0;
    Pos := 0;
  end;

  if Lines.Count <= 0 then
    Exit;

  LEdiTRect := ContentRect;

  with LEdiTRect, Pt do
  begin
    if x < Left then
      TmpPt.x := Left
    else if x > Right then
      TmpPt.x := Right
    else
      TmpPt.x := x;

    if y < Top then
      TmpPt.y := Top
    else if y > Bottom then
      TmpPt.y := Bottom
    else
      TmpPt.y := y;
  end;

  LLine := Trunc((TmpPt.y - ContentRect.Top + VScrollBarValue) / GetLineHeight);
  LPos := 0;

  if LLine > Lines.Count - 1 then
    LLine := Lines.Count - 1;

  LineText := Lines[LLine];

  if Length(LineText) > 0 then
  begin
    WholeTextWidth := LineWidth[LLine];

    EditRectWidth := ContentRect.Right - ContentRect.Left;
    TmpX := TmpPt.x;
    if WholeTextWidth < EditRectWidth then
      case TextAlign of
        TTextAlign.taTrailing:
          TmpX := TmpPt.x - (EditRectWidth - WholeTextWidth);
        TTextAlign.taCenter:
          TmpX := TmpPt.x - ((EditRectWidth - WholeTextWidth) / 2);
      end;

    TmpX := TmpX + HScrollBarValue;

    CurX := ContentRect.Left + TextWidth(LineText[1]) / 2;
    while (CurX < TmpX) and (LPos + 1 <= Length(LineText)) and
      (CurX < ContentRect.Right + HScrollBarValue) do
    begin
      CurX := ContentRect.Left + TextWidth(Copy(LineText, 1, LPos + 1)) +
        (Font.Size / 4);
      Inc(LPos);
    end;
  end;
  with Result do
  begin
    Line := LLine;
    Pos := LPos;
  end;
end;

procedure TMemo.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  TmpS: string;
  OldCaretPosition: TCaretPosition;
  WasSelection: Boolean;
  LTmpOptions: TInsertOptions;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if (Key = vkBack) or (Key = vkDelete) or ((Key = vkInsert) and (ssShift in Shift)) then
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
      begin
        TLinkObservers.EditLinkReset(Observers);
        Exit;
      end;

    if (KeyChar >= #32) and
      not TLinkObservers.EditLinkIsValidChar(Observers, KeyChar) then
    begin
//      MessageBeep(0);
      KeyChar := #0;
      Exit;
    end;
    case KeyChar of
      ^H, ^V, ^X, #32..High(Char):
        if not TLinkObservers.EditLinkEdit(Observers) then
        begin
          KeyChar := #0;
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end
        else
          TLinkObservers.EditLinkModified(Observers);
      #27:
        begin
          TLinkObservers.EditLinkReset(Observers);
          SelectAll;
          KeyChar := #0;
          Exit;
        end;
    end;
  end;

  inherited KeyDown(Key, KeyChar, Shift);
  OldCaretPosition := CaretPosition;
  if (Key = vkReturn) then
  begin
    WasSelection := SelLength > 0;
    if WasSelection then
      DeleteFrom(GetSelBeg, SelLength,
        [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo] { True,True, False } );
    if WasSelection then
      LTmpOptions := [TInsertOption.ioUndoPairedWithPrev]
    else
      LTmpOptions := [];
    TmpS := sLineBreak;
    InsertAfter(CaretPosition, TmpS, LTmpOptions + [TInsertOption.ioMoveCaret, TInsertOption.ioCanUndo]
      { False, True, True, WasSelection } );
    SelLength := 0;
    Key := 0;
  end;
  case Key of
    vkEnd:
      if ssCtrl in Shift then
        GoToTextEnd
      else
        GotoLineEnd;
    vkHome:
      if ssCtrl in Shift then
        GoToTextBegin
      else
        GoToLineBegin;
    vkLeft:
      if ssCtrl in Shift then
        // CaretPosition := TextPosToPos(FTextService.GetPrevWordBeginPosition(PosToTextPos(CaretPosition)))
        CaretPosition := GetPrevWordBegin(CaretPosition)
      else
        // CaretPosition := TextPosToPos(FTextService.GetPrevCharacterPosition(PosToTextPos(CaretPosition)));
        MoveCaretLeft;
    vkRight:
      if ssCtrl in Shift then
        // CaretPosition := TextPosToPos(FTextService.GetNextWordBeginPosition(PosToTextPos(CaretPosition)))
        CaretPosition := GetNextWordBegin(CaretPosition)
      else
        // CaretPosition := TextPosToPos(FTextService.GetNextCharacterPosition(PosToTextPos(CaretPosition)));
        MoveCaretRight;
    vkUp:
      MoveCaretUp;
    vkDown:
      MoveCaretDown;
    vkPrior:
      MoveCaretPageUp;
    vkNext:
      MoveCaretPageDown;
    vkDelete, 8: { Delete or BackSpace key was pressed }
      if not ReadOnly then
      begin
        if SelLength <> 0 then
        begin
          if ssShift in Shift then
            CutToClipboard
          else
            ClearSelection;
        end
        else
        begin
          TmpS := Text;
          if Key = vkDelete then
            DeleteFrom(CaretPosition, 1, [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo])
          else { BackSpace key was pressed }
            if PosToTextPos(CaretPosition) > 0 then
              DeleteFrom(GetPositionShift(CaretPosition, -1), 1,
                [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo]);
        end;
      end;
    vkInsert:
      if ssCtrl in Shift then
        CopyToClipboard
      else if ssShift in Shift then
        PasteFromClipboard;
  end;

  if Shift = [ssCtrl] then
    case KeyChar of
      ^A:
        begin
          SelectAll;
          KeyChar := #0;
        end;
      ^C:
        begin
          CopyToClipboard;
          KeyChar := #0;
        end;
      ^V:
        begin
          PasteFromClipboard;
          KeyChar := #0;
        end;
      ^X:
        begin
          CutToClipboard;
          KeyChar := #0;
        end;
      ^Z:
        begin
          KeyChar := #0;
        end;
    end;
  {$IFNDEF FPC}
  if Shift = [ssCommand] then
    case KeyChar of
      'a','A':
        begin
          SelectAll;
          KeyChar := #0;
        end;
      'c','C':
        begin
          CopyToClipboard;
          KeyChar := #0;
        end;
      'v','V':
        begin
          PasteFromClipboard;
          KeyChar := #0;
        end;
      'x','X':
        begin
          CutToClipboard;
          KeyChar := #0;
        end;
      'z','Z':
        begin
          KeyChar := #0;
        end;
    end;
  {$ENDIF}

  if (Ord(KeyChar) >= 32) and not ReadOnly then
  begin
    WasSelection := SelLength > 0;
    if WasSelection then
      DeleteFrom(GetSelBeg, SelLength,
        [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo] { True,True, False } );
    if WasSelection then
      LTmpOptions := [TInsertOption.ioUndoPairedWithPrev]
    else
      LTmpOptions := [];
    if KeyChar <> #13 then
    begin
      InsertAfter(CaretPosition, KeyChar, LTmpOptions + [TInsertOption.ioMoveCaret, TInsertOption.ioCanUndo]
        { False, True, True, WasSelection } );
    end;
    SelLength := 0;
    KeyChar := #0;
  end;

  if Key in [vkEnd, vkHome, vkLeft, vkRight, vkUp, vkDown, vkPrior, vkNext] then
  begin
    if ssShift in Shift then
    begin
      if not FSelected then
        SelectAtPos(OldCaretPosition);
      SelectAtPos(CaretPosition);
      RepaintEdit;
    end
    else if FSelected then
    begin
      FSelected := False;
      RepaintEdit;
    end;
  end;
  UpdateCaretPosition(True);
end;

procedure TMemo.MouseDown(Button: TMouseButton; Shift: TShiftState; x, y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and (ssDouble in Shift) then
  begin
    if PointInRect(PointF(x, y), ContentRect) then
    begin
      FLMouseSelecting := False;
      SelectWord;
    end;
  end;
  if (Button = TMouseButton.mbLeft) and PointInRect(PointF(x, y), ContentRect) then
  begin
    FLMouseSelecting := True;
    CaretPosition := GetPointPosition(PointF(x, y));
    FSelected := False;
    SelectAtPos(CaretPosition);
    RepaintEdit;
  end;
end;

function TMemo.ContentPos: TPointF;
var
  T: TFmxObject;
begin
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    Result := TControl(T).Position.Point;
  end;
end;

procedure TMemo.DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
var
//  BeforeCaret: String;
//  BeforeCaretSize: Single;
//  MarketSize: Single;
  R, TmpRect: TRectF;
  LSelArea: TSelArea;
  CurSelRect: Integer;
  State: TCanvasSaveState;
//  CurChar,
  CurLine, LEndLine: Integer;
  TmpPt: TPointF;
  LLeftTopCharPt: TPointF;
  P: TPoint;
  S: String;
begin
  with Canvas do
  begin
    State := Canvas.SaveState;
    try
      Canvas.IntersectClipRect(ARect);

      Font.Assign(FFont);
      Fill.Assign(FFontFill);
      Stroke.Assign(FFontFill);

      // text
      R := ContentRect;
      TmpRect := ARect;
      //Canvas.Font.Assign(Font);

      LLeftTopCharPt.x := TmpRect.Left;
      LLeftTopCharPt.y := TmpRect.Top;

      CurLine := Trunc(VScrollBarValue / GetLineHeight);
      LEndLine := Trunc((VScrollBarValue + ContentRect.Height) / GetLineHeight);
      if LEndLine >= Lines.Count then
        LEndLine := Lines.Count - 1;
      if (LEndLine < 0) and FTextService.HasMarkedText then
      begin
        // only if text is empty
//        TmpPt := GetPositionPoint(ComposeCaretPos(0, 0));
        FTextService.DrawSingleLine( Canvas,
          RectF(
            TmpPt.x - R.Left,
            TmpPt.y - R.Top,
            $FFFF,
            TmpPt.y - R.Top + (GetLineHeight * 1.25)),
          0,
          Font,
          AbsoluteOpacity, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);

      end;
      while CurLine <= LEndLine do
      begin
        TmpPt := GetPositionPoint(ComposeCaretPos(CurLine, 0));
        if (CurLine = CaretPosition.Line) and FTextService.HasMarkedText then
        begin
{$IFDEF __}
          S := Copy(Lines[CurLine], 1, CaretPosition.Pos) +
               FTextService.InternalGetMarkedText +
               Copy(Lines[CurLine], CaretPosition.Pos + 1, $FFFF);

          FillText(RectF(TmpPt.x - R.Left, TmpPt.y - R.Top, $FFFF,
            TmpPt.y - R.Top + (GetLineHeight * 1.25)), S,
            False, AbsoluteOpacity, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);

          FTextService.DrawStatusInformation(Canvas,
            S, TmpPt,
            Font, ARect, ContentRect,
            GetLineHeight,
            self);
{$ELSE !__}

        S := Copy(Lines[CurLine], 1, CaretPosition.Pos) +
               FTextService.InternalGetMarkedText +
               Copy(Lines[CurLine], CaretPosition.Pos + 1, $FFFF);
        P.X := CaretPosition.Pos;
        P.Y := CaretPosition.Line;
        FTextService.CaretPosition := P;
        FTextService.DrawSingleLine2( Canvas, S,
          RectF(
            TmpPt.x - R.Left,
            TmpPt.y - R.Top,
            $FFFF,
            TmpPt.y - R.Top + (GetLineHeight * 1.25)),

          Font,
          AbsoluteOpacity, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);
{$ENDIF __}
        end
        else
          FillText(RectF(TmpPt.x - R.Left, TmpPt.y - R.Top, $FFFF,
            TmpPt.y - R.Top + (GetLineHeight * 1.25)), Lines[CurLine],
            False, AbsoluteOpacity, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);
        Inc(CurLine);
      end;

      // selection
      if IsFocused then
      begin
        LSelArea := GetSelArea;
        if GetShowSelection then
        begin
          Fill.Assign(FSelectionFill);
          for CurSelRect := Low(LSelArea) to High(LSelArea) do
          begin
            IntersectRect(TmpRect, LSelArea[CurSelRect], RectF(0, 0, 1000, 1000));
            OffsetRect(TmpRect, -R.Left, -R.Top);
            FillRect(TmpRect, 0, 0, [], 1);
          end;
        end;
      end;
    finally
      Canvas.RestoreState(State);
    end;
  end;
end;

procedure TMemo.DoContentPaintWithCache(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
var
  State: TCanvasSaveState;
  R: TRectF;
begin
  if not IsFocused then
    DoContentPaint(Sender, Canvas, ARect)
  else
  begin
    State := Canvas.SaveState;
    try
      R := RectF(0, 0, ARect.Width, ARect.Height);

      with GetAbsoluteScale do
        MultiplyRect(R, X, Y);

      if (FOffScreenBitmap <> nil) and (
           (FOffScreenBitmap.Width <> trunc(RectWidth(R))) or
           (FOffScreenBitmap.Height <> trunc(RectHeight(R)))) then
      begin
        FreeAndNil(FOffScreenBitmap);
      end;

      if FOffScreenBitmap = nil then
      begin
        { create }
        FOffScreenBitmap := TBitmap.Create(trunc(RectWidth(R)), trunc(RectHeight(R)));

        { Paint Self }
        if FOffScreenBitmap.Canvas.BeginScene then
        try
        FOffScreenBitmap.Canvas.Clear(Canvas.Fill.Color);
        FOffScreenBitmap.Canvas.SetMatrix(CreateScaleMatrix(Scale.X, Scale.Y));
          DoContentPaint(Sender, FOffScreenBitmap.Canvas, R);
        finally
          FOffScreenBitmap.Canvas.EndScene;
        end;
      end;
      Canvas.SetMatrix(AbsoluteMatrix);
      Canvas.DrawBitmap(FOffScreenBitmap,
        RectF(0, 0, FOffScreenBitmap.Width, FOffScreenBitmap.Height),
        ContentRect,
        AbsoluteOpacity, RotationAngle = 0);
    finally
      Canvas.RestoreState(State);
    end;
  end;
end;

procedure TMemo.HScrollChange(Sender: TObject);
begin
  FreeAndNil(FOffScreenBitmap);
  inherited;
end;

procedure TMemo.VScrollChange(Sender: TObject);
begin
  FreeAndNil(FOffScreenBitmap);
  inherited;
  UpdateCaretPosition(False);
end;

procedure TMemo.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    FContent := TControl(T);
    FContent.OnPaint := DoContentPaintWithCache;
  end;
  T := FindStyleResource('selection');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FSelectionFill.Assign(TBrushObject(T).Brush);
  end;
  { from style }
  T := FindStyleResource('foreground');

  if (T <> nil) and (T is TBrushObject) then
    FFontFill.Assign(TBrushObject(T).Brush);
end;

procedure TMemo.RepaintEdit;
begin
  FreeAndNil(FOffScreenBitmap);
  if FContent <> nil then
  begin
    FContent.Repaint;
  end;
end;

procedure TMemo.UpdateHScrlBarByCaretPos;
var
  LEdiTRect: TRectF;
  LCaretLinePos: Integer;
  LCaretLine: Integer;
  CurCaretX: Integer;
  TempStr: String;
  LMarkedPos: integer;
  EditWidth, VisWidth, FirstVisWidth, LastvisWidth: Single;
begin
  if (Lines.Count <= 0) and (not FTextService.HasMarkedText) then
    Exit;
  if Canvas = nil then
    Exit;

  LEdiTRect := ContentRect;
//  CurCaretX := round(GetPositionPoint(CaretPosition+Length(FMarkedText)).x);
//  CurCaretX := round(GetPositionPoint(ComposeCaretPos(CaretPosition.Line, CaretPosition.Pos + Length(FTextService._InternaGetMarkedText))).X);
  CurCaretX := round(GetPositionPoint(
    ComposeCaretPos(
      FTextService.TargetClausePosition.X,
      FTextService.TargetClausePosition.Y )).X);

  if not((CurCaretX < LEdiTRect.Left) or (CurCaretX > LEdiTRect.Right)) then
    Exit;

  LCaretLinePos := CaretPosition.Pos;
  LCaretLine := CaretPosition.Line;

  TempStr := Lines[LCaretLine];
  TempStr := Copy(TempStr, 1, LCaretLinePos) + FTextService.InternalGetMarkedText+ Copy(TempStr, LCaretLinePos+1, MaxInt);
  if FFirstVisibleChar >= (LCaretLinePos + Length(FTextService.InternalGetMarkedText) + 1) then
  begin
    FFirstVisibleChar := LCaretLinePos;
    if FFirstVisibleChar < 1 then
      FFirstVisibleChar := 1;
  end
  else
  begin // caret
    LMarkedPos := LCaretLinePos + Length(FTextService.InternalGetMarkedText);
    EditWidth := LEdiTRect.Right - LEdiTRect.Left - 5;
    VisWidth := TextWidth(Copy(TempStr, FFirstVisibleChar, LMarkedPos - FFirstVisibleChar + 1));
    while (VisWidth > EditWidth) and (FFirstVisibleChar < Length(TempStr)) do
    begin
      // Get the width of the first character
      FirstVisWidth := TextWidth(Copy(TempStr, FFirstVisibleChar, 1));
      // Move the first visible pointer to the right
      Inc(FFirstVisibleChar);
      // Get the width of the new last visible character
      LastVisWidth := TextWidth(Copy(TempStr, LMarkedPos - FFirstVisibleChar + 1, 1));
      // Calculate the new visible width
      VisWidth := VisWidth - FirstVisWidth + LastVisWidth;
    end;
  end;
  if (HScrollBar <> nil) and (HScrollBar.Visible) then
    HScrollBar.Value := TextWidth(Copy(TempStr, 1,
      FFirstVisibleChar - 1));
end;

procedure TMemo.MouseMove(Shift: TShiftState; x, y: Single);
var
  LEdiTRect: TRectF;
begin
  inherited;
  FOldMPt := PointF(x, y);

  if FLMouseSelecting then
  begin
    LEdiTRect := ContentRect;

    { if y < LEdiTRect.Top then
      VScrollBar.AutoScrollUp := True
      else
      if y > LEdiTRect.Bottom then
      VScrollBar.AutoScrollDown := True
      else begin
      VScrollBar.AutoScrollDown := False;
      VScrollBar.AutoScrollUp := False;
      end; }

    SelectAtMousePoint;
  end;
end;

procedure TMemo.MouseUp(Button: TMouseButton; Shift: TShiftState; x, y: Single);
begin
  inherited;
  FLMouseSelecting := False;
  if SelLength = 0 then
    FSelected := False;
end;

procedure TMemo.CopyToClipboard;
begin
  if SelText <> '' then
    Platform.SetClipboard(SelText);
end;

procedure TMemo.PasteFromClipboard;
var
  WasSelection: Boolean;
begin
  if ReadOnly then
    Exit;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if not TLinkObservers.EditLinkEdit(Observers) then
    begin
      TLinkObservers.EditLinkReset(Observers);
      Exit;
    end
    else
      TLinkObservers.EditLinkModified(Observers);
  try
    if not VarIsStr(Platform.GetClipboard) then Exit;
    WasSelection := SelLength >0;
    if WasSelection then
    begin
      DeleteFrom(GetSelBeg, SelLength, [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo]);
      InsertAfter(GetSelBeg, Platform.GetClipboard, [TInsertOption.ioMoveCaret,
        TInsertOption.ioCanUndo, TInsertOption.ioUndoPairedWithPrev]);
    end
    else
      InsertAfter(CaretPosition, Platform.GetClipboard, [TInsertOption.ioMoveCaret,
        TInsertOption.ioCanUndo{, ioUndoPairedWithPrev}]);
    Change;
  finally
  end;
end;

procedure TMemo.CreatePopupMenu;
begin
  FMemoPopupMenu := TPopupMenu.Create(Self);
  FMemoPopupMenu.Stored := False;
  FMemoPopupMenu.Parent := Self;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := SEditCut;
    StyleName := 'cut';
    OnClick := DoCut;
  end;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := SEditCopy;
    StyleName := 'copy';
    OnClick := DoCopy;
  end;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := SEditPaste;
    StyleName := 'paste';
    OnClick := DoPaste;
  end;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := SEditDelete;
    StyleName := 'delete';
    OnClick := DoDelete;
  end;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := '-';
  end;
  with TMenuItem.Create(FMemoPopupMenu) do
  begin
    Parent := FMemoPopupMenu;
    Text := SEditSelectAll;
    StyleName := 'selectall';
    OnClick := DoSelectAll;
  end;
end;

procedure TMemo.DoCut(Sender: TObject);
begin
  CutToClipboard;
end;

procedure TMemo.DoCopy(Sender: TObject);
begin
  CopyToClipboard;
end;

procedure TMemo.DoDelete(Sender: TObject);
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if not TLinkObservers.EditLinkEdit(Observers) then
    begin
      TLinkObservers.EditLinkReset(Observers);
      Exit;
    end
    else
      TLinkObservers.EditLinkModified(Observers);

  ClearSelection;
end;

procedure TMemo.DoPaste(Sender: TObject);
begin
  PasteFromClipboard;
end;

procedure TMemo.UpdatePopupMenuItems;
var
  SelTextEmpty: Boolean;
begin
  SelTextEmpty := SelText <> '';
  TMenuItem(FMemoPopupMenu.FindStyleResource('cut')).Enabled := SelTextEmpty and not ReadOnly;
  TMenuItem(FMemoPopupMenu.FindStyleResource('copy')).Enabled := SelTextEmpty;
  TMenuItem(FMemoPopupMenu.FindStyleResource('paste')).Enabled := VarIsStr(Platform.GetClipboard) and not ReadOnly;
  TMenuItem(FMemoPopupMenu.FindStyleResource('delete')).Enabled := SelTextEmpty and not ReadOnly;
  TMenuItem(FMemoPopupMenu.FindStyleResource('selectall')).Enabled := SelText <> Text;
end;

function TMemo.GetNextWordBegin(StartPosition: TCaretPosition): TCaretPosition;
var
  SpaceFound, WordFound: Boolean;
  LLineText: string;
  CurPos: Integer;
  CurLine: Integer;
begin
  CurPos := StartPosition.Pos;
  CurLine := StartPosition.Line;

  if StartPosition.Pos < Length(GetLine(StartPosition.Line)) then
  begin
    LLineText := GetLine(StartPosition.Line);

    SpaceFound := False;
    WordFound := False;
    while (CurPos + 2 <= Length(LLineText)) and
      ((not((LLineText[CurPos + 1] <> ' ') and SpaceFound)) or not WordFound) do
    begin
      if LLineText[CurPos + 1] = ' ' then
        SpaceFound := True;
      if LLineText[CurPos + 1] <> ' ' then
      begin
        WordFound := True;
        SpaceFound := False;
      end;

      CurPos := CurPos + 1;
    end;
    if not SpaceFound then
      CurPos := CurPos + 1;
  end
  else if StartPosition.Line < Lines.Count - 1 then
  begin
    CurLine := CurLine + 1;
    CurPos := 0;
  end;

  with Result do
  begin
    Line := CurLine;
    Pos := CurPos;
  end
end;

function TMemo.GetPrevWordBegin(StartPosition: TCaretPosition): TCaretPosition;
var
  WordFound: Boolean;
  LLineText: string;
  CurPos: Integer;
  CurLine: Integer;
begin
  Result := StartPosition;

  CurPos := StartPosition.Pos;
  CurLine := StartPosition.Line;

  if StartPosition.Pos > 0 then
  begin
    LLineText := GetLine(StartPosition.Line);

    WordFound := False;
    while (CurPos > 0) and ((LLineText[CurPos] <> ' ') or not WordFound) do
    begin
      if LLineText[CurPos] <> ' ' then
        WordFound := True;
      CurPos := CurPos - 1;
    end;
  end
  else if (StartPosition.Line - 1 >= 0) and
    (StartPosition.Line - 1 <= Lines.Count - 1) then
  begin
    CurLine := CurLine - 1;
    CurPos := Length(GetLine(CurLine));
  end;

  with Result do
  begin
    Line := CurLine;
    Pos := CurPos;
  end
end;

function TMemo.GetReadOnly: Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    Result := TLinkObservers.EditLinkIsReadOnly(Observers)
  else
    Result := FReadOnly;
end;

procedure TMemo.ClearSelection;
begin
  if not ReadOnly then
    DeleteFrom(GetSelBeg, SelLength, [TDeleteOption.doMoveCaret, TDeleteOption.doCanUndo]);
end;

procedure TMemo.CutToClipboard;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if not TLinkObservers.EditLinkEdit(Observers) then
    begin
      TLinkObservers.EditLinkReset(Observers);
      Exit;
    end
    else
      TLinkObservers.EditLinkModified(Observers);

  CopyToClipboard;
  ClearSelection;
end;

procedure TMemo.SelectAll;
begin
  FSelStart := ComposeCaretPos(0, 0);
  FSelEnd.Line := GetLineCount;
  if FSelEnd.Line = 0 then
    FSelEnd.Pos := 0
  else
  begin
    Dec(FSelEnd.Line);
    FSelEnd.Pos := Length(GetLine(FSelEnd.Line));
  end;
  FSelected := True;
  GoToTextEnd;
  RepaintEdit;
end;

procedure TMemo.DoSelectAll(Sender: TObject);
begin
  SelectAll;
end;

procedure TMemo.DrawPasswordChar(SymbolRect: TRectF; Selected: Boolean);
var
  LRect: TRectF;
begin
  { !!! Don't forget include clipping rountines
    Char symbol image must not extend out of EdiTRect }

  IntersectRect(LRect, SymbolRect, ContentRect);

  Canvas.Font.Assign(Font);
  // if Selected then
  // Canvas.Font.Color := clHighlightText;
  // Canvas.Brush.Style := bsClear;
  // Canvas.TexTRect(LRect, SymbolRect.Left, SymbolRect.Top, PasswordChar);
end;

function TMemo.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  NewHeight := round(GetLineHeight + ContentRect.Top * 2);
end;

procedure TMemo.SelectWord;
begin
//  FSelStart := TextPosToPos(FTextService.GetPrevWordBeginPosition(PosToTextPos(CaretPosition)));
//  FSelEnd   := TextPosToPos(FTextService.GetNextWordBeginPosition(PosToTextPos(CaretPosition)));
  FSelStart := GetPrevWordBegin(CaretPosition);
  FSelEnd := GetNextWordBegin(CaretPosition);
  FSelected := True;
  RepaintEdit;
end;

procedure TMemo.Change;
begin
  if FNeedChange then
  begin
    FreeAndNil(FOffScreenBitmap);
    if Assigned(FBindingObjects) then
      ToBindingObjects;
    if not(csLoading in ComponentState) then
    begin
      if Assigned(FOnChangeTracking) then
        FOnChangeTracking(Self);
      if Assigned(FOnChange) then
        FOnChange(Self);
    end;
  end;
end;

procedure TMemo.ContextMenu(const ScreenPosition: TPointF);
begin
  inherited;
  if csDesigning in ComponentState then
    Exit;
  if PopupMenu = nil then
  begin
    UpdatePopupMenuItems;
    FMemoPopupMenu.PopupComponent := Self;
    FMemoPopupMenu.Popup(round(ScreenPosition.X), round(ScreenPosition.Y));
  end;
end;

procedure TMemo.FontChanged(Sender: TObject);
begin
  ResetLineWidthCache;
  RepaintEdit;
  if not(csLoading in ComponentState) then
  begin
    UpdateLines;
    UpdateCaretPosition(False);
    if not FInternalUpdating then
      Realign;
  end;
  inherited;
end;

procedure TMemo.FreeStyle;
begin
  inherited;
  FContent := nil;
end;

function TMemo.GetText: string;
begin
  Result := FTextService.Text;
end;

procedure TMemo.SetText(const Value: string);
begin
  if not ValidText(Value) then
    Exit;

  if Value <> Text then
  begin
    if (Value <> '') and (CharCase <> TEditCharCase.ecNormal) then
      case CharCase of
{$IFDEF KS_COMPILER5}
        ecUpperCase:
          FText := UpperCase(Value);
        ecLowerCase:
          FText := LowerCase(Value);
{$ELSE}
        TEditCharCase.ecUpperCase:
          FTextService.Text := WideUpperCase(Value);
        TEditCharCase.ecLowerCase:
          FTextService.Text := WideLowerCase(Value);
{$ENDIF}
      end
    else
      FTextService.Text := Value;

    if FInternalMustUpdateLines then
    begin
      UpdateLines;
      if not FInternalUpdating then
        Realign;
    end;

//    if not(csLoading in ComponentState) and Assigned(OnChange) then
//      OnChange(Self);
    FNeedChange := True;
    Change;
  end;
end;

procedure TMemo.SetCaretPosition(const Value: TCaretPosition);
begin
  if Value.Line > Lines.Count - 1 then
    FCaretPosition.Line := Lines.Count - 1
  else
    FCaretPosition.Line := Value.Line;

  if FCaretPosition.Line < 0 then
    FCaretPosition.Line := 0;

  if Value.Pos < 0 then
    FCaretPosition.Pos := 0
  else if Value.Pos > Length(Lines[FCaretPosition.Line]) then
    FCaretPosition.Pos := Length(Lines[FCaretPosition.Line])
  else
    FCaretPosition.Pos := Value.Pos;

  UpdateCaretPosition(True);
end;

procedure TMemo.SetSelLength(const Value: Integer);
begin
  FSelected := Value > 0;
  FSelEnd := TextPosToPos(PosToTextPos(FSelStart) + Value);
  RepaintEdit;
end;

procedure TMemo.SetSelStart(const Value: Integer);
begin
  FSelStart := TextPosToPos(Value);
  CaretPosition := FSelStart;
  SelLength := 0;
end;

procedure TMemo.SetAutoSelect(const Value: Boolean);
begin
  if FAutoSelect <> Value then
    FAutoSelect := Value;
end;

function TMemo.GetSelStart: Integer;
begin
  if FSelected then
    Result := PosToTextPos(GetSelBeg)
  else
    Result := PosToTextPos(CaretPosition);
end;

function TMemo.GetSelArea: TSelArea;
var
  BegLine, EndLine, CurLine: Integer;
  SelBegLineVisible, SelEndLineVisible: Boolean;
begin
  if not FSelected then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  SelBegLineVisible := True;
  SelEndLineVisible := True;

  BegLine := GetSelBeg.Line;
  if BegLine < Trunc(VScrollBarValue / GetLineHeight) then
  begin
    BegLine := Trunc(VScrollBarValue / GetLineHeight);
    SelBegLineVisible := False;
  end;

  EndLine := GetSelEnd.Line;
  if EndLine > Trunc((VScrollBarValue + ContentRect.Height) / GetLineHeight) then
  begin
    EndLine := Trunc((VScrollBarValue + ContentRect.Height) / GetLineHeight);
    SelEndLineVisible := False;
  end;

  if EndLine < BegLine then
    EndLine := BegLine - 1;

  SetLength(Result, EndLine - BegLine + 1);

  CurLine := BegLine;
  while (CurLine <= EndLine) and (CurLine < Lines.Count) do
  begin
    with Result[CurLine - BegLine] do
    begin
      Left := GetPositionPoint(ComposeCaretPos(CurLine, 0)).x;
      Right := GetPositionPoint(ComposeCaretPos(CurLine,
        Length(Lines[CurLine]))).x;
      Top := GetPositionPoint(ComposeCaretPos(CurLine, 0)).y;
      Bottom := GetPositionPoint(ComposeCaretPos(CurLine, 0)).y + GetLineHeight;
    end;
    Inc(CurLine);
  end;

  if EndLine - BegLine >= 0 then
  begin
    if SelBegLineVisible then
      Result[0].Left := GetPositionPoint(ComposeCaretPos(BegLine,
        GetSelBeg.Pos)).x;
    if SelEndLineVisible then
      Result[EndLine - BegLine].Right :=
        GetPositionPoint(ComposeCaretPos(EndLine, GetSelEnd.Pos)).x;
  end;
end;

function TMemo.GetSelLength: Integer;
begin
  if FSelected then
    Result := PosToTextPos(GetSelEnd) - PosToTextPos(GetSelBeg)
  else
    Result := 0;
end;

procedure TMemo.ReadTextData(Reader: TReader);
begin
  Text := Reader.ReadString;
end;

procedure TMemo.defineproperties(Filer: TFiler);
begin
  Filer.DefineProperty('Text', ReadTextData, nil, False);
end;

function TMemo.GetSelText: string;
var
  LSelStart, LSelLength: Integer;
begin
  if FSelected then
  begin
    LSelStart := SelStart;
    LSelLength := SelLength;
    Result := Copy(Text, LSelStart + 1, LSelLength);
  end
  else
    Result := '';
end;

procedure TMemo.SetCharCase(const Value: TEditCharCase);
var
  tempS: string;
begin
  if FCharCase <> Value then
  begin
    FCharCase := Value;
    if FTextService.Text <> '' then
    begin
    tempS:= FTextService.Text;
    case FCharCase of
      TEditCharCase.ecUpperCase: FTextService.Text:= WideUpperCase(tempS);
      TEditCharCase.ecLowerCase: FTextService.Text:= WideLowerCase(temps);
    end;
    RepaintEdit;
    end;
  end;
end;

procedure TMemo.SetHideSelection(const Value: Boolean);
begin
  if FHideSelection <> Value then
  begin
    FHideSelection := Value;
    RepaintEdit;
  end;
end;

procedure TMemo.SetKeyboardType(Value: TVirtualKeyboardType);
begin
  FKeyboardType := Value;
end;

function TMemo.GetTextService: TTextService;
begin
  Result := FTextService;
end;

procedure TMemo.UpdateCaretPoint;
begin
  if not FInternalUpdating then
    Realign;
  UpdateCaretPosition(True);
  RepaintEdit;
end;

function TMemo.GetTargetClausePointF: TPointF;
var
  P: TCaretPosition;
  TmpPt: TPointF;
  TmpRect: TRectF;
begin
//  Str := Copy(FTextService.CombinedText, 1, Round(FTextService.TargetClausePosition.X) );
//  if FFirstVisibleChar > 1 then
//    Str := Copy(Str, FFirstVisibleChar);
//  Result.X := TextWidth(Str) + ContentRect.Left + Self.Position.Point.X;
//  Result.Y := ((ContentRect.Height / 2) + Font.Size / 2 + 2) + ContentRect.Top + Self.Position.Y;

  P := CaretPosition;
  P.Line := P.Line + 1;
  TmpRect := ContentRect;
  TmpPt := GetPositionPoint(P);
  TmpPt.Y := TmpPt.Y + 2; // small space between conrol and IME window
  Result.X := TmpPt.x + HScrollBarValue - TmpRect.Left;
  Result.Y := TmpPt.y + VScrollBarValue - TmpRect.Top;
  Result.X := Result.X + ContentRect.Top + Self.Position.Point.X;
  Result.Y := Result.Y + ContentRect.Left + Self.Position.Point.Y;
end;

function TMemo.GetImeMode: TImeMode;
begin
  Result := FTextService.ImeMode;
end;

procedure TMemo.SetImeMode(const Value: TImeMode);
begin
  if FTextService.ImeMode <> Value then
    FTextService.ImeMode := Value;
end;

procedure TMemo.SetMaxLength(const Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
  end;
end;

procedure TMemo.SetReadOnly(Value: Boolean);
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkSetIsReadOnly(Observers, Value)
  else
    FReadOnly := Value;
end;

function TMemo.ValidText(const NewText: string): Boolean;
begin
  Result := True;
end;

procedure TMemo.UpdateCaretPosition(UpdateScrllBars: Boolean);
var
  TmpPt: TPointF;
  TmpRect: TRectF;
begin
  if UpdateScrllBars then
  begin
    UpdateVScrlBarByCaretPos;
    UpdateHScrlBarByCaretPos;
  end;
  TmpRect := ContentRect;
  TmpPt := GetPositionPoint(CaretPosition);
  TmpPt.x := TmpPt.x + HScrollBarValue - TmpRect.Left;
  TmpPt.y := TmpPt.y + VScrollBarValue - TmpRect.Top;
  if FTextService.HasMarkedText then
    TmpPt.x := TmpPt.x + TextWidth(FTextService.InternalGetMarkedText);
  SetCaretSize(PointF(1, GetLineHeight));
  SetCaretPos(TmpPt);
  SetCaretColor(FFontFill.Color);
end;

function TMemo.GetLineRealEnd(AStartPos: TCaretPosition; PText: PString) : TCaretPosition;
begin
  Result.Line := AStartPos.Line;
  while (Result.Line + 1 <= Lines.Count - 1) and
    (GetLineInternal(Result.Line) = GetLine(Result.Line)) do
    Result.Line := Result.Line + 1;

  if (Result.Line <= Lines.Count - 1) and (Lines.Count > 0) then
  begin
    Result.Pos := Length(GetLine(Result.Line)) + FLinesBegs[Result.Line] - 1
  end
  else
    Result.Pos := 0;
end;

function TMemo.FillLocalLinesBegs(PText: PString; ABegChar, AEndChar: Integer;
  TmpLinesBegs: PLinesBegins): Integer;
var
  S: string;
  TmpSWidth: Single;
  LLongestLineWidth: Single;
  i: Integer;
  LMetrics: TLineMetricInfo;
begin
  Result := 0;
  SetLength(TmpLinesBegs^, 0);

  if PText^ = '' then
    Exit;

  LMetrics := TLineMetricInfo.Create;

  S := Copy(PText^, ABegChar, AEndChar - ABegChar + 1);

  Canvas.Font.Assign(Font);
  Canvas.MeasureLines(LMetrics, ContentRect,
    S, FWordWrap, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);

  if LMetrics.Count = 0 then
  begin
    // no date??? Error??
//    Result := 0;
//    SetLength(TmpLinesBegs^, 0);
  end
  else
  if LMetrics.Count = 1 then
  begin
    // Single line
    Result := 0;
    SetLength(TmpLinesBegs^, 0);
  end
  else
  begin
    // New lines are coming.
    SetLength(TmpLinesBegs^, LMetrics.Count - 1);
    LLongestLineWidth := TextWidth(Copy(S, 1, LMetrics.Metrics[0].Len));
    Result := 0;
    for i := 0 to LMetrics.Count - 2 do
    begin
      TmpLinesBegs^[i] := LMetrics.Metrics[i+1].Index - 1 + ABegChar;
      TmpSWidth := TextWidth(Copy(S, LMetrics.Metrics[i+1].Index, LMetrics.Metrics[i+1].Len));
      if TmpSWidth > LLongestLineWidth then
      begin
        LLongestLineWidth := TmpSWidth;
        Result := i;
      end;
    end;
  end;

  LMetrics.Free;
end;

procedure TMemo.UpdateLines;
var
  TmpS: string;
  TmpSWidth: Single;
  LLongestLineWidth: Single;
  i: Integer;
  LMetrics: TLineMetricInfo;
begin
  FWidestLineIndex := 0;
  SetLength(FLinesBegs, 0);
  SetLength(FTextWidth, 0);
  if Text = '' then
    Exit;

  SetLength(FLinesBegs, 1);
  SetLength(FTextWidth, 1);
//  with ContentRect do
//    LEditRectWidth := Right - Left;
  if Canvas = nil then
    Exit;

  LMetrics := TLineMetricInfo.Create;

  Canvas.Font.Assign(Font);
  Canvas.MeasureLines(LMetrics, ContentRect, Text, FWordWrap, FillTextFlags, TTextAlign.taLeading, TTextAlign.taLeading);
  SetLength(FLinesBegs, LMetrics.Count);
  LLongestLineWidth := 0;
  for i := 0 to LMetrics.Count - 1 do
    FLinesBegs[i] := LMetrics.Metrics[i].Index;

  SetLength(FTextWidth, LMetrics.Count);
  FCachedFillText := FillTextFlags;
  for i := 0 to LMetrics.Count - 1 do
  begin
    TmpS := GetLineInternal(i);
    FTextWidth[i] := TextWidth(TmpS);
    if LLongestLineWidth < FTextWidth[i] then
    begin
      LLongestLineWidth := FTextWidth[i];
      FWidestLineIndex := i;
    end;
  end;
  LMetrics.Free;
end;

procedure TMemo.UpdateRngLinesBegs(PText: PString;
  AUpdBegLine, AUpdEndLine, AUpdBegChar, AUpdEndChar, ACharDelta, AOldWidestLineWidth: Integer);
var
  LUpdEndChar, LNewWidestLineIndex, LLineDelta, i: Integer;
  LTmpLinesBegs: TLinesBegins;
begin
  if (Length(FLinesBegs) = 0) and (PText^ <> '') then
  begin
    SetLength(FLinesBegs, 1);
    SetLength(FTextWidth, 1);
    FLinesBegs[0] := 1;
    FTextWidth[0] := 0;
  end;

  LUpdEndChar := AUpdEndChar + ACharDelta;
  LNewWidestLineIndex := FillLocalLinesBegs(PText, AUpdBegChar, LUpdEndChar,
    @LTmpLinesBegs) + AUpdBegLine;

  LLineDelta := Length(LTmpLinesBegs) - (AUpdEndLine - AUpdBegLine);

  if LLineDelta > 0 then
  begin
    SetLength(FLinesBegs, Length(FLinesBegs) + LLineDelta);
    SetLength(FTextWidth, Length(FTextWidth) + LLineDelta);
    for i := Length(FLinesBegs) - 1 downto AUpdEndLine + 1 + LLineDelta do
      FLinesBegs[i] := FLinesBegs[i - LLineDelta] + ACharDelta;

    for i := Length(FTextWidth) - 1 downto AUpdEndLine + 1 + LLineDelta do
    begin
      FTextWidth[i] := FTextWidth[i - LLineDelta];
    end;
    for i := AUpdBegLine to AUpdEndLine + LLineDelta do
      FTextWidth[i] := 0;

  end
  else if LLineDelta < 0 then
  begin
    for i := AUpdBegLine + 1 to Length(FLinesBegs) - 1 + LLineDelta do
      FLinesBegs[i] := FLinesBegs[i - LLineDelta] + ACharDelta;

    for i := AUpdBegLine to AUpdEndLine do
      FTextWidth[i] := 0;
    for i := AUpdBegLine + Length(LTmpLinesBegs) to Length(FTextWidth) + LLineDelta - 1 do
      FTextWidth[i] := FTextWidth[i - LLineDelta];

    SetLength(FLinesBegs, Length(FLinesBegs) + LLineDelta);
    SetLength(FTextWidth, Length(FTextWidth) + LLineDelta);
  end
  else
  begin
    // LLineDelta = 0
    for i := AUpdBegLine + 1 to Length(FLinesBegs) - 1 do
      FLinesBegs[i] := FLinesBegs[i] + ACharDelta;
    if AUpdEndLine < Length(FTextWidth) then
      for i := AUpdBegLine to AUpdEndLine do
        FTextWidth[i] := 0;
  end;

  for i := 0 to Length(LTmpLinesBegs) - 1 do
    if AUpdBegLine + i + 1 <= Length(FLinesBegs) - 1 then
    begin
      FLinesBegs[AUpdBegLine + i + 1] := LTmpLinesBegs[i];
      FTextWidth[AUpdBegLine + i + 1] := 0;
    end;

  if FWidestLineIndex > Length(FLinesBegs) - 1 then
    FWidestLineIndex := round(GetWidestLine)
  else if LineWidth[LNewWidestLineIndex] >= AOldWidestLineWidth then
    FWidestLineIndex := LNewWidestLineIndex
  else if not((FWidestLineIndex < AUpdBegLine) or (FWidestLineIndex > AUpdEndLine))
  then
    FWidestLineIndex := GetWidestLine;

  if not FInternalUpdating then
    Realign;
end;

procedure TMemo.InsertAfter(Position: TCaretPosition; const S: string; Options: TInsertOptions);
var
  LText: string;
  Insertion: string;
  LUpdBegLine, LUpdBegChar, LUpdEndLine, LUpdEndChar: Integer;
  R: Integer;
  LInsertionLength: Integer;
  LOldWidestLineWidth: Single;
begin
  R := PosToTextPos(CaretPosition);
  LText := Text;
  Insertion := S;
  if MaxLength > 0 then
    Insertion := Copy(Insertion, 1, MaxLength - Length(LText));

  if TInsertOption.ioCanUndo in Options then
    FActionStack.FragmentInserted(PosToTextPos(Position), Length(S),
      TInsertOption.ioUndoPairedWithPrev in Options);

  LUpdBegLine := Position.Line;
  if (Length(FLinesBegs) > 0) and (Position.Line <= Length(FLinesBegs) - 1) then
    LUpdBegChar := FLinesBegs[Position.Line]
  else
    LUpdBegChar := 1;

  with GetLineRealEnd(Position, @LText) do
  begin
    LUpdEndLine := Line;
    LUpdEndChar := Pos;
  end;

  LInsertionLength := Length(Insertion);
  LOldWidestLineWidth := LineWidth[FWidestLineIndex];

  Insert(Insertion, LText, PosToTextPos(Position) + 1);
  try
    FInternalMustUpdateLines := False;
    Text := LText;
  finally
    FInternalMustUpdateLines := True;
  end;

  UpdateRngLinesBegs(@LText, LUpdBegLine, LUpdEndLine, LUpdBegChar, LUpdEndChar,
    LInsertionLength, round(LOldWidestLineWidth));

  if TInsertOption.ioSelected in Options then
  begin
    FSelStart := Position;
    FSelEnd := GetPositionShift(Position, Length(Insertion));
    FSelected := True;
    CaretPosition := FSelEnd;
  end
  else
  begin
    if not(csLoading in ComponentState) then
    begin
      CaretPosition := TextPosToPos(R + Length(Insertion));
      UpdateCaretPosition(False);
    end;
  end;

  if not FInternalUpdating then
    Realign;
end;

procedure TMemo.DeleteFrom(Position: TCaretPosition; ALength: Integer;
  Options: TDeleteOptions);
var
  LUpdBegLine, LUpdEndLine, LUpdBegChar, LUpdEndChar: Integer;
  LText: string;
  LTmpPos, LTmpLength: Integer;
  LOldWidestLineWidth: Integer;
begin
  LText := Text;

  LTmpLength := ALength;
  LTmpPos := PosToTextPos(Position) + 1;

  if (LTmpPos + ALength - 1 + 1 <= System.Length(LText)) and
    (LTmpPos + ALength - 1 >= 1) and (LText[LTmpPos + ALength - 1] = #13) and
    (LText[LTmpPos + ALength - 1 + 1] = #10) then
    LTmpLength := LTmpLength + 1;

  if (LTmpPos - 1 >= 0) and (LTmpPos <= System.Length(LText)) and
    (LText[LTmpPos] = #10) and (LText[LTmpPos - 1] = #13) then
  begin
    LTmpLength := LTmpLength + 1;
    LTmpPos := LTmpPos - 1;
  end;

  if (TDeleteOption.doCanUndo in Options) and (LTmpLength > 0) then
    FActionStack.FragmentDeleted(LTmpPos, Copy(LText, LTmpPos, LTmpLength));

  LUpdBegLine := Position.Line;
  if Position.Line <= Length(FLinesBegs) - 1 then
    LUpdBegChar := FLinesBegs[Position.Line]
  else
    LUpdBegChar := 1;

  with GetLineRealEnd(GetPositionShift(Position, LTmpLength - 1), @LText) do
  begin
    LUpdEndLine := Line;
    LUpdEndChar := Pos;
  end;

  LOldWidestLineWidth := round(LineWidth[FWidestLineIndex]);

  Delete(LText, LTmpPos, LTmpLength);

  try
    FInternalMustUpdateLines := False;
    Text := LText;
  finally
    FInternalMustUpdateLines := True;
  end;

  UpdateRngLinesBegs(@LText, LUpdBegLine, LUpdEndLine, LUpdBegChar, LUpdEndChar,
    -LTmpLength, LOldWidestLineWidth);

  if (TDeleteOption.doMoveCaret in Options) or (SelLength <> 0) then
  begin
    FSelected := False;
    CaretPosition := Position;
  end;

  if not FInternalUpdating then
    Realign;
end;

procedure TMemo.DoUndo(Sender: TObject);
begin
  UnDo;
end;

procedure TMemo.UnDo;
begin
  FActionStack.RollBackAction;
end;

function TMemo.GetContentBounds: TRectF;
var
  S: string;
begin
  Result := inherited GetContentBounds;
  if FWordWrap then
  begin
    StorePositions;
    UpdateLines;
    RestorePositions;
  end;
  if Lines.Count > 0 then
    Result.Bottom := Result.Top + (Lines.Count * GetLineHeight);
  // Updating Horizontal scrollbar params
  if not FWordWrap and FTextService.HasMarkedText and (Length(Lines[CaretPosition.Line] + FTextService.InternalGetMarkedText) > Length(Lines[FWidestLineIndex])) then
  begin
    S := Lines[CaretPosition.Line];
    S := Copy(S, 1, CaretPosition.Pos) + FTextService.InternalGetMarkedText+ Copy(S, CaretPosition.Pos+1, MaxInt);
    if not FWordWrap and (TextWidth(S) > (Result.Right - Result.Left)) then
      Result.Right := Result.Left + TextWidth(S) + 10;
  end
  else
  begin
    if not FWordWrap and (TextWidth(Lines[FWidestLineIndex]) >
      (Result.Right - Result.Left)) then
      Result.Right := Result.Left + TextWidth(Lines[FWidestLineIndex]) + 10;
  end;
  // for caret
  UpdateHScrlBarByCaretPos;
end;

procedure TMemo.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

function TMemo.TextPosToPos(APos: Integer): TCaretPosition;
var
  CurRangeBeg, CurRangeEnd: Integer;
  TmpI: Integer;
begin
  with Result do
  begin
    Line := 0;
    Pos := 0;
  end;

  if Lines.Count <= 0 then
    Exit;

  CurRangeBeg := 0;
  CurRangeEnd := Length(FLinesBegs) - 1;
  repeat
    if ((CurRangeBeg < Length(FLinesBegs) - 1) and
      (APos + 1 >= FLinesBegs[CurRangeBeg]) and
      (APos + 1 < FLinesBegs[CurRangeBeg + 1])) or
      ((CurRangeBeg = Length(FLinesBegs) - 1) and
      (APos + 1 >= FLinesBegs[CurRangeBeg])) then
      CurRangeEnd := CurRangeBeg
    else
    begin
      if APos + 1 < FLinesBegs[CurRangeBeg] then
      begin
        TmpI := CurRangeEnd - CurRangeBeg + 1;
        CurRangeEnd := CurRangeBeg;
        CurRangeBeg := CurRangeBeg - TmpI div 2;
      end
      else if APos + 1 >= FLinesBegs[CurRangeEnd] then
      begin
        TmpI := CurRangeEnd - CurRangeBeg + 1;
        CurRangeBeg := CurRangeEnd;
        CurRangeEnd := CurRangeEnd + TmpI div 2;
      end
      else
        CurRangeEnd := (CurRangeBeg + CurRangeEnd) div 2;

      if CurRangeBeg < 0 then
        CurRangeBeg := 0;

      if CurRangeEnd < 0 then
        CurRangeEnd := 0;

      if CurRangeEnd > Length(FLinesBegs) - 1 then
        CurRangeEnd := Length(FLinesBegs) - 1;

      if CurRangeBeg > Length(FLinesBegs) - 1 then
        CurRangeBeg := Length(FLinesBegs) - 1;
    end;

  until CurRangeBeg = CurRangeEnd;
  Result.Line := CurRangeBeg;

  if Result.Line <= Length(FLinesBegs) - 1 then
    Result.Pos := APos - FLinesBegs[Result.Line] + 1;
end;

procedure TMemo.MoveCaretLeft;
begin
  MoveCareteBy(-1);
end;

procedure TMemo.MoveCaretRight;
begin
  MoveCareteBy(1);
end;

procedure TMemo.MoveCareteBy(Delta: Integer);
begin
  CaretPosition := GetPositionShift(CaretPosition, Delta);
end;

function TMemo.GetLineHeight: Single;
begin
  Result := round(FFont.Size * (1.25));
end;

procedure TMemo.HScrlBarChange(Sender: TObject);
begin
  RepaintEdit;
  UpdateCaretPosition(False);
end;

procedure TMemo.UpdateVScrlBarByCaretPos;
var
  LCaretPosLine: Integer;
begin
  if (VScrollBar <> nil) then
  begin
    LCaretPosLine := CaretPosition.Line;

    if (LCaretPosLine + 1) * GetLineHeight > VScrollBarValue + ContentRect.Height then
      VScrollBar.Value := (LCaretPosLine + 1) * GetLineHeight - ContentRect.Height;
    if LCaretPosLine * GetLineHeight < VScrollBarValue then
      VScrollBar.Value := LCaretPosLine * GetLineHeight;
  end;
end;

procedure TMemo.SetWordWrap(const Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    UpdateLines;
    if not FInternalUpdating then
      Realign;
    UpdateCaretPosition(False);
  end;
end;

procedure TMemo.GetLineBounds(LineIndex: Integer;
  var LineBeg, LineLength: Integer);
begin
  if Length(FLinesBegs) = 0 then
  begin
    LineBeg := 1;
    LineLength := 0;
    Exit;
  end;

  if (LineIndex <= Length(FLinesBegs) - 1) and (LineIndex >= 0) then
  begin
    LineBeg := FLinesBegs[LineIndex];
    if (LineIndex + 1 < Length(FLinesBegs)) then
      LineLength := FLinesBegs[LineIndex + 1] - LineBeg
    else
      LineLength := Length(Text) - LineBeg + 1;
  end
  else
  begin
    LineBeg := 0;
    LineLength := 0;
  end;
end;

function TMemo.GetLineCount: Integer;
begin
  if Text <> '' then
    Result := Length(FLinesBegs)
  else
    Result := 0;
end;

function TMemo.GetLine(Index: Integer): string;
begin
  Result := GetLineInternal(Index);
  if Length(Result) > 0 then
    if Result[Length(Result)] = #10 then
      Delete(Result, Length(Result), 1);
  if Length(Result) > 0 then
    if Result[Length(Result)] = #13 then
      Delete(Result, Length(Result), 1);
end;

procedure TMemo.InsertLine(Index: Integer; const S: string);
var NewS: string;
begin
  if (Text = '') and (S = '') and (not FEmptyFirstLine) then
    FEmptyFirstLine := True
  else
  begin
    if FEmptyFirstLine then
    begin
      NewS := sLineBreak + S;
      FEmptyFirstLine := False;
    end
    else
      NewS := S;

    if Index < GetLineCount then
      InsertAfter(ComposeCaretPos(Index, 0), NewS + sLineBreak, [])
    else if (Index > 0) and (GetLineCount > 0) then
    begin
      InsertAfter(ComposeCaretPos(Index - 1, Length(GetLineInternal(Index - 1))),
        sLineBreak + NewS, [])
    end
    else
      InsertAfter(ComposeCaretPos(Index, 0), NewS, []);
  end;
end;

procedure TMemo.DeleteLine(Index: Integer);
begin
  if GetLineCount > 0 then
  begin
    if Index = GetLineCount - 1 then
      DeleteFrom(ComposeCaretPos(Index - 1, Length(GetLineInternal(Index - 1))),
                 Length(GetLineInternal(Index)),
                 [])
    else
      DeleteFrom(ComposeCaretPos(Index, 0),
                 Length(GetLineInternal(Index)),
                 []);
  end;
end;

procedure TMemo.ClearLines;
begin
  Text := '';
  if FTextService.Text = '' then
    FEmptyFirstLine := False;
end;

procedure TMemo.SelectAtMousePoint;
var
  TmpPt: TPointF;
  LEdiTRect: TRectF;
begin
  LEdiTRect := ContentRect;
  TmpPt := FOldMPt;
  with TmpPt, LEdiTRect do
  begin
    if y < Top then
      y := Top
    else if y > Bottom then
      y := Bottom;

    if x < Left then
      x := Left
    else if x > Right then
      x := Right;
  end;

  CaretPosition := GetPointPosition(TmpPt);
  SelectAtPos(CaretPosition);
  RepaintEdit;
end;

function TMemo.GetPageSize: Single;
begin
  with ContentRect do
    Result := (Bottom - Top) / GetLineHeight;
end;

procedure TMemo.ResetLineWidthCache;
begin
  if Length(FTextWidth) > 0 then
    fillchar( FTextWidth[0], Length(FTextWidth) * sizeof(Single), 0);
end;

function TMemo.GetLineWidth(LineNum: Integer): Single;
begin
  if (LineNum >= 0) and (LineNum <= Lines.Count - 1) then
  begin
    if FCachedFillText <> FillTextFlags then
      ResetLineWidthCache;
    Result := FTextWidth[LineNum];
    if Result = 0 then
    begin
      Result := TextWidth(Lines[LineNum]);
      FTextWidth[LineNum] := Result;
    end;
  end
  else
    Result := 0;
end;

function TMemo.PosToTextPos(APostion: TCaretPosition): Integer;
var
  LTmpLine: Integer;
begin
  Result := 0;
  if Text = '' then
    Exit;

  with APostion do
  begin
    if Line <= Length(FLinesBegs) - 1 then
      LTmpLine := Line
    else
      LTmpLine := Length(FLinesBegs) - 1;

    if LTmpLine < 0 then
      Exit;

    Result := FLinesBegs[LTmpLine];

    if Pos <= Length(GetLineInternal(LTmpLine)) then
      Result := Result + Pos - 1
    else
      Result := Result + Length(GetLineInternal(LTmpLine)) - 1;

  end;
end;

function TMemo.GetLineInternal(Index: Integer): string;
var
  LLineBeg, LLineLength: Integer;
begin
  GetLineBounds(Index, LLineBeg, LLineLength);
  Result := Copy(Text, LLineBeg, LLineLength);
end;

procedure TMemo.GoToTextBegin;
begin
  with FCaretPosition do
  begin
    Line := 0;
    Pos := 0;
  end;
end;

procedure TMemo.GoToTextEnd;
begin
  with FCaretPosition do
  begin
    Line := Lines.Count - 1;
    if Line >= 0 then
      Pos := Length(Lines[Line])
    else
      Pos := 0;
  end;
end;

procedure TMemo.GotoLineEnd;
begin
  with FCaretPosition do
  begin
    if Line <= Lines.Count - 1 then
      Pos := Length(GetLine(CaretPosition.Line));
  end;
end;

procedure TMemo.GoToLineBegin;
begin
  with FCaretPosition do
  begin
    Pos := 0;
  end;
end;

function TMemo.GetSelBeg: TCaretPosition;
begin
  if FSelStart.Line < FSelEnd.Line then
    Result := FSelStart
  else if FSelEnd.Line < FSelStart.Line then
    Result := FSelEnd
  else if FSelStart.Pos < FSelEnd.Pos then
    Result := FSelStart
  else
    Result := FSelEnd;
end;

function TMemo.GetSelEnd: TCaretPosition;
begin
  if FSelStart.Line > FSelEnd.Line then
    Result := FSelStart
  else if FSelEnd.Line > FSelStart.Line then
    Result := FSelEnd
  else if FSelStart.Pos > FSelEnd.Pos then
    Result := FSelStart
  else
    Result := FSelEnd;
end;

procedure TMemo.SelectAtPos(APos: TCaretPosition);
begin
  if not FSelected then
  begin
    FSelStart := APos;
    FSelEnd := APos;
    FSelected := True;
  end
  else
  begin
    FSelEnd := APos;
  end;
end;

function TMemo.GetPositionShift(APos: TCaretPosition; Delta: Integer)
  : TCaretPosition;
var
  LNewPos: TCaretPosition;
  LNewTextPos: Integer;
  i: Integer;
  CurLineText: string;
begin
  LNewPos := APos;
  with LNewPos do
    if Delta >= 14 then
    begin
      LNewTextPos := PosToTextPos(CaretPosition) + Delta;

      if Delta > 0 then
      begin
        if (LNewTextPos + 1 <= Length(Text)) and (Text[LNewTextPos + 1] = #10)
        then
          Inc(LNewTextPos);
      end
      else if Delta < 0 then
      begin
        if (LNewTextPos + 1 - 1 >= Length(Text)) and
          (Text[LNewTextPos + 1 - 1] = #10) then
          Dec(LNewTextPos);
      end;

      LNewPos := TextPosToPos(LNewTextPos);
    end
    else
    begin
      CurLineText := GetLineInternal(Line);
      if Delta > 0 then
      begin
        i := 1;
        while i <= Delta do
        begin
          Pos := Pos + 1;
          if (Pos + 1 <= Length(CurLineText)) and (CurLineText[Pos + 1] = #10)
          then
          begin
            Inc(Pos);
            Inc(i);
          end;
          if Pos + 1 > Length(CurLineText) then
          begin
            if Line + 1 <= Lines.Count - 1 then
            begin
              Line := Line + 1;
              CurLineText := GetLineInternal(Line);
              Pos := 0;
            end
            else
              Pos := Length(CurLineText);
          end;
          Inc(i);
        end;
      end
      else
      begin { Delta < 0 }
        i := 1;
        while i <= Abs(Delta) do
        begin
          if Pos - 1 >= 0 then
            Pos := Pos - 1
          else
          begin
            if Line - 1 >= 0 then
            begin
              Line := Line - 1;
              CurLineText := GetLineInternal(Line);
              if CurLineText[Length(CurLineText)] = #10 then
                Pos := Length(CurLineText) - 2
              else
                Pos := Length(CurLineText) - 1;
            end;
          end;
          Inc(i);
        end;
      end;
    end;
  Result := LNewPos;
end;

procedure TMemo.RestorePositions;
begin
  if FOldCaretPos >= 0 then
    CaretPosition := TextPosToPos(FOldCaretPos);
  if FSelected and (FOldSelStartPos >= 0) then
  begin
    FSelStart := TextPosToPos(FOldSelStartPos);
    FSelEnd := TextPosToPos(FOldSelEndPos);
    FOldSelStartPos := -1;
  end;
end;

procedure TMemo.StorePositions;
begin
  FOldCaretPos := PosToTextPos(CaretPosition);
  if FSelected then
  begin
    FOldSelStartPos := PosToTextPos(FSelStart);
    FOldSelEndPos := PosToTextPos(FSelEnd);
  end;
end;

procedure TMemo.MoveCaretVertical(LineDelta: Integer);
var
  NewLine, NewY, OldX: Integer;
begin
  with FCaretPosition do
  begin
    NewLine := Line + LineDelta;
    if NewLine < 0 then
      NewLine := 0
    else if NewLine > Lines.Count - 1 then
      NewLine := Lines.Count - 1;

    NewY := round(GetPositionPoint(ComposeCaretPos(NewLine, Pos)).y);
    OldX := round(GetPositionPoint(CaretPosition).x);
    Line := NewLine;
    Pos := round(GetPointPosition(PointF(OldX, NewY)).Pos);
  end;
end;

function TMemo.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
end;

procedure TMemo.MoveCaretDown;
begin
  MoveCaretVertical(1);
end;

procedure TMemo.MoveCaretUp;
begin
  MoveCaretVertical(-1);
end;

procedure TMemo.MoveCaretPageDown;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Trunc(GetPageSize);
  if ScrollLineNumber < 1 then
    ScrollLineNumber := 1;
  MoveCaretVertical(ScrollLineNumber);
end;

procedure TMemo.MoveCaretPageUp;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Trunc(GetPageSize);
  if ScrollLineNumber < 1 then
    ScrollLineNumber := 1;
  MoveCaretVertical(-ScrollLineNumber);
end;

function TMemo.GetWidestLine: Integer;
var
  i: Integer;
  LWidth, LMaxWidth: Single;
begin
  Result := -1;
  LMaxWidth := -1;
  for i := 0 to Lines.Count - 1 do
  begin
    LWidth := LineWidth[i];
    if LWidth > LMaxWidth then
    begin
      Result := i;
      LMaxWidth := LWidth;
    end;
  end;
end;

function TMemo.GetShowSelection: Boolean;
begin
  Result := IsFocused or not HideSelection;
end;

procedure TMemo.MouseWheel(Shift: TShiftState; WheelDelta: Integer;
  var Handled: Boolean);
begin
  inherited;
  if (VScrollBar <> nil) and (VScrollBar.Visible) then
  begin
    VScrollBar.Value := VScrollBar.Value - (WheelDelta / 30);
  end;
end;

function TMemo.GetData: Variant;
begin
  Result := Text;
end;

function TMemo.GetKeyboardType: TVirtualKeyboardType;
begin
  Result := FKeyboardType;
end;

procedure TMemo.SetData(const Value: Variant);
begin
  Text := Value;
end;

procedure TMemo.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TMemo.SetFontFill(const Value: TBrush);
begin
  FFontFill.Assign(Value);
end;

procedure TMemo.SetTextAlign(const Value: TTextAlign);
begin
  if FTextAlign <> Value then
  begin
    FTextAlign := Value;
    ResetLineWidthCache;
    RepaintEdit;
  end;
end;

procedure TMemo.SetUpdateState(Updating: Boolean);
begin
  FInternalUpdating := Updating;
  if not Updating then
    Realign;
end;

function TMemo.GetUnwrapLines: TStrings;
begin
  if FUnwrapLines = nil then
    FUnwrapLines := TStringList.Create;
  FUnwrapLines.Text := FTextService.Text;
  Result := FUnwrapLines;
end;

{ TEditActionStack }

constructor TEditActionStack.Create(AOwner: TMemo);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TEditActionStack.Destroy;
var
  TmpItem: PEditAction;
begin
  while AtLeast(1) do
  begin
    TmpItem := Pop;
    Finalize(TmpItem^);
    FreeMem(TmpItem);
  end;
  inherited;
end;

procedure TEditActionStack.FragmentDeleted(StartPos: Integer; const Fragment: string);
var
  TmpItem: PEditAction;
begin
  if Fragment = '' then
    Exit;

  if (not AtLeast(1)) or not((PEditAction(Peek)^.ActionType = TActionType.atDelete) and
    (PEditAction(Peek)^.StartPosition - StartPos - Length(Fragment) <= 1) and
    (PEditAction(Peek)^.StartPosition - StartPos >= 0)) then
  begin
    New(TmpItem);
    Initialize(TmpItem^);
    Push(TmpItem);

    with TmpItem^ do
    begin
      ActionType := TActionType.atDelete;
      StartPosition := StartPos;
      DeletedFragment := Fragment;
      PairedWithPrev := False;
    end;
  end
  else
    case PEditAction(Peek)^.ActionType of
      TActionType.atDelete:
        begin
          if StartPos > 0 then
          begin
            if StartPos < PEditAction(Peek)^.StartPosition then
              PEditAction(Peek)^.DeletedFragment := Fragment + PEditAction(Peek)
                ^.DeletedFragment
            else
              PEditAction(Peek)^.DeletedFragment := PEditAction(Peek)
                ^.DeletedFragment + Fragment;
            PEditAction(Peek)^.StartPosition := StartPos;
          end;
        end;
    end;
end;

procedure TEditActionStack.FragmentInserted(StartPos, FragmentLength: Integer; IsPairedWithPrev: Boolean);
var
  TmpItem: PEditAction;
begin
  if FragmentLength = 0 then
    Exit;

  if (not AtLeast(1)) or not((PEditAction(Peek)^.ActionType = TActionType.atInsert) and
    (PEditAction(Peek)^.StartPosition + PEditAction(Peek)^.Length = StartPos))
  then
  begin
    New(TmpItem);
    Initialize(TmpItem^);
    Push(TmpItem);
    with TmpItem^ do
    begin
      ActionType := TActionType.atInsert;
      StartPosition := StartPos;
      Length := FragmentLength;
      PairedWithPrev := IsPairedWithPrev;
    end;
  end
  else
    case PEditAction(Peek)^.ActionType of
      TActionType.atInsert:
        PEditAction(Peek)^.Length := PEditAction(Peek)^.Length + FragmentLength;
    end;
end;

procedure TEditActionStack.CaretMovedBy(Shift: Integer);
begin
end;

function TEditActionStack.RollBackAction: Boolean;
var
  TmpItem: PEditAction;
  WasPaired: Boolean;
  LTmpOptions: TInsertOptions;
begin
  Result := AtLeast(1);
  if not(Result and Assigned(FOwner)) then
    Exit;

  repeat
    TmpItem := Pop;

    with TmpItem^, FOwner do
    begin
      if DeletedFragment <> sLineBreak then
        LTmpOptions := [TInsertOption.ioSelected]
      else
        LTmpOptions := [];

      case ActionType of
        TActionType.atDelete:
          InsertAfter(TextPosToPos(StartPosition - 1), DeletedFragment,
            LTmpOptions + [TInsertOption.ioMoveCaret]
            { DeletedFragment<>#13+#10, True, False, False } );
        TActionType.atInsert:
          DeleteFrom(TextPosToPos(StartPosition), Length, [TDeleteOption.doMoveCaret]);
      end;
    end;

    WasPaired := TmpItem^.PairedWithPrev;
    Finalize(TmpItem^);
    Dispose(TmpItem);
  until (not AtLeast(1)) or (not WasPaired);
end;

initialization
  RegisterFmxClasses([TMemo]);
end.
