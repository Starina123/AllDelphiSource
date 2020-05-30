program ServerCustClient;

uses
  Forms,
  UnitServerCustClient in 'UnitServerCustClient.pas' {FormServerCustClient};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormServerCustClient, FormServerCustClient);
  Application.Run;
end.
