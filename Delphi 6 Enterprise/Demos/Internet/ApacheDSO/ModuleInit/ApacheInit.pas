{*****************************************************************************
 ApacheInit
  The Module Initialization handler is called during the module initialization
  phase immediatly after the server is started. This is where your modules will
  initialize data, consult configuration files, and do other prep work in the
  parent server before any children are forkedoff or threads spawned.

 About this demo.
  This demo will show how to assign the module initialization handler. It will
  Load an ini file and display this data when this module is used.
******************************************************************************}

unit ApacheInit;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, HTTPApp, ApacheApp, HTTPD,inifiles;
  
var
  //ApacheInit1: TApacheInit;
  ConfigFile: String;
  IBLocal_settings: TStringList;
  Interbase_Drivers: TStringList;
  IniFile: TIniFile;

implementation

procedure Apache_OnInit (server: Pserver_rec; pool: Ppool);
begin
  // OK, it's not an error but It's a good place to log this event
  // to show that this procedure is in fact being assigned.
   ap_log_error(server.error_fname , APLOG_EMERG, APLOG_ALERT, server,
                PChar('TWebModule1->Apache_OnInit'));

  // Load the InterbaseDrivers from the  dbxdrivers file......
  {$IFDEF MSWINDOWS}
  ConfigFile:= 'C:\Program Files\Common Files\Borland Shared\DBExpress\dbxdrivers.ini';
  {$ELSE IFDEF LINUX}
  ConfigFile:= '/usr/local/etc/dbxdrivers.conf';
  {$ENDIF}
  IniFile:=TInifile.Create(ConfigFile);
  Interbase_Drivers:= TStringLIst.Create;
  Inifile.ReadSectionValues('INTERBASE',Interbase_Drivers);

  // Load the IBLocal Settings from the dbxconnections file
  {$IFDEF MSWINDOWS}
  ConfigFile:= 'C:\Program Files\Common Files\Borland Shared\DBExpress\dbxconnections.ini';
  {$ELSE IFDEF LINUX}
  ConfigFile:= '/usr/local/etc/dbxconnections.conf';
  {$ENDIF}
  IniFile:=TInifile.Create(ConfigFile);
  IBLocal_Settings:= TStringLIst.Create;
  Inifile.ReadSectionValues('IBLocal',IBLocal_Settings);

  // done
  IniFile.Free;
end;

initialization
    // make the assignments here
    ApacheOnInit :=Apache_OnInit;
    // Other available Handlers.......
    //ApacheOnChildInit
    //ApacheOnChildExit
    //ApacheOnCreateDirConfig
    //ApacheOnMergeDirConfig
    //ApacheOnCreateServerConfig
    //ApacheOnMergeServerConfig
    //ApacheOnLogger
    //ApacheOnFixerUpper
    //ApacheOnTypeChecker
    //ApacheOnAuthChecker
    //ApacheOnCheckUserId
    //ApacheOnHeaderParser
    //ApacheOnAccessChecker
    //ApacheOnPostReadRequest
    //ApacheOnTranslateHandler
end.// end Unit
