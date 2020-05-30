unit MediaPlayerImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, MPlayer;

type
  TMediaPlayerX = class(TActiveXControl, IMediaPlayerX)
  private
    { Private declarations }
    FDelphiControl: TMediaPlayer;
    FEvents: IMediaPlayerXEvents;
    procedure ClickEvent(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure NotifyEvent(Sender: TObject);
    procedure PostClickEvent(Sender: TObject; Button: TMPBtnType);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AutoEnable: WordBool; safecall;
    function Get_AutoOpen: WordBool; safecall;
    function Get_AutoRewind: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DeviceID: Smallint; safecall;
    function Get_DeviceType: TxMPDeviceTypes; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_EndPos: Integer; safecall;
    function Get_Error: Integer; safecall;
    function Get_ErrorMessage: WideString; safecall;
    function Get_FileName: WideString; safecall;
    function Get_Frames: Integer; safecall;
    function Get_Length: Integer; safecall;
    function Get_Mode: TxMPModes; safecall;
    function Get_Notify: WordBool; safecall;
    function Get_NotifyValue: TxMPNotifyValues; safecall;
    function Get_Position: Integer; safecall;
    function Get_Shareable: WordBool; safecall;
    function Get_Start: Integer; safecall;
    function Get_StartPos: Integer; safecall;
    function Get_TimeFormat: TxMPTimeFormats; safecall;
    function Get_Tracks: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_Wait: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure Back; safecall;
    procedure Close; safecall;
    procedure Eject; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Next; safecall;
    procedure Open; safecall;
    procedure Pause; safecall;
    procedure PauseOnly; safecall;
    procedure Play; safecall;
    procedure Previous; safecall;
    procedure Resume; safecall;
    procedure Rewind; safecall;
    procedure Save; safecall;
    procedure Set_AutoEnable(Value: WordBool); safecall;
    procedure Set_AutoOpen(Value: WordBool); safecall;
    procedure Set_AutoRewind(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DeviceType(Value: TxMPDeviceTypes); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_EndPos(Value: Integer); safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    procedure Set_Frames(Value: Integer); safecall;
    procedure Set_Notify(Value: WordBool); safecall;
    procedure Set_Position(Value: Integer); safecall;
    procedure Set_Shareable(Value: WordBool); safecall;
    procedure Set_StartPos(Value: Integer); safecall;
    procedure Set_TimeFormat(Value: TxMPTimeFormats); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_Wait(Value: WordBool); safecall;
    procedure StartRecording; safecall;
    procedure Step; safecall;
    procedure Stop; safecall;
  end;

implementation

uses ComObj, About16;

{ TMediaPlayerX }

procedure TMediaPlayerX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MediaPlayerXPage); }
end;

procedure TMediaPlayerX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMediaPlayerXEvents;
end;

procedure TMediaPlayerX.InitializeControl;
begin
  FDelphiControl := Control as TMediaPlayer;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnNotify := NotifyEvent;
  FDelphiControl.OnPostClick := PostClickEvent;
end;

function TMediaPlayerX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TMediaPlayerX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TMediaPlayerX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMediaPlayerX.Get_AutoEnable: WordBool;
begin
  Result := FDelphiControl.AutoEnable;
end;

function TMediaPlayerX.Get_AutoOpen: WordBool;
begin
  Result := FDelphiControl.AutoOpen;
end;

function TMediaPlayerX.Get_AutoRewind: WordBool;
begin
  Result := FDelphiControl.AutoRewind;
end;

function TMediaPlayerX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TMediaPlayerX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMediaPlayerX.Get_DeviceID: Smallint;
begin
  Result := Smallint(FDelphiControl.DeviceID);
end;

function TMediaPlayerX.Get_DeviceType: TxMPDeviceTypes;
begin
  Result := Ord(FDelphiControl.DeviceType);
end;

function TMediaPlayerX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TMediaPlayerX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMediaPlayerX.Get_EndPos: Integer;
begin
  Result := FDelphiControl.EndPos;
end;

function TMediaPlayerX.Get_Error: Integer;
begin
  Result := FDelphiControl.Error;
end;

function TMediaPlayerX.Get_ErrorMessage: WideString;
begin
  Result := WideString(FDelphiControl.ErrorMessage);
end;

function TMediaPlayerX.Get_FileName: WideString;
begin
  Result := WideString(FDelphiControl.FileName);
end;

function TMediaPlayerX.Get_Frames: Integer;
begin
  Result := FDelphiControl.Frames;
end;

function TMediaPlayerX.Get_Length: Integer;
begin
  Result := FDelphiControl.Length;
end;

function TMediaPlayerX.Get_Mode: TxMPModes;
begin
  Result := Ord(FDelphiControl.Mode);
end;

function TMediaPlayerX.Get_Notify: WordBool;
begin
  Result := FDelphiControl.Notify;
end;

function TMediaPlayerX.Get_NotifyValue: TxMPNotifyValues;
begin
  Result := Ord(FDelphiControl.NotifyValue);
end;

function TMediaPlayerX.Get_Position: Integer;
begin
  Result := FDelphiControl.Position;
end;

