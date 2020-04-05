{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Edit.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, Androidapi.JNI.Widget, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes, FMX.Controls.Model, FMX.Controls.Presentation, FMX.Presentation.Android, FMX.Edit,
  FMX.Presentation.Messages, FMX.Controls;

type

{ TAndroidNativeEdit }

  TAndroidTextChangedListener = class;

  TAndroidNativeEdit = class(TAndroidNativeView)
  private
    FTextChangesListener: TAndroidTextChangedListener;
    FEditHasClearButton: Boolean;
    FIsStyledFontLoaded: Boolean;
    FCaret: TCaret;
    function GetView: JEditText;
    function GetModel: TCustomEditModel;
    function GetInputMethodManager: JInputMethodManager;
    function GetEdit: TCustomEdit;
  protected
    procedure UpdateText;
    procedure UpdateTextPrompt;
    procedure UpdateTextMaxLength;
    procedure UpdateTextSettings;
    procedure UpdateInputType;
    procedure UpdateReturnKeyType;
    procedure UpdateSelection;
    procedure UpdateInputFilters;
    procedure UpdateVisibleOfClearButton;
    { Messages from PresentationProxy }
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    procedure PMNeedStyleLookup(var AMessage: TDispatchMessage); message PM_NEED_STYLE_LOOKUP;
    procedure PMApplyStyleLookup(var AMessage: TDispatchMessage); message PM_APPLY_STYLE_LOOKUP;
    { Messages from model }
    procedure MMSelLenghtChanged(var AMessage: TDispatchMessageWithValue<Integer>); message MM_EDIT_SELLENGTH_CHANGED;
    procedure MMSelStartChanged(var AMessage: TDispatchMessageWithValue<Integer>); message MM_EDIT_SELSTART_CHANGED;
    procedure MMPasswordChanged(var AMessage: TDispatchMessage); message MM_EDIT_ISPASSWORD_CHANGED;
    procedure MMTextSettingsChanged(var AMessage: TDispatchMessage); message MM_EDIT_TEXT_SETTINGS_CHANGED;
    procedure MMEditButtonsChanged(var AMessage: TDispatchMessage); message MM_EDIT_EDITBUTTONS_CHANGED;
    procedure MMTextChanged(var AMessage: TDispatchMessageWithValue<string>); message MM_EDIT_TEXT_CHANGED;
    procedure MMMaxLengthChanged(var AMessage: TDispatchMessage); message MM_EDIT_MAXLENGTH_CHANGED;
    procedure MMPromptTextChanged(var AMessage: TDispatchMessage); message MM_EDIT_PROMPTTEXT_CHANGED;
    procedure MMKeyboardTypeChanged(var AMessage: TDispatchMessage); message MM_EDIT_KEYBOARDTYPE_CHANGED;
    procedure MMReturnTypeChanged(var AMessage: TDispatchMessage); message MM_EDIT_RETURNKEYTYPE_CHANGED;
    procedure MMCharCaseChanged(var AMessage: TDispatchMessage); message MM_EDIT_CHARCASE_CHANGED;
    procedure MMReadOnlyChanged(var AMessage: TDispatchMessage); message MM_EDIT_READONLY_CHANGED;
    procedure MMFilterCharChanged(var AMessage: TDispatchMessage); message MM_EDIT_FILTERCHAR_CHANGED;
    procedure MMCaretPositionChanged(var AMessage: TDispatchMessageWithValue<Integer>); message MM_EDIT_CARETPOSITION_CHANGED;
    procedure MMCheckSpellingChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_EDIT_CHECKSPELLING_CHANGED;
  protected
    function ProcessTouch(view: JView; event: JMotionEvent): Boolean; override;
    function DefineModelClass: TDataModelClass; override;
    function CreateView: JView; override;
    procedure InitView; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure ShowCaret;
    procedure HideCaret;
    /// <summary>Sets focus of native control, if native control doesn't have a focus</summary>
    procedure SetFocus; override;
    /// <summary>Resets focus of native control</summary>
    procedure ResetFocus; override;
  public
    property Edit: TCustomEdit read GetEdit;
    property Model: TCustomEditModel read GetModel;
    property View: JEditText read GetView;
  end;

  TAndroidTextChangedListener = class(TJavaLocal, JTextWatcher)
  private
    [Weak] FNativeEdit: TAndroidNativeEdit;
  public
    constructor Create(const ANativeEdit: TAndroidNativeEdit);
    { JTextWatcher }
    procedure afterTextChanged(s: JEditable); cdecl;
    procedure beforeTextChanged(s: JCharSequence; start: Integer; count: Integer; after: Integer); cdecl;
    procedure onTextChanged(s: JCharSequence; start: Integer; before: Integer; count: Integer); cdecl;
  end;

implementation

uses
  System.UITypes, System.Classes, System.SysUtils, Androidapi.JNI.App, Androidapi.Helpers, AndroidApi.JNI,
  AndroidApi.JNI.Util, Androidapi.JNI.Embarcadero, FMX.Types, FMX.Graphics, FMX.Presentation.Factory,
  FMX.Platform.Android;

function VertTextAlignToGravity(const AAlign: TTextAlign): Integer;
begin
  case AAlign of
    TTextAlign.Center:
      Result := TJGravity.JavaClass.CENTER_VERTICAL;
    TTextAlign.Leading:
      Result := TJGravity.JavaClass.TOP;
    TTextAlign.Trailing:
      Result := TJGravity.JavaClass.BOTTOM;
  else
    Result := TJGravity.JavaClass.CENTER_VERTICAL;
  end;
end;

function HorzTextAlignToGravity(const AAlign: TTextAlign): Integer;
begin
  case AAlign of
    TTextAlign.Center:
      Result := TJGravity.JavaClass.CENTER;
    TTextAlign.Leading:
      Result := TJGravity.JavaClass.LEFT;
    TTextAlign.Trailing:
      Result := TJGravity.JavaClass.RIGHT;
  else
    Result := TJGravity.JavaClass.CENTER;
  end;
end;

function TFontStylesToStyle(const AStyle: TFontStyles): Integer;
begin
  if (TFontStyle.fsBold in AStyle) and (TFontStyle.fsItalic in AStyle) then
    Result := TJTypeface.JavaClass.BOLD_ITALIC
  else if TFontStyle.fsBold in AStyle then
    Result := TJTypeface.JavaClass.BOLD
  else if TFontStyle.fsItalic in AStyle then
    Result := TJTypeface.JavaClass.ITALIC
  else
    Result := TJTypeface.JavaClass.NORMAL;
end;

{ TAndroidNativeEdit }

function TAndroidNativeEdit.GetView: JEditText;
begin
  Result := inherited GetView<JEditText>;
end;

procedure TAndroidNativeEdit.HideCaret;
begin
  FCaret.Hide;
  FCaret.Visible := False;
end;

function TAndroidNativeEdit.GetModel: TCustomEditModel;
begin
  Result := inherited GetModel<TCustomEditModel>;
end;

function TAndroidNativeEdit.GetEdit: TCustomEdit;
begin
  Result := Control as TCustomEdit
end;

function TAndroidNativeEdit.GetInputMethodManager: JInputMethodManager;
var
  ServiceObject: JObject;
begin
  ServiceObject := View.getContext.getSystemService(TJContext.JavaClass.INPUT_METHOD_SERVICE);
  if ServiceObject <> nil then
    Result := TJInputMethodManager.Wrap(ServiceObject);
end;

procedure TAndroidNativeEdit.UpdateText;
begin
  View.setText(StrToJCharSequence(Model.Text), TJTextView_BufferType.JavaClass.NORMAL);
end;

procedure TAndroidNativeEdit.UpdateTextPrompt;
begin
  View.setHint(StrToJCharSequence(Model.TextPrompt));
end;

procedure TAndroidNativeEdit.UpdateTextMaxLength;
begin
  UpdateInputFilters;
end;

procedure TAndroidNativeEdit.UpdateTextSettings;
var
  TextSettings: TTextSettings;
begin
  TextSettings := Model.TextSettingsInfo.ResultingTextSettings;
  View.setTextColor(TAndroidHelper.AlphaColorToJColor(TextSettings.FontColor));
  if Model.SelectionFill <> nil then
    View.setHighlightColor(TAndroidHelper.AlphaColorToJColor(Model.SelectionFill.Color));
  View.setTextSize(TJTypedValue.JavaClass.COMPLEX_UNIT_DIP, TextSettings.Font.Size);
  View.setGravity(VertTextAlignToGravity(TextSettings.VertAlign) or HorzTextAlignToGravity(TextSettings.HorzAlign));
  View.setTypeface(TJTypeface.JavaClass.create(StringToJString(TextSettings.Font.Family),
    TFontStylesToStyle(TextSettings.Font.Style)));
end;

procedure TAndroidNativeEdit.UpdateVisibleOfClearButton;

  function EditHasClearButtons: Boolean;
  var
    I: Integer;
  begin
    for I := 0 to Edit.ButtonsContent.ChildrenCount - 1 do
      if Edit.ButtonsContent.Children[I] is TClearEditButton then
        Exit(True);
    Result := False;
  end;

var
  ResID: Integer;
begin
  FEditHasClearButton := EditHasClearButtons;
  if FEditHasClearButton and not Model.Text.IsEmpty then
  begin
    ResID := TAndroidHelper.GetResourceID('android:drawable/ic_clear'); // Do not localize
    if ResID = 0 then
      ResID := TAndroidHelper.GetResourceID('android:drawable/ic_delete'); // Do not localize
    View.setCompoundDrawablesWithIntrinsicBounds(0, 0, ResId, 0);
  end
  else
    View.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
end;

type
  JPasswordTransformationMethod = interface;

  JPasswordTransformationMethodClass = interface(JObjectClass)
    ['{2DDB6B50-C440-4D34-BDA8-35D4CEF4FF0F}']
    {class} function init: JPasswordTransformationMethod; cdecl;
    {class} function getInstance: JPasswordTransformationMethod; cdecl;
  end;

  [JavaSignature('android/text/method/PasswordTransformationMethod')]
  JPasswordTransformationMethod = interface(JObject)
    ['{9C037BE5-2EE3-4259-9AC5-892EA8C99454}']
    procedure afterTextChanged(s: JEditable); cdecl;
    procedure beforeTextChanged(s: JCharSequence; start: Integer; count: Integer; after: Integer); cdecl;
    function getTransformation(source: JCharSequence; view: JView): JCharSequence; cdecl;
    procedure onFocusChanged(view: JView; sourceText: JCharSequence; focused: Boolean; direction: Integer; previouslyFocusedRect: JRect); cdecl;
    procedure onTextChanged(s: JCharSequence; start: Integer; before: Integer; count: Integer); cdecl;
  end;
  TJPasswordTransformationMethod = class(TJavaGenericImport<JPasswordTransformationMethodClass, JPasswordTransformationMethod>) end;


procedure TAndroidNativeEdit.UpdateInputType;
var
  InputType: Integer;
begin
  case Model.KeyboardType of
    TVirtualKeyboardType.NumbersAndPunctuation:
      InputType := TJInputType.JavaClass.TYPE_CLASS_TEXT;
    TVirtualKeyboardType.NumberPad:
      InputType := TJInputType.JavaClass.TYPE_CLASS_NUMBER;
    TVirtualKeyboardType.PhonePad:
      InputType := TJInputType.JavaClass.TYPE_CLASS_PHONE;
    TVirtualKeyboardType.Alphabet:
      begin
        InputType := TJInputType.JavaClass.TYPE_CLASS_TEXT or TJInputType.JavaClass.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
        if not Model.Password then
          InputType := InputType or TJInputType.JavaClass.TYPE_TEXT_FLAG_CAP_SENTENCES;
      end;
    TVirtualKeyboardType.URL:
      InputType := TJInputType.JavaClass.TYPE_CLASS_TEXT or TJInputType.JavaClass.TYPE_TEXT_VARIATION_URI;
    TVirtualKeyboardType.NamePhonePad:
      begin
        InputType := TJInputType.JavaClass.TYPE_CLASS_PHONE;
        if not Model.Password then
          InputType := InputType or TJInputType.JavaClass.TYPE_TEXT_FLAG_CAP_SENTENCES;
      end;
    TVirtualKeyboardType.EmailAddress:
      InputType := TJInputType.JavaClass.TYPE_CLASS_TEXT or TJInputType.JavaClass.TYPE_TEXT_VARIATION_EMAIL_ADDRESS;
    TVirtualKeyboardType.DecimalNumberPad:
      InputType := TJInputType.JavaClass.TYPE_CLASS_NUMBER or TJInputType.JavaClass.TYPE_NUMBER_FLAG_DECIMAL or
        TJInputType.JavaClass.TYPE_NUMBER_FLAG_SIGNED;
  else
    InputType := TJInputType.JavaClass.TYPE_CLASS_TEXT or TJInputType.JavaClass.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
  end;

  if Model.Password then
  begin
    if (InputType and TJInputType.JavaClass.TYPE_CLASS_NUMBER) = TJInputType.JavaClass.TYPE_CLASS_NUMBER then
      InputType := InputType or TJInputType.JavaClass.TYPE_NUMBER_VARIATION_PASSWORD
    else
      InputType := InputType or TJInputType.JavaClass.TYPE_TEXT_VARIATION_PASSWORD;

    View.setTransformationMethod(TJTransformationMethod.Wrap(TJPasswordTransformationMethod.JavaClass.getInstance));
  end
  else
    View.setTransformationMethod(nil);

  if Model.ReadOnly then
    InputType := TJInputType.JavaClass.TYPE_NULL;

  if (InputType and TJInputType.JavaClass.TYPE_CLASS_TEXT) = TJInputType.JavaClass.TYPE_CLASS_TEXT then
  begin
    InputType := InputType or TJInputType.JavaClass.TYPE_TEXT_FLAG_CAP_SENTENCES;

    if not Model.Password and Model.CheckSpelling then
      InputType := InputType or TJInputType.JavaClass.TYPE_TEXT_FLAG_AUTO_CORRECT;
  end;
  View.setRawInputType(InputType);
end;

procedure TAndroidNativeEdit.UpdateReturnKeyType;
var
  IMEOptions: Integer;
begin
  case Model.ReturnKeyType of
    TReturnKeyType.Default,
    TReturnKeyType.Done:
      IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_DONE;
    TReturnKeyType.Go:
      IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_GO;
    TReturnKeyType.Next:
      IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_NEXT;
    TReturnKeyType.Search:
      IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_SEARCH;
    TReturnKeyType.Send:
      IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_SEND;
  else
    IMEOptions := TJEditorInfo.JavaClass.IME_ACTION_NONE;
  end;
  IMEOptions := View.getImeOptions and not TJEditorInfo.JavaClass.IME_MASK_ACTION or IMEOptions;
  IMEOptions := IMEOptions or TJEditorInfo.JavaClass.IME_FLAG_NO_EXTRACT_UI;
  View.setImeOptions(IMEOptions);
end;

procedure TAndroidNativeEdit.UpdateSelection;
var
  IsSelected: Boolean;
begin
  IsSelected := Model.SelLength > 0;
  View.setSelected(IsSelected);
  if IsSelected then
    View.setSelection(Model.SelStart, Model.SelStart + Model.SelLength)
  else
    View.setSelection(Model.CaretPosition);
end;

procedure TAndroidNativeEdit.UpdateInputFilters;
var
  Filters: JArrayList;
  Arrays: TJavaObjectArray<JInputFilter>;
  I: Integer;
begin
  Filters := TJArrayList.Create;

  if Model.MaxLength > 0 then
	  Filters.add(TJInputFilter_LengthFilter.JavaClass.Init(Model.MaxLength));

  case Model.CharCase of
    TEditCharCase.ecLowerCase:
      Filters.add(TJAllLower.Create);
    TEditCharCase.ecUpperCase:
      Filters.Add(TJInputFilter_AllCaps.Create);
  end;

  if not Model.FilterChar.IsEmpty then
    Filters.Add(TJFilterChar.JavaClass.init(StrToJCharSequence(Model.FilterChar)));

  Arrays := TJavaObjectArray<JInputFilter>.Create(Filters.size);
  for I := 0 to Arrays.Length - 1 do
    Arrays[I] := TJInputFilter.Wrap(Filters.get(I));

  View.setFilters(Arrays);
end;

procedure TAndroidNativeEdit.PMApplyStyleLookup(var AMessage: TDispatchMessage);
var
  StyledControl: TStyledControl;
  Style: TFmxObject;
  StyleObject: TFmxObject;
  FontObject: IFontObject;
begin
  if not FIsStyledFontLoaded and (Control is TStyledControl) then
  begin
    StyledControl := TStyledControl(Control);
    Style := TStyledControl.LookupStyleObject(StyledControl, StyledControl, StyledControl.Scene, StyledControl.StyleLookup,
      StyledControl.DefaultStyleLookupName, '', False);
    if Style <> nil then
    begin
      StyleObject := Style.FindStyleResource('font'); // Do not localize
      if Supports(StyleObject, IFontObject, FontObject) then
        Model.TextSettingsInfo.DefaultTextSettings.Font := FontObject.Font;
    end;
    FIsStyledFontLoaded := True;
    UpdateTextSettings;
  end;
end;

procedure TAndroidNativeEdit.PMInit(var AMessage: TDispatchMessage);
begin
  inherited;
  UpdateText;
  UpdateTextMaxLength;
  UpdateTextPrompt;
  UpdateTextSettings;
  UpdateInputType;
  UpdateReturnKeyType;
  UpdateSelection;
  UpdateInputFilters;
  UpdateVisibleOfClearButton;
end;

procedure TAndroidNativeEdit.PMNeedStyleLookup(var AMessage: TDispatchMessage);
begin
  FIsStyledFontLoaded := False;
end;

procedure TAndroidNativeEdit.MMSelLenghtChanged(var AMessage: TDispatchMessageWithValue<Integer>);
begin
  UpdateSelection;
end;

procedure TAndroidNativeEdit.MMSelStartChanged(var AMessage: TDispatchMessageWithValue<Integer>);
begin
  UpdateSelection;
end;

procedure TAndroidNativeEdit.MMPasswordChanged(var AMessage: TDispatchMessage);
begin
  UpdateInputType;
  GetInputMethodManager.restartInput(View);
end;

procedure TAndroidNativeEdit.MMTextSettingsChanged(var AMessage: TDispatchMessage);
begin
  UpdateTextSettings;
end;

procedure TAndroidNativeEdit.MMTextChanged(var AMessage: TDispatchMessageWithValue<string>);
begin
  UpdateText;
end;

procedure TAndroidNativeEdit.MMMaxLengthChanged(var AMessage: TDispatchMessage);
begin
  UpdateTextMaxLength;
end;

procedure TAndroidNativeEdit.MMPromptTextChanged(var AMessage: TDispatchMessage);
begin
  UpdateTextPrompt;
end;

procedure TAndroidNativeEdit.MMKeyboardTypeChanged(var AMessage: TDispatchMessage);
begin
  UpdateInputType;
  GetInputMethodManager.restartInput(View);
end;

procedure TAndroidNativeEdit.MMReturnTypeChanged(var AMessage: TDispatchMessage);
begin
  UpdateReturnKeyType;
  GetInputMethodManager.restartInput(View);
end;

procedure TAndroidNativeEdit.MMCaretPositionChanged(var AMessage: TDispatchMessageWithValue<Integer>);
begin
  UpdateSelection;
end;

procedure TAndroidNativeEdit.MMCharCaseChanged(var AMessage: TDispatchMessage);
begin
  UpdateInputFilters;
end;

procedure TAndroidNativeEdit.MMCheckSpellingChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateInputType;
end;

procedure TAndroidNativeEdit.MMEditButtonsChanged(var AMessage: TDispatchMessage);
begin
  UpdateVisibleOfClearButton;
end;

procedure TAndroidNativeEdit.MMReadOnlyChanged(var AMessage: TDispatchMessage);
begin
  UpdateInputType;
  if View.isFocused then
  begin
    if Model.ReadOnly then
      GetInputMethodManager.hideSoftInputFromWindow(View.getWindowToken, 0)
    else
      GetInputMethodManager.restartInput(View);
  end;
end;

procedure TAndroidNativeEdit.MMFilterCharChanged(var AMessage: TDispatchMessage);
begin
  UpdateInputFilters;
end;

function TAndroidNativeEdit.ProcessTouch(view: JView; event: JMotionEvent): Boolean;

  function IsClickedOnClearButton: Boolean;
  begin
    Result := (event.getAction = TJMotionEvent.JavaClass.ACTION_UP) and
              (event.getX >= (View.getRight - Self.View.getCompoundPaddingRight));
  end;

begin
  inherited;
  // This handler implements clear button functionality
  if FEditHasClearButton and not Edit.Text.IsEmpty and IsClickedOnClearButton then
  begin
    Self.View.setText(StrToJCharSequence(string.Empty), TJTextView_BufferType.JavaClass.NORMAL);
    Result := True;
  end
  else
    Result := False;
end;

function TAndroidNativeEdit.DefineModelClass: TDataModelClass;
begin
  Result := TCustomEditModel;
end;

function TAndroidNativeEdit.CreateView: JView;
begin
  Result := TJEditText.JavaClass.init(TAndroidHelper.Activity);
end;

procedure TAndroidNativeEdit.InitView;
var
  BackgroundWithInset: JInsetDrawable;
  PaddingLeft: Integer;
  PaddingRight: Integer;
begin
  inherited;
  View.setSingleLine(True);
  View.setClickable(True);
  View.setSelectAllOnFocus(True);
  View.setFocusable(True);
  View.setFocusableInTouchMode(True);

  // Standard android theme uses internal padding for EditText. But we don't use them in firemonkey styles.
  if TJNIResolver.IsInstanceOf(View.getBackground, TJInsetDrawable.GetClsID) then
  begin
    BackgroundWithInset := TJInsetDrawable.Wrap(View.getBackground);
    PaddingLeft := View.getPaddingLeft;
    PaddingRight := View.getPaddingRight;

    BackgroundWithInset := TJInsetDrawable.JavaClass.init(BackgroundWithInset.getDrawable, 0, 0, 0, 0);
    View.setBackground(BackgroundWithInset);
    View.setPadding(PaddingLeft, 0, PaddingRight, 0);
  end;
end;

constructor TAndroidNativeEdit.Create;
begin
  inherited;
  FTextChangesListener := TAndroidTextChangedListener.Create(Self);
  View.addTextChangedListener(FTextChangesListener);
  FEditHasClearButton := False;
  FIsStyledFontLoaded := False;
  FCaret := TCaret.Create(Control);
end;

destructor TAndroidNativeEdit.Destroy;
begin
  View.removeTextChangedListener(FTextChangesListener);
  FreeAndNil(FTextChangesListener);
  FreeAndNil(FCaret);
  inherited;
end;

procedure TAndroidNativeEdit.SetFocus;
var
  LinkIsNotReset: Boolean;
begin
  inherited;
  // It's important to work with keyboard via fmx caret. Because logic of switch focus between two text-input controls
  // without hiding virtual keyboard depends on Caret implementation.
  if not Model.ReadOnly then
    ShowCaret;
  // Live Binding
  LinkIsNotReset := True;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkEdit(Observers) then
      TLinkObservers.EditLinkModified(Observers)
    else
    begin
      TLinkObservers.EditLinkReset(Observers);
      LinkIsNotReset := False;
    end;
  if Observers.IsObserving(TObserverMapping.ControlValueID) and LinkIsNotReset then
    TLinkObservers.ControlValueModified(Observers);
end;

procedure TAndroidNativeEdit.ShowCaret;
begin
  FCaret.Visible := True;
  FCaret.Show;
end;

procedure TAndroidNativeEdit.ResetFocus;
begin
  inherited;
  HideCaret;
  Model.Change;
  // Live Binding
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueUpdate(Observers);
end;

{ TAndroidTextWatcher }

procedure TAndroidTextChangedListener.afterTextChanged(s: JEditable);
begin
end;

procedure TAndroidTextChangedListener.beforeTextChanged(s: JCharSequence; start, count, after: Integer);
begin
end;

constructor TAndroidTextChangedListener.Create(const ANativeEdit: TAndroidNativeEdit);
begin
  inherited Create;
  FNativeEdit := ANativeEdit;
end;

procedure TAndroidTextChangedListener.onTextChanged(s: JCharSequence; start, before, count: Integer);
begin
  FNativeEdit.Model.DisableNotify;
  try
    FNativeEdit.Model.Text := JCharSequenceToStr(s);
  finally
    FNativeEdit.Model.EnableNotify;
  end;
  FNativeEdit.UpdateVisibleOfClearButton;
end;

initialization
  TPresentationProxyFactory.Current.Register(TEdit, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeEdit>);
finalization
  TPresentationProxyFactory.Current.Unregister(TEdit, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeEdit>);
end.
