{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompReg;

interface

uses System.Classes, System.SysUtils, Data.Bind.Components, DesignEditors, DesignIntf, ColnEdit,
   Vcl.ActnList, System.Generics.Collections;

type
  TDataBindingFactory = class(TInterfacedObject, IBindCompFactory)
  private
  protected
    FCategory: string;
    FClass: TContainedBindCompClass;
    function Enabled(AContext: IBindCompFactoryContext): Boolean; virtual;
    function GetCommandText(AContext: IBindCompFactoryContext): string;  virtual;
    procedure Execute(AContext: IBindCompFactoryExecuteContext);  virtual;
  public
    constructor Create(ACategory: string; AClass: TContainedBindCompClass);

  end;

  TRttiUnitSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TCustomBindCompListSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TBindCompExpressionEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TSourceMemberNamePropertyEditor = class(TStringProperty)
  private
    function GetBindComponent: TContainedBindComponent;
    function GetSourceComponent: TComponent;
  protected
    function GetSourceComponentName: string; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TFieldNamePropertyEditor = class(TSourceMemberNamePropertyEditor)
  protected
    function GetSourceComponentName: string; override;
  end;

  TAddDataBindingsPropertyFilter = class(TSelectionEditor, ISelectionPropertyFilter)
  protected
    { ISelectionPropertyFilter }
    procedure FilterProperties(const ASelection: IDesignerSelections;
      const ASelectionProperties: IInterfaceList);
  end;

  TBindCompFactorySelectionEditor = class(TSelectionEditor)
  private
    FTempStringList: TStrings;
    FActions: TList<TCustomAction>;
    class procedure AddDataBindingAction(AFactory: IBindCompFactory;
      Info: Pointer);
    procedure AddFactoryActions(AList: TList<TCustomAction>);
    procedure AddTempString(const S: string);
    procedure CreateDataBindingFactoryContext(Sender: TObject;
      ABindCompList: TCustomBindingsList;
      out AContext: IBindCompFactoryContext);
    procedure CreateNewDataBindingFactory(Sender: TObject;
      DataBindingFactory: IBindCompFactory; BindingsList: TCustomBindingsList);
    function CreateDataBindingFactoryExecuteContext(
      ABindCompList: TCustomBindingsList): IBindCompFactoryExecuteContext;
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer; const List: IDesignerSelections); override;
    constructor Create(const ADesigner: IDesigner); override;
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses DsnConst, Vcl.Forms, Winapi.Windows,Vcl.Controls,
  Vcl.Themes, Winapi.UxTheme,
  BindCompEdit, BindCompDsnResStrs, Vcl.Graphics, Vcl.ComCtrls, Vcl.Menus,
  System.Math, ComponentDesigner,  Vcl.GraphUtil,System.TypInfo,
  DesignConst, TreeIntf, BindCompBasePropEditor, System.StrUtils,
  ToolsAPI, PropInspApi, BindCompProperties, BindMethodsFormU,
  BindOutputConvertersFormU, System.Bindings.EvalProtocol, System.Bindings.Methods, System.Bindings.Outputs,
  BindCompExprEdit, Data.Bind.Consts, Data.Bind.DBLinks, System.Bindings.ObjEval,
  // initialization
  Data.Bind.EngExt, Vcl.Dialogs, Proxies;

{ TBindCompListEditor }

