{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerWebBrokerExpertsUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InetExpertsUI, ExpertsUIWizard, DSServerFeatures, DSProjectLocationWizardPage,
  DSServerFeatureManager;

type
  TDSServerWebBrokerExpertsUIModule = class(TInetExpertsUIModule)
    FeaturesWizardPage: TExpertsFeaturesWizardPage;
    ServerClassWizardPage: TExpertsFrameWizardPage;
    LocationWizardPage: TExpertsFrameWizardPage;
    procedure DataModuleCreate(Sender: TObject);
    procedure FeaturesWizardPageEnterPage(Sender: TCustomExpertsWizardPage;
      PageTransition: TExpertsWizardPageTransition);
    procedure FeaturesWizardPageFeatureChecked(
      AFeaturesWizardPage: TCustomExpertsFeaturesWizardPage);
    procedure FeaturesWizardPageWizardPageCreated(
      Sender: TCustomExpertsWizardPage);
    procedure ServerClassWizardPageCreateFrame(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
    procedure ServerClassWizardPageFrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure ServerClassWizardPageFrameOptionChanged(
      Sender: TCustomExpertsFrameWizardPage);
    procedure ApplicationTypeWizardPage1FrameCreated(
      Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
    procedure WebServerProjectWizardLoadImage(Sender: TCustomExpertsWizard;
      var AImage: TBitmap);
    procedure LocationWizardPageFrameCreate(
      Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
      out AFrame: TFrame);
  private
    FSelectedClassName: TDSServerClassName;
    FWizardType: TDSWizardType;
    FFeatures: TDSServerFeatures;
    FFeatureDescriptions: TArray<TFeatureDescription>;
    procedure SetSelectedClassName(const Value: TDSServerClassName);
  protected
    function GetProjectLocation: string; virtual;
    procedure SetDefaults; virtual;
    procedure EnablePages; override;
    property FeatureDescriptions: TArray<TFeatureDescription> read FFeatureDescriptions write FFeatureDescriptions;
    property WizardType: TDSWizardType read FWizardType write FWizardType;
  public
    property Features: TDSServerFeatures read FFeatures write FFeatures;
    property SelectedClassName: TDSServerClassName read FSelectedClassName write SetSelectedClassName;
    property ProjectLocation: string read GetProjectLocation;
  end;

var
  DSServerWebBrokerExpertsUIModule: TDSServerWebBrokerExpertsUIModule;

implementation

{$R *.dfm}

uses DSServerDsnResStrs, DSServerClassWizardPage,
  WebServerWizardPage, InetWiz;

procedure TDSServerWebBrokerExpertsUIModule.ApplicationTypeWizardPage1FrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  inherited;
  // Exclude CGI from DataSnap projects because it doesn't work well
  // with DBX connections.
  with TWebServerWizardFrame(ApplicationTypeWizardPage1.Frame) do
    HiddenProjectTypes := HiddenProjectTypes + [InetWiz.ptCGI];
end;

procedure TDSServerWebBrokerExpertsUIModule.SetDefaults;
begin
  WebServerProjectWizard.Caption := SNewDSWebAppExpertCaption;
//  hcDDataSnapWebApplication              = 4351;
//  hcDDataSnapStandAloneApplication       = 4352;
//  hcDDataSnapRESTApplication             = 4353;
  WizardType := wtWebBroker;
  WebServerProjectWizard.HelpContext := 4352;
  Features := [dsHTTPProtocol, dsServerMethodClass, dsSampleMethods];
  FeatureDescriptions := DefaultFeatureDescriptions;
  SelectedClassName := TDSServerClassName.scComponent;
end;

procedure TDSServerWebBrokerExpertsUIModule.DataModuleCreate(Sender: TObject);
begin
  inherited;
  SetDefaults;
  EnablePages;
end;

procedure TDSServerWebBrokerExpertsUIModule.EnablePages;
begin
  inherited;

  //enable project save location page if DataSnap Connectors or WebFiles are enabled
  //Otherwise, it doesn't matter where the project is saved
  WebServerProjectWizard.PageEnabled[LocationWizardPage] :=
    (FFeatures * [dsConnectors] <> []) or (FFeatures * [dsWebFiles] <> []);
end;

procedure TDSServerWebBrokerExpertsUIModule.ServerClassWizardPageCreateFrame(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent;
  out AFrame: TFrame);
var
  LFrame: TDSServerClassFrame;
begin
  LFrame := TDSServerClassFrame.Create(AOwner);
  LFrame.SelectedClassName := FSelectedClassName;
  AFrame := LFrame;
end;

procedure TDSServerWebBrokerExpertsUIModule.ServerClassWizardPageFrameCreated(
  Sender: TCustomExpertsFrameWizardPage; AFrame: TFrame);
begin
  TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName := FSelectedClassName;
end;

procedure TDSServerWebBrokerExpertsUIModule.ServerClassWizardPageFrameOptionChanged(
  Sender: TCustomExpertsFrameWizardPage);
begin
  FSelectedClassName := TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName;
end;


procedure TDSServerWebBrokerExpertsUIModule.SetSelectedClassName(
  const Value: TDSServerClassName);
begin
  FSelectedClassName := Value;
  if (ServerClassWizardPage.Frame <> nil) then
  begin
    TDSServerClassFrame(ServerClassWizardPage.Frame).SelectedClassName := Value;
  end;
end;

procedure TDSServerWebBrokerExpertsUIModule.WebServerProjectWizardLoadImage(
  Sender: TCustomExpertsWizard; var AImage: TBitmap);
begin
  AImage := TBitmap.Create;
  try
    AImage.LoadFromResourceName(HInstance, 'WIZARDDATASNAPWEBAPP');  // Do not localize
  except
    FreeAndNil(AImage);
  end;
end;

procedure TDSServerWebBrokerExpertsUIModule.FeaturesWizardPageEnterPage(
  Sender: TCustomExpertsWizardPage;
  PageTransition: TExpertsWizardPageTransition);
begin
  CheckFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender),
    FWizardType, FFeatures);
end;

procedure TDSServerWebBrokerExpertsUIModule.FeaturesWizardPageFeatureChecked(
  AFeaturesWizardPage: TCustomExpertsFeaturesWizardPage);
begin
  UpdateFeatures(FFeatureDescriptions, AFeaturesWizardPage, FWizardType, FFeatures);
  EnablePages;
end;

procedure TDSServerWebBrokerExpertsUIModule.FeaturesWizardPageWizardPageCreated(
  Sender: TCustomExpertsWizardPage);
begin
  Sender.Title :=  sFeaturesPageTitle;
  Sender.Description := sFeaturesPageDescription;
  AddFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender), FWizardType);
  CheckFeatures(FFeatureDescriptions, TExpertsFeaturesWizardPage(Sender),
    FWizardType, FFeatures);
end;

function TDSServerWebBrokerExpertsUIModule.GetProjectLocation: string;
begin
  if LocationWizardPage.Frame <> nil then
    Result := TDSProjectLocationWizardFrame(LocationWizardPage.Frame).ProjectLocation;
end;

procedure TDSServerWebBrokerExpertsUIModule.LocationWizardPageFrameCreate(
  Sender: TCustomExpertsFrameWizardPage; AOwner: TComponent; out AFrame: TFrame);
begin
  AFrame := TDSProjectLocationWizardFrame.Create(AOwner);
end;

end.
