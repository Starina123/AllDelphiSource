unit SpinButtonImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Spin;

type
  TSpinButtonX = class(TActiveXControl, ISpinButtonX)
  private
    { Private declarations }
    FDelphiControl: TSpinButton;
    FEvents: ISpinButtonXEvents;
    procedure DownClickEvent(Sender: TObject);
    procedure UpClickEvent(Sender: TObject);
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
    function Get_DownNumGlyphs: Smallint; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_UpNumGlyphs: Smallint; safecall;
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
    procedure Set_DownNumGlyphs(Value: Smallint); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_UpNumGlyphs(Value: Smallint); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About29;

{ TSpinButtonX }

procedure TSpinButtonX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SpinButtonXPage); }
end;

procedure TSpinButtonX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISpinButtonXEvents;
end;

procedure TSpinButtonX.InitializeControl;
begin
  FDelphiControl := Control as TSpinButton;
  FDelphiControl.OnDownClick := DownClickEvent;
  FDelphiControl.OnUpClick := UpClickEvent;
end;

function TSpinButtonX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TSpinButtonX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TSpinButtonX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TSpinButtonX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TSpinButtonX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TSpinButtonX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TSpinButtonX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TSpinButtonX.Get_DownNumGlyphs: Smallint;
begin
  Result := Smallint(FDelphiControl.DownNumGlyphs);
end;

function TSpinButtonX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TSpinButtonX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TSpinButtonX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TSpinButtonX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TSpinButtonX.Get_UpNumGlyphs: Smallint;
begin
  Result := Smallint(FDelphiControl.UpNumGlyphs);
end;

function TSpinButtonX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TSpinButtonX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TSpinButtonX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TSpinButtonX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TSpinButtonX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TSpinButtonX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TSpinButtonX.AboutBox;
begin
  ShowSpinButtonXAbout;
end;

procedure TSpinButtonX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TSpinButtonX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TSpinButtonX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TSpinButtonX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TSpinButtonX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TSpinButtonX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TSpinButtonX.Set_DownNumGlyphs(Value: Smallint);
begin
  FDelphiControl.DownNumGlyphs := TNumGlyphs(Value);
end;

procedure TSpinButtonX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TSpinButtonX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TSpinButtonX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TSpinButtonX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TSpinButtonX.Set_UpNumGlyphs(Value: Smallint);
begin
  FDelphiControl.UpNumGlyphs := TNumGlyphs(Value);
end;

procedure TSpinButtonX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TSpinButtonX.DownClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDownClick;
end;

procedure TSpinButtonX.UpClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnUpClick;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TSpinButtonX,
    TSpinButton,
    Class_SpinButtonX,
    29,
    '{695CDBB6-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
