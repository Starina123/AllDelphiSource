program ThreadedQuery;

uses
  Forms,
  frmMain in 'frmMain.pas' {Main},
  frmQueryResultsU in 'frmQueryResultsU.pas' {frmQueryResults},
  dmThreadU in 'dmThreadU.pas' {dmThread: TDataModule},
  ThreadQueryU in 'ThreadQueryU.pas',
  frmQueryGridResultsU in 'frmQueryGridResultsU.pas' {frmQueryGridResults};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
