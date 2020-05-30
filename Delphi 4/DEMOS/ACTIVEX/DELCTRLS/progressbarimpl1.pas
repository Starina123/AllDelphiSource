unit ProgressBarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TProgressBarX = class(TActiveXControl, IProgressBarX)
  private
    { Private declarations }
    FDelphiControl: TProgressBar;
    FEvents: IProgressBarXEvents;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Max: Integer; safecall;
    function Get_Min: Integer; safecall;
    function Get_Orientation: TxProgressBarOrientation; safecall;
    function Get_Position: Integer; safecall;
    function Get_Smooth: WordBool; safecall;
    function Get_Step: Integer; safecall;
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
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Max(Value: Integer); safecall;
    procedure Set_Min(Value: Integer); safecall;
    procedure Set_Orientation(Value: TxProgressBarOrientation); safecall;
    procedure Set_Position(Value: Integer); safecall;
    procedure Set_Smooth(Value: WordBool); safecall;
    procedure Set_Step(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure StepBy(Delta: Integer); safecall;
    procedure StepIt; safecall;
  end;

implementation

uses ComObj, About23;

{ TProgressBarX }

procedure TProgressBarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ProgressBarXPage); }
end;

procedure TProgressBarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IProgressBarXEvents;
end;

procedure TProgressBarX.InitializeControl;
begin
  FDelphiControl := Control as TProgressBar;
end;

function TProgressBarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TProgressBarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TProgressBarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TProgressBarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TProgressBarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TProgressBarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TProgressBarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TProgressBarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TProgressBarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TProgressBarX.Get_Max: Integer;
begin
  Result := FDelphiControl.Max;
end;

function TProgressBarX.Get_Min: Integer;
begin
  Result := FDelphiControl.Min;
end;

function TProgressBarX.Get_Orientation: TxProgressBarOrientation;
begin
  Result := Ord(FDelphiControl.Orientation);
end;

function TProgressBarX.Get_Position: Integer;
begin
  Result := FDelphiControl.Position;
end;

function TProgressBarX.Get_Smooth: WordBool;
begin
  Result := FDelphiControl.Smooth;
end;

function TProgressBarX.Get_Step: Integer;
begin
  Result := FDelphiControl.Step;
end;

function TProgressBarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TProgressBarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TProgressBarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TProgressBarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TProgressBarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TProgressBarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TProgressBarX.AboutBox;
begin
  ShowProgressBarXAbout;
end;

procedure TProgressBarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TProgressBarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TProgressBarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TProgressBarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TProgressBarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TProgressBarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TProgressBarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TProgressBarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TProgressBarX.Set_Max(Value: Integer);
begin
  FDelphiControl.Max := Value;
end;

procedure TProgressBarX.Set_Min(Value: Integer);
begin
  FDelphiControl.Min := Value;
end;

procedure TProgressBarX.Set_Orientation(Value: TxProgressBarOrientation);
begin
  FDelphiControl.Orientation := TProgressBarOrientation(Value);
end;

procedure TProgressBarX.Set_Position(Value: Integer);
begin
  FDelphiControl.Position := Value;
end;

procedure TProgressBarX.Set_Smooth(Value: WordBool);
begin
  FDelphiControl.Smooth := Value;
end;

procedure TProgressBarX.Set_Step(Value: Integer);
begin
  FDelphiControl.Step := Value;
end;

procedure TProgressBarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TProgressBarX.StepBy(Delta: Integer);
begin
  FDelphiControl.StepBy(Delta);
end;

procedure TProgressBarX.StepIt;
begin
  FDelphiControl.StepIt;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TProgressBarX,
    TProgressBar,
    Class_ProgressBarX,
    23,
    '{695CDB8A-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
