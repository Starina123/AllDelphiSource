program Csdemos;

uses
  Forms,
  Frmtrigg in 'FRMTRIGG.PAS' {FrmTriggerDemo},
  Frmviews in 'FRMVIEWS.PAS' {FrmViewDemo},
  Frmmain in 'FRMMAIN.PAS' {FrmLauncher},
  Frmqrysp in 'FRMQRYSP.PAS' {FrmQueryProc},
  Frmexesp in 'FRMEXESP.PAS' {FrmExecProc},
  Frmtrans in 'FRMTRANS.PAS' {FrmTransDemo},
  DmCSDemo in 'DmCSDemo.pas' {DmEmployee: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLauncher, FrmLauncher);
  Application.CreateForm(TDmEmployee, DmEmployee);
  Application.CreateForm(TFrmTriggerDemo, FrmTriggerDemo);
  Application.CreateForm(TFrmViewDemo, FrmViewDemo);
  Application.CreateForm(TFrmQueryProc, FrmQueryProc);
  Application.CreateForm(TFrmExecProc, FrmExecProc);
  Application.CreateForm(TFrmTransDemo, FrmTransDemo);
  Application.Run;
end.
