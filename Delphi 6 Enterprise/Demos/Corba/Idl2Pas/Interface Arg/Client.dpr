program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {ClientForm},
  Corba,
  Bank_i in 'Bank_i.pas',
  Bank_c in 'Bank_c.pas';

{$R *.RES}

begin
  Application.Initialize;
  CorbaInitialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
