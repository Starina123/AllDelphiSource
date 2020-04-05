{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerReg;

interface

uses ToolsAPI, DSSource, DesignEditors, DesignIntf;

type

  TPEMFilePropertyEditor = class(TStringProperty)
  protected
    function GetFilter: string; virtual;
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TPEMKeyFilePropertyEditor = class(TPEMFilePropertyEditor)
  protected
    function GetFilter: string; override;
  end;

procedure Register;
function CreateServerMethodsModule(const APersonality, APrefix, AAncestorName: string; ASourceFlags: TSourceFlags): IOTAModule;
implementation

uses
  Classes, SysUtils, DSServer, DSHTTP, DSNames,
  Windows, DMForm, DSCommonServer, DbxTransport, StrEdit, DSHTTPCommon,
  DSCreators, InetReg, DBXPlatform, Controls, DBXCommon, DSCommonReg, DSService, DSAuth,
  DSServerDsnResStrs, Dialogs, Forms, InetDesignResStrs, PlatformAPI, TypInfo;

type
  TCtxEnabledProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  TCtxEnabledPropertyInt = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  TDSLifeCycleProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TDSCommunicationProtocolProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TDSServerModuleCreator = class(TModuleCreator, IOTAModuleCreator, IOTACreator)
  private
    FPrefix: string;
    FPersonality: string;
    FAncestorName: string;
    FSourceFlags: TSourceFlags;
  public
    constructor Create(const APersonality, APrefix, AAncestorName: string; ASourceFlags: TSourceFlags);
    { IOTACreator }
    function GetCreatorType: string;
    { IOTAModuleCreator }
    function GetAncestorName: string;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
  protected
    function GetModuleAndClassNamePrefix: String; override;
  end;

  TDSServerModuleWizard = class(TNotifierObject, IOTANotifier, IOTAWizard,
    IOTARepositoryWizard, IOTARepositoryWizard80, IOTARepositoryWizard160,
     IOTAFormWizard)
  protected
    FWizardIcon: THandle;
    FPersonality: string;
    { IOTAWizard }
    function GetName: string;
    function GetIDString: string;
    procedure Execute;
    { IOTARepositoryWizard }
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;
    function GetState: TWizardState;
    { IOTARepositoryWizard60 }
    function GetDesigner: string;
    { IOTARepositoryWizard80 }
    function GetGalleryCategory: IOTAGalleryCategory;
    function GetPersonality: string;
    { IOTARepositoryWizard160 }
    function GetFrameworkTypes: TArray<string>;
    function GetPlatforms: TArray<string>;
  private
    constructor Create(const APersonality: string);
  end;

  TDSClientCallbackManagerSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TDSHTTPServiceSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TDSServerTransportEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TDSFilterIdProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TDSCustomRoleItemProperty = class(TStringListProperty)
  public
    function GetValue: string; override;
  end;

  TDSCustomFilterItemProperty = class(TValueListProperty)
  public
    function GetValue: string; override;
  end;

var
  WizardId: Integer;
  WizardIdCpp: Integer;

procedure Register;
begin
  RegisterComponents(rsDatasnapServer, [TDSServer, TDSServerClass, TDSHTTPService, TDSCertFiles,
                                        TDSAuthenticationManager,
                                        TDSClientCallbackChannelManager, TDSHTTPServiceFileDispatcher]);
  RegisterPropertyEditor(TypeInfo(UnicodeString), TDSServerClass, 'LifeCycle', TDSLifeCycleProperty);
  RegisterPropertyEditor(TypeInfo(UnicodeString), TDSClientCallbackChannelManager, 'CommunicationProtocol', TDSCommunicationProtocolProperty);
  RegisterPropertyEditor(TypeInfo(string), TDSClientCallbackChannelManager, 'ProxyHost', TCtxEnabledProperty);
  RegisterPropertyEditor(TypeInfo(Integer), TDSClientCallbackChannelManager, 'ProxyPort', TCtxEnabledPropertyInt);
  RegisterPropertyEditor(TypeInfo(string), TDSClientCallbackChannelManager, 'ProxyUsername', TCtxEnabledProperty);
  RegisterPropertyEditor(TypeInfo(string), TDSClientCallbackChannelManager, 'ProxyPassword', TCtxEnabledProperty);

  RegisterPropertyEditor(TypeInfo(TStrings), TDSCustomRoleItem, '', TDSCustomRoleItemProperty);
  RegisterSelectionEditor(TDSClientCallbackChannelManager, TDSClientCallbackManagerSelectionEditor);
  RegisterSelectionEditor(TDSServerTransport, TDSServerTransportEditor);
  RegisterPropertyEditor(TypeInfo(TStrings), TTransportFilterItem, 'Properties', TDSCustomFilterItemProperty);
  RegisterPropertyEditor(TypeInfo(UnicodeString), TTransportFilterItem, 'FilterId', TDSFilterIdProperty);
  RegisterSelectionEditor(TDSHTTPService, TDSHTTPServiceSelectionEditor);

  RegisterPropertyEditor(TypeInfo(string), TDSCustomCertFiles, 'RootCertFile',
    TPEMFilePropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TDSCustomCertFiles, 'CertFile',
    TPEMFilePropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TDSCustomCertFiles, 'KeyFile',
    TPEMKeyFilePropertyEditor);
  RegisterCustomModule(TDSServerModule, TDataModuleCustomModule);
  WizardId := (BorlandIDEServices as IOTAWizardServices).AddWizard(TDSServerModuleWizard.Create(sDelphiPersonality) as IOTAWizard);
  WizardIdCpp := (BorlandIDEServices as IOTAWizardServices).AddWizard(TDSServerModuleWizard.Create(sCBuilderPersonality) as IOTAWizard);
end;

function CreateDSServerModule(const APersonality, APrefix: string; ASourceFlags: TSourceFlags): IOTAModule;
begin
  Result := CreateServerMethodsModule(APersonality, APrefix, Copy(TDSServerModule.ClassName, 2, MaxInt),
    ASourceFlags);
end;

function CreateServerMethodsModule(const APersonality, APrefix, AAncestorName: string; ASourceFlags: TSourceFlags): IOTAModule;
var
  ModuleCreator: IOTAModuleCreator;
begin
  ModuleCreator := TDSServerModuleCreator.Create(APersonality, APrefix, AAncestorName, ASourceFlags);
  Result := (BorlandIDEServices as IOTAModuleServices).CreateModule(ModuleCreator);
end;

{ TLifeCycleProperty }

function TDSLifeCycleProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDSLifeCycleProperty.GetValues(Proc: TGetStrProc);
begin
  Proc(TDSLifeCycle.Server);
  Proc(TDSLifeCycle.Session);
  Proc(TDSLifeCycle.Invocation);
//  Proc(TDSLifeCycle.Pool);
end;

{ TDSServerModuleCreator }

constructor TDSServerModuleCreator.Create(const APersonality, APrefix, AAncestorName: string; ASourceFlags: TSourceFlags);
begin
  inherited Create;
  FPersonality := APersonality;
  FPrefix := APrefix;
  FAncestorName := AAncestorName;
  FSourceFlags := ASourceFlags;
  if FAncestorName = '' then
    FAncestorName := Copy(TDSServerModule.ClassName, 2, MaxInt);

end;

function TDSServerModuleCreator.GetAncestorName: string;
begin
  Result := FAncestorName;
end;

function TDSServerModuleCreator.GetCreatorType: string;
begin
  Result := sForm;
end;

function TDSServerModuleCreator.GetModuleAndClassNamePrefix: String;
begin
  Result := FPrefix;
end;

function TDSServerModuleCreator.GetShowForm: Boolean;
begin
  Result := False;
end;

function TDSServerModuleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TDSServerModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
  Source: string;
begin
  Source := GetSourceFromTemplate(FPersonality, stDSServerModuleTemplate, nil, FSourceFlags);
  Result := StringToIOTAFile(Format(Source, [ModuleIdent, FormIdent, AncestorIdent]));

end;

function TDSServerModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
  Source: string;
begin
  if FPersonality = sCBuilderPersonality then
  begin
    Source := GetSourceFromTemplate(FPersonality, stDSServerModuleTemplateIntf, nil, FSourceFlags);
    Result := StringToIOTAFile(Format(Source, [ModuleIdent, FormIdent, AncestorIdent]));
  end
  else
    Result := nil;

end;

{ TDSServerModuleWizard }

constructor TDSServerModuleWizard.Create(const APersonality: string);
begin
  inherited Create;
  FPersonality := APersonality;
end;

procedure TDSServerModuleWizard.Execute;
var
  NewModule: IOTAModule;
begin
  NewModule := CreateDSServerModule(GetPersonality, '', []);  // Use default form name
end;

function TDSServerModuleWizard.GetAuthor: string;
begin
  Result := 'Embarcadero';                          { do not localize }
end;

function TDSServerModuleWizard.GetComment: string;
begin
  Result := rsServerModuleComment;
end;

function TDSServerModuleWizard.GetDesigner: string;
begin
  Result := dVCL;
end;

function TDSServerModuleWizard.GetFrameworkTypes: TArray<string>;
begin
  Result := TArray<string>.Create();
end;

function TDSServerModuleWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := nil;
end;

function TDSServerModuleWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(HInstance, PChar('SERVERDMICON'));
end;

function TDSServerModuleWizard.GetIDString: string;
begin
  Result := 'DataSnap.ServerModule' + '.' + FPersonality; {do not localize}
end;

function TDSServerModuleWizard.GetName: string;
begin
  Result := rsServerModule;
end;

function TDSServerModuleWizard.GetPage: string;
begin
  Result := rsDataSnapServerPage;
end;

function TDSServerModuleWizard.GetPersonality: string;
begin
  Result := FPersonality;
end;

function TDSServerModuleWizard.GetPlatforms: TArray<string>;
begin
  Result := TArray<string>.Create(cWin32Platform, cWin64Platform);
end;

function TDSServerModuleWizard.GetState: TWizardState;
begin
  Result := [];
end;

{ TDSFilterIdProperty }

function TDSFilterIdProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDSFilterIdProperty.GetValues(Proc: TGetStrProc);
var
  FilterId: string;
begin
  for FilterId in TTransportFilterFactory.RegisteredFiltersId do
    Proc(FilterId);
end;

{ TDSClientCallbackManagerSelectionEditor }

procedure TDSClientCallbackManagerSelectionEditor.RequiresUnits(
  Proc: TGetStrProc);
var
  i: Integer;
  LIPImplementationID: string;
  ChannelManager: TDSClientCallbackChannelManager;
begin
  for i := 0 to Designer.Root.ComponentCount - 1 do
  begin
    if Designer.Root.Components[i] is TDSClientCallbackChannelManager then
    begin
      ChannelManager := TDSClientCallbackChannelManager(Designer.Root.Components[i]);
      LIPImplementationID := ChannelManager.IPImplementationID;
      if LIPImplementationID = '' then
        Proc('IndyPeerImpl')
      else
        Proc(LIPImplementationID);
    end;
  end;
end;

{ TDSServerTransportEditor }

procedure TDSServerTransportEditor.RequiresUnits(Proc: TGetStrProc);
var
  i, j: Integer;
  FilterUnit: string;
  LIPImplementationID: string;
  Transport: TDSServerTransport;
  TransportFilter: TTransportFilter;
begin
  for i := 0 to Designer.Root.ComponentCount - 1 do
  begin
    if Designer.Root.Components[i] is TDSServerTransport then
    begin
      Transport := TDSServerTransport(Designer.Root.Components[i]);
      LIPImplementationID := Transport.IPImplementationID;
      if LIPImplementationID = '' then
        Proc('IndyPeerImpl')
      else
        Proc(LIPImplementationID);
      for j := 0 to Transport.Filters.Count - 1 do
      begin
        TransportFilter := Transport.Filters.GetFilter(j);
        if TransportFilter <> nil then
        begin
          FilterUnit := TransportFilter.GetParameterValue('FilterUnit');
          if FilterUnit <> EmptyStr then
            Proc(FilterUnit);
        end;
      end;
    end;
  end;
end;

{ TDSCommunicationProtocolProperty }

function TDSCommunicationProtocolProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueEditable, paValueList, paSortList];
end;

