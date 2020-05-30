program Football;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  about in 'about.pas' {AboutForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
