{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Edit;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Platform, FMX_Types, FMX_Objects, FMX_Controls, FMX_ListBox, FMX_Menus;

{$SCOPEDENUMS ON}

type

{ TCustomEdit }

  TCustomEdit = class(TStyledControl, ITextServiceControl, IVirtualKeyboardControl)
  private
    FTextService: TTextService;
    FFontFill: TBrush;
    FFont: TFont;
    FTextAlign: TTextAlign;
    FOnChange: TNotifyEvent;
    FReadOnly: Boolean;
    FSelStart: Integer;
    FSelLength: Integer;
    FMaxLength: Integer;
    FFirstVisibleChar: Integer;
    FLMouseSelecting: Boolean;
    FDisableCaret: Boolean;
    FPassword: Boolean;
    FEditPopupMenu: TPopupMenu;
    FTyping: Boolean;
    FOnTyping: TNotifyEvent;
    FSelectionFill: TBrush;
    FKeyboardType: TVirtualKeyboardType;
    FOnChangeTracking: TNotifyEvent;
    FImeMode: TImeMode;
    procedure InsertText(const AText: WideString);
    function GetSelLength: Integer;
    function GetSelStart: Integer;
    function GetSelText: WideString;
    procedure SetSelLength(const Value: Integer);
    procedure SetSelStart(const Value: Integer);
    function GetSelRect: TRectF;
    procedure SetCaretPosition(const Value: Integer);
    function GetCaretPosition: Integer;
    function GetCoordinatePosition(x: Single): Integer;
    procedure SetMaxLength(const Value: Integer);
    procedure UpdateFirstVisibleChar;
    procedure UpdateCaretPosition;
    procedure SetPassword(const Value: Boolean);
    procedure CreatePopupMenu;
    procedure DoCopy(Sender: TObject);
    procedure DoCut(Sender: TObject);
    procedure DoDelete(Sender: TObject);
    procedure DoPaste(Sender: TObject);
    procedure UpdatePopupMenuItems;
    procedure DoSelectAll(Sender: TObject);
    procedure SetFont(const Value: TFont);
    procedure SetTextAlign(const Value: TTextAlign);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(AReadOnly: Boolean);
  protected
    FContent: TControl;
    FNeedChange: Boolean;
    FFilterChar: WideString;
    FShowCaret: Boolean;
    FLastKey: Word;
    FLastChar: System.WideChar;

    function CanObserve(const ID: Integer): Boolean; override;
    procedure ObserverAdded(const ID: Integer; const Observer: IObserver); override;
    procedure ObserverToggle(const AObserver: IObserver; const Value: Boolean);
    procedure RepaintEdit;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Change; virtual;
    procedure DoChangeTracking;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    function GetPasswordCharWidth: Single;
    function TextWidth(const Str: WideString): Single;
    function GetText: WideString; virtual;
    procedure SetText(const Value: WideString); virtual;
    procedure FontChanged(Sender: TObject); virtual;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; x, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; x, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; x, Y: Single); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DblClick; override;
    function GetImeMode: TImeMode; virtual;
    procedure SetImeMode(const Value: TImeMode); virtual;
    { ITextServiceControl }
    function GetTextService: TTextService; virtual;
    procedure UpdateCaretPoint;
    function GetTargetClausePointF: TPointF;
    { IVirtualKeyboardControl }
    procedure SetKeyboardType(Value: TVirtualKeyboardType);
    function GetKeyboardType: TVirtualKeyboardType;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ContextMenu(const ScreenPosition: TPointF); override;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure SelectAll;
    function GetCharX(a: Integer): Single;
    function ContentRect: TRectF;
    property CaretPosition: Integer read GetCaretPosition write SetCaretPosition;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelText: WideString read GetSelText;
    property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
    property ShowCaret: Boolean read FShowCaret write FShowCaret default True;
    property FontFill: TBrush read FFontFill;
    property SelectionFill: TBrush read FSelectionFill;
    property Password: Boolean read FPassword write SetPassword;
    property Text: WideString read GetText write SetText;
    property FilterChar: WideString read FFilterChar write FFilterChar;
    property ImeMode: TImeMode read GetImeMode write SetImeMode default TImeMode.imDontCare;
    property Typing: Boolean read FTyping write FTyping default False;
  published
    property Cursor default crIBeam;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Font: TFont read FFont write SetFont;
    property TextAlign: TTextAlign read FTextAlign write SetTextAlign default TTextAlign.taLeading;
    property StyleLookup;
    property BindingSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property KeyboardType: TVirtualKeyboardType read GetKeyboardType write SetKeyboardType;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeTracking: TNotifyEvent read FOnChangeTracking write FOnChangeTracking;
    property OnTyping: TNotifyEvent read FOnTyping write FOnTyping;
  end;

{ TEdit }

  TEdit = class(TCustomEdit)
  published
    property Password;
    property Text;
    property ImeMode;
  end;

{ TCustomEditBox }

  TNumValueType = (vtInteger, vtFloat);

  TCustomEditBox = class(TCustomEdit)
  private
    FValue: Single;
    FMin: Single;
    FMax: Single;
    FValueType: TNumValueType;
    FDecimalDigits: Integer;
    procedure SetMax(const AMax: Single);
    procedure SetMin(const AMin: Single);
    procedure SetDecimalDigits(const ADecimalDigits: Integer);
    procedure SetValueType(const AValueType: TNumValueType);
  protected
    FHorzIncrement: Single;
    function ConvertValueToText(const AValue: Single): WideString;
    function CorrectRangeValue(const AValue: Single): Single;
    procedure SetText(const AText: WideString); override;
    procedure SetValue(const AValue: Single); virtual;
    procedure DoExit; override;
    procedure Change; override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure KeyDown(var Key: Word; var KeyChar: WideChar; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DecimalDigits: Integer read FDecimalDigits write SetDecimalDigits default 2;
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Value: Single read FValue write SetValue;
    property ValueType: TNumValueType read FValueType write SetValueType default TNumValueType.vtInteger;
    property ShowCaret default True;
    property Text stored False;
  end;

{ TNumberBox }

  TNumberBox = class(TCustomEditBox)
  private
    FPressed: Boolean;
    FPressedPos: TPointF;
    FPressedVert: Boolean;
    FPressedInc: Single;
    FVertIncrement: Single;
  protected
    procedure SetText(const AText: WideString); override;
    procedure SetValue(const AValue: Single); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; x, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure PaintChildren; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property HorzIncrement: Single read FHorzIncrement write FHorzIncrement;
    property VertIncrement: Single read FVertIncrement write FVertIncrement;
  end;

{ TSpinBox }

  TSpinBox = class(TCustomEditBox)
  private
    FMinus: TCustomButton;
    FPlus: TCustomButton;
  protected
    procedure SetText(const AText: WideString); override;
    procedure SetValue(const AValue: Single); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoMinusClick(Sender: TObject);
    procedure DoPlusClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Increment: Single read FHorzIncrement write FHorzIncrement;
    property TextAlign default TTextAlign.taCenter;
  end;

{ TComboEditListBox }

  TComboEdit = class;

  TComboEditListBox = class(TCustomListBox)
  protected
    FComboEdit: TComboEdit;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    function GetObservers: TObservers; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TComboEditBase = class(TCustomEdit)
  protected
    procedure ApplyStyle; override;
    procedure DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single); virtual;
  public
    procedure DropDown; virtual; abstract;
  end;

{ TComboEdit }

  TComboEdit = class(TComboEditBase)
  private
    FDropDownCount: Integer;
    FPopup: TPopup;
    FListBox: TComboEditListBox;
    FPlacement: TPlacement;
    FItems: TWideStrings;
    FItemHeight: Single;
    procedure DoItemsChanged(Sender: TObject);
    procedure RebuildList;
    procedure SetItemHeight(const Value: Single);
    procedure SetItems(const Value: TWideStrings);
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    procedure SetListBox(Value: TComboEditListBox);
    function GetCount: Integer;
    function GetListBoxResource: WideString;
    procedure SetListBoxResource(const Value: WideString);
  protected
    function CreateListBox: TComboEditListBox; virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure Notification(Component: TComponent; Operation: TOperation); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure ChangeParent; override;
    procedure DoTyping(Sender: TObject);
    procedure DoClosePopup(Sender: TObject);
    function GetDefaultStyleLookupName: WideString; override;
    procedure SetText(const Value: WideString); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    procedure DropDown; override;
    procedure Clear;
    property ListBox: TComboEditListBox read FListBox write SetListBox;
    property Count: Integer read GetCount;
  published
    property Cursor default crDefault;
    property DropDownCount: Integer read FDropDownCount write FDropDownCount default 8;
    property ItemHeight: Single read FItemHeight write SetItemHeight;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property Items: TWideStrings read FItems write SetItems;
    property ListBoxResource: WideString read GetListBoxResource write SetListBoxResource;
    property Text;
  end;

