program Server;

uses
  Forms,
  SrvrFrm in 'SrvrFrm.pas' {Form1},
  Server_TLB in 'Server_TLB.pas',
  SrvrDM in 'SrvrDM.pas' {LoginDemo: TRemoteDataModule} {LoginDemo: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
