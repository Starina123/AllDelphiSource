unit TrackBarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TTrackBarX = class(TActiveXControl, ITrackBarX)
  private
    { Private declarations }
    FDelphiControl: TTrackBar;
    FEvents: ITrackBarXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
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
    function Get_Frequency: Integer; safecall;
    function Get_LineSize: Integer; safecall;
    function Get_Max: Integer; safecall;
    function Get_Min: Integer; safecall;
    function Get_Orientation: TxTrackBarOrientation; safecall;
    function Get_PageSize: Integer; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_Position: Integer; safecall;
    function Get_SelEnd: Integer; safecall;
    function Get_SelStart: Integer; safecall;
    function Get_SliderVisible: WordBool; safecall;
    function Get_ThumbLength: Integer; safecall;
    function Get_TickMarks: TxTickMark; safecall;
    function Get_TickStyle: TxTickStyle; safecall;
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
    procedure Set_Frequency(Value: Integer); safecall;
    procedure Set_LineSize(Value: Integer); safecall;
    procedure Set_Max(Value: Integer); safecall;
    procedure Set_Min(Value: Integer); safecall;
    procedure Set_Orientation(Value: TxTrackBarOrientation); safecall;
    procedure Set_PageSize(Value: Integer); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_Position(Value: Integer); safecall;
    procedure Set_SelEnd(Value: Integer); safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    procedure Set_SliderVisible(Value: WordBool); safecall;
    procedure Set_ThumbLength(Value: Integer); safecall;
    procedure Set_TickMarks(Value: TxTickMark); safecall;
    procedure Set_TickStyle(Value: TxTickStyle); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure SetTick(Value: Integer); safecall;
  end;

implementation

uses ComObj, About36;

{ TTrackBarX }

procedure TTrackBarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TrackBarXPage); }
end;

procedure TTrackBarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITrackBarXEvents;
end;

procedure TTrackBarX.InitializeControl;
begin
  FDelphiControl := Control as TTrackBar;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TTrackBarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TTrackBarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TTrackBarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTrackBarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TTrackBarX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TTrackBarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TTrackBarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TTrackBarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TTrackBarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TTrackBarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TTrackBarX.Get_Frequency: Integer;
begin
  Result := FDelphiControl.Frequency;
end;

function TTrackBarX.Get_LineSize: Integer;
begin
  Result := FDelphiControl.LineSize;
end;

function TTrackBarX.Get_Max: Integer;
begin
  Result := FDelphiControl.Max;
end;

function TTrackBarX.Get_Min: Integer;
begin
  Result := FDelphiControl.Min;
end;

function TTrackBarX.Get_Orientation: TxTrackBarOrientation;
begin
  Result := Ord(FDelphiControl.Orientation);
end;

function TTrackBarX.Get_PageSize: Integer;
begin
  Result := FDelphiControl.PageSize;
end;

function TTrackBarX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TTrackBarX.Get_Position: Integer;
begin
  Result := FDelphiControl.Position;
end;

function TTrackBarX.Get_SelEnd: Integer;
begin
  Result := FDelphiControl.SelEnd;
end;

function TTrackBarX.Get_SelStart: Integer;
begin
  Result := FDelphiControl.SelStart;
end;

function TTrackBarX.Get_SliderVisible: WordBool;
begin
  Result := FDelphiControl.SliderVisible;
end;

function TTrackBarX.Get_ThumbLength: Integer;
begin
  Result := FDelphiControl.ThumbLength;
end;

function TTrackBarX.Get_TickMarks: TxTickMark;
begin
  Result := Ord(FDelphiControl.TickMarks);
end;

function TTrackBarX.Get_TickStyle: TxTickStyle;
begin
  Result := Ord(FDelphiControl.TickStyle);
end;

function TTrackBarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TTrackBarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TTrackBarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TTrackBarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TTrackBarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TTrackBarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TTrackBarX.AboutBox;
begin
  ShowTrackBarXAbout;
end;

procedure TTrackBarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TTrackBarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TTrackBarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TTrackBarX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TTrackBarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TTrackBarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TTrackBarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TTrackBarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TTrackBarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TTrackBarX.Set_Frequency(Value: Integer);
begin
  FDelphiControl.Frequency := Value;
end;

procedure TTrackBarX.Set_LineSize(Value: Integer);
begin
  FDelphiControl.LineSize := Value;
end;

procedure TTrackBarX.Set_Max(Value: Integer);
begin
  FDelphiControl.Max := Value;
end;

procedure TTrackBarX.Set_Min(Value: Integer);
begin
  FDelphiControl.Min := Value;
end;

procedure TTrackBarX.Set_Orientation(Value: TxTrackBarOrientation);
begin
  FDelphiControl.Orientation := TTrackBarOrientation(Value);
end;

procedure TTrackBarX.Set_PageSize(Value: Integer);
begin
  FDelphiControl.PageSize := Value;
end;

procedure TTrackBarX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TTrackBarX.Set_Position(Value: Integer);
begin
  FDelphiControl.Position := Value;
end;

procedure TTrackBarX.Set_SelEnd(Value: Integer);
begin
  FDelphiControl.SelEnd := Value;
end;

procedure TTrackBarX.Set_SelStart(Value: Integer);
begin
  FDelphiControl.SelStart := Value;
end;

procedure TTrackBarX.Set_SliderVisible(Value: WordBool);
begin
  FDelphiControl.SliderVisible := Value;
end;

procedure TTrackBarX.Set_ThumbLength(Value: Integer);
begin
  FDelphiControl.ThumbLength := Value;
end;

procedure TTrackBarX.Set_TickMarks(Value: TxTickMark);
begin
  FDelphiControl.TickMarks := TTickMark(Value);
end;

procedure TTrackBarX.Set_TickStyle(Value: TxTickStyle);
begin
  FDelphiControl.TickStyle := TTickStyle(Value);
end;

procedure TTrackBarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TTrackBarX.SetTick(Value: Integer);
begin
  FDelphiControl.SetTick(Value);
end;

procedure TTrackBarX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TTrackBarX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TTrackBarX,
    TTrackBar,
    Class_TrackBarX,
    36,
    '{695CDBED-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
