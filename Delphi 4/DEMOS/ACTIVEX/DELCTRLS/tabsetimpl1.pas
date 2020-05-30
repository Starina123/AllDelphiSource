unit TabSetImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Tabs;

type
  TTabSetX = class(TActiveXControl, ITabSetX)
  private
    { Private declarations }
    FDelphiControl: TTabSet;
    FEvents: ITabSetXEvents;
    procedure ChangeEvent(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ClickEvent(Sender: TObject);
    procedure MeasureTabEvent(Sender: TObject; Index: Integer;
      var TabWidth: Integer);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_BackgroundColor: OLE_COLOR; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DitherBackground: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_EndMargin: Integer; safecall;
    function Get_FirstIndex: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_SelectedColor: OLE_COLOR; safecall;
    function Get_StartMargin: Integer; safecall;
    function Get_Style: TxTabStyle; safecall;
    function Get_TabHeight: Integer; safecall;
    function Get_TabIndex: Integer; safecall;
    function Get_Tabs: IStrings; safecall;
    function Get_UnselectedColor: OLE_COLOR; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleTabs: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure SelectNext(Direction: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_BackgroundColor(Value: OLE_COLOR); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DitherBackground(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_EndMargin(Value: Integer); safecall;
    procedure Set_FirstIndex(Value: Integer); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_SelectedColor(Value: OLE_COLOR); safecall;
    procedure Set_StartMargin(Value: Integer); safecall;
    procedure Set_Style(Value: TxTabStyle); safecall;
    procedure Set_TabHeight(Value: Integer); safecall;
    procedure Set_TabIndex(Value: Integer); safecall;
    procedure Set_Tabs(const Value: IStrings); safecall;
    procedure Set_UnselectedColor(Value: OLE_COLOR); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About35;

{ TTabSetX }

procedure TTabSetX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TabSetXPage); }
end;

procedure TTabSetX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITabSetXEvents;
end;

procedure TTabSetX.InitializeControl;
begin
  FDelphiControl := Control as TTabSet;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnMeasureTab := MeasureTabEvent;
end;

function TTabSetX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TTabSetX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TTabSetX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabSetX.Get_AutoScroll: WordBool;
begin
  Result := FDelphiControl.AutoScroll;
end;

function TTabSetX.Get_BackgroundColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.BackgroundColor);
end;

function TTabSetX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TTabSetX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TTabSetX.Get_DitherBackground: WordBool;
begin
  Result := FDelphiControl.DitherBackground;
end;

function TTabSetX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TTabSetX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TTabSetX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TTabSetX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TTabSetX.Get_EndMargin: Integer;
begin
  Result := FDelphiControl.EndMargin;
end;

function TTabSetX.Get_FirstIndex: Integer;
begin
  Result := FDelphiControl.FirstIndex;
end;

function TTabSetX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TTabSetX.Get_SelectedColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.SelectedColor);
end;

function TTabSetX.Get_StartMargin: Integer;
begin
  Result := FDelphiControl.StartMargin;
end;

function TTabSetX.Get_Style: TxTabStyle;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TTabSetX.Get_TabHeight: Integer;
begin
  Result := FDelphiControl.TabHeight;
end;

function TTabSetX.Get_TabIndex: Integer;
begin
  Result := FDelphiControl.TabIndex;
end;

function TTabSetX.Get_Tabs: IStrings;
begin
  GetOleStrings(FDelphiControl.Tabs, Result);
end;

function TTabSetX.Get_UnselectedColor: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.UnselectedColor);
end;

function TTabSetX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TTabSetX.Get_VisibleTabs: Integer;
begin
  Result := FDelphiControl.VisibleTabs;
end;

function TTabSetX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TTabSetX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TTabSetX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TTabSetX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TTabSetX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TTabSetX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabSetX.AboutBox;
begin
  ShowTabSetXAbout;
end;

procedure TTabSetX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TTabSetX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TTabSetX.SelectNext(Direction: WordBool);
begin
  FDelphiControl.SelectNext(Direction);
end;

procedure TTabSetX.Set_AutoScroll(Value: WordBool);
begin
  FDelphiControl.AutoScroll := Value;
end;

procedure TTabSetX.Set_BackgroundColor(Value: OLE_COLOR);
begin
  FDelphiControl.BackgroundColor := TColor(Value);
end;

procedure TTabSetX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TTabSetX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TTabSetX.Set_DitherBackground(Value: WordBool);
begin
  FDelphiControl.DitherBackground := Value;
end;

procedure TTabSetX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TTabSetX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TTabSetX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TTabSetX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TTabSetX.Set_EndMargin(Value: Integer);
begin
  FDelphiControl.EndMargin := Value;
end;

procedure TTabSetX.Set_FirstIndex(Value: Integer);
begin
  FDelphiControl.FirstIndex := Value;
end;

procedure TTabSetX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabSetX.Set_SelectedColor(Value: OLE_COLOR);
begin
  FDelphiControl.SelectedColor := TColor(Value);
end;

procedure TTabSetX.Set_StartMargin(Value: Integer);
begin
  FDelphiControl.StartMargin := Value;
end;

procedure TTabSetX.Set_Style(Value: TxTabStyle);
begin
  FDelphiControl.Style := TTabStyle(Value);
end;

procedure TTabSetX.Set_TabHeight(Value: Integer);
begin
  FDelphiControl.TabHeight := Value;
end;

procedure TTabSetX.Set_TabIndex(Value: Integer);
begin
  FDelphiControl.TabIndex := Value;
end;

procedure TTabSetX.Set_Tabs(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Tabs, Value);
end;

procedure TTabSetX.Set_UnselectedColor(Value: OLE_COLOR);
begin
  FDelphiControl.UnselectedColor := TColor(Value);
end;

procedure TTabSetX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TTabSetX.ChangeEvent(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
  TempAllowChange: WordBool;
begin
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnChange(NewTab, TempAllowChange);
  AllowChange := Boolean(TempAllowChange);
end;

procedure TTabSetX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTabSetX.MeasureTabEvent(Sender: TObject; Index: Integer;
  var TabWidth: Integer);
var
  TempTabWidth: Integer;
begin
  TempTabWidth := Integer(TabWidth);
  if FEvents <> nil then FEvents.OnMeasureTab(Index, TempTabWidth);
  TabWidth := Integer(TempTabWidth);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TTabSetX,
    TTabSet,
    Class_TabSetX,
    35,
    '{695CDBE3-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
