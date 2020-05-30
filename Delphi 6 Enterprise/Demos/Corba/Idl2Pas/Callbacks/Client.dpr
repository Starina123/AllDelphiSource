program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  Corba,
  Bank_i in 'Bank_i.pas',
  Bank_c in 'Bank_c.pas',
  Bank_s in 'Bank_S.pas',
  Rates_Impl in 'Rates_Impl.pas',
  ClientGlobals in 'ClientGlobals.pas';

{$R *.RES}

begin
  Application.Initialize;

  CorbaInitialize;
  myRatesSkel := TRatesSkeleton.Create('MyRatesObj', TRates.Create);
  BOA.ObjIsReady(myRatesSkel as _Object);

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
