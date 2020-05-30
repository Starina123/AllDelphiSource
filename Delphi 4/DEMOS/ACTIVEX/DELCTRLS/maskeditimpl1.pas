unit MaskEditImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Mask;

type
  TMaskEditX = class(TActiveXControl, IMaskEditX)
  private
    { Private declarations }
    FDelphiControl: TMaskEdit;
    FEvents: IMaskEditXEvents;
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
    function Get_EditMask: WideString; safecall;
    function Get_EditText: WideString; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_IsMasked: WordBool; safecall;
    function Get_MaxLength: Integer; safecall;
    function Get_Modified: WordBool; safecall;
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
    procedure Set_EditMask(const Value: WideString); safecall;
    procedure Set_EditText(const Value: WideString); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    procedure Set_Modified(Value: WordBool); safecall;
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
    procedure ValidateEdit; safecall;
  end;

implementation

uses ComObj, About15;

{ TMaskEditX }

procedure TMaskEditX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MaskEditXPage); }
end;

procedure TMaskEditX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMaskEditXEvents;
end;

procedure TMaskEditX.InitializeControl;
begin
  FDelphiControl := Control as TMaskEdit;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TMaskEditX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TMaskEditX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TMaskEditX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMaskEditX.Get_AutoSelect: WordBool;
begin
  Result := FDelphiControl.AutoSelect;
end;

function TMaskEditX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TMaskEditX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TMaskEditX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TMaskEditX.Get_CanUndo: WordBool;
begin
  Result := FDelphiControl.CanUndo;
end;

function TMaskEditX.Get_CharCase: TxEditCharCase;
begin
  Result := Ord(FDelphiControl.CharCase);
end;

function TMaskEditX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TMaskEditX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TMaskEditX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMaskEditX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TMaskEditX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TMaskEditX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TMaskEditX.Get_EditMask: WideString;
begin
  Result := WideString(FDelphiControl.EditMask);
end;

function TMaskEditX.Get_EditText: WideString;
begin
  Result := WideString(FDelphiControl.EditText);
end;

function TMaskEditX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMaskEditX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TMaskEditX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TMaskEditX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TMaskEditX.Get_IsMasked: WordBool;
begin
  Result := FDelphiControl.IsMasked;
end;

function TMaskEditX.Get_MaxLength: Integer;
begin
  Result := FDelphiControl.MaxLength;
end;

function TMaskEditX.Get_Modified: WordBool;
begin
  Result := FDelphiControl.Modified;
end;

function TMaskEditX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TMaskEditX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TMaskEditX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TMaskEditX.Get_PasswordChar: Smallint;
begin
  Result := Smallint(FDelphiControl.PasswordChar);
end;

function TMaskEditX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TMaskEditX.Get_SelLength: Integer;
begin
  Result := FDelphiControl.SelLength;
end;

function TMaskEditX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TMaskEditX.Get_SelText: WideString;
begin
  Result := WideString(FDelphiControl.SelText);
end;

function TMaskEditX.Get_Text: WideString;
begin
  Result := WideString(FDelphiControl.Text);
end;

function TMaskEditX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TMaskEditX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TMaskEditX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TMaskEditX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TMaskEditX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TMaskEditX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TMaskEditX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMaskEditX.AboutBox;
begin
  ShowMaskEditXAbout;
end;

procedure TMaskEditX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TMaskEditX.ClearSelection;
begin
  FDelphiControl.ClearSelection;
end;

procedure TMaskEditX.ClearUndo;
begin
  FDelphiControl.ClearUndo;
end;

procedure TMaskEditX.CopyToClipboard;
begin
  FDelphiControl.CopyToClipboard;
end;

procedure TMaskEditX.CutToClipboard;
begin
  FDelphiControl.CutToClipboard;
end;

procedure TMaskEditX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TMaskEditX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TMaskEditX.PasteFromClipboard;
begin
  FDelphiControl.PasteFromClipboard;
end;

procedure TMaskEditX.SelectAll;
begin
  FDelphiControl.SelectAll;
end;

procedure TMaskEditX.Set_AutoSelect(Value: WordBool);
begin
  FDelphiControl.AutoSelect := Value;
end;

procedure TMaskEditX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TMaskEditX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TMaskEditX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TMaskEditX.Set_CharCase(Value: TxEditCharCase);
begin
  FDelphiControl.CharCase := TEditCharCase(Value);
end;

procedure TMaskEditX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TMaskEditX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TMaskEditX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMaskEditX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TMaskEditX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TMaskEditX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TMaskEditX.Set_EditMask(const Value: WideString);
begin
  FDelphiControl.EditMask := String(Value);
end;

procedure TMaskEditX.Set_EditText(const Value: WideString);
begin
  FDelphiControl.EditText := String(Value);
end;

procedure TMaskEditX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMaskEditX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMaskEditX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TMaskEditX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TMaskEditX.Set_MaxLength(Value: Integer);
begin
  FDelphiControl.MaxLength := Value;
end;

procedure TMaskEditX.Set_Modified(Value: WordBool);
begin
  FDelphiControl.Modified := Value;
end;

procedure TMaskEditX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TMaskEditX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TMaskEditX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TMaskEditX.Set_PasswordChar(Value: Smallint);
begin
  FDelphiControl.PasswordChar := Char(Value);
end;

procedure TMaskEditX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TMaskEditX.Set_SelLength(Value: Integer);
begin
  FDelphiControl.SelLength := Value;
end;

procedure TMaskEditX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TMaskEditX.Set_SelText(const Value: WideString);
begin
  FDelphiControl.SelText := String(Value);
end;

procedure TMaskEditX.Set_Text(const Value: WideString);
begin
  FDelphiControl.Text := String(Value);
end;

procedure TMaskEditX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TMaskEditX.Undo;
begin
  FDelphiControl.Undo;
end;

procedure TMaskEditX.ValidateEdit;
begin
  FDelphiControl.ValidateEdit;
end;

procedure TMaskEditX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TMaskEditX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMaskEditX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMaskEditX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TMaskEditX,
    TMaskEdit,
    Class_MaskEditX,
    15,
    '{695CDB46-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
