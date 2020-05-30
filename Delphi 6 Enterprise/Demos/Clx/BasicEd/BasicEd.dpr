program BasicEd;

uses
  QForms,
  MainFrm in 'MainFrm.pas' {MainForm},
  AboutFrm in 'AboutFrm.pas' {AboutForm},
  EditFrm in 'EditFrm.pas' {EditForm};

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
