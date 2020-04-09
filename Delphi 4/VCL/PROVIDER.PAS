
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Provider - Resolver framework                   }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit Provider;

interface

uses Windows, SysUtils, ComObj, Classes, StdVcl, DbClient, DB, DsIntf;

type
{ TProviderObject }

  TCustomProvider = class;

  TProviderObject = class(TAutoIntfObject, IProvider)
  private
    FProvider: TCustomProvider;
  protected
    procedure CheckProvider;
    { IProvider }
    function Get_Data: OleVariant; safecall;
    function GetMetaData: OleVariant; safecall;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; safecall;
    function ApplyUpdates(Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; safecall;
    function DataRequest(Input: OleVariant): OleVariant; safecall;
    function Get_Constraints: WordBool; safecall;
    procedure Set_Constraints(Value: WordBool); safecall;
    procedure Reset(MetaData: WordBool); safecall;
    procedure SetParams(Values: OleVariant); safecall;
  public
    constructor Create(AProvider: TCustomProvider);
    destructor Destroy; override;
  end;

{ EDSWriter }

  EDSWriter = class(Exception)
  private
    FErrorCode: Integer;
  public
    constructor Create(ErrMsg: string; Status: Integer);
    property ErrorCode: Integer read FErrorCode;
  end;

{ TCustomPacketWriter }

  TCustomPacketWriter = class(TObject)
  private
    FDSWriter: IDSWriter;
    FBuffer: array of Byte;
  protected
    procedure AddAttribute(Area: TPcktAttrArea; const ParamName: string;
      const Value: OleVariant; IncludeInDelta: Boolean);
    procedure Check(Status: Integer);
    property DSWriter: IDSWriter read FDSWriter;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

{ TDataPacketWriter }

  TProviderOption = (poFetchBlobsOnDemand, poFetchDetailsOnDemand,
    poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poReadOnly);
  TProviderOptions = set of TProviderOption;

  PPutFieldInfo = ^TPutFieldInfo;
  TPutFieldProc = procedure(Info: PPutFieldInfo) of object;
  TPutFieldInfo = record
    FieldNo: Integer;
    Field: TField;
    DataSet: TDataSet;
    Size: Integer;
    IsDetail: Boolean;
    Opened: Boolean;
    PutProc: TPutFieldProc;
    LocalFieldIndex: Integer;
    FieldInfos: Pointer;
    FastScan: Boolean;
  end;

  TInfoArray = array of TPutFieldInfo;

  TGetParamsEvent = procedure(DataSet: TDataSet; Params: TList) of object;

  TDataPacketWriter = class(TCustomPacketWriter)
  private
    FPutFieldInfo: TInfoArray;
    FOptions: TProviderOptions;
    FMetaData: Boolean;
    FConstraints: Boolean;
    FOnGetParams: TGetParamsEvent;
    FUpdateMode: TUpdateMode;
    procedure FreeInfoRecords(var Info: TInfoArray);
    function GetFieldIdx(const FieldName: string; const Info: TInfoArray): Integer;
    procedure AddExtraFieldProps(Field: TField);
    function InitPutProcs(ADataSet: TDataSet; var GlobalIdx: Integer): TInfoArray;
    procedure RefreshPutProcs(ADataSet: TDataSet; var Info: TInfoArray);
    function CheckFastScan(DataSet: TDataSet): Boolean;
  protected
    procedure AddColumn(const Info: TPutFieldInfo);
    procedure AddConstraints(DataSet: TDataSet);
    procedure AddDataSetAttributes(DataSet: TDataSet);
    procedure AddFieldLinks(const Info: TInfoArray);
    procedure AddIndexDefs(DataSet: TDataSet; const Info: TInfoArray);
    procedure PutADTField(Info: PPutFieldInfo);
    procedure PutArrayField(Info: PPutFieldInfo);
    procedure PutBlobField(Info: PPutFieldInfo);
    procedure PutCalcField(Info: PPutFieldInfo);
    procedure PutDataSetField(Info: PPutFieldInfo);
    procedure PutField(Info: PPutFieldInfo);
    procedure PutStringField(Info: PPutFieldInfo);
    procedure PutVarBytesField(Info: PPutFieldInfo);
    procedure WriteMetaData(DataSet: TDataSet; const Info: TInfoArray;
      IsReference: Boolean = False);
    function WriteDataSet(DataSet: TDataSet; var Info: TInfoArray;
      RecsOut: Integer; FastScan: Boolean): Integer;
    property OnGetParams: TGetParamsEvent read FOnGetParams write FOnGetParams;
  public
    destructor Destroy; override;
    procedure GetDataPacket(DataSet: TDataSet; var RecsOut: Integer;
      out Data: OleVariant);
    property Constraints: Boolean read FConstraints write FConstraints;
    property MetaData: Boolean read FMetaData write FMetaData;
    property Options: TProviderOptions read FOptions write FOptions;
    property UpdateMode: TUpdateMode read FUpdateMode write FUpdateMode;
  end;

{ TPacketDataSet }

  TPacketDataSet = class(TClientDataSet)
  private
    FOldRecBuf: PChar;
    FCurRecBuf: PChar;
    FCurValues: PChar;
    FUseCurValues: Boolean;
    FWritingCurValues: Boolean;
    FNewValuesModified: Boolean;
    function GetStreamMetaData: Boolean;
    procedure SetStreamMetaData(Value: Boolean);
    procedure SetWritingCurValues(const Value: Boolean);
  protected
    procedure DataEvent(Event: TDataEvent; Info: Longint); override;
    function GetStateFieldValue(State: TDataSetState; Field: TField): Variant; override;
    procedure InternalClose; override;
    procedure InternalOpen; override;
    procedure InternalInitRecord(Buffer: PChar); override;
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    property WritingCurValues: Boolean read FWritingCurValues write SetWritingCurValues;
  public
    procedure AssignCurValues(Source: TDataSet); overload;
    procedure AssignCurValues(const CurValues: Variant); overload;
    procedure CreateFromDelta(Source: TPacketDataSet);
    function HasCurValues: Boolean;
    function HasMergeConflicts: Boolean;
    procedure InitAltRecBuffers(CheckModified: Boolean = True);
    function UpdateKind: TUpdateKind;
    property NewValuesModified: Boolean read FNewValuesModified;
    property StreamMetaData: Boolean read GetStreamMetaData write SetStreamMetaData;
    property UseCurValues: Boolean read FUseCurValues write FUseCurValues;
  end;

{ TCustomProvider }

  TDataRequestEvent = function(Sender: TObject; Input: OleVariant): OleVariant of object;

  TCustomProvider = class(TComponent)
  private
    FProviders: TList;
    FConstraints: WordBool;
    FOnDataRequest: TDataRequestEvent;
    procedure AddProvider(AProvider: TProviderObject);
    procedure RemoveProvider(AProvider: TProviderObject);
  protected
    function FetchParams: OleVariant; virtual;
    function FetchData(const Packet: OleVariant): OleVariant; virtual;
    function GetProvider: IProvider; virtual;
    function Get_Data: OleVariant; virtual;
  public
    destructor Destroy; override;
    function GetMetaData: OleVariant; virtual;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; virtual;
    function ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; virtual; abstract;
    function DataRequest(Input: OleVariant): OleVariant; virtual;
    procedure Reset(MetaData: WordBool); virtual;
    procedure SetParams(Values: OleVariant); virtual;
    property Constraints: WordBool read FConstraints write FConstraints;
    property OnDataRequest: TDataRequestEvent read FOnDataRequest write FOnDataRequest;
    property Data: OleVariant read Get_Data;
    property Provider: IProvider read GetProvider;
  end;

{ EUpdateError }

  EUpdateError = class(EDatabaseError)
  private
    FErrorCode: Integer;
    FPreviousError: Integer;
    FContext: string;
    FOriginalException: Exception;
  public
    constructor Create(NativeError, Context: string;
      ErrCode, PrevError: Integer; E: Exception);
    destructor Destroy; override;
    property Context: string read FContext;
    property ErrorCode: Integer read FErrorCode;
    property PreviousError: Integer read FPreviousError;
    property OriginalException: Exception read FOriginalException;
  end;

{ TBaseProvider }

type

  TCustomResolver = class;
  TResolverResponse = (rrSkip, rrAbort, rrMerge, rrApply, rrIgnore);
  TProviderDataEvent = procedure(Sender: TObject; DataSet: TClientDataSet) of object;
  TBeforeUpdateRecordEvent = procedure(Sender: TObject; SourceDS: TDataSet;
    DeltaDS: TClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean) of object;
  TAfterUpdateRecordEvent = procedure(Sender: TObject; SourceDS: TDataSet;
    DeltaDS: TClientDataSet; UpdateKind: TUpdateKind) of object;
  TResolverErrorEvent = procedure(Sender: TObject; DataSet: TClientDataSet;
    E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse) of object;

  TBaseProvider = class(TCustomProvider)
  private
    FDataDS: TPacketDataSet;
    FResolver: TCustomResolver;
    FOnGetData: TProviderDataEvent;
    FOnUpdateData: TProviderDataEvent;
    FOnUpdateError: TResolverErrorEvent;
    FBeforeUpdateRecord: TBeforeUpdateRecordEvent;
    FAfterUpdateRecord: TAfterUpdateRecordEvent;
    FIncludeMetaData: Boolean;
    FProviderOptions: TProviderOptions;
  protected
    FRecordsSent: Integer;
    procedure LocateRecord(Source: TDataSet; Delta: TClientDataSet); virtual;
    procedure UpdateRecord(Source: TDataSet; Delta: TClientDataSet;
      BlobsOnly: Boolean); virtual;
    function CreateResolver: TCustomResolver; virtual;
    procedure CreateDataPacket(MetaData, Contraints: Boolean;
      ProvOpts: TProviderOptions; var RecsOut: Integer; var Data: OleVariant); virtual;
    procedure SetParamByName(const ParamName: string; const Value: OleVariant); virtual;
    procedure SetParamByIndex(ParamIndex: Integer; const Value: OleVariant); virtual;
    function GetKeyFields(const Tablename: string; ADelta: TClientDataSet): string; virtual;
    procedure FreeResolver;
    function GetParamCount: Integer; virtual;
    procedure DoOnGetData(var Data: OleVariant);
    procedure DoOnUpdateData(Delta: TPacketDataSet);
    function GetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError; virtual;
    property ParamCount: Integer read GetParamCount;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; override;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; override;
    procedure Reset(MetaData: WordBool); override;
    procedure SetParams(Values: OleVariant); override;
    function FetchData(const Packet: OleVariant): OleVariant; override;
    property Resolver: TCustomResolver read FResolver;
    property Provider;
    property Options: TProviderOptions read FProviderOptions
      write FProviderOptions default [];
    property OnDataRequest;
    property OnGetData: TProviderDataEvent read FOnGetData write FOnGetData;
    property OnUpdateData: TProviderDataEvent read FOnUpdateData write FOnUpdateData;
    property OnUpdateError: TResolverErrorEvent read FOnUpdateError write FOnUpdateError;
    property BeforeUpdateRecord: TBeforeUpdateRecordEvent read FBeforeUpdateRecord
      write FBeforeUpdateRecord;
    property AfterUpdateRecord: TAfterUpdateRecordEvent read FAfterUpdateRecord
      write FAfterUpdateRecord;
  end;

{ TDataSetProvider }

  TGetDSProps = procedure(Sender: TObject; DataSet: TDataSet;
    out Properties: OleVariant) of object;

  TDataSetProvider = class(TBaseProvider)
  private
    FDataSet: TDataSet;
    FDataSetOpened: Boolean;
    FUpdateMode: TUpdateMode;
    FDSWriter: TDataPacketWriter;
    FGetDSProps: TGetDSProps;
    function FindRecord(Source: TDataSet; Delta: TClientDataSet; UpdateMode: TUpdateMode): Boolean;
  protected
    procedure LocateRecord(Source: TDataSet; Delta: TClientDataSet); override;
    procedure UpdateRecord(Source: TDataSet; Delta: TClientDataSet;
      BlobsOnly: Boolean); override;
    procedure DoGetParams(DataSet: TDataSet; List: TList); virtual;
    function DoGetDataSet(const Name: string): TDataSet;
    function GetDataSet: TDataSet;
    procedure SetDataSet(ADataSet: TDataSet);
    function CreateResolver: TCustomResolver; override;
    procedure CreateDataPacket(MetaData, Contraints: Boolean;
      ProvOpts: TProviderOptions; var RecsOut: Integer; var Data: OleVariant); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; override;
    procedure Reset(MetaData: WordBool); override;
    function FetchData(const Packet: OleVariant): OleVariant; override;
    function ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; override;
  published
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property Constraints default True;
    property Options;
    property UpdateMode: TUpdateMode read FUpdateMode write FUpdateMode default upWhereAll;
    property OnDataRequest;
    property OnGetData;
    property OnUpdateData;
    property OnUpdateError;
    property AfterUpdateRecord;
    property BeforeUpdateRecord;
    property OnGetDataSetProperties: TGetDSProps read FGetDSProps write FGetDSProps;
  end;

{ TUpdateTree }

  TUpdateTree = class(TObject)
  private
    FDeltaDS: TPacketDataSet;
    FErrorDS: TPacketDataSet;
    FSourceDS: TDataSet;
    FParent: TUpdateTree;
    FDetails: TList;
    FData: Pointer;
    FResolver: TCustomResolver;
    FTablename: string;
    FName: string;
    function GetDetailCount: Integer;
    function GetDetail(Index: Integer): TUpdateTree;
    function GetErrorDS: TPacketDataSet;
    function GetHasErrors: Boolean;
    function GetTree(const AName: string): TUpdateTree;
  protected
    procedure Clear;
    function DoUpdates: Boolean;
    procedure RefreshData;
    procedure InitErrorPacket(E: EUpdateError; Response: TResolverResponse);
    procedure InitData(ASource: TDataSet);
    procedure InitDelta(const ADelta: OleVariant); overload;
    procedure InitDelta(ADelta: TPacketDataSet); overload;
    property Data: Pointer read FData write FData;
    property Delta: TPacketDataSet read FDeltaDS;
    property DetailCount: Integer read GetDetailCount;
    property Details[Index: Integer]: TUpdateTree read GetDetail;
    property ErrorDS: TPacketDataSet read GetErrorDS;
    property HasErrors: Boolean read GetHasErrors;
    property Name: string read FName write FName;
    property Parent: TUpdateTree read FParent;
    property Source: TDataSet read FSourceDS;
    property Tablename: string read FTablename;
  public
    constructor Create(AParent: TUpdateTree; AResolver: TCustomResolver);
    destructor Destroy; override;
  end;

{ TCustomResolver }

  TCustomResolver = class(TComponent)
  private
    FProvider: TBaseProvider;
    FPrevResponse: TResolverResponse;
    FUpdateMode: TUpdateMode;
    FErrorCount: Integer;
    FMaxErrors: Integer;
    FUpdateTree: TUpdateTree;
  protected
    property Provider: TBaseProvider read FProvider;
    function HandleUpdateError(Tree: TUpdateTree; E: EUpdateError;
      var MaxErrors, ErrorCount: Integer): Boolean;
    procedure LogUpdateError(Tree: TUpdateTree; E: EUpdateError;
      Response: TResolverResponse);
    procedure InitKeyFields(Tree: TUpdateTree; ADelta: TPacketDataSet);
    procedure InternalBeforeResolve(Tree: TUpdateTree); virtual;
    function InternalUpdateRecord(Tree: TUpdateTree): Boolean;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    procedure InitTreeData(Tree: TUpdateTree); virtual;
    procedure FreeTreeData(Tree: TUpdateTree); virtual;
    procedure InitializeConflictBuffer(Tree: TUpdateTree); virtual; abstract;
    procedure DoUpdate(Tree: TUpdateTree); virtual; abstract;
    procedure DoDelete(Tree: TUpdateTree); virtual; abstract;
    procedure DoInsert(Tree: TUpdateTree); virtual; abstract;
    function FetchData(const Packet: OleVariant): OleVariant; virtual;
    function ApplyUpdates(const Delta: OleVariant; MaxErrors: Integer;
      out ErrorCount: Integer): OleVariant; virtual;
    property UpdateMode: TUpdateMode read FUpdateMode write FUpdateMode;
  public
    constructor Create(AProvider: TBaseProvider); reintroduce;
    destructor Destroy; override;
  end;

{ TDataSetResolver }

  TDataSetResolver = class(TCustomResolver)
  private
    FBookmark: TBookmarkStr;
    procedure PutRecord(Tree: TUpdateTree);
  protected
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    procedure InternalBeforeResolve(Tree: TUpdateTree); override;
    procedure InitializeConflictBuffer(Tree: TUpdateTree); override;
    procedure DoUpdate(Tree: TUpdateTree); override;
    procedure DoDelete(Tree: TUpdateTree); override;
    procedure DoInsert(Tree: TUpdateTree); override;
  public
    constructor Create(AProvider: TDataSetProvider);
  end;

{ TSQLResolver }

  TExecSQLProc = procedure(Sender: TObject; SQL: TStringList; Params: TParams) of object;
  TGetValuesProc = procedure(Sender: TObject; SQL: TStringList;
    Params: TParams; DataSet: TDataSet) of object;

  TSQLGenInfo = record
    GetValuesProc: TGetValuesProc;
    ExecSQLProc: TExecSQLProc;
  end;

  TSQLResolver = class(TCustomResolver)
  private
    FSQL: TStringList;
    FParams: TParams;
    FExecSQL: TExecSQLProc;
    FGetValues: TGetValuesProc;
    procedure GenWhereSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams;
      GenUpdateMode: TUpdateMode; Alias: string);
    procedure GenInsertSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams);
    procedure GenDeleteSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams;
      Alias: string);
    procedure GenUpdateSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams;
      Alias: string);
    procedure GenSelectSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams;
      Alias: string);
    function GetQuotedTableName(Tree: TUpdateTree; const TableName: string): string;
    function UseFieldInUpdate(Field: TField): Boolean;
    function UseFieldInWhere(Field: TField; Mode: TUpdateMode): Boolean;
    procedure InternalDoUpdate(Tree: TUpdateTree; UpdateKind: TUpdateKind);
  protected
    procedure InitializeConflictBuffer(Tree: TUpdateTree); override;
    procedure DoExecSQL(SQL: TStringList; Params: TParams); virtual;
    procedure DoGetValues(SQL: TStringList; Params: TParams;
      DataSet: TDataSet); virtual;
    procedure InitTreeData(Tree: TUpdateTree); override;
    procedure FreeTreeData(Tree: TUpdateTree); override;
    procedure DoUpdate(Tree: TUpdateTree); override;
    procedure DoDelete(Tree: TUpdateTree); override;
    procedure DoInsert(Tree: TUpdateTree); override;
  public
    constructor Create(AProvider: TBaseProvider; SQLGenInfo: TSQLGenInfo); reintroduce; virtual;
    destructor Destroy; override;
  end;

