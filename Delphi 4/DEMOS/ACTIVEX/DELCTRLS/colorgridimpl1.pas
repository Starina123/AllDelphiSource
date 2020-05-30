unit ColorGridImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ColorGrd;

type
  TColorGridX = class(TActiveXControl, IColorGridX)
  private
    { Private declarations }
    FDelphiControl: TColorGrid;
    FEvents: IColorGridXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function ColorToIndex(AColor: OLE_COLOR): Integer; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BackgroundColor: OLE_COLOR; safecall;
    function Get_BackgroundEnabled: WordBool; safecall;
    function Get_BackgroundIndex: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_ClickEnablesColor: WordBool; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ForegroundColor: OLE_COLOR; safecall;
    function Get_ForegroundEnabled: WordBool; safecall;
    function Get_ForegroundIndex: Integer; safecall;
    function Get_GridOrdering: TxGridOrdering; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Selection: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_BackgroundEnabled(Value: WordBool); safecall;
    procedure Set_BackgroundIndex(Value: Integer); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_ClickEnablesColor(Value: WordBool); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ForegroundEnabled(Value: WordBool); safecall;
    procedure Set_ForegroundIndex(Value: Integer); safecall;
    procedure Set_GridOrdering(Value: TxGridOrdering); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Selection(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About6;

{ TColorGridX }

procedure TColorGridX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ColorGridXPage); }
end;

procedure TColorGridX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IColorGridXEvents;
end;

procedure TColorGridX.InitializeControl;
begin
  FDelphiControl := Control as TColorGrid;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TColorGridX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TColorGridX.ColorToIndex(AColor: OLE_COLOR): Integer;
begin

end;

function TColorGridX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TColorGridX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TColorGridX.Get_BackgroundColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.BackgroundColor);
end;

function TColorGridX.Get_BackgroundEnabled: WordBool;
begin
  Result := FDelphiControl.BackgroundEnabled;
end;

function TColorGridX.Get_BackgroundIndex: Integer;
begin
  Result := FDelphiControl.BackgroundIndex;
end;

function TColorGridX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TColorGridX.Get_ClickEnablesColor: WordBool;
begin
  Result := FDelphiControl.ClickEnablesColor;
end;

function TColorGridX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TColorGridX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TColorGridX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TColorGridX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TColorGridX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TColorGridX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TColorGridX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TColorGridX.Get_ForegroundColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.ForegroundColor);
end;

function TColorGridX.Get_ForegroundEnabled: WordBool;
begin
  Result := FDelphiControl.ForegroundEnabled;
end;

function TColorGridX.Get_ForegroundIndex: Integer;
begin
  Result := FDelphiControl.ForegroundIndex;
end;

function TColorGridX.Get_GridOrdering: TxGridOrdering;
begin
  Result := Ord(FDelphiControl.GridOrdering);
end;

function TColorGridX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TColorGridX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TColorGridX.Get_Selection: Integer;
begin
  Result := FDelphiControl.Selection;
end;

function TColorGridX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TColorGridX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TColorGridX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TColorGridX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TColorGridX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TColorGridX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TColorGridX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TColorGridX.AboutBox;
begin
  ShowColorGridXAbout;
end;

procedure TColorGridX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TColorGridX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TColorGridX.Set_BackgroundEnabled(Value: WordBool);
begin
  FDelphiControl.BackgroundEnabled := Value;
end;

procedure TColorGridX.Set_BackgroundIndex(Value: Integer);
begin
  FDelphiControl.BackgroundIndex := Value;
end;

procedure TColorGridX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TColorGridX.Set_ClickEnablesColor(Value: WordBool);
begin
  FDelphiControl.ClickEnablesColor := Value;
end;

procedure TColorGridX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TColorGridX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TColorGridX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TColorGridX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TColorGridX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TColorGridX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TColorGridX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TColorGridX.Set_ForegroundEnabled(Value: WordBool);
begin
  FDelphiControl.ForegroundEnabled := Value;
end;

procedure TColorGridX.Set_ForegroundIndex(Value: Integer);
begin
  FDelphiControl.ForegroundIndex := Value;
end;

procedure TColorGridX.Set_GridOrdering(Value: TxGridOrdering);
begin
  FDelphiControl.GridOrdering := TGridOrdering(Value);
end;

procedure TColorGridX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TColorGridX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TColorGridX.Set_Selection(Value: Integer);
begin
  FDelphiControl.Selection := Value;
end;

procedure TColorGridX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TColorGridX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TColorGridX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TColorGridX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TColorGridX,
    TColorGrid,
    Class_ColorGridX,
    6,
    '{695CDAFE-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
