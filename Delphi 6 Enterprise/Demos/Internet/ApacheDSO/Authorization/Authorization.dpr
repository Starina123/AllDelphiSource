library Authorization;

uses
  WebBroker,
  ApacheApp,
  Authorization_u in 'Authorization_u.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  apache_module name 'authorization_module';

begin
  ModuleName:= 'authorization_module';
  ContentType := 'authorization-handler';
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
