program CustomDraw;

uses
  Forms,
  CustomDrawTreeView in 'CustomDrawTreeView.pas' {CustomDrawForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCustomDrawForm, CustomDrawForm);
  Application.Run;
end.
