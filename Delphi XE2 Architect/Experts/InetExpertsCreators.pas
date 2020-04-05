{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit InetExpertsCreators;

interface

uses
  SysUtils, Classes, ExpertsProject, ExpertsTemplates, ExpertsModules, InetWiz,
    InetCertFilesWizardPage;

type
  TInetExpertsCreatorsModule = class(TDataModule)
    CommonTemplateProperties: TExpertsTemplateProperties;
    WebModule: TExpertsModule;
    ProjectTemplate: TExpertsTemplateFile;
    WebProject: TExpertsProject;
    ConsoleSourceTemplate: TExpertsTemplateFile;
    WebModuleIntfTemplate: TExpertsTemplateFile;
    WebModuleSourceTemplate: TExpertsTemplateFile;
    WebModuleDFMTemplate: TExpertsTemplateFile;
    ConsoleModule: TExpertsModule;
    ConsoleIntfTemplate: TExpertsTemplateFile;
    ConsoleDFMTemplate: TExpertsTemplateFile;
    WebModulesTemplatePersonalityFiles: TExpertsTemplatePersonalityFiles;
    procedure WebProjectCreateModules(Sender: TCustomExpertsProject;
      const APersonality: string);
  private
    FProjectType: TProjectType;
    FHTTPPort: Integer;
    FPersonality: string;
    FHTTPS: Boolean;
    FCertFileInfo: TDSExpertCertFileInfo;
    procedure SetProjectType(AValue: TProjectType);
    procedure SetHTTPPort(const Value: Integer);
//    procedure SetPersonality(const Value: string);
    procedure SetHTTPS(const Value: Boolean);
    procedure SetCertFileInfo(const Value: TDSExpertCertFileInfo);
  protected
    procedure CreateConsoleModule(const APersonality: string); virtual;
    procedure CreateWebModule(const APersonality: string); virtual;
    procedure UpdateProperties; virtual;
    procedure CreateModules(const APersonality: string); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
    property ProjectType: TProjectType read FProjectType write SetProjectType;
    property HTTPPort: Integer read FHTTPPort write SetHTTPPort;
    property HTTPS: Boolean read FHTTPS write SetHTTPS;
    property Personality: string read FPersonality write FPersonality;
    property CertFileInfo: TDSExpertCertFileInfo write SetCertFileInfo;
  end;

var
  InetExpertsCreatorsModule: TInetExpertsCreatorsModule;

implementation

{$R *.dfm}

uses ToolsApi, InetExpertsTemplateProperties, StrUtils;

constructor TInetExpertsCreatorsModule.Create(AOwner: TComponent);
begin
  inherited;
  FPersonality := sDelphiPersonality;
end;

procedure TInetExpertsCreatorsModule.SetCertFileInfo(
  const Value: TDSExpertCertFileInfo);
begin
  FCertFileInfo := Value;
  UpdateProperties;
end;

procedure TInetExpertsCreatorsModule.SetHTTPPort(const Value: Integer);
begin
  FHTTPPort := Value;
  UpdateProperties;
end;

procedure TInetExpertsCreatorsModule.SetHTTPS(const Value: Boolean);
begin
  FHTTPS := Value;
  UpdateProperties;
end;

procedure TInetExpertsCreatorsModule.SetProjectType(AValue: TProjectType);
begin
  FProjectType := AValue;
  UpdateProperties;
end;

procedure TInetExpertsCreatorsModule.UpdateProperties;
  procedure SetTemplateProperty(const AName: string; AValue: Boolean);
  begin
    if AValue then
      CommonTemplateProperties.Properties.Values[AName] := sTrue
    else
      CommonTemplateProperties.Properties.Values[AName] := sFalse
  end;

  function EscapePath(const APath: string): string;
  begin
    Result := APath;
    if Personality = sCBuilderPersonality then
    begin
      Result := ReplaceStr(Result, '\', '\\');
    end;
  end;

  function EscapePassword(const APath: string): string;
  begin
    Result := APath;
    if Personality = sCBuilderPersonality then
    begin
      ReplaceStr(Result, '"', '\"');
    end
    else
      ReplaceStr(Result, '''', '''''');

  end;

begin
  ProjectTemplate.TemplatePropertiesDoc.Clear;
  case FProjectType of
    ptISAPI:
    begin
      ProjectTemplate.TemplatePropertiesDoc.Values[sIsapiSource] := sTrue;
      WebProject.ProjectType := ptLibrary;
    end;
    ptCGI:
    begin
      ProjectTemplate.TemplatePropertiesDoc.Values[sCGISource] := sTrue;
      WebProject.ProjectType := ptConsole;
    end;
    ptIndyForm:
    begin
      ProjectTemplate.TemplatePropertiesDoc.Values[sIndyFormProjectSource] := sTrue;
      WebProject.ProjectType := ptApplication;
    end;
    ptIndyConsole:
    begin
      ProjectTemplate.TemplatePropertiesDoc.Values[sIndyConsoleProjectSource] := sTrue;
      WebProject.ProjectType := ptConsole;
    end
  else
    Assert(False);
  end;
  CommonTemplateProperties.Properties.Clear;
  CommonTemplateProperties.Properties.Values[sDBXTerminateThreads] := sFalse;
  CommonTemplateProperties.Properties.Values[sSetWebModuleClass] := sTrue;
  CommonTemplateProperties.Properties.Values[sHTTPPort] := IntToStr(HTTPPort);
  CommonTemplateProperties.Properties.Values[sKeyFilePassword] := EscapePassword(FCertFileInfo.KeyFilePassword);
  CommonTemplateProperties.Properties.Values[sRootCertFile] := EscapePath(FCertFileInfo.RootCertFile);
  CommonTemplateProperties.Properties.Values[sCertFile] := EscapePath(FCertFileInfo.CertFile);
  CommonTemplateProperties.Properties.Values[sKeyFile] := EscapePath(FCertFileInfo.KeyFile);
  SetTemplateProperty(sHTTPS, HTTPS);
end;

procedure TInetExpertsCreatorsModule.WebProjectCreateModules(
  Sender: TCustomExpertsProject; const APersonality: string);
begin
  CreateModules(APersonality);
end;

procedure TInetExpertsCreatorsModule.CreateModules(const APersonality: string);
begin
  CreateConsoleModule(APersonality);
  CreateWebModule(APersonality);
end;


procedure TInetExpertsCreatorsModule.CreateConsoleModule(const APersonality: string);
begin
  case FProjectType of
    ptISAPI,
    ptCGI: ;
    ptIndyForm:
      // Create form
      ConsoleModule.CreateModule(APersonality);
    ptIndyConsole:
      ;
  else
    Assert(False);
  end;
end;

procedure TInetExpertsCreatorsModule.CreateWebModule(const APersonality: string);
begin
  WebModule.CreateModule(APersonality);
end;

end.
