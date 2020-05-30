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
// File generated on 4/9/99 12:24:47 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\EMPEDIT\server.tlb
// IID\LCID: {53BC6560-5B3E-11D0-9FFC-00A0248E4B9A}\0
// Helpfile: 
// DepndLst: 
//   (1) v4.0 StdVCL, (D:\TP\bin\stdvcl40.dll)
//   (2) v2.0 stdole, (C:\WINNTS\system32\stdole2.tlb)
//   (3) v1.0 Midas, (D:\tp5\bin\midas.dll)
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
  LIBID_Serv: TGUID = '{53BC6560-5B3E-11D0-9FFC-00A0248E4B9A}';
  IID_IEmpServer: TGUID = '{53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}';
  CLASS_EmpServer: TGUID = '{53BC6562-5B3E-11D0-9FFC-00A0248E4B9A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IEmpServer = interface;
  IEmpServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  EmpServer = IEmpServer;


// *********************************************************************//
// Interface: IEmpServer
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IEmpServer = interface(IAppServer)
    ['{53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}']
  end;

// *********************************************************************//
// DispIntf:  IEmpServerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IEmpServerDisp = dispinterface
    ['{53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}']
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
// The Class CoEmpServer provides a Create and CreateRemote method to          
// create instances of the default interface IEmpServer exposed by              
// the CoClass EmpServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEmpServer = class
    class function Create: IEmpServer;
    class function CreateRemote(const MachineName: string): IEmpServer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TEmpServer
// Help String      : EmpServerObject
// Default Interface: IEmpServer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TEmpServer = class(TOleServer)
  private
    FIntf:        IEmpServer;
    function      GetDefaultInterface: IEmpServer;

  protected
    procedure InitServerData; override;
  public
    procedure Connect; override;
    procedure Disconnect; override;
  // --------------
  // --------------
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
  // --------------
    property  DefaultInterface: IEmpServer read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoEmpServer.Create: IEmpServer;
begin
  Result := CreateComObject(CLASS_EmpServer) as IEmpServer;
end;

class function CoEmpServer.CreateRemote(const MachineName: string): IEmpServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EmpServer) as IEmpServer;
end;

procedure TEmpServer.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{53BC6562-5B3E-11D0-9FFC-00A0248E4B9A}';
    EventIID: '';
    LicenseKey: nil;
    Version: 401);

begin
  ServerData := @CServerData;
end;

procedure TEmpServer.Connect;
begin
  if FIntf = nil then
  begin
    FIntf := CoEmpServer.Create;
  end;
end;

procedure TEmpServer.DisConnect;
begin
  FIntf := nil;
end;


function TEmpServer.GetDefaultInterface: IEmpServer;
begin
  Connect;
  Result := FIntf;
end;

function  TEmpServer.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                     MaxErrors: Integer; out ErrorCount: Integer; 
                                     var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TEmpServer.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                   out RecsOut: Integer; Options: Integer; 
                                   const CommandText: WideString; var Params: OleVariant; 
                                   var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TEmpServer.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TEmpServer.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TEmpServer.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TEmpServer.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                   RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TEmpServer.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TEmpServer]);
end;

end.
