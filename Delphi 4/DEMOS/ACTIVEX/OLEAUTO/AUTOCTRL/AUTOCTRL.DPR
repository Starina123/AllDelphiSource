program AutoCtrl;

uses
  Forms,
  AutoCtl in 'AutoCtl.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
