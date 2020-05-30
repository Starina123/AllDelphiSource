program server;

uses
  Forms,
  srvrfrm in 'srvrfrm.pas' {Form1},
  server_tlb in 'server_tlb.pas',
  srvrdm in 'srvrdm.pas' {LoginDemo: TRemoteDataModule} {LoginDemo: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
