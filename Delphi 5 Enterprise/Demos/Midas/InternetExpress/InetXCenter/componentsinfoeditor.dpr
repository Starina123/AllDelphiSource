{ See ComponentsInfoEditorUnit1 }

program ComponentsInfoEditor;

uses
  Forms,
  ComponentsInfoEditorUnit1 in 'ComponentsInfoEditorUnit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
