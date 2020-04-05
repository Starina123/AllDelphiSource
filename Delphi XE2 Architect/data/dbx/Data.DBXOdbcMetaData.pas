{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXOdbcMetaData"'}    {Do not Localize}
unit Data.DBXOdbcMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXOdbcMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Odbc', TDBXOdbcMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Odbc', TDBXOdbcMetaDataWriter);
end.
