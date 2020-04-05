{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit RSConfig.Consts;

interface

const
  strRedirectItem = 'RedirectItem';
  strPublicPathsItem = 'PublicPathsItem';
  strAuthorizationItem = 'AuthorizationItem';
  strPackagesItem = 'PackagesItem';

  strData = 'Data';
  strServerLimits = 'Server.Limits';
  strServerKeys = 'Server.Keys';
  strServerConnectionDev = 'Server.Connection.Dev';
  strServerAPICrossDomain = 'Server.APICrossDomain';
  strServerThreadsDev = 'Server.Threads.Dev';
  strServerEdgeHTTP = 'Server.EdgeHTTP';
  strServerTenants = 'Server.Tenants';
  strServerRoots = 'Server.Roots';

  strServerPushGCM = 'Server.Push.GCM';
  strServerPushAPNS = 'Server.Push.APNS';

  strServerPublicPaths = 'Server.PublicPaths';
  strServerRedirect = 'Server.Redirect';
  strServerAuthorization = 'Server.Authorization';
  strServerPackages = 'Server.Packages';

resourcestring
  strAddGroups = 'Add Groups';
  strGroupPrompt = 'Group';

  strAddUsers = 'Add Users';
  strUserPrompt = 'User';

  strResModuleFiles = 'Resource Module Files';

  strAreYouSureExit = 'Are you sure you want to cancel without saving?';
  strMimeInputQuery = 'Add MIME file type masks';
  strFileExtInputQuery = 'Add File Extension';
  strFileExtPrompt = 'Extension';
  strMimePrompt = 'MIME Mask';

  strSelectDirPrompt = 'Select Directory';

  strRSLogFileDesc = 'RAD Server Log Files';
  strKeyFileDesc = 'Key Files';
  strRootCertFileDesc = 'Root Certificate Files';
  strCertFileDesc = 'Certificate Files';

  strConfigMissing = 'The configuration file does not exist.';

  // Data
  strInstanceNameHelp = 'InterBase connection parameters';
  strSEPasswordHelp = 'SEPassword connects to an encrypted database';
  strPooledHelp = 'Set Pooled=0 to disable connection pooled, Pooled=1 to enable. Default value is 1.';
  strPooledMax = 'Set PooledMax=10 to limit maximum pooled connection.  Default value is 50.';

  // Server
  strMaxConnectionsHelp = 'Set MaxConnections=10 to limit maximum concurrent HTTP requests.  Default is 32.';
  strMaxUsersHelp = 'Set MaxUsers=3 to limit the number of users in the EMS database.  This value is only used when less than the maximum users permitted by the EMS runtime license.';
  strMasterSecretHelp = 'MasterSecret may be blank.  If blank then the EMS server will not support';
  strAppSecretHelp = 'AppSecret may be blank.  If AppSecret is not blank all requests must include the AppSecret.';
  strApplicationIDHelp = 'ApplicationID may be blank.  If ApplicationID is not blank, all requests must include the ApplicationID.';
  strHTTPSHelp = 'The following options enable HTTPS support. Set HTTPS=1 to enable HTTPS, HTTPS=0 to disable.';
  strRootCertFileHelp = 'When using a self-signed certificate, RootCertFile is left blank.';
  strCrossDomainHelp = 'Write here the domains allowed to call the API. Used for Cross-Domains Set CrossDomain=* to allow access to any domain.';
  strThreadPoolHelp = 'Set ThreadPool=1 to enable thread pool scheduler, ThreadPool=0 to disable.';
  strThreadPoolSizeHelp = 'ThreadPoolSize indicates how many threads are available to handle requests';
  strListenQueueHelp = 'ListenQueue indicates how many requests can be queued when all threads are busy';
  strKeepAliveHelp = 'Set KeepAlive=1 to enable HTTP connections to keep alive, KeepAlive=0 to disable.';
  strMultiTenantModeHelp = 'The MultiTenantMode option is used to turn on the Multi-Tenant mode. If the Multi-Tenant mode is turned on, then TenantId and TenantSecret is required to access EMS Server.';
  strDefaultTenantIdHelp = 'Default Tenant is used only in the Single Tenant mode.';
  strTenantIDCookieNameHelp = 'Define custom cookie name to store TenantId in EMS Console.';
  strResourcesHelp = 'Specifies the root path for resources';
  strServerLoggingAppendHelp = '';

  // Push Notifications
  strApiKeyHelp = 'These settings are needed to send push notificatons to an Android device';
  strApiURLHelp = 'Set send message REST API URL. Default value is https://fcm.googleapis.com/fcm/send';
  strCertificateFileNameHelp = 'Name of .p12 or .pem file';
  strCertificateFilePasswordHelp = 'Password of certificate file.  Leave blank if file does not have a password.';
  strProductionEnvironmentHelp = 'Set ProductionEnvironment=1 when the certificate has been created for production. Set ProductionEnvironment=0 when the certificate has been created for development. Default value is 0 (development).';

  // Lists
  strPackagesHelp = 'This section is for extension packages.  Extension packages are used to register custom resource endpoints';
  strRedirectsHelp = 'This section is for setting resource redirects.  Redirects cause custom resources to handle a client request, rather than the ' +
    'resource identified in the request URL.  A redirect may apply to all endpoints in a resource, or to a particular endpoint.  ' +
    'The destination resource must have an endpoint that handles the HTTP method (e.g.; GET, POST, PUT, DELETE) and URL segments of the client request.  ' +
    'Endpoint names are not used to resolve the destination endpoint.';
  strPublicPathsHelp = 'This section is for directories that contain public files, such as .html. ' +
    'The "directory" value indicates the physical location of the static files. ' +
    'The optional "default" value indicates a file that will be dispatched by default when browsing to the root of the virtual directory. ' +
    'The optional "mimes" value is an array of MIME file type masks. And optional "extensions" ' +
    'value is an array of file extensions. Only these files will be accessible from this directory. ' +
    'The optional "charset" value specifies default charset for the files in the directory.';
  strAuthorizationHelp = 'This section is for setting authorization requirements for resources and endpoints. ' +
    'Authorization can be set on built-in resource (e.g.; Users) and on custom resources. ' +
    'Note that when MasterSecret authentication is used, these requirements are ignored. ' +
    'Resource settings apply to all endpoints in the resource. ' +
    'Endpoint settings override the settings for the resource. ' +
    'By default, all resource are public.';


implementation

end.
