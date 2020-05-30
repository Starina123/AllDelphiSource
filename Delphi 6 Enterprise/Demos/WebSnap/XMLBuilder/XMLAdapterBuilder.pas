unit XMLAdapterBuilder;

interface

uses
  Windows, Messages, SysUtils, Classes, WebComp, MidComp, SiteComp, WebForm, WebAdapt,
  MidItems, HTTPProd, HTTPApp, XMLBuilderComp;

type

  IXMLFormChild = interface
  ['{5BF420E7-C297-409E-B75D-EACCC4FBA6CC}']
  end;

  IXMLFieldGroupChild = interface
  ['{D47A1244-B8B3-42E8-97A8-DCACA3E063A9}']
  end;

  IXMLGridChild = interface
  ['{FFF92143-27FF-424C-953B-C84302257EDF}']
  end;

  IXMLCommandGroupChild = interface
  ['{BE7CB714-7FAB-4551-A80F-F0E76DB3D54E}']
  end;

  IXMLCommandColumnChild = interface
  ['{EAF3F7A5-6EB9-444A-B4B9-53D47CBC7B4A}']
  end;

  IXMLGroup = interface
    ['{B120D4B2-4A51-4B6F-8263-2490125975F0}']
  end;

  IXMLAdapterTypeGroup = interface
    ['{8357D226-AE1B-4651-AFF1-C6C129E9DFD6}']
    function GetAdapter: TComponent;
    property Adapter: TComponent read GetAdapter;
  end;

  TGetItemsListEvent = procedure(ASender: TObject; AList: TStrings) of object;

  TXMLPageHeadingElements = class;

  TPageHeadingOption = (hoApplicationTitle, hoCurrentPage, hoPublishedPages, hoLoginActions, hoEndUserName);
  TPageHeadingOptions = set of TPageHeadingOption;

  TCustomAdapterXMLBuilder = class(TCustomXMLBuilder)
  private
    FPageHeadingElements: TXMLPageHeadingElements;
    function GetPageHeadingOptions: TPageHeadingOptions;
    procedure SetPageHeadingOptions(const Value: TPageHeadingOptions);
  protected
    procedure WriteDataSection(XMLWriter: IXMLWriter); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TagName;
    property WebPageItems;
    property XSLTemplate;
    property PageHeadingOptions: TPageHeadingOptions read GetPageHeadingOptions write SetPageHeadingOptions
      default [hoApplicationTitle, hoCurrentPage, hoPublishedPages, hoLoginActions, hoEndUserName];
  end;

  TAdapterXMLBuilder = class(TCustomAdapterXMLBuilder)
  published
    property TagName;
    property WebPageItems;
    property XSLTemplate;
    property PageHeadingOptions;
  end;

  // Copied from WebForm with virtual function added
  TAbstractAdapterListHelper = class(TObject)
  private
    FComponent: TComponent;
    FHelper: TWebContainerComponentHelper;
    FAddDefaultItems: Boolean;
    FOnGetItemsList: TGetItemsListEvent;
    procedure CreateDefaultItems;
    procedure GetItemsList(List: TStrings);
    function GetVisibleItems: TWebComponentList;
    function IsItemInUse(const AName: string): Boolean;
    procedure SetAddDefaultItems(const Value: Boolean);
  protected
    function GetItemClass(AWebComponent: TComponent): TComponentClass; virtual; abstract;
    { IWebActionsList }
    function GetVisibleActions: TWebComponentList;
    procedure GetActionsList(List: TStrings);
    function FindAction(const AName: string): TComponent;
    function IsActionInUse(const AName: string): Boolean;
    { IWebDataFields }
    function GetVisibleFields: TWebComponentList;
    procedure GetFieldsList(List: TStrings);
    function FindField(const AName: string): TComponent;
    function IsFieldInUse(const AName: string): Boolean;
  public
    constructor Create(AComponent: TComponent;
      AHelper: TWebContainerComponentHelper);
    property OnGetItemsList: TGetItemsListEvent read FOnGetItemsList write FOnGetItemsList;
    property AddDefaultItems: Boolean read FAddDefaultItems write SetAddDefaultItems;
  end;

  TXMLAdapterListHelper = class(TAbstractAdapterListHelper)
  protected
    function GetItemClass(AWebComponent: TComponent): TComponentClass; override;
  end;

  TAbstractXMLGroup = class(TWebContainedContainerComponent,
    IWebComponentEditor,
    IWriteXMLData)
  private
    procedure WebComponentsChange(Sender: TObject);
    function GetTagName: WideString; virtual; abstract;
  protected
    { IWebComponentEditor }
    function CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; virtual;
    { IWriteXMLData}
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); virtual;
  public
    { Public declarations }
    property TagName: WideString read GetTagName;
    constructor Create(AOwner: TComponent); override;
  end;

  TCustomXMLForm = class(TAbstractXMLGroup, IXMLTopLevelChild)
  private
    FTagName: WideString;
    FFormMethod: TFormMethod;
  protected
    function GetTagName: WideString; override;
    { IWebComponentEditor }
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; override;
    { IWriteXMLData}
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); override;
  public
    constructor Create(AOwner: TComponent); override;
    property TagName: WideString read GetTagName write FTagName;
    property FormMethod: TFormMethod read FFormMethod write FFormMethod;
  end;

  TXMLForm = class(TCustomXMLForm)
  published
    property TagName;
    property FormMethod;
  end;

  TAbstractXMLTypeGroup = class(TWebContainedContainerComponent,
    IWebComponentEditor,
    IWriteXMLData, IAddFieldsEditor, INotifyAdapterChange,
    INotifyList)
  private
    FDefaultWebComponents:  TWebComponentList;
    FNotifyList: TNotifyList;
    procedure WebComponentsChange(Sender: TObject);
    function GetVisibleItems: TWebComponentList;
    procedure OnGetItemsList(ASender: TObject; AList: TStrings);
  protected
    FListHelper: TAbstractAdapterListHelper;
    procedure AdapterChange; virtual;
    procedure WriteDataSection(AXMLWriter: IXMLWriter); virtual;
    procedure WriteLayoutSection(AXMLWriter: IXMLWriter); virtual;
    procedure GetItemsList(List: TStrings); virtual;
    procedure CreateDefaultItems;
    function GetDefaultWebComponents: TWebComponentList; override;
    procedure SetDefaultWebComponents(AList: TWebComponentList); override;
    function GetTagName: WideString; virtual; abstract;
    function GetLayoutTagName: WideString; virtual; abstract;
    function GetDataTagName: WideString; virtual; abstract;
    { IAddFieldsEditor }
    function GetNewFieldPrefix: string;
    function GetAddFieldsItem: string;
    function GetAddAllFieldsItem: string;
    function GetAddFieldsDlgCaption: string;
    function ImplGetNewFieldPrefix: string; virtual;
    function ImplGetAddFieldsItem: string; virtual;
    function ImplGetAddAllFieldsItem: string;  virtual;
    function ImplGetAddFieldsDlgCaption: string; virtual;
    { IWebComponentEditor }
    function CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; virtual;
    { IWriteXMLData}
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); virtual;
    { INotifyAdapterChange }
    procedure NotifyAdapterChange(Sender: TComponent);
    { INotifyList }
    procedure AddNotify(ANotify: TObject);
    procedure RemoveNotify(ANotify: TObject);
  public
    { Public declarations }
    property TagName: WideString read GetTagName;
    property DataTagName: WideString read GetDataTagName;
    property LayoutTagName: WideString read GetLayoutTagName;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TAbstractXMLAdapterTypeGroup = class(TAbstractXMLTypeGroup,
    IXMLAdapterTypeGroup,
    IGetVariablesContainerOfDisplay, IGetDesigntimeWarnings, IGetAdapterModeOfDisplay)
  private
    FAdapter: TComponent;
    FAdapterMode: string;
    function GetAdapter: TComponent;
    procedure SetAdapter(const Value: TComponent);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ParentChanged; override;
    { IGetDesigntimeWarnings }
    procedure GetDesigntimeWarnings(AWarnings: TAbstractDesigntimeWarnings);
    { IGetVariablesContainerOfDisplay }
    function IGetVariablesContainerOfDisplay.GetVariablesContainer = GetAdapter;
    { IGetAdapterModeOfDisplay }
    function GetAdapterModeOfDisplay: string;
    function GetAdapterModeOfAdapter: string;
  public
    { Public declarations }
    destructor Destroy; override;
    property Adapter: TComponent read GetAdapter write SetAdapter;
    property AdapterMode: string read FAdapterMode write FAdapterMode;
  end;

  TAbstractXMLAdapterReferenceGroup = class(TWebContainedContainerComponent,
    IWebComponentEditor,
    IWriteXMLData, IAddFieldsEditor,
    INotifyAdapterChange, IGetVariablesContainerOfDisplay, IGetDesigntimeWarnings,
    IGetAdapterModeOfDisplay)
  private
    FWebDisplay: TWebDisplay;
    FDefaultWebComponents:  TWebComponentList;
    FAdapter: TComponent;
    procedure WebComponentsChange(Sender: TObject);
    function GetVisibleItems: TWebComponentList;
    function GetAdapter: TComponent;
    procedure OnGetItemsList(ASender: TObject; AList: TStrings);
    function GetXMLComponent: TComponent;
    procedure SetXMLComponent(const Value: TComponent);
  protected
    FListHelper: TAbstractAdapterListHelper;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure AdapterChange; virtual;
    procedure GetItemsList(List: TStrings); virtual;
    procedure CreateDefaultItems;
    procedure ReferenceChanged; virtual;
    procedure OnDisplayComponentChange(Sender: TObject);
    function GetDefaultWebComponents: TWebComponentList; override;
    procedure SetDefaultWebComponents(AList: TWebComponentList); override;
    function GetTagName: WideString; virtual; abstract;
    function GetLayoutTagName: WideString; virtual; abstract;
    function GetDataTagName: WideString; virtual; abstract;
    { IGetAdapterModeOfDisplay }
    function GetAdapterModeOfDisplay: string;
    function GetAdapterModeOfAdapter: string;
    { IGetDesigntimeWarnings }
    procedure GetDesigntimeWarnings(
      AWarnings: TAbstractDesigntimeWarnings);
    { IGetVariablesContainerOfDisplay }
    function IGetVariablesContainerOfDisplay.GetVariablesContainer = GetAdapter;
    { INotifyAdapterChange }
    procedure NotifyAdapterChange(Sender: TComponent);
    { IAddFieldsEditor }
    function GetNewFieldPrefix: string;
    function GetAddFieldsItem: string;
    function GetAddAllFieldsItem: string;
    function GetAddFieldsDlgCaption: string;
    function ImplGetNewFieldPrefix: string; virtual;
    function ImplGetAddFieldsItem: string; virtual;
    function ImplGetAddAllFieldsItem: string;  virtual;
    function ImplGetAddFieldsDlgCaption: string; virtual;
    { IWebComponentEditor }
    function CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; virtual;
    { IWriteXMLData}
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); virtual;
  public
    { Public declarations }
    property TagName: WideString read GetTagName;
    property DataTagName: WideString read GetDataTagName;
    property LayoutTagName: WideString read GetLayoutTagName;
    property XMLComponent: TComponent read GetXMLComponent write SetXMLComponent;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TCustomXMLCommandGroup = class(TAbstractXMLAdapterReferenceGroup, IWebActionsList, IXMLFormChild)
  private
    FTagName: WideString;
    FLayoutTagName: WideString;
    FDataTagName: WideString;
  protected
    property AdapterListHelper: TAbstractAdapterListHelper read FListHelper
      implements IWebActionsList;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; override;
    function ImplGetAddAllFieldsItem: string; override;
    function ImplGetAddFieldsDlgCaption: string; override;
    function ImplGetAddFieldsItem: string; override;
    function ImplGetNewFieldPrefix: string; override;
    procedure GetItemsList(List: TStrings); override;
    function GetTagName: WideString; override;
    function GetLayoutTagName: WideString; override;
    function GetDataTagName: WideString; override;
    property TagName: WideString read GetTagName write FTagName;
    property DataTagName: WideString read GetDataTagName write FDataTagName;
    property LayoutTagName: WideString read GetLayoutTagName write FLayoutTagName;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TXMLCommandGroup = class(TCustomXMLCommandGroup)
  published
    property XMLComponent;
    property TagName;
    property DataTagName;
    property LayoutTagName;
  end;

  TAbstractXMLAdapterFieldTypeGroup = class(TAbstractXMLAdapterTypeGroup, IWebDataFields)
  private
    FLayoutTagName: WideString;
    FDataTagName: WideString;
  protected
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); override;
    function GetLayoutTagName: WideString; override;
    function GetDataTagName: WideString; override;
    function ImplGetAddAllFieldsItem: string; override;
    function ImplGetAddFieldsDlgCaption: string; override;
    function ImplGetAddFieldsItem: string; override;
    function ImplGetNewFieldPrefix: string; override;
    procedure GetItemsList(List: TStrings); override;
    property AdapterListHelper: TAbstractAdapterListHelper read FListHelper
      implements IWebDataFields;
  public
    constructor Create(AOwner: TComponent); override;
    property DataTagName: WideString read GetDataTagName write FDataTagName;
    property LayoutTagName: WideString read GetLayoutTagName write FLayoutTagName;
  end;

  TAbstractXMLAdapterActionTypeGroup = class(TAbstractXMLAdapterTypeGroup, IWebActionsList)
  private
    FLayoutTagName: WideString;
    FDataTagName: WideString;
  protected
    function GetLayoutTagName: WideString; override;
    function GetDataTagName: WideString; override;
    function ImplGetAddAllFieldsItem: string; override;
    function ImplGetAddFieldsDlgCaption: string; override;
    function ImplGetAddFieldsItem: string; override;
    function ImplGetNewFieldPrefix: string; override;
    procedure GetItemsList(List: TStrings); override;
    property AdapterListHelper: TAbstractAdapterListHelper read FListHelper
      implements IWebActionsList;
  public
    constructor Create(AOwner: TComponent); override;
    property DataTagName: WideString read GetDataTagName write FDataTagName;
    property LayoutTagName: WideString read GetLayoutTagName write FLayoutTagName;
  end;

  TAbstractXMLActionTypeGroup = class(TAbstractXMLTypeGroup, IWebActionsList)
  protected
    function ImplGetAddAllFieldsItem: string; override;
    function ImplGetAddFieldsDlgCaption: string; override;
    function ImplGetAddFieldsItem: string; override;
    function ImplGetNewFieldPrefix: string; override;
    procedure GetItemsList(List: TStrings); override;
    property AdapterListHelper: TAbstractAdapterListHelper read FListHelper
      implements IWebActionsList;
  public
  end;

  TCustomXMLCommandColumn = class(TAbstractXMLActionTypeGroup, IWriteXMLLayout, IXMLGridChild)
  private
    FTagName: WideString;
    FCaption: string;
    FCaptionAlign: THTMLAlign;
    FCaptionVAlign: THTMLVAlign;
    FDisplayColumns: Integer;
    FAlign: THTMLAlign;
    FVAlign: THTMLVAlign;
    function GetCaption: string;
    procedure SetCaption(const Value: string);
  protected
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; override;
    function GetTagName: WideString; override;
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); override;
    { IWriteXMLLayout }
    procedure WriteXMLLayout(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    property TagName: WideString read GetTagName write FTagName;
    property Caption: string read GetCaption write SetCaption;
    property CaptionAlign: THTMLAlign read FCaptionAlign write FCaptionAlign;
    property CaptionVAlign: THTMLVAlign read FCaptionVAlign write FCaptionVAlign;
    property DisplayColumns: Integer read FDisplayColumns write FDisplayColumns default -1;
    property Align: THTMLAlign read FAlign write FAlign;
    property VAlign: THTMLVAlign read FVAlign write FVAlign;
  end;

  TXMLCommandColumn = class(TCustomXMLCommandColumn)
  published
    property TagName;
    property DataTagName;
    property LayoutTagName;
    property Caption;
    property CaptionAlign;
    property CaptionVAlign;
    property Align;
    property VAlign;
  end;

  TCustomXMLFieldGroup = class(TAbstractXMLAdapterFieldTypeGroup, IXMLFormChild)
  private
    FTagName: WideString;
  protected
    procedure WriteHiddenFields(AXMLWriter: IXMLWriter);
    function GetTagName: WideString; override;
    procedure WriteDataSection(AXMLWriter: IXMLWriter); override;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    property TagName: WideString read GetTagName write FTagName;
  end;

  TXMLFieldGroup = class(TCustomXMLFieldGroup)
  published
    property Adapter;
    property TagName;
    property DataTagName;
    property LayoutTagName;
    property AdapterMode;
  end;

  TCustomXMLGrid = class(TAbstractXMLAdapterFieldTypeGroup, IXMLFormChild)
  private
    FTagName: WideString;
    FRowTagName: WideString;
  protected
    function GetTagName: WideString; override;
    procedure WriteDataSection(AXMLWriter: IXMLWriter); override;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    property TagName: WideString read GetTagName write FTagName;
    property RowTagName: WideString read FRowTagName write FRowTagName;
  end;

  TXMLGrid = class(TCustomXMLGrid)
  published
    property Adapter;
    property TagName;
    property DataTagName;
    property LayoutTagName;
    property RowTagName;
    property AdapterMode;
  end;

  TCustomXMLAdapterErrors = class(TWebContainedComponent, IWriteXMLData, IXMLFormChild, IGetDesigntimeWarnings)
  private
    FTagName: WideString;
    FAdapter: TComponent;
    procedure SetAdapter(const Value: TComponent);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { IGetDesigntimeWarnings }
    procedure GetDesigntimeWarnings(AWarnings: TAbstractDesigntimeWarnings);
    { IWriteXMLData }
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLDAta(AXMLWriter: IXMLWriter); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property TagName: WideString read FTagName write FTagName;
    property Adapter: TComponent read FAdapter write SetAdapter;
  end;

  TXMLAdapterErrors = class(TCustomXMLAdapterErrors)
  published
    property TagName;
    property Adapter;
  end;

  TCustomXMLPageHeadingElements = class(TWebContainedComponent, IWriteXMLData, IXMLTopLevelChild, IScriptContext)
  private
    FTagName: WideString;
    FApplicationAdapter: Variant;
    FEndUserAdapter: Variant;
    FPage: Variant;
    FPages: Variant;
    FPageHeadingOptions: TPageHeadingOptions;
    FModuleContext: TComponent;
    function GetApplicationAdapter: Variant;
    function GetEndUserAdapter: Variant;
    function GetPages: Variant;
    function GetPage: Variant;
    procedure SetModuleContext(const Value: TComponent);
  protected
    procedure WriteApplicationAdapter(AXMLWriter: IXMLWriter);
    procedure WriteEndUserAdapter(AXMLWriter: IXMLWriter);
    procedure WritePage(AXMLWriter: IXMLWriter);
    procedure WritePages(AXMLWriter: IXMLWriter);
    procedure WritePageElement(AXMLWriter: IXMLWriter; APage: Variant);
    { IScriptContext }
    function GetWebModuleContext: TWebModuleContext;
    { IWriteXMLData }
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLDAta(AXMLWriter: IXMLWriter); virtual;
    property ApplicationAdapter: Variant read GetApplicationAdapter;
    property EndUserAdapter: Variant read GetEndUserAdapter;
    property Page: Variant read GetPage;
    property Pages: Variant read GetPages;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ModuleContext: TComponent read FModuleContext write SetModuleContext;
    property TagName: WideString read FTagName write FTagName;
    property PageHeadingOptions: TPageHeadingOptions read FPageHeadingOptions write FPageHeadingOptions
      default [hoApplicationTitle, hoCurrentPage, hoPublishedPages, hoLoginActions, hoEndUserName];
  end;

  TXMLPageHeadingElements = class(TCustomXMLPageHeadingElements)
  published
    property TagName;
    property PageHeadingOptions;
  end;

  TCustomXMLAdapterItem = class(TWebContainedComponent, IWriteXMLData,
    IWriteXMLLayout)
  private
    FTagName: WideString;
    FGroup: TComponent;
    function GetGroup: TComponent;
    function GetTagName: WideString;
    procedure SetTagName(const Value: WideString);
  protected
    function FindAssociatedVariable(const AName: string): TComponent;
    function DefaultTagName: WideString; virtual;
    property Group: TComponent read GetGroup;
    procedure ParentChanged; override;
    function GetAdapterModeOfAdapter: string;
    { IWriteXMLData }
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLDAta(AXMLWriter: IXMLWriter); virtual;
    { IWriteXMLLayout }
    procedure WriteXMLLayout(AXMLWriter: IXMLWriter);
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter); virtual;
  public
    { Public declarations }
    property TagName: WideString read GetTagName write SetTagName;
  end;

  TCustomXMLAdapterActionItem = class(TCustomXMLAdapterItem, IWebSetActionName, IWebGetActionName,
    IXMLCommandColumnChild, IXMLCommandGroupChild, IGetDesigntimeWarnings,
    IRestoreDefaults)
  private
    FActionName: string;
    FPageName: string;
    FErrorPageName: string;
    FHideOptions: TActionButtonHideOptions;
    FImageWidth: Integer;
    FDisplayColumns: Integer;
    FImageHeight: Integer;
    FDisplayType: TCommandHTMLElementType;
    FCaption: string;
    function GetCaption: string;
    procedure SetCaption(Value: string);
  protected
    procedure WriteArrayLayout(AXMLWriter: IXMLWriter;
      const ATagName: string; AAction, AArray: Variant);
    procedure WriteItemLayout(AXMLWriter: IXMLWriter; const ACaption: string; AAction: Variant);
    procedure WriteArrayData(AXMLWriter: IXMLWriter;
      const ATagName: string; AAction, AArray: Variant);
    procedure WriteItemData(AXMLWriter: IXMLWriter; AAction: Variant);
    function FindAssociatedAction: TComponent;
    function IsHidden(AAction: Variant): Boolean;
    function DefaultTagName: WideString; override;
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter); override;
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter); override;
    { IRestoreDefaults }
    procedure ImplRestoreDefaults; virtual;
    procedure RestoreDefaults;
    { IGetDesigntimeWarnings }
    procedure GetDesigntimeWarnings(AWarnings: TAbstractDesigntimeWarnings);
    { IWebSetActionName }
    procedure SetActionName(const AValue: string);
    { IWebGetActionName }
    function GetActionName: string;
  public
    constructor Create(AOwner: TComponent); override;
    property ActionName: string read GetActionName write SetActionName;
    property PageName: string read FPageName write FPageName;
    property ErrorPageName: string read FErrorPageName write FErrorPageName;
    property HideOptions: TActionButtonHideOptions read FHideOptions write FHideOptions
      default [bhoHideOnActionNotVisible];
    property DisplayType: TCommandHTMLElementType read FDisplayType write FDisplayType;
    property ImageWidth: Integer read FImageWidth write FImageWidth default -1;
    property ImageHeight: Integer read FImageHeight write FImageHeight default -1;
    property DisplayColumns: Integer read FDisplayColumns write FDisplayColumns default -1;
    property Caption: string read GetCaption write SetCaption;
  end;

  TXMLAdapterActionItem = class(TCustomXMLAdapterActionItem)
  published
    property ActionName;
    property PageName;
    property ErrorPageName;
    property HideOptions;
    property DisplayType;
    property ImageWidth;
    property ImageHeight;
    property DisplayColumns;
    property Caption;
  end;

  TBaseXMLAdapterFieldItem = class(TCustomXMLAdapterItem, IWebGetFieldName, IWebSetFieldName,
    IGetDesigntimeWarnings, IRestoreDefaults)
  private
    FCaption: string;
    FFieldName: string;
    FHideOptions: TDisplayFieldHideOptions;
    FDisplayWidth: Integer;
    FCaptionAlign: THTMLAlign;
    FCaptionVAlign: THTMLVAlign;
    function GetCaption: string;
    procedure SetCaption(Value: string);
  protected
    function IsHidden(AField: Variant): Boolean;
    procedure WriteValuesList(AXMLWriter: IXMLWriter; const ATagName: string; AField, AValuesList: Variant);
    procedure WriteValues(AXMLWriter: IXMLWriter; const ATagName: string; AValues: Variant);
    function DefaultTagName: WideString; override;
    procedure WriteImageData(AXMLWriter: IXMLWriter;
      const ATagName: string; AImage: Variant);
    procedure ImplWriteXMLData(AXMLWriter: IXMLWriter);  override;
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter);  override;
    function FindAssociatedField: TComponent;
    { IGetDesigntimeWarnings }
    procedure GetDesigntimeWarnings(AWarnings: TAbstractDesigntimeWarnings);
    { IWebSetFieldName }
    procedure SetFieldName(const AValue: string);
    { IWebGetFieldName }
    function GetFieldName: string;
    { IRestoreDefaults }
    procedure ImplRestoreDefaults; virtual;
    procedure RestoreDefaults;
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: string read GetFieldName write SetFieldName;
    property HideOptions: TDisplayFieldHideOptions read FHideOptions write FHideOptions
      default [hoHideOnFieldNotVisible];
    property Caption: string read GetCaption write SetCaption;
    property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
    property CaptionAlign: THTMLAlign read FCaptionAlign write FCaptionAlign;
    property CaptionVAlign: THTMLVAlign read FCaptionVAlign write FCaptionVAlign;
  end;

  TCustomXMLAdapterFieldItem = class(TBaseXMLAdapterFieldItem, IXMLFieldGroupChild)
  private
    FDisplayType: TDisplayFieldHTMLElementType;
    FViewMode: TDisplayFieldViewMode;
    FInputType: TInputFieldHTMLElementType;
    FDisplayRows: Integer;
    FSelectRows: Integer;
    FImageWidth: Integer;
    FDisplayColumns: Integer;
    FMaxLength: Integer;
    FImageHeight: Integer;
    FAlign: THTMLAlign;
    FVAlign: THTMLVAlign;
    FWrap: TTextAreaWrap;
    FCaptionPosition: TCaptionPosition;
  protected
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter); override;
  public
    constructor Create(AOwner: TComponent); override;
    property ViewMode: TDisplayFieldViewMode read FViewMode write FViewMode;
    property DisplayType: TDisplayFieldHTMLElementType read FDisplayType write FDisplayType;
    property InputType: TInputFieldHTMLElementType read FInputType write FInputType;
    property Align: THTMLAlign read FAlign write FAlign;
    property VAlign: THTMLVAlign read FVAlign write FVAlign;
    property ImageWidth: Integer read FImageWidth write FImageWidth default -1;
    property ImageHeight: Integer read FImageHeight write FImageHeight default -1;
    property SelectRows: Integer read FSelectRows write FSelectRows default 0;
    property MaxLength: Integer read FMaxLength write FMaxLength default -1;
    property TextAreaWrap: TTextAreaWrap read FWrap write FWrap;
    property DisplayRows: Integer read FDisplayRows write FDisplayRows default -1;
    property DisplayColumns: Integer read FDisplayColumns write FDisplayColumns default 1;
    property CaptionPosition: TCaptionPosition
      read FCaptionPosition write FCaptionPosition default capLeft;
  end;

  TXMLAdapterFieldItem = class(TCustomXMLAdapterFieldItem)
  published
    property FieldName;
    property ViewMode;
    property DisplayType;
    property InputType;
    property HideOptions;
    property Align;
    property VAlign;
    property ImageWidth;
    property ImageHeight;
    property SelectRows;
    property MaxLength;
    property TextAreaWrap;
    property DisplayRows;
    property DisplayColumns;
    property Caption;
    property DisplayWidth;
    property CaptionAlign;
    property CaptionVAlign;
    property CaptionPosition;
  end;

  TCustomXMLAdapterColumnItem = class(TBaseXMLAdapterFieldItem, IXMLGridChild)
  private
    FImageWidth: Integer;
    FImageHeight: Integer;
    FDisplayType: TColumnHTMLElementType;
    FAlign: THTMLAlign;
    FVAlign: THTMLVAlign;
  protected
    procedure ImplWriteXMLLayout(AXMLWriter: IXMLWriter); override;
  public
    constructor Create(AOwner: TComponent); override;
    property DisplayType: TColumnHTMLElementType read FDisplayType write FDisplayType;
    property Align: THTMLAlign read FAlign write FAlign;
    property VAlign: THTMLVAlign read FVAlign write FVAlign;
    property ImageWidth: Integer read FImageWidth write FImageWidth default -1;
    property ImageHeight: Integer read FImageHeight write FImageHeight default -1;
  end;

  TXMLAdapterColumnItem = class(TCustomXMLAdapterColumnItem)
  published
    property DisplayType;
    property Align;
    property VAlign;
    property ImageWidth;
    property ImageHeight;
    property FieldName;
    property HideOptions;
    property Caption;
    property DisplayWidth;
    property CaptionAlign;
    property CaptionVAlign;
  end;

  TCustomXMLAdapterEditColumnItem = class(TCustomXMLAdapterFieldItem, IXMLGridChild)
  end;

  TXMLAdapterEditColumnItem = class(TCustomXMLAdapterEditColumnItem)
  published
    property FieldName;
    property ViewMode;
    property DisplayType;
    property InputType;
    property HideOptions;
    property Align;
    property VAlign;
    property ImageWidth;
    property ImageHeight;
    property SelectRows;
    property MaxLength;
    property TextAreaWrap;
    property DisplayRows;
    property DisplayColumns;
    property Caption;
    property DisplayWidth;
    property CaptionAlign;
    property CaptionVAlign;
  end;

