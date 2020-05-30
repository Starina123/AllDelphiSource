unit MemoImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TMemoX = class(TActiveXControl, IMemoX)
  private
    { Private declarations }
    FDelphiControl: TMemo;
    FEvents: IMemoXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_Alignment: TxAlignment; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HideSelection: WordBool; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_Lines: IStrings; safecall;
    function Get_MaxLength: Integer; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_OEMConvert: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    function Get_SelLength: Integer; safecall;
    function Get_SelStart: Integer; safecall;
    function Get_SelText: WideString; safecall;
    function Get_Text: WideString; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_WantReturns: WordBool; safecall;
    function Get_WantTabs: WordBool; safecall;
    function Get_WordWrap: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure Clear; safecall;
    procedure ClearSelection; safecall;
    procedure ClearUndo; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure PasteFromClipboard; safecall;
    procedure SelectAll; safecall;
    procedure Set_Alignment(Value: TxAlignment); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HideSelection(Value: WordBool); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    procedure Set_OEMConvert(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    procedure Set_Text(const Value: WideString); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_WantReturns(Value: WordBool); safecall;
    procedure Set_WantTabs(Value: WordBool); safecall;
    procedure Set_WordWrap(Value: WordBool); safecall;
    procedure Undo; safecall;
  end;

implementation

uses ComObj, About17;

{ TMemoX }

procedure TMemoX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MemoXPage); }
end;

procedure TMemoX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMemoXEvents;
end;

procedure TMemoX.InitializeControl;
begin
  FDelphiControl := Control as TMemo;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TMemoX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TMemoX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TMemoX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMemoX.Get_Alignment: TxAlignment;
begin
  Result := Ord(FDelphiControl.Alignment);
end;

function TMemoX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TMemoX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TMemoX.Get_CanUndo: WordBool;
begin
  Result := FDelphiControl.CanUndo;
end;

function TMemoX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TMemoX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TMemoX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMemoX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TMemoX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TMemoX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TMemoX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMemoX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TMemoX.Get_HideSelection: WordBool;
begin
  Result := FDelphiControl.HideSelection;
end;

function TMemoX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TMemoX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TMemoX.Get_Lines: IStrings;
begin
  GetOleStrings(FDelphiControl.Lines, Result);
end;

function TMemoX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TMemoX.Get_Modified: WordBool;
begin
  Result := FDelphiControl.Modified;
end;

function TMemoX.Get_OEMConvert: WordBool;
begin
  Result := FDelphiControl.OEMConvert;
end;

function TMemoX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TMemoX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TMemoX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TMemoX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TMemoX.Get_ScrollBars: TxScrollStyle;
begin
  Result := Ord(FDelphiControl.ScrollBars);
end;

function TMemoX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TMemoX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TMemoX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TMemoX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TMemoX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TMemoX.Get_WantReturns: WordBool;
begin
  Result := FDelphiControl.WantReturns;
end;

function TMemoX.Get_WantTabs: WordBool;
begin
  Result := FDelphiControl.WantTabs;
end;

function TMemoX.Get_WordWrap: WordBool;
begin
  Result := FDelphiControl.WordWrap;
end;

function TMemoX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TMemoX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TMemoX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TMemoX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TMemoX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TMemoX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMemoX.AboutBox;
begin
  ShowMemoXAbout;
end;

procedure TMemoX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TMemoX.ClearSelection;
begin
  FDelphiControl.ClearSelection;
end;

procedure TMemoX.ClearUndo;
begin
  FDelphiControl.ClearUndo;
end;

procedure TMemoX.CopyToClipboard;
begin
  FDelphiControl.CopyToClipboard;
end;

procedure TMemoX.CutToClipboard;
begin
  FDelphiControl.CutToClipboard;
end;

procedure TMemoX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TMemoX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TMemoX.PasteFromClipboard;
begin
  FDelphiControl.PasteFromClipboard;
end;

procedure TMemoX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TMemoX.Set_Alignment(Value: TxAlignment);
begin
  FDelphiControl.Alignment := TAlignment(Value);
end;

procedure TMemoX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TMemoX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TMemoX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TMemoX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TMemoX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMemoX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TMemoX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TMemoX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TMemoX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMemoX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMemoX.Set_HideSelection(Value: WordBool);
begin
  FDelphiControl.HideSelection := Value;
end;

procedure TMemoX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TMemoX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TMemoX.Set_Lines(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Lines, Value);
end;

procedure TMemoX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TMemoX.Set_Modified(Value: WordBool);
begin
  FDelphiControl.Modified := Value;
end;

procedure TMemoX.Set_OEMConvert(Value: WordBool);
begin
  FDelphiControl.OEMConvert := Value;
end;

procedure TMemoX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TMemoX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TMemoX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TMemoX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TMemoX.Set_ScrollBars(Value: TxScrollStyle);
begin
  FDelphiControl.ScrollBars := TScrollStyle(Value);
end;

procedure TMemoX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TMemoX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TMemoX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TMemoX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := TCaption(Value);
end;

procedure TMemoX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TMemoX.Set_WantReturns(Value: WordBool);
begin
  FDelphiControl.WantReturns := Value;
end;

procedure TMemoX.Set_WantTabs(Value: WordBool);
begin
  FDelphiControl.WantTabs := Value;
end;

procedure TMemoX.Set_WordWrap(Value: WordBool);
begin
  FDelphiControl.WordWrap := Value;
end;

procedure TMemoX.Undo;
begin
  FDelphiControl.Undo;
end;

procedure TMemoX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TMemoX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMemoX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMemoX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TMemoX,
    TMemo,
    Class_MemoX,
    17,
    '{695CDB59-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
