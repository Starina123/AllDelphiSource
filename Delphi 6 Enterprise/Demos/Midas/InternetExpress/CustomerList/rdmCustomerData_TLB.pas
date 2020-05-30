unit rdmCustomerData_TLB;

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
// File generated on 6/30/99 3:49:26 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: E:\ngdemo\rdmCustomerData.tlb (1)
// IID\LCID: {930FAEE0-0DC1-11D3-AA8A-00A024C11562}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (E:\tp\bin\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
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
  // TypeLibrary Major and minor versions
  rdmCustomerDataMajorVersion = 1;
  rdmCustomerDataMinorVersion = 0;

  LIBID_rdmCustomerData: TGUID = '{930FAEE0-0DC1-11D3-AA8A-00A024C11562}';

  IID_ICustomerData: TGUID = '{930FAEE1-0DC1-11D3-AA8A-00A024C11562}';
  CLASS_CustomerData: TGUID = '{930FAEE3-0DC1-11D3-AA8A-00A024C11562}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICustomerData = interface;
  ICustomerDataDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CustomerData = ICustomerData;


// *********************************************************************//
// Interface: ICustomerData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {930FAEE1-0DC1-11D3-AA8A-00A024C11562}
// *********************************************************************//
  ICustomerData = interface(IAppServer)
    ['{930FAEE1-0DC1-11D3-AA8A-00A024C11562}']
  end;

