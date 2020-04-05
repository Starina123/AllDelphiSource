{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBQuery;

interface

uses System.Classes, Data.DB, IBX.IBHeader, IBX.IBDatabase, IBX.IBCustomDataSet,
     IBX.IBSQL, System.Generics.Collections, IBX.IBInputOutput;

type

{ TIBQuery }

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBQuery = class(TIBCustomDataSet)
  private
    FSQL: TStrings;
    FPrepared: Boolean;
    FParams: TParams;
    FText: string;
    FRowsAffected: Integer;
    FCheckRowsAffected: Boolean;
    FGenerateParamNames: Boolean;
    function GetRowsAffected: Integer;
    procedure PrepareSQL(Value: PChar);
    procedure QueryChanged(Sender: TObject);
    procedure ReadParamData(Reader: TReader);
    procedure SetQuery(Value: TStrings);
    procedure SetParamsList(Value: TParams);
    procedure SetParams;
    procedure SetParamsFromCursor;
    procedure SetPrepared(Value: Boolean);
    procedure SetPrepare(Value: Boolean);
    procedure WriteParamData(Writer: TWriter);
    function GetStmtHandle: TISC_STMT_HANDLE;
    function GetParams: TParams;

  protected
    { IProviderSupport }
    procedure PSExecute; override;
    function PSGetParams: TParams; override;
    function PSGetTableName: String; override;
    procedure PSSetCommandText(const CommandText: string); override;
    procedure PSSetParams(AParams: TParams); override;
    function PSGetCommandText: String; override;
    function PSGetCommandType: TPSCommandType; override;

    procedure DefineProperties(Filer: TFiler); override;
    procedure InitFieldDefs; override;
    procedure InternalOpen; override;
    procedure Disconnect; override;
    function GetParamsCount: Word;
    function GenerateQueryForLiveUpdate : Boolean;
    procedure SetFiltered(Value: Boolean); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BatchInput(InputObject: TIBBatchInput);
    procedure BatchOutput(OutputObject: TIBBatchOutput);
    procedure ExecSQL;
    procedure GetDetailLinkFields(MasterFields, DetailFields: TList<TField>); override;
    function ParamByName(const Value: string): TParam;
    procedure Prepare;
    procedure UnPrepare;
    property LiveMode;
    property Prepared: Boolean read FPrepared write SetPrepare;
    property ParamCount: Word read GetParamsCount;
    property StmtHandle: TISC_STMT_HANDLE read GetStmtHandle;
    property StatementType;
    property Text: string read FText;
    property RowsAffected: Integer read GetRowsAffected;
    property GenerateParamNames: Boolean read FGenerateParamNames write FGenerateParamNames;
    
  published
    property Active;
    property BufferChunks;
    property CachedUpdates;
    property DataSource read GetDataSource write SetDataSource;
    property Constraints stored ConstraintsStored;
    property ParamCheck;
    property SQL: TStrings read FSQL write SetQuery;
    property Params: TParams read GetParams write SetParamsList stored False;
    property UniDirectional default False;
    property UpdateObject;
    property Filtered;
    property GeneratorField;

    property BeforeDatabaseDisconnect;
    property AfterDatabaseDisconnect;
    property DatabaseFree;
    property BeforeTransactionEnd;
    property AfterTransactionEnd;
    property TransactionFree;
    property OnFilterRecord;
end;

implementation

uses IBX.IB, System.SysUtils;

{ TIBQuery }

constructor TIBQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSQL := TStringList.Create;
  TStringList(SQL).OnChange := QueryChanged;
  FParams := TParams.Create(Self);
  ParamCheck := True;
  FGenerateParamNames := False;
  FRowsAffected := -1;
end;

destructor TIBQuery.Destroy;
begin
  Destroying;
  Disconnect;
  FSQL.Free;
  FParams.Free;
  inherited Destroy;
end;

procedure TIBQuery.InitFieldDefs;
begin
  inherited InitFieldDefs;
end;

procedure TIBQuery.InternalOpen;
begin
  ActivateConnection();
  ActivateTransaction;
  QSelect.GenerateParamNames := FGenerateParamNames;
  SetPrepared(True);
  if DataSource <> nil then
    SetParamsFromCursor;
  SetParams;
  inherited InternalOpen;
end;

procedure TIBQuery.Disconnect;
begin
  Close;
  UnPrepare;
end;

procedure TIBQuery.SetPrepare(Value: Boolean);
begin
  if Value then
    Prepare
  else
    UnPrepare;
end;

procedure TIBQuery.Prepare;
begin
  SetPrepared(True);
end;

procedure TIBQuery.UnPrepare;
begin
  SetPrepared(False);
end;

procedure TIBQuery.SetQuery(Value: TStrings);
begin
  if SQL.Text <> Value.Text then
  begin
    Disconnect;
    SQL.BeginUpdate;
    try
      SQL.Assign(Value);
    finally
      SQL.EndUpdate;
    end;
  end;
end;

procedure TIBQuery.QueryChanged(Sender: TObject);
var
  List: TParams;
begin
  if not (csReading in ComponentState) then
  begin
    Disconnect;
    if ParamCheck or (csDesigning in ComponentState) then
    begin
      List := TParams.Create(Self);
      try
        FText := List.ParseSQL(SQL.Text, True);
        List.AssignValues(FParams);
        FParams.Clear;
        FParams.Assign(List);
      finally
        List.Free;
      end;
    end else
      FText := SQL.Text;
    DataEvent(dePropertyChange, 0);
  end else
    FText := FParams.ParseSQL(SQL.Text, False);
  SelectSQL.Assign(SQL);
end;

procedure TIBQuery.SetParamsList(Value: TParams);
begin
  FParams.AssignValues(Value);
end;

function TIBQuery.GetParams: TParams;
begin
  if (FParams.Count = 0)  then
    FParams.ParseSQL(SQL.Text, True);
  Result := FParams;
end;

function TIBQuery.GetParamsCount: Word;
begin
  if (not (csDesigning in ComponentState)) and
     (FParams.Count = 0) and
     (not Prepared) and (not SQL.Text.Trim.IsEmpty) then
    Prepare;
  Result := FParams.Count;
end;

procedure TIBQuery.DefineProperties(Filer: TFiler);

  function WriteData: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FParams.IsEqual(TIBQuery(Filer.Ancestor).FParams) else
      Result := FParams.Count > 0;
  end;

begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ParamData', ReadParamData, WriteParamData, WriteData); {do not localize}
end;

procedure TIBQuery.ReadParamData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FParams);
end;

