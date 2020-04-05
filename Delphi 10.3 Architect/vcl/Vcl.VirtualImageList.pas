{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2018-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.VirtualImageList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  System.Messaging, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ImgList,
  Vcl.BaseImageCollection;

type
  TVirtualImageList = class;

  /// <summary>
  /// Item to define image for TVirtualImageList.
  /// </summary>
  TVirtualImageListItem = class(TCollectionItem)
  private
    FName: String;
    FCollectionIndex: Integer;
    FCollectionName: String;
    FDisabled: Boolean;
    FDisabledBitmap: TBitmap;
    procedure SetDisabled(AValue: Boolean);
    procedure SetCollectionIndex(AValue: Integer);
    procedure SetCollectionName(const AValue: String);
    procedure SetName(const AValue: String);
    function GetImageList: TVirtualImageList;
    function GetDisabledBitmap: TBitmap;
  protected
    function CheckCollectionItem: Boolean;
    procedure UpdateDisabledBitmap;
    property ImageList: TVirtualImageList read GetImageList;
    property DisabledBitmap: TBitmap read GetDisabledBitmap;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    /// <summary>
    /// Use Update method to mannual update image list bitmaps for current item.
    /// </summary>
    procedure Update;
  published
    /// <summary>
    /// Index of linked item from image collection.
    /// </summary>
    property CollectionIndex: Integer
      read FCollectionIndex write SetCollectionIndex;
    /// <summary>
    /// Name of linked item from image collection.
    /// </summary>
    property CollectionName: String
      read FCollectionName write SetCollectionName;
    /// <summary>
    /// Defines disabled copy of item from image collection.
    /// </summary>
    property Disabled: Boolean
      read FDisabled write SetDisabled;
    /// <summary>
    /// Item name, which can includes Category.
    /// Category name placed at the beginning of the name and separated by the symbol "\".
    /// </summary>
    property Name: String read FName write SetName;
  end;

  /// <summary>
  /// Collection of items, whcih defines list of images
  /// </summary>
  TVirtualImageListItems = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TVirtualImageListItem;
    procedure SetItem(Index: Integer; Value: TVirtualImageListItem);
  protected
    function GetImageList: TVirtualImageList;
    property ImageList: TVirtualImageList read GetImageList;
  public
    function Add: TVirtualImageListItem;
    function Insert(Index: Integer): TVirtualImageListItem;
    procedure Delete(Index: Integer);
    property Items[Index: Integer]: TVirtualImageListItem read GetItem write SetItem; default;
  end;

  /// <summary>
  /// Type, which defines auto fill mode for TVirtualImageList
  /// </summary>
  TImageListAutoFillMode = (afmNormal, afmDisabled);

  /// <summary>
  /// TVirtualImageList component, which
  /// inherited from TCustomImageList and use TCustomImageCollection to dynamicly create list of internal images.
  /// It has collection of items, in which each item linked by index and name with TCustomImageCollection.
  /// </summary>
  TVirtualImageList = class(TCustomImageList)
  private
    FDPIChangedMessageID: Integer;
    FCollectionChangedMessageID: Integer;
    FImageCollection: TCustomImageCollection;
    FImages: TVirtualImageListItems;
    FDisabledGrayscale: Boolean;
    FDisabledOpacity: Byte;
    FDisabledSuffix: String;
    FImageListUpdating: Boolean;
    FScaled: Boolean;
    FPreserveItems: Boolean;
    FAutoFill: Boolean;
    FAutoFillMode: TImageListAutoFillMode;
    procedure SetAutoFill(Value: Boolean);
    procedure SetAutoFillMode(Value: TImageListAutoFillMode);
    procedure SetPreserveItems(Value: Boolean);
    procedure SetDisabledSuffix(Value: String);
    procedure SetDisabledGrayscale(Value: Boolean);
    procedure SetDisabledOpacity(Value: Byte);
    procedure SetImageCollection(Value: TCustomImageCollection);
    procedure DPIChangedMessageHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
    procedure CollectionChangedMessageHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
  protected
    procedure Loaded; override;
    procedure DoChange; override;
    procedure DoAutoFill;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CreateBlankBitmap: TBitmap; virtual;
    procedure UpdateDisabledBitmaps;
    procedure CreateDisabledBitmap(ABitmap: TBitmap);
    function IsImageCollectionAvailable: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    /// <summary>
    /// Get item index from specific name.
    /// </summary>
    function GetIndexByName(const AName: String): Integer; virtual;

    /// <summary>
    /// Call UpdateImageList to mannual recreate internal image list from item colleciton (Images property).
    /// </summary>
    procedure UpdateImageList;

    /// <summary>
    /// Delete all items from Images property.
    /// </summary>
    procedure Clear;
    /// <summary>
    /// Delete item with specific index from Images property.
    /// </summary>
    procedure Delete(AIndex: Integer); overload;
    /// <summary>
    /// Delete item with specific name from Images property.
    /// </summary>
    procedure Delete(const AName: String); overload;

    /// <summary>
    /// Add items from image colleciton using start and end item indexes.
    /// if ACategory set then items will be added only with this category.
    /// if AddDisabledCopies then disabled copies will be added also.
    /// </summary>
    procedure Add(const ACategory: String; AStartIndex, AEndIndex: Integer; AddDisabledCopies: Boolean = False); overload;
    /// <summary>
    /// Add item from image collection with specifc name and image collection item index.
    /// if AddDisabledCopies then disabled copy will be added also.
    /// </summary>
    procedure Add(AName: String; ACollectionIndex: Integer; AddDisabledCopy: Boolean = False); overload;
    /// <summary>
    /// Add item from image collection with specifc name and image collection item name.
    /// if AddDisabledCopies then disabled copy will be added also.
    /// </summary>
    procedure Add(AName: String; const ACollectionName: String; AddDisabledCopy: Boolean = False); overload;
    /// <summary>
    /// Add items as disabled copies from image colleciton using start and end item indexes.
    /// if ACategory set then items will be added only with this category.
    /// </summary>
    procedure AddDisabled(const ACategory: String; AStartIndex, AEndIndex: Integer); overload;
    /// <summary>
    /// Add item as disabled copy from image colleciton using specifc name and image collection item index.
    /// </summary>
    procedure AddDisabled(AName: String; ACollectionIndex: Integer); overload;
    /// <summary>
    /// Add item as disabled copy from image colleciton using specifc name and image collection item name.
    /// </summary>
    procedure AddDisabled(AName: String; const ACollectionName: String); overload;
    /// <summary>
    /// Insert item from image collection with specifc index, name and image collection item index.
    /// if AddDisabledCopies then disabled copy will be added also.
    /// </summary>
    procedure Insert(AIndex: Integer; AName: String; ACollectionIndex: Integer; AddDisabledCopy: Boolean = False); overload;
    /// <summary>
    /// Insert item from image collection with specifc index, name and image collection item name.
    /// if AddDisabledCopies then disabled copy will be added also.
    /// </summary>
    procedure Insert(AIndex: Integer; AName: String; const ACollectionName: String; AddDisabledCopy: Boolean = False); overload;
    /// <summary>
    /// Insert item as disabled copy from image collection with specifc index, name and image collection item index.
    /// </summary>
    procedure InsertDisabled(AIndex: Integer; AName: String; ACollectionIndex: Integer); overload;
    /// <summary>
    /// Insert item as disabled copy from image collection with specifc index, name and image collection item name.
    /// </summary>
    procedure InsertDisabled(AIndex: Integer; AName: String; const ACollectionName: String); overload;

    procedure DoDraw(Index: Integer; Canvas: TCanvas; X, Y: Integer;
       Style: Cardinal; Enabled: Boolean = True); override;

    /// <summary>
    /// Draw image from image list with specific item name.
    /// </summary>
    procedure Draw(Canvas: TCanvas; X, Y: Integer; Name: String;
      Enabled: Boolean = True); overload;
  published
    /// <summary>
    /// Auto fill all items from collection
    /// </summary>
    property AutoFill: Boolean
      read FAutoFill write SetAutoFill default False;
    /// <summary>
    /// Auto fill mode to load normal or disabled images from collection
    /// </summary>
    property AutoFillMode: TImageListAutoFillMode
      read FAutoFillMode write SetAutoFillMode default afmNormal;
    /// <summary>
    /// Defines opacity of image if Item.Disabled
    /// </summary>
    property DisabledOpacity: Byte read FDisabledOpacity write SetDisabledOpacity default 125;
    /// <summary>
    /// Defines grayscale of image if Item.Disabled
    /// </summary>
    property DisabledGrayscale: Boolean
      read FDisabledGrayScale write SetDisabledGrayscale;
    /// <summary>
    /// Defines suffix for Item name if Item.Disabled
    /// </summary>
    property DisabledSuffix: String
      read FDisabledSuffix write SetDisabledSuffix;
    /// <summary>
    /// Collection of items, which defines image list.
    /// </summary>
    property Images: TVirtualImageListItems
      read FImages write FImages;
    /// <summary>
    /// Image collection component, which uses as source for images.
    /// </summary>
    property ImageCollection: TCustomImageCollection
      read FImageCollection write SetImageCollection;
    /// <summary>
    /// Preserve items when collection changed
    /// </summary>
    property PreserveItems: Boolean
      read FPreserveItems write SetPreserveItems default False;
    /// <summary>
    /// Enable and disable scaling with form
    /// </summary>
    property Scaled: Boolean read FScaled write FScaled default True;
    property Width;
    property Height;
  end;

implementation
  Uses System.UITypes, Winapi.CommCtrl;

const
  DefaultDisabledSuffix = '_Disabled';

type
  PColorRecArray = ^TColorRecArray;
  TColorRecArray = array [0..0] of TColorRec;

constructor TVirtualImageListItem.Create(Collection: TCollection);
var
  B: TBitmap;
begin
  inherited Create(Collection);
  FCollectionIndex := -1;
  FName := '';
  if (ImageList <> nil) and not (csLoading in ImageList.ComponentState) then
  begin
    B := ImageList.CreateBlankBitmap;
    try
      ImageList_Add(ImageList.Handle, B.Handle, 0);
    finally
      B.Free;
    end;
  end;
end;

destructor TVirtualImageListItem.Destroy;
begin
  if FDisabledBitmap <> nil then
    FDisabledBitmap.Free;
  if (ImageList <> nil) and not (csDestroying in ImageList.ComponentState) and
     (Index >= 0) and (Index < ImageList.Count) then
    ImageList_Remove(ImageList.Handle, Index);
  inherited;
end;

function TVirtualImageList.CreateBlankBitmap: TBitmap;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf32bit;
  Result.SetSize(Width, Height);
end;

function TVirtualImageListItem.GetDisabledBitmap: TBitmap;
begin
  if (FDisabledBitmap = nil) and (ImageList.ImageCollection <> nil) then
  begin
    FDisabledBitmap := ImageList.ImageCollection.GetBitmap(FCollectionIndex,
      ImageList.Width, ImageList.Height);
    ImageList.CreateDisabledBitmap(FDisabledBitmap);
  end;
  Result := FDisabledBitmap;
end;

procedure TVirtualImageListItem.UpdateDisabledBitmap;
begin
  if FDisabledBitmap <> nil then
  begin
    FreeAndNil(FDisabledBitmap);
    GetDisabledBitmap;
  end;
end;

function TVirtualImageListItem.CheckCollectionItem: Boolean;
var
  FItemIndex: Integer;
begin
  Result := False;
  if (FCollectionName <> '') and (ImageList.ImageCollection <> nil) then
    if (not ImageList.ImageCollection.IsIndexAvailable(FCollectionIndex)) or
       (ImageList.ImageCollection.IsIndexAvailable(FCollectionIndex) and
       (FCollectionName <> ImageList.ImageCollection.GetNameByIndex(FCollectionIndex)))
    then
    begin
      FItemIndex := ImageList.ImageCollection.GetIndexByName(FCollectionName);
      if FItemIndex >= 0 then
        FCollectionIndex := FItemIndex
      else
        FCollectionName := ImageList.ImageCollection.GetNameByIndex(FCollectionIndex);
      Result := True;
    end;
end;

function TVirtualImageListItem.GetImageList: TVirtualImageList;
begin
  Result := TVirtualImageListItems(Collection).ImageList;
end;

procedure TVirtualImageListItem.Update;
var
  B: TBitmap;
begin
  if (ImageList.ImageCollection <> nil) and
    ImageList.ImageCollection.IsIndexAvailable(FCollectionIndex) then
  begin
    B := ImageList.ImageCollection.GetBitmap(FCollectionIndex,
      ImageList.Width, ImageList.Height);
    if B <> nil then
    begin
      if FDisabled then
        ImageList.CreateDisabledBitmap(B);
      ImageList_Replace(ImageList.Handle, Index, B.Handle, 0);
      B.Free;
    end;
    UpdateDisabledBitmap;
  end;
end;

procedure TVirtualImageListItem.SetDisabled(AValue: Boolean);
var
  I: Integer;
begin
  if FDisabled <> AValue then
  begin
    FDisabled := AValue;
    Update;
    if FName <> '' then
    begin
      I := Pos(ImageList.DisabledSuffix, FName);
      if Disabled and (I < 1) then
        FName := FName + ImageList.DisabledSuffix
      else
      if not Disabled and (I > 1) then
        Delete(FName, I, Length(ImageList.DisabledSuffix));
    end;
  end;
end;

procedure TVirtualImageListItem.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TVirtualImageListItem.SetCollectionIndex(AValue: Integer);
begin
  if AValue <> FCollectionIndex then
  begin
    FCollectionIndex := AValue;
    if ImageList.ImageCollection <> nil then
    begin
      FCollectionName := ImageList.ImageCollection.GetNameByIndex(FCollectionIndex);
      FName := FCollectionName;
      if FDisabled then
        FName := FName + ImageList.DisabledSuffix;
    end;
    Update;
  end;
end;

procedure TVirtualImageListItem.SetCollectionName(const AValue: String);
begin
  if FCollectionName <> AValue then
  begin
    FCollectionName := AValue;
    FName := AValue;
    if FDisabled then
      FName := FName + ImageList.DisabledSuffix;
    if (AValue <> '') and (ImageList.ImageCollection <> nil) then
      FCollectionIndex := ImageList.ImageCollection.GetIndexByName(FCollectionName);
    Update;
  end;
end;

function TVirtualImageListItems.GetImageList: TVirtualImageList;
begin
  Result := TVirtualImageList(Owner);
end;

function TVirtualImageListItems.GetItem(Index: Integer): TVirtualImageListItem;
begin
  Result := TVirtualImageListItem(inherited GetItem(Index));
end;

procedure TVirtualImageListItems.SetItem(Index: Integer; Value: TVirtualImageListItem);
begin
  inherited SetItem(Index, Value);
end;

function TVirtualImageListItems.Add: TVirtualImageListItem;
begin
  Result := TVirtualImageListItem(inherited Add);
end;

function TVirtualImageListItems.Insert(Index: Integer): TVirtualImageListItem;
var
  I: Integer;
begin
  Result := TVirtualImageListItem(inherited Insert(Index));
  if ImageList.Count > 1 then
    for I := ImageList.Count - 2 downto Index do
      ImageList_Copy(ImageList.Handle, I, ImageList.Handle, I + 1, ILCF_SWAP);
end;

procedure TVirtualImageListItems.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

constructor TVirtualImageList.Create(AOwner: TComponent);
begin
  inherited;
  FDisabledSuffix := DefaultDisabledSuffix;
  StoreBitmap := False;
  FPreserveItems := False;
  FAutoFill := False;
  FAutoFillMode := afmNormal;
  FDisabledOpacity := 125;
  FScaled := True;
  ColorDepth := cd32bit;
  FImages := TVirtualImageListItems.Create(Self, TVirtualImageListItem);
  FDPIChangedMessageID := TMessageManager.DefaultManager.SubscribeToMessage(TChangeScaleMessage, DPIChangedMessageHandler);
  FCollectionChangedMessageID := TMessageManager.DefaultManager.SubscribeToMessage(TImageCollectionChangedMessage, CollectionChangedMessageHandler);
end;

destructor TVirtualImageList.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TChangeScaleMessage, FDPIChangedMessageID);
  TMessageManager.DefaultManager.Unsubscribe(TImageCollectionChangedMessage, FCollectionChangedMessageID);
  FImages.Free;
  inherited;
