program GdsDemo;

uses
  Forms,
  GdsStd in 'GdsStd.pas' {GDSStdForm},
  GdsData in 'GdsData.pas' {StdDataForm},
  RecForm in 'RecForm.pas' {RecViewForm},
  GridForm in 'GridForm.pas' {GridViewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TGridViewForm, GridViewForm);
  Application.CreateForm(TRecViewForm, RecViewForm);
  Application.Run;
end.