// *********************************************************************//
// DispIntf:  ICustomerDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {930FAEE1-0DC1-11D3-AA8A-00A024C11562}
// *********************************************************************//
  ICustomerDataDisp = dispinterface
    ['{930FAEE1-0DC1-11D3-AA8A-00A024C11562}']
    function  AS_ApplyUpdates {Flags(2), (6/5) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                   Delta: {VT_12:0}OleVariant; 
                                                                   MaxErrors: {VT_3:0}Integer; 
                                                                   out ErrorCount: {VT_3:1}Integer; 
                                                                   var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords {Flags(2), (8/7) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                 Count: {VT_3:0}Integer; 
                                                                 out RecsOut: {VT_3:1}Integer; 
                                                                 Options: {VT_3:0}Integer; 
                                                                 const CommandText: {VT_8:0}WideString; 
                                                                 var Params: {VT_12:1}OleVariant; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest {Flags(2), (3/2) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                  Data: {VT_12:0}OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames {Flags(2), (1/0) CC:0, INV:1, DBG:4}: OleVariant; dispid 20000003;
    function  AS_GetParams {Flags(2), (3/2) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest {Flags(2), (5/4) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                 Row: {VT_12:0}OleVariant; 
                                                                 RequestType: {VT_3:0}Integer; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                              const CommandText: {VT_8:0}WideString; 
                                                              var Params: {VT_12:1}OleVariant; 
                                                              var OwnerData: {VT_12:1}OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoCustomerData provides a Create and CreateRemote method to          
// create instances of the default interface ICustomerData exposed by              
// the CoClass CustomerData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCustomerData = class
    class function Create: ICustomerData;
    class function CreateRemote(const MachineName: string): ICustomerData;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCustomerData
// Help String      : CustomerData Object
// Default Interface: ICustomerData
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCustomerDataProperties= class;
{$ENDIF}
  TCustomerData = class(TOleServer)
  private
    FIntf:        ICustomerData;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCustomerDataProperties;
    function      GetServerProperties: TCustomerDataProperties;
{$ENDIF}
    function      GetDefaultInterface: ICustomerData;
  protected
    procedure InitServerData; override;
  {CoClassWriteArrayPropMethods}
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICustomerData);
    procedure Disconnect; override;
  {CoClassWriteMethods}
    function  AS_ApplyUpdates {Flags(1), (6/5) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                   Delta: {VT_12:0}OleVariant; 
                                                                   MaxErrors: {VT_3:0}Integer; 
                                                                   out ErrorCount: {VT_3:1}Integer; 
                                                                   var OwnerData: {VT_12:1}OleVariant): OleVariant;
    function  AS_GetRecords {Flags(1), (8/7) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                 Count: {VT_3:0}Integer; 
                                                                 out RecsOut: {VT_3:1}Integer; 
                                                                 Options: {VT_3:0}Integer; 
                                                                 const CommandText: {VT_8:0}WideString; 
                                                                 var Params: {VT_12:1}OleVariant; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant;
    function  AS_DataRequest {Flags(1), (3/2) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                  Data: {VT_12:0}OleVariant): OleVariant;
    function  AS_GetProviderNames {Flags(1), (1/0) CC:0, INV:1, DBG:3}: OleVariant;
    function  AS_GetParams {Flags(1), (3/2) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                var OwnerData: {VT_12:1}OleVariant): OleVariant;
    function  AS_RowRequest {Flags(1), (5/4) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                 Row: {VT_12:0}OleVariant; 
                                                                 RequestType: {VT_3:0}Integer; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant;
    procedure AS_Execute {Flags(1), (4/4) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                              const CommandText: {VT_8:0}WideString; 
                                                              var Params: {VT_12:1}OleVariant; 
                                                              var OwnerData: {VT_12:1}OleVariant);
    property  DefaultInterface: ICustomerData read GetDefaultInterface;
  {CoClassWriteProperties}
  {CoClassWriteProperties}
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCustomerDataProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCustomerData
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCustomerDataProperties = class(TPersistent)
  private
    FServer:    TCustomerData;
    function    GetDefaultInterface: ICustomerData;
    constructor Create(AServer: TCustomerData);
  protected
  public
    property DefaultInterface: ICustomerData read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoCustomerData.Create: ICustomerData;
begin
  Result := CreateComObject(CLASS_CustomerData) as ICustomerData;
end;

class function CoCustomerData.CreateRemote(const MachineName: string): ICustomerData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CustomerData) as ICustomerData;
end;

procedure TCustomerData.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{930FAEE3-0DC1-11D3-AA8A-00A024C11562}';
    IntfIID:   '{930FAEE1-0DC1-11D3-AA8A-00A024C11562}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCustomerData.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICustomerData;
  end;
end;

procedure TCustomerData.ConnectTo(svrIntf: ICustomerData);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCustomerData.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCustomerData.GetDefaultInterface: ICustomerData;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCustomerData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCustomerDataProperties.Create(Self);
{$ENDIF}
end;

destructor TCustomerData.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCustomerData.GetServerProperties: TCustomerDataProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TCustomerData.AS_ApplyUpdates {Flags(1), (6/5) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                             Delta: {VT_12:0}OleVariant; 
                                                                             MaxErrors: {VT_3:0}Integer; 
                                                                             out ErrorCount: {VT_3:1}Integer; 
                                                                             var OwnerData: {VT_12:1}OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates {Flags(1), (6/5) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                                  Delta{VT_12:0}, 
                                                                                  MaxErrors{VT_3:0}, 
                                                                                  ErrorCount{VT_3:1}, 
                                                                                  OwnerData{VT_12:1});
end;

function  TCustomerData.AS_GetRecords {Flags(1), (8/7) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                           Count: {VT_3:0}Integer; 
                                                                           out RecsOut: {VT_3:1}Integer; 
                                                                           Options: {VT_3:0}Integer; 
                                                                           const CommandText: {VT_8:0}WideString; 
                                                                           var Params: {VT_12:1}OleVariant; 
                                                                           var OwnerData: {VT_12:1}OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords {Flags(1), (8/7) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                                Count{VT_3:0}, 
                                                                                RecsOut{VT_3:1}, 
                                                                                Options{VT_3:0}, 
                                                                                CommandText{VT_8:0}, 
                                                                                Params{VT_12:1}, 
                                                                                OwnerData{VT_12:1});
end;

function  TCustomerData.AS_DataRequest {Flags(1), (3/2) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                            Data: {VT_12:0}OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest {Flags(1), (3/2) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                                 Data{VT_12:0});
end;

function  TCustomerData.AS_GetProviderNames {Flags(1), (1/0) CC:0, INV:1, DBG:3}: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames {Flags(1), (1/0) CC:0, INV:1, DBG:7};
end;

function  TCustomerData.AS_GetParams {Flags(1), (3/2) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                          var OwnerData: {VT_12:1}OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams {Flags(1), (3/2) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                               OwnerData{VT_12:1});
end;

function  TCustomerData.AS_RowRequest {Flags(1), (5/4) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                           Row: {VT_12:0}OleVariant; 
                                                                           RequestType: {VT_3:0}Integer; 
                                                                           var OwnerData: {VT_12:1}OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest {Flags(1), (5/4) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                                Row{VT_12:0}, 
                                                                                RequestType{VT_3:0}, 
                                                                                OwnerData{VT_12:1});
end;

procedure TCustomerData.AS_Execute {Flags(1), (4/4) CC:0, INV:1, DBG:3}(const ProviderName: {VT_8:0}WideString; 
                                                                        const CommandText: {VT_8:0}WideString; 
                                                                        var Params: {VT_12:1}OleVariant; 
                                                                        var OwnerData: {VT_12:1}OleVariant);
begin
  DefaultInterface.AS_Execute {Flags(1), (4/4) CC:0, INV:1, DBG:7}(ProviderName{VT_8:0}, 
                                                                   CommandText{VT_8:0}, 
                                                                   Params{VT_12:1}, 
                                                                   OwnerData{VT_12:1});
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCustomerDataProperties.Create(AServer: TCustomerData);
begin
  inherited Create;
  FServer := AServer;
end;

function TCustomerDataProperties.GetDefaultInterface: ICustomerData;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TCustomerData]);
end;

end.
