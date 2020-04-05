{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXOracleMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXOracleMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Oracle', TDBXOracleMetaDataWriter); {Do not localize}
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Oracle', TDBXOracleMetaDataWriter); {Do not localize}
end.
