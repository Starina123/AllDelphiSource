
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit MidReg;

interface

uses
  Classes, DmDesigner, DsDesign, MConnect, MidasCon, CorbaCon, DBClient, Provider,
  ActiveX, ComObj, ShlObj, FldLinks, CDSEdit, DBReg, DBConsts, DsgnIntf, Windows,
  Forms, SysUtils, DsnDBCst, MidConst, DataBkr, SConnect, MtsRdm, CorbaRdm,
  ObjBrkr, Dialogs, Controls, DB, DMForm,
  CustomModuleEditors,
  ParentageSupport, DsnDB,
  ModelViews, ModelPrimitives, DataModelViews, DataModelSupport;

{ TCDSFieldLinkProperty }

type
  TCDSFieldLinkProperty = class(TFieldLinkProperty)
  private
    FCDS: TClientDataSet;
  protected
    function GetIndexFieldNames: string; override;
    function GetMasterFields: string; override;
    procedure SetIndexFieldNames(const Value: string); override;
    procedure SetMasterFields(const Value: string); override;
  public
    procedure Edit; override;
  end;

  { object brokers }

  TCustomObjectBrokerSprig = class(TSprigAtRoot)
  end;

  TSimpleObjectBrokerSprig = class(TCustomObjectBrokerSprig)
  public
    function AnyProblems: Boolean; override;
  end;

  { connections }

  TCustomRemoteServerSprig = class(TSprig)
  end;

  TDispatchConnectionSprig = class(TCustomRemoteServerSprig)
  end;

  TStreamedConnectionSprig = class(TDispatchConnectionSprig)
  end;

  TWebConnectionSprig = class(TStreamedConnectionSprig)
  public
    class function ParentProperty: string; override;
    function AnyProblems: Boolean; override;
  end;

  TSocketConnectionSprig = class(TStreamedConnectionSprig)
  public
    class function ParentProperty: string; override;
    function AnyProblems: Boolean; override;
  end;

  TCOMConnectionSprig = class(TDispatchConnectionSprig)
  public
    function AnyProblems: Boolean; override;
  end;

  TDCOMConnectionSprig = class(TCOMConnectionSprig)
  public
    class function ParentProperty: string; override;
  end;

  TOLEnterpriseConnectionSprig = class(TCOMConnectionSprig)
  end;

  // TMidasConnectionSprig is handled by TDCOMConnectionSprig
  // TRemoteServerSprig is handled by TDCOMConnectionSprig

  TCorbaConnectionSprig = class(TCustomRemoteServerSprig)
  public
    function AnyProblems: Boolean; override;
  end;

  { providers }

  TCustomProviderSprig = class(TSprig)
  end;

  TDataSetProviderSprig = class(TCustomProviderSprig)
  public
    class function ParentProperty: string; override;
  end;

  // TProviderSprig is handled by TDataSetProviderSprig

  TClientDataSetSprig = class(TDataSetSprig)
  public
    procedure FigureParent; override;
    function AnyProblems: Boolean; override;
    function DragDropTo(AItem: TSprig): Boolean; override;
    function DragOverTo(AItem: TSprig): Boolean; override;
    class function PaletteOverTo(AParent: TSprig; AClass: TClass): Boolean; override;
    function GetDSDesignerClass: TDSDesignerClass; override;
    function Caption: string; override;
  end;

  TClientDataSetIsland = class(TDataSetIsland)
  public
    function VisibleTreeParent: Boolean; override;
  end;

  TClientDataSetMasterDetailBridge = class(TMasterDetailBridge)
  public
    function CanEdit: Boolean; override;
    function Caption: string; override;
    class function OmegaIslandClass: TIslandClass; override;
    class function GetOmegaSource(AItem: TPersistent): TDataSource; override;
    class procedure SetOmegaSource(AItem: TPersistent; ADataSource: TDataSource); override;
    function Edit: Boolean; override;
  end;

procedure Register;

implementation

type

{ TCDSDesigner }

  TCDSDesigner = class(TDSDesigner)
  private
    FPacketRecords: Integer;
  public
    procedure BeginUpdateFieldDefs; override;
    procedure EndUpdateFieldDefs; override;
    function SupportsAggregates: Boolean; override;
    function SupportsInternalCalc: Boolean; override;
  end;

