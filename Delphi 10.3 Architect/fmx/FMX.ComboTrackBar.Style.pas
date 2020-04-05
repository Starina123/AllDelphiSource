{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.ComboTrackBar.Style;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.UITypes, FMX.EditBox.Style, FMX.Controls, FMX.StdCtrls, FMX.ComboTrackBar,
  FMX.Controls.Presentation, FMX.Controls.Model;

type

{ TStyledComboTrackBar }

  TStyledComboTrackBar = class(TStyledEditBox)
  private
    FNeedSetFocusAfterButtonClick: Boolean;
    FArrowButton: TControl;
    FPopup: TPopup;
    FTrackBar: TTrackBar;
    FValueChanged: Boolean;
    FTextUpdating: Boolean;
    function GetModel: TComboTrackBarModel;
    procedure BeforeChangeProc(Sender: TObject);
    procedure AfterChangeProc(Sender: TObject);
    procedure ClosePopupProc(Sender: TObject);
  protected
    { Messages From Model}
    procedure MMValueRangeChanged(var AMessage: TDispatchMessage); message MM_VALUERANGE_CHANGED;
    { Messages From Controller }
    /// <summary>Initializes a presentation</summary>
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    /// <summary>Drop down list</summary>
    procedure PMDropDown(var AMessage: TDispatchMessage); message PM_DROPDOWN;
    /// <summary>Close the drop-down list.</summary>
    procedure PMCloseDropDown(var AMessage: TDispatchMessage); message PM_CLOSE_DROPDOWN;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure Change; override;
    procedure SetText(const AValue: string); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single); virtual;
    { Actions }
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure DoAbsoluteChanged; override;
    procedure DoActionClientChanged; override;
    /// <summary>Defines <c>TComboTrackBar</c> model class</summary>
    function DefineModelClass: TDataModelClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    function CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean;
    procedure DropDown;
    procedure CloseDropDown;
    property Model: TComboTrackBarModel read GetModel;
    property TrackBar: TTrackBar read FTrackBar write FTrackBar;
  end;

implementation

uses
  System.Types, System.SysUtils, System.Math, System.Rtti, FMX.Types, FMX.StdActns, FMX.Presentation.Factory, FMX.Text,
  FMX.Forms, FMX.Presentation.Style, FMX.Platform;

{ TStyledComboTrackBar }

procedure TStyledComboTrackBar.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  inherited;
  if (Sender is TCustomValueRangeAction) and (FTrackBar <> nil) then
    FTrackBar.Action := TCustomValueRangeAction(Action)
  else
    FTrackBar.Action := nil;
end;

procedure TStyledComboTrackBar.AfterChangeProc(Sender: TObject);
begin
  if FValueChanged then
  begin
    Model.DisableNotify;
    try
      Model.ValueRange.Assign(TrackBar.ValueRange);
      if FTextUpdating then
        Change
      else
      begin
        FTextUpdating := True;
        try
          Text := Model.ConvertValueToText;
          Change;
        finally
          FTextUpdating := False;
        end;
        Model.SelStart := 0;
        Model.SelLength := 0;
      end;
    finally
      Model.EnableNotify;
    end;
    FValueChanged := False;
  end;
end;

procedure TStyledComboTrackBar.BeforeChangeProc(Sender: TObject);
var
  Sigma: Single;
begin
  if Sender is TCustomValueRange then
  begin
    Sigma := Power(10, -Model.DecimalDigits) / 2;
    if not SameValue(TCustomValueRange(Sender).New.Value, TCustomValueRange(Sender).Value, Sigma) then
      FValueChanged := True;
  end;
end;

function TStyledComboTrackBar.CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean;
begin
  Result := (AButton = TMouseButton.mbLeft) and not Model.ReadOnly;
end;

procedure TStyledComboTrackBar.Change;
var
  TempValue: Single;
