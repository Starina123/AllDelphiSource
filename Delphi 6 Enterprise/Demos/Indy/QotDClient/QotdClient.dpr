program QotdClient;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  main in 'main.pas' {frmQuoteOfTheDayDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmQuoteOfTheDayDemo, frmQuoteOfTheDayDemo);
  Application.Run;
end.
