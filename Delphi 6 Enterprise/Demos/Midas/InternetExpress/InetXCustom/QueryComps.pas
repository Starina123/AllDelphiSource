unit QueryComps;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  WebComp, MidComp, MidItems;

procedure Register;

type
  TQueryPassword = class(TWebTextInput, IQueryField)
  protected
    function ControlContent(Options: TWebContentOptions): string; override;
    function GetText: string;
    procedure SetText(const Value: string);
  public
    class function IsQueryField: Boolean; override;
  published
    property ParamName;
    property DisplayWidth;
    property Caption;
    property CaptionAttributes;
    property CaptionPosition;
    property FieldName;
    property TabIndex;
    property Style;
    property Custom;
    property StyleRule;
  end;

  TQueryHiddenText = class(TWebTextInput, IQueryField)
  private
    FText: string;
  protected
    function ControlContent(Options: TWebContentOptions): string; override;
    function GetText: string;
    procedure SetText(const Value: string);
    procedure AddAttributes(var Attrs: string); override;
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
  public
    class function IsQueryField: Boolean; override;
  published
    property ParamName;
    property FieldName;
    property Text: string read GetText write SetText;
  end;

  TSubmitValueButton = class(TQueryButton)
  private
    FValueName: string;
    FValue: string;
    procedure SetValue(const Value: string);
    procedure SetValueName(const Value: string);
  protected
    function EventContent(Options: TWebContentOptions): string; override;
    function GetHTMLControlName: string; override;
    function GetValue: string;
    function GetValueName: string;
    function GetInputType: string; override;
    function IsSubmitType: Boolean;
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Value: string read GetValue write SetValue;
    property ValueName: string read GetValueName write SetValueName;
  end;

  TPromptQueryButton = class(TQueryButton, IScriptComponent)
  private
    FLines: TStrings;
    FHiddenInputName: string;
  protected
    procedure SetLines(const Value: TStrings);
    function GetPromptMessage: string;
    function ImplContent(Options: TWebContentOptions;
      ParentLayout: TLayout): string; override;
    function EventContent(Options: TWebContentOptions): string; override;
    function GetHiddenInputName: string;
    { IScriptComponent }
    procedure AddElements(AddIntf: IAddScriptElements); virtual;
    function GetSubComponents: TObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property HiddenInputName: string read GetHiddenInputName write FHiddenInputName;
    property Lines: TStrings read FLines write SetLines;
  end;

implementation

uses sysutils;

resourcestring 
  sPromptQuery = 'Prompt...';
  sSubmitValue = 'Submit Value';

const   
  sPromptFunctionName = 'PromptSetField';
  sPromptFunction =
   'function %0:s(input, msg)'     + #13#10 +
   '{'                             + #13#10 +
   '  var v = prompt(msg);'        + #13#10 +
   '  if (v == null || v == "")'              + #13#10 +
   '    return false;'             + #13#10 +
   '  input.value = v'             + #13#10 +
   '  return true;'               + #13#10 +
   '}'                             + #13#10;


constructor TPromptQueryButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultCaption := sPromptQuery;
  InputType := 'BUTTON';
  FLines := TStringList.Create;
end;

function TPromptQueryButton.EventContent(
  Options: TWebContentOptions): string;
var
  HTMLForm: IHTMLForm;
  HTMLFormVarName: string;
begin
  HTMLForm := GetHTMLForm;
  if Assigned(HTMLForm) then
    HTMLFormVarName := HTMLForm.HTMLFormVarName;
  Result :=
    Format(' onclick=''if (%0:s(%1:s, %2:s)) %3:s.submit();''',
      [sPromptFunctionName, HiddenInputName, GetPromptMessage,
        HTMLFormVarName]);
end;

function TPromptQueryButton.GetPromptMessage: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Lines.Count - 1 do
  begin
    Result := Format('%s"%s\n"', [Result, Lines[I]]);
    if I < Lines.Count - 1 then Result := Result + ' +';
    Result := Result + #13#10;
  end;
end;

procedure TPromptQueryButton.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

function TPromptQueryButton.ImplContent(Options: TWebContentOptions; ParentLayout: TLayout): string;
begin
  Result :=
      Format('<INPUT TYPE=HIDDEN NAME=%0:s>'#13#10,
        [HiddenInputName]);
  Result := Result + inherited ImplContent(Options, ParentLayout);
end;

destructor TPromptQueryButton.Destroy;
begin
  FLines.Free;
  inherited;
end;

