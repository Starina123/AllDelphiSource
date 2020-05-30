{
  InternetExpress sample application component.

  TInetXCenterProducer is a custom TMidasPageProducer that implements
  standard behavior for pages in the INetXCenter sample application.

  Creating a custom producer has benefits:

  1) Can create customized, common appearance for web pages.  Easy
  to change appearance of all web pages.
  2) Formatted page can be viewed at design time.
  3) Can share code across applications.

}
unit InetXCenterProd;

interface

uses  Classes, MidItems, MidProd, WebComp, HTTPApp, HTTPProd, DB, SysUtils;

procedure Register;

type
  TPageCategory = (catExample);
const
  PageExampleCategories = [catExample];
type
  IComponentsInfo = interface;
  TPageCategories = set of TPageCategory;
  TTopicPage = (topNone, topHome, topComponents, topExamples,
    topComponentsFilter, topXML, topJavaScript, topAboutComponents);

  TPageLayout = (plStandard, plDescription);
  TInetXCenterProducer = class(TCustomMidasPageProducer)
  private
    FPageCategories: TPageCategories;
    FTopicPage: TTopicPage;
    FPageLayout: TPageLayout;
    FDescription: TStrings;
    FDescriptionFile: TFileName;
    FTitle: string;
    FCaption: string;
    FLinkName: string;
    FComponentsInfoIntf: IComponentsInfo;
    FComponentsInfo: TDataSet;
    FClassNames: TStrings;
    FInstructions: TStrings;
    procedure SetDescription(const Value: TStrings);
    procedure FindComponents;
    function GetLinkName: string;
    function GetCaption: string;
    function GetTitle: string;
    function GetTitleElement: string;
    function GetComponentsInfo: IComponentsInfo;
    procedure SetComponentsInfo(const Value: TDataSet);
    procedure SetCaption(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetLinkName(const Value: string);
    function GetSelectClassName: string;
    function FormatGlobalLinks(Topics: array of TTopicPage): string;
    function GetGlobalLinks: string;
    procedure AddTopicLinks(ALinks: TStrings);
    procedure GetExampleProducers(AList: TList);
    function GetSelectExample: string;
    function DefaultTitle: string;
    procedure SetInstructions(const Value: TStrings);
  protected
    function GetDefaultTemplate: string; override;
    procedure DoTagEvent(Tag: TTag; const TagString: string;
      TagParams: TStrings; var ReplaceText: string); override;
    function CreatePageElements: TMidasPageElements; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetHREF: string;
    function GetTopicName: string;
    function GetBanner: string;
    function GetDescription(ALinks: TStrings): string;
    function GetUsesComponents(ALinks: TStrings): string;
    procedure GetClassNames;
    function GetComponentDetails(ALinks: TStrings): string;
    function GetComponentSummary(ALinks: TStrings): string;
    function GetComponentsList(ALinks: TStrings): string;
    function GetExamplesList(ALinks: TStrings): string;
    function GetExampleSummary(AProducers: TList; ALinks: TStrings): string;
    function GetExampleDetails(AProducers: TList; ALinks: TStrings): string;
    function GetDumpRequest: string;
    function FindTopicPage(
      ATopic: TTopicPage): TInetXCenterProducer;
    function IsExample: Boolean;
    property ClassNames: TStrings read FClassNames;
    property ComponentsInfoIntf: IComponentsInfo read GetComponentsInfo;
  published
    property HTMLDoc;
    property HTMLFile;
    property IncludePathURL;
    property OnBeforeGetXMLData;
    property OnAfterGetXMLData;
    property OnBeforeGetContent;
    property OnAfterGetContent;
    property Styles;
    property StylesFile;
    property WebPageItems;
    property EnableXMLIslands;
    property LinkName: string read GetLinkName write SetLinkName;
    property HREF: string read GetHREF;
    property TopicPage: TTopicPage read FTopicPage write FTopicPage;
    property PageCategories: TPageCategories read FPageCategories write FPageCategories;
    property Description: TStrings read FDescription write SetDescription;
    property Title: string read GetTitle write SetTitle;
    property Caption: string read GetCaption write SetCaption;
    property ComponentsInfo: TDataSet read FComponentsInfo write SetComponentsInfo;
    property DescriptionFile: TFileName read FDescriptionFile write FDescriptionFile;
    property PageLayout: TPageLayout read FPageLayout write FPageLayout;
    property Instructions: TStrings read FInstructions write SetInstructions;
  end;

  IComponentsInfo = interface
  ['{D9792F5D-34BD-11D3-B016-00C04FB16EC3}']
    procedure Reset;
    function Next: Boolean;
    function ClassName: string;
    function ShortDescription: string;
    function Description: string;
    function Eof: Boolean;
    function Usage: string;
    function Package: string;
    function GetType: string;
    function Example: string;
    procedure SetFilter(PackageFilter, UsageFilter, TypeFilter: string);
    procedure ClearFilter;
    function FieldByName(FieldName: string): TField;
    procedure LocateClassName(AClassName: string);
    function GetFilter: string;
  end;

  TComponentsInfo = class(TInterfacedObject, IComponentsInfo)
  private
    FDataSet: TDataSet;
    FReset: Boolean;
  protected
    procedure Reset;
    function Next: Boolean;
    function ClassName: string;
    function Description: string;
    function ShortDescription: string;
    function Usage: string;
    function Eof: Boolean;
    function Package: string;
    function GetType: string;
    function Example: string;
    procedure SetFilter(PackageFilter, UsageFilter, TypeFilter: string);
    function FieldByName(FieldName: string): TField;
    procedure LocateClassName(AClassName: string);
    procedure ClearFilter;
    function GetFilter: string;
  public
    constructor Create(ADataSet: TDataSet);
  end;

implementation

uses Windows, dbclient, MidComp;

const
  sBannerFile = 'inetxbanner.jpg';
  BannerWidth = 436;
  BannerHeight = 73;

resourcestring

  sTitle = 'InternetExpress %s';
  sTitleExample = 'InternetExpress %s Example';
  sBanner = 'InternetExpress Center';

  sComponentTable =
  '<table width="100%%">'#13#10 +
  '<tr>'#13#10 +
    '<th align="left"><b><A Name=%0:s>%0:s<A></b>'#13#10 +
    '</th>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td valign="top"><p style="margin-left: 20">%1:s</td>'#13#10 +
  '</tr>'#13#10 +
  '%2:s'#13#10 +
  '%3:s'#13#10 +
'</table>';

sPrimaryExampleTitle = 'Primary Example:';
sOtherExamplesTitle = 'Other Examples:';
sExamplesTitle = 'Examples:';
sComponentExamples =
  '<tr>'#13#10 +
    '<td><p style="margin-left: 20">%0:s</td>'#13#10 +
    '<td valign="top"></td>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 40">%1:s'#13#10 +
     '</td>'#13#10 +
  '</tr>';

  sExampleTable =
  '<table width="100%%">'#13#10 +
  '<tr>'#13#10 +
    '<th align="left"><b><A HREF=%1:s Name=%0:s>%0:s</A>'#13#10 +
    '</th>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td valign="top"><p style="margin-left: 20">%2:s</td>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 20">Components used by this example:</td>'#13#10 +
    '<td valign="top"></td>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 40">%3:s'#13#10 +
     '</td>'#13#10 +
  '</tr>'#13#10 +
'</table>';

  sUsesComponentsAnchorTitle = 'Page Components';
  sUsesComponentsAnchor = 'UsesComponents';
  sUsesComponents =
  '<hr><table width="100%%">'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 0"><b><A Name=%1:s>%0:s</A></b><br>The following components were used to generate this page:</td>'#13#10 +
    '<td valign="top"></td>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 20">%2:s'#13#10 +
     '</td>'#13#10 +
  '</tr>'#13#10 +
'</table>';

  sDescriptionAnchor = 'Description';
  sDescriptionAnchorTitle = 'Page Description';
  sDescription =
  '<hr><table width="100%%">'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 0"><b><A Name=%0:s>Page Description:</A></b></td>'#13#10 +
    '<td valign="top"></td>'#13#10 +
  '</tr>'#13#10 +
  '<tr>'#13#10 +
    '<td><p style="margin-left: 20">%1:s'#13#10 +
     '</td>'#13#10 +
  '</tr>'#13#10 +
'</table>';


type

  TCustomPageElements = class(TMidasPageElements)
  protected
    Banner: string;
    LocalLinks: TStrings;
    List: string;
    Description: string;
    UsesComponents: string;
    GlobalLinks: string;
    Caption: string;
    Instructions: string;
    function FormatLocalLinks: string;
  public
    function BodyContent: string; override;
    constructor Create;
    destructor Destroy; override;
  end;

  TDescriptionPageElements = class(TCustomPageElements)
  protected
    function BodyContent: string; override;
  end;

const

  sBannerTag = 'BANNER';
  sTitleTag = 'TITLE';
  sLinksTag = 'LINKS';
  sDescriptionTag = 'DESCRIPTION';
  sUsesComponentsTag = 'USESCOMPONENTS';
  sComponentsListTag = 'COMPONENTSLIST';
  sExamplesListTag = 'EXAMPLESLIST';
  sDumpRequestTag = 'DUMPREQUEST';
  sComponentDetailsTag = 'COMPONENTDETAILS';



function ModulePath: string;
var
  ModuleName: array[0..255] of Char;
begin
  GetModuleFileName(hinstance, ModuleName, sizeof(ModuleName));
  Result := ExtractFilePath(ModuleName);
end;

function QualifyFileName(var AFileName: string): Boolean;
begin
  if (AFileName <> '') and (ExtractFilePath(AFileName) = '') then
  begin
    Result := True;
    AFileName := ModulePath + AFileName;
  end
  else
    Result := False;
end;

procedure Register;
begin
  RegisterComponents('InternetExpress', [  { do not localize }
    TInetXCenterProducer
  ]);
  RegisterNonActiveX([TInetXCenterProducer], axrIncludeDescendants);
end;

{ TInetXCenterProducer }

function TInetXCenterProducer.GetDefaultTemplate: string;
begin
  Result :=
    '<HTML>'#13#10 +
    '<HEAD>'#13#10 +
    '<#TITLE>'#13#10 +
    '</HEAD>'#13#10 +
    '<BODY>'#13#10 +
    '<#BODYELEMENTS>'#13#10 +
    '</BODY>'#13#10 +
    '</HTML>'#13#10;

end;

procedure TInetXCenterProducer.DoTagEvent(Tag: TTag; const TagString: string;
  TagParams: TStrings; var ReplaceText: string);
begin
  if (Tag = tgCustom) and (CompareText(TagString, sBannerTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).Banner;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sTitleTag) = 0) then
  begin
    ReplaceText := GetTitleElement;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sLinksTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).FormatLocalLinks;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sDescriptionTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).Description;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sComponentsListTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).List;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sExamplesListTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).List;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sDumpRequestTag) = 0) then
  begin
    ReplaceText := GetDumpRequest;
    Exit;
  end
  else if (Tag = tgCustom) and (CompareText(TagString, sUsesComponentsTag) = 0) then
  begin
    ReplaceText := TCustomPageElements(PageElements).UsesComponents;
    Exit;
  end;
  inherited DoTagEvent(Tag, TagString, TagParams, ReplaceText);
