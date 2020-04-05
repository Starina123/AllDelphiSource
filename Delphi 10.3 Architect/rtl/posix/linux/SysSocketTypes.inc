{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


type 
  socklen_t = UInt32;
  {$EXTERNALSYM socklen_t}
  Psocklen_t = ^socklen_t;

  sa_family_t = Word;
  {$EXTERNALSYM sa_family_t}
  Psa_family_t = ^sa_family_t;

  msghdr = record
    msg_name: MarshaledAString;                    // Address to send to/receive from.
    msg_namelen: socklen_t;             // Length of address data.

    msg_iov: Piovec;                 // Vector of data to send/receive into.
    msg_iovlen: size_t;                 // Number of elements in the vector.

    msg_control: Pointer;               // Ancillary data (eg BSD filedesc passing).
    msg_controllen: size_t;             // Ancillary data buffer length.

    msg_flags: Integer;	                // Flags on received message.
  end;
  {$EXTERNALSYM msghdr}
  Pmsghdr = ^msghdr;

  cmsghdr = record
    cmsg_len: size_t;
    cmsg_level: Integer;
    cmsg_type: Integer;
  end;
  {$EXTERNALSYM cmsghdr}
  Pcmsghdr = ^cmsghdr;

  linger = record
    l_onoff: Integer;
    l_linger: Integer;
  end;
  {$EXTERNALSYM linger}
  PLinger = ^linger;

  //TODO -otgerdes -cHeader translation: these are probably defined wrong
const
  SOCK_STREAM     = 1;
  {$EXTERNALSYM SOCK_STREAM}
  SOCK_DGRAM      = 2;
  {$EXTERNALSYM SOCK_DGRAM}
  SOCK_RAW        = 3;
  {$EXTERNALSYM SOCK_RAW}
  SOCK_RDM        = 4;
  {$EXTERNALSYM SOCK_RDM}
  SOCK_SEQPACKET  = 5;
  {$EXTERNALSYM SOCK_SEQPACKET}
  SOCK_DCCP       = 6 platform;
  {$EXTERNALSYM SOCK_DCCP}
  SOCK_PACKET     = 10 platform;
  {$EXTERNALSYM SOCK_PACKET}
  SOCK_CLOEXEC = $80000 platform;
  {$EXTERNALSYM SOCK_CLOEXEC}
  SOCK_NONBLOCK = $800 platform;
  {$EXTERNALSYM SOCK_NONBLOCK}

  SOL_SOCKET      = $1;
  {$EXTERNALSYM SOL_SOCKET}
  { Socket level values . Others are defined in the appropriate headers

    XXX These definitions also should go into the appropriate headers as
    far as they are available.  }

  SOL_RAW       = 255 platform;
  {$EXTERNALSYM SOL_RAW}
  SOL_DECNET    = 261 platform;
  {$EXTERNALSYM SOL_DECNET}
  SOL_X25       = 262 platform;
  {$EXTERNALSYM SOL_X25}
  SOL_PACKET    = 263 platform;
  {$EXTERNALSYM SOL_PACKET}
  SOL_ATM       = 264 platform; // ATM layer (cell level).
  {$EXTERNALSYM SOL_ATM}
  SOL_AAL       = 265 platform; // ATM Adaption Layer (packet level).
  {$EXTERNALSYM SOL_AAL}
  SOL_IRDA      = 266 platform;
  {$EXTERNALSYM SOL_IRDA}


  SO_DEBUG      = 1;
  {$EXTERNALSYM SO_DEBUG}
  SO_REUSEADDR  = 2;
  {$EXTERNALSYM SO_REUSEADDR}
  SO_TYPE       = 3;
  {$EXTERNALSYM SO_TYPE}
  SO_ERROR      = 4;
  {$EXTERNALSYM SO_ERROR}
  SO_DONTROUTE  = 5;
  {$EXTERNALSYM SO_DONTROUTE}
  SO_BROADCAST  = 6;
  {$EXTERNALSYM SO_BROADCAST}
  SO_SNDBUF     = 7;
  {$EXTERNALSYM SO_SNDBUF}
  SO_RCVBUF     = 8;
  {$EXTERNALSYM SO_RCVBUF}
  SO_KEEPALIVE  = 9;
  {$EXTERNALSYM SO_KEEPALIVE}
  SO_OOBINLINE  = 10;
  {$EXTERNALSYM SO_OOBINLINE}
  SO_LINGER     = 13;
  {$EXTERNALSYM SO_LINGER}
  SO_RCVLOWAT   = 18;
  {$EXTERNALSYM SO_RCVLOWAT}
  SO_SNDLOWAT   = 19;
  {$EXTERNALSYM SO_SNDLOWAT}
  SO_RCVTIMEO   = 20;
  {$EXTERNALSYM SO_RCVTIMEO}
  SO_SNDTIMEO   = 21;
  {$EXTERNALSYM SO_SNDTIMEO}
  SO_ACCEPTCONN = 30;
  {$EXTERNALSYM SO_ACCEPTCONN}

  SO_NO_CHECK   = 11 platform;
  {$EXTERNALSYM SO_NO_CHECK}
  SO_PRIORITY   = 12 platform;
  {$EXTERNALSYM SO_PRIORITY}
  SO_BSDCOMPAT  = 14 platform;
  {$EXTERNALSYM SO_BSDCOMPAT}
{ To add : SO_REUSEPORT = 15 ; }
  SO_PASSCRED   = 16 platform;
  {$EXTERNALSYM SO_PASSCRED}
  SO_PEERCRED   = 17 platform;
  {$EXTERNALSYM SO_PEERCRED}

{ Security levels - as per NRL IPv6 - don't actually do anything }
  SO_SECURITY_AUTHENTICATION       = 22 platform;
  {$EXTERNALSYM SO_SECURITY_AUTHENTICATION}
  SO_SECURITY_ENCRYPTION_TRANSPORT = 23 platform;
  {$EXTERNALSYM SO_SECURITY_ENCRYPTION_TRANSPORT}
  SO_SECURITY_ENCRYPTION_NETWORK   = 24 platform;
  {$EXTERNALSYM SO_SECURITY_ENCRYPTION_NETWORK}

  SO_BINDTODEVICE                  = 25 platform;
  {$EXTERNALSYM SO_BINDTODEVICE}

{ Socket filtering }
  SO_ATTACH_FILTER = 26 platform;
  {$EXTERNALSYM SO_ATTACH_FILTER}
  SO_DETACH_FILTER = 27 platform;
  {$EXTERNALSYM SO_DETACH_FILTER}
  
  SO_PEERNAME     = 28 platform;
  {$EXTERNALSYM SO_PEERNAME}
  SO_TIMESTAMP    = 29 platform;
  {$EXTERNALSYM SO_TIMESTAMP}
  SCM_TIMESTAMP   = SO_TIMESTAMP platform;
  {$EXTERNALSYM SCM_TIMESTAMP}
  SO_PEERSEC      = 31 platform;
  {$EXTERNALSYM SO_PEERSEC}
  SO_PASSSEC      = 34 platform;
  {$EXTERNALSYM SO_PASSSEC}
  SO_TIMESTAMPNS  = 35 platform;
  {$EXTERNALSYM SO_TIMESTAMPNS}
  SCM_TIMESTAMPNS = SO_TIMESTAMPNS platform;
  {$EXTERNALSYM SCM_TIMESTAMPNS}
  SO_MARK         = 36 platform;
  {$EXTERNALSYM SO_MARK}

  SOMAXCONN       = 128;
  {$EXTERNALSYM SOMAXCONN}

type
  sockaddr = record
    sa_family: sa_family_t;
    sa_data: packed array[0..14-1] of Byte;
  end;
  {$EXTERNALSYM sockaddr}
  Psockaddr = ^sockaddr;

  __ss_align = LongWord;
  {$EXTERNALSYM __ss_align}

const
  _SS_SIZE = 128;
  {$EXTERNALSYM _SS_SIZE}
  _SS_PADSIZE = _SS_SIZE - (2 * SizeOf(__ss_align));
  {$EXTERNALSYM _SS_PADSIZE}

type
  sockaddr_storage = record
    ss_family: sa_family_t;
    ss_align: __ss_align;
    ss_padding: array [0.._SS_PADSIZE-1] of Byte;
  end;
  {$EXTERNALSYM sockaddr_storage}
  Psockaddr_storage = ^sockaddr_storage;

const
  { Bits in the FLAGS argument to `send', `recv', et al. }
  MSG_OOB       = $01;                  // Process out-of-band data.
  {$EXTERNALSYM MSG_OOB}
  MSG_PEEK      = $02;                  // Peek at incoming messages.
  {$EXTERNALSYM MSG_PEEK}
  MSG_DONTROUTE = $04;                  // Don't use local routing.
  {$EXTERNALSYM MSG_DONTROUTE}
  MSG_TRYHARD   = MSG_DONTROUTE platform; // DECnet uses a different name.
  {$EXTERNALSYM MSG_TRYHARD}
  MSG_CTRUNC    = $08;                  // Control data lost before delivery.
  {$EXTERNALSYM MSG_CTRUNC}
  MSG_PROXY     = $10 platform;         // Supply or ask second address.
  {$EXTERNALSYM MSG_PROXY}
  MSG_TRUNC     = $20;
  {$EXTERNALSYM MSG_TRUNC}
  MSG_DONTWAIT  = $40 platform;         // Nonblocking IO.
  {$EXTERNALSYM MSG_DONTWAIT}
  MSG_EOR       = $80;                  // End of record.
  {$EXTERNALSYM MSG_EOR}
  MSG_WAITALL   = $100;                 // Wait for a full request.
  {$EXTERNALSYM MSG_WAITALL}
  MSG_FIN= $200 platform;
  {$EXTERNALSYM MSG_FIN}
  MSG_SYN       = $400 platform;
  {$EXTERNALSYM MSG_SYN}
  MSG_CONFIRM   = $800 platform;       // Confirm path validity.
  {$EXTERNALSYM MSG_CONFIRM}
  MSG_RST       = $1000 platform;
  {$EXTERNALSYM MSG_RST}
  MSG_ERRQUEUE  = $2000 platform;      // Fetch message from error queue.
  {$EXTERNALSYM MSG_ERRQUEUE}
  MSG_NOSIGNAL  = $4000 platform;      // Do not generate SIGPIPE.
  {$EXTERNALSYM MSG_NOSIGNAL}

  { Protocol families. }
  PF_UNSPEC     = 0; { Unspecified.  }
  {$EXTERNALSYM PF_UNSPEC}
  PF_LOCAL      = 1; { Local to host (pipes and file-domain).  }
  {$EXTERNALSYM PF_LOCAL}
  PF_UNIX       = PF_LOCAL; { POSIX name for PF_LOCAL. }
  {$EXTERNALSYM PF_UNIX}
  PF_FILE       = PF_LOCAL platform; { Another non-standard name for PF_LOCAL. }
  {$EXTERNALSYM PF_FILE}
  PF_INET       = 2; { IP protocol family.  }
  {$EXTERNALSYM PF_INET}
  PF_AX25       = 3 platform; { Amateur Radio AX.25.  }
  {$EXTERNALSYM PF_AX25}
  PF_IPX        = 4; { Novell Internet Protocol.  }
  {$EXTERNALSYM PF_IPX}
  PF_APPLETALK  = 5; { Appletalk DDP.  }
  {$EXTERNALSYM PF_APPLETALK}
  PF_NETROM     = 6 platform; { Amateur radio NetROM.  }
  {$EXTERNALSYM PF_NETROM}
  PF_BRIDGE     = 7 platform; { Multiprotocol bridge.  }
  {$EXTERNALSYM PF_BRIDGE}
  PF_ATMPVC     = 8 platform; { ATM PVCs.  }
  {$EXTERNALSYM PF_ATMPVC}
  PF_X25        = 9 platform; { Reserved for X.25 project.  }
  {$EXTERNALSYM PF_X25}
  PF_INET6      = 10; { IP version 6.  }
  {$EXTERNALSYM PF_INET6}
  PF_ROSE       = 11 platform; { Amateur Radio X.25 PLP.  }
  {$EXTERNALSYM PF_ROSE}
  PF_DECnet     = 12; { Reserved for DECnet project.  }
  {$EXTERNALSYM PF_DECnet}
  PF_NETBEUI    = 13 platform; { Reserved for 802.2LLC project.  }
  {$EXTERNALSYM PF_NETBEUI}
  PF_SECURITY   = 14 platform; { Security callback pseudo AF.  }
  {$EXTERNALSYM PF_SECURITY}
  PF_KEY        = 15 platform; { PF_KEY key management API.  }
  {$EXTERNALSYM PF_KEY}
  PF_NETLINK    = 16 platform;
  {$EXTERNALSYM PF_NETLINK}
  PF_ROUTE      = PF_NETLINK platform; { Alias to emulate 4.4BSD. }
  {$EXTERNALSYM PF_ROUTE}
  PF_PACKET     = 17 platform; { Packet family.  }
  {$EXTERNALSYM PF_PACKET}
  PF_ASH        = 18 platform; { Ash.  }
  {$EXTERNALSYM PF_ASH}
  PF_ECONET     = 19 platform; { Acorn Econet.  }
  {$EXTERNALSYM PF_ECONET}
  PF_ATMSVC     = 20 platform; { ATM SVCs.  }
  {$EXTERNALSYM PF_ATMSVC}
  PF_SNA        = 22; { Linux SNA Project }
  {$EXTERNALSYM PF_SNA}
  PF_IRDA       = 23 platform; { IRDA sockets.  }
  {$EXTERNALSYM PF_IRDA}
  PF_PPPOX      = 24 platform; { PPPoX sockets.  }
  {$EXTERNALSYM PF_PPPOX}
  PF_WANPIPE    = 25 platform; { Wanpipe API sockets.  }
  {$EXTERNALSYM PF_WANPIPE}
  PF_BLUETOOTH  = 31 platform; { Bluetooth sockets.  }
  {$EXTERNALSYM PF_BLUETOOTH}
  PF_IUCV       = 32 platform; { IUCV sockets.  }
  {$EXTERNALSYM PF_IUCV}
  PF_RXRPC      = 33 platform; { RxRPC sockets.  }
  {$EXTERNALSYM PF_RXRPC}
  PF_ISDN       = 34 platform; { mISDN sockets.  }
  {$EXTERNALSYM PF_ISDN}
  PF_MAX        = 35 platform; { For now..  }
  {$EXTERNALSYM PF_MAX}

  { Address families. }
  AF_UNSPEC     = PF_UNSPEC;
  {$EXTERNALSYM AF_UNSPEC}
  AF_LOCAL      = PF_LOCAL;
  {$EXTERNALSYM AF_LOCAL}
  AF_UNIX       = PF_UNIX;
  {$EXTERNALSYM AF_UNIX}
  AF_FILE       = PF_FILE platform;
  {$EXTERNALSYM AF_FILE}
  AF_INET       = PF_INET;
  {$EXTERNALSYM AF_INET}
  AF_AX25       = PF_AX25 platform;
  {$EXTERNALSYM AF_AX25}
  AF_IPX        = PF_IPX;
  {$EXTERNALSYM AF_IPX}
  AF_APPLETALK  = PF_APPLETALK;
  {$EXTERNALSYM AF_APPLETALK}
  AF_NETROM     = PF_NETROM platform;
  {$EXTERNALSYM AF_NETROM}
  AF_BRIDGE     = PF_BRIDGE platform;
  {$EXTERNALSYM AF_BRIDGE}
  AF_ATMPVC     = PF_ATMPVC platform;
  {$EXTERNALSYM AF_ATMPVC}
  AF_X25        = PF_X25 platform;
  {$EXTERNALSYM AF_X25}
  AF_INET6      = PF_INET6;
  {$EXTERNALSYM AF_INET6}
  AF_ROSE       = PF_ROSE platform;
  {$EXTERNALSYM AF_ROSE}
  AF_DECnet     = PF_DECnet platform;
  {$EXTERNALSYM AF_DECnet}
  AF_NETBEUI    = PF_NETBEUI platform;
  {$EXTERNALSYM AF_NETBEUI}
  AF_SECURITY   = PF_SECURITY platform;
  {$EXTERNALSYM AF_SECURITY}
  AF_KEY        = PF_KEY platform;
  {$EXTERNALSYM AF_KEY}
  AF_NETLINK    = PF_NETLINK platform;
  {$EXTERNALSYM AF_NETLINK}
  AF_ROUTE      = PF_ROUTE platform;
  {$EXTERNALSYM AF_ROUTE}
  AF_PACKET     = PF_PACKET platform;
  {$EXTERNALSYM AF_PACKET}
  AF_ASH        = PF_ASH platform;
  {$EXTERNALSYM AF_ASH}
  AF_ECONET     = PF_ECONET platform;
  {$EXTERNALSYM AF_ECONET}
  AF_ATMSVC     = PF_ATMSVC platform;
  {$EXTERNALSYM AF_ATMSVC}
  AF_SNA        = PF_SNA;
  {$EXTERNALSYM AF_SNA}
  AF_IRDA       = PF_IRDA;
  {$EXTERNALSYM AF_IRDA}
  AF_PPPOX      = PF_PPPOX platform;
  {$EXTERNALSYM AF_PPPOX}
  AF_WANPIPE    = PF_WANPIPE platform;
  {$EXTERNALSYM AF_WANPIPE}
  AF_BLUETOOTH  = PF_BLUETOOTH platform;
  {$EXTERNALSYM AF_BLUETOOTH}
  AF_IUCV       = PF_IUCV platform;
  {$EXTERNALSYM AF_IUCV}
  AF_RXRPC      = PF_RXRPC platform;
  {$EXTERNALSYM AF_RXRPC}
  AF_ISDN       = PF_ISDN platform;
  {$EXTERNALSYM AF_ISDN}
  AF_MAX        = PF_MAX;
  {$EXTERNALSYM AF_MAX}

  { The following constants should be used for the second parameter of `shutdown'. }
  SHUT_RD         = 0;
  {$EXTERNALSYM SHUT_RD}
  SHUT_RDWR       = 1;
  {$EXTERNALSYM SHUT_RDWR}
  SHUT_WR         = 2;
  {$EXTERNALSYM SHUT_WR}

