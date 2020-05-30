object TransformFilePage: TTransformFilePage
  OldCreateOrder = False
  OnCreate = WebPageModuleCreate
  PageProducer = XSLPageProducer
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object XSLPageProducer: TXSLPageProducer
    Active = True
    ParseOptions = []
    XMLData = XMLDocument1
    Left = 48
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object XMLDocument1: TXMLDocument
    Active = False
    FileName = 'recipes.xml'
    ParseOptions = []
    Left = 120
    Top = 56
    DOMVendorDesc = 'MSXML'
  end
end
