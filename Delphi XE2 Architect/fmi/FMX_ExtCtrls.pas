{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_ExtCtrls;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes, Masks,
  FMX_Types, FMX_Objects, FMX_Ani, FMX_Layouts, FMX_Platform,
  FMX_Controls, FMX_ListBox, FMX_Memo, FMX_Edit, FMX_Menus;

{$SCOPEDENUMS ON}

type

{ TCustomCornerButton }

  TCustomCornerButton = class(TCustomButton)
  private
    FYRadius: Single;
    FXRadius: Single;
    FCorners: TCorners;
    FCornerType: TCornerType;
    FSides: TSides;
    function IsCornersStored: Boolean;
    procedure SetXRadius(const Value: Single);
    procedure SetYRadius(const Value: Single);
    procedure SetCorners(const Value: TCorners);
    procedure SetCornerType(const Value: TCornerType);
    procedure SetSides(const Value: TSides);
    function IsSidesStored: Boolean;
  protected
    procedure ApplyStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property XRadius: Single read FXRadius write SetXRadius;
    property YRadius: Single read FYRadius write SetYRadius;
    property Corners: TCorners read FCorners write SetCorners stored IsCornersStored;
    property CornerType: TCornerType read FCornerType write SetCornerType default TCornerType.ctRound;
    property Sides: TSides read FSides write SetSides stored IsSidesStored;
  end;

{ TCornerButton }

  TCornerButton = class(TCustomCornerButton)
  published
    property XRadius;
    property YRadius;
    property Corners;
    property CornerType;
    property Sides;
  end;

{ TDropTarget }

  TDropTarget = class(TTextControl)
  private
    FOnDrop: TDragDropEvent;
    FFilter: WideString;
    FFilterIndex: Integer;
    function GetFilterIndex: Integer;
  protected
    function CurrentFilter: WideString;
    procedure DragOver(const Data: TDragObject; const Point: TPointF;
      var Accept: Boolean); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Filter: WideString read FFilter write FFilter;
    property FilterIndex: Integer read GetFilterIndex write FFilterIndex default 1;
    property Font;
    property Text;
    property TextAlign default TTextAlign.taCenter;
    property OnDropped: TDragDropEvent read FOnDrop write FOnDrop;
  end;

{ TPlotGrid }

  TPlotGrid = class(TControl)
  private
    FMarks: Single;
    FFrequency: Single;
    FLineFill: TBrush;
    procedure SetFrequency(const Value: Single);
    procedure SetMarks(const Value: Single);
    procedure SetLineFill(const Value: TBrush);
    procedure LineFillChanged(Sender: TObject);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property LineFill: TBrush read FLineFill write SetLineFill;
    property Marks: Single read FMarks write SetMarks;
    property Frequency: Single read FFrequency write SetFrequency;
  end;

{ TImageViewer }

  TImageViewer = class(TScrollBox)
  private
    FBack: TRectangle;
    FImage: TImage;
    FScale: Single;
    FMouseScaling: Boolean;
    FShowBackground: Boolean;
    function GetBitmap: TBitmap;
    procedure SetBitmap(const Value: TBitmap);
    procedure SetScale(const Value: Single);
    function GetBackgroundFill: TBrush;
    procedure SetBackgroundFill(const Value: TBrush);
    procedure SetShowBackground(const Value: Boolean);
  protected
    function GetContentBounds: TRectF; override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer;
      var Handled: Boolean); override;
    procedure DoBitmapChange(Sender: TObject);
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    function GetDefaultStyleLookupName: WideString; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BestFit;
  published
    property BackgroundFill: TBrush read GetBackgroundFill write SetBackgroundFill;
    property Bitmap: TBitmap read GetBitmap write SetBitmap;
    property BitmapScale: Single read FScale write SetScale;
    property ShowBackground: Boolean read FShowBackground write SetShowBackground default False;
    property MouseScaling: Boolean read FMouseScaling write FMouseScaling default True;
    property MouseTracking default False;
  end;

type

{ TCalendar }

  TCalendar = class(TStyledControl)
  private
    FDateTime: TDateTime;
    FDays: TListBox;
    FToday, FPrev, FNext: TButton;
    FMonths: TPopupBox;
    FYears: TPopupBox;
    FWeeks: TGridLayout;
    FFirstDayOfWeek: TCalDayOfWeek;
    FFirstDayOfWeekNum: Integer;
    FWeek: TGridLayout;
    FTodayDefault: Boolean;
    FOnChange: TNotifyEvent;
    FWeekNumbers: Boolean;
    FOnDayChange: TNotifyEvent;
    function GetDate: TDate;
    procedure SetDate(Value: TDate);
    procedure SetDateTime(const Value: TDateTime);
    procedure SetFirstDayOfWeek(const Value: TCalDayOfWeek);
    procedure SetTodayDefault(const Value: Boolean);
    procedure SetWeekNumbers(const Value: Boolean);
  protected
    FDisableDayChange: Integer;
    procedure DoPrevClick(Sender: TObject);
    procedure DoNextClick(Sender: TObject);
    procedure DoTodayClick(Sender: TObject);
    procedure DoDayChange(Sender: TObject);
    procedure DoMonthChange(Sender: TObject);
    procedure DoYearChange(Sender: TObject);
    procedure FillList;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Realign; override;
    property DateTime: TDateTime read FDateTime write SetDateTime;
  published
    property BindingSource;
    property ClipChildren default True;
    property Date: TDate read GetDate write SetDate;
    property FirstDayOfWeek: TCalDayOfWeek read FFirstDayOfWeek
      write SetFirstDayOfWeek default TCalDayOfWeek.dowLocaleDefault;
    property TodayDefault: Boolean read FTodayDefault write SetTodayDefault default False;
    property WeekNumbers: Boolean read FWeekNumbers write SetWeekNumbers default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDayChange: TNotifyEvent read FOnDayChange write FOnDayChange;
  end;

