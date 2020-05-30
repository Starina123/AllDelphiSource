
unit TransformDataPacketU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, XMLDoc,
  XSLProd, xmldom, XMLIntf, msxmldom;

type
  TTransformDataPacketPage = class(TWebPageModule)
    XSLPageProducer: TXSLPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function TransformDataPacketPage: TTransformDataPacketPage;

implementation

{$R *.dfm}  {*.xsl}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function TransformDataPacketPage: TTransformDataPacketPage;
begin
  Result := TTransformDataPacketPage(WebContext.FindModuleClass(TTransformDataPacketPage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TTransformDataPacketPage, TWebPageInfo.Create([{wpPublished} {wpLoginRequired}], '.xsl'), crOnDemand, caCache));

end.
