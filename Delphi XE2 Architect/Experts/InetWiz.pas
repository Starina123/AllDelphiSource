{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{       Registration of Web server application and      }
{       internet components                             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit InetWiz;

// Remove this line when WebSnap wizards use the new framework
{$DEFINE SHOWOLDWIZARDS}
interface

//uses ExptIntf, VirtIntf, InetSource, Classes;
uses InetSource, Classes, Forms;

{$IFDEF LINUX}
resourcestring

     sNewWebModuleExpertName = 'Web Server Application';
     sNewWebModuleExpertComment = 'Creates a new web server application';
     sNewPage = 'New';
     sEditURLMap = 'Action Editor...';
{$ENDIF}

type
{$IFDEF MSWINDOWS}
  TProjectType = (ptISAPI, ptCGI, ptWinCGI, ptCOM, ptApache, ptApacheTwo,
    ptIndyForm, ptIndyConsole);
{$ENDIF}
{$IFDEF LINUX}
  TProjectType = (ptCGI, ptApache, ptCOM);
{$ENDIF}
  TProjectTypes = set of TProjectType;

  TWizardOption = (woUknown, woNoCrossplatformCB, woOutputToProjectDirectory, woDBXTerminateThreads);

  TWizardOptions = set of TWizardOption;

{$IFDEF SHOWOLDWIZARDS}
  IWebProjectCreatorExt = interface
    ['{5F45C5E3-5B66-4B0C-A08B-2C6A7CCF917E}']
    procedure CreateModuleText(ProjectType: TProjectType;
                           const CoClassName: string;
                           const ModuleIdent, FormIdent, AncestorIdent: string;
                           var ModuleText, IntfText, FormText: string);
  end;

  IWebProjectCreatorExt3 = interface
    ['{60DC5444-E602-4E8F-BEF0-201B8D06D16F}']
    function GetProjectFileName: string;
//    procedure ValidateForm(AForm: TForm);
    function HasModuleText: Boolean;
    procedure BeforeCreateModule(ProjectType: TProjectType;
                           const CoClassName: string);
    procedure AfterCreateModule(ProjectType: TProjectType;
                           const CoClassName: string);
    function HasWebModuleFactory: Boolean;
  end;

  IWebWizardExt = interface(IWebProjectCreatorExt)
    ['{742DC18C-B219-41B7-ADA2-AE8C719FE403}']
    function GetCaption: string;
    function GetHelpContext: Integer;
    function GetOptions: TWizardOptions;
    procedure SetOptions(value: TWizardOptions);
    property Options: TWizardOptions read GetOptions write SetOptions;
  end;

  ICustomizeForm = interface
    procedure AppendFrame(AFrame: TFrame);
  end;

  IWebWizardExt2 = interface
    ['{428AC5E1-9331-4EAB-B1BB-F5521E065623}']
    procedure CustomizeForm(ACustomizeForm: ICustomizeForm);
    procedure ValidateForm(AForm: TForm);
  end;
{$ENDIF}

//  IWebWizardExt3 = interface(IWebProjectCreatorExt3)
//  ['{A0BFC058-32AC-4789-9E78-75146AC814E7}']
////    function GetProjectFileName: string;
////    function HasModuleText: Boolean;
////    procedure BeforeCreateModule(ProjectType: TProjectType;
////                           const CoClassName: string);
////    procedure AfterCreateModule(ProjectType: TProjectType;
////                           const CoClassName: string);
////    function HasWebModuleFactory: Boolean;
//  end;


{$IFDEF SHOWOLDWIZARDS}
  TInetSources = class(TObject)
  private
    FSourceFlags: TSourceFlags;
    FPropValues: TStrings;
  public
    property SourceFlags: TSourceFlags read FSourceFlags write FSourceFlags;
    function GetInetSources(SourceIndex: TSourceIndex; const APersonality: string; APropValues: TStrings = nil): string;
    constructor Create(APropValues: TStrings=nil);
    destructor Destroy; override;
  end;
{$ENDIF}

  TCreateWebProjectOption = (wpCrossplatform, wpNamedProject, wpOutputToProjectDirectory, wbDBXTerminateThreads);
  TCreateWebProjectOptions = set of TCreateWebProjectOption;

{$IFDEF SHOWOLDWIZARDS}

function ExecuteWebWizardExt(const AWebWizardExt: IWebWizardExt; const APersonality: string): Boolean;
{$ENDIF}
procedure Register;
procedure AddBCBAppUnits(AProjectType: TProjectType);
{$IFDEF SHOWOLDWIZARDS}
procedure CreateWebProject(const AWebProjectCreatorExt: IWebProjectCreatorExt; const APersonality: string; AProjectType: TProjectType;
      ACoClassName: string; APort: Integer; AOptions: TCreateWebProjectOptions);
{$ENDIF}

implementation

uses {$IFDEF MSWINDOWS}HtColEdt, {$ENDIF}{$IFDEF LINUX}HtColEdtLin, {$ENDIF}
  ColnEdit, LibHelp, WebConst, NetConst, Windows, Messages, SysUtils, Controls,
  Dialogs, DesignIntf, DesignEditors, HTTPApp, PlatformAPI,
{$IFDEF SHOWOLDWIZARDS}
NwWebSrv,
{$ENDIF}
  DMForm, Consts, IStreams, ToolsAPI, DCCStrs, CommonOptionStrs, ExpertsRepository, InetExpertsUI,
  InetExpertsCreators;

{$IFDEF MSWINDOWS}
{$R *.res}
{$ENDIF}

type

{$IFDEF SHOWOLDWIZARDS}
  TCreator = class(TInterfacedObject)
  public
    { IOTACreator }
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
  end;

  TProjectCreator = class(TCreator, IOTACreator, IOTAProjectCreator, IOTAProjectCreator80
    (*,IOTAProjectCreator50*))
  private
  (*
    FPartial: Boolean;
    FDescription: string;
    FName: string;
    FIdent: string;
    *)
  private
    //constructor Create(APartial: Boolean; const ADescription, AName, AIdent: string); overload;
    //constructor Create(const ACreatorType: string); overload;
    FPersonality: string;
    property Personality: string read FPersonality;
    { IOTACreator }
    function GetCreatorType: string;
    { IOTAProjectCreator80 }
    function GetProjectPersonality: string;
    { IOTAProjectCreator }
    function GetFileName: string;
    function GetOptionFileName: string;
    function GetShowSource: Boolean;
    procedure NewDefaultModule;
    function NewOptionSource(const ProjectName: string): IOTAFile;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile;
    { IOTAProjectCreator50 }
    procedure NewDefaultProjectModule(const Project: IOTAProject);
  public
    constructor Create(const APersonality: string);
  end;


  TWebProjectCreator = class(TProjectCreator, IOTACreator, IOTAProjectCreator,
    IOTAProjectCreator160)
  private
    FProjectType: TProjectType;
    FCoClass: string;
    FPort: Integer;
    FOptions: TCreateWebProjectOptions;
    { IOTACreator }
    function GetCreatorType: string;
    { IOTAProjectCreator }
    function NewProjectSource(const ProjectName: string): IOTAFile;
    procedure NewDefaultModule;
    function GetFileName: string;
    { IExtendedSourceCreator }
    function GetFileSystem: string;
    function GetUnNamed: Boolean;
    procedure SetOutputToProjectDirectory;
    { IOTAProjectCreator160 }
    function GetFrameworkType: string;
    function GetPlatforms: TArray<string>;
    function GetPreferredPlatform: string;
    procedure SetInitialOptions(const NewProject: IOTAProject);
  public
    constructor Create(ProjectType: TProjectType; const APersonality: string; AOptions: TCreateWebProjectOptions); overload;
    constructor Create(const CoClass: string; const APersonality: string; AOptions: TCreateWebProjectOptions); overload;
    constructor Create(ProjectType: TProjectType; const APersonality: string; APort: Integer; AOptions: TCreateWebProjectOptions); overload;
  end;
{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}
 TModuleCreator = class(TCreator, IOTACreator, IOTAModuleCreator)
  (*
  private
    FProject: IOTAProject;
    FPartial: Boolean;
    FDescription: string;
    FName: string;
    FIdent: string;
    FSourceTemplate: string;
    *)
  private
    { IOTACreator }
    function GetCreatorType: string;
    function GetOwner: IOTAModule;
    { IOTAModuleCreator }
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  public
  (*
    constructor Create;
      const ADescription, AName, AIdent: string);  *)
  end;

  TFormModuleCreator = class(TModuleCreator, IOTAModuleCreator)
  private
    FCoClass: string;
    FPersonality: string;
    FProjectType: TProjectType;
    FSourceIndex: TSourceIndex;
    FIntfIndex: TSourceIndex;
    FFormIndex: TSourceIndex;
    FPort: Integer;
    FOptions: TCreateWebProjectOptions;
    { IOTAModuleCreator }
    function GetAncestorName: string;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function GetSource(AIndex: TSourceIndex): string;
    property Personality: string read FPersonality;
  public
    constructor Create(const APersonality: string; AProjectType: TProjectType; const ACoClass: string;
     APort: integer; AOptions: TCreateWebProjectOptions);
  end;

  TWebModuleCreator = class(TModuleCreator, IOTAModuleCreator)
  private
    FCoClass: string;
    FProjectType: TProjectType;
    FPersonality: string;
    { IOTAModuleCreator }
    function GetAncestorName: string;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    property Personality: string read FPersonality;
  protected
    function NewImplSourceText(const ModuleIdent, FormIdent, AncestorIdent: string): string; virtual;
    function NewIntfSourceText(const ModuleIdent, FormIdent, AncestorIdent: string): string; virtual;
    function NewFormFileText(const FormIdent, AncestorIdent: string): string; virtual;
  public
    constructor Create(const APersonality: string; AProjectType: TProjectType; const ACoClass: string = '');
  end;

  TWebExtModuleCreator = class(TWebModuleCreator)
  private
    FHaveText: Boolean;
    FModuleText, FIntfText, FFormText: string;
    FWebWizardExt: IWebProjectCreatorExt;
  protected
    function NewImplSourceText(const ModuleIdent, FormIdent, AncestorIdent: string): string; override;
    function NewIntfSourceText(const ModuleIdent, FormIdent, AncestorIdent: string): string; override;
    function NewFormFileText(const FormIdent, AncestorIdent: string): string; override;
    procedure GetText(const ModuleIdent, FormIdent, AncestorIdent: string);
  public
    constructor Create(const APersonality: string; AProjectType: TProjectType; const ACoClass: string;
      WebWizardExt: IWebProjectCreatorExt);
  end;
 {$ENDIF}

  TOTAFile = class(TInterfacedObject, IOTAFile)
  private
    FContent: string;
  public
    constructor Create(const AContent: string);
    { IOTAFile }
    function GetSource: string;
    function GetAge: TDateTime;
  end;

{$IFDEF SHOWOLDWIZARDS}

{ TNewWebModuleExpert }
  TNewWebModuleExpert = class(TNotifierObject, IOTANotifier, IOTAWizard,
    IOTARepositoryWizard, IOTAProjectWizard, IOTARepositoryWizard80)
  private
    FCancelled: Boolean;
    FPersonality: string;
    class function GetWebWizardExt: IInterface; static;
    class procedure SetWebWizardExt(const Value: IInterface); static;
    property Personality: string read FPersonality;
  public
    class property WebWizardExt: IInterface read GetWebWizardExt write SetWebWizardExt;
    class procedure CreateProject(const APersonality: string; AProjectType: TProjectType;
      ACoClassName: string; APort: Integer = 8080; AOptions: TCreateWebProjectOptions = []); static;
  public
    constructor Create(const APersonality: string);
    destructor Destroy; override;
    { IOTANotifier }
    procedure Destroyed;
    { IOTAWizard }
    function GetIDString: string;
    function GetName: string;
    procedure Execute;
    { IOTARespositoryWizard }
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;
    function GetState: TWizardState;
    { IOTARepositoryWizard80 }
    function GetGalleryCategory: IOTAGalleryCategory;
    function GetPersonality: string;
    function GetDesigner: string;

    { Flag whether the wizard was cancelled }
    property Cancelled: Boolean read FCancelled;
  end;
{$ENDIF}


  (*
{ TNewWebProject }

  TNewWebProject = class(TIProjectCreatorEx)
  private
    FProjectType: TProjectType;
    FCoClassName: string;
    function InitProject(ProjectType: TProjectType): TIProjectCreatorEx;
    function InitCOMProject(const ACoClassName: string): TIProjectCreatorEx;
  public
    function Existing: Boolean; override;
    function GetFileName: string; override;
    function GetFileSystem: string; override;
    function NewProjectSource(const ProjectName: string): string; override;
    procedure NewDefaultModule; override;
    procedure NewProjectResource(Module: TIModuleInterface); override;
    function GetOptionName: string; override;
    function NewOptionSource(const ProjectName: string): string; override;
  end;

{ TNewWebModule }

  TNewWebModule = class(TIModuleCreatorEx)
  public
    function Existing: Boolean; override;
    function GetAncestorName: string; override;
    function GetFileName: string; override;
    function GetFileSystem: string; override;
    function GetFormName: string; override;
    function NewModuleSource(const UnitIdent, FormIdent, AncestorIdent: string): string; override;
    procedure FormCreated(Form: TIFormInterface); override;
    function GetIntfName: string; override;
    function NewIntfSource(const UnitIdent, FormIdent, AncestorIdent: string): string; override;
  end;

{ TNewFormModule }

  TNewFormModule = class(TIModuleCreatorEx)
  public
    function Existing: Boolean; override;
    function GetAncestorName: string; override;
    function GetFileName: string; override;
    function GetFileSystem: string; override;
    function GetFormName: string; override;
    function NewModuleSource(const UnitIdent, FormIdent, AncestorIdent: string): string; override;
    procedure FormCreated(Form: TIFormInterface); override;
    function GetIntfName: string; override;
    function NewIntfSource(const UnitIdent, FormIdent, AncestorIdent: string): string; override;
  end;
  *)

{ TCustomWebModule }

  TCustomWebModule = class(TDataModuleCustomModule)//TDataModuleDesignerCustomModule)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure ValidateComponent(Component: TComponent); override;
  end;

  THackPersistent = class(TPersistent);

{$IFDEF SHOWOLDWIZARDS}

var
  InetSources: TInetSources;
{$ENDIF}

procedure AddBCBAppUnits(AProjectType: TProjectType);
begin
  // NOTE: This is done so that the linker finds the added file _before_ any user code
  //       otherwise the application is not initialized correctly and the app fails.
{$IFDEF MSWINDOWS}
  case AProjectType of
    ptWinCGI,
    ptCGI: GetActiveProject.AddFile('CGIApp.obj', False);   { do not localize }
    ptCOM: GetActiveProject.AddFile('SockApp.obj', False);  { do not localize }
    ptApache: GetActiveProject.AddFile('ApacheApp.obj', False);  { do not localize }
    ptApacheTwo: GetActiveProject.AddFile('ApacheTwoApp.obj', False);  { do not localize }
    ptISAPI: GetActiveProject.AddFile('ISAPIApp.obj', False);    { do not localize }
    ptIndyForm: GetActiveProject.AddFile('IdHTTPWebBrokerBridge.obj', False);    { do not localize }
    ptIndyConsole: GetActiveProject.AddFile('IdHTTPWebBrokerBridge.obj', False);    { do not localize }
  end;
{$ENDIF}
{$IFDEF LINUX}
  case AProjectType of
    ptCGI: GetActiveProject.AddFile('CGIApp.o', False);        { do not localize }
    ptApache: GetActiveProject.AddFile('ApacheApp.o', False);   { do not localize }
    ptCOM: GetActiveProject.AddFile('SockApp.o', False);  { do not localize }
  end;
{$ENDIF}
end;

{$IFDEF SHOWOLDWIZARDS}

{ TNewWebModuleExpert }

constructor TNewWebmoduleExpert.Create(const APersonality: string);
begin
  inherited Create;
  FPersonality := APersonality;
  //NewWebModuleExpertCounter := Self;
                                                                     
                                                 
                              
                                  
end;

destructor TNewWebModuleExpert.Destroy;
begin
  //NewWebModuleExpert := nil;
  inherited Destroy;
end;

function TNewWebModuleExpert.GetName: string;
begin
  Result := sNewWebModuleExpertName;
end;

function TNewWebModuleExpert.GetAuthor: string;
begin
  Result := 'Embarcadero'; // do not localize
end;

function TNewWebModuleExpert.GetComment: string;
begin
  Result := sNewWebModuleExpertComment;
end;

function TNewWebModuleExpert.GetPage: string;
begin
  Result := sNewPage;
end;

{$IFDEF MSWINDOWS}
function TNewWebModuleExpert.GetGlyph: Cardinal;
begin
  Result := LoadIcon(HInstance, 'WEBAPP');
end;
{$ENDIF}
{$IFDEF LINUX}
var
(* XPM *)
  InetWizLin: array[0..41] of PChar = (
  (* width height ncolors chars_per_pixel *)
  '32 32 9 1',
  (* colors *)
  '  c #000000',
  '. c None',
  'X c #C0C0C0',
  'o c #808080',
  'O c #000080',
  '+ c #FFFFFF',
  '@ c #008000',
  '# c #808000',
  '$ c #0000FF',
  (* pixels *)
  '................................',
  '.........XXXXXXX................',
  '.......XXXOOOOOOOO..............',
  '......XXOOOOOOOOOOOO............',
  '.....XX@OOOOOOOOOOOOO...........',
  '....XXO@@@@O@@OOOO@@OO..........',
  '...XXOO@###@O@@@@O@@OO..........',
  '...XOOO@#@@@@@@@@@@OOOO.........',
  '..XXOOO@@@#@O@@@O#@OOOO.........',
  '..XOOOO@@O@@@O@@@@OOOOO.........',
  '..XOOOOO@@#@@#@#@@OOOOOO........',
  '..XOOOOO@#@@#@@#@OOOOOOO........',
  '..XOOOOO@@#@#@#@@OOOOOOo........',
  '..XOOOOOO@#@@@@@@@OOOOoo........',
  '..XOOOOOOOO@#@O@@@OOOOoo........',
  '...OOOOOOOOO@@@OO@OOOOo.........',
  '...OOOOOOO                     .',
  '....@OOOOO $$$$$$$$$$$$ X X X o.',
  '....OOOOOO                    o.',
  '.....OOOOO ++++++++++++++++++ o.',
  '......OOOO ++++++++++++++++++ o.',
  '........OO ++++++++++++++++++ o.',
  '.......... ++++++++++++++++++ o.',
  '.......... ++++XXXXXX+XXXXXX+ o.',
  '.......... ++++X++++ +X++++ + o.',
  '.......... ++++X     +X     + o.',
  '.......... ++++++++++++++++++ o.',
  '..........                    o.',
  '..........ooooooooooooooooooooo.',
  '................................',
  '................................',
  '................................'
  );

function TNewWebModuleExpert.GetGlyph: Cardinal;
begin
  Result := Cardinal(@InetWizLin);
end;
{$ENDIF}

function TNewWebModuleExpert.GetState: TWizardState;
begin
  Result := [];
end;

function TNewWebModuleExpert.GetIDString: string;
begin
  Result := 'Borland.NewWebModule' + '.' + Personality;  // do not localize
end;

{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}
type
  TCustomizeForm = class(TInterfacedObject, ICustomizeForm)
  private
    FForm: TNewWebAppForm;
    FPrevFrame: TFrame;
    constructor Create(AForm: TNewWebAppForm);
    procedure AppendFrame(AFrame: TFrame);
  end;

constructor TCustomizeForm.Create(AForm: TNewWebAppForm);
begin
  FForm := AForm;
end;

procedure TCustomizeForm.AppendFrame(AFrame: TFrame);
var
  LTop: Integer;
  LMargins: TRect;
begin
  LMargins.Left := FForm.Panel1.Left;
  LMargins.Right := FForm.Width - (FForm.Panel1.Left + FForm.Panel1.Width);
  LMargins.Top := FForm.Panel1.Top;
  LMargins.Bottom := LMargins.Top;
  if FPrevFrame <> nil then
  begin
    FPrevFrame.Anchors := FPrevFrame.Anchors - [TAnchorKind.akBottom];
    LTop := FPrevFrame.Top + FPrevFrame.Height + LMargins.Top;
  end
  else
  begin
    FForm.Panel1.Anchors := FForm.Panel1.Anchors - [TAnchorKind.akBottom];
    LTop := FForm.Panel1.Top + FForm.Panel1.Height + LMargins.Top;
  end;
  FForm.Height := FForm.Height + AFrame.Height + LMargins.Top;
  FPrevFrame := AFrame;
  FForm.InsertControl(AFrame);
  if AFrame.Width > FForm.Panel1.Width then
    FForm.Width := FForm.Width + AFrame.Width - FForm.Panel1.Width;
  AFrame.Top := LTop;
  AFrame.Left := LMargins.Left;
  AFrame.Width := FForm.Panel1.Width;
  AFrame.Anchors := [TAnchorKind.akLeft, TAnchorKind.akRight, TAnchorKind.akTop];
  AFrame.TabOrder := FForm.OKButton.TabOrder;
  FForm.OKButton.TabOrder := FForm.OKButton.TabOrder + 1;
  FForm.CancelButton.TabOrder := FForm.CancelButton.TabOrder + 1;
  FForm.HelpButton.TabOrder := FForm.HelpButton.TabOrder + 1;
end;

{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}

procedure TNewWebModuleExpert.Execute;
var
  LWebWizardExt: IWebWizardExt;
  LWebWizardExt2: IWebWizardExt2;
  LNewWebAppForm: TNewWebAppForm;
  LCreateWebProjectOptions: TCreateWebProjectOptions;
begin
  LNewWebAppForm := TNewWebAppForm.Create(Application);
  if Supports(WebWizardExt, IWebWizardExt2, LWebWizardExt2) then
    LNewWebAppForm.ValidateProcedure :=
      procedure
      begin
        LWebWizardExt2.ValidateForm(LNewWebAppForm);
      end;
  LCreateWebProjectOptions := [];
  Supports(WebWizardExt, IWebWizardExt, LWebWizardExt);
  with LNewWebAppForm do
  try
    if Assigned(LWebWizardExt) then
    begin
      Caption := LWebWizardExt.GetCaption;
      HelpContext := LWebWizardExt.GetHelpContext;
      { Here the Wizard extension does not want cross-platform abilities }
      if woNoCrossPlatformCB in LWebWizardExt.Options then
      begin
        cbCrossPlatform.Visible := False;
        cbCrossPlatform.Checked := False;
      end;
      if woOutputToProjectDirectory in LWebWizardExt.Options then
        Include(LCreateWebProjectOptions, wpOutputToProjectDirectory);
      if woDBXTerminateThreads in LWebWizardExt.Options then
        Include(LCreateWebProjectOptions, wbDBXTerminateThreads);
      if Supports(WebWizardExt, IWebWizardExt2, LWebWizardExt2) then
        LWebWizardExt2.CustomizeForm(TCustomizeForm.Create(LNewWebAppForm));

    end;
    FCancelled := True;
    if ShowModal = mrOK then
    begin
//      if cbCrossPlatform.checked then
//        InetSources.SourceFlags := sfClx
//      else
//        InetSources.SourceFlags := sfVcl;
//      try
//        FCancelled := False;
//        if CreateNewApacheApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptApache, Personality))
//        else if CreateNewCOMWebApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(CoClassName.Text, Personality))
//        else if CreateNewCGIApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptCGI, Personality))
//{$IFDEF MSWINDOWS}
//        else if CreateNewApacheTwoApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptApacheTwo, Personality))
//        else if CreateNewISAPIApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptISAPI, Personality))
//        else if CreateNewIndyConsoleApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptIndyConsole, Personality))
//        else if CreateNewIndyVCLApp.Checked then
//          (BorlandIDEServices as IOTAModuleServices).CreateModule(
//            TWebProjectCreator.Create(ptIndyForm, Personality))
//{$ENDIF}
//      finally
//        InetSources.SourceFlags := sfActiveDesigner;
//      end;
      CreateProject(Personality, ProjectType, CoClassName.Text, 8080, LCreateWebProjectOptions); //cbCrossPlatform.checked);
    end;
  finally
    Free;
  end;
end;

                                                             
class procedure TNewWebModuleExpert.CreateProject(const APersonality: string; AProjectType: TProjectType; ACoClassName: string;
  APort: Integer; AOptions: TCreateWebProjectOptions);
begin
  if wpCrossplatform in AOptions then
    InetSources.SourceFlags := sfClx
  else
    InetSources.SourceFlags := sfVcl;
  try
    case AProjectType of
    ptISAPI:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptISAPI, APersonality, AOptions));
    ptCGI:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptCGI, APersonality, AOptions));
    ptCOM:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ACoClassName, APersonality, AOptions));
    ptApache:
       (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptApache, APersonality, AOptions));
   ptApacheTwo:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptApacheTwo, APersonality, AOptions));
    ptIndyForm:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptIndyForm, APersonality, APort, AOptions));
    ptIndyConsole:
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
        TWebProjectCreator.Create(ptIndyConsole, APersonality, APort, AOptions));
    end;
  finally
    InetSources.SourceFlags := sfActiveDesigner;
  end;
