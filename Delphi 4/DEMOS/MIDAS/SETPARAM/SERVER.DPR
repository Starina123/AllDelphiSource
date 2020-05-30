program Server;

uses
  Forms,
  ServMain in 'ServMain.pas' {Form1},
  Serv_TLB in 'Serv_TLB.pas',
  ServData in 'ServData.pas' {SetParamDemo: TDataModule} {SetParamDemo: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