{ Utility functions }

function GetObjectProperty(Instance: TPersistent; const PropName: string): TObject;
function GetStringProperty(Instance: TPersistent; const PropName: string): string;

implementation

uses MidConst, DBConsts, DBCommon, TypInfo, ActiveX, BDE;

const
  DEFBUFSIZE = 8192;  { Default size for field data buffer }
  DefAlias   = 'A';
  NestAlias  = 'B';
  tagSERVERCALC = 1;

  PacketTypeMap: array [TFieldType] of Integer =
    (dsfldUNKNOWN, dsfldZSTRING, dsfldINT, dsfldINT, dsfldINT, dsfldBOOL,
     dsfldFLOATIEEE, dsfldFLOATIEEE, dsfldBCD, dsfldDATE, dsfldTIME,
     dsfldTIMESTAMP, dsfldBYTES, dsfldBYTES, dsfldINT, dsfldBYTES, dsfldBYTES,
     dsfldBYTES, dsfldBYTES, dsfldBYTES, dsfldBYTES, dsfldBYTES, dsfldUNKNOWN,
     dsfldZSTRING, dsfldUNICODE, dsfldINT, dsfldADT, dsfldARRAY, dsfldEMBEDDEDTBL,
     dsfldEMBEDDEDTBL);

  ExtraFieldProps: array [0..10] of string = ('Alignment', 'DisplayLabel',
    'DisplayWidth', 'Visible', 'EditMask', 'DisplayFormat', 'EditFormat',
    'MinValue', 'MaxValue', 'currency', 'DisplayValues');

{ Utility functions }

function GetObjectProperty(Instance: TPersistent; const PropName: string): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := TObject(GetOrdProp(Instance, PropInfo));
end;

function GetStringProperty(Instance: TPersistent; const PropName: string): string;
var
  PropInfo: PPropInfo;
begin
  Result := '';
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind in [tkString, tkLString, tkWString]) then
    Result := GetStrProp(Instance, PropInfo);
end;

{ TProviderObject }

constructor TProviderObject.Create(AProvider: TCustomProvider);
var
  StdVcl: ITypeLib;
begin
  OleCheck(LoadRegTypeLib(LIBID_STDVCL, 4, 0, 0, StdVcl));
  inherited Create(StdVcl, IProvider);
  FProvider := AProvider;
  if Assigned(FProvider) then FProvider.AddProvider(Self);
end;

destructor TProviderObject.Destroy;
begin
  if Assigned(FProvider) then FProvider.RemoveProvider(Self);
  inherited Destroy;
end;

procedure TProviderObject.CheckProvider;
begin
  if not Assigned(FProvider) then raise EOleError.Create(SProviderInvalid);
end;

{ TProviderObject.IProvider }

function TProviderObject.ApplyUpdates(Delta: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer): OleVariant;
begin
  CheckProvider;
  Result := FProvider.ApplyUpdates(Delta, MaxErrors, ErrorCount);
end;

function TProviderObject.Get_Data: OleVariant;
begin
  CheckProvider;
  Result := FProvider.Get_Data;
end;

function TProviderObject.GetMetaData: OleVariant;
begin
  CheckProvider;
  Result := FProvider.GetMetaData;
end;

function TProviderObject.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
begin
  CheckProvider;
  Result := FProvider.GetRecords(Count, RecsOut);
end;

function TProviderObject.DataRequest(Input: OleVariant): OleVariant;
begin
  CheckProvider;
  if VarIsArray(Input) and (VarArrayHighBound(Input, 1) >= 1) and
    (VarType(Input[0]) = varInteger) and (VarType(Input[1]) = varInteger) and
    (Input[0] = DRSig) then
  begin
    case Input[1] of
      DRParams: Result := FProvider.FetchParams;
      DRRefresh: Result := FProvider.FetchData(Input[2]);
    end;
  end else
    Result := FProvider.DataRequest(Input);
end;

function TProviderObject.Get_Constraints: WordBool; safecall;
begin
  CheckProvider;
  Result := FProvider.Constraints;
end;

procedure TProviderObject.Set_Constraints(Value: WordBool); safecall;
begin
  CheckProvider;
  FProvider.Constraints := Value;
end;

procedure TProviderObject.Reset(MetaData: WordBool);
begin
  CheckProvider;
  FProvider.Reset(MetaData);
end;

procedure TProviderObject.SetParams(Values: OleVariant); safecall;
begin
  CheckProvider;
  FProvider.SetParams(Values);
end;

{ EDSWriter }

constructor EDSWriter.Create(ErrMsg: string; Status: Integer);
begin
  FErrorCode := Status;
  inherited Create(ErrMsg);
end;

{ TCustomPacketWriter }

constructor TCustomPacketWriter.Create;
begin
  SetLength(FBuffer, DEFBUFSIZE);
end;

destructor TCustomPacketWriter.Destroy;
begin
  FDSWriter := nil;
  FBuffer := nil;
  inherited Destroy;
end;

procedure TCustomPacketWriter.Check(Status: Integer);
var
  ErrMsg: array[0..2048] of Char;
begin
  if Status <> 0 then
  begin
    FDSWriter.GetErrorString(Status, ErrMsg);
    raise EDSWriter.Create(ErrMsg, Status);
  end;
end;

procedure TCustomPacketWriter.AddAttribute(Area: TPcktAttrArea; const ParamName: string;
  const Value: OleVariant; IncludeInDelta: Boolean);
const
  ParamTypeMap: array[varSmallInt..varByte] of Integer =
    ( dsfldINT, dsfldINT, dsfldFLOATIEEE, dsfldFLOATIEEE, dsfldBCD,
      dsfldTIMESTAMP, dsfldZSTRING, 0, 0, dsfldBOOL, 0, 0, 0, 0, 0, dsfldINT);
  ParamTypeSize: array[varSmallInt..varByte] of Integer =
    ( SizeOf(SmallInt), SizeOf(Integer), SizeOf(Single), SizeOf(Double),
      SizeOf(Currency), SizeOf(TDateTime), 0, 0, 0, SizeOf(WordBool), 0, 0, 0,
      0, 0, SizeOf(Byte));
var
  ParamType, ParamLen, ElemSize, ElemCount: Integer;
  P: Pointer;
begin
  if ((VarType(Value) and varTypeMask) in [varSmallInt, varInteger, varSingle,
      varDouble, varCurrency, varDate, varOleStr, varBoolean, varByte]) then
  begin
    ParamType := ParamTypeMap[VarType(Value) and varTypeMask];
    ParamLen := ParamTypeSize[VarType(Value) and varTypeMask];
    if ParamType = dsfldZSTRING then
    begin
      ParamType := (dsfldZSTRING shl dsSizeBitsLen) or dsVaryingFldType or SizeOf(Word);
      ParamLen := Length(Value) + 1;
      PWord(FBuffer)^ := ParamLen;
      Inc(ParamLen, SizeOf(Word));
      StrPCopy(@FBuffer[SizeOf(Word)], Value);
    end else
    if VarIsArray(Value) then
    begin
      if ParamLen = 0 then
        raise EDSWriter.Create(SInvalidOptParamType, 0);
      ElemCount := VarArrayHighBound(Value, 1) + 1;
      ElemSize := ParamLen;
      ParamType := (dsfldUINT shl dsSizeBitsLen) or dsArrayFldType or ElemSize;
      PInteger(FBuffer)^ := ElemCount;
      ParamLen := ElemCount * ElemSize;
      P := VarArrayLock(Value);
      try
        Move(P^, FBuffer[SizeOf(Integer)], ParamLen);
        Inc(ParamLen, SizeOf(Integer));
      finally
        VarArrayUnlock(Value);
      end;
    end else
    begin
      if (VarType(Value) and varByRef) = varByRef then
        P := TVarData(Value).VPointer else
        P := @TVarData(Value).VPointer;
      Move(P^, PByte(FBuffer)^, ParamLen);
      ParamType := ParamType shl dsSizeBitsLen or ParamLen;
    end;
    if IncludeInDelta then
      ParamType := ParamType or Integer(dsIncInDelta);
    Check(FDSWriter.AddAttribute(Area, PChar(ParamName), ParamType, ParamLen, PByte(FBuffer)));
  end else
    raise EDSWriter.Create(SInvalidOptParamType, 0);
end;

{ TDataPacketWriter }

destructor TDataPacketWriter.Destroy;
begin
  FreeInfoRecords(FPutFieldInfo);
  FPutFieldInfo := nil;
  inherited Destroy;
end;

procedure TDataPacketWriter.FreeInfoRecords(var Info: TInfoArray);
var
  i: Integer;
begin
  for i := 0 to High(Info) do
    if Info[i].FieldInfos <> nil then
    begin
      FreeInfoRecords(TInfoArray(Info[i].FieldInfos));
      TInfoArray(Info[i].FieldInfos) := nil;
    end;
end;

{ Writing data }

procedure TDataPacketWriter.PutBlobField(Info: PPutFieldInfo);
begin
  if not (poFetchBlobsOnDemand in Options) then
  begin
    Info.Size := Info.DataSet.GetBlobFieldData(Info.FieldNo, TBlobByteData(FBuffer));
    if Info.Size <> 0 then
    begin
      FBuffer[Info.Size] := 0;
      if TBlobField(Info.Field).Transliterate then
        Info.Size := Info.DataSet.Translate(PChar(FBuffer), PChar(FBuffer), False);
      FDSWriter.PutField(fldIsChanged, Info.Size, PByte(FBuffer))
    end else
      FDSWriter.PutField(fldIsNull, 0, nil);
  end else
    FDSWriter.PutField(fldIsChanged, dsDELAYEDBIT or 1, @Info.Size);
end;

procedure TDataPacketWriter.PutCalcField(Info: PPutFieldInfo);
begin
  if Info.DataSet.GetFieldData(Info.Field, FBuffer) then
  begin
    if (Info.Field is TStringField) then
      if TStringField(Info.Field).Transliterate then
        Info.Size := Info.DataSet.Translate(PChar(FBuffer), PChar(FBuffer), False) else
        Info.Size := StrLen(PChar(FBuffer));
    FDSWriter.PutField(fldIsChanged, Info.Size, PByte(FBuffer));
  end else
    FDSWriter.PutField(fldIsNull, 0, nil);