procedure TDSCommunicationProtocolProperty.GetValues(Proc: TGetStrProc);
begin
  GetDesignerAvailableProtocolValues(Proc);
end;

{ TCustomRoleItemProperty }

function TDSCustomRoleItemProperty.GetValue: string;
var
  LStrings: TStrings;
begin
  LStrings := GetStrings;
  // Display value in object inspector
  Result := LStrings.DelimitedText;
end;

{ TCustomFilterItemProperty }

function TDSCustomFilterItemProperty.GetValue: string;
var
  LStrings: TStrings;
begin
  LStrings := GetStrings;
  Result := LStrings.DelimitedText;
end;

{ TPEMFilePropertyEditor }


procedure TPEMFilePropertyEditor.Edit;
var
  Dialog: Dialogs.TOpenDialog;
begin
  Dialog := Dialogs.TOpenDialog.Create(Application);
  with Dialog do
  try
    Title := sPEMOpenFileTitle;
    Filename := GetValue;
    Filter := GetFilter;
    HelpContext := 0;                         
    Options := Options + [ofShowHelp, ofPathMustExist, ofHideReadonly, ofFileMustExist];
    if Dialog.Execute then
      SetValue(Filename);
  finally
    Free;
  end;
end;

function TPEMFilePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable, paVCL];
end;

