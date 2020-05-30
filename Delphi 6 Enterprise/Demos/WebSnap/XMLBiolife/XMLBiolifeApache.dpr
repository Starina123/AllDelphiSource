//
//  Add the section below to a httpd.conf  Change the <DRIVE> and <PATH>
//  settings to point to this directory.  A full path is required. Use
//  forward slashes and not back slashes.
//
//  The address to request this demo from a browser is
//  http://localhost/xmlbiolife
//

{########################## Apache Conf Settings ##############################

LoadModule biolife_module <DRIVE><PATH>/xmlbiolifeapache.dll

<Location /xmlbiolife>
  SetHandler xmlbiolife-handler
</Location>

###############################################################################
}
library XMLBiolifeApache;

{%File 'readme.txt'}
{%File 'template.xsl'}

uses
  WebBroker,
  ApacheApp,
  LoginU in 'LoginU.pas',
  EditU in 'EditU.pas',
  GridU in 'GridU.pas',
  HomeU in 'HomeU.pas',
  DMU in 'DMU.pas' {DM};

{$R *.res}

exports
  apache_module name 'xmlbiolife_module';

begin
  ModuleName:= 'xmlbiolife_module';
  ContentType:= 'xmlbiolife-handler';
  Application.Initialize;
  Application.Run;
end.
