{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}


unit DSWebBrokerReg;

interface

procedure Register;

implementation

{$R *.res}

uses
  Windows, ToolsApi, Controls, Forms, SysUtils, Classes, Dialogs, ComObj,
  DSCreators, InetWiz, DSHTTPWebBroker, PlatformAPI,
  DSSource,
  DSServerScriptGen, StrUtils,
  WizardAPI, DSPortsWizardPage, DSServerDsnResStrs, DCCStrs, CommonOptionStrs,
  DSServerFeatures, ExpertsRepository, DSServerWebBrokerExpertsUI,
  DSServerWebBrokerExpertsCreators, DSRESTExpertsUI, DSRESTExpertsCreators;

{ Register procedure }
//  inherited Create(APersonality, (*'New ' +*) SNewDSWebAppExpertCaption,
//    SNewDSWebAppExpertComment, (*'New ' +*) SNewDSWebAppExpertName,
//    'Embarcadero.NewDataSnapWebApp', 'NEWDATASNAPWEBAPPICON');

procedure RegisterDSWebBrokerProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality,
    SNewDSWebAppExpertComment, SNewDSWebAppExpertName,
    'Embarcadero.NewDataSnapWebApp',  // do not localize
    rsDataSnapServerPage,
      'Embarcadero', // do not localize
    procedure
    var
      LUIModule: TDSServerWebBrokerExpertsUIModule;
    begin
      LUIModule := TDSServerWebBrokerExpertsUIModule.Create(nil);
      try
        LUIModule.WebServerProjectWizard.Execute(
          procedure
          var
            LModule: TDSServerWebBrokerExpertsCreatorsModule;
          begin
            LModule := TDSServerWebBrokerExpertsCreatorsModule.Create(nil);
            try
              // Set personality so the correct template files are used
              LModule.Personality := APersonality;
              // Indicate which type of project to create
              LModule.ProjectType := LUIModule.ProjectType;
              // Indicate port
              LModule.HTTPPort := LUIModule.HTTPPort;
              LModule.HTTPS := LUIModule.HTTPS;
              LModule.Features := LUIModule.Features;
              LModule.SelectedClassName := LUIModule.SelectedClassName;
              LModule.CertFileInfo := LUIModule.CertFileInfo;
              LModule.ProjectLocation := LUIModule.ProjectLocation;
              LModule.WebProject.CreateProject(APersonality);
            finally
              LModule.Free;
            end;
          end);
      finally
        LUIModule.Free;
      end;
    end,
    function: Cardinal
    begin
      Result := LoadIcon(HInstance, 'NEWDATASNAPWEBAPPICON')
    end,
    TArray<string>.Create(cWin32Platform, cWin64Platform),
    TArray<string>.Create()
    ) as IOTAWizard);
end;

procedure RegisterDSRESTProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality,
    SNewDSRESTAppExpertComment, SNewDSRESTAppExpertName,
    'Embarcadero.NewDataSnapRestApp',  // do not localize
    rsDataSnapServerPage,
      'Embarcadero', // do not localize
    procedure
    var
      LUIModule: TDSRestExpertsUIModule;
    begin
      LUIModule := TDSRestExpertsUIModule.Create(nil);
      try
        LUIModule.WebServerProjectWizard.Execute(
          procedure
          var
            LModule: TDSRESTExpertsCreatorsModule;
          begin
            LModule := TDSRESTExpertsCreatorsModule.Create(nil);
            try
              // Set personality so the correct template files are used
              LModule.Personality := APersonality;
              // Indicate which type of project to create
              LModule.ProjectType := LUIModule.ProjectType;
              // Indicate port
              LModule.HTTPPort := LUIModule.HTTPPort;
              LModule.HTTPS := LUIModule.HTTPS;
              LModule.Features := LUIModule.Features;
              LModule.SelectedClassName := LUIModule.SelectedClassName;
              LModule.CertFileInfo := LUIModule.CertFileInfo;
              LModule.ProjectLocation := LUIModule.ProjectLocation;
              LModule.WebProject.CreateProject(APersonality);
            finally
              LModule.Free;
            end;
          end);
      finally
        LUIModule.Free;
      end;
    end,
    function: Cardinal
    begin
      Result := LoadIcon(HInstance, 'NEWRESTAPPICON')
    end,
    TArray<string>.Create(cWin32Platform, cWin64Platform),
    TArray<string>.Create()
    ) as IOTAWizard);
end;


{ Register procedure }

procedure Register;
begin
  RegisterComponents(rsDatasnapServer, [TDSHTTPWebDispatcher]);

  RegisterDSWebBrokerProjectWizard(sDelphiPersonality);
  RegisterDSWebBrokerProjectWizard(sCBuilderPersonality);

  RegisterDSRESTProjectWizard(sDelphiPersonality);
  RegisterDSRESTProjectWizard(sCBuilderPersonality);

end;

end.
