program EmpEdit;

uses
  Forms,
  EmpForm in 'EmpForm.pas' {EmployeeForm},
  RecError in '..\..\..\Objrepos\recerror.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEmployeeForm, EmployeeForm);
  Application.Run;
end.
