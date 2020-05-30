program qr3demo;

uses
  Forms,
  mdmain in 'mdmain.pas' {frmQR3Demo},
  mdrpt in 'mdrpt.pas' {frmMasterDetail},
  image in 'image.pas' {frmImageRpt},
  exprmemo in 'exprmemo.pas' {frmExprmemo},
  basicmd in 'basicmd.pas' {frmBasicMD},
  needdata in 'needdata.pas' {frmNeedData},
  frmltr in 'frmltr.pas' {frmFormLetter},
  history in 'history.pas' {frmHistory},
  grouping in 'grouping.pas' {frmGrouping};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'QuickReport 3 Demo';
  Application.CreateForm(TfrmQR3Demo, frmQR3Demo);
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmImageRpt, frmImageRpt);
  Application.CreateForm(TfrmExprmemo, frmExprmemo);
  Application.CreateForm(TfrmBasicMD, frmBasicMD);
  Application.CreateForm(TfrmNeedData, frmNeedData);
  Application.CreateForm(TfrmFormLetter, frmFormLetter);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.CreateForm(TfrmGrouping, frmGrouping);
  Application.Run;
end.
