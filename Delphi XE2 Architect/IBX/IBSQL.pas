{$A8} {$R-}
{*************************************************************}
{                                                             }
{       CodeGear Delphi Visual Component Library              }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2007 CodeGear                      }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBSQL;

interface

uses
  SysUtils, Variants,
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  {$IFDEF LINUX}
  Libc,
  {$ENDIF}
  Classes, IBHeader, IBErrorCodes, IBExternals,
  DB, IB, IBDatabase, IBUtils, IBXConst, DBConsts, IBIntf, FMTBcd;

type
  TIBSQL = class;
  TIBXSQLDA = class;

  TSQLVAR = class(TObject)
  private
    function GetSqlDef: Short;
  protected
    function GetAliasName: AnsiString; virtual; abstract;
    function GetOwnName: AnsiString; virtual; abstract;
    function GetRelName: AnsiString; virtual; abstract;
    function GetSqlData: PByte; virtual; abstract;
    function GetSqlInd: PShort; virtual; abstract;
    function GetSqlLen: Short; virtual; abstract;
    function GetSqlName: AnsiString; virtual; abstract;
    function GetSqlPrecision: Short; virtual; abstract;
    function GetSqlScale: Short; virtual; abstract;
    function GetSqlSubtype: Short; virtual; abstract;
    function GetSqlType: Short; virtual; abstract;
    function GetSQLVAR: Pointer; virtual; abstract;
    procedure SetAliasName(const Value: AnsiString); virtual; abstract;
    procedure SetOwnName(const Value: AnsiString); virtual; abstract;
    procedure SetRelName(const Value: AnsiString); virtual; abstract;
    procedure SetSqlName(const Value: AnsiString); virtual; abstract;
    procedure SetSqlData(const Value: PByte); virtual; abstract;
    procedure SetSqlInd(const Value: PShort); virtual; abstract;
    procedure SetSqlLen(const Value: Short); virtual; abstract;
    procedure SetSqlPrecision(const Value: Short); virtual; abstract;
    procedure SetSqlScale(const Value: Short); virtual; abstract;
    procedure SetSqlSubtype(const Value: Short); virtual; abstract;
    procedure SetSqlType(const Value: Short); virtual; abstract;
    procedure SetSQLVAR(const Value: Pointer); virtual; abstract;
  public
    procedure SetDataSize(oldsize, newsize : Integer); virtual; abstract;
    procedure SetIndSize(oldsize, newsize : Integer); virtual; abstract;
    property XSqlVar : Pointer read GetSQLVAR write SetSQLVAR;
    property SqlType : Short read GetSqlType write SetSqlType;
    property SqlDef : Short read GetSqlDef;
    property SqlScale : Short read GetSqlScale write SetSqlScale;
    property SqlPrecision : Short read GetSqlPrecision write SetSqlPrecision;
    property SqlSubtype : Short read GetSqlSubtype write SetSqlSubtype;
    property SqlLen : Short read GetSqlLen write SetSqlLen;
    property SqlData : PByte read GetSqlData write SetSqlData;
    property SqlInd : PShort read GetSqlInd write SetSqlInd;

    property SqlName : AnsiString read GetSqlName write SetSqlName;
    property RelName : AnsiString read GetRelName write SetRelName;
    property OwnName : AnsiString read GetOwnName write SetOwnName;
    property AliasName : AnsiString read GetAliasName write SetAliasName;
  end;

  TSQLVAR_V1 = class(TSQLVAR)
  private
    FXSQLVAR : PXSQLVAR_V1;
  protected
    function GetAliasName: AnsiString; override;
    function GetOwnName: AnsiString; override;
    function GetRelName: AnsiString; override;
    function GetSqlData: PByte; override;
    function GetSqlInd: PShort; override;
    function GetSqlLen: Short; override;
    function GetSqlName: AnsiString; override;
    function GetSqlPrecision: Short; override;
    function GetSqlScale: Short; override;
    function GetSqlSubtype: Short; override;
    function GetSqlType: Short; override;
    function GetSQLVAR: Pointer; override;
    procedure SetAliasName(const Value: AnsiString); override;
    procedure SetOwnName(const Value: AnsiString); override;
    procedure SetRelName(const Value: AnsiString); override;
    procedure SetSqlName(const Value: AnsiString); override;
    procedure SetSqlData(const Value: PByte); override;
    procedure SetSqlInd(const Value: PShort); override;
    procedure SetSqlLen(const Value: Short); override;
    procedure SetSqlPrecision(const Value: Short); override;
    procedure SetSqlScale(const Value: Short); override;
    procedure SetSqlSubtype(const Value: Short); override;
    procedure SetSqlType(const Value: Short); override;
    procedure SetSQLVAR(const Value: Pointer); override;
  public
    procedure SetDataSize(oldsize, newsize : Integer); override;
    procedure SetIndSize(oldsize, newsize : Integer); override;
  end;

  TSQLVAR_V2 = class(TSQLVAR)
  private
    FXSQLVAR : PXSQLVAR;
  protected
    function GetAliasName: AnsiString; override;
    function GetOwnName: AnsiString; override;
    function GetRelName: AnsiString; override;
    function GetSqlData: PByte; override;
    function GetSqlInd: PShort; override;
    function GetSqlLen: Short; override;
    function GetSqlName: AnsiString; override;
    function GetSqlPrecision: Short; override;
    function GetSqlScale: Short; override;
    function GetSqlSubtype: Short; override;
    function GetSqlType: Short; override;
    function GetSQLVAR: Pointer; override;
    procedure SetAliasName(const Value: AnsiString); override;
    procedure SetOwnName(const Value: AnsiString); override;
    procedure SetRelName(const Value: AnsiString); override;
    procedure SetSqlName(const Value: AnsiString); override;
    procedure SetSqlData(const Value: PByte); override;
    procedure SetSqlInd(const Value: PShort); override;
    procedure SetSqlLen(const Value: Short); override;
    procedure SetSqlPrecision(const Value: Short); override;
    procedure SetSqlScale(const Value: Short); override;
    procedure SetSqlSubtype(const Value: Short); override;
    procedure SetSqlType(const Value: Short); override;
    procedure SetSQLVAR(const Value: Pointer); override;
  public
    procedure SetDataSize(oldsize, newsize : Integer); override;
    procedure SetIndSize(oldsize, newsize : Integer); override;
  end;

  UNICODE_FSSString = type AnsiString(65001);
  SHIFT_JIS = type AnsiString(932);

  { TIBXSQLVAR }
  TIBXSQLVAR = class(TObject)
  private
    FParent: TIBXSQLDA;
    FSQL: TIBSQL;
    FIndex: Integer;
    FModified: Boolean;
    FName: String;
    FXSQLVAR: TSQLVAR;       { Point to the PXSQLVAR in the owner object }
    FMaxLen : Short;     (** length of data area **)
    FGDSLibrary : IGDSLibrary;

    function AdjustScale(Value: Int64; Scale: Integer): Double;
    function AdjustScaleToInt64(Value: Int64; Scale: Integer): Int64;
    function AdjustScaleToCurrency(Value: Int64; Scale: Integer): Currency;
    function AdjustScaleToBCD(Value: Int64; Scale: Integer): TBcd;

    function GetAsCurrency: Currency;
    function GetAsInt64: Int64;
    function GetAsDateTime: TDateTime;
    function GetAsDouble: Double;
    function GetAsFloat: Float;
    function GetAsLong: Long;
    function GetAsPointer: Pointer;
    function GetAsQuad: TISC_QUAD;
    function GetAsShort: Short;
    function GetAsVariant: Variant;
    function GetIsNull: Boolean;
    function GetIsNullable: Boolean;
    function GetSize: Integer;
    function GetSQLType: Integer;
    procedure SetAsCurrency(Value: Currency);
    procedure SetAsInt64(Value: Int64);
    procedure SetAsDate(Value: TDateTime);
    procedure SetAsTime(Value: TDateTime);
    procedure SetAsDateTime(Value: TDateTime);
    procedure SetAsDouble(Value: Double);
    procedure SetAsFloat(Value: Float);
    procedure SetAsLong(Value: Long);
    procedure SetAsPointer(Value: Pointer);
    procedure SetAsQuad(Value: TISC_QUAD);
    procedure SetAsShort(Value: Short);
    procedure SetAsVariant(Value: Variant);
    procedure SetIsNull(Value: Boolean);
    procedure SetIsNullable(Value: Boolean);
    procedure SetAsTrimString(const Value: String);
    function GetAsTrimString: String;
    function GetAsBoolean: Boolean;
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetFXSQLVAR(const Value: TSQLVAR);
    function GetAsBCD: TBcd;
    procedure SetAsBcd(const Value: TBcd);
    function GetAsBytes: TBytes;
    procedure SetAsBytes(const Value: TBytes);
    function GetCharsetSize: Integer;
    function GetAsString: String;
    procedure SetAsString(const Value: String);
    function GetAsCPString(CodePage : Integer): String;
    procedure SetAsCPString(const Value: String; CodePage : Integer);
    function GetCodePage : Integer; inline;
  public
    constructor Create(Parent: TIBXSQLDA; Query: TIBSQL);
    destructor Destroy; override;
    procedure Assign(Source: TIBXSQLVAR);
    procedure LoadFromFile(const FileName: String);
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToFile(const FileName: String);
    procedure SaveToStream(Stream: TStream);
    procedure Clear;
    property AsBoolean : Boolean read GetAsBoolean write SetAsBoolean;
    property AsDate: TDateTime read GetAsDateTime write SetAsDate;
    property AsTime: TDateTime read GetAsDateTime write SetAsTime;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsDouble: Double read GetAsDouble write SetAsDouble;
    property AsFloat: Float read GetAsFloat write SetAsFloat;
    property AsCurrency: Currency read GetAsCurrency write SetAsCurrency;
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    property AsInteger: Integer read GetAsLong write SetAsLong;
    property AsLong: Long read GetAsLong write SetAsLong;
    property AsPointer: Pointer read GetAsPointer write SetAsPointer;
    property AsQuad: TISC_QUAD read GetAsQuad write SetAsQuad;
    property AsShort: Short read GetAsShort write SetAsShort;
    property AsTrimString : String read GetAsTrimString write SetAsTrimString;
    property AsVariant: Variant read GetAsVariant write SetAsVariant;
    property AsBcd : TBcd read GetAsBCD write SetAsBcd;
    property AsBytes : TBytes read GetAsBytes write SetAsBytes;
    property AsString : String read GetAsString write SetAsString;

    property SqlVar : TSQLVAR read FXSQLVAR write SetFXSQLVAR;
    property Data : TSQLVAR read FXSQLVAR write FXSQLVAR;
    property IsNull: Boolean read GetIsNull write SetIsNull;
    property IsNullable: Boolean read GetIsNullable write SetIsNullable;
    property Index: Integer read FIndex;
    property Modified: Boolean read FModified write FModified;
    property Name: String read FName;
    property Size: Integer read GetSize;
    property SQLType: Integer read GetSQLType;
    property Value: Variant read GetAsVariant write SetAsVariant;
    property CharSetSize : Integer read GetCharsetSize;
  end;

  TIBXSQLVARArray = Array of TIBXSQLVAR;

  { TIBXSQLVAR }
  TIBXSQLDA = class(TObject)
  protected
    FSQL: TIBSQL;
    FCount: Integer;
    FNames: TStrings;
    FSize: Integer;
    FXSQLDA: PXSQLDA;
    FXSQLVARs: TIBXSQLVARArray; { array of IBXQLVARs }
    FUniqueRelationName: String;
    FGDSLibrary : IGDSLibrary;

    function GetModified: Boolean;
    function GetNames: AnsiString;
    function GetRecordSize: Integer;
    function GetXSQLDA: PXSQLDA;
    function GetSQLVAR(Idx: Integer): TIBXSQLVAR;
    function GetSQLVARByName(Idx: String): TIBXSQLVAR;
    procedure Initialize;
    procedure SetCount(Value: Integer);
  public
    constructor Create(Query: TIBSQL);
    destructor Destroy; override;
    procedure AddName(FieldName: String; Idx: Integer);
    function ByName(Idx: String): TIBXSQLVAR;
    property AsXSQLDA: PXSQLDA read GetXSQLDA;
    property Count: Integer read FCount write SetCount;
    property Modified: Boolean read GetModified;
    property Names: AnsiString read GetNames;
    property RecordSize: Integer read GetRecordSize;
    property Vars[Idx: Integer]: TIBXSQLVAR read GetSQLVAR; default;
    property UniqueRelationName: String read FUniqueRelationName;
  end;

  { TIBBatch }

  TIBBatch = class(TObject)
  protected
    FFilename: String;
    FColumns: TIBXSQLDA;
    FParams: TIBXSQLDA;
  public
    procedure ReadyFile; virtual; abstract;
    property Columns: TIBXSQLDA read FColumns write FColumns;
    property Filename: String read FFilename write FFilename;
    property Params: TIBXSQLDA read FParams write FParams;
  end;

  TIBBatchInput = class(TIBBatch)
  public
    function ReadParameters: Boolean; virtual; abstract;
  end;

  TIBBatchOutput = class(TIBBatch)
  public
    function WriteColumns: Boolean; virtual; abstract;
  end;

  { TIBOutputDelimitedFile }
  TIBOutputDelimitedFile = class(TIBBatchOutput)
  protected
    FFile : TFileStream;
    FOutputTitles: Boolean;
    FColDelimiter,
    FRowDelimiter: string;
  public
    destructor Destroy; override;
    procedure ReadyFile; override;
    function WriteColumns: Boolean; override;
    property ColDelimiter: string read FColDelimiter write FColDelimiter;
    property OutputTitles: Boolean read FOutputTitles
                                   write FOutputTitles;
    property RowDelimiter: string read FRowDelimiter write FRowDelimiter;
  end;

  { TIBInputDelimitedFile }
  TIBInputDelimitedFile = class(TIBBatchInput)
  protected
    FColDelimiter,
    FRowDelimiter: string;
    FEOF: Boolean;
    FFile: TFileStream;
    FLookAhead: Char;
    FReadBlanksAsNull: Boolean;
    FSkipTitles: Boolean;
  public
    destructor Destroy; override;
    function GetColumn(var Col: string): Integer;
    function ReadParameters: Boolean; override;
    procedure ReadyFile; override;
    property ColDelimiter: string read FColDelimiter write FColDelimiter;
    property ReadBlanksAsNull: Boolean read FReadBlanksAsNull
                                       write FReadBlanksAsNull;
    property RowDelimiter: string read FRowDelimiter write FRowDelimiter;
    property SkipTitles: Boolean read FSkipTitles write FSkipTitles;
  end;

  { TIBOutputRawFile }
  TIBOutputRawFile = class(TIBBatchOutput)
  protected
    FFile : TFileStream;
  public
    destructor Destroy; override;
    procedure ReadyFile; override;
    function WriteColumns: Boolean; override;
  end;

  { TIBInputRawFile }
  TIBInputRawFile = class(TIBBatchInput)
  protected
    FFile : TFileStream;
  public
    destructor Destroy; override;
    function ReadParameters: Boolean; override;
    procedure ReadyFile; override;
  end;

  TIBXMLFlag = (  xmlAttribute, xmlDisplayNull, xmlNoHeader);
  TIBXMLFlags = set of TIBXMLFlag;

  TIBOutputXML = class(TObject)
  private
    FTableTag: AnsiString;
    FHeaderTag: AnsiString;
    FDatabaseTag: AnsiString;
    FFlags: TIBXMLFlags;
    FRowTag: AnsiString;
    FStream: TStream;
  public
    procedure WriteXML(SQL : TIBSQL);
    property HeaderTag : AnsiString read FHeaderTag write FHeaderTag;
    property DatabaseTag : AnsiString read FDatabaseTag write FDatabaseTag;
    property Stream : TStream read FStream write FStream;
    property TableTag : AnsiString read FTableTag write FTableTag;
    property RowTag : AnsiString read FRowTag write FRowTag;
    property Flags : TIBXMLFlags read FFlags write FFlags;
  end;

  { TIBSQL }
  TIBSQLTypes = (SQLUnknown, SQLSelect, SQLInsert,
                  SQLUpdate, SQLDelete, SQLDDL,
                  SQLGetSegment, SQLPutSegment,
                  SQLExecProcedure, SQLStartTransaction,
                  SQLCommit, SQLRollback,
                  SQLSelectForUpdate, SQLSetGenerator);

  TIBSQL = class(TComponent)
  private
    FIBLoaded: Boolean;
    function GetFieldCount: Integer;
    procedure InternalFreeHandle(RaiseException : Boolean);
    procedure InternalClose(RaiseException : Boolean);
  protected
    FBase: TIBBase;
    FBOF,                          { At BOF? }
    FEOF,                          { At EOF? }
    FGoToFirstRecordOnExecute,     { Automatically position record on first record after executing }
    FOpen,                         { Is a cursor open? }
    FPrepared: Boolean;            { Has the query been prepared? }
    FRecordCount: Integer;         { How many records have been read so far? }
    FCursor: AnsiString;           { Cursor name...}
    FHandle: TISC_STMT_HANDLE;     { Once prepared, this accesses the SQL Query }
    FOnSQLChanging: TNotifyEvent;  { Call this when the SQL is changing }
    FSQL: TStrings;                { SQL Query (by user) }
    FParamCheck: Boolean;          { Check for parameters? (just like TQuery) }
    FProcessedSQL: TStrings;       { SQL Query (pre-processed for param labels) }
    FSQLParams,                    { Any parameters to the query }
    FSQLRecord: TIBXSQLDA;         { The current record }
    FSQLType: TIBSQLTypes;         { Select, update, delete, insert, create, alter, etc...}
    FGenerateParamNames: Boolean;  { Auto generate param names ?}
    FGDSLibrary : IGDSLibrary;
    procedure DoBeforeDatabaseDisconnect(Sender: TObject);
    function GetDatabase: TIBDatabase;
    function GetDBHandle: PISC_DB_HANDLE;
    function GetEOF: Boolean;
    function GetFields(const Idx: Integer): TIBXSQLVAR;
    function GetFieldIndex(FieldName: String): Integer;
    function GetPlan: String;
    function GetRecordCount: Integer;
    function GetRowsAffected: Integer;
    function GetSQLParams: TIBXSQLDA;
    function GetTransaction: TIBTransaction;
    function GetTRHandle: PISC_TR_HANDLE;
    procedure PreprocessSQL;
    procedure SetDatabase(Value: TIBDatabase);
    procedure SetSQL(Value: TStrings);
    procedure SetTransaction(Value: TIBTransaction);
    procedure SQLChanging(Sender: TObject);
    procedure BeforeTransactionEnd(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BatchInput(InputObject: TIBBatchInput);
    procedure BatchOutput(OutputObject: TIBBatchOutput);
    procedure OutputXML(OutputObject : TIBOutputXML);
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    procedure CheckClosed;           { raise error if query is not closed. }
    procedure CheckOpen;             { raise error if query is not open.}
    procedure CheckValidStatement;   { raise error if statement is invalid.}
    procedure Close;
    function Current: TIBXSQLDA;
    procedure ExecQuery;
    function FieldByName(FieldName: String): TIBXSQLVAR;
    procedure FreeHandle;
    function Next: TIBXSQLDA;
    procedure Prepare;
    procedure Unprepare;
    function GetUniqueRelationName: String;
    function ParamByName(Idx: String): TIBXSQLVAR;
    property Bof: Boolean read FBOF;
    property DBHandle: PISC_DB_HANDLE read GetDBHandle;
    property Eof: Boolean read GetEOF;
    property Fields[const Idx: Integer]: TIBXSQLVAR read GetFields;
    property FieldIndex[FieldName: String]: Integer read GetFieldIndex;
    property Open: Boolean read FOpen;
    property Params: TIBXSQLDA read GetSQLParams;
    property Plan: String read GetPlan;
    property Prepared: Boolean read FPrepared;
    property RecordCount: Integer read GetRecordCount;
    property RowsAffected: Integer read GetRowsAffected;
    property SQLType: TIBSQLTypes read FSQLType;
    property TRHandle: PISC_TR_HANDLE read GetTRHandle;
    property Handle: TISC_STMT_HANDLE read FHandle;
    property GenerateParamNames: Boolean read FGenerateParamNames write FGenerateParamNames;
    property UniqueRelationName: String read GetUniqueRelationName;
    property FieldCount : Integer Read GetFieldCount;
  published
    property Database: TIBDatabase read GetDatabase write SetDatabase;
    property GoToFirstRecordOnExecute: Boolean read FGoToFirstRecordOnExecute
                                               write FGoToFirstRecordOnExecute
                                               default True;
    property ParamCheck: Boolean read FParamCheck write FParamCheck default true;
    property SQL: TStrings read FSQL write SetSQL;
    property Transaction: TIBTransaction read GetTransaction write SetTransaction;
    property OnSQLChanging: TNotifyEvent read FOnSQLChanging write FOnSQLChanging;
  end;

  procedure OutputXML(sqlObject : TIBSQL; OutputObject: TIBOutputXML);

implementation

uses
  {$IFDEF MACOS}
  Types,
  {$ENDIF}
  IBBlob, IBSQLMonitor, IBXMLHeader;

{ TIBXSQLVAR }
constructor TIBXSQLVAR.Create(Parent: TIBXSQLDA; Query: TIBSQL);
begin
  inherited Create;
  FParent := Parent;
  FSQL := Query;

  if FSQL.Database.GDSLibrary.GetIBClientVersion >= 7 then
    FXSQLVAR := TSQLVAR_V2.Create
  else
    FXSQLVAR := TSQLVAR_V1.Create;
end;

procedure TIBXSQLVAR.Assign(Source: TIBXSQLVAR);
var
  szBuff: PByte;
  s_bhandle, d_bhandle: TISC_BLOB_HANDLE;
  bSourceBlob, bDestBlob: Boolean;
  iSegs, iMaxSeg, iSize: Long;
  iBlobType: Short;
  FGDSLibrary : IGDSLibrary;
begin
  FGDSLibrary := FSQL.Database.GDSLibrary;
  szBuff := nil;
  bSourceBlob := True;
  bDestBlob := True;
  s_bhandle := nil;
  d_bhandle := nil;
  try
    if (Source.IsNull) then
    begin
      IsNull := True;
      exit;
    end
    else
      if (FXSQLVAR.SqlDef = SQL_ARRAY) or
         (Source.FXSQLVAR.SqlDef = SQL_ARRAY) then
        exit; { arrays not supported }
    if (FXSQLVAR.sqlDef <> SQL_BLOB) and
       (Source.FXSQLVAR.SqlDef <> SQL_BLOB) then
    begin
      SQLVAR := Source.SQLVAR;
      exit;
    end
    else
      if (Source.FXSQLVAR.SqlDef <> SQL_BLOB) then
      begin
        szBuff := nil;
        IBAlloc(szBuff, 0, Source.FXSQLVAR.sqllen);

        if (Source.FXSQLVAR.SqlDef = SQL_TEXT) or
           (Source.FXSQLVAR.SqlDef = SQL_VARYING) then
          Move(Source.FXSQLVAR.sqldata[2], szBuff[0], FGDSLibrary.isc_vax_integer(Source.FXSQLVAR.sqldata, 2))
        else
          Move(Source.FXSQLVAR.sqldata[0], szBuff[0], Source.FXSQLVAR.sqllen);
        bSourceBlob := False;
        iSize := Source.FXSQLVAR.sqllen;
      end
      else
        if (FXSQLVAR.SqlDef <> SQL_BLOB) then
          bDestBlob := False;

    if bSourceBlob then
    begin
      { read the blob }
      Source.FSQL.Call(FGDSLibrary.isc_open_blob2(StatusVector, Source.FSQL.DBHandle,
        Source.FSQL.TRHandle, @s_bhandle, PISC_QUAD(Source.FXSQLVAR.sqldata),
        0, nil), True);
      try
        IBBlob.GetBlobInfo(@s_bhandle, iSegs, iMaxSeg, iSize, iBlobType, FGDSLibrary);
        szBuff := nil;
        IBAlloc(szBuff, 0, iSize);
        IBBlob.ReadBlob(@s_bhandle, szBuff, iSize, FGDSLibrary);
      finally
        Source.FSQL.Call(FGDSLibrary.isc_close_blob(StatusVector, @s_bhandle), True);
      end;
    end;

    if bDestBlob then
    begin
      { write the blob }
      FSQL.Call(FGDSLibrary.isc_create_blob2(StatusVector, FSQL.DBHandle,
        FSQL.TRHandle, @d_bhandle, PISC_QUAD(FXSQLVAR.sqldata), 0, nil), True);
      try
        IBBlob.WriteBlob(@d_bhandle, szBuff, iSize, FGDSLibrary);
        IsNull := false;
      finally
        FSQL.Call(FGDSLibrary.isc_close_blob(StatusVector, @d_bhandle), True);
      end;
    end
    else
    begin
      { just copy the buffer }
      FXSQLVAR.sqltype := SQL_TEXT;
      FXSQLVAR.sqllen := iSize;
      FXSQLVAR.SetDataSize(iSize, iSize);
      Move(szBuff[0], FXSQLVAR.sqldata[0], iSize);
    end;
  finally
    FreeMem(szBuff);
  end;
end;

function TIBXSQLVAR.AdjustScale(Value: Int64; Scale: Integer): Double;
var
  Scaling : Int64;
  i: Integer;
  Val: Double;
begin
  Scaling := 1; Val := Value;
  if Scale > 0 then
  begin
    for i := 1 to Scale do
      Scaling := Scaling * 10;
    result := Val * Scaling;
  end
  else
    if Scale < 0 then
    begin
      for i := -1 downto Scale do
        Scaling := Scaling * 10;
      result := Val / Scaling;
    end
    else
      result := Val;
end;

function TIBXSQLVAR.AdjustScaleToInt64(Value: Int64; Scale: Integer): Int64;
var
  Scaling : Int64;
  i: Integer;
  Val: Int64;
begin
  Scaling := 1; Val := Value;
  if Scale > 0 then begin
    for i := 1 to Scale do Scaling := Scaling * 10;
    result := Val * Scaling;
  end else if Scale < 0 then begin
    for i := -1 downto Scale do Scaling := Scaling * 10;
    result := Val div Scaling;
  end else
    result := Val;
end;

function TIBXSQLVAR.AdjustScaleToCurrency(Value: Int64; Scale: Integer): Currency;
var
  Scaling : Int64;
  i : Integer;
  FractionText, PadText, CurrText: string;
begin
  Result := 0;
  Scaling := 1;
  if Scale > 0 then
  begin
    for i := 1 to Scale do
      Scaling := Scaling * 10;
    result := Value * Scaling;
  end
  else
    if Scale < 0 then
    begin
      for i := -1 downto Scale do
        Scaling := Scaling * 10;
      FractionText := IntToStr(abs(Value mod Scaling));
      for i := Length(FractionText) to -Scale -1 do
        PadText := '0' + PadText;
      if Value < 0 then
        CurrText := '-' + IntToStr(Abs(Value div Scaling)) + formatSettings.DecimalSeparator + PadText + FractionText
      else
        CurrText := IntToStr(Abs(Value div Scaling)) + FormatSettings.DecimalSeparator + PadText + FractionText;
      try
        result := StrToCurr(CurrText);
      except
        on E: Exception do
          IBError(ibxeInvalidDataConversion, [nil]);
      end;
    end
    else
      result := Value;
end;

function TIBXSQLVAR.GetAsCurrency: Currency;
begin
  result := 0;
  if FSQL.Database.SQLDialect < 3 then
    result := GetAsDouble
  else begin
    if not IsNull then
      case FXSQLVAR.SqlDef of
        SQL_TEXT, SQL_VARYING: begin
          try
            result := StrtoCurr(AsString);
          except
            on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
          end;
        end;
        SQL_SHORT:
          result := AdjustScaleToCurrency(Int64(PShort(FXSQLVAR.sqldata)^),
                                      FXSQLVAR.sqlscale);
        SQL_LONG:
          result := AdjustScaleToCurrency(Int64(PLong(FXSQLVAR.sqldata)^),
                                      FXSQLVAR.sqlscale);
        SQL_INT64:
          result := AdjustScaleToCurrency(PInt64(FXSQLVAR.sqldata)^,
                                      FXSQLVAR.sqlscale);
        SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
          result := GetAsDouble;
        else
          IBError(ibxeInvalidDataConversion, [nil]);
      end;
    end;
end;

function TIBXSQLVAR.GetAsInt64: Int64;
begin
  result := 0;
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_TEXT, SQL_VARYING: begin
        try
          result := StrToInt64(AsString);
        except
          on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
        end;
      end;
      SQL_SHORT:
        result := AdjustScaleToInt64(Int64(PShort(FXSQLVAR.sqldata)^),
                                    FXSQLVAR.sqlscale);
      SQL_LONG:
        result := AdjustScaleToInt64(Int64(PLong(FXSQLVAR.sqldata)^),
                                    FXSQLVAR.sqlscale);
      SQL_INT64:
        result := AdjustScaleToInt64(PInt64(FXSQLVAR.sqldata)^,
                                    FXSQLVAR.sqlscale);
      SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
        result := Trunc(AsDouble);
      SQL_BOOLEAN :
        case PShort(FXSQLVAR.sqldata)^ of
          ISC_TRUE : Result := 1;
          ISC_FALSE : Result := 0;
        end;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsDateTime: TDateTime;
var
  tm_date: TCTimeStructure;
  FGDSLibrary : IGDSLibrary;
begin
  FGDSLibrary := FSQL.Database.GDSLibrary;
  result := 0;
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_TEXT, SQL_VARYING: begin
        try
          result := StrToDate(AsString);
        except
          on E: EConvertError do IBError(ibxeInvalidDataConversion, [nil]);
        end;
      end;
      SQL_TYPE_DATE: begin
        FGDSLibrary.isc_decode_sql_date(PISC_DATE(FXSQLVAR.sqldata), @tm_date);
        try
          result := EncodeDate(Word(tm_date.tm_year + 1900), Word(tm_date.tm_mon + 1),
                               Word(tm_date.tm_mday));
        except
          on E: EConvertError do begin
            IBError(ibxeInvalidDataConversion, [nil]);
          end;
        end;
      end;
      SQL_TYPE_TIME: begin
        FGDSLibrary.isc_decode_sql_time(PISC_TIME(FXSQLVAR.sqldata), @tm_date);
        try
          result := EncodeTime(Word(tm_date.tm_hour), Word(tm_date.tm_min),
                               Word(tm_date.tm_sec), 0)
        except
          on E: EConvertError do begin
            IBError(ibxeInvalidDataConversion, [nil]);
          end;
        end;
      end;
      SQL_TIMESTAMP: begin
        FGDSLibrary.isc_decode_date(PISC_QUAD(FXSQLVAR.sqldata), @tm_date);
        try
          result := EncodeDate(Word(tm_date.tm_year + 1900), Word(tm_date.tm_mon + 1),
                              Word(tm_date.tm_mday));
          if result >= 0 then
            result := result + EncodeTime(Word(tm_date.tm_hour), Word(tm_date.tm_min),
                                          Word(tm_date.tm_sec), 0)
          else
            result := result - EncodeTime(Word(tm_date.tm_hour), Word(tm_date.tm_min),
                                          Word(tm_date.tm_sec), 0)
        except
          on E: EConvertError do begin
            IBError(ibxeInvalidDataConversion, [nil]);
          end;
        end;
      end;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsDouble: Double;
begin
  result := 0;
  if not IsNull then begin
    case FXSQLVAR.SqlDef of
      SQL_TEXT, SQL_VARYING: begin
        try
          result := StrToFloat(AsString);
        except
          on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
        end;
      end;
      SQL_SHORT:
        result := AdjustScale(Int64(PShort(FXSQLVAR.sqldata)^),
                              FXSQLVAR.sqlscale);
      SQL_LONG:
        result := AdjustScale(Int64(PLong(FXSQLVAR.sqldata)^),
                              FXSQLVAR.sqlscale);
      SQL_INT64:
        result := AdjustScale(PInt64(FXSQLVAR.sqldata)^, FXSQLVAR.sqlscale);
      SQL_FLOAT:
        result := PFloat(FXSQLVAR.sqldata)^;
      SQL_DOUBLE, SQL_D_FLOAT:
        result := PDouble(FXSQLVAR.sqldata)^;
      SQL_BOOLEAN :
        case PShort(FXSQLVAR.sqldata)^ of
          ISC_TRUE : Result := 1;
          ISC_FALSE : Result := 0;
        end;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
    if  FXSQLVAR.sqlscale <> 0 then
      result :=
        StrToFloat(FloatToStrF(result, fffixed, 15,
                  Abs(FXSQLVAR.sqlscale) ));
  end;
end;

function TIBXSQLVAR.GetAsFloat: Float;
begin
  result := 0;
  try
    result := AsDouble;
  except
    on E: SysUtils.EOverflow do
      IBError(ibxeInvalidDataConversion, [nil]);
  end;
end;

function TIBXSQLVAR.GetAsLong: Long;
begin
  result := 0;
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_TEXT, SQL_VARYING: begin
        try
          result := StrToInt(AsString);
        except
          on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
        end;
      end;
      SQL_SHORT:
        result := Trunc(AdjustScale(Int64(PShort(FXSQLVAR.sqldata)^),
                                    FXSQLVAR.sqlscale));
      SQL_LONG:
        result := Trunc(AdjustScale(Int64(PLong(FXSQLVAR.sqldata)^),
                                    FXSQLVAR.sqlscale));
      SQL_INT64:
        result := Trunc(AdjustScale(PInt64(FXSQLVAR.sqldata)^, FXSQLVAR.sqlscale));
      SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
        result := Trunc(AsDouble);
      SQL_BOOLEAN :
        case PShort(FXSQLVAR.sqldata)^ of
          ISC_TRUE : Result := 1;
          ISC_FALSE : Result := 0;
        end;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsPointer: Pointer;
begin
  if not IsNull then
    result := FXSQLVAR.sqldata
  else
    result := nil;
end;

function TIBXSQLVAR.GetAsQuad: TISC_QUAD;
begin
  result.gds_quad_high := 0;
  result.gds_quad_low := 0;
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_BLOB, SQL_ARRAY, SQL_QUAD:
        result := PISC_QUAD(FXSQLVAR.sqldata)^;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsShort: Short;
begin
  result := 0;
  try
    result := AsLong;
  except
    on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
  end;
end;


function TIBXSQLVAR.GetAsString: String;
begin
  Result := GetAsCPString(FSQL.Database.CharacterSetCodePage);
end;

function TIBXSQLVAR.GetAsVariant: Variant;
begin
  if IsNull then
    result := NULL
  { Check null, if so return a default string }
  else case FXSQLVAR.SqlDef of
      SQL_ARRAY:
        result := '(Array)'; {do not localize}
      SQL_BLOB:
        result := '(Blob)'; {do not localize}
      SQL_TEXT, SQL_VARYING:
        result := AsString;
      SQL_TIMESTAMP, SQL_TYPE_DATE, SQL_TYPE_TIME:
        result := AsDateTime;
      SQL_SHORT, SQL_LONG:
        if FXSQLVAR.sqlscale = 0 then
          result := AsLong
        else if FXSQLVAR.sqlscale >= (-4) then
          result := AsCurrency
        else
          result := AsDouble;
      SQL_INT64:
        if FXSQLVAR.sqlscale = 0 then
          Result := AsINT64
        else
          if FXSQLVAR.sqlscale >= (-4) then
            result := AsCurrency
          else
            result := AsDouble;
      SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
        result := AsDouble;
      SQL_BOOLEAN :
        Result := AsBoolean;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetIsNull: Boolean;
begin
  result := IsNullable and (FXSQLVAR.sqlind^ = -1);
end;

function TIBXSQLVAR.GetIsNullable: Boolean;
begin
  result := (FXSQLVAR.sqltype and 1 = 1);
end;

procedure TIBXSQLVAR.LoadFromFile(const FileName: String);
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(fs);
  finally
    fs.Free;
  end;
end;

procedure TIBXSQLVAR.LoadFromStream(Stream: TStream);
var
  bs: TIBBlobStream;
begin
  bs := TIBBlobStream.Create(nil);
  try
    bs.Mode := bmWrite;
    bs.Database := FSQL.Database;
    bs.Transaction := FSQL.Transaction;
    Stream.Seek(0, soFromBeginning);
    bs.LoadFromStream(Stream);
    bs.Finalize;
    AsQuad := bs.BlobID;
  finally
    bs.Free;
  end;
end;

procedure TIBXSQLVAR.SaveToFile(const FileName: String);
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(FileName, fmCreate or fmShareExclusive);
  try
    SaveToStream(fs);
  finally
    fs.Free;
  end;
end;

procedure TIBXSQLVAR.SaveToStream(Stream: TStream);
var
  bs: TIBBlobStream;
begin
  bs := TIBBlobStream.Create(nil);
  try
    bs.Mode := bmRead;
    bs.Database := FSQL.Database;
    bs.Transaction := FSQL.Transaction;
    bs.BlobID := AsQuad;
    bs.SaveToStream(Stream);
  finally
    bs.Free;
  end;
end;

function TIBXSQLVAR.GetSize: Integer;
begin
  result := FXSQLVAR.sqllen;
end;

function TIBXSQLVAR.GetSQLType: Integer;
begin
  result := FXSQLVAR.SqlDef;
end;

procedure TIBXSQLVAR.SetAsCurrency(Value: Currency);
var
  xvar: TIBXSQLVAR;
  i: Integer;
begin
  if FSQL.Database.SQLDialect < 3 then
    AsDouble := Value
  else
  begin
    if IsNullable then
      IsNull := False;
    for i := 0 to FParent.FCount - 1 do
      if FParent.FNames[i] = FName then
      begin
        xvar := FParent[i];
        xvar.FXSQLVAR.sqltype := SQL_INT64 or (xvar.FXSQLVAR.sqltype and 1);
        xvar.FXSQLVAR.sqlscale := -4;
        xvar.FXSQLVAR.sqllen := SizeOf(Int64);
        xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
        PCurrency(xvar.FXSQLVAR.sqldata)^ := Value;
        xvar.FModified := True;
      end;
  end;
end;

procedure TIBXSQLVAR.SetAsInt64(Value: Int64);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_INT64 or (xvar.FXSQLVAR.sqltype and 1);
      xvar.FXSQLVAR.sqlscale := 0;
      xvar.FXSQLVAR.sqllen := SizeOf(Int64);
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PInt64(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsDate(Value: TDateTime);
var
  i: Integer;
  tm_date: TCTimeStructure;
  Yr, Mn, Dy: Word;
  xvar: TIBXSQLVAR;
begin
  if FSQL.Database.SQLDialect < 3 then
  begin
    AsDateTime := Value;
    exit;
  end;
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_TYPE_DATE or (xvar.FXSQLVAR.sqltype and 1);
      DecodeDate(Value, Yr, Mn, Dy);
      with tm_date do begin
        tm_sec := 0;
        tm_min := 0;
        tm_hour := 0;
        tm_mday := Dy;
        tm_mon := Mn - 1;
        tm_year := Yr - 1900;
      end;
      xvar.FXSQLVAR.sqllen := SizeOf(ISC_DATE);
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      FSQL.Database.GDSLibrary.isc_encode_sql_date(@tm_date, PISC_DATE(xvar.FXSQLVAR.sqldata));
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsTime(Value: TDateTime);
var
  i: Integer;
  tm_date: TCTimeStructure;
  Hr, Mt, S, Ms: Word;
  xvar: TIBXSQLVAR;
begin
  if FSQL.Database.SQLDialect < 3 then
  begin
    AsDateTime := Value;
    exit;
  end;
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_TYPE_TIME or (xvar.FXSQLVAR.sqltype and 1);
      DecodeTime(Value, Hr, Mt, S, Ms);
      with tm_date do begin
        tm_sec := S;
        tm_min := Mt;
        tm_hour := Hr;
        tm_mday := 0;
        tm_mon := 0;
        tm_year := 0;
      end;
      xvar.FXSQLVAR.sqllen := SizeOf(ISC_TIME);
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      FSQL.Database.GDSLibrary.isc_encode_sql_time(@tm_date, PISC_TIME(xvar.FXSQLVAR.sqldata));
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsDateTime(Value: TDateTime);
var
  i: Integer;
  tm_date: TCTimeStructure;
  Yr, Mn, Dy, Hr, Mt, S, Ms: Word;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_TIMESTAMP or (xvar.FXSQLVAR.sqltype and 1);
      DecodeDate(Value, Yr, Mn, Dy);
      DecodeTime(Value, Hr, Mt, S, Ms);
      with tm_date do begin
        tm_sec := S;
        tm_min := Mt;
        tm_hour := Hr;
        tm_mday := Dy;
        tm_mon := Mn - 1;
        tm_year := Yr - 1900;
      end;
      xvar.FXSQLVAR.sqllen := SizeOf(TISC_QUAD);
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      FSQL.Database.GDSLibrary.isc_encode_date(@tm_date, PISC_QUAD(xvar.FXSQLVAR.sqldata));
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsDouble(Value: Double);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_DOUBLE or (xvar.FXSQLVAR.sqltype and 1);
      xvar.FXSQLVAR.sqllen := SizeOf(Double);
      xvar.FXSQLVAR.sqlscale := 0;
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PDouble(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsFloat(Value: Float);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_FLOAT or (xvar.FXSQLVAR.sqltype and 1);
      xvar.FXSQLVAR.sqllen := SizeOf(Float);
      xvar.FXSQLVAR.sqlscale := 0;
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PSingle(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsLong(Value: Long);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_LONG or (xvar.FXSQLVAR.sqltype and 1);
      xvar.FXSQLVAR.sqllen := SizeOf(Long);
      xvar.FXSQLVAR.sqlscale := 0;
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PLong(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsPointer(Value: Pointer);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable and (Value = nil) then
    IsNull := True
  else begin
    IsNull := False;
    for i := 0 to FParent.FCount - 1 do
      if FParent.FNames[i] = FName then
      begin
        xvar := FParent[i];
        xvar.FXSQLVAR.sqltype := SQL_TEXT or (FXSQLVAR.sqltype and 1);
        Move(Value^, xvar.FXSQLVAR.sqldata^, xvar.FXSQLVAR.sqllen);
        xvar.FModified := True;
      end;
  end;
end;

procedure TIBXSQLVAR.SetAsQuad(Value: TISC_QUAD);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      if (xvar.FXSQLVAR.SqlDef <> SQL_BLOB) and
         (xvar.FXSQLVAR.SqlDef <> SQL_ARRAY) then
        IBError(ibxeInvalidDataConversion, [nil]);
      xvar.FXSQLVAR.sqllen := SizeOf(TISC_QUAD);
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PISC_QUAD(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;

procedure TIBXSQLVAR.SetAsShort(Value: Short);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if IsNullable then
    IsNull := False;
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      xvar.FXSQLVAR.sqltype := SQL_SHORT or (xvar.FXSQLVAR.sqltype and 1);
      xvar.FXSQLVAR.sqllen := SizeOf(Short);
      xvar.FXSQLVAR.sqlscale := 0;
      xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
      PShort(xvar.FXSQLVAR.sqldata)^ := Value;
      xvar.FModified := True;
    end;
end;


procedure TIBXSQLVAR.SetAsString(const Value: String);
begin
  SetAsCPString(Value, FSQL.Database.CharacterSetCodePage); // AnsiString
end;

procedure TIBXSQLVAR.SetAsVariant(Value: Variant);
begin
  if VarIsNull(Value) then
    IsNull := True
  else
  case VarType(Value) of
    varEmpty, varNull:
      IsNull := True;
    varSmallint, varInteger, varByte, varShortInt, varWord, varLongWord:
      AsLong := Value;
    varSingle, varDouble:
      AsDouble := Value;
    varCurrency:
      AsCurrency := Value;
    varBoolean:
      if Value then
        AsBoolean := true
      else
        AsBoolean := false;
    varDate:
      AsDateTime := Value;
    varOleStr, varString, varUString:
      AsString := Value;
    varArray:
      IBError(ibxeNotSupported, [nil]);
    varByRef, varDispatch, varError, varUnknown, varVariant:
      IBError(ibxeNotPermitted, [nil]);
    varInt64:
      AsInt64 := Value;
    varArray or varByte:
      AsBytes := Value;
    else
      IBError(ibxeNotSupported, [nil]);
  end;
end;

procedure TIBXSQLVAR.SetIsNull(Value: Boolean);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  if Value then
  begin
    if not IsNullable then
      IsNullable := True;
    for i := 0 to FParent.FCount - 1 do
      if FParent.FNames[i] = FName then
      begin
        xvar := FParent[i];
        if Assigned(xvar.FXSQLVAR.sqlind) then
          xvar.FXSQLVAR.sqlind^ := -1;
        xvar.FModified := True;
      end;
  end
  else
    if ((not Value) and IsNullable) then
    begin
      for i := 0 to FParent.FCount - 1 do
        if FParent.FNames[i] = FName then
        begin
          xvar := FParent[i];
          if Assigned(xvar.FXSQLVAR.sqlind) then
            xvar.FXSQLVAR.sqlind^ := 0;
          xvar.FModified := True;
        end;
    end;
end;

procedure TIBXSQLVAR.SetIsNullable(Value: Boolean);
var
  i: Integer;
  xvar: TIBXSQLVAR;
begin
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      if (Value <> IsNullable) then
      begin
        if Value then
        begin
          xvar.FXSQLVAR.sqltype := xvar.FXSQLVAR.sqltype or 1;
          xvar.FXSQLVAR.SetIndSize(0, SizeOf(Short));
        end
        else
        begin
          xvar.FXSQLVAR.sqltype := xvar.FXSQLVAR.SqlDef;
          xvar.FXSQLVAR.SetIndSize(0, 0);
        end;
      end;
    end;
end;

procedure TIBXSQLVAR.Clear;
begin
  IsNull := true;
end;

procedure TIBXSQLVAR.SetAsTrimString(const Value: String);
begin
  SetAsString(TrimRight(Value));
end;

procedure TIBXSQLVAR.SetAsCPString(const Value: String; CodePage : Integer);
var
  stype: Integer;
  ss: TBytesStream;
  Encoding : TMBCSEncoding;
  bt : TBytes;

  procedure SetStringValue;
  var
    i: Integer;
    xvar: TIBXSQLVAR;
  begin
    for i := 0 to FParent.FCount - 1 do
      if FParent.FNames[i] = FName then
      begin
        xvar := FParent[i];
        if (xvar.FXSQLVAR.sqlname = 'DB_KEY') or {do not localize}
           (xvar.FXSQLVAR.sqlname = 'RDB$DB_KEY') then {do not localize}
          Move(Value[1], xvar.FXSQLVAR.sqldata^, xvar.FXSQLVAR.sqllen)
        else
        begin
          xvar.FXSQLVAR.sqltype := SQL_TEXT or (FXSQLVAR.sqltype and 1);
          if (FMaxLen > 0) and (Length(bt) > FMaxLen) then
            IBError(ibxeStringTooLarge, [Length(bt), FMaxLen]);
          xvar.FXSQLVAR.sqllen := Length(bt);
          xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen + 1);
          if (Length(bt) > 0) then
            Move(bt[0], xvar.FXSQLVAR.sqldata^, xvar.FXSQLVAR.sqllen);
        end;
        xvar.FModified := True;
      end;
  end;

begin
  if IsNullable then
    IsNull := False;
  stype := FXSQLVAR.SqlDef;
  if (stype = SQL_TEXT) or (stype = SQL_VARYING) then
  begin
    if CodePage <> 0 then
    begin
      Encoding := TMBCSEncoding.Create(CodePage);
      try
        bt := Encoding.GetBytes(Value);
        SetStringValue;
      finally
        Encoding.Free;
      end;
    end
    else
    begin
      bt := BytesOf(AnsiString(Value));
      SetStringValue;
    end
  end
  else
  begin
    if (stype = SQL_BLOB) then
    begin
      if CodePage <> 0 then
      begin
        Encoding := TMBCSEncoding.Create(CodePage);
        ss := TBytesStream.Create(Encoding.GetBytes(Value));
        try
          LoadFromStream(ss);
        finally
          Encoding.Free;
          ss.Free;
        end;
      end
      else
      begin
        ss := TBytesStream.Create(BytesOf(AnsiString(Value)));
        try
          LoadFromStream(ss);
        finally
          ss.Free;
        end;
      end;
    end
    else
      if Value = '' then
        IsNull := True
      else
        if (stype = SQL_TIMESTAMP) or (stype = SQL_TYPE_DATE) or
          (stype = SQL_TYPE_TIME) then
          SetAsDateTime(StrToDateTime(Value))
        else
        begin
          bt := BytesOf(Value);
          SetStringValue;
        end;
  end;
end;

function TIBXSQLVAR.GetAsTrimString: String;
begin
  Result := TrimRight(GetAsString);
end;


function TIBXSQLVAR.GetAsCPString(CodePage : Integer): String;
var
  sz: PAnsiChar;
  str_len: Integer;
  ss: TBytesStream;
  Encoding : TMBCSEncoding;
  b : TBytes;

  function GetBlobCodePage : integer;
  begin
  //  case SQLVar.SQLSubtype of
  //    3 : Result := 65001;  // Unicode_fss
  //    59 : Result := cp_utf8;
  //  else
  //    Result := 20127;   // All the rest as Ansi for now
  //  end;
  //  Result := 20127;   // All the rest as Ansi for now
    Result := 0;
  end;

begin
  result := '';
  { Check null, if so return a default string }
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_ARRAY:
        result := '(Array)'; {do not localize}
      SQL_BLOB:
      begin
        Encoding := TMBCSEncoding.Create(CodePage);
        ss := TBytesStream.Create;
        try
          SaveToStream(ss);
          result := Encoding.GetString(ss.bytes, 0 , ss.Size);
        finally
          encoding.Free;
          ss.Free;
        end;
      end;
      SQL_TEXT, SQL_VARYING: begin
        sz := PAnsiChar(FXSQLVAR.sqldata);
        if (FXSQLVAR.SqlDef = SQL_TEXT) then
          str_len := FXSQLVAR.sqllen
        else
        begin
          str_len := FSQL.Database.GDSLibrary.isc_vax_integer(FXSQLVAR.sqldata, 2);
          Inc(sz, 2);
        end;
        Encoding := TMBCSEncoding.Create(CodePage);
        try
          SetLength(b, str_len);
          move(sz[0], b[0], str_len);
          result := Encoding.GetString(b);
          // for Char datatype, trim the resulting string back down to the max size of the column
          if FXSQLVAR.SqlDef = SQL_TEXT then
            SetLength(Result, str_len div GetCharSetSize);
        finally
          Encoding.Free;
        end;
      end;
      SQL_TYPE_DATE:
        case FSQL.Database.SQLDialect of
          1 : result := DateTimeToStr(AsDateTime);
          3 : result := DateToStr(AsDateTime);
        end;
      SQL_TYPE_TIME :
        result := TimeToStr(AsDateTime);
      SQL_TIMESTAMP:
        result := DateTimeToStr(AsDateTime);
      SQL_SHORT, SQL_LONG:
        if FXSQLVAR.sqlscale = 0 then
          result := IntToStr(AsLong)
        else if FXSQLVAR.sqlscale >= (-4) then
          result := CurrToStr(AsCurrency)
        else
          result := FloatToStr(AsDouble);
      SQL_INT64:
        if FXSQLVAR.sqlscale = 0 then
          result := IntToStr(AsInt64)
        else if FXSQLVAR.sqlscale >= (-4) then
          result := CurrToStr(AsCurrency)
        else
          result := FloatToStr(AsDouble);
      SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
        result := FloatToStr(AsDouble);
      SQL_BOOLEAN:
        if AsBoolean then
          Result := STextTrue
        else
          Result := STextFalse;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsBoolean: Boolean;
begin
  result := false;
  if not IsNull then
    case FXSQLVAR.SqlDef of
      SQL_BOOLEAN:
        Result := PShort(FXSQLVAR.sqldata)^ = ISC_TRUE;
      else
        IBError(ibxeInvalidDataConversion, [nil]);
    end;
end;

function TIBXSQLVAR.GetAsBytes: TBytes;
var
  ss : TBytesStream;
begin
  if FXSQLVAR.SqlDef = SQL_BLOB then
  begin
    ss := TBytesStream.Create;
    try
      SaveToStream(ss);
      result := ss.bytes;
      SetLength(Result, ss.Size);
    finally
      ss.Free;
    end;
  end
  else
    Result := BytesOf(GetAsString);
end;

procedure TIBXSQLVAR.SetAsBoolean(const Value: Boolean);
begin
  if Value then
    PShort(FXSQLVAR.sqldata)^ := ISC_TRUE
  else
    PShort(FXSQLVAR.sqldata)^ := ISC_FALSE;
end;

procedure TIBXSQLVAR.SetAsBytes(const Value: TBytes);
var
  ss : TBytesStream;
begin
  if (FXSQLVAR.SqlDef = SQL_BLOB) then
  begin
    ss := TBytesStream.Create(Value);
    try
      LoadFromStream(ss);
    finally
      ss.Free;
    end;
  end
  else
    AsString := StringOf(Value);
end;

procedure TIBXSQLVAR.SetFXSQLVAR(const Value: TSQLVAR);
var
  i: Integer;
  xvar: TIBXSQLVAR;
  sqlind: PShort;
  sqldata: PByte;
  local_sqllen: Integer;
begin
  for i := 0 to FParent.FCount - 1 do
    if FParent.FNames[i] = FName then
    begin
      xvar := FParent[i];
      sqlind := xvar.FXSQLVAR.sqlind;
      sqldata := xvar.FXSQLVAR.sqldata;
      if xvar.FXSQLVAR is TSQLVAR_V1 then
        move(TSQLVAR_V1(Value).FXSQLVAR^, TSQLVAR_V1(xvar.FXSQLVAR).FXSQLVAR^, sizeof(TXSQLVAR_V1))
      else
        move(TSQLVAR_V2(Value).FXSQLVAR^, TSQLVAR_V2(xvar.FXSQLVAR).FXSQLVAR^, sizeof(TXSQLVAR));
      xvar.FXSQLVAR.sqlind := sqlind;
      xvar.FXSQLVAR.sqldata := sqldata;
      if (Value.sqltype and 1 = 1) then
      begin
        if (xvar.FXSQLVAR.sqlind = nil) then
          xvar.FXSQLVAR.SetIndSize(0, SizeOf(Short));
        xvar.FXSQLVAR.sqlind^ := Value.sqlind^;
      end
      else
        if (xvar.FXSQLVAR.sqlind <> nil) then
          xvar.FXSQLVAR.SetIndSize(0, 0);
      if ((xvar.FXSQLVAR.SqlDef) = SQL_VARYING) then
        local_sqllen := xvar.FXSQLVAR.sqllen + 2
      else
        local_sqllen := xvar.FXSQLVAR.sqllen;
      FXSQLVAR.sqlscale := Value.sqlscale;
      xvar.FXSQLVAR.SetDataSize(0, local_sqllen);
      Move(Value.sqldata[0], xvar.FXSQLVAR.sqldata[0], local_sqllen);
      xvar.FModified := True;
    end;
end;

destructor TIBXSQLVAR.Destroy;
begin
  FreeAndNil(FXSQLVAR);
  inherited;
end;

function TIBXSQLVAR.AdjustScaleToBCD(Value: Int64; Scale: Integer): TBcd;
var
  BCDStr : String;
begin
  BCDStr := Format('%.18d', [Value]);
  BCDStr := Copy(BCDStr, 1, Length(BCDStr) + Scale) + FormatSettings.DecimalSeparator +
            Copy(BCDStr, Length(BCDStr) + Scale + 1, Length(BCDStr));
  Result := StrToBcd(BCDStr);
end;

function TIBXSQLVAR.GetCharsetSize: Integer;
begin
  case SQLVar.SQLSubtype and $FF of
    0, 1, 2, 10, 11, 12, 13, 14, 19, 21, 22, 39,
    45, 46, 47, 50, 51, 52, 53, 54, 55, 58 :  Result := 1;
    5, 6, 8, 44, 56, 57, 64 : Result := 2;
    3 :
    begin
      // System Tables incorrectly state they are in Unicode_Fss character set but they are not
      if POS('RDB$', String(SQLVar.RelName)) = 1 then
        Result := 1
      else
        Result := 3;
    end;
    59 : Result := 4;
    else
      Result := 1;
  end;
end;

function TIBXSQLVAR.GetCodePage: Integer;
begin
//  case SQLVar.SQLSubtype of
//    3 : Result := 65001;  // Unicode_fss
//    59 : Result := cp_utf8;
//  else
//    Result := 20127;   // All the rest as Ansi for now
//  end;
//  Result := 20127;   // All the rest as Ansi for now
  Result := 0;
end;

function TIBXSQLVAR.GetAsBCD: TBcd;
begin
  result := DoubleToBcd(0);
  if FSQL.Database.SQLDialect < 3 then
    result := DoubleToBcd(GetAsDouble)
  else
  begin
    if not IsNull then
      case FXSQLVAR.SqlDef of
        SQL_TEXT, SQL_VARYING: begin
          try
            result := StrtoBcd(AsString);
          except
            on E: Exception do IBError(ibxeInvalidDataConversion, [nil]);
          end;
        end;
        SQL_SHORT:
          result := AdjustScaleToBcd(Int64(PShort(FXSQLVAR.sqldata)^),
                                      FXSQLVAR.sqlscale);
        SQL_LONG:
          result := AdjustScaleToBcd(Int64(PLong(FXSQLVAR.sqldata)^),
                                      FXSQLVAR.sqlscale);
        SQL_INT64:
          result := AdjustScaleToBcd(PInt64(FXSQLVAR.sqldata)^,
                                      FXSQLVAR.sqlscale);
        SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
          result := DoubleToBcd(GetAsDouble);
        else
          IBError(ibxeInvalidDataConversion, [nil]);
      end;
    end;
end;

procedure TIBXSQLVAR.SetAsBcd(const Value: TBcd);
var
  xvar: TIBXSQLVAR;
  i: Integer;

  function AdjustBCDToInt64(Value: TBcd; Scale: Integer): Int64;
  var
    Scaling : Int64;
    i : Integer;
  begin
    Scaling := 1;
    if Scale > 0 then
    begin
      for i := 1 to Scale do
        Scaling := Scaling * 10;
      BcdMultiply(Value, Scaling, Value);
    end
    else
      if Scale < 0 then
      begin
        for i := -1 downto Scale do
          Scaling := Scaling * 10;
        BcdDivide(Value, Scaling, Value);
      end;
    Result := StrToInt64(BcdToStr(Value))
  end;

begin
  if FSQL.Database.SQLDialect < 3 then
    AsDouble := BcdToDouble(Value)
  else
  begin
    if IsNullable then
      IsNull := False;
    for i := 0 to FParent.FCount - 1 do
      if FParent.FNames[i] = FName then
      begin
        xvar := FParent[i];
        xvar.FXSQLVAR.sqltype := SQL_INT64 or (xvar.FXSQLVAR.sqltype and 1);
        xvar.FXSQLVAR.sqlscale := -1 * BcdScale(Value);
        xvar.FXSQLVAR.sqllen := SizeOf(Int64);
        xvar.FXSQLVAR.SetDataSize(0, xvar.FXSQLVAR.sqllen);
        PInt64(xvar.FXSQLVAR.sqldata)^ := AdjustBCDToInt64(Value, BcdScale(Value));
        xvar.FModified := True;
      end;
  end;
end;

{ TIBXSQLDA }
constructor TIBXSQLDA.Create(Query: TIBSQL);
begin
  inherited Create;
  FSQL := Query;
  FNames := TStringList.Create;
  FSize := 0;
  FUniqueRelationName := '';
end;

destructor TIBXSQLDA.Destroy;
var
  i: Integer;
begin
  FNames.Free;
  if FXSQLDA <> nil then
  begin
    for i := 0 to FSize - 1 do
    begin
      FreeMem(FXSQLVARs[i].FXSQLVAR.sqldata);
      FreeMem(FXSQLVARs[i].FXSQLVAR.sqlind);
      FXSQLVARs[i].Free ;
    end;
    FreeMem(FXSQLDA);
    FXSQLDA := nil;
    FXSQLVARs := nil;
  end;
  inherited Destroy;
end;

procedure TIBXSQLDA.AddName(FieldName: String; Idx: Integer);
var
  fn: String;
begin
  fn := FormatIdentifierValue(FSQL.Database.SQLDialect, FieldName);
  while FNames.Count <= Idx do
    FNames.Add('');
  FNames[Idx] := fn;
  FXSQLVARs[Idx].FName := fn;
  FXSQLVARs[Idx].FIndex := Idx;
end;

function TIBXSQLDA.GetModified: Boolean;
var
  i: Integer;
begin
  result := False;
  for i := 0 to FCount - 1 do
    if FXSQLVARs[i].Modified then
    begin
      result := True;
      exit;
    end;
end;

function TIBXSQLDA.GetNames: AnsiString;
begin
  result := AnsiString(FNames.Text);
end;

function TIBXSQLDA.GetRecordSize: Integer;
begin
  result := SizeOf(TIBXSQLDA) + XSQLDA_LENGTH(FSize, FSQL.Database.GDSLibrary.GetIBClientVersion);
end;

function TIBXSQLDA.GetXSQLDA: PXSQLDA;
begin
  result := FXSQLDA;
end;

function TIBXSQLDA.GeTSQLVAR(Idx: Integer): TIBXSQLVAR;
begin
  if (Idx < 0) or (Idx >= FCount) then
    IBError(ibxeXSQLDAIndexOutOfRange, [nil]);
  result := FXSQLVARs[Idx]
end;

function TIBXSQLDA.ByName(Idx: String): TIBXSQLVAR;
begin
  result := GetSQLVARByName(Idx);
  if result = nil then
    IBError(ibxeFieldNotFound, [Idx]);
end;

function TIBXSQLDA.GetSQLVARByName(Idx: String): TIBXSQLVAR;
var
  s: String;
  i, Cnt: Integer;
begin
  s := FormatIdentifierValue(FSQL.Database.SQLDialect, Idx);
  i := 0;
  Cnt := FNames.Count;
  while (i < Cnt) and (FNames[i] <> s) do Inc(i);
  if i = Cnt then
    result := nil
  else
    result := GeTSQLVAR(i);
end;

procedure TIBXSQLDA.Initialize;
var
  i, j, j_len: Integer;
  NamesWereEmpty: Boolean;
  st: AnsiString;
  bUnique: Boolean;
  MetaLength : Integer;
begin
  bUnique := True;
  if FSQL.Database.GDSLibrary.GetIBClientVersion >= 7 then
    MetaLength := 68
  else
    MetaLength := 32;
  NamesWereEmpty := (FNames.Count = 0);
  if FXSQLDA <> nil then
  begin
    for i := 0 to FCount - 1 do
    begin
      with FXSQLVARs[i].Data do
      begin
        if bUnique and (relname <> '') then
        begin
          if FUniqueRelationName = '' then
            FUniqueRelationName := String(relname)
          else
            if relname <> AnsiString(FUniqueRelationName) then
            begin
              FUniqueRelationName := '';
              bUnique := False;
            end;
        end;
        if NamesWereEmpty then
        begin
          st := aliasname;
          if st = '' then
          begin
            st := 'F_'; {do not localize}
            j := 1;
            aliasname := st + AnsiString(IntToStr(j));
          end
          else
          begin
            aliasname := st;
            j := 0;
          end;
          while GetSQLVARByName(String(aliasname)) <> nil do
          begin
            Inc(j); j_len := Length(IntToStr(j));
            if j_len + Length(aliasname) > (METALENGTH - 1) then
              aliasname := Copy(st, 1, (METALENGTH - 1) - j_len) + AnsiString(IntToStr(j))
            else
              aliasname := st + AnsiString(IntToStr(j));
          end;
          AddName(String(aliasname), i);
        end;
        if (SqlDef = SQL_TEXT) or
           (SqlDef = SQL_VARYING) then
          FXSQLVARs[i].FMaxLen := sqllen
        else
          FXSQLVARs[i].FMaxLen := 0;
        case SqlDef of
          SQL_TEXT, SQL_TYPE_DATE, SQL_TYPE_TIME, SQL_TIMESTAMP,
          SQL_BLOB, SQL_ARRAY, SQL_QUAD, SQL_SHORT,
          SQL_LONG, SQL_INT64, SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT, SQL_BOOLEAN:
          begin
            if (sqllen = 0) then
              { Make sure you get a valid pointer anyway
               select '' from foo }
              SetDataSize(0, 1)
            else
              SetDataSize(0, sqllen)
          end;
          SQL_VARYING:
          begin
            SetDataSize(0, sqllen + 2);
          end;
          else
            IBError(ibxeUnknownSQLDataType, [SqlDef])
        end;
        if (sqltype and 1 = 1) then
          SetIndSize(0, SizeOf(Short))
        else
          if (sqlind <> nil) then
            SetIndSize(0, 0);
      end;
    end;
  end;
end;

procedure TIBXSQLDA.SetCount(Value: Integer);
var
  i, OldSize: Integer;
  p : PXSQLVAR;
  XSQLVar_Size : Integer;
  FGDSLibrary : IGDSLibrary;
begin
  FGDSLibrary := FSQL.Database.GDSLibrary;
  FNames.Clear;
  FCount := Value;
  if FCount = 0 then
    FUniqueRelationName := ''
  else
  begin
    if FSize > 0 then
      OldSize := XSQLDA_LENGTH(FSize, FGDSLibrary.GetIBClientVersion)
    else
      OldSize := 0;
    if FCount > FSize then
    begin
      IBAlloc(FXSQLDA, OldSize, XSQLDA_LENGTH(FCount, FGDSLibrary.GetIBClientVersion));
      SetLength(FXSQLVARs, FCount);
      if FGDSLibrary.GetIBClientVersion >= 7 then
      begin
        FXSQLDA^.version := SQLDA_VERSION2;
        XSQLVar_Size := sizeof(TXSQLVAR);
      end
      else
      begin
        FXSQLDA^.version := SQLDA_VERSION1;
        XSQLVar_Size := sizeof(TXSQLVAR_V1);
      end;

      p := @FXSQLDA^.sqlvar[0];
      for i := 0 to FCount - 1 do
      begin
        if i >= FSize then
          FXSQLVARs[i] := TIBXSQLVAR.Create(self, FSQL);
        FXSQLVARs[i].FXSQLVAR.XSqlVar := p;
        p := Pointer(PByte(p) + XSQLVar_Size);
      end;
      FSize := FCount;
    end;
    if FSize > 0 then
    begin
      FXSQLDA^.sqln := Value;
      FXSQLDA^.sqld := Value;
    end;
  end;
end;

{ TIBOutputDelimitedFile }

destructor TIBOutputDelimitedFile.Destroy;
begin
  FFile.Free;
  inherited Destroy;
end;

procedure TIBOutputDelimitedFile.ReadyFile;
var
  i: Integer;
  st: String;
begin
  if FColDelimiter = '' then
    FColDelimiter := TAB;
  if FRowDelimiter = '' then
    FRowDelimiter := CRLF;
  FFile := TFileStream.Create(FFilename, fmCreate or fmShareDenyWrite);
  if FOutputTitles then
  begin
    for i := 0 to Columns.Count - 1 do
      if i = 0 then
        st := String(Columns[i].Data.aliasname)
      else
        st := st + FColDelimiter + String(Columns[i].Data.aliasname);
    st := st + FRowDelimiter;
    FFile.Write(st[1], Length(st) * SizeOf(Char));
  end;
end;

function TIBOutputDelimitedFile.WriteColumns: Boolean;
var
  i: Integer;
  BytesWritten: DWORD;
  st: string;
begin
  result := False;
  if Assigned(FFile) then
  begin
    st := '';
    for i := 0 to Columns.Count - 1 do
    begin
      if i > 0 then
        st := st + FColDelimiter;
      st := st + StripString(Columns[i].AsString, FColDelimiter + FRowDelimiter);
    end;
    st := st + FRowDelimiter;
    BytesWritten := FFile.Write(st[1], Length(st) * sizeof(Char));
    if BytesWritten = DWORD(Length(st) * Sizeof(Char)) then
      result := True;
  end
end;

 { TIBInputDelimitedFile }

destructor TIBInputDelimitedFile.Destroy;
begin
  FFile.Free;
  inherited Destroy;
end;

function TIBInputDelimitedFile.GetColumn(var Col: string): Integer;
var
  c: Char;
  BytesRead: Integer;

  procedure ReadInput;
  begin
    if FLookAhead <> NULL_TERMINATOR then
    begin
      c := FLookAhead;
      BytesRead := 1;
      FLookAhead := NULL_TERMINATOR;
    end else
      BytesRead := FFile.Read(c, 1);
  end;

  procedure CheckCRLF(Delimiter: string);
  begin
    if (c = CR) and (Pos(LF, Delimiter) > 0) then {mbcs ok}
    begin
      BytesRead := FFile.Read(c, 1);
      if (BytesRead = 1) and (c <> #10) then
        FLookAhead := c
    end;
  end;

begin
  Col := '';
  result := 0;
  ReadInput;
  while BytesRead <> 0 do begin
    if Pos(c, FColDelimiter) > 0 then {mbcs ok}
    begin
      CheckCRLF(FColDelimiter);
      result := 1;
      break;
    end else if Pos(c, FRowDelimiter) > 0 then {mbcs ok}
    begin
      CheckCRLF(FRowDelimiter);
      result := 2;
      break;
    end else
      Col := Col + c;
    ReadInput;
  end;
end;

function TIBInputDelimitedFile.ReadParameters: Boolean;
var
  i, curcol: Integer;
  Col: string;
begin
  result := False;
  if not FEOF then
  begin
    curcol := 0;
    repeat
      i := GetColumn(Col);
      if (i = 0) then
        FEOF := True;
      if (curcol < Params.Count) then
      begin
        try
          if (Col = '') and
             (ReadBlanksAsNull) then
            Params[curcol].IsNull := True
          else
            Params[curcol].AsString := Col;
          Inc(curcol);
        except
          on E: Exception do
          begin
            if not (FEOF and (curcol = Params.Count)) then
              raise;
          end;
        end;
      end;
    until (FEOF) or (i = 2);
    result := ((FEOF) and (curcol = Params.Count)) or
              (not FEOF);
  end;
end;

procedure TIBInputDelimitedFile.ReadyFile;
var
  col : String;
  curcol : Integer;
begin
  if FColDelimiter = '' then
    FColDelimiter := TAB;
  if FRowDelimiter = '' then
    FRowDelimiter := CRLF;
  FLookAhead := NULL_TERMINATOR;
  FEOF := False;
  if FFile <> nil then
    FFile.Free;
  FFile := TFileStream.Create(FFilename, fmOpenRead or fmShareDenyWrite);
  if FSkipTitles then
  begin
    curcol := 0;
    while curcol < Params.Count do
    begin
      GetColumn(Col);
      Inc(CurCol)
    end;
  end;
end;

{ TIBOutputRawFile }
destructor TIBOutputRawFile.Destroy;
begin
  FFile.Free;
  inherited Destroy;
end;

procedure TIBOutputRawFile.ReadyFile;
begin
  if Assigned(FFile) then
    FreeAndNil(FFile);
  FFile := TFileStream.Create(Filename, fmCreate);
end;

function TIBOutputRawFile.WriteColumns: Boolean;
var
  i: Integer;
  BytesWritten, BytesToWrite : LongInt;
  SQLVar : TSQLVAR;
  bs : TMemoryStream;
begin
  result := False;
  if Assigned(FFile) then
  begin
    for i := 0 to Columns.Count - 1 do
    begin
      SQLVar := Columns[i].Data;
      case SQLVar.SqlDef of
        SQL_VARYING:
        begin
          BytesToWrite := SQLVar.sqllen + 2;
          BytesWritten := FFile.Write(SQLVar.sqldata^, BytesToWrite);
          if (BytesWritten <> BytesToWrite) then
            exit;
        end;
        SQL_BLOB:
        begin
          bs := TMemoryStream.Create;
          try
            Columns[i].SaveToStream(bs);
            BytesToWrite := bs.Size;
            FFile.Write(BytesToWrite, sizeof(BytesToWrite));
            BytesWritten := FFile.CopyFrom(bs, 0);
            if BytesWritten <> BytesToWrite then
            begin
              FreeAndNil(bs);
              exit;
            end;
          finally
            bs.Free;
          end;
        end;
        else
        begin
          BytesWritten := FFile.Write(SQLVar.sqldata^, SQLVar.sqllen);
          if BytesWritten <> SQLVar.sqllen then
            exit;
        end;
      end;
      // Have to write out the nil indicator
      FFile.Write(SQLVar.sqlind^, sizeof(SQLVar.sqlind));
    end;
    result := True;
  end;
end;

{ TIBInputRawFile }
destructor TIBInputRawFile.Destroy;
begin
  FFile.Free;
  inherited Destroy;
end;

function TIBInputRawFile.ReadParameters: Boolean;
var
  i: Integer;
  BytesRead, BytesToRead : LongInt;
  SQLVar : TSQLVAR;
  bs: TMemoryStream;
begin
  result := False;
  if Assigned(FFile) then
  begin
    for i := 0 to Params.Count - 1 do
    begin
      SQLVar := Params[i].Data;

      case SQLVar.SqlDef of
        SQL_VARYING:
        begin
          BytesToRead := SQLVar.sqllen + 2;
          BytesRead := FFile.Read(SQLVar.sqldata^, BytesToRead);
          if BytesRead <> BytesToRead then
            Exit;
        end;
        SQL_BLOB:
        begin
          bs := TMemoryStream.Create;
          try
            FFile.Read(BytesToRead, sizeof(BytesToRead));
            if BytesToRead = 0 then
              SQLVar.sqlind^ := -1
            else
            begin
              BytesRead := bs.CopyFrom(FFile, BytesToRead);
              if BytesRead <> BytesToRead then
              begin
                FreeAndNil(bs);
                Exit;
              end;
              bs.Position := 0;
              Params[i].LoadFromStream(bs);
            end;
          finally
            bs.Free;
          end;
        end;
        else
        begin
          BytesRead := FFile.Read(SQLVar.sqldata^, SQLVar.sqllen);
          if BytesRead <> SQLVar.sqllen then
            exit;
        end;
      end;
      // Have to read in the nil indicator
      FFile.Read(SQLVar.sqlind^, sizeof(SQLVar.sqlind));
    end;
    result := True;
  end;
end;

procedure TIBInputRawFile.ReadyFile;
begin
  if Assigned(FFile)  then
    FreeAndNil(FFile);
  FFile := TFileStream.Create(FileName, fmOpenRead);
end;

{ TIBSQL }
constructor TIBSQL.Create(AOwner: TComponent);
var
  GUID : TGUID;
begin
  inherited Create(AOwner);
  FGenerateParamNames := False;
  FGoToFirstRecordOnExecute := True;
  FBase := TIBBase.Create(Self);
  FBase.BeforeDatabaseDisconnect := DoBeforeDatabaseDisconnect;
  FBase.BeforeTransactionEnd := BeforeTransactionEnd;
  if AOwner is TIBDatabase then
    Database := TIBDatabase(AOwner)
  else
    if AOwner is TIBTransaction then
      Transaction := TIBTransaction(AOwner);
  FBOF := False;
  FEOF := False;
  FPrepared := False;
  FRecordCount := 0;
  FSQL := TStringList.Create;
  TStringList(FSQL).OnChanging := SQLChanging;
  FProcessedSQL := TStringList.Create;
  FHandle := nil;
  FSQLParams := TIBXSQLDA.Create(self);
  FSQLRecord := TIBXSQLDA.Create(self);
  FSQLType := SQLUnknown;
  FParamCheck := True;
  CreateGuid(GUID);
  FCursor := AnsiString(GUIDToString(GUID));
end;

destructor TIBSQL.Destroy;
begin

  if (FOpen) then
    InternalClose(false);
  if (FHandle <> nil) then
    InternalFreeHandle(false);
  FSQL.Free;
  FProcessedSQL.Free;
  FBase.Free;
  FSQLParams.Free;
  FSQLRecord.Free;

  inherited Destroy;
end;

procedure TIBSQL.BatchInput(InputObject: TIBBatchInput);
begin
  if not Prepared then
    Prepare;
  InputObject.Params := Self.FSQLParams;
  InputObject.ReadyFile;
  if FSQLType in [SQLInsert, SQLUpdate, SQLDelete, SQLExecProcedure] then
    while InputObject.ReadParameters do
      ExecQuery;
end;

procedure TIBSQL.BatchOutput(OutputObject: TIBBatchOutput);
begin
  CheckClosed;
  if not Prepared then
    Prepare;
  if FSQLType = SQLSelect then begin
    try
      ExecQuery;
      OutputObject.Columns := Self.FSQLRecord;
      OutputObject.ReadyFile;
      if not FGoToFirstRecordOnExecute then
        Next;
      while (not Eof) and (OutputObject.WriteColumns) do
        Next;
    finally
      Close;
    end;
  end;
end;

procedure TIBSQL.CheckClosed;
begin
  if FOpen then IBError(ibxeSQLOpen, [nil]);
end;

procedure TIBSQL.CheckOpen;
begin
  if not FOpen then IBError(ibxeSQLClosed, [nil]);
end;

procedure TIBSQL.CheckValidStatement;
begin
  FBase.CheckTransaction;
  if (FHandle = nil) then
    IBError(ibxeInvalidStatementHandle, [nil]);
end;

procedure TIBSQL.Close;
begin
  InternalClose(true);
end;

function TIBSQL.Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
begin
  result := 0;
  if Transaction <> nil then
    result := Transaction.Call(ErrCode, RaiseError)
  else
    if RaiseError and (ErrCode > 0) then
      IBDataBaseError(Database.GDSLibrary);
end;

function TIBSQL.Current: TIBXSQLDA;
begin
  result := FSQLRecord;
end;

procedure TIBSQL.DoBeforeDatabaseDisconnect(Sender: TObject);
begin
  if (FHandle <> nil) then
  begin
    Close;
    FreeHandle;
  end;
end;

procedure TIBSQL.ExecQuery;
var
  fetch_res: ISC_STATUS;
begin
  CheckClosed;
  if not Prepared then
    Prepare;
  CheckValidStatement;
  if (not (csDesigning in ComponentState)) and
     (MonitorHook <> nil) then
    MonitorHook.SQLExecute(Self);
  case FSQLType of
    SQLSelect:
    begin
      Call(Database.GDSLibrary.isc_dsql_execute2(StatusVector, TRHandle, @FHandle,
                         Database.SQLDialect, FSQLParams.AsXSQLDA, nil), True);
      Call(
        Database.GDSLibrary.isc_dsql_set_cursor_name(StatusVector, @FHandle, PByte(FCursor), 0),
        True);
      FOpen := True;
      FBOF := True;
      FEOF := False;
      FRecordCount := 0;
      if FGoToFirstRecordOnExecute then
        Next;
    end;
    SQLExecProcedure:
    begin
      fetch_res := Call(Database.GDSLibrary.isc_dsql_execute2(StatusVector, TRHandle,
                            @FHandle, Database.SQLDialect, FSQLParams.AsXSQLDA,
                            FSQLRecord.AsXSQLDA), False);
      if (fetch_res <> 0) then
      begin
        if (fetch_res = isc_bad_stmt_handle) then
        begin
           { Sometimes a prepared stored procedure appears to get
             off sync on the server ....This code is meant to try
             to work around the problem simply by "retrying". This
             need to be reproduced and fixed.
           }
          Database.GDSLibrary.isc_dsql_prepare(StatusVector, TRHandle, @FHandle, 0,
                          PByte(FProcessedSQL.Text), Database.SQLDialect, nil);
          Call(Database.GDSLibrary.isc_dsql_execute2(StatusVector, TRHandle,
                             @FHandle, Database.SQLDialect, FSQLParams.AsXSQLDA,
                             FSQLRecord.AsXSQLDA), true);
        end
        else
          IBDataBaseError(Database.GDSLibrary);  // go ahead and raise the lock conflict
      end;
    end
    else
      Call(Database.GDSLibrary.isc_dsql_execute(StatusVector, TRHandle, @FHandle,
                           Database.SQLDialect, FSQLParams.AsXSQLDA), True)
  end;
end;

function TIBSQL.GetEOF: Boolean;
begin
  result := FEOF or not FOpen;
end;

function TIBSQL.FieldByName(FieldName: String): TIBXSQLVAR;
var
  i: Integer;
begin
  i := GetFieldIndex(FieldName);
  if (i < 0) then
    IBError(ibxeFieldNotFound, [FieldName]);
  result := GetFields(i);
end;

function TIBSQL.GetFields(const Idx: Integer): TIBXSQLVAR;
begin
  if (Idx < 0) or (Idx >= FSQLRecord.Count) then
    IBError(ibxeFieldNotFound, [IntToStr(Idx)]);
  result := FSQLRecord[Idx];
end;

function TIBSQL.GetFieldIndex(FieldName: String): Integer;
begin
  if (FSQLRecord.GetSQLVARByName(FieldName) = nil) then
    result := -1
  else
    result := FSQLRecord.GetSQLVARByName(FieldName).Index;
end;

function TIBSQL.Next: TIBXSQLDA;
var
  fetch_res: ISC_STATUS;
begin
  result := nil;
  if not FEOF then
  begin
    CheckOpen;
    { Go to the next record... }
    fetch_res :=
      Call(Database.GDSLibrary.isc_dsql_fetch(StatusVector, @FHandle, Database.SQLDialect,
                    FSQLRecord.AsXSQLDA), False);
    if (fetch_res = 100) or (CheckStatusVector([isc_dsql_cursor_err])) then
    begin
      FEOF := True;
    end
    else
      if (fetch_res > 0) then
      begin
        try
          IBDataBaseError(Database.GDSLibrary);
        except
          Close;
          raise;
        end;
      end
      else
      begin
        Inc(FRecordCount);
        FBOF := False;
        result := FSQLRecord;
      end;
    if (not (csDesigning in ComponentState)) and
       (MonitorHook <> nil) then
      MonitorHook.SQLFetch(Self);
  end;
end;

procedure TIBSQL.FreeHandle;
begin
  InternalFreeHandle(true);
end;

function TIBSQL.GetDatabase: TIBDatabase;
begin
  result := FBase.Database;
end;

function TIBSQL.GetDBHandle: PISC_DB_HANDLE;
begin
  result := FBase.DBHandle;
end;

function TIBSQL.GetPlan: String;
var
  result_buffer: array[0..16384] of AnsiChar;
  result_length, i: Integer;
  info_request: Byte;
  TempResult : AnsiString;  // InterBase plans will be Ansi Char
begin
  if (not Prepared) or
     (not (FSQLType in [SQLSelect, SQLSelectForUpdate,
                                 
       SQLUpdate, SQLDelete])) then
    result := ''
  else
  begin
    info_request := Byte(isc_info_sql_get_plan);
    Call(Database.GDSLibrary.isc_dsql_sql_info(StatusVector, @FHandle, 2, @info_request,
                           SizeOf(result_buffer), @result_buffer), True);
    if (result_buffer[0] <> Char(isc_info_sql_get_plan)) then
      raise EIBPlanError.Create(Ord(ibxeUnknownPlan),
                              Format(IBErrorMessages[ibxeUnknownPlan], [nil]));
    result_length := Database.GDSLibrary.isc_vax_integer(@result_buffer[1], 2);
    SetString(TempResult, nil, result_length);
    for i := 1 to result_length do
      TempResult[i] := result_buffer[i + 2];
    TempResult := AnsiString(Trim(String(TempResult)));
  end;
  Result := String(TempResult);
end;

function TIBSQL.GetRecordCount: Integer;
begin
  result := FRecordCount;
end;

function TIBSQL.GetRowsAffected: integer;
var
  result_buffer: array[0..1048] of Byte;
  info_request: Char;
begin
  if not Prepared then
    result := -1
  else begin
    info_request := Char(isc_info_sql_records);
    if Database.GDSLibrary.isc_dsql_sql_info(StatusVector, @FHandle, 1, @info_request,
                         SizeOf(result_buffer), @result_buffer) > 0 then
      IBDatabaseError(Database.GDSLibrary);
    if (result_buffer[0] <> Byte(isc_info_sql_records)) then
      result := -1
    else
    case SQLType of
      SQLUpdate:   Result := Database.GDSLibrary.isc_vax_integer(@result_buffer[6], 4);
      SQLDelete:   Result := Database.GDSLibrary.isc_vax_integer(@result_buffer[13], 4);
      SQLInsert:   Result := Database.GDSLibrary.isc_vax_integer(@result_buffer[27], 4);
    else
      Result := -1;
    end ;
  end;
end;

function TIBSQL.GetSQLParams: TIBXSQLDA;
var
  FTransactionStarted : Boolean;
begin
  FTransactionStarted := not Transaction.InTransaction;
  if FTransactionStarted then
    Transaction.StartTransaction;
  if not Prepared then
    Prepare;
  result := FSQLParams;
  if FTransactionStarted then
    Transaction.Commit;
end;

function TIBSQL.GetTransaction: TIBTransaction;
begin
  result := FBase.Transaction;
end;

function TIBSQL.GetTRHandle: PISC_TR_HANDLE;
begin
  result := FBase.TRHandle;
end;

{
 Preprocess SQL
 Using FSQL, process the typed SQL and put the process SQL
 in FProcessedSQL and parameter names in FSQLParams
}
procedure TIBSQL.PreprocessSQL;
var
  cCurChar, cNextChar, cQuoteChar: Char;
  sSQL, sProcessedSQL, sParamName: String;
  i, iLenSQL, iSQLPos: Integer;
  iCurState, iCurParamState: Integer;
  iParamSuffix: Integer;
  slNames: TStrings;

const
  DefaultState = 0;
  CommentState = 1;
  QuoteState = 2;
  ParamState = 3;
  ParamDefaultState = 0;
  ParamQuoteState = 1;

  procedure AddToProcessedSQL(cChar: Char);
  begin
    sProcessedSQL[iSQLPos] := cChar;
    Inc(iSQLPos);
  end;

begin
  slNames := TStringList.Create;
  try
    { Do some initializations of variables }
    iParamSuffix := 0;
    cQuoteChar := '''';
    sSQL := FSQL.Text;
    iLenSQL := Length(sSQL);
    SetString(sProcessedSQL, nil, iLenSQL + 1);
    i := 1;
    iSQLPos := 1;
    iCurState := DefaultState;
    iCurParamState := ParamDefaultState;
    { Now, traverse through the SQL string, character by character,
     picking out the parameters and formatting correctly for InterBase }
    while (i <= iLenSQL) do begin
      { Get the current token and a look-ahead }
      cCurChar := sSQL[i];
      if i = iLenSQL then
        cNextChar := #0
      else
        cNextChar := sSQL[i + 1];
      { Now act based on the current state }
      case iCurState of
        DefaultState: begin
          case cCurChar of
            '''', '"': begin
              cQuoteChar := cCurChar;
              iCurState := QuoteState;
            end;
            '?', ':': begin
              iCurState := ParamState;
              AddToProcessedSQL('?');
            end;
            '/': if (cNextChar = '*') then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
              iCurState := CommentState;
            end;
          end;
        end;
        CommentState: begin
          if (cNextChar = #0) then
            IBError(ibxeSQLParseError, [SEOFInComment])
          else if (cCurChar = '*') then begin
            if (cNextChar = '/') then
              iCurState := DefaultState;
          end;
        end;
        QuoteState: begin
          if cNextChar = #0 then
            IBError(ibxeSQLParseError, [SEOFInString])
          else if (cCurChar = cQuoteChar) then begin
            if (cNextChar = cQuoteChar) then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
            end else
              iCurState := DefaultState;
          end;
        end;
        ParamState:
        begin
          { collect the name of the parameter }
          if iCurParamState = ParamDefaultState then
          begin
            if cCurChar = '"' then
              iCurParamState := ParamQuoteState
            else
              if CharInSet(cCurChar, ['A'..'Z', 'a'..'z', '0'..'9', '_', '$']) then  {do not localize}
                sParamName := sParamName + cCurChar
            else if FGenerateParamNames then
            begin
              sParamName := 'IBXParam' + IntToStr(iParamSuffix); {do not localize}
              Inc(iParamSuffix);
              iCurState := DefaultState;
              slNames.Add(sParamName);
              sParamName := '';
            end
            else
              IBError(ibxeSQLParseError, [SParamNameExpected]);
          end
          else begin
            { determine if Quoted parameter name is finished }
            if cCurChar = '"' then
            begin
              Inc(i);
              slNames.Add(sParamName);
              SParamName := '';
              iCurParamState := ParamDefaultState;
              iCurState := DefaultState;
            end
            else
              sParamName := sParamName + cCurChar
          end;
          { determine if the unquoted parameter name is finished }
          if (iCurParamState <> ParamQuoteState) and
            (iCurState <> DefaultState) then
          begin
            if not CharInSet(cNextChar, ['A'..'Z', 'a'..'z', '0'..'9', '_', '$']) then  {do not localize}
            begin
              Inc(i);
              iCurState := DefaultState;
              slNames.Add(sParamName);
              sParamName := '';
            end;
          end;
        end;
      end;
      if iCurState <> ParamState then
        AddToProcessedSQL(sSQL[i]);
      Inc(i);
    end;
    AddToProcessedSQL(#0);
    FSQLParams.Count := slNames.Count;
    for i := 0 to slNames.Count - 1 do
      FSQLParams.AddName(slNames[i], i);
    FProcessedSQL.Text := sProcessedSQL;
  finally
    slNames.Free;
  end;
end;

procedure TIBSQL.SetDatabase(Value: TIBDatabase);
begin
  if (FBase <> nil) and (FBase.Database <> Value) then
    FBase.Database := Value;
end;

procedure TIBSQL.Prepare;
var
  stmt_len: Integer;
  res_buffer: array[0..7] of Byte;
  type_item: Byte;
  bt : TBytes;
  Encoding : TMBCSEncoding;
  FGDSLibrary : IGDSLibrary;
begin
  CheckClosed;
  FBase.CheckDatabase;
  FBase.CheckTransaction;
  if FPrepared then
    exit;

  FGDSLibrary := Database.GDSLibrary;
  if (FSQL.Text = '') then
    IBError(ibxeEmptyQuery, [nil]);
  if not ParamCheck then
    FProcessedSQL.Text := FSQL.Text
  else
    PreprocessSQL;
  if (FProcessedSQL.Text = '') then
    IBError(ibxeEmptyQuery, [nil]);
  try
    Call(FGDSLibrary.isc_dsql_alloc_statement2(StatusVector, DBHandle,
                                    @FHandle), True);
    if Database.CharacterSetCodePage = 0 then
      Encoding := nil
    else
      Encoding := TMBCSEncoding.Create(Database.CharacterSetCodePage);
    try
      if Assigned(Encoding) then
        bt := Encoding.GetBytes(FProcessedSQL.Text + #0)
      else
        bt := BytesOf(AnsiString(FProcessedSQL.Text) + #0);
      try
        Call(FGDSLibrary.isc_dsql_prepare(StatusVector, TRHandle, @FHandle, 0,
                   PByte(bt), Database.SQLDialect, nil), True);
      except
        SetLength(bt, 0);
        raise;
      end;
    finally
      FreeAndNil(Encoding);
    end;
    { After preparing the statement, query the stmt type and possibly
      create a FSQLRecord "holder" }
    { Get the type of the statement }
    type_item := Byte(isc_info_sql_stmt_type);
    Call(FGDSLibrary.isc_dsql_sql_info(StatusVector, @FHandle, 1, @type_item,
                         SizeOf(res_buffer), @res_buffer), True);
    if (res_buffer[0] <> Byte(isc_info_sql_stmt_type)) then
      IBError(ibxeUnknownError, [nil]);
    stmt_len := FGDSLibrary.isc_vax_integer(@res_buffer[1], 2);
    FSQLType := TIBSQLTypes(FGDSLibrary.isc_vax_integer(@res_buffer[3], stmt_len));
                             
    case FSQLType of
      SQLGetSegment,
      SQLPutSegment,
      SQLStartTransaction:
      begin
        FreeHandle;
        IBError(ibxeNotPermitted, [nil]);
      end;
      SQLCommit,
      SQLRollback,
      SQLDDL, SQLSetGenerator,
      SQLInsert, SQLUpdate, SQLDelete, SQLSelect, SQLSelectForUpdate,
      SQLExecProcedure:
      begin
        { We already know how many inputs there are, so... }
        if (FSQLParams.FXSQLDA <> nil) and
           (Call(FGDSLibrary.isc_dsql_describe_bind(StatusVector, @FHandle, Database.SQLDialect,
                                        FSQLParams.FXSQLDA), False) > 0) then
          IBDataBaseError(FGDSLibrary);
        FSQLParams.Initialize;
        if FSQLType in [SQLSelect, SQLSelectForUpdate,
                        SQLExecProcedure] then
        begin
          { Allocate an initial output descriptor (with one column) }
          FSQLRecord.Count := 1;
          { Using isc_dsql_describe, get the right size for the columns... }
          Call(FGDSLibrary.isc_dsql_describe(StatusVector, @FHandle, Database.SQLDialect, FSQLRecord.FXSQLDA), True);
          if FSQLRecord.FXSQLDA^.sqld > FSQLRecord.FXSQLDA^.sqln then
          begin
            FSQLRecord.Count := FSQLRecord.FXSQLDA^.sqld;
            Call(FGDSLibrary.isc_dsql_describe(StatusVector, @FHandle, Database.SQLDialect, FSQLRecord.FXSQLDA), True);
          end
          else
            if FSQLRecord.FXSQLDA^.sqld = 0 then
              FSQLRecord.Count := 0;
          FSQLRecord.Initialize;
        end;
      end;
    end;
    FPrepared := True;
    if (not (csDesigning in ComponentState)) and
       (MonitorHook <> nil) then
      MonitorHook.SQLPrepare(Self);
  except
    on E: Exception do
    begin
      if (FHandle <> nil) then
        FreeHandle;
      raise;
    end;
  end;
end;

function TIBSQL.GetUniqueRelationName: String;
begin
  if FPrepared and (FSQLType = SQLSelect) then
    result := FSQLRecord.UniqueRelationName
  else
    result := '';
end;

procedure TIBSQL.SetSQL(Value: TStrings);
begin
  if FSQL.Text <> Value.Text then
  begin
    FSQL.BeginUpdate;
    try
      FSQL.Assign(Value);
    finally
      FSQL.EndUpdate;
    end;
  end;
end;

procedure TIBSQL.SetTransaction(Value: TIBTransaction);
begin
  if Assigned(FBase) and (FBase.Transaction <> Value) then
  begin
    if Prepared then
      FreeHandle;
    FBase.Transaction := Value;
  end;
end;

procedure TIBSQL.SQLChanging(Sender: TObject);
begin
  if Assigned(OnSQLChanging) then
    OnSQLChanging(Self);
  if FHandle <> nil then FreeHandle;
end;

procedure TIBSQL.BeforeTransactionEnd(Sender: TObject);
begin
  if (FOpen) then
    Close;
end;

function TIBSQL.ParamByName(Idx: String): TIBXSQLVAR;
begin
  if not Prepared then
    Prepare;
  result := FSQLParams.ByName(Idx);
end;

procedure TIBSQL.InternalClose(RaiseException : Boolean);
var
  isc_res: ISC_STATUS;
begin
  try
    if (FHandle <> nil) and (SQLType = SQLSelect) and FOpen and
       (Database.Connected) then
    begin
      isc_res := Call(Database.GDSLibrary.isc_dsql_free_statement(StatusVector, @FHandle, DSQL_close), False);
      if (StatusVector^ = 1) and (isc_res > 0) and
         not CheckStatusVector([isc_bad_stmt_handle, isc_dsql_cursor_close_err])
         and RaiseException then
      begin
        if isc_res = isc_lost_db_connection then
          FBase.Database.Call(isc_res, true)
        else
          IBDatabaseError(Database.GDSLibrary);
      end;
    end;
  finally
    FEOF := False;
    FBOF := False;
    FOpen := False;
    FRecordCount := 0;
  end;
end;

procedure TIBSQL.InternalFreeHandle(RaiseException : Boolean);
var
  isc_res: ISC_STATUS;
begin
  try
    { The following two lines merely set the SQLDA count
     variable FCount to 0, but do not deallocate
     That way the allocations can be reused for
     a new query sring in the same SQL instance }
    //    FSQLRecord.Count := 0;
    //    FSQLParams.Count := 0;
    if (FHandle <> nil) and Database.Connected then
    begin
      isc_res := Call(Database.GDSLibrary.isc_dsql_free_statement(StatusVector, @FHandle, DSQL_drop), False);
      if (StatusVector^ = 1) and (isc_res > 0) and (isc_res <> isc_bad_stmt_handle)
         and (isc_res <> isc_lost_db_connection) and RaiseException then
        IBDataBaseError(Database.GDSLibrary);
    end;
  finally
    FPrepared := False;
    FHandle := nil;
  end;
end;

procedure TIBSQL.OutputXML(OutputObject: TIBOutputXML);
var
  OldGotoValue : Boolean;
begin
  CheckClosed;
  if not Prepared then
    Prepare;
  if FSQLType = SQLSelect then
  begin
    OldGotoValue := FGoToFirstRecordOnExecute;
    FGoToFirstRecordOnExecute := false;
    ExecQuery;
    try
      OutputObject.WriteXML(self);
    finally
      Close;
      FGoToFirstRecordOnExecute := OldGotoValue;
    end;
  end;
end;

function TIBSQL.GetFieldCount: Integer;
begin
  Result := Current.Count;
end;

procedure TIBSQL.Unprepare;
begin
  FreeHandle;
end;

{ TIBOutputXML }

procedure TIBOutputXML.WriteXML(SQL : TIBSQL);
var
  xmlda : Tib_xmlda;
  buffer : PAnsiChar;
  buffer_size, size : Integer;
  done : Boolean;
begin
  xmlda.xmlda_status := 0;
  xmlda.xmlda_version := 1;
  if FHeaderTag <> '' then
    xmlda.xmlda_header_tag := PAnsiChar(FHeaderTag)
  else
    xmlda.xmlda_header_tag := '<?xml version = "1.0"?>' + #10#13 + '<!-- XML from IB -->' + #10#13; {do not localize}
  xmlda.xmlda_database_tag := PAnsiChar(FDatabaseTag);
  xmlda.xmlda_table_tag := PAnsiChar(FTableTag);
  xmlda.xmlda_row_tag := PAnsiChar(FRowTag);
  xmlda.xmlda_flags := 0;

  if xmlAttribute in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_ATTRIBUTE_FLAG);
  if xmlDisplayNull in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_DISPLAY_NULL_FLAG);
  if xmlNoHeader in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_NO_HEADER_FLAG);


  buffer_size := 1024;
  GetMem(buffer, buffer_size);
  xmlda.xmlda_file_name := PAnsiChar('');

  try
    done := false;
    while not done do
    begin
      size := SQL.Call(isc_dsql_xml_buffer_fetch(StatusVector,
        @SQL.Handle, buffer, buffer_size, 1, SQL.Current.AsXSQLDA, @xmlda), false);
      case size of
        ERR_BUFFERSIZE_NOT_ENOUGH :
        begin
          Inc(buffer_size, 1024);
          if Assigned(Buffer) then
            ReallocMem(buffer, buffer_size)
          else
            GetMem(buffer, buffer_size);
        end;
        ERR_NOT_ENOUGH_MEMORY :
          raise EIBClientError.Create(0, SIBMemoryError);
        else
        begin
          FStream.WriteBuffer(Buffer^, Size);
          Done := xmlda.xmlda_more_data = 0;
        end;
      end;
    end;
  finally
    FreeMem(buffer, buffer_size);
  end;
end;

procedure OutputXML(sqlObject : TIBSQL; OutputObject: TIBOutputXML);
var
  OldGotoValue : Boolean;
begin
  sqlObject.CheckClosed;
  if not sqlObject.Prepared then
    sqlObject.Prepare;
  if sqlObject.SQLType = SQLSelect then
  begin
    OldGotoValue := sqlObject.GoToFirstRecordOnExecute;
    sqlObject.GoToFirstRecordOnExecute := false;
    sqlObject.ExecQuery;
    try
      OutputObject.WriteXML(sqlObject);
    finally
      sqlObject.Close;
      sqlObject.GoToFirstRecordOnExecute := OldGotoValue;
    end;
  end;
end;

{ TSQLVAR_V1 }

function TSQLVAR_V1.GetAliasName: AnsiString;
begin
  SetString(Result, FXSQLVAR.aliasname, FXSQLVAR.aliasname_length);
end;

function TSQLVAR_V1.GetOwnName: AnsiString;
begin
  SetString(Result, FXSQLVAR.ownname, FXSQLVAR.ownname_length);
end;

function TSQLVAR_V1.GetRelName: AnsiString;
begin
  SetString(Result, FXSQLVAR.relname, FXSQLVAR.relname_length);
end;

function TSQLVAR_V1.GetSqlData: PByte;
begin
  Result := FXSQLVAR.sqldata;
end;

function TSQLVAR_V1.GetSqlInd: PShort;
begin
  Result := FXSQLVAR.sqlind;
end;

function TSQLVAR_V1.GetSqlLen: Short;
begin
  Result := FXSQLVAR.sqllen;
end;

function TSQLVAR_V1.GetSqlName: AnsiString;
begin
  SetString(Result, FXSQLVAR.sqlname, FXSQLVAR.sqlname_length);
end;

function TSQLVAR_V1.GetSqlPrecision: Short;
begin
  case sqltype and not 1 of
    SQL_SHORT:
      Result := 4;
    SQL_LONG:
      Result := 9;
    SQL_INT64:
      Result := 18;
    else
      Result := 0;
  end;
end;

function TSQLVAR_V1.GetSqlScale: Short;
begin
  Result := FXSQLVAR.sqlscale;
end;

function TSQLVAR_V1.GetSqlSubtype: Short;
begin
  Result := FXSQLVAR.sqlsubtype;
end;

function TSQLVAR_V1.GetSqlType: Short;
begin
  Result := FXSQLVAR.sqltype;
end;

function TSQLVAR_V1.GetSQLVAR: Pointer;
begin
  Result := FXSQLVAR;
end;

procedure TSQLVAR_V1.SetAliasName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.aliasname, Value);
  FXSQLVAR^.aliasname_length := Length(Value);
end;

procedure TSQLVAR_V1.SetDataSize(oldsize, newsize: Integer);
begin
  IBAlloc(FXSQLVAR^.sqldata, oldsize, newsize);
end;

procedure TSQLVAR_V1.SetIndSize(oldsize, newsize: Integer);
begin
  IBAlloc(FXSQLVAR^.sqlind, oldsize, newsize);
end;

procedure TSQLVAR_V1.SetOwnName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.ownname, Value);
  FXSQLVAR^.ownname_length := Length(Value);
end;

procedure TSQLVAR_V1.SetRelName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.relname, Value);
  FXSQLVAR^.relname_length := Length(Value);
end;

procedure TSQLVAR_V1.SetSqlData(const Value: PByte);
begin
  FXSQLVAR.sqldata := Value;
end;

procedure TSQLVAR_V1.SetSqlInd(const Value: PShort);
begin
  FXSQLVAR.sqlInd := Value
end;

procedure TSQLVAR_V1.SetSqlLen(const Value: Short);
begin
  FXSQLVAR.sqlLen := Value
end;

procedure TSQLVAR_V1.SetSqlName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.sqlname, Value);
  FXSQLVAR^.sqlname_length := Length(Value);
end;

procedure TSQLVAR_V1.SetSqlPrecision(const Value: Short);
begin
  IBError(ibxeNotSupported, []);
end;

procedure TSQLVAR_V1.SetSqlScale(const Value: Short);
begin
  FXSQLVAR.sqlscale := Value
end;

procedure TSQLVAR_V1.SetSqlSubtype(const Value: Short);
begin
  FXSQLVAR.sqlsubtype := Value
end;

procedure TSQLVAR_V1.SetSqlType(const Value: Short);
begin
  FXSQLVAR.sqltype := Value
end;

procedure TSQLVAR_V1.SetSQLVAR(const Value: Pointer);
begin
  Move(Value, FXSQLVAR, Sizeof(TSQLVAR_V1));
end;


{ TSQLVAR_V2 }

function TSQLVAR_V2.GetAliasName: AnsiString;
begin
  SetString(Result, FXSQLVAR.aliasname, FXSQLVAR.aliasname_length);
end;

function TSQLVAR_V2.GetOwnName: AnsiString;
begin
  SetString(Result, FXSQLVAR.ownname, FXSQLVAR.ownname_length);
end;

function TSQLVAR_V2.GetRelName: AnsiString;
begin
  SetString(Result, FXSQLVAR.relname, FXSQLVAR.relname_length);
end;

function TSQLVAR_V2.GetSqlData: PByte;
begin
  Result := FXSQLVAR.sqldata;
end;

function TSQLVAR_V2.GetSqlInd: PShort;
begin
  Result := FXSQLVAR.sqlind;
end;

function TSQLVAR_V2.GetSqlLen: Short;
begin
  Result := FXSQLVAR.sqllen;
end;

function TSQLVAR_V2.GetSqlName: AnsiString;
begin
  SetString(Result, FXSQLVAR.sqlname, FXSQLVAR.sqlname_length);
end;

function TSQLVAR_V2.GetSqlPrecision: Short;
begin
  Result := FXSQLVAR.sqlprecision;
  if Result = 0 then
    case sqltype and not 1 of
      SQL_SHORT:
        Result := 4;
      SQL_LONG:
        Result := 9;
      SQL_INT64:
        Result := 18;
      else
        Result := 0;
    end;
end;

function TSQLVAR_V2.GetSqlScale: Short;
begin
  Result := FXSQLVAR.sqlscale;
end;

function TSQLVAR_V2.GetSqlSubtype: Short;
begin
  Result := FXSQLVAR.sqlsubtype;
end;

function TSQLVAR_V2.GetSqlType: Short;
begin
  Result := FXSQLVAR.sqltype;
end;

function TSQLVAR_V2.GetSQLVAR: Pointer;
begin
  Result := FXSQLVAR;
end;

procedure TSQLVAR_V2.SetAliasName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.aliasname, Value);
  FXSQLVAR^.aliasname_length := Length(Value);
end;

procedure TSQLVAR_V2.SetDataSize(oldsize, newsize : Integer);
begin
  IBAlloc(FXSQLVAR^.sqldata, oldsize, newsize);
end;

procedure TSQLVAR_V2.SetIndSize(oldsize, newsize: Integer);
begin
  IBAlloc(FXSQLVAR^.sqlind, oldsize, newsize);
end;

procedure TSQLVAR_V2.SetOwnName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.ownname, Value);
  FXSQLVAR^.ownname_length := Length(Value);
end;

procedure TSQLVAR_V2.SetRelName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.relname, Value);
  FXSQLVAR^.relname_length := Length(Value);
