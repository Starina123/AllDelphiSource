program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  account_c in 'account_c.pas',
  account_i in 'account_i.pas',
  account_impl in 'account_impl.pas',
  account_s in 'account_s.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.