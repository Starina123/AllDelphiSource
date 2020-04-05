{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit LMidReg;

interface

uses
  Classes, Variants, DBClient, Provider, ActiveX, ComObj,
  ShlObj, FldLinks, DBReg, DBConsts, DesignIntf, DesignEditors, Windows,
  Forms, SysUtils, DsnDBCst, MidConst, Controls, DB, DMForm,
  TreeIntf, {DiagramSupport,}
{$IFDEF MSWINDOWS}
  Dialogs, DsnDb, CDSEdit, DSDesign;
{$ENDIF}
{$IFDEF LINUX}
  QDialogs, CDSEditLin, DSDesignLin, ClxEditors;
{$ENDIF}

type

  { TCDSAccess }

  TCDSAccess = class(TCustomClientDataSet) end;
  
  { TCDSFieldLinkProperty }

  TCDSFieldLinkProperty = class(TFieldLinkProperty)
  private
    FCDS: TCDSAccess;
  protected
    function GetIndexFieldNames: string; override;
    function GetMasterFields: string; override;
    procedure SetIndexFieldNames(const Value: string); override;
    procedure SetMasterFields(const Value: string); override;
  public
    procedure Edit; override;
  end;

{$IFDEF MSWINDOWS}
  { object brokers }

  TCustomObjectBrokerSprig = class(TComponentSprig)
  end;

  { connections }

  TCustomRemoteServerSprig = class(TComponentSprig)
  end;

  TDispatchConnectionSprig = class(TCustomRemoteServerSprig)
  end;

  TStreamedConnectionSprig = class(TDispatchConnectionSprig)
  end;

  { providers }

  TCustomProviderSprig = class(TComponentSprig)
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

{  TClientDataSetIsland = class(TDataSetIsland)
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
  end; }
{$ENDIF}

procedure Register;

implementation

uses DBClientActns, ActnList, DBClientActnRes;

type

{ TLookupAggIndexProperty }

  TLookupAggIndexProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

{ TCDSDesigner }

  TCDSDesigner = class(TDSDesigner)
  private
    FCDS: TCDSAccess;
    FPacketRecords: Integer;
  public
    procedure BeginUpdateFieldDefs; override;
    procedure EndUpdateFieldDefs; override;
    function SupportsAggregates: Boolean; override;
    function SupportsInternalCalc: Boolean; override;
  end;

procedure TCDSDesigner.BeginUpdateFieldDefs;
begin
  FCDS := TCDSAccess(DataSet as TCustomClientDataSet);
  FPacketRecords := 0;
  if not DataSet.Active then
  begin
    DataSet.FieldDefs.Updated := False;
    FPacketRecords := FCDS.PacketRecords;
    if FPacketRecords <> 0 then
      FCDS.PacketRecords := 0;
  end;
  inherited BeginUpdateFieldDefs;
end;

procedure TCDSDesigner.EndUpdateFieldDefs;
begin
  inherited EndUpdateFieldDefs;
  if FPacketRecords <> 0 then
    FCDS.PacketRecords := FPacketRecords;
end;

function TCDSDesigner.SupportsAggregates: Boolean;
begin
  Result := True;
end;

function TCDSDesigner.SupportsInternalCalc: Boolean;
begin
  Result := True;
end;


{ TLookupAggIndexProperty }

procedure TLookupAggIndexProperty.GetValueList(List: TStrings);
begin
  with GetComponent(0) as TField do
    if DataSet <> nil then TCustomClientDataSet(DataSet).GetIndexNames(List);
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
var
  DataSet: TCustomClientDataSet;
begin
  if Index <= inherited GetVerbCount - 1 then
    inherited ExecuteVerb(Index) else
  begin
    DataSet := (Component as TCustomClientDataSet);
    Dec(Index, inherited GetVerbCount);
    if (Index > 2) and not FCanCreate then Inc(Index);
    case Index of
      0: begin
           DataSet.FetchParams;
           Designer.Modified;
         end;
      1: if EditClientDataSet(DataSet, Designer) then
           Designer.Modified;
      2: if LoadFromFile(DataSet) then Designer.Modified;
      3: begin
           DataSet.CreateDataSet;
           Designer.Modified;
         end;
      4: SaveToFile(DataSet, dfXML);
      5: SaveToFile(DataSet, dfXMLUTF8);
      6: SaveToFile(DataSet, dfBinary);
      7: begin
           //DataSet.Close;
           //DataSet.FieldDefs.Clear;
           DataSet.Data := NULL;
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
      4: Result := SSaveToXmlFile;
      5: Result := SSaveToXmlUTF8File;
      6: Result := SSaveToFile;
      7: Result := SClientDSClearData;
    end;
  end;
end;

function TClientDataSetEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 3;
  FCanCreate := False;
  with TCDSAccess(Component as TCustomClientDataSet) do
  begin
    if Active or (DataSize > 0) then Inc(Result, 4);
    FCanCreate := not Active and ((FieldCount > 0) or (FieldDefs.Count > 0));
    if FCanCreate then Inc(Result, 1);
  end;
end;

(*{ TComputerNameProperty }

type
  TComputerNameProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

function TComputerNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog]{$IFDEF LINUX} + [paVCL]{$ENDIF};
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
end; *)

{ TProviderNameProperty }

type
  TProviderNameProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TProviderNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList, paSortList]{$IFDEF LINUX} + [paVCL]{$ENDIF};
end;

