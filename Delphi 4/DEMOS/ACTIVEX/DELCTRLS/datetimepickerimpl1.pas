unit DateTimePickerImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, ComCtrls;

type
  TDateTimePickerX = class(TActiveXControl, IDateTimePickerX)
  private
    { Private declarations }
    FDelphiControl: TDateTimePicker;
    FEvents: IDateTimePickerXEvents;
    procedure ChangeEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CloseUpEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DropDownEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure UserInputEvent(Sender: TObject; const UserString: String;
      var DateAndTime: TDateTime; var AllowChange: Boolean);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_CalAlignment: TxDTCalAlignment; safecall;
    function Get_Checked: WordBool; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_Date: Double; safecall;
    function Get_DateFormat: TxDTDateFormat; safecall;
    function Get_DateMode: TxDTDateMode; safecall;
    function Get_DateTime: Double; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_DroppedDown: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ImeMode: TxImeMode; safecall;
    function Get_ImeName: WideString; safecall;
    function Get_Kind: TxDateTimeKind; safecall;
    function Get_MaxDate: Double; safecall;
    function Get_MinDate: Double; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_ParseInput: WordBool; safecall;
    function Get_ShowCheckbox: WordBool; safecall;
    function Get_Time: Double; safecall;
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
    procedure Set_CalAlignment(Value: TxDTCalAlignment); safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_Date(Value: Double); safecall;
    procedure Set_DateFormat(Value: TxDTDateFormat); safecall;
    procedure Set_DateMode(Value: TxDTDateMode); safecall;
    procedure Set_DateTime(Value: Double); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    procedure Set_Kind(Value: TxDateTimeKind); safecall;
    procedure Set_MaxDate(Value: Double); safecall;
    procedure Set_MinDate(Value: Double); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_ParseInput(Value: WordBool); safecall;
    procedure Set_ShowCheckbox(Value: WordBool); safecall;
    procedure Set_Time(Value: Double); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About9;

{ TDateTimePickerX }

procedure TDateTimePickerX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_DateTimePickerXPage); }
end;

procedure TDateTimePickerX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IDateTimePickerXEvents;
end;

procedure TDateTimePickerX.InitializeControl;
begin
  FDelphiControl := Control as TDateTimePicker;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnCloseUp := CloseUpEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnDropDown := DropDownEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
  FDelphiControl.OnUserInput := UserInputEvent;
end;

function TDateTimePickerX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TDateTimePickerX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TDateTimePickerX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TDateTimePickerX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TDateTimePickerX.Get_CalAlignment: TxDTCalAlignment;
begin
  Result := Ord(FDelphiControl.CalAlignment);
end;

function TDateTimePickerX.Get_Checked: WordBool;
begin
  Result := FDelphiControl.Checked;
end;

function TDateTimePickerX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TDateTimePickerX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TDateTimePickerX.Get_Date: Double;
begin
  Result := Double(FDelphiControl.Date);
end;

function TDateTimePickerX.Get_DateFormat: TxDTDateFormat;
begin
  Result := Ord(FDelphiControl.DateFormat);
end;

function TDateTimePickerX.Get_DateMode: TxDTDateMode;
begin
  Result := Ord(FDelphiControl.DateMode);
end;

function TDateTimePickerX.Get_DateTime: Double;
begin
  Result := Double(FDelphiControl.DateTime);
end;

function TDateTimePickerX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TDateTimePickerX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TDateTimePickerX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TDateTimePickerX.Get_DroppedDown: WordBool;
begin
  Result := FDelphiControl.DroppedDown;
end;

function TDateTimePickerX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TDateTimePickerX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TDateTimePickerX.Get_ImeMode: TxImeMode;
begin
  Result := Ord(FDelphiControl.ImeMode);
end;

function TDateTimePickerX.Get_ImeName: WideString;
begin
  Result := WideString(FDelphiControl.ImeName);
end;

function TDateTimePickerX.Get_Kind: TxDateTimeKind;
begin
  Result := Ord(FDelphiControl.Kind);
end;

function TDateTimePickerX.Get_MaxDate: Double;
begin
  Result := Double(FDelphiControl.MaxDate);
end;