{ TCalendarBox }

  TCalendarBox = class(TTextControl)
  private
    FPopup: TPopup;
    FCalendar: TCalendar;
    FPlacement: TPlacement;
    function GetDate: TDate;
    procedure SetDate(const Value: TDate);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoClosePopup(Sender: TObject);
    procedure DoCalendarChanged(Sender: TObject);
    procedure DoDayChanged(Sender: TObject);
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure ApplyStyle; override;
    function GetDefaultStyleLookupName: WideString; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown;
    property Calendar: TCalendar read FCalendar;
  published
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Cursor default crDefault;
    property Date: TDate read GetDate write SetDate;
    property TextAlign default TTextAlign.taLeading;
  end;

{ TCalendarEdit }

  TCalendarEdit = class(TComboEditBase)
  private
    FPopup: TPopup;
    FCalendar: TCalendar;
    FPlacement: TPlacement;
    function GetDate: TDate;
    procedure SetDate(const Value: TDate);
  protected
    procedure SetText(const AValue: WideString); override;
    procedure DoClosePopup(Sender: TObject);
    procedure DoCalendarChanged(Sender: TObject);
    procedure DoDayChanged(Sender: TObject);
    procedure Change; override;
    function GetDefaultStyleLookupName: WideString; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown; override;
    property Calendar: TCalendar read FCalendar;
  published
    property Cursor default crDefault;
    property Date: TDate read GetDate write SetDate;
    property Text stored False;
  end;

implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  SysUtils, Variants;

{ TCustomCornerButton }

constructor TCustomCornerButton.Create(AOwner: TComponent);
begin
  inherited;
  FCorners := AllCorners;
  FXRadius := 3;
  FYRadius := 3;
  FSides := AllSides;
end;

destructor TCustomCornerButton.Destroy;
begin
  inherited;
end;

procedure TCustomCornerButton.ApplyStyle;
var
  Background: TFmxObject;
begin
  inherited;
  Background := FindStyleResource('Background');
  if (Background <> nil) and (Background is TRectangle) then
  begin
    TRectangle(Background).CornerType := FCornerType;
    TRectangle(Background).Corners := FCorners;
    TRectangle(Background).XRadius := XRadius;
    TRectangle(Background).YRadius := YRadius;
    TRectangle(Background).Sides := FSides;
  end;
  Background := FindStyleResource('SecondBackground');
  if (Background <> nil) and (Background is TRectangle) then
  begin
    TRectangle(Background).CornerType := FCornerType;
    TRectangle(Background).Corners := FCorners;
    TRectangle(Background).XRadius := XRadius;
    TRectangle(Background).YRadius := YRadius;
    TRectangle(Background).Sides := FSides;
  end;
end;

function TCustomCornerButton.IsCornersStored: Boolean;
begin
  Result := FCorners <> AllCorners;
end;

function TCustomCornerButton.IsSidesStored: Boolean;
begin
  Result := FSides * AllSides <> [];
end;

procedure TCustomCornerButton.SetCorners(const Value: TCorners);
begin
  if FCorners <> Value then
  begin
    FCorners := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetCornerType(const Value: TCornerType);
begin
  if FCornerType <> Value then
  begin
    FCornerType := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetXRadius(const Value: Single);
begin
  if FXRadius <> Value then
  begin
    FXRadius := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetYRadius(const Value: Single);
begin
  if FYRadius <> Value then
  begin
    FYRadius := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetSides(const Value: TSides);
begin
  if FSides <> Value then
  begin
    FSides := Value;
    ApplyStyle;
  end;
end;

{ TDropTarget }

constructor TDropTarget.Create(AOwner: TComponent);
begin
  inherited;
  FFilterIndex := 1;
  TextAlign := TTextAlign.taCenter;
  EnableDragHighlight := False;
  Width := 120;
  Height := 120;
  SetAcceptsControls(False);
end;

function TDropTarget.CurrentFilter: WideString;
var
  S: WideString;
  I, Cur, Idx: Integer;
begin
  Result := '';
  if Pos('|', FFilter) > 0 then
  begin
    Cur := 1;
    Idx := 1;
    S := FFilter;
    I := Pos('|', S);
    while I > 0 do
    begin
      Delete(S, 1, Pos('|', S));
      I := Pos('|', S);
      if Odd(Cur) and (Idx = FFilterIndex) then
      begin
        if Pos('|', S) > 0 then
          Result := Copy(S, 1, Pos('|', S) - 1)
        else
          Result := S;
        Break;
      end;
      if Odd(Cur) then
        Inc(Idx);
      Inc(Cur);
    end;
  end
  else
    Result := FFilter;
