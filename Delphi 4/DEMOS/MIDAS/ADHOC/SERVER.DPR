program Server;

uses
  Forms,
  ServMain in 'ServMain.pas' {Form1},
  Serv_TLB in 'Serv_TLB.pas',
  ServData in 'ServData.pas' {AdHocQueryDemo: TDataModule} {AdHocQueryDemo: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
