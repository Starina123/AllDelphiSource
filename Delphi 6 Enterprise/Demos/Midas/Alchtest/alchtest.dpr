program alchtest;

uses
  Forms,
  AlchMain in 'alchmain.pas' {DBClientTest},
  recerror in '..\..\..\ObjRepos\recerror.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDBClientTest, DBClientTest);
  Application.Run;
end.
