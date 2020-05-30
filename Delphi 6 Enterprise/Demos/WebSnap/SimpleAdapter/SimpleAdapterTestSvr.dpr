program SimpleAdapterTestSvr;

{$APPTYPE GUI}



{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Console},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  CounterU in 'CounterU.pas' {Counter: TPageProducerModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TConsole, Console);
  Application.Run;
end.