end;

procedure TVirtualImageList.Assign(Source: TPersistent);
var
  I: Integer;
  IL: TVirtualImageList;
  Item: TVirtualImageListItem; 
begin
  if Source is TVirtualImageList then
  begin
    IL := TVirtualImageList(Source);
    FImageCollection := IL.ImageCollection;
    FDisabledOpacity := IL.DisabledOpacity;
    FDisabledGrayscale := IL.DisabledGrayscale;
    FDisabledSuffix := IL.DisabledSuffix;
    FAutoFill := IL.AutoFill;
    FAutoFillMode := IL.AutoFillMode;
    FImageListUpdating := True;
    try
      FImages.Clear;
      for I := 0 to IL.Images.Count - 1 do
      begin
        Item := FImages.Add;
        Item.FDisabled := IL.Images[I].Disabled;
        Item.CollectionIndex := IL.Images[I].CollectionIndex;
        Item.Name := IL.Images[I].Name;
      end;
    finally
      Change;
      FImageListUpdating := False;
    end;
  end
  else
    inherited;
end;

procedure TVirtualImageList.Clear;
begin
  FImageListUpdating := True;
  try
    FImages.Clear;
    Change;
  finally
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.Delete(AIndex: Integer);
begin
  if (AIndex < 0) or (AIndex > FImages.Count - 1) then
    Exit;

  FImageListUpdating := True;
  try
    FImages.Delete(AIndex);
  finally
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.Delete(const AName: String);
begin
  FImages.Delete(GetIndexByName(AName));