{ TComboTrackBar }

  TComboTrackBar = class(TComboEditBase)
  private
    FPopup: TPopup;
    FTrackBar: TTrackBar;
    FPlacement: TPlacement;
    FValue: Single;
    FTrackBarNotify: Boolean; // activates/deactivates trackbar event handling

    function GetFrequency: Single;
    function GetMax: Single;
    function GetMin: Single;
    procedure SetFrequency(const Value: Single);
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetValue(const AValue: Single);
    procedure SetText(const AValue: WideString); override;
  protected
    // converts Value to the given string format
    function GetValueAsString: WideString;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure ChangeParent; override;
    procedure DoTrackChange(Sender: TObject); virtual;
    procedure DropDown; override;
    procedure DoClosePopup(Sender: TObject);
    procedure Change; override;
    procedure DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single); virtual;
    function GetDefaultStyleLookupName: WideString; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property TrackBar: TTrackBar read FTrackBar write FTrackBar;
  published
    property Min: Single read GetMin write SetMin;
    property Max: Single read GetMax write SetMax;
    property Value: Single read FValue write SetValue;
    property Frequency: Single read GetFrequency write SetFrequency;
    property Text;
  end;

{ TClearingEdit }

  TClearingEdit = class(TCustomEdit)
  private
    FClearBtn: TCustomButton;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoClearBtnClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Password;
    property Text;
  end;

implementation

uses
  Variants, SysUtils, StrUtils,
  FMX_Ani, FMX_Consts, Math;

{ TCustomEdit }

constructor TCustomEdit.Create(AOwner: TComponent);
begin
  inherited;
  FTextService := Platform.GetTextServiceClass.Create(self, False);
  FShowCaret := True;
  FFont := TFont.Create;
  FFont.OnChanged := FontChanged;
  FFontFill := TBrush.Create(TBrushKind.bkSolid, $FF000000);
  FFontFill.OnChanged := FontChanged;
  FSelectionFill := TBrush.Create(TBrushKind.bkSolid, $802A8ADF);
  CanFocus := True;
  Cursor := crIBeam;
  TextAlign := TTextAlign.taLeading;
  AutoCapture := True;
  Width := 100;
  Height := 22;
  FSelStart := 0;
  FSelLength := 0;
  FFirstVisibleChar := 1;
  FImeMode := TImeMode.imDontcare;
  CreatePopupMenu;
  SetAcceptsControls(False);
end;

destructor TCustomEdit.Destroy;
begin
  FSelectionFill.Free;
  FFontFill.Free;
  FFont.Free;
  FEditPopupMenu.Free;
  FTextService.Free;
  inherited;
end;

procedure TCustomEdit.CreatePopupMenu;
var
  TmpItem: TMenuItem;
begin
  FEditPopupMenu := TPopupMenu.Create(Self);
  FEditPopupMenu.Stored := False;
  FEditPopupMenu.Parent := Self;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := SEditCut;
    StyleName := 'cut';
    OnClick := DoCut;
  end;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := SEditCopy;
    StyleName := 'copy';
    OnClick := DoCopy;
  end;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := SEditPaste;
    StyleName := 'paste';
    OnClick := DoPaste;
  end;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := SEditDelete;
    StyleName := 'delete';
    OnClick := DoDelete;
  end;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := '-';
  end;
  with TMenuItem.Create(FEditPopupMenu) do
  begin
    Parent := FEditPopupMenu;
    Text := SEditSelectAll;
    StyleName := 'selectall';
    OnClick := DoSelectAll;
  end;
end;

procedure TCustomEdit.DoSelectAll(Sender: TObject);
begin
  SelectAll;
end;

procedure TCustomEdit.DoCut(Sender: TObject);
begin
  CutToClipboard;
end;

procedure TCustomEdit.DoCopy(Sender: TObject);
begin
  CopyToClipboard;
end;

procedure TCustomEdit.DoDelete(Sender: TObject);
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

procedure TCustomEdit.DoPaste(Sender: TObject);
begin
  PasteFromClipboard;
end;

procedure TCustomEdit.UpdatePopupMenuItems;
var
  SelTextIsValid: Boolean;
begin
  SelTextIsValid := SelText <> '';
  TMenuItem(FEditPopupMenu.FindStyleResource('cut')).Enabled := SelTextIsValid and not ReadOnly and not Password;
  TMenuItem(FEditPopupMenu.FindStyleResource('copy')).Enabled := SelTextIsValid and not Password;
  TMenuItem(FEditPopupMenu.FindStyleResource('paste')).Enabled := VarIsStr(Platform.GetClipboard) and not ReadOnly;
  TMenuItem(FEditPopupMenu.FindStyleResource('delete')).Enabled := SelTextIsValid and not ReadOnly;
  TMenuItem(FEditPopupMenu.FindStyleResource('selectall')).Enabled := SelText <> Text;
end;

function TCustomEdit.GetData: Variant;
begin
  Result := Text;
end;

function TCustomEdit.GetKeyboardType: TVirtualKeyboardType;
begin
  Result := FKeyboardType;
end;

procedure TCustomEdit.SetData(const Value: Variant);
begin
  if VarIsNull(Value) then
    Text := ''
  else if VarIsType(Value, varDate) then
    Text := DateTimeToStr(VarToDateTime(Value))
  else if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else
    Text := VarToWideStr(Value);
end;

procedure TCustomEdit.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  Cursor := crIBeam;
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    FContent := TControl(T);
    FContent.OnPaint := DoContentPaint;
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

function TCustomEdit.ContentRect: TRectF;
var
  T: TFmxObject;
begin
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    Result := TControl(T).ParentedRect;
  end
  else
  begin
    Result := LocalRect;
  end;
end;

procedure TCustomEdit.DoChangeTracking;
begin
  if Assigned(FOnChangeTracking) then FOnChangeTracking(Self);  
end;

procedure TCustomEdit.DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
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
  { draw text }
  if (FTextService.Text = '') and (not FTextService.HasMarkedText) then                            
    Exit;

  State := Canvas.SaveState;
  try
    Canvas.IntersectClipRect(ARect);
    Canvas.Font.Assign(Font);
    Canvas.Fill.Assign(FFontFill);

    if FPassword then
    begin
      R := ARect;
      R.Right := R.Left + GetPasswordCharWidth - 1;
      R.Top := (RectHeight(ARect) - RectWidth(R)) / 2;
      R.Bottom := R.Top + RectWidth(R);
      WholeTextWidth := Length(Text) * GetPasswordCharWidth;
      EditRectWidth := ContentRect.Right - ContentRect.Left;
      if WholeTextWidth < EditRectWidth then
        case TextAlign of
          TTextAlign.taTrailing:
            OffsetRect(R, (EditRectWidth - WholeTextWidth), 0);
          TTextAlign.taCenter:
            OffsetRect(R, ((EditRectWidth - WholeTextWidth) / 2), 0);
        end;
      for i := FFirstVisibleChar to Length(Text) do
      begin
        Canvas.FillEllipse(R, AbsoluteOpacity);
        OffsetRect(R, R.Width + 1, 0);
      end;
    end
    else
    begin
      FTextService.DrawSingleLine(Canvas,
        ARect, FFirstVisibleChar, Font,
        AbsoluteOpacity, FillTextFlags, TextAlign, TTextAlign.taCenter);
    end;
    { carret }
    if IsFocused then
    begin
      { selection }
      if SelLength > 0 then
      begin
        Canvas.Fill.Assign(FSelectionFill);
        R := GetSelRect;
        with ContentRect do
          OffsetRect(R, -Left, -Top);
        Canvas.FillRect(R, 0, 0, AllCorners, AbsoluteOpacity);
      end;
    end;
  finally
    Canvas.RestoreState(State);
  end;
