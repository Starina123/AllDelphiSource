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

unit IBX.IBDatabaseInfo;

interface

uses
  System.Classes, IBX.IBExternals, IBX.IB, IBX.IBDatabase, IBX.IBIntf;

type

  // wmNone is for IBResotre, this means do not set writemode
  TIBWriteMode = (wmASync, wmSync, wmDirect, wmNone);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBDatabaseInfo = class(TComponent)
  private
    procedure SetDatabase(const Value: TIBDatabase);
    function GetNoOfEncryptions: Integer;
    function GetWriteMode: TIBWriteMode;
    function GetSetPageBuffers: Long;
  protected
    FIBLoaded: Boolean;
    [weak] FDatabase: TIBDatabase;
    FUserNames   : TStringList;
    FBackoutCount: TStringList;
    FDeleteCount: TStringList;
    FExpungeCount: TStringList;
    FInsertCount: TStringList;
    FPurgeCount: TStringList;
    FReadIdxCount: TStringList;
    FReadSeqCount: TStringList;
    FUpdateCount: TStringList;

    function GetPreAllocate: Long;
    function GetAllocation: Long;
    function GetBaseLevel: Long;
    function GetDBFileName: String;
    function GetDBSiteName: String;
    function GetDBImplementationNo: Long;
    function GetDBImplementationClass: Long;
    function GetNoReserve: Long;
    function GetODSMinorVersion: Long;
    function GetODSMajorVersion: Long;
    function GetFullODS: Extended;
    function GetPageSize: Long;
    function GetVersion: String;
    function GetCurrentMemory: Long;
    function GetForcedWrites: Long;
    function GetMaxMemory: Long;
    function GetNumBuffers: Long;
    function GetSweepInterval: Long;
    function GetUserNames: TStringList;
    function GetFetches: Long;
    function GetMarks: Long;
    function GetReads: Long;
    function GetWrites: Long;
    function GetBackoutCount: TStringList;
    function GetDeleteCount: TStringList;
    function GetExpungeCount: TStringList;
    function GetInsertCount: TStringList;
    function GetPurgeCount: TStringList;
    function GetReadIdxCount: TStringList;
    function GetReadSeqCount: TStringList;
    function GetUpdateCount: TStringList;
    function GetOperationCounts(DBInfoCommand: Integer; FOperation: TStringList): TStringList;
    function GetReadOnly: Long;
    function GetDBSQLDialect: Long;
    function GetGDSLibrary : IGDSLibrary;

    function GetEUAActive: Boolean;
    function GetGroupCommit: Boolean;
    function GetEncrypted: Boolean;
    function GetSepEncrypted: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    function GetLongDatabaseInfo(DatabaseInfoCommand: Integer): Long;
    function GetStringDatabaseInfo(DatabaseInfoCommand: Integer): String;
    property Allocation: Long read GetAllocation;
    property BaseLevel: Long read GetBaseLevel;
    property DBFileName: String read GetDBFileName;
    property DBSiteName: String read GetDBSiteName;
    property DBImplementationNo: Long read GetDBImplementationNo;
    property DBImplementationClass: Long read GetDBImplementationClass;
    property NoReserve: Long read GetNoReserve;
    property ODSMinorVersion: Long read GetODSMinorVersion;
    property ODSMajorVersion: Long read GetODSMajorVersion;
    property FullODS : Extended read GetFullODS;
    property PageSize: Long read GetPageSize;
    property Version: String read GetVersion;
    property CurrentMemory: Long read GetCurrentMemory;
    property ForcedWrites: Long read GetForcedWrites;
    property WriteMode : TIBWriteMode read GetWriteMode;
    property MaxMemory: Long read GetMaxMemory;
    property SetPageBuffers : Long read GetSetPageBuffers;
    property NumBuffers: Long read GetNumBuffers;
    property SweepInterval: Long read GetSweepInterval;
    property UserNames: TStringList read GetUserNames;
    property Fetches: Long read GetFetches;
    property Marks: Long read GetMarks;
    property Reads: Long read GetReads;
    property Writes: Long read GetWrites;
    property BackoutCount: TStringList read GetBackoutCount;
    property DeleteCount: TStringList read GetDeleteCount;
    property ExpungeCount: TStringList read GetExpungeCount;
    property InsertCount: TStringList read GetInsertCount;
    property PurgeCount: TStringList read GetPurgeCount;
    property ReadIdxCount: TStringList read GetReadIdxCount;
    property ReadSeqCount: TStringList read GetReadSeqCount;
    property UpdateCount: TStringList read GetUpdateCount;
    property DBSQLDialect : Long read GetDBSQLDialect;
    property ReadOnly: Long read GetReadOnly;
    property EUAActive : Boolean read GetEUAActive;
    property GroupCommit : Boolean read GetGroupCommit;
    property Encrypted : Boolean read GetEncrypted;
    property SepEncrypted : Boolean read GetSepEncrypted;
    property NoOfEncryptions : Integer read GetNoOfEncryptions;
    property PreAllocate : Long read GetPreAllocate;
  published
    property Database: TIBDatabase read FDatabase write SetDatabase;
  end;

