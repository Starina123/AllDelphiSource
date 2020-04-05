{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{           FireDAC TFDBatchMove JSON driver            }
{                                                       }
{ Copyright(c) 2004-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.Comp.BatchMove.JSON;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  System.JSON, System.JSON.Writers, System.JSON.Types, System.JSON.BSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Util,
  FireDAC.Comp.DataSet, FireDAC.Comp.BatchMove;

const
  C_FD_DefCallbackName = 'fdJson';

type
  TFDJsonField = class;
  TFDJsonFields = class;
  TFDJsonDataDef = class;
  TFDBatchMoveJSONWriter = class;

  TFDJsonDataType = (jtOther, jtString, jtInteger, jtNumber, jtBoolean,
    jtDateTime, jtGUID, jtBlob);
  TFDJsonFormat = (jfJSON, jfJSONP, jfBSON);

  TFDJsonField = class(TCollectionItem)
  private
    FDataType: TFDJsonDataType;
    FFieldName: String;
    FFieldSize: Integer;
    FPrecision: Integer;
    FBinaryType: TJsonBinaryType;
    FValue: Variant;
    procedure SetFieldName(const AValue: String);
  protected
    function GetDisplayName: String; override;
    procedure AssignTo(ADest: TPersistent); override;
  public
    procedure Assign(ASource: TPersistent); override;
    procedure Define(const AName: String; ADataType: TFDDataType;
      ASize, APrecision, AScale: Integer);
  published
    property FieldName: String read FFieldName write SetFieldName;
    property DataType: TFDJsonDataType read FDataType write FDataType default jtOther;
    property FieldSize: Integer read FFieldSize write FFieldSize default 0;
    property Precision: Integer read FPrecision write FPrecision default 0;
    property BinaryType: TJsonBinaryType read FBinaryType write FBinaryType default TJsonBinaryType.Generic;
  end;

  TFDJsonFields = class(TCollection)
  private
    [Weak] FDef: TFDJsonDataDef;
    function GetItem(AIndex: Integer): TFDJsonField; inline;
    procedure SetItem(AIndex: Integer; const AValue: TFDJsonField); inline;
    procedure CheckFieldName(AField: TFDJsonField; const ANewName: String);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ADef: TFDJsonDataDef);
    function Add: TFDJsonField;
    procedure AddAll;
    function FindField(const AName: String): TFDJsonField;
    function FieldByName(const AName: String): TFDJsonField;
    property Items[Index: Integer]: TFDJsonField read GetItem write SetItem; default;
  end;

  TFDJsonDataDef = class(TPersistent)
  private
    [Weak] FDriver: TFDBatchMoveJSONWriter;
    FFields: TFDJsonFields;
    FEmptyValueHandling: TJsonEmptyValueHandling;
    FDateTimeZoneHandling: TJsonDateTimeZoneHandling;
    FEndOfLine: TFDTextEndOfLine;
    FExtendedJsonMode: TJsonExtendedJsonMode;
    FFormatting: TJsonFormatting;
    FDateFormatHandling: TJsonDateFormatHandling;
    FQuoteName: Boolean;
    FIndentChar: Char;
    FStringEscapeHandling: TJsonStringEscapeHandling;
    FIndentation: Integer;
    FQuoteChar: Char;
    FFloatFormatHandling: TJsonFloatFormatHandling;
    FCallbackName: String;
    FWriteNulls: Boolean;
    procedure SetFields(const AValue: TFDJsonFields);
    function IsCNS: Boolean;
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ADriver: TFDBatchMoveJSONWriter);
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    property Driver: TFDBatchMoveJSONWriter read FDriver;
  published
    property Fields: TFDJsonFields read FFields write SetFields;
    // common
    property EmptyValueHandling: TJsonEmptyValueHandling read FEmptyValueHandling write FEmptyValueHandling default TJsonEmptyValueHandling.Empty;
    property DateTimeZoneHandling: TJsonDateTimeZoneHandling read FDateTimeZoneHandling write FDateTimeZoneHandling default TJsonDateTimeZoneHandling.Local;
    property WriteNulls: Boolean read FWriteNulls write FWriteNulls default False;
    // text writer
    property EndOfLine: TFDTextEndOfLine read FEndOfLine write FEndOfLine default elDefault;
    property ExtendedJsonMode: TJsonExtendedJsonMode read FExtendedJsonMode write FExtendedJsonMode default TJsonExtendedJsonMode.None;
    property Indentation: Integer read FIndentation write FIndentation default 2;
    property IndentChar: Char read FIndentChar write FIndentChar default ' ';
    property QuoteChar: Char read FQuoteChar write FQuoteChar default '"';
    property QuoteName: Boolean read FQuoteName write FQuoteName default True;
    property Formatting: TJsonFormatting read FFormatting write FFormatting default TJsonFormatting.None;
    property StringEscapeHandling: TJsonStringEscapeHandling read FStringEscapeHandling write FStringEscapeHandling default TJsonStringEscapeHandling.EscapeNonAscii;
    property DateFormatHandling: TJsonDateFormatHandling read FDateFormatHandling write FDateFormatHandling default TJsonDateFormatHandling.Iso;
    property FloatFormatHandling: TJsonFloatFormatHandling read FFloatFormatHandling write FFloatFormatHandling default TJsonFloatFormatHandling.Symbol;
    // JSONP
    property CallbackName: String read FCallbackName write FCallbackName stored IsCNS;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TFDBatchMoveJSONWriter = class(TFDBatchMoveDriver, IFDBatchMoveDriver, IFDBatchMoveWriter)
  private
    FFileName: String;
    FDataDef: TFDJsonDataDef;
    FJsonFormat: TFDJsonFormat;
    FEncoding: TFDEncoding;
    FEncoder: TEncoding;
    FStream: TStream;
    FJsonWriter: TJSONWriter;
    FJsonArray: TJSONArray;

    FFDEncoder: TFDEncoder;
    FFDStorage: IFDStanStorage;
    FFDDataSet: TFDDataSet;

    FOutput: TBufferedFileStream;
    FText: TStreamWriter;
    FBin: TBinaryWriter;
    FJson: TJsonWriter;
    FWrapIntoArray: Boolean;
    FGenerateExtJSModel: Boolean;

    function GetActualFileName: String;
    procedure SetDataDef(const AValue: TFDJsonDataDef);
    procedure SetJsonFormat(const AValue: TFDJsonFormat);
    procedure ClearSources;
    procedure SetFileName(const AValue: String);
    procedure SetStream(const AValue: TStream);
    procedure SetJsonWriter(const aValue: TJSONWriter);
    procedure SetJsonArray(const AValue: TJSONArray);
    procedure OpenStream(AStream: TStream);
    function IsASCIIOutput: Boolean;
  protected
    // IFDBatchMoveDriver
    function GetCatalog: String;
    function GetIsUnicode: Boolean;
    function GetIsOpen: Boolean;
    function GetFieldCount: Integer;
    function GetFieldName(AIndex: Integer): String;
    // public
    function CheckDefined(ARaise: Boolean): Boolean;
    procedure Open(AStartTx: Boolean);
    procedure Close(AStopTxError: Boolean);
    procedure Refresh;
    procedure AbortJob;
    function AddAutoFields: Boolean;
    procedure DeleteAutoFields;
    function GetFieldIndex(const AName: String; ACheck: Boolean): Integer;
    function GetFieldInfo(AIndex: Integer; var AType: TFDDataType;
      var ASize: LongWord; var APrec, AScale: Integer; var AInKey, AIsIdentity: Boolean): TObject;
    // IFDBatchMoveWriter
    procedure CreateTable;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
    procedure Erase(ANoUndo: Boolean);
    procedure WriteHeader;
    procedure SetFieldValue(AField: TObject; const AValue: Variant);
    function FindRecord: Boolean;
    function InsertRecord: Integer;
    function UpdateRecord: Integer;
    function DeleteRecord: Integer;
    function FlushRecords: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GenerateExtJSModel(const AModelName: String; AWithTypes: Boolean;
      AOutput: TStrings);
    property Stream: TStream read FStream write SetStream;
    property JsonWriter: TJSONWriter read FJsonWriter write SetJsonWriter;
    property JsonArray: TJSONArray read FJsonArray write SetJsonArray;
    property Encoder: TEncoding read FEncoder write FEncoder;
    property ActualFileName: String read GetActualFileName;
  published
    property FileName: String read FFileName write SetFileName;
    property DataDef: TFDJsonDataDef read FDataDef write SetDataDef;
    property JsonFormat: TFDJsonFormat read FJsonFormat write SetJsonFormat default jfJSON;
    property Encoding: TFDEncoding read FEncoding write FEncoding default ecDefault;
  end;

implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  System.Variants, System.Generics.Collections,
  FireDAC.Stan.Consts, FireDAC.Stan.Error, FireDAC.Stan.Factory, FireDAC.DatS,
    FireDAC.Comp.BatchMove.DataSet, FireDAC.Stan.StorageJSON;

{-------------------------------------------------------------------------------}
{ TFDJsonField                                                                  }
{-------------------------------------------------------------------------------}
procedure TFDJsonField.SetFieldName(const AValue: String);
begin
  if FFieldName <> AValue then begin
    TFDJsonFields(Collection).CheckFieldName(Self, AValue);
    FFieldName := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDJsonField.GetDisplayName: String;
begin
  Result := FieldName;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonField.Assign(ASource: TPersistent);
begin
  if ASource is TFDJsonField then begin
    DataType := TFDJsonField(ASource).DataType;
    FieldName := TFDJsonField(ASource).FieldName;
    FieldSize := TFDJsonField(ASource).FieldSize;
    Precision := TFDJsonField(ASource).Precision;
    BinaryType := TFDJsonField(ASource).BinaryType;
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonField.AssignTo(ADest: TPersistent);
var
  oFld: TFieldDef;
begin
  if ADest is TFieldDef then begin
    oFld := ADest as TFieldDef;
    oFld.Name := FieldName;
    if oFld.Name = '' then
      oFld.Attributes := oFld.Attributes + [faUnNamed];
    case DataType of
    jtOther,
    jtString:
      begin
        if FieldSize < 0 then
          if TFDJsonFields(Collection).FDef.Driver.GetIsUnicode then
            oFld.DataType := ftWideMemo
          else
            oFld.DataType := ftMemo
        else begin
          if TFDJsonFields(Collection).FDef.Driver.GetIsUnicode then
            oFld.DataType := ftWideString
          else
            oFld.DataType := ftString;
          oFld.Size := FieldSize;
          if oFld.Size = 0 then
            oFld.Size := C_FD_DefStrSize;
        end;
      end;
    jtInteger:
      if FieldSize = 0 then
        oFld.DataType := ftInteger
      else if FieldSize <= 3 then
        oFld.DataType := ftSmallint
      else if FieldSize <= 5 then
        oFld.DataType := ftShortint
      else if FieldSize <= 10 then
        oFld.DataType := ftInteger
      else if FieldSize <= 20 then
        oFld.DataType := ftLargeint;
    jtNumber:
      begin
        if FieldSize = 0 then
          oFld.DataType := ftFloat
        else if FieldSize <= 7 then
          oFld.DataType := ftSingle
        else if FieldSize <= 15 then
          oFld.DataType := ftFloat
        else if FieldSize <= 19 then
          oFld.DataType := ftExtended
        else
          oFld.DataType := ftFMTBcd;
        oFld.Size := FieldSize;
        oFld.Precision := Precision;
      end;
    jtBoolean:
      oFld.DataType := ftBoolean;
    jtDateTime:
      oFld.DataType := ftDateTime;
    jtGUID:
      oFld.DataType := ftGuid;
    jtBlob:
      oFld.DataType := ftBlob;
    end;
  end
  else
    inherited AssignTo(ADest);
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonField.Define(const AName: String; ADataType: TFDDataType;
  ASize, APrecision, AScale: Integer);