procedure TCDSDesigner.BeginUpdateFieldDefs;
begin
  FPacketRecords := 0;
  if not DataSet.Active then
  begin
    DataSet.FieldDefs.Updated := False;
    FPacketRecords := (DataSet as TClientDataSet).PacketRecords;
    if FPacketRecords <> 0 then
      (DataSet as TClientDataSet).PacketRecords := 0;
  end;
  inherited BeginUpdateFieldDefs;
end;

procedure TCDSDesigner.EndUpdateFieldDefs;
begin
  inherited EndUpdateFieldDefs;
  if FPacketRecords <> 0 then
    (DataSet as TClientDataSet).PacketRecords := FPacketRecords;
end;

function TCDSDesigner.SupportsAggregates: Boolean;
begin
  Result := True;
end;

function TCDSDesigner.SupportsInternalCalc: Boolean;
begin
  Result := True;
end;

{ TClientDataSetEditor }

type
  TClientDataSetEditor = class(TDataSetEditor)
  private
    FCanCreate: Boolean;
  protected
    function GetDSDesignerClass: TDSDesignerClass; override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

function TClientDataSetEditor.GetDSDesignerClass: TDSDesignerClass;
begin
  Result := TCDSDesigner;
end;

procedure TClientDataSetEditor.ExecuteVerb(Index: Integer);
begin
  if Index <= inherited GetVerbCount - 1 then
    inherited ExecuteVerb(Index) else
  begin
    Dec(Index, inherited GetVerbCount);
    if (Index > 2) and not FCanCreate then Inc(Index);
    case Index of
      0: begin
           TClientDataSet(Component).FetchParams;
           Designer.Modified;
         end;
      1: if EditClientDataSet(TClientDataSet(Component), Designer) then
           Designer.Modified;
      2: if LoadFromFile(TClientDataSet(Component)) then Designer.Modified;
      3: begin
           TClientDataSet(Component).CreateDataSet;
           Designer.Modified;
         end;
      4: SaveToFile(TClientDataSet(Component));
      5: begin
           TClientDataSet(Component).Data := NULL;
           Designer.Modified;
         end;
    end;
  end;
end;

function TClientDataSetEditor.GetVerb(Index: Integer): string;
begin
  if Index <= inherited GetVerbCount - 1 then
    Result := inherited GetVerb(Index) else
  begin
    Dec(Index, inherited GetVerbCount);
    if (Index > 2) and not FCanCreate then Inc(Index);
    case Index of
      0: Result := SFetchParams;
      1: Result := SClientDSAssignData;
      2: Result := SLoadFromFile;
      3: Result := SCreateDataSet;
      4: Result := SSaveToFile;
      5: Result := SClientDSClearData;
    end;
  end;
end;

function TClientDataSetEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 3;
  FCanCreate := False;
  with TClientDataset(Component) do
  begin
    if Active or (DataSize > 0) then Inc(Result, 2);
    FCanCreate := not Active and ((FieldCount > 0) or (FieldDefs.Count > 0));
    if FCanCreate then Inc(Result, 1);
  end;
end;

{ TComputerNameProperty }

type
  TComputerNameProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

function TComputerNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TComputerNameProperty.Edit;
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  ComputerName: array[0..MAX_PATH] of Char;
  Title: string;
  WindowList: Pointer;
  Result: Boolean;
begin
  if Failed(SHGetSpecialFolderLocation(Application.Handle, CSIDL_NETWORK, ItemIDList)) then
    raise Exception.CreateRes(@SComputerNameDialogNotSupported);
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  BrowseInfo.hwndOwner := Application.Handle;
  BrowseInfo.pidlRoot := ItemIDList;
  BrowseInfo.pszDisplayName := ComputerName;
  Title := sSelectRemoteServer;
  BrowseInfo.lpszTitle := PChar(Pointer(Title));
  BrowseInfo.ulFlags := BIF_BROWSEFORCOMPUTER;
  WindowList := DisableTaskWindows(0);
  try
    Result := SHBrowseForFolder(BrowseInfo) <> nil;
  finally
    EnableTaskWindows(WindowList);
  end;
  if Result then SetValue(ComputerName);
end;

{ TProviderNameProperty }

type
  TProviderNameProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TProviderNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList, paSortList];
end;

type
  TServerProtectedAccess = class(TCustomRemoteServer); // Allows us to call protected methods.

procedure TProviderNameProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Dataset: TClientDataSet;
  RemoteServer: TCustomRemoteServer;
