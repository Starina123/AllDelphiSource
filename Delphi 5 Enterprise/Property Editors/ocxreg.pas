unit OCXReg;

interface

uses Windows, Activex, SysUtils, ComObj, Classes, Graphics, Controls, Forms,
  Dialogs, TypInfo, DsgnIntf, OleCtrls;

type
{ TOleControlEditor }

  TOleControlEditor = class(TDefaultEditor)
  private
    FVerbs: TStringList;
  protected
    property Verbs: TStringList read FVerbs;
    procedure DoVerb(Verb: Integer); virtual;
  public
    constructor Create(AComponent: TComponent; ADesigner: IFormDesigner); override;
    destructor Destroy; override;
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TOleObjectEditor = class
  private
    FPropertyEditor: TPropertyEditor;
  public
    constructor Create(PropertyEditor: TPropertyEditor); virtual;
    function Edit(OleObject: Variant): Variant; virtual;
    property PropertyEditor: TPropertyEditor read FPropertyEditor;
  end;

  TOleFontEditor = class(TOleObjectEditor)
    function Edit(OleObject: Variant): Variant; override;
  end;

  TOleObjectProperty = class(TPropertyEditor)
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure GetProperties(Proc: TGetPropEditProc); override;
  end;

  TOleCustomProperty = class(TPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TOlePropPageProperty = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TOleEnumProperty = class(TOrdinalProperty)
  private
    FEnumPropDesc: TEnumPropDesc;
  protected
    property EnumPropDesc: TEnumPropDesc read FEnumPropDesc;
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure Initialize; override;
    procedure SetValue(const Value: string); override;
  end;

  TOleObjectEditorClass = class of TOleObjectEditor;

procedure RegisterOleObjectEditor(const IID: TIID; const ClassName: string;
  EditorClass: TOleObjectEditorClass);

procedure Register;

implementation

uses DesignConst;

type
  POleObjectClassRec = ^TOleObjectClassRec;
  TOleObjectClassRec = record
    Next: POleObjectClassRec;
    IID: TIID;
    ClassName: string;
    EditorClass: TOleObjectEditorClass;
  end;

var
  OleObjectClassList: POleObjectClassRec = nil;

function GetOleObjectClassRec(OleObject: Variant): POleObjectClassRec;
var
  Dispatch: IDispatch;
  Unknown: IUnknown;
begin
  if VarType(OleObject) = varDispatch then
  begin
    Dispatch := IUnknown(OleObject) as IDispatch;
    if Dispatch <> nil then
    begin
      Result := OleObjectClassList;
      while Result <> nil do
      begin
        if Dispatch.QueryInterface(Result^.IID, Unknown) = 0 then  Exit;
        Result := Result^.Next;
      end;
    end;
  end;
  Result := nil;
end;

{ TOleControlEditor }

constructor TOleControlEditor.Create(AComponent: TComponent;
  ADesigner: IFormDesigner);
begin
  inherited Create(AComponent, ADesigner);
  FVerbs := TStringList.Create;
end;

destructor TOleControlEditor.Destroy;
begin
  FVerbs.Free;
  inherited Destroy;
end;

procedure TOleControlEditor.DoVerb(Verb: Integer);
begin
  try
    if Verb = -65536 then
      TOleControl(Component).ShowAboutBox
    else
      TOleControl(Component).DoObjectVerb(Verb);
  except
    case Verb of
      -65536: raise Exception.CreateRes(@SNoAboutBoxAvailable);
      OLEIVERB_PROPERTIES: raise Exception.CreateRes(@SNoPropertyPageAvailable);
    else
      raise;
    end;
  end;
end;

procedure TOleControlEditor.Edit;
begin
  DoVerb(OLEIVERB_PROPERTIES);
end;

procedure TOleControlEditor.ExecuteVerb(Index: Integer);
begin
  DoVerb(Integer(FVerbs.Objects[Index]));
end;

function TOleControlEditor.GetVerb(Index: Integer): string;
begin
  Result := FVerbs[Index];
end;

function TOleControlEditor.GetVerbCount: Integer;
var
  TI: ITypeInfo;
  W: WideString;
  N: Integer;
begin
  TOleControl(Component).GetObjectVerbs(FVerbs);
  if ((IUnknown(TOleControl(Component).OleObject) as IDispatch).GetTypeInfo(0,0,TI) = S_OK) and
    (TI.GetNames(DISPID_ABOUTBOX, @W, 1, N) = S_OK) and
    (FVerbs.IndexOf(SAboutVerb) = -1) and
    (FVerbs.IndexOfObject(TObject(-65536)) = -1) then
    FVerbs.AddObject(SAboutVerb, TObject(-65536));
  Result := FVerbs.Count;
end;

function MapOleCustomProperty(Obj: TPersistent;
  PropInfo: PPropInfo): TPropertyEditorClass;
begin
  Result := nil;
  if (DWORD(PropInfo^.Index) <> $80000000) and (Obj is TOleControl) then
  begin
    if TOleControl(Obj).IsPropPageProperty(PropInfo^.Index) then
      Result := TOlePropPageProperty
    else if TOleControl(Obj).IsCustomProperty(PropInfo^.Index) then
      Result := TOleCustomProperty;
  end;
end;

{ TOleCustomProperty }

function TOleCustomProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList];
end;

