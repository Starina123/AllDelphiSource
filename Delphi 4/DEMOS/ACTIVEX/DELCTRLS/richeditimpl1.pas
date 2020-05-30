unit RichEditImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TRichEditX = class(TActiveXControl, IRichEditX)
  private
    { Private declarations }
    FDelphiControl: TRichEdit;
    FEvents: IRichEditXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure ProtectChangeEvent(Sender: TObject; StartPos, EndPos: Integer;
      var AllowChange: Boolean);
    procedure SaveClipboardEvent(Sender: TObject; NumObjects,
      NumChars: Integer; var SaveClipboard: Boolean);
    procedure SelectionChangeEvent(Sender: TObject);
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
    function Get_HideScrollBars: WordBool; safecall;
    function Get_HideSelection: WordBool; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_Lines: IStrings; safecall;
    function Get_MaxLength: Integer; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_PlainText: WordBool; safecall;
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
    procedure Print(const Caption: WideString); safecall;
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
    procedure Set_HideScrollBars(Value: WordBool); safecall;
    procedure Set_HideSelection(Value: WordBool); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_PlainText(Value: WordBool); safecall;
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

uses ComObj, About26;

{ TRichEditX }

procedure TRichEditX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_RichEditXPage); }
end;

procedure TRichEditX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IRichEditXEvents;
end;

procedure TRichEditX.InitializeControl;
begin
  FDelphiControl := Control as TRichEdit;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnProtectChange := ProtectChangeEvent;
  FDelphiControl.OnSaveClipboard := SaveClipboardEvent;
  FDelphiControl.OnSelectionChange := SelectionChangeEvent;
end;

function TRichEditX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TRichEditX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TRichEditX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TRichEditX.Get_Alignment: TxAlignment;
begin
  Result := Ord(FDelphiControl.Alignment);
end;

function TRichEditX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TRichEditX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TRichEditX.Get_CanUndo: WordBool;
begin
  Result := FDelphiControl.CanUndo;
end;

function TRichEditX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TRichEditX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TRichEditX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TRichEditX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TRichEditX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TRichEditX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TRichEditX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TRichEditX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TRichEditX.Get_HideScrollBars: WordBool;
begin
  Result := FDelphiControl.HideScrollBars;
end;

function TRichEditX.Get_HideSelection: WordBool;
begin
  Result := FDelphiControl.HideSelection;
end;

function TRichEditX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TRichEditX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TRichEditX.Get_Lines: IStrings;
begin
  GetOleStrings(FDelphiControl.Lines, Result);
end;

function TRichEditX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TRichEditX.Get_Modified: WordBool;
begin
  Result := FDelphiControl.Modified;
end;

function TRichEditX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TRichEditX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TRichEditX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TRichEditX.Get_PlainText: WordBool;
begin
  Result := FDelphiControl.PlainText;
end;

function TRichEditX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TRichEditX.Get_ScrollBars: TxScrollStyle;
begin
  Result := Ord(FDelphiControl.ScrollBars);
end;

function TRichEditX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TRichEditX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TRichEditX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TRichEditX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TRichEditX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TRichEditX.Get_WantReturns: WordBool;
begin
  Result := FDelphiControl.WantReturns;
end;

function TRichEditX.Get_WantTabs: WordBool;
begin
  Result := FDelphiControl.WantTabs;
end;

function TRichEditX.Get_WordWrap: WordBool;
begin
  Result := FDelphiControl.WordWrap;
end;

function TRichEditX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TRichEditX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TRichEditX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TRichEditX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TRichEditX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TRichEditX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TRichEditX.AboutBox;
begin
  ShowRichEditXAbout;
end;

procedure TRichEditX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TRichEditX.ClearSelection;
begin
  FDelphiControl.ClearSelection;
end;

procedure TRichEditX.ClearUndo;
begin
  FDelphiControl.ClearUndo;
end;

procedure TRichEditX.CopyToClipboard;
begin
  FDelphiControl.CopyToClipboard;
end;

procedure TRichEditX.CutToClipboard;
begin
  FDelphiControl.CutToClipboard;
end;

procedure TRichEditX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TRichEditX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TRichEditX.PasteFromClipboard;
begin
  FDelphiControl.PasteFromClipboard;
end;

procedure TRichEditX.Print(const Caption: WideString);
begin
  FDelphiControl.Print(Caption);
end;

procedure TRichEditX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TRichEditX.Set_Alignment(Value: TxAlignment);
begin
  FDelphiControl.Alignment := TAlignment(Value);
end;

procedure TRichEditX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TRichEditX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TRichEditX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TRichEditX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TRichEditX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TRichEditX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TRichEditX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TRichEditX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TRichEditX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TRichEditX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TRichEditX.Set_HideScrollBars(Value: WordBool);
begin
  FDelphiControl.HideScrollBars := Value;
end;

procedure TRichEditX.Set_HideSelection(Value: WordBool);
begin
  FDelphiControl.HideSelection := Value;
end;

procedure TRichEditX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TRichEditX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TRichEditX.Set_Lines(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Lines, Value);
end;

procedure TRichEditX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TRichEditX.Set_Modified(Value: WordBool);
begin
  FDelphiControl.Modified := Value;
end;

procedure TRichEditX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TRichEditX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TRichEditX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TRichEditX.Set_PlainText(Value: WordBool);
begin
  FDelphiControl.PlainText := Value;
end;

procedure TRichEditX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TRichEditX.Set_ScrollBars(Value: TxScrollStyle);
begin
  FDelphiControl.ScrollBars := TScrollStyle(Value);
end;

procedure TRichEditX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TRichEditX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TRichEditX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TRichEditX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := TCaption(Value);
end;

procedure TRichEditX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TRichEditX.Set_WantReturns(Value: WordBool);
begin
  FDelphiControl.WantReturns := Value;
end;

procedure TRichEditX.Set_WantTabs(Value: WordBool);
begin
  FDelphiControl.WantTabs := Value;
end;

procedure TRichEditX.Set_WordWrap(Value: WordBool);
begin
  FDelphiControl.WordWrap := Value;
end;

procedure TRichEditX.Undo;
begin
  FDelphiControl.Undo;
end;

procedure TRichEditX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TRichEditX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TRichEditX.ProtectChangeEvent(Sender: TObject; StartPos,
  EndPos: Integer; var AllowChange: Boolean);
var
  TempAllowChange: WordBool;
begin
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnProtectChange(StartPos, EndPos, TempAllowChange);
  AllowChange := Boolean(TempAllowChange);
end;

procedure TRichEditX.SaveClipboardEvent(Sender: TObject; NumObjects,
  NumChars: Integer; var SaveClipboard: Boolean);
var
  TempSaveClipboard: WordBool;
begin
  TempSaveClipboard := WordBool(SaveClipboard);
  if FEvents <> nil then FEvents.OnSaveClipboard(NumObjects, NumChars, TempSaveClipboard);
  SaveClipboard := Boolean(TempSaveClipboard);
end;

procedure TRichEditX.SelectionChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnSelectionChange;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TRichEditX,
    TRichEdit,
    Class_RichEditX,
    26,
    '{695CDB9F-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
