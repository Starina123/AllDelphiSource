unit Serv_TLB;

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

// PASTLWTR : $Revision:   1.51  $
// File generated on 4/9/99 12:52:35 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\SETPARAM\Server.tlb
// IID\LCID: {518F9D60-F90A-11D0-9FFC-00A0248E4B9A}\0
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
  LIBID_Serv: TGUID = '{518F9D60-F90A-11D0-9FFC-00A0248E4B9A}';
  IID_ISetParamDemo: TGUID = '{518F9D63-F90A-11D0-9FFC-00A0248E4B9A}';
  CLASS_SetParamDemo: TGUID = '{518F9D64-F90A-11D0-9FFC-00A0248E4B9A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISetParamDemo = interface;
  ISetParamDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SetParamDemo = ISetParamDemo;


// *********************************************************************//
// Interface: ISetParamDemo
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {518F9D63-F90A-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  ISetParamDemo = interface(IAppServer)
    ['{518F9D63-F90A-11D0-9FFC-00A0248E4B9A}']
  end;

// *********************************************************************//
// DispIntf:  ISetParamDemoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {518F9D63-F90A-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  ISetParamDemoDisp = dispinterface
    ['{518F9D63-F90A-11D0-9FFC-00A0248E4B9A}']
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
// The Class CoSetParamDemo provides a Create and CreateRemote method to          
// create instances of the default interface ISetParamDemo exposed by              
// the CoClass SetParamDemo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSetParamDemo = class
    class function Create: ISetParamDemo;
    class function CreateRemote(const MachineName: string): ISetParamDemo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSetParamDemo
// Help String      : SetParamDemoObject
// Default Interface: ISetParamDemo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TSetParamDemo = class(TOleServer)
  private
    FIntf:        ISetParamDemo;
    function      GetDefaultInterface: ISetParamDemo;

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
    property  DefaultInterface: ISetParamDemo read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoSetParamDemo.Create: ISetParamDemo;
begin
  Result := CreateComObject(CLASS_SetParamDemo) as ISetParamDemo;
end;

class function CoSetParamDemo.CreateRemote(const MachineName: string): ISetParamDemo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SetParamDemo) as ISetParamDemo;
end;

procedure TSetParamDemo.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{518F9D64-F90A-11D0-9FFC-00A0248E4B9A}';
    EventIID: '';
    LicenseKey: nil;
    Version: 401);

begin
  ServerData := @CServerData;
end;

procedure TSetParamDemo.Connect;
begin
  if FIntf = nil then
  begin
    FIntf := CoSetParamDemo.Create;
  end;
end;

procedure TSetParamDemo.DisConnect;
begin
  FIntf := nil;
end;


function TSetParamDemo.GetDefaultInterface: ISetParamDemo;
begin
  Connect;
  Result := FIntf;
end;

function  TSetParamDemo.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                        MaxErrors: Integer; out ErrorCount: Integer; 
                                        var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TSetParamDemo.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                      out RecsOut: Integer; Options: Integer; 
                                      const CommandText: WideString; var Params: OleVariant; 
                                      var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TSetParamDemo.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TSetParamDemo.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TSetParamDemo.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TSetParamDemo.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                      RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TSetParamDemo.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                   var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TSetParamDemo]);
end;

end.
