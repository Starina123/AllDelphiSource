program dbxexplorer;

uses
  QForms,
  dbxexplore in 'dbxexplore.pas'   {Form1},
  dbxrecerror in 'dbxrecerror.pas' {ReconcileErrorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
