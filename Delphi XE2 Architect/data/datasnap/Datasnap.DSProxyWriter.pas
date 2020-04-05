{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSProxyWriter;

interface

uses Data.DBXPlatform, Datasnap.DSCommonProxy, System.Generics.Collections, System.Masks, System.SysUtils;

type

  TDSProxyWriter = class;

  TDSProxyWriterFactory = class
  public
    class function Instance: TDSProxyWriterFactory; static;
    class procedure RegisterWriter(const Id: string; const WriterClass: TObjectClass); static;
    class procedure UnregisterWriter(const Id: string); static;
    class function HasWriter(const Id: UnicodeString): Boolean;
    class function GetWriter(const Id: UnicodeString): TDSProxyWriter; static;
    class function RegisteredWritersList: TDBXStringArray; static;
    constructor Create;
    destructor Destroy; override;
  private
    class var FSingleton: TDSProxyWriterFactory;
    FRegisteredWriters: TDBXObjectStore;
  end;

  TDSProxyWriteFeature = (feConnectsWithDSRestConnection, feConnectsWithDBXConnection, feRESTClient, feDBXClient);
  TDSProxyWriteFeatures = set of TDSProxyWriteFeature;

  TDSProxyWriterProperties = record
    UsesUnits: string;
    DefaultExcludeClasses: string;
    DefaultExcludeMethods: string;
    DefaultEncoding: TEncoding;
    Author: string;
    Comment: string;
    Language: string;
    Features: TDSProxyWriteFeatures;
  end;

  TDSProxyFileDescription = record
    ID: string;
    DefaultFileExt: string;
  end;

  TDSProxyFileDescriptions = array of TDSProxyFileDescription;

  TDSCustomProxyWriter = class;

  TDSProxyWriter = class abstract(TFactoryObject)
  public
    function CreateProxyWriter: TDSCustomProxyWriter; virtual; abstract;
    function Properties: TDSProxyWriterProperties; virtual; abstract;
    function FileDescriptions: TDSProxyFileDescriptions; virtual; abstract;
  end;

  TDSCustomProxyWriter = class abstract
  public
    constructor Create;
    destructor Destroy; override;
    procedure WriteProxy; virtual;
  protected
    procedure WriteImplementation; virtual; abstract;
    procedure WriteInterface; virtual; abstract;
    procedure WriteFileHeader; virtual;
    function GetTimeStamp: string; virtual;
    procedure DerivedWrite(const Line: UnicodeString); virtual; abstract;
    procedure DerivedWriteLine; virtual; abstract;
    function GetAssignmentString: UnicodeString; virtual; abstract;
    function IncludeClassName(const ClassName: UnicodeString): Boolean;
    function IncludeMethodName(const MethodName: UnicodeString): Boolean;
    function IncludeClass(const ProxyClass: TDSProxyClass): Boolean;  virtual;
    function IncludeMethod(const ProxyMethod: TDSProxyMethod): Boolean;  virtual;
    procedure WriteLine(const Line: UnicodeString); overload;
    procedure Indent;
    procedure Outdent;
    procedure WriteLine; overload;
    function IsKnownTableTypeName(const Name: UnicodeString): Boolean; virtual;
    function IsKnownDBXValueTypeName(const Name: UnicodeString): Boolean; virtual;
    function IsKnownJSONTypeName(const Name: UnicodeString): Boolean; virtual;
    function GetDelphiTypeName(const Param: TDSProxyParameter): UnicodeString; virtual;
    function GetGetter(const Param: TDSProxyParameter): UnicodeString;
    function GetSetter(const Param: TDSProxyParameter): UnicodeString;
    function GetCreateDataSetReader(const Param: TDSProxyParameter): UnicodeString; virtual; abstract;
    function GetCreateParamsReader(const Param: TDSProxyParameter): UnicodeString; virtual; abstract;
  strict private
    FMetadata: TDSProxyMetadata;
    FOwnsMetaData: Boolean;
  private
    procedure ClearMasks;
    function InclusionTest(const Includes: TDBXStringArray; const Excludes: TDBXStringArray; const Name: UnicodeString): Boolean;
    procedure SetMetaDataLoader(const Value: IDSProxyMetaDataLoader);
  protected
    FUnitFileName: UnicodeString;
    FIndentString: UnicodeString;
    FIndentIncrement: Integer;
    FMetaDataLoader: IDSProxyMetaDataLoader;
  private
    FIndentSpaces: Integer;
    FMasks: TObjectDictionary<string, TMask>;
    FIncludeClasses: TDBXStringArray;
    FExcludeClasses: TDBXStringArray;
    FIncludeMethods: TDBXStringArray;
    FExcludeMethods: TDBXStringArray;
    FProxyWriters: TDictionary<string, IDSProxyWriter>;
    function GetMetadata: TDSProxyMetadata;
    procedure SetExcludeClasses(const Value: TDBXStringArray);
    procedure SetExcludeMethods(const Value: TDBXStringArray);
    procedure SetIncludeClasses(const Value: TDBXStringArray);
    procedure SetIncludeMethods(const Value: TDBXStringArray);
  public
    property Metadata: TDSProxyMetadata read GetMetadata;
    property MetaDataLoader: IDSProxyMetaDataLoader read FMetaDataLoader write SetMetaDataLoader;
    property ProxyWriters: TDictionary<string, IDSProxyWriter> read FProxyWriters;
    property UnitFileName: UnicodeString read FUnitFileName write FUnitFileName;
    property IncludeClasses: TDBXStringArray read FIncludeClasses write SetIncludeClasses;
    property ExcludeClasses: TDBXStringArray read FExcludeClasses write SetExcludeClasses;
    property IncludeMethods: TDBXStringArray read FIncludeMethods write SetIncludeMethods;
    property ExcludeMethods: TDBXStringArray read FExcludeMethods write SetExcludeMethods;
  protected
    property AssignmentString: UnicodeString read GetAssignmentString;
  end;

const
  // value from toolsapi.pas
  sDSProxyDelphiLanguage = 'Delphi';
  sDSProxyCppLanguage = 'C++';
  sDSProxyJavaScriptLanguage = 'Java Script';

implementation

uses Data.DBXCommon, Datasnap.DSClientResStrs;

{ TDSClientProxyWriterFactory }
class function TDSProxyWriterFactory.Instance: TDSProxyWriterFactory;
begin
  if FSingleton = nil then
    FSingleton := TDSProxyWriterFactory.Create;
  Result := FSingleton;
end;

class procedure TDSProxyWriterFactory.RegisterWriter(const Id: string; const WriterClass: TObjectClass);
var
  LInstance: TDSProxyWriterFactory;
begin
  LInstance := TDSProxyWriterFactory.Instance;
  LInstance.FRegisteredWriters[Id] := TObject(WriterClass);
end;

class procedure TDSProxyWriterFactory.UnregisterWriter(const Id: string);
var
  LInstance: TDSProxyWriterFactory;
  I: Integer;
begin
  LInstance := TDSProxyWriterFactory.Instance;
  I := LInstance.FRegisteredWriters.IndexOf(Id);
  if I >= 0 then
  begin
    LInstance.FRegisteredWriters.Delete(I);
    if LInstance.FRegisteredWriters.Count = 0 then
      Instance.Free;
  end;
end;

class function TDSProxyWriterFactory.HasWriter(const Id: string): Boolean;
begin
  Result := Instance.FRegisteredWriters[Id] <> nil;
end;

class function TDSProxyWriterFactory.GetWriter(const Id: string): TDSProxyWriter;
var
  Clazz: TObjectClass;
begin
  if Id = '' then
    raise TDSProxyException.Create(SNoWriter);
  if not HasWriter(Id) then
    raise TDSProxyException.CreateFmt(SUnknownWriter, [Id]);
  Clazz := TObjectClass(Instance.FRegisteredWriters[Id]);
  if Clazz <> nil then
  begin
    try
      Exit(TDSProxyWriter(Clazz.Create));
    except
      on E: Exception do
        ;
    end;
    Result := nil;
  end
  else
    Result := nil;
end;

class function TDSProxyWriterFactory.RegisteredWritersList: TDBXStringArray;
var
  List: TDBXStringArray;
  I: Integer;
  Keys: TDBXKeyEnumerator;
  LInstance: TDSProxyWriterFactory;
begin
  LInstance := TDSProxyWriterFactory.Instance;
  if LInstance.FRegisteredWriters.Count > 0 then
  begin
    SetLength(List ,LInstance.FRegisteredWriters.Count);
    I := 0;
    Keys := LInstance.FRegisteredWriters.Keys;
    try
      while Keys.MoveNext do
        List[IncrAfter(I)] := UnicodeString(Keys.Current);
    finally
      Keys.Free;
    end;
  end;
  Result := List;
end;

constructor TDSProxyWriterFactory.Create;
begin
  inherited Create;
  FRegisteredWriters := TDBXObjectStore.Create;
end;

destructor TDSProxyWriterFactory.Destroy;
begin
  FreeAndNil(FRegisteredWriters);
  FSingleton := nil;
  inherited Destroy;
end;

procedure TDSCustomProxyWriter.WriteFileHeader;
var
  GeneratedMessage: UnicodeString;
  Line: UnicodeString;
  LTimeStamp: string;
begin
  GeneratedMessage := '// ' + SGeneratedCode;
  LTimeStamp := GetTimeStamp;
  if Trim(LTimeStamp) <> '' then
    LTimeStamp := '// ' + LTimeStamp;
  Line := '// ';
  WriteLine(Line);
  WriteLine(GeneratedMessage);
  if Trim(LTimeStamp) <> '' then
    WriteLine(LTimeStamp);
  WriteLine(Line);
  WriteLine;
end;

procedure TDSCustomProxyWriter.ClearMasks;
begin
  FMasks.Clear;
end;

constructor TDSCustomProxyWriter.Create;
begin
  inherited Create;
  FMasks := TObjectDictionary<string, TMask>.Create([doOwnsValues]);
  FProxyWriters := TDictionary<string, IDSProxyWriter>.Create;
end;

function TDSCustomProxyWriter.InclusionTest(const Includes: TDBXStringArray; const Excludes: TDBXStringArray; const Name: UnicodeString): Boolean;

  function IsMatch(const Pattern: string): Boolean;
  var
    Mask: TMask;
  begin
    if not FMasks.TryGetValue(Pattern, Mask) then
    begin
      Mask := TMask.Create(Trim(Pattern));
      FMasks.Add(Pattern, Mask);
    end;
    Result := Mask.Matches(Name);
  end;

var
  Index: Integer;
begin
  Result := True;
  if Excludes <> nil then
  begin
    for Index := 0 to Length(Excludes) - 1 do
    begin
      if IsMatch(Excludes[Index]) then
      begin
        Result := False;
        break;
      end;
    end;
  end;
  if Includes <> nil then
  begin
    for Index := 0 to Length(Includes) - 1 do
    begin
      if IsMatch(Includes[Index]) then
      begin
        Exit(True);
      end;
    end;
    Result := False;
  end;
end;

function TDSCustomProxyWriter.IncludeClassName(const ClassName: UnicodeString): Boolean;
begin
  Result := InclusionTest(FIncludeClasses, FExcludeClasses, ClassName);
end;

function TDSCustomProxyWriter.IncludeMethodName(const MethodName: UnicodeString): Boolean;
begin
  Result := InclusionTest(FIncludeMethods, FExcludeMethods, MethodName);
end;

procedure TDSCustomProxyWriter.WriteLine(const Line: UnicodeString);
begin
  DerivedWrite(FIndentString + Line);
  DerivedWriteLine;
end;

procedure TDSCustomProxyWriter.Indent;
var
  Index: Integer;
begin
  FIndentSpaces := FIndentSpaces + FIndentIncrement;
  for Index := 0 to FIndentIncrement - 1 do
    FIndentString := FIndentString + ' ';
end;

procedure TDSCustomProxyWriter.Outdent;
var
  Index: Integer;
begin
  FIndentSpaces := FIndentSpaces - FIndentIncrement;
  FIndentString := '';
  for Index := 0 to FIndentSpaces - 1 do
    FIndentString := FIndentString + ' ';
end;

procedure TDSCustomProxyWriter.SetExcludeClasses(const Value: TDBXStringArray);
begin
  ClearMasks;
  FExcludeClasses := Value;
end;

procedure TDSCustomProxyWriter.SetExcludeMethods(const Value: TDBXStringArray);
begin
  ClearMasks;
  FExcludeMethods := Value;
end;

procedure TDSCustomProxyWriter.SetIncludeClasses(const Value: TDBXStringArray);
begin
  ClearMasks;
  FIncludeClasses := Value;
end;

procedure TDSCustomProxyWriter.SetIncludeMethods(const Value: TDBXStringArray);
begin
  ClearMasks;
  FIncludeMethods := Value;
end;

procedure TDSCustomProxyWriter.SetMetaDataLoader(
  const Value: IDSProxyMetaDataLoader);
begin
  FMetaDataLoader := Value;
end;

procedure TDSCustomProxyWriter.WriteLine;
begin
  DerivedWriteLine;
end;

procedure TDSCustomProxyWriter.WriteProxy;
begin
  WriteFileHeader;
  WriteInterface;
  WriteImplementation;
end;

function TDSCustomProxyWriter.IsKnownTableTypeName(const Name: UnicodeString): Boolean;
begin
  if not StringIsNil(Name) then
  begin
    if (CompareText(Name, 'TDataSet') = 0) or (CompareText(Name, 'TParams') = 0) then
      Exit(True);
  end;
  Result := False;
end;

function TDSCustomProxyWriter.IsKnownDBXValueTypeName(const Name: UnicodeString): Boolean;
begin
  if not StringIsNil(Name) then
  begin
    if (CompareText(Copy(Name,0+1,4-(0)), 'TDBX') = 0) and (StringIndexOf(Name,'Value') = Length(Name) - 5) then
      Exit(True);
  end;
  Result := False;
end;

function TDSCustomProxyWriter.IsKnownJSONTypeName(const Name: UnicodeString): Boolean;
begin
  if not StringIsNil(Name) then
  begin
    if CompareText(Copy(Name,0+1,5-(0)), 'TJSON') = 0 then
      Exit(True);
  end;
  Result := False;
end;

destructor TDSCustomProxyWriter.Destroy;
begin
  FMasks.Free;
  FProxyWriters.Free;
  if FOwnsMetaData then
    FMetadata.Free;
  inherited;
end;

function TDSCustomProxyWriter.GetDelphiTypeName(const Param: TDSProxyParameter): UnicodeString;
var
  Name: UnicodeString;
begin
  Name := Param.TypeName;
  if not StringIsNil(Name) then
    Exit(Name);
  case Param.DataType of
    TDBXDataTypes.AnsiStringType:
      Name := 'AnsiString';
    TDBXDataTypes.BooleanType:
      Name := 'Boolean';
    TDBXDataTypes.Int8Type:
      Name := 'ShortInt';
    TDBXDataTypes.UInt8Type:
      Name := 'Byte';
    TDBXDataTypes.Int16Type:
      Name := 'SmallInt';
    TDBXDataTypes.UInt16Type:
      Name := 'Word';
    TDBXDataTypes.Int32Type:
      Name := 'Integer';
    TDBXDataTypes.Int64Type:
      Name := 'Int64';
    TDBXDataTypes.WideStringType:
      Name := 'String';
    TDBXDataTypes.SingleType:
      Name := 'Single';
    TDBXDataTypes.DoubleType:
      Name := 'Double';
    TDBXDataTypes.BcdType:
      Name := 'TBcd';
    TDBXDataTypes.TimeType:
      Name := 'TDBXTime';
    TDBXDataTypes.DatetimeType:
      Name := 'TDateTime';
    TDBXDataTypes.DateType:
      Name := 'TDBXDate';
    TDBXDataTypes.TimeStampType:
      Name := 'TSQLTimeStamp';
    TDBXDataTypes.TimeStampOffsetType:
      Name := 'TSQLTimeStampOffset';
    TDBXDataTypes.CurrencyType:
      Name := 'Currency';
    TDBXDataTypes.TableType:
      if IsKnownTableTypeName(Param.TypeName) then
        Name := Param.TypeName
      else
        Name := 'TDBXReader';
    TDBXDataTypes.BinaryBlobType:
      Name := 'TStream';
    TDBXDataTypes.VariantType:
      Name := 'Variant';
    TDBXDataTypes.DbxConnectionType:
      Name := 'TDBXConnection';
    else
      Name := '{UnknownType(' + IntToStr(Param.DataType) + ')}';
  end;
  Result := Name;
end;

function TDSCustomProxyWriter.GetGetter(const Param: TDSProxyParameter): UnicodeString;
var
  Getter: UnicodeString;
begin
  case Param.DataType of
    TDBXDataTypes.AnsiStringType:
      Getter := 'GetAnsiString';
    TDBXDataTypes.BooleanType:
      Getter := 'GetBoolean';
    TDBXDataTypes.Int8Type:
      Getter := 'GetInt8';
    TDBXDataTypes.UInt8Type:
      Getter := 'GetUInt8';
    TDBXDataTypes.Int16Type:
      Getter := 'GetInt16';
    TDBXDataTypes.UInt16Type:
      Getter := 'GetUInt16';
    TDBXDataTypes.Int32Type:
      Getter := 'GetInt32';
    TDBXDataTypes.Int64Type:
      Getter := 'GetInt64';
    TDBXDataTypes.WideStringType:
      Getter := 'GetWideString';
    TDBXDataTypes.SingleType:
      Getter := 'GetSingle';
    TDBXDataTypes.DoubleType:
      Getter := 'GetDouble';
    TDBXDataTypes.BcdType:
      Getter := 'GetBcd';
    TDBXDataTypes.TimeType:
      Getter := 'GetTime';
    TDBXDataTypes.DatetimeType:
      Getter := 'AsDateTime';
    TDBXDataTypes.DateType:
      Getter := 'GetDate';
    TDBXDataTypes.TimeStampType:
      Getter := 'GetTimeStamp';
    TDBXDataTypes.TimeStampOffsetType:
      Getter := 'GetTimeStampOffset';
    TDBXDataTypes.CallbackType:
      Getter := 'GetCallbackValue';
    TDBXDataTypes.JsonValueType:
      Getter := 'GetJSONValue';
    TDBXDataTypes.CurrencyType:
      Getter := 'AsCurrency';
    TDBXDataTypes.TableType:
      Getter := 'GetDBXReader';
    TDBXDataTypes.BinaryBlobType:
      Getter := 'GetStream';
    TDBXDataTypes.VariantType:
      Getter := 'AsVariant';
    else
      Getter := '{UnknownType(' + IntToStr(Param.DataType) + ')}';
  end;
  Result := Getter;
end;

function TDSCustomProxyWriter.GetMetadata: TDSProxyMetadata;
begin
  if FMetaData = nil then
  begin
    FMetaData := TDSProxyMetadata.Create;
    FOwnsMetaData := True;
    if FMetaDataLoader <> nil then
      FMetaDataLoader.Load(FMetaData);
  end;
  Result := FMetaData;
end;

function TDSCustomProxyWriter.GetSetter(const Param: TDSProxyParameter): UnicodeString;
var
  Setter: UnicodeString;
  HasOwnerOption: Boolean;
begin
  HasOwnerOption := False;
  case Param.DataType of
    TDBXDataTypes.AnsiStringType:
      Setter := 'SetAnsiString';
    TDBXDataTypes.BooleanType:
      Setter := 'SetBoolean';
    TDBXDataTypes.Int8Type:
      Setter := 'SetInt8';
    TDBXDataTypes.UInt8Type:
      Setter := 'SetUInt8';
    TDBXDataTypes.Int16Type:
      Setter := 'SetInt16';
    TDBXDataTypes.UInt16Type:
      Setter := 'SetUInt16';
    TDBXDataTypes.Int32Type:
      Setter := 'SetInt32';
    TDBXDataTypes.Int64Type:
      Setter := 'SetInt64';
    TDBXDataTypes.WideStringType:
      Setter := 'SetWideString';
    TDBXDataTypes.SingleType:
      Setter := 'SetSingle';
    TDBXDataTypes.DoubleType:
      Setter := 'SetDouble';
    TDBXDataTypes.BcdType:
      Setter := 'SetBcd';
    TDBXDataTypes.TimeType:
      Setter := 'SetTime';
    TDBXDataTypes.DatetimeType:
      Setter := 'AsDateTime';
    TDBXDataTypes.DateType:
      Setter := 'SetDate';
    TDBXDataTypes.TimeStampType:
      Setter := 'SetTimeStamp';
    TDBXDataTypes.TimeStampOffsetType:
      Setter := 'SetTimeStampOffset';
    TDBXDataTypes.CallbackType:
      Setter := 'SetCallbackValue';
    TDBXDataTypes.JsonValueType:
      begin
        Setter := 'SetJSONValue';
        HasOwnerOption := True;
      end;
    TDBXDataTypes.CurrencyType:
      Setter := 'AsCurrency';
    TDBXDataTypes.TableType:
      begin
        Setter := 'SetDBXReader';
        HasOwnerOption := True;
      end;
    TDBXDataTypes.BinaryBlobType:
      begin
        Setter := 'SetStream';
        HasOwnerOption := True;
      end;
    TDBXDataTypes.VariantType:
      Setter := 'AsVariant';
    else
      Setter := '{UnknownType(' + IntToStr(Param.DataType) + ')}';
  end;
  if Setter[1+0] = 'S' then
  begin
    if (Param.DataType = TDBXDataTypes.TableType) and IsKnownTableTypeName(Param.TypeName) then
    begin
      if CompareText(Param.TypeName, 'TDataSet') = 0 then
        Exit(Setter + GetCreateDataSetReader(Param))
      else if CompareText(Param.TypeName, 'TParams') = 0 then
        Exit(Setter + GetCreateParamsReader(Param));
    end;
    if IsKnownDBXValueTypeName(Param.TypeName) then
      Exit(Setter + '(' + Param.ParameterName + '.Value.' + GetGetter(Param) + ')');
    Setter := Setter + '(' + Param.ParameterName;
    if HasOwnerOption then
      Setter := Setter + ', FInstanceOwner)'
    else
      Setter := Setter + ')';
  end
  else
    Setter := Setter + ' ' + AssignmentString + ' ' + Param.ParameterName;
  Result := Setter;
end;

function TDSCustomProxyWriter.GetTimeStamp: string;
var
  LNow: TDateTime;
begin
  LNow := Now;
  Result := FormatDateTime(FormatSettings.ShortDateFormat, LNow) + ' ' + FormatDateTime(FormatSettings.LongTimeFormat, LNow);
end;

function TDSCustomProxyWriter.IncludeClass(
  const ProxyClass: TDSProxyClass): Boolean;
begin
  Result := IncludeClassName(ProxyClass.ProxyClassName);
end;

function TDSCustomProxyWriter.IncludeMethod(
  const ProxyMethod: TDSProxyMethod): Boolean;
begin
  Result := INcludeMethodName(ProxyMethod.ProxyMethodName);
end;

end.