end;


function TInetXCenterProducer.GetBanner: string;
var
  Path: string;
begin
  Path := '';
  //Result := Format(sBanner, [Caption]);
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
    if Dispatcher.Request.InternalPathInfo <> '' then
      Path := PathInfoToRelativePath(Dispatcher.Request.InternalPathInfo);

  Result := Format('<P><IMG SRC="%0:s%1:s" ALT="%2:s" WIDTH="%3:d" HEIGHT="%4:d"></P>',
    [Path, sBannerFile, sBanner,
     BannerWidth, BannerHeight]);

end;

function TInetXCenterProducer.FormatGlobalLinks(Topics: array of TTopicPage): string;
  procedure Add(var Result: string; const Value: string);
  begin
    if Result <> '' then
      Result := Result + '</BR>';
    Result := Result + Value;
  end;

var
  I: Integer;
  Producer: TInetXCenterProducer;
begin
  Result := '';
  for I := Low(Topics) to High(Topics) do
  begin
    Producer := FindTopicPage(Topics[I]);
    if Assigned(Producer) then
    begin
      Add(Result, Format('<A HREF="%0:s">%1:s</A>'#13#10,
          [Producer.HRef, Producer.LinkName]));
    end;
  end;
  Result := Format('%s', [Result]);
end;