end;

procedure TNewWebModuleExpert.Destroyed;
begin
  WebWizardExt := nil;
end;

function TNewWebModuleExpert.GetDesigner: string;
begin
  Result := dVCL;
end;

function TNewWebModuleExpert.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := nil;
end;

function TNewWebModuleExpert.GetPersonality: string;
begin
  Result := Personality;
end;

var
  FStaticWebWizardExt: IInterface;

class function TNewWebModuleExpert.GetWebWizardExt: IInterface;
begin
  Result := FStaticWebWizardExt;
end;

class procedure TNewWebModuleExpert.SetWebWizardExt(const Value: IInterface);
begin
  FStaticWebWizardExt := Value;
end;

{$ENDIF}

{ TCustomWebModule }

procEdure TCustomWebModule.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
  begin
                                             
    ShowCollectionEditor({TForm(Root.Owner).}Designer, Root,
      TCustomWebDispatcher(Root).Actions, 'Actions');
  end;
end;

function TCustomWebModule.GetVerb(Index: Integer): string;
begin
  if Index = 0 then
    Result := sEditURLMap
  else Result := '';
end;

function TCustomWebModule.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TCustomWebModule.ValidateComponent(Component: TComponent);
begin
  if (Component = nil) or (Component is TControl) then
    raise Exception.CreateRes(@SControlInWebModule);
