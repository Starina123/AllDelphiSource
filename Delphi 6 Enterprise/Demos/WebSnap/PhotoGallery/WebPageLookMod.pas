unit WebPageLookMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, WebAdapt, WebComp, 
  MidItems, WebForm;

type
  TWebPageLookModule = class(TWebPageModule)
    AdapterPageProducer1: TAdapterPageProducer;
    PicturesIterator: TPagedAdapter;
    ThumbWidth: TAdapterField;
    ThumbHeight: TAdapterField;
    NewPicturePage: TAdapterAction;
    DeletePicture: TAdapterAction;
    PageProducer1: TPageProducer;
    PictureImage: TAdapterImageField;
    PictureThumbImage: TAdapterImageField;
    ActionGotoPage: TAdapterGotoPageAction;
    AdapterForm1: TAdapterForm;
    AdapterGrid1: TAdapterGrid;
    AdapterCommandGroup1: TAdapterCommandGroup;
    DisplayOptions: TAdapter;
    MaxPicsPerPage: TAdapterField;
    PreferredThumbWidth: TAdapterField;
    MaxPicsPerRow: TAdapterField;
    SubmitOptions: TAdapterAction;
    PicsPerRow: TAdapterField;
    procedure WebPageModuleCreate(Sender: TObject);
    procedure WebPageModuleDestroy(Sender: TObject);
    procedure PictureNameGetValue(Sender: TObject; var Value: Variant);
    procedure ThumbWidthGetValue(Sender: TObject; var Value: Variant);
    procedure ThumbHeightGetValue(Sender: TObject; var Value: Variant);
    procedure WebPageModuleActivate(Sender: TObject);
    procedure WebPageModuleDeactivate(Sender: TObject);
    procedure SavedThumbWidthGetValue(Sender: TObject; var Value: Variant);
    procedure SavedColNumberGetValue(Sender: TObject; var Value: Variant);
    procedure MaxCountOldGetValue(Sender: TObject; var Value: Variant);
    procedure NewPicturePageExecute(Sender: TObject; Params: TStrings);
    procedure DeletePictureGetParams(Sender: TObject; Params: TStrings);
    procedure DeletePictureExecute(Sender: TObject; Params: TStrings);
    procedure PicturesIteratorIterateRecords(Sender: TObject;
      Action: TIteratorMethod; var EOF: Boolean);
    procedure PictureImageGetParams(Sender: TObject; Params: TStrings);
    procedure PictureImageGetImage(Sender: TObject; Params: TStrings;
      var MimeType: String; var Image: TStream; var Owned: Boolean);
    procedure PictureThumbImageGetImage(Sender: TObject; Params: TStrings;
      var MimeType: String; var Image: TStream; var Owned: Boolean);
    procedure PictureImageGetImageName(Sender: TObject; var Value: String);
    procedure PicturesIteratorGetFirstRecord(Sender: TObject;
      var EOF: Boolean);
    procedure PicturesIteratorGetNextRecord(Sender: TObject;
      var EOF: Boolean);
    procedure PicturesIteratorGetRecordCount(Sender: TObject;
      var Count: Integer);
    procedure PicturesIteratorGetRecordIndex(Sender: TObject;
      var Index: Integer);
    procedure PicturesIteratorGetEOF(Sender: TObject; var EOF: Boolean);
    procedure MaxPicsPerPageGetValue(Sender: TObject; var Value: Variant);
    procedure SubmitOptionsExecute(Sender: TObject; Params: TStrings);
    procedure PreferredThumbWidthGetValue(Sender: TObject;
      var Value: Variant);
    procedure MaxPicsPerRowGetValue(Sender: TObject; var Value: Variant);
    procedure PicsPerRowGetValue(Sender: TObject; var Value: Variant);
  private
    FPictureList: TStringList;
    FCurrentIndex: Integer;
    FCurrentWidth: Integer;
    FCurrentHeight: Integer;

    FThumbWidth: Integer;
    FPicsPerRow: Integer;
    procedure LoadCurrentWidthHeight;
    function PicturesIteratorStartIterator: Boolean;
    function PicturesIteratorNextIteration: Boolean;
  public
    { Public declarations }
  end;

  function WebPageLookModule: TWebPageLookModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, AdaptReq, WebFact, Variants, MainPageMod, jpeg, Graphics, SiteComp;

