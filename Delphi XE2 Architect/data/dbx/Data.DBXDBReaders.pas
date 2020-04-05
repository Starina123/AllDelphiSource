{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

  ///<summary>
  /// This unit contains several <c>TDBXReader</c> implementations for the TParams
  /// class as well as the TDataSet and TClientDataSet components.  These TDBXReader
  /// implementations allow the contents of these classes and components to be
  /// used as parameters for a <c>TDBXCommand</c>.  DataSnap server methods support
  /// <c>TDBXReader</c> parameters.
  ///</summary>

unit Data.DBXDBReaders;

interface

uses
  Data.DB,
  System.Classes,
  Data.DBXCommon,
  Data.DBXPlatform,
  DataSnap.DBClient,
  Data.DBXCommonTable,
  System.SysUtils,
  Data.SqlTimSt,
  Data.FMTBcd,
  System.Generics.Collections
  ;

type
  TDBXOriginalRow = class;
  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXParamsRow = class(TDBXRow)
  private
    FParams:  TParams;
  public
    constructor Create(Params: TParams);
    function CreateCustomValue(const ValueType: TDBXValueType): TDBXValue; override;
    ///<summary>Returns a UnicodeString from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetWideString(DbxValue: TDBXWideStringValue;
      var Value: UnicodeString; var IsNull: LongBool); override;
    ///<summary>Returns a LongBool from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool;
      var IsNull: LongBool); override;
    ///<summary>Returns a Byte from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
      var IsNull: LongBool); override;
    ///<summary>Returns a ShortInt from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
      var IsNull: LongBool); override;
    ///<summary>Returns a Word from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
      var IsNull: LongBool); override;
    ///<summary>Returns a SmallInt from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
      var IsNull: LongBool); override;
    ///<summary>Returns an Integer from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
      var IsNull: LongBool); override;
    ///<summary>Returns an Int64 from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
      var IsNull: LongBool); override;
    ///<summary>Returns a Single from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
      var IsNull: LongBool); override;
    ///<summary>Returns a Double from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetDouble(DbxValue: TDBXDoubleValue; var Value: Double;
      var IsNull: LongBool); override;
    ///<summary>Returns a PAnsiChar from the row in the AnsiStringBuilder parameter or sets IsNull to true.</summary>
    procedure GetAnsiString(DbxValue: TDBXAnsiStringValue;
      var AnsiStringBuilder: PAnsiChar; var IsNull: LongBool); override;
    ///<summary>Returns a TDBXDate from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate;
      var IsNull: LongBool); override;
    ///<summary>Returns a TBytes from the row in the Buffer parameter, and the number
    ///  of bytes copied into the Buffer in the ReturnLength parameter or sets IsNull to true.</summary>
    procedure GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64;
      const Buffer: TBytes; BufferOffset: Int64; Length: Int64;
      var ReturnLength: Int64; var IsNull: LongBool); override;
    ///<summary>Returns the DataSize from the row in the ByteLength parameter or sets IsNull to true.</summary>
    procedure GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64;
      var IsNull: LongBool); override;
    ///<summary>Returns a TDBXTime from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime;
      var IsNull: LongBool); override;
    ///<summary>Returns a TBcd from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd;
      var IsNull: LongBool); override;
    ///<summary>Returns a TSQLTimeStamp from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTimeStamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp; var IsNull: LongBool); override;
    ///<summary>Returns a TSQLTimeStampOffset from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
      var Value: TSQLTimeStampOffset; var IsNull: LongBool); override;
    ///<summary>Returns a TStream from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetStream(DbxValue: TDBXStreamValue; var Stream: TStream;
      var IsNull: LongBool); overload; override;
    ///<summary>Sets the param value to null.</summary>
    procedure SetNull(DbxValue: TDBXValue); override;
    ///<summary>Sets the param value to the UnicodeString Value.</summary>
    procedure SetWideString(DbxValue: TDBXWideStringValue;
      const Value: UnicodeString); override;
    ///<summary>Sets the param value to the Boolean Value.</summary>
    procedure SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean); override;
    ///<summary>Sets the param value to the Byte Value.</summary>
    procedure SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte); override;
    ///<summary>Sets the param value to the ShortInt Value.</summary>
    procedure SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt); override;
    ///<summary>Sets the param value to the Word Value.</summary>
    procedure SetUInt16(DbxValue: TDBXUInt16Value; Value: Word); override;
    ///<summary>Sets the param value to the SmallInt Value.</summary>
    procedure SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt); override;
    ///<summary>Sets the param value to the Integer Value.</summary>
    procedure SetInt32(DbxValue: TDBXInt32Value; Value: TInt32); override;
    ///<summary>Sets the param value to the Int64 Value.</summary>
    procedure SetInt64(DbxValue: TDBXInt64Value; Value: Int64); override;
    ///<summary>Sets the param value to the Single Value.</summary>
    procedure SetSingle(DbxValue: TDBXSingleValue; Value: Single); override;
    ///<summary>Sets the param value to the Double Value.</summary>
    procedure SetDouble(DbxValue: TDBXDoubleValue; Value: Double); override;
    ///<summary>Sets the param value to the AnsiString Value.</summary>
    procedure SetAnsiString(DbxValue: TDBXAnsiStringValue;
      const Value: AnsiString); override;
    ///<summary>Sets the param value to the AnsiString Value.</summary>
    procedure SetString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString); override;
    ///<summary>Sets the param value to the TDBXDate Value.</summary>
    procedure SetDate(DbxValue: TDBXDateValue; Value: TDBXDate); override;
    ///<summary>Sets the param value to the TDBXTime Value.</summary>
    procedure SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime); override;
    ///<summary>Sets the param value to the TBcd Value.</summary>
    procedure SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd); override;
    ///<summary>Sets the param value to the TSQLTimeStamp Value unless the DataType
    ///  of the DbxValue is TDBXDataTypes.DateTimeType.  In that case, the field value
    ///  is set to a TDateTime after converting Value.
    ///</summary>
    procedure SetTimestamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp); override;
    ///<summary>Sets the param value to the TSQLTimeStampOffset Value unless the DataType
    ///  of the DbxValue is TDBXDataTypes.DateTimeType.  In that case, the param value
    ///  is set to a TDateTime after converting Value.
    ///</summary>
    procedure SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue;
      var Value: TSQLTimeStampOffset); override;
    ///<summary>Sets the param value to the TDBXStreamReader Value.</summary>
    procedure SetStream(DbxValue: TDBXStreamValue;
      StreamReader: TDBXStreamReader); override;
    procedure ValueSet(Value: TDBXWritableValue); override;
  end;

  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXMemoryTable = class(TDBXTable)
  private
    FIndex: Integer;
    FOrderByColumn: Integer;
    FName: string;
    FValueTypes: TDBXValueTypeArray;
    FValueRows: TList<TDBXWritableValueArray>;

    function CreateWritableValueArray: TDBXWritableValueArray;
    procedure ClearValues(AValues: TDBXWritableValueArray);
    procedure ClearValueTypes(AValueTypes: TDBXValueTypeArray);

  protected
    function GetTableCount: Integer; override;
    procedure OrderByColumn(Column: Integer); virtual;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Insert; override;
    procedure Post; override;
    function InBounds: Boolean; override;
    function Next: Boolean; override;
    function First: Boolean; override;
    procedure SetColumns(const Columns: TDBXValueTypeArray); override;
    function GetColumns: TDBXValueTypeArray; override;
    procedure SetDBXTableName(const AName: UnicodeString); override;
    function GetDBXTableName: string; override;
    procedure AcceptChanges; override;
    function CreateTableView(const OrderByColumnName: UnicodeString): TDBXTable; override;
    ///<summary>Checks whether the string key Value is in the Ordinal column.</summary>
    ///<returns>True if the string key is found and False otherwise</returns>
    function FindStringKey(const Ordinal: Integer; const Value: UnicodeString): Boolean; override;
  end;

  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXDBTable = class(TDBXRowTable)
  private
    FCollectionName: UnicodeString;
    FValueTypes: TDBXValueTypeArray;
    ///<summary> TFieldType to DBX type mapper</summary>
    class function ToDataType(FieldType: TFieldType): Integer; static;
    ///<summary> TFieldType to DBX subtype mapper</summary>
    class function ToDataSubType(FieldType: TFieldType): Integer; static;
    class function ToFieldType(ValueType: TDBXValueType): TFieldType; static;
    class function ToDBXParameterDirection(ParameterType: TParamType): Integer; static;
    class function ToParameterType(ParameterDirection: Integer): TParamType; static;
    procedure FreeValueTypes;
  protected
    procedure SetDBXTableName(const CollectionName: UnicodeString); override;
    function GetDBXTableName: UnicodeString; override;
  end;

  ///<summary>
  ///  <c>TDBXTable</c> implementation for TParams object used by <c>TDBXParamsReader</c>.
  ///</summary>
  TDBXParamsTable = class(TDBXDBTable)
  private
    FParams:        TParams;
    FAtEnd:         Boolean;
    FInstanceOwner: Boolean;

    class procedure CopyValueTypes(const ValueTypes: TDBXValueTypeArray; const Params: TParams); static;
    class procedure CopyValueType(Ordinal: Integer; ValueType: TDBXValueType; Param: TParam); static;

  protected
    function GetColumns: TDBXValueTypeArray; override;
    procedure SetColumns(const Columns: TDBXValueTypeArray); override;
    function GetStorage: TObject; override;

  public
    constructor Create(); overload;

    constructor Create(Params: TParams; InstanceOwner: Boolean = true); overload;
    destructor Destroy; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    procedure Close; override;
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
  end;


  ///<summary>
  ///  <c>TDBXReader</c> implementation for <c>TParams</c> object.
  ///</summary>
  TDBXParamsReader = class(TDBXTableReader)
  public
    /// <summary>
    /// Creates a <c>TDBXReader</c> for a <c>TParams</c> instance.  If
    /// <c>InstanceOwner</c> is true, the <c>TParams</c> instance will be
    /// freed when this <c>TDBXParamsReader</c> instance is freed.
    /// </summary>
    constructor Create(Params: TParams; InstanceOwner: Boolean = true);
    /// <summary>
    /// Copies the contents of the current <c>Reader</c> row into the <c>Params</c>
    /// instance.
    /// </summary>
    class procedure CopyReaderToParams(Reader: TDBXReader; Params: TParams); static;
    /// <summary>
    /// Copies the contents of the current <c>Reader</c> row into a new <c>TParams</c>
    /// instance.  The new <c>TParams</c> instance will constructed with the
    /// <c>AOwner</c> instance as its owner.
    /// </summary>
    class function ToParams(AOwner: TPersistent; Reader: TDBXReader;
      AOwnsInstance: Boolean): TParams; static;
    destructor Destroy; override;
  end;

  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXDataSetRow = class(TDBXRow)
  private
    FTable:  TDataset;
    function EnsureEditState: Boolean;
  public
    constructor Create(Table: TDataset);
    ///<summary>Returns a TDBXWideStringBuiler from the row in the WideStringBuilder
    ///  parameter or sets IsNull to true.</summary>
    procedure GetWideString(DbxValue: TDBXWideStringValue;
      var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool); override;
    ///<summary>Returns a LongBool from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool;
      var IsNull: LongBool); override;
    ///<summary>Returns a Byte from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
      var IsNull: LongBool); override;
    ///<summary>Returns a ShortInt from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
      var IsNull: LongBool); override;
    ///<summary>Returns a Word from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
      var IsNull: LongBool); override;
    ///<summary>Returns a SmallInt from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
      var IsNull: LongBool); override;
    ///<summary>Returns an Integer from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
      var IsNull: LongBool); override;
    ///<summary>Returns an Int64 from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
      var IsNull: LongBool); override;
    ///<summary>Returns a Single from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
      var IsNull: LongBool); override;
    ///<summary>Returns a Double from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetDouble(DbxValue: TDBXDoubleValue; var Value: Double;
      var IsNull: LongBool); override;
    ///<summary>Returns a PAnsiChar from the row in the AnsiStringBuilder parameter
    ///  or sets IsNull to true.</summary>
    procedure GetAnsiString(DbxValue: TDBXAnsiStringValue;
      var AnsiStringBuilder: PAnsiChar; var IsNull: LongBool); override;
    ///<summary>Returns a TDBXDate from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate;
      var IsNull: LongBool); override;
    ///<summary>Returns a TDBXTime from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime;
      var IsNull: LongBool); override;
    ///<summary>Returns a TSQLTimeStamp from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTimeStamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp; var IsNull: LongBool); override;
    ///<summary>Returns a TSQLTimeStampOffset from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
      var Value: TSQLTimeStampOffset; var IsNull: LongBool); override;
    ///<summary>Returns a TBcd from the row in the Value parameter or sets IsNull to true.</summary>
    procedure GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd;
      var IsNull: LongBool); override;
    ///<summary>Returns a TBytes from the row in the Buffer parameter, and the number
    ///  of bytes copied into the Buffer in the ReturnLength parameter or sets IsNull to true.
    ///</summary>
    procedure GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64;
      const Buffer: TBytes; BufferOffset: Int64; Length: Int64;
      var ReturnLength: Int64; var IsNull: LongBool); override;
    ///<summary>Returns the DataSize or the BlobSize from the row in the ByteLength
    ///  parameter or sets IsNull to true.</summary>
    procedure GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64;
      var IsNull: LongBool); override;
    ///<summary>Returns a TStream from the row in the Stream parameter or sets IsNull to true.</summary>
    procedure GetStream(DbxValue: TDBXStreamValue; var Stream: TStream;
      var IsNull: LongBool); overload; override;
    ///<summary>Sets the field value to null.</summary>
    procedure SetNull(DbxValue: TDBXValue); override;
    ///<summary>Sets the field value to the UnicodeString Value.</summary>
    procedure SetWideString(DbxValue: TDBXWideStringValue;
      const Value: UnicodeString); override;
    ///<summary>Sets the field value to the Boolean Value.</summary>
    procedure SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean); override;
    ///<summary>Sets the field value to the Byte Value.</summary>
    procedure SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte); override;
    ///<summary>Sets the field value to the ShortInt Value.</summary>
    procedure SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt); override;
    ///<summary>Sets the field value to the Word Value.</summary>
    procedure SetUInt16(DbxValue: TDBXUInt16Value; Value: Word); override;
    ///<summary>Sets the field value to the SmallInt Value.</summary>
    procedure SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt); override;
    ///<summary>Sets the field value to the Integer Value.</summary>
    procedure SetInt32(DbxValue: TDBXInt32Value; Value: TInt32); override;
    ///<summary>Sets the field value to the Int64 Value.</summary>
    procedure SetInt64(DbxValue: TDBXInt64Value; Value: Int64); override;
    ///<summary>Sets the field value to the Single Value.</summary>
    procedure SetSingle(DbxValue: TDBXSingleValue; Value: Single); override;
    ///<summary>Sets the field value to the Double Value.</summary>
    procedure SetDouble(DbxValue: TDBXDoubleValue; Value: Double); override;
    ///<summary>Sets the field value to AnsiString Value.</summary>
    procedure SetAnsiString(DbxValue: TDBXAnsiStringValue;
      const Value: AnsiString); override;
    ///<summary>Sets the field value to the Value.</summary>
    procedure SetString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString); override;
    ///<summary>Sets the field value to a TDateTime after converting Value.</summary>
    procedure SetDate(DbxValue: TDBXDateValue; Value: TDBXDate); override;
    ///<summary>Sets the field value to a TDateTime after converting Value.</summary>
    procedure SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime); override;
    ///<summary>Sets the field value to the TBcd Value.</summary>
    procedure SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd); override;
    ///<summary>Sets the field value to the TSQLTimeStamp Value unless the DataType
    ///  of the DbxValue is TDBXDataTypes.DateTimeType.  In that case, the field value
    ///  is set to a TDateTime after converting Value.
    ///</summary>
    procedure SetTimestamp(DbxValue: TDBXTimeStampValue;
      var Value: TSQLTimeStamp); override;
    ///<summary>Sets the field value to the TSQLTimeStampOffset Value unless the DataType
    ///  of the DbxValue is TDBXDataTypes.DateTimeType.  In that case, the field value
    ///  is set to a TDateTime after converting Value.
    ///</summary>
    procedure SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue;
      var Value: TSQLTimeStampOffset); override;
    procedure ValueSet(Value: TDBXWritableValue); override;

  end;

  ///<summary>
  ///  <c>TDBXTable</c> implementation for TParams object used by <c>TDBXParamsReader</c>.
  ///</summary>
  TDBXDataSetTable = class(TDBXDBTable)
  private
    FOwnsTable: Boolean;
    FTable: TDataset;
    FOriginal: TDBXOriginalRow;

    procedure SkipOriginalRow; virtual;
    constructor Create(const CollectionName: UnicodeString; Table: TDataset;
      OwnsTable: Boolean; ValuesNeedCreate: Boolean); overload;

  protected
    procedure SetDBXTableName(const CollectionName: UnicodeString); override;
    function GetDBXTableName: UnicodeString; override;
    function GetColumns: TDBXValueTypeArray; override;
    function GetStorage: TObject; override;
    function GetDataSize(FieldDef: TFieldDef; Field: TField): Integer;

  public
    constructor Create(Dataset: TDataset; InstanceOwner: Boolean = true); overload;
    destructor Destroy; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    procedure Insert; override;
    procedure Post; override;
    procedure DeleteRow; override;
    procedure Close; override;
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
    procedure FailIfRowIsNew;
    procedure CopyValueTypeProperties(FieldDef: TFieldDef;
      ValueType: TDBXValueType; Ordinal: Integer);
  end;

  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXClientDataSetTable = class(TDBXDataSetTable)
  private
    FClientDataset: TClientDataSet;
    constructor Create(const CollectionName: UnicodeString;
      TableColumns: TDBXValueTypeArray; Table: TClientDataSet;
      OwnsTable: Boolean = true); overload;
    procedure SkipOriginalRow; override;
  protected
    function GetDeletedRows: TDBXTable; override;
    function GetInsertedRows: TDBXTable; override;
    function GetUpdatedRows: TDBXTable; override;
    function GetOriginalRow: TDBXTableRow; override;
  public
    constructor Create; overload;
    constructor Create(ClientDataSet: TClientDataSet; OwnsTable: Boolean); overload;
    procedure AcceptChanges; override;
    procedure Clear; override;
    function CreateTableView(const OrderByColumnName: UnicodeString): TDBXTable; override;
    function FindStringKey(const Ordinal: Integer; const Value: UnicodeString): Boolean; override;
    procedure SetColumns(const Columns: TDBXValueTypeArray); override;
  end;

  ///<summary>
  ///  <c>TDBXReader</c> implementation for <c>TDataSet</c> object.
  ///</summary>
  TDBXDataSetReader = class(TDBXTableReader)
  public
    /// <summary>
    /// Creates a <c>TDBXReader</c> for a <c>TDataSet</c> instance.  If
    /// <c>InstanceOwner</c> is true, the <c>TDataSet</c> instance will be
    /// freed when this <c>TDBXDataSetReader</c> instance is freed.
    /// </summary>
    constructor Create(Params: TDataset; InstanceOwner: Boolean = true);
    /// <summary>
    /// Copies the contents of <c>Reader</c> into the <c>TDataSet</c>
    /// instance.
    /// </summary>
    /// <returns>
    /// The same <c>DataSet</c> instance that was passed into this method.
    /// </returns>
    class procedure CopyReaderToClientDataSet(Reader: TDBXReader;
      Dataset: TClientDataSet); static;
    class function ToClientDataSet(AOwner: TComponent; Reader: TDBXReader;
      AOwnsInstance: Boolean): TClientDataSet; static;
    destructor Destroy; override;
  end;

  ///<summary>
  ///  This is not used directly by applications.
  ///</summary>
  TDBXOriginalRow = class(TDBXDBTable)
  private
    FAtEnd: Boolean;
    FClonedTable: TDBXClientDataSetTable;
    FClientTable: TDBXClientDataSetTable;
  protected
    function GetWritableValue(const Ordinal: TInt32): TDBXWritableValue; override;
  public
    constructor Create(ClientTable: TDBXClientDataSetTable);
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    function GetColumns: TDBXValueTypeArray; override;
  end;