function TDateTimePickerX.Get_MinDate: Double;
begin
  Result := Double(FDelphiControl.MinDate);
end;

function TDateTimePickerX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TDateTimePickerX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TDateTimePickerX.Get_ParseInput: WordBool;
begin
  Result := FDelphiControl.ParseInput;
end;

function TDateTimePickerX.Get_ShowCheckbox: WordBool;
begin
  Result := FDelphiControl.ShowCheckbox;
end;

function TDateTimePickerX.Get_Time: Double;
begin
  Result := Double(FDelphiControl.Time);
end;

function TDateTimePickerX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TDateTimePickerX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TDateTimePickerX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TDateTimePickerX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TDateTimePickerX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TDateTimePickerX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TDateTimePickerX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TDateTimePickerX.AboutBox;
begin
  ShowDateTimePickerXAbout;
end;

procedure TDateTimePickerX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TDateTimePickerX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TDateTimePickerX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TDateTimePickerX.Set_CalAlignment(Value: TxDTCalAlignment);
begin
  FDelphiControl.CalAlignment := TDTCalAlignment(Value);
end;

procedure TDateTimePickerX.Set_Checked(Value: WordBool);
begin
  FDelphiControl.Checked := Value;
end;

procedure TDateTimePickerX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TDateTimePickerX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TDateTimePickerX.Set_Date(Value: Double);
begin
  FDelphiControl.Date := TDate(Value);
end;

procedure TDateTimePickerX.Set_DateFormat(Value: TxDTDateFormat);
begin
  FDelphiControl.DateFormat := TDTDateFormat(Value);
end;

procedure TDateTimePickerX.Set_DateMode(Value: TxDTDateMode);
begin
  FDelphiControl.DateMode := TDTDateMode(Value);
end;

procedure TDateTimePickerX.Set_DateTime(Value: Double);
begin
  FDelphiControl.DateTime := TDateTime(Value);
end;

procedure TDateTimePickerX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TDateTimePickerX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TDateTimePickerX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TDateTimePickerX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TDateTimePickerX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TDateTimePickerX.Set_ImeMode(Value: TxImeMode);
begin
  FDelphiControl.ImeMode := TImeMode(Value);
end;

procedure TDateTimePickerX.Set_ImeName(const Value: WideString);
begin
  FDelphiControl.ImeName := TImeName(Value);
end;

procedure TDateTimePickerX.Set_Kind(Value: TxDateTimeKind);
begin
  FDelphiControl.Kind := TDateTimeKind(Value);
end;

procedure TDateTimePickerX.Set_MaxDate(Value: Double);
begin
  FDelphiControl.MaxDate := TDate(Value);
end;

procedure TDateTimePickerX.Set_MinDate(Value: Double);
begin
  FDelphiControl.MinDate := TDate(Value);
end;

procedure TDateTimePickerX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TDateTimePickerX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TDateTimePickerX.Set_ParseInput(Value: WordBool);
begin
  FDelphiControl.ParseInput := Value;
end;

procedure TDateTimePickerX.Set_ShowCheckbox(Value: WordBool);
begin
  FDelphiControl.ShowCheckbox := Value;
end;

procedure TDateTimePickerX.Set_Time(Value: Double);
begin
  FDelphiControl.Time := TTime(Value);
end;

procedure TDateTimePickerX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TDateTimePickerX.ChangeEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnChange;
end;

procedure TDateTimePickerX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TDateTimePickerX.CloseUpEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCloseUp;
end;

procedure TDateTimePickerX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TDateTimePickerX.DropDownEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDropDown;
end;

procedure TDateTimePickerX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TDateTimePickerX.UserInputEvent(Sender: TObject;
  const UserString: String; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
var
  TempDateAndTime: Double;
  TempAllowChange: WordBool;
begin
  TempDateAndTime := Double(DateAndTime);
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnUserInput(WideString(UserString), TempDateAndTime, TempAllowChange);
  DateAndTime := TDateTime(TempDateAndTime);
  AllowChange := Boolean(TempAllowChange);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TDateTimePickerX,
    TDateTimePicker,
    Class_DateTimePickerX,
    9,
    '{695CDB1B-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
