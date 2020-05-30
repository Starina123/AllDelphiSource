program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  account_c in 'account_c.pas',
  account_i in 'account_i.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
