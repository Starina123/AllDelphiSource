{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.Bind.DBScope"'}    {Do not Localize}
unit Data.Bind.DBScope;

interface

uses
  System.Classes, System.SysUtils, Data.DB, Data.Bind.Components,
  System.Bindings.Helper, System.Generics.Collections, System.Bindings.CustomScope,
  System.Bindings.CustomWrapper, System.Bindings.Factories, System.Bindings.EvalProtocol;

type
  TBindDataSetScope = class(TCustomScope)
  protected
    function DoLookup(const Name: String): IInterface; override;
  end;

  TBaseDataLink = class;

  // DataSource.DataSet defines the object scope
  TCustomBindScopeDB = class(TBaseBindScopeComponent, IScopeEditLink, IScopeRecordEnumerable,
    IScopeNavigator, IScopeActive, IScopeState, IScopeEditor, IScopeMemberNames, IScopeCurrentRecord)
  private
    FDataLink: TBaseDataLink;
    FDataSource: TDataSource;
    FDataLinks: TDictionary<TBasicBindComponent, TBaseDataLink>;
    FActiveChanged: TBindEventList;
    FDataSetChanged: TBindEventList;
    FEditingChanged: TBindEventList;
    FDataSetScrolled: TBindEventList1<Integer>;
    procedure SetDataSource(const Value: TDataSource);
    function CheckDataSet: Boolean;
    procedure OnActiveChanged(Sender: TObject);
    procedure OnDataSetChanged(Sender: TObject);
    procedure OnDataSetScrolled(Sender: TObject; ADistance: Integer);
    procedure OnEditingChanged(Sender: TObject);
  protected
    function GetValue: TObject; override;
    function GetMember(const AMemberName: string): TObject; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure AddExpression(AExpression: TBasicBindComponent); override;
    procedure RemoveExpression(AExpression: TBasicBindComponent); override;
    { IScopeEditLink }
    function Edit(ABindComp: TBasicBindComponent): Boolean;overload;  virtual;
    function GetIsEditing(ABindComp: TBasicBindComponent): Boolean; virtual;
    procedure SetModified(ABindComp: TBasicBindComponent); virtual;
    function GetIsModified(ABindComp: TBasicBindComponent): Boolean; virtual;
    function GetCanModify(ABindComp: TBasicBindComponent): Boolean; overload; virtual;
    procedure UpdateRecord(ABindComp: TBasicBindComponent); virtual;
    procedure Reset(ABindComp: TBasicBindComponent); virtual;
    procedure SetReadOnly(ABindComp: TBasicBindComponent; const Value: Boolean); virtual;
    procedure SetField(ABindComp: TBasicBindComponent; const FieldName: string); virtual;
    procedure ClearModified(ABindComp: TBasicBindComponent); virtual;
    { IScopeRecordEnumerable }
    function GetEnumerator(const AMemberName: string; ABufferCount: Integer): IScopeRecordEnumerator;
    { IScopeNavigator }
    function GetBOF: Boolean; virtual;
    function GetEOF: Boolean; virtual;
    function GetSelected: Boolean; virtual;
    procedure Next; virtual;
    procedure Prior; virtual;
    procedure First; virtual;
    procedure Last; virtual;
    { IScopeState }
    function GetActive: Boolean; virtual;
    function GetCanModify: Boolean; overload; virtual;
    function GetEditing: Boolean; virtual;
    procedure AddActiveChanged(LNotify: TNotifyEvent); virtual;
    procedure RemoveActiveChanged(LNotify: TNotifyEvent); virtual;
    procedure AddEditingChanged(LNotify: TNotifyEvent); virtual;
    procedure RemoveEditingChanged(LNotify: TNotifyEvent); virtual;
    procedure AddDataSetScrolled(LNotify: TNotifyDistanceEvent); virtual;
    procedure RemoveDataSetScrolled(LNotify: TNotifyDistanceEvent); virtual;
    procedure AddDataSetChanged(LNotify: TNotifyEvent); virtual;
    procedure RemoveDataSetChanged(LNotify: TNotifyEvent); virtual;
    { IScopeEditor }
    procedure Insert; virtual;
    procedure Delete; virtual;
    procedure Cancel; virtual;
    procedure Post; virtual;
    procedure Edit; overload; virtual;
    procedure Refresh; virtual;
    function IsValidChar(const AFieldName: string; const AChar: Char): Boolean;
    function IsRequired(const AFieldName: string): Boolean;
    { IScopeMemberNames }
    procedure GetMemberNames(AList: TStrings); virtual;
    { IScopeCurrentRecord }
    function GetCurrentRecord(const AMemberName: string): IScope;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

  TBindScopeDB = class(TCustomBindScopeDB)
  published
    property DataSource;
  end;

  TBaseDataLink = class(TDataLink)
  protected
    function Edit: Boolean; virtual;
  end;

  TBindScopeDBEnumerator = class(TInterfacedObject, IScopeRecordEnumerator,
    IScopeRecordEnumeratorCount)
  private
    FBindScope: TCustomBindScopeDB;
    FSaveActiveRecord: Integer;
    FMemberName: string;
    FNextRecord: Integer;
  public
    constructor Create(ABindScope: TCustomBindScopeDB; const AMemberName: string;
      ABufferCount: Integer);
    destructor Destroy; override;
    procedure First;
    function GetCurrent: IScope;
    function GetRecordCount: Integer;
    function GetMemberCurrent(const AMemberName: string): IScope;
    function MoveNext: Boolean;
    property Current: IScope read GetCurrent;
  end;


implementation

uses System.Rtti, System.Bindings.Outputs, System.Bindings.Methods, Data.Bind.Consts;

type
  TScopeDataLink = class(TBaseDataLink)
  private
    FDBScopeComponent: TCustomBindScopeDB;
    FOnDataSetChanged: TNotifyEvent;
    FOnEditingChanged: TNotifyEvent;
    FOnActiveChanged: TNotifyEvent;
    FOnDataSetScrolled: TNotifyDistanceEvent;
  public
    constructor Create(ADBScopeComponent: TCustomBindScopeDB);
    procedure DataSetChanged; override;
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    property OnDataSetChanged: TNotifyEvent read FOnDataSetChanged write FOnDataSetChanged;
    property OnDataSetScrolled: TNotifyDistanceEvent read FOnDataSetScrolled write FOnDataSetScrolled;
    property OnActiveChanged: TNotifyEvent read FOnActiveChanged write FOnActiveChanged;
    property OnEditingChanged: TNotifyEvent read FOnEditingChanged write FOnEditingChanged;
  end;

  TBindLinkDataLink = class(TBaseDataLink)
  strict private
    FBindLink: IBindLink;
    FBindLayoutChanged: IBindLayoutChanged;
    FBindPosition: IBindPosition;
    FBindListUpdate: IBindListUpdate;
    FEditing: Boolean;
    FField: TField;
    FFieldName: string;
    FModified: Boolean;
    function GetCanModify: Boolean;
  private
    function GetField: TField;
    procedure SetEditing(Value: Boolean);
    function GetFieldName: string;
    procedure SetField(Value: TField);
    procedure SetFieldName(Value: string);
    procedure UpdateField;
    procedure DoDataChange(Sender: TObject; AField: TField);
  protected
    procedure RecordChanged(Field: TField); override;
    procedure DataEvent(Event: TDataEvent; Info: NativeInt); override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(ADistance: Integer); override;
    procedure LayoutChanged; override;
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure UpdateData; override;
    function Edit: Boolean; override;
  public
    constructor Create(ABindLink: IBindLink); overload;
    constructor Create(ABindPosition: IBindPosition); overload;
    constructor Create(ABindListUpdate: IBindListUpdate); overload;
    procedure Modified;
    function IsModified: Boolean;
    procedure ClearModified;
    procedure Reset;
    property CanModify: Boolean read GetCanModify;
    property Editing: Boolean read FEditing;
    property Field: TField read GetField;
  end;

constructor TBindLinkDataLink.Create(ABindLink: IBindLink);
begin
  inherited Create;
  FBindLink := ABindLink;
  FFieldName := '';
  Supports(FBindLink, IBindPosition, FBindPosition);
  Supports(FBindLink, IBindListUpdate, FBindListUpdate);
  Supports(FBindLink, IBindLayoutChanged, FBindLayoutChanged);
end;

constructor TBindLinkDataLink.Create(ABindPosition: IBindPosition);
begin
  inherited Create;
  FBindPosition := ABindPosition;
  FFieldName := '';
  Supports(FBindPosition, IBindLink, FBindLink);
  Supports(FBindPosition, IBindListUpdate, FBindListUpdate);
  Supports(FBindPosition, IBindLayoutChanged, FBindLayoutChanged);
end;

procedure TBindLinkDataLink.ClearModified;
begin
  FModified := False;
end;

constructor TBindLinkDataLink.Create(ABindListUpdate: IBindListUpdate);
begin
  inherited Create;
  FBindListUpdate := ABindListUpdate;
  FFieldName := '';
  Supports(FBindListUpdate, IBindLink, FBindLink);
  Supports(FBindListUpdate, IBindPosition, FBindPosition);
  Supports(FBindListUpdate, IBindLayoutChanged, FBindLayoutChanged);
end;

procedure TBindLinkDataLink.SetField(Value: TField);
begin
  if FField <> Value then
  begin
    FField := Value;
    EditingChanged;
    RecordChanged(nil);
    //UpdateRightToLeft;
  end;
end;

procedure TBindLinkDataLink.SetFieldName(Value: string);
begin
  FFieldName := Value;
  UpdateField;
end;

procedure TBindLinkDataLink.ActiveChanged;
begin
  try
    UpdateField;
  except
    on E: Exception do
      // Don't raise exception while destroying
      if not ((DataSource <> nil) and (csDestroying in DataSource.ComponentState)) then
        raise;
  end;
end;

procedure TBindLinkDataLink.LayoutChanged;
begin
  if FBindLayoutChanged <> nil then
    FBindLayoutChanged.LayoutChanged;
  UpdateField;
end;

procedure TBindLinkDataLink.DataEvent(Event: TDataEvent; Info: NativeInt);
begin
  inherited;
  if Event = deFieldChange then
  begin
    if Boolean(Info) then
      UpdateField
    else
      FField := nil;
  end
  else if (Event = deDisabledStateChange) then
  begin
    if Boolean(Info) then
      UpdateField
    else
      FField := nil;
  end;
end;

procedure TBindLinkDataLink.DataSetChanged;
var
  LBindListRefresh: IBindListRefresh;
  LRefreshed: Boolean;
begin
  if (FBindListUpdate <> nil) and Active then
  begin
    LRefreshed := False;
    if Supports(FBindListUpdate, IBindListRefresh, LBindListRefresh)  then
      if LBindListRefresh.RefreshNeeded then
      begin
        LBindListRefresh.RefreshList;
        LRefreshed := True;
      end;
    if not LRefreshed then
    begin
      if FBindPosition <> nil then
      begin
        if Self.DataSource.DataSet.RecNo > 0 then
           FBindPosition.EvaluatePosControl;  // Needed
      end;
      FBindListUpdate.UpdateList;
    end;
  end
  else if (FBindPosition <> nil) and Active then
  begin
      if Self.DataSource.DataSet.RecNo > 0 then
        FBindPosition.EvaluatePosControl; // Needed
  end;
  RecordChanged(nil);
end;

procedure TBindLinkDataLink.DataSetScrolled(ADistance: Integer);
var
  LDataLink: TBindLinkDataLink;
begin
  LDataLink := Self;
  if Active then
    if FBindLink <> nil then
    begin
      if FBindPosition <> nil then
      begin
        // Must position grid to current record
        if LDataLink.DataSource.DataSet.RecNo > 0 then
          FBindPosition.EvaluatePosControl;
      end
      else
        RecordChanged(nil);
    end
    else if FBindPosition <> nil then
      if Active then
        if LDataLink.DataSource.DataSet.RecNo > 0 then
          FBindPosition.EvaluatePosControl;
end;

procedure TBindLinkDataLink.UpdateField;
var
  LFieldName: string;
begin
  LFieldName := GetFieldName;
  if (LFieldName = '') and (FField = nil) then
  begin
    // No field name
    RecordChanged(nil);
  end
  else
  begin
    if Active and (LFieldName <> '') then
    begin
      FField := nil;
      SetField(DataSource.DataSet.FieldByName(LFieldName));
    end
    else
      SetField(nil);
  end;
end;

function TBindLinkDataLink.GetFieldName: string;
begin
  if FBindLink <> nil then
    Result := FBindLink.SourceMemberName
  else if FBindPosition <> nil then
    Result := FBindPosition.SourceMemberName;
  if Result = '' then
    Result := FFieldName;
end;

function TBindLinkDataLink.IsModified: Boolean;
begin
  Result := FModified;
end;

function TBindLinkDataLink.Edit: Boolean;
begin
  if CanModify then inherited Edit;
  Result := FEditing;
end;

function TBindLinkDataLink.GetCanModify: Boolean;
begin
  Result := not ReadOnly and ((Field = nil) or Field.CanModify);
end;

function TBindLinkDataLink.GetField: TField;
begin
  Result := FField;
end;

procedure TBindLinkDataLink.Modified;
begin
  FModified := True;
end;

procedure TBindLinkDataLink.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

procedure TBindLinkDataLink.UpdateData;
begin
                                         
  if FBindLink <> nil then
    if not FBindLink.Updating then
    begin
      FBindLink.BeginUpdate;
      try
        if FModified then
        begin
         FBindLink.EvaluateParse('');
          FModified := False;
        end;
      finally
        FBindLink.EndUpdate;
      end;
    end;
end;

procedure TBindLinkDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FField) then
  begin
    DoDataChange(Self, Field);
    FModified := False;
  end
  else if FField = nil then
  begin
    DoDataChange(Self, nil);
    FModified := False;
  end;
