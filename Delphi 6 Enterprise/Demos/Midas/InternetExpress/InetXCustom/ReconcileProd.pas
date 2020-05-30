unit ReconcileProd;

interface

uses MidProd, WebComp, HTTPApp, Classes, XmlBrokr, MidItems, HTTPProd;

type
  TReconcileGrid = class;
  TReconcilePageElements = class;
  TReconcilePageProducer = class(TCustomMidasPageProducer)
  private
    FReconcileGrid: TReconcileGrid;
    FXMLBroker: TXMLBroker;
    procedure SetReconcileGrid(const Value: TReconcileGrid);
  protected
    procedure DoTagEvent(Tag: TTag; const TagString: string; TagParams: TStrings;
      var ReplaceText: string); override;
    procedure GeneratePageElements; override;
    function CreatePageElements: TMidasPageElements; override;
    procedure AddIncludes; override;
    function DeclareRowSets: string; override;
    procedure AddScriptComponents; override;
    function DeclareXMLDocuments: string; override;
    function DeclareXMLIslands: string; override;
    procedure GetXMLInfo(
      var XMLBrokerName, XMLErrors, XMLDelta: string;
        XMLOptions: TXMLOptions);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property HTMLDoc;
    property HTMLFile;
    property IncludePathURL;
    property OnBeforeGetContent;
    property OnAfterGetContent;
    property Styles;
    property StylesFile;
    property WebPageItems;
    property EnableXMLIslands;
    property ReconcileGrid: TReconcileGrid read FReconcileGrid write SetReconcileGrid;
  end;

  TReconcileColumn = class;
  TReconcileGrid = class(TPersistent)
  private
    FDisplayRows: Integer;
    FTableAttributes: TGridAttributes;
    FHeadingAttributes: TGridRowAttributes;
    FRowAttributes: TGridRowAttributes;
    FFieldNameColumn: TReconcileColumn;
    FModifiedColumn: TReconcileColumn;
    FConflictingColumn: TReconcileColumn;
    FOriginalColumn: TReconcileColumn;
    function GetColumn(I: Integer): TReconcileColumn;
    function GetColumnCount: Integer;
    procedure SetConflictingColumn(const Value: TReconcileColumn);
    procedure SetFieldNameColumn(const Value: TReconcileColumn);
    procedure SetModifiedColumn(const Value: TReconcileColumn);
    procedure SetOriginalColumn(const Value: TReconcileColumn);
  protected
    function HTMLTableName: string;
    function FormatTable(Layout: TLayoutWebContent;
      Options: TWebContentOptions): string;
    procedure SetTableAttributes(const Value: TGridAttributes);
    procedure SetHeadingAttributes(
      const Value: TGridRowAttributes);
    procedure SetRowAttributes(
      const Value: TGridRowAttributes);
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    property ColumnCount: Integer read GetColumnCount;
    property Column[I: Integer]: TReconcileColumn read GetColumn;
  published
    property DisplayRows: Integer read FDisplayRows write FDisplayRows default 4;
    property TableAttributes: TGridAttributes read FTableAttributes
      write SetTableAttributes;
    property HeadingAttributes: TGridRowAttributes read FHeadingAttributes
      write SetHeadingAttributes;
    property RowAttributes: TGridRowAttributes read FRowAttributes
      write SetRowAttributes;
    property ConflictingColumn: TReconcileColumn read FConflictingColumn write SetConflictingColumn;
    property FieldNameColumn: TReconcileColumn read FFieldNameColumn write SetFieldNameColumn;
    property ModifiedColumn: TReconcileColumn read FModifiedColumn write SetModifiedColumn;
    property OriginalColumn: TReconcileColumn read FOriginalColumn write SetOriginalColumn;
  end;

  TReconcileColumn = class(TPersistent)
  private
    FCaption: string;
    FStyle: string;
    FStyleRule: string;
    FCustom: string;
    FCaptionAttributes: TCaptionAttributes;
    FDisplayWidth: integer;
    FMaxWidth: integer;
    FName: string;
    FEvents: string;
    procedure SetCaptionAttributes(const Value: TCaptionAttributes);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    property Name: string read FName write FName;
    property Events: string read FEvents write FEvents;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function ControlContent(Options: TWebContentOptions): string;
    function GetHTMLControlName: string;
  published
    property Caption: string read FCaption write FCaption;
    property Custom: string read FCustom write FCustom;
    property Style: string read FStyle write FStyle;
    property MaxWidth: Integer read FMaxWidth write FMaxWidth default -1;
    property CaptionAttributes: TCaptionAttributes
      read FCaptionAttributes write SetCaptionAttributes;
    property DisplayWidth: integer read FDisplayWidth write FDisplayWidth;
    property StyleRule: string read FStyleRule write FStyleRule;
  end;

  TFieldNameColumn = class(TReconcileColumn)
  public
    constructor Create(AOwner: TComponent);
  end;

  TModifiedColumn = class(TReconcileColumn)
  public
    constructor Create(AOwner: TComponent);
  end;

  TConflictingColumn = class(TReconcileColumn)
  public
    constructor Create(AOwner: TComponent);
  end;

  TOriginalColumn = class(TReconcileColumn)
  public
    constructor Create(AOwner: TComponent);
  end;

  TReconcilePageElements = class(TMidasPageElements)
  public
    ReconcileGridContent: string;
  end;

