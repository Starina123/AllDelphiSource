program WebServicesIssuesSampProject;

uses
  Forms,
  IssuesClientUnit in 'IssuesClientUnit.pas' {ClientForm},
  IssueErrors in 'IssueErrors.pas' {OKBottomDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TUpdateErrorDlg, UpdateErrorDlg);
  Application.Run;
end.
