{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{Copyright(c) 2015-2018 Embarcadero Technologies, Inc.  }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMS.FileResource;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes,
  EMS.ResourceAPI, EMS.ResourceTypes;

type
                                                                        
                                                                                 
                                                                                  

    
  TEMSFileResource = class (TEMSBaseResource)
  private
    FPathTemplate: string;
    FDefaultFile: string;
    procedure PutOrPost(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse;
      AAction: TEMSBaseResource.TAction);
  public
    function GetFileName(const AContext: TEndpointContext): string;

    [EndpointMethod(TEndpointRequest.TMethod.Get)]
    [EndpointProduce('application/json')]
    procedure List(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    procedure Put(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

    [ResourceSuffix('./{id}')]
    procedure Delete(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
      const AResponse: TEndpointResponse); override;

  published
    property PathTemplate: string read FPathTemplate write FPathTemplate;
    property DefaultFile: string read FDefaultFile write FDefaultFile;
  end;

implementation

uses
  System.Types, System.SysUtils, System.IOUtils, System.Net.Mime, System.JSON,
  System.JSON.Builders, EMS.Consts;

{ TEMSFileResource }

function TEMSFileResource.GetFileName(const AContext: TEndpointContext): string;
var
  i1, i2: Integer;
  LName, LValue: string;
begin
  Result := PathTemplate;
  while True do
  begin
    i1 := Result.IndexOf('{');
    if i1 < 0 then
      Break;
    i2 := Result.IndexOf('}', i1 + 1);
    if i2 < 0 then
      Break;
    LName := Result.Substring(i1 + 1, i2 - i1 - 1);
    LValue := '';
    AContext.Request.Params.TryGetValue(LName, LValue);
    DoGetParam(LName, LValue);
    Result := Result.Remove(i1, i2 - i1 + 1).Insert(i1, LValue);
  end;
  Result := Result.Replace('/', PathDelim, [rfReplaceAll]);
  if Result.Contains('..') then
    AContext.Response.RaiseForbidden();
end;

procedure TEMSFileResource.List(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LPath: string;
  LBld: TJSONArrayBuilder;
  LArr: TJSONCollectionBuilder.TElements;
  LFiles: TStringDynArray;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.List);

  LPath := GetFileName(AContext);
  if TDirectory.Exists(LPath) then
    LFiles := TDirectory.GetFiles(LPath, '*')
  else if TFile.Exists(LPath) then
    LFiles := [LPath]
  else
    AContext.Response.RaiseNotFound();

  LBld := TJSONArrayBuilder.Create(AResponse.Body.JSONWriter);
  try
    LArr := LBld.BeginArray;
    for LPath in LFiles do
                                                                                                       
      LArr.Add(TPath.GetFileName(LPath));
    LArr.EndArray;
  finally
    LBld.Free;
  end;
end;

procedure TEMSFileResource.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LPath: string;
  LType: string;
  LKind: TMimeTypes.TKind;
  LWeight: Double;
  LStream: TFileStream;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.Get);

  LPath := GetFileName(AContext);
                                                                                       
  if TDirectory.Exists(LPath) then
    if DefaultFile = '' then
      AResponse.RaiseNotFound()
    else
      LPath := TPath.Combine(LPath, DefaultFile);
  if not TFile.Exists(LPath) then
    AResponse.RaiseNotFound();

  TMimeTypes.Default.GetFileInfo(LPath, LType, LKind);
  if AContext.Negotiation.ProduceList.Negotiate(LType, LWeight, nil) = '' then
    AResponse.RaiseNotAcceptable();

                                                                                       
                                                                            

  LStream := TFileStream.Create(LPath, fmOpenRead or fmShareDenyWrite);
  AResponse.Body.SetStream(LStream, LType, True);
end;

procedure TEMSFileResource.PutOrPost(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse;
  AAction: TEMSBaseResource.TAction);
var
  LPath: string;
  LType: string;
  LKind: TMimeTypes.TKind;
  LWeight: Double;
  LDestStream, LSrcStream: TStream;
  LContentType: string;
begin
  CheckAction(AContext, AAction);

  LPath := GetFileName(AContext);
  if AnsiCompareText(TPath.GetFileName(LPath), DefaultFile) = 0 then
    AResponse.RaiseNotFound();

  TMimeTypes.Default.GetFileInfo(LPath, LType, LKind);
  if (AContext.Negotiation.ConsumeList.Negotiate(LType, LWeight, nil) = '') or
     not ARequest.Body.TryGetStream(LSrcStream, LContentType) then
    AResponse.RaiseUnsupportedMedia();

  if TFile.Exists(LPath) then
  begin
    if AAction = TEMSBaseResource.TAction.Post then
      AResponse.RaiseDuplicate();
    TFile.Delete(LPath);
  end;

  LDestStream := TFileStream.Create(LPath, fmCreate or fmShareDenyWrite);
  try
    LDestStream.CopyFrom(LSrcStream, -1);
  finally
    LDestStream.Free;
  end;
end;

procedure TEMSFileResource.Put(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  PutOrPost(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Put);
end;

procedure TEMSFileResource.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  PutOrPost(AContext, ARequest, AResponse, TEMSBaseResource.TAction.Post);
end;

procedure TEMSFileResource.Delete(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LPath: string;
begin
  CheckAction(AContext, TEMSBaseResource.TAction.Delete);

  LPath := GetFileName(AContext);
  if not TFile.Exists(LPath) or
     (AnsiCompareText(TPath.GetFileName(LPath), DefaultFile) = 0) then
    AResponse.RaiseNotFound();

  TFile.Delete(LPath);
end;

end.
