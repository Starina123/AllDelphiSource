{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit WSDLNode;

interface

uses Classes, WebNode, OpConvert, XMLDOc, XMLIntf, WSDLItems, TypInfo;

type

  TWSDLView = class(TComponent)
  private
    FPortType: string;
    FPort: string;
    FOperation: string;
    FService: string;
    FWSDL: TWSDLItems;
    FIWSDL: IXMLDocument;
    procedure SetWSDL(Value: TWSDLItems);
  public
    IntfInfo: PTypeInfo;
  published
    property PortType: string read FPortType write FPortType;
    property Port: string read FPort write FPort;
    property Operation: string read FOperation write FOperation;
    property Service: string read FService write FService;
    property WSDL: TWSDLItems read FWSDL write SetWSDL;
  end;

  TWSDLClientNode = class(TComponent, IWebNode)
  private
    FWSDLView: TWSDLView;
    FTransportNode: IWebNode;
    procedure SetTransportNode(Value: IWebNode);
  public

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Execute(const DataMsg: WideString; Resp: TStream);
  published
    property WSDLView: TWSDLView read FWSDLView write FWSDLView;
    property TransportNode: IWebNode read FTransportNode  write SetTransportNode;
  end;

implementation

{ TWSDLClientNode }

procedure  TWSDLClientNode.Execute(const DataMsg: WideString; Resp: TStream);
begin
end;

procedure TWSDLClientNode.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and AComponent.IsImplementorOf(FTransportNode) then
    FTransportNode := nil;
end;


procedure TWSDLClientNode.SetTransportNode(Value: IWebNode);
begin
  if Assigned(Value) then
  begin
    ReferenceInterface(FTransportNode, opRemove);
    FTransportNode := Value;
    ReferenceInterface(FTransportNode, opInsert);
  end;
end;

{ TWSDLView }

procedure TWSDLView.SetWSDL(Value: TWSDLItems);
begin
  if Assigned(Value) then
  begin
    FWSDL := Value;
    FIWSDL := Value as IXMLDocument;
  end;
end;

end.
