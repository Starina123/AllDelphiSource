
unit ModuleU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd;

type
  TModule = class(TWebDataModule)
    PageProducer1: TPageProducer;
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Module: TModule;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, MainU;

function Module: TModule;
begin
  Result := TModule(WebContext.FindModuleClass(TModule));
end;

procedure TModule.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if SameText(TagString, 'Heading') then
    ReplaceText := sHeading
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TModule, crOnDemand, caCache));

end.
