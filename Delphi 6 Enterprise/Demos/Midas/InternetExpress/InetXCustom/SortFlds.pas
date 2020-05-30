unit SortFlds;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, PagItems, MidItems, MidComp;

type

  TSortTextColumn = class(TTextColumn, IFormatColumn, IScriptComponent)
  private
    FButtonCaption: string;
  protected
    function FormatColumnHeading(Options: TWebContentOptions): string;
    function FormatColumnData(const Content: string; Options: TWebContentOptions): string;
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements);
    function GetSubComponents: TObject;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ButtonCaption: string read FButtonCaption write FButtonCaption;
  end;

implementation

uses sysutils, MidProd;

resourcestring 
  sButtonCaption = 'Sort';

const 
  sSortFunctionName = 'SortXMLDisplay';
  sSortFunction =
   'function %0:s(xmld,name)'     + #13#10 +
   '{'                              + #13#10 +
   '  xmld.sort(name);'                   + #13#10 +
   '}'                             + #13#10;

constructor TSortTextColumn.Create(AOwner: TComponent);
begin
  inherited;
  ButtonCaption := sButtonCaption;
end;

function TSortTextColumn.FormatColumnData(const Content: string; Options: TWebContentOptions): string;
begin
  Result := MidItems.FormatColumnData(Self, Content);
end;

function TSortTextColumn.FormatColumnHeading(Options: TWebContentOptions): string;
var
  Attribs: string;
  Button: string;
  Events: string;
begin
  AddQuotedAttrib(Attribs, 'VALUE', ButtonCaption);
  if not (csDesigning in ComponentState) then
    Events := Format('onclick=''if(%3:s)%0:s(%1:s,"%2:s");''', [sSortFunctionName,
      GetXMLDisplayName, FieldName, sXMLReadyVar]);
  if GetXMLDisplayName <> '' then
    Button := Format('<INPUT TYPE=BUTTON %s %s>',
      [Attribs, Events]);
  Attribs := '';
  AddQuotedAttrib(Attribs, 'STYLE', CaptionAttributes.Style);
  AddCustomAttrib(Attribs, CaptionAttributes.Custom);
  AddQuotedAttrib(Attribs, 'CLASS', CaptionAttributes.StyleRule);
  Result := Format('<TH%s>%s%s</TH>'#13#10, [Attribs, Caption, Button]);
end;

function TSortTextColumn.GetSubComponents: TObject;
begin
  Result := nil;
end;

procedure TSortTextColumn.AddElements(AddIntf: IAddScriptElements);
begin
  inherited;
  AddIntf.AddFunction(sSortFunctionName, Format(sSortFunction, [sSortFunctionName]));
end;


end.