begin
  case ADataType of
  dtBoolean:
    DataType := jtBoolean;
  dtSByte,
  dtByte:
    begin
      DataType := jtInteger;
      FieldSize := 3;
    end;
  dtInt16,
  dtUInt16:
    begin
      DataType := jtInteger;
      FieldSize := 5;
    end;
  dtInt32,
  dtUInt32:
    begin
      DataType := jtInteger;
      FieldSize := 10;
    end;
  dtInt64,
  dtUInt64:
    begin
      DataType := jtInteger;
      FieldSize := 20;
    end;
  dtSingle:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 7;
    end;
  dtDouble:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 15;
    end;
  dtExtended:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 19;
    end;
  dtCurrency:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 20;
    end;
  dtBCD:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 18;
    end;
  dtFMTBcd:
    begin
      DataType := jtNumber;
      Precision := APrecision;
      if Precision > 0 then
        FieldSize := Precision
      else
        FieldSize := 38;
    end;
  dtDate,
  dtTime,
  dtDateTimeStamp,
  dtDateTime:
    begin
      DataType := jtDateTime;
      FieldSize := 27;
    end;
  dtTimeIntervalFull,
  dtTimeIntervalYM,
  dtTimeIntervalDS:
    begin
      DataType := jtString;
      FieldSize := 35;
    end;
  dtAnsiString,
  dtWideString:
    begin
      DataType := jtString;
      FieldSize := ASize;
    end;
  dtByteString:
    begin
      DataType := jtBlob;
      FieldSize := ASize;
      BinaryType := TJsonBinaryType.Generic;
    end;
  dtBlob,
  dtHBlob,
  dtHBFile:
    begin
      DataType := jtBlob;
      FieldSize := -1;
      BinaryType := TJsonBinaryType.Generic;
    end;
  dtMemo,
  dtWideMemo,
  dtHMemo,
  dtWideHMemo,
  dtXML:
    begin
      DataType := jtString;
      FieldSize := -1;
    end;
  dtGUID:
    begin
      DataType := jtGUID;
      FieldSize := 38;
      BinaryType := TJsonBinaryType.UUID;
    end;
  else
    DataType := jtOther;
    FieldSize := 100;
  end;
  FieldName := AName;
