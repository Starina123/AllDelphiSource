// This demo demonstrates the use of IdFTP and IdDebugLog components
// There is some problems with ABORT function.
//
// This demo supports both UNIX and DOS directory listings
//
//  Copyright (C) 2000 Doychin Bondzhev (doichin@5group.com)
//
// History:
//   Sep - 2000 : Initial release
//
//   Nov - 2000 : Minor updates and GUI enhancements
//

program FTPDemo;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  mainf in 'mainf.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