end;

function TVirtualImageList.IsImageCollectionAvailable: Boolean;
begin
  Result := (FImageCollection <> nil) and (FImageCollection.Count > 0);
end;

procedure TVirtualImageList.DoAutoFill;
begin
  case FAutoFillMode of
    afmNormal:
      Add('', -1, -1, False);
    afmDisabled:
      AddDisabled('', -1, -1);
  end;
end;

procedure TVirtualImageList.Add(const ACategory: String; AStartIndex, AEndIndex: Integer; AddDisabledCopies: Boolean = False);
var
  I: Integer;
  Item: TVirtualImageListItem;
  S: String;
begin
  if not IsImageCollectionAvailable then
    Exit;

  if (ACategory = '') and ( AStartIndex < 0) and (AEndIndex < 0) and (FImages.Count > 0) then
  begin
    FImages.Clear;
    ImageList_Remove(Handle, -1);
  end;

  if AStartIndex < 0 then
    AStartIndex := 0;
  if (AEndIndex < 0) or (AEndIndex > FImageCollection.Count - 1) then
    AEndIndex := FImageCollection.Count - 1;
  FImageListUpdating := True;
  BeginUpdate;
  try
    for I := AStartIndex to AEndIndex do
    begin
      S := FImageCollection.GetNameByIndex(I);
      if (ACategory = '') or
         (LowerCase(ACategory) = LowerCase(ExtractImageCollectionCategory(S))) then
      begin
        Item := FImages.Add;
        Item.FName := S;
        Item.CollectionIndex := I;
        if AddDisabledCopies then
        begin
          Item := FImages.Add;
          Item.FName := S + FDisabledSuffix;
          Item.FDisabled := True;
          Item.CollectionIndex := I;
        end;
      end;
    end;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.Add(AName: String; ACollectionIndex: Integer; AddDisabledCopy: Boolean = False);
