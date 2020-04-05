{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Logger.iOS;

interface

{$SCOPEDENUMS ON}

uses
  FMX.Platform;

type

  /// <summary>Logger service implementation for iOS</summary>
  TCocoaTouchLoggerService = class(TInterfacedObject, IFMXLoggingService)
  private
    procedure RegisterService;
    procedure UnregisterService;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXLoggingService }
    /// <summary>Logs <c>params</c> with specified <c>format</c> into device or simulator console</summary>
    procedure Log(const AFormat: string; const AParams: array of const);
  end;

implementation

uses
  System.SysUtils, Macapi.Helpers, Macapi.ObjectiveC, iOSapi.Foundation;

{ TCocoaLogger }

constructor TCocoaTouchLoggerService.Create;
begin
  inherited;
  RegisterService;
end;

destructor TCocoaTouchLoggerService.Destroy;
begin
  UnregisterService;
  inherited;
end;

procedure TCocoaTouchLoggerService.Log(const AFormat: string; const AParams: array of const);
var
  Message: string;
begin
  if Length(AParams) = 0 then
    Message := AFormat
  else
    Message := Format(AFormat, AParams);
  NSLog(StringToId(Message));
end;

procedure TCocoaTouchLoggerService.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXLoggingService) then
    TPlatformServices.Current.AddPlatformService(IFMXLoggingService, Self);
end;

procedure TCocoaTouchLoggerService.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXLoggingService);
end;

end.
