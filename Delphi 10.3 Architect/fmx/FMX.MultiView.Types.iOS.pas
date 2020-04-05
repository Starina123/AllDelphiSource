{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiView.Types.iOS;

interface

uses
  System.TypInfo, System.UITypes, System.Types, iOSapi.Foundation, iOSApi.CoreGraphics, iOSApi.UIKit,
  FMX.Controls.Presentation, FMX.Presentation.iOS, FMX.Presentation.Messages, FMX.MultiView.Types, FMX.Controls.Model;

type

{ TiOSTouchInterceptingLayout }

  IFMXTouchInterceptingLayout = interface(UIView)
  ['{50546536-EE2A-42C5-9852-0A9483ADA45C}']
    { Touches }
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesCancelled(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesMoved(touches: NSSet; withEvent: UIEvent); cdecl;
    function pointInside(point: CGPoint; withEvent: UIEvent): Boolean; cdecl;
  end;

  /// <summary>Native presentation for <c>TTouchInterceptingLayout</c></summary>
  TiOSTouchInterceptingLayout = class(TiOSNativeView)
  private
    FShadowView: UIView;
    procedure UpdateShadowColor;
    function GetModel: TTouchInterceptingLayoutModel;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function DefineModelClass: TDataModelClass; override;
  protected
    { Messages from Model }
    procedure MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>); message MM_COLOR_CHANGED;
    procedure MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_ENABLED_SHADOW_CHANGED;
    { Messages From Controller }
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    procedure PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>); message PM_SET_ABSOLUTE_OPACITY;
    procedure PMGetRecommendSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_GET_RECOMMEND_SIZE;
  public
    constructor Create; override;
    destructor Destroy; override;
    function pointInside(point: CGPoint; withEvent: UIEvent): Boolean; override; cdecl;
    property Model: TTouchInterceptingLayoutModel read GetModel;
    property ShadowView: UIView read FShadowView write FShadowView;
  end;

implementation

uses
  System.SysUtils, Macapi.ObjCRuntime, FMX.Types, FMX.Controls, FMX.Presentation.Factory, FMX.Helpers.iOS, FMX.Consts;

{ TiOSTouchInterceptingLayout }

constructor TiOSTouchInterceptingLayout.Create;
begin
  inherited;
  FShadowView := TUIView.Create;
  FShadowView.setFrame(CGRectMake(0, 0, View.frame.size.width, View.frame.size.height));
  FShadowView.setUserInteractionEnabled(False);
  FShadowView.setAutoresizingMask(UIViewAutoresizingFlexibleWidth or UIViewAutoresizingFlexibleHeight);
  View.addSubview(FShadowView);
  View.setExclusiveTouch(False);
end;

function TiOSTouchInterceptingLayout.DefineModelClass: TDataModelClass;
begin
  Result := TTouchInterceptingLayoutModel;
end;

destructor TiOSTouchInterceptingLayout.Destroy;
begin
  FShadowView.removeFromSuperView;
  FShadowView.release;
  inherited;
end;

function TiOSTouchInterceptingLayout.GetModel: TTouchInterceptingLayoutModel;
begin
  Result := inherited GetModel<TTouchInterceptingLayoutModel>;
end;

function TiOSTouchInterceptingLayout.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IFMXTouchInterceptingLayout);
end;

procedure TiOSTouchInterceptingLayout.PMGetRecommendSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
end;

procedure TiOSTouchInterceptingLayout.PMInit(var AMessage: TDispatchMessage);
begin
  inherited;
  UpdateShadowColor;
end;

procedure TiOSTouchInterceptingLayout.PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>);
begin
  ShadowView.setAlpha(Control.AbsoluteOpacity);
end;

function TiOSTouchInterceptingLayout.pointInside(point: CGPoint; withEvent: UIEvent): Boolean;
begin
  Result := True;
  if Assigned(Model.OnPointInObjectEvent) then
    Result := Model.OnPointInObjectEvent(Control, point.X, point.Y);

  case Model.Mode of
    TOverlayMode.LeftSide:
      Result := Result and (point.X <= Model.InterceptionSize);
    TOverlayMode.RightSide:
      Result := Result and (Size.Width - Model.InterceptionSize <= point.X);
    TOverlayMode.TopSide:
      Result := Result and (point.Y <= Model.InterceptionSize);
    TOverlayMode.BottomSide:
      Result := Result and (Size.Height - Model.InterceptionSize <= point.Y);
  end;
end;

procedure TiOSTouchInterceptingLayout.UpdateShadowColor;
begin
  if Model.EnabledShadow then
    ShadowView.setBackgroundColor(AlphaColorToUIColor(Model.ShadowColor))
  else
    ShadowView.setBackgroundColor(nil);
end;

procedure TiOSTouchInterceptingLayout.MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>);
begin
  UpdateShadowColor;
end;

procedure TiOSTouchInterceptingLayout.MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateShadowColor;
end;

initialization
  TPresentationProxyFactory.Current.Register(TTouchInterceptingLayout, TControlType.Platform, TiOSPresentationProxy<TiOSTouchInterceptingLayout>);
finalization
  TPresentationProxyFactory.Current.Unregister(TTouchInterceptingLayout, TControlType.Platform, TiOSPresentationProxy<TiOSTouchInterceptingLayout>);
end.