procedure TIBQuery.WriteParamData(Writer: TWriter);
begin
  Writer.WriteCollection(Params);
end;

procedure TIBQuery.SetPrepared(Value: Boolean);
begin
  CheckDatasetClosed;
  if Value <> Prepared then
  begin
    if Value then
    begin
      FRowsAffected := -1;
      FCheckRowsAffected := True;
      if Length(Text) > 1 then
        PrepareSQL(@Text)
      else
        IBError(ibxeEmptySQLStatement, [nil]);
    end
    else
    begin
      if FCheckRowsAffected then
        FRowsAffected := RowsAffected;
      InternalUnPrepare;
    end;
    FPrepared := Value;
  end;
end;

procedure TIBQuery.SetParamsFromCursor;
var
  I: Integer;
  DataSet: TDataSet;

  procedure CheckRequiredParams;
  var
    I: Integer;
  begin
    for I := 0 to FParams.Count - 1 do
    if not FParams[I].Bound then
      IBError(ibxeRequiredParamNotSet, [nil]);
  end;

begin
  if DataSource <> nil then
  begin
    DataSet := DataSource.DataSet;
    if DataSet <> nil then
    begin
      DataSet.FieldDefs.Update;
      for I := 0 to FParams.Count - 1 do
        if not FParams[I].Bound then
        begin
          FParams[I].AssignField(DataSet.FieldByName(FParams[I].Name));
          FParams[I].Bound := False;
        end;
    end
    else
      CheckRequiredParams;
  end
  else
    CheckRequiredParams;
end;


function TIBQuery.ParamByName(const Value: string): TParam;
begin
  if (FParams.Count = 0) and
     (not Prepared) and
     (not SQL.Text.Trim.IsEmpty) then
    Prepare;
  Result := FParams.ParamByName(Value);
end;

procedure TIBQuery.BatchInput(InputObject: TIBBatchInput);
begin
  InternalBatchInput(InputObject);
end;

procedure TIBQuery.BatchOutput(OutputObject: TIBBatchOutput);
begin
  InternalBatchOutput(OutputObject);
end;

procedure TIBQuery.ExecSQL;
var
  DidActivate: Boolean;
begin
  CheckInActive;
  if SQL.Count <= 0 then
  begin
    FCheckRowsAffected := False;
    IBError(ibxeEmptySQLStatement, [nil]);
  end;
  ActivateConnection();
  DidActivate := ActivateTransaction;
  try
    SetPrepared(True);
    if DataSource <> nil then
      SetParamsFromCursor;
    if FParams.Count > 0 then
      SetParams;
    InternalExecQuery;
  finally
    if DidActivate then
      DeactivateTransaction;
    FCheckRowsAffected := True;
  end;
end;

procedure TIBQuery.SetParams;
var
  i : integer;
  Buffer: TValueBuffer;