var
  Item: TVirtualImageListItem;
begin
  if not IsImageCollectionAvailable or not FImageCollection.IsIndexAvailable(ACollectionIndex) then
     Exit;

  FImageListUpdating := True;
  BeginUpdate;
  try
    if AName = '' then
      AName := ExtractImageCollectionName(FImageCollection.GetNameByIndex(ACollectionIndex));
    Item := FImages.Add;
    Item.CollectionIndex := ACollectionIndex;
    Item.FName := AName;
    if AddDisabledCopy then
    begin
      Item := FImages.Add;
      Item.CollectionIndex := ACollectionIndex;
      Item.FName := AName + FDisabledSuffix;
      Item.FDisabled := True;
    end;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.Add(AName: String; const ACollectionName: String; AddDisabledCopy: Boolean = False);
begin
  Add(AName, FImageCollection.GetIndexByName(ACollectionName), AddDisabledCopy);
end;

procedure TVirtualImageList.Insert(AIndex: Integer; AName: String; ACollectionIndex: Integer; AddDisabledCopy: Boolean = False);
var
  Item: TVirtualImageListItem;
begin
  if not IsImageCollectionAvailable or not FImageCollection.IsIndexAvailable(ACollectionIndex) or
     (AIndex < 0) or (AIndex > FImages.Count - 1) then
    Exit;

  FImageListUpdating := True;
  BeginUpdate;
  try
    if AName = '' then
      AName := ExtractImageCollectionName(FImageCollection.GetNameByIndex(ACollectionIndex));

    if AddDisabledCopy then
    begin
      Item := FImages.Insert(AIndex);
      Item.CollectionIndex := ACollectionIndex;
      Item.FName := AName + FDisabledSuffix;
      Item.FDisabled := True;
    end;
    Item := FImages.Insert(AIndex);
    Item.CollectionIndex := ACollectionIndex;
    Item.FName := AName;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.Insert(AIndex: Integer; AName: String; const ACollectionName: String; AddDisabledCopy: Boolean = False);
