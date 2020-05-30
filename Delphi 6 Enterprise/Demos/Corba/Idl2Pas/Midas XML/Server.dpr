program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  employee_s in 'employee_s.pas',
  employee_i in 'employee_i.pas',
  employee_impl in 'employee_impl.pas',
  employee_c in 'employee_c.pas',
  GlobalVars in 'GlobalVars.pas',
  DMPooler in 'DMPooler.pas',
  dmEmployee in 'dmEmployee.pas' {dmEmploy: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmEmploy, dmEmploy);
  Application.Run;
end.