begin
  for I := 0 to FParams.Count - 1 do
  begin
    if Params[i].IsNull then
      SQLParams[i].IsNull := True
    else begin
      SQLParams[i].IsNull := False;
      case Params[i].DataType of
        ftBytes:
        begin
          SetLength(Buffer,Params[i].GetDataSize);
          Params[i].GetData(Buffer);
          SQLParams[i].AsBytes := Buffer;
        end;
        ftString, ftFixedChar, ftFixedWideChar, ftWideString:
          SQLParams[i].AsString := Params[i].AsString;
        ftShortInt, ftSmallint, ftWord, ftByte:
          SQLParams[i].AsShort := Params[i].AsSmallInt;
        ftBoolean :
          SQLParams[i].AsBoolean := Params[i].AsBoolean;
        ftInteger:
          SQLParams[i].AsLong := Params[i].AsInteger;
        ftLargeInt:
          SQLParams[i].AsInt64 := Params[i].Value;
        ftFloat:
         SQLParams[i].AsDouble := Params[i].AsFloat;
        ftBCD, ftCurrency:
          SQLParams[i].AsCurrency := Params[i].AsCurrency;
        ftFMTBCD :
          SQLParams[i].AsBcd := Params[i].AsFMTBCD;
        ftDate:
          SQLParams[i].AsDate := Params[i].AsDateTime;
        ftTime:
          SQLParams[i].AsTime := Params[i].AsDateTime;
        ftDateTime:
          SQLParams[i].AsDateTime := Params[i].AsDateTime;
        ftBlob, ftVarBytes :
          SQLParams[i].AsBytes := Params[i].AsBytes;
        ftMemo, ftWideMemo :
          SQLParams[i].AsString := Params[i].AsString;
        else
          IBError(ibxeNotSupported, [nil]);
      end;
    end;
  end;
end;

procedure TIBQuery.PrepareSQL(Value: PChar);
begin
  QSelect.GenerateParamNames := FGenerateParamNames;
  InternalPrepare;
end;

function TIBQuery.GetRowsAffected: Integer;
begin
  Result := -1;
  if Prepared then
   Result := QSelect.RowsAffected
end;

procedure TIBQuery.GetDetailLinkFields(MasterFields, DetailFields: TList<TField>);

  function AddFieldToList(const FieldName: string; DataSet: TDataSet;
    List: TList<TField>): Boolean;
  var
    Field: TField;
  begin
    Field := DataSet.FindField(FieldName);
    if (Field <> nil) then
      List.Add(Field);
    Result := Field <> nil;
  end;

var
  i: Integer;
begin
  MasterFields.Clear;
  DetailFields.Clear;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    for i := 0 to Params.Count - 1 do
      if AddFieldToList(Params[i].Name, DataSource.DataSet, MasterFields) then
        AddFieldToList(Params[i].Name, Self, DetailFields);
end;

function TIBQuery.GetStmtHandle: TISC_STMT_HANDLE;
begin
  Result := SelectStmtHandle;
end;

function TIBQuery.GenerateQueryForLiveUpdate : Boolean;
begin
  Result := False;
end;

procedure TIBQuery.SetFiltered(Value: Boolean);
begin
  if(Filtered <> Value) then
  begin
    inherited SetFiltered(value);
    if Active then
    begin
      Close;
      Open;
    end;
  end
  else
    inherited SetFiltered(value);
end;

{ TIBQuery IProviderSupport }

function TIBQuery.PSGetParams: TParams;
begin
  Result := Params;
end;

procedure TIBQuery.PSSetParams(AParams: TParams);
begin
  if AParams.Count <> 0 then
    Params.Assign(AParams);
  Close;
end;

function TIBQuery.PSGetTableName: String;
begin
  Result := inherited PSGetTableName;
end;

procedure TIBQuery.PSExecute;
begin
  ExecSQL;
end;

procedure TIBQuery.PSSetCommandText(const CommandText: string);
begin
  if CommandText <> '' then
    SQL.Text := CommandText;
end;

function TIBQuery.PSGetCommandText: String;
begin
  Result := SQL.Text;
end;

function TIBQuery.PSGetCommandType: TPSCommandType;
begin
  if not Prepared then
    Prepare;
  case SQLType of
    SQLSelect, SQLSelectForUpdate : Result := ctSelect;
    SQLInsert : Result := ctInsert;
    SQLUpdate : Result := ctUpdate;
    SQLDelete : Result := ctDelete;
    SQLDDL, SQLSetGenerator : Result := ctDDL;
    SQLExecProcedure : Result := ctStoredProc;
    else
      Result := ctUnknown;
  end;
end;

end.