begin
  if not FTextUpdating then
  begin
    FTextUpdating := True;
    try
      if TryTextToValue(Text, TempValue, Model.Value) then
        Model.ValueRange.Value := TempValue
      else
        Text := Model.ConvertValueToText;
    finally
      FTextUpdating := False;
    end;
  end;
  RepaintEdit;
  inherited;
end;

constructor TStyledComboTrackBar.Create(AOwner: TComponent);
const
  PopupPadding: TRectF = (Left: 5; Top: 2; Right: 5; Bottom: 2);
var
  DefaultValueService: IFMXDefaultPropertyValueService;
  NeedSetFocusAfterButtonClick: TValue;
begin
  inherited;
  { Define default behavior for platforms }
  NeedSetFocusAfterButtonClick := TValue.Empty;
  if SupportsPlatformService(IFMXDefaultPropertyValueService, DefaultValueService) then
    NeedSetFocusAfterButtonClick := DefaultValueService.GetDefaultPropertyValue(Self.ClassName, 'NeedSetFocusAfterButtonClick');

  if NeedSetFocusAfterButtonClick.IsEmpty then
    FNeedSetFocusAfterButtonClick := True
  else
    FNeedSetFocusAfterButtonClick := NeedSetFocusAfterButtonClick.AsBoolean;

  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle'; // do not localize
  FPopup.PlacementTarget := Self;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.Padding.Rect := PopupPadding;
  FPopup.OnClosePopup := ClosePopupProc;
  FPopup.DragWithParent := True;
  FTrackBar := TTrackBar.Create(Self);
  FTrackBar.Parent := FPopup;
  FTrackBar.Stored := False;
  FTrackBar.DisableFocusEffect := True;
  FTrackBar.Align := TAlignLayout.VertCenter;
  FTrackBar.ValueRange.BeforeChange := BeforeChangeProc;
  FTrackBar.ValueRange.AfterChange := AfterChangeProc;
end;

function TStyledComboTrackBar.DefineModelClass: TDataModelClass;
begin
  Result := TComboTrackBarModel;
end;

procedure TStyledComboTrackBar.DoAbsoluteChanged;
begin
  inherited;
  if FPopup.IsOpen and (not AbsoluteEnabled or not ParentedVisible or AbsoluteClipRect.IsEmpty) then
    CloseDropDown;
end;

procedure TStyledComboTrackBar.DoActionClientChanged;
begin
  inherited;
  if not Edit.ActionClient and (FTrackBar <> nil) then
    FTrackBar.Action := nil;
end;

procedure TStyledComboTrackBar.ClosePopupProc(Sender: TObject);
begin
  Model.Caret.Visible := Model.InputSupport;
  Edit.SelectAll;
end;

procedure TStyledComboTrackBar.ApplyStyle;
var
  DeviceSrv: IFMXDeviceService;
begin
  inherited;
  if FindStyleResource<TControl>('arrow', FArrowButton) then
  begin
    FArrowButton.HitTest := True;
    FArrowButton.Cursor := crArrow;
    FArrowButton.OnMouseDown := DoComboMouseDown;
    if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
      FArrowButton.TouchTargetExpansion.Rect := TRectF.Create(0, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, 0)
  end;
end;

procedure TStyledComboTrackBar.FreeStyle;
begin
  if FArrowButton <> nil then
    FArrowButton.OnMouseDown := nil;
  FArrowButton := nil;
  inherited;
end;

procedure TStyledComboTrackBar.DoEnter;
begin
  if FPopup.IsOpen then
    CloseDropDown;
  inherited;
end;

procedure TStyledComboTrackBar.DoExit;
begin
  Change; // Text already has the current value

  inherited;

  Model.DisableNotify;
  try
    Model.SelStart := 0;
    Model.SelLength := 0;
  finally
    Model.EnableNotify;
  end;

  CloseDropDown;
end;

procedure TStyledComboTrackBar.DropDown;
const
  MinDropDownWidth = 100;
  PopupHeight = 30;
