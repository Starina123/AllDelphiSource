program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  MyUnion_S in 'MyUnion_S.pas',
  myunion_impl in 'myunion_impl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