end;

procedure TSQLVAR_V2.SetSqlData(const Value: PByte);
begin
  FXSQLVAR.sqldata := Value;
end;

procedure TSQLVAR_V2.SetSqlInd(const Value: PShort);
begin
  FXSQLVAR.sqlInd := Value
end;

procedure TSQLVAR_V2.SetSqlLen(const Value: Short);
begin
  FXSQLVAR.sqlLen := Value
end;

procedure TSQLVAR_V2.SetSqlName(const Value: AnsiString);
begin
  StrPCopy(FXSQLVAR^.sqlname, Value);
  FXSQLVAR^.sqlname_length := Length(Value);
end;

procedure TSQLVAR_V2.SetSqlPrecision(const Value: Short);
begin
  FXSQLVAR.sqlprecision := Value
end;

procedure TSQLVAR_V2.SetSqlScale(const Value: Short);
begin
  FXSQLVAR.sqlscale := Value
end;

procedure TSQLVAR_V2.SetSqlSubtype(const Value: Short);
begin
  FXSQLVAR.sqlsubtype := Value
end;

procedure TSQLVAR_V2.SetSqlType(const Value: Short);
begin
  FXSQLVAR.sqltype := Value
end;

procedure TSQLVAR_V2.SetSQLVAR(const Value: Pointer);
begin
  Move(Value, FXSQLVAR, Sizeof(TSQLVAR_V2));
end;

{ TSQLVAR }

function TSQLVAR.GetSqlDef: Short;
begin
  Result := SqlType and (not 1);
end;

end.
