{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXMySqlMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXMySqlMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('MySQL', TDBXMySqlMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('MySQL', TDBXMySqlMetaDataWriter);
end.