begin
  if not FPopup.IsOpen then
  begin
    Model.Caret.Visible := False;
    if Pressed or DoubleClick then
      FPopup.PreferedDisplayIndex := Screen.DisplayFromPoint(Screen.MousePos).Index
    else
      FPopup.PreferedDisplayIndex := -1;
    FPopup.Placement := Model.Placement;
    if Width < MinDropDownWidth then
      FPopup.Width := MinDropDownWidth
    else
     FPopup.Width := Width;
    FPopup.Height := PopupHeight;
    FTrackBar.ApplyStyleLookup;
    FTrackBar.Enabled := not Model.ReadOnly;
    FPopup.IsOpen := True;
    Model.DroppedDown := True;
  end
  else
    CloseDropDown;
end;

procedure TStyledComboTrackBar.CloseDropDown;
begin
  if FPopup.IsOpen then
  begin
    FPopup.IsOpen := False;
    Model.DroppedDown := False;
  end;
end;

function TStyledComboTrackBar.GetModel: TComboTrackBarModel;
begin
  Result := inherited GetModel<TComboTrackBarModel>;
end;

procedure TStyledComboTrackBar.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  Delta: Single;
begin
  if Key = vkReturn then
  begin
    Change;
    Text := Model.ConvertValueToText;
    Edit.SelectAll;
    Key := 0;
    Exit;
  end;
  inherited;
  Delta := Model.ValueRange.Frequency;
  if Delta <= 0 then
    Delta := 1;
  FTrackBar.ValueRange.Increment := Delta;
  case Key of
    vkUp: FTrackBar.ValueRange.Inc;
    vkDown: FTrackBar.ValueRange.Dec;
  else
    Exit;
  end;
  Key := 0;
end;

procedure TStyledComboTrackBar.PMInit(var AMessage: TDispatchMessage);
begin
  FTrackBar.ValueRange.Assign(Model.ValueRange);
  SetTextInternal(Model.ConvertValueToText);
end;

procedure TStyledComboTrackBar.PMDropDown(var AMessage: TDispatchMessage);
begin
  DropDown;
end;

procedure TStyledComboTrackBar.PMCloseDropDown(var AMessage: TDispatchMessage);
begin
  CloseDropDown;
end;

procedure TStyledComboTrackBar.MMValueRangeChanged(var AMessage: TDispatchMessage);
begin
  FTrackBar.ValueRange.Assign(Model.ValueRange);
  Model.Change; // This model has as delegate the edit control, so if the track triggers, a model notification is needed
end;

procedure TStyledComboTrackBar.SetText(const AValue: string);
var
  TempValue: Single;
begin
  if AValue <> Text then
  begin
    if not FTextUpdating then
    begin
      FTextUpdating := True;
      try
        if TryTextToValue(AValue, TempValue, Model.Value) then
          Model.ValueRange.Value := TempValue;
        if csDesigning in ComponentState then
          inherited SetText(Model.ConvertValueToText)
        else
          inherited;
        Repaint;
      finally
        FTextUpdating := False;
      end;
    end
    else
      inherited;
  end;
end;

procedure TStyledComboTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  // if control does not support text input, then we must show drop down list,
  // when user clicked on control.
  if not Model.InputSupport then
    DoComboMouseDown(Self, Button, Shift, X, Y);
end;

procedure TStyledComboTrackBar.DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single);
var
  OldPressed: Boolean;
begin
  if CanDropDown(Button, Shift) then
  begin
    if FNeedSetFocusAfterButtonClick then
      SetFocus;
    OldPressed := Pressed;
    try
      Pressed := True;
      DropDown;
    finally
      Pressed := OldPressed;
    end;
  end;
end;


initialization
  TPresentationProxyFactory.Current.Register(TComboTrackBar, TControlType.Styled, TStyledPresentationProxy<TStyledComboTrackBar>);
finalization
  TPresentationProxyFactory.Current.Unregister(TComboTrackBar, TControlType.Styled, TStyledPresentationProxy<TStyledComboTrackBar>);
end.
