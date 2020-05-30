program server;

uses
  Forms,
  servmain in 'servmain.pas' {Form1},
  serv_tlb in 'serv_tlb.pas',
  servdata in 'servdata.pas' {AdHocQueryDemo: TDataModule} {AdHocQueryDemo: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
