// NOTE: This demo ONLY runs under Windows.

program SSLTunnel;

uses
  Forms,
  main in 'main.pas' {formMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.

