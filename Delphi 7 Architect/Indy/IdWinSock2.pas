//-------------------------------------------------------------
//
//       Borland Delphi Runtime Library
//       <API> interface unit
//
// Portions created by Microsoft are
// Copyright (C) 1995-1999 Microsoft Corporation.
// All Rights Reserved.
//
// The original file is: Winsock2.h from CBuilder5 distribution.
// The original Pascal code is: winsock2.pas, released 03 Mar 2001.
// The initial developer of the Pascal code is Alex Konshin
// (alexk@mtgroup.ru).
//-------------------------------------------------------------


{ Winsock2.h -- definitions to be used with the WinSock 2 DLL and WinSock 2 applications.
  This header file corresponds to version 2.2.x of the WinSock API specification.
  This file includes parts which are Copyright (c) 1982-1986 Regents
  of the University of California. All rights reserved.
  The Berkeley Software License Agreement specifies the terms and
  conditions for redistribution. }

// Note that the original unit is copyrighted by the original author and I did obtain his
// permission to port and use this as part of Indy - J. Peter Mugaas

// 2002-01-28 - Hadi Hariri. Fixes for C++ Builder. Thanks to Chuck Smith.
// 2001 - Oct -25  J. Peter Mugaas
//    Made adjustments for Indy usage by
//    1) including removing Trace logging
//    2) renaming and consolidating some .INC files as appropriate
//    3) modifying the unit to follow Indy conventions
//    4) Adding TransmitFile support for the HTTP Server
//    5) Removing all static loading code that was IFDEF'ed.    {Do not Localize}
// 2001 - Mar - 1  Alex Konshin
// Revision 3
// converted by Alex Konshin, mailto:alexk@mtgroup.ru
// revision 3, March,1 2001


unit IdWinSock2;

interface

{$ALIGN OFF}
{$RANGECHECKS OFF}
{$WRITEABLECONST OFF}

uses SysUtils, Windows, IdException;

type
  EIdWS2StubError = class(EIdException)
  protected
    FWin32Error : DWORD;
    FWin32ErrorMessage : String;
    FTitle : String;
  public
    constructor	Build( const ATitle : String; AWin32Error : DWORD );
    property Win32Error : DWORD read FWin32Error;
    property Win32ErrorMessage : String read FWin32ErrorMessage;
    property Title : String read FTitle;
  end;


{$DEFINE WS2_DLL_FUNC_VARS}
{$DEFINE INCL_WINSOCK_API_PROTOTYPES}



//  Define the current Winsock version. To build an earlier Winsock version
//  application redefine this value prior to including Winsock2.h
const
  winsock_version = $0202;
  winsock2_dll = 'WS2_32.DLL';    {Do not Localize}

type
  u_char  = Byte;
  u_short = Word;
  //u_int   = DWORD;
  u_int   = Integer;
  u_long  = DWORD;
// The new type to be used in all instances which refer to sockets.
  TSocket = u_int;

  wsaevent = THandle;
  Pwsaevent = ^wsaevent;
  LPwsaevent = Pwsaevent;
{$IFDEF UNICODE}
  PMBChar = PWideChar;
{$ELSE}
  PMBChar = PChar;
{$ENDIF}

const
  fd_setsize     =   64;

type
  PFDSet = ^TFDSet;
  TFDSet = packed record
    fd_count: u_int;
    fd_array: array[0..fd_setsizE-1] of TSocket;
  end;

  PTimeVal = ^TTimeVal;
  TTimeVal = packed record
    tv_sec: Longint;
    tv_usec: Longint;
  end;

const
  iocparm_mask = $7f;
  ioc_void     = $20000000;
  ioc_out      = $40000000;
  ioc_in       = $80000000;
  ioc_inout    = (IOC_IN or IOC_OUT);

// get # bytes to read
  fionread     = ioc_out or (SizeOf(Longint) shl 16) or (Ord('f') shl 8) or 127;    {Do not Localize}
// set/clear non-blocking i/o
  fionbio      = ioc_in  or (SizeOf(Longint) shl 16) or (Ord('f') shl 8) or 126;    {Do not Localize}
// set/clear async i/o
  fioasync     = ioc_in  or (SizeOf(Longint) shl 16) or (Ord('f') shl 8) or 125;    {Do not Localize}

//  Socket I/O Controls

// set high watermark
  siocshiwat   = ioc_in  or (SizeOf(Longint) shl 16) or (Ord('s') shl 8);    {Do not Localize}
// get high watermark
  siocghiwat   = ioc_out or (SizeOf(Longint) shl 16) or (Ord('s') shl 8) or 1;    {Do not Localize}
// set low watermark
  siocslowat   = ioc_in  or (SizeOf(Longint) shl 16) or (Ord('s') shl 8) or 2;    {Do not Localize}
// get low watermark
  siocglowat   = ioc_out or (SizeOf(Longint) shl 16) or (Ord('s') shl 8) or 3;    {Do not Localize}
// at oob mark?
  siocatmark   = ioc_out or (SizeOf(Longint) shl 16) or (Ord('s') shl 8) or 7;    {Do not Localize}


//  Structures returned by network data base library, taken from the
//  BSD file netdb.h.  All addresses are supplied in host order, and
//  returned in network order (suitable for use in system calls).
type
  PHostEnt = ^THostEnt;
  THostEnt = packed record
    h_name: PChar;                 // official name of host
    h_aliases: ^PChar;             // alias list
    h_addrtype: Smallint;          // host address type
    h_length: Smallint;            // length of address
    case Byte of
      0: (h_address_list: ^PChar);
      1: (h_addr: ^PChar);         // address, for backward compat
  end;

//  It is assumed here that a network number
//  fits in 32 bits.
  PNetEnt = ^TNetEnt;
  TNetEnt = packed record
    n_name: PChar;                 // official name of net
    n_aliases: ^PChar;             // alias list
    n_addrtype: Smallint;          // net address type
    n_net: u_long;                 // network #
  end;

  PServEnt = ^TServEnt;
  TServEnt = packed record
    s_name: PChar;                 // official service name
    s_aliases: ^PChar;             // alias list
    s_port: Smallint;              // protocol to use
    s_proto: PChar;                // port #
  end;

  PProtoEnt = ^TProtoEnt;
  TProtoEnt = packed record
    p_name: PChar;                 // official protocol name
    p_aliases: ^Pchar;             // alias list
    p_proto: Smallint;             // protocol #
  end;

// Constants and structures defined by the internet system,
// Per RFC 790, September 1981, taken from the BSD file netinet/in.h.
const

// Protocols
  ipproto_ip     =   0;             // dummy for IP
  ipproto_icmp   =   1;             // control message protocol
  ipproto_igmp   =   2;             // group management protocol
  ipproto_ggp    =   3;             // gateway^2 (deprecated)
  ipproto_tcp    =   6;             // TCP
  ipproto_pup    =  12;             // pup
  ipproto_udp    =  17;             // UDP - user datagram protocol
  ipproto_idp    =  22;             // xns idp
  ipproto_ipv6   =  41;             // IPv6
  ipproto_nd     =  77;             // UNOFFICIAL net disk proto
  ipproto_iclfxbm = 78;

  ipproto_raw    = 255;             // raw IP packet
  ipproto_max    = 256;

// Port/socket numbers: network standard functions
  ipport_echo        =   7;
  ipport_discard     =   9;
  ipport_systat      =  11;
  ipport_daytime     =  13;
  ipport_netstat     =  15;
  ipport_ftp         =  21;
  ipport_telnet      =  23;
  ipport_smtp        =  25;
  ipport_timeserver  =  37;
  ipport_nameserver  =  42;
  ipport_whois       =  43;
  ipport_mtp         =  57;

// Port/socket numbers: host specific functions
  ipport_tftp        =  69;
  ipport_rje         =  77;
  ipport_finger      =  79;
  ipport_ttylink     =  87;
  ipport_supdup      =  95;

// UNIX TCP sockets
  ipport_execserver  = 512;
  ipport_loginserver = 513;
  ipport_cmdserver   = 514;
  ipport_efsserver   = 520;

// UNIX UDP sockets
  ipport_biffudp     = 512;
  ipport_whoserver   = 513;
  ipport_routeserver = 520;

// Ports < IPPORT_RESERVED are reserved for  privileged processes (e.g. root).
  ipport_reserved    =1024;

// Link numbers
  implink_ip         = 155;
  implink_lowexper   = 156;
  implink_highexper  = 158;

  tf_disconnect      = $01;
  tf_reuse_socket    = $02;
  tf_write_behind    = $04;

// This is used instead of -1, since the TSocket type is unsigned.
  invalid_socket     = TSocket(not(0));
  socket_error       = -1;

//  The  following  may  be used in place of the address family, socket type, or
//  protocol  in  a  call  to WSASocket to indicate that the corresponding value
//  should  be taken from the supplied WSAPROTOCOL_INFO structure instead of the
//  parameter itself.
  from_protocol_info = -1;


// Types
  sock_stream     = 1;               { stream socket }
  sock_dgram      = 2;               { datagram socket }
  sock_raw        = 3;               { raw-protocol interface }
  sock_rdm        = 4;               { reliably-delivered message }
  sock_seqpacket  = 5;               { sequenced packet stream }

// option flags per-socket.
  so_debug            = $0001;            // turn on debugging info recording
  so_acceptconn       = $0002;            // socket has had listen()
  so_reuseaddr        = $0004;            // allow local address reuse
  so_keepalive        = $0008;            // keep connections alive
  so_dontroute        = $0010;            // just use interface addresses
  so_broadcast        = $0020;            // permit sending of broadcast msgs
  so_useloopback      = $0040;            // bypass hardware when possible
  so_linger           = $0080;            // linger on close if data present
  so_oobinline        = $0100;            // leave received OOB data in line

  so_dontlinger       = not SO_LINGER;
  so_exclusiveaddruse = not SO_REUSEADDR; // disallow local address reuse

// additional options.

  so_sndbuf           = $1001;      // send buffer size
  so_rcvbuf           = $1002;      // receive buffer size
  so_sndlowat         = $1003;      // send low-water mark
  so_rcvlowat         = $1004;      // receive low-water mark
  so_sndtimeo         = $1005;      // send timeout
  so_rcvtimeo         = $1006;      // receive timeout
  so_error            = $1007;      // get error status and clear
  so_type             = $1008;      // get socket type

// options for connect and disconnect data and options.
// used only by non-tcp/ip transports such as DECNet, OSI TP4, etc.
  so_conndata         = $7000;
  so_connopt          = $7001;
  so_discdata         = $7002;
  so_discopt          = $7003;
  so_conndatalen      = $7004;
  so_connoptlen       = $7005;
  so_discdatalen      = $7006;
  so_discoptlen       = $7007;

// option for opening sockets for synchronous access.
  so_opentype         = $7008;
  so_synchronous_alert    = $10;
  so_synchronous_nonalert = $20;

// other nt-specific options.
  so_maxdg                 = $7009;
  so_maxpathdg             = $700A;
  so_update_accept_context = $700B;
  so_connect_time          = $700C;

// tcp options.
  tcp_nodelay              = $0001;
  tcp_bsdurgent            = $7000;

// winsock 2 extension -- new options
  so_group_id              = $2001; // ID of a socket group
  so_group_priority        = $2002; // the relative priority within a group
  so_max_msg_size          = $2003; // maximum message size
  SO_Protocol_InfoA        = $2004; // WSAPROTOCOL_INFOA structure
  SO_Protocol_InfoW        = $2005; // WSAPROTOCOL_INFOW structure
{$IFDEF UNICODE}
  SO_Protocol_Info         = SO_Protocol_InfoW;
{$ELSE}
  SO_Protocol_Info         = SO_Protocol_InfoA;
{$ENDIF}
  pvd_config               = $3001; // configuration info for service provider
  so_conditional_accept    = $3002; // enable true conditional accept:
                                    // connection is not ack-ed to the
                                    // other side until conditional
                                    // function returns CF_ACCEPT

// Address families.
  af_unspec       = 0;               // unspecified
  af_unix         = 1;               // local to host (pipes, portals)
  af_inet         = 2;               // internetwork: UDP, TCP, etc.
  af_implink      = 3;               // arpanet imp addresses
  af_pup          = 4;               // pup protocols: e.g. BSP
  af_chaos        = 5;               // mit CHAOS protocols
  af_ipx          = 6;               // ipx and SPX
  af_ns           = af_ipx;          // xerOX NS protocols
  af_iso          = 7;               // iso protocols
  af_osi          = af_iso;          // osi is ISO
  af_ecma         = 8;               // european computer manufacturers
  af_datakit      = 9;               // datakit protocols
  af_ccitt        = 10;              // cciTT protocols, X.25 etc
  af_sna          = 11;              // ibm SNA
  af_decnet       = 12;              // decnet
  af_dli          = 13;              // direct data link interface
  af_lat          = 14;              // lat
  af_hylink       = 15;              // nsc Hyperchannel
  af_appletalk    = 16;              // appleTalk
  af_netbios      = 17;              // netBios-style addresses
  af_voiceview    = 18;              // voiceView
  af_firefox      = 19;              // fireFox
  af_unknown1     = 20;              // somebody is using this!
  af_ban          = 21;              // banyan
  af_atm          = 22;              // native ATM Services
  af_inet6        = 23;              // internetwork Version 6
  af_cluster      = 24;              // microsoft Wolfpack
  af_12844        = 25;              // ieeE 1284.4 WG AF
  af_irda         = 26;              // irdA
  af_netdes       = 28;              // network Designers OSI & gateway enabled protocols
  af_tcnprocess   = 29;
  af_tcnmessage   = 30;
  af_iclfxbm      = 31;

  af_max          = 32;


// protocol families, same as address families for now.

  pf_unspec       = af_unspec;
  pf_unix         = af_unix;
  pf_inet         = af_inet;
  pf_implink      = af_implink;
  pf_pup          = af_pup;
  pf_chaos        = af_chaos;
  pf_ns           = af_ns;
  pf_ipx          = af_ipx;
  pf_iso          = af_iso;
  pf_osi          = af_osi;
  pf_ecma         = af_ecma;
  pf_datakit      = af_datakit;
  pf_ccitt        = af_ccitt;
  pf_sna          = af_sna;
  pf_decnet       = af_decnet;
  pf_dli          = af_dli;
  pf_lat          = af_lat;
  pf_hylink       = af_hylink;
  pf_appletalk    = af_appletalk;
  pf_voiceview    = af_voiceview;
  pf_firefox      = af_firefox;
  pf_unknown1     = af_unknown1;
  pf_ban          = af_ban;
  pf_atm          = af_atm;
  pf_inet6        = af_inet6;

  pf_max          = af_max;

type

  SunB = packed record
    s_b1, s_b2, s_b3, s_b4: u_char;
  end;

  SunW = packed record
    s_w1, s_w2: u_short;
  end;

  TInAddr = packed record
    case integer of
      0: (S_un_b: SunB);
      1: (S_un_w: SunW);
      2: (S_addr: u_long);
  end;
  PInAddr = ^TInAddr;

  // Structure used by kernel to store most addresses.

  TSockAddrIn = packed record
    case Integer of
      0: (sin_family : u_short;
          sin_port   : u_short;
          sin_addr   : TInAddr;
          sin_zero   : array[0..7] of Char);
      1: (sa_family  : u_short;
          sa_data    : array[0..13] of Char)
  end;
  PSockAddrIn = ^TSockAddrIn;
  TSockAddr   = TSockAddrIn;
  PSockAddr   = ^TSockAddr;
  SOCKADDR    = TSockAddr;
  SOCKADDR_IN = TSockAddrIn;

  // Structure used by kernel to pass protocol information in raw sockets.
  PSockProto = ^TSockProto;
  TSockProto = packed record
    sp_family   : u_short;
    sp_protocol : u_short;
  end;

// Structure used for manipulating linger option.
  PLinger = ^TLinger;
  TLinger = packed record
    l_onoff: u_short;
    l_linger: u_short;
  end;

const
  inaddr_any       = $00000000;
  inaddr_loopback  = $7F000001;
  inaddr_broadcast = $FFFFFFFF;
  inaddr_none      = $FFFFFFFF;

  addr_any         = INADDR_ANY;

  sol_socket       = $ffff;          // options for socket level

  msg_oob          = $1;             // process out-of-band data
  msg_peek         = $2;             // peek at incoming message
  msg_dontroute    = $4;             // send without using routing tables

  msg_partial      = $8000;          // partial send or recv for message xport

// WinSock 2 extension -- new flags for WSASend(), WSASendTo(), WSARecv() and WSARecvFrom()
  msg_interrupt    = $10;    // send/recv in the interrupt context
  msg_maxiovlen    = 16;


// Define constant based on rfc883, used by gethostbyxxxx() calls.

  maxgethoststruct = 1024;

// Maximum queue length specifiable by listen.
  somaxconn        = $7fffffff;

// WinSock 2 extension -- bit values and indices for FD_XXX network events
  fd_read_bit                     = 0;
  fd_write_bit                    = 1;
  fd_oob_bit                      = 2;
  fd_accept_bit                   = 3;
  fd_connect_bit                  = 4;
  fd_close_bit                    = 5;
  fd_qos_bit                      = 6;
  fd_group_qos_bit                = 7;
  fd_routing_interface_change_bit = 8;
  fd_address_list_change_bit      = 9;

  fd_max_events    = 10;

  fd_read       = (1 shl fd_read_bit);
  fd_write      = (1 shl fd_write_bit);
  fd_oob        = (1 shl fd_oob_bit);
  fd_accept     = (1 shl fd_accept_bit);
  fd_connect    = (1 shl fd_connect_bit);
  fd_close      = (1 shl fd_close_bit);
  fd_qos        = (1 shl fd_qos_bit);
  fd_group_qos  = (1 shl fd_group_qos_bit);
  fd_routing_interface_change = (1 shl fd_routing_interface_change_bit);
  fd_address_list_change      = (1 shl fd_address_list_change_bit);

  fd_all_events = (1 shl fd_max_events) - 1;

// All Windows Sockets error constants are biased by WSABASEERR from the "normal"

  wsabaseerr              = 10000;

// Windows Sockets definitions of regular Microsoft C error constants

  wsaeintr                = wsabaseerr+  4;
  wsaebadf                = wsabaseerr+  9;
  wsaeacces               = wsabaseerr+ 13;
  wsaefault               = wsabaseerr+ 14;
  wsaeinval               = wsabaseerr+ 22;
  wsaemfile               = wsabaseerr+ 24;

