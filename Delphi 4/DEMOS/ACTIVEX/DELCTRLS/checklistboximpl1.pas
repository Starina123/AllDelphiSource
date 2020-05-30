unit CheckListBoxImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, CheckLst;

type
  TCheckListBoxX = class(TActiveXControl, ICheckListBoxX)
  private
    { Private declarations }
    FDelphiControl: TCheckListBox;
    FEvents: ICheckListBoxXEvents;
    procedure ClickCheckEvent(Sender: TObject);
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
    function Get_AllowGrayed: WordBool; safecall;
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
    function Get_Flat: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_IntegralHeight: WordBool; safecall;
    function Get_ItemHeight: Integer; safecall;
    function Get_ItemIndex: Integer; safecall;
    function Get_Items: IStrings; safecall;
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
    procedure Set_AllowGrayed(Value: WordBool); safecall;
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
    procedure Set_Flat(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_IntegralHeight(Value: WordBool); safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    procedure Set_Items(const Value: IStrings); safecall;
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

uses ComObj, About5;

{ TCheckListBoxX }

procedure TCheckListBoxX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CheckListBoxXPage); }
end;

procedure TCheckListBoxX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICheckListBoxXEvents;
end;

procedure TCheckListBoxX.InitializeControl;
begin
  FDelphiControl := Control as TCheckListBox;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnClickCheck := ClickCheckEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnMeasureItem := MeasureItemEvent;
end;

function TCheckListBoxX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TCheckListBoxX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TCheckListBoxX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TCheckListBoxX.Get_AllowGrayed: WordBool;
begin
  Result := FDelphiControl.AllowGrayed;
end;

function TCheckListBoxX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TCheckListBoxX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TCheckListBoxX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TCheckListBoxX.Get_Columns: Integer;
begin
  Result := FDelphiControl.Columns;
end;

function TCheckListBoxX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TCheckListBoxX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TCheckListBoxX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TCheckListBoxX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TCheckListBoxX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TCheckListBoxX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TCheckListBoxX.Get_Flat: WordBool;
begin
  Result := FDelphiControl.Flat;
end;

function TCheckListBoxX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TCheckListBoxX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TCheckListBoxX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TCheckListBoxX.Get_IntegralHeight: WordBool;
begin
  Result := FDelphiControl.IntegralHeight;
end;

function TCheckListBoxX.Get_ItemHeight: Integer;
begin
  Result := FDelphiControl.ItemHeight;
end;

function TCheckListBoxX.Get_ItemIndex: Integer;
begin
  Result := FDelphiControl.ItemIndex;
end;

function TCheckListBoxX.Get_Items: IStrings;
begin
  GetOleStrings(FDelphiControl.Items, Result);
end;

function TCheckListBoxX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TCheckListBoxX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TCheckListBoxX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TCheckListBoxX.Get_SelCount: Integer;
begin
  Result := FDelphiControl.SelCount;
end;

function TCheckListBoxX.Get_Sorted: WordBool;
begin
  Result := FDelphiControl.Sorted;
end;

function TCheckListBoxX.Get_Style: TxListBoxStyle;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TCheckListBoxX.Get_TabWidth: Integer;
begin
  Result := FDelphiControl.TabWidth;
end;

function TCheckListBoxX.Get_TopIndex: Integer;
begin
  Result := FDelphiControl.TopIndex;
end;

function TCheckListBoxX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TCheckListBoxX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TCheckListBoxX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TCheckListBoxX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TCheckListBoxX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TCheckListBoxX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TCheckListBoxX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TCheckListBoxX.AboutBox;
begin
  ShowCheckListBoxXAbout;
end;

procedure TCheckListBoxX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TCheckListBoxX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TCheckListBoxX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TCheckListBoxX.Set_AllowGrayed(Value: WordBool);
begin
  FDelphiControl.AllowGrayed := Value;
end;

procedure TCheckListBoxX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TCheckListBoxX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TCheckListBoxX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TCheckListBoxX.Set_Columns(Value: Integer);
begin
  FDelphiControl.Columns := Value;
end;

procedure TCheckListBoxX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TCheckListBoxX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TCheckListBoxX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TCheckListBoxX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TCheckListBoxX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TCheckListBoxX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TCheckListBoxX.Set_Flat(Value: WordBool);
begin
  FDelphiControl.Flat := Value;
end;

procedure TCheckListBoxX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TCheckListBoxX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TCheckListBoxX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TCheckListBoxX.Set_IntegralHeight(Value: WordBool);
begin
  FDelphiControl.IntegralHeight := Value;
end;

procedure TCheckListBoxX.Set_ItemHeight(Value: Integer);
begin
  FDelphiControl.ItemHeight := Value;
end;

procedure TCheckListBoxX.Set_ItemIndex(Value: Integer);
begin
  FDelphiControl.ItemIndex := Value;
end;

procedure TCheckListBoxX.Set_Items(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Items, Value);
end;

procedure TCheckListBoxX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TCheckListBoxX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TCheckListBoxX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TCheckListBoxX.Set_Sorted(Value: WordBool);
begin
  FDelphiControl.Sorted := Value;
end;

procedure TCheckListBoxX.Set_Style(Value: TxListBoxStyle);
begin
  FDelphiControl.Style := TListBoxStyle(Value);
end;

procedure TCheckListBoxX.Set_TabWidth(Value: Integer);
begin
  FDelphiControl.TabWidth := Value;
end;

procedure TCheckListBoxX.Set_TopIndex(Value: Integer);
begin
  FDelphiControl.TopIndex := Value;
end;

procedure TCheckListBoxX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TCheckListBoxX.ClickCheckEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClickCheck;
end;

procedure TCheckListBoxX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCheckListBoxX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCheckListBoxX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCheckListBoxX.MeasureItemEvent(Control: TWinControl;
  Index: Integer; var Height: Integer);
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
    TCheckListBoxX,
    TCheckListBox,
    Class_CheckListBoxX,
    5,
    '{695CDAF6-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
