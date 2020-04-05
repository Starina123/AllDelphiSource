{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{Copyright(c) 2015-2018 Embarcadero Technologies, Inc.  }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMS.DataSetResource;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, System.Net.Mime,
    System.JSON, System.JSON.Readers, System.JSON.Writers,
  EMS.ResourceAPI, EMS.ResourceTypes,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Comp.BatchMove;

type
  TEMSDataSetAdaptor = class;
  TEMSDataSetAdaptorClass = class of TEMSDataSetAdaptor;
  TEMSFDDataSetAdaptor = class;
  TEMSDataSetResource = class;

  TEMSDataSetResouceOption = (roEnableParams, roEnablePaging, roEnableSorting,
    roReturnNewEntityKey, roReturnNewEntityValue, roAppendOnPut);
  TEMSDataSetResouceOptions = set of TEMSDataSetResouceOption;
  TEMSDataSetResouceMappingMode = (rmGuess, rmEntityToFields, rmEntityToRecord,
    rmEntityToParams);

  TEMSDataSetAdaptor = class (TObject)
  private
    type
      TRegInfo = class (TObject)
        FMimeType: string;
        FDataSetClass: TDataSetClass;
        FAdaptorClass: TEMSDataSetAdaptorClass;
      end;
    class var
      FRegistry: TObjectDictionary<string, TRegInfo>;
  public
    type
      TGetParamEvent = function (const AName: string): string of object;
  private
    [weak] FResource: TEMSDataSetResource;
    FContext: TEndpointContext;

    FDataSet: TDataSet;
    FProvider: IProviderSupportNG;
    FParams: TParams;

    FReqMimeType: string;
    FReqCharset: string;
    FRespMimeType: string;
    FRespCharset: string;

    FBatchMove: TFDBatchMove;
    FReader: TFDBatchMoveDriver;
    FWriter: TFDBatchMoveDriver;

    class constructor Create;
    class destructor Destroy;
    function CheckReaderClass<T: TFDBatchMoveDriver>: T;
    function CheckWriterClass<T: TFDBatchMoveDriver>: T;
  protected
    // REST methods
    procedure ProcessList; virtual;
    procedure ProcessGet; virtual;
    procedure ProcessDelete; virtual;
    procedure ProcessPost; virtual;
    procedure ProcessPut; virtual;
    procedure ProcessPutOtPost(AAction: TEMSBaseResource.TAction); virtual;
    // helpers
    function DelegateOpening(AAction: TEMSBaseResource.TAction): Boolean; virtual;
    procedure SetPaging(ARecsSkip, ARecsMax: Integer); overload; virtual;
    procedure SetSorting(const ASortingFields: string); overload; virtual;
    procedure ExceptionToHTTPError(AException: Exception); virtual;
    function RequireMetadataSetup(AAction: TEMSBaseResource.TAction): Boolean; virtual;

    procedure SetPaging; overload;
    procedure SetSorting; overload;
    procedure SetParamValues;
    procedure GetParamValues;
    procedure SetFieldValues;
    procedure GetFieldValues(const AFieldList: TStrings);
    function LocateEntity: Boolean;
    procedure DeleteEntity;
    function IsEntityNotNull: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class procedure Register(const AMimeType: string; ADataSetClass: TDataSetClass;
      AAdaptorClass: TEMSDataSetAdaptorClass);
    class procedure RegisterParent(ADataSetClass: TDataSetClass;
      AAdaptorClass: TEMSDataSetAdaptorClass); static;
    class function Lookup(const AMimeType: string; ADataSetClass: TDataSetClass;
      ARequired, AAllowDefault: Boolean): TEMSDataSetAdaptorClass;
  end;

  TEMSFDDataSetAdaptor = class (TEMSDataSetAdaptor)
  public const
    CSortMacro = 'SORT';
    CPageSkipMacro = 'SKIP';
    CPageMaxMacro = 'MAX';
  private
    class constructor Create;
    function GetFormat(const AMimeType: string; out ACharset: string): TFDStorageFormat;
    function GetFDDataSet: TFDDataSet; inline;
    function GetFDSchema: TFDCustomSchemaAdapter;
  protected
    // REST methods
    procedure ProcessList; override;
    procedure ProcessPost; override;
    // helpers
    function DelegateOpening(AAction: TEMSBaseResource.TAction): Boolean; override;
    procedure SetPaging(ARecsSkip, ARecsMax: Integer); override;
    procedure SetSorting(const ASortingFields: string); override;
    procedure ExceptionToHTTPError(AException: Exception); override;
    function RequireMetadataSetup(AAction: TEMSBaseResource.TAction): Boolean; override;
  end;

  TEMSDataSetResource = class (TEMSBaseResource)
  public const
    CDefaultPageParamName = 'page';
    CDefaultPageSize = 50;
    CDefaultSortingParamPrefix = 'sf';
  private
    FDataSet: TDataSet;
    FKeyFields: string;
    FKeyFieldList: TStrings;
    FValueFields: string;
    FValueFieldList: TStrings;
    FDefaultValueFields: Boolean;
    FMappingMode: TEMSDataSetResouceMappingMode;
    FOptions: TEMSDataSetResouceOptions;
    FPageParamName: string;
    FPageSize: Integer;
    FSortingParamPrefix: string;
    // runtime
    FAdaptor: TEMSDataSetAdaptor;
    procedure SetValueFields(const AValue: string);
    procedure SetKeyFields(const AValue: string);
    function IsPPNS: Boolean;
    function IsSPPS: Boolean;
    procedure SetDataSet(AValue: TDataSet);
    function GetRequestHeader(ARequest: TEndpointRequest; const AName: string): string;
    procedure SetResponse(AResponse: TEndpointResponse; var AStream: TStream);
    procedure PrepareAdapter(AContext: TEndpointContext; ARequest: TEndpointRequest;
      AResponse: TEndpointResponse; AAction: TEMSBaseResource.TAction);
    procedure GetResponseMime(const AContext: TEndpointContext; var AMimeType, ACharset: string);
    procedure GetRequestMime(const AContext: TEndpointContext; var AMimeType, ACharset: string);
  protected
    // TComponent
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CheckAction(const AContext: TEndpointContext; AAction: TEMSBaseResource.TAction); override;

    property KeyFieldList: TStrings read FKeyFieldList;
    property ValueFieldList: TStrings read FValueFieldList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    [ResourceSuffix('./')]
    [EndpointMethod(TEndpointRequest.TMethod.Get)]
    [EndpointProduce('application/json, *;q=0.9')]
    procedure List(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    [EndpointProduce('application/json, *;q=0.9')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    [EndpointConsume('application/json, *;q=0.9')]
    procedure Put(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./')]
    [EndpointConsume('application/json, *;q=0.9')]
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    procedure Delete(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

  published
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property KeyFields: string read FKeyFields write SetKeyFields;
    property ValueFields: string read FValueFields write SetValueFields;
    property MappingMode: TEMSDataSetResouceMappingMode read FMappingMode
      write FMappingMode default rmGuess;
    property Options: TEMSDataSetResouceOptions read FOptions write FOptions
      default [roEnableParams, roEnablePaging, roEnableSorting,
               roReturnNewEntityKey, roAppendOnPut];
    property PageParamName: string read FPageParamName write FPageParamName
      stored IsPPNS nodefault;
    property PageSize: Integer read FPageSize write FPageSize default CDefaultPageSize;
    property SortingParamPrefix: string read FSortingParamPrefix write FSortingParamPrefix
      stored IsSPPS nodefault;
                                                                    
                     
  end;

implementation

uses
  System.RTTI, System.Variants, System.JSON.Types, System.JSON.Builders,
  EMS.Consts,
  FireDAC.Stan.Error, FireDAC.Stan.Option, FireDAC.Comp.BatchMove.DataSet,
    FireDAC.Comp.BatchMove.Text, FireDAC.Comp.BatchMove.JSON, FireDAC.Stan.StorageJSON,
    FireDAC.Stan.Param;

const
  C_BinaryTypes: TFieldTypes = [ftBytes, ftVarBytes, ftBlob, ftGraphic,
    ftTypedBinary, ftOraBlob];
  C_StringTypes: TFieldTypes = [ftString, ftFixedChar, ftWideString,
    ftFixedWideChar, ftMemo, ftFmtMemo, ftDBaseOle, ftOraClob, ftWideMemo];
  C_DateTimeTypes: TFieldTypes = [ftDateTime, ftTimeStamp, ftTimeStampOffset,
    ftOraTimeStamp];
  C_ObjTypes: TFieldTypes = [ftADT, ftArray, ftReference, ftDataSet, ftInterface,
    ftIDispatch, ftConnection, ftParams, ftStream, ftObject];

{ TEMSDataSetAdaptor }

class constructor TEMSDataSetAdaptor.Create;
begin
  FRegistry := TObjectDictionary<string, TRegInfo>.Create([doOwnsValues]);
  Register('', TDataSet, TEMSDataSetAdaptor);
  Register('application/json', TDataSet, TEMSDataSetAdaptor);
  Register('application/javascript', TDataSet, TEMSDataSetAdaptor);
  Register('application/bson', TDataSet, TEMSDataSetAdaptor);
  Register('text/plain', TDataSet, TEMSDataSetAdaptor);
  Register('text/csv', TDataSet, TEMSDataSetAdaptor);
end;

class destructor TEMSDataSetAdaptor.Destroy;
begin
  FreeAndNil(FRegistry);
end;

class procedure TEMSDataSetAdaptor.Register(const AMimeType: string;
  ADataSetClass: TDataSetClass; AAdaptorClass: TEMSDataSetAdaptorClass);
var
  LInfo: TRegInfo;
begin
  if (ADataSetClass = nil) or (AAdaptorClass = nil) then
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sInvalidDataSetAdaptor);
  LInfo := TRegInfo.Create;
  LInfo.FMimeType := AMimeType;
  LInfo.FDataSetClass := ADataSetClass;
  LInfo.FAdaptorClass := AAdaptorClass;
  FRegistry.AddOrSetValue(LowerCase(AMimeType + '/' + ADataSetClass.ClassName), LInfo);
end;

class procedure TEMSDataSetAdaptor.RegisterParent(
  ADataSetClass: TDataSetClass; AAdaptorClass: TEMSDataSetAdaptorClass);
var
  LItem: TPair<string, TRegInfo>;
begin
  for LItem in FRegistry do
    if ADataSetClass.InheritsFrom(LItem.Value.FDataSetClass) then
      Register(LItem.Value.FMimeType, ADataSetClass, AAdaptorClass);
end;

class function TEMSDataSetAdaptor.Lookup(const AMimeType: string;
  ADataSetClass: TDataSetClass; ARequired, AAllowDefault: Boolean): TEMSDataSetAdaptorClass;
var
  LClass: TDataSetClass;
  LInfo: TRegInfo;
begin
  Result := nil;
  LInfo := nil;
  LClass := ADataSetClass;
  while not FRegistry.TryGetValue(LowerCase(AMimeType + '/' + LClass.ClassName), LInfo) and
        LClass.ClassParent.InheritsFrom(TDataSet) do
    LClass := TDataSetClass(LClass.ClassParent);
  if LInfo = nil then
  begin
    if AAllowDefault then
      Result := Lookup('', ADataSetClass, ARequired, False)
    else if ARequired then
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorNotFound);
  end
  else
    Result := LInfo.FAdaptorClass;
end;

constructor TEMSDataSetAdaptor.Create;
begin
  inherited Create;
  FBatchMove := TFDBatchMove.Create(nil);
  FReader := TFDBatchMoveDataSetReader.Create(FBatchMove);
  FWriter := TFDBatchMoveJSONWriter.Create(FBatchMove);
end;

destructor TEMSDataSetAdaptor.Destroy;
begin
  FReader := nil;
  FWriter := nil;
  FreeAndNil(FBatchMove);
  inherited Destroy;
end;

function TEMSDataSetAdaptor.CheckReaderClass<T>: T;
begin
  if (FReader <> nil) and not FReader.InheritsFrom(T) then
    FreeAndNil(FReader);
  if FReader = nil then
    FReader := T.Create(FBatchMove);
  Result := FReader as T;
end;

function TEMSDataSetAdaptor.CheckWriterClass<T>: T;
begin
  if (FWriter <> nil) and not FWriter.InheritsFrom(T) then
    FreeAndNil(FWriter);
  if FWriter = nil then
    FWriter := T.Create(FBatchMove);
  Result := FWriter as T;
end;

function TEMSDataSetAdaptor.DelegateOpening(AAction: TEMSBaseResource.TAction): Boolean;
begin
  Result := (AAction <> TEMSBaseResource.TAction.List) and
    (FResource.MappingMode in [rmEntityToFields, rmEntityToRecord]);
end;

procedure TEMSDataSetAdaptor.SetPaging;
var
  LVal: string;
  LPage: Integer;
begin
  if FContext.Request.Params.TryGetValue(FResource.PageParamName, LVal) then
    if LVal <> '' then begin
      LPage := StrToInt(LVal);
      if LPage <= 0 then
        EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorInvalidPaging);
      SetPaging((LPage - 1) * FResource.PageSize, FResource.PageSize);
    end
    else
      SetPaging(-1, -1);
end;

procedure TEMSDataSetAdaptor.SetPaging(ARecsSkip, ARecsMax: Integer);
begin
  if (ARecsSkip > 0) or (ARecsMax >= 0) then
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorNoPaging);
end;

procedure TEMSDataSetAdaptor.SetSorting;
var
  LSortingFields, LName, LVal: string;
  i: Integer;
  LPar: TEndpointParams.TPairItem;
begin
  LSortingFields := '';
  for i := 0 to FContext.Request.Params.Count - 1 do begin
    LPar := FContext.Request.Params.Pairs[i];
    LName := LPar.Key;
    LVal := LPar.Value;
    if Pos(FResource.SortingParamPrefix, LName) = 1 then begin
      LName := Copy(LName, Length(FResource.SortingParamPrefix) + 1, MaxInt);
      if not FResource.FDefaultValueFields and (FResource.ValueFieldList.IndexOf(LName) = -1) then
        EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorInvalidSorting);
      if (LVal = '') or (LVal = '-1') or SameText(LVal, 'A') then
        LVal := ':A'
      else if (LVal = '1') or SameText(LVal, 'D') then
        LVal := ':D'
      else
        EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorInvalidSorting);
      if LSortingFields <> '' then
        LSortingFields := LSortingFields + ';';
      LSortingFields := LSortingFields + LName + LVal;
    end;
  end;
  SetSorting(LSortingFields);
