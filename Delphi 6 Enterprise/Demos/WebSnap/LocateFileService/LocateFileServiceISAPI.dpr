library LocateFileServiceISAPI;

{%File 'readme.txt'}
{$R 'htmlfiles.res' 'htmlfiles.rc'}
{%File 'Footer.html'}
{%File 'Header.html'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  Page1Unit in 'Page1Unit.pas' {Page1: TWebAppPageModule} {*.html},
  Page2Unit in 'Page2Unit.pas' {Page2: TWebPageModule} {*.html},
  Page3Unit in 'Page3Unit.pas' {Page3: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
