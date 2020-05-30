unit SpinEditImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Spin;

type
  TSpinEditX = class(TActiveXControl, ISpinEditX)
  private
    { Private declarations }
    FDelphiControl: TSpinEdit;
    FEvents: ISpinEditXEvents;
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
    function Get_AutoSelect: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_EditorEnabled: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_Increment: Integer; safecall;
    function Get_MaxLength: Integer; safecall;
    function Get_MaxValue: Integer; safecall;
    function Get_MinValue: Integer; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_SelLength: Integer; safecall;
    function Get_SelStart: Integer; safecall;
    function Get_SelText: WideString; safecall;
    function Get_Text: WideString; safecall;
    function Get_Value: Integer; safecall;
    function Get_Visible: WordBool; safecall;
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
    procedure Set_AutoSelect(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_EditorEnabled(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Increment(Value: Integer); safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_MaxValue(Value: Integer); safecall;
    procedure Set_MinValue(Value: Integer); safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    procedure Set_Text(const Value: WideString); safecall;
    procedure Set_Value(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Undo; safecall;
  end;

implementation

uses ComObj, About30;

{ TSpinEditX }

procedure TSpinEditX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SpinEditXPage); }
end;

procedure TSpinEditX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISpinEditXEvents;
end;

procedure TSpinEditX.InitializeControl;
begin
  FDelphiControl := Control as TSpinEdit;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TSpinEditX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TSpinEditX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TSpinEditX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TSpinEditX.Get_AutoSelect: WordBool;
begin
  Result := FDelphiControl.AutoSelect;
end;

function TSpinEditX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TSpinEditX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TSpinEditX.Get_CanUndo: WordBool;
begin
  Result := FDelphiControl.CanUndo;
end;

function TSpinEditX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TSpinEditX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TSpinEditX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TSpinEditX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TSpinEditX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TSpinEditX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TSpinEditX.Get_EditorEnabled: WordBool;
begin
  Result := FDelphiControl.EditorEnabled;
end;

function TSpinEditX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TSpinEditX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TSpinEditX.Get_Increment: Integer;
begin
  Result := FDelphiControl.Increment;
end;

function TSpinEditX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TSpinEditX.Get_MaxValue: Integer;
begin
  Result := FDelphiControl.MaxValue;
end;

function TSpinEditX.Get_MinValue: Integer;
begin
  Result := FDelphiControl.MinValue;
end;

function TSpinEditX.Get_Modified: WordBool;
begin
  Result := FDelphiControl.Modified;
end;

function TSpinEditX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TSpinEditX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TSpinEditX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TSpinEditX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TSpinEditX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TSpinEditX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TSpinEditX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TSpinEditX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TSpinEditX.Get_Value: Integer;
begin
  Result := FDelphiControl.Value;
end;

function TSpinEditX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TSpinEditX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TSpinEditX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TSpinEditX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TSpinEditX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TSpinEditX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TSpinEditX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TSpinEditX.AboutBox;
begin
  ShowSpinEditXAbout;
end;

procedure TSpinEditX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TSpinEditX.ClearSelection;
begin
  FDelphiControl.ClearSelection;
end;

procedure TSpinEditX.ClearUndo;
begin
  FDelphiControl.ClearUndo;
end;

procedure TSpinEditX.CopyToClipboard;
begin
  FDelphiControl.CopyToClipboard;
end;

procedure TSpinEditX.CutToClipboard;
begin
  FDelphiControl.CutToClipboard;
end;

procedure TSpinEditX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TSpinEditX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TSpinEditX.PasteFromClipboard;
begin
  FDelphiControl.PasteFromClipboard;
end;

procedure TSpinEditX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TSpinEditX.Set_AutoSelect(Value: WordBool);
begin
  FDelphiControl.AutoSelect := Value;
end;

procedure TSpinEditX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TSpinEditX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TSpinEditX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TSpinEditX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TSpinEditX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TSpinEditX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TSpinEditX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TSpinEditX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TSpinEditX.Set_EditorEnabled(Value: WordBool);
begin
  FDelphiControl.EditorEnabled := Value;
end;

procedure TSpinEditX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TSpinEditX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TSpinEditX.Set_Increment(Value: Integer);
begin
  FDelphiControl.Increment := Value;
end;

procedure TSpinEditX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TSpinEditX.Set_MaxValue(Value: Integer);
begin
  FDelphiControl.MaxValue := Value;
end;

procedure TSpinEditX.Set_MinValue(Value: Integer);
begin
  FDelphiControl.MinValue := Value;
end;

procedure TSpinEditX.Set_Modified(Value: WordBool);
begin
  FDelphiControl.Modified := Value;
end;

procedure TSpinEditX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TSpinEditX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TSpinEditX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TSpinEditX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TSpinEditX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TSpinEditX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TSpinEditX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TSpinEditX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := TCaption(Value);
end;

procedure TSpinEditX.Set_Value(Value: Integer);
begin
  FDelphiControl.Value := Value;
end;

procedure TSpinEditX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TSpinEditX.Undo;
begin
  FDelphiControl.Undo;
end;

procedure TSpinEditX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TSpinEditX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSpinEditX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSpinEditX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TSpinEditX,
    TSpinEdit,
    Class_SpinEditX,
    30,
    '{695CDBBD-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
