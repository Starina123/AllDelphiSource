{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Switch.Android;

interface

uses
  System.Types, AndroidApi.JNIBridge, Androidapi.JNI.Widget, Androidapi.JNI.GraphicsContentViewText,
  FMX.Controls.Model, FMX.Controls.Presentation, FMX.Presentation.Android, FMX.Presentation.Messages, FMX.StdCtrls;

type

{ TAndroidNativeSwitch }

  TAndroidNativeSwitchListener = class;

  TAndroidNativeSwitch = class(TAndroidNativeView)
  private
    FListener: TAndroidNativeSwitchListener;
    function GetView: JSwitch;
    function GetModel: TSwitchModel;
    procedure UpdateChecked;
  protected
    { Messages from PresentationProxy }
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    { Messages from model }
    procedure MMValueChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_VALUE_CHANGED;
  protected
    function DefineModelClass: TDataModelClass; override;
    function CreateView: JView; override;
    function ProcessTouch(view: JView; event: JMotionEvent): Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    property Model: TSwitchModel read GetModel;
    property View: JSwitch read GetView;
  end;

  TAndroidNativeSwitchListener = class(TJavaLocal, JCompoundButton_OnCheckedChangeListener)
  private
    [Weak] FSwitch: TAndroidNativeSwitch;
  public
    constructor Create(const ASwitch: TAndroidNativeSwitch);
    { JCompoundButton_OnCheckedChangeListener }
    procedure onCheckedChanged(buttonView: JCompoundButton; isChecked: Boolean); cdecl;
  end;

implementation

uses
  System.SysUtils, Androidapi.Helpers, Androidapi.JNI.App, FMX.Controls, FMX.Consts, FMX.Presentation.Factory,
  FMX.Helpers.Android;

{ TAndroidNativeSwitch }

constructor TAndroidNativeSwitch.Create;
begin
  inherited;
  FListener := TAndroidNativeSwitchListener.Create(Self);
  View.setOnCheckedChangeListener(FListener);
  View.setShowText(False);
end;

function TAndroidNativeSwitch.CreateView: JView;
begin
  Result := TJSwitch.JavaClass.init(TAndroidHelper.Context);
end;

function TAndroidNativeSwitch.DefineModelClass: TDataModelClass;
begin
  Result := TSwitchModel;
end;

destructor TAndroidNativeSwitch.Destroy;
begin
  View.setOnCheckedChangeListener(nil);
  FreeAndNil(FListener);
  inherited;
end;

function TAndroidNativeSwitch.GetModel: TSwitchModel;
begin
  Result := inherited GetModel<TSwitchModel>;
end;

function TAndroidNativeSwitch.GetView: JSwitch;
begin
  Result := inherited GetView<JSwitch>;
end;

procedure TAndroidNativeSwitch.MMValueChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateChecked;
end;

procedure TAndroidNativeSwitch.PMInit(var AMessage: TDispatchMessage);
begin
  inherited;
  UpdateChecked;
end;

function TAndroidNativeSwitch.ProcessTouch(view: JView; event: JMotionEvent): Boolean;
begin
  inherited;
  // Switch has its own touch handlers. So if we return true, switch will not receive touches.
  Result := False;
end;

procedure TAndroidNativeSwitch.UpdateChecked;
begin
  View.setChecked(Model.Value);
end;

{ TAndroidNativeSwtichListener }

constructor TAndroidNativeSwitchListener.Create(const ASwitch: TAndroidNativeSwitch);
begin
  inherited Create;
  FSwitch := ASwitch;
  if ASwitch = nil then
    raise Exception.CreateFmt(SWrongParameter, ['ASwitch']);
end;

procedure TAndroidNativeSwitchListener.onCheckedChanged(buttonView: JCompoundButton; isChecked: Boolean);
begin
  FSwitch.Model.DisableNotify;
  try
    FSwitch.Model.Value := isChecked;
  finally
    FSwitch.Model.EnableNotify;
  end;

  if Assigned(FSwitch.Model.OnSwitch) then
    FSwitch.Model.OnSwitch(FSwitch.Control);
end;

initialization
  TPresentationProxyFactory.Current.Register(TSwitch, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeSwitch>);
finalization
  TPresentationProxyFactory.Current.Unregister(TSwitch, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeSwitch>);
end.