begin
  Insert(AIndex, AName, FImageCollection.GetIndexByName(ACollectionName), AddDisabledCopy);
end;

procedure TVirtualImageList.AddDisabled(const ACategory: String; AStartIndex, AEndIndex: Integer);
var
  I: Integer;
  Item: TVirtualImageListItem;
  S: String;
begin
  if not IsImageCollectionAvailable then
    Exit;

  if (ACategory = '') and (AStartIndex < 0) and (AEndIndex < 0) and (FImages.Count > 0) then
  begin
    FImages.Clear;
    ImageList_Remove(Handle, -1);
  end;

  if AStartIndex < 0 then
    AStartIndex := 0;
  if (AEndIndex < 0) or (AEndIndex > FImageCollection.Count - 1) then
    AEndIndex := FImageCollection.Count - 1;

  FImageListUpdating := True;
  BeginUpdate;
  try
    for I := AStartIndex to AEndIndex do
    begin
      S := FImageCollection.GetNameByIndex(I);
      if (ACategory = '') or
         (LowerCase(ACategory) = LowerCase(ExtractImageCollectionCategory(S))) then
      begin
        Item := FImages.Add;
        Item.CollectionIndex := I;
        Item.FName := S;
        Item.FDisabled := True;
      end;
    end;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;


procedure TVirtualImageList.AddDisabled(AName: String; ACollectionIndex: Integer);
var
  Item: TVirtualImageListItem;
