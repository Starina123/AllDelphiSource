unit server_tlb;

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
// File generated on 4/9/99 12:42:52 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\LOGIN\Server.tlb
// IID\LCID: {5E6A5BD2-F709-11D1-AABE-00C04FA35CFA}\0
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
  LIBID_Server: TGUID = '{5E6A5BD2-F709-11D1-AABE-00C04FA35CFA}';
  IID_ILoginDemo: TGUID = '{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}';
  CLASS_LoginDemo: TGUID = '{5E6A5BD5-F709-11D1-AABE-00C04FA35CFA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ILoginDemo = interface;
  ILoginDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  LoginDemo = ILoginDemo;


// *********************************************************************//
// Interface: ILoginDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  ILoginDemo = interface(IAppServer)
    ['{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}']
    procedure Login(const UserName: WideString; const Password: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ILoginDemoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  ILoginDemoDisp = dispinterface
    ['{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}']
    procedure Login(const UserName: WideString; const Password: WideString); dispid 2;
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
// The Class CoLoginDemo provides a Create and CreateRemote method to          
// create instances of the default interface ILoginDemo exposed by              
// the CoClass LoginDemo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLoginDemo = class
    class function Create: ILoginDemo;
    class function CreateRemote(const MachineName: string): ILoginDemo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TLoginDemo
// Help String      : LoginDemo Object
// Default Interface: ILoginDemo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
  TLoginDemo = class(TOleServer)
  private
    FIntf:        ILoginDemo;
    function      GetDefaultInterface: ILoginDemo;

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
    procedure Login(const UserName: WideString; const Password: WideString);
  // --------------
    property  DefaultInterface: ILoginDemo read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoLoginDemo.Create: ILoginDemo;
begin
  Result := CreateComObject(CLASS_LoginDemo) as ILoginDemo;
end;

class function CoLoginDemo.CreateRemote(const MachineName: string): ILoginDemo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LoginDemo) as ILoginDemo;
end;

procedure TLoginDemo.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{5E6A5BD5-F709-11D1-AABE-00C04FA35CFA}';
    EventIID: '';
    LicenseKey: nil;
    Version: 401);

begin
  ServerData := @CServerData;
end;

procedure TLoginDemo.Connect;
begin
  if FIntf = nil then
  begin
    FIntf := CoLoginDemo.Create;
  end;
end;

procedure TLoginDemo.DisConnect;
begin
  FIntf := nil;
end;


function TLoginDemo.GetDefaultInterface: ILoginDemo;
begin
  Connect;
  Result := FIntf;
end;

function  TLoginDemo.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                     MaxErrors: Integer; out ErrorCount: Integer; 
                                     var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TLoginDemo.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                   out RecsOut: Integer; Options: Integer; 
                                   const CommandText: WideString; var Params: OleVariant; 
                                   var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TLoginDemo.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TLoginDemo.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TLoginDemo.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TLoginDemo.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                   RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TLoginDemo.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure TLoginDemo.Login(const UserName: WideString; const Password: WideString);
begin
  DefaultInterface.Login(UserName, Password);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TLoginDemo]);
end;

end.