end;

{$IFDEF SHOWOLDWIZARDS}
{ TInetSources }
constructor TInetSources.Create(APropValues: TStrings);
begin
  if APropValues <> nil then
    FPropValues := APropValues
  else
  FPropValues := TStringList.Create;
  FSourceFlags := sfActiveDesigner;
end;

destructor TInetSources.Destroy;
begin
  FPropValues.Free;
  inherited;
end;

function TInetSources.GetInetSources(
  SourceIndex: TSourceIndex; const APersonality: string; APropValues: TStrings): string;
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    S.Assign(FPropValues);
    S.Add(SourceTypeNames[SourceIndex] + '=TRUE'); // Do not localize
    if APropValues <> nil then
      S.AddStrings(APropValues);
    Result := GetSourceFromTemplate(WebModFileName(APersonality), S, SourceFlags);
  finally
    S.Free;
  end;
end;
{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}
function ExecuteWebWizardExt(const AWebWizardExt: IWebWizardExt; const APersonality: string): Boolean;
var
  NewWebModuleExpert: TNewWebModuleExpert;
  Counter: IInterface;
begin
  NewWebModuleExpert := TNewWebModuleExpert.Create(APersonality);
  Counter := NewWebModuleExpert as IInterface;
  TNewWebModuleExpert.WebWizardExt := AWebWizardExt;
  try
    NewWebModuleExpert.Execute;
  finally
    TNewWebModuleExpert.WebWizardExt := nil;
  end;
  Result := not NewWebModuleExpert.Cancelled;
