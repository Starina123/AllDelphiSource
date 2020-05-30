unit DemoTemplates;

interface

uses ProdTemplateReg;

procedure Register;

implementation

uses TemplateResItems, WProdReg;

var
  TemplateResources: TTemplateResources;

type
  TDemoTemplates = class(TProducerTemplatesList)
  public
    constructor Create;
  end;

const sProducerTemplateNamespace = 'Borland.SiteXTemplateDemo';

procedure Register;
begin
  RegisterProducerTemplates(sProducerTemplateNamespace, TDemoTemplates.Create);
end;

{ TDemoTemplates }

constructor TDemoTemplates.Create;

var
  I: Integer;
  TemplateFileType: string;
begin
  inherited Create;
  for I := 0 to TemplateResources.ItemCount - 1 do
  begin
    if TemplateResources.Items[I].ResType = RT_HTML then
      TemplateFileType := sHTMLTemplateFileType
    else
      TemplateFileType := sXSLTemplateFileType;
    Self.Add(TProducerTemplateScriptString.Create(
      TemplateResources.Items[I].Name, TemplateResources.Items[I].Template,
      [], [], [TemplateFileType], False {Default }));
  end;
end;

initialization
  TemplateResources := TTemplateResources.Create(HInstance);
finalization
  UnRegisterProducerTemplates(sProducerTemplateNamespace);
  TemplateResources.Free;
end.