end;

procedure TBindLinkDataLink.Reset;
begin
  RecordChanged(nil);
end;


// Copied from DBEdit
procedure TBindLinkDataLink.DoDataChange(Sender: TObject; AField: TField);
var
  LDataLink: TBindLinkDataLink;
  LMemberName: string;
begin
  if AField <> nil then
    LMemberName := AField.FieldName;
  LDataLink := Self;
  if FBindLink <> nil then
  begin
//    if (FBindPosition <> nil) and Active then
//      // Must position grid to current record
//      if LDataLink.DataSource.DataSet.RecNo > 0 then

//      FBindPosition.EvaluatePosControl;
    if (not FBindLink.Updating) then
    begin
      FBindLink.BeginUpdate;
      try
        if LDataLink.Field <> nil then
        begin
          if LDataLink.CanModify then // FFocused and FDataLink.CanModify then
            FBindLink.EvaluateFormat(LMemberName)
          else
          begin
            FBindLink.EvaluateFormat(LMemberName);
          end;
        end else
        begin
          if Active and (RecordCount > 0) then
            FBindLink.EvaluateFormat((LMemberName))
          else
            FBindLink.EvaluateClear((LMemberName))
        end;
      finally
        FBindLink.EndUpdate;
      end;
    end;
  end
//  else if FBindPosition <> nil then
//    if Active then
//      if LDataLink.DataSource.DataSet.RecNo > 0 then
//
//      FBindPosition.EvaluatePosControl;
end;

