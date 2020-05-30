program IBInstallConfig;
{
 This program is a simple utility that will generate a config file that is
 used by IBSilen.exe.  It prompts users with the different Interbase 6.0
 install options which are written to a text file.

 Choosing which Interbase Install Options should be researched in the
 Interbase 6.0 Documentation.  For example choosing the IB_ODBC_CLIENT option,
 which is listed in IBInstall.pas, is obsolete and doesn't make any sense.
 (Easysoft has its own installation)
}
uses
  Forms,
  cfg_form in 'cfg_form.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
