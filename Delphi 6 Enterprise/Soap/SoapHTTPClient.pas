{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SoapHTTPClient;

interface

uses Classes, RIO, WSDLNode, WSDLItems, OPConvert, OPToSoapDomConv, SOAPHTTPTrans, WebNode, XMLIntf;

type
  THTTPRIO = class(TRIO)
  private
    FWSDLItems: TWSDLItems;
    WSDLItemDoc: IXMLDocument;
    FWSDLView: TWSDLView;
    FWSDLLocation: string;
    FDOMConverter:  TOPToSoapDomConvert;
    FHTTPWebNode: THTTPReqResp;
    procedure ClearDependentWSDLView;
    procedure SetWSDLLocation(Value: string);
    function GetPort: string;
    procedure SetPort(Value: string);
    function GetService: string;
    procedure SetService(Value: string);
    procedure CheckWSDLView;
    procedure SetURL(Value: string);
    procedure SetDomConverter(Value: TOPToSoapDomConvert);
    procedure SetHTTPWebNode(Value: THTTPReqResp);
    function GetURL: string;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    property WSDLItems: TWSDLItems read FWSDLItems;
  published
    property WSDLLocation: string read FWSDLLocation  write SetWSDLLocation;
    property Service: string read GetService write SetService;
    property Port: string read GetPort write SetPort;
    property URL: string read GetURL write SetURL;
    property HTTPWebNode: THTTPReqResp read FHTTPWebNode write SetHTTPWebNode;
    property Converter: TOPToSoapDomConvert read FDOMConverter write SetDOMConverter;
  end;

implementation

uses SysUtils, InvokeRegistry, Controls;

constructor THTTPRIO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDOMConverter := TOPToSoapDomConvert.Create(Self);
  FDomConverter.Name := 'Converter1'; { do not localize }
  FDomConverter.SetSubComponent(True);
  FHTTPWebNode := THTTPReqResp.Create(Self);
  FHTTPWebNode.Name := 'HTTPWebNode1'; { do not localize }
  FHTTPWebNode.SetSubComponent(True);
  FConverter := FDOMConverter as IOPConvert;
  FWebNode := FHTTPWebNode as IWebNode;
end;

procedure THTTPRIO.ClearDependentWSDLView;
begin
  if Assigned(FDomConverter) and Assigned(FDOMConverter.WSDLView) then
    FDOMConverter.WSDLView := nil;
  if Assigned(FHTTPWebNode) and Assigned(FHTTPWebNode.WSDLView) then
    FHTTPWebNode.WSDLView := FWSDLView;
end;

procedure THTTPRIO.CheckWSDLView;
begin
  if not Assigned(FWSDLItems) then
  begin
    if not Assigned(FWSDLItems) then
    begin
      FWSDLItems := TWSDLItems.Create(nil);
      WSDLItemDoc := FWSDLItems;
    end;
    if not Assigned(FWSDLView) then
      FWSDLView := TWSDLView.Create(nil);
    FWSDLView.WSDL := FWSDLItems;
    if Assigned(FDomConverter) then
      FDOMConverter.WSDLView := FWSDLView;
    if Assigned(FHTTPWebNode) then
      FHTTPWebNode.WSDLView := FWSDLView;
  end;
end;

destructor THTTPRIO.Destroy;
begin
  if Assigned(FConverter) then
    FConverter := nil;
  if Assigned(FWebNode) then
    FWebNode := nil;
  if Assigned(FWSDLView) then
    FWSDLView.Free;
  if Assigned(FHTTPWebNode) and (FHTTPWebNode.Owner = Self) then
    FHTTPWebNode.Free;
  if Assigned(FDOMConverter) and (FDomConverter.Owner = Self) then
    FDomConverter.Free;
  inherited;
end;

function THTTPRIO.GetPort: string;
begin
  if Assigned(FWSDLView) then
    Result := FWSDLView.Port;
end;

function THTTPRIO.GetService: string;
begin
  if Assigned(FWSDLView) then
    Result := FWSDLView.Service;
end;

procedure THTTPRIO.SetPort(Value: string);
begin
  if Assigned(FWSDLView) then
    FWSDLView.Port := Value;
end;

procedure THTTPRIO.SetService(Value: string);
begin
  if Assigned(FWSDLView) then
    FWSDLView.Service := Value;
end;

procedure THTTPRIO.SetURL(Value: string);
begin
  if Assigned(FHTTPWebNode) then
  begin
    FHTTPWebNode.URL := Value;
    if Value <> '' then
    begin
      WSDLLocation := '';
      ClearDependentWSDLView;
    end;
  end;
end;

procedure THTTPRIO.SetWSDLLocation(Value: string);
begin
  if (Value <> '') and (URL <> '') then
    FHTTPWebNode.URL := '';
  CheckWSDLView;
  if FWSDLItems.Active then
    FWSDLItems.Active  := False;
  FWSDLLocation := Value;
  FWSDLItems.FileName := Value;
  FWSDLView.Port := '';
  FWSDLView.Service := '';
end;


function THTTPRIO.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if Result = 0 then
    FHTTPWebNode.SoapAction := InvRegistry.GetNamespaceByGUID(IID);
end;

procedure THTTPRIO.SetDomConverter(Value: TOPToSoapDomConvert);
begin
  if Assigned(FDOMConverter) and (FDomConverter.Owner = Self) then
  begin
    FConverter := nil;
    FDomConverter.Free;
  end;
  FDomConverter := Value;
  if Value <> nil then
  begin
    FConverter := Value;
    Value.FreeNotification(Self);
  end;
end;

procedure THTTPRIO.SetHTTPWebNode(Value: THTTPReqResp);
begin
  if Assigned(FHTTPWebNode) and (FHTTPWebNode.Owner = Self) then
  begin
    FWebNode := nil;
    FHTTPWebNode.Free;
  end;
  FHTTPWebNode := Value;
  if Value <> nil then
  begin
    FWebNode := Value;
    Value.FreeNotification(Self);
  end;
end;

function THTTPRIO.GetURL: string;
begin
  if Assigned(FHTTPWebNode) then
    Result := FHTTPWebNode.URL;
end;


procedure THTTPRIO.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FHTTPWebNode) then
  begin
    FWebNode := nil;
    FHTTPWebNode := nil;
  end;
  if (Operation = opRemove) and (AComponent = FDomConverter) then
  begin
    FConverter := nil;
    FDomConverter := nil;
  end;
end;

initialization
  GroupDescendentsWith(THTTPRIO, Controls.TControl);

end.
