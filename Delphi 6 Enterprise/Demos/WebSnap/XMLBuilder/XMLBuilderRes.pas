unit XMLBuilderReg;

interface

uses
  Windows, Messages, SysUtils, Classes, WebComp, XMLBuilderComp;

procedure Register;

implementation

uses inetreg, SiteComp, DesignIntf, SItemEdt, WCompReg, WCmpEdit, XMLAdapterBuilder;

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
  RegisterComponents('WebSnap', [TXMLBuilder]);
  RegisterComponentEditor(TCustomXMLBuilder, TSimpleWebItemsComponentEditor);
  RegisterPropertyEditor(TypeInfo(TWebComponentList), TCustomXMLBuilder,
    '', TSimpleWebItemsPropertyEditor);
  RegisterWebComponents([TXMLForm, TXMLFieldGroup, TXMLGrid, TXMLCommandGroup, TXMLCommandColumn,
    TXMLAdapterActionItem, TXMLAdapterFieldItem, TXMLAdapterColumnItem, TXMLAdapterErrors, TXMLApplicationInfo]);
  RegisterPropertyEditor(TypeInfo(TComponent), TAbstractXMLAdapterTypeGroup, 'Adapter', TAdapterComponentProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(TComponent), TAbstractXMLAdapterReferenceGroup, 'XMLComponent', TXMLTypeGroupProperty); { do not localize }
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
    TXMLAdapterFieldItem, TXMLAdapterColumnItem, TXMLAdapterErrors, TXMLApplicationInfo]);
end.
