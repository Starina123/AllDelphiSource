program FramesDemo;

uses
  QForms,
  frmMain in 'frmMain.pas' {Form1},
  frmData in 'frmData.pas' {DataFrame: TFrame},
  frmFancy in 'frmFancy.pas' {FancyFrame: TFrame},
  FrmMD in 'FrmMD.pas' {MasterDetailFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
