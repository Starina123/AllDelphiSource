unit Event1;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmEvents = class(TForm)
    GroupBox1: TGroupBox;
    btnOpenDatabase: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    btnGenerateEvent: TButton;
    Label1: TLabel;
    btnRegisterEvents: TButton;
    btnClearEvents: TButton;
    lbReceived: TListBox;
    ebEvent: TEdit;
    moRegister: TMemo;
    btnCloseDatabase: TButton;
    procedure btnClearEventsClick(Sender: TObject);
    procedure btnGenerateEventClick(Sender: TObject);
    procedure btnRegisterEventsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenDatabaseClick(Sender: TObject);
    procedure btnCloseDatabaseClick(Sender: TObject);
  end;

var
  frmEvents: TfrmEvents;

implementation

uses Event2, DB, IBDatabase, IBStoredProc;

{$R *.dfm}

procedure TfrmEvents.btnClearEventsClick(Sender: TObject);
begin
  lbReceived.Clear;
end;

procedure TfrmEvents.btnGenerateEventClick(Sender: TObject);
begin
  with dmEvents do
  begin
    IBTransaction1.StartTransaction;
    StoredProc1.Prepare;
    StoredProc1.Params[0].AsString := ebEvent.Text;
    StoredProc1.ExecProc;
    IBTransaction1.Commit;
  end;
end;

procedure TfrmEvents.btnRegisterEventsClick(Sender: TObject);
begin
  with dmEvents.IBEventAlerter1 do
  begin
    UnregisterEvents;
    Events.Assign(moRegister.Lines);
    RegisterEvents;
  end;
end;

procedure TfrmEvents.FormDestroy(Sender: TObject);
begin
  with dmEvents do
  begin
    IBEventAlerter1.UnregisterEvents;
    Database1.Connected := False;
  end;
  GroupBox2.Enabled := False;
  GroupBox3.Enabled := False;
  GroupBox4.Enabled := False;
  Label1.Enabled := False;
  btnGenerateEvent.Enabled := False;
  btnRegisterEvents.Enabled := False;
  btnClearEvents.Enabled := False;
end;

procedure TfrmEvents.btnOpenDatabaseClick(Sender: TObject);
begin
  dmEvents.Database1.Connected := True;
  GroupBox2.Enabled := True;
  GroupBox3.Enabled := True;
  GroupBox4.Enabled := True;
  Label1.Enabled := True;
  btnGenerateEvent.Enabled := True;
  btnRegisterEvents.Enabled := True;
  btnClearEvents.Enabled := True;
  btnCloseDatabase.Enabled := True;
  btnOpenDatabase.Enabled:=False;
end;

procedure TfrmEvents.btnCloseDatabaseClick(Sender: TObject);
begin
  dmEvents.IBEventAlerter1.UnregisterEvents;
  dmEvents.Database1.Connected := False;
  GroupBox2.Enabled := False;
  GroupBox3.Enabled := False;
  GroupBox4.Enabled := False;
  Label1.Enabled := False;
  btnGenerateEvent.Enabled := False;
  btnRegisterEvents.Enabled := False;
  btnClearEvents.Enabled := False;
  btnCloseDatabase.Enabled := False;
  btnOpenDatabase.Enabled := True;
end;

end.
