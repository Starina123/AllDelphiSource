{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
   // UDP socket options
  UDP_CORK  = 1;    // Never send partially complete segments
  {$EXTERNALSYM UDP_CORK}
  UDP_ENCAP = 100;  // Set the socket to accept encapsulated packets
  {$EXTERNALSYM UDP_ENCAP}

  // UDP encapsulation types
  UDP_ENCAP_ESPINUDP_NON_IKE  = 1; // draft-ietf-ipsec-nat-t-ike-00/01
  {$EXTERNALSYM UDP_ENCAP_ESPINUDP_NON_IKE}
  UDP_ENCAP_ESPINUDP          = 2; // draft-ietf-ipsec-udp-encaps-06
  {$EXTERNALSYM UDP_ENCAP_ESPINUDP}


