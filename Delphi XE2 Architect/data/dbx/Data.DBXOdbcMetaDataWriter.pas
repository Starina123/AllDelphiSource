{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXOdbcMetaDataWriter;

interface

uses
  Data.DBXCommonTable,
  Data.DBXMetaDataReader,
  Data.DBXMetaDataWriter,
  Data.DBXPlatform;

type
  TDBXOdbcCustomMetaDataWriter = class(TDBXBaseMetaDataWriter)
  end;

  TDBXOdbcMetaDataWriter = class(TDBXOdbcCustomMetaDataWriter)
  public
    constructor Create;
    procedure Open; override;
  end;

implementation

uses
  Data.DBXCommon,
  Data.DBXOdbcMetaDataReader,
  Data.DBXMetaDataNames,
  System.SysUtils;

constructor TDBXOdbcMetaDataWriter.Create;
begin
  inherited Create;
  Open;
end;

procedure TDBXOdbcMetaDataWriter.Open;
begin
  if FReader = nil then
    FReader := TDBXOdbcMetaDataReader.Create;
end;

end.
