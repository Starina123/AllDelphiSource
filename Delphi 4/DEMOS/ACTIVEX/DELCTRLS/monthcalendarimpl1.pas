unit MonthCalendarImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TMonthCalendarX = class(TActiveXControl, IMonthCalendarX)
  private
    { Private declarations }
    FDelphiControl: TMonthCalendar;
    FEvents: IMonthCalendarXEvents;
    procedure ClickEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure GetMonthInfoEvent(Sender: TObject; Month: Cardinal;
      var MonthBoldInfo: Cardinal);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
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
    function Get_Date: Double; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_EndDate: Double; safecall;
    function Get_FirstDayOfWeek: TxCalDayOfWeek; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_MaxDate: Double; safecall;
    function Get_MaxSelectRange: Integer; safecall;
    function Get_MinDate: Double; safecall;
    function Get_MultiSelect: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_ShowToday: WordBool; safecall;
    function Get_ShowTodayCircle: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_WeekNumbers: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_Date(Value: Double); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_EndDate(Value: Double); safecall;
    procedure Set_FirstDayOfWeek(Value: TxCalDayOfWeek); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_MaxDate(Value: Double); safecall;
    procedure Set_MaxSelectRange(Value: Integer); safecall;
    procedure Set_MinDate(Value: Double); safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_ShowToday(Value: WordBool); safecall;
    procedure Set_ShowTodayCircle(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_WeekNumbers(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About18;

{ TMonthCalendarX }

procedure TMonthCalendarX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MonthCalendarXPage); }
end;

procedure TMonthCalendarX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMonthCalendarXEvents;
end;

procedure TMonthCalendarX.InitializeControl;
begin
  FDelphiControl := Control as TMonthCalendar;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnGetMonthInfo := GetMonthInfoEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TMonthCalendarX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TMonthCalendarX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TMonthCalendarX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMonthCalendarX.Get_AutoSize: WordBool;
begin
  Result := FDelphiControl.AutoSize;
end;

function TMonthCalendarX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TMonthCalendarX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMonthCalendarX.Get_Date: Double;
begin
  Result := Double(FDelphiControl.Date);
end;

function TMonthCalendarX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TMonthCalendarX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TMonthCalendarX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TMonthCalendarX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMonthCalendarX.Get_EndDate: Double;
begin
  Result := Double(FDelphiControl.EndDate);
end;

function TMonthCalendarX.Get_FirstDayOfWeek: TxCalDayOfWeek;
begin
  Result := Ord(FDelphiControl.FirstDayOfWeek);
end;

function TMonthCalendarX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TMonthCalendarX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TMonthCalendarX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TMonthCalendarX.Get_MaxDate: Double;
begin
  Result := Double(FDelphiControl.MaxDate);
end;

function TMonthCalendarX.Get_MaxSelectRange: Integer;
begin
  Result := FDelphiControl.MaxSelectRange;
end;

function TMonthCalendarX.Get_MinDate: Double;
begin
  Result := Double(FDelphiControl.MinDate);
end;

function TMonthCalendarX.Get_MultiSelect: WordBool;
begin
  Result := FDelphiControl.MultiSelect;
end;

function TMonthCalendarX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TMonthCalendarX.Get_ShowToday: WordBool;
begin
  Result := FDelphiControl.ShowToday;
end;

function TMonthCalendarX.Get_ShowTodayCircle: WordBool;
begin
  Result := FDelphiControl.ShowTodayCircle;
end;

function TMonthCalendarX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TMonthCalendarX.Get_WeekNumbers: WordBool;
begin
  Result := FDelphiControl.WeekNumbers;
end;

function TMonthCalendarX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TMonthCalendarX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TMonthCalendarX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TMonthCalendarX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TMonthCalendarX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TMonthCalendarX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMonthCalendarX.AboutBox;
begin
  ShowMonthCalendarXAbout;
end;

procedure TMonthCalendarX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TMonthCalendarX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TMonthCalendarX.Set_AutoSize(Value: WordBool);
begin
  FDelphiControl.AutoSize := Value;
end;

procedure TMonthCalendarX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TMonthCalendarX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMonthCalendarX.Set_Date(Value: Double);
begin
  FDelphiControl.Date := TDate(Value);
end;

procedure TMonthCalendarX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TMonthCalendarX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TMonthCalendarX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TMonthCalendarX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMonthCalendarX.Set_EndDate(Value: Double);
begin
  FDelphiControl.EndDate := TDate(Value);
end;

procedure TMonthCalendarX.Set_FirstDayOfWeek(Value: TxCalDayOfWeek);
begin
  FDelphiControl.FirstDayOfWeek := TCalDayOfWeek(Value);
end;

procedure TMonthCalendarX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TMonthCalendarX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TMonthCalendarX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TMonthCalendarX.Set_MaxDate(Value: Double);
begin
  FDelphiControl.MaxDate := TDate(Value);
end;

procedure TMonthCalendarX.Set_MaxSelectRange(Value: Integer);
begin
  FDelphiControl.MaxSelectRange := Value;
end;

procedure TMonthCalendarX.Set_MinDate(Value: Double);
begin
  FDelphiControl.MinDate := TDate(Value);
end;

procedure TMonthCalendarX.Set_MultiSelect(Value: WordBool);
begin
  FDelphiControl.MultiSelect := Value;
end;

procedure TMonthCalendarX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TMonthCalendarX.Set_ShowToday(Value: WordBool);
begin
  FDelphiControl.ShowToday := Value;
end;

procedure TMonthCalendarX.Set_ShowTodayCircle(Value: WordBool);
begin
  FDelphiControl.ShowTodayCircle := Value;
end;

procedure TMonthCalendarX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TMonthCalendarX.Set_WeekNumbers(Value: WordBool);
begin
  FDelphiControl.WeekNumbers := Value;
end;

procedure TMonthCalendarX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMonthCalendarX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMonthCalendarX.GetMonthInfoEvent(Sender: TObject;
  Month: Cardinal; var MonthBoldInfo: Cardinal);
var
  TempMonthBoldInfo: Integer;
begin
  TempMonthBoldInfo := Integer(MonthBoldInfo);
  if FEvents <> nil then FEvents.OnGetMonthInfo(Integer(Month), TempMonthBoldInfo);
  MonthBoldInfo := Cardinal(TempMonthBoldInfo);
end;

procedure TMonthCalendarX.KeyPressEvent(Sender: TObject; var Key: Char);
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
    TMonthCalendarX,
    TMonthCalendar,
    Class_MonthCalendarX,
    18,
    '{695CDB61-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
