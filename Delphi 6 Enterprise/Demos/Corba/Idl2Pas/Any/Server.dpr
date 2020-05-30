program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  AnyTest_c in 'anytest_c.pas',
  AnyTest_i in 'anytest_i.pas',
  AnyTest_s in 'anytest_s.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.