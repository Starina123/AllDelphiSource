{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Networking.Vpn;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  AsyncOperationCompletedHandler_1__VpnManagementErrorStatus = interface;
  PAsyncOperationCompletedHandler_1__VpnManagementErrorStatus = ^AsyncOperationCompletedHandler_1__VpnManagementErrorStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  IAsyncOperation_1__VpnManagementErrorStatus = interface;
  PIAsyncOperation_1__VpnManagementErrorStatus = ^IAsyncOperation_1__VpnManagementErrorStatus;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Networking.Vpn Interfaces
  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  AsyncOperationCompletedHandler_1__VpnManagementErrorStatus_Delegate_Base = interface(IUnknown)
  ['{31229F8C-709D-5017-8629-57EF1289E616}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  AsyncOperationCompletedHandler_1__VpnManagementErrorStatus = interface(AsyncOperationCompletedHandler_1__VpnManagementErrorStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__VpnManagementErrorStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  IAsyncOperation_1__VpnManagementErrorStatus_Base = interface(IInspectable)
  ['{E99B86DC-6B65-5F23-9419-90B55852F283}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  // Used Types:  Windows.Networking.Vpn.VpnManagementErrorStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.Vpn.VpnManagementErrorStatus>
  IAsyncOperation_1__VpnManagementErrorStatus = interface(IAsyncOperation_1__VpnManagementErrorStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__VpnManagementErrorStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__VpnManagementErrorStatus; safecall;
    function GetResults: VpnManagementErrorStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__VpnManagementErrorStatus read get_Completed write put_Completed;
  end;


  // Emit Forwarded classes

implementation

  // Emit Classes Implementation

end.