type
  TBindCompListEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


  TBindFillListExpressionEditor = class(TBindCompExpressionEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TBindFillGridLinkExpressionEditor = class(TBindCompExpressionEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TBindFillGridListExpressionEditor = class(TBindCompExpressionEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TBindEvaluateExpressionEditor = class(TBindCompExpressionEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TBindEvaluateExprItemsEditor = class(TBindCompExpressionEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TAddActionInfo = record
    FContext: IBindCompFactoryContext;
    FBindingsList: TCustomBindingsList;
    FList: TList<TCustomAction>;
  end;

  PAddActionInfo = ^TAddActionInfo;

  TFactoryAction = class(TCustomAction)
  private
    FBindingsList: TCustomBindingsList;
    FFactory: IBindCompFactory;
  public
    constructor Create(const ACaption: string; ABindingsList: TCustomBindingsList;  AFactory: IBindCompFactory); reintroduce;
    function Execute: Boolean; override;
  end;

  TVerbAction = class(TCustomAction)
  private
    FVerb: Integer;
    FDesigner: IDesigner;
    FComponent: TComponent;
  public
    constructor Create(const ACaption: string; AComponent: TComponent;  AVerb: integer;
      ADesigner: IDesigner); reintroduce;
    function Execute: Boolean; override;
  end;

  TDataBindingFactoryContext = class(TInterfacedObject, IBindCompFactoryContext)
  private
    FBindCompList: TCustomBindingsList;
    FControlComponent: TComponent;
    FDesigner: IDesigner;
  protected
    function GetOwner: TComponent;
    function GetBindingsList: TCustomBindingsList;
    function GetControlComponent: TComponent;
    function GetDesigner: IInterface;
  public
    constructor Create(ADesigner: IDesigner; ABindCompList: TCustomBindingsList;
      AControlComponent: TComponent);
  end;

  TDataBindingFactoryExecuteContext = class(TDataBindingFactoryContext, IBindCompFactoryExecuteContext)
  protected
    function UniqueName(const ABaseName: string): string; virtual;
    procedure BindCompCreated(AComponent: TComponent); virtual;
  end;

  TDataLinkProperty = class(TObject)
  protected
    function GetOwner: TComponent; virtual; abstract;
  public
    property Owner: TComponent read GetOwner;
  end;

{ TBindCompListView }

  TNewDataBindingEvent = procedure(Sender: TObject; const Category: string;
    DataBindingClass: TContainedBindCompClass; BindingsList: TCustomBindingsList) of object;
  TNewDataBindingFactoryEvent = procedure(Sender: TObject;
    DataBindingFactory: IBindCompFactory; BindingsList: TCustomBindingsList) of object;
  TCreateDataBindingFactoryContext = procedure(Sender: TObject; BindingsList: TCustomBindingsList;
    var AContext: IBindCompFactoryContext) of object;
  TSelectDataBindingEvent = procedure(Sender: TObject; DataBinding: TContainedBindComponent) of object;

  TBindCompListViewOption = (dblvSelect, dblvDelete, dblvCreateNew, dblvCreateNewFactory, dblvSelectExisting);
  TBindCompListViewOptions = set of TBindCompListViewOption;

  TBindCompListView = class(TCustomListView)
  private const
    FDefItemHeight = 17;
  private
    FSelectComponentItem: TListItem;
    FDeleteComponentItem: TListItem;
    FActionsDictionary: TDictionary<TListItem, TCustomAction>;
    FDesigner: IDesigner;
    FImageList: TImageList;
    FTempStringList: TStrings;
    FOnNewDataBinding: TNewDataBindingEvent;
    FOnNewDataBindingFactory: TNewDataBindingFactoryEvent;
    FOnSelectDataBindingProperty: TSelectDataBindingEvent;
    FOnSelectDataBindingComponent: TNotifyEvent;
    FOnDeleteDataBinding: TNotifyEvent;
    FOptions: TBindCompListViewOptions;
    FDataBindingComponentName: string;
    FCreateDataBindingFactoryContext: TCreateDataBindingFactoryContext;
    FControlComponent: TComponent;
    FCustomActions: TArray<TCustomAction>;
    procedure AddTempString(const S: string);
    procedure RebuildListView;
    procedure SetDesigner(const Value: IDesigner);
    procedure AddFactoryActions(AList: TList<TCustomAction>);
    class procedure AddDataBindingAction(AFactory: IBindCompFactory; Info: Pointer);
    class procedure AddVerbActions(AComponent: TComponent;
      AList: TList<TCustomAction>; ADesigner: IDesigner);
  protected
    procedure CreateWnd; override;
    function CustomDrawItem(Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage): Boolean; override;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    property CustomActions: TArray<TCustomAction> read FCustomActions write FCustomActions;
    property ControlComponent: TComponent read FControlComponent write FControlComponent;
    property Options: TBindCompListViewOptions read FOptions write FOptions;
    property DataBindingComponentName: string read FDataBindingComponentName write FDataBindingComponentName;
    property Designer: IDesigner read FDesigner write SetDesigner;
    property OnNewDataBinding: TNewDataBindingEvent read FOnNewDataBinding write FOnNewDataBinding;
    property OnNewDataBindingFactory: TNewDataBindingFactoryEvent read FOnNewDataBindingFactory write FOnNewDataBindingFactory;
    property OnCreateDataBindingFactoryContext: TCreateDataBindingFactoryContext read FCreateDataBindingFactoryContext write FCreateDataBindingFactoryContext;
    property OnDeleteDataBinding: TNotifyEvent read FOnDeleteDataBinding write FOnDeleteDataBinding;
    property OnSelectDataBindingProperty: TSelectDataBindingEvent read FOnSelectDataBindingProperty write FOnSelectDataBindingProperty;
    property OnSelectDataBindingComponent: TNotifyEvent read FOnSelectDataBindingComponent write FOnSelectDataBindingComponent;
  end;

  TProxyComponent = class;

  TBindArtifactsPropertyEditor = class(TClassProperty)
  protected
    procedure ShowForm(AComponent: TComponent; AMethods: TBindArtifacts); virtual; abstract;
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TMethodsPropertyEditor = class(TBindArtifactsPropertyEditor)
  protected
    procedure ShowForm(AComponent: TComponent; AArtifacts: TBindArtifacts); override;
  end;

  TOutputConvertersPropertyEditor = class(TBindArtifactsPropertyEditor)
  protected
    procedure ShowForm(AComponent: TComponent; AArtifacts: TBindArtifacts); override;
  end;


  TCustomBindCompListSprig = class(TComponentSprig)
  end;

  TCustomDataBindingSprig = class(TComponentSprig)
  public
    procedure FigureParent; override;
    function DragDropTo(AItem: TSprig): Boolean; override;
    function DragOverTo(AItem: TSprig): Boolean; override;
    function ItemIndex: Integer; override;
  end;

  TCustomAssociatedDataBindingSprig = class(TComponentSprig)
  public
    procedure FigureParent; override;
    function DragDropTo(AItem: TSprig): Boolean; override;
    function DragOverTo(AItem: TSprig): Boolean; override;
    function ItemIndex: Integer; override;
  end;

  TDataBindingCategorySprig = class(TTransientCollectionSprig)
  private
    FBindCompList: TCustomBindingsList;
    FCategory: string;
  public
    function UniqueName: string; override;
    function Caption: string; override;
    procedure FigureParent; override;
    function SortByIndex: Boolean; override;
  end;

  TComponentDataBindingsSprig = class(TTransientCollectionSprig)
  private
    FComponent: TComponent;
  public
    function UniqueName: string; override;
    function Caption: string; override;
    procedure FigureParent; override;
    function SortByIndex: Boolean; override;
  end;


  TDataBindingSyntheticProperty = class(TCustomSyntheticProperty, IProperty80, IShowReferenceProperty)
  private
    const
      sName = 'LiveBindings';
  private var
    FComponent: TComponent;
    FBindCompListView: TBindCompListView;
    FHost: IPropertyHost;
    procedure CreateDataBindingFactoryContext(Sender: TObject;
      ABindCompList: TCustomBindingsList;
      var AContext: IBindCompFactoryContext);
    function CreateDataBindingFactoryExecuteContext(
      ABindCompList: TCustomBindingsList): IBindCompFactoryExecuteContext;
    procedure CreateNewDataBindingFactory(Sender: TObject;
      DataBindingFactory: IBindCompFactory;
      BindingsList: TCustomBindingsList);
    procedure SelectDataBindingProperty(Sender: TObject;
      DataBinding: TContainedBindComponent);
  protected
    // IShowReferenceProperty (show events)
    function ShowReferenceProperty: Boolean;
    // IProperty80
    procedure Edit(const Host: IPropertyHost; DblClick: Boolean); reintroduce;

    function GetAttributes: TPropertyAttributes; override;
    function GetName: string; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure GetProperties(Proc: TGetPropProc); override;
    property ControlComponent: TComponent read FComponent;
  public
    property Component: TComponent read FComponent write FComponent;
    destructor Destroy; override;
  end;

  // Provide published property which can be used to dynamicall add DataBinding components under a
  // DataBindingsPropery
  TProxyComponent = class(TComponent)
  private
    // List of databinding components that will get deleted
    class var FPendingFreeList: TList<TComponent>;
    class constructor Create;
    var
    FComponent: TComponent;
    FDesigner: IDesigner;
    //FFreeComponent: Boolean;
  public
    class destructor Destroy;
  published
    property ComponentProperty: TComponent read FComponent;
    constructor Create(AOwner: TComponent; ADesigner: IDesigner); reintroduce;
    destructor Destroy; override;
  end;

  TNewBindCompDialogFactory = class(TInterfacedObject, IBindCompFactory)
  private
  protected
    function GetCategory: string;
    function Enabled(AContext: IBindCompFactoryContext): Boolean;
    function GetCommandText(AContext: IBindCompFactoryContext): string;
    procedure Execute(AContext: IBindCompFactoryExecuteContext);
  end;



{ TBindCompListEditor }

procedure TBindCompListEditor.ExecuteVerb(Index: Integer);
begin
  ShowBindCompListDesigner(Designer, (Component as TBindingsList));
end;

function TBindCompListEditor.GetVerb(Index: Integer): string;
begin
  Result := SBindCompListEdit;
end;

function TBindCompListEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TAddBindComponentEditor }

constructor TBindCompFactorySelectionEditor.Create(const ADesigner: IDesigner);
begin
  inherited;
end;

destructor TBindCompFactorySelectionEditor.Destroy;
begin
  FActions.Free;
  inherited;
end;

procedure TBindCompFactorySelectionEditor.ExecuteVerb(Index: Integer; const List: IDesignerSelections);
var
  LFactoryAction: TFactoryAction;
begin
  // Create actions on demand rather than in constructor to improve
  // performance of code insite
  AddFactoryActions(FActions);
  LFactoryAction := FActions[Index] as TFactoryAction;
  CreateNewDataBindingFactory(LFactoryAction, LFactoryAction.FFactory,
    LFactoryAction.FBindingsList);

  // Reselect to update verbs
//  DesignNotificationSelectionChanged(Designer, CreateSelectionList);
//  DesignNotificationSelectionChanged(Designer, List);
end;

function TBindCompFactorySelectionEditor.GetVerb(Index: Integer): string;
begin
  // Create actions on demand rather than in constructor to improve
  // performance of code insite
  AddFactoryActions(FActions);
  Result := FActions[Index].Caption;
end;

procedure TBindCompFactorySelectionEditor.CreateNewDataBindingFactory(Sender: TObject;
  DataBindingFactory: IBindCompFactory; BindingsList: TCustomBindingsList);
var
  LContext: IBindCompFactoryExecuteContext;
  LBindCompList: TBindingsList;
begin
  LBindCompList := nil;
  LContext := CreateDataBindingFactoryExecuteContext(BindingsList);
  Assert(LContext <> nil);
  if LContext.BindingsList = nil then
  begin
    LBindCompList := TBindingsList.Create(LContext.Owner);
    if Assigned(LContext.Owner) then
    begin
      //Place BindingsList in top left corner of parent (Low Word = Left, High Word = Top)
      LBindCompList.DesignInfo := (5 shl 16) + 20;
      LContext.Owner.InsertComponent(LBindCompList);
    end;
    LBindCompList.Name := LContext.UniqueName(LBindCompList.ClassType.ClassName
     );
    (LContext as TDataBindingFactoryExecuteContext).FBindCompList := LBindCompList;
  end;
//  if FHost <> nil then
//    FHost.CloseDropDown;
  if LContext <> nil then
    DataBindingFactory.Execute(LContext);
  if LBindCompList <> nil then
  begin
    if LBindCompList.BindCompCount = 0 then
      // Free compononent we've create because no binding components created
      LBindCompList.Free;
  end;

end;

class procedure TBindCompFactorySelectionEditor.AddDataBindingAction(
  AFactory: IBindCompFactory; Info: Pointer);
var
  LInfo: PAddActionInfo;
  LAction: TFactoryAction;
begin
  LInfo := PAddActionInfo(Info);
  if AFactory.Enabled(LInfo.FContext) then
  begin
    LAction := TFactoryAction.Create(
      AFactory.GetCommandText(LInfo.FContext), LInfo.FBindingsList, AFactory);
    LInfo.FList.Add(LAction);
  end;
end;

function TBindCompFactorySelectionEditor.GetVerbCount: Integer;
begin
  // Create actions on demand rather than in constructor to improve
  // performance of code insite
  AddFactoryActions(FActions);
  Result := FActions.Count;
end;

procedure TBindCompFactorySelectionEditor.CreateDataBindingFactoryContext(Sender: TObject; ABindCompList: TCustomBindingsList;
  out AContext: IBindCompFactoryContext);
var
  LComponent: TComponent;
  List: IDesignerSelections;
begin
  AContext := nil;
  List := CreateSelectionList;
  Designer.GetSelections(List);
  if (List.Count > 0) and (List[0] is TComponent) then
    LComponent := TComponent(List[0])
  else
    LComponent := nil;
  if LComponent <> nil then
  begin
    AContext := TDataBindingFactoryContext.Create(Designer, ABindCompList,
      LComponent); //FComponent);
  end
  else
    AContext := nil;
end;

type
  TBindCompFactorySelectionEditorExecuteContext = class(TDataBindingFactoryExecuteContext)
  public
    procedure BindCompCreated(AComponent: TComponent); override;

  end;

function TBindCompFactorySelectionEditor.CreateDataBindingFactoryExecuteContext(ABindCompList: TCustomBindingsList): IBindCompFactoryExecuteContext;
var
  LComponent: TComponent;
  List: IDesignerSelections;
begin
  Result := nil;
  List := CreateSelectionList;
  Designer.GetSelections(List);
  if (List.Count > 0) and (List[0] is TComponent) then
    LComponent := TComponent(List[0])
  else
    LComponent := nil;
  if LComponent <> nil then
  begin
    Result := TBindCompFactorySelectionEditorExecuteContext.Create(Designer, ABindCompList,
      LComponent); //FComponent);
  end;
end;

procedure TBindCompFactorySelectionEditor.AddTempString(const S: string);
begin
  FTempStringList.Add(S);
end;


procedure TBindCompFactorySelectionEditor.AddFactoryActions(AList: TList<TCustomAction>);
var
  LBindCompList: TCustomBindingsList;
  I: Integer;
  LBindCompLists: TList<TCustomBindingsList>;
  LDataBindingFactoryContext: IBindCompFactoryContext;
  LInfo: TAddActionInfo;
begin
  // Create actions on demand rather than in constructor to improve
  // performance of code insite
  // Don't need parameter anymore, but for updates must not change signature
  Assert(AList = FActions);
  if FActions <> nil then
    Exit;
  FActions := TObjectList<TCustomAction>.Create;
  AList := FActions;
  LBindCompLists := TList<TCustomBindingsList>.Create;
  try
    // Build list of ActionLists
    FTempStringList := TStringList.Create;
    try
      Designer.GetComponentNames(GetTypeData(TypeInfo(TBindingsList)), AddTempString);
      for I := 0 to FTempStringList.Count - 1 do
      begin
        Assert(Designer.GetComponent(FTempStringList[I]) is TBindingsList);
        LBindCompLists.Add(TBindingsList(Designer.GetComponent(FTempStringList[I])));
      end;
    finally
      FreeAndNil(FTempStringList);
    end;
    // Build menus even if no databinding list, factory will create one
    if LBindCompLists.Count = 0 then
      LBindCompLists.Add(nil);
    // Build popupmenus for actionlists and standard actions
    for LBindCompList in LBindCompLists do
    begin
      CreateDataBindingFactoryContext(Self, nil, LDataBindingFactoryContext);
      if LDataBindingFactoryContext <> nil then
      begin
        Assert(LDataBindingFactoryContext <> nil);
        LInfo.FContext := LDataBindingFactoryContext;
        LInfo.FBindingsList := LBindCompList;
        LInfo.FList := AList;
        if Assigned(EnumRegisteredBindCompFactoriesProc) then
          EnumRegisteredBindCompFactories(AddDataBindingAction, @LInfo);
      end;
    end;
  finally
    LBindCompLists.Free;
  end;
end;

{ TBindCompExpressionEditor }

procedure TBindCompExpressionEditor.ExecuteVerb(Index: Integer);
begin
  ShowBindCompExprDesigner(Designer, (Component as TContainedBindComponent));
end;

function TBindCompExpressionEditor.GetVerb(Index: Integer): string;
begin
  Result := SBindCompExpressionEdit;
end;

function TBindCompExpressionEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TBindFillListExpressionEditor }

procedure TBindFillListExpressionEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    inherited
  else
    case Index - I of
      0: (Component as TCustomBindList).FillList;
      1: (Component as TCustomBindList).ClearList;
    end;
end;

function TBindFillListExpressionEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    Result := inherited
  else
    case Index - I of
      0: Result := SBindFillList;
      1: Result := SBindClearList;
    end;
end;

function TBindFillListExpressionEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

{ TBindEvaluateExpressionEditor }

procedure TBindEvaluateExpressionEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    inherited
  else
    case Index - I of
      0: (Component as TCustomBindExpression).EvaluateFormat;
    end;
end;

function TBindEvaluateExpressionEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    Result := inherited
  else
    case Index - I of
      0: Result := SEvaluate;
    end;
end;

function TBindEvaluateExpressionEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

{ TBindEvaluateExprItemsEditor }

procedure TBindFillGridLinkExpressionEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  Assert(Component is TCustomBindGridLink);
  I := inherited GetVerbCount;
  if Index < I then
    inherited
  else
    case Index - I of
      0: (Component as TCustomBindGridLink).FillGrid;
      1: (Component as TCustomBindGridLink).ClearGrid;
    end;
end;

function TBindFillGridLinkExpressionEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    Result := inherited
  else
    case Index - I of
      0: Result := SBindFillGrid;
      1: Result := SBindClearGrid;
    end;
end;

function TBindFillGridLinkExpressionEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

{ TBindFillGridListExpressionEditor }

procedure TBindFillGridListExpressionEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  Assert(Component is TCustomBindGridList);
  I := inherited GetVerbCount;
  if Index < I then
    inherited
  else
    case Index - I of
      0: (Component as TCustomBindGridList).FillGrid;
      1: (Component as TCustomBindGridList).ClearGrid;
    end;
end;

function TBindFillGridListExpressionEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    Result := inherited
  else
    case Index - I of
      0: Result := SBindFillGrid;
      1: Result := SBindClearGrid;
    end;
end;

function TBindFillGridListExpressionEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

{ TBindEvaluateExprItemsEditor }

procedure TBindEvaluateExprItemsEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    inherited
  else
    case Index - I of
      0: (Component as TCustomBindExprItems).EvaluateFormat;
      1: (Component as TCustomBindExprItems).EvaluateClear;
    end;
end;

function TBindEvaluateExprItemsEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then
    Result := inherited
  else
    case Index - I of
      0: Result := SEvaluateFormat;
      1: Result := SEvaluateClear;
    end;
end;

function TBindEvaluateExprItemsEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

{ TActionListView }

constructor TBindCompListView.Create(AOwner: TComponent);
begin
  inherited;
  FActionsDictionary := TDictionary<TListItem, TCustomAction>.Create;
  FImageList := TImageList.Create(nil);
  FTempStringList := TStringList.Create;
  BorderStyle := bsNone;
  Columns.Add;
  Height := FDefItemHeight;
  ReadOnly := True;
  RowSelect := True;
  ShowColumnHeaders := False;
  SmallImages := FImageList;
  ViewStyle := vsReport;
  Width := 200;
end;

destructor TBindCompListView.Destroy;
begin
  FreeAndNil(FImageList);
  FreeAndNil(FActionsDictionary);
  inherited;
end;

procedure TBindCompListView.AddTempString(const S: string);
begin
  FTempStringList.Add(S);
end;

procedure TBindCompListView.Click;
var
  P: TPoint;
  Item: TListItem;
  LAction: TCustomAction;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  Item := GetItemAt(P.X, P.Y);

  if Item <> nil then
  begin
    if (Item.Data = Self) then
    begin
      if  Assigned(FOnSelectDataBindingProperty) then
        FOnSelectDataBindingProperty(Self, TContainedBindComponent(Item.Data));
    end
    else if (Item.Data <> nil) then
    begin
        if  Assigned(FOnSelectDataBindingProperty) then
          FOnSelectDataBindingProperty(Self, TContainedBindComponent(Item.Data))
    end
    else
    begin
      if Item = FSelectComponentItem then
      begin
        if  Assigned(FOnSelectDataBindingComponent) then
          FOnSelectDataBindingComponent(Self)
      end
      else if Item = FDeleteComponentItem then
      begin
        if Assigned(FOnDeleteDataBinding) then
          FOnDeleteDataBinding(Self)
      end
      else if FActionsDictionary.TryGetValue(Item, LAction) then
        if LAction is TFactoryAction then
        begin
          if Assigned(FOnNewDataBindingFactory) then
            FOnNewDataBindingFactory(Self,
              TFactoryAction(LAction).FFactory, TFactoryAction(LAction).FBindingsList)
        end
        else
          LAction.Execute;
    end
  end
  else
    if Assigned(FOnSelectDataBindingProperty) then
      FOnSelectDataBindingProperty(Self, nil);
end;

procedure TBindCompListView.CreateWnd;
begin
  inherited;
  if Designer.Root <> nil then
    RebuildListView;
end;

function TBindCompListView.CustomDrawItem(Item: TListItem;
  State: TCustomDrawState; Stage: TCustomDrawStage): Boolean;
var
  LRect: TRect;
begin
  Result := True;
  Canvas.Brush.Style := bsClear;
  LRect := Item.DisplayRect(drLabel);

  case Stage of
    cdPrePaint:
      // Draw separator
      if Item.Caption = '' then
      begin
        Canvas.Pen.Color := clSilver;
        Canvas.MoveTo(LRect.Left, LRect.Top + (LRect.Bottom - LRect.Top) div 2);
        Canvas.LineTo(LRect.Right - LRect.Left, LRect.Top + (LRect.Bottom - LRect.Top) div 2);
        Result := False; // Prevent default drawing of highlight bar
      end;
    cdPostPaint:
      // Draw arrow for New Action and New Standard Action items
//      if ((Item.Index <= 1) and (FNewStdActnPopupMenu.Items.Count > 1)) and
//         (((Item.Index = 0) and (FNewActnPopupMenu.Items.Count > 1)) or
//         ((Item.Index = 1) and (FNewStdActnPopupMenu.Items.Count > 1))) then
//      if Item.Data = FNewStdActnPopupMenu then
//
//      begin
//        LRect.Left := LRect.Right - 20;
//        if ThemeServices.ThemesEnabled and (Win32MajorVersion >= 6) then
//          DrawThemeBackground(ThemeServices.Theme[teMenu], Canvas.Handle,
//            MENU_POPUPSUBMENU, MSM_NORMAL, LRect, nil)
//        else
//          DrawArrow(Canvas, sdRight, Point(LRect.Right - 15,
//            LRect.Top + ((LRect.Bottom - LRect.Top - 8) div 2)), 4);
//      end;
  end;
end;

function TBindCompListView.IsCustomDrawn(Target: TCustomDrawTarget;
  Stage: TCustomDrawStage): Boolean;
begin
  Result := (Stage = cdPrePaint) or (Stage = cdPostPaint);
end;

procedure TBindCompListView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if  (Selected <> nil) then
      begin
        if Selected.Data <> nil then
        begin
          if Assigned(FOnSelectDataBindingProperty) then
            FOnSelectDataBindingProperty(Self, TContainedBindComponent(Selected.Data));
        end
        else
          if Assigned(FOnDeleteDataBinding) then
            FOnDeleteDataBinding(Self);

      end;
    VK_RIGHT:
      if Selected <> nil then
      begin
//        if Selected.Data = FNewStdActnPopupMenu then
//          ShowPopupMenu(Selected, FNewStdActnPopupMenu);
      end;
  else
    inherited;
  end;
end;

procedure TBindCompListView.RebuildListView;
var
  LRect: TRect;
  ListItem: TListItem;
  LDataBinding: TContainedBindComponent;
  I, LWidth, MinWidth: Integer;
  LItemIndex: Integer;
  LExistingDataBindingCount: Integer;
  LAction: TCustomAction;
begin
  FDeleteComponentItem := nil;
  FSelectComponentItem := nil;
  FActionsDictionary.Clear;
  LExistingDataBindingCount := 0;
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      FImageList.Clear;

      // Set initial max width
      MinWidth := 0; // Max(Width, Canvas.TextWidth(SCreateNewDataBinding) + 25);

      if TBindCompListViewOption.dblvSelectExisting in FOptions then
      begin
        // Find all actions
        FTempStringList.Clear;
        Designer.GetComponentNames(GetTypeData(TypeInfo(TContainedBindComponent)), AddTempString);
        for I := 0 to FTempStringList.Count - 1 do
        begin
          LDataBinding := TContainedBindComponent(Designer.GetComponent(FTempStringList[I]));
          if LDataBinding.ControlComponent <> Self.ControlComponent then
            Continue;

          ListItem := Items.Add;
          ListItem.Caption := FTempStringList[I];
          ListItem.Data := LDataBinding;
          ListItem.ImageIndex := -1;
          Inc(LExistingDataBindingCount);
          MinWidth := Max(MinWidth, Canvas.TextWidth(ListItem.Caption));

        end;

        // Sort list items before adding "special" items
        CustomSort(nil, 0);
      end;

      LItemIndex := 0;

      if TBindCompListViewOption.dblvDelete in FOptions then
      begin
        // Delete data binding item
        ListItem := Items.Insert(LItemIndex);
        FDeleteComponentItem := ListItem;
        ListItem.Caption := Format(SDeleteDataBinding, [FDataBindingComponentName]);
        ListItem.ImageIndex := -1;
        ListItem.Data := nil;
        MinWidth := Max(MinWidth, Canvas.TextWidth(ListItem.Caption));
        Inc(LItemIndex);
      end;

      if TBindCompListViewOption.dblvSelect in FOptions then
      begin
        // Delete data binding item
        ListItem := Items.Insert(LItemIndex);
        FSelectComponentItem := ListItem;
        ListItem.Caption := Format(SSelectDataBinding, [FDataBindingComponentName]);
        ListItem.ImageIndex := -1;
        ListItem.Data := nil;
        MinWidth := Max(MinWidth, Canvas.TextWidth(ListItem.Caption));
        Inc(LItemIndex);
      end;

      if LExistingDataBindingCount > 0 then
        if TBindCompListViewOption.dblvSelectExisting in FOptions then
        begin
          // Add dummy item for divider line
          //if LItemIndex > 2 then
          begin
            // Add existing DataBinding instances
            ListItem := Items.Insert(LItemIndex);
            ListItem.ImageIndex := -1;
          end;
        end;

      if Length(FCustomActions) > 0 then
        for LAction in FCustomActions do
        begin
          if LAction.Enabled and LAction.Visible then
          begin
            ListItem := Items.Insert(LItemIndex);
            ListItem.Caption := LAction.Caption;
            ListItem.ImageIndex := -1;
            ListItem.Data := nil;
            FActionsDictionary.Add(ListItem, LAction);
            MinWidth := Max(MinWidth, Canvas.TextWidth(ListItem.Caption) + FImageList.Width);
            Inc(LItemIndex);
          end;
        end;
    finally
      Items.EndUpdate;
    end;

    LWidth := 0;
//    if LExistingDataBindingCount > 0 then
//      if TBindCompListViewOption.dblvSelectExisting in FOptions then
      begin
        // Set Height to fit 14 items
        if Items.Count > 14 then
        begin
          I := 14;
          LWidth := GetSystemMetrics(SM_CXVSCROLL);
        end
        else
          I := Items.Count;
        if Items.Count > 0 then
        begin
          LRect := Items[0].DisplayRect(drBounds);
          Height := LRect.Bottom * I;
        end
        else
          Height := FDefItemHeight
      end;
    // Set width to widest + space gutters (20 pixels each side)
    Self.Width := MinWidth + LWidth + 40; //+ FImageList.Width;
    Columns[0].Width := Width - LWidth;
  end
//  else
//    Height := FDefItemHeight;
end;



class procedure TBindCompListView.AddDataBindingAction(
  AFactory: IBindCompFactory; Info: Pointer);
var
  LInfo: PAddActionInfo;
  LAction: TFactoryAction;
begin
  LInfo := PAddActionInfo(Info);
  if AFactory.Enabled(LInfo.FContext) then
  begin
    LAction := TFactoryAction.Create(
      AFactory.GetCommandText(LInfo.FContext), LInfo.FBindingsList, AFactory);
    LInfo.FList.Add(LAction);
  end;
end;

procedure TBindCompListView.AddFactoryActions(AList: TList<TCustomAction>);
var
  LBindCompList: TCustomBindingsList;
  I: Integer;
  LBindCompLists: TList<TCustomBindingsList>;
  LDataBindingFactoryContext: IBindCompFactoryContext;
  LInfo: TAddActionInfo;
begin
  LBindCompLists := TList<TCustomBindingsList>.Create;
  try
    // Build list of ActionLists
    FTempStringList.Clear;
    Designer.GetComponentNames(GetTypeData(TypeInfo(TBindingsList)), AddTempString);
    for I := 0 to FTempStringList.Count - 1 do
    begin
      Assert(Designer.GetComponent(FTempStringList[I]) is TBindingsList);
      LBindCompLists.Add(TBindingsList(Designer.GetComponent(FTempStringList[I])));
    end;
    // Build menus even if no databinding list, factory will create one
    if LBindCompLists.Count = 0 then
      LBindCompLists.Add(nil);
    // Build popupmenus for actionlists and standard actions
    for LBindCompList in LBindCompLists do
    begin
      FCreateDataBindingFactoryContext(Self, nil, LDataBindingFactoryContext);
      Assert(LDataBindingFactoryContext <> nil);
      LInfo.FContext := LDataBindingFactoryContext;
      LInfo.FBindingsList := LBindCompList;
      LInfo.FList := AList;
      if Assigned(EnumRegisteredBindCompFactoriesProc) then
        EnumRegisteredBindCompFactories(AddDataBindingAction, @LInfo);
    end;
  finally
    LBindCompLists.Free;
  end;
end;

class procedure TBindCompListView.AddVerbActions(AComponent: TComponent; AList: TList<TCustomAction>;
   ADesigner: IDesigner);
var
  LAction: TVerbAction;
  LEditor: IComponentEditor;
  I: Integer;
  LText: string;
begin
  LEditor := GetComponentEditor(AComponent, ADesigner);
  if LEditor <> nil then
  begin
    for I := 0 to LEditor.GetVerbCount - 1 do
    begin
      LText := LEditor.GetVerb(I);
      LText := ReplaceStr(LText, '&', '');
      LAction := TVerbAction.Create(
        LText, AComponent, I, ADesigner);
      AList.Add(LAction);
    end;

  end;
end;


procedure TBindCompListView.SetDesigner(const Value: IDesigner);
begin
  if Value <> FDesigner then
  begin
    FDesigner := Value;

    // Set initial height based on default item height
    FTempStringList.Clear;
    Designer.GetComponentNames(GetTypeData(TypeInfo(TContainedBindComponent)), AddTempString);
    if FTempStringList.Count > 0 then
      Height := (Min(FTempStringList.Count, 11) + 3) * FDefItemHeight
    else
      Height := FDefItemHeight;

    // Rebuild popup menus and listview
    //RebuildPopupMenus;
    if HandleAllocated then
      RebuildListView;
  end;
end;


{ TCustomDataBindingSprig }

function TCustomDataBindingSprig.DragDropTo(AItem: TSprig): Boolean;
begin
  Result := False;

         
//  if AItem is TActionCategorySprig then
//  begin
//    Result := not AnsiSameText(TActionCategorySprig(AItem).FCategory, TContainedAction(Item).Category);
//    if Result then
//      TContainedAction(Item).Category := TActionCategorySprig(AItem).FCategory;
//  end
//
//  else if AItem is TContainedActionSprig then
//  begin
//    Result := True;
//    TContainedAction(Item).Index := TContainedAction(AItem.Item).Index;
//    if not AnsiSameText(TContainedAction(Item).Category, TContainedAction(AItem.Item).Category) then
//      TContainedAction(Item).Category := TContainedAction(AItem.Item).Category;
//    Parent.SetIndexOf(AItem, TContainedAction(AItem.Item).Index);
//  end;
end;

function TCustomDataBindingSprig.DragOverTo(AItem: TSprig): Boolean;
begin
  Result := False;        
//  Result := ((AItem is TActionCategorySprig) and
//             (TActionCategorySprig(AItem).FActionList = TContainedAction(Item).ActionList)) or
//            ((AItem is TContainedActionSprig) and
//             (TContainedAction(AItem.Item).ActionList = TContainedAction(Item).ActionList));
end;

const
  CDataBindingCategoryPrefix = '<DataBindingCategory>';

function DataBindingCategorySprigName(const ACategory: string): string;
begin
  Result := Format('%s.%s', [CDataBindingCategoryPrefix, ACategory]);
end;

function ComponentDataBindingsSprigName: string;
begin
  Result := 'LiveBindings';
end;

procedure TCustomDataBindingSprig.FigureParent;
var
  LListSprig, LCatSprig: TSprig;
begin
  with TContainedBindComponent(Item) do
  begin
    LListSprig := SeekParent(BindingsList, False);
    if Assigned(LListSprig) then
    begin
      LCatSprig := LListSprig.Find(DataBindingCategorySprigName(Category), False);
      if not Assigned(LCatSprig) then
      begin
        LCatSprig := LListSprig.Add(TDataBindingCategorySprig.Create(nil));
        TDataBindingCategorySprig(LCatSprig).FBindCompList := BindingsList;
        TDataBindingCategorySprig(LCatSprig).FCategory := Category;
      end;
      LCatSprig.Add(Self);
    end;
  end;
end;

function TCustomDataBindingSprig.ItemIndex: Integer;
begin
  Result := TContainedBindComponent(Item).Index;
end;

{ TCustomAssociatedDataBindingSprig }

function TCustomAssociatedDataBindingSprig.DragDropTo(AItem: TSprig): Boolean;
begin
  Result := False;
end;

function TCustomAssociatedDataBindingSprig.DragOverTo(AItem: TSprig): Boolean;
begin
  Result := False;
end;

procedure TCustomAssociatedDataBindingSprig.FigureParent;
var
  LListSprig, LCatSprig: TSprig;
begin
  with TContainedBindComponent(Item) do
  begin
    if ControlComponent <> nil then
    begin
      LListSprig := SeekParent(ControlComponent, False);
      if Assigned(LListSprig) then
      begin
        LCatSprig := LListSprig.Find(ComponentDataBindingsSprigName, False);
        if not Assigned(LCatSprig) then
        begin
          LCatSprig := LListSprig.Add(TComponentDataBindingsSprig.Create(nil));
          TComponentDataBindingsSprig(LCatSprig).FComponent := ControlComponent;
        end;
        LCatSprig.Add(Self);
        //LListSprig.Add(Self);
      end;
    end;
  end;
end;

function TCustomAssociatedDataBindingSprig.ItemIndex: Integer;
begin
  //Result := TContainedBindComponent(Item).Index;
  Result := inherited;
end;

{ TDataBindingCategorySprig }

function TDataBindingCategorySprig.Caption: string;
begin
  Result := FCategory;
  if Result = '' then
    Result := SDataBindingCategoryNone;
end;

procedure TDataBindingCategorySprig.FigureParent;
begin
  SeekParent(FBindCompList, False);
end;

function TDataBindingCategorySprig.SortByIndex: Boolean;
begin
  Result := True;
end;

function TDataBindingCategorySprig.UniqueName: string;
begin
  Result := DataBindingCategorySprigName(FCategory);
end;

{ TComponentDataBindingsSprig }

function TComponentDataBindingsSprig.Caption: string;
begin
//  Result := FCategory;
//  if Result = '' then
//    Result := SDataBindingCategoryNone;
  Result := ComponentDataBindingsSprigName;
end;

procedure TComponentDataBindingsSprig.FigureParent;
begin
  SeekParent(FComponent, False);
end;

function TComponentDataBindingsSprig.SortByIndex: Boolean;
begin
  // Result := True;
  Result := inherited;
end;

function TComponentDataBindingsSprig.UniqueName: string;
begin
  // Result := DataBindingCategorySprigName(FCategory);
  Result := ComponentDataBindingsSprigName;
end;

procedure Register;
const
  sSourceMemberName = 'SourceMemberName';
begin

  RegisterNoIcon([TBindExpression, TBindExprItems, TBindLink, TBindList, TBindGridLink, TBindListLink, TBindGridList, TBindPosition]);
  RegisterClasses([TBindExpression, TBindExprItems, TBindLink, TBindList, TBindGridLink, TBindListLink, TBindGridList, TBindPosition]);
  RegisterBindComponents(SDataBindingsCategory_BindingExpressions, [TBindExpression, TBindExprItems]);
  RegisterBindComponents(SDataBindingsCategory_Links, [TBindLink, TBindListLink, TBindGridLink, TBindPosition]);
  RegisterBindComponents(SDataBindingsCategory_Lists, [TBindList, TBindGridList]);

  RegisterComponents(SBindingComponentsCategory, [TBindingsList, TBindScope]);

  RegisterComponentEditor(TCustomBindingsList, TBindCompListEditor);
  RegisterComponentEditor(TContainedBindComponent, TBindCompExpressionEditor);
  RegisterComponentEditor(TCustomBindList, TBindFillListExpressionEditor);
  RegisterComponentEditor(TCustomBindGridLink, TBindFillGridLinkExpressionEditor);
  RegisterComponentEditor(TCustomBindGridLIst, TBindFillGridListExpressionEditor);
  RegisterComponentEditor(TCustomBindExpression, TBindEvaluateExpressionEditor);
  RegisterComponentEditor(TCustomBindExprItems, TBindEvaluateExprItemsEditor);
  RegisterPropertyEditor(TypeInfo(TMethods), nil, '', TMethodsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TOutputConverters), nil, '', TOutputConvertersPropertyEditor);

  RegisterPropertyEditor(TypeInfo(string), TCommonBindComponent, sSourceMemberName, TSourceMemberNamePropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TColumnLinkExpressionItem, sSourceMemberName, TSourceMemberNamePropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TColumnFormatExpressionItem, sSourceMemberName, TSourceMemberNamePropertyEditor);

  RegisterSprigType(TCustomBindingsList, TCustomBindCompListSprig);
  RegisterSprigType(TContainedBindComponent, TCustomDataBindingSprig);
  RegisterSprigType(TContainedBindComponent, TCustomAssociatedDataBindingSprig);

//  RegisterBindCompDesigner(TCustomBindExpression, TBindExpressionDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindExprItems, TBindExprItemsDesigner.Create);
//
  RegisterBindCompFactory(TNewBindCompDialogFactory.Create);
//
//  RegisterBindCompDesigner(TCustomBindLink, TBindLinkDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindList, TBindListDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindGridLink, TBindGridLinkDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindListLink, TBindListLinkDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindGridList, TBindGridListDesigner.Create);
//  RegisterBindCompDesigner(TCustomBindLookup, TBindLookupDesigner.Create);

  // Add 'Live Bindings' property to components
  // RegisterSelectionEditor(TComponent, TAddDataBindingsPropertyFilter);

  // Add RTTI unit to uses list
  RegisterSelectionEditor(TCommonBindComponent, TRttiUnitSelectionEditor);

  // Add BindingsList used methods/converters required units to the uses list
  RegisterSelectionEditor(TCustomBindingsList, TCustomBindCompListSelectionEditor);

  // Add "DataBindings" property to object inspector
  RegisterBoundComponents([TComponent], [dbcoptAddDataBindingsProperty, dbcoptApplyToDescendents]);


end;


function GetDataBindingComponents(AControlComponent: TComponent): TArray<TContainedBindComponent>;
var
  LOwner: TComponent;
  I: Integer;
  LComponent: TComponent;
  LDataBindingComponent: TContainedBindComponent;
  LDesigner: IBindCompDesigner;
begin
  SetLength(Result, 0);
  LOwner := AControlComponent.Owner;
  if LOwner <> nil then
    for I := 0 to LOwner.ComponentCount - 1 do
    begin
      LComponent := LOwner.Components[I];
      // Exclude components that are being deleted
      if LComponent is TContainedBindComponent then
      begin
        LDataBindingComponent := TContainedBindComponent(LComponent);
        if TProxyComponent.FPendingFreeList.Contains(LDataBindingComponent) then
          continue;
        LDesigner := GetBindCompDesigner(TContainedBindCompClass(LDataBindingComponent.ClassType));
        if LDesigner <> nil then
        begin
          if LDesigner.BindsComponent(LDataBindingComponent, AControlComponent) then
          begin
            SetLength(Result, Length(Result) + 1);
            Result[Length(Result)-1] := TContainedBindComponent(LComponent);
          end;

        end;
      end;
    end;

end;

type

  // Wrapper around a DataBinding component to make it appear in the object inspector under
  // the DataBindingsProperty
  TDataBindingComponentProperty = class(TComponentProperty, IPropertyKind, IProperty, IProperty80)
  private
    FComponentReference: TContainedBindComponent;
    FProxyComponent: TProxyComponent;
    FActionListView: TBindCompListView;
    FHost: IPropertyHost;
    FDataBindingsPropertyNamePath: string;
    FFilterFuncDesigner: IBindCompDesigner;
  protected
    function GetComponentReference: TComponent; override;
    function GetAttributes: TPropertyAttributes; override;
  private
    procedure SetComponent(ACustomDataBinding: TContainedBindComponent);
    { IPropertyKind }
    function GetName: string; override;
    procedure DeleteDataBinding(Sender: TObject);
    procedure SelectDataBindingComponent(Sender: TObject);
    procedure SelectDataBindingsProperty(ADesigner: IDesigner);
    function FilterFunc(const ATestEditor: IProperty): Boolean;
  protected
    // IProperty80
    procedure Edit(const Host: IPropertyHost; DblClick: Boolean); reintroduce; overload;
  public
    destructor Destroy; override;
    procedure GetProperties(Proc: TGetPropProc); override;
  end;


function TDataBindingComponentProperty.GetName: string;
var
  LComponent: TComponent;
begin
  LComponent := GetComponentReference;
  if LComponent <> nil then
    Result := LComponent.Name
  else
    Result := inherited;  // Name of TProxyComponent property
end;

function TDataBindingComponentProperty.GetComponentReference;
begin
    Result := FComponentReference;
end;

procedure TDataBindingComponentProperty.SelectDataBindingsProperty(ADesigner: IDesigner);
begin
  (BorlandIDEServices as IOTAPropInspServices).Expand;
  ADesigner.SelectItemName(FDataBindingsPropertyNamePath);
end;

function TDataBindingComponentProperty.FilterFunc(const ATestEditor: IProperty): Boolean;
begin
  Result := not (paNotNestable in ATestEditor.GetAttributes);
  if Result then
  begin
                                         
    if FFilterFuncDesigner <> nil then
    begin
      // Hide property use to specify the bound component
      if FFilterFuncDesigner.BindsComponentPropertyName(FComponentReference, ATestEditor.GetName) then
        Result := False;
    end;
  end;

end;

procedure TDataBindingComponentProperty.DeleteDataBinding(Sender: TObject);
begin
  FHost.CloseDropDown;
  if (idYes <> MessageDlg(
      Format(sConfirmDelete, [FProxyComponent.FComponent.Name]),
         mtConfirmation, mbYesNoCancel, 0)) then
    Exit;

  TProxyComponent.FPendingFreeList.Add(FProxyComponent.FComponent);
  SelectDataBindingsProperty(FActionListView.Designer);
  // Deep modify, which will handle volatile properties
  (BorlandIDEServices as IOTAPropInspServices).VolatileModified;
end;

procedure TDataBindingComponentProperty.SelectDataBindingComponent(Sender: TObject);
var
  LSelection: IDesignerSelections;
begin
  FHost.CloseDropDown;
  LSelection := TDesignerSelections.Create as IDesignerSelections;
  LSelection.Add(FProxyComponent.FComponent);
  Designer.SetSelections(LSelection);
end;

destructor TDataBindingComponentProperty.Destroy;
begin
  if FActionListView <> nil then
    FreeAndNil(FActionListView);
  FProxyComponent.Free;
  inherited;
end;

function TDataBindingComponentProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited + [paCustomDropDown] - [paValueList, paSortList];
end;

procedure TDataBindingComponentProperty.GetProperties(Proc: TGetPropProc);
var
  LComponents: IDesignerSelections;
  LDesigner: IDesigner;

begin
  LComponents := GetSelections;
  if LComponents <> nil then
  begin
    if not Supports(FindRootDesigner(LComponents[0]), IDesigner, LDesigner) then
      LDesigner := Designer;
    FFilterFuncDesigner := GetBindCompDesigner(TContainedBindCompClass(Self.FComponentReference.ClassType));
    try
      GetComponentProperties(LComponents, tkAny, LDesigner, Proc, FilterFunc);
    finally
      FFilterFuncDesigner := nil;
    end;
  end;
end;

procedure TDataBindingComponentProperty.SetComponent(ACustomDataBinding: TContainedBindComponent);
var
  PropInfo: PPropInfo;
begin
  FProxyComponent := TProxyComponent.Create(nil, Self.Designer);
  FProxyComponent.FComponent := ACustomDataBinding;
  FComponentReference := ACustomDataBinding;
  PropInfo := System.TypInfo.GetPropInfo(FProxyComponent, 'ComponentProperty');
  Self.SetPropEntry(0, FProxyComponent, PropInfo);
  Self.Initialize;
end;


{ TAddDataBindingsPropertyFilter }
procedure TAddDataBindingsPropertyFilter.FilterProperties(
  const ASelection: IDesignerSelections;
  const ASelectionProperties: IInterfaceList);
var
  I, J: Integer;
  LSelectedItem: TPersistent;
  LNewProperty: TDataBindingSyntheticProperty;
  LProperty: IProperty;
  LIndex: Integer;
  LComponent: TComponent;
  LOptions: TBoundComponentOptions;
begin
  if ASelection.Count > 1 then
    // Don't show property if multiple selection
    Exit;

  for I := 0 to ASelection.Count - 1 do
  begin
    LSelectedItem := ASelection[I];
    if (LSelectedItem is TComponent) then
    begin
      LComponent := TComponent(LSelectedItem);
      LOptions := GetBoundComponentOptions(TComponentClass(LComponent.ClassType));
      if not (TBoundComponentOption.dbcoptAddDataBindingsProperty in LOptions) then
        continue;

      LNewProperty := TDataBindingSyntheticProperty.Create(Designer, 1);
      LNewProperty.Component := LComponent;
      LIndex := 0;
      for J := 0 to ASelectionProperties.Count - 1 do
      begin
        if Supports(ASelectionProperties[J], IProperty, LProperty) then
        begin
          if CompareText(LNewProperty.GetName, LProperty.GetName) <= 0  then
          begin
            LIndex := J;
            break;
          end;
        end;
      end;

      ASelectionProperties.Insert(LIndex, LNewProperty as IProperty);
    end;
  end;
end;

procedure TDataBindingComponentProperty.Edit(const Host: IPropertyHost; DblClick: Boolean);
var
  LHost20: IPropertyHost20;
  LCustomActions: TList<TCustomAction>;
begin
  FHost := Host;
  if FActionListView <> nil then
  begin
    FActionListView.Free;
  end;
  LCustomActions := TObjectList<TCustomAction>.Create;
  try

    FActionListView := TBindCompListView.Create(nil);
    FActionListView.Options := [dblvDelete, dblvSelect];
    FActionListView.DataBindingComponentName := FProxyComponent.FComponent.Name;
    if Supports(FHost, IPropertyHost20, LHost20) then
      FActionListView.Width := LHost20.GetDropDownWidth;
    FActionListView.OnDeleteDataBinding := DeleteDataBinding;
    FActionListView.OnSelectDataBindingComponent := SelectDataBindingComponent;
    FActionListView.AddVerbActions(FProxyComponent.FComponent, LCustomActions, Designer);
    FActionListView.CustomActions := LCustomActions.ToArray;
    FActionListView.Designer := Designer;
    FActionListView.Visible := True;
    FHost.DropDownControl(FActionListView);
  finally
    LCustomActions.Free;
  end;
end;

{ TDataBindingSyntheticProperty }

function TDataBindingSyntheticProperty.GetAttributes: TPropertyAttributes;
begin
  // Not nestible so that it won't appear inside expanded component references
  Result := [paSubProperties, paVolatileSubProperties, paCustomDropDown, paReadOnly, paNotNestable];
end;

function TDataBindingSyntheticProperty.GetName: string;
begin
  Result := sName
end;

procedure TDataBindingSyntheticProperty.GetProperties(Proc: TGetPropProc);
var
  LComponents: TArray<TContainedBindComponent>;
  LComponent: TContainedBindComponent;
  LComponentProperty: TDataBindingComponentProperty;
begin
  LComponents := GetDataBindingComponents(FComponent);
  for LComponent in LComponents do
  begin
    LComponentProperty := TDataBindingComponentProperty.Create(Designer, 1);
    LComponentProperty.SetComponent(LComponent);
    //LComponentProperty.FDataBindingsProperty := Self;
    LComponentProperty.FDataBindingsPropertyNamePath := GetName;
    Proc(LComponentProperty as IProperty);
  end;
end;

function TDataBindingSyntheticProperty.GetValue: string;
begin
  Result := GetName; // ReverseString(Component.Name);
end;

procedure TDataBindingSyntheticProperty.SetValue(const Value: string);
begin
  Component.Name := ReverseString(Value);
  Designer.Modified;
end;

function TDataBindingSyntheticProperty.ShowReferenceProperty: Boolean;
begin
  Result := True;
end;

destructor TDataBindingSyntheticProperty.Destroy;
begin
  FBindCompListView.Free;
  FHost := nil;
  inherited;
end;


procedure TDataBindingSyntheticProperty.Edit(const Host: IPropertyHost; DblClick: Boolean);
var
  LHost20: IPropertyHost20;
  LCustomActions: TList<TCustomAction>;
begin
  FHost := Host;
  if FBindCompListView <> nil then
    FBindCompListView.Free;
  LCustomActions := TObjectList<TCustomAction>.Create;
  try
    FBindCompListView := TBindCompListView.Create(nil);
    FBindCompListView.Options := [dblvCreateNewFactory, dblvSelectExisting];
    FBindCompListView.ControlComponent := ControlComponent;
    if Supports(FHost, IPropertyHost20, LHost20) then
      FBindCompListView.Width := LHost20.GetDropDownWidth;
    //FBindCompListView.OnNewDataBinding := CreateNewDataBinding;
    FBindCompListView.OnNewDataBindingFactory := CreateNewDataBindingFactory;
    FBindCompListView.OnCreateDataBindingFactoryContext := CreateDataBindingFactoryContext;
    FBindCompListView.OnSelectDataBindingProperty := SelectDataBindingProperty;
    FBindCompListView.Designer := Designer;
    FBindCompListView.AddFactoryActions(LCustomActions);
    //FBindCompListView.AddVerbActions(ControlComponent, LCustomActions);
    FBindCompListView.CustomActions := LCustomActions.ToArray;
    FBindCompListView.Visible := True;
    FHost.DropDownControl(FBindCompListView);
  finally
    LCustomActions.Free;
  end;
end;

procedure TDataBindingSyntheticProperty.SelectDataBindingProperty(Sender: TObject; DataBinding: TContainedBindComponent);
begin
//  if DataBinding <> nil then
//    SetValue(DataBinding.Owner.Name + DotSep + DataBinding.Name)
//  else
//    SetValue('');
  // Select under Databindings
  FHost.CloseDropDown;
  (BorlandIDEServices as IOTAPropInspServices).Expand;

  Designer.SelectItemName(GetName + '.' + DataBinding.Name);
end;

function TDataBindingSyntheticProperty.CreateDataBindingFactoryExecuteContext(ABindCompList: TCustomBindingsList): IBindCompFactoryExecuteContext;
var
  LComponent: TComponent;
begin
  Result := nil;
  LComponent := ControlComponent;
  if LComponent <> nil then
  begin
    Result := TDataBindingFactoryExecuteContext.Create(Designer, ABindCompList,
      LComponent); //FComponent);
  end;
end;

procedure TDataBindingSyntheticProperty.CreateDataBindingFactoryContext(Sender: TObject; ABindCompList: TCustomBindingsList;
  var AContext: IBindCompFactoryContext);
var
  LComponent: TComponent;
begin
  AContext := nil;
  LComponent := ControlComponent;
  if LComponent <> nil then
  begin
    AContext := TDataBindingFactoryContext.Create(Designer, ABindCompList,
      LComponent); //FComponent);
  end;
end;

procedure TDataBindingSyntheticProperty.CreateNewDataBindingFactory(Sender: TObject;
  DataBindingFactory: IBindCompFactory; BindingsList: TCustomBindingsList);
var
  LContext: IBindCompFactoryExecuteContext;
  LBindCompList: TBindingsList;
begin
  LBindCompList := nil;
  LContext := CreateDataBindingFactoryExecuteContext(BindingsList);
  Assert(LContext <> nil);
  if LContext.BindingsList = nil then
  begin
    LBindCompList := TBindingsList.Create(LContext.Owner);
    if Assigned(LContext.Owner) then
    begin
      //Place BindingsList in top left corner of parent (Low Word = Left, High Word = Top)
      LBindCompList.DesignInfo := (5 shl 16) + 20;
      LContext.Owner.InsertComponent(LBindCompList);
    end;
    LBindCompList.Name := LContext.UniqueName(LBindCompList.ClassType.ClassName
     );
    (LContext as TDataBindingFactoryExecuteContext).FBindCompList := LBindCompList;
  end;
  if FHost <> nil then
    FHost.CloseDropDown;
  if LContext <> nil then
    DataBindingFactory.Execute(LContext);
  if LBindCompList <> nil then
  begin
    if LBindCompList.BindCompCount = 0 then
      // Free compononent we've create because no binding components created
      LBindCompList.Free;
  end;

end;


{ TProxyComponent }

class constructor TProxyComponent.Create;
begin
  FPendingFreeList := TList<TComponent>.Create;
end;

constructor TProxyComponent.Create(AOwner: TComponent; ADesigner: IDesigner);
begin
  inherited Create(AOwner);
  FDesigner := ADesigner;
end;

destructor TProxyComponent.Destroy;
begin
  if FPendingFreeList.Contains(FComponent) then
  begin
    FPendingFreeList.Remove(FComponent);
    FComponent.Free;
    if FDesigner <> nil then
      FDesigner.Modified;
  end;
  inherited;
end;

class destructor TProxyComponent.Destroy;
begin
  FPendingFreeList.Free;
end;


{ TDataBindingFactory }


constructor TDataBindingFactory.Create(ACategory: string; AClass: TContainedBindCompClass);
begin
  FCategory := ACategory;
  FClass := AClass;
end;

function TDataBindingFactory.Enabled(
  AContext: IBindCompFactoryContext): Boolean;
begin
  Result := True;
end;

procedure TDataBindingFactory.Execute(
  AContext: IBindCompFactoryExecuteContext);
var
  LNewDataBinding: TContainedBindComponent;
begin
  LNewDataBinding := CreateBindComponent(AContext.Owner, FClass);
  LNewDataBinding.Name := AContext.UniqueName(LNewDataBinding.ClassType.ClassName);
  LNewDataBinding.Category := FCategory;
  LNewDataBinding.BindingsList := AContext.BindingsList;
  LNewDataBinding.ControlComponent := AContext.ControlComponent;
  AContext.BindCompCreated(LNewDataBinding);
end;

function TDataBindingFactory.GetCommandText(
  AContext: IBindCompFactoryContext): string;
begin
  Result := FClass.ClassName;
end;

{ TDataBindingFactoryContext }

constructor TDataBindingFactoryContext.Create(ADesigner: IDesigner; ABindCompList: TCustomBindingsList;
  AControlComponent: TComponent);
begin
  FDesigner := ADesigner;
  FBindCompList := ABindCompList;
  FControlComponent := AControlComponent;
end;

function TDataBindingFactoryContext.GetControlComponent: TComponent;
begin
  Result := FControlComponent;
end;

function TDataBindingFactoryContext.GetDesigner: IInterface;
begin
  Result := FDesigner;
end;

function TDataBindingFactoryContext.GetBindingsList: TCustomBindingsList;
begin
  Result := FBindCompList;
end;

function TDataBindingFactoryContext.GetOwner: TComponent;
begin
  if FBindCompList = nil then
    Result := FDesigner.Root
  else
    Result := FBindCompList.Owner;
end;


{ TDataBindingFactoryExecuteContext }


procedure TDataBindingFactoryExecuteContext.BindCompCreated(AComponent: TComponent);
begin
  FDesigner.Modified;
  (BorlandIDEServices as IOTAPropInspServices).VolatileModified;
  (BorlandIDEServices as IOTAPropInspServices).Expand;

  // Select under Databindings
  FDesigner.SelectItemName(TDataBindingSyntheticProperty.sName +  '.' + AComponent.Name);

end;


function TDataBindingFactoryExecuteContext.UniqueName(const
  ABaseName: string): string;
var
  LRoot: IRoot;
begin
  if (FBindCompList = nil) or (FBindCompList.Owner = FDesigner.Root) then
    Result := FDesigner.UniqueName(ABaseName)
  else
  begin
    LRoot := ActiveDesigner.FindRoot(FBindCompList.Owner);
    if LRoot <> nil then
      Result := LRoot.GetDesigner.UniqueName(ABaseName)
    else
      raise Exception.CreateResFmt(@SUnableToFindComponent, [FBindCompList.Owner.Name]);
  end;
end;


{ TSourceMemberNamePropertyEditor }

function TSourceMemberNamePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

function TSourceMemberNamePropertyEditor.GetBindComponent: TContainedBindComponent;
var
  Component: TPersistent;
begin
  Result := nil;
  Component := GetComponent(0);
  if Component is TContainedBindComponent then
    Result := TContainedBindComponent(Component)
  else if Component is TCollectionItem then
  begin
    while Component is TCollectionItem do
    begin
      Component := TCollectionItem(Component).Collection.Owner;
    end;
    if Component is TContainedBindComponent then
      Result := TContainedBindComponent(Component);
  end;
end;

function TSourceMemberNamePropertyEditor.GetSourceComponent: TComponent;
var
  PropInfo: PPropInfo;
  LBindComponent: TContainedBindComponent;
begin
  Result := nil;
  LBindComponent := GetBindComponent;
  if LBindComponent = nil then
    Exit;

  PropInfo := System.TypInfo.GetPropInfo(LBindComponent.ClassInfo, GetSourceComponentName);  // Do not localize
  Assert(PropInfo <> nil);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := TObject(GetOrdProp(LBindComponent, PropInfo)) as TComponent;
end;

function TSourceMemberNamePropertyEditor.GetSourceComponentName: string;
begin
  Result := 'SourceComponent';
end;

procedure TSourceMemberNamePropertyEditor.GetValueList(List: TStrings);
var
  LSourceComponent: TComponent;
  LScopeMemberNames: IScopeMemberNames;
begin
  LSourceComponent := GetSourceComponent;
  if Supports(LSourceComponent, IScopeMemberNames, LScopeMemberNames) then
    LScopeMemberNames.GetMemberNames(List);
end;

procedure TSourceMemberNamePropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;


{ TRttiUnitSelectionEditor }

procedure TRttiUnitSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('System.Rtti');
  Proc('System.Bindings.Outputs');
end;

{ TMethodsProperty }

type
  TPersistentCracker = class(TPersistent);

procedure TBindArtifactsPropertyEditor.Edit;
var
  LObj: TPersistent;
  LArtifacts: TBindArtifacts;
begin
  LObj := GetComponent(0);

  while (LObj <> nil) and not (LObj is TComponent) do
    LObj := TPersistentCracker(LObj).GetOwner;
  LArtifacts := TBindArtifacts(GetOrdValue);
  Assert(LArtifacts is TBindArtifacts);
  ShowForm(TComponent(LObj), LArtifacts);
end;


function TBindArtifactsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly, paVCL];
end;

{ TMethodsPropertyEditor }

procedure TMethodsPropertyEditor.ShowForm(AComponent: TComponent; AArtifacts: TBindArtifacts);
var
  LForm: TBindMethodsForm;
begin
  LForm := TBindMethodsForm.Create(Application);
  with LForm do
  try
    LForm.DesignerIntf := Self.Designer;
    LForm.BindArtifacts := AArtifacts;
    if ShowModal = mrOk then
    begin
      LForm.ApplyChanges;
      Self.Designer.Modified;
    end;
  except
    Free;
  end;
end;

{ TOutputConvertersProperty }

procedure TOutputConvertersPropertyEditor.ShowForm(AComponent: TComponent; AArtifacts: TBindArtifacts);
var
  LForm: TBindOutputConvertersForm;
begin
  LForm := TBindOutputConvertersForm.Create(Application);
  with LForm do
  try
    LForm.DesignerIntf := Self.Designer;
    LForm.BindArtifacts := AArtifacts;
    if ShowModal = mrOK then
    begin
      ApplyChanges;
      Self.Designer.Modified;
    end;
  except
    Free;
  end;
end;


{ TCustomBindCompListSelectionEditor }

// This method must be fast or it will slow down code insite.
procedure TCustomBindCompListSelectionEditor.RequiresUnits(Proc: TGetStrProc);
var
  LActiveClassGroup: TPersistentClass;

  function IsActiveFramework(AFrameworkClass: TPersistentClass): Boolean;
  var
    LClassGroup: TPersistentClass;
  begin
    if AFrameworkClass = nil then
      Exit(True);
    LClassGroup := System.Classes.ClassGroupOf(AFrameworkClass);
    Result := LActiveClassGroup.InheritsFrom(LClassGroup);
  end;

  // Detect units with DB dependencies
  function IsDBUnit(const AUnitName: string): Boolean;
  const
    cDB = 'Data.Bind.DB';
  begin
    Result := SameText(cDB, Copy(AUnitName, 1, Length(cDB)));
  end;

  function CanUseUnit(const AUnitName: string): Boolean;
  begin
    Result := (AUnitName <> '') and (not IsDBUnit(AUnitName));

  end;

var
  BindingsList: TCustomBindingsList;
  UseUnits, ExcludedList: TStringList;
  CurUnitName: string;
  MethodDesc: TMethodDescription;
  ConverterDesc: TConverterDescription;
  I, CompNum: Integer;
  LFrameworkClass: TPersistentClass;
begin
  LActiveClassGroup := Designer.ActiveClassGroup;


  UseUnits := TStringList.Create;
  UseUnits.CaseSensitive := True; // Improve IndexOf performance
  ExcludedList := TStringList.Create;
  ExcludedList.CaseSensitive := True;
  try
    for CompNum := 0 to Designer.Root.ComponentCount - 1 do
    begin
      if Designer.Root.Components[CompNum] is TCustomBindingsList then
      begin
        BindingsList := TCustomBindingsList(Designer.Root.Components[CompNum]);

        //check for method units
        ExcludedList.Clear;
        for I := 0 to BindingsList.Methods.Count - 1 do
        begin
          if BindingsList.Methods.Items[I].State = eaInclude then
          begin
            CurUnitName := TBindingMethodsFactory.GetMethodUnitName(BindingsList.Methods.Items[I].ID);
            if (CurUnitName <> '') and (UseUnits.IndexOf(CurUnitName) = -1)  then
            begin
              LFrameworkClass := TBindingMethodsFactory.GetMethodFrameworkClass(BindingsList.Methods.Items[I].ID);
              if CanUseUnit(CurUnitName) and IsActiveFramework(LFrameworkClass) then
                UseUnits.Add(CurUnitName);
            end;
          end
          else
            ExcludedList.Add(BindingsList.Methods.Items[I].ID);
        end;
        //now add methods enabled by default unless explicitly excluded
        for MethodDesc in TBindingMethodsFactory.GetRegisteredMethods do
          if (MethodDesc.UnitName <> '') and (UseUnits.IndexOf(MethodDesc.UnitName) = -1) then
            if MethodDesc.DefaultEnabled and (ExcludedList.IndexOf(MethodDesc.ID) = -1) then
              if CanUseUnit(MethodDesc.UnitName) and IsActiveFramework(MethodDesc.FrameworkClass) then
                UseUnits.Add(MethodDesc.UnitName);

        //check for output converter units
        ExcludedList.Clear;
        for I := 0 to BindingsList.OutputConverters.Count - 1 do
        begin
          if BindingsList.OutputConverters.Items[I].State = eaInclude then
          begin
            CurUnitName := TValueRefConverterFactory.GetConverterUnitName(BindingsList.OutputConverters.Items[I].ID);
            if (CurUnitName <> '') and  (UseUnits.IndexOf(CurUnitName) = -1) then
            begin
              LFrameworkClass := TValueRefConverterFactory.GetConverterFrameworkClass(BindingsList.OutputConverters.Items[I].ID);
              if CanUseUnit(CurUnitName) and IsActiveFramework(LFrameworkClass) then
                UseUnits.Add(CurUnitName);
            end;
          end
          else
            ExcludedList.Add(BindingsList.OutputConverters.Items[I].ID);
        end;
        //now add converters enabled by default unless explicitly excluded
        for ConverterDesc in TValueRefConverterFactory.GetConverterDescriptions do
          if (ConverterDesc.UnitName <> '') and (UseUnits.IndexOf(ConverterDesc.UnitName) = -1) then
            if ConverterDesc.DefaultEnabled and (ExcludedList.IndexOf(ConverterDesc.ID) = -1) then
              if CanUseUnit(ConverterDesc.UnitName) and IsActiveFramework(ConverterDesc.FrameworkClass) then
                UseUnits.Add(ConverterDesc.UnitName);
      end;
    end;

    for I := 0 to UseUnits.Count - 1 do
      Proc(UseUnits[I]);
  finally
    ExcludedList.Free;
    UseUnits.Free;
  end;
end;


{ TFieldNamePropertyEditor }

function TFieldNamePropertyEditor.GetSourceComponentName: string;
begin
  Result := 'DataSource'; // Do not localize
end;

{ TNewBindCompDialogFactory }

function TNewBindCompDialogFactory.Enabled(
  AContext: IBindCompFactoryContext): Boolean;
begin
  Result := True;
end;

procedure TNewBindCompDialogFactory.Execute(
  AContext: IBindCompFactoryExecuteContext);
var
  LDataBinding: TContainedBindComponent;
  LDesigner: IBindCompDesigner;
begin
  with TExecuteNewDataBinding.Create(AContext.BindingsList,
    AContext.Designer as IDesigner) do
  begin
    Execute(
      procedure
      begin
        //SelectNone(False)
      end,
      procedure(ACategory: string; ADataBinding: TContainedBindComponent)
      begin
        LDataBinding := ADataBinding;
        LDataBinding.Name := AContext.UniqueName(LDataBinding.ClassType.ClassName +
          AContext.ControlComponent.Name);
        LDataBinding.Category := ACategory;
        LDataBinding.BindingsList := AContext.BindingsList;
        LDataBinding.ControlComponent := AContext.ControlComponent;
        AContext.BindCompCreated(LDataBinding);
      end,
      procedure
      begin
        //FocusDataBinding(LDataBinding)
      end,
      function(AClass: TContainedBindCompClass): Boolean
      begin
       LDesigner := GetBindCompDesigner(AClass);
       if LDesigner <> nil then
          // Allow class
          Result := LDesigner.CanBindComponent(AClass,
            AContext.ControlComponent, AContext.Designer)
       else
         Result := False;
      end);
  end;
end;

function TNewBindCompDialogFactory.GetCategory: string;
begin
  Result := '';
end;

function TNewBindCompDialogFactory.GetCommandText(
  AContext: IBindCompFactoryContext): string;
begin
  Result := SNewBindingDlgCommand;
end;

{ TFactoryAction }


constructor TFactoryAction.Create(const ACaption: string;
  ABindingsList: TCustomBindingsList; AFactory: IBindCompFactory);
begin
  inherited Create(nil);
  Caption := ACaption;
  FBindingsList := ABindingsList;
  FFactory := AFactory;
end;

function TFactoryAction.Execute: Boolean;
begin
  Assert(False);
  Result := True;

end;

{ TVerbAction }

constructor TVerbAction.Create(const ACaption: string; AComponent: TComponent;
  AVerb: integer; ADesigner: IDesigner);
begin
  inherited Create(nil);
  Caption := ACaption;
  FDesigner := ADesigner;
  FComponent := AComponent;
  FVerb := AVerb;
end;

function TVerbAction.Execute: Boolean;
var
  LEditor: IComponentEditor;
begin
  LEditor := GetComponentEditor(FComponent, FDesigner);
  if LEditor <> nil then
  begin
    if FVerb < LEditor.GetVerbCount then
    begin
      LEditor.ExecuteVerb(FVerb);
    end;

  end;

  Result := True;
end;

{ TBindCompFactorySelectionEditorExecuteContext }

procedure TBindCompFactorySelectionEditorExecuteContext.BindCompCreated(
  AComponent: TComponent);
begin
  FDesigner.Modified;
  (BorlandIDEServices as IOTAPropInspServices).VolatileModified;
//  (BorlandIDEServices as IOTAPropInspServices).Expand;

  // Select under Databindings
  FDesigner.SelectComponent(AComponent);
end;

initialization
  System.Bindings.ObjEval.IsProxyClassProc := Proxies.IsProxyClass;
end.
