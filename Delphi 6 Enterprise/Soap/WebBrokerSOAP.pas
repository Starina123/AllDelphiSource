{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}
unit WebBrokerSOAP;

interface

uses Classes, HTTPApp, AutoDisp, Masks, WebNode,  SoapHTTPDisp;

type


  // webbroker component that dispatches soap requests
  THTTPSoapDispatcher = class(THTTPSoapDispatchNode, IWebDispatch)
  private
    FWebDispatch: TWebDispatch;
    procedure SetWebDispatch(const Value: TWebDispatch);
	protected
    function DispatchEnabled: Boolean;
    function DispatchMask: TMask;
    function DispatchMethodType: TMethodType;
    function DispatchRequest(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property WebDispatch: TWebDispatch read FWebDispatch write SetWebDispatch;
  end;

implementation

uses SysUtils, InvokeRegistry, SoapConst, Controls;

{ THTTPSoapDispatcher }
constructor THTTPSoapDispatcher.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWebDispatch := TWebDispatch.Create(Self);
  FWebDispatch.PathInfo := 'soap*';     { do not localize }
end;

destructor THTTPSoapDispatcher.Destroy;
begin
  FWebDispatch.Free;
  inherited Destroy;
end;

procedure THTTPSoapDispatcher.SetWebDispatch(const Value: TWebDispatch);
begin
 FWebDispatch.Assign(Value);
end;

function THTTPSoapDispatcher.DispatchEnabled: Boolean;
begin
  Result := True;
end;

function THTTPSoapDispatcher.DispatchMask: TMask;
begin
  Result := FWebDispatch.Mask;
end;

function THTTPSoapDispatcher.DispatchMethodType: TMethodType;
begin
  Result := FWebDispatch.MethodType;
end;

{ DO NOT LOCALIZE }
const DefException =
   SSoapXMLHeader +
   ' <SOAP-ENV:Envelope' + ' ' +
   'xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" >' +
   '<SOAP-ENV:Body> ' +
   '<SOAP-ENV:Fault> ' +
   '<faultcode>SOAP-ENV:Server</faultcode>' +
   '<faultstring>%s</faultstring>' +
   '</SOAP-ENV:Fault>' +
   '</SOAP-ENV:Body>' +
   '</SOAP-ENV:Envelope>';



function THTTPSoapDispatcher.DispatchRequest(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse): Boolean;
var
  Path, SoapAction, WResp: WideString;
  Stream, RStream: TMemoryStream;
  BytesRead, ChunkSize: Integer;
  Buffer: array of Byte;
  Size: Integer;
begin
  try
    try
      if not Assigned(FSoapDispatcher) and not ((csDesigning in ComponentState) or (csLoading in ComponentState)) then
        raise Exception.Create(SNoDispatcher);
      SoapAction := Request.GetFieldByName(SHTTPSoapAction);
      Path := Request.PathInfo;
      Stream := TMemoryStream.Create;
      try
        BytesRead := Length(Request.Content);
        if BytesRead < Request.ContentLength then
        begin
          SetLength(Buffer, Request.ContentLength);
          Stream.Write(Request.Content[1], BytesRead);
          repeat
            ChunkSize := Request.ReadClient(Buffer, Request.ContentLength - BytesRead);
            if ChunkSize > 0 then
            begin
              Stream.Write(Buffer, ChunkSize);
              Inc(BytesRead, ChunkSize);
            end;
          until ChunkSize = -1;
        end else
          Stream.Write(Request.Content[1], BytesRead);
        Stream.Position := 0;
        RStream := TMemoryStream.Create;
        try
          FSoapDispatcher.DispatchSoap(Path, SoapAction, Stream, RStream);
          RStream.Position := 0;
          Size := RStream.Size;
          SetLength(WResp, (Size div 2));
          RStream.ReadBuffer(WResp[1], Size);
          Response.Content :=  UTF8Encode(WResp);
          Response.ContentType := 'text/xml';
          Result := True;
        finally
          RStream.Free;
        end;
      finally
        Stream.Free;
      end;

    except
      on E: Exception do
      begin
        Response.Content :=  UTF8Encode(Format(DefException, [E.Message]));
        Response.ContentType := 'text/xml';
        Result := True;
      end;
    end;
  except
    Result := False;
    // swallow any unexpected exception, it will bring down some web servers
  end;
end;

initialization
  GroupDescendentsWith(THTTPSoapDispatcher, Controls.TControl);

end.

