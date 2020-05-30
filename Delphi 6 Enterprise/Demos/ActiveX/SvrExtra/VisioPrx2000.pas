unit VisioPrx2000;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.0  $
// File generated on 12/15/2000 12:02:23 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: ..\typelibraries\VisPrx32.tlb (1)
// IID\LCID: {CC5B3B23-74F8-11D3-A07E-00C04F689078}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TVisioAutomationProxy) : Server D:\Program Files\Visio\VisPrx32.dll contains no icons
//   Error creating palette bitmap of (TVisioAutomationEventSink) : Server D:\Program Files\Visio\VisPrx32.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, OleServer;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  VisPrx32MajorVersion = 6;
  VisPrx32MinorVersion = 0;

  LIBID_VisPrx32: TGUID = '{CC5B3B23-74F8-11D3-A07E-00C04F689078}';

  CLASS_VisioAutomationProxy: TGUID = '{00021A03-0000-0000-C000-000000000046}';
  CLASS_VisioAutomationEventSink: TGUID = '{00021A90-0000-0000-C000-000000000046}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  VisioAutomationProxy = IUnknown;
  VisioAutomationEventSink = IUnknown;


// *********************************************************************//
// The Class CoVisioAutomationProxy provides a Create and CreateRemote method to          
// create instances of the default interface IUnknown exposed by              
// the CoClass VisioAutomationProxy. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioAutomationProxy = class
    class function Create: IUnknown;
    class function CreateRemote(const MachineName: string): IUnknown;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioAutomationProxy
// Help String      : Visio Automation Support -- provided for backward binary compatibility ONLY. DO NOT use this object in new code.
// Default Interface: IUnknown
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioAutomationProxyProperties= class;
{$ENDIF}
  TVisioAutomationProxy = class(TOleServer)
  private
    FIntf:        IUnknown;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioAutomationProxyProperties;
    function      GetServerProperties: TVisioAutomationProxyProperties;
{$ENDIF}
    function      GetDefaultInterface: IUnknown;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUnknown);
    procedure Disconnect; override;
    property  DefaultInterface: IUnknown read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioAutomationProxyProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioAutomationProxy
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioAutomationProxyProperties = class(TPersistent)
  private
    FServer:    TVisioAutomationProxy;
    function    GetDefaultInterface: IUnknown;
    constructor Create(AServer: TVisioAutomationProxy);
  protected
  public
    property DefaultInterface: IUnknown read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoVisioAutomationEventSink provides a Create and CreateRemote method to          
// create instances of the default interface IUnknown exposed by              
// the CoClass VisioAutomationEventSink. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioAutomationEventSink = class
    class function Create: IUnknown;
    class function CreateRemote(const MachineName: string): IUnknown;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioAutomationEventSink
// Help String      : Visio Event Sink Support -- provided for backward binary compatibility ONLY. DO NOT use this object in new code.
// Default Interface: IUnknown
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioAutomationEventSinkProperties= class;
{$ENDIF}
  TVisioAutomationEventSink = class(TOleServer)
  private
    FIntf:        IUnknown;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioAutomationEventSinkProperties;
    function      GetServerProperties: TVisioAutomationEventSinkProperties;
{$ENDIF}
    function      GetDefaultInterface: IUnknown;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUnknown);
    procedure Disconnect; override;
    property  DefaultInterface: IUnknown read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioAutomationEventSinkProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioAutomationEventSink
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioAutomationEventSinkProperties = class(TPersistent)
  private
    FServer:    TVisioAutomationEventSink;
    function    GetDefaultInterface: IUnknown;
    constructor Create(AServer: TVisioAutomationEventSink);
  protected
  public
    property DefaultInterface: IUnknown read GetDefaultInterface;
  published
  end;
{$ENDIF}

implementation

uses ComObj;

class function CoVisioAutomationProxy.Create: IUnknown;
begin
  Result := CreateComObject(CLASS_VisioAutomationProxy) as IUnknown;
end;

class function CoVisioAutomationProxy.CreateRemote(const MachineName: string): IUnknown;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioAutomationProxy) as IUnknown;
end;

procedure TVisioAutomationProxy.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00021A03-0000-0000-C000-000000000046}';
    IntfIID:   '{00000000-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioAutomationProxy.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUnknown;
  end;
end;

procedure TVisioAutomationProxy.ConnectTo(svrIntf: IUnknown);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioAutomationProxy.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioAutomationProxy.GetDefaultInterface: IUnknown;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioAutomationProxy.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioAutomationProxyProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioAutomationProxy.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioAutomationProxy.GetServerProperties: TVisioAutomationProxyProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioAutomationProxyProperties.Create(AServer: TVisioAutomationProxy);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioAutomationProxyProperties.GetDefaultInterface: IUnknown;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoVisioAutomationEventSink.Create: IUnknown;
begin
  Result := CreateComObject(CLASS_VisioAutomationEventSink) as IUnknown;
end;

class function CoVisioAutomationEventSink.CreateRemote(const MachineName: string): IUnknown;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioAutomationEventSink) as IUnknown;
end;

procedure TVisioAutomationEventSink.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00021A90-0000-0000-C000-000000000046}';
    IntfIID:   '{00000000-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioAutomationEventSink.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUnknown;
  end;
end;

procedure TVisioAutomationEventSink.ConnectTo(svrIntf: IUnknown);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioAutomationEventSink.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioAutomationEventSink.GetDefaultInterface: IUnknown;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioAutomationEventSink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioAutomationEventSinkProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioAutomationEventSink.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioAutomationEventSink.GetServerProperties: TVisioAutomationEventSinkProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioAutomationEventSinkProperties.Create(AServer: TVisioAutomationEventSink);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioAutomationEventSinkProperties.GetDefaultInterface: IUnknown;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

end.
