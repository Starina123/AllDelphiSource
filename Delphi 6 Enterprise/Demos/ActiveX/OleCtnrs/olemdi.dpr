program olemdi;

uses
  Forms,
  mdimain in 'mdimain.pas' {MainForm},
  mdichild in 'mdichild.pas' {MDIChildForm},
  about in 'about.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
