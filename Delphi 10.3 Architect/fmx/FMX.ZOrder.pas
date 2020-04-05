{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.ZOrder;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.SysUtils, System.Generics.Collections, FMX.Controls, FMX.Forms, FMX.Types;

type

  /// <summary>Helper class used to manage platform controls.</summary>
  TCustomZOrderManager<T> = class abstract
  private type
    TViewInfo = record
      View: T;
      ChildrenView: T;
      constructor Create(const AView: T; const AChildrenView: T);
    end;
  strict private
    FLinks: TDictionary<TControl, TViewInfo>;
    [Weak] FOwner: TWindowHandle;
    function HasParent(const AView: T): Boolean;
    function FindChildrenViewForControl(const AControl: TControl; out AView: T): Boolean;
    function CanBeVisibleOnScreen(const AControl: TControl): Boolean;
  protected
    /// <summary>Finds root form for control.</summary>
    function FindForm(const AControl: TControl; out AForm: TCommonCustomForm): Boolean;
    /// <summary>Defines if specified <c>AControl</c> has native platform control or not.</summary>
    function HasParentView(const AControl: TControl): Boolean; overload;
    /// <summary>Checks is control is a platform control and if <c>AControl</c> is native control, then return native
    /// base in AView.</summary>
    function FindView(const AControl: TControl; out AView: T): Boolean;
    /// <summary>Finds special native container for nested native children.</summary>
    function FindChildrenView(const AControl: TControl; out AView: T): Boolean;
    /// <summary>Finds first previous platform view in the same superview.</summary>
    function FindPreviousSiblingView(const AControl: TControl; out AView: T): Boolean;
    /// <summary>Reorders specified AView.</summary>
    procedure Reorder(const AView, APreviousSiblingView: T);

    /// <summary>Returns native parent view for specified native <c>AView</c>.</summary>
    function GetParentView(const AView: T): T; virtual; abstract;
    /// <summary>Removes <c>AChildView</c> from its parent.</summary>
    procedure RemoveFromParent(const AChildView: T); virtual; abstract;
    /// <summary>Inserts <c>AChildView</c> into native parent <c>AParent</c> after <c>APreviousSiblingChildView</c>.</summary>
    procedure InsertSubview(const AParent, AChildView, APreviousSiblingChildView: T); virtual; abstract;
    /// <summary>Returns the view index among all child views of its parent.</summary>
    function IndexOfView(const AView: T): Integer; virtual; abstract;
    /// <summary>Updates bounds of specified <c>AView</c>.</summary>
    procedure UpdateBounds(const AView: T; const AControl: TControl; const AParentView: T); overload; virtual; abstract;
    /// <summary>Updates visibility of specified <c>AView</c>.</summary>
    procedure UpdateVisible(const AView: T; const AVisible: Boolean); virtual; abstract;
    /// <summary>Returns native form view for specified form <c>AForm</c>.</summary>
    function GetFormView(const AForm: TCommonCustomForm): T; virtual; abstract;
    /// <summary>Checks are specified views <c>AViewLeft</c> and <c>AViewRight</c> the same.</summary>
    function SameView(const AViewLeft, AViewRight: T): Boolean; virtual; abstract;
    /// <summary>Returns null view.</summary>
    function NullView: T; virtual; abstract;
  public
    constructor Create(const AOwner: TWindowHandle);
    destructor Destroy; override;

    { Linking }

    /// <summary>Adds or set new link of TControl and T to manager.</summary>
    procedure AddOrSetLink(const AControl: TControl; const AView, AChildrenView: T);
    /// <summary>Removes link of TControl and T from manager.</summary>
    procedure RemoveLink(const AControl: TControl);
    /// <summary>Removes links for TControl and the children of this object.</summary>
    procedure RemoveLinksForControlTree(const AControl: TControl);

    { Searching }

    /// <summary>Finds first parented platform control</summary>
    function FindParentNativeControl(const AControl: TControl; out AParent: TControl): Boolean;
    /// <summary>Finds first parented T and return true if it exists</summary>
    function FindParentView(const AControl: TControl; out AView: T): Boolean; overload;
    /// <summary>Returns true - if native parent is a form.</summary>
    function IsNativeParentForm(const AControl: TControl): Boolean;

    { Restructuring }

    /// <summary>Fixes z-order for platform control.</summary>
    procedure UpdateOrder(const AControl: TControl);
    /// <summary>Updates platform view coordinates using control coordinates.</summary>
    procedure UpdateBounds(const AControl: TControl); overload;
    /// <summary>Calls of FixOrder and FixBounds.</summary>
    procedure UpdateOrderAndBounds(const AControl: TControl);
    /// <summary>Owner handle.</summary>
    property Owner: TWindowHandle read FOwner;
  end;

implementation

uses System.Math, System.Math.Vectors, FMX.Consts;

function TCustomZOrderManager<T>.CanBeVisibleOnScreen(const AControl: TControl): Boolean;
var
  Size: TSizeF;
begin
  Size := AControl.Size.Size;
  Result := not IsZero(Size.Width) and not IsZero(Size.Height) and AControl.ParentedVisible;
end;

constructor TCustomZOrderManager<T>.Create(const AOwner: TWindowHandle);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TCustomZOrderManager<T>.Destroy;
begin
  FreeAndNil(FLinks);
  inherited;
end;

procedure TCustomZOrderManager<T>.AddOrSetLink(const AControl: TControl; const AView, AChildrenView: T);
begin
  if FLinks = nil then
    FLinks := TDictionary<TControl, TViewInfo>.Create;

  FLinks.AddOrSetValue(AControl, TViewInfo.Create(AView, AChildrenView));
end;

procedure TCustomZOrderManager<T>.RemoveLink(const AControl: TControl);
var
  View: T;
  Rec: TViewInfo;
begin
  if FindView(AControl, View) then
    try
      RemoveFromParent(View);
    finally
      FLinks.Remove(AControl);
    end;
end;

procedure TCustomZOrderManager<T>.RemoveLinksForControlTree(const AControl: TControl);
var
  I: Integer;
begin
  for I := 0 to AControl.ControlsCount - 1 do
    RemoveLinksForControlTree(AControl.Controls[I]);

  RemoveLink(AControl);
end;

function TCustomZOrderManager<T>.FindView(const AControl: TControl; out AView: T): Boolean;
var
  ViewInfo: TViewInfo;
begin
  AView := NullView;
  if FLinks <> nil then
  begin
    Result := FLinks.TryGetValue(AControl, ViewInfo);
    if Result then
      AView := ViewInfo.View;
  end
  else
    Result := False;
end;

function TCustomZOrderManager<T>.HasParent(const AView: T): Boolean;
begin
  Result := not SameView(GetParentView(AView), NullView);
end;

function TCustomZOrderManager<T>.FindParentNativeControl(const AControl: TControl; out AParent: TControl): Boolean;
var
  ParentTmp: TControl;
  View: T;
begin
  AParent := nil;
  ParentTmp := AControl.ParentControl;
  Result := False;
  while not Result and (ParentTmp <> nil) do
  begin
    if FindView(ParentTmp, View) then
      Result := True
    else
      ParentTmp := ParentTmp.ParentControl;
  end;
  if Result then
    AParent := ParentTmp;
end;

function TCustomZOrderManager<T>.FindChildrenView(const AControl: TControl; out AView: T): Boolean;
var
  ViewInfo: TViewInfo;
begin
  AView := NullView;
  if FLinks <> nil then
  begin
    Result := FLinks.TryGetValue(AControl, ViewInfo);
    if Result then
    begin
      if not SameView(ViewInfo.ChildrenView, NullView) then
        AView := ViewInfo.ChildrenView
      else
        AView := ViewInfo.View;
    end;
  end
  else
    Result := False;
end;

function TCustomZOrderManager<T>.FindChildrenViewForControl(const AControl: TControl; out AView: T): Boolean;
var
  I: Integer;
  ChildControl: TControl;
begin
  AView := NullView;
  for I := AControl.ControlsCount - 1 downto 0 do
  begin
    ChildControl := AControl.Controls[I];
    if FindView(ChildControl, AView) or FindChildrenViewForControl(ChildControl, AView) then
      Exit(True);
  end;
  Result := False;
end;

function TCustomZOrderManager<T>.FindForm(const AControl: TControl; out AForm: TCommonCustomForm): Boolean;
begin
  Result := AControl.Root is TCommonCustomForm;
  if Result then
    AForm := TCommonCustomForm(AControl.Root)
  else
    AForm := nil;
end;

function TCustomZOrderManager<T>.HasParentView(const AControl: TControl): Boolean;
var
  View: T;
begin
  Result := FindParentView(AControl, View);
end;

function TCustomZOrderManager<T>.IsNativeParentForm(const AControl: TControl): Boolean;
var
  Parent: TControl;
begin
  Result := FindParentNativeControl(AControl, Parent);
end;

function TCustomZOrderManager<T>.FindParentView(const AControl: TControl; out AView: T): Boolean;
var
  Form: TCommonCustomForm;
  ParentControl: TControl;
begin
  AView := NullView;
  if FindParentNativeControl(AControl, ParentControl) then
    FindChildrenView(ParentControl, AView);

  // if native container was not found, get native container/control from Form
  if SameView(AView, NullView) and FindForm(AControl, Form) then
    AView := GetFormView(Form);

  Result := not SameView(AView, NullView);
end;

function TCustomZOrderManager<T>.FindPreviousSiblingView(const AControl: TControl; out AView: T): Boolean;
var
  I: Integer;
  Parent: TFmxObject;
  ChildControl: TControl;
begin
  AView := NullView;
  Parent := AControl.Parent;
  if Parent <> nil then
    for I := Min(AControl.Index, Parent.ChildrenCount) - 1 downto 0 do
    begin
      // We consider only controls
      if not (Parent.Children[I] is TControl) then
        Continue;

      ChildControl := TControl(Parent.Children[I]);
      if FindView(ChildControl, AView) or FindChildrenViewForControl(ChildControl, AView) then
        Break;
    end;
  Result := not SameView(AView, NullView);
  // If we don't find sibling view among parent's children, we climb higher to look for it in other controls branches.
  if not Result and (AControl.ParentControl <> nil) then
    Result := FindPreviousSiblingView(AControl.ParentControl, AView);
end;

function IsZero(const AValue: Single): Boolean;
begin
  Result := SameValue(AValue, 0, TEpsilon.Position);
end;

procedure TCustomZOrderManager<T>.UpdateBounds(const AControl: TControl);
var
  ParentView, LView: T;
  NewVisible: Boolean;
begin
  if not FindView(AControl, LView) then
    Exit;

  NewVisible := CanBeVisibleOnScreen(AControl);
  if NewVisible and FindParentView(AControl, ParentView) then
    UpdateBounds(LView, AControl, ParentView);
  UpdateVisible(LView, NewVisible);
end;

procedure TCustomZOrderManager<T>.UpdateOrder(const AControl: TControl);
var
  AlreadyHasParent: Boolean;
  OldParent, View, ParentView, PreviousView: T;
begin
  if not FindView(AControl, View) then
    Exit;

  if FindParentView(AControl, ParentView) then
  begin
    OldParent := GetParentView(View);
    AlreadyHasParent := HasParent(View);
    if not SameView(ParentView, OldParent) or not AlreadyHasParent then
    begin
      if AlreadyHasParent then
        RemoveFromParent(View);

      if FindPreviousSiblingView(AControl, PreviousView) then
        InsertSubview(ParentView, View, PreviousView)
      else
        InsertSubview(ParentView, View, NullView);
    end
    else
    begin
      FindPreviousSiblingView(AControl, PreviousView);
      Reorder(View, PreviousView);
    end;
  end
  else
    RemoveFromParent(View);
end;

procedure TCustomZOrderManager<T>.Reorder(const AView, APreviousSiblingView: T);
var
  Parent: T;
  PreviousSiblingViewExists: Boolean;
  PreviousSiblingViewIndex, ViewIndex: Integer;
begin
  Parent := GetParentView(AView);
  if not SameView(Parent, NullView) then
  begin
    ViewIndex := IndexOfView(AView);
    PreviousSiblingViewExists := not SameView(APreviousSiblingView, NullView);
    if not PreviousSiblingViewExists and (ViewIndex <> 0) then
    begin
      RemoveFromParent(AView);
      InsertSubview(Parent, AView, NullView);
    end;
    if PreviousSiblingViewExists then
    begin
      PreviousSiblingViewIndex := IndexOfView(APreviousSiblingView);
      if ViewIndex <> PreviousSiblingViewIndex + 1 then
      begin
        RemoveFromParent(AView);
        InsertSubview(Parent, AView, APreviousSiblingView);
      end;
    end;
  end;
end;

procedure TCustomZOrderManager<T>.UpdateOrderAndBounds(const AControl: TControl);
begin
  UpdateOrder(AControl);
  UpdateBounds(AControl);
end;

{ TCustomZOrderManager<T>.TViewInfo }

constructor TCustomZOrderManager<T>.TViewInfo.Create(const AView, AChildrenView: T);
begin
  View := AView;
  ChildrenView := AChildrenView;
end;

end.
