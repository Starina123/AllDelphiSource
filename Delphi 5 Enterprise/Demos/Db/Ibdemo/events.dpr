program Events;

uses
  Forms,
  Event1 in 'Event1.pas' {frmEvents},
  Event2 in 'Event2.pas' {dmEvents};

{$R *.RES}

begin
  Application.CreateForm(TdmEvents, dmEvents);
  Application.CreateForm(TfrmEvents, frmEvents);
  Application.Run;
end.
