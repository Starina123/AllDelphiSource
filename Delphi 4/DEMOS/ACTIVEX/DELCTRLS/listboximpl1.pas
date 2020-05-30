unit ListBoxImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TListBoxX = class(TActiveXControl, IListBoxX)
  private
    { Private declarations }
    FDelphiControl: TListBox;
    FEvents: IListBoxXEvents;
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
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
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Columns: Integer; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExtendedSelect: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_IntegralHeight: WordBool; safecall;
    function Get_ItemHeight: Integer; safecall;
    function Get_ItemIndex: Integer; safecall;
    function Get_Items: IStrings; safecall;
    function Get_MultiSelect: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_SelCount: Integer; safecall;
    function Get_Sorted: WordBool; safecall;
    function Get_Style: TxListBoxStyle; safecall;
    function Get_TabWidth: Integer; safecall;
    function Get_TopIndex: Integer; safecall;
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
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Columns(Value: Integer); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_ExtendedSelect(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_IntegralHeight(Value: WordBool); safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Sorted(Value: WordBool); safecall;
    procedure Set_Style(Value: TxListBoxStyle); safecall;
    procedure Set_TabWidth(Value: Integer); safecall;
    procedure Set_TopIndex(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About14;

{ TListBoxX }

procedure TListBoxX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ListBoxXPage); }
end;

procedure TListBoxX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IListBoxXEvents;
end;

procedure TListBoxX.InitializeControl;
begin
  FDelphiControl := Control as TListBox;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnMeasureItem := MeasureItemEvent;
end;

function TListBoxX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TListBoxX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TListBoxX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TListBoxX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TListBoxX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TListBoxX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TListBoxX.Get_Columns: Integer;
begin
  Result := FDelphiControl.Columns;
end;

function TListBoxX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TListBoxX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TListBoxX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TListBoxX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TListBoxX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TListBoxX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TListBoxX.Get_ExtendedSelect: WordBool;
begin
  Result := FDelphiControl.ExtendedSelect;
end;

function TListBoxX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TListBoxX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TListBoxX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TListBoxX.Get_IntegralHeight: WordBool;
begin
  Result := FDelphiControl.IntegralHeight;
end;

function TListBoxX.Get_ItemHeight: Integer;
begin
  Result := FDelphiControl.ItemHeight;
end;

function TListBoxX.Get_ItemIndex: Integer;
begin
  Result := FDelphiControl.ItemIndex;
end;

function TListBoxX.Get_Items: IStrings;
begin
  GetOleStrings(FDelphiControl.Items, Result);
end;

function TListBoxX.Get_MultiSelect: WordBool;
begin
  Result := FDelphiControl.MultiSelect;
end;

function TListBoxX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TListBoxX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TListBoxX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TListBoxX.Get_SelCount: Integer;
begin
  Result := FDelphiControl.SelCount;
end;

function TListBoxX.Get_Sorted: WordBool;
begin
  Result := FDelphiControl.Sorted;
end;

function TListBoxX.Get_Style: TxListBoxStyle;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TListBoxX.Get_TabWidth: Integer;
begin
  Result := FDelphiControl.TabWidth;
end;

function TListBoxX.Get_TopIndex: Integer;
begin
  Result := FDelphiControl.TopIndex;
end;

function TListBoxX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TListBoxX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TListBoxX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TListBoxX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TListBoxX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TListBoxX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TListBoxX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TListBoxX.AboutBox;
begin
  ShowListBoxXAbout;
end;

procedure TListBoxX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TListBoxX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TListBoxX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TListBoxX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TListBoxX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TListBoxX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TListBoxX.Set_Columns(Value: Integer);
begin
  FDelphiControl.Columns := Value;
end;

procedure TListBoxX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TListBoxX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TListBoxX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TListBoxX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TListBoxX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TListBoxX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TListBoxX.Set_ExtendedSelect(Value: WordBool);
begin
  FDelphiControl.ExtendedSelect := Value;
end;

procedure TListBoxX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TListBoxX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TListBoxX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TListBoxX.Set_IntegralHeight(Value: WordBool);
begin
  FDelphiControl.IntegralHeight := Value;
end;

procedure TListBoxX.Set_ItemHeight(Value: Integer);
begin
  FDelphiControl.ItemHeight := Value;
end;

procedure TListBoxX.Set_ItemIndex(Value: Integer);
begin
  FDelphiControl.ItemIndex := Value;
end;

procedure TListBoxX.Set_Items(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Items, Value);
end;

procedure TListBoxX.Set_MultiSelect(Value: WordBool);
begin
  FDelphiControl.MultiSelect := Value;
end;

procedure TListBoxX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TListBoxX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TListBoxX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TListBoxX.Set_Sorted(Value: WordBool);
begin
  FDelphiControl.Sorted := Value;
end;

procedure TListBoxX.Set_Style(Value: TxListBoxStyle);
begin
  FDelphiControl.Style := TListBoxStyle(Value);
end;

procedure TListBoxX.Set_TabWidth(Value: Integer);
begin
  FDelphiControl.TabWidth := Value;
end;

procedure TListBoxX.Set_TopIndex(Value: Integer);
begin
  FDelphiControl.TopIndex := Value;
end;

procedure TListBoxX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TListBoxX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TListBoxX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TListBoxX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TListBoxX.MeasureItemEvent(Control: TWinControl; Index: Integer;
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
    TListBoxX,
    TListBox,
    Class_ListBoxX,
    14,
    '{695CDB3F-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
