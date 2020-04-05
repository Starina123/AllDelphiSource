{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXOracleMetaData"'}    {Do not Localize}
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