begin
  if not IsImageCollectionAvailable or not FImageCollection.IsIndexAvailable(ACollectionIndex) then
    Exit;

  FImageListUpdating := True;
  BeginUpdate;
  try
    if AName = '' then
      AName := ExtractImageCollectionName(FImageCollection.GetNameByIndex(ACollectionIndex));
    Item := FImages.Add;
    Item.CollectionIndex := ACollectionIndex;
    Item.FName := AName + FDisabledSuffix;
    Item.FDisabled := True;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.AddDisabled(AName: String; const ACollectionName: String);
begin
  AddDisabled(AName, FImageCollection.GetIndexByName(ACollectionName));
end;

procedure TVirtualImageList.InsertDisabled(AIndex: Integer; AName: String; ACollectionIndex: Integer);
var
  Item: TVirtualImageListItem;
begin
  if not IsImageCollectionAvailable or not FImageCollection.IsIndexAvailable(ACollectionIndex) or
     (AIndex < 0) or (AIndex > FImages.Count - 1) then
    Exit;

  FImageListUpdating := True;
  BeginUpdate;
  try
    if AName = '' then
      AName := ExtractImageCollectionName(FImageCollection.GetNameByIndex(ACollectionIndex));
    Item := FImages.Insert(AIndex);
    Item.CollectionIndex := ACollectionIndex;
    Item.FName := AName + FDisabledSuffix;
    Item.FDisabled := True;
  finally
    EndUpdate;
    Change;
    FImageListUpdating := False;
  end;
end;

