{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit DispHandlers;

interface

uses Classes, Messages, HTTPApp, HTTPProd, WebCntxt,
  Masks, WebComp, Contnrs, SysUtils, SiteComp, WebDisp;

type


  TCustomWebDispatchHandler = class;

  { Keeps a list of dispatch components rather than a collection
    of dispatch actions }
  TDispatchHandlersContainer = class(TWebContainerComponent,
    IWebComponentEditor)
  protected
    function GetDefaultWebComponents: TWebComponentList; override;
    procedure SetDefaultWebComponents(AList: TWebComponentList); override;
    { IWebComponentEditor }
    function CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
    function ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean; virtual;
  public
    property DispatchHandlers: TWebComponentList read GetWebComponents;
  end;

  TCustomDispatchHandlers = class(TDispatchHandlersContainer,
    IMultiModuleSupport, IWebRequestHandler, IWebDispatchActions, ITopLevelWebComponent)
  private
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FDispatchList: TComponentList;
    FBeforeDispatch: THTTPMethodEvent;
    FAfterDispatch: THTTPMethodEvent;
  protected
    function DoAfterDispatch(Request: TWebRequest;
      Response: TWebResponse): Boolean;
    function DoBeforeDispatch(Request: TWebRequest;
      Response: TWebResponse): Boolean;
    function DispatchDefaultHandler(Request: TWebRequest;
      Response: TWebResponse): Boolean;
    { IWebRequestHandler }
    function HandleRequest(Request: TWebRequest;
      Response: TWebResponse): Boolean;
    function ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse): Boolean; virtual;
    { IMultiModuleSupport }
    procedure InitContext(Request: TWebRequest; Response: TWebResponse);
    procedure InitModule(AModule: TComponent);
    procedure FinishContext;

    function GetRequest: TWebRequest;
    function GetResponse: TWebResponse;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Request: TWebRequest read GetRequest;
    property Response: TWebResponse read GetResponse;
    property BeforeDispatch: THTTPMethodEvent read FBeforeDispatch write FBeforeDispatch;
    property AfterDispatch: THTTPMethodEvent read FAfterDispatch write FAfterDispatch;
  end;

  TDispatchHandlers = class(TCustomDispatchHandlers)
  published
    property DispatchHandlers;
    property BeforeDispatch;
    property AfterDispatch;
  end;

  TAbstractWebDispatchHandler = class(TWebContainedComponent)
  end;

  IWebDispatchHandler = interface
  ['{711D78E7-EB03-11D3-A41F-00C04F6BB853}']
    function HandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
    procedure SetDefault(AValue: Boolean);
    function GetDefault: Boolean;
    property Default: Boolean read GetDefault write SetDefault;
  end;

  TBaseWebDispatchHandler = class(TAbstractWebDispatchHandler, IWebDispatchHandler,
    ISetAppDispatcher)
  private
    FDefault: Boolean;
    FEnabled: Boolean;
    FMethodType: TMethodType;
    FAppDispatcher: TComponent;
  protected
    { ISetAppDispatcher }
    procedure SetAppDispatcher(const Value: TComponent);
    { IWebDispatchHandler }
    function HandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
    procedure SetDefault(AValue: Boolean);
    function GetDefault: Boolean;
    function ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean; virtual;
    procedure ImplSetDefault(AValue: Boolean); virtual;
    function ImplGetDefault: Boolean; virtual;

    procedure SetEnabled(Value: Boolean);
    procedure SetMethodType(Value: TMethodType);
  public
    constructor Create(AOwner: TComponent); override;
    property Default: Boolean read ImplGetDefault write ImplSetDefault default False;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property MethodType: TMethodType read FMethodType write SetMethodType default mtAny;
    property AppDispatcher: TComponent read FAppDispatcher;
  end;

  TCustomPathInfoDispatchHandler = class(TBaseWebDispatchHandler)
  private
    FPathInfo: string;
    FMaskPathInfo: string;
    FMask: TMask;
  protected
    function HandlesRequest(Request: TWebRequest; const RootPath: string; DoDefault: Boolean): Boolean;
    function FixupPathInfo(const Value: string): string; virtual;
    function GetPathInfo: string; virtual;
    procedure SetPathInfo(const Value: string); virtual;
    function GetMask(const RootPath: string): TMask;
  public
    destructor Destroy; override;
    property PathInfo: string read GetPathInfo write SetPathInfo;
  end;

  TCustomWebDispatchHandler = class(TCustomPathInfoDispatchHandler)
  private
    FOnAction: THTTPMethodEvent;
    FProducer: TComponent;
    FProducerContent: TComponent;
    procedure SetProducerContent(const Value: TComponent);
    procedure SetProducer(const Value: TComponent);
    procedure SetOnAction(Value: THTTPMethodEvent);
  protected
    function ProducerPathInfo: string;
    function FixupPathInfo(const Value: string): string; override;
    function GetMask(const RootPath: string): TMask;
    function GetPathInfo: string; override;
    { IWebDispatchHandler }
    function ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    property Producer: TComponent read FProducer write SetProducer;
    property ProducerContent: TComponent read FProducerContent write SetProducerContent;
    property OnAction: THTTPMethodEvent read FOnAction write SetOnAction;
  end;

  TWebDispatchHandler = class(TCustomWebDispatchHandler)
  published
    property Default;
    property Enabled;
    property MethodType;
    property PathInfo;
    property Producer;
    property ProducerContent;
    property OnAction;
  end;

  TCustomFileDispatchHandler = class(TCustomPathInfoDispatchHandler)
  private
    FHTMLFile: TFileName;
  public
    function ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean; override;
    property HTMLFile: TFileName read FHTMLFile write FHTMLFile;
  end;

  TFileDispatchHandler = class(TCustomFileDispatchHandler)
  published
    property HTMLFile;
    property Default;
    property Enabled;
    property MethodType;
    property PathInfo;
  end;

  TCustomPageDispatchHandler = class(TCustomPathInfoDispatchHandler)
  private
    FPage: string;
    FOnAfterDispatchPage: TDispatchPageEvent;
    FOnBeforeDispatchPage: TDispatchPageHandledEvent;
  public
    function ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean; override;
    property Page: string read FPage write FPage;
    property OnBeforeDispatchPage: TDispatchPageHandledEvent read FOnBeforeDispatchPage write FOnBeforeDispatchPage;
    property OnAfterDispatchPage: TDispatchPageEvent read FOnAfterDispatchPage write FOnAfterDispatchPage;
  end;

  TPageDispatchHandler = class(TCustomPageDispatchHandler)
  published
    property Page;
    property Default;
    property Enabled;
    property MethodType;
    property PathInfo;
    property OnBeforeDispatchPage;
    property OnAfterDispatchPage;
  end;

