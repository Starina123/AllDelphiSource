{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerClassWizardPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, WizardAPI, StdCtrls, DSMrWizardCommon, DSServerFeatures, ExpertsUIWizard;


type

  TDSServerClassFrame = class(TFrame, IExpertsWizardPageFrame)
    rbTComponent: TRadioButton;
    rbDataModule: TRadioButton;
    rbDSServerModule: TRadioButton;
    procedure OnButtonClick(Sender: TObject);
  private
    FPage: TCustomExpertsFrameWizardPage;
    function GetSelectedClassName: TDSServerClassName;
    procedure SetSelectedClassName(const Value: TDSServerClassName);
    function GetLeftMargin: Integer;
    procedure SetLeftMargin(const Value: Integer);
    function GetWizardInfo: string;
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
//    class function CreateFrame(AOwner: TComponent): TDSServerClassFrame; static;
    property SelectedClassName: TDSServerClassName read GetSelectedClassName write SetSelectedClassName;
  end;

implementation

{$R *.dfm}

uses DSServerDsnResStrs;


procedure TDSServerClassFrame.ExpertsFrameCreated(
  APage: TCustomExpertsFrameWizardPage);
begin
  LeftMargin := ExpertsUIWizard.cExpertsLeftMargin;
  FPage := APage;
  FPage.Title := sClassWizardPageTitle;
  FPage.Description := sClassWizardPageDescription;
end;

procedure TDSServerClassFrame.ExpertsFrameEnterPage(
  APage: TCustomExpertsFrameWizardPage);
begin
  //APage.UpdateInfo;
end;

procedure TDSServerClassFrame.ExpertsFrameUpdateInfo(
  ASender: TCustomExpertsWizardPage; var AHandled: Boolean);
begin
  AHandled := True;
  ASender.WizardInfo := GetWizardInfo;
end;

function TDSServerClassFrame.GetWizardInfo: string;
begin
  case SelectedClassName of
    scComponent: Result := sComponentInfo;
    scDataModule: Result := sDataModuleInfo;
    scDSServerModule: Result := sDSServerModuleInfo;
  else
    Assert(False);
  end;
end;

function TDSServerClassFrame.ExpertsFrameValidatePage(
  ASender: TCustomExpertsWizardPage; var AHandled: Boolean): Boolean;
begin
  AHandled := True;
  Result := True; // Always valid
end;

function TDSServerClassFrame.GetLeftMargin: Integer;
begin
  Result := rbTComponent.Left;
end;

function TDSServerClassFrame.GetSelectedClassName: TDSServerClassName;
begin
  if rbTComponent.Checked then
    Result := TDSServerClassName.scComponent
  else if rbDataModule.Checked then
    Result := TDSServerClassName.scDataModule
  else if rbDSServerModule.Checked then
    Result := TDSServerClassName.scDSServerModule
  else
  begin
    Result := scComponent;
    Assert(False);
  end;
end;

procedure TDSServerClassFrame.OnButtonClick(Sender: TObject);
begin
  if FPage <> nil then
  begin
    FPage.DoOnFrameOptionsChanged;
    FPage.UpdateInfo;
  end;
end;

procedure TDSServerClassFrame.SetLeftMargin(const Value: Integer);
begin
  rbTComponent.Left := Value;
  rbDataModule.Left := Value;
  rbDSServerModule.Left := Value;
end;

procedure TDSServerClassFrame.SetSelectedClassName(
  const Value: TDSServerClassName);
begin
  case Value of
    scComponent:
      rbTComponent.Checked := True;
    scDataModule:
      rbDataModule.Checked := True;
    scDSServerModule:
      rbDSServerModule.Checked := True;
  end;
end;

end.
