program WhoIsGUI;

uses
  Forms,
  WhoIsMain in 'WhoIsMain.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
