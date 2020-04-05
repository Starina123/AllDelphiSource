{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompFMXReg;

interface

procedure Register;

implementation

uses DsnConst, System.UITypes, System.Classes, Fmx.Bind.Navigator, Data.Bind.Consts, Fmx.Bind.DBLinks,
  // Initialization
  Fmx.Bind.DBEngExt, Fmx.Bind.Editors, BindCompReg, Data.Bind.Components, DesignIntf, FMX.Types,
  BindCompDsnResStrs, System.Generics.Collections, Data.Bind.DBLinks, BindCompNewDBLinkForm, Data.Bind.DBScope,
  System.Character, Data.DB,
  FMX.Controls, FMX.Dialogs, FMX.Edit, FMX.Layouts, FMX.ListBox,
  FMX.Memo,  FMX.Grid, VCL.Forms, DesignEditors, System.TypInfo, System.SysUtils,
  BindCompDesigners, BindCompDBReg;

type

  TBindFMXDBControlSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TBindDBControlProperty = class(TComponentProperty)
  private
    FTempStrings: TStrings;
    procedure AddTempString(const S: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TBindDBLinkDialogFactory = class(TInterfacedObject, IBindCompFactory)
  private
    function AnySupportedBindings(
      AContext: IBindCompFactoryContext): Boolean;
    function GetSupportedBinding(
      AContext: IBindCompFactoryContext): TContainedBindCompClass;
    function HasExistingDBLink(AContext: IBindCompFactoryContext): Boolean;
  protected
    function Enabled(AContext: IBindCompFactoryContext): Boolean;
    function GetCommandText(AContext: IBindCompFactoryContext): string;
    procedure Execute(AContext: IBindCompFactoryExecuteContext);
  public
    constructor Create;

  end;

  TDBBindLinkAssocations = class
  private
    class var FAssociations: TDictionary<
      TContainedBindCompClass, TList<TComponentClass>>;
  public
    class constructor Create;
    class destructor Destroy;
    class function SupportedBindings(
      AControl: TComponent): TArray<TContainedBindCompClass>; static;
    class procedure AddAssociation(ABindCompType: TContainedBindCompClass;
      AControlType: TComponentClass);
    class procedure AddAssociations(
      const ABindCompTypes: array of TContainedBindCompClass;
      const AControlTypes: array of TComponentClass);
    class procedure RemoveAssociations(
      const ABindCompTypes: array of TContainedBindCompClass);
    class procedure RemoveAssociation(
      ABindCompType: TContainedBindCompClass);
    class function SupportsControl(
      ABindLink: TContainedBindComponent;
      AControl: TComponent;
      out AHasAssociations: Boolean): Boolean; overload;
    class function SupportsControl(
      ABindLinkClass: TContainedBindCompClass;
      AControl: TComponent;
      out AHasAssociations: Boolean): Boolean; overload;


  end;

procedure RegisterDBBindLinkAssociations(
  const ABindCompTypes: array of TContainedBindCompClass;
  const AControlTypes: array of TComponentClass); forward;

procedure RegisterDBBindLinkAssociations(
  const ABindCompTypes: array of TContainedBindCompClass;
  const AControlTypes: array of TComponentClass);
begin
  TDBBindLinkAssocations.AddAssociations(ABindCompTypes,
    AControlTypes);
end;

class procedure TDBBindLinkAssocations.AddAssociation
  (ABindCompType: TContainedBindCompClass; AControlType: TComponentClass);
var
  LList: TList<TComponentClass>;
begin
  if not FAssociations.TryGetValue(ABindCompType,
    LList) then
  begin
    LList := TList<TComponentClass>.Create;
    FAssociations.Add(ABindCompType, LList);
  end;
  LList.Add(AControlType);
end;


class procedure TDBBindLinkAssocations.AddAssociations
  (const ABindCompTypes: array of TContainedBindCompClass; const AControlTypes: array of TComponentClass);
var
  LBindCompClass: TContainedBindCompClass;
  LControlClass: TComponentClass;
begin
  for LBindCompClass in ABindCompTypes do
    for LControlClass in AControlTypes do
      TDBBindLinkAssocations.AddAssociation(LBindCompClass,
        LControlClass);
end;

{ TDBBindLinkAssocations }

class constructor TDBBindLinkAssocations.Create;
begin
  FAssociations := TObjectDictionary<
      TContainedBindCompClass, TList<TComponentClass>>.Create([doOwnsValues]);

end;

class destructor TDBBindLinkAssocations.Destroy;
begin
  FAssociations.Free;

end;

class procedure TDBBindLinkAssocations.RemoveAssociation(
  ABindCompType: TContainedBindCompClass);
begin
  if FAssociations.ContainsKey(ABindCompType) then
    FAssociations.Remove(ABindCompType);

end;

class procedure TDBBindLinkAssocations.RemoveAssociations(
  const ABindCompTypes: array of TContainedBindCompClass);
var
  LBindCompClass: TContainedBindCompClass;
begin
  for LBindCompClass in ABindCompTypes do
    RemoveAssociation(LBindCompClass);
end;

class function TDBBindLinkAssocations.SupportsControl(
  ABindLinkClass: TContainedBindCompClass; AControl: TComponent;
  out AHasAssociations: Boolean): Boolean;
var
  LList: TList<TComponentClass>;
  LControlClass: TComponentClass;
begin
  AHasAssociations := False;
  Result := False;
  if FAssociations.TryGetValue(ABindLinkClass,
    LList) then
  begin
    AHasAssociations := True;
    for LControlClass in LList do
    begin
      if AControl.ClassType.InheritsFrom(LControlClass) then
        Exit(True);
    end;
  end;
end;

class function TDBBindLinkAssocations.SupportsControl(
  ABindLink: TContainedBindComponent; AControl: TComponent;
  out AHasAssociations: Boolean): Boolean;
//var
////  LList: TList<TComponentClass>;
//  LControlClass: TComponentClass;
begin
  Result := SupportsControl(TContainedBindCompClass(ABindLink.ClassType),
    AControl, AHasAssociations);
end;

class function TDBBindLinkAssocations.SupportedBindings(
  AControl: TComponent): TArray<TContainedBindCompClass>;
var
//  LList: TList<TComponentClass>;
  LControlClass: TComponentClass;
  LResult: TList<TContainedBindCompClass>;
  LPair: TPair<TContainedBindCompClass, TList<TComponentClass>>;
begin
  LResult := TList<TContainedBindCompClass>.Create;
  try
    for LPair in FAssociations do
    begin
      for LControlClass in LPair.Value do
      begin
        if AControl.ClassType.InheritsFrom(LControlClass) then
          LResult.Add(LPair.Key);
      end;
    end;
    Result := LResult.ToArray;
  finally
    LResult.Free;
  end;
end;

procedure UnregisterDBBindLinkAssociations(
  const ABindCompTypes: array of TContainedBindCompClass);
var
  LBindCompClass: TContainedBindCompClass;
begin
  for LBindCompClass in ABindCompTypes do
    TDBBindLinkAssocations.RemoveAssociations(LBindCompClass)
end;


{ TBindDBLinkDialogFactory }

constructor TBindDBLinkDialogFactory.Create;
begin
  //
end;

function TBindDBLinkDialogFactory.Enabled(
  AContext: IBindCompFactoryContext): Boolean;
var
  LActiveClassGroup, LClassGroup: TPersistentClass;
begin
                                            
  LActiveClassGroup := (AContext.Designer as IDesigner).ActiveClassGroup;
  LClassGroup := System.Classes.ClassGroupOf(TBindDBEditLink);
  Result := LActiveClassGroup.InheritsFrom(LClassGroup);
  if Result then
    Result := AnySupportedBindings(AContext) and
      not HasExistingDBLink(AContext);
end;

function CrunchFieldName(FieldName: string): string;
  function AlphaNumeric(C: Char): Boolean; inline;
  begin
    Result := TCharacter.IsLetterOrDigit(C) or (C = '_');
  end;
var
  I: Integer;
begin
  I := 1;
  while I <= Length(FieldName) do
  begin
    if AlphaNumeric(FieldName[I]) then
      Inc(I)
    else
      Delete(FieldName, I, 1);
  end;
  Result := FieldName;
end;

function TBindDBLinkDialogFactory.GetSupportedBinding(AContext: IBindCompFactoryContext):
  TContainedBindCompClass;
var
  LSupportedBindings: TArray<TContainedBindCompClass>;
begin
  LSupportedBindings :=
    TDBBindLinkAssocations.SupportedBindings(
      AContext.ControlComponent);
    if Length(LSupportedBindings) = 0 then
      //LClass := TBindDBTextLink
      Result := nil
    else
    if Length(LSupportedBindings) > 1 then
    begin
                               
      Result := LSupportedBindings[0];
    end
    else
    begin
      Result := LSupportedBindings[0];
    end;
end;


function TBindDBLinkDialogFactory.AnySupportedBindings(AContext: IBindCompFactoryContext):
  Boolean;
var
  LSupportedBindings: TArray<TContainedBindCompClass>;
begin
  LSupportedBindings :=
    TDBBindLinkAssocations.SupportedBindings(
      AContext.ControlComponent);
  Result := Length(LSupportedBindings) > 0;
end;


type
  THasExistingDBLink = class
  private
    FStrings: TStrings;
    procedure AddString(const S: string);
  public
    constructor Create;
    destructor Destroy; override;
    function HasExistingDBLink(ADesigner: IDesigner; AControl: TComponent): Boolean;
  end;

constructor THasExistingDBLink.Create;
begin
  FStrings := TStringList.Create;
end;

procedure THasExistingDBLink.AddString(const S: string);
begin
  FStrings.Add(S);
end;

function  THasExistingDBLink.HasExistingDBLink(ADesigner: IDesigner; AControl: TComponent): Boolean;
var
  S: string;
  LDataBinding: TBaseBindDBControlLink;
begin
  FStrings.Clear;
  ADesigner.GetComponentNames(GetTypeData(TypeInfo(TBaseBindDBControlLink)), AddString);
  for S in FStrings do
  begin
    LDataBinding := TBaseBindDBControlLink(ADesigner.GetComponent(S));
    if LDataBinding.ControlComponent = AControl then
      Exit(True);
  end;
  Result := False;
end;

destructor THasExistingDBLink.Destroy;
begin
  inherited;
  FStrings.Free;
end;


function TBindDBLinkDialogFactory.HasExistingDBLink(AContext: IBindCompFactoryContext): Boolean;
var
//  S: string;
//  LDataBinding: TBaseBindDBControlLink;
  LDesigner: IDesigner;
begin
  LDesigner := AContext.Designer as IDesigner;
  with THasExistingDBLink.Create do
  try
    Result := HasExistingDBLink(LDesigner, AContext.ControlComponent);
  finally
    Free;
  end;
//  FTempStringList := TStringList.Create;
//  try
//    LDesigner.GetComponentNames(GetTypeData(TypeInfo(TBaseBindDBControlLink)), AddTempString);
//    for S in FTempStringList do
//    begin
//      LDataBinding := TBaseBindDBControlLink(LDesigner.GetComponent(S));
//      if LDataBinding.ControlComponent = AContext.ControlComponent then
//        Exit(True);
//    end;
//  finally
//    FreeAndNil(FTempStringList);
//  end;
//  Result := False;
end;

procedure TBindDBLinkDialogFactory.Execute(AContext: IBindCompFactoryExecuteContext);
const
  sDBLink = 'DBLink';
var
  LForm: TNewDBLinkForm;

  function CreateBindScopeDB(ADataSource: TDataSource): TCustomBindScopeDB;
  var
    LScope: TCustomBindScopeDB;
  begin
    LScope := TBindScopeDB.Create(AContext.Owner);
    //Offset from DataSource component (Low Word = Left, High Word = Top)
    if Assigned(AContext.Owner) then
    begin
      LScope.DesignInfo := ADataSource.DesignInfo;
      LScope.DesignInfo := LScope.DesignInfo + (10 shl 16) + 10;
      AContext.Owner.InsertComponent(LScope);
    end;
    LScope.Name := AContext.UniqueName(LScope.ClassType.ClassName);
    LScope.DataSource := ADataSource;
    Result := LScope;
  end;

  procedure CreateFieldLink(AClass: TContainedBindCompClass);
  var
    LDBLink: TBaseBindDBFieldLink;
    LField: TDBLinkField;
    LScope: TCustomBindScopeDB;
  begin
    LDBLink := TBaseBindDBFieldLink(AClass.Create(AContext.Owner));
    LDBLink.Category := SDataBindingsCategory_DBLinks;
    LDBLink.BindingsList := AContext.BindingsList;
    LDBLink.ControlComponent := AContext.ControlComponent;
//      AContext.BindCompCreated(LDBLink);
    LField := LForm.SelectedField;
    if LField.Source.DataSource <> nil then
    begin
      Assert(LField.Source.BindScopeDB = nil);
      LScope := CreateBindScopeDB(LField.Source.DataSource);
    end
    else
      LScope := LField.Source.BindScopeDB;
    LDBLink.FieldName := LField.Name;
    LDBLink.Name := AContext.UniqueName(sDBLink +
        AContext.ControlComponent.Name + CrunchFieldName(LField.Name));
    LDBLink.DataSource := LScope;
    AContext.BindCompCreated(LDBLink);
  end;

  procedure CreateGridLink(AClass: TContainedBindCompClass);
  var
    LDBLink: TBaseBindDBGridLink;
    LSource: TDBLinkDataSource;
    LScope: TCustomBindScopeDB;
  begin
    LDBLink := TBaseBindDBGridLink(AClass.Create(AContext.Owner));
    LDBLink.Category := SDataBindingsCategory_DBLinks;
    LDBLink.BindingsList := AContext.BindingsList;
    LDBLink.ControlComponent := AContext.ControlComponent;
    LSource := LForm.SelectedDataSource;
    if LSource.DataSource <> nil then
    begin
      Assert(LSource.BindScopeDB = nil);
      LScope := CreateBindScopeDB(LSource.DataSource);
    end
    else
      LScope := LSource.BindScopeDB;
    LDBLink.Name := AContext.UniqueName(sDBLink +
        AContext.ControlComponent.Name);
    LDBLink.DataSource := LScope;
    AContext.BindCompCreated(LDBLink);
  end;

var
  LClass: TContainedBindCompClass;
  LSupportedBindings: TArray<TContainedBindCompClass>;
begin
  LForm := TNewDBLinkForm.Create(Application);
  try
    LClass := GetSupportedBinding(AContext);
    Assert(LClass <> nil);
    if LClass = nil then
      Exit;
    LForm.DesignerIntf := AContext.Designer as IDesigner;
    if LClass.InheritsFrom(TBaseBindDBGridLink) then
      LForm.Options := [optRequiresSource];
    if LForm.ShowModal = mrOK then
    begin
      if LClass.InheritsFrom(TBaseBindDBFieldLink) then
      begin
        CreateFieldLink(LClass);
      end
      else if LClass.InheritsFrom(TBaseBindDBGridLink) then
      begin
        CreateGridLink(LClass);
      end
      else
        Assert(False);
      Assert(Length(LSupportedBindings) <= 1);
    end;
  finally
    LForm.Free;
  end;
end;

function TBindDBLinkDialogFactory.GetCommandText(
  AContext: IBindCompFactoryContext): string;
var
  LClass: TContainedBindCompClass;
begin
  LClass := Self.GetSupportedBinding(AContext);
  if (LClass <> nil) and LClass.InheritsFrom(TBaseBindDBGridLink) then
    Result := SNewDBLinkDataSourceDlgCommand
  else
    Result := SNewDBLinkFieldDlgCommand;
end;

{ TBindDBControlProperty }


procedure TBindDBControlProperty.AddTempString(const S: string);
begin
  FTempStrings.Add(S);
end;

procedure TBindDBControlProperty.GetValues(Proc: TGetStrProc);
var
  LComponent: TComponent;
  LHasAssociations: Boolean;
  LBindComponent: TContainedBindComponent;
  S: string;
begin
  if not (GetComponent(0) is TContainedBindComponent) then
  begin
    inherited GetValues(Proc);
    Exit;
  end;
  LBindComponent := TContainedBindComponent(GetComponent(0));
  FTempStrings := TStringList.Create;
  try
    Designer.GetComponentNames(GetTypeData(GetPropType), AddTempString);
    for S in FTempStrings do
    begin
      LComponent := Designer.GetComponent(S) as TComponent;
      if TDBBindLinkAssocations.SupportsControl(LBindComponent,
        LComponent, LHasAssociations) or (not LHasAssociations) then
        Proc(S);
    end;
  finally
    FTempStrings.Free;
  end;

end;

type
  TBindDBFieldLinkDesignerFMX_NoParse = class(TBindDBFieldLinkDesigner_NoParse)
  protected
    function CanBindComponent(ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean; override;
  end;

  TBindDBFieldLinkDesignerFMX = class(TBindDBFieldLinkDesigner)
  protected
    function CanBindComponent(ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean; override;
  end;

type
  TContainedBindComponentSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

procedure TContainedBindComponentSelectionEditor.RequiresUnits(Proc: TGetStrProc);
var
  I: Integer;
  LContainedBindComponent: TContainedBindComponent;
begin
  for I := 0 to Designer.Root.ComponentCount - 1 do
  begin
    if Designer.Root.Components[i] is TContainedBindComponent then
    begin
      LContainedBindComponent := TContainedBindComponent(Designer.Root.Components[i]);
      if Assigned(LContainedBindComponent.ControlComponent) then
        if LContainedBindComponent.ControlComponent is TControl then
        begin
          Proc('Fmx.Bind.Editors');
          Exit;
        end;
    end;
  end;
end;


procedure Register;
const
  sFieldName = 'FieldName';
begin
  RegisterComponents(SBindingComponentsCategory, [TBindNavigator]);

  RegisterNoIcon([TBindDBEditLink, TBindDBTextLink, TBindDBListLink,
    TBindDBImageLink, TBindDBMemoLink, TBindDBCheckLink, TBindDBGridLink]);
  RegisterBindComponents(SDataBindingsCategory_DBLinks,
    [TBindDBEditLink, TBindDBTextLink, TBindDBListLink,
    TBindDBImageLink, TBindDBMemoLink, TBindDBCheckLink, TBindDBGridLink]);
  GroupDescendentsWith(TBaseBindDBFieldControlLink, TFmxObject);
  GroupDescendentsWith(TBaseBindDBGridControlLink, TFmxObject);

  RegisterDBBindLinkAssociations(
    [TBindDBEditLink],
    [TCustomEdit]);
  RegisterDBBindLinkAssociations(
    [TBindDBTextLink],
    [TLabel]);
  RegisterDBBindLinkAssociations(
    [TBindDBListLink],
    [TListBox, TComboBox]);
  RegisterDBBindLinkAssociations(
    [TBindDBMemoLink],
    [TMemo]);
  RegisterDBBindLinkAssociations(
    [TBindDBCheckLink],
    [TCheckBox]);
  RegisterDBBindLinkAssociations(
    [TBindDBImageLink],
    [TImageControl]);
  RegisterDBBindLinkAssociations(
    [TBindDBGridLink],
    //[TStringGrid, TGrid]);
    [TStringGrid]);

  RegisterBindCompDesigner(TCustomBindDBTextLink, TBindDBFieldLinkDesignerFMX_NoParse.Create);
  RegisterBindCompDesigner(TCustomBindDBImageLink, TBindDBFieldLinkDesignerFMX_NoParse.Create);
  RegisterBindCompDesigner(TBaseBindDBFieldControlLink, TBindDBFieldLinkDesignerFMX.Create);
  RegisterBindCompDesigner(TBaseBindDBGridControlLink, TBindDBFieldLinkDesignerFMX.Create);

  RegisterBindCompFactory(TBindDBLinkDialogFactory.Create);

  // Filter controls in drop down list
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBEditLink, 'EditControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBTextLink, 'TextControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBListLink, 'ListControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBMemoLink, 'MemoControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBCheckLink, 'CheckControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBImageLink, 'ImageControl',
    TBindDBControlProperty);
  RegisterPropertyEditor(TypeInfo(TStyledControl), TCustomBindDBGridLink, 'GridControl',
    TBindDBControlProperty);

  // Add BindingsList used methods/converters required units to the uses list
  RegisterSelectionEditor(TBaseBindDBFieldControlLink, TBindFMXDBControlSelectionEditor);
  RegisterSelectionEditor(TBaseBindDBGridControlLink, TBindFMXDBControlSelectionEditor);

  RegisterComponentEditor(TBindDBGridLink, TBindDBGridLinkEditor);

  // Add "Live Bindings" to controls
  RegisterSelectionEditor(Fmx.Types.TControl, TAddDataBindingsPropertyFilter);
  // Verbs to add data bindings
  RegisterSelectionEditor(Fmx.Types.TControl, TBindCompFactorySelectionEditor);

  RegisterSelectionEditor(TCustomGrid, TBindDBGridColumnsSelectionEditor);

  // Use Fmx.Bind.Editors
  RegisterSelectionEditor(TContainedBindComponent, TContainedBindComponentSelectionEditor);

end;


{ TBindDBControlSelectionEditor }

procedure TBindFMXDBControlSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('Fmx.Bind.Editors');
  Proc('Fmx.Bind.DBEngExt');
  // Proc('Data.Bind.EngExt');  // Added by other selection editor
end;

{ TBindDBFieldLinkDesignerFMX_NoParse }

function TBindDBFieldLinkDesignerFMX_NoParse.CanBindComponent(
  ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean;
var
  LHasAssociations: Boolean;
begin
  Result := TDBBindLinkAssocations.SupportsControl(
    ADataBindingClass, AComponent, LHasAssociations);
  if Result then
    with THasExistingDBLink.Create do
    try
      Result := not HasExistingDBLink(ADesigner as IDesigner, AComponent);
    finally
      Free;
    end;
end;

{ TBindDBFieldLinkDesignerFMX }

function TBindDBFieldLinkDesignerFMX.CanBindComponent(
  ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean;
var
  LHasAssociations: Boolean;
begin
  Result := TDBBindLinkAssocations.SupportsControl(
    ADataBindingClass, AComponent, LHasAssociations);
  if Result then
    with THasExistingDBLink.Create do
    try
      Result := not HasExistingDBLink(ADesigner as IDesigner, AComponent);
    finally
      Free;
    end;
end;


end.
