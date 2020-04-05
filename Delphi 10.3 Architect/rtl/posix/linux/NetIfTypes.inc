{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  _if_nameindex = record //renamed due to name conflict with function name.
    if_index: Cardinal;
    if_name: MarshaledAString;
  end;

  PIfNameIndex = ^_if_nameindex;

{ Standard interface flags. }
const
  IFF_UP = $1 platform;             { Interface is up.  }
  {$EXTERNALSYM IFF_UP}
  IFF_BROADCAST = $2 platform;      { Broadcast address valid.  }
  {$EXTERNALSYM IFF_BROADCAST}
  IFF_DEBUG = $4 platform;          { Turn on debugging.  }
  {$EXTERNALSYM IFF_DEBUG}
  IFF_LOOPBACK = $8 platform;       { Is a loopback net.  }
  {$EXTERNALSYM IFF_LOOPBACK}
  IFF_POINTOPOINT = $10 platform;   { Interface is point-to-point link.  }
  {$EXTERNALSYM IFF_POINTOPOINT}
  IFF_NOTRAILERS = $20 platform;    { Avoid use of trailers.  }
  {$EXTERNALSYM IFF_NOTRAILERS}
  IFF_RUNNING = $40 platform;       { Resources allocated.  }
  {$EXTERNALSYM IFF_RUNNING}
  IFF_NOARP = $80 platform;         { No address resolution protocol.  }
  {$EXTERNALSYM IFF_NOARP}
  IFF_PROMISC = $100 platform;      { Receive all packets.  }
  {$EXTERNALSYM IFF_PROMISC}

  { Not supported }
  IFF_ALLMULTI = $200 platform;     { Receive all multicast packets.  }
  {$EXTERNALSYM IFF_ALLMULTI}

  IFF_MASTER = $400 platform;       { Master of a load balancer.  }
  {$EXTERNALSYM IFF_MASTER}
  IFF_SLAVE = $800 platform;        { Slave of a load balancer.  }
  {$EXTERNALSYM IFF_SLAVE}

  IFF_MULTICAST = $1000 platform;   { Supports multicast.  }
  {$EXTERNALSYM IFF_MULTICAST}

  IFF_PORTSEL = $2000 platform;     { Can set media type.  }
  {$EXTERNALSYM IFF_PORTSEL}
  IFF_AUTOMEDIA = $4000 platform;   { Auto media select active.  }
  {$EXTERNALSYM IFF_AUTOMEDIA}
  IFF_DYNAMIC   = $8000 platform;   { Dialup device with changing addresses. }
  {$EXTERNALSYM IFF_DYNAMIC}

{ Interface request structure used for socket ioctl's.  All interface
   ioctl's must have parameter definitions which begin with ifr_name.
   The remainder may be interface specific.  }
const
  IFHWADDRLEN = 6;
  {$EXTERNALSYM IFHWADDRLEN}
  IFNAMSIZ    = 16;
  {$EXTERNALSYM IFNAMSIZ}

type
{ Device mapping structure. I'd just gone off and designed a
   beautiful scheme using only loadable modules with arguments for
   driver options and along come the PCMCIA people 8)

   Ah well. The get() side of this is good for WDSETUP, and it'll be
   handy for debugging things. The set side is fine for now and being
   very small might be worth keeping for clean configuration.  }

  ifmap = record
    mem_start: LongWord;
    mem_end: LongWord;
    base_addr: Word;
    irq: Byte;
    dma: Byte;
    port: Byte;
    { 3 bytes spare }
  end platform;
  {$EXTERNALSYM ifmap}
  Pifmap = ^ifmap;

  ifreq = record
    ifr_ifrn: record
      ifrn_name: packed array[0..IFNAMSIZ-1] of Byte; { Interface name, e.g. "en0".  }
    end;
    ifr_ifru: record
      case Integer of
        0:( ifru_addr: sockaddr; );
        1:( ifru_dstaddr: sockaddr; );
        2:( ifru_broadaddr: sockaddr; );
        3:( ifru_netmask: sockaddr; );
        4:( ifru_hwaddr: sockaddr; );
        5:( ifru_flags: Smallint; );
        6:( ifru_ivalue: Integer; );
        7:( ifru_mtu: Integer; );
        8:( ifru_map: ifmap; );
        9:( ifru_slave: packed array[0..IFNAMSIZ-1] of Byte; ); { Just fits the size }
        10:( ifru_newname: packed array[0..IFNAMSIZ-1] of Byte; );
        11:( ifru_data: caddr_t; );
    end;
  end;
  {$EXTERNALSYM ifreq}
  Pifreq = ^ifreq;

type
  Pifaddrs = ^ifaddrs;
  ifaddrs = record
    ifa_next: Pifaddrs;
    ifa_name: PMarshaledAString;
    ifa_flags: Cardinal;
    ifa_addr: Psockaddr;
    ifa_netmask: Psockaddr;
    ifa_ifu: record
      case Integer of
      0: (ifu_broadaddr: Psockaddr);
      1: (ifu_dstaddr: Psockaddr);
    end;
    ifa_data: Pointer;
  end platform;
  {$EXTERNALSYM ifaddrs}

{ Structure used in SIOCGIFCONF request.  Used to retrieve interface
   configuration for machine (useful for programs which must know all
   networks accessible).  }
type
  ifconf = record
    ifc_len: Integer;                 { Size of buffer.  }
    ifc_ifcu: record
      case Integer of
        0: (ifcu_buf: caddr_t);
        1: (ifcu_req: Pifreq);
      end;
  end;
  {$EXTERNALSYM ifconf}
  Pifconf = ^ifconf;

(* Cannot be translated
#define	ifc_buf	ifc_ifcu.ifcu_buf	{ Buffer address.  }
#define	ifc_req	ifc_ifcu.ifcu_req	{ Array of structures.  }
*)
