unit CalendarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Calendar, Grids;

type
  TCalendarX = class(TActiveXControl, ICalendarX)
  private
    { Private declarations }
    FDelphiControl: TCalendar;
    FEvents: ICalendarXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
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
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_CalendarDate: Double; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_Day: Integer; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_GridLineWidth: Integer; safecall;
    function Get_Month: Integer; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_StartOfWeek: Smallint; safecall;
    function Get_UseCurrentDate: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_Year: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure NextMonth; safecall;
    procedure NextYear; safecall;
    procedure PrevMonth; safecall;
    procedure PrevYear; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_CalendarDate(Value: Double); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_Day(Value: Integer); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_GridLineWidth(Value: Integer); safecall;
    procedure Set_Month(Value: Integer); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    procedure Set_StartOfWeek(Value: Smallint); safecall;
    procedure Set_UseCurrentDate(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_Year(Value: Integer); safecall;
    procedure UpdateCalendar; safecall;
  end;

implementation

uses ComObj, About3;

{ TCalendarX }

procedure TCalendarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CalendarXPage); }
end;

procedure TCalendarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICalendarXEvents;
end;

procedure TCalendarX.InitializeControl;
begin
  FDelphiControl := Control as TCalendar;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TCalendarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TCalendarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TCalendarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TCalendarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TCalendarX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TCalendarX.Get_CalendarDate: Double;
begin
  Result := Double(FDelphiControl.CalendarDate);
end;

function TCalendarX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TCalendarX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TCalendarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TCalendarX.Get_Day: Integer;
begin
  Result := FDelphiControl.Day;
end;

function TCalendarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TCalendarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TCalendarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TCalendarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TCalendarX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TCalendarX.Get_GridLineWidth: Integer;
begin
  Result := FDelphiControl.GridLineWidth;
end;

function TCalendarX.Get_Month: Integer;
begin
  Result := FDelphiControl.Month;
end;

function TCalendarX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TCalendarX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TCalendarX.Get_ReadOnly: WordBool;
begin
  Result := FDelphiControl.ReadOnly;
end;

function TCalendarX.Get_StartOfWeek: Smallint;
begin
  Result := Smallint(FDelphiControl.StartOfWeek);
end;

function TCalendarX.Get_UseCurrentDate: WordBool;
begin
  Result := FDelphiControl.UseCurrentDate;
end;

function TCalendarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TCalendarX.Get_Year: Integer;
begin
  Result := FDelphiControl.Year;
end;

function TCalendarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TCalendarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TCalendarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TCalendarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TCalendarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TCalendarX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TCalendarX.AboutBox;
begin
  ShowCalendarXAbout;
end;

procedure TCalendarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TCalendarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TCalendarX.NextMonth;
begin
  FDelphiControl.NextMonth;
end;

procedure TCalendarX.NextYear;
begin
  FDelphiControl.NextYear;
end;

procedure TCalendarX.PrevMonth;
begin
  FDelphiControl.PrevMonth;
end;

procedure TCalendarX.PrevYear;
begin
  FDelphiControl.PrevYear;
end;

procedure TCalendarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TCalendarX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TCalendarX.Set_CalendarDate(Value: Double);
begin
  FDelphiControl.CalendarDate := TDateTime(Value);
end;

procedure TCalendarX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TCalendarX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TCalendarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TCalendarX.Set_Day(Value: Integer);
begin
  FDelphiControl.Day := Value;
end;

procedure TCalendarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TCalendarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TCalendarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TCalendarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TCalendarX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TCalendarX.Set_GridLineWidth(Value: Integer);
begin
  FDelphiControl.GridLineWidth := Value;
end;

procedure TCalendarX.Set_Month(Value: Integer);
begin
  FDelphiControl.Month := Value;
end;

procedure TCalendarX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TCalendarX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TCalendarX.Set_ReadOnly(Value: WordBool);
begin
  FDelphiControl.ReadOnly := Value;
end;

procedure TCalendarX.Set_StartOfWeek(Value: Smallint);
begin
  FDelphiControl.StartOfWeek := TDayOfWeek(Value);
end;

procedure TCalendarX.Set_UseCurrentDate(Value: WordBool);
begin
  FDelphiControl.UseCurrentDate := Value;
end;

procedure TCalendarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TCalendarX.Set_Year(Value: Integer);
begin
  FDelphiControl.Year := Value;
end;

procedure TCalendarX.UpdateCalendar;
begin
  FDelphiControl.UpdateCalendar;
end;

procedure TCalendarX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TCalendarX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCalendarX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCalendarX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TCalendarX,
    TCalendar,
    Class_CalendarX,
    3,
    '{695CDAE4-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
