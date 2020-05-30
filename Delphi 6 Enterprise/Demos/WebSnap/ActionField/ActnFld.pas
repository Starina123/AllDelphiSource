unit ActnFld;

interface

uses DBAdapt, WebAdapt, AdaptReq, Classes;

type
  TBaseDataSetAdapterActionField = class(TAdapterNamedField, ICheckValueChange, IExecuteValue,
    IDataSetAdapterFieldClass)
  private
    function GetAdapter: TCustomDataSetAdapter;
  protected
    { ICheckValueChange }
    function CheckValueChange(AActionRequest: IActionRequest; AFieldIndex: Integer): Boolean;
    function ImplCheckValueChange(AActionRequest: IActionRequest; AFieldIndex: Integer): Boolean; virtual;
    function FullyQualifyInputName: Boolean; override;
    property Adapter: TCustomDataSetAdapter read GetAdapter;
    { IExecuteValue }
    procedure ExecuteValue(AActionRequest: IActionRequest; AFieldIndex: Integer);
    procedure ImplExecuteValue(AActionRequest: IActionRequest; AFieldIndex: Integer); virtual;
    { IWebVariableName, IGetWebFieldValue }
    function ImplGetValue: Variant; override;
  end;

  TCustomDataSetAdapterDeleteRowField = class(TBaseDataSetAdapterActionField)
  protected
    function LocateKeyParamsOfStrings(
      AValues: TStrings): TLocateParamsList;
    { IExecuteValue }
    procedure ImplExecuteValue(AActionRequest: IActionRequest; AFieldIndex: Integer); override;
  end;

  TDataSetAdapterDeleteRowField = class(TCustomDataSetAdapterDeleteRowField)
  published
    property ViewAccess;
    property ModifyAccess;
  end;

implementation

uses WebDisp, SysUtils, SiteComp;

{ TBaseDataSetAdapterActionField }

function TBaseDataSetAdapterActionField.ImplGetValue: Variant;
var
  Params: IAdapterItemRequestParams;
begin
  Params := TAdapterItemRequestParams.Create;
  Adapter.EncodeActionParamsFlags(Params, [poLocateParams]);
  Result := EncodeParamNameValues(Params.ParamValues);
end;

function TBaseDataSetAdapterActionField.GetAdapter: TCustomDataSetAdapter;
begin
  if (inherited Adapter <> nil) and (inherited Adapter is TCustomDataSetAdapter) then
    Result := TCustomDataSetAdapter(inherited Adapter)
  else
    Result := nil;
end;

function TBaseDataSetAdapterActionField.FullyQualifyInputName: Boolean;
begin
  Result :=  (Adapter <> nil) and
   ((Adapter.MasterAdapter <> nil) or (Adapter.DetailAdapters.Count >= 1));
end;

function TBaseDataSetAdapterActionField.CheckValueChange(
  AActionRequest: IActionRequest; AFieldIndex: Integer): Boolean;
begin
  Result := ImplCheckValueChange(AActionRequest, AFieldIndex);
end;

function TBaseDataSetAdapterActionField.ImplCheckValueChange(
  AActionRequest: IActionRequest; AFieldIndex: Integer): Boolean;
begin
  // If sent then updates are needed
  Result := True;
end;

procedure TBaseDataSetAdapterActionField.ExecuteValue(
  AActionRequest: IActionRequest; AFieldIndex: Integer);
begin
  ImplExecuteValue(AActionRequest, AFieldIndex);
end;

procedure TBaseDataSetAdapterActionField.ImplExecuteValue(
  AActionRequest: IActionRequest; AFieldIndex: Integer);
begin
  // Do nothing
  Assert(False);  // Descendent must implement
end;

function GetActionFieldValues(AActionRequest: IActionRequest): IActionFieldValues;
begin
  if not Supports(AActionRequest, IActionFieldValues, Result) then
    Assert(False);
end;

{ TCustomDataSetAdapterDeleteRowField }

function TCustomDataSetAdapterDeleteRowField.LocateKeyParamsOfStrings(AValues: TStrings): TLocateParamsList;
var
  I: Integer;
begin
  Result := TLocateParamsList.Create;
  try
    for I := 0 to AValues.Count - 1 do
      AddLocateParamsString(Adapter.Name, AValues.Names[I], ExtractStringValue(AValues[I]), Result);
  except
    Result.Free;
  end;
end;

procedure TCustomDataSetAdapterDeleteRowField.ImplExecuteValue(
  AActionRequest: IActionRequest; AFieldIndex: Integer);
  function DeleteRow: Boolean;
  begin
    Result := True;
    try
      Adapter.DataSet.Delete
    except
      // Add to error list
      on E: Exception do
      begin
        Adapter.Errors.AddError(E);
        Result := False;
      end;
    end;
  end;

var
  FieldValue: IActionFieldValue;
  S: string;
  Params: TStrings;
  LocateParams: TLocateParamsList;
begin
  Assert(Adapter <> nil);
  with GetActionFieldValues(AActionRequest) do
    FieldValue := Values[AFieldIndex];
  if FieldValue.ValueCount > 0 then
  begin
    if FieldValue.ValueCount = 1 then
    begin
      S := FieldValue.Values[0];
      Params := TStringList.Create;
      try
        ExtractParamNameValues(S, Params);
        LocateParams := LocateKeyParamsOfStrings(Params);
        try
          Adapter.SilentLocate(LocateParams, False);
          DeleteRow;
        finally
          LocateParams.Free;
        end;
      finally
        Params.Free;
      end;
    end
    else
      RaiseMultipleValuesException(FieldName)
  end
  else if FieldValue.FileCount > 0 then
    RaiseFileUploadNotSupported(FieldName);
end;

end.
 