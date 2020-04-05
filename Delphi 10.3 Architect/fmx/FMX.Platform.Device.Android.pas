{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


unit FMX.Platform.Device.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Devices, FMX.Platform, FMX.Types, FMX.Forms;

type

  /// <summary>Implementation of <c>IFMXDeviceService</c> for Android</summary>
  TAndroidDeviceServices = class(TInterfacedObject, IFMXDeviceService)
  private
    FDeviceClassCached: Boolean;
    FDeviceClass: TDeviceInfo.TDeviceClass;
  protected
    /// <summary>Register service <c>IFMXDeviceService</c> implementation</summary>
    procedure RegisterService; virtual;
    /// <summary>Unregister <c>IFMXDeviceService</c> implementation</summary>
    procedure UnregisterService; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Returns true, if current device support telephone calls</summary>
    function SuppportsTelephony: Boolean;
    { IFMXDeviceService }
    /// <summary>Returns string presentation of device model name</summary>
    function GetModel: string;
    /// <summary>Returns set of device's features</summary>
    function GetFeatures: TDeviceFeatures;
    /// <summary>Returns class of current device</summary>
    function GetDeviceClass: TDeviceInfo.TDeviceClass;
  end;

implementation

uses
  System.Types, System.SysUtils, Androidapi.JNI.Telephony, Androidapi.JNI.Util, Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Os, Androidapi.JNI.JavaTypes, Androidapi.Helpers;

{ TAndroidDeviceServices }

constructor TAndroidDeviceServices.Create;
begin
  inherited;
  RegisterService;
end;

destructor TAndroidDeviceServices.Destroy;
begin
  UnregisterService;
  inherited;
end;

function TAndroidDeviceServices.GetDeviceClass: TDeviceInfo.TDeviceClass;
const
  MaxPhoneDiagonalSize = 6;
  MinWatchAPILevel = 20;
var
  DisplayMetrics: JDisplayMetrics;
  Display: JDisplay;
  ScreenWidth: Integer;
  ScreenHeight: Integer;
  ScreenDiagonal: Double;
begin
  if FDeviceClassCached then
    Exit(FDeviceClass);

  Display := TAndroidHelper.Display;
  DisplayMetrics := TJDisplayMetrics.Create;
  Display.getMetrics(DisplayMetrics);
  ScreenWidth := Round(DisplayMetrics.widthPixels / DisplayMetrics.densityDpi);
  ScreenHeight := Round(DisplayMetrics.heightPixels / DisplayMetrics.densityDpi);
  ScreenDiagonal := Sqrt(ScreenWidth * ScreenWidth + ScreenHeight * ScreenHeight);

  if (TOSVersion.Check(5) or (TJBuild_VERSION.JavaClass.SDK_INT >= MinWatchAPILevel)) and
    TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_WATCH) then
    FDeviceClass := TDeviceInfo.TDeviceClass.Watch
  else if GetModel.StartsWith('Glass') then
    FDeviceClass := TDeviceInfo.TDeviceClass.Glasses
  else if (ScreenDiagonal <= MaxPhoneDiagonalSize) and SuppportsTelephony then
    FDeviceClass := TDeviceInfo.TDeviceClass.Phone
  else
    FDeviceClass := TDeviceInfo.TDeviceClass.Tablet;

  FDeviceClassCached := True;
  Result := FDeviceClass;
end;

function TAndroidDeviceServices.GetFeatures: TDeviceFeatures;
begin
  Result := [TDeviceFeature.HasTouchScreen];
end;

function TAndroidDeviceServices.GetModel: string;
begin
  Result := JStringToString(TJBuild.JavaClass.MODEL);
end;

procedure TAndroidDeviceServices.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXDeviceService) then
    TPlatformServices.Current.AddPlatformService(IFMXDeviceService, Self);
end;

function TAndroidDeviceServices.SuppportsTelephony: Boolean;
var
  TelephonyServiceNative: JObject;
  TelephoneManager: JTelephonyManager;
begin
  TelephonyServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if TelephonyServiceNative <> nil then
  begin
    TelephoneManager := TJTelephonyManager.Wrap(TelephonyServiceNative);
    Result := TelephoneManager.getPhoneType <> TJTelephonyManager.JavaClass.PHONE_TYPE_NONE;
  end
  else
    Result := False;
end;

procedure TAndroidDeviceServices.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXDeviceService);
end;

end.