implementation

uses
  System.Variants,
  System.Generics.Defaults,
  Data.DBXCommonResStrs
;

type
  TDBXDataSetRowExt = class(TDBXDataSetRow)
  protected
      procedure SetDynamicBytes( DbxValue:     TDBXValue;
                          Offset:       Int64;
                          const Buffer: TBytes;
                          BufferOffset: Int64;
                          Length:       Int64); override;
  end;

  TDBXWritableValueArrayComparer = class(TInterfacedObject, IComparer<TDBXWritableValueArray>)
  private
    FColumnIndex: Integer;
  public
    constructor Create(AColumnIndex: Integer);
    function Compare(const Left, Right: TDBXWritableValueArray): Integer; overload;

    property ColumnIndex: Integer read FColumnIndex;
  end;

  { TDBXDataSetTable }

constructor TDBXDataSetTable.Create(const CollectionName: UnicodeString; Table: TDataSet; OwnsTable: Boolean; ValuesNeedCreate: Boolean);
begin
  Inherited Create(nil, TDBXDataSetRowExt.Create(Table));
  FTable := Table;
  FCollectionName := CollectionName;
  FOwnsTable := OwnsTable;
  if ValuesNeedCreate then
    CreateValues;
end;

destructor TDBXDataSetTable.Destroy;
begin
  FreeAndNil(FOriginal);
  if FOwnsTable then
    FreeAndNil(FTable);
  FreeValueTypes;
  inherited Destroy;
