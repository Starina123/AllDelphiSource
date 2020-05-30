program DelphiEuroConverter;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ejb_currencyconverter_i in 'ejb_currencyconverter_i.pas',
  ejb_currencyconverter_c in 'ejb_currencyconverter_c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
