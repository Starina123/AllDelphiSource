library CountryEditorIsapi;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  CountryTableU in 'CountryTableU.pas' {CountryTable: TSitePageProducerModule} {*.html},
  CountryFormU in 'CountryFormU.pas' {CountryForm: TSitePageProducerModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
