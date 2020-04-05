{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2018-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.ImageCollection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.Messaging,
  Vcl.Graphics, Vcl.Controls, Winapi.Wincodec,
  Vcl.BaseImageCollection;

type
  TImageCollection = class;
  TImageCollectionItem = class;

  /// <summary>
  /// Item to store one image.
  /// </summary>
  TImageCollectionSourceItem = class(TCollectionItem)
  private
    FImage: TWICImage;
    procedure SetImage(Value: TWICImage);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
   /// <summary>
   /// TWICImage property to store image in native format.
   /// </summary>
    property Image: TWICImage
      read FImage write SetImage;
  end;

  /// <summary>
  /// Collection to store images with different sizes for one item from TImageCollection.
  /// </summary>
  TImageCollectionItemSources = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TImageCollectionSourceItem;
    procedure SetItem(Index: Integer; Value: TImageCollectionSourceItem);
  public
    function Add: TImageCollectionSourceItem;
    property Items[Index: Integer]: TImageCollectionSourceItem read GetItem write SetItem; default;
  end;

  /// <summary>
  /// Item for TImageCollection, which has name and list of source images.
  /// </summary>
  TImageCollectionItem = class(TCollectionItem)
  private
    FName: String;
    FSourceImages: TImageCollectionItemSources;
    FData: TCustomData;
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    /// <summary>
    /// Use CheckSources to sort images by size after you loading them.
    /// Function return True if it reordered items in SourceImages property.
    /// </summary>
    function CheckSources: Boolean;
    /// <summary>
    /// Property to link some abstract data for item.
    /// </summary>
    property Data: TCustomData read FData write FData;
    /// <summary>
    /// Call Change method from specific item to process messaging that item was changed.
    /// CheckSources method is called in this method automatically.
    /// </summary>
    procedure Change;
  published
    /// <summary>
    /// Item name, which can includes Category.
    /// Category name placed at the beginning of the name and separated by the symbol "\".
    /// </summary>
    property Name: String read FName write SetName;
    /// <summary>
    /// Collection of source images.
    /// TImageCollection chooses one source image for optimal scaling.
    /// </summary>
    property SourceImages: TImageCollectionItemSources
      read FSourceImages write FSourceImages;
  end;

  /// <summary>
  /// Collection of items for TImageCollection
  /// </summary>
  TImageCollectionItems = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TImageCollectionItem;
    procedure SetItem(Index: Integer; Value: TImageCollectionItem);
  public
    function Add: TImageCollectionItem;
    property Items[Index: Integer]: TImageCollectionItem read GetItem write SetItem; default;
  end;

  /// <summary>
  /// Interpolation modes for TImageCollection.
  /// </summary>
  TImageCollectionInterpolationMode = (icIMModeHighQualityCubic, icIMFant,
    icIMLinear, icIMCubic, icIMModeNearestNeighbor);

  /// <summary>
  /// Event type to create create TBitmap from TWICImage with custom algorithm.
  /// </summary>
  TImageCollectionOnGetBitmapEvent = procedure(ASourceImage: TWICImage;
    AWidth, AHeight: Integer; out ABitmap: TBitmap) of object;

  /// <summary>
  /// Event type to draw image from collection with custom code.
  /// </summary>
  TImageCollectionOnDrawEvent = procedure(ASourceImage: TWICImage;
    ACanvas: TCanvas; ARect: TRect; AProportional: Boolean = False) of object;

  /// <summary>
  /// Component to store, scale and draw images.
  /// </summary>
  TImageCollection = class(TCustomImageCollection)
  private
    FImages: TImageCollectionItems;
    FInterpolationMode: TImageCollectionInterpolationMode;
    FOnGetBitmap: TImageCollectionOnGetBitmapEvent;
    FOnDraw: TImageCollectionOnDrawEvent;
    procedure SetImages(Value: TImageCollectionItems);
    procedure SetInterpolationMode(Value: TImageCollectionInterpolationMode);
  protected
    function GetCount: Integer; override;
    function GetSourceImageIndex(AIndex: Integer; AWidth, AHeight: Integer): Integer;
    function GetSourceImageByIndex(AIndex, ASourceIndex: Integer): TWICImage;
    procedure DoDraw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean);
    function GetScaledImage(ASourceImage: TWICImage; ANewWidth, ANewHeight: Integer): TWICImage;
    procedure LoadFromCollection(AImageCollection: TImageCollection);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function IsIndexAvailable(AIndex: Integer): Boolean; override;
    function GetIndexByName(const AName: String): Integer; override;
    function GetNameByIndex(AIndex: Integer): String; override;
    /// <summary>
    /// Get source TWICImage, which optimal for scaling to AWdith and AHeight sizes.
    /// </summary>
    function GetSourceImage(AIndex: Integer; AWidth, AHeight: Integer): TWICImage;
    /// <summary>
    /// Get scaled to specific size TBitmap from item with specific index.
    /// </summary>
    function GetBitmap(AIndex: Integer; AWidth, AHeight: Integer): TBitmap; overload; override;
    /// <summary>
    /// Get scaled to specific size TBitmap from item with specific name.
    /// </summary>
    function GetBitmap(const AName: String; AWidth, AHeight: Integer; AEnabled: Boolean = True): TBitmap; overload;
    /// <summary>
    /// Directly draw specific image from Item.SourceImages collection.
    /// </summary>
    procedure DrawSource(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; ASourceIndex: Integer; AProportional: Boolean = False);
    /// <summary>
    /// Draw image from collection item with specific index to specific rect and proportional parameter.
    /// </summary>
    procedure Draw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean = False); overload; override;
    /// <summary>
    /// Draw image from collection item with specific name to specific rect and proportional parameter.
    /// </summary>
    procedure Draw(ACanvas: TCanvas; ARect: TRect; const AName: String; AProportional: Boolean = False); overload;
  published
    /// <summary>
    /// Collection of items with source images.
    /// </summary>
    property Images: TImageCollectionItems read FImages write SetImages;
    /// <summary>
    /// Interpolation mode, which will be used to scale images.
    /// </summary>
    property InterpolationMode: TImageCollectionInterpolationMode
      read FInterpolationMode write SetInterpolationMode default icIMModeHighQualityCubic;
    /// <summary>
    /// Use OnDraw event with your code to draw image.
    /// </summary>
    property OnDraw: TImageCollectionOnDrawEvent
      read FOnDraw write FOnDraw;
    /// <summary>
    /// Use OnGetBitmap event with your code to get TBitmap from item.
    /// </summary>
    property OnGetBitmap: TImageCollectionOnGetBitmapEvent
      read FOnGetBitmap write FOnGetBitmap;
  end;

