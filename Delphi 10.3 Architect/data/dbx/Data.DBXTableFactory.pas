{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Data.DBXTableFactory;

interface

uses
  Data.DBXCommonTable;

type
  TDBXTableFactory = class
    class function CreateDBXTable: TDBXTable; static;
  end;

implementation

uses
  Data.DBXDBReaders;

class function TDBXTableFactory.CreateDBXTable: TDBXTable;
begin
  Result := TDBXMemoryTable.Create;
end;

end.
