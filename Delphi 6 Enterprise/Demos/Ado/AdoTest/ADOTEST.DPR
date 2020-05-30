program AdoTest;

uses
  Forms,
  AdoMain in 'AdoMain.pas' {ADODBTest};
  
{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TADODBTest, ADODBTest);
  Application.Run;
end.