end;
{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}
procedure CreateWebProject(const AWebProjectCreatorExt: IWebProjectCreatorExt; const APersonality: string; AProjectType: TProjectType;
      ACoClassName: string; APort: Integer; AOptions: TCreateWebProjectOptions);
begin
  TNewWebModuleExpert.WebWizardExt := AWebProjectCreatorExt;
  try
    TNewWebModuleExpert.CreateProject(APersonality, AProjectType, ACoClassName, APort, AOptions);
  finally
    TNewWebModuleExpert.WebWizardExt := nil;
  end;
end;

{ TCreator }

function TCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TCreator.GetOwner: IOTAModule;
begin
  Result := nil;
end;

function TCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;
{$ENDIF}

{ TModuleCreator }

(*
constructor TModuleCreator.Create(const AProject: IOTAProject; APartial: Boolean;
  const ADescription, AName, AIdent: string);
begin
  FProject := AProject;
  FPartial := APartial;
  FDescription := ADescription;
  FName := AName;
  FIdent := AIdent;
  FSourceTemplate := PChar(LockResource(LoadResource(HInstance,
    FindResource(HInstance, 'KEYBINDINGSOURCE', RT_RCDATA))));  
end;
*)

(*
constructor TModuleCreator.Create(const AProject: IOTAProject);
begin
  FProject := AProject;
end;
*)

