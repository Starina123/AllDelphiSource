unit empedimp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, EmpE_TLB, DBClient, Db, ComCtrls, ExtCtrls,
  DBCtrls, StdCtrls, Mask, MConnect;

type
  TEmpEditForm = class(TActiveForm, IEmpEditForm)
    Label2: TLabel;
    UpdateButton: TButton;
    UndoButton: TButton;
    QueryButton: TButton;
    DBText1: TDBText;
    FirstName: TDBEdit;
    LastName: TDBEdit;
    PhoneExt: TDBEdit;
    HireDate: TDBEdit;
    Salary: TDBEdit;
    EmpData: TDataSource;
    DBNavigator1: TDBNavigator;
    Employees: TClientDataSet;
    MidasConnection: TDCOMConnection;
    RecInd: TLabel;
    procedure QueryButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure EmployeesReconcileError(DataSet: TCustomClientDataSet;
     E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure EmpDataDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FEvents: IEmpEditFormEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure Initialize; override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_Color; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: Font; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_WindowState: TxWindowState; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_Color); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: Font); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_WindowState(Value: TxWindowState); safecall;
  public
    { Public declarations }
  end;

implementation

uses RecError, ComServ;

{$R *.dfm}

{ TEmpEditForm }

procedure TEmpEditForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IEmpEditFormEvents;
end;

procedure TEmpEditForm.Initialize;
begin
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TEmpEditForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TEmpEditForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TEmpEditForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TEmpEditForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TEmpEditForm.Get_Color: OLE_COLOR;
begin
  Result := Color;
end;

function TEmpEditForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TEmpEditForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TEmpEditForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TEmpEditForm.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TEmpEditForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TEmpEditForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TEmpEditForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TEmpEditForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TEmpEditForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TEmpEditForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TEmpEditForm.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

procedure TEmpEditForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TEmpEditForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TEmpEditForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TEmpEditForm.Set_Color(Value: OLE_COLOR);
begin
  Color := Value;
end;

procedure TEmpEditForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TEmpEditForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TEmpEditForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TEmpEditForm.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TEmpEditForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TEmpEditForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TEmpEditForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TEmpEditForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TEmpEditForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TEmpEditForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TEmpEditForm.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TEmpEditForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TEmpEditForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TEmpEditForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TEmpEditForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TEmpEditForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TEmpEditForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TEmpEditForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TEmpEditForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

{ ========================================================================== }

procedure TEmpEditForm.QueryButtonClick(Sender: TObject);
begin

{ Get data from the server.  The number of records returned is dependent on
  the PacketRecords property of TClientDataSet.  If PacketRecords is set
  to -1 then all records are returned.  Otherwise, as the user scrolls
  through the data, additional records are returned in separate data packets. }

  Employees.Close;
  Employees.Open;

end;

procedure TEmpEditForm.UpdateButtonClick(Sender: TObject);
begin

{ Apply any edits.  The parameter indicates the number of errors which
  are allowed before the updating is aborted.  A value of -1 indicates that
  all successful updates be applied regardless of the number of errors. }

  Employees.ApplyUpdates(-1);

end;

procedure TEmpEditForm.UndoButtonClick(Sender: TObject);
begin

{ Here we demonstrate a new feature in TClientDataSet, the ability to undo
  changes in reverse order.  The parameter indicates if the cursor should
  be repositioned to the record association with the change. }


  Employees.UndoLastChange(True);

end;

procedure TEmpEditForm.EmployeesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin

{ This is the event handler which is called when there are errors during the
  update process.  To demonstrate, you can create an error by running two
  copies of this application and modifying the same record in each one.
  Here we use the standard reconcile error dialog from the object repository. }

  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TEmpEditForm.EmpDataDataChange(Sender: TObject; Field: TField);
begin

{ This code is used to update the status bar to show the number of records
  that have been retrieved an our relative position with the dataset. }

  with Employees do
    if Active then
      RecInd.Caption := Format(' %d of %d', [RecNo, RecordCount]);

end;
initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TEmpEditForm,
    Class_EmpEditForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL);
end.
