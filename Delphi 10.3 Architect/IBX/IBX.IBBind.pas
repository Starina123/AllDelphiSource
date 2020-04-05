{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBBind;

interface

implementation

uses
  IBX.IBSQL, System.Bindings.Methods, System.Bindings.EvalProtocol,
  System.Rtti, System.TypInfo, IBX.IBCustomDataSet, Data.Db, IBX.IBFieldHelper,
  IBX.IBBind.Consts;

const
  sIBChangeStateToStr = 'IBXUtils_IBChangeStateToStr'; {do not localize}
  sFieldChangeState = 'IBXUtils_FieldChangeState'; {do not localize}
  sCachedUpdateState = 'IBXUtils_CachedUpdateState'; {do not localize}

function MakeIBChageStateToStr : IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(sArgCount);
    v := Args[0];
    if v.GetValue.IsEmpty then
      Exit(TValueWrapper.Create(nil));
    Exit(TValueWrapper.Create(v.GetValue.ToString));
  end);
end;

function MakeFieldChageState : IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v, ds: IValue;
    f : TField;
    cs : TIBChangeState;
  begin
    if Length(Args) > 2 then
      raise EEvaluatorError.Create(sArgCount);
    if Length(Args) = 2 then
    begin
      v := Args[1];
      ds := Args[0];
      if ds.GetValue.IsType<TIBCustomDataset> then
      begin
        case v.GetType.Kind of
          tkInteger, tkInt64:
          begin
            cs := ds.GetValue.AsType<TIBCustomDataset>.ChangeState(V.GetValue.AsInteger);
            Exit(TValueWrapper.Create(TValue.From<TIBChangeState>(cs).ToString));
          end;
          tkString, tkLString, tkWString, tkUString :
          begin
            cs := ds.GetValue.AsType<TIBCustomDataset>.ChangeState(V.GetValue.ToString);
            Exit(TValueWrapper.Create(TValue.From<TIBChangeState>(cs).ToString));
          end;
          else
            raise EEvaluatorError.Create(sInvalidSecondArg)
        end;
      end
      else
        raise EEvaluatorError.Create(sDatasetType)
    end
    else
    begin
      v := Args[0];
      if v.GetValue.IsEmpty or
         not v.GetValue.IsType<TField> then
        Exit(TValueWrapper.Create(nil));
      f := v.GetValue.AsType<TField>;
      Exit(TValueWrapper.Create(TValue.From<TIBChangeState>(F.ChangeState).ToString));
    end;
  end);
end;

function MakeCachedUpdateState : IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
    cs : TCachedUpdateStatus;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(sArgCount);
    v := Args[0];
    if v.GetValue.IsType<TIBCustomDataset> then
    begin
      cs := v.GetValue.AsType<TIBCustomDataSet>.CachedUpdateStatus;
      Exit(TValueWrapper.Create(TValue.From<TCachedUpdateStatus>(cs).ToString));
    end
    else
      raise EEvaluatorError.Create(sDatasetType);
  end);
end;

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(
      MakeIBChageStateToStr,
      sIBChangeStateToStr,
      sIBChangeStateToStr,
      '',
      True,
      '', nil)
  );

  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(
      MakeFieldChageState,
      sFieldChangeState,
      sFieldChangeState,
      '',
      True,
      '', nil)
  );

  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(
      MakeCachedUpdateState,
      sCachedUpdateState,
      sCachedUpdateState,
      '',
      True,
      '', nil)
  );

end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sIBChangeStateToStr);
  TBindingMethodsFactory.UnRegisterMethod(sFieldChangeState);
  TBindingMethodsFactory.UnRegisterMethod(sCachedUpdateState);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;

end.
