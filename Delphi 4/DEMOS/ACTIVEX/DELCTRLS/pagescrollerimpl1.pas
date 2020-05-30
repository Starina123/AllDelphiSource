unit PageScrollerImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TPageScrollerX = class(TActiveXControl, IPageScrollerX)
  private
    { Private declarations }
    FDelphiControl: TPageScroller;
    FEvents: IPageScrollerXEvents;
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure ResizeEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_ButtonSize: Integer; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_DragScroll: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_Margin: Integer; safecall;
    function Get_Orientation: TxPageScrollerOrientation; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Position: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function GetButtonState(
      Button: TxPageScrollerButton): TxPageScrollerButtonState; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_ButtonSize(Value: Integer); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_DragScroll(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Margin(Value: Integer); safecall;
    procedure Set_Orientation(Value: TxPageScrollerOrientation); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Position(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About21;

{ TPageScrollerX }

procedure TPageScrollerX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_PageScrollerXPage); }
end;

procedure TPageScrollerX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPageScrollerXEvents;
end;

procedure TPageScrollerX.InitializeControl;
begin
  FDelphiControl := Control as TPageScroller;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnResize := ResizeEvent;
end;

function TPageScrollerX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TPageScrollerX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TPageScrollerX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TPageScrollerX.Get_AutoScroll: WordBool;
begin
  Result := FDelphiControl.AutoScroll;
end;

function TPageScrollerX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TPageScrollerX.Get_ButtonSize: Integer;
begin
  Result := FDelphiControl.ButtonSize;
end;

function TPageScrollerX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TPageScrollerX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TPageScrollerX.Get_DockSite: WordBool;
begin
  Result := FDelphiControl.DockSite;
end;

function TPageScrollerX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TPageScrollerX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TPageScrollerX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TPageScrollerX.Get_DragScroll: WordBool;
begin
  Result := FDelphiControl.DragScroll;
end;

function TPageScrollerX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TPageScrollerX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TPageScrollerX.Get_Margin: Integer;
begin
  Result := FDelphiControl.Margin;
end;

function TPageScrollerX.Get_Orientation: TxPageScrollerOrientation;
begin
  Result := Ord(FDelphiControl.Orientation);
end;

function TPageScrollerX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TPageScrollerX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TPageScrollerX.Get_Position: Integer;
begin
  Result := FDelphiControl.Position;
end;

function TPageScrollerX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TPageScrollerX.GetButtonState(
  Button: TxPageScrollerButton): TxPageScrollerButtonState;
begin
 Result := TxPageScrollerButtonState(FDelphiControl.GetButtonState(TPageScrollerButton(Button)));
end;

function TPageScrollerX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TPageScrollerX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TPageScrollerX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TPageScrollerX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TPageScrollerX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TPageScrollerX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TPageScrollerX.AboutBox;
begin
  ShowPageScrollerXAbout;
end;

procedure TPageScrollerX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TPageScrollerX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TPageScrollerX.Set_AutoScroll(Value: WordBool);
begin
  FDelphiControl.AutoScroll := Value;
end;

procedure TPageScrollerX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TPageScrollerX.Set_ButtonSize(Value: Integer);
begin
  FDelphiControl.ButtonSize := Value;
end;

procedure TPageScrollerX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TPageScrollerX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TPageScrollerX.Set_DockSite(Value: WordBool);
begin
  FDelphiControl.DockSite := Value;
end;

procedure TPageScrollerX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TPageScrollerX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TPageScrollerX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TPageScrollerX.Set_DragScroll(Value: WordBool);
begin
  FDelphiControl.DragScroll := Value;
end;

procedure TPageScrollerX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TPageScrollerX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TPageScrollerX.Set_Margin(Value: Integer);
begin
  FDelphiControl.Margin := Value;
end;

procedure TPageScrollerX.Set_Orientation(Value: TxPageScrollerOrientation);
begin
  FDelphiControl.Orientation := TPageScrollerOrientation(Value);
end;

procedure TPageScrollerX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TPageScrollerX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TPageScrollerX.Set_Position(Value: Integer);
begin
  FDelphiControl.Position := Value;
end;

procedure TPageScrollerX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TPageScrollerX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPageScrollerX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPageScrollerX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TPageScrollerX.ResizeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnResize;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TPageScrollerX,
    TPageScroller,
    Class_PageScrollerX,
    21,
    '{695CDB7B-02E5-11D2-B20D-00C04FA368D4}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
