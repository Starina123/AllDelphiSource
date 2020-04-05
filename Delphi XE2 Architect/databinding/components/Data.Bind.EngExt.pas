{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.Bind.EngExt"'}    {Do not Localize}
unit Data.Bind.EngExt;

// Register binding engine extensions

interface

implementation

uses Data.Bind.Components, System.Bindings.EvalProtocol, System.SysUtils, System.Classes,
  Data.Bind.Consts, System.Rtti, System.Bindings.Methods;


function GetCheckedState(AObject: TObject): string;
var
  LEditor: IBindCheckBoxEditor;
begin
  Result := '';
  if Supports(GetBindEditor(AObject, IBindCheckBoxEditor), IBindCheckBoxEditor, LEditor) then
  begin
    case LEditor.State of
      cbChecked: Result := BoolToStr(True, True);
      cbUnchecked:  Result := BoolToStr(False, True);
      cbGrayed: Result := '';
    end;
  end;
end;

function GetSelectedText(AObject: TObject): string;
var
  LEditor: IBindListEditor;
begin
  Result := '';
  if Supports(GetBindEditor(AObject, IBindListEditor), IBindListEditor, LEditor) then
  begin
    Result := LEditor.SelectedText;
  end;
end;

function GetSelectedItem(AObject: TObject): TObject;
var
  LEditor: IBindListEditor;
begin
  Result := nil;
  if Supports(GetBindEditor(AObject, IBindListEditor), IBindListEditor, LEditor) then
  begin
    Result := LEditor.SelectedItem;
  end;
end;

procedure SetCheckedState(AObject: TObject; const AValue: string);
var
  LEditor: IBindCheckBoxEditor;
  BoolVal: Boolean;
begin
  if Assigned(AObject) then
    if Supports(GetBindEditor(AObject, IBindCheckBoxEditor), IBindCheckBoxEditor, LEditor) then
    begin
      if TryStrToBool(AValue, BoolVal) then
      begin
        if BoolVal then
          LEditor.State := cbChecked
        else
          LEditor.State := cbUnchecked;
      end
      else if LEditor.AllowGrayed then
        LEditor.State := cbGrayed
      else
        LEditor.State := cbUnchecked;
    end;
end;

procedure SetSelectedText(AObject: TObject; const AValue: string);
var
  LEditor: IBindListEditor;
begin
  if AObject <> nil then

  if Supports(GetBindEditor(AObject, IBindListEditor), IBindListEditor, LEditor) then
  begin
    LEditor.SelectedText := AValue;
  end;
end;

function MakeCheckedState: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(sArgCount);
    v := Args[0];
    Result := MakeLocation(TypeInfo(string),
      function: TValue
      begin
        if v.GetValue.IsEmpty then
          Result := TValue.Empty
        else
          Result := GetCheckedState(v.GetValue.AsObject);
      end,
      procedure(x: TValue)
      begin
        SetCheckedState(v.GetValue.AsObject, x.AsString);
      end);
  end);
end;

function MakeSelectedText: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
//    loc: ILocation;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(sArgCount);
    v := Args[0];
    Result := MakeLocation(TypeInfo(string),
      function: TValue
      begin
        if v.GetValue.IsEmpty then
          Result := TValue.Empty
        else
          Result := GetSelectedText(v.GetValue.AsObject);
      end,
      procedure(x: TValue)
      begin
        SetSelectedText(v.GetValue.AsObject, x.AsString);
      end);
  end);
end;

function MakeSelectedItem: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
//    loc: ILocation;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(sArgCount);
    v := Args[0];
    if v.GetValue.IsEmpty then
      Result := TValueWrapper.Create(nil)
    else
      Result := TValueWrapper.Create(GetSelectedItem(v.GetValue.AsObject));
  end);
end;

const
  sIDCheckedState = 'CheckedState';
  sIDSelectedText = 'SelectedText';
  sIDSelectedItem = 'SelectedItem';
  sThisUnit = 'Data.Bind.EngExt';

procedure RegisterMethods;
begin
    TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(
        MakeCheckedState,
        sIDCheckedState,
        sCheckedState,
        sThisUnit,
        True,
        sCheckedStateDesc, nil)
    );
    TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(
        MakeSelectedText,
        sIDSelectedText,
        sSelectedText,
        sThisUnit,
        True,
        sSelectedTextDesc, nil)
    );

    TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(
        MakeSelectedItem,
        sIDSelectedItem,
        sSelectedItem,
        sThisUnit,
        True,
        sSelectedItemDesc, nil)
    );

end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sIDSelectedText);
  TBindingMethodsFactory.UnRegisterMethod(sIDSelectedItem);
  TBindingMethodsFactory.UnRegisterMethod(sIDCheckedState);
end;


initialization
  RegisterMethods;
finalization
  UnregisterMethods;

end.
