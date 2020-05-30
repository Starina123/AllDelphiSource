unit CustLayout;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, PagItems, MidItems;

type
  TTitleLayoutGroup = class(TLayoutGroup)
  private
    FCaption: string;
    FCaptionPosition: TCaptionPosition;
    FCaptionAttributes: TCaptionAttributes;
  protected
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
    procedure SetCaptionAttributes(const Value: TCaptionAttributes);
    function FormatCaption: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CaptionPosition: TCaptionPosition
      read FCaptionPosition write FCaptionPosition;
    property Caption: string read FCaption write FCaption;
    property CaptionAttributes: TCaptionAttributes
      read FCaptionAttributes write SetCaptionAttributes;
  end;

  TTitleDataForm = class(TDataForm)
  private
    FCaption: string;
    FCaptionPosition: TCaptionPosition;
    FCaptionAttributes: TCaptionAttributes;
  protected
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
    procedure SetCaptionAttributes(const Value: TCaptionAttributes);
    function FormatCaption: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CaptionPosition: TCaptionPosition
      read FCaptionPosition write FCaptionPosition;
    property Caption: string read FCaption write FCaption;
    property CaptionAttributes: TCaptionAttributes
      read FCaptionAttributes write SetCaptionAttributes;
  end;

implementation

uses sysutils;

{ TTitleLayoutGroup }

constructor TTitleLayoutGroup.Create(AOwner: TComponent);
begin
  inherited;
  FCaptionAttributes := TCaptionAttributes.Create(Self);
  FCaptionAttributes.Style := 'text-align: center';
  FCaptionPosition := capAbove;
end;

destructor TTitleLayoutGroup.Destroy;
begin
  inherited;
  FCaptionAttributes.Free;
end;

function TTitleLayoutGroup.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  FormLayout: TFormLayout;

  function FormatField(Field: TComponent): string;
  var
    Intf: IWebContent;
  begin
    if Field.GetInterface(IWebContent, Intf) then
      Result := Format('%0:s'#13#10, [Intf.Content(Options, FormLayout)])
  end;

  function Min(X, Y: Integer): Integer;
  begin
    Result := X;
    if X > Y then Result := Y;
  end;
var
  I: Integer;
  Intf: ILayoutWebContent;
  Attribs: string;
begin
  Result := '';
  if WebFieldControls.Count = 0 then
    Exit;
  FormLayout := TFormLayout.Create(ParentLayout);
  try
    AddStringAttrib(Attribs, 'NAME', Name);
    AddQuotedAttrib(Attribs, 'STYLE', Style);
    AddQuotedAttrib(Attribs, 'CLASS', StyleRule);
    AddCustomAttrib(Attribs, Custom);

    if DisplayColumns >= 1 then
    begin
      FormLayout.ColumnCount := Min(DisplayColumns, WebFieldControls.Count);
      FormLayout.BreakButtons := True;
    end;
    FormLayout.TableHeader :=
      Format('<TABLE %s>', [Attribs]);
    for I := 0 to WebFieldControls.Count - 1 do
    begin
      Result := Result +
        FormatField(WebFieldControls[I]);
    end;
    Result := Result + FormLayout.EndLayout;

    if Assigned(ParentLayout) and ParentLayout.GetInterface(ILayoutWebContent, Intf) then
      if Caption = '' then
        Result := Intf.LayoutTable(Result, GetLayoutAttributes)
      else
        Result := Intf.LayoutLabelAndField(FormatCaption, Result, GetLayoutAttributes);
  finally
    FormLayout.Free;
  end;
end;

function TTitleLayoutGroup.FormatCaption: string;
var
  Attribs: string;
begin
  AddQuotedAttrib(Attribs, 'STYLE', CaptionAttributes.Style);
  AddCustomAttrib(Attribs, CaptionAttributes.Custom);
  AddQuotedAttrib(Attribs, 'CLASS', CaptionAttributes.StyleRule);
  GetLayoutAttributes.LabelAttributes := Attribs;
  case CaptionPosition of
    capLeft: GetLayoutAttributes.LabelPosition := lposLeft;
    capRight: GetLayoutAttributes.LabelPosition := lposRight;
    capAbove: GetLayoutAttributes.LabelPosition := lposAbove;
    capBelow: GetLayoutAttributes.LabelPosition := lposBelow;
  else
    Assert(False, 'Unknown position');
  end;
  if Attribs <> '' then
    Result := Format('<SPAN %0:s>%1:s</SPAN>', [Attribs, Caption])
  else
    Result := Caption;
end;

procedure TTitleLayoutGroup.SetCaptionAttributes(
  const Value: TCaptionAttributes);
begin
  FCaptionAttributes.Assign(Value);
end;

{ TTitleDataForm }

constructor TTitleDataForm.Create(AOwner: TComponent);
begin
  inherited;
  FCaptionAttributes := TCaptionAttributes.Create(Self);
  FCaptionAttributes.Style := 'text-align: center';
  FCaptionPosition := capAbove;
end;

destructor TTitleDataForm.Destroy;
begin
  inherited;
  FCaptionAttributes.Free;
end;

function TTitleDataForm.FormatCaption: string;
var
  Attribs: string;
begin
  AddQuotedAttrib(Attribs, 'STYLE', CaptionAttributes.Style);
  AddCustomAttrib(Attribs, CaptionAttributes.Custom);
  AddQuotedAttrib(Attribs, 'CLASS', CaptionAttributes.StyleRule);
  GetLayoutAttributes.LabelAttributes := Attribs;
  case CaptionPosition of
    capLeft: GetLayoutAttributes.LabelPosition := lposLeft;
    capRight: GetLayoutAttributes.LabelPosition := lposRight;
    capAbove: GetLayoutAttributes.LabelPosition := lposAbove;
    capBelow: GetLayoutAttributes.LabelPosition := lposBelow;
  else
    Assert(False, 'Unknown position');
  end;
  if Attribs <> '' then
    Result := Format('<SPAN %0:s>%1:s</SPAN>', [Attribs, Caption])
  else
    Result := Caption;
end;


function TTitleDataForm.ImplContent(Options: TWebContentOptions;
  ParentLayout: TLayout): string;
var
  Intf: ILayoutWebContent;
begin
  Result := inherited ImplContent(Options, ParentLayout);
  if Caption <> '' then
  begin
    with TFormLayout.Create(ParentLayout) do
    try
      if GetInterface(ILayoutWebContent, Intf) then
        Result := Intf.LayoutLabelAndField(FormatCaption, Result, GetLayoutAttributes);
    finally
      Result := Result + EndLayout;
      Free;
    end;
  end;
end;

procedure TTitleDataForm.SetCaptionAttributes(
  const Value: TCaptionAttributes);
begin
  FCaptionAttributes.Assign(Value);
end;

end.