end;

procedure TEMSDataSetAdaptor.SetSorting(const ASortingFields: string);
begin
  if ASortingFields <> '' then
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorNoSorting);
end;

procedure TEMSDataSetAdaptor.ExceptionToHTTPError(AException: Exception);
begin
  // nothing
end;

function TEMSDataSetAdaptor.RequireMetadataSetup(AAction: TEMSBaseResource.TAction): Boolean;
begin
  // nothing
  Result := True;
end;

procedure TEMSDataSetAdaptor.SetParamValues;
var
  LJSON: TJSONIterator;
  i: Integer;
  LParam: TParam;
  LValue: string;
  LSrcBytes: TBytes;
begin
  if FParams.Count = 0 then
    Exit;
  LJSON := nil;
  try
    for i := 0 to FParams.Count - 1 do
    begin
      LParam := FParams[i];
      if LParam.ParamType in [ptUnknown, ptInput, ptInputOutput] then
      begin
                                                                       
        FContext.Request.Params.TryGetValue(LParam.Name, LValue);
        FResource.DoGetParam(LParam.Name, LValue);
        if LValue.IsEmpty then
          LParam.Clear
        else
                                                                   
          LParam.Value := LValue;
      end;
    end;

    if FReqMimeType <> '' then
    begin
      if SameText(FReqMimeType, 'application/json') then
      begin
        LJSON := TJSONIterator.Create(FContext.Request.Body.JSONReader);
        if not (LJSON.Next() and (LJSON.ParentType = TJsonToken.StartObject)) then
          EEMSHTTPError.RaiseUnsupportedMedia();
      end;

      for i := 0 to FParams.Count - 1 do
      begin
        LParam := FParams[i];
        if LParam.ParamType in [ptUnknown, ptInput, ptInputOutput] then
          if LJSON <> nil then
          begin
            if LJSON.Find(LParam.Name) then
              case LJSON.&Type of
              TJsonToken.Bytes:     LParam.AsBytes := LJSON.AsBytes;
              TJsonToken.&string:   LParam.AsString := LJSON.AsString;
              TJsonToken.Integer:   LParam.AsLargeInt := LJSON.AsInt64;
              TJsonToken.Float:     LParam.AsFloat := LJSON.AsExtended;
              TJsonToken.Boolean:   LParam.AsBoolean := LJSON.AsBoolean;
              TJsonToken.Date:      LParam.AsDateTime := LJSON.AsDateTime;
              TJsonToken.Null,
              TJsonToken.Undefined: LParam.Clear;
              else                  EEMSHTTPError.RaiseUnsupportedMedia();
              end;
          end
          else
          begin
            if not FContext.Request.Body.TryGetBytes(LSrcBytes) then
              LParam.Clear
            else if LParam.DataType in C_BinaryTypes then
              LParam.AsBytes := LSrcBytes
            else
                                                                       
              LParam.AsString := TEncoding.UTF8.GetString(LSrcBytes);
            Break;
          end;
      end;
    end;
  finally
    LJSON.Free;
  end;

  FProvider.PSSetParams(FParams);
