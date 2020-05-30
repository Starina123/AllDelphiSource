unit ScrollBarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TScrollBarX = class(TActiveXControl, IScrollBarX)
  private
    { Private declarations }
    FDelphiControl: TScrollBar;
    FEvents: IScrollBarXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure ScrollEvent(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Kind: TxScrollBarKind; safecall;
    function Get_LargeChange: Smallint; safecall;
    function Get_Max: Integer; safecall;
    function Get_Min: Integer; safecall;
    function Get_PageSize: Integer; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_Position: Integer; safecall;
    function Get_SmallChange: Smallint; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Kind(Value: TxScrollBarKind); safecall;
    procedure Set_LargeChange(Value: Smallint); safecall;
    procedure Set_Max(Value: Integer); safecall;
    procedure Set_Min(Value: Integer); safecall;
    procedure Set_PageSize(Value: Integer); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_Position(Value: Integer); safecall;
    procedure Set_SmallChange(Value: Smallint); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure SetParams(APosition, AMin, AMax: Integer); safecall;
  end;

implementation

uses ComObj, About27;

{ TScrollBarX }

procedure TScrollBarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ScrollBarXPage); }
end;

procedure TScrollBarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IScrollBarXEvents;
end;

procedure TScrollBarX.InitializeControl;
begin
  FDelphiControl := Control as TScrollBar;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnScroll := ScrollEvent;
end;

function TScrollBarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TScrollBarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TScrollBarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TScrollBarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TScrollBarX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TScrollBarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TScrollBarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TScrollBarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TScrollBarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TScrollBarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TScrollBarX.Get_Kind: TxScrollBarKind;
begin
  Result := Ord(FDelphiControl.Kind);
end;

function TScrollBarX.Get_LargeChange: Smallint;
begin
  Result := Smallint(FDelphiControl.LargeChange);
end;

function TScrollBarX.Get_Max: Integer;
begin
  Result := FDelphiControl.Max;
end;

function TScrollBarX.Get_Min: Integer;
begin
  Result := FDelphiControl.Min;
end;

function TScrollBarX.Get_PageSize: Integer;
begin
  Result := FDelphiControl.PageSize;
end;

function TScrollBarX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TScrollBarX.Get_Position: Integer;
begin
  Result := FDelphiControl.Position;
end;

function TScrollBarX.Get_SmallChange: Smallint;
begin
  Result := Smallint(FDelphiControl.SmallChange);
end;

function TScrollBarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TScrollBarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TScrollBarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TScrollBarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TScrollBarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TScrollBarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TScrollBarX.AboutBox;
begin
  ShowScrollBarXAbout;
end;

procedure TScrollBarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TScrollBarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TScrollBarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TScrollBarX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TScrollBarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TScrollBarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TScrollBarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TScrollBarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TScrollBarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TScrollBarX.Set_Kind(Value: TxScrollBarKind);
begin
  FDelphiControl.Kind := TScrollBarKind(Value);
end;

procedure TScrollBarX.Set_LargeChange(Value: Smallint);
begin
  FDelphiControl.LargeChange := TScrollBarInc(Value);
end;

procedure TScrollBarX.Set_Max(Value: Integer);
begin
  FDelphiControl.Max := Value;
end;

procedure TScrollBarX.Set_Min(Value: Integer);
begin
  FDelphiControl.Min := Value;
end;

procedure TScrollBarX.Set_PageSize(Value: Integer);
begin
  FDelphiControl.PageSize := Value;
end;

procedure TScrollBarX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TScrollBarX.Set_Position(Value: Integer);
begin
  FDelphiControl.Position := Value;
end;

procedure TScrollBarX.Set_SmallChange(Value: Smallint);
begin
  FDelphiControl.SmallChange := TScrollBarInc(Value);
end;

procedure TScrollBarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TScrollBarX.SetParams(APosition, AMin, AMax: Integer);
begin
  FDelphiControl.SetParams(APosition, AMin, AMax);
end;

procedure TScrollBarX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TScrollBarX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TScrollBarX.ScrollEvent(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
  TempScrollPos: Integer;
begin
  TempScrollPos := Integer(ScrollPos);
  if FEvents <> nil then FEvents.OnScroll(TxScrollCode(ScrollCode), TempScrollPos);
  ScrollPos := Integer(TempScrollPos);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TScrollBarX,
    TScrollBar,
    Class_ScrollBarX,
    27,
    '{695CDBA8-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
