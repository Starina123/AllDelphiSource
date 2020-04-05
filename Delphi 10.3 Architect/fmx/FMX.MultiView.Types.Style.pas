{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiView.Types.Style;

interface

uses
  System.UITypes, System.Classes, FMX.Types, FMX.Graphics, FMX.Controls.Model, FMX.Controls.Presentation,
  FMX.Presentation.Style, FMX.Presentation.Messages, FMX.MultiView.Types, FMX.Objects;

type

{ TStyledTouchInterceptingLayout }

  /// <summary>Styled presentation for <c>TTouchInterceptingLayout</c> (presentation)</summary>
  TStyledTouchInterceptingLayout = class(TStyledPresentation)
  private
    FShadow: TRectangle;
    function GetModel: TTouchInterceptingLayoutModel;
  protected
    { Messages from Model }
    /// <summary>Notification about changing <c>TTouchInterceptingLayout.Color</c> of shadow</summary>
    procedure MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>); message MM_COLOR_CHANGED;
    /// <summary>Notification about changing <c>TTouchInterceptingLayout.EnabledShadow</c></summary>
    procedure MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_ENABLED_SHADOW_CHANGED;
    { Messages From Controller }
    /// <summary>Notification about initialization of presentation</summary>
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
  public
    constructor Create(AOwner: TComponent); override;
    function PointInObjectLocal(X, Y: Single): Boolean; override;
    /// <summary>Returns model of <c>TTouchInterceptingLayout</c></summary>
    property Model: TTouchInterceptingLayoutModel read GetModel;
  end;

implementation

uses
  FMX.Presentation.Factory, FMX.Controls;

{ TStyledTouchInterceptingLayout }

constructor TStyledTouchInterceptingLayout.Create(AOwner: TComponent);
begin
  inherited;
  FShadow := TRectangle.Create(nil);
  FShadow.Parent := Self;
  FShadow.Stored := False;
  FShadow.Align := TAlignLayout.Contents;
  FShadow.HitTest := False;
  FShadow.Stroke.Kind := TBrushKind.None;
  FShadow.Lock;
  FDesignSelectionMarks := False;
end;

function TStyledTouchInterceptingLayout.GetModel: TTouchInterceptingLayoutModel;
begin
  Result := inherited GetModel<TTouchInterceptingLayoutModel>;
end;

procedure TStyledTouchInterceptingLayout.MMColorChanged(var AMessage: TDispatchMessageWithValue<TAlphaColor>);
begin
  FShadow.Fill.Color := AMessage.Value;
end;

procedure TStyledTouchInterceptingLayout.MMEnabledShadowChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  FShadow.Visible := AMessage.Value;
end;

procedure TStyledTouchInterceptingLayout.PMInit(var AMessage: TDispatchMessage);
begin
  FShadow.Fill.Color := Model.ShadowColor;
  FShadow.Visible := Model.EnabledShadow;
end;

function TStyledTouchInterceptingLayout.PointInObjectLocal(X, Y: Single): Boolean;
begin
  Result := inherited;
  if Assigned(Model.OnPointInObjectEvent) then
    Result := Result and Model.OnPointInObjectEvent(PresentedControl, X, Y);
  case Model.Mode of
    TOverlayMode.LeftSide:
      Result := Result and (X <= Model.InterceptionSize);
    TOverlayMode.RightSide:
      Result := Result and (Width - Model.InterceptionSize <= X);
    TOverlayMode.TopSide:
      Result := Result and (Y <= Model.InterceptionSize);
    TOverlayMode.BottomSide:
      Result := Result and (Height - Model.InterceptionSize <= Y);
    TOverlayMode.None:
      Result := False;
  end;
end;

initialization
  TPresentationProxyFactory.Current.Register(TTouchInterceptingLayout, TControlType.Styled, TStyledPresentationProxy<TStyledTouchInterceptingLayout>);
finalization
  TPresentationProxyFactory.Current.Unregister(TTouchInterceptingLayout, TControlType.Styled, TStyledPresentationProxy<TStyledTouchInterceptingLayout>);
end.
