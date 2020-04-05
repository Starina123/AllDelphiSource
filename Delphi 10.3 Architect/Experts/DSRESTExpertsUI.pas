{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
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
  public
    function GetFrameWorkType: string;
  end;

var
  DSRESTExpertsUIModule: TDSRESTExpertsUIModule;

implementation

uses DSServerDSnResStrs, DSServerFeatures,
  InetWiz, InetFrameWorkWizardPage, ToolsAPI;

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

function TDSRESTExpertsUIModule.GetFrameWorkType: string;
var
  LFrameWorkType : TFrameWorkType;
begin
  if FrameWorkWizardPage.Frame <> nil then
    LFrameWorkType := TInetFrameWorkWizardFrame(FrameWorkWizardPage.Frame).FrameWorkType
  else
    LFrameWorkType := TInetFrameWorkWizardFrame.GetDefaultFrameWorkType;
  case LFrameWorkType of
    frameworkVCL: Result := sFrameworkTypeVCL;
    frameworkFMX: Result := sFrameworkTypeFMX;
  else
    Result := sFrameworkTypeNone;
  end;
end;

procedure TDSRESTExpertsUIModule.SetDefaults;
begin
  inherited;
  WebServerProjectWizard.Caption := SNewDSRESTAppExpertCaption;
  WebServerProjectWizard.HelpContext := 4353;
  Features := [dsHTTPProtocol, dsServerMethodClass, dsWebFiles, dsSampleMethods, dsSampleWebFiles
    // Don't use REST dispather by default because users will get unexpected errors connecting to it with
    // TSQLConnection/HTTP
    //,dsRESTDispatcher
    ];
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
