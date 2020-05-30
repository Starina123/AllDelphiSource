unit Event2;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, IBCtrls, DBLogDlg;

type
  TdmEvents = class(TDataModule)
    Database1: TDatabase;
    IBEventAlerter1: TIBEventAlerter;
    StoredProc1: TStoredProc;
    procedure IBEventAlerter1EventAlert(Sender: TObject; EventName: string;
      EventCount: Longint; var CancelAlerts: Boolean);
    procedure dmEventsCreate(Sender: TObject);
  end;

var
  dmEvents: TdmEvents;

implementation

uses Event1;

{$R *.dfm}

procedure TdmEvents.IBEventAlerter1EventAlert(Sender: TObject;
  EventName: string; EventCount: Longint; var CancelAlerts: Boolean);
begin
  frmEvents.lbReceived.Items.Add(EventName);
end;

procedure TdmEvents.dmEventsCreate(Sender: TObject);
begin
  with Database1 do
    Params.Values['Server Name'] := ExtractFilePath(ParamStr(0)) +
      'Events.gdb';
end;

end.
