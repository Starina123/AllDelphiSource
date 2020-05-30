program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  MyStruct_S in 'MyStruct_S.pas',
  mystruct_impl in 'mystruct_impl.pas',
  mystruct_i in 'mystruct_i.pas',
  mystruct_c in 'mystruct_c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