end;

{-------------------------------------------------------------------------------}
{ TFDJsonFields                                                                 }
{-------------------------------------------------------------------------------}
constructor TFDJsonFields.Create(ADef: TFDJsonDataDef);
begin
  inherited Create(TFDJsonField);
  FDef := ADef;
end;

{-------------------------------------------------------------------------------}
function TFDJsonFields.GetItem(AIndex: Integer): TFDJsonField;
begin
  Result := TFDJsonField(inherited GetItem(AIndex));
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonFields.SetItem(AIndex: Integer; const AValue: TFDJsonField);
begin
  inherited SetItem(AIndex, AValue);
end;

{-------------------------------------------------------------------------------}
function TFDJsonFields.GetOwner: TPersistent;
begin
  Result := FDef;
end;

{-------------------------------------------------------------------------------}
function TFDJsonFields.Add: TFDJsonField;
begin
  Result := TFDJsonField(inherited Add);
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonFields.AddAll;
var
  i: Integer;
  oDrv: IFDBatchMoveDriver;
  eType: TFDDataType;
  iSize: LongWord;
  iPrec, iScale: Integer;
  lInKey, lIsIdentity: Boolean;
begin
  if FDef.Driver.BatchMove.Reader.FieldCount > 0 then
    oDrv := FDef.Driver.BatchMove.Reader
  else if FDef.Driver.BatchMove.Writer.FieldCount > 0 then
    oDrv := FDef.Driver.BatchMove.Writer
  else
    Exit;
  Clear;
  for i := 0 to oDrv.FieldCount - 1 do begin
    oDrv.GetFieldInfo(i, eType, iSize, iPrec, iScale, lInKey, lIsIdentity);
    Add.Define(oDrv.FieldNames[i], eType, iSize, iPrec, iScale);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDJsonFields.FindField(const AName: String): TFDJsonField;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if AnsiCompareText(AName, Items[i].FieldName) = 0 then begin
      Result := Items[i];
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDJsonFields.FieldByName(const AName: String): TFDJsonField;
begin
  Result := FindField(AName);
  if Result = nil then
    FDException(FDef.Driver.BatchMove, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoJsonFld, [AName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonFields.CheckFieldName(AField: TFDJsonField; const ANewName: String);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if (Items[i] <> AField) and (AnsiCompareText(Items[i].FieldName, ANewName) = 0) then
      FDException(FDef.Driver.BatchMove, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPJsonFldDup, [ANewName]);
end;

{-------------------------------------------------------------------------------}
{ TFDJsonDataDef                                                                }
{-------------------------------------------------------------------------------}
constructor TFDJsonDataDef.Create(ADriver: TFDBatchMoveJSONWriter);
begin
  inherited Create;
  FDriver := ADriver;
  FFields := TFDJsonFields.Create(Self);
  // common
  FEmptyValueHandling := TJsonEmptyValueHandling.Empty;
  FDateTimeZoneHandling := TJsonDateTimeZoneHandling.Local;
  FWriteNulls := False;
  // text writer
  FEndOfLine := elDefault;
  FExtendedJsonMode := TJsonExtendedJsonMode.None;
  FIndentation := 2;
  FIndentChar := ' ';
  FQuoteChar := '"';
  FQuoteName := True;
  FFormatting := TJsonFormatting.None;
  FStringEscapeHandling := TJsonStringEscapeHandling.EscapeNonAscii;
  FDateFormatHandling := TJsonDateFormatHandling.Iso;
  FFloatFormatHandling := TJsonFloatFormatHandling.Symbol;
  // JSONP
  FCallbackName := C_FD_DefCallbackName;
end;

{-------------------------------------------------------------------------------}
destructor TFDJsonDataDef.Destroy;
begin
  FDFreeAndNil(FFields);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDJsonDataDef.IsCNS: Boolean;
begin
  Result := CallbackName <> C_FD_DefCallbackName;
end;

{-------------------------------------------------------------------------------}
function TFDJsonDataDef.GetOwner: TPersistent;
begin
  Result := Driver;
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonDataDef.Assign(ASource: TPersistent);
begin
  if ASource is TFDJsonDataDef then begin
    Fields := TFDJsonDataDef(ASource).Fields;
    EmptyValueHandling := TFDJsonDataDef(ASource).EmptyValueHandling;
    DateTimeZoneHandling := TFDJsonDataDef(ASource).DateTimeZoneHandling;
    WriteNulls := TFDJsonDataDef(ASource).WriteNulls;
    EndOfLine := TFDJsonDataDef(ASource).EndOfLine;
    ExtendedJsonMode := TFDJsonDataDef(ASource).ExtendedJsonMode;
    Indentation := TFDJsonDataDef(ASource).Indentation;
    IndentChar := TFDJsonDataDef(ASource).IndentChar;
    QuoteChar := TFDJsonDataDef(ASource).QuoteChar;
    QuoteName := TFDJsonDataDef(ASource).QuoteName;
    Formatting := TFDJsonDataDef(ASource).Formatting;
    StringEscapeHandling := TFDJsonDataDef(ASource).StringEscapeHandling;
    DateFormatHandling := TFDJsonDataDef(ASource).DateFormatHandling;
    FloatFormatHandling := TFDJsonDataDef(ASource).FloatFormatHandling;
    CallbackName := TFDJsonDataDef(ASource).CallbackName;
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
procedure TFDJsonDataDef.SetFields(const AValue: TFDJsonFields);
begin
  FFields.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
{ TFDBatchMoveJSONWriter                                                        }
{-------------------------------------------------------------------------------}
constructor TFDBatchMoveJSONWriter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataDef := TFDJsonDataDef.Create(Self);
  FJsonFormat := jfJSON;
end;

{-------------------------------------------------------------------------------}
destructor TFDBatchMoveJSONWriter.Destroy;
begin
  FDFreeAndNil(FDataDef);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetDataDef(const AValue: TFDJsonDataDef);
begin
  FDataDef.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetJsonFormat(const AValue: TFDJsonFormat);
begin
  if JsonFormat <> AValue then begin
    FJsonFormat := AValue;
    case JsonFormat of
    jfJSONP:
      begin
        FJsonWriter := nil;
        FJsonArray := nil;
      end;
    jfBSON:
      FJsonArray := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.ClearSources;
begin
  FFileName := '';
  FStream := nil;
  FJsonWriter := nil;
  FJsonArray := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetFileName(const AValue: String);
begin
  if FileName <> AValue then begin
    if AValue <> '' then
      ClearSources;
    FFileName := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetStream(const AValue: TStream);
begin
  if Stream <> AValue then begin
    if AValue <> nil then
      ClearSources;
    FStream := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetJsonWriter(const AValue: TJSONWriter);
begin
  if JsonWriter <> AValue then begin
    if AValue <> nil then begin
      ClearSources;
      if JsonFormat = jfJSONP then
        JsonFormat := jfJSON;
    end;
    FJsonWriter := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetJsonArray(const AValue: TJSONArray);
begin
  if JsonArray <> AValue then begin
    if AValue <> nil then begin
      ClearSources;
      if JsonFormat <> jfJSON then
        JsonFormat := jfJSON;
    end;
    FJsonArray := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetActualFileName: String;
begin
  Result := FDExpandStr(Trim(FileName));
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.CheckDefined(ARaise: Boolean): Boolean;
var
  iErr: Integer;
begin
  Result := (ActualFileName <> '') or (Stream <> nil) or (JsonWriter <> nil) or
    (JsonArray <> nil) or FGenerateExtJSModel;
  if not Result and ARaise then begin
//    if Self is TFDBatchMoveJsonReader then
//      iErr := er_FD_DPNoJsonSrc
//    else
      iErr := er_FD_DPNoJsonDest;
    FDException(BatchMove, [S_FD_LComp, S_FD_LComp_PDM], iErr, []);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.IsASCIIOutput: Boolean;
begin
  Result := (DataDef.StringEscapeHandling = TJsonStringEscapeHandling.EscapeNonAscii) and
   ((Encoder <> nil) and
    ((Encoder = TEncoding.UTF8) or (Encoder = TEncoding.ANSI) or (Encoder = TEncoding.ASCII)) or
   (Encoding in [ecDefault, ecUTF8, ecANSI]));
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.OpenStream(AStream: TStream);
var
  oEnc: TEncoding;
begin
  if ([poClearDest, poClearDestNoUndo] * BatchMove.Options = []) and (AStream.Size > 0) then
    AStream.Position := AStream.Size
  else
    AStream.Size := 0;

  if JsonFormat in [jfJSON, jfJSONP] then begin
    if IsASCIIOutput() then begin
      if (BatchMove.Reader is TFDBatchMoveDataSetReader) and
         (TFDBatchMoveDataSetReader(BatchMove.Reader).DataSet is TFDDataSet) and
         (BatchMove.Mappings.Count = 0) and
         (DataDef.ExtendedJsonMode = TJsonExtendedJsonMode.None) and
         (DataDef.Formatting = TJsonFormatting.None) and
         (DataDef.StringEscapeHandling = TJsonStringEscapeHandling.EscapeNonAscii) and
         not DataDef.WriteNulls and
         not Assigned(BatchMove.OnWriteValue) and
         not Assigned(BatchMove.OnWriteRecord) then begin
        FDCreateInterface(IFDStanStorage, FFDStorage, True, 'JSON');
        FFDDataSet := TFDDataSet(TFDBatchMoveDataSetReader(BatchMove.Reader).DataSet);
        FFDEncoder := TFDEncoder.Create(nil);
      end;
      FText := TAsciiStreamWriter.Create(AStream, 32768);
    end

    else begin
    if Encoder <> nil then
      oEnc := Encoder
    else
      case Encoding of
      ecUTF8:  oEnc := TEncoding.UTF8;
      ecUTF16: oEnc := TEncoding.Unicode;
      ecANSI:  oEnc := TEncoding.ANSI;
      else     oEnc := TEncoding.UTF8;
      end;
    FText := TStreamWriter.Create(AStream, oEnc);
    end;

    FText.AutoFlush := FFDStorage <> nil;
    FText.NewLine := TFDTextFile.GetEOLStr(DataDef.EndOfLine);
    if JsonFormat = jfJSONP then begin
      FText.Write(DataDef.CallbackName);
      FText.Write('(');
    end;

    if FFDStorage = nil then
      FJson := TJsonTextWriter.Create(FText)
    else
      FFDStorage.Open(nil, FFDEncoder, C_FD_SysNamePrefix + '[', AStream, smWrite);
  end

  else begin
    FBin := TBinaryWriter.Create(AStream);
    FJson := TBsonWriter.Create(FBin);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.Open(AStartTx: Boolean);
var
  sFileName: String;
begin
  try
    sFileName := ActualFileName;
    if sFileName <> '' then begin
      if not FileExists(sFileName) then
        FileClose(FileCreate(sFileName));
      FOutput := TBufferedFileStream.Create(sFileName, fmOpenWrite or fmShareDenyWrite);
      OpenStream(FOutput);
    end
    else if Stream <> nil then
      OpenStream(Stream)
    else if JsonWriter <> nil then begin
      FJson := JsonWriter;
      if [poClearDest, poClearDestNoUndo] * BatchMove.Options <> [] then
        FJson.Rewind;
    end
    else if JsonArray <> nil then begin
      FJson := TJsonObjectWriter.Create(False);
      if [poClearDest, poClearDestNoUndo] * BatchMove.Options <> [] then
        while JsonArray.Count > 0 do
          JsonArray.Remove(JsonArray.Count - 1).Free;
    end;

    if FJson <> nil then begin
    FJson.EmptyValueHandling := DataDef.EmptyValueHandling;
    FJson.DateTimeZoneHandling := DataDef.DateTimeZoneHandling;
    if FJson is TJsonTextWriter then begin
      TJsonTextWriter(FJson).ExtendedJsonMode := DataDef.ExtendedJsonMode;
      TJsonTextWriter(FJson).Indentation := DataDef.Indentation;
      TJsonTextWriter(FJson).IndentChar := DataDef.IndentChar;
      TJsonTextWriter(FJson).QuoteChar := DataDef.QuoteChar;
      TJsonTextWriter(FJson).QuoteName := DataDef.QuoteName;
      TJsonTextWriter(FJson).Formatting := DataDef.Formatting;
      TJsonTextWriter(FJson).StringEscapeHandling := DataDef.StringEscapeHandling;
      TJsonTextWriter(FJson).DateFormatHandling := DataDef.DateFormatHandling;
      TJsonTextWriter(FJson).FloatFormatHandling := DataDef.FloatFormatHandling;
    end;

    FWrapIntoArray := FJson.WriteState <> TJsonWriteState.&Array;
    if FWrapIntoArray then begin
      FJson.WriteStartArray;
      if JsonArray <> nil then
      begin
        TJsonObjectWriter(FJson).OwnValue := True;
        try
          TJsonObjectWriter(FJson).Container := JsonArray;
        finally
          TJsonObjectWriter(FJson).OwnValue := False;
        end;
      end;
    end;
    end;
  except
    Close(True);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.Close(AStopTxError: Boolean);
begin
  if not AStopTxError then begin
    if FFDStorage <> nil then
      FFDStorage.Close;
    if FWrapIntoArray then
      FJson.WriteEndArray;
    if (FText <> nil) and (JsonFormat = jfJSONP) then
      FText.Write(');');
  end;
  if FJson <> JsonWriter then
    FDFreeAndNil(FJson);
  if FText <> nil then
    FDFreeAndNil(FText);
  if FBin <> nil then
    FDFreeAndNil(FBin);
  if FOutput <> Stream then
    FDFreeAndNil(FOutput);
  if FFDStorage <> nil then begin
    FFDDataSet := nil;
    FFDStorage := nil;
    FDFreeAndNil(FFDEncoder);
  end;
  FWrapIntoArray := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.Refresh;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.AbortJob;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.AddAutoFields: Boolean;
begin
  Result := DataDef.Fields.Count = 0;
  if Result then
    DataDef.Fields.AddAll;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.DeleteAutoFields;
begin
  DataDef.Fields.Clear;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetCatalog: String;
begin
  Result := ActualFileName;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetIsUnicode: Boolean;
begin
  if Encoder <> nil then
    Result := Length(Encoder.GetPreamble) > 0
  else
    Result := Encoding in [ecUTF8, ecUTF16 {$IFDEF POSIX}, ecDefault {$ENDIF}];
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetIsOpen: Boolean;
begin
  Result := (FFDStorage <> nil) or (FJson <> nil) or FGenerateExtJSModel;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetFieldCount: Integer;
begin
  Result := DataDef.Fields.Count;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetFieldName(AIndex: Integer): String;
begin
  Result := DataDef.Fields[AIndex].FieldName;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetFieldIndex(const AName: String;
  ACheck: Boolean): Integer;
var
  oField: TFDJsonField;
begin
  if ACheck then
    Result := DataDef.Fields.FieldByName(AName).Index
  else begin
    oField := DataDef.Fields.FindField(AName);
    if oField <> nil then
      Result := oField.Index
    else
      Result := -1;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.GetFieldInfo(AIndex: Integer;
  var AType: TFDDataType; var ASize: LongWord; var APrec, AScale: Integer;
  var AInKey, AIsIdentity: Boolean): TObject;
const
  TDT2JT: array[TFDJsonDataType] of TFDDataType = (dtAnsiString, dtAnsiString,
    dtInt32, dtDouble, dtBoolean, dtDateTime, dtGUID, dtBlob);
var
  oField: TFDJsonField;
begin
  oField := DataDef.Fields[AIndex];
  AType := TDT2JT[oField.DataType];
  if oField.FieldSize < 0 then
    ASize := 0
  else
    ASize := oField.FieldSize;
  APrec := oField.Precision;
  AScale := 0;
  AInKey := False;
  AIsIdentity := False;
  Result := oField;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.CreateTable;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.StartTransaction;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.CommitTransaction;
begin
  if FOutput <> nil then
    FOutput.FlushBuffer;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.RollbackTransaction;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.Erase(ANoUndo: Boolean);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.WriteHeader;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.SetFieldValue(AField: TObject;
  const AValue: Variant);
begin
  TFDJsonField(AField).FValue := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.FindRecord: Boolean;
begin
  FDCapabilityNotSupported(BatchMove, [S_FD_LComp, S_FD_LComp_PDM]);
  Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.InsertRecord: Integer;
var
  i: Integer;
  oField: TFDJsonField;
  v: Variant;
  iLen: Integer;
  pData: Pointer;
  aVal: TBytes;
begin
  if FFDStorage <> nil then
    FFDDataSet.GetRow().SaveActualToStorage(FFDStorage)

  else begin
    BatchMove.Mappings.Move(False);
    FJson.WriteStartObject;
    for i := 0 to DataDef.Fields.Count - 1 do begin
      oField := DataDef.Fields[i];
      v := oField.FValue;
      if VarIsEmpty(v) or VarIsNull(v) then begin
        if DataDef.WriteNulls then begin
          FJson.WritePropertyName(oField.FieldName);
          FJson.WriteNull;
        end;
      end
      else begin
        FJson.WritePropertyName(oField.FieldName);
        case oField.DataType of
        jtOther,
        jtString:
          case VarType(v) of
{$WARNINGS OFF}
          varString:  FJson.WriteValue(RawByteString(TVarData(v).VString));
{$WARNINGS ON}
          varUString: FJson.WriteValue(UnicodeString(TVarData(v).VUString));
          else        FJson.WriteValue(String(v));
          end;
        jtInteger:
          FJson.WriteValue(Int64(v));
        jtNumber:
          FJson.WriteValue(Extended(v));
        jtBoolean:
          FJson.WriteValue(Boolean(v));
        jtDateTime:
          FJson.WriteValue(TDateTime(v));
        jtGUID:
          FJson.WriteValue(StringToGUID(String(v)));
        jtBlob:
          begin
            if VarIsArray(v) then begin
              iLen := VarArrayHighBound(v, 1) + 1;
              pData := VarArrayLock(v);
              try
                aVal := BytesOf(pData, iLen);
              finally
                VarArrayUnlock(v);
              end;
            end
            else
              aVal := TEncoding.ANSI.GetBytes(String(v));
            FJson.WriteValue(aVal, oField.BinaryType);
          end;
        else
          ASSERT(False);
        end;
      end;
    end;
    FJson.WriteEndObject;
  end;

  Result := 1;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.UpdateRecord: Integer;
begin
  FDCapabilityNotSupported(BatchMove, [S_FD_LComp, S_FD_LComp_PDM]);
  Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.DeleteRecord: Integer;
begin
  FDCapabilityNotSupported(BatchMove, [S_FD_LComp, S_FD_LComp_PDM]);
  Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDBatchMoveJSONWriter.FlushRecords: Integer;
begin
  // nothing
  Result := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDBatchMoveJSONWriter.GenerateExtJSModel(const AModelName: String;
  AWithTypes: Boolean; AOutput: TStrings);
const
  C_IndentLen = 2;
var
  iLevel: Integer;
  i: Integer;
  sType: String;
  sField: String;

  procedure Ident;
  begin
    Inc(iLevel);
  end;

  procedure Outdent;
  begin
    Dec(iLevel);
  end;

  procedure W(const AStr: String);
  begin
    AOutput.Add(StringOfChar(' ', iLevel * C_IndentLen) + AStr);
  end;

begin
  FGenerateExtJSModel := True;
  try
    BatchMove.CheckReader;
    BatchMove.Reader.Open(False);
    BatchMove.Mappings.Prepare;
    AOutput.BeginUpdate;
    iLevel := 0;
    try
      AOutput.Clear;
      W('Ext.define(''' + AModelName + ''', {');
      Ident;
      W('extend: ''Ext.data.Model'',');
      W('requires: [');
      Ident;
      W('''Ext.data.field.Field''');
      Outdent;
      W('],');
      W('fields: [');
      Ident;

      for i := 0 to DataDef.Fields.Count - 1 do begin
        sField := '{ name: ''' + DataDef.Fields[i].FieldName + '''';
        if AWithTypes then begin
          case DataDef.Fields[i].DataType of
          jtOther:     sType := 'auto';
          jtInteger:   sType := 'int';
          jtNumber:    sType := 'number';
          jtBoolean:   sType := 'boolean';
          jtDateTime:  sType := 'date';
          jtString,
          jtGUID,
          jtBlob:      sType := 'string';
          end;
          sField := sField + ', type: ''' + sType + '''';
        end;
        sField := sField + ' }';
        if i < DataDef.Fields.Count - 1 then
          sField := sField + ',';
        W(sField);
      end;

      Outdent;
      if (BatchMove.Mappings.KeyFields <> '') and (Pos(';', BatchMove.Mappings.KeyFields) = 0) then begin
        W('],');
        W('idProperty: ''' + BatchMove.Mappings.KeyFields + '''');
      end
      else
      W(']');

      Outdent;
      W('});');
    finally
      AOutput.EndUpdate;
      BatchMove.Mappings.Unprepare;
      BatchMove.Reader.Close(True);
    end;
  finally
    FGenerateExtJSModel := False;
  end;
end;

end.
