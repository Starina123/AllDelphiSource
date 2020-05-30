program CORBAClient;

{
  This is the CORBA Client part of the demo.
  This is just created by a File | New Application.
  Before you run the client, compile and run
  the Server. Please read the comments on the Server.
}

uses
  Forms,
  CORBAClientForm in 'CORBAClientForm.pas' {DemoClientFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDemoClientFrm, DemoClientFrm);
  Application.Run;
end.
