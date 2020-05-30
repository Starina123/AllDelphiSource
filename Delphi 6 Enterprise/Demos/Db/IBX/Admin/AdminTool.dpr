program AdminTool;

uses
  Forms,
  frmAdminToolU in 'frmAdminToolU.pas' {frmAdminTool},
  frmUserInformationU in 'frmUserInformationU.pas' {frmUserInformation},
  frmLoginU in 'frmLoginU.pas' {frmLogin},
  frmAddCertificateU in 'frmAddCertificateU.pas' {frmAddCertificate},
  frmVerboseU in 'frmVerboseU.pas' {frmVerbose};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAdminTool, frmAdminTool);
  Application.CreateForm(TfrmUserInformation, frmUserInformation);
  Application.Run;
end.
