{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataWriterFactory;

interface

uses
  System.Classes,
  Data.DBXMetaDataWriter
;

const
  SWriterPrefix = 'Borland.MetaDataWriter.';

type
  TDBXMetaDataWriterFactory = class
  private
    class var FProviderRegistry: TStringList;
  public
    class procedure RegisterWriter(DialectName: String; WriterClass: TClass);
    class procedure UnRegisterWriter(DialectName: String; WriterClass: TClass);
    class procedure FreeWriterRegistry;
    class function CreateWriter(DialectName: String): TDBXMetaDataWriter;

  end;

implementation

uses
  Data.DBXCommon,
  System.SysUtils,
  Data.DBXClassRegistry,
  Data.DBXCommonResStrs
;

type
  TWriterItem = class
  private
    FClass: TClass;
    constructor Create(WriterClass: TClass);
  end;


{ TDBXMetaDataWriterFactory }

class function TDBXMetaDataWriterFactory.CreateWriter(
  DialectName: String): TDBXMetaDataWriter;
var
  WriterItem: TWriterItem;
  Index: Integer;
begin
  Index := FProviderRegistry.IndexOf(DialectName);
  if Index < 0 then
  begin
    raise TDBXError.Create(TDBXErrorCodes.DriverInitFailed, Format(SNoMetadataProvider, [DialectName])+'  Add driver unit to your uses (DbxInterBase or DbxDb2 or DbxMsSql or DBXMySQL or DbxOracle or DbxSybaseASA or DbxSybaseASE)');
  end;
  WriterItem := FProviderRegistry.Objects[Index] as TWriterItem;;
  Result := TClassRegistry.GetClassRegistry.CreateInstance(WriterItem.FClass.ClassName) as TDBXMetaDataWriter;
  Result.Open;
end;

class procedure TDBXMetaDataWriterFactory.FreeWriterRegistry;
  var
    Index: Integer;
  begin
    for Index := 0 to FProviderRegistry.Count - 1 do
      FProviderRegistry.Objects[Index].Free;
    FProviderRegistry.Free;
    FProviderRegistry := nil;
  end;

class procedure TDBXMetaDataWriterFactory.RegisterWriter(
  DialectName: String;
  WriterClass: TClass);
var
  ClassRegistry: TClassRegistry;
  ClassName: String;
begin
  FProviderRegistry.AddObject(DialectName, TWriterItem.Create(WriterClass));
  ClassRegistry := TClassRegistry.GetClassRegistry;
  ClassName := WriterClass.ClassName;
  if not ClassRegistry.HasClass(ClassName) then
    ClassRegistry.RegisterClass(ClassName, WriterClass, nil);
end;


class procedure TDBXMetaDataWriterFactory.UnRegisterWriter(DialectName: String;
  WriterClass: TClass);
begin
  TClassRegistry.GetClassRegistry.UnregisterClass(WriterClass.ClassName);
end;

{ TWriterItem }

constructor TWriterItem.Create(WriterClass: TClass);
begin
  FClass := WriterClass;
  inherited Create;
end;

initialization
  TDBXMetaDataWriterFactory.FProviderRegistry := TStringList.Create;
finalization
  TDBXMetaDataWriterFactory.FreeWriterRegistry;

end.
