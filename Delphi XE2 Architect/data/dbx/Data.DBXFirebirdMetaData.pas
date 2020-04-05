{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXFirebirdMetaData"'}    {Do not Localize}
unit Data.DBXFirebirdMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXFirebirdMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Firebird', TDBXFirebirdMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Firebird', TDBXFirebirdMetaDataWriter);
end.
