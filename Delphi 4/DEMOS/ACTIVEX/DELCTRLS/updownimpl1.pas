unit UpDownImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TUpDownX = class(TActiveXControl, IUpDownX)
  private
    { Private declarations }
    FDelphiControl: TUpDown;
    FEvents: IUpDownXEvents;
    procedure ChangingEvent(Sender: TObject; var AllowChange: Boolean);
    procedure ClickEvent(Sender: TObject; Button: TUDBtnType);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AlignButton: TxUDAlignButton; safecall;
    function Get_ArrowKeys: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Increment: Integer; safecall;
    function Get_Max: Smallint; safecall;
    function Get_Min: Smallint; safecall;
    function Get_Orientation: TxUDOrientation; safecall;
    function Get_Position: Smallint; safecall;
    function Get_Thousands: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_Wrap: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AlignButton(Value: TxUDAlignButton); safecall;
    procedure Set_ArrowKeys(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Increment(Value: Integer); safecall;
    procedure Set_Max(Value: Smallint); safecall;
    procedure Set_Min(Value: Smallint); safecall;
    procedure Set_Orientation(Value: TxUDOrientation); safecall;
    procedure Set_Position(Value: Smallint); safecall;
    procedure Set_Thousands(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_Wrap(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About37;

{ TUpDownX }

procedure TUpDownX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_UpDownXPage); }
end;

procedure TUpDownX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IUpDownXEvents;
end;

procedure TUpDownX.InitializeControl;
begin
  FDelphiControl := Control as TUpDown;
  FDelphiControl.OnChanging := ChangingEvent;
  FDelphiControl.OnClick := ClickEvent;
end;

function TUpDownX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TUpDownX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TUpDownX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TUpDownX.Get_AlignButton: TxUDAlignButton;
begin
  Result := Ord(FDelphiControl.AlignButton);
end;

function TUpDownX.Get_ArrowKeys: WordBool;
begin
  Result := FDelphiControl.ArrowKeys;
end;

function TUpDownX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TUpDownX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TUpDownX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TUpDownX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TUpDownX.Get_Increment: Integer;
begin
  Result := FDelphiControl.Increment;
end;

function TUpDownX.Get_Max: Smallint;
begin
  Result := FDelphiControl.Max;
end;

function TUpDownX.Get_Min: Smallint;
begin
  Result := FDelphiControl.Min;
end;

function TUpDownX.Get_Orientation: TxUDOrientation;
begin
  Result := Ord(FDelphiControl.Orientation);
end;

function TUpDownX.Get_Position: Smallint;
begin
  Result := FDelphiControl.Position;
end;

function TUpDownX.Get_Thousands: WordBool;
begin
  Result := FDelphiControl.Thousands;
end;

function TUpDownX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TUpDownX.Get_Wrap: WordBool;
begin
  Result := FDelphiControl.Wrap;
end;

function TUpDownX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TUpDownX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TUpDownX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TUpDownX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TUpDownX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TUpDownX.AboutBox;
begin
  ShowUpDownXAbout;
end;

procedure TUpDownX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TUpDownX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TUpDownX.Set_AlignButton(Value: TxUDAlignButton);
begin
  FDelphiControl.AlignButton := TUDAlignButton(Value);
end;

procedure TUpDownX.Set_ArrowKeys(Value: WordBool);
begin
  FDelphiControl.ArrowKeys := Value;
end;

procedure TUpDownX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TUpDownX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TUpDownX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TUpDownX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TUpDownX.Set_Increment(Value: Integer);
begin
  FDelphiControl.Increment := Value;
end;

procedure TUpDownX.Set_Max(Value: Smallint);
begin
  FDelphiControl.Max := Value;
end;

procedure TUpDownX.Set_Min(Value: Smallint);
begin
  FDelphiControl.Min := Value;
end;

procedure TUpDownX.Set_Orientation(Value: TxUDOrientation);
begin
  FDelphiControl.Orientation := TUDOrientation(Value);
end;

procedure TUpDownX.Set_Position(Value: Smallint);
begin
  FDelphiControl.Position := Value;
end;

procedure TUpDownX.Set_Thousands(Value: WordBool);
begin
  FDelphiControl.Thousands := Value;
end;

procedure TUpDownX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TUpDownX.Set_Wrap(Value: WordBool);
begin
  FDelphiControl.Wrap := Value;
end;

procedure TUpDownX.ChangingEvent(Sender: TObject;
  var AllowChange: Boolean);
var
  TempAllowChange: WordBool;
begin
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnChanging(TempAllowChange);
  AllowChange := Boolean(TempAllowChange);
end;

procedure TUpDownX.ClickEvent(Sender: TObject; Button: TUDBtnType);
begin
  if FEvents <> nil then FEvents.OnClick(TxUDBtnType(Button));
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TUpDownX,
    TUpDown,
    Class_UpDownX,
    37,
    '{695CDBF7-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
