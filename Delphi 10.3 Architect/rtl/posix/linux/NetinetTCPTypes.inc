{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
  TCP_NODELAY               = $01;
  {$EXTERNALSYM TCP_NODELAY}
  TCP_MAXSEG                = 2;            // Limit MSS
  {$EXTERNALSYM TCP_MAXSEG}
  TCP_CORK                  = 3 platform;   // Never send partially complete segments
  {$EXTERNALSYM TCP_CORK}
  TCP_KEEPIDLE              = 4 platform;   // Start keeplives after this period
  {$EXTERNALSYM TCP_KEEPIDLE}
  TCP_KEEPINTVL             = 5 platform;   // Interval between keepalives
  {$EXTERNALSYM TCP_KEEPINTVL}
  TCP_KEEPCNT               = 6 platform;   // Number of keepalives before death
  {$EXTERNALSYM TCP_KEEPCNT}
  TCP_SYNCNT                = 7 platform;   // Number of SYN retransmits
  {$EXTERNALSYM TCP_SYNCNT}
  TCP_LINGER2               = 8 platform;   // Life time of orphaned FIN-WAIT-2 state
  {$EXTERNALSYM TCP_LINGER2}
  TCP_DEFER_ACCEPT          = 9 platform;   // Wake up listener only when data arrive
  {$EXTERNALSYM TCP_DEFER_ACCEPT}
  TCP_WINDOW_CLAMP          = 10 platform;  // Bound advertised window
  {$EXTERNALSYM TCP_WINDOW_CLAMP}
  TCP_INFO                  = 11 platform;  // Information about this connection.
  {$EXTERNALSYM TCP_WINDOW_CLAMP}
  TCP_QUICKACK              = 12 platform;  // Block/reenable quick acks
  {$EXTERNALSYM TCP_QUICKACK}
  TCP_CONGESTION            = 13 platform;  // Congestion control algorithm
  {$EXTERNALSYM TCP_CONGESTION}
  TCP_MD5SIG                = 14 platform;  // TCP MD5 Signature (RFC2385)
  {$EXTERNALSYM TCP_MD5SIG}
  TCP_COOKIE_TRANSACTIONS   = 15 platform;  // TCP Cookie Transactions
  {$EXTERNALSYM TCP_COOKIE_TRANSACTIONS}
  TCP_THIN_LINEAR_TIMEOUTS  = 16 platform;  // Use linear timeouts for thin streams
  {$EXTERNALSYM TCP_THIN_LINEAR_TIMEOUTS}
  TCP_THIN_DUPACK           = 17 platform;  // Fast retrans. after 1 dupack
  {$EXTERNALSYM TCP_THIN_DUPACK}

  TCPI_OPT_TIMESTAMPS	  = 1;
  {$EXTERNALSYM TCPI_OPT_TIMESTAMPS}
  TCPI_OPT_SACK	        = 2;
  {$EXTERNALSYM TCPI_OPT_SACK}
  TCPI_OPT_WSCALE	      = 4;
  {$EXTERNALSYM TCPI_OPT_WSCALE}
  TCPI_OPT_ECN	        = 8;
  {$EXTERNALSYM TCPI_OPT_ECN}