end;

procedure TDataPacketWriter.PutField(Info: PPutFieldInfo);
begin
  if Info.DataSet.GetFieldData(Info.FieldNo, FBuffer) then
    FDSWriter.PutField(fldIsChanged, Info.Size, PByte(FBuffer)) else
    FDSWriter.PutField(fldIsNull, 0, nil);
end;

procedure TDataPacketWriter.PutStringField(Info: PPutFieldInfo);
begin
  if Info.DataSet.GetFieldData(Info.FieldNo, FBuffer) then
  begin
    if TStringField(Info.Field).Transliterate then
      Info.Size := Info.DataSet.Translate(PChar(FBuffer), PChar(FBuffer), False) else
      Info.Size := StrLen(PChar(FBuffer));
    FDSWriter.PutField(fldIsChanged, Info.Size, PByte(FBuffer));
  end else
    FDSWriter.PutField(fldIsNull, 0, nil);
end;

procedure TDataPacketWriter.PutVarBytesField(Info: PPutFieldInfo);
begin
  if Info.DataSet.GetFieldData(Info.FieldNo, FBuffer) then
    FDSWriter.PutField(fldIsChanged, PWord(FBuffer)^, @FBuffer[SizeOf(Word)]) else
    FDSWriter.PutField(fldIsNull, 0, nil);
end;

procedure TDataPacketWriter.PutADTField(Info: PPutFieldInfo);
var
  i: Integer;
begin
  if Info.Field.IsNull then
    FDSWriter.PutField(fldIsNull, 0, nil) else
    FDSWriter.PutField(fldIsChanged, 0, nil);
  for i := 0 to High(TInfoArray(Info.FieldInfos)) do
    with TInfoArray(Info^.FieldInfos)[i] do
      PutProc(@TInfoArray(Info.FieldInfos)[i]);
end;

procedure TDataPacketWriter.PutArrayField(Info: PPutFieldInfo);

  procedure RefreshInfos(Src: TField; Dest: PPutFieldInfo);
  var
    i: Integer;
  begin
    with Dest^ do
    begin
      Field := Src;
      FieldNo := Src.FieldNo;
      if (FieldInfos <> nil) then { Must be an ADT }
      begin
        if not (Src is TADTField) then
          raise EDSWriter.CreateFmt(SArrayElementError,[Src.ClassName]);
        with (Src as TADTField) do
          for i := 0 to FieldCount - 1 do
            RefreshInfos(Fields[i], @TInfoArray(FieldInfos)[i]);
      end;
    end;
  end;

var
  i: Integer;
begin
  if Info.Field.IsNull then
    FDSWriter.PutField(fldIsNull, 0, nil) else
    FDSWriter.PutField(fldIsChanged, 0, nil);
  for i := 0 to TArrayField(Info.Field).FieldCount - 1 do
    with TInfoArray(Info^.FieldInfos)[0] do
    begin
      RefreshInfos(TArrayField(Info.Field).Fields[i], @TInfoArray(Info.FieldInfos)[0]);
      PutProc(@TInfoArray(Info.FieldInfos)[0]);
    end;
end;

procedure TDataPacketWriter.PutDataSetField(Info: PPutFieldInfo);
var
  Count: DWord;
  DataSet: TDataSet;
begin
  if Info.Field <> nil then
  begin
    if Info.Field.IsNull then
    begin
      FDSWriter.PutField(fldIsNull, 0, nil);
      Exit;
    end;
    DataSet := TDataSetField(Info.Field).NestedDataSet;
  end else
    DataSet := Info.DataSet;
  if (poFetchDetailsOnDemand in Options) then
    Count := dsDELAYEDBIT else
    Count := DWord(-1);
  FDSWriter.PutField(fldIsChanged, SizeOf(Count), @Count);
  DataSet.UpdateCursorPos;
  if (not (poFetchDetailsOnDemand in Options)) and (Count = DWord(-1)) then
  begin
    DataSet.First;
    WriteDataSet(DataSet, TInfoArray(Info.FieldInfos), -1, Info.FastScan);
    FDSWriter.EndOfNestedRows;
  end;
end;

function TDataPacketWriter.WriteDataSet(DataSet: TDataSet; var Info: TInfoArray;
  RecsOut: Integer; FastScan: Boolean): Integer;
const
  B: Byte = 0;
var
  i: Integer;
begin
  Result := 0;
  if RecsOut = -1 then RecsOut := High(Integer);
  if FastScan and (RecsOut > 1) then
    DataSet.BlockReadSize := RecsOut;
  try
    if DataSet.DefaultFields then
      RefreshPutProcs(DataSet, Info);
    while (not DataSet.EOF) and (Result < RecsOut) do
    begin
      FDSWriter.PutField(fldIsChanged, 1, @B);
      for i := 0 to High(Info) do
        Info[i].PutProc(@Info[i]);
      Inc(Result);
      if Result >= RecsOut then
        DataSet.BlockReadSize := 0;
      DataSet.Next;
    end;
  finally
    DataSet.BlockReadSize := 0;
  end;
end;

{ Writing meta data }

procedure TDataPacketWriter.AddDataSetAttributes(DataSet: TDataSet);
var
  i: Integer;
  List: TList;
begin
  if Assigned(FOnGetParams) then
  begin
    List := TList.Create;
    try
      FOnGetParams(DataSet, List);
      for i := 0 to List.Count - 1 do
        with PPacketAttribute(List[i])^ do
        begin
          AddAttribute(pcktAttrArea, Name, Value, IncludeInDelta);
          Dispose(PPacketAttribute(List[i]));
        end;
    finally
      List.Free;
    end;
  end;
end;

function TDataPacketWriter.GetFieldIdx(const FieldName: string; const Info: TInfoArray): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to High(Info) do
    if (Info[i].Field <> nil) and (Info[i].Field.FieldName = FieldName) then
    begin
      Result := Info[i].LocalFieldIndex;
      break;
    end;
end;

type
  TPropWriter = class(TWriter);

procedure TDataPacketWriter.AddExtraFieldProps(Field: TField);

  procedure WriteProp(Instance: TPersistent; const PropName: string;
    Writer: TPropWriter);
  var
    PropInfo: PPropInfo;
  begin
    PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
    if (PropInfo <> nil) and IsStoredProp(Instance, PropInfo) then
      Writer.WriteProperty(Instance, PropInfo);
  end;

var
  Writer: TPropWriter;
  Stream: TMemoryStream;
  i, Attr: Integer;
begin
  Stream := TMemoryStream.Create;
  try
    Writer := TPropWriter.Create(Stream, 1024);
    try
      Writer.WriteListBegin;
      for i := 0 to High(ExtraFieldProps) do
        WriteProp(Field, ExtraFieldProps[i], Writer);
      Writer.WriteListEnd;
      Writer.FlushBuffer;
      if Stream.Size > 2 then
      begin
        Attr := (dsfldBYTES shl dsSizeBitsLen) or dsArrayFldType or SizeOf(Byte);
        PInteger(FBuffer)^ := Stream.Size;
        Move(Stream.Memory^, FBuffer[SizeOf(Integer)], Stream.Size);
        Check(FDSWriter.AddAttribute(fldAttrArea, szFIELDPROPS, Attr,
          Stream.Size + SizeOf(Integer), FBuffer));
      end;
    finally
      Writer.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TDataPacketWriter.AddColumn(const Info: TPutFieldInfo);

  procedure AddFieldDesc(const FldName: string; FldType, Attributes: Integer);
  var
    FldDesc: TDSDataPacketFldDesc;
  begin
    if Length(FldName) > SizeOf(FldDesc.szFieldName) then
      raise EDSWriter.CreateFmt(SFieldNameTooLong,[SizeOf(FldDesc.szFieldName) - 1]);
    FillChar(FldDesc, SizeOf(FldDesc), 0);
    StrCopy(FldDesc.szFieldName, PChar(FldName));
    FldDesc.iFieldType := FldType;
    FldDesc.iAttributes := Attributes;
    Check(FDSWriter.AddColumnDesc(FldDesc));
  end;

  function ComputeInfoCount(Info: TInfoArray): Integer;
  var
    i: Integer;
  begin
    Result := Length(Info);
    for i := 0 to High(Info) do
      if Info[i].FieldInfos <> nil then
        Inc(Result, ComputeInfoCount(Info[i].FieldInfos));
  end;

var
  FldType, Prec, Attr, i, Width: Integer;
  TempStr: string;
begin
  if Info.IsDetail and (Info.Field = nil) then
  begin
    FldType := (dsfldEMBEDDEDTBL shl dsSizeBitsLen) or
      ComputeInfoCount(Info.FieldInfos) or dsPseudoFldType;
    AddFieldDesc(Info.DataSet.Name, FldType, 0);
    WriteMetaData(Info.DataSet, TInfoArray(Info.FieldInfos));
  end else
  begin
    Width := 0;
    Attr := 0;
    if Info.Field.ReadOnly or (Info.Field.FieldKind <> fkData) then Attr := Attr or fldAttrREADONLY;
    if Info.Field.Required and (Info.Field.DataType <> ftAutoInc) then Attr := Attr or fldAttrREQUIRED;
    if (pfHidden in Info.Field.ProviderFlags) then Attr := Attr or fldAttrHIDDEN or fldAttrREADONLY;
    FldType := PacketTypeMap[Info.Field.DataType];
    case Info.Field.DataType of
      ftString, ftFixedChar, ftVarBytes:
      begin
        FldType := FldType shl dsSizeBitsLen or dsVaryingFldType;
        if Info.Size < 255 then
          FldType := FldType or SizeOf(Byte) else
          FldType := FldType or SizeOf(Word);
        Width := Info.Size;
      end;
      ftBCD:
      begin
        Width := TBCDField(Info.Field).Precision;
        Prec := Width shr 1;
        Inc(Prec, Prec and 1);  { Make an even number }
        FldType := (FldType shl dsSizeBitsLen) or (Prec + 2);
      end;
      ftArray:
        FldType := (FldType shl dsSizeBitsLen) or dsPseudoFldType or
          dsCompArrayFldType or TObjectField(Info.Field).Size;
      ftADT:
        FldType := (FldType shl dsSizeBitsLen) or dsPseudoFldType or
          TObjectField(Info.Field).FieldCount;
      ftDataSet, ftReference:
        FldType := (FldType shl dsSizeBitsLen) or dsPseudoFldType or
          dsEmbeddedFldType or ComputeInfoCount(TInfoArray(Info.FieldInfos));
    else
      if Info.Field.IsBlob then
      begin
        FldType := (FldType shl dsSizeBitsLen) or dsVaryingFldType or SizeOf(Integer);
        Width := Info.Field.Size;
      end else
        FldType := (FldType shl dsSizeBitsLen) or Info.Size;
    end;
    AddFieldDesc(Info.Field.FieldName, FldType, Attr);
    if (Info.Field.FieldKind <> fkData) then
      AddAttribute(fldAttrArea, szSERVERCALC, True, True);
    if Info.Field.ProviderFlags <> [pfInWhere, pfInUpdate] then
      AddAttribute(fldAttrArea, szPROVFLAGS, Byte(Info.Field.ProviderFlags), True);
    if Info.Field.Origin <> '' then
      AddAttribute(fldAttrArea, szORIGIN, Info.Field.Origin, True);
    if Width > 0 then
      AddAttribute(fldAttrArea, szWIDTH, Width, False);
    if (Info.Field is TBCDField) and (TBCDField(Info.Field).Size <> 0) then
      AddAttribute(fldAttrArea, szDECIMALS, TBCDField(Info.Field).Size, False);
    case Info.Field.DataType of
      ftCurrency: TempStr := szstMONEY;
      ftAutoInc: TempStr := szstAUTOINC;
      ftVarBytes: TempStr := szstBINARY;
      ftMemo: TempStr := szstMEMO;
      ftFmtMemo: TempStr := szstFMTMEMO;
      ftParadoxOle: TempStr := szstOLEOBJ;
      ftGraphic: TempStr := szstGRAPHIC;
      ftDBaseOle: TempStr := szstDBSOLEOBJ;
      ftTypedBinary: TempStr := szstTYPEDBINARY;
      ftADT:
        if (Info.Field.ParentField <> nil) and
           (Info.Field.ParentField.DataType in [ftDataSet, ftReference]) then
          TempStr := szstADTNESTEDTABLE;
      ftReference: TempStr := szstREFNESTEDTABLE;
      ftString:
        if TStringField(Info.Field).FixedChar then
          TempStr := szstFIXEDCHAR else
          TempStr := '';
    else
        TempStr := '';
    end;
    if TempStr <> '' then
      AddAttribute(fldAttrArea, szSUBTYPE, TempStr, False);
    if Info.Field is TObjectField then
      AddAttribute(fldAttrArea, szTYPENAME, TObjectField(Info.Field).ObjectType, False);
    if poIncFieldProps in Options then
      AddExtraFieldProps(Info.Field);
    case Info.Field.DataType of
      ftADT, ftArray: { Array will only have 1 child field }
        for i := 0 to High(TInfoArray(Info.FieldInfos)) do
          AddColumn(TInfoArray(Info.FieldInfos)[i]);
      ftDataSet, ftReference:
        with TDataSetField(Info.Field) do
          WriteMetaData(NestedDataSet, TInfoArray(Info.FieldInfos),
            Info.Field.DataType = ftReference);
    end;
  end;
end;

