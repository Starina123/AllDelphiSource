{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXSybaseASEMetaDataWriter;

interface

uses
  Data.DBXCommonTable,
  Data.DBXMetaDataWriter,
  Data.DBXPlatform;

type
  TDBXSybaseASECustomMetaDataWriter = class(TDBXBaseMetaDataWriter)
  public
    procedure MakeSqlCreate(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow; const Parts: TDBXTable); override;
    procedure MakeSqlAlter(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow; const Parts: TDBXTable); override;
    procedure MakeSqlDrop(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow); override;
  protected
    procedure MakeSqlColumnTypeCast(const Buffer: TDBXStringBuffer; const Column: TDBXTable); override;
    procedure MakeSqlDropSecondaryIndex(const Buffer: TDBXStringBuffer; const Index: TDBXTableRow); override;
  private
    const SetQuotedIdentifiersOn = 'SET QUOTED_IDENTIFIER ON;'#$a;
  end;

  TDBXSybaseASEMetaDataWriter = class(TDBXSybaseASECustomMetaDataWriter)
  public
    constructor Create;
    procedure Open; override;
  protected
    function GetSqlAutoIncrementKeyword: UnicodeString; override;
    function GetSqlAutoIncrementInserts: UnicodeString; override;
    function IsCatalogsSupported: Boolean; override;
    function IsSchemasSupported: Boolean; override;
    function IsSerializedIsolationSupported: Boolean; override;
    function IsMultipleStatementsSupported: Boolean; override;
    function IsDDLTransactionsSupported: Boolean; override;
    function GetSqlRenameTable: UnicodeString; override;
  end;

implementation

uses
  Data.DBXMetaDataNames,
  Data.DBXSybaseASEMetaDataReader;

procedure TDBXSybaseASECustomMetaDataWriter.MakeSqlCreate(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow; const Parts: TDBXTable);
begin
  Buffer.Append(SetQuotedIdentifiersOn);
  inherited MakeSqlCreate(Buffer, Item, Parts);
end;

procedure TDBXSybaseASECustomMetaDataWriter.MakeSqlAlter(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow; const Parts: TDBXTable);
begin
  Buffer.Append(SetQuotedIdentifiersOn);
  inherited MakeSqlAlter(Buffer, Item, Parts);
end;

procedure TDBXSybaseASECustomMetaDataWriter.MakeSqlDrop(const Buffer: TDBXStringBuffer; const Item: TDBXTableRow);
begin
  Buffer.Append(SetQuotedIdentifiersOn);
  inherited MakeSqlDrop(Buffer, Item);
end;

procedure TDBXSybaseASECustomMetaDataWriter.MakeSqlColumnTypeCast(const Buffer: TDBXStringBuffer; const Column: TDBXTable);
var
  Original: TDBXTableRow;
begin
  Original := Column.OriginalRow;
  Buffer.Append(TDBXSQL.Convert);
  Buffer.Append(TDBXSQL.OpenParen);
  MakeSqlDataType(Buffer, Column.Value[TDBXColumnsIndex.TypeName].AsString, Column);
  Buffer.Append(TDBXSQL.Comma);
  Buffer.Append(TDBXSQL.Space);
  MakeSqlIdentifier(Buffer, Original.Value[TDBXColumnsIndex.ColumnName].GetWideString(NullString));
  Buffer.Append(TDBXSQL.CloseParen);
end;

procedure TDBXSybaseASECustomMetaDataWriter.MakeSqlDropSecondaryIndex(const Buffer: TDBXStringBuffer; const Index: TDBXTableRow);
var
  Original: TDBXTableRow;
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

constructor TDBXSybaseASEMetaDataWriter.Create;
begin
  inherited Create;
  Open;
end;

procedure TDBXSybaseASEMetaDataWriter.Open;
begin
  if FReader = nil then
    FReader := TDBXSybaseASEMetaDataReader.Create;
end;

function TDBXSybaseASEMetaDataWriter.GetSqlAutoIncrementKeyword: UnicodeString;
begin
  Result := 'IDENTITY';
end;

function TDBXSybaseASEMetaDataWriter.GetSqlAutoIncrementInserts: UnicodeString;
begin
  Result := 'IDENTITY_INSERT';
end;

function TDBXSybaseASEMetaDataWriter.IsCatalogsSupported: Boolean;
begin
  Result := False;
end;

function TDBXSybaseASEMetaDataWriter.IsSchemasSupported: Boolean;
begin
  Result := True;
end;

function TDBXSybaseASEMetaDataWriter.IsSerializedIsolationSupported: Boolean;
begin
  Result := False;
end;

function TDBXSybaseASEMetaDataWriter.IsMultipleStatementsSupported: Boolean;
begin
  Result := False;
end;

function TDBXSybaseASEMetaDataWriter.IsDDLTransactionsSupported: Boolean;
begin
  Result := False;
end;

function TDBXSybaseASEMetaDataWriter.GetSqlRenameTable: UnicodeString;
begin
  Result := 'EXEC sp_rename '':SCHEMA_NAME.:TABLE_NAME'', '':NEW_TABLE_NAME'', ''OBJECT''';
end;

end.