procedure TPromptQueryButton.AddElements(AddIntf: IAddScriptElements);
begin
  inherited;
  AddIntf.AddFunction(sPromptFunctionName, Format(sPromptFunction, [sPromptFunctionName]));
end;

function TPromptQueryButton.GetHiddenInputName: string;
begin
  if FHiddenInputName = '' then
    Result := Format('_%s', [Self.Name])
  else
    Result := FHiddenInputName;
end;

{ TSubmitValueButton }

constructor TSubmitValueButton.Create(AOwner: TComponent);
begin
  inherited;
  DefaultCaption := sSubmitValue;
  InputType := 'BUTTON';
end;

function TSubmitValueButton.EventContent(
  Options: TWebContentOptions): string;
var
  HTMLForm: IHTMLForm;
  HTMLFormVarName: string;
begin
  if IsSubmitType then
    // No code necessary.  Use default submit button behavior
    Result := ''
  else
  begin
    HTMLForm := GetHTMLForm;
    if Assigned(HTMLForm) then
      HTMLFormVarName := HTMLForm.HTMLFormVarName;
    Result :=
      Format(' onclick=''%0:s.value="%1:s";%2:s.submit();''',
        [ValueName, Value,
          HTMLFormVarName]);
  end;
end;

function TSubmitValueButton.GetHTMLControlName: string;
begin
  Result := Name;
end;

function TSubmitValueButton.ImplContent(Options: TWebContentOptions; ParentLayout: TLayout): string;
begin
  Result := '';
  if not IsSubmitType then
    Result :=
      Format('<INPUT TYPE=HIDDEN NAME=%0:s>'#13#10,
        [ValueName]);
  Result := Result + inherited ImplContent(Options, ParentLayout);
end;

function TSubmitValueButton.IsSubmitType: Boolean;
begin
  // Can use submit button to send value.  The value
  // with be the VALUE attributes and the value name will by the
  // NAME attribute.
  Result := (FValue <> '') and (FValueName <> '');
end;

function TSubmitValueButton.GetInputType: string;
begin
  if IsSubmitType then
    Result := 'SUBMIT'
  else
    Result := 'BUTTON';
end;

function TSubmitValueButton.GetValue: string;
begin
  Result := FValue;
  if Result = '' then
    Result := Caption;
end;

function TSubmitValueButton.GetValueName: string;
begin
  Result := FValueName;
  if Result = '' then
    Result := GetHTMLControlName;
end;

procedure TSubmitValueButton.SetValue(const Value: string);
begin
  if Value = Caption then
    FValue := ''
  else
    FValue := Value;
end;

procedure TSubmitValueButton.SetValueName(const Value: string);
begin
  if Value = GetHTMLControlName then
    FValueName := ''
  else
    FValueName := Value;
end;

{ Register procedure }

procedure Register;
begin
  RegisterWebComponents([
    TPromptQueryButton, TSubmitValueButton]);
end;

{ TQueryPassword }

function TQueryPassword.ControlContent(
  Options: TWebContentOptions): string;
var
  Attrs: string;
  Events: string;
begin
  AddAttributes(Attrs);
  if (not (coNoScript in Options.Flags)) then
    Events := EventContent(Options);
  Result := Format('<INPUT TYPE=PASSWORD %0:s%1:s>', [Attrs, Events]);
end;

function TQueryPassword.GetText: string;
begin
  Result := '';  // Not supported
end;

class function TQueryPassword.IsQueryField: Boolean;
begin
  Result := True;
end;

procedure TQueryPassword.SetText(const Value: string);
begin
end;

{ TQueryHiddenText }

function TQueryHiddenText.ControlContent(
  Options: TWebContentOptions): string;
var
  Attrs: string;
begin
  AddAttributes(Attrs);
  Result := Format('<INPUT TYPE=HIDDEN %0:s>', [Attrs]);
end;

function TQueryHiddenText.GetText: string;
begin
  Result := FText;
end;

class function TQueryHiddenText.IsQueryField: Boolean;
begin
  Result := True;
end;

procedure TQueryHiddenText.SetText(const Value: string);
begin
  FText := Value;
end;

procedure TQueryHiddenText.AddAttributes(var Attrs: string);
begin
  Inherited;
  AddQuotedAttrib(Attrs, 'VALUE', Text);
end;

function TQueryHiddenText.ImplContent(Options: TWebContentOptions; ParentLayout: TLayout): string;
begin
  Result := ControlContent(Options);
end;

function TPromptQueryButton.GetSubComponents: TObject;
begin
  Result := nil;
end;

end.
