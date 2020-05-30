program ActionFieldTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DMU in 'DMU.pas' {DM: TWebDataModule},
  ItemsTableU in 'ItemsTableU.pas' {ItemsTable: TWebPageModule} {*.html},
  NewRowU in 'NewRowU.pas' {NewRow: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
