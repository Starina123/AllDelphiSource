
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       SOAP client-side invoker                        }
{                                                       }
{       Copyright (c) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit SoapConn;

interface

uses
  SysUtils, Variants, Classes, VarUtils, Midas, DBClient, SoapHTTPTrans, Rio, SoapHTTPClient;


type

  TSoapConnection = class(TCustomRemoteServer)
  private
    FRIO: THTTPRIO;
    FURL: string;
    FAppServer: IAppServer;
    function GetAgent: string;
    function GetPassword: string;
    function GetProxy: string;
    function GetProxyByPass: string;
    function GetUserName: string;
    procedure SetAgent(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetProxy(const Value: string);
    procedure SetProxyByPass(const Value: string);
    procedure SetUserName(const Value: string);
  protected
    procedure DoConnect; override;
    function GetConnected: Boolean; override;
    function GetServerList: OleVariant; override;
    procedure DoDisconnect; override;
    procedure GetProviderNames(Proc: TGetStrProc); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetServer: IAppServer; override;
  published
    property Agent: string read GetAgent write SetAgent;
    property Connected;
    property Password: string read GetPassword write SetPassword;
    property Proxy: string read GetProxy write SetProxy;
    property ProxyByPass: string read GetProxyByPass write SetProxyByPass;
    property URL: string read FURL write FURL;
    property UserName: string read GetUserName write SetUserName;
  end;


implementation


uses Windows, InvokeRegistry, SoapConst, Controls;

{ TSoapConnection }

constructor TSoapConnection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSoapConnection.Destroy;
begin
  inherited;
end;

procedure TSoapConnection.DoDisconnect;
begin
  inherited;
  if Assigned(FRIO) then
    FRIO := nil;
end;

procedure TSoapConnection.GetProviderNames(Proc: TGetStrProc);
var
  List: Variant;
  I: Integer;
begin
  Connected := True;
  VarClear(List);
  try
    List := FAppServer.AS_GetProviderNames;
  except
    { Assume any errors means the list is not available. }
  end;
  if VarIsArray(List) and (VarArrayDimCount(List) = 1) then
    for I := VarArrayLowBound(List, 1) to VarArrayHighBound(List, 1) do
      Proc(List[I]);
end;

function TSoapConnection.GetServer: IAppServer;
begin
  Connected := True;
  Result := FAppServer;
end;

function TSoapConnection.GetServerList: OleVariant;
begin

end;

procedure TSoapConnection.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
end;

procedure TSoapConnection.DoConnect; 
begin
  if (URL = '') then
    raise Exception.Create(SNoURL);
  if not Assigned(FRIO) then
  try
    FRIO := THTTPRIO.Create(nil);
    FAppServer := FRIO as IAppServer;
    FRIO.URL := FURL;
  except
    Connected := False;
  end;
end;

function TSoapConnection.GetConnected: Boolean;
begin
  Result := Assigned(FRIO) and (Assigned(FRIO.HTTPWebNode));
end;

function TSoapConnection.GetAgent: string;
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    Result := FRIO.HTTPWebNode.Agent;
end;

function TSoapConnection.GetPassword: string;
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    Result := FRIO.HTTPWebNode.Password;
end;

function TSoapConnection.GetProxy: string;
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    Result := FRIO.HTTPWebNode.Proxy;
end;

function TSoapConnection.GetProxyByPass: string;
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    Result := FRIO.HTTPWebNode.ProxyByPass;
end;

function TSoapConnection.GetUserName: string;
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    Result := FRIO.HTTPWebNode.Username;
end;

procedure TSoapConnection.SetAgent(const Value: string);
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    FRIO.HTTPWebNode.Agent := Value
  else if not (csLoading in ComponentState) then
    raise Exception.Create(SNoURL);
end;

procedure TSoapConnection.SetPassword(const Value: string);
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    FRIO.HTTPWebNode.Password := Value
  else if not (csLoading in ComponentState) then
    raise Exception.Create(SNoURL);
end;

procedure TSoapConnection.SetProxy(const Value: string);
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    FRIO.HTTPWebNode.Proxy := Value
  else if not (csLoading in ComponentState) then
    raise Exception.Create(SNoURL);
end;

procedure TSoapConnection.SetProxyByPass(const Value: string);
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    FRIO.HTTPWebNode.ProxyByPass := Value
  else if not (csLoading in ComponentState) then
    raise Exception.Create(SNoURL);
end;

procedure TSoapConnection.SetUserName(const Value: string);
begin
  if Assigned(FRIO) and Assigned(FRIO.HTTPWebNode) then
    FRIO.HTTPWebNode.UserName := Value
  else if not (csLoading in ComponentState) then
    raise Exception.Create(SNoURL);
end;

initialization
  GroupDescendentsWith(TSoapConnection, Controls.TControl);
  InvRegistry.RegisterInterface(TypeInfo(IAppServer));
end.
