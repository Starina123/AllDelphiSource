unit StringGridImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Grids;

type
  TStringGridX = class(TActiveXControl, IStringGridX)
  private
    { Private declarations }
    FDelphiControl: TStringGrid;
    FEvents: IStringGridXEvents;
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

uses ComObj, About32;

{ TStringGridX }

procedure TStringGridX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_StringGridXPage); }
end;

procedure TStringGridX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IStringGridXEvents;
end;

procedure TStringGridX.InitializeControl;
begin
  FDelphiControl := Control as TStringGrid;
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

function TStringGridX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TStringGridX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TStringGridX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TStringGridX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TStringGridX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TStringGridX.Get_Col: Integer;
begin
  Result := FDelphiControl.Col;
end;

function TStringGridX.Get_ColCount: Integer;
begin
  Result := FDelphiControl.ColCount;
end;

function TStringGridX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TStringGridX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TStringGridX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TStringGridX.Get_DefaultColWidth: Integer;
begin
  Result := FDelphiControl.DefaultColWidth;
end;

function TStringGridX.Get_DefaultDrawing: WordBool;
begin
  Result := FDelphiControl.DefaultDrawing;
end;

function TStringGridX.Get_DefaultRowHeight: Integer;
begin
  Result := FDelphiControl.DefaultRowHeight;
end;

function TStringGridX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TStringGridX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TStringGridX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TStringGridX.Get_EditorMode: WordBool;
begin
  Result := FDelphiControl.EditorMode;
end;

function TStringGridX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TStringGridX.Get_FixedColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.FixedColor);
end;

function TStringGridX.Get_FixedCols: Integer;
begin
  Result := FDelphiControl.FixedCols;
end;

function TStringGridX.Get_FixedRows: Integer;
begin
  Result := FDelphiControl.FixedRows;
end;

function TStringGridX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TStringGridX.Get_GridHeight: Integer;
begin
  Result := FDelphiControl.GridHeight;
end;

function TStringGridX.Get_GridLineWidth: Integer;
begin
  Result := FDelphiControl.GridLineWidth;
end;

function TStringGridX.Get_GridWidth: Integer;
begin
  Result := FDelphiControl.GridWidth;
end;

function TStringGridX.Get_LeftCol: Integer;
begin
  Result := FDelphiControl.LeftCol;
end;

function TStringGridX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TStringGridX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TStringGridX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TStringGridX.Get_Row: Integer;
begin
  Result := FDelphiControl.Row;
end;

function TStringGridX.Get_RowCount: Integer;
begin
  Result := FDelphiControl.RowCount;
end;

function TStringGridX.Get_ScrollBars: TxScrollStyle;
begin
  Result := Ord(FDelphiControl.ScrollBars);
end;

function TStringGridX.Get_TopRow: Integer;
begin
  Result := FDelphiControl.TopRow;
end;

function TStringGridX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TStringGridX.Get_VisibleColCount: Integer;
begin
  Result := FDelphiControl.VisibleColCount;
end;

function TStringGridX.Get_VisibleRowCount: Integer;
begin
  Result := FDelphiControl.VisibleRowCount;
end;

function TStringGridX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TStringGridX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TStringGridX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TStringGridX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TStringGridX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TStringGridX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TStringGridX.AboutBox;
begin
  ShowStringGridXAbout;
end;

procedure TStringGridX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TStringGridX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TStringGridX.MouseToCell(X, Y: Integer; var ACol, ARow: Integer);
begin

end;

procedure TStringGridX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TStringGridX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TStringGridX.Set_Col(Value: Integer);
begin
  FDelphiControl.Col := Value;
end;

procedure TStringGridX.Set_ColCount(Value: Integer);
begin
  FDelphiControl.ColCount := Value;
end;

procedure TStringGridX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TStringGridX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TStringGridX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TStringGridX.Set_DefaultColWidth(Value: Integer);
begin
  FDelphiControl.DefaultColWidth := Value;
end;

procedure TStringGridX.Set_DefaultDrawing(Value: WordBool);
begin
  FDelphiControl.DefaultDrawing := Value;
end;

procedure TStringGridX.Set_DefaultRowHeight(Value: Integer);
begin
  FDelphiControl.DefaultRowHeight := Value;
end;

procedure TStringGridX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TStringGridX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TStringGridX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TStringGridX.Set_EditorMode(Value: WordBool);
begin
  FDelphiControl.EditorMode := Value;
end;

procedure TStringGridX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TStringGridX.Set_FixedColor(Value: OLE_COLOR);
begin
  FDelphiControl.FixedColor := TColor(Value);
end;

procedure TStringGridX.Set_FixedCols(Value: Integer);
begin
  FDelphiControl.FixedCols := Value;
end;

procedure TStringGridX.Set_FixedRows(Value: Integer);
begin
  FDelphiControl.FixedRows := Value;
end;

procedure TStringGridX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TStringGridX.Set_GridLineWidth(Value: Integer);
begin
  FDelphiControl.GridLineWidth := Value;
end;

procedure TStringGridX.Set_LeftCol(Value: Integer);
begin
  FDelphiControl.LeftCol := Value;
end;

procedure TStringGridX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TStringGridX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TStringGridX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TStringGridX.Set_Row(Value: Integer);
begin
  FDelphiControl.Row := Value;
end;

procedure TStringGridX.Set_RowCount(Value: Integer);
begin
  FDelphiControl.RowCount := Value;
end;

procedure TStringGridX.Set_ScrollBars(Value: TxScrollStyle);
begin
  FDelphiControl.ScrollBars := TScrollStyle(Value);
end;

procedure TStringGridX.Set_TopRow(Value: Integer);
begin
  FDelphiControl.TopRow := Value;
end;

procedure TStringGridX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TStringGridX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TStringGridX.ColumnMovedEvent(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  if FEvents <> nil then FEvents.OnColumnMoved(FromIndex, ToIndex);
end;

procedure TStringGridX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TStringGridX.GetEditMaskEvent(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var
  TempValue: WideString;
begin
  TempValue := WideString(Value);
  if FEvents <> nil then FEvents.OnGetEditMask(ACol, ARow, TempValue);
  Value := String(TempValue);
end;

procedure TStringGridX.GetEditTextEvent(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var
  TempValue: WideString;
begin
  TempValue := WideString(Value);
  if FEvents <> nil then FEvents.OnGetEditText(ACol, ARow, TempValue);
  Value := String(TempValue);
end;

procedure TStringGridX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TStringGridX.RowMovedEvent(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  if FEvents <> nil then FEvents.OnRowMoved(FromIndex, ToIndex);
end;

procedure TStringGridX.SelectCellEvent(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  TempCanSelect: WordBool;
begin
  TempCanSelect := WordBool(CanSelect);
  if FEvents <> nil then FEvents.OnSelectCell(ACol, ARow, TempCanSelect);
  CanSelect := Boolean(TempCanSelect);
end;

procedure TStringGridX.SetEditTextEvent(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if FEvents <> nil then FEvents.OnSetEditText(ACol, ARow, WideString(Value));
end;

procedure TStringGridX.TopLeftChangedEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnTopLeftChanged;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TStringGridX,
    TStringGrid,
    Class_StringGridX,
    32,
    '{695CDBCC-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