const
  cWidthCookie = 'Thumbnail Width';
  cColNumberCookie = 'Column Number';
  cSavedPicsPerPage = 'Pictures Per Page';

  cDefaultWidth = 200;
  cDefaultCols = 3;
  cDefaultPicsPerPage = 20;

resourcestring
  rNoFilenameGiven = 'No filename given to create a thumbnail for.';
  rViewMyPictures = 'View My Pictures';

procedure GetFiles(const ADirectory: string; Files: TStringList;
   SubFolders: Boolean; FileType: string);
	// Helper function to remove any slashes or add them if needed
  function SlashSep(const Path, S: string): string;
  begin
    if AnsiLastChar(Path)^ <> '\' then
      Result := Path + '\' + S
    else
      Result := Path + S;
  end;
var
  SearchRec: TSearchRec;
  nStatus: Integer;
begin
  // First find all the files in the current directory
  // You could put something else instead of *.*, such as *.jpeg or *.gif
  // to find only files of those types.
  nStatus := FindFirst(PChar(SlashSep(ADirectory, FileType)),  0, SearchRec);
  while nStatus = 0 do
  begin
    Files.Add(SlashSep(ADirectory, SearchRec.Name));
    nStatus := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  // Next look for subfolders and search them if required to do so
  if SubFolders then
  begin
    nStatus := FindFirst(PChar(SlashSep(ADirectory, FileType)), faDirectory,
      SearchRec);
    while nStatus = 0 do
    begin
      // If it is a directory, then use recursion
      if ((SearchRec.Attr and faDirectory) <> 0) then
      begin
        if ( (SearchRec.Name <> '.') and (SearchRec.Name <> '..') )  then
          GetFiles(SlashSep(ADirectory, SearchRec.Name), Files, SubFolders,
            FileType);
      end;
      nStatus := FindNext(SearchRec)
    end;
    FindClose(SearchRec);
  end;
end;


function WebPageLookModule: TWebPageLookModule;
begin
  Result := TWebPageLookModule(WebContext.FindModuleClass(TWebPageLookModule));
end;

function TWebPageLookModule.PicturesIteratorStartIterator: Boolean;
var
  UserName: string;
  Directory: string;
begin
  try
    FPictureList.Clear;
    // Find the current user name
    UserName := MainPageModule.GetCurrentUserName;
    if UserName = '' then raise Exception.Create(rNotLoggedIn);
    // Look for all pictures in their directory
    Directory := ExtractFilePath(GetModuleName(HInstance)) + 'users\' + UserName;
    GetFiles(Directory, FPictureList, False, '*.jpg');
    GetFiles(Directory, FPictureList, False, '*.jpeg');
    FCurrentIndex := 0;
    Result := FCurrentIndex < FPictureList.Count;
    if Result then
      LoadCurrentWidthHeight;
  except
    on E: Exception do
    begin
      PicturesIterator.Errors.AddError(E);
      Result := False;
    end;
  end;
end;

function TWebPageLookModule.PicturesIteratorNextIteration: Boolean;
begin
  Inc(FCurrentIndex);
  Result := FCurrentIndex < FPictureList.Count;
  if Result then
    LoadCurrentWidthHeight;
end;

procedure TWebPageLookModule.WebPageModuleCreate(Sender: TObject);
begin
  FPictureList := TStringList.Create;
  FCurrentIndex := 0;
end;

