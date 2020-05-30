unit ControlBarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ExtCtrls;

type
  TControlBarX = class(TActiveXControl, IControlBarX)
  private
    { Private declarations }
    FDelphiControl: TControlBar;
    FEvents: IControlBarXEvents;
    procedure CanResizeEvent(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure ClickEvent(Sender: TObject);
    procedure ConstrainedResizeEvent(Sender: TObject; var MinWidth, MinHeight,
      MaxWidth, MaxHeight: Integer);
    procedure DblClickEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
    procedure ResizeEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_AutoDrag: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BevelInner: TxBevelCut; safecall;
    function Get_BevelKind: TxBevelKind; safecall;
    function Get_BevelOuter: TxBevelCut; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Picture: IPictureDisp; safecall;
    function Get_RowSnap: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AutoDrag(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BevelInner(Value: TxBevelCut); safecall;
    procedure Set_BevelKind(Value: TxBevelKind); safecall;
    procedure Set_BevelOuter(Value: TxBevelCut); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Picture(const Value: IPictureDisp); safecall;
    procedure Set_RowSnap(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure StickControls; safecall;
  end;

implementation

uses ComObj, About8;

{ TControlBarX }

procedure TControlBarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ControlBarXPage); }
end;

procedure TControlBarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IControlBarXEvents;
end;

procedure TControlBarX.InitializeControl;
begin
  FDelphiControl := Control as TControlBar;
  FDelphiControl.OnCanResize := CanResizeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnConstrainedResize := ConstrainedResizeEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnPaint := PaintEvent;
  FDelphiControl.OnResize := ResizeEvent;
end;

function TControlBarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TControlBarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TControlBarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TControlBarX.Get_AutoDrag: WordBool;
begin
  Result := FDelphiControl.AutoDrag;
end;

function TControlBarX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TControlBarX.Get_BevelInner: TxBevelCut;
begin
  Result := Ord(FDelphiControl.BevelInner);
end;

function TControlBarX.Get_BevelKind: TxBevelKind;
begin
  Result := Ord(FDelphiControl.BevelKind);
end;

function TControlBarX.Get_BevelOuter: TxBevelCut;
begin
  Result := Ord(FDelphiControl.BevelOuter);
end;

function TControlBarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TControlBarX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TControlBarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TControlBarX.Get_DockSite: WordBool;
begin
  Result := FDelphiControl.DockSite;
end;

function TControlBarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TControlBarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TControlBarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TControlBarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TControlBarX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TControlBarX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TControlBarX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TControlBarX.Get_Picture: IPictureDisp;
begin
  GetOlePicture(FDelphiControl.Picture, Result);
end;

function TControlBarX.Get_RowSnap: WordBool;
begin
  Result := FDelphiControl.RowSnap;
end;

function TControlBarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TControlBarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TControlBarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TControlBarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TControlBarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TControlBarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TControlBarX.AboutBox;
begin
  ShowControlBarXAbout;
end;

procedure TControlBarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TControlBarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TControlBarX.Set_AutoDrag(Value: WordBool);
begin
  FDelphiControl.AutoDrag := Value;
end;

procedure TControlBarX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TControlBarX.Set_BevelInner(Value: TxBevelCut);
begin
  FDelphiControl.BevelInner := TBevelCut(Value);
end;

procedure TControlBarX.Set_BevelKind(Value: TxBevelKind);
begin
  FDelphiControl.BevelKind := TBevelKind(Value);
end;

procedure TControlBarX.Set_BevelOuter(Value: TxBevelCut);
begin
  FDelphiControl.BevelOuter := TBevelCut(Value);
end;

procedure TControlBarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TControlBarX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TControlBarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TControlBarX.Set_DockSite(Value: WordBool);
begin
  FDelphiControl.DockSite := Value;
end;

procedure TControlBarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TControlBarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TControlBarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TControlBarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TControlBarX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TControlBarX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TControlBarX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TControlBarX.Set_Picture(const Value: IPictureDisp);
begin
  SetOlePicture(FDelphiControl.Picture, Value);
end;

procedure TControlBarX.Set_RowSnap(Value: WordBool);
begin
  FDelphiControl.RowSnap := Value;
end;

procedure TControlBarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TControlBarX.StickControls;
begin
  FDelphiControl.StickControls;
end;

procedure TControlBarX.CanResizeEvent(Sender: TObject; var NewWidth,
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

procedure TControlBarX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TControlBarX.ConstrainedResizeEvent(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
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

procedure TControlBarX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TControlBarX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TControlBarX.ResizeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnResize;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TControlBarX,
    TControlBar,
    Class_ControlBarX,
    8,
    '{695CDB10-02E5-11D2-B20D-00C04FA368D4}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
