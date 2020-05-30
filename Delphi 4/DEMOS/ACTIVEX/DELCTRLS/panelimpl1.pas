unit PanelImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ExtCtrls;

type
  TPanelX = class(TActiveXControl, IPanelX)
  private
    { Private declarations }
    FDelphiControl: TPanel;
    FEvents: IPanelXEvents;
    procedure CanResizeEvent(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure ClickEvent(Sender: TObject);
    procedure ConstrainedResizeEvent(Sender: TObject; var MinWidth, MinHeight,
      MaxWidth, MaxHeight: Integer);
    procedure DblClickEvent(Sender: TObject);
    procedure ResizeEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_Alignment: TxAlignment; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BevelInner: TxBevelCut; safecall;
    function Get_BevelOuter: TxBevelCut; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_FullRepaint: WordBool; safecall;
    function Get_Locked: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_UseDockManager: WordBool; safecall;
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
    procedure Set_Alignment(Value: TxAlignment); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BevelInner(Value: TxBevelCut); safecall;
    procedure Set_BevelOuter(Value: TxBevelCut); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_FullRepaint(Value: WordBool); safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About22;

{ TPanelX }

procedure TPanelX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_PanelXPage); }
end;

procedure TPanelX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPanelXEvents;
end;

procedure TPanelX.InitializeControl;
begin
  FDelphiControl := Control as TPanel;
  FDelphiControl.OnCanResize := CanResizeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnConstrainedResize := ConstrainedResizeEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnResize := ResizeEvent;
end;

function TPanelX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TPanelX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TPanelX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TPanelX.Get_Alignment: TxAlignment;
begin
  Result := Ord(FDelphiControl.Alignment);
end;

function TPanelX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TPanelX.Get_BevelInner: TxBevelCut;
begin
  Result := Ord(FDelphiControl.BevelInner);
end;

function TPanelX.Get_BevelOuter: TxBevelCut;
begin
  Result := Ord(FDelphiControl.BevelOuter);
end;

function TPanelX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TPanelX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TPanelX.Get_Caption: WideString;
begin
  Result := WideString(FDelphiControl.Caption);
end;

function TPanelX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TPanelX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TPanelX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TPanelX.Get_DockSite: WordBool;
begin
  Result := FDelphiControl.DockSite;
end;

function TPanelX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TPanelX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TPanelX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TPanelX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TPanelX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TPanelX.Get_FullRepaint: WordBool;
begin
  Result := FDelphiControl.FullRepaint;
end;

function TPanelX.Get_Locked: WordBool;
begin
  Result := FDelphiControl.Locked;
end;

function TPanelX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TPanelX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TPanelX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TPanelX.Get_UseDockManager: WordBool;
begin
  Result := FDelphiControl.UseDockManager;
end;

function TPanelX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TPanelX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TPanelX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TPanelX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TPanelX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TPanelX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TPanelX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TPanelX.AboutBox;
begin
  ShowPanelXAbout;
end;

procedure TPanelX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TPanelX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TPanelX.Set_Alignment(Value: TxAlignment);
begin
  FDelphiControl.Alignment := TAlignment(Value);
end;

procedure TPanelX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TPanelX.Set_BevelInner(Value: TxBevelCut);
begin
  FDelphiControl.BevelInner := TBevelCut(Value);
end;

procedure TPanelX.Set_BevelOuter(Value: TxBevelCut);
begin
  FDelphiControl.BevelOuter := TBevelCut(Value);
end;

procedure TPanelX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TPanelX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TPanelX.Set_Caption(const Value: WideString);
begin
  FDelphiControl.Caption := TCaption(Value);
end;

procedure TPanelX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TPanelX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TPanelX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TPanelX.Set_DockSite(Value: WordBool);
begin
  FDelphiControl.DockSite := Value;
end;

procedure TPanelX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TPanelX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TPanelX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TPanelX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TPanelX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TPanelX.Set_FullRepaint(Value: WordBool);
begin
  FDelphiControl.FullRepaint := Value;
end;

procedure TPanelX.Set_Locked(Value: WordBool);
begin
  FDelphiControl.Locked := Value;
end;

procedure TPanelX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TPanelX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TPanelX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TPanelX.Set_UseDockManager(Value: WordBool);
begin
  FDelphiControl.UseDockManager := Value;
end;

procedure TPanelX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TPanelX.CanResizeEvent(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
var
  TempNewWidth: Integer;
  TempNewHeight: Integer;
  TempResize: WordBool;
begin
  TempNewWidth := Integer(NewWidth);
  TempNewHeight := Integer(NewHeight);
  TempResize := WordBool(Resize);
  if FEvents <> nil then FEvents.OnCanResize(TempNewWidth, TempNewHeight, TempResize);
  NewWidth := Integer(TempNewWidth);
  NewHeight := Integer(TempNewHeight);
  Resize := Boolean(TempResize);
end;

procedure TPanelX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPanelX.ConstrainedResizeEvent(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
var
  TempMinWidth: Integer;
  TempMinHeight: Integer;
  TempMaxWidth: Integer;
  TempMaxHeight: Integer;
begin
  TempMinWidth := Integer(MinWidth);
  TempMinHeight := Integer(MinHeight);
  TempMaxWidth := Integer(MaxWidth);
  TempMaxHeight := Integer(MaxHeight);
  if FEvents <> nil then FEvents.OnConstrainedResize(TempMinWidth, TempMinHeight, TempMaxWidth, TempMaxHeight);
  MinWidth := Integer(TempMinWidth);
  MinHeight := Integer(TempMinHeight);
  MaxWidth := Integer(TempMaxWidth);
  MaxHeight := Integer(TempMaxHeight);
end;

procedure TPanelX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPanelX.ResizeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnResize;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TPanelX,
    TPanel,
    Class_PanelX,
    22,
    '{695CDB82-02E5-11D2-B20D-00C04FA368D4}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
