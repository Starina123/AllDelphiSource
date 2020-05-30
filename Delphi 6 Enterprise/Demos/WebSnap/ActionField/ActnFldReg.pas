unit ActnFldReg;

interface

uses ActnFld, DispActnFld, WebComp, Classes, DesignIntf, DesignEditors, SiteComp, SysUtils,WebAdapt;

  procedure Register;

implementation

uses WebForm;

type
  TAdapterDisplayActionFieldHelper = class(TWebComponentsEditorHelper)
  protected
     function ImplCanAddClassHelper(AEditor: TComponent; AParent: TComponent; AClass: TClass): Boolean; override;
  end;

  TAdapterActionFieldNameProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

var
  AdapterDisplayActionFieldHelper: TAdapterDisplayActionFieldHelper;

procedure Register;
begin
  RegisterWebComponents([TAdapterDisplayActionField], AdapterDisplayActionFieldHelper);
  RegisterWebComponents([TDataSetAdapterDeleteRowField]);
  RegisterPropertyEditor(TypeInfo(string), TCustomAdapterDisplayActionField, 'FieldName', TAdapterActionFieldNameProperty); { do not localize }
end;

{ TAdapterDisplayActionFieldHelper }

function TAdapterDisplayActionFieldHelper.ImplCanAddClassHelper(AEditor,
  AParent: TComponent; AClass: TClass): Boolean;
begin
  Result := AEditor.InheritsFrom(TCustomAdapterCommandColumn);
end;

{ TAdapterActionFieldNameProperty }

function TAdapterActionFieldNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList, paSortList];
end;

procedure TAdapterActionFieldNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  Component: TComponent;
  Intf: IWebDataFields;
  ComponentList: TWebComponentList;
  NameIntf: IWebGetFieldName;
  Temp: IUnknown;
begin
  Component := GetComponent(0) as TComponent;
  Component := FindVariablesContainerInParent(Component);
  if Supports(IUnknown(Component), IWebDataFields, Intf) then
  begin
    ComponentList := Intf.GetVisibleFields;
    for i := 0 to ComponentList.Count - 1 do
    begin
      Component := ComponentList.WebComponents[I];
      if Supports(IUnknown(Component), IExecuteValue, Temp) and Supports(IUnknown(Component), IWebGetFieldName, NameIntf) then
        Proc(NameIntf.FieldName);
    end;
  end
  else
    Assert(False);
end;

initialization
  AdapterDisplayActionFieldHelper := TAdapterDisplayActionFieldHelper.Create;
finalization
  UnregisterWebComponents([TAdapterDisplayActionField]);
  UnregisterWebComponents([TDataSetAdapterDeleteRowField]);
  AdapterDisplayActionFieldHelper.Free;
end.