end;

procedure TCustomEdit.InsertText(const AText: WideString);
var
  TmpS: WideString;
begin
  if ReadOnly then
    Exit;

  TmpS := Text;
  // FActionStack.FragmentDeleted(SelStart + 1, Copy(TmpS, SelStart+1, SelLength));
  Delete(TmpS, SelStart + 1, SelLength);
  // FActionStack.FragmentInserted(SelStart + 1, Length(AText), SelLength <> 0);
  Insert(AText, TmpS, SelStart + 1);
  if (MaxLength <= 0) or (Length(TmpS) <= MaxLength) then
  begin
    Text := TmpS;
    FNeedChange := True;
    CaretPosition := SelStart + Length(AText);
  end;
  SelLength := 0;
end;

procedure TCustomEdit.UpdateFirstVisibleChar;
var
  MarkedPosition: Integer;
  TempStr: WideString;
  LEditRect: TRectF;
begin
//  MarkedPosition := FTextService.CaretPosition + length( FTextService.InternaGetMarkedText );
//  MarkedPosition := FTextService.TargetClausePosition;  //FTextService.CaretPosition + FTextService.
  MarkedPosition := FTextService.TargetClausePosition.X;
//  TempStr := Copy(Text, 1, FTextService.CaretPosition) + FTextService.InternaGetMarkedText + Copy(Text, FTextService.CaretPosition+1, MaxInt);
  TempStr := FTextService.CombinedText;
  if FFirstVisibleChar >= (MarkedPosition + 1) then
  begin
    FFirstVisibleChar := MarkedPosition;
    if FFirstVisibleChar < 1 then
      FFirstVisibleChar := 1;
  end
  else
  begin
    LEditRect := ContentRect;

    if Password then
      while ((MarkedPosition - FFirstVisibleChar + 1) * GetPasswordCharWidth > LEditRect.Right - LEditRect.Left) and
        (FFirstVisibleChar < Length(TempStr)) do
        Inc(FFirstVisibleChar)
    else
    begin
      while
        (TextWidth(Copy(TempStr, FFirstVisibleChar, MarkedPosition - FFirstVisibleChar + 1)) > LEditRect.Right - LEditRect.Left)
    and (FFirstVisibleChar < Length(TempStr)) do
      begin
        if TextWidth(Copy(TempStr, FFirstVisibleChar + 500, (MarkedPosition - FFirstVisibleChar + 500) + 1)) >
          LEditRect.Right - LEditRect.Left then
          Inc(FFirstVisibleChar, 500)
        else if TextWidth(Copy(TempStr, FFirstVisibleChar + 100, (MarkedPosition - FFirstVisibleChar + 100) + 1)) >
          LEditRect.Right - LEditRect.Left then
          Inc(FFirstVisibleChar, 100)
        else if TextWidth(Copy(TempStr, FFirstVisibleChar + 50, (MarkedPosition - FFirstVisibleChar + 50) + 1)) >
          LEditRect.Right - LEditRect.Left then
          Inc(FFirstVisibleChar, 50)
        else if TextWidth(Copy(TempStr, FFirstVisibleChar + 10, (MarkedPosition - FFirstVisibleChar + 10) + 1)) >
          LEditRect.Right - LEditRect.Left then
          Inc(FFirstVisibleChar, 10)
        else
          Inc(FFirstVisibleChar);
      end;
    end;
  end;
  RepaintEdit;
end;

procedure TCustomEdit.UpdateCaretPosition;
begin
  SetCaretPosition(CaretPosition);
end;

function TCustomEdit.GetPasswordCharWidth: Single;
begin
  Result := Font.Size / 2;
end;

function TCustomEdit.TextWidth(const Str: WideString): Single;
var
  R: TRectF;
begin
  R := ContentRect;
  R.Right := 10000;
  GetMeasureBitmap.Canvas.Font.Assign(Font);
  if FPassword then
  begin
    R.Right := R.Left + GetPasswordCharWidth * Length(Str);
  end
  else
    GetMeasureBitmap.Canvas.MeasureText(R, Str, False, FillTextFlags, TTextAlign.taLeading, TTextAlign.taCenter);
  Result := RectWidth(R);
end;

function TCustomEdit.GetCoordinatePosition(x: Single): Integer;
var
  CurX: double;
  TmpX, WholeTextWidth, EditRectWidth: Single;
  Str, StrA: WideString;
begin
  Result := FFirstVisibleChar - 1;
  if Length(Text) = 0 then
    Exit;

  if FPassword then
    WholeTextWidth := Length(Text) * GetPasswordCharWidth
  else
    WholeTextWidth := TextWidth(Copy(Text, 1, Length(Text)));

  EditRectWidth := ContentRect.Right - ContentRect.Left;
  TmpX := x;
  if WholeTextWidth < EditRectWidth then
    case TextAlign of
      TTextAlign.taTrailing:
        TmpX := x - (EditRectWidth - WholeTextWidth);
      TTextAlign.taCenter:
        TmpX := x - ((EditRectWidth - WholeTextWidth) / 2);
    end;

  if FPassword then
  begin
    Result := Result + Trunc((TmpX - ContentRect.Left) / GetPasswordCharWidth);
    if Result < 0 then
      Result := 0
    else if Result > Length(Text) then
      Result := Length(Text);
  end
  else
  begin
    TmpX := TmpX - ContentRect.Left;
    StrA := System.Copy(Text, FFirstVisibleChar, Result - FFirstVisibleChar + 1);
    Str := System.Copy(Text, FFirstVisibleChar, Result - FFirstVisibleChar + 2);
    while (TextWidth(StrA) < TmpX) and (Result < Length(Text)) do
    begin
      if (TmpX > TextWidth(StrA) + ((TextWidth(Str) - TextWidth(StrA)) / 2)) and (TmpX < TextWidth(Str)) then
      begin
        Result := Result + 1;
        Break;
      end;
      if TmpX < TextWidth(Str) then
        Break;
      Result := Result + 1;
      StrA := Str;
      Str := Copy(Text, FFirstVisibleChar, Result - FFirstVisibleChar + 2);
    end;
  end;
end;

function TCustomEdit.GetCharX(a: Integer): Single;
var
  WholeTextWidth: Single;
  EditRectWidth: Single;
  R: TRectF;
  T: WideString;
begin
  if FPassword then
  begin
    WholeTextWidth := Length(Text) * GetPasswordCharWidth;
    Result := ContentRect.Left;
    if a > 0 then
    begin
      if FPassword then
      begin
        if a <= Length(Text) then
          Result := Result + (a - FFirstVisibleChar + 1) * GetPasswordCharWidth
        else
          Result := Result + (Length(Text) - FFirstVisibleChar + 1) * GetPasswordCharWidth;
      end
    end;
    EditRectWidth := ContentRect.Right - ContentRect.Left;
    if WholeTextWidth < EditRectWidth then
      case TextAlign of
        TTextAlign.taTrailing:
          Result := Result + (EditRectWidth - WholeTextWidth);
        TTextAlign.taCenter:
          Result := Result + ((EditRectWidth - WholeTextWidth) / 2);
      end;
    Exit;
  end;

  R := ContentRect;
  GetMeasureBitmap.Canvas.Font.Assign(Font);
  T := FTextService.CombinedText;
  if T = '' then
    T := 'a';
  GetMeasureBitmap.Canvas.MeasureText(R, T, False, FillTextFlags, TTextAlign.taLeading, TTextAlign.taCenter);
  WholeTextWidth := R.Right - ContentRect.Left;
  Result := ContentRect.Left;

  if a > 0 then
  begin
    if a <= Length(FTextService.CombinedText) then
    begin
      R := ContentRect;
      GetMeasureBitmap.Canvas.MeasureText(R, Copy(T, FFirstVisibleChar, a - FFirstVisibleChar + 1), False, FillTextFlags,
        TTextAlign.taLeading, TTextAlign.taCenter);
      Result := R.Right;
    end
    else
    begin
      R := ContentRect;
    end;
  end;

  EditRectWidth := ContentRect.Right - ContentRect.Left;
  if WholeTextWidth < EditRectWidth then
    case TextAlign of
      TTextAlign.taTrailing:
        Result := Result + (EditRectWidth - WholeTextWidth);
      TTextAlign.taCenter:
        Result := Result + ((EditRectWidth - WholeTextWidth) / 2);
    end;
