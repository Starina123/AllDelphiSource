unit SoapDBServerUnit;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, InvokeRegistry, XSBuiltIns,
  FMTBcd, DBCommon;

const
  SUpdateSQL = 'update %s set %s where %s';
  SInsertSQL = 'insert into %s VALUES( %s )';
  SDeleteSQL = 'delete from %s where %s';

type

  TUpdateType = (utUpdateNone, utUpdateInsert, utUpdateUpdate, utUpdateDelete);

  TIndexDesc = class(TRemotable)
  private
    FFields: string;
    FName: string;
    FDescending: Boolean;
    FPrimary: Boolean;
    FCaseInsensitive: Boolean;
    FUnique: Boolean;
  published
    property Fields: string read FFields write FFields;
    property Name: string read FName write FName;
    property Primary: Boolean read FPrimary write FPrimary;
    property Unique: Boolean read FUnique write FUnique;
    property Descending: Boolean read FDescending write FDescending ;
    property CaseInsensitive: Boolean read FCaseInsensitive write FCaseInsensitive;
  end;

  TIndexDescArray = array of TIndexDesc;

  TColDesc = class(TRemotable)
  private
    FRequired: Boolean;
    FReadOnly: Boolean;
    FDataSize: Integer;
    FFieldName: string;
    FDataType: TFieldType;
    FSize: Integer;
    FIsBlob: Boolean;
  published
    property DataType: TFieldType read FDataType write FDataType default ftUnknown;
    property FieldName: string read FFieldName write FFieldName;
    property IsBlob: Boolean read FIsBlob write FIsBlob default False;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property Required: Boolean read FRequired write FRequired default False;
    property DataSize: Integer read FDataSize write FDataSize default 0;
    property Size: Integer read FSize write FSize default 0;
  end;

  TColDescArray = array of TColDesc;

  TFieldValue = class(TRemotable)
  private
    FID: Integer;
    FValue: Variant;
    FOldValue: Variant;
    FChanged: Boolean;
  published
    property ID: Integer read FID write FID;
    property OldValue: Variant read FOldValue write FOldValue;
    property Value: Variant read FValue write FValue;
    property Changed: Boolean read FChanged write FChanged default False;
  end;

  TFieldValueArray = array of TFieldValue;

  TSoapRow = class(TRemotable)
  private
    FFieldValueArray: TFieldValueArray;
    FUpdateType: TUpdateType;
    FRowID: Integer;
  public
    function Clone: TSoapRow; virtual;
    procedure ClearValues;
  published
    property RowID: Integer read FRowID write FRowID;
    property FieldValueArray: TFieldValueArray read FFieldValueArray write FFieldValueArray;
    property UpdateType: TUpdateType read FUpdateType write FUpdateType;
  end;

  TRowArray = array of TSoapRow;

  TUpdateInfo = class(TRemotable)
  private
    FUseIndexMetadata: Boolean;
    FKeyFields: string;
    FMetadataRetrieved: Boolean;
    FErrorCount: Integer;
    FErrorMessage: string;
  published
    property ErrorCount: Integer read FErrorCount write FErrorCount default 0;
    property ErrorMessage: string read FErrorMessage write FErrorMessage;
    property KeyFields: string read FKeyFields write FKeyFields;
    property MetadataRetrieved: Boolean read FMetadataRetrieved write FMetadataRetrieved default False;
    property UseIndexMetadata: Boolean read FUseIndexMetadata write FUseIndexMetadata default True;
  end;

  TSoapDBError = class(TRemotable)
  private
    FErrorMsg: string;
    FFailedRecord: TSoapRow;
  published
    property ErrorMsg: string read FErrorMsg write FErrorMsg;
    property FailedRecord: TSoapRow read FFailedRecord write FFailedRecord;
  end;

  TDBErrorArray = array of TSoapDBError;

  TSoapDataPacket = class(TRemotable)
  private
    FColDescArray: TColDescArray;
    FIndexDescArray: TIndexDescArray;
    FRowArray: TRowArray;
    FTableName: string;
    function UpdateRow(Row: TSoapRow; var UpdateInfo: TUpdateInfo; var UpdateErrors: TDBErrorArray): Integer; virtual;
  public
    function IncRowSize: Integer;
    function CloneStructure: TSoapDataPacket; virtual;
    procedure ClearRow(ID: Integer; AdjustArray: Boolean); virtual;
    procedure ClearRows; virtual;
    procedure ClearRowByRowID(RowID: Integer); virtual;
    procedure ClearPacket; virtual;
  published
    property ColDescArray: TColDescArray read FColDescArray write FColDescArray;
    property IndexDescArray: TIndexDescArray read FIndexDescArray write FIndexDescArray;
    property RowArray: TRowArray read FRowArray write FRowArray;
    property TableName: string read FTableName write FTableName;
  end;

  IWebServicesDataSet = Interface(IInvokable)
  ['{9392AF9B-39B1-11D5-BF7B-00C04F79AB6E}']
    procedure RetrieveDataSet(SQL: string; var DataSet: TSoapDataPacket; var UpdateInfo: TUpdateInfo); stdcall;
    function UpdateDataSet(UpdatePacket: TSoapDataPacket; var UpdateInfo: TUpdateInfo; var UpdateErrors: TDBErrorArray): Integer; stdcall;
  end;

  TWebServicesDataSet = class(TInvokableClass, IWebServicesDataSet)
  public
    procedure RetrieveDataSet(SQL: string; var DataSet: TSoapDataPacket; var UpdateInfo: TUpdateInfo); stdcall;
    function UpdateDataSet(UpdatePacket: TSoapDataPacket; var UpdateInfo: TUpdateInfo; var UpdateErrors: TDBErrorArray): Integer; stdcall;
  end;

  TData = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ Utility functions }

  function LoadFields(DataSet: TDataSet): TFieldValueArray;
  function RowArrayFromDataSet(DataSet: TDataSet): TRowArray;
  function ColumnArrayFromDataSet(DataSet: TDataSet): TColDescArray;
  procedure DataSetFromRowArray(DataSet: TDataSet; RowArray: TRowArray);
  procedure DataSetFromColumnDescArray(ColDescArray: TColDescArray; DataSet: TDataSet; AddRowID: Boolean = False);
  procedure ClearRowArray(RowArray: TRowArray);

