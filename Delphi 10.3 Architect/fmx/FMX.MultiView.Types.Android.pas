{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiView.Types.Android;

interface

uses
  System.UITypes, System.Classes, System.Types, Androidapi.JNI.GraphicsContentViewText, FMX.Controls.Model, 
  FMX.Controls.Presentation, FMX.Presentation.Messages, FMX.MultiView.Types, FMX.Presentation.Android;

type

{ TAndroidTouchInterceptingLayout }

  /// <summary>Native android presentation for <c>TTouchInterceptingLayout</c></summary>
  TAndroidTouchInterceptingLayout = class(TAndroidNativeView)
  private
    FPressedInDefinedArea: Boolean;
    procedure UpdateShadowColor;
    function GetModel: TTouchInterceptingLayoutModel;
    function CheckPointOwnership(const ALocalPoint: TPointF): Boolean;
  protected
    { Messages from Model }
    procedure MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>); message MM_COLOR_CHANGED;
    procedure MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_ENABLED_SHADOW_CHANGED;
    { Messages From Controller }
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    procedure PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>); message PM_SET_ABSOLUTE_OPACITY;
    procedure PMPointInObject(var AMessage: TDispatchMessageWithValue<TPointInObjectLocalInfo>); message PM_POINT_IN_OBJECT_LOCAL;
    { Model }
    function DefineModelClass: TDataModelClass; override;
    { Hit Test}
    function PointInside(const AScreenPoint: TPointF; const AEvent: JMotionEvent): Boolean; override;
    function ProcessTouch(view: JView; event: JMotionEvent): Boolean; override;
  public
    property Model: TTouchInterceptingLayoutModel read GetModel;
    property PressedInDefinedArea: Boolean read FPressedInDefinedArea;
  end;

implementation

uses
  System.SysUtils, AndroidApi.Helpers, FMX.Presentation.Factory, FMX.Controls, FMX.Types;

{ TAndroidTouchInterceptingLayout }

function TAndroidTouchInterceptingLayout.CheckPointOwnership(const ALocalPoint: TPointF): Boolean;
begin
  case Model.Mode of
    TOverlayMode.LeftSide:
      Result := ALocalPoint.X <= Model.InterceptionSize;
    TOverlayMode.RightSide:
      Result := Size.Width - Model.InterceptionSize <= ALocalPoint.X;
    TOverlayMode.TopSide:
      Result := ALocalPoint.Y <= Model.InterceptionSize;
    TOverlayMode.BottomSide:
      Result := Size.Height - Model.InterceptionSize <= ALocalPoint.Y;
  else
    Result := True;
  end;
end;

function TAndroidTouchInterceptingLayout.DefineModelClass: TDataModelClass;
begin
  Result := TTouchInterceptingLayoutModel;
end;

function TAndroidTouchInterceptingLayout.GetModel: TTouchInterceptingLayoutModel;
begin
  Result := inherited GetModel<TTouchInterceptingLayoutModel>;
end;

procedure TAndroidTouchInterceptingLayout.MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>);
begin
  UpdateShadowColor;
end;

procedure TAndroidTouchInterceptingLayout.MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateShadowColor;
end;

procedure TAndroidTouchInterceptingLayout.PMInit(var AMessage: TDispatchMessage);
begin
  UpdateShadowColor;
end;

procedure TAndroidTouchInterceptingLayout.PMPointInObject(var AMessage: TDispatchMessageWithValue<TPointInObjectLocalInfo>);
begin
  if not FPressedInDefinedArea then
    AMessage.Value.Result := CheckPointOwnership(AMessage.Value.Point);
end;

procedure TAndroidTouchInterceptingLayout.PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>);
begin
  View.setAlpha(Control.AbsoluteOpacity);
end;

function TAndroidTouchInterceptingLayout.PointInside(const AScreenPoint: TPointF; const AEvent: JMotionEvent): Boolean;
var
  LocalTouchPoint: TPointF;
begin
  if Assigned(Model.OnPointInObjectEvent) then
    Result := Model.OnPointInObjectEvent(Control, AScreenPoint.X, AScreenPoint.Y)
  else
    Result := True;

  // if we decline a processing touches (return False in ProcessTouches), Android View doesn't transfer event to
  // parent view. But we need to continue process touches in MultiView. So if user make touch in defined region
  // we ignore next touches events until he releases finger
  if not FPressedInDefinedArea then
  begin
    LocalTouchPoint := Form.ScreenToClient(AScreenPoint);
    Result := Result and CheckPointOwnership(LocalTouchPoint);
  end;
end;

function TAndroidTouchInterceptingLayout.ProcessTouch(view: JView; event: JMotionEvent): Boolean;
var
  TouchPoint: TPointF;
begin
  Result := inherited;
  TouchPoint := TPointF.Create(event.getRawX / ScreenScale, event.getRawY / ScreenScale);
  TouchPoint := Form.ScreenToClient(TouchPoint);

  if (event.getAction = TJMotionEvent.JavaClass.ACTION_DOWN) and PointInside(TouchPoint, event) then
    FPressedInDefinedArea := True
  else if (event.getAction = TJMotionEvent.JavaClass.ACTION_CANCEL) or
          (event.getAction = TJMotionEvent.JavaClass.ACTION_UP) then
    FPressedInDefinedArea := False;
end;

procedure TAndroidTouchInterceptingLayout.UpdateShadowColor;
var
  BackgroundColor: Integer;
begin
  if Model.EnabledShadow then
    BackgroundColor := TAndroidHelper.AlphaColorToJColor(Model.ShadowColor)
  else
    BackgroundColor := TJColor.JavaClass.TRANSPARENT;

  View.setBackgroundColor(BackgroundColor);
end;

initialization
  TPresentationProxyFactory.Current.Register(TTouchInterceptingLayout, TControlType.Platform, TAndroidPresentationProxy<TAndroidTouchInterceptingLayout>);
finalization
  TPresentationProxyFactory.Current.Unregister(TTouchInterceptingLayout, TControlType.Platform, TAndroidPresentationProxy<TAndroidTouchInterceptingLayout>);
end.
