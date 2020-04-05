{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Ani;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes, FMX_Types;

type

{ TColorAnimation }

  TColorAnimation = class(TAnimation)
  private
    FStartColor: TAlphaColor;
    FStopColor: TAlphaColor;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property StartValue: TAlphaColor read FStartColor write FStartColor;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
    property StopValue: TAlphaColor read FStopColor write FStopColor;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

{ TGradientAnimation }

  TGradientAnimation = class(TAnimation)
  private
    FStartGradient: TGradient;
    FStopGradient: TGradient;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: Boolean;
    procedure SetStartGradient(const Value: TGradient);
    procedure SetStopGradient(const Value: TGradient);
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property StartValue: TGradient read FStartGradient write SetStartGradient;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
    property StopValue: TGradient read FStopGradient write SetStopGradient;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

{ TFloatAnimation }

  TFloatAnimation = class(TAnimation)
  private
    FStartFloat: Single;
    FStopFloat: Single;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
    procedure Stop; override;
  published
    property StartValue: Single read FStartFloat write FStartFloat stored True;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
    property StopValue: Single read FStopFloat write FStopFloat stored True;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

{ TRectAnimation }

  TRectAnimation = class(TAnimation)
  private
    FStartRect: TBounds;
    FCurrent: TBounds;
    FStopRect: TBounds;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property StartValue: TBounds read FStartRect write FStartRect;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
    property StopValue: TBounds read FStopRect write FStopRect;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

{ TBitmapAnimation }

  TBitmapAnimation = class(TAnimation)
  private
    FPropertyName: AnsiString;
    FInstance: TObject;
    FStartBitmap: TBitmap;
    FStopBitmap: TBitmap;
    FCurrent: TBitmap;
    procedure SetStartBitmap(Value: TBitmap);
    procedure SetStopBitmap(Value: TBitmap);
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property StartValue: TBitmap read FStartBitmap write SetStartBitmap;
    property StopValue: TBitmap read FStopBitmap write SetStopBitmap;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

{ TBitmapListAnimation }

  TBitmapListAnimation = class(TAnimation)
  private
    FPropertyName: AnsiString;
    FInstance: TObject;
    FCurrent: TBitmap;
    FAnimationCount: Integer;
    FAnimationBitmap: TBitmap;
    FLastAnimationStep: Integer;
    procedure SetAnimationBitmap(Value: TBitmap);
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
    property AnimationBitmap: TBitmap read FAnimationBitmap write SetAnimationBitmap;
    property AnimationCount: Integer read FAnimationCount write FAnimationCount;
  end;

{ Key Animations }

{ TKey }

  TKey = class(TCollectionItem)
  private
    FKey: Single;
    procedure SetKey(const Value: Single);
  published
    property Key: Single read FKey write SetKey;
  end;

{ TKeys }

  TKeys = class(TCollection)
  public
    function FindKeys(const Time: Single; var Key1, Key2: TKey): Boolean;
  end;

{ TColorKey }

  TColorKey = class(TKey)
  private
    FValue: TAlphaColor;
  published
    property Value: TAlphaColor read FValue write FValue;
  end;

{ TColorKeyAnimation }

  TColorKeyAnimation = class(TAnimation)
  private
    FPropertyName: AnsiString;
    FInstance: TObject;
    FKeys: TKeys;
    FPath: AnsiString;
    FStartFromCurrent: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
    property Keys: TKeys read FKeys write FKeys;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent;
  end;

{ TFloatKey }

  TFloatKey = class(TKey)
  private
    FValue: Single;
  published
    property Value: Single read FValue write FValue;
  end;

{ TFloatKeyAnimation }

  TFloatKeyAnimation = class(TAnimation)
  private
    FPropertyName: AnsiString;
    FInstance: TObject;
    FKeys: TKeys;
    FPath: AnsiString;
    FStartFromCurrent: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
    property Keys: TKeys read FKeys write FKeys;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent;
  end;

{ Path Animation }

{ TPathAnimation }

  TPathAnimation = class(TAnimation)
  private
    FPath: TPathData;
    FPolygon: TPolygon;
    FObj: TControl;
    FStart: TPointF;
    FRotate: Boolean;
    FSpline: TSpline;
    procedure SetPath(const Value: TPathData);
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property Path: TPathData read FPath write SetPath;
    property Rotate: Boolean read FRotate write FRotate default False;
  end;

implementation

uses
  UIConsts, Math, TypInfo, SysUtils;

{ TAnimation }

constructor TColorAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartColor := $FFFFFFFF;
  FStartColor := $FFFFFFFF;
end;

destructor TColorAnimation.Destroy;
begin
  inherited;
end;

procedure TColorAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    { is string prop }
    if GetPropInfo(FInstance.ClassInfo, FPath,
      [tkString, tkLString, tkWString{$IFDEF FPC},
      tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil
    then
      StartValue := StringToAlphaColor(GetStrProp(FInstance, FPath));
    { is int prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
      StartValue := GetOrdProp(FInstance, FPath);
  end;
  inherited;
end;

procedure TColorAnimation.ProcessAnimation;
begin
  if FInstance <> nil then
  begin
    { is string prop }
    if GetPropInfo(FInstance.ClassInfo, FPath,
      [tkString, tkLString, tkWString{$IFDEF FPC},
      tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil
    then
      SetStrProp(FInstance, FPath, AlphaColorToString(InterpolateColor(FStartColor,
        FStopColor, NormalizedTime)));
    { is int prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
      SetOrdProp(FInstance, FPath, InterpolateColor(FStartColor, FStopColor,
        NormalizedTime));
  end;
end;

{ TAnimation }

constructor TGradientAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartGradient := TGradient.Create;
  FStopGradient := TGradient.Create;
end;

destructor TGradientAnimation.Destroy;
begin
  FStartGradient.Free;
  FStopGradient.Free;
  inherited;
end;

procedure TGradientAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkClass]) <> nil then
    begin
      StartValue := TGradient(GetObjectProp(FInstance, FPath, TGradient));
    end;
  end;
  inherited;
end;

procedure TGradientAnimation.ProcessAnimation;
var
  i: Integer;
  G: TGradient;
begin
  if FInstance <> nil then
  begin
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkClass]) <> nil then
    begin
      with TGradient(GetObjectProp(FInstance, FPath, TGradient)) do
      begin
        for i := 0 to Points.Count - 1 do
        begin
          if (i < FStopGradient.Points.Count) and (i < FStartGradient.Points.Count) then
            Points[i].Color := FMX_Types.InterpolateColor
              (FStartGradient.Points[i].Color, FStopGradient.Points[i].Color,
              NormalizedTime);
        end;
        Change;
      end;
    end;
  end;
end;

procedure TGradientAnimation.SetStartGradient(const Value: TGradient);
begin
  FStartGradient.Assign(Value);
end;

procedure TGradientAnimation.SetStopGradient(const Value: TGradient);
begin
  FStopGradient.Assign(Value);
end;

{ TFloatAnimation }

constructor TFloatAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartFloat := 0;
  FStopFloat := 0;
end;

destructor TFloatAnimation.Destroy;
begin
  inherited;
end;

procedure TFloatAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    { is float prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
    begin
      StartValue := GetFloatProp(FInstance, FPath);
    end;
  end;
  inherited;
end;

procedure TFloatAnimation.Stop;
begin
  inherited;
  FInstance := nil;
end;

procedure TFloatAnimation.ProcessAnimation;
begin
  if FInstance <> nil then
  begin
    { is float prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
    begin
      SetFloatProp(FInstance, FPath, InterpolateSingle(FStartFloat, FStopFloat,
        NormalizedTime));
    end;
  end;
end;

{ TRectAnimation }

constructor TRectAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartRect := TBounds.Create(RectF(0, 0, 0, 0));
  FStopRect := TBounds.Create(RectF(0, 0, 0, 0));
  FCurrent := TBounds.Create(RectF(0, 0, 0, 0));
end;

destructor TRectAnimation.Destroy;
begin
  FCurrent.Free;
  FStartRect.Free;
  FStopRect.Free;
  inherited;
end;

procedure TRectAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
  Value: TObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    { is Rect prop }
    if GetPropInfo(FInstance.ClassInfo, FPropertyName, [tkClass]) <> nil then
    begin
      Value := GetObjectProp(FInstance, FPropertyName);
      if (Value <> nil) and (Value is TPersistent) then
        FStartRect.Assign(TPersistent(Value));
    end;
  end;
  inherited;
end;

procedure TRectAnimation.ProcessAnimation;
var
  Value: TObject;
begin
  if FInstance <> nil then
  begin
    { calc value }
    FCurrent.Left := InterpolateSingle(FStartRect.Left, FStopRect.Left,
      NormalizedTime);
    FCurrent.Top := InterpolateSingle(FStartRect.Top, FStopRect.Top,
      NormalizedTime);
    FCurrent.Right := InterpolateSingle(FStartRect.Right, FStopRect.Right,
      NormalizedTime);
    FCurrent.Bottom := InterpolateSingle(FStartRect.Bottom, FStopRect.Bottom,
      NormalizedTime);

    { is Rect prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkClass]) <> nil then
    begin
      Value := GetObjectProp(FInstance, FPath);
      if (Value <> nil) and (Value is TPersistent) then
        TPersistent(Value).Assign(FCurrent);
    end;
  end;
end;

{ TBitmapAnimation }

constructor TBitmapAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartBitmap := TBitmap.Create(1, 1);
  FStopBitmap := TBitmap.Create(1, 1);
  FCurrent := TBitmap.Create(1, 1);
end;

destructor TBitmapAnimation.Destroy;
begin
  FCurrent.Free;
  FStartBitmap.Free;
  FStopBitmap.Free;
  inherited;
end;

procedure TBitmapAnimation.ProcessAnimation;
var
  Persistent, Path: WideString;
  Value: TObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      Path := FPropertyName;
      while Pos('.', FPropertyName) > 0 do
      begin
        Persistent := GetToken(FPropertyName, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent);
      end;
    end;
    if FInstance <> nil then
    begin
      { is Bitmap prop }
      if GetPropInfo(FInstance.ClassInfo, FPropertyName, [tkClass]) <> nil then
      begin
        { calc new value }
        Value := GetObjectProp(FInstance, FPropertyName);
        if (Value <> nil) and (Value is TPersistent) then
        begin
          if Inverse then
          begin
            { assign to start }
            FCurrent.SetSize(FStopBitmap.Width, FStopBitmap.Height);
            { draw final with alpha }
            if FCurrent.Canvas.BeginScene then
            try
              FCurrent.Canvas.Clear(0);
              FCurrent.Canvas.DrawBitmap(FStopBitmap,
                RectF(0, 0, FCurrent.Width, FCurrent.Height),
                RectF(0, 0, FStopBitmap.Width, FStopBitmap.Height),
                1);
              FCurrent.Canvas.DrawBitmap(FStartBitmap,
                RectF(0, 0, FCurrent.Width, FCurrent.Height),
                RectF(0, 0, FStartBitmap.Width, FStartBitmap.Height),
                1 - NormalizedTime);
            finally
              FCurrent.Canvas.EndScene;
            end;
          end
          else
          begin
            { assign to start }
            FCurrent.SetSize(FStartBitmap.Width, FStartBitmap.Height);
            { draw final with alpha }
            if FCurrent.Canvas.BeginScene then
            try
              FCurrent.Canvas.Clear(0);
              FCurrent.Canvas.DrawBitmap(FStartBitmap,
                RectF(0, 0, FCurrent.Width, FCurrent.Height),
                RectF(0, 0, FStartBitmap.Width, FStartBitmap.Height),
                1);
              FCurrent.Canvas.DrawBitmap(FStopBitmap,
                RectF(0, 0, FCurrent.Width, FCurrent.Height),
                RectF(0, 0, FStopBitmap.Width, FStopBitmap.Height),
                NormalizedTime);
            finally
              FCurrent.Canvas.EndScene;
            end;
          end;
          { assign }
          TPersistent(Value).Assign(FCurrent);
        end;
      end;
    end;
  end;
end;

procedure TBitmapAnimation.SetStartBitmap(Value: TBitmap);
begin
  FStartBitmap.Assign(Value);
end;

procedure TBitmapAnimation.SetStopBitmap(Value: TBitmap);
begin
  FStopBitmap.Assign(Value);
end;

{ TBitmapListAnimation }

constructor TBitmapListAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FCurrent := TBitmap.Create(0, 0);
  FAnimationBitmap := TBitmap.Create(0, 0);
  FAnimationCount := 1;
  FLastAnimationStep := 0;
end;

destructor TBitmapListAnimation.Destroy;
begin
  FCurrent.Free;
  FAnimationBitmap.Free;
  inherited;
end;

procedure TBitmapListAnimation.ProcessAnimation;
var
  Persistent, Path: WideString;
  Value: TObject;
  LeftPos, CurrentIndex: Integer;
  NowValue: Single;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      Path := FPropertyName;
      while Pos('.', FPropertyName) > 0 do
      begin
        Persistent := GetToken(FPropertyName, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent);
      end;
    end;

    if FInstance <> nil then
    begin
      { is Bitmap prop }
      if GetPropInfo(FInstance.ClassInfo, FPropertyName, [tkClass]) <> nil then
      begin
        { calc new value }
        Value := GetObjectProp(FInstance, FPropertyName);
        if (Value <> nil) and (Value is TBitmap) and not (FAnimationBitmap.IsEmpty) then
        begin
          NowValue := InterpolateSingle(0, FAnimationCount, NormalizedTime);

          FCurrent.SetSize(FAnimationBitmap.Width div FAnimationCount, FAnimationBitmap.Height);

          CurrentIndex := Trunc(NowValue);
          if CurrentIndex > FAnimationCount - 1 then
            CurrentIndex := FAnimationCount - 1;
            
          LeftPos := CurrentIndex * (FAnimationBitmap.Width div FAnimationCount);

          if FCurrent.Canvas.BeginScene then
          try
            FCurrent.Canvas.Clear(0);
            FCurrent.Canvas.DrawBitmap(FAnimationBitmap,
              RectF(LeftPos, 0, LeftPos + FCurrent.Width, FCurrent.Height),
              RectF(0, 0, FAnimationBitmap.Width div FAnimationCount,
              FAnimationBitmap.Height), 1);
          finally
            FCurrent.Canvas.EndScene;
          end;

          TPersistent(Value).Assign(FCurrent);
        end;
      end;
    end;
  end;
end;

procedure TBitmapListAnimation.SetAnimationBitmap(Value: TBitmap);
begin
  FAnimationBitmap.Assign(Value);
end;

{ Key Animation }

{ TKey }

procedure TKey.SetKey(const Value: Single);
begin
  FKey := Value;
  if FKey < 0 then
    FKey := 0;
  if FKey > 1 then
    FKey := 1;
end;

{ TKeys }

function TKeys.FindKeys(const Time: Single; var Key1, Key2: TKey): Boolean;
var
  i: Integer;
begin
  Result := False;
  if Count < 2 then
    Exit;
  for i := 0 to Count - 2 do
    if ((Time >= TKey(Items[i]).Key) and (Time <= TKey(Items[i + 1]).Key)) then
    begin
      Result := True;
      Key1 := TKey(Items[i]);
      Key2 := TKey(Items[i + 1]);
      Exit;
    end;
end;

{ TColorKeyAnimation }

constructor TColorKeyAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FKeys := TKeys.Create(TColorKey);
end;

destructor TColorKeyAnimation.Destroy;
begin
  FKeys.Free;
  inherited;
end;

procedure TColorKeyAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    if Keys.Count > 0 then
    begin
      { is string prop }
      if GetPropInfo(FInstance.ClassInfo, FPath,
        [tkString, tkLString, tkWString{$IFDEF FPC},
        tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil
      then
        TColorKey(Keys.Items[0]).Value := StringToAlphaColor(GetStrProp(FInstance, FPath));
      { is int prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
        TColorKey(Keys.Items[0]).Value :=
          GetOrdProp(FInstance, FPath);
    end;
  end;
  inherited;
end;

procedure TColorKeyAnimation.ProcessAnimation;
var
  Key1, Key2: TKey;
begin
  if FInstance <> nil then
  begin
    if FKeys.FindKeys(NormalizedTime, Key1, Key2) then
    begin
      if (TFloatKey(Key2).Key - TFloatKey(Key1).Key) = 0 then
        Exit;
      { is string prop }
      if GetPropInfo(FInstance.ClassInfo, FPath,
        [tkString, tkLString, tkWString{$IFDEF FPC},
        tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil
      then
        SetStrProp(FInstance, FPath,
          AlphaColorToString(InterpolateColor(TColorKey(Key1).Value,
          TColorKey(Key2).Value,
          (NormalizedTime - TFloatKey(Key1).Key) / (TFloatKey(Key2).Key -
          TFloatKey(Key1).Key))));
      { is int prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
        SetOrdProp(FInstance, FPath,
          InterpolateColor(TColorKey(Key1).Value,
          TColorKey(Key2).Value,
          (NormalizedTime - TFloatKey(Key1).Key) / (TFloatKey(Key2).Key -
          TFloatKey(Key1).Key)));
    end;
  end;
end;

{ TFloatKeyAnimation }

constructor TFloatKeyAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FKeys := TKeys.Create(TFloatKey);
end;

destructor TFloatKeyAnimation.Destroy;
begin
  FKeys.Free;
  inherited;
end;

procedure TFloatKeyAnimation.Start;
var
  Persistent: WideString;
  I: Integer;
  Comp: TFmxObject;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent)
        else
        if Parent <> nil then
        begin
          for I := 0 to Parent.ChildrenCount - 1 do
            if CompareText(Parent.Children[I].Name, Persistent) = 0 then
            begin
              Comp := Parent.Children[I];
              if GetPropInfo(Comp.ClassInfo, FPath) <> nil then
              begin
                FInstance := Comp;
                Break;
              end;
            end;
        end;
      end;
    end;
  end;
  if (FInstance <> nil) and StartFromCurrent then
  begin
    if Keys.Count > 0 then
    begin
      { is string prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
        TFloatKey(Keys.Items[0]).Value := GetFloatProp(FInstance, FPath);
    end;
  end;
  inherited;
end;

procedure TFloatKeyAnimation.ProcessAnimation;
var
  Key1, Key2: TKey;
begin
  if FInstance <> nil then
  begin
    if FKeys.FindKeys(NormalizedTime, Key1, Key2) then
    begin
      if (TFloatKey(Key2).Key - TFloatKey(Key1).Key) = 0 then
        Exit;
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
        SetFloatProp(FInstance, FPath, InterpolateSingle(TFloatKey(Key1).Value,
          TFloatKey(Key2).Value, (NormalizedTime - TFloatKey(Key1).Key) /
          (TFloatKey(Key2).Key - TFloatKey(Key1).Key)));
    end;
  end;
end;

{ TPathAnimation }

constructor TPathAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FPath := TPathData.Create;
end;

destructor TPathAnimation.Destroy;
begin
  if FSpline <> nil then
    FreeAndNil(FSpline);
  FPath.Free;
  inherited;
end;

procedure TPathAnimation.ProcessAnimation;
var
  OldP, P1: TPointF;
begin
  if (Length(FPolygon) > 0) and (FObj <> nil) then
  begin
    OldP := FObj.Position.Point;
    FSpline.SplineXY(NormalizedTime * High(FPolygon), P1.X, P1.Y);
    FObj.Position.X := FStart.X + P1.X;
    FObj.Position.Y := FStart.Y + P1.Y;
    if FRotate and (NormalizedTime <> 0) and (NormalizedTime <> 1) and
      ((OldP.X <> FObj.Position.X) and (OldP.Y <> FObj.Position.Y)) then
    begin
      if Inverse then
      begin
        if VectorCrossProductZ(Vector(FObj.Position.X - OldP.X,
          FObj.Position.Y - OldP.Y), Vector(0, 1)) < 0 then
          FObj.RotationAngle := 180 +
            RadToDeg(ArcCos(VectorAngleCosine(Vector(FObj.Position.X - OldP.X,
            FObj.Position.Y - OldP.Y), Vector(0, 1))))
        else
          FObj.RotationAngle := 180 -
            RadToDeg(ArcCos(VectorAngleCosine(Vector(FObj.Position.X - OldP.X,
            FObj.Position.Y - OldP.Y), Vector(0, 1))))
      end
      else
      begin
        if VectorCrossProductZ(Vector(FObj.Position.X - OldP.X,
          FObj.Position.Y - OldP.Y), Vector(0, 1)) < 0 then
          FObj.RotationAngle :=
            RadToDeg(ArcCos(VectorAngleCosine(Vector(FObj.Position.X - OldP.X,
            FObj.Position.Y - OldP.Y), Vector(0, 1))))
        else
          FObj.RotationAngle :=
            -RadToDeg(ArcCos(VectorAngleCosine(Vector(FObj.Position.X - OldP.X,
            FObj.Position.Y - OldP.Y), Vector(0, 1))))
      end;
    end;
  end;
end;

procedure TPathAnimation.SetPath(const Value: TPathData);
begin
  FPath.Assign(Value);
end;

procedure TPathAnimation.Start;
var
  i: Integer;
begin
  inherited;
  if FSpline <> nil then
    FreeAndNil(FSpline);
  SetLength(FPolygon, 0);
  FPath.FlattenToPolygon(FPolygon);
  if Length(FPolygon) > 1 then
    for i := 1 to High(FPolygon) do
      if (FPolygon[i].X = ClosePolygon.X) and (FPolygon[i].Y = ClosePolygon.Y)
      then
        FPolygon[i] := FPolygon[i - 1];
  FSpline := TSpline.Create(FPolygon);
  if (Parent <> nil) and (Parent is TControl) then
    FObj := TControl(Parent)
  else
    FObj := nil;
  if FObj <> nil then
    FStart := FObj.Position.Point;
end;

initialization
  RegisterFmxClasses([TColorAnimation, TGradientAnimation, TFloatAnimation,
    TRectAnimation, TBitmapAnimation, TBitmapListAnimation, TColorKeyAnimation,
    TFloatKeyAnimation, TPathAnimation]);
end.
