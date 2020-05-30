program monitor;

uses
  Forms,
  Windows,
  IPCThrd in 'IpcThrd.pas',
  MonForm in 'MonForm.pas' {MonitorForm},
  TrcView in 'TrcView.pas' {TraceForm};

{$R *.RES}

{ This routine checks for a previous instance of the monitor and if one is
  found, brings it to the foreground and then exits }

procedure CheckPreviousInstance;
var
  H: THandle;
begin
  if IsMonitorRunning(H) then
  begin
    if IsIconic(H) then
      ShowWindow(H, SW_RESTORE);
    SetForegroundWindow(H);
    Halt(0);
  end;
end;

begin
  CheckPreviousInstance;
  Application.Initialize;
  Application.Title := 'IPC Monitor Demo';
  Application.CreateForm(TMonitorForm, MonitorForm);
  Application.CreateForm(TTraceForm, TraceForm);
  Application.Run;
end.
