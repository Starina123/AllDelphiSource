program AutoDemo;

uses
  Forms,
  AutoForm in 'AutoForm.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