implementation
  Uses System.Math, System.SysUtils;

function UpdateRectForProportionalSize(ARect: TRect; AWidth, AHeight: Integer; AStretch: Boolean): TRect;
var
  w, h, cw, ch: Integer;
  xyaspect: Double;
begin
  Result := ARect;
  if AWidth * AHeight = 0 then
    Exit;

  w := AWidth;
  h := AHeight;
  cw := ARect.Width;
  ch := ARect.Height;

  if AStretch or ((w > cw) or (h > ch)) then
  begin
    xyaspect := w / h;
    if w > h then
    begin
      w := cw;
      h := Trunc(cw / xyaspect);
      if h > ch then
      begin
        h := ch;
        w := Trunc(ch * xyaspect);
      end;
     end
     else
     begin
       h := ch;
       w := Trunc(ch * xyaspect);
       if w > cw then
       begin
         w := cw;
         h := Trunc(cw / xyaspect);
       end;
     end;
  end;

  Result := Rect(0, 0, w, h);
  OffsetRect(Result, ARect.Left + (cw - w) div 2, ARect.Top + (ch - h) div 2);
end;

constructor TImageCollectionSourceItem.Create(Collection: TCollection);
begin
  inherited;
  FImage := TWICImage.Create;
end;

destructor TImageCollectionSourceItem.Destroy;
begin
  FImage.Free;
  inherited;
end;

procedure TImageCollectionSourceItem.SetImage(Value: TWICImage);
begin
  FImage.Assign(Value);
end;

function TImageCollectionItemSources.GetItem(Index: Integer): TImageCollectionSourceItem;
begin
  Result := TImageCollectionSourceItem(inherited GetItem(Index));
end;

procedure TImageCollectionItemSources.SetItem(Index: Integer; Value: TImageCollectionSourceItem);
begin
  inherited SetItem(Index, Value);
end;

function TImageCollectionItemSources.Add: TImageCollectionSourceItem;
begin
  Result := TImageCollectionSourceItem(inherited Add);
end;

constructor TImageCollectionItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FSourceImages := TImageCollectionItemSources.Create(Self, TImageCollectionSourceItem);
  FName := '';
end;

destructor TImageCollectionItem.Destroy;
begin
  FSourceImages.Free;
  inherited;
end;

procedure TImageCollectionItem.Change;
begin
  CheckSources;
  if Collection.Owner is TImageCollection then
    TMessageManager.DefaultManager.SendMessage(nil,
      TImageCollectionChangedMessage.Create(TImageCollection(Collection.Owner), Index, Name));
end;

procedure TImageCollectionItem.SetName(const Value: String);
begin
  FName := Value;
end;

function TImageCollectionItem.CheckSources: Boolean;
var
  I, J: Integer;