implementation

uses WebConst, Windows,
 WebScript, WebSess, Variants, AdaptReq, WebAdapt;

{ TDispatchHandlersContainer }

function TDispatchHandlersContainer.CanAddClass(AParent: TComponent; AClass: TClass): Boolean;
begin
  Result := ImplCanAddClass(AParent, AClass);
end;

function TDispatchHandlersContainer.GetDefaultWebComponents: TWebComponentList;
begin
  Result := nil;
end;

function TDispatchHandlersContainer.ImplCanAddClass(AParent: TComponent; AClass: TClass): Boolean;
begin
  Result := AClass.InheritsFrom(TAbstractWebDispatchHandler);
end;

{ Copied from httpapp }
function DispatchHandler(Sender: TObject; Dispatch: IWebDispatch; Request: TWebRequest; Response: TWebResponse;
  DoDefault: Boolean): Boolean;
begin
  Result := False;
  if (Dispatch.Enabled and ((Dispatch.MethodType = mtAny) or
    (Dispatch.MethodType = Dispatch.MethodType)) and
    Dispatch.Mask.Matches(Request.InternalPathInfo)) then
  begin
    Result := Dispatch.DispatchRequest(Sender, Request, Response);
  end;
end;

procedure TDispatchHandlersContainer.SetDefaultWebComponents(
  AList: TWebComponentList);
begin
  Assert(False);
  // Unexpected call
end;

{ TBaseWebDispatchHandler }

function TBaseWebDispatchHandler.GetDefault: Boolean;
begin
  Result := ImplGetDefault;
end;

