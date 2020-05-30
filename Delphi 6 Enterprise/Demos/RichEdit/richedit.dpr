program richedit;

uses 
  Forms,
  reabout in 'reabout.pas' {AboutBox},
  remain in 'remain.pas' {MainForm},
  reinit in 'reinit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Rich Edit Control Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
