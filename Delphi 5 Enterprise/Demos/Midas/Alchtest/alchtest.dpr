program AlchTest;

uses
  Forms,
  AlchMain in 'AlchMain.pas' {DBClientTest},
  RecError in 'RecError.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDBClientTest, DBClientTest);
  Application.Run;
end.
