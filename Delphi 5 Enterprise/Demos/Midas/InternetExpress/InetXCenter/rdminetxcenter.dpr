{ See rdmINetXCenterModule for comments.
}

program rdmInetXCenter;

uses
  Forms,
  rdmINetxCenterForm in 'rdmINetxCenterForm.pas' {Form2},
  rdmINetXCenter_TLB in 'rdmINetXCenter_TLB.pas',
  rdmINetXCenterModule in 'rdmINetXCenterModule.pas' {INetXCenterData: TRemoteDataModule} {INetXCenterData: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
