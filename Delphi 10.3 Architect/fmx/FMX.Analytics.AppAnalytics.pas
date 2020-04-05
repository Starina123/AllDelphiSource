{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit FMX.Analytics.AppAnalytics;

interface

{$SCOPEDENUMS ON}

uses
  System.SysUtils, System.Classes, System.Analytics, FMX.Analytics;

type
  ///  <summary>Implementation of TCustomAnalytics for use with the Embarcadero AppAnalytics platform.</summary>
  TAppAnalytics = class(TCustomAnalytics)
  private
    FServerAddress: string;
    FServerPort: Integer;
    FListener: IApplicationActivityListener;
    FCacheManager: IApplicationActivityCacheManager;
  protected
    ///  <summary>Returns an AppAnalytics-specific implementaiton of IApplicationActivityListener. Returns nil if
    ///  InstallHooks has not been executed.</summary>
    function GetListener: IApplicationActivityListener; override;
    ///  <summary>Returns an AppAnalytics-specific implementation of IApplicationActivityCacheManager. Returns nil if
    ///  InstallHooks has not been executed.</summary>
	  function GetCacheManager: IApplicationActivityCacheManager; override;
    ///  <summary>Creates an instance of TAppAnalyticsCacheManagaer and TAppAnalyticsListener and invokes the inherited
    ///  method to register and configure it for this application.</summary>
    procedure InstallHooks; override;
    ///  <summary>Calls the inherited method to close down the collection of data and flush the cache. Clears the local
    ///  references to the IApplicationActivityListener and IApplicationActivityCacheManager.</summary>
    procedure RemoveHooks; override;
    ///  <summary>If Value is True, then this method obtains user consent for activity tracking, invokes InstallHooks
    ///  and starts collecting activity data.
    ///  <para>If Value is False, then this method halts the collection of activity data and invokes RemoveHooks.
    ///  </para></summary>
    procedure SetEnabled(const Value: Boolean); override;
  public
    ///  <summary>Creates an instance of the component.</summary>
    constructor Create(AOwner: TComponent); override;
    /// <summary>Track a custom event. Call this method to do your own event tracking. You might use this to track
    /// feature usage, performance data, or anything else you like, provided the information remains anonymous.
    /// ACategory, AAction, ALabel, and AValue are fields you can define to describe the event being tracked.
    /// Only ACategory is required.</summary>
    procedure TrackEvent(const ACategory: string; const AAction: string = string.Empty;
      const ALabel: string = string.Empty; const AValue: Double = 0.0);
    ///  <summary>The IP address or name of the AppAnalytics server.</summary>
    property AppAnalyticsServer: string read FServerAddress write FServerAddress;
    ///  <summary>The port number to use for sending data (usually 80).</summary>
    property ServerPort: Integer read FServerPort write FServerPort default 80;
  published
    ///  <summary>Enables or disables application event tracking.</summary>
    property Enabled;
    ///  <summary>An event handler that is fired when the component needs to obtain user consent for activity
    ///  tracking.</summary>
    property OnPrivacyMessage;
    ///  <summary>The string provided by AppAnalytics to identify this application.</summary>
    property ApplicationID;
    ///  <summary>The interval that collected activity data should be submitted to AppAnalytics servers.</summary>
    property UpdateInterval;
    ///  <summary>The maximum number of events that should be stored in memory before being submitted to the
    ///  AppAnalytics servers.</summary>
    property CacheSize;
    ///  <summary>A set of the TAppActivity values indicating which activities to track.</summary>
    property Options;
    ///  <summary>The text to be displayed to the user to obtain consent for gathering activity information.</summary>
    ///  <remarks>This property should be used only if an OnPrivacyMessage event handler is not created.</remarks>
    property PrivacyMessage;
  end;

  /// <summary>An exception type which is raised by the TrackEvent method if the ACategory parameter is left blank.</summary>
  EAppAnalyticsCategoryMissingException = class(Exception)
  end;

implementation

uses
  System.Analytics.AppAnalytics, FMX.Types, FMX.Platform, FMX.Forms, FMX.Consts;

{ TAppAnalytics }

constructor TAppAnalytics.Create(AOwner: TComponent);
begin
  inherited;
  FServerAddress := 'appanalytics.embarcadero.com'; // do not localize
  FServerPort := 443;
end;

function TAppAnalytics.GetCacheManager: IApplicationActivityCacheManager;
begin
  Result := FCacheManager;
end;

function TAppAnalytics.GetListener: IApplicationActivityListener;
begin
  Result := FListener;
end;

procedure TAppAnalytics.InstallHooks;
var
  Version: string;
  AppSvc: IFMXApplicationService;
begin
  FCacheManager := TAppAnalyticsCacheManager.Create(ApplicationID, UserID, FServerAddress, FServerPort);
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppSvc) then
    Version := AppSvc.AppVersion
  else
    Version := string.Empty;

  FListener := TAppAnalyticsListener.Create(FCacheManager, Version, Options);
  inherited;
end;

procedure TAppAnalytics.RemoveHooks;
begin
  inherited;
  FListener := nil;
  FCacheManager := nil;
 end;

procedure TAppAnalytics.SetEnabled(const Value: Boolean);
var
  GUID: TGUID;
begin
  if UserID.IsEmpty then
  begin
    CreateGUID(GUID);
    UserID := GuidToString(GUID);
  end;

  inherited;
end;

procedure TAppAnalytics.TrackEvent(const ACategory, AAction, ALabel: string; const AValue: Double);
var
  Context: TCustomEventContext;
begin
  if Enabled then
    if ACategory <> string.Empty then
    begin
      Context := TCustomEventContext.Create(ACategory, AAction, ALabel, AValue);
      try
        Application.AnalyticsManager.RecordActivity(TAppActivity.Custom, Self, Context);
      finally
        Context.Free;
      end;
    end
    else
      raise EAppAnalyticsCategoryMissingException.Create(SCustomAnalyticsCategoryMissing);
end;

initialization
  RegisterFmxClasses([TAppAnalytics]);

end.