end;

procedure TEMSDataSetAdaptor.GetParamValues;
var
  LJSON: TJsonTextWriter;
  LExt: string;
  LKind: TMimeTypes.TKind;
  LName: string;
  LParam: TParam;
  LSrcStream: TStream;
begin
  LJSON := nil;

  if SameText(FRespMimeType, 'application/json') then
  begin
    LJSON := FContext.Response.Body.JSONWriter;
    LJSON.WriteStartObject;
  end
  else if not TMimeTypes.Default.GetTypeInfo(FRespMimeType, LExt, LKind) then
    EEMSHTTPError.RaiseNotAcceptable();

  for LName in FResource.ValueFieldList do
  begin
    LParam := FParams.ParamByName(LName);
    if LJSON <> nil then
    begin
      LJSON.WritePropertyName(LParam.Name);
      if LParam.IsNull then
        LJSON.WriteNull
      else if LParam.DataType in C_BinaryTypes then
        LJSON.WriteValue(LParam.AsBytes)
      else if LParam.DataType in C_DateTimeTypes then
        LJSON.WriteValue(LParam.AsDateTime)
      else if LParam.DataType = ftFMTBcd then
        LJSON.WriteValue(LParam.AsFloat)
      else if LParam.DataType in C_ObjTypes then
                                                                        
        LJSON.WriteValue('<complex type>')
      else
        LJSON.WriteValue(TValue.FromVariant(LParam.Value));
    end
    else
    begin
      if not LParam.IsNull then
      begin
        if LParam.DataType in C_BinaryTypes then
          LSrcStream := TBytesStream.Create(LParam.AsBytes)
        else
                                                                 
          LSrcStream := TStringStream.Create(LParam.AsString);
        FContext.Response.Body.SetStream(LSrcStream, FRespMimeType, True);
      end;
      Break;
    end;
  end;

  if LJSON <> nil then
    LJSON.WriteEndObject;
end;

procedure TEMSDataSetAdaptor.SetFieldValues;
var
  LJSON: TJSONIterator;
  LExt: string;
  LKind: TMimeTypes.TKind;
  LName: string;
  LField: TField;
  LSrcBytes: TBytes;
