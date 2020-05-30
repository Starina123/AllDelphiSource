program DBErrors;

uses
  Forms,
  Main in 'Main.pas' {FmMain},
  DM1 in 'Dm1.pas' {DM},
  About in 'About.pas' {FmAboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
