library biolifeisapi;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIApp,
  Forms,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  LoginU in 'LoginU.pas' {Login: TWebPageModule} {*.html},
  FormU in 'FormU.pas' {Details: TWebPageModule} {*.html},
  DataU in 'DataU.pas' {WebDataModule3: TWebDataModule},
  GridU in 'GridU.pas' {Grid: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