begin
  Result := False;
  if SourceImages.Count < 2 then
    Exit;

  for I := 0 to SourceImages.Count - 2 do
    for J := 0 to SourceImages.Count - 2 - I do
      if Max(SourceImages[J].Image.Width, SourceImages[J].Image.Height) >
         Max(SourceImages[J + 1].Image.Width, SourceImages[J + 1].Image.Height) then
         begin
           Result := True;
           SourceImages[J].Index := J + 1;
         end;
end;

function TImageCollectionItems.GetItem(Index: Integer): TImageCollectionItem;
begin
  Result := TImageCollectionItem(inherited GetItem(Index));
end;

procedure TImageCollectionItems.SetItem(Index: Integer; Value: TImageCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

function TImageCollectionItems.Add: TImageCollectionItem;
begin
  Result := TImageCollectionItem(inherited Add);
end;

constructor TImageCollection.Create(AOwner: TComponent);
begin
  inherited;
  FImages := TImageCollectionItems.Create(Self, TImageCollectionItem);
  FInterpolationMode := icIMModeHighQualityCubic;
end;

destructor TImageCollection.Destroy;
begin
  FImages.Free;
  inherited;
end;

procedure TImageCollection.SetInterpolationMode(Value: TImageCollectionInterpolationMode);
begin
  FInterpolationMode := Value;
end;

procedure TImageCollection.SetImages(Value: TImageCollectionItems);
begin
  FImages := Value;
end;

function TImageCollection.GetCount: Integer;
begin
  Result := FImages.Count;
end;

function TImageCollection.GetNameByIndex(AIndex: Integer): String;
begin
  if (AIndex >= 0) and (AIndex < Count) then
    Result := Images[AIndex].Name;
end;

function TImageCollection.GetIndexByName(const AName: String): Integer;
var
  I: Integer;
  S: String;
begin
  Result := -1;
  S := LowerCase(AName);
  for I := 0 to FImages.Count - 1 do
    if LowerCase(FImages[I].Name) = S then
      Exit(I);
end;

function TImageCollection.IsIndexAvailable(AIndex: Integer): Boolean;
begin
  Result := (Count > 0) and (AIndex >= 0) and (AIndex < Count) and
    (FImages[AIndex].SourceImages.Count > 0);
end;

function TImageCollection.GetSourceImageByIndex(AIndex, ASourceIndex: Integer): TWICImage;
begin
  if IsIndexAvailable(AIndex) and (ASourceIndex >= 0) and (ASourceIndex < Images[AIndex].SourceImages.Count) then
    Result := Images[AIndex].SourceImages[ASourceIndex].Image
  else
    Result := nil;
end;

function TImageCollection.GetSourceImageIndex(AIndex: Integer; AWidth, AHeight: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  if IsIndexAvailable(AIndex) then
  begin
    if (Images[AIndex].SourceImages.Count = 1) and
        not Images[AIndex].SourceImages[0].Image.Empty
    then
      Result := 0
    else
    begin
      Images[AIndex].CheckSources;
      for I := 0 to Images[AIndex].SourceImages.Count - 1 do
        if (Max(Images[AIndex].SourceImages[I].Image.Width, Images[AIndex].SourceImages[I].Image.Height) >=
           Max(AWidth, AHeight)) or (I = Images[AIndex].SourceImages.Count - 1) then
          Exit(I);
    end;
  end;
end;

function TImageCollection.GetSourceImage(AIndex: Integer; AWidth, AHeight: Integer): TWICImage;
var
  FIndex: Integer;
begin
  if AIndex < 0 then
    Result := nil
  else
  begin
    FIndex := GetSourceImageIndex(AIndex, AWidth, AHeight);
    if FIndex >= 0 then
      Result := Images[AIndex].SourceImages[FIndex].FImage
    else
      Result := nil;
  end;
end;

function TImageCollection.GetScaledImage(ASourceImage: TWICImage; ANewWidth, ANewHeight: Integer): TWICImage;
const
  IMMode: array[TImageCollectionInterpolationMode] of Integer =
    (WICBitmapInterpolationModeHighQualityCubic,
     WICBitmapInterpolationModeFant,
     WICBitmapInterpolationModeLinear,
     WICBitmapInterpolationModeCubic,
     WICBitmapInterpolationModeNearestNeighbor);
var
  Factory: IWICImagingFactory;
  Scaler: IWICBitmapScaler;
begin
  Result := TWICImage.Create;
  Factory := Result.ImagingFactory;
  Factory.CreateBitmapScaler(Scaler);
  Scaler.Initialize(ASourceImage.Handle, ANewWidth, ANewHeight, IMMode[FInterpolationMode]);
  Result.Handle := IWICBitmap(Scaler);
  Scaler := nil;
  Factory := nil;
end;

function TImageCollection.GetBitmap(AIndex: Integer; AWidth, AHeight: Integer): TBitmap;
var
  SourceImage: TWICImage;
  BufferImage: TWICImage;
begin
  Result := nil;
  if AIndex < 0 then
    Exit;

  SourceImage := GetSourceImage(AIndex, AWidth, AHeight);
  if SourceImage <> nil then
  if Assigned(FOnGetBitmap) then
    FOnGetBitmap(SourceImage, AWidth, AHeight, Result)
  else
  begin
    Result := TBitmap.Create;
    if (SourceImage.Width = AWidth) and (SourceImage.Height = AHeight) then
    begin
      Result.Assign(SourceImage);
      if Result.PixelFormat = pf32bit then
        Result.AlphaFormat := afIgnored;
    end
    else
    begin
      BufferImage := GetScaledImage(SourceImage, AWidth, AHeight);
      try
        Result.Assign(BufferImage);
        if Result.PixelFormat = pf32bit then
          Result.AlphaFormat := afIgnored;
      finally
        BufferImage.Free;
      end;
    end;
  end;
end;

function TImageCollection.GetBitmap(const AName: String; AWidth, AHeight: Integer; AEnabled: Boolean = True): TBitmap;
begin
  Result := GetBitmap(GetIndexByName(AName), AWidth, AHeight);
end;

procedure TImageCollection.DrawSource(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; ASourceIndex: Integer; AProportional: Boolean = False);
var
  SourceImage, BufferImage: TWICImage;
begin
  if ARect.IsEmpty then
    Exit;

  SourceImage := GetSourceImageByIndex(AIndex, ASourceIndex);
  if SourceImage <> nil then
  begin
    if AProportional then
      ARect := UpdateRectForProportionalSize(ARect, SourceImage.Width, SourceImage.Height, False);
    BufferImage := GetScaledImage(SourceImage, ARect.Width, ARect.Height);
    try
      ACanvas.Draw(ARect.Left, ARect.Top, BufferImage);
    finally
      BufferImage.Free;
    end;
  end;
end;

procedure TImageCollection.DoDraw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean);
var
  SourceImage, BufferImage: TWICImage;
begin
  if ARect.IsEmpty then
    Exit;

  SourceImage := GetSourceImage(AIndex, ARect.Width, ARect.Height);
  if SourceImage <> nil then
  begin
    if AProportional then
      ARect := UpdateRectForProportionalSize(ARect, SourceImage.Width, SourceImage.Height, True);
    BufferImage := GetScaledImage(SourceImage, ARect.Width, ARect.Height);
    try
      ACanvas.Draw(ARect.Left, ARect.Top, BufferImage);
    finally
      BufferImage.Free;
    end;
  end;
end;

procedure TImageCollection.Draw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean = False);
begin
  if Assigned(FOnDraw) then
    FOnDraw(GetSourceImage(AIndex, ARect.Width, ARect.Height), ACanvas, ARect, AProportional)
  else
    DoDraw(ACanvas, ARect, AIndex, AProportional);