var
  Data: TData;

implementation

uses Variants;

{ Utility functions }

  procedure ClearRowArray(RowArray: TRowArray);
  var
    I, J: Integer;
  begin
    for I := 0 to Length(RowArray) -1 do
    begin
      for J := 0 to Length(RowArray[I].FieldValueArray) -1 do
        RowArray[I].FieldValueArray[J].Free;
      SetLength(RowArray[I].FFieldValueArray, 0);
    end;
    SetLength(RowArray, 0);
  end;

  procedure DataSetFromColumnDescArray(ColDescArray: TColDescArray; DataSet: TDataSet; AddRowID: Boolean = False);

    function FieldFromColDesc(ColDesc: TColDesc): TFieldDef;
    begin
      Result := DataSet.FieldDefs.AddFieldDef;
      Result.DataType := ColDesc.DataType;
      Result.Name := ColDesc.FieldName;
      Result.Required := ColDesc.FRequired;
      Result.Precision := ColDesc.FDataSize;
      Result.Size := ColDesc.FSize;
    end;
  var
    I: Integer;
  begin
    DataSet.FieldDefs.Clear;
    for I := 0 to Length(ColDescArray) -1 do
      FieldFromColDesc(ColDescArray[I]);
  end;


  function LoadFields(DataSet: TDataSet): TFieldValueArray;
  var
    I: Integer;
  begin
    SetLength(Result, DataSet.FieldCount);
    for I := 0 to DataSet.FieldCount -1 do
    begin
      Result[I] := TFieldValue.Create;
      Result[I].ID := I;
      if DataSet.Fields[I].DataType = ftTimeStamp then
        Result[I].Value := DataSet.Fields[I].AsDateTime
      else if DataSet.Fields[I].DataType = ftFMTBcd then
        Result[I].Value := DataSet.Fields[I].AsCurrency
      else
        Result[I].Value := DataSet.Fields[I].Value;
      VarClear(Result[I].FOldValue);
    end;
  end;

  function RowArrayFromDataSet(DataSet: TDataSet): TRowArray;
  var
    RowCount: Integer;
  begin
    RowCount := 1;
    while not DataSet.EOF do
    begin
      SetLength(Result, RowCount);
      Result[RowCount-1] := TSoapRow.Create;
      Result[RowCount-1].FieldValueArray := LoadFields(DataSet);
      Result[RowCount-1].RowID := RowCount;
      Inc(RowCount);
      DataSet.Next;
    end;
  end;

  function ColumnArrayFromDataSet(DataSet: TDataSet): TColDescArray;
  var
    I: Integer;
  begin
    SetLength(Result, DataSet.FieldCount);
    for I := 0 to DataSet.FieldCount -1 do
    begin
      Result[I] := TColDesc.Create;
      Result[I].FDataType := DataSet.Fields[I].DataType;
      Result[I].FReadOnly := DataSet.Fields[I].ReadOnly;
      Result[I].FFieldName := DataSet.Fields[I].FieldName;
      Result[I].FRequired := DataSet.Fields[I].Required;
      Result[I].FDataSize := DataSet.Fields[I].DataSize;
      Result[I].FSize := DataSet.Fields[I].Size;
      Result[I].IsBlob := DataSet.Fields[I].IsBlob;
    end;
  end;

  function IndexArrayFromDataSet(DataSet: TSQLDataSet): TIndexDescArray;
  var
    IndexDefs: TIndexDefs;
    I: Integer;
  begin
    IndexDefs := DataSet.IndexDefs;
    for I := 0 to IndexDefs.Count -1 do
    begin
      SetLength(Result, I+1);
      Result[I] := TIndexDesc.Create;
      Result[I].Fields := IndexDefs[I].Fields;
      Result[I].Primary := (ixPrimary in IndexDefs[I].Options);
      Result[I].Unique := (ixUnique in IndexDefs[I].Options);
      Result[I].Descending := (ixDescending in IndexDefs[I].Options);
      Result[I].CaseInsensitive := (ixCaseInsensitive in IndexDefs[I].Options);
    end;
  end;

  function GetKeyFields(const Option: TIndexOption; const IndexDefs: TIndexDefs): string;
  var
    I: Integer;
  begin
    for I := 0 to IndexDefs.Count -1 do
    begin
      if Option in IndexDefs[I].Options then
      begin
        Result := IndexDefs[I].Fields;
        break;
      end;
    end;  
  end;

  function LoadUpdateInfo(DataSet: TSQLDataSet; var UpdateInfo: TUpdateInfo): TIndexDescArray;
  begin
    if UpdateInfo.MetadataRetrieved then exit;
    if not UpdateInfo.UseIndexMetadata then exit;
    Result := IndexArrayFromDataSet(DataSet);
    UpdateInfo.MetadataRetrieved := True;
    UpdateInfo.KeyFields := GetKeyFields(ixPrimary, DataSet.IndexDefs);
    if UpdateInfo.KeyFields = '' then
      UpdateInfo.KeyFields := GetKeyFields(ixUnique, DataSet.IndexDefs);
  end;

  procedure DataSetFromRowArray(DataSet: TDataSet; RowArray: TRowArray);
  var
    I, J: Integer;
  begin
    for I := 0 to Length(RowArray) -1 do
    begin
      DataSet.Append;
      for J := 0 to DataSet.FieldCount -1 do
        DataSet.Fields[J].Value := RowArray[I].FFieldValueArray[J].Value;
      DataSet.Post;
    end;
    DataSet.First;
  end;