end;

procedure TDropTarget.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  inherited;
  if Assigned(FOnDrop) then
    FOnDrop(Self, Data, Point);
end;

procedure TDropTarget.DragOver(const Data: TDragObject; const Point: TPointF;
  var Accept: Boolean);
var
  Masks, M: AnsiString;
  HasFiles: Boolean;
  HasFilter: Boolean;
  HasMatchedFile: Boolean;
  I: Integer;
begin
  inherited;

  // determine if the user is dragging one or more files and
  // if there is any filter set
  HasFiles := Length(Data.Files) > 0;
  Masks := CurrentFilter;
  HasFilter := Masks <> '';

  // the Accept value is overriden by the filter only if there is at least one file
  // in the Data drag object; when a filter exists, there must be at least
  // one file that matches the filter in order for Accept to have set by the user;
  // if there is no file matching the filter, Accept is false
  if HasFiles and HasFilter then
  begin
    HasMatchedFile := False;
    M := GetToken(Masks, ';');
    while (M <> '') and (not HasMatchedFile) do
    begin
      for I := 0 to High(Data.Files) do
      begin
        HasMatchedFile := MatchesMask(Data.Files[I], M);

        // there is at least one file matching the filter
        if HasMatchedFile then
          Break;
      end;
      M := GetToken(Masks, ';');
    end;

    Accept := HasMatchedFile;
  end;
end;

function TDropTarget.GetFilterIndex: Integer;
begin
  Result := FFilterIndex;
end;

{ Graph objects }

{ TPlotGrid }

constructor TPlotGrid.Create(AOwner: TComponent);
begin
  inherited;
  FLineFill := TBrush.Create(TBrushKind.bkSolid, $FF505050);
  FLineFill.OnChanged := LineFillChanged;
  FMarks := 25;
  FFrequency := 5;
  SetAcceptsControls(False);
end;

destructor TPlotGrid.Destroy;
begin
  FLineFill.Free;
  inherited;
end;

procedure TPlotGrid.LineFillChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TPlotGrid.Paint;
var
  X, Y: Single;
begin
  X := 0;
  Y := 0;
  Canvas.Stroke.Assign(FLineFill);
  while X < Width / 2 do
  begin
    if (X = 0) then
    begin
      Canvas.StrokeThickness := 2;
      Canvas.Stroke.Color := FLineFill.Color
    end
    else
    begin
      if (frac(X) = 0) and (frac(X / Frequency / Marks) = 0) then
        Canvas.Stroke.Color := FLineFill.Color
      else
        Canvas.Stroke.Color := MakeColor(FLineFill.Color, 0.4);
      Canvas.StrokeThickness := 1;
    end;

    Canvas.DrawLine(PointF(round(Width / 2) + X + (Canvas.StrokeThickness / 2), 0),
      PointF(round(Width / 2) + X + (Canvas.StrokeThickness / 2), Height), AbsoluteOpacity);
    if X <> 0 then
      Canvas.DrawLine(PointF(round(Width / 2) - X + (Canvas.StrokeThickness / 2),
        0), PointF(round(Width / 2) - X + (Canvas.StrokeThickness / 2), Height),
        AbsoluteOpacity);
    X := X + FFrequency;
  end;
  while Y < Height / 2 do
  begin
    if (Y = 0) then
    begin
      Canvas.StrokeThickness := 2;
      Canvas.Stroke.Color := FLineFill.Color
    end
    else
    begin
      if (frac(Y) = 0) and (frac(Y / Frequency / Marks) = 0) then
        Canvas.Stroke.Color := FLineFill.Color
      else
        Canvas.Stroke.Color := MakeColor(FLineFill.Color, 0.4);
      Canvas.StrokeThickness := 1;
    end;

    Canvas.DrawLine(PointF(0, round(Height / 2) + Y + (Canvas.StrokeThickness /
      2)), PointF(Width, round(Height / 2) + Y + (Canvas.StrokeThickness / 2)),
      AbsoluteOpacity);
    if Y <> 0 then
      Canvas.DrawLine(PointF(0, round(Height / 2) - Y + (Canvas.StrokeThickness /
        2)), PointF(Width, round(Height / 2) - Y + (Canvas.StrokeThickness / 2)),
        AbsoluteOpacity);
    Y := Y + FFrequency;
  end;
end;

procedure TPlotGrid.SetFrequency(const Value: Single);
begin
  if FFrequency <> Value then
  begin
    FFrequency := Value;
    if FFrequency < 0.05 then
      FFrequency := 0.05;
    Repaint;
  end;
end;

procedure TPlotGrid.SetLineFill(const Value: TBrush);
begin
  FLineFill.Assign(Value);
end;

procedure TPlotGrid.SetMarks(const Value: Single);
begin
  if FMarks <> Value then
  begin
    FMarks := Value;
    if FMarks < FFrequency then
      FMarks := FFrequency;
    if FMarks < 0.05 then
      FMarks := 0.05;
    Repaint;
  end;
