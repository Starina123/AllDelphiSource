
unit UpPicPageMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp;

type
  TUpPicPageModule = class(TWebPageModule)
  PageProducer: TPageProducer;
    UploadAdapter: TAdapter;
    Upload: TAdapterAction;
    UploadedFiles: TStringsValuesList;
    UploadFile: TAdapterFileField;
    procedure UploadExecute(Sender: TObject; Params: TStrings);
    procedure WebPageModuleActivate(Sender: TObject);
    procedure UploadFileUploadFiles(Sender: TObject;
      Files: TUpdateFileList);

  private
    function GetBaseDirectory: string;
  public
    { Public declarations }
  end;

  function UpPicPageModule: TUpPicPageModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, SiteComp, FileCtrl, MainPageMod,
  WebUsers, AdaptReq;

resourcestring
  rNoFilesUploaded = 'No files uploaded!';
  rRequireJpeg = 'Image must be a jpeg (with extension .jpg or .jpeg).';
  rNoUploadFileFound = 'No Upload File found! Did you select a file?';
  rUploadPageTitle = 'Upload Pictures';

function UpPicPageModule: TUpPicPageModule;
begin
  Result := TUpPicPageModule(WebContext.FindModuleClass(TUpPicPageModule));
end;

function TUpPicPageModule.GetBaseDirectory: string;
begin
  Result := ExtractFilePath(GetModuleName(HInstance));
end;

procedure TUpPicPageModule.UploadExecute(Sender: TObject;
  Params: TStrings);
begin
  UploadAdapter.UpdateRecords;
end;

procedure TUpPicPageModule.WebPageModuleActivate(Sender: TObject);
begin
  UploadedFiles.Strings.Clear;
end;

procedure TUpPicPageModule.UploadFileUploadFiles(Sender: TObject;
  Files: TUpdateFileList);
var
  I: Integer;
  FileStream: TFileStream;
  CurrentUser: string;
begin
  if Files.Count <= 0 then
    raise Exception.Create(rNoFilesUploaded);
  // Check who the user is
  CurrentUser := MainPageModule.GetCurrentUserName;
  if CurrentUser = '' then
  begin
    // show login page
    raise Exception.Create(rNotLoggedIn);
  end;
  for I := 0 to Files.Count - 1 do
  begin
    // Make sure that the file is a .jpg or .jpeg
    if (CompareText(ExtractFileExt(Files.Files[I].FileName), '.jpg') <> 0)
        and (CompareText(ExtractFileExt(Files.Files[I].FileName), '.jpeg') <> 0) then
    begin
      UploadAdapter.Errors.AddError(rRequireJpeg);
    end else
    begin
      // Save the file in the current directory plus "users\UserName"
      ForceDirectories(GetBaseDirectory + 'users\' + CurrentUser);
      FileStream := TFileStream.Create(GetBaseDirectory + 'users\' +
        CurrentUser + '\' + ExtractFileName(Files.Files[I].FileName),
        fmCreate or fmShareDenyWrite);
      try
        FileStream.CopyFrom(Files.Files[I].Stream, 0); // 0 = copy all from start
        // Set the name/value pair as FileName=Size
        UploadedFiles.Strings.Values[ExtractFileName(Files.Files[I].FileName)]
          := IntToStr(FileStream.Size);
      finally
        FileStream.Free;
      end;
    end;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TUpPicPageModule,
      TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html', '', rUploadPageTitle),
      crOnDemand, caCache));

end.
