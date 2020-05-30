unit XMLBuilderComp;

interface

uses
  Windows, Messages, SysUtils, Classes, WebComp, MidComp, SiteComp, XMLDoc, XMLIntf, HTTPProd, HTTPApp;

type

  IXMLWriter = interface
  ['{3CA5F192-0A5C-4AE4-98B9-05D31A847ABB}']
    procedure PushNode;
    procedure PopNode;
    procedure AddNode(const AName: WideString);
    procedure WritePropertyValue(AName: WideString; AValue: Variant);
    function GetXMLDocument: XMLIntf.IXMLDocument;
    property XMLDocument: IXMLDocument read GetXMLDocument;
  end;

  IWriteXMLData = interface
    ['{B085441C-582A-4F4D-B3D5-E404E988AD24}']
    procedure WriteXMLData(AXMLWriter: IXMLWriter);
  end;

  IWriteXMLLayout = interface
    ['{2B13DC5A-E9E7-4CF9-B6D9-7130430BAF83}']
    procedure WriteXMLLayout(AXMLWriter: IXMLWriter);
  end;

  IXMLTopLevelChild = interface
  ['{8AE3E9D4-97D1-4578-94E9-AD15937D884C}']
  end;

  TXSLTemplate = class(TXMLDocument, ISetAppDispatcher)
  private
    FDispatcher: TComponent;
    function GetLocateFileService: ILocateFileService;
    function GetTemplateStream(var AOwned: Boolean): TStream;
    { ISetAppDispatcher }
    procedure SetAppDispatcher(const Value: TComponent);
  public
    procedure PrepareXSL;
    property DispatcherComponent: TComponent read FDispatcher;
    function TransformNode(ANode: IXMLNode): WideString; virtual;
  end;

  TCustomXMLBuilder = class(TComponent, IGetXMLStream, IWebComponentEditor, IGetWebComponentList, ITopLevelWebComponent,
    IGetProducerTemplate, IProducerEditorViewSupport, IProduceContent)
  private
    FTagName: WideString;
    FWebPageItems: TWebComponentList;
    FXSLTemplate: TXSLTemplate;
    procedure SetXSLTemplate(const Value: TXSLTemplate);
    function GetXMLDocument: IXMLDocument;
    function Content: string;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure WriteDesigntimeWarnings(AXMLWriter: IXMLWriter);
    procedure WriteDataSection(XMLWriter: IXMLWriter); virtual;
    { IGetXMLStream }
    // Allows this component to be used by XSLPageProducer
    function GetXMLStream(var AOwned: Boolean): TStream;
    function ImplGetXMLStream(var AOwned: Boolean): TStream; virtual;
    { IGetWebComponentsList }
    function GetComponentList: TObject;
    function GetDefaultComponentList: TObject;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetChildOrder(Component: TComponent; Order: Integer); override;
    { IWebComponentEditor }
    function CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; virtual;
    { IProduceContent }
    function ProduceContent: string;
    { IGetProducerTemplate }
    function GetProducerTemplateStream(out AOwned: Boolean): TStream;
    function GetProducerTemplateFileName: string;
    { IProducerEditorViewSupport }
    function HasScriptView: Boolean;
    function HasXMLBrowserView: Boolean;
    function HasXSLBrowserView: Boolean;
    function HasHTMLBrowserView: Boolean;
    function GetXMLData(var Owned: Boolean): TStream;
    function GetXSLData(var Owned: Boolean): TStream;
    function GetTemplateFileType: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TagName: WideString read FTagName write FTagName;
    property WebPageItems: TWebComponentList read FWebPageItems;
    property XSLTemplate: TXSLTemplate read FXSLTemplate write SetXSLTemplate;
    property XMLDocument: IXMLDocument read GetXMLDocument;
  end;

procedure ComponentListWriteXMLData(AComponentList: TWebComponentList; AXMLWriter: IXMLWriter);
procedure ComponentListWriteXMLLayout(AComponentList: TWebComponentList; AXMLWriter: IXMLWriter);

