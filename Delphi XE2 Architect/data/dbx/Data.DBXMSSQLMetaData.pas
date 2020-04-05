{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXMsSqlMetaData"'}    {Do not Localize}
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
