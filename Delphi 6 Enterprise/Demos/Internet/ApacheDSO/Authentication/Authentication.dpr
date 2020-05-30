library Authentication;

uses
  WebBroker,
  ApacheApp,
  Authentication_u in 'Authentication_u.pas' {WebModule1: TWebModule};

{$R *.res}


exports
  apache_module name 'authentication_module';

begin
  ModuleName:= 'authentication_module';
  ContentType := 'authentication-handler';
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