implementation

uses XMLBuilderWriter, ActiveX, Variants, Contnrs;

const
  sWarnings = WideString('Warnings');
  sWarning = WideString('Warning');
  sMessage = WideString('Message');

type
  TDesigntimeWarnings = class(TAbstractDesigntimeWarnings)
  private
    FStrings: TStrings;
    FObjects: TObjectList;
  public
    procedure AddString(AWarning: string); override;
    procedure AddObject(AObject: TObject);  override;
    property Strings: TStrings read FStrings;
    constructor Create;
    destructor Destroy; override;
  end;

{ TDesigntimeWarnings }

procedure TDesigntimeWarnings.AddString(AWarning: string);
begin
  FStrings.Add(AWarning);
end;

procedure TDesigntimeWarnings.AddObject(AObject: TObject);

  procedure ContainerWarnings(Container: IWebComponentContainer);
  var
    I: Integer;
  begin
    if Container <> nil then
      for I := 0 to Container.ComponentCount - 1 do
        Self.AddObject(Container.Components[I]);
  end;
var
  GetIntf: IGetDesignTimeWarnings;
  WebDataFields: IWebDataFields;
  WebActionsList: IWebActionsList;
  GetWebComponentList: IGetWebComponentList;
  Container: IWebComponentContainer;
  I: Integer;
begin
  if FObjects.IndexOf(AObject) > 0 then
    Exit;
  FObjects.Add(AObject);
   if Container <> nil then
    for I := 0 to Container.ComponentCount - 1 do
      Self.AddObject(Container.Components[I]);
  if Supports(AObject, IGetDesigntimeWarnings, GetIntf) then
    GetIntf.GetDesigntimeWarnings(Self);
  if Supports(AObject, IWebDataFields, WebDataFields) then
  begin
    Container := WebDataFields.GetVisibleFields;
    ContainerWarnings(Container);
  end;
  if Supports(AObject, IWebActionsList, WebActionsList) then
  begin
    Container := WebActionsList.GetVisibleActions;
    ContainerWarnings(Container);
  end;
  if Supports(AObject, IGetWebComponentList, GetWebComponentList) then
  begin
    Supports(GetWebComponentList.GetComponentList, IWebComponentContainer,
      Container);
    ContainerWarnings(Container);
  end;
end;

constructor TDesigntimeWarnings.Create;
begin
  FStrings := TStringList.Create;
  FObjects := TObjectList.Create(False { not owned} );
  inherited;
end;

destructor TDesigntimeWarnings.Destroy;
begin
  FStrings.Free;
  FObjects.Free;
  inherited;
end;

{ TCustomXMLBuilder }

function TCustomXMLBuilder.CanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := ImplCanAddClass(AParent, AClass);
end;

constructor TCustomXMLBuilder.Create(AOwner: TComponent);
begin
  FWebPageItems := TWebComponentList.Create(Self);
  FTagName := 'XMLBuilder';
  inherited;
end;

procedure TCustomXMLBuilder.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FXSLTemplate) then
    FXSLTemplate := nil;
end;

destructor TCustomXMLBuilder.Destroy;
begin
  inherited;
  FWebPageItems.Free;
end;

procedure TCustomXMLBuilder.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  WebComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  for I := 0 to FWebPageItems.Count - 1 do
  begin
    WebComponent := FWebPageItems.WebComponents[I];
    if WebComponent.Owner = Root then Proc(WebComponent);
  end;
end;

function TCustomXMLBuilder.GetComponentList: TObject;
begin
  Result := FWebPageItems;
end;

function TCustomXMLBuilder.GetDefaultComponentList: TObject;
begin
  Assert(False, 'No default components list');  { Do not localize }
  Result := nil;
end;

function TCustomXMLBuilder.GetXMLStream(
  var AOwned: Boolean): TStream;
begin
  Result := ImplGetXMLStream(AOwned);
end;

function TCustomXMLBuilder.ImplCanAddClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result := Supports(AClass, IXMLTopLevelChild);
end;

