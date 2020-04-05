{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.BaseImageCollection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics, System.Messaging;

type
  /// <summary>
  /// TCustomImageCollection is a base class for image collection.
  /// </summary>
  TCustomImageCollection = class(TComponent)
  private
    FOnChange: TNotifyEvent;
  protected
    function GetCount: Integer; virtual;
    procedure DoChange; virtual;
  public
    /// <summary>
    /// Call Change method if collection was changed.
    /// </summary>
    procedure Change;
    /// <summary>
    /// Use IsIndexAvailable to detect that item with specific index is available in collection
    /// and ready to use.
    /// </summary>
    function IsIndexAvailable(AIndex: Integer): Boolean; virtual;
    /// <summary>
    ///  Get item name from specific index.
    /// </summary>
    function GetNameByIndex(AIndex: Integer): String; virtual;
    /// <summary>
    /// Get item index from specific name.
    /// </summary>
    function GetIndexByName(const AName: String): Integer; virtual;
    /// <summary>
    ///  Get TBitmap from item with specific index.
    /// </summary>
    function GetBitmap(AIndex: Integer; AWidth, AHeight: Integer): TBitmap; overload; virtual;
    /// <summary>
    /// Draw images from collection to TCanvas.
    /// </summary>
    procedure Draw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean = False); overload; virtual;
    /// <summary>
    /// Count of items in collection.
    /// </summary>
    property Count: Integer read GetCount;
  published
    property OnChange: TNotifyEvent
      read FOnChange write FOnChange;
  end;

  /// <summary>
  /// TImageCollectionChangedMessage is a base message, which image collection sends to subcribers
  /// about that all collection is changed or some item with specific index changed.
  /// </summary>
  TImageCollectionChangedMessage = class(System.Messaging.TMessage)
  private
    FCollection: TCustomImageCollection;
    FIndex: Integer;
    FName: String;
  public
    property Collection: TCustomImageCollection read FCollection;
    property Index: Integer read FIndex;
    property Name: String read FName;
    constructor Create(ACollection: TCustomImageCollection; AIndex: Integer; const AName: String);
  end;

  /// <summary>
  /// Get Category name from item name.
  /// Category name is separated by the symbol "\".
  /// </summary>
  function ExtractImageCollectionCategory(const S: String): String;
  /// <summary>
  /// Get name of the item without Category.
  /// </summary>
  function ExtractImageCollectionName(const S: String): String;

implementation
  Uses System.SysUtils;

function ExtractImageCollectionName(const S: String): String;
begin
  Result := S.SubString(S.IndexOf('\') + 1);
end;

function ExtractImageCollectionCategory(const S: String): String;
begin
  Result := S.Substring(0, S.IndexOf('\'));
end;

procedure TCustomImageCollection.DoChange;
begin
  TMessageManager.DefaultManager.SendMessage(nil,
    TImageCollectionChangedMessage.Create(Self, -1, ''));
end;

procedure TCustomImageCollection.Change;
begin
  DoChange;
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TCustomImageCollection.GetNameByIndex(AIndex: Integer): String;
begin
  Result := '';
end;

function TCustomImageCollection.GetIndexByName(const AName: String): Integer;
begin
  Result := -1;
end;

function TCustomImageCollection.GetCount: Integer;
begin
  Result := 0;
end;

function TCustomImageCollection.IsIndexAvailable(AIndex: Integer): Boolean;
begin
  Result := False;
end;

function TCustomImageCollection.GetBitmap(AIndex: Integer; AWidth, AHeight: Integer): TBitmap;
begin
  Result := nil;
end;

procedure TCustomImageCollection.Draw(ACanvas: TCanvas; ARect: TRect; AIndex: Integer; AProportional: Boolean = False);
begin
end;

constructor TImageCollectionChangedMessage.Create(ACollection: TCustomImageCollection; AIndex: Integer; const AName: String);
begin
  inherited Create;
  FCollection := ACollection;
  FIndex := AIndex;
  FName := AName;
end;

end.
