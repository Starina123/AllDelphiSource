unit RServer_TLB;

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
// File generated on 6/24/99 8:08:50 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\ADO\demos\RDS\RDSServer.tlb (1)
// IID\LCID: {3C464A20-1DB2-11D3-931D-00C04FB17A5E}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v2.1 ADODB, (C:\PROGRAM FILES\COMMON FILES\SYSTEM\ADO\msado15.dll)
//   (3) v4.0 StdVCL, (D:\TP\BIN\STDVCL40.DLL)
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  ADODB_TLB;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  RServerMajorVersion = 1;
  RServerMinorVersion = 0;

  LIBID_RServer: TGUID = '{3C464A20-1DB2-11D3-931D-00C04FB17A5E}';

  IID_IRDSAppServer: TGUID = '{3C464A21-1DB2-11D3-931D-00C04FB17A5E}';
  CLASS_RDSAppServer: TGUID = '{3C464A23-1DB2-11D3-931D-00C04FB17A5E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDSAppServer = interface;
  IRDSAppServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDSAppServer = IRDSAppServer;


// *********************************************************************//
// Interface: IRDSAppServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3C464A21-1DB2-11D3-931D-00C04FB17A5E}
// *********************************************************************//
  IRDSAppServer = interface(IDispatch)
    ['{3C464A21-1DB2-11D3-931D-00C04FB17A5E}']
    function  Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:6}: _Recordset; safecall;
    property Employee: _Recordset read Get_Employee;
  end;

// *********************************************************************//
// DispIntf:  IRDSAppServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3C464A21-1DB2-11D3-931D-00C04FB17A5E}
// *********************************************************************//
  IRDSAppServerDisp = dispinterface
    ['{3C464A21-1DB2-11D3-931D-00C04FB17A5E}']
    property Employee {Flags(2), (1/0) CC:0, INV:2, DBG:6}: _Recordset readonly dispid 3;
  end;

// *********************************************************************//
// The Class CoRDSAppServer provides a Create and CreateRemote method to          
// create instances of the default interface IRDSAppServer exposed by              
// the CoClass RDSAppServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDSAppServer = class
    class function Create: IRDSAppServer;
    class function CreateRemote(const MachineName: string): IRDSAppServer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRDSAppServer
// Help String      : RDSAppServer Object
// Default Interface: IRDSAppServer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRDSAppServerProperties= class;
{$ENDIF}
  TRDSAppServer = class(TOleServer)
  private
    FIntf:        IRDSAppServer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRDSAppServerProperties;
    function      GetServerProperties: TRDSAppServerProperties;
{$ENDIF}
    function      GetDefaultInterface: IRDSAppServer;
  protected
    procedure InitServerData; override;
  {CoClassWriteArrayPropMethods}
// StdProp:
    function  Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:3}: _Recordset;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRDSAppServer);
    procedure Disconnect; override;
  {CoClassWriteMethods}
    property  DefaultInterface: IRDSAppServer read GetDefaultInterface;
  {CoClassWriteProperties}
    property Employee {Flags(2), (1/0) CC:0, INV:2, DBG:2}: _Recordset read Get_Employee;
  {CoClassWriteProperties}
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRDSAppServerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRDSAppServer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRDSAppServerProperties = class(TPersistent)
  private
    FServer:    TRDSAppServer;
    function    GetDefaultInterface: IRDSAppServer;
    constructor Create(AServer: TRDSAppServer);
  protected
// StdProp:
    function  Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:3}: _Recordset;
  public
    property DefaultInterface: IRDSAppServer read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoRDSAppServer.Create: IRDSAppServer;
begin
  Result := CreateComObject(CLASS_RDSAppServer) as IRDSAppServer;
end;

class function CoRDSAppServer.CreateRemote(const MachineName: string): IRDSAppServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDSAppServer) as IRDSAppServer;
end;

procedure TRDSAppServer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3C464A23-1DB2-11D3-931D-00C04FB17A5E}';
    IntfIID:   '{3C464A21-1DB2-11D3-931D-00C04FB17A5E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRDSAppServer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRDSAppServer;
  end;
end;

procedure TRDSAppServer.ConnectTo(svrIntf: IRDSAppServer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRDSAppServer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRDSAppServer.GetDefaultInterface: IRDSAppServer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRDSAppServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRDSAppServerProperties.Create(Self);
{$ENDIF}
end;

destructor TRDSAppServer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRDSAppServer.GetServerProperties: TRDSAppServerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

// StdProp:
function  TRDSAppServer.Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:3}: _Recordset;
begin
  Result := DefaultInterface.Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:7};
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRDSAppServerProperties.Create(AServer: TRDSAppServer);
begin
  inherited Create;
  FServer := AServer;
end;

function TRDSAppServerProperties.GetDefaultInterface: IRDSAppServer;
begin
  Result := FServer.DefaultInterface;
end;

// StdProp:
function  TRDSAppServerProperties.Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:3}: _Recordset;
begin
  Result := DefaultInterface.Get_Employee {Flags(1), (1/0) CC:0, INV:2, DBG:7};
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TRDSAppServer]);
end;

end.
