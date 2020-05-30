program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  mystruct_i in 'mystruct_i.pas',
  mystruct_c in 'mystruct_c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
