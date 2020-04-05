{*******************************************************}
{                                                       }
{           Delphi Indy Abstraction Framework           }
{                                                       }
{ Copyright(c) 1995-2010 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit IPPeerResStrs;

interface

resourcestring
  sIPProcsNotDefined = 'IPProcs is not defined.  Make sure IndyPeerImpl (or an alternative IP Implementation unit) is in the uses clause';
  sIPProcNotSupported = 'Registered IPProc peer does not implement the IIPPeerProcs interface.  Make sure IndyPeerImpl (or an alternative IP Implementation unit) is in the uses clause';
  sIPPeerNotRegisteredDefault = 'No peer with the interface with guid %s has been registered. Make sure IndyPeerImpl is in the uses clause';
  sIPPeerNotRegisteredId = 'No peer with the interface with guid %s has been registered with the current implementation (%s)';
  sPeerCreationFailed = 'Unable to create Peer for: %s using the implementation %s.  Check to make sure the peer class is registered and that it implements the correct interface';
  sPeerReservedID = 'Cannot use the reserved implementationID "%s"';

implementation

end.