{$IFDEF SHOWOLDWIZARDS}

procedure TModuleCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin

end;

function TModuleCreator.GetAncestorName: string;
begin
  Result := '';
end;

function TModuleCreator.GetCreatorType: string;
begin
  Result := sForm;
end;

function TModuleCreator.GetFormName: string;
begin
  Result := '';
end;

function TModuleCreator.GetImplFileName: string;
begin
  Result := '';
end;

function TModuleCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TModuleCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TModuleCreator.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function TModuleCreator.GetShowForm: Boolean;
begin
  Result := True;
end;

function TModuleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TModuleCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

const
  BindingTypes: array[Boolean] of string = (
    'btComplete', 'btPartial');

function TModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;
{$ENDIF}
{ TProjectCreator }

(*
constructor TProjectCreator.Create(APartial: Boolean; const ADescription,
  AName, AIdent: string);
begin
  inherited Create;
  FPartial := APartial;
  FDescription := ADescription;
  FName := AName;
  FIdent := AIdent;
end;

constructor TProjectCreator.Create(const ACreatorType: string);
begin
  FCreatorType := ACreatorType;
end;

function TProjectCreator.GetCreatorType: string;
begin
  Result := FCreatorType;
end;
*)

{$IFDEF SHOWOLDWIZARDS}
constructor TProjectCreator.Create(const APersonality: string);
begin
  FPersonality := APersonality;
