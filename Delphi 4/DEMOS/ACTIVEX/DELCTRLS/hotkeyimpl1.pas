unit HotKeyImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  THotKeyX = class(TActiveXControl, IHotKeyX)
  private
    { Private declarations }
    FDelphiControl: THotKey;
    FEvents: IHotKeyXEvents;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_HotKey: Smallint; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_HotKey(Value: Smallint); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About13;

{ THotKeyX }

procedure THotKeyX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_HotKeyXPage); }
end;

procedure THotKeyX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IHotKeyXEvents;
end;

procedure THotKeyX.InitializeControl;
begin
  FDelphiControl := Control as THotKey;
end;

function THotKeyX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function THotKeyX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function THotKeyX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function THotKeyX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function THotKeyX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function THotKeyX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function THotKeyX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function THotKeyX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function THotKeyX.Get_HotKey: Smallint;
begin
  Result := Smallint(FDelphiControl.HotKey);
end;

function THotKeyX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function THotKeyX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function THotKeyX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function THotKeyX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function THotKeyX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function THotKeyX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure THotKeyX.AboutBox;
begin
  ShowHotKeyXAbout;
end;

procedure THotKeyX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure THotKeyX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure THotKeyX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure THotKeyX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure THotKeyX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure THotKeyX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure THotKeyX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure THotKeyX.Set_HotKey(Value: Smallint);
begin
  FDelphiControl.HotKey := TShortCut(Value);
end;

procedure THotKeyX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    THotKeyX,
    THotKey,
    Class_HotKeyX,
    13,
    '{695CDB38-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
