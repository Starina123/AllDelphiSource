// NOTE: This demo ONLY runs under Windows.

program GophServ;

uses
  Forms,
  main in 'main.pas' {Gopher};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGopher, Gopher);
  Application.Run;
end.

