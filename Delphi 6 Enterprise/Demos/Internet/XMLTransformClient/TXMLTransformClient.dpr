program TXMLTransformClient;

uses
  Forms,
  XMLClient in 'XMLClient.pas' {formMain},
  readme in 'readme.pas' {formReadme};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformReadme, formReadme);
  Application.Run;
end.
