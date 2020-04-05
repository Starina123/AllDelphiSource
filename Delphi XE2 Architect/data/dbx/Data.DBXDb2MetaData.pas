{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DBXDb2MetaData"'}    {Do not Localize}
unit Data.DBXDb2MetaData;

interface

uses
  Data.DBXMetaDataWriterFactory,
  Data.DBXDb2MetaDataWriter
  ;


implementation

initialization
  TDBXMetaDataWriterFactory.RegisterWriter('Db2', TDBXDb2MetaDataWriter);
finalization
  TDBXMetaDataWriterFactory.UnRegisterWriter('Db2', TDBXDb2MetaDataWriter);
end.
