unit AnimateImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TAnimateX = class(TActiveXControl, IAnimateX)
  private
    { Private declarations }
    FDelphiControl: TAnimate;
    FEvents: IAnimateXEvents;
    procedure CloseEvent(Sender: TObject);
    procedure OpenEvent(Sender: TObject);
    procedure StartEvent(Sender: TObject);
    procedure StopEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_Active: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Center: WordBool; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_CommonAVI: TxCommonAVI; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_FileName: WideString; safecall;
    function Get_FrameCount: Integer; safecall;
    function Get_FrameHeight: Integer; safecall;
    function Get_FrameWidth: Integer; safecall;
    function Get_Open: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_Repetitions: Integer; safecall;
    function Get_ResHandle: Integer; safecall;
    function Get_ResId: Integer; safecall;
    function Get_ResName: WideString; safecall;
    function Get_StartFrame: Smallint; safecall;
    function Get_StopFrame: Smallint; safecall;
    function Get_Timers: WordBool; safecall;
    function Get_Transparent: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Play(FromFrame, ToFrame: Smallint; Count: Integer); safecall;
    procedure Reset; safecall;
    procedure Seek(Frame: Smallint); safecall;
    procedure Set_Active(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Center(Value: WordBool); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_CommonAVI(Value: TxCommonAVI); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    procedure Set_Open(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_Repetitions(Value: Integer); safecall;
    procedure Set_ResHandle(Value: Integer); safecall;
    procedure Set_ResId(Value: Integer); safecall;
    procedure Set_ResName(const Value: WideString); safecall;
    procedure Set_StartFrame(Value: Smallint); safecall;
    procedure Set_StopFrame(Value: Smallint); safecall;
    procedure Set_Timers(Value: WordBool); safecall;
    procedure Set_Transparent(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Stop; safecall;
  end;

implementation

uses ComObj, About1;

{ TAnimateX }

procedure TAnimateX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_AnimateXPage); }
end;

procedure TAnimateX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAnimateXEvents;
end;

procedure TAnimateX.InitializeControl;
begin
  FDelphiControl := Control as TAnimate;
  FDelphiControl.OnClose := CloseEvent;
  FDelphiControl.OnOpen := OpenEvent;
  FDelphiControl.OnStart := StartEvent;
  FDelphiControl.OnStop := StopEvent;
end;

function TAnimateX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TAnimateX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TAnimateX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TAnimateX.Get_Active: WordBool;
begin
  Result := FDelphiControl.Active;
end;

function TAnimateX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TAnimateX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TAnimateX.Get_Center: WordBool;
begin
  Result := FDelphiControl.Center;
end;

function TAnimateX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TAnimateX.Get_CommonAVI: TxCommonAVI;
begin
  Result := Ord(FDelphiControl.CommonAVI);
end;

function TAnimateX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TAnimateX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TAnimateX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TAnimateX.Get_FileName: WideString;
begin
  Result := WideString(FDelphiControl.FileName);
end;

function TAnimateX.Get_FrameCount: Integer;
begin
  Result := FDelphiControl.FrameCount;
end;

function TAnimateX.Get_FrameHeight: Integer;
begin
  Result := FDelphiControl.FrameHeight;
end;

function TAnimateX.Get_FrameWidth: Integer;
begin
  Result := FDelphiControl.FrameWidth;
end;

function TAnimateX.Get_Open: WordBool;
begin
  Result := FDelphiControl.Open;
end;

function TAnimateX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TAnimateX.Get_Repetitions: Integer;
begin
  Result := FDelphiControl.Repetitions;
end;

function TAnimateX.Get_ResHandle: Integer;
begin
  Result := Integer(FDelphiControl.ResHandle);
end;

function TAnimateX.Get_ResId: Integer;
begin
  Result := FDelphiControl.ResId;
end;

function TAnimateX.Get_ResName: WideString;
begin
  Result := WideString(FDelphiControl.ResName);
end;

function TAnimateX.Get_StartFrame: Smallint;
begin
  Result := FDelphiControl.StartFrame;
end;

function TAnimateX.Get_StopFrame: Smallint;
begin
  Result := FDelphiControl.StopFrame;
end;

function TAnimateX.Get_Timers: WordBool;
begin
  Result := FDelphiControl.Timers;
end;

function TAnimateX.Get_Transparent: WordBool;
begin
  Result := FDelphiControl.Transparent;
end;

function TAnimateX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TAnimateX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TAnimateX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TAnimateX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TAnimateX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TAnimateX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TAnimateX.AboutBox;
begin
  ShowAnimateXAbout;
end;

procedure TAnimateX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TAnimateX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TAnimateX.Play(FromFrame, ToFrame: Smallint; Count: Integer);
begin
  FDelphiControl.Play(FromFrame, ToFrame, Count);
end;

procedure TAnimateX.Reset;
begin
  FDelphiControl.Reset;
end;

procedure TAnimateX.Seek(Frame: Smallint);
begin
  FDelphiControl.Seek(Frame);
end;

procedure TAnimateX.Set_Active(Value: WordBool);
begin
  FDelphiControl.Active := Value;
end;

procedure TAnimateX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TAnimateX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TAnimateX.Set_Center(Value: WordBool);
begin
  FDelphiControl.Center := Value;
end;

procedure TAnimateX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TAnimateX.Set_CommonAVI(Value: TxCommonAVI);
begin
  FDelphiControl.CommonAVI := TCommonAVI(Value);
end;

procedure TAnimateX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TAnimateX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TAnimateX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TAnimateX.Set_FileName(const Value: WideString);
begin
  FDelphiControl.FileName := String(Value);
end;

procedure TAnimateX.Set_Open(Value: WordBool);
begin
  FDelphiControl.Open := Value;
end;

procedure TAnimateX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TAnimateX.Set_Repetitions(Value: Integer);
begin
  FDelphiControl.Repetitions := Value;
end;

procedure TAnimateX.Set_ResHandle(Value: Integer);
begin
  FDelphiControl.ResHandle := Cardinal(Value);
end;

procedure TAnimateX.Set_ResId(Value: Integer);
begin
  FDelphiControl.ResId := Value;
end;

procedure TAnimateX.Set_ResName(const Value: WideString);
begin
  FDelphiControl.ResName := String(Value);
end;

procedure TAnimateX.Set_StartFrame(Value: Smallint);
begin
  FDelphiControl.StartFrame := Value;
end;

procedure TAnimateX.Set_StopFrame(Value: Smallint);
begin
  FDelphiControl.StopFrame := Value;
end;

procedure TAnimateX.Set_Timers(Value: WordBool);
begin
  FDelphiControl.Timers := Value;
end;

procedure TAnimateX.Set_Transparent(Value: WordBool);
begin
  FDelphiControl.Transparent := Value;
end;

procedure TAnimateX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TAnimateX.Stop;
begin
  FDelphiControl.Stop;
end;

procedure TAnimateX.CloseEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClose;
end;

procedure TAnimateX.OpenEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnOpen;
end;

procedure TAnimateX.StartEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnStart;
end;

procedure TAnimateX.StopEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnStop;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TAnimateX,
    TAnimate,
    Class_AnimateX,
    1,
    '{695CDAD3-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
