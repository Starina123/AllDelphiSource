program Server;

uses
  Forms,
  Server_TLB in 'Server_TLB.pas',
  SrvrDM in 'SrvrDM.pas' {BriefCaseDemo: TRemoteDataModule} {BriefCaseDemo: CoClass},
  SrvrFrm in 'SrvrFrm.pas' {Form1};


{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