end;

function TDBXDataSetTable.First;
begin
  RowNavigated;
  // Some implementations don't support this.
  //
  if FTable.IsUniDirectional then
    Result := True
  else
  begin
    FTable.First;
    SkipOriginalRow;
    Result := FTable.RecordCount > 0;
  end;
end;

function TDBXDataSetTable.Next: Boolean;
begin
  FailIfRowIsNew();
  FTable.Next;
  SkipOriginalRow;
  RowNavigated;
  Result := not FTable.Eof;
end;

function TDBXDataSetTable.InBounds: Boolean;
begin
  FailIfRowIsNew();
  Result := not FTable.Eof and (FTable.RecordCount > 0);
//  if Result and FTable.Bof then
//    FTable.Next;
end;

procedure TDBXDataSetTable.Insert;
begin
  FailIfRowIsNew();
  FTable.Append;
end;

procedure TDBXDataSetTable.Post;
begin
  if FTable.State <> dsInsert then
    raise TDBXError.Create(SInsertNotCalled);
  FTable.Post;
end;

procedure TDBXDataSetTable.DeleteRow;
begin
  if FTable.State = dsInsert then
    FTable.Cancel
  else
    FTable.Delete;
end;

procedure TDBXDataSetTable.Close;
begin
  Clear;
end;

function TDBXDataSetTable.GetOrdinal(const ColumnName: UnicodeString): Integer;
var
  FieldDef: TFieldDef;
begin
  FieldDef := FTable.FieldDefs.Find(ColumnName);
  Result := FieldDef.FieldNo - 1;
end;

procedure TDBXClientDataSetTable.AcceptChanges;
begin
  FailIfRowIsNew();
  FClientDataSet.MergeChangeLog;
end;

procedure TDBXClientDataSetTable.Clear;
begin
  if (FClientDataSet.State in dsEditModes) then
    FClientDataSet.Post;
  if      not (usModified in FClientDataSet.StatusFilter)
      and not (usDeleted in FClientDataSet.StatusFilter)
      and not (usInserted in FClientDataSet.StatusFilter) then
    FClientDataSet.EmptyDataSet;
end;

function TDBXClientDataSetTable.CreateTableView(const OrderByColumnName: UnicodeString): TDBXTable;
var
  View: TClientDataSet;
begin
  View := TClientDataSet.Create(nil);
  View.CloneCursor(FClientDataSet,True);
  if not StringIsNil(OrderByColumnName) then
    View.IndexFieldNames := OrderByColumnName;
  Result := TDBXClientDataSetTable.Create(FCollectionName, CopyColumns, View);
end;

function TDBXClientDataSetTable.FindStringKey(const Ordinal: Integer; const Value: UnicodeString): Boolean;
var
  ColumnName: UnicodeString;
begin
  ColumnName := FClientDataSet.FieldDefs[Ordinal].Name;
  if FClientDataSet.IndexFieldNames <> ColumnName then
    FClientDataSet.IndexFieldNames := ColumnName;
  Result := FClientDataSet.FindKey([Value]);
end;

function TDBXDataSetTable.GetDataSize(FieldDef: TFieldDef;
  Field: TField): Integer;
begin
  case FieldDef.DataType of
    ftVarBytes:
      Result := Field.DataSize - sizeof(Word);
  else
    if Field is TBlobField then
      Result := (Field as TBlobField).BlobSize
    else
      Result := Field.DataSize;
  end;
end;

function TDBXDataSetTable.GetDBXTableName: UnicodeString;
begin
  Result := FCollectionName;
end;

procedure TDBXDataSetTable.SetDBXTableName(const CollectionName: UnicodeString);
begin
  FCollectionName := CollectionName;
end;

procedure TDBXDataSetTable.SkipOriginalRow;
begin

end;