end;

procedure TImageCollection.Draw(ACanvas: TCanvas; ARect: TRect; const AName: String; AProportional: Boolean = False);
begin
  if Assigned(FOnDraw) then
    FOnDraw(GetSourceImage(GetIndexByName(AName), ARect.Width, ARect.Height),
      ACanvas, ARect, AProportional)
  else
    DoDraw(ACanvas, ARect, GetIndexByName(AName), AProportional);
end;


procedure TImageCollection.Assign(Source: TPersistent);
begin
  if Source is TImageCollection then
  begin
    FInterpolationMode := TImageCollection(Source).InterpolationMode;
    LoadFromCollection(TImageCollection(Source));
  end
  else
    inherited;
end;

procedure TImageCollection.LoadFromCollection(AImageCollection: TImageCollection);
var
  I, J: Integer;
  Item: TImageCollectionItem;
  SourceItem: TImageCollectionSourceItem;
begin
  FImages.BeginUpdate;
  try
    FImages.Clear;
    for I := 0 to AImageCollection.Count - 1 do
    begin
      Item := FImages.Add;
      Item.Name := AImageCollection.Images[I].Name;
      for J := 0 to AImageCollection.Images[I].SourceImages.Count - 1 do
      begin
        SourceItem := FImages[I].SourceImages.Add;
        SourceItem.FImage.Assign(AImageCollection.Images[I].SourceImages[J].FImage);
      end;
    end;
  finally
    FImages.EndUpdate;
    Change;
  end;
end;

initialization

  StartClassGroup(TControl);
  ActivateClassGroup(TControl);
  GroupDescendentsWith(TImageCollection, Vcl.Controls.TControl);

end.
