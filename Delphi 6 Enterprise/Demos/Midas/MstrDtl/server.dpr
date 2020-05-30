program server;

uses
  Forms,
  srvrform in 'srvrForm.pas' {ServerForm},
  serv_tlb in 'serv_tlb.pas',
  srvrdm in 'srvrdm.pas' {ProjectData: TDataModule} {ProjectData: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  { Uncomment this line to hide the server form. } 
//  Application.ShowMainForm := False;
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