end;

function TProjectCreator.GetCreatorType: string;
begin
  Result := '';
end;

function TProjectCreator.GetFileName: string;
begin
  Result := '';
end;

function TProjectCreator.GetOptionFileName: string;
begin
  Result := '';
end;

function TProjectCreator.GetProjectPersonality: string;
begin
  Result := Personality;
end;

function TProjectCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

procedure TProjectCreator.NewDefaultModule;
begin
end;

procedure TProjectCreator.NewDefaultProjectModule(const Project: IOTAProject);
begin
  NewDefaultModule;
end;

function TProjectCreator.NewOptionSource(const ProjectName: string): IOTAFile;
begin
  Result := nil;
end;

procedure TProjectCreator.NewProjectResource(const Project: IOTAProject);
begin
  { do nothing here }
end;

function TProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
begin
  Result := nil;
end;
{$ENDIF}

{ TOTAFile }

constructor TOTAFile.Create(const AContent: string);
begin
  FContent := AContent;
end;

function TOTAFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TOTAFile.GetSource: string;
begin
  Result := FContent;
end;

{ Register procedure }

procedure RegisterWebProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality,
    sNewWebModuleExpertComment, sNewWebModuleExpertName,   'Borland.NewWebModule',  // do not localize
    sNewPage,
      'Embarcadero', // do not localize
    procedure
    var
      LUIModule: TInetExpertsUIModule;
    begin
      LUIModule := TInetExpertsUIModule.Create(nil);
      try
        LUIModule.WebServerProjectWizard.Execute(
          procedure
          var
            LModule: TInetExpertsCreatorsModule;
          begin
            LModule := TInetExpertsCreatorsModule.Create(nil);
            try
              // Set personality so the correct template files are used
              LModule.Personality := APersonality;
              // Indicate which type of project to create
              LModule.ProjectType := LUIModule.ProjectType;
              // Indicate port
              LModule.HTTPPort := LUIModule.HTTPPort;
              LModule.HTTPS := LUIModule.HTTPS;
              LModule.CertFileInfo := LUIModule.CertFileInfo;
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
      Result := LoadIcon(HInstance, 'WEBAPP')
    end,
    TArray<string>.Create(cWin32Platform, cWin64Platform),
    TArray<string>.Create()
    ) as IOTAWizard);
end;

procedure Register;
begin
  RegisterCustomModule(TWebModule, TCustomWebModule);
  RegisterWebProjectWizard(sDelphiPersonality);
  RegisterWebProjectWizard(sCBuilderPersonality);
end;

{$IFDEF SHOWOLDWIZARDS}
procedure InitWeb;
begin
  InetSources := TInetSources.Create;
end;

procedure DoneWeb;
begin
  //NewWebModuleExpertCounter := nil;
  FreeAndNil(InetSources);
end;
{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}

{ TWebProjectCreator }

constructor TWebProjectCreator.Create(ProjectType: TProjectType; const APersonality: string; AOptions: TCreateWebProjectOptions);
begin
  inherited Create(APersonality);
  FOptions := AOptions;
  FProjectType := ProjectType;
end;

constructor TWebProjectCreator.Create(const CoClass: string; const APersonality: string; AOptions: TCreateWebProjectOptions);
begin
  FCoClass := CoClass;
  Create(ptCOM, APersonality, AOptions);
end;

constructor TWebProjectCreator.Create(ProjectType: TProjectType; const APersonality: string; APort: Integer; AOptions: TCreateWebProjectOptions);
begin
  FPort := APort;
  Create(ProjectType, APersonality, AOptions);
end;

function TWebProjectCreator.GetCreatorType: string;
begin
  case FProjectType of
    ptISAPI:      Result := sLibrary;
    ptCGI:        Result := sConsole;
    ptCOM:        Result := sApplication;
    ptApache:     Result := sLibrary;
    ptApacheTwo:  Result := sLibrary;
    ptIndyForm:  Result := sApplication;
    ptIndyConsole:  Result := sConsole;
  else
    Assert(False);
  end;
  { 253813: By default C++ creates unmanaged dll's. Web projects need a managed
    main source file }
  if (Result = sLibrary) and (FPersonality = sCBuilderPersonality) then
    Result := ToolsAPI.sCppManagedDll;
end;

function TWebProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
var
  Source, AppType: string;
  SourceIndex: TSourceIndex;
  LWebWizardExt3: IWebProjectCreatorExt3;
  LSetWebModule: Boolean;
  LPropValues: TStrings;
