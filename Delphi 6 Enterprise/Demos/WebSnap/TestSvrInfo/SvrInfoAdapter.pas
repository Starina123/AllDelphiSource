// Sample WebSnap Adapter that exposes information about
// Web App Debugger executables.  This information is available from the
// registry.

unit SvrInfoAdapter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WebAdapt, WebComp, HTTPApp, SiteComp, Contnrs, AdaptReq;

type
  TSvrInfoSortOrder = (soUnknown, soProgID, soFilePath);
const
  SvrInfoSortOrderNames: array[TSvrInfoSortOrder] of string =
   ('Unsorted', 'SortProgID', 'SortFilePath');
type
  TSvrInfoList = class;

  TSvrInfoItem = class
  public
    ProgID: string;
    ClsID: string;
    FullFileName: string;
    FileExists: Boolean;
    List: TSvrInfoList;
    function FileName: string;
    function FilePath: string;
    procedure Clear;
    constructor Create(AList: TSvrInfoList);
  end;

  TSvrInfoList = class
  private
    FList: TObjectList;
    FSorted: Boolean;
    FSortOrder: TSvrInfoSortOrder;
    function GetItem(I: Integer): TSvrInfoItem;
    procedure SetSortOrder(const Value: TSvrInfoSortOrder);
  public
    constructor Create;
    destructor Destroy; override;
    function Count: Integer;
    function AddClassID(AClassID: TGUID): TSvrInfoItem;
    procedure Clear;
    procedure Sort;
    property Items[I: Integer]: TSvrInfoItem read GetItem; default;
    property SortOrder: TSvrInfoSortOrder read FSortOrder write SetSortOrder;
  end;

  TCustomSvrInfoAdapter = class(TDefaultFieldsAdapter,
    IIteratorSupport)
  private
    FList: TSvrInfoList;
    FIndex: Integer;
    function GetList: TSvrInfoList;
  protected
    { IWebAdapterEditor }
    function ImplCanAddFieldClass(AParent: TComponent; AClass: TClass): Boolean; override;
    function ImplCanAddActionClass(AParent: TComponent; AClass: TClass): Boolean; override;
    { IWebFormIteratorVariable }
    function StartIterator(var OwnerData: Pointer): Boolean;
    function NextIteration(var OwnerData: Pointer): Boolean;
    procedure EndIterator(OwnerData: Pointer);
    { ISiteDataFields }
    procedure ImplGetFieldsList(AList: TStrings); override;
    { ISiteActionsList }
    procedure ImplGetActionsList(AList: TStrings); override;
    { INotifyWebActivate }
    procedure ImplNotifyDeactivate; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CurrentItem: TSvrInfoItem;
    property List: TSvrInfoList read GetList;
  end;

  TSvrInfoAdapter = class(TCustomSvrInfoAdapter)
  end;

  // The following components are the default fields of the adapter.
  TSvrInfoField = class(TAdapterNamedDisplayField)
  private
    FAdapter: TCustomSvrInfoAdapter;
  protected
    function Adapter: TCustomSvrInfoAdapter;
    function Item: TSvrInfoItem;
  end;

  TSvrInfoClsIDField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoProgIDField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoFileNameField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoFilePathField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoFileExistsField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoMarkClsIDField = class(TSvrInfoField)
  protected
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoURLPathField = class(TSvrInfoField)
  protected
    function ImplGetValue: Variant; override;
    function GetDefaultFieldName: string; override;
  end;

  TSvrInfoAction = class(TImplementedAdapterAction, IWebSetActionName)
  private
    FActionName: string;
  protected
    function Adapter: TCustomSvrInfoAdapter;
    { ISiteSetActionName }
    procedure SetActionName(const Value: string);
    procedure ImplSetActionName(const Value: string);
    procedure ImplExecuteActionRequest(AActionRequest: IActionRequest;
      AActionResponse: IActionResponse); override;
    procedure ExecuteActionRequestParamStrings(const AStrings: TStrings); virtual;
  end;

  TSvrInfoItemAction = class(TSvrInfoAction)
  protected
    function Item: TSvrInfoItem;
  end;

  // The following components are the default actions of the adapter.
  TSvrInfoSortByProgIDAction = class(TSvrInfoAction)
  protected
    { IWebExecute }
    procedure ExecuteActionRequestParamStrings(const AStrings: TStrings); override;
    function GetDefaultActionName: string; override;
  end;

  TSvrInfoSortByFilePathAction = class(TSvrInfoAction)
  protected
    { IWebExecute }
    procedure ExecuteActionRequestParamStrings(const AStrings: TStrings); override;
    function GetDefaultActionName: string; override;
  end;

  TSvrInfoCleanMarkedAction = class(TSvrInfoItemAction)
  protected
    { IWebExecute }
    procedure ImplExecuteActionRequest(AActionRequest: IActionRequest; AActionResponse: IActionResponse); override;
    function GetDefaultActionName: string; override;
  end;

  TSvrInfoCleanMissingFilesAction = class(TSvrInfoItemAction)
  protected
    { IWebExecute }
    procedure ImplExecuteActionRequest(AActionRequest: IActionRequest; AActionResponse: IActionResponse); override;
    function GetDefaultActionName: string; override;
    { IWebEnabled }
    function ImplWebEnabled: Boolean; override;
  end;

