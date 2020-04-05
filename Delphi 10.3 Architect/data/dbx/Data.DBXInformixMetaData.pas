{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXInformixMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXInformixMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Informix Dynamic Server', TDBXInformixMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Informix Dynamic Server', TDBXInformixMetaDataWriter);
end.
