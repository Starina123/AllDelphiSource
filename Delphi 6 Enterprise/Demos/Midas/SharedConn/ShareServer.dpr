program ShareServer;



uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  ShareServer_TLB in 'ShareServer_TLB.pas',
  uDM1 in 'uDM1.pas' {MainRDM: TRemoteDataModule} {RDM1: CoClass},
  uDM2 in 'uDM2.pas' {ChildRDM: TRemoteDataModule} {ChildRDM: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
