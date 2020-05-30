program DockEx;

uses
  Forms,
  Graphics,
  SysUtils,
  Main in 'Main.pas' {MainForm},
  DockForm in 'DockForm.pas' {DockableForm},
  ConjoinHost in 'ConjoinHost.pas' {ConjoinDockHost},
  TabHost in 'TabHost.pas' {TabDockHost};

{$R *.RES}



begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
