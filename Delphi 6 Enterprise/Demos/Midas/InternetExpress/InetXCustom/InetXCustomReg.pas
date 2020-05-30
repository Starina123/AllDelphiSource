unit InetXCustomReg;

interface

procedure Register;

implementation

uses QueryComps, ShowXML, WebComp, ReconcileProd, LinkFlds, SortFlds,
  Classes, ImgButtons, RowSetStatus, MidItems, WebCombo,
  CustLayout, WCompReg, Designintf, FieldAttr, MidProd;

type
  TImgButtonsEditorHelper = class(TWebComponentsEditorHelper)
  protected
     function ImplCanAddClassHelper(AEditor: TComponent; AParent: TComponent; AClass: TClass): Boolean; override;
  end;

type
  TRowSetStatusEditorHelper = class(TWebComponentsEditorHelper)
  protected
     function ImplCanAddClassHelper(AEditor: TComponent; AParent: TComponent; AClass: TClass): Boolean; override;
  end;

type
  TRecCssClassProperty = class(TCssClassProperty)
  protected
    function FindProducer: TComponent; override;
  end;

var
  ImgButtonsEditorHelper: TImgButtonsEditorHelper;
  RowSetStatusEditorHelper: TRowSetStatusEditorHelper;

{ TImgButtonsEditorHelper }

function TImgButtonsEditorHelper.ImplCanAddClassHelper(AEditor: TComponent; AParent: TComponent;
  AClass: TClass): Boolean;
var
  I: Integer;
  List: IGetWebComponentList;
begin
  Result := False;
  if AEditor.InheritsFrom(TImgDataNavigator) then
  begin
    Result := True;
    AParent.GetInterface(IGetWebComponentList, List);
    with (List.GetComponentList as TWebComponentList) do
      // Don't allow duplicates
      for I := 0 to Count - 1 do
        if WebComponents[I].ClassType = AClass then
        begin
          Result := False;
          break;
        end
  end
end;

{ TRowSetStatusEditorHelper }

function TRowSetStatusEditorHelper.ImplCanAddClassHelper(AEditor,
  AParent: TComponent; AClass: TClass): Boolean;
var
  Component: TComponent;
  Intf: IXMLDisplay;
begin
  // Can insert this under a component that defines a row set.
  Component := AParent;
  while Assigned(Component) and
    (not Component.GetInterface(IXMLDisplay, Intf)) do
    Component := Component.GetParentComponent;
  Result := Assigned(Component);
end;

function TRecCssClassProperty.FindProducer: TComponent;
var
  Component: TComponent;
begin
  if GetComponent(0) is TReconcileColumn then
    Component := TReconcileColumn(GetComponent(0)).CaptionAttributes.Parent
  else
    Component := nil;
  while Assigned(Component) and
    not (Component is TCustomMidasPageProducer) do
    Component := Component.GetParentComponent;
  Result := Component;
end;

procedure Register;
begin
  RegisterComponents('InternetExpress', [  { do not localize }
    TReconcilePageProducer
  ]);
  RegisterNonActiveX([TReconcilePageProducer], axrIncludeDescendants);

  RegisterWebComponents([
    TPromptQueryButton, TSubmitValueButton, TQueryPassword,
    TQueryHiddenText]);
  RegisterWebComponents([
    TShowXMLButton, TShowDeltaButton]);
  RegisterWebComponents([
    TFieldLink, TLinkColumn
    ]);
  RegisterWebComponents([
    TSortTextColumn
    ]);
  RegisterWebComponents([
    TImgDataNavigator
    ]);
  RegisterWebComponents([
    TImgFirstButton, TImgPriorPageButton, TImgPriorButton, TImgNextButton,
    TImgNextPageButton, TImgLastButton, TImgInsertButton, TImgDeleteButton,
    TImgUndoButton, TImgPostButton,
    TImgApplyUpdatesButton], ImgButtonsEditorHelper);
  RegisterWebComponents([TRowSetStatus],
     RowSetStatusEditorHelper);
  RegisterWebComponents([TFieldTextAttr, TTextColumnAttr]);

  RegisterWebComponents([TQuerySearchSelectOptions]);
  RegisterWebComponents([TTitleLayoutGroup, TTitleDataForm]);

  RegisterPropertyEditor(TypeInfo(string), TSearchSelectOptionsInput, 'ValuesField', TItemsFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TSearchSelectOptionsInput, 'ItemsField', TItemsFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TReconcileColumn, 'StyleRule', TRecCssClassProperty); { do not localize }
  RegisterPropertyEditor(TypeInfo(string), TWebLink, 'KeyFieldName', TDataSetViewFieldProperty); { do not localize }
end;

initialization
  ImgButtonsEditorHelper := TImgButtonsEditorHelper.Create;
  RowSetStatusEditorHelper := TRowSetStatusEditorHelper.Create;
finalization
  UnRegisterWebComponents([
    TPromptQueryButton, TSubmitValueButton, TQueryPassword,
    TQueryHiddenText]);
  UnRegisterWebComponents([
    TShowXMLButton, TShowDeltaButton]);
  UnRegisterWebComponents([
    TFieldLink, TLinkColumn
    ]);
  UnRegisterWebComponents([
    TSortTextColumn
    ]);
  UnRegisterWebComponents([
    TImgDataNavigator
    ]);
  UnRegisterWebComponents([
    TImgFirstButton, TImgPriorPageButton, TImgPriorButton, TImgNextButton,
    TImgNextPageButton, TImgLastButton, TImgInsertButton, TImgDeleteButton,
    TImgUndoButton, TImgPostButton,
    TImgApplyUpdatesButton]);
  UnRegisterWebComponents([
    TRowSetStatus]);
  UnRegisterWebComponents([
    TQuerySearchSelectOptions]);
  UnRegisterWebComponents([
    TTitleLayoutGroup, TTitleDataForm]);
  UnRegisterWebComponents([
    TTextColumnAttr, TFieldTextAttr]);
  ImgButtonsEditorHelper.Free;
  RowSetStatusEditorHelper.Free;

end.
