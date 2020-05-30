unit LinkFlds;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, MidComp, PagItems, MidItems;

type
  TWebLink = class(TWebDataDisplay, IScriptComponent, IValidateField)
  private
    FText: string;
    FAction: string;
    FOpenWindow: Boolean;
    FKeyFieldName: string;
  protected
    function ControlContent(Options: TWebContentOptions): string; override;
    function GetText: string;
    procedure SetKeyFieldName(const Value: string);
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements); virtual;
    function GetSubComponents: TObject;
    { IValidateField }
    function ValidateField(DataSet: IMidasWebDataSet; AddIntf: IAddScriptElements): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    property Action: string read FAction write FAction;
    property Caption;
    property CaptionAttributes;
    property CaptionPosition;
    property Text: string read GetText write FText;
    property KeyFieldName: string read FKeyFieldName write SetKeyFieldName;
    property OpenWindow: Boolean read FOpenWindow write FOpenWindow default True;
  end;

  TLinkColumn = class(TWebLink)
  public
    class function IsColumn: Boolean; override;
  published
    property Text;
    property Caption;
    property CaptionAttributes;
    property Action;
    property OpenWindow;
    property KeyFieldName;
  end;

  TFieldLink = class(TWebLink)
  published
    property Caption;
    property CaptionAttributes;
    property CaptionPosition;
    property Text;
    property Action;
    property OpenWindow;
  end;

implementation

uses sysutils, MidProd;

const 
  sLinkFunctionName = 'GoLink';
  // TODO:  This function does not set the current row of the rowset.  Clicking
  // on a link in a grid will use values from the focus row which may not be the
  // focus row.
  sLinkFunction =
   'function %0:s(rs,fname,action,open)'     + #13#10 +
   '{'                             + #13#10 +
   '  var s;'                   + #13#10 +
   '  var i;'                    + #13#10 +
   '  if (rs==null) exit;'        + #13#10 +
   '  if (action.indexOf("?") == -1)' + #13#10 +
   '    s = action + "?";'           + #13#10 +
   '  else'           + #13#10 +
   '    s = action + "&";'           + #13#10 +
   '  for (i=0; i<rs.FieldCnt; i++)' + #13#10 +
   '  {'                             + #13#10 +
   '    var f;'                      + #13#10 +
   '    f = rs.Fields.Fieldx[i];'    + #13#10 +
   '    if (f.name == fname)'        + #13#10 +
   '    {'                           + #13#10 +
   '      s = s + f.name + "=" + f.Value();' + #13#10 +
   '      break;'                    + #13#10 +
   '    }'                           + #13#10 +
   '  }'                             + #13#10 +
   '  s = s.replace(/ /g, "+");'         + #13#10 +
   '  if (open)'                     + #13#10 +
   '    window.open(s);'       + #13#10 +
   '  else'       + #13#10 +
   '    location = s;'       + #13#10 +
   '}'                             + #13#10;


{ TWebLink }

resourcestring 
  sLinkCaption = 'Link';

function TWebLink.ControlContent(Options: TWebContentOptions): string;
const
  truefalse: array[Boolean] of string =('false', 'true');
var
  Attrs: string;
  Events: string;
begin
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddCustomAttrib(Attrs, Custom);
  if (not (coNoScript in Options.Flags)) then
    Events := Format(' onclick="%s;return false;"',
      [Format('if(%s)%s(%s,''%s'',''%s'',%s)', [sXMLReadyVar, sLinkFunctionName,
        GetXMLRowSetName, KeyFieldName, Action, truefalse[OpenWindow]])])
  else
    Events := ' onclick="return false;"';
  // Note that HREF is ignored because onclick always returns false.
  Result := Format('<A HREF="%0:s"%1:s%2:s>%3:s</A>', [Action, Attrs, Events, Text]);
end;

constructor TWebLink.Create(AOwner: TComponent);
begin
  inherited;
  Caption := sLinkCaption;
  OpenWindow := True;
end;

function TWebLink.GetText: string;
begin
  if FText = '' then
    Result := ClassName
  else
    Result := FText;
end;

procedure TWebLink.AddElements(AddIntf: IAddScriptElements);
begin
  inherited;
  AddIntf.AddFunction(sLinkFunctionName, Format(sLinkFunction, [sLinkFunctionName]));
end;

function TWebLink.GetSubComponents: TObject;
begin
  Result := nil;
end;

procedure TWebLink.SetKeyFieldName(const Value: string);
var
  Intf: IValidateFields;
  Component: TComponent;
begin
  if (AnsiCompareText(Value, FKeyFieldName) <> 0) then
  begin
    FKeyFieldName := Value;
    if [csLoading, csDesigning] * ComponentState <> [] then
    begin
      Component := GetParentComponent;
      while Assigned(Component) and
       (not Component.GetInterface(IValidateFields, Intf)) do
       Component := Component.GetParentComponent;
      if Assigned(Component) then
        Intf.EnableValidateFields := True;
    end;
  end;
end;

resourcestring
  sKeyFieldNameBlank = '%s.KeyFieldName = ''''';
  sKeyFieldNotFound = '%0:s: KeyField "%1:s" not found';

function TWebLink.ValidateField(DataSet: IMidasWebDataSet;
  AddIntf: IAddScriptElements): Boolean;
  procedure AddError(Value: string);
  begin
    AddIntf.AddError(Value);
    Result := False;
  end;
begin
  Result := True;
  if KeyFieldName = '' then
    AddError(Format(sKeyFieldNameBlank, [Name]))
  else if Assigned(DataSet) then
    if DataSet.Fields.FindField(KeyFieldName) = nil then
      AddError(Format(sKeyFieldNotFound, [Name, KeyFieldName]));
end;

{ TLinkColumn }

class function TLinkColumn.IsColumn: Boolean;
begin
  Result := True;
end;

end.
