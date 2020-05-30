program FilManEx;

uses
  Forms,
  FMXWin in 'FMXWin.pas' {FMForm},
  FmxUtils in 'Fmxutils.pas',
  FAttrDlg in 'FAttrDlg.pas' {FileAttrForm},
  FChngDlg in 'FChngDlg.pas' {ChangeDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFMForm, FMForm);
  Application.CreateForm(TFileAttrForm, FileAttrForm);
  Application.CreateForm(TChangeDlg, ChangeDlg);
  Application.Run;
end.
