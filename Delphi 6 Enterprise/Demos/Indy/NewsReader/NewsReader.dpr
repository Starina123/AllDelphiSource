// NOTE: This demo ONLY runs under Windows.

program newsreader;

uses
  Forms,
  mainform in 'mainform.pas' {Form1},
  setup in 'setup.pas' {frmNewsSetup},
  ConnectThread in 'ConnectThread.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

