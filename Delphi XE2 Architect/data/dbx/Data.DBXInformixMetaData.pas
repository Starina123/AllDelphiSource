{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXInformixMetaData"'}    {Do not Localize}
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
