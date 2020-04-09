
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{       URL Moniker support interface unit              }
{                                                       }
{       Copyright (C) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit UrlMon;

{$WEAKPACKAGEUNIT}

interface

uses Windows, ActiveX;

const
  UseUI: Boolean = True;

  BINDVERB_GET       = $00000000;       // default action
  BINDVERB_POST      = $00000001;       // post verb
  BINDVERB_PUT       = $00000002;       // put verb
  BINDVERB_CUSTOM    = $00000003;       // custom verb

  BINDINFOF_URLENCODESTGMEDDATA   = $00000001;       // url encode the stgmed data
  BINDINFOF_URLENCODEDEXTRAINFO   = $00000002;       // url encode the extra info

  // flags that describe the type of transaction that caller wants
  BINDF_ASYNCHRONOUS              = $00000001;
  BINDF_ASYNCSTORAGE              = $00000002;
  BINDF_NOPROGRESSIVERENDERING    = $00000004;
  BINDF_OFFLINEOPERATION          = $00000008;
  BINDF_GETNEWESTVERSION          = $00000010;
  BINDF_NOWRITECACHE              = $00000020;
  BINDF_NEEDFILE                  = $00000040;
  BINDF_PULLDATA                  = $00000080;
  BINDF_IGNORESECURITYPROBLEM     = $00000100;
  BINDF_RESYNCHRONIZE             = $00000200;
  BINDF_HYPERLINK                 = $00000400;
  BINDF_NO_UI	                  = $00000800;
  BINDF_SILENTOPERATION	          = $00001000;
  BINDF_PRAGMA_NO_CACHE	          = $00002000;
  BINDF_FREE_THREADED	          = $00010000;
  BINDF_DIRECT_READ	          = $00020000;
  BINDF_FORMS_SUBMIT	          = $00040000;
  BINDF_GETFROMCACHE_IF_NET_FAIL  = $00080000;
  // backward compatibility:
  BINDF_INLINESGETNEWESTVERSION   = $10000000; //  need to remove from SDK
  BINDF_INLINESRESYNCHRONIZE      = $20000000; // need to remove from SDK
  BINDF_CONTAINER_NOWRITECACHE    = $40000000; // need to remove from SDK
  BINDF_DONTUSECACHE   = BINDF_GETNEWESTVERSION;
  BINDF_DONTPUTINCACHE = BINDF_NOWRITECACHE;
  BINDF_NOCOPYDATA     = BINDF_PULLDATA;

  // Data notification flags
  BSCF_FIRSTDATANOTIFICATION          = $00000001;
  BSCF_INTERMEDIATEDATANOTIFICATION   = $00000002;
  BSCF_LASTDATANOTIFICATION           = $00000004;

  BINDSTATUS_FINDINGRESOURCE          = 1;
  BINDSTATUS_CONNECTING               = 2;
  BINDSTATUS_REDIRECTING              = 3;
  BINDSTATUS_BEGINDOWNLOADDATA        = 4;
  BINDSTATUS_DOWNLOADINGDATA          = 5;
  BINDSTATUS_ENDDOWNLOADDATA          = 6;
  BINDSTATUS_BEGINDOWNLOADCOMPONENTS  = 7;
  BINDSTATUS_INSTALLINGCOMPONENTS     = 8;
  BINDSTATUS_ENDDOWNLOADCOMPONENTS    = 9;
  BINDSTATUS_USINGCACHEDCOPY          = 10;
  BINDSTATUS_SENDINGREQUEST           = 11;
  BINDSTATUS_CLASSIDAVAILABLE         = 12;
  BINDSTATUS_MIMETYPEAVAILABLE        = 13;
  BINDSTATUS_CACHEFILENAMEAVAILABLE   = 14;

  SZ_URLCONTEXT: PWideChar = 'URL Context';
  SZ_ASYNC_CALLEE: PWideChar = 'AsyncCallee';
  MKSYS_URLMONIKER = 6;

  { URLMON-specific defines for UrlMkSetSessionOption() above }
  URLMON_OPTION_USERAGENT     = $10000001;

  CF_NULL                     = 0;
  CFSTR_MIME_NULL             = 0;
  CFSTR_MIME_TEXT             = 'text/plain';
  CFSTR_MIME_RICHTEXT         = 'text/richtext';
  CFSTR_MIME_X_BITMAP         = 'image/x-xbitmap';
  CFSTR_MIME_POSTSCRIPT       = 'application/postscript';
  CFSTR_MIME_AIFF             = 'audio/aiff';
  CFSTR_MIME_BASICAUDIO       = 'audio/basic';
  CFSTR_MIME_WAV              = 'audio/wav';
  CFSTR_MIME_X_WAV            = 'audio/x-wav';
  CFSTR_MIME_GIF              = 'image/gif';
  CFSTR_MIME_PJPEG            = 'image/pjpeg';
  CFSTR_MIME_JPEG             = 'image/jpeg';
  CFSTR_MIME_TIFF             = 'image/tiff';
  CFSTR_MIME_X_PNG            = 'image/x-png';
  CFSTR_MIME_BMP              = 'image/bmp';
  CFSTR_MIME_X_ART            = 'image/x-jg';
  CFSTR_MIME_AVI              = 'video/avi';
  CFSTR_MIME_MPEG             = 'video/mpeg';
  CFSTR_MIME_FRACTALS         = 'application/fractals';
  CFSTR_MIME_RAWDATA          = 'application/octet-stream';
  CFSTR_MIME_RAWDATASTRM      = 'application/octet-stream';
  CFSTR_MIME_PDF              = 'application/pdf';
  CFSTR_MIME_X_AIFF           = 'audio/x-aiff';
  CFSTR_MIME_X_REALAUDIO      = 'audio/x-pn-realaudio';
  CFSTR_MIME_XBM              = 'image/xbm';
  CFSTR_MIME_QUICKTIME        = 'video/quicktime';
  CFSTR_MIME_X_MSVIDEO        = 'video/x-msvideo';
  CFSTR_MIME_X_SGI_MOVIE      = 'video/x-sgi-movie';
  CFSTR_MIME_HTML             = 'text/html';

  { MessageId: MK_S_ASYNCHRONOUS                                              }
  { MessageText: Operation is successful, but will complete asynchronously.   }
  MK_S_ASYNCHRONOUS = $000401E8;
  S_ASYNCHRONOUS    = MK_S_ASYNCHRONOUS;
  {$EXTERNALSYM E_PENDING}
  E_PENDING         = $8000000A;

  { WinINet and protocol specific errors are mapped to one of the following   }
  { error which are returned in IBSC::OnStopBinding                           }
  INET_E_INVALID_URL               : HResult = $800C0002;
  INET_E_NO_SESSION                : HResult = $800C0003;
  INET_E_CANNOT_CONNECT            : HResult = $800C0004;
  INET_E_RESOURCE_NOT_FOUND        : HResult = $800C0005;
  INET_E_OBJECT_NOT_FOUND          : HResult = $800C0006;
  INET_E_DATA_NOT_AVAILABLE        : HResult = $800C0007;
  INET_E_DOWNLOAD_FAILURE          : HResult = $800C0008;
  INET_E_AUTHENTICATION_REQUIRED   : HResult = $800C0009;
  INET_E_NO_VALID_MEDIA            : HResult = $800C000A;
  INET_E_CONNECTION_TIMEOUT        : HResult = $800C000B;
  INET_E_INVALID_REQUEST           : HResult = $800C000C;
  INET_E_UNKNOWN_PROTOCOL          : HResult = $800C000D;
  INET_E_SECURITY_PROBLEM          : HResult = $800C000E;
  INET_E_CANNOT_LOAD_DATA          : HResult = $800C000F;
  INET_E_CANNOT_INSTANTIATE_OBJECT : HResult = $800C0010;
  INET_E_ERROR_FIRST               : HResult = $800C0002;
  INET_E_ERROR_LAST                : HResult = $800C0010;
                                     // (INET_E_CANNOT_INSTANTIATE_OBJECT)

  { These are for backwards compatibility with previous URLMON versions }
  { Flags for the UrlDownloadToCacheFile                                                                    }
  URLOSTRM_USECACHEDCOPY_ONLY = $1;   // Only get from cache
  URLOSTRM_USECACHEDCOPY      = $2;   // Get from cache if available else download
  URLOSTRM_GETNEWESTVERSION   = $3;   // Get new version only. But put it in cache too

  // GUIDs for interfaces declared in this unit
  IID_IPersistMoniker: TGUID = (
    D1:$79eac9c9;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IBindProtocol: TGUID = (
    D1:$79eac9cd;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IBinding: TGUID = (
    D1:$79eac9c0;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IBindStatusCallback: TGUID = (
    D1:$79eac9c1;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IAuthenticate: TGUID = (
    D1:$79eac9d0;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_HttpNegotiate: TGUID = (
    D1:$79eac9d2;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IWindowForBindingUI: TGUID = (
    D1:$79eac9d5;D2:$bafa;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_ICodeInstall: TGUID = (
    D1:$79eac9d1;D2:$baf9;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IWinInetInfo: TGUID = (
    D1:$79eac9d6;D2:$bafa;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IHttpSecurity: TGUID = (
    D1:$79eac9d7;D2:$bafa;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IWinInetHttpInfo: TGUID = (
    D1:$79eac9d8;D2:$bafa;D3:$11ce;D4:($8c,$82,$00,$aa,$00,$4b,$a9,$0b));
  IID_IBindHost: TGUID = (
    D1:$fc4801a1;D2:$2ba9;D3:$11cf;D4:($a2,$29,$00,$aa,$00,$3d,$73,$52));

type
  PBindInfo = ^TBindInfo;
  TBindInfo = packed record
    cbSize: Longint;
    szExtraInfo: PWideChar;  // e.g. string added to the URL string [range byte]
    stgmedData: TStgMedium;  // e.g. put or post data
    grfBindInfoF: DWORD;     // e.g. how meddata should be treaded
    dwBindVerb: DWORD;       // e.g. put, post, ...
    szCustomVerb: PWideChar; // e.g. custom verb
    cbstgmedData: Longint;   // size of data in stgmedData
  end;

  PRemBindInfo = ^TRemBindInfo;
  TRemBindInfo = packed record
    cbSize: Cardinal;
    szExtraInfo: PWideChar;
    grfBindInfoF: DWORD;
    dwBindVerb: DWORD;
    szCustomVerb: PWideChar;
    cbstgmedData: DWORD;
  end;

  PRemFormatEtc = ^TRemFormatEtc;
  TRemFormatEtc = packed record
    cfFormat: DWORD;
    ptd: DWORD;
    dwAspect: DWORD;
    lindex: Longint;
    tymed: DWORD;
  end;

  PCIP_Status = ^TCip_Status;
  TCIP_Status = (CIP_DISK_FULL, CIP_ACCESS_DENIED, CIP_NEWER_VERSION_EXISTS,
    CIP_OLDER_VERSION_EXISTS, CIP_NAME_CONFLICT,
    CIP_TRUST_VERIFICATION_COMPONENT_MISSING,
    CIP_EXE_SELF_REGISTERATION_TIMEOUT, CIP_UNSAFE_TO_ABORT, CIP_NEED_REBOOT);

  IPersistMoniker = interface
    ['{79eac9c9-baf9-11ce-8c82-00aa004ba90b}']
    function GetClassID(out pClassID: TCLSID): HRESULT; stdcall;
    function IsDirty: HRESULT; stdcall;
    function Load(fFullyAvailable: BOOL; pimkName: IMoniker; pibc: IBindCtx;
      grfMode: DWORD): HResult; stdcall;
    function Save(pimkName: IMoniker; pibc: IBindCtx; fRemember: BOOL): HResult; stdcall;
    function SaveCompleted(pimkName: IMoniker; pibc: IBindCtx): HRESULT; stdcall;
    function GetCurMoniker(out ppimkName: IMoniker): HRESULT; stdcall;
  end;

  IBinding = interface
    ['{79eac9c0-baf9-11ce-8c82-00aa004ba90b}']
    function Abort: HResult; stdcall;
    function Suspend: HResult; stdcall;
    function Resume: HResult; stdcall;
    function SetPriority(nPriority: Longint): HResult; stdcall;
    function GetPriority(out nPriority: Longint): HResult; stdcall;
    function GetBindResult(out clsidProtocol: TGUID; out dwResult: Longint;
      out szResult: PWideChar; var dwReserved: Longint): HResult; stdcall;
  end;

  IBindProtocol = interface
    ['{79eac9cd-baf9-11ce-8c82-00aa004ba90b}']
    function CreateBinding(szUrl: PWideChar; pbc: IBindCtx;
      out ppb: IBinding): HResult; stdcall;
  end;

  IBindStatusCallback = interface
    ['{79eac9c1-baf9-11ce-8c82-00aa004ba90b}']
    function OnStartBinding(dwReserved: Longint; pib: IBinding): HResult;
      stdcall;
    function GetPriority(out pnPriority: Longint): HResult; stdcall;
    function OnLowResource(reserved: Longint): HResult; stdcall;
    function OnProgress(ulProgress: Longint; ulProgressMax: Longint;
      ulStatusCode: Longint; szStatusText: PWideChar): HResult; stdcall;
    function OnStopBinding( hRes: HResult; szError: PWideChar ): HResult;
      stdcall;
    function GetBindInfo(out grfBINDF: Longint; var pbindinfo: TBindInfo):
      HResult; stdcall;
    function OnDataAvailable(grfBSCF: Longint; dwSize: Longint;
      var pformatetc: TFormatEtc; var pstgmed: TSTGMEDIUM): HResult; stdcall;
    function OnObjectAvailable(const iid: TGUID; const punk: IUnknown): HResult;
      stdcall;
  end;

  IAuthenticate = interface
    ['{79eac9d0-baf9-11ce-8c82-00aa004ba90b}']
    function Authenticate(var phwnd: HWND; pszUserName,
      pszPassword: PWideChar): HRESULT; stdcall;
  end;

  IHttpNegotiate = interface
    ['{79eac9d2-baf9-11ce-8c82-00aa004ba90b}']
    function BeginningTransaction(szURL, szHeaders: PWideChar;
      dwReserved: DWORD; out pszAdditionalHeaders: PWideChar): HRESULT; stdcall;
    function OnResponse(dwResponseCode: DWORD; szResponseHeaders,
      szRequestHeaders: PWideChar; out pszAdditionalRequestHeaders: PWideChar):
      HResult; stdcall;
  end;

  IWindowForBindingUI = interface
    ['{79eac9d5-bafa-11ce-8c82-00aa004ba90b}']
    function GetWindow(const guidReason: TGUID; out wnd: HWND): HResult; stdcall;
  end;

  ICodeInstall = interface(IWindowForBindingUI)
    ['{79eac9d1-baf9-11ce-8c82-00aa004ba90b}']
    function OnCodeInstallProblem(ulStatusCode: Cardinal; szDestination,
      szSource: PWideChar; dwReserved: DWORD): HResult; stdcall;
  end;

  IWinInetInfo = interface
    ['{79eac9d6-bafa-11ce-8c82-00aa004ba90b}']
    function QueryOption(dwOption: DWORD; Buffer: Pointer; var pcbBuf: DWORD): HResult; stdcall;
  end;

  IHttpSecurity = interface(IWindowForBindingUI)
    ['{79eac9d7-bafa-11ce-8c82-00aa004ba90b}']
    function OnSecurityProblem(dwProblem: DWORD): HRESULT; stdcall;
  end;

  IWinInetHttpInfo = interface(IWinInetInfo)
    ['{79eac9d8-bafa-11ce-8c82-00aa004ba90b}']
    function QueryInfo(dwOption: DWORD; pBuffer: Pointer; var pcbBuf, pdwFlags,
      pdwReserved: DWORD): HResult; stdcall;
  end;

  IBindHost = interface
    ['{fc4801a1-2ba9-11cf-a229-00aa003d7352}']
    function CreateMoniker(szName: PWideChar; pBC: IBindCtx; out ppmk: IMoniker;
      dwReserved: DWORD): HResult; stdcall;
    function MonikerBindToStorage(pMk: IMoniker; pBC: IBindCtx;
      pBSC: IBindStatusCallback; const riid: TIID; out ppvObj): HResult; stdcall;
    function RemoteMonikerBindToStorage(pMk: IMoniker; pBC: IBindCtx;
      pBSC: IBindStatusCallback; const riid: TIID; out ppvObj: IUnknown): HResult; stdcall;
    function MonikerBindToObject(pMk: IMoniker; pBC: IBindCtx;
      pBSC: IBindStatusCallback; const riid: TIID; out ppvObj): HResult; stdcall;
    function RemoteMonikerBindToObject(pMk: IMoniker; pBC: IBindCtx;
      pBSC: IBindStatusCallback; const riid: TIID; out ppvObj: IUnknown): HResult; stdcall;
  end;

const
  SOFTDIST_FLAG_USAGE_EMAIL         = $00000001;
  SOFTDIST_FLAG_USAGE_PRECACHE      = $00000002;
  SOFTDIST_FLAG_USAGE_AUTOINSTALL   = $00000004;
  SOFTDIST_FLAG_DELETE_SUBSCRIPTION = $00000008;

  SOFTDIST_ADSTATE_NONE	            = $00000000;
  SOFTDIST_ADSTATE_AVAILABLE        = $00000001;
  SOFTDIST_ADSTATE_DOWNLOADED	    = $00000002;
  SOFTDIST_ADSTATE_INSTALLED	    = $00000003;

type
  _tagCODEBASEHOLD = packed record
    cbSize: ULONG;
    szDistUnit: PWideChar;
    szCodeBase: PWideChar;
    dwVersionMS: DWORD;
    dwVersionLS: DWORD;
    dwStyle: DWORD;
  end;
  PCodeBaseHold = ^TCodeBaseHold;
  TCodeBaseHold = _tagCODEBASEHOLD;

  _tagSOFTDISTINFO = packed record
    cbSize: ULONG;
    dwFlags: DWORD;
    dwAdState: DWORD;
    szTitle: PWideChar;
    szAbstract: PWideChar;
    szHREF: PWideChar;
    dwInstalledVersionMS: DWORD;
    dwInstalledVersionLS: DWORD;
    dwUpdateVersionMS: DWORD;
    dwUpdateVersionLS: DWORD;
    dwAdvertisedVersionMS: DWORD;
    dwAdvertisedVersionLS: DWORD;
    dwReserved: DWORD;
  end;
  PSoftDistInfo = ^TSoftDistInfo;
  TSoftDistInfo = _tagSOFTDISTINFO;

function CreateURLMoniker(pMkCtx: IMoniker; szURL: PWideChar;
  out ppmk: IMoniker): HResult; stdcall;
function GetClassURL(szURL: PWideChar; const pClsID: TCLSID): HResult; stdcall;
function CreateAsyncBindCtx(reserved: DWORD; pBSCb: IBindStatusCallback;
  pEFetc: IEnumFORMATETC; out ppBC: IBindCtx): HResult;
function MkParseDisplayNameEx(pbc: IBindCtx; szDisplayName: PWideChar;
  var pchEaten: Cardinal; out ppmk: IMoniker): HResult; stdcall;
function RegisterBindStatusCallback(pBC: IBindCtx; pBSCb: IBindStatusCallback;
  out ppBSCBPrev: IBindStatusCallback; dwReserved: DWORD): HResult; stdcall;
function RevokeBindStatusCallback(pBC: IBindCtx; pBSCb: IBindStatusCallback): HResult; stdcall;
function GetClassFileOrMime(pBC: IBindCtx; szFilename: PWideChar; pBuffer: Pointer;
  cbSize: DWORD; szMime: PWideChar; dwReserved: DWORD; out pclsid: TCLSID): HResult; stdcall;
function IsValidURL(pBC: IBindCtx; szURL: PWideChar; dwReserved: DWORD): HResult; stdcall;
function CoGetClassObjectFromURL(const rCLASSID: TCLSID; szCODE: PWideChar;
  dwFileVersionMS: DWORD; dwFileVersionLS: DWORD; szTYPE: PWideChar;
  pBindCtx: IBindCtx; dwClsContext: DWORD; pvReserved: Pointer; const riid: TIID;
  out ppv): HResult; stdcall;

{ helper apis }
function IsAsyncMoniker(pmk: IMoniker): HResult; stdcall;
function CreateURLBinding(lpszUrl: PWideChar; pbc: IBindCtx;
  out ppBdg: IBinding): HResult; stdcall;

function RegisterMediaTypesW(ctypes: Cardinal; rgszTypes: PWideChar;
  const rgcfTypes: TClipFormat): HResult; stdcall;
function RegisterMediaTypes(ctypes: Cardinal; rgszTypes: PChar;
  const rgcfTypes: TClipFormat): HResult; stdcall;
function FindMediaType(rgszTypes: PChar; rgcfTypes: TClipFormat): HResult; stdcall;
function CreateFormatEnumerator(cfmtetc: Cardinal; const rgfmtetc: TFormatEtc;
  out ppenumfmtetc: IEnumFormatEtc): HResult; stdcall;
function RegisterFormatEnumerator(pBC: IBindCtx; pEFetc: IEnumFormatEtc;
  reserved: DWORD): HResult; stdcall;
function RevokeFormatEnumerator(pBC: IBindCtx; pEFetc: IEnumFormatEtc): HResult; stdcall;
function RegisterMediaTypeClass(pBC: IBindCtx; ctypes: Cardinal;
  rgszTypes: PChar; const rgclsID: TCLSID; reserved: DWORD): HResult; stdcall;
function FindMediaTypeClass(pBC: IBindCtx; szType: PChar; out pclsID: TCLSID;
  reserved: DWORD): HResult; stdcall;
function UrlMkSetSessionOption(dwOption: DWORD; pBuffer: Pointer;
  dwBufferLength: DWORD; dwReserved: DWORD): HResult; stdcall;

function HlinkSimpleNavigateToString(szTarget, szLocation,
  szTargetFrameName: PWideChar; pUnk: IUnknown; pbc: IBindCtx;
  pBSCb: IBindStatusCallback; grfHLNF, dwReserved: DWORD): HResult; stdcall;
function HlinkSimpleNavigateToMoniker(pmkTarget: IMoniker; szLocation,
  szTargetFrameName: PWideChar; pUnk: IUnknown; pbc: IBindCtx;
  pBSCb: IBindStatusCallback; grfHLNF, dwReserved: DWORD): HResult; stdcall;

function URLOpenStreamA(p1: IUnknown; p2: PAnsiChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;
function URLOpenStreamW(p1: IUnknown; p2: PWideChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;
function URLOpenStream(p1: IUnknown; p2: PChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;

function URLOpenPullStreamA(p1: IUnknown; p2: PAnsiChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;
function URLOpenPullStreamW(p1: IUnknown; p2: PWideChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;
function URLOpenPullStream(p1: IUnknown; p2: PChar; p3: DWORD;
  p4: IBindStatusCallback): HResult; stdcall;


function URLDownloadToFileA(p1: IUnknown; p2: PAnsiChar; p3: PAnsiChar; p4: DWORD;
  p5: IBindStatusCallback): HResult; stdcall;
function URLDownloadToFileW(p1: IUnknown; p2: PWideChar; p3: PWideChar; p4: DWORD;
  p5: IBindStatusCallback): HResult; stdcall;
function URLDownloadToFile(p1: IUnknown; p2: PChar; p3: PChar; p4: DWORD;
  p5: IBindStatusCallback): HResult; stdcall;

function URLDownloadToCacheFileA(p1: IUnknown; p2: PAnsiChar; p3: PAnsiChar;
  p4: DWORD; p5: DWORD; p6: IBindStatusCallback): HResult; stdcall;
function URLDownloadToCacheFileW(p1: IUnknown; p2: PWideChar; p3: PWideChar;
  p4: DWORD; p5: DWORD; p6: IBindStatusCallback): HResult; stdcall;
function URLDownloadToCacheFile(p1: IUnknown; p2: PChar; p3: PChar;
  p4: DWORD; p5: DWORD; p6: IBindStatusCallback): HResult; stdcall;

function URLOpenBlockingStreamA(p1: IUnknown; p2: PAnsiChar; out p3: IStream;
  p4: DWORD; p5: IBindStatusCallback): HResult; stdcall;
function URLOpenBlockingStreamW(p1: IUnknown; p2: PWideChar; out p3: IStream;
  p4: DWORD; p5: IBindStatusCallback): HResult; stdcall;
function URLOpenBlockingStream(p1: IUnknown; p2: PChar; out p3: IStream;
  p4: DWORD; p5: IBindStatusCallback): HResult; stdcall;

function HlinkGoBack(pUnk: IUnknown): HResult; stdcall;
function HlinkGoForward(pUnk: IUnknown): HResult; stdcall;
function HlinkNavigateString(pUnk: IUnknown; szTarget: PWideChar): HResult; stdcall;
function HlinkNavigateMoniker(pUnk: IUnknown; pmkTarget: IMoniker): HResult; stdcall;

implementation

const
  UrlMonLib = 'URLMON.DLL';

function CoGetClassObjectFromURL;       external UrlMonLib name 'CoGetClassObjectFromURL';
function CreateAsyncBindCtx;            external UrlMonLib name 'CreateAsyncBindCtx';
function CreateFormatEnumerator;        external UrlMonLib name 'CreateFormatEnumerator';
function CreateURLBinding;              external UrlMonLib name 'CreateURLBinding';
function CreateURLMoniker;              external UrlMonLib name 'CreateURLMoniker';
function FindMediaType;                 external UrlMonLib name 'FindMediaType';
function FindMediaTypeClass;            external UrlMonLib name 'FindMediaTypeClass';
function GetClassFileOrMime;            external UrlMonLib name 'GetClassFileOrMime';
function GetClassURL;                   external UrlMonLib name 'GetClassURL';
function HlinkGoBack;                   external UrlMonLib name 'HlinkGoBack';
function HlinkGoForward;                external UrlMonLib name 'HlinkGoForward';
function HlinkNavigateMoniker;          external UrlMonLib name 'HlinkNavigateMoniker';
function HlinkNavigateString;           external UrlMonLib name 'HlinkNavigateString';
function HlinkSimpleNavigateToMoniker;  external UrlMonLib name 'HlinkSimpleNavigateToMoniker';
function HlinkSimpleNavigateToString;   external UrlMonLib name 'HlinkSimpleNavigateToString';
function IsAsyncMoniker;                external UrlMonLib name 'IsAsyncMoniker';
function IsValidURL;                    external UrlMonLib name 'IsValidURL';
function MkParseDisplayNameEx;          external UrlMonLib name 'MkParseDisplayNameEx';
function RegisterBindStatusCallback;    external UrlMonLib name 'RegisterBindStatusCallback';
function RegisterFormatEnumerator;      external UrlMonLib name 'RegisterFormatEnumerator';
function RegisterMediaTypeClass;        external UrlMonLib name 'RegisterMediaTypeClass';
function RegisterMediaTypes;            external UrlMonLib name 'RegisterMediaTypes';
function RegisterMediaTypesW;           external UrlMonLib name 'RegisterMediaTypesW';
function RevokeBindStatusCallback;      external UrlMonLib name 'RevokeBindStatusCallback';
function RevokeFormatEnumerator;        external UrlMonLib name 'RevokeFormatEnumerator';
function URLDownloadToCacheFileA;       external UrlMonLib name 'URLDownloadToCacheFileA';
function URLDownloadToCacheFileW;       external UrlMonLib name 'URLDownloadToCacheFileW';
function URLDownloadToCacheFile;        external UrlMonLib name 'URLDownloadToCacheFileA';
function URLDownloadToFileA;            external UrlMonLib name 'URLDownloadToFileA';
function URLDownloadToFileW;            external UrlMonLib name 'URLDownloadToFileW';
function URLDownloadToFile;             external UrlMonLib name 'URLDownloadToFileA';
function UrlMkSetSessionOption;         external UrlMonLib name 'UrlMkSetSessionOption';
function URLOpenBlockingStreamA;        external UrlMonLib name 'URLOpenBlockingStreamA';
function URLOpenBlockingStreamW;        external UrlMonLib name 'URLOpenBlockingStreamW';
function URLOpenBlockingStream;         external UrlMonLib name 'URLOpenBlockingStreamA';
function URLOpenPullStreamA;            external UrlMonLib name 'URLOpenPullStreamA';
function URLOpenPullStreamW;            external UrlMonLib name 'URLOpenPullStreamW';
function URLOpenPullStream;             external UrlMonLib name 'URLOpenPullStreamA';
function URLOpenStreamA;                external UrlMonLib name 'URLOpenStreamA';
function URLOpenStreamW;                external UrlMonLib name 'URLOpenStreamW';
function URLOpenStream;                 external UrlMonLib name 'URLOpenStreamA';

end.
