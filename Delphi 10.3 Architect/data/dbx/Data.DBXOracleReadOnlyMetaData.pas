{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXOracleReadOnlyMetaData;

interface

uses
  Data.DBXMetaDataReader,
  Data.DBXMetaDataCommandFactory;

type
  TDBXOracleMetaDataCommandFactory = class(TDBXMetaDataCommandFactory)
  public
    function CreateMetaDataReader: TDBXMetaDataReader; override;
  end;

implementation

uses
  Data.DBXOracleMetaDataReader;

function TDBXOracleMetaDataCommandFactory.CreateMetaDataReader: TDBXMetaDataReader;
begin
  Result := TDBXOracleMetaDataReader.Create;
end;

initialization
  TDBXMetaDataCommandFactory.RegisterMetaDataCommandFactory(TDBXOracleMetaDataCommandFactory);
finalization
  TDBXMetaDataCommandFactory.UnRegisterMetaDataCommandFactory(TDBXOracleMetaDataCommandFactory);
end.
