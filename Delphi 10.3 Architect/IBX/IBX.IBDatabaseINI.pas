{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Additional code created by Jeff Overcash and John Kaster }
{    used with permission.                                    }
{*************************************************************}

unit IBX.IBDatabaseINI;

interface

uses
  System.Classes, IBX.IBDatabase;

type

  TIniFilePathOpt = (ipoPathNone, ipoPathToServer, ipoPathRelative);

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBDatabaseINI = class(TComponent)
  private
    FDatabaseName: String;
    [weak] FDatabase: TIBDatabase;
    FPassword: String;
    FUsername: String;
    FFileName: String;
    FSQLRole: String;
    FAppPath: TIniFilePathOpt;
    FSection: String;
    FCharacterSet: String;
    procedure SetDatabaseName(const Value: String);
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetFileName(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetUsername(const Value: String);
    { Private declarations }
    function GetParam(Name: string): string;
    procedure AssignParam(Name, Value: string);
    procedure DeleteParam(Name: string);
    procedure SetSQLRole(const Value: String);
    procedure SetSection(const Value: String);
    procedure SetCharacterSet(const Value: String);
  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner : Tcomponent); override;
    procedure SaveToINI;
    procedure ReadFromINI;
    procedure WriteToDatabase(ADatabase : TIBDatabase); overload;
    procedure WriteToDatabase; overload;
    procedure ReadFromDatabase;
    function IniFileName : string;
  published
    { Published declarations }
    property Database : TIBDatabase read FDatabase write SetDatabase;
    property DatabaseName : String read FDatabaseName write SetDatabaseName;
    property Username : String read FUsername write SetUsername;
    property Password : String read FPassword write SetPassword;
    property SQLRole : String read FSQLRole write SetSQLRole;
    property CharacterSet : String read FCharacterSet write SetCharacterSet;
    property FileName : String read FFileName write SetFileName;
    property UseAppPath : TIniFilePathOpt read FAppPath write FAppPath;
    property Section : String read FSection write SetSection;
  end;

  function SlashPath( sPath : string ) : string;
  function LocalServerPath( sFile : string = '') : string;

implementation

uses
  {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF} System.SysUtils,
  System.IniFiles, IBX.IBXConst, System.IOUtils;

const
  {$IFDEF MSWINDOWS}
  NL = #13#10;   {do not localize}
  {$ELSE}
  NL = #10;        {do not localize}
  {$ENDIF}
  SWrapLine = '<br>' + NL;       {do not localize}

  SIniDatabase = 'database'; {do not localize}
  SIniUserName = 'user_name'; {do not localize}
  SIniPassword = 'password';  {do not localize}
  SIniSQLRole = 'sql_role';  {do not localize}
  SIniCharacterSet = 'lc_ctype';  {do not localize}

function LocalServerPath(sFile: string): string;
var
  FN: array[0..MAX_PATH - 1] of char;
  sPath : String;
begin
  SetString(sPath, FN, GetModuleFileName(hInstance, FN, SizeOf(FN)));
  Result := ExtractFilePath( sPath ) + LowerCase( ExtractFileName( sFile ) );
end;

function SlashPath( sPath : string ) : string;
begin
  if ( sPath <> '' ) and ( sPath[ Length( sPath ) ] <> TPath.PathSeparator ) then
    sPath := sPath + TPath.PathSeparator;
  Result := sPath;
end;

{ TIBDatabaseINI }

procedure TIBDatabaseINI.AssignParam(Name, Value: string);
var
  i: Integer;
  found: boolean;
begin
  found := False;
  if FDatabase = nil then
    exit;
  if Trim(Value) <> '' then
  begin
    for i := 0 to FDatabase.Params.Count - 1 do
    begin
      if FDatabase.Params.Names[i].ToLower.StartsWith(Name.ToLower) then
      begin
        FDatabase.Params.Values[FDatabase.Params.Names[i]] := Value;
        found := True;
        break;
      end;
    end;
    if not found then
      FDatabase.Params.Add(Name + '=' + Value);
  end
  else
    DeleteParam(Name);
end;

procedure TIBDatabaseINI.WriteToDatabase(ADatabase: TIBDatabase);
begin
  if Assigned(ADatabase) then
  begin
    if FDatabaseName <> '' then
      ADatabase.DatabaseName := FDatabaseName;
    if FUserName <> '' then
      AssignParam(SIniUserName, FUserName);
    if FPassword <> '' then
      AssignParam(SIniPassword, FPassword);
    if FSQLRole <> '' then
      AssignParam(SIniSQLRole, FSQLRole);
    if FCharacterSet <> '' then
      AssignParam(SIniCharacterSet, FCharacterSet);
  end;
end;

procedure TIBDatabaseINI.DeleteParam(Name: string);
var
  i: Integer;
begin
  if FDatabase = nil then
    exit;
  for i := 0 to FDatabase.Params.Count - 1 do
  begin
    if FDatabase.Params.Names[i].ToLower.StartsWith(Name.ToLower) then
    begin
      FDatabase.Params.Delete(i);
      break;
    end;
  end;