function TInetXCenterProducer.GetGlobalLinks: string;
begin
  Result := FormatGlobalLinks([topHome, topComponents, topExamples,
    topJavaScript, topXML, topAboutComponents]);
end;

function TInetXCenterProducer.GetTopicName: string;
begin
  Result := 'Topic ' + Name;
end;

function TInetXCenterProducer.GetHREF: string;
begin
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
  begin
    // Assume name is path
    Result := Format('%0:s/%1:s',
      [Dispatcher.Request.InternalScriptName, Name]);
  end
  else
    Result := '';
end;

constructor TInetXCenterProducer.Create(AOwner: TComponent);
begin
  inherited;
  FDescription := TStringList.Create;
  FInstructions := TStringList.Create;
  FClassNames := TStringList.Create;
end;

destructor TInetXCenterProducer.Destroy;
begin
  inherited;
  FDescription.Free;
  FInstructions.Free;
  FClassNames.Free;
end;

procedure TInetXCenterProducer.SetDescription(
  const Value: TStrings);
begin
  FDescription.Assign(Value);
end;

resourcestring
  sFileError = 'Could not access file %s';

function TInetXCenterProducer.GetDescription(ALinks: TStrings): string;
var
  S: string;
  FileStream: TFileStream;
  FileName: string;
begin
  if DescriptionFile <> '' then
  begin
    FileName := DescriptionFile;
    if not (csDesigning in ComponentState) then
       QualifyFileName(FileName);
    try
      FileStream := TFileStream.Create(FileName, fmOpenRead + fmShareDenyWrite);
      try
        with TStringStream.Create('') do
          try
            CopyFrom(FileStream, 0);
            S := DataString;
          finally
            Free;
          end;
      finally
        FileStream.Free;
      end
    except
      S := Format(sFileError, [FileName]);
    end;
  end
  else
    S := Description.Text;

  case PageLayout of
    plStandard:
      if Length(S) > 0 then
      begin
        ALinks.Add(Format('%s=%s', [sDescriptionAnchorTitle, sDescriptionAnchor]));
        Result := Format(sDescription,
         [sDescriptionAnchor, S])
      end
      else
        Result := '';
  else
    Result := S;
  end;
end;

function ComponentLink(ComponentListProducer: TInetXCenterProducer;
  AClassName: string): string;
var
  HRef: string;