{ TSoapRow }

procedure TSoapRow.ClearValues;
var
  I: Integer;
begin
  for I := 0 to Length(FFieldValueArray) -1 do
  begin
    VarClear(FFieldValueArray[I].FValue);
    VarClear(FFieldValueArray[I].FOldValue);
  end;
end;

function TSoapRow.Clone: TSoapRow;
var
  I: Integer;
begin
  Result := TSoapRow.Create;
  Result.RowId := RowID;
  Result.UpdateType := UpdateType;
  SetLength(Result.FFieldValueArray, Length(FFieldValueArray));
  for I := 0 to Length(FFieldValueArray) -1 do
  begin
    Result.FFieldValueArray[I] := TFieldValue.Create;
    Result.FFieldValueArray[I].FID := FFieldValueArray[I].FID;
    Result.FFieldValueArray[I].Value := FFieldValueArray[I].Value;
    Result.FFieldValueArray[I].OldValue := FFieldValueArray[I].OldValue;
    Result.FFieldValueArray[I].Changed := FFieldValueArray[I].Changed;
  end;
end;

{ TSoapDataPacket }

function TSoapDataPacket.IncRowSize: Integer;
var
  I: Integer;
begin
  Result := Length(FRowArray) + 1;
  SetLength(FRowArray, Result);
  FRowArray[Result-1] := TSoapRow.Create;
  FRowArray[Result-1].RowID := Result;
  SetLength(FRowArray[Result-1].FFieldValueArray, Length(FColDescArray));
  for I := 0 to Length(FColDescArray) -1 do
    FRowArray[Result-1].FFieldValueArray[I] := TFieldValue.Create;
