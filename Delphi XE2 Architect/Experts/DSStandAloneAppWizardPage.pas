{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSStandAloneAppWizardPage;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, WizardAPI, StdCtrls, ExtCtrls, AppEvnts, InetWiz,
  DSMrWizardCommon, DSServerFeatures, ExpertsUIWizard;

type

  TDSStandAloneAppWizardFrame = class(TFrame, IExpertsWizardPageFrame)
    rbVCLApp: TRadioButton;
    rbConsoleApp: TRadioButton;
    rbServiceApp: TRadioButton;
    procedure OnRadioClick(Sender: TObject);
  private
    FPage: TCustomExpertsFrameWizardPage;
    function GetWizardInfo: string;
    function GetProjectType: TDSServerProjectType;
    procedure SetProjectType(AProjectType: TDSServerProjectType);
    function GetLeftMargin: Integer;
    procedure SetLeftMargin(const Value: Integer);
    { Private declarations }
    property LeftMargin: Integer read GetLeftMargin write SetLeftMargin;
  protected
    { IExpertsWizardPageFrame }
    function ExpertsFrameValidatePage(ASender: TCustomExpertsWizardPage; var AHandled: Boolean): Boolean;
    procedure ExpertsFrameUpdateInfo(ASender: TCustomExpertsWizardPage; var AHandled: Boolean);
    procedure ExpertsFrameCreated(APage: TCustomExpertsFrameWizardPage);
    procedure ExpertsFrameEnterPage(APage: TCustomExpertsFrameWizardPage);
  public
    { Public declarations }
//    class function CreateFrame(AOwner: TComponent): TDSStandAloneAppWizardFrame; static;
    property ProjectType: TDSServerProjectType read GetProjectType write SetProjectType;
  end;


implementation

{$R *.dfm}

uses NetConst, DSServerDsnResStrs;

procedure TDSStandAloneAppWizardFrame.OnRadioClick(Sender: TObject);
begin
  if FPage <> nil then
  begin
    FPage.DoOnFrameOptionsChanged;
    FPage.UpdateInfo;
  end;
end;

procedure TDSStandAloneAppWizardFrame.ExpertsFrameCreated(
  APage: TCustomExpertsFrameWizardPage);
begin
  LeftMargin := ExpertsUIWizard.cExpertsLeftMargin;
  FPage := APage;
  FPage.Title := sDSStandAloneApWizardPageTitle;
  FPage.Description := sDSStandAloneApWizardPageDescription;
end;

procedure TDSStandAloneAppWizardFrame.ExpertsFrameEnterPage(
  APage: TCustomExpertsFrameWizardPage);
begin
  //APage.UpdateInfo;
end;

procedure TDSStandAloneAppWizardFrame.ExpertsFrameUpdateInfo(
  ASender: TCustomExpertsWizardPage; var AHandled: Boolean);
begin
  ASender.WizardInfo := GetWizardInfo;
end;

function TDSStandAloneAppWizardFrame.ExpertsFrameValidatePage(
  ASender: TCustomExpertsWizardPage; var AHandled: Boolean): Boolean;
begin
  AHandled := True;
  Result := True;
end;

function TDSStandAloneAppWizardFrame.GetLeftMargin: Integer;
begin
  Result := rbVCLApp.Left;
end;

function TDSStandAloneAppWizardFrame.GetProjectType: TDSServerProjectType;
begin
  if rbVCLApp.Checked then
    Result := ptVCL
  else if rbConsoleApp.Checked then
    Result := ptConsole
  else if rbServiceApp.Checked then
    Result := ptService
  else
  begin
    Result := ptVCL;
    Assert(False);
  end;
end;

function TDSStandAloneAppWizardFrame.GetWizardInfo: string;
begin
  case ProjectType of
    ptConsole:
      Result := sConsoleInfo;
    ptService:
      Result := sServiceInfo;
    ptVCL:
      Result := sVCLInfo;
  else
    Result := '';
  end;
end;

procedure TDSStandAloneAppWizardFrame.SetLeftMargin(const Value: Integer);
begin
  rbVCLApp.Left := Value;
  rbConsoleApp.Left := Value;
  rbServiceApp.Left := Value;
end;

procedure TDSStandAloneAppWizardFrame.SetProjectType(AProjectType: TDSServerProjectType);
begin
  if ProjectType <> AProjectType then
  begin
    case AProjectType of
      ptConsole: rbConsoleApp.Checked := True;
      ptVCL: rbVCLApp.Checked := True;
      ptService: rbServiceApp.Checked := True;
    end;
    if FPage <> nil then
    begin
      FPage.DoOnFrameOptionsChanged;
      FPage.UpdateInfo;
    end;
  end;
end;

end.
