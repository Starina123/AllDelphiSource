program Webbrows;

uses
  Forms,
  main in 'Main.pas' {MainForm},
  DocSrc in 'Docsrc.pas' {DocSourceFrm},
  About in 'About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDocSourceFrm, DocSourceFrm);
  Application.Run;
end.