end;

procedure TSoapDataPacket.ClearRow(ID: Integer; AdjustArray: Boolean);
var
  I: Integer;
begin
  for I := 0 to Length(FRowArray[ID].FFieldValueArray) -1 do
    FRowArray[ID].FFieldValueArray[I].Free;
  SetLength(FRowArray[ID].FFieldValueArray, 0);
  FRowArray[ID].Free;
  if AdjustArray then
  begin
    for I := ID to Length(FRowArray) -2 do
      FRowArray[I] := FRowArray[I+1];
    SetLength(FRowArray, Length(FRowArray) -1);
  end;
end;

procedure TSoapDataPacket.ClearRows;
var
  I: Integer;
begin
  for I := 0 to Length(FRowArray) -1 do
    ClearRow(I, False);
  SetLength(FRowArray, 0);
end;

procedure TSoapDataPacket.ClearRowByRowID(RowID: Integer);
var
  I: Integer;
begin
  for I := 0 to Length(FRowArray) -1 do
  begin
    if FRowArray[I].RowID = RowId then
    begin
      ClearRow(I, True);
      break;
    end;
  end;
end;

procedure TSoapDataPacket.ClearPacket;
var
  I: Integer;
begin
  ClearRows;
  for I := 0 to Length(FColDescArray) -1 do
    FColDescArray[I].Free;
  SetLength(FColDescArray, 0);
  for I := 0 to Length(FIndexDescArray) -1 do
    FIndexDescArray[I].Free;
  SetLength(FIndexDescArray, 0);
  TableName := '';
end;

procedure MoveColDesc(var Source, Target: TColDesc);
begin
  Target.FDataSize := Source.FDataSize;
  Target.FFieldName := Source.FFieldName;
  Target.FDataType := Source.FDataType;
  Target.FSize := Source.FSize;
  Target.FReadOnly := Source.FReadOnly;
  Target.FRequired := Source.FRequired;
  Target.FIsBlob := Source.FIsBlob;
end;

procedure MoveIndexDesc(var Source, Target: TIndexDesc);
begin
  Target.FName := Source.FName;
  Target.FCaseInsensitive := Source.FCaseInsensitive;
  Target.FDescending := Source.FDescending;
  Target.FFields := Source.FFields;
  Target.FPrimary := Source.FPrimary;
  Target.FUnique := Source.FUnique;
end;

function TSoapDataPacket.CloneStructure: TSoapDataPacket;
var
  I: Integer;
begin
  Result := TSoapDataPacket.Create;
  SetLength(Result.FColDescArray, Length(FColDescArray));
  for I := 0 to Length(FColDescArray) -1 do
  begin
    Result.FColDescArray[I] := TColDesc.Create;
    MoveColDesc(FColDescArray[I], Result.FColDescArray[I]);
  end;
  SetLength(Result.FIndexDescArray, Length(FColDescArray));
  for I := 0 to Length(FIndexDescArray) -1 do
  begin
    Result.FIndexDescArray[I] := TIndexDesc.Create;
    MoveIndexDesc(FIndexDescArray[I], Result.FIndexDescArray[I]);
  end;
  Result.TableName := TableName;
