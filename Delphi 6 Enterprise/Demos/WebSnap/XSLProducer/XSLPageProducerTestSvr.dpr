program XSLPageProducerTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}
{%File 'recipes.xml'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DMU in 'DMU.pas' {WebDataModule1: TWebDataModule},
  TransformDataPacketU in 'TransformDataPacketU.pas' {TransformDataPacketPage: TWebPageModule} {*.xsl},
  DisplayDataPacketU in 'DisplayDataPacketU.pas' {DisplayDataPacketPage: TWebPageModule} {*.html},
  TransformFileU in 'TransformFileU.pas' {TransformFilePage: TWebPageModule} {*.xsl},
  DisplayFileU in 'DisplayFileU.pas' {DisplayFilePage: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
