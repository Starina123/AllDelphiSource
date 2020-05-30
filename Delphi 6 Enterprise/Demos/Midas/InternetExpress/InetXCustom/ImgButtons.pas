unit ImgButtons;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, PagItems, MidItems, MidComp;

type

  IImgComponent = interface
  ['{15480205-25A4-11D3-B007-00C04FB16EC3}']
    procedure SetPathURL(APath: string);
  end;

  TImgDataNavigator = class(TDataNavigator)
  private
    FImagePathURL: string;
    procedure SetImagePathURL(const Value: string);
  protected
    procedure GetDefaultButtons; override;
    function ImplContent(Options: TWebContentOptions; ParentLayout: TLayout): string; override;
  published
    property ImagePathURL: string read FImagePathURL write SetImagePathURL;
  end;

  TImgDataSetButton = class(TXMLDisplayReferenceButton, IImgComponent,
    IScriptComponent)
  private
    FSrc: string;
    FAlt: string;
    FBorder: Boolean;
    FPathURL: string;
  protected
    DefaultAlt: string;
    DefaultSrc: string;
    XMLMethodName: string;
     { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements);
    function GetSubComponents: TObject;
   { IWebContent implementation }
    function ImplContent(Options: TWebContentOptions; ParentLayout: TLayout): string; override;
    { IImgComponent }
    procedure SetPathURL(APath: string);

    function GetAlt: string;
    function GetSrc: string;
    function GetMethodName: string; virtual;
    function GetSrcUrl: string;
  published
    property XMLComponent;
    property XMLUseParent;
    property Style;
    property Custom;
    property Alt: string read GetAlt write FAlt;
    property StyleRule;
    property Src: string read GetSrc write FSrc;
    property Border: Boolean read FBorder write FBorder;
  end;

  TImgFirstButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgLastButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgPriorButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgNextButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgPriorPageButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgNextPageButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgUndoButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgDeleteButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgInsertButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgPostButton = class(TImgDataSetButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TImgXMLButton = class(TXMLButton, IImgComponent)
  private
    FPathURL: string;
    FAlt: string;
    FSrc: string;
    FBorder: Boolean;
    function GetAlt: string;
    function GetSrc: string;
  protected
    DefaultAlt: string;
    DefaultSrc: string;
    function GetSrcUrl: string;
    { IImgComponent }
    procedure SetPathURL(APath: string);
  published
    property Custom;
    property Alt: string read GetAlt write FAlt;
    property Style;
    property StyleRule;
    property XMLBroker;
    property XMLUseParent;
    property Src: string read GetSrc write FSrc;
    property Border: Boolean read FBorder write FBorder;
  end;

  TImgApplyUpdatesButton = class(TImgXMLButton, IScriptComponent)
  protected
    { IWebContent implementation }
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements);
    function GetSubComponents: TObject;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses WebConst, SysUtils, MidProd;

const
  DefaultGridButtons: array[0..10] of TWebButtonClass =
  (TImgFirstButton, TImgPriorPageButton, TImgPriorButton, TImgNextButton,
  TImgNextPageButton, TImgLastButton, TImgInsertButton, TImgDeleteButton,
  TImgUndoButton, TImgPostButton, TImgApplyUpdatesButton);

  DefaultFormButtons: array[0..8] of TWebButtonClass =
  (TImgFirstButton, TImgPriorButton, TImgNextButton,
  TImgLastButton, TImgInsertButton, TImgDeleteButton,
  TImgUndoButton, TImgPostButton, TImgApplyUpdatesButton);

resourcestring
  sFirstButton = 'First';
  sLastButton = 'Last';
  sPriorButton = 'Prior';
  sNextButton = 'Next';
  sPriorPageButton = 'Prior Page';
  sNextPageButton = 'Next Page';
  sDeleteButton = 'Delete';
  sInsertButton = 'Insert';
  sUndoButton = 'Undo';
  sPostButton = 'Post';
  sApplyUpdates = 'Apply Updates';
  sXMLComponentNotDefined = '%s.XMLComponent = nil';

procedure TImgDataNavigator.GetDefaultButtons;
var
  XMLDisplay: TComponent;
  Intf: IXMLDisplay;
  Count: Integer;
  Grid: Boolean;