end;

{ TImageViewer }

constructor TImageViewer.Create(AOwner: TComponent);
begin
  inherited;
  MouseTracking := True;
  MouseScaling := True;
  Cursor := crHandPoint;
  FScale := 1;
  FBack := TRectangle.Create(Self);
  FBack.HitTest := False;
  FBack.Parent := Self;
  FBack.Locked := True;
  FBack.Stroke.Kind := TBrushKind.bkNone;
  FBack.Stored := False;
  FBack.Visible := False;
  FImage := TImage.Create(Self);
  FImage.HitTest := False;
  FImage.Parent := Self;
  FImage.Locked := True;
  FImage.Stored := False;
  FImage.WrapMode := TImageWrapMode.iwStretch;
  FImage.Bitmap.OnChange := DoBitmapChange;
  SetAcceptsControls(False);
end;

destructor TImageViewer.Destroy;
begin
  inherited;
end;

function TImageViewer.GetBitmap: FMX_Types.TBitmap;
begin
  Result := FImage.Bitmap;
end;

function TImageViewer.GetContentBounds: TRectF;
begin
  FImage.BoundsRect := RectF(0, 0, Bitmap.Width * BitmapScale,
    Bitmap.Height * BitmapScale);

  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    if FImage.Width < ContentLayout.Width then
      FImage.Position.X := round((ContentLayout.Width - FImage.Width) / 2);
    if FImage.Height < ContentLayout.Height then
      FImage.Position.Y := round((ContentLayout.Height - FImage.Height) / 2);
  end;
  FBack.SetBounds(FImage.Position.X, FImage.Position.Y, FImage.Width,
    FImage.Height);

{$IFNDEF FPC}
  Result := Types.UnionRect(RectF(0, 0, 0, 0), FImage.ParentedRect);
{$ELSE}
  Result := UnionRect(RectF(0, 0, 0, 0), FImage.ParentedRect);
{$ENDIF}
end;

procedure TImageViewer.MouseWheel(Shift: TShiftState; WheelDelta: Integer;
  var Handled: Boolean);
begin
  if MouseScaling then
  begin
    BitmapScale := BitmapScale + (WheelDelta / 120) * 0.04;
    Handled := True;
  end;
  inherited;
end;

procedure TImageViewer.BestFit;
var
  R: TRectF;
  s: Single;
  NeedRealign: Boolean;
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    NeedRealign := False;
    if (VScrollBar <> nil) and (VScrollBar.Enabled) then
      NeedRealign := True;
    if (VScrollBar <> nil) and (VScrollBar.Enabled) then
      NeedRealign := True;
    R := RectF(0, 0, Bitmap.Width, Bitmap.Height);
    s := FitRect(R, ContentLayout.LocalRect);
    if s >= 1 then
      BitmapScale := 1 / s
    else
      BitmapScale := 1;
    if NeedRealign then
    begin
      R := RectF(0, 0, Bitmap.Width, Bitmap.Height);
      s := FitRect(R, ContentLayout.LocalRect);
      if s >= 1 then
        BitmapScale := 1 / s
      else
        BitmapScale := 1;
    end;
  end
end;

procedure TImageViewer.SetBitmap(const Value: FMX_Types.TBitmap);
begin
  FImage.Bitmap := Value;
end;

procedure TImageViewer.SetScale(const Value: Single);
begin
  if FScale <> Value then
  begin
    FScale := Value;
    if FScale < 0.01 then
      FScale := 0.01;
    if FScale > 10 then
      FScale := 10;
    Realign;
    Center;
  end;
end;

function TImageViewer.GetBackgroundFill: TBrush;
begin
  Result := FBack.Fill;
end;

procedure TImageViewer.SetBackgroundFill(const Value: TBrush);
begin
  FBack.Fill := Value;
end;

procedure TImageViewer.DoBitmapChange(Sender: TObject);
begin
  Realign;
end;

procedure TImageViewer.SetShowBackground(const Value: Boolean);
begin
  if FShowBackground <> Value then
  begin
    FShowBackground := Value;
    FBack.Visible := FShowBackground;
  end;
end;

function TImageViewer.GetData: Variant;
begin
  Result := ObjectToVariant(Bitmap);
end;

function TImageViewer.GetDefaultStyleLookupName: WideString;
begin
  Result := 'framedscrollboxstyle';
end;

procedure TImageViewer.SetData(const Value: Variant);
begin
  if VarIsNull(Value) then
    Bitmap.SetSize(1, 1)
  else if VarIsObject(Value) then
  begin
    if VariantToObject(Value) is TPersistent then
      Bitmap.Assign(TPersistent(VariantToObject(Value)));
  end
  else
    Bitmap.LoadFromFile(Value)
end;

{ TCalendar }

constructor TCalendar.Create(AOwner: TComponent);
var
  i: Integer;
  L: TControl;
  AYear, AMonth, ADay: Word;
