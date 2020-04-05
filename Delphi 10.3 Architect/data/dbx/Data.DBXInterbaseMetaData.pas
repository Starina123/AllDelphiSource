{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Data.DBXInterbaseMetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXInterbaseMetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Interbase', TDBXInterbaseMetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Interbase', TDBXInterbaseMetaDataWriter);
end.
