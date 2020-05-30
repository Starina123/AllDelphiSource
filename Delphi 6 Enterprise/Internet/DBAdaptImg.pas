
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 2000-2001 Borland Software Corp.  }
{                                                       }
{*******************************************************}

unit DBAdaptImg;

interface

uses Classes, Messages, HTTPApp, WebComp, DB, SiteComp, SysUtils,
  WebContnrs, WebAdapt, DBAdapt, AdaptReq;

type
  TImageDataSetFieldGetImageEvent = procedure(Sender: TObject;
    var MimeType: string; var Image: TStream; var Owned: Boolean) of object;

  TCustomDataSetAdapterImageField = class(TBaseDataSetAdapterImageField,
    IGetAdapterImage, IGetAdapterItemRequestParams,
    IAdapterRequestHandler, IWebImageHREF)
  private
    FOnGetHREF: TImageFieldGetHREFEvent;
    FOnGetImage: TImageDataSetFieldGetImageEvent;
  protected
    function CheckOrUpdateValue(AActionRequest: IActionRequest;
      AFieldIndex: Integer; AUpdate: Boolean): Boolean;
    function GetDataSetFieldValue(Field: TField): Variant; override;
    { IWebImageHREF }
    function ImplWebImageHREF(var AHREF: string): Boolean; virtual;
    function WebImageHREF(var AHREF: string): Boolean;
    { IAdapterRequestHandler }
    procedure CreateRequestContext(DispatchParams: IAdapterDispatchParams);
    procedure ImplCreateRequestContext(DispatchParams: IAdapterDispatchParams);
    function HandleRequest(DispatchParams: IAdapterDispatchParams): Boolean;
    function ImplHandleRequest(DispatchParams: IAdapterDispatchParams): Boolean; virtual;
    { ICheckValueChange }
    function ImplCheckValueChange(AActionRequest: IActionRequest;
      AFieldIndex: Integer): Boolean; override;
    { IUpdateValue }
    procedure ImplUpdateValue(AActionRequest: IActionRequest; AFieldIndex: Integer); override;
    { IGetHTMLStyle }
    function GetDisplayStyleType(const AAdapterMode: string): TAdapterDisplayHTMLElementType; override;
    function GetInputStyleType(const AAdapterMode: string): TAdapterInputHTMLElementType; override;
    { IGetAdapterImage }
    function GetAdapterImage: IInterface;
    { IRenderAdapterImage }
    procedure RenderAdapterImage(ARequest: IImageRequest; AResponse: IImageResponse);
    { IGetAdapterItemRequestParams }
    procedure GetAdapterItemRequestParams(
      var AIdentifier: string; AParams: IAdapterItemRequestParams);
  public
    constructor Create(AOwner: TComponent); override;
    property OnGetImage: TImageDataSetFieldGetImageEvent read FOnGetImage write FOnGetImage;
    property OnGetHREF: TImageFieldGetHREFEvent read FOnGetHREF write FOnGetHREF;
  end;

  TDataSetAdapterImageField = class(TCustomDataSetAdapterImageField)
  published
    property DataSetField;
    property ViewAccess;
    property ModifyAccess;
    property OnGetImage;
    property OnGetHREF;
    property FieldModes;
  end;

implementation

uses Variants, WebCntxt, AutoAdap, Graphics, jpeg, SiteConst;

{ TCustomDataSetAdapterImageField }

function TCustomDataSetAdapterImageField.GetAdapterImage: IInterface;
begin
  case Adapter.Mode of
    amInsert, amQuery:  Result := nil
  else
    Result := Self;
  end;
end;

function TCustomDataSetAdapterImageField.GetDisplayStyleType(const AAdapterMode: string): TAdapterDisplayHTMLElementType;
begin
  Result := htmldImage;
end;

function TCustomDataSetAdapterImageField.GetInputStyleType(const AAdapterMode: string): TAdapterInputHTMLElementType;
begin
  Result := htmliFile;
end;

procedure TCustomDataSetAdapterImageField.RenderAdapterImage(
  ARequest: IImageRequest; AResponse: IImageResponse);
var
  S: TStream;
  Bmp: TBitmap;
  JPEG: TJPEGImage;
  Response: TWebResponse;
  Field: TField;
  ContentType: string;
  ContentStream: TStream;
  MimeType: string;
  Image: TStream;
  Owned: Boolean;
begin
  CheckViewAccess;
  Response := WebContext.Response;
  Response.ContentType := 'image/jpeg';
  ContentStream := nil;
  Adapter.ExtractRequestParams(ARequest);
  if Adapter.SilentLocate(Adapter.LocateParamsList, True) then
  begin
    if Assigned(FOnGetImage) then
    begin
      Image := nil;
      Owned := True;
      S := nil;
      FOnGetImage(Self, MimeType, Image, Owned);
      if Image <> nil then
      begin
        try
          if not Owned then
          begin
            S := TMemoryStream.Create;
            S.CopyFrom(Image, 0);
          end
          else
            S := Image;
          S.Seek(0, soFromBeginning);
        except
          if Owned then
            Image.Free;
          if Image <> S then
            S.Free;
          raise;
        end;
        Assert(MimeType <> '');
        ContentType := MimeType;
        ContentStream := S;
      end;
    end;
    if ContentStream = nil then
    begin
      ContentType := 'image/jpeg';
      Field := Adapter.DataSet.FindField(DataSetField);
      if Assigned(Field) then
      begin
        Bmp := TBitmap.Create;
        try
          Bmp.Assign(Field);
          JPEG := TJPEGImage.Create;
          try
            JPEG.Assign(Bmp);
            S := TMemoryStream.Create;
            JPEG.SaveToStream(S);
            S.Seek(0, soFromBeginning);
            ContentStream := S;
          finally
            JPEG.Free;
          end;
        finally
          Bmp.Free;
        end;
      end;
    end;
  end;
  Response.ContentType := ContentType;
  Response.ContentStream := ContentStream;