procedure TVirtualImageList.InsertDisabled(AIndex: Integer; AName: String; const ACollectionName: String);
begin
  InsertDisabled(AIndex, AName, FImageCollection.GetIndexByName(ACollectionName));
end;

procedure TVirtualImageList.DPIChangedMessageHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
var
  W, H: Integer;
begin
  if FScaled and (TChangeScaleMessage(Msg).Sender = Owner) then
  begin
    W := MulDiv(Width, TChangeScaleMessage(Msg).M, TChangeScaleMessage(Msg).D);
    H := MulDiv(Height, TChangeScaleMessage(Msg).M, TChangeScaleMessage(Msg).D);
    FScaling := True;
    try
      SetSize(W, H);
    finally
      FScaling := False;
    end;
  end;
end;

procedure TVirtualImageList.CollectionChangedMessageHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
var
  I: Integer;
  ColIndex, IndexFromCol: Integer;
  ColName: String;
begin
  if TImageCollectionChangedMessage(Msg).Collection = FImageCollection then
  begin
    if FAutoFill then
      DoAutoFill
    else
    if TImageCollectionChangedMessage(Msg).Index < 0 then
      Change
    else
    begin
      ColIndex := TImageCollectionChangedMessage(Msg).Index;
      ColName := TImageCollectionChangedMessage(Msg).Name;
      FImageListUpdating := True;
      try
        for I := 0 to FImages.Count - 1 do
          if FImages[I].CollectionIndex = ColIndex then
            if FImages[I].CollectionName = ColName then
              FImages[I].Update
            else
            if ColName <> '' then
            begin
              IndexFromCol := TImageCollectionChangedMessage(Msg).Collection.GetIndexByName(ColName);
              if IndexFromCol = FImages[I].CollectionIndex then
              begin
                FImages[I].CollectionName := ColName;
                FImages[I].Update
              end
              else
              begin
                FImageListUpdating := False;
                Break;
              end;
            end;
      finally
        Change;
        FImageListUpdating := False;
      end;
    end;
  end;
end;

procedure TVirtualImageList.SetDisabledSuffix(Value: String);
var
  I, P: Integer;
begin
  if Value = '' then
    Value := DefaultDisabledSuffix;

  if FDisabledSuffix <> Value then
  begin
    for I := 0 to FImages.Count - 1 do
      if FImages[I].Disabled then
      begin
        P := Pos(FDisabledSuffix, FImages[I].Name);
        if P > 0 then
        begin
          System.Delete(FImages[I].FName, P, Length(FDisabledSuffix));
          FImages[I].FName := FImages[I].FName + Value;
        end;
      end;
    FDisabledSuffix := Value;
  end;
end;

procedure TVirtualImageList.SetDisabledGrayscale(Value: Boolean);
begin
  if FDisabledGrayscale <> Value then
  begin
    FDisabledGrayscale := Value;
    UpdateDisabledBitmaps;
  end;
end;

procedure TVirtualImageList.SetDisabledOpacity(Value: Byte);
begin
  if (Value > 0) and (FDisabledOpacity <> Value) then
  begin
    FDisabledOpacity := Value;
    UpdateDisabledBitmaps;
  end;
end;

procedure TVirtualImageList.Loaded;
begin
  inherited;
  if FAutoFill then
    DoAutoFill
  else
    UpdateImageList;
end;

procedure TVirtualImageList.SetAutoFill(Value: Boolean);
begin
  if FAutoFill <> Value then
  begin
    FAutoFill := Value;
    if not (csLoading in ComponentState) and FAutoFill then
      DoAutoFill;
  end;
end;

procedure TVirtualImageList.SetAutoFillMode(Value: TImageListAutoFillMode);
begin
  if FAutoFillMode <> Value then
  begin
    FAutoFillMode := Value;
    if not (csLoading in ComponentState) and FAutoFill then
      DoAutoFill;
  end;
end;

procedure TVirtualImageList.SetPreserveItems(Value: Boolean);
begin
  if FPreserveItems <> Value then
  begin
    FPreserveItems := Value;
    if not FPreserveItems and (FImageCollection = nil) and (Images.Count > 0) then
       Clear;
  end;
end;

procedure TVirtualImageList.SetImageCollection(Value: TCustomImageCollection);
var
  CanClear: Boolean;