begin
  inherited;
  SetAcceptsControls(False);
  ClipChildren := True;
  FDateTime := Now;
  DecodeDate(FDateTime, AYear, AMonth, ADay);
  FFirstDayOfWeek := TCalDayOfWeek.dowLocaleDefault;
  Width := 180;
  Height := 160;
  L := TLayout.Create(Self);
  with L do
  begin
    Parent := Self;
    Locked := True;
    Stored := False;
    Height := 19;
    Align := TAlignLayout.alMostTop;
    Padding.Bottom := 2;
    FPrev := TButton.Create(Self);
    with FPrev do
    begin
      Parent := L;
      Width := 19;
      Locked := True;
      Stored := False;
      Align := TAlignLayout.alLeft;
      Padding.Right := 2;
      StyleLookup := 'transparentcirclebuttonstyle';
      OnClick := DoPrevClick;
      RepeatClick := True;
      with TPathLabel.Create(Self) do
      begin
        Parent := FPrev;
        Width := 5;
        Height := 5;
        Align := TAlignLayout.alCenter;
        HitTest := False;
        Stored := False;
        Locked := True;
        Data.Data := 'M 1,0 L 1,1 L 0,0.500 L 1,0 Z';
        StyleLookup := 'calendarlabelstyle';
      end;
    end;
    FToday := TButton.Create(Self);
    with FToday do
    begin
      Parent := L;
      Width := 19;
      Locked := True;
      Stored := False;
      Align := TAlignLayout.alLeft;
      Position.X := 30;
      Padding.Right := 2;
      StyleLookup := 'transparentcirclebuttonstyle';
      OnClick := DoTodayClick;
      RepeatClick := True;
      with TPathLabel.Create(Self) do
      begin
        StyleLookup := 'calendarlabelstyle';
        Parent := FToday;
        Width := 5;
        Height := 5;
        Align := TAlignLayout.alCenter;
        HitTest := False;
        Stored := False;
        Locked := True;
        Data.Data := 'M 229.78724,375.76646 112.76595,263.0005 225.53191,145.97921 342.5532,258.74517 z';
      end;
    end;
    FNext := TButton.Create(Self);
    with FNext do
    begin
      Parent := L;
      Width := 19;
      Locked := True;
      Stored := False;
      Position.X := 50;
      Align := TAlignLayout.alLeft;
      Padding.Right := 2;
      StyleLookup := 'transparentcirclebuttonstyle';
      RepeatClick := True;
      OnClick := DoNextClick;
      with TPathLabel.Create(Self) do
      begin
        StyleLookup := 'calendarlabelstyle';
        Parent := FNext;
        Width := 5;
        Height := 5;
        Align := TAlignLayout.alCenter;
        HitTest := False;
        Stored := False;
        Locked := True;
        Data.Data := 'M 0,0 L 0,1 L 1,0.500 Z';
      end;
    end;
    FMonths := TPopupBox.Create(Self);
    with FMonths do
    begin
      Parent := L;
      Align := TAlignLayout.alClient;
      Locked := True;
      Stored := False;
      DisableFocusEffect := True;
      Padding.Left := 5;
      Padding.Right := 5;
      StyleLookup := 'calendarlabelstyle';
      for i := 1 to 12 do
        Items.Add(FormatSettings.LongMonthNames[i]);
      Font.Style := [TFontStyle.fsBold];
      TextAlign := TTextAlign.taTrailing;
      ItemIndex := AMonth - 1;
      OnChange := DoMonthChange;
    end;
    FYears := TPopupBox.Create(Self);
    with FYears do
    begin
      Parent := L;
      Width := 40;
      Align := TAlignLayout.alRight;
      Locked := True;
      Stored := False;
      DisableFocusEffect := True;
      StyleLookup := 'calendarlabelstyle';
      for i := 1 to 10 do
        Items.Add(IntToStr(AYear - i));
      Items.Add(IntToStr(AYear));
      for i := 1 to 10 do
        Items.Add(IntToStr(AYear + i));
      Font.Style := [TFontStyle.fsBold];
      TextAlign := TTextAlign.taLeading;
      ItemIndex := 10;
      OnChange := DoYearChange;
    end;
  end;
  FWeek := TGridLayout.Create(Self);
  with FWeek do
  begin
    Parent := Self;
    Locked := True;
    Stored := False;
    Height := 19;
    Position.Y := 20;
    ItemHeight := 19;
    Align := TAlignLayout.alTop;
    Padding.Bottom := 2;
    for i := 0 to 6 do
      with TLabel.Create(Self) do
      begin
        Parent := FWeek;
        Locked := True;
        Stored := False;
        TextAlign := TTextAlign.taCenter;
        WordWrap := False;
      end;
    ItemWidth := Width / 7;
  end;
  FWeeks := TGridLayout.Create(Self);
  with FWeeks do
  begin
    Parent := Self;
    Locked := True;
    Stored := False;
    Width := 23;
    Align := TAlignLayout.alMostLeft;
    Padding.Top := 19 + 2;
    ItemHeight := 19;
    ItemWidth := Width;
    Visible := False;
    for i := 0 to 5 do
      with TLabel.Create(Self) do
      begin
        Parent := FWeeks;
        Locked := True;
        Stored := False;
        TextAlign := TTextAlign.taCenter;
        WordWrap := False;
      end;
  end;
  FDays := TListBox.Create(Self);
  with FDays do
  begin
    Parent := Self;
    Locked := True;
    Stored := False;
    Position.Y := 50;
    Height := 19 * 6;
    Align := TAlignLayout.alTop;
    Columns := 7;
    ItemHeight := 19;
    AlternatingRowBackground := True;
    HideSelectionUnfocused := False;
    ShowScrollBars := False;
    OnChange := DoDayChange;
    StyleLookup := 'transparentlistboxstyle';
    for i := 1 to 6 * 7 do
      with TListBoxItem.Create(Self) do
      begin
        Parent := FDays;
        Locked := True;
        Stored := False;
        TextAlign := TTextAlign.taTrailing;
        WordWrap := False;
      end;
  end;
  FillList;