end;

type

  TGetValueType = (gvNone, gvNew, gvOld);

function TSoapDataPacket.UpdateRow(Row: TSoapRow; var UpdateInfo: TUpdateInfo; var UpdateErrors: TDBErrorArray): Integer;
var
  SQL: string;
  Params: TParams;
  ErrorCount: Integer;

    function GetDataForColumnName(Name: string; out Value: Variant;
             GetValueType: TGetValueType): TFieldType;
    var
      I, ID: Integer;
    begin
      Result := ftUnknown;
      ID := 0;
      for I := 0 to Length(ColDescArray) -1 do
      begin
        if Name = ColDescArray[I].FieldName then
        begin
          Result := ColDescArray[I].DataType;
          ID := I;
          break;
        end;
      end;
      if Result <> ftUnknown then
      case GetValueType of
        gvNew:
          Value := Row.FFieldValueArray[ID].Value;
        gvOld:
          if Row.FFieldValueArray[ID].Changed then
            Value := Row.FFieldValueArray[ID].OldValue
          else
            Value := Row.FFieldValueArray[ID].Value;
      end;
    end;

    function GetValueString(Where: Boolean): string;
    var
      I: Integer;
      SEquals, SConnector: string;
      V: Variant;
      ValueType: TGetValueType;
      DataType: TFieldType;
    begin
      if Row.UpdateType = utUpdateInsert then
        ValueType := gvNew
      else
        ValueType := gvOld;
      if Where then
        SConnector := 'and '
      else
        SConnector := ', ';
      for I := 0 to Length(ColDescArray) -1 do
      begin
        if (ColDescArray[I].IsBlob) and Where then continue;
        DataType := GetDataForColumnName(ColDescArray[I].
               FieldName, V, ValueType);
        if VarIsClear(V) then
        begin
          if I > 0 then
            Result := Result + sConnector + ColDescArray[I].FieldName + ' is NULL '
          else  
            Result := ColDescArray[I].FieldName + ' is NULL ';
          continue;
        end;
        if Where then
          SEquals := ColDescArray[I].FieldName + '= '
        else
          SEquals := '';
        if I > 0 then
          Result := Result + SConnector + SEquals + ':P' + IntToStr(I+1) + SEquals
        else
          Result := SEquals + ':P' + IntToStr(I+1) + SEquals;
        Params.CreateParam(DataType, 'P' + IntToStr(I+1), ptInput);
        Params[Params.Count -1].Value := V;
      end;
    end;

    function GetWhereString: string;
    var
      I: Integer;
      List: TStrings;
      V: Variant;
    begin
      if UpdateInfo.KeyFields = '' then
        Result := GetValueString(True)
      else
      begin
        List := TStringList.Create;
        try
          List.CommaText := UpdateInfo.KeyFields;
          for I := 0 to List.Count -1 do
          begin
            if I > 0 then
              Result := ' and ' + List[I] + ' = :P' + IntToStr(I+1)
            else
              Result := List[I] + ' = :P' + IntToStr(I+1);
            Params.CreateParam(GetDataForColumnName(List[I], V, gvOld),
                                'P' + IntToStr(I+1), ptInput);
            Params[Params.Count -1].Value := V;
          end;
        finally
          List.Free;
        end;
      end;
    end;

    function GetSetString: string;
    var
      I, J: Integer;
      FieldValue: TFieldValue;
      V: Variant;
      DataType: TFieldType;
    begin
      J := 0;
      for I := 0 to Length(Row.FFieldValueArray) -1 do
      begin
        FieldValue := Row.FFieldValueArray[I];
        if FieldValue.Changed then
        begin
          if J > 0 then
            Result := Result + ', ';
          DataType := GetDataForColumnName(ColDescArray[FieldValue.ID].FieldName,
                 V, gvNew);
          if VarIsClear(V) then
            Result := Result + ColDescArray[FieldValue.ID].FieldName
                 + ' is NULL' + IntToStr(J+1)
          else
          begin
            Params.CreateParam(DataType, 'PN' + IntToStr(J+1), ptInput);
            Params[Params.Count -1].Value := V;
            Result := Result + ColDescArray[FieldValue.ID].FieldName
                 + ' = :PN' + IntToStr(J+1);
            Inc(J);
          end;
        end;
      end;
    end;

  begin
    Params := TParams.Create;
    try
      try
        case Row.UpdateType of
          utUpdateInsert:
            SQL := format(SInsertSQL, [TableName, GetValueString(False)]);
          utUpdateUpdate:
            SQL := format(sUpdateSQL, [TableName, GetSetString, GetWhereString]);
          utUpdateDelete:
            SQL := format(sDeleteSQL, [TableName, GetWhereString]);
        end;
        Data.SqlDataSet1.CommandText := SQL;
        Data.SqlDataSet1.Params := Params;
        Data.SqlDataSet1.ExecSQL;
      except
        On E: Exception do
        begin
          ErrorCount:= Length(UpdateErrors) + 1;
          SetLength(UpdateErrors, ErrorCount);
          UpdateErrors[ErrorCount-1] := TSoapDBError.Create;
          UpdateErrors[ErrorCount-1].ErrorMsg := E.Message;
          UpdateErrors[ErrorCount-1].FailedRecord := Row.Clone;
        end;
      end;
    finally
      Params.Free;
      Result := 1;
    end;
  end;