// Windows Sockets definitions of regular Berkeley error constants

  wsaewouldblock          = wsabaseerr+ 35;
  wsaeinprogress          = wsabaseerr+ 36;
  wsaealready             = wsabaseerr+ 37;
  wsaenotsock             = wsabaseerr+ 38;
  wsaedestaddrreq         = wsabaseerr+ 39;
  wsaemsgsize             = wsabaseerr+ 40;
  wsaeprototype           = wsabaseerr+ 41;
  wsaenoprotoopt          = wsabaseerr+ 42;
  wsaeprotonosupport      = wsabaseerr+ 43;
  wsaesocktnosupport      = wsabaseerr+ 44;
  wsaeopnotsupp           = wsabaseerr+ 45;
  wsaepfnosupport         = wsabaseerr+ 46;
  wsaeafnosupport         = wsabaseerr+ 47;
  wsaeaddrinuse           = wsabaseerr+ 48;
  wsaeaddrnotavail        = wsabaseerr+ 49;
  wsaenetdown             = wsabaseerr+ 50;
  wsaenetunreach          = wsabaseerr+ 51;
  wsaenetreset            = wsabaseerr+ 52;
  wsaeconnaborted         = wsabaseerr+ 53;
  wsaeconnreset           = wsabaseerr+ 54;
  wsaenobufs              = wsabaseerr+ 55;
  wsaeisconn              = wsabaseerr+ 56;
  wsaenotconn             = wsabaseerr+ 57;
  wsaeshutdown            = wsabaseerr+ 58;
  wsaetoomanyrefs         = wsabaseerr+ 59;
  wsaetimedout            = wsabaseerr+ 60;
  wsaeconnrefused         = wsabaseerr+ 61;
  wsaeloop                = wsabaseerr+ 62;
  wsaenametoolong         = wsabaseerr+ 63;
  wsaehostdown            = wsabaseerr+ 64;
  wsaehostunreach         = wsabaseerr+ 65;
  wsaenotempty            = wsabaseerr+ 66;
  wsaeproclim             = wsabaseerr+ 67;
  wsaeusers               = wsabaseerr+ 68;
  wsaedquot               = wsabaseerr+ 69;
  wsaestale               = wsabaseerr+ 70;
  wsaeremote              = wsabaseerr+ 71;

// Extended Windows Sockets error constant definitions

  wsasysnotready          = wsabaseerr+ 91;
  wsavernotsupported      = wsabaseerr+ 92;
  wsanotinitialised       = wsabaseerr+ 93;
  wsaediscon              = wsabaseerr+101;
  wsaenomore              = wsabaseerr+102;
  wsaecancelled           = wsabaseerr+103;
  wsaeinvalidproctable    = wsabaseerr+104;
  wsaeinvalidprovider     = wsabaseerr+105;
  wsaeproviderfailedinit  = wsabaseerr+106;
  wsasyscallfailure       = wsabaseerr+107;
  wsaservice_not_found    = wsabaseerr+108;
  wsatype_not_found       = wsabaseerr+109;
  wsa_e_no_more           = wsabaseerr+110;
  wsa_e_cancelled         = wsabaseerr+111;
  wsaerefused             = wsabaseerr+112;


{ Error return codes from gethostbyname() and gethostbyaddr()
  (when using the resolver). Note that these errors are
  retrieved via WSAGetLastError() and must therefore follow
  the rules for avoiding clashes with error numbers from
  specific implementations or language run-time systems.
  For this reason the codes are based at WSABASEERR+1001.
  Note also that [WSA]NO_ADDRESS is defined only for
  compatibility purposes. }

// Authoritative Answer: Host not found
  wsahost_not_found        = wsabaseerr+1001;
  host_not_found           = wsahost_not_found;

// Non-Authoritative: Host not found, or SERVERFAIL
  wsatry_again             = wsabaseerr+1002;
  try_again                = wsatry_again;

// Non recoverable errors, FORMERR, REFUSED, NOTIMP
  wsano_recovery           = wsabaseerr+1003;
  no_recovery              = wsano_recovery;

// Valid name, no data record of requested type
  wsano_data               = wsabaseerr+1004;
  no_data                  = wsano_data;

// no address, look for MX record
  wsano_address            = wsano_data;
  no_address               = wsano_address;

// Define QOS related error return codes

  wsa_qos_receivers          = wsabaseerr+1005; // at least one reserve has arrived
  wsa_qos_senders            = wsabaseerr+1006; // at least one path has arrived
  wsa_qos_no_senders         = wsabaseerr+1007; // there are no senders
  wsa_qos_no_receivers       = wsabaseerr+1008; // there are no receivers
  wsa_qos_request_confirmed  = wsabaseerr+1009; // reserve has been confirmed
  wsa_qos_admission_failure  = wsabaseerr+1010; // error due to lack of resources
  wsa_qos_policy_failure     = wsabaseerr+1011; // rejected for administrative reasons - bad credentials
  wsa_qos_bad_style          = wsabaseerr+1012; // unknown or conflicting style
  wsa_qos_bad_object         = wsabaseerr+1013; // problem with some part of the filterspec or providerspecific buffer in general
  wsa_qos_traffic_ctrl_error = wsabaseerr+1014; // problem with some part of the flowspec
  wsa_qos_generic_error      = wsabaseerr+1015; // general error
  wsa_qos_eservicetype       = wsabaseerr+1016; // invalid service type in flowspec
  wsa_qos_eflowspec          = wsabaseerr+1017; // invalid flowspec
  wsa_qos_eprovspecbuf       = wsabaseerr+1018; // invalid provider specific buffer
  wsa_qos_efilterstyle       = wsabaseerr+1019; // invalid filter style
  wsa_qos_efiltertype        = wsabaseerr+1020; // invalid filter type
  wsa_qos_efiltercount       = wsabaseerr+1021; // incorrect number of filters
  wsa_qos_eobjlength         = wsabaseerr+1022; // invalid object length
  wsa_qos_eflowcount         = wsabaseerr+1023; // incorrect number of flows
  wsa_qos_eunkownpsobj       = wsabaseerr+1024; // unknown object in provider specific buffer
  wsa_qos_epolicyobj         = wsabaseerr+1025; // invalid policy object in provider specific buffer
  wsa_qos_eflowdesc          = wsabaseerr+1026; // invalid flow descriptor in the list
  wsa_qos_epsflowspec        = wsabaseerr+1027; // inconsistent flow spec in provider specific buffer
  wsa_qos_epsfilterspec      = wsabaseerr+1028; // invalid filter spec in provider specific buffer
  wsa_qos_esdmodeobj         = wsabaseerr+1029; // invalid shape discard mode object in provider specific buffer
  wsa_qos_eshaperateobj      = wsabaseerr+1030; // invalid shaping rate object in provider specific buffer
  wsa_qos_reserved_petype    = wsabaseerr+1031; // reserved policy element in provider specific buffer


{ WinSock 2 extension -- new error codes and type definition }
  wsa_io_pending          = error_io_pending;
  wsa_io_incomplete       = error_io_incomplete;
  wsa_invalid_handle      = error_invalid_handle;
  wsa_invalid_parameter   = error_invalid_parameter;
  wsa_not_enough_memory   = error_not_enough_memory;
  wsa_operation_aborted   = error_operation_aborted;
  wsa_invalid_event       = wsaevent(nil);
  wsa_maximum_wait_events = maximum_wait_objects;
  wsa_wait_failed         = $ffffffff;
  wsa_wait_event_0        = wait_object_0;
  wsa_wait_io_completion  = wait_io_completion;
  wsa_wait_timeout        = wait_timeout;
  wsa_infinite            = infinite;

{ Windows Sockets errors redefined as regular Berkeley error constants.
  These are commented out in Windows NT to avoid conflicts with errno.h.
  Use the WSA constants instead. }

  ewouldblock        =  wsaewouldblock;
  einprogress        =  wsaeinprogress;
  ealready           =  wsaealready;
  enotsock           =  wsaenotsock;
  edestaddrreq       =  wsaedestaddrreq;
  emsgsize           =  wsaemsgsize;
  eprototype         =  wsaeprototype;
  enoprotoopt        =  wsaenoprotoopt;
  eprotonosupport    =  wsaeprotonosupport;
  esocktnosupport    =  wsaesocktnosupport;
  eopnotsupp         =  wsaeopnotsupp;
  epfnosupport       =  wsaepfnosupport;
  eafnosupport       =  wsaeafnosupport;
  eaddrinuse         =  wsaeaddrinuse;
  eaddrnotavail      =  wsaeaddrnotavail;
  enetdown           =  wsaenetdown;
  enetunreach        =  wsaenetunreach;
  enetreset          =  wsaenetreset;
  econnaborted       =  wsaeconnaborted;
  econnreset         =  wsaeconnreset;
  enobufs            =  wsaenobufs;
  eisconn            =  wsaeisconn;
  enotconn           =  wsaenotconn;
  eshutdown          =  wsaeshutdown;
  etoomanyrefs       =  wsaetoomanyrefs;
  etimedout          =  wsaetimedout;
  econnrefused       =  wsaeconnrefused;
  eloop              =  wsaeloop;
  enametoolong       =  wsaenametoolong;
  ehostdown          =  wsaehostdown;
  ehostunreach       =  wsaehostunreach;
  enotempty          =  wsaenotempty;
  eproclim           =  wsaeproclim;
  eusers             =  wsaeusers;
  edquot             =  wsaedquot;
  estale             =  wsaestale;
  eremote            =  wsaeremote;


  wsadescription_len     =   256;
  wsasys_status_len      =   128;

type
  PWSAData = ^TWSAData;
  TWSAData = packed record
    wVersion       : Word;
    wHighVersion   : Word;
    szDescription  : Array[0..wsadescription_len] of Char;
    szSystemStatus : Array[0..wsasys_status_len] of Char;
    iMaxSockets    : Word;
    iMaxUdpDg      : Word;
    lpVendorInfo   : PChar;
  end;

{ wsaoverlapped = Record
    Internal: LongInt;
    InternalHigh: LongInt;
    Offset: LongInt;
    OffsetHigh: LongInt;
    hEvent: wsaevent;
  end;}
  wsaoverlapped   = TOverlapped;
  TWSAOverlapped  = WSAOverlapped;
  PWSAOverlapped  = ^WSAOverlapped;
  LPwsaoverlapped = PWSAOverlapped;

{ WinSock 2 extension -- WSABUF and QOS struct, include qos.h }
{ to pull in FLOWSPEC and related definitions }


  WSABUF = packed record
    len: U_LONG;  { the length of the buffer }
    buf: PChar; { the pointer to the buffer }
  end {WSABUF};
  PWSABUF = ^WSABUF;
  LPWSABUF = PWSABUF;

  TServiceType = LongInt;

  TFlowSpec = packed record
    TokenRate,               // In Bytes/sec
    TokenBucketSize,         // In Bytes
    PeakBandwidth,           // In Bytes/sec
    Latency,                 // In microseconds
    DelayVariation : LongInt;// In microseconds
    ServiceType : TServiceType;
    MaxSduSize, MinimumPolicedSize : LongInt;// In Bytes
  end;
  PFlowSpec = ^TFLOWSPEC;

  QOS = packed record
    SendingFlowspec: TFlowSpec; { the flow spec for data sending }
    ReceivingFlowspec: TFlowSpec; { the flow spec for data receiving }
    ProviderSpecific: WSABUF; { additional provider specific stuff }
  end;
  TQualityOfService = QOS;
  PQOS = ^QOS;
  LPQOS = PQOS;

const
  servicetype_notraffic             =  $00000000;  // No data in this direction
  servicetype_besteffort            =  $00000001;  // Best Effort
  servicetype_controlledload        =  $00000002;  // Controlled Load
  servicetype_guaranteed            =  $00000003;  // Guaranteed
  servicetype_network_unavailable   =  $00000004;  // Used to notify change to user
  servicetype_general_information   =  $00000005;  // corresponds to "General Parameters" defined by IntServ
  servicetype_nochange              =  $00000006;  // used to indicate that the flow spec contains no change from any previous one
// to turn on immediate traffic control, OR this flag with the ServiceType field in teh FLOWSPEC
  service_immediate_traffic_control =  $80000000;

//  WinSock 2 extension -- manifest constants for return values of the condition function
  cf_accept = $0000;
  cf_reject = $0001;
  cf_defer  = $0002;

//  WinSock 2 extension -- manifest constants for shutdown()
  sd_receive = $00;
  sd_send    = $01;
  sd_both    = $02;

//  WinSock 2 extension -- data type and manifest constants for socket groups
  sg_unconstrained_group = $01;
  sg_constrained_group   = $02;

type
  GROUP = DWORD;

//  WinSock 2 extension -- data type for WSAEnumNetworkEvents()
  TWSANetworkEvents = record
    lNetworkEvents: LongInt;
    iErrorCode: Array[0..fd_max_eventS-1] of Integer;
  end;
  PWSANetworkEvents = ^TWSANetworkEvents;
  LPWSANetworkEvents = PWSANetworkEvents;

//TransmitFile types used for the TransmitFile API function in WinNT/2000/XP

  {$NODEFINE PTransmitFileBuffers}
  PTransmitFileBuffers = ^TTransmitFileBuffers;
  {$NODEFINE _TRANSMIT_FILE_BUFFERS}
  _TRANSMIT_FILE_BUFFERS = record
      Head: Pointer;
      HeadLength: DWORD;
      Tail: Pointer;
      TailLength: DWORD;
  end;
  {$NODEFINE TTransmitFileBuffers}
  TTransmitFileBuffers = _TRANSMIT_FILE_BUFFERS;
  {$NODEFINE TRANSMIT_FILE_BUFFERS}
  TRANSMIT_FILE_BUFFERS = _TRANSMIT_FILE_BUFFERS;

//  WinSock 2 extension -- WSAPROTOCOL_INFO structure

{$ifndef ver130}
  TGUID = packed record
    D1: LongInt;
    D2: Word;
    D3: Word;
    D4: Array[0..7] of Byte;
  end;
  PGUID = ^TGUID;
{$endif}
  LPGUID = PGUID;

//  WinSock 2 extension -- WSAPROTOCOL_INFO manifest constants
const
  max_protocol_chain = 7;
  base_protocol      = 1;
  layered_protocol   = 0;
  wsaprotocol_len    = 255;

type
  TWSAProtocolChain = record
    ChainLen: Integer;  // the length of the chain,
    // length = 0 means layered protocol,
    // length = 1 means base protocol,
    // length > 1 means protocol chain
    ChainEntries: Array[0..MAX_PROTOCOL_CHAIN-1] of LongInt; // a list of dwCatalogEntryIds
  end;

type
  TWSAProtocol_InfoA = record
    dwServiceFlags1: LongInt;
    dwServiceFlags2: LongInt;
    dwServiceFlags3: LongInt;
    dwServiceFlags4: LongInt;
    dwProviderFlags: LongInt;
    ProviderId: TGUID;
    dwCatalogEntryId: LongInt;
    ProtocolChain: TWSAProtocolChain;
    iVersion: Integer;
    iAddressFamily: Integer;
    iMaxSockAddr: Integer;
    iMinSockAddr: Integer;
    iSocketType: Integer;
    iProtocol: Integer;
    iProtocolMaxOffset: Integer;
    iNetworkByteOrder: Integer;
    iSecurityScheme: Integer;
    dwMessageSize: LongInt;
    dwProviderReserved: LongInt;
    szProtocol: Array[0..WSAPROTOCOL_LEN+1-1] of Char;
  end {TWSAProtocol_InfoA};
  PWSAProtocol_InfoA = ^TWSAProtocol_InfoA;
  LPWSAProtocol_InfoA = PWSAProtocol_InfoA;

  TWSAProtocol_InfoW = record
    dwServiceFlags1: LongInt;
    dwServiceFlags2: LongInt;
    dwServiceFlags3: LongInt;
    dwServiceFlags4: LongInt;
    dwProviderFlags: LongInt;
    ProviderId: TGUID;
    dwCatalogEntryId: LongInt;
    ProtocolChain: TWSAProtocolChain;
    iVersion: Integer;
    iAddressFamily: Integer;
    iMaxSockAddr: Integer;
    iMinSockAddr: Integer;
    iSocketType: Integer;
    iProtocol: Integer;
    iProtocolMaxOffset: Integer;
    iNetworkByteOrder: Integer;
    iSecurityScheme: Integer;
    dwMessageSize: LongInt;
    dwProviderReserved: LongInt;
    szProtocol: Array[0..WSAPROTOCOL_LEN+1-1] of WideChar;
  end {TWSAProtocol_InfoW};
  PWSAProtocol_InfoW = ^TWSAProtocol_InfoW;
  LPWSAProtocol_InfoW = PWSAProtocol_InfoW;

{$IFDEF UNICODE}
  WSAProtocol_Info = TWSAProtocol_InfoW;
  TWSAProtocol_Info = TWSAProtocol_InfoW;
  PWSAProtocol_Info = PWSAProtocol_InfoW;
  LPWSAProtocol_Info = PWSAProtocol_InfoW;
{$ELSE}
  WSAProtocol_Info = TWSAProtocol_InfoA;
  TWSAProtocol_Info = TWSAProtocol_InfoA;
  PWSAProtocol_Info = PWSAProtocol_InfoA;
  LPWSAProtocol_Info = PWSAProtocol_InfoA;
{$ENDIF}

const
//  flag bit definitions for dwProviderFlags
  pfl_multiple_proto_entries   = $00000001;
  pfl_recommended_proto_entry  = $00000002;
  pfl_hidden                   = $00000004;
  pfl_matches_protocol_zero    = $00000008;

//  flag bit definitions for dwServiceFlags1
  xp1_connectionless           = $00000001;
  xp1_guaranteed_delivery      = $00000002;
  xp1_guaranteed_order         = $00000004;
  xp1_message_oriented         = $00000008;
  xp1_pseudo_stream            = $00000010;
  xp1_graceful_close           = $00000020;
  xp1_expedited_data           = $00000040;
  xp1_connect_data             = $00000080;
  xp1_disconnect_data          = $00000100;
  xp1_support_broadcast        = $00000200;
  xp1_support_multipoint       = $00000400;
  xp1_multipoint_control_plane = $00000800;
  xp1_multipoint_data_plane    = $00001000;
  xp1_qos_supported            = $00002000;
  xp1_interrupt                = $00004000;
  xp1_uni_send                 = $00008000;
  xp1_uni_recv                 = $00010000;
  xp1_ifs_handles              = $00020000;
  xp1_partial_message          = $00040000;

  bigendian    = $0000;
  littleendian = $0001;

  security_protocol_none = $0000;

//  WinSock 2 extension -- manifest constants for WSAJoinLeaf()
  jl_sender_only   = $01;
  jl_receiver_only = $02;
  jl_both          = $04;

//  WinSock 2 extension -- manifest constants for WSASocket()
  wsa_flag_overlapped        = $01;
  wsa_flag_multipoint_c_root = $02;
  wsa_flag_multipoint_c_leaf = $04;
  wsa_flag_multipoint_d_root = $08;
  wsa_flag_multipoint_d_leaf = $10;

//  WinSock 2 extension -- manifest constants for WSAIoctl()
  ioc_unix      = $00000000;
  ioc_ws2       = $08000000;
  ioc_protocol  = $10000000;
  ioc_vendor    = $18000000;

  sio_associate_handle                =  1 or ioc_ws2 or ioc_in;
  sio_enable_circular_queueing        =  2 or ioc_ws2 or ioc_void;
  sio_find_route                      =  3 or ioc_ws2 or ioc_out;
  sio_flush                           =  4 or ioc_ws2 or ioc_void;
  sio_get_broadcast_address           =  5 or ioc_ws2 or ioc_out;
  sio_get_extension_function_pointer  =  6 or ioc_ws2 or ioc_inout;
  sio_get_qos                         =  7 or ioc_ws2 or ioc_inout;
  sio_get_group_qos                   =  8 or ioc_ws2 or ioc_inout;
  sio_multipoint_loopback             =  9 or ioc_ws2 or ioc_in;
  sio_multicast_scope                 = 10 or ioc_ws2 or ioc_in;
  sio_set_qos                         = 11 or ioc_ws2 or ioc_in;
  sio_set_group_qos                   = 12 or ioc_ws2 or ioc_in;
  sio_translate_handle                = 13 or ioc_ws2 or ioc_inout;
  sio_routing_interface_query         = 20 or ioc_ws2 or ioc_inout;
  sio_routing_interface_change        = 21 or ioc_ws2 or ioc_in;
  sio_address_list_query              = 22 or ioc_ws2 or ioc_out; // see below SOCKET_ADDRESS_LIST
  sio_address_list_change             = 23 or ioc_ws2 or ioc_void;
  sio_query_target_pnp_handle         = 24 or ioc_ws2 or ioc_out;
  sio_address_list_sort               = 25 or ioc_ws2 or ioc_inout;

