{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Filter;

interface

{$I FMX_Defines.inc}

uses
  Classes, Types, FMX_Types, FMX_Types3D;

{$SCOPEDENUMS ON}

type

{ TFilter }

  TShaderValueType = (vtFloat, vtPoint, vtColor, vtBitmap);

  TShaderValueRec = record
    Name: WideString;
    Desc: WideString;
    ValueType: TShaderValueType;
    Value: Variant;
    Min, Max, Default: Variant;
  end;

  TShaderValueRecArray = array of TShaderValueRec;

  TFilterRec = record
    Name: WideString;
    Desc: WideString;
    Values: TShaderValueRecArray;
  end;

  TFilterClass = class of TFilter;
  TFilter = class(TPersistent)
  private
    function GetShaderValues(const Index: WideString): Variant;
    procedure SetShaderValues(const Index: WideString; Value: Variant);
    function GetShaderValuesAsBitmap(const Index: WideString): TBitmap;
    procedure SetShaderValuesAsBitmap(const Index: WideString; const Value: TBitmap);
    function GetShaderValuesAsPoint(const Index: WideString): TPointF;
    procedure SetShaderValuesAsPoint(const Index: WideString; const Value: TPointF);
    procedure SetInputFilter(const Value: TFilter);
  protected
    FValues: TShaderValueRecArray;
    FInput: TBitmap;
    FTarget: TBitmap;
    FOutput: TBitmap;
    FProcessing: Boolean;
    FModified: Boolean;
    FInputFilter: TFilter;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    class function FilterAttr: TFilterRec; virtual;
    { Class static method for C++ access }
    class function FilterAttrForClass(C: TFilterClass): TFilterRec; static;
    procedure Apply; virtual; abstract;
    property Values[const Index: WideString]: Variant read GetShaderValues
      write SetShaderValues; default;
    property ValuesAsBitmap[const Index: WideString]: TBitmap read GetShaderValuesAsBitmap
      write SetShaderValuesAsBitmap;
    property ValuesAsPoint[const Index: WideString]: TPointF read GetShaderValuesAsPoint
      write SetShaderValuesAsPoint;
    property InputFilter: TFilter read FInputFilter write SetInputFilter;
  end;

{ TShaderFilter }

  TShaderFilter = class(TFilter)
  private
    procedure CreateNoise;
  protected
    FNeedInternalSecondTex: WideString; // need internal texture as second
    FNoCopyForOutput: Boolean; // not copy result to targer
    FAntiAlise: Boolean; // add transparent border for antialising
    FShaders: array [1 .. 10] of TContextShader; // shaders
    FPass, FPassCount: Integer; // for multipass - default shader have 1 pass
    procedure CalcSize(var W, H: Integer); virtual;
    procedure LoadShader; virtual;
    procedure Render; virtual;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Apply; override;
  end;

var
  Filters: TWideStrings = nil;
  ShaderBitmap: TBitmap = nil;
  ShaderDevice: TContext3D = nil;

{ Variants }

function VarIsPoint(V: Variant): Boolean;
function VarFromPointXY(x, y: Single): Variant;
function VarFromPoint(P: TPointF): Variant;
function VarToPoint(V: Variant): TPointF;
function VarToPointX(V: Variant): Single;
function VarToPointY(V: Variant): Single;

function VarIsBitmap(V: Variant): Boolean;
function VarFromBitmap(AObject: TBitmap): Variant;
function VarToBitmap(V: Variant): TBitmap;

{ Filter Creation }

function FilterByName(const AName: WideString): TFilter;
function FilterClassByName(const AName: WideString): TFilterClass;

{ Internal }

procedure RegisterFilter(const Category: WideString; Filter: TFilterClass);
procedure FillCategory(AList: TWideStrings);
procedure FillFiltersInCategory(const Category: WideString; AList: TWideStrings);

{ Attr }

function FilterRec(const AName, ADesc: WideString; AValues: array of TShaderValueRec): TFilterRec;
function FilterValueRec(const AName, ADesc: WideString; AType: TShaderValueType;
  ADefault, AMin, AMax: Variant): TShaderValueRec;

implementation

uses
  Variants,
  SysUtils,
  UITypes,
  FMX_FilterCatBlur,
  FMX_FilterCatGeometry,
  FMX_FilterCatTransition,
  FMX_FilterCatColor,
  FMX_FilterCatColorAdjust,
  FMX_FilterCatComposite,
  FMX_FilterCatGenerator,
  FMX_FilterCatStyle,
  FMX_FilterCatTiles,
  FMX_FilterCatDistortion;

{$R *.res}

var
  Noise: TBitmap;
  InputAntiAliased: TBitmap;

function VarIsPoint(V: Variant): Boolean;
begin
  Result := False;
  if not VarIsStr(V) then
    Exit;
  Result := Pos('fxpoint', V) = 1;
end;

function VarFromPointXY(x, y: Single): Variant;
var
  P: TPointF;
begin
  P.x := x;
  P.y := y;
  Result := VarFromPoint(P);
end;

function VarFromPoint(P: TPointF): Variant;
begin
  Result := 'fxpoint' + FloatToStr(P.x) + ':' + FloatToStr(P.y);
end;

function VarToPoint(V: Variant): TPointF;
var
  S, x, y: WideString;
begin
  if VarIsPoint(V) then
  begin
    S := Copy(V, 8, MaxInt);
    x := Copy(S, 1, Pos(':', S) - 1);
    y := Copy(S, Pos(':', S) + 1, MaxInt);
    Result := PointF(StrToFloat(x), StrToFloat(y));
  end
  else
    Result := PointF(0.0, 0.0);
end;

function VarToPointX(V: Variant): Single;
begin
  Result := VarToPoint(V).x;
end;

function VarToPointY(V: Variant): Single;
begin
  Result := VarToPoint(V).y;
end;

function VarIsBitmap(V: Variant): Boolean;
begin
  Result := False;
  if not VarIsStr(V) then
    Exit;
  Result := Pos('fxobject', V) = 1;
end;

function VarFromBitmap(AObject: TBitmap): Variant;
begin
  Result := 'fxobject' + IntToStr(NativeInt(AObject));
end;

function VarToBitmap(V: Variant): TBitmap;
begin
  if VarIsBitmap(V) then
  begin
    Result := TBitmap(Pointer(StrToInt(Copy(V, 9, MaxInt))));
  end
  else
    Result := nil;
end;

function FilterByName(const AName: WideString): TFilter;
var
  i: Integer;
begin
  Result := nil;
  if Filters = nil then
    Exit;
  for i := 0 to Filters.Count - 1 do
    if CompareText(TFilterClass(Filters.Objects[i]).FilterAttr.Name, AName) = 0
    then
    begin
      Result := TFilterClass(Filters.Objects[i]).Create;
      Exit;
    end;
end;

function FilterClassByName(const AName: WideString): TFilterClass;
var
  i: Integer;
begin
  Result := nil;
  if Filters = nil then
    Exit;
  for i := 0 to Filters.Count - 1 do
    if CompareText(TFilterClass(Filters.Objects[i]).FilterAttr.Name, AName) = 0
    then
    begin
      Result := TFilterClass(Filters.Objects[i]);
      Exit;
    end;
end;

procedure RegisterFilter(const Category: WideString; Filter: TFilterClass);
begin
  if Filters = nil then
  begin
    Filters := TWideStringList.Create;
    // TWideStringList(Filters).Sorted := True;
  end;
  Filters.AddObject(Category, TObject(Filter));
end;

procedure FillCategory(AList: TWideStrings);
var
  i: Integer;
begin
  AList.Clear;
  if Filters = nil then
    Exit;
  for i := 0 to Filters.Count - 1 do
    if AList.IndexOf(Filters[i]) < 0 then
      AList.Add(Filters[i]);
end;

procedure FillFiltersInCategory(const Category: WideString; AList: TWideStrings);
var
  i: Integer;
begin
  AList.Clear;
  if Filters = nil then
    Exit;
  for i := 0 to Filters.Count - 1 do
    if Filters[i] = Category then
      AList.Add(TFilterClass(Filters.Objects[i]).FilterAttr.Name);
end;

function FilterRec(const AName, ADesc: WideString; AValues: array of TShaderValueRec)
  : TFilterRec;
var
  i: Integer;
begin
  Result.Name := AName;
  Result.Desc := ADesc;
  SetLength(Result.Values, Length(AValues));
  for i := 0 to High(AValues) do
    Result.Values[i] := AValues[i];
end;

function FilterValueRec(const AName, ADesc: WideString; AType: TShaderValueType;
  ADefault, AMin, AMax: Variant): TShaderValueRec;
begin
  Result.Name := AName;
  Result.Desc := ADesc;
  Result.ValueType := AType;
  Result.Value := ADefault;
  Result.Default := ADefault;
  Result.Min := AMin;
  Result.Max := AMax;
end;

{ TFilter }

constructor TFilter.Create;
begin
  inherited Create;
  FValues := FilterAttr.Values;
  SetLength(FValues, Length(FValues) + 2);
  FValues[High(FValues) - 1] := FilterValueRec('Input', '', TShaderValueType.vtBitmap,
    '', '', '');
  FValues[High(FValues)] := FilterValueRec('Output', '', TShaderValueType.vtBitmap,
    '', '', '');
  FModified := True;
end;

destructor TFilter.Destroy;
begin
  if FOutput <> nil then
    FreeAndNil(FOutput);
  inherited;
end;

class function TFilter.FilterAttr: TFilterRec;
begin
  FillChar(Result, SizeOf(Result), 0);
end;

class function TFilter.FilterAttrForClass(C: TFilterClass): TFilterRec;
begin
  Result := C.FilterAttr;
end;

function TFilter.GetShaderValues(const Index: WideString): Variant;
var
  i: Integer;
begin
  for i := 0 to High(FValues) do
    if CompareText(FValues[i].Name, Index) = 0 then
    begin
      if CompareText(FValues[i].Name, 'Output') = 0 then
      begin
        if not(FProcessing) and FModified then // call Apply
          Apply;
        if FOutput <> nil then
        begin
          Result := VarFromBitmap(FOutput);
          FValues[i].Value := Result;
        end
        else
          Result := NULL;
        Exit;
      end;
      Result := FValues[i].Value;
      Exit;
    end;
  Result := NULL;
end;

procedure TFilter.SetShaderValues(const Index: WideString; Value: Variant);
var
  i: Integer;
begin
  for i := 0 to High(FValues) do
    if CompareText(FValues[i].Name, Index) = 0 then
    begin
      case FValues[i].ValueType of
        TShaderValueType.vtFloat:
          begin
            if VarIsNumeric(Value) then
            begin
              if Value < FValues[i].Min then
                Value := FValues[i].Min;
              if Value > FValues[i].Max then
                Value := FValues[i].Max;
              FValues[i].Value := Value
            end;
          end;
        TShaderValueType.vtPoint:
          begin
            if VarIsPoint(Value) then
              FValues[i].Value := Value
          end;
        TShaderValueType.vtColor:
          begin
            FValues[i].Value := Value;
          end;
        TShaderValueType.vtBitmap:
          begin
            if VarIsBitmap(Value) then
            begin
              if CompareText(Index, 'Output') = 0 then
                Exit;
              FValues[i].Value := Value;
              if CompareText(Index, 'Input') = 0 then
              begin
                FInput := VarToBitmap(Value);
              end;
              if CompareText(Index, 'Target') = 0 then
              begin
                FTarget := VarToBitmap(Value);
              end;
            end;
          end;
      end;
      FModified := True;
      Exit;
    end;
end;

function TFilter.GetShaderValuesAsBitmap(const Index: WideString): TBitmap;
begin
  Result := VarToBitmap(Values[Index]);
end;

procedure TFilter.SetShaderValuesAsBitmap(const Index: WideString; const Value: TBitmap);
begin
  Values[Index] := VarFromBitmap(Value);
end;

function TFilter.GetShaderValuesAsPoint(const Index: WideString): TPointF;
begin
  Result := VarToPoint(Values[Index]);
end;

procedure TFilter.SetShaderValuesAsPoint(const Index: WideString; const Value: TPointF);
begin
  Values[Index] := VarFromPoint(Value);
end;

procedure TFilter.SetInputFilter(const Value: TFilter);
begin
  FInputFilter := Value;
  FModified := True;
end;

{ TShaderFilter }

constructor TShaderFilter.Create;
begin
  inherited;
  FPassCount := 1;
  if (ShaderDevice = nil) then
  begin
    ShaderBitmap := TBitmap.Create(128, 32);
    ShaderDevice := DefaultContextClass.CreateFromBitmap(ShaderBitmap, TMultisample.msNone, False);
  end;
end;

destructor TShaderFilter.Destroy;
var
  I: Integer;
begin
  for I := 1 to FPassCount do
    if FShaders[I] <> 0 then
      ShaderDevice.DestroyPixelShader(FShaders[I]);
  inherited;
end;

procedure TShaderFilter.LoadShader;
var
  i: Integer;
  c: cardinal;
begin
  // Shader
  ShaderDevice.SetPixelShader(FShaders[FPass]);
  // Params
  for i := 0 to High(FValues) do
  begin
    case FValues[i].ValueType of
      TShaderValueType.vtBitmap:
        Continue;
      TShaderValueType.vtFloat:
        ShaderDevice.SetPixelShaderVector(i, Vector3D(FValues[i].Value, 0, 0, 0));
      TShaderValueType.vtPoint:
        ShaderDevice.SetPixelShaderVector(i, Vector3D(VarToPoint(FValues[i].Value).x /
          FInput.Width, VarToPoint(FValues[i].Value).y / FInput.Height, 0, 0));
      TShaderValueType.vtColor:
        begin
          c := FValues[i].Value;
          ShaderDevice.SetPixelShaderVector(i, Vector3D(TAlphaColorRec(c).r / $FF,
            TAlphaColorRec(c).g / $FF, TAlphaColorRec(c).b / $FF, TAlphaColorRec(c).a / $FF));
        end;
    end;
  end;
end;

procedure TShaderFilter.CalcSize(var W, H: Integer);
begin
  W := FInput.Width;
  H := FInput.Height;
end;

procedure CopyBitmapRect(const X, Y: Single; const ASrcRect: TRectF; const Source, Dest: TBitmap);
var
  i: integer;
begin
  for i := round(ASrcRect.Top) to round(ASrcRect.Bottom) - 1 do
    Move(PAlphaColorArray(Source.ScanLine[i])[round(ASrcRect.Left)], PAlphaColorArray(Dest.ScanLine[i + round(Y)])[round(ASrcRect.Left + round(X))], round(ASrcRect.Width) * 4);
  Dest.UpdateHandles;
  Dest.BitmapChanged;
end;

procedure TShaderFilter.Apply;
var
  R: TRectF;
  i, W, H: Integer;
begin
  if not FModified then
    Exit;
  FProcessing := True;
  try
    // Prepare
    if (FInputFilter <> nil) then
    begin
      TShaderFilter(FInputFilter).FNoCopyForOutput := True;
      FInputFilter.Apply;
      FInput := TShaderFilter(FInputFilter).FOutput;
    end;
    if (FInput = nil) then
      Exit;
    CalcSize(W, H);
    if W * H = 0 then
      Exit;
    if FOutput <> nil then
      FOutput.SetSize(W, H)
    else
      FOutput := TBitmap.Create(W, H);
    // Correct size
    if (W > ShaderBitmap.Width) or (H > ShaderBitmap.Height) then
    begin
      ShaderBitmap.SetSize(W, H);
      ShaderDevice.SetSize(W, H);
    end;
    // Rendering
    if ShaderDevice.BeginScene then
    try
      ShaderDevice.SetMatrix(IdentityMatrix3D);
      ShaderDevice.SetContextState(TContextState.cs2DScene);
      ShaderDevice.SetContextState(TContextState.csAllFace);
      ShaderDevice.SetContextState(TContextState.csLightOff);
      ShaderDevice.SetContextState(TContextState.csAlphaBlendOff);
      ShaderDevice.SetContextState(TContextState.csAlphaTestOff);
      ShaderDevice.SetContextState(TContextState.csZWriteOff);
      ShaderDevice.SetContextState(TContextState.csZTestOff);
      ShaderDevice.SetContextState(TContextState.csTexLinear);
      ShaderDevice.SetContextState(TContextState.csTexReplace);
      // Create Texture if need
      if (FInputFilter = nil) then
      begin
        if FAntiAlise then
        begin
          if InputAntiAliased = nil then
            InputAntiAliased := TBitmap.Create(FInput.Width + 2, FInput.Height + 2)
          else
          if (InputAntiAliased.Width <> FInput.Width + 2) or (InputAntiAliased.Height <> FInput.Height + 2) then
          begin
            InputAntiAliased.SetSize(FInput.Width + 2, FInput.Height + 2);
            InputAntiAliased.Clear(0);
          end;
          for i := 0 to FInput.Height - 1 do
            Move(FInput.Scanline[i]^, PAlphaColorArray(InputAntiAliased.Scanline[i + 1])[1], FInput.Width * 4);
          ShaderDevice.SetTextureUnit(0, InputAntiAliased);
        end
        else
          ShaderDevice.SetTextureUnit(0, FInput);
      end;
      // Second Texture if need
      if (FTarget <> nil) then
      begin
        if FTarget.IsEmpty then
          ShaderDevice.SetTextureUnit(1, FInput)
        else
          ShaderDevice.SetTextureUnit(1, FTarget);
      end;
      // Third Texture
      if FNeedInternalSecondTex <> '' then
      begin
        CreateNoise;
        ShaderDevice.SetTextureUnit(2, Noise);
      end;
      // Process passes
      for i := 1 to FPassCount do
      begin
        FPass := i;
        // Clear
        ShaderDevice.Clear([TClearTarget.ctColor], 0, 0, 0);
        // Render
        Render;
        // Prepare second pass
        if FPass < FPassCount then
        begin
          R := RectF(0, 0, W, H);
          ShaderDevice.SetTextureUnitFromContext(0, @R); // GPU copy
        end;
      end;
    finally
      ShaderDevice.EndScene(not FNoCopyForOutput);
    end;
    // Copy result to Target
    if FNoCopyForOutput then
    begin
      R := RectF(0, 0, W, H);
      ShaderDevice.SetTextureUnitFromContext(0, @R) // GPU copy
    end
    else
      CopyBitmapRect(0, 0, RectF(0, 0, W, H), ShaderBitmap, FOutput);
  finally
    if (FInputFilter <> nil) then
    begin
      TShaderFilter(FInputFilter).FNoCopyForOutput := False;
      FInput := nil;
    end;
    FProcessing := False;
    FModified := False;
  end;
end;

procedure TShaderFilter.CreateNoise;
var
  S: TStream;
  W, H: cardinal;
begin
  if FNeedInternalSecondTex = '' then Exit;
  S := TResourceStream.Create(HInstance, FNeedInternalSecondTex, RT_RCDATA);
  S.Read(W, 4);
  S.Read(H, 4);
  if Noise = nil then
    Noise := TBitmap.Create(W, H);
  S.Read(Noise.StartLine^, W * H * 4);
  S.Free;
end;

procedure TShaderFilter.Render;
var
  Ver: TVertexBuffer;
  Ind: TIndexBuffer;
  W, H: Integer;
begin
  W := FOutput.Width;
  H := FOutput.Height;
  // Fill
  Ver := TVertexBuffer.Create([TVertexFormat.vfVertex, TVertexFormat.vfTexCoord0], 4);
  with ShaderDevice.PixelToPixelPolygonOffset do
    if FAntiAlise then
    begin
      Ver.Vertices[0] := Point3D(-1 + X, -1 + Y, 0);
      Ver.TexCoord0[0] := PointF(0.0, 0.0);
      Ver.Vertices[1] := Point3D(W + 1 + X, -1 + Y, 0);
      Ver.TexCoord0[1] := PointF(1.0, 0.0);
      Ver.Vertices[2] := Point3D(W + 1 + X, H + 1 + Y, 0);
      Ver.TexCoord0[2] := PointF(1.0, 1.0);
      Ver.Vertices[3] := Point3D(-1 + X, H + 1 + Y, 0);
      Ver.TexCoord0[3] := PointF(0.0, 1.0);
    end
    else
    begin
      Ver.Vertices[0] := Point3D(0 + X, 0 + Y, 0);
      Ver.TexCoord0[0] := PointF(0.0, 0.0);
      Ver.Vertices[1] := Point3D(W + X, 0 + Y, 0);
      Ver.TexCoord0[1] := PointF(1.0, 0.0);
      Ver.Vertices[2] := Point3D(W + X, H + Y, 0);
      Ver.TexCoord0[2] := PointF(1.0, 1.0);
      Ver.Vertices[3] := Point3D(0 + X, H + Y, 0);
      Ver.TexCoord0[3] := PointF(0.0, 1.0);
    end;
  Ind := TIndexBuffer.Create(6);
  Ind[0] := 0;
  Ind[1] := 1;
  Ind[2] := 3;
  Ind[3] := 3;
  Ind[4] := 1;
  Ind[5] := 2;
  // Shader
  LoadShader;
  // Draw
  ShaderDevice.DrawTrianglesList(Ver, Ind, 1);
  Ind.Free;
  Ver.Free;
end;

initialization
finalization
  FreeAndNil(InputAntiAliased);
  FreeAndNil(Noise);
  FreeAndNil(ShaderDevice);
  FreeAndNil(ShaderBitmap);
  FreeAndNil(Filters);
end.