end;

function TCustomEdit.GetReadOnly: Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    Result := TLinkObservers.EditLinkIsReadOnly(Observers)
  else
    Result := FReadOnly;
end;

function TCustomEdit.GetSelStart: Integer;
begin
  if FSelLength > 0 then
    Result := FSelStart
  else if FSelLength < 0 then
    Result := FSelStart + FSelLength
  else
    Result := CaretPosition;
end;

function TCustomEdit.GetSelRect: TRectF;
begin
  Result := ContentRect;
  Result.Left := GetCharX(SelStart);
  Result.Right := GetCharX(SelStart + SelLength) + 1;
end;

function TCustomEdit.GetSelLength: Integer;
begin
  Result := Abs(FSelLength);
end;

function TCustomEdit.GetSelText: WideString;
begin
  Result := Copy(Text, SelStart + 1, SelLength);
end;

procedure TCustomEdit.SetSelLength(const Value: Integer);
begin
  if FSelLength <> Value then
  begin
    FSelLength := Value;
    RepaintEdit;
  end;
end;

procedure TCustomEdit.SetSelStart(const Value: Integer);
begin
  if FSelStart <> Value then
  begin
    SelLength := 0;
    FSelStart := Value;
    CaretPosition := FSelStart;
    RepaintEdit;
  end;
end;

procedure TCustomEdit.SetCaretPosition(const Value: Integer);
var
  P: TPoint;
begin
  P.X := 0; P.Y := 0;
  if Value < 0 then
    P.X := 0
  else if Value > Length(Text) then
    P.X := Length(Text)
  else
    P.X := Value;
  FTextService.CaretPosition := P;

  UpdateFirstVisibleChar;

  if SelLength <= 0 then
    FSelStart := Value;

  RepaintEdit;

  if IsFocused and FShowCaret then
  begin
    SetCaretSize(PointF(1, (Font.Size * 1.25)));
    if FTextService.HasMarkedText then
//      SetCaretPos(PointF(GetCharX(FCaretPosition) - 1 + TextWidth(FMarkedText), (ContentRect.Top + ContentRect.Bottom - (Font.Size * 1.25)) / 2))
      SetCaretPos(
        PointF(GetCharX(FTextService.TargetClausePosition.X) - 1,
               (ContentRect.Top + ContentRect.Bottom - (Font.Size * 1.25)) / 2)
//        PointF(GetCharX(FTextService.CaretPosition.X + Length(FTextService._InternaGetMarkedText)) - 1,
//               (ContentRect.Top + ContentRect.Bottom - (Font.Size * 1.25)) / 2)
      )
    else
      SetCaretPos(PointF(GetCharX(FTextService.CaretPosition.X) - 1, (ContentRect.Top + ContentRect.Bottom - (Font.Size * 1.25)) / 2));
//    SetCaretPos(PointF(GetCharX(FCaretPosition) - 1, (ContentRect.Top + ContentRect.Bottom - (Font.Size * 1.25)) / 2));
    SetCaretColor(FFontFill.Color);
  end;
end;

function TCustomEdit.GetCaretPosition: Integer;
begin
  Result := FTextService.CaretPosition.X;
end;

procedure TCustomEdit.SetMaxLength(const Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
  end;
end;

procedure TCustomEdit.CopyToClipboard;
begin
  if (SelText <> '') and not Password then
    Platform.SetClipboard(SelText);
end;

procedure TCustomEdit.PasteFromClipboard;
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

  if VarIsStr(Platform.GetClipboard) then
    InsertText(Platform.GetClipboard);
end;

procedure TCustomEdit.RepaintEdit;
begin
  if FContent <> nil then
  begin
    FContent.Repaint;
  end;
end;

procedure TCustomEdit.ClearSelection;
var
  TmpS: WideString;
begin
  if ReadOnly then
    Exit;

  TmpS := Text;
  // FActionStack.FragmentDeleted(SelStart+1, Copy(TmpS,SelStart+1,SelLength));
  Delete(TmpS, SelStart + 1, SelLength);
  CaretPosition := SelStart;
  Text := TmpS;
  SelLength := 0;
end;

procedure TCustomEdit.CutToClipboard;
begin
  // if PasswordKind = pkNone then

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

procedure TCustomEdit.SelectAll;
begin
  SelStart := 0;
  SelLength := Length(Text);
  SetCaretPosition(Length(Text));
  RepaintEdit;
end;

procedure TCustomEdit.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  S: wideString;
  TmpS: WideString;
  OldCaretPosition: Integer;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if (Key = vkBack) or (Key = vkDelete) or ((Key = vkInsert) and (ssShift in Shift)) then
      if not TLinkObservers.EditLinkEdit(Observers) then
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
        end;
      #27:
        begin
          TLinkObservers.EditLinkReset(Observers);
          SelectAll;
          KeyChar := #0;
          Exit;
        end;
    end;

    if TLinkObservers.EditLinkIsEditing(Observers) then
      TLinkObservers.EditLinkModified(Observers);
  end;

  inherited;
  OldCaretPosition := CaretPosition;
  FLastChar := KeyChar;
  FLastKey := Key;
  case Key of
    vkReturn:
      begin
        Typing:= False;
        Change;
        if Observers.IsObserving(TObserverMapping.EditLinkID) then
          TLinkObservers.EditLinkUpdate(Observers);
      end;
    vkEnd:
      CaretPosition := Length(Text);
    vkHome:
      CaretPosition := 0;
    vkLeft:
      if ssCtrl in Shift then
        CaretPosition := FTextService.GetPrevWordBeginPosition(CaretPosition)
      else
        CaretPosition := FTextService.GetPrevCharacterPosition(CaretPosition);                                                    
    vkRight:
      if ssCtrl in Shift then
        CaretPosition := FTextService.GetNextWordBeginPosition(CaretPosition)
      else
        CaretPosition := FTextService.GetNextCharacterPosition(CaretPosition);                                                    
    vkDelete, 8: { Delete or BackSpace key was pressed }
      if not ReadOnly then
      begin
        if SelLength <> 0 then
        begin
          if Shift = [ssShift] then
            CutToClipboard
          else
            ClearSelection;
        end
        else
        begin
          TmpS := Text;
          if TmpS <> '' then
            if Key = vkDelete then
            begin
              // FActionStack.FragmentDeleted(CaretPosition + 1,TmpS[CaretPosition + 1]);
              Delete(TmpS, CaretPosition + 1, 1);
            end
            else
            begin { BackSpace key was pressed }
              { if CaretPosition > 0 then
                FActionStack.FragmentDeleted(CaretPosition,TmpS[CaretPosition]); }
              Delete(TmpS, CaretPosition, 1);
              CaretPosition := CaretPosition - 1;
            end;
          Text := TmpS;
          if Assigned(FOnTyping) then
            FOnTyping(Self);
        end;
      end;
    vkInsert:
      if Shift = [ssCtrl] then
      begin
        CopyToClipboard;
      end
      else if Shift = [ssShift] then
      begin
        PasteFromClipboard;
        if Assigned(FOnTyping) then
          FOnTyping(Self);
      end;
  end;

  if (KeyChar <> #0) and (FFilterChar <> '') and (Pos(KeyChar, FFilterChar) = 0) then
  begin
    KeyChar := #0;
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
          if Assigned(FOnTyping) then
            FOnTyping(Self);
          KeyChar := #0;
        end;
      ^X:
        begin
          CutToClipboard;
          if Assigned(FOnTyping) then
            FOnTyping(Self);
          KeyChar := #0;
        end;
      ^Z:
        begin
          { UnDo };
          if Observers.IsObserving(TObserverMapping.EditLinkID) then
            TLinkObservers.EditLinkReset(Observers);
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
          if Assigned(FOnTyping) then
            FOnTyping(Self);
          KeyChar := #0;
        end;
      'x','X':
        begin
          CutToClipboard;
          if Assigned(FOnTyping) then
            FOnTyping(Self);
          KeyChar := #0;
        end;
      'z','Z':
        begin
          { UnDo };
          if Observers.IsObserving(TObserverMapping.EditLinkID) then
            TLinkObservers.EditLinkReset(Observers);
          KeyChar := #0;
        end;
    end;
  {$ENDIF}

  if Key in [vkEnd, vkHome, vkLeft, vkRight] then
  begin
    if ssShift in Shift then
    begin
      if SelLength = 0 then
        FSelStart := OldCaretPosition;
      FSelStart := CaretPosition;
      FSelLength := FSelLength - (CaretPosition - OldCaretPosition);
    end
    else
      FSelLength := 0;
    RepaintEdit;
  end;

  if (Ord(KeyChar) >= 32) and not ReadOnly then
  begin
    Typing:= True;
    S := KeyChar;
    InsertText(S);
    if Assigned(FOnTyping) then
      FOnTyping(Self);
  end;
  if (FResourceLink <> nil) and (FResourceLink is TControl) then
    TControl(FResourceLink).UpdateEffects;
  UpdateCaretPosition;
end;

procedure TCustomEdit.DblClick;
begin
  inherited;
  SelectAll;
end;

function TCustomEdit.GetTextService: TTextService;
begin
  Result := FTextService;
end;

procedure TCustomEdit.UpdateCaretPoint;
begin
  SetCaretPosition(CaretPosition);
  Repaint;
end;

function TCustomEdit.GetTargetClausePointF: TPointF;
var
  Str: WideString;
begin
  Str := Copy(FTextService.CombinedText, 1, Round(FTextService.TargetClausePosition.X) );
  if FFirstVisibleChar > 1 then
    Str := Copy(Str, FFirstVisibleChar, MaxInt);
  Result.X := TextWidth(Str);
  Result.Y := (ContentRect.Height / 2) + Font.Size / 2 + 2;  // 2 is small space between conrol and IME window
  Result.X := Result.X + ContentRect.Top + Self.Position.Point.X;
  Result.Y := Result.Y + ContentRect.Left + Self.Position.Point.Y;
 end;

function TCustomEdit.GetImeMode: TImeMode;
begin
  Result := FImeMode;
end;

procedure TCustomEdit.SetImeMode(const Value: TImeMode);
begin
  FImeMode := Value;
  if Password then
    FTextService.SetImeMode(TImeMode.imDisable)
  else
    FTextService.SetImeMode(FImeMode);
end;

procedure TCustomEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; x, Y: Single);
var
  OldFocused: Boolean;
begin
  inherited;
  OldFocused := IsFocused;
  if Button = TMouseButton.mbLeft then
    FLMouseSelecting := True;

  if (Button = TMouseButton.mbLeft) and not(ssDouble in Shift) then
  begin
    if OldFocused then // clear only already focused
    begin
      CaretPosition := GetCoordinatePosition(x);
      SelLength := 0;
    end;
  end;
end;

procedure TCustomEdit.MouseMove(Shift: TShiftState; x, Y: Single);
var
  OldCaretPosition: Integer;
  TmpNewPosition: Integer;
begin
  inherited;
  if FLMouseSelecting then
  begin
    TmpNewPosition := GetCoordinatePosition(x);
    OldCaretPosition := CaretPosition;
    if (x > ContentRect.Right) then
      CaretPosition := TmpNewPosition + 1
    else
      CaretPosition := TmpNewPosition;
    if SelLength = 0 then
      FSelStart := OldCaretPosition;
    FSelStart := CaretPosition;
    FSelLength := FSelLength - (CaretPosition - OldCaretPosition);
  end;
end;

procedure TCustomEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; x, Y: Single);
begin
  inherited;
  FLMouseSelecting := False;
