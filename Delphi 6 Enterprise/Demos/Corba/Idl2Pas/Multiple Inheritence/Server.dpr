program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  Broker_S in 'Broker_S.pas',
  Corba,
  Broker_c in 'Broker_c.pas',
  Broker_i in 'Broker_i.pas',
  Broker_impl in 'Broker_impl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