begin
  if Assigned(ComponentListProducer) then
    HRef := ComponentListProducer.HRef;
  Result := Format('<A HREF="%0:s?ClassName=%1:s">%1:s</A>'#13#10,
    [HRef, AClassName]);
end;

function TInetXCenterProducer.GetUsesComponents(ALinks: TStrings): string;
var
  ComponentsPage: TInetXCenterProducer;

  procedure AddComponent(var Result: string);
  begin
    if Result <> '' then Result := Result + ', ';
    Result := Result + ComponentLink(ComponentsPage, ComponentsInfoIntf.ClassName);
  end;
var
  Components: string;
begin
  Result := '';
  if not Assigned(ComponentsInfoIntf) then Exit;
  ComponentsPage := FindTopicPage(topComponents);
  GetClassNames;
  ComponentsInfoIntf.ClearFilter;
  ComponentsInfoIntf.Reset;
  while ComponentsInfoIntf.Next do
  begin
    if ClassNames.IndexOf(ComponentsInfoIntf.ClassName) <> -1 then
      AddComponent(Components);
  end;
  if Components <> '' then
  begin
    ALinks.Add(Format('%s=%s', [sUsesComponentsAnchorTitle, sUsesComponentsAnchor]));
    Result := Format(sUsesComponents, [sUsesComponentsAnchorTitle, sUsesComponentsAnchor, Components]);
  end;
end;

procedure TInetXCenterProducer.FindComponents;

  procedure AddComponent(AComponent: TComponent);
  begin
    if ClassNames.IndexOf(AComponent.ClassName) = -1 then
      ClassNames.Add(AComponent.ClassName);
  end;

  procedure TraverseSubComponents(AContainer: TComponent);
  var
    WebComponentContainer: IWebComponentContainer;
    I: Integer;
    ScriptComponent: IScriptComponent;
    SubComponents: TObject;
    Component: TComponent;
  begin
    if AContainer.GetInterface(IScriptComponent, ScriptComponent) then
    begin
      SubComponents := ScriptComponent.SubComponents;
      if Assigned(SubComponents) and SubComponents.GetInterface(IWebComponentContainer, WebComponentContainer) then
      begin
        for I := 0 to WebComponentContainer.ComponentCount - 1 do
        begin
          Component := WebComponentContainer.Components[I];
          AddComponent(Component);
          if Component.GetInterface(IScriptComponent, ScriptComponent) then
            TraverseSubComponents(Component);
        end;
      end;
    end;
  end;
var
  I: Integer;
begin
  //AddComponent(Self);
  if (ClassNames.Count = 0) or
    (csDesigning in ComponentState) then
  begin
    ClassNames.Clear;
    for I := 0 to Self.WebPageItems.Count - 1 do
    begin
      AddComponent(WebPageItems.WebComponents[I]);
      TraverseSubComponents(WebPageItems.WebComponents[I]);
    end;
  end;
end;

procedure TInetXCenterProducer.GetClassNames;
begin
  FindComponents;
end;

function TInetXCenterProducer.FindTopicPage(ATopic: TTopicPage): TInetXCenterProducer;
var
  I: Integer;
begin
  for I := 0 to Owner.ComponentCount - 1 do
  begin
    if (Owner.Components[I] is TInetXCenterProducer) then
    begin
      Result := TInetXCenterProducer(Owner.Components[I]);
      if Result.TopicPage = ATopic then
        Exit;
    end;
  end;
  Result := nil;
end;

function ExampleLink(ExampleListProducer, ExampleProducer: TInetXCenterProducer): string;
begin
(*  This code causes jump to example description
var
  HRef: string;
  if Assigned(ExampleListProducer) then
    HRef := ExampleListProducer.HRef;
  Result := Format('<A HREF="%0:s?Example=%1:s">%1:s</A>'#13#10,
    [HRef, ExampleProducer.LinkName]);
*)
  // Run example
  Result := Format('<A HREF="%0:s">%1:s</A>'#13#10,
    [ExampleProducer.HRef, ExampleProducer.LinkName]);


end;

function TInetXCenterProducer.GetSelectClassName: string;
begin
  Result := '';
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
    with Dispatcher.Request do
    begin
      Result := QueryFields.Values['ClassName'];
      if (Result <> '') and (Copy(Result, 1,1) <> 'T') then
        Result := 'T' + Result;
    end;
end;

function TInetXCenterProducer.GetComponentDetails(ALinks: TStrings): string;
var
  SelectClassName: string;

  function AddComponent(PrimaryExample, OtherExamples: string): string;
  begin
    if PrimaryExample <> '' then
      PrimaryExample := Format(sComponentExamples,
        [sPrimaryExampleTitle, PrimaryExample]);
    if OtherExamples <> '' then
      if PrimaryExample <> '' then
        OtherExamples := Format(sComponentExamples,
          [sOtherExamplesTitle, OtherExamples])
      else
        OtherExamples := Format(sComponentExamples,
          [sExamplesTitle, OtherExamples]);
     Result := Format(sComponentTable,
    [ComponentsInfoIntf.ClassName,
     ComponentsInfoIntf.Description, PrimaryExample, OtherExamples]);
  end;

  function IncludeComponent: Boolean;
  begin
    Result := (SelectClassName = '') or
      (ComponentsInfoIntf.ClassName = SelectClassName);
  end;