implementation

uses
  System.SysUtils, IBX.IBErrorCodes, IBX.IBHeader;

{ TIBDatabaseInfo }

constructor TIBDatabaseInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUserNames := TStringList.Create;
  FBackoutCount := TStringList.Create;
  FDeleteCount := TStringList.Create;
  FExpungeCount := TStringList.Create;
  FInsertCount := TStringList.Create;
  FPurgeCount := TStringList.Create;
  FReadIdxCount := TStringList.Create;
  FReadSeqCount := TStringList.Create;
  FUpdateCount := TStringList.Create;
end;

destructor TIBDatabaseInfo.Destroy;
begin

  FUserNames.Free;
  FBackoutCount.Free;
  FDeleteCount.Free;
  FExpungeCount.Free;
  FInsertCount.Free;
  FPurgeCount.Free;
  FReadIdxCount.Free;
  FReadSeqCount.Free;
  FUpdateCount.Free;

  inherited Destroy;
end;


function TIBDatabaseInfo.Call(ErrCode: ISC_STATUS;
  RaiseError: Boolean): ISC_STATUS;
begin
  result := ErrCode;
  {Handle when the Error is due to a Database disconnect.  Pass it on to
   FDatabase so it can handle this}
  if CheckStatusVector([isc_lost_db_connection]) then
    FDatabase.Call(ErrCode, RaiseError)
  else
    if RaiseError and (ErrCode > 0) then
      IBDataBaseError(GetGDSLibrary);
end;
function TIBDatabaseInfo.GetAllocation: Long;
begin
  result := GetLongDatabaseInfo(isc_info_allocation);
end;

function TIBDatabaseInfo.GetBaseLevel: Long;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_base_level);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                         IBLocalBufferLength, @local_buffer), True);
  result := GetGDSLibrary.isc_vax_integer(@local_buffer[4], 1);
end;

function TIBDatabaseInfo.GetDBFileName: String;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_db_id);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                         IBLocalBufferLength, @local_buffer), True);
  result := StringOf(TEncoding.Convert(TEncoding.ANSI, TEncoding.Default, local_buffer, 5, Integer(local_buffer[4])));
end;

function TIBDatabaseInfo.GetDBSiteName: String;
var
  local_buffer: array[0..IBBigLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_db_id);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                        IBLocalBufferLength, @local_buffer), True);
  result := StringOf(TEncoding.Convert(TEncoding.ANSI, TEncoding.Default, local_buffer,
     6 + Int(local_buffer[4]), Integer(local_buffer[5 + Int(local_buffer[4])])));
end;

function TIBDatabaseInfo.GetDBImplementationNo: Long;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_implementation);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                        IBLocalBufferLength, @local_buffer), True);
  result := GetGDSLibrary.isc_vax_integer(@local_buffer[3], 1);
end;

function TIBDatabaseInfo.GetDBImplementationClass: Long;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_implementation);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                         IBLocalBufferLength, @local_buffer), True);
  result := GetGDSLibrary.isc_vax_integer(@local_buffer[4], 1);
end;

function TIBDatabaseInfo.GetNoOfEncryptions: Integer;
begin
  result := GetLongDatabaseInfo(isc_info_db_encryptions);
end;

function TIBDatabaseInfo.GetNoReserve: Long;
begin
  result := GetLongDatabaseInfo(isc_info_no_reserve);
end;

function TIBDatabaseInfo.GetODSMinorVersion: Long;
begin
  result := GetLongDatabaseInfo(isc_info_ods_minor_version);
end;

function TIBDatabaseInfo.GetODSMajorVersion: Long;
begin
  result := GetLongDatabaseInfo(isc_info_ods_version);
end;

function TIBDatabaseInfo.GetPageSize: Long;
begin
  result := GetLongDatabaseInfo(isc_info_page_size);
end;

function TIBDatabaseInfo.GetPreAllocate: Long;
begin
   Result := GetLongDatabaseInfo(isc_info_db_preallocate);
end;