end;

function TCustomEdit.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
end;

procedure TCustomEdit.ObserverAdded(const ID: Integer; const Observer: IObserver);
begin
  if ID = TObserverMapping.EditLinkID then
    Observer.OnObserverToggle := ObserverToggle;
end;

procedure TCustomEdit.ObserverToggle(const AObserver: IObserver; const Value: Boolean);
var
  LEditLinkObserver: IEditLinkObserver;
begin
  if Value then
  begin
    if Supports(AObserver, IEditLinkObserver, LEditLinkObserver) then
    begin
      ReadOnly := LEditLinkObserver.IsReadOnly;
    end;
  end
  else
  begin
                                                                                
  end;
end;

procedure TCustomEdit.Change;
begin
  if FNeedChange then
  begin
    if Assigned(FBindingObjects) then
      ToBindingObjects;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCustomEdit.ContextMenu(const ScreenPosition: TPointF);
begin
  if PopupMenu <> nil then
    inherited ContextMenu(ScreenPosition)
  else if not (csDesigning in ComponentState) then
  begin
    UpdatePopupMenuItems;
    FEditPopupMenu.PopupComponent := Self;
    FEditPopupMenu.Popup(round(ScreenPosition.X), round(ScreenPosition.Y));
  end;
end;

procedure TCustomEdit.DoEnter;
begin
  inherited;
  FNeedChange := False;
  if FShowCaret then
    ShowCaretProc;
  if Platform.ShowVirtualKeyboard(Self) then
    CaretPosition := Length(Text)
  else
    SelectAll;
end;

procedure TCustomEdit.DoExit;
begin
  if Assigned(FScene) then
  begin
    Platform.HideVirtualKeyboard;
    if FShowCaret then
      HideCaret;
    inherited;
    Change;

    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      TLinkObservers.EditLinkUpdate(Observers);
  end else
    inherited;
end;

function TCustomEdit.GetText: WideString;
begin
  Result := FTextService.Text;
end;

procedure TCustomEdit.SetText(const Value: WideString);
begin
  if FTextService.Text <> Value then
  begin
    FTextService.Text := Value;
    if FTextService.CaretPosition.X > Length(Text) then
      SetCaretPosition(Length(Text));
    if not (csLoading in ComponentState) then
      DoChangeTracking;
    FNeedChange := True;
    RepaintEdit;
  end;
end;

procedure TCustomEdit.SetPassword(const Value: Boolean);
begin
  if FPassword <> Value then
  begin
    FPassword := Value;
    if FPassword then FTextService.SetImeMode(TImeMode.imDisable)
    else
      FTextService.SetImeMode(Self.ImeMode);
    RepaintEdit;
  end;
end;

procedure TCustomEdit.SetReadOnly(AReadOnly: Boolean);
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkSetIsReadOnly(Observers, AReadOnly)
  else
    FReadOnly := AReadOnly;
end;

procedure TCustomEdit.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TCustomEdit.SetKeyboardType(Value: TVirtualKeyboardType);
begin
  FKeyboardType := Value;
end;

procedure TCustomEdit.SetTextAlign(const Value: TTextAlign);
begin
  if FTextAlign <> Value then
  begin
    FTextAlign := Value;
    RepaintEdit;
  end;
end;

procedure TCustomEdit.FontChanged(Sender: TObject);
begin
  RepaintEdit;
end;

procedure TCustomEdit.FreeStyle;
begin
  inherited;
  FContent := nil;
end;

{ TCustomEditBox }

procedure TCustomEditBox.Change;
begin
  inherited;
  FNeedChange := False;
end;

function TCustomEditBox.ConvertValueToText(const AValue: Single): WideString;
begin
  if (Frac(AValue) = 0) or (FValueType = TNumValueType.vtInteger) then
    Result := IntToStr(Trunc(AValue))
  else
    Result := FloatToStrF(AValue, ffFixed, 10, FDecimalDigits);
end;

function TCustomEditBox.CorrectRangeValue(const AValue: Single): Single;
begin
  Result := AValue;

  if AValue > Max then
    Result := Max;
  if AValue < Min then
    Result := Min;
end;

constructor TCustomEditBox.Create(AOwner: TComponent);
begin
  inherited;
  FDecimalDigits := 2;
  FMax := 10;
  FHorzIncrement := 1;
  ValueType := TNumValueType.vtInteger;
  FFilterChar := '0123456789-+';
  Text := '0';
end;

procedure TCustomEditBox.DoExit;
var
  ValueTmp: Single;
begin
  inherited;
  if not TryStrToFloat(Text, ValueTmp, FormatSettings) then Text := ConvertValueToText(Value);
end;

function TCustomEditBox.GetData: Variant;
begin
  Result := Value;
end;

procedure TCustomEditBox.KeyDown(var Key: Word; var KeyChar: WideChar;
  Shift: TShiftState);

  function IsDuplicateDecimalSeparator(AKeyChar: WideChar): Boolean;
  begin
    Result := ((AKeyChar = '.') or (AKeyChar = ','))and
              ((Pos(',', Text) <> 0) or (Pos('.', Text) <> 0));
  end;

  function IsInvalidSign: Boolean;
  begin
    Result := (SelStart <> 0) and ((KeyChar = '+') or (KeyChar = '-'));
  end;