var
  Producer, ExamplesList: TInetXCenterProducer;
  I: Integer;
  PrimaryExample, OtherExamples: String;
  Component: TComponent;
  Producers: TList;
begin
  Result := '';
  if not Assigned(ComponentsInfoIntf) then Exit;

  ExamplesList := FindTopicPage(topExamples);
  Producers := TList.Create;
  try
    for I := 0 to Owner.ComponentCount - 1 do
    begin
      if (Owner.Components[I] is TInetXCenterProducer) then
      begin
        Producer := TInetXCenterProducer(Owner.Components[I]);
        if Producer.IsExample then
        begin
          Producer.GetClassNames;
          Producers.Add(Producer);
        end;
      end;
    end;

    SelectClassName := GetSelectClassName;
    ComponentsInfoIntf.Reset;
    while ComponentsInfoIntf.Next do
    begin
      if SelectClassName <> '' then
        ComponentsInfoIntf.LocateClassName(SelectClassName);
      PrimaryExample := '';
      if ComponentsInfoIntf.Example <> '' then
      begin
        Component := Owner.FindComponent(ComponentsInfoIntf.Example);
        if Assigned(Component) and (Component is TInetXCenterProducer) then
        begin
          Producers.Remove(Component);
          PrimaryExample := ExampleLink(ExamplesList, TInetXCenterProducer(Component));
        end;
      end;
      OtherExamples := '';
      for I := 0 to Producers.Count - 1 do
      begin
        Producer := TInetXCenterProducer(Producers[I]);
        if Producer.ClassNames.IndexOf(ComponentsInfoIntf.ClassName) <> -1 then
        begin
          if OtherExamples <> '' then
            OtherExamples := OtherExamples + ', ';
          OtherExamples := OtherExamples + ExampleLink(ExamplesList, Producer);
        end;
      end;
      Result := Result + AddComponent(PrimaryExample, OtherExamples);
      if SelectClassName <> '' then
        Break;
    end;
  finally
    Producers.Free;
  end;
end;

function TInetXCenterProducer.GetExamplesList(ALinks: TStrings): string;
var
  List: TList;
begin
  List := TList.Create;
  try
    GetExampleProducers(List);
    if GetSelectExample = '' then
      Result := { GetExampleSummary(List, ALinks) + } GetExampleDetails(List, ALinks)
    else
      Result := GetExampleDetails(List, ALinks);
  finally
    List.Free;
  end;
end;

function TInetXCenterProducer.GetSelectExample: string;
begin
  Result := '';
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
    with Dispatcher.Request do
      Result := QueryFields.Values['Example'];
end;