procedure TWebPageLookModule.WebPageModuleDestroy(Sender: TObject);
begin
  FPictureList.Free;
end;

procedure TWebPageLookModule.PictureNameGetValue(Sender: TObject;
  var Value: Variant);
begin
  try
    Value := ExtractFileName(FPictureList[FCurrentIndex]);
  except
    on E: Exception do
    begin
      PicturesIterator.Errors.AddError(E);
      Value := Unassigned;
    end;
  end;
end;


procedure TWebPageLookModule.LoadCurrentWidthHeight;
var
  Jpeg: TJpegImage;
begin
  FCurrentHeight := 0;
  Jpeg := TJpegImage.Create;
  try
    Jpeg.LoadFromFile(FPictureList[FCurrentIndex]);
    // Don't shrink small pictures
    if FThumbWidth > Jpeg.Width then
      FCurrentWidth := Jpeg.Width
    else
      FCurrentWidth := FThumbWidth;
    FCurrentHeight := Trunc(FCurrentWidth * (Jpeg.Height / Jpeg.Width));
  finally
    Jpeg.Free;
  end;
end;

procedure TWebPageLookModule.ThumbWidthGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FCurrentWidth;
end;

procedure TWebPageLookModule.ThumbHeightGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FCurrentHeight;
end;

procedure TWebPageLookModule.WebPageModuleActivate(Sender: TObject);
begin
  FThumbWidth := cDefaultWidth;
  FPicsPerRow := cDefaultCols;
  PicturesIterator.PageSize := cDefaultPicsPerPage;
  // Try loading the FCurrentWidth from the cookie
  if WebContext.Request.CookieFields.Values[cWidthCookie] <> '' then
  begin
    try
      FThumbWidth := StrToInt(WebContext.Request.CookieFields.Values[cWidthCookie]);
      if FThumbWidth < 5 then
        FThumbWidth := cDefaultWidth;
    except
    end;
  end;
  if WebContext.Request.CookieFields.Values[cColNumberCookie] <> '' then
  begin
    try
      FPicsPerRow := StrToInt(WebContext.Request.CookieFields.Values[cColNumberCookie]);
      if FPicsPerRow <= 0 then
        FPicsPerRow := cDefaultCols;
    except end;
  end;
  if WebContext.Request.CookieFields.Values[cSavedPicsPerPage] <> '' then
  begin
    try
      PicturesIterator.PageSize := StrToInt(WebContext.Request.CookieFields.Values[cSavedPicsPerPage]);
      if PicturesIterator.PageSize <= 0 then
        PicturesIterator.PageSize := cDefaultPicsPerPage;
    except end;
  end;
end;


procedure TWebPageLookModule.WebPageModuleDeactivate(Sender: TObject);
begin
  with WebContext.Response.Cookies.Add do
  begin
    Name := cWidthCookie;
    Value := IntToStr(FThumbWidth);
//    Domain := 'borland.com'; // Should be set to your domain
    Path := WebContext.Request.InternalScriptName;
  end;
  with WebContext.Response.Cookies.Add do
  begin
    Name := cColNumberCookie;
    Value := IntToStr(FPicsPerRow);
    Path := WebContext.Request.InternalScriptName;
  end;
  with WebContext.Response.Cookies.Add do
  begin
    Name := cSavedPicsPerPage;
    Value := IntToStr(PicturesIterator.PageSize);
    Path := WebContext.Request.InternalScriptName;
  end;
end;

procedure TWebPageLookModule.SavedThumbWidthGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FThumbWidth;
end;

procedure TWebPageLookModule.SavedColNumberGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FPicsPerRow;
end;

procedure TWebPageLookModule.MaxCountOldGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FPictureList.Count;
end;

procedure TWebPageLookModule.NewPicturePageExecute(Sender: TObject;
  Params: TStrings);
begin
  try
    //jmt.!!! FStartAtIndex := StrToInt(Params.Values['index']);
  except
    on E: Exception do PicturesIterator.Errors.AddError(E);
  end;
