program Server;

uses
  Forms,
  ServMain in 'ServMain.pas' {MainForm},
  ServData in 'ServData.pas' {EmpServer: TDataModule} {EmpServer: CoClass},
  Serv_TLB in 'Serv_TLB.pas';

{$R *.RES}

{$R *.TLB}

begin

{ Uncomment the following line to prevent the
  application server main form from being displayed. }

{ Application.ShowMainForm := False; }
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