function CompareExampleProducer(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(TInetXCenterProducer(Item1).LinkName,
    TInetXCenterProducer(Item2).LinkName);
end;

procedure TInetXCenterProducer.GetExampleProducers(AList: TList);
var
  SelectName: string;

  function IncludeExample(Producer: TInetXCenterProducer): Boolean;
  begin
    Result := (SelectName = '') or
      (Producer.LinkName = SelectName);
  end;
var
  Producer: TInetXCenterProducer;
  I: Integer;
begin
  SelectName := GetSelectExample;

  for I := 0 to Owner.ComponentCount - 1 do
  begin
    if (Owner.Components[I] is TInetXCenterProducer) then
    begin
      Producer := TInetXCenterProducer(Owner.Components[I]);
      if Producer.IsExample then
        if IncludeExample(Producer) then
          AList.Add(Producer);
    end;
  end;
  AList.Sort(CompareExampleProducer);
end;
function TInetXCenterProducer.GetExampleDetails(AProducers: TList; ALinks: TStrings): string;
var
  ComponentsPage: TInetXCenterProducer;
  SelectName: string;

  function AddExample(Producer: TInetXCenterProducer; Components: string): string;
  var
    Description: string;
  begin
    Description := Producer.Description.Text;
    if Description = '' then
      Description := '&nbsp';
    Result := Format(sExampleTable,
     [Producer.LinkName, Producer.HRef,
     Description, Components]);
  end;

  procedure AddComponent(var Result: string);
  begin
    if Result <> '' then Result := Result + ', ';
      Result := Result + ComponentLink(ComponentsPage, ComponentsInfoIntf.ClassName);
  end;

var
  Producer: TInetXCenterProducer;
  I: Integer;
  Components: String;
begin
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
    with Dispatcher.Request do
      SelectName := QueryFields.Values['Example'];

  ComponentsPage := FindTopicPage(topComponents);
  for I := 0 to AProducers.Count - 1 do
  begin
    Producer := TInetXCenterProducer(AProducers[I]);
    Components := '';
    if Assigned(ComponentsInfoIntf) then
    begin
      Producer.GetClassNames;
      ComponentsInfoIntf.Reset;
      while ComponentsInfoIntf.Next do
        if Producer.ClassNames.IndexOf(ComponentsInfoIntf.ClassName) <> -1 then
          AddComponent(Components);
    end;
    Result := Result + AddExample(Producer, Components);
  end;
end;

procedure TInetXCenterProducer.AddTopicLinks(ALinks: TStrings);

  procedure Add(Producer: TInetXCenterProducer);
  begin
    if Assigned(Producer) then
      ALinks.AddObject('', Producer);
  end;
begin
  case TopicPage of
    topComponents:
      Add(FindTopicPage(topComponentsFilter));
  end;
end;

function TInetXCenterProducer.CreatePageElements: TMidasPageElements;
var
  Elements: TCustomPageElements;
begin
  case PageLayout of
    plDescription:     Elements := TDescriptionPageElements.Create;
  else
    Elements := TCustomPageElements.Create;
  end;

  AddTopicLinks(Elements.LocalLinks);
  Elements.Description := GetDescription(Elements.LocalLinks);
  case TopicPage of
    topComponents,
    topComponentsFilter: Elements.List := GetComponentsList(Elements.LocalLinks);
    topExamples: Elements.List := GetExamplesList(Elements.LocalLinks);
  end;
  Elements.UsesComponents := GetUsesComponents(Elements.LocalLinks);
  Elements.Banner := GetBanner;
  Elements.GlobalLinks := GetGlobalLinks;
  Elements.Caption := Caption;
  Elements.Instructions := Instructions.Text;
  Result := Elements;
end;

function TInetXCenterProducer.GetCaption: string;
begin
  Result := '';
  case TopicPage of
    topComponents:
      Result := GetSelectClassName;
    topExamples:
      Result := GetSelectExample;
  end;
  if Result = '' then
    Result := FCaption;
  if Result = '' then
    Result := Name;
end;

function TInetXCenterProducer.GetTitle: string;
begin
  if FTitle = '' then
    Result := DefaultTitle
  else
    Result := FTitle;
end;

function TInetXCenterProducer.DefaultTitle: string;
var
  F: string;
begin
  if IsExample then
    F := sTitleExample
  else
    F := sTitle;
  if FCaption <> '' then
    Result := Format(F, [FCaption])
  else
    Result := Format(F, [Name])
end;

function TInetXCenterProducer.GetTitleElement: string;
begin
  Result := Format('<TITLE>%s</TITLE>', [Title]);
end;

function TInetXCenterProducer.GetDumpRequest: string;

  function AddRow(const Name: string; Value: string): string;
  begin
    if Trim(Value) = '' then
      Value := '&nbsp;';
    Result := Format('<tr><td>%s</td><td>%s</td></tr>', [Name, Value]);
  end;

  function FormatStrings(Value: TStrings): string;
  var
    I: Integer;
  begin
    Result := '';
    if Value.Count > 0 then
    begin
      for I := 0 to Value.Count - 1 do
        Result := Result + AddRow(Value.Names[I], Value.Values[Value.Names[I]]);
      Result := Format('<table border=1 >%s</table>', [Result]);
    end;
  end;

  function FormatString(const Value: string): string;
  begin
    Result := '';
    if Value <> '' then
    begin
      Result := Format('%s'#13#10, [Value]);
    end;
  end;

begin
  if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
  with Dispatcher do
  begin
    Result := Result + AddRow('ContentFields',
      FormatStrings(Request.ContentFields));
    Result := Result + AddRow('QueryFields',
      FormatStrings(Request.QueryFields));
    Result := Result + AddRow('Query',
      FormatString(Request.Query));
    Result := Result + AddRow('PathInfo',
      FormatString(Request.InternalPathInfo));
    Result := Result + AddRow('ScriptName',
      FormatString(Request.InternalScriptName));
    Result := Result + AddRow('Referer',
      FormatString(Request.Referer));
    Result := Result + AddRow('UserAgent',
      FormatString(Request.UserAgent));
    Result := Format(
      '<table border="1" width="100%%">'#13#10 +
      '<tr>'#13#10 +
      '<th align="center" colspan=2>Request Fields</td>'#13#10 +
      '</tr>'#13#10 +
      '%s' +
      '</table>'#13#10, [Result]);
  end;
end;

function TInetXCenterProducer.IsExample: Boolean;
begin
  Result := PageExampleCategories * PageCategories <> [];

end;

function TInetXCenterProducer.GetComponentsInfo: IComponentsInfo;
begin
  if not Assigned(FComponentsInfoIntf) and
    Assigned(FComponentsInfo) then
    FComponentsInfoIntf := TComponentsInfo.Create(FComponentsInfo);
  Result := FComponentsInfoIntf;
end;

procedure TInetXCenterProducer.SetComponentsInfo(
  const Value: TDataSet);
begin
  FComponentsInfo := Value;
  FComponentsInfoIntf := nil;
end;

procedure TInetXCenterProducer.SetCaption(const Value: string);
begin
  if Value = Name then
    FCaption := ''
  else
    FCaption := Value;
end;

procedure TInetXCenterProducer.SetTitle(const Value: string);
begin
  if Value = DefaultTitle then
    FTitle := ''
  else
    FTitle := Value;
end;

function TInetXCenterProducer.GetLinkName: string;
begin
  if FLinkName = '' then
    if FCaption <> '' then
      Result := FCaption
    else
      Result := Name
  else
    Result := FLinkName;
end;

procedure TInetXCenterProducer.SetLinkName(const Value: string);
begin
  if (Value = FCaption) or (Value = Name) then
    FLinkName := ''
  else
    FLinkName := Value;
end;
//{$DEFINE DEBUG}
function TInetXCenterProducer.GetComponentsList(ALinks: TStrings): string;
begin
  if GetSelectClassName = '' then
    Result := GetComponentSummary(ALinks) + GetComponentDetails(ALinks)
  else
    Result := GetComponentDetails(ALinks);
{$IFDEF DEBUG}
  Result := Format('<p><b>ComponentsInfoIntf.Filter=%s<p>',
      [ComponentsInfoIntf.GetFilter]) + Result;
{$ENDIF}
end;
resourcestring
  sComponentSummary =
'<tr><th align="left">%0:s</th></tr>'#13#10 +
'<tr><td valign="top"><p style="margin-left: 20">%1:s</td></tr>';
  sFormGroup = 'Forms';
  sGroupGroup = 'Groups';
  sInputGroup = 'Inputs';
  sButtonGroup = 'Buttons';
  sSpecialGroup = 'Special';
  sUnknownGroup = 'Other';

function TInetXCenterProducer.GetComponentSummary(ALinks: TStrings): string;
type
  TGroup = (gpForm, gpGroup, gpInput, gpButton, gpSpecial, gpUnknown);
const
  GroupKeys: array[TGroup] of string =
    ('Form', 'Group', 'Input', 'Button', 'Special', '');
var
  Groups: array[TGroup] of string;

  procedure AddComponent;
  var
    G: TGroup;
  begin
    for G := Low(TGroup) to High(TGroup) do
      if CompareText(GroupKeys[G], ComponentsInfoIntf.GetType) = 0 then
      begin
        if Groups[G] <> '' then Groups[G] := Groups[G] + ', ';
        Groups[G] := Groups[G] + Format('<A HREF=#%0:s>%0:s</A>',
          [ComponentsInfoIntf.ClassName]);
        break;
      end;
  end;
var
  G: TGroup;
  Title: string;
begin
  Result := '';
  if not Assigned(ComponentsInfoIntf) then Exit;

  ComponentsInfoIntf.Reset;
  while ComponentsInfoIntf.Next do
  begin
    AddComponent;
  end;
  Result := '';
  for G := Low(Groups) to High(Groups) do
  begin
    if Groups[G] <> '' then
    begin
      case G of
        gpForm: Title := sFormGroup;
        gpGroup: Title := sGroupGroup;
        gpButton: Title := sButtonGroup;
        gpSpecial: Title := sSpecialGroup;
        gpUnknown: Title := sUnknownGroup;
        gpInput: Title := sInputGroup;
      else
        Assert(False, 'Unknown group');
      end;
      Result := Result + Format(sComponentSummary, [Title,
        Groups[G]]);
    end;
  end;
  if Result <> '' then
    Result := Format('<table width="100%%">%s</table><hr>', [Result]);
end;

function TInetXCenterProducer.GetExampleSummary(AProducers: TList;
  ALinks: TStrings): string;
var
  Producer: TInetXCenterProducer;

  procedure AddExample(var Result: string);
  begin
    if Result <> '' then Result := Result + ', ';
    Result := Result + Format('<A HREF=#%0:s>%0:s</A>',
    [Producer.LinkName]);
  end;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to AProducers.Count - 1 do
  begin
    Producer := AProducers[I];
    AddExample(Result);
  end;
end;

procedure TInetXCenterProducer.SetInstructions(const Value: TStrings);
begin
  FInstructions.Assign(Value);
end;

{ TDescriptionPageElements }

function TDescriptionPageElements.BodyContent: string;
begin
  Result := inherited BodyContent;
end;

{ TCustomPageElements }

resourcestring
  sStandardPageLayout =
'<Table >'#13#10  +
'<TR><TD VALIGN="CENTER" ALIGN="LEFT" WIDTH="%0:d">%1:s</TD><TD VALIGN="TOP" >%2:s</TD></TR>'#13#10 +
'<TR><TD VALIGN="TOP" ALIGN="LEFT" WIDTH="%0:d">%3:s</TD><TD VALIGN="TOP" >%4:s</TD></TR></TABLE>';

function TCustomPageElements.BodyContent: string;
begin
  Result :=
      IncludesContent +
      StylesContent +
      WarningsContent +
      Format(sStandardPageLayout,
     [{Width} 140,
      {Page Caption}Format('<p><b><i>%s</p>',[ Caption]),
      {Page Banner} Banner,
      {Links}Format('<p>%s</p><p>%s</p>', [GlobalLinks, FormatLocalLinks]),
      { Body }
      '<br>'+
      Instructions +
      FormsContent +
      List +   // Custom
      Description +  // Custom
      UsesComponents   // Custom
      ]) +
      ScriptContent;
end;

constructor TCustomPageElements.Create;
begin
  inherited;
  LocalLinks := TStringList.Create;
end;

destructor TCustomPageElements.Destroy;
begin
  inherited;
  LocalLinks.Free;

end;

function TCustomPageElements.FormatLocalLinks: string;
  procedure Add(HRef, LinkName: string);
  var
    Link: string;
  begin
    Link := Format('<A HREF="%0:s">%1:s</A>'#13#10,
          [HRef, LinkName]);
    if Result <> '' then
      Result := Result + '</BR>';
    Result := Result + Link;
  end;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to LocalLinks.Count - 1 do
  begin
    if Assigned(LocalLinks.Objects[I]) then
      with LocalLinks.Objects[I] as TInetXCenterProducer do
        Add(HREF, LinkName)
    else
      if LocalLinks.Values[LocalLinks.Names[I]] <> '' then
        Add('#'+LocalLinks.Values[LocalLinks.Names[I]], LocalLinks.Names[I])
      else
        Add('#'+LocalLinks[I], LocalLinks[I]);
  end;
end;

{ TComponentsInfo }

function TComponentsInfo.ClassName: string;
begin
  Result := FDataSet.FieldByName('ClassName').AsString;
end;

constructor TComponentsInfo.Create(ADataSet: TDataSet);
var
  F: string;
begin
  inherited Create;
  FDataSet := ADataSet;
  if not (csDesigning in ADataSet.ComponentState) then
  begin
    if ADataSet is TClientDataSet then
      with TClientDataSet(ADataSet) do
      begin
        F := FileName;
        if QualifyFileName(F) then
        begin
          ADataSet.Active := False;
          FileName := F;
        end;
      end;
  end;
  Reset;
end;

procedure TComponentsInfo.Reset;
begin
  FDataSet.Active := True;
  FDataSet.First;
  FReset := True;
end;

function TComponentsInfo.Next: Boolean;
begin
  if (not FReset) and (not Eof) then
    FDataSet.Next;
  FReset := False;
  Result := not Eof;
end;

function TComponentsInfo.Eof: Boolean;
begin
  Result := FDataSet.Eof;
end;

function TComponentsInfo.ShortDescription: string;
begin
  Result := FDataSet.FieldByName('ShortDescription').AsString;
end;

function TComponentsInfo.Usage: string;
begin
  Result := FDataSet.FieldByName('Usage').AsString;
end;

function TComponentsInfo.Description: string;
begin
  Result := FDataSet.FieldByName('Description').AsString;
  if Trim(Result) = '' then
    Result := FDataSet.FieldByName('ShortDescription').AsString;
end;

function TComponentsInfo.FieldByName(FieldName: string): TField;
begin
  Result := FDataSet.FieldByName(FieldName);
end;

function TComponentsInfo.GetType: string;
begin
    Result := FDataSet.FieldByName('Type').AsString;
end;

function TComponentsInfo.Package: string;
begin
    Result := FDataSet.FieldByName('Package').AsString;

end;

procedure TComponentsInfo.SetFilter(PackageFilter, UsageFilter, TypeFilter: string);
  procedure AddFilter(var S: string; Value: string);
  begin
    if S <> '' then
      S := S + ' and ';
    S := S + Value;
  end;

  function CreateFilter: string;
  begin
    Result := '';
    if PackageFilter <> 'All' then
      if PackageFilter = 'Custom' then
        AddFilter(Result,
          '(Package <> ''Standard'') and (Usage <> '''')')
      else
        AddFilter(Result,
          Format('Package = ''%s''', [PackageFilter]));
    if UsageFilter <> 'All' then
    begin
      if (UsageFilter = 'XMLData') or (UsageFilter = 'Query') then
        AddFilter(Result,
          Format('(Usage = ''%s'' or Usage = ''Layout'')', [UsageFilter]))
      else
        AddFilter(Result,
          Format('Usage = ''%s''', [UsageFilter]));
    end;
    if TypeFilter <> 'All' then
      AddFilter(Result,
        Format('Type = ''%s''', [TypeFilter]));
  end;
begin
  FDataSet.Filter := CreateFilter;
  FDataSet.Filtered := True;
end;

function TComponentsInfo.Example: string;
begin
  Result := FDataSet.FieldByName('Example').AsString;
end;

procedure TComponentsInfo.LocateClassName(AClassName: string);
begin
  FDataSet.Locate('ClassName', AClassName, []);
end;

procedure TComponentsInfo.ClearFilter;
begin
  FDataSet.Filtered := False;
  FDataSet.Filter := '';
end;

function TComponentsInfo.GetFilter: string;
begin
  Result := FDataSet.Filter;
end;

initialization
finalization
  UnRegisterWebComponents([
    TInetXCenterProducer]);
end.