end;

function TIBDatabaseINI.GetParam(Name: string): string;
var
  i: Integer;
begin
  Result := '';
  if FDatabase = nil then
    exit;
  for i := 0 to FDatabase.Params.Count - 1 do
  begin
    if FDatabase.Params.Names[i].ToLower.StartsWith(Name.ToLower) then
    begin
      Result := FDatabase.Params.Values[FDatabase.Params.Names[i]];
      break;
    end;
  end;
end;

procedure TIBDatabaseINI.Loaded;
begin
  inherited;
  ReadFromINI;
  if Assigned(FDatabase) and ( not ( csDesigning in ComponentState ) ) then
    WriteToDatabase(FDatabase);
end;

procedure TIBDatabaseINI.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent = FDatabase) and (Operation = opRemove) then
    FDatabase := nil;
end;

procedure TIBDatabaseINI.ReadFromDatabase;
begin
  if Assigned(FDatabase) then
  begin
    if FDatabase.DatabaseName <> '' then
      FDatabaseName := FDatabase.DatabaseName;
    if GetParam(SIniUserName) <> '' then
      FUserName := GetParam(SIniUserName);
    if GetParam(SIniPassword) <> '' then
      FPassword := GetParam(SIniPassword);
    if GetParam(SIniSQLRole) <> '' then
      FSQLRole := GetParam(SIniSQLRole);
    if GetParam(SIniCharacterSet) <> '' then
      FCharacterSet := GetParam(SIniCharacterSet);
  end;
end;

procedure TIBDatabaseINI.ReadFromINI;
var
  sININame : String;
  cInifile : TIniFile;
begin
  sININame := IniFileName;
  if sININame = '' then
    Exit;
  cInifile := TIniFile.Create(sININame);
  try
    {Do it to the setter so the IBDatabase will be updated if assigned }
    if cInifile.SectionExists(FSection) then
    begin
      FDatabaseName := cInifile.ReadString(FSection, SIniDatabase, '' );
      FUsername := cInifile.ReadString(FSection, SIniUserName, '' );
      FPassword := cInifile.ReadString(FSection, SIniPassword, '' );
      FSQLRole := cInifile.ReadString(FSection, SIniSQLRole, '' );
      FCharacterSet := cInifile.ReadString(FSection, SIniCharacterSet, '');
    end;
  finally
    cInifile.Free;
  end;
end;

procedure TIBDatabaseINI.SaveToINI;
var
  sININame : String;
  cInifile : TIniFile;
begin
  sININame := IniFileName;
  if sININame = '' then
    Exit;
  cInifile := TIniFile.Create(sININame);
  try
    cInifile.WriteString(FSection, SIniDatabase, FDatabaseName );
    cInifile.WriteString(FSection, SIniUserName, FUsername );
    cInifile.WriteString(FSection, SIniPassword, FPassword );
    cInifile.WriteString(FSection, SIniSQLRole, FSQLRole );
    cInifile.WriteString(FSection, SIniCharacterSet, FCharacterSet);
  finally
    cInifile.Free;
  end;
end;

procedure TIBDatabaseINI.SetDatabase(const Value: TIBDatabase);
begin
  if FDatabase <> Value then
    FDatabase := Value;
end;

procedure TIBDatabaseINI.SetDatabaseName(const Value: String);
begin
  if FDatabaseName <> Value then
    FDatabaseName := Value;
end;

procedure TIBDatabaseINI.SetFileName(const Value: String);
begin
  if FFileName <> Value then
  begin
    FFileName := Value;
    ReadFromINI;
  end;
end;

procedure TIBDatabaseINI.SetPassword(const Value: String);
begin
  if FPassword <> Value then
    FPassword := Value;
end;

procedure TIBDatabaseINI.SetSQLRole(const Value: String);
begin
  if FSQLRole <> Value then
    FSQLRole := Value;
end;

procedure TIBDatabaseINI.SetUsername(const Value: String);
begin
  if FUsername <> Value then
    FUsername := Value;
end;

procedure TIBDatabaseINI.WriteToDatabase;
begin
  WriteToDatabase(FDatabase);
end;

constructor TIBDatabaseINI.Create(AOwner: Tcomponent);
begin
  inherited;
  FSection := SIBDatabaseINISection;
  FAppPath := ipoPathToServer;
end;

procedure TIBDatabaseINI.SetSection(const Value: String);
begin
  if Value = '' then
    raise Exception.Create(SIBDatabaseINISectionEmpty);
  FSection := Value;
end;

function TIBDatabaseINI.IniFileName: string;
begin
  if FFileName = '' then
    Result := ''
  else
  begin
    if FAppPath = ipoPathToServer then
      Result := LocalServerPath(FFileName)
    else
      if FAppPath = ipoPathRelative then
        Result := SlashPath(LocalServerPath) + FFileName
      else
        Result := FFileName;
  end;
end;

procedure TIBDatabaseINI.SetCharacterSet(const Value: String);
begin
  if FCharacterSet <> Value then
    FCharacterSet := Value;
end;

end.
