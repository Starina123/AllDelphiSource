{*******************************************************}
{                                                       }
{                 Kylix Runtime Library                 }
{             Linux Kernel API Interface Unit           }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{  This translation is based on include files           }
{  taken from the Linux 4.4 kernel.                     }
{  Translator: Embarcadero Technologies, Inc.           }
{*******************************************************}

unit Linuxapi.KernelDefs;

{$WEAKPACKAGEUNIT}

{$ALIGN 4}
{$MINENUMSIZE 4}
{$ASSERTIONS OFF}

interface

// Definitions taken from Libc.pas needed to get around
// recursive uses of units.

const
  (* This constant needs to be kept in sync with Libc.pas *)
  SIOCDEVPRIVATE       = $89F0;    { to 89FF }
  {$EXTERNALSYM SIOCDEVPRIVATE}

  (* This constant needs to be kept in sync with Libc.pas *)
  SIOCPROTOPRIVATE     = $89E0;    { to 89EF }
  {$NODEFINE SIOCPROTOPRIVATE}

type
  (* This type needs to be kept in sync with Libc.pas *)
  sa_family_t = Word;
  {$NODEFINE sa_family_t}


// Translated from linux/include/asm-i386/param.h

const
  HZ = 100;
  {$EXTERNALSYM HZ}

const
  EXEC_PAGESIZE = 4096;
  {$EXTERNALSYM EXEC_PAGESIZE}

const
  NOGROUP = (-1);
  {$EXTERNALSYM NOGROUP}

const
  MAXHOSTNAMELEN = 64; { max length of hostname }
  {$EXTERNALSYM MAXHOSTNAMELEN}


// Translated from linux/include/asm-i386/types.h

type
  umode_t = Word;
  {$EXTERNALSYM umode_t}

  __s8 = Shortint;
  {$EXTERNALSYM __s8}
  __u8 = Byte;
  {$EXTERNALSYM __u8}

  __s16 = Smallint;
  {$EXTERNALSYM __s16}
  __u16 = Word;
  {$EXTERNALSYM __u16}

  __s32 = Integer;
  {$EXTERNALSYM __s32}
  __u32 = Cardinal;
  {$EXTERNALSYM __u32}

  __s64 = Int64;
  {$EXTERNALSYM __s64}
  // Duplicated from Libc.pas
  __u64 = 0..High(Int64); // Create unsigned Int64 (with 63 bits)
  {$EXTERNALSYM __u64}

  __le16 = __u16;
  {$EXTERNALSYM __le16}
  __be16 = __u16;
  {$EXTERNALSYM __be16}
  __le32 = __u32;
  {$EXTERNALSYM __le32}
  __be32 = __u32;
  {$EXTERNALSYM __be32}
  __le64 = __u64;
  {$EXTERNALSYM __le64}
  __be64 = __u64;
  {$EXTERNALSYM __be64}

  __sum16 = __u16;
  {$EXTERNALSYM __sum16}
  __wsum  = __u32;
  {$EXTERNALSYM __wsum}


// Translated from linux/include/linux/if_ether.h

{
 *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
 *	and FCS/CRC (frame check sequence).
 }

const
  ETH_ALEN        = 6;        { Octets in one ethernet addr }
  {$EXTERNALSYM ETH_ALEN}
  ETH_HLEN        = 14;       { Total octets in header. }
  {$EXTERNALSYM ETH_HLEN}
  ETH_ZLEN        = 60;       { Min. octets in frame sans FCS }
  {$EXTERNALSYM ETH_ZLEN}
  ETH_DATA_LEN    = 1500;     { Max. octets in payload }
  {$EXTERNALSYM ETH_DATA_LEN}
  ETH_FRAME_LEN   = 1514;     { Max. octets in frame sans FCS }
  {$EXTERNALSYM ETH_FRAME_LEN}
  ETH_FCS_LEN     = 4;        { Octets in the FCS }
  {$EXTERNALSYM ETH_FRAME_LEN}

