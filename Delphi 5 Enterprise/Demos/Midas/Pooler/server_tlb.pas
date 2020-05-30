unit Server_TLB;

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

// PASTLWTR : $Revision:   1.55  $
// File generated on 4/15/99 7:04:39 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\POOLER\Server.tlb (1)
// IID\LCID: {0CE99800-9F28-11D1-8944-00A0248E5091}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (D:\tp5\bin\midas.dll)
//   (2) v2.0 stdole, (C:\WINNTS\system32\stdole2.tlb)
//   (3) v4.0 StdVCL, (D:\TP\bin\stdvcl40.dll)
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
  LIBID_Server: TGUID = '{0CE99800-9F28-11D1-8944-00A0248E5091}';
  IID_IPooledRDM: TGUID = '{0CE99801-9F28-11D1-8944-00A0248E5091}';
  CLASS_PooledRDM: TGUID = '{0CE99802-9F28-11D1-8944-00A0248E5091}';
  CLASS_Pooler: TGUID = '{0CE99804-9F28-11D1-8944-00A0248E5091}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IPooledRDM = interface;
  IPooledRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PooledRDM = IPooledRDM;
  Pooler = IPooledRDM;


// *********************************************************************//
// Interface: IPooledRDM
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CE99801-9F28-11D1-8944-00A0248E5091}
// *********************************************************************//
  IPooledRDM = interface(IAppServer)
    ['{0CE99801-9F28-11D1-8944-00A0248E5091}']
  end;

// *********************************************************************//
// DispIntf:  IPooledRDMDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CE99801-9F28-11D1-8944-00A0248E5091}
// *********************************************************************//
  IPooledRDMDisp = dispinterface
    ['{0CE99801-9F28-11D1-8944-00A0248E5091}']
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
// The Class CoPooledRDM provides a Create and CreateRemote method to          
// create instances of the default interface IPooledRDM exposed by              
// the CoClass PooledRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPooledRDM = class
    class function Create: IPooledRDM;
    class function CreateRemote(const MachineName: string): IPooledRDM;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPooledRDM
// Help String      : CoClass for the RDM that is to be pooled.
// Default Interface: IPooledRDM
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TPooledRDM = class(TOleServer)
  private
    FIntf:        IPooledRDM;
    function      GetDefaultInterface: IPooledRDM;

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
    property  DefaultInterface: IPooledRDM read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

// *********************************************************************//
// The Class CoPooler provides a Create and CreateRemote method to          
// create instances of the default interface IPooledRDM exposed by              
// the CoClass Pooler. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPooler = class
    class function Create: IPooledRDM;
    class function CreateRemote(const MachineName: string): IPooledRDM;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPooler
// Help String      : CoClass for the pooler object.
// Default Interface: IPooledRDM
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TPooler = class(TOleServer)
  private
    FIntf:        IPooledRDM;
    function      GetDefaultInterface: IPooledRDM;

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
    property  DefaultInterface: IPooledRDM read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoPooledRDM.Create: IPooledRDM;
begin
  Result := CreateComObject(CLASS_PooledRDM) as IPooledRDM;
end;

class function CoPooledRDM.CreateRemote(const MachineName: string): IPooledRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PooledRDM) as IPooledRDM;
end;

procedure TPooledRDM.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0CE99802-9F28-11D1-8944-00A0248E5091}';
    IntfIID:   '{0CE99801-9F28-11D1-8944-00A0248E5091}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPooledRDM.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPooledRDM;
  end;
end;

procedure TPooledRDM.DisConnect;
begin
  FIntf := nil;
end;


function TPooledRDM.GetDefaultInterface: IPooledRDM;
begin
  Connect;
  Result := FIntf;
end;

function  TPooledRDM.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                     MaxErrors: Integer; out ErrorCount: Integer; 
                                     var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TPooledRDM.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                   out RecsOut: Integer; Options: Integer; 
                                   const CommandText: WideString; var Params: OleVariant; 
                                   var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TPooledRDM.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TPooledRDM.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TPooledRDM.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TPooledRDM.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                   RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TPooledRDM.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

class function CoPooler.Create: IPooledRDM;
begin
  Result := CreateComObject(CLASS_Pooler) as IPooledRDM;
end;

class function CoPooler.CreateRemote(const MachineName: string): IPooledRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Pooler) as IPooledRDM;
end;

procedure TPooler.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0CE99804-9F28-11D1-8944-00A0248E5091}';
    IntfIID:   '{0CE99801-9F28-11D1-8944-00A0248E5091}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPooler.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPooledRDM;
  end;
end;

procedure TPooler.DisConnect;
begin
  FIntf := nil;
end;


function TPooler.GetDefaultInterface: IPooledRDM;
begin
  Connect;
  Result := FIntf;
end;

function  TPooler.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                  MaxErrors: Integer; out ErrorCount: Integer; 
                                  var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TPooler.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                out RecsOut: Integer; Options: Integer; 
                                const CommandText: WideString; var Params: OleVariant; 
                                var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TPooler.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TPooler.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TPooler.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TPooler.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TPooler.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                             var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TPooledRDM, TPooler]);
end;

end.
