{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSRESTExpertsUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSServerWebBrokerExpertsUI, ExpertsUIWizard, DSProjectLocationWizardPage;

type
  TDSRESTExpertsUIModule = class(TDSServerWebBrokerExpertsUIModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure WebServerProjectWizardLoadImage(Sender: TCustomExpertsWizard;
      var AImage: TBitmap);
  protected
    procedure SetDefaults; override;
  end;

var
  DSRESTExpertsUIModule: TDSRESTExpertsUIModule;

implementation

uses DSServerDSnResStrs, DSServerFeatures;

{$R *.dfm}

procedure TDSRESTExpertsUIModule.DataModuleCreate(Sender: TObject);
begin
  inherited;
//  WebServerProjectWizard.Caption := SNewDSRESTAppExpertCaption;
////  hcDDataSnapWebApplication              = 4351;
////  hcDDataSnapStandAloneApplication       = 4352;
////  hcDDataSnapRESTApplication             = 4353;                     '
//  WebServerProjectWizard.HelpContext := 4353;
//  Features := [dsHTTPProtocol, dsServerMethodClass, dsWebFiles, dsSampleMethods, dsSampleWebFiles];
//  WizardType := wtWebBrokerRest;
//  EnablePages;

end;

procedure TDSRESTExpertsUIModule.SetDefaults;
begin
  inherited;
  WebServerProjectWizard.Caption := SNewDSRESTAppExpertCaption;
  WebServerProjectWizard.HelpContext := 4353;
  Features := [dsHTTPProtocol, dsServerMethodClass, dsWebFiles, dsSampleMethods, dsSampleWebFiles];
  WizardType := wtWebBrokerRest;
end;

procedure TDSRESTExpertsUIModule.WebServerProjectWizardLoadImage(
  Sender: TCustomExpertsWizard; var AImage: TBitmap);
begin
  AImage := TBitmap.Create;
  try
    AImage.LoadFromResourceName(HInstance, 'WIZARDRESTPROJECT');  // Do not localize
  except
    FreeAndNil(AImage);
  end;
end;

end.