procedure TDBXClientDataSetTable.SkipOriginalRow;
begin
  if (usModified in FClientDataSet.StatusFilter) and (FClientDataSet.UpdateStatus = usUnmodified) then
    FClientDataSet.Next;
end;

function TDBXDataSetTable.GetColumns: TDBXValueTypeArray;
var
  Ordinal:        Integer;
  FieldDef:       TFieldDef;
  ValueType:      TDBXValueType;
  Field:          TField;
begin
  if FValueTypes = nil then
  begin
    SetLength(FValueTypes, FTable.FieldDefs.Count);
    for Ordinal := Low(FValueTypes) to High(FValueTypes) do
    begin
      FieldDef                := FTable.FieldDefs[Ordinal];
      Field                   := FTable.Fields[Ordinal];
      ValueType               := TDBXValueType.Create;
      ValueType.Name          := FieldDef.Name;
      ValueType.DisplayName   := FieldDef.DisplayName;
      ValueType.DataType      := ToDataType(FieldDef.DataType);
      ValueType.SubType       := ToDataSubType(FieldDef.DataType);
      ValueType.Size          := GetDataSize(FieldDef, Field);
      ValueType.Precision     := FieldDef.Precision;
      if ValueType.Precision = 0 then
        case ValueType.DataType of
        TDBXDataTypes.WideStringType, TDBXDataTypes.BlobType:
          ValueType.Precision := ValueType.Size;
        end;
      ValueType.Scale         := FieldDef.Size;
      FValueTypes[Ordinal]    := ValueType;
    end;
  end;
  Result := FValueTypes;
end;

procedure TDBXClientDataSetTable.SetColumns(const Columns: TDBXValueTypeArray);
var
  Ordinal: Integer;
begin
  FreeValueTypes;
  FValueTypes := Columns;
  if FClientDataSet <> nil then
  begin
    FClientDataSet.Close;
    for Ordinal := Low(Columns) to High(Columns) do
    begin
      if Ordinal >= FClientDataSet.FieldDefs.Count then
        CopyValueTypeProperties(FClientDataSet.FieldDefs.AddFieldDef, Columns[Ordinal], Ordinal)
      else if not (FClientDataSet.FieldDefs[Ordinal].Name = Columns[Ordinal].Name) then
        raise TDBXError.Create(SMustKeepOriginalColumnOrder);
    end;
    FClientDataSet.CreateDataSet;

  end;
  CreateValues;
end;

function TDBXClientDataSetTable.GetDeletedRows: TDBXTable;
var
  View: TClientDataSet;
begin
  View := TClientDataSet.Create(nil);
  View.CloneCursor(FClientDataSet,True);
  View.StatusFilter := [usDeleted];
  View.Filtered := True;
  Result := TDBXClientDataSetTable.Create(FCollectionName, CopyColumns, View);
  Result.First;
end;

function TDBXClientDataSetTable.GetInsertedRows: TDBXTable;
var
  View: TClientDataSet;
begin
  View := TClientDataSet.Create(nil);
  View.CloneCursor(FClientDataSet,True);
  View.StatusFilter := [usInserted];
  View.Filtered := True;
  Result := TDBXClientDataSetTable.Create(FCollectionName, CopyColumns, View);
  Result.First;
end;

function TDBXClientDataSetTable.GetUpdatedRows: TDBXTable;
var
  View: TClientDataSet;
begin
  View := TClientDataSet.Create(nil);
  View.CloneCursor(FClientDataSet, False, False);
  View.StatusFilter := [usModified];
  View.Filtered := True;
  Result := TDBXClientDataSetTable.Create(FCollectionName, CopyColumns, View);
  Result.First;
end;

function TDBXClientDataSetTable.GetOriginalRow: TDBXTableRow;
begin
  if FOriginal = nil then
    FOriginal := TDBXOriginalRow.Create(self);
  if FClientDataSet.UpdateStatus = usInserted then
    Result := nil
  else
    Result := FOriginal;
end;

function TDBXDataSetTable.GetStorage: TObject;
begin
  Result := FTable;
end;

procedure TDBXDataSetTable.FailIfRowIsNew;
begin
  if FTable.State = dsInsert then
    raise TDBXError.Create(SPostNotCalled);
end;

procedure TDBXDataSetTable.CopyValueTypeProperties(FieldDef: TFieldDef; ValueType: TDBXValueType; Ordinal: Integer);
begin
  FieldDef.Name := ValueType.Name;
  FieldDef.DisplayName := ValueType.DisplayName;
  FieldDef.DataType := ToFieldType(ValueType);
  FieldDef.FieldNo := Ordinal;
  if (ValueType.DataType = TDBXDataTypes.WideStringType) or (ValueType.DataType = TDBXDataTypes.AnsiStringType) then
  begin
    if ValueType.Size <= 0 then
      FieldDef.Size := 128 // default size (make constant)
    else
      FieldDef.Size := ValueType.Size;
  end;

// Don't set the size. It is error prone and not neccessary:
//  FieldDef.Size := Descriptor.DataSize;
// Don't set the hidden attribute. Field access is forbidden to hidden fields !!
//  if Descriptor.Hidden then
//    FieldDef.Attributes := FieldDef.Attributes + [faHiddenCol];
end;

constructor TDBXDataSetTable.Create(Dataset: TDataSet; InstanceOwner: Boolean);
begin
  Create('', DataSet, InstanceOwner, true);
end;

{ TDBXOriginalRow }

constructor TDBXOriginalRow.Create(ClientTable: TDBXClientDataSetTable);
var
  ClientDataSet: TClientDataSet;
begin
  ClientDataSet := TClientDataSet.Create(nil);
  ClientDataSet.CloneCursor(ClientTable.FClientDataSet, True);
  ClientDataSet.StatusFilter := [usModified];
  FClonedTable := TDBXClientDataSetTable.Create(ClientTable.FCollectionName, ClientTable.CopyColumns, ClientDataSet);
  inherited Create(nil, TDBXDataSetRowExt.Create(ClientDataSet));
  FClientTable := ClientTable;
end;

function TDBXOriginalRow.First: Boolean;
begin
  FAtEnd := false;
  Result := true;
end;

function TDBXOriginalRow.GetColumns: TDBXValueTypeArray;
begin
  Result := FClientTable.GetColumns;
end;

function TDBXOriginalRow.GetOrdinal(const ColumnName: UnicodeString): Integer;
begin
  Result := FClientTable.GetOrdinal(ColumnName);
end;


function TDBXOriginalRow.GetWritableValue(
  const Ordinal: TInt32): TDBXWritableValue;
var
  TargetRecNo: Integer;
begin
  if FClientTable.FTable.UpdateStatus in [usDeleted, usUnmodified] then
    Result := FClientTable.GetWritableValue(Ordinal)
  else if FClientTable.FTable.UpdateStatus = usModified then
  begin
    if usModified in FClientTable.FClientDataset.StatusFilter then
      TargetRecNo := FClientTable.FTable.RecNo - 1
    else
      TargetRecNo := (FClientTable.FTable.RecNo * 2) - 1;
    if FClonedTable.FTable.RecNo <> TargetRecNo then
    begin
      FClonedTable.FTable.MoveBy(TargetRecNo - FClonedTable.FTable.RecNo);
      FClonedTable.RowNavigated;
    end;
    Result := FClonedTable.GetWritableValue(Ordinal);
  end
  else
    Result := nil;
end;

function TDBXOriginalRow.InBounds: Boolean;
begin
  Result := not FAtEnd;
end;

function TDBXOriginalRow.Next: Boolean;
begin
  if FAtEnd then
    Result := false
  else
  begin
    FAtEnd := true;
    Result := true;
  end;
end;

{ TDBXDataSetRow }

constructor TDBXDataSetRow.Create(Table: TDataSet);
begin
  inherited Create(nil);
  FTable := Table;
end;

