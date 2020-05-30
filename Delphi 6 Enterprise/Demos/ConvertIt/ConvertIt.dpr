program ConvertIt;

uses
  Forms,
  ConvertItUnit in 'ConvertItUnit.pas' {Form1},
  EuroConv in 'EuroConv.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