procedure TBindLinkDataLink.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    FModified := False;
    //if Assigned(FOnEditingChange) then FOnEditingChange(Self);
  end;
end;

procedure TCustomBindScopeDB.AddActiveChanged(LNotify: TNotifyEvent);
begin
  FActiveChanged.Add(LNotify);
end;

procedure TCustomBindScopeDB.AddDataSetChanged(LNotify: TNotifyEvent);
begin
  FDataSetChanged.Add(LNotify);
end;

procedure TCustomBindScopeDB.AddDataSetScrolled(LNotify: TNotifyDistanceEvent);
begin
  FDataSetScrolled.Add(LNotify);
end;

procedure TCustomBindScopeDB.AddEditingChanged(LNotify: TNotifyEvent);
begin
  FEditingChanged.Add(LNotify);
end;

procedure TCustomBindScopeDB.AddExpression(AExpression: TBasicBindComponent);
var
  LBindLinkDataLink: TBindLinkDataLink;
  LBindLink: IBindLink;
  LBindPosition: IBindPosition;
begin
  inherited;
  if Supports(AExpression, IBindLink, LBindLink) then
  begin
    LBindLinkDataLink := TBindLinkDataLink.Create(LBindLink);
    FDataLinks.AddOrSetValue(AExpression,
      LBindLinkDataLink);
    if Self.DataSource <> nil then
      LBindLinkDataLink.DataSource := Self.DataSource;
  end
  else if Supports(AExpression, IBindPosition, LBindPosition) then
  begin
    LBindLinkDataLink := TBindLinkDataLink.Create(LBindPosition);
    FDataLinks.AddOrSetValue(AExpression,
      LBindLinkDataLink);
    if Self.DataSource <> nil then
      LBindLinkDataLink.DataSource := Self.DataSource;
  end;