{ TWebServicesDataSet }

  function TWebServicesDataSet.UpdateDataSet(UpdatePacket: TSoapDataPacket; var UpdateInfo: TUpdateInfo; var UpdateErrors: TDBErrorArray): Integer; stdcall;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to Length(UpdatePacket.RowArray) -1 do
      if UpdatePacket.RowArray[I].UpdateType <> utUpdateNone then
        Result := Result + UpdatePacket.UpdateRow(UpdatePacket.RowArray[I], UpdateInfo, UpdateErrors);
  end;

  procedure TWebServicesDataSet.RetrieveDataSet(SQL: string; var DataSet: TSoapDataPacket; var UpdateInfo: TUpdateInfo); stdcall;
  begin
    DataSet := Nil;
    try
      Data.SqlDataSet1.CommandText := SQL;
      Data.SqlDataSet1.Open;
      DataSet := TSoapDataPacket.Create;
      try
        DataSet.TableName := GetTableNameFromSQL(SQL);
        DataSet.FColDescArray := ColumnArrayFromDataSet(Data.SqlDataSet1);
        DataSet.FIndexDescArray := LoadUpdateInfo(Data.SQLDataSet1, UpdateInfo);
        DataSet.FRowArray := RowArrayFromDataSet(Data.SqlDataSet1);
      except
        On E: Exception do
        begin
          UpdateInfo.ErrorMessage := E.Message;
          DataSet.Free;
          UpdateInfo.ErrorCount := 1;
          DataSet := nil;
        end;  
      end;
    finally
      Data.SqlDataSet1.Close;
    end;
  end;

{$R *.dfm}
{ TColDesc }


Initialization
  InvRegistry.RegisterInterface(TypeInfo(IWebServicesDataSet));
  InvRegistry.RegisterInvokableClass(TWebServicesDataSet);
  RemClassRegistry.RegisterXSClass(TColDesc);
  RemClassRegistry.RegisterXSClass(TIndexDesc);
  RemClassRegistry.RegisterXSClass(TFieldValue);
  RemClassRegistry.RegisterXSClass(TUpdateInfo);
  RemClassRegistry.RegisterXSClass(TSoapRow);
  RemClassRegistry.RegisterXSClass(TSoapDBError);
  RemClassRegistry.RegisterXSClass(TSoapDataPacket);
  RemClassRegistry.RegisterXSInfo(TypeInfo(TFieldType));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TIndexDescArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TColDescArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TDBErrorArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TFieldValueArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TUpdateType));

end.
