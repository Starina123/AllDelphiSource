program Server;

uses
  Forms,
  servmain in 'servmain.pas' {MainForm},
  servdata in 'servdata.pas' {EmpServer: TDataModule} {EmpServer: CoClass},
  serv_tlb in 'serv_tlb.pas';

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