end;

constructor TCustomBindScopeDB.Create(AOwner: TComponent);
var
  LDataLink: TScopeDataLink;
begin
  inherited;
  LDataLink := TScopeDataLink.Create(Self);
  FDataLink := LDataLink;
  LDataLink.OnActiveChanged := OnActiveChanged;
  LDataLink.OnDataSetChanged := OnDataSetChanged;
  LDataLink.OnDataSetScrolled := OnDataSetScrolled;
  LDataLink.OnActiveChanged := OnActiveChanged;
  LDataLink.OnEditingChanged := OnEditingChanged;
  FDataLinks := TObjectDictionary<TBasicBindComponent, TBaseDataLink>.Create([doOwnsValues]);
  FActiveChanged := TBindEventList.Create;
  FDataSetChanged := TBindEventList.Create;
  FEditingChanged := TBindEventList.Create;
  FDataSetScrolled := TBindEventList1<Integer>.Create;

end;

procedure TCustomBindScopeDB.Delete;
begin
  if CheckDataSet then
    FDataSource.DataSet.Delete;
end;

destructor TCustomBindScopeDB.Destroy;
begin
  inherited; // Send Notification before free objects
  FreeAndNil(FDataLink);
  FreeAndNil(FDataLinks);
  FreeAndNil(FActiveChanged);
  FreeAndNil(FDataSetChanged);
  FreeAndNil(FEditingChanged);
  FreeAndNil(FDataSetScrolled);

