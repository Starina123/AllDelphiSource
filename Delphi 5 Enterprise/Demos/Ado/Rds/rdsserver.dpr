program RDSServer;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  RServer_TLB in 'RServer_TLB.pas',
  AppServer in 'AppServer.pas' {RDSAppServer: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
