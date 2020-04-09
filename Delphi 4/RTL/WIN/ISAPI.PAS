
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{       Structure definitions and prototypes for the    }
{       Microsoft Internet Server API (ISAPI)           }
{                                                       }
{       Copyright (C) 1996,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit Isapi;

{$WEAKPACKAGEUNIT}

interface

uses Windows;

const
  HSE_VERSION_MAJOR         =   1;      // major version of this spec
  HSE_VERSION_MINOR         =   0;      // minor version of this spec
  HSE_LOG_BUFFER_LEN        =  80;
  HSE_MAX_EXT_DLL_NAME_LEN  = 256;

type
  HCONN = THandle;

// the following are the status codes returned by the Extension DLL

const
  HSE_STATUS_SUCCESS                      = 1;
  HSE_STATUS_SUCCESS_AND_KEEP_CONN        = 2;
  HSE_STATUS_PENDING                      = 3;
  HSE_STATUS_ERROR                        = 4;

// The following are the values to request services with the ServerSupportFunction.
//  Values from 0 to 1000 are reserved for future versions of the interface

  HSE_REQ_BASE                             = 0;
  HSE_REQ_SEND_URL_REDIRECT_RESP           = ( HSE_REQ_BASE + 1 );
  HSE_REQ_SEND_URL                         = ( HSE_REQ_BASE + 2 );
  HSE_REQ_SEND_RESPONSE_HEADER             = ( HSE_REQ_BASE + 3 );
  HSE_REQ_DONE_WITH_SESSION                = ( HSE_REQ_BASE + 4 );
  HSE_REQ_END_RESERVED                     = 1000;

//
//  These are Microsoft specific extensions
//

  HSE_REQ_MAP_URL_TO_PATH                  = (HSE_REQ_END_RESERVED+1);
  HSE_REQ_GET_SSPI_INFO                    = (HSE_REQ_END_RESERVED+2);


//
// passed to GetExtensionVersion
//

type
  PHSE_VERSION_INFO = ^THSE_VERSION_INFO;
  THSE_VERSION_INFO = packed record
    dwExtensionVersion: DWORD;
    lpszExtensionDesc: array [0..HSE_MAX_EXT_DLL_NAME_LEN-1] of Char;
  end;

type
  TGetServerVariableProc = function ( hConn: HCONN;
                                      VariableName: PChar;
				      Buffer: Pointer;
                                      var Size: DWORD ): BOOL stdcall;

  TWriteClientProc = function ( ConnID: HCONN;
                                Buffer: Pointer;
                                var Bytes: DWORD;
                                dwReserved: DWORD ): BOOL stdcall;

  TReadClientProc  = function ( ConnID: HCONN;
                                Buffer: Pointer;
                                var Size: DWORD ): BOOL stdcall;

  TServerSupportFunctionProc = function ( hConn: HCONN;
                                          HSERRequest: DWORD;
                                          Buffer: Pointer;
                                          var Size: DWORD;
                                          var DataType: DWORD ): BOOL stdcall;

//
// passed to extension procedure on a new request
//
type

  PEXTENSION_CONTROL_BLOCK = ^TEXTENSION_CONTROL_BLOCK;
  TEXTENSION_CONTROL_BLOCK = packed record
    cbSize: DWORD;                    // size of this struct.
    dwVersion: DWORD;                 // version info of this spec
    ConnID: HCONN;                    // Context number not to be modified!
    dwHttpStatusCode: DWORD;          // HTTP Status code
             // null terminated log info specific to this Extension DLL
    lpszLogData: array [0..HSE_LOG_BUFFER_LEN-1] of Char;
    lpszMethod: PChar;                // REQUEST_METHOD
    lpszQueryString: PChar;           // QUERY_STRING
    lpszPathInfo: PChar;              // PATH_INFO
    lpszPathTranslated: PChar;        // PATH_TRANSLATED
    cbTotalBytes: DWORD;              // Total bytes indicated from client
    cbAvailable: DWORD;               // Available number of bytes
    lpbData: Pointer;                 // pointer to cbAvailable bytes
    lpszContentType: PChar;           // Content type of client data

    GetServerVariable: TGetServerVariableProc;
    WriteClient: TWriteClientProc;
    ReadClient: TReadClientProc;
    ServerSupportFunction: TServerSupportFunctionProc;
  end;

//
//  these are the prototypes that must be exported from the extension DLL
//

//  function GetExtensionVersion( var Ver: THSE_VERSION_INFO ): BOOL; stdcall;
//  function HttpExtensionProc( var ECB: TEXTENSION_CONTROL_BLOCK ): DWORD; stdcall;

// the following type declarations is for the server side

// typedef BOOL  (WINAPI * PFN_GETEXTENSIONVERSION)( HSE_VERSION_INFO  *pVer );
// typedef DWORD (WINAPI * PFN_HTTPEXTENSIONPROC )( EXTENSION_CONTROL_BLOCK *pECB );

implementation

end.
