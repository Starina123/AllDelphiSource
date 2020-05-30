unit TabControlImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TTabControlX = class(TActiveXControl, ITabControlX)
  private
    { Private declarations }
    FDelphiControl: TTabControl;
    FEvents: ITabControlXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ChangingEvent(Sender: TObject; var AllowChange: Boolean);
    procedure GetImageIndexEvent(Sender: TObject; TabIndex: Integer;
      var ImageIndex: Integer);
    procedure ResizeEvent(Sender: TObject);
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
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HotTrack: WordBool; safecall;
    function Get_MultiLine: WordBool; safecall;
    function Get_MultiSelect: WordBool; safecall;
    function Get_OwnerDraw: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_RaggedRight: WordBool; safecall;
    function Get_ScrollOpposite: WordBool; safecall;
    function Get_Style: TxTabStyle; safecall;
    function Get_TabHeight: Smallint; safecall;
    function Get_TabIndex: Integer; safecall;
    function Get_TabPosition: TxTabPosition; safecall;
    function Get_Tabs: IStrings; safecall;
    function Get_TabWidth: Smallint; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HotTrack(Value: WordBool); safecall;
    procedure Set_MultiLine(Value: WordBool); safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    procedure Set_OwnerDraw(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_RaggedRight(Value: WordBool); safecall;
    procedure Set_ScrollOpposite(Value: WordBool); safecall;
    procedure Set_Style(Value: TxTabStyle); safecall;
    procedure Set_TabHeight(Value: Smallint); safecall;
    procedure Set_TabIndex(Value: Integer); safecall;
    procedure Set_TabPosition(Value: TxTabPosition); safecall;
    procedure Set_Tabs(const Value: IStrings); safecall;
    procedure Set_TabWidth(Value: Smallint); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About34;

{ TTabControlX }

procedure TTabControlX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TabControlXPage); }
end;

procedure TTabControlX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITabControlXEvents;
end;

procedure TTabControlX.InitializeControl;
begin
  FDelphiControl := Control as TTabControl;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnChanging := ChangingEvent;
  FDelphiControl.OnGetImageIndex := GetImageIndexEvent;
  FDelphiControl.OnResize := ResizeEvent;
end;

function TTabControlX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TTabControlX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TTabControlX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabControlX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TTabControlX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TTabControlX.Get_DockSite: WordBool;
begin
  Result := FDelphiControl.DockSite;
end;

function TTabControlX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TTabControlX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TTabControlX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TTabControlX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TTabControlX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TTabControlX.Get_HotTrack: WordBool;
begin
  Result := FDelphiControl.HotTrack;
end;

function TTabControlX.Get_MultiLine: WordBool;
begin
  Result := FDelphiControl.MultiLine;
end;

function TTabControlX.Get_MultiSelect: WordBool;
begin
  Result := FDelphiControl.MultiSelect;
end;

function TTabControlX.Get_OwnerDraw: WordBool;
begin
  Result := FDelphiControl.OwnerDraw;
end;

function TTabControlX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TTabControlX.Get_RaggedRight: WordBool;
begin
  Result := FDelphiControl.RaggedRight;
end;

function TTabControlX.Get_ScrollOpposite: WordBool;
begin
  Result := FDelphiControl.ScrollOpposite;
end;

function TTabControlX.Get_Style: TxTabStyle;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TTabControlX.Get_TabHeight: Smallint;
begin
  Result := FDelphiControl.TabHeight;
end;

function TTabControlX.Get_TabIndex: Integer;
begin
  Result := FDelphiControl.TabIndex;
end;

function TTabControlX.Get_TabPosition: TxTabPosition;
begin
  Result := Ord(FDelphiControl.TabPosition);
end;

function TTabControlX.Get_Tabs: IStrings;
begin
  GetOleStrings(FDelphiControl.Tabs, Result);
end;

function TTabControlX.Get_TabWidth: Smallint;
begin
  Result := FDelphiControl.TabWidth;
end;

function TTabControlX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TTabControlX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TTabControlX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TTabControlX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TTabControlX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TTabControlX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TTabControlX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabControlX.AboutBox;
begin
  ShowTabControlXAbout;
end;

procedure TTabControlX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TTabControlX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TTabControlX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TTabControlX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TTabControlX.Set_DockSite(Value: WordBool);
begin
  FDelphiControl.DockSite := Value;
end;

procedure TTabControlX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TTabControlX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TTabControlX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TTabControlX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TTabControlX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabControlX.Set_HotTrack(Value: WordBool);
begin
  FDelphiControl.HotTrack := Value;
end;

procedure TTabControlX.Set_MultiLine(Value: WordBool);
begin
  FDelphiControl.MultiLine := Value;
end;

procedure TTabControlX.Set_MultiSelect(Value: WordBool);
begin
  FDelphiControl.MultiSelect := Value;
end;

procedure TTabControlX.Set_OwnerDraw(Value: WordBool);
begin
  FDelphiControl.OwnerDraw := Value;
end;

procedure TTabControlX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TTabControlX.Set_RaggedRight(Value: WordBool);
begin
  FDelphiControl.RaggedRight := Value;
end;

procedure TTabControlX.Set_ScrollOpposite(Value: WordBool);
begin
  FDelphiControl.ScrollOpposite := Value;
end;

procedure TTabControlX.Set_Style(Value: TxTabStyle);
begin
  FDelphiControl.Style := TTabStyle(Value);
end;

procedure TTabControlX.Set_TabHeight(Value: Smallint);
begin
  FDelphiControl.TabHeight := Value;
end;

procedure TTabControlX.Set_TabIndex(Value: Integer);
begin
  FDelphiControl.TabIndex := Value;
end;

procedure TTabControlX.Set_TabPosition(Value: TxTabPosition);
begin
  FDelphiControl.TabPosition := TTabPosition(Value);
end;

procedure TTabControlX.Set_Tabs(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Tabs, Value);
end;

procedure TTabControlX.Set_TabWidth(Value: Smallint);
begin
  FDelphiControl.TabWidth := Value;
end;

procedure TTabControlX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TTabControlX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TTabControlX.ChangingEvent(Sender: TObject;
  var AllowChange: Boolean);
var
  TempAllowChange: WordBool;
begin
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnChanging(TempAllowChange);
  AllowChange := Boolean(TempAllowChange);
end;

procedure TTabControlX.GetImageIndexEvent(Sender: TObject;
  TabIndex: Integer; var ImageIndex: Integer);
var
  TempImageIndex: Integer;
begin
  TempImageIndex := Integer(ImageIndex);
  if FEvents <> nil then FEvents.OnGetImageIndex(TabIndex, TempImageIndex);
  ImageIndex := Integer(TempImageIndex);
end;

procedure TTabControlX.ResizeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnResize;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TTabControlX,
    TTabControl,
    Class_TabControlX,
    34,
    '{695CDBDC-02E5-11D2-B20D-00C04FA368D4}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
