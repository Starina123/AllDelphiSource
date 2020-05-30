{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SoapEnv;

interface

uses Classes, SysUtils,  XMLDOM, XMLDoc, XMLIntf;

type
  TSoapEnvelope = class
  public
    function MakeEnvelope(Doc: IXMLDocument): IXMLNode;
    function MakeHeader(ParentNode: IXMLNode): IXMLNode;
    function MakeBody(ParentNode: IXMLNOde): IXMLNode;
    function MakeFault(ParentNode: IXMLNOde): IXMLNode;
  end;

const
  SSoapNameSpacePre = 'SOAP-ENV';            { do not localize }
  SXMLSchemaNameSpacePre = 'xsd';            { do not localize}
  SXMLSchemaInstNameSpace99Pre = 'xsi';           { do not localize}
  SSoapEncodingPre = 'SOAP-ENC';             { do not localize}
  
implementation

uses  SoapConst;


function TSoapEnvelope.MakeEnvelope(Doc: IXMLDocument): IXMLNode;
begin
  Result := Doc.CreateNode(SSoapNameSpacePre + ':' + SSoapEnvelope); 
  Result.DeclareNamespace(SSoapNameSpacePre,SSoapNameSpace);
  Result.DeclareNamespace(SXMLSchemaNameSpacePre, XMLSchemaNameSpace);
  Result.DeclareNamespace(SXMLSchemaInstNameSpace99Pre, XMLSchemaInstNameSpace);
  Result.DeclareNamespace(SSoapEncodingPre, SSoap11EncodingS5);
  Doc.DocumentElement := Result;
end;


function TSoapEnvelope.MakeBody(ParentNode: IXMLNode): IXMLNode;
begin
   Result := ParentNode.AddChild(SSoapNameSpacePre + ':' + SSoapBody, SSoapNameSpace);
end;

function TSoapEnvelope.MakeHeader(ParentNode: IXMLNode): IXMLNode;
begin
  Result := ParentNode.AddChild(SSoapNameSpacePre + ':' + SSoapHeader, SSoapNameSpace);
end;

function TSoapEnvelope.MakeFault(ParentNode: IXMLNode): IXMLNode;
begin
   Result := ParentNode.AddChild(SSoapNameSpacePre + ':' + SSoapFault, SSoapNameSpace);
end;

end.