//  WinSock 2 extension -- manifest constants for SIO_TRANSLATE_HANDLE ioctl
  th_netdev = $00000001;
  th_tapi   = $00000002;

type


//  Manifest constants and type definitions related to name resolution and
//  registration (RNR) API
  TBLOB = packed record
    cbSize : U_LONG;
    pBlobData : PBYTE;
  end;
  PBLOB = ^TBLOB;

//  Service Install Flags

const
  service_multiple = $00000001;

// & name spaces
  ns_all         =  0;

  ns_sap         =  1;
  ns_nds         =  2;
  ns_peer_browse =  3;

  ns_tcpip_local = 10;
  ns_tcpip_hosts = 11;
  ns_dns         = 12;
  ns_netbt       = 13;
  ns_wins        = 14;

  ns_nbp         = 20;

  ns_ms          = 30;
  ns_stda        = 31;
  ns_ntds        = 32;

  ns_x500        = 40;
  ns_nis         = 41;
  ns_nisplus     = 42;

  ns_wrq         = 50;

  ns_netdes      = 60;

{ Resolution flags for WSAGetAddressByName().
  Note these are also used by the 1.1 API GetAddressByName, so leave them around. }
  res_unused_1    = $00000001;
  res_flush_cache = $00000002;
  res_service     = $00000004;

{ Well known value names for Service Types }
  service_type_value_ipxporta              = 'IpxSocket';    {Do not Localize}
  service_type_value_ipxportw : PWideChar  = 'IpxSocket';    {Do not Localize}
  service_type_value_sapida                = 'SapId';    {Do not Localize}
  service_type_value_sapidw : PWideChar    = 'SapId';    {Do not Localize}

  service_type_value_tcpporta              = 'TcpPort';    {Do not Localize}
  service_type_value_tcpportw : PWideChar  = 'TcpPort';    {Do not Localize}

  service_type_value_udpporta              = 'UdpPort';    {Do not Localize}
  service_type_value_udpportw : PWideChar  = 'UdpPort';    {Do not Localize}

  service_type_value_objectida             = 'ObjectId';    {Do not Localize}
  service_type_value_objectidw : PWideChar = 'ObjectId';    {Do not Localize}

  {service_type_value_sapid    = service_type_value_sapidw;}
  {service_type_value_tcpport  = service_type_value_tcpportw;}
  {service_type_value_udpport  = service_type_value_udpportw;}
  {service_type_value_objectid = service_type_value_objectidw;}


{$IFDEF UNICODE}
  service_type_value_sapid : PWideChar = 'SapId'; 
  service_type_value_tcpport : PWideChar = 'TcpPort';
  service_type_value_udpport : PWideChar = 'UdpPort';
  service_type_value_objectid : PWideChar = 'ObjectId';
{$ELSE}
  service_type_value_sapid    = service_type_value_sapida;
  service_type_value_tcpport  = service_type_value_tcpporta;
  service_type_value_udpport  = service_type_value_udpporta;
  service_type_value_objectid = service_type_value_objectida;
{$ENDIF}

// SockAddr Information
type
  SOCKET_ADDRESS = packed record
    lpSockaddr : PSockAddr;
    iSockaddrLength : Integer;
  end;
  PSOCKET_ADDRESS = ^SOCKET_ADDRESS;

// CSAddr Information
  CSADDR_INFO = packed record
    LocalAddr, RemoteAddr  : SOCKET_ADDRESS;
    iSocketType, iProtocol : LongInt;
  end;
  PCSADDR_INFO = ^CSADDR_INFO;
  LPCSADDR_INFO = ^CSADDR_INFO;

// Address list returned via WSAIoctl( SIO_ADDRESS_LIST_QUERY )
  SOCKET_ADDRESS_LIST = packed record
    iAddressCount : Integer;
    Address       : Array [0..0] of SOCKET_ADDRESS;
  end;
  lpsocket_ADDRESS_LIST = ^SOCKET_ADDRESS_LIST;

// Address Family/Protocol Tuples
  AFProtocols = record
    iAddressFamily : Integer;
    iProtocol      : Integer;
  end;
  TAFProtocols = AFProtocols;
  PAFProtocols = ^TAFProtocols;


//  Client Query API Typedefs

// The comparators
  TWSAEComparator = (COMP_EQUAL {= 0}, COMP_NOTLESS );

  TWSAVersion = record
    dwVersion : DWORD;
    ecHow     : TWSAEComparator;
  end;
  PWSAVersion = ^TWSAVersion;

  TWSAQuerySetA = packed record
    dwSize                  : DWORD;
    lpszServiceInstanceName : PChar;
    lpServiceClassId        : PGUID;
    lpVersion               : PWSAVERSION;
    lpszComment             : PChar;
    dwNameSpace             : DWORD;
    lpNSProviderId          : PGUID;
    lpszContext             : PChar;
    dwNumberOfProtocols     : DWORD;
    lpafpProtocols          : PAFProtocols;
    lpszQueryString         : PChar;
    dwNumberOfCsAddrs       : DWORD;
    lpcsaBuffer             : PCSADDR_INFO;
    dwOutputFlags           : DWORD;
    lpBlob                  : PBLOB;
  end;
  PWSAQuerySetA = ^TWSAQuerySetA;
  LPWSAQuerySetA = PWSAQuerySetA;

  TWSAQuerySetW = packed record
    dwSize                  : DWORD;
    lpszServiceInstanceName : PWideChar;
    lpServiceClassId        : PGUID;
    lpVersion               : PWSAVERSION;
    lpszComment             : PWideChar;
    dwNameSpace             : DWORD;
    lpNSProviderId          : PGUID;
    lpszContext             : PWideChar;
    dwNumberOfProtocols     : DWORD;
    lpafpProtocols          : PAFProtocols;
    lpszQueryString         : PWideChar;
    dwNumberOfCsAddrs       : DWORD;
    lpcsaBuffer             : PCSADDR_INFO;
    dwOutputFlags           : DWORD;
    lpBlob                  : PBLOB;
  end;
  PWSAQuerySetW = ^TWSAQuerySetW;
  LPWSAQuerySetW = PWSAQuerySetW;

{$IFDEF UNICODE}
  TWSAQuerySet  = TWSAQuerySetA;
  PWSAQuerySet  = PWSAQuerySetW;
  LPWSAQuerySet = PWSAQuerySetW;
{$ELSE}
  TWSAQuerySet  = TWSAQuerySetA;
  PWSAQuerySet  = PWSAQuerySetA;
  LPWSAQuerySet = PWSAQuerySetA;
{$ENDIF}

const
  lup_deep                = $0001;
  lup_containers          = $0002;
  lup_nocontainers        = $0004;
  lup_nearest             = $0008;
  lup_return_name         = $0010;
  lup_return_type         = $0020;
  lup_return_version      = $0040;
  lup_return_comment      = $0080;
  lup_return_addr         = $0100;
  lup_return_blob         = $0200;
  lup_return_aliases      = $0400;
  lup_return_query_string = $0800;
  lup_return_all          = $0FF0;
  lup_res_service         = $8000;

  lup_flushcache          = $1000;
  lup_flushprevious       = $2000;

// Return flags
  result_is_alias = $0001;

type
// Service Address Registration and Deregistration Data Types.
  TWSAeSetServiceOp = ( RNRSERVICE_REGISTER{=0}, RNRSERVICE_DEREGISTER, RNRSERVICE_DELETE );

{ Service Installation/Removal Data Types. }
  TWSANSClassInfoA = packed record
    lpszName    : PChar;
    dwNameSpace : DWORD;
    dwValueType : DWORD;
    dwValueSize : DWORD;
    lpValue     : Pointer;
  end;
  PWSANSClassInfoA = ^TWSANSClassInfoA;

  TWSANSClassInfoW = packed record
    lpszName    : PWideChar;
    dwNameSpace : DWORD;
    dwValueType : DWORD;
    dwValueSize : DWORD;
    lpValue     : Pointer;
  end {TWSANSClassInfoW};
  PWSANSClassInfoW = ^TWSANSClassInfoW;

