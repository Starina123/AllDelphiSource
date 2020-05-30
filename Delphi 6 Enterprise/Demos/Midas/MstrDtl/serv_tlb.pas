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
// File generated on 4/9/99 12:46:31 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\MSTRDTL\server.tlb
// IID\LCID: {F409BC30-963E-11D0-880E-00A0248E5091}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNTS\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (D:\TP\bin\stdvcl40.dll)
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
  LIBID_Serv: TGUID = '{F409BC30-963E-11D0-880E-00A0248E5091}';
  IID_IProjectData: TGUID = '{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}';
  CLASS_ProjectData: TGUID = '{F409BC32-963E-11D0-880E-00A0248E5091}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IProjectData = interface;
  IProjectDataDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ProjectData = IProjectData;


// *********************************************************************//
// Interface: IProjectData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}
// *********************************************************************//
  IProjectData = interface(IAppServer)
    ['{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}']
  end;

// *********************************************************************//
// DispIntf:  IProjectDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}
// *********************************************************************//
  IProjectDataDisp = dispinterface
    ['{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}']
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
// The Class CoProjectData provides a Create and CreateRemote method to          
// create instances of the default interface IProjectData exposed by              
// the CoClass ProjectData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoProjectData = class
    class function Create: IProjectData;
    class function CreateRemote(const MachineName: string): IProjectData;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TProjectData
// Help String      : ProjectDataObject
// Default Interface: IProjectData
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TProjectData = class(TOleServer)
  private
    FIntf:        IProjectData;
    function      GetDefaultInterface: IProjectData;

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
    property  DefaultInterface: IProjectData read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoProjectData.Create: IProjectData;
begin
  Result := CreateComObject(CLASS_ProjectData) as IProjectData;
end;

class function CoProjectData.CreateRemote(const MachineName: string): IProjectData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ProjectData) as IProjectData;
end;

procedure TProjectData.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{F409BC32-963E-11D0-880E-00A0248E5091}';
    EventIID: '';
    LicenseKey: nil;
    Version: 401);

begin
  ServerData := @CServerData;
end;

procedure TProjectData.Connect;
begin
  if FIntf = nil then
  begin
    FIntf := CoProjectData.Create;
  end;
end;

procedure TProjectData.DisConnect;
begin
  FIntf := nil;
end;


function TProjectData.GetDefaultInterface: IProjectData;
begin
  Connect;
  Result := FIntf;
end;

function  TProjectData.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                       MaxErrors: Integer; out ErrorCount: Integer; 
                                       var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TProjectData.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                     out RecsOut: Integer; Options: Integer; 
                                     const CommandText: WideString; var Params: OleVariant; 
                                     var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TProjectData.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TProjectData.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TProjectData.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TProjectData.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                     RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TProjectData.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                  var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TProjectData]);
end;

end.
