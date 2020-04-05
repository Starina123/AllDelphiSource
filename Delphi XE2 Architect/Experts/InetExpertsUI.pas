{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit InetExpertsUI;

interface

uses
  SysUtils, Classes, Forms, WebServerWizardPage,
  ExpertsUIWizard, InetWiz, Graphics, InetCertFilesWizardPage;

type
  TInetExpertsUIModule = class(TDataModule)
    ApplicationTypeWizardPage1: TExpertsFrameWizardPage;
    WebServerProjectWizard: TExpertsWizard;
    PortsWizardPage: TExpertsFrameWizardPage;
    CertFilesWizardPage: TExpertsFrameWizardPage;
    procedure ApplicationTypeWizardPage1CreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure PortsWizardPageCreateFrame(Sender: TCustomExpertsFrameWizardPage;
      AOwner: TComponent; out AFrame: TFrame);
    procedure DataModuleCreate(Sender: TObject);
    procedure PortsWizardPageFrameOptionChanged(
      Sender: TCustomExpertsFrameWizardPage);
    procedure ApplicationTypeWizardPage1FrameOptionChanged(
      Sender: TCustomExpertsFrameWizardPage);
    procedure ApplicationTypeWizardPage1FrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure PortsWizardPageFrameCreated(Sender: TCustomExpertsFrameWizardPage;
      AFrame: TFrame);
    procedure PortsWizardPageEnterPage(Sender: TCustomExpertsWizardPage;
      PageTransition: TExpertsWizardPageTransition);
    procedure WebServerProjectWizardLoadImage(Sender: TCustomExpertsWizard;
      var AImage: TBitmap);
    procedure CertFilesWizardPageCreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure CertFilesWizardPageFrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure OnCertFilesTest(Sender: TObject);
  private
    FProjectType: TProjectType;
    FHTTPS: Boolean;
    FHTTPPort: Integer;
    function GetCertFileInfo: TDSExpertCertFileInfo;
    function GetHTTPPort: Integer;
  protected
    procedure EnablePages; virtual;
  public
    { Public declarations }
    property ProjectType: TProjectType read FProjectType write FProjectType;
    property HTTPPort: Integer read GetHTTPPort;
    property HTTPS: Boolean read FHTTPS;
    property CertFileInfo: TDSExpertCertFileInfo read GetCertFileInfo;
  end;

var
  InetExpertsUIModule: TInetExpertsUIModule;

implementation

{$R *.dfm}

uses InetHTTPPortWizardPage, Dialogs, InetDesignResStrs;


procedure TInetExpertsUIModule.ApplicationTypeWizardPage1CreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
begin
  AFrame := TWebServerWizardFrame.Create(AOwner);
end;

procedure TInetExpertsUIModule.ApplicationTypeWizardPage1FrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TWebServerWizardFrame(ApplicationTypeWizardPage1.Frame).ProjectType := FProjectType;
end;

procedure TInetExpertsUIModule.ApplicationTypeWizardPage1FrameOptionChanged(
  Sender: TCustomExpertsFrameWizardPage);
begin
  FProjectType := TWebServerWizardFrame(ApplicationTypeWizardPage1.Frame).ProjectType;
  EnablePages;
end;

procedure TInetExpertsUIModule.DataModuleCreate(Sender: TObject);
begin
  WebServerProjectWizard.HelpContext := 1655;
  FProjectType := ptIndyForm;
  FHTTPPort := 8080;
  FHTTPS := False;
  EnablePages;
end;

procedure TInetExpertsUIModule.EnablePages;
begin
  WebServerProjectWizard.PageEnabled[PortsWizardPage] :=
    (FprojectType = ptIndyForm) or (FProjectType = ptIndyConsole);
  WebServerProjectWizard.PageEnabled[CertFilesWizardPage] :=
    FHTTPS and ((FProjectType = ptIndyForm) or (FProjectType = ptIndyConsole));
end;

function TInetExpertsUIModule.GetCertFileInfo: TDSExpertCertFileInfo;
begin
  if CertFilesWizardPage.Frame <> nil then
    Result := TInetCertFilesWizardFrame(CertFilesWizardPage.Frame).CertFileInfo;
end;

function TInetExpertsUIModule.GetHTTPPort: Integer;
begin
  if PortsWizardPage.Frame <> nil then
    Result := TInetHTTPPortWizardFrame(PortsWizardPage.Frame).Port
  else
    Result := FHTTPPort;
end;

procedure TInetExpertsUIModule.PortsWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
begin
  AFrame := TInetHTTPPortWizardFrame.Create(AOwner);
end;

procedure TInetExpertsUIModule.PortsWizardPageEnterPage(
  Sender: TCustomExpertsWizardPage;
  PageTransition: TExpertsWizardPageTransition);
begin
  TInetHTTPPortWizardFrame(PortsWizardPage.Frame).AllowHTTPS :=
    (FProjectType = ptIndyForm) or (FProjecttype = ptIndyConsole);
end;

procedure TInetExpertsUIModule.PortsWizardPageFrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TInetHTTPPortWizardFrame(PortsWizardPage.Frame).HTTPS := FHTTPS;
  TInetHTTPPortWizardFrame(PortsWizardPage.Frame).AllowHTTPS := True;
  TInetHTTPPortWizardFrame(PortsWizardPage.Frame).Port := FHTTPPort;
end;

procedure TInetExpertsUIModule.PortsWizardPageFrameOptionChanged(
  Sender: TCustomExpertsFrameWizardPage);
begin
  FHTTPS := TInetHTTPPortWizardFrame(PortsWizardPage.Frame).HTTPS;
  FHTTPPort := TInetHTTPPortWizardFrame(PortsWizardPage.Frame).Port;
  EnablePages;
end;

procedure TInetExpertsUIModule.WebServerProjectWizardLoadImage(
  Sender: TCustomExpertsWizard; var AImage: TBitmap);
begin
  AImage := TBitmap.Create;
  try
    AImage.LoadFromResourceName(HInstance, 'NEWPROJECTWIZARD');  // Do not localize
  except
    FreeAndNil(AImage);
  end;
end;


procedure TInetExpertsUIModule.CertFilesWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TInetCertFilesWizardFrame;
begin
  LFrame := TInetCertFilesWizardFrame.Create(AOwner);
  AFrame := LFrame;
end;

procedure TInetExpertsUIModule.CertFilesWizardPageFrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TInetCertFilesWizardFrame(AFrame).OnTest := OnCertFilesTest;
end;

procedure TInetExpertsUIModule.OnCertFilesTest(Sender: TObject);
begin
  TInetCertFilesWizardFrame(CertFilesWizardPage.Frame).TestCertFiles(Self.HTTPPort);
end;

end.