begin
  case Key of
    vkUp:
      Value := Value + FHorzIncrement;
    vkDown:
      Value := Value - FHorzIncrement;
  else
    if IsDuplicateDecimalSeparator(KeyChar) or IsInvalidSign then
      Exit;
    inherited;
  end;
  Key := 0;
end;

procedure TCustomEditBox.SetData(const Value: Variant);
begin
  if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else
    Self.Value := Value;
end;

procedure TCustomEditBox.SetDecimalDigits(const ADecimalDigits: Integer);
begin
  if FDecimalDigits <> ADecimalDigits then
  begin
    if ADecimalDigits < 0 then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [ClassName]);
    FDecimalDigits := ADecimalDigits;
    GetTextService.Text := ConvertValueToText(FValue);
    RepaintEdit;
  end;
end;

procedure TCustomEditBox.SetMax(const AMax: Single);
begin
  if FMax <> AMax then
  begin
    if AMax < FMin then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [ClassName]);
    FMax := AMax;
    if Value > FMax then
      Value := FMax;
    RepaintEdit;
  end;
end;

procedure TCustomEditBox.SetMin(const AMin: Single);
begin
  if FMin <> AMin then
  begin
    if AMin > FMax then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [ClassName]);
    FMin := AMin;
    if Value < FMin then
      Value := FMin;
    RepaintEdit;
  end;
end;

procedure TCustomEditBox.SetValueType(const AValueType: TNumValueType);
begin
  if FValueType <> AValueType then
  begin
    FValueType := AValueType;
    if AValueType = TNumValueType.vtInteger then
    begin
      FFilterChar := '0123456789-+';
      if Frac(FHorzIncrement) <> 0 then
        FHorzIncrement := Trunc(FHorzIncrement);
    end
    else
      FFilterChar := '0123456789.,-+';
    GetTextService.Text := ConvertValueToText(Value);
    RepaintEdit;
  end;
end;

procedure TCustomEditBox.SetText(const AText: WideString);
var
  ValueTmp: Extended;
  TextTmp: WideString;
begin
  TextTmp := AText;
  if TryStrToFloat(AText, ValueTmp, FormatSettings) then
  begin
    if not SameValue(Value, ValueTmp) then
    begin
      ValueTmp := Trunc(ValueTmp * Power(10, DecimalDigits)) / Power(10, DecimalDigits);
      FValue := CorrectRangeValue(ValueTmp);
      TextTmp := ConvertValueToText(FValue);
    end;
  end;

  inherited SetText(TextTmp);
end;

procedure TCustomEditBox.SetValue(const AValue: Single);
var
  ValueTmp: Single;
begin
  ValueTmp := CorrectRangeValue(AValue);
  if Value <> ValueTmp then
  begin
    FValue := ValueTmp;
    GetTextService.Text := ConvertValueToText(FValue);
    SelLength := 0;
    FNeedChange := True;
    Repaint;
    DoChangeTracking;
  end;
end;

{ TNumberBox }

constructor TNumberBox.Create(AOwner: TComponent);
begin
  inherited;
  VertIncrement := 5;
  HorzIncrement := 1;
  AutoCapture := True;
end;

procedure TNumberBox.SetText(const AText: WideString);
var
  OldText: WideString;
begin
  OldText := Text;
  inherited;
  if not (csLoading in ComponentState) and not FPressed and (OldText <> Text) then
    Change;
end;

procedure TNumberBox.SetValue(const AValue: Single);
var
  OldValue: Single;
begin
  OldValue := Value;
  inherited;
  if not (csLoading in ComponentState) and not FPressed and not SameValue(OldValue, Value) then
    Change;
end;

procedure TNumberBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressed := True;
    FPressedPos := PointF(X, Y);
    FPressedVert := False;
    FPressedInc := 0;
  end;
end;

procedure TNumberBox.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressed then
  begin
    if Abs(x - FPressedPos.X) >= Abs(Y - FPressedPos.Y) then
    begin
      { horz }
      if x > FPressedPos.x then
        Value := Value + HorzIncrement
      else
      if x < FPressedPos.x then
        Value := Value - HorzIncrement;

      FPressedInc := x - FPressedPos.x;
      FPressedVert := False;
    end
    else
    begin
      { vert }
      if Y < FPressedPos.Y then
        Value := Value + VertIncrement
      else
      if Y > FPressedPos.Y then
        Value := Value - VertIncrement;

      FPressedInc := x - FPressedPos.x;
      FPressedVert := True;
    end;
    FPressedPos := PointF(X, Y);
  end;
end;

procedure TNumberBox.MouseUp(Button: TMouseButton; Shift: TShiftState; x, Y: Single);
begin
  inherited;
  if FPressed then
  begin
    FPressed := False;
    Change;
    Repaint;
  end;
end;

procedure TNumberBox.PaintChildren;
var
  R: TRectF;
begin
  if FPressed then
    FDisableCaret := True;
  inherited;
  if FPressed then
  begin
    Canvas.SetMatrix(AbsoluteMatrix);
    Canvas.Fill.Kind := TBrushKind.bkSolid;
    Canvas.Fill.Color := $AA505050;
    R := LocalRect;
    if FPressedVert then
    begin
      InflateRect(R, -1, -1);
      R.Left := R.Right - 5;
      Canvas.FillRect(R, 1, 1, AllCorners, AbsoluteOpacity);
      InflateRect(R, -1, -1);
      { if FPressedInc > 0 then
        begin
        Canvas.Fill.Color := $AA202020;
        R.Top := (RectHeight(R) / 2);
        R.Bottom := R.Top + (Height / 2.1);
        Canvas.FillRect(R, 1, 1, AbsoluteOpacity);
        end;
        if FPressedInc < 0 then
        begin
        Canvas.Fill.Color := $AA202020;
        R.Bottom := (RectHeight(R) / 2);
        R.Top := R.Bottom - (Height / 2.1);
        Canvas.FillRect(R, 1, 1, AbsoluteOpacity);
        end; }
    end
    else
    begin
      InflateRect(R, -1, -1);
      R.Top := R.Bottom - 5;
      Canvas.FillRect(R, 1, 1, AllCorners, AbsoluteOpacity);
      InflateRect(R, -1, -1);
      { if FPressedInc > 0 then
        begin
        Canvas.Fill.Color := $AA202020;
        R.Left := (RectWidth(R) / 2);
        R.Right := R.Left + (Width / 2.1);
        Canvas.FillRect(R, 1, 1, AbsoluteOpacity);
        end;
        if FPressedInc < 0 then
        begin
        Canvas.Fill.Color := $AA202020;
        R.Right := (RectWidth(R) / 2);
        R.Left := R.Right - (Width / 2.1);
        Canvas.FillRect(R, 1, 1, AbsoluteOpacity);
        end; }
    end;
  end;
  if FPressed then
    FDisableCaret := False;
end;

{ TSpinBox }

constructor TSpinBox.Create(AOwner: TComponent);
begin
  inherited;
  TextAlign := TTextAlign.taCenter;
  Increment := 1;
end;

procedure TSpinBox.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('minusbutton');
  if (B <> nil) and (B is TCustomButton) then
  begin
    FMinus := TCustomButton(B);
    FMinus.OnClick := DoMinusClick;
  end;
  B := FindStyleResource('plusbutton');
  if (B <> nil) and (B is TCustomButton) then
  begin
    FPlus := TCustomButton(B);
    FPlus.OnClick := DoPlusClick;
  end;
end;

procedure TSpinBox.FreeStyle;
begin
  inherited;
  FMinus := nil;
  FPlus := nil;
end;

procedure TSpinBox.DoMinusClick(Sender: TObject);
begin
  SetFocus;
  Value := Value - Increment;
end;

procedure TSpinBox.DoPlusClick(Sender: TObject);
begin
  SetFocus;
  Value := Value + Increment;
end;

procedure TSpinBox.SetText(const AText: WideString);
var
  OldText: WideString;
begin
  OldText := Text;
  inherited;
  if not (csLoading in ComponentState) and (OldText <> Text) then
    Change;
end;

procedure TSpinBox.SetValue(const AValue: Single);
var
  OldValue: Single;
