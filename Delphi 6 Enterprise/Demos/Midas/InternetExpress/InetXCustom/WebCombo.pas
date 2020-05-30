unit WebCombo;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, MidComp, PagItems, MidItems;

type
  TSearchSelectOptionsInput = class(TWebTextInput, IScriptComponent)
  private
    FValuesField: string;
    FItemsField: string;
    FDataSet: TDataSet;
    FValues: TStrings;
    FItems: TStrings;
    FDisplayRows: Integer;
  protected
    { IHTMLField }
    function ImplGetHTMLControlName: string; override;
    { IScriptComponent implementation }
    procedure AddElements(AddIntf: IAddScriptElements);
    function GetSubComponents: TObject; // Object implementing IWebComponentContainer
    function ControlContent(Options: TWebContentOptions): string; override;
    function EventContent(Options: TWebContentOptions): string; override;
    function GetSelectIndex(ItemsStrings,
      ValuesStrings: TStrings): Integer; virtual;
    function FormatInputs(ItemsStrings, ValuesStrings: TStrings;
      Options: TWebContentOptions; var MaxWidth: Integer): string;
    function InputName: string;
    function ListName: string;
    procedure SetItems(const Value: TStrings);
    procedure SetValues(const Value: TStrings);
    procedure AddListAttributes(var Attrs: string);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetDataSet(const Value: TDataSet);
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Values: TStrings read FValues write SetValues;
    property Items: TStrings read FItems write SetItems;
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property ValuesField: string Read FValuesField write FValuesField;
    property ItemsField: string read FItemsField write FItemsField;
    property DisplayRows: Integer read FDisplayRows write FDisplayRows;
  end;

  TQuerySearchSelectOptions = class(TSearchSelectOptionsInput, IQueryField)
  private
    FText: string;
  protected
    function GetText: string;
    procedure SetText(const Value: string);
    function GetSelectIndex(ItemsStrings,
      ValuesStrings: TStrings): Integer; override;
    procedure AddAttributes(var Attrs: string); override;
  public
    class function IsQueryField: Boolean; override;
  published
    property ParamName;
    property Values;
    property Items;
    property DataSet;
    property ValuesField;
    property ItemsField;
    property DisplayRows;
    property Style;
    property Custom;
    property StyleRule;
    property CaptionAttributes;
    property CaptionPosition;
    property Text: string read GetText write SetText;
    property FieldName;
    property TabIndex;
    property Caption;
  end;

implementation

uses sysutils, WbmConst;

{ TSearchSelectOptionsInput }

const
  sComboSelChange = 'ComboSelChange';
  sComboSelChangeFunction =
   'function %0:s(list, input)'                         + #13#10 +
   '{'                                                  + #13#10 +
   '  input.value = list.options[list.selectedIndex].text;' + #13#10 +
   '}'                                                  + #13#10;

  sComboLookup = 'ComboLookup';
  sComboLookupFunction =
   'function %0:s(input, list)'                      + #13#10 +
   '{'                                               + #13#10 +
   '  var s = input.value.toUpperCase();'              + #13#10 +
   '  var count = list.options.length;'                + #13#10 +
   '  var i = 0;'                                      + #13#10 +
   '  while (i < count)'                               + #13#10 +
   '  {'                                               + #13#10 +
   '    if (list.options[i].text.toUpperCase().indexOf(s)==0)' + #13#10 +
   '    {'                                             + #13#10 +
   '      list.selectedIndex = i;'                     + #13#10 +
   '      break;'                                      + #13#10 +
   '    }'                                             + #13#10 +
   '    i++;'                                          + #13#10 +
   '  }'                                               + #13#10 +
   '}'                                                 + #13#10;


constructor TSearchSelectOptionsInput.Create(AOwner: TComponent);
begin
  inherited;
  FValues := TStringList.Create;
  FItems := TStringList.Create;
  FDisplayRows := -1;
end;

destructor TSearchSelectOptionsInput.Destroy;
begin
  inherited;
  FValues.Free;
  FItems.Free;
end;

function TSearchSelectOptionsInput.EventContent(Options: TWebContentOptions): string;
var
  HTMLForm: IHTMLForm;
  HTMLFormName: string;
begin
  HTMLForm := GetHTMLForm;
  if Assigned(HTMLForm) then
    HTMLFormName := HTMLForm.HTMLFormName;
  Result := inherited EventContent(Options);
  Result := Format('%0:s onkeyup="%1:s(this, %2:s.%3:s);"',
    [Result, sComboLookup, HTMLFormName, ListName]);
end;

function TSearchSelectOptionsInput.ControlContent(Options: TWebContentOptions): string;
var
  ItemsStrings, ValuesStrings: TStrings;
  ListContent: string;
  MaxWidth: Integer;
begin
  if GetItemValuesFromDataSet(FDataSet, ItemsField, ValuesField, ItemsStrings, ValuesStrings) then
  begin
    try
      ListContent := FormatInputs(ItemsStrings, ValuesStrings, Options, MaxWidth);
    finally
      ItemsStrings.Free;
      ValuesStrings.Free;
    end;
  end
  else
    ListContent := FormatInputs(Items, Values, Options, MaxWidth);
  // Define edit control
  DisplayWidth := MaxWidth;
  Result := inherited ControlContent(Options);
  Result := Format(#13#10'<TABLE>' +
                   '  <TR>' +
                   '    <TD>' +
                   '    %0:s'  +
                   '    </TD>' +
                   '  </TR>'#13#10 +
                   '  <TR>'  +
                   '    <TD>' +
                   '    %1:s' +
                   '    </TD>' +
                   '  </TR>'  +
                   '</TABLE>',
    [Result, ListContent]);
