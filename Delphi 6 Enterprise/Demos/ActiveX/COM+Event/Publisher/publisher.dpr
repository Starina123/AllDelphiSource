program publisher;

uses
  Forms,
  publisherunit in 'publisherunit.pas' {MainForm},
  event_tlb in '..\Event\event_tlb.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
