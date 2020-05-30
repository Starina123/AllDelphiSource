program Server;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1},
  Financials_MutualFund_s in 'Financials_MutualFund_s.pas',
  Financials_Bank_i in 'Financials_Bank_i.pas',
  Financials_Bank_impl in 'Financials_Bank_impl.pas',
  Financials_Bank_s in 'Financials_Bank_s.pas',
  Financials_MutualFund_c in 'Financials_MutualFund_c.pas',
  Financials_MutualFund_i in 'Financials_MutualFund_i.pas',
  Financials_MutualFund_impl in 'Financials_MutualFund_impl.pas',
  Financials_Bank_c in 'Financials_Bank_c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
