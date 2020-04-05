{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXMSSQLMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXMsSQlMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Microsoft SQL Server', TDBXMsSqlMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Microsoft SQL Server', TDBXMsSqlMetaDataWriter);
end.