end;

function WeekOfYear(aDate: TDateTime): byte;
var
  t, m, year: Word;
  newyear: TDateTime;
  KW: Word;
  wtag_ny: Word;
begin
  DecodeDate(aDate, year, m, t); // calc year
  newyear := EncodeDate(year, 1, 1); // calc 1.1.year
  wtag_ny := ord(DayofWeek(newyear)); // DOW of 1.1.year
  KW := Trunc(((aDate - newyear + ((wtag_ny + 1) Mod 7) - 3) / 7) + 1);
  if (KW = 0) then
  begin
    KW := 0;
  end;
  Result := KW;
end;

procedure TCalendar.FillList;
var
  i: Integer;
  AYear, PreMonth, AMonth, ADay: Word;
  Date: TDate;
  First, Last: Integer;
  A: WideString;
  Item: TListBoxItem;
begin
  FDisableDayChange := FDisableDayChange + 1;
  try
    { first day }
    if FFirstDayOfWeek = TCalDayOfWeek.dowLocaleDefault then
    begin
      A:= Platform.GetLocaleFirstDayOfWeek;
      FFirstDayOfWeekNum := ord(A[1]) - ord('0');
      {$IFDEF MACOS}
      FFirstDayOfWeekNum:= ord(A[1]) + ord('0');
      {$ENDIF}
    end
    else
      FFirstDayOfWeekNum := ord(FFirstDayOfWeek);
    FFirstDayOfWeekNum := (8 + FFirstDayOfWeekNum) mod 7;
    { week days }
    for i := 0 to 6 do
      TLabel(FWeek.Children[i]).Text := FormatSettings.ShortDayNames
        [1 + ((7 + i + FFirstDayOfWeekNum) mod 7)];
    { days }
    DecodeDate(FDateTime, AYear, AMonth, ADay);
    PreMonth := AMonth - 1;
    if PreMonth < 1 then
      PreMonth := 12;
    Date := EncodeDate(AYear, AMonth, 1);
    First := DayofWeek(Date);
    if First - FFirstDayOfWeekNum < 3 then
      First := First + 7;
    if FDays.Count - (First + MonthDays[IsLeapYear(AYear), AMonth] -
      FFirstDayOfWeekNum) < 3 then
      First := First - 7;
    FDays.Tag := First; // store first
    Date := IncMonth(Date, 1);
    Last := DayofWeek(Date);
    for i := 1 to First do
    begin
      Item := FDays.ListItems[i - 1];
      if Item = nil then
        Continue;
      Item.Opacity := 0.3;
      Item.Text := IntToStr(MonthDays[IsLeapYear(AYear), PreMonth] - First + i +
        1 + FFirstDayOfWeekNum);
    end;
    for i := 1 to MonthDays[IsLeapYear(AYear), AMonth] do
    begin
      Item := FDays.ListItems[First + i - 2 - FFirstDayOfWeekNum];
      if Item = nil then
        Continue;
      Item.Opacity := 1;
      Item.Text := IntToStr(i);
    end;
    for i := First + MonthDays[IsLeapYear(AYear), AMonth] to FDays.Count +
      FFirstDayOfWeekNum do
    begin
      Item := FDays.ListItems[i - 1 - FFirstDayOfWeekNum];
      if Item = nil then
        Continue;
      Item.Opacity := 0.3;
      Item.Text := IntToStr(i - First - MonthDays[IsLeapYear(AYear),
        AMonth] + 1);
    end;
    { weeks number }
    if FWeekNumbers then
    begin
      FWeeks.Visible := True;
      DecodeDate(FDateTime, AYear, AMonth, ADay);
      Date := EncodeDate(AYear, AMonth, 1);
      for i := 0 to 5 do
        if WeekOfYear(Date) + i = 0 then
          TLabel(FWeeks.Children[i]).Text := IntToStr(52)
        else if WeekOfYear(Date) = 0 then
          TLabel(FWeeks.Children[i]).Text := IntToStr(i)
        else if WeekOfYear(Date) + i > 52 then
          TLabel(FWeeks.Children[i]).Text := IntToStr(WeekOfYear(Date) + i - 52)
        else
          TLabel(FWeeks.Children[i]).Text := IntToStr(WeekOfYear(Date) + i);
    end
    else
      FWeeks.Visible := False;
    { selection }
    FDays.ItemIndex := First + ADay - 2 - FFirstDayOfWeekNum;
    { month }
    FMonths.ItemIndex := AMonth - 1;
    { years }
    FYears.Items.Clear;
    for i := 10 downto 1 do
      FYears.Items.Add(IntToStr(AYear - i));
    FYears.Items.Add(IntToStr(AYear));
    for i := 1 to 10 do
      FYears.Items.Add(IntToStr(AYear + i));
    FYears.Text := IntToStr(AYear);
  finally
    FDisableDayChange := FDisableDayChange - 1;
  end;
