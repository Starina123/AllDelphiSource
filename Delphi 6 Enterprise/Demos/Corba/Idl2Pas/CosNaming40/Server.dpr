program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  Account_c in 'Account_c.pas',
  Account_i in 'Account_i.pas',
  Account_impl in 'Account_impl.pas',
  Account_s in 'Account_s.pas';

{$R *.RES}

begin
  Application.Initialize;

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.