program Client;

uses
  Forms,
  ClntForm in 'ClntForm.pas' {ClientForm},
  IPCThrd in 'Ipcthrd.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
