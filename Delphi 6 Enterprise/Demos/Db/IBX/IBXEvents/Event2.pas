unit Event2;

interface

uses Windows, Messages, SysUtils, Classes, Forms,
  DB, IBEvents, IBCustomDataSet, IBStoredProc, IBDatabase;

type
  TdmEvents = class(TDataModule)
    Database1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    StoredProc1: TIBStoredProc;
    IBEventAlerter1: TIBEvents;
    procedure IBEventAlerter1EventAlert(Sender: TObject; EventName: string;
      EventCount: Longint; var CancelAlerts: Boolean);
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

end.
