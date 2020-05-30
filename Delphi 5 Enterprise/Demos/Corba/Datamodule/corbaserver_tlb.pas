unit CORBAServer_TLB;

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

// PASTLWTR : $Revision:   1.68  $
// File generated on 5/6/99 11:18:43 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\delphi4\Demos\Corba\Datamodule\corbaserver.tlb (1)
// IID\LCID: {16076F24-0184-11D2-AAA3-00C04FA368D1}\0
// Helpfile: 
// DepndLst: 
//   (1) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
//   (2) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
//   (3) v1.0 Midas, (E:\tp\bin\midas.dll)
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, SysUtils, CORBAObj, OrbPas, CorbaStd, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  LIBID_CORBAServer: TGUID = '{16076F24-0184-11D2-AAA3-00C04FA368D1}';
  IID_IDemoCORBA: TGUID = '{16076F25-0184-11D2-AAA3-00C04FA368D1}';
  CLASS_DemoCORBA: TGUID = '{16076F27-0184-11D2-AAA3-00C04FA368D1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDemoCORBA = interface;
  IDemoCORBADisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DemoCORBA = IDemoCORBA;


// *********************************************************************//
// Interface: IDemoCORBA
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16076F25-0184-11D2-AAA3-00C04FA368D1}
// *********************************************************************//
  IDemoCORBA = interface(IAppServer)
    ['{16076F25-0184-11D2-AAA3-00C04FA368D1}']
  end;

// *********************************************************************//
// DispIntf:  IDemoCORBADisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16076F25-0184-11D2-AAA3-00C04FA368D1}
// *********************************************************************//
  IDemoCORBADisp = dispinterface
    ['{16076F25-0184-11D2-AAA3-00C04FA368D1}']
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

  TDemoCORBAStub = class(TAppServerStub, IDemoCORBA)
  public
  end;

  TDemoCORBASkeleton = class(TAppServerSkeleton)
  private
    FIntf: IDemoCORBA;
  public
    constructor Create(const InstanceName: string; const Impl: IUnknown); override;
    procedure GetImplementation(out Impl: IUnknown); override; stdcall;
  published
  end;

// *********************************************************************//
// The Class CoDemoCORBA provides a Create and CreateRemote method to          
// create instances of the default interface IDemoCORBA exposed by              
// the CoClass DemoCORBA. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDemoCORBA = class
    class function Create: IDemoCORBA;
    class function CreateRemote(const MachineName: string): IDemoCORBA;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDemoCORBA
// Help String      : DemoCORBA Object
// Default Interface: IDemoCORBA
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDemoCORBAProperties= class;
{$ENDIF}
  TDemoCORBA = class(TOleServer)
  private
    FIntf:        IDemoCORBA;
    function      GetDefaultInterface: IDemoCORBA;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDemoCORBAProperties;
    function      GetServerProperties: TDemoCORBAProperties;
{$ENDIF}
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure Disconnect; override;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
    function  AS_GetProviderNames: OleVariant;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant);
    property  DefaultInterface: IDemoCORBA read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDemoCORBAProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDemoCORBA
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDemoCORBAProperties = class(TPersistent)
  private
    FServer:    TDemoCORBA;
    function    GetDefaultInterface: IDemoCORBA;
    constructor Create(AServer: TDemoCORBA);
  protected
  public
    property DefaultInterface: IDemoCORBA read GetDefaultInterface;
  published
  end;
{$ENDIF}


  TDemoCORBACorbaFactory = class
    class function CreateInstance(const InstanceName: string): IDemoCORBA;
  end;

procedure Register;

implementation

uses ComObj;

{ TDemoCORBAStub }

{ TDemoCORBASkeleton }

constructor TDemoCORBASkeleton.Create(const InstanceName: string; const Impl: IUnknown);
begin
  inherited;
  inherited InitSkeleton('DemoCORBA', InstanceName, 'IDL:CORBAServer/IDemoCORBA:1.0', tmMultiThreaded, True);
  FIntf := Impl as IDemoCORBA;
end;

procedure TDemoCORBASkeleton.GetImplementation(out Impl: IUnknown);
begin
  Impl := FIntf;
end;

class function CoDemoCORBA.Create: IDemoCORBA;
begin
  Result := CreateComObject(CLASS_DemoCORBA) as IDemoCORBA;
end;

class function CoDemoCORBA.CreateRemote(const MachineName: string): IDemoCORBA;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DemoCORBA) as IDemoCORBA;
end;

procedure TDemoCORBA.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{16076F27-0184-11D2-AAA3-00C04FA368D1}';
    IntfIID:   '{16076F25-0184-11D2-AAA3-00C04FA368D1}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDemoCORBA.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDemoCORBA;
  end;
end;

procedure TDemoCORBA.DisConnect;
begin
  FIntf := nil;
end;

function TDemoCORBA.GetDefaultInterface: IDemoCORBA;
begin
  Connect;
  Result := FIntf;
end;

constructor TDemoCORBA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDemoCORBAProperties.Create(Self);
{$ENDIF}
end;

destructor TDemoCORBA.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDemoCORBA.GetServerProperties: TDemoCORBAProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TDemoCORBA.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                     MaxErrors: Integer; out ErrorCount: Integer; 
                                     var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TDemoCORBA.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                   out RecsOut: Integer; Options: Integer; 
                                   const CommandText: WideString; var Params: OleVariant; 
                                   var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TDemoCORBA.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TDemoCORBA.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TDemoCORBA.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TDemoCORBA.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                   RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TDemoCORBA.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDemoCORBAProperties.Create(AServer: TDemoCORBA);
begin
  inherited Create;
  FServer := AServer;
end;

function TDemoCORBAProperties.GetDefaultInterface: IDemoCORBA;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function TDemoCORBACorbaFactory.CreateInstance(const InstanceName: string): IDemoCORBA;
begin
  Result := CorbaFactoryCreateStub('IDL:CORBAServer/DemoCORBAFactory:1.0', 'DemoCORBA',
    InstanceName, '', IDemoCORBA) as IDemoCORBA;
end;

procedure Register;
begin
  RegisterComponents('Servers',[TDemoCORBA]);
end;

initialization
  CorbaStubManager.RegisterStub(IDemoCORBA, TDemoCORBAStub);
  CorbaInterfaceIDManager.RegisterInterface(IDemoCORBA, 'IDL:CORBAServer/IDemoCORBA:1.0');
  CorbaSkeletonManager.RegisterSkeleton(IDemoCORBA, TDemoCORBASkeleton);

end.
