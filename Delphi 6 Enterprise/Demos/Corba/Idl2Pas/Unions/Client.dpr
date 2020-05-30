program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  myunion_c in 'myunion_c.pas',
  myunion_i in 'myunion_i.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
