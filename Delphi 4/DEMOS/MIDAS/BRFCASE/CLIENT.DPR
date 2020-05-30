program Client;

uses
  Forms,
  ClntFrm in 'ClntFrm.pas' {Form1},
  RecError in '..\..\..\OBJREPOS\RecError.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