const
  HTMLAlign: array[THTMLAlign] of string =
    ('',
     'left',
     'right',
     'center');
  HTMLVAlign: array[THTMLVAlign] of string =
    ('',
     'top',
     'middle',
     'bottom',
     'baseline');

implementation

uses XMLBuilderWriter, ActiveX, Variants, WebCntxt, WebScript;

const

  // Tag Names
  sAdapterGroup =  WideString('AdapterGroup');
  sData = WideString('Data');
  sLayout = WideString('Layout');
  sCommandColumn = WideString('CommandColumn');
  sGrid = WideString('Grid');
  sRow = WideString('Row');
  sCommandGroup = WideString('CommandGroup');
  sForm = WideString('Form');
  sHiddenFields = WideString('HiddenFields');
  sHiddenRecordFields = WideString('HiddenRecordFields');
  sFieldGroup = WideString('FieldGroup');
  sAction = WideString('Action');
  sField = WideString('Field');
  sActionsGroup = WideString('ActionsGroup');
  sErrors = WideString('Errors');
  sError = WideString('Error');
  sArray = WideString('Array');
  sApplicationInfo = WideString('ApplicationInfo');
  sMessage = WideString('Message');

function FindXMLAdapterTypeGroupInParent(AComponent: TComponent): TComponent;
var
  Intf: IUnknown;