begin
  OldValue := Value;
  inherited;
  if not (csLoading in ComponentState) and not SameValue(Value, OldValue) then
    Change;
end;

{ TComboEditBase }

procedure TComboEditBase.ApplyStyle;
var
  T : TFMXObject;
begin
  inherited;
  T := FindStyleResource('arrow');
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).Cursor := crDefault;
    TControl(T).HitTest := true;
    TControl(T).OnMouseDown := Self.DoComboMouseDown;
  end;
end;

procedure TComboEditBase.DoComboMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = TMouseButton.mbLeft) then
    DropDown
end;

{ TComboEdit }

type
  THackComboListBox = class(TComboEditListBox);

procedure TComboEdit.Clear;
begin
  FListBox.Clear;
end;

constructor TComboEdit.Create(AOwner: TComponent);
begin
  inherited;
  DropDownCount := 8;
  Cursor := crDefault;
  FItemHeight := 19;
  FItems := TWideStringList.Create;
  TWideStringList(FItems).OnChange := DoItemsChanged;
  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle';
  FPopup.PlacementTarget := Self;
  FPopup.StaysOpen := False;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.DesignVisible := False;
  FPopup.OnClosePopup := DoClosePopup;
  FPopup.DragWithParent := True;
  FListBox := CreateListBox;
  FListBox.Parent := FPopup;
  FListBox.ItemHeight := ItemHeight;
  FListBox.Stored := False;
  FListBox.Align := TAlignLayout.alClient;
  FListBox.ShowCheckboxes := False;
  FListBox.ItemIndex := -1;
  OnTyping := DoTyping;
end;

function TComboEdit.CreateListBox: TComboEditListBox;
begin
  Result := TComboEditListBox.Create(Self);
end;

destructor TComboEdit.Destroy;
begin
  FreeAndNil(FItems);
  FCaret := nil;
  inherited;
end;

procedure TComboEdit.DoItemsChanged(Sender: TObject);
begin
  RebuildList;
end;

procedure TComboEdit.RebuildList;
var
  SaveI, i: Integer;
  Item: TListBoxItem;
  y: Single;
begin
  if csDestroying in ComponentState then
    Exit;
  if Items = nil then
    Exit;

  FListBox.BeginUpdate;
  SaveI := FListBox.ItemIndex;
  FListBox.ItemIndex := -1;
  FListBox.Clear;
  y := 0;
  for i := 0 to FItems.Count - 1 do
  begin
    // normally setting the parent should adjust the size of the items,
    // but because it doesn't really work like that, the size of the item is
    // explicitly set
    Item := TListBoxItem.Create(FListBox);
    Item.Parent := FListBox;
    Item.AutoTranslate := FAutoTranslate;
    Item.Height := FItemHeight;
    Item.Stored := False;
    Item.Locked := True;
    Item.Text := FItems[i];
    Item.SetBounds(0, y, FListBox.Width, FItemHeight);
    y := y + FItemHeight;
  end;

  if SaveI >= FListBox.Count then
    SaveI := FListBox.Count - 1;
  FListBox.ItemIndex := SaveI;
  FListBox.EndUpdate;
end;

