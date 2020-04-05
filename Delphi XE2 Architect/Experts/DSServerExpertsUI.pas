{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerExpertsUI;

interface

uses
  SysUtils, Classes, Forms,
  ExpertsUIWizard, DSServerFeatures, DSServerFeatureManager, Graphics,
  InetCertFilesWizardPage, DSProjectLocationWizardPage;

type
  TDSServerExpertsUIModule = class(TDataModule)
    ApplicationTypeWizardPage1: TExpertsFrameWizardPage;
    DSStandAloneAppWizard: TExpertsWizard;
    PortsWizardPage: TExpertsFrameWizardPage;
    DSStandAloneFeaturesWizardPage: TExpertsFeaturesWizardPage;
    ServerClassWizardPage: TExpertsFrameWizardPage;
    CertFilesWizardPage: TExpertsFrameWizardPage;
    LocationWizardPage: TExpertsFrameWizardPage;
    procedure ApplicationTypeWizardPage1CreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure PortsWizardPageCreateFrame(Sender: TCustomExpertsFrameWizardPage;
      AOwner: TComponent; out AFrame: TFrame);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSStandAloneFeaturesWizardPageEnterPage(
      Sender: TCustomExpertsWizardPage;
      PageTransition: TExpertsWizardPageTransition);
    procedure DSStandAloneFeaturesWizardPageFeatureChecked(
      AFeaturesWizardPage: TCustomExpertsFeaturesWizardPage);
    procedure DSStandAloneFeaturesWizardPageWizardPageCreated(
      Sender: TCustomExpertsWizardPage);
    procedure ServerClassWizardPageCreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure PortsWizardPageEnterPage(Sender: TCustomExpertsWizardPage;
      PageTransition: TExpertsWizardPageTransition);
    procedure DSStandAloneAppWizardLoadImage(Sender: TCustomExpertsWizard;
      var AImage: TBitmap);
    procedure DSStandAloneFeaturesWizardPageLeavingPage(
      Sender: TCustomExpertsWizardPage;
      PageTransition: TExpertsWizardPageTransition; var Allow: Boolean);
    procedure CertFilesWizardPageCreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure CertFilesWizardPageFrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure ApplicationTypeWizardPage1FrameOptionChanged(
      Sender: TCustomExpertsFrameWizardPage);
    procedure ServerClassWizardPageFrameOptionChanged(
      Sender: TCustomExpertsFrameWizardPage);
    procedure ApplicationTypeWizardPage1FrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure ServerClassWizardPageFrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure LocationWizardPageFrameCreate(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
  private
    FFeatures: TDSServerFeatures;
    FProjectType: TDSServerProjectType;
    FSelectedClassName: TDSServerClassName;
    FWizardType: TDSWizardType;
    FFeatureDescriptions: TArray<TFeatureDescription>;
    procedure OnCertFilesTest(Sender: TObject);
  protected
    procedure SetDefaults; virtual;
    procedure EnablePages; virtual;
    function GetHTTPPort: Integer; virtual;
    procedure UpdatePorts; virtual;
    function GetTCPIPPort: Integer; virtual;
    procedure SetSelectedClassName(const Value: TDSServerClassName); virtual;
    function GetCertFileInfo: TDSExpertCertFileInfo; virtual;
    function GetHTTPSPort: Integer; virtual;
    function GetProjectLocation: string; virtual;
    property FeatureDescriptions: TArray<TFeatureDescription> read FFeatureDescriptions write FFeatureDescriptions;
  public
    constructor Create(AOwner: TComponent); override;
    property ProjectType: TDSServerProjectType read FProjectType write FProjectType ;
    property HTTPPort: Integer read GetHTTPPort;
    property HTTPSPort: Integer read GetHTTPSPort;
    property TCPIPPort: Integer read GetTCPIPPort;
    property Features: TDSServerFeatures read FFeatures write FFeatures;
    property SelectedClassName: TDSServerClassName read FSelectedClassName write SetSelectedClassName;
    property CertFileInfo: TDSExpertCertFileInfo read GetCertFileInfo;
    property ProjectLocation: string read GetProjectLocation;
  end;

var
  DSServerExpertsUIModule: TDSServerExpertsUIModule;

implementation

{$R *.dfm}

uses Dialogs, DSStandAloneAppWizardPage, DSPortsWizardPage,
  DSServerDsnResStrs, DSServerClassWizardPage, InetDesignResStrs;


procedure TDSServerExpertsUIModule.ApplicationTypeWizardPage1CreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TDSStandAloneAppWizardFrame;
begin
  LFrame := TDSStandAloneAppWizardFrame.Create(AOwner);
  AFrame := LFrame;

end;

procedure TDSServerExpertsUIModule.ApplicationTypeWizardPage1FrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TDSStandAloneAppWizardFrame(ApplicationTypeWizardPage1.Frame).ProjectType := FProjectType;
end;

procedure TDSServerExpertsUIModule.ApplicationTypeWizardPage1FrameOptionChanged(
  Sender: TCustomExpertsFrameWizardPage);
begin
  FProjectType := TDSStandAloneAppWizardFrame(ApplicationTypeWizardPage1.Frame).ProjectType;
  EnablePages;
end;

procedure TDSServerExpertsUIModule.CertFilesWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TInetCertFilesWizardFrame;
begin
  LFrame := TInetCertFilesWizardFrame.Create(AOwner);
  AFrame := LFrame;
end;

procedure TDSServerExpertsUIModule.CertFilesWizardPageFrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TInetCertFilesWizardFrame(AFrame).OnTest := OnCertFilesTest;
end;

constructor TDSServerExpertsUIModule.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TDSServerExpertsUIModule.OnCertFilesTest(Sender: TObject);
begin
  TInetCertFilesWizardFrame(CertFilesWizardPage.Frame).TestCertFiles(Self.HTTPSPort);
end;

procedure TDSServerExpertsUIModule.SetDefaults;
begin
//  hcDDataSnapWebApplication              = 4351;
//  hcDDataSnapStandAloneApplication       = 4352;
//  hcDDataSnapRESTApplication             = 4353;
  DSStandAloneAppWizard.HelpContext := 4352;
  ProjectType := ptVCL;
  Features := [dsTCPProtocol, dsServerMethodClass, dsSampleMethods];
  FFeatureDescriptions := DefaultFeatureDescriptions;
  SelectedClassName := TDSServerClassName.scComponent;
end;

procedure TDSServerExpertsUIModule.DataModuleCreate(Sender: TObject);
begin
  FWizardType := wtStandAlone;
  SetDefaults;
  EnablePages;
end;

procedure TDSServerExpertsUIModule.EnablePages;
begin
  DSStandAloneAppWizard.PageEnabled[CertFilesWizardPage] :=
    (FFeatures * [dsHTTPSProtocol] <> []);

  //enable project save location page if DataSnap Connectors are enabled
  //otherwise, it doesn't matter where the project is saved
  DSStandAloneAppWizard.PageEnabled[LocationWizardPage] :=
    (FFeatures * [dsConnectors] <> []) or (FFeatures * [dsWebFiles] <> []);
end;

function TDSServerExpertsUIModule.GetCertFileInfo: TDSExpertCertFileInfo;
begin
  if CertFilesWizardPage.Frame <> nil then
    Result := TInetCertFilesWizardFrame(CertFilesWizardPage.Frame).CertFileInfo;
end;

function TDSServerExpertsUIModule.GetHTTPPort: Integer;
begin
  Result := 0;
  if PortsWizardPage.Frame <> nil then
  begin
    Result := TDSPortsWizardFrame(PortsWizardPage.Frame).Ports[portHTTP];
  end;
end;

function TDSServerExpertsUIModule.GetHTTPSPort: Integer;
begin
  Result := 0;
  if PortsWizardPage.Frame <> nil then
  begin
    Result := TDSPortsWizardFrame(PortsWizardPage.Frame).Ports[portHTTPS];
  end;
end;

function TDSServerExpertsUIModule.GetProjectLocation: string;
begin
  if LocationWizardPage.Frame <> nil then
    Result := TDSProjectLocationWizardFrame(LocationWizardPage.Frame).ProjectLocation
  else
    Result := EmptyStr;
end;

function TDSServerExpertsUIModule.GetTCPIPPort: Integer;
begin
  Result := 0;
  if PortsWizardPage.Frame <> nil then
  begin
    Result := TDSPortsWizardFrame(PortsWizardPage.Frame).Ports[portTCPIP];
  end;
end;

procedure TDSServerExpertsUIModule.LocationWizardPageFrameCreate(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent; out AFrame: TFrame);
begin
  AFrame := TDSProjectLocationWizardFrame.Create(AOwner);
end;

procedure TDSServerExpertsUIModule.PortsWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TDSPortsWizardFrame;
begin
  LFrame := TDSPortsWizardFrame.Create(AOwner);
  AFrame := LFrame;
end;

procedure TDSServerExpertsUIModule.PortsWizardPageEnterPage(
  Sender: TCustomExpertsWizardPage;
  PageTransition: TExpertsWizardPageTransition);
begin
  UpdatePorts;
end;

const
  nDefaultHTTPPort = 8080;
  nDefaultHTTPsPort = 8081;
  nDefaultTCPIPPort = 211;

procedure TDSServerExpertsUIModule.UpdatePorts;
var
  LPorts: TDSPortDescriptions;

  procedure AddPort(APort: TDSAvailablePort; ADefaultValue: Integer; const ALabel: string);
  var
    LDescription: TDSPortDescription;
  begin
    LDescription.Port := APort;
    LDescription.DefaultValue := ADefaultValue;
    LDescription.PortLabel := ALabel;
    SetLength(LPorts, Length(LPorts)+1);
    LPorts[Length(LPorts)-1] := LDescription;
  end;
begin
  if PortsWizardPage.Frame <>  nil then
  begin
    if dsTCPProtocol in FFeatures then
      AddPort(portTCPIP, nDefaultTCPIPPort, sTCPIPPortLabel);
    if (dsHTTPProtocol in FFeatures) or (dsWebServerPort in FFeatures) then
      AddPort(portHTTP, nDefaultHTTPPort, sHTTPPortLabel);
    if dsHTTPSProtocol in FFeatures then
      AddPort(portHTTPS, nDefaultHTTPSPort, sHTTPSPortLabel);
    TDSPortsWizardFrame(PortsWizardPage.Frame).PortDescriptions := LPorts;
  end;
end;

procedure TDSServerExpertsUIModule.ServerClassWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TDSServerClassFrame;
begin
  LFrame := TDSServerClassFrame.Create(AOwner);
  AFrame := LFrame;
end;

procedure TDSServerExpertsUIModule.ServerClassWizardPageFrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName := FSelectedClassName;
end;

procedure TDSServerExpertsUIModule.ServerClassWizardPageFrameOptionChanged(
  Sender: TCustomExpertsFrameWizardPage);
begin
  FSelectedClassName := TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName;
end;

procedure TDSServerExpertsUIModule.SetSelectedClassName(
  const Value: TDSServerClassName);
begin
  FSelectedClassName := Value;
  if (ServerClassWizardPage.Frame <> nil) then
  begin
    TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName := Value;
  end;
end;

procedure TDSServerExpertsUIModule.DSStandAloneAppWizardLoadImage(
  Sender: TCustomExpertsWizard; var AImage: TBitmap);
begin
  AImage := TBitmap.Create;
  try
    AImage.LoadFromResourceName(HInstance, 'WIZARDDATASNAPSTANDALONEAPP');  // Do not localize
  except
    FreeAndNil(AImage);
  end;
end;

procedure TDSServerExpertsUIModule.DSStandAloneFeaturesWizardPageEnterPage(
  Sender: TCustomExpertsWizardPage;
  PageTransition: TExpertsWizardPageTransition);
begin
  CheckFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender),
    FWizardType, FFeatures);
end;

procedure TDSServerExpertsUIModule.DSStandAloneFeaturesWizardPageFeatureChecked(
  AFeaturesWizardPage: TCustomExpertsFeaturesWizardPage);
begin
  UpdateFeatures(FFeatureDescriptions, AFeaturesWizardPage, FWizardType, FFeatures);
  EnablePages;
end;

procedure TDSServerExpertsUIModule.DSStandAloneFeaturesWizardPageLeavingPage(
  Sender: TCustomExpertsWizardPage;
  PageTransition: TExpertsWizardPageTransition; var Allow: Boolean);
begin
  // Must have at least one protocol
  if (FFeatures * [dsTCPProtocol, dsHTTPProtocol, dsHTTPSProtocol]) = []  then
    Include(FFeatures, dsTCPProtocol);
end;

procedure TDSServerExpertsUIModule.DSStandAloneFeaturesWizardPageWizardPageCreated(
  Sender: TCustomExpertsWizardPage);
begin
  Sender.Title :=  sFeaturesPageTitle;
  Sender.Description := sFeaturesPageDescription;
  AddFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender), FWizardType);
  CheckFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender),
    FWizardType, FFeatures);
end;

end.
