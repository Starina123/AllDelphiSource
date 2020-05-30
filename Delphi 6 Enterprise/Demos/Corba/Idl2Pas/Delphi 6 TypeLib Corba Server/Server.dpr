program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  Server_TLB in 'Server_TLB.pas',
  CorbaServerMain in 'CorbaServerMain.pas' {MyTest: CoClass};

{$R *.TLB} {CORBA}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
