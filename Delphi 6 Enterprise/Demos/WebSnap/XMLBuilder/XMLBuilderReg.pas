unit XMLBuilderReg;

interface

uses
  Windows, Messages, SysUtils, Classes, WebComp, XMLBuilderComp;

procedure Register;

implementation

uses inetreg, SiteComp, DesignIntf, SItemEdt, WCompReg, WCmpEdit, XMLAdapterBuilder, WebAdapt, SiteReg, WProdReg;

type
  TWebSiteItemsPropertyEditor = class(TWebPageItemsPropertyEditor)
  protected
    function GetEditorClass: TPageItemsEditorClass; override;
  end;

  TAdapterComponentProperty = class(TInterfaceComponentProperty)
  protected
    function GetGuid: TGuid; override;
  end;

  TXMLTypeGroupProperty = class(TInterfaceComponentProperty)
  protected
    function GetGuid: TGuid; override;
  end;

{ TAdapterComponentProperty }

function TAdapterComponentProperty.GetGuid: TGuid;
begin
  Result := IIdentifyAdapter;
end;

procedure Register;
begin
  RegisterComponents('WebSnap Demos', [TAdapterXMLBuilder, TXSLTemplate]);
  RegisterComponentEditor(TCustomXMLBuilder, TSimpleWebItemsComponentEditor);
  RegisterPropertyEditor(TypeInfo(TWebComponentList), TCustomXMLBuilder,
    '', TSimpleWebItemsPropertyEditor);
  RegisterWebComponents([TXMLForm, TXMLFieldGroup, TXMLGrid, TXMLCommandGroup, TXMLCommandColumn,
    TXMLAdapterActionItem, TXMLAdapterFieldItem, TXMLAdapterColumnItem, TXMLAdapterEditColumnItem, TXMLAdapterErrors]);
  RegisterPropertyEditor(TypeInfo(TComponent), TAbstractXMLAdapterTypeGroup, 'Adapter', TAdapterComponentProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(TComponent), TAbstractXMLAdapterReferenceGroup, 'XMLComponent', TXMLTypeGroupProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(TComponent), TCustomXMLAdapterErrors, 'Adapter', TAdapterComponentProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(string), TBaseXMLAdapterFieldItem, 'FieldName', TAdapterFieldNameProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(string), TCustomXMLAdapterActionItem, 'ActionName', TAdapterActionNameProperty); { do not localize }
  RegisterModulePageProducers([TAdapterXMLBuilder], '', NoScriptEngines, sNoTemplateFile);
  RegisterPropertyEditor(TypeInfo(string), TAbstractXMLAdapterTypeGroup, 'AdapterMode',  { do not localize }
    TAdapterModeProperty);
end;

{ TWebSiteItemsPropertyEditor }

function TWebSiteItemsPropertyEditor.GetEditorClass: TPageItemsEditorClass;
begin
  Result := TSiteItemsEditor;
end;

{ TXMLComponentProperty }

function TXMLTypeGroupProperty.GetGuid: TGuid;
begin
  Result := IXMLAdapterTypeGroup;
end;

initialization
finalization
  UnregisterWebComponents([TXMLForm, TXMLFieldGroup, TXMLGrid, TXMLCommandGroup, TXMLCommandColumn,
   TXMLAdapterActionItem,
    TXMLAdapterFieldItem, TXMLAdapterColumnItem, TXMLAdapterEditColumnItem, TXMLAdapterErrors]);
  UnregisterModulePageProducers([TAdapterXMLBuilder]);
end.
