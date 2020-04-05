{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{                                                       }
{ Copyright(c) 2004-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.Phys.MongoDBDef;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, System.JSON.Types;

type
  // TFDPhysMongoConnectionDefParams
  // Generated for: FireDAC MongoDB driver

  /// <summary> TFDPhysMongoConnectionDefParams class implements FireDAC MongoDB driver specific connection definition class. </summary>
  TFDPhysMongoConnectionDefParams = class(TFDConnectionDefParams)
  private
    function GetDriverID: String;
    procedure SetDriverID(const AValue: String);
    function GetServer: String;
    procedure SetServer(const AValue: String);
    function GetPort: Integer;
    procedure SetPort(const AValue: Integer);
    function GetMoreHosts: String;
    procedure SetMoreHosts(const AValue: String);
    function GetUseSSL: Boolean;
    procedure SetUseSSL(const AValue: Boolean);
    function GetLoginTimeout: Integer;
    procedure SetLoginTimeout(const AValue: Integer);
    function GetReadTimeout: Integer;
    procedure SetReadTimeout(const AValue: Integer);
    function GetTimeZone: TJsonDateTimeZoneHandling;
    procedure SetTimeZone(const AValue: TJsonDateTimeZoneHandling);
    function GetMongoAdvanced: String;
    procedure SetMongoAdvanced(const AValue: String);
  published
    property DriverID: String read GetDriverID write SetDriverID stored False;
    property Server: String read GetServer write SetServer stored False;
    property Port: Integer read GetPort write SetPort stored False default 27017;
    property MoreHosts: String read GetMoreHosts write SetMoreHosts stored False;
    property UseSSL: Boolean read GetUseSSL write SetUseSSL stored False;
    property LoginTimeout: Integer read GetLoginTimeout write SetLoginTimeout stored False default 0;
    property ReadTimeout: Integer read GetReadTimeout write SetReadTimeout stored False default 300;
    property TimeZone: TJsonDateTimeZoneHandling read GetTimeZone write SetTimeZone stored False default TJsonDateTimeZoneHandling.Local;
    property MongoAdvanced: String read GetMongoAdvanced write SetMongoAdvanced stored False;
  end;

implementation

uses
  FireDAC.Stan.Consts;

// TFDPhysMongoConnectionDefParams
// Generated for: FireDAC MongoDB driver

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetDriverID: String;
begin
  Result := FDef.AsString[S_FD_ConnParam_Common_DriverID];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetDriverID(const AValue: String);
begin
  FDef.AsString[S_FD_ConnParam_Common_DriverID] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetServer: String;
begin
  Result := FDef.AsString[S_FD_ConnParam_Common_Server];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetServer(const AValue: String);
begin
  FDef.AsString[S_FD_ConnParam_Common_Server] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetPort: Integer;
begin
  if not FDef.HasValue(S_FD_ConnParam_Common_Port) then
    Result := 27017
  else
    Result := FDef.AsInteger[S_FD_ConnParam_Common_Port];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetPort(const AValue: Integer);
begin
  FDef.AsInteger[S_FD_ConnParam_Common_Port] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetMoreHosts: String;
begin
  Result := FDef.AsString[S_FD_ConnParam_Mongo_MoreHosts];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetMoreHosts(const AValue: String);
begin
  FDef.AsString[S_FD_ConnParam_Mongo_MoreHosts] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetUseSSL: Boolean;
begin
  Result := FDef.AsBoolean[S_FD_ConnParam_Mongo_UseSSL];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetUseSSL(const AValue: Boolean);
begin
  FDef.AsBoolean[S_FD_ConnParam_Mongo_UseSSL] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetLoginTimeout: Integer;
begin
  Result := FDef.AsInteger[S_FD_ConnParam_Common_LoginTimeout];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetLoginTimeout(const AValue: Integer);
begin
  FDef.AsInteger[S_FD_ConnParam_Common_LoginTimeout] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetReadTimeout: Integer;
begin
  if not FDef.HasValue(S_FD_ConnParam_Mongo_ReadTimeout) then
    Result := 300
  else
    Result := FDef.AsInteger[S_FD_ConnParam_Mongo_ReadTimeout];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetReadTimeout(const AValue: Integer);
begin
  FDef.AsInteger[S_FD_ConnParam_Mongo_ReadTimeout] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetTimeZone: TJsonDateTimeZoneHandling;
var
  s: String;
begin
  s := FDef.AsString[S_FD_ConnParam_Mongo_TimeZone];
  if CompareText(s, 'Local') = 0 then
    Result := TJsonDateTimeZoneHandling.Local
  else if CompareText(s, 'UTC') = 0 then
    Result := TJsonDateTimeZoneHandling.UTC
  else
    Result := TJsonDateTimeZoneHandling.Local;
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetTimeZone(const AValue: TJsonDateTimeZoneHandling);
const
  C_TimeZone: array[TJsonDateTimeZoneHandling] of String = ('Local', 'UTC');
begin
  FDef.AsString[S_FD_ConnParam_Mongo_TimeZone] := C_TimeZone[AValue];
end;

{-------------------------------------------------------------------------------}
function TFDPhysMongoConnectionDefParams.GetMongoAdvanced: String;
begin
  Result := FDef.AsString[S_FD_ConnParam_Mongo_MongoAdvanced];
end;

{-------------------------------------------------------------------------------}
procedure TFDPhysMongoConnectionDefParams.SetMongoAdvanced(const AValue: String);
begin
  FDef.AsString[S_FD_ConnParam_Mongo_MongoAdvanced] := AValue;
end;

end.
