program rdmCustomerData;

uses
  Forms,
  rdmCustomerDataForm in 'rdmCustomerDataForm.pas' {Form1},
  rdmCustomerData_TLB in 'rdmCustomerData_TLB.pas',
  rdmCustomerDataModule in 'rdmCustomerDataModule.pas' {CustomerData: TRemoteDataModule} {CustomerData: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
