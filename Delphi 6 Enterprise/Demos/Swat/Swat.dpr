program Swat;

uses
  Forms,
  Main in 'Main.pas' {SwatForm},
  about in 'about.pas' {AboutBox},
  options in 'options.pas' {OptionsDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSwatForm, SwatForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TOptionsDlg, OptionsDlg);
  Application.Run;
end.
