{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DbxInterbase"'}    {Do not Localize}
unit Data.DbxInterbase;

interface

uses
  Data.DBXDynalink,
  Data.DBXDynalinkNative,
  Data.DBXCommon, Data.DbxInterBaseReadOnlyMetaData, Data.DbxInterBaseMetaData;

type
  TDBXInterBaseProperties = class(TDBXProperties)
  strict private
    const StrServerCharSet = 'ServerCharSet';
    function GetDatabase: string;
    function GetPassword: string;
    function GetUserName: string;
    function GetServerCharSet: string;
    procedure SetServerCharSet(const Value: string);
    procedure SetDatabase(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
  public
    constructor Create(DBXContext: TDBXContext); override;
  published
    property Database: string read GetDatabase write SetDatabase;
    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;
    property ServerCharSet: string read GetServerCharSet write SetServerCharSet;
  end;

  TDBXInterBaseDriver = class(TDBXDynalinkDriverNative)
  public
    constructor Create(DBXDriverDef: TDBXDriverDef); override;
end;

implementation

uses
  Data.DBXPlatform, System.SysUtils;

const
  sDriverName = 'InterBase';

{ TDBXInterBaseDriver }

constructor TDBXInterBaseDriver.Create(DBXDriverDef: TDBXDriverDef);
var
  Props: TDBXInterBaseProperties;
  I, Index: Integer;
begin
  Props := TDBXInterBaseProperties.Create(DBXDriverDef.FDBXContext);
  if DBXDriverDef.FDriverProperties <> nil then
  begin
    for I := 0 to DBXDriverDef.FDriverProperties.Count - 1 do
    begin
      Index := Props.Properties.IndexOfName(DBXDriverDef.FDriverProperties.Properties.Names[I]);
      if Index > -1 then
        Props.Properties.Strings[Index] := DBXDriverDef.FDriverProperties.Properties.Strings[I];
    end;
    Props.AddUniqueProperties(DBXDriverDef.FDriverProperties.Properties);
    DBXDriverDef.FDriverProperties.AddUniqueProperties(Props.Properties);
  end;
  inherited Create(DBXDriverDef, TDBXDynalinkDriverLoader, Props);
end;

{ TDBXInterBaseProperties }

constructor TDBXInterBaseProperties.Create(DBXContext: TDBXContext);
begin
  inherited Create(DBXContext);
  Values[TDBXPropertyNames.DriverUnit] := 'Data.DBXInterbase';
  Values[TDBXPropertyNames.DriverPackageLoader] := 'TDBXDynalinkDriverLoader,DBXInterBaseDriver160.bpl';
  Values[TDBXPropertyNames.DriverAssemblyLoader] := 'Borland.Data.TDBXDynalinkDriverLoader,Borland.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=' + TDBXPlatform.GetPublicKeyToken;
  Values[TDBXPropertyNames.MetaDataPackageLoader] := 'TDBXInterbaseMetaDataCommandFactory,DbxInterBaseDriver160.bpl';
  Values[TDBXPropertyNames.MetaDataAssemblyLoader] := 'Borland.Data.TDBXInterbaseMetaDataCommandFactory,Borland.Data.DbxInterBaseDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=' + TDBXPlatform.GetPublicKeyToken;

  Values[TDBXPropertyNames.GetDriverFunc] := 'getSQLDriverINTERBASE';
  Values[TDBXPropertyNames.LibraryName] := 'dbxint.dll';
  Values[TDBXPropertyNames.LibraryNameOsx] := 'libsqlib.dylib';
  Values[TDBXPropertyNames.VendorLib] := 'gds32.dll';
  Values[TDBXPropertyNames.VendorLibWin64] := 'ibclient64.dll';
  Values[TDBXPropertyNames.VendorLibOsx] := 'libgds.dylib';

  Values[TDBXPropertyNames.Database] := 'database.gdb';
  Values[TDBXPropertyNames.UserName] := 'sysdba';
  Values[TDBXPropertyNames.Password] := 'masterkey';


  Values[TDBXPropertyNames.Role] := 'RoleName';
  Values[TDBXPropertyNames.MaxBlobSize] := '-1';

  Values[TDBXPropertyNames.ErrorResourceFile] := '';
  Values[TDBXDynalinkPropertyNames.LocaleCode] := '0000';
  Values[TDBXPropertyNames.IsolationLevel] := 'ReadCommitted';

  Values['ServerCharSet'] := '';
  Values['SQLDialect'] := '3';
  Values['CommitRetain'] := 'False';
  Values['WaitOnLocks'] := 'True';
  Values['TrimChar'] := 'False';
end;

function TDBXInterBaseProperties.GetDatabase: string;
begin
  Result := Values[TDBXPropertyNames.Database];
end;

function TDBXInterBaseProperties.GetPassword: string;
begin
  Result := Values[TDBXPropertyNames.Password];
end;

function TDBXInterBaseProperties.GetServerCharSet: string;
begin
  Result := Values[StrServerCharSet];
end;

function TDBXInterBaseProperties.GetUserName: string;
begin
  Result := Values[TDBXPropertyNames.UserName];
end;

procedure TDBXInterBaseProperties.SetDatabase(const Value: string);
begin
  Values[TDBXPropertyNames.Database] := Value;
end;

procedure TDBXInterBaseProperties.SetPassword(const Value: string);
begin
  Values[TDBXPropertyNames.Password] := Value;
end;

procedure TDBXInterBaseProperties.SetServerCharSet(const Value: string);
begin
  Values[StrServerCharSet] := Value;
end;

procedure TDBXInterBaseProperties.SetUserName(const Value: string);
begin
  Values[TDBXPropertyNames.UserName] := Value;
end;

initialization
  TDBXDriverRegistry.RegisterDriverClass(sDriverName, TDBXInterBaseDriver);

end.
