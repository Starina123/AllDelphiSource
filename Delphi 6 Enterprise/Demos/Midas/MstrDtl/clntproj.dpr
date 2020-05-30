program clntproj;

uses
  Forms,
  clntmain in 'clntmain.pas' {ClientForm},
  clntdm in 'clntdm.pas' {DM: TDataModule},
  recerror in '..\..\..\ObjRepos\recerror.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
