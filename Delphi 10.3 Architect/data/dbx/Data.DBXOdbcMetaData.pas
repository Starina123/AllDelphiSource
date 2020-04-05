{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
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