{$IFDEF UNICODE}
  WSANSClassInfo   = TWSANSClassInfoW;
  TWSANSClassInfo  = TWSANSClassInfoW;
  PWSANSClassInfo  = PWSANSClassInfoW;
  LPWSANSClassInfo = PWSANSClassInfoW;
{$ELSE}
  WSANSClassInfo   = TWSANSClassInfoA;
  TWSANSClassInfo  = TWSANSClassInfoA;
  PWSANSClassInfo  = PWSANSClassInfoA;
  LPWSANSClassInfo = PWSANSClassInfoA;
{$ENDIF // UNICODE}

  TWSAServiceClassInfoA = packed record
    lpServiceClassId     : PGUID;
    lpszServiceClassName : PChar;
    dwCount              : DWORD;
    lpClassInfos         : PWSANSClassInfoA;
  end;
  PWSAServiceClassInfoA  = ^TWSAServiceClassInfoA;
  LPWSAServiceClassInfoA = PWSAServiceClassInfoA;

  TWSAServiceClassInfoW = packed record
    lpServiceClassId     : PGUID;
    lpszServiceClassName : PWideChar;
    dwCount              : DWORD;
    lpClassInfos         : PWSANSClassInfoW;
  end;
  PWSAServiceClassInfoW  = ^TWSAServiceClassInfoW;
  LPWSAServiceClassInfoW = PWSAServiceClassInfoW;

{$IFDEF UNICODE}
  WSAServiceClassInfo   = TWSAServiceClassInfoW;
  TWSAServiceClassInfo  = TWSAServiceClassInfoW;
  PWSAServiceClassInfo  = PWSAServiceClassInfoW;
  LPWSAServiceClassInfo = PWSAServiceClassInfoW;
{$ELSE}
  WSAServiceClassInfo   = TWSAServiceClassInfoA;
  TWSAServiceClassInfo  = TWSAServiceClassInfoA;
  PWSAServiceClassInfo  = PWSAServiceClassInfoA;
  LPWSAServiceClassInfo = PWSAServiceClassInfoA;
{$ENDIF}

  TWSANameSpace_InfoA = packed record
    NSProviderId   : TGUID;
    dwNameSpace    : DWORD;
    fActive        : DWORD{Bool};
    dwVersion      : DWORD;
    lpszIdentifier : PChar;
  end;
  PWSANameSpace_InfoA = ^TWSANameSpace_InfoA;
  LPWSANameSpace_InfoA = PWSANameSpace_InfoA;

  TWSANameSpace_InfoW = packed record
    NSProviderId   : TGUID;
    dwNameSpace    : DWORD;
    fActive        : DWORD{Bool};
    dwVersion      : DWORD;
    lpszIdentifier : PWideChar;
  end {TWSANameSpace_InfoW};
  PWSANameSpace_InfoW = ^TWSANameSpace_InfoW;
  LPWSANameSpace_InfoW = PWSANameSpace_InfoW;

{$IFDEF UNICODE}
  WSANameSpace_Info   = TWSANameSpace_InfoW;
  TWSANameSpace_Info  = TWSANameSpace_InfoW;
  PWSANameSpace_Info  = PWSANameSpace_InfoW;
  LPWSANameSpace_Info = PWSANameSpace_InfoW;
{$ELSE}
  WSANameSpace_Info   = TWSANameSpace_InfoA;
  TWSANameSpace_Info  = TWSANameSpace_InfoA;
  PWSANameSpace_Info  = PWSANameSpace_InfoA;
  LPWSANameSpace_Info = PWSANameSpace_InfoA;
{$ENDIF}

{ WinSock 2 extensions -- data types for the condition function in }
{ WSAAccept() and overlapped I/O completion routine. }
type
  LPCONDITIONPROC = function (lpCallerId: LPWSABUF; lpCallerData : LPWSABUF; lpSQOS,lpGQOS : LPQOS; lpCalleeId,lpCalleeData : LPWSABUF;
    g : GROUP; dwCallbackData : DWORD ) : Integer; stdcall;
  LPwsaoverlapped_COMPLETION_ROUTINE = procedure ( const dwError, cbTransferred : DWORD; const lpOverlapped : LPwsaoverlapped; const dwFlags : DWORD ); stdcall;

function WSAStartup( const wVersionRequired: word; var WSData: TWSAData ): Integer; stdcall;

type
  lpfn_WSASTARTUP = function ( const wVersionRequired: word; var WSData: TWSAData ): Integer; stdcall;
  lpfn_WSACLEANUP = function : Integer; stdcall;
  lpfn_ACCEPT = function ( const s: TSocket; addr: PSockAddr; addrlen: PInteger ): TSocket; stdcall;
  lpfn_BIND = function ( const s: TSocket; const name: PSockAddr; const namelen: Integer ): Integer; stdcall;
  lpfn_CLOSESOCKET = function ( const s: TSocket ): Integer; stdcall;
  lpfn_CONNECT = function ( const s: TSocket; const name: PSockAddr; const namelen: Integer): Integer; stdcall;
  lpfn_IOCTLSOCKET = function ( const s: TSocket; const cmd: DWORD; var arg: u_long ): Integer; stdcall;
  lpfn_GETPEERNAME = function ( const s: TSocket; const name: PSockAddr; var namelen: Integer ): Integer; stdcall;
  lpfn_GETSOCKNAME = function ( const s: TSocket; const name: PSockAddr; var namelen: Integer ): Integer; stdcall;
  lpfn_GETSOCKOPT = function ( const s: TSocket; const level, optname: Integer; optval: PChar; var optlen: Integer ): Integer; stdcall;
  lpfn_HTONL = function (hostlong: u_long): u_long; stdcall;
  lpfn_HTONS = function (hostshort: u_short): u_short; stdcall;
  lpfn_INET_ADDR = function (cp: PChar): u_long; stdcall;
  lpfn_INET_NTOA = function (inaddr: TInAddr): PChar; stdcall;
  lpfn_LISTEN = function ( const s: TSocket; backlog: Integer ): Integer; stdcall;
  lpfn_NTOHL = function (netlong: u_long): u_long; stdcall;
  lpfn_NTOHS = function (netshort: u_short): u_short; stdcall;
  lpfn_RECV = function ( const s: TSocket; var Buf; len, flags: Integer ): Integer; stdcall;
  lpfn_RECVFROM = function ( const s: TSocket; var Buf; len, flags: Integer; from: PSockAddr; fromlen: PInteger ): Integer; stdcall;
  lpfn_SELECT = function (nfds: Integer; readfds, writefds, exceptfds: PFDSet; timeout: PTimeVal ): Integer; stdcall;
  lpfn_SEND = function ( const s: TSocket; var Buf; len, flags: Integer ): Integer; stdcall;
  lpfn_SENDTO = function ( const s: TSocket; var Buf; const len, flags: Integer; const addrto: PSockAddr; const tolen: Integer ): Integer; stdcall;
  lpfn_SETSOCKOPT = function ( const s: TSocket; const level, optname: Integer; optval: PChar; const optlen: Integer ): Integer; stdcall;
  lpfn_SHUTDOWN = function ( const s: TSocket; const how: Integer ): Integer; stdcall;
  lpfn_SOCKET = function ( const af, istruct, protocol: Integer ): TSocket; stdcall;
  lpfn_GETHOSTBYADDR = function ( addr: Pointer; const len, addrtype: Integer ): PHostEnt; stdcall;
  lpfn_GETHOSTBYNAME = function ( name: PChar ): PHostEnt; stdcall;
  lpfn_GETHOSTNAME = function ( name: PChar; len: Integer ): Integer; stdcall;
  lpfn_GETSERVBYPORT = function ( const port: Integer; const proto: PChar ): PServEnt; stdcall;
  lpfn_GETSERVBYNAME = function ( const name, proto: PChar ): PServEnt; stdcall;
  lpfn_GETPROTOBYNUMBER = function ( const proto: Integer ): PProtoEnt; stdcall;
  lpfn_GETPROTOBYNAME = function ( const name: PChar ): PProtoEnt; stdcall;
  lpfn_WSASETLASTERROR = procedure ( const iError: Integer ); stdcall;
  lpfn_WSAGETLASTERROR = function : Integer; stdcall;
  lpfn_WSAISBLOCKING = function : BOOL; stdcall;
  lpfn_WSAUNHOOKBLOCKINGHOOK = function : Integer; stdcall;
  lpfn_WSASETBLOCKINGHOOK = function ( lpBlockFunc: TFarProc ): TFarProc; stdcall;
  lpfn_WSACANCELBLOCKINGCALL = function : Integer; stdcall;
  lpfn_WSAASYNCGETSERVBYNAME = function ( HWindow: HWND; wMsg: u_int; name, proto, buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSAASYNCGETSERVBYPORT = function ( HWindow: HWND; wMsg, port: u_int; proto, buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSAASYNCGETPROTOBYNAME = function ( HWindow: HWND; wMsg: u_int; name, buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSAASYNCGETPROTOBYNUMBER = function ( HWindow: HWND; wMsg: u_int; number: Integer; buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSAASYNCGETHOSTBYNAME = function ( HWindow: HWND; wMsg: u_int; name, buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSAASYNCGETHOSTBYADDR = function ( HWindow: HWND; wMsg: u_int; addr: PChar; len, istruct: Integer; buf: PChar; buflen: Integer ): THandle; stdcall;
  lpfn_WSACANCELASYNCREQUEST = function ( hAsyncTaskHandle: THandle ): Integer; stdcall;
  lpfn_WSAASYNCSELECT = function ( const s: TSocket; HWindow: HWND; wMsg: u_int; lEvent: Longint ): Integer; stdcall;
  lpfn___WSAFDISSET = function ( const s: TSocket; var FDSet: TFDSet ): Bool; stdcall;

// WinSock 2 API new function prototypes
  lpfn_WSAACCEPT = function ( const s : TSocket; addr : PSockAddr; addrlen : PInteger; lpfnCondition : LPCONDITIONPROC; const dwCallbackData : DWORD ): TSocket; stdcall;
  lpfn_WSACLOSEEVENT = function ( const hEvent : wsaevent ) : WordBool; stdcall;
  lpfn_WSACONNECT = function ( const s : TSocket; const name : PSockAddr; const namelen : Integer; lpCallerData,lpCalleeData : LPWSABUF; lpSQOS,lpGQOS : LPQOS ) : Integer; stdcall;
  lpfn_WSACREATEEVENT  = function : wsaevent; stdcall;

  lpfn_WSADUPLICATESOCKETA = function ( const s : TSocket; const dwProcessId : DWORD; lpProtocolInfo : LPWSAProtocol_InfoA ) : Integer; stdcall;
  lpfn_WSADUPLICATESOCKETW = function ( const s : TSocket; const dwProcessId : DWORD; lpProtocolInfo : LPWSAProtocol_InfoW ) : Integer; stdcall;
  lpfn_WSADUPLICATESOCKET = function ( const s : TSocket; const dwProcessId : DWORD; lpProtocolInfo : LPWSAProtocol_Info ) : Integer; stdcall;

  lpfn_WSAENUMNETWORKEVENTS = function ( const s : TSocket; const hEventObject : wsaevent; lpNetworkEvents : LPWSANETWORKEVENTS ) :Integer; stdcall;
  lpfn_WSAENUMPROTOCOLSA = function ( lpiProtocols : PInteger; lpProtocolBuffer : LPWSAProtocol_InfoA; var lpdwBufferLength : DWORD ) : Integer; stdcall;
  lpfn_WSAENUMPROTOCOLSW = function ( lpiProtocols : PInteger; lpProtocolBuffer : LPWSAProtocol_InfoW; var lpdwBufferLength : DWORD ) : Integer; stdcall;
  lpfn_WSAENUMPROTOCOLS = function ( lpiProtocols : PInteger; lpProtocolBuffer : LPWSAProtocol_Info; var lpdwBufferLength : DWORD ) : Integer; stdcall;

  lpfn_wsaeventSELECT = function ( const s : TSocket; const hEventObject : wsaevent; lNetworkEvents : LongInt ): Integer; stdcall;

  lpfn_WSAGETOVERLAPPEDRESULT = function ( const s : TSocket; lpOverlapped : LPwsaoverlapped; lpcbTransfer : LPDWORD; fWait : BOOL; var lpdwFlags : DWORD ) : WordBool; stdcall;

  lpfn_WSAGETQOSBYNAME = function ( const s : TSocket; lpQOSName : LPWSABUF; lpQOS : LPQOS ): WordBool; stdcall;

  lpfn_WSAHTONL = function ( const s : TSocket; hostlong : u_long; var lpnetlong : DWORD ): Integer; stdcall;
  lpfn_WSAHTONS = function ( const s : TSocket; hostshort : u_short; var lpnetshort : WORD ): Integer; stdcall;

  lpfn_WSAIOCTL = function ( const s : TSocket; dwIoControlCode : DWORD; lpvInBuffer : Pointer; cbInBuffer : DWORD; lpvOutBuffer : Pointer; cbOutBuffer : DWORD;
    lpcbBytesReturned : LPDWORD; lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ) : Integer; stdcall;

  lpfn_WSAJOINLEAF = function ( const s : TSocket; name : PSockAddr; namelen : Integer; lpCallerData,lpCalleeData : LPWSABUF;
	  lpSQOS,lpGQOS : LPQOS; dwFlags : DWORD ) : TSocket; stdcall;

  lpfn_WSANTOHL = function ( const s : TSocket; netlong : u_long; var lphostlong : DWORD ): Integer; stdcall;
  lpfn_WSANTOHS = function ( const s : TSocket; netshort : u_short; var lphostshort : WORD ): Integer; stdcall;

  lpfn_WSARECV = function ( const s : TSocket; lpBuffers : LPWSABUF; dwBufferCount : DWORD; var lpNumberOfBytesRecvd : DWORD; var lpFlags : DWORD;
    lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ): Integer; stdcall;
  lpfn_WSARECVDISCONNECT = function ( const s : TSocket; lpInboundDisconnectData : LPWSABUF ): Integer; stdcall;
  lpfn_WSARECVFROM = function ( const s : TSocket; lpBuffers : LPWSABUF; dwBufferCount : DWORD; var lpNumberOfBytesRecvd : DWORD; var lpFlags : DWORD;
    lpFrom : PSockAddr; lpFromlen : PInteger; lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ): Integer; stdcall;

  lpfn_WSARESETEVENT = function ( hEvent : wsaevent ): WordBool; stdcall;

  lpfn_WSASEND = function ( const s : TSocket; lpBuffers : LPWSABUF; dwBufferCount : DWORD; var lpNumberOfBytesSent : DWORD; dwFlags : DWORD;
    lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ): Integer; stdcall;
  lpfn_WSASENDDISCONNECT = function ( const s : TSocket; lpOutboundDisconnectData : LPWSABUF ): Integer; stdcall;
  lpfn_WSASENDTO = function ( const s : TSocket; lpBuffers : LPWSABUF; dwBufferCount : DWORD; var lpNumberOfBytesSent : DWORD; dwFlags : DWORD;
    lpTo : PSockAddr; iTolen : Integer; lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ): Integer; stdcall;

  lpfn_WSASETEVENT = function ( hEvent : wsaevent ): WordBool; stdcall;

  lpfn_WSASOCKETA = function ( af, iType, protocol : Integer; lpProtocolInfo : LPWSAProtocol_InfoA; g : GROUP; dwFlags : DWORD ): TSocket; stdcall;
  lpfn_WSASOCKETW = function ( af, iType, protocol : Integer; lpProtocolInfo : LPWSAProtocol_InfoW; g : GROUP; dwFlags : DWORD ): TSocket; stdcall;
  lpfn_WSASOCKET = function ( af, iType, protocol : Integer; lpProtocolInfo : LPWSAProtocol_Info; g : GROUP; dwFlags : DWORD ): TSocket; stdcall;

  lpfn_WSAWAITFORMULTIPLEEVENTS = function ( cEvents : DWORD; lphEvents : Pwsaevent; fWaitAll : LongBool;
	  dwTimeout : DWORD; fAlertable : LongBool ): DWORD; stdcall;

  lpfn_WSAADDRESSTOSTRINGA = function ( lpsaAddress : PSockAddr; const dwAddressLength : DWORD; const lpProtocolInfo : LPWSAProtocol_InfoA;
	  const lpszAddressString : PChar; var lpdwAddressStringLength : DWORD ): Integer; stdcall;
  lpfn_WSAADDRESSTOSTRINGW = function ( lpsaAddress : PSockAddr; const dwAddressLength : DWORD; const lpProtocolInfo : LPWSAProtocol_InfoW;
	  const lpszAddressString : PWideChar; var lpdwAddressStringLength : DWORD ): Integer; stdcall;
  lpfn_WSAADDRESSTOSTRING = function ( lpsaAddress : PSockAddr; const dwAddressLength : DWORD; const lpProtocolInfo : LPWSAProtocol_Info;
	  const lpszAddressString : PMBChar; var lpdwAddressStringLength : DWORD ): Integer; stdcall;

  lpfn_WSASTRINGTOADDRESSA = function ( const AddressString : PChar; const AddressFamily: Integer; const lpProtocolInfo : LPWSAProtocol_InfoA;
	  var lpAddress : TSockAddr; var lpAddressLength : Integer ): Integer; stdcall;
  lpfn_WSASTRINGTOADDRESSW = function ( const AddressString : PWideChar; const AddressFamily: Integer; const lpProtocolInfo : LPWSAProtocol_InfoW;
	  var lpAddress : TSockAddr; var lpAddressLength : Integer ): Integer; stdcall;
  lpfn_WSASTRINGTOADDRESS = function ( const AddressString : PMBChar; const AddressFamily: Integer; const lpProtocolInfo : LPWSAProtocol_Info;
	  var lpAddress : TSockAddr; var lpAddressLength : Integer ): Integer; stdcall;

// Registration and Name Resolution API functions 
  lpfn_WSALOOKUPSERVICEBEGINA = function ( var qsRestrictions : TWSAQuerySetA; const dwControlFlags : DWORD; var hLookup : THANDLE ): Integer; stdcall;
  lpfn_WSALOOKUPSERVICEBEGINW = function ( var qsRestrictions : TWSAQuerySetW; const dwControlFlags : DWORD; var hLookup : THANDLE ): Integer; stdcall;
  lpfn_WSALOOKUPSERVICEBEGIN = function ( var qsRestrictions : TWSAQuerySet; const dwControlFlags : DWORD; var hLookup : THANDLE ): Integer; stdcall;

  lpfn_WSALOOKUPSERVICENEXTA = function ( const hLookup : THandle; const dwControlFlags : DWORD; var dwBufferLength : DWORD; lpqsResults : PWSAQuerySetA ): Integer; stdcall;
  lpfn_WSALOOKUPSERVICENEXTW = function ( const hLookup : THandle; const dwControlFlags : DWORD; var dwBufferLength : DWORD; lpqsResults : PWSAQuerySetW ): Integer; stdcall;
  lpfn_WSALOOKUPSERVICENEXT = function ( const hLookup : THandle; const dwControlFlags : DWORD; var dwBufferLength : DWORD; lpqsResults : PWSAQuerySet ): Integer; stdcall;

  lpfn_WSALOOKUPSERVICEEND = function ( const hLookup : THandle ): Integer; stdcall;

  lpfn_WSAINSTALLSERVICECLASSA = function ( const lpServiceClassInfo : LPWSAServiceClassInfoA ) : Integer; stdcall;
  lpfn_WSAINSTALLSERVICECLASSW = function ( const lpServiceClassInfo : LPWSAServiceClassInfoW ) : Integer; stdcall;
  lpfn_WSAINSTALLSERVICECLASS = function ( const lpServiceClassInfo : LPWSAServiceClassInfo ) : Integer; stdcall;

  lpfn_WSAREMOVESERVICECLASS = function ( const lpServiceClassId : PGUID ) : Integer; stdcall;

  lpfn_WSAGETSERVICECLASSINFOA = function ( const lpProviderId : PGUID; const lpServiceClassId : PGUID; var lpdwBufSize : DWORD;
	  lpServiceClassInfo : LPWSAServiceClassInfoA ): Integer; stdcall;
  lpfn_WSAGETSERVICECLASSINFOW = function ( const lpProviderId : PGUID; const lpServiceClassId : PGUID; var lpdwBufSize : DWORD;
	  lpServiceClassInfo : LPWSAServiceClassInfoW ): Integer; stdcall;
  lpfn_WSAGETSERVICECLASSINFO = function ( const lpProviderId : PGUID; const lpServiceClassId : PGUID; var lpdwBufSize : DWORD;
	  lpServiceClassInfo : LPWSAServiceClassInfo ): Integer; stdcall;

  lpfn_WSAENUMNAMESPACEPROVIDERSA = function ( var lpdwBufferLength: DWORD; const lpnspBuffer: LPWSANameSpace_InfoA ): Integer; stdcall;
  lpfn_WSAENUMNAMESPACEPROVIDERSW = function ( var lpdwBufferLength: DWORD; const lpnspBuffer: LPWSANameSpace_InfoW ): Integer; stdcall;
  lpfn_WSAENUMNAMESPACEPROVIDERS = function ( var lpdwBufferLength: DWORD; const lpnspBuffer: LPWSANameSpace_Info ): Integer; stdcall;

  lpfn_WSAGETSERVICECLASSNAMEBYCLASSIDA = function ( const lpServiceClassId: PGUID; lpszServiceClassName: PChar; var lpdwBufferLength: DWORD ): Integer; stdcall;
  lpfn_WSAGETSERVICECLASSNAMEBYCLASSIDW = function ( const lpServiceClassId: PGUID; lpszServiceClassName: PWideChar; var lpdwBufferLength: DWORD ): Integer; stdcall;
  lpfn_WSAGETSERVICECLASSNAMEBYCLASSID = function ( const lpServiceClassId: PGUID; lpszServiceClassName: PMBChar; var lpdwBufferLength: DWORD ): Integer; stdcall;

  lpfn_WSASETSERVICEA = function ( const lpqsRegInfo: LPWSAQuerySetA; const essoperation: TWSAeSetServiceOp; const dwControlFlags: DWORD ): Integer; stdcall;
  lpfn_WSASETSERVICEW = function ( const lpqsRegInfo: LPWSAQuerySetW; const essoperation: TWSAeSetServiceOp; const dwControlFlags: DWORD ): Integer; stdcall;
  lpfn_WSASETSERVICE = function ( const lpqsRegInfo: LPWSAQuerySet; const essoperation: TWSAeSetServiceOp; const dwControlFlags: DWORD ): Integer; stdcall;

  lpfn_WSAPROVIDERCONFIGCHANGE = function ( var lpNotificationHandle : THandle; lpOverlapped : LPwsaoverlapped; lpCompletionRoutine : LPwsaoverlapped_COMPLETION_ROUTINE ) : Integer; stdcall;

       //microsoft specific extension
      {$NODEFINE TTransmitFileProc}
  TTransmitFileProc = function (hSocket: TSocket; hFile: THandle; nNumberOfBytesToWrite: DWORD;
    nNumberOfBytesPerSend: DWORD; lpOverlapped: POverlapped;
    lpTransmitBuffers: PTransmitFileBuffers; dwReserved: DWORD): BOOL; stdcall;
     {$NODEFINE TAcceptExProc}
  TAcceptExProc = function (sListenSocket, sAcceptSocket: TSocket;
    lpOutputBuffer: Pointer; dwReceiveDataLength, dwLocalAddressLength,
    dwRemoteAddressLength: DWORD; var lpdwBytesReceived: DWORD;
    lpOverlapped: POverlapped): BOOL; stdcall;
  {$NODEFINE TGetAcceptExSockaddrsProc}
  TGetAcceptExSockaddrsProc = procedure (lpOutputBuffer: Pointer;
    dwReceiveDataLength, dwLocalAddressLength, dwRemoteAddressLength: DWORD;
    var LocalSockaddr: TSockAddr; var LocalSockaddrLength: Integer;
    var RemoteSockaddr: TSockAddr; var RemoteSockaddrLength: Integer); stdcall;
    {$NODEFINE TWSARecvExProc}
  TWSARecvExProc = function (s: TSocket; var buf; len: Integer; var flags: Integer): Integer; stdcall;


{$IFDEF WS2_DLL_FUNC_VARS}
var
  WSACleanup : lpfn_WSACLEANUP;
  accept : lpfn_ACCEPT;
  bind : lpfn_BIND;
  closesocket : lpfn_CLOSESOCKET;
  connect : lpfn_CONNECT;
  ioctlsocket : lpfn_IOCTLSOCKET;
  getpeername : lpfn_GETPEERNAME;
  getsockname : lpfn_GETSOCKNAME;
  getsockopt : lpfn_GETSOCKOPT;
  htonl : lpfn_HTONL;
  htons : lpfn_HTONS;
  inet_addr : lpfn_INET_ADDR;
  inet_ntoa : lpfn_INET_NTOA;
  listen : lpfn_LISTEN;
  ntohl : lpfn_NTOHL;
  ntohs : lpfn_NTOHS;
  recv : lpfn_RECV;
  recvfrom : lpfn_RECVFROM;
  select : lpfn_SELECT;
  send : lpfn_SEND;
  sendto : lpfn_SENDTO;
  setsockopt : lpfn_SETSOCKOPT;
  shutdown : lpfn_SHUTDOWN;
  socket : lpfn_SOCKET;
  gethostbyaddr : lpfn_GETHOSTBYADDR;
  gethostbyname : lpfn_GETHOSTBYNAME;
  gethostname : lpfn_GETHOSTNAME;
  getservbyport : lpfn_GETSERVBYPORT;
  getservbyname : lpfn_GETSERVBYNAME;
  getprotobynumber : lpfn_GETPROTOBYNUMBER;
  getprotobyname : lpfn_GETPROTOBYNAME;
  WSASetLastError : lpfn_WSASETLASTERROR;
  WSAGetLastError : lpfn_WSAGETLASTERROR;
  WSAIsBlocking : lpfn_WSAISBLOCKING;
  WSAUnhookBlockingHook : lpfn_WSAUNHOOKBLOCKINGHOOK;
  WSASetBlockingHook : lpfn_WSASETBLOCKINGHOOK;
  WSACancelBlockingCall : lpfn_WSACANCELBLOCKINGCALL;
  WSAAsyncGetServByName : lpfn_WSAASYNCGETSERVBYNAME;
  WSAAsyncGetServByPort : lpfn_WSAASYNCGETSERVBYPORT;
  WSAAsyncGetProtoByName : lpfn_WSAASYNCGETPROTOBYNAME;
  WSAAsyncGetProtoByNumber : lpfn_WSAASYNCGETPROTOBYNUMBER;
  WSAAsyncGetHostByName : lpfn_WSAASYNCGETHOSTBYNAME;
  WSAAsyncGetHostByAddr : lpfn_WSAASYNCGETHOSTBYADDR;
  WSACancelAsyncRequest : lpfn_WSACANCELASYNCREQUEST;
  WSAAsyncSelect : lpfn_WSAASYNCSELECT;
  __WSAFDIsSet : lpfn___WSAFDISSET;
  WSAAccept : lpfn_WSAACCEPT;
  WSACloseEvent : lpfn_WSACLOSEEVENT;
  WSAConnect : lpfn_WSACONNECT;
  WSACreateEvent  : lpfn_WSACREATEEVENT ;
  WSADuplicateSocketA : lpfn_WSADUPLICATESOCKETA;
  WSADuplicateSocketW : lpfn_WSADUPLICATESOCKETW;
  WSADuplicateSocket : lpfn_WSADUPLICATESOCKET;
  WSAEnumNetworkEvents : lpfn_WSAENUMNETWORKEVENTS;
  WSAEnumProtocolsA : lpfn_WSAENUMPROTOCOLSA;
  WSAEnumProtocolsW : lpfn_WSAENUMPROTOCOLSW;
  WSAEnumProtocols : lpfn_WSAENUMPROTOCOLS;
  WSAEventSelect : lpfn_wsaeventSELECT;
  WSAGetOverlappedResult : lpfn_WSAGETOVERLAPPEDRESULT;
  WSAGetQosByName : lpfn_WSAGETQOSBYNAME;
  WSAHtonl : lpfn_WSAHTONL;
  WSAHtons : lpfn_WSAHTONS;
  WSAIoctl : lpfn_WSAIOCTL;
  WSAJoinLeaf : lpfn_WSAJOINLEAF;
  WSANtohl : lpfn_WSANTOHL;
  WSANtohs : lpfn_WSANTOHS;
  WSARecv : lpfn_WSARECV;
  WSARecvDisconnect : lpfn_WSARECVDISCONNECT;
  WSARecvFrom : lpfn_WSARECVFROM;
  WSAResetEvent : lpfn_WSARESETEVENT;
  WSASend : lpfn_WSASEND;
  WSASendDisconnect : lpfn_WSASENDDISCONNECT;
  WSASendTo : lpfn_WSASENDTO;
  WSASetEvent : lpfn_WSASETEVENT;
  WSASocketA : lpfn_WSASOCKETA;
  WSASocketW : lpfn_WSASOCKETW;
  WSASocket : lpfn_WSASOCKET;
  WSAWaitForMultipleEvents : lpfn_WSAWAITFORMULTIPLEEVENTS;
  WSAAddressToStringA : lpfn_WSAADDRESSTOSTRINGA;
  WSAAddressToStringW : lpfn_WSAADDRESSTOSTRINGW;
  WSAAddressToString : lpfn_WSAADDRESSTOSTRING;
  WSAStringToAddressA : lpfn_WSASTRINGTOADDRESSA;
  WSAStringToAddressW : lpfn_WSASTRINGTOADDRESSW;
  WSAStringToAddress : lpfn_WSASTRINGTOADDRESS;
  WSALookupServiceBeginA : lpfn_WSALOOKUPSERVICEBEGINA;
  WSALookupServiceBeginW : lpfn_WSALOOKUPSERVICEBEGINW;
  WSALookupServiceBegin : lpfn_WSALOOKUPSERVICEBEGIN;
  WSALookupServiceNextA : lpfn_WSALOOKUPSERVICENEXTA;
  WSALookupServiceNextW : lpfn_WSALOOKUPSERVICENEXTW;
  WSALookupServiceNext : lpfn_WSALOOKUPSERVICENEXT;
  WSALookupServiceEnd : lpfn_WSALOOKUPSERVICEEND;
  WSAInstallServiceClassA : lpfn_WSAINSTALLSERVICECLASSA;
  WSAInstallServiceClassW : lpfn_WSAINSTALLSERVICECLASSW;
  WSAInstallServiceClass : lpfn_WSAINSTALLSERVICECLASS;
  WSARemoveServiceClass : lpfn_WSAREMOVESERVICECLASS;
  WSAGetServiceClassInfoA : lpfn_WSAGETSERVICECLASSINFOA;
  WSAGetServiceClassInfoW : lpfn_WSAGETSERVICECLASSINFOW;
  WSAGetServiceClassInfo : lpfn_WSAGETSERVICECLASSINFO;
  WSAEnumNameSpaceProvidersA : lpfn_WSAENUMNAMESPACEPROVIDERSA;
  WSAEnumNameSpaceProvidersW : lpfn_WSAENUMNAMESPACEPROVIDERSW;
  WSAEnumNameSpaceProviders : lpfn_WSAENUMNAMESPACEPROVIDERS;
  WSAGetServiceClassNameByClassIdA : lpfn_WSAGETSERVICECLASSNAMEBYCLASSIDA;
  WSAGetServiceClassNameByClassIdW : lpfn_WSAGETSERVICECLASSNAMEBYCLASSIDW;
  WSAGetServiceClassNameByClassId : lpfn_WSAGETSERVICECLASSNAMEBYCLASSID;
  WSASetServiceA : lpfn_WSASETSERVICEA;
  WSASetServiceW : lpfn_WSASETSERVICEW;
  WSASetService : lpfn_WSASETSERVICE;
  WSAProviderConfigChange : lpfn_WSAPROVIDERCONFIGCHANGE;

  {$NODEFINE TransmitFile}
        TransmitFile :  TTransmitFileProc;
  {$NODEFINE AcceptEx}
  AcceptEx : TAcceptExProc;
  {$NODEFINE GetAcceptExSockaddrs}
  GetAcceptExSockaddrs : TGetAcceptExSockaddrsProc;
  {$NODEFINE WSARecvEx}
  WSARecvEx  : TWSARecvExProc;

{$ENDIF} // $IFDEF WS2_DLL_FUNC_VARS


{ Macros }
function WSAMakeSyncReply(Buflen, Error: Word): Longint;
function WSAMakeSelectReply(Event, Error: Word): Longint;
function WSAGetAsyncBuflen(Param: Longint): Word;
function WSAGetAsyncError(Param: Longint): Word;
function WSAGetSelectEvent(Param: Longint): Word;
function WSAGetSelectError(Param: Longint): Word;

procedure fd_clr(Socket: TSocket; var FDSet: TFDSet);
function fd_isset(Socket: TSocket; var FDSet: TFDSet): Boolean;
procedure fd_set(Socket: TSocket; var FDSet: TFDSet);
procedure fd_zero(var FDSet: TFDSet);

//=============================================================

{
	WS2TCPIP.H - WinSock2 Extension for TCP/IP protocols

	This file contains TCP/IP specific information for use
	by WinSock2 compatible applications.

	Copyright (c) 1995-1999  Microsoft Corporation

	To provide the backward compatibility, all the TCP/IP
	specific definitions that were included in the WINSOCK.H
	file are now included in WINSOCK2.H file. WS2TCPIP.H
	file includes only the definitions  introduced in the
	"WinSock 2 Protocol-Specific Annex" document.

	Rev 0.3	Nov 13, 1995
	Rev 0.4	Dec 15, 1996
}

// Argument structure for IP_ADD_MEMBERSHIP and IP_DROP_MEMBERSHIP
type
	ip_mreq = packed record
		imr_multiaddr : TInAddr; // IP multicast address of group
		imr_interface : TInAddr; // local IP address of interface
  end;

// TCP/IP specific Ioctl codes
const

	SIO_GET_INTERFACE_LIST    = IOC_OUT or (SizeOf(Longint) shl 16) or (Ord('t') shl 8) or 127;    {Do not Localize}
// New IOCTL with address size independent address array
	SIO_GET_INTERFACE_LIST_EX = IOC_OUT or (SizeOf(Longint) shl 16) or (Ord('t') shl 8) or 126;    {Do not Localize}

// Options for use with [gs]etsockopt at the IP level.
  ip_options         =  1; // set/get IP options
  ip_hdrincl         =  2; // header is included with data
  ip_tos             =  3; // IP type of service and preced
  ip_ttl             =  4; // IP time to live
  ip_multicast_if    =  9; // set/get IP multicast i/f
  ip_multicast_ttl   = 10; // set/get IP multicast ttl
  ip_multicast_loop  = 11; // set/get IP multicast loopback
  ip_add_membership  = 12; // add an IP group membership
  ip_drop_membership = 13; // drop an IP group membership
  ip_dontfragment    = 14; // don't fragment IP datagrams    {Do not Localize}

  ip_default_multicast_ttl   = 1;    // normally limit m'casts to 1 hop    {Do not Localize}
  ip_default_multicast_loop  = 1;    // normally hear sends if a member
  ip_max_memberships         = 20;   // per socket; must fit in one mbuf

// Option to use with [gs]etsockopt at the IPPROTO_UDP level
	UDP_NOCHECKSUM     = 1;

// Option to use with [gs]etsockopt at the IPPROTO_TCP level
  TCP_EXPEDITED_1122 = $0002;


// IPv6 definitions
type
	IN_ADDR6 = packed record
		s6_addr : array[0..15] of u_char; // IPv6 address
	end;
  TIn6Addr   = IN_ADDR6;
  PIn6Addr   = ^IN_ADDR6;
  IN6_ADDR   = IN_ADDR6;
  PIN6_ADDR  = ^IN_ADDR6;
  LPIN6_ADDR = ^IN_ADDR6;

// Old IPv6 socket address structure (retained for sockaddr_gen definition below)
	SOCKADDR_IN6_OLD = packed record
		sin6_family   : Smallint;         // AF_INET6
		sin6_port     : u_short;          // Transport level port number
		sin6_flowinfo : u_long;           // IPv6 flow information
		sin6_addr     : IN_ADDR6;         // IPv6 address
	end;

// IPv6 socket address structure, RFC 2553
	SOCKADDR_IN6 = packed record
		sin6_family   : Smallint;         // AF_INET6
		sin6_port     : u_short;          // Transport level port number
		sin6_flowinfo : u_long;           // IPv6 flow information
		sin6_addr     : IN_ADDR6;         // IPv6 address
		sin6_scope_id : u_long;           // set of interfaces for a scope
	end;
  TSockAddrIn6   = SOCKADDR_IN6;
  PSockAddrIn6   = ^SOCKADDR_IN6;
  PSOCKADDR_IN6  = ^SOCKADDR_IN6;
  LPSOCKADDR_IN6 = ^SOCKADDR_IN6;

	sockaddr_gen = packed record
		case Integer of
		1 : ( Address : SOCKADDR; );
		2 : ( AddressIn : SOCKADDR_IN; );
		3 : ( AddressIn6 : SOCKADDR_IN6_OLD; );
	end;

// Structure to keep interface specific information
	INTERFACE_INFO = packed record
		iiFlags            : u_long;       // Interface flags
		iiAddress          : sockaddr_gen; // Interface address
		iiBroadcastAddress : sockaddr_gen; // Broadcast address
		iiNetmask          : sockaddr_gen; // Network mask
	end;
	TINTERFACE_INFO  = INTERFACE_INFO;
	LPINTERFACE_INFO = ^INTERFACE_INFO;

// New structure that does not have dependency on the address size
	INTERFACE_INFO_EX = packed record
		iiFlags            : u_long;         // Interface flags
		iiAddress          : SOCKET_ADDRESS; // Interface address
		iiBroadcastAddress : SOCKET_ADDRESS; // Broadcast address
		iiNetmask : SOCKET_ADDRESS;          // Network mask
	end;
	TINTERFACE_INFO_EX  = INTERFACE_INFO_EX;
	LPINTERFACE_INFO_EX = ^INTERFACE_INFO_EX;

// Possible flags for the  iiFlags - bitmask

const
	IFF_UP           = $00000001;  // Interface is up
	IFF_BROADCAST    = $00000002;  // Broadcast is  supported
	IFF_LOOPBACK     = $00000004;  // this is loopback interface
	IFF_POINTTOPOINT = $00000008;  // this is point-to-point interface
	IFF_MULTICAST    = $00000010;  // multicast is supported


//=============================================================

{
	wsipx.h

	Microsoft Windows
	Copyright (C) Microsoft Corporation, 1992-1999.

	Windows Sockets include file for IPX/SPX.  This file contains all
	standardized IPX/SPX information.  Include this header file after
	winsock.h.

	To open an IPX socket, call socket() with an address family of
	AF_IPX, a socket type of SOCK_DGRAM, and protocol NSPROTO_IPX.
	Note that the protocol value must be specified, it cannot be 0.
	All IPX packets are sent with the packet type field of the IPX
	header set to 0.

	To open an SPX or SPXII socket, call socket() with an address
	family of AF_IPX, socket type of SOCK_SEQPACKET or SOCK_STREAM,
	and protocol of NSPROTO_SPX or NSPROTO_SPXII.  If SOCK_SEQPACKET
	is specified, then the end of message bit is respected, and
	recv() calls are not completed until a packet is received with
	the end of message bit set.  If SOCK_STREAM is specified, then
	the end of message bit is not respected, and recv() completes
	as soon as any data is received, regardless of the setting of the
	end of message bit.  Send coalescing is never performed, and sends
	smaller than a single packet are always sent with the end of
	message bit set.  Sends larger than a single packet are packetized
	with the end of message bit set on only the last packet of the
	send.
}


// This is the structure of the SOCKADDR structure for IPX and SPX.

type

	SOCKADDR_IPX = packed record
		sa_family : u_short;
		sa_netnum : Array [0..3] of Char;
		sa_nodenum : Array [0..5] of Char;
		sa_socket : u_short;
	end;
	TSOCKADDR_IPX = SOCKADDR_IPX;
  TSockAddrIPX = SOCKADDR_IPX;
	PSOCKADDR_IPX = ^SOCKADDR_IPX;
  PSockAddrIPX = ^SOCKADDR_IPX;
	LPSOCKADDR_IPX = ^SOCKADDR_IPX;

//  Protocol families used in the "protocol" parameter of the socket() API.

const
	NSPROTO_IPX   = 1000;
	NSPROTO_SPX   = 1256;
	NSPROTO_SPXII = 1257;


//=============================================================

{
	wsnwlink.h

	Microsoft Windows
	Copyright (C) Microsoft Corporation, 1992-1999.
		Microsoft-specific extensions to the Windows NT IPX/SPX Windows
		Sockets interface.  These extensions are provided for use as
		necessary for compatibility with existing applications.  They are
		otherwise not recommended for use, as they are only guaranteed to
		work     over the Microsoft IPX/SPX stack.  An application which
		uses these     extensions may not work over other IPX/SPX
		implementations.  Include this header file after winsock.h and
		wsipx.h.

		To open an IPX socket where a particular packet type is sent in
		the IPX header, specify NSPROTO_IPX + n as the protocol parameter
		of the socket() API.  For example, to open an IPX socket that
		sets the packet type to 34, use the following socket() call:

    		s = socket(AF_IPX, SOCK_DGRAM, NSPROTO_IPX + 34);
}

// Below are socket option that may be set or retrieved by specifying
// the appropriate manifest in the "optname" parameter of getsockopt()
// or setsockopt().  Use NSPROTO_IPX as the "level" argument for the
// call.
const

//	Set/get the IPX packet type.  The value specified in the
//	optval argument will be set as the packet type on every IPX
//	packet sent from this socket.  The optval parameter of
//	getsockopt()/setsockopt() points to an int.
	IPX_PTYPE = $4000;

//	Set/get the receive filter packet type.  Only IPX packets with
//	a packet type equal to the value specified in the optval
//	argument will be returned; packets with a packet type that
//	does not match are discarded.  optval points to an int.
	IPX_FILTERPTYPE = $4001;

//	Stop filtering on packet type set with IPX_FILTERPTYPE.
	IPX_STOPFILTERPTYPE = $4003;

//	Set/get the value of the datastream field in the SPX header on
//	every packet sent.  optval points to an int.
	IPX_DSTYPE = $4002;

//	Enable extended addressing.  On sends, adds the element
//	"unsigned char sa_ptype" to the SOCKADDR_IPX structure,
//	making the total length 15 bytes.  On receives, add both
//	the sa_ptype and "unsigned char sa_flags" to the SOCKADDR_IPX
//	structure, making the total length 16 bytes.  The current
//	bits defined in sa_flags are:
//		0x01 - the received frame was sent as a broadcast
//		0x02 - the received frame was sent from this machine
//	optval points to a BOOL.
	IPX_EXTENDED_ADDRESS = $4004;

//	Send protocol header up on all receive packets.  optval points
//	to a BOOL.
	IPX_RECVHDR = $4005;

//	Get the maximum data size that can be sent.  Not valid with
//	setsockopt().  optval points to an int where the value is
//	returned.
	IPX_MAXSIZE = $4006;

//	Query information about a specific adapter that IPX is bound
//	to.  In a system with n adapters they are numbered 0 through n-1.
//	Callers can issue the IPX_MAX_ADAPTER_NUM getsockopt() to find
//	out the number of adapters present, or call IPX_ADDRESS with
//	increasing values of adapternum until it fails.  Not valid
//	with setsockopt().  optval points to an instance of the
//	IPX_ADDRESS_DATA structure with the adapternum filled in.
	IPX_ADDRESS = $4007;
type
	IPX_ADDRESS_DATA = packed record
		adapternum : Integer;                 // input: 0-based adapter number
		netnum     : Array [0..3] of Byte;    // output: IPX network number
		nodenum    : Array [0..5] of Byte;    // output: IPX node address
		wan        : Boolean;                 // output: TRUE = adapter is on a wan link
		status     : Boolean;                 // output: TRUE = wan link is up (or adapter is not wan)
		maxpkt     : Integer;                 // output: max packet size, not including IPX header
		linkspeed  : ULONG;                   // output: link speed in 100 bytes/sec (i.e. 96 == 9600 bps)
	end;
	PIPX_ADDRESS_DATA = ^IPX_ADDRESS_DATA;

const
//	Query information about a specific IPX network number.  If the
//	network is in IPX's cache it will return the information directly,    {Do not Localize}
//	otherwise it will issue RIP requests to find it.  Not valid with
//	setsockopt().  optval points to an instance of the IPX_NETNUM_DATA
//	structure with the netnum filled in.
	IPX_GETNETINFO = $4008;
type
	IPX_NETNUM_DATA = packed record
		netnum   : Array [0..3] of Byte;  // input: IPX network number
		hopcount : Word;                  // output: hop count to this network, in machine order
		netdelay : Word;                  // output: tick count to this network, in machine order
		cardnum  : Integer;               // output: 0-based adapter number used to route to this net;
		                                  // can be used as adapternum input to IPX_ADDRESS
		router   : Array [0..5] of Byte;  // output: MAC address of the next hop router, zeroed if
																			// the network is directly attached
	end;
	PIPX_NETNUM_DATA = ^IPX_NETNUM_DATA;

const
//	Like IPX_GETNETINFO except it  does not  issue RIP requests. If the
//	network is in IPX's cache it will return the information, otherwise    {Do not Localize}
//	it will fail (see also IPX_RERIPNETNUMBER which  always  forces a
//	re-RIP). Not valid with setsockopt().  optval points to an instance of
//	the IPX_NETNUM_DATA structure with the netnum filled in.
	IPX_GETNETINFO_NORIP = $4009;

//	Get information on a connected SPX socket.  optval points
//	to an instance of the IPX_SPXCONNSTATUS_DATA structure.
//  *** All numbers are in Novell (high-low) order. ***
	IPX_SPXGETCONNECTIONSTATUS = $400B;
type
	IPX_SPXCONNSTATUS_DATA = packed record
		ConnectionState         : Byte;
		WatchDogActive          : Byte;
		LocalConnectionId       : Word;
		RemoteConnectionId      : Word;
		LocalSequenceNumber     : Word;
		LocalAckNumber          : Word;
		LocalAllocNumber        : Word;
		RemoteAckNumber         : Word;
		RemoteAllocNumber       : Word;
		LocalSocket             : Word;
		ImmediateAddress        : Array [0..5] of Byte;
		RemoteNetwork           : Array [0..3] of Byte;
		RemoteNode              : Array [0..5] of Byte;
		RemoteSocket            : Word;
		RetransmissionCount     : Word;
		EstimatedRoundTripDelay : Word;                 // In milliseconds
		RetransmittedPackets    : Word;
		SuppressedPacket        : Word;
	end;
	PIPX_SPXCONNSTATUS_DATA = ^IPX_SPXCONNSTATUS_DATA;

const
//	Get notification when the status of an adapter that IPX is
//	bound to changes.  Typically this will happen when a wan line
//	goes up or down.  Not valid with setsockopt().  optval points
//	to a buffer which contains an IPX_ADDRESS_DATA structure
//	followed immediately by a HANDLE to an unsignaled event.
//
//	When the getsockopt() query is submitted, it will complete
//	successfully.  However, the IPX_ADDRESS_DATA pointed to by
//	optval will not be updated at that point.  Instead the
//	request is queued internally inside the transport.
//
//	When the status of an adapter changes, IPX will locate a
//	queued getsockopt() query and fill in all the fields in the
//	IPX_ADDRESS_DATA structure.  It will then signal the event
//	pointed to by the HANDLE in the optval buffer.  This handle
//	should be obtained before calling getsockopt() by calling
//	CreateEvent().  If multiple getsockopts() are submitted at
//	once, different events must be used.
//
//	The event is used because the call needs to be asynchronous
//	but currently getsockopt() does not support this.
//
//	WARNING: In the current implementation, the transport will
//	only signal one queued query for each status change.  Therefore
//	only one service which uses this query should be running at
//	once.
	IPX_ADDRESS_NOTIFY = $400C;

//	Get the maximum number of adapters present.  If this call returns
//	n then the adapters are numbered 0 through n-1.  Not valid
//	with setsockopt().  optval points to an int where the value
//	is returned.
	IPX_MAX_ADAPTER_NUM = $400D;

//	Like IPX_GETNETINFO except it forces IPX to re-RIP even if the
//	network is in its cache (but not if it is directly attached to).
//	Not valid with setsockopt().  optval points to an instance of
//	the IPX_NETNUM_DATA structure with the netnum filled in.
	IPX_RERIPNETNUMBER = $400E;

//	A hint that broadcast packets may be received.  The default is
//	TRUE.  Applications that do not need to receive broadcast packets
//	should set this sockopt to FALSE which may cause better system
//	performance (note that it does not necessarily cause broadcasts
//	to be filtered for the application).  Not valid with getsockopt().
//	optval points to a BOOL.
	IPX_RECEIVE_BROADCAST = $400F;


//	On SPX connections, don't delay before sending ack.  Applications    {Do not Localize}
//	that do not tend to have back-and-forth traffic over SPX should
//	set this; it will increase the number of acks sent but will remove
//	delays in sending acks.  optval points to a BOOL.
	IPX_IMMEDIATESPXACK = $4010;


//=============================================================

//	wsnetbs.h
//	Copyright (c) 1994-1999, Microsoft Corp. All rights reserved.
//
//	Windows Sockets include file for NETBIOS.  This file contains all
//	standardized NETBIOS information.  Include this header file after
//	winsock.h.

//	To open a NetBIOS socket, call the socket() function as follows:
//
//		s = socket( AF_NETBIOS, {SOCK_SEQPACKET|SOCK_DGRAM}, -Lana );
//
//	where Lana is the NetBIOS Lana number of interest.  For example, to
//	open a socket for Lana 2, specify -2 as the "protocol" parameter
//	to the socket() function.


//	This is the structure of the SOCKADDR structure for NETBIOS.

const
 NETBIOS_NAME_LENGTH = 16;

type
	SOCKADDR_NB = packed record
		snb_family : Smallint;
		snb_type   : u_short;
		snb_name   : array[0..NETBIOS_NAME_LENGTH-1] of Char;
	end;
  TSockAddrNB  = SOCKADDR_NB;
  PSockAddrNB  = ^SOCKADDR_NB;
  LPSOCKADDR_NB = ^SOCKADDR_NB;

//	Bit values for the snb_type field of SOCKADDR_NB.
const
	NETBIOS_UNIQUE_NAME       = $0000;
	NETBIOS_GROUP_NAME        = $0001;
	NETBIOS_TYPE_QUICK_UNIQUE = $0002;
	NETBIOS_TYPE_QUICK_GROUP  = $0003;

//	A macro convenient for setting up NETBIOS SOCKADDRs.
procedure SET_NETBIOS_SOCKADDR( snb : PSockAddrNB; const SnbType : Word; const Name : PChar; const Port : Char );



//=============================================================

//  Copyright 1997 - 1998 Microsoft Corporation
//
//  Module Name:
//
//  	ws2atm.h
//
//  Abstract:
//
//  	Winsock 2 ATM Annex definitions.
																						
																						
const
	ATMPROTO_AALUSER = $00; // User-defined AAL
	ATMPROTO_AAL1    = $01; // AAL 1
	ATMPROTO_AAL2    = $02; // AAL 2
	ATMPROTO_AAL34   = $03; // AAL 3/4
	ATMPROTO_AAL5    = $05; // AAL 5
		
	SAP_FIELD_ABSENT        = $FFFFFFFE;
	SAP_FIELD_ANY           = $FFFFFFFF;
	SAP_FIELD_ANY_AESA_SEL  = $FFFFFFFA;
	SAP_FIELD_ANY_AESA_REST = $FFFFFFFB;
	
// values used for AddressType in struct ATM_ADDRESS
	ATM_E164 = $01; // E.164 addressing scheme
	ATM_NSAP = $02; // NSAP-style ATM Endsystem Address scheme
	ATM_AESA = $02; // NSAP-style ATM Endsystem Address scheme
	
	ATM_ADDR_SIZE = 20;
type
	ATM_ADDRESS = packed record
		AddressType : DWORD;                        // E.164 or NSAP-style ATM Endsystem Address
		NumofDigits : DWORD;                        // number of digits;
		Addr : Array[0..(ATM_ADDR_SIZE)-1] of Byte; // IA5 digits for E164, BCD encoding for NSAP
																								// format as defined in the ATM Forum UNI 3.1
	end;
	
//-------------------------------------------------------------
// values used for Layer2Protocol in B-LLI
const
	BLLI_L2_ISO_1745       = $01; // Basic mode ISO 1745
	BLLI_L2_Q921           = $02; // CCITT Rec. Q.921
	BLLI_L2_X25L           = $06; // CCITT Rec. X.25, link layer
	BLLI_L2_X25M           = $07; // CCITT Rec. X.25, multilink
	BLLI_L2_ELAPB          = $08; // Extended LAPB; for half duplex operation
	BLLI_L2_HDLC_NRM       = $09; // HDLC NRM (ISO 4335)
	BLLI_L2_HDLC_ABM       = $0A; // HDLC ABM (ISO 4335)
	BLLI_L2_HDLC_ARM       = $0B; // HDLC ARM (ISO 4335)
	BLLI_L2_LLC            = $0C; // LAN logical link control (ISO 8802/2)
	BLLI_L2_X75            = $0D; // CCITT Rec. X.75, single link procedure
	BLLI_L2_Q922           = $0E; // CCITT Rec. Q.922
	BLLI_L2_USER_SPECIFIED = $10; // User Specified
	BLLI_L2_ISO_7776       = $11; // ISO 7776 DTE-DTE operation

//-------------------------------------------------------------
// values used for Layer3Protocol in B-LLI
	BLLI_L3_X25            = $06; // CCITT Rec. X.25, packet layer
	BLLI_L3_ISO_8208       = $07; // ISO/IEC 8208 (X.25 packet layer for DTE
	BLLI_L3_X223           = $08; // X.223/ISO 8878
	BLLI_L3_SIO_8473       = $09; // ISO/IEC 8473 (OSI connectionless)
	BLLI_L3_T70            = $0A; // CCITT Rec. T.70 min. network layer
	BLLI_L3_ISO_TR9577     = $0B; // ISO/IEC TR 9577 Network Layer Protocol ID
	BLLI_L3_USER_SPECIFIED = $10; // User Specified
	
//-------------------------------------------------------------
// values used for Layer3IPI in B-LLI
	BLLI_L3_IPI_SNAP = $80; // IEEE 802.1 SNAP identifier
	BLLI_L3_IPI_IP   = $CC; // Internet Protocol (IP) identifier

type
	ATM_BLLI = packed record
		// Identifies the layer-two protocol.
		// Corresponds to the User information layer 2 protocol field in the B-LLI information element.
		// A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.		
		Layer2Protocol              : DWORD; // User information layer 2 protocol
		// Identifies the user-specified layer-two protocol.
		// Only used if the Layer2Protocol parameter is set to BLLI_L2_USER_SPECIFIED.
		// The valid values range from zero–127.
		// Corresponds to the User specified layer 2 protocol information field in the B-LLI information element. 		
		Layer2UserSpecifiedProtocol : DWORD; // User specified layer 2 protocol information
		// Identifies the layer-three protocol.
		// Corresponds to the User information layer 3 protocol field in the B-LLI information element.
		// A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.
		Layer3Protocol              : DWORD; // User information layer 3 protocol
		// Identifies the user-specified layer-three protocol.
		// Only used if the Layer3Protocol parameter is set to BLLI_L3_USER_SPECIFIED.
		// The valid values range from zero–127.
		// Corresponds to the User specified layer 3 protocol information field in the B-LLI information element.
		Layer3UserSpecifiedProtocol : DWORD; // User specified layer 3 protocol information
		// Identifies the layer-three Initial Protocol Identifier.
		// Only used if the Layer3Protocol parameter is set to BLLI_L3_ISO_TR9577.
		// Corresponds to the ISO/IEC TR 9577 Initial Protocol Identifier field in the B-LLI information element. 		
		Layer3IPI                   : DWORD; // ISO/IEC TR 9577 Initial Protocol Identifier
		// Identifies the 802.1 SNAP identifier.
		// Only used if the Layer3Protocol parameter is set to BLLI_L3_ISO_TR9577 and Layer3IPI is set to BLLI_L3_IPI_SNAP,
		// indicating an IEEE 802.1 SNAP identifier. Corresponds to the OUI and PID fields in the B-LLI information element. 		
		SnapID                      : Array[0..4] of Byte; // SNAP ID consisting of OUI and PID
	end;
	
//-------------------------------------------------------------
// values used for the HighLayerInfoType field in ATM_BHLI
const
	BHLI_ISO                 = $00; // ISO
	BHLI_UserSpecific        = $01; // User Specific
	BHLI_HighLayerProfile    = $02; // High layer profile (only in UNI3.0)
	BHLI_VendorSpecificAppId = $03; // Vendor-Specific Application ID

type
	ATM_BHLI = packed record
		// Identifies the high layer information type field in the B-LLI information element.
		// Note that the type BHLI_HighLayerProfile has been eliminated in UNI 3.1.
		// A value of SAP_FIELD_ABSENT indicates that B-HLI is not present, and a value of SAP_FIELD_ANY means wildcard.
		HighLayerInfoType   : DWORD; // High Layer Information Type
		// Identifies the number of bytes from one to eight in the HighLayerInfo array.
		// Valid values include eight for the cases of BHLI_ISO and BHLI_UserSpecific,
		// four for BHLI_HighLayerProfile, and seven for BHLI_VendorSpecificAppId. 		
		HighLayerInfoLength : DWORD; // number of bytes in HighLayerInfo
		// Identifies the high layer information field in the B-LLI information element.
		// In the case of HighLayerInfoType being BHLI_VendorSpecificAppId,
		// the first 3 bytes consist of a globally-administered Organizationally Unique Identifier (OUI)
		// (as per IEEE standard 802-1990), followed by a 4-byte application identifier,
		// which is administered by the vendor identified by the OUI.
		// Value for the case of BHLI_UserSpecific is user defined and requires bilateral agreement between two end users. 		
		HighLayerInfo       : Array[0..7] of Byte; // the value dependent on the HighLayerInfoType field
	end;

//-------------------------------------------------------------
// A new address family, AF_ATM, is introduced for native ATM services,
// and the corresponding SOCKADDR structure, sockaddr_atm, is defined in the following.
// To open a socket for native ATM services, parameters in socket should contain
// AF_ATM, SOCK_RAW, and ATMPROTO_AAL5 or ATMPROTO_AALUSER, respectively.	
	sockaddr_atm = packed record
		// Identifies the address family, which is AF_ATM in this case.
		satm_family : u_short;
		// Identifies the ATM address that could be either in E.164 or NSAP-style ATM End Systems Address format.
		// This field will be mapped to the Called Party Number IE (Information Element)
		// if it is specified in bind and WSPBind for a listening socket, or in connect, WSAConnect, WSPConnect,
		// WSAJoinLeaf, or WSPJoinLeaf for a connecting socket.
		// It will be mapped to the Calling Party Number IE if specified in bind and WSPBind for a connecting socket.
		satm_number : ATM_ADDRESS;
		// Identifies the fields in the B-LLI Information Element that are used along with satm_bhli to identify an application.
		// Note that the B-LLI layer two information is treated as not present
		// if its Layer2Protocol field contains SAP_FIELD_ABSENT, or as a wildcard if it contains SAP_FIELD_ANY.
		// Similarly, the B-LLI layer three information is treated as not present
		// if its Layer3Protocol field contains SAP_FIELD_ABSENT, or as a wildcard if it contains SAP_FIELD_ANY.
		satm_blli   : ATM_BLLI;    // B-LLI
		// Identifies the fields in the B-HLI Information Element that are used along with satm_blli to identify an application.
		satm_bhli   : ATM_BHLI;    // B-HLI
	end;
	TSockAddrATM = sockaddr_atm;
	PSockAddrATM = ^TSockAddrATM;
	LPSockAddrATM = ^TSockAddrATM;
	PSOCKADDR_ATM = ^sockaddr_atm;
	LPSOCKADDR_ATM = ^sockaddr_atm;

//-------------------------------------------------------------
	Q2931_IE_TYPE = ( IE_AALParameters, IE_TrafficDescriptor,
		IE_BroadbandBearerCapability, IE_BHLI, IE_BLLI,IE_CalledPartyNumber,
		IE_CalledPartySubaddress, IE_CallingPartyNumber, IE_CallingPartySubaddress,
		IE_Cause, IE_QOSClass, IE_TransitNetworkSelection
	);

	Q2931_IE = record
		IEType   : Q2931_IE_TYPE;
		IELength : ULONG;
		IE       : Array[0..0] of Byte;
	end;
			
//-------------------------------------------------------------
// manifest constants for the AALType field in struct AAL_PARAMETERS_IE
	AAL_TYPE = LongInt;
const	
	AALTYPE_5    =  5; // AAL 5
	AALTYPE_USER = 16; // user-defined AAL
	
//-------------------------------------------------------------
// values used for the Mode field in struct AAL5_PARAMETERS
	AAL5_MODE_MESSAGE   = $01;
	AAL5_MODE_STREAMING = $02;

//-------------------------------------------------------------
// values used for the SSCSType field in struct AAL5_PARAMETERS
	AAL5_SSCS_NULL              = $00;
	AAL5_SSCS_SSCOP_ASSURED     = $01;
	AAL5_SSCS_SSCOP_NON_ASSURED = $02;
	AAL5_SSCS_FRAME_RELAY       = $04;

type
	AAL5_PARAMETERS = packed record
		ForwardMaxCPCSSDUSize  : ULONG;
		BackwardMaxCPCSSDUSize : ULONG;
		Mode     : Byte; // only available in UNI 3.0
		SSCSType : Byte;
	end;

	AALUSER_PARAMETERS = packed record
		UserDefined : ULONG;
	end;

	AAL_PARAMETERS_IE = packed record
		AALType : AAL_TYPE;
		AALSpecificParameters : packed record
		case Byte of
			 0 : ( AAL5Parameters    : AAL5_PARAMETERS );
			 1 : ( AALUserParameters : AALUSER_PARAMETERS );
		end;
	end;

	ATM_TD = packed record
		PeakCellRate_CLP0         : ULONG;
		PeakCellRate_CLP01        : ULONG;
		SustainableCellRate_CLP0  : ULONG;
		SustainableCellRate_CLP01 : ULONG;
		MaxBurstSize_CLP0         : ULONG;
		MaxBurstSize_CLP01        : ULONG;
		Tagging                   : LongBool;
	end;

	ATM_TRAFFIC_DESCRIPTOR_IE = packed record
		Forward    : ATM_TD;
		Backward   : ATM_TD;
		BestEffort : LongBool;
	end;
	
//-------------------------------------------------------------
// values used for the BearerClass field in struct ATM_BROADBAND_BEARER_CAPABILITY_IE
const
	BCOB_A = $01; // Bearer class A
	BCOB_C = $03; // Bearer class C
	BCOB_X = $10; // Bearer class X
	
//-------------------------------------------------------------
// values used for the TrafficType field in struct ATM_BROADBAND_BEARER_CAPABILITY_IE

	TT_NOIND = $00; // No indication of traffic type
	TT_CBR   = $04; // Constant bit rate
	TT_VBR   = $06; // Variable bit rate

//-------------------------------------------------------------
// values used for the TimingRequirements field in struct ATM_BROADBAND_BEARER_CAPABILITY_IE
	TR_NOIND         = $00; // No timing requirement indication
	TR_END_TO_END    = $01; // End-to-end timing required
	TR_NO_END_TO_END = $02; // End-to-end timing not required
	
//-------------------------------------------------------------
// values used for the ClippingSusceptability field in struct ATM_BROADBAND_BEARER_CAPABILITY_IE
	CLIP_NOT = $00; // Not susceptible to clipping
	CLIP_SUS = $20; // Susceptible to clipping

//-------------------------------------------------------------
// values used for the UserPlaneConnectionConfig field in struct ATM_BROADBAND_BEARER_CAPABILITY_IE
	UP_P2P  = $00; // Point-to-point connection
	UP_P2MP = $01; // Point-to-multipoint connection

type
	ATM_BROADBAND_BEARER_CAPABILITY_IE = packed record
		BearerClass : Byte;
		TrafficType : Byte;
		TimingRequirements        : Byte;
		ClippingSusceptability    : Byte;
		UserPlaneConnectionConfig : Byte;
	end;
	ATM_BHLI_IE = ATM_BHLI;

//-------------------------------------------------------------
// values used for the Layer2Mode field in struct ATM_BLLI_IE
const
	BLLI_L2_MODE_NORMAL = $40;
	BLLI_L2_MODE_EXT    = $80;

//-------------------------------------------------------------
// values used for the Layer3Mode field in struct ATM_BLLI_IE
	BLLI_L3_MODE_NORMAL = $40;
	BLLI_L3_MODE_EXT    = $80;

//-------------------------------------------------------------
// values used for the Layer3DefaultPacketSize field in struct ATM_BLLI_IE
	BLLI_L3_PACKET_16   = $04;
	BLLI_L3_PACKET_32   = $05;
	BLLI_L3_PACKET_64   = $06;
	BLLI_L3_PACKET_128  = $07;
	BLLI_L3_PACKET_256  = $08;
	BLLI_L3_PACKET_512  = $09;
	BLLI_L3_PACKET_1024 = $0A;
	BLLI_L3_PACKET_2048 = $0B;
	BLLI_L3_PACKET_4096 = $0C;
	
  // User information layer 2 protocol
  // User specified layer 2 protocol information
  // User information layer 3 protocol
  // User specified layer 3 protocol information
  // ISO/IEC TR 9577 Initial Protocol Identifier
  // SNAP ID consisting of OUI and PID

type
	
	ATM_BLLI_IE = record
		Layer2Protocol              : DWORD;
		Layer2Mode                  : Byte;
		Layer2WindowSize            : Byte;
		Layer2UserSpecifiedProtocol : DWORD;
		Layer3Protocol              : DWORD;
		Layer3Mode                  : Byte;
		Layer3DefaultPacketSize     : Byte;
		Layer3PacketWindowSize      : Byte;
		Layer3UserSpecifiedProtocol : DWORD;
		Layer3IPI                   : DWORD;
		SnapID       : Array[0..4] of Byte;
	end;
	ATM_CALLED_PARTY_NUMBER_IE = ATM_ADDRESS;
	ATM_CALLED_PARTY_SUBADDRESS_IE = ATM_ADDRESS;

//-------------------------------------------------------------
// values used for the Presentation_Indication field in struct ATM_CALLING_PARTY_NUMBER_IE
const
	PI_ALLOWED              = $00;
	PI_RESTRICTED           = $40;
	PI_NUMBER_NOT_AVAILABLE = $80;

//-------------------------------------------------------------
// values used for the Screening_Indicator field in struct ATM_CALLING_PARTY_NUMBER_IE
	SI_USER_NOT_SCREENED = $00;
	SI_USER_PASSED       = $01;
	SI_USER_FAILED       = $02;
	SI_NETWORK           = $03;

type
	ATM_CALLING_PARTY_NUMBER_IE = record
		ATM_Number              : ATM_ADDRESS;
		Presentation_Indication : Byte;
		Screening_Indicator     : Byte;
	end;
	ATM_CALLING_PARTY_SUBADDRESS_IE = ATM_ADDRESS;

//-------------------------------------------------------------
// values used for the Location field in struct ATM_CAUSE_IE
const
	CAUSE_LOC_USER                  = $00;
	CAUSE_LOC_PRIVATE_LOCAL         = $01;
	CAUSE_LOC_PUBLIC_LOCAL          = $02;
	CAUSE_LOC_TRANSIT_NETWORK       = $03;
	CAUSE_LOC_PUBLIC_REMOTE         = $04;
	CAUSE_LOC_PRIVATE_REMOTE        = $05;
	CAUSE_LOC_INTERNATIONAL_NETWORK = $06;
	CAUSE_LOC_BEYOND_INTERWORKING   = $0A;

//-------------------------------------------------------------
// values used for the Cause field in struct ATM_CAUSE_IE
	CAUSE_UNALLOCATED_NUMBER                = $01;
	CAUSE_NO_ROUTE_TO_TRANSIT_NETWORK       = $02;
	CAUSE_NO_ROUTE_TO_DESTINATION           = $03;
	CAUSE_VPI_VCI_UNACCEPTABLE              = $0A;
	CAUSE_NORMAL_CALL_CLEARING              = $10;
	CAUSE_USER_BUSY                         = $11;
	CAUSE_NO_USER_RESPONDING                = $12;
	CAUSE_CALL_REJECTED                     = $15;
	CAUSE_NUMBER_CHANGED                    = $16;
	CAUSE_USER_REJECTS_CLIR                 = $17;
	CAUSE_DESTINATION_OUT_OF_ORDER          = $1B;
	CAUSE_INVALID_NUMBER_FORMAT             = $1C;
	CAUSE_STATUS_ENQUIRY_RESPONSE           = $1E;
	CAUSE_NORMAL_UNSPECIFIED                = $1F;
	CAUSE_VPI_VCI_UNAVAILABLE               = $23;
	CAUSE_NETWORK_OUT_OF_ORDER              = $26;
	CAUSE_TEMPORARY_FAILURE                 = $29;
	CAUSE_ACCESS_INFORMAION_DISCARDED       = $2B;
	CAUSE_NO_VPI_VCI_AVAILABLE              = $2D;
	CAUSE_RESOURCE_UNAVAILABLE              = $2F;
	CAUSE_QOS_UNAVAILABLE                   = $31;
	CAUSE_USER_CELL_RATE_UNAVAILABLE        = $33;
	CAUSE_BEARER_CAPABILITY_UNAUTHORIZED    = $39;
	CAUSE_BEARER_CAPABILITY_UNAVAILABLE     = $3A;
	CAUSE_OPTION_UNAVAILABLE                = $3F;
	CAUSE_BEARER_CAPABILITY_UNIMPLEMENTED   = $41;
	CAUSE_UNSUPPORTED_TRAFFIC_PARAMETERS    = $49;
	CAUSE_INVALID_CALL_REFERENCE            = $51;
	CAUSE_CHANNEL_NONEXISTENT               = $52;
	CAUSE_INCOMPATIBLE_DESTINATION          = $58;
	CAUSE_INVALID_ENDPOINT_REFERENCE        = $59;
	CAUSE_INVALID_TRANSIT_NETWORK_SELECTION = $5B;
	CAUSE_TOO_MANY_PENDING_ADD_PARTY        = $5C;
	CAUSE_AAL_PARAMETERS_UNSUPPORTED        = $5D;
	CAUSE_MANDATORY_IE_MISSING              = $60;
	CAUSE_UNIMPLEMENTED_MESSAGE_TYPE        = $61;
	CAUSE_UNIMPLEMENTED_IE                  = $63;
	CAUSE_INVALID_IE_CONTENTS               = $64;
	CAUSE_INVALID_STATE_FOR_MESSAGE         = $65;
	CAUSE_RECOVERY_ON_TIMEOUT               = $66;
	CAUSE_INCORRECT_MESSAGE_LENGTH          = $68;
	CAUSE_PROTOCOL_ERROR                    = $6F;
	
//-------------------------------------------------------------
// values used for the Condition portion of the Diagnostics field
// in struct ATM_CAUSE_IE, for certain Cause values
	CAUSE_COND_UNKNOWN   = $00;
	CAUSE_COND_PERMANENT = $01;
	CAUSE_COND_TRANSIENT = $02;
	
//-------------------------------------------------------------
// values used for the Rejection Reason portion of the Diagnostics field
// in struct ATM_CAUSE_IE, for certain Cause values

	CAUSE_REASON_USER            = $00;
	CAUSE_REASON_IE_MISSING      = $04;
	CAUSE_REASON_IE_INSUFFICIENT = $08;
	
//-------------------------------------------------------------
// values used for the P-U flag of the Diagnostics field
// in struct ATM_CAUSE_IE, for certain Cause values
	CAUSE_PU_PROVIDER = $00;
	CAUSE_PU_USER     = $08;

//-------------------------------------------------------------
// values used for the N-A flag of the Diagnostics field
// in struct ATM_CAUSE_IE, for certain Cause values
	CAUSE_NA_NORMAL = $00;
	CAUSE_NA_ABNORMAL = $04;

type
	ATM_CAUSE_IE = record
		Location          : Byte;
		Cause             : Byte;
		DiagnosticsLength : Byte;
		Diagnostics       : Array[0..3] of Byte;
	end;
	
//-------------------------------------------------------------
// values used for the QOSClassForward and QOSClassBackward
// field in struct ATM_QOS_CLASS_IE
const
	QOS_CLASS0 = $00;
	QOS_CLASS1 = $01;
	QOS_CLASS2 = $02;
	QOS_CLASS3 = $03;
	QOS_CLASS4 = $04;

type
	ATM_QOS_CLASS_IE = packed record
		QOSClassForward  : Byte;
		QOSClassBackward : Byte;
	end;
	
//-------------------------------------------------------------
// values used for the TypeOfNetworkId field in struct ATM_TRANSIT_NETWORK_SELECTION_IE
const
	TNS_TYPE_NATIONAL = $40;

//-------------------------------------------------------------
// values used for the NetworkIdPlan field in struct ATM_TRANSIT_NETWORK_SELECTION_IE
	TNS_PLAN_CARRIER_ID_CODE = $01;

type
	ATM_TRANSIT_NETWORK_SELECTION_IE = record
		TypeOfNetworkId : Byte;
		NetworkIdPlan   : Byte;
		NetworkIdLength : Byte;
		NetworkId : Array[0..0] of Byte;
	end;
	
//-------------------------------------------------------------
// ATM specific Ioctl codes
const
	SIO_GET_NUMBER_OF_ATM_DEVICES = $50160001;
	SIO_GET_ATM_ADDRESS           = $d0160002;
	SIO_ASSOCIATE_PVC             = $90160003;
	SIO_GET_ATM_CONNECTION_ID     = $50160004; // ATM Connection Identifier

type
	ATM_CONNECTION_ID = packed record
		DeviceNumber : DWORD;
		VPI          : DWORD;
		VCI          : DWORD;
	end;

// Input buffer format for SIO_ASSOCIATE_PVC
	ATM_PVC_PARAMS = packed record
		PvcConnectionId : ATM_CONNECTION_ID;
		PvcQos          : QOS;
	end;

function Winsock2Loaded : Boolean;

//=============================================================
implementation
//=============================================================
uses IdResourceStrings;
// (c) March 2001,  "Alex Konshin"<alexk@mtgroup.ru>

type
  PPointer = ^Pointer;

var
  hWS2Dll : THandle = 0; // WS2.DLL handle
  WS2_WSAStartup : lpfn_WSASTARTUP;

function Winsock2Loaded : Boolean;
begin
  Result := hWS2Dll <> 0;
end;

constructor EIdWS2StubError.Build( const ATitle : String; AWin32Error : DWORD );
begin
  FTitle := ATitle;
  FWin32Error := AWin32Error;
  if AWin32Error=0 then
  begin
    inherited Create( ATitle )
  end
  else
  begin
    FWin32ErrorMessage := SysUtils.SysErrorMessage(AWin32Error);
    inherited Create( ATitle+': '+FWin32ErrorMessage );    {Do not Localize}
  end;
end;

procedure WS2StubInit; forward;

procedure WS2Unload;
var h : THandle;
begin
  h := InterlockedExchange(Integer(hWS2Dll),0);
  if h<>0 then
  begin
    Windows.FreeLibrary(h);
    WS2StubInit;
  end;
end;

type
  WS2StubEntry = record
    StubProc : Pointer;
    ProcVar : PPointer;
    Name : PChar;
  end;

function WS2Call( AStubEntryIndex : DWORD ) : Pointer; forward;

procedure WS2Stub_WSACleanup;                       asm  mov eax,  0; call WS2Call; jmp eax; end;
procedure WS2Stub_accept;                           asm  mov eax,  1; call WS2Call; jmp eax; end;
procedure WS2Stub_bind;                             asm  mov eax,  2; call WS2Call; jmp eax; end;
procedure WS2Stub_closesocket;                      asm  mov eax,  3; call WS2Call; jmp eax; end;
procedure WS2Stub_connect;                          asm  mov eax,  4; call WS2Call; jmp eax; end;
procedure WS2Stub_ioctlsocket;                      asm  mov eax,  5; call WS2Call; jmp eax; end;
procedure WS2Stub_getpeername;                      asm  mov eax,  6; call WS2Call; jmp eax; end;
procedure WS2Stub_getsockname;                      asm  mov eax,  7; call WS2Call; jmp eax; end;
procedure WS2Stub_getsockopt;                       asm  mov eax,  8; call WS2Call; jmp eax; end;
procedure WS2Stub_htonl;                            asm  mov eax,  9; call WS2Call; jmp eax; end;
procedure WS2Stub_htons;                            asm  mov eax, 10; call WS2Call; jmp eax; end;
procedure WS2Stub_inet_addr;                        asm  mov eax, 11; call WS2Call; jmp eax; end;
procedure WS2Stub_inet_ntoa;                        asm  mov eax, 12; call WS2Call; jmp eax; end;
procedure WS2Stub_listen;                           asm  mov eax, 13; call WS2Call; jmp eax; end;
procedure WS2Stub_ntohl;                            asm  mov eax, 14; call WS2Call; jmp eax; end;
procedure WS2Stub_ntohs;                            asm  mov eax, 15; call WS2Call; jmp eax; end;
procedure WS2Stub_recv;                             asm  mov eax, 16; call WS2Call; jmp eax; end;
procedure WS2Stub_recvfrom;                         asm  mov eax, 17; call WS2Call; jmp eax; end;
procedure WS2Stub_select;                           asm  mov eax, 18; call WS2Call; jmp eax; end;
procedure WS2Stub_send;                             asm  mov eax, 19; call WS2Call; jmp eax; end;
procedure WS2Stub_sendto;                           asm  mov eax, 20; call WS2Call; jmp eax; end;
procedure WS2Stub_setsockopt;                       asm  mov eax, 21; call WS2Call; jmp eax; end;
procedure WS2Stub_shutdown;                         asm  mov eax, 22; call WS2Call; jmp eax; end;
procedure WS2Stub_socket;                           asm  mov eax, 23; call WS2Call; jmp eax; end;
procedure WS2Stub_gethostbyaddr;                    asm  mov eax, 24; call WS2Call; jmp eax; end;
procedure WS2Stub_gethostbyname;                    asm  mov eax, 25; call WS2Call; jmp eax; end;
procedure WS2Stub_gethostname;                      asm  mov eax, 26; call WS2Call; jmp eax; end;
procedure WS2Stub_getservbyport;                    asm  mov eax, 27; call WS2Call; jmp eax; end;
procedure WS2Stub_getservbyname;                    asm  mov eax, 28; call WS2Call; jmp eax; end;
procedure WS2Stub_getprotobynumber;                 asm  mov eax, 29; call WS2Call; jmp eax; end;
procedure WS2Stub_getprotobyname;                   asm  mov eax, 30; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetLastError;                  asm  mov eax, 31; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetLastError;                  asm  mov eax, 32; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAIsBlocking;                    asm  mov eax, 33; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAUnhookBlockingHook;            asm  mov eax, 34; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetBlockingHook;               asm  mov eax, 35; call WS2Call; jmp eax; end;
procedure WS2Stub_WSACancelBlockingCall;            asm  mov eax, 36; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetServByName;            asm  mov eax, 37; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetServByPort;            asm  mov eax, 38; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetProtoByName;           asm  mov eax, 39; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetProtoByNumber;         asm  mov eax, 40; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetHostByName;            asm  mov eax, 41; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncGetHostByAddr;            asm  mov eax, 42; call WS2Call; jmp eax; end;
procedure WS2Stub_WSACancelAsyncRequest;            asm  mov eax, 43; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAsyncSelect;                   asm  mov eax, 44; call WS2Call; jmp eax; end;
procedure WS2Stub___WSAFDIsSet;                     asm  mov eax, 45; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAccept;                        asm  mov eax, 46; call WS2Call; jmp eax; end;
procedure WS2Stub_WSACloseEvent;                    asm  mov eax, 47; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAConnect;                       asm  mov eax, 48; call WS2Call; jmp eax; end;
procedure WS2Stub_WSACreateEvent ;                  asm  mov eax, 49; call WS2Call; jmp eax; end;
procedure WS2Stub_WSADuplicateSocketA;              asm  mov eax, 50; call WS2Call; jmp eax; end;
procedure WS2Stub_WSADuplicateSocketW;              asm  mov eax, 51; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumNetworkEvents;             asm  mov eax, 52; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumProtocolsA;                asm  mov eax, 53; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumProtocolsW;                asm  mov eax, 54; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEventSelect;                   asm  mov eax, 55; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetOverlappedResult;           asm  mov eax, 56; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetQosByName;                  asm  mov eax, 57; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAHtonl;                         asm  mov eax, 58; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAHtons;                         asm  mov eax, 59; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAIoctl;                         asm  mov eax, 60; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAJoinLeaf;                      asm  mov eax, 61; call WS2Call; jmp eax; end;
procedure WS2Stub_WSANtohl;                         asm  mov eax, 62; call WS2Call; jmp eax; end;
procedure WS2Stub_WSANtohs;                         asm  mov eax, 63; call WS2Call; jmp eax; end;
procedure WS2Stub_WSARecv;                          asm  mov eax, 64; call WS2Call; jmp eax; end;
procedure WS2Stub_WSARecvDisconnect;                asm  mov eax, 65; call WS2Call; jmp eax; end;
procedure WS2Stub_WSARecvFrom;                      asm  mov eax, 66; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAResetEvent;                    asm  mov eax, 67; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASend;                          asm  mov eax, 68; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASendDisconnect;                asm  mov eax, 69; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASendTo;                        asm  mov eax, 70; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetEvent;                      asm  mov eax, 71; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASocketA;                       asm  mov eax, 72; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASocketW;                       asm  mov eax, 73; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAWaitForMultipleEvents;         asm  mov eax, 74; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAddressToStringA;              asm  mov eax, 75; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAddressToStringW;              asm  mov eax, 76; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAStringToAddressA;              asm  mov eax, 77; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAStringToAddressW;              asm  mov eax, 78; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceBeginA;           asm  mov eax, 79; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceBeginW;           asm  mov eax, 80; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceNextA;            asm  mov eax, 81; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceNextW;            asm  mov eax, 82; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceEnd;              asm  mov eax, 83; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAInstallServiceClassA;          asm  mov eax, 84; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAInstallServiceClassW;          asm  mov eax, 85; call WS2Call; jmp eax; end;
procedure WS2Stub_WSARemoveServiceClass;            asm  mov eax, 86; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassInfoA;          asm  mov eax, 87; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassInfoW;          asm  mov eax, 88; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumNameSpaceProvidersA;       asm  mov eax, 89; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumNameSpaceProvidersW;       asm  mov eax, 90; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassNameByClassIdA; asm  mov eax, 91; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassNameByClassIdW; asm  mov eax, 92; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetServiceA;                   asm  mov eax, 93; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetServiceW;                   asm  mov eax, 94; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAProviderConfigChange;          asm  mov eax, 95; call WS2Call; jmp eax; end;
procedure WS2Stub_WSADuplicateSocket;               asm  mov eax, 96; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumProtocols;                 asm  mov eax, 97; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASocket;                        asm  mov eax, 98; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAAddressToString;               asm  mov eax, 99; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAStringToAddress;               asm  mov eax,100; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceBegin;            asm  mov eax,101; call WS2Call; jmp eax; end;
procedure WS2Stub_WSALookupServiceNext;             asm  mov eax,102; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAInstallServiceClass;           asm  mov eax,103; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassInfo;           asm  mov eax,104; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAEnumNameSpaceProviders;        asm  mov eax,105; call WS2Call; jmp eax; end;
procedure WS2Stub_WSAGetServiceClassNameByClassId;  asm  mov eax,106; call WS2Call; jmp eax; end;
procedure WS2Stub_WSASetService;                    asm  mov eax,107; call WS2Call; jmp eax; end;
procedure WS2Stub_TransmitFile;                     asm  mov eax,108; call WS2Call; jmp eax; end;

procedure WS2Stub_AcceptEx;                         asm  mov eax,109; call WS2Call; jmp eax; end;
procedure WS2Stub_GetAcceptExSockaddrs;             asm  mov eax,110; call WS2Call; jmp eax; end;
procedure WS2Stub_WSARecvEx;                        asm  mov eax,111; call WS2Call; jmp eax; end;

const
  WS2StubEntryCount = 112;
  WS2StubTable : Array [0..WS2StubEntryCount-1] of WS2StubEntry = (
  	(StubProc: @WS2Stub_WSACleanup; ProcVar: @@WSACleanup; Name: 'WSACleanup'),
  	(StubProc: @WS2Stub_accept; ProcVar: @@accept; Name: 'accept'),
  	(StubProc: @WS2Stub_bind; ProcVar: @@bind; Name: 'bind'),
  	(StubProc: @WS2Stub_closesocket; ProcVar: @@closesocket; Name: 'closesocket'),
  	(StubProc: @WS2Stub_connect; ProcVar: @@connect; Name: 'connect'),
  	(StubProc: @WS2Stub_ioctlsocket; ProcVar: @@ioctlsocket; Name: 'ioctlsocket'),
  	(StubProc: @WS2Stub_getpeername; ProcVar: @@getpeername; Name: 'getpeername'),
  	(StubProc: @WS2Stub_getsockname; ProcVar: @@getsockname; Name: 'getsockname'),
  	(StubProc: @WS2Stub_getsockopt; ProcVar: @@getsockopt; Name: 'getsockopt'),
  	(StubProc: @WS2Stub_htonl; ProcVar: @@htonl; Name: 'htonl'),
  	(StubProc: @WS2Stub_htons; ProcVar: @@htons; Name: 'htons'),
  	(StubProc: @WS2Stub_inet_addr; ProcVar: @@inet_addr; Name: 'inet_addr'),
  	(StubProc: @WS2Stub_inet_ntoa; ProcVar: @@inet_ntoa; Name: 'inet_ntoa'),
  	(StubProc: @WS2Stub_listen; ProcVar: @@listen; Name: 'listen'),
  	(StubProc: @WS2Stub_ntohl; ProcVar: @@ntohl; Name: 'ntohl'),
  	(StubProc: @WS2Stub_ntohs; ProcVar: @@ntohs; Name: 'ntohs'),
  	(StubProc: @WS2Stub_recv; ProcVar: @@recv; Name: 'recv'),
  	(StubProc: @WS2Stub_recvfrom; ProcVar: @@recvfrom; Name: 'recvfrom'),
  	(StubProc: @WS2Stub_select; ProcVar: @@select; Name: 'select'),
  	(StubProc: @WS2Stub_send; ProcVar: @@send; Name: 'send'),
  	(StubProc: @WS2Stub_sendto; ProcVar: @@sendto; Name: 'sendto'),
  	(StubProc: @WS2Stub_setsockopt; ProcVar: @@setsockopt; Name: 'setsockopt'),
  	(StubProc: @WS2Stub_shutdown; ProcVar: @@shutdown; Name: 'shutdown'),
  	(StubProc: @WS2Stub_socket; ProcVar: @@socket; Name: 'socket'),
  	(StubProc: @WS2Stub_gethostbyaddr; ProcVar: @@gethostbyaddr; Name: 'gethostbyaddr'),
  	(StubProc: @WS2Stub_gethostbyname; ProcVar: @@gethostbyname; Name: 'gethostbyname'),
  	(StubProc: @WS2Stub_gethostname; ProcVar: @@gethostname; Name: 'gethostname'),
  	(StubProc: @WS2Stub_getservbyport; ProcVar: @@getservbyport; Name: 'getservbyport'),
  	(StubProc: @WS2Stub_getservbyname; ProcVar: @@getservbyname; Name: 'getservbyname'),
  	(StubProc: @WS2Stub_getprotobynumber; ProcVar: @@getprotobynumber; Name: 'getprotobynumber'),
  	(StubProc: @WS2Stub_getprotobyname; ProcVar: @@getprotobyname; Name: 'getprotobyname'),
  	(StubProc: @WS2Stub_WSASetLastError; ProcVar: @@WSASetLastError; Name: 'WSASetLastError'),
  	(StubProc: @WS2Stub_WSAGetLastError; ProcVar: @@WSAGetLastError; Name: 'WSAGetLastError'),
  	(StubProc: @WS2Stub_WSAIsBlocking; ProcVar: @@WSAIsBlocking; Name: 'WSAIsBlocking'),
  	(StubProc: @WS2Stub_WSAUnhookBlockingHook; ProcVar: @@WSAUnhookBlockingHook; Name: 'WSAUnhookBlockingHook'),
  	(StubProc: @WS2Stub_WSASetBlockingHook; ProcVar: @@WSASetBlockingHook; Name: 'WSASetBlockingHook'),
  	(StubProc: @WS2Stub_WSACancelBlockingCall; ProcVar: @@WSACancelBlockingCall; Name: 'WSACancelBlockingCall'),
  	(StubProc: @WS2Stub_WSAAsyncGetServByName; ProcVar: @@WSAAsyncGetServByName; Name: 'WSAAsyncGetServByName'),
  	(StubProc: @WS2Stub_WSAAsyncGetServByPort; ProcVar: @@WSAAsyncGetServByPort; Name: 'WSAAsyncGetServByPort'),
  	(StubProc: @WS2Stub_WSAAsyncGetProtoByName; ProcVar: @@WSAAsyncGetProtoByName; Name: 'WSAAsyncGetProtoByName'),
  	(StubProc: @WS2Stub_WSAAsyncGetProtoByNumber; ProcVar: @@WSAAsyncGetProtoByNumber; Name: 'WSAAsyncGetProtoByNumber'),
  	(StubProc: @WS2Stub_WSAAsyncGetHostByName; ProcVar: @@WSAAsyncGetHostByName; Name: 'WSAAsyncGetHostByName'),
  	(StubProc: @WS2Stub_WSAAsyncGetHostByAddr; ProcVar: @@WSAAsyncGetHostByAddr; Name: 'WSAAsyncGetHostByAddr'),
  	(StubProc: @WS2Stub_WSACancelAsyncRequest; ProcVar: @@WSACancelAsyncRequest; Name: 'WSACancelAsyncRequest'),
  	(StubProc: @WS2Stub_WSAAsyncSelect; ProcVar: @@WSAAsyncSelect; Name: 'WSAAsyncSelect'),
  	(StubProc: @WS2Stub___WSAFDIsSet; ProcVar: @@__WSAFDIsSet; Name: '__WSAFDIsSet'),
  	(StubProc: @WS2Stub_WSAAccept; ProcVar: @@WSAAccept; Name: 'WSAAccept'),
  	(StubProc: @WS2Stub_WSACloseEvent; ProcVar: @@WSACloseEvent; Name: 'WSACloseEvent'),
  	(StubProc: @WS2Stub_WSAConnect; ProcVar: @@WSAConnect; Name: 'WSAConnect'),
  	(StubProc: @WS2Stub_WSACreateEvent ; ProcVar: @@WSACreateEvent ; Name: 'WSACreateEvent '),
  	(StubProc: @WS2Stub_WSADuplicateSocketA; ProcVar: @@WSADuplicateSocketA; Name: 'WSADuplicateSocketA'),
  	(StubProc: @WS2Stub_WSADuplicateSocketW; ProcVar: @@WSADuplicateSocketW; Name: 'WSADuplicateSocketW'),
  	(StubProc: @WS2Stub_WSAEnumNetworkEvents; ProcVar: @@WSAEnumNetworkEvents; Name: 'WSAEnumNetworkEvents'),
  	(StubProc: @WS2Stub_WSAEnumProtocolsA; ProcVar: @@WSAEnumProtocolsA; Name: 'WSAEnumProtocolsA'),
  	(StubProc: @WS2Stub_WSAEnumProtocolsW; ProcVar: @@WSAEnumProtocolsW; Name: 'WSAEnumProtocolsW'),
  	(StubProc: @WS2Stub_WSAEventSelect; ProcVar: @@WSAEventSelect; Name: 'WSAEventSelect'),
  	(StubProc: @WS2Stub_WSAGetOverlappedResult; ProcVar: @@WSAGetOverlappedResult; Name: 'WSAGetOverlappedResult'),
  	(StubProc: @WS2Stub_WSAGetQosByName; ProcVar: @@WSAGetQosByName; Name: 'WSAGetQosByName'),
  	(StubProc: @WS2Stub_WSAHtonl; ProcVar: @@WSAHtonl; Name: 'WSAHtonl'),
  	(StubProc: @WS2Stub_WSAHtons; ProcVar: @@WSAHtons; Name: 'WSAHtons'),
  	(StubProc: @WS2Stub_WSAIoctl; ProcVar: @@WSAIoctl; Name: 'WSAIoctl'),
  	(StubProc: @WS2Stub_WSAJoinLeaf; ProcVar: @@WSAJoinLeaf; Name: 'WSAJoinLeaf'),
  	(StubProc: @WS2Stub_WSANtohl; ProcVar: @@WSANtohl; Name: 'WSANtohl'),
  	(StubProc: @WS2Stub_WSANtohs; ProcVar: @@WSANtohs; Name: 'WSANtohs'),
  	(StubProc: @WS2Stub_WSARecv; ProcVar: @@WSARecv; Name: 'WSARecv'),
  	(StubProc: @WS2Stub_WSARecvDisconnect; ProcVar: @@WSARecvDisconnect; Name: 'WSARecvDisconnect'),
  	(StubProc: @WS2Stub_WSARecvFrom; ProcVar: @@WSARecvFrom; Name: 'WSARecvFrom'),
  	(StubProc: @WS2Stub_WSAResetEvent; ProcVar: @@WSAResetEvent; Name: 'WSAResetEvent'),
  	(StubProc: @WS2Stub_WSASend; ProcVar: @@WSASend; Name: 'WSASend'),
  	(StubProc: @WS2Stub_WSASendDisconnect; ProcVar: @@WSASendDisconnect; Name: 'WSASendDisconnect'),
  	(StubProc: @WS2Stub_WSASendTo; ProcVar: @@WSASendTo; Name: 'WSASendTo'),
  	(StubProc: @WS2Stub_WSASetEvent; ProcVar: @@WSASetEvent; Name: 'WSASetEvent'),
  	(StubProc: @WS2Stub_WSASocketA; ProcVar: @@WSASocketA; Name: 'WSASocketA'),
  	(StubProc: @WS2Stub_WSASocketW; ProcVar: @@WSASocketW; Name: 'WSASocketW'),
  	(StubProc: @WS2Stub_WSAWaitForMultipleEvents; ProcVar: @@WSAWaitForMultipleEvents; Name: 'WSAWaitForMultipleEvents'),
  	(StubProc: @WS2Stub_WSAAddressToStringA; ProcVar: @@WSAAddressToStringA; Name: 'WSAAddressToStringA'),
  	(StubProc: @WS2Stub_WSAAddressToStringW; ProcVar: @@WSAAddressToStringW; Name: 'WSAAddressToStringW'),
  	(StubProc: @WS2Stub_WSAStringToAddressA; ProcVar: @@WSAStringToAddressA; Name: 'WSAStringToAddressA'),
  	(StubProc: @WS2Stub_WSAStringToAddressW; ProcVar: @@WSAStringToAddressW; Name: 'WSAStringToAddressW'),
  	(StubProc: @WS2Stub_WSALookupServiceBeginA; ProcVar: @@WSALookupServiceBeginA; Name: 'WSALookupServiceBeginA'),
  	(StubProc: @WS2Stub_WSALookupServiceBeginW; ProcVar: @@WSALookupServiceBeginW; Name: 'WSALookupServiceBeginW'),
  	(StubProc: @WS2Stub_WSALookupServiceNextA; ProcVar: @@WSALookupServiceNextA; Name: 'WSALookupServiceNextA'),
  	(StubProc: @WS2Stub_WSALookupServiceNextW; ProcVar: @@WSALookupServiceNextW; Name: 'WSALookupServiceNextW'),
  	(StubProc: @WS2Stub_WSALookupServiceEnd; ProcVar: @@WSALookupServiceEnd; Name: 'WSALookupServiceEnd'),
  	(StubProc: @WS2Stub_WSAInstallServiceClassA; ProcVar: @@WSAInstallServiceClassA; Name: 'WSAInstallServiceClassA'),
  	(StubProc: @WS2Stub_WSAInstallServiceClassW; ProcVar: @@WSAInstallServiceClassW; Name: 'WSAInstallServiceClassW'),
  	(StubProc: @WS2Stub_WSARemoveServiceClass; ProcVar: @@WSARemoveServiceClass; Name: 'WSARemoveServiceClass'),
  	(StubProc: @WS2Stub_WSAGetServiceClassInfoA; ProcVar: @@WSAGetServiceClassInfoA; Name: 'WSAGetServiceClassInfoA'),
  	(StubProc: @WS2Stub_WSAGetServiceClassInfoW; ProcVar: @@WSAGetServiceClassInfoW; Name: 'WSAGetServiceClassInfoW'),
  	(StubProc: @WS2Stub_WSAEnumNameSpaceProvidersA; ProcVar: @@WSAEnumNameSpaceProvidersA; Name: 'WSAEnumNameSpaceProvidersA'),
  	(StubProc: @WS2Stub_WSAEnumNameSpaceProvidersW; ProcVar: @@WSAEnumNameSpaceProvidersW; Name: 'WSAEnumNameSpaceProvidersW'),
  	(StubProc: @WS2Stub_WSAGetServiceClassNameByClassIdA; ProcVar: @@WSAGetServiceClassNameByClassIdA; Name: 'WSAGetServiceClassNameByClassIdA'),
  	(StubProc: @WS2Stub_WSAGetServiceClassNameByClassIdW; ProcVar: @@WSAGetServiceClassNameByClassIdW; Name: 'WSAGetServiceClassNameByClassIdW'),
  	(StubProc: @WS2Stub_WSASetServiceA; ProcVar: @@WSASetServiceA; Name: 'WSASetServiceA'),
  	(StubProc: @WS2Stub_WSASetServiceW; ProcVar: @@WSASetServiceW; Name: 'WSASetServiceW'),
  	(StubProc: @WS2Stub_WSAProviderConfigChange; ProcVar: @@WSAProviderConfigChange; Name: 'WSAProviderConfigChange'),
{$IFDEF UNICODE}
  	(StubProc: @WS2Stub_WSADuplicateSocket; ProcVar: @@WSADuplicateSocket; Name: 'WSADuplicateSocketW'),
  	(StubProc: @WS2Stub_WSAEnumProtocols; ProcVar: @@WSAEnumProtocols; Name: 'WSAEnumProtocolsW'),
  	(StubProc: @WS2Stub_WSASocket; ProcVar: @@WSASocket; Name: 'WSASocketW'),
  	(StubProc: @WS2Stub_WSAAddressToString; ProcVar: @@WSAAddressToString; Name: 'WSAAddressToStringW'),
  	(StubProc: @WS2Stub_WSAStringToAddress; ProcVar: @@WSAStringToAddress; Name: 'WSAStringToAddressW'),
  	(StubProc: @WS2Stub_WSALookupServiceBegin; ProcVar: @@WSALookupServiceBegin; Name: 'WSALookupServiceBeginW'),
  	(StubProc: @WS2Stub_WSALookupServiceNext; ProcVar: @@WSALookupServiceNext; Name: 'WSALookupServiceNextW'),
  	(StubProc: @WS2Stub_WSAInstallServiceClass; ProcVar: @@WSAInstallServiceClass; Name: 'WSAInstallServiceClassW'),
  	(StubProc: @WS2Stub_WSAGetServiceClassInfo; ProcVar: @@WSAGetServiceClassInfo; Name: 'WSAGetServiceClassInfoW'),
  	(StubProc: @WS2Stub_WSAEnumNameSpaceProviders; ProcVar: @@WSAEnumNameSpaceProviders; Name: 'WSAEnumNameSpaceProvidersW'),
  	(StubProc: @WS2Stub_WSAGetServiceClassNameByClassId; ProcVar: @@WSAGetServiceClassNameByClassId; Name: 'WSAGetServiceClassNameByClassIdW'),
  	(StubProc: @WS2Stub_WSASetService; ProcVar: @@WSASetService; Name: 'WSASetServiceW'),
{$ELSE}
  	(StubProc: @WS2Stub_WSADuplicateSocket; ProcVar: @@WSADuplicateSocket; Name: 'WSADuplicateSocketA'),
  	(StubProc: @WS2Stub_WSAEnumProtocols; ProcVar: @@WSAEnumProtocols; Name: 'WSAEnumProtocolsA'),
  	(StubProc: @WS2Stub_WSASocket; ProcVar: @@WSASocket; Name: 'WSASocketA'),
  	(StubProc: @WS2Stub_WSAAddressToString; ProcVar: @@WSAAddressToString; Name: 'WSAAddressToStringA'),
  	(StubProc: @WS2Stub_WSAStringToAddress; ProcVar: @@WSAStringToAddress; Name: 'WSAStringToAddressA'),
  	(StubProc: @WS2Stub_WSALookupServiceBegin; ProcVar: @@WSALookupServiceBegin; Name: 'WSALookupServiceBeginA'),
  	(StubProc: @WS2Stub_WSALookupServiceNext; ProcVar: @@WSALookupServiceNext; Name: 'WSALookupServiceNextA'),
  	(StubProc: @WS2Stub_WSAInstallServiceClass; ProcVar: @@WSAInstallServiceClass; Name: 'WSAInstallServiceClassA'),
  	(StubProc: @WS2Stub_WSAGetServiceClassInfo; ProcVar: @@WSAGetServiceClassInfo; Name: 'WSAGetServiceClassInfoA'),
  	(StubProc: @WS2Stub_WSAEnumNameSpaceProviders; ProcVar: @@WSAEnumNameSpaceProviders; Name: 'WSAEnumNameSpaceProvidersA'),
  	(StubProc: @WS2Stub_WSAGetServiceClassNameByClassId; ProcVar: @@WSAGetServiceClassNameByClassId; Name: 'WSAGetServiceClassNameByClassIdA'),
  	(StubProc: @WS2Stub_WSASetService; ProcVar: @@WSASetService; Name: 'WSASetServiceA'),
{$ENDIF}
        (StubProc: @WS2Stub_TransmitFile; ProcVar: @@TransmitFile; Name: 'TransmitFile'),
        (StubProc: @WS2Stub_AcceptEx; ProcVar: @@AcceptEx; Name: 'AcceptEx'),
        (StubProc: @WS2Stub_GetAcceptExSockaddrs; ProcVar: @@GetAcceptExSockaddrs; Name: 'GetAcceptExSockaddrs'),
        (StubProc: @WS2Stub_WSARecvEx; ProcVar: @@WSARecvEx; Name: 'WSARecvEx')


       	);


function WS2Call( AStubEntryIndex : DWORD ) : Pointer;
begin
  with WS2StubTable[AStubEntryIndex] do
  begin
    if hWS2Dll=0 then
    begin
      raise EIdWS2StubError.Build( Format(RSWS2CallError,[Name]), WSANOTINITIALISED );
    end;
    Result := Windows.GetProcAddress( hWS2Dll, Name );
    ProcVar^ := Result;
  end;
end;

procedure WS2StubInit;
var i : Integer;
begin
  hWS2Dll := 0;
  for i := 0 to WS2StubEntryCount-1 do
    with WS2StubTable[i] do
      ProcVar^ := StubProc;
end;


function WSAStartup( const wVersionRequired: word; var WSData: TWSAData ): Integer;
begin
  if hWS2Dll=0 then
  begin
    hWS2Dll := LoadLibrary( WINSOCK2_DLL );
    if hWS2Dll=0 then
    begin
      raise EIdWS2StubError.Build( Format(RSWS2LoadError,[WINSOCK2_DLL]), Windows.GetLastError );
    end;
    WS2_WSAStartup := lpfn_WSASTARTUP( Windows.GetProcAddress( hWS2Dll, 'WSAStartup' ) );    {Do not Localize}
    Result := WS2_WSAStartup( wVersionRequired, WSData );
  end
  else
  begin
    //actually, this not really be called if the lib is already loaded.
    Result:= 0; ///<<<<<<<<< if loaded then all ok
  end;
end;

function WSAMakeSyncReply;
begin
  WSAMakeSyncReply:= MakeLong(Buflen, Error);
end;

function WSAMakeSelectReply;
begin
  WSAMakeSelectReply:= MakeLong(Event, Error);
end;

function WSAGetAsyncBuflen;
begin
  WSAGetAsyncBuflen:= LOWORD(Param);
end;

function WSAGetAsyncError;
begin
  WSAGetAsyncError:= HIWORD(Param);
end;

function WSAGetSelectEvent;
begin
  WSAGetSelectEvent:= LOWORD(Param);
end;

function WSAGetSelectError;
begin
  WSAGetSelectError:= HIWORD(Param);
end;

procedure fd_clr(Socket: TSocket; var FDSet: TFDSet);
//var i: DWord;
var i : Integer;
begin
  i := 0;
  while i < FDSet.fd_count do
  begin
    if FDSet.fd_array[i] = Socket then
    begin
      while i < FDSet.fd_count - 1 do
      begin
        FDSet.fd_array[i] := FDSet.fd_array[i+1];
        Inc(i);
      end;
      Dec(FDSet.fd_count);
      Break;
    end;
    Inc(i);
  end;
end;

function fd_isset(Socket: TSocket; var FDSet: TFDSet): Boolean;
begin
  Result := __WSAFDIsSet(Socket, FDSet);
end;

procedure fd_set(Socket: TSocket; var FDSet: TFDSet);
begin
  if FDSet.fd_count < fd_setsize then
  begin
    FDSet.fd_array[FDSet.fd_count] := Socket;
    Inc(FDSet.fd_count);
  end;
end;

procedure fd_zero(var FDSet: TFDSet);
begin
  FDSet.fd_count := 0;
end;

//  A macro convenient for setting up NETBIOS SOCKADDRs.
procedure SET_NETBIOS_SOCKADDR( snb : PSockAddrNB; const SnbType : Word; const Name : PChar; const Port : Char );
var len : Integer;
begin
  if snb<>nil then with snb^ do
  begin
    snb_family := AF_NETBIOS;
    snb_type := SnbType;
    len := StrLen(Name);
    if len>=NETBIOS_NAME_LENGTH-1 then
    begin
      System.Move(Name^,snb_name,NETBIOS_NAME_LENGTH-1)
    end
    else
    begin
      if len>0 then
      begin
        System.Move(Name^,snb_name,len);
      end;
      System.FillChar( (PChar(@snb_name)+len)^, NETBIOS_NAME_LENGTH-1-len, ' ' );    {Do not Localize}
    end;
    snb_name[NETBIOS_NAME_LENGTH-1] := Port;
  end;
end;

initialization
  WS2StubInit;
finalization
  WS2Unload;
end.
