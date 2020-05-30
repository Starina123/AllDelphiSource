program CtrlGrid;

uses
  Forms,
  CtrlForm in 'CtrlForm.pas' {FmCtrlGrid},
  DM in 'DM.pas' {DM1},
  About in 'About.pas' {FMAboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmCtrlGrid, FmCtrlGrid);
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFMAboutBox, FMAboutBox);
  Application.Run;
end.
 