procedure Register;

implementation

uses ActiveX, ComObj, WebCat, WebCntxt, WebDisp;

const
  sClsIDField = 'ClsID';
  sProgIDField = 'ProgID';
  sFileName = 'FileName';
  sFilePath = 'FilePath';
  sURLPath = 'URLPath';
  sFileExists = 'FileExists';
  sCleanMarkedAction = 'CleanMarked';
  sCleanMissingFilesAction = 'CleanMissingFiles';
  sSortProgIDAction = 'SortProgID';
  sSortFilePathAction = 'SortFilePath';
  sMarkClsID = 'MarkClsID';

  sSortOrderCookie = 'SortDetails';

// Define the default fields
procedure ListSvrInfoFields(AList: TStrings);
begin
  AList.Clear;
  AList.AddObject(sClsIDField, TObject(TSvrInfoClsIDField));
  AList.AddObject(sProgIDField, TObject(TSvrInfoProgIDField));
  AList.AddObject(sFileName, TObject(TSvrInfoFileNameField));
  AList.AddObject(sFilePath, TObject(TSvrInfoFilePathField));
  AList.AddObject(sURLPath, TObject(TSvrInfoURLPathField));
  AList.AddObject(sFileExists, TObject(TSvrInfoFileExistsField));
  AList.AddObject(sMarkClsID, TObject(TSvrInfoMarkClsIDField));
end;

// Define the default actions
procedure ListSvrInfoActions(AList: TStrings);
begin
  AList.Clear;
  AList.AddObject(sCleanMarkedAction, TObject(TSvrInfoCleanMarkedAction));
  AList.AddObject(sCleanMissingFilesAction, TObject(TSvrInfoCleanMissingFilesAction));
  AList.AddObject(sSortProgIDAction, TObject(TSvrInfoSortByProgIDAction));
  AList.AddObject(sSortFilePathAction, TObject(TSvrInfoSortByFilePathAction));
end;

// Extract information from the registry
procedure GetWebAppList(List: TSvrInfoList; const RegCheck: string);
var
  EnumGUID: IEnumGUID;
  Fetched: Cardinal;
  Guid: TGUID;
  Rslt: HResult;
  CatInfo: ICatInformation;
  I, BufSize: Integer;
  ClsIDKey: HKey;
  S: string;
  Buffer: array[0..255] of Char;
