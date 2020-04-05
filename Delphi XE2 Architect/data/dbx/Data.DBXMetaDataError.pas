{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataError;

interface

uses
  Data.DBXCommon;

type
  TDBXMetaDataError = class(TDBXError)
  public
    constructor Create(const Message: WideString);
  end;

implementation

constructor TDBXMetaDataError.Create(const Message: WideString);
begin
  inherited Create(TDBXErrorCodes.InvalidOperation, Message);
end;

end.
