{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSReflect;

interface

uses
  System.Classes,
  Data.DBXCommon,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  Data.DBXPlatform,
  System.TypInfo,
  System.ObjAuto,
  System.Generics.Collections;

type
  TDSMethod = class;
  TDSClass = class;

  TArrayOfVariant = array of Variant;
  TArrayOfObject = array of TObject;

  TDSMethodArray = array of TDSMethod;
  TDSClassArray = array of TDSClass;
{$MethodInfo on}
  TDSAdapterClassType = type of TDSAdapterClass;
  TDSAdapterClass = class(TPersistent)
  private
    FAdapteeInstance: TObject;
  public
    constructor Create(AdapteeInstance: TObject); virtual;
  end;
{$MethodInfo off}

  TDSClass = class
  private
    FClassRef: TPersistentClass;
    FAdapteeClass: TDSClass;
    FClassName: string;
    FIsArrayParameter: Boolean;
    FIsVarParameter: Boolean;
    FIsOutParameter: Boolean;
    FTypeData: PTypeData;
    FValueParameter: Boolean;
    FIsAdapted: Boolean;
//    function GetIAppServerClass: TClass;
    function GetMethods: TDSMethodArray;
    function GetDBXDataType(AllowUnknown: Boolean; Parameter: TDBXParameter): Integer;
    function GetDBXSubDataType: Integer;
    function GetDSClassName: String;
    function IsVoidReturn: Boolean;
    function IsArrayParameter: Boolean;
    function IsInOutParameter: Boolean;
    function IsOutParameter: Boolean;
    function GetClassLoadError: String;
    function GetTypeUnit: String;
  public
    constructor Create(AClassRef: TPersistentClass; AIsAdapted: Boolean); overload;
    constructor Create(AClassRef: TPersistentClass; AAdapteeClass: TDSClass); overload;
    constructor Create(ClassName: string; TypeData: PTypeData;  AIsArrayParameter, AIsVarParameter, AIsOutParameter: Boolean); overload;
    destructor Destroy; override;
    function CreateInstance: TObject;
    procedure GetDbxType(Parameter: TDBXParameter);
    function CreateMethod(MethodName: String): TDSMethod;
    property Methods: TDSMethodArray read GetMethods;
    property DSClassName: String read GetDSClassName;
    property VoidReturn: Boolean read IsVoidReturn;
    property ArrayParameter: Boolean read IsArrayParameter;
    property OutParameter: Boolean read IsOutParameter;
    property InOutParameter: Boolean read IsInOutParameter;
    property ClassLoadError: String read GetClassLoadError;
    property ValueParameter: Boolean read FValueParameter;
    property AdapteeDSClass: TDSClass read FAdapteeClass;
    property TypeUnit: String read GetTypeUnit;
    property ClassRef: TPersistentClass read FClassRef;
  end;

  TDSPackage = class
  private
    FPackagename: String;
    FClassList: TStringList;
    procedure GetClassesProc(AClass: TPersistentClass);
  public
    constructor Create;
    destructor Destroy; override;
    function GetDSPackages(): TDBXStringArray;
    function GetDSClasses(classNamePattern: String): TDBXStringArray;
    function CreateDSClass(ClassName: String): TDSClass;
    property PackageName: String read FPackagename write FPackagename;
    property DSPackages: TDBXStringArray read GetDSPackages;
  end;

  TDSMethodValues = class
  private
    FAllocatedObjects: TArrayOfObject;
    FAllocatedReturn: TObject;
    FMethodValues: TArrayOfVariant;
    FReturnValue: Variant;
    FServerSideCommand: Boolean;
    FJSONMarshal: TJSONMarshal;
    FJSONUnMarshal: TJSONUnMarshal;
    FUserObjects: TObjectList<TObject>;

    procedure SetDBXJSONValueParameter(DBXParameter: TDBXParameter; Value: Variant);
    procedure SetDBXParameter(DBXParameter: TDBXParameter; Value: Variant);
    procedure SetDBXReaderParameter(DBXParameter: TDBXParameter; Value: Variant);
    procedure SetDBXStreamParameter(DBXParameter: TDBXParameter; Value: Variant);
    procedure PopulateMarshal(Parameter: TDBXParameter);
    function  JSONToUserObject(Json: TJSONValue): TObject;
    function  UserObjectToJSON(Data: TObject): TJSONValue;
    procedure AssignJSONValue(Ordinal: Integer; Parameter: TDBXParameter);
    procedure AssignTableValue(Ordinal: Integer; Parameter: TDBXParameter);
    procedure AssignStreamValue(Ordinal: Integer; Parameter: TDBXParameter);
    procedure SetAllocatedObject(Ordinal: Integer; AllocatedObject: TObject);
    procedure SetServerSideCommand(AServerSide: Boolean);
    function GetVarObject<T: class>(Value: Variant): T;
  public
    constructor Create;
    destructor Destroy; override;
    function ClearReferenceParameters: boolean;
    procedure AssignParameterValues(Parameters: TDBXParameterArray);
    procedure GetReturnValue(ReturnValue: TDBXParameter);
    procedure GetOutValue(OutValue: TDBXParameter);
    function GetValues: TArrayOfVariant;
    property ReturnValue: Variant read FReturnValue write FReturnValue;
    property ServerSidecommand: Boolean read FServerSideCommand write SetServerSideCommand;
  end;

  TDSMethod = class
  private
    FMethodInfoHeader: PMethodInfoHeader;
    FParameterTypes: TDSClassArray;
    FParameterNames: TDBXStringArray;
    FMethodName: String;
    FMethodClass: TDSClass;
    FDSReturnType: TDSClass;
    FIsPublicMethod: Boolean;
    FIsStaticMethod: Boolean;
    FIsConstructor: Boolean;
    FIsDestructor: Boolean;
    function IsPublicMethod: Boolean;
    function IsStaticMethod: Boolean;
    function GetParameterTypes: TDSClassArray;
    function GetReturnType: TDSClass;
    function GetDSMethodName: String;
    function GetMethodClass: TDSClass;
    function GetParameterNames: TDBXStringArray;
  public
    class function InvokeStringFunction(objClass: TObjectClass; methodName: String): String;

  public
    constructor Create(AMethodInfo: PMethodInfoHeader; const AMethodClass: TDSClass);
    destructor Destroy; override;
    function GetClassInstance(AObject: TObject): TObject;
    procedure Invoke(MethodInstance: TObject; MethodValues: TDSMethodValues);
    property PublicMethod: Boolean read IsPublicMethod;
    property StaticMethod: Boolean read IsStaticMethod;
    property ParameterTypes: TDSClassArray read GetParameterTypes;
    property ParameterNames: TDBXStringArray read GetParameterNames;
    property ReturnType: TDSClass read GetReturnType;
    property DSMethodName: String read GetDSMethodName;
    property MethodClass: TDSClass read GetMethodClass;
    property IsConstructor: Boolean read FIsConstructor;
    property IsDestructor: Boolean read FIsDestructor;
  end;

  const STDataSet             = 'TDataSet';
  const STParams              = 'TParams';
  const STDBXReaderValue      = 'TDBXReaderValue';
//  const STDBXAutoFreeReader   = 'TDBXAutoFreeReader';
//  const STDBXAutoFreeStream   = 'TDBXAutoFreeStream';
  const SOleVariant           = 'OleVariant';

implementation

uses
  Data.DB,
  Data.DBXClientResStrs,
  Data.DBXDBReaders,
  Datasnap.DSCommonServer,
  Datasnap.DSServer,
  Data.FMTBcd,
  Data.SqlExpr,
  Data.SqlTimSt,
  System.SysUtils,
  System.Variants;

type
  PJSONValue = ^TJSONValue;

{ TDSMethodValues }

procedure TDSMethodValues.AssignParameterValues(
  Parameters: TDBXParameterArray);
var
  I: Integer;
  Value: TDBXWritableValue;
  Parameter: TDBXParameter;
  P: Pointer;
  IsReference: Boolean;
  CurrencyValue: Currency;
  VariantValue: OleVariant;
  StreamValue: TStream;
  JSONValue: TJSONValue;
  UserValue: TObject;
//  bytes: TBytes;

  function MakeRefVar(varType: TVarType; Reference: Pointer): Variant;
  begin
    VarClear(Result);
    TVarData(Result).vType := varType or varByRef;

    TVarData(Result).VPointer := Reference;
  end;

begin
  ClearReferenceParameters;
  if Length(FMethodValues) <> Length(Parameters) then
  begin
    SetLength(FMethodValues, Length(Parameters));
    SetLength(FAllocatedObjects, Length(Parameters));
  end;

  for I := 0 to Length(Parameters) - 1 do
  begin
    Parameter := Parameters[I];
    Value := Parameter.Value;
    IsReference := ((Parameter.ParameterDirection = TDBXParameterDirections.OutParameter) or
      (Parameter.ParameterDirection = TDBXParameterDirections.InOutParameter)) and not Parameter.ValueParameter;
    if Parameter.ValueParameter then
      FMethodValues[I] := IntPtr(Value)
    else if IsReference then
    begin
      case Parameter.DataType of
        TDBXDataTypes.BooleanType:
        begin
          GetMem(P, SizeOf(WordBool));
          PWordBool(P)^ := False;
          PBoolean(P)^ := Value.GetBoolean;
          FMethodValues[I] := MakeRefVar(varBoolean, P);
        end;
        TDBXDataTypes.UInt8Type:
        begin
          GetMem(P, SizeOf(Byte));
          PByte(P)^ := Value.GetUInt8;
          FMethodValues[I] := MakeRefVar(varByte, P);
        end;
        TDBXDataTypes.Int8Type:
        begin
          GetMem(p, SizeOf(ShortInt));
          PShortInt(P)^ := Value.GetInt8;
          FMethodValues[I] := MakeRefVar(varShortint, P);
        end;
        TDBXDataTypes.UInt16Type:
        begin
          GetMem(P, SizeOf(Word));
          PWord(P)^ := Value.GetUInt16;
          FMethodValues[I] := MakeRefVar(varWord, P);
        end;
        TDBXDataTypes.Int16Type:
        begin
          GetMem(P, SizeOf(SmallInt));
          PSmallInt(P)^ := Value.GetInt16;
          FMethodValues[I] := MakeRefVar(varSmallint, P);
        end;
        TDBXDataTypes.Int32Type:
        begin
          GetMem(P, SizeOf(Integer));
          PInteger(P)^ := Value.GetInt32;
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
        TDBXDataTypes.Int64Type:
        begin
          GetMem(P, SizeOf(Int64));
          PInt64(P)^ := Value.GetInt64;
          FMethodValues[I] := MakeRefVar(varInt64, P);
        end;
        TDBXDataTypes.SingleType:
        begin
          GetMem(P, SizeOf(Single));
          PSingle(P)^ := Value.GetSingle;
          FMethodValues[I] := MakeRefVar(varSingle, P);
        end;
        TDBXDataTypes.DoubleType:
        begin
          GetMem(P, SizeOf(Double));
          PDouble(P)^ := Value.GetDouble;
          FMethodValues[I] := MakeRefVar(varDouble, P);
        end;
        TDBXDataTypes.DateTimeType:
        begin
          GetMem(P, SizeOf(TDateTime));
          PDateTime(P)^ := SQLTimeStampToDateTime(Value.GetTimeStamp);
          FMethodValues[I] := MakeRefVar(varDate, P);
        end;
        TDBXDataTypes.CurrencyType:
        begin
          GetMem(P, SizeOf(Currency));
          BcdToCurr(Value.GetBcd, PCurrency(P)^);
          FMethodValues[I] := MakeRefVar(varCurrency, P);
        end;
        TDBXDataTypes.AnsiStringType:
        begin
          GetMem(P, SizeOf(Pointer));
          PPointer(P)^ := nil;
          FMethodValues[I] := MakeRefVar(varString, P);
          AnsiString(TVarData(FMethodValues[I]).VPointer^) := Value.GetAnsiString;
        end;
//        TDBXDataTypes.BytesType:
//        begin
//          SetLength(bytes, value.GetValueSize);
//          Value.GetBytes(0, bytes, 0, Length(Bytes));
//          GetMem(p, Length(bytes));
//          Move(bytes[0], p^, Length(bytes));
//          FMethodValues[i] := MakeRefVar(varByte or varArray, p);
//        end;
        TDBXDataTypes.WideStringType:
        begin
          GetMem(P, SizeOf(Pointer));
          PPointer(P)^ := nil;
          FMethodValues[I] := MakeRefVar(varUString, P);
          String(TVarData(FMethodValues[I]).VPointer^) := Value.GetWideString;
        end;
        TDBXDataTypes.TimeType:
        begin
          GetMem(P, SizeOf(Integer));
          PInteger(P)^ := Value.GetTime;
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
        TDBXDataTypes.DateType:
        begin
          GetMem(P, SizeOf(Integer));
          PInteger(P)^ := Value.GetDate;
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
        TDBXDataTypes.VariantType:
        begin
          VariantValue := Value.AsVariant;
          FMethodValues[I] := VariantValue;
          // Causes a memory leak because vartype is changed by the invoked
          // method for var and out params.  Doesn't appear to be needed.
          //
//          GetMem(p, SizeOf(VariantValue));
//          FillChar(p^, SizeOf(VariantValue), 0);
//          PVariant(p)^ := VariantValue;
//          FMethodValues[i] := MakeRefVar(varVariant, p);
        end;
        TDBXDataTypes.BinaryBlobType:
        begin
          StreamValue := Value.GetStream(False);
          SetAllocatedObject(I, StreamValue);
          GetMem(P, SizeOf(Pointer));
          PNativeInt(P)^ := IntPtr(StreamValue);
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
        TDBXDataTypes.TableType:
        begin
          AssignTableValue(I, Parameter);
          GetMem(P, SizeOf(Pointer));
          PNativeInt(P)^ := FMethodValues[I];
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
        TDBXDataTypes.JsonValueType:
        begin
          GetMem(P, SizeOf(Pointer));
          if Parameter.SubType = TDBXSubDataTypes.UserSubType then
          begin
            JSONValue := Value.GetJSONValue(True);
            PopulateMarshal(Parameter);
            UserValue := JSONToUserObject(JSONValue);
            FUserObjects.Add(UserValue);
            PNativeInt(P)^ := IntPtr(UserValue);
          end
          else
          begin
            JSONValue := Value.GetJSONValue(False);
            SetAllocatedObject(I, JSONValue);
            PNativeInt(P)^ := IntPtr(JSONValue);
          end;
          FMethodValues[I] := MakeRefVar(varInteger, P);
        end;
      else
        raise Exception.CreateFmt(SUnknownType, [I, Parameter.DataType]);
      end;
    end
    else
    begin
      case Parameter.DataType of
        TDBXDataTypes.BooleanType:
          FMethodValues[I] := Value.GetBoolean;
        TDBXDataTypes.UInt8Type:
          FMethodValues[I] := Value.GetUInt8;
        TDBXDataTypes.Int8Type:
          FMethodValues[I] := Value.GetInt8;
        TDBXDataTypes.UInt16Type:
          FMethodValues[I] := Value.GetUInt16;
        TDBXDataTypes.Int16Type:
          FMethodValues[I] := Value.GetInt16;
        TDBXDataTypes.Int32Type:
          FMethodValues[I] := Value.GetInt32;
        TDBXDataTypes.Int64Type:
          FMethodValues[I] := Value.GetInt64;
//        TDBXDataTypes.BcdType:
//          FMethodValues[i] := Value.GetBcd;
        TDBXDataTypes.SingleType:
          FMethodValues[I] := Value.GetSingle;
        TDBXDataTypes.DoubleType:
          FMethodValues[I] := Value.GetDouble;
        TDBXDataTypes.DateTimeType:
          FMethodValues[I] := SQLTimeStampToDateTime(Value.GetTimeStamp);
        TDBXDataTypes.CurrencyType:
        begin
          BCDToCurr(Value.GetBcd, CurrencyValue);
          FMethodValues[I] := CurrencyValue;
        end;
        TDBXDataTypes.AnsiStringType:
          FMethodValues[I] := Value.GetAnsiString;
        TDBXDataTypes.WideStringType:
          FMethodValues[I] := Value.GetWideString;
        TDBXDataTypes.TableType:
          AssignTableValue(I, Parameter);
        TDBXDataTypes.DBXConnectionType:
          FMethodValues[I] := IntPtr(Value.GetDBXConnection);
        TDBXDataTypes.BinaryBlobType:
          AssignStreamValue(I, Parameter);
        TDBXDataTypes.VariantType:
          FMethodValues[I] := Parameter.Value.AsVariant;
        TDBXDataTypes.TimeType:
          FMethodValues[I] := Value.GetTime;
        TDBXDataTypes.DateType:
          FMethodValues[I] := Value.GetDate;
        TDBXDataTypes.JsonValueType:
          AssignJSONValue(i, Parameter);
        TDBXDataTypes.CallbackType:
          FMethodValues[I] := IntPtr(Pointer(Value.GetCallbackValue));
//        TDBXDataTypes.TimeStampType:
//          FMethodValues[i] := Value.GetTimeStamp
      else
        raise Exception.CreateFmt(SUnknownType, [Parameter.DataType]);
      end;
    end;
  end;
end;



procedure TDSMethodValues.AssignStreamValue(Ordinal: Integer;
  Parameter: TDBXParameter);
var
  TypeName:       String;
  Stream:         TStream;
//  AutoFreeStream: TDBXAutoFreeStream;
begin
  if Parameter.Value.IsNull then
    FMethodValues[Ordinal] := 0
  else
  begin
    TypeName := Parameter.TypeName;
  //  if TypeName = STDBXAutoFreeStream then
  //  begin
  //    AutoFreeStream := TDBXAutoFreeStream.Create(Parameter.Value.GetStream);
  //    SetAllocatedObject(Ordinal, AutoFreeStream);
  //    FMethodValues[Ordinal] := Integer(AutoFreeStream);
  //  end
  //  else
      // Every call to GetStream gets a new TStream instance, so only fetch it
      // once.
      //
      if not FServerSideCommand then
        Stream := Parameter.Value.GetStream(False)
      else
        Stream := Parameter.Value.GetStream;
      SetAllocatedObject(Ordinal, Stream);
      FMethodValues[Ordinal] := IntPtr(Stream);
  end;
end;

procedure TDSMethodValues.AssignJSONValue(Ordinal: Integer;
  Parameter: TDBXParameter);
var
  JSONValue: TJSONValue;
  UserValue: TObject;
begin
  if Parameter.Value.IsNull then
    FMethodValues[Ordinal] := 0
  else
  begin
    if Parameter.SubType = TDBXSubDataTypes.UserSubType then
    begin
      JSONValue := Parameter.Value.GetJSONValue(True);
      if (JSONValue <> nil) and JSONValue.Null then
        JSONValue := Parameter.Value.GetJSONValue(False);
      PopulateMarshal(Parameter);
      UserValue := JSONToUserObject(JSONValue);
      FUserObjects.Add(UserValue);
      FMethodValues[Ordinal] := IntPtr(UserValue);
    end
    else
    begin
      JSONValue := Parameter.Value.GetJSONValue(False);
      SetAllocatedObject(Ordinal, JSONValue);
      FMethodValues[Ordinal] := IntPtr(JSONValue);
    end;
  end;
end;

procedure TDSMethodValues.AssignTableValue(Ordinal: Integer;
  Parameter: TDBXParameter);
var
  TypeName: String;
  Reader: TDBXReader;
  DataSet: TCustomSQLDataSet;
  Params: TParams;
//  AutoFreeReader: TDBXAutoFreeReader;
begin
  if Parameter.Value.IsNull then
    FMethodValues[Ordinal] := 0
  else
  begin
    Reader := Parameter.Value.GetDBXReader(False);
    TypeName := Parameter.TypeName;
    if TypeName = '' then
      FMethodValues[Ordinal] := IntPtr(Reader)
    else if TypeName = STDataSet then
    begin
      // Reader will be freed by a parent caller method.
      //
      DataSet := TCustomSQLDataSet.Create(nil, Reader, False);
      DataSet.Open;
      SetAllocatedObject(Ordinal, DataSet);
      FMethodValues[Ordinal] := IntPtr(DataSet);
    end
    else if TypeName = STParams then
    begin
      // Caller owns Reader and will free it later.
      Params := TDBXParamsReader.ToParams(nil, Reader, False);
      SetAllocatedObject(Ordinal, Params);
      FMethodValues[Ordinal] := IntPtr(Params);
    end
  //  else if TypeName = STDBXAutoFreeReader then
  //  begin
  //    AutoFreeReader := TDBXAutoFreeReader.Create(Reader);
  //    SetAllocatedObject(Ordinal, AutoFreeReader);
  //    FMethodValues[Ordinal] := Integer(AutoFreeReader);
  //  end
    else
    begin
      SetAllocatedObject(Ordinal, Reader);
      FMethodValues[Ordinal] := IntPtr(Reader)
    end;
  end;

end;

function TDSMethodValues.ClearReferenceParameters: boolean;
var
  V: Variant;
  I: Integer;
begin
  Result := true;
  for I := 0 to Length(FMethodValues) - 1 do
  begin
    V := FMethodValues[I];
    if VarIsByRef(V) then
    begin
      case TVarData(V).VType of
      varString xor varByRef:
        AnsiString(TVarData(V).VPointer^) := '';
      varUString xor varByRef:
        String(TVarData(V).VPointer^) := '';
      end;
      try
        FreeMem(TVarData(V).VPointer);
      except
        Result := false
      end;
      TVarData(V).VPointer := nil;
      TVarData(V).VType := TVarData(v).VType xor varByRef;
    end;
    VarClear(V);
    if not FServerSideCommand then
      try
        FreeAndNil(FAllocatedObjects[I])
      except
        Result := false
      end;
  end;
  SetLength(FMethodValues, 0);
  SetLength(FAllocatedObjects, 0);

  FreeAndNil(FJSONMarshal);
  FreeAndNil(FJSONUnMarshal);

  if not FServerSideCommand then
    try
      FreeAndNil(FAllocatedReturn)
    except
      Result := false
    end;

  try
    FUserObjects.Clear;
  except
    Result := false
  end;
end;

constructor TDSMethodValues.Create;
begin
  FUserObjects := TObjectList<TObject>.Create(true);
  inherited;
end;

destructor TDSMethodValues.Destroy;
begin
  ClearReferenceParameters;
  FMethodValues := nil;
  FAllocatedObjects := nil;
  FreeAndNil(FUserObjects);
  FreeAndNil(FJSONMarshal);
  FreeAndNil(FJSONUnMarshal);
  inherited;
end;

procedure TDSMethodValues.GetOutValue(OutValue: TDBXParameter);
begin
  SetDbxParameter(OutValue, FMethodValues[OutValue.Ordinal]);
end;

procedure TDSMethodValues.GetReturnValue(ReturnValue: TDBXParameter);
begin
  SetDbxParameter(ReturnValue, FReturnValue);
end;

function TDSMethodValues.GetValues: TArrayOfVariant;
begin
  Result := FMethodValues;
end;


function TDSMethodValues.JSONToUserObject(Json: TJSONValue): TObject;
begin
  // nil parameters are accepted, usually due to var or out
  if (Json = nil) or (Json.Null) then
    exit(nil);
  Result := FJSONUnMarshal.Unmarshal(Json)
end;

procedure TDSMethodValues.PopulateMarshal(Parameter: TDBXParameter);
begin
  if FJSONMarshal = nil then
    if (Parameter.ConnectionHandler <> nil) and
       (Parameter.ConnectionHandler is TDSServerConnectionHandler) then
      if TDSServerConnectionHandler(Parameter.ConnectionHandler).Server is TDSServer then
      begin
        FJSONMarshal := TDSServer(TDSServerConnectionHandler(Parameter.ConnectionHandler).Server).GetJSONMarshaler;
        FJSONUnMarshal := TDSServer(TDSServerConnectionHandler(Parameter.ConnectionHandler).Server).GetJSONUnMarshaler;
      end;
  // throw exception if the JSON marshal fields are not populated, NPE is next
end;

procedure TDSMethodValues.SetAllocatedObject(Ordinal: Integer;
  AllocatedObject: TObject);
//var
//  LastObject: TObject;
begin
  if Length(FAllocatedObjects) > Ordinal then
  begin
    if not FServerSideCommand then
      if FAllocatedObjects[Ordinal] <> AllocatedObject then
        // Don't free if the value has not been changed by the server method.
        // May be the same, for example, with var AStream: TStream parameter when the server method doesn't
        // assign to AStream.
        FreeAndNil(FAllocatedObjects[Ordinal]);
    FAllocatedObjects[Ordinal] := AllocatedObject;
  end else
  begin
    if not FServerSideCommand then
      FreeAndNil(FAllocatedReturn);
    FAllocatedReturn := AllocatedObject;
  end;
end;

procedure TDSMethodValues.SetDBXParameter(DBXParameter: TDBXParameter;
  Value: Variant);
var
  BCDValue: TBcd;
begin
  case DBXParameter.DataType of
    TDBXDataTypes.BooleanType:
      DBXParameter.Value.SetBoolean(Value);
    TDBXDataTypes.UInt8Type:
      DBXParameter.Value.SetUInt8(Value);
    TDBXDataTypes.Int8Type:
      DBXParameter.Value.SetInt8(Value);
    TDBXDataTypes.UInt16Type:
      DBXParameter.Value.SetUInt16(Value);
    TDBXDataTypes.Int16Type:
      DBXParameter.Value.SetInt16(Value);
    TDBXDataTypes.Int32Type:
      DBXParameter.Value.SetInt32(Value);
    TDBXDataTypes.Int64Type:
      DBXParameter.Value.SetInt64(Value);
//    TDBXDataTypes.BcdType:
//      DBXParameter.Value.SetBcd(Value);
    TDBXDataTypes.SingleType:
      DBXParameter.Value.SetSingle(Value);
    TDBXDataTypes.DoubleType:
      DBXParameter.Value.SetDouble(Value);
    TDBXDataTypes.DateTimeType:
      DBXParameter.Value.SetTimeStamp(DateTimeToSQLTimeStamp(TDateTime(Value)));
    TDBXDataTypes.CurrencyType:
      begin
        CurrToBCD(Currency(Value), BCDValue);
        DBXParameter.Value.SetBcd(BCDValue);
      end;
    TDBXDataTypes.TimeType:
      DBXParameter.Value.SetTime(Value);
    TDBXDataTypes.DateType:
      DBXParameter.Value.SetDate(Value);
//    TDBXDataTypes.TimeStampType:
//      DBXParameter.Value.SetTimeStamp(Value);
    TDBXDataTypes.AnsiStringType:
    begin
//      DBXParameter.Value.SetAnsiString(Copy(Value, 1, MaxInt));
      if TVarData(Value).VType and varByRef <> 0 then
        DBXParameter.Value.SetAnsiString(AnsiString(TVarData(Value).VPointer^))
      else
        DBXParameter.Value.SetAnsiString(AnsiString(TVarData(Value).VString));
    end;
    TDBXDataTypes.WideStringType:
    begin
//      DBXParameter.Value.SetWideString(Copy(Value, 1, MaxInt));
      if TVarData(Value).VType and varByRef <> 0 then
        DBXParameter.Value.SetWideString(UnicodeString(TVarData(Value).VPointer^))
      else
        DBXParameter.Value.SetWideString(UnicodeString(TVarData(Value).VUString));
    end;
    TDBXDataTypes.TableType:
      SetDBXReaderParameter(DBXParameter, Value);
    TDBXDataTypes.DBXConnectionType:
      //DBXParameter.Value.SetDBXConnection(TObject(TVarData(Value).VPointer) as TDBXConnection);
      DBXParameter.Value.SetDBXConnection(GetVarObject<TDBXConnection>(Value));
    TDBXDataTypes.JSONValueType:
      SetDBXJSONValueParameter(DBXParameter, Value);
    TDBXDataTypes.CallbackType:
      //DBXParameter.Value.SetCallbackValue(TObject(TVarData(Value).VPointer) as TDBXCallback );
      DBXParameter.Value.SetCallbackValue(GetVarObject<TDBXCallback>(Value));
    TDBXDataTypes.BinaryBlobType:
      SetDBXStreamParameter(DBXParameter, Value);
    TDBXDataTypes.VariantType:
      DBXParameter.Value.AsVariant := Value;
    else
      raise Exception.CreateFmt(SUnknownType, [DBXParameter.DataType]);
  end;
end;

procedure TDSMethodValues.SetDBXJSONValueParameter(DBXParameter: TDBXParameter;
  Value: Variant);
var
  LJSONValue: TJSONValue;
  LUserValue: TObject;
begin
  if IntPtr(TVarData(Value).VPointer) = 0 then
    DBXParameter.Value.SetNull
  else
  begin
    if DBXParameter.SubType = TDBXSubDataTypes.UserSubType then
    begin
      PopulateMarshal(DBXParameter);
      //LUserValue := TObject(TVarData(Value).VPointer);
      LUserValue := GetVarObject<TObject>(Value);
      LJSONValue := UserObjectToJSON(LUserValue);
      if not FUserObjects.Contains(LUserValue) then
        FUserObjects.Add(LUserValue);
    end
    else
      //LJSONValue := TObject(Integer(TVarData(Value).VPointer^)) as TJSONValue;
      LJSONvalue := GetVarObject<TJSONValue>(Value);
    DBXParameter.Value.SetJSONValue(LJSONValue, False);
    SetAllocatedObject(DBXParameter.Ordinal, LJSONValue);
  end;
end;

// Extract an object reference from a Variant, supporting varByRef
function TDSMethodValues.GetVarObject<T>(Value: Variant): T;
var
  LObject: TObject;
begin
  if TVarData(Value).VType and varByRef <> 0 then
  begin
    LObject := TObject(Integer(TVarData(Value).VPointer^)); 
  end
  else
    LObject := TObject(TVarData(Value).VPointer); 
  PObject(@Result)^ := LObject;
end;

procedure TDSMethodValues.SetDBXReaderParameter(DBXParameter: TDBXParameter;
  Value: Variant);
var
  TypeName: String;
  DataSet: TDataSet;
  Params: TParams;
  DBXReader: TDBXReader;
  DBXReaderValue: TDBXReaderValue;
//  DBXAutoFreeReader: TDBXAutoFreeReader;
begin
  TypeName := DBXParameter.TypeName;
  if TypeName = '' then
  begin
    if IntPtr(TVarData(Value).VPointer) = 0 then
      DBXParameter.Value.SetNull
    else
    begin
      //DBXReader := TObject(TVarData(Value).VPointer) as TDBXReader;
      DBXReader := GetVarObject<TDBXReader>(Value);
      DBXParameter.Value.SetDBXReader(DBXReader, False);
      SetAllocatedObject(DBXParameter.Ordinal, DBXReader);
    end;
  end
  else if TypeName = STDBXReaderValue then
  begin
    if IntPtr(TVarData(Value).VPointer) = 0 then
      DBXParameter.Value.SetNull
    else
    begin
      // DBXReaderValue := TObject(TVarData(Value).VPointer) as TDBXReaderValue;
      DBXReaderValue := GetVarObject<TDBXReaderValue>(Value); 
      SetAllocatedObject(DBXParameter.Ordinal, DBXReaderValue.GetDBXReader(False));
      DBXParameter.Value.SetDBXReader(DBXReaderValue.GetDBXReader(False), False);
    end;
  end
  else if TypeName = STDataSet then
  begin
    if IntPtr(TVarData(Value).VPointer) = 0 then
      DBXParameter.Value.SetNull
    else
    begin
      // Dataset := TObject(TVarData(Value).VPointer) as TDataSet;
      Dataset := GetVarObject<TDataSet>(Value); 
      DBXReader := TDBXDataSetReader.Create(DataSet, DataSet.Owner = nil);
      SetAllocatedObject(DBXParameter.Ordinal, DBXReader);
      DBXParameter.Value.SetDBXReader(DBXReader, False);
    end;
  end
  else if TypeName = STParams then
  begin
    if IntPtr(TVarData(Value).VPointer) = 0 then
      DBXParameter.Value.SetNull
    else
    begin
      // Params := TObject(TVarData(Value).VPointer) as TParams;
      Params := GetVarObject<TParams>(Value); 
      DBXReader := TDBXParamsReader.Create(Params, Params.Owner = nil);
      SetAllocatedObject(DBXParameter.Ordinal, DBXReader);
      DBXParameter.Value.SetDBXReader(DBXReader, False);
    end;
  end
//  else if TypeName = STDBXAutoFreeReader then
//  begin
//    DBXAutoFreeReader := TObject(Integer(Value)) as TDBXAutoFreeReader;
//    DBXParameter.Value.SetDBXReader(DBXAutoFreeReader.Reader, True);
//    DBXAutoFreeReader.Free;
//  end;
end;

procedure TDSMethodValues.SetDBXStreamParameter(DBXParameter: TDBXParameter;
  Value: Variant);
var
//  TypeName: String;
  Stream: TStream;
//  DBXAutoFreeStream: TDBXAutoFreeStream;
begin
//  TypeName := DBXParameter.TypeName;
//  if TypeName = STDBXAutoFreeStream then
//  begin
//    DBXAutoFreeStream := TObject(Integer(Value)) as TDBXAutoFreeStream;
//    DBXParameter.Value.SetStream(DBXAutoFreeStream.Stream, True);
//    DBXAutoFreeStream.Free;
//  end
//  else
    if IntPtr(TVarData(Value).VPointer) = 0 then
      DBXParameter.Value.SetNull
    else
    begin
      // Stream := TObject(TVarData(Value).VPointer) as TStream;
      Stream := GetVarObject<TStream>(Value); 
      DBXParameter.Value.SetStream(Stream, False);
      SetAllocatedObject(DBXParameter.Ordinal, Stream);
    end;
end;

procedure TDSMethodValues.SetServerSideCommand(AServerSide: Boolean);
begin
  FServerSidecommand := AServerSide;
end;

function TDSMethodValues.UserObjectToJSON(Data: TObject): TJSONValue;
begin
  if Data = nil then
    exit(nil);
  Result := FJSONMarshal.Marshal(Data)
end;

{ TDSMethod }

constructor TDSMethod.Create(AMethodInfo: PMethodInfoHeader; const AMethodClass: TDSClass);
var
  ReturnInfo: PReturnInfo;
  ParamInfo: PParamInfo;
  NumParams: Integer;
  I: Integer;
  HasSelf: Boolean;
  HasResult: Boolean;
  TypeData: PTypeData;
// these should go in the RTL somewhere
const
  mfConstructor = 1 shl 2;
  mfDestructor = 1 shl 3;
begin
  inherited Create;
  FMethodInfoHeader := AMethodInfo;
  FMethodName := UTF8ToString(AMethodInfo.Name);
  FMethodClass := AMethodClass;
  FIsPublicMethod := True;
  ReturnInfo := Pointer(AMethodInfo);
  Inc(IntPtr(ReturnInfo), SizeOf(TMethodInfoHeader) - SizeOf(ShortString) + 1 +
    Length(AMethodInfo.Name));
  if Assigned(ReturnInfo.ReturnType) then
  begin
    if ReturnInfo.ReturnType^.Kind = tkClass then
      TypeData := GetTypeData(ReturnInfo.ReturnType^)
    else
      TypeData := nil;
    FDSReturnType := TDSClass.Create(UTF8ToString(ReturnInfo.ReturnType^.Name), TypeData, False, False, True)
  end
  else
    FDSReturnType := TDSClass.Create(nil, False);
  FIsConstructor := False; // (ReturnInfo.Flags and mfConstructor) <> 0;
  FIsDestructor := False; // (ReturnInfo.Flags and mfDestructor) <> 0;
  ParamInfo := Pointer(ReturnInfo);
  Inc(IntPtr(ParamInfo), SizeOf(TReturnInfo));
  HasSelf := False;
  HasResult := False;
  NumParams := ReturnInfo^.ParamCount;
  for I := 0 to NumParams - 1 do
  begin
    HasSelf := HasSelf or SameText(String(ParamInfo.Name), 'Self') or  // do not localize
       SameText(String(ParamInfo.Name), 'this'); // do not localize
    HasResult := HasResult or (pfResult in ParamInfo.Flags);
    Inc(IntPtr(ParamInfo), SizeOf(TParamInfo) - SizeOf(ShortString) + 1 +
      Length(PParamInfo(ParamInfo)^.Name));
    Inc(IntPtr(ParamInfo), PWord(ParamInfo)^);
  end;
  SetLength(FParameterTypes, NumParams - Ord(HasSelf) - Ord(HasResult));
  SetLength(FParameterNames, NumParams - Ord(HasSelf) - Ord(HasResult));
  ParamInfo := Pointer(ReturnInfo);
  Inc(IntPtr(ParamInfo), SizeOf(TReturnInfo));
  for I := 0 to NumParams - 1 - Ord(HasResult) do
  begin
    if (I > 0) or not HasSelf then
    begin
      if ParamInfo.ParamType^.Kind = tkClass then
        TypeData := GetTypeData(ParamInfo.ParamType^)
      else
        TypeData := nil;
      FParameterTypes[I - Ord(HasSelf)] := TDSClass.Create(UTF8ToString(ParamInfo.ParamType^.Name), TypeData, pfArray in ParamInfo.Flags,
        (pfVar in ParamInfo.Flags) and not (pfOut in ParamInfo.Flags), pfOut in ParamInfo.Flags);
      FParameterNames[I - Ord(HasSelf)] := UTF8ToString(ParamInfo.Name);
    end;
    Inc(IntPtr(ParamInfo), SizeOf(TParamInfo) - SizeOf(ShortString) + 1 +
      Length(PParamInfo(ParamInfo)^.Name));
    Inc(IntPtr(ParamInfo), PWord(ParamInfo)^)
  end;
end;

destructor TDSMethod.Destroy;
var
  Index: Integer;
begin
  FDSReturnType.Free;
  for Index := 0 to Length(FParameterTypes) - 1 do
    FParameterTypes[Index].Free;
  FParameterTypes := nil;
  FParameterNames := nil;
  inherited;
end;

function TDSMethod.GetMethodClass: TDSClass;
begin
  Result := FMethodClass;
end;

function TDSMethod.GetDSMethodName: String;
begin
  Result := FMethodName;
end;

function TDSMethod.GetParameterNames: TDBXStringArray;
begin
  Result := FParameterNames;
end;

function TDSMethod.GetParameterTypes: TDSClassArray;
begin
  Result := FParameterTypes;
end;

function TDSMethod.GetReturnType: TDSClass;
begin
  Result := FDSReturnType;
end;

function TDSMethod.GetClassInstance(AObject: TObject): TObject;
begin
  if FMethodClass.FIsAdapted then
    Result := TDSAdapterClass(AObject).FAdapteeInstance
  else
    Result := AObject;
end;

class function TDSMethod.InvokeStringFunction(objClass: TObjectClass; methodName: string): string;
var
  retParam: Variant;
  instance: TObject;
  infoHeader: PMethodInfoHeader;
begin
  instance := objClass.Create;
  try
   infoHeader := GetMethodInfo(instance, ShortString(methodName));
   retParam := ObjectInvoke(instance, infoHeader, [], []);
   Result := String(retParam);
  finally
    instance.Free
  end;
end;

procedure TDSMethod.Invoke(MethodInstance: TObject;
  MethodValues: TDSMethodValues);
var
  ParamIndexes: array of Integer;
  Params: TArrayOfVariant;
  I: Integer;
begin
  Params := MethodValues.GetValues;
  SetLength(ParamIndexes, Length(Params));
  for I := 0 to Length(ParamIndexes) - 1 do
    ParamIndexes[I] := I + 1;
  MethodValues.ReturnValue := ObjectInvoke(MethodInstance, FMethodInfoHeader, ParamIndexes, Params);
end;

function TDSMethod.IsPublicMethod: Boolean;
begin
  Result := FIsPublicMethod;
end;

function TDSMethod.IsStaticMethod: Boolean;
begin
  Result := FIsStaticMethod;
end;

{ TDSClass }

constructor TDSClass.Create(AClassRef: TPersistentClass; AIsAdapted: Boolean);
begin
  inherited Create;
  FIsAdapted := AIsAdapted;
  FClassRef := AClassRef;
end;

constructor TDSClass.Create(AClassRef: TPersistentClass; AAdapteeClass: TDSClass);
begin
  inherited Create;
  FClassRef         := AClassRef;
  FAdapteeClass     := AAdapteeClass;
end;

constructor TDSClass.Create(ClassName: string; TypeData: PTypeData; AIsArrayParameter, AIsVarParameter, AIsOutParameter: Boolean);
begin
  inherited Create;
  FClassName := ClassName;
  // Normalize type names (to work with C++ RTTI)
  if ClassName = 'UnicodeString' then
    FClassName := 'String'
  else if ClassName = 'short' then
    FClassName := 'SmallInt'
  else if ClassName = 'bool' then
    FClassName := 'Boolean'
  else if ClassName = '__int64' then
    FClassName := 'Int64'
  else if ClassName = 'float' then
    FClassName := 'Single'
  else if ClassName = 'double' then
    FClassName := 'Double'
  else if ClassName = 'int' then
    FClassName := 'Integer'
  else if ClassName = 'unsigned short' then
    FClassName := 'Word'
  else if ClassName = 'unsigned long' then
    FClassName := 'DWord'
  else if ClassName = 'unsigned char' then
    FClassName := 'Byte'
  else if ClassName = 'signed char' then
    FClassName := 'ShortInt'
  else if ClassName = 'unsigned' then
    FClassName := 'LongWord'
  else if ClassName = 'short' then
    FClassName := 'SmallInt'
  else if ClassName = 'unsigned long' then
    FClassName := 'DWord';
  FTypeData := TypeData;
  FIsArrayParameter := AIsArrayParameter;
  FIsVarParameter := AIsVarParameter;
  FIsOutParameter := AIsOutParameter;
  if Assigned(FTypeData) then
    if FTypeData.ClassType.InheritsFrom(TDBXWritableValue) then
      FValueParameter := true;
end;


function TDSClass.CreateInstance: TObject;
var
  AdapteeInstance: TObject;
  Component: TComponent;
begin
  if Assigned(FClassRef) then
  begin
    if Assigned(FAdapteeClass) then
    begin
      AdapteeInstance := FAdapteeClass.CreateInstance;
      Result := TDSAdapterClassType(FClassRef).Create(AdapteeInstance);
    end
    else
    begin
      if FClassRef.InheritsFrom(TComponent) then
      begin
        // Allows Forms and DataModules to read in the components
        // they contain.
        //
        Component := FClassRef.NewInstance as TComponent;
        Component.Create(nil);
        Result := Component;
      end
      else
        Result := FClassRef.Create
    end;
  end
  else
    Result := nil;
end;

destructor TDSClass.Destroy;
begin
  FreeAndNil(FAdapteeClass);
  inherited;
end;

function TDSClass.GetDSClassName: String;
begin
  if FClassRef = nil then
    Result := FClassName
  else
    Result := FClassRef.ClassName;
end;

{
function TDSClass.GetIAppServerClass: TClass;
var
  CurrentClass: TClass;
  ClassInfo: TMethodInfoArray;
  Index: Integer;
  ShortName: ShortString;
begin
  CurrentClass := FClassRef;
  Result := nil;
  ShortName := ShortString('AS_ApplyUpdates');
//  if CurrentClass.GetClass.GetInterface(IAppServer, AppServer) then
  begin
    while CurrentClass.ClassName <> TPersistent.ClassName do
    begin
      ClassInfo := System.Win.ObjAuto.GetMethods(CurrentClass);
      for Index := 0 to Length(ClassInfo) - 1 do
      begin
        if ClassInfo[Index].Name = ShortName then
        begin
          Result := CurrentClass;
          exit;
        end;
      end;
      CurrentClass := CurrentClass.ClassParent;
    end;
  end;
end;
}
function TDSClass.GetClassLoadError: String;
begin
  Result := '';
end;

function TDSClass.GetDBXDataType(AllowUnknown: Boolean; Parameter: TDBXParameter): Integer;
begin
  if Assigned(FTypeData) then
  begin
    if FTypeData.ClassType.InheritsFrom(TDBXWideStringValue) then
      Result := TDBXDataTypes.WideStringType
    else if FTypeData.ClassType.InheritsFrom(TDBXAnsiStringValue) then
      Result := TDBXDataTypes.AnsiStringType
    else if FTypeData.ClassType.InheritsFrom(TDBXReader) then
      Result := TDBXDataTypes.TableType
    else if FTypeData.ClassType.ClassNameIs(STDataSet) then
    begin
      if Parameter <> nil then
        Parameter.TypeName := STDataSet;
      Result := TDBXDataTypes.TableType;
    end
    else if FTypeData.ClassType.ClassNameIs(STParams) then
    begin
      if Parameter <> nil then
        Parameter.TypeName := STParams;
      Result := TDBXDataTypes.TableType;
    end
    else if FTypeData.ClassType.InheritsFrom(TDBXConnection) then
      Result := TDBXDataTypes.DBXConnectionType
    else if FTypeData.ClassType.InheritsFrom(TStream) then
      Result := TDBXDataTypes.BinaryBlobType
    else if FTypeData.ClassType.InheritsFrom(TDBXUInt8Value) then
      Result := TDBXDataTypes.UInt8Type
    else if FTypeData.ClassType.InheritsFrom(TDBXInt8Value) then
      Result := TDBXDataTypes.Int8Type
    else if FTypeData.ClassType.InheritsFrom(TDBXUInt16Value) then
      Result := TDBXDataTypes.UInt16Type
    else if FTypeData.ClassType.InheritsFrom(TDBXInt16Value) then
      Result := TDBXDataTypes.Int16Type
    else if FTypeData.ClassType.InheritsFrom(TDBXInt32Value) then
      Result := TDBXDataTypes.Int32Type
    else if FTypeData.ClassType.InheritsFrom(TDBXInt64Value) then
      Result := TDBXDataTypes.Int64Type
    else if FTypeData.ClassType.InheritsFrom(TDBXSingleValue) then
      Result := TDBXDataTypes.SingleType
    else if FTypeData.ClassType.InheritsFrom(TDBXDoubleValue) then
      Result := TDBXDataTypes.DoubleType
    else if FTypeData.ClassType.InheritsFrom(TDBXBcdValue) then
      Result := TDBXDataTypes.BcdType
    else if FTypeData.ClassType.InheritsFrom(TDBXTimeValue) then
      Result := TDBXDataTypes.TimeType
    else if FTypeData.ClassType.InheritsFrom(TDBXDateValue) then
      Result := TDBXDataTypes.DateType
    else if FTypeData.ClassType.InheritsFrom(TDBXTimeStampValue) then
      Result := TDBXDataTypes.TimeStampType
    else if FTypeData.ClassType.InheritsFrom(TDBXTimeStampOffsetValue) then
      Result := TDBXDataTypes.TimeStampOffsetType
    else if FTypeData.ClassType.InheritsFrom(TDBXBooleanValue) then
      Result := TDBXDataTypes.BooleanType
    else if FTypeData.ClassType.InheritsFrom(TDBXReaderValue) then
      Result := TDBXDataTypes.TableType
//    else if FTypeData.ClassType.ClassNameIs(STDBXAutoFreeReader) then
//    begin
//      Result := TDBXDataTypes.TableType;
//      if Parameter <> nil then
//        Parameter.TypeName := STDBXAutoFreeReader;
//    end
//    else if FTypeData.ClassType.ClassNameIs(STDBXAutoFreeStream) then
//    begin
//      Result := TDBXDataTypes.BinaryBlobType;
//      if Parameter <> nil then
//        Parameter.TypeName := STDBXAutoFreeStream;
//    end
    else if FTypeData.ClassType.InheritsFrom(TDBXConnectionValue) then
      Result := TDBXDataTypes.DBXConnectionType
    else if FTypeData.ClassType.InheritsFrom(TDBXJSONValue) then
      Result := TDBXDataTypes.JsonValueType
    else if FTypeData.ClassType.InheritsFrom(TJSONValue) then
      Result := TDBXDataTypes.JsonValueType
    else if FTypeData.ClassType.InheritsFrom(TDBXCallback) then
      Result := TDBXDataTypes.CallbackType
    else if FTypeData.ClassType.InheritsFrom(TDBXStreamValue) then
      Result := TDBXDataTypes.BinaryBlobType
    else if FTypeData.ClassType.ClassNameIs(SOleVariant) then
    begin
      Result := TDBXDataTypes.VariantType;
    end
    else if FTypeData.ClassType.InheritsFrom(TObject) then
      Result := TDBXDataTypes.JsonValueType
    else
    begin
      if AllowUnknown then
        Result := TDBXDataTypes.UnknownType
      else
        raise Exception.CreateFmt(SUnknownTypeName, [FTypeData.ClassType.ClassName]);
    end;
  end
  else if SameText(FClassName, 'Integer') then
    Result := TDBXDataTypes.Int32Type
  else if SameText(FClassName, 'AnsiString') then
    Result := TDBXDataTypes.AnsiStringType
  else if SameText(FClassName, 'WideString') and
          not FIsVarParameter and not FIsOutParameter then
    Result := TDBXDataTypes.WideStringType
  else if SameText(FClassName, 'String') then
    Result := TDBXDataTypes.WideStringType
//  Not supported due to ObjAuto lack of support
//  else if SameText(FClassName, 'TBcd') then
//    Result := TDBXDataTypes.BcdType
//  else if SameText(FClassName, 'TSQLTimeStamp') then
//    Result := TDBXDataTypes.TimeStampType
//  else if SameText(FClassName, 'TSQLTimeStampOffset') then
//    Result := TDBXDataTypes.TimeStampOffsetType
  else if SameText(FClassName, 'TDateTime') then
    Result := TDBXDataTypes.DateTimeType
  else if SameText(FClassName, 'Currency') then
    Result := TDBXDataTypes.CurrencyType
  else if SameText(FClassName, 'TDBXTime') then
    Result := TDBXDataTypes.TimeType
  else if SameText(FClassName, 'TDBXDate') then
    Result := TDBXDataTypes.DateType
  else if SameText(FClassName, 'Double') then
    Result := TDBXDataTypes.DoubleType
  else if SameText(FClassName, 'Single') then
    Result := TDBXDataTypes.SingleType
  else if SameText(FClassName, 'Int64') then
    Result := TDBXDataTypes.Int64Type
  else if SameText(FClassName, 'Byte') then
    Result := TDBXDataTypes.UInt8Type
  else if SameText(FClassName, 'ShortInt') then
    Result := TDBXDataTypes.Int8Type
  else if SameText(FClassName, 'Word') then
    Result := TDBXDataTypes.UInt16Type
  else if SameText(FClassName, 'SmallInt') then
    Result := TDBXDataTypes.Int16Type
  else if SameText(FClassName, 'Boolean') then
    Result := TDBXDataTypes.BooleanType
  else if SameText(FClassName, 'TJSONValue') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONObject') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONArray') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONString') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONNumber') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONTrue') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONFalse') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TJSONNull') then
    Result := TDBXDataTypes.JsonValueType
  else if SameText(FClassName, 'TDBXCallback') then
    Result := TDBXDataTypes.CallbackType
  else if SameText(FClassName, SOleVariant) then
  begin
    Result := TDBXDataTypes.VariantType;
  end
