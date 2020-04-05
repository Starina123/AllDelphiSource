{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ Absolute file name for network data base files.  }
const
  _PATH_HEQUIV          = '/etc/hosts.equiv' platform;
  {$EXTERNALSYM _PATH_HEQUIV}
  _PATH_HOSTS           = '/etc/hosts' platform;
  {$EXTERNALSYM _PATH_HOSTS}
  _PATH_NETWORKS        = '/etc/networks' platform;
  {$EXTERNALSYM _PATH_NETWORKS}
  _PATH_NSSWITCH_CONF   = '/etc/nsswitch.conf' platform;
  {$EXTERNALSYM _PATH_NSSWITCH_CONF}
  _PATH_PROTOCOLS       = '/etc/protocols' platform;
  {$EXTERNALSYM _PATH_PROTOCOLS}
  _PATH_SERVICES        = '/etc/services' platform;
  {$EXTERNALSYM _PATH_SERVICES}

  HOST_NOT_FOUND        = 1 platform;       { Authoritative Answer Host not found.  }
  {$EXTERNALSYM HOST_NOT_FOUND}
  TRY_AGAIN             = 2 platform;       { Non-Authoritative Host not found, or SERVERFAIL.  }
  {$EXTERNALSYM TRY_AGAIN}
  NO_RECOVERY           = 3 platform;       { Non recoverable errors, FORMERR, REFUSED, NOTIMP.  }
  {$EXTERNALSYM NO_RECOVERY}
  NO_DATA               = 4 platform;       { Valid name, no data record of requested type.  }
  {$EXTERNALSYM NO_DATA}
  NETDB_INTERNAL        = -1 platform;      { See errno.  }
  {$EXTERNALSYM NETDB_INTERNAL}
  NETDB_SUCCESS         = 0 platform;       { No problem.  }
  {$EXTERNALSYM NETDB_SUCCESS}
  NO_ADDRESS            = NO_DATA platform; { No address, look for MX record.  }
  {$EXTERNALSYM NO_ADDRESS}

{ Scope delimiter for getaddrinfo(), getnameinfo().  }
  SCOPE_DELIMITER       = '%' platform;
  {$EXTERNALSYM SCOPE_DELIMITER}

type
  hostent = record
    h_name: MarshaledAString;
    h_aliases: PMarshaledAString;
    h_addrtype: Integer;
    h_length: socklen_t;
    case Byte of
      0: (h_addr_list: PMarshaledAString);     { List of addresses from name server.  }
      1: (h_addr: PMarshaledAString);          { Address, for backward compatibility. }
  end;
  {$EXTERNALSYM hostent}
  Phostent = ^hostent;

  netent = record
    n_name: MarshaledAString;
    n_aliases: PMarshaledAString;
    n_addrtype: Integer;
    n_net: UInt32;
  end;
  {$EXTERNALSYM netent}
  Pnetent = ^netent;

  protoent = record
    p_name: MarshaledAString;
    p_aliases: PMarshaledAString;
    p_proto: Integer;
  end;
  {$EXTERNALSYM protoent}
  Pprotoent = ^protoent;

  servent = record
    s_name: MarshaledAString;
    s_aliases: PMarshaledAString;
    s_port: Integer;
    s_proto: MarshaledAString;
  end;
  {$EXTERNALSYM servent}
  Pservent = ^servent;

const
  IPPORT_RESERVED = 1024;
  {$EXTERNALSYM IPPORT_RESERVED}

type
  Paddrinfo = ^addrinfo;
  addrinfo = record
    ai_flags: Integer;
    ai_family: Integer;
    ai_socktype: Integer;
    ai_protocol: Integer;
    ai_addrlen: socklen_t;
    ai_addr: Psockaddr;
    ai_canonname: MarshaledAString;
    ai_next: Paddrinfo;
  end;
  {$EXTERNALSYM addrinfo}

  //TODO: gaicb

const
{ Lookup mode. }
  GAI_WAIT = 0 platform;
  {$EXTERNALSYM GAI_WAIT}
  GAI_NOWAIT = 1 platform;
  {$EXTERNALSYM GAI_NOWAIT}

