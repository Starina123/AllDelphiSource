unit DrawGridImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Grids;

type
  TDrawGridX = class(TActiveXControl, IDrawGridX)
  private
    { Private declarations }
    FDelphiControl: TDrawGrid;
    FEvents: IDrawGridXEvents;
    procedure ClickEvent(Sender: TObject);
    procedure ColumnMovedEvent(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DblClickEvent(Sender: TObject);
    procedure GetEditMaskEvent(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure GetEditTextEvent(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure RowMovedEvent(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure SelectCellEvent(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SetEditTextEvent(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure TopLeftChangedEvent(Sender: TObject);
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
    function Get_Col: Integer; safecall;
    function Get_ColCount: Integer; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DefaultColWidth: Integer; safecall;
    function Get_DefaultDrawing: WordBool; safecall;
    function Get_DefaultRowHeight: Integer; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_EditorMode: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_FixedColor: OLE_COLOR; safecall;
    function Get_FixedCols: Integer; safecall;
    function Get_FixedRows: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_GridHeight: Integer; safecall;
    function Get_GridLineWidth: Integer; safecall;
    function Get_GridWidth: Integer; safecall;
    function Get_LeftCol: Integer; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Row: Integer; safecall;
    function Get_RowCount: Integer; safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    function Get_TopRow: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleColCount: Integer; safecall;
    function Get_VisibleRowCount: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Integer); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Col(Value: Integer); safecall;
    procedure Set_ColCount(Value: Integer); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DefaultColWidth(Value: Integer); safecall;
    procedure Set_DefaultDrawing(Value: WordBool); safecall;
    procedure Set_DefaultRowHeight(Value: Integer); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_EditorMode(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_FixedColor(Value: OLE_COLOR); safecall;
    procedure Set_FixedCols(Value: Integer); safecall;
    procedure Set_FixedRows(Value: Integer); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_GridLineWidth(Value: Integer); safecall;
    procedure Set_LeftCol(Value: Integer); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Row(Value: Integer); safecall;
    procedure Set_RowCount(Value: Integer); safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    procedure Set_TopRow(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About10;

{ TDrawGridX }

procedure TDrawGridX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_DrawGridXPage); }
end;

procedure TDrawGridX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IDrawGridXEvents;
end;

procedure TDrawGridX.InitializeControl;
begin
  FDelphiControl := Control as TDrawGrid;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnColumnMoved := ColumnMovedEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnGetEditMask := GetEditMaskEvent;
  FDelphiControl.OnGetEditText := GetEditTextEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnRowMoved := RowMovedEvent;
  FDelphiControl.OnSelectCell := SelectCellEvent;
  FDelphiControl.OnSetEditText := SetEditTextEvent;
  FDelphiControl.OnTopLeftChanged := TopLeftChangedEvent;
end;

function TDrawGridX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TDrawGridX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TDrawGridX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TDrawGridX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TDrawGridX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TDrawGridX.Get_Col: Integer;
begin
  Result := FDelphiControl.Col;
end;

function TDrawGridX.Get_ColCount: Integer;
begin
  Result := FDelphiControl.ColCount;
end;

function TDrawGridX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TDrawGridX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TDrawGridX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TDrawGridX.Get_DefaultColWidth: Integer;
begin
  Result := FDelphiControl.DefaultColWidth;
end;

function TDrawGridX.Get_DefaultDrawing: WordBool;
begin
  Result := FDelphiControl.DefaultDrawing;
end;

function TDrawGridX.Get_DefaultRowHeight: Integer;
begin
  Result := FDelphiControl.DefaultRowHeight;
end;

function TDrawGridX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TDrawGridX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TDrawGridX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TDrawGridX.Get_EditorMode: WordBool;
begin
  Result := FDelphiControl.EditorMode;
end;

function TDrawGridX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TDrawGridX.Get_FixedColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.FixedColor);
end;

function TDrawGridX.Get_FixedCols: Integer;
begin
  Result := FDelphiControl.FixedCols;
end;

function TDrawGridX.Get_FixedRows: Integer;
begin
  Result := FDelphiControl.FixedRows;
end;

function TDrawGridX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TDrawGridX.Get_GridHeight: Integer;
begin
  Result := FDelphiControl.GridHeight;
end;

function TDrawGridX.Get_GridLineWidth: Integer;
begin
  Result := FDelphiControl.GridLineWidth;
end;

function TDrawGridX.Get_GridWidth: Integer;
begin
  Result := FDelphiControl.GridWidth;
end;

function TDrawGridX.Get_LeftCol: Integer;
begin
  Result := FDelphiControl.LeftCol;
end;

function TDrawGridX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TDrawGridX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TDrawGridX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TDrawGridX.Get_Row: Integer;
begin
  Result := FDelphiControl.Row;
end;

function TDrawGridX.Get_RowCount: Integer;
begin
  Result := FDelphiControl.RowCount;
end;

function TDrawGridX.Get_ScrollBars: TxScrollStyle;
begin
  Result := Ord(FDelphiControl.ScrollBars);
end;

function TDrawGridX.Get_TopRow: Integer;
begin
  Result := FDelphiControl.TopRow;
end;

function TDrawGridX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TDrawGridX.Get_VisibleColCount: Integer;
begin
  Result := FDelphiControl.VisibleColCount;
end;

function TDrawGridX.Get_VisibleRowCount: Integer;
begin
  Result := FDelphiControl.VisibleRowCount;
end;

function TDrawGridX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TDrawGridX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TDrawGridX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TDrawGridX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TDrawGridX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TDrawGridX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TDrawGridX.AboutBox;
begin
  ShowDrawGridXAbout;
end;

procedure TDrawGridX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TDrawGridX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TDrawGridX.MouseToCell(X, Y: Integer; var ACol, ARow: Integer);
begin

end;

procedure TDrawGridX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TDrawGridX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TDrawGridX.Set_Col(Value: Integer);
begin
  FDelphiControl.Col := Value;
end;

procedure TDrawGridX.Set_ColCount(Value: Integer);
begin
  FDelphiControl.ColCount := Value;
end;

procedure TDrawGridX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TDrawGridX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TDrawGridX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TDrawGridX.Set_DefaultColWidth(Value: Integer);
begin
  FDelphiControl.DefaultColWidth := Value;
end;

procedure TDrawGridX.Set_DefaultDrawing(Value: WordBool);
begin
  FDelphiControl.DefaultDrawing := Value;
end;

procedure TDrawGridX.Set_DefaultRowHeight(Value: Integer);
begin
  FDelphiControl.DefaultRowHeight := Value;
end;

procedure TDrawGridX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TDrawGridX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TDrawGridX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TDrawGridX.Set_EditorMode(Value: WordBool);
begin
  FDelphiControl.EditorMode := Value;
end;

procedure TDrawGridX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TDrawGridX.Set_FixedColor(Value: OLE_COLOR);
begin
  FDelphiControl.FixedColor := TColor(Value);
end;

procedure TDrawGridX.Set_FixedCols(Value: Integer);
begin
  FDelphiControl.FixedCols := Value;
end;

procedure TDrawGridX.Set_FixedRows(Value: Integer);
begin
  FDelphiControl.FixedRows := Value;
end;

procedure TDrawGridX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TDrawGridX.Set_GridLineWidth(Value: Integer);
begin
  FDelphiControl.GridLineWidth := Value;
end;

procedure TDrawGridX.Set_LeftCol(Value: Integer);
begin
  FDelphiControl.LeftCol := Value;
end;

procedure TDrawGridX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TDrawGridX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TDrawGridX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TDrawGridX.Set_Row(Value: Integer);
begin
  FDelphiControl.Row := Value;
end;

procedure TDrawGridX.Set_RowCount(Value: Integer);
begin
  FDelphiControl.RowCount := Value;
end;

procedure TDrawGridX.Set_ScrollBars(Value: TxScrollStyle);
begin
  FDelphiControl.ScrollBars := TScrollStyle(Value);
end;

procedure TDrawGridX.Set_TopRow(Value: Integer);
begin
  FDelphiControl.TopRow := Value;
end;

procedure TDrawGridX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TDrawGridX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TDrawGridX.ColumnMovedEvent(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  if FEvents <> nil then FEvents.OnColumnMoved(FromIndex, ToIndex);
end;

procedure TDrawGridX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TDrawGridX.GetEditMaskEvent(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
var
  TempValue: WideString;
begin
  TempValue := WideString(Value);
  if FEvents <> nil then FEvents.OnGetEditMask(ACol, ARow, TempValue);
  Value := String(TempValue);
end;

procedure TDrawGridX.GetEditTextEvent(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
var
  TempValue: WideString;
begin
  TempValue := WideString(Value);
  if FEvents <> nil then FEvents.OnGetEditText(ACol, ARow, TempValue);
  Value := String(TempValue);
end;

procedure TDrawGridX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TDrawGridX.RowMovedEvent(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  if FEvents <> nil then FEvents.OnRowMoved(FromIndex, ToIndex);
end;

procedure TDrawGridX.SelectCellEvent(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  TempCanSelect: WordBool;
begin
  TempCanSelect := WordBool(CanSelect);
  if FEvents <> nil then FEvents.OnSelectCell(ACol, ARow, TempCanSelect);
  CanSelect := Boolean(TempCanSelect);
end;

procedure TDrawGridX.SetEditTextEvent(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  if FEvents <> nil then FEvents.OnSetEditText(ACol, ARow, WideString(Value));
end;

procedure TDrawGridX.TopLeftChangedEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnTopLeftChanged;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TDrawGridX,
    TDrawGrid,
    Class_DrawGridX,
    10,
    '{695CDB23-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