begin
  AComponent := AComponent.GetParentComponent;
  while Assigned(AComponent) and
   (not Supports(IInterface(AComponent), IXMLAdapterTypeGroup, Intf)) do
   AComponent := AComponent.GetParentComponent;
  Result := AComponent;
end;

{ TAbstractXMLGroup }

constructor TAbstractXMLGroup.Create(AOwner: TComponent);
begin
  inherited;
  GetWebComponents.OnChange := WebComponentsChange;
end;

procedure TAbstractXMLGroup.WebComponentsChange(Sender: TObject);
begin
  // Do nothing for now
end;

procedure TAbstractXMLGroup.WriteXMLData(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLData(AXMLWriter);
end;

procedure TAbstractXMLGroup.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    ComponentListWriteXMLData(GetWebComponents, AXMLWriter);
  finally
    AXMLWriter.PopNode;
  end;
end;

function TAbstractXMLGroup.CanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := ImplCanAddClass(AParent, AClass);
end;

function TAbstractXMLGroup.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := False;
end;

{ TAbstractXMLTypeGroup }

constructor TAbstractXMLTypeGroup.Create(AOwner: TComponent);
begin
  inherited;
  GetWebComponents.OnChange := WebComponentsChange;
  FNotifyList := TNotifyList.Create;
  FListHelper := TXMLAdapterListHelper.Create(Self, WebContainerComponentHelper);
  FListHelper.OnGetItemsList := OnGetItemsList;
end;

procedure TAbstractXMLTypeGroup.OnGetItemsList(ASender: TObject; AList: TStrings);
begin
  GetItemsList(AList);
end;

destructor TAbstractXMLTypeGroup.Destroy;
begin
  FListHelper.Free;
  FNotifyList.Free;
  inherited;
end;

procedure TAbstractXMLTypeGroup.WebComponentsChange(Sender: TObject);
begin
  // Do nothing for now
end;

function TAbstractXMLTypeGroup.GetVisibleItems: TWebComponentList;
begin
  if (GetWebComponents.Count > 0) then
    Result := GetWebComponents
  else
  begin
    if GetDefaultWebComponents = nil then
      CreateDefaultItems;
    Result := GetDefaultWebComponents;
  end;
end;

procedure TAbstractXMLTypeGroup.CreateDefaultItems;
begin
  //CreateDefaultFields;
  FListHelper.CreateDefaultItems;
end;

procedure TAbstractXMLTypeGroup.WriteXMLData(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLData(AXMLWriter);
end;

procedure TAbstractXMLTypeGroup.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(LayoutTagName);
      WriteLayoutSection(AXMLWriter);
    finally
      AXMLWriter.PopNode;
    end;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(DataTagName);
      WriteDataSection(AXMLWriter);
    finally
      AXMLWriter.PopNode;
    end;
  finally
    AXMLWriter.PopNode;
  end;
end;

procedure TAbstractXMLTypeGroup.WriteLayoutSection(AXMLWriter: IXMLWriter);
begin
  ComponentListWriteXMLLayout(GetVisibleItems, AXMLWriter);
end;

procedure TAbstractXMLTypeGroup.WriteDataSection(AXMLWriter: IXMLWriter);
begin
  ComponentListWriteXMLData(GetVisibleItems, AXMLWriter);
end;

function TAbstractXMLTypeGroup.GetDefaultWebComponents: TWebComponentList;
begin
  Result := FDefaultWebComponents;
end;

procedure TAbstractXMLTypeGroup.SetDefaultWebComponents(
  AList: TWebComponentList);
begin
  FDefaultWebComponents := AList;
end;

function TAbstractXMLTypeGroup.CanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := ImplCanAddClass(AParent, AClass);
end;

function TAbstractXMLTypeGroup.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := False;
end;

procedure TAbstractXMLTypeGroup.GetItemsList(List: TStrings);
begin
  Assert(False); // Descendent must implement
end;

function TAbstractXMLTypeGroup.GetAddAllFieldsItem: string;
begin
  Result := ImplGetAddAllFieldsItem;
end;

function TAbstractXMLTypeGroup.GetAddFieldsDlgCaption: string;
begin
  Result := ImplGetAddFieldsDlgCaption;
end;

function TAbstractXMLTypeGroup.GetAddFieldsItem: string;
begin
  Result := ImplGetAddFieldsItem;
end;

function TAbstractXMLTypeGroup.GetNewFieldPrefix: string;
begin
  Result := ImplGetNewFieldPrefix;
end;

function TAbstractXMLTypeGroup.ImplGetAddAllFieldsItem: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLTypeGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLTypeGroup.ImplGetAddFieldsItem: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLTypeGroup.ImplGetNewFieldPrefix: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

procedure TAbstractXMLTypeGroup.NotifyAdapterChange(
  Sender: TComponent);
begin
  AdapterChange;
end;

procedure TAbstractXMLTypeGroup.AdapterChange;
var
  I: Integer;
  AdapterChange: INotifyAdapterChange;
begin
  // Prevent the components from being freed during
  // the process of populating the default components
  if (GetDefaultWebComponents <> nil) then
  begin
    GetDefaultWebComponents.Free;
    SetDefaultWebComponents(nil);
  end;
  for I := 0 to FNotifyList.Count - 1 do
    if Supports(FNotifyList[I], INotifyAdapterChange, AdapterChange) then
      AdapterChange.NotifyAdapterChange(Self);
  for I := 0 to GetWebComponents.Count - 1 do
    if Supports(IUnknown(GetWebComponents.WebComponents[I]), INotifyAdapterChange, AdapterChange) then
      AdapterChange.NotifyAdapterChange(Self);
end;

procedure TAbstractXMLTypeGroup.AddNotify(ANotify: TObject);
begin
  FNotifyList.AddNotify(ANotify);
end;

procedure TAbstractXMLTypeGroup.RemoveNotify(ANotify: TObject);
begin
  FNotifyList.RemoveNotify(ANotify);
end;

{ TAbstractXMLAdapterTypeGroup }

destructor TAbstractXMLAdapterTypeGroup.Destroy;
var
  NotifyList: INotifyList;
begin
  if Supports(IInterface(FAdapter), INotifyList, NotifyList) then
    NotifyList.RemoveNotify(Self);
  inherited;
end;

procedure TAbstractXMLAdapterTypeGroup.ParentChanged;
var
  NotifyList: INotifyList;
begin
  inherited;
  if Supports(IInterface(FAdapter), INotifyList, NotifyList) then
    NotifyList.RemoveNotify(Self);
  FAdapter := nil;
end;

resourcestring
  sAdapterPropertyIsNil =  '%s: Adapter property is nil';
  sAdapterFieldNameIsBlank = '%s: Fieldname is blank';
  sCantFindAdapterField = '%0:s: Field %1:s not found in associated Adapter';
  sAdapterActionNameIsBlank = '%s: Action name is blank';
  sCantFindAdapterAction = '%0:s: Action %1:s not found in associated Adapter';

procedure TAbstractXMLAdapterTypeGroup.GetDesigntimeWarnings(
  AWarnings: TAbstractDesigntimeWarnings);
begin
  if Adapter = nil then
    AWarnings.AddString(Format(sAdapterPropertyIsNil, [Self.Name]))
  else
    AWarnings.AddObject(Adapter);
end;

function TAbstractXMLAdapterTypeGroup.GetAdapter: TComponent;
begin
  Result := FAdapter;
end;

procedure TAbstractXMLAdapterTypeGroup.SetAdapter(const Value: TComponent);
var
  NotifyList: INotifyList;
begin
  if FAdapter <> Value then
  begin
    if Value <> nil then
      Value.FreeNotification(Self);
    if FAdapter <> nil then
      if Supports(IInterface(FAdapter), INotifyList, NotifyList) then
        NotifyList.RemoveNotify(Self);
    FAdapter := Value;
    if Supports(IInterface(FAdapter), INotifyList, NotifyList) then
      NotifyList.AddNotify(Self);
    AdapterChange;
  end;
end;

procedure TAbstractXMLAdapterTypeGroup.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAdapter) then
    FAdapter := nil;
end;

{ TAbstractXMLAdapterReferenceGroup }

constructor TAbstractXMLAdapterReferenceGroup.Create(AOwner: TComponent);
begin
  inherited;
  FWebDisplay := TWebDisplay.Create(Self);
  FWebDisplay.OnChange := OnDisplayComponentChange;
  GetWebComponents.OnChange := WebComponentsChange;
  FListHelper := TXMLAdapterListHelper.Create(Self, WebContainerComponentHelper);
  FListHelper.OnGetItemsList := OnGetItemsList;
end;

procedure TAbstractXMLAdapterReferenceGroup.OnGetItemsList(ASender: TObject; AList: TStrings);
begin
  GetItemsList(AList);
end;

destructor TAbstractXMLAdapterReferenceGroup.Destroy;
var
  NotifyList: INotifyList;
begin
  inherited;
  FListHelper.Free;
  if Supports(IInterface(FWebDisplay.DisplayComponent), INotifyList, NotifyList) then
    NotifyList.RemoveNotify(Self);
  FWebDisplay.Free;
end;

procedure TAbstractXMLAdapterReferenceGroup.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Assigned(FWebDisplay) then
    FWebDisplay.Notification(AComponent, Operation);
end;

procedure TAbstractXMLAdapterReferenceGroup.WebComponentsChange(Sender: TObject);
begin
  // Do nothing for now
end;

function TAbstractXMLAdapterReferenceGroup.GetVisibleItems: TWebComponentList;
begin
  if (GetWebComponents.Count > 0) then
    Result := GetWebComponents
  else
  begin
    if GetDefaultWebComponents = nil then
      CreateDefaultItems;
    Result := GetDefaultWebComponents;
  end;
end;

procedure TAbstractXMLAdapterReferenceGroup.CreateDefaultItems;
begin
  //CreateDefaultFields;
  FListHelper.CreateDefaultItems;
end;

procedure TAbstractXMLAdapterReferenceGroup.WriteXMLData(
  AXMLWriter: IXMLWriter);
var
  AdapterModeIntf: IAdapterMode;
  SaveAdapterMode: string;
  Mode: string;
begin
  Mode := GetAdapterModeOfDisplay;
  if (Mode <> '') and Supports(IUnknown(GetAdapter), IAdapterMode, AdapterModeIntf) then
  begin
    SaveAdapterMode := AdapterModeIntf.AdapterMode;
    if SaveAdapterMode = '' then
      AdapterModeIntf.AdapterMode := Mode;
  end;
  try
    ImplWriteXMLData(AXMLWriter);
  finally
    if AdapterModeIntf <> nil then
      AdapterModeIntf.AdapterMode := SaveAdapterMode;
  end;
end;

procedure TAbstractXMLAdapterReferenceGroup.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(LayoutTagName);
      ComponentListWriteXMLLayout(GetVisibleItems, AXMLWriter);
    finally
      AXMLWriter.PopNode;
    end;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(DataTagName);
      ComponentListWriteXMLData(GetVisibleItems, AXMLWriter);
    finally
      AXMLWriter.PopNode;
    end;
  finally
    AXMLWriter.PopNode;
  end;
end;

function TAbstractXMLAdapterReferenceGroup.GetDefaultWebComponents: TWebComponentList;
begin
  Result := FDefaultWebComponents;
end;

procedure TAbstractXMLAdapterReferenceGroup.SetDefaultWebComponents(
  AList: TWebComponentList);
begin
  FDefaultWebComponents := AList;
end;

function TAbstractXMLAdapterReferenceGroup.CanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := ImplCanAddClass(AParent, AClass);
end;

function TAbstractXMLAdapterReferenceGroup.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := False;
end;

function TAbstractXMLAdapterReferenceGroup.GetAdapter: TComponent;
var
  XMLAdapterGroup: IXMLAdapterTypeGroup;
begin
  if FAdapter = nil then
  begin
    if Supports(IInterface(XMLComponent), IXMLAdapterTypeGroup, XMLAdapterGroup) then
      FAdapter := XMLAdapterGroup.Adapter;
  end;
  Result := FAdapter;
end;

procedure TAbstractXMLAdapterReferenceGroup.GetItemsList(List: TStrings);
begin
  Assert(False); // Descendent must implement
end;

function TAbstractXMLAdapterReferenceGroup.GetAddAllFieldsItem: string;
begin
  Result := ImplGetAddAllFieldsItem;
end;

function TAbstractXMLAdapterReferenceGroup.GetAddFieldsDlgCaption: string;
begin
  Result := ImplGetAddFieldsDlgCaption;
end;

function TAbstractXMLAdapterReferenceGroup.GetAddFieldsItem: string;
begin
  Result := ImplGetAddFieldsItem;
end;

function TAbstractXMLAdapterReferenceGroup.GetNewFieldPrefix: string;
begin
  Result := ImplGetNewFieldPrefix;
end;

function TAbstractXMLAdapterReferenceGroup.ImplGetAddAllFieldsItem: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLAdapterReferenceGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLAdapterReferenceGroup.ImplGetAddFieldsItem: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

function TAbstractXMLAdapterReferenceGroup.ImplGetNewFieldPrefix: string;
begin
  Assert(False);  // Must be implemented by descendent
end;

procedure TAbstractXMLAdapterReferenceGroup.NotifyAdapterChange(
  Sender: TComponent);
begin
  AdapterChange;
end;

procedure TAbstractXMLAdapterReferenceGroup.AdapterChange;
var
  I: Integer;
  AdapterChange: INotifyAdapterChange;
begin
  // Prevent the components from being freed during
  // the process of populating the default components
  if (GetDefaultWebComponents <> nil) then
  begin
    GetDefaultWebComponents.Free;
    SetDefaultWebComponents(nil);
  end;
  for I := 0 to GetWebComponents.Count - 1 do
    if Supports(IUnknown(GetWebComponents.WebComponents[I]), INotifyAdapterChange, AdapterChange) then
      AdapterChange.NotifyAdapterChange(Self);
end;


function TAbstractXMLAdapterReferenceGroup.GetXMLComponent: TComponent;
begin
  Result := FWebDisplay.DisplayComponent;
end;

procedure TAbstractXMLAdapterReferenceGroup.OnDisplayComponentChange(
  Sender: TObject);
begin
  ReferenceChanged;
end;

procedure TAbstractXMLAdapterReferenceGroup.ReferenceChanged;
begin
  AdapterChange;
end;

procedure TAbstractXMLAdapterReferenceGroup.SetXMLComponent(
  const Value: TComponent);
var
  NotifyList: INotifyList;
begin
  if Value <> XMLComponent then
  begin
    if Supports(IInterface(FWebDisplay.DisplayComponent), INotifyList, NotifyList) then
      NotifyList.RemoveNotify(Self);
    FWebDisplay.DisplayComponent := Value;
    if Supports(IInterface(FWebDisplay.DisplayComponent), INotifyList, NotifyList) then
      NotifyList.AddNotify(Self);
    // not needed because of notification function
    // AdapterChange;
  end;
end;


resourcestring
  sXMLComponentPropertyIsNil = '%s: XMLComponent property is nil';

procedure TAbstractXMLAdapterReferenceGroup.GetDesigntimeWarnings(
  AWarnings: TAbstractDesigntimeWarnings);
begin
  if XMLComponent = nil then
    AWarnings.AddString(Format(sXMLComponentPropertyIsNil, [Self.Name]))
  else
    AWarnings.AddObject(XMLComponent);
end;

{ TCustomXMLAdapterErrors }

procedure TCustomXMLAdapterErrors.ImplWriteXMLData(AXMLWriter: IXMLWriter);
var
  V: Variant;
  Temp: OleVariant;
  Fetched: LongWord;
  EnumVariant: IEnumVariant;
  GetScriptObject: IGetScriptObject;
begin
  if Supports(IInterface(Adapter), IGetScriptObject, GetScriptObject) then
  begin
    V := GetScriptObject.GetScriptObject;
    if (not VarIsClear(V.Errors)) and Supports(V.Errors.Get_NewEnum, IEnumVariant, EnumVariant) then
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(TagName);
        EnumVariant.Reset;
        while EnumVariant.Next(1, Temp, Fetched) = S_OK do
        begin
          AXMLWriter.PushNode;
          try
            AXMLWriter.AddNode(sError);
            AXMLWriter.WritePropertyValue(sMessage, Temp.Message);
          finally
            AXMLWriter.PopNode;
          end;
        end;
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;
end;

procedure TCustomXMLAdapterErrors.WriteXMLData(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLData(AXMLWriter);
end;

procedure TCustomXMLAdapterErrors.SetAdapter(const Value: TComponent);
begin
  if FAdapter <> Value then
  begin
    if Value <> nil then Value.FreeNotification(Self);
    FAdapter := Value;
  end;
end;

procedure TCustomXMLAdapterErrors.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAdapter) then
    FAdapter := nil;
end;

constructor TCustomXMLAdapterErrors.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sErrors;
end;

{ TCustomXMLAdapterItem }

procedure TCustomXMLAdapterItem.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  Assert(False); // Descendent must implement
end;

procedure TCustomXMLAdapterItem.WriteXMLData(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLData(AXMLWriter);
end;

function TCustomXMLAdapterItem.GetGroup: TComponent;
begin
  if FGroup = nil then
    FGroup := FindXMLAdapterTypeGroupInParent(Self);
  Result := FGroup;
end;

procedure TCustomXMLAdapterItem.ParentChanged;
begin
  inherited;
  FGroup := nil;
end;

function TCustomXMLAdapterItem.FindAssociatedVariable(const AName: string): TComponent;
var
  Intf: IWebVariablesContainer;
  C: TObject;
begin
  Result := nil;
  if AName <> '' then
  begin
    C := FindVariablesContainerInParent(Self);
    if Supports(C, IWebVariablesContainer, Intf) then
      Result := Intf.FindVariable(AName)
    else
      Assert(C=nil);
  end;
end;

function TCustomXMLAdapterItem.GetTagName: WideString;
begin
  if FTagName = '' then
    Result := DefaultTagName
  else
    Result := FTagName;
end;

procedure TCustomXMLAdapterItem.SetTagName(const Value: WideString);
begin
  if Value = DefaultTagName then
    FTagName := ''
  else
    FTagName := Value;
end;

function TCustomXMLAdapterItem.DefaultTagName: WideString;
begin
  Result := Name;
end;

procedure TCustomXMLAdapterItem.ImplWriteXMLLayout(
  AXMLWriter: IXMLWriter);
begin
  Assert(False); // Descendent must implement
end;

procedure TCustomXMLAdapterItem.WriteXMLLayout(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLLayout(AXMLWriter);
end;

{ TAbstractAdapterListHelper }

constructor TAbstractAdapterListHelper.Create(AComponent: TComponent;
      AHelper: TWebContainerComponentHelper);
begin
  FComponent := AComponent;
  Assert(FComponent <> nil);
  FHelper := AHelper;
  Assert(FHelper <> nil);
  inherited Create;
end;

function TAbstractAdapterListHelper.FindAction(
  const AName: string): TComponent;
var
  I: Integer;
  GetName: IWebGetActionName;
begin
  for I := 0 to FHelper.WebComponents.Count - 1 do
  begin
    if Supports(IInterface(FHelper.WebComponents.WebComponents[I]), IWebGetActionName, GetName) then
    begin
      Result := FHelper.WebComponents.WebComponents[I];
      if AnsiCompareText(GetName.ActionName, AName) = 0 then Exit;
    end;
  end;
  Result := nil;
end;

function TAbstractAdapterListHelper.FindField(
  const AName: string): TComponent;
var
  I: Integer;
  GetName: IWebGetFieldName;
begin
  for I := 0 to FHelper.WebComponents.Count - 1 do
  begin
    if Supports(IInterface(FHelper.WebComponents.WebComponents[I]), IWebGetFieldName, GetName) then
    begin
      Result := FHelper.WebComponents.WebComponents[I];
      if AnsiCompareText(GetName.FieldName, AName) = 0 then Exit;
    end;
  end;
  Result := nil;
end;

function TAbstractAdapterListHelper.GetVisibleItems: TWebComponentList;
begin
  if (FAddDefaultItems = False) or (FHelper.WebComponents.Count > 0) then
    Result := FHelper.WebComponents
  else
  begin
    if FHelper.DefaultWebComponents = nil then
      CreateDefaultItems;
    Result := FHelper.DefaultWebComponents;
  end;
end;

procedure TAbstractAdapterListHelper.GetItemsList(List: TStrings);
begin
  if Assigned(FOnGetItemsList) then
    FOnGetItemsList(Self, List)
  else
    Assert(False);
end;

procedure TAbstractAdapterListHelper.GetActionsList(List: TStrings);
var
  I: Integer;
  ItemClass: TComponentClass;
  WebComponent: TComponent;
  WebVariables: IWebVariablesContainer;
  GetName: IWebGetActionName;
  GetIntf: IGetAdapterActions;
  IsDefaultAction: IWebIsDefaultAction;
  C: TComponent;
begin
  C := FindVariablesContainer(FComponent);
  if not Supports(IUnknown(C), IGetAdapterActions, GetIntf) then
    Assert(C = nil);
  if Assigned(GetIntf) and
    Supports(GetIntf.GetAdapterActions, IWebVariablesContainer, WebVariables) then
    for I := 0 to WebVariables.VariableCount - 1 do
    begin
      WebComponent := WebVariables.Variables[I];
      if Supports(IUnknown(WebComponent), IWebGetActionName, GetName) then
        if (not Supports(IUnknown(WebComponent), IWebIsDefaultAction, IsDefaultAction)) or
          IsDefaultAction.IsDefaultAction(Self) then
      begin
        ItemClass := GetItemClass(WebComponent);
        if ItemClass <> nil then
          List.AddObject(GetName.GetActionName, TObject(ItemClass));
      end;
    end;
end;

procedure TAbstractAdapterListHelper.GetFieldsList(List: TStrings);
var
  I: Integer;
  ItemClass: TComponentClass;
  WebComponent: TComponent;
  WebVariables: IWebVariablesContainer;
  GetName: IWebGetFieldName;
  GetIntf: IGetAdapterFields;
  IsDefaultField: IWebIsDefaultField;
  C: TComponent;
begin
  C := FindVariablesContainer(FComponent);
  if not Supports(IUnknown(C), IGetAdapterFields, GetIntf) then
    Assert(C = nil);
  if Assigned(GetIntf) and
    Supports(GetIntf.GetAdapterFields, IWebVariablesContainer, WebVariables) then
    for I := 0 to WebVariables.VariableCount - 1 do
    begin
      WebComponent := WebVariables.Variables[I];
      if Supports(IUnknown(WebComponent), IWebGetFieldName, GetName) then
        if (not Supports(IUnknown(WebComponent), IWebIsDefaultField, IsDefaultField)) or
          IsDefaultField.IsDefaultField(Self) then
      begin
        ItemClass := GetItemClass(WebComponent);
        if ItemClass <> nil then
          List.AddObject(GetName.GetFieldName, TObject(ItemClass));
      end;
    end;
end;

function TAbstractAdapterListHelper.IsItemInUse(
  const AName: string): Boolean;
begin
  Result := (FindAction(AName) <> nil) or  (FindField(AName) <> nil);
end;

procedure TAbstractAdapterListHelper.CreateDefaultItems;
var
  WebComponent: IWebComponent;
  SetActionName: IWebSetActionName;
  SetFieldName: IWebSetFieldName;
  FieldControl: TComponent;
  FieldClass: TComponentClass;
  List: TStrings;
  I: integer;
  Components: TWebComponentList;
begin
  List := TStringList.Create;
  try
    GetItemsList(List);
    Assert(FHelper.DefaultWebComponents = nil);
    Components := TWebComponentList.Create(FComponent);
    Components.LockNotify;
    try
      FHelper.DefaultWebComponents := Components;
      for I := 0 to List.Count - 1 do
      begin
        if not IsItemInUse(List[I]) then
        begin
          FieldClass := TComponentClass(List.Objects[I]);
          FieldControl := FieldClass.Create(nil);  // not owned
          Supports(IInterface(FieldControl), IWebComponent, WebComponent);
          WebComponent.Container := FHelper.WebComponents;
          if Supports(IInterface(FieldControl), IWebSetActionName, SetActionName) then
             SetActionName.SetActionName(List[I])
          else if Supports(IInterface(FieldControl), IWebSetFieldName, SetFieldName) then
             SetFieldName.SetFieldName(List[I]);
        end;
      end;
    finally
      Components.UnlockNotify;
    end;
  finally
    List.Free;
  end;
end;

procedure TAbstractAdapterListHelper.SetAddDefaultItems(
  const Value: Boolean);
begin
  if Value <> FAddDefaultItems then
  begin
    FHelper.DefaultWebComponents.Free;
    FHelper.DefaultWebComponents := nil;
    FAddDefaultItems := Value;
  end;
end;

function TAbstractAdapterListHelper.GetVisibleActions: TWebComponentList;
begin
  Result := GetVisibleItems;
end;

function TAbstractAdapterListHelper.GetVisibleFields: TWebComponentList;
begin
  Result := GetVisibleItems;
end;

function TAbstractAdapterListHelper.IsActionInUse(
  const AName: string): Boolean;
begin
  Result := FindAction(AName) <> nil;
end;

function TAbstractAdapterListHelper.IsFieldInUse(
  const AName: string): Boolean;
begin
  Result := FindField(AName) <> nil;
end;

{ TXMLAdapterListHelper }

function TXMLAdapterListHelper.GetItemClass(
  AWebComponent: TComponent): TComponentClass;
var
  Intf: IUnknown;
  Editor: IWebComponentEditor;
begin
  Result := nil;
  if Supports(IInterface(AWebComponent), IAdapterFieldAttributes, Intf) then
    if Supports(IInterface(FComponent), IWebComponentEditor, Editor) then
      if Editor.CanAddClass(FComponent, TXMLAdapterFieldItem) then
        Result := TXMLAdapterFieldItem
      else if Editor.CanAddClass(FComponent, TXMLAdapterColumnItem) then
        Result := TXMLAdapterColumnItem
      else
        Assert(False)
    else
      Assert(False)
  else
  begin
    Assert(Supports(IInterface(AWebComponent), IAdapterActionAttributes, Intf));
    Result := TXMLAdapterActionItem;
  end;
end;

{ TCustomXMLAdapterActionItem }

function TCustomXMLAdapterActionItem.GetActionName: string;
begin
  Result := FActionName;
end;

function TCustomXMLAdapterActionItem.FindAssociatedAction: TComponent;
begin
  Result := FindAssociatedVariable(FActionName);
end;

procedure TCustomXMLAdapterActionItem.RestoreDefaults;
begin
  ImplRestoreDefaults;
end;

procedure TCustomXMLAdapterActionItem.ImplRestoreDefaults;
var
  Action: TComponent;
  WebGetDisplayLabel: IWebGetDisplayLabel;
begin
  inherited;
  Action := FindAssociatedAction;
  if Action <> nil then
  begin
    if Supports(IUnknown(Action), IWebGetDisplayLabel, WebGetDisplayLabel) then
      SetCaption(WebGetDisplayLabel.GetDisplayLabel);
  end;
end;

function TCustomXMLAdapterActionItem.GetCaption: string;
begin
  if FCaption = '' then
  begin
    Result := FActionName;
    if Result = '' then
      Result := Name;
  end
  else
    Result := FCaption;
end;

procedure TCustomXMLAdapterActionItem.SetCaption(Value: string);
begin
  if FActionName <> '' then
  begin
    if Value = FActionName then Value := ''
  end
  else
  begin
    if Value = Name then Value := ''
  end;
  FCaption := Value;
end;

function TCustomXMLAdapterActionItem.IsHidden(AAction: Variant): Boolean;
begin
  Result := bhoHideAlways in HideOptions;
  if Result then
    Exit;
  Result := (bhoHideOnActionNotVisible in HideOptions) and not AAction.Visible;
  if Result then
    Exit;
  Result := (bhoHideOnDisabledAction in HideOptions) and not AAction.Enabled;
  if Result then
    Exit;
  Result := (bhoHideOnNoExecuteAccess in HideOptions) and not AAction.CanExecute;
  if Result then
    Exit;
end;

procedure TCustomXMLAdapterActionItem.WriteArrayData(AXMLWriter: IXMLWriter; const ATagName: string; AAction, AArray: Variant);
var
  EnumVariant: IEnumVariant;
  Temp: OleVariant;
  Fetched: LongWord;
  I: Integer;
begin
  if (not VarIsClear(AArray)) and Supports(AArray.Get_NewEnum, IEnumVariant, EnumVariant) then
  begin
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(ATagName);
      EnumVariant.Reset;
      I := 0;
      while EnumVariant.Next(1, Temp, Fetched) = S_OK do
      begin
        AXMLWriter.PushNode;
        try
          AXMLWriter.AddNode('Item');
          WriteItemData(AXMLWriter, AAction);
          AXMLWriter.WritePropertyValue('Index', I);
          Inc(I);
        finally
          AXMLWriter.PopNode;
        end;
      end;
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLAdapterActionItem.WriteItemData(AXMLWriter: IXMLWriter; AAction: Variant);
var
  PageName, ErrorPageName, ThisPageName: string;
begin
  if WebContext <> nil then
    ThisPageName := WebContext.DispatchedPageName
  else
    ThisPageName := '';

  if Self.PageName = '' then
    PageName := ThisPageName
  else
    PageName := Self.PageName;
  if Self.ErrorPageName = '' then
    ErrorPageName := ThisPageName
  else
    ErrorPageName := Self.ErrorPageName;
  if (PageName <> '') or (ErrorPageName <> '') then
  begin
    AXMLWriter.WritePropertyValue('AsFieldValue', AAction.LinkToPage(PageName, ErrorPageName).AsFieldValue);
    AXMLWriter.WritePropertyValue('AsHref', AAction.LinkToPage(PageName, ErrorPageName).AsHREF);
  end
  else
  begin
    AXMLWriter.WritePropertyValue('AsFieldValue', AAction.AsFieldValue);
    AXMLWriter.WritePropertyValue('AsHref', AAction.AsHREF);
  end;
end;

procedure TCustomXMLAdapterActionItem.ImplWriteXMLData(AXMLWriter: IXMLWriter);
var
  C: TComponent;
  GetScriptObject: IGetScriptObject;
  Action: Variant;
begin
  C := FindAssociatedAction;
  if Supports(IInterface(C), IGetScriptObject, GetScriptObject) then
  begin
    Action := GetScriptObject.GetScriptObject;
    if IsHidden(Action) then Exit;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(TagName);
      AXMLWriter.WritePropertyValue('Name', Action.Name);
      if not VarIsClear(Action.Array) then
        WriteArrayData(AXMLWriter, sArray, Action, Action.Array)
      else
        WriteItemData(AXMLWriter, Action);
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLAdapterActionItem.WriteItemLayout(AXMLWriter: IXMLWriter; const ACaption: string; AAction: Variant);
begin
  AXMLWriter.WritePropertyValue('Caption', ACaption);
  AXMLWriter.WritePropertyValue('Enabled', AAction.Enabled);
  AXMLWriter.WritePropertyValue('Visible', AAction.Visible);
end;

procedure TCustomXMLAdapterActionItem.WriteArrayLayout(AXMLWriter: IXMLWriter; const ATagName: string; AAction, AArray: Variant);
var
  EnumVariant: IEnumVariant;
  Temp: OleVariant;
  Fetched: LongWord;
  I: Integer;
begin
  if (not VarIsClear(AArray)) and Supports(AArray.Get_NewEnum, IEnumVariant, EnumVariant) then
  begin
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(ATagName);
      EnumVariant.Reset;
      I := 0;
      while EnumVariant.Next(1, Temp, Fetched) = S_OK do
      begin
        AXMLWriter.PushNode;
        try
          AXMLWriter.AddNode('Item');
          WriteItemLayout(AXMLWriter, AAction.DisplayLabel, AAction);
          AXMLWriter.WritePropertyValue('Index', I);
          Inc(I);
       finally
          AXMLWriter.PopNode;
        end;
      end;
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLAdapterActionItem.ImplWriteXMLLayout(AXMLWriter: IXMLWriter);
  function ConvertDisplayType(T: TCommandHTMLElementType): TAdapterActionHTMLElementType;
  begin
    case T of
      ctButton:  Result := htmlaButton;
      ctImage: Result := htmlaImage;
      ctAnchor: Result := htmlaAnchor;
    else
      Result := htmlaButton;
      Assert(False, 'unexpected type');
    end;
  end;

  procedure WriteDisplayType(AAction: Variant);
  begin
    if DisplayType = ctDefault then
      AXMLWriter.WritePropertyValue('ControlStyle', AAction.DisplayStyle)
    else
      AXMLWriter.WritePropertyValue('ControlStyle',
        AdapterActionHTMLElementTypeNames[ConvertDisplayType(DisplayType)]);
  end;
var
  C: TComponent;
  GetScriptObject: IGetScriptObject;
  Action: Variant;
begin
  C := FindAssociatedAction;
  if Supports(IInterface(C), IGetScriptObject, GetScriptObject) then
  begin
    Action := GetScriptObject.GetScriptObject;
    if IsHidden(Action) then Exit;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(TagName);
      AXMLWriter.WritePropertyValue('Name', Action.Name);
      WriteDisplayType(Action);
      AXMLWriter.WritePropertyValue('ImageWidth', ImageWidth);
      AXMLWriter.WritePropertyValue('ImageHeight', ImageHeight);
      AXMLWriter.WritePropertyValue('DisplayColumns', DisplayColumns); 
      if not VarIsClear(Action.Array) then
        WriteArrayLayout(AXMLWriter, sArray, Action, Action.Array)
      else
        WriteItemLayout(AXMLWriter, Caption, Action);
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLAdapterActionItem.SetActionName(
  const AValue: string);
begin
  if (AnsiCompareText(AValue, FActionName) <> 0) then
  begin
    FActionName := AValue;
    { TODO -cMUSTFIX : Restore defaults when change action name }
    (*
    if (inherited GetCaption = AValue) then inherited SetCaption('');
    if Assigned(WebParent) and
      not (csLoading in ComponentState) and (Length(AValue) > 0) then
      ImplRestoreDefaults;
    if [csLoading, csDesigning] * ComponentState <> [] then
    begin
      Component := GetParentComponent;
      while Assigned(Component) and
       (not Supports(IInterface(Component), IValidateFields, Intf)) do
       Component := Component.GetParentComponent;
      if Assigned(Component) then
        Intf.EnableValidateFields := True;
    end;
    *)
  end;

end;

function TCustomXMLAdapterActionItem.DefaultTagName: WideString;
begin
  Result := sAction;
end;

procedure TCustomXMLAdapterActionItem.GetDesigntimeWarnings(
  AWarnings: TAbstractDesigntimeWarnings);
begin
  if ActionName = '' then
    AWarnings.AddString(Format(sAdapterActionNameIsBlank, [Self.Name]))
  else
    if FindAssociatedAction = nil then
      AWarnings.AddString(Format(sCantFindAdapterAction, [Self.Name, ActionName]));
end;

constructor TCustomXMLAdapterActionItem.Create(AOwner: TComponent);
begin
  inherited;
  HideOptions := [bhoHideOnActionNotVisible];
  FImageWidth := -1;
  FImageHeight := -1;
  FDisplayColumns := -1;
end;

{ TBaseXMLAdapterFieldItem }

function TBaseXMLAdapterFieldItem.GetFieldName: string;
begin
  Result := FFieldName;
end;

function TBaseXMLAdapterFieldItem.IsHidden(AField: Variant): Boolean;
begin
  Result := hoHideAlways in HideOptions;
  if Result then
    Exit;
  Result := (hoHideOnFieldNotVisible in HideOptions) and not AField.Visible;
  if Result then
    Exit;
  Result := (hoHideOnNoDisplayAccess in HideOptions) and not AField.CanView;
  if Result then
    Exit;
  Result := (hoHideOnNoInputAccess in HideOptions) and not AField.CanModify;
end;

function TBaseXMLAdapterFieldItem.FindAssociatedField: TComponent;
begin
  Result := FindAssociatedVariable(FFieldName);
end;

procedure TBaseXMLAdapterFieldItem.SetFieldName(
  const AValue: string);
begin
  if (AnsiCompareText(AValue, FFieldName) <> 0) then
  begin
    FFieldName := AValue;
    { TODO -cMUSTFIX : Restore defaults when change field name }
    (*
    if (inherited GetCaption = AValue) then inherited SetCaption('');
    if Assigned(WebParent) and
      not (csLoading in ComponentState) and (Length(AValue) > 0) then
      ImplRestoreDefaults;
    if [csLoading, csDesigning] * ComponentState <> [] then
    begin
      Component := GetParentComponent;
      while Assigned(Component) and
       (not Supports(IInterface(Component), IValidateFields, Intf)) do
       Component := Component.GetParentComponent;
      if Assigned(Component) then
        Intf.EnableValidateFields := True;
    end;
    *)
  end;

end;

function TBaseXMLAdapterFieldItem.DefaultTagName: WideString;
begin
  Result := sField;
end;

procedure TBaseXMLAdapterFieldItem.WriteImageData(AXMLWriter: IXMLWriter; const ATagName: string; AImage: Variant);
var
  HREF: WideString;
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(ATagName);
    if DesigningComponent(Self) then
      if Assigned(GetHTMLSampleImage) then
        HREF := GetHTMLSampleImage
      else
        HREF := ''
    else
      HREF := AImage.AsHREF;
    AXMLWriter.WritePropertyValue('Href', HREF);
  finally
    AXMLWriter.PopNode;
  end;
end;

procedure TBaseXMLAdapterFieldItem.GetDesigntimeWarnings(
  AWarnings: TAbstractDesigntimeWarnings);
begin
  if FieldName = '' then
    AWarnings.AddString(Format(sAdapterFieldNameIsBlank, [Self.Name]))
  else
    if FindAssociatedField = nil then
      AWarnings.AddString(Format(sCantFindAdapterField, [Self.Name, FieldName]));
end;

procedure TBaseXMLAdapterFieldItem.WriteValuesList(AXMLWriter: IXMLWriter; const ATagName: string; AField, AValuesList: Variant);
var
  EnumVariant: IEnumVariant;
  Temp, V: OleVariant;
  Fetched: LongWord;
  Values: Variant;
  Selected: Boolean;
begin
  if (not VarIsClear(AValuesList)) and Supports(AValuesList.Records.Get_NewEnum, IEnumVariant, EnumVariant) then
  begin
    Values := AField.Values;
    EnumVariant.Reset;
    while EnumVariant.Next(1, Temp, Fetched) = S_OK do
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(ATagName);
        AXMLWriter.WritePropertyValue('Name', Temp.ValueName);
        V := Temp.Value;
        AXMLWriter.WritePropertyValue('Value', Temp.Value);
        if VarIsClear(Values) then
          // jmt.!!! Using V here raises an exception try
          // with latest build
          Selected := AField.IsEqual(Temp.Value)
        else
          Selected := Values.HasValue(Temp.Value);
        if Selected then
          AXMLWriter.WritePropertyValue('Selected', 1);
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;
end;

procedure TBaseXMLAdapterFieldItem.WriteValues(AXMLWriter: IXMLWriter; const ATagName: string; AValues: Variant);
var
  EnumVariant: IEnumVariant;
  Temp: OleVariant;
  Fetched: LongWord;
begin
  if (not VarIsClear(AValues)) and Supports(AValues.Records.Get_NewEnum, IEnumVariant, EnumVariant) then
  begin
    EnumVariant.Reset;
    while EnumVariant.Next(1, Temp, Fetched) = S_OK do
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(ATagName);
        AXMLWriter.WritePropertyValue('DisplayText', AValues.Fields.Value.DisplayText);
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;
end;

constructor TBaseXMLAdapterFieldItem.Create(AOwner: TComponent);
begin
  inherited;
  FHideOptions := [hoHideOnFieldNotVisible];
end;

procedure TBaseXMLAdapterFieldItem.ImplWriteXMLData(AXMLWriter: IXMLWriter);
var
  C: TComponent;
  GetScriptObject: IGetScriptObject;
  Field: Variant;
begin
  C := FindAssociatedField;
  if Supports(IInterface(C), IGetScriptObject, GetScriptObject) then
  begin
    Field := GetScriptObject.GetScriptObject;
    if IsHidden(Field) then Exit;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(TagName);
      AXMLWriter.WritePropertyValue('Name', Field.Name);
      AXMLWriter.WritePropertyValue('DisplayText', Field.DisplayText);
      AXMLWriter.WritePropertyValue('EditText', Field.EditText);
      if not VarIsClear(Field.Image) then
        WriteImageData(AXMLWriter, 'Image', Field.Image);
      if not VarIsClear(Field.Values) then
        WriteValues(AXMLWriter, 'Values', Field.Values);
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TBaseXMLAdapterFieldItem.ImplWriteXMLLayout(
  AXMLWriter: IXMLWriter);
begin
  inherited;

end;

{ TCustomXMLAdapterFieldItem }

const
  CaptionPositions: array[TCaptionPosition] of string =
    ('Left', 'Right', 'Above', 'Below');

constructor TCustomXMLAdapterFieldItem.Create(AOwner: TComponent);
begin
  inherited;
  FImageWidth := -1;
  FImageHeight := -1;
  FMaxLength := -1;
  FDisplayRows := -1;
  FDisplayColumns := -1;
  FCaptionPosition := capLeft;
end;

procedure TCustomXMLAdapterFieldItem.ImplWriteXMLLayout(AXMLWriter: IXMLWriter);
  function ConvertDisplayType(T: TDisplayFieldHTMLElementType): TAdapterDisplayHTMLElementType;
  begin
    case T of
      dftText:  Result := htmldText;
      dftImage: Result := htmldImage;
      dftList: Result := htmldList;
    else
      Result := htmldText;
      Assert(False, 'unexpected type');
    end;
  end;

  function ConvertInputType(T: TInputFieldHTMLElementType): TAdapterInputHTMLElementType;
  begin
    case T of
      //htmliNone: Assert(False);
      iftTextInput: Result := htmliTextInput;
      iftPasswordInput:  Result := htmliPasswordInput;
      iftSelect:         Result := htmliSelect;
      iftSelectMultiple: Result := htmliSelectMultiple;
      iftRadio:          Result := htmliRadio;
      iftCheckBox:       Result := htmliCheckBox;
      iftTextArea:       Result := htmliTextArea;
      iftFile:            Result := htmliFile;
    else
      Result := htmliTextInput;
      Assert(False, 'unexpected type');
    end;
  end;

  procedure WriteInputType(AField: Variant);
  begin
    if InputType = iftDefault then
      AXMLWriter.WritePropertyValue('ControlStyle', AField.InputStyle)
    else
      AXMLWriter.WritePropertyValue('ControlStyle',
        AdapterInputHTMLElementTypeNames[ConvertInputType(InputType)]);
  end;

  procedure WriteDisplayType(AField: Variant);
  begin
    if DisplayType = dftDefault then
      AXMLWriter.WritePropertyValue('ControlStyle', AField.DisplayStyle)
    else
      AXMLWriter.WritePropertyValue('ControlStyle',
        AdapterDisplayHTMLElementTypeNames[ConvertDisplayType(DisplayType)]);
  end;

var
  C: TComponent;
  GetScriptObject: IGetScriptObject;
  Field: Variant;
  CalcViewMode: TDisplayFieldViewMode;
begin
  C := FindAssociatedField;
  if Supports(IInterface(C), IGetScriptObject, GetScriptObject) then
  begin
    Field := GetScriptObject.GetScriptObject;
    if IsHidden(Field) then Exit;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(TagName);
      AXMLWriter.WritePropertyValue('Name', Field.Name);
      AXMLWriter.WritePropertyValue('DisplayWidth', DisplayWidth);
      AXMLWriter.WritePropertyValue('Caption', Caption);
      AXMLWriter.WritePropertyValue('CaptionAlign', HTMLAlign[CaptionAlign]);
      AXMLWriter.WritePropertyValue('CaptionVAlign', HTMLVAlign[CaptionVAlign]);
      AXMLWriter.WritePropertyValue('CaptionPosition',
        CaptionPositions[CaptionPosition]);
      AXMLWriter.WritePropertyValue('InputName', Field.InputName);
      AXMLWriter.WritePropertyValue('Align', HTMLAlign[Align]);
      AXMLWriter.WritePropertyValue('VAlign', HTMLVAlign[VAlign]);
      AXMLWriter.WritePropertyValue('ImageWidth', ImageWidth);
      AXMLWriter.WritePropertyValue('ImageHeight', ImageWidth);
      AXMLWriter.WritePropertyValue('SelectRows', SelectRows);
      AXMLWriter.WritePropertyValue('MaxLength', MaxLength);
      AXMLWriter.WritePropertyValue('TextAreaWrap', MidItems.TextAreaWrap[TextAreaWrap]);
      AXMLWriter.WritePropertyValue('MaxLength', MaxLength);
      AXMLWriter.WritePropertyValue('DisplayRows', DisplayRows);
      AXMLWriter.WritePropertyValue('DisplayColumns', DisplayColumns);
      if CalcDisplayFieldViewMode(C, GetAdapterModeOfAdapter, ViewMode, CalcViewMode) then
        case CalcViewMode of
          vmInput:
            WriteInputType(Field);
          vmDisplay:
            WriteDisplayType(Field);
          vmToggleOnAccess:
            if Field.CanModify then
              WriteInputType(Field)
            else
              WriteDisplayType(Field);
        else
          Assert(False);
        end
      else
       Assert(False);
     if not VarIsClear(Field.ValuesList) then
      begin
        AXMLWriter.PushNode;
        try
          AXMLWriter.AddNode('Values');
          WriteValuesList(AXMLWriter, 'Item', Field, Field.ValuesList);
        finally
          AXMLWriter.PopNode;
        end;
      end;
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

resourcestring
  sAddCommands = 'Add Actions...';
  sAddAllCommands = 'Add All Actions';
  sAddCommandsDlgCaption = 'Add Actions';
const
  sAdapterCommandPrefix = 'ActItem'; // Do not location
resourcestring
  sAddFields = 'Add Fields...';
  sAddAllFields = 'Add All Fields';
  sAddFieldsDlgCaption = 'Add Fields';
const
  sAdapterFieldPrefix = 'FldItem'; // Do not location

{ TAbstractXMLAdapterFieldTypeGroup }

constructor TAbstractXMLAdapterFieldTypeGroup.Create(AOwner: TComponent);
begin
  inherited;
  FDataTagName := sData;
  FLayoutTagName := sLayout;
end;

function TAbstractXMLAdapterFieldTypeGroup.GetDataTagName: WideString;
begin
  Result := FDataTagName;
end;

procedure TAbstractXMLAdapterFieldTypeGroup.GetItemsList(List: TStrings);
begin
  List.Clear;
  FListHelper.GetFieldsList(List);
end;

function TAbstractXMLAdapterFieldTypeGroup.GetLayoutTagName: WideString;
begin
  Result := FLayoutTagName;
end;

function TAbstractXMLAdapterFieldTypeGroup.ImplGetAddAllFieldsItem: string;
begin
  Result := sAddAllFields;
end;

function TAbstractXMLAdapterFieldTypeGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Result := sAddFieldsDlgCaption;
end;

function TAbstractXMLAdapterFieldTypeGroup.ImplGetAddFieldsItem: string;
begin
  Result := sAddFields;
end;

function TAbstractXMLAdapterFieldTypeGroup.ImplGetNewFieldPrefix: string;
begin
  Result := sAdapterFieldPrefix;
end;

procedure TAbstractXMLAdapterFieldTypeGroup.ImplWriteXMLData(
  AXMLWriter: IXMLWriter);
var
  AdapterModeIntf: IAdapterMode;
  SaveAdapterMode: string;
begin
  if (FAdapterMode <> '') and Supports(IUnknown(Adapter), IAdapterMode, AdapterModeIntf) then
  begin
    SaveAdapterMode := AdapterModeIntf.AdapterMode;
    if SaveAdapterMode = '' then
      AdapterModeIntf.AdapterMode := FAdapterMode;
  end;
  try
    inherited;
  finally
    if AdapterModeIntf <> nil then
      AdapterModeIntf.AdapterMode := SaveAdapterMode;
  end;
end;

{ TAbstractXMLActionTypeGroup }

procedure TAbstractXMLActionTypeGroup.GetItemsList(List: TStrings);
begin
  List.Clear;
  FListHelper.GetActionsList(List);
end;

function TAbstractXMLActionTypeGroup.ImplGetAddAllFieldsItem: string;
begin
  Result := sAddAllCommands;
end;

function TAbstractXMLActionTypeGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Result := sAddCommandsDlgCaption;
end;

function TAbstractXMLActionTypeGroup.ImplGetAddFieldsItem: string;
begin
  Result := sAddCommands;
end;

function TAbstractXMLActionTypeGroup.ImplGetNewFieldPrefix: string;
begin
  Result := sAdapterCommandPrefix;
end;

{ TAbstractXMLAdapterActionTypeGroup }

constructor TAbstractXMLAdapterActionTypeGroup.Create(AOwner: TComponent);
begin
  inherited;
  FDataTagName := sData;
  FLayoutTagName := sLayout;
end;

function TAbstractXMLAdapterActionTypeGroup.GetDataTagName: WideString;
begin
  Result := FDataTagName;
end;

procedure TAbstractXMLAdapterActionTypeGroup.GetItemsList(List: TStrings);
begin
  List.Clear;
  FListHelper.GetActionsList(List);
end;

function TAbstractXMLAdapterActionTypeGroup.GetLayoutTagName: WideString;
begin
  Result := FLayoutTagName;
end;

function TAbstractXMLAdapterActionTypeGroup.ImplGetAddAllFieldsItem: string;
begin
  Result := sAddAllCommands;
end;

function TAbstractXMLAdapterActionTypeGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Result := sAddCommandsDlgCaption;
end;

function TAbstractXMLAdapterActionTypeGroup.ImplGetAddFieldsItem: string;
begin
  Result := sAddCommands;
end;

function TAbstractXMLAdapterActionTypeGroup.ImplGetNewFieldPrefix: string;
begin
  Result := sAdapterCommandPrefix;
end;

{ TCustomXMLFieldGroup }

constructor TCustomXMLFieldGroup.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sFieldGroup;
end;

function TCustomXMLFieldGroup.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLFieldGroupChild);
end;

function TCustomXMLFieldGroup.GetTagName: WideString;
begin
  Result := FTagName;
end;

procedure TCustomXMLFieldGroup.WriteHiddenFields(AXMLWriter: IXMLWriter);
var
  EnumVariant: IEnumVariant;
  FieldTagName: string;

  procedure WriteFields;
  var
    Temp: OleVariant;
    Fetched: LongWord;
  begin
    EnumVariant.Reset;
    while EnumVariant.Next(1, Temp, Fetched) = S_OK do
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(FieldTagName);
        AXMLWriter.WritePropertyValue('Name', Temp.Name);
        AXMLWriter.WritePropertyValue('Value', Temp.Value);
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;

var
  V: Variant;
  GetScriptObject: IGetScriptObject;
  HiddenRecordFieldsTagName, HiddenFieldsTagName: string;
begin
  HiddenRecordFieldsTagName := sHiddenRecordFields;
  HiddenFieldsTagName := sHiddenFields;
  FieldTagName := sField;
  if Supports(IInterface(Adapter), IGetScriptObject, GetScriptObject) then
  begin
    V := GetScriptObject.GetScriptObject;
    if (not VarIsClear(V.HiddenFields)) and Supports(V.HiddenFields.Get_NewEnum, IEnumVariant, EnumVariant) then
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(HiddenFieldsTagName);
        WriteFields;
      finally
        AXMLWriter.PopNode;
      end;
    end;
    if (not VarIsClear(V.HiddenRecordFields)) and Supports(V.HiddenRecordFields.Get_NewEnum, IEnumVariant, EnumVariant) then
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(HiddenRecordFieldsTagName);
        WriteFields;
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;
end;

procedure TCustomXMLFieldGroup.WriteDataSection(AXMLWriter: IXMLWriter);
begin
  WriteHiddenFields(AXMLWriter);
  inherited;
end;

{ TCustomXMLForm }

constructor TCustomXMLForm.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sForm;
end;

function TCustomXMLForm.GetTagName: WideString;
begin
  Result := FTagName;
end;

function TCustomXMLForm.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLFormChild);
end;

procedure TCustomXMLForm.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    AXMLWriter.WritePropertyValue('Name', Self.Name);
    case FormMethod of
      fmGet:
        AXMLWriter.WritePropertyValue('Method', sFormGet);
      fmPost:
        AXMLWriter.WritePropertyValue('Method', sFormPost);
    else
      Assert(False);  // Unknown type
    end;
    if (WebContext <> nil) and (WebContext.Request <> nil) then
    begin
      AXMLWriter.WritePropertyValue('Action',
        WebContext.Request.InternalScriptName +
        WebContext.Request.InternalPathInfo);
    end;
    ComponentListWriteXMLData(GetWebComponents, AXMLWriter);
  finally
    AXMLWriter.PopNode;
  end;
end;

{ TCustomXMLCommandGroup }

function TCustomXMLCommandGroup.GetDataTagName: WideString;
begin
  Result := FDataTagName;
end;

function TCustomXMLCommandGroup.GetLayoutTagName: WideString;
begin
  Result := FLayoutTagName;
end;

function TCustomXMLCommandGroup.GetTagName: WideString;
begin
  Result := FTagName;
end;

procedure TCustomXMLCommandGroup.GetItemsList(List: TStrings);
begin
  List.Clear;
  FListHelper.GetActionsList(List);
end;

function TCustomXMLCommandGroup.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLCommandGroupChild);
end;

