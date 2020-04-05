{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXSybaseASAMetaData"'}    {Do not Localize}
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
