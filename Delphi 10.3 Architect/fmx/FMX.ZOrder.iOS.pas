{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.ZOrder.iOS;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, iOSapi.UIKit, iOSApi.CoreGraphics, FMX.Controls, FMX.Forms, FMX.ZOrder;

type

  /// <summary>Helper class used to manage platform controls</summary>
  TiOSZOrderManager = class(TCustomZOrderManager<UIView>)
  private
    function AbsoluteToParentView(const AControl: TControl; const AParentView: UIView): CGRect;
  protected
    function GetParentView(const AView: UIView): UIView; override;
    procedure RemoveFromParent(const AChildView: UIView); override;
    procedure InsertSubview(const AParent, AChildView, APreviousSiblingView: UIView); override;
    function IndexOfView(const AView: UIView): Integer; override;
    procedure UpdateVisible(const AView: UIView; const AVisible: Boolean); override;
    procedure UpdateBounds(const AView: UIView; const AControl: TControl; const AParentView: UIView); override;
    function GetFormView(const AForm: TCommonCustomForm): UIView; override;
    function SameView(const AViewLeft, AViewRight: UIView): Boolean; override;
    function NullView: UIView; override;
  end;

implementation

uses
  Macapi.Helpers, Macapi.ObjectiveC, iOSapi.Foundation, FMX.Platform.iOS;

function TiOSZOrderManager.AbsoluteToParentView(const AControl: TControl; const AParentView: UIView): CGRect;
var
  Bounds: TRectF;
  Form: TCommonCustomForm;
begin
  if FindForm(AControl, Form) then
  begin
    Bounds := AControl.AbsoluteRect;
    Result := AParentView.convertRect(CGRectFromRect(Bounds), GetFormView(Form))
  end
  else
    Result := CGRectFromRect(TRectF.Empty);
end;

function TiOSZOrderManager.SameView(const AViewLeft, AViewRight: UIView): Boolean;
begin
  Result := NSObjectToID(AViewLeft) = NSObjectToID(AViewRight);
end;

function TiOSZOrderManager.GetFormView(const AForm: TCommonCustomForm): UIView;
var
  FormHandle: TiOSWindowHandle;
begin
  FormHandle := WindowHandleToPlatform(AForm.Handle);
  Result := FormHandle.View;
end;

function TiOSZOrderManager.GetParentView(const AView: UIView): UIView;
begin
  if AView.superview <> nil then
    Result := TUIView.Wrap(AView.superview)
  else
    Result := nil;
end;

function TiOSZOrderManager.IndexOfView(const AView: UIView): Integer;
var
  Parent: UIView;
begin
  Parent := GetParentView(AView);
  if Parent <> nil then
    Result := Parent.subviews.indexOfObject(NSObjectToID(AView))
  else
    Result := -1;
end;

procedure TiOSZOrderManager.InsertSubview(const AParent, AChildView, APreviousSiblingView: UIView);
var
  PreviousSiblingViewIndex: Integer;
begin
  if APreviousSiblingView = nil then
    AParent.insertSubview(AChildView, 0)
  else
  begin
    PreviousSiblingViewIndex := IndexOfView(APreviousSiblingView);
    AParent.insertSubview(AChildView, PreviousSiblingViewIndex + 1);
  end;
end;

function TiOSZOrderManager.NullView: UIView;
begin
  Result := nil;
end;

procedure TiOSZOrderManager.RemoveFromParent(const AChildView: UIView);
begin
  AChildView.removeFromSuperview;
end;

procedure TiOSZOrderManager.UpdateBounds(const AView: UIView; const AControl: TControl; const AParentView: UIView);
begin
  AView.setFrame(AbsoluteToParentView(AControl, AParentView));
end;

procedure TiOSZOrderManager.UpdateVisible(const AView: UIView; const AVisible: Boolean);
begin
  AView.setHidden(not AVisible);
end;

end.
