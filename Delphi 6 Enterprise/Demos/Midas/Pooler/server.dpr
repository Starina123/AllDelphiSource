{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}
program Server;

uses
  Forms,
  SrvrFrm in 'SrvrFrm.pas' {Form1},
  server_tlb in 'server_tlb.pas',
  srvrdm in 'srvrdm.pas' {PooledRDM: TDataModule} {PooledRDM: CoClass},
  Pooler in 'Pooler.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
