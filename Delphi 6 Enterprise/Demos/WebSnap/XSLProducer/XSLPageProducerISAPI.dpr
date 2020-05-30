library XSLPageProducerISAPI;

{%File 'readme.txt'}
{%File 'recipes.xml'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DisplayFileU in 'DisplayFileU.pas' {DisplayFilePage: TWebPageModule} {*.html},
  DisplayDataPacketU in 'DisplayDataPacketU.pas' {DisplayDataPacketPage: TWebPageModule} {*.html},
  TransformFileU in 'TransformFileU.pas' {TransformFilePage: TWebPageModule} {*.xsl},
  DMU in 'DMU.pas' {WebDataModule1: TWebDataModule},
  TransformDataPacketU in 'TransformDataPacketU.pas' {TransformDataPacketPage: TWebPageModule} {*.xsl};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
