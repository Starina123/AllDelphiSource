{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2015-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMSHosting.LoggingService;

{$HPPEMIT LINKUNIT}

interface

uses
  System.SysUtils, System.Classes, EMS.Services,
  System.Generics.Collections, System.JSON;

type
  TEMSLoggingService = class(TInterfacedObject, IEMSLoggingService, IEMSLoggingServiceSetup)
  private
    FWriter: TStreamWriter;
    FLogIsEmpty: Boolean;
    FOutputProc: TEMSLoggingOutputProc;
    FEnabledFunc: TEMSLoggingEnabledFunc;
    FSynchronize: Boolean;
  public
    destructor Destroy; override;
    // IEMSLoggingService
    function GetLoggingEnabled: Boolean;
    procedure Log(const ACategory: string; const AJSON: TJSONObject);
    // IEMSLoggingServiceSetup
    procedure SetupCustomOutput(const AEnabled: TEMSLoggingEnabledFunc;
      const AOutput: TEMSLoggingOutputProc; const ASynchronize: Boolean);
    procedure SetupFileOutput(const AFileName: string; const AAppend: Boolean);
  end;

implementation

uses
  System.DateUtils, EMSHosting.ExtensionsServices, EMSHosting.Helpers;

{ TEMSLoggingService }

destructor TEMSLoggingService.Destroy;
begin
  SetupFileOutput('', False);
  SetupCustomOutput(nil, nil, False);
  inherited Destroy;
end;

procedure TEMSLoggingService.SetupFileOutput(const AFileName: string;
  const AAppend: Boolean);
var
  LJSON: TJSONObject;
  LLine: string;
begin
  try
    if FWriter <> nil then
    begin
      if not FLogIsEmpty then
        FWriter.WriteLine;
      FWriter.Write(']}');
      FWriter.WriteLine;
      FreeAndNil(FWriter);
    end;

    if AFileName <> '' then
    begin
      FWriter := TStreamWriter.Create(AFileName, AAppend, TEncoding.UTF8);
      LJSON := TJSONObject.Create;
      try
        LJSON.AddPair(TLogObjectNames.Application, GetModuleName(HInstance));
        LJSON.AddPair(TLogObjectNames.Started, DateToISO8601(Now(), False));
        LJSON.AddPair(TLogObjectNames.Log, TJSONArray.Create);
        LLine := LJSON.ToJSON;
        FWriter.Write(Copy(LLine, 1, Length(LLine) - 2));
        FWriter.WriteLine;
        FLogIsEmpty := True;
      finally
        LJSON.Free;
      end;
    end;
  except
    if Assigned(ApplicationHandleException) then
      ApplicationHandleException(Self);
  end;
end;

procedure TEMSLoggingService.SetupCustomOutput(const AEnabled: TEMSLoggingEnabledFunc;
  const AOutput: TEMSLoggingOutputProc; const ASynchronize: Boolean);
begin
  FEnabledFunc := AEnabled;
  FOutputProc := AOutput;
  FSynchronize := ASynchronize;
end;

function TEMSLoggingService.GetLoggingEnabled: Boolean;
begin
  if FWriter <> nil then
    Result := True
  else
  begin
    Result := Assigned(FOutputProc);
    if Result then
      if Assigned(FEnabledFunc) then
        Result := FEnabledFunc();
  end;
end;

procedure TEMSLoggingService.Log(const ACategory: string; const AJSON: TJSONObject);
var
  LJSON: TJSONObject;
  LPrivateJSON: TJSONObject;
  LLine: string;
begin
  if not GetLoggingEnabled then
    Exit;

  LJSON := TJSONObject.Create;
  try
    LJSON.AddPair(TLogObjectNames.Thread, TJSONNumber.Create(TThread.CurrentThread.ThreadID));
    LJSON.AddPair(ACategory, TJSONValue(AJSON.Clone));

    if FWriter <> nil then
    begin
      TMonitor.Enter(FWriter);
      try
        if not FLogIsEmpty then
        begin
          FWriter.Write(',');
          FWriter.WriteLine;
        end;
        LLine := LJSON.ToString;
        FWriter.Write(LLine);
        FLogIsEmpty := False;
      finally
        TMonitor.Exit(FWriter);
      end;
    end;

    if Assigned(FOutputProc) and (not Assigned(FEnabledFunc) or FEnabledFunc()) then
      if FSynchronize then
      begin
        LPrivateJSON := LJSON;
        LJSON := nil;
        TThread.Synchronize(nil,
          procedure
          begin
            FOutputProc(ACategory, LPrivateJSON);
            LPrivateJSON.Free;
          end);
      end
      else
        FOutputProc(ACategory, LJSON);
  finally
    LJSON.Free;
  end;
end;

var
  LIndex: Integer;
initialization
  LIndex := AddService(TEMSLoggingService.Create as IEMSLoggingService);
finalization
  RemoveService(LIndex);
end.