end;

function TSearchSelectOptionsInput.InputName: string;
begin
  Result := Format('_%s', [ListName]);
end;

function TSearchSelectOptionsInput.ListName: string;
begin
  Result := inherited ImplGetHTMLControlName;
end;

procedure TSearchSelectOptionsInput.AddListAttributes(var Attrs: string);
begin
  AddQuotedAttrib(Attrs, 'NAME', ListName);
  AddIntAttrib(Attrs, 'SIZE', DisplayRows);
  AddIntAttrib(Attrs, 'TABINDEX', TabIndex);
  AddQuotedAttrib(Attrs, 'STYLE', Style);
  AddQuotedAttrib(Attrs, 'CLASS', StyleRule);
  AddCustomAttrib(Attrs, Custom);
end;

function TSearchSelectOptionsInput.GetSelectIndex(ItemsStrings,
  ValuesStrings: TStrings): Integer;
begin
  Result := -1;
end;

function TSearchSelectOptionsInput.FormatInputs(ItemsStrings, ValuesStrings: TStrings; Options: TWebContentOptions;
  var MaxWidth: Integer): string;
var
  Index: Integer;
  Attrs, Events, Value: string;
  Item: string;
  HTMLForm: IHTMLForm;
  HTMLFormName: string;
  SelectIndex: Integer;
  OptionAttr: string;
begin
  Result := '';
  MaxWidth := -1;
  AddListAttributes(Attrs);
  HTMLForm := GetHTMLForm;
  if Assigned(HTMLForm) then
    HTMLFormName := HTMLForm.HTMLFormName;
  if (not (coNoScript in Options.Flags)) then
    Events := Format(' onchange="%0:s(this, %1:s.%2:s);"',
      [sComboSelChange, HTMLFormName, GetHTMLControlName]);
  SelectIndex := GetSelectIndex(ItemsStrings, ValuesStrings);
  Result := Format('<SELECT%0:s%1:s>'#13#10, [Attrs, Events]);
  for Index := 0 to ItemsStrings.Count - 1 do
  begin
    Item := ItemsStrings[Index];
    if ItemsStrings.IndexOf(Item) <> Index then continue;  // not unique
    if Length(Item) > MaxWidth then
      MaxWidth := Length(Item);
    if ValuesStrings.Count > Index then
      Value := ValuesStrings[Index]
    else
      Value := Item;
    OptionAttr := '';
    AddQuotedAttrib(OptionAttr, 'VALUE', Value);
    AddBoolAttrib(OptionAttr, 'SELECTED', Index = SelectIndex);
    Result := Format('%0:s  <OPTION %1:s>%2:s'#13#10,
      [Result, OptionAttr, Item]);
  end;
  Result := Format('%0:s</SELECT>', [Result]);
end;

procedure TSearchSelectOptionsInput.AddElements(AddIntf: IAddScriptElements);
begin
  inherited;
  if Assigned(FDataSet) and (FDataSet.Active = False) then
    AddIntf.AddError(Format(sDataSetNotActive, [FDataSet.Name]));
  AddIntf.AddFunction(sComboSelChange, Format(sComboSelChangeFunction, [sComboSelChange]));
  AddIntf.AddFunction(sComboLookup, Format(sComboLookupFunction, [sComboLookup]));
end;

procedure TSearchSelectOptionsInput.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TSearchSelectOptionsInput.SetValues(const Value: TStrings);
begin
  FValues.Assign(Value);
end;

function TSearchSelectOptionsInput.ImplGetHTMLControlName: string;
begin
  Result := InputName;
end;

procedure TSearchSelectOptionsInput.SetDataSet(const Value: TDataSet);
begin
  if FDataSet <> Value then
  begin
    FDataSet := Value;
    if Value <> nil then
    begin
      Value.FreeNotification(Self);
      if not (csLoading in ComponentState) then
        Value.Active := True;
    end;
  end;
end;

procedure TSearchSelectOptionsInput.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FDataSet) then
    DataSet := nil;
end;

function TSearchSelectOptionsInput.GetSubComponents: TObject;
begin
  Result := nil;
end;

{ TQuerySearchSelectOptiosn }

procedure TQuerySearchSelectOptions.AddAttributes(var Attrs: string);
begin
  Inherited;
  AddQuotedAttrib(Attrs, 'VALUE', Text);
end;

function TQuerySearchSelectOptions.GetSelectIndex(ItemsStrings,
  ValuesStrings: TStrings): Integer;
begin
  Result := ItemsStrings.IndexOf(Text);
end;

function TQuerySearchSelectOptions.GetText: string;
begin
  Result := FText;
end;

class function TQuerySearchSelectOptions.IsQueryField: Boolean;
begin
  Result := True;
end;

procedure TQuerySearchSelectOptions.SetText(const Value: string);
begin
  if Value <> FText then
  begin
    FText := Value;
  end;
end;

end.