begin
  Grid := False;
  XMLDisplay := GetWebDisplayComponent;
  if Assigned(XMLDisplay) then
    if XMLDisplay.GetInterface(IXMLDisplay, Intf) then
      Grid := Intf.IsMultipleRecordView;
  if Grid then
    Count := Length(DefaultGridButtons)
  else
    Count := Length(DefaultFormButtons);
  if Assigned(DefaultWebComponents) and
    (DefaultWebComponents.Count <> Count) then
  begin
    DefaultWebComponents.Free;
    DefaultWebComponents := nil;
  end;
  if not Assigned(DefaultWebComponents) then
  begin
    DefaultWebComponents := TWebComponentList.Create(Self);
    if Grid then
      CreateDefaultButtonClasses(DefaultGridButtons, WebFieldControls)
    else
      CreateDefaultButtonClasses(DefaultFormButtons, WebFieldControls)
  end;
end;

function TImgDataNavigator.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;

var
  Path: string;
  Button: TComponent;
  I: Integer;
  ImgComponent: IImgComponent;
  Dispatcher: IWebDispatcherAccess;
begin
  // Initialize image paths
  Path := ImagePathURL;
  if (not (csDesigning in ComponentState)) and (Path = '') then
  begin
    if Path = '' then
    begin
      Dispatcher := FindDispatcher(Self);
      if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
        Path := PathInfoToRelativePath(Dispatcher.Request.PathInfo);
    end;
  end;
  for I := 0 to VisibleButtons.Count - 1 do
  begin
    Button := VisibleButtons.WebComponents[I];
    if Button.GetInterface(IImgComponent, ImgComponent) then
      ImgComponent.SetPathURL(Path);
  end;
  Result := inherited ImplContent(Options, ParentLayout);
end;

procedure TImgDataNavigator.SetImagePathURL(const Value: string);
var
  NewValue: string;
begin
  if Value <> '' then
  begin
    NewValue := DosPathToUnixPath(Value);
    if not IsDelimiter('/', NewValue, Length(NewValue)) then
      NewValue := NewValue + '/';
  end;
  FImagePathURL := NewValue;
end;


{ TImgDataSetButton }


function TImgDataSetButton.GetAlt: string;
begin
  if FAlt = '' then
    Result := DefaultAlt
  else
    Result := FAlt;
end;

function TImgDataSetButton.GetMethodName: string;
begin
  Result := XMLMethodName;
end;

function TImgDataSetButton.GetSrc: string;
begin
  if FSrc = '' then
    Result := DefaultSrc
  else
    Result := FSrc;
end;

function TImgDataSetButton.GetSrcUrl: string;
begin
  Result := FPathURL + Src;
end;

procedure TImgDataSetButton.AddElements(AddIntf: IAddScriptElements);
begin
  if (XMLComponent = nil) and (Self.Name <> '') then
    AddIntf.AddError(Format(sXMLComponentNotDefined, [Self.Name]));
end;

function TImgDataSetButton.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  Attrs: string;
  Intf: ILayoutWebContent;
begin
  //AddQuotedAttrib(Attrs, 'NAME', Name);
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddQuotedAttrib(Attrs, 'ALT', Alt);
  AddQuotedAttrib(Attrs, 'SRC', GetSrcUrl);
  AddCustomAttrib(Attrs, Custom);
  if not Border then
    AddStringAttrib(Attrs, 'BORDER', '0');
  if not (coNoScript in Options.Flags) then
  begin
    Result :=
      Format('<A HREF="" onclick=''if(%3:s)%1:s.%2:s();return false;''><IMG %0:s/></A>'#13#10,
        [Attrs, Self.GetXmlDisplayName, Self.GetMethodName, sXMLReadyVar]);
  end
  else
    Result :=
      Format('<A><IMG %0:s/></A>'#13#10,
        [Attrs]);
  if Assigned(ParentLayout) and ParentLayout.GetInterface(ILayoutWebContent, Intf) then
    Result := Intf.LayoutButton(Result, GetLayoutAttributes);
end;

procedure TImgDataSetButton.SetPathURL(APath: string);
begin
  FPathURL := APath;
end;