begin
  List.Clear;
  Rslt := CoCreateInstance(CLSID_StdComponentCategoryMgr, nil,
    CLSCTX_INPROC_SERVER, ICatInformation, CatInfo);
  if Succeeded(Rslt) then
  begin
    OleCheck(CatInfo.EnumClassesOfCategories(1, @CATID_WebAppServer, 0, nil, EnumGUID));
    while EnumGUID.Next(1, Guid, Fetched) = S_OK do
    begin
      if RegCheck <> '' then
      begin
        S := SClsid + GuidToString(Guid) + '\';
        if GetRegStringValue(S, RegCheck) <> SFlagOn then continue;
      end;
      try
        List.AddClassID(Guid);
      except
        // Ignore
      end;
    end;
  end else
  begin
    if RegOpenKey(HKEY_CLASSES_ROOT, 'CLSID', ClsIDKey) <> 0 then
      try
        I := 0;
        while RegEnumKey(ClsIDKey, I, Buffer, SizeOf(Buffer)) = 0 do
        begin
          S := Format('%s\Implemented Categories\%s',[Buffer,  { do not localize }
            GUIDToString(CATID_WebAppServer)]);
          if RegQueryValue(ClsIDKey, PChar(S), nil, BufSize) = 0 then
          begin
            if RegCheck <> '' then
            begin
              BufSize := 256;
              SetLength(S, BufSize);
              if RegQueryValueEx(ClsIDKey, PChar(RegCheck), nil, nil,
                    PByte(PChar(S)), @BufSize) = ERROR_SUCCESS then
                SetLength(S, BufSize - 1) else
                S := '';
              if GetRegStringValue(S, RegCheck) <> SFlagOn then continue;
            end;
            List.AddClassID(StringToGUID(Buffer));
          end;
          Inc(I);
        end;
      finally
        RegCloseKey(ClsIDKey);
      end;
  end;
  if List.FSortOrder <> soUnknown then
    List.Sort;
end;

function GetDetails(AClassID: TGuid;
  ADetails: TSvrInfoItem): string;