function TIBDatabaseInfo.GetVersion: String;
var
  local_buffer: array[0..IBBigLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := isc_info_version;
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                        IBBigLocalBufferLength, @local_buffer), True);
  result := StringOf(TEncoding.Convert(TEncoding.ANSI, TEncoding.Default, local_buffer, 5, Integer(local_buffer[4])));
end;

function TIBDatabaseInfo.GetCurrentMemory: Long;
begin
  result := GetLongDatabaseInfo(isc_info_current_memory);
end;

function TIBDatabaseInfo.GetForcedWrites: Long;
begin
  result := GetLongDatabaseInfo(isc_info_forced_writes);
end;

function TIBDatabaseInfo.GetMaxMemory: Long;
begin
  result := GetLongDatabaseInfo(isc_info_max_memory);
end;

function TIBDatabaseInfo.GetNumBuffers: Long;
begin
  result := GetLongDatabaseInfo(isc_info_num_buffers);
end;

function TIBDatabaseInfo.GetSweepInterval: Long; 
begin
  result := GetLongDatabaseInfo(isc_info_sweep_interval);
end;

function TIBDatabaseInfo.GetUserNames: TStringList;
var
  local_buffer: array[0..IBHugeLocalBufferLength - 1] of Byte;
  temp_buffer: TBytes;
  DatabaseInfoCommand: Byte;
  i, user_length: Integer;
begin
  result := FUserNames;
  SetLength(temp_buffer, IBHugeLocalBufferLength);
  DatabaseInfoCommand := Byte(isc_info_user_names);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                        IBHugeLocalBufferLength, @local_buffer), True);
  FUserNames.Clear;
  i := 0;
  while local_buffer[i] = isc_info_user_names do
  begin
    Inc(i, 3); { skip "isc_info_user_names byte" & two unknown bytes of structure (see below) }
    user_length := Long(local_buffer[i]);
    Inc(i,1);
    Move(local_buffer[i], temp_buffer[0], user_length);
    Inc(i, user_length);
    temp_buffer[user_length] := 0;
    FUserNames.Add(TEncoding.ANSI.GetString(temp_buffer, Low(temp_buffer), user_length));
  end;
end;

function TIBDatabaseInfo.GetFetches: Long;
begin
  result := GetLongDatabaseInfo(isc_info_fetches);
end;

function TIBDatabaseInfo.GetMarks: Long;
begin
  result := GetLongDatabaseInfo(isc_info_marks);
end;

function TIBDatabaseInfo.GetReads: Long;
begin
  result := GetLongDatabaseInfo(isc_info_reads);
end;

function TIBDatabaseInfo.GetWriteMode: TIBWriteMode;
begin
  case GetLongDatabaseInfo(isc_info_forced_writes) of
    0 : Result := wmASync;
    1 : Result := wmSync;
    2 : Result := wmDirect;
    else
      Result := wmNone;
  end;
end;

function TIBDatabaseInfo.GetWrites: Long;
begin
  result := GetLongDatabaseInfo(isc_info_writes);
end;

procedure TIBDatabaseInfo.SetDatabase(const Value: TIBDatabase);
begin
  FDatabase := Value;
end;

function TIBDatabaseInfo.GetOperationCounts(DBInfoCommand: Integer; FOperation: TStringList): TStringList;
var
  local_buffer: array[0..IBHugeLocalBufferLength - 1] of Byte;
  DatabaseInfoCommand: Byte;
  i, qtd_tables, id_table, qtd_operations: Integer;
begin
  if FOperation = nil then
    FOperation := TStringList.Create;
  result := FOperation;
  DatabaseInfoCommand := Byte(DBInfoCommand);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                         IBHugeLocalBufferLength, @local_buffer), True);
  FOperation.Clear;
  { 1. 1 byte specifying the item type requested (e.g., isc_info_insert_count).
    2. 2 bytes telling how many bytes compose the subsequent value pairs.
    3. A pair of values for each table in the database on wich the requested
      type of operation has occurred since the database was last attached.
    Each pair consists of:
    1. 2 bytes specifying the table ID.
    2. 4 bytes listing the number of operations (e.g., inserts) done on that table.
  }
  qtd_tables := GetGDSLibrary.isc_vax_integer(@local_buffer[1],2) div 6;
  for i := 0 to qtd_tables - 1 do
  begin
    id_table := GetGDSLibrary.isc_vax_integer(@local_buffer[3+(i*6)],2);
    qtd_operations := GetGDSLibrary.isc_vax_integer(@local_buffer[5+(i*6)],4);
    FOperation.Add(IntToStr(id_table)+'='+IntToStr(qtd_operations));
  end;
end;

function TIBDatabaseInfo.GetBackoutCount: TStringList;
begin
  result := GetOperationCounts(isc_info_backout_count,FBackoutCount);
