unit EditImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TEditX = class(TActiveXControl, IEditX)
  private
    { Private declarations }
    FDelphiControl: TEdit;
    FEvents: IEditXEvents;
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
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_CharCase: TxEditCharCase; safecall;
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
    function Get_MaxLength: Integer; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_OEMConvert: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_PasswordChar: Smallint; safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_SelLength: Integer; safecall;
    function Get_SelStart: Integer; safecall;
    function Get_SelText: WideString; safecall;
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
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_CharCase(Value: TxEditCharCase); safecall;
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
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    procedure Set_OEMConvert(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_PasswordChar(Value: Smallint); safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    procedure Set_Text(const Value: WideString); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Undo; safecall;
  end;

implementation

uses ComObj, About11;

{ TEditX }

procedure TEditX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_EditXPage); }
end;

procedure TEditX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IEditXEvents;
end;

procedure TEditX.InitializeControl;
begin
  FDelphiControl := Control as TEdit;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TEditX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TEditX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TEditX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TEditX.Get_AutoSelect: WordBool;
begin
  Result := FDelphiControl.AutoSelect;
end;

function TEditX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TEditX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TEditX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TEditX.Get_CanUndo: WordBool;
begin
  Result := FDelphiControl.CanUndo;
end;

function TEditX.Get_CharCase: TxEditCharCase;
begin
  Result := Ord(FDelphiControl.CharCase);
end;

function TEditX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TEditX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TEditX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TEditX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TEditX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TEditX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TEditX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TEditX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TEditX.Get_HideSelection: WordBool;
begin
  Result := FDelphiControl.HideSelection;
end;

function TEditX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TEditX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TEditX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TEditX.Get_Modified: WordBool;
begin
  Result := FDelphiControl.Modified;
end;

function TEditX.Get_OEMConvert: WordBool;
begin
  Result := FDelphiControl.OEMConvert;
end;

function TEditX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TEditX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TEditX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TEditX.Get_PasswordChar: Smallint;
begin
  Result := Smallint(FDelphiControl.PasswordChar);
end;

function TEditX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TEditX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TEditX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TEditX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TEditX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TEditX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TEditX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TEditX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TEditX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TEditX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TEditX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TEditX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TEditX.AboutBox;
begin
  ShowEditXAbout;
end;

procedure TEditX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TEditX.ClearSelection;
begin
  FDelphiControl.ClearSelection;
end;

procedure TEditX.ClearUndo;
begin
  FDelphiControl.ClearUndo;
end;

procedure TEditX.CopyToClipboard;
begin
  FDelphiControl.CopyToClipboard;
end;

procedure TEditX.CutToClipboard;
begin
  FDelphiControl.CutToClipboard;
end;

procedure TEditX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TEditX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TEditX.PasteFromClipboard;
begin
  FDelphiControl.PasteFromClipboard;
end;

procedure TEditX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TEditX.Set_AutoSelect(Value: WordBool);
begin
  FDelphiControl.AutoSelect := Value;
end;

procedure TEditX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TEditX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TEditX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TEditX.Set_CharCase(Value: TxEditCharCase);
begin
  FDelphiControl.CharCase := TEditCharCase(Value);
end;

procedure TEditX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TEditX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TEditX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TEditX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TEditX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TEditX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TEditX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TEditX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TEditX.Set_HideSelection(Value: WordBool);
begin
  FDelphiControl.HideSelection := Value;
end;

procedure TEditX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TEditX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TEditX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TEditX.Set_Modified(Value: WordBool);
begin
  FDelphiControl.Modified := Value;
end;

procedure TEditX.Set_OEMConvert(Value: WordBool);
begin
  FDelphiControl.OEMConvert := Value;
end;

procedure TEditX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TEditX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TEditX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TEditX.Set_PasswordChar(Value: Smallint);
begin
  FDelphiControl.PasswordChar := Char(Value);
end;

procedure TEditX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TEditX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TEditX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TEditX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TEditX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := TCaption(Value);
end;

procedure TEditX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TEditX.Undo;
begin
  FDelphiControl.Undo;
end;

procedure TEditX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TEditX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TEditX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TEditX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TEditX,
    TEdit,
    Class_EditX,
    11,
    '{695CDB2A-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
