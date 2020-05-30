
unit TransformFileU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, XMLDoc,
  XSLProd, xmldom, XMLIntf, msxmldom;

type
  TTransformFilePage = class(TWebPageModule)
    XSLPageProducer: TXSLPageProducer;
    XMLDocument1: TXMLDocument;
    procedure WebPageModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function TransformFilePage: TTransformFilePage;

implementation

{$R *.dfm}  {*.xsl}

uses WebReq, WebCntxt, WebFact, Variants, WebComp;

function TransformFilePage: TTransformFilePage;
begin
  Result := TTransformFilePage(WebContext.FindModuleClass(TTransformFilePage));
end;

procedure TTransformFilePage.WebPageModuleCreate(Sender: TObject);
begin
  // Need to qualify filenames for ISAPI dll's
  XMLDocument1.FileName := QualifyFileName(XMLDocument1.FileName);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TTransformFilePage, TWebPageInfo.Create([{wpPublished} {wpLoginRequired}], '.xsl'), crOnDemand, caCache));

end.
