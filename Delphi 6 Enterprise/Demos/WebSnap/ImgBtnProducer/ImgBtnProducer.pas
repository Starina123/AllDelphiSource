{*******************************************************}
{                                                       }
{       Borland Delphi Sample                           }
{                                                       }
{       Copyright (c) 2001 Inprise Corporation          }
{                                                       }
{*******************************************************}

(*

  TImageProducer provides button images on behalf of a TAdapterActionButton.  Assign
  to the TAdapterActionButton.ImageProducer property.

  Properties:
    CacheDir - Directory where .jpg files will be created.  May be a relative path.

    VirtualDir - Virtual directory mapped to the actual directory specified with the
      CacheDir property.  May be a relative path.  Uses at runtime only.

    FileLifeTime -
      Indicates when to recreate a .jpg file.   A .jpg file will be recreated when
      then the difference between the current time and the file creation time exceeds
      the lifetime value.  Used at runtime only.  If the minute and day values are zero,
      image files will not be recreated.

    Color, Font, Height, etc. - These properties are used to define the appearance
      of the buttons.  The button captions are defined by the TAdapterActionButton.

  Designtime behavior - While in design mode, .jpg files a are recreated when the
    properties such as color, font, and so forth are  changed.  Each time a file is
    recreated it is given a unique name so that the HTML preview will update
    (the preview won't update unless the generated HTML has changed).  When the
    TImageProducer is destroyed, it deletes all .jpg files that it has created.

  Runtime behavior - When the app is running, .jpg files are not recreated until they
    expires.  File expiration is calculated using the FileLifeTime property.  Changes
    made to the imageproducer component at designtime will not show at runtime until the
    .jpg is recreated.  To force recreation, delete the .jpg files from the CacheDir.
    The filenames created at runtime are different from the filenames used at designtime.
    .jpg files created at runtime are not deleted when the web app terminates.

  Changing the component - If you add any properties that affect the appearance, be sure
    to update TImageButtonAttributes.IsEqual.  Otherwise, the preview will not update
    as the properties are changed.

*)

unit ImgBtnProducer;

interface

uses Classes, Messages, HTTPApp, HTTPProd,
  WebComp, Contnrs, SysUtils, SiteComp, AdaptReq, Graphics, SyncObjs;

type

  TImageEvent = (evNone, evOver, evOut, evDown);

  // Implement WebSnap interfaces.
  // IWebVariableName, IGetScriptObject enable activescripting
  TBaseImageProducer = class(TComponent, IActionImageProducer, IImageProducer, IGetScriptObject, IWebVariableName)
  protected
    function WebImageHREF(AComponent: TComponent; const ACaption: WideString; AEvent: TImageEvent): string; virtual;
    procedure RenderAdapterImage(ARequest: IImageRequest;
      AResponse: IImageResponse); virtual;
    { IWebVariableName }
    function GetVariableName: string;
    { IGetScriptObject }
    function GetScriptObject: IDispatch;
    function ImplGetScriptObject: IDispatch; virtual;
    { IActionImageProducer }
    function GetAdapterImage(Sender: TComponent; const ACaption: WideString): IInterface;
    function GetDisplayStyle(Sender: TComponent): string;
    function GetAdapterEventImage(Sender: TComponent; const AEvent, ACaption: WideString): IInterface;
  end;

  // Object to manage image attributes.  We'll use this to keep a copy of the original attributes
  // so that we can update image files when attributes change.
  TImageButtonAttributes = class(TObject)
  private
    FHeight: Integer;
    FWidth: Integer;
    FColor: TColor;
    FFont: TFont;
    FBottomRightColor: TColor;
    FFocusColor: TColor;
    FTopLeftColor: TColor;
    procedure SetFont(const Value: TFont);
  public
    constructor Create;
    destructor Destroy; override;
    procedure CopyFrom(const AAttributes: TImageButtonAttributes);
    function IsEqual(const AAttributes: TImageButtonAttributes): Boolean;
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;
    property Color: TColor read FColor write FColor;
    property Font: TFont read FFont write SetFont;
    property TopLeftColor: TColor read FTopLeftColor write FTopLeftColor;
    property BottomRightColor: TColor read FBottomRightColor write FBottomRightColor;
    property FocusColor: TColor read FFocusColor write FFocusColor;
  end;

  // Image producer with button attributes
  TBaseImageButtonProducer = class(TBaseImageProducer)
  private
    FAttributes: TImageButtonAttributes;
    function GetColor: TColor;
    function GetHeight: Integer;
    function GetWidth: Integer;
    function GetTopLeftColor: TColor;
    function GetBottomRightColor: TColor;
    function GetFocusColor: TColor;
    procedure SetTopLeftColor(const Value: TColor);
    procedure SetBottomRightColor(const Value: TColor);
    procedure SetFocusColor(const Value: TColor);
    procedure SetColor(const Value: TColor);
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
  protected
    function PropertiesAsStrings(const ACaption: WideString; ADisabled: Boolean; AEvent: TImageEvent): TStrings;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Width: Integer read GetWidth write SetWidth default 75;
    property Height: Integer read GetHeight write SetHeight default 25;
    property Color: TColor read GetColor write SetColor default $00CCCCCC;
    property Font: TFont read GetFont write SetFont;
    property TopLeftColor: TColor read GetTopLeftColor write SetTopLeftColor default clWhite;
    property BottomRightColor: TColor read GetBottomRightColor write SetBottomRightColor default clGray;
    property FocusColor: TColor read GetFocusColor write SetFocusColor default clYellow;
  end;

  TFileLifeTime = class(TPersistent)
  private
    FDays: Cardinal;
    FMinutes: Cardinal;
  public
    procedure Assign(Source: TPersistent); override;
    function TimeHasExpired(ADateTime: TDateTime): Boolean;
  published
    constructor Create;
    property Days: Cardinal read FDays write FDays default 0;
    property Minutes: Cardinal read FMinutes write FMinutes default 1;
  end;

  // Manage button image files.  Create new files when properties are changes.
  TCustomImageButtonProducer = class(TBaseImageButtonProducer)
  private
    FLastAttributes: TImageButtonAttributes;
    FCacheDir: string;
    FVirtualDir: string;
    FFileLifeTime: TFileLifeTime;
    function FileHasExpired(const AFileName: string): Boolean;
    procedure SetFileLifeTime(const Value: TFileLifeTime);
  protected
    procedure CreateImageFile(const AFileName: string;
      AComponent: TComponent; const ACaption: WideString; AEvent: TImageEvent);
    function WebImageHREF(AComponent: TComponent;  const ACaption: WideString; AEvent: TImageEvent): string; override;
    function MakeFileName(AComponent: TComponent; AEvent: TImageEvent): string;
  public
    property CacheDir: string read FCacheDir write FCacheDir;
    property VirtualDir: string read FVirtualDir write FVirtualDir;
    property FileLifeTime: TFileLifeTime read FFileLifeTime write SetFileLifeTime;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TImageButtonProducer = class(TCustomImageButtonProducer)
  published
    property Width;
    property Height;
    property CacheDir;
    property VirtualDir;
    property Color;
    property Font;
    property FileLifeTime;
    property TopLeftColor;
    property BottomRightColor;
    property FocusColor;
  end;

  // An instance of this object gets created each time server-side script is used to references an image.  This
  // object holds the characteristics that make each image distinct (e.g.; caption, event, component).
  TImageObject = class(TInterfacedObject, IWebImageHREF,
    IGetAdapterItemRequestParams, IInterfaceComponentReference)
  private
    FProducer: TBaseImageProducer;
    FComponent: TComponent;
    FCaption: WideString;
    FEvent: TImageEvent;
  protected
    { IInterfaceComponentReference }
    function GetComponent: TComponent;
    { IWebImageHREF }
    function WebImageHREF(var AHREF: string): Boolean;
    { IGetAdapterRequestParams }
    procedure GetAdapterItemRequestParams(
      var AIdentifier: string; AParams: IAdapterItemRequestParams);
  public
    constructor Create(AProducer: TBaseImageProducer; AComponent: TComponent; const ACaption: WideString;
      const AEvent: string = '');
  end;

  TComponentImageFileList = class;

  // Keep a list of image files that are in use by an image producer component.  At runtime, when
  // there are multiple web module instances, all image producers with the same name share
  // a file set.
  TImageFileList = class(TObject)
  private
    FFileNames: TStrings;
    FCaptions: TStrings;
    FComponentImageFileList: TComponentImageFileList;
    FFileID: Integer;
    FClearCache: Boolean;
    function GetFileID: string;
  public
    constructor Create(AComponentImageFileList: TComponentImageFileList; AClearCache: Boolean);
    destructor Destroy; override;
    procedure ClearCache;
    function CaptionChanged(const AFileName, ACaption: string): Boolean;
    procedure AddFile(const AFileName: string; const ACaption: string);
    procedure Lock;
    procedure Unlock;
    property FileID: string read GetFileID;
  end;

  // Keep lists of image files that are used by all image producer components.
  TComponentImageFileList = class(TObject)
  private
    FFileLists: TObjectList;
    FComponentNames: TStrings;
    FFileID: Integer;
    FLock: TCriticalSection;
    function GetImageFileList(AComponent: TComponent): TImageFileList;
    function GetComponentName(AComponent: TComponent): string;
    function NextFileID: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Lock;
    procedure Unlock;
    property ImageFileList[AComponent: TComponent]: TImageFileList read GetImageFileList; default;
  end;

const
  ImageEventNames: array[TImageEvent] of string = ('', 'onmouseover', 'onmouseout', 'onmousedown');

implementation

uses WebConst, Windows,
 Variants, AutoAdap, DrawBtn, WebCntxt, MidProd, DateUtils;

var
  FComponentImageFileList: TComponentImageFileList;

{ TImageObject }

constructor TImageObject.Create(AProducer: TBaseImageProducer;
  AComponent: TComponent; const ACaption: WideString; const AEvent: string);
var
  I: TImageEvent;
begin
  inherited Create;
  FComponent := AComponent;
  FProducer := AProducer;
  FCaption := ACaption;
  FEvent := evNone;
  for I := Low(TImageEvent) to High(TImageEvent) do
    if CompareText(AEvent, ImageEventNames[I]) = 0 then
    begin
      FEvent := I;
      break;
    end;
end;

procedure TImageObject.GetAdapterItemRequestParams(
  var AIdentifier: string; AParams: IAdapterItemRequestParams);
begin
  // Not implemented because we always return static hrefs rather
  // than an href that is dispatched throught TAdapterDispatcher
end;

function TImageObject.GetComponent: TComponent;
begin
  Result := FComponent;
end;

function TImageObject.WebImageHREF(var AHREF: string): Boolean;
begin
  AHREF := FProducer.WebImageHREF(FComponent, FCaption, FEvent);
  Result := AHREF <> '';
end;

{ TBaseImageProducer }

function TBaseImageProducer.GetVariableName: string;
begin
  Result := Self.Name;
end;

function TBaseImageProducer.WebImageHREF(AComponent: TComponent; const ACaption: WideString;
  AEvent: TImageEvent): string;
begin
  Result := '';
  // Descendent implements
end;

procedure TBaseImageProducer.RenderAdapterImage(ARequest: IImageRequest;
  AResponse: IImageResponse);
begin
  // Descendent implements
  Assert(False);

end;

function TBaseImageProducer.GetScriptObject: IDispatch;
begin
  Result := ImplGetScriptObject;
end;

function TBaseImageProducer.ImplGetScriptObject: IDispatch;
begin
  Result := TImageProducerWrapper.Create(Self);
end;

function TBaseImageProducer.GetAdapterImage(Sender: TComponent; const ACaption: WideString): IInterface;
begin
  Result := TImageObject.Create(Self, Sender, ACaption);
end;

function ComponentDisabled(AComponent: TComponent): Boolean;
var
  WebEnabled: IWebEnabled;
begin
  if Supports(AComponent, IWebEnabled, WebEnabled) then
    Result := not WebEnabled.WebEnabled
  else
    Result := False;
end;

{ TBaseImageButtonProducer }

constructor TBaseImageButtonProducer.Create(AOwner: TComponent);
begin
  inherited;
  FAttributes := TImageButtonAttributes.Create;
  Width := 75;
  Height := 25;
  Color := $00CCCCCC;
  TopLeftColor := clWhite;
  BottomRightColor := clGray;
  FocusColor := clYellow;
end;

destructor TBaseImageButtonProducer.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

function TBaseImageButtonProducer.GetColor: TColor;
begin
  Result := FAttributes.Color;
end;

function TBaseImageButtonProducer.GetTopLeftColor: TColor;
begin
  Result := FAttributes.TopLeftColor;
end;

function TBaseImageButtonProducer.GetBottomRightColor: TColor;
begin
  Result := FAttributes.BottomRightColor;
end;

function TBaseImageButtonProducer.GetFocusColor: TColor;
begin
  Result := FAttributes.FocusColor;
end;

function TBaseImageButtonProducer.GetFont: TFont;
begin
  Result := FAttributes.Font;
end;

function TBaseImageButtonProducer.GetHeight: Integer;
begin
  Result := FAttributes.Height;
end;

function TBaseImageButtonProducer.GetWidth: Integer;
begin
  Result := FAttributes.Width;
end;

(* jmt!!!
function TBaseImageButtonProducer.PropertiesAsStrings(const ACaption: WideString; ADisabled: Boolean;
  AEvent: TImageEvent): TStrings;

  procedure AddStringValue(const AName, AValue: string);
  begin
    if AValue <> '' then
      Result.Add(Format('%s=%s', [AName, AValue]));
  end;

  procedure AddIntValue(const AName: string; AValue: Integer);
  begin
    if AValue > 0 then
      AddStringValue(AName, IntToStr(AValue));
  end;

begin
  Result := TStringList.Create;
  try
    if ADisabled then
      AddStringValue(sFontColor, ColorToString(clGrayText));
    AddStringValue(sTxt, ACaption);
    AddIntValue(sWidth, Width);
    AddIntValue(sHeight, Height);
    AddStringValue(sColor, ColorToString(Color));
    AddStringValue(sFontColor, ColorToString(Font.Color));
    AddStringValue(sFontName, Font.Name);
    AddIntValue(sFontSize, Font.Size);
    if not ADisabled then
      case AEvent of
       evNone, evOut: ;
       evOver, evDown: AddStringValue(sUp, '0');
      end;
  except
    Result.Free;
    raise;
  end;
end;
*)

function TBaseImageButtonProducer.PropertiesAsStrings(const ACaption: WideString; ADisabled: Boolean;
  AEvent: TImageEvent): TStrings;

  procedure AddStringValue(const AName, AValue: string);
  begin
    if AValue <> '' then
      Result.Add(Format('%s=%s', [AName, AValue]));
  end;

  procedure AddIntValue(const AName: string; AValue: Integer);
  begin
    if AValue > 0 then
      AddStringValue(AName, IntToStr(AValue));
  end;

begin
  Result := TStringList.Create;
  try
    if ADisabled then
      AddStringValue(sFontColor, ColorToString(clGrayText));
    AddStringValue(sTxt, ACaption);
    AddIntValue(sWidth, Width);
    AddIntValue(sHeight, Height);
    AddStringValue(sColor, ColorToString(Color));
    AddStringValue(sTLColor, ColorToString(TopLeftColor));
    AddStringValue(sBRColor, ColorToString(BottomRightColor));
    AddStringValue(sFocusColor, ColorToString(FocusColor));
    AddStringValue(sFontColor, ColorToString(Font.Color));
    AddStringValue(sFontName, Font.Name);
    AddIntValue(sFontSize, Font.Size);
    AddStringValue(sFontBold, IntToStr(Integer(fsBold in Font.Style)));
    AddStringValue(sFontItalic, IntToStr(Integer(fsItalic in Font.Style)));
    AddStringValue(sFontUnderline, IntToStr(Integer(fsUnderline in Font.Style)));
    AddStringValue(sFontStrikeOut, IntToStr(Integer(fsStrikeout in Font.Style)));
    case AEvent of
      evNone, evOut, evOver: AddStringValue(sUp, '1');
      evDown: AddStringValue(sUp, '0');
    end;
    if AEvent = evOver then
      AddStringValue(sFocused, '1')
    else
      AddStringValue(sFocused, '0');
    if ADisabled then
      AddStringValue(sEnabled, '0')
    else
      AddStringValue(sEnabled, '1')
  except
    Result.Free;
    raise;
  end;
end;

function TBaseImageProducer.GetAdapterEventImage(Sender: TComponent;
  const AEvent, ACaption: WideString): IInterface;
begin
  Result := TImageObject.Create(Self, Sender, ACaption, AEvent);
end;

function TBaseImageProducer.GetDisplayStyle(Sender: TComponent): string;
begin
  Result := AdapterActionHTMLElementTypeNames[htmlaEventImages];
end;

{ TCustomImageButtonProducer }

constructor TCustomImageButtonProducer.Create(AOwner: TComponent);
begin
  inherited;
  CacheDir := '';
  VirtualDir := '/images';
  FLastAttributes := TImageButtonAttributes.Create;
  FFileLifeTime := TFileLifeTime.Create;
end;

destructor TCustomImageButtonProducer.Destroy;
begin
  FLastAttributes.Free;
  FFileLifeTime.Free;
  inherited;
end;

function TCustomImageButtonProducer.MakeFileName(
  AComponent: TComponent; AEvent: TImageEvent): string;
var
  FileID: string;
  WebVariableName: IWebVariableName;
  IteratorIndex: IIteratorIndex;
begin
  if csDesigning in ComponentState then
    FileID := '-' + FComponentImageFileList[Self].FileID;
  Result := CacheDir;
  if Result <> '' then
    if not IsPathDelimiter(Result, Length(Result)) then
      Result := Result + PathDelim;
  if Supports(IUnknown(AComponent), IWebVariableName, WebVariableName) then
    Result := Result + WebVariableName.VariableName;
  if Supports(IUnknown(AComponent), IIteratorIndex, IteratorIndex)
    and IteratorIndex.InIterator then
    Result := Result + '-' + IntToStr(IteratorIndex.IteratorIndex);
  if ComponentDisabled(AComponent) then
    Result := Result + '-Disabled'
  else if ImageEventNames[AEvent] <> '' then
    Result := Result + '-' + ImageEventNames[AEvent];
  Result := Result + FileID + '.jpg';

  // Fully qualify file name
  if DesignerFileManager <> nil then
    Result := DesignerFileManager.QualifyFileName(Result)
  else
    Result := QualifyFileName(Result);
end;

procedure TCustomImageButtonProducer.CreateImageFile(const AFileName: string; AComponent: TComponent;
  const ACaption: WideString; AEvent: TImageEvent);
var
  MimeType: string;
  S: TStream;
  P: TStrings;
  F: TFileStream;
begin
  P := PropertiesAsStrings(ACaption, ComponentDisabled(AComponent), AEvent);
  try
    S := DrawButton(P, MimeType);
    try
      F := TFileStream.Create(AFileName, fmCreate);
      try
        if F <> nil then
          F.CopyFrom(S, 0);
      finally
        F.Free;
      end;
      FComponentImageFileList[Self].AddFile(AFileName, ACaption);
    finally
      S.Free;
    end;
  finally
    P.Free;
  end;
end;

function TCustomImageButtonProducer.FileHasExpired(const AFileName: string): Boolean;
begin
  Result := False;
  if not (csDesigning in ComponentState) then
    if FileExists(AFileName) then
      Result := FileLifeTime.TimeHasExpired(FileDateToDateTime(FileAge(AFileName)));
end;

function TCustomImageButtonProducer.WebImageHREF(
  AComponent: TComponent; const ACaption: WideString; AEvent: TImageEvent): string;

  function MakeURI(const AFileName: string): string;
  var
    I: Integer;
  begin
    Result := AFileName;
    for I := 1 to Length(Result) do
      if IsPathDelimiter(AFileName, I) then
        Result[I] := '/';
  end;
var
  FileName: string;
  Exists: Boolean;
begin
  if csDesigning in ComponentState then
    if not FAttributes.IsEqual(FLastAttributes) then
    begin
      FComponentImageFileList[Self].ClearCache;
      FLastAttributes.CopyFrom(FAttributes);
    end;
  FileName := MakeFileName(AComponent, AEvent);
  Exists := FileExists(FileName) and not FileHasExpired(FileName);
  if Exists then
  begin
    if FComponentImageFileList[Self].CaptionChanged(FileName, ACaption) then
    begin
      if csDesigning in ComponentState then
      begin
        FComponentImageFileList[Self].ClearCache;
        FileName := MakeFileName(AComponent, AEvent);
      end;
      Exists := False;
    end;
  end;
  if not Exists then
    CreateImageFile(FileName, AComponent, ACaption, AEvent);
  if csDesigning in ComponentState then
    Result := MakeURI(FileName)
  else
    if WebContext <> nil then
      Result := PathInfoToRelativePath(WebContext.Request.InternalPathInfo) +
           VirtualDir + '/' + ExtractFileName(FileName);
end;


procedure TCustomImageButtonProducer.SetFileLifeTime(
  const Value: TFileLifeTime);
begin
  FFileLifeTime.Assign(Value);
end;

{ TImageButtonAttributes }

procedure TImageButtonAttributes.CopyFrom(
  const AAttributes: TImageButtonAttributes);
begin
  FHeight := AAttributes.FHeight;
  FWidth := AAttributes.FWidth;
  FColor := AAttributes.FColor;
  Font := AAttributes.FFont;
  FTopLeftColor := AAttributes.FTopLeftColor;
  FBottomRightColor := AAttributes.FBottomRightColor;
  FFocusColor := AAttributes.FFocusColor;
  FFont.Style := AAttributes.FFont.Style;
end;

constructor TImageButtonAttributes.Create;
begin
  inherited;
  FFont := TFont.Create;
end;

destructor TImageButtonAttributes.Destroy;
begin
  FFont.Free;
end;

function TImageButtonAttributes.IsEqual(
  const AAttributes: TImageButtonAttributes): Boolean;
begin
  Result :=
    (FHeight = AAttributes.FHeight) and
    (FWidth = AAttributes.FWidth) and
    (FColor = AAttributes.FColor) and
    (FFont.Color = AAttributes.FFont.Color) and
    (FFont.Size = AAttributes.FFont.Size) and
    (FTopLeftColor = AAttributes.FTopLeftColor) and
    (FBottomRightColor = AAttributes.FBottomRightColor) and
    (FFocusColor = AAttributes.FFocusColor) and
    (FFont.Style = AAttributes.FFont.Style) and
    (FFont.Name = AAttributes.FFont.Name);
end;

procedure TBaseImageButtonProducer.SetTopLeftColor(const Value: TColor);
begin
  FAttributes.TopLeftColor := Value;
end;

procedure TBaseImageButtonProducer.SetBottomRightColor(const Value: TColor);
begin
  FAttributes.BottomRightColor := Value;
end;

procedure TBaseImageButtonProducer.SetFocusColor(const Value: TColor);
begin
  FAttributes.FocusColor := Value;
end;

procedure TBaseImageButtonProducer.SetColor(const Value: TColor);
begin
  FAttributes.Color := Value;
end;

procedure TBaseImageButtonProducer.SetFont(const Value: TFont);
begin
  FAttributes.Font := Value;
end;

procedure TBaseImageButtonProducer.SetHeight(const Value: Integer);
begin
  FAttributes.Height := Value;
end;

procedure TBaseImageButtonProducer.SetWidth(const Value: Integer);
begin
  FAttributes.Width := Value;
end;

procedure TImageButtonAttributes.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

{ TImageFileList }

procedure TImageFileList.AddFile(const AFileName, ACaption: string);
var
  I: Integer;
begin
  Lock;
  try
    I := FFileNames.IndexOf(AFileName);
    if I >= 0 then
    begin
      FFileNames[I] := AFileName;
      FCaptions[I] := ACaption;
    end
    else
    begin
      FFileNames.Add(AFileName);
      FCaptions.Add(ACaption);
    end;
  finally
    Unlock;
  end;
end;

procedure TImageFileList.ClearCache;
var
  I: Integer;
begin
  Lock;
  try
    for I := 0 to FFileNames.Count - 1 do
      SysUtils.DeleteFile(FFileNames[I]);
    FFileNames.Clear;
    FCaptions.Clear;
    FFileID := FComponentImageFileList.NextFileID;
  finally
    Unlock;
  end;
end;

constructor TImageFileList.Create(AComponentImageFileList: TComponentImageFileList;
  AClearCache: Boolean);
begin
  FClearCache := AClearCache;
  FComponentImageFileList := AComponentImageFileList;
  FFileNames := TStringList.Create;
  FCaptions := TStringList.Create;
end;

destructor TImageFileList.Destroy;
begin
  if FClearCache then
    ClearCache;
  FCaptions.Free;
  FFileNames.Free;
  inherited;
end;

procedure TImageFileList.Lock;
begin
  FComponentImageFileList.Lock;
end;

procedure TImageFileList.Unlock;
begin
  FComponentImageFileList.Unlock;
end;

function TImageFileList.GetFileID: string;
var
  I: Integer;
begin
  Lock;
  try
    I := FFileID;
  finally
    Unlock;
  end;
  Result := IntToStr(I);
end;

function TImageFileList.CaptionChanged(const AFileName,
  ACaption: string): Boolean;
var
  I: Integer;
begin
  Lock;
  try
    I := FFileNames.IndexOf(AFileName);
    Result := (I >= 0) and (CompareText(FCaptions[I], ACaption) <> 0);
  finally
    Unlock;
  end;
end;

{ TComponentImageFileList }

constructor TComponentImageFileList.Create;
begin
  FFileLists := TObjectList.Create(True {Owned});
  FComponentNames := TStringList.Create;
  FLock := TCriticalSection.Create;
  FFileID := GetTickCount;
end;

destructor TComponentImageFileList.Destroy;
begin
  FFileLists.Free;
  FComponentNames.Free;
  FLock.Free;
  inherited;
end;

function TComponentImageFileList.GetComponentName(AComponent: TComponent): string;
begin
  Result := AComponent.Name;
end;

function TComponentImageFileList.GetImageFileList(
  AComponent: TComponent): TImageFileList;
var
  I: Integer;
  S: string;
begin
  S := GetComponentName(AComponent);
  Lock;
  try
    I := FComponentNames.IndexOf(S);
    if I >= 0 then
      Result := TImageFileList(FFileLists[I])
    else
    begin
      Result := TImageFileList.Create(Self, csDesigning in AComponent.ComponentState);
      FFileLists.Add(Result);
      FComponentNames.Add(S);
    end;
  finally
    Unlock;
  end;
end;

procedure TComponentImageFileList.Lock;
begin
  FLock.Enter;
end;

function TComponentImageFileList.NextFileID: Integer;
begin
  Inc(FFileID);
  Result := FFileID;
end;

procedure TComponentImageFileList.Unlock;
begin
  FLock.Leave;
end;

{ TFileLifeTime }

procedure TFileLifeTime.Assign(Source: TPersistent);
begin
  if Source is TFileLifeTime then
  begin
    Days := TFileLifeTime(Source).Days;
    Minutes := TFileLifeTime(Source).Minutes;
  end;
  inherited Assign(Source);
end;

constructor TFileLifeTime.Create;
begin
  inherited;
  FMinutes := 1;
end;

function TFileLifeTime.TimeHasExpired(ADateTime: TDateTime): Boolean;
begin
  Result := False;
  if (Minutes <> 0) or (Days <> 0) then
  begin
    ADateTime := IncMinute(ADateTime, Minutes);
    ADateTime := IncDay(ADateTime, Days);
    Result := ADateTime < Now;
  end;
end;

initialization
  FComponentImageFileList := TComponentImageFileList.Create;
finalization
  FreeAndNil(FComponentImageFileList);
end.