begin
  case FProjectType of
  {$IFDEF MSWINDOWS}
      ptISAPI: SourceIndex := stISAPISource;
      ptWinCGI: SourceIndex := stWinCGISource;
      ptApacheTwo: SourceIndex := stApacheTwo;
      ptIndyForm: SourceIndex := stIndyFormProjectSource;
      ptIndyConsole: SourceIndex := stIndyConsoleProjectSource;
  {$ENDIF}
      ptCGI: SourceIndex := stCGISource;
      ptApache: SourceIndex := stApache;
      ptCOM: SourceIndex := stCOMProjectSource;
  else
    SourceIndex := stCGISource;
  end;
  case FProjectType of
    ptCGI, ptIndyConsole:
      AppType := 'CONSOLE'
  else
    AppType := 'GUI';
  end;
  // Always set webmodule class in project file unless WebSnap
  LSetWebModule := True;
  if Supports(TNewWebModuleExpert.WebWizardExt, IWebProjectCreatorExt3, LWebWizardExt3) then
    if LWebWizardExt3.HasWebModuleFactory then
       LSetWebModule := False;
  LPropValues := TStringList.Create;
  try
    if LSetWebModule then
    begin
      LPropValues.Add('SetWebModuleClass=TRUE');
    end;
    LPropValues.Add('HTTPPort=' + IntToStr(FPort));
    if wbDBXTerminateThreads in FOptions then
      LPropValues.Add('DBXTerminateThreads=TRUE');
    Source := InetSources.GetInetSources(SourceIndex, Personality, LPropValues);
  finally
    LPropValues.Free;
  end;
  Result := TOTAFile.Create(Format(Source, [ProjectName, AppType, '']));
end;

procedure TWebProjectCreator.NewDefaultModule;
var
  LWebWizardExt3: IWebProjectCreatorExt3;
  LWebWizardExt: IWebProjectCreatorExt;
begin
  { Create Form of ComApp }
  if (FProjectType = ptCOM) or (FProjectType = ptIndyForm) then
  begin
    (BorlandIDEServices as IOTAModuleServices).CreateModule(
       TFormModuleCreator.Create(Personality, FProjectType, FCoClass, FPort, FOptions))
  end;
  // Check for extensions that handle their own module creation
  if not Assigned(TNewWebModuleExpert.WebWizardExt) then
  begin
    (BorlandIDEServices as IOTAModuleServices).CreateModule(
       TWebModuleCreator.Create(Personality, FProjectType, FCoClass))
  end
  else
  begin
    // Let module that plug in an extension interface handle their
    // own Web Module creation
    Supports(TNewWebModuleExpert.WebWizardExt, IWebProjectCreatorExt3, LWebWizardExt3);
    if LWebWizardExt3 <> nil then
      LWebWizardExt3.BeforeCreateModule(FProjectType, FCoClass);
    if (LWebWizardExt3 = nil) or LWebWizardExt3.HasModuleText then
    begin
      Supports(TNewWebModuleExpert.WebWizardExt, IWebProjectCreatorExt, LWebWizardExt);
      (BorlandIDEServices as IOTAModuleServices).CreateModule(
       TWebExtModuleCreator.Create(Personality, FProjectType, FCoClass, LWebWizardExt));
    end;
    if LWebWizardExt3 <> nil then
      LWebWizardExt3.AfterCreateModule(FProjectType, FCoClass);
  end;
  if wpOutputToProjectDirectory in FOptions then
  begin
    SetOutputToProjectDirectory;
  end;

end;

procedure TWebProjectCreator.SetInitialOptions(const NewProject: IOTAProject);
begin
  NewProject.ProjectOptions.Values[CommonOptionStrs.sUsingDelphiRTL] := True;
end;

procedure TWebProjectCreator.SetOutputToProjectDirectory;
const
  cOutputDir = 'OutputDir';
  cFinalOutputDir = 'FinalOutputDir';
var
  LProject: IOTAProject;
  LProjectConfigurations: IOTAProjectOptionsConfigurations;
  LConfiguration: IOTABuildConfiguration;
begin
  // Executable must be in same directory as static files files, like html
  LProject := GetActiveProject;
  LProject.ProjectOptions.Values[cOutputDir] := '.';
  LProject.ProjectOptions.Values[cFinalOutputDir] := '.';
  if Supports(LProject.ProjectOptions, IOTAProjectOptionsConfigurations, LProjectConfigurations) then
  begin
    LConfiguration := LProjectConfigurations.BaseConfiguration;
    if LConfiguration <> nil then
    begin
      LConfiguration.Value[DCCStrs.sExeOutput] := '.';
      LConfiguration.Value[CommonOptionStrs.sFinalOutputDir] := '.';
    end;
  end;
end;

function TWebProjectCreator.GetFileName: string;
var
  LWebWizardExt3: IWebProjectCreatorExt3;
begin
  Supports(TNewWebModuleExpert.WebWizardExt, IWebProjectCreatorExt3, LWebWizardExt3);
  if (LWebWizardExt3 = nil) then
    Result := ''
  else
    Result := LWebWizardExt3.GetProjectFileName;
end;

function TWebProjectCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TWebProjectCreator.GetFrameworkType: string;
begin
  if FProjectType in [ptCOM, ptIndyForm] then
    Result := sFrameworkTypeVCL
  else
    Result := sFrameworkTypeNone;
end;

function TWebProjectCreator.GetPlatforms: TArray<string>;
begin
  if FPersonality = sCBuilderPersonality then
    Result := TArray<string>.Create(cWin32Platform)
  else if FPersonality = sDelphiPersonality then
    Result := TArray<string>.Create(cWin32Platform, cWin64Platform);
end;

function TWebProjectCreator.GetPreferredPlatform: string;
begin
  Result := cWin32Platform;
end;

function TWebProjectCreator.GetUnNamed: Boolean;
begin
  Result := not (wpNamedProject in FOptions);
end;

{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}

{ TFormModuleCreator }

constructor TFormModuleCreator.Create(const APersonality: string; AProjectType: TProjectType;
  const ACoClass: string; APort: Integer; AOptions: TCreateWebProjectOptions);
