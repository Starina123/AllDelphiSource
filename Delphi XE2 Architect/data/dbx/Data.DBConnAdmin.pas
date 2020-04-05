{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBConnAdmin;

interface

uses
  System.Classes,
  System.IniFiles
;

type

{ IConnectionAdmin }

  IConnectionAdmin = interface
    function GetDriverNames(List: TStrings): Integer;
    function GetDelegateDriverNames(List: TStrings): Integer;
    function GetDriverParams(const DriverName: string; Params: TStrings): Integer;
    procedure GetDriverLibNames(const DriverName: string;
      var LibraryName, VendorLibrary: string);
    function GetConnectionNames(List: TStrings;DriverName: string): Integer;
    function GetConnectionParams(const ConnectionName: string; Params: TStrings): Integer;
    procedure AddConnection(const ConnectionName, DriverName: string);
    procedure DeleteConnection(const ConnectionName: string);
    procedure ModifyConnection(const ConnectionName: string; Params: TStrings);
    procedure RenameConnection(const OldName, NewName: string);
  end;

{ TConnectionAdmin }

  TConnectionAdmin = class(TInterfacedObject, IConnectionAdmin)
  private
    FConnectionConfig: TCustomIniFile;
  protected
    { IConnectionAdmin }
    function GetDriverNames(List: TStrings): Integer;
    function GetDelegateDriverNames(List: TStrings): Integer;
    function GetDriverParams(const DriverName: string; Params: TStrings): Integer;
    procedure GetDriverLibNames(const DriverName: string;
      var LibraryName, VendorLibrary: string);
    function GetConnectionNames(List: TStrings; DriverName: string): Integer;
    function GetConnectionParams(const ConnectionName: string; Params: TStrings): Integer;
    procedure AddConnection(const ConnectionName, DriverName: string);
    procedure DeleteConnection(const ConnectionName: string);
    procedure ModifyConnection(const ConnectionName: string; Params: TStrings);
    procedure RenameConnection(const OldName, NewName: string);
  public
    constructor Create;
    destructor Destroy; override;
    property ConnectionConfig: TCustomIniFile read FConnectionConfig;
  end;


function GetConnectionAdmin: IConnectionAdmin;

implementation

uses
  System.SysUtils,
  Data.SqlConst,
  Data.SqlExpr,
  Data.DB,
  Data.DBXCommon
;

{ Global Functions }

function GetConnectionAdmin: IConnectionAdmin;
begin
  Result := IConnectionAdmin(TConnectionAdmin.Create);
end;

function FormatLine(const Key, Value: string): string;
begin
  Result := Format('%s=%s', [Key, Value]);
end;

function GetValue(const Line: string): string;
var
  ValPos: Integer;
begin
  ValPos := Pos('=', Line);
  if ValPos > 0 then
    Result := Copy(Line, ValPos+1, MAXINT) else
    Result := '';
end;

procedure WriteSectionValues(IniFile: TCustomIniFile; const Section: string; Strings: TStrings);
var
  I: Integer;
begin
  with IniFile do
  begin
    EraseSection(Section);
    for I := 0 to Strings.Count - 1 do
      WriteString(Section, Strings.Names[I], GetValue(Strings[I]));
    UpdateFile;
  end;
end;

{ TConnectionAdmin }

constructor TConnectionAdmin.Create;
var
  sConfigFile:String;
begin
  inherited Create;
  sConfigFile := GetConnectionRegistryFile(True);
  if not FileExists(sConfigFile) then
    DatabaseErrorFmt(SMissingDriverRegFile,[sConfigFile]);
  FConnectionConfig := TMemIniFile.Create(sConfigFile);
  try
    TMemIniFile(FConnectionConfig).Encoding := TEncoding.UTF8;
  except
    FConnectionConfig.Free;
    raise;
  end;
end;

destructor TConnectionAdmin.Destroy;
begin
  inherited;
  FConnectionConfig.Free;
end;

procedure TConnectionAdmin.AddConnection(const ConnectionName,
  DriverName: string);
var
  Params: TStrings;
  DriverIndex: Integer;
begin
  Params := TStringList.Create;
  try
    GetDriverParams(DriverName, Params);
    Params.Insert(0, FormatLine(DRIVERNAME_KEY, DriverName));
    DriverIndex := Params.IndexOfName(GETDRIVERFUNC_KEY);
    if DriverIndex <> -1 then
      Params.Delete(DriverIndex);
    WriteSectionValues(ConnectionConfig, ConnectionName, Params);
  finally
    Params.Free
  end;
end;

procedure TConnectionAdmin.DeleteConnection(const ConnectionName: string);
begin
  ConnectionConfig.EraseSection(ConnectionName);
end;

function TConnectionAdmin.GetConnectionNames(List: TStrings;
  DriverName: string): Integer;
var
  I: Integer;
  A: TStringList;
begin
  A := TStringList.Create;
  try
    ConnectionConfig.ReadSections(A);
    List.Assign(A);
  finally
    A.Free;
  end;
  if DriverName <> '' then
  begin
    List.BeginUpdate;
    try
      I := List.Count - 1;
      while I >= 0 do
      begin
        if AnsiCompareText(ConnectionConfig.ReadString(List[i], DRIVERNAME_KEY, ''),
           DriverName) <> 0 then List.Delete(I);
        Dec(I);
      end;
    finally
      List.EndUpdate;
    end;
  end;
  Result := List.Count;
end;

function TConnectionAdmin.GetConnectionParams(const ConnectionName: string;
  Params: TStrings): Integer;
var
  A: TStringList;
begin
  A := TStringList.Create;
  try
    ConnectionConfig.ReadSectionValues(ConnectionName, A);
    Params.Assign(A);
  finally
    A.Free;
  end;
  Result := Params.Count;
end;

function TConnectionAdmin.GetDriverNames(List: TStrings): Integer;
var
  I: Integer;
  Factory: TDBXConnectionFactory;
begin
  Factory := TDBXConnectionFactory.GetConnectionFactory;
  Factory.GetDriverNames(List);
  for I := List.Count - 1 downto 0  do
  begin
    if Factory.GetDriverProperties(List[I]).GetBoolean(TDBXPropertyNames.DelegateDriver) then
      List.Delete(I);
  end;
  Result := List.Count;
end;

function TConnectionAdmin.GetDelegateDriverNames(List: TStrings): Integer;
var
  I: Integer;
  Factory: TDBXConnectionFactory;
begin
  Factory := TDBXConnectionFactory.GetConnectionFactory;
  Factory.GetDriverNames(List);
  for I := List.Count - 1 downto 0  do
  begin
    if not Factory.GetDriverProperties(List[I]).GetBoolean(TDBXPropertyNames.DelegateDriver) then
      List.Delete(I);
  end;
  Result := List.Count;
end;

function TConnectionAdmin.GetDriverParams(const DriverName: string; Params: TStrings): Integer;
var
  Factory: TDBXConnectionFactory;
begin
  Factory := TDBXConnectionFactory.GetConnectionFactory;
  Params.Clear;
  Params.AddStrings(Factory.GetDriverProperties(DriverName).Properties);
  Result := Params.Count;
end;

procedure TConnectionAdmin.GetDriverLibNames(const DriverName: string;
  var LibraryName, VendorLibrary: string);
var
  Factory: TDBXConnectionFactory;
  DriverProps: TDBXProperties;
begin
  Factory := TDBXConnectionFactory.GetConnectionFactory;
  DriverProps := Factory.GetDriverProperties(DriverName);

  LibraryName := DriverProps[TDBXPropertyNames.LibraryName];
  VendorLibrary := DriverProps[TDBXPropertyNames.VendorLib];
end;

procedure TConnectionAdmin.ModifyConnection(const ConnectionName: string;
  Params: TStrings);
begin
  WriteSectionValues(ConnectionConfig, ConnectionName, Params);
end;

procedure TConnectionAdmin.RenameConnection(const OldName, NewName: string);
var
  Params: TStrings;
begin
  Params := TStringList.Create;
  try
    GetConnectionParams(OldName, Params);
    ConnectionConfig.EraseSection(OldName);
    WriteSectionValues(ConnectionConfig, NewName, Params);
  finally
    Params.Free
  end;
end;

end.
