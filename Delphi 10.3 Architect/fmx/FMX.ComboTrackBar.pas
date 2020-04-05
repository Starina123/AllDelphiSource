{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.ComboTrackBar;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.UITypes, FMX.EditBox, FMX.Controls, FMX.StdActns, FMX.ActnList, FMX.Presentation.Messages,
  FMX.Text, FMX.Controls.Presentation, FMX.Controls.Model, FMX.ComboEdit, FMX.Edit;

const
  MM_DECIMALDIGITS_CHANGED = MM_EDITBOX_USER + 1;
  MM_VALUETYPE_CHANGED = MM_EDITBOX_USER + 2;
  MM_VALUERANGE_CHANGED = MM_EDITBOX_USER + 3;

  PM_DROPDOWN = PM_EDIT_USER + 1;
  PM_CLOSE_DROPDOWN = PM_EDIT_USER + 2;
  PM_COMBOTRACKBAR_USER = PM_EDIT_USER + 5;

type

{ TComboTrackBar }

  TComboTrackBarModel = class(TEditBoxModel)
  public const
    DefaultValueType = TNumValueType.Integer;
    DefaultDecimalDigits = 3;
  private
    FDroppedDown: Boolean;
    FPlacement: TPlacement;
  protected
    procedure DoValueRangeChanged(Sender: TObject);
  public
    constructor Create; override;
    destructor Destroy; override;
    /// <summary>
    ///   Shows that currently drop-down menu is open
    /// </summary>
    property DroppedDown: Boolean read FDroppedDown write FDroppedDown;
    property Placement: TPlacement read FPlacement write FPlacement;
  end;

  TComboTrackBar = class(TCustomEditBox)
  private
    function GetFrequency: Single;
    procedure SetFrequency(const Value: Single);
    function DefStored: Boolean;
    function GetModel: TComboTrackBarModel; overload;
    function GetDroppedDown: Boolean;
    function ValueStored: Boolean;
  protected
    function GetDefaultStyleLookupName: string; override;
  protected
    function DefinePresentationName: string; override;
    function DefineModelClass: TDataModelClass; override;
    property Model: TComboTrackBarModel read GetModel;
  public
    constructor Create(AOwner: TComponent); override;
    /// <summary> This method trying to open the drop-down layout</summary>
    procedure DropDown; virtual;
    /// <summary> This method trying to close the drop-down layout</summary>
    procedure CloseDropDown;
    /// <summary>
    ///   Shows that currently drop-down menu is open
    /// </summary>
    property DroppedDown: Boolean read GetDroppedDown;
    property TextAlign;
    property Font;
  published
    property Action;
    property CanFocus default True;
    property CanParentFocus;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property KeyboardType;
    property ReadOnly;
    property Frequency: Single read GetFrequency write SetFrequency stored ValueStored nodefault;
    property TextSettings;
    property Position;
    property Width;
    property Height;
    property ClipChildren default False;
    property ClipParent default False;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property HitTest default True;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property StyledSettings;
    property StyleLookup;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property TouchTargetExpansion;
    property Visible default True;
    property Caret;
    property KillFocusByReturn;
    property ParentShowHint;
    property ShowHint;
    { events }
    property OnChange;
    property OnChangeTracking;
    property OnTyping;
    property OnApplyStyleLookup;
    { Drag and Drop events }
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    { Keyboard events }
    property OnKeyDown;
    property OnKeyUp;
    { Mouse events }
    property OnCanFocus;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
    property OnPresentationNameChoosing;
  end;

implementation

uses
  System.SysUtils, System.Math, FMX.Types, FMX.ComboTrackBar.Style;

{ TComboTrackBar }

constructor TComboTrackBar.Create(AOwner: TComponent);
begin
  inherited;
  Width := 100;
  Height := 22;
end;

procedure TComboTrackBar.DropDown;
begin
  if HasPresentationProxy then
    PresentationProxy.SendMessage(PM_DROPDOWN);
end;

procedure TComboTrackBar.CloseDropDown;
begin
  if HasPresentationProxy then
    PresentationProxy.SendMessage(PM_CLOSE_DROPDOWN);
end;

function TComboTrackBar.DefineModelClass: TDataModelClass;
begin
  Result := TComboTrackBarModel;
end;

function TComboTrackBar.DefinePresentationName: string;
begin
  Result := 'ComboTrackBar-' + GetPresentationSuffix;
end;

function TComboTrackBar.DefStored: Boolean;
begin
  Result := not (ActionClient and (Action is TCustomValueRangeAction));
end;

function TComboTrackBar.GetDefaultStyleLookupName: string;
begin
  Result := 'comboeditstyle'; // do not localize
end;

function TComboTrackBar.GetFrequency: Single;
begin
  Result := Model.ValueRange.Frequency;
end;

function TComboTrackBar.GetModel: TComboTrackBarModel;
begin
  Result := GetModel<TComboTrackBarModel>;
end;

function TComboTrackBar.GetDroppedDown: Boolean;
begin
  Result := Model.DroppedDown;
end;

procedure TComboTrackBar.SetFrequency(const Value: Single);
begin
  Model.ValueRange.Frequency := Value;
end;


function TComboTrackBar.ValueStored: Boolean;
begin
  Result := DefStored and not SameValue(Value, Model.DefaultValueRange.Value);
end;

{ TComboTrackBarModel }

constructor TComboTrackBarModel.Create;
begin
  inherited;
  DecimalDigits := DefaultDecimalDigits;
  ValueType := DefaultValueType;
  ValueRange.OnChanged := DoValueRangeChanged;
  Text := ConvertValueToText;
end;

destructor TComboTrackBarModel.Destroy;
begin
  inherited;
end;

procedure TComboTrackBarModel.DoValueRangeChanged(Sender: TObject);
begin
  SendMessage(MM_VALUERANGE_CHANGED);
end;

initialization
  RegisterFmxClasses([TComboTrackBar]);
end.
