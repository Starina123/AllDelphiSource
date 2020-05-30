unit ScrollBoxImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB;

type
  TScrollBoxX = class(TActiveXControl, IScrollBoxX)
  private
    { Private declarations }
    FDelphiControl: TScrollBox;
    FEvents: IScrollBoxXEvents;
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
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure DisableAutoRange; safecall;
    procedure EnableAutoRange; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About28;

{ TScrollBoxX }

procedure TScrollBoxX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ScrollBoxXPage); }
end;

procedure TScrollBoxX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IScrollBoxXEvents;
end;

procedure TScrollBoxX.InitializeControl;
begin
  FDelphiControl := Control as TScrollBox;
  FDelphiControl.OnCanResize := CanResizeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnConstrainedResize := ConstrainedResizeEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnResize := ResizeEvent;
end;

function TScrollBoxX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TScrollBoxX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TScrollBoxX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TScrollBoxX.Get_AutoScroll: WordBool;
begin
  Result := FDelphiControl.AutoScroll;
end;

function TScrollBoxX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TScrollBoxX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TScrollBoxX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TScrollBoxX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TScrollBoxX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TScrollBoxX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TScrollBoxX.Get_DockSite: WordBool;
begin
  Result := FDelphiControl.DockSite;
end;

function TScrollBoxX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TScrollBoxX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TScrollBoxX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TScrollBoxX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TScrollBoxX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TScrollBoxX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TScrollBoxX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TScrollBoxX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TScrollBoxX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TScrollBoxX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TScrollBoxX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TScrollBoxX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TScrollBoxX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TScrollBoxX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TScrollBoxX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TScrollBoxX.AboutBox;
begin
  ShowScrollBoxXAbout;
end;

procedure TScrollBoxX.DisableAutoRange;
begin
  FDelphiControl.DisableAutoRange;
end;

procedure TScrollBoxX.EnableAutoRange;
begin
  FDelphiControl.EnableAutoRange;
end;

procedure TScrollBoxX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TScrollBoxX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TScrollBoxX.Set_AutoScroll(Value: WordBool);
begin
  FDelphiControl.AutoScroll := Value;
end;

procedure TScrollBoxX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TScrollBoxX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TScrollBoxX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TScrollBoxX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TScrollBoxX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TScrollBoxX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TScrollBoxX.Set_DockSite(Value: WordBool);
begin
  FDelphiControl.DockSite := Value;
end;

procedure TScrollBoxX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TScrollBoxX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TScrollBoxX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TScrollBoxX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TScrollBoxX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TScrollBoxX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TScrollBoxX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TScrollBoxX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TScrollBoxX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TScrollBoxX.CanResizeEvent(Sender: TObject; var NewWidth,
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

procedure TScrollBoxX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TScrollBoxX.ConstrainedResizeEvent(Sender: TObject; var MinWidth,
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

procedure TScrollBoxX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TScrollBoxX.ResizeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnResize;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TScrollBoxX,
    TScrollBox,
    Class_ScrollBoxX,
    28,
    '{695CDBAF-02E5-11D2-B20D-00C04FA368D4}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