procedure ComponentListWriteXMLData(AComponentList: TWebComponentList; AXMLWriter: IXMLWriter);
var
  I: Integer;
  Component: TComponent;
  WriteXMLData: IWriteXMLData;
begin
  for I := 0 to AComponentList.Count - 1 do
  begin
    Component := AComponentList.WebComponents[I];
    if Supports(IInterface(Component), IWriteXMLData, WriteXMLDAta) then
    begin
      WriteXMLData.WriteXMLData(AXMLWriter);
    end;
  end;
end;

procedure ComponentListWriteXMLLayout(AComponentList: TWebComponentList; AXMLWriter: IXMLWriter);
var
  I: Integer;
  Component: TComponent;
  WriteXMLLayout: IWriteXMLLayout;
begin
  for I := 0 to AComponentList.Count - 1 do
  begin
    Component := AComponentList.WebComponents[I];
    if Supports(IUnknown(Component), IWriteXMLLayout, WriteXMLLayout) then
    begin
      WriteXMLLayout.WriteXMLLayout(AXMLWriter);
    end;
  end;
end;

function TCustomXMLBuilder.ImplGetXMLStream(
  var AOwned: Boolean): TStream;
var
  XMLWriter: IXMLWriter;
begin
  XMLWriter := TXMLWriter.Create;
  XMLWriter.AddNode(TagName);
  WriteDataSection(XMLWriter);
  AOwned := True;
  Result := TMemoryStream.Create;
  try
    XMLWriter.XMLDocument.SaveToStream(Result);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

procedure TCustomXMLBuilder.WriteDataSection(XMLWriter: IXMLWriter);
begin
  if csDesigning in ComponentState then
    WriteDesigntimeWarnings(XMLWriter);
  ComponentListWriteXMLData(WebPageItems, XMLWriter);
end;

function TCustomXMLBuilder.GetXMLDocument: IXMLDocument;
var
  XMLWriter: IXMLWriter;
begin
  XMLWriter := TXMLWriter.Create;
  XMLWriter.AddNode(TagName);
  WriteDataSection(XMLWriter);
  Result := XMLWriter.XMLDocument;
end;

procedure TCustomXMLBuilder.WriteDesigntimeWarnings(AXMLWriter: IXMLWriter);
var
  Warnings: TDesigntimeWarnings;
  I, J: Integer;
begin
  Warnings := TDesignTimeWarnings.Create;
  try
    for I := 0 to WebPageItems.Count - 1 do
      Warnings.AddObject(WebPageItems[I]);
    if Warnings.Strings.Count > 0 then
    begin
      AXMLWriter.PushNode;
      try
        AXMLWriter.AddNode(sWarnings);
        for J := 0 to Warnings.Strings.Count - 1 do
        begin
          AXMLWriter.PushNode;
          try
            AXMLWriter.AddNode(sWarning);
            AXMLWriter.WritePropertyValue(sMessage, Warnings.Strings[J]);
          finally
            AXMLWriter.PopNode;
          end;
        end;
      finally
        AXMLWriter.PopNode;
      end;
    end;
  finally
    Warnings.Free;
  end;
end;

procedure TCustomXMLBuilder.SetChildOrder(Component: TComponent;
  Order: Integer);
var
  Intf: IWebComponent;
begin
  if FWebPageItems.IndexOf(Component) >= 0 then
    if Supports(IInterface(Component), IWebComponent, Intf) then
      Intf.Index := Order
    else
      Assert(False, 'Interface not supported');
end;


function TCustomXMLBuilder.GetProducerTemplateFileName: string;
begin
  if XSLTemplate <> nil then
    Result := XSLTemplate.FileName
  else
    Result := '';
end;

function TCustomXMLBuilder.GetProducerTemplateStream(
  out AOwned: Boolean): TStream;
begin
  Result := nil;
end;

function TCustomXMLBuilder.GetTemplateFileType: string;
begin
  Result := 'XSL';
end;