end;

procedure TWebPageLookModule.DeletePictureGetParams(Sender: TObject;
  Params: TStrings);
begin
  Params.Values['filename'] := ExtractFileName(FPictureList[FCurrentIndex]); 
end;

procedure TWebPageLookModule.DeletePictureExecute(Sender: TObject;
  Params: TStrings);
var
  FileName, UserName: string;
begin
  try
    // NOTE: HttpDecode should be done for us!
    FileName := HttpDecode(Params.Values['filename']);
    if FileName <> '' then
    begin
      UserName := MainPageModule.GetCurrentUserName;
      if UserName <> '' then
      begin
        // Delete the actual file
        DeleteFile(ExtractFilePath(GetModuleName(HInstance)) +
          'users\' + UserName + '\' + FileName);
      end;
    end;
  except
    on E: Exception do PicturesIterator.Errors.AddError(E);
  end;
end;

procedure TWebPageLookModule.PicturesIteratorIterateRecords(
  Sender: TObject; Action: TIteratorMethod; var EOF: Boolean);
begin
  case Action of
   itStart:
     EOF := not PicturesIteratorStartIterator;
   itNext:
     EOF := not PicturesIteratorNextIteration;
   itEnd:
     FCurrentIndex := 0;
  end;
end;

procedure TWebPageLookModule.PictureImageGetParams(Sender: TObject;
  Params: TStrings);
begin
  Params.Values['filename'] := ExtractFileName(FPictureList[FCurrentIndex]);
end;

procedure TWebPageLookModule.PictureImageGetImage(Sender: TObject;
  Params: TStrings; var MimeType: String; var Image: TStream;
  var Owned: Boolean);
var
  UserName: string;
  FileStream: TFileStream;
begin
  try
    if Params.Values['filename'] <> '' then
    begin
      UserName := MainPageModule.GetCurrentUserName;
      if UserName <> '' then
      begin
        FileStream := TFileStream.Create(ExtractFilePath(GetModuleName(HInstance)) +
          'users\' + UserName + '\' + HttpDecode(Params.Values['filename']),
          fmOpenRead or fmShareDenyWrite);
        MimeType := 'image/jpeg'; { do not localize }
        Image := FileStream;
        Owned := True;
      end
      else
        raise Exception.Create(rNotLoggedIn);
    end
    else
      raise Exception.Create(rNoFilenameGiven);
  except
    on E: Exception do PicturesIterator.Errors.AddError(E);
  end;
end;

procedure TWebPageLookModule.PictureThumbImageGetImage(Sender: TObject;
  Params: TStrings; var MimeType: String; var Image: TStream;
  var Owned: Boolean);
var
  Jpeg: TJpegImage;
  UserName: string;
  Stream: TMemoryStream;
  ThumbPicture: TBitmap;
begin
  try
    if Params.Values['filename'] <> '' then
    begin
      UserName := MainPageModule.GetCurrentUserName;
      if UserName <> '' then
      begin
        Jpeg := TJpegImage.Create;
        try
          Jpeg.LoadFromFile(ExtractFilePath(GetModuleName(HInstance)) +
            'users\' + UserName + '\' + HttpDecode(Params.Values['filename']));

          // Resize it to be a thumbnail
          ThumbPicture := TBitmap.Create;
          try
            if FThumbWidth > Jpeg.Width then
              FCurrentWidth := Jpeg.Width
            else
              FCurrentWidth := FThumbWidth;

            ThumbPicture.Width := FCurrentWidth;
            ThumbPicture.Height := Trunc(FCurrentWidth * (Jpeg.Height / Jpeg.Width));

            ThumbPicture.Canvas.StretchDraw(Rect(0, 0,
              ThumbPicture.Width-1, ThumbPicture.Height-1), Jpeg);
            Jpeg.Assign(ThumbPicture);
          finally
            ThumbPicture.Free;
          end;
          Stream := TMemoryStream.Create;
          Jpeg.SaveToStream(Stream);
          MimeType := 'image/jpeg'; { do not localize }
          Stream.Position := 0;
          Image := Stream;
          Owned := True;
        finally
          Jpeg.Free;
        end;
      end
        else raise Exception.Create(rNotLoggedIn);
    end
      else raise Exception.Create(rNoFileNameGiven);
  except
    on E: Exception do PicturesIterator.Errors.AddError(E);
  end;
end;

procedure TWebPageLookModule.PictureImageGetImageName(Sender: TObject;
  var Value: String);
begin
  try
    Value := ExtractFileName(FPictureList[FCurrentIndex]);
  except
    on E: Exception do
    begin
      PicturesIterator.Errors.AddError(E);
      Value := Unassigned;
    end;
  end;
end;

procedure TWebPageLookModule.PicturesIteratorGetFirstRecord(
  Sender: TObject; var EOF: Boolean);
begin
   EOF := not PicturesIteratorStartIterator;
end;

procedure TWebPageLookModule.PicturesIteratorGetNextRecord(Sender: TObject;
  var EOF: Boolean);
begin
  EOF := not PicturesIteratorNextIteration;
end;

procedure TWebPageLookModule.PicturesIteratorGetRecordCount(
  Sender: TObject; var Count: Integer);
begin
  Count := FPictureList.Count;
end;

procedure TWebPageLookModule.PicturesIteratorGetRecordIndex(
  Sender: TObject; var Index: Integer);
begin
  Index := FCurrentIndex;
end;

procedure TWebPageLookModule.PicturesIteratorGetEOF(Sender: TObject;
  var EOF: Boolean);
begin
  EOF := FCurrentIndex >= FPictureList.Count;
end;

procedure TWebPageLookModule.MaxPicsPerPageGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := PicturesIterator.PageSize;
end;

procedure TWebPageLookModule.SubmitOptionsExecute(Sender: TObject;
  Params: TStrings);
var
  Value: IActionFieldValue;
begin
  try
    Value := PreferredThumbWidth.ActionValue;
    if Assigned(Value) then
      FThumbWidth := StrToInt(Value.Values[0]);
  except
    on E: Exception do
    begin
      DisplayOptions.Errors.AddError(E);
      PreferredThumbWidth.EchoActionFieldValue := True;
    end;
  end;
  try
    Value := MaxPicsPerRow.ActionValue;
    if Assigned(Value) then
    begin
      FPicsPerRow := StrToInt(Value.Values[0]);
      if FPicsPerRow <= 0 then
        FPicsPerRow := cDefaultCols;
    end;
  except
    on E: Exception do
    begin
      DisplayOptions.Errors.AddError(E);
      MaxPicsPerRow.EchoActionFieldValue := True;
    end;
  end;
  try
    Value := MaxPicsPerPage.ActionValue;
    if Assigned(Value) then
    begin
      PicturesIterator.PageSize := StrToInt(Value.Values[0]);
      if PicturesIterator.PageSize < 0 then
        PicturesIterator.PageSize := cDefaultPicsPerPage;
    end;
  except
    on E: Exception do
    begin
      DisplayOptions.Errors.AddError(E);
      MaxPicsPerPage.EchoActionFieldValue := True;
    end;
  end;
end;

procedure TWebPageLookModule.PreferredThumbWidthGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FThumbWidth;
end;

procedure TWebPageLookModule.MaxPicsPerRowGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FPicsPerRow;
end;

procedure TWebPageLookModule.PicsPerRowGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FPicsPerRow;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(
    TWebPageModuleFactory.Create(TWebPageLookModule,
    TWebPageInfo.Create([wpPublished , wpLoginRequired],
    '.html', '', rViewMyPictures), crOnDemand, caCache));
end.

