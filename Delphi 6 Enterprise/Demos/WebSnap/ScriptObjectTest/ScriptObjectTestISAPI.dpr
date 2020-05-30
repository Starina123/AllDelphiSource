library ScriptObjectTestISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
