library ApacheServer;

{
  #Add the following lines to Apache configuration file (httpd.conf):
  #Both the exported symbol and the content-type are case sensitive,
  #Content-Type * must * be lower case
  LoadModule apacheserver_module modules/ApacheServer.dll
  <Location /scripts>
      SetHandler apacheserver-handler
  </Location>
}
uses
  WebBroker,
  ApacheApp,
  main in 'Main.pas' {CustomerInfoModule: TWebModule};

{$R *.res}

exports
  apache_module name 'apacheserver_module';

begin
  Application.Initialize;
  Application.CreateForm(TCustomerInfoModule, CustomerInfoModule);
  Application.Run;
end.