function TCustomXMLCommandGroup.ImplGetAddAllFieldsItem: string;
begin
  Result := sAddAllCommands;
end;

function TCustomXMLCommandGroup.ImplGetAddFieldsDlgCaption: string;
begin
  Result := sAddCommandsDlgCaption;
end;

function TCustomXMLCommandGroup.ImplGetAddFieldsItem: string;
begin
  Result := sAddCommands;
end;

function TCustomXMLCommandGroup.ImplGetNewFieldPrefix: string;
begin
  Result := sAdapterCommandPrefix;
end;

constructor TCustomXMLCommandGroup.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sCommandGroup;
  FDataTagName := sData;
  FLayoutTagName := sLayout;
end;


{ TCustomXMLGrid }

constructor TCustomXMLGrid.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sGrid;
  FRowTagName := sRow;
end;

function TCustomXMLGrid.GetTagName: WideString;
begin
  Result := FTagName;
end;

function TCustomXMLGrid.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLGridChild);
end;

procedure TCustomXMLGrid.WriteDataSection(AXMLWriter: IXMLWriter);
var
  V: Variant;
  GetScriptObject: IGetScriptObject;
  EnumVariant: IEnumVariant;
  Temp: OleVariant;
  Fetched: LongWord;
begin
  if Supports(IInterface(Adapter), IGetScriptObject, GetScriptObject) then
  begin
    V := GetScriptObject.GetScriptObject;
    if Supports(V.Records.Get_NewEnum, IEnumVariant, EnumVariant) then
    begin
      EnumVariant.Reset;
      while EnumVariant.Next(1, Temp, Fetched) = S_OK do
      begin
        AXMLWriter.PushNode;
        try
          AXMLWriter.AddNode(RowTagName);
          ComponentListWriteXMLData(GetVisibleItems, AXMLWriter);
        finally
          AXMLWriter.PopNode;
        end;
      end;
    end;
  end;
