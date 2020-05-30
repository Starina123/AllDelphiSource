program TextTest;

uses
  Forms,
  TextMain in 'TextMain.pas' {TextDataDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTextDataDemoForm, TextDataDemoForm);
  Application.Run;
end.