begin
  if FImageCollection <> Value then
  begin
    CanClear := not FPreserveItems and ((FImageCollection <> nil) or (Value = nil));
    FImageCollection := Value;
    if not (csLoading in ComponentState) then
    begin
      if CanClear then
        Images.Clear;
      if FAutoFill then
        DoAutoFill
      else
        UpdateImageList;
    end;
  end;
end;

procedure TVirtualImageList.CreateDisabledBitmap(ABitmap: TBitmap);
var
  I: Integer;
  Src: Pointer;
  Gray: Byte;
begin
  {$RANGECHECKS OFF}
  Src := ABitmap.Scanline[ABitmap.Height - 1];
  for I := 0 to ABitmap.Width * ABitmap.Height - 1 do
  begin
    if FDisabledOpacity < 255 then
      PColorRecArray(Src)[I].A := Round(PColorRecArray(Src)[I].A * FDisabledOpacity / 255);
    if FDisabledGrayscale then
    begin
      Gray := Round(
       (0.299 * PColorRecArray(Src)[I].R) +
       (0.587 * PColorRecArray(Src)[I].G) +
       (0.114 * PColorRecArray(Src)[I].B));
      PColorRecArray(Src)[I].R := Gray;
      PColorRecArray(Src)[I].G := Gray;
      PColorRecArray(Src)[I].B := Gray;
    end;
  end;
  {$RANGECHECKS ON}
end;

procedure TVirtualImageList.UpdateDisabledBitmaps;
var
  I: Integer;
begin
  for I := 0 to FImages.Count - 1 do
    if FImages[I].Disabled then
      FImages[I].Update
    else
      FImages[I].UpdateDisabledBitmap;
end;

procedure TVirtualImageList.UpdateImageList;
var
  I: Integer;
  B: TBitmap;
begin
  ImageList_Remove(Handle, -1);
  if FImageCollection = nil then
    Exit;
  for I := 0 to FImages.Count - 1 do
  begin
    FImages[I].CheckCollectionItem;
    B := FImageCollection.GetBitmap(FImages[I].CollectionIndex,
      Width, Height);
    if B = nil then
      B := CreateBlankBitmap
    else
      if (B <> nil) and FImages[I].Disabled then
        CreateDisabledBitmap(B);
    try
      ImageList_Add(Handle, B.Handle, 0);
    finally
      B.Free;
    end;
    FImages[I].UpdateDisabledBitmap;
  end;
end;

function TVirtualImageList.GetIndexByName(const AName: String): Integer;
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

procedure TVirtualImageList.DoChange;
begin
  if not FImageListUpdating then
    UpdateImageList;
  inherited;
end;

procedure TVirtualImageList.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FImageCollection) then
    ImageCollection := nil;
end;

procedure TVirtualImageList.DoDraw(Index: Integer; Canvas: TCanvas; X, Y: Integer;
  Style: Cardinal; Enabled: Boolean = True);
var
  B: TBitmap;
  BF: TBlendFunction;
begin
  if (Index < 0) or (Index >= Count) or (Index >= Images.Count) then
    Exit;

  if Enabled then
    ImageList_Draw(Handle, Index, Canvas.Handle, X, Y, ILD_NORMAL)
  else
  begin
    B := Images[Index].DisabledBitmap;
    if B <> nil then
    begin
      B.AlphaFormat := afPremultiplied;
      BF.BlendOp := AC_SRC_OVER;
      BF.BlendFlags := 0;
      BF.SourceConstantAlpha := 255;
      BF.AlphaFormat := AC_SRC_ALPHA;
      Winapi.Windows.AlphaBlend(Canvas.Handle, X, Y, B.Width, B.Height,
        B.Canvas.Handle, 0, 0, B.Width, B.Height, BF);
    end
    else
      ImageList_Draw(Handle, Index, Canvas.Handle, X, Y, ILD_NORMAL);
  end;
end;

procedure TVirtualImageList.Draw(Canvas: TCanvas; X, Y: Integer; Name: String;
  Enabled: Boolean = True);
begin
  if HandleAllocated then
    DoDraw(GetIndexByName(Name), Canvas, X, Y, ILD_NORMAL, Enabled);
end;

end.
