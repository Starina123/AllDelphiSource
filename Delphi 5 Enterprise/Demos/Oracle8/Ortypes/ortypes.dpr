program ORTypes;

uses
  Forms,
  ORTypeMain in 'ORTypeMain.pas' {OraTypeMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TOraTypeMain, OraTypeMain);
  Application.Run;
end.
