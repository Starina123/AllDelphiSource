program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  Account_c in 'Account_c.pas',
  Account_i in 'Account_i.pas';

{$R *.RES}

begin
  Application.Initialize;

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.