//  else if SameText(FClassName, 'TBytes') then
//    Result := TDBXDataTypes.BytesType
  else
  begin
    if AllowUnknown then
      Result := TDBXDataTypes.UnknownType
    else
      raise Exception.CreateFmt(SUnknownTypeName, [FClassName]);
  end;
end;

function TDSClass.GetDBXSubDataType: Integer;
begin
  if Assigned(FTypeData) and (not FTypeData.ClassType.InheritsFrom(TDBXValue)) and
       (not FTypeData.ClassType.InheritsFrom(TJSONValue)) and (not FTypeData.ClassType.InheritsFrom(TDBXConnection)) and
       (not FTypeData.ClassType.ClassNameIs(STDataSet)) and (not FTypeData.ClassType.ClassNameIs(STParams)) and
       (not FTypeData.ClassType.InheritsFrom(TDBXCallback)) then
    Result := TDBXDataTypes.UserSubType
  else
    Result := TDBXDataTypes.UnknownType;
end;

procedure TDSClass.GetDbxType(Parameter: TDBXParameter);
begin
  Parameter.DataType := GetDBXDataType(False, Parameter);
  Parameter.SubType  := GetDBXSubDataType;
end;

function TDSClass.CreateMethod(MethodName: String): TDSMethod;
var
  I: Integer;
  ClassInfo: TMethodInfoArray;
  ShortMethodName: ShortString;