procedure TComboEdit.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  i: Integer;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if (KeyChar > ' ') or
      (Key in [vkUp, vkDown]) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit
      else
        TLinkObservers.EditLinkEdit(Observers);
  inherited;
  if Count > 0 then
  begin
    if ReadOnly and (KeyChar <> #0) then
    begin
      for i := 0 to Count - 1 do
        if (FListBox.ListItems[i].Text <> '') and (WideLowerCase(FListBox.ListItems[i].Text[1]) = WideLowerCase(KeyChar)) then
        begin
          ItemIndex := i;
          Break;
        end;
      KeyChar := #0;
    end;
    case Key of
      vkUp:
        If ItemIndex > 0 then
        begin
          ItemIndex := ItemIndex - 1;
          if ItemIndex < 0 then
            ItemIndex := 0;
        end;
      vkDown:
        begin
          If ItemIndex < Count - 1 then
            ItemIndex := ItemIndex + 1;
          if ItemIndex > Count - 1 then
            ItemIndex := Count - 1;
        end;
    else
      Exit;
    end;
    TLinkObservers.ListSelectionChanged(Observers);
    Key := 0;
  end;
end;

procedure TComboEdit.Realign;
begin
  inherited;
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  { FContent }
  if FPopup <> nil then
    FPopup.Width := Width;
  if FListBox <> nil then
    FListBox.Width := Width;
  FDisableAlign := False;
end;

procedure TComboEdit.DoClosePopup(Sender: TObject);
begin
  if Assigned(FCaret) and ShowCaret and IsFocused then
    ShowCaretProc;
end;

procedure TComboEdit.DropDown;
var
  Count, i: Integer;
begin
  if not FPopup.IsOpen then
  begin
    if ShowCaret then
      HideCaret;
    FPopup.Placement := FPlacement;
    FPopup.Width := Width;
    Count := DropDownCount;
    if FListBox.Count < Count then
      Count := FListBox.Count;
    if THackComboListBox(FListBox).ItemHeight > 0 then
      FPopup.Height := Count * FListBox.ItemHeight + 4
    else
      FPopup.Height := Count * (Height - 4);
    THackComboListBox(FListBox).FNeedStyleLookup := True;
    FListBox.ApplyStyleLookup;
    FPopup.IsOpen := True;
    FListBox.SetFocus;
    THackComboListBox(FListBox).UpdateSelection;
  end
  else
  begin
    FPopup.IsOpen := False;
  end;
end;

procedure TComboEdit.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  inherited;
  if WheelDelta < 0 then
  begin
    if ItemIndex < Count - 1 then
      ItemIndex := ItemIndex + 1
  end else
  begin
    if ItemIndex > 0 then
      ItemIndex := ItemIndex - 1;
  end;
  Handled := True;
end;

procedure TComboEdit.Notification(Component: TComponent; Operation: TOperation);
begin
  inherited Notification(Component, Operation);
  if (Operation = opRemove) and (Component = FListBox) then
    FListBox := nil;
end;

procedure TComboEdit.SetItemHeight(const Value: Single);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    FListBox.ItemHeight := FItemHeight;
  end;
end;

procedure TComboEdit.SetItems(const Value: TWideStrings);
begin
  FItems.Assign(Value);
end;

procedure TComboEdit.ChangeParent;
begin
  inherited;
end;

function TComboEdit.GetItemIndex: Integer;
begin
  if FListBox <> nil then
    Result := FListBox.ItemIndex
  else
    Result := -1;
end;

procedure TComboEdit.SetItemIndex(const Value: Integer);
begin
  if FListBox <> nil then
  begin
    FListBox.ItemIndex := Value;
    if (ItemIndex >= 0) and (ItemIndex < Items.Count) then
    begin
      Text := Items[ItemIndex];
      FNeedChange := False;
      if not Platform.ShowVirtualKeyboard(Self) then
        SelectAll;
      if Assigned(FBindingObjects) then
        ToBindingObjects;
      if Assigned(FOnChange) then
        FOnChange(Self);
      if (FResourceLink <> nil) and (FResourceLink is TControl) then
        TControl(FResourceLink).UpdateEffects;
      Repaint;
    end;
  end;
end;

function TComboEdit.GetCount: Integer;
begin
  if FListBox <> nil then
    Result := FListBox.Count
  else
    Result := 0;
end;

function TComboEdit.GetDefaultStyleLookupName: WideString;
begin
  Result := 'comboeditstyle';
end;

procedure TComboEdit.DoTyping(Sender: TObject);
var
  i, l: Integer;
  UT: WideString;
begin
  if (FLastChar = #0) and ((FLastKey = vkDelete) or (FLastKey = 8)) then
    Exit;
{$IFDEF NOVCL}
{$IFDEF DARWIN}
  Exit;
{$ENDIF}
{$ENDIF}
  UT := WideUpperCase(Text);
  Exit;
  for i := 0 to Items.Count - 1 do
{$IFDEF FPCCOMP}
    if Pos(UT, WideUpperCase(Items.Strings[i])) = 1 then
{$ELSE}
    if Pos(UT, UpperCase(Items.Strings[i])) = 1 then
{$ENDIF}
    begin
      l := Length(Text);
      Text := Items.Strings[i];
      SelStart := l;
      SelLength := Length(Items.Strings[i]) - l;
      Exit;
    end;
end;

function TComboEdit.GetListBoxResource: WideString;
begin
  Result := FListBox.StyleLookup;
end;

procedure TComboEdit.SetListBox(Value: TComboEditListBox);
begin
  if Value <> FListBox then
  begin
    FreeAndNil(FListBox);
    FListBox := Value;
    if FListBox <> nil then
      FListBox.FreeNotification(Self);
  end;
end;

procedure TComboEdit.SetListBoxResource(const Value: WideString);
begin
  FListBox.StyleLookup := Value;
end;

procedure TComboEdit.SetText(const Value: WideString);
begin
  inherited;
  Change;
end;

{ TComboTrackBar }

constructor TComboTrackBar.Create(AOwner: TComponent);
begin
  inherited;
  FFilterChar := '0123456789.,-+';
  Width := 100;
  Height := 22;
  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle';
  FPopup.PlacementTarget := Self;
  FPopup.StaysOpen := False;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.DesignVisible := True;
  FPopup.Margins.Rect := RectF(5, 2, 5, 2);
  FPopup.OnClosePopup := DoClosePopup;
  FPopup.DragWithParent := True;
  FTrackBar := TTrackBar.Create(Self);
  FTrackBar.Parent := FPopup;
  FTrackBar.Stored := False;
  FTrackBar.DisableFocusEffect := True;
  FTrackBar.Align := TAlignLayout.alVertCenter;
  Text:= GetValueAsString;
  FValue := FTrackBar.Value;
  FTrackBar.OnChange := DoTrackChange;
  FTrackBarNotify:= True;
end;

destructor TComboTrackBar.Destroy;
begin
  FCaret := nil;
  inherited;
end;

procedure TComboTrackBar.DoTrackChange(Sender: TObject);
begin
  if FTrackBarNotify then
  begin
    // set the Value property
    FValue := FTrackBar.Value;
    // set the text property
    Text := GetValueAsString;
    SelectAll;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TComboTrackBar.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  inc: Single;
begin
  inherited KeyDown(Key, KeyChar, Shift);

  inc := Frequency;
  if inc = 0 then
    inc := 1;
  case Key of
    vkUp: FTrackBar.Value := FTrackBar.Value + inc;
    vkDown: FTrackBar.Value := FTrackBar.Value - inc;
  else
    Exit;
  end;
  Key := 0;
end;

procedure TComboTrackBar.DoClosePopup(Sender: TObject);
begin
  if Assigned(FCaret) and ShowCaret and IsFocused then
    ShowCaretProc;
end;

procedure TComboTrackBar.DropDown;
var
  i: Integer;
begin
  if not FPopup.IsOpen then
  begin
    if ShowCaret then
      HideCaret;
    FPopup.Placement := FPlacement;
    if Width < 100 then
      FPopup.Width := 100
    else
      FPopup.Width := Width;
    FPopup.Height := 30;
    FTrackBar.ApplyStyleLookup;
    FPopup.IsOpen := True;
  end
  else
  begin
    FPopup.IsOpen := False;
  end;
end;

procedure TComboTrackBar.Change;
var
  TempValue: Single;
begin
  if TryStrToFloat(Text, TempValue, FormatSettings) then
  begin
    // constrain the value to the bounds imposed by the trackbar by
    // setting the trackbar value and supress notifications from it
    FTrackBarNotify := False;
    FTrackBar.Value := TempValue;
    FTrackBarNotify := True;

    // set the Value property and bound it to the bounds given by the trackbar;
    // the value has been changed because it was out of bounds
    if TempValue <> FTrackBar.Value then
      FValue :=FTrackBar.Value
    else
      FValue := TempValue;

    // change the Text property for formatting
    Text := GetValueAsString;
  end
  else // if it can't convert, set the last correct value to the edit
    Text := GetValueAsString;
  Repaint;

  inherited;
end;

procedure TComboTrackBar.DoComboMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then
    if not ReadOnly then
      DropDown
end;

procedure TComboTrackBar.ChangeParent;
begin
  inherited;
  FPopup.Parent := Parent;
end;

function TComboTrackBar.GetDefaultStyleLookupName: WideString;
begin
  Result := 'comboeditstyle';
end;

function TComboTrackBar.GetFrequency: Single;
begin
  Result := FTrackBar.Frequency;
end;

function TComboTrackBar.GetMax: Single;
begin
  Result := FTrackBar.Max;
end;

function TComboTrackBar.GetMin: Single;
begin
  Result := FTrackBar.Min;
end;

function TComboTrackBar.GetValueAsString: WideString;
begin
  Result := FloatToStrF(FTrackBar.Value, ffFixed, 10, 3);
end;

procedure TComboTrackBar.SetFrequency(const Value: Single);
begin
  if FTrackBar.Frequency <> Value then
    FTrackBar.Frequency := Value;
end;

procedure TComboTrackBar.SetMax(const Value: Single);
begin
  if FTrackBar.Max <> Value then
  begin
    FTrackBar.Max := Value;
    if FTrackBar.Value > FTrackBar.Max then
      FTrackBar.Value:= Value;
  end;
end;

procedure TComboTrackBar.SetMin(const Value: Single);
begin
  if FTrackBar.Min <> Value then
  begin
    FTrackBar.Min := Value;
    if FTrackBar.Value < FTrackBar.Min then
      FTrackBar.Value:= Value;
  end;
end;

procedure TComboTrackBar.SetText(const AValue: WideString);
var
  TempValue: Single;
begin
  inherited;
  if TryStrToFloat(AValue, TempValue, FormatSettings) then
    if (TempValue <> FTrackBar.Value) and (not Typing) then
      Change;
end;

procedure TComboTrackBar.SetValue(const AValue: Single);
begin
  if (FValue <> AValue) and (not ReadOnly) then
  begin
    // set the Value property of the trackbar and send
    // notifications accordingly
	  FTrackBar.Value := AValue;
    FValue:= FTRackBar.Value;
    // set the Text property, the notifications were
    // sent already, suppress them this time
    FTrackBarNotify := False;
    Text := GetValueAsString;
    FTrackBarNotify := True;
  end;
end;

{ TClearingEdit }

constructor TClearingEdit.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TClearingEdit.Destroy;
begin
  inherited;
end;

procedure TClearingEdit.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('clearbutton');
  if (B <> nil) and (B is TCustomButton) then
  begin
    FClearBtn := TCustomButton(B);
    FClearBtn.OnClick := DoClearBtnClick;
  end;
end;

procedure TClearingEdit.DoClearBtnClick(Sender: TObject);
begin
  SetFocus;
  if not ReadOnly then
  begin
    Text := '';
    Change;
  end;
end;

procedure TClearingEdit.FreeStyle;
begin
  FClearBtn := nil;
  inherited;
end;

{ TComboListBox }

constructor TComboEditListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FStyleLookup := 'combolistboxstyle';
  if AOwner is TComboEdit then
    FComboEdit := TComboEdit(AOwner);
  HideSelectionUnfocused := False;
  FContent.Align := TAlignLayout.alClient;
  SetAcceptsControls(False);
end;

procedure TComboEditListBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if Key = vkRight then
  begin
    if (Parent is TPopup) and TPopup(Parent).IsOpen and (FComboEdit <> nil) then
    begin
      FComboEdit.ItemIndex := ItemIndex;
      TPopup(Parent).IsOpen := False;
    end;
  end;
end;

procedure TComboEditListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Parent is TPopup) and TPopup(Parent).IsOpen and (FComboEdit <> nil) then
  begin
    if PointInRect(PointF(X, Y), LocalRect) and (ItemByPoint(X, Y) <> nil) then
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        if TLinkObservers.EditLinkIsEditing(Observers) then
          FComboEdit.ItemIndex := ItemByPoint(X, Y).Index;
      end
      else
        FComboEdit.ItemIndex := ItemByPoint(X, Y).Index;
    TPopup(Parent).IsOpen := False;
  end;
end;

function TComboEditListBox.GetObservers: TObservers;
begin
  if FComboEdit <> nil then
    Result := FComboEdit.Observers
  else
    Result := inherited;
end;

initialization
  RegisterFmxClasses([TEdit, TNumberBox, TSpinBox, TComboEdit, TComboTrackBar, TClearingEdit]);
end.

