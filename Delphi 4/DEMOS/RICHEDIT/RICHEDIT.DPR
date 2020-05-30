program RichEdit;

uses 
  Forms,
  REAbout in 'REABOUT.PAS' {AboutBox},
  REMain in 'REMain.pas' {MainForm},
  ReInit in 'Reinit.pas';

{$R *.RES}

begin
  Application.Title := 'Rich Edit Control Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
