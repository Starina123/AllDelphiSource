//
//  Add the section below to a httpd.conf  Change the <DRIVE> and <PATH>
//  settings to point to this directory.  A full path is required. Use
//  forward slashes and not back slashes.
//
//  The address to request this demo from a browser is
//  http://localhost/xmlbiolife
//

{########################## Apache Conf Settings ##############################

LoadModule biolife_module <DRIVE><PATH>/biolifeapache.dll

<Location /biolife>
  SetHandler biolife-handler
</Location>

###############################################################################}

library biolifeapache;

uses
  WebBroker,
  ApacheApp,
  LoginU in 'LoginU.pas' {Login: TWebPageModule} {*.html},
  FormU in 'FormU.pas' {Details: TWebPageModule} {*.html},
  GridU in 'GridU.pas' {Grid: TWebPageModule} {*.html},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DataU in 'DataU.pas' {WebDataModule3: TWebDataModule};

{$R *.res}

exports
  apache_module name 'biolife_module';

begin
  ModuleName :='biolife_module';
  ContentType :='biolife-handler';
  Application.Initialize;
  Application.Run;
end.
