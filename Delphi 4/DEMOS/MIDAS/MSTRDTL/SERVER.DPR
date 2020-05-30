program Server;

uses
  Forms,
  SrvrForm in 'SrvrForm.pas' {ServerForm},
  Serv_TLB in 'Serv_TLB.pas',
  SrvrDM in 'SrvrDM.pas' {ProjectData: TDataModule} {ProjectData: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  { Uncomment this line to hide the server form. } 
//  Application.ShowMainForm := False;
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