end;

procedure TCustomBindScopeDB.Edit;
begin
  if CheckDataSet then
    FDataSource.DataSet.Edit;
end;

procedure TCustomBindScopeDB.OnEditingChanged(Sender: TObject);
begin
  FEditingChanged.Send(Self);
end;

procedure TCustomBindScopeDB.OnActiveChanged(Sender: TObject);
begin
  FActiveChanged.Send(Self);
end;

procedure TCustomBindScopeDB.OnDataSetChanged(Sender: TObject);
begin
  FDataSetChanged.Send(Self);
end;

procedure TCustomBindScopeDB.OnDataSetScrolled(Sender: TObject; ADistance: Integer);
begin
  FDataSetScrolled.Send(Self, ADistance);
end;

function TCustomBindScopeDB.Edit(ABindComp: TBasicBindComponent): Boolean;
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    Result := LDataLink.Edit
  end
  else
    Result := False;
end;

function TCustomBindScopeDB.CheckDataSet: Boolean;
begin
  Result := (FDataSource <> nil) and (FDataSource.DataSet <> nil);
end;

procedure TCustomBindScopeDB.First;
begin
  if CheckDataSet then
    FDataSource.DataSet.First;
end;

procedure TCustomBindScopeDB.UpdateRecord(ABindComp: TBasicBindComponent);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    LDataLink.UpdateRecord;
  end
end;

procedure TCustomBindScopeDB.Reset(ABindComp: TBasicBindComponent);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      TBindLinkDataLink(LDataLink).Reset
  end
end;

procedure TCustomBindScopeDB.SetModified(ABindComp: TBasicBindComponent);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      TBindLinkDataLink(LDataLink).Modified
  end
end;

procedure TCustomBindScopeDB.ClearModified(ABindComp: TBasicBindComponent);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      TBindLinkDataLink(LDataLink).ClearModified;
  end
end;

procedure TCustomBindScopeDB.SetReadOnly(ABindComp: TBasicBindComponent; const Value: Boolean);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      TBindLinkDataLink(LDataLink).ReadOnly := Value;
  end
end;

function TCustomBindScopeDB.GetIsModified(ABindComp: TBasicBindComponent): Boolean;
var
  LDataLink: TBaseDataLink;
begin
  Result := False;
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      Result := TBindLinkDataLink(LDataLink).IsModified
  end
end;

function TCustomBindScopeDB.GetIsEditing(ABindComp: TBasicBindComponent): Boolean;
var
  LDataLink: TBaseDataLink;
begin
  Result := False;
  if FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      Result := TBindLinkDataLink(LDataLink).Editing;
  end
end;

procedure TCustomBindScopeDB.Cancel;
begin
  if CheckDataSet then
    FDataSource.DataSet.Cancel;
end;

function TCustomBindScopeDB.GetCanModify(ABindComp: TBasicBindComponent): Boolean;
var
  LDataLink: TBaseDataLink;
begin
  Result := False;
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      Result := TBindLinkDataLink(LDataLink).CanModify
  end
end;

function TCustomBindScopeDB.GetActive: Boolean;
begin
  if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
    Result := FDataSource.DataSet.Active and FDataLink.Active
  else
    Result := FDataLink.Active;
end;

function TCustomBindScopeDB.GetBOF: Boolean;
begin
  if CheckDataSet then
    Result := FDataSource.DataSet.Bof
  else
    Result := True;

end;

function TCustomBindScopeDB.GetCanModify: Boolean;
begin
  Result := False;
  if FDataSource <> nil then
    if FDataSource.DataSet <> nil then
      Result := FDataSource.DataSet.CanModify;
end;

function TCustomBindScopeDB.GetCurrentRecord(const AMemberName: string): IScope;
begin
  if AMemberName <> '' then
    Result := GetMemberScope(AMemberName)
  else
    Result := GetScope;
end;

function TCustomBindScopeDB.GetEditing: Boolean;
begin
  Result := FDataLink.Editing;
end;