{ These are the defined Ethernet Protocol ID's. }

  ETH_P_LOOP      = $0060;    { Ethernet Loopback packet }
  {$EXTERNALSYM ETH_P_LOOP}
  ETH_P_PUP       = $0200;    { Xerox PUP packet }
  {$EXTERNALSYM ETH_P_PUP}
  ETH_P_PUPAT     = $0201;    { Xerox PUP Addr Trans packet }
  {$EXTERNALSYM ETH_P_PUPAT}
  ETH_P_TSN       = $22F0;    { TSN (IEEE 1722) packet }
  {$EXTERNALSYM ETH_P_TSN}
  ETH_P_IP        = $0800;	  { Internet Protocol packet }
  {$EXTERNALSYM ETH_P_IP}
  ETH_P_X25       = $0805;    { CCITT X.25 }
  {$EXTERNALSYM ETH_P_X25}
  ETH_P_ARP       = $0806;    { Address Resolution packet }
  {$EXTERNALSYM ETH_P_ARP}
  ETH_P_BPQ       = $08FF;    { G8BPQ AX.25 Ethernet Packet [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_BPQ}
  ETH_P_IEEEPUP   = $0A00;    { Xerox IEEE802.3 PUP packet }
  {$EXTERNALSYM ETH_P_IEEEPUP}
  ETH_P_IEEEPUPAT = $0A01;    { Xerox IEEE802.3 PUP Addr Trans packet }
  {$EXTERNALSYM ETH_P_IEEEPUPAT}
  ETH_P_BATMAN    = $4305;    { B.A.T.M.A.N.-Advanced packet [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_BATMAN}
  ETH_P_DEC       = $6000;    { DEC Assigned proto }
  {$EXTERNALSYM ETH_P_DEC}
  ETH_P_DNA_DL    = $6001;    { DEC DNA Dump/Load }
  {$EXTERNALSYM ETH_P_DNA_DL}
  ETH_P_DNA_RC    = $6002;    { DEC DNA Remote Console }
  {$EXTERNALSYM ETH_P_DNA_RC}
  ETH_P_DNA_RT    = $6003;    { DEC DNA Routing }
  {$EXTERNALSYM ETH_P_DNA_RT}
  ETH_P_LAT       = $6004;    { DEC LAT }
  {$EXTERNALSYM ETH_P_LAT}
  ETH_P_DIAG      = $6005;    { DEC Diagnostics }
  {$EXTERNALSYM ETH_P_DIAG}
  ETH_P_CUST      = $6006;    { DEC Customer use }
  {$EXTERNALSYM ETH_P_CUST}
  ETH_P_SCA       = $6007;    { DEC Systems Comms Arch }
  {$EXTERNALSYM ETH_P_SCA}
  ETH_P_TEB       = $6558;    { Trans Ether Bridging }
  {$EXTERNALSYM ETH_P_TEB}
  ETH_P_RARP      = $8035;    { Reverse Addr Res packet }
  {$EXTERNALSYM ETH_P_RARP}
  ETH_P_ATALK     = $809B;    { Appletalk DDP }
  {$EXTERNALSYM ETH_P_ATALK}
  ETH_P_AARP      = $80F3;    { Appletalk AARP }
  {$EXTERNALSYM ETH_P_AARP}
  ETH_P_8021Q     = $8100;    { 802.1Q VLAN Extended Header }
  {$EXTERNALSYM ETH_P_8021Q}
  ETH_P_IPX       = $8137;    { IPX over DIX }
  {$EXTERNALSYM ETH_P_IPX}
  ETH_P_IPV6      = $86DD;    { IPv6 over bluebook }
  {$EXTERNALSYM ETH_P_IPV6}

  ETH_P_PAUSE     = $8808;    { IEEE Pause frames. See 802.3 31B }
  {$EXTERNALSYM ETH_P_PAUSE}
  ETH_P_SLOW      = $8809;    { Slow Protocol. See 802.3ad 43B }
  {$EXTERNALSYM ETH_P_SLOW}
  ETH_P_WCCP      = $883E;    { Web-cache coordination protocol defined in draft-wilson-wrec-wccp-v2-00.txt }
  {$EXTERNALSYM ETH_P_WCCP}
  ETH_P_MPLS_UC   = $8847;    { MPLS Unicast traffic }
  {$EXTERNALSYM ETH_P_MPLS_UC}
  ETH_P_MPLS_MC   = $8848;    { MPLS Multicast traffic }
  {$EXTERNALSYM ETH_P_MPLS_MC}
  ETH_P_ATMMPOA   = $884C;    { MultiProtocol Over ATM }
  {$EXTERNALSYM ETH_P_ATMMPOA}
  ETH_P_PPP_DISC  = $8863;    { PPPoE discovery messages }
  {$EXTERNALSYM ETH_P_PPP_DISC}
  ETH_P_PPP_SES   = $8864;    { PPPoE session messages }
  {$EXTERNALSYM ETH_P_PPP_SES}
  ETH_P_LINK_CTL  = $886C;    { HPNA, wlan link local tunnel }
  {$EXTERNALSYM ETH_P_LINK_CTL}
  ETH_P_ATMFATE   = $8884;    { Frame-based ATM Transport over Ethernet }
  {$EXTERNALSYM ETH_P_ATMFATE}
  ETH_P_PAE       = $888E;    { Port Access Entity (IEEE 802.1X) }
  {$EXTERNALSYM ETH_P_PAE}
  ETH_P_AOE       = $88A2;    { ATA over Ethernet }
  {$EXTERNALSYM ETH_P_AOE}
  ETH_P_8021AD    = $88A8;    { 802.1ad Service VLAN }
  {$EXTERNALSYM ETH_P_8021AD}
  ETH_P_802_EX1   = $88B5;    { 802.1 Local Experimental 1. }
  {$EXTERNALSYM ETH_P_802_EX1}
  ETH_P_TIPC      = $88CA;    { TIPC }
  {$EXTERNALSYM ETH_P_TIPC}
  ETH_P_8021AH    = $88E7;    { 802.1ah Backbone Service Tag }
  {$EXTERNALSYM ETH_P_8021AH}
  ETH_P_MVRP      = $88F5;    { 802.1Q MVRP }
  {$EXTERNALSYM ETH_P_MVRP}
  ETH_P_1588      = $88F7;    { IEEE 1588 Timesync }
  {$EXTERNALSYM ETH_P_1588}
  ETH_P_PRP       = $88FB;    { IEC 62439-3 PRP/HSRv0 }
  {$EXTERNALSYM ETH_P_PRP}
  ETH_P_FCOE      = $8906;    { Fibre Channel over Ethernet }
  {$EXTERNALSYM ETH_P_FCOE}
  ETH_P_TDLS      = $890D;    { TDLS }
  {$EXTERNALSYM ETH_P_TDLS}
  ETH_P_FIP       = $8914;    { FCoE Initialization Protocol }
  {$EXTERNALSYM ETH_P_FIP}
  ETH_P_80221     = $8917;    { IEEE 802.21 Media Independent Handover Protocol }
  {$EXTERNALSYM ETH_P_80221}
  ETH_P_LOOPBACK  = $9000;    { Ethernet loopback packet, per IEEE 802.3 }
  {$EXTERNALSYM ETH_P_LOOPBACK}
  ETH_P_QINQ1     = $9100;    { deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_QINQ1}
  ETH_P_QINQ2     = $9200;    { deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_QINQ2}
  ETH_P_QINQ3     = $9300;    { deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_QINQ3}
  ETH_P_EDSA      = $DADA;    { Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_EDSA}
  ETH_P_AF_IUCV   = $FBFB;    { IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] }
  {$EXTERNALSYM ETH_P_AF_IUCV}
  ETH_P_802_3_MIN = $0600;    { If the value in the ethernet type is less than this value then the frame is Ethernet II. Else it is 802.3 }
  {$EXTERNALSYM ETH_P_802_3_MIN}
{ Non DIX types. Won't clash for 1500 types. }

  ETH_P_802_3      = $0001;   { Dummy type for 802.3 frames }
  {$EXTERNALSYM ETH_P_802_3}
  ETH_P_AX25       = $0002;   { Dummy protocol id for AX.25 }
  {$EXTERNALSYM ETH_P_AX25}
  ETH_P_ALL        = $0003;   { Every packet (be careful!!!) }
  {$EXTERNALSYM ETH_P_ALL}
  ETH_P_802_2      = $0004;   { 802.2 frames }
  {$EXTERNALSYM ETH_P_802_2}
  ETH_P_SNAP       = $0005;   { Internal only }
  {$EXTERNALSYM ETH_P_SNAP}
  ETH_P_DDCMP      = $0006;   { DEC DDCMP: Internal only }
  {$EXTERNALSYM ETH_P_DDCMP}
  ETH_P_WAN_PPP    = $0007;   { Dummy type for WAN PPP frames }
  {$EXTERNALSYM ETH_P_WAN_PPP}
  ETH_P_PPP_MP     = $0008;   { Dummy type for PPP MP frames }
  {$EXTERNALSYM ETH_P_PPP_MP}
  ETH_P_LOCALTALK  = $0009;   { Localtalk pseudo type }
  {$EXTERNALSYM ETH_P_LOCALTALK}
  ETH_P_CAN        = $000C;   { CAN: Controller Area Network }
  {$EXTERNALSYM ETH_P_CAN}
  ETH_P_CANFD      = $000D;   { CANFD: CAN flexible data rate }
  {$EXTERNALSYM ETH_P_CANFD}
  ETH_P_PPPTALK    = $0010;   { Dummy type for Atalk over PPP }
  {$EXTERNALSYM ETH_P_PPPTALK}
  ETH_P_TR_802_2   = $0011;   { 802.2 frames }
  {$EXTERNALSYM ETH_P_TR_802_2}
  ETH_P_MOBITEX    = $0015;   { Mobitex (kaz@cafe.net) }
  {$EXTERNALSYM ETH_P_MOBITEX}
  ETH_P_CONTROL    = $0016;   { Card specific control frames }
  {$EXTERNALSYM ETH_P_CONTROL}
  ETH_P_IRDA       = $0017;   { Linux-IrDA }
  {$EXTERNALSYM ETH_P_IRDA}
  ETH_P_ECONET     = $0018;   { Acorn Econet }
  {$EXTERNALSYM ETH_P_ECONET}
  ETH_P_HDLC       = $0019;   { HDLC frames }
  {$EXTERNALSYM ETH_P_HDLC}
  ETH_P_ARCNET     = $001A;   { 1A for ArcNet :-) }
  {$EXTERNALSYM ETH_P_ARCNET}
  ETH_P_DSA        = $001B;   { Distributed Switch Arch. }
  {$EXTERNALSYM ETH_P_DSA}
  ETH_P_TRAILER    = $001C;   { Trailer switch tagging }
  {$EXTERNALSYM ETH_P_TRAILER}
  ETH_P_PHONET     = $00F5;   { Nokia Phonet frames }
  {$EXTERNALSYM ETH_P_PHONET}
  ETH_P_IEEE802154 = $00F6;   { IEEE802.15.4 frame }
  {$EXTERNALSYM ETH_P_IEEE802154}
  ETH_P_CAIF       = $00F7;   { ST-Ericsson CAIF protocol }
  {$EXTERNALSYM ETH_P_CAIF}
  ETH_P_XDSA       = $00F8;   { Multiplexed DSA protocol }
  {$EXTERNALSYM ETH_P_XDSA}
{ This is an Ethernet frame header. }
type
  ethhdr = packed record
    h_dest: packed array[0..ETH_ALEN-1] of Byte;     { destination eth addr }
    h_source: packed array[0..ETH_ALEN-1] of Byte;   { source ether addr }
    h_proto: __be16;                                 { packet type ID field }
  end;  // __attribute__((packed));
  {$EXTERNALSYM ethhdr}

{
 * We Have changed the ethernet statistics collection data. This
 * is just for partial compatibility for now.
 }


//Not translated
// #define enet_statistics net_device_stats

// Translated from linux/include/linux/if_fddi.h

{
 *  Define max and min legal sizes.  The frame sizes do not include
 *  4 byte FCS/CRC (frame check sequence).
 }
const
  FDDI_K_ALEN         = 6;    { Octets in one FDDI address }
  {$EXTERNALSYM FDDI_K_ALEN}
  FDDI_K_8022_HLEN    = 16;   { Total octets in 802.2 header }
  {$EXTERNALSYM FDDI_K_8022_HLEN}
  FDDI_K_SNAP_HLEN    = 21;   { Total octets in 802.2 SNAP header }
  {$EXTERNALSYM FDDI_K_SNAP_HLEN}
  FDDI_K_8022_ZLEN    = 16;   { Min octets in 802.2 frame sans FCS }
  {$EXTERNALSYM FDDI_K_8022_ZLEN}
  FDDI_K_SNAP_ZLEN    = 21;   { Min octets in 802.2 SNAP frame sans FCS }
  {$EXTERNALSYM FDDI_K_SNAP_ZLEN}
  FDDI_K_8022_DLEN    = 4475; { Max octets in 802.2 payload }
  {$EXTERNALSYM FDDI_K_8022_DLEN}
  FDDI_K_SNAP_DLEN    = 4470; { Max octets in 802.2 SNAP payload }
  {$EXTERNALSYM FDDI_K_SNAP_DLEN}
  FDDI_K_LLC_ZLEN     = 13;   { Min octets in LLC frame sans FCS }
  {$EXTERNALSYM FDDI_K_LLC_ZLEN}
  FDDI_K_LLC_LEN      = 4491; { Max octets in LLC frame sans FCS }
  {$EXTERNALSYM FDDI_K_LLC_LEN}
  FDDI_K_OUI_LEN      = 3;	  { Octets in OUI in 802.2 SNAP header }
  {$EXTERNALSYM FDDI_K_OUI_LEN}

{ Define FDDI Frame Control (FC) Byte values }
  FDDI_FC_K_VOID                 = $00;
  {$EXTERNALSYM FDDI_FC_K_VOID}
  FDDI_FC_K_NON_RESTRICTED_TOKEN = $80;
  {$EXTERNALSYM FDDI_FC_K_NON_RESTRICTED_TOKEN}
  FDDI_FC_K_RESTRICTED_TOKEN     = $C0;
  {$EXTERNALSYM FDDI_FC_K_RESTRICTED_TOKEN}
  FDDI_FC_K_SMT_MIN              = $41;
  {$EXTERNALSYM FDDI_FC_K_SMT_MIN}
  FDDI_FC_K_SMT_MAX              = $4F;
  {$EXTERNALSYM FDDI_FC_K_SMT_MAX}
  FDDI_FC_K_MAC_MIN              = $C1;
  {$EXTERNALSYM FDDI_FC_K_MAC_MIN}
  FDDI_FC_K_MAC_MAX              = $CF;
  {$EXTERNALSYM FDDI_FC_K_MAC_MAX}
  FDDI_FC_K_ASYNC_LLC_MIN        = $50;
  {$EXTERNALSYM FDDI_FC_K_ASYNC_LLC_MIN}
  FDDI_FC_K_ASYNC_LLC_DEF        = $54;
  {$EXTERNALSYM FDDI_FC_K_ASYNC_LLC_DEF}
  FDDI_FC_K_ASYNC_LLC_MAX        = $5F;
  {$EXTERNALSYM FDDI_FC_K_ASYNC_LLC_MAX}
  FDDI_FC_K_SYNC_LLC_MIN         = $D0;
  {$EXTERNALSYM FDDI_FC_K_SYNC_LLC_MIN}
  FDDI_FC_K_SYNC_LLC_MAX         = $D7;
  {$EXTERNALSYM FDDI_FC_K_SYNC_LLC_MAX}
  FDDI_FC_K_IMPLEMENTOR_MIN      = $60;
  {$EXTERNALSYM FDDI_FC_K_IMPLEMENTOR_MIN}
  FDDI_FC_K_IMPLEMENTOR_MAX      = $6F;
  {$EXTERNALSYM FDDI_FC_K_IMPLEMENTOR_MAX}
  FDDI_FC_K_RESERVED_MIN         = $70;
  {$EXTERNALSYM FDDI_FC_K_RESERVED_MIN}
  FDDI_FC_K_RESERVED_MAX         = $7F;
  {$EXTERNALSYM FDDI_FC_K_RESERVED_MAX}

{ Define LLC and SNAP constants }
  FDDI_EXTENDED_SAP = $AA;
  {$EXTERNALSYM FDDI_EXTENDED_SAP}
  FDDI_UI_CMD       = $03;
  {$EXTERNALSYM FDDI_UI_CMD}

{ Define 802.2 Type 1 header }
type
  fddi_8022_1_hdr = packed record
    dsap: __u8;    { destination service access point }
    ssap: __u8;    { source service access point }
    ctrl: __u8;    { control byte #1 }
  end; // __attribute__ ((packed));
  {$EXTERNALSYM fddi_8022_1_hdr}

{ Define 802.2 Type 2 header }
  fddi_8022_2_hdr = packed record
    dsap: __u8;    { destination service access point }
    ssap: __u8;    { source service access point }
    ctrl_1: __u8;  { control byte #1 }
    ctrl_2: __u8;  { control byte #2 }
  end; // __attribute__ ((packed));
  {$EXTERNALSYM fddi_8022_2_hdr}

{ Define 802.2 SNAP header }
  fddi_snap_hdr = packed record
    dsap: __u8;    { always $AA }
    ssap: __u8;    { always $AA }
    ctrl: __u8;    { always $03 }
    oui: packed array[0..FDDI_K_OUI_LEN-1] of __u8; { organizational universal id }
    ethertype: __u16; { packet type ID field }
  end; // __attribute__ ((packed));
  {$EXTERNALSYM fddi_snap_hdr}

{ Define FDDI LLC frame header }
  fddihdr = packed record
    fc: __u8;     { frame control }
    daddr: packed array[0..FDDI_K_ALEN-1] of __u8;  { destination address }
    saddr: packed array[0..FDDI_K_ALEN-1] of __u8;  { source address }
    hdr: packed record
           case Integer of
             0: (llc_8022_1: fddi_8022_1_hdr);
             1: (llc_8022_2: fddi_8022_2_hdr);
             2: (llc_snap: fddi_snap_hdr);
           end;
  end; // __attribute__ ((packed));
  {$EXTERNALSYM fddihdr}

{
  * Old network device statistics. Fields are native words
  * (unsigned long) so they can be read and written atomically.
}
  net_device_stats = record
    rx_packets: __u32;                 { total packets received }
    tx_packets: __u32;                 { total packets transmitted }
    rx_bytes: __u32;                   { total bytes received }
    tx_bytes: __u32;                   { total bytes transmitted }
    rx_errors: __u32;                  { bad packets received }
    tx_errors: __u32;                  { packet transmit problems }
    rx_dropped: __u32;                 { no space in linux buffers }
    tx_dropped: __u32;                 { no space available in linux }
    multicast: __u32;                  { multicast packets received }
    transmit_collision: __u32;         { always 0 for FDDI }

    { detailed rx_errors }
    rx_length_errors: __u32;
    rx_over_errors: __u32;             { receiver ring buff overflow }
    rx_crc_errors: __u32;              { recved pkt with crc error }
    rx_frame_errors: __u32;            { recv'd frame alignment error }
    rx_fifo_errors: __u32;	           { recv'r fifo overrun }
    rx_missed_errors: __u32;           { receiver missed packet }

    { detailed tx_errors }
    tx_aborted_errors: __u32;
    tx_carrier_errors: __u32;
    tx_fifo_errors: __u32;
    tx_heartbeat_errors: __u32;
    tx_window_errors: __u32;

    { for cslip etc }
    rx_compressed: __u32;
    tx_compressed: __u32;
  end;
  {$EXTERNALSYM net_device_stats}

{ Define FDDI statistics structure }
  fddi_statistics = {packed} record
    { Generic statistics. }
    gen: net_device_stats;

    { Detailed FDDI statistics.  Adopted from RFC 1512 }
    smt_station_id: packed array[0..8-1] of __u8;
    smt_op_version_id: __u32;
    smt_hi_version_id: __u32;
    smt_lo_version_id: __u32;
    smt_user_data: packed array[0..32-1] of __u8;
    smt_mib_version_id: __u32;
    smt_mac_cts: __u32;
    smt_non_master_cts: __u32;
    smt_master_cts: __u32;
    smt_available_paths: __u32;
    smt_config_capabilities: __u32;
    smt_config_policy: __u32;
    smt_connection_policy: __u32;
    smt_t_notify: __u32;
    smt_stat_rpt_policy: __u32;
    smt_trace_max_expiration: __u32;
    smt_bypass_present: __u32;
    smt_ecm_state: __u32;
    smt_cf_state: __u32;
    smt_remote_disconnect_flag: __u32;
    smt_station_status: __u32;
    smt_peer_wrap_flag: __u32;
    smt_time_stamp: __u32;
    smt_transition_time_stamp: __u32;
    mac_frame_status_functions: __u32;
    mac_t_max_capability: __u32;
    mac_tvx_capability: __u32;
    mac_available_paths: __u32;
    mac_current_path: __u32;
    mac_upstream_nbr: packed array[0..FDDI_K_ALEN-1] of __u8;
    mac_downstream_nbr: packed array[0..FDDI_K_ALEN-1] of __u8;
    mac_old_upstream_nbr: packed array[0..FDDI_K_ALEN-1] of __u8;
    mac_old_downstream_nbr: packed array[0..FDDI_K_ALEN-1] of __u8;
    mac_dup_address_test: __u32;
    mac_requested_paths: __u32;
    mac_downstream_port_type: __u32;
    mac_smt_address: packed array[0..FDDI_K_ALEN-1] of __u8;
    mac_t_req: __u32;
    mac_t_neg: __u32;
    mac_t_max: __u32;
    mac_tvx_value: __u32;
    mac_frame_cts: __u32;
    mac_copied_cts: __u32;
    mac_transmit_cts: __u32;
    mac_error_cts: __u32;
    mac_lost_cts: __u32;
    mac_frame_error_threshold: __u32;
    mac_frame_error_ratio: __u32;
    mac_rmt_state: __u32;
    mac_da_flag: __u32;
    mac_una_da_flag: __u32;
    mac_frame_error_flag: __u32;
    mac_ma_unitdata_available: __u32;
    mac_hardware_present: __u32;
    mac_ma_unitdata_enable: __u32;
    path_tvx_lower_bound: __u32;
    path_t_max_lower_bound: __u32;
    path_max_t_req: __u32;
    path_configuration: packed array[0..8-1] of __u32;
    port_my_type: packed array[0..2-1] of __u32;
    port_neighbor_type: packed array[0..2-1] of __u32;
    port_connection_policies: packed array[0..2-1] of __u32;
    port_mac_indicated: packed array[0..2-1] of __u32;
    port_current_path: packed array[0..2-1] of __u32;
    port_requested_paths: packed array[0..3*2-1] of __u8;
    port_mac_placement: packed array[0..2-1] of __u32;
    port_available_paths: packed array[0..2-1] of __u32;
    port_pmd_class: packed array[0..2-1] of __u32;
    port_connection_capabilities: packed array[0..2-1] of __u32;
    port_bs_flag: packed array[0..2-1] of __u32;
    port_lct_fail_cts: packed array[0..2-1] of __u32;
    port_ler_estimate: packed array[0..2-1] of __u32;
    port_lem_reject_cts: packed array[0..2-1] of __u32;
    port_lem_cts: packed array[0..2-1] of __u32;
    port_ler_cutoff: packed array[0..2-1] of __u32;
    port_ler_alarm: packed array[0..2-1] of __u32;
    port_connect_state: packed array[0..2-1] of __u32;
    port_pcm_state: packed array[0..2-1] of __u32;
    port_pc_withhold: packed array[0..2-1] of __u32;
    port_ler_flag: packed array[0..2-1] of __u32;
    port_hardware_present: packed array[0..2-1] of __u32;
  end;
  {$EXTERNALSYM fddi_statistics}

// Translated from linux/include/linux/if_slip.h

const
  SL_MODE_SLIP       = 0;
  {$EXTERNALSYM SL_MODE_SLIP}
  SL_MODE_CSLIP      = 1;
  {$EXTERNALSYM SL_MODE_CSLIP}
  SL_MODE_KISS       = 4;
  {$EXTERNALSYM SL_MODE_KISS}

  SL_OPT_SIXBIT      = 2;
  {$EXTERNALSYM SL_OPT_SIXBIT}
  SL_OPT_ADAPTIVE    = 8;
  {$EXTERNALSYM SL_OPT_ADAPTIVE}

{ VSV = ioctl for keepalive & outfill in SLIP driver }

  SIOCSKEEPALIVE = (SIOCDEVPRIVATE);     { Set keepalive timeout in sec }
  {$EXTERNALSYM SIOCSKEEPALIVE}
  SIOCGKEEPALIVE = (SIOCDEVPRIVATE+1);   { Get keepalive timeout }
  {$EXTERNALSYM SIOCGKEEPALIVE}
  SIOCSOUTFILL   = (SIOCDEVPRIVATE+2);   { Set outfill timeout }
  {$EXTERNALSYM SIOCSOUTFILL}
  SIOCGOUTFILL   = (SIOCDEVPRIVATE+3);   { Get outfill timeout }
  {$EXTERNALSYM SIOCGOUTFILL}
  SIOCSLEASE     = (SIOCDEVPRIVATE+4);   { Set "leased" line type }
  {$EXTERNALSYM SIOCSLEASE}
  SIOCGLEASE     = (SIOCDEVPRIVATE+5);   { Get line type }
  {$EXTERNALSYM SIOCGLEASE}


// Translated from linux/include/linux/if_tr.h

{ IEEE 802.5 Token-Ring magic constants.  The frame sizes omit the preamble
   and FCS/CRC (frame check sequence). }
const
  TR_ALEN      = 6;          { Octets in one ethernet addr }
  {$EXTERNALSYM TR_ALEN}
  AC           = $10;
  {$EXTERNALSYM AC}
  LLC_FRAME    = $40;
  {$EXTERNALSYM LLC_FRAME}


{ LLC and SNAP constants }
  EXTENDED_SAP = $AA;
  {$EXTERNALSYM EXTENDED_SAP}
  UI_CMD       = $03;
  {$EXTERNALSYM UI_CMD}

{ This is an Token-Ring frame header. }
type
  trh_hdr = {packed} record
    ac: __u8;      { access control field }
    fc: __u8;      { frame control field }
    daddr: packed array[0..TR_ALEN-1] of __u8;    { destination address }
    saddr: packed array[0..TR_ALEN-1] of __u8;    { source address }
    rcf: __u16;    { route control field }
    rseg: packed array[0..8-1] of __u16;	        { routing registers }
  end;
  {$EXTERNALSYM trh_hdr}

{ This is an Token-Ring LLC structure }
  trllc = {packed} record
    dsap: __u8;                              { destination SAP }
    ssap: __u8;                              { source SAP }
    llc: __u8;                               { LLC control field }
    protid: packed array[0..3-1] of __u8;	   { protocol id }
    ethertype: __u16;                        { ether type field }
  end;
  {$EXTERNALSYM trllc}

{ Token-Ring statistics collection data. }
  tr_statistics = {packed} record
    rx_packets: Cardinal;           { total packets received }
    tx_packets: Cardinal;           { total packets transmitted }
    rx_bytes: Cardinal;             { total bytes received }
    tx_bytes: Cardinal;             { total bytes transmitted }
    rx_errors: Cardinal;            { bad packets received }
    tx_errors: Cardinal;            { packet transmit problems }
    rx_dropped: Cardinal;           { no space in linux buffers }
    tx_dropped: Cardinal;           { no space available in linux }
    multicast: Cardinal;            { multicast packets received }
    transmit_collision: Cardinal;

  { detailed Token-Ring errors. See IBM Token-Ring Network
    Architecture for more info }

    line_errors: Cardinal;
    internal_errors: Cardinal;
    burst_errors: Cardinal;
    A_C_errors: Cardinal;
    abort_delimiters: Cardinal;
    lost_frames: Cardinal;
    recv_congest_count: Cardinal;
    frame_copied_errors: Cardinal;
    frequency_errors: Cardinal;
    token_errors: Cardinal;
    dummy1: Cardinal;
  end;
  {$EXTERNALSYM tr_statistics}

{ source routing stuff }

const
  TR_RII = $80;
  {$EXTERNALSYM TR_RII}
  TR_RCF_DIR_BIT = $80;
  {$EXTERNALSYM TR_RCF_DIR_BIT}
  TR_RCF_LEN_MASK = $1f00;
  {$EXTERNALSYM TR_RCF_LEN_MASK}
  TR_RCF_BROADCAST = $8000;         { all-routes broadcast }
  {$EXTERNALSYM TR_RCF_BROADCAST}
  TR_RCF_LIMITED_BROADCAST = $C000; { single-route broadcast }
  {$EXTERNALSYM TR_RCF_LIMITED_BROADCAST}
  TR_RCF_FRAME2K = $20;
  {$EXTERNALSYM TR_RCF_FRAME2K}
  TR_RCF_BROADCAST_MASK = $C000;
  {$EXTERNALSYM TR_RCF_BROADCAST_MASK}
  TR_MAXRIFLEN = 18;
  {$EXTERNALSYM TR_MAXRIFLEN}

const
  TR_HLEN      = (SizeOf(trh_hdr) + SizeOf(trllc));
  {$EXTERNALSYM TR_HLEN}

type
  trn_hdr = record
    trn_ac: __u8;                                       { access control field }
    trn_fc: __u8;                                       { field control field }
    trn_dhost: packed array [0 .. TR_ALEN - 1] of __u8; { destination host }
    trn_shost: packed array [0 .. TR_ALEN - 1] of __u8; { source host }
    trn_rcf: __u16;                                     { route control field }
    trn_rseg: packed array [0 .. 8 - 1] of __u16;       { routing registers }
  end;

// Translated from linux/include/linux/ppp_defs.h

const
{ The basic PPP frame. }
  PPP_HDRLEN = 4;      { octets for standard ppp header }
  {$EXTERNALSYM PPP_HDRLEN}
  PPP_FCSLEN = 2;      { octets for FCS }
  {$EXTERNALSYM PPP_FCSLEN}
  PPP_MRU    = 1500;   { default MRU = max length of info field }
  {$EXTERNALSYM PPP_MRU}

function PPP_ADDRESS(const p): __u8;
{$EXTERNALSYM PPP_ADDRESS}
function PPP_CONTROL(const p): __u8;
{$EXTERNALSYM PPP_CONTROL}
function PPP_PROTOCOL(const p): __u16;
{$EXTERNALSYM PPP_PROTOCOL}

const
{ Significant octet values. }
  PPP_ALLSTATIONS     = $ff;     { All-Stations broadcast address }
  {$EXTERNALSYM PPP_ALLSTATIONS}
  PPP_UI              = $03;     { Unnumbered Information }
  {$EXTERNALSYM PPP_UI}
  PPP_FLAG            = $7e;     { Flag Sequence }
  {$EXTERNALSYM PPP_FLAG}
  PPP_ESCAPE          = $7d;     { Asynchronous Control Escape }
  {$EXTERNALSYM PPP_ESCAPE}
  PPP_TRANS           = $20;     { Asynchronous transparency modifier }
  {$EXTERNALSYM PPP_TRANS}

{ Protocol field values. }
  PPP_IP              = $21;     { Internet Protocol }
  {$EXTERNALSYM PPP_IP}
  PPP_AT              = $29;     { AppleTalk Protocol }
  {$EXTERNALSYM PPP_AT}
  PPP_IPX             = $2b;     { IPX protocol }
  {$EXTERNALSYM PPP_IPX}
  PPP_VJC_COMP        = $2d;     { VJ compressed TCP }
  {$EXTERNALSYM PPP_VJC_COMP}
  PPP_VJC_UNCOMP      = $2f;     { VJ uncompressed TCP }
  {$EXTERNALSYM PPP_VJC_UNCOMP}
  PPP_MP              = $3d;     { Multilink protocol }
  {$EXTERNALSYM PPP_MP}
  PPP_IPV6            = $57;     { Internet Protocol Version 6 }
  {$EXTERNALSYM PPP_IPV6}
  PPP_COMPFRAG	      = $FB;     { fragment compressed below bundle }
  {$EXTERNALSYM PPP_COMPFRAG}
  PPP_COMP            = $FD;     { compressed packet }
  {$EXTERNALSYM PPP_COMP}
  PPP_MPLS_UC         = $0281;   { Multi Protocol Label Switching - Unicast }
  {$EXTERNALSYM PPP_MPLS_UC}
  PPP_MPLS_MC         = $0283;   { Multi Protocol Label Switching - Multicast }
  {$EXTERNALSYM PPP_MPLS_MC}
  PPP_IPCP            = $8021;   { IP Control Protocol }
  {$EXTERNALSYM PPP_IPCP}
  PPP_ATCP            = $8029;   { AppleTalk Control Protocol }
  {$EXTERNALSYM PPP_ATCP}
  PPP_IPXCP           = $802b;   { IPX Control Protocol }
  {$EXTERNALSYM PPP_IPXCP}
  PPP_IPV6CP          = $8057;   { IPv6 Control Protocol }
  {$EXTERNALSYM PPP_IPV6CP}
  PPP_CCPFRAG         = $80fb;   { CCP at link level (below MP bundle) }
  {$EXTERNALSYM PPP_CCPFRAG}
  PPP_CCP             = $80fd;   { Compression Control Protocol }
  {$EXTERNALSYM PPP_CCP}
  PPP_MPLSCP          = $80fd;   { MPLS Control Protocol }
  {$EXTERNALSYM PPP_MPLSCP}
  PPP_LCP             = $c021;   { Link Control Protocol }
  {$EXTERNALSYM PPP_LCP}
  PPP_PAP             = $c023;   { Password Authentication Protocol }
  {$EXTERNALSYM PPP_PAP}
  PPP_LQR             = $c025;   { Link Quality Report protocol }
  {$EXTERNALSYM PPP_LQR}
  PPP_CHAP            = $c223;   { Cryptographic Handshake Auth. Protocol }
  {$EXTERNALSYM PPP_CHAP}
  PPP_CBCP            = $c029;   { Callback Control Protocol }
  {$EXTERNALSYM PPP_CBCP}

{ Values for FCS calculations. }

  PPP_INITFCS         = $ffff;   { Initial FCS value }
  {$EXTERNALSYM PPP_INITFCS}
  PPP_GOODFCS         = $f0b8;   { Good final FCS value }
  {$EXTERNALSYM PPP_GOODFCS}

{ Extended asyncmap - allows any character to be escaped. }

type
  ext_accm = packed array[0..8-1] of __u32;
  {$EXTERNALSYM ext_accm}

{ What to do with network protocol (NP) packets. }
type
  NPmode = (
    NPMODE_PASS = 0,        { pass the packet through }
    {$EXTERNALSYM NPMODE_PASS}
    NPMODE_DROP = 1,        { silently drop the packet }
    {$EXTERNALSYM NPMODE_DROP}
    NPMODE_ERROR = 2,       { return an error }
    {$EXTERNALSYM NPMODE_ERROR}
    NPMODE_QUEUE = 3        { save it up for later. }
    {$EXTERNALSYM NPMODE_QUEUE}
  );
  {$EXTERNALSYM NPmode}

{ Statistics for LQRP and pppstats }
type
  pppstat = {packed} record
    ppp_discards: __u32;    { # frames discarded }

    ppp_ibytes: __u32;      { bytes received }
    ppp_ioctects: __u32;    { bytes received not in error }
    ppp_ipackets: __u32;    { packets received }
    ppp_ierrors: __u32;     { receive errors }
    ppp_ilqrs: __u32;       { # LQR frames received }
    ppp_obytes: __u32;      { raw bytes sent }
    ppp_ooctects: __u32;    { frame bytes sent }
    ppp_opackets: __u32;    { packets sent }
    ppp_oerrors: __u32;     { transmit errors }
    ppp_olqrs: __u32;       { # LQR frames sent }
  end;
  {$EXTERNALSYM pppstat}

  vjstat = {packed} record
    vjs_packets: __u32;        { outbound packets }
    vjs_compressed: __u32;     { outbound compressed packets }
    vjs_searches: __u32;       { searches for connection state }
    vjs_misses: __u32;         { times couldn't find conn. state }
    vjs_uncompressedin: __u32; { inbound uncompressed packets }
    vjs_compressedin: __u32;   { inbound compressed packets }
    vjs_errorin: __u32;        { inbound unknown type packets }
    vjs_tossed: __u32;         { inbound packets tossed because of error }
  end;
  {$EXTERNALSYM vjstat}

  compstat = {packed} record
    unc_bytes: __u32;       { total uncompressed bytes }
    unc_packets: __u32;     { total uncompressed packets }
    comp_bytes: __u32;      { compressed bytes }
    comp_packets: __u32;    { compressed packets }
    inc_bytes: __u32;       { incompressible bytes }
    inc_packets: __u32;     { incompressible packets }

        { the compression ratio is defined as in_count / bytes_out }
    in_count: __u32;        { Bytes received }
    bytes_out: __u32;       { Bytes transmitted }

    ratio: Double;          { not computed in kernel. }
  end;
  {$EXTERNALSYM compstat}

  ppp_stats = {packed} record
    p: pppstat;     { basic PPP statistics }
    vj: vjstat;     { VJ header compression statistics }
  end;
  {$EXTERNALSYM ppp_stats}

  ppp_comp_stats = {packed} record
    c: compstat;    { packet compression statistics }
    d: compstat;    { packet decompression statistics }
  end;
  {$EXTERNALSYM ppp_comp_stats}

{
 * The following structure records the time in seconds since
 * the last NP packet was sent or received.
 }
  __kernel_time_t = Longint; // From asm-i386/posix_types.h
  {$EXTERNALSYM __kernel_time_t}

  ppp_idle = {packed} record
    xmit_idle: __kernel_time_t;     { time since last NP packet sent }
    recv_idle: __kernel_time_t;     { time since last NP packet received }
  end;
  {$EXTERNALSYM ppp_idle}


// Translated from linux/include/linux/ppp-comp.h

const
{ CCP codes. }

  CCP_CONFREQ          = 1;
  {$EXTERNALSYM CCP_CONFREQ}
  CCP_CONFACK          = 2;
  {$EXTERNALSYM CCP_CONFACK}
  CCP_TERMREQ          = 5;
  {$EXTERNALSYM CCP_TERMREQ}
  CCP_TERMACK          = 6;
  {$EXTERNALSYM CCP_TERMACK}
  CCP_RESETREQ         = 14;
  {$EXTERNALSYM CCP_RESETREQ}
  CCP_RESETACK         = 15;
  {$EXTERNALSYM CCP_RESETACK}

{ Max # bytes for a CCP option }

  CCP_MAX_OPTION_LENGTH = 32;
  {$EXTERNALSYM CCP_MAX_OPTION_LENGTH}

{ Parts of a CCP packet. }

function CCP_CODE(dp: Pointer): Byte;
{$EXTERNALSYM CCP_CODE}
function CCP_ID(dp: Pointer): Byte;
{$EXTERNALSYM CCP_ID}
function CCP_LENGTH(dp: Pointer): Word;
{$EXTERNALSYM CCP_LENGTH}

const
  CCP_HDRLEN      = 4;
  {$EXTERNALSYM CCP_HDRLEN}

function CCP_OPT_CODE(dp: Pointer): Byte;
{$EXTERNALSYM CCP_OPT_CODE}
function CCP_OPT_LENGTH(dp: Pointer): Byte;
{$EXTERNALSYM CCP_OPT_LENGTH}

const
  CCP_OPT_MINLEN  = 2;
  {$EXTERNALSYM CCP_OPT_MINLEN}

{ Definitions for BSD-Compress. }

  CI_BSD_COMPRESS      = 21;      { config. option for BSD-Compress }
  {$EXTERNALSYM CI_BSD_COMPRESS}
  CILEN_BSD_COMPRESS   = 3;       { length of config. option }
  {$EXTERNALSYM CILEN_BSD_COMPRESS}

{ Macros for handling the 3rd byte of the BSD-Compress config option. }
function BSD_NBITS(x: Integer): Integer;       { number of bits requested }
{$EXTERNALSYM BSD_NBITS}
function BSD_VERSION(x: Integer): Integer;     { version of option format }
{$EXTERNALSYM BSD_VERSION}
function BSD_MAKE_OPT(v, n: Integer): Integer;
{$EXTERNALSYM BSD_MAKE_OPT}

const
  BSD_CURRENT_VERSION  = 1;        { current version number }
  {$EXTERNALSYM BSD_CURRENT_VERSION}

  BSD_MIN_BITS         = 9;        { smallest code size supported }
  {$EXTERNALSYM BSD_MIN_BITS}
  BSD_MAX_BITS         = 15;       { largest code size supported }
  {$EXTERNALSYM BSD_MAX_BITS}

{ Definitions for Deflate. }

  CI_DEFLATE           = 26;    { config option for Deflate }
  {$EXTERNALSYM CI_DEFLATE}
  CI_DEFLATE_DRAFT     = 24;    { value used in original draft RFC }
  {$EXTERNALSYM CI_DEFLATE_DRAFT}
  CILEN_DEFLATE        = 4;     { length of its config option }
  {$EXTERNALSYM CILEN_DEFLATE}

  DEFLATE_MIN_SIZE     = 9;
  {$EXTERNALSYM DEFLATE_MIN_SIZE}
  DEFLATE_MAX_SIZE     = 15;
  {$EXTERNALSYM DEFLATE_MAX_SIZE}
  DEFLATE_METHOD_VAL   = 8;
  {$EXTERNALSYM DEFLATE_METHOD_VAL}

function DEFLATE_SIZE(x: Integer): Integer;
  {$EXTERNALSYM DEFLATE_SIZE}
function DEFLATE_METHOD(x: Integer): Integer;
  {$EXTERNALSYM DEFLATE_METHOD}
function DEFLATE_MAKE_OPT(w: Integer): Integer;
  {$EXTERNALSYM DEFLATE_MAKE_OPT}

const
  DEFLATE_CHK_SEQUENCE = 0;
  {$EXTERNALSYM DEFLATE_CHK_SEQUENCE}

{ Definitions for MPPE. }

  CI_MPPE              = 18;     { config option for MPPE }
  {$EXTERNALSYM CI_MPPE}
  CILEN_MPPE           =  6;     { length of config option }
  {$EXTERNALSYM CILEN_MPPE}

{ Definitions for other, as yet unsupported, compression methods. }

  CI_PREDICTOR_1       = 1;    { config option for Predictor-1 }
  {$EXTERNALSYM CI_PREDICTOR_1}
  CILEN_PREDICTOR_1    = 2;    { length of its config option }
  {$EXTERNALSYM CILEN_PREDICTOR_1}
  CI_PREDICTOR_2       = 2;    { config option for Predictor-2 }
  {$EXTERNALSYM CI_PREDICTOR_2}
  CILEN_PREDICTOR_2    = 2;    { length of its config option }
  {$EXTERNALSYM CILEN_PREDICTOR_2}


// Translated from linux/include/linux/atalk.h

const
  ATPORT_FIRST       = 1;
  {$EXTERNALSYM ATPORT_FIRST}
  ATPORT_RESERVED    = 128;
  {$EXTERNALSYM ATPORT_RESERVED}
  ATPORT_LAST        = 254; { 254 is only legal on localtalk }
  {$EXTERNALSYM ATPORT_LAST}
  ATADDR_ANYNET      = __u16(0);
  {$EXTERNALSYM ATADDR_ANYNET}
  ATADDR_ANYNODE     = __u8(0);
  {$EXTERNALSYM ATADDR_ANYNODE}
  ATADDR_ANYPORT     = __u8(0);
  {$EXTERNALSYM ATADDR_ANYPORT}
  ATADDR_BCAST       = __u8(255);
  {$EXTERNALSYM ATADDR_BCAST}
  DDP_MAXSZ          = 587;
  {$EXTERNALSYM DDP_MAXSZ}
  DDP_MAXHOPS        = 15;      { 4 bits of hop counter }
  {$EXTERNALSYM DDP_MAXHOPS}

  SIOCATALKDIFADDR = (SIOCPROTOPRIVATE + 0);
  {$EXTERNALSYM SIOCATALKDIFADDR}

type
  atalk_addr = {packed} record
    s_net: __be16;
    s_node: __u8;
  end;
  {$EXTERNALSYM atalk_addr}

  __kernel_sa_family_t = sa_family_t;
  {$EXTERNALSYM sa_family_t}

  sockaddr_at = {packed} record
    sat_family: __kernel_sa_family_t;
    sat_port: __u8;
    sat_addr: atalk_addr;
    sat_zero: packed array[0..8-1] of Byte;
  end;
  {$EXTERNALSYM sockaddr_at}

  atalk_netrange = {packed} record
    nr_phase: __u8;
    nr_firstnet: __be16;
    nr_lastnet: __be16;
  end;
  {$EXTERNALSYM atalk_netrange}

// Translated from linux/include/linux/igmp.h

{ IGMP protocol structures }

{ Header in on cable format }

type
  igmphdr = {packed} record
    __type: __u8;
    code: __u8;     { For newer IGMP }
    csum: __sum16;
    group: __be32;
  end;
  {$EXTERNALSYM igmphdr}

const
  { V3 group record types [grec_type] }
  IGMPV3_MODE_IS_INCLUDE    = 1;
  {$EXTERNALSYM IGMPV3_MODE_IS_INCLUDE}
  IGMPV3_MODE_IS_EXCLUDE    = 2;
  {$EXTERNALSYM IGMPV3_MODE_IS_EXCLUDE}
  IGMPV3_CHANGE_TO_INCLUDE  = 3;
  {$EXTERNALSYM IGMPV3_CHANGE_TO_INCLUDE}
  IGMPV3_CHANGE_TO_EXCLUDE  = 4;
  {$EXTERNALSYM IGMPV3_CHANGE_TO_EXCLUDE}
  IGMPV3_ALLOW_NEW_SOURCES  = 5;
  {$EXTERNALSYM IGMPV3_ALLOW_NEW_SOURCES}
  IGMPV3_BLOCK_OLD_SOURCES  = 6;
  {$EXTERNALSYM IGMPV3_BLOCK_OLD_SOURCES}

type
  igmpv3_grec = record
    grec_type: __u8;
    grec_auxwords: __u8;
    grec_nsrcs: __be16;
    grec_mca: __be32;
    grec_src: packed array[0..0] of __be32;
  end;
  {$EXTERNALSYM igmpv3_grec}

  igmpv3_report = record
    __type: __u8;
    resv1: __u8;
    csum: __be16;
    resv2: __be16;
    ngrec: __be16;
    grec: packed array[0..0] of igmpv3_grec;
  end;
  {$EXTERNALSYM igmpv3_report}

  igmpv3_query = record
    __type: __u8;
    code: __u8;
    csum: __be16;
    group: __be32;
    __qrv3_suppress1: __u8;
(*
#if defined(__LITTLE_ENDIAN_BITFIELD)
  __u8 qrv:3,
       suppress:1,
       resv:4;
#elif defined(__BIG_ENDIAN_BITFIELD)
  __u8 resv:4,
       suppress:1,
       qrv:3;
#else
#error "Please fix <asm/byteorder.h>"
#endif
*)
    qqic: __u8;
    nsrcs: __be16;
    srcs: packed array[0..0] of __be32;
  end;
  {$EXTERNALSYM igmpv3_query}

const
  IGMP_HOST_MEMBERSHIP_QUERY      = $11;     { From RFC1112 }
  {$EXTERNALSYM IGMP_HOST_MEMBERSHIP_QUERY}
  IGMP_HOST_MEMBERSHIP_REPORT     = $12;     { Ditto }
  {$EXTERNALSYM IGMP_HOST_MEMBERSHIP_REPORT}
  IGMP_DVMRP                      = $13;     { DVMRP routing }
  {$EXTERNALSYM IGMP_DVMRP}
  IGMP_PIM                        = $14;     { PIM routing }
  {$EXTERNALSYM IGMP_PIM}
  IGMP_TRACE                      = $15;
  {$EXTERNALSYM IGMP_TRACE}
  IGMPV2_HOST_MEMBERSHIP_REPORT   = $16;     { V2 version of 0x12 }
  {$EXTERNALSYM IGMPV2_HOST_MEMBERSHIP_REPORT}
  IGMP_HOST_LEAVE_MESSAGE         = $17;
  {$EXTERNALSYM IGMP_HOST_LEAVE_MESSAGE}
  IGMPV3_HOST_MEMBERSHIP_REPORT   = $22;     { V3 version of 0x12 }
  {$EXTERNALSYM IGMPV3_HOST_MEMBERSHIP_REPORT}

  IGMP_MTRACE_RESP                = $1e;
  {$EXTERNALSYM IGMP_MTRACE_RESP}
  IGMP_MTRACE                     = $1f;
  {$EXTERNALSYM IGMP_MTRACE}


{ Use the BSD names for these for compatibility }

  IGMP_DELAYING_MEMBER  = $01;
  {$EXTERNALSYM IGMP_DELAYING_MEMBER}
  IGMP_IDLE_MEMBER      = $02;
  {$EXTERNALSYM IGMP_IDLE_MEMBER}
  IGMP_LAZY_MEMBER      = $03;
  {$EXTERNALSYM IGMP_LAZY_MEMBER}
  IGMP_SLEEPING_MEMBER  = $04;
  {$EXTERNALSYM IGMP_SLEEPING_MEMBER}
  IGMP_AWAKENING_MEMBER = $05;
  {$EXTERNALSYM IGMP_AWAKENING_MEMBER}

  IGMP_MINLEN = 8;
  {$EXTERNALSYM IGMP_MINLEN}

  IGMP_MAX_HOST_REPORT_DELAY = 10; { max delay for response to query (in seconds) }
  {$EXTERNALSYM IGMP_MAX_HOST_REPORT_DELAY}

  IGMP_TIMER_SCALE = 10; { denotes that the igmphdr->timer field specifies time in 10th of seconds }
  {$EXTERNALSYM IGMP_TIMER_SCALE}

  IGMP_AGE_THRESHOLD = 400; { If this host don't hear any IGMP V1
                              message in this period of time,
                              revert to IGMP v2 router. }
  {$EXTERNALSYM IGMP_AGE_THRESHOLD}

(* Cannot translate this - kernel dependency on libc
  IGMP_ALL_HOSTS = htonl($E0000001);
  IGMP_ALL_ROUTER  = htonl($E0000002);
  IGMPV3_ALL_MCR = htonl(0xE0000016);
  IGMP_LOCAL_GROUP = htonl($E0000000);
  IGMP_LOCAL_GROUP_MASK = htonl($FFFFFF00);
*)

// Translated from uapi\asm-generic\termbits.h

type
  cc_t = Byte;
  {$EXTERNALSYM cc_t}
  speed_t = __u32;
  {$EXTERNALSYM speed_t}
  tcflag_t = __u32;
  {$EXTERNALSYM tcflag_t}

const
  NCCS = 19;
  {$EXTERNALSYM NCCS}

type
  termios = record
    c_iflag: tcflag_t; { input mode flags }
    c_oflag: tcflag_t; { output mode flags }
    c_cflag: tcflag_t; { control mode flags }
    c_lflag: tcflag_t; { local mode flags }
    c_line: cc_t; { line discipline }
    c_cc: packed array [0 .. NCCS - 1] of cc_t; { control characters }
  end;
  {$EXTERNALSYM termios}

  termios2 = record
    c_iflag: tcflag_t; { input mode flags }
    c_oflag: tcflag_t; { output mode flags }
    c_cflag: tcflag_t; { control mode flags }
    c_lflag: tcflag_t; { local mode flags }
    c_line: cc_t; { line discipline }
    c_cc: packed array [0 .. NCCS - 1] of cc_t; { control characters }
    c_ispeed: speed_t; { input speed }
    c_ospeed: speed_t; { output speed }
  end;
  {$EXTERNALSYM termios2}

  ktermios = record
    c_iflag: tcflag_t; { input mode flags }
    c_oflag: tcflag_t; { output mode flags }
    c_cflag: tcflag_t; { control mode flags }
    c_lflag: tcflag_t; { local mode flags }
    c_line: cc_t; { line discipline }
    c_cc: packed array [0 .. NCCS - 1] of cc_t; { control characters }
    c_ispeed: speed_t; { input speed }
    c_ospeed: speed_t; { output speed }
  end;
  {$EXTERNALSYM ktermios}

const
  { c_cc characters }
  VINTR    = 0;
  {$EXTERNALSYM VINTR}
  VQUIT    = 1;
  {$EXTERNALSYM VQUIT}
  VERASE   = 2;
  {$EXTERNALSYM VERASE}
  VKILL    = 3;
  {$EXTERNALSYM VKILL}
  VEOF     = 4;
  {$EXTERNALSYM VEOF}
  VTIME    = 5;
  {$EXTERNALSYM VTIME}
  VMIN     = 6;
  {$EXTERNALSYM VMIN}
  VSWTC    = 7;
  {$EXTERNALSYM VSWTC}
  VSTART   = 8;
  {$EXTERNALSYM VSTART}
  VSTOP    = 9;
  {$EXTERNALSYM VSTOP}
  VSUSP    = 10;
  {$EXTERNALSYM VSUSP}
  VEOL     = 11;
  {$EXTERNALSYM VEOL}
  VREPRINT = 12;
  {$EXTERNALSYM VREPRINT}
  VDISCARD = 13;
  {$EXTERNALSYM VDISCARD}
  VWERASE  = 14;
  {$EXTERNALSYM VWERASE}
  VLNEXT   = 15;
  {$EXTERNALSYM VLNEXT}
  VEOL2    = 16;
  {$EXTERNALSYM VEOL2}

  { c_iflag bits }
  IGNBRK  = $0000001;
  {$EXTERNALSYM IGNBRK}
  BRKINT  = $0000002;
  {$EXTERNALSYM BRKINT}
  IGNPAR  = $0000004;
  {$EXTERNALSYM IGNPAR}
  PARMRK  = $0000010;
  {$EXTERNALSYM PARMRK}
  INPCK   = $0000020;
  {$EXTERNALSYM INPCK}
  ISTRIP  = $0000040;
  {$EXTERNALSYM ISTRIP}
  INLCR   = $0000100;
  {$EXTERNALSYM INLCR}
  IGNCR   = $0000200;
  {$EXTERNALSYM IGNCR}
  ICRNL   = $0000400;
  {$EXTERNALSYM ICRNL}
  IUCLC   = $0001000;
  {$EXTERNALSYM IUCLC}
  IXON    = $0002000;
  {$EXTERNALSYM IXON}
  IXANY   = $0004000;
  {$EXTERNALSYM IXANY}
  IXOFF   = $0010000;
  {$EXTERNALSYM IXOFF}
  IMAXBEL = $0020000;
  {$EXTERNALSYM IMAXBEL}
  IUTF8   = $0040000;
  {$EXTERNALSYM IUTF8}

  { c_oflag bits }
  OPOST  = $0000001;
  {$EXTERNALSYM OPOST}
  OLCUC  = $0000002;
  {$EXTERNALSYM OLCUC}
  ONLCR  = $0000004;
  {$EXTERNALSYM ONLCR}
  OCRNL  = $0000010;
  {$EXTERNALSYM OCRNL}
  ONOCR  = $0000020;
  {$EXTERNALSYM ONOCR}
  ONLRET = $0000040;
  {$EXTERNALSYM ONLRET}
  OFILL  = $0000100;
  {$EXTERNALSYM OFILL}
  OFDEL  = $0000200;
  {$EXTERNALSYM OFDEL}
  NLDLY  = $0000400;
  {$EXTERNALSYM NLDLY}
  NL0    = $0000000;
  {$EXTERNALSYM NL0}
  NL1    = $0000400;
  {$EXTERNALSYM NL1}
  CRDLY  = $0003000;
  {$EXTERNALSYM CRDLY}
  CR0    = $0000000;
  {$EXTERNALSYM CR0}
  CR1    = $0001000;
  {$EXTERNALSYM CR1}
  CR2    = $0002000;
  {$EXTERNALSYM CR2}
  CR3    = $0003000;
  {$EXTERNALSYM CR3}
  TABDLY = $0014000;
  {$EXTERNALSYM TABDLY}
  TAB0   = $0000000;
  {$EXTERNALSYM TAB0}
  TAB1   = $0004000;
  {$EXTERNALSYM TAB1}
  TAB2   = $0010000;
  {$EXTERNALSYM TAB2}
  TAB3   = $0014000;
  {$EXTERNALSYM TAB3}
  XTABS  = $0014000;
  {$EXTERNALSYM XTABS}
  BSDLY  = $0020000;
  {$EXTERNALSYM BSDLY}
  BS0    = $0000000;
  {$EXTERNALSYM BS0}
  BS1    = $0020000;
  {$EXTERNALSYM BS1}
  VTDLY  = $0040000;
  {$EXTERNALSYM VTDLY}
  VT0    = $0000000;
  {$EXTERNALSYM VT0}
  VT1    = $0040000;
  {$EXTERNALSYM VT1}
  FFDLY  = $0100000;
  {$EXTERNALSYM FFDLY}
  FF0    = $0000000;
  {$EXTERNALSYM FF0}
  FF1    = $0100000;
  {$EXTERNALSYM FF1}

  { c_cflag bit meaning }
  CBAUD    = $0010017;
  {$EXTERNALSYM CBAUD}
  B0       = $0000000; { hang up }
  {$EXTERNALSYM B0}
  B50      = $0000001;
  {$EXTERNALSYM B50}
  B75      = $0000002;
  {$EXTERNALSYM B75}
  B110     = $0000003;
  {$EXTERNALSYM B110}
  B134     = $0000004;
  {$EXTERNALSYM B134}
  B150     = $0000005;
  {$EXTERNALSYM B150}
  B200     = $0000006;
  {$EXTERNALSYM B200}
  B300     = $0000007;
  {$EXTERNALSYM B300}
  B600     = $0000010;
  {$EXTERNALSYM B600}
  B1200    = $0000011;
  {$EXTERNALSYM B1200}
  B1800    = $0000012;
  {$EXTERNALSYM B1800}
  B2400    = $0000013;
  {$EXTERNALSYM B2400}
  B4800    = $0000014;
  {$EXTERNALSYM B4800}
  B9600    = $0000015;
  {$EXTERNALSYM B9600}
  B19200   = $0000016;
  {$EXTERNALSYM B19200}
  B38400   = $0000017;
  {$EXTERNALSYM B38400}
  EXTA     = $B19200;
  {$EXTERNALSYM EXTA}
  EXTB     = $B38400;
  {$EXTERNALSYM EXTB}
  CSIZE    = $0000060;
  {$EXTERNALSYM CSIZE}
  CS5      = $0000000;
  {$EXTERNALSYM CS5}
  CS6      = $0000020;
  {$EXTERNALSYM CS6}
  CS7      = $0000040;
  {$EXTERNALSYM CS7}
  CS8      = $0000060;
  {$EXTERNALSYM CS8}
  CSTOPB   = $0000100;
  {$EXTERNALSYM CSTOPB}
  CREAD    = $0000200;
  {$EXTERNALSYM CREAD}
  PARENB   = $0000400;
  {$EXTERNALSYM PARENB}
  PARODD   = $0001000;
  {$EXTERNALSYM PARODD}
  HUPCL    = $0002000;
  {$EXTERNALSYM HUPCL}
  CLOCAL   = $0004000;
  {$EXTERNALSYM CLOCAL}
  CBAUDEX  = $0010000;
  {$EXTERNALSYM CBAUDEX}
  BOTHER   = $0010000;
  {$EXTERNALSYM BOTHER}
  B57600   = $0010001;
  {$EXTERNALSYM B57600}
  B115200  = $0010002;
  {$EXTERNALSYM B115200}
  B230400  = $0010003;
  {$EXTERNALSYM B230400}
  B460800  = $0010004;
  {$EXTERNALSYM B460800}
  B500000  = $0010005;
  {$EXTERNALSYM B500000}
  B576000  = $0010006;
  {$EXTERNALSYM B576000}
  B921600  = $0010007;
  {$EXTERNALSYM B921600}
  B1000000 = $0010010;
  {$EXTERNALSYM B1000000}
  B1152000 = $0010011;
  {$EXTERNALSYM B1152000}
  B1500000 = $0010012;
  {$EXTERNALSYM B1500000}
  B2000000 = $0010013;
  {$EXTERNALSYM B2000000}
  B2500000 = $0010014;
  {$EXTERNALSYM B2500000}
  B3000000 = $0010015;
  {$EXTERNALSYM B3000000}
  B3500000 = $0010016;
  {$EXTERNALSYM B3500000}
  B4000000 = $0010017;
  {$EXTERNALSYM B4000000}
  CIBAUD   = $002003600000; { input baud rate }
  {$EXTERNALSYM CIBAUD}
  CMSPAR   = $010000000000; { mark or space (stick) parity }
  {$EXTERNALSYM CMSPAR}
  CRTSCTS  = $020000000000; { flow control }
  {$EXTERNALSYM CRTSCTS}
  IBSHIFT  = 16; { Shift from CBAUD to CIBAUD }
  {$EXTERNALSYM IBSHIFT}

  { c_lflag bits }
  ISIG    = $0000001;
  {$EXTERNALSYM ISIG}
  ICANON  = $0000002;
  {$EXTERNALSYM ICANON}
  XCASE   = $0000004;
  {$EXTERNALSYM XCASE}
  ECHO    = $0000010;
  {$EXTERNALSYM ECHO}
  ECHOE   = $0000020;
  {$EXTERNALSYM ECHOE}
  ECHOK   = $0000040;
  {$EXTERNALSYM ECHOK}
  ECHONL  = $0000100;
  {$EXTERNALSYM ECHONL}
  NOFLSH  = $0000200;
  {$EXTERNALSYM NOFLSH}
  TOSTOP  = $0000400;
  {$EXTERNALSYM TOSTOP}
  ECHOCTL = $0001000;
  {$EXTERNALSYM ECHOCTL}
  ECHOPRT = $0002000;
  {$EXTERNALSYM ECHOPRT}
  ECHOKE  = $0004000;
  {$EXTERNALSYM ECHOKE}
  FLUSHO  = $0010000;
  {$EXTERNALSYM FLUSHO}
  PENDIN  = $0040000;
  {$EXTERNALSYM PENDIN}
  IEXTEN  = $0100000;
  {$EXTERNALSYM IEXTEN}
  EXTPROC = $0200000;
  {$EXTERNALSYM EXTPROC}

  { tcflow() and TCXONC use these }
  TCOOFF = 0;
  {$EXTERNALSYM TCOOFF}
  TCOON  = 1;
  {$EXTERNALSYM TCOON}
  TCIOFF = 2;
  {$EXTERNALSYM TCIOFF}
  TCION  = 3;
  {$EXTERNALSYM TCION}

  { tcflush() and TCFLSH use these }
  TCIFLUSH  = 0;
  {$EXTERNALSYM TCIFLUSH}
  TCOFLUSH  = 1;
  {$EXTERNALSYM TCOFLUSH}
  TCIOFLUSH = 2;
  {$EXTERNALSYM TCIOFLUSH}

  { tcsetattr uses these }
  TCSANOW   = 0;
  {$EXTERNALSYM TCSANOW}
  TCSADRAIN = 1;
  {$EXTERNALSYM TCSADRAIN}
  TCSAFLUSH = 2;
  {$EXTERNALSYM TCSAFLUSH}

implementation

// Macros for ppp_defs.h

type
  P__u8 = ^__u8;

function PPP_ADDRESS(const p): __u8;
begin
  Result := P__u8(@p)^;
end;

function PPP_CONTROL(const p): __u8;
begin
  Result := P__u8(Cardinal(@p) + SizeOf(__u8))^;
end;

function PPP_PROTOCOL(const p): __u16;
begin
  Result := P__u8(Cardinal(@p) + SizeOf(__u8)*2)^ shl 8;
  Result := Result + P__u8(Cardinal(@p) + SizeOf(__u8)*3)^
end;

// Macros for ppp_comp.h

function CCP_CODE(dp: Pointer): Byte;
begin
  Result := PByte(dp)^;
end;

function CCP_ID(dp: Pointer): Byte;
begin
  Inc(PByte(dp));
  Result := PByte(dp)^;
end;

function CCP_LENGTH(dp: Pointer): Word;
begin
  Inc(PByte(dp), 2);
  Result := (PByte(dp)^ shl 8);

  Inc(PByte(dp), 1);
  Result := Result + PByte(dp)^;
end;

function CCP_OPT_CODE(dp: Pointer): Byte;
begin
  Result := PByte(dp)^;
end;

function CCP_OPT_LENGTH(dp: Pointer): Byte;
begin
  Inc(PByte(dp));
  Result := PByte(dp)^;
end;

function DEFLATE_SIZE(x: Integer): Integer;
begin
  Result := (Cardinal(x) shr 4) + 8;
end;

function DEFLATE_METHOD(x: Integer): Integer;
begin
  Result := x and $0F;
end;

function DEFLATE_MAKE_OPT(w: Integer): Integer;
begin
  Result := ((w - 8) shl 4) + DEFLATE_METHOD_VAL;
end;

function BSD_NBITS(x: Integer): Integer;
begin
  Result := (x and $1F);
end;

function BSD_VERSION(x: Integer): Integer;
begin
  Result := Cardinal(x) shr 5;
end;

function BSD_MAKE_OPT(v, n: Integer): Integer;
begin
  Result :=  Integer((Cardinal(v) shl 5) or Cardinal(n));
end;


end.