procedure TDBXDataSetRow.GetBoolean(DbxValue: TDBXBooleanValue;
  var Value, IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.AsBoolean;
end;

procedure TDBXDataSetRow.GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.AsInteger;
end;

procedure TDBXDataSetRow.GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetDouble(DbxValue: TDBXDoubleValue; var Value: Double; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetWideString(DbxValue: TDBXWideStringValue;
  var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool);
var
  Field: TField;
  Value: UnicodeString;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
  begin
    Value := Field.AsWideString;
    TDBXPlatform.CopyWideStringToBuilder(Value, Length(Value)+1, WideStringBuilder);
  end;

end;

procedure TDBXDataSetRow.GetAnsiString(DbxValue: TDBXAnsiStringValue; var AnsiStringBuilder: PAnsiChar; var IsNull: LongBool);
var
  Field: TField;
  Value: AnsiString;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
  begin
    Value := Field.AsAnsiString;
    TDBXPlatform.CopyStringToBuilder(Value, Length(Value)+1, AnsiStringBuilder);
  end;
end;

procedure TDBXDataSetRow.GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := DateTimeToTimeStamp(Field.AsDateTime).Date;
end;

procedure TDBXDataSetRow.GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := DateTimeToTimeStamp(Field.AsDateTime).Time;
end;

procedure TDBXDataSetRow.GetTimeStamp(DbxValue: TDBXTimeStampValue; var Value: TSQLTimeStamp; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.AsSQLTimeStamp;
end;

procedure TDBXDataSetRow.GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.AsSQLTimeStampOffset;
end;

procedure TDBXDataSetRow.GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.AsBCD;
end;

procedure TDBXDataSetRow.GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64; const Buffer: TBytes; BufferOffset: Int64; Length: Int64; var ReturnLength: Int64; var IsNull: LongBool);
var
  Field: TField;
  DataSize: Integer;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
  begin
    if Field is TBlobField then
      DataSize := (Field as TBlobField).BlobSize
    else
      DataSize := Field.DataSize;
    if Length + BufferOffset > DataSize then
      ReturnLength := DataSize - BufferOffset
    else
      ReturnLength := Length;

    Move(Field.AsBytes[0], Buffer[BufferOffset], ReturnLength);
  end;
end;

procedure TDBXDataSetRow.GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64; var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    if Field is TBlobField then
      ByteLength := (Field as TBlobField).BlobSize
    else
      ByteLength := Field.DataSize;
end;

procedure TDBXDataSetRow.GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
  var IsNull: LongBool);
var
  Field: TField;
begin
  Field := FTable.Fields[DbxValue.ValueType.Ordinal];
  IsNull := Field.IsNull;
  if not IsNull then
    Value := Field.Value;
end;

procedure TDBXDataSetRow.GetStream(DbxValue: TDBXStreamValue;
  var Stream: TStream; var IsNull: LongBool);
var
  ByteLength: Int64;
  Bytes: TBytes;
  ReturnLength: Int64;
begin
  GetByteLength(DbxValue, ByteLength, IsNull);
  if not IsNull then
  begin
    SetLength(Bytes, Integer(ByteLength));
    GetBytes(DbxValue, 0, Bytes, 0, Integer(ByteLength), ReturnLength, IsNull);
    Stream := TBytesStream.Create(Bytes);
  end;
end;

procedure TDBXDataSetRow.SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetInt32(DbxValue: TDBXInt32Value; Value: TInt32);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetInt64(DbxValue: TDBXInt64Value; Value: Int64);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetDouble(DbxValue: TDBXDoubleValue; Value: Double);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetNull(DbxValue: TDBXValue);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Null;
end;

procedure TDBXDataSetRow.SetSingle(DbxValue: TDBXSingleValue; Value: Single);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetString(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetWideString(DbxValue: TDBXWideStringValue;
  const Value: UnicodeString);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetAnsiString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetDate(DbxValue: TDBXDateValue; Value: TDBXDate);
var
  TimeStamp: TTimeStamp;
begin
  TimeStamp.Date := Value;
  TimeStamp.Time := 0;
  EnsureEditState;
  FTable.Fields[DBXValue.ValueType.Ordinal].AsDateTime := TimeStampToDateTime(TimeStamp);
end;

procedure TDBXDataSetRow.SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime);
var
  TimeStamp: TTimeStamp;
begin
  TimeStamp.Date := DateDelta;
  TimeStamp.Time := Value;
  EnsureEditState;
  FTable.Fields[DBXValue.ValueType.Ordinal].AsDateTime := TimeStampToDateTime(TimeStamp);
end;

procedure TDBXDataSetRow.SetTimestamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp);
begin
  EnsureEditState;
  if DbxValue.ValueType.DataType = TDBXDataTypes.DateTimeType then
    FTable.Fields[DBXValue.ValueType.Ordinal].AsDateTime := SQLTimeStampToDateTime(Value)
  else
    FTable.Fields[DbxValue.ValueType.Ordinal].AsSQLTimeStamp := Value;
end;

procedure TDBXDataSetRow.SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset);
begin
  EnsureEditState;
  if DbxValue.ValueType.DataType = TDBXDataTypes.DateTimeType then
    FTable.Fields[DBXValue.ValueType.Ordinal].AsDateTime := SQLTimeStampOffsetToDateTime(Value)
  else
    FTable.Fields[DbxValue.ValueType.Ordinal].AsSQLTimeStampOffset := Value;
end;

procedure TDBXDataSetRow.SetUInt16(DbxValue: TDBXUInt16Value; Value: Word);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXDataSetRow.SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd);
begin
  EnsureEditState;
  FTable.Fields[DbxValue.ValueType.Ordinal].AsBCD := Value;
end;

procedure TDBXDataSetRow.ValueSet(Value: TDBXWritableValue);
begin
  TDBXDriverHelp.SetPendingValue(Value);
end;

function TDBXDataSetRow.EnsureEditState: Boolean;
begin
  Result := False;
  if not(FTable.State in dsEditModes) then
  begin
    FTable.Edit;
    Result := True;
  end;
end;

constructor TDBXParamsRow.Create(Params: TParams);
begin
  inherited Create(nil);
  FParams := Params;
end;

function TDBXParamsRow.CreateCustomValue(const ValueType: TDBXValueType): TDBXValue;
begin
  Result := nil;
  case ValueType.DataType of
    TDBXDataTypes.WideStringType:
      Result := TDBXStringValue.Create(ValueType);
//    TDBXDataTypes.AnsiStringType:
//      Result := TDBXAnsiCharsValue.Create(ValueType);
    TDBXDataTypes.BlobType:
      case ValueType.SubType of
        TDBXDataTypes.HMemoSubType,
        TDBXDataTypes.MemoSubType,
        TDBXDataTypes.WideMemoSubType:
          Result := TDBXStringValue.Create(ValueType);
      end;
  end;
end;