function TBaseWebDispatchHandler.HandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
begin
  Result := ImplHandleRequest(Request, Response, RootPath, DoDefault);
end;

function TBaseWebDispatchHandler.ImplGetDefault: Boolean;
begin
  Result := FDefault;
end;

function TBaseWebDispatchHandler.ImplHandleRequest(Request: TWebRequest;
      Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
begin
  Result := False;
end;

procedure TBaseWebDispatchHandler.SetDefault(AValue: Boolean);
begin
  ImplSetDefault(AValue);
end;

constructor TBaseWebDispatchHandler.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := True;
end;

procedure TBaseWebDispatchHandler.SetEnabled(Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TBaseWebDispatchHandler.SetMethodType(Value: TMethodType);
begin
  FMethodType := Value;
end;

procedure TBaseWebDispatchHandler.ImplSetDefault(AValue: Boolean);
var
  I: Integer;
  Handler: TComponent;
  WebDispatchHandler: IWebDispatchHandler;
begin
  if AValue <> FDefault then
  begin
    if AValue and (GetContainerList <> nil) and not (csLoading in ComponentState) then
    begin
      for I := 0 to GetContainerList.Count - 1 do
      begin
        Handler :=  GetContainerList[I];
        if (Handler <> Self) and Supports(IInterface(Handler), IWebDispatchHandler, WebDispatchHandler) then
          WebDispatchHandler.Default := False;
      end;
    end;
  end;
  FDefault := AValue;
end;

procedure TBaseWebDispatchHandler.SetAppDispatcher(
  const Value: TComponent);
begin
  FAppDispatcher := Value;
end;

{ TCustomWebDispatchHandler }

procedure TCustomWebDispatchHandler.SetOnAction(Value: THTTPMethodEvent);
begin
  FOnAction := Value;
end;

function TCustomWebDispatchHandler.FixupPathInfo(const Value: string): string;
begin
  Result := inherited FixupPathInfo(Value);
  if Assigned(FProducer) and (Result = ProducerPathInfo) then
    Result := '';
end;

procedure TCustomWebDispatchHandler.SetProducer(const Value: TComponent);
begin
  if Assigned(Value) then
  begin
    Value.FreeNotification(Self);
    FProducerContent := nil;
  end;
  FProducer := Value;
end;

procedure TCustomWebDispatchHandler.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FProducer) then
    FProducer := nil;
  if (Operation = opRemove) and (AComponent = FProducerContent) then
    FProducerContent := nil;
end;

function TCustomWebDispatchHandler.ProducerPathInfo: string;
begin
  Assert(Assigned(FProducer));
  Result := '/' + FProducer.Name
end;

function TCustomWebDispatchHandler.GetPathInfo: string;
begin
  if (FPathInfo = '') and Assigned(FProducer) then
    Result := ProducerPathInfo
  else
    Result := FPathInfo;
end;

function TCustomWebDispatchHandler.GetMask(const RootPath: string): TMask;
var
  Mask: TMask;
  MaskPathInfo: string;
begin
  MaskPathInfo := GetPathInfo;
  if RootPath <> '' then
    MaskPathInfo := RootPath + MaskPathInfo;
  if (not Assigned(FMask)) or
    (AnsiCompareText(FMaskPathInfo, MaskPathInfo) <> 0) then
  begin
    Mask := TMask.Create(MaskPathInfo);
    try
      FMaskPathInfo := MaskPathInfo;
      if Assigned(FMask) then
      begin
        FMask.Free;
        FMask := nil;
      end;
    except
      Mask.Free;
      raise;
    end;
    FMask := Mask;
  end;
  Result := FMask;
end;

function TCustomWebDispatchHandler.ImplHandleRequest(Request: TWebRequest;
  Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
var
  ProduceContent: IProduceContent;
begin
  Result := False;
  if HandlesRequest(Request, RootPath, DoDefault) then
  begin
    Result := True;
    if Supports(IUnknown(FProducer), IProduceContent, ProduceContent) then
    begin
      Response.Content := ProduceContent.ProduceContent;
    end;
    if Assigned(FOnAction) then
    begin
      FOnAction(Self, Request, Response, Result);
    end
  end;
end;

{ TCustomFileDispatchHandler }

// Extract a file name from the path and use the file as an HTML template
function TCustomFileDispatchHandler.ImplHandleRequest(Request: TWebRequest;
  Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
var
  Producer: TPageProducer;
  S: string;
  P: Integer;
  SetAppDispatcher: ISetAppDispatcher;
begin
  Result := False;
  if HandlesRequest(Request, RootPath, DoDefault) then
  begin
    S := Request.PathInfo;
    P := Pos('/', S);
    while P <> 0 do
    begin
      Delete(S, 1, P);
      P := Pos('/', S);
    end;
    S := QualifyFileName(S);
    if FileExists(S) then
    begin
      Producer := TPageProducer.Create(nil);
      try
        if Supports(IInterface(Producer), ISetAppDispatcher, SetAppDispatcher) then
          SetAppDispatcher.SetAppDispatcher(AppDispatcher);
        Producer.HTMLFile := S;
        Response.Content := Producer.Content;
        Result := True;
      finally
        Producer.Free;
      end;
    end;
  end;
end;

procedure TCustomWebDispatchHandler.SetProducerContent(
  const Value: TComponent);
begin
  if Assigned(Value) then
  begin
    Value.FreeNotification(Self);
    FProducer := nil;
  end;
  FProducerContent := Value;
end;

{ TCustomPageDispatchHandler }

function TCustomPageDispatchHandler.ImplHandleRequest(Request: TWebRequest;
  Response: TWebResponse; const RootPath: string; DoDefault: Boolean): Boolean;
begin
  Result := False;
  if HandlesRequest(Request, RootPath, DoDefault) then
  begin
    if Assigned(OnBeforeDispatchPage) then
      OnBeforeDispatchPage(Self, Page, Result);
    if not Result then
    begin
      Result := DispatchPageName(Page, Response, [dpPublished]);
      if Assigned(OnAfterDispatchPage) then
        OnAfterDispatchPage(Self, Page);
    end;
  end;
end;

{ TCustomDispatchHandlers }

function TCustomDispatchHandlers.HandleRequest(
  Request: TWebRequest; Response: TWebResponse): Boolean;
begin
  Result := ImplHandleRequest(Request, Response);
end;

function TCustomDispatchHandlers.DoAfterDispatch(Request: TWebRequest; Response: TWebResponse): Boolean;
begin
  Result := True;
  if Assigned(FAfterDispatch) then
    FAfterDispatch(Self, Request, Response, Result);
end;

function TCustomDispatchHandlers.DoBeforeDispatch(Request: TWebRequest; Response: TWebResponse): Boolean;
begin
  Result := False;
  if Assigned(FBeforeDispatch) then
    FBeforeDispatch(Self, Request, Response, Result);
end;

function TCustomDispatchHandlers.ImplHandleRequest(
  Request: TWebRequest; Response: TWebResponse): Boolean;
var
  I: Integer;
  Handler, Default: TComponent;
  Dispatch: IWebDispatch;
  WebDispatchHandler: IWebDispatchHandler;
begin
  FRequest := Request;
  FResponse := Response;
  Default := nil;
  if Response.Sent then
  begin
    Result := True;
    Exit;
  end;
  Result := DoBeforeDispatch(Request, Response) or Response.Sent;

  I := 0;
  while not Result and (I < DispatchHandlers.Count) do
  begin
    Handler := DispatchHandlers.WebComponents[I];
    if Supports(IInterface(Handler), IWebDispatchHandler, WebDispatchHandler) then
    begin
      Result := WebDispatchHandler.HandleRequest(Request, Response, '', False);
      if WebDispatchHandler.Default then Default := Handler;
    end;
    Inc(I);
  end;
  // Dispatch to self registering components
  I := 0;
  while not Result and (I < FDispatchList.Count) do
  begin
    if Supports(IInterface(FDispatchList.Items[I]), IWebDispatch, Dispatch) then
    begin
      Result := DispatchHandler(Self, Dispatch,
        Request, Response, False);
    end;
    Inc(I);
  end;

  if not Result and Assigned(Default) then
  begin
    if Supports(IInterface(Default), IWebDispatchHandler, WebDispatchHandler) then
      Result := WebDispatchHandler.HandleRequest(Request, Response, '', True);
  end;
  if Result and not Response.Sent then
    Result := DoAfterDispatch(Request, Response);

end;

function TCustomDispatchHandlers.DispatchDefaultHandler(
  Request: TWebRequest; Response: TWebResponse): Boolean;
var
  I: Integer;
  Handler, Default: TComponent;
  WebDispatchHandler: IWebDispatchHandler;
begin
  Result := False;
  I := 0;
  Default := nil;
  while not Assigned(Default) and (I < DispatchHandlers.Count) do
  begin
    Handler := DispatchHandlers.WebComponents[I];
    if Supports(IInterface(Handler), IWebDispatchHandler, WebDispatchHandler) then
      if WebDispatchHandler.Default then Default := Handler;
    Inc(I);
  end;

  if Assigned(Default) then
  begin
    Supports(IInterface(Default), IWebDispatchHandler, WebDispatchHandler);
    Result := WebDispatchHandler.HandleRequest(Request, Response, '', True);
  end;

end;

procedure TCustomDispatchHandlers.InitModule(AModule: TComponent);
var
  I: Integer;
  Component: TComponent;
  DispatchIntf: IWebDispatch;
begin
  for I := 0 to AModule.ComponentCount - 1 do
  begin
    Component := AModule.Components[I];
    if Supports(IInterface(Component), IWebDispatch, DispatchIntf) then
      FDispatchList.Add(Component)
  end;
end;

function TCustomDispatchHandlers.GetRequest: TWebRequest;
begin
  Result := FRequest;
end;

function TCustomDispatchHandlers.GetResponse: TWebResponse;
begin
  Result := FResponse;
end;

constructor TCustomDispatchHandlers.Create(AOwner: TComponent);
begin
  FDispatchList := TComponentList.Create;
  FDispatchList.OwnsObjects := False;
  inherited Create(AOwner);
end;

destructor TCustomDispatchHandlers.Destroy;
begin
  inherited;
  FDispatchList.Free;
end;

procedure TCustomDispatchHandlers.FinishContext;
begin
  //
end;

procedure TCustomDispatchHandlers.InitContext(Request: TWebRequest;
  Response: TWebResponse);
begin
  FRequest := Request;
  FResponse := Response;
  FDispatchList.Clear;
end;

{ TCustomPathInfoDispatchHandler }

destructor TCustomPathInfoDispatchHandler.Destroy;
begin
  FMask.Free;
  inherited Destroy;
end;

procedure TCustomPathInfoDispatchHandler.SetPathInfo(const Value: string);
var
  NewValue: string;
begin
  NewValue := FixupPathInfo(Value);
  FPathInfo := NewValue;
end;

function TCustomPathInfoDispatchHandler.GetPathInfo: string;
begin
  Result := FPathInfo;
end;

function TCustomPathInfoDispatchHandler.GetMask(const RootPath: string): TMask;
var
  Mask: TMask;
  MaskPathInfo: string;
begin
  MaskPathInfo := GetPathInfo;
  if RootPath <> '' then
    MaskPathInfo := RootPath + MaskPathInfo;
  if (not Assigned(FMask)) or
    (AnsiCompareText(FMaskPathInfo, MaskPathInfo) <> 0) then
  begin
    Mask := TMask.Create(MaskPathInfo);
    try
      FMaskPathInfo := MaskPathInfo;
      if Assigned(FMask) then
      begin
        FMask.Free;
        FMask := nil;
      end;
    except
      Mask.Free;
      raise;
    end;
    FMask := Mask;
  end;
  Result := FMask;
end;

function TCustomPathInfoDispatchHandler.FixupPathInfo(
  const Value: string): string;
begin
  Result := Value;
  if Value <> '' then Result := DosPathToUnixPath(Value);
  if (Result <> '') and (Result[1] <> '/') then Insert('/', Result, 1);
end;

{ TCustomPathInfoDispatchHandler }

function TCustomPathInfoDispatchHandler.HandlesRequest(Request: TWebRequest; const RootPath: string; DoDefault: Boolean): Boolean;
begin
  Result := (FDefault and DoDefault) or (FEnabled and ((FMethodType = mtAny) or
    (FMethodType = Request.MethodType)) and
    GetMask(RootPath).Matches(Request.InternalPathInfo));
end;

end.