end;

destructor TCalendar.Destroy;
begin
  inherited;
end;

function TCalendar.GetData: Variant;
begin
  Result := VarFromDateTime(FDateTime);
end;

procedure TCalendar.SetData(const Value: Variant);
var
  D: TDateTime;
begin
  if VarIsType(Value, varDate) then
    Date := VarToDateTime(Value)
  else if VarIsStr(Value) and TryStrToDateTime(AnsiString(Value), D) then
    Date := D;
end;

procedure TCalendar.DoDayChange(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(FDateTime, AYear, AMonth, ADay);
  if FDays.ItemIndex - FDays.Tag + 2 + FFirstDayOfWeekNum < 1 then
  begin
  end
  else if FDays.ItemIndex - FDays.Tag + 2 + FFirstDayOfWeekNum >
    MonthDays[IsLeapYear(AYear), AMonth] then
  begin
  end
  else
    DateTime := EncodeDate(AYear, AMonth, FDays.ItemIndex - FDays.Tag + 2 +
      FFirstDayOfWeekNum);
  if Assigned(FOnDayChange) and (FDisableDayChange = 0) then
    FOnDayChange(Self);
end;

procedure TCalendar.DoTodayClick(Sender: TObject);
begin
  Date := Now;
  if Assigned(FOnDayChange) and (FDisableDayChange = 0) then
    FOnDayChange(Self);
end;

procedure TCalendar.DoNextClick(Sender: TObject);
begin
  Date := IncMonth(Date, 1);
end;

procedure TCalendar.DoPrevClick(Sender: TObject);
begin
  Date := IncMonth(Date, -1);
end;

procedure TCalendar.DoMonthChange(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(FDateTime, AYear, AMonth, ADay);
  DateTime := EncodeDate(AYear, FMonths.ItemIndex + 1, ADay);
end;

procedure TCalendar.DoYearChange(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(FDateTime, AYear, AMonth, ADay);
  DateTime := EncodeDate(StrToInt(FYears.Text), AMonth, ADay);
end;

procedure TCalendar.Realign;
begin
  inherited;
  if FWeek <> nil then
    FWeek.ItemWidth := FWeek.Width / 7 - 0.1;
end;

function TCalendar.GetDate: TDate;
begin
  Result := TDate(FDateTime);
end;

procedure TCalendar.SetDate(Value: TDate);
begin
  FDisableDayChange := FDisableDayChange + 1;
  ReplaceTime(TDateTime(Value), FDateTime);
  try
    SetDateTime(Value);
  except
    SetDateTime(FDateTime);
    raise;
  end;
  FDisableDayChange := FDisableDayChange - 1;
end;

procedure TCalendar.SetDateTime(const Value: TDateTime);
begin
  if FDateTime <> Value then
  begin
    FDateTime := Value;
    FillList;
    if Assigned(FBindingObjects) then
      ToBindingObjects;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCalendar.SetFirstDayOfWeek(const Value: TCalDayOfWeek);
begin
  if FFirstDayOfWeek <> Value then
  begin
    FFirstDayOfWeek := Value;
    FillList;
  end;
end;

procedure TCalendar.SetTodayDefault(const Value: Boolean);
begin
  FTodayDefault := Value;
  if FTodayDefault then
    Date := Now;
end;

procedure TCalendar.SetWeekNumbers(const Value: Boolean);
begin
  if FWeekNumbers <> Value then
  begin
    FWeekNumbers := Value;
    FillList;
  end;
end;

procedure TCalendar.MouseWheel(Shift: TShiftState; WheelDelta: Integer;
  var Handled: Boolean);
begin
  inherited;
  if not Handled then
  begin
    if WheelDelta > 0 then
      Date := IncMonth(Date, -1)
    else
      Date := IncMonth(Date, 1);
    Handled := True;
  end;
end;

{ TCalendarBox }

constructor TCalendarBox.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  Cursor := crDefault;
  TextAlign := TTextAlign.taLeading;
  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle';
  FPopup.PlacementTarget := Self;
  FPopup.StaysOpen := False;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.DesignVisible := False;
  FPopup.OnClosePopup := DoClosePopup;
  FPopup.Width := 186;
  FPopup.Height := 166;
  FCalendar := TCalendar.Create(Self);
  FCalendar.Parent := FPopup;
  FCalendar.Stored := False;
  FCalendar.Padding.Rect := RectF(3, 3, 3, 3);
  FCalendar.Align := TAlignLayout.alClient;
  FCalendar.OnChange := DoCalendarChanged;
  FCalendar.OnDayChange := DoDayChanged;
  Text := DateTimeToStr(FCalendar.DateTime);
  Width := 100;
  Height := 22;
  SetAcceptsControls(False);
end;

destructor TCalendarBox.Destroy;
begin
  inherited;
end;

procedure TCalendarBox.DoCalendarChanged(Sender: TObject);
begin
  Text := DateTimeToStr(FCalendar.DateTime);
end;

procedure TCalendarBox.DoDayChanged(Sender: TObject);
begin
  if FPopup.IsOpen then
    DropDown;
end;

procedure TCalendarBox.DoClosePopup(Sender: TObject);
begin
end;

procedure TCalendarBox.DropDown;
begin
  if not FPopup.IsOpen then
  begin
    FPopup.Placement := FPlacement;
    FPopup.IsOpen := True;
  end
  else
  begin
    FPopup.IsOpen := False;
  end;
end;

function TCalendarBox.GetDate: TDate;
begin
  Result := FCalendar.Date;
end;

function TCalendarBox.GetDefaultStyleLookupName: WideString;
begin
  Result := 'comboeditstyle';
end;

procedure TCalendarBox.SetDate(const Value: TDate);
begin
  FCalendar.Date := Value;
  Text := DateTimeToStr(FCalendar.DateTime);
end;

procedure TCalendarBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) then
  begin
    DropDown;
  end;
end;

procedure TCalendarBox.DoContentPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  Canvas.Font.Assign(Font);
  Canvas.Fill.Assign(FontFill);
  Canvas.FillText(ARect, Text, False, AbsoluteOpacity, FillTextFlags, TextAlign,
    TTextAlign.taCenter);
end;

procedure TCalendarBox.ApplyStyle;
var
  t: TFmxObject;
begin
  inherited;
  t := FindStyleResource('Content');
  if (t <> nil) and (t is TContent) then
  begin
    TContent(t).OnPaint := DoContentPaint;
  end;
end;

{ TCalendarEdit }

procedure TCalendarEdit.Change;
var
  TempDate: TDateTime;
begin
  inherited;
  if TryStrToDateTime(Text, TempDate, FormatSettings) then
    FCalendar.Date := StrToDateTime(Text)
  else
    Text := DateTimeToStr(FCalendar.Date);
  RepaintEdit;
end;

constructor TCalendarEdit.Create(AOwner: TComponent);
begin
  inherited;
  Cursor := crDefault;
  FFilterChar := '0123456789./';
  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle';
  FPopup.PlacementTarget := Self;
  FPopup.StaysOpen := False;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.DesignVisible := False; //RAID 287355
  FPopup.OnClosePopup := DoClosePopup;
  FPopup.Width := 186;
  FPopup.Height := 166;
  FCalendar := TCalendar.Create(Self);
  FCalendar.Parent := FPopup;
  FCalendar.Stored := False;
  FCalendar.Padding.Rect := RectF(3, 3, 3, 3);
  FCalendar.Align := TAlignLayout.alClient;
  FCalendar.OnChange := DoCalendarChanged;
  FCalendar.OnDayChange := DoDayChanged;
  Text := DateTimeToStr(FCalendar.DateTime);
  KeyboardType := TVirtualKeyboardType.vktNumbersAndPunctuation;
end;

destructor TCalendarEdit.Destroy;
begin
  FCaret := nil;
  inherited;
end;

procedure TCalendarEdit.DoCalendarChanged(Sender: TObject);
var
  LText: WideString;
begin
  if FPopup.IsOpen then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if not TLinkObservers.EditLinkEdit(Observers) then
      begin
        DropDown;
        Exit;
      end
  end;

  LText := Text;
  Text := DateTimeToStr(FCalendar.DateTime);
  CaretPosition := Length(Text);
  Change;
  FNeedChange := False;

  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if (LText <> Text) and TLinkObservers.EditLinkIsEditing(Observers) then
      TLinkObservers.EditLinkModified(Observers);
end;

procedure TCalendarEdit.DoDayChanged(Sender: TObject);
begin
  if FPopup.IsOpen then
    DropDown;
end;

procedure TCalendarEdit.DoClosePopup(Sender: TObject);
begin
  if Assigned(FCaret) and ShowCaret and IsFocused then
    ShowCaretProc;
end;

procedure TCalendarEdit.DropDown;
begin
  if not FPopup.IsOpen then
  begin
    if ShowCaret then
      HideCaret;
    FPopup.Placement := FPlacement;
    FPopup.IsOpen := True;
  end
  else
  begin
    FPopup.IsOpen := False;
  end;
end;

function TCalendarEdit.GetDate: TDate;
begin
  Result := FCalendar.Date;
end;

function TCalendarEdit.GetDefaultStyleLookupName: WideString;
begin
  Result := 'comboeditstyle';
end;

procedure TCalendarEdit.SetDate(const Value: TDate);
begin
  if FCalendar.Date <> Value then
  begin
    FCalendar.Date := Value;
    Text := DateTimeToStr(Value);
  end;
end;

procedure TCalendarEdit.SetText(const AValue: WideString);
var
  TempDate: TDateTime;
begin
  inherited;
  if TryStrToDateTime(AValue, TempDate, FormatSettings) then
    if StrToDateTime(AValue) <> FCalendar.Date  then
      Change;
end;

initialization
  RegisterFmxClasses([TCalendar, TDropTarget, TImageViewer, TPlotGrid,
    TCalendarBox, TCalendarEdit]);
end.
