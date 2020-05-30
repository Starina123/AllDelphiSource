library XMLBiolifeISAPI;

{%File 'readme.txt'}
{%File 'template.xsl'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas',
  LoginU in 'LoginU.pas',
  GridU in 'GridU.pas',
  EditU in 'EditU.pas',
  DMU in 'DMU.pas' {DM};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
