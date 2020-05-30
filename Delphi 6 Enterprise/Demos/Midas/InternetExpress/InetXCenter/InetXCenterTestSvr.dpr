program InetXCenterTestSvr;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form2},
  InextXCenterModule in 'InextXCenterModule.pas' {WebModule2: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