begin
  ADetails.Clear;

  ADetails.ClsID := GuidToString(AClassID);
  ADetails.ProgID := ClassIDToProgID(AClassID);
  if ADetails.ClsID <> '' then
  begin
    ADetails.FullFileName := GetRegStringValue('CLSID\' + ADetails.ClsID + '\LocalServer32', '');
    if ADetails.FullFileName <> '' then
    begin
      ADetails.FileExists := FileExists(ADetails.FullFileName);
    end;
  end;
end;

function TCustomSvrInfoAdapter.ImplCanAddActionClass(
  AParent: TComponent; AClass: TClass): Boolean;
begin
  Result :=
    inherited ImplCanAddActionClass(AParent, AClass) or
    AClass.InheritsFrom(TSvrInfoAction);
end;

function TCustomSvrInfoAdapter.ImplCanAddFieldClass(AParent: TComponent;
  AClass: TClass): Boolean;
begin
  Result :=
    inherited ImplCanAddActionClass(AParent, AClass) or
    AClass.InheritsFrom(TSvrInfoField);
end;

// Support iteration with server-side script
procedure TCustomSvrInfoAdapter.EndIterator(
  OwnerData: Pointer);
begin
end;

function TCustomSvrInfoAdapter.NextIteration(
  var OwnerData: Pointer): Boolean;
begin
  Inc(FIndex);
  Result := FIndex < FList.Count;
end;

function TCustomSvrInfoAdapter.StartIterator(
  var OwnerData: Pointer): Boolean;
begin
  FIndex := 0;
  Result := GetList.Count > 0;
end;

procedure TCustomSvrInfoAdapter.ImplGetFieldsList(AList: TStrings);
begin
  ListSvrInfoFields(AList);
end;

procedure TCustomSvrInfoAdapter.ImplGetActionsList(AList: TStrings);
begin
  ListSvrInfoActions(AList);
end;

procedure Register;
begin
  RegisterComponents('WebSnap Samples', [TSvrInfoAdapter]);
  RegisterWebComponents([TSvrInfoClsIDField, TSvrInfoProgIDField,
    TSvrInfoFileNameField, TSvrInfoFilePathField, TSvrInfoFileExistsField, TSvrInfoURLPathField,
    TSvrInfoSortByProgIDAction, TSvrInfoSortByFilePathAction, TSvrInfoCleanMarkedAction,
    TSvrInfoCleanMissingFilesAction, TSvrInfoMarkClsIDField]);
end;

constructor TCustomSvrInfoAdapter.Create(AOwner: TComponent);
begin
  inherited;
  FList := TSvrInfoList.Create;
end;

destructor TCustomSvrInfoAdapter.Destroy;
begin
  inherited;
  FList.Free;

end;

{ TSvrInfoField }

function TSvrInfoField.Adapter: TCustomSvrInfoAdapter;
var
  C: TComponent;
begin
  if (csDesigning in ComponentState) or (FAdapter = nil) then
  begin
    FAdapter := nil;
    C := FindAdapterInParent(Self);
    if C <> nil then
      FAdapter := C as TCustomSvrInfoAdapter;
  end;
  Result := FAdapter;
end;

function TSvrInfoField.Item: TSvrInfoItem;
begin
  Result := Adapter.CurrentItem;
end;

{ TSvrInfoDetails }

procedure TSvrInfoItem.Clear;
begin
  ProgID := '';
  ClsID := '';
  FullFileName := '';
  FileExists := False;
end;

{ TSvrInfoClsIDField }

function TSvrInfoClsIDField.GetDefaultFieldName: string;
begin
  Result := sClsIDField;
end;

function TSvrInfoClsIDField.ImplGetValue: Variant;
begin
  Result := Item.ClsID;
end;

{ TSvrInfoProgIDField }

function TSvrInfoProgIDField.GetDefaultFieldName: string;
begin
  Result := sProgIDField;
end;

function TSvrInfoProgIDField.ImplGetValue: Variant;
begin
  Result := Item.ProgID;
end;

{ TSvrInfoFileNameField }

function TSvrInfoFileNameField.GetDefaultFieldName: string;
begin
  Result := sFileName;
end;

function TSvrInfoFileNameField.ImplGetValue: Variant;
begin
  Result := Item.FileName;
end;

{ TSvrInfoFilePathField }

function TSvrInfoFilePathField.GetDefaultFieldName: string;
begin
  Result := sFilePath;
end;

function TSvrInfoFilePathField.ImplGetValue: Variant;
begin
  Result := Item.FilePath;
end;

{ TSvrInfoFileExistsField }

function TSvrInfoFileExistsField.GetDefaultFieldName: string;
begin
  Result := sFileExists;
end;

function TSvrInfoFileExistsField.ImplGetValue: Variant;
begin
  Result := Item.FileExists;
end;

{ TSvrInfoPathField }

function TSvrInfoURLPathField.GetDefaultFieldName: string;
begin
  Result := sURLPath;
end;

function TSvrInfoURLPathField.ImplGetValue: Variant;
begin
  Result := '/'
end;

{ TSvrInfoCleanMarkedAction }

function TSvrInfoCleanMarkedAction.GetDefaultActionName: string;
begin
  Result := sCleanMarkedAction;
end;

procedure CleanRegistry(AProgID, AClassID, AServerKey: string);
begin
  if AProgID <> '' then
  begin
    DeleteRegKey(AProgID + '\Clsid');
    DeleteRegKey(AProgID);
  end;
  if AClassID <> '' then
  begin
    DeleteRegKey('CLSID\' + AClassID + '\ProgID');
    DeleteRegKey('CLSID\' + AClassID + '\' + AServerKey);
    DeleteRegKey('CLSID\' + AClassID + '\' + 'Implemented Categories');
    DeleteRegKey('CLSID\' + AClassID);
  end;
end;

// Remote entries from the registry
procedure CleanClsID(const ClassID: TGUID);
var
  CatReg: ICatRegister;
  Rslt: HResult;
  SClassID: string;
  ProgID: string;
begin
  SClassID := GUIDToString(ClassID);
  ProgID := ClassIDToProgID(ClassID);
  CleanRegistry(ProgID, SClassID, 'LocalServer32');

  Rslt := CoCreateInstance(CLSID_StdComponentCategoryMgr, nil,
    CLSCTX_INPROC_SERVER, ICatRegister, CatReg);
  if Succeeded(Rslt) then
  begin
    OleCheck(CatReg.UnRegisterClassImplCategories(ClassID, 1, @CATID_WebAppServer));
    DeleteRegKey(Format(SCatImplBaseKey, [SClassID]));
  end;
end;

procedure TSvrInfoCleanMarkedAction.ImplExecuteActionRequest(AActionRequest: IActionRequest;
  AActionResponse: IActionResponse);
var
  Value: IActionFieldValue;
  ActionFieldValues: IActionFieldValues;
  I: Integer;
  ClsID: string;
begin
  if not Supports(AActionRequest, IActionFieldValues, ActionFieldValues) then
    Assert(False);
  Value := ActionFieldValues.ValueOfField(sMarkClsID);
  if Value <> nil then
  begin
    for I := 0 to Value.ValueCount - 1 do
    begin
      ClsID := Value.Values[I];
      CleanClsID(StringToGuid(ClsID));
    end;
  end;
  Adapter.FList.Clear;
end;

{ TSvrInfoItemAction }

function TSvrInfoItemAction.Item: TSvrInfoItem;
begin
  Result := Adapter.CurrentItem;
end;

{ TSvrInfoList }

function TSvrInfoList.AddClassID(AClassID: TGuid): TSvrInfoItem;
begin
  Result := TSvrInfoItem.Create(Self);
  FList.Add(Result);
  GetDetails(AClassID, Result);
end;

procedure TSvrInfoList.Clear;
begin
  FList.Clear;
end;

function TSvrInfoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSvrInfoList.Create;
begin
  FList := TObjectList.Create(True {Owned});
end;

destructor TSvrInfoList.Destroy;
begin
  inherited;
  FList.Free;

end;

function TSvrInfoList.GetItem(I: Integer): TSvrInfoItem;
begin
  Result := FList.Items[I] as TSvrInfoItem;
end;

function TCustomSvrInfoAdapter.CurrentItem: TSvrInfoItem;
begin
  Result := FList[FIndex];
end;

resourcestring
  sUnknownSortOrder = 'Unknown sort order';

function SortCompare(Item1, Item2: Pointer): Integer;
var
  Info1, Info2: TSvrInfoItem;
begin
  Info1 := TSvrInfoItem(Item1);
  Info2 := TSvrInfoItem(Item2);
  case Info1.List.FSortOrder of
    soProgID:
      Result := AnsiCompareText(Info1.ProgID, Info2.ProgID);
    soFilePath:
      Result := AnsiCompareText(Info1.FilePath, Info2.FilePath);
  else
    raise Exception.Create(sUnknownSortOrder);
  end;
end;

procedure TSvrInfoList.SetSortOrder(const Value: TSvrInfoSortOrder);
begin
  if FSortOrder <> Value then
  begin
    FSortOrder := Value;
    if FSortOrder <> soUnknown then
      Sort;
  end;
end;

procedure TSvrInfoList.Sort;
begin
  if FSortOrder <> soUnknown then
  begin
    FList.Sort(SortCompare);
    FSorted := True;
  end;
end;

{ TSvrInfoAction }

function TSvrInfoAction.Adapter: TCustomSvrInfoAdapter;
var
  A: TComponent;
begin
  A := inherited Adapter;
  if A <> nil then
    Result := A as TCustomSvrInfoAdapter
  else
    Result := nil;
end;

(* jmt.!!!
function TSvrInfoAction.ActionParamsAsStrings(
  AActionParams: IAdapterRequestParams): TStrings;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to AActionParams.ParamCount - 1 do
    Result.Add(Format('%s=%s', [AActionParams.ParamNames[I],
      AActionParams.ParamValues[I]]));
end;

procedure TSvrInfoAction.ImplExecuteActionRequest(AActionRequest: IActionRequest;
  AActionResponse: IActionResponse);
var
  S: TStrings;
begin
  try
    S := ActionParamsAsStrings(AActionRequest.ActionParams);
    try
      WebExecuteParams(S);
    finally
      S.Free;
    end;
  except
    // Add to error list.  The errors can be accessed using
    // server-side script
    on E: Exception do
    begin
      Errors.AddError(E);
    end;
  end;

end;

procedure TSvrInfoAction.WebExecuteParams(const AStrings: TStrings);
begin
  // Descendent must implement
end;
*)

constructor TSvrInfoItem.Create(AList: TSvrInfoList);
begin
  List := AList;
  inherited Create;
end;

procedure TSvrInfoAction.ImplSetActionName(const Value: string);
begin
  if Value = GetDefaultActionName then
    FActionName := ''
  else
    FActionName := Value;
end;

procedure TSvrInfoAction.SetActionName(const Value: string);
begin
   ImplSetActionName(Value);
end;

procedure TSvrInfoAction.ImplExecuteActionRequest(AActionRequest: IActionRequest;
  AActionResponse: IActionResponse);
var
  S: TStrings;
begin
  S := AdapterRequestParamsAsStrings(AActionRequest);
  try
    ExecuteActionRequestParamStrings(S);
  finally
    S.Free;
  end;
end;

procedure TSvrInfoAction.ExecuteActionRequestParamStrings(
  const AStrings: TStrings);
begin
  Assert(False); // Descendent must implement
end;

{ TSvrInfoSortByProgIDAction }

function TSvrInfoSortByProgIDAction.GetDefaultActionName: string;
begin
  Result := sSortProgIDAction;
end;

procedure SaveSortOrder(S: TSvrInfoSortOrder);
begin
  with WebContext.Response.Cookies.Add do
  begin
    Name := sSortOrderCookie;
    Path := WebContext.Response.HTTPRequest.InternalScriptName;
    Value := SvrInfoSortOrderNames[S];
  end;
end;

procedure TSvrInfoSortByProgIDAction.ExecuteActionRequestParamStrings(
  const AStrings: TStrings);
begin
  Adapter.List.SortOrder := soProgID;
  SaveSortOrder(Adapter.List.FSortOrder);
end;

{ TSvrInfoSortByFilePathAction }

function TSvrInfoSortByFilePathAction.GetDefaultActionName: string;
begin
  Result := sSortFilePathAction;
end;

procedure TSvrInfoSortByFilePathAction.ExecuteActionRequestParamStrings(
  const AStrings: TStrings);
begin
  Adapter.List.SortOrder := soFilePath;
  SaveSortOrder(Adapter.List.FSortOrder);
end;

function TSvrInfoItem.FileName: string;
begin
  Result := ExtractFileName(FullFileName);
end;

function TSvrInfoItem.FilePath: string;
begin
  Result := ExtractFilePath(FullFileName);
end;

{ TSvrInfoMarkClsIDField }

function TSvrInfoMarkClsIDField.GetDefaultFieldName: string;
begin
  Result := sMarkClsID;
end;

{ TSvrInfoCleanMissingFilesAction }

function TSvrInfoCleanMissingFilesAction.GetDefaultActionName: string;
begin
  Result := sCleanMissingFilesAction;
end;

function TSvrInfoCleanMissingFilesAction.ImplWebEnabled: Boolean;
var
  I: Integer;
begin
  for I := 0 to Adapter.List.Count - 1 do
  begin
    if not Adapter.List[I].FileExists then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

procedure TSvrInfoCleanMissingFilesAction.ImplExecuteActionRequest(
  AActionRequest: IActionRequest; AActionResponse: IActionResponse);
var
  I: Integer;
begin
  for I := 0 to Adapter.List.Count - 1 do
  begin
    if not Adapter.List[I].FileExists then
      CleanClsID(StringToGuid(Adapter.List[I].ClsID));
  end;
end;

procedure TCustomSvrInfoAdapter.ImplNotifyDeactivate;
begin
  FList.Clear;
  FList.FSortOrder := soUnknown;
end;

function TCustomSvrInfoAdapter.GetList: TSvrInfoList;
var
  S: String;
  I: TSvrInfoSortOrder;
begin
  if FList.Count = 0 then
  begin
    if FList.SortOrder = soUnknown then
      if WebContext <> nil then
        if WebContext.Request <> nil then
        begin
          S := WebContext.Request.CookieFields.Values[sSortOrderCookie];
          for I := Low(TSvrInfoSortOrder) to High(TSvrInfoSortOrder) do
            if SvrInfoSortOrderNames[I] = S then
            begin
              FList.SortOrder := I;
              break;
            end;
        end;
    GetWebAppList(FList, '');
  end;
  Result := FList;
end;

initialization
finalization
  UnregisterWebComponents([TSvrInfoField, TSvrInfoClsIDField, TSvrInfoProgIDField,
    TSvrInfoFileNameField, TSvrInfoFilePathField, TSvrInfoFileExistsField, TSvrInfoURLPathField,
    TSvrInfoSortByProgIDAction, TSvrInfoSortByFilePathAction, TSvrInfoCleanMarkedAction,
    TSvrInfoCleanMissingFilesAction, TSvrInfoMarkClsIDField]);
end.
