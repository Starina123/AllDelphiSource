{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSStandAloneReg;

interface

procedure Register;

implementation

{$R *.res}

uses
  Windows, ToolsApi, Controls, Forms, SysUtils, Classes, Dialogs, ComObj, PlatformAPI,
  DSServerDsnResStrs, ExpertsRepository, DSServerExpertsCreators, DSServerExpertsUI,
  DSServerFeatures;

{ Register procedure }

procedure RegisterDSStandAloneProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality,
    SNewDSStandAloneAppExpertComment, SNewDSStandAloneAppExpertName,
    'Embarcadero.NewDataSnapStandAloneApp',  // do not localize
    rsDataSnapServerPage,
    'Embarcadero', // do not localize
    procedure
    var
      LUIModule: TDSServerExpertsUIModule;
    begin
      LUIModule := TDSServerExpertsUIModule.Create(nil);
      try
        LUIModule.DSStandAloneAppWizard.Execute(
          procedure
          var
            LModule: TDSServerExpertsCreatorsModule;
          begin
            LModule := TDSServerExpertsCreatorsModule.Create(nil);
            try
              // Set personality so the correct template files are used
              LModule.Personality := APersonality;
              // Indicate which type of project to create
              LModule.ProjectType := LUIModule.ProjectType;
              // Indicate port
              LModule.HTTPPort := LUIModule.HTTPPort;
              LModule.HTTPSPort := LUIModule.HTTPSPort;
              LModule.TCPIPPort := LUIModule.TCPIPPort;
              LModule.Features := LUIModule.Features;
              LModule.SelectedClassName := LUIModule.SelectedClassName;
              LModule.CertFileInfo := LUIModule.CertFileInfo;
              LModule.ProjectLocation := LUIModule.ProjectLocation;
              LModule.DSStandAloneProject.CreateProject(APersonality);
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
      Result := LoadIcon(HInstance, 'NEWDATASNAPSTANDALONEAPPICON')
    end,
    TArray<string>.Create(cWin32Platform, cWin64Platform),
    TArray<string>.Create()
    ) as IOTAWizard);
end;


procedure Register;
begin

  RegisterDSStandAloneProjectWizard(sDelphiPersonality);
  RegisterDSStandAloneProjectWizard(sCBuilderPersonality);
end;

end.
