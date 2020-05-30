unit ShowXML;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, MidComp, MidItems;

type
  TCustomShowXMLButton = class(TXMLButton, IScriptComponent)
  protected
    XMLMethodName: string;
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements);
    function GetSubComponents: TObject;
    { IWebContent implementation }
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
  end;

  TShowXMLButton = class(TCustomShowXMLButton)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Custom;
    property Style;
    property StyleRule;
    property Caption;
    property XMLBroker;
    property XMLUseParent;
  end;

  TShowDeltaButton = class(TCustomShowXMLButton)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Custom;
    property Style;
    property StyleRule;
    property Caption;
    property XMLBroker;
    property XMLUseParent;
  end;

implementation

uses sysutils, MidProd;

resourcestring 
  sShowXML = 'Show XML';
  sShowDelta = 'Show Delta';

procedure TCustomShowXMLButton.AddElements(
  AddIntf: IAddScriptElements);
begin
  AddIntf.AddIncludeFile('xmlshow.js');
end;

function TCustomShowXMLButton.GetSubComponents: TObject;
begin
  Result := nil;
end;

function TCustomShowXMLButton.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  Attrs: string;
  Intf: ILayoutWebContent;
  FormVarName: string;
  RowSetVarName: string;
begin
  AddQuotedAttrib(Attrs, 'NAME', Name);
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddQuotedAttrib(Attrs, 'VALUE', Self.Caption);
  AddCustomAttrib(Attrs, Custom);
  if Assigned(XMLData.XMLBroker) then
  begin
    FormVarName := XMLData.XMLBroker.SubmitFormVarName;
    RowSetVarName := XMLData.XMLBroker.RowSetVarName(nil);  // Row row set var name
  end;
  if not (coNoScript in Options.Flags) then
    Result :=
      Format('<INPUT TYPE=BUTTON %0:s onclick=''if(%3:s)ShowXML(%1:s.%2:s);''>'#13#10,
        [Attrs, RowSetVarName, XMLMethodName, sXMLReadyVar])
  else
    Result :=
      Format('<INPUT TYPE=BUTTON %0:s>'#13#10,
        [Attrs]);
  if Assigned(ParentLayout) and ParentLayout.GetInterface(ILayoutWebContent, Intf) then
    Result := Intf.LayoutButton(Result, GetLayoutAttributes);
end;

{ TShowXMLButton }

constructor TShowXMLButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultCaption := sShowXML;
  XMLMethodName := 'root';
end;

{ TShowDeltaButton }

constructor TShowDeltaButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultCaption := sShowDelta;
  XMLMethodName := 'getDelta()';
end;

{ Register procedure }


end.