function TPEMFilePropertyEditor.GetFilter: string;
begin
  Result := sPEMFileFilter;
end;

{ TPEMKeyFilePropertyEditor }

function TPEMKeyFilePropertyEditor.GetFilter: string;
begin
  Result := sPEMKeyFileFilter;

end;

{ TCtxEnabledProperty }

function TCtxEnabledProperty.GetAttributes: TPropertyAttributes;
var
  comp: TPersistent;
  Proto: String;
begin
  Result := inherited;

  comp := GetComponent(0);
  if (comp <> nil) and (comp is TDSClientCallbackChannelManager) then
  begin
    Proto := TDSClientCallbackChannelManager(comp).CommunicationProtocol;
    if (not AnsiSameText('http', Proto)) and (not AnsiSameText('https', Proto)) then
      Result := Result + [paReadOnly, paDisplayReadOnly];
  end;
end;

{ TCtxEnabledPropertyInt }

function TCtxEnabledPropertyInt.GetAttributes: TPropertyAttributes;
var
  comp: TPersistent;
  Proto: String;
begin
  Result := inherited;

  comp := GetComponent(0);
  if (comp <> nil) and (comp is TDSClientCallbackChannelManager) then
  begin
    Proto := TDSClientCallbackChannelManager(comp).CommunicationProtocol;
    if (not AnsiSameText('http', Proto)) and (not AnsiSameText('https', Proto)) then
      Result := Result + [paReadOnly, paDisplayReadOnly];
  end;
end;

{ TDSHTTPServiceSelectionEditor }

procedure TDSHTTPServiceSelectionEditor.RequiresUnits(Proc: TGetStrProc);
var
  i: Integer;
  LService: TDSHTTPService;
  m: TMethod;
begin
  for i := 0 to Designer.Root.ComponentCount - 1 do
  begin
    if Designer.Root.Components[i] is TDSHTTPService then
    begin
      LService := TDSHTTPService(Designer.Root.Components[i]);
      m := GetMethodProp(LService, 'FormatResult');
      if Assigned(m.Code) then
      begin
        Proc('Data.DBXJSON');
        Proc('Data.DBXCommon');
        break;
      end;
    end;
  end;
end;

initialization
finalization
  (BorlandIDEServices as IOTAWizardServices).RemoveWizard(WizardId);
  (BorlandIDEServices as IOTAWizardServices).RemoveWizard(WizardIdCpp);

end.
