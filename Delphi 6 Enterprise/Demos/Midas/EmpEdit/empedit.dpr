program empedit;

uses
  Forms,
  empform in 'empform.pas' {EmployeeForm},
  recerror in '..\..\..\Objrepos\recerror.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEmployeeForm, EmployeeForm);
  Application.Run;
end.
