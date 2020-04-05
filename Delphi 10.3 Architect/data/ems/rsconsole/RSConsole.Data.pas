{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.Data;

interface

uses
  System.Generics.Collections,
  System.Classes,
  System.JSON, REST.Types, REST.Backend.EMSAPI,
  RSConsole.ModuleBackend, RSConsole.Types,
  FMX.Grid, FMX.ListBox;

type
  TEMSConsoleData = class
  private
    FUsersInfo: TUsersInfoArray;
    FGroupsInfo: TGroupsInfoArray;
    FInstallationInfo: TInstallationInfoArray;
    FChannelsList: TStringList;
    FChannelsInfo: TChannelsInfoArray;
    function GetGroupsEMSAPI: TEMSClientAPI;
    function GetPushEMSAPI: TEMSClientAPI;
    function GetUsersEMSAPI: TEMSClientAPI;
  public
    constructor Create;
    destructor Destroy; override;
    // Users
    function AddUser(const AUserName, APassword: string;
      const ACustomFields: TStringGrid; out AUserID: string): Boolean;
    procedure GetUsers(Sender: TObject; const AJSON: TJSONArray);
    procedure GetUsersFields(Sender: TObject; const AJSON: TJSONArray);
    function GetUsersFieldsArray: TArray<string>;
    function GetUserGroups(const AID: string): TArray<string>;
    function DeleteUser(const AUserID: string): Boolean;
    function UpdateUser(const AUserID: string;
      AJSONObject: TJSONObject): Boolean;
    function GetUserNames: TArray<string>;
    // Groups
    function AddGroup(const AGroupName: string;
      const ACustomFields: TStringGrid): Boolean;
    procedure GetGroup(Sender: TObject; const AName: string;
      const AJSON: TJSONArray);
    procedure GetGroups(Sender: TObject; const AJSON: TJSONArray);
    procedure GetGroupsFields(Sender: TObject; const AJSON: TJSONArray);
    function GetGroupsFieldsArray: TArray<string>;
    function DeleteGroup(const AGroupName: string): Boolean;
    function UpdateGroup(const AGroupName: string;
      AJSONObject: TJSONObject): Boolean;
    function GetGroupsNames: TArray<string>;
    procedure AddUserToGroups(const AUserID: string; AGroups: TArray<string>);
    procedure AddUsersToGroup(const AUserNames: TArray<string>; AGroup: string);
    procedure RemoveUsersFromGroup(const AUserNames: TArray<string>;
      AGroup: string);
    procedure RemoveUserFromGroups(const AUserID: string;
      AGroup: TArray<string>);
    // Installations
    function AddInstallation(const ADeviceToken: string;
      const AProperties: TJSONObject; AChannels: array of string): TJSONObject;
    procedure GetInstallations(Sender: TObject; const AJSON: TJSONArray);
    procedure GetInstallationsFields(Sender: TObject; const AJSON: TJSONArray);
    function GetInstallationsFieldsArray: TArray<string>;
    function UpdateInstallation(const AID: string;
      AJSONObject: TJSONObject): Boolean;
    function DeleteInstallation(const AID: string): Boolean;
    procedure GetInstallation(AID: string; const AJSON: TJSONArray);
    function AddInstallationData(const ADevice, AToken: string;
      const ACustomFields: TStringGrid; LChannelsListBox: TListBox;
      out AInstallationID: string): Boolean;
    // Channels
    function GetChannelsNames: TArray<string>;
    property UsersInfo: TUsersInfoArray read FUsersInfo;
    property GroupsInfo: TGroupsInfoArray read FGroupsInfo;
    property InstallationInfo: TInstallationInfoArray read FInstallationInfo;
    property ChannelsInfo: TChannelsInfoArray read FChannelsInfo;
    // EdgeModules
    // function AddEdgeModule(const AModuleName, APassword: string; const ACustomFields: TStringGrid; out AModuleID: string): Boolean;
    procedure GetEdgeModules(Sender: TObject; const AJSON: TJSONArray);
    procedure GetEdgeModulesFields(Sender: TObject; const AJSON: TJSONArray);
    function GetEdgeModulesFieldsArray: TArray<string>;
    function DeleteEdgeModule(const AModuleID: string): Boolean;
    function UpdateEdgeModule(const AModuleID, AModuleName, AProtocol,
      AProtocolProps: string; AJSONObject: TJSONObject): Boolean;
    // Resources
    // function AddResource(const AResourceName, APassword: string; const ACustomFields: TStringGrid; out AResourceID: string): Boolean;
    procedure GetResource(Sender: TObject; const AResourceName: string;
      const AJSON: TJSONArray);
    procedure GetResourcesFields(Sender: TObject; const AJSON: TJSONArray);
    function GetResourcesFieldsArray: TArray<string>;
    function DeleteResource(const AModuleID, AResourceName: string): Boolean;
    function UpdateResource(const AModuleID, AResourceName: string;
      AJSONObject: TJSONObject): Boolean;
    property GroupsEMSAPI: TEMSClientAPI read GetGroupsEMSAPI;
    property PushEMSAPI: TEMSClientAPI read GetPushEMSAPI;
    property UsersEMSAPI: TEMSClientAPI read GetUsersEMSAPI;
  end;

implementation

uses
  REST.Backend.EMSProvider, FMX.Dialogs,
  RSConsole.Consts, System.UITypes, System.SysUtils;

{ TEMSConsoleData }


function TEMSConsoleData.GetPushEMSAPI: TEMSClientAPI;
begin
  Result := (BackendDM.BackendPush1.ProviderService as IGetEMSApi).EMSAPI;
end;

function TEMSConsoleData.GetGroupsEMSAPI: TEMSClientAPI;
begin
  Result := (BackendDM.BackendGroups1.ProviderService as IGetEMSApi).EMSAPI;
end;

function TEMSConsoleData.GetUsersEMSAPI: TEMSClientAPI;
begin
  Result := (BackendDM.BackendUsers1.ProviderService as IGetEMSApi).EMSAPI;
end;

function TEMSConsoleData.AddGroup(const AGroupName: string;
  const ACustomFields: TStringGrid): Boolean;
var
  LGroupsFieldsJSON: TJSONObject;
  I: Integer;
  AGroup: TEMSClientAPI.TGroup;
begin
  Result := False;
  LGroupsFieldsJSON := TJSONObject.Create;
  try
    for I := 0 to ACustomFields.RowCount - 1 do
      if (ACustomFields.Cells[0, I] <> '') and (ACustomFields.Cells[1, I] <> '')
      then
        LGroupsFieldsJSON.AddPair(ACustomFields.Cells[0, I],
          ACustomFields.Cells[1, I]);

    GroupsEMSAPI.CreateGroup(AGroupName, LGroupsFieldsJSON, AGroup);

    if AGroup.GroupName <> '' then
    begin
      ShowMessage(strGroupName + ': ' + AGroupName);
      Result := True;
    end
    else
      MessageDlg(strGroupName + ': ' + AGroupName + ' ' + strGroupNotCreated,
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  finally
    LGroupsFieldsJSON.Free;
  end;
end;

function TEMSConsoleData.AddInstallation(const ADeviceToken: string;
  const AProperties: TJSONObject; AChannels: array of string): TJSONObject;
var
  LJSONInstallationObject: TJSONObject;
begin
  LJSONInstallationObject := TJSONObject.Create;
  try
    LJSONInstallationObject := nil;
    if ADeviceToken = 'ios' then
      LJSONInstallationObject := PushEMSAPI.CreateIOSInstallationObject(ADeviceToken, AProperties,
        AChannels)
    else if ADeviceToken = 'android' then
      LJSONInstallationObject := PushEMSAPI.CreateAndroidInstallationObject(ADeviceToken, AProperties,
        AChannels);

    BackendDM.BackendEndpoint1.Body.Add(LJSONInstallationObject);
    BackendDM.BackendEndpoint1.Method := TRESTRequestMethod.rmPOST;
    BackendDM.BackendEndpoint1.Resource := TManagerEndPoints.cInstallationsEndPoint;
    BackendDM.BackendEndpoint1.ResourceSuffix := '';
    BackendDM.BackendEndpoint1.Execute;
    Result := BackendDM.BackendEndpoint1.Response.JSONValue as TJSONObject;
  finally
    LJSONInstallationObject.Free;
  end;
end;


function TEMSConsoleData.AddInstallationData(const ADevice, AToken: string;
  const ACustomFields: TStringGrid; LChannelsListBox: TListBox;
  out AInstallationID: string): Boolean;
var
  LJSON, LResponse: TJSONObject;
  I: Integer;
  LChannels: TArray<string>;
begin
  Result := False;
  LJSON := TJSONObject.Create;
  try
    LJSON.AddPair(TInstallationInfo.cDeviceToken, AToken);
    LJSON.AddPair(TInstallationInfo.cDeviceType, ADevice);
    for I := 0 to ACustomFields.RowCount - 1 do
      if (ACustomFields.Cells[0, I] <> '') and (ACustomFields.Cells[1, I] <> '') then
        LJSON.AddPair(ACustomFields.Cells[0, I], ACustomFields.Cells[1, I]);
    SetLength(LChannels, LChannelsListBox.Count);
    for I := 0 to LChannelsListBox.Count - 1 do
      LChannels[I] := LChannelsListBox.Items[I];

    LResponse := AddInstallation(ADevice, LJSON, LChannels);

    if LResponse <> nil then
    begin
      ShowMessage(strDeviceWithToken + ': ' + AToken + #10#13 + ' ID: ' +
        LResponse.values[TInstallationInfo.cID].value);
      AInstallationID := LResponse.values[TInstallationInfo.cID].value;
      Result := True;
    end
    else
      MessageDlg(strDeviceWithToken + ': ' + AToken + ' ' +
        strInstallationNotCreated, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  finally
    LJSON.Free;
  end;
end;

function TEMSConsoleData.AddUser(const AUserName, APassword: string;
  const ACustomFields: TStringGrid; out AUserID: string): Boolean;
var
  AUser: TEMSClientAPI.TUser;
  AUserFields: TJSONObject;
  I: Integer;
begin
  Result := False;
  AUserFields := TJSONObject.Create;
  try
    for I := 0 to ACustomFields.RowCount - 1 do
      if (ACustomFields.Cells[0, I] <> '') and (ACustomFields.Cells[1, I] <> '') then
        AUserFields.AddPair(ACustomFields.Cells[0, I], ACustomFields.Cells[1, I]);

    UsersEMSAPI.AddUser(AUserName, APassword, AUserFields, AUser);

    if AUser.UserID <> '' then
    begin
      ShowMessage(strUserName + ': ' + AUserName + #10#13 + ' ID: ' +
        AUser.UserID);
      AUserID := AUser.UserID;
      Result := True;
    end
    else
      MessageDlg(strUserName + ': ' + AUserName + ' ' + strUserNotCreated,
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  finally
    AUserFields.Free;
  end;
end;

constructor TEMSConsoleData.Create;
begin
  FChannelsList := TStringList.Create;
end;

destructor TEMSConsoleData.Destroy;
var
  I: Integer;
begin
  for I := Low(FUsersInfo) to High(FUsersInfo) do
    FUsersInfo[I].Groups.Free;
  for I := Low(FGroupsInfo) to High(FGroupsInfo) do
    FGroupsInfo[I].Users.Free;
  FChannelsList.Free;
  inherited;
end;

procedure TEMSConsoleData.GetInstallation(AID: string; const AJSON: TJSONArray);
var
  LFoundInstallation: TEMSClientAPI.TInstallation;
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    PushEMSAPI.RetrieveInstallation(AID, LFoundInstallation, AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetInstallations(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    PushEMSAPI.QueryInstallations([], AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetInstallationsFields(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    PushEMSAPI.RetrieveInstallationsFields(AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

function TEMSConsoleData.GetInstallationsFieldsArray: TArray<string>;
var
  LJSON: TJSONArray;
  LValue: TJSONValue;
begin
  LJSON := TJSONArray.Create;
  try
    PushEMSAPI.RetrieveInstallationsFields(LJSON);
    for LValue in LJSON do
      if LValue.GetValue<Boolean>('custom', False) then
        Result := Result + [LValue.GetValue<string>('name')];
  finally
    LJSON.Free;
  end;
end;

procedure TEMSConsoleData.GetResource(Sender: TObject;
  const AResourceName: string; const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.QueryModuleResources(AResourceName, [], AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetResourcesFields(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.RetrieveModuleResourcesFields(AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

function TEMSConsoleData.GetResourcesFieldsArray: TArray<string>;
var
  LJSON: TJSONArray;
  LValue: TJSONValue;
begin
  LJSON := TJSONArray.Create;
  try
    GroupsEMSAPI.RetrieveModuleResourcesFields(LJSON);
    for LValue in LJSON do
      if LValue.GetValue<Boolean>('custom', False) then
        Result := Result + [LValue.GetValue<string>('name')];
  finally
    LJSON.Free;
  end;
end;

procedure TEMSConsoleData.GetUsers(Sender: TObject; const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.QueryUsers([], AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetUsersFields(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.RetrieveUsersFields(AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

function TEMSConsoleData.GetUsersFieldsArray: TArray<string>;
var
  LJSON: TJSONArray;
  LValue: TJSONValue;
begin
  LJSON := TJSONArray.Create;
  try
    UsersEMSAPI.RetrieveUsersFields(LJSON);
    for LValue in LJSON do
      if LValue.GetValue<Boolean>('custom', False) then
        Result := Result + [LValue.GetValue<string>('name')];
  finally
    LJSON.Free;
  end;
end;

procedure TEMSConsoleData.RemoveUserFromGroups(const AUserID: string;
  AGroup: TArray<string>);
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
  I: Integer;
  LUserArray: TArray<string>;
begin
  SetLength(LUserArray, 1);
  LUserArray[0] := AUserID;
  for I := 0 to Length(AGroup) - 1 do
  begin
    GroupsEMSAPI.RemoveUsersFromGroup(AGroup[I], LUserArray, LUpdatedAt);
    if LUpdatedAt.UpdatedAt = 0 then
      MessageDlg(strUser + strNotRemovedFromGroup + AGroup[I],
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TEMSConsoleData.RemoveUsersFromGroup(const AUserNames: TArray<string>;
  AGroup: string);
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
  LUser: TEMSClientAPI.TUser;
  I: Integer;
  LUserList: TList<string>;
begin
  LUserList := TList<string>.Create;
  try
    for I := 0 to Length(AUserNames) - 1 do
    begin
      UsersEMSAPI.QueryUserName(AUserNames[I], LUser, nil);
      if LUser.UserID <> '' then
        LUserList.Add(LUser.UserID);
    end;
    GroupsEMSAPI.RemoveUsersFromGroup(AGroup, LUserList.ToArray, LUpdatedAt);
    if LUpdatedAt.UpdatedAt = 0 then
      MessageDlg(strUsers + strNotRemovedFromGroupP + AGroup,
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  finally
    LUserList.Free;
  end;
end;

function TEMSConsoleData.GetChannelsNames: TArray<string>;
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    Result := PushEMSAPI.RetrieveInstallationsChannelNames
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetEdgeModules(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.QueryModules([], AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetEdgeModulesFields(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    UsersEMSAPI.RetrieveModulesFields(AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

function TEMSConsoleData.GetEdgeModulesFieldsArray: TArray<string>;
var
  LJSON: TJSONArray;
  LValue: TJSONValue;
begin
  LJSON := TJSONArray.Create;
  try
    GroupsEMSAPI.RetrieveModulesFields(LJSON);
    for LValue in LJSON do
      if LValue.GetValue<Boolean>('custom', False) then
        Result := Result + [LValue.GetValue<string>('name')];
  finally
    LJSON.Free;
  end;
end;

procedure TEMSConsoleData.GetGroup(Sender: TObject; const AName: string;
  const AJSON: TJSONArray);
var
  LFoundGroup: TEMSClientAPI.TGroup;
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    GroupsEMSAPI.RetrieveGroup(AName, LFoundGroup, AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetGroups(Sender: TObject; const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    GroupsEMSAPI.QueryGroups([], AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TEMSConsoleData.GetGroupsFields(Sender: TObject;
  const AJSON: TJSONArray);
begin
  if BackendDM.EMSProvider.baseURL <> '' then
    GroupsEMSAPI.RetrieveGroupsFields(AJSON)
  else
    raise Exception.Create(strURLBlank);
end;

function TEMSConsoleData.GetGroupsFieldsArray: TArray<string>;
var
  LJSON: TJSONArray;
  LValue: TJSONValue;
begin
  LJSON := TJSONArray.Create;
  try
    GroupsEMSAPI.RetrieveGroupsFields(LJSON);
    for LValue in LJSON do
      if LValue.GetValue<Boolean>('custom', False) then
        Result := Result + [LValue.GetValue<string>('name')];
  finally
    LJSON.Free;
  end;
end;

function TEMSConsoleData.GetUserGroups(const AID: string): TArray<string>;
begin
  Result := UsersEMSAPI.RetrieveUserGroups(AID);
end;

function TEMSConsoleData.GetUserNames: TArray<string>;
begin
  Result := UsersEMSAPI.RetrieveUsersNames;
end;

function TEMSConsoleData.GetGroupsNames: TArray<string>;
begin
  Result := GroupsEMSAPI.RetrieveGroupsNames;
end;

procedure TEMSConsoleData.AddUserToGroups(const AUserID: string;
  AGroups: TArray<string>);
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
  I: Integer;
begin
  for I := 0 to Length(AGroups) - 1 do
  begin
    GroupsEMSAPI.AddUsersToGroup(AGroups[I], [AUserID], LUpdatedAt);
    if LUpdatedAt.UpdatedAt = 0 then
      MessageDlg(TUserInfo.cID + ': ' + AUserID + strNotAddedToGroup +
        AGroups[I], TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TEMSConsoleData.AddUsersToGroup(const AUserNames: TArray<string>;
  AGroup: string);
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
  LUser: TEMSClientAPI.TUser;
  I: Integer;
  LUserList: TList<string>;
begin
  LUserList := TList<string>.Create;
  try
    for I := 0 to Length(AUserNames) - 1 do
    begin
      UsersEMSAPI.QueryUserName(AUserNames[I], LUser, nil);
      if LUser.UserID <> '' then
        LUserList.Add(LUser.UserID);
    end;
    GroupsEMSAPI.AddUsersToGroup(AGroup, LUserList.ToArray, LUpdatedAt);
    if LUpdatedAt.UpdatedAt = 0 then
      MessageDlg(strUsers + strNotAddedToGroupP + AGroup, TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);
  finally
    LUserList.Free;
  end;
end;

function TEMSConsoleData.DeleteEdgeModule(const AModuleID: string): Boolean;
begin
  Result := PushEMSAPI.UnregisterModule(AModuleID);
  if not Result then
    MessageDlg(strEdgeModule + ': ' + AModuleID + strNotDeleted,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
end;

function TEMSConsoleData.DeleteGroup(const AGroupName: string): Boolean;
begin
  Result := PushEMSAPI.DeleteGroup(AGroupName);
  if not Result then
    MessageDlg(strGroup + ': ' + AGroupName + strNotDeleted,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
end;

function TEMSConsoleData.DeleteInstallation(const AID: string): Boolean;
begin
  Result := PushEMSAPI.DeleteInstallation(AID);
  if not Result then
    MessageDlg(strInstallation + ': ' + AID + strNotDeleted,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
end;

function TEMSConsoleData.DeleteResource(const AModuleID, AResourceName
  : string): Boolean;
begin
  Result := PushEMSAPI.UnregisterModuleResource(AModuleID, AResourceName);
  if not Result then
    MessageDlg(strResource + ': ' + AResourceName + strNotDeleted,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
end;

function TEMSConsoleData.DeleteUser(const AUserID: string): Boolean;
begin
  Result := UsersEMSAPI.DeleteUser(AUserID);
  if not Result then
    MessageDlg(strUser + ': ' + AUserID + strNotDeleted, TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbOK], 0);
end;

function TEMSConsoleData.UpdateEdgeModule(const AModuleID, AModuleName,
  AProtocol, AProtocolProps: string; AJSONObject: TJSONObject): Boolean;
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
begin
  Result := True;
  UsersEMSAPI.UpdateModule(AModuleID, AModuleName, AProtocol, AProtocolProps,
    AJSONObject, nil, LUpdatedAt);
  if LUpdatedAt.UpdatedAt = 0 then
  begin
    MessageDlg(TEdgeModuleInfo.cID + ': ' + AModuleID + ' ' + strNotUpdated,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end;
end;

function TEMSConsoleData.UpdateGroup(const AGroupName: string;
  AJSONObject: TJSONObject): Boolean;
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
begin
  Result := True;
  GroupsEMSAPI.UpdateGroup(AGroupName, AJSONObject, LUpdatedAt);
  if LUpdatedAt.UpdatedAt = 0 then
  begin
    MessageDlg(TGroupInfo.cGroupName + ': ' + AGroupName + ' ' + strNotUpdated,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end;
end;

function TEMSConsoleData.UpdateInstallation(const AID: string;
  AJSONObject: TJSONObject): Boolean;
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
begin
  Result := True;
  PushEMSAPI.UpdateInstallation(AID, AJSONObject, LUpdatedAt);
  if LUpdatedAt.UpdatedAt = 0 then
  begin
    MessageDlg(TInstallationInfo.cID + ': ' + AID + ' ' + strNotUpdated,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end
end;

function TEMSConsoleData.UpdateResource(const AModuleID, AResourceName: string;
  AJSONObject: TJSONObject): Boolean;
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
begin
  Result := True;
  UsersEMSAPI.UpdateModuleResource(AModuleID, AResourceName, AJSONObject,
    LUpdatedAt);
  if LUpdatedAt.UpdatedAt = 0 then
  begin
    MessageDlg(TResourcesInfo.cID + ': ' + AResourceName + ' ' + strNotUpdated,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end;
end;

function TEMSConsoleData.UpdateUser(const AUserID: string;
  AJSONObject: TJSONObject): Boolean;
var
  LUpdatedAt: TEMSClientAPI.TUpdatedAt;
begin
  Result := True;
  UsersEMSAPI.UpdateUser(AUserID, AJSONObject, LUpdatedAt);
  if LUpdatedAt.UpdatedAt = 0 then
  begin
    MessageDlg(TUserInfo.cID + ': ' + AUserID + ' ' + strNotUpdated,
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end;
end;

end.