{ Possible values for `ai_flags' field in `addrinfo' structure.}
  AI_PASSIVE = $0001; { Socket address is intended for `bind'.}
  {$EXTERNALSYM AI_PASSIVE}
  AI_CANONNAME = $0002; { Request for canonical name.}
  {$EXTERNALSYM AI_CANONNAME}
  AI_NUMERICHOST = $0004; { Don't use name resolution.}
  {$EXTERNALSYM AI_NUMERICHOST}
  AI_V4MAPPED = $0008; { IPv4 mapped addresses are acceptable.}
  {$EXTERNALSYM AI_V4MAPPED}
  AI_ALL = $0010; { Return IPv4 mapped and IPv6 addresses.}
  {$EXTERNALSYM AI_ALL}
  AI_ADDRCONFIG = $0020; { Use configuration of this host to
                           choose returned address type..  }
  {$EXTERNALSYM AI_ADDRCONFIG}
  AI_IDN = $0040 platform; { IDN encode input (assuming it is encoded in
                              the current locale's character set) before looking it up. }
  {$EXTERNALSYM AI_IDN}
  AI_CANONIDN = $0080 platform; { Translate canonical name from IDN format. }
  {$EXTERNALSYM AI_CANONIDN}
  AI_IDN_ALLOW_UNASSIGNED = $0100 platform; { Don't reject unassigned Unicode code points.}
  {$EXTERNALSYM AI_IDN_ALLOW_UNASSIGNED}
  AI_IDN_USE_STD3_ASCII_RULES = $0200 platform; { Validate strings according to STD3 rules.}
  {$EXTERNALSYM AI_IDN_USE_STD3_ASCII_RULES}

  AI_NUMERICSERV = $0400 platform; { Don't use name resolution.  }
  {$EXTERNALSYM AI_NUMERICSERV}
  
{ Error values for `getaddrinfo' function.  }
  EAI_BADFLAGS = -1; { Invalid value for `ai_flags' field.  }
  {$EXTERNALSYM EAI_BADFLAGS}
  EAI_NONAME = -2; { NAME or SERVICE is unknown.  }
  {$EXTERNALSYM EAI_NONAME}
  EAI_AGAIN = -3; { Temporary failure in name resolution.  }
  {$EXTERNALSYM EAI_AGAIN}
  EAI_FAIL = -4; { Non-recoverable failure in name res.  }
  {$EXTERNALSYM EAI_FAIL}
  EAI_FAMILY = -6; { `ai_family' not supported.  }
  {$EXTERNALSYM EAI_FAMILY}
  EAI_SOCKTYPE = -7; { `ai_socktype' not supported.  }
  {$EXTERNALSYM EAI_SOCKTYPE}
  EAI_SERVICE = -8; { SERVICE not supported for `ai_socktype'.  }
  {$EXTERNALSYM EAI_SERVICE}
  EAI_MEMORY = -10; { Memory allocation failure.  }
  {$EXTERNALSYM EAI_MEMORY}
  EAI_SYSTEM = -11; { System error returned in `errno'.  }
  {$EXTERNALSYM EAI_SYSTEM}
  EAI_OVERFLOW = -12; { Argument buffer overflow.  }
  {$EXTERNALSYM EAI_OVERFLOW}

  EAI_NODATA = -5 platform; { No address associated with NAME.  }
  {$EXTERNALSYM EAI_NODATA}
  EAI_ADDRFAMILY = -9 platform; { Address family for NAME not supported.  }
  {$EXTERNALSYM EAI_ADDRFAMILY}
  EAI_INPROGRESS = -100 platform; { Processing request in progress.  }
  {$EXTERNALSYM EAI_INPROGRESS}
  EAI_CANCELED = -101 platform; { Request canceled.  }
  {$EXTERNALSYM EAI_CANCELED}
  EAI_NOTCANCELED = -102 platform; { Request not canceled.  }
  {$EXTERNALSYM EAI_NOTCANCELED}
  EAI_ALLDONE = -103 platform; { All requests done.  }
  {$EXTERNALSYM EAI_ALLDONE}
  EAI_INTR = -104 platform; { Interrupted by a signal.  }
  {$EXTERNALSYM EAI_INTR}
  EAI_IDN_ENCODE = -105 platform; { IDN encoding failed.  }
  {$EXTERNALSYM EAI_IDN_ENCODE}


  NI_MAXHOST      = 1025 platform;
  {$EXTERNALSYM NI_MAXHOST     }
  NI_MAXSERV      = 32 platform;
  {$EXTERNALSYM NI_MAXSERV     }

  NI_NUMERICHOST = 1; { Don't try to look up hostname.  }
  {$EXTERNALSYM NI_NUMERICHOST}
  NI_NUMERICSERV = 2; { Don't convert port number to name.  }
  {$EXTERNALSYM NI_NUMERICSERV}
  NI_NOFQDN = 4; { Only return nodename portion.  }
  {$EXTERNALSYM NI_NOFQDN}
  NI_NAMEREQD = 8; { Don't return numeric addresses.  }
  {$EXTERNALSYM NI_NAMEREQD}
  NI_DGRAM = 16; { Look up UDP service rather than TCP.  }
  {$EXTERNALSYM NI_DGRAM}

  NI_IDN = 32 platform; { Convert name from IDN format.  }
  {$EXTERNALSYM NI_IDN}
  NI_IDN_ALLOW_UNASSIGNED = 64 platform; { Don't reject unassigned Unicode code points.  }
  {$EXTERNALSYM NI_IDN_ALLOW_UNASSIGNED}
  NI_IDN_USE_STD3_ASCII_RULES = 128 platform; { Validate strings according to STD3 rules.  }
  {$EXTERNALSYM NI_IDN_USE_STD3_ASCII_RULES}