implementation

uses ScrptMgr, SysUtils, WbmConst;

const
  sXMLBroker = 'XMLBROKER';
  sErrorPacketTag = 'ERRORPACKET';
  sDeltaPacketTag = 'DELTAPACKET';
  sReconcileGridTag = 'RECONCILEGRID';
  sQuoteXMLAttribute = 'QUOTE';
  sQuoteXML = sQuoteXMLAttribute + '="True"'; // Do not localize
  sDefaultXMLBrokerName = 'XMLBroker1';

resourcestring 
  sFieldNameCaption = 'Field Name';
  sModifiedCaption = 'Submitted Value';
  sConflictingCaption = 'Conflicting Value';
  sOriginalCaption = 'Original Value';

{ TReconcilePageProducer }

procedure TReconcilePageProducer.DoTagEvent(Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
var
  XMLBroker: TXMLBroker;
  XMLOptions: TXMLOptions;
begin
  if not (csDesigning in ComponentState) then
    if (Tag = tgCustom) and (CompareText(TagString, sDeltaPacketTag) = 0) then
    begin
      XMLOptions := [];
      if CompareText(TagParams.Values[sQuoteXMLAttribute], 'True') = 0 then
        XMLOptions := XMLOptions + [xoQuote];
      XMLBroker := FindXMLBroker(TagParams);
      if Assigned(XMLBroker) then
        ReplaceText :=
          FormatXML(XMLBroker.GetDelta(Dispatcher.Request),
            XMLOptions);
      Exit;
    end
    else if (Tag = tgCustom) and (CompareText(TagString, sErrorPacketTag) = 0) then
    begin
      XMLOptions := [];
      if CompareText(TagParams.Values[sQuoteXMLAttribute], 'True') = 0 then
        XMLOptions := XMLOptions + [xoQuote];
      XMLBroker := FindXMLBroker(TagParams);
      if Assigned(XMLBroker) then
        ReplaceText := FormatXML(XMLBroker.GetErrors, XMLOptions);
      Exit;
    end;

  if (Tag = tgCustom) and (CompareText(TagString, sReconcileGridTag) = 0) then
  begin
    if Assigned(PageElements) then
      ReplaceText := (PageElements as TReconcilePageElements).ReconcileGridContent;
    Exit;
  end;
  inherited DoTagEvent(Tag, TagString, TagParams, ReplaceText);
end;

procedure TReconcilePageProducer.AddIncludes;
var
  StdIncludes: TStdIncludes;
begin
  StdIncludes := [jsDb, jsErrDisp];
  if not GetUseXMLIslands then
    StdIncludes := StdIncludes + [jsDom];
  AddStdIncludes(StdIncludes, ScriptManager.GetAddElementsIntf);
end;

function TReconcilePageProducer.CreatePageElements: TMidasPageElements;
begin
  Result := TReconcilePageElements.Create;
end;

const
  sErrXMLVarName = 'xmlErrStr';
  sDeltaXMLVarName = 'xmlDeltaStr';
  sErrDocVarName = 'xmlErrDoc';
  sDeltaDocVarName = 'xmlDeltaDoc';

procedure TReconcilePageProducer.GeneratePageElements;
  function FindXMLBroker: TXMLBroker;
  var
    I: Integer;
  begin
    for I := 0 to Owner.ComponentCount - 1 do
      if Owner.Components[I] is TXMLBroker then
      begin
        Result := TXMLBroker(Owner.Components[I]);
        if Result.GetErrors <> '' then  Exit;
      end;
    Result := nil;
  end;

begin
  if csDesigning in ComponentState then
    FXMLBroker := nil
  else
    FXMLBroker := FindXMLBroker;
  try
    inherited GeneratePageElements;
    (PageElements as TReconcilePageElements).ReconcileGridContent :=
      FReconcileGrid.FormatTable(nil, ScriptManager.Options);
  finally
    FXMLBroker := nil;
  end;
end;

resourcestring
  sErrorMessage = 'Error message:';
  sOn =           'on';
  sCancel = 'Cancel';
  sCorrect = 'Correct';
  sMerge = 'Merge';
  sPrevRow = '<';
  sNextRow = '>';
  sPostNext = 'Post/Next';
  sReapply = 'Reapply Updates';
  sReconcileAction = 'Reconcile Action';

const
  sDefaultHTMLDoc =
    '<HTML>'#13#10 +
    '<HEAD>'#13#10 +
    '</HEAD>'#13#10 +
    '<BODY>'#13#10 +
    '<#INCLUDES><#STYLES><#WARNINGS>'#13#10 +
    '<P>'#13#10 +
    '<FORM name="FORM1">'#13#10 +
    '<TABLE>'#13#10 +
    '<TR>'#13#10 +
    '<TD valign=top><H3>%0:s</H3></TD>'#13#10 +
    '<TD valign=top><textarea name="ErrMessage" rows=2 cols=58 readonly onfocus=''blur();''></textarea></TD>'#13#10 +
    '<TD valign=top><H3>%1:s</H3></TD>'#13#10 +
    '<TD valign=top><input type=text name="ErrAction" size=12 readonly onfocus=''blur();''/></TD>'#13#10 +
    '</TR>'#13#10 +
    '</TABLE>'#13#10 +
    '<P>'#13#10 +
    '<#RECONCILEGRID>'#13#10 +
    '</FORM>'#13#10 +
    '<P>'#13#10 +
    '<FORM>'#13#10 +
    '<H3> %9:s </H3>'#13#10 +
    '<input type=radio name="action" value="Cancel" onclick=''if(self.grid1!=null)grid1.cancel();''/> %2:s'#13#10 +
    '<input type=radio name="action" value="Correct" onclick=''if(self.grid1!=null)grid1.correct();''/> %3:s'#13#10 +
    '<input type=radio name="action" value="Merge" onclick=''if(self.grid1!=null)grid1.merge();''/> %4:s'#13#10 +
    '<P>'#13#10 +
    '<input type=button value="%5:s" onclick=''if(self.grid1!=null)grid1.up();'' />'#13#10 +
    '<input type=button value="%6:s" onclick=''if(self.grid1!=null)grid1.down();'' />'#13#10 +
    '<input type=button value="%7:s" onclick=''if(self.grid1!=null)grid1.post();''/>'#13#10 +
    '<P>'#13#10 +
    '<input type=button value="%8:s" onclick=''if(self.grid1!=null)grid1.Reapply(Submitfrm1, Submitfrm1.postdelta);''/>'#13#10 +
    '</FORM>'#13#10 +
    '<#FORMS><#SCRIPT>'#13#10 +
    '</BODY>'#13#10 +
    '</HTML>'#13#10;

constructor TReconcilePageProducer.Create(AOwner: TComponent);
begin
  inherited;
  FReconcileGrid := TReconcileGrid.Create(Self);
  HTMLDoc.Text := Format(sDefaultHTMLDoc,
    [sErrorMessage, sOn, sCancel, sCorrect, sMerge,
     sPrevRow, sNextRow, sPostNext, sReapply, sReconcileAction]);
end;

destructor TReconcilePageProducer.Destroy;
begin
  inherited;
  FReconcileGrid.Free;

end;

procedure TReconcilePageProducer.GetXMLInfo(
  var XMLBrokerName, XMLErrors, XMLDelta: string;
    XMLOptions: TXMLOptions);
begin
  XMLErrors := '';
  XMLDelta := '';
  if Assigned(FXMLBroker) then
  begin
    XMLErrors := FormatXML(FXMLBroker.GetErrors, XMLOptions);
    if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
      XMLDelta := FormatXML(FXMLBroker.GetDelta(Dispatcher.Request),
        XMLOptions);
    XMLBrokerName := FXMLBroker.Name;
  end
  else
    XMLBrokerName := sDefaultXMLBrokerName;
end;

function TReconcilePageProducer.DeclareXMLDocuments: string;

  function DeclareXMLDocument(const XMLBrokerName, XmlVarName, DocVarName,
    TagName, XMLData: string): string;
  begin
    Result := '';
    Result := Format('%svar %s = '#13#10, [Result, XMLVarName]);
    if (csDesigning in ComponentState) or (XMLData = '') then
      Result := Format('%s<#%s %s=%s %s>;'#13#10,
        [Result, TagName, sXMLBroker, XMLBrokerName, sQuoteXML])
    else
      Result := Format('%s%s;'#13#10, [Result, XMLData]);;
    Result := Format('%svar %s = new Document(%s);'#13#10,
     [Result, DocVarName, XMLVarName]);
  end;

var
  XMLBrokerName: string;
  XMLErrors, XMLDelta: string;
begin
  GetXMLInfo(XMLBrokerName, XMLErrors, XMLDelta, [xoQuote]);
  Result := Result +
    DeclareXMLDocument(XMLBrokerName, sErrXMLVarName, sErrDocVarName, sErrorPacketTag,
    XMLErrors );
  Result := Result +
    DeclareXMLDocument(XMLBrokerName, sDeltaXMLVarName, sDeltaDocVarName, sDeltaPacketTag,
    XMLDelta);
end;

function TReconcilePageProducer.DeclareXMLIslands: string;
  function DeclareXMLIsland(const XMLBrokerName, DocVarName, TagName, XMLData: string): string;
  begin
    Result := '';
    Result := Format('%s<XML ID=%s>'#13#10, [Result, DocVarName]);
    if (csDesigning in ComponentState) or (XMLData = '') then
      Result := Format('%s<#%s %s=%s>'#13#10,
        [Result, TagName, sXMLBroker, XMLBrokerName])
    else
      Result := Format('%s%s', [Result, XMLData]);
    Result := Result + #13#10'</XML>'#13#10;
  end;
var
  XMLBrokerName: string;
  XMLErrors, XMLDelta: string;
begin
  GetXMLInfo(XMLBrokerName, XMLErrors, XMLDelta, []);
  Result :=
    DeclareXMLIsland(XMLBrokerName, sErrDocVarName, sErrorPacketTag,
    XMLErrors);
  Result := Result +
    DeclareXMLIsland(XMLBrokerName, sDeltaDocVarName, sDeltaPacketTag,
    XMLDelta);
end;

function TReconcilePageProducer.DeclareRowSets: string;
begin
  Result := Format(
    'var rowsetErr = new xmlRowSet(%0:s, null, null);'#13#10 +      // do not localize
    'var rowsetDelta = new xmlRowSet(%1:s, null, null);'#13#10 +
    'var frm1 = document.forms[''FORM1''];'#13#10 +
    'var grid1 = new ErrReconcile(rowsetDelta,rowsetErr,'#13#10 +
    '   new Array(frm1.col_FieldName,frm1.col_Modified,frm1.col_Conflicting,frm1.col_Original),'#13#10 +
    '   new Array("FieldName","Modified","Conflicting","Original"),'#13#10 +
    '   frm1.ErrMessage,frm1.ErrAction);'#13#10 +
    '   grid1.setFocus(0,1);'#13#10,
    [sErrDocVarName, sDeltaDocVarName]);
end;

const
  sSubmitFormName = 'Submitfrm1'; // Do not localize

procedure TReconcilePageProducer.AddScriptComponents;
  procedure DeclareSubmitForm;
  const
    Indent1 = '  ';
  var
    PathInfo: string;
    Redirect: string;
    HTMLSubmitFormName: string;
    SubmitFormVarName: string;
    XMLBrokerName: string;
    Forms: string;
  begin
    Forms := '';
    HTMLSubmitFormName := sSubmitFormName;
    SubmitFormVarName := sSubmitFormName;
    if Assigned(FXMLBroker) then
    begin
      PathInfo := FXMLBroker.WebDispatch.PathInfo;
      XMLBrokerName := FXMLBroker.Name;
    end
    else
    begin
      PathInfo := '';
      XMLBrokerName := sDefaultXMLBrokerName;
    end;
    if Copy(PathInfo, 1, 1) = '/' then
      Delete(PathInfo, 1, 1);
    if Assigned(Dispatcher) and Assigned(Dispatcher.Request) then
      PathInfo := Dispatcher.Request.InternalScriptName + '/' + PathInfo;
    Forms := Forms +
      Format('<FORM NAME=%0:s ACTION="%1:s" METHOD="POST">'#13#10,
        [HTMLSubmitFormName, PathInfo]);
    Forms := Forms +
      Format('%0:s<INPUT TYPE=HIDDEN NAME="%1:s" VALUE="%2:s">'#13#10,
        [Indent1, sXMLBroker, XMLBrokerName]);
    Forms := Forms +
      Format('%0:s<INPUT TYPE=HIDDEN NAME="%1:s">'#13#10,
        [Indent1, SPostDelta]);
    Forms := Forms +
      Format('%0:s<INPUT TYPE=HIDDEN NAME="%1:s" VALUE="%2:s">'#13#10,
        [Indent1, sProducer, Self.Name]);
    if (Dispatcher <> nil) and (Dispatcher.Request <> nil) then
    begin
      Redirect := Dispatcher.Request.ContentFields.Values[SRedirect];
      Forms := Forms +
        Format('%0:s<INPUT TYPE=HIDDEN NAME="%1:s" VALUE="%2:s">'#13#10,
          [Indent1, sRedirect, Redirect]);
    end;
    Forms := Forms + '</FORM>'#13#10;
    ScriptManager.GetAddElementsIntf.AddHTMLBlock(HTMLSubmitFormName, Forms);
    ScriptManager.GetAddElementsIntf.AddVar(SubmitFormVarName,
       Format('var %0:s = document.forms[''%1:s''];'#13#10,
      [SubmitFormVarName, HTMLSubmitFormName]));
  end;

begin
  inherited;
  DeclareSubmitForm;
end;

procedure TReconcilePageProducer.SetReconcileGrid(
  const Value: TReconcileGrid);
begin
  FReconcileGrid.Assign(Value);
end;

{ TReconcileGrid }

constructor TReconcileGrid.Create(AOwner: TComponent);
begin
  inherited Create;
  FDisplayRows := 4;
  FTableAttributes := TGridAttributes.Create(AOwner);
  FHeadingAttributes := TGridRowAttributes.Create(AOwner);
  FRowAttributes := TGridRowAttributes.Create(AOwner);

  FTableAttributes.Border := 1;
  FFieldNameColumn := TFieldNameColumn.Create(AOwner);
  FModifiedColumn := TModifiedColumn.Create(AOwner);
  FOriginalColumn := TOriginalColumn.Create(AOwner);
  FConflictingColumn := TConflictingColumn.Create(AOwner);
end;

destructor TReconcileGrid.Destroy;
var
  I: Integer;
begin
  inherited;
  FTableAttributes.Free;
  FHeadingAttributes.Free;
  FRowAttributes.Free;
  for I := 0 to ColumnCount - 1 do
    Column[I].Free;
end;

procedure TReconcileGrid.AssignTo(Dest: TPersistent);
var
  I: Integer;
begin
  if Dest is TReconcileGrid then
    with TReconcileGrid(Dest) do
    begin
      FDisplayRows := Self.FDisplayRows;
      FTableAttributes.Assign(Self.FTableAttributes);
      FHeadingAttributes.Assign(Self.FHeadingAttributes);
      FRowAttributes.Assign(Self.FRowAttributes);
      for I := 0 to ColumnCount do
        Column[I].Assign(Self.Column[I]);
    end else inherited AssignTo(Dest);
end;

function TReconcileGrid.FormatTable(Layout: TLayoutWebContent;
  Options: TWebContentOptions): string;

  function TableHeader: string;
  var
    Attribs: string;
  begin
    AddStringAttrib(Attribs, 'NAME', HTMLTableName);
    with TableAttributes do
    begin
      Attribs := Attribs + HTMLAlign[Align];
      AddIntAttrib(Attribs, 'CELLSPACING', CellSpacing);
      AddIntAttrib(Attribs, 'CELLPADDING', CellPadding);
      AddIntAttrib(Attribs, 'BORDER', Border);
      AddStringAttrib(Attribs, 'BGCOLOR', BgColor);
      AddQuotedAttrib(Attribs, 'STYLE', Style);
      AddQuotedAttrib(Attribs, 'CLASS', StyleRule);
      AddCustomAttrib(Attribs, Custom);
    end;
    Result := Format(#13#10'<TABLE%s>', [Attribs]);
  end;

  function RowHeader(HeadingAttributes: TGridRowAttributes): string;
  var
    Attribs: string;
  begin
    with HeadingAttributes do
    begin
      Attribs := Attribs + HTMLAlign[Align];
      Attribs := Attribs + HTMLVAlign[VAlign];
      AddQuotedAttrib(Attribs, 'BGCOLOR', BgColor);
      AddQuotedAttrib(Attribs, 'STYLE', Style);
      AddQuotedAttrib(Attribs, 'CLASS', StyleRule);
      AddCustomAttrib(Attribs, Custom);
    end;
    Result := Format('<TR%s>', [Attribs]);
  end;

  function FormatColumn(AColumn: TReconcileColumn; var OneRow: string): string;
  var
    Attribs: string;
  begin
    Result := '';
    Attribs := '';
    AddQuotedAttrib(Attribs, 'STYLE', AColumn.CaptionAttributes.Style);
    AddCustomAttrib(Attribs, AColumn.CaptionAttributes.Custom);
    AddQuotedAttrib(Attribs, 'CLASS', AColumn.CaptionAttributes.StyleRule);
    Result := Format('%s<TH%s>%s</TH>'#13#10, [Result, Attribs, AColumn.Caption]);
    Attribs := '';
    AddQuotedAttrib(Attribs, 'STYLE', AColumn.Style);
    AddCustomAttrib(Attribs, AColumn.Custom);
    AddQuotedAttrib(Attribs, 'CLASS', AColumn.StyleRule);
    OneRow := Format('%s<TD%s><DIV>%s</DIV></TD>'#13#10, [OneRow, Attribs,
      AColumn.ControlContent(Options)]);
  end;

var
  I: Integer;
  OneRow: string;
  RowHeaderStr: string;
begin
  Result := TableHeader + RowHeader(HeadingAttributes) + #13#10;
  for I := 0 to ColumnCount - 1 do
    Result := Result + FormatColumn(Column[I], OneRow);
  Result := Result + '</TR>';
  RowHeaderStr := RowHeader(RowAttributes);
  for I := 0 to DisplayRows - 1 do
    Result := Format('%0:s%1:s%2:s</TR>'#13#10, [Result, RowHeaderStr, OneRow]);
  Result := Result + '</TABLE>';
end;

function TReconcileGrid.HTMLTableName: string;
begin
  Result := Format(ScriptTableName, ['Reconcile']);
end;

procedure TReconcileGrid.SetHeadingAttributes(
  const Value: TGridRowAttributes);
begin
  FHeadingAttributes.Assign(Value);
end;

procedure TReconcileGrid.SetRowAttributes(const Value: TGridRowAttributes);
begin
  FRowAttributes.Assign(Value);
end;

procedure TReconcileGrid.SetTableAttributes(const Value: TGridAttributes);
begin
  FTableAttributes.Assign(Value);
end;

function TReconcileGrid.GetColumn(I: Integer): TReconcileColumn;
begin
  Result := nil;
  case I of
    0: Result := FFieldNameColumn;
    1: Result := FModifiedColumn;
    2: Result := FConflictingColumn;
    3: Result := FOriginalColumn;
  else
    Assert(False, 'Column out of range');
  end;
end;

function TReconcileGrid.GetColumnCount: Integer;
begin
  Result := 4;
end;

procedure TReconcileGrid.SetConflictingColumn(
  const Value: TReconcileColumn);
begin
  FConflictingColumn.Assign(Value);
end;

procedure TReconcileGrid.SetFieldNameColumn(const Value: TReconcileColumn);
begin
  FFieldNameColumn.Assign(Value);
end;

procedure TReconcileGrid.SetModifiedColumn(const Value: TReconcileColumn);
begin
  FModifiedColumn.Assign(Value);
end;

procedure TReconcileGrid.SetOriginalColumn(const Value: TReconcileColumn);
begin
  FOriginalColumn.Assign(Value);
end;

{ TReconcileColumn }

procedure TReconcileColumn.AssignTo(Dest: TPersistent);
begin
  if Dest is TReconcileColumn then
    with TReconcileColumn(Dest) do
    begin
      FCaption := Self.FCaption;
      FCustom := Self.FCustom;
      FStyle := Self.FStyle;
      FStyleRule := Self.FStyleRule;
      FCaptionAttributes.Assign(Self.FCaptionAttributes);
      FDisplayWidth := Self.FDisplayWidth;
    end else inherited AssignTo(Dest);
end;

function TReconcileColumn.ControlContent(
  Options: TWebContentOptions): string;

  procedure AddAttributes(var Attrs: string);
  begin
    AddQuotedAttrib(Attrs, 'NAME', GetHTMLControlName);
    AddIntAttrib(Attrs, 'SIZE', DisplayWidth);
    AddIntAttrib(Attrs, 'MAXLENGTH', MaxWidth);
    AddQuotedAttrib(Attrs, 'STYLE', Style);
    AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
    AddCustomAttrib(Attrs, Custom);
  end;

  function EventContent(Options: TWebContentOptions): string;
  begin
    Result := FEvents;
  end;
  
var
  Attrs: string;
  Events: string;
begin
  AddAttributes(Attrs);
  if (not (coNoScript in Options.Flags)) then
    Events := EventContent(Options);
  Result := Format('<INPUT TYPE=TEXT %0:s %1:s>', [Attrs, Events]);
end;

constructor TReconcileColumn.Create(AOwner: TComponent);
begin
  inherited Create;
  FCaptionAttributes := TCaptionAttributes.Create(AOwner);
  FMaxWidth := -1;
end;

destructor TReconcileColumn.Destroy;
begin
  inherited;
  FCaptionAttributes.Free;
end;

function TReconcileColumn.GetHTMLControlName: string;
begin
  Result := FName;
end;

procedure TReconcileColumn.SetCaptionAttributes(
  const Value: TCaptionAttributes);
begin
  FCaptionAttributes.Assign(Value);
end;

{ TFieldNameColumn }

constructor TFieldNameColumn.Create(AOwner: TComponent);
begin
  inherited;
  FName := 'col_FieldName';
  FEvents := 'onfocus = "blur();"';
  FDisplayWidth := 18;
  FCaption := sFieldNameCaption;
end;

{ TModifiedColumn }

constructor TModifiedColumn.Create(AOwner: TComponent);
begin
  inherited;
  FName := 'col_Modified';
  FEvents := 'onfocus = "grid1.xfocus(this);"';
  FDisplayWidth := 24;
  FCaption := sModifiedCaption;
end;

{ TConflictingColumn }

constructor TConflictingColumn.Create(AOwner: TComponent);
begin
  inherited;
  FName := 'col_Conflicting';
  FEvents := 'onfocus = "blur();"';
  FDisplayWidth := 24;
  FCaption := sConflictingCaption;
end;

{ TOriginalColumn }

constructor TOriginalColumn.Create(AOwner: TComponent);
begin
  inherited;
  FName := 'col_Original';
  FEvents := 'onfocus = "blur();"';
  FDisplayWidth := 24;
  FCaption := sOriginalCaption;
end;

end.
