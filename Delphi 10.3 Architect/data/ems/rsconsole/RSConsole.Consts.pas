{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.Consts;

interface

const
  EMS_WOW64_REGISTRY_KEY = 'Software\Wow6432Node\Embarcadero\EMS';
  EMS_REGISTRY_KEY = 'Software\Embarcadero\EMS';
  EMS_CONFIG_NAME = 'ConfigFile';
  EMS_STYLE_NAME = 'RSConsoleStyle';

  ROOT_ITEM = 0;
  USERS_ITEM = 1;
  GROUPS_ITEM = 2;
  INSTALLATIONS_ITEM = 3;
  MODULES_ITEM = 4;
  RESOURCES_ITEM = 5;
  PUSH_ITEM = 6;
  ENDPOINTS_ITEM = 7;

  // DeviceTypes
  striOS = 'ios';
  strAndroid = 'android';
  strWinrt = 'winrt';
  strWinPhone = 'winphone';
  strDonet = 'dotnet';

  cAdd = 'Add';
  cAddUsers = 'AddUsers';
  cAddGroups = 'AddGroups';
  cAddInstallations = 'AddInstallations';
  cTab = 'Tab';
  cAddTab = 'AddTab';

  strRSP = '.rsp';
  strEMSP = '.emsp';

resourcestring
  strRSFormTitle = 'RAD Server Connection Profile: ';
  strRestartStyle = 'Please restart the application for the new style.';
  strSettingsPath = 'RSConsole';

  // Styles
  strLightStyle = 'Light';
  strLightResName = 'LightStyle';
  strDarkStyle = 'Dark';
  strDarkResName = 'DarkStyle';

  strViews = 'Views';
  strUsers = 'Users';
  strGroups = 'Groups';
  strInstallations = 'Installations';
  strChannels = 'Channels';
  strEdgeModules = 'Modules';
  strAllEdgeModule = 'All Modules';
  strPush = 'Push';
  strResources = 'Resources';
  strEndpoints = 'Endpoints';

  strLoggedIn = 'Logged In';
  strLoggedOut = 'Logged Out';
  strToken = 'Device Token';
  strDevice = 'Device Type';

  strNewProfile = 'New Profile';

  // Add form
  strClearData = 'Clear data';
  strFieldName = 'Field Name';
  strFieldValue = 'Field Value';
  strGroupName = 'Group name';
  strModUsers = 'Modify user';
  strModGroup = 'Modify group';
  strModInstall = 'Modify installation';

  strAddChannels = 'Add channels';
  strAddChannel = 'Add channel';

  // Messages
  strGroup = 'Group';
  strUser = 'User';
  strInstallation = 'Installation';
  strEdgeModule = 'Module';
  strResource = 'Resource';

  strUserName = 'user name';

  strDeviceWithToken = 'Device with Token';
  strConnectionSucc = 'Successful connection';
  strLoginSucc = 'Successful login';
  strSaveProfileReg = 'Rename as';
  strTypeProfName = 'Please type a name for your profile';
  strFileExist = 'File already exists';
  strReplaceIt = 'Do you want to replace it?';
  strProfileFile = 'RAD Server Profile file';
  strUserNotloggedIn = 'was not logged in';
  strUserNotCreated = 'user was not created';
  strInstallationNotCreated = 'installation was not created';
  strNotUpdated = 'was not updated';
  strGroupNotCreated = 'group was not created';
  strNotAddedToGroup = ' was not added to group: ';
  strNotAddedToGroupP = ' were not added to group: ';
  strNotDeleted = ' was not deleted';
  strNotRemovedFromGroup = ' was not removed from ';
  strNotRemovedFromGroupP = ' were not removed from ';
  strFileNotFound = 'File not found';
  strDeviteTypeNeeded = 'A device type needs to be selected';
  strMessage = 'Please enter a message';
  strSendToChannel = 'Do you want to send a Push notification to the channel: ';
  strChannelUser = 'Please select a Channel or a User';

  strURLBlank = 'URL must not be blank. Please create a connection profile first.';
  strTargetNotJSON = 'Target is not JSON';
  strTargetNotJSONObject = 'Target is not a JSON object';
  strDataNotJSON = 'Data is not JSON';
  strDataNotJSONObject = 'Data is not a JSON object';
  strMessageQueued = ', Message: "%s", Queued: %d Android, %d IOS';
  strDeleteItem = 'You are about to delete item ';

  strSelectModule = 'Select a module from the Modules tab.';

  // Update
  strYes = 'Yes';
  strNo = 'No';

  // Help URL
  strURLtoHelp = '/en/RAD_Server_Management_Console_Application';

implementation

end.
