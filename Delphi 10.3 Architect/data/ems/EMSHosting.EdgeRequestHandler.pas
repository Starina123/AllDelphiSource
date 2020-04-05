{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMSHosting.EdgeRequestHandler;

interface

uses System.SysUtils, System.Classes,
  EMSHosting.RequestTypes, EMSHosting.RequestHandler, EMS.ResourceAPI, EMSHosting.Endpoints;

type
  TEdgeRequestHandler = class(TEMSHostRequestHandler)
  protected
    function UserIDOfSession(const AContext: IEMSHostContext; const ASessionToken, ATenantId: string;
      out AUserID: string): Boolean; override;
    function UserNameOfID(const AContext: IEMSHostContext; const AUserID, ATenantId: string;
      out AUserName: string): Boolean; override;
    function GetGroupsByUser(const AContext: IEMSHostContext; const AUserID, ATenantId: string): TArray<string>; override;
    procedure CheckForbiddenRequest(const AResourceName, AOriginalResourceName: string); override;
    procedure AuthenticateRequest(const AResources: TArray<TEMSResource>; const ARequestProps: TEMSHostRequestProps;
      var AAuthenticated: TEndpointContext.TAuthenticated); override;
    procedure LogEndpoint(const AResource, AEndpointName, AMethod, AUserID,
      ACustom, ATenantId: string); override;
    procedure RedirectResource(const AContext: TEndpointContext; var AResource: TEMSResource; var AEndpointName: string); override;
    function GetDefaultTenantId: string; override;
    function IsUserBelongsToTenant(const AUserId, ATenantId: string): Boolean; override;
    function GetTenantNameByTenantId(const ATenantId: string; const AContext: IEMSHostContext = nil): string; override;
  end;

implementation

uses EMS.Services, EMSHosting.Helpers, EMSHosting.ExtensionsServices;

procedure TEdgeRequestHandler.AuthenticateRequest(const AResources: TArray<TEMSResource>;
  const ARequestProps: TEMSHostRequestProps;
  var AAuthenticated: TEndpointContext.TAuthenticated);
begin
                                          
  AAuthenticated := [];

end;

procedure TEdgeRequestHandler.CheckForbiddenRequest(
  const AResourceName, AOriginalResourceName: string);
begin
  // Do nothing
end;

function TEdgeRequestHandler.GetDefaultTenantId: string;
begin
  Result := '';
end;

function TEdgeRequestHandler.GetGroupsByUser(const AContext: IEMSHostContext;
  const AUserID, ATenantId: string): TArray<string>;
var
  Intf: IEMSEdgeHostContext;
begin
  if Supports(AContext, IEMSEdgeHostContext, Intf) then
    Result := Intf.GetGroupsByUser(AUserID, ATenantId);
end;

function TEdgeRequestHandler.GetTenantNameByTenantId(
  const ATenantId: string; const AContext: IEMSHostContext = nil): string;
var
  Intf: IEMSEdgeHostContext;
begin
  if Supports(AContext, IEMSEdgeHostContext, Intf) then
    Result := Intf.GetTenantNameByTenantId(ATenantId);
end;

function TEdgeRequestHandler.IsUserBelongsToTenant(const AUserId,
  ATenantId: string): Boolean;
begin
  Result := True;
end;

procedure TEdgeRequestHandler.LogEndpoint(const AResource, AEndpointName,
  AMethod, AUserID, ACustom, ATenantId: string);
begin
  // Do nothing
end;

procedure TEdgeRequestHandler.RedirectResource(const AContext: TEndpointContext; var AResource: TEMSResource;
  var AEndpointName: string);
begin
  // Do nothing
end;

function TEdgeRequestHandler.UserIDOfSession(const AContext: IEMSHostContext; const ASessionToken, ATenantId: string;
  out AUserID: string): Boolean;
var
  Intf: IEMSEdgeHostContext;
begin
  Result := Supports(AContext, IEMSEdgeHostContext, Intf);
  if Result then
    Result := Intf.UserIDOfSession(ASessionToken, AUserID);
end;

function TEdgeRequestHandler.UserNameOfID(const AContext: IEMSHostContext; const AUserID, ATenantId: string;
  out AUserName: string): Boolean;
var
  Intf: IEMSEdgeHostContext;
begin
  Result := Supports(AContext, IEMSEdgeHostContext, Intf);
  if Result then
    Result := Intf.UserNameOfID(AUserID, AUserName);
end;

end.
