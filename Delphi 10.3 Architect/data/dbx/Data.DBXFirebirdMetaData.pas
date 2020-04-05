{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
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
