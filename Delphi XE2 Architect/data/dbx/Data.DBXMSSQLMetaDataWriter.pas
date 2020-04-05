{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMSSQLMetaDataWriter;

interface

uses
  Data.DBXCommonTable,
  Data.DBXMetaDataWriter,
  Data.DBXPlatform;

type
  TDBXMsSqlCustomMetaDataWriter = class(TDBXBaseMetaDataWriter)
  protected
    procedure MakeSqlDropSecondaryIndex(const Buffer: TDBXStringBuffer; const Index: TDBXTableRow); override;
  end;

  TDBXMsSqlMetaDataWriter = class(TDBXMsSqlCustomMetaDataWriter)
  public
    constructor Create;
    procedure Open; override;
  protected
    function GetSqlAutoIncrementKeyword: UnicodeString; override;
    function GetSqlAutoIncrementInserts: UnicodeString; override;
    function GetSqlRenameTable: UnicodeString; override;
    function IsCatalogsSupported: Boolean; override;
    function IsSchemasSupported: Boolean; override;
    function IsMultipleStatementsSupported: Boolean; override;
  end;

implementation

uses
  Data.DBXMetaDataNames,
  Data.DBXMsSqlMetaDataReader;

procedure TDBXMsSqlCustomMetaDataWriter.MakeSqlDropSecondaryIndex(const Buffer: TDBXStringBuffer; const Index: TDBXTableRow);
var
  Version: UnicodeString;
  Original: TDBXTableRow;
begin
  Version := FReader.Version;
  if Version >= '09.00.0000' then
    inherited MakeSqlDropSecondaryIndex(Buffer, Index)
  else 
  begin
    Original := Index.OriginalRow;
    Buffer.Append(TDBXSQL.Drop);
    Buffer.Append(TDBXSQL.Space);
    Buffer.Append(TDBXSQL.Index);
    Buffer.Append(TDBXSQL.Space);
    MakeSqlIdentifier(Buffer, Original.Value[TDBXIndexesIndex.TableName].GetWideString(NullString));
    Buffer.Append(TDBXSQL.Dot);
    MakeSqlIdentifier(Buffer, Original.Value[TDBXIndexesIndex.IndexName].GetWideString(NullString));
    Buffer.Append(TDBXSQL.Semicolon);
    Buffer.Append(TDBXSQL.Nl);
  end;
end;

constructor TDBXMsSqlMetaDataWriter.Create;
begin
  inherited Create;
  Open;
end;

procedure TDBXMsSqlMetaDataWriter.Open;
begin
  if FReader = nil then
    FReader := TDBXMsSqlMetaDataReader.Create;
end;

function TDBXMsSqlMetaDataWriter.GetSqlAutoIncrementKeyword: UnicodeString;
begin
  Result := 'IDENTITY';
end;

function TDBXMsSqlMetaDataWriter.GetSqlAutoIncrementInserts: UnicodeString;
begin
  Result := 'IDENTITY_INSERT';
end;

function TDBXMsSqlMetaDataWriter.GetSqlRenameTable: UnicodeString;
begin
  Result := 'EXEC sp_rename '':SCHEMA_NAME.:TABLE_NAME'', '':NEW_TABLE_NAME'', ''OBJECT''';
end;

function TDBXMsSqlMetaDataWriter.IsCatalogsSupported: Boolean;
begin
  Result := True;
end;

function TDBXMsSqlMetaDataWriter.IsSchemasSupported: Boolean;
begin
  Result := True;
end;

function TDBXMsSqlMetaDataWriter.IsMultipleStatementsSupported: Boolean;
begin
  Result := True;
end;

end.