function TOleCustomProperty.GetValue: string;
begin
  Result := TOleControl(GetComponent(0)).GetPropDisplayString(
    GetPropInfo^.Index);
end;

procedure TOleCustomProperty.GetValues(Proc: TGetStrProc);
var
  Values: TStringList;
  I: Integer;
begin
  Values := TStringList.Create;
  try
    TOleControl(GetComponent(0)).GetPropDisplayStrings(
      GetPropInfo^.Index, Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

procedure TOleCustomProperty.SetValue(const Value: string);
begin
  TOleControl(GetComponent(0)).SetPropDisplayString(
    GetPropInfo^.Index, Value);
end;

{ TOlePropPageProperty }

function TOlePropPageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paMultiSelect];
end;

procedure TOlePropPageProperty.Edit;
var
  PPID: TCLSID;
  OleCtl: TOleControl;
  OleCtls: array of IDispatch;
  Params: TOCPFIParams;
  Caption: WideString;
  I, DispID: Integer;
begin
  SetLength(OleCtls, PropCount);
  for I := 0 to PropCount - 1 do
  begin
    OleCtls[I] := TOleControl(GetComponent(0)).DefaultDispatch;
    if Caption <> '' then Caption := Caption + ', ';
    Caption := Caption + TOleControl(GetComponent(0)).Name;
  end;
  OleCtl := TOleControl(GetComponent(0));
  if OleCtl.PerPropBrowsing <> nil then
  begin
    DispID := GetPropInfo^.Index;
    OleCtl.PerPropBrowsing.MapPropertyToPage(DispID, PPID);
    if not IsEqualCLSID(PPID, GUID_NULL) then
    begin
      with Params do
      begin
        cbStructSize := SizeOf(Params);
        hWndOwner := GetActiveWindow;
        x := 16;
        y := 16;
        lpszCaption := PWideChar(Caption);
        cObjects := PropCount;
        pObjects := @OleCtls[0];
        cPages := 1;
        pPages := @PPID;
        lcid := GetUserDefaultLCID;
        dispidInitialProperty := DispID;
      end;
      OleCreatePropertyFrameIndirect(Params);
    end;
  end;
end;

{ TOleEnumProperty }

function TOleEnumProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList];
end;

function TOleEnumProperty.GetValue: string;
begin
  if FEnumPropDesc <> nil then
    Result := FEnumPropDesc.ValueToString(GetOrdValue)
  else
    Result := IntToStr(GetOrdValue);
end;

procedure TOleEnumProperty.GetValues(Proc: TGetStrProc);
begin
  if FEnumPropDesc <> nil then FEnumPropDesc.GetStrings(Proc);
end;

procedure TOleEnumProperty.Initialize;
begin
  FEnumPropDesc := TOleControl(GetComponent(0)).GetEnumPropDesc(
    GetPropInfo^.Index);
end;

procedure TOleEnumProperty.SetValue(const Value: string);
begin
  if FEnumPropDesc <> nil then
    SetOrdValue(FEnumPropDesc.StringToValue(Value)) else
    SetOrdValue(StrToInt(Value));
end;

{ TOleObjectEditor }

constructor TOleObjectEditor.Create(PropertyEditor: TPropertyEditor);
begin
  FPropertyEditor := PropertyEditor;
end;

function TOleObjectEditor.Edit(OleObject: Variant): Variant;
begin
  VarClear(Result);
end;

{ TOleFontEditor }

function TOleFontEditor.Edit(OleObject: Variant): Variant;
begin
  VarClear(Result);
  with TFontDialog.Create(Application) do
    try
      OleFontToFont(OleObject, Font);
      Options := Options + [fdForceFontExist];
      if Execute then Result := FontToOleFont(Font);
    finally
      Free;
    end;
end;

{ TVariantTypeProperty }

var
  VarTypeNames: array[0..varByte] of string = ('Unassigned', 'Null', 'Smallint',
    'Integer', 'Single', 'Double', 'Currency', 'Date', 'OleStr', '', '',
    'Boolean', '', '', '', '', '', 'Byte');

type

  TVariantTypeProperty = class(TNestedProperty)
  public
    function AllEqual: Boolean; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetName: string; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
   end;

function TVariantTypeProperty.AllEqual: Boolean;
var
  i: Integer;
  V1, V2: Variant;
begin
  Result := False;
  if PropCount > 1 then
  begin
    V1 := GetVarValue;
    for i := 1 to PropCount - 1 do
    begin
      V2 := GetVarValueAt(i);
      if VarType(V1) <> VarType(V2) then Exit;
    end;
  end;
  Result := True;
end;

function TVariantTypeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList];
end;

function TVariantTypeProperty.GetName: string;
begin
  Result := 'Type';
end;