begin
  FPort := APort;
  FCoClass := ACoClass;
  FPersonality := APersonality;
  FProjectType := AProjectType;
  FFormIndex := stUnknown;
  FOptions := AOptions;
  case FProjectType of
    ptCOM:
    begin
      FSourceIndex := stCOMConsoleSource;
      FIntfIndex := stComConsoleIntf;
    end;
    ptIndyForm:
    begin
      FSourceIndex := stIndyFormConsoleSource;
      FIntfIndex := stIndyFormConsoleIntf;
      FFormIndex := stIndyFormConsoleDFMSource;
    end

  else
    FSourceIndex := stCOMConsoleSource;
    FIntfIndex := stComConsoleIntf;
    Assert(False);
  end;
end;

function TFormModuleCreator.GetAncestorName: string;
begin
  Result := 'Form'; // Do not localize
end;

function TFormModuleCreator.GetSource(AIndex:  TSourceIndex): string;
var
  LPropValues: TStrings;
begin
  LPropValues := TStringList.Create;
  try
    LPropValues.Add('HTTPPort=' + IntToStr(FPort));
    if wbDBXTerminateThreads in FOptions then
      LPropValues.Add('DBXTerminateThreads=TRUE');
    Result := InetSources.GetInetSources(AIndex, Personality, LPropValues);
  finally
    LPropValues.Free;
  end;
end;

function TFormModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
  Source: String;
  S: string;
begin
  if not IsPascal(Personality) then    // AddBCBAppUnits called elsewhere for other project types
    AddBCBAppUnits(FProjectType);
  //Source := InetSources.GetInetSources(FSourceIndex, Personality, LPorts);
  Source := GetSource(FSourceIndex);
  S := Format(Source, [ModuleIdent, FormIdent, AncestorIdent, FCoClass]);
  Result := TOTAFile.Create(S);
end;

function TFormModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
  S: string;
begin
  if not IsPascal(Personality) then
  begin
    //S := InetSources.GetInetSources(FIntfIndex, Personality);
    S := GetSource(FIntfIndex);
    Result := TOTAFile.Create(Format(S, [ModuleIdent, FormIdent, AncestorIdent]));
  end
  else
    Result := nil;
end;

function TFormModuleCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
var
  S: string;
begin
  if FFormIndex <> stUnknown then
  begin
    //S := InetSources.GetInetSources(FFormIndex, Personality);
    S := GetSource(FFormIndex);
    Result := TOTAFile.Create(Format(S, [FormIdent, AncestorIdent]));
  end
  else
    Result := nil;

end;

{$ENDIF}

{$IFDEF SHOWOLDWIZARDS}

{ TWebModuleCreator }

constructor TWebModuleCreator.Create(const APersonality: string; AProjectType: TProjectType; const ACoClass: string = '');
begin
  FProjectType := AProjectType;
  FPersonality := APersonality;
  FCoClass := ACoClass;
  Assert((FCoClass = '') or (FProjectType = ptCom));
end;

function TWebModuleCreator.GetAncestorName: string;
begin
  Result := 'WebModule';
end;

function TWebModuleCreator.NewImplSourceText(const ModuleIdent, FormIdent,
  AncestorIdent: string): string;
var
  Source: string;
begin
    Source := InetSources.GetInetSources(stWebModuleSource, Personality);
    Result := Format(Source, [ModuleIdent, FormIdent, AncestorIdent]);
end;

function TWebModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  if not IsPascal(Personality) then
    if FProjectType <> ptCOM then
      AddBCBAppUnits(FProjectType);
  Result := TOTAFile.Create(NewImplSourceText(ModuleIdent, FormIdent, AncestorIdent));
end;

function TWebModuleCreator.NewIntfSourceText(const ModuleIdent, FormIdent,
  AncestorIdent: string): string;
var
  S: string;
begin
  S := InetSources.GetInetSources(stWebModuleIntf, Personality);
  if Trim(S) <> '' then
    Result := Format(S, [ModuleIdent, FormIdent, AncestorIdent])
  else Result := '';
end;

function TWebModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
  S: string;
begin
  S := NewIntfSourceText(ModuleIdent, FormIdent, AncestorIdent);
  if Trim(S) <> '' then
    Result := TOTAFile.Create(S)
  else Result := nil;
end;

function TWebModuleCreator.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
var
  S: string;
begin
  S := NewFormFileText(FormIdent, AncestorIdent);
  if S <> '' then
    Result := TOTAFile.Create(S)
  else
    Result := nil;
end;

function TWebModuleCreator.NewFormFileText(const FormIdent,
  AncestorIdent: string): string;
var
  Source: string;
begin
    Source := InetSources.GetInetSources(stWebModuleDFMSource, Personality);
    Result := Format(Source, [FormIdent, AncestorIdent]);
end;

{ TWebExtModuleCreator }

constructor TWebExtModuleCreator.Create(const APersonality: string; AProjectType: TProjectType;
  const ACoClass: string; WebWizardExt: IWebProjectCreatorExt);
begin
  inherited Create(APersonality, AProjectType, ACoClass);
  FWebWizardExt := WebWizardExt;
end;

procedure TWebExtModuleCreator.GetText(const ModuleIdent, FormIdent,
  AncestorIdent: string);
begin
  if not FHaveText then
  begin
    FHaveText := True;
    FWebWizardExt.CreateModuleText(FProjectType, FCoClass,
      ModuleIdent, FormIdent, AncestorIdent, FModuleText, FIntfText, FFormText);
  end;
end;

function TWebExtModuleCreator.NewFormFileText(const FormIdent,
  AncestorIdent: string): string;
begin
  Assert(FHaveText);
  Result := FFormText;
end;

function TWebExtModuleCreator.NewImplSourceText(const ModuleIdent,
  FormIdent, AncestorIdent: string): string;
begin
  GetText(ModuleIdent, FormIdent, AncestorIdent);
  Result := FModuleText;
end;

function TWebExtModuleCreator.NewIntfSourceText(const ModuleIdent,
  FormIdent, AncestorIdent: string): string;
begin
  GetText(ModuleIdent, FormIdent, AncestorIdent);
  Result := FIntfText;
end;

initialization
  InitWeb;
finalization
  DoneWeb;
{$ENDIF}
end.
