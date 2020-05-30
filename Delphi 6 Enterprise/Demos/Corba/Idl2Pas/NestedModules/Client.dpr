program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  Corba,
  Financials_MutualFund_s in 'Financials_MutualFund_s.pas',
  Financials_Bank_i in 'Financials_Bank_i.pas',
  Financials_Bank_s in 'Financials_Bank_s.pas',
  Financials_MutualFund_c in 'Financials_MutualFund_c.pas',
  Financials_MutualFund_i in 'Financials_MutualFund_i.pas',
  Financials_Bank_c in 'Financials_Bank_c.pas';

{$R *.RES}

begin
  Application.Initialize;

  CorbaInitialize;

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