function TMediaPlayerX.Get_Shareable: WordBool;
begin
  Result := FDelphiControl.Shareable;
end;

function TMediaPlayerX.Get_Start: Integer;
begin
  Result := FDelphiControl.Start;
end;

function TMediaPlayerX.Get_StartPos: Integer;
begin
  Result := FDelphiControl.StartPos;
end;

function TMediaPlayerX.Get_TimeFormat: TxMPTimeFormats;
begin
  Result := Ord(FDelphiControl.TimeFormat);
end;

function TMediaPlayerX.Get_Tracks: Integer;
begin
  Result := FDelphiControl.Tracks;
end;

function TMediaPlayerX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TMediaPlayerX.Get_Wait: WordBool;
begin
  Result := FDelphiControl.Wait;
end;

function TMediaPlayerX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TMediaPlayerX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TMediaPlayerX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TMediaPlayerX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TMediaPlayerX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TMediaPlayerX.AboutBox;
begin
  ShowMediaPlayerXAbout;
end;

procedure TMediaPlayerX.Back;
begin
  FDelphiControl.Back;
end;

procedure TMediaPlayerX.Close;
begin
  FDelphiControl.Close;
end;

procedure TMediaPlayerX.Eject;
begin
  FDelphiControl.Eject;
end;

procedure TMediaPlayerX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TMediaPlayerX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TMediaPlayerX.Next;
begin
  FDelphiControl.Next;
end;

procedure TMediaPlayerX.Open;
begin
  FDelphiControl.Open;
end;

procedure TMediaPlayerX.Pause;
begin
  FDelphiControl.Pause;
end;

procedure TMediaPlayerX.PauseOnly;
begin
  FDelphiControl.PauseOnly;
end;

procedure TMediaPlayerX.Play;
begin
  FDelphiControl.Play;
end;

procedure TMediaPlayerX.Previous;
begin
  FDelphiControl.Previous;
end;

procedure TMediaPlayerX.Resume;
begin
  FDelphiControl.Resume;
end;

procedure TMediaPlayerX.Rewind;
begin
  FDelphiControl.Rewind;
end;

procedure TMediaPlayerX.Save;
begin
  FDelphiControl.Save;
end;

procedure TMediaPlayerX.Set_AutoEnable(Value: WordBool);
begin
  FDelphiControl.AutoEnable := Value;
end;

procedure TMediaPlayerX.Set_AutoOpen(Value: WordBool);
begin
  FDelphiControl.AutoOpen := Value;
end;

procedure TMediaPlayerX.Set_AutoRewind(Value: WordBool);
begin
  FDelphiControl.AutoRewind := Value;
end;

procedure TMediaPlayerX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TMediaPlayerX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMediaPlayerX.Set_DeviceType(Value: TxMPDeviceTypes);
begin
  FDelphiControl.DeviceType := TMPDeviceTypes(Value);
end;

procedure TMediaPlayerX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TMediaPlayerX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMediaPlayerX.Set_EndPos(Value: Integer);
begin
  FDelphiControl.EndPos := Value;
end;

procedure TMediaPlayerX.Set_FileName(const Value: WideString);
begin
  FDelphiControl.FileName := String(Value);
end;

procedure TMediaPlayerX.Set_Frames(Value: Integer);
begin
  FDelphiControl.Frames := Value;
end;

procedure TMediaPlayerX.Set_Notify(Value: WordBool);
begin
  FDelphiControl.Notify := Value;
end;

procedure TMediaPlayerX.Set_Position(Value: Integer);
begin
  FDelphiControl.Position := Value;
end;

procedure TMediaPlayerX.Set_Shareable(Value: WordBool);
begin
  FDelphiControl.Shareable := Value;
end;

procedure TMediaPlayerX.Set_StartPos(Value: Integer);
begin
  FDelphiControl.StartPos := Value;
end;

procedure TMediaPlayerX.Set_TimeFormat(Value: TxMPTimeFormats);
begin
  FDelphiControl.TimeFormat := TMPTimeFormats(Value);
end;

procedure TMediaPlayerX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TMediaPlayerX.Set_Wait(Value: WordBool);
begin
  FDelphiControl.Wait := Value;
end;

procedure TMediaPlayerX.StartRecording;
begin
  FDelphiControl.StartRecording;
end;

procedure TMediaPlayerX.Step;
begin
  FDelphiControl.Step;
end;

procedure TMediaPlayerX.Stop;
begin
  FDelphiControl.Stop;
end;

procedure TMediaPlayerX.ClickEvent(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
var
  TempDoDefault: WordBool;
begin
  TempDoDefault := WordBool(DoDefault);
  if FEvents <> nil then FEvents.OnClick(TxMPBtnType(Button), TempDoDefault);
  DoDefault := Boolean(TempDoDefault);
end;

procedure TMediaPlayerX.NotifyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnNotify;
end;

procedure TMediaPlayerX.PostClickEvent(Sender: TObject;
  Button: TMPBtnType);
begin
  if FEvents <> nil then FEvents.OnPostClick(TxMPBtnType(Button));
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TMediaPlayerX,
    TMediaPlayer,
    Class_MediaPlayerX,
    16,
    '{695CDB52-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
