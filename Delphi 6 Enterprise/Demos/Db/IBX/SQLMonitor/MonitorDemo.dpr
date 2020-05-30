program MonitorDemo;

uses
  Forms,
  frmMainU in 'frmMainU.pas' {frmMain},
  frmConnectU in 'frmConnectU.pas' {frmConnect},
  frmMonitorU in 'frmMonitorU.pas' {frmMonitor},
  frmTraceFlagsU in 'frmTraceFlagsU.pas' {frmTraceFlags};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