function TCustomBindScopeDB.GetEnumerator(
  const AMemberName: string; ABufferCount: Integer): IScopeRecordEnumerator;
begin
  Result := TBindScopeDBEnumerator.Create(Self, AMemberName, ABufferCount);
end;

function TCustomBindScopeDB.GetEOF: Boolean;
begin
  if CheckDataSet then
    Result := FDataSource.DataSet.Eof
  else
    Result := True;
end;

function TCustomBindScopeDB.GetSelected: Boolean;
begin
  if CheckDataSet then
    Result := not (FDataSource.DataSet.Eof and FDataSource.DataSet.Bof)
  else
    Result := True;
end;

function TCustomBindScopeDB.GetMember(const AMemberName: string): TObject;
begin
  Result := nil;
  Assert(FDataSource <> nil);
  if FDataSource <> nil then
  begin
    Assert(FDataSource.DataSet <> nil);
    if FDataSource.DataSet.Active then
      Result := FDataSource.DataSet.FieldByName(AMemberName);
  end;
end;

procedure TCustomBindScopeDB.GetMemberNames(AList: TStrings);
begin
  if (FDataSource <> nil) and (FDataSource.DataSet <> nil ) then
    FDataSource.DataSet.GetFieldNames(AList)
  else
    AList.Clear;
end;

function TCustomBindScopeDB.GetValue: TObject;
begin
  Assert(FDataSource <> nil);
  if FDataSource <> nil then
  begin
    Result := FDataSource.DataSet;
  end
  else
    Result := nil;
end;


procedure TCustomBindScopeDB.Insert;
begin
  if CheckDataSet then
    FDataSource.DataSet.Insert;
end;

function TCustomBindScopeDB.IsRequired(const AFieldName: string): Boolean;
var
  LField: TField;
begin
  Result := False;
  if CheckDataSet then
  begin
    LField := FDataSource.DataSet.FieldByName(AFieldName);
    if Assigned(LField) then
      Result := LField.Required;
  end;
end;

function TCustomBindScopeDB.IsValidChar(const AFieldName: string;
  const AChar: Char): Boolean;
var
  LField: TField;
begin
  Result := False;
  if CheckDataSet then
  begin
    LField := FDataSource.DataSet.FieldByName(AFieldName);
    if Assigned(LField) then
    begin
      if AChar = #0 then
        // Special case to test if field is read only
        Result := LField.CanModify
      else
        Result := LField.IsValidChar(AChar);
    end
  end;
end;

procedure TCustomBindScopeDB.Last;
begin
  if CheckDataSet then
    FDataSource.DataSet.Last;
end;

procedure TCustomBindScopeDB.Next;
begin
  if CheckDataSet then
    FDataSource.DataSet.Next;
end;

procedure TCustomBindScopeDB.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = TOperation.opRemove then
  begin
    if AComponent = FDataSource then
      DataSource := nil;
    if AComponent is TBasicBindComponent then
      if FDataLinks.ContainsKey(TBasicBindComponent(AComponent)) then
        FDataLinks.Remove(TBasicBindComponent(AComponent));

  end;
end;

procedure TCustomBindScopeDB.Post;
begin
  if CheckDataSet then
    FDataSource.DataSet.Post;
end;

procedure TCustomBindScopeDB.Refresh;
begin
  if CheckDataSet then
    FDataSource.DataSet.Refresh;
end;

procedure TCustomBindScopeDB.Prior;
begin
  if CheckDataSet then
    FDataSource.DataSet.Prior;
end;

procedure TCustomBindScopeDB.RemoveActiveChanged(LNotify: TNotifyEvent);
begin
  if Assigned(FActiveChanged) then
    FActiveChanged.Remove(LNotify);
end;

procedure TCustomBindScopeDB.RemoveDataSetChanged(LNotify: TNotifyEvent);
begin
  if Assigned(FDataSetChanged) then
    FDataSetChanged.Remove(LNotify);
end;

procedure TCustomBindScopeDB.RemoveDataSetScrolled(LNotify: TNotifyDistanceEvent);
begin
  if Assigned(FDataSetScrolled) then
    FDataSetScrolled.Remove(LNotify);
end;

procedure TCustomBindScopeDB.RemoveEditingChanged(LNotify: TNotifyEvent);
begin
  if Assigned(FEditingChanged) then
    FEditingChanged.Remove(LNotify);
end;

procedure TCustomBindScopeDB.RemoveExpression(AExpression: TBasicBindComponent);
begin
  inherited;
  if FDataLinks <> nil then
    FDataLinks.Remove(AExpression);

end;