begin
  ShortMethodName := ShortString(MethodName);
  Result := nil;
  ClassInfo := System.ObjAuto.GetMethods(FClassRef);
  for I := 0 to Length(ClassInfo) - 1 do
  begin
    if ClassInfo[I].Name = ShortMethodName then
    begin
      Result := TDSMethod.Create(ClassInfo[I], Self);
      exit;
    end;
  end;
end;

function TDSClass.GetMethods: TDSMethodArray;
  function IsMethodSupported(Method: TDSMethod): Boolean;
  var
    I: Integer;
    LDSClass: TDSClass;
  begin
    if Method = nil then
      Exit(False);
    if Method.IsConstructor or Method.IsDestructor then
      Exit(False);
    // Don't allow methods that return a value type (like TDBXInt32Value)
    if Method.FDSReturnType.ValueParameter then
      Exit(False);
    if not Method.FDSReturnType.IsVoidReturn and
       (Method.FDSReturnType.GetDBXDataType(True, nil) = TDBXDataTypes.UnknownType) then
      Exit(False);
    for I := 0 to Length(Method.ParameterTypes) - 1 do
    begin
      LDSClass := Method.ParameterTypes[I];
      if LDSClass.GetDBXDataType(True, nil) = TDBXDataTypes.UnknownType then
        Exit(False);

      // Don't allow out or var parameters that are value types
      if LDSClass.ValueParameter and (LDSClass.FIsVarParameter or LDSClass.FIsOutParameter) then
        Exit(False);
    end;
    Result := True;
  end;

  procedure AddMethods(const ADSClass: TDSClass);
  var
    Offset, I: Integer;
    ClassInfo: TMethodInfoArray;
    ClassRef: TPersistentClass;
    SupportedMethodCount: Integer;
    Methods: TDSMethodArray;
  begin
    ClassRef := ADSClass.FClassRef;
    ClassInfo := System.ObjAuto.GetMethods(ClassRef);
    Offset := Length(Result);
    SupportedMethodCount := 0;
    SetLength(Methods, Length(ClassInfo));
    for I := Low(ClassInfo) to High(ClassInfo) do
    begin
      try
        Methods[I] := TDSMethod.Create(ClassInfo[I], ADSClass);
      except
        FreeAndNil(Methods[I]);
      end;
      if IsMethodSupported(Methods[I]) then
        Inc(SupportedMethodCount);
    end;
    SetLength(Result, Length(Result) + SupportedMethodCount);
    for I := Low(Methods) to High(Methods) do
    begin
      if IsMethodSupported(Methods[I]) then
      begin
        Result[Offset] := Methods[I];
        Inc(Offset);
      end
      else
        FreeAndNil(Methods[I]);
    end;
  end;
