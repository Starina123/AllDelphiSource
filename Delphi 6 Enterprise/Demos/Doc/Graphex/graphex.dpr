program GraphEx;

uses
  Forms,
  GraphWin in 'GraphWin.pas' {Form1},
  BMPDlg in 'BMPDlg.pas' {NewBMPForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TNewBMPForm, NewBMPForm);
  Application.Run;
end.