begin
  LJSON := nil;
  try
    if FReqMimeType <> '' then
    begin
      if SameText(FReqMimeType, 'application/json') then
      begin
        LJSON := TJSONIterator.Create(FContext.Request.Body.JSONReader);
        if not (LJSON.Next() and (LJSON.ParentType = TJsonToken.StartObject)) then
          EEMSHTTPError.RaiseUnsupportedMedia();
      end
      else if not TMimeTypes.Default.GetTypeInfo(FReqMimeType, LExt, LKind) then
        EEMSHTTPError.RaiseUnsupportedMedia();

      for LName in FResource.ValueFieldList do
      begin
        LField := FDataSet.Fields.FieldByName(LName);
        if LJSON <> nil then
        begin
          if LJSON.Find(LField.FieldName) then
            case LJSON.&Type of
            TJsonToken.Bytes:     LField.AsBytes := LJSON.AsBytes;
            TJsonToken.&string:   LField.AsString := LJSON.AsString;
            TJsonToken.Integer:   LField.AsLargeInt := LJSON.AsInt64;
            TJsonToken.Float:     LField.AsExtended := LJSON.AsExtended;
            TJsonToken.Boolean:   LField.AsBoolean := LJSON.AsBoolean;
            TJsonToken.Date:      LField.AsDateTime := LJSON.AsDateTime;
            TJsonToken.Null,
            TJsonToken.Undefined: LField.Clear;
            else                  EEMSHTTPError.RaiseUnsupportedMedia();
            end;
        end
        else
        begin
          if not FContext.Request.Body.TryGetBytes(LSrcBytes) then
            LField.Clear
          else if LField.DataType in C_BinaryTypes then
            LField.AsBytes := LSrcBytes
          else
                                                                     
            LField.AsString := TEncoding.UTF8.GetString(LSrcBytes);
          Break;
        end;
      end;
    end;
  finally
    LJSON.Free;
  end;
end;

procedure TEMSDataSetAdaptor.GetFieldValues(const AFieldList: TStrings);
var
  LJSON: TJsonWriter;
  LExt: string;
  LKind: TMimeTypes.TKind;
  LName: string;
  LField: TField;
  LSrcStream: TStream;
begin
  LJSON := nil;

  if SameText(FRespMimeType, 'application/json') then
  begin
    LJSON := FContext.Response.Body.JSONWriter;
    LJSON.WriteStartObject;
  end
  else if not TMimeTypes.Default.GetTypeInfo(FRespMimeType, LExt, LKind) then
    EEMSHTTPError.RaiseNotAcceptable();

  for LName in AFieldList do
  begin
    LField := FDataSet.Fields.FieldByName(LName);
    if LJSON <> nil then
    begin
      LJSON.WritePropertyName(LField.FieldName);
      if LField.IsNull then
        LJSON.WriteNull
      else if LField.DataType in C_BinaryTypes then
        LJSON.WriteValue(LField.AsBytes)
      else if LField.DataType in C_DateTimeTypes then
        LJSON.WriteValue(LField.AsDateTime)
      else if LField.DataType = ftFMTBcd then
        LJSON.WriteValue(LField.AsExtended)
      else if LField.DataType in C_ObjTypes then
                                                                        
        LJSON.WriteValue('<complex type>')
      else
        LJSON.WriteValue(TValue.FromVariant(LField.Value));
    end
    else
    begin
      if not LField.IsNull then
      begin
        if LField.DataType in C_BinaryTypes then
          LSrcStream := TBytesStream.Create(LField.AsBytes)
        else
                                                                 
          LSrcStream := TStringStream.Create(LField.AsString);
        FContext.Response.Body.SetStream(LSrcStream, FRespMimeType, True);
      end;
      Break;
    end;
  end;

  if LJSON <> nil then
    LJSON.WriteEndObject;
end;

function TEMSDataSetAdaptor.LocateEntity: Boolean;
var
  LKeyValues: Variant;
  n, i: Integer;
  LName: string;
  LValue: string;
begin
  if FDataSet.IsEmpty then
    Exit(False);
  if FResource.KeyFields = '' then
    Exit(False);

  n := FResource.KeyFieldList.Count;
  if n = 1 then
    LKeyValues := Null
  else
    LKeyValues := VarArrayCreate([0, n - 1], varVariant);

  i := 0;
  for LName in FResource.KeyFieldList do
  begin
                                                                                        
    if not FContext.Request.Params.TryGetValue(LName, LValue) then
      if i < FContext.Request.Params.Count then
        LValue := FContext.Request.Params.Pairs[i].Value;
    FResource.DoGetParam(LName, LValue);
    if LValue.IsEmpty then
      if n = 1 then
        LKeyValues := Null
      else
        LKeyValues[i] := Null
    else
      if n = 1 then
        LKeyValues := LValue
      else
        LKeyValues[i] := LValue;
    Inc(i);
  end;
  Result := FDataSet.Locate(FResource.KeyFields, LKeyValues, []);
end;

procedure TEMSDataSetAdaptor.DeleteEntity;
var
  LName: string;
  LField: TField;
begin
  if FResource.MappingMode = rmEntityToRecord then
    FDataSet.Delete
  else if FResource.MappingMode = rmEntityToFields then
  begin
    FDataSet.Edit;
    try
      for LName in FResource.ValueFieldList do
      begin
        LField := FDataSet.Fields.FieldByName(LName);
        LField.Clear;
      end;
      FDataSet.Post;
    except
      FDataSet.Cancel;
      raise;
    end;
  end;
end;

function TEMSDataSetAdaptor.IsEntityNotNull: Boolean;
var
  LName: string;
  LField: TField;
begin
  Result := False;
  if FResource.MappingMode = rmEntityToRecord then
    Result := True
  else if FResource.MappingMode = rmEntityToFields then
    for LName in FResource.ValueFieldList do
    begin
      LField := FDataSet.Fields.FieldByName(LName);
      if not LField.IsNull then
        Exit(True);
    end;
end;

procedure TEMSDataSetAdaptor.ProcessList;
var
  LDataSetReader: TFDBatchMoveDataSetReader;
  LJSONWriter: TFDBatchMoveJSONWriter;
  LCSVWriter: TFDBatchMoveTextWriter;
  LStr: TStream;
  LVal: string;

  procedure SetupJSONWriter;
  begin
    LJSONWriter.DataDef.EndOfLine := elWindows;
    if (FRespCharset = '') and (LJSONWriter.JsonFormat in [jfJSON, jfJSONP]) then
      FRespCharset := 'utf-8';
    if FRespCharset <> '' then
      LJSONWriter.Encoder := TEncoding.GetEncoding(FRespCharset);

                                          

    LJSONWriter.Stream := LStr;
  end;

  procedure SetupCSVWriter;
  begin
    LCSVWriter.DataDef.RecordFormat := rfCommaDoubleQuote;
    LCSVWriter.DataDef.EndOfLine := elWindows;
    LCSVWriter.DataDef.WithFieldNames := True;
    if FRespCharset = '' then
      FRespCharset := 'utf-8';
    if SameText(FRespCharset, 'utf-8') then
      LCSVWriter.Encoding := ecUTF8
    else if SameText(FRespCharset, 'ucs-2') or SameText(FRespCharset, 'utf-16') then
      LCSVWriter.Encoding := ecUTF16
    else
      LCSVWriter.Encoding := ecANSI;

                                         

    LCSVWriter.Stream := LStr;
  end;

  procedure SetupMappings;
  begin
    if not FResource.FDefaultValueFields then
      FBatchMove.Mappings.Assign(FResource.ValueFieldList);
  end;