function TImgDataSetButton.GetSubComponents: TObject;
begin
  Result := nil;
end;

{ TImgFirstButton }

constructor TImgFirstButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sFirstButton;
  DefaultSrc := 'first.gif';
  XMLMethodName := 'first';
end;

{ TImgLastButton }

constructor TImgLastButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sLastButton;
  DefaultSrc := 'last.gif';
  XMLMethodName := 'last';
end;

{ TImgPriorButton }

constructor TImgPriorButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sPriorButton;
  DefaultSrc := 'prior.gif';
  XMLMethodName := 'up';
end;

{ TImgNextButton }

constructor TImgNextButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sNextButton;
  DefaultSrc := 'next.gif';
  XMLMethodName := 'down';
end;

{ TImgPriorPageButton }

constructor TImgPriorPageButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sPriorPageButton;
  DefaultSrc := 'priorpage.gif';
  XMLMethodName := 'pgup';
end;

{ TImgNextPageButton }

constructor TImgNextPageButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sNextPageButton;
  DefaultSrc := 'nextpage.gif';
  XMLMethodName := 'pgdown';
end;

{ TImgUndoButton }

constructor TImgUndoButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sUndoButton;
  DefaultSrc := 'undo.gif';
  XMLMethodName := 'undo';
end;

{ TImgDeleteButton }

constructor TImgDeleteButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sDeleteButton;
  DefaultSrc := 'delete.gif';
  XMLMethodName := 'removeRow';
end;

{ TImgInsertButton }

constructor TImgInsertButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sInsertButton;
  DefaultSrc := 'insert.gif';
  XMLMethodName := 'newRow';
end;

{ TImgPostButton }

constructor TImgPostButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sPostButton;
  DefaultSrc := 'post.gif';
  XMLMethodName := 'post';
end;

{ TImgXMLButton }

function TImgXMLButton.GetAlt: string;
begin
  if FAlt = '' then
    Result := DefaultAlt
  else
    Result := FAlt;
end;

function TImgXMLButton.GetSrc: string;
begin
  if FSrc = '' then
    Result := DefaultSrc
  else
    Result := FSrc;
end;

function TImgXMLButton.GetSrcUrl: string;
begin
  Result := FPathURL + Src;
end;


procedure TImgXMLButton.SetPathURL(APath: string);
begin
  FPathURL := APath;
end;

{ TImgApplyUpdatesButton }

procedure TImgApplyUpdatesButton.AddElements(AddIntf: IAddScriptElements);
begin
  DeclareSubmitForm(Self, XMLData.XMLBroker, AddIntf);
end;

constructor TImgApplyUpdatesButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultAlt := sApplyUpdates;
  DefaultSrc := 'applyupdates.gif';
end;

function TImgApplyUpdatesButton.GetSubComponents: TObject;
begin
  Result := nil;
end;

function TImgApplyUpdatesButton.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  Attrs: string;
  Intf: ILayoutWebContent;
  FormVarName: string;
  RowSetVarName: string;
begin
  AddQuotedAttrib(Attrs, 'NAME', Name);
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddQuotedAttrib(Attrs, 'ALT', Alt);
  AddQuotedAttrib(Attrs, 'SRC', GetSrcUrl);
  AddCustomAttrib(Attrs, Custom);
  if not Border then
    AddStringAttrib(Attrs, 'BORDER', '0');
  if Assigned(XMLData.XMLBroker) then
  begin
    FormVarName := XMLData.XMLBroker.SubmitFormVarName;
    RowSetVarName := XMLData.XMLBroker.RowSetVarName(nil);  
  end;
  if not (coNoScript in Options.Flags) then
  begin
    Result :=
      Format('<A HREF="" onclick=''if(%3:s)%1:s.Apply(%2:s, %2:s.postdelta);return false;''><IMG %0:s/></A>'#13#10,
        [Attrs, RowSetVarName, FormVarName,sXMLReadyVar]);
  end
  else
    Result :=
      Format('<A><IMG %0:s/></A>'#13#10,
        [Attrs]);
  if Assigned(ParentLayout) and ParentLayout.GetInterface(ILayoutWebContent, Intf) then
    Result := Intf.LayoutButton(Result, GetLayoutAttributes);
end;

end.
