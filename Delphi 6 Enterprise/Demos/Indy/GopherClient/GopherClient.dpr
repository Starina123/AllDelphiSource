program gopherclient;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  gmain in 'gmain.pas' {frmGopher},
  textview in 'textview.pas' {frmTextView};

{$R *.res}

begin
  Application.Initialize;
Application.CreateForm(TfrmGopher, frmGopher);
  Application.CreateForm(TfrmTextView, frmTextView);
   Application.Run;
end.