end;

{ TCustomXMLCommandColumn }

constructor TCustomXMLCommandColumn.Create(AOwner: TComponent);
begin
  inherited;
  FTagName := sCommandColumn;
  FDisplayColumns := -1;
end;

function TCustomXMLCommandColumn.GetTagName: WideString;
begin
  Result := FTagName;
end;

procedure TCustomXMLCommandColumn.WriteXMLLayout(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLLayout(AXMLWriter);
end;

procedure TCustomXMLCommandColumn.ImplWriteXMLLayout(
  AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    AXMLWriter.WritePropertyValue('Caption', Caption);
    AXMLWriter.WritePropertyValue('CaptionAlign', HTMLAlign[CaptionAlign]);
    AXMLWriter.WritePropertyValue('CaptionVAlign', HTMLVAlign[CaptionVAlign]);
    AXMLWriter.WritePropertyValue('Align', HTMLAlign[Align]);
    AXMLWriter.WritePropertyValue('VAlign', HTMLVAlign[VAlign]);
    AXMLWriter.WritePropertyValue('DisplayColumns', DisplayColumns);
    inherited WriteLayoutSection(AXMLWriter);
  finally
    AXMLWriter.PopNode;
  end;
end;

procedure TCustomXMLCommandColumn.ImplWriteXMLData(AXMLWriter: IXMLWriter);
begin
  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    inherited WriteDataSection(AXMLWriter);
  finally
    AXMLWriter.PopNode;
  end;
end;

function TCustomXMLCommandColumn.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLCommandColumnChild);
end;

{ TCustomXMLAdapterColumnItem }

constructor TCustomXMLAdapterColumnItem.Create(AOwner: TComponent);
begin
  inherited;
  FImageWidth := -1;
  FImageHeight := -1;
end;

procedure TCustomXMLAdapterColumnItem.ImplWriteXMLLayout(AXMLWriter: IXMLWriter);

  function ConvertDisplayType(T: TColumnHTMLElementType): TAdapterDisplayHTMLElementType;
  begin
    case T of
      coltText:  Result := htmldText;
      coltImage: Result := htmldImage;
      coltList: Result := htmldList;
    else
      Result := htmldText;
      Assert(False, 'unexpected type');
    end;
  end;

  procedure WriteDisplayType(AField: Variant);
  begin
    if DisplayType = coltDefault then
      AXMLWriter.WritePropertyValue('ControlStyle', AField.DisplayStyle)
    else
      AXMLWriter.WritePropertyValue('ControlStyle',
        AdapterDisplayHTMLElementTypeNames[ConvertDisplayType(DisplayType)]);
  end;

var
  C: TComponent;
  GetScriptObject: IGetScriptObject;
  Field: Variant;
begin
  C := FindAssociatedField;
  if Supports(IInterface(C), IGetScriptObject, GetScriptObject) then
  begin
    Field := GetScriptObject.GetScriptObject;
    if IsHidden(Field) then exit;
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode(TagName);
      AXMLWriter.WritePropertyValue('Name', Field.Name);
      AXMLWriter.WritePropertyValue('DisplayWidth', DisplayWidth);
      AXMLWriter.WritePropertyValue('Caption', Caption);
      AXMLWriter.WritePropertyValue('CaptionAlign', HTMLAlign[CaptionAlign]);
      AXMLWriter.WritePropertyValue('CaptionVAlign', HTMLVAlign[CaptionVAlign]);
      AXMLWriter.WritePropertyValue('InputName', Field.InputName);
      AXMLWriter.WritePropertyValue('ImageWidth', ImageWidth);
      AXMLWriter.WritePropertyValue('ImageHeight', ImageHeight);
      AXMLWriter.WritePropertyValue('VAlign', HTMLVAlign[VAlign]);
      AXMLWriter.WritePropertyValue('Align', HTMLAlign[Align]);
      WriteDisplayType(Field);
      if not VarIsClear(Field.ValuesList) then
      begin
        AXMLWriter.PushNode;
        try
          AXMLWriter.AddNode('Values');
          WriteValuesList(AXMLWriter, 'Item', Field, Field.ValuesList);
        finally
          AXMLWriter.PopNode;
        end;
      end;
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

{ TCustomXMLPageHeadingElements }

constructor TCustomXMLPageHeadingElements.Create(AOwner: TComponent);
begin
  inherited;
  ModuleContext := AOwner;
  FTagName := sApplicationInfo;
  FPageHeadingOptions := [hoApplicationTitle, hoCurrentPage, hoPublishedPages, hoLoginActions, hoEndUserName];
end;

function TCustomXMLPageHeadingElements.GetApplicationAdapter: Variant;
begin
  if VarIsEmpty(FApplicationAdapter) then
    FApplicationAdapter := WebScript.ScriptObjectFactories.CreateGlobalObject(svApplication, Self);
  Result := FApplicationAdapter;
end;

function TCustomXMLPageHeadingElements.GetEndUserAdapter: Variant;
begin
  if VarIsEmpty(FEndUserAdapter) then
    FEndUserAdapter := WebScript.ScriptObjectFactories.CreateGlobalObject(svEndUser, Self);
  Result := FEndUserAdapter;
end;

function TCustomXMLPageHeadingElements.GetPage: Variant;
begin
  if VarIsEmpty(FPage) then
    FPage := WebScript.ScriptObjectFactories.CreateGlobalObject(svPage, Self);
  Result := FPage;
end;

function TCustomXMLPageHeadingElements.GetPages: Variant;
begin
  if VarIsEmpty(FPages) then
    FPages := WebScript.ScriptObjectFactories.CreateGlobalObject(svPages, Self);
  Result := FPages;
end;

function TCustomXMLPageHeadingElements.GetWebModuleContext: TWebModuleContext;
begin
  Assert(ModuleContext <> nil);
  Result := ModuleContext;
end;

procedure TCustomXMLPageHeadingElements.ImplWriteXMLDAta(
  AXMLWriter: IXMLWriter);
begin

  AXMLWriter.PushNode;
  try
    AXMLWriter.AddNode(TagName);
    WriteApplicationAdapter(AXMLWriter);
    WriteEndUserAdapter(AXMLWriter);
    WritePage(AXMLWriter);
    WritePages(AXMLWriter);
  finally
    AXMLWriter.PopNode;
  end;
  FApplicationAdapter := Unassigned;
  FEndUserAdapter := Unassigned;
  FPage := Unassigned;
  FPages := Unassigned;
end;

procedure TCustomXMLPageHeadingElements.WriteApplicationAdapter(AXMLWriter: IXMLWriter);
begin
  if not VarIsClear(ApplicationAdapter) then
  begin
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode('Application');
      if hoApplicationTitle in PageHeadingOptions then
        AXMLWriter.WritePropertyValue('Title', ApplicationAdapter.Title);
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLPageHeadingElements.WriteEndUserAdapter(AXMLWriter: IXMLWriter);
begin
  if not VarIsClear(EndUserAdapter) then
  begin
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode('EndUser');
      if hoEndUserName in PageHeadingOptions then
        AXMLWriter.WritePropertyValue('DisplayName', EndUserAdapter.DisplayName);
      AXMLWriter.WritePropertyValue('LoggedIn', EndUserAdapter.LoggedIn);
    finally
      AXMLWriter.PopNode;
    end;
    if hoLoginActions in PageHeadingOptions then
    begin
      if (not VarIsClear(EndUserAdapter.LogoutAction)) then
        if EndUserAdapter.LogoutAction.Enabled then
        begin
          AXMLWriter.PushNode;
          try
            AXMLWriter.AddNode('LogoutAction');
            AXMLWriter.WritePropertyValue('AsHref', EndUserAdapter.LogoutAction.AsHRef);
          finally
            AXMLWriter.PopNode;
          end;
        end;
      if (not VarIsClear(EndUserAdapter.LoginFormAction)) then
        if EndUserAdapter.LoginFormAction.Enabled then
        begin
          AXMLWriter.PushNode;
          try
            AXMLWriter.AddNode('LoginAction');
            AXMLWriter.WritePropertyValue('AsHref', EndUserAdapter.LoginFormAction.AsHRef);
          finally
            AXMLWriter.PopNode;
          end;
        end;
      end;
  end;
end;

procedure TCustomXMLPageHeadingElements.WritePageElement(AXMLWriter: IXMLWriter; APage: Variant);
begin
  if not VarIsClear(APage) then
  begin
    AXMLWriter.PushNode;
    try
      AXMLWriter.AddNode('Page');
      AXMLWriter.WritePropertyValue('Name', APage.Name);
      AXMLWriter.WritePropertyValue('Title', APage.Title);
      AXMLWriter.WritePropertyValue('Href', APage.HREF);
    finally
      AXMLWriter.PopNode;
    end;
  end;
end;

procedure TCustomXMLPageHeadingElements.WritePage(AXMLWriter: IXMLWriter);
begin
  if hoCurrentPage in PageHeadingOptions then
    WritePageElement(AXMLWriter, Page);
end;

procedure TCustomXMLPageHeadingElements.WritePages(AXMLWriter: IXMLWriter);
var
  EnumVariant: IEnumVariant;
  Temp: OleVariant;
  Fetched: LongWord;
begin
  if hoPublishedPages in PageHeadingOptions then
  begin
    if (not VarIsClear(Pages)) and Supports(Pages.Get_NewEnum, IEnumVariant, EnumVariant) then
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode('Pages');
        EnumVariant.Reset;
        while EnumVariant.Next(1, Temp, Fetched) = S_OK do
          if Temp.Published then
            WritePageElement(AXMLWriter, Temp);
      finally
        AXMLWriter.PopNode;
      end;
    end;
  end;
end;

procedure TCustomXMLPageHeadingElements.WriteXMLData(AXMLWriter: IXMLWriter);
begin
  ImplWriteXMLData(AXMLWriter);
end;

function TBaseXMLAdapterFieldItem.GetCaption: string;
begin
  if FCaption = '' then
  begin
    Result := FFieldName;
    if Result = '' then
      Result := Name;
  end
  else
    Result := FCaption;
end;

procedure TBaseXMLAdapterFieldItem.SetCaption(Value: string);
begin
  if FFieldName <> '' then
  begin
    if Value = FFieldName then Value := ''
  end
  else
  begin
    if Value = Name then Value := ''
  end;
  FCaption := Value;
end;

procedure TBaseXMLAdapterFieldItem.RestoreDefaults;
begin
  ImplRestoreDefaults;
end;

procedure TBaseXMLAdapterFieldItem.ImplRestoreDefaults;
var
  Field: TComponent;
  WebGetDisplayWidth: IWebGetDisplayWidth;
  WebGetDisplayLabel: IWebGetDisplayLabel;
begin
  Field := FindAssociatedField;
  if Field <> nil then
  begin
    { TODO -cMUSTFIX : Support MaxLength }
    if Supports(IUnknown(Field), IWebGetDisplayWidth, WebGetDisplayWidth) then
      DisplayWidth := WebGetDisplayWidth.GetDisplayWidth;
    if Supports(IUnknown(Field), IWebGetDisplayLabel, WebGetDisplayLabel) then
      SetCaption(WebGetDisplayLabel.GetDisplayLabel);
  end;
end;

const
  sDefaultCommandColumnCaption = '&nbsp;';

function TCustomXMLCommandColumn.GetCaption: string;
begin
  if FCaption = '' then
    Result := sDefaultCommandColumnCaption
  else
    Result := FCaption;
end;

procedure TCustomXMLCommandColumn.SetCaption(const Value: string);
begin
  if Value <> FCaption then
    if Value = sDefaultCommandColumnCaption then
      FCaption := ''
    else
      FCaption := Value;
end;

function TCustomXMLAdapterItem.GetAdapterModeOfAdapter: string;
begin
  Result := GetAdapterModeOfAdapterInParent(Self);
end;

function TAbstractXMLAdapterReferenceGroup.GetAdapterModeOfDisplay: string;
var
  Intf: IGetAdapterModeOfDisplay;
begin
  if Supports(IUnknown(XMLComponent), IGetAdapterModeOfDisplay, Intf) then
    Result := Intf.GetAdapterModeOfDisplay
  else
    Result := '';
end;

function TAbstractXMLAdapterReferenceGroup.GetAdapterModeOfAdapter: string;
var
  Intf: IGetAdapterModeOfDisplay;
begin
  if Supports(IUnknown(XMLComponent), IGetAdapterModeOfDisplay, Intf) then
    Result := Intf.GetAdapterModeOfAdapter
  else
    Result := '';
end;

{ TCustomAdapterXMLBuilder }

constructor TCustomAdapterXMLBuilder.Create(AOwner: TComponent);
begin
  inherited;
  FPageHeadingElements := TXMLPageHeadingElements.Create(nil);
  FPageHeadingElements.ModuleContext := AOwner;
end;

destructor TCustomAdapterXMLBuilder.Destroy;
begin
  inherited;
  FPageHeadingElements.Free;
end;

function TCustomAdapterXMLBuilder.GetPageHeadingOptions: TPageHeadingOptions;
begin
  Result := FPageHeadingElements.PageHeadingOptions;
end;

procedure TCustomAdapterXMLBuilder.SetPageHeadingOptions(
  const Value: TPageHeadingOptions);
begin
  FPageHeadingElements.PageHeadingOptions := Value;
end;

procedure TCustomAdapterXMLBuilder.WriteDataSection(XMLWriter: IXMLWriter);
begin
  FPageHeadingElements.WriteXMLData(XMLWriter);
  inherited;
end;

procedure TCustomXMLAdapterErrors.GetDesigntimeWarnings(
  AWarnings: TAbstractDesigntimeWarnings);
begin
  if Adapter = nil then
    AWarnings.AddString(Format(sAdapterPropertyIsNil, [Self.Name]))
  else
    AWarnings.AddObject(Adapter);
end;

procedure TCustomXMLPageHeadingElements.SetModuleContext(
  const Value: TComponent);
begin
  FModuleContext := Value;
  // Find module
  while (FModuleContext <> nil) and (FModuleContext.GetParentComponent <> nil) do
    FModuleContext := FModuleContext.GetParentComponent;
end;

function TAbstractXMLAdapterTypeGroup.GetAdapterModeOfAdapter: string;
var
  AdapterModeIntf: IAdapterMode;
begin
  if Supports(IUnknown(Adapter), IAdapterMode, AdapterModeIntf) then
    Result := AdapterModeIntf.AdapterMode
  else
    Result := '';
end;

function TAbstractXMLAdapterTypeGroup.GetAdapterModeOfDisplay: string;
begin
  Result := FAdapterMode;
end;

end.
