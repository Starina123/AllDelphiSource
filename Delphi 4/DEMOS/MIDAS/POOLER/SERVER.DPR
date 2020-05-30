program Server;

uses
  Forms,
  SrvrFrm in 'SrvrFrm.pas' {Form1},
  Server_TLB in 'Server_TLB.pas',
  SrvrDM in 'SrvrDM.pas' {PooledRDM: TDataModule} {PooledRDM: CoClass},
  Pooler in 'Pooler.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