function TCustomXMLBuilder.GetXMLData(var Owned: Boolean): TStream;
begin
  Result := GetXMLStream(Owned);
end;

function TCustomXMLBuilder.GetXSLData(var Owned: Boolean): TStream;
begin
  if XSLTemplate <> nil then
  begin
    XSLTemplate.PrepareXSL;
    Owned := True;
    Result := TMemoryStream.Create;
    try
      XSLTemplate.SaveToStream(Result);
    except
      FreeAndNil(Result);
      raise;
    end;
  end
  else
    Result := nil;
end;

function TCustomXMLBuilder.HasHTMLBrowserView: Boolean;
begin
  Result := True;
end;

function TCustomXMLBuilder.HasScriptView: Boolean;
begin
  Result := False;
end;

function TCustomXMLBuilder.HasXMLBrowserView: Boolean;
begin
  Result := True;
end;

function TCustomXMLBuilder.HasXSLBrowserView: Boolean;
begin
  Result := True;
end;

procedure TCustomXMLBuilder.SetXSLTemplate(const Value: TXSLTemplate);
begin
  if FXSLTemplate <> Value then
  begin
    FXSLTemplate := Value;
    if Value <> nil then
      Value.FreeNotification(Self);
  end;
end;

function TCustomXMLBuilder.Content: string;
var
  W: WideString;
  XMLDocument: IXMLDocument;
begin
  if XSLTemplate = nil then
    raise Exception.Create('XSLTemplate is nil');
  XMLDocument := GetXMLDocument;
  W := XSLTemplate.TransformNode(XMLDocument.DocumentElement.ParentNode);
  Result := W;
end;

function TCustomXMLBuilder.ProduceContent: string;
begin
  Result := Content;
end;

{ TXSLTemplate }

function TXSLTemplate.TransformNode(ANode: IXMLNode): WideString;
begin
  PrepareXSL;
  ANode.TransformNode(DocumentElement, Result);
end;

function TXSLTemplate.GetLocateFileService: ILocateFileService;
var
  GetIntf: IGetLocateFileService;
begin
  Result := nil;
  if DispatcherComponent <> nil then
    if Supports(IUnknown(DispatcherComponent), IGetLocateFileService, GetIntf) then
      Result := GetIntf.GetLocateFileService;
end;

function TXSLTemplate.GetTemplateStream(var AOwned: Boolean): TStream;
var
  ManagerIntf: ILocateFileService;
  S: string;
begin
  Result := nil;
  if FileName <> '' then
  begin
    if DesignerFileManager <> nil then
    begin
      S := DesignerFileManager.QualifyFileName(FileName);
      if S <> '' then
        Result := DesignerFileManager.GetStream(S, AOwned);
    end;
    if Result = nil then
    begin
      ManagerIntf := GetLocateFileService;
      if ManagerIntf <> nil then
        Result := ManagerIntf.GetTemplateStream(Self, FileName, AOwned)
    end;
  end
end;

procedure TXSLTemplate.PrepareXSL;
var
  S: TStream;
  Owned: Boolean;
  QualifiedName: string;
begin
  if (not Active) or (csDesigning in ComponentState) then
  begin
    S := GetTemplateStream(Owned);
    try
      if S <> nil then
        LoadFromStream(S);
    finally
      if Owned then
        S.Free;
    end;
    if (S = nil) and (not Active) then
      if FileName <> '' then
      begin
        // Support filenames without fully qualified path
        QualifiedName := WebComp.QualifyFileName(FileName);
        if AnsiCompareFileName(QualifiedName, FileName) <> 0 then
          // Set to directory of project or directory of executable
          SetCurrentDir(ExtractFilePath(WebComp.QualifyFileName('x')));
      end;
  end;
  Active := True;
end;

procedure TXSLTemplate.SetAppDispatcher(const Value: TComponent);
begin
  if FDispatcher <> Value then
  begin
    if Value <> nil then Value.FreeNotification(Self);
    FDispatcher := Value;
  end;
end;

end.