type
  TServerProtectedAccess = class(TCustomRemoteServer); // Allows us to call protected methods.

procedure TProviderNameProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Dataset: TCDSAccess;
  RemoteServer: TCustomRemoteServer;
  ConnectionBroker: TConnectionBroker;
begin
  DataSet := TCDSAccess(GetComponent(0) as TCustomClientDataSet);
  RemoteServer := DataSet.RemoteServer;
  ConnectionBroker := DataSet.ConnectionBroker;
  if RemoteServer <> nil then
    TServerProtectedAccess(RemoteServer).GetProviderNames(Proc)
  else if ConnectionBroker <> nil then
    TServerProtectedAccess(ConnectionBroker).GetProviderNames(Proc)
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
  Result := inherited GetAttributes + [paValueList, paSortList]{$IFDEF LINUX} + [paVCL]{$ENDIF};
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

{ TCDSFieldLinkProperty }

{$IFDEF MSWINDOWS}
  TCDSFilenameProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;
{$ENDIF}
{$IFDEF LINUX}
  TCDSFilenameProperty = class(TFileNameProperty)
  public
    procedure GetDialogOptions(Dialog: QDialogs.TOpenDialog); override;
  end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TCDSFilenameProperty.Edit;
var
  CDSFileOpen: TOpenDialog;
begin
  CDSFileOpen := TOpenDialog.Create(Application);
  CDSFileOpen.Filename := GetValue;
  CDSFileOpen.Filter := SAllClientDataFilter;
  CDSFileOpen.Title := SCDSDlgOpenCaption;
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
{$ENDIF}

{$IFDEF LINUX}
procedure TCDSFileNameProperty.GetDialogOptions(Dialog: QDialogs.TOpenDialog);
begin
  Dialog.Filter := SQTAllClientDataFilter;
end;
{$ENDIF}


{ TCDSFieldLinkProperty }

procedure TCDSFieldLinkProperty.Edit;
var
  Opened: Boolean;
  PacketRecords: Integer;
begin
  FCDS := TCDSAccess(DataSet as TCustomClientDataSet);
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

{$IFDEF MSWINDOWS}
{ TDataSetProviderSprig }

class function TDataSetProviderSprig.ParentProperty: string;
begin
  Result := 'DataSet'; { do not localize }
end;

{ TClientDataSetSprig }

function TClientDataSetSprig.AnyProblems: Boolean;
begin
  with TCustomClientDataSet(Item) do
    Result := not (Active or
                   (Filename <> '') or
                   (DataSetField <> nil) or
                   ((RemoteServer <> nil) and (ProviderName <> '')) or
                   ((RemoteServer = nil) and (ProviderName <> ''))
                  );
end;

function TClientDataSetSprig.Caption: string;
begin
  with TCustomClientDataSet(Item) do
    if (DataSetField = nil) and
       (RemoteServer <> nil) then
      Result := CaptionFor(ProviderName, Name)
    else
      Result := inherited Caption;
end;

function TClientDataSetSprig.DragDropTo(AItem: TSprig): Boolean;
begin
  Result := False;
  with TCustomClientDataSet(Item) do
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
  with TCustomClientDataSet(Item) do
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
(*
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
*)
{$ENDIF}

resourcestring
  sDataSnap = 'DataSnap Client';

procedure Register;
begin
  { MIDAS components are available in all SKU's except for Standard }
  if GDAL <> LongWord(-16) then
  begin
    RegisterComponents(srDAccess, [TClientDataSet, TDataSetProvider]);
    RegisterPropertyEditor(TypeInfo(string), TCustomClientDataSet, 'ProviderName', TProviderNameProperty);
{$IFDEF MSWINDOWS}
    RegisterPropertyEditor(TypeInfo(string), TCustomClientDataSet, 'OutProviderName', TProviderNameProperty);
    RegisterPropertiesInCategory(sLinkageCategoryName, TCustomClientDataSet, ['ProviderName', 'OutProviderName']);
    { Client DataSet action registration }
    RegisterActions(sDataSnap, [TClientDataSetApply, TClientDataSetRevert,
      TClientDataSetUndo], TClientDatasetActions);
{$ENDIF}
    RegisterPropertyEditor(TypeInfo(WideString), TCustomClientDataSet, 'IndexName', TIndexNameProperty);
    RegisterPropertyEditor(TypeInfo(WideString), TCustomClientDataSet, 'IndexFieldNames', TIndexFieldNamesProperty);
    RegisterPropertyEditor(TypeInfo(Widestring), TCustomClientDataSet, 'MasterFields', TCDSFieldLinkProperty);
    RegisterPropertyEditor(TypeInfo(string), TCustomClientDataSet, 'FileName', TCDSFileNameProperty);
    RegisterPropertyEditor(TypeInfo(string), TAggregateField, 'IndexName', TLookupAggIndexProperty);
    RegisterComponentEditor(TCustomClientDataSet, TClientDataSetEditor);
{$IFDEF MSWINDOWS}
    RegisterSprigType(TCustomProvider, TCustomProviderSprig);
    RegisterSprigType(TDataSetProvider, TDataSetProviderSprig);
    RegisterSprigType(TCustomClientDataSet, TClientDataSetSprig);
{    RegisterIslandType(TClientDataSetSprig, TClientDataSetIsland);
    RegisterBridgeType(TDataSetIsland, TClientDataSetIsland, TClientDataSetMasterDetailBridge); }
{$ENDIF}
  end;
end;

end.