end;

function TIBDatabaseInfo.GetDeleteCount: TStringList;
begin
  result := GetOperationCounts(isc_info_delete_count,FDeleteCount);
end;

function TIBDatabaseInfo.GetEncrypted: Boolean;
begin
  Result :=  GetLongDatabaseInfo(isc_info_db_encrypted) <> 0;
end;

function TIBDatabaseInfo.GetEUAActive: Boolean;
begin
  Result :=  GetLongDatabaseInfo(isc_info_db_eua_active) <> 0;
end;

function TIBDatabaseInfo.GetExpungeCount: TStringList;
begin
  result := GetOperationCounts(isc_info_expunge_count,FExpungeCount);
end;

function TIBDatabaseInfo.GetInsertCount: TStringList;
begin
  result := GetOperationCounts(isc_info_insert_count,FInsertCount);
end;

function TIBDatabaseInfo.GetPurgeCount: TStringList;
begin
  result := GetOperationCounts(isc_info_purge_count,FPurgeCount);
end;

function TIBDatabaseInfo.GetReadIdxCount: TStringList;
begin
  result := GetOperationCounts(isc_info_read_idx_count,FReadIdxCount);
end;

function TIBDatabaseInfo.GetReadSeqCount: TStringList;
begin
  result := GetOperationCounts(isc_info_read_seq_count,FReadSeqCount);
end;

function TIBDatabaseInfo.GetUpdateCount: TStringList;
begin
  result := GetOperationCounts(isc_info_update_count,FUpdateCount);
end;

function TIBDatabaseInfo.GetReadOnly: Long;
begin
  result := GetLongDatabaseInfo(isc_info_db_read_only);
end;

function TIBDatabaseInfo.GetLongDatabaseInfo(DatabaseInfoCommand: Integer): Long;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  length: Integer;
  _DatabaseInfoCommand: Byte;
begin
  _DatabaseInfoCommand := Byte(DatabaseInfoCommand);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @_DatabaseInfoCommand,
                         IBLocalBufferLength, @local_buffer), True);
  length := GetGDSLibrary.isc_vax_integer(@local_buffer[1], 2);
  result := GetGDSLibrary.isc_vax_integer(@local_buffer[3], length);
end;

function TIBDatabaseInfo.GetSepEncrypted: Boolean;
begin
  Result :=  GetLongDatabaseInfo(isc_info_db_sep_external) <> 0;
end;

function TIBDatabaseInfo.GetSetPageBuffers: Long;
begin
  Result := GetLongDatabaseInfo(isc_info_set_page_buffers);
end;

function TIBDatabaseInfo.GetStringDatabaseInfo(DatabaseInfoCommand: Integer): String;
var
  local_buffer: TBytes;
  _DatabaseInfoCommand: Byte;
begin
  SetLength(local_buffer, IBBigLocalBufferLength);
  _DatabaseInfoCommand := Byte(DatabaseInfoCommand);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @_DatabaseInfoCommand,
                         IBBigLocalBufferLength, PByte(local_buffer)), True);
  result := TEncoding.ANSI.GetString(local_buffer, 5, Int(local_buffer[4]));
end;


function TIBDatabaseInfo.GetDBSQLDialect: Integer;
var
  local_buffer: array[0..IBLocalBufferLength - 1] of Byte;
  length: Integer;
  DatabaseInfoCommand: Byte;
begin
  DatabaseInfoCommand := Byte(isc_info_db_SQL_Dialect);
  Call(GetGDSLibrary.isc_database_info(StatusVector, @FDatabase.Handle, 1, @DatabaseInfoCommand,
                       IBLocalBufferLength, @local_buffer), True);
  if local_buffer[0] <> isc_info_db_SQL_dialect then
    result := 1
  else begin
    length := GetGDSLibrary.isc_vax_integer(@local_buffer[1], 2);
    result := GetGDSLibrary.isc_vax_integer(@local_buffer[3], length);
  end;
end;

function TIBDatabaseInfo.GetFullODS: Extended;
begin
  Result := ODSMinorVersion;
  while Result >= 1 do
    Result := Result / 10;
  Result := Result + ODSMajorVersion;
end;

function TIBDatabaseInfo.GetGDSLibrary: IGDSLibrary;
begin
  if not assigned(FDatabase) then
    IBError(ibxeDatabaseNotAssigned, [])
  else
    Result := Database.GDSLibrary;
end;

function TIBDatabaseInfo.GetGroupCommit: Boolean;
begin
  Result :=  GetLongDatabaseInfo(isc_info_db_group_commit) <> 0;
end;

end.