begin
  // Setup reader
  LDataSetReader := CheckReaderClass<TFDBatchMoveDataSetReader>;
  LDataSetReader.DataSet := FDataSet;

  // Setup writer
  LJSONWriter := nil;
  LCSVWriter := nil;
  LStr := TMemoryStream.Create;
  try
    if (FRespMimeType = '') or
       SameText(FRespMimeType, 'application/json') or
       SameText(FRespMimeType, 'text/plain') then begin
      LJSONWriter := CheckWriterClass<TFDBatchMoveJSONWriter>;
      LJSONWriter.JsonFormat := jfJSON;
      if FRespMimeType = '' then
        FRespMimeType := 'application/json';
      SetupJSONWriter;
    end
    else if SameText(FRespMimeType, 'application/javascript') then begin
      LJSONWriter := CheckWriterClass<TFDBatchMoveJSONWriter>;
      LJSONWriter.JsonFormat := jfJSONP;
      if FContext.Request.Params.TryGetValue('callback', LVal) then
        LJSONWriter.DataDef.CallbackName := LVal;
      SetupJSONWriter;
    end
    else if SameText(FRespMimeType, 'application/bson') then begin
      LJSONWriter := CheckWriterClass<TFDBatchMoveJSONWriter>;
      LJSONWriter.JsonFormat := jfBSON;
      SetupJSONWriter;
    end
    else if SameText(FRespMimeType, 'text/csv') then begin
      LCSVWriter := CheckWriterClass<TFDBatchMoveTextWriter>;
      SetupCSVWriter;
    end
    else
      EEMSHTTPError.RaiseNotAcceptable();
    SetupMappings;

    FBatchMove.Execute;
    FResource.SetResponse(FContext.Response, LStr);
  finally
    if LJSONWriter <> nil then
      LJSONWriter.Stream := nil;
    if LCSVWriter <> nil then
      LCSVWriter.Stream := nil;
    LStr.Free;
    if (LJSONWriter <> nil) and (LJSONWriter.Encoder <> nil) then
    begin
      LJSONWriter.Encoder.DisposeOf;
      LJSONWriter.Encoder := nil;
    end;
  end;
end;

procedure TEMSDataSetAdaptor.ProcessGet;
begin
  if FResource.MappingMode in [rmEntityToFields, rmEntityToRecord] then
  begin
    FDataSet.Open;
    if not LocateEntity then
      EEMSHTTPError.RaiseNotFound();
    GetFieldValues(FResource.ValueFieldList);
  end
  else
  begin
    FProvider.PSExecute;
    GetParamValues;
  end;
end;

procedure TEMSDataSetAdaptor.ProcessPutOtPost(AAction: TEMSBaseResource.TAction);
var
  LExists: Boolean;
begin
  if FResource.MappingMode in [rmEntityToFields, rmEntityToRecord] then
  begin
    FDataSet.Open;
    LExists := LocateEntity();
    case AAction of
    TEMSBaseResource.TAction.Post:
      if LExists and IsEntityNotNull() then
        EEMSHTTPError.RaiseDuplicate();
    TEMSBaseResource.TAction.Put:
      if not LExists and not (roAppendOnPut in FResource.Options) then
        EEMSHTTPError.RaiseNotFound();
    end;
    if LExists then
      FDataSet.Edit
    else
      FDataSet.Append;
    try
      SetFieldValues();
      FDataSet.Post;
    except
      FDataSet.Cancel;
      raise;
    end;
    if not LExists and
       ([roReturnNewEntityKey, roReturnNewEntityValue] * FResource.Options <> []) then
      if roReturnNewEntityKey in FResource.Options then
        GetFieldValues(FResource.KeyFieldList)
      else if roReturnNewEntityValue in FResource.Options then
        GetFieldValues(FResource.ValueFieldList)
  end
  else
  begin
    FProvider.PSExecute;
    if AAction = TEMSBaseResource.TAction.Post then
      GetParamValues();
  end;
end;

procedure TEMSDataSetAdaptor.ProcessPost;
begin
  ProcessPutOtPost(TEMSBaseResource.TAction.Post);
end;

procedure TEMSDataSetAdaptor.ProcessPut;
begin
  ProcessPutOtPost(TEMSBaseResource.TAction.Put);
end;

procedure TEMSDataSetAdaptor.ProcessDelete;
begin
  if FResource.MappingMode in [rmEntityToFields, rmEntityToRecord] then
  begin
    FDataSet.Open;
    if not LocateEntity() then
      EEMSHTTPError.RaiseNotFound();
    DeleteEntity;
  end
  else
    FProvider.PSExecute;
end;

{ TEMSFDDataSetAdaptor }

class constructor TEMSFDDataSetAdaptor.Create;
begin
  inherited;
  RegisterParent(TFDDataSet, TEMSFDDataSetAdaptor);
  // Keep names in sync with System.Net.TMime and ProcessList
  Register('application/vnd.embarcadero.firedac+json', TFDDataSet, TEMSFDDataSetAdaptor);
  Register('application/vnd.embarcadero.firedac+xml', TFDDataSet, TEMSFDDataSetAdaptor);
  Register('application/vnd.embarcadero.firedac+bin', TFDDataSet, TEMSFDDataSetAdaptor);
end;

function TEMSFDDataSetAdaptor.GetFDDataSet: TFDDataSet;
begin
  if (FDataSet <> nil) and (FDataSet is TFDDataSet) then
    Result := TFDDataSet(FDataSet)
  else
    Result := nil;
end;

function TEMSFDDataSetAdaptor.GetFDSchema: TFDCustomSchemaAdapter;
begin
  if (FDataSet <> nil) and (FDataSet is TFDAdaptedDataSet) and
     (TFDAdaptedDataSet(FDataSet).Adapter <> nil) and
     (TFDAdaptedDataSet(FDataSet).Adapter.SchemaAdapter <> nil) then
    Result := TFDAdaptedDataSet(FDataSet).Adapter.SchemaAdapter
  else
    Result := nil;
end;

function TEMSFDDataSetAdaptor.DelegateOpening(AAction: TEMSBaseResource.TAction): Boolean;
begin
  Result := inherited DelegateOpening(AAction) and not (
    (AAction = TEMSBaseResource.TAction.Post) and
    (GetFormat(FReqMimeType, FReqCharset) <> sfAuto)
  );
