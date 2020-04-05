{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.Bind.Components"'}    {Do not Localize}
unit Data.Bind.Components;

interface

uses
  System.Classes, System.SysUtils, System.Rtti, System.Generics.Collections,
  System.Bindings.Expression, System.Bindings.EvalProtocol,
  System.Bindings.Manager, System.Bindings.Outputs;

type
  TBasicBindComponent = class(TComponent)

  end;

  TCustomBindingsList = class;

  TContainedBindComponent = class abstract(TBasicBindComponent)
  private
    FBindingsList: TCustomBindingsList;
    FCategory: string;
    procedure SetCategory(const Value: string);
    procedure SetBindingsList(const Value: TCustomBindingsList);
    function GetIndex: Integer;
    procedure SetIndex(Value: Integer);
  protected
    function GetBindingsList: TCustomBindingsList; virtual;
    procedure ReadState(Reader: TReader); override;
    function GetControlComponent: TComponent; virtual; abstract;
    procedure SetControlComponent(const Value: TComponent);  virtual; abstract;
    procedure CheckControlComponent;
    function DisplayName: string; virtual;
    function Designing: Boolean; virtual;
    function Loading: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    procedure SetParentComponent(AParent: TComponent); override;
    property BindingsList: TCustomBindingsList read GetBindingsList write SetBindingsList;
    property Index: Integer read GetIndex write SetIndex stored False;
    property ControlComponent: TComponent read GetControlComponent write SetControlComponent;
  published
    property Category: string read FCategory write SetCategory;
  end;

  TBindCompExpressionType = (exprUnspecified, exprPosSource, exprPosControl, exprFill, exprParse, exprFormat, exprClear,
    exprFormatColumn, exprOther1, exprOther2, exprOther3, exprFormatControl);

  TBindCompEvalErrorEvent = procedure(Sender: TObject; AException: Exception) of object;
  TBindCompAssigningValueEvent = procedure(Sender: TObject; AssignValueRec: TBindingAssignValueRec;
     var Value: TValue; var Handled: Boolean) of object;
  TBindCompAssignedValueEvent = procedure(Sender: TObject; AssignValueRec: TBindingAssignValueRec;
     const Value: TValue) of object;

  TCommonBindComponent = class(TContainedBindComponent)
  strict private
    FSourceComponent: TComponent;
    FOnAssigningValue: TBindCompAssigningValueEvent;
    FOnAssignedValue: TBindCompAssignedValueEvent;
    FOnEvalError: TBindCompEvalErrorEvent;
    FControlComponent: TComponent;
    FSourceMemberName: string;
    procedure SetSourceComponent(const Value: TComponent);
    procedure SetSourceMemberName(const Value: string);
  private
    FOnActivating: TNotifyEvent;
    FOnActivated: TNotifyEvent;
  protected
    function GetSourceMemberName: string;
    procedure DoOnAssigningValue(AssignValueRec: TBindingAssignValueRec;
     var Value: TValue; var Handled: Boolean); virtual;
    procedure DoOnAssignedValue(AssignValueRec: TBindingAssignValueRec;
     const Value: TValue); virtual;
    procedure DoOnEvalError(AException: Exception); virtual;
    procedure DoOnActivating; virtual;
    procedure DoOnActivated; virtual;
    procedure DoOnDeactivating; virtual;
    procedure DoOnDeactivated; virtual;
    function GetControlScopes: TArray<IScope>;
    function GetSourceScopes: TArray<IScope>;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetControlComponent(const Value: TComponent); override;
    function GetControlComponent: TComponent; override;
    procedure FreeExpressionsObjects; virtual;
    procedure UpdateExpressions; virtual;
    procedure FreeExpressionObjects(AList: TList<TBindingExpression>);
    function GetComponentScope(AComponent: TComponent;
      const AMemberName: string=''): IScope;
    function GetComponentScopes(AComponent: TComponent;
      const AMemberName: string=''): TArray<IScope>; overload;
    function GetComponentScopes(AComponentScope: IScope): TArray<IScope>; overload;
    function GetMethodsScope: IScope;
    function GetOutputConverter: IValueRefConverter;

    procedure UpdateSourceChanging; virtual;
    procedure UpdateSourceChanged; virtual;
    procedure UpdateControlChanging; virtual;
    procedure UpdateControlChanged; virtual;
    procedure UpdateSourceMemberChanging; virtual;
    procedure UpdateSourceMemberChanged; virtual;
    procedure EvaluateControlExpression(
      AEditorScope: IScope; const AEditorExpression: string; ACallback: TProc<IValue>); overload;
    procedure EvaluateSourceExpression(
      ASourceScope: IScope; const AEnumExpression: string; ACallback: TProc<IValue>); overload;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure EvaluateControlExpression(const AExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType = exprUnspecified); overload; virtual;
    procedure EvaluateSourceExpression(const AExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType = exprUnspecified); overload; virtual;
    procedure ExecuteAssignToControlExpression(const
      AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType = exprUnspecified); overload; virtual;
    procedure ExecuteAssignToSourceExpression(const
      AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType = exprUnspecified); virtual;
    property SourceComponent: TComponent read FSourceComponent write SetSourceComponent;
    property SourceMemberName: string read GetSourceMemberName write SetSourceMemberName;
    property ControlComponent: TComponent read GetControlComponent write SetControlComponent;
    property OnAssigningValue: TBindCompAssigningValueEvent read FOnAssigningValue write FOnAssigningValue;
    property OnAssignedValue: TBindCompAssignedValueEvent read FOnAssignedValue write FOnAssignedValue;
    property OnEvalError: TBindCompEvalErrorEvent read FOnEvalError write FOnEvalError;
    property OnActivating: TNotifyEvent read FOnActivating write FOnActivating;
    property OnActivated: TNotifyEvent read FOnActivated write FOnActivated;
  end;

  TContainedBindCompClass = class of TContainedBindComponent;

  TBindingsListEnumerator = class;

  TMethods = class;
  TOutputConverters = class;

  TCustomBindingsList = class(TComponent)
  private
    FBindComps: TList<TContainedBindComponent>;
    FMethods: TMethods;
    FUseAppManager: Boolean;
    FBindingsManager: TBindingManager;
    FOutputConverters: TOutputConverters;
    FOutputConverter: IValueRefConverter;
    FMethodsScope: IScope;
    function GetBindComp(Index: Integer): TContainedBindComponent;
    function GetBindCompCount: Integer;
    procedure SetBindComp(Index: Integer; const Value: TContainedBindComponent);
    procedure SetMethods(const Value: TMethods);
    procedure SetOutputConverters(const Value: TOutputConverters);
    procedure SetUseAppManager(Value: Boolean);
    function GetUseAppManager: Boolean;
    function GetOutputConverterNames: TArray<string>;
  protected
    procedure AddBindComp(ABindComp: TContainedBindComponent);
    procedure RemoveBindComp(ABindComp: TContainedBindComponent);
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetMethodsScope: IScope;
    function GetOutputConverter: IValueRefConverter;
    procedure Notify(const AObject: TObject; const AProperty: string);
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    property Methods: TMethods read FMethods write SetMethods;
    property OutputConverters: TOutputConverters read FOutputConverters write SetOutputConverters;
    function GetEnumerator: TBindingsListEnumerator;
    property BindComps[Index: Integer]: TContainedBindComponent read GetBindComp write SetBindComp; default;
    property BindCompCount: Integer read GetBindCompCount;
    property UseAppManager: Boolean read GetUseAppManager write SetUseAppManager;
  end;

  TBindingsListEnumerator = class
  private
    FIndex: Integer;
    FBindCompList: TCustomBindingsList;
  public
    constructor Create(ABindCompList: TCustomBindingsList);
    function GetCurrent: TContainedBindComponent;
    function MoveNext: Boolean;
    property Current: TContainedBindComponent read GetCurrent;
  end;

  TBindingsList = class(TCustomBindingsList)
  published
    property Methods;
    property OutputConverters;
    property UseAppManager;
  end;

  TActivatedContainedBindComponent = class(TCommonBindComponent)
  strict private
    FAutoActivate: Boolean;
    procedure AddScopeExpressions;
    procedure RemoveScopeExpressions;
  private
    procedure DesignAutoActivateOnPropertyChange;
  protected
    procedure LoadActivate; virtual;
    procedure BindActivate(Value: Boolean); virtual;
    function CanDesignActivate: Boolean; virtual;
    function ActivateFromSource: Boolean;
    procedure UpdateEnableChanging; virtual;
    procedure UpdateEnableChanged; virtual;
    procedure SetActive(AValue: Boolean); virtual; abstract;
    function GetActive: Boolean; virtual; abstract;
    function GetAutoActivate: Boolean; virtual;
    procedure SetAutoActivate(AValue: Boolean); virtual;
    function CanActivate: Boolean; virtual;
    procedure ApplyComponents; virtual;
    procedure UpdateSourceChanging; override;
    procedure UpdateSourceMemberChanged; override;
    procedure UpdateSourceChanged; override;
    procedure UpdateControlChanged; override;
    procedure UpdateControlChanging; override;
    procedure UpdateSourceMemberChanging; override;
  public
    constructor Create(AOwner: TComponent); override;
    property AutoActivate: Boolean read GetAutoActivate write SetAutoActivate default True;
    property Active: Boolean read GetActive write SetActive;
  end;


  IBindActivate = interface
    ['{79856F26-5E66-4A24-B4DE-A7DBBE6356AD}']
    procedure SetActive(AValue: Boolean);
  end;


  // Single managed or unmanaged expression
  TBaseBindExpression = class(TActivatedContainedBindComponent, IBindActivate)
  private
    FDeferActive: Boolean;
    FActive: Boolean;
    FManaged: Boolean;
    FNotifyOutputs: Boolean;
    procedure SetManaged(const Value: Boolean);
    procedure SetNotifyOutputs(const Value: Boolean);
  protected
    procedure Loaded; override;
    function GetActive: Boolean; override;
    procedure EvaluateFormat; virtual;
    procedure EvaluateClear; virtual;
    { IBindActivate }
    procedure IBindActivate.SetActive = BindActivate;
    procedure SetActive(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Managed: Boolean read FManaged write SetManaged default True;
    property NotifyOutputs: Boolean read FNotifyOutputs write SetNotifyOutputs;
  end;

  TExpressionDirection = (dirSourceToControl, dirControlToSource, dirBidirectional);

  TCustomBindExpression = class(TBaseBindExpression)
  private
    FSourceExpression: string;
    FExpressionObject: TBindingExpression;
    FReverseExpressionObject: TBindingExpression;
    FControlExpression: string;
    FDirection: TExpressionDirection;
    procedure SetSourceExpression(const Value: string);
    procedure SetControlExpression(const Value: string);
  protected
    procedure EvaluateWithoutNotify;
    procedure UpdateExpressions; override;
    procedure FreeExpressionsObjects; override;
    function CanActivate: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ControlExpression: string read FControlExpression write SetControlExpression;
    property Direction: TExpressionDirection read FDirection write FDirection;
    procedure EvaluateFormat; override;
    procedure Evaluate;
    procedure Recompile;
    property SourceExpression: string read FSourceExpression write SetSourceExpression;
  end;

  TBindExpression = class(TCustomBindExpression)
  published
    property ControlComponent;
    property SourceComponent;
    property SourceMemberName;
    property SourceExpression;
    property ControlExpression;
    property AutoActivate;
    property Managed;
    property NotifyOutputs;
    property Direction;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  TExpressions = class;
  TExpressionsDir = class;

  // Collection of managed or unmanaged expression
  TCustomBindExprItems = class(TBaseBindExpression)
  private
    FFormatExpressions: TExpressionsDir;
    FFormatExpressionObjects:  TList<TBindingExpression>;
    FReverseFormatExpressionObjects:  TList<TBindingExpression>;
    FClearExpressionObjects:  TList<TBindingExpression>;
    FClearExpressions: TExpressionsDir;
    procedure SetFormatExpressions(Value: TExpressionsDir);
    procedure SetClearExpressions(const Value: TExpressionsDir);
    procedure EvaluateWithoutNotify;
  protected
    procedure UpdateExpressions; override;
    procedure FreeExpressionsObjects; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure EvaluateFormat; override;
    procedure EvaluateClear; override;
    procedure Recompile;
    property FormatExpressions: TExpressionsDir read FFormatExpressions write SetFormatExpressions;
    property ClearExpressions: TExpressionsDir read FClearExpressions write SetClearExpressions;
  end;

  TBindExprItems = class(TCustomBindExprItems)
  published
    property ControlComponent;
    property SourceComponent;
    property SourceMemberName;
    property FormatExpressions;
    property ClearExpressions;
    property AutoActivate;
    property Managed;
    property NotifyOutputs;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  IScopeRecordEnumerator = interface
  ['{6C93BB29-D210-43E9-9850-0C22EDD0F9B2}']
                                               
    procedure First;
    function GetCurrent: IScope;
    function GetMemberCurrent(const AMemberName: string): IScope;
    function MoveNext: Boolean;
    property Current: IScope read GetCurrent;
  end;

  IScopeRecordEnumeratorCount = interface
    ['{46FAE534-6F58-4850-AF66-14DF7B8AEC0C}']
    function GetRecordCount: Integer;
    property RecordCount: Integer read GetRecordCount;
  end;


  IScopeRecordEnumerable = interface
    ['{34A6773D-A71B-4870-9C60-409A798206FA}']
    function GetEnumerator(const AMemberName: string; ABufferCount: Integer = -1): IScopeRecordEnumerator;
  end;

  IScopeCurrentRecord = interface
    ['{5ADA44B4-4E81-401B-9784-3B51D29A5149}']
    function GetCurrentRecord(const AMemberName: string): IScope;
  end;

  IBindLink = interface
    ['{4E952D1B-0D23-41C4-8DF0-D24C4C325D5C}']
    procedure BeginUpdate;
    procedure EndUpdate;
    function GetUpdating: Boolean;
    property Updating: Boolean read GetUpdating;
    procedure SetIsReadOnly(Value: Boolean);
    function IsRequired: Boolean;
    function IsValidChar(AKey: Char): Boolean;
    function GetCanModify: Boolean;
    function GetIsModified: Boolean;
    procedure SetModified;
    function Edit: Boolean;
    function GetIsEditing: Boolean;
    procedure Reset;
    procedure UpdateRecord;
    procedure EvaluateParse(const AMemberName: string);
    procedure EvaluateFormat(const AMemberName: string);
    procedure EvaluateClear(const AMemberName: string);
    function GetActive: Boolean;
    procedure SetActive(AValue: Boolean);
    function GetBindComp: TComponent;
    function GetSourceMemberName: string;
    property Active: Boolean read GetActive write SetActive;
    property BindComp: TComponent read GetBindComp;
    property SourceMemberName: string read GetSourceMemberName;
    property IsModified: Boolean read GetIsModified;
    property CanModify: Boolean read GetCanModify;
    property IsEditing: Boolean read GetIsEditing;
    procedure ClearEditingLink;
  end;


  IBindPosition = interface
    ['{6E9EB32B-4982-4D4D-9510-A0ADFB1BDCC8}']
    function GetBindComp: TComponent;
    procedure PosChanged;
    function GetActive: Boolean;
    function GetSourceMemberName: string;
    procedure EvaluatePosControl;
    procedure EvaluatePosClear;
    procedure SetActive(AValue: Boolean);
    property BindComp: TComponent read GetBindComp;
    property Active: Boolean read GetActive write SetActive;
    property SourceMemberName: string read GetSourceMemberName;
  end;

  IBindListUpdate = interface
    ['{01EED9E9-F0BD-4752-A6BA-F79EF46ABE55}']
    function GetBindComp: TComponent;
    procedure UpdateList;
    property BindComp: TComponent read GetBindComp;
  end;

  IBindListRefresh = interface
    ['{89D41A89-AA65-4177-A3D3-373E1430EF35}']
    procedure RefreshList;
    function RefreshNeeded: Boolean;
  end;

  IBindListRefreshing = interface
    ['{1B1D65B7-EB88-4D81-A1B4-D706DCE4C05C}']
    function GetListRefreshing: TNotifyEvent;
    procedure SetListRefreshing(AEvent: TNotifyEvent);
    property OnListRefreshing: TNotifyEvent read GetListRefreshing write SetListRefreshing;
  end;

  IBindLayoutChanged = interface
    ['{6913B4FE-45C1-4844-9C9F-A2F59309C9FC}']
    procedure LayoutChanged;
  end;

  TFormatCallback = reference to procedure(const ASourceScope, AControlScope: IScope);

  TBindCheckBoxState = (cbUnchecked, cbChecked, cbGrayed);

  IBindCheckBoxEditor = interface
    ['{907EB30C-3C04-400C-88FD-3E9FD5EAE761}']
    function GetState: TBindCheckBoxState ;
    procedure SetState(Value: TBindCheckBoxState );
    function GetAllowGrayed: Boolean;
    procedure SetAllowGrayed(Value: Boolean);
    property AllowGrayed: Boolean read GetAllowGrayed write SetAllowGrayed;
    property State: TBindCheckBoxState read GetState write SetState;
  end;

  IBindListEditor = interface
    ['{C0D3125F-F9E8-4EAE-98CB-AC16D0E7B075}']
    procedure BeginUpdate;
    procedure EndUpdate;
    function AddItem(Select: Boolean = False): IScope;
    function InsertItem(Select: Boolean = False): IScope;
    function CanInsertItem: Boolean;
    function CurrentItem: IScope;
    function MoveNext: Boolean;
    function GetRowCount: Integer;
    procedure DeleteToEnd;
    function UpdateNeeded(ARecordEnumerator: IScopeRecordEnumerator): Boolean;
    procedure UpdateList(ARecordEnumerator: IScopeRecordEnumerator; AFormatProc: TFormatCallback);
    procedure FillList(ARecordEnumerator: IScopeRecordEnumerator; AFormatProc: TFormatCallback);
    procedure ClearList;
    function GetSelectedItem: TObject;
    function GetSelectedText: string;
    procedure SetSelectedText(const AValue: string);
    property SelectedText: string read GetSelectedText write SetSelectedText;
    property SelectedItem: TObject read GetSelectedItem;
    property RowCount: Integer read GetRowCount;
  end;

  IBindGridEditor = interface
    ['{FDE1D9BA-4277-4549-945F-ABFC5E61A56D}']
    procedure GetColumnNames(AList: TStrings);
    procedure GetColumnIndices(AList: TStrings);
  end;

  IBindLinkColumns = interface(IBindLink)
    ['{F0FAEC32-EC29-45C1-9490-1DC9CD169DD4}']
    function GetEditColumnName: string;
    function GetEditColumnIndex: integer;
    procedure SetEditColumn(const AName: string; AIndex: Integer);
    property EditColumnName: string read GetEditColumnName;
    property EditColumnIndex: Integer read GetEditColumnIndex;
  end;

  TExpressionItem = class;
  TExpressionItemDir = class;


  // Keep a control in synch with data
  TCustomBindPosition = class(TActivatedContainedBindComponent, IBindPosition)
  private
    FPositionObserver: IPositionLinkObserver;
    procedure SetPosControlExpressions(const Value: TExpressions);
    procedure SetPosSourceExpressions(const Value: TExpressions);
    procedure SetPosClearExpressions(const Value: TExpressions);
   var
    FPosControlExpressions: TExpressions;
    FPosSourceExpressions: TExpressions;
    FPosClearExpressions: TExpressions;
    FDeferActive: Boolean;
    FActive: Boolean;
    FPosControlExpressionObjects: TList<TBindingExpression>;
    FPosSourceExpressionObjects: TList<TBindingExpression>;
    FPosClearExpressionObjects: TList<TBindingExpression>;
    FControlExpressionObject: TBindingExpression;
  protected
    procedure CheckEditingLink; virtual;
    procedure ClearEditingLink; virtual;
    function RequiresControlHandler: Boolean; virtual;
    procedure UpdateControlChanging; override;
    procedure UpdateExpressions; override;
    procedure FreeExpressionsObjects; override;
    procedure Loaded; override;
    procedure SetControlComponent(const Value: TComponent); override;
    { IBindPosition }
    function GetBindComp: TComponent;
    procedure PosChanged;
    function GetActive: Boolean; override;
    procedure SetActive(Value: Boolean); override;
    procedure EvaluatePosControl;
    procedure EvaluatePosSource;
    procedure EvaluatePosClear;
    { IBindPosition }
    procedure IBindPosition.SetActive = BindActivate;
  public
    property PosSourceExpressions: TExpressions read FPosSourceExpressions write SetPosSourceExpressions;
    property PosControlExpressions: TExpressions read FPosControlExpressions write SetPosControlExpressions;
    property PosClearExpressions: TExpressions read FPosClearExpressions write SetPosClearExpressions;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TBindPosition = class(TCustomBindPosition)
  published
    property ControlComponent;
    property SourceComponent;
    property SourceMemberName;
    property PosSourceExpressions;
    property PosControlExpressions;
    property PosClearExpressions;
    property AutoActivate;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  TCustomBindList = class(TActivatedContainedBindComponent, IBindActivate)
  private
    FBufferCount: Integer;
    procedure SetFormatExpressions(const Value: TExpressions);
    procedure EvaluateExpressionItem(AItem: TExpressionItem; AEditorScope,
      AEnumScope: IScope); overload;
    procedure EvaluateExpressions(AEditorScope: IScope; const AEditorExpression: string;
      AEnumScope: IScope; const AEnumExpression: string); overload;
    function GetBindListEditor: IBindListEditor;
    function GetScopeRecordEnumerator: IScopeRecordEnumerator;
    function TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
    procedure SetClearControlExpressions(const Value: TExpressions);
    procedure SetFormatControlExpressions(const Value: TExpressions);
    procedure EvaluateClearControl;
    procedure EvaluateFormatControl;
   var
    FFormatExpressions: TExpressions;
    FFormatControlExpressions: TExpressions;
    FClearControlExpressions: TExpressions;
    FFormatControlExpressionObjects:  TList<TBindingExpression>;
    FClearControlExpressionObjects:  TList<TBindingExpression>;
    FDeferActive: Boolean;
    FActive: Boolean;
    FAutoFill: Boolean;
    FControlExpressionObject: TBindingExpression;
    procedure SetAutoFill(const Value: Boolean);
    function TryGetScopeRecordEnumerator(
      out AEnumerator: IScopeRecordEnumerator): Boolean;
  protected
    procedure EvaluatePosControl; virtual;
    procedure UpdateExpressions; override;
    procedure FreeExpressionsObjects; override;
    procedure Loaded; override;
    function GetActive: Boolean; override;
    { IBindActivate }
    procedure IBindActivate.SetActive = BindActivate;
    procedure SetActive(Value: Boolean); override;
  public
    property FormatExpressions: TExpressions read FFormatExpressions write SetFormatExpressions;
    property FormatControlExpressions: TExpressions read FFormatControlExpressions write SetFormatControlExpressions;
    property ClearControlExpressions: TExpressions read FClearControlExpressions write SetClearControlExpressions;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearList;
    procedure FillList;
    function CanInsert: Boolean;
    function CanUpdate: Boolean;
    procedure InsertItem(Select: Boolean = True);
    procedure UpdateItem;
    procedure AddItem(Select: Boolean = True);
    procedure ExecuteAssignToSourceExpression(const AControlExpression,
      ASourceExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType); override;
    procedure ExecuteAssignToControlExpression(const AControlExpression,
      ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); override;
    procedure EvaluateControlExpression(const AExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType); override;
    procedure EvaluateSourceExpression(const AExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); override;
    procedure ResetList;
    property BufferCount: Integer read FBufferCount write FBufferCount default -1;
    property AutoFill: Boolean read FAutoFill write SetAutoFill default True;
  end;

  TBindList = class(TCustomBindList)
  published
    property ControlComponent;
    property SourceComponent;
    property SourceMemberName;
    property FormatExpressions;
    property FormatControlExpressions;
    property ClearControlExpressions;
    property AutoFill;
    property BufferCount;
    property AutoActivate;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  TControlObserver = class;

  TCustomBindListLink = class(TCustomBindList, IBindPosition,
    IBindLink, IBindListUpdate)
  private
    FParseExpressionObjects:  TList<TBindingExpression>;
    FParseExpressions:  TExpressions;
    FPosSourceExpressions: TExpressions;
    FPosControlExpressions: TExpressions;
    FPosControlExpressionObjects: TList<TBindingExpression>;
    FPosSourceExpressionObjects: TList<TBindingExpression>;
    FControlExpressionObject: TBindingExpression;
    FControlObserver: TControlObserver;
    FUpdateCounter: Integer;
    FBufferCount: Integer;
    FLockPosControl: Integer;
    procedure SetPosControlExpressions(const Value: TExpressions);
    procedure SetPosSourceExpressions(const Value: TExpressions);
    procedure SetParseExpressions(const Value: TExpressions);
    procedure FillRecord(const ASourceScope, AEditorScope: IScope);
    procedure ClearModified;
    function RequiresControlHandler: Boolean;
    procedure CheckEditingLink;
  protected
    procedure UpdateControlChanging; override;
    procedure FreeExpressionsObjects; override;
    procedure UpdateExpressions; override;
    { IBindPosition }
    function GetBindComp: TComponent;
    procedure PosChanged;
    function GetActive: Boolean; override;
    function GetSourceMemberName: string;
    procedure SetActive(Value: Boolean); override;
    procedure EvaluatePosControl; override;
    procedure EvaluatePosSource;
    procedure EvaluatePosClear;
    { IBindLink }
    function GetUpdating: Boolean;
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsRequired: Boolean;
    procedure SetIsReadOnly(Value: Boolean);
    function IsValidChar(AKey: Char): Boolean;
    function GetCanModify: Boolean;
    procedure SetModified;
    function GetIsModified: Boolean;
    function Edit: Boolean;
    function GetIsEditing: Boolean;
    procedure Reset;
    procedure UpdateRecord;
    procedure EvaluateParse(const AMemberName: string);
    procedure EvaluateFormat(const AMemberName: string);
    procedure EvaluateClear(const AMemberName: string);
    procedure ClearEditingLink; virtual;
    { IBindListUpdate }
    procedure UpdateList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ResetList;
    procedure ExecuteAssignToSourceExpression(const AControlExpression,
      ASourceExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType); override;
    property ControlComponent: TComponent read GetControlComponent write SetControlComponent;
    property PosSourceExpressions: TExpressions read FPosSourceExpressions write SetPosSourceExpressions;
    property PosControlExpressions: TExpressions read FPosControlExpressions write SetPosControlExpressions;
    property ParseExpressions: TExpressions read FParseExpressions write SetParseExpressions;
  end;

  TBindListLink = class(TCustomBindListLink)
  published
    property ControlComponent;
    property SourceComponent;
    property FormatExpressions;
    property ParseExpressions;
    property PosControlExpressions;
    property PosSourceExpressions;
    property FormatControlExpressions;
    property ClearControlExpressions;
    property SourceMemberName;
    property AutoFill;
    property AutoActivate;
    property BufferCount;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  /// <summary>Bound Output or LValue custom conversion routine signature.</summary>
  TConvertProc = reference to procedure(InValue: TValue; var OutValue: TValue);

  TCustomBindLink = class(TActivatedContainedBindComponent, IBindLink)
  private
    FUpdateCounter: Integer;
    FControlObserver: TControlObserver;
    FFormatExpressions: TExpressions;
    FClearExpressions: TExpressions;
    FParseExpressions: TExpressions;
    FDeferActive: Boolean;
    FActive: Boolean;
    FControlExpressionObject: TBindingExpression;
    FParseExpressionObjects: TList<TBindingExpression>;
    FFormatExpressionObjects: TList<TBindingExpression>;
    FClearExpressionObjects: TList<TBindingExpression>;
    procedure SetClearExpressions(const Value: TExpressions);
    procedure SetFormatExpressions(const Value: TExpressions);
    procedure SetParseExpressions(const Value: TExpressions);
    procedure FreeExpressionObject(var AExpression: TBindingExpression);
  protected
    function CanDesignActivate: Boolean; override;
    procedure UpdateExpressions; override;
    procedure FreeExpressionsObjects; override;
    function RequiresControlHandler: Boolean; virtual;
    procedure CheckEditingLink; virtual;
    procedure ClearEditingLink; virtual;
    procedure UpdateControlChanging; override;
    { IBindLink }
    function GetUpdating: Boolean;
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsRequired: Boolean;
    procedure SetIsReadOnly(Value: Boolean);
    function IsValidChar(AKey: Char): Boolean;
    function GetCanModify: Boolean;
    procedure ClearModified;
    procedure SetModified;
    function GetIsModified: Boolean;
    function Edit: Boolean;
    function GetIsEditing: Boolean;
    procedure Reset;
    procedure UpdateRecord;
    function GetActive: Boolean; override;
    function GetBindComp: TComponent;
    procedure EvaluateParse(const AMemberName: string);
    procedure EvaluateFormat(const AMemberName: string);
    procedure EvaluateClear(const AMemberName: string);
    procedure SetActive(Value: Boolean); override;
    procedure IBindLink.SetActive = BindActivate;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    function EvaluateControl: IValue;
    property Active: Boolean read GetActive write SetActive;
    property ParseExpressions: TExpressions read FParseExpressions write SetParseExpressions;
    property FormatExpressions: TExpressions read FFormatExpressions write SetFormatExpressions;
    property ClearExpressions: TExpressions read FClearExpressions write SetClearExpressions;
  end;

  TBindLink = class(TCustomBindLink)
  published
    property SourceMemberName;
    property ControlComponent;
    property SourceComponent;
    property ParseExpressions;
    property FormatExpressions;
    property ClearExpressions;
    property AutoActivate;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  TColumnLinkExpressions = class;
  TColumnLinkExpressionItem = class;
  TColumnFormatExpressions = class;
  TColumnFormatExpressionItem = class;

  TCustomBindGridList = class(TActivatedContainedBindComponent, IBindActivate)
  private
    FFormatControlExpressions: TExpressions;
    FClearControlExpressions: TExpressions;
    FFormatControlExpressionObjects: TList<TBindingExpression>;
    FClearControlExpressionObjects: TList<TBindingExpression>;
    FControlExpressionObject: TBindingExpression;
    FActive: Boolean;
    FBufferCount: Integer;
    procedure SetColumnExpressions(const Value: TColumnFormatExpressions);
    function GetControlScopes(
      AColumnExpressionItem: TColumnFormatExpressionItem): TArray<IScope>;
    function GetSourceScopes(
      AColumnExpressionItem: TColumnFormatExpressionItem): TArray<IScope>;
    function GetBindListEditor: IBindListEditor;
    function GetScopeRecordEnumerator: IScopeRecordEnumerator;
    function TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
    procedure EvaluateExpressionItem(AColumnExpressionItem: TColumnFormatExpressionItem; AItem: TExpressionItem; AEditorScope,
      AEnumScope: IScope);
    procedure EvaluateExpressions(AColumnExpressionItem: TColumnFormatExpressionItem; AEditorScope: IScope;
      const AEditorExpression: string; AEnumScope: IScope;
      const AEnumExpression: string); overload;
    procedure EvaluateSourceExpression(AEnumScope: IScope;
      const AEnumExpression: string; ACallback: TProc<IValue>); overload;
    procedure FillRecord(AEditorScope: IScope;
      AGetMemberScope: TFunc<TColumnFormatExpressionItem, IScope>);
    procedure SetFormatControlExpressions(const Value: TExpressions);
    procedure SetClearControlExpressions(const Value: TExpressions);
    procedure FormatColumns;
    procedure EvaluateClearControl;
    procedure EvaluateFormatControl;
  var
    FColumnExpressions: TColumnFormatExpressions;
    FDeferActive: Boolean;
    FAutoFill: Boolean;
    procedure SetAutoFill(const Value: Boolean);
  protected
    function CanDesignActivate: Boolean; override;
    procedure UpdateControlChanged; override;
    procedure FreeExpressionsObjects; override;
    procedure UpdateExpressions; override;
    procedure Loaded; override;
    function GetActive: Boolean; override;
    { IBindActivate }
    procedure IBindActivate.SetActive = BindActivate;
    procedure SetActive(Value: Boolean); override;
  public
    property ColumnExpressions: TColumnFormatExpressions read FColumnExpressions write SetColumnExpressions;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearGrid;
    procedure FillGrid;
    procedure ResetGrid;
    procedure EvaluateControlExpression(AColumnExpressionItem:
      TColumnFormatExpressionItem; const AExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); overload;
    procedure ExecuteAssignToControlExpression(AColumnExpressionItem:
      TColumnFormatExpressionItem;
      const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); overload;
    procedure EvaluateSourceExpression(AColumnExpressionItem:
      TColumnFormatExpressionItem;
      const AExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); overload;
    procedure ExecuteAssignToSourceExpression(AColumnExpressionItem:
      TColumnFormatExpressionItem;
      const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); reintroduce;
    property AutoFill: Boolean read FAutoFill write SetAutoFill default True;
    property BufferCount: Integer read FBufferCount write FBufferCount default -1;
    property FormatControlExpressions: TExpressions read FFormatControlExpressions write SetFormatControlExpressions;
    property ClearControlExpressions: TExpressions read FClearControlExpressions write SetClearControlExpressions;
  end;

  TBindGridList = class(TCustomBindGridList)
  published
    property ControlComponent;
    property SourceComponent;
    property ColumnExpressions;
    property FormatControlExpressions;
    property ClearControlExpressions;
    property AutoFill;
    property AutoActivate;
    property BufferCount;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;


  TCustomBindGridLink = class(TActivatedContainedBindComponent, IBindPosition,
    IBindLink, IBindLinkColumns, IBindListUpdate)
  private
    FControlObserver: TControlObserver;
    FUpdateCounter: Integer;
    FPosSourceExpressions: TExpressions;
    FPosControlExpressions: TExpressions;
    FPosControlExpressionObjects: TList<TBindingExpression>;
    FPosSourceExpressionObjects: TList<TBindingExpression>;
    FFormatControlExpressionObjects: TList<TBindingExpression>;
    FClearControlExpressionObjects: TList<TBindingExpression>;
    FControlExpressionObject: TBindingExpression;
    FFormatControlExpressions: TExpressions;
    FClearControlExpressions: TExpressions;
    FLockPosControl: Integer;
    procedure SetColumnExpressions(const Value: TColumnLinkExpressions);
    function GetControlScopes(
      AColumnExpressionItem: TColumnLinkExpressionItem): TArray<IScope>;
    function GetSourceScopes(
      AColumnExpressionItem: TColumnLinkExpressionItem): TArray<IScope>;
    function GetBindListEditor: IBindListEditor;
    function GetScopeRecordEnumerator: IScopeRecordEnumerator;
    function TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
    procedure EvaluateExpressionItem(AColumnExpressionItem: TColumnLinkExpressionItem; AItem: TExpressionItem; AEditorScope,
      AEnumScope: IScope);
    procedure EvaluateExpressions(AColumnExpressionItem: TColumnLinkExpressionItem; AEditorScope: IScope;
      const AEditorExpression: string; AEnumScope: IScope;
      const AEnumExpression: string); overload;
    procedure EvaluateSourceExpression(AEnumScope: IScope;
      const AEnumExpression: string; ACallback: TProc<IValue>); overload;
    function GetScopeCurrentRecord(AColumnExpressionItem: TColumnLinkExpressionItem): IScope;
    procedure SetPosControlExpressions(const Value: TExpressions);
    procedure SetPosSourceExpressions(const Value: TExpressions);
    procedure FillRecord(AEditorScope: IScope;
      AGetMemberScope: TFunc<TColumnLinkExpressionItem, IScope>);
    function FindColumnExpressionItem(AIndex: Integer;
      AName: string): TColumnLinkExpressionItem;
    procedure SetClearControlExpressions(const Value: TExpressions);
    procedure SetFormatControlExpressions(const Value: TExpressions);
    procedure EvaluateClearControl;
    procedure EvaluateFormatControl;
    procedure FormatColumns;
  var
    FBufferCount: Integer;
    FColumnExpressions: TColumnLinkExpressions;
    FEditColumnName: string;
    FEditColumnIndex: Integer;
    FEditColumnCurrent: TVarRec;
    FDeferActive: Boolean;
    FActive: Boolean;
    FAutoFill: Boolean;
    procedure SetAutoFill(const Value: Boolean);
    function UpdateColumnCurrent: string;
  protected
    procedure UpdateControlChanging; override;
    function RequiresControlHandler: Boolean; virtual;
    procedure CheckEditingLink; virtual;
    procedure ClearEditingLink; virtual;
    procedure FreeExpressionsObjects; override;
    procedure UpdateExpressions; override;
    { IBindPosition }
    function GetBindComp: TComponent;
    procedure PosChanged;
    function GetActive: Boolean; override;
    procedure SetActive(Value: Boolean); override;
    procedure EvaluatePosControl;
    procedure EvaluatePosSource;
    procedure EvaluatePosClear;
    { IBindLink }
    function GetUpdating: Boolean;
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsRequired: Boolean;
    procedure SetIsReadOnly(Value: Boolean);
    function IsValidChar(AKey: Char): Boolean;
    function GetCanModify: Boolean;
    procedure SetModified;
    procedure ClearModified;
    function GetIsModified: Boolean;
    function Edit: Boolean;
    function GetIsEditing: Boolean;
    procedure Reset;
    procedure UpdateRecord;
    procedure EvaluateParse(const AMemberName: string);
    procedure EvaluateFormat(const AMemberName: string);
    procedure EvaluateClear(const AMemberName: string);
    { IBindLinkColumns }
    function GetEditColumnName: string;
    function GetEditColumnIndex: Integer;
    procedure SetEditColumn(const AName: string; AIndex: Integer);
    { IBindListUpdate }
    procedure UpdateList;
    procedure IBindPosition.SetActive = BindActivate;
    procedure IBindLink.SetActive = BindActivate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure ClearGrid;
    procedure FillGrid;
    procedure ResetGrid;
    procedure ResetColumns;
    procedure EvaluateControlExpression(AColumnExpressionItem:
      TColumnLinkExpressionItem; const AExpression: string;
      ACallback: TProc<IValue>; AType: TBindCompExpressionType); overload;
    procedure ExecuteAssignToControlExpression(AColumnExpressionItem:
      TColumnLinkExpressionItem;
      const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); overload;
    procedure EvaluateSourceExpression(AColumnExpressionItem:
      TColumnLinkExpressionItem;
      const AExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType); overload;
    procedure ExecuteAssignItemToSourceExpression(AColumnExpressionItem:
      TColumnLinkExpressionItem;
      const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
      AType: TBindCompExpressionType); reintroduce;
    property ColumnExpressions: TColumnLinkExpressions read FColumnExpressions write SetColumnExpressions;
    property AutoFill: Boolean read FAutoFill write SetAutoFill default True;
    property PosSourceExpressions: TExpressions read FPosSourceExpressions write SetPosSourceExpressions;
    property PosControlExpressions: TExpressions read FPosControlExpressions write SetPosControlExpressions;
    property FormatControlExpressions: TExpressions read FFormatControlExpressions write SetFormatControlExpressions;
    property ClearControlExpressions: TExpressions read FClearControlExpressions write SetClearControlExpressions;
    property BufferCount: Integer read FBufferCount write FBufferCount default -1;
  end;

  TBindGridLink = class(TCustomBindGridLink)
  published
    property ControlComponent;
    property SourceComponent;
    property ColumnExpressions;
    property PosControlExpressions;
    property PosSourceExpressions;
    property FormatControlExpressions;
    property ClearControlExpressions;
    property AutoFill;
    property AutoActivate;
    property BufferCount;
    property OnAssigningValue;
    property OnAssignedValue;
    property OnEvalError;
    property OnActivating;
    property OnActivated;
  end;

  TColumnFormatExpressionItem = class(TCollectionItem)
  private
    FName: string;
    FColumnName: string;
    FColumnIndex: Integer;
    FFormatCellExpressions: TExpressions;
    FFormatColumnExpressions: TExpressions;
    FSourceMemberName: string;
    FControlMemberName: string;
    function GetColumnExpressions: TColumnFormatExpressions;
    function GetName: string;
    procedure SetName(const Value: string);
    procedure SetFormatCellExpressions(const Value: TExpressions);
    procedure SetFormatColumnExpressions(const Value: TExpressions);
    function GetColumnIndex: integer;
    procedure SetColumnIndex(Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property ColumnExpressions: TColumnFormatExpressions read GetColumnExpressions;
  published
    property Name: string read GetName write SetName;
    property ColumnName: string read FColumnName write FColumnName;
    property ColumnIndex: Integer read GetColumnIndex write SetColumnIndex;
    property SourceMemberName: string read FSourceMemberName write FSourceMemberName;
    property ControlMemberName: string read FControlMemberName write FControlMemberName;
    property FormatCellExpressions: TExpressions read FFormatCellExpressions write SetFormatCellExpressions;
    property FormatColumnExpressions: TExpressions read FFormatColumnExpressions write SetFormatColumnExpressions;
  end;

  TColumnLinkExpressionItem = class(TCollectionItem)
  private
    FName: string;
    FColumnName: string;
    FColumnIndex: Integer;
    FFormatCellExpressions: TExpressions;
    FFormatColumnExpressions: TExpressions;
    FParseCellExpressions: TExpressions;
    FSourceMemberName: string;
    FControlMemberName: string;
    function GetColumnExpressions: TColumnLinkExpressions;
    function GetName: string;
    procedure SetName(const Value: string);
    procedure SetFormatCellExpressions(const Value: TExpressions);
    procedure SetParseExpressions(const Value: TExpressions);
    function GetColumnIndex: integer;
    procedure SetColumnIndex(Value: Integer);
    procedure SetFormatColumnExpressions(const Value: TExpressions);
    procedure SetSourceMemberName(const Value: string);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property ColumnExpressions: TColumnLinkExpressions read GetColumnExpressions;
  published
    property Name: string read GetName write SetName;
    property ColumnName: string read FColumnName write FColumnName;
    property ColumnIndex: Integer read GetColumnIndex write SetColumnIndex;
    property SourceMemberName: string read FSourceMemberName write SetSourceMemberName;
    property ControlMemberName: string read FControlMemberName write FControlMemberName;
    property ParseCellExpressions: TExpressions read FParseCellExpressions write SetParseExpressions;
    property FormatCellExpressions: TExpressions read FFormatCellExpressions write SetFormatCellExpressions;
    property FormatColumnExpressions: TExpressions read FFormatColumnExpressions write SetFormatColumnExpressions;
  end;

  TColumnFormatExpressions = class(TOwnedCollection)
  private
    FModified: Boolean;
    function GetItem(Index: Integer): TColumnFormatExpressionItem;
    procedure SetItem(Index: Integer; const Value: TColumnFormatExpressionItem);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
    property Modified: Boolean read FModified;
  public
    function AddExpression: TColumnFormatExpressionItem;
    property Items[Index: Integer]: TColumnFormatExpressionItem read GetItem write SetItem; default;
  end;


  TColumnLinkExpressions = class(TOwnedCollection)
  private
    FModified: Boolean;
    function GetItem(Index: Integer): TColumnLinkExpressionItem;
    procedure SetItem(Index: Integer; const Value: TColumnLinkExpressionItem);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
    property Modified: Boolean read FModified;
  public
    function AddExpression: TColumnLinkExpressionItem;
    property Items[Index: Integer]: TColumnLinkExpressionItem read GetItem write SetItem; default;
  end;

  TExpressionItem = class(TCollectionItem)
  private
    FControlExpression: string;
    FSourceExpression: string;
    function GetExpressions: TExpressions;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    function GetDisplayName: string; override;
  public
    property Expressions: TExpressions read GetExpressions;
  published
    property ControlExpression: string read FControlExpression write FControlExpression;
    property SourceExpression: string read FSourceExpression write FSourceExpression;
  end;

  TExpressionItemDir = class(TExpressionItem)
  private
    FDirection: TExpressionDirection;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  published
    property Direction: TExpressionDirection read FDirection write
      FDirection default dirSourceToControl;
  end;

{ TExpressions }

  TExpressionsEnumerator = class;

  TBindCompExpressionCollection = class(TOwnedCollection)

  end;

  TExpressions = class(TBindCompExpressionCollection)
  private
    function GetItem(Index: Integer): TExpressionItem;
    procedure SetItem(Index: Integer; const Value: TExpressionItem);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
  public
    function GetEnumerator: TExpressionsEnumerator;
    function AddExpression: TExpressionItem;
    property Items[Index: Integer]: TExpressionItem read GetItem write SetItem; default;
  end;

  TExpressionsEnumerator =  class(TCollectionEnumerator)
  public
    function GetCurrent: TExpressionItem; inline;
    property Current: TExpressionItem read GetCurrent;
  end;

  TExpressionDirEnumerator = class;

  TExpressionsDir = class(TBindCompExpressionCollection)
  private
    function GetItem(Index: Integer): TExpressionItemDir;
    procedure SetItem(Index: Integer; const Value: TExpressionItemDir);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
  public
    function GetEnumerator: TExpressionDirEnumerator;
    function AddExpression: TExpressionItemDir;
    property Items[Index: Integer]: TExpressionItemDir read GetItem write SetItem; default;
  end;

  TExpressionDirEnumerator =  class(TCollectionEnumerator)
  public
    function GetCurrent: TExpressionItemDir; inline;
    property Current: TExpressionItemDir read GetCurrent;
  end;

  TBindArtifactState = (eaInclude, eaExclude);
  TBindArtifactItem = class(TCollectionItem)
  private
    FID: string;
    FState: TBindArtifactState;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  published
    property ID: string read FID write FID;
    property State: TBindArtifactState read FState write FState;
  end;

{ TBindArtifacts }

  TBindArtifacts = class(TOwnedCollection)
  private
    FModified: Boolean;
    function GetItem(Index: Integer): TBindArtifactItem;
    procedure SetItem(Index: Integer; const Value: TBindArtifactItem);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
    property Modified: Boolean read FModified;
  public
    constructor Create(AOwner: TPersistent);
    property Items[Index: Integer]: TBindArtifactItem read GetItem write SetItem; default;
  end;

  TMethods = class(TBindArtifacts)
  protected
    procedure Update(Item: TCollectionItem); override;

  end;

  TOutputConverters = class(TBindArtifacts)
  protected
    procedure Update(Item: TCollectionItem); override;
  end;


  // A component can provide own scope
  IScopeComponent = interface
    ['{84C633CB-6A4B-407A-A8E4-D175923D8E61}']
    function GetScope: IScope;
    function GetMemberScope(const AMemberName: string): IScope;
  end;

  IScopeExpressions = interface
    ['{EE75B066-3C8B-4102-9864-383447BFA6F2}']
    procedure AddExpression(AExpression: TBasicBindComponent);
    procedure RemoveExpression(AExpression: TBasicBindComponent);
  end;

  IScopeEditLink = interface
    ['{86C2783F-082F-4D78-98A3-CC3540D72A0D}']
    procedure SetField(ABindComp: TBasicBindComponent; const FieldName: string);
    function Edit(ABindComp: TBasicBindComponent): Boolean;
    function GetIsEditing(ABindComp: TBasicBindComponent): Boolean;
    procedure SetModified(ABindComp: TBasicBindComponent);
    function GetIsModified(ABindComp: TBasicBindComponent): Boolean;
    function GetCanModify(ABindComp: TBasicBindComponent): Boolean;
    procedure UpdateRecord(ABindComp: TBasicBindComponent);
    procedure Reset(ABindComp: TBasicBindComponent);
    procedure SetReadOnly(ABindComp: TBasicBindComponent; const Value: Boolean);
    procedure ClearModified(ABindComp: TBasicBindComponent);
  end;

  TNotifyDistanceEvent = procedure(Sender: TObject; Distance: Integer) of object;

  IScopeActive = interface
    ['{56387EF7-0E9C-4049-AD67-37D0CA60F0D9}']
    function GetActive: Boolean;
    property Active: Boolean read GetActive;
  end;

  IScopeState = interface(IScopeActive)
    ['{2B1E1B3F-EBD5-46F0-A611-E5512D49BCFD}']
    function GetActive: Boolean;
    function GetCanModify: Boolean;
    function GetEditing: Boolean;
    procedure AddActiveChanged(LNotify: TNotifyEvent);
    procedure RemoveActiveChanged(LNotify: TNotifyEvent);
    procedure AddEditingChanged(LNotify: TNotifyEvent);
    procedure RemoveEditingChanged(LNotify: TNotifyEvent);
    procedure AddDataSetChanged(LNotify: TNotifyEvent);
    procedure RemoveDataSetChanged(LNotify: TNotifyEvent);
    procedure AddDataSetScrolled(LNotify: TNotifyDistanceEvent);
    procedure RemoveDataSetScrolled(LNotify: TNotifyDistanceEvent);
    property Active: Boolean read GetActive;
    property Editing: Boolean read GetEditing;
    property CanModify: Boolean read GetCanModify;
  end;

  IScopeEditor = interface
    ['{F2A94E16-2181-4943-8BDC-3D0CA7FDE336}']
    procedure Insert;
    procedure Delete;
    procedure Cancel;
    procedure Post;
    procedure Edit;
    procedure Refresh;
    function IsValidChar(const AFieldName: string; const AChar: Char): Boolean;
    function IsRequired(const AFieldName: string): Boolean;
  end;

  IScopeNavigator = interface
    ['{C71852CF-888A-42C6-9A15-B704E11229D8}']
    function GetBOF: Boolean;
    function GetEOF: Boolean;
    function GetSelected: Boolean;
    procedure Next;
    procedure Prior;
    procedure First;
    procedure Last;
    property Eof: Boolean read GetEOF; {Upper case EOF conflicts with C++}
    property BOF: Boolean read GetBOF;
    property Selected: Boolean read GetSelected;
  end;

  IScopeMemberNames = interface
  ['{E6D8BFA3-0453-436B-8434-D10623724644}']
    procedure GetMemberNames(AList: TStrings);
  end;

  TBaseBindScopeComponent = class(TComponent, IScopeComponent, IScopeExpressions)
  private
    FExpressions: TList<TBasicBindComponent>;
  protected
    function GetMember(const AMemberName: string): TObject; virtual;
    function GetValue: TObject; virtual;
    function GetScope: IScope; virtual;
    function GetMemberScope(const AMemberName: string): IScope; virtual;
    procedure AddExpression(AExpression: TBasicBindComponent); virtual;
    procedure RemoveExpression(AExpression: TBasicBindComponent); virtual;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure ActivateExpressions(AValue: Boolean);
    property Expressions: TList<TBasicBindComponent> read FExpressions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TBindEventList = class;
  
  TCustomBindScope = class(TBaseBindScopeComponent, IScopeActive,
    IScopeRecordEnumerable)
  private
    FComponent: TComponent;
    FActive: Boolean;
    FAutoActivate: Boolean;
    FDeferActive: Boolean;
    FDataObject: TObject;
    procedure SetComponent(const Value: TComponent);
    procedure SetDataObject(const Value: TObject);
    procedure SetAutoActivate(const Value: Boolean);
    function CanActivate: Boolean;
    procedure UpdateDataChanged;
    procedure UpdateDataChanging;
  protected
    function GetValue: TObject; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    procedure Loaded; override;
    { IScopeRecordEnumerable }
    function GetEnumerator(const AMemberName: string; ABufferCount: Integer): IScopeRecordEnumerator;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Active: Boolean read GetActive write SetActive;
    property Component: TComponent read FComponent write SetComponent;
    property DataObject: TObject read FDataObject write SetDataObject;
    property AutoActivate: Boolean read FAutoActivate write SetAutoActivate default True;
  end;

  // Component Owner defines a object scope
  TBindScope = class(TCustomBindScope)
  published
    property Component;
    property AutoActivate;
  end;

  TBindEventListT = class
  protected
    FList: TList<TNotifyEvent>;
    procedure InternalAdd(AEvent: TNotifyEvent);
    procedure InternalRemove(AEvent: TNotifyEvent);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBindEventList = class(TBindEventListT)
  public
    procedure Add(AEvent: TNotifyEvent);
    procedure Remove(AEvent: TNotifyEvent);
    procedure Send(Sender: TObject);
  end;

  TBindNotifyEvent1<T> = procedure(Sender: TObject; P: T) of object;

  TBindEventList1<T> = class(TBindEventListT)
  public
    procedure Add(AEvent: TBindNotifyEvent1<T>);
    procedure Remove(AEvent: TBindNotifyEvent1<T>);
    procedure Send(Sender: TObject; const P: T);
  end;


  TEnumBindCompProcInfo = Pointer;

  TEnumBindCompProc = procedure (const Category: string; BindCompClass: TContainedBindCompClass;
    Info: TEnumBindCompProcInfo) of object;


  // Design time support for components in the context of another component.
  // For example, create a Data Binding for a TEdit
  IBindCompFactoryContext = interface
    ['{E0FB570F-2EF0-44C7-BD19-F4F8ACAE2294}']
    function GetDesigner: IInterface;
    function GetControlComponent: TComponent;
    function GetOwner: TComponent;
    function GetBindingsList: TCustomBindingsList;
    property BindingsList: TCustomBindingsList read GetBindingsList;
    property Owner: TComponent read GetOwner;
    property ControlComponent: TComponent read GetControlComponent;
    property Designer: IInterface read GetDesigner;
  end;

  IBindCompFactoryExecuteContext = interface(IBindCompFactoryContext)
    ['{E0FB570F-2EF0-44C7-BD19-F4F8ACAE2294}']
    function UniqueName(const ABaseName: string): string;
    procedure BindCompCreated(AComponent: TComponent);
  end;

  IBindCompFactory = interface
    ['{C9E39805-4ED9-4C60-B903-4D3F9E8F0671}']
    function Enabled(AContext: IBindCompFactoryContext): Boolean;
    function GetCommandText(AContext: IBindCompFactoryContext): string;
    procedure Execute(AContext: IBindCompFactoryExecuteContext);
  end;

  TBindCompDesignerCollectionType = (colExpressions, colCollections);
  TBindCompDesignerExpressionType = (exprControlToSource, exprSourceToControl, exprBidirectional);
  TBindCompDesignerExpressionTypes = set of TBindCompDesignerExpressionType;

  TBindCompDesignExpressionCollection = record
  private
    FName: string;
    FCollection: TCollection;
    FParentCollectionItem: TCollectionItem;
    FCollectionType: TBindCompDesignerCollectionType;
  public
    constructor Create(const AName: string; ACollection: TCollection;
      AParentCollectionItem: TCollectionItem = nil;
      ACollectionType: TBindCompDesignerCollectionType = colExpressions);
    property Name: string read FName;
    property Collection: TCollection read FCollection;
    property ParentCollectionItem: TCollectionItem read FParentCollectionItem;
    property CollectionType: TBindCompDesignerCollectionType read FCollectionType;
  end;

  TBindCompDesignExpression = record
  type
    TExecuteDesignExpression = reference to procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>);
    TExecuteDesignExpression2 = reference to procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>);
    TSaveDesignExpression = reference to procedure(const AName: string; const AExpression: string);
  private
    FName: string;
    FControlScope: string;
    FControlExpression: string;
    FSourceScope: string;
    FSourceExpression: string;
    FExecuteControlProc: TExecuteDesignExpression;
    FExecuteSourceProc: TExecuteDesignExpression;
    FExecuteAssignToSourceProc: TExecuteDesignExpression2;
    FExecuteAssignToControlProc: TExecuteDesignExpression2;
    FSaveControlProc: TSaveDesignExpression;
    FSaveSourceProc: TSaveDesignExpression;
    FCollectionItem: TCollectionItem;
    FCollectionName: string;
    FParentCollectionItem: TCollectionItem;
    FExpressionType: TBindCompDesignerExpressionType;
  public
    constructor Create(const AName, AControlScope, AControlExpression: string;
      const ASourceScope, ASourceExpression: string;
      AExecuteAssignToControl, AExecuteAssignToSource: TExecuteDesignExpression2; AExecuteControl, AExecuteSource: TExecuteDesignExpression;
      ASaveControl, ASaveSource: TSaveDesignExpression; ACollectionItem: TCollectionItem;
      const ACollectionName: string;
      AParentCollectionItem: TCollectionItem;
      AExpressionType: TBindCompDesignerExpressionType);
    property Name: string read FName;
    property ControlScope: string read FControlScope;
    property ControlExpression: string read FControlExpression;
    property SourceScope: string read FSourceScope;
    property SourceExpression: string read FSourceExpression;
    property ExecuteAssignToControlProc: TExecuteDesignExpression2 read FExecuteAssignToControlProc;
    property ExecuteAssignToSourceProc: TExecuteDesignExpression2 read FExecuteAssignToSourceProc;
    property ExecuteSourceProc: TExecuteDesignExpression read FExecuteSourceProc;
    property ExecuteControlProc: TExecuteDesignExpression read FExecuteControlProc;
    property SaveSourceProc: TSaveDesignExpression read FSaveSourceProc;
    property SaveControlProc: TSaveDesignExpression read FSaveControlProc;
    property CollectionItem: TCollectionItem read FCollectionItem;
    property CollectionName: string read FCollectionName;
    property ParentCollectionItem: TCollectionItem read FParentCollectionItem;
    property ExpressionType: TBindCompDesignerExpressionType read FExpressionType;
  end;

  TBindCompDesignerBindsType = (biBindsComponent, biBindsComponentProperty, biBindsOther);
  TBindCompDesignerBindsTypes = set of TBindCompDesignerBindsType;
  IBindCompDesigner = interface
    ['{45B5E422-5908-4C9E-8073-361A7954F209}']
    function CanBindComponent(ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean;
    function BindsComponent(ABindComp: TContainedBindComponent; AComponent: TComponent): Boolean;
    function BindsComponentPropertyName(ABindComp: TContainedBindComponent; const APropertyName: string): Boolean;
    function GetDescription(ABindComp: TContainedBindComponent): string;
    function IsReadOnly(ABindComp: TContainedBindComponent; AExpression: TBindCompDesignExpression): Boolean; overload;
    function IsReadOnly(ABindComp: TContainedBindComponent; AItem: TCollectionItem): Boolean; overload;
    function IsReadOnly(ABindComp: TContainedBindComponent; ACollection: TCollection): Boolean; overload;
    function GetExpressions(ABindComp: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
    function GetExpressionCollections(ABindComp: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
  end;

  TEnumBindCompFactoryProc = procedure (BindCompFactory: IBindCompFactory; Info: TEnumBindCompProcInfo) of object;

  TBoundComponentOption = (dbcoptAddDataBindingsProperty, dbcoptApplyToDescendents);
  TBoundComponentOptions = set of TBoundComponentOption;

  TBindEditorFactory = class
  public
    constructor Create; virtual;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; virtual; abstract;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; virtual; abstract;
  end;


  TBindEditorFactoryClass = class of TBindEditorFactory;

  TControlObserver = class
  strict private
    FComponent: TComponent;
    FDictionary: TDictionary<Integer, IObserver>;
    function AddObserver(const ID: Integer;
      AFunc: TFunc<IObserver>): Boolean;
    procedure RemoveObserver(const ID: Integer);
    procedure SetComponent(const Value: TComponent);
    procedure RemoveObservers;
  public
    const
      IDEditLinkObserver = Integer(TObserverMapping.EditLinkID);
      IDEditGridLinkObserver = Integer(TObserverMapping.EditGridLinkID);
      IDPositionLinkObserver = Integer(TObserverMapping.PositionLinkID);
  private
    function GetEditGridLink: IEditGridLinkObserver;
    function GetPositionLinkObserver: IPositionLinkObserver;
    function GetEditLink: IEditLinkObserver;
  public
    constructor Create;
    function EnsureObserving(const ID: Integer; AFunc: TFunc<IObserver>): Boolean;
    function IsObserving(const ID: Integer): Boolean;
    function GetObserver(const ID: Integer): IObserver;
    function TrySetActive(AValue: Boolean): Boolean;
    destructor Destroy; override;
    procedure Clear;
    property Component: TComponent read FComponent write SetComponent;
    property EditGridLinkObserver: IEditGridLinkObserver read GetEditGridLink;
    property PositionLinkObserver: IPositionLinkObserver read GetPositionLinkObserver;
    property EditLinkObserver: IEditLinkObserver read GetEditLink;
  end;


  TBindCompException = class(Exception);

// Design time support
procedure RegisterBindComponents(const CategoryName: string;
  const AClasses: array of TContainedBindCompClass);
procedure UnRegisterBindComponents(const AClasses: array of TContainedBindCompClass);
function CreateBindComponent(AOwner: TComponent; ABindCompClass: TContainedBindCompClass): TContainedBindComponent;
procedure EnumRegisteredBindComponents(Proc: TEnumBindCompProc; Info: TEnumBindCompProcInfo);
procedure RegisterBindCompFactory(AFactory: IBindCompFactory);
procedure EnumRegisteredBindCompFactories(Proc: TEnumBindCompFactoryProc; Info: TEnumBindCompProcInfo);
procedure RegisterBindCompDesigner(AClass: TContainedBindCompClass; ADesigner: IBindCompDesigner);
function GetBindCompDesigner(AClass: TContainedBindCompClass): IBindCompDesigner;
procedure RegisterBoundComponents(const AClasses: array of TComponentClass; AFlags: TBoundComponentOptions);
function GetBoundComponentOptions(const AClass: TComponentClass): TBoundComponentOptions;

procedure RegisterBindEditorFactory(AFactories: array of TBindEditorFactoryClass);
procedure UnregisterBindEditorFactory(AFactories: array of TBindEditorFactoryClass);

const
  RegisterBindCompProc: procedure (const CategoryName: string;
    const AClasses: array of TContainedBindCompClass) = nil;
  UnRegisterBindCompProc: procedure (const AClasses: array of TContainedBindCompClass) = nil;
  EnumRegisteredBindCompsProc: procedure (Proc: TEnumBindCompProc; Info: Pointer) = nil;
  CreateBindCompProc: function (AOwner: TComponent; BindCompClass: TContainedBindCompClass): TContainedBindComponent = nil;
  RegisterBindCompFactoryProc: procedure(AFactory: IBindCompFactory) = nil;
  EnumRegisteredBindCompFactoriesProc: procedure(Proc: TEnumBindCompFactoryProc; Info: Pointer) = nil;
  RegisterBindCompDesignerProc: procedure (AClass: TContainedBindCompClass; ADesigner: IBindCompDesigner) = nil;
  GetBindCompDesignerProc: function (AClass: TContainedBindCompClass): IBindCompDesigner = nil;
  RegisterBoundComponentsProc: procedure (const AClasses: array of TComponentClass; AFlags: TBoundComponentOptions) = nil;
  GetBoundComponentOptionsProc: function (AClass: TComponentClass): TBoundComponentOptions = nil;
  function GetBindEditor(AComponent: TObject; AGuid: TGuid): IInterface;

implementation

uses
  Data.Bind.Consts, Data.Bind.ObserverLinks, System.Bindings.NotifierContracts,
  System.Bindings.Methods, System.Bindings.CustomScope, System.StrUtils,
  System.Bindings.Helper, System.Bindings.ObjEval, System.TypInfo,
  System.Bindings.CustomWrapper, System.Bindings.Factories, System.Math;

type

  TBindComponentScope = class(TCustomScope)
  protected
    function DoLookup(const Name: String): IInterface; override;
  end;

  TBindScopeComponentScope = class(TBindComponentScope)
  protected
    function DoLookup(const Name: String): IInterface; override;
  end;

var
  FEditorFactories: TList<TBindEditorFactoryClass>;


function SafeClassName(AObject: TObject): string;
begin
  if AObject = nil then
    Result := 'nil' // Do not localize
  else
    Result := AObject.ClassName;
end;

function GetBindEditor(AComponent: TObject; AGuid: TGuid): IInterface;
var
  LClass: TBindEditorFactoryClass;
  LFactory: TBindEditorFactory;
begin
  for LClass in FEditorFactories do
  begin
    LFactory := LClass.Create;
    try
      if LFactory.Supports(AGuid, AComponent) then
      begin
        Result := LFactory.CreateEditor(AGuid, AComponent);
        Exit;
      end;
    finally
      LFactory.Free;
    end;
  end;
  Result := nil;
end;

procedure RegisterBindComponents(const CategoryName: string;
  const AClasses: array of TContainedBindCompClass);
begin
  if Assigned(RegisterBindCompProc) then
    RegisterBindCompProc(CategoryName, AClasses) else
    raise TBindCompException.CreateRes(@SInvalidBindCompRegistration);
end;

procedure UnRegisterBindComponents(const AClasses: array of TContainedBindCompClass);
begin
  if Assigned(UnRegisterBindCompProc) then
    UnRegisterBindCompProc(AClasses) else
    raise TBindCompException.CreateRes(@SInvalidBindCompUnregistration);
end;

procedure EnumRegisteredBindComponents(Proc: TEnumBindCompProc; Info: TEnumBindCompProcInfo);
begin
  if Assigned(EnumRegisteredBindCompsProc) then
    EnumRegisteredBindCompsProc(Proc, Info) else
    raise TBindCompException.CreateRes(@SInvalidBindCompEnumeration);
end;

function CreateBindComponent(AOwner: TComponent; ABindCompClass: TContainedBindCompClass): TContainedBindComponent;
begin
  if Assigned(CreateBindCompProc) then
    Result := CreateBindCompProc(AOwner, ABindCompClass) else
    raise TBindCompException.CreateRes(@SInvalidBindCompCreation);
end;

procedure RegisterBindCompFactory(AFactory: IBindCompFactory);
begin
  if Assigned(RegisterBindCompFactoryProc) then
    RegisterBindCompFactoryProc(AFactory) else
    raise TBindCompException.CreateRes(@SInvalidBindCompFactory);
end;

procedure EnumRegisteredBindCompFactories(Proc: TEnumBindCompFactoryProc; Info: TEnumBindCompProcInfo);
begin
  if Assigned(EnumRegisteredBindCompFactoriesProc) then
    EnumRegisteredBindCompFactoriesProc(Proc, Info) else
    raise TBindCompException.CreateRes(@SInvalidBindCompFactoryEnumeration);
end;

procedure RegisterBindCompDesigner(AClass: TContainedBindCompClass; ADesigner: IBindCompDesigner);
begin
  if Assigned(RegisterBindCompDesignerProc) then
    RegisterBindCompDesignerProc(AClass, ADesigner) else
    raise TBindCompException.CreateRes(@SInvalidBindCompDesigner);
end;

function GetBindCompDesigner(AClass: TContainedBindCompClass): IBindCompDesigner;
begin
  if Assigned(GetBindCompDesignerProc) then
    Result := GetBindCompDesignerProc(AClass) else
    raise TBindCompException.CreateRes(@SInvalidBindCompDesigner);
end;

procedure RegisterBoundComponents(const AClasses: array of TComponentClass; AFlags: TBoundComponentOptions);
begin
  if Assigned(RegisterBoundComponentsProc) then
    RegisterBoundComponentsProc(AClasses, AFlags) else
    raise TBindCompException.CreateRes(@SInvalidBindCompComponents);
end;

function GetBoundComponentOptions(const AClass: TComponentClass): TBoundComponentOptions;
begin
  if Assigned(GetBoundComponentOptionsProc) then
    Result := GetBoundComponentOptionsProc(AClass) else
    raise TBindCompException.CreateRes(@SInvalidBindCompComponents);
end;

{ TContainedBindComponent }

constructor TContainedBindComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

function TContainedBindComponent.Designing: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

destructor TContainedBindComponent.Destroy;
begin

  inherited;
end;

function TContainedBindComponent.DisplayName: string;
begin
  Result := Self.Name;
end;

function TContainedBindComponent.GetBindingsList: TCustomBindingsList;
begin
  Result := FBindingsList;
end;

function TContainedBindComponent.GetIndex: Integer;
begin
  if BindingsList <> nil then
    Result := BindingsList.FBindComps.IndexOf(Self) else
    Result := -1;
end;

function TContainedBindComponent.GetParentComponent: TComponent;
begin
  if BindingsList <> nil then
    Result := BindingsList else
    Result := inherited GetParentComponent;
end;

function TContainedBindComponent.HasParent: Boolean;
begin
  if BindingsList <> nil then
    Result := True else
    Result := inherited HasParent;
end;

function TContainedBindComponent.Loading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

procedure TContainedBindComponent.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TCustomBindingsList then
    BindingsList := TCustomBindingsList(Reader.Parent);
end;

procedure TContainedBindComponent.CheckControlComponent;
begin
  if GetControlComponent = nil then
    raise TBindCompException.CreateFmt(sNoControl, [Self.DisplayName]);
end;

procedure TContainedBindComponent.SetCategory(const Value: string);
begin
  FCategory := Value;
end;

procedure TContainedBindComponent.SetBindingsList(
  const Value: TCustomBindingsList);
begin
  if Value <> BindingsList then
  begin
    if BindingsList <> nil then BindingsList.RemoveBindComp(Self);
    if Value <> nil then Value.AddBindComp(Self);
  end;
end;

procedure TContainedBindComponent.SetIndex(Value: Integer);
var
  CurIndex, Count: Integer;
begin
  CurIndex := GetIndex;
  if CurIndex >= 0 then
  begin
    Count := FBindingsList.FBindComps.Count;
    if Value < 0 then Value := 0;
    if Value >= Count then Value := Count - 1;
    if Value <> CurIndex then
    begin
      FBindingsList.FBindComps.Extract(Self);
      FBindingsList.FBindComps.Insert(Value, Self);
    end;
  end;
end;

procedure TContainedBindComponent.SetParentComponent(AParent: TComponent);
begin
  if not Loading and (AParent is TCustomBindingsList) then
    BindingsList := TCustomBindingsList(AParent);
end;

{ TBindCompListEnumerator }

constructor TBindingsListEnumerator.Create(ABindCompList: TCustomBindingsList);
begin
  inherited Create;
  FIndex := -1;
  FBindCompList := ABindCompList;
end;

function TBindingsListEnumerator.GetCurrent: TContainedBindComponent;
begin
  Result := FBindCompList[FIndex];
end;

function TBindingsListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FBindCompList.BindCompCount - 1;
  if Result then
    Inc(FIndex);
end;

{ TCustomBindCompList }

constructor TCustomBindingsList.Create(AOwner: TComponent);
begin
  inherited;
  FBindComps := TObjectList<TContainedBindComponent>.Create(True); // Owns
  FMethods := TMethods.Create(Self);
  FOutputConverters := TOutputConverters.Create(Self);
  FUseAppManager := True;
  FBindingsManager := nil;
end;

destructor TCustomBindingsList.Destroy;
begin
  FBindComps.Free;
  FMethods.Free;
  FOutputConverters.Free;
  inherited;
end;

function TCustomBindingsList.GetBindComp(
  Index: Integer): TContainedBindComponent;
begin
  Result := FBindComps[Index];

end;

function TCustomBindingsList.GetBindCompCount: Integer;
begin
  Result := FBindComps.Count;
end;

function TCustomBindingsList.GetEnumerator: TBindingsListEnumerator;
begin
  Result := TBindingsListEnumerator.Create(Self);
end;

function TCustomBindingsList.GetUseAppManager: Boolean;
begin
  Result := FUseAppManager;
end;

procedure TCustomBindingsList.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  LBindComp: TContainedBindComponent;
begin
  for LBindComp in FBindComps do
  begin
    if LBindComp.Owner = Root then Proc(LBindComp);
  end;
end;

procedure TCustomBindingsList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent is TContainedBindComponent then
    begin
      if FBindComps.Contains(TContainedBindComponent(AComponent)) then
        RemoveBindComp(TContainedBindComponent(AComponent));
    end;
end;

procedure TCustomBindingsList.Notify(const AObject: TObject;
  const AProperty: string);
var
  Intf: IBindingNotifier;
begin
  Intf := TBindings.CreateNotifier(AObject, FBindingsManager);
  Intf.Notify(AProperty);
end;

function TCustomBindingsList.GetOutputConverter: IValueRefConverter;
begin
  if FOutputConverter = nil then
    FOutputConverter := TValueRefConverterFactory.GetConverter(GetOutputConverterNames);
  Result := FOutputConverter;
end;

function TCustomBindingsList.GetOutputConverterNames: TArray<string>;
var
  I: Integer;
  UseConverters: TList<string>;
  ExcludedList: TList<string>;
  ConvDesc: TConverterDescription;
begin
  UseConverters := TList<string>.Create;
  ExcludedList := TList<string>.Create;
  try
    for I := 0 to Self.OutputConverters.Count - 1 do
    begin
      if Self.OutputConverters.Items[I].State = eaInclude then
      begin
        if not UseConverters.Contains(Self.OutputConverters.Items[I].ID) then
          UseConverters.Add(Self.OutputConverters.Items[I].ID)
      end
      else
        ExcludedList.Add(Self.OutputConverters.Items[I].ID);
    end;
    //now add converters enabled by default unless explicitly excluded
    for ConvDesc in TValueRefConverterFactory.GetConverterDescriptions do
      if ConvDesc.DefaultEnabled and (not ExcludedList.Contains(ConvDesc.ID)) then
        if not UseConverters.Contains(ConvDesc.ID) then
          UseConverters.Add(ConvDesc.ID);
    Result := UseConverters.ToArray;
  finally
    ExcludedList.Free;
    UseConverters.Free;
  end;
end;

function TCustomBindingsList.GetMethodsScope: IScope;
var
  I: Integer;
  UseMethods: TList<string>;
  ExcludedList: TList<string>;
  MethodDesc: TMethodDescription;
begin
  if FMethodsScope = nil then
  begin
    UseMethods := TList<string>.Create;
    ExcludedList := TList<string>.Create;
    try
      for I := 0 to Self.Methods.Count - 1 do
      begin
        if Self.Methods.Items[I].State = eaInclude then
        begin
          if not UseMethods.Contains(Self.Methods.Items[I].ID) then
            UseMethods.Add(Self.Methods.Items[I].ID)
        end
        else
          ExcludedList.Add(Self.Methods.Items[I].ID);
      end;
      //now add methods enabled by default unless explicitly excluded
      for MethodDesc in TBindingMethodsFactory.GetRegisteredMethods do
        if MethodDesc.DefaultEnabled and (not ExcludedList.Contains(MethodDesc.ID)) then
          if not UseMethods.Contains(MethodDesc.ID) then
            UseMethods.Add(MethodDesc.ID);
      FMethodsScope := TBindingMethodsFactory.GetMethodScope(UseMethods.ToArray);
    finally
      ExcludedList.Free;
      UseMethods.Free;
    end;
  end;
  Result := FMethodsScope;
end;

procedure TCustomBindingsList.SetBindComp(Index: Integer;
  const Value: TContainedBindComponent);
begin
  FBindComps[Index].Assign(Value);
end;

procedure TCustomBindingsList.SetOutputConverters(const Value: TOutputConverters);
begin
  FOutputConverters.Assign(Value);
end;

procedure TCustomBindingsList.SetUseAppManager(Value: Boolean);
begin
                                                                       
  //      allow/disallow changing this property
  if Value then
  begin
    //Helper function will use AppManager when a nil manager is
    // passed into CreateManagedBinding
    if Assigned(FBindingsManager) then
      FBindingsManager.Free;
    FBindingsManager := nil;
    FUseAppManager := True;
  end
  else
  begin
    FUseAppManager := False;
    FBindingsManager := TBindingManagerFactory.CreateManager(nil);
  end;
end;

procedure TCustomBindingsList.SetMethods(const Value: TMethods);
begin
  FMethods.Assign(Value);
end;

procedure TCustomBindingsList.AddBindComp(ABindComp: TContainedBindComponent);
begin
  FBindComps.Add(ABindComp);
  ABindComp.FBindingsList := Self;
  ABindComp.FreeNotification(Self);
end;

procedure TCustomBindingsList.RemoveBindComp(ABindComp: TContainedBindComponent);
begin
  if FBindComps.Contains(ABindComp)  then
  begin
    FBindComps.Extract(ABindComp);
    ABindComp.RemoveFreeNotification(Self);
    ABindComp.FBindingsList := nil;
  end;
end;

{ TCommonBindComponent }


constructor TCommonBindComponent.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TCommonBindComponent.Destroy;
begin
  inherited;
end;


procedure TCommonBindComponent.DoOnActivated;
begin
  if Assigned(FOnActivated) then
    FOnActivated(Self);

end;

procedure TCommonBindComponent.DoOnActivating;
begin
  if Assigned(FOnActivating) then
    FOnActivating(Self);
end;

procedure TCommonBindComponent.DoOnAssigningValue(AssignValueRec: TBindingAssignValueRec; var Value: TValue; var Handled: Boolean);
begin
  if Assigned(FOnAssigningValue) then
    FOnAssigningValue(Self, AssignValueRec, Value, Handled);
end;

procedure TCommonBindComponent.DoOnDeactivated;
begin
//
end;

procedure TCommonBindComponent.DoOnDeactivating;
begin
//
end;

procedure TCommonBindComponent.DoOnAssignedValue(AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  if Assigned(FOnAssignedValue) then
    FOnAssignedValue(Self, AssignValueRec, Value);
end;

procedure TCommonBindComponent.DoOnEvalError(AException: Exception);
begin
  if Assigned(FOnEvalError) then
    FOnEvalError(Self, AException);
end;

procedure TCommonBindComponent.SetControlComponent(const Value: TComponent);
begin
  if FControlComponent <> Value then
  begin
    if FControlComponent <> nil then
      FControlComponent.RemoveFreeNotification(Self);
    try
      UpdateControlChanging;
    finally
      FControlComponent := Value;
    end;
    if FControlComponent <> nil then
      FControlComponent.FreeNotification(Self);
    UpdateControlChanged;
  end;
end;

function TCommonBindComponent.GetControlComponent: TComponent;
begin
  Result := FControlComponent;
end;

procedure TCommonBindComponent.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = TOperation.opRemove then
  begin
    try
      if AComponent = ControlComponent then
        ControlComponent := nil;
    finally
      if AComponent = SourceComponent then
        SourceComponent := nil;
    end;
  end;
end;

procedure TCommonBindComponent.SetSourceComponent(const Value: TComponent);
begin

    if FSourceComponent <> nil then
    begin
      FSourceComponent.RemoveFreeNotification(Self);
    end;
    try
      UpdateSourceChanging;
    finally
      FSourceComponent := Value;
    end;
    if FSourceComponent <> nil then
    begin
      FSourceComponent.FreeNotification(Self);
    end;
    UpdateSourceChanged;
end;

procedure TCommonBindComponent.SetSourceMemberName(const Value: string);
begin
  if Value <> FSourceMemberName then
  begin
    try
      UpdateSourceMemberChanging;
    finally
      FSourceMemberName := Value;
    end;
    UpdateSourceMemberChanged;
  end;
end;


procedure TCommonBindComponent.UpdateControlChanging;
begin

end;

procedure TCommonBindComponent.UpdateControlChanged;
begin

end;

procedure TCommonBindComponent.UpdateExpressions;
begin

end;

procedure TCommonBindComponent.UpdateSourceChanging;
begin

end;

procedure TCommonBindComponent.UpdateSourceChanged;
begin

end;

procedure TCommonBindComponent.UpdateSourceMemberChanging;
begin

end;

procedure TCommonBindComponent.UpdateSourceMemberChanged;
begin

end;

procedure TCommonBindComponent.ExecuteAssignToControlExpression(const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
   AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetSourceScopes,
    ASourceExpression,
    GetcontrolScopes,       //Output destination(s)
    AControlExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue, DoOnAssignedValue),
    []  // Execute
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

procedure TCommonBindComponent.ExecuteAssignToSourceExpression(const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetcontrolScopes,
    AControlExpression,
    GetSourceScopes,   //Output destination(s)
    ASourceExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue, DoOnAssignedValue),
    []  // Execute
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

procedure TCommonBindComponent.EvaluateControlExpression(
  AEditorScope: IScope; const AEditorExpression: string; ACallback: TProc<IValue>);
var
  LExpression: TBindingExpression;
  LValue: IValue;
begin
  LExpression := TBindings.CreateExpression(
    GetComponentScopes(AEditorScope),
    AEditorExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    LValue := LExpression.Evaluate;
    ACallback(LValue);
  finally
    LExpression.Free;
  end;
end;


procedure TCommonBindComponent.EvaluateControlExpression(const AExpression: string; ACallback: TProc<IValue>;
 AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
  LScopes: TArray<IScope>;
  LValue: IValue;
begin
  LScopes := GetControlScopes;
  LExpression := TBindings.CreateExpression(
    LScopes, //Input scopes
    AExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    LValue := LExpression.Evaluate;
    ACallback(LValue);
  finally
    LExpression.Free;
  end;

end;

function TCommonBindComponent.GetSourceMemberName: string;
begin
  Result := FSourceMemberName;
end;

function TCommonBindComponent.GetSourceScopes: TArray<IScope>;
begin
  Result := GetComponentScopes(FSourceComponent, FSourceMemberName);
end;

function TCommonBindComponent.GetControlScopes: TArray<IScope>;
begin
  Result := GetComponentScopes(FControlComponent);
end;

procedure TCommonBindComponent.EvaluateSourceExpression(const AExpression: string; ACallback: TProc<IValue>;
 AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
  LScopes: TArray<IScope>;
begin
  case  AType of
    exprPosSource,
    exprPosControl,
    exprFormatControl:
      LScopes := GetComponentScopes(FSourceComponent, '');
  else
    LScopes := GetSourceScopes;
  end;

  LScopes := GetSourceScopes;
  LExpression := TBindings.CreateExpression(
    LScopes, //Input scopes
    AExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;

end;

procedure TCommonBindComponent.EvaluateSourceExpression(
  ASourceScope: IScope; const AEnumExpression: string; ACallback: TProc<IValue>);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateExpression(
    GetComponentScopes(ASourceScope),
    AEnumExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

procedure TCommonBindComponent.FreeExpressionsObjects;
begin

end;


function TCommonBindComponent.GetComponentScope(AComponent: TComponent; const AMemberName: string): IScope;
var
  LBoundScope: IScope;
  LScopeComponent: IScopeComponent;
begin
  if AComponent = nil then
    Exit(nil);
  if Supports(AComponent, IScopeComponent, LScopeComponent) then
    if AMemberName <> '' then
      LBoundScope := LScopeComponent.GetMemberScope(AMemberName)
    else
      LBoundScope := LScopeComponent.GetScope
  else
    LBoundScope := WrapObject(AComponent);
  Result := LBoundScope;
end;

function TCommonBindComponent.GetComponentScopes(AComponent: TComponent; const AMemberName: string): TArray<IScope>;
begin
  Result := GetComponentScopes(GetComponentScope(AComponent, AMemberName));
end;

function TCommonBindComponent.GetComponentScopes(AComponentScope: IScope): TArray<IScope>;
begin
  if AComponentScope <> nil then
    Result := TArray<IScope>.Create(AComponentScope, GetMethodsScope)
  else
    Result := TArray<IScope>.Create(GetMethodsScope);
end;

function TCommonBindComponent.GetOutputConverter: IValueRefConverter;
var
  UseConverters: TList<string>;
  ConvDesc: TConverterDescription;
begin
  if Assigned(BindingsList) then
    Result := BindingsList.GetOutputConverter
  else
  begin
    UseConverters := TList<string>.Create;
    try
      // add converters enabled by default
      for ConvDesc in TValueRefConverterFactory.GetConverterDescriptions do
        if ConvDesc.DefaultEnabled  then
          UseConverters.Add(ConvDesc.ID);
      Result := TValueRefConverterFactory.GetConverter(UseConverters.ToArray);
    finally
      UseConverters.Free;
    end;
  end;
end;

function TCommonBindComponent.GetMethodsScope: IScope;
begin
  if Assigned(BindingsList) then
  begin
   Result := BindingsList.GetMethodsScope;
  end
  else
    Result := TBindingMethodsFactory.GetMethodScope;
end;

procedure TCommonBindComponent.FreeExpressionObjects(AList: TList<TBindingExpression>);
var
  LExpression: TBindingExpression;
begin
  try
    for LExpression in AList do
      LExpression.Free;
  finally
    AList.Clear;
  end;
end;

{ TBaseBindExpression }


constructor TBaseBindExpression.Create(AOwner: TComponent);
begin
  inherited;
  FManaged := True;
end;

destructor TBaseBindExpression.Destroy;
begin
  inherited;
end;


procedure TBaseBindExpression.Loaded;
begin
  try
    inherited;
    LoadActivate;
  except
    // Don't raise exception when loading
  end;
end;

procedure TBaseBindExpression.SetActive(Value: Boolean);
begin
  if Designing then
    Exit;

  if FActive <> Value then
  begin
    if Loading then
    begin
      //if not Designing then
        FDeferActive := Value
    end
    else
    begin
      try
        if not Value then
          if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
          if (SourceComponent <> nil) and
              (not (csDestroying in SourceComponent.ComponentState)) then
            EvaluateClear();
      finally
        if Value then
          DoOnActivating
        else
          DoOnDeactivating;
        FActive := Value;
        if FActive then
        begin
          try
            FreeExpressionsObjects;
            UpdateExpressions;
            EvaluateFormat;
            DoOnActivated;
          except
            FreeExpressionsObjects;
            FActive := False;
            raise;
          end;
        end
        else
        begin
          FreeExpressionsObjects;
          DoOnDeactivated;
        end;
      end;
    end;
  end;
end;

procedure TBaseBindExpression.SetManaged(const Value: Boolean);
begin
  if FManaged <> Value then
  begin
    SetActive(False);
    FManaged := Value;
  end;
end;

procedure TBaseBindExpression.SetNotifyOutputs(const Value: Boolean);
begin
  if FNotifyOutputs <> Value then
  begin
    SetActive(False);
    FNotifyOutputs := Value;
  end;
end;

procedure TBaseBindExpression.EvaluateFormat;
begin

end;

procedure TBaseBindExpression.EvaluateClear;
begin

end;

function TBaseBindExpression.GetActive: Boolean;
begin
  Result := FActive;
end;


{ TExpressionItem }

procedure TExpressionItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TExpressionItem then
  begin
    TExpressionItem(Dest).ControlExpression := ControlExpression;
    TExpressionItem(Dest).SourceExpression := SourceExpression;
  end
  else
    inherited;
end;

function TExpressionItem.GetDisplayName: string;
begin
  Result := '';
end;

function TExpressionItem.GetExpressions: TExpressions;
begin
  Result := TExpressions(Collection);
end;

{ TExpressionItemDir }

procedure TExpressionItemDir.AssignTo(Dest: TPersistent);
begin
  if Dest is TExpressionItemDir then
  begin
    inherited;
    TExpressionItemDir(Dest).Direction := Direction;
  end
  else
    inherited;
end;

{ TExpressions }

function TExpressions.AddExpression: TExpressionItem;
begin
  Result := Add as TExpressionItem;
end;

function TExpressions.GetEnumerator: TExpressionsEnumerator;
begin
  Result := TExpressionsEnumerator.Create(Self);
end;

function TExpressions.GetItem(Index: Integer): TExpressionItem;
begin
  Result := TExpressionItem(inherited Items[Index]);
end;

function TExpressions.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := sNameAttr;
    1: Result := sControlAttr;
    2: Result := sSourceAttr;
  else
    Result := ''; { do not localize }
  end;
end;

function TExpressions.GetAttrCount: Integer;
begin
  Result := 3;
end;

function TExpressions.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: begin
         Result := IntToStr(ItemIndex);
       end;
    1: Result := Items[ItemIndex].ControlExpression;
    2: Result := Items[ItemIndex].SourceExpression;
  else
    Result := '';
  end;
end;

procedure TExpressions.SetItem(Index: Integer; const Value: TExpressionItem);
begin
  inherited SetItem(Index, TCollectionItem(Value));

end;

{ TExpressionsDir }

function TExpressionsDir.AddExpression: TExpressionItemDir;
begin
  Result := Add as TExpressionItemDir;
end;

function TExpressionsDir.GetEnumerator: TExpressionDirEnumerator;
begin
  Result := TExpressionDirEnumerator.Create(Self);
end;

function TExpressionsDir.GetItem(Index: Integer): TExpressionItemDir;
begin
  Result := TExpressionItemDir(inherited Items[Index]);
end;

function TExpressionsDir.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := sNameAttr;
    1: Result := sControlAttr;
    2: Result := sSourceAttr;
  else
    Result := ''; { do not localize }
  end;
end;

function TExpressionsDir.GetAttrCount: Integer;
begin
  Result := 3;
end;

function TExpressionsDir.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: begin
         Result := IntToStr(ItemIndex);
       end;
    1: Result := Items[ItemIndex].ControlExpression;
    2: Result := Items[ItemIndex].SourceExpression;
  else
    Result := '';
  end;
end;

procedure TExpressionsDir.SetItem(Index: Integer; const Value: TExpressionItemDir);
begin
  inherited SetItem(Index, TCollectionItem(Value));

end;

{ TCustomComponentBindScope }

constructor TCustomBindScope.Create(AOwner: TComponent);
begin
  FAutoActivate := True;
  inherited;
end;

destructor TCustomBindScope.Destroy;
begin
  inherited;
end;

function TCustomBindScope.GetActive: Boolean;
begin
  Result := FActive;
end;

type
  TEnumerableWrapper = class(TInterfacedObject, IScopeRecordEnumerator)
  private
    FObject: TObject;
    FContext: TRttiContext;
    FRttiType: TRttiType;
    FEnumerator: TObject;
    function GetEnumerator: TObject;
  public
    constructor Create(AObject: TObject);
    destructor Destroy; override;
    procedure First;
    function GetCurrent: IScope;
    function GetMemberCurrent(const AMemberName: string): IScope;
    function MoveNext: Boolean;
    function GetRecordCount: Integer;
    property Current: IScope read GetCurrent;
    property RecordCount: Integer read GetRecordCount;
  end;

function TCustomBindScope.GetEnumerator(
  const AMemberName: string; ABufferCount: Integer): IScopeRecordEnumerator;
begin
    if Assigned(Component) then
      Result := TEnumerableWrapper.Create(Component)
    else if Assigned(DataObject) then
      Result := TEnumerableWrapper.Create(DataObject)
    else
      Result := nil;
end;

function TCustomBindScope.GetValue: TObject;
begin
  if FComponent <> nil then
    Result := FComponent
  else if FDataObject <> nil then
    Result := FDataObject
  else
  begin
    Assert(Owner <> nil);
    Result := Owner;
  end;
end;

procedure TCustomBindScope.Loaded;
begin
  try
    inherited;
    if FDeferActive then
    begin
      FDeferActive := False;
      SetActive(True)
    end
    else if AutoActivate then
      SetActive(True)
  except
    // Do not raise exception while loading
  end;
end;

procedure TCustomBindScope.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if csLoading in ComponentState then
      FDeferActive := Value
    else
    begin
      FActive := Value;
      ActivateExpressions(FActive);
    end;
  end;
end;

procedure TCustomBindScope.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent = FComponent then
    begin
      FComponent := nil;
    end;
end;

procedure TCustomBindScope.UpdateDataChanging;
begin
  Active := False;
end;

procedure TCustomBindScope.UpdateDataChanged;
begin
  if AutoActivate then
    if CanActivate then
      Active := True;
end;

procedure TCustomBindScope.SetComponent(const Value: TComponent);
begin
  if Value <> FComponent then
  begin
    UpdateDataChanging;
    FComponent := Value;
    if Assigned(Value) and Assigned(DataObject) then
      DataObject := nil;
    UpdateDataChanged;
  end;
end;

function TCustomBindScope.CanActivate: Boolean;
begin
  Result := Assigned(DataObject) or Assigned(Component);
end;

procedure TCustomBindScope.SetDataObject(const Value: TObject);
begin
  if Value <> FComponent then
  begin
    UpdateDataChanging;
    FDataObject := Value;
    if Assigned(Value) and Assigned(Component) then
      Component := nil;
    UpdateDataChanged;
  end;
end;

procedure TCustomBindScope.SetAutoActivate(const Value: Boolean);
begin
  if FAutoActivate <> Value then
  begin
    FAutoActivate := Value;
    if not (csLoading in ComponentState) then
      if (csDesigning in ComponentState) then
        // While designing, active when enable
        Active := FAutoActivate;
  end;
end;

{ TBaseScopeComponent }

procedure TBaseBindScopeComponent.ActivateExpressions(AValue: Boolean);
var
  LBindComp: TBasicBindComponent;
  LBindLink: IBindLink;
  LBindPosition: IBindPosition;
  LBindActivate: IBindActivate;
begin
  for LBindComp in Expressions do 
  begin
    if Supports(LBindComp, IBindLink, LBindLink) then
    begin
      LBindLink.Active := AValue;
    end
    else if Supports(LBindComp, IBindPosition, LBindPosition) then
    begin
      LBindPosition.Active := AValue;
    end
    else if Supports(LBindComp, IBindActivate, LBindActivate) then
    begin
      LBindActivate.SetActive(AValue);
    end;
  end;
end;

procedure TBaseBindScopeComponent.AddExpression(
  AExpression: TBasicBindComponent);
begin
  Assert(not FExpressions.Contains(AExpression));
  AExpression.FreeNotification(Self);
  FExpressions.Add(AExpression);
end;

constructor TBaseBindScopeComponent.Create(AOwner: TComponent);
begin
  inherited;
  FExpressions := TList<TBasicBindComponent>.Create;
end;

destructor TBaseBindScopeComponent.Destroy;
begin
  FreeAndNil(FExpressions);
  inherited;
end;

function TBaseBindScopeComponent.GetMemberScope(
  const AMemberName: string): IScope;
var
  LMember: TObject;
begin
  LMember := GetMember(AMemberName);
  if LMember <> nil then
    Result := WrapObject(LMember)
  else
    Result := nil;
end;

function TBaseBindScopeComponent.GetScope: IScope;
var
  LObject: TObject;
begin
  LObject := GetValue;
  if LObject = nil then
    Result := nil
  else
    Result := WrapObject(LObject);
end;

function TBaseBindScopeComponent.GetValue: TObject;
begin
  Result := Self;
end;

function TBaseBindScopeComponent.GetMember(const AMemberName: string): TObject;
begin
  Result := nil;
end;


procedure TBaseBindScopeComponent.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = TOperation.opRemove then
    if AComponent is TBasicBindComponent then
    if FExpressions <> nil then
      if FExpressions.Contains(TBasicBindComponent(AComponent)) then
        FExpressions.Remove(TBasicBindComponent(AComponent));
end;

procedure TBaseBindScopeComponent.RemoveExpression(
  AExpression: TBasicBindComponent);
begin
  if FExpressions <> nil then
    if FExpressions.Contains(AExpression) then
    begin
      AExpression.RemoveFreeNotification(Self);
      FExpressions.Remove(AExpression);
    end;
end;


{ TCustomBindLink }

function TCustomBindLink.GetCanModify: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetCanModify(Self)
  else
    Result := False;
end;

procedure TCustomBindLink.ClearModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.ClearModified(Self)
end;

procedure TCustomBindLink.UpdateRecord;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.UpdateRecord(Self)
end;

procedure TCustomBindLink.BeginUpdate;
begin
  Inc(FUpdateCounter);
end;

function TCustomBindLink.CanDesignActivate: Boolean;
begin
  Result := True;
end;

procedure TCustomBindLink.CheckEditingLink;
begin
  FControlObserver.Component := ControlComponent;
  FControlObserver.EnsureObserving(TControlObserver.IDEditLinkObserver,
    function: IObserver
    begin
      Result := TBindEditLinkObserver.Create(Self);
    end);
end;

procedure TCustomBindLink.ClearEditingLink;
begin
  FControlObserver.Component := nil;
end;

constructor TCustomBindLink.Create(AOwner: TComponent);
begin
  inherited;
  FControlObserver := TControlObserver.Create;
  FUpdateCounter := 0;
  FParseExpressions := TExpressions.Create(Self, TExpressionItem);
  FClearExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatExpressions := TExpressions.Create(Self, TExpressionItem);

  FClearExpressionObjects := TList<TBindingExpression>.Create;
  FParseExpressionObjects := TList<TBindingExpression>.Create;
  FFormatExpressionObjects := TList<TBindingExpression>.Create;
end;

destructor TCustomBindLink.Destroy;
begin
  ClearEditingLink;
  FControlObserver.Free;
  FreeExpressionsObjects;
  FParseExpressions.Free;
  FClearExpressions.Free;
  FFormatExpressions.Free;

  FParseExpressionObjects.Free;
  FClearExpressionObjects.Free;
  FFormatExpressionObjects.Free;
  inherited;
end;

procedure TCustomBindLink.Loaded;
begin
  try
    inherited;
    if CanActivate then
      LoadActivate;
  except
    // Don't raise exception when loading
  end;
end;

procedure TCustomBindLink.SetModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.SetModified(Self)
end;

function TCustomBindLink.GetIsModified: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetIsModified(Self)
  else
    Result := False;
end;

function TCustomBindLink.GetUpdating: Boolean;
begin
  Result := FUpdateCounter > 0;
end;

function TCustomBindLink.RequiresControlHandler: Boolean;
begin
  Result := FParseExpressions.Count > 0;
end;

procedure TCustomBindLink.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      ClearModified;
      if not Designing then
        if Value and RequiresControlHandler then
        begin
          CheckEditingLink;
          if not FControlObserver.TrySetActive(True) then
            raise TBindCompException.CreateFmt(sNoControlObserverSupport, [Self.DisplayName, SafeClassName(ControlComponent)]);
        end;
      try
        if not Value then
          if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
            EvaluateClear('');
      finally
        if Value then
          DoOnActivating
        else
          DoOnDeactivating;

        FActive := Value;
        if FActive then
        begin
          try
            FreeExpressionsObjects;
            UpdateExpressions;
            EvaluateFormat('');
            DoOnActivated;
          except
            FreeExpressionsObjects;
            FActive := False;
            raise;
          end;
        end
        else
        begin
          FControlObserver.TrySetActive(False);
          FreeExpressionsObjects;
          DoOnDeactivated;
        end;
      end;
    end;
  end;
end;

procedure TCustomBindLink.FreeExpressionObject(var AExpression: TBindingExpression);
begin
  FreeAndNil(AExpression);
end;

procedure TCustomBindLink.FreeExpressionsObjects;
begin
  FreeExpressionObjects(FFormatExpressionObjects);
  FreeExpressionObjects(FParseExpressionObjects);
  FreeExpressionObject(FControlExpressionObject);
  FreeExpressionObjects(FClearExpressionObjects);
  FreeAndNil(FControlExpressionObject);
end;

function TCustomBindLink.GetActive: Boolean;
begin
  Result := FActive;
end;

function TCustomBindLink.GetBindComp: TComponent;
begin
  Result := Self;
end;

function TCustomBindLink.IsRequired: Boolean;
var
  LScopeEditor: IScopeEditor;
begin
  Result := False;
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
  begin
    Result := LScopeEditor.IsRequired(SourceMemberName);
  end;
end;

procedure TCustomBindLink.SetIsReadOnly(Value: Boolean);
var
  LScopeEditLink: IScopeEditLink;
begin
  if Supports(SourceComponent, IScopeEditLink, LScopeEditLink) then
    LScopeEditLink.SetReadOnly(Self, Value);
end;

function TCustomBindLink.IsValidChar(AKey: Char): Boolean;
var
  LScopeEditor: IScopeEditor;
begin
  Result := True;
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
  begin
    Result := LScopeEditor.IsValidChar(SourceMemberName, AKey);
  end;
end;

procedure TCustomBindLink.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  Assert(FFormatExpressionObjects.Count = 0);
  Assert(FClearExpressionObjects.Count = 0);
  Assert(FParseExpressionObjects.Count = 0);
  Assert(FControlExpressionObject = nil);


  for LExpressionItem in FFormatExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      GetSourceScopes,
      LExpressionItem.SourceExpression,
      GetcontrolScopes, //Output destination(s)
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );

    FFormatExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FClearExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      GetSourceScopes,
      LExpressionItem.SourceExpression,
      GetControlScopes,
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FClearExpressionObjects.Add(LBindingExpression);

  end;


  for LExpressionItem in FParseExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      GetControlScopes,
      LExpressionItem.ControlExpression,
      GetSourceScopes,
      LExpressionItem.SourceExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FParseExpressionObjects.Add(LBindingExpression);

  end;

  FControlExpressionObject := TBindings.CreateExpression(
    GetControlScopes, //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
end;


procedure TCustomBindLink.SetFormatExpressions(const Value: TExpressions);
begin
  FFormatExpressions.Assign(Value);
end;

procedure TCustomBindLink.SetParseExpressions(const Value: TExpressions);
begin
  FParseExpressions.Assign(Value);
end;

procedure TCustomBindLink.UpdateControlChanging;
begin
  inherited; // Set active false
  ClearEditingLink;
end;

procedure TCustomBindLink.SetClearExpressions(const Value: TExpressions);
begin
  FClearExpressions := Value;
end;

procedure TCustomBindLink.Reset;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.Reset(Self)
end;

procedure TCustomBindLink.EvaluateParse(const AMemberName: string);
var
  LExpression: TBindingExpression;
begin
  if Active then
    for LExpression in FParseExpressionObjects do
    begin
      if LExpression.Compiled then
        LExpression.Evaluate;
    end;
end;


function TCustomBindLink.EvaluateControl: IValue;
begin
  Result := nil;
  if FControlExpressionObject <> nil then
  begin
    if FControlExpressionObject.Compiled then
      Result := FControlExpressionObject.Evaluate;
  end;

end;

function TCustomBindLink.Edit: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.Edit(Self)
  else
    Result := True;
end;

procedure TCustomBindLink.EndUpdate;
begin
  Dec(FUpdateCounter);
  if FUpdateCounter < 0 then
    FUpdateCounter := 0;
end;

function TCustomBindLink.GetIsEditing: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetIsEditing(Self)
  else
    Result := False;
end;

procedure TCustomBindLink.EvaluateClear(const AMemberName: string);
var
  LExpression: TBindingExpression;
begin
  if Active then
    for LExpression in FClearExpressionObjects do
    begin
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.Evaluate;
    end;
end;

procedure TCustomBindLink.EvaluateFormat(const AMemberName: string);
var
  LExpression: TBindingExpression;
begin
  if Active then
    for LExpression in FFormatExpressionObjects do
    begin
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.Evaluate;
    end;

end;


{ TBindArtifacts }

function TBindArtifacts.GetItem(Index: Integer): TBindArtifactItem;
begin
  Result := TBindArtifactItem(inherited Items[Index]);
end;


constructor TBindArtifacts.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TBindArtifactItem);
end;

function TBindArtifacts.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := sIDAttr;
    1: Result := sStateAttr;
  else
    Result := ''; { do not localize }
  end;
end;

function TBindArtifacts.GetAttrCount: Integer;
begin
  Result := 2;
end;

function TBindArtifacts.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: begin
         Result := Items[ItemIndex].ID;
       end;
    1: Result := GetEnumName(TypeInfo(TBindArtifactState), Integer(Items[ItemIndex].State));
  else
    Result := '';
  end;
end;

procedure TBindArtifacts.SetItem(Index: Integer; const Value: TBindArtifactItem);
begin
  inherited SetItem(Index, TCollectionItem(Value));

end;


{ TBindArtifactItem }

procedure TBindArtifactItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TBindArtifactItem then
  begin
    TBindArtifactItem(Dest).ID := ID;
    TBindArtifactItem(Dest).State := State;
  end
  else
    inherited;
end;

constructor TBindCompDesignExpression.Create(const AName, AControlScope, AControlExpression: string;
  const ASourceScope, ASourceExpression: string;
  AExecuteAssignToControl, AExecuteAssignToSource: TExecuteDesignExpression2;
  AExecuteControl, AExecuteSource: TExecuteDesignExpression;
  ASaveControl, ASaveSource: TSaveDesignExpression; ACollectionItem: TCollectionItem;
  const ACollectionName: string;
  AParentCollectionItem: TCollectionItem;
  AExpressionType: TBindCompDesignerExpressionType);
begin
  FName := AName;
  FCollectionName := ACollectionName;
  FControlScope := AControlScope;
  FControlExpression := AControlExpression;
  FSourceScope := ASourceScope;
  FSourceExpression := ASourceExpression;
  FExecuteAssignToSourceProc := AExecuteAssignToSource;
  FExecuteAssignToControlProc := AExecuteAssignToControl;
  FExecuteControlProc := AExecuteControl;
  FExecuteSourceProc := AExecuteSource;
  FSaveControlProc := ASaveControl;
  FSaveSourceProc := ASaveSource;
  FCollectionItem := ACollectionItem;
  FParentCollectionItem := AParentCollectionItem;
  FExpressionType := AExpressionType;
end;


procedure TCustomBindList.ClearList;
var
  LEditor: IBindListEditor;
begin
  LEditor := GetBindListEditor;
  LEditor.BeginUpdate;
  try
    LEditor.ClearList;
    EvaluateClearControl;
  finally
    LEditor.EndUpdate;
  end;
end;

function TCustomBindList.GetActive: Boolean;
begin
  Result := FActive;
end;

function TCustomBindList.GetBindListEditor: IBindListEditor;
begin
  CheckControlComponent;
  if not TryGetBindListEditor(Result) then
    raise TBindCompException.CreateFmt(sNoEditor, [Self.DisplayName, SafeClassName(ControlComponent)]);
end;


function TCustomBindList.TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
begin
  AEditor := nil;
  if (ControlComponent <> nil) and
    (not (csDestroying in ControlComponent.ComponentState)) then
     Supports(GetBindEditor(ControlComponent, IBindListEditor), IBindListEditor, AEditor);
  Result := AEditor <> nil;
end;



function TCustomBindList.TryGetScopeRecordEnumerator(out AEnumerator: IScopeRecordEnumerator): Boolean;
var
  LIntf: IScopeRecordEnumerable;
begin
  if Supports(SourceComponent, IScopeRecordEnumerable, LIntf) then
    AEnumerator := LIntf.GetEnumerator(SourceMemberName, FBufferCount)
  else
    AEnumerator := nil;
  Result := AEnumerator <> nil;
end;

function TCustomBindList.GetScopeRecordEnumerator: IScopeRecordEnumerator;
var
  LIntf: IScopeRecordEnumerable;
begin
  if Supports(SourceComponent, IScopeRecordEnumerable, LIntf) then
    Result := LIntf.GetEnumerator(SourceMemberName, FBufferCount)
  else
    raise TBindCompException.CreateFmt(sNoEnumerator, [Self.DisplayName, SafeClassName(SourceComponent)]);
end;

procedure TCustomBindList.EvaluateFormatControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FFormatControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindList.InsertItem(Select: Boolean);
var
  LEditor: IBindListEditor;
  LScope: IScope;
  LExpression: TExpressionItem;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    LScope := LEditor.InsertItem(Select);
    if LScope <> nil then
    begin
      for LExpression in FFormatExpressions do
      begin
        EvaluateExpressionItem(LExpression, LScope,
          inherited GetComponentScope(SourceComponent, SourceMemberName));
      end;
    end
    else
      raise TBindCompException.CreateFmt(sNoInsertItem, [Self.DisplayName, SourceComponent.ClassName]);
  end
end;

procedure TCustomBindList.EvaluatePosControl;
begin
  // Do nothing by default.
end;

procedure TCustomBindList.AddItem(Select: Boolean);
var
  LEditor: IBindListEditor;
  LScope: IScope;
  LExpression: TExpressionItem;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    LScope := LEditor.AddItem(Select);
    if LScope <> nil then
    begin
      for LExpression in FFormatExpressions do
      begin
        EvaluateExpressionItem(LExpression, LScope,
          inherited GetComponentScope(SourceComponent, SourceMemberName));
      end;
    end
    else
      raise TBindCompException.CreateFmt(sNoEnumerator, [Self.DisplayName, SourceComponent.ClassName]);
  end
end;

procedure TCustomBindList.EvaluateClearControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FClearControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindList.FillList;
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
begin
  EvaluateFormatControl;
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    if TryGetScopeRecordEnumerator(LEnumerator) then
    begin
        LEditor.FillList(LEnumerator,
          procedure(const ASourceScope, AEditorScope: IScope)
          var
          LExpression: TExpressionItem;
            begin
          for LExpression in FFormatExpressions do
            begin
            EvaluateExpressionItem(LExpression, AEditorScope, ASourceScope);
            end;
          end)
    end
  end
end;

procedure TCustomBindList.EvaluateExpressionItem(AItem: TExpressionItem; AEditorScope: IScope;
  AEnumScope: IScope);
begin
  EvaluateExpressions(AEditorScope, AItem.ControlExpression, AEnumScope, AItem.SourceExpression);
end;

procedure TCustomBindList.EvaluateExpressions(AEditorScope: IScope; const AEditorExpression: string;
  AEnumScope: IScope; const AEnumExpression: string);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    inherited GetComponentScopes(AEnumScope),
    AEnumExpression,
    inherited GetComponentScopes(AEditorScope), //Output destination(s)
    AEditorExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
    []  // Execute
  );
  try
    LExpression.Evaluate;
  finally
    LExpression.Free;
  end;
end;


constructor TCustomBindList.Create(AOwner: TComponent);
begin
  inherited;
  FFormatExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FClearControlExpressions := TExpressions.Create(Self, TExpressionItem);

  FFormatControlExpressionObjects := TList<TBindingExpression>.Create;
  FClearControlExpressionObjects := TList<TBindingExpression>.Create;
  FBufferCount := -1;
  FAutoFill := True;

end;

destructor TCustomBindList.Destroy;
begin
  FreeExpressionsObjects;
  FFormatExpressions.Free;
  FFormatControlExpressions.Free;
  FClearControlExpressions.Free;

  FFormatControlExpressionObjects.Free;
  FClearControlExpressionObjects.Free;
  inherited;
end;

function TCustomBindList.CanInsert: Boolean;
var
  LEditor: IBindListEditor;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
    Result := LEditor.CanInsertItem
  else
    Result := False;
end;

function TCustomBindList.CanUpdate: Boolean;
var
  LEditor: IBindListEditor;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
    Result := LEditor.CurrentItem <> nil
  else
    Result := False;
end;

procedure TCustomBindList.EvaluateControlExpression(
  const AExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFill then
  begin
    LEditor := GetBindListEditor;
    // Get an item to evaluate
    LScope := LEditor.CurrentItem;
    if LScope = nil then
    begin
      if LEditor.MoveNext then
        LScope := LEditor.CurrentItem
      else
        LScope := LEditor.AddItem;
    end;
    begin
      EvaluateControlExpression(LScope, AExpression, ACallback);
    end;
  end
  else
  begin
    inherited EvaluateControlExpression(AExpression, ACallback, AType);
  end;

end;

procedure TCustomBindList.ExecuteAssignToControlExpression(
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFill then
  begin
    LEditor := GetBindListEditor;
    LEnumerator := GetScopeRecordEnumerator;
    if LEnumerator <> nil then
    begin
      LEditor.BeginUpdate;
      try
        if LEnumerator.MoveNext then
        begin

          LScope := LEditor.CurrentItem;
          if LScope = nil then
          begin
            if LEditor.MoveNext then
              LScope := LEditor.CurrentItem
            else
              LScope := LEditor.AddItem;
          end;
          EvaluateExpressions(LScope, AControlExpression, LEnumerator.Current, ASourceExpression);
        end;
      finally
        LEditor.EndUpdate;
      end;
    end
  end
  else
  begin
      LScope := LEditor.CurrentItem;
      if LScope = nil then
      begin
        if LEditor.MoveNext then
          LScope := LEditor.CurrentItem
        else
          LScope := LEditor.AddItem;
      end;

      EvaluateExpressions(LScope, AControlExpression,
        inherited GetComponentScope(SourceComponent, SourceMemberName),
        ASourceExpression);
  end

end;

procedure TCustomBindList.ExecuteAssignToSourceExpression(const AControlExpression, ASourceExpression: string;
  ACallback: TProc<IValue>; AType: TBindCompExpressionType);
begin
                                             
  Assert(False);
end;

procedure TCustomBindList.UpdateItem;
var
  LEditor: IBindListEditor;
  LScope: IScope;
  LExpression: TExpressionItem;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    LScope := LEditor.CurrentItem;
    if LScope <> nil then
    begin
      for LExpression in FFormatExpressions do
      begin
        EvaluateExpressionItem(LExpression, LScope,
          inherited GetComponentScope(SourceComponent, SourceMemberName));
      end;
    end
    else
      raise TBindCompException.CreateFmt(sNoEnumerator, [Self.DisplayName, SourceComponent.ClassName]);
  end
end;

procedure TCustomBindList.EvaluateSourceExpression(
  const AExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEnumerator: IScopeRecordEnumerator;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFill then
  begin
    LEnumerator := GetScopeRecordEnumerator;
    if LEnumerator <> nil then
    begin
      if LEnumerator.MoveNext then
        LScope := LEnumerator.Current
      else
        LScope := nil;
      EvaluateSourceExpression(LEnumerator.Current, AExpression, ACallback);
    end
    else
    begin
      inherited EvaluateSourceExpression(AExpression, ACallback, AType);
    end;
  end
  else
    inherited;
end;

procedure TCustomBindList.FreeExpressionsObjects;
begin
  FreeAndNil(FControlExpressionObject);
  FreeExpressionObjects(FClearControlExpressionObjects);
  FreeExpressionObjects(FFormatControlExpressionObjects);
end;

procedure TCustomBindList.Loaded;
begin
  try
    inherited;
    if FDeferActive then
    begin
      FDeferActive := False;
      SetActive(True);
    end
    else
      LoadActivate;
  except
    // Don't raise exception when loading
  end;
end;

procedure TCustomBindList.ResetList;
begin
  if Active then
  begin
    if AutoFill then
      FillList;
  end;
end;

procedure TCustomBindList.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      if Value then
        DoOnActivating
      else
        DoOnDeactivating;

      FActive := Value;
      if FActive then
      begin
        try
          FreeExpressionsObjects;
          UpdateExpressions;
          if AutoFill then
            FillList;
          EvaluatePosControl;
          DoOnActivated;
        except
          FreeExpressionsObjects;
          FActive := False;
          raise;
        end;
      end
      else
      begin
        try
          if AutoFill then
            if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
              ClearList;
        finally
          FreeExpressionsObjects;
        end;
        DoOnDeactivated;
      end;
    end;
  end;

end;

procedure TCustomBindList.SetAutoFill(const Value: Boolean);
begin
  if FAutoFill <> Value then
    FAutoFill := Value;
end;

procedure TCustomBindList.SetFormatExpressions(const Value: TExpressions);
begin
  FFormatExpressions.Assign(Value);
end;

procedure TCustomBindList.SetFormatControlExpressions(const Value: TExpressions);
begin
  FFormatControlExpressions.Assign(Value);
end;

procedure TCustomBindList.SetClearControlExpressions(const Value: TExpressions);
begin
  FClearControlExpressions.Assign(Value);
end;

procedure TCustomBindList.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  Assert(FControlExpressionObject = nil);
  Assert(FFormatControlExpressionObjects.Count = 0);
  Assert(FClearControlExpressionObjects.Count = 0);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;


  for LExpressionItem in FClearControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );

    FClearControlExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FFormatControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),  // output
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FFormatControlExpressionObjects.Add(LBindingExpression);
  end;

  FControlExpressionObject := TBindings.CreateExpression(
    inherited GetComponentScopes(ControlComponent), //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );


end;

{ TCustomBindPosition }

procedure TCustomBindPosition.CheckEditingLink;
var
  LObservers: TObservers;
  LPositionObserver: IPositionLinkObserver;
begin
  if (GetControlComponent <> nil) and (not Assigned(FPositionObserver)) then
  begin
    LObservers := GetControlComponent.Observers;
    if LObservers.CanObserve(TObserverMapping.PositionLinkID) then
    begin
      LPositionObserver := TBindPositionLinkObserver.Create(Self);
      LObservers.AddObserver(TObserverMapping.PositionLinkID, LPositionObserver);
      FPositionObserver := LPositionObserver;
    end;
  end;
end;

procedure TCustomBindPosition.ClearEditingLink;
begin
  try
    if Assigned(ControlComponent) then
    begin
      if FPositionObserver <> nil then
        ControlComponent.Observers.RemoveObserver(TObserverMapping.PositionLinkID, FPositionObserver);
    end;
  finally
    FPositionObserver := nil;
  end;
end;

constructor TCustomBindPosition.Create(AOwner: TComponent);
begin
  inherited;
  FPosSourceExpressions := TExpressions.Create(Self, TExpressionItem);
  FPosControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FPosClearExpressions := TExpressions.Create(Self, TExpressionItem);

  FPosControlExpressionObjects := TList<TBindingExpression>.Create;
  FPosSourceExpressionObjects := TList<TBindingExpression>.Create;
  FPosClearExpressionObjects := TList<TBindingExpression>.Create;
end;

destructor TCustomBindPosition.Destroy;
begin
  ClearEditingLink;
  FreeExpressionsObjects;
  FPosSourceExpressions.Free;
  FPosControlExpressions.Free;
  FPosClearExpressions.Free;

  FPosControlExpressionObjects.Free;
  FPosSourceExpressionObjects.Free;
  FPosClearExpressionObjects.Free;
  inherited;
end;

procedure TCustomBindPosition.FreeExpressionsObjects;
begin
  FreeExpressionObjects(FPosControlExpressionObjects);
  FreeExpressionObjects(FPosSourceExpressionObjects);
  FreeExpressionObjects(FPosClearExpressionObjects);
  FreeAndNil(FControlExpressionObject);
end;

function TCustomBindPosition.GetActive: Boolean;
begin
  Result := FActive;
end;

procedure TCustomBindPosition.Loaded;
begin
  try
    inherited;
    if FDeferActive then
    begin
      FDeferActive := False;
      SetActive(True);
    end
    else
      LoadActivate;
  except
    // Don't raise exception when loading
  end;
end;

procedure TCustomBindPosition.PosChanged;
begin
//
  EvaluatePosSource;

end;

function TCustomBindPosition.RequiresControlHandler: Boolean;
begin
  Result := FPosSourceExpressions.Count > 0;
end;

procedure TCustomBindPosition.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      if not Designing then
        if Value and RequiresControlHandler then
        begin
          CheckEditingLink;
          if not Assigned(FPositionObserver) then
            raise TBindCompException.CreateFmt(sNoControlObserverSupport, [Self.DisplayName, SafeClassName(ControlComponent)]);
        end;
      if Value then
        DoOnActivating
      else
        DoOnDeactivating;
      FActive := Value;
      if FActive then
      begin
        try
          FreeExpressionsObjects;
          UpdateExpressions;
          EvaluatePosControl;
          DoOnActivated;
        except
          FreeExpressionsObjects;
          FActive := False;
          raise;
        end;
      end
      else
      begin
        try
          if (ControlComponent <> nil) and
            (not (csDestroying in ControlComponent.ComponentState)) then
            EvaluatePosClear;
        finally
          FreeExpressionsObjects;
        end;
        DoOnDeactivated;
      end;
    end;
  end;

end;

procedure TCustomBindPosition.SetControlComponent(const Value: TComponent);
begin
  inherited;

end;

procedure TCustomBindPosition.EvaluatePosClear;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FPosClearExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindPosition.EvaluatePosControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FPosControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindPosition.EvaluatePosSource;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FPosSourceExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

function TCustomBindPosition.GetBindComp: TComponent;
begin
  Result := Self;
end;

procedure TCustomBindPosition.UpdateControlChanging;
begin
  inherited; //Set active false
  ClearEditingLink;
end;

procedure TCustomBindPosition.SetPosSourceExpressions(const Value: TExpressions);
begin
  FPosSourceExpressions.Assign(Value);
end;

procedure TCustomBindPosition.SetPosClearExpressions(const Value: TExpressions);
begin
  FPosClearExpressionObjects.Free;
end;

procedure TCustomBindPosition.SetPosControlExpressions(const Value: TExpressions);
begin
  FPosControlExpressions.Assign(Value);
end;

procedure TCustomBindPosition.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  Assert(FPosSourceExpressionObjects.Count = 0);
  Assert(FPosControlExpressionObjects.Count = 0);
  Assert(FPosClearExpressionObjects.Count = 0);
  Assert(FControlExpressionObject = nil);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;

  for LExpressionItem in FPosControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent, SourceMemberName),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );

    FPosControlExpressionObjects.Add(LBindingExpression);
  end;

  for LExpressionItem in FPosClearExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent, SourceMemberName),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );

    FPosClearExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FPosSourceExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      inherited GetComponentScopes(SourceComponent, SourceMemberName),  // output
      LExpressionItem.SourceExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FPosSourceExpressionObjects.Add(LBindingExpression);
  end;


  FControlExpressionObject := TBindings.CreateExpression(
    inherited GetComponentScopes(ControlComponent), //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );


end;


{ TExpressionsEnumerator }

function TExpressionsEnumerator.GetCurrent: TExpressionItem;
begin
  Result := TExpressionItem(inherited GetCurrent);
end;

{ TExpressionDirEnumerator }

function TExpressionDirEnumerator.GetCurrent: TExpressionItemDir;
begin
  Result := TExpressionItemDir(inherited GetCurrent);
end;

procedure RegisterBindEditorFactory(AFactories: array of TBindEditorFactoryClass);
var
  LClass: TBindEditorFactoryClass;
begin
  for LClass in AFactories do
    FEditorFactories.Add(LClass);
end;

procedure UnregisterBindEditorFactory(AFactories: array of TBindEditorFactoryClass);
var
  LClass: TBindEditorFactoryClass;
begin
  for LClass in AFactories do
      FEditorFactories.Remove(LClass);
end;

{ TBindEditorFactory }

constructor TBindEditorFactory.Create;
begin
//
end;

{ TBindEventListT }

procedure TBindEventListT.InternalAdd(AEvent: TNotifyEvent);
begin
  FList.Add(AEvent);
end;

constructor TBindEventListT.Create;
begin
  FList := TList<TNotifyEvent>.Create;
end;

destructor TBindEventListT.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TBindEventListT.InternalRemove(AEvent: TNotifyEvent);
begin
  FList.Remove(AEvent);
end;

{ TBindCompDesignExpressionCollection }

constructor TBindCompDesignExpressionCollection.Create(const AName: string;
  ACollection: TCollection; AParentCollectionItem: TCollectionItem;
  ACollectionType: TBindCompDesignerCollectionType);
begin
  FName := AName;
  FCollection := ACollection;
  FParentCollectionItem := AParentCollectionItem;
  FCollectionType := ACollectionType;
end;

{ TCustomBindGridList }

constructor TCustomBindGridList.Create(AOwner: TComponent);
begin
  inherited;
  FColumnExpressions := TColumnFormatExpressions.Create(Self, TColumnFormatExpressionItem);

  FFormatControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FClearControlExpressions := TExpressions.Create(Self, TExpressionItem);

  FFormatControlExpressionObjects := TList<TBindingExpression>.Create;
  FClearControlExpressionObjects := TList<TBindingExpression>.Create;
  FAutoFill := True;
  FBufferCount := -1;
end;

destructor TCustomBindGridList.Destroy;
begin
  FreeExpressionsObjects;
  FColumnExpressions.Free;

  FFormatControlExpressions.Free;
  FClearControlExpressions.Free;

  FFormatControlExpressionObjects.Free;
  FClearControlExpressionObjects.Free;
  inherited;
end;


function TCustomBindGridList.GetActive: Boolean;
begin
  Result := FActive;
end;

function TCustomBindGridList.GetBindListEditor: IBindListEditor;
begin
  CheckControlComponent;
  if not TryGetBindListEditor(Result) then
    raise TBindCompException.CreateFmt(sNoEditor, [Self.DisplayName, ControlComponent.ClassName]);
end;

function TCustomBindGridList.TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
var
  LEditor: IInterface;
begin
  AEditor := nil;
  if (ControlComponent <> nil) and Supports(GetBindEditor(ControlComponent, IBindListEditor), IBindListEditor, LEditor) then
    AEditor := LEditor as IBindListEditor;
  Result := AEditor <> nil;
end;

function TCustomBindGridList.GetScopeRecordEnumerator: IScopeRecordEnumerator;
var
  LIntf: IScopeRecordEnumerable;
begin
  if Supports(SourceComponent, IScopeRecordEnumerable, LIntf) then
    Result := LIntf.GetEnumerator('', FBufferCount)
  else
    Result :=nil;
end;

procedure TCustomBindGridList.FillGrid;
  function HaveFormatCellExpressions:  Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to FColumnExpressions.Count - 1 do
    begin
      if FColumnExpressions[I].FormatCellExpressions.Count > 0 then
        Exit(True);
    end;
  end;
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    EvaluateFormatControl;
    FormatColumns;
    if HaveFormatCellExpressions then
    begin
      LEnumerator := GetScopeRecordEnumerator;
      if LEnumerator <> nil then
      begin
        LEditor.FillList(LEnumerator,
          procedure(const ASourceScope, AEditorScope: IScope)
          begin
            Assert(AEditorScope <> nil);
            FillRecord(AEditorScope,
              function(AColumnExpression: TColumnFormatExpressionItem): IScope
              begin
                Result := LEnumerator.GetMemberCurrent(AColumnExpression.SourceMemberName);
              end);
          end);
      end
      else
        Assert(False);
    end
    else
      LEditor.ClearList;
  end
end;

procedure TCustomBindGridList.FormatColumns;
var
  LExpression: TExpressionItem;
  LColumnExpressionItem: TColumnFormatExpressionItem;
  I: Integer;
  LExpressions: TExpressions;
  LEditorScope: IScope;
begin
  Assert(FColumnExpressions.Count > 0);
  for I := 0 to FColumnExpressions.Count - 1 do
  begin
    LColumnExpressionItem := FColumnExpressions[I];
    LEditorScope := GetComponentScope(Self.ControlComponent);
    if LColumnExpressionItem.FormatColumnExpressions.Count > 0 then
      LExpressions := LColumnExpressionItem.FormatColumnExpressions
    else
      LExpressions := nil;
    if LExpressions <> nil then
    begin
      for LExpression in LExpressions do
        EvaluateExpressions(LColumnExpressionItem,
           LEditorScope, LExpression.FControlExpression,
           GetComponentScope(SourceComponent, LColumnExpressionItem.SourceMemberName), LExpression.FSourceExpression
           );
    end;
  end;
end;

procedure TCustomBindGridList.FillRecord(AEditorScope: IScope;
  AGetMemberScope: TFunc<TColumnFormatExpressionItem, IScope>);
var
  LExpression: TExpressionItem;
  LColumnExpressionItem: TColumnFormatExpressionItem;
  I: Integer;
  LExpressions: TExpressions;
begin
  if AEditorScope <> nil then
  begin
    Assert(FColumnExpressions.Count > 0);
    for I := 0 to FColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := FColumnExpressions[I];
      if LColumnExpressionItem.FormatCellExpressions.Count > 0 then
        LExpressions := LColumnExpressionItem.FormatCellExpressions
      else
        LExpressions := nil;
      if LExpressions <> nil then
      begin
        for LExpression in LExpressions do
          EvaluateExpressionItem(LColumnExpressionItem, LExpression, AEditorScope,
           AGetMemberScope(LColumnExpressionItem));
      end;
    end;
  end;
end;

procedure TCustomBindGridList.EvaluateExpressionItem(AColumnExpressionItem: TColumnFormatExpressionItem; AItem: TExpressionItem; AEditorScope: IScope;
  AEnumScope: IScope);
begin
  EvaluateExpressions(AColumnExpressionItem, AEditorScope, AItem.ControlExpression, AEnumScope, AItem.SourceExpression);
end;

procedure TCustomBindGridList.EvaluateExpressions(AColumnExpressionItem: TColumnFormatExpressionItem; AEditorScope: IScope; const AEditorExpression: string;
  AEnumScope: IScope; const AEnumExpression: string);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetComponentScopes(AEnumScope),
    AEnumExpression,
    inherited GetComponentScopes(AEditorScope), //Output destination(s)
    AEditorExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
    []  // Execute
  );
  try
    LExpression.Evaluate;
  finally
    LExpression.Free;
  end;
end;

function TCustomBindGridList.CanDesignActivate: Boolean;
begin
  Result := True;
end;

procedure TCustomBindGridList.ClearGrid;
var
  LEditor: IBindListEditor;
begin
  LEditor := GetBindListEditor;
  LEditor.BeginUpdate;
  try
    LEditor.ClearList;
    EvaluateClearControl;
  finally
    LEditor.EndUpdate;
  end;
end;

procedure TCustomBindGridList.EvaluateControlExpression(AColumnExpressionItem: TColumnFormatExpressionItem;
  const AExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFormatColumn then
  begin
    inherited EvaluateControlExpression(AExpression, ACallback, AType);
  end
  else
  begin
    LEditor := GetBindListEditor;

    LScope := LEditor.CurrentItem;
    if LScope = nil then
    begin
      if LEditor.MoveNext then
        LScope := LEditor.CurrentItem
      else
        LScope := LEditor.AddItem;
    end;
    Assert(LScope <> nil);
    if LScope <> nil then
    begin
      EvaluateControlExpression(LScope, AExpression, ACallback);
    end;
  end;
end;

procedure TCustomBindGridList.ExecuteAssignToControlExpression(AColumnExpressionItem: TColumnFormatExpressionItem;
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
  LEditorScope: IScope;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFormatColumn then
  begin
    LEditorScope := GetComponentScope(ControlComponent);
    LScope := GetComponentScope(SourceComponent, AColumnExpressionItem.SourceMemberName);
    EvaluateExpressions(AColumnExpressionItem, LEditorScope, AControlExpression, LScope, ASourceExpression);
  end
  else
  begin
    LEditor := GetBindListEditor;
    LEditor.BeginUpdate;
    try
      LEnumerator := GetScopeRecordEnumerator;
      if LEnumerator <> nil then
      begin
        if LEnumerator.MoveNext then
        begin

          LScope := LEditor.CurrentItem;
          if LScope = nil then
          begin
            if LEditor.MoveNext then
              LScope := LEditor.CurrentItem
            else
              LScope := LEditor.AddItem;
          end;
          if LEditorScope <> nil then
          begin
            EvaluateExpressions(AColumnExpressionItem, LEditorScope, AControlExpression, LEnumerator.Current, ASourceExpression);
          end;
        end;
      end
      else
        Assert(False);
    finally
      LEditor.EndUpdate;
    end;
  end
end;

procedure TCustomBindGridList.EvaluateSourceExpression(AColumnExpressionItem: TColumnFormatExpressionItem;
  const AExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEnumerator: IScopeRecordEnumerator;
begin
  if AType = TBindCompExpressionType.exprFormatColumn then
  begin

  end
  else
  begin
    LEnumerator := GetScopeRecordEnumerator;
    if LEnumerator <> nil then
    begin
      if LEnumerator.MoveNext then
      begin
        EvaluateSourceExpression(
          LEnumerator.GetMemberCurrent(AColumnExpressionItem.SourceMemberName), AExpression,
            ACallback);
      end;
    end
    else
      Assert(False);
  end
end;

procedure TCustomBindGridList.EvaluateSourceExpression(
  AEnumScope: IScope; const AEnumExpression: string; ACallback: TProc<IValue>);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateExpression(
    inherited GetComponentScopes(AEnumScope),
    AEnumExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

procedure TCustomBindGridList.ExecuteAssignToSourceExpression(AColumnExpressionItem: TColumnFormatExpressionItem;
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetcontrolScopes(AColumnExpressionItem),
    AControlExpression,
    GetSourceScopes(AColumnExpressionItem),  //Output destination(s)
    ASourceExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
    []  // Execute
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

function TCustomBindGridList.GetSourceScopes(AColumnExpressionItem: TColumnFormatExpressionItem): TArray<IScope>;
begin
  Result := inherited GetComponentScopes(SourceComponent, AColumnExpressionItem.SourceMemberName);
end;

function TCustomBindGridList.GetControlScopes(AColumnExpressionItem: TColumnFormatExpressionItem): TArray<IScope>;
begin
                                  
  Result := inherited GetComponentScopes(ControlComponent);
end;

procedure TCustomBindGridList.Loaded;
begin
  try
    inherited;
    if FDeferActive then
    begin
      FDeferActive := False;
      SetActive(True);
    end
    else
      if CanActivate then
        LoadActivate
  except
    // Don't raise exception when loading
  end;

end;

procedure TCustomBindGridList.ResetGrid;
begin
  if Active then
  begin
    if AutoFill then
      FillGrid;
  end;
end;

procedure TCustomBindGridList.FreeExpressionsObjects;
begin
  FreeExpressionObjects(FClearControlExpressionObjects);
  FreeExpressionObjects(FFormatControlExpressionObjects);
  FreeAndNil(FControlExpressionObject);
end;

procedure TCustomBindGridList.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      if Value then
        DoOnActivating
      else
        DoOnDeactivating;

      FActive := Value;
      if FActive then
      begin
        try
          FreeExpressionsObjects;
          UpdateExpressions;
          if AutoFill then
            FillGrid;
//          EvaluatePosControl;
          DoOnActivated;
        except
          FreeExpressionsObjects;
          FActive := False;
          raise;
        end;
      end
      else
      begin
        try
          if AutoFill then
            if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
              ClearGrid;
        finally
          FreeExpressionsObjects;
        end;
        DoOnDeactivated;
      end;
    end;
  end;
end;

procedure TCustomBindGridList.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  Assert(FFormatControlExpressionObjects.Count = 0);
  Assert(FClearControlExpressionObjects.Count = 0);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;

  for LExpressionItem in FClearControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );

    FClearControlExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FFormatControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),  // output
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FFormatControlExpressionObjects.Add(LBindingExpression);
  end;


  FControlExpressionObject := TBindings.CreateExpression(
    inherited GetComponentScopes(ControlComponent), //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );


end;

procedure TCustomBindGridList.SetAutoFill(const Value: Boolean);
begin
  if FAutoFill <> Value then
  begin
    FAutoFill := Value;
//    if Active then
//      FillGrid
  end;
end;

procedure TCustomBindGridList.UpdateControlChanged;
begin
  inherited;
  //  UpdateActiveState;
end;

procedure TCustomBindGridList.SetColumnExpressions(
  const Value: TColumnFormatExpressions);
begin
  FColumnExpressions.Assign(Value);
end;

procedure TCustomBindGridList.SetFormatControlExpressions(
  const Value: TExpressions);
begin
  FFormatControlExpressions.Assign(Value);
end;

procedure TCustomBindGridList.SetClearControlExpressions(const Value: TExpressions);
begin
  FClearControlExpressions.Assign(Value);
end;


{ TCustomBindColumns }


constructor TCustomBindGridLink.Create(AOwner: TComponent);
begin
  inherited;
  FControlObserver := TControlObserver.Create;
  FUpdateCounter := 0;
  FColumnExpressions := TColumnLinkExpressions.Create(Self, TColumnLinkExpressionItem);

  FPosSourceExpressions := TExpressions.Create(Self, TExpressionItem);
  FPosControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FClearControlExpressions := TExpressions.Create(Self, TExpressionItem);

  FPosControlExpressionObjects := TList<TBindingExpression>.Create;
  FPosSourceExpressionObjects := TList<TBindingExpression>.Create;
  FFormatControlExpressionObjects := TList<TBindingExpression>.Create;
  FClearControlExpressionObjects := TList<TBindingExpression>.Create;
  FEditColumnIndex := -1;
  FAutoFill := True;
  FBufferCount := -1;
end;

destructor TCustomBindGridLink.Destroy;
begin
  SetActive(False);
  ClearEditingLink;
  FControlObserver.Free;
  FreeExpressionsObjects;

  FColumnExpressions.Free;

  FPosSourceExpressions.Free;
  FPosControlExpressions.Free;
  FFormatControlExpressions.Free;
  FClearControlExpressions.Free;

  FPosControlExpressionObjects.Free;
  FPosSourceExpressionObjects.Free;
  FFormatControlExpressionObjects.Free;
  FClearControlExpressionObjects.Free;
  FControlExpressionObject.Free;
  inherited;
end;

function TCustomBindGridLink.FindColumnExpressionItem(AIndex: Integer; AName: string): TColumnLinkExpressionItem;
var
  LItem: TColumnLinkExpressionItem;
  I: Integer;
begin
  Result := nil;
  for I := 0 to FColumnExpressions.Count - 1 do
  begin
    LItem := FColumnExpressions[I];
    if (AName = '') then
    begin
      if AIndex <> -1 then
      begin
// Note: ColumnIndex is always 0!
//         if LItem.ColumnIndex = AIndex then
         if LItem.Index = AIndex then
           Exit(LItem);
      end
    end
    else
      if SameText(LItem.ColumnName, AName) then
        Exit(LItem);
  end;
end;


procedure TCustomBindGridLink.EvaluateParse(const AMemberName: string);
var
  LItem: TColumnLinkExpressionItem;
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  if not Active then
    Exit;
  UpdateColumnCurrent;
  LItem := FindColumnExpressionItem(FEditColumnIndex, FEditColumnName);
  if LItem <> nil then
  begin
    for LExpressionItem in LItem.ParseCellExpressions do
    begin
      LBindingExpression := TBindings.CreateUnmanagedBinding(
        GetControlScopes(LItem),
        LExpressionItem.ControlExpression,
        GetSourceScopes(LItem),
        LExpressionItem.SourceExpression,
        GetOutputConverter,
        TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
        []  // Execute
      );
      try
        LBindingExpression.Evaluate;
      finally
        LBindingExpression.Free;
      end;
    end;
  end;
end;

procedure TCustomBindGridLink.EvaluatePosClear;
begin
  // Do nothing, control will take care of this when cleared
end;

procedure TCustomBindGridLink.EvaluatePosControl;
var
  LExpression: TBindingExpression;
begin
  if FLockPosControl <> 0 then
    Exit;
  for LExpression in FPosControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindGridLink.EvaluateClearControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FClearControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;


procedure TCustomBindGridLink.EvaluatePosSource;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FPosSourceExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindGridLink.EvaluateFormatControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FFormatControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindGridList.EvaluateFormatControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FFormatControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindGridList.EvaluateClearControl;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FClearControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

function TCustomBindGridLink.GetCanModify: Boolean;
var
  LScopeEditor: IScopeEditor;
  LFieldName: string;
  Intf: IScopeEditLink;
begin
  Result := True;
  LFieldName := UpdateColumnCurrent;
  if LFieldName = '' then
  begin
    if Supports(Sourcecomponent, IScopeEditLink, Intf) then
      Result := Intf.GetCanModify(Self)
    else
      Result := False;
  end
  else
    if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
      // Use #0 to find out if field is read only
      Result := LScopeEditor.IsValidChar(LFieldName, #0); 

end;

procedure TCustomBindGridLink.ClearModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.ClearModified(Self);
end;

function TCustomBindGridLink.GetActive: Boolean;
begin
  Result := FActive;
end;

function TCustomBindGridLink.GetBindComp: TComponent;
begin
  Result := Self;
end;

function TCustomBindGridLink.GetBindListEditor: IBindListEditor;
begin
  CheckControlComponent;
  if not TryGetBindListEditor(Result) then
    raise TBindCompException.CreateFmt(sNoEditor, [Self.DisplayName, ControlComponent.ClassName]);
end;

function TCustomBindGridLink.TryGetBindListEditor(out AEditor: IBindListEditor): Boolean;
var
  LEditor: IInterface;
begin
  AEditor := nil;
  if (ControlComponent <> nil) and Supports(GetBindEditor(ControlComponent, IBindListEditor), IBindListEditor, LEditor) then
    AEditor := LEditor as IBindListEditor;
  Result := AEditor <> nil;
end;

function TCustomBindGridLink.GetScopeRecordEnumerator: IScopeRecordEnumerator;
var
  LIntf: IScopeRecordEnumerable;
begin
  if Supports(SourceComponent, IScopeRecordEnumerable, LIntf) then
    Result := LIntf.GetEnumerator('', FBufferCount)
  else
    Result := nil;
end;

function TCustomBindGridLink.GetScopeCurrentRecord(AColumnExpressionItem: TColumnLinkExpressionItem): IScope;
var
  LIntf: IScopeCurrentRecord;
begin
  if Supports(SourceComponent, IScopeCurrentRecord, LIntf) then
    Result := LIntf.GetCurrentRecord(AColumnExpressionItem.SourceMemberName)
  else
    Result := nil;
end;



procedure TCustomBindGridLink.FillGrid;
  function HaveFormatCellExpressions:  Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to FColumnExpressions.Count - 1 do
    begin
      if FColumnExpressions[I].FormatCellExpressions.Count > 0 then
        Exit(True);
    end;
  end;
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
begin
  Inc(FLockPosControl);
  try
    LEditor := GetBindListEditor;
    if LEditor <> nil then
    begin
      EvaluateFormatControl;
      FormatColumns;
      if HaveFormatCellExpressions then
      begin
        LEnumerator := GetScopeRecordEnumerator;
        if LEnumerator <> nil then
        begin
          LEditor.FillList(LEnumerator,
            procedure(const ASourceScope, AEditorScope: IScope)
            begin
              Assert(AEditorScope <> nil);
              FillRecord(AEditorScope,
                function(AColumnExpression: TColumnLinkExpressionItem): IScope
                begin
                  Result := LEnumerator.GetMemberCurrent(AColumnExpression.SourceMemberName);
                end);
            end);
        end
        else
          Assert(False);
      end
      else
        LEditor.ClearList;
    end;
  finally
    Dec(FLockPosControl);
  end;
end;

procedure TCustomBindGridLink.FormatColumns;
var
  LExpression: TExpressionItem;
  LColumnExpressionItem: TColumnLinkExpressionItem;
  I: Integer;
  LExpressions: TExpressions;
  LEditorScope: IScope;
begin
  for I := 0 to FColumnExpressions.Count - 1 do
  begin
    LColumnExpressionItem := FColumnExpressions[I];
    LEditorScope := GetComponentScope(Self.ControlComponent);
    if LColumnExpressionItem.FormatColumnExpressions.Count > 0 then
      LExpressions := LColumnExpressionItem.FormatColumnExpressions
    else
      LExpressions := nil;
    if LExpressions <> nil then
    begin
      for LExpression in LExpressions do
        EvaluateExpressions(LColumnExpressionItem,
           LEditorScope, LExpression.FControlExpression,
           GetComponentScope(SourceComponent, LColumnExpressionItem.SourceMemberName), LExpression.FSourceExpression
           );
    end;
  end;
end;



procedure TCustomBindGridLink.FillRecord(AEditorScope: IScope;
  AGetMemberScope: TFunc<TColumnLinkExpressionItem, IScope>);
var
  LExpression: TExpressionItem;
  LColumnExpressionItem: TColumnLinkExpressionItem;
  I: Integer;
  LExpressions: TExpressions;
begin
  if AEditorScope <> nil then
  begin
    for I := 0 to FColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := FColumnExpressions[I];
      if LColumnExpressionItem.FormatCellExpressions.Count > 0 then
        LExpressions := LColumnExpressionItem.FormatCellExpressions
      else
        LExpressions := nil;
      if LExpressions <> nil then
      begin
        for LExpression in LExpressions do
          EvaluateExpressionItem(LColumnExpressionItem, LExpression, AEditorScope,
           AGetMemberScope(LColumnExpressionItem));
      end;
    end;
  end;
end;

procedure TCustomBindGridLink.EvaluateExpressionItem(AColumnExpressionItem: TColumnLinkExpressionItem; AItem: TExpressionItem; AEditorScope: IScope;
  AEnumScope: IScope);
begin
  EvaluateExpressions(AColumnExpressionItem, AEditorScope, AItem.ControlExpression, AEnumScope, AItem.SourceExpression);
end;

procedure TCustomBindGridLink.EvaluateExpressions(AColumnExpressionItem: TColumnLinkExpressionItem; AEditorScope: IScope; const AEditorExpression: string;
  AEnumScope: IScope; const AEnumExpression: string);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetComponentScopes(AEnumScope),
    AEnumExpression,
    inherited GetComponentScopes(AEditorScope), //Output destination(s)
    AEditorExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
    []  // Execute
  );
  try
    LExpression.Evaluate;
  finally
    LExpression.Free;
  end;
end;

procedure TCustomBindGridLink.EvaluateFormat(const AMemberName: string);
var
  LEditor: IBindListEditor;
  LEditorScope: IScope;
  LScopeCurrentRecord: IScopeCurrentRecord;
begin
  if not Active then
    Exit;
  if FLockPosControl <> 0 then
    Exit;
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    Supports(SourceComponent, IScopeCurrentRecord, LScopeCurrentRecord);
    if LScopeCurrentRecord <> nil then
    begin
      LEditor.BeginUpdate;
      try
        LEditorScope := LEditor.CurrentItem;
        Assert(LEditorScope <> nil);
        if LEditorScope <> nil then
          FillRecord(LEditorScope,
            function(AItem: TColumnLinkExpressionItem): IScope
            begin
              Result := LScopeCurrentRecord.GetCurrentRecord(AItem.SourceMemberName);
            end);
      finally
        LEditor.EndUpdate;
      end;
    end
    else
      Assert(False);
  end
  else
    Assert(False);
end;

procedure TCustomBindGridLink.BeginUpdate;
begin
  Inc(FUpdateCounter);
end;

procedure TCustomBindGridLink.CheckEditingLink;
begin
  FControlObserver.Component := ControlComponent;
  FControlObserver.EnsureObserving(TControlObserver.IDEditGridLinkObserver,
    function: IObserver
    begin
      Result := TBindEditGridLinkObserver.Create(Self);
    end);
  FControlObserver.EnsureObserving(TControlObserver.IDPositionLinkObserver,
    function: IObserver
    begin
      Result := TBindPositionLinkObserver.Create(Self);
    end);
end;

procedure TCustomBindGridLink.ClearEditingLink;
begin
  FControlObserver.Component := nil;
end;

procedure TCustomBindGridLink.ClearGrid;
var
  LEditor: IBindListEditor;
begin
  LEditor := GetBindListEditor;
  LEditor.BeginUpdate;
  try
    LEditor.ClearList;
    EvaluateClearControl;
  finally
    LEditor.EndUpdate;
  end;
end;

procedure TCustomBindGridLink.EvaluateControlExpression(AColumnExpressionItem: TColumnLinkExpressionItem;
  const AExpression: string; ACallback: TProc<IValue>; AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LScope: IScope;
begin

  if AType = TBindCompExpressionType.exprFormatColumn then
  begin
                                      
    inherited EvaluateControlExpression(AExpression, ACallback, AType);
  end
  else
  begin
    LEditor := GetBindListEditor;
    LScope := LEditor.CurrentItem;
    if LScope = nil then
    begin
      if LEditor.MoveNext then
        LScope := LEditor.CurrentItem
      else
        LScope := LEditor.AddItem;
    end;
    if LScope <> nil then
    begin
      EvaluateControlExpression(LScope, AExpression, ACallback);
    end;
  end
end;

procedure TCustomBindGridLink.ExecuteAssignToControlExpression(AColumnExpressionItem: TColumnLinkExpressionItem;
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
  LEditorScope: IScope;
  LScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFormatColumn then
  begin
    LEditorScope := GetComponentScope(ControlComponent);
    LScope := GetComponentScope(SourceComponent, AColumnExpressionItem.SourceMemberName);
    EvaluateExpressions(AColumnExpressionItem, LEditorScope, AControlExpression, LScope, ASourceExpression);
  end
  else
  begin
    LEditor := GetBindListEditor;
    LEditor.BeginUpdate;
    try
      LEnumerator := GetScopeRecordEnumerator;
      if LEnumerator <> nil then
      begin
        if LEnumerator.MoveNext then
        begin
          LEditorScope := LEditor.AddItem;
          Assert(LEditorScope <> nil);
          if LEditorScope <> nil then
          begin
            EvaluateExpressions(AColumnExpressionItem, LEditorScope, AControlExpression, LEnumerator.Current, ASourceExpression);
          end;
        end;
      end
      else
        Assert(False);
    finally
      LEditor.EndUpdate;
    end;
  end

end;

procedure TCustomBindGridLink.EvaluateSourceExpression(AColumnExpressionItem: TColumnLinkExpressionItem;
  const AExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LEnumerator: IScopeRecordEnumerator;
  LEditorScope: IScope;
begin
  if AType = TBindCompExpressionType.exprFill then
  begin
    LEnumerator := GetScopeRecordEnumerator;
    if LEnumerator <> nil then
    begin
      if LEnumerator.MoveNext then
      begin
        EvaluateSourceExpression(
          LEnumerator.GetMemberCurrent(AColumnExpressionItem.SourceMemberName), AExpression,
          ACallback);
      end;
    end
  end
  else
  begin
    LEditorScope := GetScopeCurrentRecord(AColumnExpressionItem);
    if LEditorScope <> nil then
    begin
        EvaluateSourceExpression(
          LEditorScope, AExpression, ACallback);
    end
  end;
end;

procedure TCustomBindGridLink.EvaluateSourceExpression(
  AEnumScope: IScope; const AEnumExpression: string; ACallback: TProc<IValue>);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateExpression(
    inherited GetComponentScopes(AEnumScope),
    AEnumExpression,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

procedure TCustomBindGridLink.ExecuteAssignItemToSourceExpression(AColumnExpressionItem: TColumnLinkExpressionItem;
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
var
  LExpression: TBindingExpression;
begin
  LExpression := TBindings.CreateUnmanagedBinding(
    GetcontrolScopes(AColumnExpressionItem),
    AControlExpression,
    GetSourceScopes(AColumnExpressionItem),   //Output destination(s)
    ASourceExpression,
    GetOutputConverter,
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
    []  // Execute
  );
  try
    ACallback(LExpression.Evaluate);
  finally
    LExpression.Free;
  end;
end;

function TCustomBindGridLink.GetSourceScopes(AColumnExpressionItem: TColumnLinkExpressionItem): TArray<IScope>;
begin
  Result := inherited GetComponentScopes(SourceComponent, AColumnExpressionItem.SourceMemberName);
end;

function TCustomBindGridLink.GetUpdating: Boolean;
begin
  Result := FUpdateCounter > 0;
end;

function TCustomBindGridLink.IsRequired: Boolean;
var
  LScopeEditor: IScopeEditor;
begin
  Result := False;
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
  begin
    Result := LScopeEditor.IsRequired(SourceMemberName);
  end;
end;

procedure TCustomBindGridLink.SetIsReadOnly(Value: Boolean);
var
  LScopeEditLink: IScopeEditLink;
begin
  if Supports(SourceComponent, IScopeEditLink, LScopeEditLink) then
    LScopeEditLink.SetReadOnly(Self, Value);
end;

function TCustomBindGridLink.IsValidChar(AKey: Char): Boolean;
var
  LScopeEditor: IScopeEditor;
  LFieldName: string;
begin
  Result := True;
  LFieldName := UpdateColumnCurrent;
  if LFieldName = '' then
    raise TBindCompException.Create(sLinkFieldNotFound);
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
    Result := LScopeEditor.IsValidChar(LFieldName, AKey);
end;

function TCustomBindGridLink.GetControlScopes(AColumnExpressionItem: TColumnLinkExpressionItem): TArray<IScope>;
begin
                                  
  Result := inherited GetComponentScopes(ControlComponent);
end;

function TCustomBindGridLink.GetEditColumnIndex: Integer;
begin
  Result := FEditColumnIndex;
end;

function TCustomBindGridLink.GetEditColumnName: string;
begin
  Result := FEditColumnName;
end;

procedure TCustomBindGridLink.Loaded;
//var
////  LScopeExpressions: IScopeExpressions;
//  LScopeState: IScopeState;
begin
  try
    inherited;
//    if FDeferActive then
//    begin
//      FDeferActive := False;
//      SetActive(True);
//    end
//    else
    if CanActivate then
      LoadActivate;
  except
    // Don't raise exception when loading
  end;
end;

procedure TCustomBindGridLink.SetModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.SetModified(Self)
end;

function TCustomBindGridLink.GetIsModified: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetIsModified(Self)
  else
    Result := False;
end;

procedure TCustomBindGridLink.PosChanged;
begin
  if FUpdateCounter > 0 then
    Exit;
  Inc(FLockPosControl);
  try
    EvaluatePosSource;
  finally
    Dec(FLockPosControl);
  end;
end;

function TCustomBindGridLink.RequiresControlHandler: Boolean;
var
  LColumnExpressionItem: TColumnLinkExpressionItem;
  I: Integer;
begin
  if PosSourceExpressions.Count > 0 then
    Exit(True);
  for I := 0 to FColumnExpressions.Count - 1 do
  begin
    LColumnExpressionItem := FColumnExpressions[I];
    if LColumnExpressionItem.ParseCellExpressions.Count > 0 then
      Exit(True);
  end;
  Result := False;
end;

procedure TCustomBindGridLink.Reset;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.Reset(Self)
end;

procedure TCustomBindGridLink.FreeExpressionsObjects;
begin
  FreeExpressionObjects(FPosControlExpressionObjects);
  FreeExpressionObjects(FPosSourceExpressionObjects);
  FreeExpressionObjects(FFormatControlExpressionObjects);
  FreeExpressionObjects(FClearControlExpressionObjects);
  FreeAndNil(FControlExpressionObject);
end;

procedure TCustomBindGridLink.ResetColumns;
begin
  if Active then
  begin
    try
      FreeExpressionsObjects;
      //UpdateColumns;
      UpdateExpressions;
      Inc(FLockPosControl);
      try
        if AutoFill then
          FillGrid;
      finally
        Dec(FLockPosControl);
      end;
      EvaluatePosControl;
    except
    end;
  end
end;


procedure TCustomBindGridLink.ResetGrid;
var
  LExpression: TBindingExpression;
begin
  if Active then
  begin
    if AutoFill then
    begin
      BeginUpdate;
      try
        FillGrid;
      finally
        EndUpdate;
      end;
    end;
    //EvaluatePosControl;
    // Always position, even if FLockPosControl
    for LExpression in FPosControlExpressionObjects do
    begin
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.Evaluate;
    end;

  end;
end;

procedure TCustomBindGridLink.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      ClearModified;
      if Value then
        DoOnActivating
      else
        DoOnDeactivating;
      if not Designing then
        if Value and RequiresControlHandler then
        begin
          CheckEditingLink;
          if not FControlObserver.TrySetActive(True) then
            raise TBindCompException.CreateFmt(sNoControlObserverSupport, [Self.DisplayName, SafeClassName(ControlComponent)]);
        end;

      FActive := Value;
      if FActive then
      begin
        try
          FreeExpressionsObjects;
          //UpdateColumns;
          UpdateExpressions;
          if AutoFill then
            FillGrid;
          EvaluatePosControl;
          DoOnActivated;
        except
          FreeExpressionsObjects;
          FActive := False;
          raise;
        end;
      end
      else
      begin
        try
          if AutoFill then
            if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
              ClearGrid;
        finally
          FControlObserver.TrySetActive(False);
          FreeExpressionsObjects;
        end;
        DoOnDeactivated;
      end;
    end;
  end;
end;

procedure TCustomBindGridLink.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  Assert(FFormatControlExpressionObjects.Count = 0);
  Assert(FClearControlExpressionObjects.Count = 0);
  Assert(FPosSourceExpressionObjects.Count = 0);
  Assert(FPosControlExpressionObjects.Count = 0);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;

  for LExpressionItem in FPosControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FPosControlExpressionObjects.Add(LBindingExpression);
  end;

  for LExpressionItem in FFormatControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FFormatControlExpressionObjects.Add(LBindingExpression);
  end;

  for LExpressionItem in FClearControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FClearControlExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FPosSourceExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      inherited GetComponentScopes(SourceComponent),  // output
      LExpressionItem.SourceExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FPosSourceExpressionObjects.Add(LBindingExpression);
  end;

  FControlExpressionObject := TBindings.CreateExpression(
    inherited GetComponentScopes(ControlComponent), //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
end;

procedure TCustomBindGridLink.UpdateList;
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
begin
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin

    LEnumerator := GetScopeRecordEnumerator;
    if LEditor.UpdateNeeded(LEnumerator) then
    begin
      if LEnumerator <> nil then
      begin
        LEditor.UpdateList(LEnumerator,
          procedure(const ASourceScope, AEditorScope: IScope)
          begin
            Assert(AEditorScope <> nil);
            FillRecord(AEditorScope,
              function(AColumnExpression: TColumnLinkExpressionItem): IScope
              begin
                Result := LEnumerator.GetMemberCurrent(AColumnExpression.SourceMemberName);
              end);
          end);
      end
      else
        Assert(False);
    end
    else
    begin
      if LEditor.RowCount > 0 then
        EvaluateFormat('');
    end;
  end
  else
    Assert(False);
end;

procedure TCustomBindGridLink.UpdateRecord;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.UpdateRecord(Self)
end;

function TCustomBindGridLink.UpdateColumnCurrent: string;
var
  LItem: TCollectionItem;
  LEditGridLinkObserver: IEditGridLinkObserver;
begin
  Result := '';
  LEditGridLinkObserver := FControlObserver.EditGridLinkObserver;
  if Assigned(LEditGridLinkObserver) then
  begin
    FEditColumnCurrent := LEditGridLinkObserver.Current;
    case FEditColumnCurrent.VType of
      vtInteger:
        begin
          for LItem in ColumnExpressions do
          begin
            FEditColumnIndex := TColumnLinkExpressionItem(LItem).Index;
            if TColumnLinkExpressionItem(LItem).Index = FEditColumnCurrent.VInteger then
            begin
              Result := TColumnLinkExpressionItem(LItem).SourceMemberName;
              break;
            end;
          end;
        end
      else raise TBindCompException.Create(sLinkUnexpectedGridCurrentType);
    end;
  end;
end;

procedure TCustomBindGridLink.SetAutoFill(const Value: Boolean);
begin
  if FAutoFill <> Value then
  begin
    FAutoFill := Value;
//    if Active then
//      FillGrid
  end;
end;

procedure TCustomBindGridLink.UpdateControlChanging;
begin
  inherited;  // Set active false
  ClearEditingLink;
end;

procedure TCustomBindGridLink.SetClearControlExpressions(
  const Value: TExpressions);
begin
  FClearControlExpressions.Assign(Value);
end;

procedure TCustomBindGridLink.SetColumnExpressions(
  const Value: TColumnLinkExpressions);
begin
  FColumnExpressions.Assign(Value);
end;

procedure TCustomBindGridLink.SetEditColumn(const AName: string;
  AIndex: Integer);
//var
//  LItem: TCollectionItem;
//  LScopeEditLink: IScopeEditLink;
begin
//  if FEditColumnIndex <> AIndex then
//  begin
//    FEditColumnName := AName;
//    FEditColumnIndex := AIndex;
//    if AIndex > 0 then
//    begin
//      for LItem in ColumnExpressions do
//      begin
//        if TColumnLinkExpressionItem(LItem).ColumnIndex = (AIndex-1) then
//        begin
//          if FEditColumnName = '' then
//            FEditColumnName := TColumnLinkExpressionItem(LItem).SourceMemberName
//          else if FEditColumnName <> TColumnLinkExpressionItem(LItem).SourceMemberName then
//            raise Exception.Create('Mismatch column field names');
//          if Supports(SourceComponent, IScopeEditLink, LScopeEditLink) then
//            LScopeEditLink.SetField(Self, FEditColumnName);
//          Exit;
//        end;
//      end;
//    end;
//  end;
  FEditColumnIndex := AIndex;
end;

procedure TCustomBindGridLink.SetFormatControlExpressions(
  const Value: TExpressions);
begin
  FFormatControlExpressions.Assign(Value);
end;

procedure TCustomBindGridLink.SetPosControlExpressions(
  const Value: TExpressions);
begin
  FPosControlExpressions.Assign(Value);
end;

procedure TCustomBindGridLink.SetPosSourceExpressions(const Value: TExpressions);
begin
  FPosSourceExpressions.Assign(Value);
end;

function TCustomBindGridLink.Edit: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
  begin
    Result := Intf.Edit(Self)
  end
  else
    Result := True;
end;

procedure TCustomBindGridLink.EndUpdate;
begin
  Dec(FUpdateCounter);
  if FUpdateCounter < 0 then
    FUpdateCounter := 0;
end;

function TCustomBindGridLink.GetIsEditing: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
  begin
    Result := Intf.GetIsEditing(Self)
  end
  else
    Result := True;
end;

procedure TCustomBindGridLink.EvaluateClear(const AMemberName: string);
var
  LEditor: IBindListEditor;
begin
                       
  if Active then
  begin
    // Just like ClearGrid except don't clear the control
    LEditor := GetBindListEditor;
    LEditor.BeginUpdate;
    try
      LEditor.ClearList;
    finally
      LEditor.EndUpdate;
    end;
  end;
end;


{ TColumnFormatExpressionItem }

procedure TColumnFormatExpressionItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TColumnLinkExpressionItem then
  begin
    TColumnLinkExpressionItem(Dest).Name := Name;
    TColumnLinkExpressionItem(Dest).SourceMemberName := SourceMemberName;
    TColumnLinkExpressionItem(Dest).FormatCellExpressions := FormatCellExpressions;
    TColumnLinkExpressionItem(Dest).FormatColumnExpressions := FormatColumnExpressions;
    TColumnLinkExpressionItem(Dest).ColumnName := ColumnName;
    TColumnLinkExpressionItem(Dest).ColumnIndex := ColumnIndex;
  end
  else
    inherited;
end;

constructor TColumnFormatExpressionItem.Create(Collection: TCollection);
begin
  inherited;
  FColumnIndex := -1;
  FFormatCellExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatColumnExpressions := TExpressions.Create(Self, TExpressionItem);
end;

destructor TColumnFormatExpressionItem.Destroy;
begin
  FFormatCellExpressions.Free;
  FFormatColumnExpressions.Free;
  inherited;
end;

function TColumnFormatExpressionItem.GetColumnExpressions: TColumnFormatExpressions;
begin
  Result := TColumnFormatExpressions(Collection);
end;

function TColumnFormatExpressionItem.GetColumnIndex: Integer;
begin
  if FColumnIndex = -1 then
    Result := Index
  else
    Result := FColumnIndex;
end;

function TColumnFormatExpressionItem.GetDisplayName: string;
begin
  Result := Name;
  if Result = '' then
    Result := SourceMemberName;
end;

function TColumnFormatExpressionItem.GetName: string;
begin
  Result := FName;
end;

procedure TColumnFormatExpressionItem.SetColumnIndex(Value: Integer);
begin
  if Value = Index then
    FColumnIndex := -1
  else
    FColumnIndex := Value;
end;

procedure TColumnFormatExpressionItem.SetFormatCellExpressions(const Value: TExpressions);
begin
  FFormatCellExpressions.Assign(Value);
end;

procedure TColumnFormatExpressionItem.SetFormatColumnExpressions(const Value: TExpressions);
begin
  FFormatColumnExpressions.Assign(Value);
end;

procedure TColumnFormatExpressionItem.SetName(const Value: string);
begin
  FName := Value;
end;

{ TColumnLinkExpressionItem }

procedure TColumnLinkExpressionItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TColumnLinkExpressionItem then
  begin
    TColumnLinkExpressionItem(Dest).Name := Name;
    TColumnLinkExpressionItem(Dest).SourceMemberName := SourceMemberName;
    TColumnLinkExpressionItem(Dest).ParseCellExpressions := ParseCellExpressions;
    TColumnLinkExpressionItem(Dest).FormatCellExpressions := FormatCellExpressions;
    TColumnLinkExpressionItem(Dest).FormatColumnExpressions := FormatColumnExpressions;
    TColumnLinkExpressionItem(Dest).ColumnName := ColumnName;
    TColumnLinkExpressionItem(Dest).ColumnIndex := ColumnIndex;
  end
  else
    inherited;
end;

constructor TColumnLinkExpressionItem.Create(Collection: TCollection);
begin
  inherited;
  FColumnIndex := -1;
  FParseCellExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatCellExpressions := TExpressions.Create(Self, TExpressionItem);
  FFormatColumnExpressions := TExpressions.Create(Self, TExpressionItem);
end;

destructor TColumnLinkExpressionItem.Destroy;
begin
  FParseCellExpressions.Free;
  FFormatCellExpressions.Free;
  FFormatColumnExpressions.Free;
  inherited;
end;

function TColumnLinkExpressionItem.GetColumnExpressions: TColumnLinkExpressions;
begin
  Result := TColumnLinkExpressions(Collection);
end;

function TColumnLinkExpressionItem.GetColumnIndex: Integer;
begin
  if FColumnIndex = -1 then
    Result := Index
  else
    Result := FColumnIndex;
end;

function TColumnLinkExpressionItem.GetDisplayName: string;
begin
  Result := Name;
  if Result = '' then
    Result := SourceMemberName;
end;

function TColumnLinkExpressionItem.GetName: string;
begin
  Result := FName;
end;

procedure TColumnLinkExpressionItem.SetColumnIndex(Value: Integer);
begin
  if Value = Index then
    FColumnIndex := -1
  else
    FColumnIndex := Value;
end;

procedure TColumnLinkExpressionItem.SetFormatCellExpressions(const Value: TExpressions);
begin
  FFormatCellExpressions.Assign(Value);
end;

procedure TColumnLinkExpressionItem.SetFormatColumnExpressions(const Value: TExpressions);
begin
  FFormatColumnExpressions.Assign(Value);
end;

procedure TColumnLinkExpressionItem.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TColumnLinkExpressionItem.SetParseExpressions(const Value: TExpressions);
begin
  FParseCellExpressions.Assign(Value);
end;

procedure TColumnLinkExpressionItem.SetSourceMemberName(const Value: string);
begin
  FSourceMemberName := Value;
  if FColumnName = '' then
    FColumnName := FSourceMemberName;
end;

{ TColumnFormatExpressions }

function TColumnFormatExpressions.AddExpression: TColumnFormatExpressionItem;
begin
  Result := Add as TColumnFormatExpressionItem;
end;

function TColumnFormatExpressions.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := sNameAttr;
  else
    Result := ''; { do not localize }
  end;
end;

function TColumnFormatExpressions.GetAttrCount: Integer;
begin
  Result := 1;
end;

function TColumnFormatExpressions.GetItem(Index: Integer): TColumnFormatExpressionItem;
begin
  Result := TColumnFormatExpressionItem(inherited Items[Index]);
end;

function TColumnFormatExpressions.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: begin
         Result := Items[ItemIndex].Name;
         if Result = '' then Result := IntToStr(ItemIndex);
       end;
  else
    Result := '';
  end;
end;

procedure TColumnFormatExpressions.SetItem(Index: Integer; const Value: TColumnFormatExpressionItem);
begin
  inherited SetItem(Index, TCollectionItem(Value));

end;

                         

{ TColumnLinkExpressions }

function TColumnLinkExpressions.AddExpression: TColumnLinkExpressionItem;
begin
  Result := Add as TColumnLinkExpressionItem;
end;

function TColumnLinkExpressions.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := sNameAttr;
  else
    Result := ''; { do not localize }
  end;
end;

function TColumnLinkExpressions.GetAttrCount: Integer;
begin
  Result := 1; // 3;
end;

function TColumnLinkExpressions.GetItem(Index: Integer): TColumnLinkExpressionItem;
begin
  Result := TColumnLinkExpressionItem(inherited Items[Index]);
end;

function TColumnLinkExpressions.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: begin
         Result := Items[ItemIndex].Name;
         if Result = '' then Result := IntToStr(ItemIndex);
       end;
  else
    Result := '';
  end;
end;

procedure TColumnLinkExpressions.SetItem(Index: Integer; const Value: TColumnLinkExpressionItem);
begin
  inherited SetItem(Index, TCollectionItem(Value));

end;

{ TBindEventList1<T> }

procedure TBindEventList1<T>.Add(AEvent: TBindNotifyEvent1<T>);
begin
  InternalAdd(TNotifyEvent(AEvent));
end;

procedure TBindEventList1<T>.Remove(AEvent: TBindNotifyEvent1<T>);
begin
  InternalRemove(TNotifyEvent(AEvent));
end;

procedure TBindEventList1<T>.Send(Sender: TObject; const P: T);
var
  Handler: TNotifyEvent;
begin
  for Handler in FList do
    TBindNotifyEvent1<T>(Handler)(Sender, P);
end;

{ TBindEventList }

procedure TBindEventList.Add(AEvent: TNotifyEvent);
begin
  InternalAdd(AEvent);
end;

procedure TBindEventList.Remove(AEvent: TNotifyEvent);
begin
  InternalRemove(AEvent);
end;

procedure TBindEventList.Send(Sender: TObject);
var
  Handler: TNotifyEvent;
begin
  for Handler in FList do
    Handler(Sender);
end;

{ TBindComponentScope }

function TBindComponentScope.DoLookup(const Name: String): IInterface;
var
  Comp: TComponent;
begin
  Result := nil;
  if MappedObject is TComponent then
  begin
    Comp := TComponent(MappedObject);
    if Comp.FindComponent(Name) <> nil then
      Result := TCustomWrapper.Create(MappedObject, MetaClass, Name, cwtProperty,
        function (ParentObject: TObject; const MemberName: String; Args: TArray<TValue>): TValue
        begin
          // ParentObject points to the same object as MappedObject
          Result := TComponent(ParentObject).FindComponent(MemberName);
        end);
  end;
end;


{ TBindScopeComponentScope }

function TBindScopeComponentScope.DoLookup(const Name: String): IInterface;
var
  ScopeComp: TBaseBindScopeComponent;
begin
  Result := nil;
  if MappedObject is TBaseBindScopeComponent then
  begin
    ScopeComp := TBaseBindScopeComponent(MappedObject);
                                                     
    if ScopeComp.Owner <> nil then
      if ScopeComp.Owner.FindComponent(Name) <> nil then
      begin
        Result := TCustomWrapper.Create(ScopeComp.Owner, ScopeComp.Owner.ClassType, Name, cwtProperty,
          function (ParentObject: TObject; const MemberName: String; Args: TArray<TValue>): TValue
          begin
            Result := TComponent(ParentObject).FindComponent(MemberName);
          end);
      end;
  end;
  if Result = nil then
    Result := inherited;
end;

{ TCustomBindExpression }

function TCustomBindExpression.CanActivate: Boolean;
begin
  Result := inherited and (FControlExpression <> '') and
    (FSourceExpression <> '');
end;

constructor TCustomBindExpression.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TCustomBindExpression.Destroy;
begin
  FExpressionObject.Free;
  FReverseExpressionObject.Free;
  inherited;
end;

procedure TCustomBindExpression.UpdateExpressions;
var
  LControlScopes: TArray<IScope>;
  LSourceScopes: TArray<IScope>;
  OutputConverters: IValueRefConverter;
  LManager: TBindingManager;
  LOptions: TBindings.TCreateOptions;
begin
  Assert(FExpressionObject = nil);
  Assert(FReverseExpressionObject = nil);
  Assert(SourceComponent <> nil);

  LControlScopes := GetControlScopes;

  LSourceScopes := GetSourceScopes;

  OutputConverters := GetOutputConverter;

  if (not Designing) and Managed then
  begin
    // Participate in notifications

    if NotifyOutputs then
      LOptions := [TBindings.TCreateOption.coNotifyOutput]
    else
      LOPtions := [];
    if not Assigned(BindingsList) then
      LManager := nil
    else
      LManager := BindingsList.FBindingsManager;
    case Direction of
      dirSourceToControl:
        FExpressionObject := TBindings.CreateManagedBinding(
          LSourceScopes,
          FSourceExpression,
          LControlScopes,
          FControlExpression, //Output destination(s)
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          LManager,
          LOptions //do not evaluate here
        );
      dirControlToSource:
        FExpressionObject := TBindings.CreateManagedBinding(
          LControlScopes,
          FControlExpression,
          LSourceScopes,
          FSourceExpression,
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          LManager,
          LOptions //do not evaluate here
        );
      dirBidirectional:
      begin
        FExpressionObject := TBindings.CreateManagedBinding(
          LSourceScopes,
          FSourceExpression,
          LControlScopes,
          FControlExpression, //Output destination(s)
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          LManager,
          LOptions //do not evaluate here
        );
        FReverseExpressionObject := TBindings.CreateManagedBinding(
          LControlScopes,
          FControlExpression,
          LSourceScopes,
          FSourceExpression,
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          LManager,
          LOptions //do not evaluate here
        );
      end
    else
      Assert(False);
    end;
  end
  else
    case Direction of
      dirSourceToControl,
      dirBidirectional: // Same as SourceToControl if only one direction
        FExpressionObject := TBindings.CreateUnManagedBinding(
          LSourceScopes,
          FSourceExpression,
          LControlScopes,
          FControlExpression, //Output destination(s)
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          [] //do not evaluate here
        );
      dirControlToSource:
        FExpressionObject := TBindings.CreateUnManagedBinding(
          LControlScopes,
          FControlExpression,
          LSourceScopes,
          FSourceExpression,
          OutputConverters,
          TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
          [] //do not evaluate here
        );
    else
      Assert(False);
    end;

end;

procedure TCustomBindExpression.SetSourceExpression(const Value: string);
begin
  if FSourceExpression <> Value then
  begin
    Active := False;
    FSourceExpression := Value;
  end;
//  if FSourceExpression <> '' then
//  begin
//    if (not Loading) then
//    begin
//      if Enabled then
//      begin
//        UpdateEnabled;
//      end
//    end;
//  end;
end;

procedure TCustomBindExpression.SetControlExpression(const Value: string);
begin
  if FControlExpression <> Value then
  begin
    Active := False;
    FControlExpression := Value;
  end;
//  if FControlExpression <> '' then
//  begin
//    if (not Loading) then
//    begin
//      if Enabled then
//      begin
//        UpdateEnabled;
//      end
//    end;
//  end;
end;

procedure TCustomBindExpression.EvaluateFormat;
begin
  Evaluate;
end;

procedure TCustomBindExpression.EvaluateWithoutNotify;
var
  LControlScopes: TArray<IScope>;
  LSourceScopes: TArray<IScope>;
  OutputConverters: IValueRefConverter;
  LExpressionObject: TBindingExpression;
begin
  if Managed then
  begin
    LControlScopes := GetControlScopes;
    LSourceScopes := GetSourceScopes;
    OutputConverters := GetOutputConverter;
    LExpressionObject := nil;
    try
      case Direction of
        dirSourceToControl,
        dirBidirectional: 
          LExpressionObject := TBindings.CreateUnManagedBinding(
            LSourceScopes,
            FSourceExpression,
            LControlScopes,
            FControlExpression, //Output destination(s)
            OutputConverters,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            [] //do not evaluate here
          );
        dirControlToSource:
          LExpressionObject := TBindings.CreateUnManagedBinding(
            LControlScopes,
            FControlExpression,
            LSourceScopes,
            FSourceExpression,
            OutputConverters,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            [] //do not evaluate here
          );
      end;
      LExpressionObject.Evaluate;
    finally
      LExpressionObject.Free;
    end;
  end
  else
    if FExpressionObject.Compiled then  // In case binding manager has been destroyed
      FExpressionObject.Evaluate;

end;

procedure TCustomBindExpression.Evaluate;
begin
  if not Active then
    try
      FreeExpressionsObjects;
      UpdateExpressions;
      EvaluateWithoutNotify;
    finally
      FreeExpressionsObjects;
    end
  else
    EvaluateWithoutNotify;

end;

procedure TCustomBindExpression.FreeExpressionsObjects;
begin
  FreeAndNil(FExpressionObject);
  FreeAndNil(FReverseExpressionObject);
end;

procedure TCustomBindExpression.Recompile;
begin
  if FExpressionObject <> nil then
  begin
    if FExpressionObject.Compiled then  // In case binding manager has been destroyed
      FExpressionObject.ReCompile;
  end;

  if FReverseExpressionObject <> nil then
  begin
    if FReverseExpressionObject.Compiled then  // In case binding manager has been destroyed
      FReverseExpressionObject.ReCompile;
  end;

end;


{ TCustomBindExprItems }

constructor TCustomBindExprItems.Create(AOwner: TComponent);
begin
  inherited;
  FFormatExpressions := TExpressionsDir.Create(Self, TExpressionItemDir);
  FClearExpressions := TExpressionsDir.Create(Self, TExpressionItemDir);
  FFormatExpressionObjects := TList<TBindingExpression>.Create;
  FReverseFormatExpressionObjects := TList<TBindingExpression>.Create;
  FClearExpressionObjects := TList<TBindingExpression>.Create;

end;

destructor TCustomBindExprItems.Destroy;
begin
  FFormatExpressions.Free;
  FFormatExpressionObjects.Free;
  FReverseFormatExpressionObjects.Free;
  FClearExpressions.Free;
  FClearExpressionObjects.Free;
  inherited;
end;

procedure TCustomBindExprItems.UpdateExpressions;
var
  LExpressionItem: TExpressionItemDir;
  LBindingExpression: TBindingExpression;
  LManager: TBindingManager;
  LOptions: TBindings.TCreateOptions;
begin
  Assert(FFormatExpressionObjects.Count = 0);
  Assert(FReverseFormatExpressionObjects.Count = 0);
  Assert(FClearExpressionObjects.Count = 0);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;
  LBindingExpression := nil;

  for LExpressionItem in FFormatExpressions do
  begin
    if (not Designing) and Managed then
    begin
      if NotifyOutputs then
        LOptions := [TBindings.TCreateOption.coNotifyOutput]
      else
        LOPtions := [];
      if not Assigned(BindingsList) then
        LManager := nil
      else
        LManager := BindingsList.FBindingsManager;
      case LExpressionItem.Direction of
        dirBidirectional, dirSourceToControl:
        begin
          LBindingExpression := TBindings.CreateManagedBinding(
            inherited GetComponentScopes(SourceComponent),
            LExpressionItem.SourceExpression,
            inherited GetComponentScopes(ControlComponent),
            LExpressionItem.ControlExpression,
            GetOutputConverter,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            LManager,
            LOptions
          );
         FFormatExpressionObjects.Add(LBindingExpression);
        end;
        dirControlToSource:
        begin
          LBindingExpression := TBindings.CreateManagedBinding(
            inherited GetComponentScopes(ControlComponent),
            LExpressionItem.ControlExpression,
            inherited GetComponentScopes(SourceComponent),
            LExpressionItem.SourceExpression,
            GetOutputConverter,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            LManager,
            LOptions
          );
         FReverseFormatExpressionObjects.Add(LBindingExpression);
        end;
      else
        Assert(False);
      end;
      case LExpressionItem.Direction of
        dirBidirectional:
        begin
          LBindingExpression := TBindings.CreateManagedBinding(
            inherited GetComponentScopes(ControlComponent),
            LExpressionItem.ControlExpression,
            inherited GetComponentScopes(SourceComponent),
            LExpressionItem.SourceExpression,
            GetOutputConverter,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            LManager,
            LOptions
          );
          FReverseFormatExpressionObjects.Add(LBindingExpression);
        end;
      end;
    end
    else
    begin
      LBindingExpression := TBindings.CreateUnmanagedBinding(
        inherited GetComponentScopes(SourceComponent),
        LExpressionItem.SourceExpression,
        inherited GetComponentScopes(ControlComponent),
        LExpressionItem.ControlExpression,
        GetOutputConverter,
        TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
        []  // Execute
      );


      FFormatExpressionObjects.Add(LBindingExpression);
    end;
  end;

  for LExpressionItem in FClearExpressions do
  begin
       case LExpressionItem.Direction of
        dirSourceToControl,
        dirBidirectional:
          LBindingExpression := TBindings.CreateUnmanagedBinding(
            inherited GetComponentScopes(SourceComponent),
            LExpressionItem.SourceExpression,
            inherited GetComponentScopes(ControlComponent),
            LExpressionItem.ControlExpression,
            GetOutputConverter,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            []  // Execute
          );
        dirControlToSource:
          LBindingExpression := TBindings.CreateUnmanagedBinding(
            inherited GetComponentScopes(ControlComponent),
            LExpressionItem.ControlExpression,
            inherited GetComponentScopes(SourceComponent),
            LExpressionItem.SourceExpression,
            GetOutputConverter,
            TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
            []  // Execute
          );
       else
         Assert(False);
       end;

       FClearExpressionObjects.Add(LBindingExpression);

  end;

end;

procedure TCustomBindExprItems.SetClearExpressions(const Value: TExpressionsDir);
begin
  FClearExpressions.Assign(Value);
end;

procedure TCustomBindExprItems.SetFormatExpressions(Value: TExpressionsDir);
begin
  FFormatExpressions.Assign(Value);
end;

procedure TCustomBindExprItems.EvaluateWithoutNotify;
var
  LExpressionItem: TExpressionItemDir;
  LBindingExpression: TBindingExpression;
begin
  if Managed then
  begin
    for LExpressionItem in FFormatExpressions do
    begin
      case LExpressionItem.Direction of
        dirSourceToControl,
        dirBidirectional:
        begin
          LBindingExpression := TBindings.CreateUnmanagedBinding(
              inherited GetComponentScopes(SourceComponent),
              LExpressionItem.SourceExpression,
              inherited GetComponentScopes(ControlComponent),
              LExpressionItem.ControlExpression,
              GetOutputConverter,
              TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
              []  // Execute
            );
          try
            LBindingExpression.Evaluate;
          finally
            LBindingExpression.Free;
          end;
        end;
      end;
  end;
  end
  else
  begin
    if FFormatExpressionObjects <> nil then
      for LBindingExpression in FFormatExpressionObjects do
        if LBindingExpression.Compiled then  // In case binding manager has been destroyed
          LBindingExpression.Evaluate;
  end;

end;

procedure TCustomBindExprItems.EvaluateFormat;
begin
  if not Active then
  begin
    FreeExpressionsObjects;
    UpdateExpressions;
  end;
  try
    EvaluateWithoutNotify;
  finally
    if not Active then
      FreeExpressionsObjects;
  end;
end;

procedure TCustomBindExprItems.EvaluateClear;
var
  LExpression: TBindingExpression;
begin
  if not Active then
  begin
    FreeExpressionsObjects;
    UpdateExpressions;
  end;
  try
    if FClearExpressionObjects <> nil then
      for LExpression in FClearExpressionObjects do
        if LExpression.Compiled then  // In case binding manager has been destroyed
          LExpression.Evaluate;
  finally
    if not Active then
      FreeExpressionsObjects;
  end;
end;

procedure TCustomBindExprItems.FreeExpressionsObjects;
begin
  inherited FreeExpressionObjects(FFormatExpressionObjects);
  inherited FreeExpressionObjects(FReverseFormatExpressionObjects);
  inherited FreeExpressionObjects(FClearExpressionObjects);
end;

procedure TCustomBindExprItems.Recompile;
var
  LExpression: TBindingExpression;
begin
  if FFormatExpressionObjects <> nil then
    for LExpression in FFormatExpressionObjects do
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.ReCompile;
  if FReverseFormatExpressionObjects <> nil then
    for LExpression in FReverseFormatExpressionObjects do
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.ReCompile;
  if FClearExpressionObjects <> nil then
    for LExpression in FClearExpressionObjects do
      if LExpression.Compiled then  // In case binding manager has been destroyed
        LExpression.ReCompile;
end;

{ TCustomBindListLink }

constructor TCustomBindListLink.Create(AOwner: TComponent);
begin
  inherited;
  FControlObserver := TControlObserver.Create;
  FUpdateCounter := 0;
  FParseExpressions := TExpressions.Create(Self, TExpressionItem);
  FPosSourceExpressions := TExpressions.Create(Self, TExpressionItem);
  FPosControlExpressions := TExpressions.Create(Self, TExpressionItem);
  FParseExpressionObjects := TList<TBindingExpression>.Create;
  FPosControlExpressionObjects := TList<TBindingExpression>.Create;
  FPosSourceExpressionObjects := TList<TBindingExpression>.Create;
  FAutoFill := True;
  FBufferCount := -1;
end;

destructor TCustomBindListLink.Destroy;
begin
  SetActive(False);
  ClearEditingLink;
  FControlObserver.Free;
  FPosSourceExpressions.Free;
  FPosControlExpressions.Free;
  FParseExpressions.Free;
  inherited;
  FPosControlExpressionObjects.Free;
  FPosSourceExpressionObjects.Free;
  FParseExpressionObjects.Free;
end;

procedure TCustomBindListLink.EvaluatePosClear;
begin
  // No nothing.  Clear list will remove position
end;

procedure TCustomBindListLink.EvaluatePosSource;
var
  LExpression: TBindingExpression;
begin
  for LExpression in FPosSourceExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindListLink.ExecuteAssignToSourceExpression(
  const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
begin
  inherited;

end;

function TCustomBindListLink.GetCanModify: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetCanModify(Self)
  else
    Result := False;
end;

function TCustomBindListLink.GetActive: Boolean;
begin
  Result := FActive;
end;

function TCustomBindListLink.GetBindComp: TComponent;
begin
  Result := Self;
end;

function TCustomBindListLink.Edit: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
  begin
    Result := Intf.Edit(Self)
  end
  else
    Result := True;
end;

procedure TCustomBindListLink.BeginUpdate;
begin
  Inc(FUpdateCounter);
end;

procedure TCustomBindListLink.EndUpdate;
begin
  Dec(FUpdateCounter);
  if FUpdateCounter < 0 then
    FUpdateCounter := 0;
end;

procedure TCustomBindListLink.ClearEditingLink;
begin
  FControlObserver.Component := nil;
end;

procedure TCustomBindListLink.EvaluateClear(const AMemberName: string);
var
  LEditor: IBindListEditor;
begin
  if Active then
  begin
    // Just like clear list except don't clear control
    LEditor := GetBindListEditor;
    LEditor.BeginUpdate;
    try
      LEditor.ClearList;
    finally
      LEditor.EndUpdate;
    end;
  end;
end;

procedure TCustomBindListLink.EvaluateFormat(const AMemberName: string);
var
  LEditor: IBindListEditor;
  LEditorScope: IScope;
  LScopeCurrentRecord: IScopeCurrentRecord;
begin
  if not Active then
    Exit;
  if FLockPosControl <> 0 then
    Exit;
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin
    Supports(SourceComponent, IScopeCurrentRecord, LScopeCurrentRecord);
    if LScopeCurrentRecord <> nil then
    begin
      LEditor.BeginUpdate;
      try
        LEditorScope := LEditor.CurrentItem;
        //Assert(LEditorScope <> nil);
        if LEditorScope <> nil then
          FillRecord(LScopeCurrentRecord.GetCurrentRecord(SourceMemberName), LEditorScope);
      finally
        LEditor.EndUpdate;
      end;
    end
    else
      Assert(False);
  end
  else
    Assert(False);

end;

procedure TCustomBindListLink.FillRecord(const ASourceScope, AEditorScope: IScope);
var
  LExpression: TExpressionItem;
begin
  for LExpression in FFormatExpressions do
  begin
    EvaluateExpressionItem(LExpression, AEditorScope, ASourceScope);
  end;
end;

procedure TCustomBindListLink.EvaluateParse(const AMemberName: string);
var
  LExpression: TBindingExpression;
begin
  if not Active then
    Exit;
    for LExpression in FParseExpressionObjects do
    begin
      if LExpression.Compiled then
        LExpression.Evaluate;
    end;
end;

procedure TCustomBindListLink.EvaluatePosControl;
var
  LExpression: TBindingExpression;
begin
  if FLockPosControl <> 0 then
    Exit;
  for LExpression in FPosControlExpressionObjects do
  begin
    if LExpression.Compiled then  // In case binding manager has been destroyed
      LExpression.Evaluate;
  end;
end;

procedure TCustomBindListLink.FreeExpressionsObjects;
begin
  inherited;
  FreeExpressionObjects(FPosControlExpressionObjects);
  FreeExpressionObjects(FPosSourceExpressionObjects);
  FreeExpressionObjects(FParseExpressionObjects);
  FreeAndNil(FControlExpressionObject);
end;

function TCustomBindListLink.GetIsEditing: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
  begin
    Result := Intf.GetIsEditing(Self)
  end
  else
    Result := True;
end;

function TCustomBindListLink.GetIsModified: Boolean;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Result := Intf.GetIsModified(Self)
  else
    Result := False;
end;

function TCustomBindListLink.GetSourceMemberName: string;
begin
  Result := SourceMemberName;
end;

function TCustomBindListLink.GetUpdating: Boolean;
begin
  Result := FUpdateCounter > 0;
end;

function TCustomBindListLink.IsRequired: Boolean;
var
  LScopeEditor: IScopeEditor;
begin
  Result := False;
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
  begin
    Result := LScopeEditor.IsRequired(SourceMemberName);
  end;
end;

procedure TCustomBindListLink.SetIsReadOnly(Value: Boolean);
var
  LScopeEditLink: IScopeEditLink;
begin
  if Supports(SourceComponent, IScopeEditLink, LScopeEditLink) then
    LScopeEditLink.SetReadOnly(Self, Value);
end;

function TCustomBindListLink.IsValidChar(AKey: Char): Boolean;
var
  LScopeEditor: IScopeEditor;
  LFieldName: string;
begin
  Result := True;
  LFieldName := SourceMemberName;
  if LFieldName = '' then
    raise TBindCompException.Create(sLinkFieldNotFound);
  if Supports(SourceComponent, IScopeEditor, LScopeEditor) then
    Result := LScopeEditor.IsValidChar(LFieldName, AKey);
end;

procedure TCustomBindListLink.PosChanged;
begin
  Inc(FLockPosControl);
  try
    EvaluatePosSource;
  finally
    Dec(FLockPosControl);
  end;
end;

procedure TCustomBindListLink.Reset;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.Reset(Self)
end;

procedure TCustomBindListLink.ResetList;
begin
  if Active then
  begin
    if AutoFill then
      FillList;
    EvaluatePosControl;
  end;
end;

procedure TCustomBindListLink.ClearModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.ClearModified(Self);
end;

function TCustomBindListLink.RequiresControlHandler: Boolean;
begin
  if PosSourceExpressions.Count > 0 then
    Exit(True);
  if ParseExpressions.Count > 0 then
    Exit(True);
  Result := False;
end;

procedure TCustomBindListLink.CheckEditingLink;
begin
  FControlObserver.Component := ControlComponent;
  if ParseExpressions.Count > 0 then
    FControlObserver.EnsureObserving(TControlObserver.IDEditGridLinkObserver,
      function: IObserver
      begin
        Result := TBindEditGridLinkObserver.Create(Self);
      end);
  FControlObserver.EnsureObserving(TControlObserver.IDPositionLinkObserver,
    function: IObserver
    begin
      Result := TBindPositionLinkObserver.Create(Self);
    end);
end;

procedure TCustomBindListLink.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Loading then
    begin
      if not Designing then
        FDeferActive := Value
    end
    else
    begin
      ClearModified;
      if Value then
        DoOnActivating
      else
        DoOnDeactivating;
      if not Designing then
        if Value and RequiresControlHandler then
        begin
          CheckEditingLink;
          if not FControlObserver.TrySetActive(True) then
            raise TBindCompException.CreateFmt(sNoControlObserverSupport, [Self.DisplayName, SafeClassName(ControlComponent)]);
        end;

      FActive := Value;
      if FActive then
      begin
        try
          FreeExpressionsObjects;
          //UpdateColumns;
          UpdateExpressions;
          if AutoFill then
            FillList;
          EvaluatePosControl;
          DoOnActivated;
        except
          FreeExpressionsObjects;
          FActive := False;
          raise;
        end;
      end
      else
      begin
        try
          if AutoFill then
            if (ControlComponent <> nil) and
              (not (csDestroying in ControlComponent.ComponentState)) then
              ClearList;
        finally
          FControlObserver.TrySetActive(False);
          FreeExpressionsObjects;
        end;
        DoOnDeactivated;
      end;
    end;
  end;
end;

procedure TCustomBindListLink.SetModified;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.SetModified(Self)
end;

procedure TCustomBindListLink.SetParseExpressions(const Value: TExpressions);
begin
  FParseExpressions.Assign(Value);
end;

procedure TCustomBindListLink.SetPosControlExpressions(
  const Value: TExpressions);
begin
  FPosControlExpressions.Assign(Value);
end;

procedure TCustomBindListLink.SetPosSourceExpressions(
  const Value: TExpressions);
begin
  FPosSourceExpressions.Assign(Value);
end;

procedure TCustomBindListLink.UpdateExpressions;
var
  LExpressionItem: TExpressionItem;
  LBindingExpression: TBindingExpression;
begin
  inherited;
  Assert(FPosSourceExpressionObjects.Count = 0);
  Assert(FPosControlExpressionObjects.Count = 0);
  Assert(FParseExpressionObjects.Count = 0);

  if ControlComponent = nil then
    Exit;
  if SourceComponent = nil then
    Exit;

  for LExpressionItem in FPosControlExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(SourceComponent),
      LExpressionItem.SourceExpression,
      inherited GetComponentScopes(ControlComponent),
      LExpressionItem.ControlExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FPosControlExpressionObjects.Add(LBindingExpression);
  end;


  for LExpressionItem in FPosSourceExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      inherited GetComponentScopes(SourceComponent),  // output
      LExpressionItem.SourceExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FPosSourceExpressionObjects.Add(LBindingExpression);
  end;

  for LExpressionItem in FParseExpressions do
  begin
    LBindingExpression := TBindings.CreateUnmanagedBinding(
      inherited GetComponentScopes(ControlComponent), // input
      LExpressionItem.ControlExpression,
      inherited GetComponentScopes(SourceComponent, SourceMemberName),  // output
      LExpressionItem.SourceExpression,
      GetOutputConverter,
      TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue),
      []  // Execute
    );
    FParseExpressionObjects.Add(LBindingExpression);

  end;

  FControlExpressionObject := TBindings.CreateExpression(
    inherited GetComponentScopes(ControlComponent), //Input scopes
    'Self',
    TBindingEventRec.Create(DoOnEvalError, DoOnAssigningValue,  DoOnAssignedValue)
  );
end;

procedure TCustomBindListLink.UpdateList;
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
begin
  if FLockPosControl <> 0 then
    Exit;
  LEditor := GetBindListEditor;
  if LEditor <> nil then
  begin

    LEnumerator := GetScopeRecordEnumerator;
    if LEditor.UpdateNeeded(LEnumerator) then
    begin
      if LEnumerator <> nil then
      begin
        LEditor.UpdateList(LEnumerator,
          procedure(const ASourceScope, AEditorScope: IScope)
          begin
            FillRecord(ASourceScope, AEditorScope);
          end);
      end
      else
        Assert(False);
    end
    else
    begin
      if LEditor.RowCount > 0 then
        EvaluateFormat('');
    end;
  end
  else
    Assert(False);
end;

procedure TCustomBindListLink.UpdateRecord;
var
  Intf: IScopeEditLink;
begin
  if Supports(Sourcecomponent, IScopeEditLink, Intf) then
    Intf.UpdateRecord(Self)
end;

procedure TCustomBindListLink.UpdateControlChanging;
begin
  inherited;  // Set active false
  //FBindControlLinkHandler := nil;
  ClearEditingLink;
end;


{ TActivatedContainedBindComponent }

procedure TActivatedContainedBindComponent.BindActivate(Value: Boolean);
begin
  if Active <> Value then
  begin
    if Value then
    begin
      if GetAutoActivate and CanActivate and ((not Designing) or CanDesignActivate)then
        SetActive(True)
    end
    else
      SetActive(False)
  end;
end;

procedure TActivatedContainedBindComponent.LoadActivate;
begin
  ApplyComponents;
  // No Check for CanActivate
  if AutoActivate and ((not Designing) or CanDesignActivate) then
  begin
    if not ActivateFromSource then
      SetActive(True);
  end;
end;

function TActivatedContainedBindComponent.ActivateFromSource: Boolean;
var
  LScopeActive: IScopeActive;
begin
  Result := Supports(SourceComponent, IScopeActive, LScopeActive);
  if Result then
    SetActive(LScopeActive.Active);
end;

function TActivatedContainedBindComponent.CanActivate: Boolean;
begin
  Result := (SourceComponent <> nil) and (GetControlComponent <> nil);
end;

function TActivatedContainedBindComponent.CanDesignActivate: Boolean;
begin
  Result := False;
  // Work around for missing overrides to avoid changing
  // changing interface section in update
  if Self is TCustomBindGridLink then
    Result := True;
  if Self is TCustomBindListLink then
    Result := True;
  if Self is TCustomBindList then
    Result := True;
end;

constructor TActivatedContainedBindComponent.Create(AOwner: TComponent);
begin
  inherited;
  FAutoActivate := True;
end;

function TActivatedContainedBindComponent.GetAutoActivate: Boolean;
begin
  Result := FAutoActivate;
end;

procedure TActivatedContainedBindComponent.RemoveScopeExpressions;
var
  LScopeExpressions: IScopeExpressions;
begin
  if Supports(SourceComponent, IScopeExpressions, LScopeExpressions) then
    LScopeExpressions.RemoveExpression(Self);
end;

procedure TActivatedContainedBindComponent.SetAutoActivate(AValue: Boolean);
begin
  if FAutoActivate <> AValue then
  begin
    UpdateEnableChanging;
    FAutoActivate := AValue;
    UpdateEnableChanged;
  end;
end;

procedure TActivatedContainedBindComponent.DesignAutoActivateOnPropertyChange;
var
  LScopeActive: IScopeActive;
begin
  Supports(SourceComponent, IScopeActive, LScopeActive);
  if (LScopeActive = nil) or (LScopeActive.Active) then
    if (not Active) and (not Loading) and Designing and CanDesignActivate and AutoActivate then
      if CanActivate then
        SetActive(True);
end;

procedure TActivatedContainedBindComponent.UpdateSourceChanged;
begin
  inherited;
  if SourceComponent <> nil then
    AddScopeExpressions;
  if not Loading then
    ApplyComponents;
  DesignAutoActivateOnPropertyChange;
end;

procedure TActivatedContainedBindComponent.UpdateSourceChanging;
begin
  inherited;
  if SourceComponent <> nil then
    RemoveScopeExpressions;
  if GetActive then
    SetActive(False);
end;

procedure TActivatedContainedBindComponent.UpdateControlChanged;
begin
  inherited;
  if not Loading then
    ApplyComponents;
  DesignAutoActivateOnPropertyChange;
end;

procedure TActivatedContainedBindComponent.UpdateControlChanging;
begin
  inherited;
  if GetActive then
    SetActive(False);
end;

procedure TActivatedContainedBindComponent.UpdateSourceMemberChanged;
begin
  inherited;
  if not Loading then
    ApplyComponents;
  DesignAutoActivateOnPropertyChange;
end;

procedure TActivatedContainedBindComponent.UpdateSourceMemberChanging;
begin
  inherited;
  if GetActive then
    SetActive(False);
end;

procedure TActivatedContainedBindComponent.UpdateEnableChanging;
begin

end;

procedure TActivatedContainedBindComponent.UpdateEnableChanged;
begin
  if (not Loading) and  Designing and CanDesignActivate then
    SetActive(AutoActivate);
end;


procedure TActivatedContainedBindComponent.AddScopeExpressions;
var
  LScopeExpressions: IScopeExpressions;
begin
  if Supports(SourceComponent, IScopeExpressions, LScopeExpressions) then
    LScopeExpressions.AddExpression(Self);
end;

procedure TActivatedContainedBindComponent.ApplyComponents;
begin
//
end;

{ TMethods }

procedure TMethods.Update(Item: TCollectionItem);
begin
  if Owner is TCustomBindingsList then
    TCustomBindingsList(Owner).FMethodsScope := nil;
end;

{ TOutputConverters }

procedure TOutputConverters.Update(Item: TCollectionItem);
begin
  if Owner is TCustomBindingsList then
    TCustomBindingsList(Owner).FOutputConverter := nil;
end;


{ TEnumerableWrapper }

constructor TEnumerableWrapper.Create(AObject: TObject);
begin
  FObject := AObject;
  FRttiType := FContext.GetType(FObject.ClassType);
end;

destructor TEnumerableWrapper.Destroy;
begin
  FEnumerator.Free;
  inherited;
end;

procedure TEnumerableWrapper.First;
begin
  FreeAndNil(FEnumerator);
end;

function TEnumerableWrapper.GetEnumerator: TObject;
var
  LMethod: TRttiMethod;
  LArgs: TArray<TValue>;
  LValue: TValue;
begin
  if FEnumerator = nil then
  begin
    LMethod := FRttiType.GetMethod('GetEnumerator');
    if Assigned(LMethod) then
    begin
      LValue := LMethod.Invoke(FObject, LArgs);
      if LValue.IsObject then
        FEnumerator := LValue.AsObject
    end
    else
      FEnumerator := nil;
  end;
  Result := FEnumerator;
end;

function TEnumerableWrapper.GetCurrent: IScope;
var
  LEnumerator: TObject;
begin
  LEnumerator := GetEnumerator;
  if LEnumerator = nil then
    Exit(nil);
  Result := WrapObject(LEnumerator);
end;

function TEnumerableWrapper.GetMemberCurrent(const AMemberName: string): IScope;
begin
  Result := GetCurrent;
end;

function TEnumerableWrapper.GetRecordCount: Integer;
begin
  Result := 2;
end;

function TEnumerableWrapper.MoveNext: Boolean;
var
  LMethod: TRttiMethod;
  LArgs: TArray<TValue>;
  LValue: TValue;
  LRttiType: TRttiType;
  LEnumerator: TObject;
begin
  LEnumerator := GetEnumerator;
  if LEnumerator = nil then
    Exit(False);
  LRttiType := FContext.GetType(LEnumerator.ClassType);
  LMethod := LRttiType.GetMethod('MoveNext');
  if Assigned(LMethod) then
  begin
    LValue := LMethod.Invoke(LEnumerator, LArgs);
    if LValue.IsType<Boolean>  then
      Result := LValue.AsBoolean
    else
      Result := False;
  end
  else
    Result := False;
end;

{ TControlObservers }

function TControlObserver.EnsureObserving(const ID: Integer;
  AFunc: TFunc<IObserver>): Boolean;
begin
  Result := IsObserving(ID);
  if not Result then
  begin
    Result := AddObserver(ID, AFunc);
  end;
end;

function TControlObserver.GetEditGridLink: IEditGridLinkObserver;
begin
  Supports(GetObserver(IDEditGridLinkObserver), IEditGridLinkObserver, Result);
end;

function TControlObserver.GetEditLink: IEditLinkObserver;
begin
  Supports(GetObserver(IDEditLinkObserver), IEditLinkObserver, Result);
end;

function TControlObserver.GetPositionLinkObserver: IPositionLinkObserver;
begin
  Supports(GetObserver(IDPositionLinkObserver), IPositionLinkObserver, Result);
end;

function TControlObserver.GetObserver(const ID: Integer): IObserver;
begin
  if not FDictionary.TryGetValue(ID, Result) then
    Result := nil;
end;

function TControlObserver.IsObserving(const ID: Integer): Boolean;
begin
  Result := FDictionary.ContainsKey(ID);
end;

function TControlObserver.AddObserver(const ID: Integer;
  AFunc: TFunc<IObserver>): Boolean;
var
  LObservers: TObservers;
  LIntf: IObserver;
begin
  Result := False;
  if FComponent <> nil then
  begin
    LObservers := FComponent.Observers;
    if LObservers.CanObserve(ID) then
    begin
      LIntf := AFunc;  // Will be released if not added
      if LIntf <> nil then
      begin
        LObservers.AddObserver(ID, LIntf);
        Result := True;
        FDictionary.Add(ID, LIntf);
      end;
    end;
  end;
end;

procedure TControlObserver.RemoveObserver(const ID: Integer);
var
  LObservers: TObservers;
  LIntf: IObserver;
begin
  if FDictionary.TryGetValue(ID, LIntf) then
  try
    if (LIntf <> nil) and (FComponent <> nil) then
    begin
      LObservers := FComponent.Observers;
      LObservers.RemoveObserver(ID, LIntf);
    end;
  finally
    FDictionary.Remove(ID);
  end;
end;

procedure TControlObserver.SetComponent(const Value: TComponent);
begin
  if FComponent <> Value then
  begin
    Clear;
    FComponent := Value;
  end;
end;

function TControlObserver.TrySetActive(AValue: Boolean): Boolean;
var
  LPair: TPair<Integer, IObserver>;
begin
  Result := False;
  for LPair in FDictionary do
  begin
    if LPair.Value <> nil then
    begin
      LPair.Value.Active := AValue;
      Result := True;
    end;
  end;
end;

procedure TControlObserver.Clear;
begin
  RemoveObservers;
end;

procedure TControlObserver.RemoveObservers;
var
  LID: Integer;
begin
  try
    // Use toarray because RemoveObserver modifies FDictionary
    for LID in FDictionary.Keys.ToArray do
    begin
      RemoveObserver(LID);
    end;
  finally
    FDictionary.Clear;
  end;
end;

constructor TControlObserver.Create;
begin
  FDictionary := TDictionary<Integer, IObserver>.Create;
end;

destructor TControlObserver.Destroy;
begin
  Clear;
  FDictionary.Free;
  inherited;
end;

initialization
  FEditorFactories := TList<TBindEditorFactoryClass>.Create;
  // Custom scopes to support lookup using component names.
  TBindingScopeFactory.RegisterScope(TComponent, TBindComponentScope);
  TBindingScopeFactory.RegisterScope(TBaseBindScopeComponent, TBindScopeComponentScope);

finalization
  TBindingScopeFactory.UnRegisterScope(TBindComponentScope);
  TBindingScopeFactory.UnRegisterScope(TBindScopeComponentScope);
  FEditorFactories.Free;
end.

