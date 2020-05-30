library CPLDemo;

uses
  CtlPanel,
  main in 'main.pas' {DTConfig: TAppletModule},
  ufrmdt in 'ufrmdt.pas' {frmDateTime};

exports CPlApplet;

{$E cpl}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDTConfig, DTConfig);
  Application.Run;
end.