program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  Bank_s in 'Bank_s.pas',
  Bank_c in 'Bank_c.pas',
  Bank_i in 'Bank_i.pas',
  Bank_impl in 'Bank_impl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