procedure TCustomBindScopeDB.SetDataSource(const Value: TDataSource);
var
  LLink: TBaseDataLink;
begin
  if Value <> FDataSource then
  begin
    if FDataSource <> nil then
      FDataSource.RemoveFreeNotification(Self);
    FDataSource := Value;
    if FDataSource <> nil then
      FDataSource.FreeNotification(Self);
    FDataLink.DataSource := Value;
    for LLink in FDataLinks.Values do
      LLink.DataSource := Value;
  end;
end;

procedure TCustomBindScopeDB.SetField(ABindComp: TBasicBindComponent;
  const FieldName: string);
var
  LDataLink: TBaseDataLink;
begin
  if (FDataLinks <> nil) and FDataLinks.TryGetValue(ABindComp, LDataLink) then
  begin
    Assert(LDataLink <> nil);
    if LDataLink is TBindLinkDataLink then
      TBindLinkDataLink(LDataLink).SetFieldName(FieldName);
  end
end;

{ TScopeDataLink }

procedure TScopeDataLink.ActiveChanged;
begin
  inherited;
  if Assigned(FOnActiveChanged) then
    FOnActiveChanged(Self);
  FDBScopeComponent.ActivateExpressions(Self.Active);

end;

constructor TScopeDataLink.Create(ADBScopeComponent: TCustomBindScopeDB);
begin
  inherited Create;
  FDBScopeComponent := ADBScopeComponent;
end;

procedure TScopeDataLink.DataSetChanged;
begin
  inherited;
  if Assigned(FOnDataSetChanged) then
    FOnDataSetChanged(Self);
end;

procedure TScopeDataLink.DataSetScrolled(Distance: Integer);
begin
  if Assigned(FOnDataSetScrolled) then
    FOnDataSetScrolled(Self, Distance);


end;

procedure TScopeDataLink.EditingChanged;
begin
  inherited;
  if Assigned(FOnEditingChanged) then
    FOnEditingChanged(Self);
end;

{ TBaseDataLink }

function TBaseDataLink.Edit: Boolean;
begin
  Result := inherited Edit;
end;

{ TBindScopeDBEnumerator }

constructor TBindScopeDBEnumerator.Create(ABindScope: TCustomBindScopeDB;
  const AMemberName: string; ABufferCount: Integer);
begin
  FBindScope := ABindScope;
  FMemberName := AMemberName;
  FSaveActiveRecord := FBindScope.FDataLink.ActiveRecord;
  FNextRecord := FSaveActiveRecord;
  if ABufferCount > 0 then
    FBindScope.FDataLink.BufferCount := ABufferCount
  else
    FBindScope.FDataLink.BufferCount := 200;  // default to max 200 records in buffer
end;

destructor TBindScopeDBEnumerator.Destroy;
begin
  inherited;
  FBindScope.FDataLink.ActiveRecord := FSaveActiveRecord;
end;

procedure TBindScopeDBEnumerator.First;
begin
  FSaveActiveRecord := FBindScope.FDataLink.ActiveRecord;
  if FBindScope.FDataLink.DataSet <> nil then
  begin
    if FBindScope.FDataLink.ActiveRecord < FBindScope.FDataLink.BufferCount then
      FBindScope.FDataLink.ActiveRecord := 0
    else if not FBindScope.FDataLink.BOF then
    begin
      FBindScope.FDataLink.DataSet.First;
      FSaveActiveRecord := FBindScope.FDataLink.ActiveRecord;
    end;
  end;
  FNextRecord := FBindScope.FDataLink.ActiveRecord;
end;

function TBindScopeDBEnumerator.GetCurrent: IScope;
begin
  if FMemberName <> '' then
    Result := FBindScope.GetMemberScope(FMemberName)
  else
    Result := FBindScope.GetScope;
end;

function TBindScopeDBEnumerator.GetMemberCurrent(const AMemberName: string): IScope;
begin
  if AMemberName <> '' then
    Result := FBindScope.GetMemberScope(AMemberName)
  else
    Result := GetCurrent;
end;

function TBindScopeDBEnumerator.GetRecordCount: Integer;
begin
  Result := FBindScope.FDataLink.RecordCount;

end;

function TBindScopeDBEnumerator.MoveNext: Boolean;
begin
  if FNextRecord < FBindScope.FDataLink.RecordCount then
  begin
    FBindScope.FDataLink.ActiveRecord := FNextRecord;
    FNextRecord := FNextRecord + 1;
    Result := True;
  end
  else
    Result := False;
end;

{ TBindDataSetScope }

