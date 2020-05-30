program WebServicesDBServer;

uses
  Forms,
  DBServerClientUnit in 'DBServerClientUnit.pas' {ClientForm},
  SoapDBServerUnit in 'SoapDBServerUnit.pas' {Data: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TData, Data);
  Application.Run;
end.
