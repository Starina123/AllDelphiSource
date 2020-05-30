program ClntProj;

uses
  Forms,
  ClntMain in 'ClntMain.pas' {ClientForm},
  ClntDM in 'ClntDM.pas' {DM: TDataModule},
  RecError in '..\..\..\OBJREPOS\recerror.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