begin
  DataSet := (GetComponent(0) as TClientDataSet);
  RemoteServer := DataSet.RemoteServer;
  if RemoteServer <> nil then
    TServerProtectedAccess(RemoteServer).GetProviderNames(Proc)
  else
    if Assigned(DataSet.Owner) then
    with DataSet.Owner do
      for I := 0 to ComponentCount - 1 do
        if Components[I] is TCustomProvider then
          Proc(Components[I].Name);
end;

{ TServerNameProperty }

type
  TServerNameProperty = class(TStringProperty)
    function AutoFill: Boolean; override;
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TServerNameProperty.AutoFill: Boolean; 
begin
  Result := False;
end;

function TServerNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList, paSortList];
end;

type
  TConnectionAccess = class(TCustomRemoteServer);

procedure TServerNameProperty.GetValues(Proc: TGetStrProc);
var
  Connection: TConnectionAccess;
  Data: OleVariant;
  i: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    Connection := TConnectionAccess(GetComponent(0));
    Data := Connection.GetServerList;
    if VarIsArray(Data) then
      for i := 0 to VarArrayHighBound(Data, 1) do
        Proc(Data[i]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

type
  TCDSFilenameProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

{ TFilenameProperty }

procedure TCDSFilenameProperty.Edit;
var
  CDSFileOpen: TOpenDialog;
begin
  CDSFileOpen := TOpenDialog.Create(Application);
  CDSFileOpen.Filename := GetValue;
  CDSFileOpen.Filter := SClientDataFilter;
  CDSFileOpen.Options := CDSFileOpen.Options + [ofPathMustExist];
  try
    if CDSFileOpen.Execute then SetValue(CDSFileOpen.Filename);
  finally
    CDSFileOpen.Free;
  end;
end;

function TCDSFilenameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

{ TCDSFieldLinkProperty }

procedure TCDSFieldLinkProperty.Edit;
var
  Opened: Boolean;
  PacketRecords: Integer;
begin
  FCDS := DataSet as TClientDataSet;
  PacketRecords := FCDS.PacketRecords;
  Opened := FCDS.FieldCount = 0;
  try
    if Opened then
    begin
      FCDS.PacketRecords := 0;
      FCDS.Open;
    end;
    inherited Edit;
  finally
    if Opened then
    begin
      FCDS.Close;
      FCDS.PacketRecords := PacketRecords;
    end;
  end;
end;

function TCDSFieldLinkProperty.GetIndexFieldNames: string;
begin
  Result := FCDS.IndexFieldNames;
end;

function TCDSFieldLinkProperty.GetMasterFields: string;
begin
  Result := FCDS.MasterFields;
end;

procedure TCDSFieldLinkProperty.SetIndexFieldNames(const Value: string);
begin
  FCDS.IndexFieldNames := Value;
end;

procedure TCDSFieldLinkProperty.SetMasterFields(const Value: string);
begin
  FCDS.MasterFields := Value;
end;

{ TMidas property category }

type
  TMidasCategory = class(TPropertyCategory)
  public
    class function Name: string; override;
    class function Description: string; override;
  end;

{ TMidasCategory }

class function TMidasCategory.Description: string;
begin
  Result := SMidasCategoryDesc;
end;

class function TMidasCategory.Name: string;
begin
  Result := SMidasCategoryName;
end;

{ TSimpleObjectBrokerSprig }

function TSimpleObjectBrokerSprig.AnyProblems: Boolean;
begin
  Result := TSimpleObjectBroker(Item).Servers.Count = 0;
end;

{ TCOMConnectionSprig }

function TCOMConnectionSprig.AnyProblems: Boolean;
begin
  Result := (TCOMConnection(Item).ServerGUID = '') and
            (TCOMConnection(Item).ServerName = '');
end;

{ TDCOMConnectionSprig }

class function TDCOMConnectionSprig.ParentProperty: string;
begin
  Result := 'ObjectBroker'; { do not localize }
end;

{ TSocketConnectionSprig }

function TSocketConnectionSprig.AnyProblems: Boolean;
begin
  Result := ((TSocketConnection(Item).Address = '') and
             (TSocketConnection(Item).Host = '') and
             (TSocketConnection(Item).ObjectBroker = nil))
            or
             ((TSocketConnection(Item).ServerName = '') and
              (TSocketConnection(Item).ServerGUID = ''));
end;

class function TSocketConnectionSprig.ParentProperty: string;
begin
  Result := 'ObjectBroker'; { do not localize }
end;

{ TCorbaConnectionSprig }

function TCorbaConnectionSprig.AnyProblems: Boolean;
begin
  Result := (TCorbaConnection(Item).HostName = '') or
            (TCorbaConnection(Item).ObjectName = '');
end;

{ TWebConnectionSprig }

function TWebConnectionSprig.AnyProblems: Boolean;
begin
  Result := ((TWebConnection(Item).URL = '')
             and (TWebConnection(Item).ObjectBroker = nil )
            )
            or
            ((TWebConnection(Item).ServerName = '')
              and (TWebConnection(Item).ServerGUID = ''));
end;

class function TWebConnectionSprig.ParentProperty: string;
begin
  Result := 'ObjectBroker'; { do not localize }
end;

{ TDataSetProviderSprig }

class function TDataSetProviderSprig.ParentProperty: string;
begin
  Result := 'DataSet'; { do not localize }
end;

{ TClientDataSetSprig }

function TClientDataSetSprig.AnyProblems: Boolean;
begin
  with TClientDataSet(Item) do
    Result := not ((DataSetField <> nil) or
                   ((RemoteServer <> nil) and
                    (ProviderName <> '')) or
                   (ProviderName <> ''));
end;

function TClientDataSetSprig.Caption: string;
begin
  with TClientDataSet(Item) do
    if (DataSetField = nil) and
       (RemoteServer <> nil) then
      Result := CaptionFor(ProviderName, Name)
    else
      Result := inherited Caption;
end;

function TClientDataSetSprig.DragDropTo(AItem: TSprig): Boolean;
begin
  Result := False;
  with TClientDataSet(Item) do
    if AItem is TFieldSprig then
    begin
      Result := DataSetField <> AItem.Item;
      if Result then
        DataSetField := TDataSetField(AItem.Item);
      RemoteServer := nil;
      ProviderName := '';
    end
    else if AItem is TCustomRemoteServerSprig then
    begin
      Result := RemoteServer <> AItem.Item;
      if Result then
        RemoteServer := TCustomRemoteServer(AItem.Item);
      DataSetField := nil;
    end
    else if AItem is TCustomProviderSprig then
    begin
      Result := ProviderName <> TCustomProvider(AItem.Item).Name;
      if Result then
        ProviderName := TCustomProvider(AItem.Item).Name;
      RemoteServer := nil;
      DataSetField := nil;
    end;
end;

function TClientDataSetSprig.DragOverTo(AItem: TSprig): Boolean;
begin
  Result := ((AItem is TFieldSprig) and
             (TFieldSprig(AItem).Item is TDataSetField)) or
            (AItem is TCustomRemoteServerSprig) or
            (AItem is TCustomProviderSprig);
end;

procedure TClientDataSetSprig.FigureParent;
begin
  with TClientDataSet(Item) do
    if DataSetField <> nil then
      SeekParent(DataSetField).Add(Self)
    else if RemoteServer <> nil then
      SeekParent(RemoteServer, False).Add(Self)
    else if ProviderName <> '' then
      SeekParent(ProviderName, TCustomProvider).Add(Self)
    else
      inherited;
end;

function TClientDataSetSprig.GetDSDesignerClass: TDSDesignerClass;
begin
  Result := TCDSDesigner;
end;

class function TClientDataSetSprig.PaletteOverTo(AParent: TSprig;
  AClass: TClass): Boolean;
begin
  Result := ((AParent is TFieldSprig) and
             (TFieldSprig(AParent).Item is TDataSetField)) or
            (AParent is TCustomRemoteServerSprig) or
            (AParent is TCustomProviderSprig);
end;

{ TClientDataSetIsland }

function TClientDataSetIsland.VisibleTreeParent: Boolean;
begin
  with TClientDataSet(Item) do
    Result := (DataSetField = nil) and
              (RemoteServer = nil);
end;

{ TClientDataSetMasterDetailBridge }

function TClientDataSetMasterDetailBridge.CanEdit: Boolean;
begin
  Result := True;
end;

function TClientDataSetMasterDetailBridge.Edit: Boolean;
var
  vPropEd: TCDSFieldLinkProperty;
begin
  vPropEd := TCDSFieldLinkProperty.CreateWith(TDataSet(Omega.Item));
  try
    vPropEd.Edit;
    Result := vPropEd.Changed;
  finally
    vPropEd.Free;
  end;
end;

class function TClientDataSetMasterDetailBridge.GetOmegaSource(
  AItem: TPersistent): TDataSource;
begin
  Result := TClientDataSet(AItem).MasterSource;
end;

class function TClientDataSetMasterDetailBridge.OmegaIslandClass: TIslandClass;
begin
  Result := TClientDataSetIsland;
end;

class procedure TClientDataSetMasterDetailBridge.SetOmegaSource(
  AItem: TPersistent; ADataSource: TDataSource);
begin
  TClientDataSet(AItem).MasterSource := ADataSource;
end;


function TClientDataSetMasterDetailBridge.Caption: string;
begin
  if TClientDataSet(Omega.Item).MasterFields = '' then
    Result := SNoMasterFields
  else
    Result := TClientDataSet(Omega.Item).MasterFields;
end;

procedure Register;
begin
  { MIDAS components are only available in the Enterprise SKU }
  if GDAL = 0 then
  begin
    RegisterComponents(srMIDAS, [TClientDataSet, TDCOMConnection,
      TSocketConnection, TDataSetProvider, TSimpleObjectBroker, TWebConnection]);
    // Only register TCorbaConnection for Delphi. Once extra ORBPAS.DLL work is
    // done for Delphi A/S and BCB A/S revert this code.
    if HexDisplayPrefix = '$' then
      RegisterComponents(srMIDAS, [TCorbaConnection]);

    { Compatibility components }
    RegisterComponents(srMIDAS, [TRemoteServer, TMIDASConnection, TProvider,
      TOLEnterpriseConnection]);

    RegisterPropertyEditor(TypeInfo(string), TDispatchConnection, 'ComputerName', TComputerNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TSocketConnection, 'Host', TComputerNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TOLEnterpriseConnection, 'BrokerName', TComputerNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TCustomRemoteServer, 'ServerName', TServerNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TServerItem, 'ComputerName', TComputerNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TClientDataSet, 'ProviderName', TProviderNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TClientDataSet, 'IndexName', TIndexNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TClientDataSet, 'IndexFieldNames', TIndexFieldNamesProperty);
    RegisterPropertyEditor(TypeInfo(string), TClientDataSet, 'MasterFields', TCDSFieldLinkProperty);
    RegisterPropertyEditor(TypeInfo(string), TClientDataSet, 'FileName', TCDSFileNameProperty);
    RegisterComponentEditor(TClientDataSet, TClientDataSetEditor);
    RegisterCustomModule(TRemoteDataModule, TDataModuleDesignerCustomModule);
    RegisterCustomModule(TMtsDataModule, TDataModuleDesignerCustomModule);
    RegisterCustomModule(TCorbaDataModule, TDataModuleDesignerCustomModule);

    { Property Category registration }
    RegisterPropertiesInCategory(TMidasCategory, TDispatchConnection,
      ['ComputerName', 'Host', 'BrokerName', 'ServerName', 'ServerGUID']);

    RegisterPropertiesInCategory(TMidasCategory, TServerItem,
      ['ComputerName', 'Port']);

    RegisterPropertiesInCategory(TMidasCategory,
      ['FetchOnDemand', 'PacketRecords', 'RemoteServer', 'OnReconcileError']);

    RegisterSprigType(TCustomObjectBroker, TCustomObjectBrokerSprig);
    RegisterSprigType(TSimpleObjectBroker, TSimpleObjectBrokerSprig);

    RegisterSprigType(TCustomRemoteServer, TCustomRemoteServerSprig);

    RegisterSprigType(TDCOMConnection, TDCOMConnectionSprig);
    RegisterSprigType(TOLEnterpriseConnection, TOLEnterpriseConnectionSprig);
    RegisterSprigType(TCorbaConnection, TCorbaConnectionSprig);
    RegisterSprigType(TWebConnection, TWebConnectionSprig);
    RegisterSprigType(TSocketConnection, TSocketConnectionSprig);

    RegisterSprigType(TCustomProvider, TCustomProviderSprig);
    RegisterSprigType(TDataSetProvider, TDataSetProviderSprig);

    RegisterSprigType(TClientDataSet, TClientDataSetSprig);

    RegisterIslandType(TClientDataSetSprig, TClientDataSetIsland);

    RegisterBridgeType(TDataSetIsland, TClientDataSetIsland, TClientDataSetMasterDetailBridge);
  end;
end;

end.