function TVariantTypeProperty.GetValue: string;
begin
  case VarType(GetVarValue) and varTypeMask of
    0..varByte: Result := VarTypeNames[VarType(GetVarValue)];
    varString: Result := SString;
  else
    Result := SUnknown;
  end;
end;

procedure TVariantTypeProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  for i := 0 to High(VarTypeNames) do
    if VarTypeNames[i] <> '' then
      Proc(VarTypeNames[i]);
  Proc(SString);
end;

procedure TVariantTypeProperty.SetValue(const Value: string);

  function GetSelectedType: Integer;
  var
    i: Integer;
  begin
    Result := -1;
    for i := 0 to High(VarTypeNames) do
      if VarTypeNames[i] = Value then
      begin
        Result := i;
        break;
      end;
    if (Result = -1) and (Value = SString) then
      Result := varString;
  end;

var
  NewType: Integer;
  V: Variant;
begin
  V := GetVarValue;
  NewType := GetSelectedType;
  case NewType of
    varEmpty: VarClear(V);
    varNull: V := NULL;
    -1: raise Exception.CreateRes(@SUnknownType);
  else
    try
      VarCast(V, V, NewType);
    except
      { If it cannot cast, clear it and then cast again. }
      VarClear(V);
      VarCast(V, V, NewType);
    end;
  end;
  SetVarValue(V);
end;

{ TOleObjectProperty }

procedure TOleObjectProperty.Edit;
var
  P: POleObjectClassRec;
  Value: Variant;
  Editor: TOleObjectEditor;
begin
  Value := GetVarValue;
  P := GetOleObjectClassRec(Value);
  if P <> nil then
  begin
    Editor := P^.EditorClass.Create(Self);
    try
      Value := Editor.Edit(Value);
    finally
      Editor.Free;
    end;
    if VarType(Value) = varDispatch then SetVarValue(Value);
  end;
end;

function TOleObjectProperty.GetAttributes: TPropertyAttributes;
var
  Value: Variant;
begin
  try
    Value := GetVarValue;
  except
    Value := Null;
  end;
  if GetOleObjectClassRec(Value) <> nil then
    Result := [paMultiSelect, paReadOnly, paDialog] else
    Result := [paMultiSelect, paSubProperties];
end;

function TOleObjectProperty.GetValue: string;

  function GetVariantStr(const Value: Variant): string;
  begin
    case VarType(Value) of
      varEmpty: Result := '';
      varNull: Result := SNull;
      varBoolean:
        if Value then
          Result := BooleanIdents[True] else
          Result := BooleanIdents[False];
      varCurrency:
        Result := CurrToStr(Value);
    else
      Result := string(Value);
    end;
  end;

var
  P: POleObjectClassRec;
  Value: Variant;
begin
  Value := GetVarValue;
  if VarType(Value) <> varDispatch then
    Result := GetVariantStr(Value)
  else
  begin
    P := GetOleObjectClassRec(Value);
    if P <> nil then
      Result := '(' + P^.ClassName + ')' else
      Result := '(OleObject)';
  end
end;

procedure TOleObjectProperty.SetValue(const Value: string);

  function Cast(var Value: Variant; NewType: Integer): Boolean;
  var
    V2: Variant;
  begin
    Result := True;
    if NewType = varCurrency then
      Result := AnsiPos(CurrencyString, Value) > 0;
    if Result then
    try
      VarCast(V2, Value, NewType);
      Result := (NewType = varDate) or (VarToStr(V2) = VarToStr(Value));
      if Result then Value := V2;
    except
      Result := False;
    end;
  end;

var
  V: Variant;
  OldType: Integer;
begin
  OldType := VarType(GetVarValue);
  V := Value;
  if Value = '' then
    VarClear(V) else
  if (CompareText(Value, SNull) = 0) then
    V := NULL else
  if not Cast(V, OldType) then
    V := Value;
  SetVarValue(V);
end;

procedure TOleObjectProperty.GetProperties(Proc: TGetPropEditProc);
begin
  Proc(TVariantTypeProperty.Create(Self));
end;

procedure RegisterOleObjectEditor(const IID: TIID; const ClassName: string;
  EditorClass: TOleObjectEditorClass);
var
  P: POleObjectClassRec;
begin
  New(P);
  P^.Next := OleObjectClassList;
  P^.IID := IID;
  P^.ClassName := ClassName;
  P^.EditorClass := EditorClass;
  OleObjectClassList := P;
end;

{ Registration }

procedure Register;
begin
  RegisterComponentEditor(TOleControl, TOleControlEditor);
  RegisterPropertyMapper(MapOleCustomProperty);
  RegisterPropertyEditor(TypeInfo(TOleEnum), TOleControl, '', TOleEnumProperty);
  RegisterPropertyEditor(TypeInfo(Variant), nil, '', TOleObjectProperty);
  RegisterPropertyEditor(TypeInfo(SmallInt), TOleControl, 'Cursor', TCursorProperty);
  RegisterOleObjectEditor(IFontDisp, 'OleFont', TOleFontEditor);
end;

end.