function TBindDataSetScope.DoLookup(const Name: String): IInterface;
var
  DataSet: TDataSet;
begin
  Result := nil;
  if MappedObject is TDataSet then
  begin
    DataSet := TDataSet(MappedObject);
    if DataSet.FindField(Name) <> nil then
      Result := TCustomWrapper.Create(DataSet, DataSet.ClassType, Name, cwtProperty,
        function (ParentObject: TObject; const MemberName: String; Args: TArray<TValue>): TValue
        begin
          Result := TDataSet(ParentObject).FieldByName(MemberName);
        end);
  end;
end;

type
  TDataSetCracker = class(TDataSet)
  end;

// Bidi method to constrain a integer value to a valid row number
// RValue uses: ValidRecNo(dataset, integer)
// LValue usage: ValidRecNo(dataset)
function MakeValidRecNo: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    LDataSetValue: IValue;
  begin
    if Length(Args) < 1 then
      raise EEvaluatorError.Create(sArgCount);
    LDataSetValue := Args[0];
    Result := MakeLocation(TypeInfo(Integer),
      function: TValue
      var
        LRecNo: Integer;
        LDataSet: TDataSet;
        LRecNoValue: IValue;
      begin
        if Length(Args) <> 2 then
          raise EEvaluatorError.Create(sArgCount);
       LRecNo := -1;
       if LDataSetValue.GetValue.IsInstanceOf(TDataSet) then
        begin
          LRecNoValue := Args[1];
          LDataSet := TDataSet(LDataSetValue.GetValue.AsObject);
          LRecNo := LRecNoValue.GetValue.AsInteger;
          // Clip RecNo within valid range
          if LRecNo >  LDataSet.RecordCount then
            LRecNo := LDataSet.RecordCount;
          if LRecNo <= 0 then
            if LDataSet.RecordCount > 0 then
              LRecNo := 1
            else
              LRecNo := -1;
        end;
        Result := LRecNo;
      end,
      procedure(x: TValue)
      var
        LRecNo: Integer;
        LDataSet: TDataSet;
        LActiveRecord: Integer;
      begin
        if Length(Args) <> 1 then
          raise EEvaluatorError.Create(sArgCount);
        if LDataSetValue.GetValue.IsInstanceOf(TDataSet) then
        begin
          LDataSet := TDataSet(LDataSetValue.GetValue.AsObject);
          LRecNo := x.AsInteger;
          if LRecNo > 0 then
          begin
            LActiveRecord := TDataSetCracker(LDataSet).ActiveRecord;
            if LDataSet.RecNo = -1 then
              if LRecNo = LActiveRecord + 1 then
                // Don't set
                Exit;
          end;
          // Set RecNo within valid range if possible
          if LRecNo >  LDataSet.RecordCount then
            LRecNo := LDataSet.RecordCount;
          if LRecNo <= 0 then
            if LDataSet.RecordCount > 0 then
              LRecNo := 1;
          if (LRecNo > 0) and (LRecNo <> LDataSet.RecNo) then
          begin
            // Must be carefull when set RecNo because this ends editing
            LDataSet.RecNo := LRecNo;
          end;
        end
      end);
  end);
end;

function MakeActiveRecord: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    LDataSetValue: IValue;
    LDataSet: TDataSet;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(Format(sArgCount, [1, Length(Args)]));
    LDataSetValue := Args[0];
    if LDataSetValue.GetValue.IsInstanceOf(TDataSet) then
    begin
      LDataSet := TDataSet(LDataSetValue.GetValue.AsObject);
      Exit(
        TValueWrapper.Create(TDataSetCracker(LDataSet).ActiveRecord));
    end
    else
      Exit(TValueWrapper.Create(TValue.Empty));
  end);
end;

const
  sValidRecNo = 'DBUtils_ValidRecNo';
  sActiveRecord = 'DBUtils_ActiveRecord';
  sThisUnit = 'Data.Bind.DBScope';

procedure RegisterMethods;
begin
    TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(
        MakeValidRecNo,
        sValidRecNo,
        sValidRecNo,
        sThisUnit,
        True,
        '', nil)
    );
    TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(
        MakeActiveRecord,
        sActiveRecord,
        sActiveRecord,
        sThisUnit,
        True,
        '', nil)
    );
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sValidRecNo);
  TBindingMethodsFactory.UnRegisterMethod(sActiveRecord);
end;

initialization
  TBindingScopeFactory.RegisterScope(TDataSet, TBindDataSetScope);
  RegisterMethods;
finalization
  TBindingScopeFactory.UnregisterScope(TBindDataSetScope);
  UnregisterMethods;

end.