end;

procedure TEMSFDDataSetAdaptor.SetPaging(ARecsSkip, ARecsMax: Integer);
var
  LDataSet: TFDDataSet;
  LDBDataSet: TFDRdbmsDataSet;
  LSkipMacro, LMaxMacro: TFDMacro;
  LFtch: TFDFetchOptions;
begin
  LSkipMacro := nil;
  LMaxMacro := nil;
  LDataSet := GetFDDataSet;
  if LDataSet is TFDRdbmsDataSet then
  begin
    LDBDataSet := TFDRdbmsDataSet(LDataSet);
    LSkipMacro := LDBDataSet.FindMacro(CPageSkipMacro);
    if LSkipMacro <> nil then
      LSkipMacro.AsInteger := ARecsSkip;
    LMaxMacro := LDBDataSet.FindMacro(CPageMaxMacro);
    if LMaxMacro <> nil then
      LMaxMacro.AsInteger := ARecsMax;
  end;
  if (LSkipMacro = nil) and (LMaxMacro = nil) then
  begin
    LFtch := LDataSet.OptionsIntf.FetchOptions;
    if (LFtch.RecsSkip <> ARecsSkip) or (LFtch.RecsMax <> ARecsMax) then begin
      LFtch.RecsSkip := ARecsSkip;
      LFtch.RecsMax := ARecsMax;
      LDataSet.Disconnect();
    end;
  end;
end;

procedure TEMSFDDataSetAdaptor.SetSorting(const ASortingFields: string);
var
  LDataSet: TFDDataSet;
  LDBDataSet: TFDRdbmsDataSet;
  LSortMacro: TFDMacro;
  LOrderBy: string;
  i, j: Integer;
  LField, LMod: string;
begin
  LSortMacro := nil;
  LDataSet := GetFDDataSet;
  if LDataSet is TFDRdbmsDataSet then
  begin
    LDBDataSet := TFDRdbmsDataSet(LDataSet);
    LSortMacro := LDBDataSet.FindMacro(CSortMacro);
    if LSortMacro <> nil then
    begin
      LOrderBy := '';
      i := 1;
      while i <= Length(ASortingFields) do
      begin
        LMod := '';
        LField := ExtractFieldName(ASortingFields, i);
        j := Pos(':', LField);
        if j > 0 then
        begin
          LMod := Copy(LField, j +1, MaxInt);
          if (LMod = 'D') or (LMod = 'd') then
            LMod := ' DESC'
          else
            LMod := ' ASC';
          LField := Copy(LField, 1, j - 1);
        end;
        if LOrderBy <> '' then
          LOrderBy := LOrderBy + ', ';
        LOrderBy := LOrderBy + LField + LMod;
      end;
      LSortMacro.AsRaw := LOrderBy;
    end;
  end;
  if LSortMacro = nil then
    LDataSet.IndexFieldNames := ASortingFields;
end;

procedure TEMSFDDataSetAdaptor.ExceptionToHTTPError(AException: Exception);
begin
  if AException is EFDDBEngineException then
    case EFDDBEngineException(AException).Kind of
    ekNoDataFound:
      EEMSHTTPError.RaiseNotFound('', AException.Message);
    ekTooManyRows,
    ekRecordLocked,
    ekUKViolated,
    ekFKViolated:
      EEMSHTTPError.RaiseDuplicate('', AException.Message);
    end;
  inherited ExceptionToHTTPError(AException);
end;

function TEMSFDDataSetAdaptor.RequireMetadataSetup(AAction: TEMSBaseResource.TAction): Boolean;
var
  LFormat: TFDStorageFormat;
begin
  if AAction = TEMSBaseResource.TAction.List then
    LFormat := GetFormat(FRespMimeType, FRespCharset)
  else if AAction = TEMSBaseResource.TAction.Post then
    LFormat := GetFormat(FReqMimeType, FReqCharset)
  else
    LFormat := sfAuto;
  if LFormat = sfAuto then
    Result := inherited RequireMetadataSetup(AAction)
  else
    Result := False;
end;

function TEMSFDDataSetAdaptor.GetFormat(const AMimeType: string; out ACharset: string): TFDStorageFormat;
begin
  Result := sfAuto;
  if SameText(AMimeType, 'application/vnd.embarcadero.firedac+json') then begin
    Result := sfJSON;
    ACharset := 'utf-8';
  end
  else if SameText(AMimeType, 'application/vnd.embarcadero.firedac+xml') then begin
    Result := sfXML;
    ACharset := 'utf-8';
  end
  else if SameText(AMimeType, 'application/vnd.embarcadero.firedac+bin') then
    Result := sfBinary;
end;

procedure TEMSFDDataSetAdaptor.ProcessList;
var
  LFormat: TFDStorageFormat;
  LSchema: TFDCustomSchemaAdapter;
  LDataSet: TFDDataSet;
  LStr: TStream;
begin
  LFormat := GetFormat(FRespMimeType, FRespCharset);
  LDataSet := GetFDDataSet;
  if (LDataSet <> nil) and (LFormat <> sfAuto) then begin
    LSchema := GetFDSchema;
    LStr := TMemoryStream.Create;
    try
      if LSchema <> nil then
      begin
        LSchema.Open;
        LSchema.SaveToStream(LStr, LFormat);
      end
      else
      begin
        LDataSet.Open;
        LDataSet.SaveToStream(LStr, LFormat);
      end;
      FResource.SetResponse(FContext.Response, LStr);
    finally
      LStr.Free;
    end;
  end
  else
    inherited ProcessList;
end;

procedure TEMSFDDataSetAdaptor.ProcessPost;
var
  LFormat: TFDStorageFormat;
  LSchema: TFDCustomSchemaAdapter;
  LPrevItems: TFDStoreItems;
  LDataSet: TFDDataSet;
  LRes: TFDResourceOptions;
  LStr: TStream;
begin
  LFormat := GetFormat(FReqMimeType, FReqCharset);
  LDataSet := GetFDDataSet;
  FContext.Request.Body.TryGetStream(LStr);
  if (LDataSet <> nil) and (LFormat <> sfAuto) and (LStr <> nil) then begin
    LSchema := GetFDSchema;
    if LSchema <> nil then
      LRes := LSchema.ResourceOptions
    else
      LRes := LDataSet.OptionsIntf.ResourceOptions;
    LPrevItems := LRes.StoreItems;
    LRes.StoreItems := [siDelta, siMeta];
    try
      if LSchema <> nil then begin
        LSchema.LoadFromStream(LStr, LFormat);
        if LSchema.ApplyUpdates = 0 then
          LSchema.CommitUpdates
        else
          ;                                                       
      end
      else begin
        LDataSet.LoadFromStream(LStr, LFormat);
        if LDataSet.ApplyUpdates = 0 then
          LDataSet.CommitUpdates
        else
          ;                                                       
      end;
    finally
      LRes.StoreItems := LPrevItems;
    end;
  end
  else
    inherited ProcessPost;
