{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXSybaseASAMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXSybaseASAMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Adaptive Server Anywhere', TDBXSybaseASAMetaDataWriter); {Do not localize}
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Adaptive Server Anywhere', TDBXSybaseASAMetaDataWriter); {Do not localize}
end.
