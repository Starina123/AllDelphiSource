unit serv_tlb;

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

// PASTLWTR : $Revision:   1.1  $
// File generated on 4/22/99 7:17:33 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\ADHOC\server.tlb (1)
// IID\LCID: {85C677A0-F92F-11D0-9FFC-00A0248E4B9A}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (D:\tp5\bin\midas.dll)
//   (2) v4.0 StdVCL, (D:\TP\bin\stdvcl40.dll)
//   (3) v2.0 stdole, (C:\WINNTS\system32\stdole2.tlb)
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  LIBID_Serv: TGUID = '{85C677A0-F92F-11D0-9FFC-00A0248E4B9A}';
  IID_IAdHocQueryDemo: TGUID = '{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}';
  CLASS_AdHocQueryDemo: TGUID = '{85C677A2-F92F-11D0-9FFC-00A0248E4B9A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAdHocQueryDemo = interface;
  IAdHocQueryDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AdHocQueryDemo = IAdHocQueryDemo;


// *********************************************************************//
// Interface: IAdHocQueryDemo
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {85C677A1-F92F-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IAdHocQueryDemo = interface(IAppServer)
    ['{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}']
    function  GetDatabaseNames: OleVariant; safecall;
    procedure SetDatabaseName(const DBName: WideString; const Password: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAdHocQueryDemoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {85C677A1-F92F-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IAdHocQueryDemoDisp = dispinterface
    ['{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}']
    function  GetDatabaseNames: OleVariant; dispid 2;
    procedure SetDatabaseName(const DBName: WideString; const Password: WideString); dispid 3;
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

// *********************************************************************//
// The Class CoAdHocQueryDemo provides a Create and CreateRemote method to          
// create instances of the default interface IAdHocQueryDemo exposed by              
// the CoClass AdHocQueryDemo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAdHocQueryDemo = class
    class function Create: IAdHocQueryDemo;
    class function CreateRemote(const MachineName: string): IAdHocQueryDemo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdHocQueryDemo
// Help String      : AdHocQueryDemoObject
// Default Interface: IAdHocQueryDemo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAdHocQueryDemoProperties= class;
  TAdHocQueryDemo = class(TOleServer)
  private
    FIntf:        IAdHocQueryDemo;
    FProps:       TAdHocQueryDemoProperties;
    function      GetDefaultInterface: IAdHocQueryDemo;
    function      GetServerProperties: TAdHocQueryDemoProperties;
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
    function  GetDatabaseNames: OleVariant;
    procedure SetDatabaseName(const DBName: WideString; const Password: WideString);
    property  DefaultInterface: IAdHocQueryDemo read GetDefaultInterface;
  published
    property Server: TAdHocQueryDemoProperties read GetServerProperties;
  end;

// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdHocQueryDemo
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdHocQueryDemoProperties = class(TPersistent)
  private
    FServer:    TAdHocQueryDemo;
    function    GetDefaultInterface: IAdHocQueryDemo;
    constructor Create(AServer: TAdHocQueryDemo);
  protected
  public
    property DefaultInterface: IAdHocQueryDemo read GetDefaultInterface;
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoAdHocQueryDemo.Create: IAdHocQueryDemo;
begin
  Result := CreateComObject(CLASS_AdHocQueryDemo) as IAdHocQueryDemo;
end;

class function CoAdHocQueryDemo.CreateRemote(const MachineName: string): IAdHocQueryDemo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AdHocQueryDemo) as IAdHocQueryDemo;
end;

procedure TAdHocQueryDemo.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{85C677A2-F92F-11D0-9FFC-00A0248E4B9A}';
    IntfIID:   '{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdHocQueryDemo.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAdHocQueryDemo;
  end;
end;

procedure TAdHocQueryDemo.DisConnect;
begin
  FIntf := nil;
end;


function TAdHocQueryDemo.GetDefaultInterface: IAdHocQueryDemo;
begin
  Connect;
  Result := FIntf;
end;

constructor TAdHocQueryDemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FProps := TAdHocQueryDemoProperties.Create(Self);
end;
destructor TAdHocQueryDemo.Destroy;
begin
  FProps.Free;
  inherited Destroy;
end;
function TAdHocQueryDemo.GetServerProperties: TAdHocQueryDemoProperties;
begin
  Result := FProps;
end;

function  TAdHocQueryDemo.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                          MaxErrors: Integer; out ErrorCount: Integer; 
                                          var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TAdHocQueryDemo.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                        out RecsOut: Integer; Options: Integer; 
                                        const CommandText: WideString; var Params: OleVariant; 
                                        var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TAdHocQueryDemo.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TAdHocQueryDemo.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TAdHocQueryDemo.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TAdHocQueryDemo.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                        RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TAdHocQueryDemo.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                     var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

function  TAdHocQueryDemo.GetDatabaseNames: OleVariant;
begin
  Result := DefaultInterface.GetDatabaseNames;
end;

procedure TAdHocQueryDemo.SetDatabaseName(const DBName: WideString; const Password: WideString);
begin
  DefaultInterface.SetDatabaseName(DBName, Password);
end;

constructor TAdHocQueryDemoProperties.Create(AServer: TAdHocQueryDemo);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdHocQueryDemoProperties.GetDefaultInterface: IAdHocQueryDemo;
begin
  Result := FServer.DefaultInterface;
end;
procedure Register;
begin
  RegisterComponents('Servers',[TAdHocQueryDemo]);
end;

end.