begin
  Result := nil;
  if Assigned(FAdapteeClass) then
    AddMethods(FAdapteeClass);
  AddMethods(Self);
end;

function TDSClass.GetTypeUnit: String;
begin
  if Assigned(FTypeData) then
    exit(string(FTypeData.UnitName))
  else
    exit(EmptyStr);
end;

function TDSClass.IsArrayParameter: Boolean;
begin
  Result := FIsArrayParameter;
end;

function TDSClass.IsInOutParameter: Boolean;
begin
  Result := FValueParameter or FIsVarParameter;
end;

function TDSClass.IsOutParameter: Boolean;
begin
  Result := FIsOutParameter;
end;

function TDSClass.IsVoidReturn: Boolean;
begin
  Result := (FClassRef = nil) and (FClassName = '');
end;

{ TDSPackage }

constructor TDSPackage.Create;
begin
  inherited Create;
  FClassList := TStringList.Create;
end;

destructor TDSPackage.Destroy;
begin
  FClassList.Free;
  inherited;
end;

procedure TDSPackage.GetClassesProc(AClass: TPersistentClass);
begin
  FClassList.Add(AClass.ClassName);
end;

function TDSPackage.CreateDSClass(ClassName: String): TDSClass;
var
  ClassRef: TPersistentClass;
begin
  ClassRef := GetClass(ClassName);
  if Assigned(ClassRef) then
    Result := TDSClass.Create(ClassRef, false)
  else
    Result := nil;
end;

function TDSPackage.GetDSClasses(
  classNamePattern: String): TDBXStringArray;
var
  ClassFinder: TClassFinder;
  I: Integer;
  N: Integer;
begin
  FClassList.Clear;
  ClassFinder := TClassFinder.Create(TPersistent);
  try
    ClassFinder.GetClasses(GetClassesProc);
  finally
    ClassFinder.Free;
  end;
  SetLength(Result, FClassList.Count);
  N := 0;
  for I := 0 to FClassList.Count - 1 do
  begin
    if (classNamePattern = EmptyStr) or (Pos(string(classNamePattern), FClassList[I]) <> 0) then
    begin
      Result[N] := FClassList[I];
      Inc(N);
    end;
  end;
  SetLength(Result, N);
end;

function TDSPackage.GetDSPackages: TDBXStringArray;
begin
  SetLength(Result,  0);
end;

constructor TDSAdapterClass.Create(AdapteeInstance: TObject);
begin
  inherited Create;
  FAdapteeInstance := AdapteeInstance;
end;

end.
