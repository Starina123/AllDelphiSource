program FramesDemo;

uses
  Forms,
  FrmData in 'FrmData.pas' {DataFrame: TFrame},
  FrmFancy in 'FrmFancy.pas' {FancyFrame: TFrame},
  FrmMD in 'FrmMD.pas' {MasterDetailFrame: TFrame},
  FrmMain in 'FrmMain.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
