unit DispActnFld;

interface

uses DBAdapt, Classes, WebAdapt, WebForm, HTTPProd, WebComp;

type
  TBaseAdapterDisplayActionField = class(TAdapterDataDisplay, IGetControlRequirements)
  private
    FLayoutAttributes: TLayoutAttributes;
    function FormatCheckBox(const VarName, HTMLName: string): string;
  protected
    procedure AddAttributes(var Attrs: string);
    function ControlContent(Options: TWebContentOptions): string; override;
    function GetLayoutAttributes: TLayoutAttributes; override;
    function ImplContent(Options: TWebContentOptions; 
      ParentLayout: TLayout): string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TCustomAdapterDisplayActionField = class(TBaseAdapterDisplayActionField)
  end;

  TAdapterDisplayActionField = class(TCustomAdapterDisplayActionField)
  published
    property Style;
    property Custom;
    property StyleRule;
    property Caption;
    property CaptionAttributes;
    property FieldName;
    property CaptionPosition;
    property Align;
    property VAlign;
    property HideOptions;
  end;

implementation

uses SysUtils, MidItems;

{ TBaseAdapterDisplayActionField }

procedure TBaseAdapterDisplayActionField.AddAttributes(var Attrs: string);
begin
  AddQuotedAttrib(Attrs, sStyleAttr, Style);
  AddQuotedAttrib(Attrs, sClassAttr, StyleRule);
  AddCustomAttrib(Attrs, Custom);
end;

function TBaseAdapterDisplayActionField.ControlContent(
  Options: TWebContentOptions): string;
var
  VarName: string;
  HTMLName: string;
begin
  if hoHideAlways in HideOptions then
  begin
    Result := '';
    Exit;
  end;
  VarName := MakeAdapterVariableName(Self);
  if Varname <> '' then
  begin
    HTMLName := MakeAdapterHTMLName(VarName);
    Result := FormatCheckBox(VarName, HTMLName);
  end
  else
    Result := '';
end;

function TBaseAdapterDisplayActionField.FormatCheckBox(const VarName, HTMLName: string): string;
var
  Attrs: string;
begin
  AddAttributes(Attrs);
  Result := Format('<input ' + sTypeAttr + '="checkbox"%0:s ' + sNameAttr + '="<%%=%2:s%%>" ' + sValueAttr + '="%1:s" >',
                   [Attrs, Format(sFieldText, [VarName]),
                   HTMLName]);
end;

constructor TBaseAdapterDisplayActionField.Create(AOwner: TComponent);
begin
  inherited;
  FLayoutAttributes := TLayoutAttributes.Create;
end;

destructor TBaseAdapterDisplayActionField.Destroy;
begin
  inherited;
  FLayoutAttributes.Free;
end;

function TBaseAdapterDisplayActionField.GetLayoutAttributes: TLayoutAttributes;
begin
  with FLayoutAttributes do
  begin
    ControlAttributes := '';
    AddQuotedAttrib(ControlAttributes, sAlignAttr, HTMLAlignValues[Align]);
    AddQuotedAttrib(ControlAttributes, sVAlignAttr, HTMLVAlignValues[VAlign]);
  end;
  Result := FLayoutAttributes;
end;

function TBaseAdapterDisplayActionField.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  Intf: ILayoutWebContent;
  S: string;
begin
  S := ControlContent(Options);
  if S <> '' then
  begin
    if Supports(ParentLayout, ILayoutWebContent, Intf) then
      if Trim(Caption) = '' then
        Result := Intf.LayoutField(S,
          GetLayoutAttributes)
      else
        Result := Intf.LayoutLabelAndField(LabelContent, S,
          GetLayoutAttributes)
    else
      Result := LabelContent + S;
  end
  else
    Result := '';
end;

end.
 