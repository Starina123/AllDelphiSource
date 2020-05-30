{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit SoapDm;


interface

uses Windows, Variants, Classes, Midas, Provider, SysUtils, HTTPApp;

type
  { TSoapDataModule}

  TSoapDataModule = class(TDataModule, IAppServer, IProviderContainer)
  private
    FProviders: TList;
    FLock: TRTLCriticalSection;
    function GetProviderCount: integer; 
  protected
    function GetProvider(const ProviderName: string): TCustomProvider; virtual;
    { IAppServer }
    function AS_GetProviderNames: OleVariant; safecall;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant;
      MaxErrors: Integer; out ErrorCount: Integer;
      var OwnerData: OleVariant): OleVariant; safecall;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                            Options: Integer; const CommandText: WideString;
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; safecall;
    function AS_DataRequest(const ProviderName: WideString;
      Data: OleVariant): OleVariant; safecall;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant;
      RequestType: Integer; var OwnerData: OleVariant): OleVariant; safecall;
    procedure AS_Execute(const ProviderName: WideString;
      const CommandText: WideString; var Params, OwnerData: OleVariant); safecall;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Lock; virtual;
    procedure Unlock; virtual;
    { IProviderContainer }
    procedure RegisterProvider(Value: TCustomProvider);
    procedure UnRegisterProvider(Value: TCustomProvider);
    property Providers[const ProviderName: string]: TCustomProvider read GetProvider;
    property ProviderCount: integer read GetProviderCount;
  end;

implementation

uses MidConst;

{ TSoapDataModule }

constructor TSoapDataModule.Create(AOwner: TComponent);
begin
  InitializeCriticalSection(FLock);
  FProviders := TList.Create;
  inherited Create(AOwner);
end;

destructor TSoapDataModule.Destroy;
begin
  inherited Destroy;
  FProviders.Free;
  DeleteCriticalSection(FLock);
end;

procedure TSoapDataModule.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TSoapDataModule.Unlock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TSoapDataModule.RegisterProvider(Value: TCustomProvider);
begin
  FProviders.Add(Value);
end;

procedure TSoapDataModule.UnRegisterProvider(Value: TCustomProvider);
begin
  FProviders.Remove(Value);
end;

function TSoapDataModule.GetProvider(const ProviderName: string): TCustomProvider;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FProviders.Count - 1 do
    if AnsiCompareStr(TCustomProvider(FProviders[i]).Name, ProviderName) = 0 then
    begin
      Result := TCustomProvider(FProviders[i]);
      if not Result.Exported then
        Result := nil;
      Exit;
    end;
  if not Assigned(Result) then
    raise Exception.CreateResFmt(@SProviderNotExported, [ProviderName]);
end;

function TSoapDataModule.AS_GetProviderNames: OleVariant;
var
  List: TStringList;
  i: Integer;
begin
  Lock;
  try
    List := TStringList.Create;
    try
      for i := 0 to FProviders.Count - 1 do
        if TCustomProvider(FProviders[i]).Exported then
          List.Add(TCustomProvider(FProviders[i]).Name);
      List.Sort;
    Result := VarArrayFromStrings(List);
    finally
      List.Free;
    end;
  finally
    UnLock;
  end;
end;

function TSoapDataModule.AS_ApplyUpdates(const ProviderName: WideString;
  Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer;
  var OwnerData: OleVariant): OleVariant;
begin
  Lock;
  try
    Result := Providers[ProviderName].ApplyUpdates(Delta, MaxErrors, ErrorCount, OwnerData);
  finally
    UnLock;
  end;
end;

function  TSoapDataModule.AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                            Options: Integer; const CommandText: WideString;
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; safecall;
begin
  Lock;
  try
    Result := Providers[ProviderName].GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData);
  finally
    UnLock;
  end;
end;

function TSoapDataModule.AS_RowRequest(const ProviderName: WideString;
  Row: OleVariant; RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Lock;
  try
    Result := Providers[ProviderName].RowRequest(Row, RequestType, OwnerData);
  finally
    UnLock;
  end;
end;

function TSoapDataModule.AS_DataRequest(const ProviderName: WideString;
  Data: OleVariant): OleVariant; safecall;
begin
  Lock;
  try
    Result := Providers[ProviderName].DataRequest(Data);
  finally
    UnLock;
  end;
end;

function TSoapDataModule.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Lock;
  try
    Result := Providers[ProviderName].GetParams(OwnerData);
  finally
    UnLock;
  end;
end;

procedure TSoapDataModule.AS_Execute(const ProviderName: WideString;
  const CommandText: WideString; var Params, OwnerData: OleVariant);
begin
  Lock;
  try
    Providers[ProviderName].Execute(CommandText, Params, OwnerData);
  finally
    UnLock;
  end;
end;


function TSoapDataModule.GetProviderCount: integer;
begin
  Result := FProviders.Count;
end;


end.