procedure TDataPacketWriter.AddConstraints(DataSet: TDataSet);
type
  TConstraintType = (ctField, ctRecord, ctDefault);

  procedure AddSQLExprAttr(ExprParser: TExprParser; const ExprText, ExprErrMsg,
    FieldName: string; FieldIndex: Integer; ConstraintType: TConstraintType;
    Required: Boolean);
  type
    PSQLExprInfo = ^TSQLExprInfo;
    TSQLExprInfo = packed record
      iErrStrLen: Integer;
      iFldNum: Integer;
      bReqExpr: BYTE;
    end;
  const
    TypeStr: array[TConstraintType] of PChar = (szBDEDOMX, szBDERECX, szBDEDEFX);
    Attr: Integer = dsVaryingFldType or SizeOf(Integer) or (dsfldBYTES shl dsSizeBitsLen);
  var
    ErrorStr: string;
    AttrType: PChar;
    Len, AttrSize: Integer;
    SQLExprInfo: PSQLExprInfo;
    Options: TParserOptions;
  begin
    if ExprText = '' then Exit;
    if (ConstraintType <> ctDefault) and (ExprErrMsg = '') then
    begin
      if (ConstraintType = ctField) and (FieldName <> '') then
        ErrorStr := Format('%s %s: %s %s',[SConstraintFailed, SField, FieldName, ExprText]) else
        ErrorStr := Format('%s %s',[SConstraintFailed, ExprText]);
    end else
      ErrorStr := ExprErrMsg;
    Len := Length(ErrorStr);
    if (Len > 0) then Inc(Len);
    SQLExprInfo := @FBuffer[SizeOf(Integer)];
    SQLExprInfo.iErrStrLen := Len;
    SQLExprInfo.iFldNum := FieldIndex;
    SQLExprInfo.bReqExpr := Ord(Required);
    Options := [poExtSyntax];
    if ConstraintType = ctDefault then Include(Options, poDefaultExpr);
    if ConstraintType = ctRecord then Include(Options, poUseOrigNames);
    if FieldName <> '' then Include(Options, poFieldNameGiven);
    with ExprParser do
    begin
      SetExprParams(ExprText, [], Options, FieldName);
      Move(FilterData^, FBuffer[SizeOf(TSQLExprInfo) + Len + SizeOf(Integer)], DataSize);
      AttrSize := DataSize + SizeOf(TSQLExprInfo) + Len;
    end;
    PInteger(FBuffer)^ := AttrSize;
    if Len > 0 then
      StrCopy(@FBuffer[SizeOf(TSQLExprInfo) + SizeOf(Integer)], PChar(ErrorStr));
    AttrType := TypeStr[ConstraintType];
    Check(FDSWriter.AddAttribute(pcktAttrArea, AttrType, Attr, AttrSize + SizeOf(Integer), PByte(FBuffer)));
  end;

var
  i: Integer;
  ExprParser: TExprParser;
  Constraints: TCheckConstraints;
  Obj: TObject;
  ErrMsg: string;
begin
  ExprParser := TExprParser.Create(DataSet, '', [], [], '', nil);
  try
    Obj := GetObjectProperty(DataSet, 'Constraints'); { Do not localize }
    if (Obj <> nil) and (Obj is TCheckConstraints) then
    begin
      Constraints := Obj as TCheckConstraints;
      try
        for i := 0 to Constraints.Count - 1 do
          with Constraints[i] do
          begin
            AddSQLExprAttr(ExprParser, ImportedConstraint, ErrorMessage, '', 0,
              ctRecord, False);
            AddSQLExprAttr(ExprParser, CustomConstraint, ErrorMessage, '', 0,
              ctRecord, False);
          end;
      except
        on E: Exception do
        begin
          if DataSet.Name <> '' then
            ErrMsg := Format('%s: %s',[DataSet.Name, SRecConstFail]) else
            ErrMsg := SRecConstFail;
          raise EDSWriter.CreateFmt(ErrMsg, [E.Message]);
        end;
      end;
    end;
    for i := 0 to DataSet.FieldList.Count - 1 do
      with DataSet.FieldList[i] do
      begin
        try
          AddSQLExprAttr(ExprParser, DefaultExpression, '', FullName, i + 1,
            ctDefault, False);
        except
          on E: Exception do
          begin
            if Name <> '' then
              ErrMsg := Format('%s: %s',[Name, SDefExprFail]) else
            if DataSet.Name <> '' then
              ErrMsg := Format('%s.%s: %s',[DataSet.Name, FullName, SDefExprFail]) else
              ErrMsg := Format('%s: %s',[FullName, SDefExprFail]);
            raise EDSWriter.CreateFmt(ErrMsg, [E.Message]);
          end;
        end;
        try
          AddSQLExprAttr(ExprParser, ImportedConstraint, ConstraintErrorMessage,
            FullName, i + 1, ctField, False);
          AddSQLExprAttr(ExprParser, CustomConstraint, ConstraintErrorMessage,
            FullName, i + 1, ctField, False);
        except
          on E: Exception do
          begin
            if Name <> '' then
              ErrMsg := Format('%s: %s',[Name, SFieldConstFail]) else
            if DataSet.Name <> '' then
              ErrMsg := Format('%s.%s: %s',[DataSet.Name, FullName, SFieldConstFail]) else
              ErrMsg := Format('%s: %s',[FullName, SFieldConstFail]);
            raise EDSWriter.CreateFmt(ErrMsg, [E.Message]);
          end;
        end;
      end;
  finally
    ExprParser.Free;
  end;
end;

procedure TDataPacketWriter.AddIndexDefs(DataSet: TDataSet; const Info: TInfoArray);
var
  i, j: Integer;
  FieldList, CaseList, DescList: TList;
  DefIdx: TIndexDef;
  Obj: TObject;
  IndexDefs: TIndexDefs;
  KeyList: OleVariant;
  TempStr: string;
begin
  Obj := GetObjectProperty(DataSet, 'IndexDefs'); { Do not localize }
  if (Obj = nil) or (not (Obj is TIndexDefs)) then Exit;
  IndexDefs := Obj as TIndexDefs;
  IndexDefs.Update;
  DefIdx := nil;
  TempStr := GetStringProperty(DataSet, 'IndexName'); { Do not localize }
  if TempStr <> '' then
    DefIdx := IndexDefs.Find(TempStr);
  if DefIdx = nil then
  begin
    TempStr := GetStringProperty(DataSet, 'IndexFieldNames'); { Do not localize }
    if TempStr <> '' then
      DefIdx := IndexDefs.FindIndexForFields(TempStr);
  end;
  if DefIdx = nil then
    for i := 0 to IndexDefs.Count - 1 do
      if ixPrimary in IndexDefs[i].Options then
      begin
        DefIdx := IndexDefs[i];
        break;
      end;
  if DefIdx = nil then
    for i := 0 to IndexDefs.Count - 1 do
      if ixUnique in IndexDefs[i].Options then
      begin
        DefIdx := IndexDefs[i];
        break;
      end;
  FieldList := TList.Create;
  try
    CaseList := TList.Create;
    try
      DescList := TList.Create;
      try
        for i := 0 to IndexDefs.Count - 1 do
          with IndexDefs[i] do
          begin
            if (not (ixUnique in Options)) and (IndexDefs[i] <> DefIdx) and
               (not (ixPrimary in Options)) then continue;
            try
              DataSet.GetFieldList(FieldList, Fields);
              DataSet.GetFieldList(CaseList, CaseInsFields);
              DataSet.GetFieldList(DescList, DescFields);
            except
              continue;
            end;
            KeyList := VarArrayCreate([0, FieldList.Count - 1], varSmallInt);
            for j := 0 to FieldList.Count - 1 do
            begin
              KeyList[j] := GetFieldIdx(TField(FieldList[j]).FieldName, Info);
              if CaseList.IndexOf(FieldList[j]) <> -1 then
                KeyList[j] := KeyList[j] or dskeyCASEINSENSITIVE;
              if DescList.IndexOf(FieldList[j]) <> -1 then
                KeyList[j] := KeyList[j] or dskeyDESCENDING;
            end;
            if (ixDescending in Options) and (FieldList.Count = 1) then
              KeyList[0] := KeyList[0] or dskeyDESCENDING;
            if (ixCaseInSensitive in Options) and (FieldList.Count = 1) then
              KeyList[0] := KeyList[0] or dskeyCASEINSENSITIVE;
            if (DefIdx = IndexDefs[i]) or ((DefIdx = nil) and (ixUnique in Options)) then
              AddAttribute(pcktAttrArea, szDEFAULT_ORDER, KeyList, False);
            if ixUnique in Options then
              AddAttribute(pcktAttrArea, szUNIQUE_KEY, KeyList, False);
          end;
      finally
        DescList.Free;
      end;
    finally
      CaseList.Free;
    end;
  finally
    FieldList.Free;
  end;
end;

procedure TDataPacketWriter.AddFieldLinks(const Info: TInfoArray);
var
  MasterFields, DetailFields: TList;
  i, j: Integer;
  LinkFields: Variant;
begin
  MasterFields := TList.Create;
  try
    DetailFields := TList.Create;
    try
      for i := 0 to High(Info) do
        if Info[i].IsDetail and (Info[i].Field = nil) then
        begin
          Info[i].DataSet.GetDetailLinkFields(MasterFields, DetailFields);
          if (MasterFields.Count > 0) and (MasterFields.Count <= DetailFields.Count) then
          begin
            LinkFields := VarArrayCreate([0, MasterFields.Count * 2], varSmallInt);
            LinkFields[0] := Info[i].LocalFieldIndex;
            for j := 0 to MasterFields.Count - 1 do
            begin
              LinkFields[j * 2 + 1] := GetFieldIdx(TField(MasterFields[j]).FieldName,
                Info);
              LinkFields[j * 2 + 2] := GetFieldIdx(TField(DetailFields[j]).FieldName,
                TInfoArray(Info[i].FieldInfos));
            end;
            AddAttribute(pcktAttrArea, szMD_FIELDLINKS, LinkFields, False);
          end;
        end;
    finally
      DetailFields.Free;
    end;
  finally
    MasterFields.Free;
  end;
end;

function TDataPacketWriter.CheckFastScan(DataSet: TDataSet): Boolean;
var
  i: Integer;
begin
  Result := DataSet.DataSetField = nil;
  if Result then
    for i := 0 to DataSet.FieldCount - 1 do
      if (DataSet.Fields[i].DataType in [ftDataSet, ftReference]) then
      begin
        Result := False;
        break;
      end;
end;

procedure TDataPacketWriter.WriteMetaData(DataSet: TDataSet; const Info: TInfoArray;
  IsReference: Boolean);
var
  i, MDOptions: Integer;
begin
  for i := 0 to High(Info) do
    AddColumn(Info[i]);
  if (poReadOnly in Options) or IsReference then
    AddAttribute(pcktAttrArea, szREADONLY, True, False);
  AddAttribute(pcktAttrArea, szUPDATEMODE, Ord(UpdateMode), True);
  if Constraints then
    AddConstraints(DataSet);
  AddIndexDefs(DataSet, Info);
  AddFieldLinks(Info);
  MDOptions := 0;
  if poCascadeDeletes in Options then MDOptions := dsCASCADEDELETES;
  if poCascadeUpdates in Options then MDOptions := MDOptions or dsCASCADEUPDATES;
  if MDOptions <> 0 then
    AddAttribute(pcktAttrArea, szMD_SEMANTICS, MDOptions, True);
  AddDataSetAttributes(DataSet);
  if Info <> FPutFieldInfo then
    Check(FDSWriter.AddAttribute(pcktAttrArea, nil, 0, 0, nil));
end;

procedure TDataPacketWriter.RefreshPutProcs(ADataSet: TDataSet; var Info: TInfoArray);

  procedure RefreshInfo(ADataSet: TDataSet; AField: TField; var Info: TPutFieldInfo);
  begin
    Info.Field := AField;
    if AField = nil then
      Info.DataSet := ADataSet else
      Info.DataSet := AField.DataSet;
  end;

var
  i: Integer;
  List: TList;
begin
  List := TList.Create;
  try
    ADataSet.GetDetailDataSets(List);
    for i := 0 to ADataSet.FieldCount - 1 do
      RefreshInfo(ADataSet, ADataSet.Fields[i], Info[i]);
    for i := 0 to List.Count - 1 do
      RefreshInfo(TDataSet(List[i]), nil, Info[ADataSet.FieldCount + i]);
  finally
    List.Free;
  end;
end;

