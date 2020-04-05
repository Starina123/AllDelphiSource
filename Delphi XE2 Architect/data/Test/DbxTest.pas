{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

/// <summary> dunit database related extensions.
/// Supports the properties to be specified on the command line.
/// The "connection" command line property directs TDBXTestCase to
/// use the connection in your dbxconnections.ini as the default connection
/// returned by TDBXTestCase.DbxConnection.  This can also be used to
/// specify ado.net connection strings that have been persisted in the dbxconnections.ini
/// file.  ado.net connection strings require an additional section and two
/// property settings as follows:
///
///   [AdoIbLocal]
///   providerName=Borland.Data.AdoDbxClient
///   ConnectionString=ConnectionName=IBLOCAL;
///
/// The IBLOCAL refers to a regular dbexpress connection property section that looks
/// something like this:
///
///   [IBLOCAL]
///   //DelegateConnection=DBXTraceConnection
///   ServerCharSet=UNICODE_FSS
///   drivername=INTERBASE
///   Database=C:\Program Files\Borland\InterBase\examples\database\employee.gdb
///   rolename=RoleName
///   user_name=sysdba
///   Password=masterkey
///   sqldialect=3
///   blobsize=-1
///   commitretain=False
///   waitonlocks=True
///   localecode=0000
///   interbase transisolation=ReadCommitted
///   trim char=False
///
/// There is also a test selection command line option than can be used to only
/// execute tests that start with a specific prefix.  So to run all tests that
/// begin with "Test", a command line option of "-s:Test" should be specified.
/// If you are reporting a bug, the name of your test method should start with the
/// letter "o" to indicate that the test is open.  When the bug is fixed, we will
/// remove the "o" from the name of the test method so that the test will be run
/// automatically with our automated regression test system.
///
/// </summary>

unit DbxTest;

interface

uses
{$IFDEF CLR}
  System.Data,
  System.Data.Common,
  System.Configuration,
  AdoMetaDataProvider,
  AdoDbxClientProvider,
{$ENDIF}
  TestFrameworkExtension, Classes, DBXCommon, DbxMetaDataProvider;

const
  //command line property to specify dbxConnection name
  sConnectionName = 'connection';
  sAdoDbxClientProvider ='Borland.Data.AdoDbxClient';

type

  //custom test case to looks for a
  //command line property to setup SQLConnection or ALL
  TDBXTestCase = class(TTestCaseExtension)
  private
    FConnection: TDBXConnection;
    FDBXName: String;
    FMetaDataProvider: TDbxMetaDataProvider;
{$IFDEF CLR}
    FAdoConnection: DbConnection;
{$ENDIF}
    FTearDownList: TList;

    procedure FreeTearDownList;

  protected
    function  IsExtendedMetaDataBeingUsed(ConnectionName: WideString): Boolean;
    function  GetDbxConnection: TDbxConnection; virtual;
    procedure ExecuteStatement(const CommandText: WideString);
    procedure ExecuteStatementIgnoreError(const CommandText: WideString);
    function  GetMetaDataProvider: TDbxMetaDataProvider;
    function IsTypeSupported(DataType, SubType: Integer): Boolean;
    function GetIsCreateTableInMultiStatementTransactionSupported: Boolean;
{$IFDEF CLR}
    function GetAdoConnectionFromMachineConfig: DbConnection;
    function GetAdoConnection: DbConnection;
{$ENDIF}
    function StartMetaDataTransaction: TObject;
    procedure CommitFreeAndNilMetaDataTransaction(var Transaction: TObject);
    procedure RollbackMetaDataTransaction(var Transaction: TObject);

    ///  <summary>
    ///    Important note on this version of setup.  It uses information passed in
    ///  from the command line to determine which type of dialect to create.  If
    ///  the extended meta data model is being used, which is deteced from the drivers,
    ///  then it will load an TExtendMDDialect.  Otherwise it will use the static
    ///  implementations, TInterbaseDialect, TOracleDialect, etc...
    ///  </summary>
    procedure TearDown; override;
  public

    constructor Create(MethodName: string); override;
    destructor  Destroy; override;

    procedure FreeOnTearDown(Item: TObject);

    function GetName: string; override;
    procedure SetName(AName: String);

    ///<summary>
    ///  Will drop the specified table name if it exists.  Any exceptions
    ///  thrown will be ignored.
    ///</summary>
    procedure DropTable(TableName: WideString);

    ///<summary>
    /// This method can be used to generate a string id that can be
    /// appended to identifiers such as a table or stored procedures
    /// to help make the identifier more unique.  The return value
    /// is currently not guaranteed to be completely unique.  Using
    /// GetHostId helps to avoid name conflicts when multiple computers
    /// are executing similar tests against the same database server.
    ///</summary>

    function GetHostId: WideString;

    ///<summary>
    ///  Connection Property that will return a TDBXConnection.
    ///   Note* Since TDBXConnections are returned from the ConnectionFactory
    ///  connected, which may cause problems in a large test environment,
    ///  it is recommended to access Connection as late as possible,
    ///  and to call CloseDbxConnection().  If Close connection is not called, then
    ///  it will be called automatically in TearDown.
    ///  </summary>
    property DbxConnection: TDBXConnection read GetDbxConnection;
    procedure CloseDbxConnection; virtual;
    property MetaDataProvider: TDbxMetaDataProvider read GetMetaDataProvider;
    property IsCreateTableInMultiStatementTransactionSupported: Boolean read GetIsCreateTableInMultiStatementTransactionSupported;
{$IFDEF CLR}
    property AdoConnection: DbConnection read GetAdoConnection;
{$ENDIF}



  end;


implementation

uses
{$IFNDEF CLR}
  DBXDataExpressMetaDataProvider,
{$ENDIF}
{$IFDEF POSIX}
  Posix.UniStd,
{$ENDIF}
  SysUtils;

{ TDBXTestCase }

procedure TDBXTestCase.CommitFreeAndNilMetaDataTransaction(var Transaction: TObject);
begin
{$IFDEF CLR}
  DbTransaction(Transaction).Commit;
  Transaction := nil;
{$ELSE}
  DbxConnection.CommitFreeAndNil(TDBXTransaction(Transaction));
{$ENDIF}
end;

constructor TDBXTestCase.Create(MethodName: string);
begin
  inherited Create(MethodName);
  FTearDownList := TList.Create;
  FDBXName := MethodName;
  FConnection := nil;
end;

destructor TDBXTestCase.Destroy;
begin
  FreeTearDownList;
  FreeAndNil(FMetaDataProvider);
  FreeAndNil(FTearDownList);
  FreeAndNil(FConnection);
  inherited;
end;

procedure TDBXTestCase.DropTable(TableName: WideString);
begin
  try
    MetaDataProvider.DropTable(TableName);
  except

  end;
end;

procedure TDBXTestCase.ExecuteStatement(const CommandText: WideString);
var
  DBXCommand: TDBXCommand;
begin
  try
    DBXCommand := DbxConnection.CreateCommand;
    DBXCommand.Text := CommandText;
    DBXCommand.ExecuteQuery;
  finally
    FreeAndNil(DBXCommand);
    CloseDbxConnection;
  end;
end;

procedure TDBXTestCase.ExecuteStatementIgnoreError(
  const CommandText: WideString);
begin
  try
    ExecuteStatement(CommandText);
  except on Ex: Exception do

  end;
end;

procedure TDBXTestCase.FreeOnTearDown(Item: TObject);
begin
  FTearDownList.Add(Item);
end;

procedure TDBXTestCase.FreeTearDownList;
begin
  while FTearDownList.Count > 0 do
  begin
    TObject(FTearDownList[0]).Free;
    FTearDownList[0] := nil;
    FTearDownList.Delete(0);
  end;
  FTearDownList.Clear;
end;

{$IFDEF CLR}
function TDBXTestCase.GetAdoConnectionFromMachineConfig: DbConnection;
var
  Config: Configuration;
  Settings: ConnectionStringSettings;
  Factory: DbProviderFactory;
begin
  Result := nil;
  Config := ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
  Settings := Config.ConnectionStrings.ConnectionStrings[Properties.Values[sConnectionName]];
  if Assigned(Settings) then
  begin
    Factory := DbProviderFactories.GetFactory(Settings.ProviderName);
    Result := Factory.CreateConnection();
    Result.ConnectionString := Settings.ConnectionString;
    Result.Open();
  end;
end;

function TDBXTestCase.GetAdoConnection: DbConnection;
var
  Connection: System.Data.Common.DbConnection;
  ConnectionProperties: TDBXProperties;
  ProviderName: WideString;
  ConnectionString: WideString;
  ConnectionName: WideString;
begin
  if FAdoConnection = nil then
  begin
    FAdoConnection := GetAdoConnectionFromMachineConfig;
    if not Assigned(FAdoConnection) then
    begin
      ConnectionName        := Properties.Values[sConnectionName];
      ConnectionProperties  := TDBXConnectionFactory.GetConnectionFactory.GetConnectionProperties(ConnectionName);
      ProviderName          := ConnectionProperties['ProviderName'];

      if ProviderName = '' then
      begin
        ProviderName := sAdoDbxClientProvider;
        ConnectionString := 'ConnectionName=' + ConnectionName;
      end else
      begin
        ConnectionString := ConnectionProperties['ConnectionString'];
      end;
      Connection := TAdoDbxConnection.Create();
      Connection.ConnectionString := ConnectionString;
      Connection.Open;
      FAdoConnection := Connection;
    end;
  end;
  Result := FAdoConnection;
end;
{$ENDIF}

{$IFDEF CLR}
function TDBXTestCase.GetMetaDataProvider: TDbxMetaDataProvider;
var
  Provider: TAdoMetaDataProvider;
begin
  if FMetaDataProvider = nil then
  begin
    Provider := TAdoMetadataProvider.Create;
    Provider.Connection := AdoConnection;
    Provider.Open;
    FMetaDataProvider := Provider;
  end;
  Result := FMetaDataProvider;
end;
{$ELSE}
function TDBXTestCase.GetMetaDataProvider: TDbxMetaDataProvider;
var
  Provider: TDBXDataExpressMetaDataProvider;
begin
  if FMetaDataProvider = nil then
  begin
    Provider := TDBXDataExpressMetaDataProvider.Create;
    Provider.Connection := DbxConnection;
    Provider.Open;
    FMetaDataProvider := Provider;
  end;
  Result := FMetaDataProvider;
end;
{$ENDIF}

function TDBXTestCase.GetName: string;
begin
  Result := Properties.Values[sConnectionName] + '_' + FDBXName;
end;

function TDBXTestCase.GetDbxConnection: TDbxConnection;
begin
  if FConnection = nil then
  begin
    with TDBXConnectionFactory.GetConnectionFactory do
    FConnection := GetConnection(Properties.Values[sConnectionName],'','');
  end;
  Result := FConnection;
end;

function TDBXTestCase.GetHostId: WideString;
{$IFDEF POSIX}
var
  MachName: array[0..7] of AnsiChar;
{$ENDIF}
const
  ComputerName = 'COMPUTERNAME';
  MaxHostLength = 8;
begin
  Result := 'UNKNOWN';
{$IFDEF POSIX}
  if Posix.Unistd.gethostname(MachName, SizeOf(MachName)) = 0 then
    Result := WideUpperCase(UTF8ToUnicodeString(MachName));
{$ELSE}
  if GetEnvironmentVariable(ComputerName)<>'' then
    Result := GetEnvironmentVariable(ComputerName);
{$ENDIF}
  Result := StringReplace(Result, '.' ,'',[rfReplaceAll]);
  Result := StringReplace(Result, ' ' ,'',[rfReplaceAll]);
  Result := StringReplace(Result, '-' ,'',[rfReplaceAll]);
  if (Length(Result) > MaxHostLength) then
    Delete(Result,MaxHostLength-1,Length(Result));
end;

function TDBXTestCase.GetIsCreateTableInMultiStatementTransactionSupported: Boolean;
begin
  if MetaDataProvider.DatabaseProduct = 'Sybase SQL Server' then
    Result := False
  else
    Result := True;
end;

function TDBXTestCase.IsExtendedMetaDataBeingUsed(ConnectionName: WideString): Boolean;
var
  CurrentDriver: WideString;

  MDPackageLoader, MDAssemblyLoader: WideString;
begin
  with TDBXConnectionFactory.GetConnectionFactory do
  begin
    //use the current connection to determine which driver it uses
    CurrentDriver := GetConnectionProperties(ConnectionName).Values[TDBXPropertyNames.DriverName];

    //check the dirver params for presence of new Extended MetaData values
    MDPackageLoader := GetDriverProperties(CurrentDriver).Values[TDBXPropertyNames.MetaDataPackageLoader];
    MDAssemblyLoader := GetDriverProperties(CurrentDriver).Values[TDBXPropertyNames.MetaDataAssemblyLoader];
  end;
  {$IFDEF CLR}
    Result := MDAssemblyLoader <> '';
  {$ELSE}
    Result := MDPackageLoader <> '';
  {$ENDIF}
end;

procedure TDBXTestCase.RollbackMetaDataTransaction(var Transaction: TObject);
begin
{$IFDEF CLR}
  DbTransaction(Transaction).Rollback;
  Transaction := nil;
{$ELSE}
  DbxConnection.RollbackFreeAndNil(TDBXTransaction(Transaction));
{$ENDIF}
end;

procedure TDBXTestCase.CloseDbxConnection;
begin
  FreeAndNil(FMetaDataProvider);
  FreeAndNil(FConnection);
end;

procedure TDBXTestCase.SetName(AName: String);
begin
  FDBXName := AName;
end;

function TDBXTestCase.StartMetaDataTransaction: TObject;
begin
{$IFDEF CLR}
  Result := AdoConnection.BeginTransaction;
{$ELSE}
  Result := DbxConnection.BeginTransaction;
{$ENDIF}
end;

procedure TDBXTestCase.TearDown;
begin
  inherited;
  FreeTearDownList;
  FreeAndNil(FMetaDataProvider);
  FreeAndNil(FConnection);
{$IFDEF CLR}
  FreeAndNil(FAdoConnection);
{$ENDIF}
end;

function TDBXTestCase.IsTypeSupported(DataType, SubType: Integer): Boolean;
begin
  if Pos('{' + IntToStr(DataType) + ',' + IntToStr(SubType), UnicodeString(DbxConnection.GetVendorProperty('DriverDataTypes'))) <> 0 then
    Result := True
  else
    Result := False;
end;

end.
