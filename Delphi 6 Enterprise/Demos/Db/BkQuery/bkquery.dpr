program BkQuery;

uses
  Forms,
  QueryFrm in 'QueryFrm.pas' {AdhocForm},
  ResltFrm in 'ResltFrm.pas' {QueryForm},
  SaveQAs in 'SaveQAs.pas' {SaveQueryAs};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAdhocForm, AdhocForm);
  Application.Run;
end.
