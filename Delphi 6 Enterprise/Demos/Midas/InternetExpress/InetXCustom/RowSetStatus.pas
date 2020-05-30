unit RowSetStatus;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, PagItems, MidItems, MidComp;

type
  TRowSetStatus = class(TWebDataDisplay, IScriptComponent)
  protected
    function ControlContent(Options: TWebContentOptions): string; override;
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements); virtual;
    function GetSubComponents: TObject;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses sysutils;

const 
  sXmlDisplayStatusFunctionName = 'xmlDisplayStatus';
  sXmlDisplayStatusFunction =
'function %0:s(src, fld)' + #13#10  +
'{' + #13#10   +
'this.src = src;' + #13#10  +
'this.fld = fld;' + #13#10   +
'src.regobj(this);' + #13#10   +
'this.refr=%1:s;' + #13#10   +
'}' + #13#10;

  sStatusRefrFunctionName = 'StatusRefr';
  sStatusRefrFunction =
'function %0:s(reason)' + #13#10  +
'{' + #13#10 +
'var p=this.src.pos+1,c=this.src.RowCnt;' + #13#10 +
'this.fld.value = ''Row '' + p + '' of '' + c;' + #13#10 +
'}' + #13#10;

  sStatusVar =
'var %0:s=new %1:s(%2:s, %3:s);' + #13#10 +
'%0:s.refr(0);' + #13#10;


{ TRowSetStatus }

procedure TRowSetStatus.AddElements(AddIntf: IAddScriptElements);
var
  VarName, RowSetName: string;
  HTMLForm: IHTMLForm;
  HTMLControl: string;
begin
  inherited;
  if AddIntf.AddFunction(sXMLDisplayStatusFunctionName, Format(sXmlDisplayStatusFunction,
    [sXMLDisplayStatusFunctionName, sStatusRefrFunctionName])) then
  begin
    AddIntf.AddFunction(sStatusRefrFunctionName, Format(sStatusRefrFunction, [sStatusRefrFunctionName]));
  end;
  RowSetName := GetXMLRowSetName;
  VarName := Format('%s_%s', [Name, RowSetName]);
  HTMLForm := GetHTMLForm;
  HTMLControl := Format('%s.%s', [HTMLForm.HTMLFormVarName, GetHTMLControlName]);
  AddIntf.AddVar(HTMLForm.HTMLFormVarName,
     Format('var %0:s = document.forms[''%1:s''];'#13#10,
      [HTMLForm.HTMLFormVarName, HTMLForm.HTMLFormName]));
  AddIntf.AddVar(VarName, Format(sStatusVar, [VarName, sXMLDisplayStatusFunctionName, GetXMLRowSetName, HTMLControl]));
end;

function TRowSetStatus.ControlContent(Options: TWebContentOptions): string;
var
  Attrs: string;
begin
  AddQuotedAttrib(Attrs, 'NAME', GetHTMLControlName);
  //AddIntAttrib(Attrs, 'SIZE', DisplayWidth);
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddCustomAttrib(Attrs, Custom);
  Result := Format('<INPUT TYPE=TEXT%0:s>', [Attrs]);
end;

constructor TRowSetStatus.Create(AOwner: TComponent);
begin
  inherited;

end;

function TRowSetStatus.GetSubComponents: TObject;
begin
  Result := nil;
end;

end.
