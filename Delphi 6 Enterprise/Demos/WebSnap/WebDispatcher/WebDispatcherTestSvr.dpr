program WebDispatcherTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  MainU in 'MainU.pas' {Main: TWebAppDataModule},
  ModuleU in 'ModuleU.pas' {Module: TWebDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