procedure TDBXParamsRow.GetBoolean(DbxValue: TDBXBooleanValue;
  var Value, IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsBoolean;
end;

procedure TDBXParamsRow.GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsInteger;
end;

procedure TDBXParamsRow.GetInt64(DbxValue: TDBXInt64Value; var Value: Int64;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetSingle(DbxValue: TDBXSingleValue; var Value: Single;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetStream(DbxValue: TDBXStreamValue;
  var Stream: TStream; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
  begin
    Stream := Param.AsStream;
    // release ownership.  Row implementations should not
    // maintain ownership of objects.
    //
    Param.SetStream(Stream, False);
  end;
end;

procedure TDBXParamsRow.GetDouble(DbxValue: TDBXDoubleValue; var Value: Double;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetWideString(DbxValue: TDBXWideStringValue;
  var Value: UnicodeString; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsWideString
  else
    Value := '';
end;

procedure TDBXParamsRow.GetAnsiString(DbxValue: TDBXAnsiStringValue;
  var AnsiStringBuilder: PAnsiChar; var IsNull: LongBool);
var
  Param: TParam;
  Value: AnsiString;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
  begin
    Value := Param.AsAnsiString;
    TDBXPlatform.CopyStringToBuilder(Value, Length(Value)+1, AnsiStringBuilder);
  end;
end;

procedure TDBXParamsRow.GetDate(DbxValue: TDBXDateValue; var Value: TDBXDate; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetTime(DbxValue: TDBXTimeValue; var Value: TDBXTime; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetTimeStamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsSQLTimeStamp;
end;

procedure TDBXParamsRow.GetTimeStampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsSQLTimeStampOffset;
end;

procedure TDBXParamsRow.GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
  var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.Value;
end;

procedure TDBXParamsRow.GetBcd(DbxValue: TDBXBcdValue; var Value: TBcd; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    Value := Param.AsFMTBCD;
end;

procedure TDBXParamsRow.GetBytes(DbxValue: TDBXByteArrayValue; Offset: Int64; const Buffer: TBytes; BufferOffset: Int64; Length: Int64; var ReturnLength: Int64; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
  begin
    if Length + BufferOffset > Param.GetDataSize then
      ReturnLength := Param.GetDataSize - BufferOffset
    else
      ReturnLength := Length;

    Move(Param.AsBytes[0], Buffer[BufferOffset], ReturnLength);
  end;
end;

procedure TDBXParamsRow.GetByteLength(DbxValue: TDBXByteArrayValue; var ByteLength: Int64; var IsNull: LongBool);
var
  Param: TParam;
begin
  Param := FParams[DbxValue.ValueType.Ordinal];
  IsNull := Param.IsNull;
  if not IsNull then
    ByteLength := Param.GetDataSize;
end;

procedure TDBXParamsRow.SetBoolean(DbxValue: TDBXBooleanValue; Value: Boolean);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetInt16(DbxValue: TDBXInt16Value; Value: SmallInt);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetInt32(DbxValue: TDBXInt32Value; Value: TInt32);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetInt64(DbxValue: TDBXInt64Value; Value: Int64);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetInt8(DbxValue: TDBXInt8Value; Value: ShortInt);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetDouble(DbxValue: TDBXDoubleValue; Value: Double);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetNull(DbxValue: TDBXValue);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Null;
end;

procedure TDBXParamsRow.SetSingle(DbxValue: TDBXSingleValue; Value: Single);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetStream(DbxValue: TDBXStreamValue;
  StreamReader: TDBXStreamReader);
var
  MemoryStream: TMemoryStream;
  Buffer: TBytes;
  BytesRead: Integer;
begin
  MemoryStream := TMemoryStream.Create;
  SetLength(Buffer, 512);
  BytesRead := 1;
  while BytesRead > 0 do
  begin
    BytesRead := StreamReader.Read(Buffer, 0, Length(Buffer));
    if BytesRead > 0 then
      MemoryStream.Write(Buffer[0], BytesRead);
  end;
  MemoryStream.Seek(0, soBeginning);
  FParams[DBXValue.ValueType.Ordinal].SetStream(MemoryStream, True, MemoryStream.Size);
end;

procedure TDBXParamsRow.SetString(DbxValue: TDBXAnsiStringValue;
  const Value: AnsiString);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetWideString(DbxValue: TDBXWideStringValue;
  const Value: UnicodeString);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetAnsiString(DbxValue: TDBXAnsiStringValue; const Value: AnsiString);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetDate(DbxValue: TDBXDateValue; Value: TDBXDate);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetTime(DbxValue: TDBXTimeValue; Value: TDBXTime);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetTimestamp(DbxValue: TDBXTimeStampValue;
  var Value: TSQLTimeStamp);
begin
  if DbxValue.ValueType.DataType = TDBXDataTypes.DateTimeType then
    FParams[DBXValue.ValueType.Ordinal].AsDateTime := SQLTimeStampToDateTime(Value)
  else
    FParams[DbxValue.ValueType.Ordinal].AsSQLTimeStamp := Value;
end;

procedure TDBXParamsRow.SetTimestampOffset(DbxValue: TDBXTimeStampOffsetValue;
  var Value: TSQLTimeStampOffset);
begin
  if DbxValue.ValueType.DataType = TDBXDataTypes.DateTimeType then
    FParams[DBXValue.ValueType.Ordinal].AsDateTime := SQLTimeStampOffsetToDateTime(Value)
  else
    FParams[DbxValue.ValueType.Ordinal].AsSQLTimeStampOffset := Value;
end;

procedure TDBXParamsRow.SetUInt16(DbxValue: TDBXUInt16Value; Value: Word);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetUInt8(DbxValue: TDBXUInt8Value; Value: Byte);
begin
  FParams[DbxValue.ValueType.Ordinal].Value := Value;
end;

procedure TDBXParamsRow.SetBCD(DbxValue: TDBXBcdValue; var Value: TBcd);
begin
  FParams[DbxValue.ValueType.Ordinal].AsFMTBCD := Value;
end;

procedure TDBXParamsRow.ValueSet(Value: TDBXWritableValue);
begin
  TDBXDriverHelp.SetPendingValue(Value);
end;

constructor TDBXParamsTable.Create;
begin
  FParams := TParams.Create(nil);
  Inherited Create(nil, TDBXParamsRow.Create(FParams));
end;

constructor TDBXParamsTable.Create(Params: TParams; InstanceOwner: Boolean);
begin
  Inherited Create(nil, TDBXParamsRow.Create(Params));
  FParams := Params;
  FInstanceOwner := InstanceOwner;
  CreateValues;
end;

destructor TDBXParamsTable.Destroy;
begin
  if FInstanceOwner then
    FreeAndNil(FParams);
  FreeValueTypes;
  inherited Destroy;
end;

function TDBXParamsTable.First;
begin
  RowNavigated;
  FAtEnd := False;
  Result := true;
end;

function TDBXParamsTable.Next: Boolean;
begin
    FAtEnd := True;
    Result := False;
//  if FAtEnd then
//    Result := false
//  else
//  begin
//    FAtEnd := true;
//    Result := true;
//  end;
end;

function TDBXParamsTable.InBounds: Boolean;
begin
  Result := not FAtEnd;
end;

procedure TDBXParamsTable.Close;
begin
end;

function TDBXParamsTable.GetOrdinal(const ColumnName: UnicodeString): Integer;
begin
  Result := FParams.ParamByName(ColumnName).Index;
end;

function TDBXParamsTable.GetColumns: TDBXValueTypeArray;
var
  Ordinal: Integer;
  Param: TParam;
  ValueType: TDBXValueType;
begin
  if FValueTypes = nil then
  begin
    SetLength(FValueTypes, FParams.Count);
    for Ordinal := Low(FValueTypes) to High(FValueTypes) do
    begin
      Param := FParams[Ordinal];
      ValueType := TDBXValueType.Create(DBXContext);
      ValueType.Name                := Param.Name;
      ValueType.DisplayName         := Param.DisplayName;
      ValueType.DataType            := ToDataType(Param.DataType);
      ValueType.SubType             := ToDataSubType(Param.DataType);
      ValueType.Precision           := Param.Precision;
      ValueType.Scale               := Param.NumericScale;
      ValueType.Size                := Param.GetDataSize;
      ValueType.ParameterDirection  := ToDBXParameterDirection(Param.ParamType);
      FValueTypes[Ordinal]          := ValueType;
    end;
  end;
  Result := FValueTypes;
end;

procedure TDBXParamsTable.SetColumns(const Columns: TDBXValueTypeArray);
begin
  FreeValueTypes;
  FValueTypes := Columns;
  if FParams <> nil then
    CopyValueTypes(Columns, FParams);
end;

class procedure TDBXParamsTable.CopyValueTypes(const ValueTypes: TDBXValueTypeArray; const Params: TParams);
var
  Ordinal: Integer;
begin
  Params.Clear;
  for Ordinal := Low(ValueTypes) to High(ValueTypes) do
  begin
    if Ordinal >= Params.Count then
      CopyValueType(Ordinal, ValueTypes[Ordinal], Params[Ordinal])
    else if not(Params[Ordinal].Name = ValueTypes[Ordinal].Name) then
      raise TDBXError.Create(SMustKeepOriginalColumnOrder);
  end;
end;

function TDBXParamsTable.GetStorage: TObject;
begin
  Result := FParams;
end;


class procedure TDBXParamsTable.CopyValueType(Ordinal: Integer; ValueType: TDBXValueType; Param: TParam);
begin
  Param.Name          := ValueType.Name;
  Param.DisplayName   := ValueType.DisplayName;
  Param.DataType      := ToFieldType(ValueType);
  Param.ParamType     := ToParameterType(ValueType.ParameterDirection);
  Param.Precision     := ValueType.Precision;
  Param.NumericScale  := ValueType.Scale;
  Param.Size          := ValueType.Size;
//  if ValueType.DataType = TDBXDataTypes.WideStringType then
//  begin
//    if ValueType.Size <= 0 then
//      Param.Size := 128  // default size (make constant)
//    else
//      Param.Size := ValueType.Size;
//  end;
end;

procedure TDBXDBTable.FreeValueTypes;
begin
  ClearValues;
  FValueTypes := nil;
end;

class function TDBXDBTable.ToDataSubType(FieldType: TFieldType): Integer;
begin
  case FieldType of
  ftWideMemo:
    Result := TDBXDataTypes.WideMemoSubType;
  else
    Result := 0;
  end;
end;

class function TDBXDBTable.ToDataType(FieldType: TFieldType): Integer;
begin
  case FieldType of
    ftBoolean:
      Result := TDBXDataTypes.BooleanType;
    ftByte:
      Result := TDBXDataTypes.UInt8Type;
    ftShortint:
      Result := TDBXDataTypes.Int8Type;
    ftSmallInt:
      Result := TDBXDataTypes.Int16Type;
    ftInteger, ftAutoInc:
      Result := TDBXDataTypes.Int32Type;
    ftLargeint:
      Result := TDBXDataTypes.Int64Type;
    ftSingle:
      Result := TDBXDataTypes.SingleType;
    ftFloat:
      Result := TDBXDataTypes.DoubleType;
    ftGuid, ftOraInterval:
      Result := TDBXDataTypes.AnsiStringType;
    ftString, ftFixedChar:
      Result := TDBXDataTypes.AnsiStringType;
    ftWideString, ftFixedWideChar:
      Result := TDBXDataTypes.WideStringType;
    ftMemo, ftWideMemo, ftBlob, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle,
      ftTypedBinary, ftOraBlob, ftOraClob:
      Result := TDBXDataTypes.BlobType;
    ftFMTBcd:
      Result := TDBXDataTypes.BcdType;
    ftBcd:
      Result := TDBXDataTypes.CurrencyType;
    ftBytes:
      Result := TDBXDataTypes.BytesType;
    ftDate:
      Result := TDBXDataTypes.DateType;
    ftTime:
      Result := TDBXDataTypes.TimeType;
    ftTimeStamp, ftOraTimeStamp:
      Result := TDBXDataTypes.TimeStampType;
    ftTimeStampOffset:
      Result := TDBXDataTypes.TimeStampOffsetType;
    ftDateTime:
      Result := TDBXDataTypes.DateTimeType;
    ftStream:
      Result := TDBXDataTypes.BinaryBlobType;
    ftVarBytes:
      Result := TDBXDataTypes.VarBytesType;
    ftWord:
      Result := TDBXDataTypes.UInt16Type;
    ftCurrency:
      Result := TDBXDataTypes.DoubleType; // TDBXDataTypes.CurrencyType;
    ftCursor:
      Result := TDBXDataTypes.CursorType;
    ftADT:
      Result := TDBXDataTypes.AdtType;
    ftArray:
      Result := TDBXDataTypes.ArrayType;
    ftReference:
      Result := TDBXDataTypes.RefType;
    ftDataSet, ftParams:
      Result := TDBXDataTypes.TableType;
    ftVariant:
      Result := TDBXDataTypes.VariantType;
    ftConnection:
      Result := TDBXDataTypes.DBXConnectionType;
    {
      ftDataSet:
      Result := TDBXDataTypes.TableType;
    }
  else
    raise TDBXError.Create(SUnexpectedMetaDataType);
  end;
end;

constructor TDBXClientDataSetTable.Create(const CollectionName: UnicodeString;
  TableColumns: TDBXValueTypeArray; Table: TClientDataSet; OwnsTable: Boolean);
begin
  inherited Create(CollectionName, Table, OwnsTable, False);
  Columns := TableColumns;
  FClientDataset := Table;

end;

constructor TDBXClientDataSetTable.Create;
begin
  Create('', nil, TClientDataSet.Create(nil), true);
end;

constructor TDBXClientDataSetTable.Create(ClientDataSet: TClientDataSet;
  OwnsTable: Boolean);
begin
  Create('', nil, ClientDataSet, OwnsTable);
end;

{ TDBXClientDataSetReader }

class function TDBXDataSetReader.ToClientDataSet(AOwner: TComponent; Reader: TDBXReader; AOwnsInstance: Boolean): TClientDataSet;
begin
  Result := TClientDataSet.Create(AOwner);
  CopyReaderToClientDataSet(Reader, Result);
  if AOwnsInstance then
    Reader.Free;
end;

class procedure TDBXDataSetReader.CopyReaderToClientDataSet(
  Reader: TDBXReader; DataSet: TClientDataSet);
var
  Ordinal:      Integer;
  Table:        TDBXTable;
  ValueTypes:   TDBXValueTypeArray;
  ColumnCount:  Integer;
begin
  ColumnCount := Reader.ColumnCount;
  SetLength(ValueTypes, Reader.ColumnCount);
  for Ordinal := 0 to ColumnCount - 1 do
  begin
    ValueTypes[Ordinal] := Reader.ValueType[Ordinal].WritableClone;
  end;
  Table := TDBXClientDataSetTable.Create('', nil, DataSet, False);
  Table.Columns := ValueTypes;

  try
    while Reader.Next do
    begin
      Table.Insert;
      for Ordinal := 0 to ColumnCount - 1 do
        Table.Value[Ordinal].SetValue(Reader.Value[Ordinal]);
      Table.Post;
    end;
  finally
    Table.Free;
  end;
end;

constructor TDBXDataSetReader.Create(Params: TDataset; InstanceOwner: Boolean);
begin
  if Params is TClientDataSet then
    inherited Create(TDBXClientDataSetTable.Create(Params.Name, nil, TClientDataSet(Params), InstanceOwner))
  else
    inherited Create(TDBXDataSetTable.Create(Params.Name, Params, InstanceOwner, true))
end;

destructor TDBXDataSetReader.Destroy;
begin

  inherited;
end;

{ TDBXParamsReader }

class procedure TDBXParamsReader.CopyReaderToParams(Reader: TDBXReader;
  Params: TParams);
var
  Ordinal: Integer;
  Count: Integer;
  Param: TParam;
  DBXRow: TDBXParamsRow;
begin
  Reader.Next;
  Params.Clear;
  Count := Reader.ColumnCount;
  for Ordinal := 0 to Count - 1 do
  begin
    Param := TParam.Create(Params);
    TDBXParamsTable.CopyValueType(Ordinal, Reader.ValueType[Ordinal], Param);
  end;
  DBXRow := TDBXParamsRow.Create(Params);
  try
    for Ordinal := 0 to Count - 1 do
    begin
      TDBXDriverHelp.CopyRowValue(Reader.Value[Ordinal], DBXRow);
    end;
  finally
    FreeAndNil(DBXRow);
  end;
end;

class function TDBXParamsReader.ToParams(AOwner: TPersistent; Reader: TDBXReader; AOwnsInstance: Boolean): TParams;
begin
  Result := TParams.Create(AOwner);
  CopyReaderToParams(Reader, Result);
  if AOwnsInstance then
    Reader.Free;
end;

constructor TDBXParamsReader.Create(Params: TParams; InstanceOwner: Boolean);
begin
  inherited Create(TDBXParamsTable.Create(Params, InstanceOwner));
end;

destructor TDBXParamsReader.Destroy;
begin

  inherited;
end;

class function TDBXDBTable.ToFieldType(ValueType: TDBXValueType): TFieldType;
begin
  case ValueType.DataType of
    TDBXDataTypes.BooleanType:
      Result := ftBoolean;
    TDBXDataTypes.UInt8Type:
      Result := ftByte;
    TDBXDataTypes.Int8Type:
      Result := ftShortint;
    TDBXDataTypes.Int16Type:
      Result := ftSmallInt;
    TDBXDataTypes.Int32Type:
      Result := ftInteger;
    TDBXDataTypes.Int64Type:
      Result := ftLargeint;
    TDBXDataTypes.SingleType:
      Result := ftSingle;
    TDBXDataTypes.DoubleType:
      Result := ftFloat;
    TDBXDataTypes.WideStringType:
    // Switched back to this because metadata layer cannot create
    // Unicode identifiers without it.  If there ar issues, we need
    // to find the root cause.  TClientDataSet does support Unicode.
    //
    Result := ftWideString;   // All strings are truncated to the empty string (bug!)
//    Result := ftWideMemo;     // Cannot create an index for this column type (needed for keyword search)
//      Result := ftString;       // Cannot hold unicode chars (bad)
    TDBXDataTypes.AnsiStringType:
      Result := ftString;
    TDBXDataTypes.DateType:
      Result := ftDate;
    TDBXDataTypes.TimeStampType:
      Result := ftTimeStamp;
    TDBXDataTypes.TimeStampOffsetType:
      Result := ftTimeStampOffset;
    TDBXDataTypes.BlobType:
      case ValueType.SubType of
      TDBXDataTypes.WideMemoSubType:
        Result := ftWideMemo;
      else
        Result := ftBlob;
      end;
    TDBXDataTypes.BcdType:
      Result := ftFMTBcd;
    TDBXDataTypes.CurrencyType:
      Result := ftCurrency;
    TDBXDataTypes.BytesType:
      Result := ftBytes;
    TDBXDataTypes.TimeType:
      Result := ftTime;
    TDBXDataTypes.BinaryBlobType:
      Result := ftStream;
    TDBXDataTypes.UInt16Type:
      Result := ftWord;
    TDBXDataTypes.CursorType:
      Result := ftCursor;
    TDBXDataTypes.AdtType:
      Result := ftADT;
    TDBXDataTypes.ArrayType:
      Result := ftArray;
    TDBXDataTypes.RefType:
      Result := ftReference;
    TDBXDataTypes.TableType:
      Result := ftDataSet;
    TDBXDataTypes.VariantType:
      Result := ftVariant;
    TDBXDataTypes.VarBytesType:
      Result := ftVarBytes;
    TDBXDataTypes.DBXConnectionType:
      Result := ftConnection;
    TDBXDataTypes.DateTimeType:
      Result := ftDateTime;
  else
    raise TDBXError.Create(SUnexpectedMetaDataType);
  end;

end;

function TDBXDBTable.GetDBXTableName: UnicodeString;
begin
  Result := FCollectionName;
end;

procedure TDBXDBTable.SetDBXTableName(const CollectionName: UnicodeString);
begin
  FCollectionName := CollectionName;
end;

class function TDBXDBTable.ToDBXParameterDirection(ParameterType: TParamType): Integer;
begin
  case ParameterType of
    ptInput:        Result := TDBXParameterDirections.InParameter;
    ptOutput:       Result := TDBXParameterDirections.OutParameter;
    ptInputOutput:  Result := TDBXParameterDirections.InOutParameter;
    ptResult:       Result := TDBXParameterDirections.ReturnParameter;
    else
      Result := TDBXParameterDirections.Unknown;
  end;
end;

class function TDBXDBTable.ToParameterType(ParameterDirection: Integer): TParamType;
begin
  case ParameterDirection of
    TDBXParameterDirections.InParameter:      Result := ptInput;
    TDBXParameterDirections.OutParameter:     Result := ptOutput;
    TDBXParameterDirections.InOutParameter:   Result := ptInputOutput;
    TDBXParameterDirections.ReturnParameter:  Result := ptResult;
    else
      Result := ptUnknown;


  end;

end;

{ TDBXMemoryTable }

procedure TDBXMemoryTable.AcceptChanges;
begin
  // do nothing for memory tables
end;

procedure TDBXMemoryTable.ClearValues(AValues: TDBXWritableValueArray);
var
  Value: TDBXWritableValue;
begin
  for Value in AValues do
    Value.Free;
  SetLength(AValues, 0);
end;

procedure TDBXMemoryTable.ClearValueTypes(AValueTypes: TDBXValueTypeArray);
var
  ValueType: TDBXValueType;
begin
  for ValueType in AValueTypes do
    ValueType.Free;
  SetLength(AValueTypes, 0);
end;

constructor TDBXMemoryTable.Create;
begin
  FValueRows := TList<TDBXWritableValueArray>.Create;
  FIndex := 0;
  FOrderByColumn := -1;
end;

function TDBXMemoryTable.CreateTableView(
  const OrderByColumnName: UnicodeString): TDBXTable;
var
  Column: Integer;
begin
  // get the column index
  Column := ColumnIndex(OrderByColumnName);
  if Column = -1 then
    raise TDBXError.Create(Format(SInvalidOrderByColumn, [OrderByColumnName]));

  Result := TDBXMemoryTable.Create;
  Result.Columns := CopyColumns;
  FIndex := -1;
  Result.CopyFrom(self);

  // sort the list based on the column value
  (Result as TDBXMemoryTable).OrderByColumn(Column);
end;

function TDBXMemoryTable.CreateWritableValueArray: TDBXWritableValueArray;
var
  Value: TDBXWritableValue;
  Values: TDBXWritableValueArray;
  Ordinal: Integer;
begin
  SetLength(Values, Length(Columns));
  for Ordinal := 0 to Length(Values) - 1 do
  begin
    if Columns[Ordinal] <> nil then
    begin
      // Note that we must clone the column here because a TDBXValue owns the TDBXValueType.
      // Would be nice to add ownership control
      Value := TDBXWritableValue(TDBXValue.CreateValue(nil, Columns[Ordinal].Clone, nil, False));
      Value.ValueType.Ordinal := Ordinal;
      Values[Ordinal] := Value;
    end;
  end;
  Result := Values;
end;

destructor TDBXMemoryTable.Destroy;
var
  I: Integer;
begin
  // Free rows
  for I := 0 to FValueRows.Count - 1 do
  begin
    ClearValues(FValueRows[I]);
    FValueRows[I] := nil;
  end;
  // Prevent ancestor from freeing current row
  SetValues(TDBXWritableValueArray(nil));
  FValueRows.Free;

  // Free column types
  ClearValueTypes(FValueTypes);
  inherited;
end;

function TDBXMemoryTable.FindStringKey(const Ordinal: Integer;
  const Value: UnicodeString): Boolean;
var
  refRow: TDBXWritableValueArray;
  Comparer: TDBXWritableValueArrayComparer;
begin
  // false for an empty table
  if FValueRows.Count = 0 then
    exit(False);
  // sort if not sorted on the column, thinking is there is a repeat
  if Ordinal <> FOrderByColumn then
    OrderByColumn(Ordinal);
  // prepare the reference row, only Ordinal column is important
  SetLength(refRow, Ordinal + 1);
  refRow[Ordinal] := TDBXValue.CreateValue(FValueRows[0][Ordinal].ValueType.Clone);
  refRow[Ordinal].AsString := Value;
  // allocate the comparer and perform a binary search
  // if success, move index to the found column
  Comparer := TDBXWritableValueArrayComparer.Create(Ordinal);
  Result := FValueRows.BinarySearch(refRow, FIndex, Comparer);
  if Result then
    SetValues(FValueRows[FIndex]);
  // clean up
  Comparer.Free;
  refRow[Ordinal].Free;
end;

function TDBXMemoryTable.First: Boolean;
begin
  FIndex := 0;
  Result := FIndex < FValueRows.Count;
  if Result then
    SetValues(FValueRows[FIndex]);
end;

function TDBXMemoryTable.GetColumns: TDBXValueTypeArray;
begin
  Result := FValueTypes;
end;

function TDBXMemoryTable.GetDBXTableName: string;
begin
  Result := FName;
end;

function TDBXMemoryTable.GetTableCount: Integer;
begin
  Result := FValueRows.Count
end;

function TDBXMemoryTable.InBounds: Boolean;
begin
  Result := (FIndex >= 0) and (FIndex < FValueRows.Count);
end;

procedure TDBXMemoryTable.Insert;
var
  LRow: TDBXWritableValueArray;
begin
  LRow := CreateWritableValueArray;
  SetValues(LRow, Length(LRow));
  FValueRows.Add(LRow);
  FIndex := FValueRows.Count - 1;
end;

function TDBXMemoryTable.Next: Boolean;
begin
  Inc(FIndex);
  Result := FIndex < FValueRows.Count;
  if Result then
    SetValues(FValueRows[FIndex]);
end;

procedure TDBXMemoryTable.OrderByColumn(Column: Integer);
var
  Comparer: TDBXWritableValueArrayComparer;
begin
  Comparer := TDBXWritableValueArrayComparer.Create(Column);
  try
    FValueRows.Sort(Comparer);
    FOrderByColumn := Column;
  finally
    Comparer.Free;
  end;
end;

procedure TDBXMemoryTable.Post;
begin
  // Nothing to do because data is written to the actual row rather than a buffer row
end;

procedure TDBXMemoryTable.SetColumns(const Columns: TDBXValueTypeArray);
begin
  FValueTypes := Columns;
end;

procedure TDBXMemoryTable.SetDBXTableName(const AName: UnicodeString);
begin
  FName := AName;
end;

{ TDBXWritableValueArrayComparer }

function TDBXWritableValueArrayComparer.Compare(const Left, Right: TDBXWritableValueArray): Integer;
var
  LeftValue, RightValue: TDBXValue;
begin
  LeftValue := Left[ColumnIndex];
  RightValue := Right[ColumnIndex];
  if LeftValue.IsNull or RightValue.IsNull then
    if LeftValue.IsNull then
      if RightValue.IsNull then
        Result := 0
      else
        Result := -1
    else
      Result := 1
  else
    Result := LeftValue.Compare(RightValue);
end;

constructor TDBXWritableValueArrayComparer.Create(AColumnIndex: Integer);
begin
  FColumnIndex := AColumnIndex;
end;

{ TDBXDataSetRowExt }

procedure TDBXDataSetRowExt.SetDynamicBytes(DbxValue: TDBXValue; Offset: Int64;
  const Buffer: TBytes; BufferOffset, Length: Int64);
var
  LData: TBytes;
begin
  EnsureEditState;

  SetLength(LData, Length);
  TDBXPlatform.CopyByteArray(Buffer, BufferOffset, LData, 0, Length);
  FTable.Fields[DbxValue.ValueType.Ordinal].AsBytes := LData;
end;

end.
