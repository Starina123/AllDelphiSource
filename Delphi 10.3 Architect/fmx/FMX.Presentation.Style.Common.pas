{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Presentation.Style.Common;

interface

{$SCOPEDENUMS ON}

uses
  System.TypInfo, System.Types, System.Classes, System.SysUtils, System.Rtti, System.UITypes, System.Math,
  System.Generics.Collections, FMX.Types, FMX.Controls, FMX.Controls.Model, FMX.Graphics, FMX.Forms,
  FMX.Controls.Presentation, FMX.Presentation.Messages;

type

  TNativeScene = class;

  /// <summary>Helper class used as root for control's style</summary>
  TNativeStyledControl = class(TStyledControl)
  private
    [Weak] FScene: TNativeScene;
  protected
    procedure AdjustSize; override;
    property Scene: TNativeScene read FScene;
  end;
  TNativeStyledControlClass = class of TNativeStyledControl;

  TUpdateRects = TList<TRectF>;

  /// <summary>Non TControl class that used as container for style to break control parenting</summary>
  TNativeScene = class(TFmxObject, IScene)
  private
    [Weak] FPresentation: TObject;
    FHandle: TWindowHandle;
    FStyledControl: TNativeStyledControl;
    FUpdateRects: TUpdateRects;
    FDisableUpdating: Integer;
    function GetDisableUpdating: Boolean;
    { IScene }
    procedure AddUpdateRect(R: TRectF);
    function GetObject: TFmxObject;
    function GetUpdateRectsCount: Integer;
    function GetUpdateRect(const Index: Integer): TRectF;
    function GetCanvas: TCanvas;
    function GetSceneScale: Single;
    function GetStyleBook: TStyleBook;
    function ObjectAtPoint(P: TPointF): IControl;
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
    procedure SetStyleBook(const Value: TStyleBook);
    procedure ChangeScrollingState(const AControl: TControl; const Active: Boolean);
    procedure DisableUpdating;
    procedure EnableUpdating;
    { Common message handling }
    procedure PMApplyStyleLookup(var AMessage: TDispatchMessage); message PM_APPLY_STYLE_LOOKUP;
    procedure PMNeedStyleLookup(var AMessage: TDispatchMessage); message PM_NEED_STYLE_LOOKUP;
    procedure PMPaintChildren(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_PAINT_CHILDREN;
    procedure PMSetStyleLookup(var AMessage: TDispatchMessageWithValue<string>); message PM_SET_STYLE_LOOKUP;
    procedure PMFindStyleResource(var AMessage: TDispatchMessageWithValue<TFindStyleResourceInfo>); message PM_FIND_STYLE_RESOURCE;
    procedure PMRealign(var AMessage: TDispatchMessage); message PM_REALIGN;
    procedure PMGetRecommendSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_GET_RECOMMEND_SIZE;
    procedure PMObjectAtPoint(var AMessage: TDispatchMessageWithValue<TObjectAtPointInfo>); message PM_OBJECT_AT_POINT;
    procedure PMStartTriggerAnimation(var AMessage: TDispatchMessageWithValue<TTriggerInfo>); message PM_START_TRIGGER_ANIMATION;
    procedure PMApplyTriggerEffect(var AMessage: TDispatchMessageWithValue<TTriggerInfo>); message PM_APPLY_TRIGGER_EFFECT;
    procedure PMGetResourceLink(var AMessage: TDispatchMessageWithValue<TFmxObject>); message PM_GET_RESOURCE_LINK;
    procedure PMGetAdjustSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_GET_ADJUST_SIZE;
    procedure PMSetAdjustSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_SET_ADJUST_SIZE;
    procedure PMGetAdjustType(var AMessage: TDispatchMessageWithValue<TAdjustType>); message PM_GET_ADJUST_TYPE;
    procedure PMSetAdjustType(var AMessage: TDispatchMessageWithValue<TAdjustType>); message PM_SET_ADJUST_TYPE;
    procedure SetCustomSceneAddRect(const Control: TControl);
    procedure PaintPresentedChildren;
  protected
    procedure DoAddUpdateRect(R: TRectF); virtual; abstract;
    function DoGetCanvas: TCanvas; virtual; abstract;
    function DoGetSceneScale: Single; virtual; abstract;
    function DoGetStyleBook: TStyleBook; virtual; abstract;
    procedure DoResized(const NewSize: TSizeF); virtual;
    function DoScreenToLocal(P: TPointF): TPointF; virtual; abstract;
    function DoLocalToScreen(P: TPointF): TPointF; virtual; abstract;
    procedure CustomSceneAddRect(Sender: TControl; ARect: TRectF);
    function GetPresentedControl: TControl; virtual; abstract;
    property IsDisableUpdating: Boolean read GetDisableUpdating;
    /// <summary>Paints children control to the scene</summary>
    procedure PaintControls;
    /// <summary>Link to presentation object</summary>
    property Presentation: TObject read FPresentation;
    /// <summary>Link to OS window handle linked with presentation</summary>
    property Handle: TWindowHandle read FHandle;
    /// <summary>Link to root styled control of the scene</summary>
    property StyledControl: TNativeStyledControl read FStyledControl;
    /// <summary>Link to presented control</summary>
    property PresentedControl: TControl read GetPresentedControl;
    property UpdateRects: TUpdateRects read FUpdateRects;
  public
    constructor Create(const AHandle: TWindowHandle; APresentation: TObject; const ControlClass: TNativeStyledControlClass); reintroduce;
    destructor Destroy; override;
    /// <summary>Resize scene and all linked resources</summary>
    procedure SetSize(const ASize: TSizeF);
  end;

implementation

uses
  System.Math.Vectors, FMX.Ani, FMX.Consts, FMX.Utils;

type

  TOpenControl = class(TControl);
  TOpenStyledControl = class(TStyledControl);

{ TNativeStyledControl }

procedure TNativeStyledControl.AdjustSize;
begin
end;

{ TNativeScene }

constructor TNativeScene.Create(const AHandle: TWindowHandle; APresentation: TObject; const ControlClass: TNativeStyledControlClass);
begin
  inherited Create(nil);
  FUpdateRects := TUpdateRects.Create;
  FPresentation := APresentation;
  FHandle := AHandle;
  FStyledControl := ControlClass.Create(nil);
  FStyledControl.DisableDisappear := True;
  FStyledControl.FScene := Self;
  FStyledControl.SetNewScene(Self);
  FStyledControl.Parent := Self;
  FStyledControl.Lock;
end;

destructor TNativeScene.Destroy;
begin
  FreeAndNil(FStyledControl);
  FreeAndNil(FUpdateRects);
  inherited;
end;

{ IScene }

procedure TNativeScene.EnableUpdating;
begin
  Dec(FDisableUpdating);
  if FDisableUpdating < 0 then
    raise EInvalidSceneUpdatingPairCall.Create(SInvalidSceneUpdatingPairCall);
end;

function TNativeScene.GetCanvas: TCanvas;
begin
  Result := DoGetCanvas;
end;

function TNativeScene.GetDisableUpdating: Boolean;
begin
  Result := FDisableUpdating > 0;
end;

function TNativeScene.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TNativeScene.GetSceneScale: Single;
begin
  Result := DoGetSceneScale;
end;

function TNativeScene.GetStyleBook: TStyleBook;
begin
  Result := DoGetStyleBook;
end;

function TNativeScene.LocalToScreen(P: TPointF): TPointF;
begin
  Result := DoLocalToScreen(P);
end;

function TNativeScene.ScreenToLocal(P: TPointF): TPointF;
begin
  Result := DoScreenToLocal(P);
end;

function TNativeScene.ObjectAtPoint(P: TPointF): IControl;
begin
  Result := FStyledControl.ObjectAtPoint(P);
  if (Result <> nil) and (Result.GetObject = FStyledControl) then
    Result := nil;
end;

procedure TNativeScene.DisableUpdating;
begin
  Inc(FDisableUpdating);
end;

procedure TNativeScene.AddUpdateRect(R: TRectF);
begin
  DoAddUpdateRect(R);
end;

procedure TNativeScene.CustomSceneAddRect(Sender: TControl; ARect: TRectF);
var
  R: TRectF;
begin
  R := ARect;
  R.TopLeft := PresentedControl.AbsoluteToLocal(R.TopLeft);
  R.BottomRight := PresentedControl.AbsoluteToLocal(R.BottomRight);
  AddUpdateRect(R);
end;

procedure TNativeScene.DoResized(const NewSize: TSizeF);
begin
  FStyledControl.SetBounds(0, 0, NewSize.Width, NewSize.Height);
end;

procedure TNativeScene.ChangeScrollingState(const AControl: TControl; const Active: Boolean);
begin
end;

function TNativeScene.GetUpdateRect(const Index: Integer): TRectF;
begin
  Result := FUpdateRects[Index];
end;

function TNativeScene.GetUpdateRectsCount: Integer;
begin
  Result := UpdateRects.Count;
end;

procedure TNativeScene.SetCustomSceneAddRect(const Control: TControl);
var
  Child: TControl;
begin
  Control.CustomSceneAddRect := CustomSceneAddRect;
  for Child in Control.Controls do
    SetCustomSceneAddRect(Child);
end;

procedure TNativeScene.PaintControls;
var
  I: Integer;
  UpdateRect, R: TRectF;
  AllowPaint: Boolean;
  Control: TOpenControl;
begin
  if ChildrenCount > 0 then
    for I := 0 to Children.Count - 1 do
      if (Children[I] is TControl) then
      begin
        Control := TOpenControl(Children[I]);
        if not Control.Visible then
          Continue;
        if Control.Scene = nil then
          Continue;
        if not Control.InPaintTo and Control.UpdateRect.IsEmpty then
          Continue;

        AllowPaint := False;
        if Control.InPaintTo then
          AllowPaint := True;
        if not AllowPaint then
        begin
          R := UnionRect(Control.ChildrenRect, Control.UpdateRect);
          for UpdateRect in UpdateRects do
            if IntersectRect(UpdateRect, R) then
            begin
              AllowPaint := True;
              Break;
            end;
        end;

        if AllowPaint then
          Control.PaintInternal;
      end;

  PaintPresentedChildren;

  UpdateRects.Clear;
end;

procedure TNativeScene.PaintPresentedChildren;
var
  I: Integer;
  UpdateRect, R: TRectF;
  AllowPaint: Boolean;
  Control: TOpenControl;
begin
  if PresentedControl.ChildrenCount > 0 then
  begin
    with PresentedControl.AbsoluteRect do
      GetCanvas.Offset := TPointF.Create(-Left, -Top);
    try
      SetCustomSceneAddRect(PresentedControl);
      PresentedControl.PrepareForPaint;

      TOpenControl(PresentedControl).SetInPaintTo(True);
      try
        TOpenControl(PresentedControl).TempCanvas := GetCanvas;
        try
          for I := 0 to PresentedControl.Children.Count - 1 do
            if PresentedControl.Children[I] is TControl then
            begin
              Control := TOpenControl(PresentedControl.Children[I]);
              if not Control.Visible and (Control.Scene = nil) and (Control.UpdateRect.IsEmpty) then
                Continue;

              AllowPaint := False;

              R := UnionRect(Control.ChildrenRect, Control.UpdateRect);
              R.TopLeft := PresentedControl.AbsoluteToLocal(R.TopLeft);
              R.BottomRight := PresentedControl.AbsoluteToLocal(R.BottomRight);
              for UpdateRect in UpdateRects do
                if IntersectRect(UpdateRect, R) then
                begin
                  AllowPaint := True;
                  Break;
                end;

              if AllowPaint then
              begin
                R := Control.AbsoluteRect;
                R.TopLeft := PresentedControl.AbsoluteToLocal(R.TopLeft);
                R.BottomRight := PresentedControl.AbsoluteToLocal(R.BottomRight);
                Control.PaintInternal;
              end;
            end;
        finally
          TOpenControl(PresentedControl).TempCanvas := nil;
        end;
      finally
        TOpenControl(PresentedControl).SetInPaintTo(False);
      end;
    finally
      GetCanvas.Offset := TPointF.Create(0, 0);
    end;
  end;

  UpdateRects.Clear;
end;

procedure TNativeScene.PMApplyStyleLookup(var AMessage: TDispatchMessage);
begin
  StyledControl.DoApplyStyleLookup;
end;

procedure TNativeScene.PMApplyTriggerEffect(var AMessage: TDispatchMessageWithValue<TTriggerInfo>);
begin
  StyledControl.ApplyTriggerEffect(AMessage.Value.Instance, AMessage.Value.Trigger);
end;

procedure TNativeScene.PMFindStyleResource(var AMessage: TDispatchMessageWithValue<TFindStyleResourceInfo>);
begin
  AMessage.Value.Resource := StyledControl.FindStyleResource(AMessage.Value.ResourceName, AMessage.Value.Clone);
end;

procedure TNativeScene.PMGetAdjustSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  AMessage.Value := StyledControl.AdjustSizeValue;
end;

procedure TNativeScene.PMGetAdjustType(var AMessage: TDispatchMessageWithValue<TAdjustType>);
begin
  AMessage.Value := StyledControl.AdjustType;
end;

procedure TNativeScene.PMGetRecommendSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin

end;

procedure TNativeScene.PMGetResourceLink(var AMessage: TDispatchMessageWithValue<TFmxObject>);
begin
  AMessage.Value := StyledControl.ResourceLink;
end;

procedure TNativeScene.PMNeedStyleLookup(var AMessage: TDispatchMessage);
begin
  StyledControl.NeedStyleLookup;
end;

procedure TNativeScene.PMObjectAtPoint(var AMessage: TDispatchMessageWithValue<TObjectAtPointInfo>);
begin
  AMessage.Value.Control := ObjectAtPoint(AMessage.Value.Point);
end;

procedure TNativeScene.PMPaintChildren(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  AMessage.Value := True;
end;

procedure TNativeScene.PMRealign(var AMessage: TDispatchMessage);
begin
  StyledControl.Realign;
end;

procedure TNativeScene.PMSetAdjustSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  StyledControl.SetAdjustSizeValue(AMessage.Value);
end;

procedure TNativeScene.PMSetAdjustType(var AMessage: TDispatchMessageWithValue<TAdjustType>);
begin
  StyledControl.SetAdjustType(AMessage.Value);
end;

procedure TNativeScene.PMSetStyleLookup(var AMessage: TDispatchMessageWithValue<string>);
begin
  StyledControl.StyleLookup := AMessage.Value;
end;

procedure TNativeScene.PMStartTriggerAnimation(var AMessage: TDispatchMessageWithValue<TTriggerInfo>);
begin
  if AMessage.Value.Wait then
    StyledControl.StartTriggerAnimationWait(AMessage.Value.Instance, AMessage.Value.Trigger)
  else
    StyledControl.StartTriggerAnimation(AMessage.Value.Instance, AMessage.Value.Trigger);
end;

procedure TNativeScene.SetSize(const ASize: TSizeF);
begin
  if not (SameValue(ASize.Width, 0, TEpsilon.Position) or SameValue(ASize.Height, 0, TEpsilon.Position)) then
    DoResized(ASize);
end;

procedure TNativeScene.SetStyleBook(const Value: TStyleBook);
begin
end;

end.
