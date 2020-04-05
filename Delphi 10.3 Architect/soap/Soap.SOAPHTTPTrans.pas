{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                 SOAP HTTP Transport                   }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Soap.SOAPHTTPTrans;

{$LEGACYIFEND ON}

interface

uses
  System.Classes, System.SysUtils, System.Types, System.Net.URLClient, System.Net.HttpClient,
  Soap.IntfInfo, Soap.SOAPAttachIntf, Soap.WebNode, Soap.WSDLIntf, Soap.WSDLNode;

type
  ESOAPHTTPException = ENetException;

  SOAPInvokeOptions = (soNoValueForEmptySOAPAction,   { Send "" or absolutely no value for empty SOAPAction }
                       soIgnoreInvalidCerts,          { Handle Invalid Server Cert and ask HTTP runtime to ignore }
                       soNoSOAPActionHeader,          { Don't send SOAPAction - use very very carefully!! }
                       soAutoCheckAccessPointViaUDDI, { If we get a status code 404/405/410 - contact UDDI }
                       soPickFirstClientCertificate   { If certificate info is not specified - use first }
                       );
  TSOAPInvokeOptions = set of SOAPInvokeOptions;
  TSOAPHttpErrorAction = (heaSuccess, heaError, heaAbort, heaRetry);

  THTTPReqResp = class;

  { Provides access to HTTPReqResp component }
  IHTTPReqResp = interface
  ['{5FA6A197-32DE-4225-BC85-216CB80D1561}']
    function GetHTTPReqResp: THTTPReqResp;
  end;

  TBeforePostEvent = procedure(const HTTPReqResp: THTTPReqResp; Client: THTTPClient) of object;
  TPostingDataEvent = procedure(Sent: Integer; Total: Integer) of object;
  TReceivingDataEvent = procedure(Read: Integer; Total: Integer) of object;
  TSOAPHttpErrorEvent = procedure(const HTTPReqResp: THTTPReqResp; const HTTPResponse: IHTTPResponse;
    const Error: ESOAPHTTPException; var Action: TSOAPHttpErrorAction) of object;

  TClientCert = class(TComponent)
  private
    [HPPGEN('System::Net::Urlclient::TCertificate FCert;'                                           +sLineBreak+
            '  System::UnicodeString GetCertName();'                                                +sLineBreak+
            '  System::UnicodeString GetSerialNum();'                                               +sLineBreak+
            '  System::UnicodeString SetCertName(const System::UnicodeString s);'                   +sLineBreak+
            '  System::UnicodeString SetSerialNum(const System::UnicodeString s);'                  +sLineBreak+
            'public:'                                                                               +sLineBreak+
            '  __property System::UnicodeString CertName = {read=GetCertName, write=SetCertName};'  +sLineBreak+
            '  __property System::UnicodeString SerialNum = {read=GetSerialNum, write=SetSerialNum}')]
    FCert: TCertificate;
  published
    property Subject: string read FCert.Subject write FCert.Subject;
    property Issuer: string read FCert.Issuer write FCert.Issuer;
    property ProtocolName: string read FCert.ProtocolName write FCert.ProtocolName;
  end;

(*$HPPEMIT END OPENNAMESPACE*)
(*$HPPEMIT END '  inline System::UnicodeString TClientCert::GetCertName() { return ClientCertGetName(this); }'  *)
(*$HPPEMIT END '  inline System::UnicodeString TClientCert::GetSerialNum(){ return ClientCertGetSerial(this); }' *)
(*$HPPEMIT END '  inline System::UnicodeString TClientCert::SetCertName(const System::UnicodeString s) { ClientCertSetName(this, s); }'  *)
(*$HPPEMIT END '  inline System::UnicodeString TClientCert::SetSerialNum(const System::UnicodeString s){ ClientCertSetSerial(this, s); }' *)
(*$HPPEMIT END CLOSENAMESPACE*)

                                                                            
  TClientCertEx = class(TClientCert)
  private
    function GetCertName: string;
    function GetSerialNum: string;
    procedure SetCertName(const AValue: string);
    procedure SetSerialNum(const AValue: string);
  published
    property SerialNum: string read GetSerialNum write SetSerialNum;
    property CertName: string read GetCertName write SetCertName;
  end;

                                                                                           
  TClientCertHelper = class helper for TClientCert
  private
    function GetCertName: string;
    function GetSerialNum: string;
    procedure SetCertName(const AValue: string);
    procedure SetSerialNum(const AValue: string);
  public
    property SerialNum: string read GetSerialNum write SetSerialNum;
    property CertName: string read GetCertName write SetCertName;
  end;

  THTTPReqResp = class(TComponent, IInterface, IWebNode, IHTTPReqResp)
  private
    FHTTP: THTTPClient;
    FUserSetURL: Boolean;
{$IFNDEF AUTOREFCOUNT}
    FRefCount: Integer;
{$ENDIF !AUTOREFCOUNT}
    FOwnerIsComponent: Boolean;
    FURL: string;
    FBindingType: TWebServiceBindingType;
    FMimeBoundary: string;
    FWebNodeOptions: WebNodeOptions;
    FUserName: string;
    FPassword: string;
    FProxy: string;
    FWSDLView: TWSDLView;
    FSoapAction: string;
    FUseUTF8InHeader: Boolean;
    FInvokeOptions: TSOAPInvokeOptions;
    FUDDIBindingKey: string;
    FUDDIOperator: String;
    FOnBeforePost: TBeforePostEvent;
    FOnReceivingData: TReceivingDataEvent;
    FClientCertificate: TClientCert;
    FNeedClientCertificateEvent: TNeedClientCertificateEvent;
    procedure SetURL(const Value: string);
    function  GetSOAPAction: string;
    procedure SetSOAPAction(const SOAPAction: string);
    function IsSOAPActionStored: Boolean;
    procedure SetWSDLView(const WSDLVIew: TWSDLView);
    function  GetContentType: string;
    function  GetSOAPActionHeader: string;
    procedure SetUsername(const NameValue: string);
    procedure SetPassword(const PasswordValue: string);
    procedure SetProxy(const ProxyValue: string);
    function  GetAgentIsStored:Boolean;
    procedure SetupHttp(Http: THttpClient);
    function GetConnectTimeout: Integer;
    function GetReceiveTimeout: Integer;
    procedure SetConnectTimeout(const Value: Integer);
    procedure SetReceiveTimeout(const Value: Integer);
    function GetAgent: string;
    procedure SetAgent(const Value: string);
    procedure DoValidateServerCertificate(const Sender: TObject;
      const ARequest: TURLRequest; const Certificate: TCertificate;
      var Accepted: Boolean);
    procedure DoNeedClientCertificate(const Sender: TObject;
      const ARequest: TURLRequest; const ACertificateList: TCertificateList;
      var AnIndex: Integer);
    procedure DoReceiveData(const Sender: TObject; AContentLength,
      AReadCount: Int64; var Abort: Boolean);
  protected
{$IFNDEF AUTOREFCOUNT}
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
{$ENDIF !AUTOREFCOUNT}
    function GetMimeBoundary: string;
    procedure SetMimeBoundary(const Value: string);
    function  GetWebNodeOptions: WebNodeOptions;
    procedure SetWebNodeOptions(Value: WebNodeOptions);
  public
    constructor Create(Owner: TComponent); override;
{$IFNDEF AUTOREFCOUNT}
    class function NewInstance: TObject; override;
{$ENDIF !AUTOREFCOUNT}
    procedure AfterConstruction; override;
    destructor Destroy; override;
    function  GetHTTPReqResp: THTTPReqResp;
    procedure Get(Resp: TStream); virtual;
    {IWebNode}
    procedure BeforeExecute(const IntfMD: TIntfMetaData;
                            const MethMD: TIntfMethEntry;
                            MethodIndex: Integer;
                            AttachHandler: IMimeAttachmentHandler);
    procedure Execute(const DataMsg: String; Resp: TStream); overload; virtual;
    procedure Execute(const Request: TStream; Response: TStream); overload; virtual;
    function  Execute(const Request: TStream): TStream; overload; virtual;

  published
    property  URL: string read FURL write SetURL;
    property  SoapAction: string read GetSOAPAction write SetSOAPAction
      stored IsSOAPActionStored;
    property  WSDLView: TWSDLView read FWSDLView write SetWSDLView;
    property  Agent: string read GetAgent write SetAgent stored GetAgentIsStored;
    property  UserName: string read FUserName write SetUserName;
    property  Password: string read FPassword write SetPassword;
    property  Proxy: string read FProxy write SetProxy;
    property  ClientCertificate: TClientCert read FClientCertificate;
    property  UseUTF8InHeader: Boolean read FUseUTF8InHeader write FUseUTF8InHeader
      default True;
    property  InvokeOptions: TSOAPInvokeOptions read FInvokeOptions write FInvokeOptions
      default [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI];
    property  WebNodeOptions: WebNodeOptions read GetWebNodeOptions write SetWebNodeOptions
      default [];
    property  UDDIBindingKey: string read FUDDIBindingKey write FUDDIBindingKey;
    property  UDDIOperator: string read FUDDIOperator write FUDDIOperator;
    property  ConnectTimeout: Integer read GetConnectTimeout write SetConnectTimeout
      default TURLClient.DefaultConnectionTimeout;
    property  ReceiveTimeout: Integer read GetReceiveTimeout write SetReceiveTimeout
      default TURLClient.DefaultResponseTimeout;

    { Events }
    property  OnBeforePost: TBeforePostEvent read FOnBeforePost write FOnBeforePost;
    property  OnReceivingData: TReceivingDataEvent read FOnReceivingData write FOnReceivingData;
    property  OnNeedClientCertificate: TNeedClientCertificateEvent read FNeedClientCertificateEvent
      write FNeedClientCertificateEvent;
  end;

                                                                                  
  THTTPReqRespHelper = class helper for THTTPReqResp
  private
    function GetHTTP: THTTPClient;
    function GetSecureProtocols: THTTPSecureProtocols;
    procedure SetSecureProtocols(const AValue: THTTPSecureProtocols);
    function GetPreemptiveAuthentication: Boolean;
    procedure SetPreemptiveAuthentication(const AValue: Boolean);
    function GetAutomaticDecompression: THTTPCompressionMethods;
    procedure SetAutomaticDecompression(const AValue: THTTPCompressionMethods);
    function GetUseDefaultCredentials: Boolean;
    procedure SetUseDefaultCredentials(const AValue: Boolean);
  public
    property HTTP: THTTPClient read GetHTTP;
    /// <summary>Property controls which secure protocols may be used for
    /// HTTPS communication. By default will be used all protocols supported
    /// by the operating system. </summary>
    property SecureProtocols: THTTPSecureProtocols read GetSecureProtocols
      write SetSecureProtocols default CHTTPDefSecureProtocols;
    /// <summary>Property controls preemptive authentication. When set to True, then
    /// basic authentication will be provided before the server gives an unauthorized response. </summary>
    property PreemptiveAuthentication: Boolean read GetPreemptiveAuthentication
      write SetPreemptiveAuthentication default False;
    /// <summary>Property controls automatic decompression of response body.
    /// It is platform dependent and currently supported on Windows and Linux.
    /// When set, then corresponding "Accept-Encoding" header will be included
    /// into request, and response body will be automatically decoded. On iOS,
    /// macOS and Android platforms decoding is performed automatically. </summary>
    property AutomaticDecompression: THTTPCompressionMethods
      read GetAutomaticDecompression write SetAutomaticDecompression
      default [];
    /// <summary>Property controls automatic usage of logged user credentials
    /// for NTLM and Negotiate authentication schemas. It is platform dependent and
    /// currently supported on Windows and Linux. </summary>
    property UseDefaultCredentials: Boolean read GetUseDefaultCredentials
      write SetUseDefaultCredentials default False;
  end;

                                                                                              
  ESOAPHTTPExceptionHelper = class helper for ESOAPHTTPException
  private
    function GetStatusCode: Integer;
  public
    property StatusCode: Integer read GetStatusCode;
  end;

                                                                                                 
procedure ClientCertSetName(ClientCert: TClientCert; const S: string);
function  ClientCertGetName(ClientCert: TClientCert): string;
procedure ClientCertSetSerial(ClientCert: TClientCert; const S: string);
function  ClientCertGetSerial(ClientCert: TClientCert): string;

                                                                         
procedure SetOnHttpError(const OnHttpError: TSOAPHttpErrorEvent);

implementation

uses
  System.SyncObjs, System.NetConsts,
  Soap.InvokeRegistry, Soap.SOAPAttach, Soap.SOAPConst, Soap.UDDIHelper, Soap.WSDLItems;

const
  SOAP_AGENT = 'Embarcadero SOAP 1.4'; { Do not localize }

var
  FOnHttpError: TSOAPHttpErrorEvent = nil;

{ TClientCertEx }

function TClientCertEx.GetCertName: string;
begin
  Result := FCert.CertName;
end;

procedure TClientCertEx.SetCertName(const AValue: string);
begin
  FCert.CertName := AValue;
end;

function TClientCertEx.GetSerialNum: string;
begin
  Result := FCert.SerialNum;
end;

procedure TClientCertEx.SetSerialNum(const AValue: string);
begin
  FCert.SerialNum := AValue;
end;

{ TClientCertHelper }

function TClientCertHelper.GetCertName: string;
begin
  Result := (Self as TClientCertEx).GetCertName;
end;

procedure TClientCertHelper.SetCertName(const AValue: string);
begin
  (Self as TClientCertEx).CertName := AValue;
end;

function TClientCertHelper.GetSerialNum: string;
begin
  Result := (Self as TClientCertEx).SerialNum;
end;

procedure TClientCertHelper.SetSerialNum(const AValue: string);
begin
  (Self as TClientCertEx).SerialNum := AValue;
end;

procedure ClientCertSetName(ClientCert: TClientCert; const S: string);
begin
  ClientCert.CertName := S;
end;

function  ClientCertGetName(ClientCert: TClientCert): string;
begin
  Result := ClientCert.CertName;
end;

procedure ClientCertSetSerial(ClientCert: TClientCert; const S: string);
begin
  ClientCert.SerialNum := S;
end;

function  ClientCertGetSerial(ClientCert: TClientCert): string;
begin
  Result := ClientCert.SerialNum;
end;

{ THTTPReqResp }

procedure SetOnHttpError(const OnHttpError: TSOAPHttpErrorEvent);
begin
  FOnHttpError := OnHttpError;
end;

constructor THTTPReqResp.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FHTTP := THTTPClient.Create;

  InvokeOptions := [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI];
  Agent := SOAP_AGENT;
  { Default this to true to allow Clients to send International Characters without having to
    explicit set this.
    NOTE: This is a change from previous versions but it seems better based on the number of
          reports whose ultimate solution is related to not having enabled this property
          The property still specifies the default as False as we cannot break interfaces for
          this release. We'll reconsider the 'default' in a subsequent release. }
  UseUTF8InHeader := True;

  FClientCertificate := TClientCertEx.Create(Self);
  FClientCertificate.Name := 'ClientCert1'; {Do not localize }
  FClientCertificate.SetSubComponent(True);
end;

destructor THTTPReqResp.Destroy;
begin
  FreeAndNil(FClientCertificate);
  FreeAndNil(FHTTP);
  inherited Destroy;
end;

{$IFNDEF AUTOREFCOUNT}
class function THTTPReqResp.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  THTTPReqResp(Result).FRefCount := 1;
end;
{$ENDIF !AUTOREFCOUNT}

{ $IFNDEF AUTOREFCOUNT}
procedure THTTPReqResp.AfterConstruction;
begin
  inherited;
  FOwnerIsComponent := Assigned(Owner) and (Owner is TComponent);
{$IFNDEF AUTOREFCOUNT}
  TInterlocked.Decrement(FRefCount);
{$ENDIF !AUTOREFCOUNT}
end;
{ $ENDIF !AUTOREFCOUNT}

{ IInterface }

{$IFNDEF AUTOREFCOUNT}
function THTTPReqResp._AddRef: Integer;
begin
  Result := TInterlocked.Increment(FRefCount)
end;

function THTTPReqResp._Release: Integer;
begin
  Result := TInterlocked.Decrement(FRefCount);
  { If we are not being used as a TComponent, then use refcount to manage our
    lifetime as with TInterfacedObject. }
  if (Result = 0) and not FOwnerIsComponent then
    Destroy;
end;
{$ENDIF !AUTOREFCOUNT}

function THTTPReqResp.GetHTTPReqResp: THTTPReqResp;
begin
  Result := Self;
end;

function THTTPReqResp.GetSOAPAction: string;
begin
  if (FSoapAction = '') and not (soNoValueForEmptySOAPAction in InvokeOptions) then
    Result := '""'
  else
    Result := FSoapAction;
end;

procedure THTTPReqResp.SetSOAPAction(const SOAPAction: string);
begin
  FSoapAction := SOAPAction;
end;

function THTTPReqResp.IsSOAPActionStored: Boolean;
begin
  Result := FSoapAction <> '';
end;

procedure THTTPReqResp.SetWSDLView(const WSDLVIew: TWSDLView);
begin
  FWSDLView := WSDLView;
end;

procedure THTTPReqResp.SetURL(const Value: string);
begin
  FUserSetURL := Value <> '';
  FURL := Value;
end;

procedure THTTPReqResp.SetMimeBoundary(const Value: string);
begin
  FMimeBoundary := Value;
end;

function THTTPReqResp.GetMimeBoundary: string;
begin
  Result := FMimeBoundary;
end;

function THTTPReqResp.GetWebNodeOptions: WebNodeOptions;
begin
  Result := FWebNodeOptions;
end;

procedure THTTPReqResp.SetWebNodeOptions(Value: WebNodeOptions);
begin
  FWebNodeOptions := Value;
end;

procedure THTTPReqResp.SetUsername(const NameValue: string);
begin
  FUserName := NameValue;
  if Assigned(WSDLView) then
    WSDLView.UserName := NameValue;
end;

procedure THTTPReqResp.SetPassword(const PasswordValue: string);
begin
  FPassword := PasswordValue;
  if Assigned(WSDLView) then
    WSDLView.Password := PasswordValue;
end;

procedure THTTPReqResp.SetProxy(const ProxyValue: string);
begin
  FProxy := ProxyValue;
  if Assigned(WSDLView) then
    WSDLView.Proxy := ProxyValue;
end;

function THTTPReqResp.GetSOAPActionHeader: string;
begin
  if (SoapAction = '') then
    Result := SHTTPSoapAction + ':'
  else if (SoapAction = '""') then
    Result := SHTTPSoapAction + ': ""'
  else
    Result := SHTTPSoapAction + ': ' + '"' + SoapAction + '"';
end;

function THTTPReqResp.GetReceiveTimeout: Integer;
begin
  Result := FHTTP.ResponseTimeout;
end;

procedure THTTPReqResp.SetReceiveTimeout(const Value: Integer);
begin
  FHTTP.ResponseTimeout := Value;
end;

function THTTPReqResp.GetConnectTimeout: Integer;
begin
  Result := FHTTP.ConnectionTimeout;
end;

procedure THTTPReqResp.SetConnectTimeout(const Value: Integer);
begin
  FHTTP.ConnectionTimeout := Value;
end;

function THTTPReqResp.GetAgent: string;
begin
  Result := FHTTP.UserAgent;
end;

procedure THTTPReqResp.SetAgent(const Value: string);
begin
  FHTTP.UserAgent := Value;
end;

function THTTPReqResp.GetAgentIsStored: Boolean;
begin
  Result := Agent <> SOAP_AGENT;
end;

function THTTPReqResp.GetContentType: string;
begin
  Result := '';
  if not (wnoSOAP12 in WebNodeOptions) then
  begin
    if UseUTF8InHeader then
      Result := ContentTypeUTF8
    else
      Result := ContentTypeNoUTF8;
  end
  else
  begin
    if UseUTF8InHeader then
      Result := Format(ContentTypeWithActionNoLabelFmt, [ContentType12UTF8, GetSOAPAction])
    else
      Result := Format(ContentTypeWithActionNoLabelFmt, [ContentType12NoUTF8, GetSOAPAction]);
  end;
end;

procedure THTTPReqResp.DoValidateServerCertificate(const Sender: TObject;
  const ARequest: TURLRequest; const Certificate: TCertificate; var Accepted: Boolean);
begin
  Accepted := soIgnoreInvalidCerts in InvokeOptions;
end;

procedure THTTPReqResp.DoNeedClientCertificate(const Sender: TObject; const ARequest: TURLRequest;
  const ACertificateList: TCertificateList; var AnIndex: Integer);
var
  CertEx: TClientCertEx;
  Cert: TCertificate;
  i: Integer;
begin
  CertEx := TClientCertEx(ClientCertificate);
  if Assigned(OnNeedClientCertificate) then
    OnNeedClientCertificate(Sender, ARequest, ACertificateList, AnIndex)
  else if (CertEx.Subject <> '') or (CertEx.Issuer <> '') or
     (CertEx.ProtocolName <> '') or (CertEx.SerialNum <> '') or
     (CertEx.CertName <> '') then
  begin
    for i := 0 to ACertificateList.Count - 1 do
    begin
      Cert := ACertificateList[i];
      if ((CertEx.Subject = '') or (CertEx.Subject = Cert.Subject)) and
         ((CertEx.Issuer = '') or (CertEx.Issuer = Cert.Issuer)) and
         ((CertEx.ProtocolName = '') or (CertEx.ProtocolName = Cert.ProtocolName)) and
         ((CertEx.SerialNum = '') or (CertEx.SerialNum = Cert.SerialNum)) and
         ((CertEx.CertName = '') or (CertEx.CertName = Cert.CertName)) then
      begin
        AnIndex := i;
        Break;
      end;
    end;
  end
  else
  begin
    if (soPickFirstClientCertificate in InvokeOptions) and (ACertificateList.Count > 0) then
      AnIndex := 0;
  end;
end;

procedure THTTPReqResp.DoReceiveData(const Sender: TObject; AContentLength: Int64; AReadCount: Int64; var Abort: Boolean);
begin
  if Assigned(OnReceivingData) then
    OnReceivingData(AReadCount, AContentLength);
end;

procedure THTTPReqResp.SetupHttp(Http: THttpClient);
var
  LProxy: TProxySettings;
  LCredential: TCredentialsStorage.TCredential;
begin
  if (Proxy <> '') or (UserName <> '') or (Password <> '') then
    FHTTP.CredentialsStorage.ClearCredentials;

  { Proxy support configuration }
  if Proxy <> '' then
  begin
    LProxy := TProxySettings.Create(Proxy);
    if (LProxy.UserName = '') and (LProxy.Password = '') then
    begin
      { If name/password is used in conjunction with proxy, it's passed
        along for proxy authentication }
      LProxy.UserName := UserName;
      LProxy.Password := Password;
    end;
    FHTTP.ProxySettings := LProxy;
  end;

  { no proxy with Username/Password implies basic authentication }
  if (Proxy = '') and ((UserName <> '') or (Password <> '')) then
  begin
    LCredential := TCredentialsStorage.TCredential.Create(TAuthTargetType.Server,
      '', URL, UserName, Password);
    FHTTP.CredentialsStorage.AddCredential(LCredential);
  end;

  FHTTP.OnValidateServerCertificate := DoValidateServerCertificate;
  FHTTP.OnNeedClientCertificate := DoNeedClientCertificate;
  FHTTP.OnReceiveData := DoReceiveData;
end;

                                                                                
function CheckResponseError(const AReqResp: THTTPReqResp; const AHTTPResponse: IHTTPResponse): TSOAPHttpErrorAction;
var
  LExc: ESOAPHTTPException;
begin
  Result := heaSuccess;
  if AHTTPResponse.StatusCode >= 300 then
  begin
    Result := heaError;
    LExc := ESOAPHTTPException.CreateFmt('%s (%d) - ''%s''',
      [AHTTPResponse.StatusText, AHTTPResponse.StatusCode, AReqResp.URL]);
    if Assigned(FOnHttpError) then
      FOnHttpError(AReqResp, AHTTPResponse, LExc, Result);
    case Result of
      heaSuccess,
      heaRetry:
        LExc.Free;
      heaError:
        raise LExc;
      heaAbort:
        begin
          LExc.Free;
          System.SysUtils.Abort;
        end;
    end;
  end;
end;

procedure THTTPReqResp.Get(Resp: TStream);
var
  HTTPResponse: IHTTPResponse;
begin
  { GETs require a URL }
  if URL = '' then
    raise ESOAPHTTPException.Create(SEmptyURL);

  SetupHttp(FHTTP);

  FHTTP.Accept := '*/*';
  FHTTP.ContentType := sTextXml;
  Resp.Position := 0;

  repeat
    HTTPResponse := FHTTP.Get(URL, Resp);
  until CheckResponseError(Self, HTTPResponse) = heaSuccess;
end;

{ Here the RIO can perform any transports specific setup before call - XML serialization is done }
procedure THTTPReqResp.BeforeExecute(const IntfMD: TIntfMetaData;
                                     const MethMD: TIntfMethEntry;
                                     MethodIndex: Integer;
                                     AttachHandler: IMimeAttachmentHandler);
var
  MethName: InvString;
  Binding: InvString;
  QBinding: IQualifiedName;
  SOAPVersion: TSOAPVersion;
begin
  if FUserSetURL then
  begin
    MethName := InvRegistry.GetMethExternalName(IntfMD.Info, MethMD.Name);
    FSoapAction := InvRegistry.GetActionURIOfInfo(IntfMD.Info, MethName, MethodIndex);
  end
  else
  begin
    { User did *NOT* set a URL }
    if WSDLView <> nil then
    begin
      if ioSOAP12 in InvRegistry.GetIntfInvokeOptions(IntfMD.Info) then
        SOAPVersion := svSOAP12
      else
        SOAPVersion := svSOAP11;

      { Make sure WSDL is active }
      WSDLView.Activate;
      QBinding := WSDLView.WSDL.GetBindingForServicePort(WSDLView.Service, WSDLView.Port);
      if QBinding <> nil then
      begin
        Binding := QBinding.Name;
        MethName:= InvRegistry.GetMethExternalName(WSDLView.IntfInfo, WSDLView.Operation);
                                                                                                    
        FSoapAction := WSDLView.WSDL.GetSoapAction(Binding, MethName, 0, SOAPVersion);
      end;

      {NOTE: In case we can't get the SOAPAction - see if we have something in the registry }
      {      It can't hurt:) }
      if FSoapAction = '' then
        InvRegistry.GetActionURIOfInfo(IntfMD.Info, MethName, MethodIndex);

      { Retrieve URL }
      FURL := WSDLView.WSDL.GetSoapAddressForServicePort(WSDLView.Service, WSDLView.Port, SOAPVersion);
      if URL = '' then
        raise ESOAPHTTPException.CreateFmt(sCantGetURL,
                                           [WSDLView.Service, WSDLView.Port, WSDLView.WSDL.FileName]);
    end
    else
      raise ESOAPHTTPException.Create(sNoWSDLURL);
  end;

  { Are we sending attachments?? }
  if AttachHandler <> nil then
  begin
    FBindingType := btMIME;
    { If yes, ask MIME handler what MIME boundary it's using to build the Multipart
      packet }
    FMimeBoundary := AttachHandler.MIMEBoundary;

    { Also customize the MIME packet for transport specific items }
    if UseUTF8InHeader then
      AttachHandler.AddSoapHeader(Format(ContentTypeTemplate, [ContentTypeUTF8]))
    else
      AttachHandler.AddSoapHeader(Format(ContentTypeTemplate, [ContentTypeNoUTF8]));
    AttachHandler.AddSoapHeader(GetSOAPActionHeader);
  end else
    FBindingType := btSOAP;
end;

procedure THTTPReqResp.Execute(const DataMsg: String; Resp: TStream);
var
  Stream: TMemoryStream;
  Bytes: TBytes;
begin
  Bytes := TEncoding.UTF8.GetBytes(DataMsg);
  Stream := TMemoryStream.Create;
  try
    Stream.Size := Length(Bytes);
    Stream.Write(Bytes, 0, Length(Bytes));
    Execute(Stream, Resp);
  finally
    Stream.Free;
  end;
end;

function THTTPReqResp.Execute(const Request: TStream): TStream;
begin
  Result := TMemoryStream.Create;
  try
    Execute(Request, Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure THTTPReqResp.Execute(const Request: TStream; Response: TStream);

  function IsErrorStatusCode(Code: Integer): Boolean;
  begin
    case Code of
      404, 405, 410:
        Result := True;
      else
        Result := False;
    end;
  end;

var
  LookUpUDDI, CanRetry: Boolean;
  AccessPoint: string;
  PrevError: string;
  HTTPResponse: IHTTPResponse;
  ContType: string;
begin
  LookUpUDDI := False;
  CanRetry := (soAutoCheckAccessPointViaUDDI in InvokeOptions) and
              (Length(UDDIBindingKey) > 0) and
              (Length(UDDIOperator) > 0);
  while (True) do
  begin
    { Look up URL from UDDI?? }
    if LookUpUDDI and CanRetry then
    begin
      try
        CanRetry := False;
        AccessPoint := '';
        AccessPoint := GetBindingkeyAccessPoint(UDDIOperator, UDDIBindingKey);
      except
        { Ignore UDDI lookup error }
      end;
      { If UDDI lookup failed or we got back the same URL we used...
        raise the previous execption message }
      if (AccessPoint = '') or SameText(AccessPoint, URL) then
        raise ESOAPHTTPException.Create(PrevError);
      FURL := AccessPoint;
    end;

    HTTPResponse := nil;
    try
      SetupHttp(FHTTP);

      //  { if Request is TMimeAttachmentHandler then }
      if FBindingType = btMIME then
      begin
        FHTTP.ContentType := Format(ContentHeaderMIME, [FMimeBoundary]);
        FHTTP.CustomHeaders[MimeVersionName] := MimeVersionValue;
      end else { Assume btSOAP }
      begin
        FHTTP.ContentType := GetContentType;
        if not (soNoSOAPActionHeader in InvokeOptions) and not (wnoSOAP12 in WebNodeOptions) then
          FHTTP.CustomHeaders[SHTTPSoapAction] := SoapAction;
      end;
      FHTTP.Accept := '*/*';
      Request.Position := 0;

      if Assigned(OnBeforePost) then
        OnBeforePost(Self, FHTTP);

      HTTPResponse := FHTTP.Post(URL, Request, Response);
      repeat
        CheckResponseError(Self, HTTPResponse);
      until CheckResponseError(Self, HTTPResponse) = heaSuccess;

      if Response.Size = 0 then
        raise ESOAPHTTPException.Create(SInvalidHTTPResponse);

      ContType := HTTPResponse.MimeType;
      FMimeBoundary := GetMimeBoundaryFromType(ContType);
      { NOTE: Content-Types are case insensitive! }
      {       And here we're not validating that we
              have a valid content-type; rather
              we're checking for some common invalid
              ones }
      if SameText(ContType, ContentTypeTextPlain) or
         SameText(ContType, STextHtml) then
        raise ESOAPHTTPException.CreateFmt(SInvalidContentType, [ContType]);

      Exit;
    except
      on Ex: ESOAPHTTPException do
      begin
        if not CanRetry or not IsErrorStatusCode(HTTPResponse.StatusCode) then
          raise;
        { Trigger UDDI Lookup }
        LookUpUDDI := True;
        PrevError := Ex.Message;
      end;
    end;
  end;
end;

{ THTTPReqRespHelper }

function THTTPReqRespHelper.GetHTTP: THTTPClient;
begin
  Result := FHTTP;
end;

function THTTPReqRespHelper.GetSecureProtocols: THTTPSecureProtocols;
begin
  Result := FHTTP.SecureProtocols;
end;

procedure THTTPReqRespHelper.SetSecureProtocols(const AValue: THTTPSecureProtocols);
begin
  FHTTP.SecureProtocols := AValue;
end;

function THTTPReqRespHelper.GetPreemptiveAuthentication: Boolean;
begin
  Result := FHTTP.PreemptiveAuthentication;
end;

procedure THTTPReqRespHelper.SetPreemptiveAuthentication(const AValue: Boolean);
begin
  FHTTP.PreemptiveAuthentication := AValue;
end;

function THTTPReqRespHelper.GetAutomaticDecompression: THTTPCompressionMethods;
begin
  Result := FHTTP.AutomaticDecompression;
end;

procedure THTTPReqRespHelper.SetAutomaticDecompression(const AValue: THTTPCompressionMethods);
begin
  FHTTP.AutomaticDecompression := AValue;
end;

function THTTPReqRespHelper.GetUseDefaultCredentials: Boolean;
begin
  Result := FHTTP.UseDefaultCredentials;
end;

procedure THTTPReqRespHelper.SetUseDefaultCredentials(const AValue: Boolean);
begin
  FHTTP.UseDefaultCredentials := AValue;
end;

{ ESOAPHTTPExceptionHelper }

function ESOAPHTTPExceptionHelper.GetStatusCode: Integer;
var
  i1: Integer;
  i2: Integer;
begin
  Result := 0;
  try
    i1 := Message.IndexOf(' (');
    if i1 >= 0 then
    begin
      i2 := Message.IndexOf(') - ''', i1 + 2);
      if i2 >= 0 then
        Result := Message.Substring(i1 + 2, i2 - i1 - 2).ToInteger;
    end;
  except
    ; // nothing
  end;
end;

end.
