unit ComboBoxImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TComboBoxX = class(TActiveXControl, IComboBoxX)
  private
    { Private declarations }
    FDelphiControl: TComboBox;
    FEvents: IComboBoxXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DropDownEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MeasureItemEvent(Control: TWinControl; Index: Integer;
      var Height: Integer);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_CharCase: TxEditCharCase; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_DropDownCount: Integer; safecall;
    function Get_DroppedDown: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_ItemHeight: Integer; safecall;
    function Get_ItemIndex: Integer; safecall;
    function Get_Items: IStrings; safecall;
    function Get_MaxLength: Integer; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_SelLength: Integer; safecall;
    function Get_SelStart: Integer; safecall;
    function Get_SelText: WideString; safecall;
    function Get_Sorted: WordBool; safecall;
    function Get_Style: TxComboBoxStyle; safecall;
    function Get_Text: WideString; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure Clear; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure SelectAll; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_CharCase(Value: TxEditCharCase); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_DropDownCount(Value: Integer); safecall;
    procedure Set_DroppedDown(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    procedure Set_Sorted(Value: WordBool); safecall;
    procedure Set_Style(Value: TxComboBoxStyle); safecall;
    procedure Set_Text(const Value: WideString); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About7;

{ TComboBoxX }

procedure TComboBoxX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ComboBoxXPage); }
end;

procedure TComboBoxX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IComboBoxXEvents;
end;

procedure TComboBoxX.InitializeControl;
begin
  FDelphiControl := Control as TComboBox;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnDropDown := DropDownEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnMeasureItem := MeasureItemEvent;
end;

function TComboBoxX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TComboBoxX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TComboBoxX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TComboBoxX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TComboBoxX.Get_CharCase: TxEditCharCase;
begin
  Result := Ord(FDelphiControl.CharCase);
end;

function TComboBoxX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TComboBoxX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TComboBoxX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TComboBoxX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TComboBoxX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TComboBoxX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TComboBoxX.Get_DropDownCount: Integer;
begin
  Result := FDelphiControl.DropDownCount;
end;

function TComboBoxX.Get_DroppedDown: WordBool;
begin
  Result := FDelphiControl.DroppedDown;
end;

function TComboBoxX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TComboBoxX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TComboBoxX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TComboBoxX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TComboBoxX.Get_ItemHeight: Integer;
begin
  Result := FDelphiControl.ItemHeight;
end;

function TComboBoxX.Get_ItemIndex: Integer;
begin
  Result := FDelphiControl.ItemIndex;
end;

function TComboBoxX.Get_Items: IStrings;
begin
  GetOleStrings(FDelphiControl.Items, Result);
end;

function TComboBoxX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TComboBoxX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TComboBoxX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TComboBoxX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TComboBoxX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TComboBoxX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TComboBoxX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TComboBoxX.Get_Sorted: WordBool;
begin
  Result := FDelphiControl.Sorted;
end;

function TComboBoxX.Get_Style: TxComboBoxStyle;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TComboBoxX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TComboBoxX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TComboBoxX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TComboBoxX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TComboBoxX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TComboBoxX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TComboBoxX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TComboBoxX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TComboBoxX.AboutBox;
begin
  ShowComboBoxXAbout;
end;

procedure TComboBoxX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TComboBoxX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TComboBoxX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TComboBoxX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TComboBoxX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TComboBoxX.Set_CharCase(Value: TxEditCharCase);
begin
  FDelphiControl.CharCase := TEditCharCase(Value);
end;

procedure TComboBoxX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TComboBoxX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TComboBoxX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TComboBoxX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TComboBoxX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TComboBoxX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TComboBoxX.Set_DropDownCount(Value: Integer);
begin
  FDelphiControl.DropDownCount := Value;
end;

procedure TComboBoxX.Set_DroppedDown(Value: WordBool);
begin
  FDelphiControl.DroppedDown := Value;
end;

procedure TComboBoxX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TComboBoxX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TComboBoxX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TComboBoxX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TComboBoxX.Set_ItemHeight(Value: Integer);
begin
  FDelphiControl.ItemHeight := Value;
end;

procedure TComboBoxX.Set_ItemIndex(Value: Integer);
begin
  FDelphiControl.ItemIndex := Value;
end;

procedure TComboBoxX.Set_Items(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Items, Value);
end;

procedure TComboBoxX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TComboBoxX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TComboBoxX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TComboBoxX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TComboBoxX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TComboBoxX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TComboBoxX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TComboBoxX.Set_Sorted(Value: WordBool);
begin
  FDelphiControl.Sorted := Value;
end;

procedure TComboBoxX.Set_Style(Value: TxComboBoxStyle);
begin
  FDelphiControl.Style := TComboBoxStyle(Value);
end;

procedure TComboBoxX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := TCaption(Value);
end;

procedure TComboBoxX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TComboBoxX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TComboBoxX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TComboBoxX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TComboBoxX.DropDownEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDropDown;
end;

procedure TComboBoxX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TComboBoxX.MeasureItemEvent(Control: TWinControl; Index: Integer;
  var Height: Integer);
var
  TempHeight: Integer;
begin
  TempHeight := Integer(Height);
  if FEvents <> nil then FEvents.OnMeasureItem(Index, TempHeight);
  Height := Integer(TempHeight);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TComboBoxX,
    TComboBox,
    Class_ComboBoxX,
    7,
    '{695CDB07-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