function TDataPacketWriter.InitPutProcs(ADataSet: TDataSet;
  var GlobalIdx: Integer): TInfoArray;

  procedure InitInfoStruct(var Info: TPutFieldInfo; AField: TField;
    var GlobalIdx, LocalIdx: Integer);
  begin
    FillChar(Info, SizeOf(Info), 0);
    with Info do
    begin
      IsDetail := AField = nil;
      Field := AField;
      Inc(GlobalIdx);
      LocalFieldIndex := LocalIdx;
      Inc(LocalIdx);
      if Field <> nil then
      begin
        FieldNo := Field.FieldNo;
        Size := Field.DataSize;
        DataSet := Field.DataSet;
      end;
    end;
  end;

  procedure InitFieldProc(ADataSet: TDataSet; AField: TField;
    var Info: TPutFieldInfo; var GlobalIdx, LocalIdx: Integer);
  var
    i: Integer;
    NestedIdx: Integer;
  begin
    with Info do
    begin
      InitInfoStruct(Info, AField, GlobalIdx, LocalIdx);
      if AField = nil then { Linked dataset }
      begin
        Opened := not ADataSet.Active;
        if Opened then ADataSet.Open;
        DataSet := ADataSet;
        PutProc := PutDataSetField;
        FastScan := CheckFastScan(DataSet);
        TInfoArray(FieldInfos) := InitPutProcs(DataSet, GlobalIdx);
      end else
      begin
        case Field.DataType of
          ftString, ftFixedChar:
          begin
            PutProc := PutStringField;
            Dec(Size);  { Don't count the null terminator }
          end;
          ftVarBytes:
          begin
            PutProc := PutVarBytesField;
            Dec(Size, 2); { Don't write size bytes }
          end;
          ftADT:
          with TADTField(Field) do
          begin
            PutProc := PutADTField;
            SetLength(TInfoArray(FieldInfos), FieldCount);
            for i := 0 to FieldCount - 1 do
              InitFieldProc(ADataSet, Fields[i], TInfoArray(FieldInfos)[i],
                GlobalIdx, LocalIdx);
          end;
          ftArray:
          with TArrayField(Field) do
          begin
            PutProc := PutArrayField;
            SetLength(TInfoArray(FieldInfos), 1);
            NestedIdx := LocalIdx;
            InitFieldProc(ADataSet, Fields[0], TInfoArray(FieldInfos)[0],
                GlobalIdx, LocalIdx);
            LocalIdx := (LocalIdx - NestedIdx) * (FieldCount - 1) + LocalIdx;
          end;
          ftDataSet, ftReference:
          with TDataSetField(Field).NestedDataSet do
          begin
            PutProc := PutDataSetField;
            NestedIdx := 1;
            SetLength(TInfoArray(FieldInfos), FieldCount);
            for i := 0 to FieldCount - 1 do
              InitFieldProc(TDataSetField(Field).NestedDataSet, Fields[i],
                TInfoArray(FieldInfos)[i], GlobalIdx, NestedIdx);
          end;
          ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat, ftCurrency, ftBCD,
          ftDate, ftTime, ftDateTime, ftAutoInc, ftLargeint, ftBytes:
            PutProc := PutField;
          ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary:
            PutProc := PutBlobField;
        else
          DatabaseErrorFmt(SUnknownFieldType, [Field.FieldName]);
        end;
        if Field.FieldKind <> fkData then
          PutProc := PutCalcField;
      end;
    end;
  end;

var
  i, LocalIdx: Integer;
  List: TList;
begin
  LocalIdx := 1;
  List := TList.Create;
  try
    ADataSet.GetDetailDataSets(List);
    SetLength(Result, ADataSet.FieldCount + List.Count);
    for i := 0 to ADataSet.FieldCount - 1 do
      InitFieldProc(ADataSet, ADataSet.Fields[i], Result[i], GlobalIdx, LocalIdx);
    for i := 0 to List.Count - 1 do
      InitFieldProc(TDataSet(List[i]), nil, Result[ADataSet.FieldCount + i],
        GlobalIdx, LocalIdx);
  finally
    List.Free;
  end;
end;

procedure TDataPacketWriter.GetDataPacket(DataSet: TDataSet;
  var RecsOut: Integer; out Data: OleVariant);

  procedure CheckMetaData(DataSet: TDataSet);
  var
    Idx: Integer;
    TempPacket: TDataPacket;
    Version: Integer;
  begin
    Idx := 1;
    if (FPutFieldInfo = nil) or (MetaData) then
    begin
      FDSWriter := CreateComObject(CLSID_DSWriter) as IDSWriter;
      if FPutFieldInfo <> nil then
      begin
        FreeInfoRecords(FPutFieldInfo);
        FPutFieldInfo := nil;
      end;
      FPutFieldInfo := InitPutProcs(DataSet, Idx);
      if poFetchBlobsOnDemand in Options then
        Version := PACKETVERSION_2 else
        Version := PACKETVERSION_1;
      Check(FDSWriter.Init_Sequential(Version, Idx - 1));
      WriteMetaData(DataSet, FPutFieldInfo);
      if not MetaData then
      begin
        FDSWriter.GetDataPacket(TempPacket);
        SafeArrayDestroy(TempPacket);
        TempPacket := nil;
      end;
    end;
    if not MetaData then
      Check(FDSWriter.Reset);
  end;

var
  DataPacket: TDataPacket;
begin
  CheckMetaData(DataSet);
  RecsOut := WriteDataSet(DataSet, FPutFieldInfo, RecsOut, CheckFastScan(DataSet));
  FDSWriter.GetDataPacket(DataPacket);
  DataPacketToVariant(DataPacket, Data);
end;

{ TPacketDataSet }

procedure TPacketDataSet.CreateFromDelta(Source: TPacketDataSet);
var
  TempBase: IDSBase;
begin
  Source.Check(Source.DSBase.Clone(2, True, False, TempBase));
  DSBase := TempBase;
  Open;
end;

procedure TPacketDataSet.InternalInitRecord(Buffer: PChar);
var
  I: Integer;
begin
  inherited InternalInitRecord(Buffer);
  { Initialize new records in the error result dataset to unchanged values }
  for I := 1 to FieldCount do
    DSBase.PutBlank(PByte(Buffer), 0, I, BLANK_NOTCHANGED);
end;

procedure TPacketDataSet.InternalOpen;
var
  MDSem: DWord;
begin
  inherited InternalOpen;
  FOldRecBuf := AllocRecordBuffer;
  FCurRecBuf := AllocRecordBuffer;
  DSBase.GetProp(dspropMD_SEMANTICS, @MDSem);
  MDSem := MDSem and mdCASCADEMOD;
  DSBase.SetProp(dspropMD_SEMANTICS, MDSem);
end;

procedure TPacketDataSet.InternalClose;
begin
  inherited InternalClose;
  FreeRecordBuffer(FOldRecBuf);
  FreeRecordBuffer(FCurRecBuf);
end;

function TPacketDataSet.GetStateFieldValue(State: TDataSetState; Field: TField): Variant;
begin
  { When reading an OldValue, return the CurValue instead if we have one }
  if FUseCurValues and (State = dsOldValue) and HasCurValues then
  begin
    Result := inherited GetStateFieldValue(dsCurValue, Field);
    if not VarIsEmpty(Result) then Exit;
  end;
  Result := inherited GetStateFieldValue(State, Field);
end;

function TPacketDataSet.GetStreamMetaData: Boolean;
var
  Value: Integer;
begin
  DSBase.GetProp(DSProp(dspropDONTINCLMETADATA), @Value);
  Result := Value <> 0;
end;

procedure TPacketDataSet.SetStreamMetaData(Value: Boolean);
begin
  DSBase.SetProp(DSProp(dspropDONTINCLMETADATA), Integer(not Value));
end;

function TPacketDataSet.UpdateKind: TUpdateKind;
begin
  case UpdateStatus of
    usInserted: Result := ukInsert;
    usDeleted: Result := ukDelete;
  else
    Result := ukModify;
  end;
end;

procedure TPacketDataSet.DataEvent(Event: TDataEvent; Info: Integer);
begin
  if Event in [deDataSetScroll, deDataSetChange] then
  begin
    FNewValuesModified := False;
    FCurValues := nil;
  end;
  inherited DataEvent(Event, Info);
end;

function TPacketDataSet.HasCurValues: Boolean;
begin
  Result := FCurValues <> nil;
end;

procedure TPacketDataSet.InitAltRecBuffers(CheckModified: Boolean);
var
  No: Integer;
begin
  if UpdateStatus in [usUnmodified, usDeleted] then
    GetCurrentRecord(FOldRecBuf);
  if CheckModified and (UpdateStatus = usUnmodified) then
  begin
    No := RecNo;
    Next;
    if UpdateStatus <> usModified then
      RecNo := No;
  end;
  if UpdateStatus = usInserted then
    SetAltRecBuffers(ActiveBuffer, ActiveBuffer, FCurRecBuf) else
    SetAltRecBuffers(FOldRecBuf, ActiveBuffer, FCurRecBuf);
end;

procedure TPacketDataSet.SetFieldData(Field: TField; Buffer: Pointer);
begin
  { Set a flag when any of the field's NewValue properties are modified }
  if State = dsNewValue then
    FNewValuesModified := True;
  if FWritingCurValues then
    Check(DSCursor.PutField(FCurRecBuf, Field.FieldNo, Buffer)) else
    inherited SetFieldData(Field, Buffer);
end;

procedure TPacketDataSet.SetWritingCurValues(const Value: Boolean);
begin
  if Value then
  begin
    FCurValues := FCurRecBuf;
    InitRecord(FCurValues);
  end else
    InitAltRecBuffers;
  FWritingCurValues := Value;
end;

procedure TPacketDataSet.AssignCurValues(Source: TDataSet);
var
  I: Integer;
  NewValue: Variant;
  Field, SourceField: TField;
begin
  WritingCurValues := True;
  try
    for i := 0 to FieldCount - 1 do
    begin
      Field := Fields[i];
      SourceField := Source.FindField(Field.FieldName);
      if (SourceField <> nil) and not Field.IsBlob and
         not (Field.DataType in [ftBytes, ftVarBytes]) and
         (Field.OldValue <> SourceField.Value) then
      begin
        NewValue := Field.NewValue;
        if VarIsEmpty(Field.NewValue) or
           (NewValue <> SourceField.Value) then
          Field.Assign(SourceField);
      end;
    end;
  finally
    WritingCurValues := False;
  end;
end;

procedure TPacketDataSet.AssignCurValues(const CurValues: Variant);
var
  I: Integer;
  Field: TField;
  CurValue: Variant;
begin
  WritingCurValues := True;
  try
    if VarIsNull(CurValues) then
      FCurValues := nil
    else
      for I := VarArrayLowBound(CurValues, 1) to VarArrayHighBound(CurValues, 1) do
      begin
        if VarIsArray(CurValues[I]) then
        begin
          CurValue := CurValues[I][1];
          Field := FieldByName(CurValues[I][0])
        end else
        begin
          CurValue := CurValues[I];
          Field := Fields[I];
        end;
        if not VarIsEmpty(CurValue) then
          if (Field.OldValue <> CurValue) then
            Fields[I].Value := CurValue;
      end;
  finally
    WritingCurValues := False;
  end;
end;

function TPacketDataSet.HasMergeConflicts: Boolean;
var
  I: Integer;
  CurVal, NewVal: Variant;
begin
  Result := False;
  for I := 0 to FieldCount - 1 do
    with Fields[I] do
    begin
      CurVal := CurValue;
      if VarIsEmpty(CurVal) then Continue;
      NewVal := NewValue;
      if VarIsEmpty(NewVal) then Continue;
      if CurVal = NewVal then Continue;
      Result := True;
      Break;
    end;
end;

{ TCustomProvider }

destructor TCustomProvider.Destroy;
var
  I: Integer;
begin
  if FProviders <> nil then
  begin
    for I := 0 to FProviders.Count - 1 do
      TProviderObject(FProviders[I]).FProvider := nil;
    FProviders.Free;
    FProviders := nil;
  end;
  inherited Destroy;
end;

procedure TCustomProvider.AddProvider(AProvider: TProviderObject);
begin
  if FProviders = nil then FProviders := TList.Create;
  FProviders.Add(AProvider);
end;

procedure TCustomProvider.RemoveProvider(AProvider: TProviderObject);
begin
  if FProviders <> nil then
  begin
    FProviders.Remove(AProvider);
    if FProviders.Count = 0 then
    begin
      FProviders.Free;
      FProviders := nil;
    end;
  end;
end;

function TCustomProvider.GetProvider: IProvider;
begin
  Result := TProviderObject.Create(Self) as IProvider;
end;

function TCustomProvider.FetchParams: OleVariant;
begin
  Result := NULL;
end;

function TCustomProvider.FetchData(const Packet: OleVariant): OleVariant;
begin
  Result := NULL;
end;

function TCustomProvider.GetMetaData: OleVariant;
var
  RecsOut: Integer;
begin
  Result := GetRecords(0, RecsOut);
end;

function TCustomProvider.Get_Data: OleVariant;
var
  RecsOut: Integer;
begin
  Reset(True);
  Result := GetRecords(-1, RecsOut);
end;

function TCustomProvider.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
begin
  Result := NULL;
end;

function TCustomProvider.DataRequest(Input: OleVariant): OleVariant;
begin
  if Assigned(FOnDataRequest) then
    Result := FOnDataRequest(Self, Input) else
    Result := NULL;
end;

procedure TCustomProvider.Reset(MetaData: WordBool);
begin
end;

procedure TCustomProvider.SetParams(Values: OleVariant);
begin
end;

{ EUpdateError }

constructor EUpdateError.Create(NativeError, Context: string;
  ErrCode, PrevError: Integer; E: Exception);
begin
  FContext := Context;
  FErrorCode := ErrCode;
  FPreviousError := PrevError;
  FOriginalException := E;
  inherited Create(NativeError);
end;

destructor EUpdateError.Destroy;
begin
  FOriginalException.Free;
  inherited Destroy;
end;

{ TBaseProvider }

constructor TBaseProvider.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Constraints := False;
  FIncludeMetaData := True;
  FRecordsSent := 0;
  FProviderOptions := [];
end;

destructor TBaseProvider.Destroy;
begin
  FResolver.Free;
  inherited Destroy;
end;

procedure TBaseProvider.FreeResolver;
begin
  FResolver.Free;
  FResolver := nil;
end;

function TBaseProvider.GetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError;
var
  PrevErr: Integer;
begin
  if Prev <> nil then
    PrevErr := Prev.ErrorCode else
    PrevErr := 0;
  Result := EUpdateError.Create(E.Message, '', 0, PrevErr, E);
end;

function TBaseProvider.GetKeyFields(const Tablename: string; ADelta: TClientDataSet): string;
begin
  Result := '';
end;

function TBaseProvider.ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer): OleVariant;
begin
  if poReadOnly in Options then DatabaseError(SReadOnlyProvider);
  if not Assigned(Resolver) then FResolver := CreateResolver;
  Result := Resolver.ApplyUpdates(Delta, MaxErrors, ErrorCount);
end;

function TBaseProvider.FetchData(const Packet: OleVariant): OleVariant;
begin
  if not Assigned(Resolver) then FResolver := CreateResolver;
  Result := Resolver.FetchData(Packet);
end;

function TBaseProvider.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
begin
  try
    RecsOut := Count;
    CreateDataPacket(FIncludeMetaData or (Count = 0), Constraints, Options,
      RecsOut, Result);
    Inc(FRecordsSent, RecsOut);
    if (RecsOut <> Count) then
      Reset(False) else
      FIncludeMetaData := False;
    DoOnGetData(Result);
  except
    Reset(True);
    raise;
  end;
end;

procedure TBaseProvider.Reset(MetaData: WordBool);
begin
  FIncludeMetaData := MetaData;
end;

procedure TBaseProvider.SetParams(Values: OleVariant);
var
  I, MaxIndex: Integer;
begin
  if VarIsNull(Values) then Exit;
  if not VarIsArray(Values) then Values := VarArrayOf([Values]);
  MaxIndex := VarArrayHighBound(Values, 1);
  if MaxIndex >= ParamCount then MaxIndex := ParamCount - 1;
  for I := 0 to MaxIndex do
    if VarIsArray(Values[I]) then
      SetParamByName(Values[I][0], Values[I][1]) else
      SetParamByIndex(i, Values[I]);
  Reset(False);
end;

procedure TBaseProvider.DoOnGetData(var Data: OleVariant);
begin
  if Assigned(OnGetData) then
  begin
    if not Assigned(FDataDS) then
      FDataDS := TPacketDataSet.Create(Self) else
      FDataDS.StreamMetaData := False;
    FDataDS.AppendData(Data, False);
    OnGetData(Self, FDataDS);
    if FDataDS.ChangeCount > 0 then
    begin
      FDataDS.MergeChangeLog;
      Data := FDataDS.Data;
    end;
    FDataDS.EmptyDataSet;
  end;
end;

procedure TBaseProvider.DoOnUpdateData(Delta: TPacketDataSet);
begin
  if Assigned(FOnUpdateData) then
  begin
    Delta.LogChanges := False;
    FOnUpdateData(Self, Delta);
  end;
end;

function TBaseProvider.CreateResolver: TCustomResolver;
begin
  Result := nil;
end;

procedure TBaseProvider.CreateDataPacket(MetaData, Contraints: Boolean;
  ProvOpts: TProviderOptions; var RecsOut: Integer; var Data: OleVariant);
begin
end;

function TBaseProvider.GetParamCount: Integer;
begin
  Result := 0;
end;

procedure TBaseProvider.SetParamByName(const ParamName: String; const Value: OleVariant);
begin
end;

procedure TBaseProvider.SetParamByIndex(ParamIndex: Integer; const Value: OleVariant);
begin
end;

procedure TBaseProvider.LocateRecord(Source: TDataSet; Delta: TClientDataSet);
begin
end;

procedure TBaseProvider.UpdateRecord(Source: TDataSet; Delta: TClientDataSet;
  BlobsOnly: Boolean);
begin
end;

{ TDataSetProvider }

constructor TDataSetProvider.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUpdateMode := upWhereAll;
  FDSWriter := nil;
  FConstraints := True;
end;

destructor TDataSetProvider.Destroy;
begin
  FDSWriter.Free;
  inherited Destroy;
end;

function TDataSetProvider.FetchData(const Packet: OleVariant): OleVariant;
var
  Bookmark: TBookmarkStr;
begin
  Bookmark := DataSet.Bookmark;
  try
    if not Assigned(Resolver) then FResolver := CreateResolver;
    Resolver.FUpdateTree.InitData(DataSet);
    Result := inherited FetchData(Packet);
  finally
    if (Length(Bookmark) > 0) and (DataSet.BookmarkValid(@Bookmark[1])) then
      DataSet.Bookmark := Bookmark;
  end;
end;

function TDataSetProvider.ApplyUpdates(var Delta: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer): OleVariant;
begin
  if not Assigned(Resolver) then FResolver := CreateResolver;
  Resolver.FUpdateTree.InitData(DataSet);
  Result := inherited ApplyUpdates(Delta, MaxErrors, ErrorCount);
end;

function TDataSetProvider.DoGetDataSet(const Name: string): TDataSet;
begin
  Result := TDataSet(Owner.FindComponent(Name));
end;

function TDataSetProvider.GetDataSet: TDataSet;
begin
  Result := FDataSet;
end;

procedure TDataSetProvider.SetDataSet(ADataSet: TDataSet);
begin
  FDataSet := ADataSet;
end;

function TDataSetProvider.CreateResolver: TCustomResolver;
begin
  Result := TDataSetResolver.Create(Self);
end;

function TDataSetProvider.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
begin
  if not Assigned(DataSet) then DatabaseError(SMissingDataSet);
  if not DataSet.Active then
  begin
    DataSet.Open;
    FDataSetOpened := True;
    FIncludeMetaData := True;
  end;
  DataSet.CheckBrowseMode;
  if (Count = AllRecords) and (FRecordsSent = 0) then
    DataSet.First;
  Result := inherited GetRecords(Count, RecsOut);
end;

procedure TDataSetProvider.DoGetParams(DataSet: TDataSet; List: TList);
var
  CustParams: OleVariant;
  Attr: PPacketAttribute;
  i, j: Integer;
begin
  DataSet.GetProviderAttributes(List);
  if Assigned(FGetDSProps) then
  begin
    FGetDSProps(Self, DataSet, CustParams);
    if VarIsArray(CustParams) then
    begin
      for i := VarArrayLowBound(CustParams, 1) to VarArrayHighBound(CustParams, 1) do
      begin
        if VarIsArray(CustParams[i]) and
          (VarArrayHighBound(CustParams[i], 1) - VarArrayLowBound(CustParams[i], 1) = 2) then
        begin
          j := VarArrayLowBound(CustParams[i], 1);
          New(Attr);
          List.Add(Attr);
          with Attr^ do
          begin
            Name := CustParams[i][j];
            Value := CustParams[i][j + 1];
            IncludeInDelta := CustParams[i][j + 2];
          end;
        end;
      end;
    end;
  end;
end;

procedure TDataSetProvider.CreateDataPacket(MetaData, Contraints: Boolean;
  ProvOpts: TProviderOptions; var RecsOut: Integer; var Data: OleVariant);
begin
  if not Assigned(FDSWriter) then
    FDSWriter := TDataPacketWriter.Create;
  FDSWriter.OnGetParams := DoGetParams;
  FDSWriter.UpdateMode := UpdateMode;
  FDSWriter.MetaData := MetaData;
  FDSWriter.Constraints := Constraints;
  FDSWriter.Options := ProvOpts;
  FDSWriter.GetDataPacket(DataSet, RecsOut, Data);
end;

procedure TDataSetProvider.Reset(MetaData: WordBool);
begin
  if Assigned(DataSet) then
  begin
    if FDataSetOpened then
    begin
      DataSet.Close;
      FDataSetOpened := False;
    end;
    if DataSet.Active then
      DataSet.First;
  end;
  inherited Reset(MetaData);
  FRecordsSent := 0;
  if MetaData then
  begin
    FDataDS.Free;
    FDataDS := nil;
  end;
end;

procedure TDataSetProvider.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataSet <> nil) and
    (AComponent = FDataSet) then FDataSet := nil;
end;

function TDataSetProvider.FindRecord(Source: TDataSet; Delta: TClientDataSet;
  UpdateMode: TUpdateMode): Boolean;

  procedure GetFieldList(DataSet: TDataSet; UpdateMode: TUpdateMode; List: TList);
  var
    i: Integer;
  begin
    for i := 0 to DataSet.FieldCount - 1 do
      with DataSet.Fields[i] do
      begin
        if (DataType in [ftBytes, ftVarBytes]) or IsBlob or
           (DataSet.Fields[i] is TObjectField) then continue;
        case UpdateMode of
          upWhereKeyOnly:
            if pfInKey in ProviderFlags then List.Add(DataSet.Fields[i]);
          upWhereAll:
            if pfInWhere in ProviderFlags then List.Add(DataSet.Fields[i]);
          upWhereChanged:
            if (pfInKey in ProviderFlags) or (not VarIsEmpty(NewValue)) then
              List.Add(DataSet.Fields[i]);
        end;
      end;
  end;

var
  i: Integer;
  KeyValues: Variant;
  Fields: string;
  FieldList: TList;
  IsDelta: BOOL;
begin
  Result := False;
  TPacketDataSet(Delta).DSBase.GetProp(dspropISDELTA, @IsDelta);
  FieldList := TList.Create;
  try
    GetFieldList(Delta, UpdateMode, FieldList);
    if FieldList.Count > 1 then
    begin
      KeyValues := VarArrayCreate([0, FieldList.Count - 1], varVariant);
      Fields := '';
      for i := 0 to FieldList.Count - 1 do
        with TField(FieldList[i]) do
        begin
          if IsDelta then
            KeyValues[i] := OldValue else
            KeyValues[i] := Value;
          if Fields <> '' then Fields := Fields + ';';
          Fields := Fields + FieldName;
        end;
      Result := Source.Locate(Fields, KeyValues, []);
    end
    else if FieldList.Count = 1 then
    begin
      with TField(FieldList[0]) do
        if IsDelta then
          Result := Source.Locate(FieldName, OldValue, []) else
          Result := Source.Locate(FieldName, Value, []);
    end else
      DatabaseError(SNoKeySpecified);
  finally
    FieldList.Free;
  end;
end;

procedure TDataSetProvider.LocateRecord(Source: TDataSet; Delta: TClientDataSet);
begin
  if not FindRecord(Source, Delta, UpdateMode) then
    DatabaseError(SRecordChanged);
end;

procedure TDataSetProvider.UpdateRecord(Source: TDataSet; Delta: TClientDataSet;
  BlobsOnly: Boolean);
var
  Field: TField;
  i: Integer;
begin
  if (Delta.RecordCount = 0) then
  begin
    Source.First;
    while not Source.EOF do
    begin
      Delta.Insert;
      for i := 0 to Delta.FieldCount - 1 do
      begin
        Field := Source.FindField(Delta.Fields[i].FieldName);
        if Field <> nil then
          Delta.Fields[i].Assign(Field);
      end;
      Delta.Post;
      Source.Next;
    end;
  end else
  begin
    if not FindRecord(Source, Delta, upWhereKeyOnly) then
      DatabaseError(SRecordChanged);
    with Delta do
    begin
      Edit;
      for i := 0 to FieldCount - 1 do
      begin
        Field := Source.FindField(Fields[i].FieldName);
        if (Field <> nil) and (not BlobsOnly or (Field.IsBlob and VarIsNull(Fields[i].NewValue))) then
          Fields[i].Assign(Field);
      end;
      Post;
    end;
  end;
end;

{ TUpdateTree }

constructor TUpdateTree.Create(AParent: TUpdateTree; AResolver: TCustomResolver);
begin
  FResolver := AResolver;
  FParent := AParent;
  FDeltaDS := TPacketDataSet.Create(nil);
  FDeltaDS.ObjectView := True;
  FDeltaDS.FieldDefs.HiddenFields := True;
  FDetails := TList.Create;
end;

destructor TUpdateTree.Destroy;
begin
  if Assigned(FResolver) then
    FResolver.FreeTreeData(Self);
  Clear;
  if not Assigned(Parent) then
    FDeltaDS.Free;
  inherited Destroy;
end;

procedure TUpdateTree.Clear;
var
  i: Integer;
begin
  for i := 0 to DetailCount - 1 do
    Details[i].Free;
  FDetails.Clear;
  FDeltaDS.Data := NULL;
  if not Assigned(Parent) then
  begin
    FErrorDS.Free;
    FErrorDS := nil;
  end;
end;

function TUpdateTree.GetTree(const AName: string): TUpdateTree;
var
  i: Integer;
begin
  for i := 0 to DetailCount - 1 do
    if Details[i].Name = AName then
    begin
      Result := Details[i];
      Exit;
    end;
  Result := TUpdateTree.Create(Self, FResolver);
  Result.Name := AName;
  FDetails.Add(Result);
end;

procedure TUpdateTree.InitData(ASource: TDataSet);
var
  i: Integer;
  Tree: TUpdateTree;
  List: TList;
begin
  FSourceDS := ASource;
  FSourceDS.Open;
  for i := 0 to FSourceDS.FieldCount - 1 do
    if FSourceDS.Fields[i].DataType in [ftDataSet] then
      with TDataSetField(FSourceDS.Fields[i]) do
      begin
        Tree := GetTree(FSourceDS.Fields[i].FieldName);
        Tree.InitData(NestedDataSet);
      end;
  List := TList.Create;
  try
    FSourceDS.GetDetailDataSets(List);
    for i := 0 to List.Count - 1 do
    begin
      Tree := GetTree(TDataSet(List[i]).Name);
      Tree.InitData(TDataSet(List[i]));
    end;
  finally
    List.Free;
  end;
end;

procedure TUpdateTree.InitDelta(ADelta: TPacketDataSet);
var
  i: Integer;
  Attr: Variant;
  KeySet: Boolean;
  Tree: TUpdateTree;
  ADataSources: DataSources;
begin
  FDeltaDS := ADelta;
  FDeltaDS.LogChanges := False;
  KeySet := False;
  FTableName := FDeltaDS.GetOptionalParam(szTABLE_NAME);
  for i := 0 to FDeltaDS.FieldCount - 1 do
  begin
    Attr := FDeltaDS.InternalGetOptionalParam(szPROVFLAGS, FDeltaDS.Fields[i].FieldNo);
    if not (VarIsNull(Attr) or VarIsEmpty(Attr)) then
      FDeltaDS.Fields[i].ProviderFlags := TProviderFlags(Byte(Attr));
    Attr := FDeltaDS.InternalGetOptionalParam(szORIGIN, FDeltaDS.Fields[i].FieldNo);
    if not (VarIsNull(Attr) or VarIsEmpty(Attr)) then
      FDeltaDS.Fields[i].Origin := Attr;
    Attr := FDeltaDS.InternalGetOptionalParam(szSERVERCALC, FDeltaDS.Fields[i].FieldNo);
    if not (VarIsEmpty(Attr) or VarIsNull(Attr)) and
      (VarType(Attr) = varBoolean) and Boolean(Attr) then
      FDeltaDS.Fields[i].Tag := tagSERVERCALC;
    StrCopy(ADataSources.szSourceFldName, PChar(FDeltaDS.Fields[i].FieldName));
    if GetFieldSource(FDeltaDS, ADataSources) then
      FDeltaDS.Fields[i].Origin := ADataSources.szOrigFldName else
      FDeltaDS.Fields[i].Origin := FDeltaDS.Fields[i].FieldName;
    if pfInKey in FDeltaDS.Fields[i].ProviderFlags then
      KeySet := True;
    if Delta.Fields[i].DataType = ftDataSet then
      with TDataSetField(Delta.Fields[i]) do
      begin
        Tree := GetTree(Delta.Fields[i].FieldName);
        Tree.InitDelta(TPacketDataSet(NestedDataSet));
      end;
  end;
  FResolver.InitTreeData(Self);
  if (FTableName <> '') and not KeySet then
    FResolver.InitKeyFields(Self, FDeltaDS);
end;

procedure TUpdateTree.InitDelta(const ADelta: OleVariant);
var
  V: OleVariant;
begin
  if FDeltaDS.Active then Clear;
  FDeltaDS.Data := ADelta;
  V := FDeltaDS.GetOptionalParam(szUPDATEMODE);
  if VarIsNull(V) or VarIsEmpty(V) then
    FResolver.UpdateMode := upWhereAll else
    FResolver.UpdateMode := TUpdateMode(V);
  InitDelta(FDeltaDS);
end;

function TUpdateTree.GetDetailCount: Integer;
begin
  Result := FDetails.Count;
end;

function TUpdateTree.GetDetail(Index: Integer): TUpdateTree;
begin
  Result := TUpdateTree(FDetails[Index]);
end;

procedure TUpdateTree.RefreshData;
var
  i: Integer;
  DoUpdate, BlobsOnly: Boolean;
  Tree: TUpdateTree;
begin
  DoUpdate := True;
  BlobsOnly := False;
  if Delta.RecordCount > 0 then
  begin
    for i := 0 to Delta.FieldCount - 1 do
      with Delta.Fields[i] do
      begin
        if (DataType = ftDataSet) and VarIsNull(NewValue) then
        begin
          DoUpdate := False;
          break;
        end;
        if IsBlob and VarIsNull(NewValue) then
        begin
          BlobsOnly := True;
          break;
        end;
      end;
  end;
  if DoUpdate then
    FResolver.Provider.UpdateRecord(Source, Delta, BlobsOnly) else
    FResolver.Provider.LocateRecord(Source, Delta);
  for i := 0 to Delta.FieldCount - 1 do
  begin
    if (Delta.Fields[i] is TDataSetField) and VarIsNull(Delta.Fields[i].NewValue) then
    begin
      Tree := GetTree(Delta.Fields[i].FieldName);
      if Tree <> nil then
        Tree.RefreshData;
    end;
  end;
end;

function TUpdateTree.DoUpdates: Boolean;
var
  i: Integer;
begin
  Result := True;
  Delta.First;
  while not Delta.EOF do
  begin
    Delta.InitAltRecBuffers(False);
    FResolver.InternalBeforeResolve(Self);
    if (Delta.UpdateStatus = usInserted) then
    begin
      Result := FResolver.InternalUpdateRecord(Self);
      if not Result then Exit;
    end;
    for i := 0 to DetailCount - 1 do
    begin
      Result := Details[i].DoUpdates;
      if not Result then Exit;
    end;
    if Delta.UpdateStatus = usUnmodified then
      Delta.InitAltRecBuffers(True);
    if (Delta.UpdateStatus = usModified) then
      Result := FResolver.InternalUpdateRecord(Self);
    if (Delta.UpdateStatus = usDeleted) then
      Result := FResolver.InternalUpdateRecord(Self);
    if not Result then Exit;
    Delta.Next;
  end;
end;

function TUpdateTree.GetErrorDS: TPacketDataSet;
var
  Field: TField;
begin
  if not Assigned(FErrorDS) then
  begin
    if not Assigned(Parent) then
    begin
      FErrorDS := TPacketDataSet.Create(nil);
      FErrorDS.ObjectView := True;
      FErrorDS.CreateFromDelta(Delta);
    end else
    begin
      Field := Parent.ErrorDS.FieldByName(Delta.DataSetField.FieldName);
      FErrorDS := (Field as TDataSetField).NestedDataSet as TPacketDataSet;
    end;
    FErrorDS.LogChanges := False;
    FErrorDS.DSBase.SetProp(DSProp(dspropAUTOINC_DISABLED), Integer(True));
  end;
  Result := FErrorDS;
end;

function TUpdateTree.GetHasErrors: Boolean;
begin
  Result := Assigned(FErrorDS);
end;

procedure TUpdateTree.InitErrorPacket(E: EUpdateError; Response: TResolverResponse);
var
  TrueRecNo: DWord;
begin
  with ErrorDS do
  begin
    if Assigned(Parent) then Parent.InitErrorPacket(nil, rrSkip);
    Self.Delta.UpdateCursorPos;
    Self.Delta.DSCursor.GetRecordNumber(TrueRecNo);
    if not Locate('ERROR_RECORDNO', TrueRecNo, []) then
      Append else
      Edit;
    if not Assigned(E) then
    begin
      SetFields([TrueRecNo]);
      Post;
    end else
      SetFields([TrueRecNo, Ord(Response)+1, E.Message, '', 1,
      1]);
  end;
end;

{ TCustomResolver }

constructor TCustomResolver.Create(AProvider: TBaseProvider);
begin
  FProvider := AProvider;
  FUpdateTree := TUpdateTree.Create(nil, Self);
end;

destructor TCustomResolver.Destroy;
begin
  FUpdateTree.Free;
  inherited Destroy;
end;

{ Updates }

procedure TCustomResolver.BeginUpdate;
begin
end;

procedure TCustomResolver.EndUpdate;
begin
end;

procedure TCustomResolver.InitKeyFields(Tree: TUpdateTree; ADelta: TPacketDataSet);
var
  Pos, i: Integer;
  KeyFields, FieldName: string;
begin
  KeyFields := Provider.GetKeyFields(Tree.Tablename, ADelta);
  Pos := 1;
  while Pos <= Length(KeyFields) do
  begin
    FieldName := ExtractFieldName(KeyFields, Pos);
    for i := 0 to ADelta.FieldCount - 1 do
      if AnsiCompareText(FieldName, ADelta.Fields[i].Origin) = 0 then
      begin
        ADelta.Fields[i].ProviderFlags := ADelta.Fields[i].ProviderFlags + [pfInKey];
        break;
      end;
  end;
end;

procedure TCustomResolver.InitTreeData(Tree: TUpdateTree);
begin
end;

procedure TCustomResolver.FreeTreeData(Tree: TUpdateTree);
begin
end;

procedure TCustomResolver.InternalBeforeResolve(Tree: TUpdateTree);
begin
end;

function TCustomResolver.InternalUpdateRecord(Tree: TUpdateTree): Boolean;
type
  PRaiseFrame = ^TRaiseFrame;
  TRaiseFrame = record
    NextRaise: PRaiseFrame;
    ExceptAddr: Pointer;
    ExceptObject: TObject;
    ExceptionRecord: PExceptionRecord;
  end;
var
  RecNoSave: Integer;
  Applied: Boolean;
  UpdateKind: TUpdateKind;
  E: Exception;
  PrevErr, Err: EUpdateError;
begin
  PrevErr := nil;
  Err := nil;
  Tree.Delta.UseCurValues := False;
  while True do
  try
    UpdateKind := Tree.Delta.UpdateKind;
    if ((UpdateKind = ukInsert) and (FPrevResponse in [rrMerge, rrApply])) or
       ((FPrevResponse = rrMerge) and Tree.Delta.HasMergeConflicts) then
      DatabaseError(SInvalidResponse);
    Applied := False;
    RecNoSave := Tree.Delta.RecNo;
    try
      if Assigned(Provider.BeforeUpdateRecord) then
        Provider.BeforeUpdateRecord(Provider, Tree.Source, Tree.Delta, UpdateKind, Applied);
    finally
      if Tree.Delta.RecNo <> RecNoSave then
        Tree.Delta.RecNo := RecNoSave;
    end;
    if not Applied then
      case UpdateKind of
        ukModify: DoUpdate(Tree);
        ukDelete: DoDelete(Tree);
        ukInsert: DoInsert(Tree);
      end;
    if Assigned(Provider.AfterUpdateRecord) then
      Provider.AfterUpdateRecord(Provider, Tree.Source, Tree.Delta, UpdateKind);
    Break;
  except
    if RaiseList <> nil then
    begin
      { Remove the exception }
      E := Exception(PRaiseFrame(RaiseList)^.ExceptObject);
      PRaiseFrame(RaiseList)^.ExceptObject := nil;
      PrevErr.Free;
      PrevErr := Err;
      Err := Provider.GetUpdateException(E, PrevErr);
      if HandleUpdateError(Tree, Err, FMaxErrors, FErrorCount) then
      begin
        Tree.Delta.UseCurValues := True;
        Continue;
      end else
        break;
    end;
  end;
  PrevErr.Free;
  Err.Free;
  FPrevResponse := rrSkip;
  Result := FErrorCount <= FMaxErrors;
end;

function TCustomResolver.FetchData(const Packet: OleVariant): OleVariant;
begin
  FUpdateTree.InitDelta(Packet);
  try
    FUpdateTree.RefreshData;
    Result := FUpdateTree.Delta.Data;
  finally
    FUpdateTree.Clear;
  end;
end;

function TCustomResolver.ApplyUpdates(const Delta: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer): OleVariant;
begin
  BeginUpdate;
  try
    FUpdateTree.InitDelta(Delta);
    try
      Provider.DoOnUpdateData(FUpdateTree.Delta);
      FPrevResponse := rrSkip;
      if MaxErrors = -1 then MaxErrors := MaxInt;
      FMaxErrors := MaxErrors;
      FErrorCount := 0;
      FUpdateTree.DoUpdates;
      ErrorCount := FErrorCount;
      if FUpdateTree.HasErrors then
        Result := FUpdateTree.ErrorDS.Data else
        Result := Null;
    finally
      FUpdateTree.Clear;
    end;
  finally
    EndUpdate;
  end;
end;

{ Update error handling }

function TCustomResolver.HandleUpdateError(Tree: TUpdateTree;
  E: EUpdateError; var MaxErrors, ErrorCount: Integer): Boolean;
var
  Response: TResolverResponse;
  UpdateKind: TUpdateKind;
begin
  UpdateKind := Tree.Delta.UpdateKind;
  if ErrorCount < MaxErrors then
    Response := rrSkip else
    Response := rrAbort;

  InitializeConflictBuffer(Tree);
  if Assigned(Provider.OnUpdateError) then
    Provider.OnUpdateError(Provider, Tree.Delta, E, UpdateKind, Response);
  if Response in [rrSkip, rrAbort] then
  begin
    Inc(ErrorCount);
    if ErrorCount > MaxErrors then
      Response := rrAbort;
    if (Response = rrAbort) then
      MaxErrors := ErrorCount - 1;
    if Response in [rrSkip, rrAbort] then
      LogUpdateError(Tree, E, Response);
  end;
  FPrevResponse := Response;
  Result := Response in [rrMerge, rrApply];
end;

procedure TCustomResolver.LogUpdateError(Tree: TUpdateTree;
  E: EUpdateError; Response: TResolverResponse);
var
  I: Integer;
  CurVal: Variant;
begin
  Tree.InitErrorPacket(E, Response);
  if Tree.Delta.HasCurValues then
    for I := 0 to Tree.Delta.FieldCount - 1 do
    begin
      { Blobs, Bytes and VarBytes are not included in result packet }
      if (Tree.Delta.Fields[I].IsBlob) or
         (Tree.Delta.Fields[I].DataType in [ftBytes, ftVarBytes]) then
        continue;
      CurVal := Tree.Delta.Fields[I].CurValue;
      if not VarIsEmpty(CurVal) then
        Tree.ErrorDS.FieldByName(Tree.Delta.Fields[I].FieldName).Value := CurVal;
    end;
  Tree.ErrorDS.Post;
end;

{ TDataSetResolver }

constructor TDataSetResolver.Create(AProvider: TDataSetProvider);
begin
  inherited Create(AProvider);
end;

procedure TDataSetResolver.BeginUpdate;
begin
  with TDataSetProvider(Provider) do
    FBookmark := DataSet.Bookmark;
end;

procedure TDataSetResolver.EndUpdate;
begin
  with TDataSetProvider(Provider).DataSet do
    if (Length(FBookmark) > 0) and BookmarkValid(@FBookmark[1]) then
      Bookmark := FBookmark;
end;

procedure TDataSetResolver.InitializeConflictBuffer(Tree: TUpdateTree);
begin
  { Set the conflict buffer to the current values of the data }
  with TDataSetProvider(Provider) do
    if FindRecord(Tree.Source, Tree.Delta, upWhereKeyOnly) then
      Tree.Delta.AssignCurValues(Tree.Source);
end;

procedure TDataSetResolver.InternalBeforeResolve(Tree: TUpdateTree);
begin
  if Tree.Source <> nil then
    Tree.Source.Open;
  TDataSetProvider(Provider).FindRecord(Tree.Source, Tree.Delta, UpdateMode);
end;

procedure TDataSetResolver.PutRecord(Tree: TUpdateTree);

  procedure PutField(Src, Dest: TField); forward;

  procedure PutObjectField(Src, Dest: TObjectField);
  var
    i: Integer;
  begin
    if VarIsNull(Src.NewValue) then
      Dest.Clear else
      for i := 0 to Src.FieldCount - 1 do
        if (not VarIsEmpty(Src.Fields[i].NewValue)) and
           (pfInUpdate in Src.Fields[i].ProviderFlags) then
          PutField(Src.Fields[i], Dest.Fields[i]);
  end;

  procedure PutField(Src, Dest: TField);
  begin
    if (Src.DataType in [ftArray, ftADT]) then
      PutObjectField(TObjectField(Src), TObjectField(Dest)) else
    if (Src.DataType in [ftDataSet, ftReference]) then
      raise Exception.Create(SNoDataSets) else
    if (not VarIsEmpty(Src.NewValue)) and
       (pfInUpdate in Src.ProviderFlags) then
      Dest.Assign(Src);
  end;

var
  i: Integer;
  Field: TField;
begin
  with Tree do
  try
    for i := 0 to Delta.FieldCount - 1 do
    begin
      Field := Source.FindField(Delta.Fields[i].FieldName);
      if (Field <> nil) then
        PutField(Delta.Fields[i], Field);
    end;
    Source.Post;
  except
    Source.Cancel;
    raise;
  end;
end;

procedure TDataSetResolver.DoUpdate(Tree: TUpdateTree);
begin
  with Tree, TDataSetProvider(Provider) do
  begin
    if not FindRecord(Source, Delta, UpdateMode) then
      DatabaseError(SRecordChanged);
    Source.Edit;
    PutRecord(Tree);
  end;
end;

procedure TDataSetResolver.DoDelete(Tree: TUpdateTree);
begin
  with Tree, TDataSetProvider(Provider) do
  begin
    if FindRecord(Tree.Source, Tree.Delta, UpdateMode) then
      Source.Delete else
      DatabaseError(SRecordChanged);
  end;
end;

procedure TDataSetResolver.DoInsert(Tree: TUpdateTree);
begin
  Tree.Source.Append;
  PutRecord(Tree);
end;

{ TSQLResolver }

type
  PSQLInfo = ^TSQLInfo;
  TSQLInfo = record
    IsSQLBased: Boolean;
    QuoteChar: string;
    QuotedTable: string;
    QuotedTableDot: string;
    Opened: Boolean;
    HasObjects: Boolean;
  end;

constructor TSQLResolver.Create(AProvider: TBaseProvider; SQLGenInfo: TSQLGenInfo);
begin
  inherited Create(AProvider);
  FSQL := TStringList.Create;
  FParams := TParams.Create(nil);
  FExecSQL := SQLGenInfo.ExecSQLProc;
  FGetValues := SQLGenInfo.GetValuesProc;
end;

destructor TSQLResolver.Destroy;
begin
  FSQL.Free;
  FParams.Free;
  inherited Destroy;
end;

function TSQLResolver.GetQuotedTableName(Tree: TUpdateTree; const TableName: string): string;
var
  DotPos: Integer;
begin
  with PSQLInfo(Tree.Data)^ do
    if IsSQLBased then
    begin
      Result := TableName;
      DotPos := Pos('.', Result);
      if DotPos <> 0 then
      begin
        System.Insert(QuoteChar, Result, DotPos + 1);
        System.Insert(QuoteChar, Result, DotPos);
      end;
      Result := QuoteChar + Result + QuoteChar;
    end else
      Result := QuoteChar + TableName + QuoteChar;
end;

procedure TSQLResolver.InitTreeData(Tree: TUpdateTree);
var
  Info: PSQLInfo;
  i: Integer;
  V: Variant;
begin
  New(Info);
  Tree.Data := Info;
  V := Tree.Delta.GetOptionalParam(szSQLBASED);
  if not VarIsNull(V) and not VarIsEmpty(V) and (VarType(V) = varBoolean) then
    Info.IsSQLBased := V else
    Info.IsSQLBased := True;
  V := Tree.Delta.GetOptionalParam(szQUOTECHAR);
  if not VarIsNull(V) and not VarIsEmpty(V) then
    Info.QuoteChar := V else
    Info.QuoteChar := '';
  Info.QuotedTable := GetQuotedTableName(Tree, Tree.TableName);
  if Info.IsSQLBased then
    Info.QuotedTableDot := '' else
    Info.QuotedTableDot := Info.QuotedTable + '.';
  Info.HasObjects := False;
  for i := 0 to Tree.Delta.FieldCount - 1 do
    if (Tree.Delta.Fields[i] is TObjectField) and
       (TObjectField(Tree.Delta.Fields[i]).ObjectType <> '') then
    begin
      Info.HasObjects := True;
      break;
    end;
end;

procedure TSQLResolver.FreeTreeData(Tree: TUpdateTree);
begin
  Dispose(PSQLInfo(Tree.Data));
  Tree.Data := nil;
end;

procedure TSQLResolver.DoExecSQL(SQL: TStringList; Params: TParams);
begin
  if Assigned(FExecSQL) then FExecSQL(Self, SQL, Params);
end;

procedure TSQLResolver.DoGetValues(SQL: TStringList; Params: TParams;
  DataSet: TDataSet);
begin
  if Assigned(FGetValues) then FGetValues(Self, SQL, Params, DataSet);
end;

procedure TSQLResolver.InitializeConflictBuffer(Tree: TUpdateTree);
var
  Alias: string;
begin
  if PSQLInfo(Tree.Data)^.HasObjects then Alias := DefAlias else Alias := '';
  FSQL.Clear;
  FParams.Clear;
  GenSelectSQL(Tree, FSQL, FParams, Alias);
  DoGetValues(FSQL, FParams, Tree.Delta);
end;

procedure TSQLResolver.InternalDoUpdate(Tree: TUpdateTree; UpdateKind: TUpdateKind);
var
  Alias: string;
begin
  if PSQLInfo(Tree.Data)^.HasObjects then Alias := DefAlias else Alias := '';
  FSQL.Clear;
  FParams.Clear;
  case UpdateKind of
    ukModify: GenUpdateSQL(Tree, FSQL, FParams, Alias);
    ukInsert: GenInsertSQL(Tree, FSQL, FParams);
    ukDelete: GenDeleteSQL(Tree, FSQL, FParams, Alias);
  end;
  DoExecSQL(FSQL, FParams);
end;

procedure TSQLResolver.DoUpdate(Tree: TUpdateTree);
begin
  InternalDoUpdate(Tree, ukModify);
end;

procedure TSQLResolver.DoDelete(Tree: TUpdateTree);
begin
  InternalDoUpdate(Tree, ukDelete);
end;

procedure TSQLResolver.DoInsert(Tree: TUpdateTree);
begin
  InternalDoUpdate(Tree, ukInsert);
end;

{ SQL generation }

function QuoteFullName(const FullName, QuoteChar: string): string;
var
  i: Integer;
begin
  Result := Format('%s%s%0:s',[QuoteChar, FullName]);
  for i := Length(Result) downto 1 do
    if Result[i] = '.' then
    begin
      System.Insert(QuoteChar, Result, i + 1);
      System.Insert(QuoteChar, Result, i);
    end;
end;

function TSQLResolver.UseFieldInUpdate(Field: TField): Boolean;
const
  ExcludedTypes = [ftAutoInc, ftDataSet, ftADT, ftArray, ftReference, ftCursor, ftUnknown];
begin
  with Field do
  begin
    Result := (pfInUpdate in ProviderFlags) and not (DataType in ExcludedTypes) and
      not ReadOnly and (FieldKind = fkData) and not (pfHidden in ProviderFlags) and
      not VarIsEmpty(NewValue) and (Tag <> tagSERVERCALC);
  end;
end;

function TSQLResolver.UseFieldInWhere(Field: TField; Mode: TUpdateMode): Boolean;
const
  ExcludedTypes = [ftDataSet, ftADT, ftArray, ftReference, ftCursor, ftUnknown];
begin
  with Field do
  begin
    Result := not (DataType in ExcludedTypes) and not IsBlob and
      (FieldKind = fkData) and (Tag <> tagSERVERCALC);
    if Result then
      case Mode of
        upWhereAll:
          Result := pfInWhere in ProviderFlags;
        upWhereChanged:
          Result := ((pfInWhere in ProviderFlags) and not VarIsEmpty(NewValue)) or
            (pfInKey in ProviderFlags);
        upWhereKeyOnly:
          Result := pfInKey in ProviderFlags;
      end;
  end;
end;

procedure TSQLResolver.GenWhereSQL(Tree: TUpdateTree; SQL: TStrings; Params: TParams;
  GenUpdateMode: TUpdateMode; Alias: string);

  procedure AddField(Field: TField; InObject: Boolean);
  var
    i: Integer;
    BindText: string;
  begin
    with PSQLInfo(Tree.Data)^ do
    begin
      if Field.DataType = ftADT then
      begin
        for i := 0 to TObjectField(Field).FieldCount - 1 do
          AddField(TObjectField(Field).Fields[i], True);
      end else
      if UseFieldInWhere(Field, GenUpdateMode) then
      begin
        if InObject then
        begin
          if VarIsNull(Field.OldValue) then
            BindText := Format(' %s.%s is null and', [Alias,
              QuoteFullName(Field.FullName, QuoteChar)])
          else
          begin
            BindText := Format(' %s.%s = ? and',[Alias,
              QuoteFullName(Field.FullName, QuoteChar)]);
            TParam(Params.Add).AssignFieldValue(Field, Field.OldValue);
          end;
        end else
        begin
          if VarIsNull(Field.OldValue) or
             (not IsSQLBased and
              (Field.DataType = ftString) and
              (Length(Field.OldValue) = 0)) then
            BindText := Format(' %s%s%s%1:s is null and', [PSQLInfo(Tree.Data)^.QuotedTableDot,
              QuoteChar, Field.Origin])
          else
          begin
            BindText := Format(' %s%s%s%1:s = ? and',
              [PSQLInfo(Tree.Data)^.QuotedTableDot, QuoteChar, Field.Origin]);
            TParam(Params.Add).AssignFieldValue(Field, Field.OldValue);
          end;
        end;
        SQL.Add(BindText);
      end;
    end;
  end;

var
  I: Integer;
  TempStr: string;
begin
  with PSQLInfo(Tree.Data)^ do
  begin
    SQL.Add('where');
    for I := 0 to Tree.Delta.FieldCount - 1 do
      AddField(Tree.Delta.Fields[I], Alias = NestAlias);
    { Remove last ' and'};
    TempStr := SQL[SQL.Count-1];
    SQL[SQL.Count-1] := Copy(TempStr, 1, Length(TempStr) - 4);
  end;
end;

procedure TSQLResolver.GenInsertSQL(Tree: TUpdateTree; SQL: TStrings;
  Params: TParams);

  procedure AddField(Field: TField; var FieldLine, ParamLine: string);
  var
    i: Integer;
    TempStr: string;
    Value: Variant;
  begin
    with PSQLInfo(Tree.Data)^ do
    begin
      if Field.DataType in [ftADT, ftArray] then
      begin
        FieldLine := Format('%s%s%s%s%2:s, ', [FieldLine, PSQLInfo(Tree.Data)^.QuotedTableDot,
          QuoteChar, Field.Origin]);
        ParamLine := Format('%s%s(', [ParamLine, TObjectField(Field).ObjectType]);
        for i := 0 to TObjectField(Field).FieldCount - 1 do
          AddField(TObjectField(Field).Fields[i], TempStr, ParamLine);
        ParamLine := Copy(ParamLine, 1, Length(ParamLine) - 2) + '), ';
      end else
      if (Field.DataType = ftDataSet) and (TObjectField(Field).ObjectType <> '') then
      begin
        FieldLine := Format('%s%s%s%s%2:s, ', [FieldLine, PSQLInfo(Tree.Data)^.QuotedTableDot,
          QuoteChar, Field.Origin]);
        ParamLine := Format('%s%s(), ', [ParamLine, TDataSetField(Field).ObjectType]);
      end else
      if UseFieldInUpdate(Field) then
      begin
        FieldLine := Format('%s%s%s%s%2:s, ', [FieldLine, PSQLInfo(Tree.Data)^.QuotedTableDot,
          QuoteChar, Field.Origin]);
        ParamLine := ParamLine + '?, ';
        Value := Field.NewValue;
        if VarIsEmpty(Value) then Value := Field.OldValue;
        TParam(Params.Add).AssignFieldValue(Field, Value);
      end;
    end;
  end;

var
  I: Integer;
  FieldLine, ParamLine: string;
begin
  with PSQLInfo(Tree.Data)^ do
  begin
    SQL.Clear;
    if Tree.Tablename = '' then
    begin
      SQL.Add(Format('insert into the (select %s FROM %s %s',[QuoteFullName(Tree.Name, QuoteChar),
        PSQLInfo(Tree.Parent.Data).QuotedTable, DefAlias]));
      GenWhereSQL(Tree.Parent, SQL, Params, upWhereKeyOnly, DefAlias);
      SQL.Add(')');
    end else
      SQL.Add(Format('insert into %s', [QuotedTable]));
    FieldLine := '  (';
    ParamLine := FieldLine;
    for I := 0 to Tree.Delta.FieldCount - 1 do
      AddField(Tree.Delta.Fields[I], FieldLine, ParamLine);
    if Tree.Tablename <> '' then
      SQL.Add(Copy(FieldLine, 1, Length(FieldLine)-2)+')');
    SQL.Add('values');
    SQL.Add(Copy(ParamLine, 1, Length(ParamLine)-2)+')');
  end;
end;

procedure TSQLResolver.GenDeleteSQL(Tree: TUpdateTree; SQL: TStrings;
  Params: TParams; Alias: string);
begin
  with PSQLInfo(Tree.Data)^ do
  begin
    SQL.Clear;
    if Tree.Tablename = '' then
    begin
      Alias := NestAlias;
      SQL.Add(Format('delete the (select %s FROM %s %s',[QuoteFullName(Tree.Name, QuoteChar),
        PSQLInfo(Tree.Parent.Data).QuotedTable, DefAlias]));
      GenWhereSQL(Tree.Parent, SQL, Params, upWhereKeyOnly, DefAlias);
      SQL.Add(Format(') %s',[Alias]));
    end else
      SQL.Add(Format('delete from %s %s', [QuotedTable, Alias]));
    GenWhereSQL(Tree, SQL, Params, UpdateMode, Alias);
  end;
end;

procedure TSQLResolver.GenUpdateSQL(Tree: TUpdateTree; SQL: TStrings;
  Params: TParams; Alias: string);

  procedure AddField(Field: TField; InObject, InArray: Boolean);
  var
    i: Integer;
    TempStr: string;
    Value: Variant;
  begin
    with PSQLInfo(Tree.Data)^ do
    begin
      if Field.DataType = ftADT then
      begin
        if InArray then
          SQL.Add(Format(' %s(',[TObjectField(Field).ObjectType]));
        for i := 0 to TObjectField(Field).FieldCount - 1 do
          AddField(TObjectField(Field).Fields[i], True, InArray);
        if InArray then
        begin
          TempStr := SQL[SQL.Count-1];
          SQL[SQL.Count-1] := Copy(TempStr, 1, Length(TempStr) - 1);
          SQL.Add('),');
        end;
      end
      else if Field.DataType = ftArray then
      begin
        SQL.Add(Format('%s = %s(',[Field.FullName, TObjectField(Field).ObjectType]));
        for i := 0 to TObjectField(Field).FieldCount - 1 do
          AddField(TObjectField(Field).Fields[i], InObject, True);
        TempStr := SQL[SQL.Count-1];
        SQL[SQL.Count-1] := Copy(TempStr, 1, Length(TempStr) - 1);
        SQL.Add('),');
      end
      else if InArray then
      begin
        SQL.Add(' ?,');
        Value := Field.NewValue;
        if VarIsEmpty(Value) then Value := Field.OldValue;
        TParam(Params.Add).AssignFieldValue(Field, Value);
      end
      else if UseFieldInUpdate(Field) then
      begin
        if InObject then
          SQL.Add(Format(' %s.%s = ?,', [Alias, QuoteFullName(Field.FullName, QuoteChar),
            Field.FullName])) else
          SQL.Add(Format(' %s%s%s%1:s = ?,', [PSQLInfo(Tree.Data)^.QuotedTableDot,
            QuoteChar, Field.Origin]));
        Value := Field.NewValue;
        if VarIsEmpty(Value) then Value := Field.OldValue;
        TParam(Params.Add).AssignFieldValue(Field, Value);
      end;
    end;
  end;

var
  I: integer;
  TempStr: string;
begin
  with PSQLInfo(Tree.Data)^ do
  begin
    if Tree.Tablename = '' then
    begin
      Alias := NestAlias;
      SQL.Add(Format('update the (select %s FROM %s %s',[QuoteFullName(Tree.Name, QuoteChar),
        PSQLInfo(Tree.Parent.Data).QuotedTable, DefAlias]));
      GenWhereSQL(Tree.Parent, SQL, Params, upWhereKeyOnly, DefAlias);
      SQL.Add(Format(') %s set',[Alias]));
    end else
      SQL.Add(Format('update %s %s set', [QuotedTable, Alias]));
    for I := 0 to Tree.Delta.FieldCount - 1 do
      AddField(Tree.Delta.Fields[i], Alias = NestAlias, False);
    { Remove last ',' }
    TempStr := SQL[SQL.Count-1];
    SQL[SQL.Count-1] := Copy(TempStr, 1, Length(TempStr) - 1);
    GenWhereSQL(Tree, SQL, Params, UpdateMode, Alias);
  end;
end;

procedure TSQLResolver.GenSelectSQL(Tree: TUpdateTree; SQL: TStrings;
  Params: TParams; Alias: string);
var
  i: Integer;
  Temp: string;
begin
  with PSQLInfo(Tree.Data)^ do
  begin
    SQL.Add('select');
    for i := 0 to Tree.Delta.FieldCount - 1 do
      with Tree.Delta.Fields[i] do
        if not (DataType in [ftDataSet, ftReference]) then
          SQL.Add(Format(' %s%s%s%1:s,',[QuotedTableDot, QuoteChar, Origin]));
    { Remove last ',' }
    Temp := SQL[SQL.Count-1];
    SQL[SQL.Count-1] := Copy(Temp, 1, Length(Temp) - 1);
    SQL.Add(Format(' from %s %s',[QuotedTable, Alias]));
    GenWhereSQL(Tree, SQL, Params, upWhereKeyOnly, Alias);
  end;
end;

end.