end;

{ TEMSDataSetResource }

constructor TEMSDataSetResource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := [roEnableParams, roEnablePaging, roEnableSorting,
    roReturnNewEntityKey, roAppendOnPut];
  FMappingMode := rmGuess;
  FPageParamName := CDefaultPageParamName;
  FPageSize := CDefaultPageSize;
  FSortingParamPrefix := CDefaultSortingParamPrefix;
  FKeyFieldList := TStringList.Create(dupError, False, False);
  FKeyFieldList.QuoteChar := #0;
  FKeyFieldList.Delimiter := ';';
  FValueFieldList := TStringList.Create(dupError, False, False);
  FValueFieldList.QuoteChar := #0;
  FValueFieldList.Delimiter := ';';
  FDefaultValueFields := True;
end;

destructor TEMSDataSetResource.Destroy;
begin
  DataSet := nil;
  FreeAndNil(FKeyFieldList);
  FreeAndNil(FValueFieldList);
  inherited Destroy;
end;

procedure TEMSDataSetResource.SetValueFields(const AValue: string);
begin
  if FValueFields <> AValue then
  begin
    FValueFieldList.DelimitedText := AValue;
    FValueFields := AValue;
    FDefaultValueFields := AValue = '';
  end;
end;

procedure TEMSDataSetResource.SetKeyFields(const AValue: string);
begin
  if FKeyFields <> AValue then
  begin
    FKeyFieldList.DelimitedText := AValue;
    FKeyFields := AValue;
  end;
end;

function TEMSDataSetResource.IsPPNS: Boolean;
begin
  Result := AnsiCompareStr(PageParamName, CDefaultPageParamName) <> 0;
end;

function TEMSDataSetResource.IsSPPS: Boolean;
begin
  Result := AnsiCompareStr(SortingParamPrefix, CDefaultSortingParamPrefix) <> 0;
end;

procedure TEMSDataSetResource.SetDataSet(AValue: TDataSet);
begin
  if DataSet <> AValue then begin
    if DataSet <> nil then
      DataSet.RemoveFreeNotification(Self);
    FDataSet := AValue;
    if DataSet <> nil then
      DataSet.FreeNotification(Self);
  end;
end;

procedure TEMSDataSetResource.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = DataSet then
      DataSet := nil;
end;

function TEMSDataSetResource.GetRequestHeader(ARequest: TEndpointRequest;
  const AName: string): string;
begin
  if not ARequest.Headers.TryGetValue(AName, Result) then
    Result := '';
end;

procedure TEMSDataSetResource.SetResponse(AResponse: TEndpointResponse; var AStream: TStream);
var
  LContentType: string;
  LStream: TStream;
begin
                                 
  LContentType := FAdaptor.FRespMimeType;
  if LContentType = '' then
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetAdaptorNoContentType);
  if FAdaptor.FRespCharset <> '' then
    LContentType := LContentType + ';charset=' + FAdaptor.FRespCharset;
  LStream := AStream;
  AStream := nil;
  AResponse.Body.SetStream(LStream, LContentType, True);
end;

procedure TEMSDataSetResource.CheckAction(const AContext: TEndpointContext; AAction: TEMSBaseResource.TAction);
begin
  inherited CheckAction(AContext, AAction);
  if DataSet = nil then
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sDataSetNotAssigned);
end;

procedure TEMSDataSetResource.GetResponseMime(const AContext: TEndpointContext; var AMimeType, ACharset: string);
var
  LValues: TAcceptValueList;
  LWeight: Double;
begin
  LValues := TAcceptValueList.Create;
  try
    AMimeType := AContext.Negotiation.ProduceList.Negotiate('application/json, */*;q=0.5', LWeight,
      function (const AName: string; AWeight: Double; AItem: TAcceptValueItem): Boolean
      begin
        Result := TEMSDataSetAdaptor.Lookup(AName, TDataSetClass(DataSet.ClassType), False, True) <> nil;
      end);
    LValues.Parse(GetRequestHeader(AContext.Request, 'Accept-Charset'));
    ACharset := LValues.Negotiate('utf-8, *;q=0.5', LWeight,
      function (const AName: string; AWeight: Double; AItem: TAcceptValueItem): Boolean
      begin
        try
          TEncoding.GetEncoding(AName).DisposeOf;
          Result := True;
        except
          Result := False;
        end;
      end);
  finally
    LValues.Free;
  end;
end;

procedure TEMSDataSetResource.GetRequestMime(const AContext: TEndpointContext; var AMimeType, ACharset: string);
var
  LType: TAcceptValueItem;
  LJSON: TJSONIterator;
begin
  if AContext.Negotiation.ConsumeList.Count > 0 then
  begin
    LType := AContext.Negotiation.ConsumeList.Items[0];
    AMimeType := LType.Name;
    ACharset := LType.Params.Values['charset'];
  end
  else
  begin
    AMimeType := '';
    ACharset := '';
  end;

  // Force FireDAC mime type for POST requests from old clients
  if SameText(AMimeType, 'application/json') and
     (AContext.Request.Method = TEndpointRequest.TMethod.Post) then
  begin
    LJSON := TJSONIterator.Create(AContext.Request.Body.JSONReader);
    try
      if LJSON.Next() and (LJSON.ParentType = TJsonToken.StartObject) and (LJSON.Key = 'FDBS') then
        AMimeType := 'application/vnd.embarcadero.firedac+json';
      AContext.Request.Body.JSONReader.Rewind;
    finally
      LJSON.Free;
    end;
  end;
end;

procedure TEMSDataSetResource.PrepareAdapter(AContext: TEndpointContext;
  ARequest: TEndpointRequest; AResponse: TEndpointResponse; AAction: TEMSBaseResource.TAction);
var
  LRequireMetadataSetup: Boolean;
  LStr: TStringBuilder;
  i: Integer;