end;

function GetActionFieldValues(AActionRequest: IActionRequest): IActionFieldValues;
begin
  if not Supports(AActionRequest, IActionFieldValues, Result) then
    Assert(False);
end;

function TCustomDataSetAdapterImageField.CheckOrUpdateValue(AActionRequest: IActionRequest; AFieldIndex: Integer;
  AUpdate: Boolean): Boolean;
var
  Field: TField;
  FieldValue: IActionFieldValue;
  Bmp: TBitmap;
begin
  Result := False;
  Assert(Adapter <> nil);
  Assert(Adapter.DataSet <> nil);
  with GetActionFieldValues(AActionRequest) do
    FieldValue := Values[AFieldIndex];
  if FieldValue.FileCount > 0 then
  begin
    Field := Adapter.DataSet.FindField(DataSetField);
    if Field = nil then
      Adapter.RaiseFieldNotFound(DataSetField);
    if FieldValue.FileCount = 1 then
    begin
      if AUpdate then
      begin
        if FieldValue.Files[0].ContentType = 'image/bmp' then
        begin
          Bmp := TBitmap.Create;
          try
            Bmp.LoadFromStream(FieldValue.Files[0].Stream);
            Field.Assign(Bmp);
          finally
            Bmp.Free;
          end;
        end
        else
          raise EAdapterFieldException.Create(Format(sIncorrectImageFormat, [FieldValue.Files[0].ContentType]),
            FieldName);
      end
      else
        Result := True;
    end
    else
      RaiseMultipleFilesException(FieldName);
  end
  else if (FieldValue.ValueCount > 0) and (FieldValue.Values[0] <> '') then
    raise EAdapterFieldException.Create(sFileExpected,
      FieldName);
end;

procedure TCustomDataSetAdapterImageField.ImplUpdateValue(AActionRequest: IActionRequest; AFieldIndex: Integer);
begin
  CheckModifyAccess;
  CheckOrUpdateValue(AActionRequest, AFieldIndex, True);
end;

function TCustomDataSetAdapterImageField.GetDataSetFieldValue(
  Field: TField): Variant;
begin
  // Field.Value will return binary data.  Use DisplayText instead.
  Result := Field.DisplayText;
end;

function TCustomDataSetAdapterImageField.ImplCheckValueChange(
  AActionRequest: IActionRequest; AFieldIndex: Integer): Boolean;
begin
  Result := CheckOrUpdateValue(AActionRequest, AFieldIndex, False);
end;

function TCustomDataSetAdapterImageField.ImplWebImageHREF(var AHREF: string): Boolean;
begin
  if DesigningComponent(Self) and Assigned(GetHTMLSampleImage) then
    AHREF := GetHTMLSampleImage
  else
  begin
    AHREF := '';
    if Assigned(FOnGetHREF) then
      FOnGetHREF(Self, AHREF);
  end;
  Result := AHREF <> '';
end;

function TCustomDataSetAdapterImageField.WebImageHREF(var AHREF: string): Boolean;
begin
  Result := ImplWebImageHREF(AHREF);
end;

procedure TCustomDataSetAdapterImageField.CreateRequestContext(
  DispatchParams: IAdapterDispatchParams);
begin
  ImplCreateRequestContext(DispatchParams);
end;

function TCustomDataSetAdapterImageField.HandleRequest(
  DispatchParams: IAdapterDispatchParams): Boolean;
begin
  Result := ImplHandleRequest(DispatchParams);
end;

procedure TCustomDataSetAdapterImageField.ImplCreateRequestContext(
  DispatchParams: IAdapterDispatchParams);
var
  Obj: TBasicImageRequestImpl;
begin
  Obj := TBasicImageRequestImpl.Create(DispatchParams);
  TBasicImageResponseImpl.Create(Obj);
end;

function TCustomDataSetAdapterImageField.ImplHandleRequest(
  DispatchParams: IAdapterDispatchParams): Boolean;
var
  ImageRequest: IImageRequest;
  ImageResponse: IImageResponse;
begin
  Result := Supports(WebContext.AdapterRequest, IImageRequest, ImageRequest) and
    Supports(WebContext.AdapterResponse, IImageResponse, ImageResponse);
  Assert(Result);
  if Result then
    RenderAdapterImage(ImageRequest, ImageResponse);
end;

procedure TCustomDataSetAdapterImageField.GetAdapterItemRequestParams(
  var AIdentifier: string; AParams: IAdapterItemRequestParams);
begin
  AIdentifier := MakeAdapterRequestIdentifier(Self);
  Adapter.EncodeActionParamsFlags(AParams, [poLocateParams]);
end;

constructor TCustomDataSetAdapterImageField.Create(AOwner: TComponent);
begin
  inherited;
  FieldModes := [amInsert, amEdit, amBrowse {, amQuery}];
end;

initialization
  DataSetAdapterImageFieldClass := TDataSetAdapterImageField;
end.