begin
  FAdaptor.FResource := Self;
  FAdaptor.FContext := AContext;
  FAdaptor.FDataSet := DataSet;
  FAdaptor.FProvider := IProviderSupportNG(FAdaptor.FDataSet);
  FAdaptor.FParams := FAdaptor.FProvider.PSGetParams;

  // SetParamValues must be before PSGetCommandType, because PSGetCommandType
  // may prepare command. And if parameter data types are not explicitly set,
  // then "unknown data type" may be raised.
  if roEnableParams in Options then
    FAdaptor.SetParamValues;

  if AAction = TAction.List then
  begin
    if roEnablePaging in Options then
      FAdaptor.SetPaging;
    if roEnableSorting in Options then
      FAdaptor.SetSorting;
                        
  end;
          
                                                               
                    
   
                                                                     
                                                                   

  LRequireMetadataSetup := FAdaptor.RequireMetadataSetup(AAction);
  if LRequireMetadataSetup then
  begin
    if MappingMode = rmGuess then
      if FAdaptor.FProvider.PSGetCommandType in [ctQuery, ctTable, ctSelect] then
        MappingMode := rmEntityToRecord
      else
        MappingMode := rmEntityToParams;
    if (MappingMode = rmEntityToParams) and (FAdaptor.FParams <> nil) and (FAdaptor.FParams.Count > 0) then
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sCannotGuessMappingMode);
  end;

  if FAdaptor.DelegateOpening(AAction) then
    DataSet.Open;

  if LRequireMetadataSetup then
  begin
    if AAction <> TAction.List then
    begin
      if KeyFields = '' then
        KeyFields := FAdaptor.FProvider.PSGetKeyFields;
      if (KeyFields = '') and (MappingMode in [rmEntityToFields, rmEntityToRecord]) then
        EEMSHTTPError.RaiseError(500, sResourceErrorMessage, sKeyFieldsNotDefined);
    end;

    if ValueFields = '' then
    begin
      LStr := TStringBuilder.Create;
      try
        if MappingMode in [rmEntityToFields, rmEntityToRecord] then
          for i := 0 to DataSet.Fields.Count - 1 do
          begin
            if LStr.Length > 0 then
              LStr.Append(';');
            LStr.Append(DataSet.Fields[i].FieldName);
          end
        else
          for i := 0 to FAdaptor.FParams.Count - 1 do
            // Here are only output parameters, because input parameters will be
            // always set from request params. But only params in ValueFields will
            // be returned in GET / POST response.
            if FAdaptor.FParams[i].ParamType in [ptResult, ptOutput, ptInputOutput] then
            begin
              if LStr.Length > 0 then
                LStr.Append(';');
              LStr.Append(FAdaptor.FParams[i].Name);
            end;
        ValueFields := LStr.ToString(True);
        FDefaultValueFields := True;
      finally
        LStr.Free;
      end;
    end;
  end;
end;

procedure TEMSDataSetResource.List(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LReqMime, LReqCharset: string;
  LRespMime, LRespCharset: string;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.List);
  GetRequestMime(AContext, LReqMime, LReqCharset);
  GetResponseMime(AContext, LRespMime, LRespCharset);
  FAdaptor := TEMSDataSetAdaptor.Lookup(LRespMime, TDataSetClass(DataSet.ClassType), True, False).Create;
  try
    FAdaptor.FReqMimeType := LReqMime;
    FAdaptor.FReqCharset := LReqCharset;
    FAdaptor.FRespMimeType := LRespMime;
    FAdaptor.FRespCharset := LRespCharset;
    PrepareAdapter(AContext, ARequest, AResponse, TEMSBaseResource.TAction.List);
    FAdaptor.ProcessList;
  finally
    FreeAndNil(FAdaptor);
  end;
end;

procedure TEMSDataSetResource.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LReqMime, LReqCharset: string;
  LRespMime, LRespCharset: string;
begin
                                                                                
                                                   
                                                                            

  CheckAction(AContext, TEMSBaseResource.TAction.Get);
  GetRequestMime(AContext, LReqMime, LReqCharset);
  GetResponseMime(AContext, LRespMime, LRespCharset);
  FAdaptor := TEMSDataSetAdaptor.Lookup(LRespMime, TDataSetClass(DataSet.ClassType), True, True).Create;
  try
    FAdaptor.FReqMimeType := LReqMime;
    FAdaptor.FReqCharset := LReqCharset;
    FAdaptor.FRespMimeType := LRespMime;
    FAdaptor.FRespCharset := LRespCharset;
    PrepareAdapter(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Get);
    FAdaptor.ProcessGet;
  finally
    FreeAndNil(FAdaptor);
  end;
end;

// PUT: create or update an entity
procedure TEMSDataSetResource.Put(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LReqMime, LReqCharset: string;
  LRespMime, LRespCharset: string;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.Put);
  GetRequestMime(AContext, LReqMime, LReqCharset);
  GetResponseMime(AContext, LRespMime, LRespCharset);
  FAdaptor := TEMSDataSetAdaptor.Lookup(LReqMime, TDataSetClass(DataSet.ClassType), True, True).Create;
  try
    FAdaptor.FReqMimeType := LReqMime;
    FAdaptor.FReqCharset := LReqCharset;
    FAdaptor.FRespMimeType := LRespMime;
    FAdaptor.FRespCharset := LRespCharset;
    try
      PrepareAdapter(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Put);
      FAdaptor.ProcessPut;
    except
      on E: Exception do
      begin
        FAdaptor.ExceptionToHTTPError(E);
        raise;
      end;
    end;
  finally
    FreeAndNil(FAdaptor);
  end;
end;

// POST: create a new entity
procedure TEMSDataSetResource.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LReqMime, LReqCharset: string;
  LRespMime, LRespCharset: string;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.Post);
  GetRequestMime(AContext, LReqMime, LReqCharset);
  GetResponseMime(AContext, LRespMime, LRespCharset);
  FAdaptor := TEMSDataSetAdaptor.Lookup(LReqMime, TDataSetClass(DataSet.ClassType), True, True).Create;
  try
    FAdaptor.FReqMimeType := LReqMime;
    FAdaptor.FReqCharset := LReqCharset;
    FAdaptor.FRespMimeType := LRespMime;
    FAdaptor.FRespCharset := LRespCharset;
    try
      PrepareAdapter(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Post);
      FAdaptor.ProcessPost;
    except
      on E: Exception do
      begin
        FAdaptor.ExceptionToHTTPError(E);
        raise;
      end;
    end;
  finally
    FreeAndNil(FAdaptor);
  end;
end;

procedure TEMSDataSetResource.Delete(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LReqMime, LReqCharset: string;
  LRespMime, LRespCharset: string;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.Delete);
  GetRequestMime(AContext, LReqMime, LReqCharset);
  GetResponseMime(AContext, LRespMime, LRespCharset);
  FAdaptor := TEMSDataSetAdaptor.Lookup(LReqMime, TDataSetClass(DataSet.ClassType), True, True).Create;
  try
    FAdaptor.FReqMimeType := LReqMime;
    FAdaptor.FReqCharset := LReqCharset;
    FAdaptor.FRespMimeType := LRespMime;
    FAdaptor.FRespCharset := LRespCharset;
    try
      PrepareAdapter(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Delete);
      FAdaptor.ProcessDelete;
    except
      on E: Exception do
      begin
        FAdaptor.ExceptionToHTTPError(E);
        raise;
      end;
    end;
  finally
    FreeAndNil(FAdaptor);
  end;
end;

end.
